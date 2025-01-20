@interface WebBundleManifest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSet)files;
- (NSString)version;
- (WebBundleManifest)initWithCoder:(id)a3;
- (WebBundleManifest)initWithVersion:(id)a3 files:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFiles:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation WebBundleManifest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

- (WebBundleManifest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WebBundleManifest;
  v5 = [(WebBundleManifest *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WebBundleManifestVersionKey"];
    [(WebBundleManifest *)v5 setVersion:v6];

    uint64_t v7 = objc_opt_class();
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"WebBundleManifestFilesKey"];
    [(WebBundleManifest *)v5 setFiles:v9];
  }
  return v5;
}

- (WebBundleManifest)initWithVersion:(id)a3 files:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WebBundleManifest;
  v8 = [(WebBundleManifest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(WebBundleManifest *)v8 setVersion:v6];
    [(WebBundleManifest *)v9 setFiles:v7];
  }

  return v9;
}

- (void)setVersion:(id)a3
{
}

- (void)setFiles:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSet)files
{
  return self->_files;
}

- (void)encodeWithCoder:(id)a3
{
  version = self->_version;
  id v5 = a3;
  [v5 encodeObject:version forKey:@"WebBundleManifestVersionKey"];
  [v5 encodeObject:self->_files forKey:@"WebBundleManifestFilesKey"];
}

- (unint64_t)hash
{
  v3 = [(WebBundleManifest *)self version];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(WebBundleManifest *)self files];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (WebBundleManifest *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = v5;
    id v7 = [(WebBundleManifest *)v6 version];
    v8 = [(WebBundleManifest *)self version];
    if (v7 == v8 || [v7 isEqual:v8])
    {
      v9 = [(WebBundleManifest *)v6 files];
      v10 = [(WebBundleManifest *)self files];
      if (v9 == v10) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = [v9 isEqual:v10];
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

@end