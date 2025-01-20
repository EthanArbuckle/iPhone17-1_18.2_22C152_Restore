@interface FMDStandardAsset
+ (BOOL)supportsSecureCoding;
- (FMDStandardAsset)initWithCoder:(id)a3;
- (FMDStandardAsset)initWithFileURL:(id)a3 lastModified:(id)a4 etag:(id)a5 type:(unint64_t)a6 url:(id)a7;
- (NSData)data;
- (NSString)etag;
- (NSString)lastModified;
- (NSURL)fileURL;
- (NSURL)url;
- (unint64_t)assetType;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetType:(unint64_t)a3;
- (void)setData:(id)a3;
- (void)setEtag:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setLastModified:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation FMDStandardAsset

- (FMDStandardAsset)initWithFileURL:(id)a3 lastModified:(id)a4 etag:(id)a5 type:(unint64_t)a6 url:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FMDStandardAsset;
  v16 = [(FMDStandardAsset *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(FMDStandardAsset *)v16 setFileURL:v12];
    [(FMDStandardAsset *)v17 setLastModified:v13];
    [(FMDStandardAsset *)v17 setEtag:v14];
    [(FMDStandardAsset *)v17 setUrl:v15];
    [(FMDStandardAsset *)v17 setAssetType:a6];
  }

  return v17;
}

- (NSData)data
{
  v3 = self->_data;
  if (!v3)
  {
    id v4 = objc_alloc((Class)NSData);
    v5 = [(FMDStandardAsset *)self fileURL];
    id v9 = 0;
    v3 = (NSData *)[v4 initWithContentsOfURL:v5 options:0 error:&v9];
    id v6 = v9;

    if (v6 && (objc_msgSend(v6, "fm_isFileNotFoundError") & 1) == 0)
    {
      v7 = sub_100004238();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100240474(self, v6, v7);
      }
    }
  }

  return v3;
}

- (FMDStandardAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FMDStandardAsset;
  v5 = [(FMDStandardAsset *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("lastModified");
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(FMDStandardAsset *)v5 setLastModified:v8];

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector("etag");
    v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(FMDStandardAsset *)v5 setEtag:v11];

    uint64_t v12 = objc_opt_class();
    id v13 = NSStringFromSelector("url");
    id v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    [(FMDStandardAsset *)v5 setUrl:v14];

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector("fileURL");
    v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    [(FMDStandardAsset *)v5 setFileURL:v17];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDStandardAsset *)self lastModified];
  uint64_t v6 = NSStringFromSelector("lastModified");
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(FMDStandardAsset *)self etag];
  v8 = NSStringFromSelector("etag");
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(FMDStandardAsset *)self url];
  v10 = NSStringFromSelector("url");
  [v4 encodeObject:v9 forKey:v10];

  id v12 = [(FMDStandardAsset *)self fileURL];
  v11 = NSStringFromSelector("fileURL");
  [v4 encodeObject:v12 forKey:v11];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void)setData:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(unint64_t)a3
{
  self->_assetType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_etag, 0);

  objc_storeStrong((id *)&self->_lastModified, 0);
}

@end