@interface SectionHeaderBasicOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (NSArray)accessoryModels;
- (NSString)title;
- (SectionHeaderBasicOutlineCellModel)initWithTitle:(id)a3;
- (UICollectionViewCellRegistration)cellRegistration;
- (unint64_t)hash;
- (void)_addAccessoryModels:(id)a3;
@end

@implementation SectionHeaderBasicOutlineCellModel

- (void)_addAccessoryModels:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_accessoryModels)
  {
    [v4 arrayByAddingObjectsFromArray:];
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (NSArray *)v4;
  }
  accessoryModels = self->_accessoryModels;
  self->_accessoryModels = v5;
}

- (SectionHeaderBasicOutlineCellModel)initWithTitle:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SectionHeaderBasicOutlineCellModel;
  v5 = [(SectionHeaderBasicOutlineCellModel *)&v11 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    title = v5->_title;
    v5->_title = v6;

    v8 = [[SectionHeaderOutlineCellAccessoryModel alloc] initWithAccessoryType:1 visibility:1 delegate:0];
    v12 = v8;
    v9 = +[NSArray arrayWithObjects:&v12 count:1];
    [(SectionHeaderBasicOutlineCellModel *)v5 _addAccessoryModels:v9];
  }
  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_title hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SectionHeaderBasicOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = [(SectionHeaderBasicOutlineCellModel *)v6 title];
    v8 = v7;
    if (v7 == self->_title || -[NSString isEqual:](v7, "isEqual:"))
    {
      v9 = [(SectionHeaderBasicOutlineCellModel *)v6 accessoryModels];
      v10 = v9;
      if (v9 == self->_accessoryModels) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = -[NSArray isEqual:](v9, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[SectionHeaderOutlineCellRegistration sharedRegistration];
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return ![(SectionHeaderBasicOutlineCellModel *)self isEqual:a3];
}

- (NSArray)accessoryModels
{
  return self->_accessoryModels;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_accessoryModels, 0);
}

@end