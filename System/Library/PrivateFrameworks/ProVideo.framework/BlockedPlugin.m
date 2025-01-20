@interface BlockedPlugin
- (NSString)bundleName;
- (NSString)plugName;
- (NSString)plugVersion;
- (id)init:(id)a3 plugName:(id)a4 plugVersion:(id)a5;
- (void)dealloc;
@end

@implementation BlockedPlugin

- (id)init:(id)a3 plugName:(id)a4 plugVersion:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)BlockedPlugin;
  v8 = [(BlockedPlugin *)&v10 init];
  if (v8)
  {
    v8->_bundleName = (NSString *)a3;
    v8->_plugName = (NSString *)a4;
    v8->_plugVersion = (NSString *)a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BlockedPlugin;
  [(BlockedPlugin *)&v3 dealloc];
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (NSString)plugName
{
  return self->_plugName;
}

- (NSString)plugVersion
{
  return self->_plugVersion;
}

@end