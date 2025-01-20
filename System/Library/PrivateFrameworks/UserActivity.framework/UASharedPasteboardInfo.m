@interface UASharedPasteboardInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (NSDictionary)sandboxExtensions;
- (NSFileHandle)dataFile;
- (NSString)sharedDataPath;
- (UASharedPasteboardInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)dataSize;
- (void)encodeWithCoder:(id)a3;
- (void)setDataFile:(id)a3;
- (void)setDataSize:(int64_t)a3;
- (void)setItems:(id)a3;
- (void)setSandboxExtensions:(id)a3;
- (void)setSharedDataPath:(id)a3;
@end

@implementation UASharedPasteboardInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UASharedPasteboardInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UASharedPasteboardInfo *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UASharedPasteboardInfoDataFileKey"];
    [(UASharedPasteboardInfo *)v5 setDataFile:v6];

    -[UASharedPasteboardInfo setDataSize:](v5, "setDataSize:", [v4 decodeIntegerForKey:@"UASharedPasteboardInfoDataSizeKey"]);
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"UASharedPasteboardInfoItemsKey"];
    [(UASharedPasteboardInfo *)v5 setItems:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UASharedPasteboardInfoDataPathKey"];
    [(UASharedPasteboardInfo *)v5 setSharedDataPath:v11];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);

    v16 = [v4 decodeObjectOfClasses:v15 forKey:@"UASharedPasteboardInfoExtensionKey"];
    [(UASharedPasteboardInfo *)v5 setSandboxExtensions:v16];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UASharedPasteboardInfo *)self dataFile];
  [v4 encodeObject:v5 forKey:@"UASharedPasteboardInfoDataFileKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[UASharedPasteboardInfo dataSize](self, "dataSize"), @"UASharedPasteboardInfoDataSizeKey");
  v6 = [(UASharedPasteboardInfo *)self items];
  [v4 encodeObject:v6 forKey:@"UASharedPasteboardInfoItemsKey"];

  v7 = [(UASharedPasteboardInfo *)self sharedDataPath];
  [v4 encodeObject:v7 forKey:@"UASharedPasteboardInfoDataPathKey"];

  id v8 = [(UASharedPasteboardInfo *)self sandboxExtensions];
  [v4 encodeObject:v8 forKey:@"UASharedPasteboardInfoExtensionKey"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(UASharedPasteboardInfo *)self dataSize];
    if (v6 == [v5 dataSize])
    {
      v7 = [(UASharedPasteboardInfo *)self items];
      id v8 = [v5 items];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(UASharedPasteboardInfo);
  int64_t v6 = [(UASharedPasteboardInfo *)self dataFile];
  v7 = (void *)[v6 copy];
  [(UASharedPasteboardInfo *)v5 setDataFile:v7];

  [(UASharedPasteboardInfo *)v5 setDataSize:[(UASharedPasteboardInfo *)self dataSize]];
  id v8 = [(UASharedPasteboardInfo *)self items];
  char v9 = (void *)[v8 copyWithZone:a3];
  [(UASharedPasteboardInfo *)v5 setItems:v9];

  v10 = [(UASharedPasteboardInfo *)self sharedDataPath];
  v11 = (void *)[v10 copy];
  [(UASharedPasteboardInfo *)v5 setSharedDataPath:v11];

  return v5;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v16.receiver = self;
  v16.super_class = (Class)UASharedPasteboardInfo;
  id v4 = [(UASharedPasteboardInfo *)&v16 description];
  objc_msgSend(v3, "appendFormat:", @"%@: Data size: %ld Items: (\r\n"), v4, -[UASharedPasteboardInfo dataSize](self, "dataSize");

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(UASharedPasteboardInfo *)self items];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
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
        [v3 appendFormat:@"%@\r\n", v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }

  [v3 appendString:@""]);

  return v3;
}

- (NSFileHandle)dataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDataFile:(id)a3
{
}

- (int64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(int64_t)a3
{
  self->_dataSize = a3;
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setItems:(id)a3
{
}

- (NSString)sharedDataPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSharedDataPath:(id)a3
{
}

- (NSDictionary)sandboxExtensions
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSandboxExtensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
  objc_storeStrong((id *)&self->_sharedDataPath, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_dataFile, 0);
}

@end