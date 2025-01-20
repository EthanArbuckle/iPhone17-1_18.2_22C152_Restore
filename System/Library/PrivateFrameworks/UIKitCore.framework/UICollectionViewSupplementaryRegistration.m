@interface UICollectionViewSupplementaryRegistration
+ (UICollectionViewSupplementaryRegistration)registrationWithSupplementaryClass:(Class)supplementaryClass elementKind:(NSString *)elementKind configurationHandler:(UICollectionViewSupplementaryRegistrationConfigurationHandler)configurationHandler;
+ (UICollectionViewSupplementaryRegistration)registrationWithSupplementaryNib:(UINib *)supplementaryNib elementKind:(NSString *)elementKind configurationHandler:(UICollectionViewSupplementaryRegistrationConfigurationHandler)configurationHandler;
- (BOOL)hasSupplementaryClass;
- (BOOL)hasSupplementaryNib;
- (Class)supplementaryClass;
- (NSString)elementKind;
- (NSString)reuseIdentifier;
- (UICollectionView)_collectionViewRequestingViewWhenCreated;
- (UICollectionViewSupplementaryRegistration)initWithSupplementaryClass:(Class)a3 supplementaryNib:(id)a4 elementKind:(id)a5 configurationHandler:(id)a6 reuseIdentifier:(id)a7;
- (UICollectionViewSupplementaryRegistrationConfigurationHandler)configurationHandler;
- (UINib)supplementaryNib;
@end

@implementation UICollectionViewSupplementaryRegistration

+ (UICollectionViewSupplementaryRegistration)registrationWithSupplementaryClass:(Class)supplementaryClass elementKind:(NSString *)elementKind configurationHandler:(UICollectionViewSupplementaryRegistrationConfigurationHandler)configurationHandler
{
  UICollectionViewSupplementaryRegistrationConfigurationHandler v7 = configurationHandler;
  v8 = elementKind;
  id v9 = objc_alloc((Class)objc_opt_class());
  v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [v10 UUIDString];
  v12 = (void *)[v9 initWithSupplementaryClass:supplementaryClass supplementaryNib:0 elementKind:v8 configurationHandler:v7 reuseIdentifier:v11];

  return (UICollectionViewSupplementaryRegistration *)v12;
}

- (UICollectionViewSupplementaryRegistration)initWithSupplementaryClass:(Class)a3 supplementaryNib:(id)a4 elementKind:(id)a5 configurationHandler:(id)a6 reuseIdentifier:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)UICollectionViewSupplementaryRegistration;
  v17 = [(UICollectionViewSupplementaryRegistration *)&v22 init];
  if (v17)
  {
    v18 = _UICollectionViewRequestingCellOrSupplementaryView();
    objc_storeWeak((id *)&v17->__collectionViewRequestingViewWhenCreated, v18);

    objc_storeStrong((id *)&v17->_supplementaryClass, a3);
    objc_storeStrong((id *)&v17->_supplementaryNib, a4);
    objc_storeStrong((id *)&v17->_elementKind, a5);
    v19 = _Block_copy(v15);
    id configurationHandler = v17->_configurationHandler;
    v17->_id configurationHandler = v19;

    objc_storeStrong((id *)&v17->_reuseIdentifier, a7);
  }

  return v17;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (BOOL)hasSupplementaryNib
{
  return self->_supplementaryNib != 0;
}

- (BOOL)hasSupplementaryClass
{
  return self->_supplementaryClass != 0;
}

- (NSString)elementKind
{
  return self->_elementKind;
}

- (UICollectionViewSupplementaryRegistrationConfigurationHandler)configurationHandler
{
  return self->_configurationHandler;
}

- (UICollectionView)_collectionViewRequestingViewWhenCreated
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__collectionViewRequestingViewWhenCreated);
  return (UICollectionView *)WeakRetained;
}

- (Class)supplementaryClass
{
  return self->_supplementaryClass;
}

+ (UICollectionViewSupplementaryRegistration)registrationWithSupplementaryNib:(UINib *)supplementaryNib elementKind:(NSString *)elementKind configurationHandler:(UICollectionViewSupplementaryRegistrationConfigurationHandler)configurationHandler
{
  UICollectionViewSupplementaryRegistrationConfigurationHandler v7 = configurationHandler;
  v8 = elementKind;
  id v9 = supplementaryNib;
  id v10 = objc_alloc((Class)objc_opt_class());
  v11 = [MEMORY[0x1E4F29128] UUID];
  v12 = [v11 UUIDString];
  id v13 = (void *)[v10 initWithSupplementaryClass:0 supplementaryNib:v9 elementKind:v8 configurationHandler:v7 reuseIdentifier:v12];

  return (UICollectionViewSupplementaryRegistration *)v13;
}

- (UINib)supplementaryNib
{
  return self->_supplementaryNib;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_destroyWeak((id *)&self->__collectionViewRequestingViewWhenCreated);
  objc_storeStrong(&self->_configurationHandler, 0);
  objc_storeStrong((id *)&self->_elementKind, 0);
  objc_storeStrong((id *)&self->_supplementaryNib, 0);
  objc_storeStrong((id *)&self->_supplementaryClass, 0);
}

@end