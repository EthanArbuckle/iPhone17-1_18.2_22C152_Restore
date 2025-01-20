@interface NTKEditModeFromStringDict
@end

@implementation NTKEditModeFromStringDict

void ___NTKEditModeFromStringDict_block_invoke()
{
  _NTKStringFromEditModeDict();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = _DictionaryByReversingDictionary(v2);
  v1 = (void *)_NTKEditModeFromStringDict_dictionary;
  _NTKEditModeFromStringDict_dictionary = v0;
}

@end