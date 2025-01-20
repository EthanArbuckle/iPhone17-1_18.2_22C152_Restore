@interface SUUIImageViewElement
- (BOOL)isEnabled;
- (BOOL)rendersWithParallax;
- (BOOL)rendersWithPerspective;
- (CGSize)layerShadowOffset;
- (CGSize)shadowOffset;
- (CGSize)size;
- (NSString)resourceName;
- (NSURL)URL;
- (SUUIImageViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (UIColor)shadowColor;
- (double)layerShadowRadius;
- (double)shadowRadius;
- (float)layerShadowOpacity;
- (id)accessibilityText;
- (id)applyUpdatesWithElement:(id)a3;
- (id)entityValueProperties;
- (id)resourceCacheKey;
- (id)transientResourceCacheKey;
- (id)uniquingMapKey;
- (int64_t)pageComponentType;
- (void)_loadEntityValuesIfNeeded;
- (void)entityValueProviderDidChange;
- (void)setLayerShadowOffset:(CGSize)a3;
- (void)setLayerShadowOpacity:(float)a3;
- (void)setLayerShadowRadius:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowRadius:(double)a3;
@end

@implementation SUUIImageViewElement

- (SUUIImageViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v46.receiver = self;
  v46.super_class = (Class)SUUIImageViewElement;
  v11 = [(SUUIViewElement *)&v46 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    if (initWithDOMElement_parent_elementFactory__sOnce != -1) {
      dispatch_once(&initWithDOMElement_parent_elementFactory__sOnce, &__block_literal_global_8);
    }
    v12 = [v8 getAttribute:@"srcset"];
    v13 = [v8 getAttribute:@"src"];
    if ([v13 length])
    {
      uint64_t v14 = [objc_alloc(NSURL) initWithString:v13];
      url = v11->_url;
      v11->_url = (NSURL *)v14;
    }
    else if ([v12 length])
    {
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x2020000000;
      v45[3] = 0;
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__15;
      v43 = __Block_byref_object_dispose__15;
      id v44 = 0;
      v16 = (void *)initWithDOMElement_parent_elementFactory__sSrcSetRegularExpression;
      uint64_t v17 = [v12 length];
      uint64_t v32 = MEMORY[0x263EF8330];
      uint64_t v33 = 3221225472;
      v34 = __65__SUUIImageViewElement_initWithDOMElement_parent_elementFactory___block_invoke_10;
      v35 = &unk_265402228;
      id v36 = v12;
      v37 = v45;
      v38 = &v39;
      objc_msgSend(v16, "enumerateMatchesInString:options:range:usingBlock:", v36, 0, 0, v17, &v32);
      objc_storeStrong((id *)&v11->_url, (id)v40[5]);

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(v45, 8);
    }
    v18 = [(NSURL *)v11->_url scheme];
    int v19 = [v18 isEqualToString:@"resource"];

    if (v19)
    {
      uint64_t v20 = [(NSURL *)v11->_url host];
      resourceName = v11->_resourceName;
      v11->_resourceName = (NSString *)v20;

      v22 = v11->_url;
      v11->_url = 0;
    }
    v23 = [v8 getAttribute:@"height"];
    v24 = [v8 getAttribute:@"width"];
    if ([v23 length] && objc_msgSend(v24, "length"))
    {
      [v23 doubleValue];
      v11->_size.height = v25;
      [v24 doubleValue];
      v11->_size.width = v26;
    }
    uint64_t v27 = [v8 getAttribute:@"alt"];
    alt = v11->_alt;
    v11->_alt = (NSString *)v27;

    v29 = [v8 getAttribute:@"disabled"];
    if ([v29 length]) {
      char v30 = [v29 BOOLValue] ^ 1;
    }
    else {
      char v30 = -1;
    }
    v11->_enabled = v30;
  }
  return v11;
}

uint64_t __65__SUUIImageViewElement_initWithDOMElement_parent_elementFactory___block_invoke()
{
  v0 = [MEMORY[0x263F82B60] mainScreen];
  [v0 scale];
  initWithDOMElement_parent_elementFactory__sScreenScale = (uint64_t)v1;

  uint64_t v2 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"([^ ,]+) +([^,]+)" options:0 error:0];
  uint64_t v3 = initWithDOMElement_parent_elementFactory__sSrcSetRegularExpression;
  initWithDOMElement_parent_elementFactory__sSrcSetRegularExpression = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

void __65__SUUIImageViewElement_initWithDOMElement_parent_elementFactory___block_invoke_10(void *a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v20 = a2;
  BOOL v6 = [v20 numberOfRanges] == 3;
  v7 = v20;
  if (v6)
  {
    id v8 = (void *)a1[4];
    uint64_t v9 = [v20 rangeAtIndex:2];
    v11 = objc_msgSend(v8, "substringWithRange:", v9, v10);
    uint64_t v12 = [v11 integerValue];

    id v13 = objc_alloc(NSURL);
    uint64_t v14 = (void *)a1[4];
    uint64_t v15 = [v20 rangeAtIndex:1];
    uint64_t v17 = objc_msgSend(v14, "substringWithRange:", v15, v16);
    v18 = (void *)[v13 initWithString:v17];

    if (v18)
    {
      uint64_t v19 = *(void *)(a1[5] + 8);
      if (v12 > *(void *)(v19 + 24))
      {
        *(void *)(v19 + 24) = v12;
        objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v18);
        *a4 = v12 == initWithDOMElement_parent_elementFactory__sScreenScale;
      }
    }

    v7 = v20;
  }
}

- (id)resourceCacheKey
{
  resourceCacheKey = self->_resourceCacheKey;
  if (!resourceCacheKey)
  {
    v4 = [SUUIImageViewElementCacheKey alloc];
    v5 = [(SUUIImageViewElement *)self URL];
    [(SUUIImageViewElement *)self size];
    double v7 = v6;
    double v9 = v8;
    uint64_t v10 = [(SUUIImageViewElement *)self style];
    v11 = [v10 imageTreatment];
    uint64_t v12 = -[SUUIImageViewElementCacheKey initWithURL:size:imageTreatment:](v4, "initWithURL:size:imageTreatment:", v5, v11, v7, v9);
    id v13 = self->_resourceCacheKey;
    self->_resourceCacheKey = v12;

    resourceCacheKey = self->_resourceCacheKey;
  }
  return resourceCacheKey;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  v4 = [(SUUIImageViewElement *)self style];
  v5 = [v4 maxHeight];
  uint64_t v6 = [v4 maxWidth];
  double v7 = (void *)v6;
  if (v5 && v6)
  {
    [v5 floatValue];
    double height = v8;
    [v7 floatValue];
    double width = v9;
  }

  double v10 = width;
  double v11 = height;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (id)accessibilityText
{
  alt = self->_alt;
  if (alt)
  {
    uint64_t v3 = alt;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIImageViewElement;
    uint64_t v3 = [(SUUIImageViewElement *)&v5 accessibilityText];
  }
  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIImageViewElement *)a3;
  v23.receiver = self;
  v23.super_class = (Class)SUUIImageViewElement;
  objc_super v5 = [(SUUIViewElement *)&v23 applyUpdatesWithElement:v4];
  uint64_t v6 = v5;
  if (v5 != self)
  {
    if ([(NSURL *)v5->_url isEqual:self->_url]) {
      goto LABEL_8;
    }
    double v7 = [SUUIImageViewElementCacheKey alloc];
    url = self->_url;
    p_size = &self->_size;
    double v10 = [(SUUIImageViewElement *)self style];
    double v11 = [v10 imageTreatment];
    uint64_t v12 = -[SUUIImageViewElementCacheKey initWithURL:size:imageTreatment:](v7, "initWithURL:size:imageTreatment:", url, v11, p_size->width, p_size->height);
    transientResourceCacheKey = v6->_transientResourceCacheKey;
    v6->_transientResourceCacheKey = (SUUIImageViewElementCacheKey *)v12;

    goto LABEL_7;
  }
  if (v4 != self && v4)
  {
    uint64_t v14 = (NSString *)[(NSString *)v4->_alt copy];
    alt = self->_alt;
    self->_alt = v14;

    resourceCacheKey = self->_resourceCacheKey;
    self->_resourceCacheKey = 0;

    uint64_t v17 = [(SUUIImageViewElement *)v4 resourceName];
    resourceName = self->_resourceName;
    self->_resourceName = v17;

    [(SUUIImageViewElement *)v4 size];
    self->_size.double width = v19;
    self->_size.double height = v20;
    v21 = [(SUUIImageViewElement *)v4 URL];
    double v10 = self->_url;
    self->_url = v21;
LABEL_7:
  }
LABEL_8:

  return v6;
}

- (id)entityValueProperties
{
  uint64_t v2 = [(SUUIImageViewElement *)self attributes];
  uint64_t v3 = [v2 objectForKey:@"valueProperty"];

  if (v3)
  {
    v4 = [MEMORY[0x263EFFA08] setWithObject:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)entityValueProviderDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIImageViewElement;
  [(SUUIViewElement *)&v5 entityValueProviderDidChange];
  self->_hasValidEntityValues = 0;
  entityResourceName = self->_entityResourceName;
  self->_entityResourceName = 0;

  entityURL = self->_entityURL;
  self->_entityURL = 0;
}

- (BOOL)isEnabled
{
  int enabled = self->_enabled;
  if (enabled != 255) {
    return enabled != 0;
  }
  v4 = [(SUUIImageViewElement *)self style];
  objc_super v5 = [v4 imageTreatment];
  uint64_t v6 = SUUIImageTreatmentForString(v5);

  if (v6 == 8) {
    return 0;
  }
  double v7 = [(SUUIImageViewElement *)self style];
  float v8 = [v7 imageTreatment];
  uint64_t v9 = SUUIImageTreatmentForString(v8);

  if (v9 == 9) {
    return 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIImageViewElement;
  return [(SUUIViewElement *)&v11 isEnabled];
}

- (int64_t)pageComponentType
{
  return 24;
}

- (BOOL)rendersWithPerspective
{
  uint64_t v2 = [(SUUIImageViewElement *)self style];
  uint64_t v3 = [v2 imageTreatment];
  uint64_t v4 = SUUIImageTreatmentForString(v3);

  return v4 == 7;
}

- (BOOL)rendersWithParallax
{
  uint64_t v2 = [(SUUIImageViewElement *)self style];
  uint64_t v3 = [v2 imageTreatment];
  uint64_t v4 = SUUIImageTreatmentForString(v3);

  return v4 == 13;
}

- (id)uniquingMapKey
{
  [(SUUIImageViewElement *)self _loadEntityValuesIfNeeded];
  entityURL = self->_entityURL;
  if (entityURL || (entityURL = (NSURL *)self->_entityResourceName) != 0)
  {
    uint64_t v4 = entityURL;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SUUIImageViewElement;
    uint64_t v4 = [(SUUIViewElement *)&v6 uniquingMapKey];
  }
  return v4;
}

- (NSString)resourceName
{
  [(SUUIImageViewElement *)self _loadEntityValuesIfNeeded];
  entityResourceName = self->_entityResourceName;
  if (!entityResourceName) {
    entityResourceName = self->_resourceName;
  }
  return entityResourceName;
}

- (NSURL)URL
{
  [(SUUIImageViewElement *)self _loadEntityValuesIfNeeded];
  entityURL = self->_entityURL;
  if (!entityURL) {
    entityURL = self->_url;
  }
  return entityURL;
}

- (void)_loadEntityValuesIfNeeded
{
  if (!self->_hasValidEntityValues)
  {
    self->_hasValidEntityValues = 1;
    uint64_t v3 = [(SUUIViewElement *)self entityValueProvider];
    if (v3)
    {
      uint64_t v4 = [(SUUIImageViewElement *)self attributes];
      objc_super v5 = [v4 objectForKey:@"valueProperty"];

      if (v5)
      {
        objc_super v6 = [MEMORY[0x263F82B60] mainScreen];
        [v6 scale];
        objc_msgSend(v3, "imageURLForEntityArtworkProperty:fittingSize:destinationScale:", v5, self->_size.width, self->_size.height, v7);
        float v8 = (NSURL *)objc_claimAutoreleasedReturnValue();

        uint64_t v9 = [(NSURL *)v8 scheme];
        int v10 = [v9 isEqualToString:@"resource"];

        if (v10)
        {
          objc_super v11 = [(NSURL *)v8 host];
        }
        else
        {
          objc_super v11 = 0;
        }
      }
      else
      {
        objc_super v11 = 0;
        float v8 = 0;
      }
    }
    else
    {
      objc_super v11 = 0;
      float v8 = 0;
    }
    entityURL = self->_entityURL;
    self->_entityURL = v8;
    uint64_t v16 = v8;

    entityResourceName = self->_entityResourceName;
    self->_entityResourceName = v11;
    uint64_t v14 = v11;

    resourceCacheKey = self->_resourceCacheKey;
    self->_resourceCacheKey = 0;
  }
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
}

- (id)transientResourceCacheKey
{
  return self->_transientResourceCacheKey;
}

- (float)layerShadowOpacity
{
  return self->_layerShadowOpacity;
}

- (void)setLayerShadowOpacity:(float)a3
{
  self->_layerShadowOpacity = a3;
}

- (CGSize)layerShadowOffset
{
  double width = self->_layerShadowOffset.width;
  double height = self->_layerShadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLayerShadowOffset:(CGSize)a3
{
  self->_layerShadowOffset = a3;
}

- (double)layerShadowRadius
{
  return self->_layerShadowRadius;
}

- (void)setLayerShadowRadius:(double)a3
{
  self->_layerShadowRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_transientResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_resourceCacheKey, 0);
  objc_storeStrong((id *)&self->_entityURL, 0);
  objc_storeStrong((id *)&self->_entityResourceName, 0);
  objc_storeStrong((id *)&self->_alt, 0);
}

@end