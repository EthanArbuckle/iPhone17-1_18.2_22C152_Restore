@interface UICollectionViewListLayoutSection
@end

@implementation UICollectionViewListLayoutSection

void __94___UICollectionViewListLayoutSection__hasHeaderFooterBelowLastItemInSection_interactionState___block_invoke(void *a1, void *a2, double a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (a2)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a1[6], a1[4], @"_UICollectionViewListLayoutSection.m", 1296, @"Invalid parameter not satisfying: %@", @"section != nil" object file lineNumber description];

    if (a6) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a1[6], a1[4], @"_UICollectionViewListLayoutSection.m", 1297, @"Invalid parameter not satisfying: %@", @"stop != nil" object file lineNumber description];

LABEL_3:
  if (a3 > 0.0)
  {
    *a6 = 1;
    return;
  }
  v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v15[33];
    if ([v11 _hasHeaderOrFirstItemStyledAsHeader])
    {
      [v15 _paddingToBoundarySupplementaries];
    }
    else
    {
      if (a5 > 0) {
        goto LABEL_11;
      }
      if (![v11 _hasFooter]) {
        goto LABEL_12;
      }
      [v15 contentInsets];
    }
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v12 == 0.0;
LABEL_11:
    *a6 = 1;
LABEL_12:

    goto LABEL_13;
  }
  *a6 = 1;
LABEL_13:
}

@end