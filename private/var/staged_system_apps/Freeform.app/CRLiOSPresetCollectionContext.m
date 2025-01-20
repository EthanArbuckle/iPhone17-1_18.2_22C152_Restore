@interface CRLiOSPresetCollectionContext
- (BOOL)hasCompactHeightCompactWidthTraitCollection;
- (BOOL)hasCompactHeightRegularWidthTraitCollection;
- (BOOL)hasRegularHeightCompactWidthTraitCollection;
- (BOOL)hasRegularHeightRegularWidthTraitCollection;
- (BOOL)isInDarkContainer;
- (BOOL)isInPopover;
- (BOOL)isSearching;
- (BOOL)isSidebarLike;
- (CGSize)contentSize;
- (CRLEditingCoordinator)editingCoordinator;
- (CRLiOSPresetCollectionContext)initWithContextType:(unint64_t)a3 contentSize:(CGSize)a4 editingCoordinator:(id)a5 isSearching:(BOOL)a6 pageIndex:(unint64_t)a7 subpageIndex:(unint64_t)a8 traitCollection:(id)a9;
- (UITraitCollection)traitCollection;
- (id)description;
- (unint64_t)contextType;
- (unint64_t)pageIndex;
- (unint64_t)subpageIndex;
@end

@implementation CRLiOSPresetCollectionContext

- (CRLiOSPresetCollectionContext)initWithContextType:(unint64_t)a3 contentSize:(CGSize)a4 editingCoordinator:(id)a5 isSearching:(BOOL)a6 pageIndex:(unint64_t)a7 subpageIndex:(unint64_t)a8 traitCollection:(id)a9
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v18 = a5;
  id v19 = a9;
  v23.receiver = self;
  v23.super_class = (Class)CRLiOSPresetCollectionContext;
  v20 = [(CRLiOSPresetCollectionContext *)&v23 init];
  v21 = v20;
  if (v20)
  {
    v20->_contentSize.CGFloat width = width;
    v20->_contentSize.CGFloat height = height;
    v20->_contextType = a3;
    objc_storeStrong((id *)&v20->_editingCoordinator, a5);
    v21->_isSearching = a6;
    v21->_pageIndex = a7;
    v21->_subpageIndex = a8;
    objc_storeStrong((id *)&v21->_traitCollection, a9);
  }

  return v21;
}

- (BOOL)isInPopover
{
  return (id)[(CRLiOSPresetCollectionContext *)self contextType] == (id)1;
}

- (BOOL)isSidebarLike
{
  return (id)[(CRLiOSPresetCollectionContext *)self contextType] == (id)2;
}

- (BOOL)hasCompactHeightRegularWidthTraitCollection
{
  v3 = [(CRLiOSPresetCollectionContext *)self traitCollection];
  if ([v3 verticalSizeClass] == (id)1)
  {
    v4 = [(CRLiOSPresetCollectionContext *)self traitCollection];
    BOOL v5 = [v4 horizontalSizeClass] == (id)2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasRegularHeightCompactWidthTraitCollection
{
  v3 = [(CRLiOSPresetCollectionContext *)self traitCollection];
  if ([v3 verticalSizeClass] == (id)2)
  {
    v4 = [(CRLiOSPresetCollectionContext *)self traitCollection];
    BOOL v5 = [v4 horizontalSizeClass] == (id)1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasRegularHeightRegularWidthTraitCollection
{
  v3 = [(CRLiOSPresetCollectionContext *)self traitCollection];
  if ([v3 verticalSizeClass] == (id)2)
  {
    v4 = [(CRLiOSPresetCollectionContext *)self traitCollection];
    BOOL v5 = [v4 horizontalSizeClass] == (id)2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasCompactHeightCompactWidthTraitCollection
{
  v3 = [(CRLiOSPresetCollectionContext *)self traitCollection];
  if ([v3 verticalSizeClass] == (id)1)
  {
    v4 = [(CRLiOSPresetCollectionContext *)self traitCollection];
    BOOL v5 = [v4 horizontalSizeClass] == (id)1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isInDarkContainer
{
  v2 = [(CRLiOSPresetCollectionContext *)self traitCollection];
  unsigned __int8 v3 = [v2 crl_isUserInterfaceStyleDark];

  return v3;
}

- (id)description
{
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(CRLiOSPresetCollectionContext *)self contentSize];
  uint64_t v6 = v5;
  [(CRLiOSPresetCollectionContext *)self contentSize];
  uint64_t v8 = v7;
  unint64_t v9 = [(CRLiOSPresetCollectionContext *)self contextType];
  v10 = [(CRLiOSPresetCollectionContext *)self editingCoordinator];
  unsigned int v11 = [(CRLiOSPresetCollectionContext *)self isSearching];
  unint64_t v12 = [(CRLiOSPresetCollectionContext *)self pageIndex];
  unint64_t v13 = [(CRLiOSPresetCollectionContext *)self subpageIndex];
  v14 = [(CRLiOSPresetCollectionContext *)self traitCollection];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; contentSize.width=%f, contentSize.height=%f, contextType=%lu, editingCoordinator=%@, isSearching: %d, pageIndex=%lu,subpageIndex=%lu, traitCollection=%@>",
    v4,
    self,
    v6,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13,
  v15 = v14);

  return v15;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)contextType
{
  return self->_contextType;
}

- (CRLEditingCoordinator)editingCoordinator
{
  return self->_editingCoordinator;
}

- (BOOL)isSearching
{
  return self->_isSearching;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (unint64_t)subpageIndex
{
  return self->_subpageIndex;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);

  objc_storeStrong((id *)&self->_editingCoordinator, 0);
}

@end