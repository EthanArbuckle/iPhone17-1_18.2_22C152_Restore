@interface PpfPBg3wyAI0Wjzf
+ (void)initializeNFHardwareManagerStateWithCompletion:(id)a3;
- (void)ILEFYKTi2wz6Hf5l:(id)a3;
- (void)traHoYtdjqKLUZYc:(id)a3;
@end

@implementation PpfPBg3wyAI0Wjzf

+ (void)initializeNFHardwareManagerStateWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  v4 = +[NFHardwareManager sharedHardwareManager];
  v5 = objc_alloc_init(ASNFHardwareMonitor);
  if (!v5) {
    goto LABEL_5;
  }
  [v4 registerEventListener:v5];
  unsigned int v6 = [v4 getHwSupport];
  if (v6 == 2)
  {
    [v4 unregisterEventListener:v5];
    goto LABEL_8;
  }
  if (v6 != 4)
  {
    [(ASNFHardwareMonitor *)v5 waitForNotification];
    unsigned int v7 = [v4 getHwSupport];
    [v4 unregisterEventListener:v5];
    if (v7 != 2)
    {
      id v9 = 0;
      goto LABEL_13;
    }
LABEL_8:
    id v11 = 0;
    v8 = +[NFSecureElement embeddedSecureElementWithError:&v11];
    id v9 = v11;
    if (!v9)
    {
LABEL_14:
      v3[2](v3, v8);

      goto LABEL_15;
    }
    v10 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055C908((uint64_t)v9, v10);
    }

LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  [v4 unregisterEventListener:v5];
LABEL_5:
  v3[2](v3, 0);
LABEL_15:
}

- (void)traHoYtdjqKLUZYc:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  if (!v5) {
    (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013DDC;
  v8[3] = &unk_10065EF40;
  dispatch_semaphore_t v9 = v5;
  id v10 = v4;
  unsigned int v6 = v5;
  id v7 = v4;
  [(PpfPBg3wyAI0Wjzf *)self ILEFYKTi2wz6Hf5l:v8];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)ILEFYKTi2wz6Hf5l:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013EB8;
  v4[3] = &unk_10065EFB0;
  id v5 = a3;
  id v3 = v5;
  +[PpfPBg3wyAI0Wjzf initializeNFHardwareManagerStateWithCompletion:v4];
}

@end