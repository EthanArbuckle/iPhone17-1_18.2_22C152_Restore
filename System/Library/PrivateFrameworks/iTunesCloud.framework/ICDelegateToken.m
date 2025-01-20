@interface ICDelegateToken
+ (BOOL)supportsSecureCoding;
- (BOOL)expiresBeforeDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (ICDelegateToken)initWithCoder:(id)a3;
- (ICDelegateToken)initWithType:(int64_t)a3 data:(id)a4;
- (ICDelegateToken)initWithType:(int64_t)a3 data:(id)a4 expirationDate:(id)a5;
- (NSData)data;
- (NSDate)expirationDate;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICDelegateToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)data
{
  return self->_data;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"d"];
  [v5 encodeObject:self->_expirationDate forKey:@"e"];
  [v5 encodeInteger:self->_type forKey:@"t"];
}

- (ICDelegateToken)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)ICDelegateToken;
    v6 = [(ICDelegateToken *)&v11 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_data, v5);
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"e"];
      expirationDate = v7->_expirationDate;
      v7->_expirationDate = (NSDate *)v8;

      v7->_type = [v4 decodeIntegerForKey:@"t"];
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_type != v4[2]) {
    goto LABEL_11;
  }
  expirationDate = self->_expirationDate;
  v6 = (NSDate *)v4[3];
  if (expirationDate != v6)
  {
    char v7 = 0;
    if (!expirationDate || !v6) {
      goto LABEL_12;
    }
    if (!-[NSDate isEqualToDate:](expirationDate, "isEqualToDate:"))
    {
LABEL_11:
      char v7 = 0;
      goto LABEL_12;
    }
  }
  data = self->_data;
  v9 = (NSData *)v4[1];
  if (data == v9)
  {
    char v7 = 1;
  }
  else
  {
    char v7 = 0;
    if (data && v9) {
      char v7 = -[NSData isEqualToData:](data, "isEqualToData:");
    }
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_data hash];
  uint64_t v4 = [(NSDate *)self->_expirationDate hash];
  uint64_t v5 = 1;
  if (self->_type == 1) {
    uint64_t v5 = 2;
  }
  return v4 ^ v3 ^ v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = v3;
  int64_t type = self->_type;
  if (type == 1)
  {
    v6 = @"Type: CloudCredentials";
  }
  else
  {
    if (type) {
      goto LABEL_6;
    }
    v6 = @"Type: PICRequest";
  }
  [v3 addObject:v6];
LABEL_6:
  if (self->_expirationDate)
  {
    char v7 = (void *)[[NSString alloc] initWithFormat:@"Expires: %@", self->_expirationDate];
    [v4 addObject:v7];
  }
  if (self->_data)
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Data: %ld Bytes", -[NSData length](self->_data, "length"));
    [v4 addObject:v8];
  }
  v9 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)ICDelegateToken;
  v10 = [(ICDelegateToken *)&v14 description];
  objc_super v11 = [v4 componentsJoinedByString:@"; "];
  v12 = [v9 stringWithFormat:@"%@ [%@]", v10, v11];

  return v12;
}

- (BOOL)isExpired
{
  if (!self->_expirationDate) {
    return 0;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  BOOL v4 = [(NSDate *)self->_expirationDate compare:v3] == NSOrderedAscending;

  return v4;
}

- (BOOL)expiresBeforeDate:(id)a3
{
  expirationDate = self->_expirationDate;
  if (expirationDate) {
    LOBYTE(expirationDate) = [(NSDate *)expirationDate compare:a3] == NSOrderedAscending;
  }
  return (char)expirationDate;
}

- (ICDelegateToken)initWithType:(int64_t)a3 data:(id)a4 expirationDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (a3 != 1 || v9)
  {
    v17.receiver = self;
    v17.super_class = (Class)ICDelegateToken;
    objc_super v11 = [(ICDelegateToken *)&v17 init];
    if (v11)
    {
      uint64_t v12 = [v8 copy];
      data = v11->_data;
      v11->_data = (NSData *)v12;

      uint64_t v14 = [v10 copy];
      expirationDate = v11->_expirationDate;
      v11->_expirationDate = (NSDate *)v14;

      v11->_int64_t type = a3;
    }
  }
  else
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Missing required expirationDate"];
    objc_super v11 = 0;
  }

  return v11;
}

- (ICDelegateToken)initWithType:(int64_t)a3 data:(id)a4
{
  return [(ICDelegateToken *)self initWithType:a3 data:a4 expirationDate:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end