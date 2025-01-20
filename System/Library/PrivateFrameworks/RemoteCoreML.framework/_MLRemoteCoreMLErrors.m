@interface _MLRemoteCoreMLErrors
+ (id)clientTimeoutErrorForMethod:(id)a3;
+ (id)createErrorWithCode:(int64_t)a3 description:(id)a4;
@end

@implementation _MLRemoteCoreMLErrors

+ (id)createErrorWithCode:(int64_t)a3 description:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v15 = *MEMORY[0x263F08320];
  v16[0] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v8 = [v6 errorWithDomain:@"com.apple.remoteCoreML" code:a3 userInfo:v7];

  v9 = +[_MLLog common];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_238967000, v9, OS_LOG_TYPE_INFO, "%@ : %@", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

+ (id)clientTimeoutErrorForMethod:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@: Client call timeout.", a3];
  id v5 = [a1 createErrorWithCode:0 description:v4];

  return v5;
}

@end