@interface OS_mrcs_object
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation OS_mrcs_object

- (BOOL)isEqual:(id)a3
{
  v4 = (OS_mrcs_object *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (Class isa = self[2].super.super.isa, isa == v4[2].super.super.isa)
      && (v8 = (uint64_t (*)(OS_mrcs_object *, OS_mrcs_object *))*((void *)isa + 4)) != 0)
    {
      char v6 = v8(self, v4);
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
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
    v4 = (void (*)(OS_mrcs_object *, SEL))*((void *)i + 5);
    if (v4) {
      v4(self, a2);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)OS_mrcs_object;
  [(OS_mrcs_object *)&v5 dealloc];
}

@end