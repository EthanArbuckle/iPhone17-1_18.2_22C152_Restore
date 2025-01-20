@interface TSURetainedPointerSet
+ (Class)privateMutableClass;
+ (Class)privateNonMutableClass;
- (TSURetainedPointerSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)allObjects;
@end

@implementation TSURetainedPointerSet

+ (Class)privateNonMutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)privateMutableClass
{
  return (Class)objc_opt_class();
}

- (TSURetainedPointerSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TSURetainedPointerSet;
  v6 = [(TSURetainedPointerSet *)&v10 init];
  if (v6)
  {
    v9.version = 0;
    *(_OWORD *)&v9.retain = *(_OWORD *)(MEMORY[0x263EFFFA0] + 8);
    v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x263EFFFA0] + 24);
    v9.equal = 0;
    v9.hash = 0;
    v9.copyDescription = v7;
    v6->super.mSet = CFSetCreate(0, a3, a4, &v9);
  }
  return v6;
}

- (id)allObjects
{
  v10[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(TSUPointerSet *)self count];
  if (v3)
  {
    unint64_t v4 = v3;
    if (v3 >= 0x41) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v3;
    }
    v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v3 >= 0x41)
    {
      v6 = (char *)malloc_type_malloc(8 * v3, 0x80040B8603338uLL);
      if (!v6) {
        objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF570], @"*** attempt to create a temporary id buffer of length (%lu) failed", v4);
      }
    }
    [(TSUPointerSet *)self getObjects:v6];
    v7 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:v4];
    if (v4 >= 0x41) {
      free(v6);
    }
    return v7;
  }
  else
  {
    CFSetCallBacks v9 = (void *)MEMORY[0x263EFF8C0];
    return (id)[v9 array];
  }
}

@end