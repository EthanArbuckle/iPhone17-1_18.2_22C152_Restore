@interface VKCQuickActionMenuTuple
- (DDUIAction)defaultAction;
- (UIMenu)menu;
- (VKCActionInfoButton)button;
- (VKCBaseDataDetectorElement)element;
- (void)setButton:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setElement:(id)a3;
- (void)setMenu:(id)a3;
@end

@implementation VKCQuickActionMenuTuple

- (VKCBaseDataDetectorElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (DDUIAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
}

- (VKCActionInfoButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end