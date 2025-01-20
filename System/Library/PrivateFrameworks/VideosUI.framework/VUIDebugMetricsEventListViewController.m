@interface VUIDebugMetricsEventListViewController
- (NSArray)allEvents;
- (NSArray)buttonsInHeader;
- (NSArray)buttonsInHeaderSelected;
- (NSArray)visibleEvents;
- (VUIDebugMetricsEventListViewController)initWithEvents:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_formatKeyAndValue:(id)a3 fromEvent:(id)a4;
- (id)_imageFromPageContext:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_buttonClicked:(id)a3;
- (void)finishValidation;
- (void)setAllEvents:(id)a3;
- (void)setButtonsInHeader:(id)a3;
- (void)setButtonsInHeaderSelected:(id)a3;
- (void)setVisibleEvents:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleValidationMode;
- (void)viewDidLoad;
@end

@implementation VUIDebugMetricsEventListViewController

- (VUIDebugMetricsEventListViewController)initWithEvents:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VUIDebugMetricsEventListViewController;
  v6 = [(VUIDebugMetricsEventListViewController *)&v10 initWithStyle:0];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    allEvents = v6->_allEvents;
    v6->_allEvents = (NSArray *)v7;

    objc_storeStrong((id *)&v6->_visibleEvents, a3);
    [(VUIDebugMetricsEventListViewController *)v6 setTitle:@"Events"];
  }

  return v6;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)VUIDebugMetricsEventListViewController;
  [(VUIDebugMetricsEventListViewController *)&v9 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"Select" style:0 target:self action:sel_toggleValidationMode];
  v4 = [(VUIDebugMetricsEventListViewController *)self navigationItem];
  [v4 setLargeTitleDisplayMode:1];

  id v5 = [(VUIDebugMetricsEventListViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v3];

  v6 = [(VUIDebugMetricsEventListViewController *)self tableView];
  [v6 setAllowsSelectionDuringEditing:0];

  uint64_t v7 = [(VUIDebugMetricsEventListViewController *)self tableView];
  [v7 setAllowsMultipleSelectionDuringEditing:1];

  v8 = [(VUIDebugMetricsEventListViewController *)self tableView];
  [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"EventCell"];
}

- (void)toggleValidationMode
{
  if ([(VUIDebugMetricsEventListViewController *)self isEditing])
  {
    [(VUIDebugMetricsEventListViewController *)self finishValidation];
    [(VUIDebugMetricsEventListViewController *)self setEditing:0 animated:1];
    v3 = [(VUIDebugMetricsEventListViewController *)self navigationItem];
    v4 = [v3 rightBarButtonItem];
    id v5 = v4;
    v6 = @"Select";
  }
  else
  {
    [(VUIDebugMetricsEventListViewController *)self setEditing:1 animated:1];
    v3 = [(VUIDebugMetricsEventListViewController *)self navigationItem];
    v4 = [v3 rightBarButtonItem];
    id v5 = v4;
    v6 = @"Validate";
  }
  [v4 setTitle:v6];

  id v8 = [(VUIDebugMetricsEventListViewController *)self navigationItem];
  uint64_t v7 = [v8 rightBarButtonItem];
  [v7 setStyle:2];
}

- (void)finishValidation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(VUIDebugMetricsEventListViewController *)self tableView];
  v4 = [v3 indexPathsForSelectedRows];

  if ([v4 count])
  {
    id v5 = (void *)[v4 mutableCopy];
    [v5 sortUsingComparator:&__block_literal_global_155];
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = -[NSArray objectAtIndex:](self->_visibleEvents, "objectAtIndex:", [*(id *)(*((void *)&v20 + 1) + 8 * v11) row]);
          v13 = [v12 rawEvent];
          [v6 addObject:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__VUIDebugMetricsEventListViewController_finishValidation__block_invoke_2;
    v16[3] = &unk_1E6DFD368;
    id v17 = v7;
    id v18 = v6;
    v19 = self;
    id v14 = v6;
    id v15 = v7;
    +[VUIDebugMetricsEventValidator validateEvents:v14 forRuleset:@"com.apple.amp.ae.validator.manifest.Video.AllRulesets" withCompletion:v16];
  }
}

uint64_t __58__VUIDebugMetricsEventListViewController_finishValidation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithLong:", objc_msgSend(a2, "row"));
  id v7 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v8 = [v5 row];

  uint64_t v9 = [v7 numberWithLong:v8];
  uint64_t v10 = [v9 compare:v6];

  return v10;
}

void __58__VUIDebugMetricsEventListViewController_finishValidation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v20 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v20)
  {
    uint64_t v3 = 0;
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v24 + 1) + 8 * v4);
        v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v3 + v4];
        id v7 = [v6 valueForKey:@"eventType"];

        uint64_t v8 = +[VUIDebugMetricsEventValidator validationResults:v19 fromIndex:v3 + v4];
        uint64_t v9 = [v8 valueForKey:@"passedRulesets"];
        uint64_t v10 = [v9 count];

        uint64_t v11 = [v8 valueForKey:@"filteredRulesets"];
        uint64_t v12 = [v11 count];

        v13 = [v8 valueForKey:@"failedRulesets"];
        uint64_t v14 = [v13 count];

        id v15 = [NSString stringWithFormat:@"Validation Rulesets for %@: –  %lu Failed, %lu Passed, %lu N/A", v7, v14, v10, v12];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __58__VUIDebugMetricsEventListViewController_finishValidation__block_invoke_3;
        block[3] = &unk_1E6DFD340;
        block[4] = *(void *)(a1 + 48);
        block[5] = v5;
        id v22 = v15;
        uint64_t v23 = v14;
        id v16 = v15;
        dispatch_async(MEMORY[0x1E4F14428], block);

        ++v4;
      }
      while (v20 != v4);
      v3 += v4;
      uint64_t v20 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v20);
  }
}

void __58__VUIDebugMetricsEventListViewController_finishValidation__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  id v4 = [v2 cellForRowAtIndexPath:*(void *)(a1 + 40)];

  [v4 setSubhead3LabelStr:*(void *)(a1 + 48)];
  if (*(void *)(a1 + 56)) {
    [MEMORY[0x1E4FB1618] redColor];
  }
  else {
  uint64_t v3 = [MEMORY[0x1E4FB1618] greenColor];
  }
  [v4 setSubhead3LabelColor:v3];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_visibleEvents count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"EventCell"];
  visibleEvents = self->_visibleEvents;
  uint64_t v9 = [v6 row];

  uint64_t v10 = [(NSArray *)visibleEvents objectAtIndexedSubscript:v9];
  uint64_t v11 = [v10 eventType];
  [v7 setEventTypeLabelStr:v11];

  uint64_t v12 = [v10 eventType];
  if ([v12 isEqualToString:@"page"]) {
    [v10 sortedPageKeys];
  }
  else {
  v13 = [v10 sortedPrimaryKeys];
  }

  if ([v13 count])
  {
    uint64_t v14 = [v13 objectAtIndex:0];
  }
  else
  {
    uint64_t v14 = 0;
  }
  if ((unint64_t)[v13 count] < 2)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = [v13 objectAtIndex:1];
  }
  [v14 isEqualToString:@"impresions"];
  if (v14)
  {
    id v16 = [(VUIDebugMetricsEventListViewController *)self _formatKeyAndValue:v14 fromEvent:v10];
  }
  else
  {
    id v16 = 0;
  }
  long long v26 = (void *)v15;
  if (v15)
  {
    id v17 = [(VUIDebugMetricsEventListViewController *)self _formatKeyAndValue:v15 fromEvent:v10];
  }
  else
  {
    id v17 = 0;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v18 setDateFormat:@"h:mm:ss a"];
  id v19 = [v10 eventDate];
  uint64_t v20 = [v18 stringFromDate:v19];

  if (v20)
  {
    long long v21 = [NSString stringWithFormat:@"eventTime: %@", v20];
    if (!v16) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  long long v21 = 0;
  if (v16) {
LABEL_18:
  }
    [v7 setSubhead1LabelStr:v16];
LABEL_19:
  if (v17) {
    [v7 setSubhead2LabelStr:v17];
  }
  long long v27 = v13;
  if (v21) {
    [v7 setSubhead3LabelStr:v21];
  }
  id v22 = [v10 pageContext];
  uint64_t v23 = [(VUIDebugMetricsEventListViewController *)self _imageFromPageContext:v22];

  [v7 setTabImage:v23];
  if (v23)
  {
    [v7 setTabName:0];
  }
  else
  {
    long long v24 = [v10 pageContext];
    [v7 setTabName:v24];
  }
  return v7;
}

- (id)_formatKeyAndValue:(id)a3 fromEvent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v6 isEqualToString:@"impressions"])
  {
    id v7 = [v5 rawData];

    uint64_t v8 = [v7 valueForKey:v6];

    uint64_t v9 = [NSString stringWithFormat:@"%@: %lu impressions", v6, objc_msgSend(v8, "count")];
  }
  else
  {
    uint64_t v10 = NSString;
    uint64_t v8 = [v5 rawData];

    uint64_t v11 = [v8 objectForKeyedSubscript:v6];
    uint64_t v9 = [v10 stringWithFormat:@"%@: %@", v6, v11];

    id v6 = (id)v11;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  if (([(VUIDebugMetricsEventListViewController *)self isEditing] & 1) == 0)
  {
    id v5 = -[NSArray objectAtIndexedSubscript:](self->_visibleEvents, "objectAtIndexedSubscript:", [v8 row]);
    id v6 = [[VUIDebugMetricsEventViewController alloc] initWithEvent:v5];
    id v7 = [(VUIDebugMetricsEventListViewController *)self navigationController];
    [v7 pushViewController:v6 animated:1];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 110.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3, a4);
  id v6 = [MEMORY[0x1E4F1CA48] array];
  [v5 addObject:@"all"];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v47 = self;
  id v7 = [(VUIDebugMetricsEventListViewController *)self allEvents];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v57 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v13 = [v12 eventType];
        char v14 = [v5 containsObject:v13];

        if ((v14 & 1) == 0)
        {
          uint64_t v15 = [v12 eventType];
          [v5 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v9);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v16 = [(VUIDebugMetricsEventListViewController *)v47 visibleEvents];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v53 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        id v22 = [v21 eventType];
        char v23 = [v6 containsObject:v22];

        if ((v23 & 1) == 0)
        {
          long long v24 = [v21 eventType];
          [v6 addObject:v24];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v52 objects:v61 count:16];
    }
    while (v18);
  }

  long long v25 = (void *)[v5 copy];
  [(VUIDebugMetricsEventListViewController *)v47 setButtonsInHeader:v25];

  long long v26 = (void *)[v6 copy];
  [(VUIDebugMetricsEventListViewController *)v47 setButtonsInHeaderSelected:v26];

  v46 = [MEMORY[0x1E4F1CA48] array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v27 = v5;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = 0;
    uint64_t v31 = *(void *)v49;
    double v32 = *MEMORY[0x1E4F1DB30];
    double v33 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(v27);
        }
        uint64_t v35 = *(void *)(*((void *)&v48 + 1) + 8 * k);
        BOOL v36 = 1;
        v37 = objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithType:", 1, v46);
        [v37 addTarget:v47 action:sel__buttonClicked_ forControlEvents:64];
        [v37 setTitle:v35 forState:0];
        if (([v6 containsObject:v35] & 1) == 0)
        {
          uint64_t v38 = [v27 count] - 1;
          BOOL v36 = v38 == [v6 count];
        }
        [v37 setSelected:v36];
        objc_msgSend(v37, "sizeThatFits:", v32, v33);
        [v37 setExclusiveTouch:1];
        [v37 setTag:v30 + k];
        [v46 addObject:v37];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v48 objects:v60 count:16];
      v30 += k;
    }
    while (v29);
  }

  v39 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v46];
  [v39 setAlignment:3];
  [v39 setDistribution:3];
  v40 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v40 bounds];
  double v42 = v41;

  objc_msgSend(v39, "setFrame:", 48.0, 0.0, v42 + -96.0, 35.0);
  id v43 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v44 = objc_msgSend(v43, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v44 addSubview:v39];

  return v44;
}

- (void)_buttonClicked:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDebugMetricsEventListViewController *)self buttonsInHeader];
  id v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "tag"));

  objc_msgSend(v4, "setSelected:", objc_msgSend(v4, "isSelected") ^ 1);
  id v7 = [(VUIDebugMetricsEventListViewController *)self buttonsInHeaderSelected];
  uint64_t v8 = (void *)[v7 mutableCopy];

  if ([v4 isSelected]) {
    [v8 addObject:v6];
  }
  else {
    [v8 removeObject:v6];
  }
  uint64_t v9 = (void *)[v8 copy];
  [(VUIDebugMetricsEventListViewController *)self setButtonsInHeaderSelected:v9];

  uint64_t v10 = [(VUIDebugMetricsEventListViewController *)self tableView];
  [v10 beginUpdates];

  uint64_t v11 = [v4 tag];
  uint64_t v12 = [(VUIDebugMetricsEventListViewController *)self allEvents];
  if (v11)
  {
    v13 = [(VUIDebugMetricsEventListViewController *)self allEvents];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__VUIDebugMetricsEventListViewController__buttonClicked___block_invoke;
    v19[3] = &unk_1E6DFD390;
    v19[4] = self;
    char v14 = [v13 indexesOfObjectsPassingTest:v19];
    uint64_t v15 = [v12 objectsAtIndexes:v14];

    uint64_t v12 = (void *)v15;
  }
  [(VUIDebugMetricsEventListViewController *)self setVisibleEvents:v12];
  id v16 = [(VUIDebugMetricsEventListViewController *)self tableView];
  uint64_t v17 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v16 reloadSections:v17 withRowAnimation:5];

  uint64_t v18 = [(VUIDebugMetricsEventListViewController *)self tableView];
  [v18 endUpdates];
}

uint64_t __57__VUIDebugMetricsEventListViewController__buttonClicked___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 buttonsInHeaderSelected];
  id v5 = [v3 eventType];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

- (id)_imageFromPageContext:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"watchnow"])
  {
    id v4 = @"play.circle.fill";
  }
  else if ([v3 isEqualToString:@"movies"])
  {
    id v4 = @"film.fill";
  }
  else if ([v3 isEqualToString:@"tv"])
  {
    id v4 = @"tv.inset.filled";
  }
  else if ([v3 isEqualToString:@"library"])
  {
    id v4 = @"rectangle.stack.fill";
  }
  else if ([v3 isEqualToString:@"search"])
  {
    id v4 = @"magnifyingglass";
  }
  else
  {
    id v4 = @"nil";
  }
  if ([(__CFString *)v4 length])
  {
    id v5 = [MEMORY[0x1E4FB1818] _systemImageNamed:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSArray)visibleEvents
{
  return self->_visibleEvents;
}

- (void)setVisibleEvents:(id)a3
{
}

- (NSArray)allEvents
{
  return self->_allEvents;
}

- (void)setAllEvents:(id)a3
{
}

- (NSArray)buttonsInHeader
{
  return self->_buttonsInHeader;
}

- (void)setButtonsInHeader:(id)a3
{
}

- (NSArray)buttonsInHeaderSelected
{
  return self->_buttonsInHeaderSelected;
}

- (void)setButtonsInHeaderSelected:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonsInHeaderSelected, 0);
  objc_storeStrong((id *)&self->_buttonsInHeader, 0);
  objc_storeStrong((id *)&self->_allEvents, 0);
  objc_storeStrong((id *)&self->_visibleEvents, 0);
}

@end