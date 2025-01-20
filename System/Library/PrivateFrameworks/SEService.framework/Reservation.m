@interface Reservation
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC9SEService11Reservation)init;
- (_TtC9SEService11Reservation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation Reservation

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2147AD288();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = Reservation.isEqual(_:)((uint64_t)v8);

  sub_21472C730((uint64_t)v8, &qword_26781C4C8);
  return v6 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  Reservation.encode(with:)((NSCoder)v4);
}

- (_TtC9SEService11Reservation)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC9SEService11Reservation *)sub_21472BC54();

  return v4;
}

- (NSString)description
{
  v2 = self;
  Reservation.description.getter();

  id v3 = (void *)sub_2147ACF38();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return byte_26781C4B0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26781C4B0 = a3;
}

- (_TtC9SEService11Reservation)init
{
  result = (_TtC9SEService11Reservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC9SEService11Reservation_uuid;
  uint64_t v4 = sub_2147ACD88();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_2147201A0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService11Reservation_type), *(void *)&self->_anon_0[OBJC_IVAR____TtC9SEService11Reservation_type]);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService11Reservation_metadata);
  unint64_t v6 = *(void *)&self->_anon_0[OBJC_IVAR____TtC9SEService11Reservation_metadata];
  sub_21472BBFC(v5, v6);
}

@end