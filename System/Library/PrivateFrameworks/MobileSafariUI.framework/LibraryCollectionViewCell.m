@interface LibraryCollectionViewCell
- (SFTabIconRegistration)tabIconRegistration;
- (void)_applyTabIcon:(id)a3;
- (void)_applyTabIcon:(id)a3 toConfiguration:(id)a4;
- (void)_updateAccessories:(id)a3;
- (void)prepareForReuse;
- (void)setAccessories:(id)a3;
- (void)setTabIconRegistration:(id)a3;
- (void)updateConfigurationForTabIconRegistration:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation LibraryCollectionViewCell

- (void)setAccessories:(id)a3
{
  id v4 = a3;
  [(LibraryCollectionViewCell *)self _updateAccessories:v4];
  v5.receiver = self;
  v5.super_class = (Class)LibraryCollectionViewCell;
  [(LibraryCollectionViewCell *)&v5 setAccessories:v4];
}

- (void)updateConfigurationUsingState:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LibraryCollectionViewCell;
  [(LibraryCollectionViewCell *)&v5 updateConfigurationUsingState:a3];
  id v4 = [(LibraryCollectionViewCell *)self accessories];
  [(LibraryCollectionViewCell *)self _updateAccessories:v4];
}

- (void)_updateAccessories:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          v11 = [(LibraryCollectionViewCell *)self contentConfiguration];
          v12 = [(LibraryCollectionViewCell *)self configurationState];
          [v10 applyContentConfiguration:v11 forState:v12];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_applyTabIcon:(id)a3
{
  id v5 = a3;
  id v4 = [(LibraryCollectionViewCell *)self contentConfiguration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(LibraryCollectionViewCell *)self _applyTabIcon:v5 toConfiguration:v4];
    [(LibraryCollectionViewCell *)self setContentConfiguration:v4];
  }
}

- (void)_applyTabIcon:(id)a3 toConfiguration:(id)a4
{
  if (a3)
  {
    id v7 = a4;
    [v7 setImage:a3];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4FB1818];
    id v6 = a4;
    id v7 = [v5 systemImageNamed:@"globe"];
    objc_msgSend(v6, "setImage:");
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)LibraryCollectionViewCell;
  [(LibraryCollectionViewCell *)&v4 prepareForReuse];
  tabIconRegistration = self->_tabIconRegistration;
  self->_tabIconRegistration = 0;
}

- (void)setTabIconRegistration:(id)a3
{
  id v5 = (SFTabIconRegistration *)a3;
  id v6 = self->_tabIconRegistration;
  if (v6 != v5)
  {
    objc_storeStrong((id *)&self->_tabIconRegistration, a3);
    [(SFTabIconRegistration *)v6 setContentObserver:&__block_literal_global_22];
    objc_initWeak(&location, self);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __52__LibraryCollectionViewCell_setTabIconRegistration___block_invoke_2;
    v11 = &unk_1E6D7AE78;
    objc_copyWeak(&v12, &location);
    [(SFTabIconRegistration *)v5 setContentObserver:&v8];
    if (v5)
    {
      id v7 = [(SFTabIconRegistration *)v5 content];
      [(LibraryCollectionViewCell *)self _applyTabIcon:v7];
    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __52__LibraryCollectionViewCell_setTabIconRegistration___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _applyTabIcon:v3];
}

- (void)updateConfigurationForTabIconRegistration:(id)a3
{
  tabIconRegistration = self->_tabIconRegistration;
  if (tabIconRegistration)
  {
    id v5 = a3;
    id v6 = [(SFTabIconRegistration *)tabIconRegistration content];
    [(LibraryCollectionViewCell *)self _applyTabIcon:v6 toConfiguration:v5];
  }
}

- (SFTabIconRegistration)tabIconRegistration
{
  return self->_tabIconRegistration;
}

- (void).cxx_destruct
{
}

@end