@interface _UICellAccessoryConfigurationInsert
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (id)_identifier;
- (id)actionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_systemType;
- (void)setActionHandler:(id)a3;
@end

@implementation _UICellAccessoryConfigurationInsert

- (int64_t)_systemType
{
  return 3;
}

- (id)_identifier
{
  return @"Insert";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UICellAccessoryConfigurationInsert;
  v4 = [(_UICellAccessoryConfiguration *)&v8 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [self->_actionHandler copy];
    v6 = (void *)v4[4];
    v4[4] = v5;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UICellAccessoryConfigurationInsert;
  if ([(_UICellAccessoryConfiguration *)&v7 isEqual:v4]) {
    BOOL v5 = self->_actionHandler == v4[4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end