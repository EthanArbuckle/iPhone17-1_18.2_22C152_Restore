@interface PFPosterMedia
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)assetUUID;
- (NSString)subpath;
- (PFPosterEditConfiguration)editConfiguration;
- (PFPosterMedia)init;
- (PFPosterMedia)initWithAssetUUID:(id)a3;
- (PFPosterMedia)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)mediaType;
- (unint64_t)hash;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetUUID:(id)a3;
- (void)setEditConfiguration:(id)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setSubpath:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PFPosterMedia

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editConfiguration, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);

  objc_storeStrong((id *)&self->_subpath, 0);
}

- (void)setEditConfiguration:(id)a3
{
}

- (PFPosterEditConfiguration)editConfiguration
{
  return self->_editConfiguration;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setAssetUUID:(id)a3
{
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (void)setSubpath:(id)a3
{
}

- (NSString)subpath
{
  return self->_subpath;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (PFPosterMedia)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PFPosterMedia *)self init];
  if (v5)
  {
    v5->_mediaType = [v4 decodeIntegerForKey:@"mediaType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetUUID"];
    assetUUID = v5->_assetUUID;
    v5->_assetUUID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subpath"];
    subpath = v5->_subpath;
    v5->_subpath = (NSString *)v8;

    v5->_unint64_t version = [v4 decodeIntegerForKey:@"version"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"editConfiguration"];
    editConfiguration = v5->_editConfiguration;
    v5->_editConfiguration = (PFPosterEditConfiguration *)v10;

    if (!v5->_subpath && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      v13 = v5->_assetUUID;
      unint64_t version = v5->_version;
      int v15 = 138543618;
      v16 = v13;
      __int16 v17 = 2050;
      unint64_t v18 = version;
      _os_log_fault_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PFPosterMedia failed to decode subpath: assetUUID: %{public}@, version: %{public}lu", (uint8_t *)&v15, 0x16u);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PFPosterMedia mediaType](self, "mediaType"), @"mediaType");
  v5 = [(PFPosterMedia *)self assetUUID];
  [v4 encodeObject:v5 forKey:@"assetUUID"];

  uint64_t v6 = [(PFPosterMedia *)self subpath];
  [v4 encodeObject:v6 forKey:@"subpath"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PFPosterMedia version](self, "version"), @"version");
  id v7 = [(PFPosterMedia *)self editConfiguration];
  [v4 encodeObject:v7 forKey:@"editConfiguration"];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(PFPosterMedia *)self mediaType] - 1;
  if (v6 > 2) {
    id v7 = @"Undefined";
  }
  else {
    id v7 = off_1E5B2D138[v6];
  }
  uint64_t v8 = [(PFPosterMedia *)self subpath];
  unint64_t v9 = [(PFPosterMedia *)self version];
  uint64_t v10 = [(PFPosterMedia *)self editConfiguration];
  v11 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; type: %@; subpath: %@; version: %lul, editConfig: %@>",
                  v5,
                  self,
                  v7,
                  v8,
                  v9,
                  v10);

  return v11;
}

- (unint64_t)hash
{
  int64_t v3 = [(PFPosterMedia *)self mediaType];
  id v4 = [(PFPosterMedia *)self assetUUID];
  uint64_t v5 = v3 ^ (2 * [v4 hash]);
  unint64_t v6 = [(PFPosterMedia *)self subpath];
  uint64_t v7 = v5 ^ (4 * [v6 hash]);
  unint64_t v8 = v7 ^ (8 * [(PFPosterMedia *)self version]);
  unint64_t v9 = [(PFPosterMedia *)self editConfiguration];
  unint64_t v10 = v8 ^ (16 * [v9 hash]);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PFPosterMedia *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t v6 = [(PFPosterMedia *)self mediaType];
      if (v6 != [(PFPosterMedia *)v5 mediaType])
      {
        char v10 = 0;
LABEL_23:

        goto LABEL_24;
      }
      id v7 = [(PFPosterMedia *)self assetUUID];
      id v8 = [(PFPosterMedia *)v5 assetUUID];
      if (v7 == v8)
      {
      }
      else
      {
        int v9 = [v7 isEqual:v8];

        if (!v9)
        {
          char v10 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      id v11 = [(PFPosterMedia *)self subpath];
      id v12 = [(PFPosterMedia *)v5 subpath];
      if (v11 == v12)
      {
      }
      else
      {
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_18;
        }
      }
      unint64_t v14 = [(PFPosterMedia *)self version];
      if (v14 == [(PFPosterMedia *)v5 version])
      {
        int v15 = [(PFPosterMedia *)self editConfiguration];
        v16 = [(PFPosterMedia *)v5 editConfiguration];
        if (v15 == v16) {
          char v10 = 1;
        }
        else {
          char v10 = [v15 isEqual:v16];
        }

        goto LABEL_21;
      }
LABEL_18:
      char v10 = 0;
LABEL_21:

      goto LABEL_22;
    }
    char v10 = 0;
  }
LABEL_24:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAssetUUID:", self->_assetUUID);
  *(void *)(v4 + 8) = self->_mediaType;
  objc_storeStrong((id *)(v4 + 16), self->_subpath);
  *(void *)(v4 + 32) = self->_version;
  uint64_t v5 = [(PFPosterEditConfiguration *)self->_editConfiguration copy];
  int64_t v6 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v5;

  return (id)v4;
}

- (PFPosterMedia)initWithAssetUUID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PFPosterMedia;
  uint64_t v5 = [(PFPosterMedia *)&v10 init];
  int64_t v6 = v5;
  if (v5)
  {
    [(PFPosterMedia *)v5 setMediaType:1];
    [(PFPosterMedia *)v6 setAssetUUID:v4];
    if (v4)
    {
      [(PFPosterMedia *)v6 setSubpath:v4];
    }
    else
    {
      id v7 = [MEMORY[0x1E4F29128] UUID];
      id v8 = [v7 UUIDString];
      [(PFPosterMedia *)v6 setSubpath:v8];
    }
  }

  return v6;
}

- (PFPosterMedia)init
{
  return [(PFPosterMedia *)self initWithAssetUUID:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end