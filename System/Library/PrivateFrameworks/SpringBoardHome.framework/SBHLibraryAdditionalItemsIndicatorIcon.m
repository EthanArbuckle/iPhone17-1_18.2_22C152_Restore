@interface SBHLibraryAdditionalItemsIndicatorIcon
- (BOOL)isAdditionalItemsIndicatorIcon;
- (Class)iconImageViewClassForLocation:(id)a3;
- (SBHLibraryAdditionalItemsIndicatorIcon)initWithCategory:(id)a3;
- (SBHLibraryCategory)category;
@end

@implementation SBHLibraryAdditionalItemsIndicatorIcon

- (BOOL)isAdditionalItemsIndicatorIcon
{
  return 1;
}

- (SBHLibraryAdditionalItemsIndicatorIcon)initWithCategory:(id)a3
{
  id v4 = a3;
  v5 = [v4 compactPodAdditionalItemsFolder];
  v8.receiver = self;
  v8.super_class = (Class)SBHLibraryAdditionalItemsIndicatorIcon;
  v6 = [(SBFolderIcon *)&v8 initWithFolder:v5];

  if (v6) {
    objc_storeWeak((id *)&v6->_category, v4);
  }

  return v6;
}

- (Class)iconImageViewClassForLocation:(id)a3
{
  return (Class)self;
}

- (SBHLibraryCategory)category
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_category);
  return (SBHLibraryCategory *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end