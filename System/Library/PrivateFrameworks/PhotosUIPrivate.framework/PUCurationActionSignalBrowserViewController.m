@interface PUCurationActionSignalBrowserViewController
- (NSArray)availableActions;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setAvailableActions:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUCurationActionSignalBrowserViewController

- (void).cxx_destruct
{
}

- (void)setAvailableActions:(id)a3
{
}

- (NSArray)availableActions
{
  return self->_availableActions;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(PUCurationActionSignalBrowserViewController *)self availableActions];
  uint64_t v7 = [v5 row];

  id v10 = [v6 objectAtIndex:v7];

  v8 = [[PUCurationActionPeopleBrowserViewController alloc] initWithTraitContainer:v10];
  v9 = [(PUCurationActionSignalBrowserViewController *)self navigationController];
  [v9 pushViewController:v8 animated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"actionCellIdentifier" forIndexPath:v6];
  v8 = [(PUCurationActionSignalBrowserViewController *)self availableActions];
  uint64_t v9 = [v6 row];

  id v10 = [v8 objectAtIndex:v9];

  v11 = [v10 actionLabel];
  v12 = [v7 textLabel];
  [v12 setText:v11];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(PUCurationActionSignalBrowserViewController *)self availableActions];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)viewDidLoad
{
  v29[21] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)PUCurationActionSignalBrowserViewController;
  [(PUCurationActionSignalBrowserViewController *)&v28 viewDidLoad];
  v3 = [(PUCurationActionSignalBrowserViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"actionCellIdentifier"];

  v27 = [[PUCurationTraitContainer alloc] initWithLabel:@"None" traitValue:0 highPrecision:0.95 operatingPoint:0.655 highRecall:0.5];
  v29[0] = v27;
  v26 = [[PUCurationTraitContainer alloc] initWithLabel:@"Other Actions" traitValue:1 highPrecision:0.671 operatingPoint:0.415 highRecall:0.3];
  v29[1] = v26;
  v24 = [[PUCurationTraitContainer alloc] initWithLabel:@"Walking" traitValue:2 highPrecision:0.785 operatingPoint:0.635 highRecall:0.533];
  v29[2] = v24;
  v23 = [[PUCurationTraitContainer alloc] initWithLabel:@"Clapping" traitValue:3 highPrecision:0.92 operatingPoint:0.726 highRecall:0.6];
  v29[3] = v23;
  v22 = [[PUCurationTraitContainer alloc] initWithLabel:@"Jumping /Leaping" traitValue:4 highPrecision:0.5 operatingPoint:0.406 highRecall:0.25];
  v29[4] = v22;
  v21 = [[PUCurationTraitContainer alloc] initWithLabel:@"Running /Jogging" traitValue:5 highPrecision:0.65 operatingPoint:0.532 highRecall:0.376];
  v29[5] = v21;
  v20 = [[PUCurationTraitContainer alloc] initWithLabel:@"Kissing" traitValue:6 highPrecision:0.9 operatingPoint:0.327 highRecall:0.2];
  v29[6] = v20;
  v19 = [[PUCurationTraitContainer alloc] initWithLabel:@"Hugging" traitValue:7 highPrecision:0.828 operatingPoint:0.533 highRecall:0.45];
  v29[7] = v19;
  v18 = [[PUCurationTraitContainer alloc] initWithLabel:@"Dancing" traitValue:8 highPrecision:0.55 operatingPoint:0.428 highRecall:0.35];
  v29[8] = v18;
  v17 = [[PUCurationTraitContainer alloc] initWithLabel:@"Crawling (Baby Only)" traitValue:9 highPrecision:0.868 operatingPoint:0.765 highRecall:0.683];
  v29[9] = v17;
  v16 = [[PUCurationTraitContainer alloc] initWithLabel:@"Playing Musical Instrument" traitValue:11 highPrecision:0.9 operatingPoint:0.327 highRecall:0.2];
  v29[10] = v16;
  v4 = [[PUCurationTraitContainer alloc] initWithLabel:@"Throwing an object" traitValue:13 highPrecision:0.82 operatingPoint:0.383 highRecall:0.25];
  v29[11] = v4;
  int64_t v5 = [[PUCurationTraitContainer alloc] initWithLabel:@"Kicking an object" traitValue:14 highPrecision:0.85 operatingPoint:0.324 highRecall:0.2];
  v29[12] = v5;
  id v6 = [[PUCurationTraitContainer alloc] initWithLabel:@"Catching an object" traitValue:15 highPrecision:0.75 operatingPoint:0.429 highRecall:0.3];
  v29[13] = v6;
  uint64_t v7 = [[PUCurationTraitContainer alloc] initWithLabel:@"Riding by straddling object (e.g. bike, horse)" traitValue:17 highPrecision:0.888 operatingPoint:0.743 highRecall:0.638];
  v29[14] = v7;
  v8 = [[PUCurationTraitContainer alloc] initWithLabel:@"Playing on a swing" traitValue:18 highPrecision:0.55 operatingPoint:0.495 highRecall:0.42];
  v29[15] = v8;
  uint64_t v9 = [[PUCurationTraitContainer alloc] initWithLabel:@"Swimming" traitValue:19 highPrecision:0.45 operatingPoint:0.36 highRecall:0.2];
  v29[16] = v9;
  id v10 = [[PUCurationTraitContainer alloc] initWithLabel:@"Playing on a slide" traitValue:20 highPrecision:0.7 operatingPoint:0.583 highRecall:0.43];
  v29[17] = v10;
  v11 = [[PUCurationTraitContainer alloc] initWithLabel:@"Swinging (Sports Equipment)" traitValue:21 highPrecision:0.7 operatingPoint:0.42 highRecall:0.3];
  v29[18] = v11;
  v12 = [[PUCurationTraitContainer alloc] initWithLabel:@"Skating (Ice Skating or Inline Skating)" traitValue:22 highPrecision:0.75 operatingPoint:0.429 highRecall:0.3];
  v29[19] = v12;
  v13 = [[PUCurationTraitContainer alloc] initWithLabel:@"Playing Soccer / Futsal" traitValue:25 highPrecision:0.72 operatingPoint:0.59 highRecall:0.5];
  v29[20] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:21];
  availableActions = self->_availableActions;
  self->_availableActions = v14;
}

@end