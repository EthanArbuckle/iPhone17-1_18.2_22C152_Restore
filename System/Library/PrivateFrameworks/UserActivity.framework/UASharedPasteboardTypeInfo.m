@interface UASharedPasteboardTypeInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)preferFileRep;
- (NSFileHandle)dataFile;
- (NSNumber)index;
- (NSNumber)offset;
- (NSString)type;
- (NSString)typeHint;
- (NSUUID)uuid;
- (UASharedPasteboardTypeInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setDataFile:(id)a3;
- (void)setIndex:(id)a3;
- (void)setOffset:(id)a3;
- (void)setPreferFileRep:(BOOL)a3;
- (void)setSize:(int64_t)a3;
- (void)setType:(id)a3;
- (void)setTypeHint:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation UASharedPasteboardTypeInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UASharedPasteboardTypeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UASharedPasteboardTypeInfo *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UASharedPasteboardTypeInfoTypeKey"];
    [(UASharedPasteboardTypeInfo *)v5 setType:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UASharedPasteboardTypeInfoUUIDKey"];
    [(UASharedPasteboardTypeInfo *)v5 setUuid:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UASharedPasteboardTypeInfoOffsetKey"];
    [(UASharedPasteboardTypeInfo *)v5 setOffset:v8];

    -[UASharedPasteboardTypeInfo setSize:](v5, "setSize:", [v4 decodeIntegerForKey:@"UASharedPasteboardTypeInfoSizeKey"]);
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UASharedPasteboardTypeInfoDataFileKey"];
    [(UASharedPasteboardTypeInfo *)v5 setDataFile:v9];

    -[UASharedPasteboardTypeInfo setPreferFileRep:](v5, "setPreferFileRep:", [v4 decodeBoolForKey:@"UASharedPasteboardTypeInfoPrefRepKey"]);
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UASharedPasteboardTypeInfoTypeHintKey"];
    [(UASharedPasteboardTypeInfo *)v5 setTypeHint:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UASharedPasteboardTypeInfoIndex"];
    [(UASharedPasteboardTypeInfo *)v5 setIndex:v11];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UASharedPasteboardTypeInfo *)self type];
  [v4 encodeObject:v5 forKey:@"UASharedPasteboardTypeInfoTypeKey"];

  v6 = [(UASharedPasteboardTypeInfo *)self uuid];
  [v4 encodeObject:v6 forKey:@"UASharedPasteboardTypeInfoUUIDKey"];

  v7 = [(UASharedPasteboardTypeInfo *)self offset];
  [v4 encodeObject:v7 forKey:@"UASharedPasteboardTypeInfoOffsetKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[UASharedPasteboardTypeInfo size](self, "size"), @"UASharedPasteboardTypeInfoSizeKey");
  v8 = [(UASharedPasteboardTypeInfo *)self dataFile];
  [v4 encodeObject:v8 forKey:@"UASharedPasteboardTypeInfoDataFileKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UASharedPasteboardTypeInfo preferFileRep](self, "preferFileRep"), @"UASharedPasteboardTypeInfoPrefRepKey");
  v9 = [(UASharedPasteboardTypeInfo *)self typeHint];
  [v4 encodeObject:v9 forKey:@"UASharedPasteboardTypeInfoTypeHintKey"];

  id v10 = [(UASharedPasteboardTypeInfo *)self index];
  [v4 encodeObject:v10 forKey:@"UASharedPasteboardTypeInfoIndex"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(UASharedPasteboardTypeInfo *)self uuid];
    v7 = [v5 uuid];
    if ([v6 isEqual:v7])
    {
      v8 = [(UASharedPasteboardTypeInfo *)self type];
      v9 = [v5 type];
      if ([v8 isEqualToString:v9])
      {
        id v10 = [(UASharedPasteboardTypeInfo *)self offset];
        v11 = [v5 offset];
        if (v10 == v11)
        {
          int64_t v13 = [(UASharedPasteboardTypeInfo *)self size];
          BOOL v12 = v13 == [v5 size];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UASharedPasteboardTypeInfo);
  id v5 = [(UASharedPasteboardTypeInfo *)self type];
  v6 = (void *)[v5 copy];
  [(UASharedPasteboardTypeInfo *)v4 setType:v6];

  v7 = [(UASharedPasteboardTypeInfo *)self uuid];
  v8 = (void *)[v7 copy];
  [(UASharedPasteboardTypeInfo *)v4 setUuid:v8];

  v9 = [(UASharedPasteboardTypeInfo *)self offset];
  id v10 = (void *)[v9 copy];
  [(UASharedPasteboardTypeInfo *)v4 setOffset:v10];

  [(UASharedPasteboardTypeInfo *)v4 setSize:[(UASharedPasteboardTypeInfo *)self size]];
  v11 = [(UASharedPasteboardTypeInfo *)self dataFile];
  BOOL v12 = (void *)[v11 copy];
  [(UASharedPasteboardTypeInfo *)v4 setDataFile:v12];

  [(UASharedPasteboardTypeInfo *)v4 setPreferFileRep:[(UASharedPasteboardTypeInfo *)self preferFileRep]];
  int64_t v13 = [(UASharedPasteboardTypeInfo *)self typeHint];
  v14 = (void *)[v13 copy];
  [(UASharedPasteboardTypeInfo *)v4 setTypeHint:v14];

  v15 = [(UASharedPasteboardTypeInfo *)self index];
  v16 = (void *)[v15 copy];
  [(UASharedPasteboardTypeInfo *)v4 setIndex:v16];

  return v4;
}

- (id)description
{
  id v25 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v5 = [(UASharedPasteboardTypeInfo *)self index];
  uint64_t v6 = [v5 integerValue];
  v24 = [(UASharedPasteboardTypeInfo *)self type];
  v7 = [(UASharedPasteboardTypeInfo *)self uuid];
  v8 = [v7 UUIDString];
  v9 = [(UASharedPasteboardTypeInfo *)self offset];
  v22 = v7;
  v23 = v5;
  if (v9 || [(UASharedPasteboardTypeInfo *)self size] > 0)
  {
    uint64_t v10 = v6;
    int v21 = 0;
LABEL_4:
    v11 = NSString;
    v3 = [(UASharedPasteboardTypeInfo *)self offset];
    int64_t v12 = [(UASharedPasteboardTypeInfo *)self size];
    v2 = [(UASharedPasteboardTypeInfo *)self dataFile];
    int64_t v13 = [v11 stringWithFormat:@", offset: %@, size: %ld, fd: %d", v3, v12, objc_msgSend(v2, "fileDescriptor")];
    int v14 = 1;
    goto LABEL_5;
  }
  uint64_t v10 = v6;
  v20 = [(UASharedPasteboardTypeInfo *)self dataFile];
  int v21 = 1;
  if ([v20 fileDescriptor]) {
    goto LABEL_4;
  }
  int v14 = 0;
  int64_t v13 = &stru_1F0CB4508;
LABEL_5:
  v15 = [(UASharedPasteboardTypeInfo *)self typeHint];
  if (v15)
  {
    v16 = NSString;
    v17 = [(UASharedPasteboardTypeInfo *)self typeHint];
    v18 = [v16 stringWithFormat:@", hint: %@", v17];
    [v25 appendFormat:@"info { %ld type: %@, uuid: %@%@%@}", v10, v24, v8, v13, v18];
  }
  else
  {
    [v25 appendFormat:@"info { %ld type: %@, uuid: %@%@%@}", v10, v24, v8, v13, &stru_1F0CB4508];
  }

  if (v14)
  {
  }
  if (v21) {

  }
  return v25;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setType:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSNumber)offset
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOffset:(id)a3
{
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (NSFileHandle)dataFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDataFile:(id)a3
{
}

- (BOOL)preferFileRep
{
  return self->_preferFileRep;
}

- (void)setPreferFileRep:(BOOL)a3
{
  self->_preferFileRep = a3;
}

- (NSString)typeHint
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTypeHint:(id)a3
{
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_typeHint, 0);
  objc_storeStrong((id *)&self->_dataFile, 0);
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end