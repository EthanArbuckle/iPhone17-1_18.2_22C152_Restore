@interface RUIElement
- (BOOL)enabled;
- (BOOL)hasImage;
- (BOOL)isDeprecatedForInternalAnalytics;
- (BOOL)loadImage;
- (BOOL)loadImageFromImageURL;
- (BOOL)loadSystemImage;
- (BOOL)wantsInlineActivityIndicator;
- (NSDictionary)attributes;
- (NSString)body;
- (NSString)identifier;
- (NSString)name;
- (OpaqueJSClass)_JSClass;
- (OpaqueJSValue)JSValueForContext:(OpaqueJSContext *)a3;
- (RUIElement)init;
- (RUIElement)initWithAttributes:(id)a3 parent:(id)a4;
- (RUIElement)parent;
- (RUIStyle)style;
- (RUIXMLElement)sourceXMLElement;
- (id)URLAttributeForImageName:(id)a3 getScale:(double *)a4;
- (id)_ruielement_staticFunctions;
- (id)_ruielement_staticValues;
- (id)_symbolConfigurationWithRenderingMode:(id)a3 tintColor:(id)a4;
- (id)customSymbolImageNamed:(id)a3 symbolRenderingMode:(id)a4 tintColor:(id)a5;
- (id)image:(id)a3 size:(CGSize)a4;
- (id)mutableAttributes;
- (id)pageElement;
- (id)sourceURL;
- (id)staticFunctions;
- (id)staticValues;
- (id)subElementWithID:(id)a3;
- (id)subElementsWithName:(id)a3;
- (id)systemImageNamed:(id)a3 symbolRenderingMode:(id)a4;
- (id)systemImageNamed:(id)a3 symbolRenderingMode:(id)a4 tintColor:(id)a5;
- (id)textStyleWithString:(id)a3;
- (id)viewForElementIdentifier:(id)a3;
- (int)_horizontalAlignmentForString:(id)a3;
- (void)configureAccessiblityWithTarget:(id)a3;
- (void)dealloc;
- (void)imageLoaded:(id)a3;
- (void)performAction:(int)a3 completion:(id)a4;
- (void)performAction:(int)a3 forElement:(id)a4 completion:(id)a5;
- (void)reportInternalRenderEvent;
- (void)reportInternalRenderEventWithElementName:(id)a3;
- (void)reportInternalRenderEventWithElementName:(id)a3 deprecated:(BOOL)a4;
- (void)setAttributes:(id)a3;
- (void)setBody:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setSourceXMLElement:(id)a3;
- (void)setStyle:(id)a3;
- (void)setWantsInlineActivityIndicator:(BOOL)a3;
@end

@implementation RUIElement

- (OpaqueJSClass)_JSClass
{
  v3 = (void *)_JSClass_cache;
  if (!_JSClass_cache)
  {
    uint64_t v4 = objc_opt_new();
    v5 = (void *)_JSClass_cache;
    _JSClass_cache = v4;

    v3 = (void *)_JSClass_cache;
  }
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v3 objectForKeyedSubscript:v7];

  if (v8)
  {
    v9 = (OpaqueJSClass *)[v8 pointerValue];
  }
  else
  {
    v10 = [(RUIElement *)self _ruielement_staticValues];
    v11 = (void *)[v10 mutableCopy];

    v12 = [(RUIElement *)self staticValues];
    [v11 addObjectsFromArray:v12];

    v13 = (JSStaticValue *)malloc_type_malloc(32 * [v11 count] + 32, 0x10D004053594A2BuLL);
    if ([v11 count])
    {
      unint64_t v14 = 0;
      p_setProperty = &v13->setProperty;
      do
      {
        v16 = [v11 objectAtIndexedSubscript:v14];
        *(p_setProperty - 2) = (JSObjectSetPropertyCallback)[v16 identifier];

        v17 = [v11 objectAtIndexedSubscript:v14];
        *(p_setProperty - 1) = (JSObjectSetPropertyCallback)[v17 getter];

        v18 = [v11 objectAtIndexedSubscript:v14];
        JSObjectSetPropertyCallback *p_setProperty = (JSObjectSetPropertyCallback)[v18 setter];

        v19 = [v11 objectAtIndexedSubscript:v14];
        *((_DWORD *)p_setProperty + 2) = [v19 JSPropertyAttributes];

        ++v14;
        p_setProperty += 4;
      }
      while (v14 < [v11 count]);
    }
    v20 = &v13[[v11 count]];
    *(_OWORD *)&v20->name = 0u;
    *(_OWORD *)&v20->setProperty = 0u;
    v36.staticValues = v13;
    v21 = [(RUIElement *)self _ruielement_staticFunctions];
    v22 = (void *)[v21 mutableCopy];

    v23 = [(RUIElement *)self staticFunctions];
    [v22 addObjectsFromArray:v23];

    v24 = (JSStaticFunction *)malloc_type_malloc(24 * [v22 count] + 24, 0x10D00402EF37E45uLL);
    if ([v22 count])
    {
      unint64_t v25 = 0;
      p_attributes = &v24->attributes;
      do
      {
        v27 = [v22 objectAtIndexedSubscript:v25];
        *((void *)p_attributes - 2) = [v27 identifier];

        v28 = [v22 objectAtIndexedSubscript:v25];
        *((void *)p_attributes - 1) = [v28 function];

        v29 = [v22 objectAtIndexedSubscript:v25];
        JSPropertyAttributes *p_attributes = [v29 JSPropertyAttributes];
        p_attributes += 6;

        ++v25;
      }
      while (v25 < [v22 count]);
    }
    v30 = &v24[[v22 count]];
    v30->callAsFunction = 0;
    *(void *)&v30->attributes = 0;
    v30->name = 0;
    v36.staticFunctions = v24;
    v36.initialize = (JSObjectInitializeCallback)RUIJSElement_initialize;
    v36.finalize = (JSObjectFinalizeCallback)RUIJSElement_finalize;
    v9 = JSClassCreate(&v36);
    v31 = [MEMORY[0x263F08D40] valueWithPointer:v9];
    v32 = (void *)_JSClass_cache;
    v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    [v32 setObject:v31 forKeyedSubscript:v34];

    free(v13);
    free(v24);
  }
  return v9;
}

- (OpaqueJSValue)JSValueForContext:(OpaqueJSContext *)a3
{
  uint64_t v4 = self;
  v5 = [(RUIElement *)v4 _JSClass];
  return JSObjectMake(a3, v5, v4);
}

- (id)_ruielement_staticValues
{
  v8[4] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  [v2 setIdentifier:"identifier"];
  [v2 setGetter:RUIJSElement_getProperty];
  [v2 setSetter:0];
  [v2 setJSPropertyAttributes:10];
  v3 = objc_opt_new();
  [v3 setIdentifier:"page"];
  [v3 setGetter:RUIJSElement_getProperty];
  [v3 setSetter:0];
  [v3 setJSPropertyAttributes:10];
  uint64_t v4 = objc_opt_new();
  [v4 setIdentifier:"body"];
  [v4 setGetter:RUIJSElement_getProperty];
  [v4 setSetter:RUIJSElement_setProperty];
  [v4 setJSPropertyAttributes:8];
  v5 = objc_opt_new();
  [v5 setIdentifier:"enabled"];
  [v5 setGetter:RUIJSElement_getProperty];
  [v5 setSetter:RUIJSElement_setProperty];
  [v5 setJSPropertyAttributes:8];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];

  return v6;
}

- (id)staticValues
{
  return 0;
}

- (id)_ruielement_staticFunctions
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  [v2 setIdentifier:"activate"];
  [v2 setFunction:RUIJSElement_activate];
  [v2 setJSPropertyAttributes:0];
  v3 = objc_opt_new();
  [v3 setIdentifier:"getAttribute"];
  [v3 setFunction:RUIJSElement_getAttribute];
  [v3 setJSPropertyAttributes:0];
  v6[0] = v2;
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)staticFunctions
{
  return 0;
}

- (RUIElement)initWithAttributes:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RUIElement;
  v8 = [(RUIElement *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_enabled = 1;
    objc_storeWeak((id *)&v8->_parent, v7);
    v10 = [v6 objectForKeyedSubscript:@"disabled"];
    -[RUIElement setEnabled:](v9, "setEnabled:", [v10 BOOLValue] ^ 1);

    [(RUIElement *)v9 setAttributes:v6];
  }

  return v9;
}

- (RUIElement)init
{
  v3.receiver = self;
  v3.super_class = (Class)RUIElement;
  result = [(RUIElement *)&v3 init];
  if (result) {
    result->_enabled = 1;
  }
  return result;
}

- (void)performAction:(int)a3 completion:(id)a4
{
}

- (void)performAction:(int)a3 forElement:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  v10 = [(RUIElement *)self parent];

  if (v10)
  {
    v11 = [(RUIElement *)self parent];
    [v11 performAction:v6 forElement:v8 completion:v9];
  }
  else
  {
    if (_isInternalInstall())
    {
      objc_super v12 = _RUILoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 67109378;
        v14[1] = v6;
        __int16 v15 = 2112;
        id v16 = v8;
        _os_log_impl(&dword_2144F2000, v12, OS_LOG_TYPE_DEFAULT, "Dropping action %i on the floor for element %@", (uint8_t *)v14, 0x12u);
      }
    }
    if (v9)
    {
      v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.RemoteUI" code:2 userInfo:0];
      v9[2](v9, 0, v13);
    }
  }
}

- (id)subElementsWithName:(id)a3
{
  return 0;
}

- (id)subElementWithID:(id)a3
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)setAttributes:(id)a3
{
  if (self->_attributes != a3)
  {
    uint64_t v4 = (NSMutableDictionary *)[a3 mutableCopy];
    attributes = self->_attributes;
    self->_attributes = v4;

    id v6 = [(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:@"id"];
    [(RUIElement *)self setIdentifier:v6];
  }
}

- (id)mutableAttributes
{
  attributes = self->_attributes;
  if (!attributes)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_attributes;
    self->_attributes = v4;

    attributes = self->_attributes;
  }
  return attributes;
}

- (void)dealloc
{
  objc_super v3 = +[RUIImageLoader sharedImageLoader];
  uint64_t v4 = [v3 notificationCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)RUIElement;
  [(RUIElement *)&v5 dealloc];
}

- (id)sourceURL
{
  v2 = [(RUIElement *)self parent];
  objc_super v3 = [v2 sourceURL];

  return v3;
}

- (id)pageElement
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = self;
  }
  else
  {
    uint64_t v4 = [(RUIElement *)self parent];
    objc_super v3 = [v4 pageElement];
  }
  return v3;
}

- (RUIStyle)style
{
  style = self->_style;
  if (style)
  {
    objc_super v3 = style;
  }
  else
  {
    uint64_t v4 = [(RUIElement *)self parent];
    objc_super v3 = [v4 style];
  }
  return v3;
}

- (NSString)name
{
  return (NSString *)[(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:@"name"];
}

- (id)URLAttributeForImageName:(id)a3 getScale:(double *)a4
{
  v39[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 scale];
  double v9 = v8;

  v38[0] = &unk_26C558008;
  v38[1] = &unk_26C558018;
  v39[0] = @"3x";
  v39[1] = @"2x";
  v38[2] = &unk_26C558028;
  v39[2] = &stru_26C545B50;
  v10 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
  v11 = [NSNumber numberWithDouble:v9];
  objc_super v12 = [v10 objectForKeyedSubscript:v11];

  if (!v12)
  {
LABEL_6:
    id v16 = [v10 allKeys];
    uint64_t v17 = [v16 sortedArrayUsingComparator:&__block_literal_global_8];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v13 = v17;
    uint64_t v18 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      v31 = a4;
      v32 = v12;
      uint64_t v20 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v13);
          }
          v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v23 = objc_msgSend(v10, "objectForKeyedSubscript:", v22, v31);
          v24 = [v6 stringByAppendingString:v23];

          uint64_t v25 = [(NSMutableDictionary *)self->_attributes objectForKey:v24];
          if (v25)
          {
            __int16 v15 = (void *)v25;
            if (v31)
            {
              [v22 doubleValue];
              *(void *)v31 = v26;
            }

            goto LABEL_18;
          }
        }
        uint64_t v19 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v19) {
          continue;
        }
        break;
      }
      __int16 v15 = 0;
LABEL_18:
      objc_super v12 = v32;
    }
    else
    {
      __int16 v15 = 0;
    }

    goto LABEL_21;
  }
  id v13 = [v6 stringByAppendingString:v12];
  uint64_t v14 = [(NSMutableDictionary *)self->_attributes objectForKey:v13];
  __int16 v15 = (void *)v14;
  if (!a4 || !v14)
  {

    if (v15) {
      goto LABEL_22;
    }
    goto LABEL_6;
  }
  *a4 = v9;
LABEL_21:

LABEL_22:
  if ([v15 length])
  {
    v27 = [v15 stringByAddingPercentEscapesUsingEncoding:4];

    v28 = [(RUIElement *)self sourceURL];
    if (v28) {
      [NSURL URLWithString:v27 relativeToURL:v28];
    }
    else {
    v29 = [NSURL URLWithString:v27];
    }
  }
  else
  {
    v29 = 0;
    v27 = v15;
  }

  return v29;
}

uint64_t __48__RUIElement_URLAttributeForImageName_getScale___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (int)_horizontalAlignmentForString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = [v3 lowercaseString];
    if ([v4 isEqualToString:@"left"])
    {
      int v5 = 1;
    }
    else if ([v4 isEqualToString:@"center"])
    {
      int v5 = 2;
    }
    else if ([v4 isEqualToString:@"right"])
    {
      int v5 = 3;
    }
    else
    {
      NSLog(&cfstr_WarningUnrecog.isa, v3);
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (void)imageLoaded:(id)a3
{
  double v12 = -1.0;
  uint64_t v4 = [(RUIElement *)self URLAttributeForImageName:@"image" getScale:&v12];
  if (v4)
  {
    int v5 = +[RUIImageLoader sharedImageLoader];
    uint64_t v6 = [v5 imageForURL:v4 loadIfAbsent:0];
    if (v6)
    {
      id v7 = [MEMORY[0x263F827E8] imageWithCGImage:v6 scale:0 orientation:v12];
      [(RUIElement *)self setImage:v7];
    }
    double v8 = [v5 notificationCenter];
    double v9 = RUIImageLoaderDidLoadImageNotification;
    v10 = [v4 absoluteString];
    v11 = [(__CFString *)v9 stringByAppendingString:v10];
    [v8 removeObserver:self name:v11 object:0];
  }
}

- (BOOL)hasImage
{
  id v3 = [(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:@"systemImage"];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    int v5 = [(RUIElement *)self URLAttributeForImageName:@"image" getScale:0];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)loadImage
{
  if ([(RUIElement *)self loadSystemImage]) {
    return 1;
  }
  return [(RUIElement *)self loadImageFromImageURL];
}

- (id)_symbolConfigurationWithRenderingMode:(id)a3 tintColor:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"hierarchical"])
  {
    uint64_t v7 = [MEMORY[0x263F82818] configurationWithHierarchicalColor:v6];
  }
  else
  {
    int v8 = [v5 isEqualToString:@"palette"];
    double v9 = (void *)MEMORY[0x263F82818];
    if (v8)
    {
      v13[0] = v6;
      v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
      v11 = [v9 configurationWithPaletteColors:v10];

      goto LABEL_7;
    }
    uint64_t v7 = [MEMORY[0x263F82818] unspecifiedConfiguration];
  }
  v11 = (void *)v7;
LABEL_7:

  return v11;
}

- (id)systemImageNamed:(id)a3 symbolRenderingMode:(id)a4
{
  return [(RUIElement *)self systemImageNamed:a3 symbolRenderingMode:a4 tintColor:0];
}

- (id)systemImageNamed:(id)a3 symbolRenderingMode:(id)a4 tintColor:(id)a5
{
  uint64_t v7 = (void *)MEMORY[0x263F827E8];
  if (a5)
  {
    id v9 = a4;
    id v10 = a3;
    v11 = [(RUIElement *)self _symbolConfigurationWithRenderingMode:v9 tintColor:a5];

    double v12 = [v7 _systemImageNamed:v10 withConfiguration:v11];
  }
  else
  {
    id v13 = (void *)MEMORY[0x263F825C8];
    id v14 = a4;
    id v15 = a3;
    v11 = [v13 tintColor];
    id v10 = [(RUIElement *)self _symbolConfigurationWithRenderingMode:v14 tintColor:v11];

    double v12 = [v7 _systemImageNamed:v15 withConfiguration:v10];
  }
  return v12;
}

- (id)customSymbolImageNamed:(id)a3 symbolRenderingMode:(id)a4 tintColor:(id)a5
{
  id v7 = a5;
  int v8 = (void *)MEMORY[0x263F827E8];
  id v9 = (void *)MEMORY[0x263F086E0];
  id v10 = a3;
  v11 = [v9 bundleForClass:objc_opt_class()];
  double v12 = [(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:@"symbolRenderingMode"];
  if (v7)
  {
    id v13 = [(RUIElement *)self _symbolConfigurationWithRenderingMode:v12 tintColor:v7];
    id v14 = [v8 imageNamed:v10 inBundle:v11 withConfiguration:v13];
  }
  else
  {
    id v13 = [MEMORY[0x263F825C8] tintColor];
    uint64_t v15 = [(RUIElement *)self _symbolConfigurationWithRenderingMode:v12 tintColor:v13];
    id v14 = [v8 imageNamed:v10 inBundle:v11 withConfiguration:v15];

    id v10 = (id)v15;
  }

  return v14;
}

- (BOOL)loadSystemImage
{
  id v3 = [(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:@"systemImage"];
  if (v3)
  {
    BOOL v4 = [(NSMutableDictionary *)self->_attributes objectForKey:@"tintColor"];
    if (v4)
    {
      id v5 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v4);
    }
    else
    {
      id v5 = 0;
    }
    id v7 = [(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:@"symbolRenderingMode"];
    int v8 = [(RUIElement *)self systemImageNamed:v3 symbolRenderingMode:v7 tintColor:v5];

    if (!v8)
    {
      id v9 = [(NSMutableDictionary *)self->_attributes objectForKeyedSubscript:@"symbolRenderingMode"];
      int v8 = [(RUIElement *)self customSymbolImageNamed:v3 symbolRenderingMode:v9 tintColor:v5];

      if (!v8)
      {
        BOOL v6 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    double v10 = *MEMORY[0x263F001B0];
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v12 = [(NSMutableDictionary *)self->_attributes objectForKey:@"systemImageWidth"];
    if ([v12 length])
    {
      id v13 = [(NSMutableDictionary *)self->_attributes objectForKey:@"systemImageHeight"];
      uint64_t v14 = [v13 length];

      double v15 = v10;
      double v16 = v11;
      if (!v14)
      {
LABEL_13:
        if (v15 != v10 || v16 != v11)
        {
          uint64_t v21 = -[RUIElement image:size:](self, "image:size:", v8, v15, v16);

          -[RUIElement setImageSize:](self, "setImageSize:", v15, v16);
          int v8 = (void *)v21;
        }
        [(RUIElement *)self setImage:v8];
        if (v5) {
          [(RUIElement *)self setTintColor:v5];
        }
        v22 = [(NSMutableDictionary *)self->_attributes objectForKey:@"imageAlign"];

        if (v22)
        {
          v23 = [(NSMutableDictionary *)self->_attributes objectForKey:@"imageAlign"];
          [(RUIElement *)self setImageAlignment:[(RUIElement *)self _horizontalAlignmentForString:v23]];
        }
        [(RUIElement *)self setImage:v8];

        BOOL v6 = 1;
        goto LABEL_23;
      }
      uint64_t v17 = [(NSMutableDictionary *)self->_attributes objectForKey:@"systemImageWidth"];
      [v17 floatValue];
      double v15 = v18;

      double v12 = [(NSMutableDictionary *)self->_attributes objectForKey:@"systemImageHeight"];
      [v12 floatValue];
      double v16 = v19;
    }
    else
    {
      double v15 = v10;
      double v16 = v11;
    }

    goto LABEL_13;
  }
  BOOL v6 = 0;
LABEL_24:

  return v6;
}

- (id)image:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  if (!v6 || (width == *MEMORY[0x263F001B0] ? (BOOL v7 = height == *(double *)(MEMORY[0x263F001B0] + 8)) : (BOOL v7 = 0), v7))
  {
    double v10 = 0;
  }
  else
  {
    v13.double width = width;
    v13.double height = height;
    UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
    objc_msgSend(v6, "drawInRect:", 0.0, 0.0, width, height);
    int v8 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    id v9 = [v8 imageWithRenderingMode:2];

    id v6 = v9;
    double v10 = v6;
  }

  return v10;
}

- (BOOL)loadImageFromImageURL
{
  double v31 = -1.0;
  id v3 = [(RUIElement *)self URLAttributeForImageName:@"image" getScale:&v31];
  if (!v3) {
    goto LABEL_16;
  }
  BOOL v4 = +[RUIImageLoader sharedImageLoader];
  uint64_t v5 = [v4 imageForURL:v3 loadIfAbsent:1];
  double v6 = *MEMORY[0x263F001B0];
  double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v5)
  {
    int v8 = [MEMORY[0x263F827E8] imageWithCGImage:v5 scale:0 orientation:v31];
LABEL_9:
    float v19 = [(NSMutableDictionary *)self->_attributes objectForKey:@"imageWidth"];
    [v19 floatValue];
    double v18 = v20;

    uint64_t v21 = [(NSMutableDictionary *)self->_attributes objectForKey:@"imageHeight"];
    [v21 floatValue];
    double v17 = v22;

    goto LABEL_10;
  }
  id v9 = [(NSMutableDictionary *)self->_attributes objectForKey:@"imageWidth"];
  if ([v9 length])
  {

LABEL_7:
    int v8 = 0;
    int v12 = 1;
    goto LABEL_8;
  }
  double v10 = [(NSMutableDictionary *)self->_attributes objectForKey:@"imageHeight"];
  uint64_t v11 = [v10 length];

  if (v11) {
    goto LABEL_7;
  }
  uint64_t v26 = [MEMORY[0x263F82B60] mainScreen];
  [v26 scale];
  double v28 = v27;

  uint64_t v29 = LICreateDefaultIcon();
  if (v29)
  {
    v30 = (const void *)v29;
    int v8 = [MEMORY[0x263F827E8] imageWithCGImage:v29 scale:0 orientation:v28];
    CFRelease(v30);
    int v12 = 0;
  }
  else
  {
    int v12 = 0;
    int v8 = 0;
  }
LABEL_8:
  CGSize v13 = [v4 notificationCenter];
  uint64_t v14 = RUIImageLoaderDidLoadImageNotification;
  double v15 = [v3 absoluteString];
  double v16 = [(__CFString *)v14 stringByAppendingString:v15];
  [v13 addObserver:self selector:sel_imageLoaded_ name:v16 object:0];

  double v17 = v7;
  double v18 = v6;
  if (v12) {
    goto LABEL_9;
  }
LABEL_10:
  [(RUIElement *)self setImage:v8];
  if (v18 != v6 || v17 != v7) {
    -[RUIElement setImageSize:](self, "setImageSize:", v18, v17);
  }
  v24 = [(NSMutableDictionary *)self->_attributes objectForKey:@"imageAlign"];
  [(RUIElement *)self setImageAlignment:[(RUIElement *)self _horizontalAlignmentForString:v24]];

LABEL_16:
  return v3 != 0;
}

- (id)textStyleWithString:(id)a3
{
  v19[11] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F835E0];
  v18[0] = @"largeTitle";
  v18[1] = @"title1";
  uint64_t v4 = *MEMORY[0x263F83610];
  v19[0] = v3;
  v19[1] = v4;
  uint64_t v5 = *MEMORY[0x263F83618];
  v18[2] = @"title2";
  v18[3] = @"title3";
  uint64_t v6 = *MEMORY[0x263F83628];
  v19[2] = v5;
  v19[3] = v6;
  uint64_t v7 = *MEMORY[0x263F835D0];
  v18[4] = @"headline";
  v18[5] = @"subheadline";
  uint64_t v8 = *MEMORY[0x263F835F0];
  v19[4] = v7;
  v19[5] = v8;
  uint64_t v9 = *MEMORY[0x263F83570];
  v18[6] = @"body";
  v18[7] = @"callout";
  uint64_t v10 = *MEMORY[0x263F83580];
  v19[6] = v9;
  v19[7] = v10;
  uint64_t v11 = *MEMORY[0x263F835B8];
  v18[8] = @"footnote";
  v18[9] = @"caption1";
  uint64_t v12 = *MEMORY[0x263F83588];
  v19[8] = v11;
  v19[9] = v12;
  v18[10] = @"caption2";
  v19[10] = *MEMORY[0x263F83590];
  CGSize v13 = NSDictionary;
  id v14 = a3;
  double v15 = [v13 dictionaryWithObjects:v19 forKeys:v18 count:11];
  double v16 = [v15 objectForKeyedSubscript:v14];

  return v16;
}

- (void)configureAccessiblityWithTarget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RUIElement *)self attributes];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"accessibilityIdentifier"];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(RUIElement *)self identifier];
  }
  id v9 = v8;

  [v4 setAccessibilityIdentifier:v9];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)attributes
{
  return &self->_attributes->super;
}

- (void)setStyle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (RUIElement)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (RUIElement *)WeakRetained;
}

- (RUIXMLElement)sourceXMLElement
{
  return self->_sourceXMLElement;
}

- (void)setSourceXMLElement:(id)a3
{
}

- (BOOL)wantsInlineActivityIndicator
{
  return self->_wantsInlineActivityIndicator;
}

- (void)setWantsInlineActivityIndicator:(BOOL)a3
{
  self->_wantsInlineActivityIndicator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceXMLElement, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (void)reportInternalRenderEvent
{
  v2 = self;
  RUIElement.reportInternalRenderEvent()();
}

- (BOOL)isDeprecatedForInternalAnalytics
{
  v2 = self;
  char v3 = RUIElement.isDeprecatedForInternalAnalytics.getter();

  return v3 & 1;
}

- (void)reportInternalRenderEventWithElementName:(id)a3
{
  uint64_t v4 = sub_214602EA8();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  RUIElement.reportInternalRenderEvent(with:)(v8);

  swift_bridgeObjectRelease();
}

- (void)reportInternalRenderEventWithElementName:(id)a3 deprecated:(BOOL)a4
{
  uint64_t v6 = sub_214602EA8();
  Swift::String v8 = v7;
  id v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  RUIElement.reportInternalRenderEvent(with:deprecated:)(v10, a4);

  swift_bridgeObjectRelease();
}

@end