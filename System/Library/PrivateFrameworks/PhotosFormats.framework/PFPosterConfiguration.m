@interface PFPosterConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)loadFromURL:(id)a3 error:(id *)a4;
- (BOOL)saveToURL:(id)a3 error:(id *)a4;
- (NSArray)media;
- (NSDictionary)userInfo;
- (NSString)description;
- (NSString)identifier;
- (PFPosterConfiguration)initWithCoder:(id)a3;
- (PFPosterConfiguration)initWithConfigurationType:(int64_t)a3;
- (PFPosterEditConfiguration)editConfiguration;
- (PFPosterShuffleConfiguration)shuffleConfiguration;
- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration;
- (id)analyticsPayload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mediaAnalyticsPayload;
- (int64_t)configurationType;
- (int64_t)options;
- (int64_t)posterType;
- (void)encodeWithCoder:(id)a3;
- (void)setEditConfiguration:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLayoutConfiguration:(id)a3;
- (void)setMedia:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setShuffleConfiguration:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation PFPosterConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_shuffleConfiguration, 0);
  objc_storeStrong((id *)&self->_editConfiguration, 0);
  objc_storeStrong((id *)&self->_media, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setLayoutConfiguration:(id)a3
{
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setShuffleConfiguration:(id)a3
{
}

- (PFPosterShuffleConfiguration)shuffleConfiguration
{
  return self->_shuffleConfiguration;
}

- (void)setEditConfiguration:(id)a3
{
}

- (PFPosterEditConfiguration)editConfiguration
{
  return self->_editConfiguration;
}

- (void)setMedia:(id)a3
{
}

- (NSArray)media
{
  return self->_media;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PFPosterConfiguration *)self identifier];
  int64_t v7 = [(PFPosterConfiguration *)self options];
  v8 = [(PFPosterConfiguration *)self media];
  v9 = [(PFPosterConfiguration *)self editConfiguration];
  v10 = [(PFPosterConfiguration *)self shuffleConfiguration];
  v11 = [(PFPosterConfiguration *)self layoutConfiguration];
  v12 = [(PFPosterConfiguration *)self userInfo];
  v13 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; identifier: %@; options: %ld; media: %@; edit configuration: %@; shuffle configuration: %@ layout configuration: %@ user info: %@>",
                  v5,
                  self,
                  v6,
                  v7,
                  v8,
                  v9,
                  v10,
                  v11,
                  v12);

  return (NSString *)v13;
}

- (PFPosterConfiguration)initWithCoder:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"configurationType"];
  v6 = [(PFPosterConfiguration *)self initWithConfigurationType:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v6->_options = [v4 decodeIntegerForKey:@"options"];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    v11 = [v9 setWithArray:v10];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"media"];
    media = v6->_media;
    v6->_media = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"editConfiguration"];
    editConfiguration = v6->_editConfiguration;
    v6->_editConfiguration = (PFPosterEditConfiguration *)v14;

    if (v5 == 1)
    {
      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shuffleConfiguration"];
      shuffleConfiguration = v6->_shuffleConfiguration;
      v6->_shuffleConfiguration = (PFPosterShuffleConfiguration *)v16;

      if (!v6->_shuffleConfiguration) {
        _PFAssertFailHandler();
      }
    }
    if ([v4 decodeIntegerForKey:@"version"])
    {
      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutConfiguration"];
      layoutConfiguration = v6->_layoutConfiguration;
      v6->_layoutConfiguration = (PFWallpaperCompoundDeviceConfiguration *)v18;
    }
    else
    {
      [MEMORY[0x1E4F28DC0] setClass:objc_opt_class() forClassName:@"PFParallaxLayoutConcreteConfiguration"];
      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutConfiguration"];
      if (v20)
      {
        layoutConfiguration = (void *)v20;
        v21 = [[PFWallpaperCompoundDeviceConfiguration alloc] initWithPortraitConfiguration:v20 landscapeConfiguration:0];
        v22 = v6->_layoutConfiguration;
        v6->_layoutConfiguration = v21;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v29 = 0;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Portrait config was missing\n\t", v29, 2u);
        }
        layoutConfiguration = 0;
      }
    }

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    v30[3] = objc_opt_class();
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    v25 = [v23 setWithArray:v24];
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"userInfo"];
    userInfo = v6->_userInfo;
    v6->_userInfo = (NSDictionary *)v26;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  [v18 encodeInteger:1 forKey:@"version"];
  objc_msgSend(v18, "encodeInteger:forKey:", -[PFPosterConfiguration configurationType](self, "configurationType"), @"configurationType");
  objc_msgSend(v18, "encodeInteger:forKey:", -[PFPosterConfiguration options](self, "options"), @"options");
  id v4 = [(PFPosterConfiguration *)self identifier];
  [v18 encodeObject:v4 forKey:@"identifier"];

  uint64_t v5 = [(PFPosterConfiguration *)self media];
  [v18 encodeObject:v5 forKey:@"media"];

  v6 = [(PFPosterConfiguration *)self editConfiguration];
  [v18 encodeObject:v6 forKey:@"editConfiguration"];

  if ([(PFPosterConfiguration *)self configurationType] == 1)
  {
    uint64_t v7 = [(PFPosterConfiguration *)self shuffleConfiguration];

    if (!v7)
    {
      uint64_t v14 = (PFPosterConfiguration *)_PFAssertFailHandler();
      [(PFPosterConfiguration *)v14 saveToURL:v16 error:v17];
      return;
    }
    v8 = [(PFPosterConfiguration *)self shuffleConfiguration];
    [v18 encodeObject:v8 forKey:@"shuffleConfiguration"];
  }
  v9 = [(PFPosterConfiguration *)self layoutConfiguration];

  if (v9)
  {
    v10 = [(PFPosterConfiguration *)self layoutConfiguration];
    [v18 encodeObject:v10 forKey:@"layoutConfiguration"];
  }
  v11 = [(PFPosterConfiguration *)self userInfo];

  uint64_t v12 = v18;
  if (v11)
  {
    v13 = [(PFPosterConfiguration *)self userInfo];
    [v18 encodeObject:v13 forKey:@"userInfo"];

    uint64_t v12 = v18;
  }
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __41__PFPosterConfiguration_saveToURL_error___block_invoke;
  v17[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v17[4] = a4;
  id v5 = a3;
  v6 = (void (**)(void, void))MEMORY[0x1A6259AE0](v17);
  uint64_t v7 = [v5 URLByAppendingPathComponent:@"ConfigurationModel.plist"];

  id v16 = 0;
  v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v16];
  id v9 = v16;
  if (v9)
  {
    id v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      __int16 v20 = 2112;
      id v21 = v10;
      v11 = MEMORY[0x1E4F14500];
      uint64_t v12 = "Failed to encode configuration data at path:%@ error:%@";
LABEL_9:
      _os_log_error_impl(&dword_1A41FE000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  id v15 = 0;
  BOOL v13 = 1;
  [v8 writeToURL:v7 options:1 error:&v15];
  id v10 = v15;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      __int16 v20 = 2112;
      id v21 = v10;
      v11 = MEMORY[0x1E4F14500];
      uint64_t v12 = "Failed to write configuration data at path:%@ error:%@";
      goto LABEL_9;
    }
LABEL_6:
    ((void (**)(void, id))v6)[2](v6, v10);
    BOOL v13 = 0;
  }

  return v13;
}

void **__41__PFPosterConfiguration_saveToURL_error___block_invoke(void **result, id a2)
{
  if (result[4])
  {
    v2 = result;
    result = (void **)a2;
    *v2[4] = result;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[PFPosterConfiguration allocWithZone:](PFPosterConfiguration, "allocWithZone:");
  v5->_configurationType = self->_configurationType;
  v5->_options = self->_options;
  objc_storeStrong((id *)&v5->_identifier, self->_identifier);
  objc_storeStrong((id *)&v5->_media, self->_media);
  uint64_t v6 = [(PFPosterEditConfiguration *)self->_editConfiguration copy];
  editConfiguration = v5->_editConfiguration;
  v5->_editConfiguration = (PFPosterEditConfiguration *)v6;

  uint64_t v8 = [(PFPosterShuffleConfiguration *)self->_shuffleConfiguration copy];
  shuffleConfiguration = v5->_shuffleConfiguration;
  v5->_shuffleConfiguration = (PFPosterShuffleConfiguration *)v8;

  objc_storeStrong((id *)&v5->_layoutConfiguration, self->_layoutConfiguration);
  uint64_t v10 = [(NSDictionary *)self->_userInfo copyWithZone:a3];
  userInfo = v5->_userInfo;
  v5->_userInfo = (NSDictionary *)v10;

  return v5;
}

- (id)mediaAnalyticsPayload
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [(PFPosterConfiguration *)self media];
  id v3 = (void *)[v2 copy];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v4);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "editConfiguration", (void)v26);
        uint64_t v12 = v11;
        if (v11)
        {
          uint64_t v8 = (v8 + 1);
          uint64_t v7 = v7 + [v11 isDepthEnabled];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }

  id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v30[0] = @"asset_count";
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v31[0] = v14;
  v30[1] = @"custom_edit_count";
  id v15 = [NSNumber numberWithInt:v8];
  v31[1] = v15;
  v30[2] = @"depth_enabled_count";
  id v16 = [NSNumber numberWithInt:v7];
  v31[2] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
  id v18 = (void *)[v13 initWithDictionary:v17];

  v19 = [v4 firstObject];
  __int16 v20 = v19;
  if (v19)
  {
    unint64_t v21 = [v19 mediaType];
    uint64_t v22 = v21 > 3 ? @"??" : off_1E5B2D150[v21];
    v23 = v22;
    [v18 setObject:v23 forKeyedSubscript:@"first_media_type"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v20, "suggestionSubtype"));
      [v18 setObject:v24 forKeyedSubscript:@"first_suggestion_subtype"];
    }
  }

  return v18;
}

- (id)analyticsPayload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int64_t v4 = [(PFPosterConfiguration *)self configurationType];
  uint64_t v5 = @"??";
  if (v4 == 1) {
    uint64_t v5 = @"Shuffle";
  }
  if (v4) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = @"Photo";
  }
  [v3 setObject:v6 forKeyedSubscript:@"configuration_type"];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[PFPosterConfiguration options](self, "options"));
  [v3 setObject:v7 forKeyedSubscript:@"configuration_options"];

  uint64_t v8 = [(PFPosterConfiguration *)self mediaAnalyticsPayload];
  [v3 addEntriesFromDictionary:v8];

  uint64_t v9 = [(PFPosterConfiguration *)self editConfiguration];

  if (v9)
  {
    uint64_t v10 = [(PFPosterConfiguration *)self editConfiguration];
    v11 = [v10 analyticsPayload];
    [v3 addEntriesFromDictionary:v11];
  }
  uint64_t v12 = [(PFPosterConfiguration *)self shuffleConfiguration];

  if (v12)
  {
    id v13 = [(PFPosterConfiguration *)self shuffleConfiguration];
    uint64_t v14 = [v13 analyticsPayload];
    [v3 addEntriesFromDictionary:v14];
  }

  return v3;
}

- (PFPosterConfiguration)initWithConfigurationType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PFPosterConfiguration;
  int64_t v4 = [(PFPosterConfiguration *)&v10 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_configurationType = a3;
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v7 = [v6 UUIDString];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;
  }
  return v5;
}

+ (id)loadFromURL:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 URLByAppendingPathComponent:@"ConfigurationModel.plist"];
  id v13 = 0;
  uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:1 error:&v13];
  id v7 = v13;
  if (v6)
  {
    id v12 = v7;
    uint64_t v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v12];
    id v9 = v12;

    if (v8)
    {
      id v10 = v8;
LABEL_10:

      goto LABEL_11;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to unarchive poster configuraton data error:%@", buf, 0xCu);
      if (!a4) {
        goto LABEL_10;
      }
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    *a4 = v9;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to read configuration data at path:%@ error:%@", buf, 0x16u);
    if (a4) {
      goto LABEL_6;
    }
  }
  else if (a4)
  {
LABEL_6:
    id v9 = v7;
    uint64_t v8 = 0;
    *a4 = v9;
    goto LABEL_11;
  }
  uint64_t v8 = 0;
  id v9 = v7;
LABEL_11:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)posterType
{
  if ([(PFPosterConfiguration *)self configurationType]) {
    return 2;
  }
  else {
    return 1;
  }
}

@end