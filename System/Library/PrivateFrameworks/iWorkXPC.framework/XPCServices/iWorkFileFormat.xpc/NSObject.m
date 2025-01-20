@interface NSObject
+ (BOOL)tsu_object:(id)a3 isEqualToObject:(id)a4;
+ (BOOL)tsu_overridesClassSelector:(SEL)a3 ofBaseClass:(Class)a4;
+ (BOOL)tsu_overridesSelector:(SEL)a3 ofBaseClass:(Class)a4;
- (id)tsu_addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)tsu_performSelector:(SEL)a3 withValue:(id)a4;
- (void)tsu_removeObserverForToken:(id)a3;
- (void)tsu_runBlock;
@end

@implementation NSObject

+ (BOOL)tsu_overridesSelector:(SEL)a3 ofBaseClass:(Class)a4
{
  Method InstanceMethod = class_getInstanceMethod((Class)a1, a3);
  return InstanceMethod != class_getInstanceMethod(a4, a3);
}

+ (BOOL)tsu_overridesClassSelector:(SEL)a3 ofBaseClass:(Class)a4
{
  Method ClassMethod = class_getClassMethod((Class)a1, a3);
  return ClassMethod != class_getClassMethod(a4, a3);
}

- (void)tsu_performSelector:(SEL)a3 withValue:(id)a4
{
  v7 = -[NSObject methodSignatureForSelector:](self, "methodSignatureForSelector:");
  if (v7)
  {
    v8 = v7;
    if ((id)[(NSMethodSignature *)v7 numberOfArguments] == (id)3)
    {
      v9 = [(NSMethodSignature *)v8 getArgumentTypeAtIndex:2];
      while (2)
      {
        switch(*v9)
        {
          case '@':
            goto LABEL_10;
          case 'A':
          case 'D':
          case 'E':
          case 'F':
          case 'G':
          case 'H':
          case 'J':
          case 'K':
          case 'M':
          case 'P':
          case 'T':
          case 'U':
          case 'W':
          case 'X':
          case 'Y':
          case 'Z':
          case '[':
          case '\\':
          case ']':
          case '_':
          case 'a':
          case 'b':
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'p':
            goto LABEL_11;
          case 'B':
            [a4 BOOLValue];
            goto LABEL_36;
          case 'C':
            [a4 unsignedCharValue];
            goto LABEL_36;
          case 'I':
            [a4 unsignedIntValue];
            goto LABEL_36;
          case 'L':
            [a4 unsignedLongValue];
            goto LABEL_31;
          case 'N':
          case 'O':
          case 'R':
          case 'V':
          case 'n':
          case 'o':
          case 'r':
            ++v9;
            continue;
          case 'Q':
            [a4 unsignedLongLongValue];
            goto LABEL_31;
          case 'S':
            [a4 unsignedShortValue];
            goto LABEL_36;
          case '^':
            [a4 pointerValue];
            goto LABEL_31;
          case 'c':
            [a4 charValue];
            goto LABEL_36;
          case 'd':
            [a4 doubleValue];
            v10 = self;
            v11 = a3;
            goto LABEL_24;
          case 'f':
            [a4 floatValue];
            v10 = self;
            v11 = a3;
            goto LABEL_24;
          case 'i':
            [a4 intValue];
            goto LABEL_36;
          case 'l':
            [a4 longValue];
            goto LABEL_31;
          case 'q':
            [a4 longLongValue];
LABEL_31:
            v10 = self;
            v11 = a3;
            goto LABEL_32;
          case 's':
            [a4 shortValue];
LABEL_36:
            v10 = self;
            v11 = a3;
            goto LABEL_24;
          default:
            if (*v9 == 35)
            {
LABEL_10:
              v10 = self;
              v11 = a3;
LABEL_32:
LABEL_24:
              [v10 v11];
              return;
            }
LABEL_11:
            v12 = (const char *)[a4 objCType];
            if (v12)
            {
              v13 = v12;
              if (!strcmp(v9, v12))
              {
                v14 = +[NSInvocation invocationWithMethodSignature:v8];
                [(NSInvocation *)v14 setTarget:self];
                [(NSInvocation *)v14 setSelector:a3];
                NSUInteger sizep = 0;
                NSGetSizeAndAlignment(v13, &sizep, 0);
                v15 = malloc_type_malloc(sizep, 0x7A44F819uLL);
                [a4 getValue:v15];
                [(NSInvocation *)v14 setArgument:v15 atIndex:2];
                [(NSInvocation *)v14 invoke];
                free(v15);
                return;
              }
            }
            uint64_t v19 = objc_opt_class();
            v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[%@ %@] first argument type does not match type of %@.", v19, NSStringFromSelector(a3), a4);
            NSExceptionName v18 = NSInvalidArgumentException;
            break;
        }
        break;
      }
    }
    else
    {
      uint64_t v16 = objc_opt_class();
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** -[%@ %@] does not take one argument.", v16, NSStringFromSelector(a3));
      NSExceptionName v18 = NSInvalidArgumentException;
    }
    objc_exception_throw(+[NSException exceptionWithName:v18 reason:v17 userInfo:0]);
  }
  [self doesNotRecognizeSelector:a3];
}

+ (BOOL)tsu_object:(id)a3 isEqualToObject:(id)a4
{
  if (a3 == a4) {
    return 1;
  }
  if (a3)
  {
    id v4 = a3;
    id v5 = a4;
    return [v4 isEqual:v5];
  }
  if (a4)
  {
    id v4 = a4;
    id v5 = 0;
    return [v4 isEqual:v5];
  }
  return 0;
}

- (id)tsu_addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  v11 = [[TSUKVOToken alloc] initWithObserver:a3 target:self keyPath:a4 context:a6];
  id AssociatedObject = objc_getAssociatedObject(self, off_1001EA2B8);
  if (!AssociatedObject)
  {
    v15 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", v11, 0);
    objc_setAssociatedObject(self, off_1001EA2B8, v15, (void *)1);
LABEL_9:
    [self addObserver:a3 forKeyPath:a4 options:a5 context:a6];
    return v11;
  }
  v13 = AssociatedObject;
  if (([AssociatedObject containsObject:v11] & 1) == 0)
  {
    [v13 addObject:v11];
    goto LABEL_9;
  }
  if (TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &stru_1001CBCE8);
  }
  v14 = TSUDefaultCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413058;
    id v18 = a3;
    __int16 v19 = 2112;
    v20 = self;
    __int16 v21 = 2112;
    id v22 = a4;
    __int16 v23 = 2048;
    v24 = a6;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ is already observing %@ for key path %@ using context %p", buf, 0x2Au);
  }
  return v11;
}

- (void)tsu_removeObserverForToken:(id)a3
{
  uint64_t v5 = objc_opt_class();
  v6 = (void *)TSUDynamicCast(v5, (uint64_t)a3);
  if (v6)
  {
    v7 = v6;
    if ([v6 target] != self)
    {
      int v8 = +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CBD08);
      }
      v9 = TSUAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_1001643C8((uint64_t)self, v8, v9);
      }
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:"[(NSObject(TSUAdditions) *)NSString tsu_removeObserverForToken:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSObject_TSUAdditions.m"], 211, 0, "Attempted to stop key-value observing on %@ using a token that it was not associated with"", self];
      +[TSUAssertionHandler logBacktraceThrottled];
    }
    id AssociatedObject = objc_getAssociatedObject(self, off_1001EA2B8);
    if ([AssociatedObject containsObject:v7])
    {
      objc_msgSend(objc_msgSend(v7, "target"), "removeObserver:forKeyPath:context:", objc_msgSend(v7, "observer"), objc_msgSend(v7, "keyPath"), objc_msgSend(v7, "context"));
      [AssociatedObject removeObject:v7];
    }
  }
}

- (void)tsu_runBlock
{
}

@end