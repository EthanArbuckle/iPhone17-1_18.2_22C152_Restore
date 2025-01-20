@interface IPAAutoRegistryEntry
- (BOOL)persistable;
- (Class)autoSettingsClass;
- (void)setAutoSettingsClass:(Class)a3;
- (void)setPersistable:(BOOL)a3;
@end

@implementation IPAAutoRegistryEntry

- (void).cxx_destruct
{
}

- (void)setPersistable:(BOOL)a3
{
  self->_persistable = a3;
}

- (BOOL)persistable
{
  return self->_persistable;
}

- (void)setAutoSettingsClass:(Class)a3
{
}

- (Class)autoSettingsClass
{
  return self->_autoSettingsClass;
}

@end