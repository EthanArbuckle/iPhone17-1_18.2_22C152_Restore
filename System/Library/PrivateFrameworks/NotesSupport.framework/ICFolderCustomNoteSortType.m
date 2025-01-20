@interface ICFolderCustomNoteSortType
+ (BOOL)isTagADirection:(int64_t)a3;
+ (BOOL)isTagAnOrder:(int64_t)a3;
+ (ICFolderCustomNoteSortType)querySortType;
+ (NSArray)sortTypeOrderValues;
+ (NSString)currentDefaultMenuItemString;
+ (id)actionItemTitleForOrder:(int64_t)a3;
+ (id)folderNoteSortTypeFromValue:(id)a3;
+ (id)folderNoteSortTypeWithOrder:(int64_t)a3 direction:(int64_t)a4;
+ (id)noteSortTypeDefaultAscending;
+ (id)segmentItemTitleForOrder:(int64_t)a3;
+ (id)stringNameForDirection:(int64_t)a3 order:(int64_t)a4;
+ (int64_t)customOrderForCurrentNoteListSortType;
+ (int64_t)customOrderForGlobalSortType:(int64_t)a3;
+ (int64_t)sortTypeDirectionForTag:(unint64_t)a3;
+ (int64_t)sortTypeOrderForTag:(unint64_t)a3;
+ (unint64_t)tagForSortTypeDirection:(int64_t)a3;
+ (unint64_t)tagForSortTypeOrder:(int64_t)a3;
+ (void)setQuerySortType:(id)a3;
- (BOOL)isAscending;
- (BOOL)isDefault;
- (BOOL)isEqual:(id)a3;
- (NSNumber)valueRepresentation;
- (NSString)summaryViewTitleDescription;
- (id)currentActionItemTitle;
- (id)debugStringNameForOrder:(int64_t)a3;
- (id)description;
- (id)folderNoteSortTypeByChangingDirection;
- (id)folderNoteSortTypeByChangingOrder:(int64_t)a3;
- (int64_t)direction;
- (int64_t)order;
- (int64_t)resolvedCustomSortTypeOrder;
- (void)setDirection:(int64_t)a3;
- (void)setOrder:(int64_t)a3;
@end

@implementation ICFolderCustomNoteSortType

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = ICDynamicCast(v5, (uint64_t)v4);

  if (v6 && (uint64_t v7 = [v6 order], v7 == -[ICFolderCustomNoteSortType order](self, "order")))
  {
    uint64_t v8 = [v6 direction];
    BOOL v9 = v8 == [(ICFolderCustomNoteSortType *)self direction];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (int64_t)resolvedCustomSortTypeOrder
{
  int64_t result = [(ICFolderCustomNoteSortType *)self order];
  if (!result)
  {
    return +[ICFolderCustomNoteSortType customOrderForCurrentNoteListSortType];
  }
  return result;
}

- (int64_t)order
{
  return self->_order;
}

- (int64_t)direction
{
  return self->_direction;
}

+ (id)folderNoteSortTypeWithOrder:(int64_t)a3 direction:(int64_t)a4
{
  int64_t v6 = a3;
  if ((unint64_t)a3 >= 4)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICFolderCustomNoteSortType folderNoteSortTypeWithOrder:direction:]", 1, 0, @"Incorrect value for folder note sort order %d, using default", a3);
    int64_t v6 = 0;
  }
  if ((unint64_t)a4 >= 2)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICFolderCustomNoteSortType folderNoteSortTypeWithOrder:direction:]", 1, 0, @"Incorrect value for folder note sort direction %d, using ascending", a3);
    a4 = 0;
  }
  uint64_t v7 = objc_alloc_init(ICFolderCustomNoteSortType);
  [(ICFolderCustomNoteSortType *)v7 setOrder:v6];
  [(ICFolderCustomNoteSortType *)v7 setDirection:a4];
  return v7;
}

- (void)setOrder:(int64_t)a3
{
  self->_order = a3;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

+ (id)noteSortTypeDefaultAscending
{
  return +[ICFolderCustomNoteSortType folderNoteSortTypeWithOrder:0 direction:0];
}

- (id)folderNoteSortTypeByChangingOrder:(int64_t)a3
{
  uint64_t v5 = objc_opt_class();
  int64_t v6 = [(ICFolderCustomNoteSortType *)self direction];
  return (id)[v5 folderNoteSortTypeWithOrder:a3 direction:v6];
}

- (id)folderNoteSortTypeByChangingDirection
{
  uint64_t v3 = [(ICFolderCustomNoteSortType *)self order];
  if (!v3) {
    uint64_t v3 = objc_msgSend((id)objc_opt_class(), "customOrderForGlobalSortType:", +[ICNoteListSortUtilities currentNoteListSortType](ICNoteListSortUtilities, "currentNoteListSortType"));
  }
  BOOL v4 = [(ICFolderCustomNoteSortType *)self direction] == 0;
  uint64_t v5 = objc_opt_class();
  return (id)[v5 folderNoteSortTypeWithOrder:v3 direction:v4];
}

+ (id)folderNoteSortTypeFromValue:(id)a3
{
  unint64_t v4 = [a3 integerValue];
  unint64_t v5 = v4;
  if (v4 <= 0x1F)
  {
    if (((1 << v4) & 0xC00) != 0)
    {
      uint64_t v6 = 1;
      goto LABEL_11;
    }
    if (((1 << v4) & 0x300000) != 0)
    {
      uint64_t v6 = 2;
      goto LABEL_11;
    }
    if (((1 << v4) & 0xC0000000) != 0)
    {
      uint64_t v6 = 3;
      goto LABEL_11;
    }
  }
  if (!v4)
  {
    uint64_t v6 = 0;
    goto LABEL_17;
  }
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICFolderCustomNoteSortType folderNoteSortTypeFromValue:]", 1, 0, @"Invalid value for cusotm sort type, using default");
  uint64_t v6 = 0;
LABEL_11:
  if (v5 > 0x1F)
  {
LABEL_15:
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICFolderCustomNoteSortType folderNoteSortTypeFromValue:]", 1, 0, @"Invalid value for cusotm sort type, using default");
    goto LABEL_16;
  }
  if (((1 << v5) & 0x40100401) == 0)
  {
    if (((1 << v5) & 0x80200800) != 0)
    {
      unint64_t v5 = 1;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
LABEL_16:
  unint64_t v5 = 0;
LABEL_17:
  return (id)[a1 folderNoteSortTypeWithOrder:v6 direction:v5];
}

- (NSNumber)valueRepresentation
{
  int64_t v3 = [(ICFolderCustomNoteSortType *)self order];
  int64_t v4 = [(ICFolderCustomNoteSortType *)self direction];
  uint64_t v5 = 30;
  if (v4) {
    uint64_t v5 = 31;
  }
  uint64_t v6 = 20;
  if (v4) {
    uint64_t v6 = 21;
  }
  uint64_t v7 = 10;
  if (v4) {
    uint64_t v7 = 11;
  }
  if (v3 != 1) {
    uint64_t v7 = 0;
  }
  if (v3 != 2) {
    uint64_t v6 = v7;
  }
  if (v3 == 3) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v6;
  }
  BOOL v9 = NSNumber;
  return (NSNumber *)[v9 numberWithInteger:v8];
}

- (id)description
{
  int64_t v3 = NSString;
  int64_t v4 = [(ICFolderCustomNoteSortType *)self debugStringNameForOrder:[(ICFolderCustomNoteSortType *)self order]];
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "stringNameForDirection:order:", -[ICFolderCustomNoteSortType direction](self, "direction"), -[ICFolderCustomNoteSortType order](self, "order"));
  uint64_t v6 = [v3 stringWithFormat:@"SortType: %@, %@", v4, v5];

  return v6;
}

- (id)debugStringNameForOrder:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_2640CD5C8[a3];
  }
}

- (BOOL)isDefault
{
  int64_t v3 = [(id)objc_opt_class() noteSortTypeDefaultAscending];
  LOBYTE(self) = [(ICFolderCustomNoteSortType *)self isEqual:v3];

  return (char)self;
}

- (BOOL)isAscending
{
  return [(ICFolderCustomNoteSortType *)self direction] == 0;
}

+ (NSString)currentDefaultMenuItemString
{
  int64_t v2 = +[ICNoteListSortUtilities currentNoteListSortType];
  switch(v2)
  {
    case 0:
      int64_t v3 = @"Default (Date Edited)";
      goto LABEL_7;
    case 1:
      int64_t v3 = @"Default (Date Created)";
      goto LABEL_7;
    case 2:
      int64_t v3 = @"Default (Title)";
LABEL_7:
      int64_t v4 = +[ICLocalization localizedFrameworkStringForKey:v3 value:v3 table:0 allowSiri:1];
      goto LABEL_9;
  }
  int64_t v4 = &stru_26C13B138;
LABEL_9:
  return (NSString *)v4;
}

+ (int64_t)customOrderForCurrentNoteListSortType
{
  int64_t v2 = +[ICNoteListSortUtilities currentNoteListSortType];
  return +[ICFolderCustomNoteSortType customOrderForGlobalSortType:v2];
}

+ (int64_t)customOrderForGlobalSortType:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 == 1) {
    int64_t v3 = 2;
  }
  if (a3 == 2) {
    return 3;
  }
  else {
    return v3;
  }
}

+ (int64_t)sortTypeOrderForTag:(unint64_t)a3
{
  if (a3 - 12114 >= 3) {
    return 0;
  }
  else {
    return a3 - 12113;
  }
}

+ (int64_t)sortTypeDirectionForTag:(unint64_t)a3
{
  return a3 == 12118;
}

+ (unint64_t)tagForSortTypeOrder:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 12113;
  }
  else {
    return a3 + 12113;
  }
}

+ (unint64_t)tagForSortTypeDirection:(int64_t)a3
{
  if (a3 == 1) {
    return 12118;
  }
  else {
    return 12117;
  }
}

+ (BOOL)isTagAnOrder:(int64_t)a3
{
  return (unint64_t)(a3 - 12113) < 4;
}

+ (BOOL)isTagADirection:(int64_t)a3
{
  return (unint64_t)(a3 - 12117) < 2;
}

+ (NSArray)sortTypeOrderValues
{
  if (sortTypeOrderValues_onceToken != -1) {
    dispatch_once(&sortTypeOrderValues_onceToken, &__block_literal_global_8);
  }
  int64_t v2 = (void *)sortTypeOrderValues_sortTypeOrderValues;
  return (NSArray *)v2;
}

void __49__ICFolderCustomNoteSortType_sortTypeOrderValues__block_invoke()
{
  v0 = (void *)sortTypeOrderValues_sortTypeOrderValues;
  sortTypeOrderValues_sortTypeOrderValues = (uint64_t)&unk_26C144DA8;
}

+ (id)stringNameForDirection:(int64_t)a3 order:(int64_t)a4
{
  if (!a4) {
    a4 = objc_msgSend((id)objc_opt_class(), "customOrderForGlobalSortType:", +[ICNoteListSortUtilities currentNoteListSortType](ICNoteListSortUtilities, "currentNoteListSortType"));
  }
  if (a4 == 3)
  {
    if (a3) {
      uint64_t v5 = @"Descending";
    }
    else {
      uint64_t v5 = @"Ascending";
    }
  }
  else if (a3)
  {
    uint64_t v5 = @"Oldest First";
  }
  else
  {
    uint64_t v5 = @"Newest First";
  }
  uint64_t v6 = +[ICLocalization localizedFrameworkStringForKey:v5 value:v5 table:0 allowSiri:1];
  return v6;
}

+ (id)actionItemTitleForOrder:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "currentDefaultMenuItemString", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      uint64_t v6 = @"Date Edited";
      goto LABEL_8;
    case 2:
      uint64_t v6 = @"Date Created";
LABEL_8:
      uint64_t v7 = v6;
      goto LABEL_10;
    case 3:
      uint64_t v6 = @"TITLE_SORT_BY";
      uint64_t v7 = @"Title";
LABEL_10:
      +[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v7, 0, 1, v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
      break;
    default:
      break;
  }
  return a1;
}

+ (ICFolderCustomNoteSortType)querySortType
{
  int64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 integerForKey:@"QuerySortType"];

  if (v3)
  {
    uint64_t v4 = [NSNumber numberWithInteger:v3];
    uint64_t v5 = +[ICFolderCustomNoteSortType folderNoteSortTypeFromValue:v4];
  }
  else
  {
    uint64_t v5 = +[ICFolderCustomNoteSortType noteSortTypeDefaultAscending];
  }
  return (ICFolderCustomNoteSortType *)v5;
}

+ (void)setQuerySortType:(id)a3
{
  id v4 = [a3 valueRepresentation];
  uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 setObject:v4 forKey:@"QuerySortType"];
}

- (NSString)summaryViewTitleDescription
{
  int64_t v2 = [(ICFolderCustomNoteSortType *)self order];
  switch(v2)
  {
    case 1:
      uint64_t v3 = @"Sorted by Date Edited";
      goto LABEL_7;
    case 2:
      uint64_t v3 = @"Sorted by Date Created";
      goto LABEL_7;
    case 3:
      uint64_t v3 = @"Sorted by Title";
LABEL_7:
      id v4 = +[ICLocalization localizedFrameworkStringForKey:v3 value:v3 table:0 allowSiri:1];
      goto LABEL_9;
  }
  id v4 = &stru_26C13B138;
LABEL_9:
  return (NSString *)v4;
}

- (id)currentActionItemTitle
{
  int64_t v3 = +[ICNoteListSortUtilities currentNoteListSortType];
  switch([(ICFolderCustomNoteSortType *)self order])
  {
    case 0:
      if (v3)
      {
        if (v3 == 1)
        {
          id v4 = @"Sort by Date Created (Default)";
        }
        else
        {
          if (v3 != 2) {
            goto LABEL_6;
          }
          id v4 = @"Sort by Title (Default)";
        }
      }
      else
      {
        id v4 = @"Sort by Date Edited (Default)";
      }
      goto LABEL_12;
    case 1:
      id v4 = @"Sort by Date Edited";
      goto LABEL_12;
    case 2:
      id v4 = @"Sort by Date Created";
      goto LABEL_12;
    case 3:
      id v4 = @"Sort by Title";
LABEL_12:
      uint64_t v5 = +[ICLocalization localizedFrameworkStringForKey:v4 value:v4 table:0 allowSiri:1];
      break;
    default:
LABEL_6:
      uint64_t v5 = &stru_26C13B138;
      break;
  }
  return v5;
}

+ (id)segmentItemTitleForOrder:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v5 = @"Default";
      goto LABEL_8;
    case 1:
      uint64_t v5 = @"Edited";
      goto LABEL_8;
    case 2:
      uint64_t v5 = @"Created";
LABEL_8:
      uint64_t v8 = v5;
      goto LABEL_10;
    case 3:
      uint64_t v5 = @"TITLE_SORT_BY";
      uint64_t v8 = @"Title";
LABEL_10:
      +[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", v5, v8, 0, 1, v3);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      uint64_t v6 = &stru_26C13B138;
      break;
  }
  return v6;
}

@end