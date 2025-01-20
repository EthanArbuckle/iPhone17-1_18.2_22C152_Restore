@interface PRLikeness
+ (BOOL)automaticallyNotifiesObserversOfCropRectForTopLeftOrigin;
+ (BOOL)supportsSecureCoding;
+ (CGRect)_flippedRectForRect:(CGRect)a3 relativeToImage:(CGImage *)a4;
+ (id)_dateFormatter;
+ (id)_photoWithScope:(unint64_t)a3 image:(CGImage *)a4 cropRectForTopLeftOrigin:(CGRect)a5;
+ (id)descriptionForScope:(unint64_t)a3;
+ (id)diddlySquatLikeness;
+ (id)likenessWithPropagatedData:(id)a3;
+ (id)monogramWithRecipe:(id)a3 staticRepresentation:(CGImage *)a4;
+ (id)monogramWithScope:(unint64_t)a3 recipe:(id)a4 staticRepresentation:(CGImage *)a5;
+ (id)photoWithImage:(CGImage *)a3;
+ (id)photoWithImage:(CGImage *)a3 cropRectForBottomLeftOrigin:(CGRect)a4;
+ (id)photoWithImage:(CGImage *)a3 cropRectForTopLeftOrigin:(CGRect)a4;
+ (id)photoWithScope:(unint64_t)a3 image:(CGImage *)a4;
+ (unint64_t)scopeFromDescription:(id)a3;
- (BOOL)isCurrent;
- (BOOL)isDiddlySquat;
- (BOOL)isDirty;
- (CGImage)staticRepresentation;
- (CGRect)cropRectForBottomLeftOrigin;
- (CGRect)cropRectForTopLeftOrigin;
- (NSData)recipe;
- (NSData)staticRepresentationData;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSDate)insertionDate;
- (NSDate)softExpirationDate;
- (NSSet)dirtyProperties;
- (NSString)externalIdentifier;
- (NSString)ownerID;
- (NSString)scopeDescription;
- (NSString)typeDescription;
- (NSString)uniqueIdentifier;
- (PRLikeness)init;
- (PRLikeness)initWithCoder:(id)a3;
- (id)_initWithIdentifier:(id)a3;
- (id)dataForPropagation;
- (id)description;
- (int64_t)source;
- (unint64_t)scope;
- (unint64_t)type;
- (unint64_t)version;
- (void)clearDirtyProperties;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCropRectForTopLeftOrigin:(CGRect)a3;
- (void)setCurrent:(BOOL)a3;
- (void)setDirtyProperties:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setInsertionDate:(id)a3;
- (void)setOwnerID:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setScope:(unint64_t)a3;
- (void)setSoftExpirationDate:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setStaticRepresentation:(CGImage *)a3;
- (void)setStaticRepresentationData:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PRLikeness

- (unint64_t)type
{
  return self->_type;
}

- (NSData)recipe
{
  return self->_recipe;
}

+ (id)monogramWithRecipe:(id)a3 staticRepresentation:(CGImage *)a4
{
  return (id)[a1 monogramWithScope:2 recipe:a3 staticRepresentation:a4];
}

+ (id)monogramWithScope:(unint64_t)a3 recipe:(id)a4 staticRepresentation:(CGImage *)a5
{
  id v7 = a4;
  v8 = objc_alloc_init(PRLikeness);
  [(PRLikeness *)v8 setType:1];
  [(PRLikeness *)v8 setScope:a3];
  [(PRLikeness *)v8 setRecipe:v7];

  [(PRLikeness *)v8 setStaticRepresentation:a5];
  return v8;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setStaticRepresentation:(CGImage *)a3
{
  if (a3)
  {
    self->_staticRepresentation = CGImageRetain(a3);
  }
  else
  {
    staticRepresentation = self->_staticRepresentation;
    if (staticRepresentation) {
      CGImageRelease(staticRepresentation);
    }
    self->_staticRepresentation = 0;
  }
  staticRepresentationData = self->_staticRepresentationData;
  self->_staticRepresentationData = 0;

  dirtyProperties = self->_dirtyProperties;
  [(NSMutableSet *)dirtyProperties addObject:@"staticrep"];
}

- (void)setScope:(unint64_t)a3
{
  self->_scope = a3;
}

- (void)setRecipe:(id)a3
{
  id v6 = a3;
  if ((-[NSData isEqual:](self->_recipe, "isEqual:") & 1) == 0)
  {
    v4 = (NSData *)[v6 copy];
    recipe = self->_recipe;
    self->_recipe = v4;

    [(NSMutableSet *)self->_dirtyProperties addObject:@"recipe"];
  }
}

- (PRLikeness)init
{
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];
  v5 = [(PRLikeness *)self _initWithIdentifier:v4];

  return v5;
}

- (id)_initWithIdentifier:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PRLikeness;
  id v6 = [(PRLikeness *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uniqueIdentifier, a3);
    CGSize v8 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v7->_cropRectForTopLeftOrigin.origin = (CGPoint)*MEMORY[0x263F001A0];
    v7->_cropRectForTopLeftOrigin.size = v8;
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    dirtyProperties = v7->_dirtyProperties;
    v7->_dirtyProperties = v9;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertionDate, 0);
  objc_storeStrong((id *)&self->_ownerID, 0);
  objc_storeStrong((id *)&self->_softExpirationDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_storeStrong((id *)&self->_staticRepresentationData, 0);
}

- (void)dealloc
{
  staticRepresentation = self->_staticRepresentation;
  if (staticRepresentation)
  {
    CGImageRelease(staticRepresentation);
    self->_staticRepresentation = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PRLikeness;
  [(PRLikeness *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)photoWithImage:(CGImage *)a3 cropRectForTopLeftOrigin:(CGRect)a4
{
  return (id)objc_msgSend(a1, "_photoWithScope:image:cropRectForTopLeftOrigin:", 2, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)photoWithImage:(CGImage *)a3 cropRectForBottomLeftOrigin:(CGRect)a4
{
  objc_msgSend(a1, "_flippedRectForRect:relativeToImage:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return (id)objc_msgSend(a1, "photoWithImage:cropRectForTopLeftOrigin:", a3);
}

+ (CGRect)_flippedRectForRect:(CGRect)a3 relativeToImage:(CGImage *)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BOOL IsNull = CGRectIsNull(a3);
  if (a4 && !IsNull) {
    double y = (double)CGImageGetHeight(a4) - y - height;
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.double height = v13;
  result.size.CGFloat width = v12;
  result.origin.double y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

+ (id)photoWithImage:(CGImage *)a3
{
  return (id)objc_msgSend(a1, "_photoWithScope:image:cropRectForTopLeftOrigin:", 2, a3, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
}

+ (id)photoWithScope:(unint64_t)a3 image:(CGImage *)a4
{
  return (id)objc_msgSend(a1, "_photoWithScope:image:cropRectForTopLeftOrigin:", a3, a4, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
}

+ (id)_photoWithScope:(unint64_t)a3 image:(CGImage *)a4 cropRectForTopLeftOrigin:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = objc_alloc_init(PRLikeness);
  [(PRLikeness *)v11 setType:2];
  [(PRLikeness *)v11 setScope:a3];
  [(PRLikeness *)v11 setStaticRepresentation:a4];
  -[PRLikeness setCropRectForTopLeftOrigin:](v11, "setCropRectForTopLeftOrigin:", x, y, width, height);
  return v11;
}

+ (id)diddlySquatLikeness
{
  id v2 = [[PRLikeness alloc] _initWithIdentifier:@"7D5543CA-DJLT-4714-8D3B"];
  [v2 setType:4];
  [v2 setVersion:0x7FFFFFFFLL];
  return v2;
}

- (BOOL)isDiddlySquat
{
  return [(NSString *)self->_uniqueIdentifier isEqualToString:@"7D5543CA-DJLT-4714-8D3B"];
}

- (PRLikeness)initWithCoder:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PRLikeness;
  id v5 = [(PRLikeness *)&v40 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_externalIdentifier"];
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v8;

    double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_type"];
    v5->_type = [v10 unsignedIntegerValue];

    double v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_scope"];
    v5->_scope = [v11 unsignedIntegerValue];

    double v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_version"];
    v5->_version = [v12 unsignedIntegerValue];

    double v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_isCurrent"];
    v5->_isCurrent = [v13 BOOLValue];

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_softExpirationDate"];
    softExpirationDate = v5->_softExpirationDate;
    v5->_softExpirationDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recipe"];
    recipe = v5->_recipe;
    v5->_recipe = (NSData *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_staticRepresentationData"];
    staticRepresentationData = v5->_staticRepresentationData;
    v5->_staticRepresentationData = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_insertionDate"];
    insertionDate = v5->_insertionDate;
    v5->_insertionDate = (NSDate *)v24;

    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"_dirtyProperties"];
    dirtyProperties = v5->_dirtyProperties;
    v5->_dirtyProperties = (NSMutableSet *)v30;

    v32 = (void *)MEMORY[0x263EFFA08];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    CFDictionaryRef v36 = [v4 decodeObjectOfClasses:v35 forKey:@"_cropRectForTopLeftOrigin"];

    BOOL v37 = CGRectMakeWithDictionaryRepresentation(v36, &v5->_cropRectForTopLeftOrigin);
    if (v36 && !v37)
    {
      v38 = _PRGetLogSystem();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v42 = "-[PRLikeness initWithCoder:]";
        __int16 v43 = 1024;
        int v44 = 192;
        __int16 v45 = 2112;
        CFDictionaryRef v46 = v36;
        _os_log_impl(&dword_213B6F000, v38, OS_LOG_TYPE_DEFAULT, "%s (%d) \"CGRectMakeWithDictionaryRepresentation failed with %@\"", buf, 0x1Cu);
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueIdentifier = self->_uniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:uniqueIdentifier forKey:@"_uniqueIdentifier"];
  [v5 encodeObject:self->_externalIdentifier forKey:@"_externalIdentifier"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v5 encodeObject:v6 forKey:@"_type"];

  id v7 = [NSNumber numberWithUnsignedInteger:self->_scope];
  [v5 encodeObject:v7 forKey:@"_scope"];

  uint64_t v8 = [NSNumber numberWithBool:self->_isCurrent];
  [v5 encodeObject:v8 forKey:@"_isCurrent"];

  [v5 encodeObject:self->_expirationDate forKey:@"_expirationDate"];
  [v5 encodeObject:self->_softExpirationDate forKey:@"_softExpirationDate"];
  [v5 encodeObject:self->_recipe forKey:@"_recipe"];
  v9 = [NSNumber numberWithUnsignedInteger:self->_version];
  [v5 encodeObject:v9 forKey:@"_version"];

  double v10 = [(PRLikeness *)self staticRepresentationData];
  [v5 encodeObject:v10 forKey:@"_staticRepresentationData"];

  [v5 encodeObject:self->_creationDate forKey:@"_creationDate"];
  [v5 encodeObject:self->_insertionDate forKey:@"_insertionDate"];
  [v5 encodeObject:self->_dirtyProperties forKey:@"_dirtyProperties"];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(self->_cropRectForTopLeftOrigin);
  [v5 encodeObject:DictionaryRepresentation forKey:@"_cropRectForTopLeftOrigin"];
}

+ (id)likenessWithPropagatedData:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    v9 = 0;
    goto LABEL_13;
  }
  id v3 = a3;
  id v4 = objc_msgSend(v3, "subdataWithRange:", 0, objc_msgSend(v3, "length") - 1);
  id v5 = objc_msgSend(v3, "subdataWithRange:", objc_msgSend(v3, "length") - 1, 1);

  id v6 = v5;
  id v7 = (unsigned __int8 *)[v6 bytes];

  if (!v7)
  {
    uint64_t v8 = 4;
    goto LABEL_8;
  }
  uint64_t v8 = *v7;
  if (v8 == 3)
  {
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  if (v8 != 1)
  {
LABEL_8:
    double v10 = _PRGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [NSNumber numberWithUnsignedInteger:v8];
      int v13 = 136315650;
      uint64_t v14 = "+[PRLikeness likenessWithPropagatedData:]";
      __int16 v15 = 1024;
      int v16 = 243;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl(&dword_213B6F000, v10, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Unsupported likeness type parsed: %@\"", (uint8_t *)&v13, 0x1Cu);
    }
    goto LABEL_11;
  }
  v9 = +[PRLikeness monogramWithRecipe:v4 staticRepresentation:0];
LABEL_12:

LABEL_13:
  return v9;
}

- (id)dataForPropagation
{
  recipe = self->_recipe;
  if (recipe)
  {
    id v4 = (void *)[(NSData *)recipe mutableCopy];
    char type = self->_type;
    [v4 appendBytes:&type length:1];
    id v5 = (void *)[v4 copy];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)setCurrent:(BOOL)a3
{
  if (self->_isCurrent != a3)
  {
    self->_isCurrent = a3;
    [(NSMutableSet *)self->_dirtyProperties addObject:@"current"];
  }
}

- (void)setExternalIdentifier:(id)a3
{
  id v6 = a3;
  if ((-[NSString isEqual:](self->_externalIdentifier, "isEqual:") & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    externalIdentifier = self->_externalIdentifier;
    self->_externalIdentifier = v4;

    [(NSMutableSet *)self->_dirtyProperties addObject:@"eid"];
  }
}

+ (BOOL)automaticallyNotifiesObserversOfCropRectForTopLeftOrigin
{
  return 0;
}

- (void)setCropRectForTopLeftOrigin:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_cropRectForTopLeftOrigin, a3))
  {
    [(PRLikeness *)self willChangeValueForKey:@"cropRectForTopLeftOrigin"];
    [(PRLikeness *)self willChangeValueForKey:@"cropRectForBottomLeftOrigin"];
    [(PRLikeness *)self willChangeValueForKey:@"cropRect"];
    self->_cropRectForTopLeftOrigin.origin.CGFloat x = x;
    self->_cropRectForTopLeftOrigin.origin.CGFloat y = y;
    self->_cropRectForTopLeftOrigin.size.CGFloat width = width;
    self->_cropRectForTopLeftOrigin.size.CGFloat height = height;
    [(NSMutableSet *)self->_dirtyProperties addObject:@"crop"];
    [(PRLikeness *)self didChangeValueForKey:@"cropRectForTopLeftOrigin"];
    [(PRLikeness *)self didChangeValueForKey:@"cropRectForBottomLeftOrigin"];
    [(PRLikeness *)self didChangeValueForKey:@"cropRect"];
  }
}

- (CGRect)cropRectForBottomLeftOrigin
{
  +[PRLikeness _flippedRectForRect:relativeToImage:](PRLikeness, "_flippedRectForRect:relativeToImage:", self->_staticRepresentation, self->_cropRectForTopLeftOrigin.origin.x, self->_cropRectForTopLeftOrigin.origin.y, self->_cropRectForTopLeftOrigin.size.width, self->_cropRectForTopLeftOrigin.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGImage)staticRepresentation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  staticRepresentation = self->_staticRepresentation;
  if (!staticRepresentation)
  {
    staticRepresentationData = self->_staticRepresentationData;
    if (!staticRepresentationData) {
      return 0;
    }
    id v6 = CGDataProviderCreateWithCFData((CFDataRef)staticRepresentationData);
    if (v6)
    {
      id v7 = v6;
      staticRepresentation = CGImageCreateWithPNGDataProvider(v6, 0, 1, kCGRenderingIntentDefault);
      CGDataProviderRelease(v7);
      self->_staticRepresentation = staticRepresentation;
      if (staticRepresentation) {
        return staticRepresentation;
      }
    }
    else
    {
      uint64_t v8 = _PRGetLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315394;
        double v11 = "_PRCreateImageWithPNGData";
        __int16 v12 = 1024;
        int v13 = 527;
        _os_log_impl(&dword_213B6F000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"CGDataProviderCreateWithCFData returned NULL!\"", (uint8_t *)&v10, 0x12u);
      }

      self->_staticRepresentation = 0;
    }
    v9 = _PRGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      double v11 = "-[PRLikeness staticRepresentation]";
      __int16 v12 = 1024;
      int v13 = 349;
      _os_log_impl(&dword_213B6F000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"CGImageCreateWithPNGDataProvider returned NULL!\"", (uint8_t *)&v10, 0x12u);
    }

    return self->_staticRepresentation;
  }
  return staticRepresentation;
}

- (NSData)staticRepresentationData
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  staticRepresentation = self->_staticRepresentation;
  if (staticRepresentation && !self->_staticRepresentationData)
  {
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    double v5 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x263F01AE0], 1uLL, 0);
    if (v5)
    {
      id v6 = v5;
      CGImageDestinationAddImage(v5, staticRepresentation, 0);
      if (!CGImageDestinationFinalize(v6))
      {
        id v7 = _PRGetLogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315394;
          uint64_t v14 = "_PRGetPNGDataForImage";
          __int16 v15 = 1024;
          int v16 = 556;
          _os_log_impl(&dword_213B6F000, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"CGImageDestinationFinalize returned false!\"", (uint8_t *)&v13, 0x12u);
        }

        CFRelease(Mutable);
        Mutable = 0;
      }
      CFRelease(v6);
    }
    else
    {
      uint64_t v8 = _PRGetLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315394;
        uint64_t v14 = "_PRGetPNGDataForImage";
        __int16 v15 = 1024;
        int v16 = 548;
        _os_log_impl(&dword_213B6F000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"CGImageDestinationCreateWithData return NULL!\"", (uint8_t *)&v13, 0x12u);
      }

      CFRelease(Mutable);
      Mutable = 0;
    }
    staticRepresentationData = self->_staticRepresentationData;
    self->_staticRepresentationData = (NSData *)Mutable;

    if (!self->_staticRepresentationData)
    {
      int v10 = _PRGetLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315394;
        uint64_t v14 = "-[PRLikeness staticRepresentationData]";
        __int16 v15 = 1024;
        int v16 = 380;
        _os_log_impl(&dword_213B6F000, v10, OS_LOG_TYPE_DEFAULT, "%s (%d) \"_PRGetPNGDataForImage returned nil!\"", (uint8_t *)&v13, 0x12u);
      }
    }
  }
  double v11 = self->_staticRepresentationData;
  return v11;
}

- (void)setStaticRepresentationData:(id)a3
{
  self->_staticRepresentation = 0;
}

- (NSString)scopeDescription
{
  return (NSString *)+[PRLikeness descriptionForScope:self->_scope];
}

+ (id)descriptionForScope:(unint64_t)a3
{
  double v3 = @"(unknown)";
  if (a3 == 1) {
    double v3 = @"private";
  }
  if (a3 == 2) {
    return @"public";
  }
  else {
    return v3;
  }
}

+ (unint64_t)scopeFromDescription:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"private"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqual:@"public"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (NSString)typeDescription
{
  unint64_t v2 = self->_type - 1;
  if (v2 > 3) {
    return (NSString *)@"(unknown)";
  }
  else {
    return &off_2641DAD68[v2]->isa;
  }
}

- (id)description
{
  recipe = self->_recipe;
  if (recipe)
  {
    unint64_t v4 = NSString;
    double v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSData length](recipe, "length"));
    v25 = [v4 stringWithFormat:@"NSData of size %@ bytes", v5];
  }
  else
  {
    v25 = @"(none)";
  }
  staticRepresentation = self->_staticRepresentation;
  if (staticRepresentation)
  {
    id v7 = [NSNumber numberWithUnsignedLong:CGImageGetWidth(staticRepresentation)];
    uint64_t v8 = [NSNumber numberWithUnsignedLong:CGImageGetHeight(self->_staticRepresentation)];
    uint64_t v24 = [NSString stringWithFormat:@"%@x%@ CGImageRef - ", v7, v8];
  }
  else
  {
    uint64_t v24 = &stru_26C4A32E0;
  }
  if (CGRectIsNull(self->_cropRectForTopLeftOrigin))
  {
    v9 = @"(none)";
  }
  else
  {
    v9 = [NSString stringWithFormat:@"{(%.1f, %.1f), w: %.1f, h: %.1f}", *(void *)&self->_cropRectForTopLeftOrigin.origin.x, *(void *)&self->_cropRectForTopLeftOrigin.origin.y, *(void *)&self->_cropRectForTopLeftOrigin.size.width, *(void *)&self->_cropRectForTopLeftOrigin.size.height];
  }
  if ([(NSMutableSet *)self->_dirtyProperties count])
  {
    int v10 = [(NSMutableSet *)self->_dirtyProperties allObjects];
    double v11 = [v10 componentsJoinedByString:@","];
  }
  else
  {
    double v11 = @"(none)";
  }
  __int16 v12 = [(id)objc_opt_class() _dateFormatter];
  int v13 = [v12 stringFromDate:self->_softExpirationDate];
  uint64_t v14 = [v12 stringFromDate:self->_expirationDate];
  __int16 v15 = [v12 stringFromDate:self->_creationDate];
  id v22 = (id)NSString;
  int v16 = [(PRLikeness *)self typeDescription];
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:self->_version];
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSData length](self->_staticRepresentationData, "length"));
  uint64_t v19 = (void *)v18;
  if (self->_isCurrent) {
    uint64_t v20 = @"YES";
  }
  else {
    uint64_t v20 = @"NO";
  }
  id v23 = [v22 stringWithFormat:@"PRLikeness { type: %@, version: %@, recipe: %@, expires: (h: %@ - s: %@), created: %@, static rep: (%@%@ data bytes), crop: %@, dirty: %@, current: %@ }", v16, v17, v25, v14, v13, v15, v24, v18, v9, v11, v20];

  return v23;
}

- (BOOL)isDirty
{
  return [(NSMutableSet *)self->_dirtyProperties count] != 0;
}

- (void)clearDirtyProperties
{
}

+ (id)_dateFormatter
{
  if (_dateFormatter_onceToken != -1) {
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global);
  }
  unint64_t v2 = (void *)_dateFormatter_formatter;
  return v2;
}

uint64_t __28__PRLikeness__dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_dateFormatter_formatter;
  _dateFormatter_formatter = (uint64_t)v0;

  [(id)_dateFormatter_formatter setDateStyle:1];
  unint64_t v2 = (void *)_dateFormatter_formatter;
  return [v2 setTimeStyle:1];
}

- (unint64_t)scope
{
  return self->_scope;
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (CGRect)cropRectForTopLeftOrigin
{
  double x = self->_cropRectForTopLeftOrigin.origin.x;
  double y = self->_cropRectForTopLeftOrigin.origin.y;
  double width = self->_cropRectForTopLeftOrigin.size.width;
  double height = self->_cropRectForTopLeftOrigin.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSDate)softExpirationDate
{
  return self->_softExpirationDate;
}

- (void)setSoftExpirationDate:(id)a3
{
}

- (NSString)ownerID
{
  return self->_ownerID;
}

- (void)setOwnerID:(id)a3
{
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSDate)insertionDate
{
  return self->_insertionDate;
}

- (void)setInsertionDate:(id)a3
{
}

- (NSSet)dirtyProperties
{
  return &self->_dirtyProperties->super;
}

- (void)setDirtyProperties:(id)a3
{
}

@end