@interface _BSUIDynamicArrayGeneration
- (NSArray)data;
- (_BSUIDynamicArrayGeneration)initWithData:(id)a3;
@end

@implementation _BSUIDynamicArrayGeneration

- (_BSUIDynamicArrayGeneration)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BSUIDynamicArrayGeneration;
  v5 = [(_BSUIDynamicArrayGeneration *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    data = v5->_data;
    v5->_data = v6;
  }
  return v5;
}

- (NSArray)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end