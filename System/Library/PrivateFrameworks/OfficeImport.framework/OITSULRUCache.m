@interface OITSULRUCache
- (NSArray)allKeys;
- (NSArray)allValues;
- (OITSULRUCache)initWithMaxSize:(unint64_t)a3;
- (id)description;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)maxSize;
- (void)clearEvictionCallbackTarget;
- (void)dealloc;
- (void)p_removeOldestObject;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setEvictionCallbackTarget:(id)a3 selector:(SEL)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation OITSULRUCache

- (OITSULRUCache)initWithMaxSize:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OITSULRUCache;
  v4 = [(OITSULRUCache *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mMax = a3;
    v4->mData = [[OITSUNoCopyDictionary alloc] initWithCapacity:a3];
    v5->mOrderedKeys = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
  }
  return v5;
}

- (void)dealloc
{
  if (self->mCallbackTarget || self->mCallback)
  {
    uint64_t v3 = [NSString stringWithUTF8String:"-[OITSULRUCache dealloc]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSULRUCache.m"], 49, 0, "cache callback target and selector must be clear before cache is deallocated");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }

  v4.receiver = self;
  v4.super_class = (Class)OITSULRUCache;
  [(OITSULRUCache *)&v4 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)OITSULRUCache;
  return (id)[NSString stringWithFormat:@"<%@ ordered keys: %@, data: %@>", -[OITSULRUCache description](&v3, sel_description), self->mOrderedKeys, self->mData];
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->mOrderedKeys count];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableArray *)self->mOrderedKeys count] >= self->mMax) {
    [(OITSULRUCache *)self p_removeOldestObject];
  }
  uint64_t v8 = [(NSMutableArray *)self->mOrderedKeys indexOfObject:a4];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->mOrderedKeys removeObjectAtIndex:v8];
  }
  [(OITSUNoCopyDictionary *)self->mData setObject:a3 forKey:a4];
  [(NSMutableArray *)self->mOrderedKeys addObject:a4];
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v5 = -[NSMutableArray indexOfObject:](self->mOrderedKeys, "indexOfObject:");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    [(OITSUNoCopyDictionary *)self->mData removeObjectForKey:a3];
    mOrderedKeys = self->mOrderedKeys;
    [(NSMutableArray *)mOrderedKeys removeObjectAtIndex:v6];
  }
}

- (void)removeAllObjects
{
  [(NSMutableArray *)self->mOrderedKeys removeAllObjects];
  mData = self->mData;
  [(OITSUNoCopyDictionary *)mData removeAllObjects];
}

- (id)objectForKey:(id)a3
{
  uint64_t v5 = -[NSMutableArray indexOfObject:](self->mOrderedKeys, "indexOfObject:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v7 = v5;
  id v8 = [(OITSUNoCopyDictionary *)self->mData objectForKey:a3];
  id v9 = a3;
  [(NSMutableArray *)self->mOrderedKeys addObject:a3];
  [(NSMutableArray *)self->mOrderedKeys removeObjectAtIndex:v7];

  return v8;
}

- (NSArray)allValues
{
  return (NSArray *)[(OITSUNoCopyDictionary *)self->mData allValues];
}

- (NSArray)allKeys
{
  return &self->mOrderedKeys->super;
}

- (void)setEvictionCallbackTarget:(id)a3 selector:(SEL)a4
{
  self->mCallbackTarget = a3;
  if (a4) {
    objc_super v4 = a4;
  }
  else {
    objc_super v4 = 0;
  }
  self->mCallback = v4;
}

- (void)clearEvictionCallbackTarget
{
  self->mCallbackTarget = 0;
  self->mCallback = 0;
}

- (void)p_removeOldestObject
{
  uint64_t v3 = [(NSMutableArray *)self->mOrderedKeys objectAtIndex:0];
  if (self->mCallbackTarget)
  {
    if (!self->mCallback)
    {
      uint64_t v4 = [NSString stringWithUTF8String:"-[OITSULRUCache p_removeOldestObject]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSULRUCache.m"], 148, 0, "invalid nil value for '%{public}s'", "mCallback");
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    id v5 = [(OITSUNoCopyDictionary *)self->mData objectForKey:v3];
    if (self->mCallback) {
      SEL mCallback = self->mCallback;
    }
    else {
      SEL mCallback = 0;
    }
    [self->mCallbackTarget performSelector:mCallback withObject:v5 withObject:v3];
  }
  [(OITSUNoCopyDictionary *)self->mData removeObjectForKey:v3];
  mOrderedKeys = self->mOrderedKeys;
  [(NSMutableArray *)mOrderedKeys removeObjectAtIndex:0];
}

- (unint64_t)maxSize
{
  return self->mMax;
}

@end