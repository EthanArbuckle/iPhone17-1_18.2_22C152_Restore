@interface TUIRenderModelLayerBuilder
- (CALayer)layer;
- (NSArray)sublayers;
- (NSArray)submodels;
- (NSDictionary)builderMap;
- (TUIRenderModelLayer)model;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)_updateFromPreviousSubmodels:(id)a3 newSubmodels:(id)a4;
- (void)_updateLayerWithPreviousModel:(id)a3 newModel:(id)a4;
- (void)_updateSubmodelLayers;
- (void)dynamicUserInterfaceTraitDidChange;
- (void)setModel:(id)a3;
- (void)setSubmodels:(id)a3;
@end

@implementation TUIRenderModelLayerBuilder

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[_TUIAnimationState animationForLayer:a3 forKey:a4];
}

- (void)setModel:(id)a3
{
  v5 = (TUIRenderModelLayer *)a3;
  p_model = &self->_model;
  model = self->_model;
  if (model != v5)
  {
    v32 = v5;
    v8 = model;
    [(TUIRenderModelLayerBuilder *)self _updateLayerWithPreviousModel:v8 newModel:v32];
    v9 = [(TUIRenderModelLayer *)v8 submodels];
    v10 = [(TUIRenderModelLayer *)v32 submodels];
    [(TUIRenderModelLayerBuilder *)self _updateFromPreviousSubmodels:v9 newSubmodels:v10];

    objc_storeStrong((id *)&self->_model, a3);
    if (![(TUIRenderModelLayer *)v8 isEqual:v32])
    {
      [(TUIRenderModelLayerBuilder *)self _updateSubmodelLayers];
      v11 = [(TUIRenderModelLayer *)self->_model config];

      if (v11)
      {
        v12 = [(TUIRenderModelLayer *)self->_model config];
        [v12 configureSublayers:self->_sublayers forLayer:self->_layer];
      }
      else
      {
        [(CALayer *)self->_layer setSublayers:self->_sublayers];
      }
      [(TUIRenderModelLayer *)*p_model size];
      double v14 = v13;
      double v16 = v15;
      [(TUIRenderModelLayer *)*p_model eraseableInsets];
      if (UIEdgeInsetsZero.left == v18
        && UIEdgeInsetsZero.top == v17
        && UIEdgeInsetsZero.right == v20
        && UIEdgeInsetsZero.bottom == v19)
      {
        layer = self->_layer;
        double v22 = 0.5;
        double v23 = 0.5;
      }
      else
      {
        CGFloat v24 = v18 + 0.0;
        CGFloat v25 = v17 + 0.0;
        CGFloat v26 = v14 - (v18 + v20);
        CGFloat v27 = v16 - (v17 + v19);
        v34.origin.x = 0.0;
        v34.origin.y = 0.0;
        v34.size.width = v14;
        v34.size.height = v16;
        double MidX = CGRectGetMidX(v34);
        v35.origin.x = 0.0;
        v35.origin.y = 0.0;
        v35.size.width = v14;
        v35.size.height = v16;
        double MidY = CGRectGetMidY(v35);
        v36.origin.x = v24;
        v36.origin.y = v25;
        v36.size.width = v26;
        v36.size.height = v27;
        double v30 = (MidX - CGRectGetMinX(v36)) / v26;
        v37.origin.x = v24;
        v37.origin.y = v25;
        v37.size.width = v26;
        v37.size.height = v27;
        CGFloat MinY = CGRectGetMinY(v37);
        layer = self->_layer;
        double v23 = (MidY - MinY) / v27;
        double v22 = v30;
      }
      -[CALayer setAnchorPoint:](layer, "setAnchorPoint:", v22, v23);
    }

    v5 = v32;
  }
}

- (void)dynamicUserInterfaceTraitDidChange
{
  id v3 = [(TUIRenderModelLayer *)self->_model config];
  [v3 dynamicUserInterfaceTraitDidChangeForLayer:self->_layer];
}

- (void)_updateLayerWithPreviousModel:(id)a3 newModel:(id)a4
{
  id v45 = a3;
  id v6 = a4;
  v7 = [v6 config];
  v8 = [v45 config];
  if (v8 == v7) {
    goto LABEL_20;
  }
  [v6 size];
  double v10 = v9;
  double v12 = v11;
  id v13 = [v7 layerClassForSize:];
  [v6 eraseableInsets];
  double v15 = v14 + 0.0;
  double v17 = v16 + 0.0;
  double v19 = v10 - (v14 + v18);
  double v21 = v12 - (v16 + v20);
  layer = self->_layer;
  if (!layer) {
    goto LABEL_10;
  }
  [(CALayer *)layer bounds];
  v50.origin.x = v15;
  v50.origin.y = v17;
  v50.size.width = v19;
  v50.size.height = v21;
  BOOL v23 = CGRectEqualToRect(v49, v50);
  unsigned int v24 = v23 ? 0 : [v8 reuseLayerForBoundsChange] ^ 1;
  if (!self->_layer) {
    goto LABEL_10;
  }
  if (v13 != (id)objc_opt_class()) {
    goto LABEL_10;
  }
  uint64_t v25 = objc_opt_class();
  if (v25 != objc_opt_class()) {
    goto LABEL_10;
  }
  CGFloat v26 = [v45 identifier];
  CGFloat v27 = [v6 identifier];
  unsigned int v28 = [v26 isEqual:v27] ^ 1 | v24;

  if (v28 != 1)
  {
    unsigned __int8 v37 = [v8 isEqualToConfig:v7];
    unsigned __int8 v38 = v37;
    if (v23)
    {
      if (v37) {
        goto LABEL_15;
      }
    }
    else
    {
      -[CALayer setBounds:](self->_layer, "setBounds:", v15, v17, v19, v21);
      if (v38)
      {
        [v7 configureBounds:self->_layer];
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_10:
    if (v13) {
      v29 = v13;
    }
    else {
      v29 = CALayer;
    }
    [v29 layer:v45];
    double v30 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v31 = self->_layer;
    self->_layer = v30;

    -[CALayer setBounds:](self->_layer, "setBounds:", v15, v17, v19, v21);
  }
  [v7 configureLayer:self->_layer v45];
LABEL_15:
  [v7 configureDelegate:self->_layer v45];
  uint64_t v32 = [(CALayer *)self->_layer delegate];
  if (v32
    && (v33 = (void *)v32,
        [(CALayer *)self->_layer delegate],
        CGRect v34 = objc_claimAutoreleasedReturnValue(),
        char v35 = objc_opt_respondsToSelector(),
        v34,
        v33,
        (v35 & 1) == 0))
  {
    if (_TUIDeviceHasInternalInstall())
    {
      id v39 = objc_alloc((Class)NSException);
      v46[0] = @"layer";
      v40 = self->_layer;
      v41 = v40;
      if (!v40)
      {
        v41 = +[NSNull null];
      }
      v46[1] = @"config";
      v47[0] = v41;
      v42 = v7;
      if (!v7)
      {
        v42 = +[NSNull null];
      }
      v47[1] = v42;
      v43 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
      id v44 = [v39 initWithName:@"LayerWithoutAnimationDelegate" reason:@"A layer without an animation delegate will result in the wrong animations" userInfo:v43];

      if (!v7) {
      if (!v40)
      }

      objc_exception_throw(v44);
    }
  }
  else
  {
    CGRect v36 = [(CALayer *)self->_layer delegate];

    if (!v36) {
      [(CALayer *)self->_layer setDelegate:self];
    }
  }
LABEL_20:
}

- (void)_updateFromPreviousSubmodels:(id)a3 newSubmodels:(id)a4
{
  if (a3 != a4)
  {
    uint64_t v17 = v4;
    uint64_t v18 = v5;
    id v7 = a4;
    double v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_CFF34;
    double v14 = &unk_2550A8;
    double v15 = self;
    id v16 = (id)objc_opt_new();
    id v8 = v16;
    [v7 enumerateObjectsUsingBlock:&v11];

    double v9 = [(NSDictionary *)[v8 copy:v11, v12, v13, v14, v15]];
    builderMap = self->_builderMap;
    self->_builderMap = v9;
  }
}

- (void)_updateSubmodelLayers
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(TUIRenderModelLayer *)self->_model submodels];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  double v10 = sub_D00DC;
  double v11 = &unk_2550A8;
  uint64_t v12 = self;
  id v5 = v3;
  id v13 = v5;
  [v4 enumerateObjectsUsingBlock:&v8];

  if (objc_msgSend(v5, "count", v8, v9, v10, v11, v12))
  {
    id v6 = (NSArray *)[v5 copy];
    sublayers = self->_sublayers;
    self->_sublayers = v6;
  }
  else
  {
    sublayers = self->_sublayers;
    self->_sublayers = 0;
  }
}

- (NSArray)submodels
{
  return self->_submodels;
}

- (void)setSubmodels:(id)a3
{
}

- (TUIRenderModelLayer)model
{
  return self->_model;
}

- (CALayer)layer
{
  return self->_layer;
}

- (NSDictionary)builderMap
{
  return self->_builderMap;
}

- (NSArray)sublayers
{
  return self->_sublayers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sublayers, 0);
  objc_storeStrong((id *)&self->_builderMap, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_submodels, 0);
}

@end