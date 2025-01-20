@interface _PSPeopleSuggestionsMetricsItemInternal
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)id;
- (_PSPeopleSuggestionsMetricsItemInternal)init;
- (_PSPeopleSuggestionsMetricsItemInternal)initWithId:(id)a3 model:(id)a4 transportBundleId:(id)a5 rank:(unsigned __int8)a6 score:(double)a7;
- (_PSPeopleSuggestionsMetricsModelInternal)model;
- (int64_t)hash;
@end

@implementation _PSPeopleSuggestionsMetricsItemInternal

- (NSString)id
{
  return (NSString *)sub_25B3C3330();
}

- (_PSPeopleSuggestionsMetricsModelInternal)model
{
  return (_PSPeopleSuggestionsMetricsModelInternal *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model));
}

- (_PSPeopleSuggestionsMetricsItemInternal)initWithId:(id)a3 model:(id)a4 transportBundleId:(id)a5 rank:(unsigned __int8)a6 score:(double)a7
{
  uint64_t v10 = sub_25B3DCDE8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_25B3DCDE8();
  return (_PSPeopleSuggestionsMetricsItemInternal *)PeopleSuggestions.PeopleSuggestion.init(id:model:transportBundleId:rank:score:)(v10, v12, (uint64_t)a4, v13, v14, a6, a7);
}

- (int64_t)hash
{
  sub_25B3DD418();
  v3 = self;
  swift_bridgeObjectRetain();
  sub_25B3DCE18();
  swift_bridgeObjectRelease();
  id v4 = *(id *)((char *)&v3->super.isa + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model);
  sub_25B3DCFF8();

  int64_t v5 = sub_25B3DD3F8();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return sub_25B3C4418(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_25B3C10F0);
}

- (_PSPeopleSuggestionsMetricsItemInternal)init
{
  result = (_PSPeopleSuggestionsMetricsItemInternal *)_swift_stdlib_reportUnimplementedInitializer();
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
  return (NSString *)sub_25B3C5CB4(self, (uint64_t)a2, (void (*)(void))PeopleSuggestions.PeopleSuggestion.description.getter);
}

@end