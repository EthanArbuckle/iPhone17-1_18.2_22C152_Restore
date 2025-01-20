@interface REFrequencyFeatureTransformer
+ (id)frequencyTransformWithCount:(unint64_t)a3;
+ (id)frequencyTransformWithCount:(unint64_t)a3 minimumValidCount:(int64_t)a4;
@end

@implementation REFrequencyFeatureTransformer

+ (id)frequencyTransformWithCount:(unint64_t)a3
{
  return (id)[a1 frequencyTransformWithCount:a3 minimumValidCount:-1];
}

+ (id)frequencyTransformWithCount:(unint64_t)a3 minimumValidCount:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CFTypeRef v8 = (CFTypeRef)RECreateIntegerFeatureValueTaggedPointer(a3);
  CFTypeRef v9 = (CFTypeRef)RECreateIntegerFeatureValueTaggedPointer(a4);
  v5 = +[RETransformerInvocation invocationWithArguments:&v8 count:2];
  REReleaseFeatureValueTaggedPointer(v8);
  REReleaseFeatureValueTaggedPointer(v9);
  v6 = objc_alloc_init(_REFrequencyFeatureTransformer);
  [(_REFrequencyFeatureTransformer *)v6 configureWithInvocation:v5];

  return v6;
}

@end