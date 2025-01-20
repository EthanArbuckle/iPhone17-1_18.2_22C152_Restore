@interface TwoLinesBasicOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (NSArray)accessoryModels;
- (SidebarOutlineCellBackgroundModel)backgroundModel;
- (TwoLinesBasicOutlineCellModel)initWithBackgroundModel:(id)a3 contentModelBlock:(id)a4;
- (TwoLinesContentViewModel)contentModel;
- (TwoLinesOutlineCellActionModel)actionModel;
- (UICollectionViewCellRegistration)cellRegistration;
- (id)contentModelBlock;
@end

@implementation TwoLinesBasicOutlineCellModel

- (TwoLinesBasicOutlineCellModel)initWithBackgroundModel:(id)a3 contentModelBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TwoLinesBasicOutlineCellModel;
  v9 = [(TwoLinesBasicOutlineCellModel *)&v13 init];
  if (v9)
  {
    id v10 = [v8 copy];
    id contentBlock = v9->_contentBlock;
    v9->_id contentBlock = v10;

    objc_storeStrong((id *)&v9->_backgroundModel, a3);
  }

  return v9;
}

- (TwoLinesContentViewModel)contentModel
{
  contentModel = self->_contentModel;
  if (!contentModel)
  {
    (*((void (**)(void))self->_contentBlock + 2))();
    v4 = (TwoLinesContentViewModel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentModel;
    self->_contentModel = v4;

    contentModel = self->_contentModel;
  }

  return contentModel;
}

- (NSArray)accessoryModels
{
  return 0;
}

- (SidebarOutlineCellBackgroundModel)backgroundModel
{
  return self->_backgroundModel;
}

- (TwoLinesOutlineCellActionModel)actionModel
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TwoLinesBasicOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(TwoLinesBasicOutlineCellModel *)v5 backgroundModel];
    id v7 = v6;
    if (v6 == self->_backgroundModel) {
      unsigned __int8 v8 = 1;
    }
    else {
      unsigned __int8 v8 = -[SidebarOutlineCellBackgroundModel isEqual:](v6, "isEqual:");
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[TwoLinesOutlineCellRegistration sharedRegistration];
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return ![(TwoLinesBasicOutlineCellModel *)self isEqual:a3];
}

- (id)contentModelBlock
{
  return self->_contentModelBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contentModelBlock, 0);
  objc_storeStrong((id *)&self->_backgroundModel, 0);
  objc_storeStrong((id *)&self->_contentModel, 0);

  objc_storeStrong(&self->_contentBlock, 0);
}

@end