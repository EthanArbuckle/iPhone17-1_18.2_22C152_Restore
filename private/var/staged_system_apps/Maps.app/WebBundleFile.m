@interface WebBundleFile
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)fileHash;
- (NSString)filePath;
- (WebBundleFile)initWithCoder:(id)a3;
- (WebBundleFile)initWithPath:(id)a3 hash:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFileHash:(id)a3;
- (void)setFilePath:(id)a3;
@end

@implementation WebBundleFile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);

  objc_storeStrong((id *)&self->_fileHash, 0);
}

- (WebBundleFile)initWithPath:(id)a3 hash:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WebBundleFile;
  v8 = [(WebBundleFile *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(WebBundleFile *)v8 setFilePath:v6];
    [(WebBundleFile *)v9 setFileHash:v7];
  }

  return v9;
}

- (WebBundleFile)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WebBundleFile;
  v5 = [(WebBundleFile *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WebBundleFileFilePathKey"];
    [(WebBundleFile *)v5 setFilePath:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WebBundleFileHashKey"];
    [(WebBundleFile *)v5 setFileHash:v7];
  }
  return v5;
}

- (void)setFilePath:(id)a3
{
}

- (void)setFileHash:(id)a3
{
}

- (unint64_t)hash
{
  v3 = [(WebBundleFile *)self filePath];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(WebBundleFile *)self fileHash];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (NSString)fileHash
{
  return self->_fileHash;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (WebBundleFile *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = v5;
    id v7 = [(WebBundleFile *)v6 filePath];
    v8 = [(WebBundleFile *)self filePath];
    if (v7 == v8 || [v7 isEqual:v8])
    {
      objc_super v9 = [(WebBundleFile *)v6 fileHash];
      v10 = [(WebBundleFile *)self fileHash];
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

- (NSString)filePath
{
  return self->_filePath;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  filePath = self->_filePath;
  id v5 = a3;
  [v5 encodeObject:filePath forKey:@"WebBundleFileFilePathKey"];
  [v5 encodeObject:self->_fileHash forKey:@"WebBundleFileHashKey"];
}

@end