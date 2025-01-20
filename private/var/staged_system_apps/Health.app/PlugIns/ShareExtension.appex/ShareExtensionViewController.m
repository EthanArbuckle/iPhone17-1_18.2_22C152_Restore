@interface ShareExtensionViewController
- (BOOL)_containsPasswordProtectedData:(id)a3;
- (BOOL)_preflightForCDA:(id)a3;
- (HKDocumentPickerViewController)documentPickerController;
- (HKLoadingShareViewController)loadingShareViewController;
- (NSMutableArray)documentsForPreview;
- (id)_extractFirstOccurrenceOfTagRule:(id)a3 extactor:(id)a4;
- (int64_t)incomingDocumentCount;
- (int64_t)passwordProtectedZipCount;
- (int64_t)providerLoadingCount;
- (void)_addDocumentForPreview:(id)a3;
- (void)_allShareProvidersFinished;
- (void)_dismissShareExtension;
- (void)_extractZipContent:(id)a3;
- (void)_fetchShareData;
- (void)_importAlertWithTitle:(id)a3 message:(id)a4 doneHandler:(id)a5;
- (void)_incomingDocument;
- (void)_logError:(id)a3 message:(id)a4;
- (void)_passwordProtectedZip;
- (void)_postDocumentPreview;
- (void)_prepareXMLData:(id)a3;
- (void)_saveDocumentsAction:(id)a3;
- (void)_shareProviderFinished;
- (void)_shareProviderLoading;
- (void)setDocumentPickerController:(id)a3;
- (void)setDocumentsForPreview:(id)a3;
- (void)setIncomingDocumentCount:(int64_t)a3;
- (void)setLoadingShareViewController:(id)a3;
- (void)setPasswordProtectedZipCount:(int64_t)a3;
- (void)setProviderLoadingCount:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation ShareExtensionViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)ShareExtensionViewController;
  [(ShareExtensionViewController *)&v11 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(ShareExtensionViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [[HKLoadingShareViewController alloc] initWithNibName:0 bundle:0];
  loadingShareViewController = self->_loadingShareViewController;
  self->_loadingShareViewController = v5;

  documentPickerController = self->_documentPickerController;
  self->_documentPickerController = 0;

  v12 = self->_loadingShareViewController;
  v8 = +[NSArray arrayWithObjects:&v12 count:1];
  [(ShareExtensionViewController *)self setViewControllers:v8];

  v9 = [(ShareExtensionViewController *)self view];
  v10 = HKHealthTintColor();
  [v9 setTintColor:v10];

  [(ShareExtensionViewController *)self _fetchShareData];
}

- (void)_fetchShareData
{
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  documentsForPreview = self->_documentsForPreview;
  self->_documentsForPreview = v3;

  self->_providerLoadingCount = 0;
  self->_incomingDocumentCount = 0;
  self->_passwordProtectedZipCount = 0;
  v5 = [(ShareExtensionViewController *)self extensionContext];
  v6 = v5;
  if (!v5)
  {
    [(ShareExtensionViewController *)self _logError:0 message:@"No extension context present"];
    goto LABEL_25;
  }
  v19 = v5;
  [v5 inputItems];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v22 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (!v22) {
    goto LABEL_23;
  }
  uint64_t v21 = *(void *)v31;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v31 != v21) {
        objc_enumerationMutation(obj);
      }
      uint64_t v23 = v7;
      v8 = [*(id *)(*((void *)&v30 + 1) + 8 * v7) attachments];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v27;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if ([v13 hasItemConformingToTypeIdentifier:@"public.zip-archive"]
              && [v13 hasItemConformingToTypeIdentifier:@"public.file-url"])
            {
              [(ShareExtensionViewController *)self _shareProviderLoading];
              v25[0] = _NSConcreteStackBlock;
              v25[1] = 3221225472;
              v25[2] = sub_100004424;
              v25[3] = &unk_100008208;
              v25[4] = self;
              v14 = v25;
              v15 = v13;
              CFStringRef v16 = @"public.file-url";
LABEL_17:
              [v15 loadItemForTypeIdentifier:v16 options:0 completionHandler:v14];
              continue;
            }
            if ([v13 hasItemConformingToTypeIdentifier:@"public.xml"])
            {
              [(ShareExtensionViewController *)self _shareProviderLoading];
              v24[0] = _NSConcreteStackBlock;
              v24[1] = 3221225472;
              v24[2] = sub_1000044C8;
              v24[3] = &unk_100008230;
              v24[4] = self;
              v14 = v24;
              v15 = v13;
              CFStringRef v16 = @"public.xml";
              goto LABEL_17;
            }
            v17 = [v13 registeredTypeIdentifiers];
            v18 = +[NSString stringWithFormat:@"Unable to handle item: %@", v17];

            [(ShareExtensionViewController *)self _logError:0 message:v18];
          }
          id v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v10);
      }

      uint64_t v7 = v23 + 1;
    }
    while ((id)(v23 + 1) != v22);
    id v22 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  }
  while (v22);
LABEL_23:

  v6 = v19;
LABEL_25:
}

- (void)_extractZipContent:(id)a3
{
  v4 = [a3 path];
  id v5 = [objc_alloc((Class)_HKZipArchiveExtractor) initWithPathname:v4];
  v9[4] = self;
  id v10 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000466C;
  v9[3] = &unk_100008258;
  unsigned __int8 v6 = [v5 enumerateEntriesWithError:&v10 block:v9];
  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = HKLogWellnessDashboard;
    if (os_log_type_enabled(HKLogWellnessDashboard, OS_LOG_TYPE_ERROR)) {
      sub_100005E38((uint64_t)v5, (uint64_t)v7, v8);
    }
  }
}

- (BOOL)_containsPasswordProtectedData:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 subdataWithRange:0, 50];
    id v6 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
    id v7 = v6;
    if (v6 && [v6 length])
    {
      uint64_t v8 = 0;
      while (![v7 characterAtIndex:v8])
      {
        if (++v8 >= (unint64_t)[v7 length]) {
          goto LABEL_7;
        }
      }
      BOOL v9 = 0;
    }
    else
    {
LABEL_7:
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_prepareXMLData:(id)a3
{
  id v4 = a3;
  if ([(ShareExtensionViewController *)self _preflightForCDA:v4])
  {
    [(ShareExtensionViewController *)self _incomingDocument];
    id v5 = +[NSDate date];
    id v8 = 0;
    id v6 = +[HKCDADocumentSample CDADocumentSampleWithData:v4 startDate:v5 endDate:v5 metadata:0 validationError:&v8];
    id v7 = v8;
    if (v6) {
      [(ShareExtensionViewController *)self _addDocumentForPreview:v6];
    }
    else {
      [(ShareExtensionViewController *)self _logError:v7 message:@"Document did not pass validation"];
    }
  }
  else
  {
    [(ShareExtensionViewController *)self _logError:0 message:@"Document did not pass preflight checks"];
  }
}

- (BOOL)_preflightForCDA:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)_HKXMLExtractor);
  [v5 addTagSpecificationForExtraction:@"ClinicalDocument/title"];
  [v5 addTagSpecificationForExtraction:@"ClinicalDocument/component/structuredBody/component/section/templateId/@root"];
  [v5 parseWithData:v4];
  id v6 = [(ShareExtensionViewController *)self _extractFirstOccurrenceOfTagRule:@"ClinicalDocument/title" extactor:v5];
  id v7 = [(ShareExtensionViewController *)self _extractFirstOccurrenceOfTagRule:@"ClinicalDocument/component/structuredBody/component/section/templateId/@root" extactor:v5];
  id v8 = [v4 length];

  BOOL v9 = 0;
  if ((unint64_t)v8 <= 0x4C4B3E)
  {
    if (v6)
    {
      BOOL v9 = 0;
      if ([v6 length])
      {
        if (v7) {
          BOOL v9 = [v7 length] != 0;
        }
      }
    }
  }

  return v9;
}

- (id)_extractFirstOccurrenceOfTagRule:(id)a3 extactor:(id)a4
{
  id v4 = [a4 getDataForTagSpecification:a3];
  if ([v4 count])
  {
    id v5 = [v4 objectAtIndex:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_allShareProvidersFinished
{
  uint64_t v3 = (uint64_t)[(NSMutableArray *)self->_documentsForPreview count];
  int64_t incomingDocumentCount = self->_incomingDocumentCount;
  if (v3 < 1)
  {
    if (incomingDocumentCount >= 1)
    {
      id v7 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
      v15 = [v7 localizedStringForKey:@"CDA_SHARE_ALERT_TITLE" value:&stru_100008528 table:@"HealthUI-Localizable"];
      CFStringRef v16 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
      v17 = [v16 localizedStringForKey:@"CDA_SHARE_NO_VALID_DOCUMENTS" value:&stru_100008528 table:@"HealthUI-Localizable"];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100004EC8;
      v23[3] = &unk_100008280;
      v23[4] = self;
      [(ShareExtensionViewController *)self _importAlertWithTitle:v15 message:v17 doneHandler:v23];

LABEL_14:
      return;
    }
    int64_t passwordProtectedZipCount = self->_passwordProtectedZipCount;
    id v7 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
    BOOL v9 = [v7 localizedStringForKey:@"CDA_SHARE_ALERT_TITLE" value:&stru_100008528 table:@"HealthUI-Localizable"];
    v19 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
    v12 = v19;
    if (passwordProtectedZipCount < 1)
    {
      v13 = [v19 localizedStringForKey:@"CDA_SHARE_NO_DOCUMENTS" value:&stru_100008528 table:@"HealthUI-Localizable"];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100004ED8;
      v21[3] = &unk_100008280;
      v21[4] = self;
      v20 = v21;
    }
    else
    {
      v13 = [v19 localizedStringForKey:@"CDA_SHARE_PASSWORD_PROTECTED" value:&stru_100008528 table:@"HealthUI-Localizable"];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100004ED0;
      v22[3] = &unk_100008280;
      v22[4] = self;
      v20 = v22;
    }
    [(ShareExtensionViewController *)self _importAlertWithTitle:v9 message:v13 doneHandler:v20];
LABEL_13:

    goto LABEL_14;
  }
  int64_t v5 = incomingDocumentCount - v3;
  if (incomingDocumentCount > v3)
  {
    id v6 = +[NSNumber numberWithInteger:v5];
    id v7 = HKLocalizedStringForNumberWithTemplate();

    id v8 = +[NSNumber numberWithInteger:self->_incomingDocumentCount];
    BOOL v9 = HKLocalizedStringForNumberWithTemplate();

    id v10 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v11 = [v10 localizedStringForKey:@"CDA_SHARE_SOME_INVALID_DOCUMENTS %@ %@" value:&stru_100008528 table:@"HealthUI-Localizable"];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v7, v9);

    v13 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
    v14 = [v13 localizedStringForKey:@"CDA_SHARE_ALERT_TITLE" value:&stru_100008528 table:@"HealthUI-Localizable"];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100004EC0;
    v24[3] = &unk_100008280;
    v24[4] = self;
    [(ShareExtensionViewController *)self _importAlertWithTitle:v14 message:v12 doneHandler:v24];

    goto LABEL_13;
  }

  [(ShareExtensionViewController *)self _postDocumentPreview];
}

- (void)_postDocumentPreview
{
  uint64_t v3 = (HKDocumentPickerViewController *)[objc_alloc((Class)HKDocumentPickerViewController) initWithDocuments:self->_documentsForPreview presentationStyle:2];
  documentPickerController = self->_documentPickerController;
  self->_documentPickerController = v3;

  int64_t v5 = +[HKSource defaultSource];
  [(HKDocumentPickerViewController *)self->_documentPickerController setSource:v5];

  id v19 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_dismissShareExtension"];
  id v6 = objc_alloc((Class)UIBarButtonItem);
  id v7 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
  id v8 = [v7 localizedStringForKey:@"CDA_SHARE_DOCUMENT_IMPORT" value:&stru_100008528 table:@"HealthUI-Localizable"];
  id v9 = [v6 initWithTitle:v8 style:0 target:self action:"_saveDocumentsAction:"];

  id v10 = [(HKDocumentPickerViewController *)self->_documentPickerController navigationItem];
  [v10 setLeftBarButtonItem:v19];
  [v10 setRightBarButtonItem:v9];
  BOOL v11 = [(NSMutableArray *)self->_documentsForPreview count] == (id)1;
  v12 = [v10 rightBarButtonItem];
  [v12 setEnabled:v11];

  v13 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
  v14 = [v13 localizedStringForKey:@"CDA_SHARE_DOCUMENT_TITLE" value:&stru_100008528 table:@"HealthUI-Localizable"];
  [v10 setTitle:v14];

  uint64_t v23 = self->_documentPickerController;
  v15 = +[NSArray arrayWithObjects:&v23 count:1];
  [(ShareExtensionViewController *)self setViewControllers:v15];

  CFStringRef v16 = [(ShareExtensionViewController *)self view];
  [v16 frame];
  CGAffineTransformMakeTranslation(&v22, 0.0, v17);
  v18 = [(ShareExtensionViewController *)self view];
  CGAffineTransform v21 = v22;
  [v18 setTransform:&v21];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000051E8;
  v20[3] = &unk_100008280;
  v20[4] = self;
  +[UIView animateWithDuration:v20 animations:0.2];
}

- (void)_saveDocumentsAction:(id)a3
{
  id v4 = [(HKDocumentPickerViewController *)self->_documentPickerController enabledSamples];
  int64_t v5 = [v4 allObjects];

  if ([v5 count])
  {
    id v6 = objc_alloc_init((Class)HKHealthStore);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000531C;
    v7[3] = &unk_1000082D0;
    v7[4] = self;
    [v6 saveObjects:v5 withCompletion:v7];
  }
  else
  {
    [(ShareExtensionViewController *)self _dismissShareExtension];
  }
}

- (void)_dismissShareExtension
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000055DC;
  v3[3] = &unk_100008280;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100005658;
  v2[3] = &unk_1000082F8;
  v2[4] = self;
  +[UIView animateWithDuration:v3 animations:v2 completion:0.2];
}

- (void)_importAlertWithTitle:(id)a3 message:(id)a4 doneHandler:(id)a5
{
  id v8 = a5;
  id v9 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v10 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v11 = [v10 localizedStringForKey:@"SHARE_ALERT_OK" value:&stru_100008528 table:@"HealthUI-Localizable"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000057FC;
  v14[3] = &unk_100008320;
  id v15 = v8;
  id v12 = v8;
  v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v14];

  [v9 addAction:v13];
  [(ShareExtensionViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_logError:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  _HKInitializeLogging();
  id v7 = HKLogWellnessDashboard;
  BOOL v8 = os_log_type_enabled(HKLogWellnessDashboard, OS_LOG_TYPE_ERROR);
  if (v5 && v6)
  {
    if (v8) {
      sub_100005EC0((uint64_t)v6, v7, v5);
    }
  }
  else if (v5)
  {
    if (v8) {
      sub_100005F80(v7, v5);
    }
  }
  else if (v8)
  {
    sub_100006028((uint64_t)v6, v7);
  }
}

- (void)_shareProviderLoading
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005930;
  block[3] = &unk_100008280;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_shareProviderFinished
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000059C0;
  block[3] = &unk_100008280;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_addDocumentForPreview:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005A88;
  v4[3] = &unk_100008348;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_incomingDocument
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005B10;
  block[3] = &unk_100008280;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_passwordProtectedZip
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005BA0;
  block[3] = &unk_100008280;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (HKLoadingShareViewController)loadingShareViewController
{
  return self->_loadingShareViewController;
}

- (void)setLoadingShareViewController:(id)a3
{
}

- (NSMutableArray)documentsForPreview
{
  return self->_documentsForPreview;
}

- (void)setDocumentsForPreview:(id)a3
{
}

- (int64_t)providerLoadingCount
{
  return self->_providerLoadingCount;
}

- (void)setProviderLoadingCount:(int64_t)a3
{
  self->_providerLoadingCount = a3;
}

- (int64_t)incomingDocumentCount
{
  return self->_incomingDocumentCount;
}

- (void)setIncomingDocumentCount:(int64_t)a3
{
  self->_int64_t incomingDocumentCount = a3;
}

- (int64_t)passwordProtectedZipCount
{
  return self->_passwordProtectedZipCount;
}

- (void)setPasswordProtectedZipCount:(int64_t)a3
{
  self->_int64_t passwordProtectedZipCount = a3;
}

- (HKDocumentPickerViewController)documentPickerController
{
  return self->_documentPickerController;
}

- (void)setDocumentPickerController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentPickerController, 0);
  objc_storeStrong((id *)&self->_documentsForPreview, 0);

  objc_storeStrong((id *)&self->_loadingShareViewController, 0);
}

@end