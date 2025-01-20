@interface ExpandableTextView.MeasurementsCacheKey
- (BOOL)isEqual:(id)a3;
- (_TtCC8AppStore18ExpandableTextViewP33_059173C074D556A1611F1918B5AC36A120MeasurementsCacheKey)init;
- (int64_t)hash;
@end

@implementation ExpandableTextView.MeasurementsCacheKey

- (BOOL)isEqual:(id)a3
{
  return sub_1005C8B98(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1005C85AC);
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_1005C87D4();

  return v3;
}

- (_TtCC8AppStore18ExpandableTextViewP33_059173C074D556A1611F1918B5AC36A120MeasurementsCacheKey)init
{
  result = (_TtCC8AppStore18ExpandableTextViewP33_059173C074D556A1611F1918B5AC36A120MeasurementsCacheKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8AppStore18ExpandableTextViewP33_059173C074D556A1611F1918B5AC36A120MeasurementsCacheKey_traitCollection));
  Swift::Int v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC8AppStore18ExpandableTextViewP33_059173C074D556A1611F1918B5AC36A120MeasurementsCacheKey_attributedText);
}

@end