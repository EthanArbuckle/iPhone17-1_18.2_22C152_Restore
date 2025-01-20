@interface TSDStyledInfo
- (Class)styleClass;
- (TSDReflection)reflection;
- (TSDShadow)shadow;
- (TSDStroke)stroke;
- (TSSStyle)style;
- (float)opacity;
- (id)boxedValueForProperty:(int)a3;
- (id)objectForProperty:(int)a3;
- (id)propertyMapForNewPreset;
- (id)referencedStyles;
- (id)styleIdentifierTemplateForNewPreset;
- (id)stylesForCopyStyle;
- (void)adoptStylesheet:(id)a3 withMapper:(id)a4;
- (void)i_setValue:(id)a3 forProperty:(int)a4;
- (void)replaceReferencedStylesUsingBlock:(id)a3;
- (void)setBoxedValue:(id)a3 forProperty:(int)a4;
- (void)setOpacity:(float)a3;
- (void)setReflection:(id)a3;
- (void)setShadow:(id)a3;
- (void)setStroke:(id)a3;
- (void)setStyle:(id)a3;
- (void)setValuesForProperties:(id)a3;
@end

@implementation TSDStyledInfo

- (Class)styleClass
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDStyledInfo styleClass]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 36, @"Subclasses must implement styleClass");
  return 0;
}

- (TSSStyle)style
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDStyledInfo style]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 43, @"Subclasses must implement style");
  return 0;
}

- (void)setStyle:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDStyledInfo setStyle:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:50 description:@"Subclasses must implement setStyle:"];
}

- (id)stylesForCopyStyle
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = [(TSDStyledInfo *)self style];
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

- (TSDStroke)stroke
{
  if (![(TSDStyledInfo *)self style])
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDStyledInfo stroke]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 73, @"invalid nil value for '%s'", "self.style");
  }
  uint64_t v5 = [(TSDStyledInfo *)self style];

  return (TSDStroke *)[(TSSStyle *)v5 valueForProperty:517];
}

- (void)setStroke:(id)a3
{
}

- (float)opacity
{
  if (![(TSDStyledInfo *)self style])
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDStyledInfo opacity]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 85, @"invalid nil value for '%s'", "self.style");
  }
  uint64_t v5 = [(TSDStyledInfo *)self style];

  [(TSSStyle *)v5 floatValueForProperty:518];
  return result;
}

- (void)setOpacity:(float)a3
{
  float v13 = a3;
  if (![(TSDStyledInfo *)self style])
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDStyledInfo setOpacity:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 92, @"invalid nil value for '%s'", "self.style");
  }
  if (![(TSSStyle *)[(TSDStyledInfo *)self style] stylesheet])
  {
    v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDStyledInfo setOpacity:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 93, @"invalid nil value for '%s'", "self.style.stylesheet");
  }
  [(TSSStyle *)[(TSDStyledInfo *)self style] validateFloatValue:&v13 forProperty:518];
  [(TSDDrawableInfo *)self willChangeProperty:518];
  v8 = [TSSPropertyMap alloc];
  v9 = -[TSSPropertyMap initWithPropertiesAndValues:](v8, "initWithPropertiesAndValues:", 518, v13, 0, 0);
  id v10 = [(TSSStylesheet *)[(TSSStyle *)[(TSDStyledInfo *)self style] stylesheet] variationOfStyle:[(TSDStyledInfo *)self style] propertyMap:v9];
  [(TSDStyledInfo *)self style];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDStyledInfo setOpacity:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 100, @"Variation style is wrong style.");
  }
  [(TSDStyledInfo *)self setStyle:v10];
}

- (TSDReflection)reflection
{
  if (![(TSDStyledInfo *)self style])
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDStyledInfo reflection]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 109, @"invalid nil value for '%s'", "self.style");
  }
  uint64_t v5 = [(TSSStyle *)[(TSDStyledInfo *)self style] valueForProperty:519];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  else {
    return v5;
  }
}

- (void)setReflection:(id)a3
{
  if (!a3) {
    a3 = (id)[MEMORY[0x263EFF9D0] null];
  }

  [(TSDStyledInfo *)self i_setValue:a3 forProperty:519];
}

- (TSDShadow)shadow
{
  if (![(TSDStyledInfo *)self style])
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDStyledInfo shadow]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 128, @"invalid nil value for '%s'", "self.style");
  }
  uint64_t v5 = [(TSSStyle *)[(TSDStyledInfo *)self style] valueForProperty:520];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  else {
    return v5;
  }
}

- (void)setShadow:(id)a3
{
  if (!a3) {
    a3 = (id)[MEMORY[0x263EFF9D0] null];
  }

  [(TSDStyledInfo *)self i_setValue:a3 forProperty:520];
}

- (id)boxedValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (![(TSDStyledInfo *)self style])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDStyledInfo boxedValueForProperty:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 147, @"invalid nil value for '%s'", "self.style");
  }
  if ([(TSSStyle *)[(TSDStyledInfo *)self style] containsProperty:v3])
  {
    uint64_t v7 = [(TSDStyledInfo *)self style];
    return [(TSSStyle *)v7 boxedValueForProperty:v3];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TSDStyledInfo;
    return [(TSDDrawableInfo *)&v9 boxedObjectForProperty:v3];
  }
}

- (id)objectForProperty:(int)a3
{
  if (a3 == 515)
  {
    return [(TSDStyledInfo *)self style];
  }
  else
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)TSDStyledInfo;
    return -[TSDDrawableInfo objectForProperty:](&v6, sel_objectForProperty_);
  }
}

- (void)setBoxedValue:(id)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a3)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDStyledInfo setBoxedValue:forProperty:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 169, @"invalid nil value for '%s'", "value");
  }
  if (![(TSDStyledInfo *)self style])
  {
    objc_super v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDStyledInfo setBoxedValue:forProperty:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 170, @"invalid nil value for '%s'", "self.style");
  }
  if (![(TSSStyle *)[(TSDStyledInfo *)self style] stylesheet])
  {
    v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDStyledInfo setBoxedValue:forProperty:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 171, @"invalid nil value for '%s'", "self.style.stylesheet");
  }
  [(TSDDrawableInfo *)self willChangeProperty:v4];
  v16 = [[TSSPropertyMap alloc] initWithCapacity:1];
  [(TSSPropertyMap *)v16 setBoxedObject:a3 forProperty:v4];
  id v13 = [(TSSStylesheet *)[(TSSStyle *)[(TSDStyledInfo *)self style] stylesheet] variationOfStyle:[(TSDStyledInfo *)self style] propertyMap:v16];
  [(TSDStyledInfo *)self style];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSDStyledInfo setBoxedValue:forProperty:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 180, @"Variation style is wrong style.");
  }
  [(TSDStyledInfo *)self setStyle:v13];
}

- (void)setValuesForProperties:(id)a3
{
  if (![(TSDStyledInfo *)self style])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDStyledInfo setValuesForProperties:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 189, @"invalid nil value for '%s'", "self.style");
  }
  if (![(TSSStyle *)[(TSDStyledInfo *)self style] stylesheet])
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDStyledInfo setValuesForProperties:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 190, @"invalid nil value for '%s'", "self.style.stylesheet");
  }
  -[TSDDrawableInfo willChangeProperties:](self, "willChangeProperties:", [a3 allProperties]);
  id v9 = [(TSSStylesheet *)[(TSSStyle *)[(TSDStyledInfo *)self style] stylesheet] variationOfStyle:[(TSDStyledInfo *)self style] propertyMap:a3];
  [(TSDStyledInfo *)self style];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDStyledInfo setValuesForProperties:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 195, @"Variation style is wrong style.");
  }

  [(TSDStyledInfo *)self setStyle:v9];
}

- (void)i_setValue:(id)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a3)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDStyledInfo i_setValue:forProperty:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 202, @"invalid nil value for '%s'", "value");
  }
  if (![(TSDStyledInfo *)self style])
  {
    id v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDStyledInfo i_setValue:forProperty:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 203, @"invalid nil value for '%s'", "self.style");
  }
  if (![(TSSStyle *)[(TSDStyledInfo *)self style] stylesheet])
  {
    uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDStyledInfo i_setValue:forProperty:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 204, @"invalid nil value for '%s'", "self.style.stylesheet");
  }
  [(TSDDrawableInfo *)self willChangeProperty:v4];
  v16 = -[TSSPropertyMap initWithPropertiesAndValues:]([TSSPropertyMap alloc], "initWithPropertiesAndValues:", v4, a3, 0);
  id v13 = [(TSSStylesheet *)[(TSSStyle *)[(TSDStyledInfo *)self style] stylesheet] variationOfStyle:[(TSDStyledInfo *)self style] propertyMap:v16];
  [(TSDStyledInfo *)self style];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSDStyledInfo i_setValue:forProperty:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 210, @"Variation style is wrong style.");
  }
  [(TSDStyledInfo *)self setStyle:v13];
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__TSDStyledInfo_adoptStylesheet_withMapper___block_invoke;
  v4[3] = &unk_2646B24C0;
  v4[4] = a4;
  [(TSDStyledInfo *)self replaceReferencedStylesUsingBlock:v4];
}

uint64_t __44__TSDStyledInfo_adoptStylesheet_withMapper___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) mappedStyleForStyle:a2];
}

- (id)propertyMapForNewPreset
{
  v2 = [(TSDStyledInfo *)self style];

  return [(TSSStyle *)v2 fullPropertyMap];
}

- (id)styleIdentifierTemplateForNewPreset
{
  v2 = [(TSSStyle *)[(TSDStyledInfo *)self style] baseStyleForVariation];

  return [(TSSStyle *)v2 styleIdentifier];
}

- (id)referencedStyles
{
  uint64_t v3 = [(TSDStyledInfo *)self style];
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  if (v3)
  {
    uint64_t v5 = [(TSDStyledInfo *)self style];
    return (id)[v4 setWithObject:v5];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    return (id)[v7 set];
  }
}

- (void)replaceReferencedStylesUsingBlock:(id)a3
{
  uint64_t v5 = [(TSDStyledInfo *)self style];
  uint64_t v6 = (*((uint64_t (**)(id, TSSStyle *))a3 + 2))(a3, v5);
  if (!v6)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDStyledInfo replaceReferencedStylesUsingBlock:]"];
    [v7 handleFailureInFunction:v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"), 246, @"Failed to map style %@", v5 file lineNumber description];
  }
  [(TSDStyledInfo *)self styleClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDStyledInfo replaceReferencedStylesUsingBlock:]"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDStyledInfo.m"];
    uint64_t v12 = (objc_class *)objc_opt_class();
    [v9 handleFailureInFunction:v10, v11, 247, @"style mapped returned style of class %@ for %@", NSStringFromClass(v12), v5 file lineNumber description];
  }

  [(TSDStyledInfo *)self setStyle:v6];
}

@end