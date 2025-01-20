@interface PKSpendingSummaryAccountUserPresenter
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKSpendingSummaryAccountUserPresenter)initWithTransactionSourceCollection:(id)a3 familyCollection:(id)a4 avatarManager:(id)a5 interimSpacing:(double)a6;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 item:(id)a4;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
@end

@implementation PKSpendingSummaryAccountUserPresenter

- (PKSpendingSummaryAccountUserPresenter)initWithTransactionSourceCollection:(id)a3 familyCollection:(id)a4 avatarManager:(id)a5 interimSpacing:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKSpendingSummaryAccountUserPresenter;
  v14 = [(PKSpendingSummaryAccountUserPresenter *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_transactionSourceCollection, a3);
    objc_storeStrong((id *)&v15->_familyCollection, a4);
    objc_storeStrong((id *)&v15->_avatarManager, a5);
    v15->_interimSpacing = a6;
    v16 = [v11 transactionSourcesForType:2];
    v15->_numUsers = [v16 count];

    v17 = [PKSpendingSummaryAccountUserCell alloc];
    uint64_t v18 = -[PKSpendingSummaryAccountUserCell initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v15->_sampleCell;
    v15->_sampleCell = (PKSpendingSummaryAccountUserCell *)v18;
  }
  return v15;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"spendingAccountUserPresenter";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"spendingAccountUserPresenter" forIndexPath:v8];
  [(PKSpendingSummaryAccountUserPresenter *)self updateCell:v11 forItem:v10 inCollectionView:v9 atIndexPath:v8];

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  uint64_t v8 = [a5 row];
  int64_t numUsers = self->_numUsers;
  unint64_t v10 = v8 + 2;
  if ((unint64_t)(v8 + 2) > 4)
  {
    if (v8 == numUsers / 3) {
      int64_t v11 = -3 * v8 + numUsers;
    }
    else {
      int64_t v11 = 3;
    }
  }
  else if (numUsers >= 3)
  {
    int64_t v11 = 3;
  }
  else
  {
    int64_t v11 = self->_numUsers;
  }
  [v7 frame];
  double v13 = v12;

  double interimSpacing = self->_interimSpacing;
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  BOOL v16 = v11 >= 3 || v10 >= 5;
  double v17 = (double)v11;
  if (v16) {
    double v17 = 3.0;
  }
  double v18 = (v13 - (v15 + v15 + interimSpacing * (double)(v11 - 1))) / v17;
  sampleCell = self->_sampleCell;

  -[PKSpendingSummaryAccountUserCell sizeThatFits:](sampleCell, "sizeThatFits:", v18, 1.79769313e308);
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  if (a3)
  {
    if (a4)
    {
      id v7 = a4;
      uint64_t v8 = [a3 preferredContentSizeCategory];
      id v9 = [v7 preferredContentSizeCategory];

      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
      if (v10)
      {
        int64_t v11 = [PKSpendingSummaryAccountUserCell alloc];
        double v12 = -[PKSpendingSummaryAccountUserCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        sampleCell = self->_sampleCell;
        self->_sampleCell = v12;
      }
    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    id v9 = [v7 accountUser];
    NSComparisonResult v10 = [v8 familyMember];
    int64_t v11 = [v9 altDSID];
    double v12 = [v8 spendingSummary];
    double v13 = [v12 spendingsPerAltDSID];
    v14 = [v13 objectForKey:v11];

    if ([v9 isCurrentUser])
    {
      double v15 = PKLocalizedMadisonString(&cfstr_AccountUserNam.isa);
      [v6 setName:v15];
    }
    else
    {
      BOOL v16 = (void *)MEMORY[0x1E4F845E8];
      double v17 = [v9 nameComponents];
      double v15 = [v16 contactForFamilyMember:v10 nameComponents:v17 imageData:0];

      double v18 = [v15 givenName];
      [v6 setName:v18];
    }
    v19 = [v14 totalSpending];
    double v20 = [v19 formattedStringValue];
    [v6 setAmount:v20];

    [v6 setMaskType:3];
    [v6 setWantsCustomAppearance:0];
    [v6 setWantsDefaultHighlightBehavior:1];
    avatarManager = self->_avatarManager;
    v22 = [v9 altDSID];
    v23 = [(PKContactAvatarManager *)avatarManager cachedAvatarForAltDSID:v22];

    [v6 setAvatar:v23];
    v24 = [v6 identifier];
    if (!v23)
    {
      v28 = v11;
      objc_initWeak(&location, self);
      v25 = v10;
      v26 = self->_avatarManager;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __61__PKSpendingSummaryAccountUserPresenter__configureCell_item___block_invoke;
      v29[3] = &unk_1E59D6D48;
      objc_copyWeak(&v32, &location);
      id v30 = v6;
      id v31 = v24;
      v27 = v26;
      NSComparisonResult v10 = v25;
      [(PKContactAvatarManager *)v27 avatarForFamilyMember:v25 accountUser:v9 invitation:0 completion:v29];

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
      int64_t v11 = v28;
    }
  }
}

void __61__PKSpendingSummaryAccountUserPresenter__configureCell_item___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __61__PKSpendingSummaryAccountUserPresenter__configureCell_item___block_invoke_2;
  v5[3] = &unk_1E59CE888;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __61__PKSpendingSummaryAccountUserPresenter__configureCell_item___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) identifier];
    id v4 = *(void **)(a1 + 40);
    id v5 = v3;
    id v6 = v4;
    if (v5 == v6)
    {

      goto LABEL_11;
    }
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {

LABEL_12:
      id WeakRetained = v10;
      goto LABEL_13;
    }
    int v9 = [v5 isEqualToString:v6];

    id WeakRetained = v10;
    if (v9)
    {
LABEL_11:
      [*(id *)(a1 + 32) setAvatar:*(void *)(a1 + 48)];
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCell, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);

  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end