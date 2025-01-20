@interface PLContactStoreUtilitiesWorkaround
+ (id)contactWithMatchingDictionary:(id)a3 keysToFetch:(id)a4 contactStore:(id)a5;
+ (id)matchingDictionaryForContact:(id)a3 contactStore:(id)a4;
@end

@implementation PLContactStoreUtilitiesWorkaround

+ (id)contactWithMatchingDictionary:(id)a3 keysToFetch:(id)a4 contactStore:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  v12 = [v10 objectForKeyedSubscript:@"version"];
  [v11 setObject:v12 forKeyedSubscript:@"version"];

  v13 = [v10 objectForKeyedSubscript:@"carddav-uuids"];
  [v11 setObject:v13 forKeyedSubscript:@"carddav-uuids"];

  v14 = [v10 objectForKeyedSubscript:@"contact-identifier"];

  [v11 setObject:v14 forKeyedSubscript:@"contact-identifier"];
  v15 = [v8 contactWithMatchingDictionary:v11 keysToFetch:v9];

  return v15;
}

+ (id)matchingDictionaryForContact:(id)a3 contactStore:(id)a4
{
  return (id)[a4 matchingDictionaryForContact:a3];
}

@end