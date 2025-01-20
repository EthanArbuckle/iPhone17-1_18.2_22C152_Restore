@interface PKRemoteImageSet
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteImageSet:(id)a3;
- (NSSet)images;
- (NSString)name;
- (PKRemoteImageSet)initWithCoder:(id)a3;
- (PKRemoteImageSet)initWithName:(id)a3 dictionaries:(id)a4;
- (PKRemoteImageSet)initWithName:(id)a3 images:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imageForScaleFactor:(unint64_t)a3;
- (id)imageForScaleFactorValue:(double)a3;
- (unint64_t)hash;
- (void)addURL:(id)a3 forScaleFactor:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setImages:(id)a3;
- (void)setName:(id)a3;
@end

@implementation PKRemoteImageSet

- (PKRemoteImageSet)initWithName:(id)a3 dictionaries:(id)a4
{
  id v6 = a3;
  v7 = objc_msgSend(a4, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_141);
  v8 = [(PKRemoteImageSet *)self initWithName:v6 images:v7];

  return v8;
}

PKRemoteImage *__46__PKRemoteImageSet_initWithName_dictionaries___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKRemoteImage alloc] initWithDictionary:v2];

  return v3;
}

- (PKRemoteImageSet)initWithName:(id)a3 images:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKRemoteImageSet;
  v9 = [(PKRemoteImageSet *)&v17 init];
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    v14 = v10;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v9->_name, a3);
  if (v8)
  {
    v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CAD0] set];
    }
    images = v10->_images;
    v10->_images = v13;

    goto LABEL_8;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (id)imageForScaleFactor:(unint64_t)a3
{
  id v3 = (id)a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = self->_images;
    uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ((id)objc_msgSend(v9, "scaleFactor", (void)v11) == v3)
          {
            id v3 = v9;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    id v3 = 0;
LABEL_12:
  }
  return v3;
}

- (id)imageForScaleFactorValue:(double)a3
{
  if (a3 <= 2.0) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 3;
  }
  return [(PKRemoteImageSet *)self imageForScaleFactor:v3];
}

- (void)addURL:(id)a3 forScaleFactor:(unint64_t)a4
{
  if (a3 && a4)
  {
    id v6 = a3;
    id v12 = [(PKRemoteImageSet *)self imageForScaleFactor:a4];
    if (v12)
    {
      uint64_t v7 = [(NSSet *)self->_images pk_setByRemovingObject:v12];
      images = self->_images;
      self->_images = v7;
    }
    v9 = [[PKRemoteImage alloc] initWithRemoteURL:v6 scaleFactor:a4];

    if (v9)
    {
      v10 = [(NSSet *)self->_images setByAddingObject:v9];
      long long v11 = self->_images;
      self->_images = v10;
    }
  }
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"name: '%@'; ", self->_name];
  if ([(NSSet *)self->_images count]) {
    images = (NSSet *)&stru_1EE0F5368;
  }
  else {
    images = self->_images;
  }
  [v3 appendFormat:@"images: %@\n", images];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_images;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) description];
        [v3 appendFormat:@"- %@\n", v10];
      }
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKRemoteImageSet *)a3;
  uint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKRemoteImageSet *)self isEqualToRemoteImageSet:v5];

  return v6;
}

- (BOOL)isEqualToRemoteImageSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  BOOL v6 = (void *)*((void *)v4 + 1);
  uint64_t v7 = self->_name;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

LABEL_11:
      char v12 = 0;
      goto LABEL_12;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_11;
    }
  }
  images = self->_images;
  if (images) {
    char v12 = [(NSSet *)images isEqual:self->_images];
  }
  else {
    char v12 = 1;
  }
LABEL_12:

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_images];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemoteImageSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKRemoteImageSet;
  uint64_t v5 = [(PKRemoteImageSet *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    long long v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"images"];
    images = v5->_images;
    v5->_images = (NSSet *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_images forKey:@"images"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSSet *)self->_images allObjects];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __33__PKRemoteImageSet_copyWithZone___block_invoke;
  v13[3] = &__block_descriptor_40_e23__16__0__PKRemoteImage_8l;
  v13[4] = a3;
  uint64_t v9 = objc_msgSend(v8, "pk_arrayBySafelyApplyingBlock:", v13);

  if (v9) {
    [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  }
  else {
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
  }
  long long v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

id __33__PKRemoteImageSet_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copyWithZone:*(void *)(a1 + 32)];
  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSSet)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end