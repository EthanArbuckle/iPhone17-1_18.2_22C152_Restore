@interface _PEResourceHandler
- (id)progressHandler;
- (id)resultHandler;
- (void)setProgressHandler:(id)a3;
- (void)setResultHandler:(id)a3;
@end

@implementation _PEResourceHandler

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_resultHandler, 0);
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setResultHandler:(id)a3
{
}

- (id)resultHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

@end