@interface PXActivityCoordinatorRecord
- (BOOL)isEqual:(id)a3;
- (PXActivityCoordinatorItem)item;
- (PXActivityCoordinatorRecord)initWithItem:(id)a3;
- (unint64_t)hash;
- (void)setItem:(id)a3;
@end

@implementation PXActivityCoordinatorRecord

- (void).cxx_destruct
{
}

- (void)setItem:(id)a3
{
}

- (PXActivityCoordinatorItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (PXActivityCoordinatorItem *)WeakRetained;
}

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  unint64_t v3 = [WeakRetained hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 item];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    BOOL v7 = v5 == WeakRetained;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (PXActivityCoordinatorRecord)initWithItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXActivityCoordinatorRecord;
  id v5 = [(PXActivityCoordinatorRecord *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_item, v4);
  }

  return v6;
}

@end