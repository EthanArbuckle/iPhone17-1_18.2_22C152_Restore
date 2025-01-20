@interface TSUPointerSet
+ (Class)privateMutableClass;
+ (Class)privateNonMutableClass;
- (TSUPointerSet)initWithCFSet:(__CFSet *)a3;
- (TSUPointerSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)allObjects;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)setByAddingObject:(id)a3;
- (id)setByAddingObjectsFromArray:(id)a3;
- (id)setByAddingObjectsFromSet:(id)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)getObjects:(id *)a3;
@end

@implementation TSUPointerSet

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
  v4.super_class = (Class)TSUPointerSet;
  [(TSUPointerSet *)&v4 dealloc];
}

- (TSUPointerSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSUPointerSet;
  v6 = [(TSUPointerSet *)&v9 init];
  v7 = v6;
  if (a4 && v6) {
    v6->mSet = CFSetCreate(0, a3, a4, 0);
  }
  return v7;
}

- (TSUPointerSet)initWithCFSet:(__CFSet *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSUPointerSet;
  objc_super v4 = [(TSUPointerSet *)&v7 init];
  v5 = v4;
  if (a3 && v4) {
    v4->mSet = CFSetCreateCopy(0, a3);
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)[(id)objc_opt_class() privateMutableClass]);
  mSet = self->mSet;
  return (id)[v4 initWithCFSet:mSet];
}

- (unint64_t)count
{
  unint64_t result = (unint64_t)self->mSet;
  if (result) {
    return CFSetGetCount((CFSetRef)result);
  }
  return result;
}

- (id)member:(id)a3
{
  id result = 0;
  if (a3)
  {
    mSet = self->mSet;
    if (mSet)
    {
      value = 0;
      if (CFSetGetValueIfPresent(mSet, a3, (const void **)&value)) {
        return value;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (id)objectEnumerator
{
  if (!self->mSet) {
    return 0;
  }
  v2 = [[TSUCFSetEnumerator alloc] initWithCFSet:self->mSet];
  return v2;
}

- (void)getObjects:(id *)a3
{
  mSet = self->mSet;
  if (mSet)
  {
    CFIndex Count = CFSetGetCount(mSet);
    if (a3)
    {
      if (Count)
      {
        objc_super v7 = self->mSet;
        CFSetGetValues(v7, (const void **)a3);
      }
    }
  }
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
    v6 = (const void **)((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v3 >= 0x41)
    {
      v6 = (const void **)malloc_type_malloc(8 * v3, 0x80040B8603338uLL);
      if (!v6) {
        objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF570], @"*** attempt to create a temporary id buffer of length (%lu) failed", v4);
      }
    }
    [(TSUPointerSet *)self getObjects:v6];
    CFArrayRef v7 = CFArrayCreate(0, v6, v4, 0);
    if (v4 >= 0x41) {
      free(v6);
    }
    return (id)(id)CFMakeCollectable(v7);
  }
  else
  {
    objc_super v9 = (void *)MEMORY[0x263EFF8C0];
    return (id)[v9 array];
  }
}

- (id)setByAddingObject:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  unint64_t v5 = [(TSUPointerSet *)self count];
  unint64_t v6 = v5;
  unint64_t v7 = v5 + 1;
  uint64_t v8 = 1;
  if (v5 + 1 < 0x41) {
    uint64_t v8 = v5 + 1;
  }
  objc_super v9 = (char *)v12 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7 >= 0x41)
  {
    objc_super v9 = (char *)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    if (!v9) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF570], @"*** attempt to create a temporary id buffer of length (%lu) failed", v7);
    }
  }
  [(TSUPointerSet *)self getObjects:v9];
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
  unint64_t v5 = [(TSUPointerSet *)self count];
  uint64_t v6 = [a3 count];
  unint64_t v7 = v6 + v5;
  if (v6 + v5 >= 0x41) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v6 + v5;
  }
  objc_super v9 = (char *)&v17 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7 >= 0x41)
  {
    objc_super v9 = (char *)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    if (!v9) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF570], @"*** attempt to create a temporary id buffer of length (%lu) failed", v7);
    }
  }
  [(TSUPointerSet *)self getObjects:v9];
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
  unint64_t v5 = [(TSUPointerSet *)self count];
  uint64_t v6 = [a3 count];
  unint64_t v7 = v6 + v5;
  MEMORY[0x270FA5388]();
  objc_super v9 = (char *)v12 - v8;
  if (v6 + v5 >= 0x41)
  {
    objc_super v9 = (char *)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    if (!v9) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF570], @"*** attempt to create a temporary id buffer of length (%lu) failed", v7);
    }
  }
  [(TSUPointerSet *)self getObjects:v9];
  objc_msgSend(a3, "getObjects:range:", &v9[8 * v5], 0, v6);
  uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "privateNonMutableClass"), "setWithObjects:count:", v9, v7);
  if (v7 >= 0x41) {
    free(v9);
  }
  return v10;
}

@end