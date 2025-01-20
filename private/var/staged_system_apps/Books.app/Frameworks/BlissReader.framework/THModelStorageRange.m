@interface THModelStorageRange
+ (id)storageRangeWithStorage:(id)a3 range:(_NSRange)a4 context:(id)a5;
- (THModelStorageRange)initWithStorage:(id)a3 range:(_NSRange)a4 context:(id)a5;
- (TSWPStorage)storage;
- (_NSRange)range;
- (void)dealloc;
- (void)setRange:(_NSRange)a3;
- (void)setStorage:(id)a3;
@end

@implementation THModelStorageRange

- (TSWPStorage)storage
{
  return self->mStorage;
}

- (void)setStorage:(id)a3
{
  [(THModelStorageRange *)self willModify];
  id v5 = a3;

  self->mStorage = (TSWPStorage *)a3;
}

- (_NSRange)range
{
  p_mRange = &self->mRange;
  NSUInteger location = self->mRange.location;
  NSUInteger length = p_mRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(THModelStorageRange *)self willModify];
  self->mRange.NSUInteger location = location;
  self->mRange.NSUInteger length = length;
}

+ (id)storageRangeWithStorage:(id)a3 range:(_NSRange)a4 context:(id)a5
{
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithStorage:a3 range:a4.location, a4.length, a5];

  return v5;
}

- (THModelStorageRange)initWithStorage:(id)a3 range:(_NSRange)a4 context:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v12.receiver = self;
  v12.super_class = (Class)THModelStorageRange;
  v8 = [(THModelStorageRange *)&v12 initWithContext:a5];
  v9 = v8;
  if (v8)
  {
    id v10 = [(THModelStorageRange *)v8 context];
    if (v10 != [a3 context]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelStorageRange initWithStorage:range:context:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelStorageRange.m") lineNumber:36 description:@"Creating a range in a storage from a different TSPObjectContext."];
    }
    v9->mStorage = (TSWPStorage *)a3;
    v9->mRange.NSUInteger location = location;
    v9->mRange.NSUInteger length = length;
  }
  return v9;
}

- (void)dealloc
{
  self->mStorage = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelStorageRange;
  [(THModelStorageRange *)&v3 dealloc];
}

@end