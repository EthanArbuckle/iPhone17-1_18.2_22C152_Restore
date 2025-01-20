@interface UICollectionViewCellRegistration
+ (UICollectionViewCellRegistration)registrationWithCellClass:(Class)cellClass configurationHandler:(UICollectionViewCellRegistrationConfigurationHandler)configurationHandler;
+ (UICollectionViewCellRegistration)registrationWithCellNib:(UINib *)cellNib configurationHandler:(UICollectionViewCellRegistrationConfigurationHandler)configurationHandler;
- (BOOL)hasCellClass;
- (BOOL)hasCellNib;
- (Class)cellClass;
- (NSString)reuseIdentifier;
- (UICollectionView)_collectionViewRequestingViewWhenCreated;
- (UICollectionViewCellRegistration)initWithCellClass:(Class)a3 cellNib:(id)a4 configurationHandler:(id)a5 reuseIdentifier:(id)a6;
- (UICollectionViewCellRegistrationConfigurationHandler)configurationHandler;
- (UINib)cellNib;
@end

@implementation UICollectionViewCellRegistration

+ (UICollectionViewCellRegistration)registrationWithCellNib:(UINib *)cellNib configurationHandler:(UICollectionViewCellRegistrationConfigurationHandler)configurationHandler
{
  UICollectionViewCellRegistrationConfigurationHandler v5 = configurationHandler;
  v6 = cellNib;
  id v7 = objc_alloc((Class)objc_opt_class());
  v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v8 UUIDString];
  v10 = (void *)[v7 initWithCellClass:0 cellNib:v6 configurationHandler:v5 reuseIdentifier:v9];

  return (UICollectionViewCellRegistration *)v10;
}

+ (UICollectionViewCellRegistration)registrationWithCellClass:(Class)cellClass configurationHandler:(UICollectionViewCellRegistrationConfigurationHandler)configurationHandler
{
  UICollectionViewCellRegistrationConfigurationHandler v5 = configurationHandler;
  id v6 = objc_alloc((Class)objc_opt_class());
  id v7 = [MEMORY[0x1E4F29128] UUID];
  v8 = [v7 UUIDString];
  v9 = (void *)[v6 initWithCellClass:cellClass cellNib:0 configurationHandler:v5 reuseIdentifier:v8];

  return (UICollectionViewCellRegistration *)v9;
}

- (UICollectionViewCellRegistration)initWithCellClass:(Class)a3 cellNib:(id)a4 configurationHandler:(id)a5 reuseIdentifier:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)UICollectionViewCellRegistration;
  v14 = [(UICollectionViewCellRegistration *)&v19 init];
  if (v14)
  {
    v15 = _UICollectionViewRequestingCellOrSupplementaryView();
    objc_storeWeak((id *)&v14->__collectionViewRequestingViewWhenCreated, v15);

    objc_storeStrong((id *)&v14->_cellClass, a3);
    objc_storeStrong((id *)&v14->_cellNib, a4);
    v16 = _Block_copy(v12);
    id configurationHandler = v14->_configurationHandler;
    v14->_id configurationHandler = v16;

    objc_storeStrong((id *)&v14->_reuseIdentifier, a6);
  }

  return v14;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (BOOL)hasCellClass
{
  return self->_cellClass != 0;
}

- (UICollectionViewCellRegistrationConfigurationHandler)configurationHandler
{
  return self->_configurationHandler;
}

- (UICollectionView)_collectionViewRequestingViewWhenCreated
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__collectionViewRequestingViewWhenCreated);
  return (UICollectionView *)WeakRetained;
}

- (Class)cellClass
{
  return self->_cellClass;
}

- (BOOL)hasCellNib
{
  return self->_cellNib != 0;
}

- (UINib)cellNib
{
  return self->_cellNib;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_destroyWeak((id *)&self->__collectionViewRequestingViewWhenCreated);
  objc_storeStrong(&self->_configurationHandler, 0);
  objc_storeStrong((id *)&self->_cellNib, 0);
  objc_storeStrong((id *)&self->_cellClass, 0);
}

@end