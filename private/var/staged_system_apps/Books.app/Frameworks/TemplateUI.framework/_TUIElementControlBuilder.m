@interface _TUIElementControlBuilder
- (BOOL)menuIsPrimary;
- (NSMutableArray)linkEntities;
- (NSString)name;
- (TUIMenuContainer)menuContainer;
- (TUIMutableDynamicValue)viewState;
- (UIColor)backgroundColor;
- (id)finalizeLinkEntities;
- (void)addLinkEntity:(id)a3;
- (void)addMenuContainer:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setMenuIsPrimary:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setViewState:(id)a3;
@end

@implementation _TUIElementControlBuilder

- (void)addMenuContainer:(id)a3
{
}

- (void)addLinkEntity:(id)a3
{
  id v4 = a3;
  linkEntities = self->_linkEntities;
  id v8 = v4;
  if (!linkEntities)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_linkEntities;
    self->_linkEntities = v6;

    id v4 = v8;
    linkEntities = self->_linkEntities;
  }
  [(NSMutableArray *)linkEntities addObject:v4];
}

- (id)finalizeLinkEntities
{
  id v2 = [(NSMutableArray *)self->_linkEntities copy];

  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (TUIMutableDynamicValue)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
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

- (NSMutableArray)linkEntities
{
  return self->_linkEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_menuContainer, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end