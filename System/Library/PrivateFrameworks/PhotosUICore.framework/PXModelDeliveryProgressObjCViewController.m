@interface PXModelDeliveryProgressObjCViewController
- (BOOL)isiPadConfiguration;
- (NSError)errorToReport;
- (_TtC12PhotosUICore37PXModelDeliveryProgressViewController)mdpvc;
- (double)progress;
- (unint64_t)stage;
- (void)_createProgressViewController;
- (void)clearErrorState;
- (void)loadView;
- (void)reportProgress:(double)a3 stage:(unint64_t)a4;
- (void)setErrorState:(id)a3;
- (void)setErrorToReport:(id)a3;
- (void)setIsiPadConfiguration:(BOOL)a3;
- (void)setMdpvc:(id)a3;
- (void)setProgress:(double)a3;
- (void)setStage:(unint64_t)a3;
@end

@implementation PXModelDeliveryProgressObjCViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorToReport, 0);
  objc_storeStrong((id *)&self->_mdpvc, 0);
}

- (void)setErrorToReport:(id)a3
{
}

- (NSError)errorToReport
{
  return self->_errorToReport;
}

- (void)setStage:(unint64_t)a3
{
  self->_stage = a3;
}

- (unint64_t)stage
{
  return self->_stage;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)isiPadConfiguration
{
  return self->_isiPadConfiguration;
}

- (void)setMdpvc:(id)a3
{
}

- (_TtC12PhotosUICore37PXModelDeliveryProgressViewController)mdpvc
{
  return self->_mdpvc;
}

- (void)clearErrorState
{
  [(PXModelDeliveryProgressObjCViewController *)self setErrorToReport:0];
  v3 = [(PXModelDeliveryProgressObjCViewController *)self mdpvc];

  if (v3)
  {
    id v4 = [(PXModelDeliveryProgressObjCViewController *)self mdpvc];
    [v4 setErrorState:0];
  }
}

- (void)setErrorState:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(PXModelDeliveryProgressObjCViewController *)self mdpvc];
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "PXModelDeliveryProgressObjCViewController setErrorState: %@ / mdpvc: %@", (uint8_t *)&v10, 0x16u);
  }
  [(PXModelDeliveryProgressObjCViewController *)self setErrorToReport:v4];
  v7 = [(PXModelDeliveryProgressObjCViewController *)self mdpvc];

  if (v7)
  {
    v8 = [(PXModelDeliveryProgressObjCViewController *)self mdpvc];
    if (v4) {
      uint64_t v9 = [v4 code];
    }
    else {
      uint64_t v9 = 0;
    }
    [v8 setErrorState:v9];
  }
}

- (void)reportProgress:(double)a3 stage:(unint64_t)a4
{
  -[PXModelDeliveryProgressObjCViewController setProgress:](self, "setProgress:");
  [(PXModelDeliveryProgressObjCViewController *)self setStage:a4];
  v7 = [(PXModelDeliveryProgressObjCViewController *)self mdpvc];

  if (v7)
  {
    id v8 = [(PXModelDeliveryProgressObjCViewController *)self mdpvc];
    [v8 reportProgress:a4 stage:a3];
  }
}

- (void)setIsiPadConfiguration:(BOOL)a3
{
  if (self->_isiPadConfiguration != a3)
  {
    self->_isiPadConfiguration = a3;
    id v4 = [(PXModelDeliveryProgressObjCViewController *)self mdpvc];

    if (v4)
    {
      v5 = [(PXModelDeliveryProgressObjCViewController *)self mdpvc];
      [v5 removeFromParentViewController];

      v6 = [(PXModelDeliveryProgressObjCViewController *)self mdpvc];
      v7 = [v6 view];
      [v7 removeFromSuperview];

      [(PXModelDeliveryProgressObjCViewController *)self setMdpvc:0];
      [(PXModelDeliveryProgressObjCViewController *)self _createProgressViewController];
    }
  }
}

- (void)_createProgressViewController
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(_TtC12PhotosUICore37PXModelDeliveryProgressViewController);
  id v4 = [(PXModelDeliveryProgressObjCViewController *)self view];
  [(PXModelDeliveryProgressViewController *)v3 setIsiPadConfiguration:[(PXModelDeliveryProgressObjCViewController *)self isiPadConfiguration]];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PXModelDeliveryProgressObjCViewController *)self addChildViewController:v3];
  v5 = [(PXModelDeliveryProgressViewController *)v3 view];
  [v4 addSubview:v5];

  v24 = [v4 leadingAnchor];
  v25 = [(PXModelDeliveryProgressViewController *)v3 view];
  v23 = [v25 leadingAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v26[0] = v22;
  v20 = [v4 trailingAnchor];
  v21 = [(PXModelDeliveryProgressViewController *)v3 view];
  v19 = [v21 trailingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v26[1] = v18;
  v16 = [v4 topAnchor];
  v17 = [(PXModelDeliveryProgressViewController *)v3 view];
  v6 = [v17 topAnchor];
  v7 = [v16 constraintEqualToAnchor:v6];
  v26[2] = v7;
  id v8 = [v4 bottomAnchor];
  uint64_t v9 = [(PXModelDeliveryProgressViewController *)v3 view];
  int v10 = [v9 bottomAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  v26[3] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];

  [v4 addConstraints:v12];
  objc_storeStrong((id *)&self->_mdpvc, v3);
  [(PXModelDeliveryProgressObjCViewController *)self progress];
  [(PXModelDeliveryProgressViewController *)v3 reportProgress:[(PXModelDeliveryProgressObjCViewController *)self stage] stage:v13];
  uint64_t v14 = [(PXModelDeliveryProgressObjCViewController *)self errorToReport];

  if (v14)
  {
    v15 = [(PXModelDeliveryProgressObjCViewController *)self errorToReport];
    -[PXModelDeliveryProgressViewController setErrorState:](v3, "setErrorState:", [v15 code]);
  }
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)PXModelDeliveryProgressObjCViewController;
  [(PXModelDeliveryProgressObjCViewController *)&v3 loadView];
  [(PXModelDeliveryProgressObjCViewController *)self _createProgressViewController];
}

@end