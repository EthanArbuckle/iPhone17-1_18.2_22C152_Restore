@interface NSDiffableDataSourceSectionTransaction
- (BOOL)isEqual:(id)a3;
- (NSDiffableDataSourceSectionSnapshot)finalSnapshot;
- (NSDiffableDataSourceSectionSnapshot)initialSnapshot;
- (NSDiffableDataSourceSectionTransaction)initWithSectionIdentifier:(id)a3 initialSnapshot:(id)a4 finalSnapshot:(id)a5 difference:(id)a6;
- (NSOrderedCollectionDifference)difference;
- (id)_spiCopy;
- (id)description;
- (id)sectionIdentifier;
@end

@implementation NSDiffableDataSourceSectionTransaction

- (id)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSDiffableDataSourceSectionSnapshot)finalSnapshot
{
  return self->_finalSnapshot;
}

- (NSDiffableDataSourceSectionTransaction)initWithSectionIdentifier:(id)a3 initialSnapshot:(id)a4 finalSnapshot:(id)a5 difference:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NSDiffableDataSourceSectionTransaction;
  v15 = [(NSDiffableDataSourceSectionTransaction *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong(&v15->_sectionIdentifier, a3);
    objc_storeStrong((id *)&v16->_initialSnapshot, a4);
    objc_storeStrong((id *)&v16->_finalSnapshot, a5);
    objc_storeStrong((id *)&v16->_difference, a6);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_difference, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
  objc_storeStrong(&self->_sectionIdentifier, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p - sectionIdentifier=%@; initialSnapshot=%p; finalSnapshot=%p; difference=%@>",
    v5,
    self,
    self->_sectionIdentifier,
    self->_initialSnapshot,
    self->_finalSnapshot,
  v6 = self->_difference);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSDiffableDataSourceSectionTransaction *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      char v18 = 1;
    }
    else
    {
      v6 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_9;
      }
      v7 = [(NSDiffableDataSourceSectionTransaction *)v6 sectionIdentifier];
      v8 = [(NSDiffableDataSourceSectionTransaction *)self sectionIdentifier];
      int v9 = [v7 isEqual:v8];

      if (!v9) {
        goto LABEL_9;
      }
      v10 = [(NSDiffableDataSourceSectionTransaction *)v6 difference];
      id v11 = [(NSDiffableDataSourceSectionTransaction *)self difference];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_9;
      }
      id v13 = [(NSDiffableDataSourceSectionTransaction *)v6 initialSnapshot];
      id v14 = [(NSDiffableDataSourceSectionTransaction *)self initialSnapshot];
      int v15 = [v13 isEqual:v14];

      if (v15)
      {
        v16 = [(NSDiffableDataSourceSectionTransaction *)v6 finalSnapshot];
        v17 = [(NSDiffableDataSourceSectionTransaction *)self finalSnapshot];
        char v18 = [v16 isEqual:v17];
      }
      else
      {
LABEL_9:
        char v18 = 0;
      }
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (id)_spiCopy
{
  v3 = [_UIDiffableDataSourceSectionTransaction alloc];
  v4 = [(NSDiffableDataSourceSectionTransaction *)self sectionIdentifier];
  v5 = [(NSDiffableDataSourceSectionTransaction *)self initialSnapshot];
  v6 = [(NSDiffableDataSourceSectionTransaction *)self finalSnapshot];
  v7 = [(NSDiffableDataSourceSectionTransaction *)self difference];
  v8 = [(_UIDiffableDataSourceSectionTransaction *)v3 initWithSectionIdentifier:v4 initialSnapshot:v5 finalSnapshot:v6 difference:v7];

  return v8;
}

- (NSDiffableDataSourceSectionSnapshot)initialSnapshot
{
  return self->_initialSnapshot;
}

- (NSOrderedCollectionDifference)difference
{
  return self->_difference;
}

@end