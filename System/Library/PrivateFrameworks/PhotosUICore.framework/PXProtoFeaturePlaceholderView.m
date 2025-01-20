@interface PXProtoFeaturePlaceholderView
- (NSString)statusDescription;
- (PXProtoFeaturePlaceholderView)initWithFrame:(CGRect)a3;
- (double)preferredStatusWidth;
- (void)_setStatusDescription:(id)a3;
- (void)_updateStatusDescription;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXProtoFeaturePlaceholderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_statusController, 0);
}

- (double)preferredStatusWidth
{
  return self->_preferredStatusWidth;
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXProtoStatusControllerObservationContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXProtoFeatureView.m" lineNumber:289 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 3) != 0)
  {
    id v11 = v9;
    [(PXProtoFeaturePlaceholderView *)self _updateStatusDescription];
    id v9 = v11;
  }
}

- (void)_setStatusDescription:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_statusDescription;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      char v6 = (NSString *)[(NSString *)v8 copy];
      statusDescription = self->_statusDescription;
      self->_statusDescription = v6;

      [(PXProtoFeaturePlaceholderView *)self statusDescriptionDidChange];
    }
  }
}

- (void)_updateStatusDescription
{
  int64_t v3 = [(PXPhotoAnalysisStatusController *)self->_statusController graphStatus];
  if (v3 == 3)
  {
    char v6 = @"An unexpected error occurred";
  }
  else if (v3 == 2)
  {
    v4 = NSString;
    [(PXPhotoAnalysisStatusController *)self->_statusController graphFractionCompleted];
    objc_msgSend(v4, "stringWithFormat:", @"Analyzing Library (%0.1f%%)", v5 * 100.0);
    char v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v6 = 0;
  }
  v7 = v6;
  [(PXProtoFeaturePlaceholderView *)self _setStatusDescription:v6];
}

- (PXProtoFeaturePlaceholderView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXProtoFeaturePlaceholderView;
  int64_t v3 = -[PXProtoFeaturePlaceholderView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[PXPhotoAnalysisStatusController sharedStatusController];
    statusController = v3->_statusController;
    v3->_statusController = (PXPhotoAnalysisStatusController *)v4;

    [(PXPhotoAnalysisStatusController *)v3->_statusController registerChangeObserver:v3 context:PXProtoStatusControllerObservationContext];
    [(PXProtoFeaturePlaceholderView *)v3 _updateStatusDescription];
    v3->_preferredStatusWidth = 250.0;
  }
  return v3;
}

@end