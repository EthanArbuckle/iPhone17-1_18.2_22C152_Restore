@interface VenueDropDownOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (GEOSearchCategory)selectedCategory;
- (GEOVenueIdentifier)venueIdentifier;
- (NSArray)categories;
- (NSString)buttonTitle;
- (UICollectionViewCellRegistration)cellRegistration;
- (VenueDropDownOutlineCellDelegate)delegate;
- (VenueDropDownOutlineCellModel)initWithButtonTitle:(id)a3 categories:(id)a4 selectedCategory:(id)a5 venueIdentifier:(id)a6 delegate:(id)a7;
- (unint64_t)hash;
@end

@implementation VenueDropDownOutlineCellModel

- (VenueDropDownOutlineCellModel)initWithButtonTitle:(id)a3 categories:(id)a4 selectedCategory:(id)a5 venueIdentifier:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)VenueDropDownOutlineCellModel;
  v17 = [(VenueDropDownOutlineCellModel *)&v23 init];
  if (v17)
  {
    v18 = (NSString *)[v12 copy];
    buttonTitle = v17->_buttonTitle;
    v17->_buttonTitle = v18;

    v20 = (NSArray *)[v13 copy];
    categories = v17->_categories;
    v17->_categories = v20;

    objc_storeStrong((id *)&v17->_venueIdentifier, a6);
    objc_storeStrong((id *)&v17->_selectedCategory, a5);
    objc_storeWeak((id *)&v17->_delegate, v16);
  }

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_buttonTitle hash];
  unint64_t v4 = (unint64_t)[(NSArray *)self->_categories hash] ^ v3;
  return v4 ^ (unint64_t)[(GEOSearchCategory *)self->_selectedCategory hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (VenueDropDownOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v15 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(VenueDropDownOutlineCellModel *)v6 buttonTitle];
    v8 = v7;
    if (v7 == self->_buttonTitle || -[NSString isEqual:](v7, "isEqual:"))
    {
      v9 = [(VenueDropDownOutlineCellModel *)v6 categories];
      v10 = v9;
      if (v9 == self->_categories || -[NSArray isEqual:](v9, "isEqual:"))
      {
        v11 = [(VenueDropDownOutlineCellModel *)v6 selectedCategory];
        id v12 = v11;
        if (v11 == self->_selectedCategory || -[GEOSearchCategory isEqual:](v11, "isEqual:"))
        {
          id v13 = [(VenueDropDownOutlineCellModel *)v6 delegate];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          if (v13 == WeakRetained) {
            unsigned __int8 v15 = 1;
          }
          else {
            unsigned __int8 v15 = [v13 isEqual:WeakRetained];
          }
        }
        else
        {
          unsigned __int8 v15 = 0;
        }
      }
      else
      {
        unsigned __int8 v15 = 0;
      }
    }
    else
    {
      unsigned __int8 v15 = 0;
    }
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[VenueDropDownOutlineCellRegistration sharedRegistration];
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return ![(VenueDropDownOutlineCellModel *)self isEqual:a3];
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (VenueDropDownOutlineCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VenueDropDownOutlineCellDelegate *)WeakRetained;
}

- (GEOVenueIdentifier)venueIdentifier
{
  return self->_venueIdentifier;
}

- (NSArray)categories
{
  return self->_categories;
}

- (GEOSearchCategory)selectedCategory
{
  return self->_selectedCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_selectedCategory, 0);

  objc_storeStrong((id *)&self->_categories, 0);
}

@end