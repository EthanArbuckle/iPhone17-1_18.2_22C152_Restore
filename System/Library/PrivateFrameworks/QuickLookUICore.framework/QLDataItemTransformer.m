@interface QLDataItemTransformer
+ (id)allowedOutputClasses;
- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation QLDataItemTransformer

+ (id)allowedOutputClasses
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
}

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v5 = a3;
  return v5;
}

@end