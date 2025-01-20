@interface PGTitleSpecTimeArgument
+ (id)argumentWithTimeType:(unint64_t)a3;
- (PGTitleSpecTimeArgument)initWithTimeType:(unint64_t)a3;
- (id)_anniversaryTitleWithMomentNodes:(id)a3;
- (id)_birthdayTitleWithMomentNodes:(id)a3;
- (id)_holidayTitleWithMomentNodes:(id)a3;
- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4;
- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5;
- (id)_yearsAgoStringWithEventNodes:(id)a3 relativeToDateComponents:(id)a4;
- (id)_yearsAgoTitle;
- (unint64_t)type;
@end

@implementation PGTitleSpecTimeArgument

- (unint64_t)type
{
  return self->_type;
}

- (id)_holidayTitleWithMomentNodes:(id)a3
{
  v3 = +[PGCommonTitleUtility dateNodesFromMomentNodes:a3];
  v4 = +[PGCommonTitleUtility holidayNameForDateNodes:v3];

  return v4;
}

- (id)_yearsAgoStringWithEventNodes:(id)a3 relativeToDateComponents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"PGUseOrdinalAge" value:@"PGUseOrdinalAge" table:@"Localizable"];

  BOOL v9 = v8 && ([v8 isEqualToString:@"1"] & 1) != 0;
  v10 = +[PGTimeTitleUtility numberOfYearsAgoWithMomentNodes:v5 relativeToDateComponents:v6 useOrdinal:v9];

  return v10;
}

- (id)_birthdayTitleWithMomentNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [PGGraphMomentNodeCollection alloc];
    id v6 = [v4 anyObject];
    v7 = [v6 graph];
    v8 = [(MAElementCollection *)v5 initWithSet:v4 graph:v7];

    BOOL v9 = [(PGGraphMomentNodeCollection *)v8 birthdayPersonNodes];
    v10 = [v9 temporarySet];

    if ([v10 count] == 1)
    {
      v11 = [v10 anyObject];
      v12 = [v11 birthdayDateComponents];
      uint64_t v13 = [v12 year];
      v14 = 0;
      if (v12 && v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = [(PGTitleSpecTimeArgument *)self _yearsAgoStringWithEventNodes:v4 relativeToDateComponents:v12];
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_anniversaryTitleWithMomentNodes:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __60__PGTitleSpecTimeArgument__anniversaryTitleWithMomentNodes___block_invoke;
        v20[3] = &unk_1E68EF528;
        id v21 = v4;
        [v10 enumerateNeighborNodesThroughEdgesWithLabel:@"ANNIVERSARY" domain:301 usingBlock:v20];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  v11 = [v4 anyObject];
  if (v11)
  {
    if ((unint64_t)[v4 count] >= 2)
    {
      v12 = +[PGLogging sharedLogging];
      uint64_t v13 = [v12 loggingConnection];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "More than one person with anniversary found for momentNodes. Taking any person.", buf, 2u);
      }
    }
    v14 = [v11 anniversaryDateComponents];
    uint64_t v15 = [v14 year];
    v16 = 0;
    if (v14 && v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = [(PGTitleSpecTimeArgument *)self _yearsAgoStringWithEventNodes:v5 relativeToDateComponents:v14];
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __60__PGTitleSpecTimeArgument__anniversaryTitleWithMomentNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)_yearsAgoTitle
{
  v2 = [(PGTitleSpecArgument *)self inputVariable];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 integerValue];
    id v5 = NSString;
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"PGMemoryTitleFormatWithNumberOfYears %lu" value:@"PGMemoryTitleFormatWithNumberOfYears %lu" table:@"Localizable"];
    uint64_t v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5
{
  return 0;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(self->_type)
  {
    case 0uLL:
      uint64_t v8 = [(PGTitleSpecTimeArgument *)self _birthdayTitleWithMomentNodes:v6];
      goto LABEL_7;
    case 1uLL:
      uint64_t v8 = [(PGTitleSpecTimeArgument *)self _anniversaryTitleWithMomentNodes:v6];
      goto LABEL_7;
    case 2uLL:
      uint64_t v8 = [(PGTitleSpecTimeArgument *)self _yearsAgoTitle];
      goto LABEL_7;
    case 3uLL:
      uint64_t v8 = [(PGTitleSpecTimeArgument *)self _holidayTitleWithMomentNodes:v6];
LABEL_7:
      BOOL v9 = (void *)v8;
      break;
    default:
      BOOL v9 = 0;
      break;
  }

  return v9;
}

- (PGTitleSpecTimeArgument)initWithTimeType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PGTitleSpecTimeArgument;
  uint64_t v4 = [(PGTitleSpecTimeArgument *)&v7 init];
  id v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    [(PGTitleSpecArgument *)v4 setRequiresInput:a3 == 2];
  }
  return v5;
}

+ (id)argumentWithTimeType:(unint64_t)a3
{
  id v3 = [[PGTitleSpecTimeArgument alloc] initWithTimeType:a3];
  return v3;
}

@end