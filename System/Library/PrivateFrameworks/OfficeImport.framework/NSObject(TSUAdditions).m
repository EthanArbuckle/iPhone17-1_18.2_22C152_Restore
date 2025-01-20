@interface NSObject(TSUAdditions)
+ (BOOL)tsu_overridesClassSelector:()TSUAdditions ofBaseClass:;
+ (BOOL)tsu_overridesSelector:()TSUAdditions ofBaseClass:;
+ (uint64_t)tsu_object:()TSUAdditions isEqualToObject:;
- (OITSUKVOToken)tsu_addObserver:()TSUAdditions forKeyPath:options:context:;
- (void)tsu_performSelector:()TSUAdditions withValue:;
- (void)tsu_removeObserverForToken:()TSUAdditions;
@end

@implementation NSObject(TSUAdditions)

+ (BOOL)tsu_overridesSelector:()TSUAdditions ofBaseClass:
{
  Method InstanceMethod = class_getInstanceMethod(a1, name);
  return InstanceMethod != class_getInstanceMethod(a4, name);
}

+ (BOOL)tsu_overridesClassSelector:()TSUAdditions ofBaseClass:
{
  Method ClassMethod = class_getClassMethod(a1, name);
  return ClassMethod != class_getClassMethod(a4, name);
}

- (void)tsu_performSelector:()TSUAdditions withValue:
{
  v7 = objc_msgSend(a1, "methodSignatureForSelector:");
  if (v7)
  {
    v8 = v7;
    if ([v7 numberOfArguments] == 3)
    {
      v9 = (const char *)[v8 getArgumentTypeAtIndex:2];
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
            v10 = a1;
            v11 = a3;
            goto LABEL_24;
          case 'f':
            [a4 floatValue];
            v10 = a1;
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
            v10 = a1;
            v11 = a3;
            goto LABEL_32;
          case 's':
            [a4 shortValue];
LABEL_36:
            v10 = a1;
            v11 = a3;
            goto LABEL_24;
          default:
            if (*v9 == 35)
            {
LABEL_10:
              v10 = a1;
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
                v14 = (void *)[MEMORY[0x263EFF958] invocationWithMethodSignature:v8];
                [v14 setTarget:a1];
                [v14 setSelector:a3];
                NSUInteger sizep = 0;
                NSGetSizeAndAlignment(v13, &sizep, 0);
                v15 = malloc_type_malloc(sizep, 0x7A44F819uLL);
                [a4 getValue:v15];
                [v14 setArgument:v15 atIndex:2];
                [v14 invoke];
                free(v15);
                return;
              }
            }
            v23 = (void *)MEMORY[0x263EFF940];
            uint64_t v24 = *MEMORY[0x263EFF4A0];
            v25 = NSString;
            uint64_t v26 = objc_opt_class();
            uint64_t v20 = [v25 stringWithFormat:@"*** -[%@ %@] first argument type does not match type of %@.", v26, NSStringFromSelector(a3), a4];
            v21 = v23;
            uint64_t v22 = v24;
            break;
        }
        break;
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x263EFF940];
      uint64_t v17 = *MEMORY[0x263EFF4A0];
      v18 = NSString;
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = [v18 stringWithFormat:@"*** -[%@ %@] does not take one argument.", v19, NSStringFromSelector(a3)];
      v21 = v16;
      uint64_t v22 = v17;
    }
    objc_exception_throw((id)[v21 exceptionWithName:v22 reason:v20 userInfo:0]);
  }
  [a1 doesNotRecognizeSelector:a3];
}

+ (uint64_t)tsu_object:()TSUAdditions isEqualToObject:
{
  if (a3 == a4) {
    return 1;
  }
  if (a3)
  {
    v4 = a3;
    v5 = a4;
    return [v4 isEqual:v5];
  }
  if (a4)
  {
    v4 = a4;
    v5 = 0;
    return [v4 isEqual:v5];
  }
  return 0;
}

- (OITSUKVOToken)tsu_addObserver:()TSUAdditions forKeyPath:options:context:
{
  v11 = [[OITSUKVOToken alloc] initWithObserver:a3 target:a1 keyPath:a4 context:a6];
  id AssociatedObject = objc_getAssociatedObject(a1, (const void *)TSUNSObjectKVOTokensKey);
  if (!AssociatedObject)
  {
    v14 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithObjects:", v11, 0);
    objc_setAssociatedObject(a1, (const void *)TSUNSObjectKVOTokensKey, v14, (void *)1);
LABEL_7:
    [a1 addObserver:a3 forKeyPath:a4 options:a5 context:a6];
    goto LABEL_8;
  }
  v13 = AssociatedObject;
  if (([AssociatedObject containsObject:v11] & 1) == 0)
  {
    [v13 addObject:v11];
    goto LABEL_7;
  }
  if (TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_7);
  }
LABEL_8:
  return v11;
}

- (void)tsu_removeObserverForToken:()TSUAdditions
{
  uint64_t v5 = objc_opt_class();
  result = (void *)TSUDynamicCast(v5, a3);
  if (result)
  {
    v7 = result;
    if ((void *)[result target] != a1)
    {
      uint64_t v8 = [NSString stringWithUTF8String:"-[NSObject(TSUAdditions) tsu_removeObserverForToken:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSObject_TSUAdditions.m"], 211, 0, "Attempted to stop key-value observing on %@ using a token that it was not associated with", a1);
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    id AssociatedObject = objc_getAssociatedObject(a1, (const void *)TSUNSObjectKVOTokensKey);
    result = (void *)[AssociatedObject containsObject:v7];
    if (result)
    {
      objc_msgSend((id)objc_msgSend(v7, "target"), "removeObserver:forKeyPath:context:", objc_msgSend(v7, "observer"), objc_msgSend(v7, "keyPath"), objc_msgSend(v7, "context"));
      return (void *)[AssociatedObject removeObject:v7];
    }
  }
  return result;
}

@end