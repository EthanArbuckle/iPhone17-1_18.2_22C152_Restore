@interface OITSUWeakReference
+ (id)weakReferenceWithObject:(id)a3;
- (OITSUWeakReference)init;
- (OITSUWeakReference)initWithObject:(id)a3;
- (id)object;
- (void)dealloc;
@end

@implementation OITSUWeakReference

+ (id)weakReferenceWithObject:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithObject:a3];
  return v3;
}

- (OITSUWeakReference)initWithObject:(id)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)OITSUWeakReference;
    v4 = [(OITSUWeakReference *)&v7 init];
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

- (OITSUWeakReference)init
{
  uint64_t v2 = [NSString stringWithUTF8String:"-[OITSUWeakReference init]"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUWeakReference.m"], 37, 0, "Do not call method");
  +[OITSUAssertionHandler logBacktraceThrottled];
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[OITSUWeakReference init]"), 0 reason userInfo]);
}

- (void)dealloc
{
  objc_storeWeak(&self->mObject, 0);
  v3.receiver = self;
  v3.super_class = (Class)OITSUWeakReference;
  [(OITSUWeakReference *)&v3 dealloc];
}

- (id)object
{
  return objc_loadWeak(&self->mObject);
}

@end