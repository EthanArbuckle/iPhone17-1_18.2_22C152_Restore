@interface UISceneLayerPresentationContext
- (BOOL)_isEqualToDefaultContext;
- (BOOL)isClippingDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (NSString)_minificationFilterName;
- (NSString)description;
- (UISceneLayerPresentationContext)init;
- (UITransformer)transformer;
- (double)alpha;
- (id)_initWithSceneLayerPresentationContext:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)renderingMode;
- (void)_setMinificationFilterName:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setClippingDisabled:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setRenderingMode:(unint64_t)a3;
- (void)setTransformer:(id)a3;
@end

@implementation UISceneLayerPresentationContext

- (UITransformer)transformer
{
  return self->_transformer;
}

- (BOOL)isClippingDisabled
{
  return self->_clippingDisabled;
}

- (double)alpha
{
  return self->_alpha;
}

- (UISceneLayerPresentationContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)UISceneLayerPresentationContext;
  v2 = [(UISceneLayerPresentationContext *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_hidden = 0;
    transformer = v2->_transformer;
    v2->_transformer = 0;
    v2->_alpha = 1.0;

    v3->_clippingDisabled = 0;
    minificationFilterName = v3->_minificationFilterName;
    v3->_renderingMode = 0;
    v3->_minificationFilterName = 0;
  }
  return v3;
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (NSString)_minificationFilterName
{
  return self->_minificationFilterName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minificationFilterName, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
}

- (id)_initWithSceneLayerPresentationContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UISceneLayerPresentationContext;
  v5 = [(UISceneLayerPresentationContext *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_alpha = *((double *)v4 + 2);
    v5->_hidden = *((unsigned char *)v4 + 24);
    objc_storeStrong((id *)&v5->_transformer, *((id *)v4 + 1));
    v6->_clippingDisabled = *((unsigned char *)v4 + 25);
    v6->_renderingMode = *((void *)v4 + 4);
    uint64_t v7 = [*((id *)v4 + 5) copy];
    minificationFilterName = v6->_minificationFilterName;
    v6->_minificationFilterName = (NSString *)v7;
  }
  return v6;
}

- (BOOL)_isEqualToDefaultContext
{
  if (qword_1EB260910 != -1) {
    dispatch_once(&qword_1EB260910, &__block_literal_global_240);
  }
  v3 = (void *)_MergedGlobals_1061;
  return [v3 isEqual:self];
}

void __59__UISceneLayerPresentationContext__isEqualToDefaultContext__block_invoke()
{
  v0 = objc_alloc_init(UISceneLayerPresentationContext);
  v1 = (void *)_MergedGlobals_1061;
  _MergedGlobals_1061 = (uint64_t)v0;
}

- (NSString)description
{
  return (NSString *)[(UISceneLayerPresentationContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(UISceneLayerPresentationContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [NSNumber numberWithDouble:self->_alpha];
  id v5 = (id)[v3 appendObject:v4 withName:@"alpha"];

  id v6 = (id)[v3 appendObject:self->_transformer withName:@"transformer"];
  id v7 = (id)[v3 appendBool:self->_hidden withName:@"hidden"];
  id v8 = (id)[v3 appendBool:self->_clippingDisabled withName:@"clippingDisabled"];
  v9 = NSStringFromUISceneRenderingMode([(UISceneLayerPresentationContext *)self renderingMode]);
  id v10 = (id)[v3 appendObject:v9 withName:@"renderMode"];

  id v11 = (id)[v3 appendObject:self->_minificationFilterName withName:@"minificationFilterName" skipIfNil:1];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UISceneLayerPresentationContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (unint64_t)hash
{
  unint64_t alpha = (unint64_t)self->_alpha;
  unint64_t v4 = self->_hidden + (unint64_t)self->_clippingDisabled;
  unint64_t v5 = v4 + [(UITransformer *)self->_transformer hash] + alpha;
  unint64_t v6 = [(UISceneLayerPresentationContext *)self renderingMode];
  uint64_t v7 = v5 - v6 + 8 * v6;
  id v8 = [(UISceneLayerPresentationContext *)self _minificationFilterName];
  unint64_t v9 = v7 + [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  transformer = self->_transformer;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __43__UISceneLayerPresentationContext_isEqual___block_invoke;
  v38[3] = &unk_1E52DCFF8;
  id v7 = v4;
  id v39 = v7;
  id v8 = (id)[v5 appendObject:transformer counterpart:v38];
  BOOL hidden = self->_hidden;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __43__UISceneLayerPresentationContext_isEqual___block_invoke_2;
  v36[3] = &unk_1E52DA6B0;
  id v10 = v7;
  id v37 = v10;
  id v11 = (id)[v5 appendBool:hidden counterpart:v36];
  BOOL clippingDisabled = self->_clippingDisabled;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __43__UISceneLayerPresentationContext_isEqual___block_invoke_3;
  v34[3] = &unk_1E52DA6B0;
  id v13 = v10;
  id v35 = v13;
  id v14 = (id)[v5 appendBool:clippingDisabled counterpart:v34];
  double alpha = self->_alpha;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __43__UISceneLayerPresentationContext_isEqual___block_invoke_4;
  v32[3] = &unk_1E52DCFA8;
  id v16 = v13;
  id v33 = v16;
  id v17 = (id)[v5 appendCGFloat:v32 counterpart:alpha];
  unint64_t v18 = [(UISceneLayerPresentationContext *)self renderingMode];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __43__UISceneLayerPresentationContext_isEqual___block_invoke_5;
  v30[3] = &unk_1E52EF790;
  id v19 = v16;
  id v31 = v19;
  id v20 = (id)[v5 appendUnsignedInteger:v18 counterpart:v30];
  v21 = [(UISceneLayerPresentationContext *)self _minificationFilterName];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __43__UISceneLayerPresentationContext_isEqual___block_invoke_6;
  v28 = &unk_1E52DCFF8;
  id v29 = v19;
  id v22 = v19;
  id v23 = (id)[v5 appendObject:v21 counterpart:&v25];

  LOBYTE(v21) = objc_msgSend(v5, "isEqual", v25, v26, v27, v28);
  return (char)v21;
}

id __43__UISceneLayerPresentationContext_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

uint64_t __43__UISceneLayerPresentationContext_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 24);
}

uint64_t __43__UISceneLayerPresentationContext_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 25);
}

double __43__UISceneLayerPresentationContext_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 16);
}

uint64_t __43__UISceneLayerPresentationContext_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) renderingMode];
}

uint64_t __43__UISceneLayerPresentationContext_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _minificationFilterName];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [UIMutableSceneLayerPresentationContext alloc];
  return [(UISceneLayerPresentationContext *)v4 _initWithSceneLayerPresentationContext:self];
}

- (void)setTransformer:(id)a3
{
}

- (void)setAlpha:(double)a3
{
  self->_double alpha = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_BOOL hidden = a3;
}

- (void)setClippingDisabled:(BOOL)a3
{
  self->_BOOL clippingDisabled = a3;
}

- (void)setRenderingMode:(unint64_t)a3
{
  self->_renderingMode = a3;
}

- (void)_setMinificationFilterName:(id)a3
{
}

@end