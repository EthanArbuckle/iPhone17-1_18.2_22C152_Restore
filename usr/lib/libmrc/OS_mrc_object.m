@interface OS_mrc_object
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation OS_mrc_object

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  Class isa = self[2].super.super.isa;
  if (isa != *((Class *)a3 + 2)) {
    return 0;
  }
  v7 = (uint64_t (*)(OS_mrc_object *, id))*((void *)isa + 4);
  if (!v7) {
    return 0;
  }

  return v7(self, a3);
}

- (id)redactedDescription
{
  v2 = (char *)_mdns_obj_copy_description_as_cfstring((uint64_t)self);

  return v2;
}

- (NSString)debugDescription
{
  v2 = (char *)_mdns_obj_copy_description_as_cfstring((uint64_t)self);

  return (NSString *)v2;
}

- (NSString)description
{
  v2 = (char *)_mdns_obj_copy_description_as_cfstring((uint64_t)self);

  return (NSString *)v2;
}

- (void)dealloc
{
  for (Class i = self[2].super.super.isa; i; Class i = *(Class *)i)
  {
    v4 = (void (*)(OS_mrc_object *, SEL))*((void *)i + 5);
    if (v4) {
      v4(self, a2);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)OS_mrc_object;
  [(OS_mrc_object *)&v5 dealloc];
}

@end