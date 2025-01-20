@interface NSData(RadioRequestAdditions)
+ (id)dataForRadioRequestParameters:()RadioRequestAdditions protocolVersion:isAsynchronousBackgroundRequest:error:;
+ (uint64_t)dataForRadioRequestParameters:()RadioRequestAdditions isAsynchronousBackgroundRequest:error:;
- (id)propertyListForRadioResponseReturningError:()RadioRequestAdditions unparsedResponseDictionary:;
- (uint64_t)propertyListForRadioResponseReturningError:()RadioRequestAdditions;
@end

@implementation NSData(RadioRequestAdditions)

+ (id)dataForRadioRequestParameters:()RadioRequestAdditions protocolVersion:isAsynchronousBackgroundRequest:error:
{
  v9 = (objc_class *)MEMORY[0x263EFF9A0];
  id v10 = a3;
  id v11 = [v9 alloc];
  if (a5) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 2;
  }
  v13 = (void *)[v11 initWithCapacity:v12];
  v14 = v13;
  if (v10) {
    id v15 = v10;
  }
  else {
    id v15 = (id)MEMORY[0x263EFFA78];
  }
  [v13 setObject:v15 forKey:@"content"];

  v16 = [NSNumber numberWithInt:a4];
  [v14 setObject:v16 forKey:@"version"];

  if (a5) {
    [v14 setObject:MEMORY[0x263EFFA88] forKey:@"is-async"];
  }
  v17 = [MEMORY[0x263F08AC0] dataWithPropertyList:v14 format:200 options:0 error:a6];

  return v17;
}

+ (uint64_t)dataForRadioRequestParameters:()RadioRequestAdditions isAsynchronousBackgroundRequest:error:
{
  return [a1 dataForRadioRequestParameters:a3 protocolVersion:3 isAsynchronousBackgroundRequest:a4 error:a5];
}

- (id)propertyListForRadioResponseReturningError:()RadioRequestAdditions unparsedResponseDictionary:
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v6 = [MEMORY[0x263F08AC0] propertyListWithData:a1 options:0 format:0 error:a3];
  objc_opt_class();
  v7 = 0;
  if (objc_opt_isKindOfClass())
  {
    if (a4) {
      *a4 = v6;
    }
    v8 = [v6 objectForKey:@"version"];
    if ((objc_opt_respondsToSelector() & 1) != 0 && (int)[v8 intValue] >= 1)
    {
      v7 = [v6 objectForKey:@"content"];
    }
    else
    {
      v9 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412546;
        v13 = v8;
        __int16 v14 = 2112;
        id v15 = (id)objc_opt_class();
        id v10 = v15;
        _os_log_impl(&dword_21B56B000, v9, OS_LOG_TYPE_ERROR, "Error: Unsupported response protocol version: %@ (%@)", (uint8_t *)&v12, 0x16u);
      }
      if (a3)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"RadioErrorDomain" code:-100 userInfo:0];
        v7 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
    }
  }
  return v7;
}

- (uint64_t)propertyListForRadioResponseReturningError:()RadioRequestAdditions
{
  return [a1 propertyListForRadioResponseReturningError:a3 unparsedResponseDictionary:0];
}

@end