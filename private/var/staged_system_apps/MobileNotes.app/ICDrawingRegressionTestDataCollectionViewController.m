@interface ICDrawingRegressionTestDataCollectionViewController
- (ICDrawingRegressionTestDataCollectionViewController)initWithDrawingAttachments:(id)a3 description:(id)a4;
- (NSArray)cellImages;
- (NSArray)drawingAttachments;
- (NSArray)drawings;
- (NSLayoutConstraint)collectionViewHeightConstraint;
- (NSString)customDescription;
- (UICollectionView)collectionView;
- (UILabel)descriptionLabel;
- (UIScrollView)scrollView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)saveDataForDrawingsBaseURL:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)adjustCollectionViewHeight;
- (void)cancelButtonTapped:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)openTapToRadarWithTempDirectoryURL:(id)a3;
- (void)openURL:(id)a3;
- (void)selectAll;
- (void)sendRadarButtonTapped:(id)a3;
- (void)setCellImages:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewHeightConstraint:(id)a3;
- (void)setCustomDescription:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDrawingAttachments:(id)a3;
- (void)setDrawings:(id)a3;
- (void)setScrollView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ICDrawingRegressionTestDataCollectionViewController

- (ICDrawingRegressionTestDataCollectionViewController)initWithDrawingAttachments:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ICDrawingRegressionTestDataCollectionViewController;
  v8 = [(ICDrawingRegressionTestDataCollectionViewController *)&v32 init];
  if (v8 && [v6 count])
  {
    v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    v12 = [v6 firstObject];
    v13 = [v12 managedObjectContext];

    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = sub_10012CB68;
    v27 = &unk_100625A78;
    id v28 = v6;
    id v29 = v9;
    id v30 = v10;
    id v31 = v11;
    id v14 = v11;
    id v15 = v10;
    id v16 = v9;
    [v13 performBlockAndWait:&v24];
    v17 = [v16 copy:v24, v25, v26, v27];
    drawingAttachments = v8->_drawingAttachments;
    v8->_drawingAttachments = v17;

    v19 = (NSArray *)[v15 copy];
    drawings = v8->_drawings;
    v8->_drawings = v19;

    v21 = (NSArray *)[v14 copy];
    cellImages = v8->_cellImages;
    v8->_cellImages = v21;

    objc_storeStrong((id *)&v8->_customDescription, a4);
  }

  return v8;
}

- (void)viewDidLoad
{
  v139.receiver = self;
  v139.super_class = (Class)ICDrawingRegressionTestDataCollectionViewController;
  [(ICDrawingRegressionTestDataCollectionViewController *)&v139 viewDidLoad];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Sketches" value:&stru_10063F3D8 table:0];
  [(ICDrawingRegressionTestDataCollectionViewController *)self setTitle:v4];

  v5 = +[UIColor whiteColor];
  id v6 = [(ICDrawingRegressionTestDataCollectionViewController *)self view];
  [v6 setBackgroundColor:v5];

  id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelButtonTapped:"];
  v8 = [(ICDrawingRegressionTestDataCollectionViewController *)self navigationItem];
  [v8 setLeftBarButtonItem:v7];

  id v9 = objc_alloc((Class)UIBarButtonItem);
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Submit" value:&stru_10063F3D8 table:0];
  id v12 = [v9 initWithTitle:v11 style:2 target:self action:"sendRadarButtonTapped:"];
  v13 = [(ICDrawingRegressionTestDataCollectionViewController *)self navigationItem];
  [v13 setRightBarButtonItem:v12];

  id v14 = objc_alloc((Class)UIScrollView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v18 = [v14 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(ICDrawingRegressionTestDataCollectionViewController *)self setScrollView:v18];

  v19 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  [v19 setAlwaysBounceVertical:1];

  v20 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  v21 = [(ICDrawingRegressionTestDataCollectionViewController *)self view];
  v22 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  [v21 addSubview:v22];

  v23 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v24 = [v23 topAnchor];
  uint64_t v25 = [(ICDrawingRegressionTestDataCollectionViewController *)self view];
  v26 = [v25 safeAreaLayoutGuide];
  v27 = [v26 topAnchor];
  id v28 = [v24 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  id v29 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  id v30 = [v29 leadingAnchor];
  id v31 = [(ICDrawingRegressionTestDataCollectionViewController *)self view];
  objc_super v32 = [v31 safeAreaLayoutGuide];
  v33 = [v32 leadingAnchor];
  v34 = [v30 constraintEqualToAnchor:v33];
  [v34 setActive:1];

  v35 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v36 = [v35 trailingAnchor];
  v37 = [(ICDrawingRegressionTestDataCollectionViewController *)self view];
  v38 = [v37 safeAreaLayoutGuide];
  v39 = [v38 trailingAnchor];
  v40 = [v36 constraintEqualToAnchor:v39];
  [v40 setActive:1];

  v41 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v42 = [v41 bottomAnchor];
  v43 = [(ICDrawingRegressionTestDataCollectionViewController *)self view];
  v44 = [v43 safeAreaLayoutGuide];
  v45 = [v44 bottomAnchor];
  v46 = [v42 constraintEqualToAnchor:v45];
  [v46 setActive:1];

  id v47 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(ICDrawingRegressionTestDataCollectionViewController *)self setDescriptionLabel:v47];

  v48 = [(ICDrawingRegressionTestDataCollectionViewController *)self descriptionLabel];
  [v48 setNumberOfLines:0];

  v49 = [(ICDrawingRegressionTestDataCollectionViewController *)self customDescription];
  v50 = [(ICDrawingRegressionTestDataCollectionViewController *)self descriptionLabel];
  [v50 setText:v49];

  v51 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v52 = [v51 ic_fontWithSingleLineA];
  v53 = [(ICDrawingRegressionTestDataCollectionViewController *)self descriptionLabel];
  [v53 setFont:v52];

  v54 = [(ICDrawingRegressionTestDataCollectionViewController *)self descriptionLabel];
  [v54 setTranslatesAutoresizingMaskIntoConstraints:0];

  v55 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v56 = [(ICDrawingRegressionTestDataCollectionViewController *)self descriptionLabel];
  [v55 addSubview:v56];

  id v57 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [v57 setMinimumLineSpacing:20.0];
  [v57 setMinimumInteritemSpacing:20.0];
  [v57 setSectionInset:0.0, 0.0, 0.0, 0.0];
  [v57 setItemSize:240.0, 240.0];
  id v58 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(ICDrawingRegressionTestDataCollectionViewController *)self setCollectionView:v58];

  v59 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  [v59 setTranslatesAutoresizingMaskIntoConstraints:0];

  v60 = +[UIColor whiteColor];
  v61 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  [v61 setBackgroundColor:v60];

  v62 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  [v62 setDataSource:self];

  v63 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  [v63 setDelegate:self];

  v64 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  [v64 setAllowsSelection:1];

  v65 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  [v65 setAllowsMultipleSelection:1];

  v66 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  uint64_t v67 = objc_opt_class();
  v68 = (objc_class *)objc_opt_class();
  v69 = NSStringFromClass(v68);
  [v66 registerClass:v67 forCellWithReuseIdentifier:v69];

  v70 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v71 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  [v70 addSubview:v71];

  v72 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v73 = [v72 contentLayoutGuide];
  v74 = [v73 topAnchor];
  v75 = [(ICDrawingRegressionTestDataCollectionViewController *)self descriptionLabel];
  v76 = [v75 topAnchor];
  v77 = [v74 constraintEqualToAnchor:v76 constant:-20.0];
  [v77 setActive:1];

  v78 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v79 = [v78 contentLayoutGuide];
  v80 = [v79 leadingAnchor];
  v81 = [(ICDrawingRegressionTestDataCollectionViewController *)self descriptionLabel];
  v82 = [v81 leadingAnchor];
  v83 = [v80 constraintEqualToAnchor:v82 constant:-20.0];
  [v83 setActive:1];

  v84 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v85 = [v84 contentLayoutGuide];
  v86 = [v85 trailingAnchor];
  v87 = [(ICDrawingRegressionTestDataCollectionViewController *)self descriptionLabel];
  v88 = [v87 trailingAnchor];
  v89 = [v86 constraintEqualToAnchor:v88 constant:20.0];
  [v89 setActive:1];

  v90 = [(ICDrawingRegressionTestDataCollectionViewController *)self descriptionLabel];
  v91 = [v90 bottomAnchor];
  v92 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  v93 = [v92 topAnchor];
  v94 = [v91 constraintEqualToAnchor:v93 constant:-20.0];
  [v94 setActive:1];

  v95 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v96 = [v95 contentLayoutGuide];
  v97 = [v96 leadingAnchor];
  v98 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  v99 = [v98 leadingAnchor];
  v100 = [v97 constraintEqualToAnchor:v99 constant:-20.0];
  [v100 setActive:1];

  v101 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v102 = [v101 contentLayoutGuide];
  v103 = [v102 trailingAnchor];
  v104 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  v105 = [v104 trailingAnchor];
  v106 = [v103 constraintEqualToAnchor:v105 constant:20.0];
  [v106 setActive:1];

  v107 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v108 = [v107 contentLayoutGuide];
  v109 = [v108 bottomAnchor];
  v110 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  v111 = [v110 bottomAnchor];
  v112 = [v109 constraintEqualToAnchor:v111 constant:20.0];
  [v112 setActive:1];

  v113 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  v114 = [v113 frameLayoutGuide];
  v115 = [v114 widthAnchor];
  v116 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v117 = [v116 widthAnchor];
  v118 = [v115 constraintEqualToAnchor:v117 constant:-40.0];
  [v118 setActive:1];

  v119 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  v120 = [v119 contentLayoutGuide];
  v121 = [v120 widthAnchor];
  v122 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  v123 = [v122 frameLayoutGuide];
  v124 = [v123 widthAnchor];
  v125 = [v121 constraintEqualToAnchor:v124 constant:-40.0];
  [v125 setActive:1];

  v126 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  v127 = [v126 frameLayoutGuide];
  v128 = [v127 centerXAnchor];
  v129 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  v130 = [v129 contentLayoutGuide];
  v131 = [v130 centerXAnchor];
  v132 = [v128 constraintEqualToAnchor:v131];
  [v132 setActive:1];

  v133 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  v134 = [v133 heightAnchor];
  v135 = [v134 constraintEqualToConstant:0.0];
  [(ICDrawingRegressionTestDataCollectionViewController *)self setCollectionViewHeightConstraint:v135];

  v136 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionViewHeightConstraint];
  [v136 setActive:0];

  v137 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  [v137 setScrollEnabled:0];

  v138 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  [v138 reloadData];

  [(ICDrawingRegressionTestDataCollectionViewController *)self selectAll];
  [(ICDrawingRegressionTestDataCollectionViewController *)self adjustCollectionViewHeight];
}

- (void)selectAll
{
  if ([(NSArray *)self->_drawings count])
  {
    unint64_t v3 = 0;
    do
    {
      v4 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
      v5 = +[NSIndexPath indexPathForRow:v3 inSection:0];
      [v4 selectItemAtIndexPath:v5 animated:0 scrollPosition:0];

      ++v3;
    }
    while (v3 < [(NSArray *)self->_drawings count]);
  }
}

- (void)adjustCollectionViewHeight
{
  unint64_t v3 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  [v3 setNeedsLayout];

  v4 = [(ICDrawingRegressionTestDataCollectionViewController *)self scrollView];
  [v4 layoutIfNeeded];

  v5 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  [v5 setNeedsLayout];

  id v6 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  [v6 layoutIfNeeded];

  id v7 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  [v7 contentSize];
  double v9 = v8;

  v10 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionViewHeightConstraint];
  [v10 setConstant:v9];

  id v11 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionViewHeightConstraint];
  [v11 setActive:1];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICDrawingRegressionTestDataCollectionViewController;
  [(ICDrawingRegressionTestDataCollectionViewController *)&v3 viewDidLayoutSubviews];
  [(ICDrawingRegressionTestDataCollectionViewController *)self adjustCollectionViewHeight];
}

- (void)cancelButtonTapped:(id)a3
{
}

- (void)openURL:(id)a3
{
  id v3 = a3;
  id v4 = +[UIApplication sharedApplication];
  [v4 openURL:v3 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)sendRadarButtonTapped:(id)a3
{
  id v4 = +[NSUUID UUID];
  v5 = [v4 UUIDString];

  id v6 = NSTemporaryDirectory();
  id v7 = +[NSURL fileURLWithPath:v6];
  double v8 = [v7 URLByAppendingPathComponent:v5 isDirectory:1];

  id v9 = objc_alloc_init((Class)NSFileManager);
  uint64_t v10 = 0;
  if ([v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v10])
  {
    [(ICDrawingRegressionTestDataCollectionViewController *)self openTapToRadarWithTempDirectoryURL:v8];
    [(ICDrawingRegressionTestDataCollectionViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)openTapToRadarWithTempDirectoryURL:(id)a3
{
  id v31 = [(ICDrawingRegressionTestDataCollectionViewController *)self saveDataForDrawingsBaseURL:a3];
  id v3 = objc_alloc_init((Class)NSURLComponents);
  [v3 setScheme:@"tap-to-radar"];
  [v3 setHost:@"new"];
  id v4 = +[NSMutableArray array];
  id v5 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentName" value:@"PencilKit"];
  [v4 addObject:v5];

  id v6 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentVersion" value:@"all"];
  [v4 addObject:v6];

  id v7 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentID" value:@"808171"];
  [v4 addObject:v7];

  id v8 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"AutoDiagnostics" value:@"0"];
  [v4 addObject:v8];

  id v9 = +[NSProcessInfo processInfo];
  uint64_t v10 = [v9 operatingSystemVersionString];

  id v29 = (void *)v10;
  id v11 = +[NSString stringWithFormat:@"Regression Test Data: %@", v10];
  id v12 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Title" value:v11];
  [v4 addObject:v12];

  id v13 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Classification" value:@"Other Bug"];
  [v4 addObject:v13];

  id v14 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Reproducibility" value:@"Not Applicable"];
  [v4 addObject:v14];

  id v15 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Description" value:@"Fullscreen drawing regression test data and images. Please note that your submission may contain erased strokes which are no longer visible."];
  [v4 addObject:v15];

  id v16 = +[NSMutableArray array];
  v17 = +[NSMutableArray array];
  if ([v31 count])
  {
    unint64_t v18 = 0;
    do
    {
      v19 = [v31 objectAtIndexedSubscript:v18];
      v20 = [v19 path];

      v21 = [v20 pathExtension];
      id v22 = [v21 compare:@"png" options:1];

      if (v22) {
        v23 = v16;
      }
      else {
        v23 = v17;
      }
      [v23 addObject:v20];

      ++v18;
    }
    while ((unint64_t)[v31 count] > v18);
  }
  if ([v17 count])
  {
    v24 = [v17 componentsJoinedByString:@","];
    id v25 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Screenshot" value:v24];
    [v4 addObject:v25];
  }
  if ([v16 count])
  {
    v26 = [v16 componentsJoinedByString:@","];
    id v27 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Attachments" value:v26];
    [v4 addObject:v27];
  }
  [v3 setQueryItems:v4];
  id v28 = [v3 URL];
  [(ICDrawingRegressionTestDataCollectionViewController *)self openURL:v28];
}

- (id)saveDataForDrawingsBaseURL:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  id v7 = [v6 indexPathsForSelectedItems];

  id obj = v7;
  id v23 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v29 + 1) + 8 * i) item];
        uint64_t v10 = [(ICDrawingRegressionTestDataCollectionViewController *)self drawings];
        id v11 = [v10 objectAtIndexedSubscript:v9];

        id v12 = [v11 serializeWithPathData:1];
        id v13 = +[NSString stringWithFormat:@"/drawing_%d.data", v9];
        id v14 = [v4 URLByAppendingPathComponent:v13 isDirectory:0];

        [v12 writeToURL:v14 atomically:1];
        [v5 addObject:v14];
        id v15 = [(ICDrawingRegressionTestDataCollectionViewController *)self drawingAttachments];
        id v16 = [v15 objectAtIndexedSubscript:v9];

        v17 = [v16 managedObjectContext];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10012E468;
        v24[3] = &unk_1006290E8;
        id v25 = v16;
        id v26 = v4;
        id v28 = v9;
        id v27 = v5;
        id v18 = v16;
        [v17 performBlockAndWait:v24];
      }
      id v23 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v23);
  }

  v19 = +[NSArray arrayWithArray:v5];

  return v19;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = [(ICDrawingRegressionTestDataCollectionViewController *)self navigationItem];
  id v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:1];
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v9 = [(ICDrawingRegressionTestDataCollectionViewController *)self collectionView];
  id v5 = [v9 indexPathsForSelectedItems];
  BOOL v6 = [v5 count] != 0;
  id v7 = [(ICDrawingRegressionTestDataCollectionViewController *)self navigationItem];
  id v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:v6];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  uint64_t v10 = [v6 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v7];

  id v11 = [v10 contentView];
  id v12 = [v11 subviews];
  id v13 = [v12 copy];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * i) removeFromSuperview];
      }
      id v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v16);
  }

  v19 = [(ICDrawingRegressionTestDataCollectionViewController *)self cellImages];
  v20 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  id v21 = [objc_alloc((Class)UIImageView) initWithImage:v20];
  uint64_t v22 = [v21 layer];
  [v22 setMinificationFilter:kCAFilterTrilinear];

  [v21 setContentMode:1];
  id v23 = [v10 contentView];
  [v23 addSubview:v21];

  v24 = [v10 contentView];
  [v24 bounds];
  [v21 setFrame:];

  id v25 = +[UIColor lightGrayColor];
  id v26 = [v25 CGColor];
  id v27 = [v10 layer];
  [v27 setBorderColor:v26];

  id v28 = [v10 layer];
  [v28 setBorderWidth:0.5];

  long long v29 = [v10 layer];
  [v29 setCornerRadius:8.0];

  return v10;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(ICDrawingRegressionTestDataCollectionViewController *)self cellImages];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (NSArray)drawingAttachments
{
  return self->_drawingAttachments;
}

- (void)setDrawingAttachments:(id)a3
{
}

- (NSArray)drawings
{
  return self->_drawings;
}

- (void)setDrawings:(id)a3
{
}

- (NSArray)cellImages
{
  return self->_cellImages;
}

- (void)setCellImages:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (NSString)customDescription
{
  return self->_customDescription;
}

- (void)setCustomDescription:(id)a3
{
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (void)setCollectionViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_customDescription, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_cellImages, 0);
  objc_storeStrong((id *)&self->_drawings, 0);

  objc_storeStrong((id *)&self->_drawingAttachments, 0);
}

@end