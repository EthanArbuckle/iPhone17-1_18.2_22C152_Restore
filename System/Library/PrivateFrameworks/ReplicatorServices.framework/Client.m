@interface Client
- (BOOL)eraseAndReturnError:(id *)a3;
- (NSString)description;
- (_TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client)init;
- (id)clientDescriptorsAndReturnError:(id *)a3;
- (id)devicesAndReturnError:(id *)a3;
- (id)localDeviceIDAndReturnError:(id *)a3;
- (id)recordsAndReturnError:(id *)a3;
@end

@implementation Client

- (NSString)description
{
  v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client_lock)
                          + 16);
  v3 = self;
  os_unfair_lock_lock(v2);
  sub_25B35C7EC(&v6);
  os_unfair_lock_unlock(v2);

  v4 = (void *)sub_25B37F970();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client)init
{
  result = (_TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client_connection));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client_delegate;
  sub_25B35C830((uint64_t)v3);
}

- (id)localDeviceIDAndReturnError:(id *)a3
{
  uint64_t LocalDeviceID = type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID();
  MEMORY[0x270FA5388](LocalDeviceID);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_25B3559B4((uint64_t)v6);

  sub_25B37F440();
  swift_allocObject();
  sub_25B37F430();
  sub_25B35CAD4((unint64_t *)&unk_26A4EC900, (void (*)(uint64_t))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID);
  uint64_t v8 = sub_25B37F420();
  unint64_t v10 = v9;
  v11 = (void *)sub_25B37F560();
  sub_25B2CA2D8(v8, v10);
  swift_release();
  sub_25B35CB84((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for MigrationXPCServerResponse.GetLocalDeviceID);
  return v11;
}

- (id)recordsAndReturnError:(id *)a3
{
  v3 = self;
  id v4 = sub_25B355C78();

  return v4;
}

- (id)devicesAndReturnError:(id *)a3
{
  if (MEMORY[0x261162290]((char *)self + OBJC_IVAR____TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client_delegate, a2))
  {
    uint64_t v5 = self;
    sub_25B354B6C(&OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_deviceProvider, "Returning %{public}ld devices for migration", (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_25B3525D0);

    swift_unknownObjectRelease();
    sub_25B37F440();
    swift_allocObject();
    sub_25B37F430();
    sub_25B35C77C();
    uint64_t v10 = sub_25B37F420();
    unint64_t v12 = v11;
    uint64_t v13 = (void *)sub_25B37F560();
    sub_25B2CA2D8(v10, v12);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    sub_25B35C6D4();
    uint64_t v8 = (void *)swift_allocError();
    *(unsigned char *)uint64_t v9 = 2;
    *(void *)(v9 + 8) = 0;
    swift_willThrow();
    if (a3)
    {
      uint64_t v6 = (void *)sub_25B37F460();

      id v7 = v6;
      uint64_t v13 = 0;
      *a3 = v6;
    }
    else
    {

      uint64_t v13 = 0;
    }
  }
  return v13;
}

- (id)clientDescriptorsAndReturnError:(id *)a3
{
  if (MEMORY[0x261162290]((char *)self + OBJC_IVAR____TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client_delegate, a2))
  {
    uint64_t v5 = self;
    sub_25B354B6C(&OBJC_IVAR____TtC18ReplicatorServices15MigrationServer_clientDescriptorProvider, "Returning %{public}ld client descriptors for migration", (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_25B3525D0);

    swift_unknownObjectRelease();
    sub_25B37F440();
    swift_allocObject();
    sub_25B37F430();
    sub_25B35C728();
    uint64_t v10 = sub_25B37F420();
    unint64_t v12 = v11;
    uint64_t v13 = (void *)sub_25B37F560();
    sub_25B2CA2D8(v10, v12);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    sub_25B35C6D4();
    uint64_t v8 = (void *)swift_allocError();
    *(unsigned char *)uint64_t v9 = 2;
    *(void *)(v9 + 8) = 0;
    swift_willThrow();
    if (a3)
    {
      uint64_t v6 = (void *)sub_25B37F460();

      id v7 = v6;
      uint64_t v13 = 0;
      *a3 = v6;
    }
    else
    {

      uint64_t v13 = 0;
    }
  }
  return v13;
}

- (BOOL)eraseAndReturnError:(id *)a3
{
  if (MEMORY[0x261162290]((char *)self + OBJC_IVAR____TtC18ReplicatorServicesP33_E12FEAD95517CBB4AB29168F11BCC1CA6Client_delegate, a2))
  {
    id v4 = self;
    sub_25B354D64();

    swift_unknownObjectRelease();
  }
  return 1;
}

@end