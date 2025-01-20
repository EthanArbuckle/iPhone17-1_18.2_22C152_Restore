@interface UMCommPageProvider
- (UMCommPageProvider)init;
@end

@implementation UMCommPageProvider

- (UMCommPageProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)UMCommPageProvider;
  v2 = [(UMCommPageProvider *)&v6 init];
  v3 = v2;
  if (v2)
  {
    sub_100019558(v2, (char *)&stru_1000D52D8);
    sub_10001956C(v3, (char *)&stru_1000D5318);
    v4 = v3;
  }

  return v3;
}

@end