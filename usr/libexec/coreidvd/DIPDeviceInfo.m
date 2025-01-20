@interface DIPDeviceInfo
- (_TtC8coreidvd13DIPDeviceInfo)init;
- (void)phoneNumberChanged:(id)a3;
@end

@implementation DIPDeviceInfo

- (_TtC8coreidvd13DIPDeviceInfo)init
{
  return (_TtC8coreidvd13DIPDeviceInfo *)sub_1004E7E6C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd13DIPDeviceInfo__seInfo);
  uint64_t v4 = *(void *)&self->workQueue[OBJC_IVAR____TtC8coreidvd13DIPDeviceInfo__seInfo];

  sub_10013FEE4(v3, v4);
}

- (void)phoneNumberChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004EA288(v4);
}

@end