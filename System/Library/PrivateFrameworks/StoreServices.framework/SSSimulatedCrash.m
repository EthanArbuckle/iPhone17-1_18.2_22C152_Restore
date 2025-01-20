@interface SSSimulatedCrash
+ (void)simulateCrashWithFormat:(id)a3;
+ (void)simulateCrashWithString:(id)a3;
@end

@implementation SSSimulatedCrash

+ (void)simulateCrashWithFormat:(id)a3
{
  id v4 = a3;
  if (SSIsInternalBuild())
  {
    v5 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v6];
    [a1 simulateCrashWithString:v5];
  }
}

+ (void)simulateCrashWithString:(id)a3
{
  id v4 = a3;
  if (SSIsInternalBuild())
  {
    uint64_t v3 = getpid();
    softLinkSimulateCrash(v3, 195939070, v4);
  }
}

@end