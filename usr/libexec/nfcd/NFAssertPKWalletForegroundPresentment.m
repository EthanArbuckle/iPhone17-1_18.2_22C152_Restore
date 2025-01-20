@interface NFAssertPKWalletForegroundPresentment
- (BOOL)isEntitled:(id)a3;
- (void)onAssertWithCompletion:(id)a3;
- (void)onDeassertWithCompletion:(id)a3;
@end

@implementation NFAssertPKWalletForegroundPresentment

- (BOOL)isEntitled:(id)a3
{
  v3 = [a3 NF_whitelistChecker];
  unsigned __int8 v4 = [v3 internalAccess];

  return v4;
}

- (void)onAssertWithCompletion:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void))a3;
  uint64_t v5 = +[_NFHardwareManager sharedHardwareManager];
  v6 = (void *)v5;
  if (v5) {
    v7 = *(void **)(v5 + 120);
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if ([v8 assert:0 isFirst:0])
  {
    v4[2](v4, 0);
  }
  else
  {
    id v9 = objc_alloc((Class)NSError);
    v10 = +[NSString stringWithUTF8String:"nfcd"];
    v16[0] = NSLocalizedDescriptionKey;
    v11 = +[NSString stringWithUTF8String:"Invalid State"];
    v17[0] = v11;
    v17[1] = &off_10031B148;
    v16[1] = @"Line";
    v16[2] = @"Method";
    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v17[2] = v12;
    v16[3] = NSDebugDescriptionErrorKey;
    id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 49];
    v17[3] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
    id v15 = [v9 initWithDomain:v10 code:12 userInfo:v14];
    ((void (**)(id, id))v4)[2](v4, v15);
  }
}

- (void)onDeassertWithCompletion:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void))a3;
  uint64_t v5 = +[_NFHardwareManager sharedHardwareManager];
  v6 = (void *)v5;
  if (v5) {
    v7 = *(void **)(v5 + 120);
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  unsigned int v9 = [v8 deassert:0 isLast:0];
  if (v4)
  {
    if (v9)
    {
      v4[2](v4, 0);
    }
    else
    {
      id v10 = objc_alloc((Class)NSError);
      v11 = +[NSString stringWithUTF8String:"nfcd"];
      v17[0] = NSLocalizedDescriptionKey;
      id v12 = +[NSString stringWithUTF8String:"Invalid State"];
      v18[0] = v12;
      v18[1] = &off_10031B160;
      v17[1] = @"Line";
      v17[2] = @"Method";
      id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v18[2] = v13;
      v17[3] = NSDebugDescriptionErrorKey;
      id v14 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 63];
      v18[3] = v14;
      id v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
      id v16 = [v10 initWithDomain:v11 code:12 userInfo:v15];
      ((void (**)(id, id))v4)[2](v4, v16);
    }
  }
}

@end