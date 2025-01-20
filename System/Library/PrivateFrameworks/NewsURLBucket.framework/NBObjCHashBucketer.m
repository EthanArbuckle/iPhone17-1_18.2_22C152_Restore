@interface NBObjCHashBucketer
- (NBObjCHashBucketer)init;
- (int64_t)bucketForHash:(id)a3 bucketCount:(int64_t)a4;
@end

@implementation NBObjCHashBucketer

- (int64_t)bucketForHash:(id)a3 bucketCount:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  uint64_t v8 = sub_1B00594D8();
  unint64_t v10 = v9;

  int64_t v11 = _s13NewsURLBucket12HashBucketerC6bucket3for0E5CountSi10Foundation4DataV_SitF_0(v8, v10, a4);
  sub_1B005540C(v8, v10);

  return v11;
}

- (NBObjCHashBucketer)init
{
  return (NBObjCHashBucketer *)sub_1B005732C((char *)self, (uint64_t)a2, &OBJC_IVAR___NBObjCHashBucketer_hashBucketer, (void (*)(void))type metadata accessor for HashBucketer);
}

- (void).cxx_destruct
{
}

@end