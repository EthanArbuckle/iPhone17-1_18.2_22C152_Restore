@interface OITSUKVOToken
- (BOOL)isEqual:(id)a3;
- (NSObject)observer;
- (NSObject)target;
- (NSString)keyPath;
- (OITSUKVOToken)init;
- (OITSUKVOToken)initWithObserver:(id)a3 target:(id)a4 keyPath:(id)a5 context:(void *)a6;
- (unint64_t)hash;
- (void)context;
- (void)dealloc;
@end

@implementation OITSUKVOToken

- (OITSUKVOToken)init
{
  uint64_t v2 = [NSString stringWithUTF8String:"-[OITSUKVOToken init]"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSObject_TSUAdditions.m"], 249, 0, "Do not call method");
  +[OITSUAssertionHandler logBacktraceThrottled];
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[OITSUKVOToken init]"), 0 reason userInfo]);
}

- (OITSUKVOToken)initWithObserver:(id)a3 target:(id)a4 keyPath:(id)a5 context:(void *)a6
{
  v13.receiver = self;
  v13.super_class = (Class)OITSUKVOToken;
  v10 = [(OITSUKVOToken *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_observer = a3;
    v10->_target = a4;
    v10->_keyPath = (NSString *)[a5 copy];
    v11->_context = a6;
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUKVOToken;
  [(OITSUKVOToken *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    v6 = (void *)TSUDynamicCast(v5, (uint64_t)a3);
    if (v6)
    {
      v7 = v6;
      context = self->_context;
      if (context == (void *)[v6 context]
        && (observer = self->_observer, observer == [v7 observer]))
      {
        keyPath = self->_keyPath;
        uint64_t v11 = [v7 keyPath];
        LOBYTE(v6) = [(NSString *)keyPath isEqualToString:v11];
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
  }
  return (char)v6;
}

- (unint64_t)hash
{
  observer = self->_observer;
  return [(NSString *)self->_keyPath hash] ^ (unint64_t)observer ^ (unint64_t)self->_context;
}

- (NSObject)observer
{
  return self->_observer;
}

- (NSObject)target
{
  return self->_target;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)context
{
  return self->_context;
}

@end