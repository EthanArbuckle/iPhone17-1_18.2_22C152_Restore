@interface VKLogicDebugInfo
- (NSString)name;
- (VKLogicDebugInfo)initWithName:(id)a3 identifier:(unint64_t)a4;
- (unint64_t)identifier;
@end

@implementation VKLogicDebugInfo

- (void).cxx_destruct
{
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (VKLogicDebugInfo)initWithName:(id)a3 identifier:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VKLogicDebugInfo;
  v7 = [(VKLogicDebugInfo *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_identifier = a4;
    v10 = v7;
  }

  return v7;
}

@end