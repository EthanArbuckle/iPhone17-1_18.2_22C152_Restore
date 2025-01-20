@interface PFCStoredPhoto
+ (BOOL)supportsSecureCoding;
- (BOOL)userEdited;
- (NSArray)layouts;
- (NSDate)modificationDate;
- (NSString)accessibilityDescription;
- (NSString)localIdentifier;
- (PFCStoredPhoto)initWithCoder:(id)a3;
- (double)parallaxScale;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)preferredLayout;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityDescription:(id)a3;
- (void)setLayouts:(id)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setParallaxScale:(double)a3;
- (void)setPreferredLayout:(int64_t)a3;
- (void)setUserEdited:(BOOL)a3;
@end

@implementation PFCStoredPhoto

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  localIdentifier = self->_localIdentifier;
  id v7 = a3;
  [v7 encodeObject:localIdentifier forKey:@"localIdentifier"];
  [v7 encodeObject:self->_modificationDate forKey:@"modificationDate"];
  double parallaxScale = self->_parallaxScale;
  *(float *)&double parallaxScale = parallaxScale;
  [v7 encodeFloat:@"parallaxScale" forKey:parallaxScale];
  [v7 encodeInteger:self->_preferredLayout forKey:@"preferredLayout"];
  [v7 encodeBool:self->_userEdited forKey:@"userEdited"];
  v6 = (void *)[(NSArray *)self->_layouts mutableCopy];
  [v7 encodeObject:v6 forKey:@"layouts"];

  [v7 encodeObject:self->_accessibilityDescription forKey:@"accessibilityDescription"];
}

- (PFCStoredPhoto)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PFCStoredPhoto;
  v5 = [(PFCStoredPhoto *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localIdentifier"];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modificationDate"];
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v8;

    [v4 decodeFloatForKey:@"parallaxScale"];
    v5->_double parallaxScale = v10;
    v5->_preferredLayout = [v4 decodeIntegerForKey:@"preferredLayout"];
    v5->_userEdited = [v4 decodeBoolForKey:@"userEdited"];
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"layouts"];
    layouts = v5->_layouts;
    v5->_layouts = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityDescription"];
    accessibilityDescription = v5->_accessibilityDescription;
    v5->_accessibilityDescription = (NSString *)v16;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263F08170], @"Array validation failed: putative array is a %@", objc_opt_class() format];
    }
    [(NSArray *)v5->_layouts enumerateObjectsUsingBlock:&__block_literal_global_0];
  }
  return v5;
}

void __32__PFCStoredPhoto_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263F08170], @"Array validation failed: expected object class %@, found %@", objc_opt_class(), v2 format];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)[(NSString *)self->_localIdentifier copyWithZone:a3];
  [v5 setLocalIdentifier:v6];

  id v7 = (void *)[(NSDate *)self->_modificationDate copyWithZone:a3];
  [v5 setModificationDate:v7];

  [v5 setParallaxScale:self->_parallaxScale];
  [v5 setPreferredLayout:self->_preferredLayout];
  [v5 setUserEdited:self->_userEdited];
  uint64_t v8 = (void *)[(NSArray *)self->_layouts copyWithZone:a3];
  [v5 setLayouts:v8];

  v9 = (void *)[(NSString *)self->_accessibilityDescription copyWithZone:a3];
  [v5 setAccessibilityDescription:v9];

  return v5;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (double)parallaxScale
{
  return self->_parallaxScale;
}

- (void)setParallaxScale:(double)a3
{
  self->_double parallaxScale = a3;
}

- (int64_t)preferredLayout
{
  return self->_preferredLayout;
}

- (void)setPreferredLayout:(int64_t)a3
{
  self->_preferredLayout = a3;
}

- (BOOL)userEdited
{
  return self->_userEdited;
}

- (void)setUserEdited:(BOOL)a3
{
  self->_userEdited = a3;
}

- (NSArray)layouts
{
  return self->_layouts;
}

- (void)setLayouts:(id)a3
{
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);

  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end