@interface NSDictionary
- (BOOL)crl_enumerateBoardItemNestedRecursivelyUsingBlock:(id)a3;
@end

@implementation NSDictionary

- (BOOL)crl_enumerateBoardItemNestedRecursivelyUsingBlock:(id)a3
{
  v4 = (uint64_t (**)(id, NSDictionary *))a3;
  if (v4[2](v4, self))
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v6 = [(NSDictionary *)self objectForKeyedSubscript:@"groupChildren"];
    unsigned __int8 v5 = [v6 crl_enumerateAllBoardItemsNestedRecursivelyUsingBlock:v4];
  }
  return v5;
}

@end