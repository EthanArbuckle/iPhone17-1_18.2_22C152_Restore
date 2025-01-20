@interface PFPosterDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorIdentifierForDescriptorType:(int64_t)a3 uuids:(id)a4;
+ (id)descriptorTypeStringWithType:(int64_t)a3;
+ (id)loadFromURL:(id)a3 error:(id *)a4;
+ (int64_t)descriptorTypeFromTypeString:(id)a3;
- (BOOL)isBlankTemplate;
- (BOOL)isEqual:(id)a3;
- (BOOL)saveToURL:(id)a3 error:(id *)a4;
- (NSArray)media;
- (NSString)displayNameLocalizationKey;
- (NSString)identifier;
- (NSString)styleCategory;
- (PFPosterDescriptor)initWithCoder:(id)a3;
- (PFPosterDescriptor)initWithDescriptorType:(int64_t)a3 media:(id)a4;
- (PFPosterShuffleConfiguration)shuffleConfiguration;
- (int64_t)descriptorType;
- (int64_t)posterType;
- (unint64_t)hash;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayNameLocalizationKey:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setShuffleConfiguration:(id)a3;
- (void)setStyleCategory:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PFPosterDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shuffleConfiguration, 0);
  objc_storeStrong((id *)&self->_styleCategory, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_media, 0);
}

- (void)setShuffleConfiguration:(id)a3
{
}

- (PFPosterShuffleConfiguration)shuffleConfiguration
{
  return self->_shuffleConfiguration;
}

- (void)setStyleCategory:(id)a3
{
}

- (NSString)styleCategory
{
  return self->_styleCategory;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSArray)media
{
  return self->_media;
}

- (int64_t)descriptorType
{
  return self->_descriptorType;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_descriptorType];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NSArray *)self->_media hash] ^ v4;

  return v5;
}

- (PFPosterDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"media"];
  v6 = -[PFPosterDescriptor initWithDescriptorType:media:](self, "initWithDescriptorType:media:", [v4 decodeIntegerForKey:@"descriptorType"], v5);
  -[PFPosterDescriptor setVersion:](v6, "setVersion:", [v4 decodeIntegerForKey:@"version"]);
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  [(PFPosterDescriptor *)v6 setIdentifier:v7];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayNameLocalizationKey"];
  [(PFPosterDescriptor *)v6 setDisplayNameLocalizationKey:v8];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"styleCategory"];
  [(PFPosterDescriptor *)v6 setStyleCategory:v9];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shuffleConfiguration"];

  [(PFPosterDescriptor *)v6 setShuffleConfiguration:v10];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PFPosterDescriptor descriptorType](self, "descriptorType"), @"descriptorType");
  unint64_t v5 = [(PFPosterDescriptor *)self media];
  [v4 encodeObject:v5 forKey:@"media"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PFPosterDescriptor version](self, "version"), @"version");
  v6 = [(PFPosterDescriptor *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];

  v7 = [(PFPosterDescriptor *)self displayNameLocalizationKey];
  [v4 encodeObject:v7 forKey:@"displayNameLocalizationKey"];

  v8 = [(PFPosterDescriptor *)self styleCategory];
  [v4 encodeObject:v8 forKey:@"styleCategory"];

  id v9 = [(PFPosterDescriptor *)self shuffleConfiguration];
  [v4 encodeObject:v9 forKey:@"shuffleConfiguration"];
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v6 = [a3 URLByAppendingPathComponent:@"DescriptorModel.plist"];
  v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
  v8 = v7;
  id v9 = *a4;
  if (*a4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412546;
      v16 = v6;
      __int16 v17 = 2112;
      id v18 = v9;
      v10 = MEMORY[0x1E4F14500];
      v11 = "Failed to encode descriptor data at path:%@ error:%@";
LABEL_9:
      _os_log_error_impl(&dword_1A41FE000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0x16u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  BOOL v12 = 1;
  [v7 writeToURL:v6 options:1 error:a4];
  id v13 = *a4;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412546;
      v16 = v6;
      __int16 v17 = 2112;
      id v18 = v13;
      v10 = MEMORY[0x1E4F14500];
      v11 = "Failed to write descriptor data at path:%@ error:%@";
      goto LABEL_9;
    }
LABEL_6:
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PFPosterDescriptor *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      int64_t v6 = [(PFPosterDescriptor *)self descriptorType];
      if (v6 != [(PFPosterDescriptor *)v5 descriptorType])
      {
        char v10 = 0;
LABEL_33:

        goto LABEL_34;
      }
      id v7 = [(PFPosterDescriptor *)self media];
      id v8 = [(PFPosterDescriptor *)v5 media];
      if (v7 == v8)
      {
      }
      else
      {
        int v9 = [v7 isEqual:v8];

        if (!v9) {
          goto LABEL_15;
        }
      }
      unint64_t v11 = [(PFPosterDescriptor *)self version];
      if (v11 != [(PFPosterDescriptor *)v5 version])
      {
LABEL_15:
        char v10 = 0;
LABEL_32:

        goto LABEL_33;
      }
      id v12 = [(PFPosterDescriptor *)self identifier];
      id v13 = [(PFPosterDescriptor *)v5 identifier];
      if (v12 == v13)
      {
      }
      else
      {
        int v14 = [v12 isEqual:v13];

        if (!v14)
        {
          char v10 = 0;
LABEL_31:

          goto LABEL_32;
        }
      }
      id v15 = [(PFPosterDescriptor *)self displayNameLocalizationKey];
      id v16 = [(PFPosterDescriptor *)v5 displayNameLocalizationKey];
      if (v15 == v16)
      {
      }
      else
      {
        int v17 = [v15 isEqual:v16];

        if (!v17)
        {
          char v10 = 0;
LABEL_30:

          goto LABEL_31;
        }
      }
      v26 = v15;
      id v18 = [(PFPosterDescriptor *)self styleCategory];
      id v19 = [(PFPosterDescriptor *)v5 styleCategory];
      v25 = v18;
      if (v18 == v19)
      {
      }
      else
      {
        int v20 = [v18 isEqual:v19];

        if (!v20)
        {
          char v10 = 0;
LABEL_29:

          id v15 = v26;
          goto LABEL_30;
        }
      }
      v24 = v12;
      v21 = [(PFPosterDescriptor *)self shuffleConfiguration];
      v22 = [(PFPosterDescriptor *)v5 shuffleConfiguration];
      if (v21 == v22) {
        char v10 = 1;
      }
      else {
        char v10 = [v21 isEqual:v22];
      }

      id v12 = v24;
      goto LABEL_29;
    }
    char v10 = 0;
  }
LABEL_34:

  return v10;
}

- (PFPosterDescriptor)initWithDescriptorType:(int64_t)a3 media:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PFPosterDescriptor;
  id v8 = [(PFPosterDescriptor *)&v12 init];
  int v9 = v8;
  if (v8)
  {
    v8->_descriptorType = a3;
    objc_storeStrong((id *)&v8->_media, a4);
    v9->_version = 0;
    styleCategory = v9->_styleCategory;
    v9->_styleCategory = 0;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)loadFromURL:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a3 URLByAppendingPathComponent:@"DescriptorModel.plist"];
  id v18 = 0;
  int64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:1 error:&v18];
  id v7 = v18;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    objc_super v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    id v17 = v7;
    id v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v12 fromData:v6 error:&v17];
    id v14 = v17;

    if (v13)
    {
      id v15 = v13;
LABEL_10:

      goto LABEL_11;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v14;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to unarchive data error:%@", buf, 0xCu);
      if (!a4) {
        goto LABEL_10;
      }
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    *a4 = v14;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v5;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to read descriptor data at path:%@ error:%@", buf, 0x16u);
    if (a4) {
      goto LABEL_6;
    }
  }
  else if (a4)
  {
LABEL_6:
    id v14 = v7;
    id v13 = 0;
    *a4 = v14;
    goto LABEL_11;
  }
  id v13 = 0;
  id v14 = v7;
LABEL_11:

  return v13;
}

+ (int64_t)descriptorTypeFromTypeString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Undefined"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"FeaturedPhoto"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"SmartAlbum"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"SettlingEffect"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"Fallback"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"CreateAFacePhotos"])
  {
    int64_t v4 = 101;
  }
  else if ([v3 isEqualToString:@"CreateAFaceShuffle"])
  {
    int64_t v4 = 102;
  }
  else if ([v3 isEqualToString:@"CreateAFacePeople"])
  {
    int64_t v4 = 103;
  }
  else if ([v3 isEqualToString:@"CreateAFaceLivePhoto"])
  {
    int64_t v4 = 104;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)descriptorTypeStringWithType:(int64_t)a3
{
  id result = @"Undefined";
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      id result = @"FeaturedPhoto";
      break;
    case 2:
      id result = @"SmartAlbum";
      break;
    case 3:
      id result = @"SettlingEffect";
      break;
    case 4:
      id result = @"Fallback";
      break;
    default:
      switch(a3)
      {
        case 'e':
          id result = @"CreateAFacePhotos";
          break;
        case 'f':
          id result = @"CreateAFaceShuffle";
          break;
        case 'g':
          id result = @"CreateAFacePeople";
          break;
        case 'h':
          id result = @"CreateAFaceLivePhoto";
          break;
        default:
          id result = @"??";
          break;
      }
      break;
  }
  return result;
}

+ (id)descriptorIdentifierForDescriptorType:(int64_t)a3 uuids:(id)a4
{
  id v6 = a4;
  id v7 = [a1 descriptorTypeStringWithType:a3];
  id v8 = v7;
  uint64_t v9 = @"Undefined";
  switch(a3)
  {
    case 0:
      break;
    case 1:
    case 3:
    case 4:
      uint64_t v10 = NSString;
      uint64_t v11 = [v6 firstObject];
      goto LABEL_6;
    case 2:
      uint64_t v10 = NSString;
      uint64_t v11 = [v6 componentsJoinedByString:@"|"];
LABEL_6:
      objc_super v12 = (void *)v11;
      uint64_t v9 = [v10 stringWithFormat:@"%@|%@", v8, v11];

      break;
    default:
      if ((unint64_t)(a3 - 101) >= 4) {
        uint64_t v9 = @"??";
      }
      else {
        uint64_t v9 = v7;
      }
      break;
  }

  return v9;
}

- (int64_t)posterType
{
  uint64_t v2 = [(PFPosterDescriptor *)self descriptorType];
  int64_t result = 0;
  if (v2 > 100)
  {
    if ((unint64_t)(v2 - 103) >= 2 && v2 != 101)
    {
      if (v2 != 102) {
        return result;
      }
      return 2;
    }
    return 1;
  }
  if ((unint64_t)(v2 - 3) < 2 || v2 == 1) {
    return 1;
  }
  if (v2 == 2) {
    return 2;
  }
  return result;
}

- (BOOL)isBlankTemplate
{
  return (unint64_t)([(PFPosterDescriptor *)self descriptorType] - 101) < 4;
}

@end