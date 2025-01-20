@interface PUWallpaperNightlySuggestionsViewController
- (PUWallpaperNightlySuggestionsPosterConfiguration)posterConfiguration;
- (PUWallpaperNightlySuggestionsViewController)initWithSpec:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)nextDate:(id)a3;
- (void)previousDate:(id)a3;
- (void)setPosterConfiguration:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUWallpaperNightlySuggestionsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (PUWallpaperNightlySuggestionsPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (void)setPosterConfiguration:(id)a3
{
  v5 = (PUWallpaperNightlySuggestionsPosterConfiguration *)a3;
  if (self->_posterConfiguration != v5)
  {
    objc_storeStrong((id *)&self->_posterConfiguration, a3);
    [(PUWallpaperNightlySuggestionsDataSource *)self->_dataSource setPosterConfiguration:v5];
  }
}

- (void)previousDate:(id)a3
{
  -[NSDate dateByAddingTimeInterval:](self->_currentDate, "dateByAddingTimeInterval:", a3, -86400.0);
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentDate = self->_currentDate;
  self->_currentDate = v4;

  v6 = self->_currentDate;
  dataSource = self->_dataSource;
  [(PUWallpaperNightlySuggestionsDataSource *)dataSource setDate:v6];
}

- (void)nextDate:(id)a3
{
  -[NSDate dateByAddingTimeInterval:](self->_currentDate, "dateByAddingTimeInterval:", a3, 86400.0);
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currentDate = self->_currentDate;
  self->_currentDate = v4;

  v6 = self->_currentDate;
  dataSource = self->_dataSource;
  [(PUWallpaperNightlySuggestionsDataSource *)dataSource setDate:v6];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(PUPassiveContentDataSource *)self->_dataSource count];
}

- (void)viewDidLoad
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  currentDate = self->_currentDate;
  self->_currentDate = v3;

  v9.receiver = self;
  v9.super_class = (Class)PUWallpaperNightlySuggestionsViewController;
  [(PUPassiveContentSummaryViewController *)&v9 viewDidLoad];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1CC8]) initWithTarget:self action:sel_nextDate_];
  [v5 setDirection:2];
  v6 = [(PUWallpaperNightlySuggestionsViewController *)self view];
  [v6 addGestureRecognizer:v5];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1CC8]) initWithTarget:self action:sel_previousDate_];
  [v7 setDirection:1];
  v8 = [(PUWallpaperNightlySuggestionsViewController *)self view];
  [v8 addGestureRecognizer:v7];

  [(PUWallpaperNightlySuggestionsDataSource *)self->_dataSource setDate:self->_currentDate];
  [(PUWallpaperNightlySuggestionsDataSource *)self->_dataSource setPosterConfiguration:self->_posterConfiguration];
}

- (PUWallpaperNightlySuggestionsViewController)initWithSpec:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [PUWallpaperNightlySuggestionsDataSource alloc];
  v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  v7 = [(PUWallpaperNightlySuggestionsDataSource *)v5 initWithPhotoLibrary:v6];

  v8 = [(PUWallpaperNightlySuggestionsDataSource *)v7 delegates];
  [v8 addPointer:self];

  v13[0] = v7;
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12.receiver = self;
  v12.super_class = (Class)PUWallpaperNightlySuggestionsViewController;
  v10 = [(PUPassiveContentSummaryViewController *)&v12 initWithSpec:v4 dataSource:v9];

  if (v10) {
    objc_storeStrong((id *)&v10->_dataSource, v7);
  }

  return v10;
}

@end