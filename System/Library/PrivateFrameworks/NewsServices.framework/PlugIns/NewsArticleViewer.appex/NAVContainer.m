@interface NAVContainer
+ (id)createContainerWithExtensionContext:(id)a3 hostViewController:(id)a4;
+ (id)sharedContainerForExtension:(id)a3 hostViewController:(id)a4;
- (NAVContainer)initWithExtensionContext:(id)a3 hostViewController:(id)a4;
- (NSExtensionContext)extensionContext;
- (TFContainer)container;
- (TFResolver)resolver;
- (UIViewController)hostViewController;
- (void)setContainer:(id)a3;
- (void)setExtensionContext:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setResolver:(id)a3;
@end

@implementation NAVContainer

+ (id)sharedContainerForExtension:(id)a3 hostViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  FCSetupLogging();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002AD0;
  block[3] = &unk_100004130;
  id v15 = v7;
  id v16 = a1;
  id v14 = v6;
  uint64_t v8 = qword_100008B68;
  id v9 = v7;
  id v10 = v6;
  if (v8 != -1) {
    dispatch_once(&qword_100008B68, block);
  }
  [(id)qword_100008B60 setExtensionContext:v10];
  [(id)qword_100008B60 setHostViewController:v9];
  id v11 = (id)qword_100008B60;

  return v11;
}

+ (id)createContainerWithExtensionContext:(id)a3 hostViewController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[NAVContainer alloc] initWithExtensionContext:v6 hostViewController:v5];

  id v8 = objc_alloc((Class)TFContainer);
  id v9 = [objc_alloc((Class)NUExtensionFrameworkAssembly) initWithExtensionContextProvider:v7];
  id v14 = v9;
  id v10 = +[NSArray arrayWithObjects:&v14 count:1];
  id v11 = [v8 initWithBundleAssemblies:v10 assemblies:&__NSArray0__struct];

  [(NAVContainer *)v7 setContainer:v11];
  v12 = [v11 resolver];
  [(NAVContainer *)v7 setResolver:v12];

  return v7;
}

- (NAVContainer)initWithExtensionContext:(id)a3 hostViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NAVContainer;
  id v9 = [(NAVContainer *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extensionContext, a3);
    objc_storeWeak((id *)&v10->_hostViewController, v8);
  }

  return v10;
}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (TFContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void)setExtensionContext:(id)a3
{
}

- (UIViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setHostViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end