@interface OS_dnssd_object
- (NSString)debugDescription;
- (NSString)description;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation OS_dnssd_object

- (id)redactedDescription
{
  isa = self + 2;
  while (1)
  {
    isa = (OS_dnssd_object *)isa->super.super.isa;
    if (!isa) {
      break;
    }
    v3 = (uint64_t (*)(void))isa[2].super.super.isa;
    if (v3)
    {
      v4 = (const char *)v3();
      if (v4)
      {
        v5 = (char *)v4;
        v6 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, 0x8000100u);
        free(v5);
        goto LABEL_7;
      }
      break;
    }
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (void)dealloc
{
  for (Class i = self[2].super.super.isa; i; Class i = *(Class *)i)
  {
    v4 = (void (*)(OS_dnssd_object *, SEL))*((void *)i + 3);
    if (v4) {
      v4(self, a2);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)OS_dnssd_object;
  [(OS_dnssd_object *)&v5 dealloc];
}

- (NSString)debugDescription
{
  isa = self + 2;
  while (1)
  {
    isa = (OS_dnssd_object *)isa->super.super.isa;
    if (!isa) {
      break;
    }
    v3 = (uint64_t (*)(void))isa[2].super.super.isa;
    if (v3)
    {
      v4 = (const char *)v3();
      if (v4)
      {
        objc_super v5 = (char *)v4;
        v6 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, 0x8000100u);
        free(v5);
        goto LABEL_7;
      }
      break;
    }
  }
  v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

- (NSString)description
{
  isa = self + 2;
  while (1)
  {
    isa = (OS_dnssd_object *)isa->super.super.isa;
    if (!isa) {
      break;
    }
    v3 = (uint64_t (*)(void))isa[2].super.super.isa;
    if (v3)
    {
      v4 = (const char *)v3();
      if (v4)
      {
        objc_super v5 = (char *)v4;
        v6 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, 0x8000100u);
        free(v5);
        goto LABEL_7;
      }
      break;
    }
  }
  v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

@end