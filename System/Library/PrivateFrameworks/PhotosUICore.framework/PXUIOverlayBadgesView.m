@interface PXUIOverlayBadgesView
+ (id)badgesViewWithDefaultBadgesAndOrder;
+ (id)defaultBadges;
+ (id)defaultOrder;
+ (id)defaultViewForBadge:(int64_t)a3;
- (BOOL)isShowingAnyBadge;
- (NSDictionary)badges;
- (PXUIOverlayBadgesView)init;
- (PXUIOverlayBadgesView)initWithBadges:(id)a3 order:(id)a4;
- (PXUIOverlayBadgesView)initWithCoder:(id)a3;
- (PXUIOverlayBadgesView)initWithFrame:(CGRect)a3;
- (UIImageView)backgroundView;
- (UIStackView)stackView;
- (id)createWeaklyReferencedBackgroundView;
- (void)setBackgroundView:(id)a3;
- (void)setIsShowingAnyBadge:(BOOL)a3;
- (void)showBadges:(id)a3;
- (void)showBadgesForPHAsset:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXUIOverlayBadgesView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong((id *)&self->_badges, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

- (void)setIsShowingAnyBadge:(BOOL)a3
{
  self->_isShowingAnyBadge = a3;
}

- (BOOL)isShowingAnyBadge
{
  return self->_isShowingAnyBadge;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIImageView)backgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundView);
  return (UIImageView *)WeakRetained;
}

- (NSDictionary)badges
{
  return self->_badges;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (PXUIOverlayBadgesView)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXUIOverlayBadgesView.m", 158, @"%s is not available as initializer", "-[PXUIOverlayBadgesView initWithCoder:]");

  abort();
}

- (PXUIOverlayBadgesView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXUIOverlayBadgesView.m", 154, @"%s is not available as initializer", "-[PXUIOverlayBadgesView initWithFrame:]");

  abort();
}

- (PXUIOverlayBadgesView)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXUIOverlayBadgesView.m", 150, @"%s is not available as initializer", "-[PXUIOverlayBadgesView init]");

  abort();
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXUIOverlayBadgesView;
  id v4 = a3;
  [(PXUIOverlayBadgesView *)&v11 traitCollectionDidChange:v4];
  id v5 = [(PXUIOverlayBadgesView *)self traitCollection];
  uint64_t v6 = [v5 layoutDirection];
  uint64_t v7 = [v4 layoutDirection];

  if (v6 != v7)
  {
    v8 = [(PXUIOverlayBadgesView *)self traitCollection];
    v9 = +[PXBadgeHelper leadingCornerGradientBackgroundImageForLayoutDirection:](PXBadgeHelper, "leadingCornerGradientBackgroundImageForLayoutDirection:", [v8 layoutDirection]);
    v10 = [(PXUIOverlayBadgesView *)self backgroundView];
    [v10 setImage:v9];
  }
}

- (void)showBadges:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = [(PXUIOverlayBadgesView *)self badges];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * i) setHidden:1];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v8);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = v4;
  uint64_t v33 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v33)
  {
    uint64_t v12 = *(void *)v35;
    uint64_t v13 = v33;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
        v16 = [(PXUIOverlayBadgesView *)self badges];
        v17 = [v16 objectForKeyedSubscript:v15];

        [v17 setHidden:0];
        if ([v15 integerValue] == 4)
        {
          id v18 = v17;
          if (v18)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_16;
            }
            v30 = [MEMORY[0x1E4F28B00] currentHandler];
            v24 = (objc_class *)objc_opt_class();
            v21 = NSStringFromClass(v24);
            v28 = objc_msgSend(v18, "px_descriptionForAssertionMessage");
            [v30 handleFailureInMethod:a2, self, @"PXUIOverlayBadgesView.m", 90, @"%@ should be an instance inheriting from %@, but it is %@", @"badge", v21, v28 object file lineNumber description];
          }
          else
          {
            v30 = [MEMORY[0x1E4F28B00] currentHandler];
            v20 = (objc_class *)objc_opt_class();
            v21 = NSStringFromClass(v20);
            [v30 handleFailureInMethod:a2, self, @"PXUIOverlayBadgesView.m", 90, @"%@ should be an instance inheriting from %@, but it is nil", @"badge", v21 object file lineNumber description];
          }

LABEL_16:
          v19 = [v11 objectForKeyedSubscript:v15];
          if (v19)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
LABEL_18:
              [v18 setText:v19];

              goto LABEL_19;
            }
            v31 = [MEMORY[0x1E4F28B00] currentHandler];
            v25 = (objc_class *)objc_opt_class();
            v23 = NSStringFromClass(v25);
            v29 = objc_msgSend(v19, "px_descriptionForAssertionMessage");
            [v31 handleFailureInMethod:a2, self, @"PXUIOverlayBadgesView.m", 91, @"%@ should be an instance inheriting from %@, but it is %@", @"badgesToShow[badgeNumber]", v23, v29 object file lineNumber description];
          }
          else
          {
            v31 = [MEMORY[0x1E4F28B00] currentHandler];
            v22 = (objc_class *)objc_opt_class();
            v23 = NSStringFromClass(v22);
            [v31 handleFailureInMethod:a2, self, @"PXUIOverlayBadgesView.m", 91, @"%@ should be an instance inheriting from %@, but it is nil", @"badgesToShow[badgeNumber]", v23 object file lineNumber description];
          }

          goto LABEL_18;
        }
LABEL_19:

        ++v14;
      }
      while (v13 != v14);
      uint64_t v26 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
      uint64_t v13 = v26;
    }
    while (v26);
  }

  [(PXUIOverlayBadgesView *)self setIsShowingAnyBadge:v33 != 0];
  v27 = [(PXUIOverlayBadgesView *)self backgroundView];
  [v27 setHidden:v33 == 0];
}

- (id)createWeaklyReferencedBackgroundView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  id v4 = [(PXUIOverlayBadgesView *)self traitCollection];
  id v5 = +[PXBadgeHelper leadingCornerGradientBackgroundImageForLayoutDirection:](PXBadgeHelper, "leadingCornerGradientBackgroundImageForLayoutDirection:", [v4 layoutDirection]);
  uint64_t v6 = (void *)[v3 initWithImage:v5];

  objc_msgSend(v6, "setHidden:", -[PXUIOverlayBadgesView isShowingAnyBadge](self, "isShowingAnyBadge") ^ 1);
  uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
  [v6 setTintColor:v7];

  [(PXUIOverlayBadgesView *)self setBackgroundView:v6];
  return v6;
}

- (PXUIOverlayBadgesView)initWithBadges:(id)a3 order:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PXUIOverlayBadgesView;
  if (-[PXUIOverlayBadgesView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24)))
  {
    v6;
    PXMap();
  }

  return 0;
}

uint64_t __46__PXUIOverlayBadgesView_initWithBadges_order___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

+ (id)defaultViewForBadge:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v4 = @"heart.fill";
      goto LABEL_5;
    case 2:
      id v4 = @"pano.fill";
      goto LABEL_5;
    case 3:
      id v4 = @"icloud.fill";
LABEL_5:
      PXUIOverlayBadgesViewCreateDefaultSystemImageBadgeView(v4);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      id v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
      [v3 setFont:v5];

      id v6 = [MEMORY[0x1E4FB1618] whiteColor];
      [v3 setTextColor:v6];

      break;
    default:
      break;
  }
  return v3;
}

+ (id)defaultOrder
{
  return &unk_1F02D32F8;
}

+ (id)defaultBadges
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = &unk_1F02D59C8;
  id v3 = [a1 defaultViewForBadge:1];
  v9[0] = v3;
  v8[1] = &unk_1F02D59E0;
  id v4 = [a1 defaultViewForBadge:2];
  v9[1] = v4;
  v8[2] = &unk_1F02D59F8;
  id v5 = [a1 defaultViewForBadge:4];
  v9[2] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)badgesViewWithDefaultBadgesAndOrder
{
  id v3 = [PXUIOverlayBadgesView alloc];
  id v4 = [a1 defaultBadges];
  id v5 = [a1 defaultOrder];
  id v6 = [(PXUIOverlayBadgesView *)v3 initWithBadges:v4 order:v5];

  return v6;
}

- (void)showBadgesForPHAsset:(id)a3
{
  id v6 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v6 isFavorite]) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:&unk_1F02DA060];
  }
  if ([v6 isMediaSubtype:1]) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:&unk_1F02DA078];
  }
  if ([v6 isVideo])
  {
    [v6 duration];
    PXLocalizedVideoDuration();
  }
  id v5 = (void *)[v4 copy];
  [(PXUIOverlayBadgesView *)self showBadges:v5];
}

@end