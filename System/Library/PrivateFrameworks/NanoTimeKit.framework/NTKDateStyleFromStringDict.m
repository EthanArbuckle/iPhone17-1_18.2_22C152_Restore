@interface NTKDateStyleFromStringDict
@end

@implementation NTKDateStyleFromStringDict

void ___NTKDateStyleFromStringDict_block_invoke()
{
  _NTKStringFromDateStyleDict();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = _DictionaryByReversingDictionary(v2);
  v1 = (void *)_NTKDateStyleFromStringDict_dictionary;
  _NTKDateStyleFromStringDict_dictionary = v0;
}

@end