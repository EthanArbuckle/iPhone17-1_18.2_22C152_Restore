@interface MFCategoryPersistence
@end

@implementation MFCategoryPersistence

void __69__MFCategoryPersistence_iOS_prepareToPersistCategorizationResultMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v8 = v4;
  v6 = [v8 category];
  if ([v6 state] != 3)
  {
    v7 = [v5 category];
    [v8 setCategory:v7];
  }
}

@end