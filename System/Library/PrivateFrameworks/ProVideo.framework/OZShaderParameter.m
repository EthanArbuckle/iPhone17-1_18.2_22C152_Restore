@interface OZShaderParameter
- (NSString)name;
- (OZShaderParameter)initWithName:(id)a3 type:(int64_t)a4;
- (int64_t)type;
- (void)dealloc;
@end

@implementation OZShaderParameter

- (OZShaderParameter)initWithName:(id)a3 type:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)OZShaderParameter;
  v6 = [(OZShaderParameter *)&v8 init];
  if (v6)
  {
    v6->_name = (NSString *)[a3 copy];
    v6->_type = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OZShaderParameter;
  [(OZShaderParameter *)&v3 dealloc];
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

@end