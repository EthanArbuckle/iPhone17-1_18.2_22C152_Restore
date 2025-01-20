@interface PXMoviePresenter
+ (id)moviePresenterWithPresentingViewController:(id)a3;
- (BOOL)presentMovieViewControllerForAssetCollection:(id)a3 keyAssetFetchResult:(id)a4 preferredTransitionType:(int64_t)a5;
- (BOOL)presentMovieViewControllerForAssetCollection:(id)a3 keyAssetFetchResult:(id)a4 referencePersons:(id)a5 preferredTransitionType:(int64_t)a6;
- (PXMoviePresenter)init;
- (PXMoviePresenter)initWithPresentingViewController:(id)a3;
- (UIViewController)presentingViewController;
@end

@implementation PXMoviePresenter

- (void).cxx_destruct
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (BOOL)presentMovieViewControllerForAssetCollection:(id)a3 keyAssetFetchResult:(id)a4 referencePersons:(id)a5 preferredTransitionType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  [v13 handleFailureInMethod:a2, self, @"PXMoviePresenter.m", 43, @"Method %s is a responsibility of subclass %@", "-[PXMoviePresenter presentMovieViewControllerForAssetCollection:keyAssetFetchResult:referencePersons:preferredTransitionType:]", v15 object file lineNumber description];

  abort();
}

- (BOOL)presentMovieViewControllerForAssetCollection:(id)a3 keyAssetFetchResult:(id)a4 preferredTransitionType:(int64_t)a5
{
  return [(PXMoviePresenter *)self presentMovieViewControllerForAssetCollection:a3 keyAssetFetchResult:a4 referencePersons:0 preferredTransitionType:a5];
}

- (PXMoviePresenter)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMoviePresenter.m", 35, @"%s is not available as initializer", "-[PXMoviePresenter init]");

  abort();
}

- (PXMoviePresenter)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXMoviePresenter;
  v5 = [(PXMoviePresenter *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
  }

  return v6;
}

+ (id)moviePresenterWithPresentingViewController:(id)a3
{
  id v3 = a3;
  id v4 = [(PXMoviePresenter *)[PXStoryMoviePresenter alloc] initWithPresentingViewController:v3];

  return v4;
}

@end