@interface SSVURLDataConsumer
+ (id)consumer;
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SSVURLDataConsumer

+ (id)consumer
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v5 = a3;
  return v5;
}

@end