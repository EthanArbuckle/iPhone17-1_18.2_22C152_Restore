@interface NSMutableArray(IC)
+ (id)ic_arrayFromNonNilObject:()IC;
- (void)ic_addNonNilObject:()IC;
- (void)ic_addObjectsFromNonNilArray:()IC;
- (void)ic_insertNonNilObject:()IC atIndex:;
@end

@implementation NSMutableArray(IC)

- (void)ic_addObjectsFromNonNilArray:()IC
{
  if (a3) {
    return objc_msgSend(a1, "addObjectsFromArray:");
  }
  return a1;
}

- (void)ic_addNonNilObject:()IC
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

+ (id)ic_arrayFromNonNilObject:()IC
{
  v4.receiver = a1;
  v4.super_class = (Class)&off_26C150D68;
  v1 = objc_msgSendSuper2(&v4, sel_ic_arrayFromNonNilObject_);
  v2 = (void *)[v1 mutableCopy];

  return v2;
}

- (void)ic_insertNonNilObject:()IC atIndex:
{
  id v8 = a3;
  if ((a4 & 0x8000000000000000) != 0)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[NSMutableArray(IC) ic_insertNonNilObject:atIndex:]", 1, 0, @"Trying to insert object in mutableArray at negative index %ld", a4, v7);
  }
  else if ([a1 count] >= a4)
  {
    v6 = v8;
    if (!v8) {
      goto LABEL_9;
    }
    [a1 insertObject:v8 atIndex:a4];
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[NSMutableArray(IC) ic_insertNonNilObject:atIndex:]", 1, 0, @"Trying to insert object in mutableArray at index (%ld) greater than count (%ld)", a4, [a1 count]);
  }
  v6 = v8;
LABEL_9:
}

@end