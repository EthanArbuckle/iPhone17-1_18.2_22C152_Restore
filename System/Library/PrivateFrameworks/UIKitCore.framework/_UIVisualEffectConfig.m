@interface _UIVisualEffectConfig
+ (_UIVisualEffectConfig)configWithContentConfig:(id)a3;
+ (_UIVisualEffectConfig)configWithLayerConfigs:(id)a3;
- (NSArray)layerConfigs;
- (_UIVisualEffectLayerConfig)contentConfig;
- (id)description;
- (void)addLayerConfig:(id)a3;
- (void)enumerateLayerConfigs:(id)a3;
@end

@implementation _UIVisualEffectConfig

+ (_UIVisualEffectConfig)configWithContentConfig:(id)a3
{
  v3 = (_UIVisualEffectLayerConfig *)a3;
  v4 = objc_alloc_init(_UIVisualEffectConfig);
  contentConfig = v4->_contentConfig;
  v4->_contentConfig = v3;

  return v4;
}

+ (_UIVisualEffectConfig)configWithLayerConfigs:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UIVisualEffectConfig);
  uint64_t v5 = [v3 mutableCopy];

  layerConfigs = v4->_layerConfigs;
  v4->_layerConfigs = (NSMutableArray *)v5;

  return v4;
}

- (void)addLayerConfig:(id)a3
{
  layerConfigs = self->_layerConfigs;
  if (layerConfigs)
  {
    v9 = (NSMutableArray *)a3;
    [(NSMutableArray *)layerConfigs addObject:v9];
    v4 = v9;
  }
  else
  {
    v6 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v7 = a3;
    v8 = (NSMutableArray *)objc_msgSend([v6 alloc], "initWithObjects:", v7, 0);

    v4 = self->_layerConfigs;
    self->_layerConfigs = v8;
  }
}

- (void)enumerateLayerConfigs:(id)a3
{
  id v4 = a3;
  layerConfigs = self->_layerConfigs;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47___UIVisualEffectConfig_enumerateLayerConfigs___block_invoke;
  v7[3] = &unk_1E52DD4C8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)layerConfigs enumerateObjectsUsingBlock:v7];
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)_UIVisualEffectConfig;
  id v3 = [(_UIVisualEffectConfig *)&v8 description];
  contentConfig = self->_contentConfig;
  uint64_t v5 = [(NSMutableArray *)self->_layerConfigs componentsJoinedByString:@", "];
  id v6 = [v3 stringByAppendingFormat:@" contentConfig=%@ layerConfigs={%@}", contentConfig, v5];;

  return v6;
}

- (NSArray)layerConfigs
{
  return &self->_layerConfigs->super;
}

- (_UIVisualEffectLayerConfig)contentConfig
{
  return self->_contentConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentConfig, 0);
  objc_storeStrong((id *)&self->_layerConfigs, 0);
}

@end