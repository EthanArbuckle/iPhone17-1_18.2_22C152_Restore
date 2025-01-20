@interface CRLNoCopyDictionary
+ (Class)classForKeyedUnarchiver;
- (CRLNoCopyDictionary)init;
- (CRLNoCopyDictionary)initWithCFDictionary:(__CFDictionary *)a3;
- (CRLNoCopyDictionary)initWithCapacity:(unint64_t)a3;
- (id)allKeys;
- (id)allValues;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)getObjects:(id *)a3 andKeys:(id *)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forUncopiedKey:(id)a4;
@end

@implementation CRLNoCopyDictionary

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (CRLNoCopyDictionary)init
{
  return [(CRLNoCopyDictionary *)self initWithCapacity:0];
}

- (CRLNoCopyDictionary)initWithCFDictionary:(__CFDictionary *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLNoCopyDictionary;
  v4 = [(CRLNoCopyDictionary *)&v6 init];
  if (v4) {
    v4->mDictionary = CFDictionaryCreateMutableCopy(0, 0, a3);
  }
  return v4;
}

- (CRLNoCopyDictionary)initWithCapacity:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLNoCopyDictionary;
  v4 = [(CRLNoCopyDictionary *)&v6 init];
  if (v4) {
    v4->mDictionary = CFDictionaryCreateMutable(0, a3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  return v4;
}

- (void)dealloc
{
  mDictionary = self->mDictionary;
  if (mDictionary)
  {
    CFRelease(mDictionary);
    self->mDictionary = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLNoCopyDictionary;
  [(CRLNoCopyDictionary *)&v4 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  mDictionary = self->mDictionary;

  return _[v4 initWithCFDictionary:mDictionary];
}

- (void)removeObjectForKey:(id)a3
{
}

- (void)removeAllObjects
{
}

- (void)setObject:(id)a3 forUncopiedKey:(id)a4
{
  if (a3)
  {
    if (a4)
    {
LABEL_3:
      mDictionary = self->mDictionary;
      CFDictionarySetValue(mDictionary, a4, a3);
      return;
    }
  }
  else
  {
    +[NSException raise:NSInvalidArgumentException, @"Attempt to insert nil value into %@", objc_opt_class() format];
    if (a4) {
      goto LABEL_3;
    }
  }
  int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CB828);
  }
  v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67110402;
    int v12 = v8;
    __int16 v13 = 2082;
    v14 = "-[CRLNoCopyDictionary setObject:forUncopiedKey:]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLNoCopyDictionary.m";
    __int16 v17 = 1024;
    int v18 = 72;
    __int16 v19 = 2048;
    v20 = self;
    __int16 v21 = 2112;
    id v22 = a3;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Inserting a value into no-copy dictionary with a NULL key into %p! Object is %@", buf, 0x36u);
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB848);
    }
  }
  v10 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101067028(v8, v10);
  }
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLNoCopyDictionary setObject:forUncopiedKey:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLNoCopyDictionary.m"), 72, 0, "Inserting a value into no-copy dictionary with a NULL key into %p! Object is %@", self, a3);
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->mDictionary);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4
{
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  unint64_t Count = CFDictionaryGetCount(self->mDictionary);
  if (Count >= a5) {
    unint64_t v10 = a5;
  }
  else {
    unint64_t v10 = Count;
  }
  if (v10) {
    BOOL v11 = ((unint64_t)a3 | (unint64_t)a4) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    mDictionary = self->mDictionary;
    CFDictionaryGetKeysAndValues(mDictionary, (const void **)a4, (const void **)a3);
  }
}

- (id)objectForKey:(id)a3
{
  if (a3) {
    return (id)CFDictionaryGetValue(self->mDictionary, a3);
  }
  else {
    return 0;
  }
}

- (id)allValues
{
  unint64_t Count = CFDictionaryGetCount(self->mDictionary);
  unint64_t v4 = Count;
  v5 = (const void **)values;
  if (Count >= 0x10) {
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  }
  CFDictionaryGetKeysAndValues(self->mDictionary, 0, v5);
  objc_super v6 = +[NSArray arrayWithObjects:v5 count:v4];
  if (v5 != (const void **)values) {
    free(v5);
  }
  return v6;
}

- (id)objectEnumerator
{
  id v2 = [(CRLNoCopyDictionary *)self allValues];

  return [v2 objectEnumerator];
}

- (id)allKeys
{
  unint64_t Count = CFDictionaryGetCount(self->mDictionary);
  unint64_t v4 = Count;
  v5 = (const void **)keys;
  if (Count >= 0x10) {
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  }
  CFDictionaryGetKeysAndValues(self->mDictionary, v5, 0);
  objc_super v6 = +[NSArray arrayWithObjects:v5 count:v4];
  if (v5 != (const void **)keys) {
    free(v5);
  }
  return v6;
}

- (id)keyEnumerator
{
  id v2 = [(CRLNoCopyDictionary *)self allKeys];

  return [v2 objectEnumerator];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t Count = CFDictionaryGetCount(self->mDictionary);
  if (a3->var0 >= Count) {
    return 0;
  }
  unint64_t v10 = Count;
  BOOL v11 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(self->mDictionary, v11, 0);
  if (v10 - a3->var0 < a5) {
    a5 = v10 - a3->var0;
  }
  memcpy(a4, &v11[a3->var0], 8 * a5);
  free(v11);
  a3->var0 += a5;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&a3->var2;
  return a5;
}

@end