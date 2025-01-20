@interface TSDMediaStyle
+ (BOOL)validateFloatValue:(float *)a3 forProperty:(int)a4;
+ (float)defaultFloatValueForProperty:(int)a3;
+ (id)defaultValueForProperty:(int)a3;
+ (id)imageStylePresetStyleDescriptor;
+ (id)movieStylePresetStyleDescriptor;
+ (id)p_magicMoveProperties;
+ (id)properties;
+ (id)propertiesAllowingNSNull;
+ (void)initialize;
- (NSString)presetKind;
- (SEL)mapThemePropertyMapSelector;
- (id)boxedValueForProperty:(int)a3 oldBoxedValue:(id)a4 transformedByTransform:(CGAffineTransform *)a5;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (int64_t)mixingTypeWithObject:(id)a3;
@end

@implementation TSDMediaStyle

+ (void)initialize
{
  if (!sDefaultStroke_0) {
    sDefaultStroke_0 = (uint64_t)+[TSDStroke emptyStroke];
  }
}

+ (id)imageStylePresetStyleDescriptor
{
  return @"imageStyle";
}

+ (id)movieStylePresetStyleDescriptor
{
  return @"movieStyle";
}

+ (id)properties
{
  id result = (id)properties_sProperties_0;
  if (!properties_sProperties_0)
  {
    id result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 517, 518, 519, 520, 0);
    properties_sProperties_0 = (uint64_t)result;
  }
  return result;
}

+ (float)defaultFloatValueForProperty:(int)a3
{
  float result = INFINITY;
  if (a3 == 518) {
    return 1.0;
  }
  return result;
}

+ (id)defaultValueForProperty:(int)a3
{
  if (a3 == 520 || a3 == 519) {
    return (id)[MEMORY[0x263EFF9D0] null];
  }
  if (a3 == 517) {
    return (id)sDefaultStroke_0;
  }
  return 0;
}

+ (id)propertiesAllowingNSNull
{
  id result = (id)propertiesAllowingNSNull_s_nullProperties;
  if (!propertiesAllowingNSNull_s_nullProperties)
  {
    objc_sync_enter(a1);
    if (!propertiesAllowingNSNull_s_nullProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 519, 520, 0);
      __dmb(0xBu);
      propertiesAllowingNSNull_s_nullProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSDMediaStyle propertiesAllowingNSNull]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaStyle.m"), 135, @"Couldn't initialize lazy variable %s", "s_nullProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)propertiesAllowingNSNull_s_nullProperties;
  }
  return result;
}

+ (BOOL)validateFloatValue:(float *)a3 forProperty:(int)a4
{
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___TSDMediaStyle;
  unsigned int v6 = objc_msgSendSuper2(&v18, sel_validateFloatValue_forProperty_);
  BOOL v8 = v6;
  if (a4 == 518 && v6)
  {
    *(float *)&double v7 = *a3;
    if (*a3 < 0.0)
    {
      float v9 = 0.0;
      uint64_t v10 = 147;
LABEL_7:
      v11 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", v7);
      uint64_t v12 = [NSString stringWithUTF8String:"+[TSDMediaStyle validateFloatValue:forProperty:]"];
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaStyle.m"];
      double v14 = *a3;
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      [v11 handleFailureInFunction:v12, v13, v10, @"Unexpected float value %g for %@ property %@ out of range [0.0, 1.0].", *(void *)&v14, v16, String(518) file lineNumber description];
      *a3 = v9;
      return v8;
    }
    float v9 = 1.0;
    if (*(float *)&v7 > 1.0)
    {
      uint64_t v10 = 151;
      goto LABEL_7;
    }
  }
  return v8;
}

- (NSString)presetKind
{
  v2 = self;
  v3 = (NSString *)String;
  if (![(TSSStyle *)self styleIdentifier]) {
    v2 = [(TSSStyle *)v2 firstIdentifiedAncestor];
  }
  v4 = (void *)String([(TSSStyle *)v2 styleIdentifier]);
  if ([v4 isEqualToString:@"image"]) {
    return (NSString *)String;
  }
  if ([v4 isEqualToString:@"movie"]) {
    return (NSString *)String;
  }
  v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v6 = [NSString stringWithUTF8String:"-[TSDMediaStyle presetKind]"];
  [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaStyle.m"), 180, @"Could not compute presetKind because of a bad packageString: %@", v4 file lineNumber description];
  return v3;
}

- (SEL)mapThemePropertyMapSelector
{
  return sel_tsdMapImageStylePropertyMap_;
}

+ (id)p_magicMoveProperties
{
  id result = (id)p_magicMoveProperties_s_magicMoveProperties_0;
  if (!p_magicMoveProperties_s_magicMoveProperties_0)
  {
    objc_sync_enter(a1);
    if (!p_magicMoveProperties_s_magicMoveProperties_0)
    {
      v4 = +[TSSPropertySet propertySetWithProperties:](TSSPropertySet, "propertySetWithProperties:", 512, 513, 515, 517, 518, 519, 520, 528, 529, 0);
      __dmb(0xBu);
      p_magicMoveProperties_s_magicMoveProperties_0 = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSDMediaStyle p_magicMoveProperties]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaStyle.m"), 211, @"Couldn't initialize lazy variable %s", "s_magicMoveProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)p_magicMoveProperties_s_magicMoveProperties_0;
  }
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__TSDMediaStyle_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __38__TSDMediaStyle_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDMediaStyle mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMediaStyle.m"), 221, @"nil object after cast");
  }
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "p_magicMoveProperties");
  id v6 = +[TSSPropertySet propertySet];
  objc_msgSend(v6, "addProperties:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "propertyMap"), "allProperties"));
  objc_msgSend(v6, "addProperties:", objc_msgSend((id)objc_msgSend(v2, "propertyMap"), "allProperties"));
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__TSDMediaStyle_mixingTypeWithObject___block_invoke_2;
  v10[3] = &unk_2646B1A88;
  uint64_t v7 = *(void *)(a1 + 40);
  v10[4] = v5;
  v10[5] = v7;
  v10[6] = v2;
  v10[7] = &v11;
  [v6 enumeratePropertiesUsingBlock:v10];
  uint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __38__TSDMediaStyle_mixingTypeWithObject___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsProperty:a2];
  if (result)
  {
    unint64_t v7 = [*(id *)(a1 + 40) boxedValueForProperty:a2];
    unint64_t v8 = [*(id *)(a1 + 48) boxedValueForProperty:a2];
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v10 = TSDMixingTypeWithPossiblyNilObjects(v7, v8);
    uint64_t result = TSDMixingTypeBestFromMixingTypes(v9, v10);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1) {
      *a3 = 1;
    }
  }
  return result;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__TSDMediaStyle_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

id __50__TSDMediaStyle_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  id v3 = (id)objc_msgSend(*(id *)(a1 + 40), "copyWithContext:", objc_msgSend(*(id *)(a1 + 40), "context"));
  uint64_t v4 = objc_msgSend((id)objc_opt_class(), "p_magicMoveProperties");
  id v5 = +[TSSPropertySet propertySet];
  objc_msgSend(v5, "addProperties:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "propertyMap"), "allProperties"));
  objc_msgSend(v5, "addProperties:", objc_msgSend((id)objc_msgSend(v2, "propertyMap"), "allProperties"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__TSDMediaStyle_mixedObjectWithFraction_ofObject___block_invoke_2;
  v8[3] = &unk_2646B1AB0;
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = v4;
  v8[5] = v6;
  v8[8] = *(void *)(a1 + 48);
  v8[6] = v2;
  v8[7] = v3;
  [v5 enumeratePropertiesUsingBlock:v8];
  return v3;
}

uint64_t __50__TSDMediaStyle_mixedObjectWithFraction_ofObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsProperty:a2];
  if (result)
  {
    uint64_t v5 = TSDMixedObjectWithPossiblyNilObjects((void *)[*(id *)(a1 + 40) boxedValueForProperty:a2], objc_msgSend(*(id *)(a1 + 48), "boxedValueForProperty:", a2), *(double *)(a1 + 64));
    uint64_t v6 = *(void **)(a1 + 56);
    return [v6 setBoxedValue:v5 forProperty:a2];
  }
  return result;
}

- (id)boxedValueForProperty:(int)a3 oldBoxedValue:(id)a4 transformedByTransform:(CGAffineTransform *)a5
{
  id v6 = a4;
  if (a3 == 517)
  {
    if (a4 && (id)[MEMORY[0x263EFF9D0] null] != a4)
    {
      long long v9 = *(_OWORD *)&a5->c;
      long long v13 = *(_OWORD *)&a5->a;
      long long v14 = v9;
      long long v15 = *(_OWORD *)&a5->tx;
      return (id)[v6 strokeByTransformingByTransform:&v13];
    }
  }
  else
  {
    if (a3 != 520)
    {
      v12.receiver = self;
      v12.super_class = (Class)TSDMediaStyle;
      long long v10 = *(_OWORD *)&a5->c;
      long long v13 = *(_OWORD *)&a5->a;
      long long v14 = v10;
      long long v15 = *(_OWORD *)&a5->tx;
      return [(TSSStyle *)&v12 boxedValueForProperty:*(void *)&a3 oldBoxedValue:a4 transformedByTransform:&v13];
    }
    if (a4 && (id)[MEMORY[0x263EFF9D0] null] != a4)
    {
      long long v7 = *(_OWORD *)&a5->c;
      long long v13 = *(_OWORD *)&a5->a;
      long long v14 = v7;
      long long v15 = *(_OWORD *)&a5->tx;
      return (id)[v6 shadowByTransformingByTransform:&v13];
    }
  }
  return v6;
}

@end