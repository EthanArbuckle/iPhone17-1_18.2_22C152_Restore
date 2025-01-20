@interface PXFilterFooterController
- (PXContentFilterState)contentFilterState;
- (PXFilterFooterController)init;
- (PXFilterFooterController)initWithActionManager:(id)a3 photoLibrary:(id)a4;
- (PXFilterFooterView)footerFilterView;
- (PXLibraryFilterState)libraryFilterState;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (UIView)view;
- (void)filterFooterViewDidTapShowFilter:(id)a3 sender:(id)a4;
- (void)setContentFilterState:(id)a3;
- (void)setLibraryFilterState:(id)a3;
- (void)setSharedLibraryStatusProvider:(id)a3;
- (void)setView:(id)a3;
@end

@implementation PXFilterFooterController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_contentFilterState, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_footerFilterView, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
}

- (void)setView:(id)a3
{
}

- (PXContentFilterState)contentFilterState
{
  return self->_contentFilterState;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (void)filterFooterViewDidTapShowFilter:(id)a3 sender:(id)a4
{
  id v6 = a3;
  v5 = [(PXActionManager *)self->_actionManager actionPerformerForActionType:@"PXCuratedLibraryActionShowFilters"];
  if (!v5)
  {
    v5 = [(PXActionManager *)self->_actionManager actionPerformerForActionType:@"PXPhotosGridActionShowFilters"];
  }
  [v5 setSender:v6];
  [v5 performActionWithCompletionHandler:0];
}

- (UIView)view
{
  v3 = [(PXFilterFooterController *)self libraryFilterState];
  if ([v3 isFiltering])
  {

LABEL_4:
    id v6 = [(PXFilterFooterController *)self footerFilterView];
    goto LABEL_6;
  }
  v4 = [(PXFilterFooterController *)self contentFilterState];
  int v5 = [v4 isFiltering];

  if (v5) {
    goto LABEL_4;
  }
  id v6 = 0;
LABEL_6:
  return (UIView *)v6;
}

- (PXFilterFooterView)footerFilterView
{
  footerFilterView = self->_footerFilterView;
  if (!footerFilterView)
  {
    v4 = [PXFilterFooterView alloc];
    int v5 = -[PXFilterFooterView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_footerFilterView;
    self->_footerFilterView = v5;

    [(PXFilterFooterView *)self->_footerFilterView setDelegate:self];
    [(PXFilterFooterView *)self->_footerFilterView setSharedLibraryStatusProvider:self->_sharedLibraryStatusProvider];
    [(PXFilterFooterView *)self->_footerFilterView setLibraryFilterState:self->_libraryFilterState];
    [(PXFilterFooterView *)self->_footerFilterView setContentFilterState:self->_contentFilterState];
    footerFilterView = self->_footerFilterView;
  }
  return footerFilterView;
}

- (void)setContentFilterState:(id)a3
{
  v4 = (void *)[a3 copy];
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[PXContentFilterState defaultFilterStateForPhotoLibrary:self->_photoLibrary];
  }
  contentFilterState = self->_contentFilterState;
  self->_contentFilterState = v6;

  v8 = self->_contentFilterState;
  footerFilterView = self->_footerFilterView;
  [(PXFilterFooterView *)footerFilterView setContentFilterState:v8];
}

- (void)setLibraryFilterState:(id)a3
{
  if (a3)
  {
    v4 = (PXLibraryFilterState *)[a3 copy];
    libraryFilterState = self->_libraryFilterState;
    self->_libraryFilterState = v4;
  }
  else
  {
    id v6 = [PXLibraryFilterState alloc];
    libraryFilterState = [(PXFilterFooterController *)self sharedLibraryStatusProvider];
    v7 = [(PXLibraryFilterState *)v6 initWithSharedLibraryStatusProvider:libraryFilterState];
    v8 = self->_libraryFilterState;
    self->_libraryFilterState = v7;
  }
  v9 = self->_libraryFilterState;
  footerFilterView = self->_footerFilterView;
  [(PXFilterFooterView *)footerFilterView setLibraryFilterState:v9];
}

- (void)setSharedLibraryStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, a3);
  id v5 = a3;
  [(PXFilterFooterView *)self->_footerFilterView setSharedLibraryStatusProvider:v5];
  id v6 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v5];

  [(PXFilterFooterController *)self setLibraryFilterState:v6];
}

- (PXFilterFooterController)initWithActionManager:(id)a3 photoLibrary:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXFilterFooterController.m", 42, @"Invalid parameter not satisfying: %@", @"actionManager" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PXFilterFooterController.m", 43, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PXFilterFooterController;
  v11 = [(PXFilterFooterController *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_actionManager, a3);
    objc_storeStrong((id *)&v12->_photoLibrary, a4);
  }

  return v12;
}

- (PXFilterFooterController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFilterFooterController.m", 38, @"%s is not available as initializer", "-[PXFilterFooterController init]");

  abort();
}

@end