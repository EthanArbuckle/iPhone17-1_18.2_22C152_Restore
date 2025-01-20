@interface MTContentKeyResponse
- (MTContentKeyRequest)request;
- (MTContentKeyResponse)init;
- (MTContentKeyResponse)initWithRequest:(id)a3 error:(id)a4;
- (MTContentKeyResponse)initWithRequest:(id)a3 keyData:(id)a4 renewalDate:(id)a5 error:(id)a6;
- (NSData)keyData;
- (NSDate)renewalDate;
- (NSError)error;
- (void)setError:(id)a3;
- (void)setKeyData:(id)a3;
@end

@implementation MTContentKeyResponse

- (MTContentKeyRequest)request
{
  return (MTContentKeyRequest *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___MTContentKeyResponse_request));
}

- (NSDate)renewalDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773140);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA72A5C((uint64_t)self + OBJC_IVAR___MTContentKeyResponse_renewalDate, (uint64_t)v5);
  uint64_t v6 = sub_1ACE750A8();
  uint64_t v7 = *(void *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_1ACE75008();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSDate *)v8;
}

- (NSError)error
{
  v2 = (void **)((char *)&self->super.isa + OBJC_IVAR___MTContentKeyResponse_error);
  swift_beginAccess();
  uint64_t v3 = *v2;
  if (v3)
  {
    id v4 = v3;
    v5 = (void *)sub_1ACE74D68();
  }
  else
  {
    v5 = 0;
  }
  return (NSError *)v5;
}

- (void)setError:(id)a3
{
  id v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MTContentKeyResponse_error);
  swift_beginAccess();
  v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

- (NSData)keyData
{
  return (NSData *)sub_1ACC4BAF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MTContentKeyResponse_keyData);
}

- (void)setKeyData:(id)a3
{
}

- (MTContentKeyResponse)initWithRequest:(id)a3 error:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = a4;
    v8 = (void *)sub_1ACE74D68();
  }
  else
  {
    v8 = 0;
  }
  v9 = [(MTContentKeyResponse *)self initWithRequest:v6 keyData:0 renewalDate:0 error:v8];

  return v9;
}

- (MTContentKeyResponse)initWithRequest:(id)a3 keyData:(id)a4 renewalDate:(id)a5 error:(id)a6
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773140);
  MEMORY[0x1F4188790](v10 - 8);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    id v20 = a3;
    id v21 = a5;
    id v22 = a6;
    unint64_t v18 = 0xF000000000000000;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v23 = sub_1ACE750A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v12, 1, 1, v23);
    goto LABEL_6;
  }
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a4;
  a4 = (id)sub_1ACE74F88();
  unint64_t v18 = v17;

  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  sub_1ACE75078();

  uint64_t v19 = sub_1ACE750A8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v12, 0, 1, v19);
LABEL_6:
  v24 = (MTContentKeyResponse *)sub_1ACC4C240(a3, (uint64_t)a4, v18, (uint64_t)v12, a6);

  sub_1ACAB2EF0((uint64_t)a4, v18);
  return v24;
}

- (MTContentKeyResponse)init
{
  result = (MTContentKeyResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1ACA3E034((uint64_t)self + OBJC_IVAR___MTContentKeyResponse_renewalDate);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MTContentKeyResponse_keyData);
  unint64_t v4 = *(void *)&self->request[OBJC_IVAR___MTContentKeyResponse_keyData];
  sub_1ACAB2EF0(v3, v4);
}

@end