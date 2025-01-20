@interface _UIKeyShortcutHUDIndexPath
+ (id)hudIndexPathWithClient:(id)a3 indexPath:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSIndexPath)indexPath;
- (_UIKeyShortcutHUDCollectionViewManagerClient)client;
- (unint64_t)hash;
- (void)setClient:(id)a3;
- (void)setIndexPath:(id)a3;
@end

@implementation _UIKeyShortcutHUDIndexPath

+ (id)hudIndexPathWithClient:(id)a3 indexPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setClient:v6];

  [v7 setIndexPath:v5];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIKeyShortcutHUDIndexPath *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      v8 = [(_UIKeyShortcutHUDIndexPath *)self client];
      v9 = [(_UIKeyShortcutHUDIndexPath *)v7 client];
      if (v8 == v9)
      {
        v11 = [(_UIKeyShortcutHUDIndexPath *)self indexPath];
        v12 = [(_UIKeyShortcutHUDIndexPath *)v7 indexPath];
        char v10 = [v11 isEqual:v12];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  uint64_t v4 = [WeakRetained hash];
  unint64_t v5 = [(NSIndexPath *)self->_indexPath hash] ^ v4;

  return v5;
}

- (_UIKeyShortcutHUDCollectionViewManagerClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (_UIKeyShortcutHUDCollectionViewManagerClient *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_destroyWeak((id *)&self->_client);
}

@end