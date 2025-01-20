@interface _PGPictureInPictureContainerView
- (PGPictureInPictureViewController)vcForDebugging;
- (void)didMoveToSuperview;
- (void)setVcForDebugging:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation _PGPictureInPictureContainerView

- (void)willMoveToSuperview:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_PGPictureInPictureContainerView;
  id v4 = a3;
  [(_PGPictureInPictureContainerView *)&v9 willMoveToSuperview:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vcForDebugging);
  v6 = objc_msgSend(WeakRetained, "viewIfLoaded", v9.receiver, v9.super_class);
  int v7 = [v4 isEqual:v6];

  v8 = PGLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[_PGPictureInPictureContainerView willMoveToSuperview:]";
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 1024;
    int v15 = v7;
    _os_log_impl(&dword_1B5645000, v8, OS_LOG_TYPE_DEFAULT, "%s %p newSuperview is VC's view: %{BOOL}u", buf, 0x1Cu);
  }
}

- (void)didMoveToSuperview
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_PGPictureInPictureContainerView;
  [(_PGPictureInPictureContainerView *)&v8 didMoveToSuperview];
  v3 = [(_PGPictureInPictureContainerView *)self superview];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vcForDebugging);
  v5 = [WeakRetained viewIfLoaded];
  int v6 = [v3 isEqual:v5];

  int v7 = PGLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[_PGPictureInPictureContainerView didMoveToSuperview]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 1024;
    int v14 = v6;
    _os_log_impl(&dword_1B5645000, v7, OS_LOG_TYPE_DEFAULT, "%s %p newSuperview is VC's view: %{BOOL}u", buf, 0x1Cu);
  }
}

- (PGPictureInPictureViewController)vcForDebugging
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vcForDebugging);

  return (PGPictureInPictureViewController *)WeakRetained;
}

- (void)setVcForDebugging:(id)a3
{
}

- (void).cxx_destruct
{
}

@end