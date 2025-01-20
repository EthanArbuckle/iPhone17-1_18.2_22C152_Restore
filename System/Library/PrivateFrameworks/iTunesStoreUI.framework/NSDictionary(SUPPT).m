@interface NSDictionary(SUPPT)
- (NSString)setupSelector;
- (NSString)testSelector;
- (uint64_t)iterations;
- (uint64_t)offset;
- (uint64_t)scriptEntry;
- (uint64_t)scriptPath;
@end

@implementation NSDictionary(SUPPT)

- (uint64_t)iterations
{
  v1 = (void *)[a1 objectForKey:@"iterations"];

  return [v1 intValue];
}

- (uint64_t)offset
{
  v1 = (void *)[a1 objectForKey:@"offset"];

  return [v1 floatValue];
}

- (NSString)setupSelector
{
  result = (NSString *)[a1 objectForKey:@"setupSelector"];
  if (result)
  {
    return (NSString *)NSSelectorFromString(result);
  }
  return result;
}

- (NSString)testSelector
{
  result = (NSString *)[a1 objectForKey:@"testSelector"];
  if (result)
  {
    return (NSString *)NSSelectorFromString(result);
  }
  return result;
}

- (uint64_t)scriptPath
{
  return [a1 objectForKey:@"scriptPath"];
}

- (uint64_t)scriptEntry
{
  return [a1 objectForKey:@"scriptEntry"];
}

@end