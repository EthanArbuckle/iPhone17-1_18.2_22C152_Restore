@interface NSError(WFAdditions)
+ (id)wf_errorWithCode:()WFAdditions encapsulatedError:userInfo:;
+ (id)wf_errorWithCode:()WFAdditions userInfo:;
+ (uint64_t)wf_errorWithCode:()WFAdditions;
@end

@implementation NSError(WFAdditions)

+ (uint64_t)wf_errorWithCode:()WFAdditions
{
  return objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", a3, 0);
}

+ (id)wf_errorWithCode:()WFAdditions userInfo:
{
  v5 = (void *)[a4 mutableCopy];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  v8 = v7;

  uint64_t v9 = *MEMORY[0x263F08320];
  v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F08320]];
  if (!v10)
  {
    if ((unint64_t)(a3 - 1) > 0xE) {
      v10 = @"An unknown error occured.  Please file a radar with whatever it is you did to cause this.";
    }
    else {
      v10 = off_264431B40[a3 - 1];
    }
    [v8 setObject:v10 forKeyedSubscript:v9];
  }
  v11 = [MEMORY[0x263F087E8] errorWithDomain:@"WeatherFoundationErrorDomain" code:a3 userInfo:v8];

  return v11;
}

+ (id)wf_errorWithCode:()WFAdditions encapsulatedError:userInfo:
{
  id v7 = a4;
  v8 = (void *)[a5 mutableCopy];
  uint64_t v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  v11 = v10;

  if (v7) {
    [v11 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  v12 = objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", a3, v11);

  return v12;
}

@end