@interface SAAudioAppPredictorResult
- (NSArray)disambiguateBundleIdentifiers;
- (NSString)requestId;
- (NSString)selectedBundleIdentifier;
- (SAAudioAppPredictorResult)init;
- (SAAudioAppPredictorResult)initWithRequestId:(id)a3 selectedBundleIdentifier:(id)a4 disambiguateBundleIdentifiers:(id)a5;
@end

@implementation SAAudioAppPredictorResult

- (NSString)requestId
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2380E4918();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)selectedBundleIdentifier
{
  if (*(void *)&self->requestId[OBJC_IVAR___SAAudioAppPredictorResult_selectedBundleIdentifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_2380E4918();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSArray)disambiguateBundleIdentifiers
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___SAAudioAppPredictorResult_disambiguateBundleIdentifiers))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_2380E4B08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (SAAudioAppPredictorResult)init
{
  result = (SAAudioAppPredictorResult *)sub_2380E52B8();
  __break(1u);
  return result;
}

- (SAAudioAppPredictorResult)initWithRequestId:(id)a3 selectedBundleIdentifier:(id)a4 disambiguateBundleIdentifiers:(id)a5
{
  uint64_t v8 = sub_2380E4938();
  uint64_t v10 = v9;
  if (!a4)
  {
    v12 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  a4 = (id)sub_2380E4938();
  v12 = v11;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  v13 = (objc_class *)sub_2380E4B28();
LABEL_6:
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___SAAudioAppPredictorResult_requestId);
  uint64_t *v14 = v8;
  v14[1] = v10;
  v15 = (id *)((char *)&self->super.isa + OBJC_IVAR___SAAudioAppPredictorResult_selectedBundleIdentifier);
  id *v15 = a4;
  v15[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SAAudioAppPredictorResult_disambiguateBundleIdentifiers) = v13;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for SiriAudioAppPredictorResult();
  return [(SAAudioAppPredictorResult *)&v17 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end