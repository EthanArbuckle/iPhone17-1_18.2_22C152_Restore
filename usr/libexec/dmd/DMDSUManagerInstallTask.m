@interface DMDSUManagerInstallTask
+ (DMDSUManagerInstallTask)sharedInstallTask;
+ (NSString)defaultProductKey;
+ (id)_dmfStatusErrorFromSUStatusError:(id)a3;
+ (id)productKeyFromStatus:(id)a3;
+ (id)productKeyOrDefaultFromStatus:(id)a3;
- (BOOL)removeUpdateWithError:(id *)a3;
- (BOOL)startDownloadWithError:(id *)a3;
- (BOOL)startInstallWithError:(id *)a3;
- (id)availableUpdateWithVersion:(id)a3 useDelay:(BOOL)a4 error:(id *)a5;
- (id)currentStatusWithError:(id *)a3;
@end

@implementation DMDSUManagerInstallTask

+ (DMDSUManagerInstallTask)sharedInstallTask
{
  if (qword_1000FBCF8 != -1) {
    dispatch_once(&qword_1000FBCF8, &stru_1000CBDD0);
  }
  v2 = (void *)qword_1000FBCF0;

  return (DMDSUManagerInstallTask *)v2;
}

+ (NSString)defaultProductKey
{
  return (NSString *)@"OSUpdate";
}

+ (id)_dmfStatusErrorFromSUStatusError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    NSErrorUserInfoKey v8 = NSUnderlyingErrorKey;
    id v9 = v3;
    v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v6 = DMFErrorWithCodeAndUserInfo();
  }
  else
  {
    v6 = DMFErrorWithCodeAndUserInfo();
  }

  return v6;
}

+ (id)productKeyFromStatus:(id)a3
{
  v4 = [a3 productBuildVersion];
  if (v4)
  {
    v5 = [a1 defaultProductKey];
    v6 = [v5 stringByAppendingString:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)productKeyOrDefaultFromStatus:(id)a3
{
  v4 = [a1 productKeyFromStatus:a3];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [a1 defaultProductKey];
  }
  v7 = v6;

  return v7;
}

- (BOOL)removeUpdateWithError:(id *)a3
{
  return 0;
}

- (id)availableUpdateWithVersion:(id)a3 useDelay:(BOOL)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)startDownloadWithError:(id *)a3
{
  return 0;
}

- (BOOL)startInstallWithError:(id *)a3
{
  return 0;
}

- (id)currentStatusWithError:(id *)a3
{
  return 0;
}

@end