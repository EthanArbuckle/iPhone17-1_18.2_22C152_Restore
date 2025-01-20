@interface PXPeopleDetailSettingsFaceCropController
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PXPeopleDetailSettingsFaceCropController)init;
- (PXPeopleDetailSettingsFaceCropDataSource)dataSource;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXPeopleDetailSettingsFaceCropController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setDataSource:(id)a3
{
}

- (PXPeopleDetailSettingsFaceCropDataSource)dataSource
{
  return self->_dataSource;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 10.0;
  double v6 = 0.0;
  double v7 = 10.0;
  double v8 = 2.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  [a3 bounds];
  double v6 = v5;
  double v7 = 10.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  [a3 bounds];
  double v6 = v5;
  double v7 = 10.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5 = 110.0;
  double v6 = 110.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"faceCropCellIdentifier" forIndexPath:v6];
  objc_msgSend(v7, "setTag:", objc_msgSend(v7, "tag") + 1);
  double v8 = [(PXPeopleDetailSettingsFaceCropController *)self dataSource];
  v9 = [v8 nameAtIndexPath:v6];

  v10 = [(PXPeopleDetailSettingsFaceCropController *)self dataSource];
  v11 = [v10 imageAtIndexPath:v6];

  [v7 setImage:v11];
  v12 = [v7 avatarView];
  [v12 setAlpha:1.0];
  [v12 setHighlighted:0];
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v16[0] = *MEMORY[0x1E4F1DAB8];
  v16[1] = v13;
  v16[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v12 setTransform:v16];
  v14 = [v7 quantityLabel];
  [v14 removeFromSuperview];

  [v7 setName:v9];
  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = [(PXPeopleDetailSettingsFaceCropController *)self dataSource];
  int64_t v5 = [v4 numberOfAssets];

  return v5;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleDetailSettingsFaceCropController;
  [(PXPeopleDetailSettingsFaceCropController *)&v15 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v3 setMinimumInteritemSpacing:2.0];
  [v3 setMinimumLineSpacing:2.0];
  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  int64_t v5 = [(PXPeopleDetailSettingsFaceCropController *)self view];
  [v5 frame];
  id v6 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  [(PXPeopleDetailSettingsFaceCropController *)self setCollectionView:v6];

  double v7 = [(PXPeopleDetailSettingsFaceCropController *)self collectionView];
  [v7 setAutoresizingMask:18];

  double v8 = [(PXPeopleDetailSettingsFaceCropController *)self collectionView];
  [v8 setDataSource:self];

  v9 = [(PXPeopleDetailSettingsFaceCropController *)self collectionView];
  [v9 setDelegate:self];

  v10 = [(PXPeopleDetailSettingsFaceCropController *)self collectionView];
  [v10 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"faceCropCellIdentifier"];

  v11 = [(PXPeopleDetailSettingsFaceCropController *)self collectionView];
  v12 = [MEMORY[0x1E4FB1618] whiteColor];
  [v11 setBackgroundColor:v12];

  long long v13 = [(PXPeopleDetailSettingsFaceCropController *)self view];
  v14 = [(PXPeopleDetailSettingsFaceCropController *)self collectionView];
  [v13 addSubview:v14];
}

- (PXPeopleDetailSettingsFaceCropController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXPeopleDetailSettingsFaceCropController;
  v2 = [(PXPeopleDetailSettingsFaceCropController *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(PXPeopleDetailSettingsFaceCropDataSource);
    dataSource = v2->_dataSource;
    v2->_dataSource = v3;
  }
  return v2;
}

@end