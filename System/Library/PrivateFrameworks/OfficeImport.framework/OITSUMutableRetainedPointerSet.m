@interface OITSUMutableRetainedPointerSet
+ (Class)privateMutableClass;
+ (Class)privateNonMutableClass;
- (OITSUMutableRetainedPointerSet)init;
- (OITSUMutableRetainedPointerSet)initWithCapacity:(unint64_t)a3;
- (id)allObjects;
@end

@implementation OITSUMutableRetainedPointerSet

+ (Class)privateNonMutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)privateMutableClass
{
  return (Class)objc_opt_class();
}

- (OITSUMutableRetainedPointerSet)init
{
  if ([(OITSUMutableRetainedPointerSet *)self isMemberOfClass:objc_opt_class()])
  {
    return [(OITSUMutableRetainedPointerSet *)self initWithCapacity:0];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)OITSUMutableRetainedPointerSet;
    return [(OITSUMutablePointerSet *)&v4 init];
  }
}

- (OITSUMutableRetainedPointerSet)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OITSUMutableRetainedPointerSet;
  objc_super v4 = [(OITSUMutablePointerSet *)&v8 init];
  if (v4)
  {
    v7.version = 0;
    *(_OWORD *)&v7.retain = *(_OWORD *)(MEMORY[0x263EFFFA0] + 8);
    v5 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x263EFFFA0] + 24);
    v7.equal = 0;
    v7.hash = 0;
    v7.copyDescription = v5;
    v4->super.mSet = CFSetCreateMutable(0, a3, &v7);
  }
  return v4;
}

- (id)allObjects
{
  v9[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(OITSUMutablePointerSet *)self count];
  unint64_t v4 = v3;
  if (v3 >= 0x41) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v3;
  }
  v6 = (char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 >= 0x41)
  {
    v6 = (char *)malloc_type_malloc(8 * v3, 0x80040B8603338uLL);
    if (!v6) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF570], @"*** attempt to create a temporary id buffer of length (%lu) failed", v4);
    }
  }
  [(OITSUMutablePointerSet *)self getObjects:v6];
  CFSetCallBacks v7 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:v4];
  if (v4 >= 0x41) {
    free(v6);
  }
  return v7;
}

@end