@interface SSRequestsSectionBuilder
+ (id)supportedBundleIds;
- (unint64_t)buildMaxInitiallyVisibleResults;
@end

@implementation SSRequestsSectionBuilder

+ (id)supportedBundleIds
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.people.askToBuyRequest";
  v4[1] = @"com.apple.people.screenTimeRequest";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (unint64_t)buildMaxInitiallyVisibleResults
{
  v3 = objc_opt_new();
  v4 = [(SSSectionBuilder *)self section];
  v5 = [v4 results];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__SSRequestsSectionBuilder_buildMaxInitiallyVisibleResults__block_invoke;
  v13[3] = &unk_1E634CA20;
  id v6 = v3;
  id v14 = v6;
  [v5 enumerateObjectsUsingBlock:v13];

  id v7 = (id)[v6 count];
  if (!v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)SSRequestsSectionBuilder;
    id v7 = [(SSSectionBuilder *)&v12 buildMaxInitiallyVisibleResults];
  }
  v11.receiver = self;
  v11.super_class = (Class)SSRequestsSectionBuilder;
  id v8 = [(SSSectionBuilder *)&v11 buildMaxInitiallyVisibleResults];
  if (v7 >= v8) {
    unint64_t v9 = (unint64_t)v8;
  }
  else {
    unint64_t v9 = (unint64_t)v7;
  }

  return v9;
}

void __59__SSRequestsSectionBuilder_buildMaxInitiallyVisibleResults__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v5 valueForAttribute:*MEMORY[0x1E4F22AA8] withType:objc_opt_class()];
    int v4 = [v3 unsignedIntValue];

    if (v4 == 1) {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

@end