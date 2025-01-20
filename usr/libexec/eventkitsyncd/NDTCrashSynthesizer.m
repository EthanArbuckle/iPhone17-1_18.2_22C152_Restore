@interface NDTCrashSynthesizer
+ (void)writeCrashReport:(id)a3;
+ (void)writeStackshot:(id)a3;
@end

@implementation NDTCrashSynthesizer

+ (void)writeStackshot:(id)a3
{
  uint64_t v3 = qword_1000C6BB8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1000C6BB8, &stru_1000A92E8);
  }
  off_1000C6BA0();
}

+ (void)writeCrashReport:(id)a3
{
  uint64_t v3 = qword_1000C6BB8;
  id v6 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1000C6BB8, &stru_1000A92E8);
  }
  id v4 = (void (*)(uint64_t, uint64_t, id))off_1000C6BA8;
  uint64_t v5 = getpid();
  v4(v5, 2917850285, v6);
}

@end