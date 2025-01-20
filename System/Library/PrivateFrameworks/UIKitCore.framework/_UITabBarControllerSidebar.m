@interface _UITabBarControllerSidebar
- (BOOL)_isEditable;
- (BOOL)_isEditing;
- (BOOL)_isVisible;
- (NSString)_customizationIdentifier;
- (void)_scrollToHeaderAnimated:(BOOL)a3;
- (void)_scrollToTab:(id)a3 atPosition:(unint64_t)a4 animated:(BOOL)a5;
- (void)_setCustomizationIdentifier:(id)a3;
- (void)_setEditable:(BOOL)a3;
- (void)_setEditing:(BOOL)a3;
- (void)_setVisible:(BOOL)a3;
@end

@implementation _UITabBarControllerSidebar

- (void)_scrollToHeaderAnimated:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UITabBarControllerSidebar;
  [(UITabBarControllerSidebar *)&v3 _scrollToHeaderAnimated:a3];
}

- (void)_scrollToTab:(id)a3 atPosition:(unint64_t)a4 animated:(BOOL)a5
{
  v5.receiver = self;
  v5.super_class = (Class)_UITabBarControllerSidebar;
  [(UITabBarControllerSidebar *)&v5 _scrollToTab:a3 atPosition:a4 animated:a5];
}

- (BOOL)_isVisible
{
  return self->__visible;
}

- (void)_setVisible:(BOOL)a3
{
  self->__visible = a3;
}

- (BOOL)_isEditable
{
  return self->__editable;
}

- (void)_setEditable:(BOOL)a3
{
  self->__editable = a3;
}

- (BOOL)_isEditing
{
  return self->__editing;
}

- (void)_setEditing:(BOOL)a3
{
  self->__editing = a3;
}

- (NSString)_customizationIdentifier
{
  return self->__customizationIdentifier;
}

- (void)_setCustomizationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end