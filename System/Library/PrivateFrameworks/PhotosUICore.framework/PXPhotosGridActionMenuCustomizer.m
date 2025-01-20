@interface PXPhotosGridActionMenuCustomizer
- (PXPhotosGridActionMenuCustomizer)init;
- (PXPhotosGridActionMenuCustomizer)initWithViewModel:(id)a3 excludedActionTypes:(id)a4;
- (id)customizedActions:(id)a3 actionTypes:(id)a4;
@end

@implementation PXPhotosGridActionMenuCustomizer

- (PXPhotosGridActionMenuCustomizer)initWithViewModel:(id)a3 excludedActionTypes:(id)a4
{
  sub_1AB23AFCC();
  a3;
  v6 = self;
  PXPhotosViewModel.customMenuActionsProvider.getter();
}

- (id)customizedActions:(id)a3 actionTypes:(id)a4
{
  v5 = _Block_copy(a4);
  sub_1A9B21070(0, (unint64_t *)&qword_1E981B7E0);
  uint64_t v6 = sub_1AB23AADC();
  _Block_copy(v5);
  sub_1AA24A344(v6, (uint64_t)self, v5);
}

- (PXPhotosGridActionMenuCustomizer)init
{
  result = (PXPhotosGridActionMenuCustomizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end