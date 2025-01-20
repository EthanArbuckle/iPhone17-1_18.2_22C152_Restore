@interface UICollectionView(SearchToShare)
- (void)sts_enumerateAllIndexPathsUsingBlock:()SearchToShare;
@end

@implementation UICollectionView(SearchToShare)

- (void)sts_enumerateAllIndexPathsUsingBlock:()SearchToShare
{
  v4 = a3;
  unsigned __int8 v15 = 0;
  uint64_t v5 = [a1 numberOfSections];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [a1 numberOfItemsInSection:v7];
      if (v8)
      {
        unint64_t v9 = v8;
        unint64_t v10 = 1;
        do
        {
          v11 = [MEMORY[0x263F088C8] indexPathForItem:v10 - 1 inSection:v7];
          v4[2](v4, v11, &v15);
          int v12 = v15;

          if (v12) {
            BOOL v13 = 1;
          }
          else {
            BOOL v13 = v10 >= v9;
          }
          ++v10;
        }
        while (!v13);
      }
      ++v7;
      if (v15) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v7 == v6;
      }
    }
    while (!v14);
  }
}

@end