@interface SUInstallationConstraintMonitorBase
- (BOOL)isSatisfied;
- (SUDownload)download;
- (SUInstallOptions)installOptions;
- (SUInstallationConstraintMonitorDelegate)delegate;
- (id)initOnQueue:(id)a3 withDownload:(id)a4;
- (id)initOnQueue:(id)a3 withDownload:(id)a4 andInstallOptions:(id)a5;
- (id)initOnQueue:(id)a3 withRepresentedInstallationConstraints:(unint64_t)a4 andDownload:(id)a5;
- (id)initOnQueue:(id)a3 withRepresentedInstallationConstraints:(unint64_t)a4 andDownload:(id)a5 andInstallOptions:(id)a6;
- (unint64_t)representedConstraints;
- (unint64_t)unsatisfiedConstraints;
- (unint64_t)unsatisfiedConstraintsWithIgnorableConstraints:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SUInstallationConstraintMonitorBase

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  return [(SUInstallationConstraintMonitorBase *)self initOnQueue:a3 withDownload:a4 andInstallOptions:0];
}

- (id)initOnQueue:(id)a3 withDownload:(id)a4 andInstallOptions:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:self file:@"SUInstallationConstraintMonitorBase.m" lineNumber:31 description:@"Please use the subclass version: -initOnQueue:withRepresentedInstallationConstraints:andDownload:andInstallOptions"];

  return 0;
}

- (id)initOnQueue:(id)a3 withRepresentedInstallationConstraints:(unint64_t)a4 andDownload:(id)a5
{
  return [(SUInstallationConstraintMonitorBase *)self initOnQueue:a3 withRepresentedInstallationConstraints:a4 andDownload:a5 andInstallOptions:0];
}

- (id)initOnQueue:(id)a3 withRepresentedInstallationConstraints:(unint64_t)a4 andDownload:(id)a5 andInstallOptions:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  BSDispatchQueueAssert();
  v17.receiver = self;
  v17.super_class = (Class)SUInstallationConstraintMonitorBase;
  v14 = [(SUInstallationConstraintMonitorBase *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_download, a5);
    v15->_representedConstraints = a4;
    objc_storeStrong((id *)&v15->_installOptions, a6);
    objc_storeStrong((id *)&v15->_queue, a3);
  }

  return v15;
}

- (SUDownload)download
{
  BSDispatchQueueAssert();
  download = self->_download;
  return download;
}

- (SUInstallOptions)installOptions
{
  BSDispatchQueueAssert();
  installOptions = self->_installOptions;
  return installOptions;
}

- (unint64_t)representedConstraints
{
  return self->_representedConstraints;
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  return [(SUInstallationConstraintMonitorBase *)self representedConstraints];
}

- (SUInstallationConstraintMonitorDelegate)delegate
{
  BSDispatchQueueAssert();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue_delegate);
  return (SUInstallationConstraintMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  BSDispatchQueueAssert();
  p_queue_delegate = &self->_queue_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_queue_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_queue_delegate, obj);
    v6 = obj;
  }
}

- (BOOL)isSatisfied
{
  return [(SUInstallationConstraintMonitorBase *)self unsatisfiedConstraints] == 0;
}

- (unint64_t)unsatisfiedConstraintsWithIgnorableConstraints:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SUInstallationConstraintMonitorBase.m" lineNumber:100 description:@"Not Implemented"];

  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_queue_delegate);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_download, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end