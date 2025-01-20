@interface NSDictionary(WLKAdditions)
- (WLKArtworkVariantListing)wlk_artworkVariantListingForKey:()WLKAdditions;
- (id)_lookupValueForKey:()WLKAdditions expectedClass:;
- (id)wlk_arrayForKey:()WLKAdditions;
- (id)wlk_caseInsensitiveValueForKey:()WLKAdditions;
- (id)wlk_dataForKey:()WLKAdditions;
- (id)wlk_dateForKey:()WLKAdditions;
- (id)wlk_dateFromMillisecondsSince1970ForKey:()WLKAdditions;
- (id)wlk_dictionaryByReplacingOccurrencesOfKey:()WLKAdditions with:;
- (id)wlk_dictionaryDifference:()WLKAdditions;
- (id)wlk_dictionaryForKey:()WLKAdditions;
- (id)wlk_numberForKey:()WLKAdditions;
- (id)wlk_stringForKey:()WLKAdditions;
- (id)wlk_urlForKey:()WLKAdditions;
- (uint64_t)wlk_BOOLForKey:()WLKAdditions defaultValue:;
@end

@implementation NSDictionary(WLKAdditions)

- (uint64_t)wlk_BOOLForKey:()WLKAdditions defaultValue:
{
  v5 = objc_msgSend(a1, "wlk_numberForKey:");
  v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (id)wlk_numberForKey:()WLKAdditions
{
  id v4 = a3;
  v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)wlk_stringForKey:()WLKAdditions
{
  id v4 = a3;
  v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)_lookupValueForKey:()WLKAdditions expectedClass:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (v1 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }

  return v1;
}

- (id)wlk_dictionaryForKey:()WLKAdditions
{
  id v4 = a3;
  v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)wlk_dictionaryDifference:()WLKAdditions
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__NSDictionary_WLKAdditions__wlk_dictionaryDifference___block_invoke;
  v17[3] = &unk_1E620C348;
  id v6 = v4;
  id v18 = v6;
  id v7 = v5;
  id v19 = v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v17];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __55__NSDictionary_WLKAdditions__wlk_dictionaryDifference___block_invoke_2;
  v14 = &unk_1E620C348;
  v15 = a1;
  id v8 = v7;
  id v16 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:&v11];
  if (objc_msgSend(v8, "count", v11, v12, v13, v14, v15)) {
    v9 = (void *)[v8 copy];
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (id)wlk_caseInsensitiveValueForKey:()WLKAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__NSDictionary_WLKAdditions__wlk_caseInsensitiveValueForKey___block_invoke;
  v8[3] = &unk_1E620C450;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)wlk_arrayForKey:()WLKAdditions
{
  id v4 = a3;
  id v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)wlk_urlForKey:()WLKAdditions
{
  id v4 = a3;
  id v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (WLKArtworkVariantListing)wlk_artworkVariantListingForKey:()WLKAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = [[WLKArtworkVariantListing alloc] initWithArtworkDictionary:v1];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)wlk_dateForKey:()WLKAdditions
{
  id v4 = a3;
  id v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)wlk_dateFromMillisecondsSince1970ForKey:()WLKAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "wlk_dateWithMillisecondsSince1970:", v1);

  return v2;
}

- (id)wlk_dataForKey:()WLKAdditions
{
  id v4 = a3;
  id v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)wlk_dictionaryByReplacingOccurrencesOfKey:()WLKAdditions with:
{
  return _WLKDeepReplacement(a1, a3, a4);
}

@end