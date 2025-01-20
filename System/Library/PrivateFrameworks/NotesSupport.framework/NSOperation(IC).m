@interface NSOperation(IC)
- (id)ic_loggingValues;
- (uint64_t)ic_loggingIdentifier;
- (uint64_t)ic_resistsCancellation;
- (void)ic_setResistsCancellation:()IC;
@end

@implementation NSOperation(IC)

- (uint64_t)ic_loggingIdentifier
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%p", a1);
}

- (id)ic_loggingValues
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = [a1 name];

  if (v3)
  {
    v4 = [a1 name];
    [v2 setObject:v4 forKeyedSubscript:@"name"];
  }
  if ([a1 isExecuting])
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isExecuting"));
    [v2 setObject:v5 forKeyedSubscript:@"isExecuting"];
  }
  if ([a1 isFinished])
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isFinished"));
    [v2 setObject:v6 forKeyedSubscript:@"isFinished"];
  }
  return v2;
}

- (uint64_t)ic_resistsCancellation
{
  v1 = objc_getAssociatedObject(a1, &ICNSOperationResistsCancellation);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)ic_setResistsCancellation:()IC
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &ICNSOperationResistsCancellation, v2, (void *)3);
}

@end