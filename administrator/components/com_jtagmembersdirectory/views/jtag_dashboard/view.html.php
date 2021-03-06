<?php
/*------------------------------------------------------------------------
# com_joomlatag_members_directory � Jtag Members Directory
# ------------------------------------------------------------------------
# author    Joomlatag.com
# copyright Copyright (C) 2011 Joomlatag. All Rights Reserved.
# Websites  http://www.joomlatag.com
# Support   http://www.joomlatag.com/Forum/
# @version  2.0
# @license  http://www.joomlatag.com/Different-articles/software-license.html
-------------------------------------------------------------------------*/

defined('_JEXEC') or die('Restricted access');
if(!defined('DS')){
   define('DS',DIRECTORY_SEPARATOR);
}
jimport('joomla.application.component.view');

class jtagmemberdirectoryViewjtag_dashboard extends JViewLegacy
{
  function display($tpl = null)
  {    
	 JFactory::getDocument()->addStyleSheet(JURI::root().'administrator/components/'.JRequest::getVar('option').'/assets/css/jtag_dashboard.css');
     // require_once(JPATH_COMPONENT.DS.'models'.DS.'dashbord.php');
	 // $categoryModel= new JtagMemberDirectoryModelCategory();

     // $model = & $this->getModel();
     // $categories = $model->getData();
	  $this->assignRef('changelog', $this->jtag_readchangelog());
	  $this->assignRef('feed', $this->jtag_reed_feed());
	 
	 parent::display($tpl);
  }
function jtag_readchangelog()
{
  $path = JPATH_COMPONENT . DS . 'changelog';
  return file_exists($path) ? nl2br(file_get_contents($path)) : 'No changelog file found for this extension.';
}

function jtag_reed_feed()
{
  $feed = simplexml_load_file('http://search.twitter.com/search.atom?q=+from:joomladancer');
  
  $entries = array();
  foreach ($feed as $entry)
  {
    if ($entry->title)
    {
      $entries[] = $entry;
    }
  }
  return $entries;
}

}
