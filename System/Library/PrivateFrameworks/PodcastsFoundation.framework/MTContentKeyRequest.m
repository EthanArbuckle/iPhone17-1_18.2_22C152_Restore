@interface MTContentKeyRequest
- (MTContentKeyRequest)init;
- (MTContentKeyRequest)initWithKeyIdentifier:(id)a3 adamId:(id)a4 requestType:(int64_t)a5 offlineRequest:(BOOL)a6 secureInvalidationDsid:(id)a7;
- (NSData)requestData;
- (NSNumber)secureInvalidationDsid;
- (NSString)adamId;
- (NSString)keyIdentifier;
- (id)copyWith:(int64_t)a3;
- (id)initFrom:(id)a3 adamId:(id)a4 requestType:(int64_t)a5 offlineRequest:(BOOL)a6;
- (void)setRequestData:(id)a3;
@end

@implementation MTContentKeyRequest

- (id)initFrom:(id)a3 adamId:(id)a4 requestType:(int64_t)a5 offlineRequest:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v9 = sub_1ACE761B8();
  return ContentKeyRequest.init(from:adamId:requestType:offlineRequest:)(a3, v9, v10, a5, v6);
}

- (NSString)keyIdentifier
{
  return (NSString *)sub_1ACB233F8();
}

- (NSString)adamId
{
  return (NSString *)sub_1ACB233F8();
}

- (NSNumber)secureInvalidationDsid
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___MTContentKeyRequest_secureInvalidationDsid));
}

- (NSData)requestData
{
  return (NSData *)sub_1ACC4BAF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MTContentKeyRequest_requestData);
}

- (void)setRequestData:(id)a3
{
}

- (MTContentKeyRequest)initWithKeyIdentifier:(id)a3 adamId:(id)a4 requestType:(int64_t)a5 offlineRequest:(BOOL)a6 secureInvalidationDsid:(id)a7
{
  BOOL v8 = a6;
  uint64_t v10 = sub_1ACE761B8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1ACE761B8();
  uint64_t v15 = v14;
  id v16 = a7;
  v17 = (MTContentKeyRequest *)sub_1ACC4C37C(v10, v12, v13, v15, a5, v8, a7);

  return v17;
}

- (id)copyWith:(int64_t)a3
{
  v4 = self;
  v5 = sub_1ACC4B428(a3);

  return v5;
}

- (MTContentKeyRequest)init
{
  result = (MTContentKeyRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1ACAB2EF0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MTContentKeyRequest_requestData), *(void *)&self->keyIdentifier[OBJC_IVAR___MTContentKeyRequest_requestData]);
  v3 = (char *)self + OBJC_IVAR___MTContentKeyRequest_requestDate;
  uint64_t v4 = sub_1ACE750A8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end