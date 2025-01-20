@interface NSArray
+ (id)crl_arrayByUnioningArray:(id)a3 withArray:(id)a4;
+ (id)crl_arrayWithCGFloats:(const double *)a3 count:(unint64_t)a4;
+ (id)crl_arrayWithInts:(const int *)a3 count:(unint64_t)a4;
+ (id)crl_arrayWithNonNilObject:(id)a3;
+ (id)crl_arrayWithUIntegers:(const unint64_t *)a3 count:(unint64_t)a4;
- (BOOL)crl_allObjectsPassTest:(id)a3;
- (BOOL)crl_conformsToAnyUTType:(id)a3;
- (BOOL)crl_containsObjectPassingTest:(id)a3;
- (BOOL)crl_enumerateAllBoardItemsNestedRecursivelyUsingBlock:(id)a3;
- (BOOL)crl_isHomogeneousForClass:(Class)a3;
- (id)crl_UTTypes;
- (id)crl_arrayByAddingNonContainedObjectsFromArray:(id)a3;
- (id)crl_arrayByFlattening;
- (id)crl_arrayByMappingObjectsUsingBlock:(id)a3;
- (id)crl_arrayByRemovingFirstObject;
- (id)crl_arrayByRemovingObjectsAtIndexes:(id)a3;
- (id)crl_arrayByRemovingObjectsIdenticalToObjectsInArray:(id)a3;
- (id)crl_arrayByReversingOrder;
- (id)crl_arrayByTransformingWithBlock:(id)a3;
- (id)crl_arrayOfObjectsPassingTest:(id)a3;
- (id)crl_arrayWithObjectsInHashTable:(id)a3;
- (id)crl_arrayWithObjectsInSet:(id)a3;
- (id)crl_boardItemsFromIngestibleItemsAndDescriptions:(id)a3;
- (id)crl_firstObjectPassingTest:(id)a3;
- (id)crl_indexesOfObjects:(id)a3;
- (id)crl_initWithCGFloats:(const double *)a3 count:(unint64_t)a4;
- (id)crl_initWithInts:(const int *)a3 count:(unint64_t)a4;
- (id)crl_initWithUIntegers:(const unint64_t *)a3 count:(unint64_t)a4;
- (id)crl_intersectionWithArray:(id)a3;
- (id)crl_objectPriorToObject:(id)a3;
- (id)crl_onlyObject;
- (id)crl_rangeCheckedObjectAtIndex:(unint64_t)a3;
- (id)crl_uniqueObjects;
- (id)crlaxExtractElementsOfType:(Class)a3;
- (id)crlaxFirstElementOfType:(Class)a3;
- (id)crlaxObjectAtIndexOrNil:(unint64_t)a3;
- (id)crlaxObjectsPassingTest:(id)a3;
- (unint64_t)crl_indexOfSmallestObject;
- (void)crl_enumerateSnapshotObjectsUsingBlock:(id)a3;
- (void)crlaxPerformBlock:(id)a3 onElementsOfType:(Class)a4;
@end

@implementation NSArray

- (id)crl_initWithCGFloats:(const double *)a3 count:(unint64_t)a4
{
  if (a4 < 0x11)
  {
    if (!a4) {
      return [(NSArray *)self initWithObjects:v11 count:0];
    }
    v7 = v11;
LABEL_5:
    uint64_t v8 = 0;
    do
    {
      *(void *)&v7[8 * v8] = +[NSNumber numberWithDouble:a3[v8]];
      ++v8;
    }
    while (a4 != v8);
    v9 = [(NSArray *)self initWithObjects:v7 count:a4];
    if (v7 != v11) {
      free(v7);
    }
    return v9;
  }
  v7 = malloc_type_calloc(a4, 8uLL, 0x80040B8603338uLL);
  if (v7) {
    goto LABEL_5;
  }

  return [(NSArray *)self initWithObjects:0 count:a4];
}

+ (id)crl_arrayWithCGFloats:(const double *)a3 count:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)a1) crl_initWithCGFloats:a3 count:a4];

  return v4;
}

- (id)crl_initWithInts:(const int *)a3 count:(unint64_t)a4
{
  if (a4 < 0x11)
  {
    if (!a4) {
      return [(NSArray *)self initWithObjects:v11 count:0];
    }
    v7 = v11;
LABEL_5:
    uint64_t v8 = 0;
    do
    {
      *(void *)&v7[8 * v8] = +[NSNumber numberWithInt:a3[v8]];
      ++v8;
    }
    while (a4 != v8);
    v9 = [(NSArray *)self initWithObjects:v7 count:a4];
    if (v7 != v11) {
      free(v7);
    }
    return v9;
  }
  v7 = malloc_type_calloc(a4, 8uLL, 0x80040B8603338uLL);
  if (v7) {
    goto LABEL_5;
  }

  return [(NSArray *)self initWithObjects:0 count:a4];
}

+ (id)crl_arrayWithInts:(const int *)a3 count:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)a1) crl_initWithInts:a3 count:a4];

  return v4;
}

+ (id)crl_arrayByUnioningArray:(id)a3 withArray:(id)a4
{
  if (a3) {
    return [a3 crl_arrayByAddingNonContainedObjectsFromArray:a4];
  }
  else {
    return a4;
  }
}

- (id)crl_initWithUIntegers:(const unint64_t *)a3 count:(unint64_t)a4
{
  if (a4 < 0x11)
  {
    if (!a4) {
      return [(NSArray *)self initWithObjects:v11 count:0];
    }
    v7 = v11;
LABEL_5:
    uint64_t v8 = 0;
    do
    {
      *(void *)&v7[8 * v8] = +[NSNumber numberWithInteger:a3[v8]];
      ++v8;
    }
    while (a4 != v8);
    v9 = [(NSArray *)self initWithObjects:v7 count:a4];
    if (v7 != v11) {
      free(v7);
    }
    return v9;
  }
  v7 = malloc_type_calloc(a4, 8uLL, 0x80040B8603338uLL);
  if (v7) {
    goto LABEL_5;
  }

  return [(NSArray *)self initWithObjects:0 count:a4];
}

+ (id)crl_arrayWithUIntegers:(const unint64_t *)a3 count:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)a1) crl_initWithUIntegers:a3 count:a4];

  return v4;
}

- (id)crl_rangeCheckedObjectAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self count] <= a3) {
    return 0;
  }

  return [(NSArray *)self objectAtIndex:a3];
}

- (id)crl_objectPriorToObject:(id)a3
{
  NSUInteger v4 = [(NSArray *)self indexOfObject:a3];
  if (!v4 || v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return [(NSArray *)self objectAtIndex:v4 - 1];
}

- (unint64_t)crl_indexOfSmallestObject
{
  NSUInteger v3 = [(NSArray *)self count];
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v4 = v3;
  unint64_t v5 = 0;
  id v6 = 0;
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    id v8 = [(NSArray *)self objectAtIndex:v5];
    id v9 = v8;
    if (!v6 || [v8 compare:v6] == (id)-1)
    {
      unint64_t v7 = v5;
      id v6 = v9;
    }
    ++v5;
  }
  while (v4 != v5);
  return v7;
}

- (id)crl_indexesOfObjects:(id)a3
{
  id v5 = +[NSMutableIndexSet indexSet];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        NSUInteger v10 = [(NSArray *)self indexOfObject:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
          [v5 addIndex:v10];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)crl_arrayWithObjectsInSet:(id)a3
{
  id v5 = +[NSMutableArray array];
  if (a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(NSArray *)self countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(self);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if ([a3 containsObject:v10]) {
            [v5 addObject:v10];
          }
        }
        id v7 = [(NSArray *)self countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (id)crl_arrayWithObjectsInHashTable:(id)a3
{
  id v5 = +[NSMutableArray array];
  if (a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(NSArray *)self countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(self);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if ([a3 containsObject:v10]) {
            [v5 addObject:v10];
          }
        }
        id v7 = [(NSArray *)self countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (id)crl_intersectionWithArray:(id)a3
{
  id v5 = +[NSMutableArray array];
  if (a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(NSArray *)self countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(self);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if ([a3 indexOfObject:v10] != (id)0x7FFFFFFFFFFFFFFFLL) {
            [v5 addObject:v10];
          }
        }
        id v7 = [(NSArray *)self countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

- (id)crl_arrayByRemovingObjectsIdenticalToObjectsInArray:(id)a3
{
  id v5 = (char *)[a3 count];
  if (!v5) {
    return self;
  }
  id v6 = v5;
  id v7 = 0;
  uint64_t v8 = 0;
  id v9 = (NSMutableArray *)self;
  do
  {
    id v10 = [a3 objectAtIndex:v7];
    id v11 = [(NSMutableArray *)v9 indexOfObjectIdenticalTo:v10];
    if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v11;
            i != (id)0x7FFFFFFFFFFFFFFFLL;
            id i = [(NSMutableArray *)v9 indexOfObjectIdenticalTo:v10])
      {
        if (!v8)
        {
          id v9 = +[NSMutableArray arrayWithArray:self];
          uint64_t v8 = v9;
        }
        [(NSMutableArray *)v8 removeObjectAtIndex:i];
      }
    }
    ++v7;
  }
  while (v7 != v6);
  return v9;
}

- (id)crl_arrayByAddingNonContainedObjectsFromArray:(id)a3
{
  if (a3 && (id v5 = (char *)[a3 count]) != 0)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      id v9 = [a3 objectAtIndex:v7];
      if (![(NSArray *)self containsObject:v9])
      {
        if (!v8)
        {
          uint64_t v8 = +[NSMutableArray arrayWithCapacity:&v6[[(NSArray *)self count]]];
          [(NSMutableArray *)v8 addObjectsFromArray:self];
        }
        [(NSMutableArray *)v8 addObject:v9];
      }
      ++v7;
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v8) {
    return v8;
  }
  else {
    return self;
  }
}

- (id)crl_arrayByReversingOrder
{
  NSUInteger v3 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  NSUInteger v4 = [(NSArray *)self reverseObjectEnumerator];
  id v5 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableArray *)v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)crl_arrayByRemovingFirstObject
{
  if (![(NSArray *)self count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1568);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070F30();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070EAC();
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Can't remove the first object of an empty array!", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSArray(CRLAdditions) crl_arrayByRemovingFirstObject]");
    id v13 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(NSArray(CRLAdditions) *)NSString crl_arrayByRemovingFirstObject], 239, 1, "Can't remove the first object of an empty array!"");
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v13, v14);
    abort();
  }
  NSUInteger v3 = +[NSMutableArray arrayWithArray:self];
  [(NSMutableArray *)v3 removeObjectAtIndex:0];
  NSUInteger v4 = objc_opt_class();

  return [v4 arrayWithArray:v3];
}

- (id)crl_arrayByRemovingObjectsAtIndexes:(id)a3
{
  if (![a3 count]) {
    return self;
  }
  id v5 = [(NSArray *)self mutableCopy];
  [v5 removeObjectsAtIndexes:a3];
  uint64_t v6 = +[NSArray arrayWithArray:v5];

  return v6;
}

- (void)crl_enumerateSnapshotObjectsUsingBlock:(id)a3
{
  id v4 = [(NSArray *)self copy];
  [v4 enumerateObjectsUsingBlock:a3];
}

- (id)crl_firstObjectPassingTest:(id)a3
{
  if (!a3) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(NSArray *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(self);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ((*((uint64_t (**)(id, void *))a3 + 2))(a3, v9)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v9 = 0;
      if (v6) {
        goto LABEL_4;
      }
      return v9;
    }
  }
}

- (BOOL)crl_containsObjectPassingTest:(id)a3
{
  if (a3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(NSArray *)self countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (id i = 0; i != v6; id i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(self);
          }
          if ((*((uint64_t (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v10 + 1) + 8 * i)))
          {
            LOBYTE(v5) = 1;
            return (char)v5;
          }
        }
        id v6 = [(NSArray *)self countByEnumeratingWithState:&v10 objects:v14 count:16];
        LOBYTE(v5) = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (BOOL)crl_isHomogeneousForClass:(Class)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (char *)[(NSArray *)self countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(self);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 0;
        }
        ++v7;
      }
      while (v5 != v7);
      id v5 = (char *)[(NSArray *)self countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (BOOL)crl_allObjectsPassTest:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSArray *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(self);
      }
      int v9 = (*((uint64_t (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v11 + 1) + 8 * v8));
      if (!v9) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [(NSArray *)self countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (id)crl_arrayOfObjectsPassingTest:(id)a3
{
  if (a3)
  {
    NSUInteger v3 = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000A0A44;
    v8[3] = &unk_1014D15B0;
    v8[4] = a3;
    id v4 = [(NSArray *)self indexesOfObjectsPassingTest:v8];
    if (!v4) {
      return +[NSArray array];
    }
    id v5 = v4;
    if (![(NSIndexSet *)v4 count]) {
      return +[NSArray array];
    }
    if (-[NSIndexSet containsIndexesInRange:](v5, "containsIndexesInRange:", 0, [(NSArray *)v3 count])) {
      return v3;
    }
    return [(NSArray *)v3 objectsAtIndexes:v5];
  }

  return +[NSArray array];
}

- (id)crl_arrayByTransformingWithBlock:(id)a3
{
  id v5 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A0AFC;
  v7[3] = &unk_1014D15D8;
  v7[4] = v5;
  v7[5] = a3;
  [(NSArray *)self enumerateObjectsUsingBlock:v7];
  return v5;
}

- (id)crl_arrayByMappingObjectsUsingBlock:(id)a3
{
  id v5 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(NSArray *)self countByEnumeratingWithState:&v18 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(self);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v9);
        uint64_t v11 = (*((uint64_t (**)(id, uint64_t))a3 + 2))(a3, v10);
        if (v11)
        {
          [(NSMutableArray *)v5 addObject:v11];
        }
        else
        {
          unsigned int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D15F8);
          }
          long long v13 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v23 = v12;
            __int16 v24 = 2082;
            v25 = "-[NSArray(CRLAdditions) crl_arrayByMappingObjectsUsingBlock:]";
            __int16 v26 = 2082;
            v27 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSArray_CRLAdditions.m";
            __int16 v28 = 1024;
            int v29 = 370;
            __int16 v30 = 2112;
            uint64_t v31 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Block returned a nil object for %@.", buf, 0x2Cu);
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D1618);
            }
          }
          long long v14 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            long long v15 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v23 = v12;
            __int16 v24 = 2114;
            v25 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:"[(NSArray(CRLAdditions) *)NSString crl_arrayByMappingObjectsUsingBlock:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSArray_CRLAdditions.m"], 370, 0, "Block returned a nil object for %@."", v10];
        }
        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v16 = [(NSArray *)self countByEnumeratingWithState:&v18 objects:v32 count:16];
      id v7 = v16;
    }
    while (v16);
  }
  return [(NSMutableArray *)v5 copy];
}

- (id)crl_arrayByFlattening
{
  id v3 = +[NSMutableArray array];
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_1000A0FB8;
  v6[4] = sub_1000A0FC8;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A0FD4;
  v5[3] = &unk_1014D1640;
  v5[4] = v6;
  v6[5] = v5;
  sub_1000A0FD4((uint64_t)v5, self, v3);
  _Block_object_dispose(v6, 8);
  return v3;
}

- (id)crl_uniqueObjects
{
  return +[NSSet setWithArray:self];
}

- (id)crl_onlyObject
{
  if ([(NSArray *)self count] >= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1660);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070FF8();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101070EAC();
    }
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(NSArray(CRLAdditions) *)NSString crl_onlyObject], 400, 0, "As this method returns the only object in the array, it only makes sense if the array has at most one object."");
  }
  return [(NSArray *)self firstObject];
}

+ (id)crl_arrayWithNonNilObject:(id)a3
{
  if (!a3) {
    return &__NSArray0__struct;
  }
  id v4 = a3;
  return +[NSArray arrayWithObjects:&v4 count:1];
}

- (id)crl_UTTypes
{
  if ([(NSArray *)self crl_isHomogeneousForClass:objc_opt_class()])
  {
    id v3 = [(NSArray *)self crl_arrayByTransformingWithBlock:&stru_1014D6FA8];
  }
  else
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6F48);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107A95C(v4, v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6F68);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSArray(CRLUTIUtilities) crl_UTTypes]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLUTIUtilities.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:139 isFatal:0 description:"Expecting an array of strings."];

    id v3 = &__NSArray0__struct;
  }

  return v3;
}

- (BOOL)crl_conformsToAnyUTType:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    [(NSArray *)self crl_UTTypes];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (id i = 0; i != v6; id i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "crl_conformsToAnyUTType:", v4, (void)v10))
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (BOOL)crl_enumerateAllBoardItemsNestedRecursivelyUsingBlock:(id)a3
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10017B234;
  v6[3] = &unk_1014DC008;
  uint64_t v8 = &v9;
  id v4 = a3;
  id v7 = v4;
  [(NSArray *)self enumerateObjectsUsingBlock:v6];
  LOBYTE(self) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (id)crl_boardItemsFromIngestibleItemsAndDescriptions:(id)a3
{
  return [a3 crl_arrayByTransformingWithBlock:&stru_1014DC158];
}

- (id)crlaxExtractElementsOfType:(Class)a3
{
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (id i = 0; i != v7; id i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          [v4 addObject:v10];
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)crlaxObjectsPassingTest:(id)a3
{
  id v4 = [(NSArray *)self indexesOfObjectsPassingTest:a3];
  id v5 = [(NSArray *)self objectsAtIndexes:v4];

  return v5;
}

- (id)crlaxObjectAtIndexOrNil:(unint64_t)a3
{
  if ([(NSArray *)self count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)crlaxFirstElementOfType:(Class)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (id i = 0; i != v5; id i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (void)crlaxPerformBlock:(id)a3 onElementsOfType:(Class)a4
{
  id v5 = (void (**)(id, void))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = self;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_isKindOfClass()) {
          v5[2](v5, v11);
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

@end