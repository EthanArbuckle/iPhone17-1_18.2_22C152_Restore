@interface _PLForegroundMonitorClient
- (NSSet)bundleIdentifiers;
- (_PLForegroundMonitorClient)initWithBundleIdentifiers:(id)a3 block:(id)a4;
- (id)block;
@end

@implementation _PLForegroundMonitorClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

- (id)block
{
  return self->_block;
}

- (NSSet)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (_PLForegroundMonitorClient)initWithBundleIdentifiers:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PLForegroundMonitorClient;
  v8 = [(_PLForegroundMonitorClient *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleIdentifiers = v8->_bundleIdentifiers;
    v8->_bundleIdentifiers = (NSSet *)v9;

    uint64_t v11 = [v7 copy];
    id block = v8->_block;
    v8->_id block = (id)v11;
  }
  return v8;
}

@end