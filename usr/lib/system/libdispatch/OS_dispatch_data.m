@interface OS_dispatch_data
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_bytesAreVM;
- (BOOL)_isCompact;
- (NSString)debugDescription;
- (OS_dispatch_data)init;
- (OS_dispatch_data)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 freeWhenDone:(BOOL)a6 bytesAreVM:(BOOL)a7;
- (uint64_t)debugDescription;
- (unint64_t)length;
- (void)_getContext;
- (void)_setContext:(void *)a3;
- (void)_setFinalizer:(void *)a3;
- (void)_setTargetQueue:(id)a3;
- (void)dealloc;
@end

@implementation OS_dispatch_data

+ (id)allocWithZone:(_NSZone *)a3
{
  return _dispatch_objc_alloc((objc_class *)a1, 64);
}

- (OS_dispatch_data)init
{
  return [(OS_dispatch_data *)self initWithBytes:0 length:0 copy:0 freeWhenDone:0 bytesAreVM:0];
}

- (OS_dispatch_data)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 freeWhenDone:(BOOL)a6 bytesAreVM:(BOOL)a7
{
  if (a5)
  {
    dispatch_block_t v9 = 0;
  }
  else
  {
    if (a6)
    {
      if (a7) {
        v10 = &_dispatch_data_destructor_vm_deallocate;
      }
      else {
        v10 = &_dispatch_data_destructor_free;
      }
    }
    else
    {
      v10 = (const dispatch_block_t *)&_dispatch_data_destructor_none;
    }
    dispatch_block_t v9 = *v10;
  }
  _dispatch_data_init_with_bytes(self, (mach_vm_address_t)a3, a4, v9);
  return self;
}

- (void)dealloc
{
  _dispatch_data_dispose(self);
  isa = self[1].super.isa;
  if (self[3].super.isa) {
    v4 = (void (__cdecl *)(void *))self[3].super.isa;
  }
  else {
    v4 = 0;
  }
  Class v5 = self[2].super.isa;
  v7.receiver = self;
  v7.super_class = (Class)OS_dispatch_data;
  [(OS_dispatch_data *)&v7 dealloc];
  if (v4 && v5)
  {
    if (!isa) {
      isa = dispatch_get_global_queue(0, 0);
    }
    dispatch_channel_async_f(isa, v5, v4);
  }
  if (isa) {
    _os_object_release_internal(isa, v6);
  }
}

- (BOOL)_bytesAreVM
{
  return self[5].super.isa == (Class)&__block_literal_global_4134;
}

- (void)_setContext:(void *)a3
{
  self[2].super.isa = (Class)a3;
}

- (void)_getContext
{
  return self[2].super.isa;
}

- (void)_setFinalizer:(void *)a3
{
  if (a3) {
    v3 = (objc_class *)a3;
  }
  else {
    v3 = 0;
  }
  self[3].super.isa = v3;
}

- (void)_setTargetQueue:(id)a3
{
}

- (NSString)debugDescription
{
  result = (NSString *)objc_lookUpClass("NSString");
  if (result)
  {
    [(OS_dispatch_data *)self debugDescription];
    return v4;
  }
  return result;
}

- (unint64_t)length
{
  return (unint64_t)self[6].super.isa;
}

- (BOOL)_isCompact
{
  if (self[6].super.isa)
  {
    Class isa = self[7].super.isa;
    if (isa == (Class)1)
    {
      v6 = self + 8;
      self = (OS_dispatch_data *)self[8].super.isa;
      Class v3 = v6[1].super.isa;
      if (!self[7].super.isa) {
        goto LABEL_4;
      }
    }
    else
    {
      Class v3 = 0;
      if (!isa)
      {
LABEL_4:
        v4 = (char *)self[4].super.isa + (unint64_t)v3;
        return v4 != 0;
      }
    }
    Class v7 = self[4].super.isa;
    v4 = (char *)v3 + (void)v7;
    if (!v7) {
      v4 = 0;
    }
    return v4 != 0;
  }
  return 1;
}

- (uint64_t)debugDescription
{
  uint64_t v8 = *MEMORY[0x1E4F14BF8];
  _dispatch_data_debug((uint64_t)a1, __str, 0x800uLL);
  uint64_t result = [a2 stringWithUTF8String:"<%s: %s>"];
  if (result) {
    uint64_t result = [a2 stringWithFormat:result, object_getClassName(a1), __str];
  }
  *a3 = result;
  return result;
}

@end