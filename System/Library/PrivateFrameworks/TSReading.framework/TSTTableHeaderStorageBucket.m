@interface TSTTableHeaderStorageBucket
- (TSTTableHeaderStorageBucket)initWithContext:(id)a3;
- (double)horizontalScaleFactor;
- (id)headerForKey:(unsigned int)a3 willModify:(BOOL)a4;
- (id)headerForKey:(unsigned int)a3 willModify:(BOOL)a4 createIfNotThere:(BOOL)a5;
- (id)packageLocator;
- (int64_t)count;
- (unint64_t)flushableSize;
- (unsigned)lowerBound:(unsigned int)a3;
- (unsigned)maxKey;
- (unsigned)minKey;
- (unsigned)upperBound:(unsigned int)a3;
- (void)applyFunction:(void *)a3 withState:(void *)a4 willModify:(BOOL)a5;
- (void)dealloc;
- (void)makeHeadersPerformSelector:(SEL)a3 willModify:(BOOL)a4;
- (void)removeAllHeaders;
- (void)removeHeaderForKey:(unsigned int)a3;
- (void)setHeader:(id)a3 forKey:(unsigned int)a4;
- (void)setHorizontalScaleFactor:(double)a3;
- (void)shiftKeysAtIndex:(unsigned int)a3 amount:(int)a4;
@end

@implementation TSTTableHeaderStorageBucket

- (TSTTableHeaderStorageBucket)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSTTableHeaderStorageBucket;
  if ([(TSPObject *)&v4 initWithContext:a3]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  mMap = (void **)self->mMap;
  if (mMap)
  {
    std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::destroy((uint64_t)self->mMap, mMap[1]);
    MEMORY[0x223CB8F20](mMap, 0x1020C4062D53EE8);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSTTableHeaderStorageBucket;
  [(TSTTableHeaderStorageBucket *)&v4 dealloc];
}

- (unint64_t)flushableSize
{
  v3 = (objc_class *)objc_opt_class();
  return *((void *)self->mMap + 2) * class_getInstanceSize(v3);
}

- (id)packageLocator
{
  return @"Tables/HeaderStorageBucket";
}

- (id)headerForKey:(unsigned int)a3 willModify:(BOOL)a4
{
  if (a4) {
    [(TSPObject *)self willModify];
  }
  mMap = self->mMap;
  v9 = (char *)mMap[1];
  v7 = (char *)(mMap + 1);
  v8 = v9;
  if (!v9) {
    return 0;
  }
  v10 = v7;
  do
  {
    unsigned int v11 = *((_DWORD *)v8 + 8);
    BOOL v12 = v11 >= a3;
    if (v11 >= a3) {
      v13 = (char **)v8;
    }
    else {
      v13 = (char **)(v8 + 8);
    }
    if (v12) {
      v10 = v8;
    }
    v8 = *v13;
  }
  while (*v13);
  if (v10 != v7 && *((_DWORD *)v10 + 8) <= a3) {
    return (id)*((void *)v10 + 5);
  }
  else {
    return 0;
  }
}

- (id)headerForKey:(unsigned int)a3 willModify:(BOOL)a4 createIfNotThere:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4) {
    [(TSPObject *)self willModify];
  }
  mMap = self->mMap;
  unsigned int v11 = (char *)mMap[1];
  v9 = (char *)(mMap + 1);
  v10 = v11;
  if (!v11) {
    goto LABEL_14;
  }
  BOOL v12 = v9;
  do
  {
    unsigned int v13 = *((_DWORD *)v10 + 8);
    BOOL v14 = v13 >= a3;
    if (v13 >= a3) {
      v15 = (char **)v10;
    }
    else {
      v15 = (char **)(v10 + 8);
    }
    if (v14) {
      BOOL v12 = v10;
    }
    v10 = *v15;
  }
  while (*v15);
  if (v12 != v9 && *((_DWORD *)v12 + 8) <= a3)
  {
    v16 = (TSTTableHeaderInfo *)*((void *)v12 + 5);
    if (v16) {
      return v16;
    }
  }
  else
  {
LABEL_14:
    v16 = 0;
  }
  if (v5)
  {
    v16 = objc_alloc_init(TSTTableHeaderInfo);
    v17 = (uint64_t **)self->mMap;
    v18 = v16;
    unsigned int v21 = a3;
    v22 = v16;
    v19 = v16;
    std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,SFUtility::ObjcSharedPtr<NSObject>>>(v17, &v21, (uint64_t)&v21);
  }
  return v16;
}

- (void)setHeader:(id)a3 forKey:(unsigned int)a4
{
  [(TSPObject *)self willModify];
  mMap = (uint64_t **)self->mMap;
  if (!a3)
  {
    v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void p_SetHeaderForKey(TSTSortedIntKeyMap *, UInt32, TSTTableHeaderInfo *)");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableHeaderStorageBucket.mm"), 186, @"Tried to set nil header for key.");
  }
  id v10 = a3;
  unsigned int v12 = a4;
  id v13 = a3;
  id v11 = a3;
  std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,SFUtility::ObjcSharedPtr<NSObject>>>(mMap, &v12, (uint64_t)&v12);
}

- (void)removeHeaderForKey:(unsigned int)a3
{
  unsigned int v4 = a3;
  [(TSPObject *)self willModify];
  std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__erase_unique<unsigned int>((uint64_t)self->mMap, &v4);
}

- (void)removeAllHeaders
{
  [(TSPObject *)self willModify];
  mMap = (char *)self->mMap;
  std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::destroy((uint64_t)mMap, *((void **)mMap + 1));
  *(void *)mMap = mMap + 8;
  *((void *)mMap + 2) = 0;
  *((void *)mMap + 1) = 0;
}

- (void)makeHeadersPerformSelector:(SEL)a3 willModify:(BOOL)a4
{
  if (a4) {
    [(TSPObject *)self willModify];
  }
  mMap = self->mMap;
  v7 = (void *)*mMap;
  if ((void *)*mMap != mMap + 1)
  {
    do
    {
      [(id)v7[5] performSelector:a3];
      v8 = (void *)v7[1];
      if (v8)
      {
        do
        {
          uint64_t v9 = v8;
          v8 = (void *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          uint64_t v9 = (void *)v7[2];
          BOOL v10 = *v9 == (void)v7;
          v7 = v9;
        }
        while (!v10);
      }
      v7 = v9;
    }
    while (v9 != (void *)self->mMap + 1);
  }
}

- (void)applyFunction:(void *)a3 withState:(void *)a4 willModify:(BOOL)a5
{
  if (a5) {
    [(TSPObject *)self willModify];
  }
  mMap = self->mMap;
  uint64_t v9 = (void *)*mMap;
  if ((void *)*mMap != mMap + 1)
  {
    do
    {
      ((void (*)(void, void, void *))a3)(*((unsigned int *)v9 + 8), v9[5], a4);
      BOOL v10 = (void *)v9[1];
      if (v10)
      {
        do
        {
          id v11 = v10;
          BOOL v10 = (void *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          id v11 = (void *)v9[2];
          BOOL v12 = *v11 == (void)v9;
          uint64_t v9 = v11;
        }
        while (!v12);
      }
      uint64_t v9 = v11;
    }
    while (v11 != (void *)self->mMap + 1);
  }
}

- (void)shiftKeysAtIndex:(unsigned int)a3 amount:(int)a4
{
  unsigned int v5 = a3;
  if ((int)(a4 + a3) < 0)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSTTableHeaderStorageBucket shiftKeysAtIndex:amount:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableHeaderStorageBucket.mm"), 266, @"Can't shift indexes below zero!");
  }
  [(TSPObject *)self willModify];
  unsigned int v9 = [(TSTTableHeaderStorageBucket *)self maxKey];
  unsigned int v10 = v9;
  if (a4 < 0)
  {
    unsigned int v36 = v5;
    if (v9 >= v5)
    {
      do
      {
        unsigned int v23 = v5 + a4;
        unsigned int v35 = v5 + a4;
        mMap = self->mMap;
        v25 = (char *)mMap[1];
        if (!v25) {
          goto LABEL_36;
        }
        v26 = (char *)(mMap + 1);
        do
        {
          unsigned int v27 = *((_DWORD *)v25 + 8);
          BOOL v28 = v27 >= v5;
          if (v27 >= v5) {
            v29 = (char **)v25;
          }
          else {
            v29 = (char **)(v25 + 8);
          }
          if (v28) {
            v26 = v25;
          }
          v25 = *v29;
        }
        while (*v29);
        if (v26 != (char *)(mMap + 1) && *((_DWORD *)v26 + 8) <= v5 && (v30 = (void *)*((void *)v26 + 5)) != 0)
        {
          id v31 = v30;
          unsigned int v37 = v23;
          id v38 = v30;
          id v32 = v30;
          std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,SFUtility::ObjcSharedPtr<NSObject>>>((uint64_t **)mMap, &v37, (uint64_t)&v37);

          v33 = self->mMap;
          v34 = &v36;
        }
        else
        {
LABEL_36:
          v34 = &v35;
          v33 = self->mMap;
        }
        std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__erase_unique<unsigned int>((uint64_t)v33, v34);
        unsigned int v5 = v36 + 1;
        unsigned int v36 = v5;
      }
      while (v5 <= v10);
    }
  }
  else if ((int)v9 >= (int)v5)
  {
    do
    {
      unsigned int v36 = v10 + a4;
      id v11 = self->mMap;
      BOOL v12 = (char *)v11[1];
      if (!v12) {
        goto LABEL_18;
      }
      id v13 = (char *)(v11 + 1);
      do
      {
        unsigned int v14 = *((_DWORD *)v12 + 8);
        BOOL v15 = v14 >= v10;
        if (v14 >= v10) {
          v16 = (char **)v12;
        }
        else {
          v16 = (char **)(v12 + 8);
        }
        if (v15) {
          id v13 = v12;
        }
        BOOL v12 = *v16;
      }
      while (*v16);
      if (v13 != (char *)(v11 + 1) && *((_DWORD *)v13 + 8) <= v10 && (v17 = (void *)*((void *)v13 + 5)) != 0)
      {
        id v18 = v17;
        unsigned int v37 = v10 + a4;
        id v38 = v17;
        id v19 = v17;
        std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,SFUtility::ObjcSharedPtr<NSObject>>>((uint64_t **)v11, &v37, (uint64_t)&v37);

        v20 = self->mMap;
        unsigned int v37 = v10;
        unsigned int v21 = &v37;
      }
      else
      {
LABEL_18:
        unsigned int v21 = &v36;
        v20 = self->mMap;
      }
      std::__tree<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,SFUtility::ObjcSharedPtr<NSObject>>>>::__erase_unique<unsigned int>((uint64_t)v20, v21);
    }
    while ((int)v10-- > (int)v5);
  }
}

- (int64_t)count
{
  return *((void *)self->mMap + 2);
}

- (unsigned)minKey
{
  mMap = self->mMap;
  unsigned int v5 = (void *)*mMap;
  v3 = mMap + 1;
  unsigned int v4 = v5;
  if (v5 == v3) {
    return 0;
  }
  unsigned int result = *((_DWORD *)v4 + 8);
  do
  {
    if (result >= *((_DWORD *)v4 + 8)) {
      unsigned int result = *((_DWORD *)v4 + 8);
    }
    v7 = (void *)v4[1];
    if (v7)
    {
      do
      {
        uint64_t v8 = v7;
        v7 = (void *)*v7;
      }
      while (v7);
    }
    else
    {
      do
      {
        uint64_t v8 = (void *)v4[2];
        BOOL v9 = *v8 == (void)v4;
        unsigned int v4 = v8;
      }
      while (!v9);
    }
    unsigned int v4 = v8;
  }
  while (v8 != v3);
  return result;
}

- (unsigned)maxKey
{
  mMap = self->mMap;
  unsigned int v5 = (void *)*mMap;
  v3 = mMap + 1;
  unsigned int v4 = v5;
  if (v5 == v3) {
    return 0;
  }
  unsigned int result = *((_DWORD *)v4 + 8);
  do
  {
    if (result <= *((_DWORD *)v4 + 8)) {
      unsigned int result = *((_DWORD *)v4 + 8);
    }
    v7 = (void *)v4[1];
    if (v7)
    {
      do
      {
        uint64_t v8 = v7;
        v7 = (void *)*v7;
      }
      while (v7);
    }
    else
    {
      do
      {
        uint64_t v8 = (void *)v4[2];
        BOOL v9 = *v8 == (void)v4;
        unsigned int v4 = v8;
      }
      while (!v9);
    }
    unsigned int v4 = v8;
  }
  while (v8 != v3);
  return result;
}

- (unsigned)upperBound:(unsigned int)a3
{
  mMap = self->mMap;
  v6 = (char *)mMap[1];
  unsigned int v4 = (char *)(mMap + 1);
  unsigned int v5 = v6;
  if (v6)
  {
    do
    {
      unsigned int v7 = *((_DWORD *)v5 + 8);
      BOOL v8 = v7 > a3;
      if (v7 <= a3) {
        BOOL v9 = (char **)(v5 + 8);
      }
      else {
        BOOL v9 = (char **)v5;
      }
      if (v8) {
        unsigned int v4 = v5;
      }
      unsigned int v5 = *v9;
    }
    while (*v9);
  }
  return *((_DWORD *)v4 + 8);
}

- (unsigned)lowerBound:(unsigned int)a3
{
  mMap = self->mMap;
  v6 = (char *)mMap[1];
  unsigned int v4 = (char *)(mMap + 1);
  unsigned int v5 = v6;
  if (v6)
  {
    do
    {
      unsigned int v7 = *((_DWORD *)v5 + 8);
      BOOL v8 = v7 >= a3;
      if (v7 >= a3) {
        BOOL v9 = (char **)v5;
      }
      else {
        BOOL v9 = (char **)(v5 + 8);
      }
      if (v8) {
        unsigned int v4 = v5;
      }
      unsigned int v5 = *v9;
    }
    while (*v9);
  }
  return *((_DWORD *)v4 + 8);
}

- (double)horizontalScaleFactor
{
  return self->mHorizontalScaleFactor;
}

- (void)setHorizontalScaleFactor:(double)a3
{
  self->mHorizontalScaleFactor = a3;
}

@end