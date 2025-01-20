@interface _PSPeopleSuggestionsMetricsModelInternal
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_PSPeopleSuggestionsMetricsModelInternal)init;
- (_PSPeopleSuggestionsMetricsModelInternal)initWithModelIdentifier:(id)a3 trialIdentifier:(id)a4;
- (_PSPeopleSuggestionsMetricsModelInternal)initWithModelType:(int64_t)a3 trialIdentifier:(id)a4;
- (int64_t)hash;
@end

@implementation _PSPeopleSuggestionsMetricsModelInternal

- (_PSPeopleSuggestionsMetricsModelInternal)initWithModelType:(int64_t)a3 trialIdentifier:(id)a4
{
  v6 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(void *)v8 = a3;
  v8[8] = 0;
  v9 = &v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  *(void *)v9 = 0;
  *((void *)v9 + 1) = 0;
  *(void *)&v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a4;
  v13.receiver = v7;
  v13.super_class = v6;
  id v10 = a4;
  v11 = [(_PSPeopleSuggestionsMetricsModelInternal *)&v13 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

- (_PSPeopleSuggestionsMetricsModelInternal)initWithModelIdentifier:(id)a3 trialIdentifier:(id)a4
{
  uint64_t v5 = sub_25B3DCDE8();
  uint64_t v7 = v6;
  v8 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  v9 = (char *)objc_allocWithZone(v8);
  id v10 = &v9[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(void *)id v10 = 0;
  v10[8] = 1;
  v11 = (uint64_t *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  uint64_t *v11 = v5;
  v11[1] = v7;
  *(void *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a4;
  v15.receiver = v9;
  v15.super_class = v8;
  id v12 = a4;
  objc_super v13 = [(_PSPeopleSuggestionsMetricsModelInternal *)&v15 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_25B3C0708();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_25B3C4418(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_25B3C0840);
}

- (_PSPeopleSuggestionsMetricsModelInternal)init
{
  result = (_PSPeopleSuggestionsMetricsModelInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  int64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
}

- (NSString)description
{
  return (NSString *)sub_25B3C5CB4(self, (uint64_t)a2, (void (*)(void))PeopleSuggestions.PeopleSuggestion.Model.description.getter);
}

@end