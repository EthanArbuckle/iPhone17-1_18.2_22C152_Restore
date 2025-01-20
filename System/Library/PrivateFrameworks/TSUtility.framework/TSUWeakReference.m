@interface TSUWeakReference
+ (id)weakReferenceWithObject:(id)a3;
- (TSUWeakReference)init;
- (TSUWeakReference)initWithObject:(id)a3;
- (id)object;
- (void)dealloc;
@end

@implementation TSUWeakReference

- (TSUWeakReference)initWithObject:(id)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSUWeakReference;
    v4 = [(TSUWeakReference *)&v7 init];
    v5 = v4;
    if (v4) {
      objc_storeWeak(&v4->mObject, a3);
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

+ (id)weakReferenceWithObject:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithObject:a3];
  return v3;
}

- (TSUWeakReference)init
{
  id v2 = +[TSUAssertionHandler currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSUWeakReference init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUWeakReference.m"), 34, @"Do not call method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[TSUWeakReference init]"), 0 reason userInfo]);
}

- (void)dealloc
{
  objc_storeWeak(&self->mObject, 0);
  v3.receiver = self;
  v3.super_class = (Class)TSUWeakReference;
  [(TSUWeakReference *)&v3 dealloc];
}

- (id)object
{
  return objc_loadWeak(&self->mObject);
}

@end