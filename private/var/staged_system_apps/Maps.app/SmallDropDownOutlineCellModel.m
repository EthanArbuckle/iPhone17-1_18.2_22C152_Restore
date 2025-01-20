@interface SmallDropDownOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (NSArray)dropDownTitles;
- (NSString)buttonTitle;
- (SidebarOutlineCellBackgroundModel)backgroundModel;
- (SmallDropDownOutlineCellDelegate)delegate;
- (SmallDropDownOutlineCellModel)initWithButtonTitle:(id)a3 dropDownTitles:(id)a4 selectedIndex:(int64_t)a5 delegate:(id)a6 backgroundModel:(id)a7;
- (UICollectionViewCellRegistration)cellRegistration;
- (int64_t)selectedIndex;
- (unint64_t)hash;
@end

@implementation SmallDropDownOutlineCellModel

- (SmallDropDownOutlineCellModel)initWithButtonTitle:(id)a3 dropDownTitles:(id)a4 selectedIndex:(int64_t)a5 delegate:(id)a6 backgroundModel:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SmallDropDownOutlineCellModel;
  v16 = [(SmallDropDownOutlineCellModel *)&v22 init];
  if (v16)
  {
    v17 = (NSString *)[v12 copy];
    buttonTitle = v16->_buttonTitle;
    v16->_buttonTitle = v17;

    v19 = (NSArray *)[v13 copy];
    dropDownTitles = v16->_dropDownTitles;
    v16->_dropDownTitles = v19;

    v16->_selectedIndex = a5;
    objc_storeWeak((id *)&v16->_delegate, v14);
    objc_storeStrong((id *)&v16->_backgroundModel, a7);
  }

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_buttonTitle hash];
  return (unint64_t)[(NSArray *)self->_dropDownTitles hash] ^ v3 ^ self->_selectedIndex;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SmallDropDownOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v15 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(SmallDropDownOutlineCellModel *)v6 buttonTitle];
    v8 = v7;
    if (v7 == self->_buttonTitle || -[NSString isEqual:](v7, "isEqual:"))
    {
      v9 = [(SmallDropDownOutlineCellModel *)v6 dropDownTitles];
      v10 = v9;
      if ((v9 == self->_dropDownTitles || -[NSArray isEqual:](v9, "isEqual:"))
        && [(SmallDropDownOutlineCellModel *)v6 selectedIndex] == self->_selectedIndex)
      {
        id v11 = [(SmallDropDownOutlineCellModel *)v6 delegate];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (v11 == WeakRetained || [v11 isEqual:WeakRetained])
        {
          id v13 = [(SmallDropDownOutlineCellModel *)v6 backgroundModel];
          id v14 = v13;
          if (v13 == self->_backgroundModel) {
            unsigned __int8 v15 = 1;
          }
          else {
            unsigned __int8 v15 = -[SidebarOutlineCellBackgroundModel isEqual:](v13, "isEqual:");
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
  return (UICollectionViewCellRegistration *)+[SmallDropDownOutlineCellRegistration sharedRegistration];
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return ![(SmallDropDownOutlineCellModel *)self isEqual:a3];
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSArray)dropDownTitles
{
  return self->_dropDownTitles;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (SmallDropDownOutlineCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SmallDropDownOutlineCellDelegate *)WeakRetained;
}

- (SidebarOutlineCellBackgroundModel)backgroundModel
{
  return self->_backgroundModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dropDownTitles, 0);

  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end