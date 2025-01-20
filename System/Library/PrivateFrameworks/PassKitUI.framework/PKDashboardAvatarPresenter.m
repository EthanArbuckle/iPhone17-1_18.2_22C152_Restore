@interface PKDashboardAvatarPresenter
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardAvatarPresenter)initWithAvatarManager:(id)a3;
- (id)_contactForItem:(id)a3;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureView:(id)a3 item:(id)a4;
- (void)swapSummaryInCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKDashboardAvatarPresenter

- (PKDashboardAvatarPresenter)initWithAvatarManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardAvatarPresenter;
  v6 = [(PKDashboardAvatarPresenter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_needsSizing = 1;
    objc_storeStrong((id *)&v6->_avatarManager, a3);
  }

  return v7;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"avatarPresenter";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  objc_super v9 = [a4 dequeueReusableCellWithReuseIdentifier:@"avatarPresenter" forIndexPath:a5];
  v10 = [v9 hostedContentView];

  if (!v10)
  {
    v11 = [[PKAvatarHeaderView alloc] initWithContact:0 counterpartHandle:0];
    [v9 setHostedContentView:v11];
  }
  v12 = [v9 hostedContentView];
  [(PKDashboardAvatarPresenter *)self _configureView:v12 item:v8];

  return v9;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10 = a3;
  id v8 = a4;
  objc_super v9 = [v10 hostedContentView];
  [(PKDashboardAvatarPresenter *)self _configureView:v9 item:v8];
}

- (void)swapSummaryInCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10 = a3;
  id v8 = a4;
  objc_super v9 = [v10 hostedContentView];
  [(PKDashboardAvatarPresenter *)self _configureView:v9 item:v8];
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_needsSizing)
  {
    sampleView = self->_sampleView;
    if (!sampleView)
    {
      v12 = [(PKDashboardAvatarPresenter *)self _contactForItem:v8];
      v13 = [[PKAvatarHeaderView alloc] initWithContact:v12 counterpartHandle:0];
      v14 = self->_sampleView;
      self->_sampleView = v13;

      sampleView = self->_sampleView;
    }
    self->_needsSizing = 0;
    [(PKDashboardAvatarPresenter *)self _configureView:sampleView item:v8];
    v15 = self->_sampleView;
    [v9 bounds];
    double v17 = v16;
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    -[PKAvatarHeaderView sizeThatFits:](v15, "sizeThatFits:", v17 + v18 * -2.0, 3.40282347e38);
    CGFloat width = v19;
    CGFloat height = v21;
    self->_viewSize.CGFloat width = v19;
    self->_viewSize.CGFloat height = v21;
  }
  else
  {
    CGFloat width = self->_viewSize.width;
    CGFloat height = self->_viewSize.height;
  }

  double v23 = width;
  double v24 = height;
  result.CGFloat height = v24;
  result.CGFloat width = v23;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  if (a3)
  {
    if (a4)
    {
      id v7 = a4;
      id v8 = [a3 preferredContentSizeCategory];
      id v9 = [v7 preferredContentSizeCategory];

      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
      if (v10)
      {
        self->_needsSizing = 1;
        v11 = [[PKAvatarHeaderView alloc] initWithContact:0 counterpartHandle:0];
        sampleView = self->_sampleView;
        self->_sampleView = v11;
      }
    }
  }
}

- (id)_contactForItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 familyMember];
  v6 = [v4 accountUser];

  id v7 = [v6 altDSID];
  id v8 = [v6 nameComponents];
  if (!v7)
  {
    id v7 = [v5 altDSID];
  }
  id v9 = [(PKContactAvatarManager *)self->_avatarManager cachedAvatarForAltDSID:v7];
  NSComparisonResult v10 = v9;
  v11 = (void *)MEMORY[0x1E4F845E8];
  if (v9)
  {
    v12 = UIImagePNGRepresentation(v9);
    v13 = [v11 contactForFamilyMember:v5 nameComponents:v8 imageData:v12];
  }
  else
  {
    v13 = [MEMORY[0x1E4F845E8] contactForFamilyMember:v5 nameComponents:v8 imageData:0];
  }

  return v13;
}

- (void)_configureView:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(PKDashboardAvatarPresenter *)self _contactForItem:v7];
    [v6 setContact:v8];
    objc_initWeak(&location, self);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    CGFloat v19 = __50__PKDashboardAvatarPresenter__configureView_item___block_invoke;
    v20 = &unk_1E59D6D48;
    objc_copyWeak(&v23, &location);
    id v9 = v8;
    id v21 = v9;
    id v22 = v6;
    NSComparisonResult v10 = _Block_copy(&v17);
    v11 = objc_msgSend(v9, "imageData", v17, v18, v19, v20);

    if (!v11)
    {
      v12 = [v7 familyMember];
      if (v12)
      {

LABEL_6:
        avatarManager = self->_avatarManager;
        v15 = [v7 familyMember];
        double v16 = [v7 accountUser];
        [(PKContactAvatarManager *)avatarManager avatarForFamilyMember:v15 accountUser:v16 invitation:0 completion:v10];

        goto LABEL_7;
      }
      v13 = [v7 accountUser];

      if (v13) {
        goto LABEL_6;
      }
    }
LABEL_7:

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

void __50__PKDashboardAvatarPresenter__configureView_item___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __50__PKDashboardAvatarPresenter__configureView_item___block_invoke_2;
  v5[3] = &unk_1E59CE888;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __50__PKDashboardAvatarPresenter__configureView_item___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v6 = WeakRetained;
    id v3 = (void *)[*(id *)(a1 + 40) mutableCopy];
    id v4 = *(UIImage **)(a1 + 32);
    if (v4)
    {
      id v5 = UIImagePNGRepresentation(v4);
      [v3 setImageData:v5];
    }
    else
    {
      [v3 setImageData:0];
    }
    [*(id *)(a1 + 48) setContact:*(void *)(a1 + 40)];

    id WeakRetained = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarManager, 0);

  objc_storeStrong((id *)&self->_sampleView, 0);
}

@end