@interface CSDClientManagerExportedObjectProxy
- (BOOL)isSynchronous;
- (BOOL)respondsToSelector:(SEL)a3;
- (CSDClientManager)clientManager;
- (CSDClientManagerExportedObjectProxy)initWithExportedObject:(id)a3;
- (id)exportedObject;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setClientManager:(id)a3;
- (void)setSynchronous:(BOOL)a3;
@end

@implementation CSDClientManagerExportedObjectProxy

- (CSDClientManagerExportedObjectProxy)initWithExportedObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDClientManagerExportedObjectProxy;
  v6 = [(CSDClientManagerExportedObjectProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_exportedObject, a3);
  }

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = [(CSDClientManagerExportedObjectProxy *)self exportedObject];
  id v5 = [v4 methodSignatureForSelector:a3];

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v3 = [(CSDClientManagerExportedObjectProxy *)self exportedObject];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDClientManagerExportedObjectProxy *)self clientManager];
  objc_msgSend(v5, "handleInvocation:synchronously:", v4, -[CSDClientManagerExportedObjectProxy isSynchronous](self, "isSynchronous"));
}

- (CSDClientManager)clientManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientManager);

  return (CSDClientManager *)WeakRetained;
}

- (void)setClientManager:(id)a3
{
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_exportedObject, 0);

  objc_destroyWeak((id *)&self->_clientManager);
}

@end