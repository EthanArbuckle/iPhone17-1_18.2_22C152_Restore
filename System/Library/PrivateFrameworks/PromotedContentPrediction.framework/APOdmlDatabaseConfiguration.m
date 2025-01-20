@interface APOdmlDatabaseConfiguration
+ (id)sharedInstance;
- (APOdmlDatabaseConfiguration)init;
- (BOOL)isDaemonProcess;
- (void)setProcessToDaemon;
@end

@implementation APOdmlDatabaseConfiguration

- (BOOL)isDaemonProcess
{
  return self->_isDaemonProcess;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BBC45714;
  block[3] = &unk_1E624A510;
  block[4] = a1;
  if (qword_1EB9F98B8 != -1) {
    dispatch_once(&qword_1EB9F98B8, block);
  }
  v2 = (void *)qword_1EB9F98A0;

  return v2;
}

- (APOdmlDatabaseConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)APOdmlDatabaseConfiguration;
  result = [(APOdmlDatabaseConfiguration *)&v3 init];
  if (result) {
    result->_isDaemonProcess = 0;
  }
  return result;
}

- (void)setProcessToDaemon
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BBC6265C;
  block[3] = &unk_1E624A800;
  block[4] = self;
  if (qword_1EB9F9800 != -1) {
    dispatch_once(&qword_1EB9F9800, block);
  }
}

@end