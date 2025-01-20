@interface SPRLogger
+ (NSString)subsystem;
+ (OS_os_log)pinCrypto;
+ (OS_os_log)xpcClient;
@end

@implementation SPRLogger

+ (NSString)subsystem
{
  v6 = objc_msgSend_current(SPRMeta, a2, v2, v3, v4, v5);
  v12 = objc_msgSend_bundleIdentifier(v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

+ (OS_os_log)pinCrypto
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_221258ED4;
  block[3] = &unk_26459CB98;
  block[4] = a1;
  if (qword_267F49500 != -1) {
    dispatch_once(&qword_267F49500, block);
  }
  uint64_t v2 = (void *)qword_267F49508;
  return (OS_os_log *)v2;
}

+ (OS_os_log)xpcClient
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_221258FD8;
  block[3] = &unk_26459CB98;
  block[4] = a1;
  if (qword_267F49510 != -1) {
    dispatch_once(&qword_267F49510, block);
  }
  uint64_t v2 = (void *)qword_267F49518;
  return (OS_os_log *)v2;
}

@end