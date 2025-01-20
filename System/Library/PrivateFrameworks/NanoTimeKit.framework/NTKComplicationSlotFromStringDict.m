@interface NTKComplicationSlotFromStringDict
@end

@implementation NTKComplicationSlotFromStringDict

void ___NTKComplicationSlotFromStringDict_block_invoke()
{
  _NTKStringFromComplicationSlotDict();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = _DictionaryByReversingDictionary(v2);
  v1 = (void *)_NTKComplicationSlotFromStringDict_dictionary;
  _NTKComplicationSlotFromStringDict_dictionary = v0;
}

@end