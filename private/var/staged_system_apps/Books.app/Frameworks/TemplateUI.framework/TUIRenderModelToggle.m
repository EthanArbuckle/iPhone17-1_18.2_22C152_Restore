@interface TUIRenderModelToggle
- (BOOL)isEqualToRenderModel:(id)a3;
- (BOOL)isOn;
- (NSString)title;
- (TUIRenderModelToggle)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 title:(id)a10 isOn:(BOOL)a11;
- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4;
@end

@implementation TUIRenderModelToggle

- (TUIRenderModelToggle)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 title:(id)a10 isOn:(BOOL)a11
{
  id v18 = a10;
  v24.receiver = self;
  v24.super_class = (Class)TUIRenderModelToggle;
  BOOL v23 = a8;
  v19 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](&v24, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", a3, a4, 0, a5, 0, a6, 1.0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, a7, v23, 0, 0, 0,
          a9);
  if (v19)
  {
    v20 = (NSString *)[v18 copy];
    title = v19->_title;
    v19->_title = v20;

    v19->_isOn = a11;
  }

  return v19;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  v14.receiver = self;
  v14.super_class = (Class)TUIRenderModelToggle;
  if ([(TUIRenderModelInteractive *)&v14 isEqualToRenderModel:v6]
    && (int isOn = self->_isOn, isOn == [v6 isOn]))
  {
    title = self->_title;
    v9 = [v6 title];
    if (title == v9)
    {
      unsigned __int8 v12 = 1;
    }
    else
    {
      v10 = self->_title;
      v11 = [v6 title];
      unsigned __int8 v12 = [(NSString *)v10 isEqualToString:v11];
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4
{
  id v18 = objc_alloc((Class)objc_opt_class());
  v6 = [(TUIRenderModelInteractive *)self reuseIdentifier];
  v7 = [(TUIRenderModelInteractive *)self identifier];
  v8 = [(TUIRenderModelInteractive *)self stateToModel];
  id v9 = sub_15DC20(v8, a3, &stru_2568C0);
  v10 = [(TUIRenderModelInteractive *)self actionHandler];
  v11 = [(TUIRenderModelInteractive *)self viewState];
  BOOL v12 = [(TUIRenderModelInteractive *)self enabled];
  v13 = [(TUIRenderModelInteractive *)self name];
  objc_super v14 = [(TUIRenderModelToggle *)self title];
  LOBYTE(v17) = self->_isOn;
  id v15 = [v18 initWithReuseIdentifier:v6 identifier:v7 elementStates:v9 actionHandler:v10 viewState:v11 enabled:v12 name:v13 title:v14 isOn:v17];

  TUIRenderModelCopyProperties(v15, self);
  return v15;
}

- (BOOL)isOn
{
  return self->_isOn;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
}

@end