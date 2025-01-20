@interface NTKComplicationTypeFromStringDict
@end

@implementation NTKComplicationTypeFromStringDict

void ___NTKComplicationTypeFromStringDict_block_invoke()
{
  _NTKStringFromComplicationTypeDict();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = _DictionaryByReversingDictionary(v2);
  v1 = (void *)_NTKComplicationTypeFromStringDict_dictionary;
  _NTKComplicationTypeFromStringDict_dictionary = v0;
}

@end