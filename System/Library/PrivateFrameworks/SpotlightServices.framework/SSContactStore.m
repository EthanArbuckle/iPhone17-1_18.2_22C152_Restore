@interface SSContactStore
+ (id)contactForContactIdentifier:(id)a3;
+ (id)contactStore;
+ (id)contactWithEmail:(id)a3;
@end

@implementation SSContactStore

+ (id)contactStore
{
  if (contactStore_sContactStoreOnce != -1) {
    dispatch_once(&contactStore_sContactStoreOnce, &__block_literal_global_4);
  }
  v2 = (void *)contactStore_sContactStore;
  return v2;
}

uint64_t __30__SSContactStore_contactStore__block_invoke()
{
  contactStore_sContactStore = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1B980]);
  return MEMORY[0x1F41817F8]();
}

+ (id)contactForContactIdentifier:(id)a3
{
  v16[9] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (contactForContactIdentifier__onceToken != -1) {
    dispatch_once(&contactForContactIdentifier__onceToken, &__block_literal_global_2);
  }
  v5 = [(id)contactForContactIdentifier__contactForIdentifierCache objectForKey:v4];
  if (!v5)
  {
    uint64_t v6 = *MEMORY[0x1E4F1ADE0];
    v16[0] = *MEMORY[0x1E4F1ADF0];
    v16[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F1AEE0];
    v16[2] = *MEMORY[0x1E4F1ADC8];
    v16[3] = v7;
    uint64_t v8 = *MEMORY[0x1E4F1AD90];
    v16[4] = *MEMORY[0x1E4F1AF10];
    v16[5] = v8;
    uint64_t v9 = *MEMORY[0x1E4F1AED8];
    v16[6] = *MEMORY[0x1E4F1AF78];
    v16[7] = v9;
    v10 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v16[8] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:9];

    v12 = [a1 contactStore];
    id v15 = 0;
    v5 = [v12 unifiedContactWithIdentifier:v4 keysToFetch:v11 error:&v15];
    id v13 = v15;

    if (v5) {
      [(id)contactForContactIdentifier__contactForIdentifierCache setObject:v5 forKey:v4];
    }
  }
  return v5;
}

uint64_t __46__SSContactStore_contactForContactIdentifier___block_invoke()
{
  contactForContactIdentifier__contactForIdentifierCache = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)contactWithEmail:(id)a3
{
  v3 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:a3];
  id v4 = [(id)objc_opt_class() contactStore];
  v5 = [v4 unifiedContactsMatchingPredicate:v3 keysToFetch:MEMORY[0x1E4F1CBF0] error:0];
  uint64_t v6 = [v5 firstObject];

  return v6;
}

@end