@interface PXPeopleStripCollectionViewCell
- (NSArray)groupAvatarViews;
- (NSArray)people;
- (PXPeopleStripCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)focusEffect;
- (void)_layoutAvatarViewsInFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setGroupAvatarViews:(id)a3;
- (void)setPeople:(id)a3;
@end

@implementation PXPeopleStripCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupAvatarViews, 0);
  objc_storeStrong((id *)&self->_people, 0);
}

- (NSArray)groupAvatarViews
{
  return self->_groupAvatarViews;
}

- (NSArray)people
{
  return self->_people;
}

- (id)focusEffect
{
  v3 = [(PXPeopleStripCollectionViewCell *)self contentView];
  v4 = [v3 layer];
  [v4 cornerRadius];
  double v6 = v5;
  v7 = [v4 cornerCurve];
  v8 = +[PXFocusInfo focusInfoWithView:v3 cornerRadius:v7 cornerCurve:v6];

  v9 = [v8 makeHaloEffectForSourceView:self];

  return v9;
}

- (void)_layoutAvatarViewsInFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PXPeopleStripCollectionViewCell *)self groupAvatarViews];
  objc_claimAutoreleasedReturnValue();
  v7.origin.CGFloat x = x;
  v7.origin.CGFloat y = y;
  v7.size.CGFloat width = width;
  v7.size.CGFloat height = height;
  CGRectGetMinX(v7);
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  CGRectGetMinY(v8);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  CGRectGetWidth(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGRectGetWidth(v10);
  [MEMORY[0x1E4FB1BA8] mainScreen];
  [(id)objc_claimAutoreleasedReturnValue() scale];
  PXFloatFloorToPixel();
}

- (void)setPeople:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_people, a3);
  v40 = v5;
  unint64_t v6 = [v5 count];
  if (v6 >= 9) {
    uint64_t v7 = 9;
  }
  else {
    uint64_t v7 = v6;
  }
  v39 = [MEMORY[0x1E4F1CA48] array];
  [(PXPeopleStripCollectionViewCell *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [(PXPeopleStripCollectionViewCell *)self tag];
  if (v7)
  {
    uint64_t v17 = 0;
    v18 = (void *)(v16 + 1);
    double v35 = v13 * 0.5;
    if (v13 >= v15) {
      double v19 = v15;
    }
    else {
      double v19 = v13;
    }
    uint64_t v20 = 72 * v7 - 72;
    v38 = (char *)&yFactors + v20;
    v36 = v42;
    v37 = (char *)&xFactors + v20;
    do
    {
      v21 = -[PXFocusableUIImageView initWithFrame:]([PXFocusableUIImageView alloc], "initWithFrame:", v9, v11, v13, v15);
      [(PXFocusableUIImageView *)v21 setOpaque:1];
      v22 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
      [(PXFocusableUIImageView *)v21 setBackgroundColor:v22];

      [(PXFocusableUIImageView *)v21 setContentMode:2];
      [(PXFocusableUIImageView *)v21 setClipsToBounds:1];
      [(PXFocusableUIImageView *)v21 setAllowsFocus:0];
      if (v7 == 1)
      {
        v23 = [(PXFocusableUIImageView *)v21 layer];
        [v23 setCornerRadius:v35];
      }
      objc_msgSend(v39, "addObject:", v21, *(void *)&v35, v36);
      [(PXPeopleStripCollectionViewCell *)self setTag:v18];
      v24 = [v40 objectAtIndexedSubscript:v17];
      double v25 = v19 * *(double *)&v37[8 * v17];
      double v26 = v19 * *(double *)&v38[8 * v17];
      v27 = [PXPeopleFaceCropFetchOptions alloc];
      v28 = [(PXPeopleStripCollectionViewCell *)self traitCollection];
      [v28 displayScale];
      v30 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:](v27, "initWithPerson:targetSize:displayScale:", v24, v25, v26, v29);

      v31 = +[PXPeopleSocialGroupViewGenerator indexesThatNeedPortraitCropsForNumberOfFaces:v7];
      if ([v31 containsIndex:v17]) {
        [(PXPeopleFaceCropFetchOptions *)v30 setCropFactor:3];
      }
      if (v7 != 1) {
        [(PXPeopleFaceCropFetchOptions *)v30 setCornerStyle:0];
      }
      objc_initWeak(location, self);
      v32 = +[PXPeopleFaceCropManager sharedManager];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v42[0] = __45__PXPeopleStripCollectionViewCell_setPeople___block_invoke;
      v42[1] = &unk_1E5DBD938;
      objc_copyWeak(v45, location);
      v45[1] = v18;
      v33 = v21;
      v43 = v33;
      id v34 = v24;
      id v44 = v34;
      [v32 requestFaceCropForOptions:v30 resultHandler:v41];

      objc_destroyWeak(v45);
      objc_destroyWeak(location);

      ++v17;
    }
    while (v7 != v17);
  }
  [(PXPeopleStripCollectionViewCell *)self setGroupAvatarViews:v39];
  [(PXPeopleStripCollectionViewCell *)self setNeedsLayout];
}

void __45__PXPeopleStripCollectionViewCell_setPeople___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(v7, a1 + 6);
  v7[1] = a1[7];
  v6;
  a1[4];
  v5;
  px_dispatch_on_main_queue();
}

void __45__PXPeopleStripCollectionViewCell_setPeople___block_invoke_2(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 56));
  id v2 = objc_loadWeakRetained(&to);
  if (v2)
  {
    v3 = v2;
    id v4 = objc_loadWeakRetained(&to);
    uint64_t v5 = [v4 tag];
    uint64_t v6 = *(void *)(a1 + 64);

    if (v5 == v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
      [v7 CGRectValue];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      uint64_t v16 = [*(id *)(a1 + 40) layer];
      objc_msgSend(v16, "setContentsRect:", v9, v11, v13, v15);

      [*(id *)(a1 + 40) setImage:*(void *)(a1 + 48)];
    }
  }
  objc_destroyWeak(&to);
}

- (void)setGroupAvatarViews:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (NSArray *)a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = self->_groupAvatarViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v9++) removeFromSuperview];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  double v10 = [(PXPeopleStripCollectionViewCell *)self contentView];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v11 = [(NSArray *)v4 reverseObjectEnumerator];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        [v10 addSubview:*(void *)(*((void *)&v21 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v13);
  }

  if ([(NSArray *)v4 count] > 1)
  {
    double v19 = [v10 layer];
    [v19 setCornerRadius:10.0];

    [v10 setClipsToBounds:1];
  }
  else
  {
    [v10 frame];
    double v17 = v16 * 0.5;
    v18 = [v10 layer];
    [v18 setCornerRadius:v17];
  }
  groupAvatarViews = self->_groupAvatarViews;
  self->_groupAvatarViews = v4;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleStripCollectionViewCell;
  [(PXPeopleStripCollectionViewCell *)&v5 prepareForReuse];
  [(PXPeopleStripCollectionViewCell *)self setPeople:0];
  [(PXPeopleStripCollectionViewCell *)self setGroupAvatarViews:0];
  v3 = [(PXPeopleStripCollectionViewCell *)self contentView];
  id v4 = [v3 layer];
  [v4 setCornerRadius:0.0];

  [v3 setClipsToBounds:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleStripCollectionViewCell;
  [(PXPeopleStripCollectionViewCell *)&v3 layoutSubviews];
  [(PXPeopleStripCollectionViewCell *)self bounds];
  CGRect v5 = CGRectIntegral(v4);
  -[PXPeopleStripCollectionViewCell _layoutAvatarViewsInFrame:](self, "_layoutAvatarViewsInFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (PXPeopleStripCollectionViewCell)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXPeopleStripCollectionViewCell;
  return -[PXPeopleStripCollectionViewCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end