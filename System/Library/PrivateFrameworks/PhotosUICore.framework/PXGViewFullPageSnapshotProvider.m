@interface PXGViewFullPageSnapshotProvider
- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4;
@end

@implementation PXGViewFullPageSnapshotProvider

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_1A9D5E1DC;
  v8[5] = v7;
  id v9 = a3;
  swift_retain_n();
  id v10 = v9;
  sub_1AB22F8DC();
  sub_1AA252570((uint64_t)sub_1AA255D70, (uint64_t)v8);

  swift_release();
  swift_release();
  swift_release();
}

@end