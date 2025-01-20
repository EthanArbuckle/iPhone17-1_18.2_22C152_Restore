@interface NUApplicationURLHandler
- (void)openURL:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation NUApplicationURLHandler

- (void)openURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v14 = a3;
  v7 = (void (**)(id, uint64_t))a5;
  v8 = (void *)MEMORY[0x263F1C408];
  id v9 = a4;
  v10 = [v8 sharedApplication];
  v11 = (void *)[v9 mutableCopy];

  [v11 setObject:MEMORY[0x263EFFA88] forKey:@"urlWasOpenedFromNews"];
  if (objc_msgSend(v14, "fc_isNewsURL")
    && ([v10 delegate],
        v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 application:v10 openURL:v14 options:v11],
        v12,
        v13))
  {
    if (v7) {
      v7[2](v7, 1);
    }
  }
  else
  {
    [v10 openURL:v14 options:v11 completionHandler:v7];
  }
}

@end