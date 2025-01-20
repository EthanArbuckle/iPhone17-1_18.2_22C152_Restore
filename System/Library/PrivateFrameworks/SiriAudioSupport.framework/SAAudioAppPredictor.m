@interface SAAudioAppPredictor
+ (void)unsafeReleaseModelWithCompletion:(id)a3;
- (SAAudioAppPredictor)init;
- (SAAudioAppPredictor)initWithCaller:(int64_t)a3;
- (void)disambiguationSelectedWithBundleIdentifier:(id)a3 requestId:(id)a4;
- (void)predictWithSearch:(id)a3 options:(id)a4 completion:(id)a5;
- (void)warmWithCompletion:(id)a3;
@end

@implementation SAAudioAppPredictor

- (SAAudioAppPredictor)init
{
  result = (SAAudioAppPredictor *)sub_2380E52B8();
  __break(1u);
  return result;
}

- (SAAudioAppPredictor)initWithCaller:(int64_t)a3
{
  return (SAAudioAppPredictor *)SiriAudioAppPredictor.init(caller:)(a3);
}

- (void)warmWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_237F48860((uint64_t)sub_237F4F918, v5);

  swift_release();
}

- (void)disambiguationSelectedWithBundleIdentifier:(id)a3 requestId:(id)a4
{
  uint64_t v5 = sub_2380E4938();
  uint64_t v7 = v6;
  uint64_t v8 = sub_2380E4938();
  unint64_t v10 = v9;
  v11 = self;
  sub_237F4E7B4(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)predictWithSearch:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_237F4A4D8(v10, v11, (uint64_t)sub_237F4F904, v9);

  swift_release();
}

+ (void)unsafeReleaseModelWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  _s16SiriAudioSupport0aB12AppPredictorC18unsafeReleaseModel10completionyySbc_tFZ_0((uint64_t)sub_237F4FE74, v4);
  swift_release();
}

- (void).cxx_destruct
{
}

@end