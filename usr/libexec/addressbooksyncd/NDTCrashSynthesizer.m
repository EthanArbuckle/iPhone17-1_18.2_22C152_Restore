@interface NDTCrashSynthesizer
+ (void)writeCrashReport:(id)a3;
+ (void)writeStackshot:(id)a3;
@end

@implementation NDTCrashSynthesizer

+ (void)writeStackshot:(id)a3
{
  uint64_t v3 = qword_100069C78;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100069C78, &stru_100055078);
  }
  off_100069C60();
}

+ (void)writeCrashReport:(id)a3
{
  uint64_t v3 = qword_100069C78;
  id v6 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100069C78, &stru_100055078);
  }
  id v4 = (void (*)(uint64_t, uint64_t, id))off_100069C68;
  uint64_t v5 = getpid();
  v4(v5, 2917850285, v6);
}

@end