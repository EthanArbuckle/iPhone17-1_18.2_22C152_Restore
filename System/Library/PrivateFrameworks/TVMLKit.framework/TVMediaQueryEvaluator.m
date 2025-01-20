@interface TVMediaQueryEvaluator
+ (id)_mobileGestaltStringForKey:(__CFString *)a3;
+ (id)_productType;
+ (id)evaluatorForTemplateElement:(id)a3 inWindow:(id)a4;
+ (id)evaluatorForTemplateElement:(id)a3 inWindow:(id)a4 traitEnvironment:(id)a5;
- (BOOL)_evaluateAllMediaFeatureType:(id)a3 withValue:(id)a4;
- (BOOL)_evaluateDeviceFeatureType:(id)a3 withValue:(id)a4;
- (BOOL)_evaluateTemplateFeatureType:(id)a3 withValue:(id)a4;
- (BOOL)evaluateMediaQuery:(id)a3;
- (IKViewElement)templateElement;
- (TVMediaQueryEvaluator)initWithTemplateElement:(id)a3;
- (TVMediaQueryEvaluator)initWithTemplateElement:(id)a3 inWindow:(id)a4;
- (TVMediaQueryEvaluator)initWithTemplateElement:(id)a3 inWindow:(id)a4 traitEnvironment:(id)a5;
- (TVMediaQueryEvaluatorDelegate)delegate;
- (UITraitEnvironment)traitEnvironment;
- (_TVWindowSizeAdaptor)windowSizeAdaptor;
- (void)setDelegate:(id)a3;
- (void)setTemplateElement:(id)a3;
@end

@implementation TVMediaQueryEvaluator

+ (id)evaluatorForTemplateElement:(id)a3 inWindow:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() evaluatorForTemplateElement:v6 inWindow:v5 traitEnvironment:0];

  return v7;
}

+ (id)evaluatorForTemplateElement:(id)a3 inWindow:(id)a4 traitEnvironment:(id)a5
{
  uint64_t v8 = evaluatorForTemplateElement_inWindow_traitEnvironment__onceToken;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if (v8 != -1) {
    dispatch_once(&evaluatorForTemplateElement_inWindow_traitEnvironment__onceToken, &__block_literal_global_37);
  }
  v12 = (void *)evaluatorForTemplateElement_inWindow_traitEnvironment__evaluatorClassByTemplate;
  v13 = [v11 elementName];
  v14 = [v12 objectForKey:v13];
  if (v14) {
    a1 = v14;
  }

  v15 = (void *)[objc_alloc((Class)a1) initWithTemplateElement:v11 inWindow:v10 traitEnvironment:v9];
  return v15;
}

void __79__TVMediaQueryEvaluator_evaluatorForTemplateElement_inWindow_traitEnvironment___block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v2 = @"stackTemplate";
  v3[0] = objc_opt_class();
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)evaluatorForTemplateElement_inWindow_traitEnvironment__evaluatorClassByTemplate;
  evaluatorForTemplateElement_inWindow_traitEnvironment__evaluatorClassByTemplate = v0;
}

- (TVMediaQueryEvaluator)initWithTemplateElement:(id)a3
{
  return [(TVMediaQueryEvaluator *)self initWithTemplateElement:a3 inWindow:0];
}

- (TVMediaQueryEvaluator)initWithTemplateElement:(id)a3 inWindow:(id)a4
{
  return [(TVMediaQueryEvaluator *)self initWithTemplateElement:a3 inWindow:a4 traitEnvironment:a4];
}

- (TVMediaQueryEvaluator)initWithTemplateElement:(id)a3 inWindow:(id)a4 traitEnvironment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TVMediaQueryEvaluator;
  v12 = [(TVMediaQueryEvaluator *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_templateElement, a3);
    if (v11) {
      v14 = v11;
    }
    else {
      v14 = v10;
    }
    objc_storeWeak((id *)&v13->_traitEnvironment, v14);
    if (v10)
    {
      v15 = [[_TVWindowSizeAdaptor alloc] initWithWindow:v10];
      windowSizeAdaptor = v13->_windowSizeAdaptor;
      v13->_windowSizeAdaptor = v15;
    }
    *(unsigned char *)&v13->_implFlags = *(unsigned char *)&v13->_implFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  }

  return v13;
}

- (BOOL)evaluateMediaQuery:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v5 = [v4 mediaType];
  if (IsTemplateMediaType(v5))
  {
    id v6 = [(TVMediaQueryEvaluator *)self templateElement];
    *((unsigned char *)v22 + 24) = v6 != 0;

    v7 = v20;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    uint64_t v8 = __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke;
  }
  else if ([v5 isEqualToString:@"-tv-device"])
  {
    *((unsigned char *)v22 + 24) = 1;
    v7 = v19;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    uint64_t v8 = __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke_2;
  }
  else
  {
    if (![v5 isEqualToString:*MEMORY[0x263F4B310]])
    {
      id v9 = 0;
      goto LABEL_8;
    }
    *((unsigned char *)v22 + 24) = 1;
    v7 = v18;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    uint64_t v8 = __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke_3;
  }
  v7[2] = v8;
  v7[3] = &unk_264BA8120;
  v7[4] = self;
  id v9 = (void *)MEMORY[0x230FC9DC0]();
LABEL_8:
  id v10 = [v4 featureValues];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke_4;
  v14[3] = &unk_264BA8148;
  v14[4] = self;
  id v11 = v5;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  v17 = &v21;
  [v10 enumerateKeysAndObjectsUsingBlock:v14];

  LOBYTE(v10) = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v10;
}

uint64_t __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) _evaluateTemplateFeatureType:v5 withValue:v6]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = [*(id *)(a1 + 32) _evaluateAllMediaFeatureType:v5 withValue:v6];
  }

  return v7;
}

uint64_t __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _evaluateDeviceFeatureType:a2 withValue:a3];
}

uint64_t __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _evaluateAllMediaFeatureType:a2 withValue:a3];
}

void __44__TVMediaQueryEvaluator_evaluateMediaQuery___block_invoke_4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  char v15 = 0;
  uint64_t v9 = [*(id *)(a1 + 32) delegate];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [*(id *)(a1 + 32) delegate];
    char v12 = [v11 evaluator:*(void *)(a1 + 32) evaluteForMediaType:*(void *)(a1 + 40) featureType:v7 value:v8 result:&v15];

    if (v12) {
      goto LABEL_8;
    }
  }
  if (v13 = *(unsigned char **)(a1 + 32), (v13[16])
    && ([v13 evaluteForMediaType:*(void *)(a1 + 40) featureType:v7 value:v8 result:&v15] & 1) != 0
    || (uint64_t v14 = *(void *)(a1 + 48)) == 0)
  {
LABEL_8:
    if (!v15)
    {
LABEL_9:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else if (!(*(unsigned int (**)(uint64_t, id, id))(v14 + 16))(v14, v7, v8))
  {
    goto LABEL_9;
  }
}

+ (id)_productType
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__TVMediaQueryEvaluator__productType__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_productType_onceToken != -1) {
    dispatch_once(&_productType_onceToken, block);
  }
  v2 = (void *)_productType_productType;
  return v2;
}

uint64_t __37__TVMediaQueryEvaluator__productType__block_invoke()
{
  uint64_t v0 = [(id)objc_opt_class() _mobileGestaltStringForKey:@"ProductType"];
  v1 = (void *)_productType_productType;
  _productType_productType = v0;

  uint64_t v2 = [(id)_productType_productType stringByReplacingOccurrencesOfString:@"," withString:@"-"];
  uint64_t v3 = _productType_productType;
  _productType_productType = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

- (BOOL)_evaluateDeviceFeatureType:(id)a3 withValue:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"-tv-product-type"])
  {
    id v6 = [(id)objc_opt_class() _productType];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_evaluateTemplateFeatureType:(id)a3 withValue:(id)a4
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:@"-tv-uber"] & 1) != 0
    || ([v6 isEqualToString:@"-tv-banner"] & 1) != 0
    || [v6 isEqualToString:@"-tv-hero-img"])
  {
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    v70 = self;
    id v8 = [(TVMediaQueryEvaluator *)self templateElement];
    uint64_t v9 = [v8 unfilteredChildren];

    id v10 = (id)[v9 countByEnumeratingWithState:&v99 objects:v110 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v100;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v100 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v99 + 1) + 8 * i);
          if (objc_msgSend(v13, "tv_elementType") == 12)
          {
            id v10 = v13;
            goto LABEL_14;
          }
        }
        id v10 = (id)[v9 countByEnumeratingWithState:&v99 objects:v110 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    uint64_t v14 = [v10 unfilteredChildren];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v95 objects:v109 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v96;
      while (2)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v96 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v95 + 1) + 8 * j);
          if (objc_msgSend(v19, "tv_elementType") == 16 && objc_msgSend(v19, "tv_imageType") == 3)
          {
            id v20 = v19;
            goto LABEL_25;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v95 objects:v109 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    id v20 = 0;
LABEL_25:

    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v21 = [v10 unfilteredChildren];
    id v22 = (id)[v21 countByEnumeratingWithState:&v91 objects:v108 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v92;
      while (2)
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(void *)v92 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v91 + 1) + 8 * (void)k);
          if (objc_msgSend(v25, "tv_elementType") == 4)
          {
            id v22 = v25;
            goto LABEL_35;
          }
        }
        id v22 = (id)[v21 countByEnumeratingWithState:&v91 objects:v108 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
LABEL_35:

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    v26 = [v22 unfilteredChildren];
    id v27 = (id)[v26 countByEnumeratingWithState:&v87 objects:v107 count:16];
    if (v27)
    {
      id v28 = v20;
      uint64_t v29 = *(void *)v88;
      while (2)
      {
        for (m = 0; m != v27; m = (char *)m + 1)
        {
          if (*(void *)v88 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v87 + 1) + 8 * (void)m);
          if (objc_msgSend(v31, "tv_elementType") == 16 && !objc_msgSend(v31, "tv_imageType"))
          {
            id v27 = v31;
            goto LABEL_46;
          }
        }
        id v27 = (id)[v26 countByEnumeratingWithState:&v87 objects:v107 count:16];
        if (v27) {
          continue;
        }
        break;
      }
LABEL_46:
      id v20 = v28;
    }

    if ([v6 isEqualToString:@"-tv-uber"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v69 = v20;
        if (v27) {
          goto LABEL_106;
        }
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        v32 = [(TVMediaQueryEvaluator *)v70 templateElement];
        v33 = [v32 unfilteredChildren];

        uint64_t v34 = [v33 countByEnumeratingWithState:&v83 objects:v106 count:16];
        id v68 = v7;
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v84;
          while (2)
          {
            for (uint64_t n = 0; n != v35; ++n)
            {
              if (*(void *)v84 != v36) {
                objc_enumerationMutation(v33);
              }
              v38 = *(void **)(*((void *)&v83 + 1) + 8 * n);
              if (objc_msgSend(v38, "tv_elementType") == 4)
              {
                long long v81 = 0u;
                long long v82 = 0u;
                long long v79 = 0u;
                long long v80 = 0u;
                v48 = [v38 unfilteredChildren];
                id v39 = (id)[v48 countByEnumeratingWithState:&v79 objects:v105 count:16];
                if (v39)
                {
                  uint64_t v49 = *(void *)v80;
                  while (2)
                  {
                    for (ii = 0; ii != v39; ii = (char *)ii + 1)
                    {
                      if (*(void *)v80 != v49) {
                        objc_enumerationMutation(v48);
                      }
                      v51 = *(void **)(*((void *)&v79 + 1) + 8 * (void)ii);
                      if (objc_msgSend(v51, "tv_elementType") == 16 && !objc_msgSend(v51, "tv_imageType"))
                      {
                        id v39 = v51;
                        goto LABEL_104;
                      }
                    }
                    id v39 = (id)[v48 countByEnumeratingWithState:&v79 objects:v105 count:16];
                    if (v39) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_104:

                goto LABEL_105;
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v83 objects:v106 count:16];
            if (v35) {
              continue;
            }
            break;
          }
        }
        id v39 = 0;
LABEL_105:

        v59 = [v39 style];
        v60 = objc_msgSend(v59, "tv_imageTreatment");
        int v61 = [v60 isEqualToString:@"blurOverlay"];

        id v7 = v68;
        if (v61)
        {
LABEL_106:
          v62 = [(TVMediaQueryEvaluator *)v70 templateElement];
          v63 = [v62 elementName];
          int v64 = [v63 isEqualToString:@"compilationTemplate"];

          if (v64)
          {
            v65 = [v10 attributes];
            v66 = [v65 objectForKeyedSubscript:@"floating"];

            if ([v66 length]) {
              int v41 = [v66 BOOLValue];
            }
            else {
              int v41 = 1;
            }
            id v20 = v69;

            goto LABEL_114;
          }
          int v41 = 1;
        }
        else
        {
          int v41 = 0;
        }
        id v20 = v69;
LABEL_114:

        LOBYTE(v41) = v41 != 0;
        goto LABEL_115;
      }
    }
    if ([v6 isEqualToString:@"-tv-banner"]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v40 = v10 == 0;
    }
    else
    {
      if (![v6 isEqualToString:@"-tv-hero-img"]
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        int v41 = 0;
        goto LABEL_114;
      }
      BOOL v40 = v20 == 0;
    }
    int v41 = !v40;
    goto LABEL_114;
  }
  if ([v6 isEqualToString:@"-tv-bg-uber"])
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v42 = [(TVMediaQueryEvaluator *)self templateElement];
    v43 = [v42 unfilteredChildren];

    id v44 = (id)[v43 countByEnumeratingWithState:&v75 objects:v104 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v76;
      while (2)
      {
        for (juint64_t j = 0; jj != v44; juint64_t j = (char *)jj + 1)
        {
          if (*(void *)v76 != v45) {
            objc_enumerationMutation(v43);
          }
          v47 = *(void **)(*((void *)&v75 + 1) + 8 * (void)jj);
          if (objc_msgSend(v47, "tv_elementType") == 4)
          {
            id v44 = v47;
            goto LABEL_91;
          }
        }
        id v44 = (id)[v43 countByEnumeratingWithState:&v75 objects:v104 count:16];
        if (v44) {
          continue;
        }
        break;
      }
    }
LABEL_91:

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v52 = [v44 unfilteredChildren];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v71 objects:v103 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v72;
      while (2)
      {
        for (uint64_t kk = 0; kk != v54; ++kk)
        {
          if (*(void *)v72 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = *(void **)(*((void *)&v71 + 1) + 8 * kk);
          if (objc_msgSend(v57, "tv_elementType") == 16 && !objc_msgSend(v57, "tv_imageType"))
          {
            BOOL v58 = v57 != 0;
            goto LABEL_102;
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v71 objects:v103 count:16];
        if (v54) {
          continue;
        }
        break;
      }
    }
    BOOL v58 = 0;
LABEL_102:

    objc_opt_class();
    int v41 = v58 & objc_opt_isKindOfClass();
  }
  else
  {
    LOBYTE(v41) = 0;
  }
LABEL_115:

  return v41;
}

- (BOOL)_evaluateAllMediaFeatureType:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF9D0] null];
  if (v8 != v7 && [v7 length]
    || ([v6 isEqualToString:@"ax-text"] & 1) != 0
    || ([v6 isEqualToString:@"small"] & 1) != 0)
  {
  }
  else
  {
    char v20 = [v6 isEqualToString:@"large"];

    if ((v20 & 1) == 0)
    {
      char v21 = 0;
      goto LABEL_105;
    }
  }
  if (_evaluateAllMediaFeatureType_withValue__onceToken != -1) {
    dispatch_once(&_evaluateAllMediaFeatureType_withValue__onceToken, &__block_literal_global_169);
  }
  uint64_t v9 = [(id)_evaluateAllMediaFeatureType_withValue__sFeatureLookup objectForKeyedSubscript:v6];
  uint64_t v10 = [v9 unsignedIntegerValue];

  uint64_t v11 = [(TVMediaQueryEvaluator *)self traitEnvironment];
  char v12 = [v11 traitCollection];

  [(_TVWindowSizeAdaptor *)self->_windowSizeAdaptor adjustedWindowSize];
  double v14 = v13;
  double v16 = v15;
  switch(v10)
  {
    case 0:
      uint64_t v17 = [(TVMediaQueryEvaluator *)self templateElement];
      if (v17)
      {
        objc_super v18 = [(TVMediaQueryEvaluator *)self templateElement];
        uint64_t v19 = +[TVMLUtilities interfaceStyleForTemplateElement:v18];
      }
      else
      {
        uint64_t v19 = [v12 userInterfaceStyle];
      }

      id v68 = @"dark";
      if (v19 != 2) {
        id v68 = 0;
      }
      if (v19 == 1) {
        v52 = @"light";
      }
      else {
        v52 = v68;
      }
      goto LABEL_98;
    case 1:
      uint64_t v22 = [v7 integerValue];
      [v12 displayScale];
      BOOL v24 = v22 == (uint64_t)v23;
      goto LABEL_20;
    case 2:
      uint64_t v25 = [v7 integerValue];
      [v12 displayScale];
      char v21 = v25 <= (uint64_t)v26;
      goto LABEL_104;
    case 3:
      uint64_t v27 = [v7 integerValue];
      [v12 displayScale];
      BOOL v29 = v27 < (uint64_t)v28;
      goto LABEL_24;
    case 4:
      [v7 floatValue];
      BOOL v24 = v14 == v30;
      goto LABEL_20;
    case 5:
      [v7 floatValue];
      BOOL v29 = v14 < v31;
      goto LABEL_24;
    case 6:
      [v7 floatValue];
      BOOL v33 = v14 > v32;
      goto LABEL_28;
    case 7:
      [v7 floatValue];
      BOOL v24 = v16 == v34;
LABEL_20:
      char v21 = v24;
      goto LABEL_104;
    case 8:
      [v7 floatValue];
      BOOL v29 = v16 < v35;
LABEL_24:
      char v21 = !v29;
      goto LABEL_104;
    case 9:
      [v7 floatValue];
      BOOL v33 = v16 > v36;
LABEL_28:
      char v21 = !v33;
      goto LABEL_104;
    case 10:
      [v7 floatValue];
      double v38 = v37;
      id v39 = [MEMORY[0x263F1C920] mainScreen];
      [v39 bounds];
      double Width = CGRectGetWidth(v75);
      goto LABEL_35;
    case 11:
      [v7 floatValue];
      double v42 = v41;
      id v39 = [MEMORY[0x263F1C920] mainScreen];
      [v39 bounds];
      double v43 = CGRectGetWidth(v76);
      goto LABEL_39;
    case 12:
      [v7 floatValue];
      double v45 = v44;
      id v39 = [MEMORY[0x263F1C920] mainScreen];
      [v39 bounds];
      double Height = CGRectGetWidth(v77);
      goto LABEL_37;
    case 13:
      [v7 floatValue];
      double v38 = v47;
      id v39 = [MEMORY[0x263F1C920] mainScreen];
      [v39 bounds];
      double Width = CGRectGetHeight(v78);
LABEL_35:
      char v21 = Width == v38;
      goto LABEL_103;
    case 14:
      [v7 floatValue];
      double v45 = v48;
      id v39 = [MEMORY[0x263F1C920] mainScreen];
      [v39 bounds];
      double Height = CGRectGetHeight(v79);
LABEL_37:
      char v21 = Height >= v45;
      goto LABEL_103;
    case 15:
      [v7 floatValue];
      double v42 = v49;
      id v39 = [MEMORY[0x263F1C920] mainScreen];
      [v39 bounds];
      double v43 = CGRectGetHeight(v80);
LABEL_39:
      char v21 = v43 <= v42;
      goto LABEL_103;
    case 16:
      v50 = [MEMORY[0x263F1C5C0] currentDevice];
      unint64_t v51 = [v50 userInterfaceIdiom];

      if (v51 > 2) {
        v52 = 0;
      }
      else {
        v52 = off_264BA8168[v51];
      }
      goto LABEL_98;
    case 17:
      id v39 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v53 = [v39 systemVersion];
      BOOL v54 = [v53 compare:v7 options:64] == 0;
      goto LABEL_61;
    case 18:
      id v39 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v53 = [v39 systemVersion];
      BOOL v55 = [v53 compare:v7 options:64] == -1;
      goto LABEL_45;
    case 19:
      id v39 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v53 = [v39 systemVersion];
      BOOL v55 = [v53 compare:v7 options:64] == 1;
LABEL_45:
      char v21 = !v55;
      goto LABEL_102;
    case 20:
      v56 = [(TVMediaQueryEvaluator *)self templateElement];
      int64_t v57 = +[TVMLUtilities semanticContentAttributeForTemplateElement:v56];

      v52 = @"ltr";
      if (v57 != 3)
      {
        if (v57 == 4)
        {
          v52 = @"rtl";
        }
        else
        {
          uint64_t v69 = [(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection];
          v70 = @"rtl";
          if (v69 != 1) {
            v70 = 0;
          }
          if (v69) {
            v52 = v70;
          }
        }
      }
LABEL_98:
      id v39 = [v7 lowercaseString];
      v59 = v52;
      goto LABEL_99;
    case 21:
      if ([v12 horizontalSizeClass] == 1) {
        goto LABEL_54;
      }
      uint64_t v58 = [v12 horizontalSizeClass];
      goto LABEL_69;
    case 22:
      if ([v12 verticalSizeClass] == 1)
      {
LABEL_54:
        id v39 = [v7 lowercaseString];
        v59 = @"compact";
        goto LABEL_99;
      }
      uint64_t v58 = [v12 verticalSizeClass];
LABEL_69:
      if (v58 != 2) {
        goto LABEL_73;
      }
      id v39 = [v7 lowercaseString];
      v59 = @"regular";
      goto LABEL_99;
    case 23:
      uint64_t v60 = [(id)*MEMORY[0x263F1D020] interfaceOrientation];
      if ((unint64_t)(v60 - 1) > 1)
      {
        if ((unint64_t)(v60 - 3) > 1)
        {
LABEL_73:
          char v21 = 0;
          goto LABEL_104;
        }
        id v39 = [v7 lowercaseString];
        v59 = @"landscape";
      }
      else
      {
        id v39 = [v7 lowercaseString];
        v59 = @"portrait";
      }
LABEL_99:
      char v21 = [(__CFString *)v59 isEqualToString:v39];
      goto LABEL_103;
    case 24:
      id v39 = [v7 lowercaseString];
      if ([@"phone" isEqual:v39])
      {
        uint64_t v53 = [MEMORY[0x263F1C5C0] currentDevice];
        uint64_t v61 = [v53 userInterfaceIdiom];
        BOOL v54 = v14 <= 639.0 || v61 == 0;
LABEL_61:
        char v21 = v54;
      }
      else if ([@"pad" isEqual:v39])
      {
        uint64_t v53 = [MEMORY[0x263F1C5C0] currentDevice];
        uint64_t v65 = [v53 userInterfaceIdiom];
        BOOL v67 = v14 > 639.0 && v65 == 1;
        if (v14 == 1366.0) {
          BOOL v67 = 0;
        }
        char v21 = v16 != 1366.0 && v67;
      }
      else
      {
        if (![@"pad-l" isEqual:v39]) {
          goto LABEL_111;
        }
        uint64_t v72 = [(id)*MEMORY[0x263F1D020] interfaceOrientation];
        uint64_t v53 = [MEMORY[0x263F1C5C0] currentDevice];
        if ([v53 userInterfaceIdiom] == 1)
        {
          if ((unint64_t)(v72 - 3) <= 1 && v14 == 1366.0)
          {
            char v21 = 1;
          }
          else
          {
            BOOL v74 = v16 == 1366.0 && (unint64_t)(v72 - 1) < 2;
            char v21 = v14 == 1024.0 && v74;
          }
        }
        else
        {
          char v21 = 0;
        }
      }
      goto LABEL_102;
    case 25:
      id v39 = [v7 lowercaseString];
      if ([@"small" isEqual:v39])
      {
        uint64_t v53 = [MEMORY[0x263F1C408] sharedApplication];
        v62 = [v53 preferredContentSizeCategory];
        if (UIContentSizeCategoryCompareToCategory(v62, (UIContentSizeCategory)*MEMORY[0x263F1D160]) == NSOrderedDescending)
        {
          v63 = [MEMORY[0x263F1C408] sharedApplication];
          int v64 = [v63 preferredContentSizeCategory];
          char v21 = UIContentSizeCategoryCompareToCategory(v64, (UIContentSizeCategory)*MEMORY[0x263F1D140]) == NSOrderedAscending;
        }
        else
        {
          char v21 = 0;
        }
      }
      else
      {
        if (![@"large" isEqual:v39])
        {
LABEL_111:
          char v21 = 0;
          goto LABEL_103;
        }
        uint64_t v53 = [MEMORY[0x263F1C408] sharedApplication];
        v62 = [v53 preferredContentSizeCategory];
        char v21 = UIContentSizeCategoryCompareToCategory(v62, (UIContentSizeCategory)*MEMORY[0x263F1D148]) == NSOrderedDescending;
      }

LABEL_102:
LABEL_103:

LABEL_104:
      break;
    default:
      goto LABEL_73;
  }
LABEL_105:

  return v21;
}

void __64__TVMediaQueryEvaluator__evaluateAllMediaFeatureType_withValue___block_invoke()
{
  v3[28] = *MEMORY[0x263EF8340];
  v2[0] = @"appearance";
  v2[1] = @"-tv-theme";
  v3[0] = &unk_26E59E530;
  v3[1] = &unk_26E59E530;
  v2[2] = @"tv-theme";
  v2[3] = @"pixel-ratio";
  void v3[2] = &unk_26E59E530;
  v3[3] = &unk_26E59E548;
  v2[4] = @"min-pixel-ratio";
  v2[5] = @"max-pixel-ratio";
  v3[4] = &unk_26E59E560;
  v3[5] = &unk_26E59E578;
  v2[6] = @"width";
  v2[7] = @"min-width";
  v3[6] = &unk_26E59E590;
  v3[7] = &unk_26E59E5A8;
  v2[8] = @"max-width";
  v2[9] = @"height";
  v3[8] = &unk_26E59E5C0;
  v3[9] = &unk_26E59E5D8;
  v2[10] = @"min-height";
  v2[11] = @"max-height";
  v3[10] = &unk_26E59E5F0;
  v3[11] = &unk_26E59E608;
  v2[12] = @"device-width";
  v2[13] = @"min-device-width";
  v3[12] = &unk_26E59E620;
  v3[13] = &unk_26E59E638;
  v2[14] = @"max-device-width";
  v2[15] = @"device-height";
  v3[14] = &unk_26E59E650;
  v3[15] = &unk_26E59E668;
  v2[16] = @"min-device-height";
  v2[17] = @"max-device-height";
  v3[16] = &unk_26E59E680;
  v3[17] = &unk_26E59E698;
  v2[18] = @"interface-idiom";
  v2[19] = @"tv-os-version";
  v3[18] = &unk_26E59E6B0;
  v3[19] = &unk_26E59E6C8;
  v2[20] = @"tv-min-os-version";
  v2[21] = @"tv-max-os-version";
  v3[20] = &unk_26E59E6E0;
  v3[21] = &unk_26E59E6F8;
  v2[22] = @"layout-direction";
  v2[23] = @"size-horizontal";
  v3[22] = &unk_26E59E710;
  v3[23] = &unk_26E59E728;
  v2[24] = @"size-vertical";
  v2[25] = @"orientation";
  v3[24] = &unk_26E59E740;
  v3[25] = &unk_26E59E758;
  v2[26] = @"layout";
  v2[27] = @"ax-text";
  v3[26] = &unk_26E59E770;
  v3[27] = &unk_26E59E788;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:28];
  v1 = (void *)_evaluateAllMediaFeatureType_withValue__sFeatureLookup;
  _evaluateAllMediaFeatureType_withValue__sFeatureLookup = v0;
}

+ (id)_mobileGestaltStringForKey:(__CFString *)a3
{
  uint64_t v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    id v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      id v6 = [NSString stringWithString:v4];
    }
    else
    {
      id v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (IKViewElement)templateElement
{
  return self->_templateElement;
}

- (void)setTemplateElement:(id)a3
{
}

- (UITraitEnvironment)traitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitEnvironment);
  return (UITraitEnvironment *)WeakRetained;
}

- (_TVWindowSizeAdaptor)windowSizeAdaptor
{
  return self->_windowSizeAdaptor;
}

- (TVMediaQueryEvaluatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVMediaQueryEvaluatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_traitEnvironment);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_windowSizeAdaptor, 0);
}

@end