@interface NSError(XCTErrors)
+ (id)_xct_error:()XCTErrors description:;
+ (id)_xct_error:()XCTErrors description:userInfo:;
@end

@implementation NSError(XCTErrors)

+ (id)_xct_error:()XCTErrors description:
{
  v17[1] = *MEMORY[0x263EF8340];
  v10 = (objc_class *)NSString;
  id v11 = a4;
  v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  uint64_t v16 = *MEMORY[0x263F08320];
  v17[0] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.dt.xctest.error" code:a3 userInfo:v13];

  return v14;
}

+ (id)_xct_error:()XCTErrors description:userInfo:
{
  id v11 = (objc_class *)NSString;
  id v12 = a5;
  id v13 = a4;
  v14 = (void *)[[v11 alloc] initWithFormat:v13 arguments:&a9];

  v15 = (void *)[v12 mutableCopy];
  [v15 setObject:v14 forKeyedSubscript:*MEMORY[0x263F08320]];
  uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.dt.xctest.error" code:a3 userInfo:v15];

  return v16;
}

@end