@interface cJgRjzCmkoWxanXPuQh4
+ (tpZFqotcPt)tpZFqotcPt;
- (BOOL)BaSrRpzcWCyAjSdjbc8j:(char *)a3 withSize:(unint64_t)a4 into:(char *)a5 e2cxKLQOk3W4uL3KXTUm:(unint64_t *)a6 refetch:(BOOL *)a7 error:(id *)a8;
- (cJgRjzCmkoWxanXPuQh4)initWithSinfData:(id)a3;
@end

@implementation cJgRjzCmkoWxanXPuQh4

+ (tpZFqotcPt)tpZFqotcPt
{
  if (qword_416F68 != -1) {
    dispatch_once(&qword_416F68, &stru_3CF008);
  }
  return (tpZFqotcPt *)qword_416F60;
}

- (cJgRjzCmkoWxanXPuQh4)initWithSinfData:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)cJgRjzCmkoWxanXPuQh4;
  v5 = [(cJgRjzCmkoWxanXPuQh4 *)&v12 init];
  if (v5)
  {
    v6 = (tpZFqotcPt *)[(id)objc_opt_class() tpZFqotcPt];
    v5->mContextManager = v6;
    id v11 = 0;
    uint64_t v7 = sub_21A448((uint64_t)v6, (uint64_t)v4, &v11);
    id v8 = v11;
    id v9 = v11;
    if (v7)
    {
      NSLog(@"[*] FairPlay error = %d", v7);

      v5 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v5->mCryptRef, v8);
    }
  }
  return v5;
}

- (BOOL)BaSrRpzcWCyAjSdjbc8j:(char *)a3 withSize:(unint64_t)a4 into:(char *)a5 e2cxKLQOk3W4uL3KXTUm:(unint64_t *)a6 refetch:(BOOL *)a7 error:(id *)a8
{
  int v17 = 0;
  unsigned int v18 = a4;
  mContextManager = self->mContextManager;
  if (a4 >= 0x8000) {
    LODWORD(a4) = 0x8000;
  }
  tpZFqotcPt::E7CI7xMRxnQE2nWg(mContextManager, self->mCryptRef, (unsigned __int8 *)a3, a4, (unsigned __int8 *)a5, &v18, &v17);
  int v13 = v17;
  if (v17)
  {
    if (a8)
    {
      *a8 = +[NSError errorWithDomain:@"FairPlay" code:v17 userInfo:0];
    }
    BOOL v15 = tpZFqotcPt::Tb38ee2B31aD5Debb1q(self->mContextManager, v17);
    if (a7 && v15) {
      *a7 = 1;
    }
    if (a6)
    {
      unint64_t v14 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    if (a7) {
      *a7 = 0;
    }
    if (a6)
    {
      unint64_t v14 = v18;
LABEL_15:
      *a6 = v14;
    }
  }
  return v13 == 0;
}

- (void).cxx_destruct
{
}

@end