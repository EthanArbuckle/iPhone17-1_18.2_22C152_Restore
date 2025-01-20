@interface HomeSearchStatusOutlineCellModel
- (BOOL)enableStructuredRAPAffordance;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (HomeSearchStatusOutlineCellModel)initWithErrorString:(id)a3 enableStructuredRAPAffordance:(BOOL)a4 delegate:(id)a5;
- (HomeSearchStatusOutlineCellModelDelegate)delegate;
- (NSString)errorString;
- (UICollectionViewCellRegistration)cellRegistration;
- (id)_maps_diffableDataSourceIdentifier;
- (unint64_t)hash;
@end

@implementation HomeSearchStatusOutlineCellModel

- (HomeSearchStatusOutlineCellModel)initWithErrorString:(id)a3 enableStructuredRAPAffordance:(BOOL)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HomeSearchStatusOutlineCellModel;
  v11 = [(HomeSearchStatusOutlineCellModel *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_errorString, a3);
    v12->_enableStructuredRAPAffordance = a4;
    objc_storeStrong((id *)&v12->_delegate, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  return [(NSString *)self->_errorString hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HomeSearchStatusOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(HomeSearchStatusOutlineCellModel *)v5 errorString];
    v7 = v6;
    if (v6 == self->_errorString) {
      unsigned __int8 v8 = 1;
    }
    else {
      unsigned __int8 v8 = -[NSString isEqual:](v6, "isEqual:");
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)_maps_diffableDataSourceIdentifier
{
  return @"SearchStatusIdentifier";
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[HomeSearchStatusOutlineCellRegistration sharedRegistration];
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return ![(HomeSearchStatusOutlineCellModel *)self isEqual:a3];
}

- (NSString)errorString
{
  return self->_errorString;
}

- (BOOL)enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (HomeSearchStatusOutlineCellModelDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_errorString, 0);
}

@end