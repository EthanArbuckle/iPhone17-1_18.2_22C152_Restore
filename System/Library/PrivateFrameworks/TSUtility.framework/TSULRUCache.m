@interface TSULRUCache
- (TSULRUCache)initWithMaxSize:(unint64_t)a3;
- (id)allKeys;
- (id)allValues;
- (id)objectForKey:(id)a3;
- (unint64_t)maxSize;
- (void)clearEvictionCallbackTarget;
- (void)dealloc;
- (void)p_removeOldestObject;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setEvictionCallbackTarget:(id)a3 selector:(SEL)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation TSULRUCache

- (TSULRUCache)initWithMaxSize:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSULRUCache;
  v4 = [(TSULRUCache *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mMax = a3;
    v4->mData = [[TSUNoCopyDictionary alloc] initWithCapacity:a3];
    v5->mOrderedKeys = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
  }
  return v5;
}

- (void)dealloc
{
  if (self->mCallbackTarget || self->mCallback)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSULRUCache dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULRUCache.m"), 41, @"cache callback target and selector must be clear before cache is deallocated");
  }

  v5.receiver = self;
  v5.super_class = (Class)TSULRUCache;
  [(TSULRUCache *)&v5 dealloc];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableArray *)self->mOrderedKeys count] >= self->mMax) {
    [(TSULRUCache *)self p_removeOldestObject];
  }
  uint64_t v8 = [(NSMutableArray *)self->mOrderedKeys indexOfObject:a4];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->mOrderedKeys removeObjectAtIndex:v8];
  }
  [(TSUNoCopyDictionary *)self->mData setObject:a3 forKey:a4];
  [(NSMutableArray *)self->mOrderedKeys addObject:a4];
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v5 = -[NSMutableArray indexOfObject:](self->mOrderedKeys, "indexOfObject:");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    [(TSUNoCopyDictionary *)self->mData removeObjectForKey:a3];
    mOrderedKeys = self->mOrderedKeys;
    [(NSMutableArray *)mOrderedKeys removeObjectAtIndex:v6];
  }
}

- (void)removeAllObjects
{
  [(NSMutableArray *)self->mOrderedKeys removeAllObjects];
  mData = self->mData;
  [(TSUNoCopyDictionary *)mData removeAllObjects];
}

- (id)objectForKey:(id)a3
{
  uint64_t v5 = -[NSMutableArray indexOfObject:](self->mOrderedKeys, "indexOfObject:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v7 = v5;
  id v8 = [(TSUNoCopyDictionary *)self->mData objectForKey:a3];
  id v9 = a3;
  [(NSMutableArray *)self->mOrderedKeys addObject:a3];
  [(NSMutableArray *)self->mOrderedKeys removeObjectAtIndex:v7];

  return v8;
}

- (id)allValues
{
  return [(TSUNoCopyDictionary *)self->mData allValues];
}

- (id)allKeys
{
  return self->mOrderedKeys;
}

- (void)setEvictionCallbackTarget:(id)a3 selector:(SEL)a4
{
  self->mCallbackTarget = a3;
  if (a4) {
    uint64_t v4 = a4;
  }
  else {
    uint64_t v4 = 0;
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
      id v4 = +[TSUAssertionHandler currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSULRUCache p_removeOldestObject]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULRUCache.m"), 141, @"invalid nil value for '%s'", "mCallback");
    }
    id v6 = [(TSUNoCopyDictionary *)self->mData objectForKey:v3];
    if (self->mCallback) {
      SEL mCallback = self->mCallback;
    }
    else {
      SEL mCallback = 0;
    }
    [self->mCallbackTarget performSelector:mCallback withObject:v6 withObject:v3];
  }
  [(TSUNoCopyDictionary *)self->mData removeObjectForKey:v3];
  mOrderedKeys = self->mOrderedKeys;
  [(NSMutableArray *)mOrderedKeys removeObjectAtIndex:0];
}

- (unint64_t)maxSize
{
  return self->mMax;
}

@end