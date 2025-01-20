@interface SXComponentMergerClassProvider
- (Class)classForObject:(id)a3 specVersion:(id)a4;
@end

@implementation SXComponentMergerClassProvider

- (Class)classForObject:(id)a3 specVersion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[SXJSONObjectComponentSupport shared];
  v8 = [v7 objectValueClassBlock];

  uint64_t v9 = objc_opt_class();
  v10 = ((void (**)(void, id, uint64_t, id))v8)[2](v8, v6, v9, v5);

  return (Class)v10;
}

@end