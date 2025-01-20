@interface SSUIService
- (SSUIService)init;
- (void)_runPPTNamed:(id)a3 numberOfRequiredScreenshots:(unint64_t)a4;
- (void)showScreenshotUI;
- (void)showScreenshotUIForImage:(id)a3 options:(id)a4;
- (void)showScreenshotUIForImage:(id)a3 options:(id)a4 withCompletion:(id)a5;
- (void)takeScreenshotWithOptions:(id)a3;
@end

@implementation SSUIService

- (SSUIService)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSUIService;
  v2 = [(SSUIService *)&v6 init];
  v3 = objc_alloc_init(SSUIServiceClient);
  client = v2->_client;
  v2->_client = v3;

  return v2;
}

- (void)showScreenshotUI
{
  v3 = objc_alloc_init(SSUIShowScreenshotServiceRequest);
  [(SSUIServiceClient *)self->_client sendRequest:v3 withCompletion:0];
}

- (void)takeScreenshotWithOptions:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SSUIShowScreenshotServiceRequest);
  [(SSUIShowScreenshotServiceRequest *)v5 setOptions:v4];

  [(SSUIServiceClient *)self->_client sendRequest:v5 withCompletion:0];
}

- (void)showScreenshotUIForImage:(id)a3 options:(id)a4
{
}

- (void)showScreenshotUIForImage:(id)a3 options:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(SSUIShowScreenshotUIWithImageServiceRequest);
  [(SSUIShowScreenshotUIWithImageServiceRequest *)v11 setImage:v10];

  [(SSUIShowScreenshotUIWithImageServiceRequest *)v11 setOptions:v9];
  [(SSUIServiceClient *)self->_client sendRequest:v11 withCompletion:v8];
}

- (void)_runPPTNamed:(id)a3 numberOfRequiredScreenshots:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(SSUIRunPPTServiceRequest);
  [(SSUIRunPPTServiceRequest *)v7 setTestName:v6];

  [(SSUIRunPPTServiceRequest *)v7 setNumberOfRequiredScreenshots:a4];
  [(SSUIServiceClient *)self->_client sendRequest:v7 withCompletion:0];
}

- (void).cxx_destruct
{
}

@end