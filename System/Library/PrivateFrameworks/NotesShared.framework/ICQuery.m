@interface ICQuery
+ (id)queryForCallNotesAllowsRecentlyDeleted:(BOOL)a3;
+ (id)queryForMathNotesAllowsRecentlyDeleted:(BOOL)a3;
+ (id)queryForNotesMatchingFilterSelection:(id)a3;
+ (id)queryForNotesMatchingTagSelection:(id)a3;
+ (id)queryForPinnedNotes:(BOOL)a3 allowsRecentlyDeleted:(BOOL)a4;
+ (id)queryForRecentlyDeletedMathNotes;
+ (id)queryForSharedNotes:(BOOL)a3 allowsRecentlyDeleted:(BOOL)a4;
+ (id)queryForSystemPaperNotesAllowsRecentlyDeleted:(BOOL)a3;
- (BOOL)canBeEdited;
- (NSPredicate)predicate;
- (NSString)entityName;
- (id)filterSelectionWithManagedObjectContext:(id)a3 account:(id)a4;
- (id)removingTagIdentifier:(id)a3;
- (id)replacingTagIdentifier:(id)a3 withNewTagIdentifier:(id)a4;
- (id)tagSelectionWithManagedObjectContext:(id)a3;
- (int64_t)minimumSupportedVersion;
@end

@implementation ICQuery

+ (id)queryForSystemPaperNotesAllowsRecentlyDeleted:(BOOL)a3
{
  return +[ICQueryObjC objc_queryForSystemPaperNotesAllowsRecentlyDeleted:a3];
}

+ (id)queryForSharedNotes:(BOOL)a3 allowsRecentlyDeleted:(BOOL)a4
{
  return +[ICQueryObjC objc_queryForSharedNotes:a3 allowsRecentlyDeleted:a4];
}

+ (id)queryForMathNotesAllowsRecentlyDeleted:(BOOL)a3
{
  return +[ICQueryObjC objc_queryForMathNotesAllowsRecentlyDeleted:a3];
}

+ (id)queryForCallNotesAllowsRecentlyDeleted:(BOOL)a3
{
  return +[ICQueryObjC objc_queryForCallNotesAllowsRecentlyDeleted:a3];
}

- (BOOL)canBeEdited
{
  v2 = [(ICQuery *)self queryObjC];
  char v3 = [v2 canBeEdited];

  return v3;
}

- (int64_t)minimumSupportedVersion
{
  v2 = [(ICQuery *)self queryObjC];
  int64_t v3 = [v2 minimumSupportedVersion];

  return v3;
}

- (NSString)entityName
{
  v2 = [(ICQuery *)self queryObjC];
  int64_t v3 = [v2 entityName];

  return (NSString *)v3;
}

- (NSPredicate)predicate
{
  v2 = [(ICQuery *)self queryObjC];
  int64_t v3 = [v2 predicate];

  return (NSPredicate *)v3;
}

- (id)tagSelectionWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = [(ICQuery *)self queryObjC];
  v6 = [v5 tagSelectionWithManagedObjectContext:v4];

  return v6;
}

- (id)filterSelectionWithManagedObjectContext:(id)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ICQuery *)self queryObjC];
  v9 = [v8 filterSelectionWithManagedObjectContext:v7 account:v6];

  return v9;
}

+ (id)queryForNotesMatchingFilterSelection:(id)a3
{
  return +[ICQueryObjC objc_queryForNotesMatchingFilterSelection:a3];
}

+ (id)queryForNotesMatchingTagSelection:(id)a3
{
  return +[ICQueryObjC objc_queryForNotesMatchingTagSelection:a3];
}

+ (id)queryForRecentlyDeletedMathNotes
{
  return +[ICQueryObjC objc_queryForRecentlyDeletedMathNotes];
}

+ (id)queryForPinnedNotes:(BOOL)a3 allowsRecentlyDeleted:(BOOL)a4
{
  return +[ICQueryObjC objc_queryForPinnedNotes:a3 allowsRecentlyDeleted:a4];
}

- (id)replacingTagIdentifier:(id)a3 withNewTagIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ICQuery *)self queryObjC];
  v9 = [v8 replacingTagIdentifier:v7 withNewTagIdentifier:v6];

  return v9;
}

- (id)removingTagIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(ICQuery *)self queryObjC];
  id v6 = [v5 removingTagIdentifier:v4];

  return v6;
}

@end