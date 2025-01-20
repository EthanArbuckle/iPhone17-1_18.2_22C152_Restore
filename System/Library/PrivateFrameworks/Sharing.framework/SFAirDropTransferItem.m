@interface SFAirDropTransferItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFile;
- (NSString)subtype;
- (NSString)type;
- (SFAirDropTransferItem)init;
- (SFAirDropTransferItem)initWithCoder:(id)a3;
- (SFAirDropTransferItem)initWithType:(id)a3 isFile:(BOOL)a4;
- (SFAirDropTransferItem)initWithType:(id)a3 subtype:(id)a4 isFile:(BOOL)a5;
- (id)description;
- (int64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)incrementCount;
@end

@implementation SFAirDropTransferItem

- (SFAirDropTransferItem)init
{
  return [(SFAirDropTransferItem *)self initWithType:&stru_1EF9BDC68 isFile:0];
}

- (SFAirDropTransferItem)initWithType:(id)a3 isFile:(BOOL)a4
{
  return [(SFAirDropTransferItem *)self initWithType:a3 subtype:0 isFile:a4];
}

- (SFAirDropTransferItem)initWithType:(id)a3 subtype:(id)a4 isFile:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SFAirDropTransferItem;
  v10 = [(SFAirDropTransferItem *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    type = v10->_type;
    v10->_type = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    subtype = v10->_subtype;
    v10->_subtype = (NSString *)v13;

    v10->_count = 1;
    v10->_isFile = a5;
  }

  return v10;
}

- (void)incrementCount
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirDropTransferItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SFAirDropTransferItem *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    uint64_t v7 = [v6 copy];
    type = v5->_type;
    v5->_type = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtype"];
    uint64_t v10 = [v9 copy];
    subtype = v5->_subtype;
    v5->_subtype = (NSString *)v10;

    v5->_count = [v4 decodeIntegerForKey:@"count"];
    v5->_isFile = [v4 decodeBoolForKey:@"isFile"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  type = self->_type;
  id v5 = a3;
  [v5 encodeObject:type forKey:@"type"];
  [v5 encodeObject:self->_subtype forKey:@"subtype"];
  [v5 encodeInteger:self->_count forKey:@"count"];
  [v5 encodeBool:self->_isFile forKey:@"isFile"];
}

- (id)description
{
  objc_opt_class();
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  if (self->_subtype)
  {
    uint64_t v10 = v3;
    NSAppendPrintF();
    id v5 = v10;

    id v4 = v5;
  }
  NSAppendPrintF();
  id v6 = v4;

  NSAppendPrintF();
  id v7 = v6;

  NSAppendPrintF();
  id v8 = v7;

  return v8;
}

- (unint64_t)hash
{
  id v3 = [(SFAirDropTransferItem *)self type];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(SFAirDropTransferItem *)self count] ^ v4;
  unint64_t v6 = v5 ^ [(SFAirDropTransferItem *)self isFile];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFAirDropTransferItem *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = v4;
      unint64_t v6 = [(SFAirDropTransferItem *)v5 subtype];
      id v7 = [(SFAirDropTransferItem *)self subtype];
      if (v6 == v7)
      {
        char v11 = 0;
      }
      else
      {
        id v8 = [(SFAirDropTransferItem *)v5 subtype];
        id v9 = [(SFAirDropTransferItem *)self subtype];
        char v10 = [v8 isEqual:v9];

        char v11 = v10 ^ 1;
      }

      uint64_t v13 = [(SFAirDropTransferItem *)self type];
      v14 = [(SFAirDropTransferItem *)v5 type];
      LOBYTE(v12) = 0;
      if ([v13 isEqual:v14] && (v11 & 1) == 0)
      {
        int64_t v15 = [(SFAirDropTransferItem *)self count];
        if (v15 == [(SFAirDropTransferItem *)v5 count])
        {
          BOOL v16 = [(SFAirDropTransferItem *)self isFile];
          BOOL v12 = v16 ^ [(SFAirDropTransferItem *)v5 isFile] ^ 1;
        }
        else
        {
          LOBYTE(v12) = 0;
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)subtype
{
  return self->_subtype;
}

- (int64_t)count
{
  return self->_count;
}

- (BOOL)isFile
{
  return self->_isFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtype, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end