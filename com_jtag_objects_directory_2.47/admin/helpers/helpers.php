<?php
/**
 * @package     JTAG Help Desk
 * @subpackage  Components
 * ------------------------------------------------------------------------
 * @author      JoomlaTag.com
 * @copyright   Copyright (C) 2011 Joomla Tag. All Rights Reserved.
 * @link        http://www.joomlatag.com
 * @license     GNU/GPL
*/

// No direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
if(!defined('DS')){
   define('DS',DIRECTORY_SEPARATOR);
}
require_once dirname ( __FILE__ ).DS.'_helper.php';

class JtagHelpdeskHelper extends JtagHelper {

  public static function ipToInt($ip) {
    $parse = explode ( '.', $ip );
    if ( sizeof ( $parse ) < 4 ) return 0;

    $int = 0;
    $c = 0;
    for ( $i = 4; $i > 0; $i++ ) {
      $node = $parse[$c];
    }
  }

  public static function setToolbar($section, $title = null, $titleIcon = null) {
    $task = JRequest::getVar('task');
    $manageTasks = array ( 'edit', 'new', 'save' );

    // add css containing toolbar icons
   // JHTML::_('stylesheet', 'admin.css', 'administrator/components/com_jtaghelpdesk/assets/css/');

    // always put page properties, unless editing or a adding an element
    if ( !in_array ( $task, $manageTasks )) {
      JToolBarHelper::preferences('com_jtaghelpdesk');
      JToolBarHelper::divider();
    }

    switch($section) {
      case "form":
        if ( $title ) {
          JToolBarHelper::title($title, $titleIcon);
        }
        
        JToolBarHelper::apply('saveForm');
        JToolBarHelper::save('saveFormAndClose');
        JToolBarHelper::save2new('saveFormAndNew');
        JToolBarHelper::divider();
        JToolBarHelper::cancel('cancel');
        JToolBarHelper::divider();
        break;

      case "categories":
        JToolBarHelper::title(JText::_('JTHD_ADMIN_MANAGE_CATEGORIES'), 'jthdcategories');
        JToolBarHelper::addNew('add');
        JToolBarHelper::editList('edit');
        JToolBarHelper::divider();
        JToolBarHelper::deleteList(JText::_('JTHD_ADMIN_CONFIRM_DELETE_CATEGORIES'), 'delete');
        break;

     
    }
  }
  
}
