@interface SRCursor
+ (BOOL)supportsSecureCoding;
+ (SRCursor)new;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (SRCursor)init;
- (SRCursor)initWithCoder:(id)a3;
- (id)_payloadOfClass:(Class)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRCursor

- (SRCursor)init
{
  return 0;
}

+ (SRCursor)new
{
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EAF0 = (uint64_t)os_log_create("com.apple.SensorKit", "SRCursor");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SRCursor alloc];
  if (!v4) {
    return 0;
  }
  payload = self->_payload;
  hmac = self->_hmac;
  v9.receiver = v4;
  v9.super_class = (Class)SRCursor;
  v7 = [(SRCursor *)&v9 init];
  if (v7)
  {
    v7->_payload = (NSData *)[(NSData *)payload copy];
    v7->_hmac = (NSData *)[(NSData *)hmac copy];
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  LOBYTE(v6) = 0;
  if (self && (isKindOfClass & 1) != 0)
  {
    payload = self->_payload;
    if (a3)
    {
      unsigned int v6 = [(NSData *)payload isEqualToData:*((void *)a3 + 1)];
      if (!v6) {
        return v6;
      }
      uint64_t v8 = *((void *)a3 + 2);
    }
    else
    {
      unsigned __int8 v10 = [(NSData *)payload isEqualToData:0];
      uint64_t v8 = 0;
      if ((v10 & 1) == 0)
      {
        LOBYTE(v6) = 0;
        return v6;
      }
    }
    hmac = self->_hmac;
    LOBYTE(v6) = [(NSData *)hmac isEqualToData:v8];
  }
  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_payload hash];
  return (unint64_t)[(NSData *)self->_hmac hash] ^ v3;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"%@ (%p)", NSStringFromClass(v3), self];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRCursor;
  [(SRCursor *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_payload forKey:@"payload"];
  hmac = self->_hmac;

  [a3 encodeObject:hmac forKey:@"hmac"];
}

- (SRCursor)initWithCoder:(id)a3
{
  id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
  id v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"hmac"];
  if (self)
  {
    v7 = v6;
    v9.receiver = self;
    v9.super_class = (Class)SRCursor;
    self = [(SRCursor *)&v9 init];
    if (self)
    {
      self->_payload = (NSData *)[v5 copy];
      self->_hmac = (NSData *)[v7 copy];
    }
  }
  return self;
}

- (id)_payloadOfClass:(Class)a3 error:(id *)a4
{
  if (self) {
    payload = self->_payload;
  }
  else {
    payload = 0;
  }
  return +[NSKeyedUnarchiver unarchivedObjectOfClass:a3 fromData:payload error:a4];
}

@end