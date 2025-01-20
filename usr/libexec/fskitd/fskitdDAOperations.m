@interface fskitdDAOperations
+ (__DASession)getMainDASession;
+ (void)probeDisk:(id)a3 replyHandler:(id)a4;
+ (void)setFSKitAdditions:(id)a3 disk:(id)a4 replyHandler:(id)a5;
@end

@implementation fskitdDAOperations

+ (__DASession)getMainDASession
{
  if (qword_1000607B0 != -1) {
    dispatch_once(&qword_1000607B0, &stru_1000593D0);
  }
  return (__DASession *)qword_1000607B8;
}

+ (void)probeDisk:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (__DASession *)[a1 getMainDASession];
  if (v8
    && DADiskCreateFromBSDName(kCFAllocatorDefault, v8, (const char *)[v6 UTF8String]))
  {
    id v9 = v7;
    DADiskProbeWithBlock();
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 4175036417);
  }
}

+ (void)setFSKitAdditions:(id)a3 disk:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (__DASession *)[a1 getMainDASession];
  if (v11
    && DADiskCreateFromBSDName(kCFAllocatorDefault, v11, (const char *)[v9 UTF8String]))
  {
    id v12 = v10;
    DADiskSetFSKitAdditions();
  }
  else
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 4175036417);
  }
}

@end