@interface ISURLCacheConfiguration
- (NSString)persistentIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)diskCapacity;
- (unint64_t)memoryCapacity;
- (void)dealloc;
- (void)setDiskCapacity:(unint64_t)a3;
- (void)setMemoryCapacity:(unint64_t)a3;
- (void)setPersistentIdentifier:(id)a3;
@end

@implementation ISURLCacheConfiguration

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISURLCacheConfiguration;
  [(ISURLCacheConfiguration *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_diskCapacity;
  v5[2] = self->_memoryCapacity;
  v5[3] = [(NSString *)self->_persistentIdentifier copyWithZone:a3];
  return v5;
}

- (unint64_t)diskCapacity
{
  return self->_diskCapacity;
}

- (void)setDiskCapacity:(unint64_t)a3
{
  self->_diskCapacity = a3;
}

- (unint64_t)memoryCapacity
{
  return self->_memoryCapacity;
}

- (void)setMemoryCapacity:(unint64_t)a3
{
  self->_memoryCapacity = a3;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
}

@end