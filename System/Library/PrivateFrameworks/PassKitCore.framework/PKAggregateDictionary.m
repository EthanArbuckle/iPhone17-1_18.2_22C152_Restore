@interface PKAggregateDictionary
+ (id)sharedDictionary;
@end

@implementation PKAggregateDictionary

+ (id)sharedDictionary
{
  if (qword_1EB403438 != -1) {
    dispatch_once(&qword_1EB403438, &__block_literal_global_189);
  }
  v2 = (void *)_MergedGlobals_273;
  return v2;
}

void __41__PKAggregateDictionary_sharedDictionary__block_invoke()
{
  v0 = objc_alloc_init(PKAggregateDictionary);
  v1 = (void *)_MergedGlobals_273;
  _MergedGlobals_273 = (uint64_t)v0;
}

@end