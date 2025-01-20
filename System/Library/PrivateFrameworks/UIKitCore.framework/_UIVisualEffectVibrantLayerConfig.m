@interface _UIVisualEffectVibrantLayerConfig
+ (id)layerWithVibrantColor:(id)a3 tintColor:(id)a4 filterType:(id)a5;
+ (id)layerWithVibrantColor:(id)a3 tintColor:(id)a4 filterType:(id)a5 filterAttributes:(id)a6;
- (NSDictionary)filterAttributes;
- (UIColor)tintColor;
- (UIColor)vibrantColor;
- (id)description;
- (void)configureLayerView:(id)a3;
- (void)deconfigureLayerView:(id)a3;
@end

@implementation _UIVisualEffectVibrantLayerConfig

+ (id)layerWithVibrantColor:(id)a3 tintColor:(id)a4 filterType:(id)a5
{
  return (id)[a1 layerWithVibrantColor:a3 tintColor:a4 filterType:a5 filterAttributes:MEMORY[0x1E4F1CC08]];
}

+ (id)layerWithVibrantColor:(id)a3 tintColor:(id)a4 filterType:(id)a5 filterAttributes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [a1 layerWithFillColor:0 opacity:a5 filterType:1.0];
  v14 = (void *)v13[4];
  v13[4] = v10;
  id v15 = v10;

  v16 = (void *)v13[5];
  v13[5] = v11;
  id v17 = v11;

  uint64_t v18 = [v12 copy];
  v19 = (void *)v13[6];
  v13[6] = v18;

  return v13;
}

- (void)configureLayerView:(id)a3
{
  id v4 = a3;
  v5 = [(_UIVisualEffectLayerConfig *)self filterType];

  if (v5)
  {
    v6 = [v4 layer];
    v7 = [(_UIVisualEffectLayerConfig *)self filterType];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__14;
    v28 = __Block_byref_object_dispose__14;
    filterOfTypeOnLayer(v6, v7);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke;
    aBlock[3] = &unk_1E52DD450;
    id v8 = v4;
    id v20 = v8;
    v21 = self;
    id v9 = v6;
    id v22 = v9;
    id v10 = v7;
    id v23 = v10;
    id v11 = (void (**)(void))_Block_copy(aBlock);
    id v12 = v11;
    if (v25[5])
    {
      v11[2](v11);
    }
    else
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke_3;
      v13[3] = &unk_1E52DD4A0;
      id v14 = v8;
      uint64_t v18 = &v24;
      id v15 = v10;
      v16 = self;
      id v17 = v9;
      +[UIView performWithoutAnimation:v13];
      v12[2](v12);
    }
    _Block_object_dispose(&v24, 8);
  }
}

- (void)deconfigureLayerView:(id)a3
{
  id v4 = [a3 layer];
  v5 = [(_UIVisualEffectLayerConfig *)self filterType];
  v6 = filterOfTypeOnLayer(v4, v5);
  if (v6)
  {
    id v7 = +[UIColor clearColor];
    id v8 = [v7 CGColor];

    id v9 = [NSString stringWithFormat:@"filters.%@.%@", v5, @"inputColor0"];
    [v4 setValue:v8 forKeyPath:v9];

    id v10 = [NSString stringWithFormat:@"filters.%@.%@", v5, @"inputColor1"];
    [v4 setValue:v8 forKeyPath:v10];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58___UIVisualEffectVibrantLayerConfig_deconfigureLayerView___block_invoke;
    aBlock[3] = &unk_1E52D9F98;
    id v16 = v4;
    id v17 = v5;
    id v11 = _Block_copy(aBlock);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58___UIVisualEffectVibrantLayerConfig_deconfigureLayerView___block_invoke_3;
    v13[3] = &unk_1E52D9FE8;
    id v12 = v11;
    id v14 = v12;
    if (!+[UIView _addCompletion:v13]) {
      v12[2](v12);
    }
  }
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectVibrantLayerConfig;
  v3 = [(_UIVisualEffectLayerConfig *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" vibrantColor=%@ tintColor=%@ filterAttributes=%@", self->_vibrantColor, self->_tintColor, self->_filterAttributes];

  return v4;
}

- (UIColor)vibrantColor
{
  return self->_vibrantColor;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (NSDictionary)filterAttributes
{
  return self->_filterAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterAttributes, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_vibrantColor, 0);
}

@end