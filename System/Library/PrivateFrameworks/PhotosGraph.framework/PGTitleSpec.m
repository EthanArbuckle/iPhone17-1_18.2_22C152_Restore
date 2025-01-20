@interface PGTitleSpec
+ (id)specWithFormat:(id)a3 titleCategory:(int64_t)a4;
+ (int64_t)_weekdayForWeekdayCriteria:(unint64_t)a3;
- (BOOL)_canFulfillWeekdayCriteriaWithMomentNodes:(id)a3;
- (BOOL)_resolveRequiredInputForArgument:(id)a3;
- (BOOL)hasLineBreak;
- (BOOL)hasSpecArgumentHandlingLineBreakBehavior;
- (BOOL)insertNonBreakableSpace;
- (NSArray)arguments;
- (NSString)format;
- (PGTitleSpec)initWithFormat:(id)a3 titleCategory:(int64_t)a4;
- (PGTitleSpecDelegate)delegate;
- (id)_appendArguments:(id)a3 toFormatString:(id)a4;
- (id)_titleWithResolvedArguments:(id)a3;
- (id)description;
- (id)titleWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4;
- (id)titleWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5;
- (int64_t)titleCategory;
- (unint64_t)weekdayCriteria;
- (void)setArguments:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasLineBreak:(BOOL)a3;
- (void)setHasSpecArgumentHandlingLineBreakBehavior:(BOOL)a3;
- (void)setInsertNonBreakableSpace:(BOOL)a3;
- (void)setWeekdayCriteria:(unint64_t)a3;
@end

@implementation PGTitleSpec

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

- (void)setHasSpecArgumentHandlingLineBreakBehavior:(BOOL)a3
{
  self->_hasSpecArgumentHandlingLineBreakBehavior = a3;
}

- (BOOL)hasSpecArgumentHandlingLineBreakBehavior
{
  return self->_hasSpecArgumentHandlingLineBreakBehavior;
}

- (void)setInsertNonBreakableSpace:(BOOL)a3
{
  self->_insertNonBreakableSpace = a3;
}

- (BOOL)insertNonBreakableSpace
{
  return self->_insertNonBreakableSpace;
}

- (void)setDelegate:(id)a3
{
}

- (PGTitleSpecDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PGTitleSpecDelegate *)WeakRetained;
}

- (int64_t)titleCategory
{
  return self->_titleCategory;
}

- (void)setWeekdayCriteria:(unint64_t)a3
{
  self->_weekdayCriteria = a3;
}

- (unint64_t)weekdayCriteria
{
  return self->_weekdayCriteria;
}

- (void)setHasLineBreak:(BOOL)a3
{
  self->_hasLineBreak = a3;
}

- (BOOL)hasLineBreak
{
  return self->_hasLineBreak;
}

- (void)setArguments:(id)a3
{
}

- (NSArray)arguments
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)format
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGTitleSpec;
  v4 = [(PGTitleSpec *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ %@", v4, self->_format];

  return v5;
}

- (BOOL)_canFulfillWeekdayCriteriaWithMomentNodes:(id)a3
{
  if (!self->_weekdayCriteria) {
    return 1;
  }
  v4 = +[PGTimeTitleUtility significantDateNodesFromMomentNodes:a3 dateFormatterType:5];
  if ([v4 count] == 1)
  {
    v5 = [v4 anyObject];
    v6 = [v5 localDate];
    uint64_t v7 = [MEMORY[0x1E4F76C68] dayOfWeekFromDate:v6];
    BOOL v8 = v7 == [(id)objc_opt_class() _weekdayForWeekdayCriteria:self->_weekdayCriteria];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_appendArguments:(id)a3 toFormatString:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  switch([v5 count])
  {
    case 0:
      id v7 = v6;
      break;
    case 1:
      v10 = [v5 objectAtIndexedSubscript:0];
      PFLocalizedStringWithValidatedFormat();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      v10 = [v5 objectAtIndexedSubscript:0];
      v11 = [v5 objectAtIndexedSubscript:1];
      PFLocalizedStringWithValidatedFormat();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      v10 = [v5 objectAtIndexedSubscript:0];
      v11 = [v5 objectAtIndexedSubscript:1];
      v13 = [v5 objectAtIndexedSubscript:2];
      PFLocalizedStringWithValidatedFormat();
      id v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
LABEL_10:

      break;
    default:
      BOOL v8 = +[PGLogging sharedLogging];
      v9 = [v8 loggingConnection];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = 3;
        _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "Not able to resolve a string with more than %lu arguments. Please file a radar agains Photos Media Mining.", buf, 0xCu);
      }

      id v7 = 0;
      break;
  }

  return v7;
}

- (BOOL)_resolveRequiredInputForArgument:(id)a3
{
  id v4 = a3;
  id v5 = [v4 inputVariable];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v8 = [WeakRetained titleSpec:self inputForArgument:v4];

    BOOL v6 = v8 != 0;
    [v4 setInputVariable:v8];
  }
  return v6;
}

- (id)_titleWithResolvedArguments:(id)a3
{
  id v4 = a3;
  id v5 = [(PGTitleSpec *)self _appendArguments:v4 toFormatString:self->_format];
  if (!v5)
  {
    v9 = 0;
    goto LABEL_9;
  }
  BOOL v6 = v5;
  if (!self->_hasSpecArgumentHandlingLineBreakBehavior)
  {
    if (self->_insertNonBreakableSpace)
    {
      uint64_t v7 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];

      uint64_t v8 = +[PGCommonTitleUtility titleWithNoLineBreakSpaceForTitle:v7 andUsedNames:v4];
      BOOL v6 = (void *)v7;
    }
    else
    {
      if (self->_hasLineBreak) {
        goto LABEL_8;
      }
      uint64_t v8 = +[PGCommonTitleUtility titleWithLineBreakForTitle:v5 andUsedNames:v4];
    }

    BOOL v6 = (void *)v8;
  }
LABEL_8:
  v9 = +[PGTitle titleWithString:v6 category:self->_titleCategory];

LABEL_9:
  return v9;
}

- (id)titleWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PGTitleSpec *)self _canFulfillWeekdayCriteriaWithMomentNodes:v8])
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_arguments, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = self->_arguments;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v17, "requiresInput", (void)v21)
            && ![(PGTitleSpec *)self _resolveRequiredInputForArgument:v17])
          {
            goto LABEL_15;
          }
          v18 = [v17 _resolvedStringWithMomentNodes:v8 features:v9 argumentEvaluationContext:v10];
          if (![v18 length])
          {

LABEL_15:
            v19 = 0;
            goto LABEL_16;
          }
          [v11 addObject:v18];
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    v19 = [(PGTitleSpec *)self _titleWithResolvedArguments:v11];
LABEL_16:
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)titleWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(PGTitleSpec *)self _canFulfillWeekdayCriteriaWithMomentNodes:v6])
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_arguments, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = self->_arguments;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v14, "requiresInput", (void)v18)
            && ![(PGTitleSpec *)self _resolveRequiredInputForArgument:v14])
          {
            goto LABEL_15;
          }
          uint64_t v15 = [v14 _resolvedStringWithMomentNodes:v6 argumentEvaluationContext:v7];
          if (![v15 length])
          {

LABEL_15:
            uint64_t v16 = 0;
            goto LABEL_16;
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    uint64_t v16 = [(PGTitleSpec *)self _titleWithResolvedArguments:v8];
LABEL_16:
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (PGTitleSpec)initWithFormat:(id)a3 titleCategory:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PGTitleSpec;
  id v8 = [(PGTitleSpec *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_format, a3);
    v9->_titleCategory = a4;
    arguments = v9->_arguments;
    v9->_arguments = (NSArray *)MEMORY[0x1E4F1CBF0];

    v9->_weekdayCriteria = 0;
  }

  return v9;
}

+ (int64_t)_weekdayForWeekdayCriteria:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return -1;
  }
  else {
    return qword_1D1F4F5C0[a3 - 1];
  }
}

+ (id)specWithFormat:(id)a3 titleCategory:(int64_t)a4
{
  id v5 = a3;
  id v6 = [[PGTitleSpec alloc] initWithFormat:v5 titleCategory:a4];

  return v6;
}

@end