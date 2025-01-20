@interface FMDExtExtensionsDataSource
+ (id)_allowedExtensionsIDForDataSource;
+ (id)sharedInstance;
- (FMDExtExtensionsDataSource)init;
- (NSMutableDictionary)extensions;
- (id)extensionMatchToken;
- (void)_setCompleteionBlocksForExtension:(id)a3;
- (void)endDiscoveringExtensions;
- (void)setExtensionMatchToken:(id)a3;
- (void)setExtensions:(id)a3;
- (void)startDiscoveringExtensionsWithCompletion:(id)a3;
@end

@implementation FMDExtExtensionsDataSource

+ (id)sharedInstance
{
  if (qword_10031E700 != -1) {
    dispatch_once(&qword_10031E700, &stru_1002D9740);
  }
  v2 = (void *)qword_10031E6F8;

  return v2;
}

- (FMDExtExtensionsDataSource)init
{
  v11.receiver = self;
  v11.super_class = (Class)FMDExtExtensionsDataSource;
  v2 = [(FMDExtExtensionsDataSource *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    extensions = v2->_extensions;
    v2->_extensions = v3;

    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100014D80;
    v9[3] = &unk_1002D9768;
    v10 = v5;
    v6 = v5;
    [(FMDExtExtensionsDataSource *)v2 startDiscoveringExtensionsWithCompletion:v9];
    dispatch_time_t v7 = dispatch_time(0, 2000000000);
    dispatch_group_wait(v6, v7);
  }
  return v2;
}

+ (id)_allowedExtensionsIDForDataSource
{
  if (qword_10031E710 != -1) {
    dispatch_once(&qword_10031E710, &stru_1002D9788);
  }
  v2 = (void *)qword_10031E708;

  return v2;
}

- (void)startDiscoveringExtensionsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_100059878();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = +[FMDExtExtensionsDataSource _allowedExtensionsIDForDataSource];
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "starting to find extensions allowedExtensions = %@", buf, 0xCu);
  }
  uint64_t v16 = NSExtensionPointName;
  CFStringRef v17 = @"com.apple.icloud.FindMyDevice.Accessories";
  dispatch_time_t v7 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_100014FEC;
  v13 = &unk_1002D97D8;
  v14 = self;
  id v15 = v4;
  id v8 = v4;
  v9 = +[NSExtension beginMatchingExtensionsWithAttributes:v7 completion:&v10];
  -[FMDExtExtensionsDataSource setExtensionMatchToken:](self, "setExtensionMatchToken:", v9, v10, v11, v12, v13, v14);
}

- (void)_setCompleteionBlocksForExtension:(id)a3
{
  id v3 = a3;
  [v3 identifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100015544;
  v11[3] = &unk_1002D9800;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v4;
  [v3 setRequestCompletionBlock:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000155EC;
  v9[3] = &unk_1002D9828;
  id v5 = v4;
  id v10 = v5;
  [v3 setRequestInterruptionBlock:v9];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015694;
  v7[3] = &unk_1002D9850;
  id v8 = v5;
  id v6 = v5;
  [v3 setRequestCancellationBlock:v7];
}

- (void)endDiscoveringExtensions
{
  id v3 = [(FMDExtExtensionsDataSource *)self extensionMatchToken];

  if (v3)
  {
    id v4 = [(FMDExtExtensionsDataSource *)self extensionMatchToken];
    +[NSExtension endMatchingExtensions:v4];

    [(FMDExtExtensionsDataSource *)self setExtensionMatchToken:0];
  }
}

- (NSMutableDictionary)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (id)extensionMatchToken
{
  return self->_extensionMatchToken;
}

- (void)setExtensionMatchToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extensionMatchToken, 0);

  objc_storeStrong((id *)&self->_extensions, 0);
}

@end