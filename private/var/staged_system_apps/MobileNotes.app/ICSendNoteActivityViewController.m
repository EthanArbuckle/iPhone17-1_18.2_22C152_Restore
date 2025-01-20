@interface ICSendNoteActivityViewController
+ (id)fallbackImageWithNote:(id)a3;
- (BOOL)_canShowWhileLocked;
- (ICNAEventReporter)eventReporter;
- (ICNote)note;
- (ICSendNoteActivityViewController)initWithNote:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5;
- (ICShareNoteExporter)noteExporter;
- (NSArray)additionalExcludedTypes;
- (id)excludedActivityTypes;
- (void)setAdditionalExcludedTypes:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setNote:(id)a3;
- (void)setNoteExporter:(id)a3;
@end

@implementation ICSendNoteActivityViewController

- (ICSendNoteActivityViewController)initWithNote:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v34 = a5;
  id v39 = a5;
  v10 = +[NSMutableArray array];
  v11 = +[NSMutableArray array];
  if ([v8 canBeSharedViaICloud]
    && ([v8 isSharedThroughParent] & 1) == 0
    && [v8 canCurrentUserShare])
  {
    id v12 = objc_alloc_init((Class)NSItemProvider);
    +[ICCollaborationController sharedInstance];
    v14 = v13 = v11;
    [v14 registerShareForObject:v8 itemProvider:v12 generateThumbnails:1];

    v11 = v13;
    [v10 addObject:v12];
  }
  if (+[ICFeatureFlags pagesHandoffEnabled]
    && +[ICPagesHandoffManager canLaunchPagesForNote:v8])
  {
    v15 = [[ICPagesHandoffActivity alloc] initWithNote:v8 viewController:v9];
    [v11 addObject:v15];
  }
  id v38 = objc_alloc_init((Class)ICShareNoteExporter);
  v37 = [v8 noteActivityItemsForSharingWithNoteExporter:];
  [v10 addObjectsFromArray:];
  v36 = [v8 airDropActivityItemSource];
  [v10 ic_addNonNilObject:];
  v16 = +[ICCollaborationController shareSheetNoteThumbnailImage];
  if (!v16)
  {
    v16 = [(id)objc_opt_class() fallbackImageWithNote:v8];
  }
  v17 = [ICLinkPresentationMetadata alloc];
  v18 = [v8 title];
  v35 = self;
  v19 = [(ICLinkPresentationMetadata *)v17 initWithTitle:v18 image:v16];

  [v10 addObject:v19];
  v20 = [ICNotePrintActivityItemSource alloc];
  v40 = v9;
  v21 = [v9 view];
  [v21 bounds];
  v24 = -[ICNotePrintActivityItemSource initWithNote:size:](v20, "initWithNote:size:", v8, v22, v23);

  v25 = +[UIPrintInfo printInfo];
  v26 = [v8 title];
  [v25 setJobName:v26];

  v42[0] = v25;
  v42[1] = v24;
  v27 = +[NSArray arrayWithObjects:v42 count:2];
  [v10 addObjectsFromArray:v27];

  id v28 = [v10 copy];
  v29 = v11;
  id v30 = [v11 copy];
  v41.receiver = v35;
  v41.super_class = (Class)ICSendNoteActivityViewController;
  v31 = [(ICSendNoteActivityViewController *)&v41 initWithActivityItems:v28 applicationActivities:v30];

  if (v31)
  {
    objc_storeStrong((id *)&v31->_note, a3);
    objc_storeStrong((id *)&v31->_noteExporter, v38);
    objc_storeStrong((id *)&v31->_eventReporter, v34);
  }

  return v31;
}

- (id)excludedActivityTypes
{
  id v3 = objc_alloc((Class)NSMutableArray);
  v10[0] = ICActivityTypeShareToNote;
  v10[1] = UIActivityTypeOpenInIBooks;
  v10[2] = UIActivityTypeSharePlay;
  v4 = +[NSArray arrayWithObjects:v10 count:3];
  id v5 = [v3 initWithArray:v4];

  v6 = [(ICSendNoteActivityViewController *)self additionalExcludedTypes];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = [(ICSendNoteActivityViewController *)self additionalExcludedTypes];
    [v5 addObjectsFromArray:v8];
  }

  return v5;
}

+ (id)fallbackImageWithNote:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)ICThumbnailConfiguration) initForNoteNavigationBarIconWithNote:v3 preferredSize:90.0];

  id v5 = +[ICThumbnailService sharedThumbnailService];
  v6 = [v5 thumbnailWithConfiguration:v4];
  id v7 = [v6 image];

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)additionalExcludedTypes
{
  return self->_additionalExcludedTypes;
}

- (void)setAdditionalExcludedTypes:(id)a3
{
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (ICShareNoteExporter)noteExporter
{
  return self->_noteExporter;
}

- (void)setNoteExporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteExporter, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);

  objc_storeStrong((id *)&self->_additionalExcludedTypes, 0);
}

@end