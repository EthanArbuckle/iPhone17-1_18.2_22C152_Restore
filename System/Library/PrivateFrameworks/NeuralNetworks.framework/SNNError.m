@interface SNNError
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)invalidEspressoConfigurationErrorForMethod:(id)a3 description:(id)a4;
+ (id)invalidEspressoContextErrorForMethod:(id)a3 description:(id)a4;
+ (id)invalidEspressoNetworkErrorForMethod:(id)a3 description:(id)a4;
+ (id)invalidEspressoPlanErrorForMethod:(id)a3 description:(id)a4;
+ (id)invalidInputErrorForMethod:(id)a3 description:(id)a4;
+ (id)invalidMILProgramErrorForMethod:(id)a3 description:(id)a4;
+ (id)invalidStateErrorForMethod:(id)a3 description:(id)a4;
@end

@implementation SNNError

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v15 = *MEMORY[0x263F08320];
  v16[0] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v8 = [v6 errorWithDomain:@"com.apple.coreml.foundation" code:a3 userInfo:v7];

  v9 = +[SNNLogging framework];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_257455000, v9, OS_LOG_TYPE_INFO, "%@ : %@", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

+ (id)invalidStateErrorForMethod:(id)a3 description:(id)a4
{
  id v5 = [NSString stringWithFormat:@"%@: invalid state : %@", a3, a4];
  v6 = [a1 errorWithCode:-1 description:v5];

  return v6;
}

+ (id)invalidInputErrorForMethod:(id)a3 description:(id)a4
{
  id v5 = [NSString stringWithFormat:@"%@: invalid inputs : %@", a3, a4];
  v6 = [a1 errorWithCode:-2 description:v5];

  return v6;
}

+ (id)invalidMILProgramErrorForMethod:(id)a3 description:(id)a4
{
  id v5 = [NSString stringWithFormat:@"%@: invalid MIL program : %@", a3, a4];
  v6 = [a1 errorWithCode:-3 description:v5];

  return v6;
}

+ (id)invalidEspressoContextErrorForMethod:(id)a3 description:(id)a4
{
  id v5 = [NSString stringWithFormat:@"%@: invalid Espresso context : %@", a3, a4];
  v6 = [a1 errorWithCode:-4 description:v5];

  return v6;
}

+ (id)invalidEspressoPlanErrorForMethod:(id)a3 description:(id)a4
{
  id v5 = [NSString stringWithFormat:@"%@: invalid Espresso plan : %@", a3, a4];
  v6 = [a1 errorWithCode:-5 description:v5];

  return v6;
}

+ (id)invalidEspressoNetworkErrorForMethod:(id)a3 description:(id)a4
{
  id v5 = [NSString stringWithFormat:@"%@: invalid Espresso network : %@", a3, a4];
  v6 = [a1 errorWithCode:-6 description:v5];

  return v6;
}

+ (id)invalidEspressoConfigurationErrorForMethod:(id)a3 description:(id)a4
{
  id v5 = [NSString stringWithFormat:@"%@: invalid Espresso configuration : %@", a3, a4];
  v6 = [a1 errorWithCode:-7 description:v5];

  return v6;
}

@end