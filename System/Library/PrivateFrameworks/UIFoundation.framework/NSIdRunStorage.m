@interface NSIdRunStorage
+ (void)initialize;
- (void)_allocData:(unint64_t)a3;
- (void)_reallocData:(unint64_t)a3;
- (void)dealloc;
@end

@implementation NSIdRunStorage

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (void)_allocData:(unint64_t)a3
{
  self->super._runs = (_NSRunBlock *)NSAllocateCollectable(a3, 1uLL);
}

- (void)_reallocData:(unint64_t)a3
{
  self->super._runs = (_NSRunBlock *)NSReallocateCollectable(self->super._runs, a3, 1uLL);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NSIdRunStorage;
  [(NSRunStorage *)&v2 dealloc];
}

@end