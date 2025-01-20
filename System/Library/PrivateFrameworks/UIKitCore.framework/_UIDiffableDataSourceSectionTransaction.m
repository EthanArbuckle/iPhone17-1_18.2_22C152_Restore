@interface _UIDiffableDataSourceSectionTransaction
- (BOOL)isEqual:(id)a3;
- (NSDiffableDataSourceSectionSnapshot)finalSnapshot;
- (NSDiffableDataSourceSectionSnapshot)initialSnapshot;
- (NSOrderedCollectionDifference)difference;
- (_UIDiffableDataSourceSectionTransaction)initWithSectionIdentifier:(id)a3 initialSnapshot:(id)a4 finalSnapshot:(id)a5 difference:(id)a6;
- (id)description;
- (id)sectionIdentifier;
@end

@implementation _UIDiffableDataSourceSectionTransaction

- (_UIDiffableDataSourceSectionTransaction)initWithSectionIdentifier:(id)a3 initialSnapshot:(id)a4 finalSnapshot:(id)a5 difference:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_UIDiffableDataSourceSectionTransaction;
  v15 = [(_UIDiffableDataSourceSectionTransaction *)&v18 init];
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
  v4 = (_UIDiffableDataSourceSectionTransaction *)a3;
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
      v7 = [(_UIDiffableDataSourceSectionTransaction *)v6 sectionIdentifier];
      v8 = [(_UIDiffableDataSourceSectionTransaction *)self sectionIdentifier];
      int v9 = [v7 isEqual:v8];

      if (!v9) {
        goto LABEL_9;
      }
      v10 = [(_UIDiffableDataSourceSectionTransaction *)v6 difference];
      id v11 = [(_UIDiffableDataSourceSectionTransaction *)self difference];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_9;
      }
      id v13 = [(_UIDiffableDataSourceSectionTransaction *)v6 initialSnapshot];
      id v14 = [(_UIDiffableDataSourceSectionTransaction *)self initialSnapshot];
      int v15 = [v13 isEqual:v14];

      if (v15)
      {
        v16 = [(_UIDiffableDataSourceSectionTransaction *)v6 finalSnapshot];
        v17 = [(_UIDiffableDataSourceSectionTransaction *)self finalSnapshot];
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

- (id)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSDiffableDataSourceSectionSnapshot)initialSnapshot
{
  return self->_initialSnapshot;
}

- (NSDiffableDataSourceSectionSnapshot)finalSnapshot
{
  return self->_finalSnapshot;
}

- (NSOrderedCollectionDifference)difference
{
  return self->_difference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_difference, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
  objc_storeStrong(&self->_sectionIdentifier, 0);
}

@end