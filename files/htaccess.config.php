<?php

$CONFIG = array(
/**
 * To have clean URLs without `/index.php` this parameter needs to be configured.
 *
 * This parameter will be written as "RewriteBase" on update and installation of
 * ownCloud to your `.htaccess` file. While this value is often simply the URL
 * path of the ownCloud installation it cannot be set automatically properly in
 * every scenario and needs thus some manual configuration.
 *
 * In a standard Apache setup this usually equals the folder that ownCloud is
 * accessible at. So if ownCloud is accessible via "https://mycloud.org/owncloud"
 * the correct value would most likely be "/owncloud". If ownCloud is running
 * under "https://mycloud.org/" then it would be "/".
 *
 * Note that above rule is not valid in every case, there are some rare setup
 * cases where this may not apply. However, to avoid any update problems this
 * configuration value is explicitly opt-in.
 *
 * After setting this value run `occ maintenance:update:htaccess` and when following
 * conditions are met ownCloud uses URLs without index.php in it:
 *
 * - `mod_rewrite` is installed
 * - `mod_env` is installed
 */
'htaccess.RewriteBase' => '/',

)
