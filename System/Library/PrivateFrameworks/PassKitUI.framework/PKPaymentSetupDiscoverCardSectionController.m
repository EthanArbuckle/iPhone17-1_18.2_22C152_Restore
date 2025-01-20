@interface PKPaymentSetupDiscoverCardSectionController
- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4;
- (NSArray)identifiers;
- (PKPaymentSetupDiscoverCardSectionController)init;
- (UICollectionViewCellRegistration)cellRegistration;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)setCellRegistration:(id)a3;
@end

@implementation PKPaymentSetupDiscoverCardSectionController

- (PKPaymentSetupDiscoverCardSectionController)init
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupDiscoverCardSectionController;
  v2 = [(PKPaymentSetupDiscoverCardSectionController *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F29128]);
    v4 = [v3 UUIDString];
    v11[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    identifiers = v2->_identifiers;
    v2->_identifiers = (NSArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4FB1578] registrationWithCellClass:objc_opt_class() configurationHandler:&__block_literal_global_164];
    cellRegistration = v2->_cellRegistration;
    v2->_cellRegistration = (UICollectionViewCellRegistration *)v7;
  }
  return v2;
}

void __51__PKPaymentSetupDiscoverCardSectionController_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4FB1618];
  id v3 = a2;
  id v4 = [v2 darkGrayColor];
  [v3 setBackgroundColor:v4];
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v4 appendItems:&unk_1EF2BA110];

  return v4;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 container];
  [v4 contentSize];
  double v6 = v5 + -32.0;

  uint64_t v7 = (void *)MEMORY[0x1E4FB1338];
  v8 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  v9 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  objc_super v10 = [v7 sizeWithWidthDimension:v8 heightDimension:v9];

  v11 = (void *)MEMORY[0x1E4FB1338];
  v12 = [MEMORY[0x1E4FB1308] absoluteDimension:v6];
  v13 = [MEMORY[0x1E4FB1308] absoluteDimension:125.0];
  v14 = [v11 sizeWithWidthDimension:v12 heightDimension:v13];

  v15 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v10];
  v16 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v14 repeatingSubitem:v15 count:1];
  v17 = [MEMORY[0x1E4FB1330] sectionWithGroup:v16];
  objc_msgSend(v17, "setContentInsets:", 10.0, 16.0, 10.0, 16.0);
  [v17 setOrthogonalScrollingBehavior:4];
  [v17 setInterGroupSpacing:10.0];
  v18 = (void *)MEMORY[0x1E4FB1338];
  v19 = [MEMORY[0x1E4FB1308] absoluteDimension:v6];
  v20 = [MEMORY[0x1E4FB1308] absoluteDimension:44.0];
  v21 = [v18 sizeWithWidthDimension:v19 heightDimension:v20];

  v22 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v21 elementKind:*MEMORY[0x1E4FB2770] alignment:2];
  v25[0] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v17 setBoundarySupplementaryItems:v23];

  return v17;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v5 = a3;
  PKLocalizedPaymentString(&cfstr_LearnAboutWall.isa);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setTitle:v6];
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellRegistration, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end