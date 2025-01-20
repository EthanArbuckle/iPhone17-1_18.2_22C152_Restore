@interface _TUIElementButtonBuilder
- (BOOL)menuIsPrimary;
- (NSMutableArray)linkEntities;
- (NSString)name;
- (TUIMenuContainer)menuContainer;
- (TUIMutableDynamicValue)viewState;
- (UIColor)backgroundColor;
- (id)finalizeLinkEntities;
- (id)finalizeStateMapWithContext:(id)a3;
- (unint64_t)buttonRole;
- (unint64_t)buttonType;
- (void)addLinkEntity:(id)a3;
- (void)addMenuContainer:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setButtonRole:(unint64_t)a3;
- (void)setButtonType:(unint64_t)a3;
- (void)setLinkEntities:(id)a3;
- (void)setMenuIsPrimary:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setViewState:(id)a3;
@end

@implementation _TUIElementButtonBuilder

- (id)finalizeStateMapWithContext:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)_TUIElementButtonBuilder;
  id v3 = a3;
  v4 = -[TUIStateAndActionBuilder finalizeStateMapWithContext:](&v26, "finalizeStateMapWithContext:");
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        v12 = [v5 objectForKeyedSubscript:v10];
        v13 = [v12 submodel];
        v14 = TUIDynamicCast(v11, v13);

        v15 = [v14 modelForButtonType:[self buttonType] context:v3];
        if (v15)
        {
          v16 = [v5 objectForKeyedSubscript:v10];
          v17 = [v16 submodel];

          if (v17 != v15)
          {
            v27 = v15;
            v18 = +[NSArray arrayWithObjects:&v27 count:1];
            [v16 updateModelChildren:v18];
          }
          [v20 setObject:v16 forKeyedSubscript:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  return v20;
}

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
    id v6 = (NSMutableArray *)objc_opt_new();
    id v7 = self->_linkEntities;
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

- (void)setLinkEntities:(id)a3
{
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