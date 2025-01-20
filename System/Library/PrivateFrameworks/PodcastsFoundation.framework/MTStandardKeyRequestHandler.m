@interface MTStandardKeyRequestHandler
+ (NSString)keyRequestLicenseErrorDomain;
- (MTStandardKeyRequestHandler)init;
- (MTStandardKeyRequestHandler)initWithConcurrentOperationCount:(int64_t)a3 requestEncodingType:(unint64_t)a4;
- (void)loadCertificateDataWithCompletion:(id)a3;
- (void)loadKeyDataFor:(id)a3 account:(id)a4 completion:(id)a5;
@end

@implementation MTStandardKeyRequestHandler

+ (NSString)keyRequestLicenseErrorDomain
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

- (void)loadCertificateDataWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1ACBAC0A8((uint64_t)sub_1ACA3A550, v5);

  swift_release();
}

- (void)loadKeyDataFor:(id)a3 account:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  type metadata accessor for ContentKeyRequest(0);
  uint64_t v8 = sub_1ACE76578();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = a4;
  v11 = self;
  sub_1ACBAD0EC(v8, a4, (uint64_t)sub_1ACBAF1A4, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (MTStandardKeyRequestHandler)init
{
  return (MTStandardKeyRequestHandler *)StandardKeyRequestHandler.init()();
}

- (MTStandardKeyRequestHandler)initWithConcurrentOperationCount:(int64_t)a3 requestEncodingType:(unint64_t)a4
{
  return (MTStandardKeyRequestHandler *)StandardKeyRequestHandler.init(concurrentOperationCount:requestEncodingType:)(a3, a4);
}

- (void).cxx_destruct
{
}

@end