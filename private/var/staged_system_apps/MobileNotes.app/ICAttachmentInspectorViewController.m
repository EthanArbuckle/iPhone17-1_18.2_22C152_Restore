@interface ICAttachmentInspectorViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)canClear:(id)a3;
- (BOOL)canCopy:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)regenerateMetadataOnClose;
- (ICAttachment)attachment;
- (ICAttachmentInspectorViewController)initWithAttachment:(id)a3;
- (NSArray)spotlightResults;
- (NSOperationQueue)searchOperationQueue;
- (NSSet)subAttachmentIdentifiers;
- (NSSet)subAttachments;
- (NSString)subAttachmentIdentifiersString;
- (UIImageView)attachmentImageView;
- (id)attachmentInfoAtRow:(int64_t)a3;
- (id)attachmentInfoCellAtRow:(int64_t)a3;
- (id)attachmentInfoTypeAtRow:(int64_t)a3;
- (id)defaultCellForRowInSection:(int64_t)a3;
- (id)defaultCellTextAtSection:(int64_t)a3;
- (id)dequeueOrRegisterCellWithIdentifier:(id)a3 style:(int64_t)a4;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)spotlightAttributeCellAtRow:(int64_t)a3;
- (id)spotlightAttributeValueToCopyAtRow:(int64_t)a3;
- (id)stringToCopyAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)titleForHeaderInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)clearAtIndexPath:(id)a3;
- (void)confirmShowSubAttachmentsIfNeeded;
- (void)copy:(id)a3;
- (void)doneAction:(id)a3;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)presentEditMenuAtIndexPath:(id)a3;
- (void)savePKDrawingData;
- (void)setAttachment:(id)a3;
- (void)setAttachmentImageView:(id)a3;
- (void)setRegenerateMetadataOnClose:(BOOL)a3;
- (void)setSearchOperationQueue:(id)a3;
- (void)setSpotlightResults:(id)a3;
- (void)setUpViews;
- (void)startCoreSpotlightSearch;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateViews;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ICAttachmentInspectorViewController

- (ICAttachmentInspectorViewController)initWithAttachment:(id)a3
{
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = +[NSBundle bundleForClass:v6];
  v14.receiver = self;
  v14.super_class = (Class)ICAttachmentInspectorViewController;
  v9 = [(ICAttachmentInspectorViewController *)&v14 initWithNibName:v7 bundle:v8];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_attachment, a3);
    spotlightResults = v9->_spotlightResults;
    v9->_spotlightResults = (NSArray *)&__NSArray0__struct;

    v11 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    searchOperationQueue = v9->_searchOperationQueue;
    v9->_searchOperationQueue = v11;
  }
  return v9;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentInspectorViewController;
  [(ICAttachmentInspectorViewController *)&v3 viewDidLoad];
  [(ICAttachmentInspectorViewController *)self setUpViews];
  [(ICAttachmentInspectorViewController *)self startCoreSpotlightSearch];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentInspectorViewController;
  [(ICAttachmentInspectorViewController *)&v4 viewDidDisappear:a3];
  if ([(ICAttachmentInspectorViewController *)self regenerateMetadataOnClose])
  {
    dispatchMainAfterDelay();
    [(ICAttachmentInspectorViewController *)self setRegenerateMetadataOnClose:0];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) < 6 || a4 == 8) {
    return 1;
  }
  if (a4 != 7) {
    return 13;
  }
  v6 = [(ICAttachmentInspectorViewController *)self spotlightResults];
  id v7 = [v6 count];

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 section];
  switch((unint64_t)v6)
  {
    case 0uLL:
      -[ICAttachmentInspectorViewController attachmentInfoCellAtRow:](self, "attachmentInfoCellAtRow:", [v5 row]);
      id v7 = (ICAttachmentInspectorViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 8uLL:
      id v7 = [(ICAttachmentInspectorViewController *)self defaultCellForRowInSection:v6];
      goto LABEL_3;
    case 7uLL:
      -[ICAttachmentInspectorViewController spotlightAttributeCellAtRow:[v5 row]];
      id v7 = (ICAttachmentInspectorViewController *)objc_claimAutoreleasedReturnValue();
LABEL_3:
      self = v7;
      break;
    default:
      break;
  }

  return self;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(ICAttachmentInspectorViewController *)self titleForHeaderInSection:a4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a4;
  if ([v9 section])
  {
    id v5 = [v9 section];
  }
  else
  {
    id v6 = [v9 row];
    id v5 = [v9 section];
    if (v6 == (id)9)
    {
      [(ICAttachmentInspectorViewController *)self confirmShowSubAttachmentsIfNeeded];
      goto LABEL_9;
    }
  }
  if (v5 == (id)8)
  {
    [(ICAttachmentInspectorViewController *)self savePKDrawingData];
  }
  else
  {
    id v7 = [v9 section];
    v8 = v9;
    if (!v7) {
      goto LABEL_10;
    }
    [(ICAttachmentInspectorViewController *)self presentEditMenuAtIndexPath:v9];
  }
LABEL_9:
  v8 = v9;
LABEL_10:
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6 = [a5 mutableCopy:a3, a4];
  id v7 = [(ICAttachmentInspectorViewController *)self tableView];
  v8 = [v7 indexPathForSelectedRow];

  if ([(ICAttachmentInspectorViewController *)self canClear:v8])
  {
    id v9 = +[UIImage systemImageNamed:@"trash"];
    objc_super v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_100135220;
    v17 = &unk_100626400;
    v18 = self;
    id v19 = v8;
    v10 = +[UIAction actionWithTitle:@"Clear" image:v9 identifier:0 handler:&v14];

    [v10 setAttributes:((unint64_t)[v10 attributes:v14, v15, v16, v17, v18]) | 2];
    [v6 addObject:v10];
  }
  id v11 = [v6 copy];
  v12 = +[UIMenu menuWithChildren:v11];

  return v12;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = [(ICAttachmentInspectorViewController *)self tableView];
  id v6 = [(ICAttachmentInspectorViewController *)self tableView];
  id v7 = [v6 indexPathForSelectedRow];
  [v8 deselectRowAtIndexPath:v7 animated:1];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = [(ICAttachmentInspectorViewController *)self tableView];
  id v7 = [v6 indexPathForSelectedRow];

  id v8 = [(ICAttachmentInspectorViewController *)self stringToCopyAtIndexPath:v7];

  if (!v8)
  {
    v10 = [(ICAttachmentInspectorViewController *)self tableView];
    [v10 deselectRowAtIndexPath:v7 animated:1];

    goto LABEL_5;
  }
  if ("copy:" != a3)
  {
LABEL_5:
    BOOL v9 = 0;
    goto LABEL_6;
  }
  BOOL v9 = [(ICAttachmentInspectorViewController *)self canCopy:v7];
LABEL_6:

  return v9;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)copy:(id)a3
{
  objc_super v4 = [(ICAttachmentInspectorViewController *)self tableView];
  id v7 = [v4 indexPathForSelectedRow];

  id v5 = [(ICAttachmentInspectorViewController *)self stringToCopyAtIndexPath:v7];
  if (v5)
  {
    id v6 = +[UIPasteboard generalPasteboard];
    [v6 setString:v5];
  }
}

- (void)presentEditMenuAtIndexPath:(id)a3
{
  id v10 = a3;
  objc_super v4 = [(ICAttachmentInspectorViewController *)self tableView];
  id v5 = [v4 cellForRowAtIndexPath:v10];

  id v6 = [v5 interactions];
  [v6 ic_firstObjectOfClass:[objc_opt_class()]];
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    id v7 = [objc_alloc((Class)UIEditMenuInteraction) initWithDelegate:self];
    [v5 addInteraction:v7];
  }
  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 section]);
  [v5 center];
  BOOL v9 = +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", v8);

  [v7 presentEditMenuWithConfiguration:v9];
}

- (void)savePKDrawingData
{
  objc_opt_class();
  objc_super v3 = [(ICAttachmentInspectorViewController *)self attachment];
  objc_super v4 = [v3 attachmentModel];
  id v5 = ICDynamicCast();

  if (v5)
  {
    objc_opt_class();
    id v6 = [(ICAttachmentInspectorViewController *)self attachment];
    id v7 = [v6 attachmentModel];
    id v8 = ICDynamicCast();
    id v9 = [v8 newDrawingFromMergeableData];

    goto LABEL_5;
  }
  id v10 = [(ICAttachmentInspectorViewController *)self attachment];
  unsigned int v11 = [v10 attachmentType];

  if (v11 == 13)
  {
    id v6 = [(ICAttachmentInspectorViewController *)self attachment];
    id v9 = +[ICSystemPaperDocumentHelper drawingForPaperAttachment:v6];
LABEL_5:

    uint64_t v12 = [v9 dataRepresentation];
    v13 = (void *)v12;
    if (v9)
    {
      if (v12)
      {
LABEL_7:
        v30 = NSTemporaryDirectory();
        +[NSFileManager defaultManager];
        objc_super v14 = v31 = v5;
        uint64_t v15 = +[NSURL fileURLWithPath:v30];
        v16 = [(ICAttachmentInspectorViewController *)self attachment];
        v17 = [v16 title];
        v18 = [v17 ic_trimmedString];
        id v19 = [v18 ic_stringByReplacingNewlineCharactersWithWhiteSpace];
        [v19 ic_sanitizedFilenameString];
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if ([(__CFString *)v20 length]) {
          CFStringRef v21 = v20;
        }
        else {
          CFStringRef v21 = @"Drawing";
        }
        v22 = [v15 URLByAppendingPathComponent:v21 isDirectory:0];

        v23 = [v22 URLByAppendingPathExtension:@"pkdrawingdata"];

        [v14 removeItemAtURL:v23 error:0];
        [v13 writeToURL:v23 atomically:1];
        id v24 = objc_alloc((Class)UIActivityViewController);
        v33 = v23;
        v25 = +[NSArray arrayWithObjects:&v33 count:1];
        id v26 = [v24 initWithActivityItems:v25 applicationActivities:0];

        v32[0] = UIActivityTypeOpenInIBooks;
        v32[1] = ICActivityTypeShareToNote;
        v32[2] = UIActivityTypeSharePlay;
        v27 = +[NSArray arrayWithObjects:v32 count:3];
        [v26 setExcludedActivityTypes:v27];

        v28 = [(ICAttachmentInspectorViewController *)self view];
        v29 = [v26 popoverPresentationController];
        [v29 setSourceView:v28];

        [(ICAttachmentInspectorViewController *)self presentViewController:v26 animated:1 completion:0];
        id v5 = v31;

        goto LABEL_13;
      }
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((drawing) != nil)", "-[ICAttachmentInspectorViewController savePKDrawingData]", 1, 0, @"Expected non-nil value for '%s'", "drawing");
      if (v13) {
        goto LABEL_7;
      }
    }
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((data) != nil)", "-[ICAttachmentInspectorViewController savePKDrawingData]", 1, 0, @"Expected non-nil value for '%s'", "data");
LABEL_13:
  }
}

- (int64_t)numberOfSections
{
  objc_super v3 = [(ICAttachmentInspectorViewController *)self attachment];
  if ([v3 attachmentType] == 10)
  {

    return 9;
  }
  objc_super v4 = [(ICAttachmentInspectorViewController *)self attachment];
  unsigned int v5 = [v4 attachmentType];

  if (v5 == 13) {
    return 9;
  }
  return 8;
}

- (id)attachmentInfoAtRow:(int64_t)a3
{
  objc_super v4 = self;
  unsigned int v5 = [(ICAttachmentInspectorViewController *)self attachment];
  id v6 = v5;
  switch(a3)
  {
    case 0:
      uint64_t v7 = [v5 title];
      goto LABEL_12;
    case 1:
      uint64_t v7 = [v5 userTitle];
      goto LABEL_12;
    case 2:
      uint64_t v7 = [v5 identifier];
      goto LABEL_12;
    case 3:
      uint64_t v7 = [v5 typeUTI];
      goto LABEL_12;
    case 4:
      [v5 attachmentType];
      uint64_t v7 = NSStringFromICAttachmentType();
      goto LABEL_12;
    case 5:
      [v5 minimumSupportedNotesVersion];
      uint64_t v7 = NSStringFromNotesVersion();
      goto LABEL_12;
    case 6:
      [v5 originX];
      CGFloat v9 = v8;
      [v6 originY];
      CGFloat v11 = v10;
      [v6 sizeWidth];
      CGFloat v13 = v12;
      [v6 sizeHeight];
      v22.size.height = v14;
      v22.origin.x = v9;
      v22.origin.y = v11;
      v22.size.width = v13;
      uint64_t v7 = NSStringFromCGRect(v22);
      goto LABEL_12;
    case 7:
      [v5 orientation];
      uint64_t v7 = NSStringFromICImageClassOrientation();
      goto LABEL_12;
    case 8:
      uint64_t v15 = [v5 croppingQuad];
      v16 = [v15 description];
      objc_super v4 = [v16 ic_trimmedString];

      goto LABEL_20;
    case 9:
      uint64_t v7 = [v4 subAttachmentIdentifiersString];
LABEL_12:
      objc_super v4 = (void *)v7;
      break;
    case 10:
      v17 = [v5 parentAttachment];
      goto LABEL_16;
    case 11:
      v18 = [v5 parentAttachment];
      goto LABEL_18;
    case 12:
      v17 = [v5 note];
LABEL_16:
      uint64_t v15 = v17;
      uint64_t v19 = [v17 title];
      goto LABEL_19;
    case 13:
      v18 = [v5 note];
LABEL_18:
      uint64_t v15 = v18;
      uint64_t v19 = [v18 identifier];
LABEL_19:
      objc_super v4 = (void *)v19;
LABEL_20:

      break;
    default:
      break;
  }

  return v4;
}

- (id)spotlightAttributeValueToCopyAtRow:(int64_t)a3
{
  unsigned int v5 = [(ICAttachmentInspectorViewController *)self spotlightResults];
  id v6 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v7 = [v6 key];
  double v8 = sub_100135CE0(v7);
  CGFloat v9 = [(ICAttachmentInspectorViewController *)self spotlightResults];
  double v10 = [v9 objectAtIndexedSubscript:a3];
  CGFloat v11 = [v10 value];
  double v12 = sub_100135CE0(v11);
  CGFloat v13 = +[NSString stringWithFormat:@"%@: %@", v8, v12];

  return v13;
}

- (id)spotlightAttributeCellAtRow:(int64_t)a3
{
  unsigned int v5 = [(ICAttachmentInspectorViewController *)self dequeueOrRegisterCellWithIdentifier:@"SectionSpotlightAttributeCell" style:3];
  id v6 = [(ICAttachmentInspectorViewController *)self spotlightResults];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
  double v8 = [v7 key];
  CGFloat v9 = sub_100135CE0(v8);
  double v10 = [v5 textLabel];
  [v10 setText:v9];

  CGFloat v11 = [(ICAttachmentInspectorViewController *)self spotlightResults];
  double v12 = [v11 objectAtIndexedSubscript:a3];
  CGFloat v13 = [v12 value];
  CGFloat v14 = sub_100135CE0(v13);
  uint64_t v15 = [v5 detailTextLabel];
  [v15 setText:v14];

  return v5;
}

- (id)attachmentInfoCellAtRow:(int64_t)a3
{
  unsigned int v5 = [(ICAttachmentInspectorViewController *)self dequeueOrRegisterCellWithIdentifier:@"SectionInfoCell" style:3];
  id v6 = [(ICAttachmentInspectorViewController *)self attachmentInfoTypeAtRow:a3];
  uint64_t v7 = [v5 textLabel];
  [v7 setText:v6];

  double v8 = [(ICAttachmentInspectorViewController *)self attachmentInfoAtRow:a3];
  CGFloat v9 = sub_100135CE0(v8);
  double v10 = [v5 detailTextLabel];
  [v10 setText:v9];

  [v5 setAccessoryType:a3 == 9];

  return v5;
}

- (id)attachmentInfoTypeAtRow:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xC) {
    return @"Title";
  }
  else {
    return *(&off_10062AD38 + a3 - 1);
  }
}

- (BOOL)canClear:(id)a3
{
  return (char *)[a3 section] - 1 < (char *)5;
}

- (BOOL)canCopy:(id)a3
{
  id v3 = a3;
  if ([v3 section]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [v3 row] != (id)9;
  }
  if ([v3 row] == (id)8) {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)clearAtIndexPath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ICAttachmentInspectorViewController *)self attachment];
  switch((unint64_t)[v4 section])
  {
    case 0uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_8;
    case 1uLL:
      [v5 setSummary:0];
      id v6 = [v5 parentAttachment];
      [v6 setSummary:0];

      uint64_t v7 = [v5 parentAttachment];
      [v7 attachmentDidChange];

      goto LABEL_6;
    case 2uLL:
      [v5 setHandwritingSummary:0];
      goto LABEL_6;
    case 3uLL:
      [v5 setImageClassificationSummary:0];
      goto LABEL_6;
    case 4uLL:
      [v5 setOcrSummary:0];
LABEL_6:
      [(ICAttachmentInspectorViewController *)self setRegenerateMetadataOnClose:1];
      break;
    case 5uLL:
      [v5 setAdditionalIndexableText:0];
      break;
    default:
      break;
  }
  [v5 attachmentDidChange];
  double v8 = [v5 managedObjectContext];
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10013623C;
  v13[3] = &unk_100625AF0;
  id v9 = v8;
  id v14 = v9;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100136244;
  v10[3] = &unk_100625678;
  objc_copyWeak(&v12, &location);
  id v11 = v4;
  [v9 ic_performBlock:v13 andPerformBlockOnMainThread:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

LABEL_8:
}

- (void)confirmShowSubAttachmentsIfNeeded
{
  v2 = [(ICAttachmentInspectorViewController *)self subAttachments];
  id v3 = [v2 count];

  if (v3)
  {
    id v15 = +[UIAlertController alertControllerWithTitle:@"Sub-attachments" message:0 preferredStyle:0];
    objc_initWeak(&location, self);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = [(ICAttachmentInspectorViewController *)self subAttachments];
    id v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v22;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v4);
          }
          double v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v9 = [v8 identifier];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_1001366B0;
          v19[3] = &unk_10062AC88;
          objc_copyWeak(&v20, &location);
          v19[4] = v8;
          double v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v19];
          [v15 addAction:v10];

          objc_destroyWeak(&v20);
        }
        id v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v5);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001367B4;
    v17[3] = &unk_10062ACB0;
    objc_copyWeak(&v18, &location);
    id v11 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:v17];
    [v15 addAction:v11];
    [(ICAttachmentInspectorViewController *)self presentViewController:v15 animated:1 completion:0];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    id v16 = [(ICAttachmentInspectorViewController *)self tableView];
    id v12 = [(ICAttachmentInspectorViewController *)self tableView];
    CGFloat v13 = [v12 indexPathForSelectedRow];
    [v16 deselectRowAtIndexPath:v13 animated:1];
  }
}

- (id)defaultCellForRowInSection:(int64_t)a3
{
  id v5 = [(ICAttachmentInspectorViewController *)self dequeueOrRegisterCellWithIdentifier:@"DefaultCell" style:3];
  uint64_t v6 = [(ICAttachmentInspectorViewController *)self defaultCellTextAtSection:a3];
  uint64_t v7 = sub_100135CE0(v6);
  double v8 = [v5 detailTextLabel];
  [v8 setText:v7];

  return v5;
}

- (id)defaultCellTextAtSection:(int64_t)a3
{
  id v4 = [(ICAttachmentInspectorViewController *)self attachment];
  id v5 = v4;
  uint64_t v6 = 0;
  switch(a3)
  {
    case 1:
      uint64_t v7 = [v4 summary];
      goto LABEL_9;
    case 2:
      uint64_t v7 = [v4 handwritingSummary];
      goto LABEL_9;
    case 3:
      uint64_t v7 = [v4 imageClassificationSummary];
      goto LABEL_9;
    case 4:
      uint64_t v7 = [v4 ocrSummary];
      goto LABEL_9;
    case 5:
      uint64_t v7 = [v4 additionalIndexableText];
LABEL_9:
      uint64_t v6 = (__CFString *)v7;
      break;
    case 6:
      double v8 = [v4 media];
      id v9 = [v8 mediaURL];
      uint64_t v6 = [v9 path];

      break;
    case 8:
      uint64_t v6 = @"Export Drawing";
      break;
    default:
      break;
  }

  return v6;
}

- (id)dequeueOrRegisterCellWithIdentifier:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(ICAttachmentInspectorViewController *)self tableView];
  id v8 = [v7 dequeueReusableCellWithIdentifier:v6];

  if (!v8)
  {
    id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:a4 reuseIdentifier:v6];
    id v9 = [v8 textLabel];
    [v9 setNumberOfLines:0];

    double v10 = [v8 detailTextLabel];
    [v10 setNumberOfLines:0];
  }

  return v8;
}

- (void)doneAction:(id)a3
{
  id v3 = [(ICAttachmentInspectorViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);

  [(ICAttachmentInspectorViewController *)self updateViews];
}

- (void)setUpViews
{
  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneAction:"];
  id v3 = [(ICAttachmentInspectorViewController *)self navigationItem];
  [v3 setRightBarButtonItem:v6];

  id v4 = [(ICAttachmentInspectorViewController *)self tableView];
  [v4 setRowHeight:UITableViewAutomaticDimension];

  id v5 = [(ICAttachmentInspectorViewController *)self tableView];
  [v5 setEstimatedRowHeight:44.0];

  [(ICAttachmentInspectorViewController *)self updateViews];
}

- (id)stringToCopyAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  switch((unint64_t)v5)
  {
    case 0uLL:
      -[ICAttachmentInspectorViewController attachmentInfoAtRow:](self, "attachmentInfoAtRow:", [v4 row]);
      id v6 = (ICAttachmentInspectorViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 8uLL:
      id v6 = [(ICAttachmentInspectorViewController *)self defaultCellTextAtSection:v5];
      goto LABEL_3;
    case 7uLL:
      -[ICAttachmentInspectorViewController spotlightAttributeValueToCopyAtRow:](self, "spotlightAttributeValueToCopyAtRow:", [v4 row]);
      id v6 = (ICAttachmentInspectorViewController *)objc_claimAutoreleasedReturnValue();
LABEL_3:
      self = v6;
      break;
    default:
      break;
  }

  return self;
}

- (NSSet)subAttachments
{
  v2 = [(ICAttachmentInspectorViewController *)self attachment];
  uint64_t v3 = [v2 parentAttachment];
  id v4 = (void *)v3;
  if (v3) {
    id v5 = (void *)v3;
  }
  else {
    id v5 = v2;
  }
  id v6 = v5;

  uint64_t v7 = [v6 subAttachments];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100136E0C;
  v11[3] = &unk_10062ACD8;
  id v12 = v2;
  id v8 = v2;
  id v9 = [v7 ic_compactMap:v11];

  return (NSSet *)v9;
}

- (NSSet)subAttachmentIdentifiers
{
  v2 = [(ICAttachmentInspectorViewController *)self subAttachments];
  uint64_t v3 = [v2 ic_compactMap:&stru_10062AD18];

  return (NSSet *)v3;
}

- (NSString)subAttachmentIdentifiersString
{
  v2 = [(ICAttachmentInspectorViewController *)self subAttachmentIdentifiers];
  uint64_t v3 = [v2 allObjects];
  id v4 = [v3 sortedArrayUsingSelector:"compare:"];

  id v5 = [v4 componentsJoinedByString:@"\n"];

  return (NSString *)v5;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v3 = @"Summary";
      break;
    case 2:
      id v4 = [(ICAttachmentInspectorViewController *)self attachment];
      id v5 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v4 handwritingSummaryVersion]);
      +[NSString localizedStringWithFormat:@"Handwriting Summary (v%@)", v5];
      goto LABEL_7;
    case 3:
      id v4 = [(ICAttachmentInspectorViewController *)self attachment];
      id v5 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v4 imageClassificationSummaryVersion]);
      +[NSString localizedStringWithFormat:@"Image Classification (v%@)", v5];
      goto LABEL_7;
    case 4:
      id v4 = [(ICAttachmentInspectorViewController *)self attachment];
      id v5 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v4 ocrSummaryVersion]);
      +[NSString localizedStringWithFormat:@"OCR Summary (v%@)", v5];
LABEL_7:
      uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 5:
      uint64_t v3 = @"Additional Indexable";
      break;
    case 6:
      uint64_t v3 = @"Media URL";
      break;
    case 7:
      uint64_t v3 = @"Spotlight Attributes";
      break;
    case 8:
      uint64_t v3 = @"Export Drawing";
      break;
    default:
      uint64_t v3 = @"Attachment";
      break;
  }

  return v3;
}

- (void)updateViews
{
  uint64_t v3 = [(ICAttachmentInspectorViewController *)self attachment];
  id v4 = [v3 image];
  id v5 = [(ICAttachmentInspectorViewController *)self attachmentImageView];
  [v5 setImage:v4];

  id v6 = [(ICAttachmentInspectorViewController *)self tableView];
  [v6 reloadData];
}

- (void)startCoreSpotlightSearch
{
  uint64_t v3 = [(ICAttachmentInspectorViewController *)self searchOperationQueue];
  [v3 cancelAllOperations];

  id v4 = [(ICAttachmentInspectorViewController *)self attachment];
  id v5 = [v4 note];
  id v6 = [v5 searchIndexingIdentifier];
  uint64_t v7 = +[NSString stringWithFormat:@"(_ICItemRelatedNoteUniqueIdentifier == \"%@\")", v6];

  id v8 = objc_alloc((Class)ICSearchQueryOperation);
  CFStringRef v17 = @"_kMDItemSDBInfo";
  id v9 = +[NSArray arrayWithObjects:&v17 count:1];
  id v10 = [v8 initWithQueryString:v7 rankingQueries:&__NSArray0__struct attributes:v9];

  objc_initWeak(&location, v10);
  objc_initWeak(&from, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001373DC;
  v12[3] = &unk_1006255C0;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  [v10 setCompletionBlock:v12];
  id v11 = [(ICAttachmentInspectorViewController *)self searchOperationQueue];
  [v11 addOperation:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (UIImageView)attachmentImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setAttachmentImageView:(id)a3
{
}

- (NSOperationQueue)searchOperationQueue
{
  return self->_searchOperationQueue;
}

- (void)setSearchOperationQueue:(id)a3
{
}

- (NSArray)spotlightResults
{
  return self->_spotlightResults;
}

- (void)setSpotlightResults:(id)a3
{
}

- (BOOL)regenerateMetadataOnClose
{
  return self->_regenerateMetadataOnClose;
}

- (void)setRegenerateMetadataOnClose:(BOOL)a3
{
  self->_regenerateMetadataOnClose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightResults, 0);
  objc_storeStrong((id *)&self->_searchOperationQueue, 0);
  objc_destroyWeak((id *)&self->_attachmentImageView);

  objc_storeStrong((id *)&self->_attachment, 0);
}

@end