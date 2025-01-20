@interface CBDeviceEntry
- (CBDeviceEntry)init;
- (NSMutableDictionary)hostMap;
- (id)description;
- (void)setHostMap:(id)a3;
@end

@implementation CBDeviceEntry

- (CBDeviceEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBDeviceEntry;
  v2 = [(CBDeviceEntry *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hostMap = v2->_hostMap;
    v2->_hostMap = v3;
  }
  return v2;
}

- (id)description
{
  return +[NSString stringWithFormat:@"hostMap:%@", self->_hostMap];
}

- (NSMutableDictionary)hostMap
{
  return self->_hostMap;
}

- (void)setHostMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end