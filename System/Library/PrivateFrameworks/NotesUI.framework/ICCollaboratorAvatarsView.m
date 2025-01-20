@interface ICCollaboratorAvatarsView
- (BOOL)isAccessibilityElement;
- (BOOL)reverseZIndexing;
- (CGSize)shadowOffset;
- (CKShare)share;
- (ICCollaboratorAvatarsView)initWithCoder:(id)a3;
- (ICCollaboratorAvatarsView)initWithFrame:(CGRect)a3;
- (NSArray)avatarContainerViews;
- (NSArray)participants;
- (UIStackView)avatarStackView;
- (double)borderWidth;
- (double)dimension;
- (double)shadowOpacity;
- (double)shadowRadius;
- (double)spacing;
- (id)accessibilityIdentifier;
- (id)accessibilityValue;
- (id)avatarViews;
- (id)createAvatarContainerView;
- (id)defaultAvatarImageViewWithSize:(CGSize)a3;
- (unint64_t)displayedAvatarCount;
- (void)commonInit;
- (void)registerForTraitChanges;
- (void)setAvatarContainerViews:(id)a3;
- (void)setAvatarStackView:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setDimension:(double)a3;
- (void)setParticipants:(id)a3;
- (void)setReverseZIndexing:(BOOL)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowRadius:(double)a3;
- (void)setShare:(id)a3;
- (void)setSpacing:(double)a3;
- (void)setUpAvatarContainerViews;
- (void)updateShadows;
- (void)updateUI;
@end

@implementation ICCollaboratorAvatarsView

- (ICCollaboratorAvatarsView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICCollaboratorAvatarsView;
  v3 = [(ICCollaboratorAvatarsView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ICCollaboratorAvatarsView *)v3 commonInit];
  }
  return v4;
}

- (ICCollaboratorAvatarsView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICCollaboratorAvatarsView;
  v3 = -[ICCollaboratorAvatarsView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ICCollaboratorAvatarsView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v3 = [(ICCollaboratorAvatarsView *)self layer];
  [v3 setMasksToBounds:0];

  self->_borderWidth = 1.5;
  self->_dimension = 26.0;
  self->_shadowOffset.width = 0.0;
  self->_shadowOffset.height = 0.0;
  self->_shadowOpacity = 0.1;
  self->_shadowRadius = 2.0;
  self->_spacing = -12.0;
  [(ICCollaboratorAvatarsView *)self setUpAvatarContainerViews];
  [(ICCollaboratorAvatarsView *)self updateShadows];
  [(NSArray *)self->_avatarContainerViews enumerateObjectsUsingBlock:&__block_literal_global_38];
  [(ICCollaboratorAvatarsView *)self registerForTraitChanges];
}

uint64_t __39__ICCollaboratorAvatarsView_commonInit__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHidden:1];
}

- (void)setBorderWidth:(double)a3
{
  if (self->_borderWidth != a3)
  {
    self->_borderWidth = a3;
    [(ICCollaboratorAvatarsView *)self updateUI];
  }
}

- (void)setDimension:(double)a3
{
  if (self->_dimension != a3)
  {
    self->_dimension = a3;
    [(ICCollaboratorAvatarsView *)self setUpAvatarContainerViews];
  }
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
  [(ICCollaboratorAvatarsView *)self updateUI];
}

- (void)setShare:(id)a3
{
  objc_storeWeak((id *)&self->_share, a3);
  [(ICCollaboratorAvatarsView *)self updateUI];
}

- (void)setShadowRadius:(double)a3
{
  if (self->_shadowRadius != a3)
  {
    self->_shadowRadius = a3;
    [(ICCollaboratorAvatarsView *)self updateShadows];
  }
}

- (void)setShadowOpacity:(double)a3
{
  if (self->_shadowOpacity != a3)
  {
    self->_shadowOpacity = a3;
    [(ICCollaboratorAvatarsView *)self updateShadows];
  }
}

- (void)setShadowOffset:(CGSize)a3
{
  if (self->_shadowOffset.width != a3.width || self->_shadowOffset.height != a3.height)
  {
    self->_shadowOffset = a3;
    [(ICCollaboratorAvatarsView *)self updateShadows];
  }
}

- (void)setSpacing:(double)a3
{
  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    id v4 = [(ICCollaboratorAvatarsView *)self avatarStackView];
    [v4 setSpacing:a3];
  }
}

- (unint64_t)displayedAvatarCount
{
  v2 = [(ICCollaboratorAvatarsView *)self avatarStackView];
  v3 = [v2 arrangedSubviews];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)registerForTraitChanges
{
  v3 = objc_msgSend(MEMORY[0x1E4FB1E20], "ic_traitsAffectingSizeAndColor");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__ICCollaboratorAvatarsView_registerForTraitChanges__block_invoke;
  v5[3] = &unk_1E5FDB620;
  v5[4] = self;
  id v4 = (id)[(ICCollaboratorAvatarsView *)self registerForTraitChanges:v3 withHandler:v5];
}

uint64_t __52__ICCollaboratorAvatarsView_registerForTraitChanges__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUpAvatarContainerViews];
  v2 = *(void **)(a1 + 32);
  return [v2 updateUI];
}

- (id)createAvatarContainerView
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(ICCollaboratorAvatarsView *)self dimension];
  objc_msgSend(v3, "ic_applyRoundedCornersWithRadius:", v4 * 0.5);
  v5 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v6 = [v3 widthAnchor];
  [(ICCollaboratorAvatarsView *)self dimension];
  v7 = objc_msgSend(v6, "constraintEqualToConstant:");
  v12[0] = v7;
  v8 = [v3 heightAnchor];
  [(ICCollaboratorAvatarsView *)self dimension];
  v9 = objc_msgSend(v8, "constraintEqualToConstant:");
  v12[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v5 activateConstraints:v10];

  return v3;
}

- (void)setUpAvatarContainerViews
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(ICCollaboratorAvatarsView *)self avatarStackView];
  double v4 = [v3 arrangedSubviews];
  [v4 makeObjectsPerformSelector:sel_removeFromSuperview];

  v5 = [(ICCollaboratorAvatarsView *)self createAvatarContainerView];
  objc_super v6 = [(ICCollaboratorAvatarsView *)self createAvatarContainerView];
  v7 = [(ICCollaboratorAvatarsView *)self createAvatarContainerView];
  v18[0] = v5;
  v18[1] = v6;
  v18[2] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  [(ICCollaboratorAvatarsView *)self setAvatarContainerViews:v8];

  id v9 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v10 = [(ICCollaboratorAvatarsView *)self avatarContainerViews];
  v11 = (void *)[v9 initWithArrangedSubviews:v10];
  [(ICCollaboratorAvatarsView *)self setAvatarStackView:v11];

  v12 = [(ICCollaboratorAvatarsView *)self avatarStackView];
  [v12 setDistribution:1];

  [(ICCollaboratorAvatarsView *)self spacing];
  double v14 = v13;
  v15 = [(ICCollaboratorAvatarsView *)self avatarStackView];
  [v15 setSpacing:v14];

  v16 = [(ICCollaboratorAvatarsView *)self avatarStackView];
  [(ICCollaboratorAvatarsView *)self addSubview:v16];

  v17 = [(ICCollaboratorAvatarsView *)self avatarStackView];
  objc_msgSend(v17, "ic_addAnchorsToFillSuperview");
}

- (void)updateShadows
{
  id v3 = [(ICCollaboratorAvatarsView *)self avatarContainerViews];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__ICCollaboratorAvatarsView_updateShadows__block_invoke;
  v4[3] = &unk_1E5FDB648;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __42__ICCollaboratorAvatarsView_updateShadows__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v10 = a2;
  [v3 shadowRadius];
  double v5 = v4;
  [*(id *)(a1 + 32) shadowOpacity];
  double v7 = v6;
  [*(id *)(a1 + 32) shadowOffset];
  objc_msgSend(v10, "ic_applyShadowWithRadius:opacity:offset:", v5, v7, v8, v9);
}

- (void)updateUI
{
  id v3 = [(ICCollaboratorAvatarsView *)self avatarViews];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 1000;
  double v4 = [(ICCollaboratorAvatarsView *)self avatarContainerViews];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__ICCollaboratorAvatarsView_updateUI__block_invoke;
  v6[3] = &unk_1E5FDB670;
  id v5 = v3;
  id v7 = v5;
  double v8 = self;
  double v9 = v10;
  [v4 enumerateObjectsUsingBlock:v6];

  _Block_object_dispose(v10, 8);
}

void __37__ICCollaboratorAvatarsView_updateUI__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v17 = a2;
  id v5 = [v17 subviews];
  [v5 makeObjectsPerformSelector:sel_removeFromSuperview];

  if ([*(id *)(a1 + 32) count] > a3
    && ([*(id *)(a1 + 32) objectAtIndexedSubscript:a3], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    [v17 addSubview:v6];
    objc_msgSend(v7, "ic_addAnchorsToFillSuperview");
    [*(id *)(a1 + 40) dimension];
    objc_msgSend(v7, "ic_applyRoundedCornersWithRadius:", v8 * 0.5);
    if (([MEMORY[0x1E4F83738] deviceIsVision] & 1) == 0)
    {
      double v9 = [MEMORY[0x1E4F39BE8] layer];
      [*(id *)(a1 + 40) dimension];
      double v11 = v10 + 1.0;
      [*(id *)(a1 + 40) dimension];
      objc_msgSend(v9, "setFrame:", -0.5, -0.5, v11, v12 + 1.0);
      [v9 frame];
      [v9 setCornerRadius:CGRectGetMidX(v19)];
      id v13 = [MEMORY[0x1E4FB1618] whiteColor];
      objc_msgSend(v9, "setBorderColor:", objc_msgSend(v13, "CGColor"));

      [*(id *)(a1 + 40) borderWidth];
      objc_msgSend(v9, "setBorderWidth:");
      double v14 = [v7 layer];
      [v14 addSublayer:v9];

      [v9 setZPosition:1.0];
    }
    if ([*(id *)(a1 + 40) reverseZIndexing])
    {
      double v15 = (double)(unint64_t)--*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      v16 = [v17 layer];
      [v16 setZPosition:v15];
    }
    [v17 setHidden:0];
  }
  else
  {
    [v17 setHidden:1];
  }
}

- (id)avatarViews
{
  v17[1] = *MEMORY[0x1E4F143B8];
  [(ICCollaboratorAvatarsView *)self dimension];
  double v4 = v3;
  [(ICCollaboratorAvatarsView *)self dimension];
  double v6 = v5;
  id v7 = [(ICCollaboratorAvatarsView *)self participants];
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    double v10 = [(ICCollaboratorAvatarsView *)self share];
    objc_msgSend(v10, "ic_nonCurrentUserParticipants");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v11 = [(ICCollaboratorAvatarsView *)self share];
  if (objc_msgSend(v11, "ic_isPublicShare"))
  {
    uint64_t v12 = [v9 count];

    if (!v12)
    {
      id v13 = -[ICCollaboratorAvatarsView defaultAvatarImageViewWithSize:](self, "defaultAvatarImageViewWithSize:", v4, v6);
      v17[0] = v13;
      double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

      goto LABEL_9;
    }
  }
  else
  {
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__ICCollaboratorAvatarsView_avatarViews__block_invoke;
  v16[3] = &unk_1E5FDB6C0;
  v16[4] = self;
  *(double *)&v16[5] = v4;
  *(double *)&v16[6] = v6;
  double v14 = objc_msgSend(v9, "ic_map:", v16);
LABEL_9:

  return v14;
}

id __40__ICCollaboratorAvatarsView_avatarViews__block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = objc_msgSend(*(id *)(a1 + 32), "defaultAvatarImageViewWithSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_initWeak(&location, v4);
  double v5 = [ICThumbnailConfiguration alloc];
  v13[0] = v3;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v7 = -[ICThumbnailConfiguration initForAvatarWithParticipants:preferredSize:hasBorder:](v5, "initForAvatarWithParticipants:preferredSize:hasBorder:", v6, 0, *(double *)(a1 + 40), *(double *)(a1 + 48));

  double v8 = +[ICThumbnailService sharedThumbnailService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__ICCollaboratorAvatarsView_avatarViews__block_invoke_2;
  v10[3] = &unk_1E5FDB698;
  objc_copyWeak(&v11, &location);
  [v8 thumbnailWithConfiguration:v7 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v4;
}

void __40__ICCollaboratorAvatarsView_avatarViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  performBlockOnMainThread();

  objc_destroyWeak(&v5);
}

void __40__ICCollaboratorAvatarsView_avatarViews__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) image];
  if (v2)
  {
    [WeakRetained setImage:v2];
  }
  else
  {
    id v3 = [WeakRetained image];
    [WeakRetained setImage:v3];
  }
}

- (id)defaultAvatarImageViewWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  objc_initWeak(&location, v5);
  double v6 = [ICThumbnailConfiguration alloc];
  id v7 = -[ICThumbnailConfiguration initForAvatarWithParticipants:preferredSize:hasBorder:](v6, "initForAvatarWithParticipants:preferredSize:hasBorder:", MEMORY[0x1E4F1CBF0], 0, width, height);
  double v8 = +[ICThumbnailService sharedThumbnailService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__ICCollaboratorAvatarsView_defaultAvatarImageViewWithSize___block_invoke;
  v10[3] = &unk_1E5FDB698;
  objc_copyWeak(&v11, &location);
  [v8 thumbnailWithConfiguration:v7 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

void __60__ICCollaboratorAvatarsView_defaultAvatarImageViewWithSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  performBlockOnMainThread();

  objc_destroyWeak(&v5);
}

void __60__ICCollaboratorAvatarsView_defaultAvatarImageViewWithSize___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained image];
  if (v2)
  {
    [WeakRetained setImage:v2];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) image];
    [WeakRetained setImage:v3];
  }
}

- (BOOL)isAccessibilityElement
{
  return _AXSAutomationEnabled() != 0;
}

- (id)accessibilityIdentifier
{
  return @"Collaborator Avatars";
}

- (id)accessibilityValue
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__32;
  id v11 = __Block_byref_object_dispose__32;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [(ICCollaboratorAvatarsView *)self participants];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__ICCollaboratorAvatarsView_accessibilityValue__block_invoke;
  v6[3] = &unk_1E5FDB6E8;
  void v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__ICCollaboratorAvatarsView_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "ic_shortParticipantName");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_addNonNilObject:", v3);
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (double)dimension
{
  return self->_dimension;
}

- (NSArray)participants
{
  return self->_participants;
}

- (CKShare)share
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_share);
  return (CKShare *)WeakRetained;
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (double)spacing
{
  return self->_spacing;
}

- (BOOL)reverseZIndexing
{
  return self->_reverseZIndexing;
}

- (void)setReverseZIndexing:(BOOL)a3
{
  self->_reverseZIndexing = a3;
}

- (NSArray)avatarContainerViews
{
  return self->_avatarContainerViews;
}

- (void)setAvatarContainerViews:(id)a3
{
}

- (UIStackView)avatarStackView
{
  return self->_avatarStackView;
}

- (void)setAvatarStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarStackView, 0);
  objc_storeStrong((id *)&self->_avatarContainerViews, 0);
  objc_destroyWeak((id *)&self->_share);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end