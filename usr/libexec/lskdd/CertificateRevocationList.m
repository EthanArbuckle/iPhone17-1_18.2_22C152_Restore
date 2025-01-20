@interface CertificateRevocationList
+ (id)getCertificateRevocationListObject;
- (BOOL)catalogAvailable;
- (CertificateRevocationList)init;
- (NSCondition)conditionLock;
- (OS_dispatch_queue)dispatchQueue;
- (int)fetchCertificateRevocationList:(BOOL)a3 :(BOOL)a4;
- (void)downloadAsset:(BOOL)a3 :(id)a4 then:(id)a5;
- (void)downloadCertificateRevocationList:(BOOL)a3 :(BOOL)a4 :(id)a5;
- (void)processDownloadedAsset:(id)a3 then:(id)a4;
- (void)queryCertificateRevocationList:(BOOL)a3 :(BOOL)a4 :(id)a5;
- (void)setCatalogAvailable:(BOOL)a3;
- (void)setConditionLock:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CertificateRevocationList

- (CertificateRevocationList)init
{
  v4.receiver = self;
  v4.super_class = (Class)CertificateRevocationList;
  v2 = [(CertificateRevocationList *)&v4 init];
  if (v2)
  {
    [(CertificateRevocationList *)v2 setConditionLock:objc_alloc_init((Class)NSCondition)];
    [(CertificateRevocationList *)v2 setCatalogAvailable:0];
    [(CertificateRevocationList *)v2 setDispatchQueue:dispatch_queue_create("CoreLSKDMobileAssetQueue", 0)];
  }
  return v2;
}

- (void)downloadAsset:(BOOL)a3 :(id)a4 then:(id)a5
{
  BOOL v7 = a3;
  id v9 = (id)objc_opt_new();
  v10 = v9;
  if (v7) {
    [v9 setTimeoutIntervalForResource:60];
  }
  [v10 setDiscretionary:0];
  unint64_t v11 = (unint64_t)[a4 state];
  if (v11 <= 5)
  {
    if (((1 << v11) & 0x2C) != 0)
    {
      [(CertificateRevocationList *)self processDownloadedAsset:a4 then:a5];
      return;
    }
    if (((1 << v11) & 0x12) != 0)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3254779904;
      v13[2] = sub_100001798;
      v13[3] = &unk_1015C4220;
      v13[4] = self;
      v13[5] = a4;
      v13[6] = a5;
      [a4 startDownload:v10 then:v13];
      return;
    }
  }
  v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);

  v12(a5, 4294924391);
}

- (void)processDownloadedAsset:(id)a3 then:(id)a4
{
  sub_10013717C((uint64_t)[[[objc_msgSend(objc_msgSend(a3, "getLocalUrl"), "path") UTF8String];
  v6 = (void (*)(id, uint64_t))*((void *)a4 + 2);

  v6(a4, v5);
}

- (void)queryCertificateRevocationList:(BOOL)a3 :(BOOL)a4 :(id)a5
{
  BOOL v5 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3254779904;
  v9[2] = sub_1000019D0;
  v9[3] = &unk_1015C4250;
  v9[4] = a5;
  v7[3] = &unk_1015C4280;
  v7[4] = self;
  v7[5] = v9;
  BOOL v8 = a3;
  id v6 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.AppleKeyServicesCRL2" _NSConcreteStackBlock, 3254779904];
  [v6 setDoNotBlockBeforeFirstUnlock:1];
  [v6 returnTypes:2];
  ((void (*)(void *, id, id, BOOL))sub_1000019FC)(v7, v6, [v6 queryMetaDataSync], v5);
}

- (void)downloadCertificateRevocationList:(BOOL)a3 :(BOOL)a4 :(id)a5
{
  id v9 = (id)objc_opt_new();
  [v9 setTimeoutIntervalForResource:30];
  [v9 setDiscretionary:0];
  [v9 setCanUseLocalCacheServer:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3254779904;
  v10[2] = sub_100001D10;
  v10[3] = &unk_1015C42B0;
  BOOL v11 = a3;
  BOOL v12 = a4;
  v10[4] = self;
  v10[5] = a5;
  +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.AppleKeyServicesCRL2" options:v9 then:v10];
}

- (int)fetchCertificateRevocationList:(BOOL)a3 :(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_sync_enter(self);
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = -42905;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3254779904;
    v9[2] = sub_100001E38;
    v9[3] = &unk_1015C42E0;
    v9[4] = &v10;
    [(CertificateRevocationList *)self queryCertificateRevocationList:v5 :1 :v9];
  }
  else
  {
    [(CertificateRevocationList *)self downloadCertificateRevocationList:v5 :0 :&stru_1015C4330];
  }
  int v7 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  objc_sync_exit(self);
  return v7;
}

+ (id)getCertificateRevocationListObject
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = sub_100001F14;
  block[3] = &unk_1015C4350;
  block[4] = a1;
  if (qword_10160E5C8 != -1) {
    dispatch_once(&qword_10160E5C8, block);
  }
  return (id)qword_10160E5C0;
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSCondition)conditionLock
{
  return (NSCondition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConditionLock:(id)a3
{
}

- (BOOL)catalogAvailable
{
  return self->_catalogAvailable;
}

- (void)setCatalogAvailable:(BOOL)a3
{
  self->_catalogAvailable = a3;
}

@end