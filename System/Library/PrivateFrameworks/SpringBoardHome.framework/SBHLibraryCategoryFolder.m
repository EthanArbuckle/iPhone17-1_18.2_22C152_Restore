@interface SBHLibraryCategoryFolder
- (BOOL)isLibraryCategoryFolder;
- (SBHLibraryCategoryFolder)initWithDisplayName:(id)a3 maxListCount:(unint64_t)a4 listGridSize:(SBHIconGridSize)a5 libraryCategoryIdentifier:(id)a6;
- (SBHLibraryCategoryIdentifier)libraryCategoryIdentifier;
- (id)_indexPathToRevealForJiggleMode;
- (int64_t)listsFixedIconLocationBehavior;
@end

@implementation SBHLibraryCategoryFolder

- (SBHLibraryCategoryFolder)initWithDisplayName:(id)a3 maxListCount:(unint64_t)a4 listGridSize:(SBHIconGridSize)a5 libraryCategoryIdentifier:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SBHLibraryCategoryFolder;
  v11 = [(SBFolder *)&v15 initWithDisplayName:a3 maxListCount:a4 listGridSize:*(unsigned int *)&a5];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    libraryCategoryIdentifier = v11->_libraryCategoryIdentifier;
    v11->_libraryCategoryIdentifier = (SBHLibraryCategoryIdentifier *)v12;
  }
  return v11;
}

- (BOOL)isLibraryCategoryFolder
{
  return 1;
}

- (id)_indexPathToRevealForJiggleMode
{
  return 0;
}

- (int64_t)listsFixedIconLocationBehavior
{
  return 0;
}

- (SBHLibraryCategoryIdentifier)libraryCategoryIdentifier
{
  return self->_libraryCategoryIdentifier;
}

- (void).cxx_destruct
{
}

@end