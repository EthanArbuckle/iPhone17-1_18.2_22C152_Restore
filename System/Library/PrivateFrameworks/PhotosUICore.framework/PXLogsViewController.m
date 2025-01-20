@interface PXLogsViewController
- (BOOL)isCollectionRepresentation:(id)a3;
- (NSDateFormatter)dateFormatter;
- (PXLogsViewController)initWithSubsystem:(id)a3 category:(id)a4 startDate:(id)a5;
- (PXLogsViewController)initWithSubsystemsAndCategories:(id)a3 startDate:(id)a4;
- (id)initLiveWithSubsystem:(id)a3 category:(id)a4;
- (id)initLiveWithSubsystemsAndCategories:(id)a3;
- (id)substitutionForCollectionRepresentation:(id)a3 attributes:(id)a4;
- (id)substitutionForObjectRepresentation:(id)a3;
- (id)subsystemsAndCategoriesPredicateWithSubsystemsAndCategories:(id)a3;
- (void)logAttributedString:(id)a3;
- (void)prepareDiskStore;
- (void)prepareLiveStore;
- (void)removeSpinner;
- (void)setDateFormatter:(id)a3;
- (void)setupEventStream:(id)a3;
- (void)tapped:(id)a3;
- (void)toggleModeForStringIndex:(unint64_t)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PXLogsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_nextAvailableIndexByClassName, 0);
  objc_storeStrong((id *)&self->_substitutionByObjectRepresentation, 0);
  objc_storeStrong((id *)&self->_isExpanded, 0);
  objc_storeStrong((id *)&self->_expandedLogs, 0);
  objc_storeStrong((id *)&self->_compactLogs, 0);
  objc_storeStrong((id *)&self->_fullAttributedString, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_subsystemsAndCategories, 0);
}

- (void)setDateFormatter:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (id)substitutionForCollectionRepresentation:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v7];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__236356;
  v25 = __Block_byref_object_dispose__236357;
  id v26 = 0;
  v9 = (void *)[v7 mutableCopy];
  v10 = [MEMORY[0x1E4FB1618] lightGrayColor];
  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4FB06C0]];

  substitutionByObjectRepresentation = self->_substitutionByObjectRepresentation;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__PXLogsViewController_substitutionForCollectionRepresentation_attributes___block_invoke;
  v17[3] = &unk_1E5DC8E60;
  v20 = &v21;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  [(NSMutableDictionary *)substitutionByObjectRepresentation enumerateKeysAndObjectsUsingBlock:v17];
  v14 = (void *)v22[5];
  if (!v14) {
    v14 = v12;
  }
  id v15 = v14;

  _Block_object_dispose(&v21, 8);
  return v15;
}

void __75__PXLogsViewController_substitutionForCollectionRepresentation_attributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  for (i = 0; ; objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", v9 - 1, v11 + 2, i))
  {
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v7) {
      id v7 = *(void **)(a1 + 32);
    }
    v8 = [v7 string];
    uint64_t v9 = [v8 rangeOfString:v16];
    uint64_t v11 = v10;

    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    if (!i) {
      i = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:*(void *)(a1 + 40)];
    }
    id v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v12)
    {
      uint64_t v13 = [*(id *)(a1 + 32) mutableCopy];
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      id v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
  }
}

- (BOOL)isCollectionRepresentation:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@"("] != 0) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasPrefix:@"{"];
  }

  return v4;
}

- (id)substitutionForObjectRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_substitutionByObjectRepresentation objectForKeyedSubscript:v4];
  if (!v5)
  {
    if ([v4 hasPrefix:@"<"])
    {
      unint64_t v6 = [v4 rangeOfString:@">"];
      unint64_t v7 = [v4 rangeOfString:@": 0x"];
      id v5 = 0;
      if (v6 != 0x7FFFFFFFFFFFFFFFLL && v7 < v6)
      {
        v8 = objc_msgSend(v4, "substringWithRange:", 1, v7 - 1);
        uint64_t v9 = [(NSMutableDictionary *)self->_nextAvailableIndexByClassName objectForKeyedSubscript:v8];
        uint64_t v10 = [v9 unsignedIntegerValue];

        id v5 = [NSString stringWithFormat:@"%@ %lu", v8, v10];
        uint64_t v11 = v10 + 1;
        if (!self->_substitutionByObjectRepresentation)
        {
          id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          substitutionByObjectRepresentation = self->_substitutionByObjectRepresentation;
          self->_substitutionByObjectRepresentation = v12;

          uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          nextAvailableIndexByClassName = self->_nextAvailableIndexByClassName;
          self->_nextAvailableIndexByClassName = v14;
        }
        id v16 = [NSNumber numberWithUnsignedInteger:v11];
        [(NSMutableDictionary *)self->_nextAvailableIndexByClassName setObject:v16 forKeyedSubscript:v8];

        [(NSMutableDictionary *)self->_substitutionByObjectRepresentation setObject:v5 forKeyedSubscript:v4];
      }
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)toggleModeForStringIndex:(unint64_t)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  do
  {
    v5 += v6;
    if ([(NSMutableIndexSet *)self->_isExpanded containsIndex:v7]) {
      v8 = &OBJC_IVAR___PXLogsViewController__expandedLogs;
    }
    else {
      v8 = &OBJC_IVAR___PXLogsViewController__compactLogs;
    }
    uint64_t v9 = [*(id *)((char *)&self->super.super.super.isa + *v8) objectAtIndexedSubscript:v7];
    uint64_t v6 = [v9 length];

    ++v7;
  }
  while (v7 <= a3);
  if ([(NSMutableIndexSet *)self->_isExpanded containsIndex:a3])
  {
    id v10 = [(NSMutableArray *)self->_compactLogs objectAtIndexedSubscript:a3];
    [(NSMutableIndexSet *)self->_isExpanded removeIndex:a3];
  }
  else
  {
    id v10 = [(NSMutableArray *)self->_expandedLogs objectAtIndexedSubscript:a3];
    [(NSMutableIndexSet *)self->_isExpanded addIndex:a3];
  }
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](self->_fullAttributedString, "replaceCharactersInRange:withAttributedString:", v5, v6, v10);
  [(UITextView *)self->_textView setAttributedText:self->_fullAttributedString];
}

- (void)logAttributedString:(id)a3
{
  id v4 = a3;
  fullAttributedString = self->_fullAttributedString;
  if (!fullAttributedString)
  {
    uint64_t v6 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E48]);
    unint64_t v7 = self->_fullAttributedString;
    self->_fullAttributedString = v6;

    fullAttributedString = self->_fullAttributedString;
  }
  [(NSMutableAttributedString *)fullAttributedString appendAttributedString:v4];
  if (!self->_hasScheduledTextViewUpdate)
  {
    self->_hasScheduledTextViewUpdate = 1;
    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PXLogsViewController_logAttributedString___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __44__PXLogsViewController_logAttributedString___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 992) setAttributedText:*(void *)(*(void *)(a1 + 32) + 1016)];
  *(unsigned char *)(*(void *)(a1 + 32) + 1024) = 0;
  return result;
}

- (void)removeSpinner
{
  [(UIActivityIndicatorView *)self->_spinnerView removeFromSuperview];
  spinnerView = self->_spinnerView;
  self->_spinnerView = 0;
}

- (void)setupEventStream:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setFlags:389];
  v25 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type = %d", 1024);
  uint64_t v5 = [(PXLogsViewController *)self subsystemsAndCategoriesPredicateWithSubsystemsAndCategories:self->_subsystemsAndCategories];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
    v38[0] = v25;
    v38[1] = v5;
    dispatch_time_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    id v9 = [v7 andPredicateWithSubpredicates:v8];
  }
  else
  {
    id v9 = v25;
  }
  [v4 setFilterPredicate:v9];
  id v10 = [(PXLogsViewController *)self dateFormatter];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v10 setDateStyle:1];
    [v10 setTimeStyle:1];
  }
  uint64_t v11 = [MEMORY[0x1E4FB1618] colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
  id v12 = [MEMORY[0x1E4FB1618] colorWithRed:0.9 green:0.9 blue:0.7 alpha:1.0];
  uint64_t v13 = [MEMORY[0x1E4FB1618] colorWithRed:0.7 green:0.9 blue:0.7 alpha:1.0];
  uint64_t v36 = *MEMORY[0x1E4FB06C0];
  v37 = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  id v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  compactLogs = self->_compactLogs;
  self->_compactLogs = v15;

  v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  expandedLogs = self->_expandedLogs;
  self->_expandedLogs = v17;

  id v19 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
  isExpanded = self->_isExpanded;
  self->_isExpanded = v19;

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __41__PXLogsViewController_setupEventStream___block_invoke;
  v27[3] = &unk_1E5DC8E10;
  v33 = v34;
  id v21 = v11;
  id v28 = v21;
  id v22 = v12;
  id v29 = v22;
  v30 = self;
  id v23 = v10;
  id v31 = v23;
  id v24 = v14;
  id v32 = v24;
  [v4 setEventHandler:v27];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __41__PXLogsViewController_setupEventStream___block_invoke_3;
  v26[3] = &unk_1E5DC8E38;
  v26[4] = self;
  [v4 setInvalidationHandler:v26];

  _Block_object_dispose(v34, 8);
}

void __41__PXLogsViewController_setupEventStream___block_invoke(uint64_t a1, void *a2)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4FB06C0];
  uint64_t v51 = *MEMORY[0x1E4FB06C0];
  uint64_t v5 = 32;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    uint64_t v5 = 40;
  }
  uint64_t v45 = a1;
  v52[0] = *(void *)(a1 + v5);
  v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
  uint64_t v6 = [v3 decomposedMessage];
  if ([v6 state])
  {
    id v7 = 0;
    goto LABEL_24;
  }
  id v46 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  if (![v6 placeholderCount])
  {
    id v7 = 0;
    goto LABEL_23;
  }
  id v43 = v3;
  uint64_t v44 = v4;
  char v8 = 0;
  unint64_t v9 = 0;
  do
  {
    id v10 = [v6 literalPrefixAtIndex:v9];
    if (v10)
    {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10 attributes:v47];
      [v46 appendAttributedString:v11];
    }
    id v12 = [v6 placeholderAtIndex:v9];
    uint64_t v13 = [v6 argumentAtIndex:v9];
    uint64_t v14 = [v12 rawString];
    int v15 = [v14 hasSuffix:@"@"];

    if (v15)
    {
      id v16 = [v6 argumentAtIndex:v9];
      v17 = [v16 objectRepresentation];
      int v18 = [*(id *)(v45 + 48) isCollectionRepresentation:v17];
      id v19 = *(void **)(v45 + 48);
      if (v18)
      {
        v20 = [v19 substitutionForCollectionRepresentation:v17 attributes:v47];
        [v46 appendAttributedString:v20];
LABEL_14:
        char v8 = 1;
        goto LABEL_17;
      }
      uint64_t v21 = [v19 substitutionForObjectRepresentation:v17];
      if (v21)
      {
        v20 = (void *)v21;
        id v22 = (void *)[v47 mutableCopy];
        id v23 = [MEMORY[0x1E4FB1618] lightGrayColor];
        [v22 setObject:v23 forKeyedSubscript:v44];

        id v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v20 attributes:v22];
        [v46 appendAttributedString:v24];

        goto LABEL_14;
      }
    }
    id v25 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v26 = NSString;
    id v16 = [v13 objectRepresentation];
    v17 = [v26 stringWithFormat:@"%@", v16];
    v20 = (void *)[v25 initWithString:v17 attributes:v47];
    [v46 appendAttributedString:v20];
LABEL_17:

    ++v9;
  }
  while (v9 < [v6 placeholderCount]);
  if (v8) {
    id v7 = v46;
  }
  else {
    id v7 = 0;
  }
  id v3 = v43;
LABEL_23:

LABEL_24:
  id v27 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v28 = NSString;
  id v29 = *(void **)(v45 + 56);
  v30 = [v3 date];
  id v31 = [v29 stringFromDate:v30];
  id v32 = [v28 stringWithFormat:@"%@ ", v31];
  v33 = (void *)[v27 initWithString:v32 attributes:*(void *)(v45 + 64)];

  v34 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n" attributes:v47];
  char v35 = (void *)[v33 mutableCopy];
  id v36 = objc_alloc(MEMORY[0x1E4F28B18]);
  v37 = [v3 composedMessage];
  v38 = (void *)[v36 initWithString:v37 attributes:v47];
  [v35 appendAttributedString:v38];

  [v35 appendAttributedString:v34];
  id v39 = v35;
  v40 = v39;
  if (v7)
  {
    v40 = (void *)[v33 mutableCopy];
    [v40 appendAttributedString:v7];
    [v40 appendAttributedString:v34];
  }
  *(unsigned char *)(*(void *)(*(void *)(v45 + 72) + 8) + 24) ^= 1u;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PXLogsViewController_setupEventStream___block_invoke_2;
  block[3] = &unk_1E5DD0F30;
  block[4] = *(void *)(v45 + 48);
  id v49 = v40;
  id v50 = v39;
  id v41 = v39;
  id v42 = v40;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __41__PXLogsViewController_setupEventStream___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PXLogsViewController_setupEventStream___block_invoke_4;
  block[3] = &unk_1E5DD36F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __41__PXLogsViewController_setupEventStream___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 992) setAttributedText:*(void *)(*(void *)(a1 + 32) + 1016)];
  v2 = *(void **)(a1 + 32);
  return [v2 removeSpinner];
}

uint64_t __41__PXLogsViewController_setupEventStream___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 1032) addObject:a1[5]];
  [*(id *)(a1[4] + 1040) addObject:a1[6]];
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  return [v2 logAttributedString:v3];
}

- (id)subsystemsAndCategoriesPredicateWithSubsystemsAndCategories:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v20 = v3;
    id v5 = v3;
    uint64_t v22 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (!v22) {
      goto LABEL_27;
    }
    uint64_t v21 = *(void *)v24;
    uint64_t v6 = &stru_1F00B0030;
    while (1)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v5);
        }
        char v8 = [*(id *)(*((void *)&v23 + 1) + 8 * i) componentsSeparatedByString:@":"];
        if ([v8 count])
        {
          unint64_t v9 = [v8 firstObject];
        }
        else
        {
          unint64_t v9 = &stru_1F00B0030;
        }
        if ((unint64_t)[v8 count] >= 2)
        {
          uint64_t v6 = [v8 objectAtIndexedSubscript:1];
        }
        if ([(__CFString *)v9 length])
        {
          [MEMORY[0x1E4F28F60] predicateWithFormat:@"subsystem = %@", v9];
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          if (![(__CFString *)v6 length])
          {
            if (v10) {
              goto LABEL_23;
            }
            id v11 = 0;
LABEL_20:
            id v11 = v11;
            id v10 = 0;
            v17 = v11;
            goto LABEL_21;
          }
        }
        else
        {
          id v10 = 0;
          id v11 = 0;
          if (![(__CFString *)v6 length]) {
            goto LABEL_20;
          }
        }
        uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"category = %@", v6];
        id v11 = (id)v12;
        if (!v10) {
          goto LABEL_20;
        }
        if (!v12)
        {
LABEL_23:
          id v10 = v10;
          id v11 = 0;
          v17 = v10;
LABEL_24:
          [v4 addObject:v17];

          goto LABEL_25;
        }
        uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
        v27[0] = v10;
        v27[1] = v12;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
        id v14 = v5;
        v16 = id v15 = v4;
        v17 = [v13 andPredicateWithSubpredicates:v16];

        id v4 = v15;
        id v5 = v14;
LABEL_21:
        if (v17) {
          goto LABEL_24;
        }
LABEL_25:

        uint64_t v6 = &stru_1F00B0030;
      }
      uint64_t v22 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (!v22)
      {
LABEL_27:

        if ((unint64_t)[v4 count] < 2) {
          [v4 firstObject];
        }
        else {
        int v18 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v4];
        }

        id v3 = v20;
        goto LABEL_32;
      }
    }
  }
  int v18 = 0;
LABEL_32:

  return v18;
}

- (void)prepareLiveStore
{
  id v3 = [MEMORY[0x1E4F73098] liveLocalStore];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__PXLogsViewController_prepareLiveStore__block_invoke;
  v4[3] = &unk_1E5DC8DE8;
  v4[4] = self;
  [v3 prepareWithCompletionHandler:v4];
}

void __40__PXLogsViewController_prepareLiveStore__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F730A8];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithLiveSource:v4];

  [*(id *)(a1 + 32) setupEventStream:v5];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 1008);
  *(void *)(v6 + 1008) = v5;
  id v8 = v5;

  [v8 activate];
}

- (void)prepareDiskStore
{
  id v3 = [MEMORY[0x1E4F730C0] localStore];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__PXLogsViewController_prepareDiskStore__block_invoke;
  v4[3] = &unk_1E5DC8DC0;
  v4[4] = self;
  [v3 prepareWithCompletionHandler:v4];
}

void __40__PXLogsViewController_prepareDiskStore__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F730C8];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithSource:v4];

  [*(id *)(a1 + 32) setupEventStream:v5];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 1008);
  *(void *)(v6 + 1008) = v5;
  id v8 = v5;

  [v8 activateStreamFromDate:*(void *)(*(void *)(a1 + 32) + 984)];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(OSLogEventStreamBase *)self->_eventStream invalidate];
  v5.receiver = self;
  v5.super_class = (Class)PXLogsViewController;
  [(PXLogsViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)PXLogsViewController;
  [(PXLogsViewController *)&v29 viewDidLoad];
  BOOL v3 = [(PXLogsViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  [v3 bounds];
  objc_super v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:");
  textView = self->_textView;
  self->_textView = v5;

  [(UITextView *)self->_textView setAutoresizingMask:18];
  [(UITextView *)self->_textView setEditable:0];
  id v7 = [(UITextView *)self->_textView textContainer];
  [v7 setLineBreakMode:1];

  [(UITextView *)self->_textView setTextAlignment:0];
  [v3 addSubview:self->_textView];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tapped_];
  [(UITextView *)self->_textView addGestureRecognizer:v8];
  if (self->_startDate) {
    [(PXLogsViewController *)self prepareDiskStore];
  }
  else {
    [(PXLogsViewController *)self prepareLiveStore];
  }
  if (self->_startDate)
  {
    unint64_t v9 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
    spinnerView = self->_spinnerView;
    self->_spinnerView = v9;

    id v11 = [MEMORY[0x1E4FB1618] grayColor];
    [(UIActivityIndicatorView *)self->_spinnerView setColor:v11];

    [(UIActivityIndicatorView *)self->_spinnerView bounds];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    [v3 bounds];
    double v21 = v20;
    [(UIActivityIndicatorView *)self->_spinnerView bounds];
    CGFloat v23 = (v21 - v22) * 0.5;
    [v3 bounds];
    double v25 = v24;
    [(UIActivityIndicatorView *)self->_spinnerView bounds];
    CGFloat v27 = (v25 - v26) * 0.5;
    v30.origin.x = v13;
    v30.origin.y = v15;
    v30.size.width = v17;
    v30.size.height = v19;
    CGRect v31 = CGRectOffset(v30, v23, v27);
    -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
    [(UIActivityIndicatorView *)self->_spinnerView setAutoresizingMask:45];
    [(UIActivityIndicatorView *)self->_spinnerView setHidesWhenStopped:1];
    [v3 addSubview:self->_spinnerView];
    [(UIActivityIndicatorView *)self->_spinnerView startAnimating];
  }
  id v28 = [(PXLogsViewController *)self navigationController];
  [v28 setToolbarHidden:1 animated:0];
}

- (void)tapped:(id)a3
{
  [a3 locationInView:self->_textView];
  double v5 = v4;
  double v7 = v6;
  id v8 = [(UITextView *)self->_textView layoutManager];
  unint64_t v9 = [(UITextView *)self->_textView textContainer];
  unint64_t v10 = objc_msgSend(v8, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v9, 0, v5, v7);

  if ([(NSMutableArray *)self->_compactLogs count])
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    while (1)
    {
      int v13 = [(NSMutableIndexSet *)self->_isExpanded containsIndex:v11];
      p_compactLogs = &self->_compactLogs;
      if (v13) {
        p_compactLogs = &self->_expandedLogs;
      }
      id v15 = [(NSMutableArray *)*p_compactLogs objectAtIndexedSubscript:v11];
      v12 += [v15 length];
      if (v10 < v12) {
        break;
      }

      if (++v11 >= (unint64_t)[(NSMutableArray *)self->_compactLogs count]) {
        return;
      }
    }
    [(PXLogsViewController *)self toggleModeForStringIndex:v11];
  }
}

- (id)initLiveWithSubsystem:(id)a3 category:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  double v5 = &stru_1F00B0030;
  if (a3) {
    double v6 = (__CFString *)a3;
  }
  else {
    double v6 = &stru_1F00B0030;
  }
  if (a4) {
    double v5 = (__CFString *)a4;
  }
  double v7 = [NSString stringWithFormat:@"%@:%@", v6, v5];
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(PXLogsViewController *)self initLiveWithSubsystemsAndCategories:v8];

  return v9;
}

- (id)initLiveWithSubsystemsAndCategories:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXLogsViewController;
  double v6 = [(PXLogsViewController *)&v9 initWithNibName:0 bundle:0];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subsystemsAndCategories, a3);
  }

  return v7;
}

- (PXLogsViewController)initWithSubsystem:(id)a3 category:(id)a4 startDate:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  double v6 = NSString;
  if (a3) {
    double v7 = (__CFString *)a3;
  }
  else {
    double v7 = &stru_1F00B0030;
  }
  if (a4) {
    id v8 = (__CFString *)a4;
  }
  else {
    id v8 = &stru_1F00B0030;
  }
  id v9 = a5;
  unint64_t v10 = [v6 stringWithFormat:@"%@:%@", v7, v8];
  v14[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  unint64_t v12 = [(PXLogsViewController *)self initWithSubsystemsAndCategories:v11 startDate:v9];

  return v12;
}

- (PXLogsViewController)initWithSubsystemsAndCategories:(id)a3 startDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXLogsViewController;
  id v9 = [(PXLogsViewController *)&v13 initWithNibName:0 bundle:0];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subsystemsAndCategories, a3);
    uint64_t v11 = v8;
    if (!v8)
    {
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    objc_storeStrong((id *)&v10->_startDate, v11);
    if (!v8) {
  }
    }
  return v10;
}

@end