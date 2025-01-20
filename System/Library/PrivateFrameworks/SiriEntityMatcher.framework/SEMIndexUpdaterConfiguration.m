@interface SEMIndexUpdaterConfiguration
- (CCSetChangeRegistry)changeRegistry;
- (Class)updaterClass;
- (void)setChangeRegistry:(id)a3;
- (void)setUpdaterClass:(Class)a3;
@end

@implementation SEMIndexUpdaterConfiguration

- (Class)updaterClass
{
  return self->_updaterClass;
}

- (void)setUpdaterClass:(Class)a3
{
}

- (CCSetChangeRegistry)changeRegistry
{
  return self->_changeRegistry;
}

- (void)setChangeRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRegistry, 0);
  objc_storeStrong((id *)&self->_updaterClass, 0);
}

@end