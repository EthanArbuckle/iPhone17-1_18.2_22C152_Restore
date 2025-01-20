@interface BuLr3rwnVU31zt9OioJ56
+ (BOOL)XNRYWdSZWZldGNoUmxdWlyWQ:(int64_t)a3;
+ (int64_t)dataChunkSize;
+ (tpZFqotcPt)RlXOkXCKRgyluEUOMXWx43md;
+ (void)cmRVmZXRjaEJhZ0ZvckRTSUQ:(id)a3 completion:(id)a4;
- (BOOL)BaSrRpzcWCyAjSdjbc8j:(char *)a3 withSize:(unint64_t)a4 into:(char *)a5 error:(id *)a6;
- (BOOL)No4wyWNg0kGgeb2ALodCkGRf:(char *)a3 withSize:(unint64_t)a4 into:(char *)a5 error:(id *)a6;
- (BuLr3rwnVU31zt9OioJ56)init;
- (id)setupWithSinfData:(id)a3;
- (void)EXC6L9VofSI7ZuGjFga5qXiB;
- (void)dealloc;
@end

@implementation BuLr3rwnVU31zt9OioJ56

+ (tpZFqotcPt)RlXOkXCKRgyluEUOMXWx43md
{
  if (qword_573820 != -1) {
    dispatch_once(&qword_573820, &stru_45C360);
  }
  return (tpZFqotcPt *)qword_573818;
}

- (BuLr3rwnVU31zt9OioJ56)init
{
  v4.receiver = self;
  v4.super_class = (Class)BuLr3rwnVU31zt9OioJ56;
  v2 = [(BuLr3rwnVU31zt9OioJ56 *)&v4 init];
  if (v2) {
    v2->mContextManager = (tpZFqotcPt *)[(id)objc_opt_class() RlXOkXCKRgyluEUOMXWx43md];
  }
  return v2;
}

- (void)dealloc
{
  [(BuLr3rwnVU31zt9OioJ56 *)self EXC6L9VofSI7ZuGjFga5qXiB];
  v3.receiver = self;
  v3.super_class = (Class)BuLr3rwnVU31zt9OioJ56;
  [(BuLr3rwnVU31zt9OioJ56 *)&v3 dealloc];
}

- (id)setupWithSinfData:(id)a3
{
  id v4 = a3;
  int v5 = p69a8ed193df95a4f68();
  if (v5)
  {
    v6 = +[NSError errorWithDomain:@"ibookserrors" code:v5 userInfo:0];
  }
  else
  {
    objc_storeStrong((id *)&self->mCryptRef, 0);
    v6 = 0;
  }

  return v6;
}

- (void)EXC6L9VofSI7ZuGjFga5qXiB
{
  mCryptRef = self->mCryptRef;
  if (mCryptRef)
  {
    tpZFqotcPt::RTvM5X_G7QMNC67UE(self->mContextManager, mCryptRef);
    id v4 = self->mCryptRef;
  }
  else
  {
    id v4 = 0;
  }
  self->mCryptRef = 0;
}

+ (int64_t)dataChunkSize
{
  return 0x8000;
}

- (BOOL)BaSrRpzcWCyAjSdjbc8j:(char *)a3 withSize:(unint64_t)a4 into:(char *)a5 error:(id *)a6
{
  if (a4 > 0x8000)
  {
    v11 = +[TSUAssertionHandler currentHandler];
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[BuLr3rwnVU31zt9OioJ56 BaSrRpzcWCyAjSdjbc8j:withSize:into:error:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDDecryptionSession.mm"];
    [v11 handleFailureInFunction:v12 file:v13 lineNumber:115 description:@"input should be no bigger than the chunk size"];
  }
  *(void *)v18 = a4;
  int v17 = 0;
  if (a4 >= 0x8000) {
    unsigned int v14 = 0x8000;
  }
  else {
    unsigned int v14 = a4;
  }
  tpZFqotcPt::E7CI7xMRxnQE2nWg(self->mContextManager, self->mCryptRef, (unsigned __int8 *)a3, v14, (unsigned __int8 *)a5, v18, &v17);
  int v15 = v17;
  if (a6 && v17)
  {
    *a6 = +[NSError errorWithDomain:@"ibookserrors" code:v17 userInfo:0];
  }
  return v15 == 0;
}

- (BOOL)No4wyWNg0kGgeb2ALodCkGRf:(char *)a3 withSize:(unint64_t)a4 into:(char *)a5 error:(id *)a6
{
  if (a4)
  {
    unint64_t v11 = 0;
    do
    {
      if (a4 - v11 >= 0x8000) {
        uint64_t v12 = 0x8000;
      }
      else {
        uint64_t v12 = a4 - v11;
      }
      BOOL v13 = [(BuLr3rwnVU31zt9OioJ56 *)self BaSrRpzcWCyAjSdjbc8j:&a3[v11] withSize:v12 into:&a5[v11] error:a6];
      v11 += v12;
    }
    while (v13 && v11 < a4);
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13;
}

+ (void)cmRVmZXRjaEJhZ0ZvckRTSUQ:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[BuLr3rwnVU31zt9OioJ56 RlXOkXCKRgyluEUOMXWx43md];
  if (v5)
  {
    [v5 unsignedLongLongValue];
    id v8 = v6;
    tpZFqotcPt::A31bo2we343KEA87KF2();
  }
  else
  {
    v7 = +[NSError errorWithDomain:@"FairPlay" code:-998 userInfo:0];
    if (v6) {
      (*((void (**)(id, void *))v6 + 2))(v6, v7);
    }
  }
}

+ (BOOL)XNRYWdSZWZldGNoUmxdWlyWQ:(int64_t)a3
{
  int v3 = a3;
  id v4 = +[BuLr3rwnVU31zt9OioJ56 RlXOkXCKRgyluEUOMXWx43md];

  return tpZFqotcPt::Tb38ee2B31aD5Debb1q(v4, v3);
}

- (void).cxx_destruct
{
}

@end