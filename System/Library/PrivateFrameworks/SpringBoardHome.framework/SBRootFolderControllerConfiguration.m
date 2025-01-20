@interface SBRootFolderControllerConfiguration
- (BOOL)isDockExternal;
- (BOOL)isForSnapshot;
- (BOOL)showsDoneButtonWhileEditing;
- (BOOL)showsIconSizeToggleButtonWhileEditing;
- (BOOL)showsIconTintButtonWhileEditing;
- (NSArray)leadingCustomViewControllers;
- (NSArray)trailingCustomViewControllers;
- (SBHLegibility)scrollAccessoryAuxiliaryView;
- (SBHRootFolderCustomViewPresenting)leadingCustomViewController;
- (SBHRootFolderCustomViewPresenting)trailingCustomViewController;
- (SBHSearchPresentable)searchPresentableViewController;
- (SBHSearchPresenting)searchPresenter;
- (SBRootFolderControllerConfiguration)initWithConfiguration:(id)a3;
- (UIView)scrollAccessoryBackgroundView;
- (UIViewController)pullDownSearchViewController;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (unint64_t)folderPageManagementAllowedOrientations;
- (unint64_t)ignoresOverscrollOnFirstPageOrientations;
- (unint64_t)ignoresOverscrollOnLastPageOrientations;
- (unint64_t)showsAddWidgetButtonWhileEditingAllowedOrientations;
- (void)setDockExternal:(BOOL)a3;
- (void)setFolderPageManagementAllowedOrientations:(unint64_t)a3;
- (void)setForSnapshot:(BOOL)a3;
- (void)setIgnoresOverscrollOnFirstPageOrientations:(unint64_t)a3;
- (void)setIgnoresOverscrollOnLastPageOrientations:(unint64_t)a3;
- (void)setLeadingCustomViewController:(id)a3;
- (void)setLeadingCustomViewControllers:(id)a3;
- (void)setPullDownSearchViewController:(id)a3;
- (void)setScrollAccessoryAuxiliaryView:(id)a3;
- (void)setScrollAccessoryBackgroundView:(id)a3;
- (void)setSearchPresentableViewController:(id)a3;
- (void)setSearchPresenter:(id)a3;
- (void)setShowsAddWidgetButtonWhileEditingAllowedOrientations:(unint64_t)a3;
- (void)setShowsDoneButtonWhileEditing:(BOOL)a3;
- (void)setShowsIconSizeToggleButtonWhileEditing:(BOOL)a3;
- (void)setShowsIconTintButtonWhileEditing:(BOOL)a3;
- (void)setTrailingCustomViewController:(id)a3;
- (void)setTrailingCustomViewControllers:(id)a3;
@end

@implementation SBRootFolderControllerConfiguration

- (SBRootFolderControllerConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SBRootFolderControllerConfiguration;
  v5 = [(SBFolderControllerConfiguration *)&v27 initWithConfiguration:v4];
  if (v5)
  {
    v6 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = v4;
      v5->_forSnapshot = [v8 isForSnapshot];
      v5->_dockExternal = [v8 isDockExternal];
      v5->_showsDoneButtonWhileEditing = [v8 showsDoneButtonWhileEditing];
      v5->_showsAddWidgetButtonWhileEditingAllowedOrientations = [v8 showsAddWidgetButtonWhileEditingAllowedOrientations];
      uint64_t v9 = [v8 pullDownSearchViewController];
      pullDownSearchViewController = v5->_pullDownSearchViewController;
      v5->_pullDownSearchViewController = (UIViewController *)v9;

      uint64_t v11 = [v8 searchPresenter];
      searchPresenter = v5->_searchPresenter;
      v5->_searchPresenter = (SBHSearchPresenting *)v11;

      uint64_t v13 = [v8 searchPresentableViewController];
      searchPresentableViewController = v5->_searchPresentableViewController;
      v5->_searchPresentableViewController = (SBHSearchPresentable *)v13;

      uint64_t v15 = [v8 scrollAccessoryAuxiliaryView];
      scrollAccessoryAuxiliaryView = v5->_scrollAccessoryAuxiliaryView;
      v5->_scrollAccessoryAuxiliaryView = (SBHLegibility *)v15;

      uint64_t v17 = [v8 scrollAccessoryBackgroundView];
      scrollAccessoryBackgroundView = v5->_scrollAccessoryBackgroundView;
      v5->_scrollAccessoryBackgroundView = (UIView *)v17;

      v19 = [v8 leadingCustomViewControllers];
      uint64_t v20 = [v19 copy];
      leadingCustomViewControllers = v5->_leadingCustomViewControllers;
      v5->_leadingCustomViewControllers = (NSArray *)v20;

      v22 = [v8 trailingCustomViewControllers];
      uint64_t v23 = [v22 copy];
      trailingCustomViewControllers = v5->_trailingCustomViewControllers;
      v5->_trailingCustomViewControllers = (NSArray *)v23;

      v5->_ignoresOverscrollOnFirstPageOrientations = [v8 ignoresOverscrollOnFirstPageOrientations];
      v5->_ignoresOverscrollOnLastPageOrientations = [v8 ignoresOverscrollOnLastPageOrientations];
      uint64_t v25 = [v8 folderPageManagementAllowedOrientations];

      v5->_folderPageManagementAllowedOrientations = v25;
    }
  }

  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)SBRootFolderControllerConfiguration;
  id v4 = [(SBFolderControllerConfiguration *)&v27 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBRootFolderControllerConfiguration isForSnapshot](self, "isForSnapshot"), @"isForSnapshot");
  id v6 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBRootFolderControllerConfiguration isDockExternal](self, "isDockExternal"), @"isDockExternal");
  id v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBRootFolderControllerConfiguration showsDoneButtonWhileEditing](self, "showsDoneButtonWhileEditing"), @"showsDoneButtonWhileEditing");
  id v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBRootFolderControllerConfiguration showsAddWidgetButtonWhileEditingAllowedOrientations](self, "showsAddWidgetButtonWhileEditingAllowedOrientations"), @"showsAddWidgetButtonWhileEditingAllowedOrientations");
  uint64_t v9 = [(SBRootFolderControllerConfiguration *)self pullDownSearchViewController];
  id v10 = (id)[v4 appendObject:v9 withName:@"pullDownSearchViewController"];

  uint64_t v11 = [(SBRootFolderControllerConfiguration *)self searchPresenter];
  id v12 = (id)[v4 appendObject:v11 withName:@"searchPresenter"];

  uint64_t v13 = [(SBRootFolderControllerConfiguration *)self searchPresentableViewController];
  id v14 = (id)[v4 appendObject:v13 withName:@"searchPresentableViewController"];

  uint64_t v15 = [(SBRootFolderControllerConfiguration *)self scrollAccessoryAuxiliaryView];
  id v16 = (id)[v4 appendObject:v15 withName:@"scrollAccessoryAuxiliaryView"];

  uint64_t v17 = [(SBRootFolderControllerConfiguration *)self scrollAccessoryBackgroundView];
  id v18 = (id)[v4 appendObject:v17 withName:@"scrollAccessoryBackgroundView"];

  v19 = [(SBRootFolderControllerConfiguration *)self leadingCustomViewControllers];
  id v20 = (id)[v4 appendObject:v19 withName:@"leadingCustomViewControllers"];

  v21 = [(SBRootFolderControllerConfiguration *)self trailingCustomViewControllers];
  id v22 = (id)[v4 appendObject:v21 withName:@"trailingCustomViewControllers"];

  id v23 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:format:", -[SBRootFolderControllerConfiguration ignoresOverscrollOnFirstPageOrientations](self, "ignoresOverscrollOnFirstPageOrientations"), @"ignoresOverscrollOnFirstPageOrientations", 1);
  id v24 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:format:", -[SBRootFolderControllerConfiguration ignoresOverscrollOnLastPageOrientations](self, "ignoresOverscrollOnLastPageOrientations"), @"ignoresOverscrollOnLastPageOrientations", 1);
  id v25 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:format:", -[SBRootFolderControllerConfiguration folderPageManagementAllowedOrientations](self, "folderPageManagementAllowedOrientations"), @"folderPageManagementAllowedOrientations", 1);
  return v4;
}

- (SBHRootFolderCustomViewPresenting)leadingCustomViewController
{
  v2 = [(SBRootFolderControllerConfiguration *)self leadingCustomViewControllers];
  v3 = [v2 lastObject];

  return (SBHRootFolderCustomViewPresenting *)v3;
}

- (void)setLeadingCustomViewController:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(SBRootFolderControllerConfiguration *)self setLeadingCustomViewControllers:v6];
  }
  else
  {
    [(SBRootFolderControllerConfiguration *)self setLeadingCustomViewControllers:0];
  }
}

- (SBHRootFolderCustomViewPresenting)trailingCustomViewController
{
  v2 = [(SBRootFolderControllerConfiguration *)self trailingCustomViewControllers];
  v3 = [v2 firstObject];

  return (SBHRootFolderCustomViewPresenting *)v3;
}

- (void)setTrailingCustomViewController:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(SBRootFolderControllerConfiguration *)self setTrailingCustomViewControllers:v6];
  }
  else
  {
    [(SBRootFolderControllerConfiguration *)self setTrailingCustomViewControllers:0];
  }
}

- (BOOL)isForSnapshot
{
  return self->_forSnapshot;
}

- (void)setForSnapshot:(BOOL)a3
{
  self->_forSnapshot = a3;
}

- (BOOL)isDockExternal
{
  return self->_dockExternal;
}

- (void)setDockExternal:(BOOL)a3
{
  self->_dockExternal = a3;
}

- (BOOL)showsDoneButtonWhileEditing
{
  return self->_showsDoneButtonWhileEditing;
}

- (void)setShowsDoneButtonWhileEditing:(BOOL)a3
{
  self->_showsDoneButtonWhileEditing = a3;
}

- (unint64_t)showsAddWidgetButtonWhileEditingAllowedOrientations
{
  return self->_showsAddWidgetButtonWhileEditingAllowedOrientations;
}

- (void)setShowsAddWidgetButtonWhileEditingAllowedOrientations:(unint64_t)a3
{
  self->_showsAddWidgetButtonWhileEditingAllowedOrientations = a3;
}

- (BOOL)showsIconTintButtonWhileEditing
{
  return self->_showsIconTintButtonWhileEditing;
}

- (void)setShowsIconTintButtonWhileEditing:(BOOL)a3
{
  self->_showsIconTintButtonWhileEditing = a3;
}

- (BOOL)showsIconSizeToggleButtonWhileEditing
{
  return self->_showsIconSizeToggleButtonWhileEditing;
}

- (void)setShowsIconSizeToggleButtonWhileEditing:(BOOL)a3
{
  self->_showsIconSizeToggleButtonWhileEditing = a3;
}

- (UIViewController)pullDownSearchViewController
{
  return self->_pullDownSearchViewController;
}

- (void)setPullDownSearchViewController:(id)a3
{
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (void)setSearchPresenter:(id)a3
{
}

- (SBHSearchPresentable)searchPresentableViewController
{
  return self->_searchPresentableViewController;
}

- (void)setSearchPresentableViewController:(id)a3
{
}

- (SBHLegibility)scrollAccessoryAuxiliaryView
{
  return self->_scrollAccessoryAuxiliaryView;
}

- (void)setScrollAccessoryAuxiliaryView:(id)a3
{
}

- (UIView)scrollAccessoryBackgroundView
{
  return self->_scrollAccessoryBackgroundView;
}

- (void)setScrollAccessoryBackgroundView:(id)a3
{
}

- (NSArray)leadingCustomViewControllers
{
  return self->_leadingCustomViewControllers;
}

- (void)setLeadingCustomViewControllers:(id)a3
{
}

- (NSArray)trailingCustomViewControllers
{
  return self->_trailingCustomViewControllers;
}

- (void)setTrailingCustomViewControllers:(id)a3
{
}

- (unint64_t)ignoresOverscrollOnFirstPageOrientations
{
  return self->_ignoresOverscrollOnFirstPageOrientations;
}

- (void)setIgnoresOverscrollOnFirstPageOrientations:(unint64_t)a3
{
  self->_ignoresOverscrollOnFirstPageOrientations = a3;
}

- (unint64_t)ignoresOverscrollOnLastPageOrientations
{
  return self->_ignoresOverscrollOnLastPageOrientations;
}

- (void)setIgnoresOverscrollOnLastPageOrientations:(unint64_t)a3
{
  self->_ignoresOverscrollOnLastPageOrientations = a3;
}

- (unint64_t)folderPageManagementAllowedOrientations
{
  return self->_folderPageManagementAllowedOrientations;
}

- (void)setFolderPageManagementAllowedOrientations:(unint64_t)a3
{
  self->_folderPageManagementAllowedOrientations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingCustomViewControllers, 0);
  objc_storeStrong((id *)&self->_leadingCustomViewControllers, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryBackgroundView, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryAuxiliaryView, 0);
  objc_storeStrong((id *)&self->_searchPresentableViewController, 0);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_pullDownSearchViewController, 0);
}

@end