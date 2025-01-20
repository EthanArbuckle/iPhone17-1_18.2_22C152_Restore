@interface AlphonsoDecoder
+ (id)getInstance;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
@end

@implementation AlphonsoDecoder

+ (id)getInstance
{
  if (getInstance_onceToken_1 != -1) {
    dispatch_once(&getInstance_onceToken_1, &__block_literal_global_3);
  }
  v2 = (void *)getInstance___instance;

  return v2;
}

uint64_t __30__AlphonsoDecoder_getInstance__block_invoke()
{
  getInstance___instance = objc_alloc_init(AlphonsoDecoder);

  return MEMORY[0x1F41817F8]();
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"Supported";
  v10[0] = MEMORY[0x1E4F1CC38];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10, &v9, 1, a6, a7];

  return v7;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = +[AlphonsoSwiftDecoder getInstance];
  v16 = [v15 getAppletStateAndHistory:v14 withApplet:v13 withPackage:v12 withModule:v11 withError:a7];

  if (*a7 || ![v16 count]) {
    id v17 = 0;
  }
  else {
    id v17 = v16;
  }

  return v17;
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = +[AlphonsoSwiftDecoder getInstance];
  v19 = [v18 parseHCIEvent:v17 withApplet:v16 withPackage:v15 withModule:v14 withTransceiver:v13 withError:a8];

  if (*a8 || ![v19 count]) {
    id v20 = 0;
  }
  else {
    id v20 = v19;
  }

  return v20;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "AlphonsoDecoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"AlphonsoDecoder doesn't expect processEndOfTransaction"];
  v10 = (void *)v9;
  if (a7)
  {
    id v11 = *a7;
    id v12 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v13 = *MEMORY[0x1E4F28A50];
      v21[0] = *MEMORY[0x1E4F28568];
      v21[1] = v13;
      v22[0] = v9;
      v22[1] = v11;
      id v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = v22;
      id v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      id v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = v24;
      id v16 = &v23;
      uint64_t v17 = 1;
    }
    v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:7 userInfo:v18];
  }
  return 0;
}

@end