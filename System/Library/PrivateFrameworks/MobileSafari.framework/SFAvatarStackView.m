@interface SFAvatarStackView
+ (id)randomContactIdentifiers;
- (CGRect)_contentRectForContentWidth:(double)a3 viewWith:(double)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeForParticipantCount:(int64_t)a3;
- (NSArray)shareParticipants;
- (SFAvatarStackView)initWithFrame:(CGRect)a3;
- (double)_widthForParticipantCount:(int64_t)a3;
- (double)avatarDiameter;
- (double)spacing;
- (id)_avatarViewControllerForParticipantIdentifier:(id)a3;
- (id)_overflowLabel;
- (id)_overflowView;
- (id)_viewForParticipantIdentifier:(id)a3;
- (int64_t)alignment;
- (void)_layOutIndexes:(id)a3 ofParticipantIdentifiers:(id)a4 targetWidth:(id)a5;
- (void)_loadOverflowView;
- (void)_removeViewsForIndexes:(id)a3 ofParticipantIdentifiers:(id)a4;
- (void)_setIndexes:(id)a3 ofParticipantIdentifiers:(id)a4 transitioning:(BOOL)a5 completion:(id)a6;
- (void)_setVisibleParticipantIdentifiers:(id)a3;
- (void)_updateVisibleParticipants;
- (void)layoutSubviews;
- (void)setAlignment:(int64_t)a3;
- (void)setAvatarDiameter:(double)a3;
- (void)setShareParticipants:(id)a3;
- (void)setSpacing:(double)a3;
@end

@implementation SFAvatarStackView

- (void)setShareParticipants:(id)a3
{
  id v4 = a3;
  v5 = (NSArray *)[v4 copy];
  shareParticipants = self->_shareParticipants;
  self->_shareParticipants = v5;

  unint64_t v7 = [v4 count];
  if (v7 >= 4)
  {
    unint64_t v8 = v7 - 2;
    v9 = overflowCountFormatter();
    v10 = v9;
    if (v8 < 0xA)
    {
      v11 = [NSNumber numberWithUnsignedInteger:v8];
      v12 = [v10 stringFromNumber:v11];
      v13 = [(SFAvatarStackView *)self _overflowLabel];
      [v13 setText:v12];
    }
    else
    {
      v11 = [v9 plusSign];
      v12 = [(SFAvatarStackView *)self _overflowLabel];
      [v12 setText:v11];
    }
  }

  [(SFAvatarStackView *)self _updateVisibleParticipants];
}

- (void)setAvatarDiameter:(double)a3
{
  if (self->_avatarDiameter != a3)
  {
    self->_avatarDiameter = a3;
    [(SFAvatarStackView *)self invalidateIntrinsicContentSize];
    [(SFAvatarStackView *)self setNeedsLayout];
  }
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (void)_setIndexes:(id)a3 ofParticipantIdentifiers:(id)a4 transitioning:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void *)MEMORY[0x1E4FB1EB0];
  if (v7) {
    double v14 = 0.0;
  }
  else {
    double v14 = 0.25;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__SFAvatarStackView__setIndexes_ofParticipantIdentifiers_transitioning_completion___block_invoke;
  v20[3] = &unk_1E54EA428;
  id v21 = v11;
  id v22 = v10;
  v23 = self;
  BOOL v24 = v7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__SFAvatarStackView__setIndexes_ofParticipantIdentifiers_transitioning_completion___block_invoke_3;
  v18[3] = &unk_1E54E9D78;
  id v19 = v12;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  objc_msgSend(v13, "sf_animate:usingDefaultMotionWithDelay:options:animations:completion:", 1, 98, v20, v18, v14);
}

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

uint64_t __83__SFAvatarStackView__setIndexes_ofParticipantIdentifiers_transitioning_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SFAvatarStackView;
  [(SFAvatarStackView *)&v4 layoutSubviews];
  v3 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, -[NSArray count](self->_visibleParticipantIdentifiers, "count"));
  [(SFAvatarStackView *)self _layOutIndexes:v3 ofParticipantIdentifiers:self->_visibleParticipantIdentifiers targetWidth:0];
  [(SFAvatarStackView *)self _setIndexes:v3 ofParticipantIdentifiers:self->_visibleParticipantIdentifiers transitioning:0 completion:0];
}

- (void)_layOutIndexes:(id)a3 ofParticipantIdentifiers:(id)a4 targetWidth:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  [(SFAvatarStackView *)self bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  -[SFAvatarStackView _widthForParticipantCount:](self, "_widthForParticipantCount:", [v8 count]);
  double v20 = v19;
  if (v9)
  {
    [v9 doubleValue];
  }
  else
  {
    v27.origin.x = v12;
    v27.origin.y = v14;
    v27.size.width = v16;
    v27.size.height = v18;
    double Width = CGRectGetWidth(v27);
  }
  [(SFAvatarStackView *)self _contentRectForContentWidth:v20 viewWith:Width];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __73__SFAvatarStackView__layOutIndexes_ofParticipantIdentifiers_targetWidth___block_invoke;
  v26[3] = &unk_1E54EA3D8;
  v26[4] = self;
  v26[5] = v22;
  v26[6] = v23;
  v26[7] = v24;
  v26[8] = v25;
  *(CGFloat *)&v26[9] = v12;
  *(CGFloat *)&v26[10] = v14;
  *(CGFloat *)&v26[11] = v16;
  *(CGFloat *)&v26[12] = v18;
  [v8 enumerateObjectsAtIndexes:v10 options:0 usingBlock:v26];
}

- (CGSize)sizeForParticipantCount:(int64_t)a3
{
  if (a3 >= 3) {
    a3 = 3;
  }
  [(SFAvatarStackView *)self _widthForParticipantCount:a3];
  double avatarDiameter = self->_avatarDiameter;
  result.height = avatarDiameter;
  result.width = v4;
  return result;
}

- (double)_widthForParticipantCount:(int64_t)a3
{
  if (a3 <= 1) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = a3;
  }
  return self->_spacing * (double)(v3 - 1) + (double)a3 * self->_avatarDiameter;
}

- (CGRect)_contentRectForContentWidth:(double)a3 viewWith:(double)a4
{
  int64_t alignment = self->_alignment;
  if (alignment == 1)
  {
    BOOL v9 = [(UIView *)self _sf_usesLeftToRightLayout];
    double v8 = a4 - a3;
    if (!v9) {
      double v8 = 0.0;
    }
  }
  else
  {
    double v8 = (a4 - a3) * 0.5;
    if (alignment) {
      double v8 = 0.0;
    }
  }
  double avatarDiameter = self->_avatarDiameter;
  double v11 = 0.0;
  double v12 = a3;
  result.size.height = avatarDiameter;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  NSUInteger v3 = [(NSArray *)self->_visibleParticipantIdentifiers count];

  [(SFAvatarStackView *)self sizeForParticipantCount:v3];
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_updateVisibleParticipants
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_contactsByParticipantIdentifer removeAllObjects];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  NSUInteger v3 = self->_shareParticipants;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        BOOL v9 = objc_msgSend(v8, "safari_contact");
        contactsByParticipantIdentifer = self->_contactsByParticipantIdentifer;
        double v11 = objc_msgSend(v8, "safari_shareParticipantIdentifier");
        [(NSMutableDictionary *)contactsByParticipantIdentifer setObject:v9 forKeyedSubscript:v11];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v5);
  }

  double v12 = [MEMORY[0x1E4F1B8F8] comparatorForNameSortOrder:1];
  shareParticipants = self->_shareParticipants;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __47__SFAvatarStackView__updateVisibleParticipants__block_invoke;
  v26 = &unk_1E54EA340;
  CGRect v27 = self;
  id v14 = v12;
  id v28 = v14;
  double v15 = [(NSArray *)shareParticipants sortedArrayUsingComparator:&v23];
  CGFloat v16 = self->_shareParticipants;
  self->_shareParticipants = v15;

  NSUInteger v17 = [(NSArray *)self->_shareParticipants count];
  CGFloat v18 = self->_shareParticipants;
  if (v17 <= 3)
  {
    double v19 = v18;
  }
  else
  {
    -[NSArray subarrayWithRange:](v18, "subarrayWithRange:", 0, 2);
    double v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  double v20 = v19;
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  uint64_t v22 = [(NSArray *)v20 safari_mapObjectsUsingBlock:&__block_literal_global_3];
  [v21 addObjectsFromArray:v22];

  if (v17 >= 4) {
    [v21 addObject:@"overflow"];
  }
  [(SFAvatarStackView *)self _setVisibleParticipantIdentifiers:v21];
}

- (void)_setVisibleParticipantIdentifiers:(id)a3
{
  id v5 = a3;
  objc_initWeak(location, self);
  uint64_t v6 = self->_visibleParticipantIdentifiers;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visibleParticipantIdentifiers, a3);
    [(SFAvatarStackView *)self invalidateIntrinsicContentSize];
    [(SFAvatarStackView *)self setNeedsLayout];
    BOOL v7 = [v5 differenceFromArray:v6 withOptions:4];
    if ([MEMORY[0x1E4FB1EB0] areAnimationsEnabled]
      && ([(SFAvatarStackView *)self window],
          double v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      BOOL v9 = objc_msgSend(v7, "safari_insertionIndexes");
      id v10 = objc_msgSend(v7, "safari_removalIndexes");
      double v11 = (void *)MEMORY[0x1E4FB1EB0];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __55__SFAvatarStackView__setVisibleParticipantIdentifiers___block_invoke;
      v27[3] = &unk_1E54E9B00;
      v27[4] = self;
      id v12 = v9;
      id v28 = v12;
      id v13 = v5;
      id v29 = v13;
      [v11 performWithoutAnimation:v27];
      id v14 = (void *)MEMORY[0x1E4FB1EB0];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __55__SFAvatarStackView__setVisibleParticipantIdentifiers___block_invoke_2;
      v22[3] = &unk_1E54EA388;
      objc_copyWeak(&v26, location);
      id v23 = v13;
      id v15 = v10;
      id v24 = v15;
      CGFloat v16 = v6;
      uint64_t v25 = v16;
      [v14 _animateUsingDefaultTimingWithOptions:2 animations:v22 completion:0];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __55__SFAvatarStackView__setVisibleParticipantIdentifiers___block_invoke_3;
      v18[3] = &unk_1E54EA3B0;
      objc_copyWeak(&v21, location);
      id v17 = v15;
      id v19 = v17;
      double v20 = v16;
      [(SFAvatarStackView *)self _setIndexes:v17 ofParticipantIdentifiers:v20 transitioning:1 completion:v18];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v26);
    }
    else
    {
      objc_msgSend(v7, "safari_removalIndexes");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      [(SFAvatarStackView *)self _removeViewsForIndexes:v12 ofParticipantIdentifiers:v6];
    }
  }
  objc_destroyWeak(location);
}

- (SFAvatarStackView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFAvatarStackView;
  NSUInteger v3 = -[SFAvatarStackView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    [(SFAvatarStackView *)v3 setUserInteractionEnabled:0];
    v4->_int64_t alignment = 1;
    v4->_double avatarDiameter = 22.0;
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    avatarViewControllersByParticipantIdentifier = v4->_avatarViewControllersByParticipantIdentifier;
    v4->_avatarViewControllersByParticipantIdentifier = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    contactsByParticipantIdentifer = v4->_contactsByParticipantIdentifer;
    v4->_contactsByParticipantIdentifer = (NSMutableDictionary *)v7;

    v4->_spacing = -6.0;
    visibleParticipantIdentifiers = v4->_visibleParticipantIdentifiers;
    v4->_visibleParticipantIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];

    id v10 = v4;
  }

  return v4;
}

uint64_t __83__SFAvatarStackView__setIndexes_ofParticipantIdentifiers_transitioning_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__SFAvatarStackView__setIndexes_ofParticipantIdentifiers_transitioning_completion___block_invoke_2;
  v4[3] = &unk_1E54EA400;
  v4[4] = *(void *)(a1 + 48);
  char v5 = *(unsigned char *)(a1 + 56);
  return [v2 enumerateObjectsAtIndexes:v1 options:0 usingBlock:v4];
}

- (void)setSpacing:(double)a3
{
  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    [(SFAvatarStackView *)self setNeedsLayout];
  }
}

uint64_t __47__SFAvatarStackView__updateVisibleParticipants__block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v5 = *(void **)(*(void *)(a1 + 32) + 416);
  id v6 = a3;
  uint64_t v7 = objc_msgSend(a2, "safari_shareParticipantIdentifier");
  double v8 = [v5 objectForKeyedSubscript:v7];

  BOOL v9 = *(void **)(*(void *)(a1 + 32) + 416);
  id v10 = objc_msgSend(v6, "safari_shareParticipantIdentifier");

  double v11 = [v9 objectForKeyedSubscript:v10];

  uint64_t v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  return v12;
}

uint64_t __47__SFAvatarStackView__updateVisibleParticipants__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_shareParticipantIdentifier");
}

uint64_t __55__SFAvatarStackView__setVisibleParticipantIdentifiers___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layOutIndexes:*(void *)(a1 + 40) ofParticipantIdentifiers:*(void *)(a1 + 48) targetWidth:0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 _setIndexes:v3 ofParticipantIdentifiers:v4 transitioning:1 completion:0];
}

void __55__SFAvatarStackView__setVisibleParticipantIdentifiers___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_widthForParticipantCount:", objc_msgSend(*(id *)(a1 + 32), "count"));
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithDouble:");
    [WeakRetained _layOutIndexes:v3 ofParticipantIdentifiers:v2 targetWidth:v4];

    [WeakRetained layoutIfNeeded];
  }
}

void __55__SFAvatarStackView__setVisibleParticipantIdentifiers___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _removeViewsForIndexes:*(void *)(a1 + 32) ofParticipantIdentifiers:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __73__SFAvatarStackView__layOutIndexes_ofParticipantIdentifiers_targetWidth___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v12 = [*(id *)(a1 + 32) _viewForParticipantIdentifier:a2];
  [*(id *)(a1 + 32) addSubview:v12];
  [v12 _setCornerRadius:*(double *)(*(void *)(a1 + 32) + 456) * 0.5];
  double v5 = (double)a3;
  double v6 = *(double *)(*(void *)(a1 + 32) + 456) + *(double *)(*(void *)(a1 + 32) + 472);
  CGFloat v7 = CGRectGetMinX(*(CGRect *)(a1 + 40)) + (double)a3 * v6;
  CGFloat Height = CGRectGetHeight(*(CGRect *)(a1 + 72));
  objc_msgSend(v12, "ss_setUntransformedFrame:", _SFFlipRectInCoordinateSpace(objc_msgSend(*(id *)(a1 + 32), "_sf_usesLeftToRightLayout") ^ 1u, v7, (Height - *(double *)(*(void *)(a1 + 32) + 456)) * 0.5, *(CGFloat *)(*(void *)(a1 + 32) + 456), *(CGFloat *)(*(void *)(a1 + 32) + 456), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64)));
  BOOL v9 = [v12 layer];
  [v9 setZPosition:-v5];
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, *(double *)(*(void *)(a1 + 32) + 456), *(double *)(*(void *)(a1 + 32) + 456));
  id v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShadowPath:", objc_msgSend(v10, "CGPath"));

  objc_msgSend(v9, "setShadowOffset:", 0.0, 1.0);
  LODWORD(v11) = 1042536202;
  [v9 setShadowOpacity:v11];
  [v9 setShadowRadius:3.0];
  [v12 layoutIfNeeded];
}

void __83__SFAvatarStackView__setIndexes_ofParticipantIdentifiers_transitioning_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _viewForParticipantIdentifier:a2];
  uint64_t v4 = v3;
  double v5 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v5 = 1.0;
  }
  [v3 setAlpha:v5];
  double v6 = 0.5;
  if (!*(unsigned char *)(a1 + 40)) {
    double v6 = 1.0;
  }
  CGAffineTransformMakeScale(&v8, v6, v6);
  CGAffineTransform v7 = v8;
  [v4 setTransform:&v7];
}

- (id)_viewForParticipantIdentifier:(id)a3
{
  id v4 = a3;
  if (WBSIsEqual())
  {
    double v5 = [(SFAvatarStackView *)self _overflowView];
  }
  else
  {
    double v6 = [(SFAvatarStackView *)self _avatarViewControllerForParticipantIdentifier:v4];
    double v5 = [v6 view];
  }

  return v5;
}

- (id)_avatarViewControllerForParticipantIdentifier:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(NSMutableDictionary *)self->_avatarViewControllersByParticipantIdentifier objectForKeyedSubscript:v4];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    CGAffineTransform v8 = [MEMORY[0x1E4F982D8] sharedContactStoreManager];
    BOOL v9 = [v8 contactStore];

    id v10 = [MEMORY[0x1E4F1BB50] settingsWithContactStore:v9];
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F1BB40]) initWithSettings:v10];
    uint64_t v11 = [(NSMutableDictionary *)self->_contactsByParticipantIdentifer objectForKeyedSubscript:v4];
    id v12 = (void *)v11;
    if (v11)
    {
      v15[0] = v11;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [v7 setContacts:v13];
    }
    [(NSMutableDictionary *)self->_avatarViewControllersByParticipantIdentifier setObject:v7 forKeyedSubscript:v4];
  }

  return v7;
}

- (void)_removeViewsForIndexes:(id)a3 ofParticipantIdentifiers:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__SFAvatarStackView__removeViewsForIndexes_ofParticipantIdentifiers___block_invoke;
  v4[3] = &unk_1E54EA450;
  v4[4] = self;
  [a4 enumerateObjectsAtIndexes:a3 options:0 usingBlock:v4];
}

void __69__SFAvatarStackView__removeViewsForIndexes_ofParticipantIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 440), "containsObject:") & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) _viewForParticipantIdentifier:v4];
    [v3 removeFromSuperview];

    [*(id *)(*(void *)(a1 + 32) + 408) setObject:0 forKeyedSubscript:v4];
  }
}

- (id)_overflowView
{
  overflowView = self->_overflowView;
  if (!overflowView)
  {
    [(SFAvatarStackView *)self _loadOverflowView];
    overflowView = self->_overflowView;
  }

  return overflowView;
}

- (id)_overflowLabel
{
  overflowLabel = self->_overflowLabel;
  if (!overflowLabel)
  {
    [(SFAvatarStackView *)self _loadOverflowView];
    overflowLabel = self->_overflowLabel;
  }

  return overflowLabel;
}

- (void)_loadOverflowView
{
  id v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  overflowView = self->_overflowView;
  self->_overflowView = v3;

  double v5 = [MEMORY[0x1E4FB1618] systemGray4Color];
  [(UIView *)self->_overflowView setBackgroundColor:v5];

  double v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  overflowLabel = self->_overflowLabel;
  self->_overflowLabel = v6;

  CGAffineTransform v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_overflowLabel setTextColor:v8];

  [(UILabel *)self->_overflowLabel setTextAlignment:1];
  BOOL v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.0];
  [(UILabel *)self->_overflowLabel setFont:v9];

  [(UILabel *)self->_overflowLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_overflowView addSubview:self->_overflowLabel];
  id v10 = (void *)MEMORY[0x1E4F28DC8];
  objc_msgSend(MEMORY[0x1E4F28DC8], "safari_constraintsMatchingFrameOfView:withFrameOfView:directionalInsets:", self->_overflowLabel, self->_overflowView, 0.0, 2.0, 0.0, 2.0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v10 activateConstraints:v11];
}

+ (id)randomContactIdentifiers
{
  uint64_t v2 = [MEMORY[0x1E4F982D8] sharedContactStoreManager];
  id v3 = [v2 defaultContainerIdentifier];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1B8F8] predicateForContactsInContainerWithIdentifier:v3];
    double v5 = [v2 unifiedContactsMatchingPredicate:v4 keysToFetch:MEMORY[0x1E4F1CBF0] error:0];
    double v6 = (void *)[v5 mutableCopy];

    unint64_t v7 = [v6 count];
    if (v7 >= (arc4random() & 3) + 1) {
      unint64_t v8 = (arc4random() & 3) + 1;
    }
    else {
      unint64_t v8 = [v6 count];
    }
    id v10 = [MEMORY[0x1E4F1CA48] array];
    BOOL v9 = v10;
    while ([v10 count] < v8)
    {
      unint64_t v11 = arc4random();
      unint64_t v12 = v11 % [v6 count];
      id v13 = [v6 objectAtIndexedSubscript:v12];
      id v14 = [v13 identifier];
      [v9 addObject:v14];

      [v6 removeObjectAtIndex:v12];
      id v10 = v9;
    }
  }
  else
  {
    BOOL v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (double)avatarDiameter
{
  return self->_avatarDiameter;
}

- (double)spacing
{
  return self->_spacing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_visibleParticipantIdentifiers, 0);
  objc_storeStrong((id *)&self->_overflowLabel, 0);
  objc_storeStrong((id *)&self->_overflowView, 0);
  objc_storeStrong((id *)&self->_contactsByParticipantIdentifer, 0);

  objc_storeStrong((id *)&self->_avatarViewControllersByParticipantIdentifier, 0);
}

@end