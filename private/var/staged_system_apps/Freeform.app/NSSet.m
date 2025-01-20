@interface NSSet
+ (BOOL)crl_set:(id)a3 isEqualToSet:(id)a4;
+ (id)crl_intersectionOfSets:(id)a3;
+ (id)crl_setWithSelectors:(SEL)a3;
- (BOOL)crl_containsKindOfClass:(Class)a3;
- (BOOL)crl_containsObjectIdenticalTo:(id)a3;
- (BOOL)crl_isHomogeneousForClass:(Class)a3;
- (id)crl_onlyObject;
- (id)crl_setByIntersectingSet:(id)a3;
- (id)crl_setByMappingObjectsUsingBlock:(id)a3;
- (id)crl_setBySubtractingSet:(id)a3;
- (id)crl_sortedArray;
@end

@implementation NSSet

+ (id)crl_setWithSelectors:(SEL)a3
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

+ (BOOL)crl_set:(id)a3 isEqualToSet:(id)a4
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

+ (id)crl_intersectionOfSets:(id)a3
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

- (BOOL)crl_containsObjectIdenticalTo:(id)a3
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

- (BOOL)crl_containsKindOfClass:(Class)a3
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

- (id)crl_sortedArray
{
  v2 = [(NSSet *)self allObjects];
  id v3 = [v2 sortedArrayUsingSelector:"compare:"];

  return v3;
}

- (id)crl_setByMappingObjectsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC1D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109BF4C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC1F0);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSSet(CRLAdditions) crl_setByMappingObjectsUsingBlock:]");
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSSet_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 95, 0, "Invalid parameter not satisfying: %{public}s", "block != nil");
  }
  BOOL v8 = +[NSMutableSet setWithCapacity:[(NSSet *)self count]];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self;
  id v9 = [(NSSet *)obj countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = v4[2](v4, *(void *)(*((void *)&v24 + 1) + 8 * (void)v12));
        if (v13)
        {
          [v8 addObject:v13];
        }
        else
        {
          unsigned int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EC210);
          }
          v15 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v29 = v14;
            __int16 v30 = 2082;
            v31 = "-[NSSet(CRLAdditions) crl_setByMappingObjectsUsingBlock:]";
            __int16 v32 = 2082;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSSet_CRLAdditions.m";
            __int16 v34 = 1024;
            int v35 = 105;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Block returned a nil object.", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EC230);
          }
          v16 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v19 = v16;
            v20 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v29 = v14;
            __int16 v30 = 2114;
            v31 = v20;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSSet(CRLAdditions) crl_setByMappingObjectsUsingBlock:]");
          v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSSet_CRLAdditions.m"];
          +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:105 isFatal:0 description:"Block returned a nil object."];
        }
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSSet *)obj countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v10);
  }

  id v21 = [v8 copy];

  return v21;
}

- (BOOL)crl_isHomogeneousForClass:(Class)a3
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

- (id)crl_onlyObject
{
  if ([(NSSet *)self count] >= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC250);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109BFFC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EC270);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSSet(CRLAdditions) crl_onlyObject]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSSet_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 126, 0, "As this method returns the only object in the set, it only makes sense if the set has at most one object.");
  }
  uint64_t v6 = [(NSSet *)self anyObject];

  return v6;
}

- (id)crl_setByIntersectingSet:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet setWithSet:self];
  [v5 intersectSet:v4];

  uint64_t v6 = +[NSSet setWithSet:v5];

  return v6;
}

- (id)crl_setBySubtractingSet:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[NSMutableSet setWithSet:self];
    [v5 minusSet:v4];
    uint64_t v6 = +[NSSet setWithSet:v5];
  }
  else
  {
    uint64_t v6 = self;
  }

  return v6;
}

@end