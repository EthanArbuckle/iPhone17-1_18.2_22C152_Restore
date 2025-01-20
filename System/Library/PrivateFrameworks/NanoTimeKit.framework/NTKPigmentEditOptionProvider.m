@interface NTKPigmentEditOptionProvider
- (BOOL)hasAddableCollectionsForSlot:(id)a3;
- (NTKFace)face;
- (NTKPigmentEditOptionProvider)initWithDomain:(id)a3 bundle:(id)a4;
- (NTKPigmentEditOptionProvider)initWithFace:(id)a3;
- (id)availableColorsForSlot:(id)a3;
- (id)defaultColorOptionForSlot:(id)a3;
- (id)fulfilledOptionForOption:(id)a3 slot:(id)a4;
- (id)migratedOptionForInvalidOption:(id)a3 slot:(id)a4;
- (id)optionAtIndex:(unint64_t)a3 slot:(id)a4;
- (uint64_t)bundle;
- (uint64_t)domain;
- (unint64_t)indexOfOption:(id)a3 slot:(id)a4;
- (unint64_t)numberOfOptionsForSlot:(id)a3;
- (void)colorEditOptionStore:(id)a3 didChangeForDomain:(id)a4;
- (void)dealloc;
- (void)setBundle:(uint64_t)a1;
- (void)setDomain:(uint64_t)a1;
- (void)setFace:(id)a3;
- (void)setStore:(uint64_t)a1;
@end

@implementation NTKPigmentEditOptionProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_bundle, 0);

  objc_destroyWeak((id *)&self->_face);
}

- (void)dealloc
{
  [(NTKPigmentEditOptionStore *)self->_store removeListener:self forDomain:self->_domain];
  v3.receiver = self;
  v3.super_class = (Class)NTKPigmentEditOptionProvider;
  [(NTKPigmentEditOptionProvider *)&v3 dealloc];
}

- (NTKPigmentEditOptionProvider)initWithFace:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() pigmentFaceDomain];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [(NTKPigmentEditOptionProvider *)self initWithDomain:v5 bundle:v6];

  if (v7) {
    objc_storeWeak((id *)&v7->_face, v4);
  }

  return v7;
}

- (NTKPigmentEditOptionProvider)initWithDomain:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKPigmentEditOptionProvider;
  v9 = [(NTKPigmentEditOptionProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundle, a4);
    objc_storeStrong((id *)&v10->_domain, a3);
    uint64_t v11 = +[NTKPigmentEditOptionStore sharedInstance];
    store = v10->_store;
    v10->_store = (NTKPigmentEditOptionStore *)v11;

    [(NTKPigmentEditOptionStore *)v10->_store addListener:v10 forDomain:v10->_domain];
  }

  return v10;
}

- (id)defaultColorOptionForSlot:(id)a3
{
  return [(NTKPigmentEditOptionStore *)self->_store defaultColorOptionForDomain:self->_domain bundle:self->_bundle slot:a3];
}

- (unint64_t)numberOfOptionsForSlot:(id)a3
{
  return [(NTKPigmentEditOptionStore *)self->_store numberOfOptionsForDomain:self->_domain bundle:self->_bundle slot:a3];
}

- (unint64_t)indexOfOption:(id)a3 slot:(id)a4
{
  return [(NTKPigmentEditOptionStore *)self->_store indexOfOption:a3 domain:self->_domain bundle:self->_bundle slot:a4];
}

- (id)optionAtIndex:(unint64_t)a3 slot:(id)a4
{
  return [(NTKPigmentEditOptionStore *)self->_store optionAtIndex:a3 domain:self->_domain bundle:self->_bundle slot:a4];
}

- (id)fulfilledOptionForOption:(id)a3 slot:(id)a4
{
  return [(NTKPigmentEditOptionStore *)self->_store fulfilledOptionForOption:a3 domain:self->_domain bundle:self->_bundle slot:a4];
}

- (id)migratedOptionForInvalidOption:(id)a3 slot:(id)a4
{
  return [(NTKPigmentEditOptionStore *)self->_store migratedOptionForInvalidOption:a3 domain:self->_domain bundle:self->_bundle slot:a4];
}

- (id)availableColorsForSlot:(id)a3
{
  return [(NTKPigmentEditOptionStore *)self->_store colorOptionsForDomain:self->_domain bundle:self->_bundle slot:a3];
}

- (BOOL)hasAddableCollectionsForSlot:(id)a3
{
  return [(NTKPigmentEditOptionStore *)self->_store hasAddableCollectionsForDomain:self->_domain bundle:self->_bundle slot:a3];
}

- (void)colorEditOptionStore:(id)a3 didChangeForDomain:(id)a4
{
  if ([a4 isEqualToString:self->_domain])
  {
    v5 = [(NTKPigmentEditOptionProvider *)self face];

    if (v5)
    {
      id v6 = [(NTKPigmentEditOptionProvider *)self face];
      [v6 handleColorEditOptionsChanged];
    }
  }
}

- (NTKFace)face
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_face);

  return (NTKFace *)WeakRetained;
}

- (void)setFace:(id)a3
{
}

- (uint64_t)bundle
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)setBundle:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (uint64_t)domain
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)setDomain:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setStore:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

@end