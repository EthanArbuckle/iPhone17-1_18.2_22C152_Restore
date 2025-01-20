@interface SearchUICollectionView
- (SearchUICollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)focusGroupIdentifier;
- (void)layoutSubviews;
@end

@implementation SearchUICollectionView

- (SearchUICollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUICollectionView;
  return -[SearchUICollectionView initWithFrame:collectionViewLayout:](&v5, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)focusGroupIdentifier
{
  return +[SearchUIUtilities focusGroupIdentifier];
}

- (void)layoutSubviews
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)SearchUICollectionView;
  [(SearchUICollectionView *)&v15 layoutSubviews];
  v3 = [MEMORY[0x1E4FAE060] bestAppearanceForView:self];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(SearchUICollectionView *)self subviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        NSClassFromString(&cfstr_Uicollectionvi_0.isa);
        if (objc_opt_isKindOfClass())
        {
          v10 = +[SearchUISeparatorView separatorColorForAppearance:v3];
          [v9 setBackgroundColor:v10];

          [v3 enableAppearanceForView:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }
}

@end