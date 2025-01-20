@interface FCVanityURLRedirectService
- (id)backgroundFetchWithAppConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation FCVanityURLRedirectService

- (id)backgroundFetchWithAppConfiguration:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003BD54;
  v7[3] = &unk_1000C6E28;
  id v8 = a4;
  id v5 = v8;
  [(FCVanityURLRedirectService *)self updateUnderlyingMappingWithQualityOfService:9 completion:v7];

  return 0;
}

@end