@interface NSDictionary(Functional)
- (id)filter:()Functional;
- (id)map:()Functional;
@end

@implementation NSDictionary(Functional)

- (id)filter:()Functional
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:[a1 count]];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__NSDictionary_Functional__filter___block_invoke;
  v8[3] = &unk_1E65ADC30;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)map:()Functional
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  [MEMORY[0x1E4F1CA48] arrayWithCapacity:[a1 count]];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__NSDictionary_Functional__map___block_invoke;
  v8[3] = &unk_1E65ADC30;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

@end