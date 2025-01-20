@interface MFScreenshotService
+ (OS_os_log)log;
- (MFScreenshotService)initWithDelegate:(id)a3;
- (MFScreenshotServiceDelegate)delegate;
- (void)fetchPDFRepresentationWithCompletion:(id)a3;
@end

@implementation MFScreenshotService

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DC018;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699CD0 != -1) {
    dispatch_once(&qword_100699CD0, block);
  }
  v2 = (void *)qword_100699CC8;

  return (OS_os_log *)v2;
}

- (MFScreenshotService)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFScreenshotService;
  v5 = [(MFScreenshotService *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)fetchPDFRepresentationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MFScreenshotService *)self delegate];
  v6 = [v5 messageContentRepresentationRequestForScreenshotService:self];

  if (v6)
  {
    v7 = [[MFMessagePrinter alloc] initWithContentRequest:v6];
    objc_super v8 = +[NSFileManager defaultManager];
    v9 = [v8 temporaryDirectory];
    v10 = [v9 URLByAppendingPathComponent:@"MFScreenshotService" isDirectory:1];

    [v8 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:0];
    v11 = +[NSString ef_UUID];
    v12 = [v10 URLByAppendingPathComponent:v11];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001DC360;
    v15[3] = &unk_1006086B8;
    v13 = v7;
    v16 = v13;
    id v17 = v12;
    id v18 = v6;
    id v19 = v4;
    id v14 = v12;
    [(MFMessagePrinter *)v13 loadWithCompletion:v15];
  }
}

- (MFScreenshotServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFScreenshotServiceDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end