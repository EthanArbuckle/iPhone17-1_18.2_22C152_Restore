@interface GuideHomeCompositionalLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (GuideHomeCompositionalLayout)initWithSectionProvider:(id)a3 dataProvider:(id)a4;
- (GuideHomeDataProvider)dataProvider;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)setDataProvider:(id)a3;
@end

@implementation GuideHomeCompositionalLayout

- (GuideHomeCompositionalLayout)initWithSectionProvider:(id)a3 dataProvider:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GuideHomeCompositionalLayout;
  v7 = [(GuideHomeCompositionalLayout *)&v14 initWithSectionProvider:a3];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_dataProvider, v6);
    uint64_t v9 = objc_opt_class();
    v10 = +[GuidesSectionBackground decorationViewKind];
    [(GuideHomeCompositionalLayout *)v8 registerClass:v9 forDecorationViewOfKind:v10];

    uint64_t v11 = objc_opt_class();
    v12 = +[CompactGuidesSectionBackground decorationViewKind];
    [(GuideHomeCompositionalLayout *)v8 registerClass:v11 forDecorationViewOfKind:v12];
  }
  return v8;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)GuideHomeCompositionalLayout;
  v4 = -[GuideHomeCompositionalLayout layoutAttributesForElementsInRect:](&v24, "layoutAttributesForElementsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [(GuideHomeCompositionalLayout *)self dataProvider];
  unsigned int v6 = [v5 isCuratedGuidesHome];

  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (!v8) {
      goto LABEL_14;
    }
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (1)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13 = [v12 indexPath:v20];
        if ([v13 section]) {
          goto LABEL_8;
        }
        objc_super v14 = [v12 indexPath];
        id v15 = [v14 item];

        if (!v15)
        {
          v16 = [(GuideHomeCompositionalLayout *)self collectionView];
          [v16 contentOffset];
          double v18 = v17;

          if (v18 < 0.0)
          {
            [v12 frame];
            CGRectGetMaxY(v27);
            v13 = [(GuideHomeCompositionalLayout *)self collectionView];
            [v13 frame];
            [v12 setFrame:0.0, v18];
LABEL_8:

            continue;
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (!v9)
      {
LABEL_14:

        break;
      }
    }
  }

  return v4;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (GuideHomeDataProvider)dataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);

  return (GuideHomeDataProvider *)WeakRetained;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end