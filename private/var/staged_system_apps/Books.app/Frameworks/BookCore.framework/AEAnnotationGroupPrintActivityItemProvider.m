@interface AEAnnotationGroupPrintActivityItemProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)supportedActivityTypes;
- (void)populateHTMLGenerator:(id)a3;
@end

@implementation AEAnnotationGroupPrintActivityItemProvider

- (id)supportedActivityTypes
{
  UIActivityType v4 = UIActivityTypePrint;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AEAnnotationGroupPrintActivityItemProvider *)self supportedActivityTypes];
  unsigned int v9 = [v8 containsObject:v7];

  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)AEAnnotationGroupPrintActivityItemProvider;
    v10 = [(AEAnnotationGroupHTMLActivityItemProvider *)&v15 activityViewController:v6 itemForActivityType:v7];
    id v11 = [objc_alloc((Class)UIMarkupTextPrintFormatter) initWithMarkupText:v10];
  }
  else
  {
    v10 = AESharingLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&def_7D91C, v10, OS_LOG_TYPE_INFO, "%@ returning nil for activity:%@", buf, 0x16u);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v3 = [objc_alloc((Class)UIMarkupTextPrintFormatter) initWithMarkupText:&stru_2CE418];

  return v3;
}

- (void)populateHTMLGenerator:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AEAnnotationGroupPrintActivityItemProvider;
  id v3 = a3;
  [(AEAnnotationHTMLActivityItemProvider *)&v4 populateHTMLGenerator:v3];
  [v3 setCitationsAllowed:0];
  [v3 setForPrint:1];
}

@end