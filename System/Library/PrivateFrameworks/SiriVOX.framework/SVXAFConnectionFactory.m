@interface SVXAFConnectionFactory
- (id)createWithDispatchQueue:(id)a3 instanceContext:(id)a4;
@end

@implementation SVXAFConnectionFactory

- (id)createWithDispatchQueue:(id)a3 instanceContext:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F284A0];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithTargetQueue:v7 instanceContext:v6];

  return v8;
}

@end