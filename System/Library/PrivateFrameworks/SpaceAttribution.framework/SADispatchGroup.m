@interface SADispatchGroup
- (OS_dispatch_group)group;
- (SADispatchGroup)init;
- (int)entries;
- (int)wait:(unint64_t)a3;
- (void)enter;
- (void)leave;
- (void)setEntries:(int)a3;
- (void)setGroup:(id)a3;
@end

@implementation SADispatchGroup

- (SADispatchGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)SADispatchGroup;
  v2 = [(SADispatchGroup *)&v6 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;

    v2->_entries = 0;
  }
  return v2;
}

- (void)enter
{
  obj = self;
  objc_sync_enter(obj);
  ++obj->_entries;
  dispatch_group_enter((dispatch_group_t)obj->_group);
  objc_sync_exit(obj);
}

- (void)leave
{
  obj = self;
  objc_sync_enter(obj);
  int entries = obj->_entries;
  BOOL v3 = __OFSUB__(entries, 1);
  int v4 = entries - 1;
  if (v4 < 0 == v3)
  {
    obj->_int entries = v4;
    dispatch_group_leave((dispatch_group_t)obj->_group);
  }
  objc_sync_exit(obj);
}

- (int)wait:(unint64_t)a3
{
  return dispatch_group_wait((dispatch_group_t)self->_group, a3);
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGroup:(id)a3
{
}

- (int)entries
{
  return self->_entries;
}

- (void)setEntries:(int)a3
{
  self->_int entries = a3;
}

- (void).cxx_destruct
{
}

@end