@interface UIFontDescriptor
+ (BOOL)supportsSecureCoding;
+ (UIFontDescriptor)fontDescriptorWithFontAttributes:(NSDictionary *)attributes;
+ (UIFontDescriptor)fontDescriptorWithName:(NSString *)fontName matrix:(CGAffineTransform *)matrix;
+ (UIFontDescriptor)fontDescriptorWithName:(NSString *)fontName size:(CGFloat)size;
+ (UIFontDescriptor)preferredFontDescriptorWithTextStyle:(UIFontTextStyle)style;
+ (UIFontDescriptor)preferredFontDescriptorWithTextStyle:(UIFontTextStyle)style compatibleWithTraitCollection:(UITraitCollection *)traitCollection;
+ (id)_createMungledDictionary:(id)a3;
+ (id)_preferredFontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 design:(id)a5 weight:(double)a6 compatibleWithTraitCollection:(id)a7;
+ (id)_preferredFontDescriptorWithTextStyle:(id)a3 design:(id)a4 weight:(double)a5;
+ (id)_preferredFontDescriptorWithTextStyle:(id)a3 design:(id)a4 weight:(double)a5 compatibleWithTraitCollection:(id)a6;
+ (id)_preferredFontDescriptorWithTextStyle:(id)a3 weight:(double)a4;
+ (id)defaultFontDescriptorWithTextStyle:(id)a3;
+ (id)defaultFontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 options:(unint64_t)a5;
+ (id)preferredFontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 options:(unint64_t)a5;
- (CGAffineTransform)_matrix;
- (CGAffineTransform)matrix;
- (CGFloat)pointSize;
- (Class)classForCoder;
- (NSArray)matchingFontDescriptorsWithMandatoryKeys:(NSSet *)mandatoryKeys;
- (NSDictionary)fontAttributes;
- (NSString)postscriptName;
- (UIFontDescriptor)fontDescriptorByAddingAttributes:(NSDictionary *)attributes;
- (UIFontDescriptor)fontDescriptorWithDesign:(UIFontDescriptorSystemDesign)design;
- (UIFontDescriptor)fontDescriptorWithFace:(NSString *)newFace;
- (UIFontDescriptor)fontDescriptorWithFamily:(NSString *)newFamily;
- (UIFontDescriptor)fontDescriptorWithMatrix:(CGAffineTransform *)matrix;
- (UIFontDescriptor)fontDescriptorWithSize:(CGFloat)newPointSize;
- (UIFontDescriptor)fontDescriptorWithSymbolicTraits:(UIFontDescriptorSymbolicTraits)symbolicTraits;
- (UIFontDescriptor)fontDescriptorWithSymbolicTraits:(unsigned int)a3 mask:(unsigned int)a4;
- (UIFontDescriptor)init;
- (UIFontDescriptor)initWithCoder:(NSCoder *)coder;
- (UIFontDescriptor)initWithFontAttributes:(NSDictionary *)attributes;
- (id)_NSAffineTransform;
- (id)_attributes;
- (id)_fontDescriptorWithMatrix:(CGAffineTransform *)a3;
- (id)_swapWithFontAttributes:(id)a3 options:(unint64_t)a4;
- (id)_visibleName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)matchingFontDescriptorWithMandatoryKeys:(id)a3;
- (id)objectForKey:(UIFontDescriptorAttributeName)anAttribute;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIFontDescriptor

- (UIFontDescriptor)fontDescriptorWithSymbolicTraits:(UIFontDescriptorSymbolicTraits)symbolicTraits
{
  return [(UIFontDescriptor *)self fontDescriptorWithSymbolicTraits:*(void *)&symbolicTraits mask:0xFFFFFFFFLL];
}

- (UIFontDescriptor)fontDescriptorWithSymbolicTraits:(unsigned int)a3 mask:(unsigned int)a4
{
  CTFontDescriptorRef CopyWithSymbolicTraits = CTFontDescriptorCreateCopyWithSymbolicTraits((CTFontDescriptorRef)self, a3, a4);
  v5 = (void *)CFMakeCollectable(CopyWithSymbolicTraits);

  return (UIFontDescriptor *)v5;
}

- (UIFontDescriptor)initWithCoder:(NSCoder *)coder
{
  if ([(NSCoder *)coder allowsKeyedCoding])
  {
    if (initWithCoder__onceToken_0 != -1) {
      dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_20);
    }
    id v5 = [(NSCoder *)coder decodeObjectOfClasses:initWithCoder__allowedClasses_0 forKey:@"UIFontDescriptorAttributes"];
    NSInteger v6 = [(NSCoder *)coder decodeIntegerForKey:@"UIFontDescriptorOptions"];
    v7 = (void *)[v5 objectForKey:@"NSCTFontUIUsageAttribute"];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F244B0]];
    if ((v8 & 1) != 0 || [v7 isEqualToString:*MEMORY[0x1E4F244B8]])
    {
      uint64_t v9 = [v5 objectForKey:@"NSCTFontUIUsageOverrideAttribute"];
      if (v9) {
        goto LABEL_7;
      }
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        v12 = (uint64_t *)MEMORY[0x1E4F244A0];
        if (!v8) {
          v12 = (uint64_t *)MEMORY[0x1E4F244A8];
        }
        uint64_t v9 = *v12;
        if (*v12)
        {
LABEL_7:
          v10 = (void *)[v5 mutableCopy];
          [v10 setObject:v9 forKey:@"NSCTFontUIUsageAttribute"];
          [v10 removeObjectForKey:@"NSCTFontUIUsageOverrideAttribute"];
          id v5 = v10;
        }
      }
    }
  }
  else
  {
    NSInteger v6 = 0;
    id v5 = 0;
  }

  return (UIFontDescriptor *)[(UIFontDescriptor *)self _swapWithFontAttributes:v5 options:v6];
}

+ (id)preferredFontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 options:(unint64_t)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v7 = +[UIFont _preferredContentSizeCategory:a5];

  return (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, v7, 0, v5, 0, 0, -1);
}

- (UIFontDescriptor)fontDescriptorWithDesign:(UIFontDescriptorSystemDesign)design
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (![(UIFontDescriptor *)self objectForKey:@"NSCTFontUIUsageAttribute"]) {
    return 0;
  }
  int v5 = CTFontDescriptorCanCreateWithTextStyle();
  char v6 = v5;
  if (v5) {
    uint64_t v7 = (__CFString *)*MEMORY[0x1E4F24618];
  }
  else {
    uint64_t v7 = @"NSCTFontTraitsAttribute";
  }
  int v8 = objc_msgSend(-[UIFontDescriptor objectForKey:](self, "objectForKey:", v7), "mutableCopy");
  v17 = @"NSCTFontUIFontDesignTrait";
  v18[0] = design;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  if (v8) {
    [v8 addEntriesFromDictionary:v9];
  }
  if ([(UIFontDescriptor *)self objectForKey:@"NSFontNameAttribute"]
    || [(UIFontDescriptor *)self objectForKey:@"NSFontFaceAttribute"])
  {
    v10 = (void *)[(NSDictionary *)[(UIFontDescriptor *)self fontAttributes] mutableCopyWithZone:0];
    [v10 removeObjectForKey:@"NSFontNameAttribute"];
    [v10 removeObjectForKey:@"NSFontFaceAttribute"];
    if (v8) {
      v11 = v8;
    }
    else {
      v11 = (void *)v9;
    }
    [v10 setObject:v11 forKey:@"NSCTFontTraitsAttribute"];
    if ((v6 & 1) == 0) {
      [v10 removeObjectForKey:@"NSCTFontUIUsageAttribute"];
    }
    v12 = +[UIFontDescriptor fontDescriptorWithFontAttributes:v10];
  }
  else
  {
    if (v8) {
      uint64_t v14 = (uint64_t)v8;
    }
    else {
      uint64_t v14 = v9;
    }
    v15 = @"NSCTFontTraitsAttribute";
    uint64_t v16 = v14;
    v12 = -[UIFontDescriptor fontDescriptorByAddingAttributes:](self, "fontDescriptorByAddingAttributes:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1]);
  }

  return v12;
}

+ (UIFontDescriptor)fontDescriptorWithFontAttributes:(NSDictionary *)attributes
{
  v3 = (void *)[objc_alloc((Class)a1) initWithFontAttributes:attributes];

  return (UIFontDescriptor *)v3;
}

- (id)_swapWithFontAttributes:(id)a3 options:(unint64_t)a4
{
  id v5 = +[UIFontDescriptor _createMungledDictionary:a3];
  char v6 = (void *)CTFontDescriptorCreateWithAttributesAndOptions();

  return v6;
}

+ (id)_createMungledDictionary:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [a3 objectForKey:@"NSFontMatrixAttribute"];
    if (v4 && (id v5 = (void *)v4, v6 = *MEMORY[0x1E4F245A0], ![v3 objectForKey:*MEMORY[0x1E4F245A0]]))
    {
      id v3 = (id)[v3 mutableCopy];
      objc_msgSend(v5, "CGAffineTransformValue", 0, 0, 0, 0, 0, 0);
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v11 length:48];
      [v3 setObject:v10 forKey:v6];
    }
    else
    {
      id v7 = v3;
    }
    return v3;
  }
  else
  {
    int v8 = (objc_class *)MEMORY[0x1E4F1C9E8];
    return objc_alloc_init(v8);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIFontDescriptor;
  [(UIFontDescriptor *)&v3 dealloc];
}

- (UIFontDescriptor)initWithFontAttributes:(NSDictionary *)attributes
{
  return (UIFontDescriptor *)[(UIFontDescriptor *)self _swapWithFontAttributes:attributes options:0];
}

+ (id)_preferredFontDescriptorWithTextStyle:(id)a3 weight:(double)a4
{
  uint64_t v5 = [NSNumber numberWithDouble:a4];

  return (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, 0, 0, 0, 0, v5, -1);
}

- (UIFontDescriptor)fontDescriptorWithSize:(CGFloat)newPointSize
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", newPointSize), @"NSFontSizeAttribute");

  return [(UIFontDescriptor *)self fontDescriptorByAddingAttributes:v4];
}

- (CGFloat)pointSize
{
  id v2 = [(UIFontDescriptor *)self objectForKey:@"NSFontSizeAttribute"];
  if (!v2) {
    return 0.0;
  }

  [v2 doubleValue];
  return result;
}

+ (UIFontDescriptor)preferredFontDescriptorWithTextStyle:(UIFontTextStyle)style compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  uint64_t v6 = [(UITraitCollection *)traitCollection preferredContentSizeCategory];
  uint64_t v7 = __UIGetLegibilityWeight(traitCollection);

  return (UIFontDescriptor *)__UIFontDescriptorWithTextStyle((uint64_t)style, (uint64_t)v6, 0, 0, 0, 0, v7);
}

+ (UIFontDescriptor)preferredFontDescriptorWithTextStyle:(UIFontTextStyle)style
{
  uint64_t v4 = +[UIFont preferredContentSizeCategory];

  return (UIFontDescriptor *)__UIFontDescriptorWithTextStyle((uint64_t)style, v4, 0, 0, 0, 0, -1);
}

+ (id)defaultFontDescriptorWithTextStyle:(id)a3
{
  return (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, 0, 1, 0, 0, 0, -1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultFontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 options:(unint64_t)a5
{
  uint64_t v5 = *(void *)&a4;
  id result = (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, 0, 1, *(uint64_t *)&a4, 0, 0, -1);
  if (v5)
  {
    return (id)[result fontDescriptorWithSymbolicTraits:v5 mask:v5];
  }
  return result;
}

uint64_t __34__UIFontDescriptor_initWithCoder___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  initWithCoder__allowedClasses_0 = result;
  return result;
}

- (UIFontDescriptor)init
{
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionary];

  return [(UIFontDescriptor *)self initWithFontAttributes:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[UIFontDescriptor allocWithZone:a3];
  attributes = self->_attributes;

  return [(UIFontDescriptor *)v4 initWithFontAttributes:attributes];
}

+ (id)_preferredFontDescriptorWithTextStyle:(id)a3 design:(id)a4 weight:(double)a5
{
  uint64_t v7 = [NSNumber numberWithDouble:a5];

  return (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, 0, 0, 0, (uint64_t)a4, v7, -1);
}

+ (id)_preferredFontDescriptorWithTextStyle:(id)a3 design:(id)a4 weight:(double)a5 compatibleWithTraitCollection:(id)a6
{
  uint64_t v10 = [a6 preferredContentSizeCategory];
  uint64_t v11 = [NSNumber numberWithDouble:a5];
  uint64_t v12 = __UIGetLegibilityWeight(a6);

  return (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, v10, 0, 0, (uint64_t)a4, v11, v12);
}

+ (id)_preferredFontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 design:(id)a5 weight:(double)a6 compatibleWithTraitCollection:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  uint64_t v12 = [a7 preferredContentSizeCategory];
  uint64_t v13 = [NSNumber numberWithDouble:a6];
  uint64_t v14 = __UIGetLegibilityWeight(a7);

  return (id)__UIFontDescriptorWithTextStyle((uint64_t)a3, v12, 0, v10, (uint64_t)a5, v13, v14);
}

+ (UIFontDescriptor)fontDescriptorWithName:(NSString *)fontName size:(CGFloat)size
{
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  int v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", fontName, @"NSFontNameAttribute", objc_msgSend(NSNumber, "numberWithDouble:", size), @"NSFontSizeAttribute", 0);
  uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithFontAttributes:v8];

  return (UIFontDescriptor *)v9;
}

- (NSDictionary)fontAttributes
{
  uint64_t v2 = self->_attributes;

  return (NSDictionary *)v2;
}

- (id)_attributes
{
  return 0;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v5 = [(UIFontDescriptor *)self fontAttributes];
    id v6 = [(NSDictionary *)v5 objectForKey:@"NSCTFontUIUsageAttribute"];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F244A0]];
    int v8 = [v6 isEqualToString:*MEMORY[0x1E4F244A8]];
    uint64_t v9 = [(NSDictionary *)v5 objectForKey:@"NSColor"];
    uint64_t v10 = v9;
    int v11 = v7 | v8;
    if ((v11 & 1) != 0 || v9)
    {
      uint64_t v12 = (void *)[(NSDictionary *)v5 mutableCopy];
      uint64_t v13 = v12;
      if (v11)
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F244B0];
        if (!v7) {
          uint64_t v14 = (void *)MEMORY[0x1E4F244B8];
        }
        [v12 setObject:*v14 forKey:@"NSCTFontUIUsageAttribute"];
        [v13 setObject:v6 forKey:@"NSCTFontUIUsageOverrideAttribute"];
      }
      if (v10) {
        [v13 removeObjectForKey:@"NSColor"];
      }
      uint64_t v5 = v13;
    }
    [a3 encodeObject:v5 forKey:@"UIFontDescriptorAttributes"];
    uint64_t Options = CTFontDescriptorGetOptions();
    [a3 encodeInteger:Options forKey:@"UIFontDescriptorOptions"];
  }
}

- (NSString)postscriptName
{
  uint64_t result = [(UIFontDescriptor *)self objectForKey:@"NSCTFontPostScriptNameAttribute"];
  if (!result)
  {
    return (NSString *)[(UIFontDescriptor *)self objectForKey:@"NSFontNameAttribute"];
  }
  return result;
}

+ (UIFontDescriptor)fontDescriptorWithName:(NSString *)fontName matrix:(CGAffineTransform *)matrix
{
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  int v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", fontName, @"NSFontNameAttribute", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", matrix, "{CGAffineTransform=dddddd}"), @"NSFontMatrixAttribute", 0);
  uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithFontAttributes:v8];

  return (UIFontDescriptor *)v9;
}

- (id)objectForKey:(UIFontDescriptorAttributeName)anAttribute
{
  return (id)[(NSMutableDictionary *)self->_attributes objectForKey:anAttribute];
}

- (NSArray)matchingFontDescriptorsWithMandatoryKeys:(NSSet *)mandatoryKeys
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)matchingFontDescriptorWithMandatoryKeys:(id)a3
{
  return 0;
}

- (UIFontDescriptor)fontDescriptorByAddingAttributes:(NSDictionary *)attributes
{
  uint64_t v5 = [(UIFontDescriptor *)self zone];
  id v6 = (void *)[(NSDictionary *)[(UIFontDescriptor *)self fontAttributes] mutableCopyWithZone:v5];
  [v6 addEntriesFromDictionary:attributes];
  id v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", v5), "initWithFontAttributes:", v6);

  return (UIFontDescriptor *)v7;
}

- (id)_fontDescriptorWithMatrix:(CGAffineTransform *)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", a3, "{CGAffineTransform=dddddd}"), @"NSFontMatrixAttribute");

  return [(UIFontDescriptor *)self fontDescriptorByAddingAttributes:v4];
}

- (CGAffineTransform)_matrix
{
  uint64_t result = [(UIFontDescriptor *)self objectForKey:@"NSFontMatrixAttribute"];
  if (result)
  {
    return (CGAffineTransform *)[(CGAffineTransform *)result CGAffineTransformValue];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (id)_NSAffineTransform
{
  id v2 = [(UIFontDescriptor *)self objectForKey:@"NSFontMatrixAttribute"];
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (memset(&v6, 0, sizeof(v6)),
            [v2 CGAffineTransformValue],
            CGAffineTransform v5 = v6,
            !CGAffineTransformIsIdentity(&v5)))
      {
        id v2 = objc_alloc_init(MEMORY[0x1E4F28AF0]);
        CGAffineTransform v4 = v6;
        [v2 setTransformStruct:&v4];
      }
      else
      {
        return 0;
      }
    }
  }
  return v2;
}

- (UIFontDescriptor)fontDescriptorWithMatrix:(CGAffineTransform *)matrix
{
  long long v3 = *(_OWORD *)&matrix->c;
  v5[0] = *(_OWORD *)&matrix->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&matrix->tx;
  return (UIFontDescriptor *)[(UIFontDescriptor *)self _fontDescriptorWithMatrix:v5];
}

- (CGAffineTransform)matrix
{
  if (self) {
    return (CGAffineTransform *)[(CGAffineTransform *)self _matrix];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (UIFontDescriptor)fontDescriptorWithFace:(NSString *)newFace
{
  if ([(UIFontDescriptor *)self objectForKey:@"NSFontNameAttribute"])
  {
    CGAffineTransform v5 = (void *)[(NSDictionary *)[(UIFontDescriptor *)self fontAttributes] mutableCopyWithZone:0];
    [v5 removeObjectForKey:@"NSFontNameAttribute"];
    [v5 setObject:newFace forKey:@"NSFontFaceAttribute"];
    CGAffineTransform v6 = +[UIFontDescriptor fontDescriptorWithFontAttributes:v5];

    return v6;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:newFace forKey:@"NSFontFaceAttribute"];
    return [(UIFontDescriptor *)self fontDescriptorByAddingAttributes:v8];
  }
}

- (UIFontDescriptor)fontDescriptorWithFamily:(NSString *)newFamily
{
  if ([(UIFontDescriptor *)self objectForKey:@"NSFontNameAttribute"]
    || [(UIFontDescriptor *)self objectForKey:@"NSFontFaceAttribute"])
  {
    CGAffineTransform v5 = (void *)[(NSDictionary *)[(UIFontDescriptor *)self fontAttributes] mutableCopyWithZone:0];
    [v5 removeObjectForKey:@"NSFontNameAttribute"];
    [v5 removeObjectForKey:@"NSFontFaceAttribute"];
    [v5 setObject:newFamily forKey:@"NSFontFamilyAttribute"];
    CGAffineTransform v6 = +[UIFontDescriptor fontDescriptorWithFontAttributes:v5];

    return v6;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:newFamily forKey:@"NSFontFamilyAttribute"];
    return [(UIFontDescriptor *)self fontDescriptorByAddingAttributes:v8];
  }
}

- (id)_visibleName
{
  return (id)[(NSMutableDictionary *)self->_attributes objectForKey:@"NSFontVisibleNameAttribute"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ <%p> = %@", objc_opt_class(), self, -[UIFontDescriptor fontAttributes](self, "fontAttributes")];
}

@end