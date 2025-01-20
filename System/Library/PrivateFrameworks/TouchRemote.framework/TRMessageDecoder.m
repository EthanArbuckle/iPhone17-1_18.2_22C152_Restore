@interface TRMessageDecoder
+ (id)decodeMessage:(id)a3 error:(id *)a4;
@end

@implementation TRMessageDecoder

+ (id)decodeMessage:(id)a3 error:(id *)a4
{
  v30[2] = *MEMORY[0x263EF8340];
  v5 = (objc_class *)MEMORY[0x263F08928];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initForReadingFromData:v6 error:0];

  v8 = [v7 decodeTopLevelObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0] error:0];
  [v7 finishDecoding];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    if (a4)
    {
      uint64_t v10 = *MEMORY[0x263F08320];
      v30[0] = @"Message decoding failed.";
      uint64_t v11 = *MEMORY[0x263F08338];
      v29[0] = v10;
      v29[1] = v11;
      v12 = NSString;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = [v12 stringWithFormat:@"Decoded class is not a subclass of %@: %@.", v14, v16];
      v30[1] = v17;
      v18 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9200 userInfo:v18];
    }
    else if (_TRLogEnabled == 1)
    {
      v19 = TRLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 136315650;
        v24 = "+[TRMessageDecoder decodeMessage:error:]";
        __int16 v25 = 2112;
        v26 = v21;
        __int16 v27 = 2112;
        v28 = v8;
        _os_log_impl(&dword_2149BE000, v19, OS_LOG_TYPE_DEFAULT, "%s Decoded something other than a subclass of %@: %@", buf, 0x20u);
      }
    }
    id v9 = 0;
  }

  return v9;
}

@end