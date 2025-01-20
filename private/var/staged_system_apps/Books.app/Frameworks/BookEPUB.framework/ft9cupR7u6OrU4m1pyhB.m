@interface ft9cupR7u6OrU4m1pyhB
+ (id)MNeITI0WyvXBxnLLXXWr:(id)a3;
+ (id)pK0gFZ9QOdm17E9p9cpP:(id)a3 contextManager:(tpZFqotcPt *)a4 sinfData:(id)a5 refetch:(BOOL *)a6 error:(id *)a7;
+ (id)pK0gFZ9QOdm17E9p9cpP:(id)a3 sinfData:(id)a4 refetch:(BOOL *)a5 error:(id *)a6;
+ (id)y7OOpRt0C6jKsWDCTuNz:(id)a3;
+ (tpZFqotcPt)contextManager;
+ (unint64_t)d32lDu5WFQOV5kTab38V;
+ (unint64_t)dataChunkSize;
+ (void)FVnIWgVXBigm3P6nj4U9:(id)a3;
+ (void)Xj3eVHDeBoTD6fVn6fY8:(id)a3 completion:(id)a4;
+ (void)_8g0aKpBRl5gIBvODdOy7:(id)a3 completion:(id)a4;
+ (void)prewarm;
@end

@implementation ft9cupR7u6OrU4m1pyhB

+ (unint64_t)dataChunkSize
{
  return 0x8000;
}

+ (id)pK0gFZ9QOdm17E9p9cpP:(id)a3 sinfData:(id)a4 refetch:(BOOL *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = +[ft9cupR7u6OrU4m1pyhB pK0gFZ9QOdm17E9p9cpP:contextManager:sinfData:refetch:error:](ft9cupR7u6OrU4m1pyhB, "pK0gFZ9QOdm17E9p9cpP:contextManager:sinfData:refetch:error:", v9, +[ft9cupR7u6OrU4m1pyhB contextManager], v10, a5, a6);

  return v11;
}

+ (id)pK0gFZ9QOdm17E9p9cpP:(id)a3 contextManager:(tpZFqotcPt *)a4 sinfData:(id)a5 refetch:(BOOL *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = [objc_alloc((Class)NSInputStream) initWithFileAtPath:v11];
  v14 = v13;
  if (!v13)
  {
    v15 = 0;
    id v16 = 0;
LABEL_41:
    v29 = 0;
    goto LABEL_43;
  }
  [v13 open];
  v15 = [v14 streamError];
  if (v15)
  {
    id v16 = 0;
    int v17 = 1;
LABEL_36:
    [v14 close];

    goto LABEL_37;
  }
  id v34 = 0;
  uint64_t v18 = sub_21A448((uint64_t)a4, (uint64_t)v12, &v34);
  v19 = (bb74bdd798ceadff5c1f0c2b *)v34;
  int v35 = v18;
  if (!v18)
  {
    if (a6) {
      *a6 = 0;
    }
    id v32 = +[NSMutableData dataWithLength:0x8000];
    v20 = (unsigned __int8 *)[v32 mutableBytes];
    id v31 = +[NSMutableData dataWithLength:0x8000];
    v21 = (unsigned __int8 *)[v31 mutableBytes];
    id v22 = [v14 read:v20 maxLength:0x8000];
    unsigned int v23 = v22;
    if ((uint64_t)v22 <= 0)
    {
      v15 = [v14 streamError];
      id v16 = 0;
    }
    else
    {
      id v16 = +[NSMutableData dataWithCapacity:0];
      if (v16)
      {
        while (1)
        {
          unsigned int v33 = 0x8000;
          uint64_t v24 = tpZFqotcPt::E7CI7xMRxnQE2nWg(a4, v19, v20, v23, v21, &v33, &v35);
          if (v35) {
            break;
          }
          [v16 appendBytes:v24 length:v33];
          id v25 = [v14 read:v20 maxLength:0x8000];
          unsigned int v23 = v25;
          if ((uint64_t)v25 <= 0)
          {
            v15 = 0;
            int v17 = 0;
            goto LABEL_34;
          }
        }
        v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"FairPlay");
        int v17 = 1;
        goto LABEL_34;
      }
      v15 = 0;
    }
    int v17 = 1;
LABEL_34:

    goto LABEL_35;
  }
  if (v18 == -42004) {
    NSLog(@"[*] Fairplay error: kDRMInvalidUserError. Are you pointed to the right iTMS store? Signed in?");
  }
  else {
    NSLog(@"[*] Fairplay error = %d", v18);
  }
  BOOL v26 = !tpZFqotcPt::Tb38ee2B31aD5Debb1q(a4, v35);
  if (!a6) {
    LOBYTE(v26) = 1;
  }
  if (!v26) {
    *a6 = 1;
  }
  if (a7)
  {
    if (v35 >> 1 == 2147462350 || v35 == -42597) {
      uint64_t v28 = -996;
    }
    else {
      uint64_t v28 = v35;
    }
    +[NSError errorWithDomain:@"FairPlay" code:v28 userInfo:0];
    v15 = 0;
    id v16 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    id v16 = 0;
  }
  int v17 = 1;
LABEL_35:

  if (v14) {
    goto LABEL_36;
  }
LABEL_37:
  if (a7 && v15) {
    *a7 = v15;
  }
  if (v17) {
    goto LABEL_41;
  }
  id v16 = v16;
  v29 = v16;
LABEL_43:

  return v29;
}

+ (id)y7OOpRt0C6jKsWDCTuNz:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    uint64_t v7 = +[NSError errorWithDomain:@"FairPlay" code:-997 userInfo:0];
    goto LABEL_5;
  }
  v4 = +[ft9cupR7u6OrU4m1pyhB contextManager];
  id v5 = v3;
  [v4 setData:[v5 bytes] length:[v5 length]];
  if (v6)
  {
    uint64_t v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

+ (void)_8g0aKpBRl5gIBvODdOy7:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[ft9cupR7u6OrU4m1pyhB contextManager];
  v8 = [v5 stringByAppendingPathComponent:@"iTunesMetadata.plist"];
  id v9 = +[NSDictionary dictionaryWithContentsOfFile:v8];
  id v10 = v9;
  if (!v9)
  {
    v14 = +[NSError errorWithDomain:@"FairPlay" code:-998 userInfo:0];
    if (!v6) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  id v11 = [v9 objectForKey:@"com.apple.iTunesStore.downloadInfo"];
  id v12 = [v11 valueForKeyPath:@"accountInfo.DSPersonID"];

  if (v12)
  {
    id v13 = [v12 unsignedLongLongValue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_218EA8;
    v15[3] = &unk_3CF030;
    id v17 = v6;
    id v16 = v5;
    tpZFqotcPt::A31bo2we343KEA87KF2((uint64_t)v7, (uint64_t)v13, v15);

    v14 = 0;
  }
  else
  {
    v14 = +[NSError errorWithDomain:@"FairPlay" code:-998 userInfo:0];
  }

  if (v6)
  {
LABEL_8:
    if (v14) {
      (*((void (**)(id, id, void *))v6 + 2))(v6, v5, v14);
    }
  }
LABEL_10:
}

+ (void)Xj3eVHDeBoTD6fVn6fY8:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[ft9cupR7u6OrU4m1pyhB contextManager];
  if (v5)
  {
    uint64_t v8 = (uint64_t)v7;
    id v9 = [v5 unsignedLongLongValue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_219070;
    v12[3] = &unk_3CF058;
    id v13 = v6;
    tpZFqotcPt::A31bo2we343KEA87KF2(v8, (uint64_t)v9, v12);

    id v10 = 0;
  }
  else
  {
    uint64_t v11 = +[NSError errorWithDomain:@"FairPlay" code:-998 userInfo:0];
    id v10 = (void *)v11;
    if (v6 && v11) {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, v11);
    }
  }
}

+ (void)FVnIWgVXBigm3P6nj4U9:(id)a3
{
  id v3 = a3;
  v4 = +[ft9cupR7u6OrU4m1pyhB contextManager];
  id v5 = v4;
  if (v4)
  {
    if (v3)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = v3;
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v13;
        do
        {
          id v10 = 0;
          do
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v7);
            }
            tpZFqotcPt::TA87KF2B31bo2we343K(v5, *(const __CFData **)(*((void *)&v12 + 1) + 8 * (void)v10));
            uint64_t v11 = (bb74bdd798ceadff5c1f0c2b *)objc_claimAutoreleasedReturnValue();
            if (v11) {
              tpZFqotcPt::RTvM5X_G7QMNC67UE(v5, v11);
            }

            id v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
    }
    else
    {
      tpZFqotcPt::p30R9pAOR831587jnjy(v4);
    }
  }
}

+ (id)MNeITI0WyvXBxnLLXXWr:(id)a3
{
  id v3 = a3;
  v4 = [[cJgRjzCmkoWxanXPuQh4 alloc] initWithSinfData:v3];

  return v4;
}

+ (unint64_t)d32lDu5WFQOV5kTab38V
{
  return 0;
}

+ (tpZFqotcPt)contextManager
{
  if (qword_416F78 != -1) {
    dispatch_once(&qword_416F78, &stru_3CF078);
  }
  return (tpZFqotcPt *)qword_416F70;
}

+ (void)prewarm
{
  id v3 = dispatch_get_global_queue(-2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_21941C;
  block[3] = &unk_3C07E0;
  block[4] = a1;
  dispatch_async(v3, block);
}

@end