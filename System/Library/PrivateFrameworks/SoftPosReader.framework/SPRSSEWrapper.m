@interface SPRSSEWrapper
+ (BOOL)isFeatureAppleSSESupported;
+ (id)getSignedDeviceData:(id)a3 error:(id *)a4;
@end

@implementation SPRSSEWrapper

+ (id)getSignedDeviceData:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v19 = 0;
  uint64_t v5 = sub_221262D58((const __CFData *)a3, (CFDataRef *)&v19);
  if (v5 || (id v10 = v19) == 0)
  {
    if (a4)
    {
      v11 = objc_msgSend_stringWithFormat_(NSString, v6, @"General reader error: SSEGetSignedDeviceData failed (%d)", v7, v8, v9, v5);
      v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F08320];
      v21[0] = v11;
      v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v21, (uint64_t)&v20, 1, v14);
      objc_msgSend_errorWithDomain_code_userInfo_(v12, v16, @"SoftPosReader", 4999, (uint64_t)v15, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = 0;
  }
  return v10;
}

+ (BOOL)isFeatureAppleSSESupported
{
  return sub_2212620D8(1) == 0;
}

@end