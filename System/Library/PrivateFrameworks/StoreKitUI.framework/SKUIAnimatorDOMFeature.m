@interface SKUIAnimatorDOMFeature
+ (id)featureName;
+ (id)makeFeatureJSObjectForFeature:(id)a3;
+ (void)featureName;
- (IKAppContext)appContext;
- (NSString)featureName;
- (SKUIAnimatorDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4;
- (SKUIAnimatorDOMFeatureDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation SKUIAnimatorDOMFeature

- (SKUIAnimatorDOMFeature)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIAnimatorDOMFeature initWithDOMNode:featureName:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIAnimatorDOMFeature;
  v16 = [(SKUIAnimatorDOMFeature *)&v21 init];
  if (v16)
  {
    v17 = [v6 appContext];
    objc_storeWeak((id *)&v16->_appContext, v17);

    uint64_t v18 = [v7 copy];
    featureName = v16->_featureName;
    v16->_featureName = (NSString *)v18;
  }
  return v16;
}

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIAnimatorDOMFeature makeFeatureJSObjectForFeature:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = [SKJSUIAnimatorDOMFeature alloc];
  uint64_t v13 = [v3 appContext];
  uint64_t v14 = [(SKJSUIAnimatorDOMFeature *)v12 initWithAppContext:v13 DOMFeature:v3];

  return v14;
}

+ (id)featureName
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIAnimatorDOMFeature featureName]();
  }
  return @"animator";
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);

  return (IKAppContext *)WeakRetained;
}

- (SKUIAnimatorDOMFeatureDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIAnimatorDOMFeatureDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDOMNode:(uint64_t)a3 featureName:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)makeFeatureJSObjectForFeature:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)featureName
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIAnimatorDOMFeature featureName]";
}

@end