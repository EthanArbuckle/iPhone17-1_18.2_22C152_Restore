@interface CACEditingModeOverlayWordsView
- (CACEditingModeOverlayWordsView)initWithFrame:(CGRect)a3;
- (NSArray)labels;
- (int64_t)overlayType;
- (void)setLabels:(id)a3;
- (void)setOverlayType:(int64_t)a3;
@end

@implementation CACEditingModeOverlayWordsView

- (CACEditingModeOverlayWordsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)CACEditingModeOverlayWordsView;
  v7 = -[CACEditingModeOverlayWordsView initWithFrame:](&v13, sel_initWithFrame_);
  uint64_t v8 = +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 0, x, y, width, height);
  badgeContainer = v7->_badgeContainer;
  v7->_badgeContainer = (UIView *)v8;

  uint64_t v10 = +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 1, x, y, width, height);
  contrastedBadgeContainer = v7->_contrastedBadgeContainer;
  v7->_contrastedBadgeContainer = (UIView *)v10;

  [(CACEditingModeOverlayWordsView *)v7 addSubview:v7->_contrastedBadgeContainer];
  [(CACEditingModeOverlayWordsView *)v7 addSubview:v7->_badgeContainer];
  return v7;
}

- (void)setLabels:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v5 = 408;
  v6 = [(UIView *)self->_badgeContainer subviews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v50 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v8);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v11 = [(UIView *)self->_contrastedBadgeContainer subviews];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * j) removeFromSuperview];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v13);
  }

  v16 = objc_opt_new();
  [v16 setNumberStyle:1];
  v44 = v16;
  [v16 setMaximumFractionDigits:0];
  if ([v4 count])
  {
    unint64_t v17 = 0;
    unint64_t v18 = 0x264D10000uLL;
    unint64_t v19 = 0x268973000uLL;
    do
    {
      v20 = [v4 objectAtIndexedSubscript:v17];
      v21 = [v20 label];

      v45 = v21;
      objc_msgSend(*(id *)(v18 + 3096), "sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:contrasted:", objc_msgSend(v21, "length"), 0, 0, 0, UIAccessibilityDarkerSystemColorsEnabled());
      double v23 = v22;
      double v25 = v24;
      v26 = [v4 objectAtIndexedSubscript:v17];
      unint64_t v27 = *(unint64_t *)((char *)&self->super.super.super.isa + *(int *)(v19 + 1908));
      [v26 frame];
      double v29 = v28;
      [v26 frame];
      double v31 = v30;
      if (v27 <= 3 && ((0xEu >> (v27 & 0xF)) & 1) != 0)
      {
        [v26 frame];
        double v29 = fmax(v33 - v23, 0.0);
      }
      v34 = v45;
      if (v27 == 1)
      {
        [v26 frame];
        double v31 = CGRectGetMidY(v57) + v25 * -0.5;
      }
      v35 = objc_msgSend(objc_alloc(*(Class *)(v18 + 3096)), "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v45, 0, 0, 0, v29, v31, v23, v25);
      [*(id *)((char *)&self->super.super.super.isa + v5) addSubview:v35];
      if (UIAccessibilityDarkerSystemColorsEnabled())
      {
        contrastedBadgeContainer = self->_contrastedBadgeContainer;
        [v35 contrastedCopy];
        id v37 = v4;
        v38 = self;
        unint64_t v39 = v18;
        uint64_t v40 = v5;
        v42 = unint64_t v41 = v19;
        v43 = contrastedBadgeContainer;
        v34 = v45;
        [(UIView *)v43 addSubview:v42];

        unint64_t v19 = v41;
        uint64_t v5 = v40;
        unint64_t v18 = v39;
        self = v38;
        id v4 = v37;
      }

      ++v17;
    }
    while (v17 < [v4 count]);
  }
}

- (NSArray)labels
{
  return self->_labels;
}

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (void)setOverlayType:(int64_t)a3
{
  self->_overlayType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_contrastedBadgeContainer, 0);
  objc_storeStrong((id *)&self->_badgeContainer, 0);
}

@end