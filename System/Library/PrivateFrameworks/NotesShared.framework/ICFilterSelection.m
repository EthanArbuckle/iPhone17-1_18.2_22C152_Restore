@interface ICFilterSelection
+ (NSSet)cloudSpecificFilterTypes;
+ (id)keyPathsForValuesAffectingHasEmptySelection;
+ (id)keyPathsForValuesAffectingIsEmpty;
+ (id)keyPathsForValuesAffectingIsValid;
- (BOOL)hasEmptySelection;
- (BOOL)includeRecentlyDeleted;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToICFilterSelection:(id)a3;
- (BOOL)isValid;
- (ICFilterSelection)init;
- (ICFilterSelection)initWithFilterTypeSelection:(id)a3;
- (ICFilterSelection)initWithFilterTypeSelections:(id)a3 joinOperator:(unint64_t)a4;
- (NSArray)emptyFilterTypeSelections;
- (NSArray)filterTypeSelections;
- (NSArray)incompatibleLockedNotesFilterTypeSelections;
- (NSArray)invalidFilterTypeSelectionCombinations;
- (NSString)emptySummary;
- (NSString)emptySummaryTitle;
- (NSString)invalidSummary;
- (NSString)invalidSummaryTitle;
- (NSString)primaryDateSummary;
- (NSString)secondaryDateSummary;
- (NSString)summaryWithJoinOperatorMenu;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)filterTypeSelectionForFilterType:(int64_t)a3;
- (unint64_t)hash;
- (unint64_t)joinOperator;
- (void)setFilterTypeSelections:(id)a3;
- (void)setIncludeRecentlyDeleted:(BOOL)a3;
- (void)setJoinOperator:(unint64_t)a3;
- (void)setSelection:(id)a3 forFilterType:(int64_t)a4;
@end

@implementation ICFilterSelection

+ (NSSet)cloudSpecificFilterTypes
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F1F62D90];
}

- (ICFilterSelection)init
{
  return [(ICFilterSelection *)self initWithFilterTypeSelections:MEMORY[0x1E4F1CBF0] joinOperator:0];
}

- (ICFilterSelection)initWithFilterTypeSelections:(id)a3 joinOperator:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICFilterSelection;
  v8 = [(ICFilterSelection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_includeRecentlyDeleted = 0;
    objc_storeStrong((id *)&v8->_filterTypeSelections, a3);
    v9->_joinOperator = a4;
  }

  return v9;
}

- (ICFilterSelection)initWithFilterTypeSelection:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = -[ICFilterSelection initWithFilterTypeSelections:joinOperator:](self, "initWithFilterTypeSelections:joinOperator:", v6, 0, v9, v10);
  return v7;
}

- (id)filterTypeSelectionForFilterType:(int64_t)a3
{
  v4 = [(ICFilterSelection *)self filterTypeSelections];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__ICFilterSelection_filterTypeSelectionForFilterType___block_invoke;
  v7[3] = &__block_descriptor_40_e38_B32__0__ICFilterTypeSelection_8Q16_B24l;
  v7[4] = a3;
  id v5 = objc_msgSend(v4, "ic_objectPassingTest:", v7);

  return v5;
}

BOOL __54__ICFilterSelection_filterTypeSelectionForFilterType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 filterType] == *(void *)(a1 + 32);
}

- (void)setSelection:(id)a3 forFilterType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(ICFilterSelection *)self filterTypeSelections];
  v8 = (void *)[v7 mutableCopy];

  id v9 = [(ICFilterSelection *)self filterTypeSelections];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__ICFilterSelection_setSelection_forFilterType___block_invoke;
  v12[3] = &__block_descriptor_40_e38_B32__0__ICFilterTypeSelection_8Q16_B24l;
  v12[4] = a4;
  uint64_t v10 = [v9 indexOfObjectPassingTest:v12];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    [v8 removeObjectAtIndex:v10];
  }
  objc_msgSend(v8, "ic_addNonNilObject:", v6);
  objc_super v11 = (void *)[v8 copy];
  [(ICFilterSelection *)self setFilterTypeSelections:v11];
}

BOOL __48__ICFilterSelection_setSelection_forFilterType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 filterType] == *(void *)(a1 + 32);
}

+ (id)keyPathsForValuesAffectingIsEmpty
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = NSStringFromSelector(sel_filterTypeSelections);
  v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return v4;
}

- (BOOL)isEmpty
{
  v2 = [(ICFilterSelection *)self filterTypeSelections];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingIsValid
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v3 = NSStringFromSelector(sel_filterTypeSelections);
  v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return v4;
}

- (BOOL)isValid
{
  BOOL v3 = [(ICFilterSelection *)self incompatibleLockedNotesFilterTypeSelections];
  if ([v3 count])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    id v5 = [(ICFilterSelection *)self invalidFilterTypeSelectionCombinations];
    if ([v5 count] || -[ICFilterSelection hasEmptySelection](self, "hasEmptySelection"))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      id v6 = [(ICFilterSelection *)self filterTypeSelections];
      int v4 = objc_msgSend(v6, "ic_containsObjectPassingTest:", &__block_literal_global_69) ^ 1;
    }
  }

  return v4;
}

uint64_t __28__ICFilterSelection_isValid__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isValid] ^ 1;
}

- (NSString)invalidSummaryTitle
{
  BOOL v3 = [(ICFilterSelection *)self incompatibleLockedNotesFilterTypeSelections];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F83770];
    id v6 = @"About the Locked Notes Filter";
LABEL_5:
    id v9 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
    goto LABEL_6;
  }
  id v7 = [(ICFilterSelection *)self invalidFilterTypeSelectionCombinations];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v5 = (void *)MEMORY[0x1E4F83770];
    id v6 = @"Conflicting Filter Settings";
    goto LABEL_5;
  }
  if ([(ICFilterSelection *)self hasEmptySelection])
  {
    id v9 = [(ICFilterSelection *)self emptySummaryTitle];
  }
  else
  {
    id v9 = 0;
  }
LABEL_6:
  return (NSString *)v9;
}

- (NSString)invalidSummary
{
  BOOL v3 = [(ICFilterSelection *)self incompatibleLockedNotesFilterTypeSelections];
  if (![v3 count])
  {
    objc_super v11 = [(ICFilterSelection *)self invalidFilterTypeSelectionCombinations];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Your selected filters have conflicting settings and will not return any results." value:@"Your selected filters have conflicting settings and will not return any results." table:0 allowSiri:1];
    }
    else
    {
      if (![(ICFilterSelection *)self hasEmptySelection])
      {
LABEL_12:
        uint64_t v8 = 0;
        goto LABEL_21;
      }
      uint64_t v13 = [(ICFilterSelection *)self emptySummary];
    }
    uint64_t v8 = (void *)v13;
    goto LABEL_21;
  }
  uint64_t v4 = NSStringFromSelector(sel_filterName);
  id v5 = [v3 valueForKey:v4];

  if ([v3 count] == 1)
  {
    id v6 = [v3 firstObject];
    uint64_t v7 = [v6 filterType];

    uint64_t v8 = 0;
    switch(v7)
    {
      case -1:
      case 1:
      case 2:
      case 9:
      case 10:
        goto LABEL_20;
      case 0:
        id v9 = (void *)MEMORY[0x1E4F83770];
        uint64_t v10 = @"Since the content of a locked note is encrypted, combining the Locked Notes filter with the Tags filter will not return any results.";
        break;
      case 3:
        id v9 = (void *)MEMORY[0x1E4F83770];
        uint64_t v10 = @"Since the content of a locked note is encrypted, combining the Locked Notes filter with the Shared filter will not return any results.";
        break;
      case 4:
        id v9 = (void *)MEMORY[0x1E4F83770];
        uint64_t v10 = @"Since the content of a locked note is encrypted, combining the Locked Notes filter with the Mentions filter will not return any results.";
        break;
      case 5:
        id v9 = (void *)MEMORY[0x1E4F83770];
        uint64_t v10 = @"Since the content of a locked note is encrypted, combining the Locked Notes filter with the Checklists filter will not return any results.";
        break;
      case 6:
        id v9 = (void *)MEMORY[0x1E4F83770];
        uint64_t v10 = @"Since the content of a locked note is encrypted, combining the Locked Notes filter with the Attachments filter will not return any results.";
        break;
      case 7:
        id v9 = (void *)MEMORY[0x1E4F83770];
        uint64_t v10 = @"Since the content of a locked note is encrypted, combining the Locked Notes filter with the Folders filter will not return any results.";
        break;
      case 8:
        id v9 = (void *)MEMORY[0x1E4F83770];
        uint64_t v10 = @"Since the content of a locked note is encrypted, combining the Locked Notes filter with the Quick Notes filter will not return any results.";
        break;
      default:

        goto LABEL_12;
    }
    uint64_t v8 = [v9 localizedFrameworkStringForKey:v10 value:v10 table:0 allowSiri:1];
  }
  else
  {
    v14 = NSString;
    v15 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Since the content of a locked note is encrypted, combining the Locked Notes filter with the following filters will not return any results:\n\n%@", @"Since the content of a locked note is encrypted, combining the Locked Notes filter with the following filters will not return any results:\n\n%@", 0, 1 value table allowSiri];
    v16 = [v5 componentsJoinedByString:@"\n"];
    uint64_t v8 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v16);
  }
LABEL_20:

LABEL_21:
  return (NSString *)v8;
}

- (BOOL)hasEmptySelection
{
  v2 = [(ICFilterSelection *)self emptyFilterTypeSelections];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingHasEmptySelection
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v3 = NSStringFromSelector(sel_filterTypeSelections);
  uint64_t v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return v4;
}

- (NSString)emptySummaryTitle
{
  v2 = [(ICFilterSelection *)self emptyFilterTypeSelections];
  if ([v2 count])
  {
    if ([v2 count] == 1)
    {
      BOOL v3 = [v2 firstObject];
      uint64_t v4 = [v3 emptySummaryTitle];
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Multiple Filters Incomplete" value:@"Multiple Filters Incomplete" table:0 allowSiri:1];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)emptySummary
{
  BOOL v3 = [(ICFilterSelection *)self emptyFilterTypeSelections];
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      uint64_t v4 = [v3 firstObject];
      id v5 = [v4 emptySummary];
    }
    else
    {
      id v6 = [(ICFilterSelection *)self emptyFilterTypeSelections];
      uint64_t v4 = objc_msgSend(v6, "ic_compactMap:", &__block_literal_global_65_0);

      uint64_t v7 = [v4 componentsJoinedByString:@"\n"];
      uint64_t v8 = NSString;
      id v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You must select at least one: \n\n %@" value:@"You must select at least one: \n\n %@" table:0 allowSiri:1];
      id v5 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v7);
    }
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

uint64_t __33__ICFilterSelection_emptySummary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 shortEmptySummary];
}

- (NSString)summaryWithJoinOperatorMenu
{
  return (NSString *)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Include notes matching INLINE_MENU_PLEASE_READ_COMMENTS filters." value:@"Include notes matching INLINE_MENU_PLEASE_READ_COMMENTS filters." table:0 allowSiri:1];
}

- (id)debugDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = NSString;
  uint64_t v4 = NSStringFromICFilterSelectionJoinOperator((void *)[(ICFilterSelection *)self joinOperator]);
  id v5 = [v3 stringWithFormat:@"operator:%@", v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(ICFilterSelection *)self filterTypeSelections];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      objc_super v11 = v5;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v14 + 1) + 8 * v10) debugDescription];
        id v5 = [v11 stringByAppendingFormat:@"\n%@", v12];

        ++v10;
        objc_super v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(ICFilterSelection *)self filterTypeSelections];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__ICFilterSelection_copyWithZone___block_invoke;
  v9[3] = &__block_descriptor_40_e54___ICFilterTypeSelection_16__0__ICFilterTypeSelection_8l;
  v9[4] = a3;
  id v6 = objc_msgSend(v5, "ic_compactMap:", v9);

  uint64_t v7 = [+[ICFilterSelection allocWithZone:a3] initWithFilterTypeSelections:v6 joinOperator:[(ICFilterSelection *)self joinOperator]];
  return v7;
}

id __34__ICFilterSelection_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copyWithZone:*(void *)(a1 + 32)];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICFilterSelection *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ICFilterSelection *)self isEqualToICFilterSelection:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICFilterSelection joinOperator](self, "joinOperator"));
  uint64_t v4 = [v3 hash];
  id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICFilterSelection includeRecentlyDeleted](self, "includeRecentlyDeleted"));
  char v6 = [v5 hash];
  id v7 = [(ICFilterSelection *)self filterTypeSelections];
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v10 = [v9 hash];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v10 = ICHashWithObject(*(void **)(*((void *)&v25 + 1) + 8 * i)) - v10 + 32 * v10;
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  unint64_t v23 = ICHashWithHashKeys(v4, v16, v17, v18, v19, v20, v21, v22, v6);
  return v23;
}

- (BOOL)isEqualToICFilterSelection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICFilterSelection *)self joinOperator];
  if (v5 == [v4 joinOperator]
    && (int v6 = [(ICFilterSelection *)self includeRecentlyDeleted],
        v6 == [v4 includeRecentlyDeleted]))
  {
    uint64_t v8 = [(ICFilterSelection *)self filterTypeSelections];
    uint64_t v9 = [v4 filterTypeSelections];
    char v7 = [v8 isEqualToArray:v9];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSArray)emptyFilterTypeSelections
{
  v2 = [(ICFilterSelection *)self filterTypeSelections];
  BOOL v3 = objc_msgSend(v2, "ic_objectsPassingTest:", &__block_literal_global_83);

  return (NSArray *)v3;
}

uint64_t __46__ICFilterSelection_emptyFilterTypeSelections__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEmpty];
}

- (NSArray)invalidFilterTypeSelectionCombinations
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if ([(ICFilterSelection *)self joinOperator])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_22;
  }
  objc_opt_class();
  id v4 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:3];
  unint64_t v5 = ICDynamicCast();

  if (v5 && [v5 selectionType] == 3)
  {
    objc_opt_class();
    int v6 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:7];
    char v7 = ICDynamicCast();

    objc_opt_class();
    uint64_t v8 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:4];
    uint64_t v9 = ICDynamicCast();

    if (v7 && ![v7 inclusionType] && objc_msgSend(v7, "containsSharedFolder"))
    {
      v23[0] = v5;
      uint64_t v10 = (void **)v23;
      id v11 = v7;
LABEL_26:
      v10[1] = v11;
      BOOL v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

      goto LABEL_21;
    }
    if (v9 && [v9 selectionType] != 3)
    {
      uint64_t v22 = v5;
      uint64_t v10 = &v22;
      id v11 = v9;
      goto LABEL_26;
    }
  }
  objc_opt_class();
  uint64_t v12 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:1];
  char v7 = ICDynamicCast();

  if (!v7) {
    goto LABEL_20;
  }
  if ([v7 selectionType] != 8) {
    goto LABEL_20;
  }
  uint64_t v13 = [(ICFilterSelection *)self filterTypeSelections];
  unint64_t v14 = [v13 count];

  if (v14 < 2) {
    goto LABEL_20;
  }
  objc_opt_class();
  long long v15 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:2];
  uint64_t v16 = ICDynamicCast();

  if (!v16
    || [v7 selectionType] != 8
    || ([v16 primaryDate],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        [v7 primaryDate],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        char v19 = objc_msgSend(v17, "ic_isEarlierThanDate:", v18),
        v18,
        v17,
        (v19 & 1) == 0))
  {

LABEL_20:
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_21;
  }
  v21[0] = v7;
  v21[1] = v16;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

LABEL_21:
LABEL_22:
  return (NSArray *)v3;
}

- (NSArray)incompatibleLockedNotesFilterTypeSelections
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  id v4 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:10];
  unint64_t v5 = ICDynamicCast();

  if (v5)
  {
    if (![v5 inclusionType])
    {
      int v6 = [(ICFilterSelection *)self filterTypeSelections];
      unint64_t v7 = [v6 count];

      if (v7 >= 2)
      {
        objc_opt_class();
        uint64_t v8 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:0];
        uint64_t v9 = ICDynamicCast();

        if (v9 && [v9 mode] != 2) {
          [v3 addObject:v9];
        }
        objc_opt_class();
        uint64_t v10 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:3];
        id v11 = ICDynamicCast();

        if (v11 && [v11 selectionType] != 3) {
          [v3 addObject:v11];
        }
        objc_opt_class();
        uint64_t v12 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:4];
        uint64_t v13 = ICDynamicCast();

        if (v13 && [v13 selectionType] != 3) {
          [v3 addObject:v13];
        }
        objc_opt_class();
        unint64_t v14 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:8];
        long long v15 = ICDynamicCast();

        if (v15 && ![v15 inclusionType]) {
          [v3 addObject:v15];
        }
        long long v25 = v11;
        objc_opt_class();
        uint64_t v16 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:7];
        uint64_t v17 = ICDynamicCast();

        if (v17 && ![v17 inclusionType] && objc_msgSend(v17, "containsSharedFolder")) {
          [v3 addObject:v17];
        }
        uint64_t v18 = v9;
        objc_opt_class();
        char v19 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:5];
        uint64_t v20 = ICDynamicCast();

        if (v20 && [v20 selectionType] != 3) {
          [v3 addObject:v20];
        }
        objc_opt_class();
        uint64_t v21 = [(ICFilterSelection *)self filterTypeSelectionForFilterType:6];
        uint64_t v22 = ICDynamicCast();

        if (v22 && [v22 selectionType] != 9) {
          [v3 addObject:v22];
        }
      }
    }
  }
  unint64_t v23 = (void *)[v3 copy];

  return (NSArray *)v23;
}

- (unint64_t)joinOperator
{
  return self->_joinOperator;
}

- (void)setJoinOperator:(unint64_t)a3
{
  self->_joinOperator = a3;
}

- (NSArray)filterTypeSelections
{
  return self->_filterTypeSelections;
}

- (void)setFilterTypeSelections:(id)a3
{
}

- (BOOL)includeRecentlyDeleted
{
  return self->_includeRecentlyDeleted;
}

- (void)setIncludeRecentlyDeleted:(BOOL)a3
{
  self->_includeRecentlyDeleted = a3;
}

- (NSString)primaryDateSummary
{
  return self->_primaryDateSummary;
}

- (NSString)secondaryDateSummary
{
  return self->_secondaryDateSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryDateSummary, 0);
  objc_storeStrong((id *)&self->_primaryDateSummary, 0);
  objc_storeStrong((id *)&self->_filterTypeSelections, 0);
}

@end