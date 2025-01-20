@interface SectionHeaderOutlineCell
- (SectionHeaderOutlineCellModel)cellModel;
- (void)_accessoryButtonTapped:(id)a3;
- (void)_updateAccessoryConfigurations;
- (void)_updateFromModel:(BOOL)a3;
- (void)setCellModel:(id)a3;
- (void)setHovering:(BOOL)a3;
@end

@implementation SectionHeaderOutlineCell

- (void)setCellModel:(id)a3
{
  v10 = (SectionHeaderOutlineCellModel *)a3;
  v5 = [(SectionHeaderOutlineCellModel *)v10 accessoryModels];
  v6 = [(SectionHeaderOutlineCellModel *)self->_cellModel accessoryModels];
  if (v5 == v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = [v5 isEqual:v6] ^ 1;
  }

  v8 = v10;
  if (self->_cellModel != v10)
  {
    unsigned __int8 v9 = -[SectionHeaderOutlineCellModel isEqual:](v10, "isEqual:");
    v8 = v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      [(SectionHeaderOutlineCell *)self _updateFromModel:v7];
      v8 = v10;
    }
  }
}

- (void)_updateFromModel:(BOOL)a3
{
  BOOL v3 = a3;
  id v13 = +[UIListContentConfiguration sidebarHeaderConfiguration];
  [v13 directionalLayoutMargins];
  double v6 = v5;
  [v13 directionalLayoutMargins];
  [v13 setDirectionalLayoutMargins:v6];
  uint64_t v7 = [(SectionHeaderOutlineCellModel *)self->_cellModel title];
  [v13 setText:v7];

  [(SectionHeaderOutlineCell *)self setContentConfiguration:v13];
  v8 = [(SidebarOutlineCell *)self axSectionIdentifier];
  if ([v8 length])
  {
    unsigned __int8 v9 = [(SidebarOutlineCell *)self axSectionIdentifier];
  }
  else
  {
    unsigned __int8 v9 = &stru_101324E70;
  }

  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [(__CFString *)v9 stringByAppendingString:v11];
  [(SectionHeaderOutlineCell *)self setAccessibilityIdentifier:v12];

  if (v3) {
    [(SectionHeaderOutlineCell *)self _updateAccessoryConfigurations];
  }
}

- (void)setHovering:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SectionHeaderOutlineCell;
  [(SidebarOutlineCell *)&v4 setHovering:a3];
  [(SectionHeaderOutlineCell *)self _updateAccessoryConfigurations];
}

- (void)_updateAccessoryConfigurations
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v4 = [(SectionHeaderOutlineCellModel *)self->_cellModel accessoryModels];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [v8 visibility];
        if (!v9 || v9 == (id)1 && [(SidebarOutlineCell *)self isHovering])
        {
          id v10 = [v8 accessoryType];
          if (v10 == (id)2)
          {
            objc_initWeak(&location, self);
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = sub_100ACCA58;
            v12[3] = &unk_1012E6690;
            objc_copyWeak(&v13, &location);
            v12[4] = v8;
            v11 = [v8 createAccessoryConfigurationWithActionHandler:v12];
            objc_destroyWeak(&v13);
            objc_destroyWeak(&location);
          }
          else
          {
            if (v10 != (id)1) {
              continue;
            }
            v11 = [v8 createAccessoryConfigurationWithActionHandler:0];
          }
          if (v11)
          {
            [v3 addObject:v11];
          }
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  [(SectionHeaderOutlineCell *)self setTrailingAccessoryConfigurations:v3];
}

- (void)_accessoryButtonTapped:(id)a3
{
  id v4 = a3;
  id v6 = [v4 delegate];
  id v5 = [v4 accessoryType];

  [v6 sectionHeaderOutlineCell:self accessoryTypeTapped:v5];
}

- (SectionHeaderOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
}

@end