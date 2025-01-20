@interface BankConnectFormatter
- (_TtC9PassKitUI20BankConnectFormatter)init;
- (id)formatAsOfDate:(id)a3 hasMultipleBalances:(BOOL)a4;
- (id)formatAsOfDateWithFullStop:(id)a3 hasMultipleBalances:(BOOL)a4;
@end

@implementation BankConnectFormatter

- (id)formatAsOfDate:(id)a3 hasMultipleBalances:(BOOL)a4
{
  return sub_19F4EF468(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, uint64_t))BankConnectFormatter.formatAsOfDate(_:hasMultipleBalances:));
}

- (id)formatAsOfDateWithFullStop:(id)a3 hasMultipleBalances:(BOOL)a4
{
  return sub_19F4EF468(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, uint64_t))BankConnectFormatter.formatAsOfDateWithFullStop(_:hasMultipleBalances:));
}

- (_TtC9PassKitUI20BankConnectFormatter)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1A03AF358();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(BankConnectFormatter *)&v5 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC9PassKitUI20BankConnectFormatter_calendar;
  uint64_t v3 = sub_1A03AF398();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end