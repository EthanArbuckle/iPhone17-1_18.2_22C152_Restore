@interface MFMessageInfoViewController
+ (id)log;
- (BOOL)_isConversation;
- (BOOL)_shouldDisplayContact;
- (BOOL)canSearchForContactFromContactCardInteractions:(id)a3;
- (CNContactStore)contactStore;
- (CNContactViewController)contactViewController;
- (MFMessageInfoViewController)initWithCoder:(id)a3;
- (MFMessageInfoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MFMessageInfoViewController)initWithViewModel:(id)a3 contactsStore:(id)a4;
- (MFMessageInfoViewController)initWithViewModel:(id)a3 contactsStore:(id)a4 attachmentURLs:(id)a5 richLinkURLs:(id)a6 numberOfMessagesInConversation:(int64_t)a7;
- (MFMessageInfoViewControllerDelegate)delegate;
- (MessageHeaderViewModel)viewModel;
- (NSArray)conversationAttachmentURLs;
- (NSArray)items;
- (NSArray)participants;
- (NSArray)richLinkURLs;
- (NSArray)sections;
- (NSCache)imageCache;
- (NSCache)richLinkCache;
- (NSDateFormatter)dateFormatter;
- (NSString)fileTitle;
- (NSURL)fileURL;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (UICollectionViewSupplementaryRegistration)supplementaryRegistration;
- (id)_URLForAttachmentURL:(id)a3;
- (id)_attachmentSectionLayout;
- (id)_contactToDisplayForRichLink:(id)a3;
- (id)_contactToDisplayForURL:(id)a3;
- (id)_contactViewControllerForAddress:(id)a3;
- (id)_dateToDisplayForURL:(id)a3;
- (id)_linkSectionLayout;
- (id)_photoSectionLayout;
- (id)_subjectToDisplay;
- (id)createCollectionViewLayout;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)_dataOwnerForCopy;
- (int64_t)_dataOwnerForPaste;
- (int64_t)numberOfMessagesInConversation;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)_close:(id)a3;
- (void)_generateQuickLookThumbnail:(id)a3 indexPath:(id)a4 item:(id)a5;
- (void)_generateRichLink:(id)a3 item:(id)a4;
- (void)_openAttachmentWithPreview:(id)a3;
- (void)_openContactCard:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)messageViewControllerDidChooseAddress:(id)a3 contactViewController:(id)a4;
- (void)setCollectionView:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactViewController:(id)a3;
- (void)setConversationAttachmentURLs:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileTitle:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setItems:(id)a3;
- (void)setNumberOfMessagesInConversation:(int64_t)a3;
- (void)setParticipants:(id)a3;
- (void)setRichLinkCache:(id)a3;
- (void)setRichLinkURLs:(id)a3;
- (void)setSections:(id)a3;
- (void)setSupplementaryRegistration:(id)a3;
- (void)viewDidLoad;
@end

@implementation MFMessageInfoViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014720;
  block[3] = &unk_10003C9E0;
  block[4] = a1;
  if (qword_1000485B8 != -1) {
    dispatch_once(&qword_1000485B8, block);
  }
  v2 = (void *)qword_1000485B0;

  return v2;
}

- (MFMessageInfoViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  [(MFMessageInfoViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFMessageInfoViewController initWithCoder:]", "MFMessageInfoViewController.m", 103, "0");
}

- (MFMessageInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(MFMessageInfoViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFMessageInfoViewController initWithNibName:bundle:]", "MFMessageInfoViewController.m", 104, "0");
}

- (MFMessageInfoViewController)initWithViewModel:(id)a3 contactsStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFMessageInfoViewController;
  v9 = [(MFMessageInfoViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
  }

  return v10;
}

- (MFMessageInfoViewController)initWithViewModel:(id)a3 contactsStore:(id)a4 attachmentURLs:(id)a5 richLinkURLs:(id)a6 numberOfMessagesInConversation:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MFMessageInfoViewController;
  v17 = [(MFMessageInfoViewController *)&v20 initWithNibName:0 bundle:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_viewModel, a3);
    objc_storeStrong((id *)&v18->_contactStore, a4);
    v18->_numberOfMessagesInConversation = a7;
    objc_storeStrong((id *)&v18->_conversationAttachmentURLs, a5);
    objc_storeStrong((id *)&v18->_richLinkURLs, a6);
  }

  return v18;
}

- (void)viewDidLoad
{
  v67.receiver = self;
  v67.super_class = (Class)MFMessageInfoViewController;
  [(MFMessageInfoViewController *)&v67 viewDidLoad];
  v3 = _EFLocalizedString();
  [(MFMessageInfoViewController *)self setTitle:v3];

  v4 = [(MFMessageInfoViewController *)self navigationItem];
  [v4 setStyle:0];

  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:self action:"_close:"];
  v6 = [(MFMessageInfoViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v5];

  id v7 = objc_alloc_init((Class)NSCache);
  [(MFMessageInfoViewController *)self setImageCache:v7];

  id v8 = objc_alloc_init((Class)NSCache);
  [(MFMessageInfoViewController *)self setRichLinkCache:v8];

  id v9 = objc_alloc_init((Class)NSDateFormatter);
  [(MFMessageInfoViewController *)self setDateFormatter:v9];

  v10 = [(MFMessageInfoViewController *)self dateFormatter];
  [v10 setDateStyle:1];

  id v11 = objc_alloc((Class)UICollectionView);
  objc_super v12 = [(MFMessageInfoViewController *)self createCollectionViewLayout];
  id v13 = [v11 initWithFrame:v12 origin:CGRectZero.origin size:CGRectZero.size];

  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v14 = +[UIColor systemGroupedBackgroundColor];
  [v13 setBackgroundColor:v14];

  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_10001551C;
  v66[3] = &unk_10003CF08;
  v66[4] = self;
  v45 = +[UICollectionViewCellRegistration registrationWithCellClass:objc_opt_class() configurationHandler:v66];
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_100015774;
  v65[3] = &unk_10003CF30;
  v65[4] = self;
  v44 = +[UICollectionViewCellRegistration registrationWithCellClass:objc_opt_class() configurationHandler:v65];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_100015800;
  v64[3] = &unk_10003CF58;
  v64[4] = self;
  v43 = +[UICollectionViewCellRegistration registrationWithCellClass:objc_opt_class() configurationHandler:v64];
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_100015B68;
  v63[3] = &unk_10003CF80;
  v63[4] = self;
  v42 = +[UICollectionViewCellRegistration registrationWithCellClass:objc_opt_class() configurationHandler:v63];
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_100015D8C;
  v62[3] = &unk_10003CFA8;
  v62[4] = self;
  v41 = +[UICollectionViewCellRegistration registrationWithCellClass:objc_opt_class() configurationHandler:v62];
  id v15 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100015E5C;
  v56[3] = &unk_10003CFD0;
  id v34 = v44;
  id v57 = v34;
  id v36 = v42;
  id v58 = v36;
  id v35 = v43;
  id v59 = v35;
  id v37 = v41;
  id v60 = v37;
  id v33 = v45;
  id v61 = v33;
  id v46 = [v15 initWithCollectionView:v13 cellProvider:v56];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v16 = objc_opt_class();
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1000160F4;
  v53[3] = &unk_10003CFF8;
  objc_copyWeak(&v54, &location);
  v40 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:v16 elementKind:UICollectionElementKindSectionHeader configurationHandler:v53];
  uint64_t v17 = objc_opt_class();
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100016264;
  v51[3] = &unk_10003CFF8;
  objc_copyWeak(&v52, &location);
  v18 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:v17 elementKind:UICollectionElementKindSectionHeader configurationHandler:v51];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000163F4;
  v47[3] = &unk_10003D020;
  v47[4] = self;
  id v19 = v13;
  id v48 = v19;
  id v39 = v18;
  id v49 = v39;
  id v38 = v40;
  id v50 = v38;
  [v46 setSupplementaryViewProvider:v47];
  id v20 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  sub_100016628(self);
  for (unint64_t i = 0; ; ++i)
  {
    v22 = [(MFMessageInfoViewController *)self sections];
    BOOL v23 = i < (unint64_t)[v22 count];

    if (!v23) {
      break;
    }
    v24 = [(MFMessageInfoViewController *)self sections];
    v25 = [v24 objectAtIndexedSubscript:i];
    v68 = v25;
    v26 = +[NSArray arrayWithObjects:&v68 count:1];
    [v20 appendSectionsWithIdentifiers:v26];

    v27 = [(MFMessageInfoViewController *)self items];
    v28 = [v27 objectAtIndexedSubscript:i];
    v29 = [(MFMessageInfoViewController *)self sections];
    v30 = [v29 objectAtIndexedSubscript:i];
    [v20 appendItemsWithIdentifiers:v28 intoSectionWithIdentifier:v30];
  }
  [v46 applySnapshotUsingReloadData:v20];
  [v19 setDataSource:v46];
  [v19 setDelegate:self];
  v31 = [(MFMessageInfoViewController *)self view];
  [v31 addSubview:v19];

  v32 = [(MFMessageInfoViewController *)self view];
  [v19 mf_pinToView:v32];

  [(MFMessageInfoViewController *)self setCollectionView:v19];
  [(MFMessageInfoViewController *)self setDataSource:v46];

  objc_destroyWeak(&v52);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);
}

- (id)createCollectionViewLayout
{
  id v3 = [objc_alloc((Class)UICollectionLayoutListConfiguration) initWithAppearance:2];
  [v3 setHeaderMode:1];
  id v4 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100017550;
  id v11 = &unk_10003D048;
  objc_super v12 = self;
  id v5 = v3;
  id v13 = v5;
  id v6 = [v4 initWithSectionProvider:&v8];
  if (_os_feature_enabled_impl()) {
    [v6 registerClass:objc_opt_class() forDecorationViewOfKind:@"section-background-element-kind" v8, v9, v10, v11, v12];
  }

  return v6;
}

- (id)_attachmentSectionLayout
{
  v2 = +[NSCollectionLayoutDimension fractionalWidthDimension:0.333333333];
  id v3 = +[NSCollectionLayoutDimension fractionalHeightDimension:0.55];
  id v4 = +[NSCollectionLayoutSize sizeWithWidthDimension:v2 heightDimension:v3];

  id v5 = +[NSCollectionLayoutItem itemWithLayoutSize:v4];
  [v5 setContentInsets:5.0, 5.0, 5.0, 5.0];
  id v6 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  id v7 = +[NSCollectionLayoutDimension estimatedDimension:275.0];
  id v8 = +[NSCollectionLayoutSize sizeWithWidthDimension:v6 heightDimension:v7];

  uint64_t v9 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v8 repeatingSubitem:v5 count:3];
  v10 = +[NSCollectionLayoutSpacing fixedSpacing:2.0];
  [v9 setInterItemSpacing:v10];

  id v11 = +[NSCollectionLayoutSection sectionWithGroup:v9];
  [v11 setContentInsets:0.0, 20.0, 0.0, 20.0];
  objc_super v12 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  id v13 = +[NSCollectionLayoutDimension estimatedDimension:275.0];
  id v14 = +[NSCollectionLayoutSize sizeWithWidthDimension:v12 heightDimension:v13];

  id v15 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v14 elementKind:UICollectionElementKindSectionHeader alignment:1];
  v21 = v15;
  uint64_t v16 = +[NSArray arrayWithObjects:&v21 count:1];
  [v11 setBoundarySupplementaryItems:v16];

  uint64_t v17 = +[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:@"section-background-element-kind"];
  [v17 setContentInsets:0.0, 20.0, 0.0, 20.0];
  id v20 = v17;
  v18 = +[NSArray arrayWithObjects:&v20 count:1];
  [v11 setDecorationItems:v18];

  [v11 _setPostBoundaryPadding:20.0];

  return v11;
}

- (id)_photoSectionLayout
{
  id v3 = +[NSCollectionLayoutDimension fractionalWidthDimension:0.333333333];
  id v4 = [(MFMessageInfoViewController *)self view];
  [v4 frame];
  id v6 = +[NSCollectionLayoutDimension fractionalHeightDimension:v5 * 0.4 / 400.0];
  id v7 = +[NSCollectionLayoutSize sizeWithWidthDimension:v3 heightDimension:v6];

  id v8 = +[NSCollectionLayoutItem itemWithLayoutSize:v7];
  [v8 setContentInsets:1.0, 1.0, 1.0, 1.0];
  uint64_t v9 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v10 = +[NSCollectionLayoutDimension estimatedDimension:275.0];
  id v11 = +[NSCollectionLayoutSize sizeWithWidthDimension:v9 heightDimension:v10];

  objc_super v12 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v11 repeatingSubitem:v8 count:3];
  id v13 = +[NSCollectionLayoutSpacing fixedSpacing:1.0];
  [v12 setInterItemSpacing:v13];

  id v14 = +[NSCollectionLayoutSection sectionWithGroup:v12];
  [v14 setContentInsets:0.0, 35.0, 0.0, 35.0];
  id v15 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  uint64_t v16 = +[NSCollectionLayoutDimension estimatedDimension:275.0];
  uint64_t v17 = +[NSCollectionLayoutSize sizeWithWidthDimension:v15 heightDimension:v16];

  v18 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v17 elementKind:UICollectionElementKindSectionHeader alignment:1];
  [v18 setContentInsets:0.0, -15.0, 0.0, -15.0];
  v24 = v18;
  id v19 = +[NSArray arrayWithObjects:&v24 count:1];
  [v14 setBoundarySupplementaryItems:v19];

  id v20 = +[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:@"section-background-element-kind"];
  [v20 setContentInsets:0.0, 20.0, -10.0, 20.0];
  BOOL v23 = v20;
  v21 = +[NSArray arrayWithObjects:&v23 count:1];
  [v14 setDecorationItems:v21];

  [v14 _setPostBoundaryPadding:20.0];

  return v14;
}

- (id)_linkSectionLayout
{
  id v3 = +[NSCollectionLayoutDimension fractionalWidthDimension:0.5];
  id v4 = [(MFMessageInfoViewController *)self view];
  [v4 frame];
  id v6 = +[NSCollectionLayoutDimension fractionalHeightDimension:v5 * 0.5 / 400.0];
  id v7 = +[NSCollectionLayoutSize sizeWithWidthDimension:v3 heightDimension:v6];

  id v8 = +[NSCollectionLayoutItem itemWithLayoutSize:v7];
  [v8 setContentInsets:1.0, 1.0, 1.0, 1.0];
  uint64_t v9 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v10 = +[NSCollectionLayoutDimension estimatedDimension:275.0];
  id v11 = +[NSCollectionLayoutSize sizeWithWidthDimension:v9 heightDimension:v10];

  objc_super v12 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v11 repeatingSubitem:v8 count:2];
  id v13 = +[NSCollectionLayoutSpacing fixedSpacing:5.0];
  [v12 setInterItemSpacing:v13];

  id v14 = +[NSCollectionLayoutSection sectionWithGroup:v12];
  [v14 setContentInsets:0.0, 35.0, 0.0, 35.0];
  [v14 setInterGroupSpacing:5.0];
  id v15 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  uint64_t v16 = +[NSCollectionLayoutDimension estimatedDimension:275.0];
  uint64_t v17 = +[NSCollectionLayoutSize sizeWithWidthDimension:v15 heightDimension:v16];

  v18 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v17 elementKind:UICollectionElementKindSectionHeader alignment:1];
  [v18 setContentInsets:0.0, -15.0, 0.0, -15.0];
  v24 = v18;
  id v19 = +[NSArray arrayWithObjects:&v24 count:1];
  [v14 setBoundarySupplementaryItems:v19];

  id v20 = +[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:@"section-background-element-kind"];
  [v20 setContentInsets:0.0, 20.0, -10.0, 20.0];
  BOOL v23 = v20;
  v21 = +[NSArray arrayWithObjects:&v23 count:1];
  [v14 setDecorationItems:v21];

  [v14 _setPostBoundaryPadding:20.0];

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v27 = a4;
  double v5 = [(MFMessageInfoViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:[v27 section]];
  unsigned __int8 v7 = [v6 isEqual:@"Subject"];

  if ((v7 & 1) == 0)
  {
    id v8 = [(MFMessageInfoViewController *)self sections];
    uint64_t v9 = [v8 objectAtIndexedSubscript:[v27 section]];
    if ([v9 isEqual:@"Documents"])
    {
    }
    else
    {
      v10 = [(MFMessageInfoViewController *)self sections];
      id v11 = [v10 objectAtIndexedSubscript:[v27 section]];
      unsigned int v12 = [v11 isEqual:@"Photos"];

      if (!v12)
      {
        v18 = [(MFMessageInfoViewController *)self sections];
        id v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v27, "section"));
        unsigned int v20 = [v19 isEqual:@"Links"];

        if (v20)
        {
          v21 = [(MFMessageInfoViewController *)self items];
          v22 = objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v27, "section"));
          BOOL v23 = [v22 objectAtIndexedSubscript:[v27 item]];
          id v13 = [v23 richLink];

          id v14 = +[UIApplication sharedApplication];
          [v14 openURL:v13 options:&__NSDictionary0__struct completionHandler:0];
        }
        else
        {
          v24 = [(MFMessageInfoViewController *)self items];
          v25 = objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v27, "section"));
          v26 = objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v27, "item"));
          id v13 = [v26 emailAddress];

          id v14 = [(MFMessageInfoViewController *)self delegate];
          if (objc_opt_respondsToSelector()) {
            [v14 messageInfoViewController:self didSelectAddress:v13 forAtomType:0];
          }
        }
        goto LABEL_6;
      }
    }
    id v13 = [(MFMessageInfoViewController *)self items];
    id v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v27, "section"));
    id v15 = [v14 objectAtIndexedSubscript:[v27 item]];
    uint64_t v16 = [v15 attachment];
    [(MFMessageInfoViewController *)self _openAttachmentWithPreview:v16];

LABEL_6:
    uint64_t v17 = [(MFMessageInfoViewController *)self collectionView];
    [v17 deselectItemAtIndexPath:v27 animated:0];
  }
}

- (void)_generateQuickLookThumbnail:(id)a3 indexPath:(id)a4 item:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = +[QLThumbnailGenerator sharedGenerator];
  id v10 = objc_alloc((Class)QLThumbnailGenerationRequest);
  id v11 = [v8 attachment];
  unsigned int v12 = [v11 url];
  id v13 = +[UIScreen mainScreen];
  [v13 scale];
  id v15 = [v10 initWithFileAtURL:v12 size:-1 scale:100.0 representationTypes:100.0];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100018A6C;
  v18[3] = &unk_10003D098;
  v18[4] = self;
  id v16 = v8;
  id v19 = v16;
  id v17 = v7;
  id v20 = v17;
  [v9 generateBestRepresentationForRequest:v15 completionHandler:v18];
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  double v5 = [AttachmentPreviewItem alloc];
  id v6 = [(MFMessageInfoViewController *)self fileURL];
  id v7 = [(MFMessageInfoViewController *)self fileTitle];
  id v8 = [(AttachmentPreviewItem *)v5 initWithUrl:v6 title:v7];

  return v8;
}

- (void)_openAttachmentWithPreview:(id)a3
{
  id v7 = a3;
  id v4 = objc_alloc_init((Class)QLPreviewController);
  [v4 setDataSource:self];
  double v5 = [v7 url];
  [(MFMessageInfoViewController *)self setFileURL:v5];

  id v6 = [v7 displayName];
  [(MFMessageInfoViewController *)self setFileTitle:v6];

  [(MFMessageInfoViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_openContactCard:(id)a3
{
  id v11 = [(MFMessageInfoViewController *)self _contactViewControllerForAddress:a3];
  if (v11)
  {
    id v4 = [(MFMessageInfoViewController *)self view];
    [v4 frame];
    double v6 = v5;
    id v7 = [(MFMessageInfoViewController *)self navigationController];
    [v7 setPreferredContentSize:320.0 v6];

    id v8 = [(MFMessageInfoViewController *)self view];
    [v8 frame];
    [v11 setPreferredContentSize:320.0, v9];

    id v10 = [(MFMessageInfoViewController *)self navigationController];
    [v10 pushViewController:v11 animated:1];
  }
}

- (id)_contactViewControllerForAddress:(id)a3
{
  id v4 = a3;
  double v5 = [(MFMessageInfoViewController *)self contactStore];
  double v6 = +[CNContactViewController descriptorForRequiredKeys];
  id v7 = +[MFMessageInfoViewController log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Load contact view controller using key descriptors: %@", buf, 0xCu);
  }

  id v8 = [v4 stringValue];
  v24 = v6;
  double v9 = +[NSArray arrayWithObjects:&v24 count:1];
  id v10 = [v5 em_fetchContactForEmailAddress:v8 keysToFetch:v9 createIfNeeded:1];

  if (v10)
  {
    if ([v10 hasBeenPersisted]
      && +[MFContactsManager isAuthorizedToUseContacts])
    {
      id v11 = +[CNContactViewController viewControllerForContact:v10];
      unsigned int v12 = [v4 emailAddressValue];
      if (v12)
      {
        id v13 = [v10 emailAddresses];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100019474;
        v20[3] = &unk_10003D0C0;
        id v21 = v12;
        double v14 = [v13 ef_firstObjectPassingTest:v20];

        id v15 = [v14 identifier];
      }
      else
      {
        id v15 = 0;
      }
      [v11 highlightPropertyWithKey:CNContactEmailAddressesKey identifier:v15];

      id v16 = v11;
    }
    else
    {
      id v16 = +[CNContactViewController viewControllerForUnknownContact:v10];
    }
    if (([MFContactsManager isAuthorizedToUseContacts] & 1) == 0) [v16 setActions:([v16 actions] & 0xFFFFFFFFFFFFFFDFLL)]; {
    [v16 setContactStore:v5];
    }
  }
  else
  {
    id v17 = +[MFMessageInfoViewController log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [v4 stringValue];
      sub_100021098(v18, (uint64_t)v6, buf, v17);
    }

    id v16 = 0;
  }

  return v16;
}

- (void)_generateRichLink:(id)a3 item:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  id v7 = [(MFMessageInfoViewController *)self richLinkCache];
  id v8 = [v6 richLink];
  double v9 = [v7 objectForKey:v8];

  if (!v9)
  {
    id v10 = objc_alloc_init((Class)LPLinkMetadata);
    id v11 = [v6 richLink];
    unsigned int v12 = [v11 absoluteString];
    [v10 setTitle:v12];

    id v13 = [v6 richLink];
    [v10 setURL:v13];

    double v14 = +[UIImage systemImageNamed:MFImageGlyphSearchDefaultLink];
    id v15 = [objc_alloc((Class)LPImage) initWithPlatformImage:v14];
    [v10 setImage:v15];

    id v16 = [(MFMessageInfoViewController *)self richLinkCache];
    id v17 = [v6 richLink];
    [v16 setObject:v10 forKey:v17];
  }
  id v18 = objc_alloc((Class)LPLinkView);
  id v19 = [v6 richLink];
  id v20 = [v18 initWithURL:v19];

  id v21 = [(MFMessageInfoViewController *)self richLinkCache];
  v22 = [v6 richLink];
  BOOL v23 = [v21 objectForKey:v22];
  [v20 setMetadata:v23];

  [v20 _setApplyCornerRadius:1];
  [v20 _setPreferredSizeClass:5];
  v24 = +[UIColor tertiarySystemBackgroundColor];
  [v20 _setOverrideBackgroundColor:v24];

  [v20 _setDisableTapGesture:1];
  [v31 setLinkView:v20];
  v25 = [v31 contentView];
  [v25 addSubview:v20];

  if ([(MFMessageInfoViewController *)self _shouldDisplayContact])
  {
    v26 = [v31 avatarView];
    id v27 = [v6 richLink];
    v28 = [(MFMessageInfoViewController *)self _contactToDisplayForRichLink:v27];
    v29 = [(MFMessageInfoViewController *)self contactStore];
    id v30 = [v26 displayPersonForEmailAddress:v28 brandIndicatorFuture:0 usingContactStore:v29];
  }
  else
  {
    v26 = [v31 avatarView];
    [v26 setHidden:1];
  }

  [v31 setNeedsLayout];
}

- (void)_close:(id)a3
{
}

- (int64_t)_dataOwnerForPaste
{
  return 3;
}

- (int64_t)_dataOwnerForCopy
{
  return 3;
}

- (void)messageViewControllerDidChooseAddress:(id)a3 contactViewController:(id)a4
{
  id v12 = a4;
  if (v12)
  {
    double v5 = [(MFMessageInfoViewController *)self view];
    [v5 frame];
    double v7 = v6;
    id v8 = [(MFMessageInfoViewController *)self navigationController];
    [v8 setPreferredContentSize:320.0, v7];

    double v9 = [(MFMessageInfoViewController *)self view];
    [v9 frame];
    [v12 setPreferredContentSize:320.0, v10];

    id v11 = [(MFMessageInfoViewController *)self navigationController];
    [v11 pushViewController:v12 animated:1];

    [(MFMessageInfoViewController *)self setContactViewController:v12];
  }
}

- (BOOL)_isConversation
{
  return [(MFMessageInfoViewController *)self numberOfMessagesInConversation] > 1;
}

- (BOOL)_shouldDisplayContact
{
  if (![(MFMessageInfoViewController *)self _isConversation]) {
    return 0;
  }
  id v3 = [(MFMessageInfoViewController *)self participants];
  BOOL v4 = (unint64_t)[v3 count] > 2;

  return v4;
}

- (id)_contactToDisplayForURL:(id)a3
{
  id v3 = +[SYDocumentAttributes documentAttributesForFileAtURL:a3];
  BOOL v4 = [v3 sender];
  double v5 = [v4 handle];

  return v5;
}

- (id)_contactToDisplayForRichLink:(id)a3
{
  id v3 = +[SYDocumentAttributes documentAttributesForFileAtURL:a3];
  BOOL v4 = [v3 sender];
  double v5 = [v4 handle];

  return v5;
}

- (id)_dateToDisplayForURL:(id)a3
{
  id v3 = +[SYDocumentAttributes documentAttributesForFileAtURL:a3];
  BOOL v4 = [v3 receivedDate];

  return v4;
}

- (id)_URLForAttachmentURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 absoluteString];
  double v5 = (char *)[v4 rangeOfString:@"Mail/"];
  uint64_t v7 = v6;

  id v8 = [v3 absoluteString];
  double v9 = [v8 substringToIndex:&v5[v7]];

  double v10 = [v3 absoluteString];
  id v11 = [v10 rangeOfString:@"AttachmentData/"];

  id v12 = [v3 absoluteString];
  id v13 = [v12 substringFromIndex:v11];

  double v14 = [v9 stringByAppendingString:v13];
  id v15 = +[NSURL fileURLWithPath:v14];
  id v16 = [objc_alloc((Class)EFSandboxedURLWrapper) initWithFileURL:v15 readOnly:1];
  id v17 = [v16 url];

  return v17;
}

- (id)_subjectToDisplay
{
  v2 = [(MFMessageInfoViewController *)self viewModel];
  id v3 = [v2 subject];
  BOOL v4 = [v3 subjectWithoutPrefix];

  return v4;
}

- (BOOL)canSearchForContactFromContactCardInteractions:(id)a3
{
  return 0;
}

- (MFMessageInfoViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFMessageInfoViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MessageHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (UICollectionViewSupplementaryRegistration)supplementaryRegistration
{
  return self->_supplementaryRegistration;
}

- (void)setSupplementaryRegistration:(id)a3
{
}

- (CNContactViewController)contactViewController
{
  return self->_contactViewController;
}

- (void)setContactViewController:(id)a3
{
}

- (int64_t)numberOfMessagesInConversation
{
  return self->_numberOfMessagesInConversation;
}

- (void)setNumberOfMessagesInConversation:(int64_t)a3
{
  self->_numberOfMessagesInConversation = a3;
}

- (NSArray)conversationAttachmentURLs
{
  return self->_conversationAttachmentURLs;
}

- (void)setConversationAttachmentURLs:(id)a3
{
}

- (NSArray)richLinkURLs
{
  return self->_richLinkURLs;
}

- (void)setRichLinkURLs:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSString)fileTitle
{
  return self->_fileTitle;
}

- (void)setFileTitle:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (NSCache)richLinkCache
{
  return self->_richLinkCache;
}

- (void)setRichLinkCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richLinkCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_fileTitle, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_richLinkURLs, 0);
  objc_storeStrong((id *)&self->_conversationAttachmentURLs, 0);
  objc_storeStrong((id *)&self->_contactViewController, 0);
  objc_storeStrong((id *)&self->_supplementaryRegistration, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end