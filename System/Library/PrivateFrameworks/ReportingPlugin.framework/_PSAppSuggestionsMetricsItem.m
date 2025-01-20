@interface _PSAppSuggestionsMetricsItem
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)model;
- (NSString)transportBundleId;
- (_PSAppSuggestionsMetricsItem)init;
- (_PSAppSuggestionsMetricsItem)initWithTransportBundleId:(id)a3 model:(id)a4 rank:(unsigned __int8)a5;
- (int64_t)hash;
- (unsigned)rank;
@end

@implementation _PSAppSuggestionsMetricsItem

- (NSString)transportBundleId
{
  return (NSString *)sub_25B3C3330();
}

- (NSString)model
{
  return (NSString *)sub_25B3C3330();
}

- (unsigned)rank
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____PSAppSuggestionsMetricsItem_rank);
}

- (_PSAppSuggestionsMetricsItem)initWithTransportBundleId:(id)a3 model:(id)a4 rank:(unsigned __int8)a5
{
  uint64_t v7 = sub_25B3DCDE8();
  uint64_t v9 = v8;
  uint64_t v10 = sub_25B3DCDE8();
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId);
  uint64_t *v11 = v7;
  v11[1] = v9;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR____PSAppSuggestionsMetricsItem_model);
  uint64_t *v12 = v10;
  v12[1] = v13;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____PSAppSuggestionsMetricsItem_rank) = a5;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for AppSuggestions.AppSuggestion();
  return [(_PSAppSuggestionsMetricsItem *)&v15 init];
}

- (int64_t)hash
{
  sub_25B3DD418();
  v3 = self;
  swift_bridgeObjectRetain();
  sub_25B3DCE18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25B3DCE18();
  swift_bridgeObjectRelease();
  int64_t v4 = sub_25B3DD3F8();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return sub_25B3C4418(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_25B3C2408);
}

- (_PSAppSuggestionsMetricsItem)init
{
  result = (_PSAppSuggestionsMetricsItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_25B3C5CB4(self, (uint64_t)a2, (void (*)(void))AppSuggestions.AppSuggestion.description.getter);
}

@end