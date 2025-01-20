@interface NSArray
+ (id)tsu_arrayByUnioningArray:(id)a3 withArray:(id)a4;
+ (id)tsu_arrayWithCGFloats:(const double *)a3 count:(unint64_t)a4;
+ (id)tsu_arrayWithInts:(const int *)a3 count:(unint64_t)a4;
+ (id)tsu_arrayWithNonNilObject:(id)a3;
+ (id)tsu_arrayWithUIntegers:(const unint64_t *)a3 count:(unint64_t)a4;
- (BOOL)tsu_allObjectsPassTest:(id)a3;
- (BOOL)tsu_containsObjectPassingTest:(id)a3;
- (BOOL)tsu_isHomogeneousForClass:(Class)a3;
- (id)tsu_arrayByAddingNonContainedObjectsFromArray:(id)a3;
- (id)tsu_arrayByFlattening;
- (id)tsu_arrayByMappingObjectsUsingBlock:(id)a3;
- (id)tsu_arrayByRemovingFirstObject;
- (id)tsu_arrayByRemovingObjectsAtIndexes:(id)a3;
- (id)tsu_arrayByRemovingObjectsIdenticalToObjectsInArray:(id)a3;
- (id)tsu_arrayByReversingOrder;
- (id)tsu_arrayByTransformingWithBlock:(id)a3;
- (id)tsu_arrayOfObjectsPassingTest:(id)a3;
- (id)tsu_arrayWithObjectsInSet:(id)a3;
- (id)tsu_firstObjectPassingTest:(id)a3;
- (id)tsu_indexesOfObjects:(id)a3;
- (id)tsu_initWithCGFloats:(const double *)a3 count:(unint64_t)a4;
- (id)tsu_initWithInts:(const int *)a3 count:(unint64_t)a4;
- (id)tsu_initWithUIntegers:(const unint64_t *)a3 count:(unint64_t)a4;
- (id)tsu_intersectionWithArray:(id)a3;
- (id)tsu_localizedList;
- (id)tsu_objectPriorToObject:(id)a3;
- (id)tsu_onlyObject;
- (id)tsu_rangeCheckedObjectAtIndex:(unint64_t)a3;
- (id)tsu_uniqueObjects;
- (unint64_t)tsu_indexOfSmallestObject;
- (void)tsu_enumerateSnapshotObjectsUsingBlock:(id)a3;
@end

@implementation NSArray

- (id)tsu_initWithCGFloats:(const double *)a3 count:(unint64_t)a4
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

+ (id)tsu_arrayWithCGFloats:(const double *)a3 count:(unint64_t)a4
{
  id v4 = objc_msgSend(objc_alloc((Class)a1), "tsu_initWithCGFloats:count:", a3, a4);
  return v4;
}

- (id)tsu_initWithInts:(const int *)a3 count:(unint64_t)a4
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

+ (id)tsu_arrayWithInts:(const int *)a3 count:(unint64_t)a4
{
  id v4 = objc_msgSend(objc_alloc((Class)a1), "tsu_initWithInts:count:", a3, a4);
  return v4;
}

+ (id)tsu_arrayByUnioningArray:(id)a3 withArray:(id)a4
{
  if (a3) {
    return _objc_msgSend(a3, "tsu_arrayByAddingNonContainedObjectsFromArray:", a4);
  }
  else {
    return a4;
  }
}

- (id)tsu_initWithUIntegers:(const unint64_t *)a3 count:(unint64_t)a4
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

+ (id)tsu_arrayWithUIntegers:(const unint64_t *)a3 count:(unint64_t)a4
{
  id v4 = objc_msgSend(objc_alloc((Class)a1), "tsu_initWithUIntegers:count:", a3, a4);
  return v4;
}

- (id)tsu_rangeCheckedObjectAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self count] <= a3) {
    return 0;
  }
  return [(NSArray *)self objectAtIndex:a3];
}

- (id)tsu_objectPriorToObject:(id)a3
{
  NSUInteger v4 = [(NSArray *)self indexOfObject:a3];
  if (!v4 || v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  return [(NSArray *)self objectAtIndex:v4 - 1];
}

- (unint64_t)tsu_indexOfSmallestObject
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

- (id)tsu_indexesOfObjects:(id)a3
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

- (id)tsu_arrayWithObjectsInSet:(id)a3
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

- (id)tsu_intersectionWithArray:(id)a3
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

- (id)tsu_arrayByRemovingObjectsIdenticalToObjectsInArray:(id)a3
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

- (id)tsu_arrayByAddingNonContainedObjectsFromArray:(id)a3
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

- (id)tsu_arrayByReversingOrder
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

- (id)tsu_arrayByRemovingFirstObject
{
  if (![(NSArray *)self count])
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD1C0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166B24();
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Can't remove the first object of an empty array!", v6, v7, v8, v9, v10, v11, v12, (char)"-[NSArray(TSUAdditions) tsu_arrayByRemovingFirstObject]");
    TSUCrashBreakpoint(+[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(NSArray(TSUAdditions) *)NSString tsu_arrayByRemovingFirstObject], 231, 1, "Can't remove the first object of an empty array!""));
    abort();
  }
  NSUInteger v3 = +[NSMutableArray arrayWithArray:self];
  [(NSMutableArray *)v3 removeObjectAtIndex:0];
  NSUInteger v4 = objc_opt_class();
  return [v4 arrayWithArray:v3];
}

- (id)tsu_arrayByRemovingObjectsAtIndexes:(id)a3
{
  if (![a3 count]) {
    return self;
  }
  id v5 = [(NSArray *)self mutableCopy];
  [v5 removeObjectsAtIndexes:a3];
  uint64_t v6 = +[NSArray arrayWithArray:v5];

  return v6;
}

- (void)tsu_enumerateSnapshotObjectsUsingBlock:(id)a3
{
  id v4 = [(NSArray *)self copy];
  [v4 enumerateObjectsUsingBlock:a3];
}

- (id)tsu_firstObjectPassingTest:(id)a3
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

- (BOOL)tsu_containsObjectPassingTest:(id)a3
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

- (BOOL)tsu_isHomogeneousForClass:(Class)a3
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

- (BOOL)tsu_allObjectsPassTest:(id)a3
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

- (id)tsu_arrayOfObjectsPassingTest:(id)a3
{
  if (a3)
  {
    NSUInteger v3 = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000955EC;
    v8[3] = &unk_1001CD1E8;
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

- (id)tsu_arrayByTransformingWithBlock:(id)a3
{
  id v5 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000956A4;
  v7[3] = &unk_1001CD210;
  v7[4] = v5;
  v7[5] = a3;
  [(NSArray *)self enumerateObjectsUsingBlock:v7];
  return v5;
}

- (id)tsu_arrayByMappingObjectsUsingBlock:(id)a3
{
  long long v14 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(NSArray *)self countByEnumeratingWithState:&v15 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(self);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v7);
        uint64_t v9 = (*((uint64_t (**)(id, uint64_t))a3 + 2))(a3, v8);
        if (v9)
        {
          [(NSMutableArray *)v14 addObject:v9];
        }
        else
        {
          unsigned int v10 = +[TSUAssertionHandler _atomicIncrementAssertCount];
          if (TSUAssertCat_init_token != -1) {
            dispatch_once(&TSUAssertCat_init_token, &stru_1001CD230);
          }
          long long v11 = TSUAssertCat_log_t;
          if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v20 = v10;
            __int16 v21 = 2082;
            v22 = "-[NSArray(TSUAdditions) tsu_arrayByMappingObjectsUsingBlock:]";
            __int16 v23 = 2082;
            v24 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSArrayAdditions.m";
            __int16 v25 = 1024;
            int v26 = 362;
            __int16 v27 = 2112;
            uint64_t v28 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Block returned a nil object for %@.", buf, 0x2Cu);
          }
          +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:"[(NSArray(TSUAdditions) *)NSString tsu_arrayByMappingObjectsUsingBlock:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSArrayAdditions.m"], 362, 0, "Block returned a nil object for %@."", v8];
          +[TSUAssertionHandler logBacktraceThrottled];
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)self countByEnumeratingWithState:&v15 objects:v29 count:16];
    }
    while (v5);
  }
  return [(NSMutableArray *)v14 copy];
}

- (id)tsu_arrayByFlattening
{
  id v3 = +[NSMutableArray array];
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_100095A98;
  v6[4] = sub_100095AA8;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100095AB4;
  v5[3] = &unk_1001CD258;
  v5[4] = v6;
  v6[5] = v5;
  sub_100095AB4((uint64_t)v5, self, v3);
  _Block_object_dispose(v6, 8);
  return v3;
}

- (id)tsu_uniqueObjects
{
  return +[NSSet setWithArray:self];
}

- (id)tsu_onlyObject
{
  if ([(NSArray *)self count] >= 2)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD278);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166BB8();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(NSArray(TSUAdditions) *)NSString tsu_onlyObject], 392, 0, "As this method returns the only object in the array, it only makes sense if the array has at most one object."");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  return [(NSArray *)self firstObject];
}

- (id)tsu_localizedList
{
  id v3 = +[NSMutableString string];
  NSUInteger v4 = [(NSArray *)self count];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = 2;
    for (unint64_t i = v4; i; --i)
    {
      [v3 appendFormat:@"%@", objc_msgSend(-[NSArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v6 - 2), "description")];
      if (i < 3)
      {
        if (v5 >= 3 && i == 2)
        {
          id v8 = SFUMainBundle();
          CFStringRef v9 = @"TSU_LIST_SEPARATOR_FINAL";
          CFStringRef v10 = @", and ";
        }
        else
        {
          if (v5 != 2 || v6 != 2) {
            goto LABEL_12;
          }
          id v8 = SFUMainBundle();
          CFStringRef v9 = @"TSU_LIST_SEPARATOR_TWO_ITEMS";
          CFStringRef v10 = @" and ";
        }
      }
      else
      {
        id v8 = SFUMainBundle();
        CFStringRef v9 = @"TSU_LIST_SEPARATOR";
        CFStringRef v10 = @", ";
      }
      [v3 appendFormat:@"%@", objc_msgSend(v8, "localizedStringForKey:value:table:", v9, v10, @"TSUtility"];
LABEL_12:
      ++v6;
    }
  }
  id v11 = [v3 copy];
  return v11;
}

+ (id)tsu_arrayWithNonNilObject:(id)a3
{
  if (!a3) {
    return &__NSArray0__struct;
  }
  id v4 = a3;
  return +[NSArray arrayWithObjects:&v4 count:1];
}

@end