@interface PGTitleGeneratorDateMatching
+ (BOOL)type:(int64_t)a3 isBetterThanType:(int64_t)a4;
+ (id)_typeMatchings;
- (BOOL)_dateNodeIntersectsWithReferenceDateIntervalByIgnoringYear;
- (BOOL)isForHighlight;
- (NSDateInterval)referenceDateInterval;
- (NSSet)dateNodes;
- (NSSet)momentNodes;
- (PGGraph)graph;
- (PGTitle)title;
- (PGTitleGeneratorDateMatching)initWithType:(int64_t)a3 referenceDateInterval:(id)a4 highlightNode:(id)a5 titleGenerationContext:(id)a6;
- (PGTitleGeneratorDateMatching)initWithType:(int64_t)a3 referenceDateInterval:(id)a4 momentNodes:(id)a5 lineBreakBehavior:(unint64_t)a6 isForHighlight:(BOOL)a7 titleGenerationContext:(id)a8;
- (PGTitleGeneratorDateMatching)initWithType:(int64_t)a3 referenceDateInterval:(id)a4 momentNodes:(id)a5 titleGenerationContext:(id)a6;
- (PGTitleGeneratorDateMatching)initWithType:(int64_t)a3 referenceDateInterval:(id)a4 momentNodes:(id)a5 titleGenerationContext:(id)a6 holidayName:(id)a7 isForHighlight:(BOOL)a8;
- (int64_t)_findBestType;
- (int64_t)_matchingTypeForDateNode:(id)a3;
- (int64_t)type;
- (unint64_t)allowedTimeTitleFormats;
- (unint64_t)lineBreakBehavior;
- (void)setDateNodes:(id)a3;
- (void)setGraph:(id)a3;
- (void)setLineBreakBehavior:(unint64_t)a3;
@end

@implementation PGTitleGeneratorDateMatching

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_dateNodes, 0);
  objc_storeStrong((id *)&self->_referenceDateInterval, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_holidayName, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
}

- (void)setLineBreakBehavior:(unint64_t)a3
{
  self->_lineBreakBehavior = a3;
}

- (unint64_t)lineBreakBehavior
{
  return self->_lineBreakBehavior;
}

- (BOOL)isForHighlight
{
  return self->_isForHighlight;
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (void)setDateNodes:(id)a3
{
}

- (NSSet)dateNodes
{
  return self->_dateNodes;
}

- (NSDateInterval)referenceDateInterval
{
  return self->_referenceDateInterval;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setGraph:(id)a3
{
}

- (PGGraph)graph
{
  return self->_graph;
}

- (int64_t)_matchingTypeForDateNode:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  [(id)objc_opt_class() _typeMatchings];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  int64_t v4 = 0;
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v19 = *(void *)v32;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v32 != v19) {
        objc_enumerationMutation(obj);
      }
      v7 = *(void **)(*((void *)&v31 + 1) + 8 * v6);
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      char v30 = 0;
      v8 = self->_graph;
      v9 = self->_momentNodes;
      v10 = self->_referenceDateInterval;
      v11 = [v20 collection];
      v12 = [v11 momentNodes];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __57__PGTitleGeneratorDateMatching__matchingTypeForDateNode___block_invoke;
      v21[3] = &unk_1E68E8128;
      v13 = v9;
      v26 = &v27;
      v22 = v13;
      v23 = v7;
      v14 = v8;
      v24 = v14;
      v15 = v10;
      v25 = v15;
      [v12 enumerateNodesUsingBlock:v21];

      int v16 = *((unsigned __int8 *)v28 + 24);
      if (*((unsigned char *)v28 + 24)) {
        int64_t v4 = [v7 type];
      }

      _Block_object_dispose(&v27, 8);
      if (v16) {
        break;
      }
      if (v5 == ++v6)
      {
        uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v4;
}

void __57__PGTitleGeneratorDateMatching__matchingTypeForDateNode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    uint64_t v5 = [*(id *)(a1 + 40) eventEvaluationBlock];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = ((uint64_t (**)(void, void, void, id))v5)[2](v5, *(void *)(a1 + 48), *(void *)(a1 + 56), v6);

    *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
}

- (int64_t)_findBestType
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_referenceDateInterval) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_dateNodes;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        int64_t v9 = -[PGTitleGeneratorDateMatching _matchingTypeForDateNode:](self, "_matchingTypeForDateNode:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v9)
        {
          int64_t v10 = v9;
          if ([(id)objc_opt_class() type:v9 isBetterThanType:v6]) {
            int64_t v6 = v10;
          }
        }
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_dateNodeIntersectsWithReferenceDateIntervalByIgnoringYear
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_referenceDateInterval)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v3 = self->_dateNodes;
    uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      int64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(v3);
          }
          int64_t v10 = [*(id *)(*((void *)&v32 + 1) + 8 * i) localDate];
          if (!v7 || [v7 compare:v10] == 1)
          {
            id v11 = v10;

            uint64_t v7 = v11;
          }
          if (!v6 || [v6 compare:v10] == -1)
          {
            id v12 = v10;

            int64_t v6 = v12;
          }
        }
        uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v5);

      if (!v7)
      {
        v28 = 0;
        goto LABEL_31;
      }
      v3 = [(NSDateInterval *)self->_referenceDateInterval startDate];
      long long v13 = [MEMORY[0x1E4F76C68] components:24 fromDate:v3];
      long long v14 = (void *)MEMORY[0x1E4F76C68];
      long long v15 = [(NSDateInterval *)self->_referenceDateInterval endDate];
      long long v31 = [v14 components:24 fromDate:v15];
      while (2)
      {

        id v16 = v7;
        uint64_t v17 = [MEMORY[0x1E4F76C68] components:24 fromDate:v16];
        v18 = [MEMORY[0x1E4F76C68] components:24 fromDate:v6];
        id v30 = v16;
        do
        {
          uint64_t v19 = objc_msgSend(v13, "day", v30);
          if (v19 == [v17 day])
          {
            uint64_t v20 = [v13 month];
            if (v20 == [v17 month])
            {
              LOBYTE(v7) = 1;
              goto LABEL_28;
            }
          }
          long long v15 = [MEMORY[0x1E4F76C68] dateByAddingDays:1 toDate:v16];

          v21 = [MEMORY[0x1E4F76C68] components:24 fromDate:v15];

          uint64_t v22 = [v21 day];
          if (v22 > [v18 day]) {
            break;
          }
          uint64_t v23 = [v21 month];
          uint64_t v17 = v21;
          id v16 = v15;
        }
        while (v23 <= [v18 month]);
        uint64_t v24 = [MEMORY[0x1E4F76C68] dateByAddingDays:1 toDate:v3];

        v25 = [MEMORY[0x1E4F76C68] components:24 fromDate:v24];

        uint64_t v26 = [v25 day];
        if (v26 <= [v31 day])
        {
          uint64_t v27 = [v25 month];
          if (v27 <= [v31 month])
          {

            long long v13 = v25;
            v3 = (NSSet *)v24;
            continue;
          }
        }
        break;
      }
      LOBYTE(v7) = 0;
      uint64_t v17 = v21;
      v3 = (NSSet *)v24;
      id v16 = v15;
      long long v13 = v25;
LABEL_28:

      v28 = v30;
    }
    else
    {
      v28 = 0;
      int64_t v6 = 0;
      LOBYTE(v7) = 0;
    }

LABEL_31:
    return (char)v7;
  }
  LOBYTE(v7) = 0;
  return (char)v7;
}

- (unint64_t)allowedTimeTitleFormats
{
  int64_t type = self->_type;
  if (!type) {
    return 3;
  }
  if (type == 4
    && (+[PGUserDefaults isShowingHolidayCalendarEvents]
     || +[PGUserDefaults isAlwaysShowingHolidayCalendarEvents]))
  {
    return 4;
  }
  return 1;
}

- (PGTitle)title
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"PGRelativeDateTitleOnThisDay" value:@"PGRelativeDateTitleOnThisDay" table:@"Localizable"];

  int64_t type = self->_type;
  if ((unint64_t)(type - 1) >= 2)
  {
    if (type != 3)
    {
      if (type != 4) {
        goto LABEL_25;
      }
      if (+[PGUserDefaults isAlwaysShowingHolidayCalendarEvents])
      {
        int64_t v6 = +[PGCommonTitleUtility holidayNameForDateNodes:self->_dateNodes];
        goto LABEL_8;
      }
      if (+[PGUserDefaults isShowingHolidayCalendarEvents])
      {
        int64_t v6 = self->_holidayName;
LABEL_8:
        id v7 = v6;
        char v8 = 0;
        if (!v6)
        {
LABEL_9:
          int64_t v9 = 0;
          goto LABEL_26;
        }
        goto LABEL_12;
      }
    }
    if ([(PGTitleGeneratorDateMatching *)self _dateNodeIntersectsWithReferenceDateIntervalByIgnoringYear])
    {
      goto LABEL_11;
    }
LABEL_25:
    int64_t v9 = 0;
    id v7 = 0;
    goto LABEL_26;
  }
LABEL_11:
  id v7 = v4;
  char v8 = 1;
  if (!v7) {
    goto LABEL_9;
  }
LABEL_12:
  unint64_t lineBreakBehavior = self->_lineBreakBehavior;
  if (self->_isForHighlight) {
    char v11 = v8;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0)
  {
    id v12 = +[PGHighlightsTitleSpecFactory titleSpecForHolidayEventIncludingLocationIfPossible:1];
    [v12 setInsertNonBreakableSpace:(lineBreakBehavior >> 1) & 1];
    long long v13 = [PGTitleSpecArgumentEvaluationContext alloc];
    long long v14 = [(PGTitleGenerationContext *)self->_titleGenerationContext locationHelper];
    long long v15 = [(PGTitleGenerationContext *)self->_titleGenerationContext serviceManager];
    id v16 = [(PGTitleSpecArgumentEvaluationContext *)v13 initWithLocationHelper:v14 serviceManager:v15];

    uint64_t v17 = [v12 titleWithMomentNodes:self->_momentNodes argumentEvaluationContext:v16];
    uint64_t v18 = [v17 stringValue];

    if (!v18)
    {
      uint64_t v19 = +[PGHighlightsTitleSpecFactory titleSpecForHolidayEventIncludingLocationIfPossible:0];
      [v19 setInsertNonBreakableSpace:(lineBreakBehavior >> 1) & 1];
      uint64_t v20 = [v19 titleWithMomentNodes:self->_momentNodes argumentEvaluationContext:v16];
      uint64_t v18 = [v20 stringValue];
    }
    id v7 = (id)v18;
  }
  if (lineBreakBehavior) {
    char v21 = v8;
  }
  else {
    char v21 = 1;
  }
  if ((v21 & 1) == 0)
  {
    uint64_t v22 = +[PGCommonTitleUtility titleWithLineBreakForTitle:v7];

    id v7 = (id)v22;
  }
  int64_t v9 = +[PGTitle titleWithString:v7 category:5];
LABEL_26:

  return (PGTitle *)v9;
}

- (PGTitleGeneratorDateMatching)initWithType:(int64_t)a3 referenceDateInterval:(id)a4 momentNodes:(id)a5 titleGenerationContext:(id)a6 holidayName:(id)a7 isForHighlight:(BOOL)a8
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v36 = a4;
  id v15 = a5;
  id v35 = a6;
  id v16 = a7;
  v38.receiver = self;
  v38.super_class = (Class)PGTitleGeneratorDateMatching;
  uint64_t v17 = [(PGTitleGeneratorDateMatching *)&v38 init];
  if (!v17) {
    goto LABEL_9;
  }
  if (![v15 count])
  {
    uint64_t v22 = 0;
    goto LABEL_11;
  }
  id v33 = v16;
  uint64_t v18 = [v15 anyObject];
  uint64_t v19 = [v18 graph];

  long long v34 = v19;
  objc_storeStrong((id *)&v17->_graph, v19);
  objc_storeStrong((id *)&v17->_referenceDateInterval, a4);
  objc_storeStrong((id *)&v17->_momentNodes, a5);
  uint64_t v20 = +[PGCommonTitleUtility dateNodesFromMomentNodes:v15];
  dateNodes = v17->_dateNodes;
  v17->_dateNodes = (NSSet *)v20;

  objc_storeStrong((id *)&v17->_titleGenerationContext, a6);
  objc_storeStrong((id *)&v17->_holidayName, a7);
  v17->_isForHighlight = a8;
  if ([(NSSet *)v17->_dateNodes count] != 1 || v17->_holidayName)
  {
    id v16 = v33;
    goto LABEL_6;
  }
  BOOL v24 = +[PGUserDefaults isAlwaysShowingHolidayCalendarEvents];
  v25 = v17->_dateNodes;
  id v16 = v33;
  if (!v24)
  {
    id v37 = 0;
    BOOL v28 = +[PGCommonTitleUtility containsCelebrationForDateNodes:v25 holidayName:&v37 titleGenerationContext:v17->_titleGenerationContext graph:v17->_graph];
    id v29 = v37;
    id v30 = v37;
    long long v31 = v30;
    if (v28)
    {
      if (v30)
      {
        objc_storeStrong((id *)&v17->_holidayName, v29);
        a3 = 4;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          long long v32 = v17->_dateNodes;
          *(_DWORD *)buf = 138412290;
          v40 = v32;
          _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Date %@ contains celebration but holiday name is nil", buf, 0xCu);
        }
        a3 = [(PGTitleGeneratorDateMatching *)v17 _findBestType];
      }
    }

    goto LABEL_6;
  }
  uint64_t v26 = +[PGCommonTitleUtility holidayNameForDateNodes:v25];
  uint64_t v27 = [v26 length];

  if (!v27)
  {
LABEL_6:
    if (!a3) {
      a3 = [(PGTitleGeneratorDateMatching *)v17 _findBestType];
    }
    goto LABEL_8;
  }
  a3 = 4;
LABEL_8:
  v17->_int64_t type = a3;

LABEL_9:
  uint64_t v22 = v17;
LABEL_11:

  return v22;
}

- (PGTitleGeneratorDateMatching)initWithType:(int64_t)a3 referenceDateInterval:(id)a4 momentNodes:(id)a5 titleGenerationContext:(id)a6
{
  return [(PGTitleGeneratorDateMatching *)self initWithType:a3 referenceDateInterval:a4 momentNodes:a5 titleGenerationContext:a6 holidayName:0 isForHighlight:0];
}

- (PGTitleGeneratorDateMatching)initWithType:(int64_t)a3 referenceDateInterval:(id)a4 highlightNode:(id)a5 titleGenerationContext:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = [a5 collection];
  long long v13 = [v12 momentNodes];

  if ([v13 count])
  {
    long long v14 = [v13 temporarySet];
    self = [(PGTitleGeneratorDateMatching *)self initWithType:a3 referenceDateInterval:v10 momentNodes:v14 titleGenerationContext:v11];

    id v15 = self;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (PGTitleGeneratorDateMatching)initWithType:(int64_t)a3 referenceDateInterval:(id)a4 momentNodes:(id)a5 lineBreakBehavior:(unint64_t)a6 isForHighlight:(BOOL)a7 titleGenerationContext:(id)a8
{
  result = [(PGTitleGeneratorDateMatching *)self initWithType:a3 referenceDateInterval:a4 momentNodes:a5 titleGenerationContext:a8 holidayName:0 isForHighlight:a7];
  if (result) {
    result->_unint64_t lineBreakBehavior = a6;
  }
  return result;
}

+ (id)_typeMatchings
{
  if (_typeMatchings_onceToken != -1) {
    dispatch_once(&_typeMatchings_onceToken, &__block_literal_global_29064);
  }
  v2 = (void *)_typeMatchings_typeMatchingBlocks;
  return v2;
}

void __46__PGTitleGeneratorDateMatching__typeMatchings__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = +[PGTitleGeneratorTypeMatching typeMatchingWithType:8 eventEvaluationBlock:&__block_literal_global_273];
  v4[0] = v0;
  v1 = +[PGTitleGeneratorTypeMatching typeMatchingWithType:9 eventEvaluationBlock:&__block_literal_global_277];
  v4[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  v3 = (void *)_typeMatchings_typeMatchingBlocks;
  _typeMatchings_typeMatchingBlocks = v2;
}

BOOL __46__PGTitleGeneratorDateMatching__typeMatchings__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4F76C80] dateIntervalIntersectsWeekend:v5])
  {
    id v18 = 0;
    double v19 = 0.0;
    id v7 = (void *)MEMORY[0x1E4F76C80];
    char v8 = [v5 startDate];
    [v7 nextWeekendLocalStartDate:&v18 interval:&v19 options:4 afterDate:v8];
    id v9 = v18;

    [v9 timeIntervalSince1970];
    double v11 = v10;

    double v12 = v11 + v19;
    [v6 timestampUTCStart];
    double v14 = v13;
    [v6 timestampUTCEnd];
    BOOL v16 = v14 < v12 && v15 > v11;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

uint64_t __46__PGTitleGeneratorDateMatching__typeMatchings__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  id v20 = 0;
  double v21 = 0.0;
  id v7 = (void *)MEMORY[0x1E4F76C80];
  char v8 = [v5 startDate];
  uint64_t v9 = [v7 nextWeekendLocalStartDate:&v20 interval:&v21 options:0 afterDate:v8];
  id v10 = v20;

  if (v9)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
    double v12 = (void *)[v11 initWithStartDate:v10 duration:v21];
    if ([v5 intersectsDateInterval:v12])
    {
      [v10 timeIntervalSince1970];
      double v14 = v13;
      double v15 = v13 + v21;
      [v6 timestampUTCStart];
      double v17 = v16;
      [v6 timestampUTCEnd];
      uint64_t v9 = v17 < v15 && v18 > v14;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

+ (BOOL)type:(int64_t)a3 isBetterThanType:(int64_t)a4
{
  BOOL v4 = 0;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 && a3 != a4)
  {
    [(id)objc_opt_class() _typeMatchings];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v18;
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(obj);
          }
          double v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v14 type] == a3) {
            unint64_t v12 = v9 + i;
          }
          if ([v14 type] == a4) {
            unint64_t v11 = v9 + i;
          }
        }
        v9 += v8;
        uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    BOOL v4 = v12 < v11;
  }
  return v4;
}

@end