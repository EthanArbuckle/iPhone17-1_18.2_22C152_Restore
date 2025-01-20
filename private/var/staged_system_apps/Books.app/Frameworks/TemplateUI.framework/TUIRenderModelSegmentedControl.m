@interface TUIRenderModelSegmentedControl
- (BOOL)isEqualToRenderModel:(id)a3;
- (NSArray)segments;
- (TUIRenderModelSegmentedControl)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 selectIndex:(int64_t)a10 segments:(id)a11 tintColor:(id)a12;
- (UIColor)tintColor;
- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4;
- (int64_t)selectIndex;
@end

@implementation TUIRenderModelSegmentedControl

- (TUIRenderModelSegmentedControl)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 selectIndex:(int64_t)a10 segments:(id)a11 tintColor:(id)a12
{
  id v19 = a11;
  id v26 = a12;
  v27.receiver = self;
  v27.super_class = (Class)TUIRenderModelSegmentedControl;
  BOOL v25 = a8;
  v20 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](&v27, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", a3, a4, 0, a5, 0, a6, 1.0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, a7, v25, 0, 0, 0,
          a9);
  v21 = v20;
  if (v20)
  {
    v20->_selectIndex = a10;
    objc_storeStrong((id *)&v20->_tintColor, a12);
    v22 = (NSArray *)[v19 copy];
    segments = v21->_segments;
    v21->_segments = v22;
  }
  return v21;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  v18.receiver = self;
  v18.super_class = (Class)TUIRenderModelSegmentedControl;
  if (![(TUIRenderModelInteractive *)&v18 isEqualToRenderModel:v6]) {
    goto LABEL_4;
  }
  tintColor = self->_tintColor;
  uint64_t v8 = [v6 tintColor];
  if (tintColor == (UIColor *)v8)
  {
  }
  else
  {
    v9 = (void *)v8;
    v10 = self->_tintColor;
    v11 = [v6 tintColor];
    LODWORD(v10) = [(UIColor *)v10 isEqual:v11];

    if (!v10)
    {
LABEL_4:
      unsigned __int8 v12 = 0;
      goto LABEL_10;
    }
  }
  segments = self->_segments;
  v14 = [v6 segments];
  if (segments == v14)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    v15 = self->_segments;
    v16 = [v6 segments];
    unsigned __int8 v12 = [(NSArray *)v15 isEqualToArray:v16];
  }
LABEL_10:

  return v12;
}

- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  v7 = [(TUIRenderModelInteractive *)self reuseIdentifier];
  uint64_t v8 = [(TUIRenderModelInteractive *)self identifier];
  v9 = [(TUIRenderModelInteractive *)self stateToModel];
  id v10 = sub_15DC20(v9, a3, &stru_2568C0);
  v11 = [(TUIRenderModelInteractive *)self actionHandler];
  unsigned __int8 v12 = [(TUIRenderModelInteractive *)self viewState];
  BOOL v13 = [(TUIRenderModelInteractive *)self enabled];
  v14 = [(TUIRenderModelInteractive *)self name];
  id v15 = [v6 initWithReuseIdentifier:v7 identifier:v8 elementStates:v10 actionHandler:v11 viewState:v12 enabled:v13 name:v14 selectIndex:self->_selectIndex segments:self->_segments tintColor:self->_tintColor];

  TUIRenderModelCopyProperties(v15, self);
  return v15;
}

- (int64_t)selectIndex
{
  return self->_selectIndex;
}

- (NSArray)segments
{
  return self->_segments;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_segments, 0);
}

@end