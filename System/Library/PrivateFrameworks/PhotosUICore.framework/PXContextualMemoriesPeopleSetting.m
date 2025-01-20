@interface PXContextualMemoriesPeopleSetting
- (NSArray)peopleNames;
- (NSString)headerTitle;
- (NSString)title;
- (PXContextualMemoriesPeopleSetting)init;
- (void)requestPeopleNamesUpdateSinceDate:(id)a3 withCompletionHandler:(id)a4;
- (void)resetToDefault;
- (void)setPeopleNames:(id)a3;
@end

@implementation PXContextualMemoriesPeopleSetting

- (void).cxx_destruct
{
}

- (void)setPeopleNames:(id)a3
{
}

- (NSArray)peopleNames
{
  return self->_peopleNames;
}

- (void)requestPeopleNamesUpdateSinceDate:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)resetToDefault
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  px_dispatch_on_main_queue();
}

void __51__PXContextualMemoriesPeopleSetting_resetToDefault__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPeopleNames:MEMORY[0x1E4F1CBF0]];
  v1 = objc_opt_new();
  id v2 = [v1 peopleProximityDate];
  [WeakRetained requestPeopleNamesUpdateSinceDate:v2 withCompletionHandler:&__block_literal_global_5442];
}

- (NSString)title
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(PXContextualMemoriesPeopleSetting *)self peopleNames];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        if (-v7 == i) {
          v10 = @"• %@";
        }
        else {
          v10 = @"\n• %@";
        }
        objc_msgSend(v3, "appendFormat:", v10, *(void *)(*((void *)&v12 + 1) + 8 * i));
      }
      v7 += v6;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSString *)v3;
}

- (NSString)headerTitle
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"People" value:&stru_1F00B0030 table:0];

  return (NSString *)v3;
}

- (PXContextualMemoriesPeopleSetting)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXContextualMemoriesPeopleSetting;
  return [(PXContextualMemoriesPeopleSetting *)&v3 init];
}

@end