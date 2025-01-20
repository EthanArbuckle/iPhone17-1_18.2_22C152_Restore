@interface _UIOpenInAppActivityDataProvider
+ (id)preparedActivityExtensionItemDataForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4;
@end

@implementation _UIOpenInAppActivityDataProvider

+ (id)preparedActivityExtensionItemDataForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(UISUIActivityExtensionItemData);
  v8 = _NSExtensionItemsFromActivityItemValuesForExtensionItemDataRequestWithProcessingBlock(v5, v6, &__block_literal_global_51);
  [(UISUIActivityExtensionItemData *)v7 setExtensionItems:v8];

  v19 = v6;
  v9 = [v6 activityType];
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = +[_UIActivityItemMapping _openURLAnnotationForActivityItem:v16 activityType:v9];
          if (v17) {
            [v10 setObject:v17 forKeyedSubscript:v16];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  [(UISUIActivityExtensionItemData *)v7 setOpenURLAnnotationsByURL:v10];
  return v7;
}

@end