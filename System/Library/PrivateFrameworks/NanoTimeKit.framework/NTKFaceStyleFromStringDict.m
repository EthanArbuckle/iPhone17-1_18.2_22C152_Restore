@interface NTKFaceStyleFromStringDict
@end

@implementation NTKFaceStyleFromStringDict

void ___NTKFaceStyleFromStringDict_block_invoke()
{
  _NTKStringFromFaceStyleDict();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = _DictionaryByReversingDictionary(v2);
  v1 = (void *)_NTKFaceStyleFromStringDict_dictionary;
  _NTKFaceStyleFromStringDict_dictionary = v0;
}

@end