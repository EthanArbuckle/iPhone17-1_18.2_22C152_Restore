@interface TSSStyle
+ (BOOL)validateDoubleValue:(double *)a3 forProperty:(int)a4;
+ (BOOL)validateFloatValue:(float *)a3 forProperty:(int)a4;
+ (BOOL)validateIntValue:(int *)a3 forProperty:(int)a4;
+ (BOOL)validateIntValue:(int *)a3 forProperty:(int)a4 min:(int)a5 max:(int)a6;
+ (BOOL)validateIntValueAsBool:(int *)a3 forProperty:(int)a4;
+ (BOOL)validateObjectValue:(id *)a3 withClass:(Class)a4 forProperty:(int)a5;
+ (double)defaultDoubleValueForProperty:(int)a3;
+ (double)fontSizeForFontSize:(double)a3 scalingFactor:(double)a4;
+ (float)defaultFloatValueForProperty:(int)a3;
+ (id)boxedDefaultValueForProperty:(int)a3;
+ (id)defaultPropertyMap;
+ (id)defaultStyleWithContext:(id)a3;
+ (id)defaultValueForProperty:(int)a3;
+ (id)description;
+ (id)properties;
+ (id)propertiesAllowingNSNull;
+ (int)defaultIntValueForProperty:(int)a3;
- (BOOL)definesProperty:(int)a3;
- (BOOL)hasEqualPropertyValues:(id)a3;
- (BOOL)hasEqualValues:(id)a3 forProperties:(id)a4;
- (BOOL)hasEqualValuesToPropertyMap:(id)a3 forProperties:(id)a4;
- (BOOL)isAncestorOf:(id)a3;
- (BOOL)isChildOf:(id)a3;
- (BOOL)isDescendentOf:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIdentified;
- (BOOL)isNamed;
- (BOOL)isParentOf:(id)a3;
- (BOOL)isThemeEquivalent:(id)a3;
- (BOOL)isVariation;
- (BOOL)overridePropertyMapIsEqualTo:(id)a3;
- (BOOL)overridesAnyProperty;
- (BOOL)overridesProperty:(int)a3;
- (BOOL)p_hasEqualValuesTo:(id)a3 forProperty:(int)a4;
- (BOOL)transformsFontSizes;
- (BOOL)validateDoubleValue:(double *)a3 forProperty:(int)a4;
- (BOOL)validateFloatValue:(float *)a3 forProperty:(int)a4;
- (BOOL)validateIntValue:(int *)a3 forProperty:(int)a4;
- (BOOL)validateIntValue:(int *)a3 forProperty:(int)a4 min:(int)a5 max:(int)a6;
- (BOOL)validateIntValueAsBool:(int *)a3 forProperty:(int)a4;
- (BOOL)validateObjectValue:(id *)a3 withClass:(Class)a4 forProperty:(int)a5;
- (NSSet)children;
- (NSString)name;
- (NSString)styleIdentifier;
- (SEL)mapThemeAssetSelector;
- (TSSPropertyMap)overridePropertyMap;
- (TSSStyle)baseStyleForVariation;
- (TSSStyle)firstIdentifiedAncestor;
- (TSSStyle)init;
- (TSSStyle)initWithContext:(id)a3;
- (TSSStyle)initWithContext:(id)a3 name:(id)a4 overridePropertyMap:(id)a5 isVariation:(BOOL)a6;
- (TSSStyle)parent;
- (TSSStyle)rootAncestor;
- (TSSStyle)rootIdentifiedAncestor;
- (TSSStylesheet)stylesheet;
- (double)CGFloatValueForProperty:(int)a3;
- (double)doubleValueForProperty:(int)a3;
- (double)overrideCGFloatValueForProperty:(int)a3;
- (double)overrideDoubleValueForProperty:(int)a3;
- (float)floatValueForProperty:(int)a3;
- (float)overrideFloatValueForProperty:(int)a3;
- (id)boxedOverrideValueForProperty:(int)a3;
- (id)boxedValueForProperty:(int)a3;
- (id)boxedValueForProperty:(int)a3 oldBoxedValue:(id)a4 transformedByTransform:(CGAffineTransform *)a5;
- (id)constrainShapeStyleForContext:(id)a3;
- (id)copyFlattenedWithContext:(id)a3;
- (id)copyPropertyMap;
- (id)copyWithContext:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithZone:(_NSZone *)a3 context:(id)a4;
- (id)newOverridePropertyMapWithPropertyMap:(id)a3;
- (id)overriddenProperties;
- (id)overridePropertyMapWithPropertyMap:(id)a3 overridePropertyMap:(id)a4 collapseSourceOverrides:(BOOL)a5;
- (id)overrideValueForProperty:(int)a3;
- (id)propertyMap;
- (id)propertyMapIgnoringStyle:(id)a3;
- (id)referencedStyles;
- (id)valueForProperty:(int)a3;
- (id)valuesForProperties:(id)a3;
- (int)intValueForProperty:(int)a3;
- (int)overrideIntValueForProperty:(int)a3;
- (unint64_t)hash;
- (unint64_t)overrideCount;
- (void)constrainShadowForSwatchGeneration;
- (void)constrainStrokeForSwatchGeneration;
- (void)dealloc;
- (void)fadeReflectionForSwatchGeneration;
- (void)removeAllValues;
- (void)removeValueForProperty:(int)a3;
- (void)replaceReferencedStylesUsingBlock:(id)a3;
- (void)setBoxedValue:(id)a3 forProperty:(int)a4;
- (void)setCGFloatValue:(double)a3 forProperty:(int)a4;
- (void)setDoubleValue:(double)a3 forProperty:(int)a4;
- (void)setFloatValue:(float)a3 forProperty:(int)a4;
- (void)setIntValue:(int)a3 forProperty:(int)a4;
- (void)setName:(id)a3;
- (void)setOverridePropertyMap:(id)a3;
- (void)setParent:(id)a3;
- (void)setStyleIdentifier:(id)a3;
- (void)setStylesheet:(id)a3;
- (void)setValue:(id)a3 forProperty:(int)a4;
- (void)setValuesForProperties:(id)a3;
@end

@implementation TSSStyle

- (int)intValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap
    || (int result = [(TSSPropertyMap *)mOverridePropertyMap intValueForProperty:*(void *)&a3],
        result == 0x80000000))
  {
    mParent = self->mParent;
    if (mParent)
    {
      return [(TSSStyle *)mParent intValueForProperty:v3];
    }
    else
    {
      v8 = objc_opt_class();
      return [v8 defaultIntValueForProperty:v3];
    }
  }
  return result;
}

- (float)floatValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap
    || ([(TSSPropertyMap *)mOverridePropertyMap floatValueForProperty:*(void *)&a3],
        result == INFINITY))
  {
    mParent = self->mParent;
    if (mParent)
    {
      [(TSSStyle *)mParent floatValueForProperty:v3];
    }
    else
    {
      v8 = objc_opt_class();
      [v8 defaultFloatValueForProperty:v3];
    }
  }
  return result;
}

- (id)valueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap
    || (id result = [(TSSPropertyMap *)mOverridePropertyMap objectForProperty:*(void *)&a3]) == 0)
  {
    mParent = self->mParent;
    if (mParent)
    {
      return [(TSSStyle *)mParent valueForProperty:v3];
    }
    else
    {
      v8 = objc_opt_class();
      return (id)[v8 defaultValueForProperty:v3];
    }
  }
  return result;
}

uint64_t __30__TSSStyle_defaultPropertyMap__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) boxedDefaultValueForProperty:a2];
  v5 = *(void **)(a1 + 40);

  return [v5 setBoxedObject:v4 forProperty:a2];
}

- (id)boxedValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap
    || (id result = [(TSSPropertyMap *)mOverridePropertyMap boxedObjectForProperty:*(void *)&a3]) == 0)
  {
    mParent = self->mParent;
    if (mParent)
    {
      return [(TSSStyle *)mParent boxedValueForProperty:v3];
    }
    else
    {
      v8 = objc_opt_class();
      return (id)[v8 boxedDefaultValueForProperty:v3];
    }
  }
  return result;
}

+ (int)defaultIntValueForProperty:(int)a3
{
  return 0x80000000;
}

+ (id)defaultValueForProperty:(int)a3
{
  return 0;
}

- (BOOL)definesProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[TSSPropertyMap containsProperty:](self->mOverridePropertyMap, "containsProperty:")) {
    return 1;
  }
  mParent = self->mParent;

  return [(TSSStyle *)mParent definesProperty:v3];
}

- (BOOL)isVariation
{
  return self->mIsVariation;
}

- (BOOL)overridePropertyMapIsEqualTo:(id)a3
{
  mOverridePropertyMap = self->mOverridePropertyMap;
  return mOverridePropertyMap == a3 || -[TSSPropertyMap isEqual:](mOverridePropertyMap, "isEqual:");
}

- (id)newOverridePropertyMapWithPropertyMap:(id)a3
{
  mParent = self;
  if (self->mIsVariation)
  {
    mParent = self->mParent;
    if (!mParent)
    {
      v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[TSSStyle newOverridePropertyMapWithPropertyMap:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 1197, @"Can't create variation of a nil base style.");
      mParent = 0;
    }
  }
  if ([(TSSStyle *)mParent isVariation])
  {
    v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSSStyle newOverridePropertyMapWithPropertyMap:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 1198, @"Can't create variation of a variation base style.");
  }
  if (self->mIsVariation && (mOverridePropertyMap = self->mOverridePropertyMap) != 0)
  {
    v11 = (void *)[(TSSPropertyMap *)mOverridePropertyMap copy];
    [v11 addValuesFromPropertyMap:a3];
  }
  else
  {
    v11 = (void *)[a3 copy];
  }
  id v12 = [(TSSStyle *)mParent copyPropertyMap];
  [v11 removeValuesFromPropertyMap:v12];

  return v11;
}

- (id)copyPropertyMap
{
  mParent = self->mParent;
  if (mParent) {
    id v4 = [(TSSStyle *)mParent copyPropertyMap];
  }
  else {
    id v4 = 0;
  }
  if (![(TSSPropertyMap *)self->mOverridePropertyMap count]) {
    return v4;
  }
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (v4)
  {
    [v4 addValuesFromPropertyMap:mOverridePropertyMap];
    return v4;
  }
  uint64_t v7 = self->mOverridePropertyMap;

  return (id)[(TSSPropertyMap *)v7 copy];
}

+ (float)defaultFloatValueForProperty:(int)a3
{
  return INFINITY;
}

+ (id)boxedDefaultValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  switch(String(a3))
  {
    case 0u:
      id result = (id)[a1 defaultValueForProperty:v3];
      break;
    case 1u:
      uint64_t v12 = [a1 defaultIntValueForProperty:v3];
      if (v12 == 0x80000000) {
        goto LABEL_15;
      }
      uint64_t v13 = v12;
      v14 = NSNumber;
      id result = (id)[v14 numberWithInt:v13];
      break;
    case 2u:
      [a1 defaultFloatValueForProperty:v3];
      if (v6 == INFINITY) {
        goto LABEL_15;
      }
      uint64_t v7 = NSNumber;
      id result = (id)objc_msgSend(v7, "numberWithFloat:");
      break;
    case 3u:
      [a1 defaultDoubleValueForProperty:v3];
      if (v8 == INFINITY) {
        goto LABEL_15;
      }
      uint64_t v9 = NSNumber;
      id result = (id)objc_msgSend(v9, "numberWithDouble:");
      break;
    default:
      v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"+[TSSStyle boxedDefaultValueForProperty:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 433, @"Unexpected property type");
LABEL_15:
      id result = 0;
      break;
  }
  return result;
}

- (TSSStyle)initWithContext:(id)a3 name:(id)a4 overridePropertyMap:(id)a5 isVariation:(BOOL)a6
{
  v18.receiver = self;
  v18.super_class = (Class)TSSStyle;
  uint64_t v9 = [(TSPObject *)&v18 initWithContext:a3];
  if (v9)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "properties"), "containsProperties:", objc_msgSend(a5, "allProperties")))
    {
      if ([a4 isEqual:&stru_26D688A48])
      {
        v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v11 = [NSString stringWithUTF8String:"-[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]"];
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 502, @"Style name may not be the empty string.");
        a4 = 0;
      }
      v9->mName = (NSString *)[a4 copy];
      if (a5) {
        v9->mOverridePropertyMap = [[TSSPropertyMap alloc] initWithPropertyMap:a5];
      }
      v9->mIsVariation = a6;
    }
    else
    {
      uint64_t v12 = objc_msgSend((id)objc_msgSend(a5, "allProperties"), "propertySetByRemovingPropertiesFromSet:", objc_msgSend((id)objc_opt_class(), "properties"));
      uint64_t v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v14 = [NSString stringWithUTF8String:"-[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]"];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"];
      v16 = (objc_class *)objc_opt_class();
      [v13 handleFailureInFunction:v14, v15, 496, @"Attempt to initialize a style of class %@ with an override of one or more unsupported properties : %@", NSStringFromClass(v16), v12 file lineNumber description];

      return 0;
    }
  }
  return v9;
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

- (void)setStylesheet:(id)a3
{
  self->mStylesheet = (TSSStylesheet *)a3;
}

- (TSSStyle)parent
{
  return self->mParent;
}

- (NSString)styleIdentifier
{
  return self->mStyleIdentifier;
}

- (void)setStyleIdentifier:(id)a3
{
  [(TSPObject *)self willModify];
  v5 = (NSString *)[a3 copy];

  self->mStyleIdentifier = v5;
}

- (void)setParent:(id)a3
{
  if (self->mParent != a3)
  {
    [(TSPObject *)self willModify];
    id v5 = a3;

    self->mParent = (TSSStyle *)a3;
  }
}

- (void)setValue:(id)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(TSPObject *)self willModify];
  if (a3)
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (!mOverridePropertyMap)
    {
      mOverridePropertyMap = objc_alloc_init(TSSPropertyMap);
      self->mOverridePropertyMap = mOverridePropertyMap;
    }
    [(TSSPropertyMap *)mOverridePropertyMap setObject:a3 forProperty:v4];
  }
  else
  {
    double v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSSStyle setValue:forProperty:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"];
    uint64_t v11 = String(v4);
    [v8 handleFailureInFunction:v9, v10, 884, @"Tried to set property %@ of style %@ to an undefined value.", v11, TSUObjectReferenceDescription() file lineNumber description];
  }
}

+ (id)defaultPropertyMap
{
  uint64_t v3 = objc_alloc_init(TSSPropertyMap);
  uint64_t v4 = (void *)[a1 properties];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__TSSStyle_defaultPropertyMap__block_invoke;
  v6[3] = &unk_2646B0F08;
  v6[4] = a1;
  v6[5] = v3;
  [v4 enumeratePropertiesUsingBlock:v6];
  return v3;
}

- (NSString)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = (NSString *)[a3 copy];

  self->mName = v5;
}

+ (id)properties
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"+[TSSStyle properties]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 372, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "+[TSSStyle properties]"), 0 reason userInfo]);
}

+ (id)description
{
  uint64_t v3 = (void *)[MEMORY[0x263F089D8] stringWithFormat:@"%@", NSStringFromClass((Class)a1)];
  for (i = (void *)[a1 superclass]; i != objc_opt_class(); i = objc_msgSend(i, "superclass"))objc_msgSend(v3, "appendFormat:", @" : %@", NSStringFromClass((Class)i));
  uint64_t v5 = [MEMORY[0x263F089D8] string];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3052000000;
  v10[3] = __Block_byref_object_copy__7;
  v10[4] = __Block_byref_object_dispose__7;
  v10[5] = &stru_26D688A48;
  float v6 = (void *)[a1 properties];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __23__TSSStyle_description__block_invoke;
  v9[3] = &unk_2646B1028;
  v9[4] = v5;
  v9[5] = v10;
  [v6 enumeratePropertiesUsingBlock:v9];
  uint64_t v7 = (void *)[NSString stringWithFormat:@"<%@> = {\n%@\n}", v3, objc_msgSend(NSString, "tsu_stringByIndentingString:", v5)];
  _Block_object_dispose(v10, 8);
  return v7;
}

uint64_t __23__TSSStyle_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) appendFormat:@"%@%3d %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2, String(a2)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = @"\n";
  return result;
}

+ (double)defaultDoubleValueForProperty:(int)a3
{
  return INFINITY;
}

+ (id)defaultStyleWithContext:(id)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContext:a3 name:0 overridePropertyMap:0 isVariation:0];

  return v3;
}

- (TSSStyle)initWithContext:(id)a3
{
  return [(TSSStyle *)self initWithContext:a3 name:0 overridePropertyMap:0 isVariation:0];
}

- (TSSStyle)init
{
  uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSSStyle init]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 529, @"Must init with an object context.");

  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSSStyle;
  [(TSSStyle *)&v3 dealloc];
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v19 = v3;
  uint64_t v20 = v4;
  if (!a3) {
    return 0;
  }
  uint64_t v7 = objc_opt_class();
  if (v7 != objc_opt_class()) {
    return 0;
  }
  uint64_t v9 = (NSString *)*((void *)a3 + 7);
  int v10 = v9 == self->mName || -[NSString isEqualToString:](v9, "isEqualToString:");
  uint64_t v11 = (NSString *)*((void *)a3 + 8);
  if ((v11 == self->mStyleIdentifier || -[NSString isEqualToString:](v11, "isEqualToString:"))
    && *((unsigned __int8 *)a3 + 80) == self->mIsVariation)
  {
    uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary");
    id v13 = (id)[v12 objectForKeyedSubscript:@"TSSStyleIsEqualStylesBeingCompared"];
    if (!v13)
    {
      id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [v12 setObject:v13 forKeyedSubscript:@"TSSStyleIsEqualStylesBeingCompared"];
    }
    v17 = self;
    id v18 = a3;
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F08D40]) initWithBytes:&v17 objCType:"{?=@@}"];
    if ((objc_msgSend(v13, "containsObject:", v14, v17, v18) & 1) == 0)
    {
      [v13 addObject:v14];
      uint64_t v15 = (TSSStyle *)*((void *)a3 + 9);
      if (v15 == self->mParent || -[TSSStyle isEqual:](v15, "isEqual:"))
      {
        v16 = (TSSPropertyMap *)*((void *)a3 + 6);
        if (v16 == self->mOverridePropertyMap)
        {
          int v10 = 1;
        }
        else if (!-[TSSPropertyMap isEqual:](v16, "isEqual:"))
        {
          int v10 = 0;
        }
      }
      else
      {
        int v10 = 0;
      }
      [v13 removeObject:v14];
    }
  }
  else
  {
    int v10 = 0;
  }
  return v10 != 0;
}

- (id)copyFlattenedWithContext:(id)a3
{
  id v5 = objc_allocWithZone((Class)objc_opt_class());
  mName = self->mName;
  id v7 = [(TSSStyle *)self propertyMap];

  return (id)[v5 initWithContext:a3 name:mName overridePropertyMap:v7 isVariation:0];
}

- (id)copyWithZone:(_NSZone *)a3 context:(id)a4
{
  float v6 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  mName = self->mName;
  mOverridePropertyMap = self->mOverridePropertyMap;
  BOOL mIsVariation = self->mIsVariation;

  return (id)[v6 initWithContext:a4 name:mName overridePropertyMap:mOverridePropertyMap isVariation:mIsVariation];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(TSPObject *)self context];

  return [(TSSStyle *)self copyWithZone:a3 context:v5];
}

- (id)copyWithContext:(id)a3
{
  return [(TSSStyle *)self copyWithZone:0 context:a3];
}

- (double)doubleValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap
    || ([(TSSPropertyMap *)mOverridePropertyMap doubleValueForProperty:*(void *)&a3],
        result == INFINITY))
  {
    mParent = self->mParent;
    if (mParent)
    {
      [(TSSStyle *)mParent doubleValueForProperty:v3];
    }
    else
    {
      double v8 = objc_opt_class();
      [v8 defaultDoubleValueForProperty:v3];
    }
  }
  return result;
}

- (double)CGFloatValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap
    || ([(TSSPropertyMap *)mOverridePropertyMap CGFloatValueForProperty:*(void *)&a3],
        result == INFINITY))
  {
    mParent = self->mParent;
    if (mParent)
    {
      [(TSSStyle *)mParent CGFloatValueForProperty:v3];
    }
    else
    {
      int v8 = String(v3);
      if (v8 == 3)
      {
        int v10 = objc_opt_class();
        [v10 defaultDoubleValueForProperty:v3];
      }
      else if (v8 == 2)
      {
        [(id)objc_opt_class() defaultFloatValueForProperty:v3];
        return v9;
      }
      else
      {
        return INFINITY;
      }
    }
  }
  return result;
}

- (id)valuesForProperties:(id)a3
{
  id v4 = [(TSSStyle *)self copyPropertyMap];
  [v4 filterWithProperties:a3];

  return v4;
}

- (void)setBoxedValue:(id)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(TSPObject *)self willModify];
  if (a3)
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (!mOverridePropertyMap)
    {
      mOverridePropertyMap = objc_alloc_init(TSSPropertyMap);
      self->mOverridePropertyMap = mOverridePropertyMap;
    }
    [(TSSPropertyMap *)mOverridePropertyMap setBoxedObject:a3 forProperty:v4];
  }
  else
  {
    int v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSSStyle setBoxedValue:forProperty:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"];
    uint64_t v11 = String(v4);
    [v8 handleFailureInFunction:v9, v10, 868, @"Tried to set property %@ of style %@ to an undefined value.", v11, TSUObjectReferenceDescription() file lineNumber description];
  }
}

- (void)setIntValue:(int)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  [(TSPObject *)self willModify];
  if (v5 == 0x80000000)
  {
    id v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSSStyle setIntValue:forProperty:]"];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"];
    [v7 handleFailureInFunction:v8 file:v9 lineNumber:900 description:@"Int property value must be defined."];
  }
  else
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (!mOverridePropertyMap)
    {
      mOverridePropertyMap = objc_alloc_init(TSSPropertyMap);
      self->mOverridePropertyMap = mOverridePropertyMap;
    }
    [(TSSPropertyMap *)mOverridePropertyMap setIntValue:v5 forProperty:v4];
  }
}

- (void)setFloatValue:(float)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(TSPObject *)self willModify];
  if (a3 == INFINITY)
  {
    uint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSSStyle setFloatValue:forProperty:]"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:915 description:@"Float property value must be defined."];
  }
  else
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (!mOverridePropertyMap)
    {
      mOverridePropertyMap = objc_alloc_init(TSSPropertyMap);
      self->mOverridePropertyMap = mOverridePropertyMap;
    }
    *(float *)&double v7 = a3;
    [(TSSPropertyMap *)mOverridePropertyMap setFloatValue:v4 forProperty:v7];
  }
}

- (void)setDoubleValue:(double)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(TSPObject *)self willModify];
  if (a3 == INFINITY)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSSStyle setDoubleValue:forProperty:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:930 description:@"Double property value must be defined."];
  }
  else
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (!mOverridePropertyMap)
    {
      mOverridePropertyMap = objc_alloc_init(TSSPropertyMap);
      self->mOverridePropertyMap = mOverridePropertyMap;
    }
    [(TSSPropertyMap *)mOverridePropertyMap setDoubleValue:v4 forProperty:a3];
  }
}

- (void)setCGFloatValue:(double)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(TSPObject *)self willModify];
  if (a3 == INFINITY)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSSStyle setCGFloatValue:forProperty:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:945 description:@"CGFloat property value must be defined."];
  }
  else
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (!mOverridePropertyMap)
    {
      mOverridePropertyMap = objc_alloc_init(TSSPropertyMap);
      self->mOverridePropertyMap = mOverridePropertyMap;
    }
    [(TSSPropertyMap *)mOverridePropertyMap setCGFloatValue:v4 forProperty:a3];
  }
}

- (void)setValuesForProperties:(id)a3
{
  [(TSPObject *)self willModify];
  if (a3)
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (mOverridePropertyMap)
    {
      [(TSSPropertyMap *)mOverridePropertyMap addValuesFromPropertyMap:a3];
    }
    else
    {
      self->mOverridePropertyMap = (TSSPropertyMap *)[a3 copy];
    }
  }
}

- (void)removeValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(TSPObject *)self willModify];
  if (v3 >> 4 >= 0x121)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSSStyle removeValueForProperty:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 967, @"Property ID <%d> out of range.", v3);
  }
  if ([(TSSStyle *)self overridesProperty:v3])
  {
    [(TSSPropertyMap *)self->mOverridePropertyMap removeValueForProperty:v3];
    if (![(TSSPropertyMap *)self->mOverridePropertyMap count])
    {

      self->mOverridePropertyMap = 0;
    }
  }
}

- (void)removeAllValues
{
  self->mOverridePropertyMap = 0;
}

- (BOOL)isNamed
{
  return self->mName != 0;
}

- (BOOL)isIdentified
{
  return self->mStyleIdentifier != 0;
}

- (BOOL)overridesProperty:(int)a3
{
  return [(TSSPropertyMap *)self->mOverridePropertyMap containsProperty:*(void *)&a3];
}

- (BOOL)overridesAnyProperty
{
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (mOverridePropertyMap) {
    LOBYTE(mOverridePropertyMap) = [(TSSPropertyMap *)mOverridePropertyMap count] != 0;
  }
  return (char)mOverridePropertyMap;
}

- (id)overriddenProperties
{
  return [(TSSPropertyMap *)self->mOverridePropertyMap allProperties];
}

- (unint64_t)overrideCount
{
  unint64_t result = (unint64_t)self->mOverridePropertyMap;
  if (result) {
    return [(id)result count];
  }
  return result;
}

- (id)boxedOverrideValueForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  switch(String(a3))
  {
    case 0u:
      id result = [(TSSStyle *)self overrideValueForProperty:v3];
      break;
    case 1u:
      uint64_t v12 = [(TSSStyle *)self overrideIntValueForProperty:v3];
      if (v12 == 0x80000000) {
        goto LABEL_15;
      }
      uint64_t v13 = v12;
      uint64_t v14 = NSNumber;
      id result = (id)[v14 numberWithInt:v13];
      break;
    case 2u:
      [(TSSStyle *)self overrideFloatValueForProperty:v3];
      if (v6 == INFINITY) {
        goto LABEL_15;
      }
      double v7 = NSNumber;
      id result = (id)objc_msgSend(v7, "numberWithFloat:");
      break;
    case 3u:
      [(TSSStyle *)self overrideDoubleValueForProperty:v3];
      if (v8 == INFINITY) {
        goto LABEL_15;
      }
      uint64_t v9 = NSNumber;
      id result = (id)objc_msgSend(v9, "numberWithDouble:");
      break;
    default:
      uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSSStyle boxedOverrideValueForProperty:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 1064, @"Unexpected property type");
LABEL_15:
      id result = 0;
      break;
  }
  return result;
}

- (id)overrideValueForProperty:(int)a3
{
  id result = self->mOverridePropertyMap;
  if (result) {
    return (id)[result objectForProperty:*(void *)&a3];
  }
  return result;
}

- (int)overrideIntValueForProperty:(int)a3
{
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (mOverridePropertyMap) {
    return [(TSSPropertyMap *)mOverridePropertyMap intValueForProperty:*(void *)&a3];
  }
  else {
    return 0x80000000;
  }
}

- (float)overrideFloatValueForProperty:(int)a3
{
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap) {
    return INFINITY;
  }
  [(TSSPropertyMap *)mOverridePropertyMap floatValueForProperty:*(void *)&a3];
  return result;
}

- (double)overrideDoubleValueForProperty:(int)a3
{
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap) {
    return INFINITY;
  }
  [(TSSPropertyMap *)mOverridePropertyMap doubleValueForProperty:*(void *)&a3];
  return result;
}

- (double)overrideCGFloatValueForProperty:(int)a3
{
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap) {
    return INFINITY;
  }
  [(TSSPropertyMap *)mOverridePropertyMap CGFloatValueForProperty:*(void *)&a3];
  return result;
}

- (id)propertyMap
{
  mParent = self->mParent;
  if (mParent) {
    id v4 = [(TSSStyle *)mParent propertyMap];
  }
  else {
    id v4 = 0;
  }
  if (![(TSSPropertyMap *)self->mOverridePropertyMap count]) {
    return v4;
  }
  if (v4)
  {
    [v4 addValuesFromPropertyMap:self->mOverridePropertyMap];
    return v4;
  }
  float v6 = (void *)[(TSSPropertyMap *)self->mOverridePropertyMap copy];

  return v6;
}

- (id)propertyMapIgnoringStyle:(id)a3
{
  mParent = self->mParent;
  if (mParent) {
    id v6 = [(TSSStyle *)mParent propertyMapIgnoringStyle:a3];
  }
  else {
    id v6 = 0;
  }
  if (self == a3 || ![(TSSPropertyMap *)self->mOverridePropertyMap count]) {
    return v6;
  }
  if (v6)
  {
    [v6 addValuesFromPropertyMap:self->mOverridePropertyMap];
    return v6;
  }
  double v8 = (void *)[(TSSPropertyMap *)self->mOverridePropertyMap copy];

  return v8;
}

- (id)overridePropertyMapWithPropertyMap:(id)a3 overridePropertyMap:(id)a4 collapseSourceOverrides:(BOOL)a5
{
  BOOL v5 = a5;
  mParent = self;
  if (self->mIsVariation)
  {
    mParent = self->mParent;
    if (!mParent)
    {
      uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSSStyle overridePropertyMapWithPropertyMap:overridePropertyMap:collapseSourceOverrides:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 1167, @"Can't create variation of a nil base style.");
      mParent = 0;
    }
  }
  if ([(TSSStyle *)mParent isVariation])
  {
    uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSSStyle overridePropertyMapWithPropertyMap:overridePropertyMap:collapseSourceOverrides:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 1168, @"Can't create variation of a variation base style.");
  }
  uint64_t v14 = objc_alloc_init(TSSPropertyMap);
  uint64_t v15 = objc_alloc_init(TSSPropertyMap);
  v16 = v15;
  if (self->mIsVariation)
  {
    if (v5) {
      uint64_t v15 = v14;
    }
    [(TSSPropertyMap *)v15 addValuesFromPropertyMap:self->mOverridePropertyMap];
  }
  [(TSSPropertyMap *)v16 addValuesFromPropertyMap:a4];
  [(TSSPropertyMap *)v14 addValuesFromPropertyMap:a3];
  [(TSSPropertyMap *)v14 removeValuesForProperties:[(TSSPropertyMap *)v16 allProperties]];
  [(TSSPropertyMap *)v14 removeValuesFromPropertyMap:[(TSSStyle *)mParent propertyMap]];
  [(TSSPropertyMap *)v16 addValuesFromPropertyMap:v14];

  return v16;
}

- (BOOL)hasEqualPropertyValues:(id)a3
{
  uint64_t v5 = [(id)objc_opt_class() properties];

  return [(TSSStyle *)self hasEqualValues:a3 forProperties:v5];
}

- (BOOL)p_hasEqualValuesTo:(id)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  switch(String(a4))
  {
    case 0u:
      id v7 = [(TSSStyle *)self valueForProperty:v4];
      double v8 = (void *)[a3 objectForProperty:v4];
      if (!v7 || (int v9 = [v7 isEqual:v8]) != 0)
      {
        if (!v8 || ([v8 isEqual:v7] & 1) != 0) {
          goto LABEL_9;
        }
        goto LABEL_11;
      }
      return v9;
    case 1u:
      int v12 = [(TSSStyle *)self intValueForProperty:v4];
      if (v12 != [a3 intValueForProperty:v4]) {
        goto LABEL_11;
      }
      goto LABEL_9;
    case 2u:
      [(TSSStyle *)self floatValueForProperty:v4];
      float v14 = v13;
      [a3 floatValueForProperty:v4];
      if (v14 != v15) {
        goto LABEL_11;
      }
      goto LABEL_9;
    case 3u:
      [(TSSStyle *)self doubleValueForProperty:v4];
      double v17 = v16;
      [a3 doubleValueForProperty:v4];
      if (v17 != v18) {
        goto LABEL_11;
      }
LABEL_9:
      LOBYTE(v9) = 1;
      break;
    default:
      uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSSStyle p_hasEqualValuesTo:forProperty:]"];
      [v10 handleFailureInFunction:v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 1257, @"Comparing property values for unknown property %@ (%d) of unknown type.", String(v4), v4 file lineNumber description];
LABEL_11:
      LOBYTE(v9) = 0;
      break;
  }
  return v9;
}

- (BOOL)hasEqualValuesToPropertyMap:(id)a3 forProperties:(id)a4
{
  if (!objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "properties"), "containsProperties:", a4)
    || !objc_msgSend((id)objc_msgSend(a3, "allProperties"), "containsProperties:", a4))
  {
    return 0;
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__TSSStyle_hasEqualValuesToPropertyMap_forProperties___block_invoke;
  v9[3] = &unk_2646B1050;
  v9[4] = self;
  v9[5] = a3;
  void v9[6] = &v10;
  [a4 enumeratePropertiesUsingBlock:v9];
  BOOL v7 = *((unsigned char *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __54__TSSStyle_hasEqualValuesToPropertyMap_forProperties___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "p_hasEqualValuesTo:forProperty:", *(void *)(a1 + 40), a2);
  if ((result & 1) == 0)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)hasEqualValues:(id)a3 forProperties:(id)a4
{
  if (!objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "properties"), "containsProperties:", a4)
    || !objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "properties"), "containsProperties:", a4))
  {
    return 0;
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__TSSStyle_hasEqualValues_forProperties___block_invoke;
  v9[3] = &unk_2646B1050;
  v9[4] = self;
  v9[5] = a3;
  void v9[6] = &v10;
  [a4 enumeratePropertiesUsingBlock:v9];
  BOOL v7 = *((unsigned char *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __41__TSSStyle_hasEqualValues_forProperties___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "p_hasEqualValuesTo:forProperty:", *(void *)(a1 + 40), a2);
  if ((result & 1) == 0)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

- (TSSPropertyMap)overridePropertyMap
{
  v2 = (void *)[(TSSPropertyMap *)self->mOverridePropertyMap copy];

  return (TSSPropertyMap *)v2;
}

- (void)setOverridePropertyMap:(id)a3
{
  [(TSPObject *)self willModify];
  uint64_t v5 = (TSSPropertyMap *)[a3 copy];

  self->mOverridePropertyMap = v5;
}

- (TSSStyle)rootAncestor
{
  while (1)
  {
    v2 = self;
    if (![(TSSStyle *)self parent]) {
      break;
    }
    self = [(TSSStyle *)v2 parent];
  }
  return v2;
}

- (TSSStyle)baseStyleForVariation
{
  v2 = self;
  if ([(TSSStyle *)self isVariation])
  {
    do
      v2 = [(TSSStyle *)v2 parent];
    while ([(TSSStyle *)v2 isVariation]);
  }
  return v2;
}

- (TSSStyle)firstIdentifiedAncestor
{
  while (1)
  {
    v2 = self;
    if (!self || [(TSSStyle *)self styleIdentifier]) {
      break;
    }
    self = [(TSSStyle *)v2 parent];
  }
  return v2;
}

- (TSSStyle)rootIdentifiedAncestor
{
  if (!self) {
    return 0;
  }
  v2 = self;
  uint64_t v3 = 0;
  do
  {
    if ([(TSSStyle *)v2 isIdentified]) {
      uint64_t v3 = v2;
    }
    v2 = [(TSSStyle *)v2 parent];
  }
  while (v2);
  return v3;
}

- (NSSet)children
{
  uint64_t v3 = [(TSSStyle *)self stylesheet];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    do
    {
      id v6 = [(TSSStylesheet *)v4 childrenOfStyle:self];
      if (v6)
      {
        BOOL v7 = v6;
        if ([v6 count])
        {
          if (!v5) {
            id v5 = objc_alloc_init(MEMORY[0x263F7C878]);
          }
          [v5 unionSet:v7];
        }
      }
      uint64_t v4 = [(TSSStylesheet *)v4 child];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return (NSSet *)v5;
}

- (BOOL)isChildOf:(id)a3
{
  return self->mParent == a3;
}

- (BOOL)isParentOf:(id)a3
{
  return [a3 parent] == (void)self;
}

- (BOOL)isDescendentOf:(id)a3
{
  mParent = self->mParent;
  if (mParent) {
    LOBYTE(mParent) = mParent == a3 || -[TSSStyle isDescendentOf:](mParent, "isDescendentOf:");
  }
  return (char)mParent;
}

- (BOOL)isAncestorOf:(id)a3
{
  uint64_t v5 = [a3 parent];
  if (v5)
  {
    if ((TSSStyle *)[a3 parent] == self)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      uint64_t v6 = [a3 parent];
      LOBYTE(v5) = [(TSSStyle *)self isAncestorOf:v6];
    }
  }
  return v5;
}

+ (id)propertiesAllowingNSNull
{
  return 0;
}

+ (BOOL)validateIntValue:(int *)a3 forProperty:(int)a4
{
  return a3 && *a3 != 0x80000000;
}

+ (BOOL)validateIntValue:(int *)a3 forProperty:(int)a4 min:(int)a5 max:(int)a6
{
  if (!a3) {
    return 0;
  }
  int v6 = *a3;
  if (*a3 == 0x80000000) {
    return 0;
  }
  if (v6 < a5 || (a5 = a6, v6 > a6)) {
    *a3 = a5;
  }
  return 1;
}

+ (BOOL)validateIntValueAsBool:(int *)a3 forProperty:(int)a4
{
  if (!a3 || *a3 == 0x80000000) {
    return 0;
  }
  BOOL result = 1;
  if (*a3 > 1) {
    *a3 = 1;
  }
  return result;
}

+ (BOOL)validateFloatValue:(float *)a3 forProperty:(int)a4
{
  return a3 && *a3 != INFINITY;
}

+ (BOOL)validateDoubleValue:(double *)a3 forProperty:(int)a4
{
  return a3 && *a3 != INFINITY;
}

+ (BOOL)validateObjectValue:(id *)a3 withClass:(Class)a4 forProperty:(int)a5
{
  if (a3)
  {
    id v5 = *a3;
    if (*a3) {
      LOBYTE(v5) = (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0);
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (BOOL)validateIntValue:(int *)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v6 = objc_opt_class();

  return [v6 validateIntValue:a3 forProperty:v4];
}

- (BOOL)validateIntValue:(int *)a3 forProperty:(int)a4 min:(int)a5 max:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v10 = objc_opt_class();

  return [v10 validateIntValue:a3 forProperty:v8 min:v7 max:v6];
}

- (BOOL)validateIntValueAsBool:(int *)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = objc_opt_class();

  return [v6 validateIntValueAsBool:a3 forProperty:v4];
}

- (BOOL)validateFloatValue:(float *)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = objc_opt_class();

  return [v6 validateFloatValue:a3 forProperty:v4];
}

- (BOOL)validateDoubleValue:(double *)a3 forProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = objc_opt_class();

  return [v6 validateDoubleValue:a3 forProperty:v4];
}

- (BOOL)validateObjectValue:(id *)a3 withClass:(Class)a4 forProperty:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v8 = objc_opt_class();

  return [v8 validateObjectValue:a3 withClass:a4 forProperty:v5];
}

- (BOOL)isThemeEquivalent:(id)a3
{
  return a3 == self;
}

- (SEL)mapThemeAssetSelector
{
  return sel_mapStyle_;
}

- (BOOL)transformsFontSizes
{
  return 0;
}

+ (double)fontSizeForFontSize:(double)a3 scalingFactor:(double)a4
{
  double v4 = a3 * a4;
  double v5 = floor(v4);
  double v6 = floor(v4 * 0.5);
  double v7 = v6 + v6;
  if (v4 >= 12.5) {
    return v7;
  }
  else {
    return v5;
  }
}

- (id)boxedValueForProperty:(int)a3 oldBoxedValue:(id)a4 transformedByTransform:(CGAffineTransform *)a5
{
  uint64_t v5 = *(void *)&a3;
  if (a3 == 17 && [(TSSStyle *)self transformsFontSizes])
  {
    [a4 floatValue];
    +[TSSStyle fontSizeForFontSize:v9 scalingFactor:a5->d];
    *(float *)&double v10 = v10;
    uint64_t v11 = NSNumber;
    return (id)[v11 numberWithFloat:v10];
  }
  else
  {
    return [(TSSStyle *)self boxedObjectForProperty:v5];
  }
}

- (id)referencedStyles
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF9C0] set];
  id v4 = [(TSSStyle *)self propertyMap];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__TSSStyle_referencedStyles__block_invoke;
  v6[3] = &unk_2646B0E90;
  v6[4] = v3;
  [v4 enumeratePropertiesAndObjectsUsingBlock:v6];
  return v3;
}

uint64_t __28__TSSStyle_referencedStyles__block_invoke(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  if (!a3)
  {
    uint64_t v5 = result;
    objc_opt_class();
    BOOL result = objc_opt_isKindOfClass();
    if (result)
    {
      double v6 = *(void **)(v5 + 32);
      return [v6 addObject:a4];
    }
  }
  return result;
}

- (void)replaceReferencedStylesUsingBlock:(id)a3
{
  id v5 = [(TSSStyle *)self propertyMap];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__TSSStyle_replaceReferencedStylesUsingBlock___block_invoke;
  v6[3] = &unk_2646B0FD8;
  v6[4] = self;
  void v6[5] = a3;
  [v5 enumeratePropertiesAndObjectsUsingBlock:v6];
}

uint64_t __46__TSSStyle_replaceReferencedStylesUsingBlock___block_invoke(uint64_t result, uint64_t a2, int a3, void *a4)
{
  if (!a3)
  {
    uint64_t v6 = result;
    BOOL result = [a4 conformsToProtocol:&unk_26D77B418];
    if (result)
    {
      BOOL result = (*(uint64_t (**)(void))(*(void *)(v6 + 40) + 16))();
      if ((void *)result != a4)
      {
        uint64_t v7 = result;
        uint64_t v8 = *(void **)(v6 + 32);
        return [v8 setValue:v7 forProperty:a2];
      }
    }
  }
  return result;
}

- (void)fadeReflectionForSwatchGeneration
{
  id v3 = [(TSSStyle *)self boxedValueForProperty:519];
  if (v3)
  {
    id v4 = (id)[v3 mutableCopy];
    [v4 setFadeAcceleration:5.0];
    [(TSSStyle *)self setBoxedValue:v4 forProperty:519];
  }
}

- (void)constrainShadowForSwatchGeneration
{
  id v3 = (id)objc_msgSend(-[TSSStyle boxedValueForProperty:](self, "boxedValueForProperty:", 520), "newShadowClampedForSwatches");
  [(TSSStyle *)self setBoxedValue:v3 forProperty:520];
}

- (void)constrainStrokeForSwatchGeneration
{
  id v3 = [(TSSStyle *)self boxedValueForProperty:517];
  objc_opt_class();
  id v4 = (void *)TSUDynamicCast();
  if (v4 && (id v5 = v4, [v4 assetScale], v6 > 0.3))
  {
    id v8 = (id)[v5 mutableCopy];
    [v8 setAssetScale:0.3];
  }
  else
  {
    [v3 width];
    if (v7 <= 5.0) {
      return;
    }
    id v8 = (id)[v3 mutableCopy];
    [v8 setWidth:5.0];
  }
  [(TSSStyle *)self setBoxedValue:v8 forProperty:517];
}

- (id)constrainShapeStyleForContext:(id)a3
{
  id v3 = [(TSSStyle *)self copyWithContext:a3];
  uint64_t v4 = [v3 boxedValueForProperty:520];
  if (v4 && v4 != [MEMORY[0x263EFF9D0] null]) {
    [v3 constrainShadowForSwatchGeneration];
  }
  uint64_t v5 = [v3 boxedValueForProperty:517];
  if (v5 && v5 != [MEMORY[0x263EFF9D0] null]) {
    [v3 constrainStrokeForSwatchGeneration];
  }
  uint64_t v6 = [v3 boxedObjectForProperty:519];
  if (v6 && v6 != [MEMORY[0x263EFF9D0] null]) {
    [v3 fadeReflectionForSwatchGeneration];
  }
  return v3;
}

@end