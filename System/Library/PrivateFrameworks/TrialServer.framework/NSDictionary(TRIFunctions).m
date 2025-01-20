@interface NSDictionary(TRIFunctions)
- (id)tri_contextValueWithName:()TRIFunctions;
@end

@implementation NSDictionary(TRIFunctions)

- (id)tri_contextValueWithName:()TRIFunctions
{
  id v4 = a3;
  uint64_t v5 = [a1 objectForKeyedSubscript:v4];
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    v9 = [NSString stringWithFormat:@"The expression context doesn't contain the key %@", v4];
    id v10 = [v8 exceptionWithName:@"KeyNotFoundException" reason:v9 userInfo:0];

    objc_exception_throw(v10);
  }
  v6 = (void *)v5;

  return v6;
}

@end