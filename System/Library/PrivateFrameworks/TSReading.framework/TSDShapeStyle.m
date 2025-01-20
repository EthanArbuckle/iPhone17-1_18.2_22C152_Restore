@interface TSDShapeStyle
+ (BOOL)validateFloatValue:(float *)a3 forProperty:(int)a4;
+ (float)defaultFloatValueForProperty:(int)a3;
+ (id)defaultValueForProperty:(int)a3;
+ (id)p_magicMoveProperties;
+ (id)properties;
+ (id)propertiesAllowingNSNull;
+ (void)initialize;
- (BOOL)wantsHighContrastBackgroundColor;
- (id)boxedValueForProperty:(int)a3 oldBoxedValue:(id)a4 transformedByTransform:(CGAffineTransform *)a5;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (int64_t)mixingTypeWithObject:(id)a3;
- (void)fixImageFillTechniqueForSwatchOfSize:(CGSize)a3;
@end

@implementation TSDShapeStyle

+ (void)initialize
{
  if (!sDefaultStroke)
  {
    objc_sync_enter(a1);
    if (!sDefaultStroke)
    {
      v3 = objc_alloc_init(TSDStroke);
      __dmb(0xBu);
      sDefaultStroke = (uint64_t)v3;
      if (!v3)
      {
        v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v5 = [NSString stringWithUTF8String:"+[TSDShapeStyle initialize]"];
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"), 36, @"Couldn't initialize lazy variable %s", "sDefaultStroke");
      }
    }
    objc_sync_exit(a1);
  }
  if (!sNSNullNull)
  {
    objc_sync_enter(a1);
    if (!sNSNullNull)
    {
      id v6 = (id)[MEMORY[0x263EFF9D0] null];
      __dmb(0xBu);
      sNSNullNull = (uint64_t)v6;
      if (!v6)
      {
        v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v8 = [NSString stringWithUTF8String:"+[TSDShapeStyle initialize]"];
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"), 40, @"Couldn't initialize lazy variable %s", "sNSNullNull");
      }
    }
    objc_sync_exit(a1);
  }
}

+ (id)properties
{
  id result = (id)properties_sProperties;
  if (!properties_sProperties)
  {
    objc_sync_enter(a1);
    if (!properties_sProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 516, 517, 518, 519, 520, 0);
      __dmb(0xBu);
      properties_sProperties = (uint64_t)v4;
      if (!v4)
      {
        uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSDShapeStyle properties]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"), 57, @"Couldn't initialize lazy variable %s", "sProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)properties_sProperties;
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
  id result = 0;
  switch(a3)
  {
    case 516:
      id result = +[TSDColorFill clearColor];
      break;
    case 517:
      id result = (id)sDefaultStroke;
      break;
    case 519:
    case 520:
      id result = (id)sNSNullNull;
      break;
    default:
      return result;
  }
  return result;
}

+ (id)propertiesAllowingNSNull
{
  id result = (id)propertiesAllowingNSNull_sNullProperties;
  if (!propertiesAllowingNSNull_sNullProperties)
  {
    objc_sync_enter(a1);
    if (!propertiesAllowingNSNull_sNullProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 516, 519, 520, 0);
      __dmb(0xBu);
      propertiesAllowingNSNull_sNullProperties = (uint64_t)v4;
      if (!v4)
      {
        uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSDShapeStyle propertiesAllowingNSNull]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"), 109, @"Couldn't initialize lazy variable %s", "sNullProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)propertiesAllowingNSNull_sNullProperties;
  }
  return result;
}

+ (BOOL)validateFloatValue:(float *)a3 forProperty:(int)a4
{
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___TSDShapeStyle;
  unsigned int v6 = objc_msgSendSuper2(&v18, sel_validateFloatValue_forProperty_);
  BOOL v8 = v6;
  if (a4 == 518 && v6)
  {
    *(float *)&double v7 = *a3;
    if (*a3 < 0.0)
    {
      float v9 = 0.0;
      uint64_t v10 = 121;
LABEL_7:
      v11 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", v7);
      uint64_t v12 = [NSString stringWithUTF8String:"+[TSDShapeStyle validateFloatValue:forProperty:]"];
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"];
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
      uint64_t v10 = 125;
      goto LABEL_7;
    }
  }
  return v8;
}

+ (id)p_magicMoveProperties
{
  id result = (id)p_magicMoveProperties_s_magicMoveProperties;
  if (!p_magicMoveProperties_s_magicMoveProperties)
  {
    objc_sync_enter(a1);
    if (!p_magicMoveProperties_s_magicMoveProperties)
    {
      v4 = +[TSSPropertySet propertySetWithProperties:](TSSPropertySet, "propertySetWithProperties:", 512, 513, 515, 516, 517, 518, 519, 520, 522, 523, 526, 528, 529, 0);
      __dmb(0xBu);
      p_magicMoveProperties_s_magicMoveProperties = (uint64_t)v4;
      if (!v4)
      {
        uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSDShapeStyle p_magicMoveProperties]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"), 156, @"Couldn't initialize lazy variable %s", "s_magicMoveProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)p_magicMoveProperties_s_magicMoveProperties;
  }
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__TSDShapeStyle_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __38__TSDShapeStyle_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDShapeStyle mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeStyle.m"), 166, @"nil object after cast");
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
  v10[2] = __38__TSDShapeStyle_mixingTypeWithObject___block_invoke_2;
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

uint64_t __38__TSDShapeStyle_mixingTypeWithObject___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsProperty:a2];
  if (result)
  {
    uint64_t v7 = (void *)[*(id *)(a1 + 40) boxedValueForProperty:a2];
    unint64_t v8 = [*(id *)(a1 + 48) boxedValueForProperty:a2];
    if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "propertiesAllowingNSNull"), "containsProperty:", a2))uint64_t v9 = TSDMixingTypeWithPossiblyNilObjects((unint64_t)v7, v8); {
    else
    }
      uint64_t v9 = [v7 mixingTypeWithObject:v8];
    if (v9 == 1 && a2 == 516) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = v9;
    }
    uint64_t result = TSDMixingTypeBestFromMixingTypes(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v11);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1) {
    *a3 = 1;
  }
  return result;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__TSDShapeStyle_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

id __50__TSDShapeStyle_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
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
  v8[2] = __50__TSDShapeStyle_mixedObjectWithFraction_ofObject___block_invoke_2;
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

uint64_t __50__TSDShapeStyle_mixedObjectWithFraction_ofObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsProperty:a2];
  if (result)
  {
    id v5 = (void *)[*(id *)(a1 + 40) boxedValueForProperty:a2];
    uint64_t result = [*(id *)(a1 + 48) boxedValueForProperty:a2];
    if (v5 && result != 0)
    {
      uint64_t v7 = [v5 mixedObjectWithFraction:result ofObject:*(double *)(a1 + 64)];
      unint64_t v8 = *(void **)(a1 + 56);
      return [v8 setBoxedValue:v7 forProperty:a2];
    }
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
      v12.super_class = (Class)TSDShapeStyle;
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

- (BOOL)wantsHighContrastBackgroundColor
{
  id v3 = [(TSSStyle *)self valueForProperty:516];
  id v4 = [(TSSStyle *)self valueForProperty:517];
  [(TSSStyle *)self CGFloatValueForProperty:518];
  double v6 = v5;
  if (v3 == (id)[MEMORY[0x263EFF9D0] null])
  {
    long long v7 = (void *)[v4 color];
    if (objc_msgSend(v7, "isAlmostEqualToColor:", objc_msgSend(MEMORY[0x263F7C808], "whiteColor"))) {
      return 1;
    }
  }
  uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  return v6 != 1.0 && v3 != (id)v9;
}

- (void)fixImageFillTechniqueForSwatchOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(TSSStyle *)self boxedValueForProperty:516];
  if (v6)
  {
    if (v6 != (id)[MEMORY[0x263EFF9D0] null])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        long long v7 = (void *)TSUDynamicCast();
        if ([v7 technique] == 4
          || ![v7 technique]
          && (([v7 fillSize], v9 >= width) ? (BOOL v10 = v8 < height) : (BOOL v10 = 1), v10))
        {
          id v11 = (id)[v7 mutableCopy];
          [v11 setTechnique:3];
          [(TSSStyle *)self setBoxedValue:v11 forProperty:516];
        }
      }
    }
  }
}

@end