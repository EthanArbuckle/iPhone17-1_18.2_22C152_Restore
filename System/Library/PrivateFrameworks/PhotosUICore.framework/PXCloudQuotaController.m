@interface PXCloudQuotaController
- (PXCloudQuotaController)init;
- (PXCloudQuotaControllerDelegate)delegate;
- (UIView)informationView;
- (id)presentingViewControllerForInformationView;
- (void)setDelegate:(id)a3;
- (void)setInformationView:(id)a3;
@end

@implementation PXCloudQuotaController

- (void)setDelegate:(id)a3
{
}

- (PXCloudQuotaController)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    v7 = NSStringFromSelector(a2);
    [v5 raise:v6, @"Only subclasses can be instanciated %@", v7 format];
  }
  v8 = PLUserStatusGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v4;
    __int16 v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> init", buf, 0x16u);
  }

  v10.receiver = self;
  v10.super_class = (Class)PXCloudQuotaController;
  return [(PXCloudQuotaController *)&v10 init];
}

- (void)setInformationView:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v5 = (UIView *)a3;
  if (self->_informationView != v5)
  {
    objc_storeStrong((id *)&self->_informationView, a3);
    uint64_t v6 = [(PXCloudQuotaController *)self delegate];
    v7 = PLUserStatusGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      id v9 = v8;
      objc_super v10 = objc_opt_class();
      id v11 = v10;
      uint64_t v12 = objc_opt_class();
      informationView = self->_informationView;
      int v15 = 138544642;
      v16 = v8;
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2114;
      v20 = v10;
      __int16 v21 = 2048;
      v22 = v6;
      __int16 v23 = 2114;
      v24 = v12;
      __int16 v25 = 2048;
      v26 = informationView;
      id v14 = v12;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> delegate:<%{public}@:%p>, informationViewDidChange:<%{public}@:%p>", (uint8_t *)&v15, 0x3Eu);
    }
    [v6 cloudQuotaController:self informationViewDidChange:self->_informationView];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_informationView, 0);
}

- (PXCloudQuotaControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCloudQuotaControllerDelegate *)WeakRetained;
}

- (UIView)informationView
{
  return self->_informationView;
}

- (id)presentingViewControllerForInformationView
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(PXCloudQuotaController *)self delegate];
  uint64_t v4 = [v3 presentingViewControllerForCloudQuotaController:self];
  v5 = PLUserStatusGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    v8 = objc_opt_class();
    id v9 = v8;
    int v12 = 138544642;
    __int16 v13 = v6;
    __int16 v14 = 2048;
    int v15 = self;
    __int16 v16 = 2114;
    __int16 v17 = v8;
    __int16 v18 = 2048;
    __int16 v19 = v3;
    __int16 v20 = 2114;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2048;
    __int16 v23 = v4;
    id v10 = v21;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> delegate:<%{public}@:%p>, presenting view controller:<%{public}@:%p>", (uint8_t *)&v12, 0x3Eu);
  }
  return v4;
}

@end