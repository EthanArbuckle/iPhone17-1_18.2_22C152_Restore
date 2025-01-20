@interface VFXShaderArgument
- (NSString)name;
- (NSString)type;
- (void)dealloc;
- (void)setName:(id)a3;
- (void)setType:(id)a3;
@end

@implementation VFXShaderArgument

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXShaderArgument;
  [(VFXShaderArgument *)&v3 dealloc];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

@end