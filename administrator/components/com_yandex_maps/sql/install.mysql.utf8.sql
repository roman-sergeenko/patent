CREATE TABLE IF NOT EXISTS `#__yandex_maps_maps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Название',
  `description` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT  'Описание',
  `alias` varchar(255) DEFAULT NULL COMMENT 'Псевдоним',
  `lat` decimal(18,14) NOT NULL COMMENT 'Широта',
  `lan` decimal(18,14) NOT NULL COMMENT 'Долгота',
  `zoom` int(10) unsigned NOT NULL DEFAULT '10' COMMENT 'Масштаб карты',
  `maxZoom` SMALLINT UNSIGNED NOT NULL DEFAULT  '23' COMMENT  'Максимальный масштаб',
  `minZoom` SMALLINT UNSIGNED NOT NULL DEFAULT  '0' COMMENT  'минимальный масштаб',
  `type` varchar(50) NOT NULL DEFAULT 'yandex#map' COMMENT 'Тип карты',
  `width` varchar(20) NOT NULL DEFAULT 'auto' COMMENT 'Ширина карты',
  `height` varchar(20) NOT NULL DEFAULT '450px' COMMENT 'Высота карты',
  `behaviors` text COMMENT 'Behabviors',
  `controls` text NOT NULL COMMENT 'Элементы управления',
  `created_time` int(10) unsigned NOT NULL COMMENT 'Дата создания',
  `modified_time` int(10) unsigned NOT NULL COMMENT 'Дата редоктирования',
  `ordering` INT NOT NULL DEFAULT  '0' COMMENT  'Сортировка',
  `create_by` INT UNSIGNED NOT NULL COMMENT  'Автор',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `params` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT  'Настройки',
  PRIMARY KEY (`id`),
  KEY `ordering` (`ordering`),
  KEY `create_by` (`create_by`)
)  CHARACTER SET=utf8;
CREATE TABLE IF NOT EXISTS `#__yandex_maps_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` VARCHAR( 256 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT  'Название',
  `alias` VARCHAR( 256 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT  'Псевдоним',
  `description` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT  'Описание',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT 'Категория',
  `howtocenter` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Как центровать',
  `lat` decimal(18,14) DEFAULT NULL COMMENT 'Широта',
  `lan` decimal(18,14) DEFAULT NULL COMMENT 'Долгота',
  `zoom` int(10) unsigned DEFAULT NULL COMMENT 'Высота',
  `created_time` int(10) unsigned NOT NULL COMMENT 'Дата создания',
  `modified_time` int(10) unsigned NOT NULL COMMENT 'Дата редоктирования',
  `ordering` INT NOT NULL DEFAULT  '0' COMMENT  'Сортировка',
  `create_by` INT UNSIGNED NOT NULL COMMENT  'Автор',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Включен',
  `params` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT  'Настройки',
  PRIMARY KEY (`id`),
  KEY `lat` (`lat`),
  KEY `lan` (`lan`),
  KEY `active` (`active`),
  KEY `ordering` (`ordering`),
  KEY `create_by` (`create_by`)
)  CHARACTER SET=utf8;
CREATE TABLE IF NOT EXISTS `#__yandex_maps_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(256)  CHARACTER SET utf8 COLLATE utf8_general_ci  NULL COMMENT 'Название',
  `alias` varchar(256)  CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT 'Псевдоним',
  `description` text  CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT 'Описание',
  `type` enum('placemark','circle','polygon','polyline') NOT NULL DEFAULT 'placemark' COMMENT 'Тип объекта',
  `lat` decimal(18,14) DEFAULT NULL COMMENT 'Широта по умолчанию',
  `lan` decimal(18,14) DEFAULT NULL COMMENT 'Долгота по умолчанию',
  `zoom` int(11) NOT NULL DEFAULT '10' COMMENT 'Высота',
  `created_time` int(10) unsigned NOT NULL COMMENT 'Дата создания',
  `modified_time` int(10) unsigned NOT NULL COMMENT 'Дата редоктирования',
  `coordinates` text,
  `options` text,
  `properties` text,
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'Сортировка',
  `create_by` int(10) unsigned NOT NULL COMMENT 'Автор',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Включен',
  `params` text NOT NULL COMMENT 'Настройки',
  `metadata` text COMMENT 'Meta информация',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Дата начала публикации',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Дата конца публикации',
  PRIMARY KEY (`id`),
  KEY `lat` (`lat`),
  KEY `lan` (`lan`),
  KEY `active` (`active`),
  KEY `ordering` (`ordering`),
  KEY `create_by` (`create_by`),
  KEY `publish_up` (`publish_up`),
  KEY `publish_down` (`publish_down`)
)  CHARACTER SET=utf8;
CREATE TABLE IF NOT EXISTS `#__yandex_maps_organizations` (
  `organization_object_id` int(10) unsigned NOT NULL COMMENT 'ID объекта',
  `organization_name` varchar(255) DEFAULT NULL COMMENT 'Название огранизаии',
  `organization_form` varchar(10) DEFAULT NULL COMMENT 'Форма организации: ООО, ЗАО и т.д.',
  `organization_lider_fio` varchar(255) DEFAULT NULL COMMENT 'ФИО руководителя',
  `organization_lider_position` varchar(255) DEFAULT NULL COMMENT 'Должность руководителя',
  `organization_acting_basis` tinyint(1) DEFAULT NULL COMMENT ' Действует на основании',
  `organization_acting_basis_date` int(11) DEFAULT NULL COMMENT 'Дата доверенности',
  `organization_acting_basis_number` varchar(50) DEFAULT NULL COMMENT 'Номер доверенности',
  `organization_type` varchar(50) DEFAULT NULL COMMENT 'Тип организации',
  `organization_trademark` varchar(255) DEFAULT NULL COMMENT 'Торговая марка',
  `organization_contact_fio` varchar(255) DEFAULT NULL COMMENT 'ФИО контактного лица',
  `organization_contact_position` varchar(60) DEFAULT NULL COMMENT 'Должность контактного лица',
  `organization_contact_phone` varchar(50) DEFAULT NULL COMMENT 'Номер телефона контактного лица',
  `organization_address_legal` text COMMENT 'Адрес юридический',
  `organization_address` text COMMENT 'Адрес фактический',
  `organization_phone` varchar(50) DEFAULT NULL COMMENT 'Телефон для справок',
  `organization_email` varchar(50) DEFAULT NULL COMMENT 'Электронный адрес',
  `organization_website` varchar(100) DEFAULT NULL COMMENT 'Вебсайт',
  `organization_image` varchar(50) DEFAULT NULL COMMENT 'Логотип',
  `organization_shedule_24` tinyint(1) DEFAULT '0' COMMENT 'Круглосуточно',
  `organization_shedule_days` varchar(20) DEFAULT NULL COMMENT 'Дни работы',
  `organization_start_in` tinyint(2) DEFAULT NULL COMMENT 'Начало работы в выходные',
  `organization_end_in` tinyint(2) DEFAULT NULL COMMENT 'Конец работы в выходные',
  `organization_service_delivery` tinyint(1) DEFAULT NULL COMMENT 'Услуги по доставке',
  `organization_service_delivery_variants` tinyint(1) DEFAULT NULL COMMENT 'доставка по городу/ доставка по России',
  `organization_license_number` varchar(50) DEFAULT NULL COMMENT 'Номер лицензии',
  `organization_license_date` int(11) DEFAULT NULL COMMENT 'Дата выдачи лицензии',
  `organization_bank_inn` varchar(50) DEFAULT NULL COMMENT 'ИНН банка',
  `organization_bank_kpp` varchar(50) DEFAULT NULL COMMENT 'КПП банка',
  `organization_bank_rs` varchar(50) DEFAULT NULL COMMENT 'Р/С банка',
  `organization_bank_name` varchar(255) DEFAULT NULL COMMENT 'Название банка',
  `organization_bank_ks` varchar(50) DEFAULT NULL COMMENT 'К/С банка',
  `organization_bank_bik` varchar(50) DEFAULT NULL COMMENT 'БИК банка',
  `organization_info` text COMMENT 'Дополнительная информация',
  PRIMARY KEY (`organization_object_id`)
) DEFAULT CHARSET=utf8 COMMENT='Организации';
CREATE TABLE IF NOT EXISTS `#__yandex_maps_category_to_map` (
`id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`category_id` INT UNSIGNED NOT NULL COMMENT  'ID Категории',
`map_id` INT UNSIGNED NOT NULL COMMENT  'ID карты',
INDEX (  `category_id` ,  `map_id` )
);
CREATE TABLE IF NOT EXISTS  `#__yandex_maps_object_to_category` (
 `id` BIGINT( 20 ) NOT NULL AUTO_INCREMENT ,
 `object_id` INT( 10 ) UNSIGNED NOT NULL COMMENT  'ID Объекта',
 `category_id` INT( 10 ) UNSIGNED NOT NULL COMMENT  'ID Категории',
PRIMARY KEY (  `id` ) ,
KEY  `object_id` (  `object_id` ,  `category_id` )
);

