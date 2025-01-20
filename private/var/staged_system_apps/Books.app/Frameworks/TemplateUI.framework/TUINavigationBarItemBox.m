@interface TUINavigationBarItemBox
- (BOOL)ignoreInsetsForOpacityTrigger;
- (BOOL)isEnabled;
- (BOOL)menuIsPrimary;
- (Class)layoutClass;
- (NSArray)hostingIdentifiers;
- (NSArray)hostingProperties;
- (NSAttributedString)attributedTitle;
- (NSAttributedString)placeholderText;
- (NSDictionary)stateMap;
- (NSString)observeTrigger;
- (NSString)text;
- (NSString)title;
- (TUIElementActionTriggerHandler)actionHandler;
- (TUIMenuContainer)menuContainer;
- (UIImage)image;
- (double)navigationBarBackgroundOpacity;
- (int64_t)searchTextMaxLength;
- (unint64_t)buttonRole;
- (unint64_t)buttonType;
- (unint64_t)itemType;
- (unint64_t)observeTriggerValue;
- (unint64_t)role;
- (void)setActionHandler:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setButtonRole:(unint64_t)a3;
- (void)setButtonType:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHostingIdentifiers:(id)a3;
- (void)setHostingProperties:(id)a3;
- (void)setIgnoreInsetsForOpacityTrigger:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setItemType:(unint64_t)a3;
- (void)setMenuContainer:(id)a3;
- (void)setMenuIsPrimary:(BOOL)a3;
- (void)setNavigationBarBackgroundOpacity:(double)a3;
- (void)setObserveTrigger:(id)a3;
- (void)setObserveTriggerValue:(unint64_t)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setSearchTextMaxLength:(int64_t)a3;
- (void)setStateMap:(id)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TUINavigationBarItemBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)role
{
  return 4;
}

- (void)setMenuContainer:(id)a3
{
  v5 = (TUIMenuContainer *)a3;
  menuContainer = self->_menuContainer;
  if (menuContainer != v5)
  {
    v7 = v5;
    [(TUIMenuContainer *)menuContainer setParentModel:0];
    objc_storeStrong((id *)&self->_menuContainer, a3);
    [(TUIMenuContainer *)self->_menuContainer setParentModel:self];
    v5 = v7;
  }
}

- (NSDictionary)stateMap
{
  return self->_stateMap;
}

- (void)setStateMap:(id)a3
{
}

- (TUIElementActionTriggerHandler)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (unint64_t)observeTriggerValue
{
  return self->_observeTriggerValue;
}

- (void)setObserveTriggerValue:(unint64_t)a3
{
  self->_observeTriggerValue = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(unint64_t)a3
{
  self->_buttonType = a3;
}

- (unint64_t)buttonRole
{
  return self->_buttonRole;
}

- (void)setButtonRole:(unint64_t)a3
{
  self->_buttonRole = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (int64_t)searchTextMaxLength
{
  return self->_searchTextMaxLength;
}

- (void)setSearchTextMaxLength:(int64_t)a3
{
  self->_searchTextMaxLength = a3;
}

- (NSAttributedString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
}

- (NSString)observeTrigger
{
  return self->_observeTrigger;
}

- (void)setObserveTrigger:(id)a3
{
}

- (BOOL)ignoreInsetsForOpacityTrigger
{
  return self->_ignoreInsetsForOpacityTrigger;
}

- (void)setIgnoreInsetsForOpacityTrigger:(BOOL)a3
{
  self->_ignoreInsetsForOpacityTrigger = a3;
}

- (double)navigationBarBackgroundOpacity
{
  return self->_navigationBarBackgroundOpacity;
}

- (void)setNavigationBarBackgroundOpacity:(double)a3
{
  self->_navigationBarBackgroundOpacity = a3;
}

- (TUIMenuContainer)menuContainer
{
  return self->_menuContainer;
}

- (BOOL)menuIsPrimary
{
  return self->_menuIsPrimary;
}

- (void)setMenuIsPrimary:(BOOL)a3
{
  self->_menuIsPrimary = a3;
}

- (NSArray)hostingIdentifiers
{
  return self->_hostingIdentifiers;
}

- (void)setHostingIdentifiers:(id)a3
{
}

- (NSArray)hostingProperties
{
  return self->_hostingProperties;
}

- (void)setHostingProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingProperties, 0);
  objc_storeStrong((id *)&self->_hostingIdentifiers, 0);
  objc_storeStrong((id *)&self->_menuContainer, 0);
  objc_storeStrong((id *)&self->_observeTrigger, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);

  objc_storeStrong((id *)&self->_stateMap, 0);
}

@end