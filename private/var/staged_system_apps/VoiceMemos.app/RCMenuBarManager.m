@interface RCMenuBarManager
+ (id)sharedMenuBarManager;
- (id)controlsMenu;
- (id)editMenu;
- (id)fileMenu;
- (void)_removeDefaultDocumentCommandsInBuilder:(id)a3;
- (void)_removeDefaultFindCommandsInBuilder:(id)a3;
- (void)_replaceDefaultDeleteCommandWithCustomCommandInBuilder:(id)a3;
- (void)addControlsMenuItemsToBuilder:(id)a3;
- (void)addEditMenuItemsToBuilder:(id)a3;
- (void)addFileMenuItemsToBuilder:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
@end

@implementation RCMenuBarManager

+ (id)sharedMenuBarManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A2088;
  block[3] = &unk_1002211C8;
  block[4] = a1;
  if (qword_10026A858 != -1) {
    dispatch_once(&qword_10026A858, block);
  }
  v2 = (void *)qword_10026A850;

  return v2;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  [v4 removeMenuForIdentifier:UIMenuFormat];
  [v4 removeMenuForIdentifier:UIMenuToolbar];
  [(RCMenuBarManager *)self addFileMenuItemsToBuilder:v4];
  [(RCMenuBarManager *)self addEditMenuItemsToBuilder:v4];
  [(RCMenuBarManager *)self addControlsMenuItemsToBuilder:v4];
}

- (void)addFileMenuItemsToBuilder:(id)a3
{
  id v4 = a3;
  [(RCMenuBarManager *)self _removeDefaultDocumentCommandsInBuilder:v4];
  id v5 = [(RCMenuBarManager *)self fileMenu];
  [v4 insertChildMenu:v5 atStartOfMenuForIdentifier:UIMenuFile];
}

- (void)addEditMenuItemsToBuilder:(id)a3
{
  id v4 = a3;
  [(RCMenuBarManager *)self _removeDefaultFindCommandsInBuilder:v4];
  [(RCMenuBarManager *)self _replaceDefaultDeleteCommandWithCustomCommandInBuilder:v4];
  id v5 = [(RCMenuBarManager *)self editMenu];
  [v4 insertSiblingMenu:v5 afterMenuForIdentifier:UIMenuStandardEdit];
}

- (void)_replaceDefaultDeleteCommandWithCustomCommandInBuilder:(id)a3
{
}

- (void)_removeDefaultDocumentCommandsInBuilder:(id)a3
{
}

- (void)_removeDefaultFindCommandsInBuilder:(id)a3
{
}

- (void)addControlsMenuItemsToBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMenuBarManager *)self controlsMenu];
  [v4 insertSiblingMenu:v5 afterMenuForIdentifier:UIMenuView];
}

- (id)fileMenu
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"DONE_EDITING" value:&stru_100228BC8 table:0];
  id v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"handleDone:" input:@"s" modifierFlags:0x100000 propertyList:0];

  id v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"START_NEW_RECORDING_MENU_ITEM" value:&stru_100228BC8 table:0];
  v7 = +[UIKeyCommand commandWithTitle:v6 image:0 action:"startNewRecording:" input:@"n" modifierFlags:0x100000 propertyList:0];

  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"DUPLICATE_CURRENT_RECORDING_MENU_ITEM" value:&stru_100228BC8 table:0];
  v10 = +[UIKeyCommand commandWithTitle:v9 image:0 action:"duplicateRecording:" input:@"d" modifierFlags:0x100000 propertyList:0];

  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"RENAME_CURRENT_RECORDING_MENU_ITEM" value:&stru_100228BC8 table:0];
  v13 = +[UICommand commandWithTitle:v12 image:0 action:"renameRecording:" propertyList:0];

  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_100228BC8 table:0];
  v16 = +[UIKeyCommand commandWithTitle:v15 image:0 action:"handleCancel:" input:UIKeyInputEscape modifierFlags:0 propertyList:0];

  [v16 setAttributes:4];
  v20[0] = v4;
  v20[1] = v7;
  v20[2] = v10;
  v20[3] = v13;
  v20[4] = v16;
  v17 = +[NSArray arrayWithObjects:v20 count:5];
  v18 = +[UIMenu menuWithTitle:&stru_100228BC8 image:0 identifier:@"RCFileMenuIdentifier" options:1 children:v17];

  return v18;
}

- (id)editMenu
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"EDIT_CURRENT_RECORDING_MENU_ITEM" value:&stru_100228BC8 table:0];
  v20 = +[UICommand commandWithTitle:v3 image:0 action:"editRecording:" propertyList:0];

  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"TRIM_CURRENT_RECORDING_MENU_ITEM" value:&stru_100228BC8 table:0];
  uint64_t v6 = +[UIKeyCommand commandWithTitle:v5 image:0 action:"trimRecording:" input:@"t" modifierFlags:0x100000 propertyList:0];

  v7 = +[NSBundle mainBundle];
  v19 = [v7 localizedStringForKey:@"FAVORITE_RECORDING" value:&stru_100228BC8 table:0];

  v8 = +[UICommand commandWithTitle:v19 image:0 action:"toggleFavorite:" propertyList:0];
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"ENHANCE_RECORDING_SETTING" value:&stru_100228BC8 table:0];

  v11 = +[UIKeyCommand commandWithTitle:v10 image:0 action:"toggleEnhance:" input:@"e" modifierFlags:1179648 propertyList:0];
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"SKIP_SILENCE_SETTING" value:&stru_100228BC8 table:0];

  v14 = +[UIKeyCommand commandWithTitle:v13 image:0 action:"toggleRemoveSilence:" input:@"x" modifierFlags:1179648 propertyList:0];
  v21[0] = v20;
  v21[1] = v6;
  v15 = (void *)v6;
  v21[2] = v8;
  v21[3] = v11;
  v21[4] = v14;
  v16 = +[NSArray arrayWithObjects:v21 count:5];
  v17 = +[UIMenu menuWithTitle:&stru_100228BC8 image:0 identifier:@"RCEditMenuIdentifier" options:1 children:v16];

  return v17;
}

- (id)controlsMenu
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"PLAY_PAUSE_CURRENT_RECORDING_MENU_ITEM" value:&stru_100228BC8 table:0];
  id v4 = +[UIKeyCommand commandWithTitle:v3 image:0 action:"playRecording:" input:@" " modifierFlags:0 propertyList:0];
  id v5 = [v4 _nonRepeatableKeyCommand];

  uint64_t v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"SKIP_BACKWARD" value:&stru_100228BC8 table:0];
  v8 = +[UIKeyCommand commandWithTitle:v7 image:0 action:"jumpSelectionBackward:" input:UIKeyInputLeftArrow modifierFlags:0x100000 propertyList:0];

  [v8 setAllowsAutomaticMirroring:0];
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"SKIP_FORWARD" value:&stru_100228BC8 table:0];
  v11 = +[UIKeyCommand commandWithTitle:v10 image:0 action:"jumpSelectionForward:" input:UIKeyInputRightArrow modifierFlags:0x100000 propertyList:0];

  [v11 setAllowsAutomaticMirroring:0];
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"CONTROLS_MENU_NAME" value:&stru_100228BC8 table:0];
  v17[0] = v5;
  v17[1] = v8;
  v17[2] = v11;
  v14 = +[NSArray arrayWithObjects:v17 count:3];
  v15 = +[UIMenu menuWithTitle:v13 image:0 identifier:@"RCControlsMenuIdentifier" options:0 children:v14];

  return v15;
}

@end