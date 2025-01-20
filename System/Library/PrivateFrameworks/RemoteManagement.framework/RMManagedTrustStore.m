@interface RMManagedTrustStore
+ (_TtC16RemoteManagement19RMManagedTrustStore)sharedInstance;
- (BOOL)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 scope:(int64_t)a6 persona:(id)a7 error:(id *)a8;
- (BOOL)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 scope:(int64_t)a6 persona:(id)a7 error:(id *)a8;
- (_TtC16RemoteManagement19RMManagedTrustStore)init;
@end

@implementation RMManagedTrustStore

+ (_TtC16RemoteManagement19RMManagedTrustStore)sharedInstance
{
  if (qword_26808F870 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26808FD18;

  return (_TtC16RemoteManagement19RMManagedTrustStore *)v2;
}

- (BOOL)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 scope:(int64_t)a6 persona:(id)a7 error:(id *)a8
{
  return sub_2247C97C8(self, (uint64_t)a2, a3, a4, a5, a6, a7, (uint64_t)a8, (void (*)(uint64_t, uint64_t))sub_2247CC8BC);
}

- (BOOL)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 scope:(int64_t)a6 persona:(id)a7 error:(id *)a8
{
  return sub_2247C97C8(self, (uint64_t)a2, a3, a4, a5, a6, a7, (uint64_t)a8, (void (*)(uint64_t, uint64_t))sub_2247CCECC);
}

- (_TtC16RemoteManagement19RMManagedTrustStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RMManagedTrustStore();
  return [(RMManagedTrustStore *)&v3 init];
}

@end