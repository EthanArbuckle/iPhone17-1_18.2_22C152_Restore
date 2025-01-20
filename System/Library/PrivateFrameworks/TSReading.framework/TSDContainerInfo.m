@interface TSDContainerInfo
- (BOOL)isAnchoredToText;
- (BOOL)isAttachedToBodyText;
- (BOOL)isFloatingAboveText;
- (BOOL)isInlineWithText;
- (BOOL)isThemeContent;
- (Class)layoutClass;
- (Class)repClass;
- (TSDContainerInfo)initWithContext:(id)a3 geometry:(id)a4;
- (TSDContainerInfo)parentInfo;
- (TSDInfoGeometry)geometry;
- (TSDOwningAttachment)owningAttachment;
- (TSDOwningAttachment)owningAttachmentNoRecurse;
- (id)childInfos;
- (id)copyWithContext:(id)a3;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (int64_t)mixingTypeWithObject:(id)a3;
- (void)addChildInfo:(id)a3;
- (void)clearBackPointerToParentInfoIfNeeded:(id)a3;
- (void)dealloc;
- (void)insertChildInfo:(id)a3 above:(id)a4;
- (void)insertChildInfo:(id)a3 atIndex:(unint64_t)a4;
- (void)insertChildInfo:(id)a3 below:(id)a4;
- (void)moveChildren:(id)a3 toIndexes:(id)a4;
- (void)removeChildInfo:(id)a3;
- (void)replaceChildInfo:(id)a3 with:(id)a4;
- (void)setChildInfos:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setOwningAttachment:(id)a3;
- (void)setParentInfo:(id)a3;
@end

@implementation TSDContainerInfo

- (TSDContainerInfo)initWithContext:(id)a3 geometry:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSDContainerInfo;
  v5 = [(TSPObject *)&v7 initWithContext:a3];
  if (v5) {
    v5->mGeometry = (TSDInfoGeometry *)[a4 copy];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  mChildInfos = self->mChildInfos;
  uint64_t v4 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(mChildInfos);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) clearBackPointerToParentInfoIfNeeded:self];
      }
      uint64_t v5 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)TSDContainerInfo;
  [(TSDContainerInfo *)&v8 dealloc];
}

- (void)clearBackPointerToParentInfoIfNeeded:(id)a3
{
  if (self->mParentInfo == a3) {
    self->mParentInfo = 0;
  }
}

- (void)setGeometry:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDContainerInfo setGeometry:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"), 59, @"invalid nil value for '%s'", "newGeometry");
  }
  if (([a3 isEqual:self->mGeometry] & 1) == 0)
  {
    [(TSPObject *)self willModify];

    self->mGeometry = (TSDInfoGeometry *)a3;
  }
}

- (TSDOwningAttachment)owningAttachment
{
  return 0;
}

- (void)setOwningAttachment:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDContainerInfo setOwningAttachment:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:75 description:@"TSDContainerInfo cannot be owned by an attachment because it is not a subclass of TSDDrawableInfo"];
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return 0;
}

- (BOOL)isFloatingAboveText
{
  return 0;
}

- (BOOL)isAnchoredToText
{
  return 0;
}

- (BOOL)isInlineWithText
{
  return 0;
}

- (BOOL)isAttachedToBodyText
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isThemeContent
{
  v2 = [(TSDContainerInfo *)self parentInfo];

  return [(TSDContainerInfo *)v2 isThemeContent];
}

- (id)copyWithContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(TSDContainerInfo *)self zone];
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", v5), "initWithContext:", a3);
  if (v6)
  {
    *(void *)(v6 + 48) = [(TSDInfoGeometry *)self->mGeometry copyWithZone:v5];
    if ([(NSMutableArray *)self->mChildInfos count])
    {
      *(void *)(v6 + 64) = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF980], "allocWithZone:", v5), "initWithCapacity:", -[NSMutableArray count](self->mChildInfos, "count"));
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      mChildInfos = self->mChildInfos;
      uint64_t v8 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(mChildInfos);
            }
            long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v11) copyWithContext:a3];
            [v12 setParentInfo:v6];
            [*(id *)(v6 + 64) addObject:v12];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
    }
  }
  return (id)v6;
}

- (id)childInfos
{
  return self->mChildInfos;
}

- (void)setChildInfos:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  mChildInfos = self->mChildInfos;
  if (mChildInfos != a3 && (-[NSMutableArray isEqual:](mChildInfos, "isEqual:") & 1) == 0)
  {
    [(TSPObject *)self willModify];
    if (a3) {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:a3];
    }
    else {
      uint64_t v6 = 0;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    objc_super v7 = self->mChildInfos;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (([v6 containsObject:v12] & 1) == 0) {
            [v12 setParentInfo:0];
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }

    if (self->mChildInfos) {
      v13 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:self->mChildInfos];
    }
    else {
      v13 = 0;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = [a3 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(a3);
          }
          v18 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          if (([v13 containsObject:v18] & 1) == 0)
          {
            [v18 parentInfo];
            [(id)TSUProtocolCast() removeChildInfo:v18];
            [v18 setParentInfo:self];
          }
        }
        uint64_t v15 = [a3 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }

    uint64_t v19 = (NSMutableArray *)[a3 mutableCopy];
    self->mChildInfos = v19;
  }
}

- (void)addChildInfo:(id)a3
{
  mChildInfos = self->mChildInfos;
  if (mChildInfos) {
    uint64_t v6 = [(NSMutableArray *)mChildInfos count];
  }
  else {
    uint64_t v6 = 0;
  }

  [(TSDContainerInfo *)self insertChildInfo:a3 atIndex:v6];
}

- (void)insertChildInfo:(id)a3 atIndex:(unint64_t)a4
{
  if (a3)
  {
    [(TSPObject *)self willModify];
    [a3 parentInfo];
    uint64_t v6 = (void *)TSUProtocolCast();
    if (v6)
    {
      id v7 = a3;
      [v6 removeChildInfo:a3];
    }
    mChildInfos = self->mChildInfos;
    if (!mChildInfos)
    {
      mChildInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      self->mChildInfos = mChildInfos;
    }
    [(NSMutableArray *)mChildInfos insertObject:a3 atIndex:a4];
    [a3 setParentInfo:self];
    if (v6)
    {
    }
  }
}

- (void)insertChildInfo:(id)a3 below:(id)a4
{
  mChildInfos = self->mChildInfos;
  if (mChildInfos)
  {
    uint64_t v7 = [(NSMutableArray *)mChildInfos indexOfObjectIdenticalTo:a4];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(TSDContainerInfo *)self insertChildInfo:a3 atIndex:v7];
    }
  }
}

- (void)insertChildInfo:(id)a3 above:(id)a4
{
  mChildInfos = self->mChildInfos;
  if (mChildInfos)
  {
    uint64_t v7 = [(NSMutableArray *)mChildInfos indexOfObjectIdenticalTo:a4];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(TSDContainerInfo *)self insertChildInfo:a3 atIndex:v7 + 1];
    }
  }
}

- (void)moveChildren:(id)a3 toIndexes:(id)a4
{
  uint64_t v7 = [a3 count];
  uint64_t v8 = [a4 count];
  unint64_t v9 = [a4 lastIndex];
  unint64_t v10 = [(NSMutableArray *)self->mChildInfos count];
  unint64_t v11 = v10;
  if (v7 == v8)
  {
    if (v9 < v10)
    {
      id v20 = (id)[(NSMutableArray *)self->mChildInfos mutableCopy];
      [v20 removeObjectsInArray:a3];
      unint64_t v12 = v11 - v7;
      if ([v20 count] != v12)
      {
        v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v14 = [NSString stringWithUTF8String:"-[TSDContainerInfo moveChildren:toIndexes:]"];
        [v13 handleFailureInFunction:v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"), 248, @"Can't move drawables to indexes, not all drawables are in this container." file lineNumber description];
      }
      if ([v20 count] == v12)
      {
        [v20 insertObjects:a3 atIndexes:a4];
        [(TSDContainerInfo *)self setChildInfos:v20];
      }

      return;
    }
  }
  else
  {
    uint64_t v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSDContainerInfo moveChildren:toIndexes:]"];
    [v15 handleFailureInFunction:v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"), 241, @"Can't move drawables to indexes, counts don't match." file lineNumber description];
    if (v9 < v11) {
      return;
    }
  }
  long long v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v18 = [NSString stringWithUTF8String:"-[TSDContainerInfo moveChildren:toIndexes:]"];
  uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"];

  [v17 handleFailureInFunction:v18, v19, 242, @"Can't move drawables to indexes, one or more indexes out of range." file lineNumber description];
}

- (void)removeChildInfo:(id)a3
{
}

- (void)replaceChildInfo:(id)a3 with:(id)a4
{
  mChildInfos = self->mChildInfos;
  if (mChildInfos)
  {
    uint64_t v8 = -[NSMutableArray indexOfObjectIdenticalTo:](mChildInfos, "indexOfObjectIdenticalTo:");
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v8;
      [(TSPObject *)self willModify];
      id v10 = a3;
      [(NSMutableArray *)self->mChildInfos removeObjectAtIndex:v9];
      [a3 setParentInfo:0];

      [(TSDContainerInfo *)self insertChildInfo:a4 atIndex:v9];
    }
  }
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDContainerInfo mixingTypeWithObject:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"), 302, @"TSDContainerInfo does not implement TSDMixing!");
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a4, a3);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDContainerInfo mixedObjectWithFraction:ofObject:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"), 309, @"TSDContainerInfo does not implement TSDMixing!");
  return 0;
}

- (TSDInfoGeometry)geometry
{
  return self->mGeometry;
}

- (TSDContainerInfo)parentInfo
{
  return self->mParentInfo;
}

- (void)setParentInfo:(id)a3
{
  self->mParentInfo = (TSDContainerInfo *)a3;
}

@end