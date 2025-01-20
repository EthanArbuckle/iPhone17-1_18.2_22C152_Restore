@interface _UGCAddPhotoViewModel
- (BOOL)isEnabled;
- (NSString)symbolName;
- (NSString)titleString;
- (UIMenu)menu;
- (id)accessibilityIdentifierForAction;
- (id)actionBlock;
- (int64_t)actionStyle;
- (void)setActionBlock:(id)a3;
- (void)setMenu:(id)a3;
@end

@implementation _UGCAddPhotoViewModel

- (NSString)symbolName
{
  return (NSString *)@"camera.fill";
}

- (NSString)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[UGC Contribution Card] Add Your Photos button" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (int64_t)actionStyle
{
  return 0;
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)accessibilityIdentifierForAction
{
  return @"UGCAddPhoto";
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);

  objc_storeStrong(&self->_actionBlock, 0);
}

@end