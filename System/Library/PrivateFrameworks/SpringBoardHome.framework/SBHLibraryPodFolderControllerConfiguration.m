@interface SBHLibraryPodFolderControllerConfiguration
- (SBHLibraryCategoriesRootFolder)categoriesFolder;
- (SBHLibraryCategoryMapProvider)categoryMapProvider;
- (SBHLibraryPodFolderControllerConfiguration)initWithConfiguration:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)setCategoriesFolder:(id)a3;
- (void)setCategoryMapProvider:(id)a3;
@end

@implementation SBHLibraryPodFolderControllerConfiguration

- (SBHLibraryPodFolderControllerConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBHLibraryPodFolderControllerConfiguration;
  v5 = [(SBFolderControllerConfiguration *)&v14 initWithConfiguration:v4];
  if (v5)
  {
    v6 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = v4;
      uint64_t v9 = [v8 categoryMapProvider];
      categoryMapProvider = v5->_categoryMapProvider;
      v5->_categoryMapProvider = (SBHLibraryCategoryMapProvider *)v9;

      uint64_t v11 = [v8 categoriesFolder];

      categoriesFolder = v5->_categoriesFolder;
      v5->_categoriesFolder = (SBHLibraryCategoriesRootFolder *)v11;
    }
  }

  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBHLibraryPodFolderControllerConfiguration;
  id v4 = [(SBFolderControllerConfiguration *)&v10 descriptionBuilderWithMultilinePrefix:a3];
  v5 = [(SBHLibraryPodFolderControllerConfiguration *)self categoryMapProvider];
  id v6 = (id)[v4 appendObject:v5 withName:@"categoryMapProvider"];

  v7 = [(SBHLibraryPodFolderControllerConfiguration *)self categoriesFolder];
  id v8 = (id)[v4 appendObject:v7 withName:@"categoriesFolder"];

  return v4;
}

- (SBHLibraryCategoriesRootFolder)categoriesFolder
{
  return self->_categoriesFolder;
}

- (void)setCategoriesFolder:(id)a3
{
}

- (SBHLibraryCategoryMapProvider)categoryMapProvider
{
  return self->_categoryMapProvider;
}

- (void)setCategoryMapProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryMapProvider, 0);
  objc_storeStrong((id *)&self->_categoriesFolder, 0);
}

@end