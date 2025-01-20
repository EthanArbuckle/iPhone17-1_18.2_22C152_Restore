@interface QLURLItemTransformer
+ (id)allowedOutputClasses;
- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation QLURLItemTransformer

+ (id)allowedOutputClasses
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  id v5 = a3;
  return v5;
}

@end