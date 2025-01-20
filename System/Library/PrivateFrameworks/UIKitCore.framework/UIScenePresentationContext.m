@interface UIScenePresentationContext
- (BOOL)_isVisibilityPropagationEnabled;
- (BOOL)inheritsSecurity;
- (BOOL)isClippingDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)resizesHostedContext;
- (BOOL)shouldPassthroughHitTestEventsIfTransparent;
- (BOOL)stopsHitTestTransformAccumulation;
- (BOOL)stopsSecureSuperlayersValidation;
- (NSDictionary)layerPresentationOverrides;
- (NSSet)_exclusiveLayerTargetsToInclude;
- (NSSet)_layerTargetsToExclude;
- (NSString)_minificationFilterName;
- (NSString)description;
- (UIColor)backgroundColorWhileHosting;
- (UIColor)backgroundColorWhileNotHosting;
- (UISceneAsynchronousRenderingOptions)asynchronousRenderingOptions;
- (UIScenePresentationContext)_defaultPresentationContext;
- (UIScenePresentationContext)init;
- (UITransformer)hostTransformer;
- (id)_initWithDefaultPresentationContext:(id)a3;
- (id)_initWithDefaultValues;
- (id)_initWithPresentationContext:(id)a3;
- (id)_initWithSettings:(id)a3 defaultPresentationContext:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)appearanceStyle;
- (unint64_t)hash;
- (unint64_t)presentedLayerTypes;
- (unint64_t)renderingMode;
@end

@implementation UIScenePresentationContext

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) renderingMode];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t v6 = [(UIScenePresentationContext *)self renderingMode];
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __38__UIScenePresentationContext_isEqual___block_invoke;
  v99[3] = &unk_1E52EF790;
  id v7 = v4;
  id v100 = v7;
  id v8 = (id)[v5 appendUnsignedInteger:v6 counterpart:v99];
  BOOL v9 = [(UIScenePresentationContext *)self isClippingDisabled];
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __38__UIScenePresentationContext_isEqual___block_invoke_2;
  v97[3] = &unk_1E52DA6B0;
  id v10 = v7;
  id v98 = v10;
  id v11 = (id)[v5 appendBool:v9 counterpart:v97];
  BOOL v12 = [(UIScenePresentationContext *)self _isVisibilityPropagationEnabled];
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __38__UIScenePresentationContext_isEqual___block_invoke_3;
  v95[3] = &unk_1E52DA6B0;
  id v13 = v10;
  id v96 = v13;
  id v14 = (id)[v5 appendBool:v12 counterpart:v95];
  unint64_t v15 = [(UIScenePresentationContext *)self appearanceStyle];
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __38__UIScenePresentationContext_isEqual___block_invoke_4;
  v93[3] = &unk_1E52EF790;
  id v16 = v13;
  id v94 = v16;
  id v17 = (id)[v5 appendUnsignedInteger:v15 counterpart:v93];
  v18 = [(UIScenePresentationContext *)self backgroundColorWhileHosting];
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __38__UIScenePresentationContext_isEqual___block_invoke_5;
  v91[3] = &unk_1E52DCFF8;
  id v19 = v16;
  id v92 = v19;
  id v20 = (id)[v5 appendObject:v18 counterpart:v91];

  v21 = [(UIScenePresentationContext *)self backgroundColorWhileNotHosting];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __38__UIScenePresentationContext_isEqual___block_invoke_6;
  v89[3] = &unk_1E52DCFF8;
  id v22 = v19;
  id v90 = v22;
  id v23 = (id)[v5 appendObject:v21 counterpart:v89];

  v24 = [(UIScenePresentationContext *)self _minificationFilterName];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __38__UIScenePresentationContext_isEqual___block_invoke_7;
  v87[3] = &unk_1E52DCFF8;
  id v25 = v22;
  id v88 = v25;
  id v26 = (id)[v5 appendObject:v24 counterpart:v87];

  unint64_t v27 = [(UIScenePresentationContext *)self presentedLayerTypes];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __38__UIScenePresentationContext_isEqual___block_invoke_8;
  v85[3] = &unk_1E52EF790;
  id v28 = v25;
  id v86 = v28;
  id v29 = (id)[v5 appendUnsignedInteger:v27 counterpart:v85];
  v30 = [(UIScenePresentationContext *)self hostTransformer];
  v31 = [v30 transforms];
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __38__UIScenePresentationContext_isEqual___block_invoke_9;
  v83[3] = &unk_1E52DCFF8;
  id v32 = v28;
  id v84 = v32;
  id v33 = (id)[v5 appendObject:v31 counterpart:v83];

  v34 = [(UIScenePresentationContext *)self layerPresentationOverrides];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __38__UIScenePresentationContext_isEqual___block_invoke_10;
  v81[3] = &unk_1E52DCFF8;
  id v35 = v32;
  id v82 = v35;
  id v36 = (id)[v5 appendObject:v34 counterpart:v81];

  v37 = [(UIScenePresentationContext *)self _exclusiveLayerTargetsToInclude];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __38__UIScenePresentationContext_isEqual___block_invoke_11;
  v79[3] = &unk_1E52DCFF8;
  id v38 = v35;
  id v80 = v38;
  id v39 = (id)[v5 appendObject:v37 counterpart:v79];

  v40 = [(UIScenePresentationContext *)self _layerTargetsToExclude];
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __38__UIScenePresentationContext_isEqual___block_invoke_12;
  v77[3] = &unk_1E52DCFF8;
  id v41 = v38;
  id v78 = v41;
  id v42 = (id)[v5 appendObject:v40 counterpart:v77];

  v43 = [(UIScenePresentationContext *)self asynchronousRenderingOptions];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __38__UIScenePresentationContext_isEqual___block_invoke_13;
  v75[3] = &unk_1E52DCFF8;
  id v44 = v41;
  id v76 = v44;
  id v45 = (id)[v5 appendObject:v43 counterpart:v75];

  BOOL v46 = [(UIScenePresentationContext *)self inheritsSecurity];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __38__UIScenePresentationContext_isEqual___block_invoke_14;
  v73[3] = &unk_1E52DA6B0;
  id v47 = v44;
  id v74 = v47;
  id v48 = (id)[v5 appendBool:v46 counterpart:v73];
  BOOL v49 = [(UIScenePresentationContext *)self resizesHostedContext];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __38__UIScenePresentationContext_isEqual___block_invoke_15;
  v71[3] = &unk_1E52DA6B0;
  id v50 = v47;
  id v72 = v50;
  id v51 = (id)[v5 appendBool:v49 counterpart:v71];
  BOOL v52 = [(UIScenePresentationContext *)self shouldPassthroughHitTestEventsIfTransparent];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __38__UIScenePresentationContext_isEqual___block_invoke_16;
  v69[3] = &unk_1E52DA6B0;
  id v53 = v50;
  id v70 = v53;
  id v54 = (id)[v5 appendBool:v52 counterpart:v69];
  BOOL v55 = [(UIScenePresentationContext *)self stopsHitTestTransformAccumulation];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __38__UIScenePresentationContext_isEqual___block_invoke_17;
  v67[3] = &unk_1E52DA6B0;
  id v56 = v53;
  id v68 = v56;
  id v57 = (id)[v5 appendBool:v55 counterpart:v67];
  BOOL v58 = [(UIScenePresentationContext *)self stopsSecureSuperlayersValidation];
  uint64_t v62 = MEMORY[0x1E4F143A8];
  uint64_t v63 = 3221225472;
  v64 = __38__UIScenePresentationContext_isEqual___block_invoke_18;
  v65 = &unk_1E52DA6B0;
  id v66 = v56;
  id v59 = v56;
  id v60 = (id)[v5 appendBool:v58 counterpart:&v62];
  LOBYTE(v56) = objc_msgSend(v5, "isEqual", v62, v63, v64, v65);

  return (char)v56;
}

- (NSSet)_layerTargetsToExclude
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:11];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    if (v3 == v4) {
      v5 = 0;
    }
    else {
      v5 = v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = [(UIScenePresentationContext *)self->_defaultPresentationContext _layerTargetsToExclude];
  }

  return (NSSet *)v6;
}

- (NSSet)_exclusiveLayerTargetsToInclude
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:10];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    if (v3 == v4) {
      v5 = 0;
    }
    else {
      v5 = v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = [(UIScenePresentationContext *)self->_defaultPresentationContext _exclusiveLayerTargetsToInclude];
  }

  return (NSSet *)v6;
}

- (BOOL)_isVisibilityPropagationEnabled
{
  if ([(BSMutableSettings *)self->_settings flagForSetting:12] == 0x7FFFFFFFFFFFFFFFLL)
  {
    defaultPresentationContext = self->_defaultPresentationContext;
    return [(UIScenePresentationContext *)defaultPresentationContext _isVisibilityPropagationEnabled];
  }
  else
  {
    return BSSettingFlagIsYes();
  }
}

- (UITransformer)hostTransformer
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:6];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    if (v3 == v4) {
      v5 = 0;
    }
    else {
      v5 = v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = [(UIScenePresentationContext *)self->_defaultPresentationContext hostTransformer];
  }

  return (UITransformer *)v6;
}

- (UIColor)backgroundColorWhileNotHosting
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:5];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    if (v3 == v4) {
      v5 = 0;
    }
    else {
      v5 = v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = [(UIScenePresentationContext *)self->_defaultPresentationContext backgroundColorWhileNotHosting];
  }

  return (UIColor *)v6;
}

- (UIColor)backgroundColorWhileHosting
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:4];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    if (v3 == v4) {
      v5 = 0;
    }
    else {
      v5 = v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = [(UIScenePresentationContext *)self->_defaultPresentationContext backgroundColorWhileHosting];
  }

  return (UIColor *)v6;
}

- (BOOL)shouldPassthroughHitTestEventsIfTransparent
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:16];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = [(UIScenePresentationContext *)self->_defaultPresentationContext shouldPassthroughHitTestEventsIfTransparent];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)isClippingDisabled
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:1];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = [(UIScenePresentationContext *)self->_defaultPresentationContext isClippingDisabled];
  }
  BOOL v6 = v5;

  return v6;
}

- (unint64_t)appearanceStyle
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:2];
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 unsignedIntegerValue];
  }
  else {
    uint64_t v5 = [(UIScenePresentationContext *)self->_defaultPresentationContext appearanceStyle];
  }
  unint64_t v6 = v5;

  return v6;
}

- (BOOL)stopsSecureSuperlayersValidation
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:18];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = [(UIScenePresentationContext *)self->_defaultPresentationContext stopsSecureSuperlayersValidation];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)stopsHitTestTransformAccumulation
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:17];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = [(UIScenePresentationContext *)self->_defaultPresentationContext stopsHitTestTransformAccumulation];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)inheritsSecurity
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:14];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = [(UIScenePresentationContext *)self->_defaultPresentationContext inheritsSecurity];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)resizesHostedContext
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:15];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = [(UIScenePresentationContext *)self->_defaultPresentationContext resizesHostedContext];
  }
  BOOL v6 = v5;

  return v6;
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _isVisibilityPropagationEnabled];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) isClippingDisabled];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) appearanceStyle];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) backgroundColorWhileHosting];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentedLayerTypes];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _minificationFilterName];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) backgroundColorWhileNotHosting];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopsSecureSuperlayersValidation];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopsHitTestTransformAccumulation];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) shouldPassthroughHitTestEventsIfTransparent];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) resizesHostedContext];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) inheritsSecurity];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) asynchronousRenderingOptions];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layerTargetsToExclude];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _exclusiveLayerTargetsToInclude];
}

- (unint64_t)renderingMode
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:7];
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 unsignedIntegerValue];
  }
  else {
    uint64_t v5 = [(UIScenePresentationContext *)self->_defaultPresentationContext renderingMode];
  }
  unint64_t v6 = v5;

  return v6;
}

- (UISceneAsynchronousRenderingOptions)asynchronousRenderingOptions
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:13];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    if (v3 == v4) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = [(UIScenePresentationContext *)self->_defaultPresentationContext asynchronousRenderingOptions];
  }

  return (UISceneAsynchronousRenderingOptions *)v6;
}

- (NSString)_minificationFilterName
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:8];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    if (v3 == v4) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = [(UIScenePresentationContext *)self->_defaultPresentationContext _minificationFilterName];
  }

  return (NSString *)v6;
}

- (NSDictionary)layerPresentationOverrides
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:9];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    if (v3 == v4) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = [(UIScenePresentationContext *)self->_defaultPresentationContext layerPresentationOverrides];
  }

  return (NSDictionary *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_defaultPresentationContext, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (id)_initWithPresentationContext:(id)a3
{
  id v4 = (id *)a3;
  uint64_t v5 = (void *)[v4[1] mutableCopy];
  id v6 = [(UIScenePresentationContext *)self _initWithSettings:v5 defaultPresentationContext:v4[2]];

  if (v6)
  {
    uint64_t v7 = [v4[3] mutableCopy];
    id v8 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v7;

    uint64_t v9 = [v4[1] objectForSetting:9];
    if (v9)
    {
      id v10 = (void *)v9;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v10 mutableCopy];

        id v10 = (void *)v11;
      }
      [*((id *)v6 + 1) setObject:v10 forSetting:9];
    }
  }

  return v6;
}

- (id)_initWithSettings:(id)a3 defaultPresentationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIScenePresentationContext;
  id v8 = [(UIScenePresentationContext *)&v12 init];
  if (v8)
  {
    if (v6) {
      uint64_t v9 = (BSMutableSettings *)v6;
    }
    else {
      uint64_t v9 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    }
    settings = v8->_settings;
    v8->_settings = v9;

    objc_storeStrong((id *)&v8->_defaultPresentationContext, a4);
  }

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [UIMutableScenePresentationContext alloc];
  return [(UIScenePresentationContext *)v4 _initWithPresentationContext:self];
}

- (unint64_t)presentedLayerTypes
{
  v3 = [(BSMutableSettings *)self->_settings objectForSetting:3];
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 unsignedIntegerValue];
  }
  else {
    uint64_t v5 = [(UIScenePresentationContext *)self->_defaultPresentationContext presentedLayerTypes];
  }
  unint64_t v6 = v5;

  return v6;
}

id __38__UIScenePresentationContext_isEqual___block_invoke_9(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) hostTransformer];
  v2 = [v1 transforms];

  return v2;
}

- (id)_initWithDefaultPresentationContext:(id)a3
{
  return [(UIScenePresentationContext *)self _initWithSettings:0 defaultPresentationContext:a3];
}

- (id)_initWithDefaultValues
{
  if (qword_1EB260950 != -1) {
    dispatch_once(&qword_1EB260950, &__block_literal_global_243);
  }
  uint64_t v3 = _MergedGlobals_1064;
  return [(UIScenePresentationContext *)self _initWithDefaultPresentationContext:v3];
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) layerPresentationOverrides];
}

- (UIScenePresentationContext)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIScenePresentationContext.m" lineNumber:84 description:@"[UIScenePresentationContext init] is unavailable for use."];

  v6.receiver = self;
  v6.super_class = (Class)UIScenePresentationContext;
  return [(UIScenePresentationContext *)&v6 init];
}

uint64_t __52__UIScenePresentationContext__initWithDefaultValues__block_invoke()
{
  id v0 = [(UIScenePresentationContext *)[UIMutableScenePresentationContext alloc] _initWithSettings:0 defaultPresentationContext:0];
  v1 = (void *)_MergedGlobals_1064;
  _MergedGlobals_1064 = (uint64_t)v0;

  [(id)_MergedGlobals_1064 setClippingDisabled:0];
  [(id)_MergedGlobals_1064 setAppearanceStyle:0];
  [(id)_MergedGlobals_1064 setBackgroundColorWhileHosting:0];
  [(id)_MergedGlobals_1064 setBackgroundColorWhileNotHosting:0];
  [(id)_MergedGlobals_1064 setPresentedLayerTypes:26];
  [(id)_MergedGlobals_1064 setRenderingMode:0];
  [(id)_MergedGlobals_1064 setInheritsSecurity:0];
  [(id)_MergedGlobals_1064 setResizesHostedContext:0];
  [(id)_MergedGlobals_1064 setShouldPassthroughHitTestEventsIfTransparent:0];
  [(id)_MergedGlobals_1064 setStopsHitTestTransformAccumulation:UISelfTaskHasEntitlement(@"com.apple.QuartzCore.system-layers")];
  [(id)_MergedGlobals_1064 setStopsSecureSuperlayersValidation:UISelfTaskHasEntitlement(@"com.apple.QuartzCore.secure-mode")];
  [(id)_MergedGlobals_1064 _setMinificationFilterName:0];
  v2 = (void *)_MergedGlobals_1064;
  return [v2 _setVisibilityPropagationEnabled:0];
}

- (unint64_t)hash
{
  unint64_t v3 = [(UIScenePresentationContext *)self renderingMode];
  unint64_t v4 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) >> 27));
  unint64_t v56 = v4;
  if ([(UIScenePresentationContext *)self isClippingDisabled]) {
    unint64_t v5 = 0xBF58476D1CE4E5B9;
  }
  else {
    unint64_t v5 = 0;
  }
  unint64_t v55 = 0x94D049BB133111EBLL * (v5 ^ (v5 >> 27));
  unint64_t v6 = [(UIScenePresentationContext *)self appearanceStyle];
  unint64_t v54 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  unint64_t v7 = v4 ^ v55 ^ v54;
  id v8 = [(UIScenePresentationContext *)self backgroundColorWhileHosting];
  unint64_t v9 = [v8 hash];
  unint64_t v10 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) >> 27));
  unint64_t v52 = v10;

  uint64_t v11 = [(UIScenePresentationContext *)self backgroundColorWhileNotHosting];
  unint64_t v12 = [v11 hash];
  unint64_t v53 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v12 ^ (v12 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v12 ^ (v12 >> 30))) >> 27));
  unint64_t v13 = v7 ^ v10 ^ v53;

  id v14 = [(UIScenePresentationContext *)self _exclusiveLayerTargetsToInclude];
  unint64_t v15 = [v14 hash];
  unint64_t v16 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v15 ^ (v15 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v15 ^ (v15 >> 30))) >> 27));
  unint64_t v50 = v16;

  id v17 = [(UIScenePresentationContext *)self _layerTargetsToExclude];
  unint64_t v18 = [v17 hash];
  unint64_t v51 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v18 ^ (v18 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v18 ^ (v18 >> 30))) >> 27));

  id v19 = [(UIScenePresentationContext *)self _minificationFilterName];
  unint64_t v20 = [v19 hash];
  unint64_t v49 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v20 ^ (v20 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v20 ^ (v20 >> 30))) >> 27));
  unint64_t v21 = v13 ^ v16 ^ v51 ^ v49;

  unint64_t v22 = [(UIScenePresentationContext *)self presentedLayerTypes];
  unint64_t v23 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v22 ^ (v22 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v22 ^ (v22 >> 30))) >> 27));
  unint64_t v47 = v23;
  v24 = [(UIScenePresentationContext *)self hostTransformer];
  id v25 = [v24 transforms];
  unint64_t v26 = [v25 hash];
  unint64_t v48 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v26 ^ (v26 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v26 ^ (v26 >> 30))) >> 27));

  unint64_t v27 = [(UIScenePresentationContext *)self layerPresentationOverrides];
  unint64_t v28 = [v27 hash];
  unint64_t v46 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v28 ^ (v28 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v28 ^ (v28 >> 30))) >> 27));
  unint64_t v29 = v21 ^ v23 ^ v48 ^ v46;

  if ([(UIScenePresentationContext *)self _isVisibilityPropagationEnabled]) {
    unint64_t v30 = 0xBF58476D1CE4E5B9;
  }
  else {
    unint64_t v30 = 0;
  }
  unint64_t v31 = 0x94D049BB133111EBLL * (v30 ^ (v30 >> 27));
  id v32 = [(UIScenePresentationContext *)self asynchronousRenderingOptions];
  unint64_t v33 = [v32 hash];
  unint64_t v34 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v33 ^ (v33 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v33 ^ (v33 >> 30))) >> 27));

  if ([(UIScenePresentationContext *)self inheritsSecurity]) {
    unint64_t v35 = 0xBF58476D1CE4E5B9;
  }
  else {
    unint64_t v35 = 0;
  }
  unint64_t v36 = 0x94D049BB133111EBLL * (v35 ^ (v35 >> 27));
  if ([(UIScenePresentationContext *)self resizesHostedContext]) {
    unint64_t v37 = 0xBF58476D1CE4E5B9;
  }
  else {
    unint64_t v37 = 0;
  }
  unint64_t v38 = 0x94D049BB133111EBLL * (v37 ^ (v37 >> 27));
  if ([(UIScenePresentationContext *)self shouldPassthroughHitTestEventsIfTransparent])
  {
    unint64_t v39 = 0xBF58476D1CE4E5B9;
  }
  else
  {
    unint64_t v39 = 0;
  }
  unint64_t v40 = 0x94D049BB133111EBLL * (v39 ^ (v39 >> 27));
  unint64_t v41 = v29 ^ v31 ^ v34 ^ v36 ^ v38 ^ v40;
  if ([(UIScenePresentationContext *)self stopsHitTestTransformAccumulation]) {
    unint64_t v42 = 0xBF58476D1CE4E5B9;
  }
  else {
    unint64_t v42 = 0;
  }
  unint64_t v43 = 0x94D049BB133111EBLL * (v42 ^ (v42 >> 27));
  if ([(UIScenePresentationContext *)self stopsSecureSuperlayersValidation]) {
    unint64_t v44 = 0xBF58476D1CE4E5B9;
  }
  else {
    unint64_t v44 = 0;
  }
  return v55 ^ ((v41 ^ v43 ^ (0x94D049BB133111EBLL * (v44 ^ (v44 >> 27)))) >> 31) ^ v56 ^ v54 ^ v52 ^ v53 ^ v50 ^ v51 ^ v49 ^ v47 ^ v48 ^ v31 ^ v46 ^ v36 ^ v34 ^ v38 ^ v40 ^ v43 ^ (0x94D049BB133111EBLL * (v44 ^ (v44 >> 27)));
}

- (NSString)description
{
  return (NSString *)[(UIScenePresentationContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(UIScenePresentationContext *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(UIScenePresentationContext *)self descriptionBuilderWithMultilinePrefix:a3];
  unint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(UIScenePresentationContext *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__UIScenePresentationContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  unint64_t v7 = v11;
  id v8 = v6;

  return v8;
}

void __68__UIScenePresentationContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) presentedLayerTypes];
  v2 = *(void **)(a1 + 40);
  unint64_t v3 = NSStringFromFBSceneLayerTypeMask();
  id v4 = (id)[v2 appendObject:v3 withName:@"hostedLayerTypes"];

  if ([*(id *)(a1 + 32) _isVisibilityPropagationEnabled]) {
    id v5 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 32), "_isVisibilityPropagationEnabled"), @"visibilityPropagationEnabled");
  }
  id v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 32), "isClippingDisabled"), @"isClippingDisabled");
  unint64_t v7 = *(void **)(a1 + 40);
  id v8 = NSStringFromUISceneAppearanceStyle([*(id *)(a1 + 32) appearanceStyle]);
  id v9 = (id)[v7 appendObject:v8 withName:@"appearanceStyle"];

  unint64_t v10 = *(void **)(a1 + 40);
  id v11 = NSStringFromUISceneRenderingMode([*(id *)(a1 + 32) renderingMode]);
  id v12 = (id)[v10 appendObject:v11 withName:@"renderMode"];

  unint64_t v13 = *(void **)(a1 + 40);
  id v14 = [*(id *)(a1 + 32) backgroundColorWhileHosting];
  id v15 = (id)[v13 appendObject:v14 withName:@"BGColorWhileHosting" skipIfNil:1];

  unint64_t v16 = *(void **)(a1 + 40);
  id v17 = [*(id *)(a1 + 32) backgroundColorWhileNotHosting];
  id v18 = (id)[v16 appendObject:v17 withName:@"BGColorWhileNotHosting" skipIfNil:1];

  id v19 = *(void **)(a1 + 40);
  unint64_t v20 = [*(id *)(a1 + 32) hostTransformer];
  id v21 = (id)[v19 appendObject:v20 withName:@"hostTransformer" skipIfNil:1];

  unint64_t v22 = *(void **)(a1 + 40);
  unint64_t v23 = [*(id *)(a1 + 32) asynchronousRenderingOptions];
  id v24 = (id)[v22 appendObject:v23 withName:@"asynchronousRenderingOptions" skipIfNil:1];

  id v25 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "inheritsSecurity"), @"inheritsSecurity", 1);
  id v26 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "resizesHostedContext"), @"resizesHostedContext", 1);
  id v27 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "shouldPassthroughHitTestEventsIfTransparent"), @"shouldPassthroughHitTestEventsIfTransparent", 1);
  id v28 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "stopsHitTestTransformAccumulation"), @"stopsHitTestTransformAccumulation", 1);
  id v29 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "stopsSecureSuperlayersValidation"), @"stopsSecureSuperlayersValidation", 1);
  unint64_t v30 = [*(id *)(a1 + 32) layerPresentationOverrides];
  uint64_t v31 = [v30 count];

  if (v31)
  {
    id v32 = *(void **)(a1 + 40);
    unint64_t v33 = [v32 activeMultilinePrefix];
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    unint64_t v43 = __68__UIScenePresentationContext_descriptionBuilderWithMultilinePrefix___block_invoke_2;
    unint64_t v44 = &unk_1E52D9F98;
    unint64_t v34 = *(void **)(a1 + 40);
    uint64_t v45 = *(void *)(a1 + 32);
    id v46 = v34;
    [v32 appendBodySectionWithName:@"layerPresentationContexts" multilinePrefix:v33 block:&v41];
  }
  unint64_t v35 = *(void **)(a1 + 40);
  unint64_t v36 = objc_msgSend(*(id *)(a1 + 32), "_exclusiveLayerTargetsToInclude", v41, v42, v43, v44, v45);
  unint64_t v37 = [v36 allObjects];
  [v35 appendArraySection:v37 withName:@"exclusiveLayerTargetsToInclude" skipIfEmpty:1];

  unint64_t v38 = *(void **)(a1 + 40);
  unint64_t v39 = [*(id *)(a1 + 32) _layerTargetsToExclude];
  unint64_t v40 = [v39 allObjects];
  [v38 appendArraySection:v40 withName:@"layerTargetsToExclude" skipIfEmpty:1];
}

void __68__UIScenePresentationContext_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layerPresentationOverrides];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__UIScenePresentationContext_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v3[3] = &unk_1E52EF5F8;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __68__UIScenePresentationContext_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = [a2 description];
  id v7 = (id)[v5 appendObject:v8 withName:v6];
}

- (UIScenePresentationContext)_defaultPresentationContext
{
  return self->_defaultPresentationContext;
}

@end