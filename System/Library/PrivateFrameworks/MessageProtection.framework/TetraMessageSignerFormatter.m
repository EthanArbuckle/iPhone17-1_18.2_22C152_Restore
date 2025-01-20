@interface TetraMessageSignerFormatter
- (_TtC17MessageProtection27TetraMessageSignerFormatter)init;
- (id)signedData;
@end

@implementation TetraMessageSignerFormatter

- (id)signedData
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17MessageProtection27TetraMessageSignerFormatter__signedData);
  unint64_t v3 = *(void *)&self->_signedData[OBJC_IVAR____TtC17MessageProtection27TetraMessageSignerFormatter__signedData];
  outlined copy of Data._Representation(v2, v3);
  v4.super.isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v2, v3);
  return v4.super.isa;
}

- (_TtC17MessageProtection27TetraMessageSignerFormatter)init
{
  result = (_TtC17MessageProtection27TetraMessageSignerFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end