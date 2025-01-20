@interface STShowActivityRequest
+ (BOOL)supportsSecureCoding;
- (STShowActivityRequest)initWithCoder:(id)a3;
- (id)_initWithDataType:(int64_t)a3 view:(int64_t)a4;
- (id)createResponse;
- (int64_t)dataType;
- (int64_t)view;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STShowActivityRequest

- (STShowActivityRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STShowActivityRequest;
  v5 = [(AFSiriRequest *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_dataType = [v4 decodeIntegerForKey:@"kSTShowActivityRequestDataTypeKey"];
    v5->_view = [v4 decodeIntegerForKey:@"kSTShowActivityRequestViewKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowActivityRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_dataType, @"kSTShowActivityRequestDataTypeKey", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_view forKey:@"kSTShowActivityRequestViewKey"];
}

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

- (int64_t)view
{
  return self->_view;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (id)_initWithDataType:(int64_t)a3 view:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)STShowActivityRequest;
  id result = [(AFSiriRequest *)&v7 init];
  if (result)
  {
    *((void *)result + 5) = a3;
    *((void *)result + 6) = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end