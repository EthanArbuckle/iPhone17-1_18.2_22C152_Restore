@interface VUIPlistMediaEntityImageLoadParams
- (BOOL)isEqual:(id)a3;
- (NSString)baseImageIdentifier;
- (NSString)description;
- (NSString)imageIdentifier;
- (NSURL)imageURL;
- (VUIPlistMediaEntityImageLoadParams)init;
- (VUIPlistMediaEntityImageLoadParams)initWithImageURL:(id)a3 baseImageIdentifier:(id)a4 imageType:(unint64_t)a5;
- (unint64_t)hash;
- (unint64_t)imageType;
- (void)setBaseImageIdentifier:(id)a3;
- (void)setImageType:(unint64_t)a3;
- (void)setImageURL:(id)a3;
@end

@implementation VUIPlistMediaEntityImageLoadParams

- (VUIPlistMediaEntityImageLoadParams)initWithImageURL:(id)a3 baseImageIdentifier:(id)a4 imageType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"imageURL" format];
    if (v10) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"baseImageIdentifier" format];
LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)VUIPlistMediaEntityImageLoadParams;
  v11 = [(VUIPlistMediaEntityImageLoadParams *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    imageURL = v11->_imageURL;
    v11->_imageURL = (NSURL *)v12;

    uint64_t v14 = [v10 copy];
    baseImageIdentifier = v11->_baseImageIdentifier;
    v11->_baseImageIdentifier = (NSString *)v14;

    v11->_imageType = a5;
  }

  return v11;
}

- (VUIPlistMediaEntityImageLoadParams)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (NSString)imageIdentifier
{
  imageIdentifier = self->_imageIdentifier;
  if (!imageIdentifier)
  {
    unint64_t v4 = [(VUIPlistMediaEntityImageLoadParams *)self imageType];
    v5 = @"previewFrame";
    if (v4 != 1) {
      v5 = 0;
    }
    if (v4) {
      v6 = v5;
    }
    else {
      v6 = @"covertArt";
    }
    v7 = NSString;
    id v8 = [(VUIPlistMediaEntityImageLoadParams *)self baseImageIdentifier];
    id v9 = [v7 stringWithFormat:@"%@_%@", v8, v6];
    v10 = self->_imageIdentifier;
    self->_imageIdentifier = v9;

    imageIdentifier = self->_imageIdentifier;
  }
  return imageIdentifier;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VUIPlistMediaEntityImageLoadParams *)self imageType];
  unint64_t v4 = [(VUIPlistMediaEntityImageLoadParams *)self baseImageIdentifier];
  uint64_t v5 = [v4 hash] ^ v3;

  v6 = [(VUIPlistMediaEntityImageLoadParams *)self imageURL];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (VUIPlistMediaEntityImageLoadParams *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        unint64_t v7 = [(VUIPlistMediaEntityImageLoadParams *)self imageType];
        if (v7 != [(VUIPlistMediaEntityImageLoadParams *)v6 imageType])
        {
LABEL_9:
          char v13 = 0;
LABEL_19:

          goto LABEL_20;
        }
        id v8 = [(VUIPlistMediaEntityImageLoadParams *)self baseImageIdentifier];
        id v9 = [(VUIPlistMediaEntityImageLoadParams *)v6 baseImageIdentifier];
        id v10 = v8;
        id v11 = v9;
        if (v10 == v11)
        {
        }
        else
        {
          uint64_t v12 = v11;
          char v13 = 0;
          if (!v10 || !v11)
          {
LABEL_18:

            goto LABEL_19;
          }
          char v14 = [v10 isEqual:v11];

          if ((v14 & 1) == 0) {
            goto LABEL_9;
          }
        }
        v15 = [(VUIPlistMediaEntityImageLoadParams *)self imageURL];
        v16 = [(VUIPlistMediaEntityImageLoadParams *)v6 imageURL];
        id v10 = v15;
        id v17 = v16;
        uint64_t v12 = v17;
        if (v10 == v17)
        {
          char v13 = 1;
        }
        else
        {
          char v13 = 0;
          if (v10 && v17) {
            char v13 = [v10 isEqual:v17];
          }
        }
        goto LABEL_18;
      }
    }
    char v13 = 0;
  }
LABEL_20:

  return v13;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistMediaEntityImageLoadParams;
  unint64_t v4 = [(VUIPlistMediaEntityImageLoadParams *)&v18 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  v6 = VUIImageTypeLogString([(VUIPlistMediaEntityImageLoadParams *)self imageType]);
  unint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"imageType", v6];
  [v3 addObject:v7];

  id v8 = NSString;
  id v9 = [(VUIPlistMediaEntityImageLoadParams *)self baseImageIdentifier];
  id v10 = [v8 stringWithFormat:@"%@=%@", @"baseImageIdentifier", v9];
  [v3 addObject:v10];

  id v11 = NSString;
  uint64_t v12 = [(VUIPlistMediaEntityImageLoadParams *)self imageURL];
  char v13 = [v11 stringWithFormat:@"%@=%@", @"imageURL", v12];
  [v3 addObject:v13];

  char v14 = NSString;
  v15 = [v3 componentsJoinedByString:@", "];
  v16 = [v14 stringWithFormat:@"<%@>", v15];

  return (NSString *)v16;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSString)baseImageIdentifier
{
  return self->_baseImageIdentifier;
}

- (void)setBaseImageIdentifier:(id)a3
{
}

- (unint64_t)imageType
{
  return self->_imageType;
}

- (void)setImageType:(unint64_t)a3
{
  self->_imageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseImageIdentifier, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
}

@end