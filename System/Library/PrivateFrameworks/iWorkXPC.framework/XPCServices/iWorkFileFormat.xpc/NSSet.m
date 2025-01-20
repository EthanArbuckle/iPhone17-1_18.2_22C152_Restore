@interface NSSet
+ (BOOL)tsu_set:(id)a3 isEqualToSet:(id)a4;
+ (id)tsu_intersectionOfSets:(id)a3;
+ (id)tsu_setWithSelectors:(SEL)a3;
- (BOOL)tsu_containsKindOfClass:(Class)a3;
- (BOOL)tsu_containsObjectIdenticalTo:(id)a3;
- (BOOL)tsu_isHomogeneousForClass:(Class)a3;
- (id)tsu_onlyObject;
- (id)tsu_setByIntersectingSet:(id)a3;
- (id)tsu_setByMappingObjectsUsingBlock:(id)a3;
- (id)tsu_setBySubtractingSet:(id)a3;
- (id)tsu_sortedArray;
@end

@implementation NSSet

+ (id)tsu_setWithSelectors:(SEL)a3
{
  id v4 = objc_alloc_init((Class)NSMutableSet);
  v9 = (SEL *)&v11;
  if (a3)
  {
    do
    {
      v5 = NSStringFromSelector(a3);
      [v4 addObject:v5];

      v6 = v9++;
      a3 = *v6;
    }
    while (*v6);
  }
  id v7 = [v4 copy];

  return v7;
}

+ (BOOL)tsu_set:(id)a3 isEqualToSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 == v6)
  {
    unsigned __int8 v8 = 1;
    id v7 = v5;
    goto LABEL_6;
  }
  id v7 = v6;
  if (!v5)
  {
    id v5 = +[NSSet set];
    if (v7) {
      goto LABEL_4;
    }
LABEL_8:
    id v7 = +[NSSet set];
    goto LABEL_4;
  }
  if (!v6) {
    goto LABEL_8;
  }
LABEL_4:
  unsigned __int8 v8 = [v5 isEqualToSet:v7];
LABEL_6:

  return v8;
}

+ (id)tsu_intersectionOfSets:(id)a3
{
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4) {
    goto LABEL_12;
  }
  id v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v12;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
      if (v6)
      {
        [v6 intersectSet:v9];
      }
      else
      {
        id v6 = +[NSMutableSet setWithSet:v9];
      }
    }
    id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v5);
  if (!v6)
  {
LABEL_12:
    id v6 = +[NSMutableSet set];
  }

  return v6;
}

- (BOOL)tsu_containsObjectIdenticalTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self;
  id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8 * i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)tsu_containsKindOfClass:(Class)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self;
  id v4 = (char *)[(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_opt_isKindOfClass())
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      id v5 = (char *)[(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (id)tsu_sortedArray
{
  v2 = [(NSSet *)self allObjects];
  id v3 = [v2 sortedArrayUsingSelector:"compare:"];

  return v3;
}

- (id)tsu_setByMappingObjectsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  p_info = &OBJC_METACLASS___TSUExtendedAttributeCollection.info;
  if (!v4)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CBC08);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100164070();
    }
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSSet(TSUAdditions) tsu_setByMappingObjectsUsingBlock:]");
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSSetAdditions.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 99, 0, "Invalid parameter not satisfying: %{public}s", "block != nil");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v22 = +[NSMutableSet setWithCapacity:[(NSSet *)self count]];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = self;
  id v8 = [(NSSet *)obj countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = v4[2](v4, *(void *)(*((void *)&v23 + 1) + 8 * (void)v11));
        if (v12)
        {
          [v22 addObject:v12];
        }
        else
        {
          unsigned int v13 = [p_info + 471 _atomicIncrementAssertCount];
          if (TSUAssertCat_init_token != -1) {
            dispatch_once(&TSUAssertCat_init_token, &stru_1001CBC28);
          }
          long long v14 = TSUAssertCat_log_t;
          if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v28 = v13;
            __int16 v29 = 2082;
            v30 = "-[NSSet(TSUAdditions) tsu_setByMappingObjectsUsingBlock:]";
            __int16 v31 = 2082;
            v32 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSSetAdditions.m";
            __int16 v33 = 1024;
            int v34 = 109;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Block returned a nil object.", buf, 0x22u);
          }
          v15 = p_info + 471;
          v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSSet(TSUAdditions) tsu_setByMappingObjectsUsingBlock:]");
          +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSSetAdditions.m"];
          v18 = v17 = p_info;
          [v15 handleFailureInFunction:v16 file:v18 lineNumber:109 isFatal:0 description:"Block returned a nil object."];

          p_info = v17;
          [v17 + 471 logBacktraceThrottled];
        }

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSSet *)obj countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v9);
  }

  id v19 = [v22 copy];
  return v19;
}

- (BOOL)tsu_isHomogeneousForClass:(Class)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self;
  id v4 = (char *)[(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      id v5 = (char *)[(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (id)tsu_onlyObject
{
  if ([(NSSet *)self count] >= 2)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CBC48);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100164120();
    }
    id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSSet(TSUAdditions) tsu_onlyObject]");
    id v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSSetAdditions.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 130, 0, "As this method returns the only object in the set, it only makes sense if the set has at most one object.");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v5 = [(NSSet *)self anyObject];
  return v5;
}

- (id)tsu_setByIntersectingSet:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet setWithSet:self];
  [v5 intersectSet:v4];

  uint64_t v6 = [(id)objc_opt_class() setWithSet:v5];

  return v6;
}

- (id)tsu_setBySubtractingSet:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[NSMutableSet setWithSet:self];
    [v5 minusSet:v4];
    uint64_t v6 = [(id)objc_opt_class() setWithSet:v5];
  }
  else
  {
    uint64_t v6 = self;
  }

  return v6;
}

@end