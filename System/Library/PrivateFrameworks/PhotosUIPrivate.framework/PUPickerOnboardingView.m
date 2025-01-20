@interface PUPickerOnboardingView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGSize)attachmentAnchorSize;
- (CGSize)attachmentIconSize;
- (NSArray)badgeConstraints;
- (NSArray)buttonConstraints;
- (NSArray)contentCenterConstraints;
- (NSArray)contentInsetConstraints;
- (NSArray)contentMarginConstraints;
- (NSArray)largeIconViewConstraints;
- (NSArray)platterInsetConstraints;
- (NSArray)textViewConstraints;
- (NSAttributedString)attributedText;
- (NSLayoutConstraint)buttonBottomConstraint;
- (NSLayoutConstraint)buttonTopConstraint;
- (NSLayoutConstraint)textViewTopAnchorToLargeIconConstraint;
- (NSLayoutConstraint)textViewTopAnchorToPlatterConstraint;
- (NSLayoutConstraint)textViewWidthConstraint;
- (NSString)clientDisplayName;
- (PUPickerBadgeIconView)badgeIconView;
- (PUPickerOnboardingView)initWithClientDisplayName:(id)a3;
- (PUPickerOnboardingViewDelegate)delegate;
- (PUPickerPrivacyBadge)badge;
- (UIButton)button;
- (UIButtonConfiguration)filledButtonConfiguration;
- (UIButtonConfiguration)plainButtonConfiguration;
- (UIFont)bodyFont;
- (UIFont)titleFont;
- (UIImageView)attachmentAnchorView;
- (UIImageView)attachmentIconView;
- (UIImageView)largeIconView;
- (UILabel)badgeLabel;
- (UILayoutGuide)contentLayoutGuide;
- (UITextView)textView;
- (UIView)badgeContainerView;
- (UIView)overlayView;
- (UIVisualEffectView)platter;
- (double)buttonBottomSpacing;
- (unint64_t)compressionLevel;
- (void)_updateBadgeConstraints;
- (void)_updateTextView;
- (void)layoutSubviews;
- (void)setBadgeContainerView:(id)a3;
- (void)setCompressionLevel:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumContentSizeCategory:(id)a3;
- (void)transitionToBadge:(id)a3;
- (void)updateTraitsIfNeeded;
@end

@implementation PUPickerOnboardingView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMarginConstraints, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_badgeIconView, 0);
  objc_storeStrong((id *)&self->_badgeConstraints, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_attachmentAnchorView, 0);
  objc_storeStrong((id *)&self->_attachmentIconView, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_buttonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTopConstraint, 0);
  objc_storeStrong((id *)&self->_plainButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_filledButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_textViewConstraints, 0);
  objc_storeStrong((id *)&self->_textViewTopAnchorToPlatterConstraint, 0);
  objc_storeStrong((id *)&self->_textViewTopAnchorToLargeIconConstraint, 0);
  objc_storeStrong((id *)&self->_textViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_largeIconViewConstraints, 0);
  objc_storeStrong((id *)&self->_largeIconView, 0);
  objc_storeStrong((id *)&self->_contentInsetConstraints, 0);
  objc_storeStrong((id *)&self->_contentCenterConstraints, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_platterInsetConstraints, 0);
  objc_storeStrong((id *)&self->_platter, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_clientDisplayName, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_destroyWeak((id *)&self->_badgeContainerView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_storeStrong((id *)&self->_lastContentSizeCategory, 0);
}

- (unint64_t)compressionLevel
{
  return self->_compressionLevel;
}

- (NSArray)contentMarginConstraints
{
  return self->_contentMarginConstraints;
}

- (UILabel)badgeLabel
{
  return self->_badgeLabel;
}

- (PUPickerBadgeIconView)badgeIconView
{
  return self->_badgeIconView;
}

- (NSArray)badgeConstraints
{
  return self->_badgeConstraints;
}

- (PUPickerPrivacyBadge)badge
{
  return self->_badge;
}

- (UIImageView)attachmentAnchorView
{
  return self->_attachmentAnchorView;
}

- (UIImageView)attachmentIconView
{
  return self->_attachmentIconView;
}

- (double)buttonBottomSpacing
{
  return self->_buttonBottomSpacing;
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (NSLayoutConstraint)buttonBottomConstraint
{
  return self->_buttonBottomConstraint;
}

- (NSLayoutConstraint)buttonTopConstraint
{
  return self->_buttonTopConstraint;
}

- (UIButtonConfiguration)plainButtonConfiguration
{
  return self->_plainButtonConfiguration;
}

- (UIButtonConfiguration)filledButtonConfiguration
{
  return self->_filledButtonConfiguration;
}

- (UIButton)button
{
  return self->_button;
}

- (NSArray)textViewConstraints
{
  return self->_textViewConstraints;
}

- (NSLayoutConstraint)textViewTopAnchorToPlatterConstraint
{
  return self->_textViewTopAnchorToPlatterConstraint;
}

- (NSLayoutConstraint)textViewTopAnchorToLargeIconConstraint
{
  return self->_textViewTopAnchorToLargeIconConstraint;
}

- (NSLayoutConstraint)textViewWidthConstraint
{
  return self->_textViewWidthConstraint;
}

- (UITextView)textView
{
  return self->_textView;
}

- (NSArray)largeIconViewConstraints
{
  return self->_largeIconViewConstraints;
}

- (UIImageView)largeIconView
{
  return self->_largeIconView;
}

- (NSArray)contentInsetConstraints
{
  return self->_contentInsetConstraints;
}

- (NSArray)contentCenterConstraints
{
  return self->_contentCenterConstraints;
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (NSArray)platterInsetConstraints
{
  return self->_platterInsetConstraints;
}

- (UIVisualEffectView)platter
{
  return self->_platter;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (NSString)clientDisplayName
{
  return self->_clientDisplayName;
}

- (UIFont)bodyFont
{
  return self->_bodyFont;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIView)badgeContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgeContainerView);

  return (UIView *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PUPickerOnboardingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PUPickerOnboardingViewDelegate *)WeakRetained;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  v7 = [(PUPickerOnboardingView *)self delegate];
  [v7 assetPickerOnboardingViewWantsToLearnMoreAboutDataAccess:self];

  return 0;
}

- (void)layoutSubviews
{
  v79[6] = *MEMORY[0x1E4F143B8];
  v76.receiver = self;
  v76.super_class = (Class)PUPickerOnboardingView;
  [(PUPickerOnboardingView *)&v76 layoutSubviews];
  v3 = [(PUPickerOnboardingView *)self overlayView];
  int v4 = [v3 isUserInteractionEnabled];

  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__PUPickerOnboardingView_layoutSubviews__block_invoke;
    aBlock[3] = &unk_1E5F2E690;
    aBlock[4] = self;
    v5 = (uint64_t (**)(void))_Block_copy(aBlock);
    uint64_t v6 = *MEMORY[0x1E4FB2798];
    v79[0] = *MEMORY[0x1E4FB2790];
    v79[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4FB27B8];
    v79[2] = *MEMORY[0x1E4FB27B0];
    v79[3] = v7;
    uint64_t v8 = *MEMORY[0x1E4FB27D0];
    v79[4] = *MEMORY[0x1E4FB27C0];
    v79[5] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:6];
    lastContentSizeCategory = self->_lastContentSizeCategory;
    v11 = [(PUPickerOnboardingView *)self traitCollection];
    v12 = [v11 preferredContentSizeCategory];
    NSComparisonResult v13 = UIContentSizeCategoryCompareToCategory(lastContentSizeCategory, v12);

    [(PUPickerOnboardingView *)self bounds];
    double Height = CGRectGetHeight(v80);
    v15 = *(objc_class **)&Height;
    v16 = &OBJC_IVAR___PUTrimToolController__debugTimeCodeLabel;
    if (v13 == NSOrderedSame)
    {
      v17 = [NSNumber numberWithDouble:Height];
      v18 = [NSNumber numberWithDouble:self->_lastHeight];
      NSComparisonResult v13 = [v17 compare:v18];

      v16 = &OBJC_IVAR___PUTrimToolController__debugTimeCodeLabel;
    }
    if (v13 == NSOrderedDescending)
    {
      if ([(PUPickerOnboardingView *)self compressionLevel] == 7)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:6];
        v61.receiver = self;
        v61.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v61 layoutSubviews];
        if ((v5[2](v5) & 1) == 0) {
          [(PUPickerOnboardingView *)self setCompressionLevel:7];
        }
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 6)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:5];
        v60.receiver = self;
        v60.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v60 layoutSubviews];
        if ((v5[2](v5) & 1) == 0) {
          [(PUPickerOnboardingView *)self setCompressionLevel:6];
        }
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 5)
      {
        v47 = v9;
        v21 = [v9 reverseObjectEnumerator];
        id v22 = [v21 nextObject];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id obj = v21;
        uint64_t v23 = [obj countByEnumeratingWithState:&v56 objects:v77 count:16];
        v24 = v5;
        if (v23)
        {
          uint64_t v25 = v23;
          uint64_t v26 = *(void *)v57;
          while (2)
          {
            uint64_t v27 = 0;
            v28 = v22;
            do
            {
              if (*(void *)v57 != v26) {
                objc_enumerationMutation(obj);
              }
              v29 = *(void **)(*((void *)&v56 + 1) + 8 * v27);
              v30 = [(PUPickerOnboardingView *)self maximumContentSizeCategory];
              int v31 = [v30 isEqualToString:v28];

              if (v31)
              {
                [(PUPickerOnboardingView *)self setMaximumContentSizeCategory:v29];
                v55.receiver = self;
                v55.super_class = (Class)PUPickerOnboardingView;
                [(PUPickerOnboardingView *)&v55 layoutSubviews];
                if ((v24[2](v24) & 1) == 0)
                {
                  [(PUPickerOnboardingView *)self setMaximumContentSizeCategory:v28];
                  id v22 = v28;
                  goto LABEL_42;
                }
              }
              id v22 = v29;

              ++v27;
              v28 = v22;
            }
            while (v25 != v27);
            uint64_t v25 = [obj countByEnumeratingWithState:&v56 objects:v77 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }
LABEL_42:

        v9 = v47;
        id v32 = [v47 firstObject];

        v5 = v24;
        if (v22 == v32)
        {
          [(PUPickerOnboardingView *)self setMaximumContentSizeCategory:0];
          v54.receiver = self;
          v54.super_class = (Class)PUPickerOnboardingView;
          [(PUPickerOnboardingView *)&v54 layoutSubviews];
          if ((v24[2](v24) & 1) == 0) {
            [(PUPickerOnboardingView *)self setMaximumContentSizeCategory:v22];
          }
        }

        v16 = &OBJC_IVAR___PUTrimToolController__debugTimeCodeLabel;
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 5)
      {
        v33 = [(PUPickerOnboardingView *)self maximumContentSizeCategory];

        if (!v33)
        {
          [(PUPickerOnboardingView *)self setCompressionLevel:4];
          v53.receiver = self;
          v53.super_class = (Class)PUPickerOnboardingView;
          [(PUPickerOnboardingView *)&v53 layoutSubviews];
          if ((v5[2](v5) & 1) == 0) {
            [(PUPickerOnboardingView *)self setCompressionLevel:5];
          }
        }
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 4)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:3];
        v52.receiver = self;
        v52.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v52 layoutSubviews];
        if ((v5[2](v5) & 1) == 0) {
          [(PUPickerOnboardingView *)self setCompressionLevel:4];
        }
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 3)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:2];
        v51.receiver = self;
        v51.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v51 layoutSubviews];
        if ((v5[2](v5) & 1) == 0) {
          [(PUPickerOnboardingView *)self setCompressionLevel:3];
        }
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 2)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:1];
        v50.receiver = self;
        v50.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v50 layoutSubviews];
        if ((v5[2](v5) & 1) == 0) {
          [(PUPickerOnboardingView *)self setCompressionLevel:2];
        }
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 1)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:0];
        v49.receiver = self;
        v49.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v49 layoutSubviews];
        if ((v5[2](v5) & 1) == 0) {
          [(PUPickerOnboardingView *)self setCompressionLevel:1];
        }
      }
    }
    else if (v13 == NSOrderedAscending)
    {
      if (![(PUPickerOnboardingView *)self compressionLevel] && (v5[2](v5) & 1) == 0)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:1];
        v74.receiver = self;
        v74.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v74 layoutSubviews];
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 1 && (v5[2](v5) & 1) == 0)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:2];
        v73.receiver = self;
        v73.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v73 layoutSubviews];
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 2 && (v5[2](v5) & 1) == 0)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:3];
        v72.receiver = self;
        v72.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v72 layoutSubviews];
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 3 && (v5[2](v5) & 1) == 0)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:4];
        v71.receiver = self;
        v71.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v71 layoutSubviews];
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 4 && (v5[2](v5) & 1) == 0)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:5];
        v70.receiver = self;
        v70.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v70 layoutSubviews];
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 5)
      {
        v19 = [v9 objectEnumerator];
        v20 = [(PUPickerOnboardingView *)self maximumContentSizeCategory];
        uint64_t v46 = 416;
        if (v20)
        {
        }
        else if ((v5[2](v5) & 1) == 0)
        {
          v34 = [v19 nextObject];
          [(PUPickerOnboardingView *)self setMaximumContentSizeCategory:v34];

          v69.receiver = self;
          v69.super_class = (Class)PUPickerOnboardingView;
          [(PUPickerOnboardingView *)&v69 layoutSubviews];
        }
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v35 = v19;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v65 objects:v78 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v66;
LABEL_66:
          uint64_t v39 = 0;
          while (1)
          {
            if (*(void *)v66 != v38) {
              objc_enumerationMutation(v35);
            }
            v40 = *(NSString **)(*((void *)&v65 + 1) + 8 * v39);
            if (v5[2](v5)) {
              break;
            }
            v41 = [(PUPickerOnboardingView *)self maximumContentSizeCategory];
            NSComparisonResult v42 = UIContentSizeCategoryCompareToCategory(v41, v40);

            if (v42 != NSOrderedAscending)
            {
              [(PUPickerOnboardingView *)self setMaximumContentSizeCategory:v40];
              v64.receiver = self;
              v64.super_class = (Class)PUPickerOnboardingView;
              [(PUPickerOnboardingView *)&v64 layoutSubviews];
            }
            if (v37 == ++v39)
            {
              uint64_t v37 = [v35 countByEnumeratingWithState:&v65 objects:v78 count:16];
              if (v37) {
                goto LABEL_66;
              }
              break;
            }
          }
        }

        v16 = &OBJC_IVAR___PUTrimToolController__debugTimeCodeLabel;
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 5 && (v5[2](v5) & 1) == 0)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:6];
        v63.receiver = self;
        v63.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v63 layoutSubviews];
      }
      if ([(PUPickerOnboardingView *)self compressionLevel] == 6 && (v5[2](v5) & 1) == 0)
      {
        [(PUPickerOnboardingView *)self setCompressionLevel:7];
        v62.receiver = self;
        v62.super_class = (Class)PUPickerOnboardingView;
        [(PUPickerOnboardingView *)&v62 layoutSubviews];
      }
    }
    v43 = [(PUPickerOnboardingView *)self traitCollection];
    v44 = [v43 preferredContentSizeCategory];
    v45 = self->_lastContentSizeCategory;
    self->_lastContentSizeCategory = v44;

    *(Class *)((char *)&self->super.super.super.isa + v16[355]) = v15;
  }
}

BOOL __40__PUPickerOnboardingView_layoutSubviews__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) button];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  v11 = [*(id *)(a1 + 32) button];
  objc_msgSend(v11, "alignmentRectForFrame:", v4, v6, v8, v10);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v20 = [*(id *)(a1 + 32) contentLayoutGuide];
  [v20 layoutFrame];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  v31.origin.x = v13;
  v31.origin.y = v15;
  v31.size.width = v17;
  v31.size.height = v19;
  CGRect v33 = CGRectInset(v31, 1.0, 1.0);
  v32.origin.x = v22;
  v32.origin.y = v24;
  v32.size.width = v26;
  v32.size.height = v28;
  BOOL v29 = CGRectContainsRect(v32, v33);

  return v29;
}

- (void)updateTraitsIfNeeded
{
  if ([MEMORY[0x1E4FB1EB0] instancesRespondToSelector:sel_updateTraitsIfNeeded])
  {
    v3.receiver = self;
    v3.super_class = (Class)PUPickerOnboardingView;
    [(PUPickerOnboardingView *)&v3 updateTraitsIfNeeded];
  }
}

- (void)setMaximumContentSizeCategory:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPickerOnboardingView;
  [(PUPickerOnboardingView *)&v4 setMaximumContentSizeCategory:a3];
  [(PUPickerOnboardingView *)self updateTraitsIfNeeded];
  [(PUPickerOnboardingView *)self _updateTextView];
  [(PUPickerOnboardingView *)self setNeedsLayout];
}

- (void)setBadgeContainerView:(id)a3
{
  id v4 = a3;
  double v5 = [v4 window];
  double v6 = [(PUPickerOnboardingView *)self window];
  if (v5 == v6) {
    double v7 = v4;
  }
  else {
    double v7 = 0;
  }
  id obj = v7;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgeContainerView);
  double v9 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_badgeContainerView, obj);
    [(PUPickerOnboardingView *)self _updateBadgeConstraints];
    double v9 = obj;
  }
}

- (void)setCompressionLevel:(unint64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self->_compressionLevel != a3)
  {
    self->_unint64_t compressionLevel = a3;
    [(PUPickerOnboardingView *)self updateTraitsIfNeeded];
    [(PUPickerOnboardingView *)self _updateTextView];
    [(PUPickerOnboardingView *)self setNeedsLayout];
    unint64_t compressionLevel = self->_compressionLevel;
    [(UIImageView *)self->_largeIconView setHidden:compressionLevel != 0];
    if (compressionLevel)
    {
      [(NSLayoutConstraint *)self->_textViewTopAnchorToLargeIconConstraint setActive:0];
      [(NSLayoutConstraint *)self->_textViewTopAnchorToPlatterConstraint setActive:1];
      double buttonBottomSpacing = self->_buttonBottomSpacing * 0.5;
    }
    else
    {
      [(NSLayoutConstraint *)self->_textViewTopAnchorToPlatterConstraint setActive:0];
      [(NSLayoutConstraint *)self->_textViewTopAnchorToLargeIconConstraint setActive:1];
      double buttonBottomSpacing = self->_buttonBottomSpacing;
    }
    [(NSLayoutConstraint *)self->_buttonBottomConstraint setConstant:buttonBottomSpacing];
    unint64_t v6 = self->_compressionLevel;
    if (v6 == 2) {
      double v7 = 16.0;
    }
    else {
      double v7 = 8.0;
    }
    if (v6 >= 2) {
      double v8 = v7;
    }
    else {
      double v8 = 24.0;
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    double v9 = self->_platterInsetConstraints;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * v13++) setConstant:v8];
        }
        while (v11 != v13);
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v11);
    }

    if (self->_compressionLevel <= 2) {
      double v14 = 16.0;
    }
    else {
      double v14 = 8.0;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    CGFloat v15 = self->_contentInsetConstraints;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v19++), "setConstant:", v14, (void)v24);
        }
        while (v17 != v19);
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v17);
    }

    unint64_t v20 = self->_compressionLevel;
    BOOL v21 = v20 > 3;
    if (v20 <= 3) {
      double v22 = 16.0;
    }
    else {
      double v22 = 4.0;
    }
    double v23 = &OBJC_IVAR___PUPickerOnboardingView__filledButtonConfiguration;
    if (v21) {
      double v23 = &OBJC_IVAR___PUPickerOnboardingView__plainButtonConfiguration;
    }
    -[UIButton setConfiguration:](self->_button, "setConfiguration:", *(Class *)((char *)&self->super.super.super.isa + *v23), (void)v24);
    [(NSLayoutConstraint *)self->_buttonTopConstraint setConstant:v22];
  }
}

- (NSAttributedString)attributedText
{
  v67[3] = *MEMORY[0x1E4F143B8];
  attributedText = self->_attributedText;
  if (attributedText)
  {
    objc_super v3 = attributedText;
    goto LABEL_11;
  }
  long long v59 = PULocalizedString(@"PICKER_PRIVACY_TITLE");
  double v5 = [(PUPickerOnboardingView *)self clientDisplayName];
  if (![v5 length])
  {

    goto LABEL_7;
  }
  unint64_t v6 = [(PUPickerOnboardingView *)self clientDisplayName];

  if (!v6)
  {
LABEL_7:
    objc_super v53 = PULocalizedString(@"PICKER_PRIVACY_MESSAGE_GENERIC");
    goto LABEL_8;
  }
  double v7 = NSString;
  double v8 = PULocalizedString(@"PICKER_PRIVACY_MESSAGE_%@_APP_NAME");
  objc_super v53 = objc_msgSend(v7, "stringWithFormat:", v8, v6);

LABEL_8:
  uint64_t v51 = PULocalizedString(@"PICKER_PRIVACY_LEARN_MORE_MESSAGE");
  double v9 = [MEMORY[0x1E4FB0848] defaultParagraphStyle];
  uint64_t v10 = (void *)[v9 mutableCopy];

  [v10 setAlignment:1];
  [v10 setLineSpacing:-2.0];
  long long v58 = (void *)[v10 copy];
  [v10 setParagraphSpacing:2.0];
  objc_super v55 = v10;
  uint64_t v11 = [v10 copy];
  uint64_t v12 = [PUImageTextAttachment alloc];
  uint64_t v13 = [(PUPickerOnboardingView *)self attachmentAnchorView];
  [(PUPickerOnboardingView *)self attachmentAnchorSize];
  uint64_t v14 = -[PUImageTextAttachment initWithImageView:size:](v12, "initWithImageView:size:", v13);

  objc_super v54 = (void *)v14;
  CGFloat v15 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v14];
  uint64_t v16 = (void *)[v15 mutableCopy];

  uint64_t v17 = *MEMORY[0x1E4FB0738];
  long long v57 = v16;
  objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v11, 0, objc_msgSend(v16, "length"));
  uint64_t v64 = *MEMORY[0x1E4FB06F8];
  uint64_t v18 = v64;
  uint64_t v19 = [(PUPickerOnboardingView *)self titleFont];
  v67[0] = v19;
  uint64_t v65 = *MEMORY[0x1E4FB0700];
  uint64_t v20 = v65;
  BOOL v21 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v66 = v17;
  v67[1] = v21;
  v67[2] = v11;
  long long v56 = (void *)v11;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:&v64 count:3];

  id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
  long long v24 = [v59 stringByAppendingString:@"\n"];
  objc_super v52 = (void *)v22;
  long long v25 = (void *)[v23 initWithString:v24 attributes:v22];

  v62[0] = v18;
  long long v26 = [(PUPickerOnboardingView *)self bodyFont];
  v63[0] = v26;
  v62[1] = v20;
  long long v27 = [MEMORY[0x1E4FB1618] labelColor];
  v62[2] = v17;
  v63[1] = v27;
  v63[2] = v58;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];

  id v29 = objc_alloc(MEMORY[0x1E4F28B18]);
  long long v30 = v53;
  long long v31 = [v53 stringByAppendingString:@" "];
  objc_super v50 = (void *)v28;
  uint64_t v32 = [v29 initWithString:v31 attributes:v28];

  CGRect v33 = (void *)v32;
  v60[0] = v18;
  uint64_t v34 = [(PUPickerOnboardingView *)self bodyFont];
  uint64_t v35 = *MEMORY[0x1E4FB0720];
  v61[0] = v34;
  v61[1] = @"foo://bar";
  v60[1] = v35;
  v60[2] = v17;
  uint64_t v49 = v17;
  v61[2] = v58;
  uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];

  uint64_t v37 = (void *)v51;
  uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28B18]), "initWithString:attributes:");
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v57];
  [v39 appendAttributedString:v25];
  [v39 appendAttributedString:v33];
  [v39 appendAttributedString:v38];
  if ([(PUPickerOnboardingView *)self compressionLevel])
  {
    v48 = v25;
    v40 = [PUImageTextAttachment alloc];
    v41 = [(PUPickerOnboardingView *)self attachmentIconView];
    [(PUPickerOnboardingView *)self attachmentIconSize];
    NSComparisonResult v42 = -[PUImageTextAttachment initWithImageView:size:](v40, "initWithImageView:size:", v41);

    v43 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v42];
    v44 = (void *)[v43 mutableCopy];

    long long v30 = v53;
    uint64_t v37 = (void *)v51;
    objc_msgSend(v44, "addAttribute:value:range:", v49, v56, 0, objc_msgSend(v44, "length"));
    [v39 insertAttributedString:v44 atIndex:0];

    long long v25 = v48;
  }
  v45 = (NSAttributedString *)[v39 copy];
  uint64_t v46 = self->_attributedText;
  self->_attributedText = v45;

  objc_super v3 = self->_attributedText;
LABEL_11:

  return v3;
}

- (CGSize)attachmentAnchorSize
{
  [(UIFont *)self->_titleFont lineHeight];
  double v3 = v2;
  double v4 = 3.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (CGSize)attachmentIconSize
{
  double v3 = [(PUPickerOnboardingView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 14.0;
  if (v4 != 5)
  {
    unint64_t v6 = [(PUPickerOnboardingView *)self traitCollection];
    double v7 = [v6 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    if (IsAccessibilityCategory)
    {
      double v5 = 32.0;
    }
    else
    {
      unint64_t v9 = [(PUPickerOnboardingView *)self compressionLevel];
      switch(v9)
      {
        case 5uLL:
          double v5 = 18.0;
          break;
        case 7uLL:
          double v5 = 14.0;
          break;
        case 6uLL:
          double v5 = 16.0;
          break;
        default:
          double v5 = 20.0;
          break;
      }
    }
  }
  double v10 = v5;
  result.height = v10;
  result.width = v5;
  return result;
}

- (void)transitionToBadge:(id)a3
{
  id v97 = a3;
  uint64_t v4 = [(PUPickerOnboardingView *)self platter];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:1];
  double v5 = (void *)MEMORY[0x1E4F28DC8];
  unint64_t v6 = [(PUPickerOnboardingView *)self platterInsetConstraints];
  [v5 deactivateConstraints:v6];

  double v7 = (void *)MEMORY[0x1E4F28DC8];
  double v8 = [(PUPickerOnboardingView *)self contentCenterConstraints];
  [v7 deactivateConstraints:v8];

  unint64_t v9 = (void *)MEMORY[0x1E4F28DC8];
  double v10 = [(PUPickerOnboardingView *)self contentInsetConstraints];
  [v9 deactivateConstraints:v10];

  v96 = [(PUPickerOnboardingView *)self largeIconView];
  [v96 setTranslatesAutoresizingMaskIntoConstraints:1];
  uint64_t v11 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v12 = [(PUPickerOnboardingView *)self largeIconViewConstraints];
  [v11 deactivateConstraints:v12];

  uint64_t v13 = [(PUPickerOnboardingView *)self textView];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:1];
  [v13 setAutoresizingMask:40];
  uint64_t v14 = (void *)MEMORY[0x1E4F28DC8];
  CGFloat v15 = [(PUPickerOnboardingView *)self textViewConstraints];
  [v14 deactivateConstraints:v15];

  uint64_t v16 = [(PUPickerOnboardingView *)self button];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:1];
  uint64_t v17 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v18 = [(PUPickerOnboardingView *)self buttonConstraints];
  [v17 deactivateConstraints:v18];

  uint64_t v19 = [(PUPickerOnboardingView *)self badge];
  v98 = [(PUPickerOnboardingView *)self delegate];
  objc_initWeak(location, self);
  id v20 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v137[0] = MEMORY[0x1E4F143A8];
  v137[1] = 3221225472;
  v137[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke;
  v137[3] = &unk_1E5F2ED10;
  id v21 = v16;
  id v138 = v21;
  v104 = objc_msgSend(v20, "initWithDuration:controlPoint1:controlPoint2:animations:", v137, 0.3);
  id v22 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v135[0] = MEMORY[0x1E4F143A8];
  v135[1] = 3221225472;
  v135[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_2;
  v135[3] = &unk_1E5F2ED10;
  id v95 = v21;
  id v136 = v95;
  v103 = (void *)[v22 initWithDuration:v135 controlPoint1:0.3 controlPoint2:0.33 animations:0.0];
  [v104 startAnimation];
  [v103 startAnimation];
  if ([(PUPickerOnboardingView *)self compressionLevel]) {
    [(PUPickerOnboardingView *)self attachmentIconView];
  }
  else {
  id v23 = [(PUPickerOnboardingView *)self largeIconView];
  }
  [v23 bounds];
  objc_msgSend(v23, "convertRect:toView:", v4);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  uint64_t v32 = [(PUPickerOnboardingView *)self badgeIconView];
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);
  [v32 setAlpha:0.0];
  [v32 setHidden:0];
  CGRect v33 = [(PUPickerOnboardingView *)self badgeLabel];
  uint64_t v34 = [(PUPickerOnboardingView *)self titleFont];
  [v34 pointSize];
  double v36 = v35;
  uint64_t v37 = [v33 font];
  [v37 pointSize];
  double v39 = v38;

  v40 = [(PUPickerOnboardingView *)self traitCollection];
  if ([v40 layoutDirection]) {
    double v41 = -1.0;
  }
  else {
    double v41 = 1.0;
  }

  NSComparisonResult v42 = [(PUPickerOnboardingView *)self attachmentAnchorView];
  double v99 = v41;
  double v101 = v39;
  double v43 = v36;
  [v42 bounds];
  objc_msgSend(v42, "convertRect:toView:", v4);
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  CGFloat v51 = v50;
  objc_msgSend(v33, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v53 = v52;
  double v55 = v54;
  v94 = v42;
  v140.origin.x = v45;
  v140.origin.y = v47;
  v140.size.width = v49;
  v140.size.height = v51;
  double MaxX = CGRectGetMaxX(v140);
  v141.origin.x = v45;
  v141.origin.y = v47;
  v141.size.width = v49;
  v141.size.height = v51;
  objc_msgSend(v33, "setCenter:", MaxX + v43 / v101 * v53 * 0.5 * v99, CGRectGetMidY(v141));
  objc_msgSend(v33, "setBounds:", 0.0, 0.0, v53, v55);
  CGAffineTransformMakeScale(&v134, v43 / v101, v43 / v101);
  CGAffineTransform v133 = v134;
  [v33 setTransform:&v133];
  [v33 setAlpha:0.0];
  [v33 setHidden:0];
  id v57 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_3;
  v130[3] = &unk_1E5F2ECC8;
  id v102 = v23;
  id v131 = v102;
  id v58 = v32;
  id v132 = v58;
  long long v59 = (void *)[v57 initWithDuration:3 curve:v130 animations:0.167];
  [v59 startAnimation];
  v100 = v59;
  id v60 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_4;
  v127[3] = &unk_1E5F2ECC8;
  id v61 = v4;
  id v128 = v61;
  id v62 = v19;
  id v129 = v62;
  objc_super v63 = objc_msgSend(v60, "initWithDuration:controlPoint1:controlPoint2:animations:", v127, 0.5, 0.33, 0.0, 0.2, 1.0);
  [v63 startAnimationAfterDelay:0.167];
  id v64 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_5;
  v124[3] = &unk_1E5F2ECC8;
  id v65 = v61;
  id v125 = v65;
  id v66 = v62;
  id v126 = v66;
  long long v67 = objc_msgSend(v64, "initWithDuration:controlPoint1:controlPoint2:animations:", v124, 0.5, 0.33, 0.0, 0.2, 1.0);
  [v67 startAnimationAfterDelay:0.217];
  v93 = v67;
  id v68 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v121[0] = MEMORY[0x1E4F143A8];
  v121[1] = 3221225472;
  v121[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_6;
  v121[3] = &unk_1E5F2ECC8;
  id v69 = v33;
  id v122 = v69;
  id v70 = v13;
  id v123 = v70;
  objc_super v71 = objc_msgSend(v68, "initWithDuration:controlPoint1:controlPoint2:animations:", v121, 0.167, 0.33, 0.0, 0.67, 1.0);
  [v71 startAnimationAfterDelay:0.167];
  v92 = v71;
  id v72 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_7;
  v117[3] = &unk_1E5F2E908;
  id v73 = v58;
  id v118 = v73;
  id v74 = v66;
  id v119 = v74;
  id v75 = v69;
  id v120 = v75;
  objc_super v76 = objc_msgSend(v72, "initWithDuration:controlPoint1:controlPoint2:animations:", v117, 0.5, 0.33, 0.0, 0.2, 1.0);
  [v76 startAnimationAfterDelay:0.167];
  v90 = v75;
  v91 = v74;
  v77 = [(PUPickerOnboardingView *)self overlayView];
  v89 = v63;
  id v78 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_8;
  v115[3] = &unk_1E5F2ED10;
  id v79 = v77;
  id v116 = v79;
  CGRect v80 = objc_msgSend(v78, "initWithDuration:controlPoint1:controlPoint2:animations:", v115, 0.333, 0.33, 0.0, 0.67, 1.0);
  [v80 startAnimationAfterDelay:0.334];
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_9;
  v112[3] = &unk_1E5F2E668;
  id v81 = v98;
  id v113 = v81;
  objc_copyWeak(&v114, location);
  [v80 addCompletion:v112];
  [v73 flipToPrivacyIconAfterDelay:1.167];
  id v82 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_10;
  v110[3] = &unk_1E5F2ED10;
  id v83 = v65;
  id v111 = v83;
  v84 = objc_msgSend(v82, "initWithDuration:controlPoint1:controlPoint2:animations:", v110, 0.167, 0.33, 0.0, 0.8, 0.7);
  [v84 startAnimationAfterDelay:3.217];
  id v85 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_11;
  v108[3] = &unk_1E5F2ED10;
  id v86 = v83;
  id v109 = v86;
  v87 = objc_msgSend(v85, "initWithDuration:controlPoint1:controlPoint2:animations:", v108, 0.167, 0.33, 0.0, 0.67, 1.0);
  [v87 startAnimationAfterDelay:3.217];
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_12;
  v105[3] = &unk_1E5F2E668;
  id v88 = v81;
  id v106 = v88;
  objc_copyWeak(&v107, location);
  [v87 addCompletion:v105];
  objc_destroyWeak(&v107);

  objc_destroyWeak(&v114);
  objc_destroyWeak(location);
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.5, 0.5);
  double v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:1.0];
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  [*(id *)(a1 + 40) _cornerRadius];
  double v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_setCornerRadius:");
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 40) center];
  double v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "setCenter:");
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_7(id *a1)
{
  [a1[5] imageFrame];
  objc_msgSend(a1[4], "setFrame:");
  id v2 = a1[6];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  [a1[5] labelFrame];
  return objc_msgSend(a1[6], "setFrame:");
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __44__PUPickerOnboardingView_transitionToBadge___block_invoke_9(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 assetPickerOnboardingViewDidTransitionToBadge:WeakRetained];
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_10(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.75, 0.75);
  id v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __44__PUPickerOnboardingView_transitionToBadge___block_invoke_12(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 assetPickerOnboardingViewDidDismissBadge:WeakRetained];
}

- (void)_updateBadgeConstraints
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (self->_badgeConstraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  uint64_t v3 = [(PUPickerOnboardingView *)self badgeContainerView];
  CGAffineTransform v4 = (void *)v3;
  if (v3) {
    CGAffineTransform v5 = (PUPickerOnboardingView *)v3;
  }
  else {
    CGAffineTransform v5 = self;
  }
  unint64_t v6 = v5;

  uint64_t v18 = [(PUPickerPrivacyBadge *)self->_badge leadingAnchor];
  double v7 = [(PUPickerOnboardingView *)v6 safeAreaLayoutGuide];
  double v8 = [v7 leadingAnchor];
  unint64_t v9 = [v18 constraintEqualToAnchor:v8 constant:8.0];
  v19[0] = v9;
  double v10 = [(PUPickerPrivacyBadge *)self->_badge topAnchor];
  uint64_t v11 = [(PUPickerOnboardingView *)v6 safeAreaLayoutGuide];
  uint64_t v12 = [v11 topAnchor];
  uint64_t v13 = [v10 constraintEqualToAnchor:v12 constant:8.0];
  v19[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  badgeConstraints = self->_badgeConstraints;
  self->_badgeConstraints = v14;

  uint64_t v16 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v17 = self->_badgeConstraints;

  [v16 activateConstraints:v17];
}

- (void)_updateTextView
{
  v22[1] = *MEMORY[0x1E4F143B8];
  attributedText = self->_attributedText;
  self->_attributedText = 0;

  CGAffineTransform v4 = [(PUPickerOnboardingView *)self traitCollection];
  switch(self->_compressionLevel)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      CGAffineTransform v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] compatibleWithTraitCollection:v4];
      unint64_t v6 = (uint64_t *)MEMORY[0x1E4FB28F0];
      goto LABEL_3;
    case 5uLL:
      CGAffineTransform v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0] compatibleWithTraitCollection:v4];
      unint64_t v6 = (uint64_t *)MEMORY[0x1E4FB28D8];
      goto LABEL_3;
    case 6uLL:
      CGAffineTransform v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D8] compatibleWithTraitCollection:v4];
      unint64_t v6 = (uint64_t *)MEMORY[0x1E4FB28E0];
LABEL_3:
      uint64_t v7 = *v6;
      goto LABEL_4;
    case 7uLL:
      uint64_t v7 = *MEMORY[0x1E4FB28E0];
      CGAffineTransform v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28E0] compatibleWithTraitCollection:v4];
LABEL_4:
      double v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v7 compatibleWithTraitCollection:v4];
      break;
    default:
      double v8 = 0;
      CGAffineTransform v5 = 0;
      break;
  }
  uint64_t v21 = *MEMORY[0x1E4FB0950];
  uint64_t v19 = *MEMORY[0x1E4FB09F0];
  unint64_t v9 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09E0]];
  id v20 = v9;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v22[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  uint64_t v12 = [v5 fontDescriptorByAddingAttributes:v11];

  uint64_t v13 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v12 size:0.0];
  titleFont = self->_titleFont;
  self->_titleFont = v13;

  CGFloat v15 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];
  bodyFont = self->_bodyFont;
  self->_bodyFont = v15;

  uint64_t v17 = [(PUPickerOnboardingView *)self attributedText];
  uint64_t v18 = [(PUPickerOnboardingView *)self textView];
  [v18 setAttributedText:v17];
}

- (PUPickerOnboardingView)initWithClientDisplayName:(id)a3
{
  v193[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v186.receiver = self;
  v186.super_class = (Class)PUPickerOnboardingView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  unint64_t v9 = -[PUPickerOnboardingView initWithFrame:](&v186, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  if (v9)
  {
    uint64_t v10 = [v4 copy];
    clientDisplayName = v9->_clientDisplayName;
    v9->_clientDisplayName = (NSString *)v10;

    uint64_t v12 = [(PUPickerOnboardingView *)v9 traitCollection];
    [v12 preferredContentSizeCategory];
    uint64_t v13 = v182 = v4;
    uint64_t v14 = [v13 copy];
    lastContentSizeCategory = v9->_lastContentSizeCategory;
    v9->_lastContentSizeCategory = (NSString *)v14;

    v9->_lastdouble Height = 1.79769313e308;
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
    overlayView = v9->_overlayView;
    v9->_overlayView = (UIView *)v16;

    uint64_t v18 = objc_msgSend(MEMORY[0x1E4FB1618], "px_colorNamed:", @"PrivacyViewDimming");
    [(UIView *)v9->_overlayView setBackgroundColor:v18];

    [(UIView *)v9->_overlayView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUPickerOnboardingView *)v9 addSubview:v9->_overlayView];
    v170 = (void *)MEMORY[0x1E4F28DC8];
    v184 = [(UIView *)v9->_overlayView topAnchor];
    v183 = [(PUPickerOnboardingView *)v9 topAnchor];
    v178 = [v184 constraintEqualToAnchor:v183];
    v193[0] = v178;
    v174 = [(UIView *)v9->_overlayView bottomAnchor];
    uint64_t v19 = [(PUPickerOnboardingView *)v9 bottomAnchor];
    id v20 = [v174 constraintEqualToAnchor:v19];
    v193[1] = v20;
    uint64_t v21 = [(UIView *)v9->_overlayView leadingAnchor];
    id v22 = [(PUPickerOnboardingView *)v9 leadingAnchor];
    id v23 = [v21 constraintEqualToAnchor:v22];
    v193[2] = v23;
    double v24 = [(UIView *)v9->_overlayView trailingAnchor];
    double v25 = [(PUPickerOnboardingView *)v9 trailingAnchor];
    double v26 = [v24 constraintEqualToAnchor:v25];
    v193[3] = v26;
    double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:4];
    [v170 activateConstraints:v27];

    id v28 = objc_alloc(MEMORY[0x1E4FB1F00]);
    double v29 = [MEMORY[0x1E4FB14C8] effectWithStyle:5];
    uint64_t v30 = [v28 initWithEffect:v29];
    platter = v9->_platter;
    v9->_platter = (UIVisualEffectView *)v30;

    id v32 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v33 = [v32 CGColor];
    uint64_t v34 = [(UIVisualEffectView *)v9->_platter layer];
    [v34 setShadowColor:v33];

    double v35 = [(UIVisualEffectView *)v9->_platter layer];
    LODWORD(v36) = 1041865114;
    [v35 setShadowOpacity:v36];

    double v37 = *MEMORY[0x1E4F1DB30];
    double v38 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v39 = [(UIVisualEffectView *)v9->_platter layer];
    objc_msgSend(v39, "setShadowOffset:", v37, v38);

    v40 = [(UIVisualEffectView *)v9->_platter layer];
    [v40 setShadowRadius:1.0];

    [(UIVisualEffectView *)v9->_platter setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIVisualEffectView *)v9->_platter _setCornerRadius:10.0];
    [(PUPickerOnboardingView *)v9 addSubview:v9->_platter];
    v185 = [(UIVisualEffectView *)v9->_platter leadingAnchor];
    v179 = [(PUPickerOnboardingView *)v9 leadingAnchor];
    v175 = [v185 constraintGreaterThanOrEqualToAnchor:v179 constant:24.0];
    v192[0] = v175;
    v171 = [(UIVisualEffectView *)v9->_platter topAnchor];
    double v41 = [(PUPickerOnboardingView *)v9 topAnchor];
    NSComparisonResult v42 = [v171 constraintGreaterThanOrEqualToAnchor:v41 constant:24.0];
    v192[1] = v42;
    double v43 = [(PUPickerOnboardingView *)v9 trailingAnchor];
    double v44 = [(UIVisualEffectView *)v9->_platter trailingAnchor];
    CGFloat v45 = [v43 constraintGreaterThanOrEqualToAnchor:v44 constant:24.0];
    v192[2] = v45;
    double v46 = [(PUPickerOnboardingView *)v9 bottomAnchor];
    CGFloat v47 = [(UIVisualEffectView *)v9->_platter bottomAnchor];
    double v48 = [v46 constraintGreaterThanOrEqualToAnchor:v47 constant:24.0];
    v192[3] = v48;
    uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:4];
    platterInsetConstraints = v9->_platterInsetConstraints;
    v9->_platterInsetConstraints = (NSArray *)v49;

    [MEMORY[0x1E4F28DC8] activateConstraints:v9->_platterInsetConstraints];
    CGFloat v51 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    contentLayoutGuide = v9->_contentLayoutGuide;
    v9->_contentLayoutGuide = v51;

    double v53 = [(UILayoutGuide *)v9->_contentLayoutGuide centerXAnchor];
    double v54 = [(PUPickerOnboardingView *)v9 safeAreaLayoutGuide];
    double v55 = [v54 centerXAnchor];
    long long v56 = [v53 constraintEqualToAnchor:v55];
    v191[0] = v56;
    id v57 = [(UILayoutGuide *)v9->_contentLayoutGuide centerYAnchor];
    id v58 = [(PUPickerOnboardingView *)v9 safeAreaLayoutGuide];
    long long v59 = [v58 centerYAnchor];
    id v60 = [v57 constraintEqualToAnchor:v59];
    v191[1] = v60;
    uint64_t v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v191 count:2];
    contentCenterConstraints = v9->_contentCenterConstraints;
    v9->_contentCenterConstraints = (NSArray *)v61;

    v176 = [(UILayoutGuide *)v9->_contentLayoutGuide leadingAnchor];
    v172 = [(UIVisualEffectView *)v9->_platter leadingAnchor];
    v169 = [v176 constraintEqualToAnchor:v172 constant:16.0];
    v190[0] = v169;
    v168 = [(UILayoutGuide *)v9->_contentLayoutGuide topAnchor];
    objc_super v63 = [(UIVisualEffectView *)v9->_platter topAnchor];
    id v64 = [v168 constraintEqualToAnchor:v63 constant:16.0];
    v190[1] = v64;
    id v65 = [(UIVisualEffectView *)v9->_platter trailingAnchor];
    id v66 = [(UILayoutGuide *)v9->_contentLayoutGuide trailingAnchor];
    long long v67 = [v65 constraintEqualToAnchor:v66 constant:16.0];
    v190[2] = v67;
    id v68 = [(UIVisualEffectView *)v9->_platter bottomAnchor];
    id v69 = [(UILayoutGuide *)v9->_contentLayoutGuide bottomAnchor];
    id v70 = [v68 constraintEqualToAnchor:v69 constant:16.0];
    v190[3] = v70;
    uint64_t v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:4];
    contentInsetConstraints = v9->_contentInsetConstraints;
    v9->_contentInsetConstraints = (NSArray *)v71;

    [(PUPickerOnboardingView *)v9 addLayoutGuide:v9->_contentLayoutGuide];
    [MEMORY[0x1E4F28DC8] activateConstraints:v9->_contentCenterConstraints];
    [MEMORY[0x1E4F28DC8] activateConstraints:v9->_contentInsetConstraints];
    id v73 = objc_alloc(MEMORY[0x1E4FB1838]);
    id v74 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"photos-32");
    uint64_t v75 = [v73 initWithImage:v74];
    largeIconView = v9->_largeIconView;
    v9->_largeIconView = (UIImageView *)v75;

    [(UIImageView *)v9->_largeIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v77 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v78 = [v77 CGColor];
    id v79 = [(UIImageView *)v9->_largeIconView layer];
    [v79 setShadowColor:v78];

    CGRect v80 = [(UIImageView *)v9->_largeIconView layer];
    LODWORD(v81) = 1041865114;
    [v80 setShadowOpacity:v81];

    id v82 = [(UIImageView *)v9->_largeIconView layer];
    objc_msgSend(v82, "setShadowOffset:", v37, v38);

    id v83 = [(UIImageView *)v9->_largeIconView layer];
    [v83 setShadowRadius:1.0];

    v180 = [(UIImageView *)v9->_largeIconView widthAnchor];
    v177 = [v180 constraintEqualToConstant:32.0];
    v189[0] = v177;
    v173 = [(UIImageView *)v9->_largeIconView heightAnchor];
    v84 = [v173 constraintEqualToConstant:32.0];
    v189[1] = v84;
    id v85 = [(UIImageView *)v9->_largeIconView topAnchor];
    id v86 = [(UILayoutGuide *)v9->_contentLayoutGuide topAnchor];
    v87 = [v85 constraintEqualToAnchor:v86];
    v189[2] = v87;
    id v88 = [(UIImageView *)v9->_largeIconView centerXAnchor];
    v89 = [(UILayoutGuide *)v9->_contentLayoutGuide centerXAnchor];
    v90 = [v88 constraintEqualToAnchor:v89];
    v189[3] = v90;
    uint64_t v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:4];
    largeIconViewConstraints = v9->_largeIconViewConstraints;
    v9->_largeIconViewConstraints = (NSArray *)v91;

    [(PUPickerOnboardingView *)v9 addSubview:v9->_largeIconView];
    [MEMORY[0x1E4F28DC8] activateConstraints:v9->_largeIconViewConstraints];
    id v93 = objc_alloc(MEMORY[0x1E4FB17D8]);
    [(PUPickerOnboardingView *)v9 attachmentAnchorSize];
    v181 = objc_msgSend(v93, "initWithSize:");
    id v94 = objc_alloc(MEMORY[0x1E4FB1838]);
    id v95 = [v181 imageWithActions:&__block_literal_global_102364];
    uint64_t v96 = [v94 initWithImage:v95];
    attachmentAnchorView = v9->_attachmentAnchorView;
    v9->_attachmentAnchorView = (UIImageView *)v96;

    id v98 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v99 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PhotosIndicator");
    uint64_t v100 = [v98 initWithImage:v99];
    attachmentIconView = v9->_attachmentIconView;
    v9->_attachmentIconView = (UIImageView *)v100;

    id v102 = [MEMORY[0x1E4FB1DD8] textViewUsingTextLayoutManager:1];
    v103 = [(UITextView *)v102 textContainer];
    [v103 setLineFragmentPadding:0.0];

    -[UITextView setTextContainerInset:](v102, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v104 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v102 setBackgroundColor:v104];

    [(UITextView *)v102 setEditable:0];
    [(UITextView *)v102 setScrollEnabled:0];
    [(UITextView *)v102 setDelaysContentTouches:0];
    [(UITextView *)v102 setSelectable:1];
    [(UITextView *)v102 _setInteractiveTextSelectionDisabled:1];
    textView = v9->_textView;
    v9->_textView = v102;

    [(UITextView *)v9->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)v9->_textView setAdjustsFontForContentSizeCategory:1];
    [(UITextView *)v9->_textView setDelegate:v9];
    id v106 = [(UITextView *)v9->_textView widthAnchor];
    uint64_t v107 = [v106 constraintEqualToConstant:320.0];
    textViewWidthConstraint = v9->_textViewWidthConstraint;
    v9->_textViewWidthConstraint = (NSLayoutConstraint *)v107;

    LODWORD(v109) = 1144750080;
    [(NSLayoutConstraint *)v9->_textViewWidthConstraint setPriority:v109];
    v110 = [(UITextView *)v9->_textView topAnchor];
    id v111 = [(UIImageView *)v9->_largeIconView bottomAnchor];
    uint64_t v112 = [v110 constraintEqualToAnchor:v111 constant:12.0];
    textViewTopAnchorToLargeIconConstraint = v9->_textViewTopAnchorToLargeIconConstraint;
    v9->_textViewTopAnchorToLargeIconConstraint = (NSLayoutConstraint *)v112;

    id v114 = [(UITextView *)v9->_textView topAnchor];
    v115 = [(UILayoutGuide *)v9->_contentLayoutGuide topAnchor];
    uint64_t v116 = [v114 constraintEqualToAnchor:v115];
    textViewTopAnchorToPlatterConstraint = v9->_textViewTopAnchorToPlatterConstraint;
    v9->_textViewTopAnchorToPlatterConstraint = (NSLayoutConstraint *)v116;

    v188[0] = v9->_textViewWidthConstraint;
    id v118 = [(UITextView *)v9->_textView leadingAnchor];
    id v119 = [(UILayoutGuide *)v9->_contentLayoutGuide leadingAnchor];
    id v120 = [v118 constraintEqualToAnchor:v119];
    v188[1] = v120;
    v121 = [(UILayoutGuide *)v9->_contentLayoutGuide trailingAnchor];
    id v122 = [(UITextView *)v9->_textView trailingAnchor];
    id v123 = [v121 constraintEqualToAnchor:v122];
    v188[2] = v123;
    uint64_t v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:3];
    textViewConstraints = v9->_textViewConstraints;
    v9->_textViewConstraints = (NSArray *)v124;

    [(PUPickerOnboardingView *)v9 _updateTextView];
    [(PUPickerOnboardingView *)v9 addSubview:v9->_textView];
    id v126 = (void *)MEMORY[0x1E4F28DC8];
    v127 = [(NSArray *)v9->_textViewConstraints arrayByAddingObject:v9->_textViewTopAnchorToLargeIconConstraint];
    [v126 activateConstraints:v127];

    uint64_t v128 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
    filledButtonConfiguration = v9->_filledButtonConfiguration;
    v9->_filledButtonConfiguration = (UIButtonConfiguration *)v128;

    [(UIButtonConfiguration *)v9->_filledButtonConfiguration setCornerStyle:4];
    [(UIButtonConfiguration *)v9->_filledButtonConfiguration setButtonSize:2];
    v130 = PULocalizedString(@"PICKER_PRIVACY_OK_BUTTON_TITLE");
    [(UIButtonConfiguration *)v9->_filledButtonConfiguration setTitle:v130];

    uint64_t v131 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    plainButtonConfiguration = v9->_plainButtonConfiguration;
    v9->_plainButtonConfiguration = (UIButtonConfiguration *)v131;

    -[UIButtonConfiguration setContentInsets:](v9->_plainButtonConfiguration, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    [(UIButtonConfiguration *)v9->_plainButtonConfiguration setButtonSize:2];
    CGAffineTransform v133 = [(UIButtonConfiguration *)v9->_filledButtonConfiguration title];
    [(UIButtonConfiguration *)v9->_plainButtonConfiguration setTitle:v133];

    CGAffineTransform v134 = v9->_filledButtonConfiguration;
    v135 = (void *)MEMORY[0x1E4FB14D0];
    id v136 = v9;
    v137 = [v135 buttonWithConfiguration:v134 primaryAction:0];
    [v137 addTarget:v136 action:sel_transitionToBadge_ forControlEvents:0x2000];

    LODWORD(v138) = 1148846080;
    [v137 setContentHuggingPriority:1 forAxis:v138];
    [v137 setRole:1];
    id v139 = v136[72];
    v136[72] = v137;

    [v136[72] setTranslatesAutoresizingMaskIntoConstraints:0];
    CGRect v140 = [v136[72] topAnchor];
    CGRect v141 = [(UITextView *)v9->_textView bottomAnchor];
    uint64_t v142 = [v140 constraintEqualToAnchor:v141 constant:16.0];
    id v143 = v136[75];
    v136[75] = (id)v142;

    v144 = [(UILayoutGuide *)v9->_contentLayoutGuide bottomAnchor];
    v145 = [v136[72] bottomAnchor];
    uint64_t v146 = [v144 constraintEqualToAnchor:v145];
    id v147 = v136[76];
    v136[76] = (id)v146;

    LODWORD(v148) = 1132199936;
    [v136[76] setPriority:v148];
    [v136[76] constant];
    v136[78] = v149;
    v187[0] = v136[75];
    v187[1] = v136[76];
    v150 = [v136[72] widthAnchor];
    v151 = [v150 constraintGreaterThanOrEqualToConstant:80.0];
    v187[2] = v151;
    v152 = [v136[72] centerXAnchor];
    v153 = [v136 centerXAnchor];
    v154 = [v152 constraintEqualToAnchor:v153];
    v187[3] = v154;
    uint64_t v155 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:4];
    id v156 = v136[77];
    v136[77] = (id)v155;

    [v136 addSubview:v136[72]];
    [MEMORY[0x1E4F28DC8] activateConstraints:v136[77]];
    v157 = objc_alloc_init(PUPickerPrivacyBadge);
    id v158 = v136[81];
    v136[81] = v157;

    [v136[81] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v136[81] setHidden:1];
    [v136 addSubview:v136[81]];
    [v136 _updateBadgeConstraints];
    v159 = -[PUPickerBadgeIconView initWithFrame:]([PUPickerBadgeIconView alloc], "initWithFrame:", 0.0, 0.0, 20.0, 20.0);
    id v160 = v136[83];
    v136[83] = v159;

    [v136[83] setHidden:1];
    v161 = [(UIVisualEffectView *)v9->_platter contentView];
    [v161 addSubview:v136[83]];

    uint64_t v162 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    id v163 = v136[84];
    v136[84] = (id)v162;

    v164 = [v136[81] labelFont];
    [v136[84] setFont:v164];

    v165 = [v136[81] labelText];
    [v136[84] setText:v165];

    [v136[84] setHidden:1];
    v166 = [(UIVisualEffectView *)v9->_platter contentView];
    id v4 = v182;
    [v166 addSubview:v136[84]];
  }
  return v9;
}

@end