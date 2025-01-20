@interface OITSUMutablePointerSet
+ (Class)privateMutableClass;
+ (Class)privateNonMutableClass;
- (OITSUMutablePointerSet)init;
- (OITSUMutablePointerSet)initWithCFSet:(__CFSet *)a3;
- (OITSUMutablePointerSet)initWithCapacity:(unint64_t)a3;
- (OITSUMutablePointerSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)allObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)setByAddingObject:(id)a3;
- (id)setByAddingObjectsFromArray:(id)a3;
- (id)setByAddingObjectsFromSet:(id)a3;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)getObjects:(id *)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
@end

@implementation OITSUMutablePointerSet

+ (Class)privateNonMutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)privateMutableClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  mSet = self->mSet;
  if (mSet)
  {
    CFRelease(mSet);
    self->mSet = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)OITSUMutablePointerSet;
  [(OITSUMutablePointerSet *)&v4 dealloc];
}

- (OITSUMutablePointerSet)init
{
  if ([(OITSUMutablePointerSet *)self isMemberOfClass:objc_opt_class()])
  {
    return [(OITSUMutablePointerSet *)self initWithCapacity:0];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)OITSUMutablePointerSet;
    return [(OITSUMutablePointerSet *)&v4 init];
  }
}

- (OITSUMutablePointerSet)initWithCapacity:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OITSUMutablePointerSet;
  objc_super v4 = [(OITSUMutablePointerSet *)&v6 init];
  if (v4) {
    v4->mSet = CFSetCreateMutable(0, a3, 0);
  }
  return v4;
}

- (OITSUMutablePointerSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  objc_super v6 = [(OITSUMutablePointerSet *)self initWithCapacity:a4];
  if (v6 && v4)
  {
    do
    {
      v7 = *a3++;
      CFSetAddValue(v6->mSet, v7);
      --v4;
    }
    while (v4);
  }
  return v6;
}

- (OITSUMutablePointerSet)initWithCFSet:(__CFSet *)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)OITSUMutablePointerSet;
    v5 = [(OITSUMutablePointerSet *)&v7 init];
    if (v5) {
      v5->mSet = CFSetCreateMutableCopy(0, 0, a3);
    }
    return v5;
  }
  else
  {
    return -[OITSUMutablePointerSet initWithCapacity:](self, "initWithCapacity:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)[(id)objc_opt_class() privateNonMutableClass]);
  mSet = self->mSet;
  return (id)[v4 initWithCFSet:mSet];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)[(id)objc_opt_class() privateMutableClass]);
  mSet = self->mSet;
  return (id)[v4 initWithCFSet:mSet];
}

- (unint64_t)count
{
  return CFSetGetCount(self->mSet);
}

- (id)member:(id)a3
{
  value = 0;
  if (!a3) {
    return 0;
  }
  if (CFSetGetValueIfPresent(self->mSet, a3, (const void **)&value)) {
    return value;
  }
  return 0;
}

- (id)objectEnumerator
{
  v2 = [[OITSUCFSetEnumerator alloc] initWithCFSet:self->mSet];
  return v2;
}

- (void)addObject:(id)a3
{
}

- (void)removeObject:(id)a3
{
}

- (void)removeAllObjects
{
}

- (void)getObjects:(id *)a3
{
  CFIndex Count = CFSetGetCount(self->mSet);
  if (a3 && Count)
  {
    mSet = self->mSet;
    CFSetGetValues(mSet, (const void **)a3);
  }
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
  objc_super v6 = (const void **)((char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v3 >= 0x41)
  {
    objc_super v6 = (const void **)malloc_type_malloc(8 * v3, 0x80040B8603338uLL);
    if (!v6) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF570], @"*** attempt to create a temporary id buffer of length (%lu) failed", v4);
    }
  }
  [(OITSUMutablePointerSet *)self getObjects:v6];
  CFArrayRef v7 = CFArrayCreate(0, v6, v4, 0);
  if (v4 >= 0x41) {
    free(v6);
  }
  return (id)(id)CFMakeCollectable(v7);
}

- (id)setByAddingObject:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  unint64_t v5 = [(OITSUMutablePointerSet *)self count];
  unint64_t v6 = v5;
  unint64_t v7 = v5 + 1;
  uint64_t v8 = 1;
  if (v5 + 1 < 0x41) {
    uint64_t v8 = v5 + 1;
  }
  v9 = (char *)v12 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7 >= 0x41)
  {
    v9 = (char *)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    if (!v9) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF570], @"*** attempt to create a temporary id buffer of length (%lu) failed", v7);
    }
  }
  [(OITSUMutablePointerSet *)self getObjects:v9];
  *(void *)&v9[8 * v6] = a3;
  v10 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "privateNonMutableClass"), "setWithObjects:count:", v9, v7);
  if (v7 >= 0x41) {
    free(v9);
  }
  return v10;
}

- (id)setByAddingObjectsFromSet:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(OITSUMutablePointerSet *)self count];
  uint64_t v6 = [a3 count];
  unint64_t v7 = v6 + v5;
  if (v6 + v5 >= 0x41) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v6 + v5;
  }
  v9 = (char *)&v17 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7 >= 0x41)
  {
    v9 = (char *)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    if (!v9) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF570], @"*** attempt to create a temporary id buffer of length (%lu) failed", v7);
    }
  }
  [(OITSUMutablePointerSet *)self getObjects:v9];
  if (objc_opt_respondsToSelector())
  {
    [a3 getObjects:&v9[8 * v5]];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    long long v17 = 0u;
    uint64_t v10 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v12 = &v9[8 * v5];
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(a3);
          }
          *(void *)v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v12 += 8;
        }
        uint64_t v11 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  v15 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "privateNonMutableClass"), "setWithObjects:count:", v9, v7);
  if (v7 >= 0x41) {
    free(v9);
  }
  return v15;
}

- (id)setByAddingObjectsFromArray:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  unint64_t v5 = [(OITSUMutablePointerSet *)self count];
  uint64_t v6 = [a3 count];
  unint64_t v7 = v6 + v5;
  MEMORY[0x270FA5388](v6);
  v9 = (char *)v12 - v8;
  if (v6 + v5 >= 0x41)
  {
    v9 = (char *)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    if (!v9) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF570], @"*** attempt to create a temporary id buffer of length (%lu) failed", v7);
    }
  }
  [(OITSUMutablePointerSet *)self getObjects:v9];
  objc_msgSend(a3, "getObjects:range:", &v9[8 * v5], 0, v6);
  uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "privateNonMutableClass"), "setWithObjects:count:", v9, v7);
  if (v7 >= 0x41) {
    free(v9);
  }
  return v10;
}

@end