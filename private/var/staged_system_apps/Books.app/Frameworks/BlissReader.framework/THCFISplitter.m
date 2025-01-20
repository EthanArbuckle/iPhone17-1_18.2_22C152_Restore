@interface THCFISplitter
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (THCFISplitter)init;
- (id)storageIDFromCFI:(id)a3;
- (unint64_t)retainCount;
- (void)dealloc;
@end

@implementation THCFISplitter

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___THCFISplitter;
  return [super allocWithZone:0];
}

+ (id)sharedInstance
{
  id result = (id)qword_5732E0;
  if (!qword_5732E0)
  {
    objc_sync_enter(a1);
    if (!qword_5732E0)
    {
      id v4 = objc_msgSend(objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      qword_5732E0 = (uint64_t)v4;
      if (!v4) {
        [+[TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THCFISplitter sharedInstance]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationTextLocator.m") lineNumber:151 description:@"Couldn't create singleton instance of %@", a1];
      }
    }
    objc_sync_exit(a1);
    return (id)qword_5732E0;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (THCFISplitter)init
{
  v4.receiver = self;
  v4.super_class = (Class)THCFISplitter;
  v2 = [(THCFISplitter *)&v4 init];
  if (v2) {
    v2->_regex = (NSRegularExpression *)[objc_alloc((Class)NSRegularExpression) initWithPattern:@"\\[([a-zA-Z0-9-]+)\\]" options:0 error:0];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THCFISplitter;
  [(THCFISplitter *)&v3 dealloc];
}

- (id)storageIDFromCFI:(id)a3
{
  objc_super v4 = -[NSRegularExpression firstMatchInString:options:range:](self->_regex, "firstMatchInString:options:range:", a3, 0, 0, [a3 length]);
  if ([(NSTextCheckingResult *)v4 numberOfRanges] < 2) {
    return 0;
  }
  v5 = (char *)[(NSTextCheckingResult *)v4 rangeAtIndex:1];
  unint64_t v7 = v6;
  if (v6 >= 2
    && [a3 characterAtIndex:v5] == 112
    && [a3 characterAtIndex:v5 + 1] - 58 > 0xFFFFFFF5)
  {
    return 0;
  }

  return [a3 substringWithRange:v5, v7];
}

@end