@interface SKWaitingForDiskElement
- (NSDictionary)diskDictionary;
- (id)block;
- (void)setBlock:(id)a3;
- (void)setDiskDictionary:(id)a3;
@end

@implementation SKWaitingForDiskElement

- (NSDictionary)diskDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDiskDictionary:(id)a3
{
}

- (id)block
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_diskDictionary, 0);
}

@end