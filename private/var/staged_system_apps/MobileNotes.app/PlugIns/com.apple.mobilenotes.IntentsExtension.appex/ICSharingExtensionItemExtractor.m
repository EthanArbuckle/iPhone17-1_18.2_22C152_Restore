@interface ICSharingExtensionItemExtractor
- (NSString)accountId;
- (id)getAttachmentInfoWithImage:(id)a3 useTempFile:(BOOL)a4;
- (void)createTempFileFromImage:(id)a3 populateAttachmentInfo:(id)a4;
- (void)extractDataWithProvider:(id)a3 forUTI:(id)a4 useTempFile:(BOOL)a5 withCompletion:(id)a6;
- (void)extractMediaFileURLWithProvider:(id)a3 contentType:(id)a4 completion:(id)a5;
- (void)extractURLWithProvider:(id)a3 withCompletion:(id)a4;
- (void)setAccountId:(id)a3;
@end

@implementation ICSharingExtensionItemExtractor

- (void)extractMediaFileURLWithProvider:(id)a3 contentType:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000E928;
  v12[3] = &unk_100020D10;
  v14 = self;
  id v15 = a5;
  id v13 = v8;
  id v9 = v15;
  id v10 = v8;
  id v11 = [a3 loadFileRepresentationForContentType:v10 openInPlace:0 completionHandler:v12];
}

- (void)extractURLWithProvider:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [UTTypeFileURL identifier];
  uint64_t v12 = NSItemProviderOptionsIssueSandboxExtensionKey;
  id v13 = &__kCFBooleanTrue;
  id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000EDD8;
  v10[3] = &unk_100020D38;
  id v11 = v5;
  id v9 = v5;
  [v6 loadItemForTypeIdentifier:v7 options:v8 completionHandler:v10];
}

- (void)extractDataWithProvider:(id)a3 forUTI:(id)a4 useTempFile:(BOOL)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [UTTypeData identifier];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000F094;
  v17[3] = &unk_100020D88;
  BOOL v21 = a5;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  [v15 loadItemForTypeIdentifier:v13 options:0 completionHandler:v17];
}

- (id)getAttachmentInfoWithImage:(id)a3 useTempFile:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)ICAddAttachmentsManagerAttachmentInfo);
  id v8 = v7;
  if (v4) {
    [(ICSharingExtensionItemExtractor *)self createTempFileFromImage:v6 populateAttachmentInfo:v7];
  }
  else {
    [v7 setImage:v6];
  }

  return v8;
}

- (void)createTempFileFromImage:(id)a3 populateAttachmentInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ICAccount accountUtilities];
  id v9 = [(ICSharingExtensionItemExtractor *)self accountId];
  id v10 = [v8 temporaryDirectoryURLForAccountIdentifier:v9];

  if (!v10) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((tempDirectoryURL) != nil)", "-[ICSharingExtensionItemExtractor createTempFileFromImage:populateAttachmentInfo:]", 1, 0, @"Expected non-nil value for '%s'", "tempDirectoryURL");
  }
  id v11 = objc_alloc_init((Class)NSUUID);
  id v12 = [v11 UUIDString];

  id v13 = +[NSString stringWithFormat:@"%@.jpeg", v12];
  id v14 = [v10 URLByAppendingPathComponent:v13 isDirectory:0];
  id v15 = [v6 ic_JPEGData];
  if (!v15) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((data) != nil)", "-[ICSharingExtensionItemExtractor createTempFileFromImage:populateAttachmentInfo:]", 1, 0, @"Expected non-nil value for '%s'", "data");
  }
  id v19 = 0;
  unsigned int v16 = [v15 writeToURL:v14 options:1 error:&v19];
  id v17 = v19;
  if (v16)
  {
    [v7 setMediaURL:v14];
    [v7 setUsesTemporaryFile:1];
  }
  else
  {
    id v18 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000148A4((uint64_t)v17, v18);
    }

    [v7 setImage:v6];
  }
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end