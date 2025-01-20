@interface FinderStateTrampoline
- (_TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline)init;
- (void)disableFinderModeWithCompletion:(id)a3;
- (void)enableFinderModeWithCompletion:(id)a3;
- (void)fetchFinderState:(id)a3;
- (void)setActiveCache:(int64_t)a3 completion:(id)a4;
- (void)start;
- (void)stateInfoWithCompletion:(id)a3;
@end

@implementation FinderStateTrampoline

- (void)start
{
  sub_10001D4B0(0, (unint64_t *)&qword_10163AE70);
  v3 = self;
  id v4 = (id)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
}

- (void)enableFinderModeWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_10001D4B0(0, (unint64_t *)&qword_10163AE70);
  v6 = self;
  v7 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  sub_10001D010((uint64_t)v6+ OBJC_IVAR____TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline_implementation, (uint64_t)v10);
  uint64_t v8 = v11;
  uint64_t v9 = v12;
  sub_10001CD44(v10, v11);
  (*(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v9 + 8))(sub_1001E06E0, v5, v8, v9);
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((uint64_t)v10);

  swift_release();
}

- (void)disableFinderModeWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_10001D4B0(0, (unint64_t *)&qword_10163AE70);
  v6 = self;
  v7 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  sub_10001D010((uint64_t)v6+ OBJC_IVAR____TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline_implementation, (uint64_t)v10);
  uint64_t v8 = v11;
  uint64_t v9 = v12;
  sub_10001CD44(v10, v11);
  (*(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v9 + 16))(sub_1001E06E0, v5, v8, v9);
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((uint64_t)v10);

  swift_release();
}

- (void)fetchFinderState:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1010615AC((uint64_t)sub_10013148C, v5);

  swift_release();
}

- (void)stateInfoWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_10001D010((uint64_t)self+ OBJC_IVAR____TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline_implementation, (uint64_t)v11);
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  sub_10001CD44(v11, v12);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1001DFD28;
  *(void *)(v8 + 24) = v5;
  uint64_t v9 = *(void (**)(void (*)(void *, char), uint64_t, uint64_t, uint64_t))(v7 + 24);
  v10 = self;
  swift_retain();
  v9(sub_1010634D8, v8, v6, v7);
  swift_release();
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((uint64_t)v11);

  swift_release();
}

- (void)setActiveCache:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = self;
  sub_101061988(a3, (uint64_t)sub_1001DF814, v7);

  swift_release();
}

- (_TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline)init
{
  result = (_TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end