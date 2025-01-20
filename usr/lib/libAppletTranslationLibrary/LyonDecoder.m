@interface LyonDecoder
+ (BOOL)supportsStepUp:(id)a3;
+ (id)getInstance;
- (LyonDecoder)init;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (int64_t)state;
- (void)cleanup;
@end

@implementation LyonDecoder

+ (id)getInstance
{
  if (getInstance_onceToken_3 != -1) {
    dispatch_once(&getInstance_onceToken_3, &__block_literal_global_6);
  }
  v2 = (void *)getInstance_inst_2;

  return v2;
}

uint64_t __26__LyonDecoder_getInstance__block_invoke()
{
  getInstance_inst_2 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (LyonDecoder)init
{
  v4.receiver = self;
  v4.super_class = (Class)LyonDecoder;
  v2 = [(LyonDecoder *)&v4 init];
  if (v2) {
    +[AppletTranslator registerForCleanup:]((uint64_t)AppletTranslator, v2);
  }
  return v2;
}

- (int64_t)state
{
  v2 = +[LyonSwiftDecoder getInstance];
  int64_t v3 = [v2 stateNumber];

  return v3;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = +[LyonSwiftDecoder getInstance];
  v16 = [v15 GetAppletProperties:v14 withPackage:v13 withModule:v12 withTransceiver:v11 withError:a7];

  return v16;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = +[LyonSwiftDecoder getInstance];
  v16 = [v15 getAppletStateAndHistory:v14 withApplet:v13 withPackage:v12 withModule:v11 withError:a7];

  return v16;
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = +[LyonSwiftDecoder getInstance];
  v19 = [v18 parseHCIEvent:v17 withApplet:v16 withPackage:v15 withModule:v14 withTransceiver:v13 withError:a8];

  if (*a8 || [v19 count]) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  return v20;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = +[LyonSwiftDecoder getInstance];
  id v16 = [v15 processEndOfTransaction:v14 withApplet:v13 withPackage:v12 withModule:v11 withError:a7];

  return v16;
}

+ (BOOL)supportsStepUp:(id)a3
{
  return [a3 hasPrefix:@"A000000909ACCE5501"];
}

- (void)cleanup
{
  id v2 = +[LyonSwiftDecoder getInstance];
  [v2 cleanup];
}

@end