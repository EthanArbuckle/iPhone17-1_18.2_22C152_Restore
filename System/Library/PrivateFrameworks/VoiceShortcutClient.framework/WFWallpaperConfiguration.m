@interface WFWallpaperConfiguration
+ (BOOL)supportsSecureCoding;
- (NSNumber)legibilityBlur;
- (NSNumber)smartCrop;
- (NSNumber)usePreview;
- (NSSecurityScopedURLWrapper)assetURLWrapper;
- (NSString)assetIdentifier;
- (NSURL)assetURL;
- (WFWallpaperConfiguration)initWithAssetURL:(id)a3 localIdentifier:(id)a4 location:(int64_t)a5 legibilityBlur:(id)a6 smartCrop:(id)a7 usePreview:(id)a8;
- (WFWallpaperConfiguration)initWithCoder:(id)a3;
- (WFWallpaperConfiguration)initWithLocalIdentifier:(id)a3 location:(int64_t)a4 legibilityBlur:(id)a5 smartCrop:(id)a6 usePreview:(id)a7;
- (WFWallpaperConfiguration)initWithURL:(id)a3 location:(int64_t)a4 legibilityBlur:(id)a5 smartCrop:(id)a6 usePreview:(id)a7;
- (WFWallpaperConfiguration)initWithUserInfo:(id)a3;
- (id)description;
- (id)userInfoRepresentation;
- (int64_t)location;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWallpaperConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURLWrapper, 0);
  objc_storeStrong((id *)&self->_smartCrop, 0);
  objc_storeStrong((id *)&self->_legibilityBlur, 0);
  objc_storeStrong((id *)&self->_usePreview, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

- (NSSecurityScopedURLWrapper)assetURLWrapper
{
  return self->_assetURLWrapper;
}

- (NSNumber)smartCrop
{
  return self->_smartCrop;
}

- (NSNumber)legibilityBlur
{
  return self->_legibilityBlur;
}

- (NSNumber)usePreview
{
  return self->_usePreview;
}

- (int64_t)location
{
  return self->_location;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFWallpaperConfiguration *)self assetURLWrapper];
  [v4 encodeObject:v5 forKey:@"assetURLWrapper"];

  v6 = [(WFWallpaperConfiguration *)self assetIdentifier];
  [v4 encodeObject:v6 forKey:@"assetIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFWallpaperConfiguration location](self, "location"), @"location");
  v7 = [(WFWallpaperConfiguration *)self legibilityBlur];
  [v4 encodeObject:v7 forKey:@"legibilityBlur"];

  v8 = [(WFWallpaperConfiguration *)self smartCrop];
  [v4 encodeObject:v8 forKey:@"smartCrop"];

  id v9 = [(WFWallpaperConfiguration *)self usePreview];
  [v4 encodeObject:v9 forKey:@"usePreview"];
}

- (WFWallpaperConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFWallpaperConfiguration;
  v5 = [(WFWallpaperConfiguration *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetURLWrapper"];
    assetURLWrapper = v5->_assetURLWrapper;
    v5->_assetURLWrapper = (NSSecurityScopedURLWrapper *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetIdentifier"];
    assetIdentifier = v5->_assetIdentifier;
    v5->_assetIdentifier = (NSString *)v8;

    v5->_location = [v4 decodeIntegerForKey:@"location"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"legibilityBlur"];
    legibilityBlur = v5->_legibilityBlur;
    v5->_legibilityBlur = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"smartCrop"];
    smartCrop = v5->_smartCrop;
    v5->_smartCrop = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usePreview"];
    usePreview = v5->_usePreview;
    v5->_usePreview = (NSNumber *)v14;

    v16 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)WFWallpaperConfiguration;
  id v4 = [(WFWallpaperConfiguration *)&v14 description];
  v5 = [(WFWallpaperConfiguration *)self assetURL];
  uint64_t v6 = [(WFWallpaperConfiguration *)self assetIdentifier];
  unint64_t v7 = [(WFWallpaperConfiguration *)self location];
  if (v7 > 2) {
    uint64_t v8 = @"invalid";
  }
  else {
    uint64_t v8 = off_1E60785C0[v7];
  }
  id v9 = [(WFWallpaperConfiguration *)self legibilityBlur];
  uint64_t v10 = [(WFWallpaperConfiguration *)self smartCrop];
  v11 = [(WFWallpaperConfiguration *)self usePreview];
  uint64_t v12 = [v3 stringWithFormat:@"<%@, assetURL: %@, assetID: %@, location: %@, legibilityBlur: %@, smartCrop: %@, usePreview: %@", v4, v5, v6, v8, v9, v10, v11];

  return v12;
}

- (NSURL)assetURL
{
  v2 = [(WFWallpaperConfiguration *)self assetURLWrapper];
  v3 = [v2 url];

  return (NSURL *)v3;
}

- (id)userInfoRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(WFWallpaperConfiguration *)self assetIdentifier];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v4, @"wf_assetIdentifier");

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFWallpaperConfiguration location](self, "location"));
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v5, @"wf_wallpaperLocation");

  uint64_t v6 = [(WFWallpaperConfiguration *)self legibilityBlur];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v6, @"wf_legibilityBlur");

  unint64_t v7 = [(WFWallpaperConfiguration *)self smartCrop];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v7, @"wf_smartCrop");

  uint64_t v8 = [(WFWallpaperConfiguration *)self usePreview];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v8, @"wf_usePreview");

  id v9 = [(WFWallpaperConfiguration *)self assetURLWrapper];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28DB0];
    v11 = [(WFWallpaperConfiguration *)self assetURLWrapper];
    uint64_t v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];

    objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v12, @"wf_assetURLWrapper");
  }
  v13 = (void *)[v3 copy];

  return v13;
}

- (WFWallpaperConfiguration)initWithUserInfo:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)WFWallpaperConfiguration;
  v5 = [(WFWallpaperConfiguration *)&v36 init];
  if (!v5)
  {
LABEL_38:
    v33 = 0;
    goto LABEL_39;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v4 objectForKey:@"wf_assetURLWrapper"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [v6 unarchivedObjectOfClass:v7 fromData:v10 error:0];

  assetURLWrapper = v5->_assetURLWrapper;
  v5->_assetURLWrapper = (NSSecurityScopedURLWrapper *)v11;

  v13 = [v4 objectForKey:@"wf_assetIdentifier"];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v14 = v13;
    }
    else {
      objc_super v14 = 0;
    }
  }
  else
  {
    objc_super v14 = 0;
  }
  v15 = v14;

  assetIdentifier = v5->_assetIdentifier;
  v5->_assetIdentifier = v15;

  v17 = [v4 objectForKey:@"wf_wallpaperLocation"];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v18 = v17;
    }
    else {
      objc_super v18 = 0;
    }
  }
  else
  {
    objc_super v18 = 0;
  }
  id v19 = v18;

  uint64_t v20 = [v19 integerValue];
  v5->_location = v20;
  v21 = [v4 objectForKey:@"wf_legibilityBlur"];
  if (v21)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  legibilityBlur = v5->_legibilityBlur;
  v5->_legibilityBlur = v23;

  v25 = [v4 objectForKey:@"wf_smartCrop"];
  if (v25)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v26 = v25;
    }
    else {
      v26 = 0;
    }
  }
  else
  {
    v26 = 0;
  }
  v27 = v26;

  smartCrop = v5->_smartCrop;
  v5->_smartCrop = v27;

  v29 = [v4 objectForKey:@"wf_usePreview"];
  if (v29)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v30 = v29;
    }
    else {
      v30 = 0;
    }
  }
  else
  {
    v30 = 0;
  }
  v31 = v30;

  usePreview = v5->_usePreview;
  v5->_usePreview = v31;

  if (!v5->_assetURLWrapper && !v5->_assetIdentifier)
  {
    v34 = os_log_create("com.apple.shortcuts", "Actions");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v4;
      _os_log_impl(&dword_1B3C5C000, v34, OS_LOG_TYPE_DEFAULT, "Unable to make wallpaper configuration from userInfo due to missing asset URL and identifier: %@", buf, 0xCu);
    }

    goto LABEL_38;
  }
  v33 = v5;
LABEL_39:

  return v33;
}

- (WFWallpaperConfiguration)initWithAssetURL:(id)a3 localIdentifier:(id)a4 location:(int64_t)a5 legibilityBlur:(id)a6 smartCrop:(id)a7 usePreview:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v27.receiver = self;
  v27.super_class = (Class)WFWallpaperConfiguration;
  id v19 = [(WFWallpaperConfiguration *)&v27 init];
  uint64_t v20 = v19;
  if (v19)
  {
    if (v14)
    {
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v14 readonly:1];
      assetURLWrapper = v20->_assetURLWrapper;
      v20->_assetURLWrapper = (NSSecurityScopedURLWrapper *)v21;
    }
    else
    {
      assetURLWrapper = v19->_assetURLWrapper;
      v19->_assetURLWrapper = 0;
    }

    uint64_t v23 = [v15 copy];
    assetIdentifier = v20->_assetIdentifier;
    v20->_assetIdentifier = (NSString *)v23;

    v20->_location = a5;
    objc_storeStrong((id *)&v20->_legibilityBlur, a6);
    objc_storeStrong((id *)&v20->_smartCrop, a7);
    objc_storeStrong((id *)&v20->_usePreview, a8);
    v25 = v20;
  }

  return v20;
}

- (WFWallpaperConfiguration)initWithLocalIdentifier:(id)a3 location:(int64_t)a4 legibilityBlur:(id)a5 smartCrop:(id)a6 usePreview:(id)a7
{
  return [(WFWallpaperConfiguration *)self initWithAssetURL:0 localIdentifier:a3 location:a4 legibilityBlur:a5 smartCrop:a6 usePreview:a7];
}

- (WFWallpaperConfiguration)initWithURL:(id)a3 location:(int64_t)a4 legibilityBlur:(id)a5 smartCrop:(id)a6 usePreview:(id)a7
{
  return [(WFWallpaperConfiguration *)self initWithAssetURL:a3 localIdentifier:0 location:a4 legibilityBlur:a5 smartCrop:a6 usePreview:a7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end