@interface TUIRenderModelLayer
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (NSArray)debugContainedSubmodels;
- (NSArray)submodels;
- (NSString)description;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIIdentifier)identifier;
- (TUIRenderModelLayer)initWithSubmodels:(id)a3 config:(id)a4 erasableInsets:(UIEdgeInsets)a5;
- (TUIRenderModelLayerConfiguring)config;
- (UIEdgeInsets)eraseableInsets;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation TUIRenderModelLayer

- (unint64_t)kind
{
  return 3;
}

- (TUIRenderModelLayer)initWithSubmodels:(id)a3 config:(id)a4 erasableInsets:(UIEdgeInsets)a5
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TUIRenderModelLayer;
  v13 = [(TUIRenderModelLayer *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_config, a4);
    v14->_eraseableInsets.CGFloat top = top;
    v14->_eraseableInsets.CGFloat left = left;
    v14->_eraseableInsets.CGFloat bottom = bottom;
    v14->_eraseableInsets.CGFloat right = right;
    v14->_size = CGSizeZero;
    v15 = (NSArray *)[v11 copy];
    submodels = v14->_submodels;
    v14->_submodels = v15;
  }
  return v14;
}

- (NSArray)debugContainedSubmodels
{
  if (self->_submodels) {
    return self->_submodels;
  }
  else {
    return (NSArray *)&__NSArray0__struct;
  }
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  config = self->_config;
  long long v8 = *(_OWORD *)&a4->c;
  long long v20 = *(_OWORD *)&a4->a;
  long long v21 = v8;
  long long v22 = *(_OWORD *)&a4->tx;
  [(TUIRenderModelLayerConfiguring *)config appendResourcesToCollector:v6 transform:&v20];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v9 = self->_submodels;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v13);
        long long v15 = *(_OWORD *)&a4->c;
        long long v20 = *(_OWORD *)&a4->a;
        long long v21 = v15;
        long long v22 = *(_OWORD *)&a4->tx;
        [v14 appendResourcesToCollector:v6 transform:&v20];
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v11);
  }
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  v4 = (TUIRenderModelLayer *)a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
    }
    else
    {
      uint64_t v6 = objc_opt_class();
      TUIDynamicCast(v6, v4);
      v7 = (TUIRenderModelLayer *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;
    BOOL v8 = 1;
    if (self != v4)
    {
      if (!TUIRenderModelIsEqualToRenderModel(self, v7)
        || (submodels = self->_submodels, submodels != v9->_submodels)
        && !-[NSArray isEqual:](submodels, "isEqual:")
        || (config = self->_config, config != v9->_config)
        && !-[TUIRenderModelLayerConfiguring isEqualToConfig:](config, "isEqualToConfig:"))
      {
        BOOL v8 = 0;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(TUIRenderModelLayer *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = +[NSString stringWithFormat:@"<%@ %p submodels=%@ config=%@>", v4, self, self->_submodels, self->_config];

  return (NSString *)v5;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (TUIRenderModelLayerConfiguring)config
{
  return self->_config;
}

- (NSArray)submodels
{
  return self->_submodels;
}

- (UIEdgeInsets)eraseableInsets
{
  double top = self->_eraseableInsets.top;
  double left = self->_eraseableInsets.left;
  double bottom = self->_eraseableInsets.bottom;
  double right = self->_eraseableInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_submodels, 0);

  objc_storeStrong(&self->_renderBlock, 0);
}

@end