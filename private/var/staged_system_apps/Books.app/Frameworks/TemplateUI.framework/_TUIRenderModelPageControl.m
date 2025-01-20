@interface _TUIRenderModelPageControl
- (TUIIdentifier)scrollIdentifier;
- (_TUIRenderModelPageControl)initWithStateToRenderModel:(id)a3 pressScale:(double)a4 touchInsets:(UIEdgeInsets)a5 identifier:(id)a6 pointer:(id)a7 scrollIdentifier:(id)a8 kind:(unint64_t)a9;
- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4;
- (unint64_t)actionKind;
@end

@implementation _TUIRenderModelPageControl

- (_TUIRenderModelPageControl)initWithStateToRenderModel:(id)a3 pressScale:(double)a4 touchInsets:(UIEdgeInsets)a5 identifier:(id)a6 pointer:(id)a7 scrollIdentifier:(id)a8 kind:(unint64_t)a9
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_TUIRenderModelPageControl;
  char v24 = 1;
  v21 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](&v25, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", @"TUIReuseIdentifierPageControlView", a6, 0, a3, 0, 0, a4, top, left, bottom, right, 0, v24, a7, 0, 0,
          0);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_scrollIdentifier, a8);
    v22->_actionKind = a9;
  }

  return v22;
}

- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());
  v8 = [(TUIRenderModelInteractive *)self stateToModel];
  v9 = ((void (*)(void *, unint64_t))a4)(v8, a3);
  [(TUIRenderModelInteractive *)self pressScale];
  double v11 = v10;
  [(TUIRenderModelInteractive *)self touchInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  id v20 = [(TUIRenderModelInteractive *)self identifier];
  v21 = [(TUIRenderModelInteractive *)self pointer];
  v22 = [(_TUIRenderModelPageControl *)self scrollIdentifier];
  id v23 = [v7 initWithStateToRenderModel:v9, pressScale:v20, touchInsets:v21, identifier:v22, pointer:[self actionKind], scrollIdentifier:v11, kind:v13, v15, v17, v19];

  TUIRenderModelCopyProperties(v23, self);
  return v23;
}

- (TUIIdentifier)scrollIdentifier
{
  return self->_scrollIdentifier;
}

- (unint64_t)actionKind
{
  return self->_actionKind;
}

- (void).cxx_destruct
{
}

@end