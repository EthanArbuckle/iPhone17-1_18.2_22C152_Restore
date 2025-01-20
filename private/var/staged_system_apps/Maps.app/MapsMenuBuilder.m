@interface MapsMenuBuilder
+ (id)addMenu;
+ (id)applicationMenu;
+ (id)currentLocationSubMenu;
+ (id)debugMenu;
+ (id)disabledAddMenu;
+ (id)dropPinKeyCommand;
+ (id)editMenu;
+ (id)fileMenuEnd;
+ (id)fileMenuStart;
+ (id)filePrintKeyCommand;
+ (id)findSubMenu;
+ (id)mapModeSubMenu;
+ (id)mapModeSubMenuCommands;
+ (id)performanceTestsMenu;
+ (id)preferencesMenuCommand;
+ (id)sendToDeviceAndShareMenuWithSendToDeviceEnabled:(BOOL)a3;
+ (id)undoRedoMenu;
+ (id)userProfileMenu;
+ (id)visibleAttributesSubMenu;
+ (id)zoomSubMenu;
+ (id)zoomSubMenuCommands;
+ (void)buildMenuWithBuilder:(id)a3 sendToDeviceEnabled:(BOOL)a4;
@end

@implementation MapsMenuBuilder

+ (void)buildMenuWithBuilder:(id)a3 sendToDeviceEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v22 = a3;
  v5 = +[UIScreen mainScreen];
  uint64_t v6 = sub_1000BBB44(v5);

  if (v6 == 5) {
    [v22 replaceChildrenOfMenuForIdentifier:UIMenuPreferences fromChildrenBlock:&stru_1012F4778];
  }
  v7 = +[MapsMenuBuilder applicationMenu];
  v8 = [v7 children];
  id v9 = [v8 count];

  if (v9) {
    [v22 insertSiblingMenu:v7 afterMenuForIdentifier:UIMenuPreferences];
  }
  v10 = +[MapsMenuBuilder userProfileMenu];
  [v22 insertSiblingMenu:v10 afterMenuForIdentifier:UIMenuPreferences];

  [v22 removeMenuForIdentifier:UIMenuNewScene];
  [v22 removeMenuForIdentifier:UIMenuOpenRecent];
  [v22 removeMenuForIdentifier:UIMenuPrint];
  v11 = +[MapsMenuBuilder fileMenuStart];
  [v22 insertChildMenu:v11 atStartOfMenuForIdentifier:UIMenuFile];

  v12 = +[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:v4];
  [v22 insertSiblingMenu:v12 afterMenuForIdentifier:UIMenuClose];

  v13 = +[MapsMenuBuilder fileMenuEnd];
  [v22 insertSiblingMenu:v13 afterMenuForIdentifier:@"SendToDeviceAndShareSubMenuIdentifier"];

  v14 = +[MapsMenuBuilder editMenu];
  [v22 insertSiblingMenu:v14 afterMenuForIdentifier:UIMenuStandardEdit];

  v15 = +[MapsMenuBuilder findSubMenu];
  [v22 replaceMenuForIdentifier:UIMenuFind withMenu:v15];

  [v22 removeMenuForIdentifier:UIMenuSubstitutions];
  [v22 removeMenuForIdentifier:UIMenuTransformations];
  [v22 removeMenuForIdentifier:UIMenuUndoRedo];
  v16 = +[MapsMenuBuilder undoRedoMenu];
  [v22 insertChildMenu:v16 atStartOfMenuForIdentifier:UIMenuEdit];

  [v22 removeMenuForIdentifier:UIMenuFormat];
  [v22 removeMenuForIdentifier:UIMenuToolbar];
  [v22 removeMenuForIdentifier:UIMenuTextSize];
  v17 = +[MapsMenuBuilder mapModeSubMenu];
  [v22 insertChildMenu:v17 atStartOfMenuForIdentifier:UIMenuView];

  v18 = +[MapsMenuBuilder visibleAttributesSubMenu];
  [v22 insertSiblingMenu:v18 afterMenuForIdentifier:@"MapModeSubMenuIdentifier"];

  v19 = +[MapsMenuBuilder zoomSubMenu];
  [v22 insertSiblingMenu:v19 afterMenuForIdentifier:@"VisibleAttributesSubMenuIdentifier"];

  v20 = +[MapsMenuBuilder currentLocationSubMenu];
  [v22 insertSiblingMenu:v20 afterMenuForIdentifier:@"ZoomSubMenuIdentifier"];

  if (sub_100568D90())
  {
    v21 = +[MapsMenuBuilder debugMenu];
    [v22 insertSiblingMenu:v21 afterMenuForIdentifier:UIMenuHelp];
  }
}

+ (id)preferencesMenuCommand
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Menu] Settings…" value:@"localized string not found" table:0];
  BOOL v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"presentPreferences" input:@"," modifierFlags:0x100000 propertyList:0];

  return v4;
}

+ (id)userProfileMenu
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Menu] Account in Maps…" value:@"localized string not found" table:0];
  BOOL v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"openUserProfile" input:@"a" modifierFlags:1572864 propertyList:0];

  v8 = v4;
  v5 = +[NSArray arrayWithObjects:&v8 count:1];
  uint64_t v6 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v5];

  return v6;
}

+ (id)applicationMenu
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Menu] Report an Issue…" value:@"localized string not found" table:0];
  BOOL v4 = +[UICommand commandWithTitle:v3 image:0 action:"presentRAP" propertyList:0];

  LODWORD(v2) = GEOConfigGetBOOL();
  v5 = +[NSBundle mainBundle];
  uint64_t v6 = v5;
  if (v2) {
    CFStringRef v7 = @"[Menu] Report Something Missing";
  }
  else {
    CFStringRef v7 = @"[Menu] Add to Maps…";
  }
  v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

  id v9 = +[UICommand commandWithTitle:v8 image:0 action:"presentAddAMissingPlace" propertyList:0];
  v10 = +[NSArray array];
  if (_MKRAPIsAvailable() && (sub_100521BD0() & 1) == 0)
  {
    v19[0] = v4;
    v19[1] = v9;
    v11 = +[NSArray arrayWithObjects:v19 count:2];
    uint64_t v12 = [v10 arrayByAddingObjectsFromArray:v11];

    v10 = (void *)v12;
  }
  v13 = +[GEOPlatform sharedPlatform];
  unsigned int v14 = [v13 isInternalInstall];

  if (v14)
  {
    v15 = +[UICommand commandWithTitle:@"File a Radar…" image:0 action:"presentRadar" propertyList:0];
    uint64_t v16 = [v10 arrayByAddingObject:v15];

    v10 = (void *)v16;
  }
  if ([v10 count])
  {
    v17 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v10];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)fileMenuStart
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Menu] New Window" value:@"localized string not found" table:0];
  BOOL v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"requestNewWindow:" input:@"N" modifierFlags:0x100000 propertyList:0];

  v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"[Menu] New Tab" value:@"localized string not found" table:0];
  CFStringRef v7 = +[UIKeyCommand commandWithTitle:v6 image:0 action:"requestNewTab:" input:@"T" modifierFlags:0x100000 propertyList:0];

  v8 = +[UIScreen mainScreen];
  uint64_t v9 = sub_1000BBB44(v8);

  if (v9 == 5)
  {
    uint64_t v16 = v4;
    v17 = v7;
    v10 = &v16;
    uint64_t v11 = 2;
  }
  else
  {
    v15 = v4;
    v10 = &v15;
    uint64_t v11 = 1;
  }
  uint64_t v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, v11, v15, v16, v17);
  v13 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v12];

  return v13;
}

+ (id)filePrintKeyCommand
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Menu] Print…" value:@"localized string not found" table:0];
  BOOL v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"printCurrentState" input:@"P" modifierFlags:0x100000 propertyList:0];

  return v4;
}

+ (id)fileMenuEnd
{
  v2 = [a1 filePrintKeyCommand];
  uint64_t v6 = v2;
  v3 = +[NSArray arrayWithObjects:&v6 count:1];
  BOOL v4 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v3];

  return v4;
}

+ (id)dropPinKeyCommand
{
  unsigned int v2 = +[LibraryUIUtilities isMyPlacesEnabled];
  v3 = +[NSBundle mainBundle];
  BOOL v4 = v3;
  if (v2) {
    CFStringRef v5 = @"[Menu] Mark Location";
  }
  else {
    CFStringRef v5 = @"[Menu] Drop Pin";
  }
  uint64_t v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

  CFStringRef v7 = +[UIKeyCommand commandWithTitle:v6 image:0 action:"createCustomSearchResultForDroppedPinAtCenterPoint" input:@"d" modifierFlags:1179648 propertyList:0];

  return v7;
}

+ (id)editMenu
{
  unsigned int v2 = [a1 dropPinKeyCommand];
  unsigned int v3 = +[LibraryUIUtilities isMyPlacesEnabled];
  BOOL v4 = +[NSBundle mainBundle];
  CFStringRef v5 = v4;
  if (v3) {
    CFStringRef v6 = @"[Menu] Remove Marked Location";
  }
  else {
    CFStringRef v6 = @"[Menu] Remove Pin";
  }
  CFStringRef v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

  v8 = +[UICommand commandWithTitle:v7 image:0 action:"removeDroppedPin" propertyList:0];
  uint64_t v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"[Menu] Delete Stop" value:@"localized string not found" table:0];
  uint64_t v11 = +[UICommand commandWithTitle:v10 image:0 action:"deleteStop" propertyList:0];

  v15[0] = v2;
  v15[1] = v8;
  v15[2] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v15 count:3];
  v13 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v12];

  return v13;
}

+ (id)undoRedoMenu
{
  unsigned int v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"[Menu] Undo" value:@"localized string not found" table:0];
  BOOL v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"undo:" input:@"z" modifierFlags:0x100000 propertyList:0];

  CFStringRef v5 = +[NSBundle mainBundle];
  CFStringRef v6 = [v5 localizedStringForKey:@"[Menu] Redo" value:@"localized string not found" table:0];
  CFStringRef v7 = +[UIKeyCommand commandWithTitle:v6 image:0 action:"redo:" input:@"z" modifierFlags:1179648 propertyList:0];

  v11[0] = v4;
  v11[1] = v7;
  v8 = +[NSArray arrayWithObjects:v11 count:2];
  uint64_t v9 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v8];

  return v9;
}

+ (id)findSubMenu
{
  unsigned int v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"[Menu] Find" value:@"localized string not found" table:0];
  BOOL v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"find:" input:@"f" modifierFlags:0x100000 propertyList:0];

  v8 = v4;
  CFStringRef v5 = +[NSArray arrayWithObjects:&v8 count:1];
  CFStringRef v6 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:UIMenuFind options:1 children:v5];

  return v6;
}

+ (id)mapModeSubMenuCommands
{
  unsigned int v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"[Menu] Explore Map" value:@"localized string not found" table:0];
  BOOL v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"switchMapMode:" input:@"1" modifierFlags:0x100000 propertyList:&off_1013A81E8];

  CFStringRef v5 = +[NSBundle mainBundle];
  CFStringRef v6 = [v5 localizedStringForKey:@"Switch to Explore" value:@"localized string not found" table:0];
  [v4 setDiscoverabilityTitle:v6];

  CFStringRef v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"[Menu] Driving" value:@"localized string not found" table:0];
  uint64_t v9 = +[UIKeyCommand commandWithTitle:v8 image:0 action:"switchMapMode:" input:@"2" modifierFlags:0x100000 propertyList:&off_1013A8218];

  v10 = +[NSBundle mainBundle];
  uint64_t v11 = [v10 localizedStringForKey:@"Switch to Driving" value:@"localized string not found" table:0];
  [v9 setDiscoverabilityTitle:v11];

  uint64_t v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"[Menu] Transit" value:@"localized string not found" table:0];
  unsigned int v14 = +[UIKeyCommand commandWithTitle:v13 image:0 action:"switchMapMode:" input:@"3" modifierFlags:0x100000 propertyList:&off_1013A8230];

  v15 = +[NSBundle mainBundle];
  uint64_t v16 = [v15 localizedStringForKey:@"Switch to Transit" value:@"localized string not found" table:0];
  [v14 setDiscoverabilityTitle:v16];

  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"[Menu] Satellite" value:@"localized string not found" table:0];
  v19 = +[UIKeyCommand commandWithTitle:v18 image:0 action:"switchMapMode:" input:@"4" modifierFlags:0x100000 propertyList:&off_1013A8200];

  v20 = +[NSBundle mainBundle];
  v21 = [v20 localizedStringForKey:@"Switch to Satellite" value:@"localized string not found" table:0];
  [v19 setDiscoverabilityTitle:v21];

  v24[0] = v4;
  v24[1] = v9;
  v24[2] = v14;
  v24[3] = v19;
  id v22 = +[NSArray arrayWithObjects:v24 count:4];

  return v22;
}

+ (id)mapModeSubMenu
{
  unsigned int v2 = [a1 mapModeSubMenuCommands];
  unsigned int v3 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:@"MapModeSubMenuIdentifier" options:1 children:v2];

  return v3;
}

+ (id)zoomSubMenuCommands
{
  unsigned int v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"[Menu] Default Zoom" value:@"localized string not found" table:0];
  v25 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"defaultZoom" input:@"0" modifierFlags:0x100000 propertyList:0];

  BOOL v4 = +[NSBundle mainBundle];
  CFStringRef v5 = [v4 localizedStringForKey:@"[Menu] Zoom In" value:@"localized string not found" table:0];
  v24 = +[UIKeyCommand commandWithTitle:v5 image:0 action:"zoomIn" input:@"+" modifierFlags:0x100000 propertyList:0];

  CFStringRef v6 = +[NSBundle mainBundle];
  CFStringRef v7 = [v6 localizedStringForKey:@"[Menu] Zoom Out" value:@"localized string not found" table:0];
  v8 = +[UIKeyCommand commandWithTitle:v7 image:0 action:"zoomOut" input:@"-" modifierFlags:0x100000 propertyList:0];

  uint64_t v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"[Menu] Snap to North" value:@"localized string not found" table:0];
  uint64_t v11 = +[UIKeyCommand commandWithTitle:v10 image:0 action:"snapToNorth" input:UIKeyInputUpArrow modifierFlags:1179648 propertyList:0];

  uint64_t v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"[Menu] Show 3D Map" value:@"localized string not found" table:0];
  unsigned int v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"[Menu] Hide 3D Map" value:@"localized string not found" table:0];
  uint64_t v16 = +[UIKeyCommand _maps_commandWithEnableFeatureTitle:v13 disableFeatureTitle:v15 action:"select3dMode" input:@"d" modifierFlags:0x100000];

  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"[Menu] Show Look Around" value:@"localized string not found" table:0];
  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"[Menu] Hide Look Around" value:@"localized string not found" table:0];
  v21 = +[UIKeyCommand _maps_commandWithEnableFeatureTitle:v18 disableFeatureTitle:v20 action:"selectLookAroundMode" input:@"k" modifierFlags:0x100000];

  v26[0] = v25;
  v26[1] = v24;
  v26[2] = v8;
  v26[3] = v11;
  v26[4] = v16;
  v26[5] = v21;
  id v22 = +[NSArray arrayWithObjects:v26 count:6];

  return v22;
}

+ (id)zoomSubMenu
{
  unsigned int v2 = [a1 zoomSubMenuCommands];
  unsigned int v3 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:@"ZoomSubMenuIdentifier" options:1 children:v2];

  return v3;
}

+ (id)currentLocationSubMenu
{
  unsigned int v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"[Menu] Go to Current Location" value:@"localized string not found" table:0];
  BOOL v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"centerMapToUserLocation" input:@"l" modifierFlags:0x100000 propertyList:0];

  CFStringRef v5 = +[NSBundle mainBundle];
  CFStringRef v6 = [v5 localizedStringForKey:@"[Menu] Show Directions" value:@"localized string not found" table:0];
  CFStringRef v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"[Menu] Hide Directons" value:@"localized string not found" table:0];
  uint64_t v9 = +[UIKeyCommand _maps_commandWithEnableFeatureTitle:v6 disableFeatureTitle:v8 action:"toggleDirections" input:@"r" modifierFlags:0x100000];

  v13[0] = v4;
  v13[1] = v9;
  v10 = +[NSArray arrayWithObjects:v13 count:2];
  uint64_t v11 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:@"CurrentLocationSubMenuIdentifier" options:1 children:v10];

  return v11;
}

+ (id)visibleAttributesSubMenu
{
  unsigned int v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"[Menu] Show Scale" value:@"localized string not found" table:0];
  BOOL v4 = +[NSBundle mainBundle];
  CFStringRef v5 = [v4 localizedStringForKey:@"[Menu] Hide Scale" value:@"localized string not found" table:0];
  CFStringRef v6 = +[UICommand _maps_commandWithEnableFeatureTitle:v3 disableFeatureTitle:v5 action:"toggleMapScale"];

  CFStringRef v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"[Menu] Show Traffic" value:@"localized string not found" table:0];
  uint64_t v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"[Menu] Hide Traffic" value:@"localized string not found" table:0];
  uint64_t v11 = +[UICommand _maps_commandWithEnableFeatureTitle:v8 disableFeatureTitle:v10 action:"toggleTraffic"];

  uint64_t v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"[Menu] Show Labels" value:@"localized string not found" table:0];
  unsigned int v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"[Menu] Hide Labels" value:@"localized string not found" table:0];
  uint64_t v16 = +[UICommand _maps_commandWithEnableFeatureTitle:v13 disableFeatureTitle:v15 action:"toggleLabels"];

  v20[0] = v6;
  v20[1] = v11;
  v20[2] = v16;
  v17 = +[NSArray arrayWithObjects:v20 count:3];
  v18 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:@"VisibleAttributesSubMenuIdentifier" options:1 children:v17];

  return v18;
}

+ (id)performanceTestsMenu
{
  unsigned int v2 = +[NSBundle bundleWithIdentifier:@"com.apple.Maps"];
  uint64_t v3 = [v2 pathForResource:@"testDefinitions" ofType:@"plist"];

  uint64_t v16 = (void *)v3;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithContentsOfFile:v3];
  CFStringRef v5 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"testName"];
        if ([v12 length])
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_1006A25DC;
          v17[3] = &unk_1012F47A0;
          id v18 = v12;
          v19 = v11;
          v13 = +[UIAction actionWithTitle:v18 image:0 identifier:0 handler:v17];
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  unsigned int v14 = +[UIMenu menuWithTitle:@"Performance Tests" children:v5];

  return v14;
}

+ (id)debugMenu
{
  unsigned int v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"[Menu] Debug Menu…" value:@"localized string not found" table:0];
  id v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"presentMapsDebugControllerIfEnabled" input:@"," modifierFlags:1572864 propertyList:0];

  CFStringRef v5 = +[UICommand commandWithTitle:@"Disable Menu Sharing" image:0 action:"toggleDisableMenuSharing" propertyList:0];
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v5 setState:[v6 BOOLForKey:@"MENU_SHARING_DISABLED_KEY"]];

  id v7 = +[UICommand commandWithTitle:@"Enable Sidebar Selection" image:0 action:"toggleSidebarSelection" propertyList:0];
  id v8 = +[NSUserDefaults standardUserDefaults];
  uint64_t v9 = [v8 objectForKey:@"SIDEBAR_SELECTION_ENABLED_KEY"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = [v9 BOOLValue];
  }
  else {
    uint64_t v10 = 1;
  }

  [v7 setState:v10];
  uint64_t v11 = +[UICommand commandWithTitle:@"Scrolling Opens Placecard" image:0 action:"toggleScrollingOpensPlacecard" propertyList:0];
  uint64_t v12 = +[NSUserDefaults standardUserDefaults];
  [v11 setState:[v12 BOOLForKey:@"SCROLLING_OPENS_PLACECARD_KEY_ROTATED"]];

  v27[0] = v5;
  v27[1] = v7;
  v27[2] = v11;
  v13 = +[NSArray arrayWithObjects:v27 count:3];
  unsigned int v14 = +[UIMenu menuWithTitle:@"Maps Catalyst Defaults" image:0 identifier:0 options:0 children:v13];

  v26 = v14;
  v15 = +[NSArray arrayWithObjects:&v26 count:1];
  uint64_t v16 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v15];

  v17 = +[UIScreen mainScreen];
  uint64_t v18 = sub_1000BBB44(v17);

  if (v18 == 5)
  {
    v25[0] = v4;
    v25[1] = v16;
    v19 = [a1 performanceTestsMenu];
    v25[2] = v19;
    long long v20 = +[NSArray arrayWithObjects:v25 count:3];
    long long v21 = +[UIMenu menuWithTitle:@"Debug" children:v20];
  }
  else
  {
    v24[0] = v4;
    v24[1] = v16;
    v19 = +[NSArray arrayWithObjects:v24 count:2];
    long long v21 = +[UIMenu menuWithTitle:@"Debug" children:v19];
  }

  return v21;
}

+ (id)addMenu
{
  unsigned int v2 = +[LibraryUIUtilities isMyPlacesEnabled];
  uint64_t v3 = +[NSBundle mainBundle];
  id v4 = v3;
  if (v2) {
    CFStringRef v5 = @"[Menu] Pinned";
  }
  else {
    CFStringRef v5 = @"[Menu] Favorites";
  }
  uint64_t v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

  v36 = (void *)v6;
  v37 = +[UICommand commandWithTitle:v6 image:0 action:"presentAddToFavorites" propertyList:0];
  id v7 = +[NSMutableArray array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = +[CollectionManager sharedManager];
  uint64_t v9 = [v8 currentCollectionsForToolbarMenu];

  id v10 = [v9 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v15 = [v14 title];

        if (v15)
        {
          uint64_t v16 = [v14 title];
          v17 = [v14 identifier];
          uint64_t v18 = +[UICommand commandWithTitle:v16 image:0 action:"presentAddToCollection:" propertyList:v17];

          [v7 addObject:v18];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v11);
  }

  id v19 = [v7 copy];
  v35 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v19];

  long long v20 = +[NSBundle mainBundle];
  long long v21 = [v20 localizedStringForKey:@"[Menu] Add New Place To" value:@"localized string not found" table:0];
  v44[0] = v37;
  v44[1] = v35;
  long long v22 = +[NSArray arrayWithObjects:v44 count:2];
  long long v23 = +[UIMenu menuWithTitle:v21 children:v22];

  v24 = +[NSBundle mainBundle];
  v25 = [v24 localizedStringForKey:@"[Menu] Create New Guide" value:@"localized string not found" table:0];

  v26 = +[UICommand commandWithTitle:v25 image:0 action:"presentAddNewCollection" propertyList:0];
  v43 = v26;
  v27 = +[NSArray arrayWithObjects:&v43 count:1];
  v28 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v27];

  v29 = +[NSBundle mainBundle];
  v30 = [v29 localizedStringForKey:@"[Menu] New Tab" value:@"localized string not found" table:0];
  v31 = +[UIKeyCommand commandWithTitle:v30 image:0 action:"requestNewTab:" input:@"T" modifierFlags:0x100000 propertyList:0];

  v42[0] = v23;
  v42[1] = v28;
  v42[2] = v31;
  v32 = +[NSArray arrayWithObjects:v42 count:3];
  v33 = +[UIMenu menuWithTitle:&stru_101324E70 children:v32];

  return v33;
}

+ (id)disabledAddMenu
{
  unsigned int v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"[Menu] Add New Place To" value:@"localized string not found" table:0];
  id v4 = +[UIAction actionWithTitle:v3 image:0 identifier:0 handler:&stru_1012F47C0];

  [v4 setAttributes:1];
  CFStringRef v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"[Menu] Create New Guide" value:@"localized string not found" table:0];

  id v7 = +[UIAction actionWithTitle:v6 image:0 identifier:0 handler:&stru_1012F47E0];
  [v7 setAttributes:1];
  id v8 = +[NSBundle mainBundle];
  uint64_t v9 = [v8 localizedStringForKey:@"[Menu] New Tab" value:@"localized string not found" table:0];
  id v10 = +[UIKeyCommand commandWithTitle:v9 image:0 action:"requestNewTab:" input:@"T" modifierFlags:0x100000 propertyList:0];

  v14[0] = v4;
  v14[1] = v7;
  v14[2] = v10;
  id v11 = +[NSArray arrayWithObjects:v14 count:3];
  uint64_t v12 = +[UIMenu menuWithTitle:&stru_101324E70 children:v11];

  return v12;
}

+ (id)sendToDeviceAndShareMenuWithSendToDeviceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v5 = [v4 BOOLForKey:@"MENU_SHARING_DISABLED_KEY"];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"[Menu] Share" value:@"localized string not found" table:0];
    uint64_t v6 = +[UICommand commandWithTitle:v8 image:0 action:"_share:" propertyList:UICommandTagShare];
  }
  uint64_t v9 = +[NSMutableArray array];
  id v10 = +[NSBundle mainBundle];
  id v11 = [v10 localizedStringForKey:@"[Menu] Send to Device" value:@"localized string not found" table:0];

  if (v3 && [v9 count])
  {
    id v12 = [v9 copy];
    v13 = +[UIMenu menuWithTitle:v11 image:0 identifier:0 options:0 children:v12];
  }
  else
  {
    v13 = +[UIAction actionWithTitle:v11 image:0 identifier:0 handler:&stru_1012F4800];
    [v13 setAttributes:1];
  }
  id v19 = v13;
  unsigned int v14 = +[NSArray arrayWithObjects:&v19 count:1];
  if (v6)
  {
    v18[0] = v6;
    v18[1] = v13;
    uint64_t v15 = +[NSArray arrayWithObjects:v18 count:2];

    unsigned int v14 = (void *)v15;
  }
  uint64_t v16 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:@"SendToDeviceAndShareSubMenuIdentifier" options:1 children:v14];

  return v16;
}

@end