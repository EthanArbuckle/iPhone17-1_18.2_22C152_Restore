@interface MKGETPlaceholderRouter
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
@end

@implementation MKGETPlaceholderRouter

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  id v6 = a5;
  v7 = [a4 headers];
  v8 = [v7 path];
  v9 = [v8 pathComponents];
  if ((unint64_t)[v9 count] < 3)
  {
    v10 = 0;
    uint64_t v11 = 0;
    if ([0 isEqualToString:@"/"]) {
      goto LABEL_8;
    }
  }
  else
  {
    v10 = [v9 objectAtIndexedSubscript:2];
    if ([v10 isEqualToString:@"/"])
    {
      uint64_t v11 = 0;
LABEL_8:

      goto LABEL_9;
    }
    if (v10)
    {
      v12 = [[MKPlaceholder alloc] initWithBundleIdentifier:v10];
      uint64_t v11 = [(MKPlaceholder *)v12 enabled];

      goto LABEL_8;
    }
    uint64_t v11 = 0;
  }
LABEL_9:
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v14 = [NSNumber numberWithBool:v11];
  [v13 setObject:v14 forKey:@"enabled"];

  id v18 = 0;
  v15 = [MEMORY[0x263F08900] dataWithJSONObject:v13 options:0 error:&v18];
  id v16 = v18;
  if (v16)
  {
    v17 = +[MKLog log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MKGETStatusRouter server:didReceiveRequest:response:]((uint64_t)v16, v17);
    }
  }
  [v6 setBody:v15];
}

@end