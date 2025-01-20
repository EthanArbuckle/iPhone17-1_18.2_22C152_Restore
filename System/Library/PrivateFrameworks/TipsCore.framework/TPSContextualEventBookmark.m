@interface TPSContextualEventBookmark
+ (BOOL)supportsSecureCoding;
- (TPSContextualEventBookmark)initWithCoder:(id)a3;
- (TPSContextualEventBookmark)initWithDataVersion:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setDataVersion:(unsigned int)a3;
@end

@implementation TPSContextualEventBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualEventBookmark)initWithDataVersion:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSContextualEventBookmark;
  result = [(TPSContextualEventBookmark *)&v5 init];
  if (result) {
    result->_dataVersion = a3;
  }
  return result;
}

- (TPSContextualEventBookmark)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSContextualEventBookmark;
  objc_super v5 = [(TPSContextualEventBookmark *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataVersion"];
    v5->_dataVersion = [v6 unsignedIntValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  uint64_t dataVersion = self->_dataVersion;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInt:dataVersion];
  [v5 encodeObject:v6 forKey:@"dataVersion"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [v4 setDataVersion:self->_dataVersion];
  return v4;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v7.receiver = self;
  v7.super_class = (Class)TPSContextualEventBookmark;
  id v4 = [(TPSContextualEventBookmark *)&v7 description];
  id v5 = (void *)[v3 initWithString:v4];

  objc_msgSend(v5, "appendFormat:", @"; %@ = %d",
    @"dataVersion",
    [(TPSContextualEventBookmark *)self dataVersion]);
  return v5;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (void)setDataVersion:(unsigned int)a3
{
  self->_uint64_t dataVersion = a3;
}

@end