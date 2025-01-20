@interface CLWPZone
- (BOOL)isEqual:(id)a3;
- (CLWPZone)initWithProximityUUID:(id)a3 major:(id)a4 minor:(id)a5 identifier:(id)a6;
- (NSData)advertisementData;
- (NSNumber)major;
- (NSNumber)minor;
- (NSString)identifier;
- (NSUUID)proximityUUID;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation CLWPZone

- (CLWPZone)initWithProximityUUID:(id)a3 major:(id)a4 minor:(id)a5 identifier:(id)a6
{
  v17.receiver = self;
  v17.super_class = (Class)CLWPZone;
  v10 = [(CLWPZone *)&v17 init];
  if (v10)
  {
    v10->_identifier = (NSString *)[a6 copy];
    v10->_proximityUUID = (NSUUID *)[a3 copy];
    v10->_major = (NSNumber *)[a4 copy];
    v10->_minor = (NSNumber *)[a5 copy];
    if (v10->_proximityUUID)
    {
      v11 = (NSData *)objc_alloc_init((Class)NSMutableData);
      v18[0] = 0;
      v18[1] = 0;
      [(NSUUID *)v10->_proximityUUID getUUIDBytes:v18];
      [(NSData *)v11 appendBytes:v18 length:16];
      major = v10->_major;
      if (major)
      {
        __int16 v16 = __rev16([(NSNumber *)major unsignedShortValue]);
        [(NSData *)v11 appendBytes:&v16 length:2];
        minor = v10->_minor;
        if (minor)
        {
          __int16 v15 = __rev16([(NSNumber *)minor unsignedShortValue]);
          [(NSData *)v11 appendBytes:&v15 length:2];
        }
      }
    }
    else
    {
      v11 = 0;
    }
    v10->_advertisementData = v11;
  }
  return v10;
}

- (void)dealloc
{
  self->_advertisementData = 0;
  self->_minor = 0;

  self->_major = 0;
  self->_proximityUUID = 0;

  self->_identifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLWPZone;
  [(CLWPZone *)&v3 dealloc];
}

- (id)description
{
  return self->_identifier;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = [(CLWPZone *)self identifier];
  id v6 = [a3 identifier];

  return [(NSString *)v5 isEqual:v6];
}

- (NSUUID)proximityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)major
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)minor
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)advertisementData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

@end