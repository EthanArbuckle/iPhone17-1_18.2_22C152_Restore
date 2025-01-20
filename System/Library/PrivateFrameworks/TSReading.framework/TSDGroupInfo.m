@interface TSDGroupInfo
+ (id)drawablesToInsertForGroup:(id)a3 filteredWithTarget:(id)a4 action:(SEL)a5;
+ (id)groupGeometryFromChildrenInfos:(id)a3;
+ (id)p_drawablesToInsertForGroup:(id)a3 filteredWithTarget:(id)a4 action:(SEL)a5 didUngroup:(BOOL *)a6;
- (BOOL)aspectRatioLocked;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (Class)layoutClass;
- (Class)repClass;
- (TSDInfoGeometry)geometry;
- (id)allNestedChildrenInfos;
- (id)allNestedChildrenInfosIncludingGroups;
- (id)childEnumerator;
- (id)childInfos;
- (id)copyWithContext:(id)a3;
- (id)groupedGeometryForChildInfo:(id)a3;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)onlyChild;
- (id)ungroupedGeometryForChildInfo:(id)a3;
- (int64_t)mixingTypeWithObject:(id)a3;
- (void)acceptVisitor:(id)a3;
- (void)addChildInfo:(id)a3;
- (void)adoptStylesheet:(id)a3 withMapper:(id)a4;
- (void)dealloc;
- (void)didCopy;
- (void)ensureGeometryFitsChildren;
- (void)insertChildInfo:(id)a3 above:(id)a4;
- (void)insertChildInfo:(id)a3 atIndex:(unint64_t)a4;
- (void)insertChildInfo:(id)a3 below:(id)a4;
- (void)makeChildGeometriesRelativeAndComputeOwnAbsoluteGeometry;
- (void)moveChildren:(id)a3 toIndexes:(id)a4;
- (void)processSelectedStoragesWithStatisticsController:(id)a3;
- (void)removeAllChildrenInDocument:(BOOL)a3;
- (void)removeChildInfo:(id)a3;
- (void)replaceChildInfo:(id)a3 with:(id)a4;
- (void)setChildInfos:(id)a3;
- (void)setGeometry:(id)a3;
- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)wasRemovedFromDocumentRoot:(id)a3;
- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)willBeRemovedFromDocumentRoot:(id)a3;
- (void)willCopyWithOtherDrawables:(id)a3;
@end

@implementation TSDGroupInfo

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
  v8.super_class = (Class)TSDGroupInfo;
  [(TSDDrawableInfo *)&v8 dealloc];
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (BOOL)aspectRatioLocked
{
  return 1;
}

- (TSDInfoGeometry)geometry
{
  return self->super.mGeometry;
}

- (void)setGeometry:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDGroupInfo setGeometry:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 94, @"invalid nil value for '%s'", "newGeometry");
  }
  if (([a3 isEqual:self->super.mGeometry] & 1) == 0)
  {
    [(TSPObject *)self willModify];
    if ([a3 isEqualExceptForPosition:self->super.mGeometry]) {
      uint64_t v7 = 513;
    }
    else {
      uint64_t v7 = 512;
    }
    [(TSDDrawableInfo *)self willChangeProperty:v7];

    self->super.mGeometry = (TSDInfoGeometry *)a3;
  }
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)TSDGroupInfo;
  id v5 = -[TSDDrawableInfo copyWithContext:](&v17, sel_copyWithContext_);
  if (v5)
  {
    if ([(NSMutableArray *)self->mChildInfos count])
    {
      *((void *)v5 + 18) = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF980], "allocWithZone:", -[TSDGroupInfo zone](self, "zone")), "initWithCapacity:", -[NSMutableArray count](self->mChildInfos, "count"));
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      mChildInfos = self->mChildInfos;
      uint64_t v7 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(mChildInfos);
            }
            long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) copyWithContext:a3];
            [v11 setParentInfo:v5];
            [*((id *)v5 + 18) addObject:v11];
          }
          uint64_t v8 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v13 objects:v18 count:16];
        }
        while (v8);
      }
    }
    *((unsigned char *)v5 + 152) = self->mIsInDocument;
  }
  return v5;
}

- (id)allNestedChildrenInfos
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = (void *)[MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(TSDGroupInfo *)self childInfos];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(v9, "allNestedChildrenInfos"));
        }
        else {
          [v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)onlyChild
{
  if ([(NSMutableArray *)self->mChildInfos count] != 1) {
    return 0;
  }
  mChildInfos = self->mChildInfos;

  return (id)[(NSMutableArray *)mChildInfos lastObject];
}

- (id)allNestedChildrenInfosIncludingGroups
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = (void *)[MEMORY[0x263EFF980] array];
  [v3 addObject:self];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(TSDGroupInfo *)self childInfos];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(v9, "allNestedChildrenInfosIncludingGroups"));
        }
        [v3 addObject:v9];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)childInfos
{
  return self->mChildInfos;
}

- (void)setChildInfos:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  mChildInfos = self->mChildInfos;
  if (mChildInfos != a3 && (-[NSMutableArray isEqual:](mChildInfos, "isEqual:") & 1) == 0)
  {
    [(TSPObject *)self willModify];
    [(TSDDrawableInfo *)self willChangeProperty:514];
    id v37 = a3;
    if (a3) {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:a3];
    }
    else {
      uint64_t v6 = 0;
    }
    if (self->mIsInDocument)
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      id v36 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      id v8 = [(TSPObject *)self documentRoot];
    }
    else
    {
      id v8 = 0;
      id v36 = 0;
      id v7 = 0;
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v9 = self->mChildInfos;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v51 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if (([v6 containsObject:v14] & 1) == 0)
          {
            if (self->mIsInDocument)
            {
              [v7 addObject:v14];
              [v14 willBeRemovedFromDocumentRoot:v8];
            }
            [v14 setParentInfo:0];
          }
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v50 objects:v57 count:16];
      }
      while (v11);
    }

    if (self->mChildInfos) {
      long long v15 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:self->mChildInfos];
    }
    else {
      long long v15 = 0;
    }
    v35 = v7;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v16 = v37;
    uint64_t v17 = [v37 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v47 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          objc_opt_class();
          if (!TSUDynamicCast())
          {
            v22 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v23 = [NSString stringWithUTF8String:"-[TSDGroupInfo setChildInfos:]"];
            uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"];
            uint64_t v25 = v23;
            uint64_t v16 = v37;
            [v22 handleFailureInFunction:v25 file:v24 lineNumber:231 description:@"Group children must be TSDDrawableInfos."];
          }
          if (([v15 containsObject:v21] & 1) == 0)
          {
            [v21 parentInfo];
            [(id)TSUProtocolCast() removeChildInfo:v21];
            if (self->mIsInDocument)
            {
              [v36 addObject:v21];
              [v21 willBeAddedToDocumentRoot:v8 context:0];
            }
            [v21 setParentInfo:self];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v18);
    }

    v26 = (NSMutableArray *)[v16 mutableCopy];
    self->mChildInfos = v26;
    if (self->mIsInDocument)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v27 = [v35 countByEnumeratingWithState:&v42 objects:v55 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v43;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v43 != v29) {
              objc_enumerationMutation(v35);
            }
            [*(id *)(*((void *)&v42 + 1) + 8 * k) wasRemovedFromDocumentRoot:v8];
          }
          uint64_t v28 = [v35 countByEnumeratingWithState:&v42 objects:v55 count:16];
        }
        while (v28);
      }
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v31 = [v36 countByEnumeratingWithState:&v38 objects:v54 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v39;
        do
        {
          for (uint64_t m = 0; m != v32; ++m)
          {
            if (*(void *)v39 != v33) {
              objc_enumerationMutation(v36);
            }
            [*(id *)(*((void *)&v38 + 1) + 8 * m) wasAddedToDocumentRoot:v8 context:0];
          }
          uint64_t v32 = [v36 countByEnumeratingWithState:&v38 objects:v54 count:16];
        }
        while (v32);
      }
    }
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

  [(TSDGroupInfo *)self insertChildInfo:a3 atIndex:v6];
}

- (void)insertChildInfo:(id)a3 atIndex:(unint64_t)a4
{
  if (a3)
  {
    objc_opt_class();
    if (!TSUDynamicCast())
    {
      uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[TSDGroupInfo insertChildInfo:atIndex:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 276, @"Group children must be TSDDrawableInfos.");
    }
    [(TSPObject *)self willModify];
    [(TSDDrawableInfo *)self willChangeProperty:514];
    [a3 parentInfo];
    id v8 = (void *)TSUProtocolCast();
    if (v8)
    {
      id v9 = a3;
      [v8 removeChildInfo:a3];
    }
    if (!self->mChildInfos) {
      self->mChildInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    }
    [a3 setParentInfo:self];
    if (self->mIsInDocument) {
      objc_msgSend(a3, "willBeAddedToDocumentRoot:context:", -[TSPObject documentRoot](self, "documentRoot"), 0);
    }
    [(NSMutableArray *)self->mChildInfos insertObject:a3 atIndex:a4];
    if (self->mIsInDocument) {
      objc_msgSend(a3, "wasAddedToDocumentRoot:context:", -[TSPObject documentRoot](self, "documentRoot"), 0);
    }
    if (v8)
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
      [(TSDGroupInfo *)self insertChildInfo:a3 atIndex:v7];
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
      [(TSDGroupInfo *)self insertChildInfo:a3 atIndex:v7 + 1];
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
        long long v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v14 = [NSString stringWithUTF8String:"-[TSDGroupInfo moveChildren:toIndexes:]"];
        [v13 handleFailureInFunction:v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 345, @"Can't move drawables to indexes, not all drawables are in this group." file lineNumber description];
      }
      if ([v20 count] == v12)
      {
        [v20 insertObjects:a3 atIndexes:a4];
        [(TSDGroupInfo *)self setChildInfos:v20];
      }

      return;
    }
  }
  else
  {
    long long v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSDGroupInfo moveChildren:toIndexes:]"];
    [v15 handleFailureInFunction:v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 338, @"Can't move drawables to indexes, counts don't match." file lineNumber description];
    if (v9 < v11) {
      return;
    }
  }
  uint64_t v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v18 = [NSString stringWithUTF8String:"-[TSDGroupInfo moveChildren:toIndexes:]"];
  uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"];

  [v17 handleFailureInFunction:v18, v19, 339, @"Can't move drawables to indexes, one or more indexes out of range." file lineNumber description];
}

- (void)removeAllChildrenInDocument:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  [(TSPObject *)self willModify];
  mChildInfos = self->mChildInfos;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(mChildInfos);
        }
        unint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        if (v3) {
          objc_msgSend(v10, "willBeRemovedFromDocumentRoot:", -[TSPObject documentRoot](self, "documentRoot"));
        }
        [v10 setParentInfo:0];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  self->mChildInfos = 0;
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v11 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(mChildInfos);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "wasRemovedFromDocumentRoot:", -[TSPObject documentRoot](self, "documentRoot"));
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

- (id)groupedGeometryForChildInfo:(id)a3
{
  id v4 = (void *)[a3 geometry];
  uint64_t v5 = [(TSDGroupInfo *)self geometry];

  return (id)[v4 geometryRelativeToGeometry:v5];
}

- (id)ungroupedGeometryForChildInfo:(id)a3
{
  if ((-[NSMutableArray containsObject:](self->mChildInfos, "containsObject:") & 1) == 0)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDGroupInfo ungroupedGeometryForChildInfo:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 385, @"Can't get ungrouped geometry for a drawable which isn't a child of the group.");
  }
  uint64_t v7 = (void *)[a3 geometry];
  uint64_t v8 = [(TSDGroupInfo *)self geometry];

  return (id)[v7 geometryWithParentGeometry:v8];
}

+ (id)groupGeometryFromChildrenInfos:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double x = *MEMORY[0x263F001A0];
  double y = *(double *)(MEMORY[0x263F001A0] + 8);
  double width = *(double *)(MEMORY[0x263F001A0] + 16);
  double height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        if (v12) {
          [v12 computeLayoutFullTransform];
        }
        else {
          memset(&v14, 0, sizeof(v14));
        }
        v21.origin.double x = 0.0;
        v21.origin.double y = 0.0;
        v21.size.double width = 1.0;
        v21.size.double height = 1.0;
        CGRect v24 = CGRectApplyAffineTransform(v21, &v14);
        v22.origin.double x = x;
        v22.origin.double y = y;
        v22.size.double width = width;
        v22.size.double height = height;
        CGRect v23 = CGRectUnion(v22, v24);
        double x = v23.origin.x;
        double y = v23.origin.y;
        double width = v23.size.width;
        double height = v23.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  return -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", x, y, fmax(width, 1.0), fmax(height, 1.0));
}

- (void)makeChildGeometriesRelativeAndComputeOwnAbsoluteGeometry
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(TSDGroupInfo *)self setGeometry:+[TSDGroupInfo groupGeometryFromChildrenInfos:self->mChildInfos]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  mChildInfos = self->mChildInfos;
  uint64_t v4 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mChildInfos);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "setGeometry:", -[TSDGroupInfo groupedGeometryForChildInfo:](self, "groupedGeometryForChildInfo:", *(void *)(*((void *)&v8 + 1) + 8 * i)));
      }
      uint64_t v5 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
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
      [(TSDDrawableInfo *)self willChangeProperty:514];
      id v10 = a3;
      if (self->mIsInDocument) {
        objc_msgSend(a3, "willBeRemovedFromDocumentRoot:", -[TSPObject documentRoot](self, "documentRoot"));
      }
      [(NSMutableArray *)self->mChildInfos removeObjectAtIndex:v9];
      [a3 setParentInfo:0];

      if (self->mIsInDocument) {
        objc_msgSend(a3, "wasRemovedFromDocumentRoot:", -[TSPObject documentRoot](self, "documentRoot"));
      }
      [(TSDGroupInfo *)self insertChildInfo:a4 atIndex:v9];
    }
  }
}

- (void)ensureGeometryFitsChildren
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (objc_msgSend(-[TSDGroupInfo childInfos](self, "childInfos"), "count"))
  {
    double x = *MEMORY[0x263F001A0];
    double y = *(double *)(MEMORY[0x263F001A0] + 8);
    double width = *(double *)(MEMORY[0x263F001A0] + 16);
    double height = *(double *)(MEMORY[0x263F001A0] + 24);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v7 = [(TSDGroupInfo *)self childInfos];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (v12) {
            [v12 computeFullTransform];
          }
          else {
            memset(&v35, 0, sizeof(v35));
          }
          v43.origin.double x = 0.0;
          v43.origin.double y = 0.0;
          v43.size.double width = 1.0;
          v43.size.double height = 1.0;
          CGRect v46 = CGRectApplyAffineTransform(v43, &v35);
          v44.origin.double x = x;
          v44.origin.double y = y;
          v44.size.double width = width;
          v44.size.double height = height;
          CGRect v45 = CGRectUnion(v44, v46);
          double x = v45.origin.x;
          double y = v45.origin.y;
          double width = v45.size.width;
          double height = v45.size.height;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v9);
    }
    [(TSDInfoGeometry *)[(TSDGroupInfo *)self geometry] size];
    double v14 = fmax(v13, 1.0);
    double v16 = fmax(v15, 1.0);
    memset(&v34, 0, sizeof(v34));
    CGAffineTransformMakeScale(&v34, fmax(width, 1.0) / v14, fmax(height, 1.0) / v16);
    CGAffineTransformMakeTranslation(&t2, x / v14, y / v16);
    CGAffineTransform t1 = v34;
    CGAffineTransformConcat(&v33, &t1, &t2);
    CGAffineTransform v34 = v33;
    long long v17 = [(TSDGroupInfo *)self geometry];
    if (v17) {
      [(TSDInfoGeometry *)v17 fullTransform];
    }
    else {
      memset(&v29, 0, sizeof(v29));
    }
    CGAffineTransform v33 = v34;
    CGAffineTransformConcat(&v30, &v33, &v29);
    [(TSDGroupInfo *)self setGeometry:+[TSDInfoGeometry geometryFromFullTransform:&v30]];
    CGAffineTransformMakeTranslation(&v33, -x, -y);
    CGAffineTransform v34 = v33;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = [(TSDGroupInfo *)self childInfos];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          CGRect v23 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          CGRect v24 = (void *)[v23 geometry];
          CGAffineTransform v33 = v34;
          objc_msgSend(v23, "setGeometry:", objc_msgSend(v24, "geometryByAppendingTransform:", &v33));
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v40 count:16];
      }
      while (v20);
    }
  }
}

- (void)willCopyWithOtherDrawables:(id)a3
{
  id v5 = [(TSDGroupInfo *)self childInfos];

  [v5 makeObjectsPerformSelector:a2 withObject:a3];
}

- (void)didCopy
{
  id v3 = [(TSDGroupInfo *)self childInfos];

  [v3 makeObjectsPerformSelector:a2];
}

- (id)childEnumerator
{
  return (id)[(NSMutableArray *)self->mChildInfos objectEnumerator];
}

- (void)acceptVisitor:(id)a3
{
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)TSDGroupInfo;
  -[TSDDrawableInfo willBeAddedToDocumentRoot:context:](&v16, sel_willBeAddedToDocumentRoot_context_);
  if (([a4 wasUnarchived] & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    mChildInfos = self->mChildInfos;
    uint64_t v8 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(mChildInfos);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) willBeAddedToDocumentRoot:a3 context:a4];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)TSDGroupInfo;
  -[TSDDrawableInfo wasAddedToDocumentRoot:context:](&v16, sel_wasAddedToDocumentRoot_context_);
  self->mIsInDocument = 1;
  if (([a4 wasUnarchived] & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    mChildInfos = self->mChildInfos;
    uint64_t v8 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(mChildInfos);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) wasAddedToDocumentRoot:a3 context:a4];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TSDGroupInfo;
  -[TSDDrawableInfo willBeRemovedFromDocumentRoot:](&v14, sel_willBeRemovedFromDocumentRoot_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mChildInfos = self->mChildInfos;
  uint64_t v6 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(mChildInfos);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) willBeRemovedFromDocumentRoot:a3];
      }
      uint64_t v7 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
  self->mIsInDocument = 0;
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)TSDGroupInfo;
  -[TSDDrawableInfo wasRemovedFromDocumentRoot:](&v14, sel_wasRemovedFromDocumentRoot_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mChildInfos = self->mChildInfos;
  uint64_t v6 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(mChildInfos);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) wasRemovedFromDocumentRoot:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)TSDGroupInfo;
  -[TSDDrawableInfo adoptStylesheet:withMapper:](&v16, sel_adoptStylesheet_withMapper_);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mChildInfos = self->mChildInfos;
  uint64_t v8 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(mChildInfos);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) adoptStylesheet:a3 withMapper:a4];
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)mChildInfos countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__TSDGroupInfo_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_2646B1758;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __37__TSDGroupInfo_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDGroupInfo mixingTypeWithObject:]_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 639, @"nil object after cast");
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "childInfos"), "count");
  if (v5 == objc_msgSend((id)objc_msgSend(v2, "childInfos"), "count"))
  {
    if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "childInfos"), "count")) {
      return 4;
    }
    uint64_t v6 = 0;
    uint64_t v7 = 4;
    while (1)
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "childInfos"), "objectAtIndex:", v6);
      uint64_t v9 = objc_msgSend((id)objc_msgSend(v2, "childInfos"), "objectAtIndex:", v6);
      if (![v8 conformsToProtocol:&unk_26D7858E0]
        || ([v9 conformsToProtocol:&unk_26D7858E0] & 1) == 0)
      {
        break;
      }
      if (++v6 >= (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "childInfos"), "count")) {
        return v7;
      }
    }
  }
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a4, a3);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDGroupInfo mixedObjectWithFraction:ofObject:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 667, @"TSDGroupInfo does not implement TSDMixing!");
  return 0;
}

+ (id)drawablesToInsertForGroup:(id)a3 filteredWithTarget:(id)a4 action:(SEL)a5
{
  return (id)objc_msgSend(a1, "p_drawablesToInsertForGroup:filteredWithTarget:action:didUngroup:", a3, a4, a5, 0);
}

+ (id)p_drawablesToInsertForGroup:(id)a3 filteredWithTarget:(id)a4 action:(SEL)a5 didUngroup:(BOOL *)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  char v9 = (unint64_t)objc_msgSend((id)objc_msgSend(a3, "childInfos"), "count") < 2;
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "childInfos"), "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v30 = a3;
  uint64_t v11 = (void *)[a3 childInfos];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        objc_opt_class();
        uint64_t v17 = TSUDynamicCast();
        char v41 = 0;
        if (v17)
        {
          objc_msgSend(v10, "addObjectsFromArray:", objc_msgSend(a1, "p_drawablesToInsertForGroup:filteredWithTarget:action:didUngroup:", v17, a4, a5, &v41));
          v9 |= v41 != 0;
        }
        else
        {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v13);
  }
  if ((v9 & 1) == 0)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v26 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (!v26)
    {
LABEL_30:
      id v18 = (id)[MEMORY[0x263EFF8C0] arrayWithObject:v30];

      char v24 = 0;
      uint64_t v20 = a6;
      if (!a6) {
        return v18;
      }
      goto LABEL_20;
    }
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v38;
LABEL_24:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v38 != v28) {
        objc_enumerationMutation(v10);
      }
      objc_opt_class();
      if (!objc_msgSend(a4, a5, TSUDynamicCast())) {
        break;
      }
      if (v27 == ++v29)
      {
        uint64_t v27 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
        if (v27) {
          goto LABEL_24;
        }
        goto LABEL_30;
      }
    }
  }
  id v18 = v10;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v46 count:16];
  uint64_t v20 = a6;
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "setGeometry:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "geometry"), "geometryWithParentGeometry:", objc_msgSend(v30, "geometry")));
      }
      uint64_t v21 = [v18 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v21);
  }

  [v30 removeAllChildrenInDocument:0];
  char v24 = 1;
  if (a6) {
LABEL_20:
  }
    *uint64_t v20 = v24;
  return v18;
}

- (void)processSelectedStoragesWithStatisticsController:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = [(TSDGroupInfo *)self allNestedChildrenInfos];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v8) conformsToProtocol:&unk_26D79F110]) {
          [(id)TSUProtocolCast() processSelectedStoragesWithStatisticsController:a3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

@end