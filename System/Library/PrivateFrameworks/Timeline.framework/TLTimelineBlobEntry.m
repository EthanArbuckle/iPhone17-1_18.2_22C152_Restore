@interface TLTimelineBlobEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)tl_validate:(id *)a3;
- (NSData)blob;
- (NSDate)tl_entryDate;
- (NSString)description;
- (TLTimelineBlobEntry)initWithBlob:(id)a3 atDate:(id)a4;
- (TLTimelineBlobEntry)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)tl_setEntryDate:(id)a3;
@end

@implementation TLTimelineBlobEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLTimelineBlobEntry)initWithBlob:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TLTimelineBlobEntry;
  v8 = [(TLTimelineBlobEntry *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    blob = v8->_blob;
    v8->_blob = (NSData *)v9;

    uint64_t v11 = [v7 copy];
    tl_entryDate = v8->_tl_entryDate;
    v8->_tl_entryDate = (NSDate *)v11;
  }
  return v8;
}

- (TLTimelineBlobEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TLTimelineBlobEntry;
  v5 = [(TLTimelineBlobEntry *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blob"];
    blob = v5->_blob;
    v5->_blob = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    tl_entryDate = v5->_tl_entryDate;
    v5->_tl_entryDate = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(TLTimelineBlobEntry *)self blob];
  v5 = [(TLTimelineBlobEntry *)self tl_entryDate];
  [v4 encodeObject:v6 forKey:@"blob"];
  [v4 encodeObject:v5 forKey:@"date"];
}

- (BOOL)tl_validate:(id *)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  v5 = [(TLTimelineBlobEntry *)self blob];
  id v6 = [(TLTimelineBlobEntry *)self tl_entryDate];
  uint64_t v7 = [v5 length];
  if (v7)
  {
    uint64_t v8 = &stru_26CE8BD98;
    if (v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = [&stru_26CE8BD98 stringByAppendingString:@"Data is empty. "];
  if (!v6)
  {
LABEL_3:
    uint64_t v9 = [(__CFString *)v8 stringByAppendingString:@"Date is nil. "];

    uint64_t v8 = (__CFString *)v9;
  }
LABEL_4:
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = !v10;
  if (a3 && !v11)
  {
    v12 = (void *)MEMORY[0x263F087E8];
    v15 = @"description";
    v16[0] = v8;
    v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a3 = [v12 errorWithDomain:@"TLTimelineBlobEntryDomain" code:500 userInfo:v13];
  }
  return v11;
}

- (unint64_t)hash
{
  v3 = [(TLTimelineBlobEntry *)self blob];
  uint64_t v4 = [v3 hash];
  v5 = [(TLTimelineBlobEntry *)self tl_entryDate];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 blob];
    unint64_t v6 = [(TLTimelineBlobEntry *)self blob];
    if (v5 == v6)
    {
      char v9 = 1;
    }
    else
    {
      uint64_t v7 = [v4 blob];
      uint64_t v8 = [(TLTimelineBlobEntry *)self blob];
      char v9 = [v7 isEqual:v8];
    }
    BOOL v11 = objc_msgSend(v4, "tl_entryDate");
    v12 = [(TLTimelineBlobEntry *)self tl_entryDate];
    if (v11 == v12)
    {
      char v15 = 1;
    }
    else
    {
      v13 = objc_msgSend(v4, "tl_entryDate");
      objc_super v14 = [(TLTimelineBlobEntry *)self tl_entryDate];
      char v15 = [v13 isEqual:v14];
    }
    char v10 = v9 & v15;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(TLTimelineBlobEntry *)self blob];
  v5 = [(TLTimelineBlobEntry *)self tl_entryDate];
  unint64_t v6 = [[TLTimelineBlobEntry alloc] initWithBlob:v4 atDate:v5];

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = (void *)MEMORY[0x263F08790];
  uint64_t v7 = [(TLTimelineBlobEntry *)self tl_entryDate];
  uint64_t v8 = [v6 localizedStringFromDate:v7 dateStyle:1 timeStyle:1];
  char v9 = (void *)MEMORY[0x263F086F0];
  char v10 = [(TLTimelineBlobEntry *)self blob];
  BOOL v11 = objc_msgSend(v9, "stringFromByteCount:countStyle:", objc_msgSend(v10, "length"), 3);
  v12 = [v3 stringWithFormat:@"<%@-%p: date: %@, size: %@, valid: %d>", v5, self, v8, v11, -[TLTimelineBlobEntry tl_validate:](self, "tl_validate:", 0)];

  return (NSString *)v12;
}

- (NSDate)tl_entryDate
{
  return self->_tl_entryDate;
}

- (void)tl_setEntryDate:(id)a3
{
}

- (NSData)blob
{
  return self->_blob;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blob, 0);
  objc_storeStrong((id *)&self->_tl_entryDate, 0);
}

@end