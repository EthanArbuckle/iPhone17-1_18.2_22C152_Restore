@interface ICNoteListSortUtilities
+ (BOOL)isMenuItemCurrentSortTypeForTag:(int64_t)a3;
+ (id)dateForCurrentSortTypeAccessibilityStringForNote:(id)a3 folderNoteSortType:(id)a4;
+ (id)dateForCurrentSortTypeForNote:(id)a3 folderNoteSortType:(id)a4;
+ (id)descriptionForNoteListSortType:(int64_t)a3;
+ (id)legacySortDescriptorsForType:(int64_t)a3;
+ (id)sortDescriptorsForCurrentType;
+ (id)sortDescriptorsForCurrentTypeIncludingPinnedNotes:(BOOL)a3;
+ (id)sortDescriptorsForCurrentTypeIncludingPinnedNotes:(BOOL)a3 folderNoteSortType:(id)a4;
+ (id)sortDescriptorsForPinnedNotes;
+ (id)sortDescriptorsForType:(int64_t)a3;
+ (id)sortDescriptorsForType:(int64_t)a3 ascending:(BOOL)a4;
+ (int64_t)currentNoteListSortType;
+ (int64_t)folderSortOrderForNoteListSortType:(int64_t)a3;
+ (int64_t)sortTypeForFolderNoteOrder:(int64_t)a3;
+ (int64_t)sortTypeForTag:(int64_t)a3;
+ (int64_t)tagForSortType:(int64_t)a3;
+ (void)clearCache;
+ (void)setCurrentNoteListSortType:(int64_t)a3;
+ (void)setCurrentNoteListSortTypeByTag:(int64_t)a3;
@end

@implementation ICNoteListSortUtilities

+ (id)sortDescriptorsForCurrentTypeIncludingPinnedNotes:(BOOL)a3 folderNoteSortType:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([v6 order])
  {
    v7 = objc_msgSend(a1, "sortDescriptorsForType:ascending:", objc_msgSend(a1, "sortTypeForFolderNoteOrder:", objc_msgSend(v6, "order")), objc_msgSend(v6, "direction") == 0);
    if (v4)
    {
      v8 = [a1 sortDescriptorsForPinnedNotes];
      uint64_t v9 = objc_msgSend(v8, "ic_arrayByAddingObjectsFromNonNilArray:", v7);

      v7 = (void *)v9;
    }
  }
  else
  {
    v7 = [a1 sortDescriptorsForCurrentTypeIncludingPinnedNotes:v4];
  }

  return v7;
}

+ (int64_t)sortTypeForFolderNoteOrder:(int64_t)a3
{
  int64_t result = 2;
  switch(a3)
  {
    case 0:
      int64_t result = [a1 currentNoteListSortType];
      break;
    case 1:
      int64_t result = 0;
      break;
    case 2:
      int64_t result = 1;
      break;
    case 3:
      return result;
    default:
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNoteListSortUtilities sortTypeForFolderNoteOrder:]", 1, 0, @"invalid note list sort type folder note order, defaulting to date modified", v3, v4);
      int64_t result = 0;
      break;
  }
  return result;
}

+ (id)sortDescriptorsForCurrentTypeIncludingPinnedNotes:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_msgSend(a1, "sortDescriptorsForType:", objc_msgSend(a1, "currentNoteListSortType"));
  if (v3)
  {
    id v6 = [a1 sortDescriptorsForPinnedNotes];
    uint64_t v7 = [v6 arrayByAddingObjectsFromArray:v5];

    v5 = (void *)v7;
  }
  return v5;
}

+ (int64_t)currentNoteListSortType
{
  v2 = (void *)cachedNoteListSortType;
  if (cachedNoteListSortType) {
    goto LABEL_3;
  }
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = +[ICSettingsUtilities objectForKey:@"kICSettingsNoteListSortTypeKey"];
  uint64_t v5 = ICDynamicCast(v3, (uint64_t)v4);
  id v6 = (void *)cachedNoteListSortType;
  cachedNoteListSortType = v5;

  v2 = (void *)cachedNoteListSortType;
  if (cachedNoteListSortType)
  {
LABEL_3:
    int64_t result = [v2 integerValue];
    if ((unint64_t)result < 3) {
      return result;
    }
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNoteListSortUtilities currentNoteListSortType]", 1, 0, @"Unexpected Note List Sort Type");
  }
  else
  {
    cachedNoteListSortType = (uint64_t)&unk_26C144CA0;
  }
  return 0;
}

+ (id)sortDescriptorsForType:(int64_t)a3
{
  return (id)[a1 sortDescriptorsForType:a3 ascending:1];
}

+ (id)sortDescriptorsForPinnedNotes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"isPinned" ascending:0];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)sortDescriptorsForType:(int64_t)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  v14[2] = *MEMORY[0x263EF8340];
  BOOL v5 = !a4;
  if (a3)
  {
    if (a3 == 2)
    {
      id v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"title" ascending:a4 selector:sel_localizedStandardCompare_];
      v13[0] = v6;
      uint64_t v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"modificationDate" ascending:v5];
      v13[1] = v7;
      v8 = v13;
    }
    else if (a3 == 1)
    {
      id v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"creationDate" ascending:!a4];
      v14[0] = v6;
      uint64_t v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"title" ascending:v4 selector:sel_localizedStandardCompare_];
      v14[1] = v7;
      v8 = v14;
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNoteListSortUtilities sortDescriptorsForType:ascending:]", 1, 0, @"Unexpected sort type for sort descriptors");
      id v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"modificationDate" ascending:v5];
      v11[0] = v6;
      uint64_t v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"title" ascending:v4 selector:sel_localizedStandardCompare_];
      v11[1] = v7;
      v8 = v11;
    }
  }
  else
  {
    id v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"modificationDate" ascending:!a4];
    v12[0] = v6;
    uint64_t v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"title" ascending:v4 selector:sel_localizedStandardCompare_];
    v12[1] = v7;
    v8 = v12;
  }
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  return v9;
}

+ (void)clearCache
{
  v2 = (void *)cachedNoteListSortType;
  cachedNoteListSortType = 0;
}

+ (int64_t)folderSortOrderForNoteListSortType:(int64_t)a3
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

+ (void)setCurrentNoteListSortType:(int64_t)a3
{
  if ([a1 currentNoteListSortType] != a3)
  {
    if ((unint64_t)a3 >= 3)
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNoteListSortUtilities setCurrentNoteListSortType:]", 1, 0, @"Unexpected Note List Sort Type");
    }
    else
    {
      uint64_t v4 = [NSNumber numberWithInteger:a3];
      BOOL v5 = (void *)cachedNoteListSortType;
      cachedNoteListSortType = v4;

      id v6 = [NSNumber numberWithInteger:a3];
      +[ICSettingsUtilities setObject:v6 forKey:@"kICSettingsNoteListSortTypeKey"];

      id v7 = +[ICWidget sharedWidget];
      [v7 reloadTimelinesWithReason:@"Default note list sort type has changed"];
    }
  }
}

+ (id)legacySortDescriptorsForType:(int64_t)a3
{
  return (id)[a1 legacySortDescriptorsForType:a3 ascending:1];
}

+ (id)sortDescriptorsForCurrentType
{
  return (id)[a1 sortDescriptorsForCurrentTypeIncludingPinnedNotes:0];
}

+ (id)descriptionForNoteListSortType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      int64_t v3 = @"SORT_BY_TITLE_TITLE";
      uint64_t v4 = @"Title";
      goto LABEL_7;
    case 1:
      int64_t v3 = @"SORT_BY_DATE_CREATED_TITLE";
      uint64_t v4 = @"Date Created";
      goto LABEL_7;
    case 0:
      int64_t v3 = @"SORT_BY_DATE_EDITED_TITLE";
      uint64_t v4 = @"Date Edited";
LABEL_7:
      BOOL v5 = +[ICLocalization localizedFrameworkStringForKey:v3 value:v4 table:0 allowSiri:1];
      goto LABEL_9;
  }
  BOOL v5 = 0;
LABEL_9:
  return v5;
}

+ (void)setCurrentNoteListSortTypeByTag:(int64_t)a3
{
  uint64_t v4 = [a1 sortTypeForTag:a3];
  [a1 setCurrentNoteListSortType:v4];
}

+ (BOOL)isMenuItemCurrentSortTypeForTag:(int64_t)a3
{
  uint64_t v5 = [a1 currentNoteListSortType];
  return v5 == [a1 sortTypeForTag:a3];
}

+ (int64_t)sortTypeForTag:(int64_t)a3
{
  int64_t result = a3 - 200;
  if ((unint64_t)(a3 - 200) >= 3)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNoteListSortUtilities sortTypeForTag:]", 1, 0, @"Unexpected tag for sort type", v3, v4);
    return 0;
  }
  return result;
}

+ (int64_t)tagForSortType:(int64_t)a3
{
  if ((unint64_t)a3 < 3) {
    return a3 + 200;
  }
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICNoteListSortUtilities tagForSortType:]", 1, 0, @"Unexpected sort type for tag.", v3, v4);
  return 0;
}

+ (id)dateForCurrentSortTypeForNote:(id)a3 folderNoteSortType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  unint64_t v9 = [v7 order];
  if (v9 < 2 || v9 == 3) {
    goto LABEL_9;
  }
  if (v9 != 2)
  {
LABEL_5:
    uint64_t v10 = [a1 currentNoteListSortType];
    if (v10 && v10 != 2)
    {
      if (v10 != 1) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }
LABEL_9:
    v11 = [v6 modificationDate];
    goto LABEL_10;
  }
LABEL_8:
  v11 = [v6 creationDate];
LABEL_10:
  a1 = v11;
LABEL_11:

  return a1;
}

+ (id)dateForCurrentSortTypeAccessibilityStringForNote:(id)a3 folderNoteSortType:(id)a4
{
  uint64_t v5 = [a1 dateForCurrentSortTypeForNote:a3 folderNoteSortType:a4];
  if (v5)
  {
    uint64_t v6 = [a1 currentNoteListSortType];
    id v7 = NSString;
    if (v6 == 1) {
      v8 = @"created %@";
    }
    else {
      v8 = @"modified %@";
    }
    uint64_t v10 = +[ICLocalization localizedFrameworkStringForKey:v8 value:v8 table:0 allowSiri:1];
    v11 = objc_msgSend(v5, "ic_briefFormattedDateForAccessibility");
    unint64_t v9 = objc_msgSend(v7, "localizedStringWithFormat:", v10, v11);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

@end