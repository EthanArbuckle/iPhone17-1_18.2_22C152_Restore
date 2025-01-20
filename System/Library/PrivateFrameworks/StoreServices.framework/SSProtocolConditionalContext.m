@interface SSProtocolConditionalContext
- (NSString)platformName;
- (NSString)systemVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)itemLookupBlock;
- (void)dealloc;
- (void)setItemLookupBlock:(id)a3;
- (void)setPlatformName:(id)a3;
- (void)setSystemVersion:(id)a3;
@end

@implementation SSProtocolConditionalContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSProtocolConditionalContext;
  [(SSProtocolConditionalContext *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = [self->_itemLookupBlock copyWithZone:a3];
  v5[2] = [(NSString *)self->_platformName copyWithZone:a3];
  v5[3] = [(NSString *)self->_systemVersion copyWithZone:a3];
  return v5;
}

- (id)itemLookupBlock
{
  return self->_itemLookupBlock;
}

- (void)setItemLookupBlock:(id)a3
{
}

- (NSString)platformName
{
  return self->_platformName;
}

- (void)setPlatformName:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

@end