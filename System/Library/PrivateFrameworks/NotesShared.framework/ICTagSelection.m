@interface ICTagSelection
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingIsEmpty;
+ (id)keyPathsForValuesAffectingIsNonEmpty;
+ (id)keyPathsForValuesAffectingIsValid;
+ (id)keyPathsForValuesAffectingObjectIDs;
+ (id)keyPathsForValuesAffectingSelectedTagCount;
+ (id)tagSelectionWithData:(id)a3 managedObjectContext:(id)a4;
- (BOOL)allowsRecentlyDeleted;
- (BOOL)automaticallyRemoveDeletedTags;
- (BOOL)hasMultipleTagsSelected;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTagSelection:(id)a3;
- (BOOL)isNonEmpty;
- (BOOL)isValid;
- (ICTagSelection)initWithCoder:(id)a3;
- (ICTagSelection)initWithManagedObjectContext:(id)a3;
- (ICTagSelection)initWithManagedObjectContext:(id)a3 includedObjectIDs:(id)a4;
- (ICTagSelection)initWithManagedObjectContext:(id)a3 includedObjectIDs:(id)a4 excludedObjectIDs:(id)a5;
- (ICTagSelection)initWithManagedObjectContext:(id)a3 includedObjectIDs:(id)a4 excludedObjectIDs:(id)a5 tagOperator:(unint64_t)a6;
- (ICTagSelection)initWithManagedObjectContext:(id)a3 mode:(unint64_t)a4;
- (ICTagSelection)initWithManagedObjectContext:(id)a3 mode:(unint64_t)a4 tagOperator:(unint64_t)a5;
- (NSArray)displayTexts;
- (NSArray)excludedDisplayTexts;
- (NSArray)excludedHashtagPrefixedDisplayTexts;
- (NSArray)excludedTagIdentifiers;
- (NSArray)excludedTags;
- (NSArray)hashtagPrefixedDisplayTexts;
- (NSArray)includedDisplayTexts;
- (NSArray)includedHashtagPrefixedDisplayTexts;
- (NSArray)includedTagIdentifiers;
- (NSArray)includedTags;
- (NSArray)tagIdentifiers;
- (NSArray)tags;
- (NSData)dataRepresentation;
- (NSManagedObjectContext)managedObjectContext;
- (NSSet)excludedObjectIDURLs;
- (NSSet)excludedObjectIDs;
- (NSSet)hashtagObjectIDURLs;
- (NSSet)includedObjectIDURLs;
- (NSSet)includedObjectIDs;
- (NSSet)objectIDs;
- (NSSet)unresolvedExcludedTagIdentifiers;
- (NSSet)unresolvedIncludedTagIdentifiers;
- (NSSet)unresolvedTagIdentifiers;
- (NSString)actionTitle;
- (NSString)selectedTagCountString;
- (NSString)smartFolderTitle;
- (NSString)title;
- (NSURL)accountObjectIDURL;
- (id)copyWithManagedObjectContext:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)displayTextsForObjectIDs:(id)a3;
- (id)emptySummary;
- (id)emptySummaryTitle;
- (id)filterName;
- (id)hashtagPrefixedDisplayTexts:(id)a3;
- (id)hashtagsForObjectIDs:(id)a3;
- (id)rawFilterValue;
- (id)shortEmptySummary;
- (id)standardizedContentsForObjectIDs:(id)a3;
- (int64_t)filterType;
- (unint64_t)hash;
- (unint64_t)mode;
- (unint64_t)selectedTagCount;
- (unint64_t)tagOperator;
- (void)addObjectID:(id)a3 toExcluded:(BOOL)a4;
- (void)addUnresolvedTagIdentifier:(id)a3 toExcluded:(BOOL)a4;
- (void)clear;
- (void)commonInitWithManagedObjectContext:(id)a3;
- (void)convertUnresolvedDisplayTextsInAccount:(id)a3;
- (void)dataRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)managedObjectContextObjectIDsDidSave:(id)a3;
- (void)removeObjectID:(id)a3 fromExcluded:(BOOL)a4;
- (void)removeObjectIDs:(id)a3;
- (void)removeUnresolvedTagIdentifier:(id)a3 fromExcluded:(BOOL)a4;
- (void)removeUnresolvedTagIdentifiers:(id)a3;
- (void)resolveManagedObjectsFromURLs;
- (void)setAccountObjectIDURL:(id)a3;
- (void)setAllowsRecentlyDeleted:(BOOL)a3;
- (void)setAutomaticallyRemoveDeletedTags:(BOOL)a3;
- (void)setExcludedObjectIDURLs:(id)a3;
- (void)setExcludedObjectIDs:(id)a3;
- (void)setHashtagObjectIDURLs:(id)a3;
- (void)setIncludedObjectIDURLs:(id)a3;
- (void)setIncludedObjectIDs:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setTagOperator:(unint64_t)a3;
- (void)setTags:(id)a3;
- (void)setUnresolvedExcludedTagIdentifiers:(id)a3;
- (void)setUnresolvedIncludedTagIdentifiers:(id)a3;
@end

@implementation ICTagSelection

- (ICTagSelection)initWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICTagSelection;
  v5 = [(ICTagSelection *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(ICTagSelection *)v5 commonInitWithManagedObjectContext:v4];
    v6->_mode = 0;
    v6->_tagOperator = 1;
  }

  return v6;
}

- (ICTagSelection)initWithManagedObjectContext:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICTagSelection;
  v7 = [(ICTagSelection *)&v10 init];
  objc_super v8 = v7;
  if (v7)
  {
    [(ICTagSelection *)v7 commonInitWithManagedObjectContext:v6];
    v8->_mode = a4;
    v8->_tagOperator = 1;
  }

  return v8;
}

- (ICTagSelection)initWithManagedObjectContext:(id)a3 mode:(unint64_t)a4 tagOperator:(unint64_t)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICTagSelection;
  v9 = [(ICTagSelection *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    [(ICTagSelection *)v9 commonInitWithManagedObjectContext:v8];
    v10->_mode = a4;
    v10->_tagOperator = a5;
  }

  return v10;
}

- (ICTagSelection)initWithManagedObjectContext:(id)a3 includedObjectIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICTagSelection;
  id v8 = [(ICTagSelection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ICTagSelection *)v8 commonInitWithManagedObjectContext:v6];
    objc_storeStrong((id *)&v9->_includedObjectIDs, a4);
    v9->_tagOperator = 1;
  }

  return v9;
}

- (ICTagSelection)initWithManagedObjectContext:(id)a3 includedObjectIDs:(id)a4 excludedObjectIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICTagSelection;
  objc_super v11 = [(ICTagSelection *)&v14 init];
  objc_super v12 = v11;
  if (v11)
  {
    [(ICTagSelection *)v11 commonInitWithManagedObjectContext:v8];
    objc_storeStrong((id *)&v12->_includedObjectIDs, a4);
    objc_storeStrong((id *)&v12->_excludedObjectIDs, a5);
    v12->_tagOperator = 1;
  }

  return v12;
}

- (ICTagSelection)initWithManagedObjectContext:(id)a3 includedObjectIDs:(id)a4 excludedObjectIDs:(id)a5 tagOperator:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICTagSelection;
  v13 = [(ICTagSelection *)&v16 init];
  objc_super v14 = v13;
  if (v13)
  {
    [(ICTagSelection *)v13 commonInitWithManagedObjectContext:v10];
    objc_storeStrong((id *)&v14->_includedObjectIDs, a4);
    objc_storeStrong((id *)&v14->_excludedObjectIDs, a5);
    v14->_tagOperator = a6;
  }

  return v14;
}

- (id)copyWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = [[ICTagSelection alloc] initWithManagedObjectContext:v4 mode:[(ICTagSelection *)self mode] tagOperator:[(ICTagSelection *)self tagOperator]];

  id v6 = [(ICTagSelection *)self includedObjectIDs];
  [(ICTagSelection *)v5 setIncludedObjectIDs:v6];

  id v7 = [(ICTagSelection *)self excludedObjectIDs];
  [(ICTagSelection *)v5 setExcludedObjectIDs:v7];

  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICTagSelection;
  [(ICTagSelection *)&v4 dealloc];
}

- (void)commonInitWithManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
  id v5 = a3;
  self->_allowsRecentlyDeleted = 0;
  self->_automaticallyRemoveDeletedTags = 1;
  id v6 = [MEMORY[0x1E4F1CAD0] set];
  includedObjectIDs = self->_includedObjectIDs;
  self->_includedObjectIDs = v6;

  id v8 = [MEMORY[0x1E4F1CAD0] set];
  excludedObjectIDs = self->_excludedObjectIDs;
  self->_excludedObjectIDs = v8;

  id v10 = [MEMORY[0x1E4F1CAD0] set];
  unresolvedIncludedTagIdentifiers = self->_unresolvedIncludedTagIdentifiers;
  self->_unresolvedIncludedTagIdentifiers = v10;

  id v12 = [MEMORY[0x1E4F1CAD0] set];
  unresolvedExcludedTagIdentifiers = self->_unresolvedExcludedTagIdentifiers;
  self->_unresolvedExcludedTagIdentifiers = v12;

  id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:self selector:sel_managedObjectContextObjectIDsDidSave_ name:*MEMORY[0x1E4F1BE28] object:0];
}

- (id)debugDescription
{
  v3 = NSString;
  unint64_t v4 = [(ICTagSelection *)self mode];
  id v5 = @"Custom";
  if (v4 == 1) {
    id v5 = @"All Tagged";
  }
  if (v4 == 2) {
    id v5 = @"All Untagged";
  }
  id v6 = v5;
  unint64_t v7 = [(ICTagSelection *)self tagOperator];
  id v8 = @"unknown";
  if (v7 == 1) {
    id v8 = @"all";
  }
  if (v7 == 2) {
    id v8 = @"any";
  }
  id v9 = v8;
  id v10 = [(ICTagSelection *)self includedObjectIDs];
  id v11 = [(ICTagSelection *)self excludedObjectIDs];
  id v12 = [(ICTagSelection *)self unresolvedIncludedTagIdentifiers];
  v13 = [(ICTagSelection *)self unresolvedExcludedTagIdentifiers];
  id v14 = [v3 stringWithFormat:@"mode: %@\noperator:%@\nincluded:%@\nexcluded:%@\nunresolvedIncluded:%@\nunresolvedExcluded:%@", v6, v9, v10, v11, v12, v13];

  return v14;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
  if (a3 - 1 >= 2)
  {
    if (!a3 && ![(ICTagSelection *)self tagOperator])
    {
      [(ICTagSelection *)self setTagOperator:1];
    }
  }
  else
  {
    [(ICTagSelection *)self setTagOperator:0];
    unint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
    [(ICTagSelection *)self setIncludedObjectIDs:v4];

    id v5 = [MEMORY[0x1E4F1CAD0] set];
    [(ICTagSelection *)self setExcludedObjectIDs:v5];
  }
}

+ (id)keyPathsForValuesAffectingIsNonEmpty
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"isEmpty"];
}

- (BOOL)isNonEmpty
{
  return ![(ICTagSelection *)self isEmpty];
}

- (void)setIncludedObjectIDs:(id)a3
{
  id v11 = a3;
  id v5 = [(ICTagSelection *)self includedObjectIDs];
  char v6 = [v11 isEqualToSet:v5];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_includedObjectIDs, a3);
    unint64_t v7 = [(ICTagSelection *)self excludedObjectIDs];
    id v8 = (void *)[v7 mutableCopy];

    [v8 minusSet:v11];
    id v9 = (NSSet *)[v8 copy];
    excludedObjectIDs = self->_excludedObjectIDs;
    self->_excludedObjectIDs = v9;

    if ([v11 count] && -[ICTagSelection mode](self, "mode")) {
      [(ICTagSelection *)self setMode:0];
    }
  }
}

- (void)removeObjectIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        [(ICTagSelection *)self removeObjectID:v9 fromExcluded:0];
        [(ICTagSelection *)self removeObjectID:v9 fromExcluded:1];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)addObjectID:(id)a3 toExcluded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (v6)
    {
      id v13 = v6;
      uint64_t v7 = [(ICTagSelection *)self excludedObjectIDs];
      char v8 = [v7 containsObject:v13];

      id v6 = v13;
      if ((v8 & 1) == 0)
      {
        uint64_t v9 = [(ICTagSelection *)self excludedObjectIDs];
        long long v10 = [v9 setByAddingObject:v13];
        [(ICTagSelection *)self setExcludedObjectIDs:v10];
LABEL_8:

        id v6 = v13;
      }
    }
  }
  else if (v6)
  {
    id v13 = v6;
    long long v11 = [(ICTagSelection *)self includedObjectIDs];
    char v12 = [v11 containsObject:v13];

    id v6 = v13;
    if ((v12 & 1) == 0)
    {
      uint64_t v9 = [(ICTagSelection *)self includedObjectIDs];
      long long v10 = [v9 setByAddingObject:v13];
      [(ICTagSelection *)self setIncludedObjectIDs:v10];
      goto LABEL_8;
    }
  }
}

- (void)removeObjectID:(id)a3 fromExcluded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (v6)
    {
      id v15 = v6;
      uint64_t v7 = [(ICTagSelection *)self excludedObjectIDs];
      int v8 = [v7 containsObject:v15];

      id v6 = v15;
      if (v8)
      {
        uint64_t v9 = [(ICTagSelection *)self excludedObjectIDs];
        long long v10 = (void *)[v9 mutableCopy];

        [v10 removeObject:v15];
        long long v11 = (void *)[v10 copy];
        [(ICTagSelection *)self setExcludedObjectIDs:v11];
LABEL_8:

        id v6 = v15;
      }
    }
  }
  else if (v6)
  {
    id v15 = v6;
    char v12 = [(ICTagSelection *)self includedObjectIDs];
    int v13 = [v12 containsObject:v15];

    id v6 = v15;
    if (v13)
    {
      id v14 = [(ICTagSelection *)self includedObjectIDs];
      long long v10 = (void *)[v14 mutableCopy];

      [v10 removeObject:v15];
      long long v11 = (void *)[v10 copy];
      [(ICTagSelection *)self setIncludedObjectIDs:v11];
      goto LABEL_8;
    }
  }
}

- (void)addUnresolvedTagIdentifier:(id)a3 toExcluded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v13 = v6;
    if (v4)
    {
      uint64_t v7 = [(ICTagSelection *)self unresolvedExcludedTagIdentifiers];
      char v8 = [v7 containsObject:v13];

      if ((v8 & 1) == 0)
      {
        uint64_t v9 = [(ICTagSelection *)self unresolvedExcludedTagIdentifiers];
        long long v10 = [v9 setByAddingObject:v13];
        [(ICTagSelection *)self setUnresolvedExcludedTagIdentifiers:v10];
LABEL_7:
      }
    }
    else
    {
      long long v11 = [(ICTagSelection *)self unresolvedIncludedTagIdentifiers];
      char v12 = [v11 containsObject:v13];

      if ((v12 & 1) == 0)
      {
        uint64_t v9 = [(ICTagSelection *)self unresolvedIncludedTagIdentifiers];
        long long v10 = [v9 setByAddingObject:v13];
        [(ICTagSelection *)self setUnresolvedIncludedTagIdentifiers:v10];
        goto LABEL_7;
      }
    }
    [(ICTagSelection *)self removeUnresolvedTagIdentifier:v13 fromExcluded:!v4];
    id v6 = v13;
  }
}

- (void)removeUnresolvedTagIdentifier:(id)a3 fromExcluded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v15 = v6;
    if (v4)
    {
      uint64_t v7 = [(ICTagSelection *)self unresolvedExcludedTagIdentifiers];
      int v8 = [v7 containsObject:v15];

      id v6 = v15;
      if (!v8) {
        goto LABEL_8;
      }
      uint64_t v9 = [(ICTagSelection *)self unresolvedExcludedTagIdentifiers];
      long long v10 = (void *)[v9 mutableCopy];

      [v10 removeObject:v15];
      long long v11 = (void *)[v10 copy];
      [(ICTagSelection *)self setUnresolvedExcludedTagIdentifiers:v11];
    }
    else
    {
      char v12 = [(ICTagSelection *)self unresolvedIncludedTagIdentifiers];
      int v13 = [v12 containsObject:v15];

      id v6 = v15;
      if (!v13) {
        goto LABEL_8;
      }
      id v14 = [(ICTagSelection *)self unresolvedIncludedTagIdentifiers];
      long long v10 = (void *)[v14 mutableCopy];

      [v10 removeObject:v15];
      long long v11 = (void *)[v10 copy];
      [(ICTagSelection *)self setUnresolvedIncludedTagIdentifiers:v11];
    }

    id v6 = v15;
  }
LABEL_8:
}

- (void)setExcludedObjectIDs:(id)a3
{
  id v11 = a3;
  uint64_t v5 = [(ICTagSelection *)self excludedObjectIDs];
  char v6 = [v11 isEqualToSet:v5];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_excludedObjectIDs, a3);
    uint64_t v7 = [(ICTagSelection *)self includedObjectIDs];
    int v8 = (void *)[v7 mutableCopy];

    [v8 minusSet:v11];
    uint64_t v9 = (NSSet *)[v8 copy];
    includedObjectIDs = self->_includedObjectIDs;
    self->_includedObjectIDs = v9;

    if ([v11 count] && -[ICTagSelection mode](self, "mode")) {
      [(ICTagSelection *)self setMode:0];
    }
  }
}

- (void)removeUnresolvedTagIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        [(ICTagSelection *)self removeUnresolvedTagIdentifier:v9 fromExcluded:0];
        [(ICTagSelection *)self removeUnresolvedTagIdentifier:v9 fromExcluded:1];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

+ (id)keyPathsForValuesAffectingObjectIDs
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"includedObjectIDs", @"excludedObjectIDs", 0);
}

- (NSArray)tags
{
  v3 = [(ICTagSelection *)self objectIDs];
  id v4 = [(ICTagSelection *)self hashtagsForObjectIDs:v3];

  return (NSArray *)v4;
}

- (NSArray)includedTags
{
  v3 = [(ICTagSelection *)self includedObjectIDs];
  id v4 = [(ICTagSelection *)self hashtagsForObjectIDs:v3];

  return (NSArray *)v4;
}

- (NSArray)excludedTags
{
  v3 = [(ICTagSelection *)self excludedObjectIDs];
  id v4 = [(ICTagSelection *)self hashtagsForObjectIDs:v3];

  return (NSArray *)v4;
}

- (NSSet)objectIDs
{
  v3 = [(ICTagSelection *)self includedObjectIDs];
  id v4 = [(ICTagSelection *)self excludedObjectIDs];
  uint64_t v5 = [v3 setByAddingObjectsFromSet:v4];

  return (NSSet *)v5;
}

- (NSArray)includedTagIdentifiers
{
  v3 = [(ICTagSelection *)self includedObjectIDs];
  id v4 = [(ICTagSelection *)self standardizedContentsForObjectIDs:v3];

  return (NSArray *)v4;
}

- (NSArray)excludedTagIdentifiers
{
  v3 = [(ICTagSelection *)self excludedObjectIDs];
  id v4 = [(ICTagSelection *)self standardizedContentsForObjectIDs:v3];

  return (NSArray *)v4;
}

- (NSArray)tagIdentifiers
{
  v3 = [(ICTagSelection *)self includedTagIdentifiers];
  id v4 = [(ICTagSelection *)self excludedTagIdentifiers];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

- (NSArray)includedDisplayTexts
{
  v3 = [(ICTagSelection *)self includedObjectIDs];
  id v4 = [(ICTagSelection *)self displayTextsForObjectIDs:v3];

  return (NSArray *)v4;
}

- (NSArray)excludedDisplayTexts
{
  v3 = [(ICTagSelection *)self excludedObjectIDs];
  id v4 = [(ICTagSelection *)self displayTextsForObjectIDs:v3];

  return (NSArray *)v4;
}

- (NSArray)displayTexts
{
  v3 = [(ICTagSelection *)self includedDisplayTexts];
  id v4 = [(ICTagSelection *)self excludedDisplayTexts];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

- (NSArray)includedHashtagPrefixedDisplayTexts
{
  v3 = [(ICTagSelection *)self includedDisplayTexts];
  id v4 = [(ICTagSelection *)self hashtagPrefixedDisplayTexts:v3];

  uint64_t v5 = [v4 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  return (NSArray *)v5;
}

- (NSArray)excludedHashtagPrefixedDisplayTexts
{
  v3 = [(ICTagSelection *)self excludedDisplayTexts];
  id v4 = [(ICTagSelection *)self hashtagPrefixedDisplayTexts:v3];

  uint64_t v5 = [v4 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  return (NSArray *)v5;
}

- (NSArray)hashtagPrefixedDisplayTexts
{
  v3 = [(ICTagSelection *)self displayTexts];
  id v4 = [(ICTagSelection *)self hashtagPrefixedDisplayTexts:v3];

  return (NSArray *)v4;
}

- (NSSet)unresolvedTagIdentifiers
{
  v3 = [(ICTagSelection *)self unresolvedIncludedTagIdentifiers];
  id v4 = [(ICTagSelection *)self unresolvedExcludedTagIdentifiers];
  uint64_t v5 = [v3 setByAddingObjectsFromSet:v4];

  return (NSSet *)v5;
}

+ (id)keyPathsForValuesAffectingSelectedTagCount
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"mode", @"includedObjectIDs", @"excludedObjectIDs", 0);
}

- (unint64_t)selectedTagCount
{
  if ([(ICTagSelection *)self mode]) {
    return 1;
  }
  id v4 = [(ICTagSelection *)self includedObjectIDs];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [(ICTagSelection *)self excludedObjectIDs];
  unint64_t v3 = [v6 count] + v5;

  return v3;
}

- (NSString)selectedTagCountString
{
  unint64_t v3 = NSString;
  id v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%lu_TAGS" value:@"%lu_TAGS" table:0 allowSiri:1];
  uint64_t v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, -[ICTagSelection selectedTagCount](self, "selectedTagCount"));

  return (NSString *)v5;
}

- (NSString)title
{
  unint64_t v3 = [(ICTagSelection *)self mode];
  if (!v3)
  {
    if ([(ICTagSelection *)self selectedTagCount])
    {
      if ([(ICTagSelection *)self selectedTagCount] == 1)
      {
        uint64_t v5 = [(ICTagSelection *)self includedObjectIDs];
        uint64_t v6 = [v5 count];

        if (v6 == 1)
        {
          uint64_t v7 = [(ICTagSelection *)self hashtagPrefixedDisplayTexts];
          int v8 = [v7 firstObject];

          goto LABEL_15;
        }
      }
      uint64_t v4 = [(ICTagSelection *)self selectedTagCountString];
      goto LABEL_14;
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F83770];
    long long v10 = @"Tags";
    goto LABEL_13;
  }
  if (v3 == 2)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F83770];
    long long v10 = @"Untagged";
LABEL_13:
    uint64_t v4 = [v9 localizedFrameworkStringForKey:v10 value:v10 table:0 allowSiri:1];
    goto LABEL_14;
  }
  if (v3 != 1)
  {
    int v8 = 0;
    goto LABEL_15;
  }
  uint64_t v4 = +[ICHashtag localizedSectionTitle];
LABEL_14:
  int v8 = (void *)v4;
LABEL_15:
  return (NSString *)v8;
}

- (NSString)actionTitle
{
  v2 = self;
  if ([(ICTagSelection *)self isEmpty])
  {
    v2 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = [v2 mode];
  if (v3)
  {
    if (v3 == 2)
    {
      uint64_t v4 = (void *)MEMORY[0x1E4F83770];
      uint64_t v5 = @"Untagged";
    }
    else
    {
      if (v3 != 1) {
        goto LABEL_10;
      }
      uint64_t v4 = (void *)MEMORY[0x1E4F83770];
      uint64_t v5 = @"All Tags";
    }
    v2 = [v4 localizedFrameworkStringForKey:v5 value:v5 table:0 allowSiri:1];
  }
  else
  {
    uint64_t v6 = [v2 hashtagPrefixedDisplayTexts];
    v2 = +[ICFolder defaultSmartFolderTitleWithComponents:v6];
  }
LABEL_10:
  return (NSString *)v2;
}

- (NSString)smartFolderTitle
{
  if ([(ICTagSelection *)self isEmpty]) {
    goto LABEL_9;
  }
  unint64_t v3 = [(ICTagSelection *)self mode];
  if (v3)
  {
    if (v3 == 2)
    {
      uint64_t v4 = (void *)MEMORY[0x1E4F83770];
      uint64_t v5 = @"Untagged";
      goto LABEL_11;
    }
    if (v3 == 1)
    {
      uint64_t v4 = (void *)MEMORY[0x1E4F83770];
      uint64_t v5 = @"All Tags";
LABEL_11:
      uint64_t v9 = [v4 localizedFrameworkStringForKey:v5 value:v5 table:0 allowSiri:1];
      goto LABEL_12;
    }
LABEL_9:
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  if (![(ICTagSelection *)self selectedTagCount]) {
    goto LABEL_9;
  }
  uint64_t v6 = [(ICTagSelection *)self excludedObjectIDs];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"New Smart Folder" value:@"New Smart Folder" table:0 allowSiri:1];
    goto LABEL_9;
  }
  long long v11 = [(ICTagSelection *)self includedDisplayTexts];
  uint64_t v9 = +[ICFolder defaultSmartFolderTitleWithComponents:v11];

LABEL_12:
  return (NSString *)v9;
}

- (void)clear
{
  if ([(ICTagSelection *)self mode]) {
    [(ICTagSelection *)self setMode:0];
  }
  unint64_t v3 = [(ICTagSelection *)self includedObjectIDs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
    [(ICTagSelection *)self setIncludedObjectIDs:v5];
  }
  uint64_t v6 = [(ICTagSelection *)self excludedObjectIDs];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CAD0] set];
    [(ICTagSelection *)self setExcludedObjectIDs:v8];
  }
}

- (void)convertUnresolvedDisplayTextsInAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICTagSelection *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ICTagSelection_convertUnresolvedDisplayTextsInAccount___block_invoke;
  v7[3] = &unk_1E64A4218;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

void __57__ICTagSelection_convertUnresolvedDisplayTextsInAccount___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  unint64_t v3 = objc_msgSend(v2, "ic_existingObjectWithID:", *(void *)(a1 + 40));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [*(id *)(a1 + 32) unresolvedTagIdentifiers];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = +[ICHashtag hashtagWithDisplayText:v8 account:v3 createIfNecessary:1];
        if (objc_msgSend(v9, "ic_obtainPermanentObjectIDIfNecessary"))
        {
          long long v10 = [*(id *)(a1 + 32) unresolvedExcludedTagIdentifiers];
          uint64_t v11 = [v10 containsObject:v8];

          [*(id *)(a1 + 32) removeUnresolvedTagIdentifier:v8 fromExcluded:v11];
          long long v12 = *(void **)(a1 + 32);
          long long v13 = [v9 objectID];
          [v12 addObjectID:v13 toExcluded:v11];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  id v14 = [*(id *)(a1 + 32) managedObjectContext];
  objc_msgSend(v14, "ic_save");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[ICTagSelection allocWithZone:a3];
  uint64_t v5 = [(ICTagSelection *)self managedObjectContext];
  uint64_t v6 = [(ICTagSelection *)v4 initWithManagedObjectContext:v5 mode:[(ICTagSelection *)self mode] tagOperator:[(ICTagSelection *)self tagOperator]];

  uint64_t v7 = [(ICTagSelection *)self includedObjectIDs];
  [(ICTagSelection *)v6 setIncludedObjectIDs:v7];

  uint64_t v8 = [(ICTagSelection *)self excludedObjectIDs];
  [(ICTagSelection *)v6 setExcludedObjectIDs:v8];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICTagSelection *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ICTagSelection *)self isEqualToTagSelection:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICTagSelection mode](self, "mode"));
  uint64_t v33 = [v3 hash];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICTagSelection tagOperator](self, "tagOperator"));
  char v5 = [v4 hash];
  id v6 = [(ICTagSelection *)self includedObjectIDs];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = [v8 hash];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        v9 += ICHashWithObject(*(void **)(*((void *)&v34 + 1) + 8 * i));
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }

  id v15 = [(ICTagSelection *)self excludedObjectIDs];
  long long v16 = (objc_class *)objc_opt_class();
  long long v17 = NSStringFromClass(v16);
  uint64_t v18 = [v17 hash];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v19 = v15;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        v18 += ICHashWithObject(*(void **)(*((void *)&v34 + 1) + 8 * j));
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v21);
  }

  unint64_t v31 = ICHashWithHashKeys(v33, v24, v25, v26, v27, v28, v29, v30, v5);
  return v31;
}

- (int64_t)filterType
{
  return 0;
}

- (id)filterName
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Tags" value:@"Tags" table:0 allowSiri:1];
}

- (id)rawFilterValue
{
  unint64_t v3 = [(ICTagSelection *)self mode];
  if (v3)
  {
    if (v3 == 2) {
      return @"No Tags";
    }
    else {
      return @"Any Tag";
    }
  }
  else if ([(ICTagSelection *)self tagOperator] >= 2)
  {
    return @"Any Selected Tag";
  }
  else
  {
    return @"All Selected Tags";
  }
}

+ (id)keyPathsForValuesAffectingIsEmpty
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F1F62C10];
}

- (BOOL)isEmpty
{
  if ([(ICTagSelection *)self mode]) {
    return 0;
  }
  uint64_t v4 = [(ICTagSelection *)self includedObjectIDs];
  if ([v4 count])
  {
    BOOL v3 = 0;
  }
  else
  {
    char v5 = [(ICTagSelection *)self excludedObjectIDs];
    if ([v5 count])
    {
      BOOL v3 = 0;
    }
    else
    {
      id v6 = [(ICTagSelection *)self unresolvedIncludedTagIdentifiers];
      if ([v6 count])
      {
        BOOL v3 = 0;
      }
      else
      {
        uint64_t v7 = [(ICTagSelection *)self unresolvedExcludedTagIdentifiers];
        BOOL v3 = [v7 count] == 0;
      }
    }
  }
  return v3;
}

- (BOOL)isValid
{
  return ![(ICTagSelection *)self isEmpty];
}

+ (id)keyPathsForValuesAffectingIsValid
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"isEmpty"];
}

- (id)emptySummaryTitle
{
  if ([(ICTagSelection *)self isEmpty])
  {
    v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Tags Filter Incomplete" value:@"Tags Filter Incomplete" table:0 allowSiri:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)emptySummary
{
  if ([(ICTagSelection *)self isEmpty])
  {
    v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You must select at least one tag for the Tags filter." value:@"You must select at least one tag for the Tags filter." table:0 allowSiri:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)shortEmptySummary
{
  if ([(ICTagSelection *)self isEmpty])
  {
    v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Tag for the Tags filter" value:@"Tag for the Tags filter" table:0 allowSiri:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)tagSelectionWithData:(id)a3 managedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  id v7 = 0;
  if (a3 && v5)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
    id v9 = a3;
    id v14 = 0;
    id v10 = [v8 unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v14];

    id v11 = v14;
    if (v11)
    {
      uint64_t v12 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[ICTagSelection tagSelectionWithData:managedObjectContext:]((uint64_t)v11, v12);
      }

      id v7 = 0;
    }
    else
    {
      [v10 setManagedObjectContext:v6];
      [v10 resolveManagedObjectsFromURLs];
      id v7 = v10;
    }
  }
  return v7;
}

- (NSData)dataRepresentation
{
  id v6 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  id v3 = v6;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(ICTagSelection *)(uint64_t)v3 dataRepresentation];
    }
  }
  return (NSData *)v2;
}

- (void)managedObjectContextObjectIDsDidSave:(id)a3
{
  id v4 = a3;
  if ([(ICTagSelection *)self automaticallyRemoveDeletedTags])
  {
    id v5 = [(ICTagSelection *)self objectIDs];
    id v6 = (void *)[v5 mutableCopy];

    id v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1BFA0]];

    [v6 intersectSet:v8];
    id v9 = [(ICTagSelection *)self managedObjectContext];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__ICTagSelection_managedObjectContextObjectIDsDidSave___block_invoke;
    v11[3] = &unk_1E64A4218;
    id v12 = v6;
    uint64_t v13 = self;
    id v10 = v6;
    [v9 performBlock:v11];
  }
}

void __55__ICTagSelection_managedObjectContextObjectIDsDidSave___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__ICTagSelection_managedObjectContextObjectIDsDidSave___block_invoke_2;
  v4[3] = &unk_1E64A6090;
  v4[4] = *(void *)(a1 + 40);
  id v3 = objc_msgSend(v2, "ic_objectsPassingTest:", v4);
  [*(id *)(a1 + 40) removeObjectIDs:v3];
}

uint64_t __55__ICTagSelection_managedObjectContextObjectIDsDidSave___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 managedObjectContext];
  id v5 = objc_msgSend(v4, "ic_existingObjectWithID:", v3);

  if ([v5 isDeleted]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [v5 markedForDeletion];
  }

  return v6;
}

- (BOOL)isEqualToTagSelection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICTagSelection *)self mode];
  if (v5 == [v4 mode]
    && (unint64_t v6 = -[ICTagSelection tagOperator](self, "tagOperator"), v6 == [v4 tagOperator]))
  {
    id v7 = [(ICTagSelection *)self includedObjectIDs];
    uint64_t v8 = [v4 includedObjectIDs];
    if ([v7 isEqualToSet:v8])
    {
      id v9 = [(ICTagSelection *)self excludedObjectIDs];
      id v10 = [v4 excludedObjectIDs];
      char v11 = [v9 isEqualToSet:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)standardizedContentsForObjectIDs:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__19;
  long long v17 = __Block_byref_object_dispose__19;
  id v18 = 0;
  unint64_t v5 = [(ICTagSelection *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__ICTagSelection_standardizedContentsForObjectIDs___block_invoke;
  v9[3] = &unk_1E64A4ED8;
  id v12 = &v13;
  id v6 = v4;
  id v10 = v6;
  char v11 = self;
  [v5 performBlockAndWait:v9];

  id v7 = [(id)v14[5] sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __51__ICTagSelection_standardizedContentsForObjectIDs___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allObjects];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__ICTagSelection_standardizedContentsForObjectIDs___block_invoke_2;
  v6[3] = &unk_1E64A60B8;
  v6[4] = *(void *)(a1 + 40);
  uint64_t v3 = objc_msgSend(v2, "ic_compactMap:", v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __51__ICTagSelection_standardizedContentsForObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "ic_isHashtagType"))
  {
    objc_opt_class();
    uint64_t v4 = [*(id *)(a1 + 32) managedObjectContext];
    unint64_t v5 = objc_msgSend(v4, "ic_existingObjectWithID:", v3);
    id v6 = ICDynamicCast();
    id v7 = [v6 standardizedContent];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)displayTextsForObjectIDs:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__19;
  long long v17 = __Block_byref_object_dispose__19;
  id v18 = 0;
  unint64_t v5 = [(ICTagSelection *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__ICTagSelection_displayTextsForObjectIDs___block_invoke;
  v9[3] = &unk_1E64A4ED8;
  id v12 = &v13;
  id v6 = v4;
  id v10 = v6;
  char v11 = self;
  [v5 performBlockAndWait:v9];

  id v7 = [(id)v14[5] sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __43__ICTagSelection_displayTextsForObjectIDs___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allObjects];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__ICTagSelection_displayTextsForObjectIDs___block_invoke_2;
  v6[3] = &unk_1E64A60B8;
  v6[4] = *(void *)(a1 + 40);
  uint64_t v3 = objc_msgSend(v2, "ic_compactMap:", v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __43__ICTagSelection_displayTextsForObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "ic_isHashtagType"))
  {
    objc_opt_class();
    uint64_t v4 = [*(id *)(a1 + 32) managedObjectContext];
    unint64_t v5 = objc_msgSend(v4, "ic_existingObjectWithID:", v3);
    id v6 = ICDynamicCast();
    id v7 = [v6 displayText];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)hashtagPrefixedDisplayTexts:(id)a3
{
  return (id)objc_msgSend(a3, "ic_map:", &__block_literal_global_24);
}

uint64_t __46__ICTagSelection_hashtagPrefixedDisplayTexts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_withHashtagPrefix");
}

- (id)hashtagsForObjectIDs:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__19;
  uint64_t v21 = __Block_byref_object_dispose__19;
  id v22 = 0;
  unint64_t v5 = [(ICTagSelection *)self managedObjectContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__ICTagSelection_hashtagsForObjectIDs___block_invoke;
  v13[3] = &unk_1E64A4ED8;
  long long v16 = &v17;
  id v6 = v4;
  id v14 = v6;
  uint64_t v15 = self;
  [v5 performBlockAndWait:v13];

  id v7 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v8 = [(id)v18[5] allObjects];
  id v9 = [v7 arrayWithArray:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__ICTagSelection_hashtagsForObjectIDs___block_invoke_3;
  v12[3] = &unk_1E64A6150;
  v12[4] = self;
  id v10 = [v9 sortedArrayUsingComparator:v12];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __39__ICTagSelection_hashtagsForObjectIDs___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__ICTagSelection_hashtagsForObjectIDs___block_invoke_2;
  v6[3] = &unk_1E64A6100;
  v6[4] = a1[5];
  uint64_t v3 = objc_msgSend(v2, "ic_compactMap:", v6);
  uint64_t v4 = *(void *)(a1[6] + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id __39__ICTagSelection_hashtagsForObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 managedObjectContext];
  unint64_t v5 = objc_msgSend(v4, "ic_existingObjectWithID:", v3);

  return v5;
}

uint64_t __39__ICTagSelection_hashtagsForObjectIDs___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__19;
  uint64_t v30 = __Block_byref_object_dispose__19;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__19;
  uint64_t v24 = __Block_byref_object_dispose__19;
  id v25 = 0;
  id v7 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __39__ICTagSelection_hashtagsForObjectIDs___block_invoke_4;
  uint64_t v15 = &unk_1E64A6128;
  id v18 = &v26;
  id v8 = v5;
  id v16 = v8;
  uint64_t v19 = &v20;
  id v9 = v6;
  id v17 = v9;
  [v7 performBlockAndWait:&v12];

  uint64_t v10 = objc_msgSend((id)v27[5], "localizedCaseInsensitiveCompare:", v21[5], v12, v13, v14, v15);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v10;
}

void __39__ICTagSelection_hashtagsForObjectIDs___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) standardizedContent];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v9 = [*(id *)(a1 + 40) standardizedContent];
  uint64_t v6 = [v9 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)resolveManagedObjectsFromURLs
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "ICTagSelection::resolveManagedObjectsFromURLs: managedObjectContext is nil", v1, 2u);
}

id __47__ICTagSelection_resolveManagedObjectsFromURLs__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 managedObjectContext];
  id v5 = objc_msgSend(v4, "ic_objectIDFromURL:", v3);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ICFilterTypeSelection *)self accountObjectID];
  uint64_t v6 = [v5 URIRepresentation];
  uint64_t v7 = NSStringFromSelector(sel_accountObjectIDURL);
  [v4 encodeObject:v6 forKey:v7];

  unint64_t mode = self->_mode;
  id v9 = NSStringFromSelector(sel_mode);
  [v4 encodeInteger:mode forKey:v9];

  unint64_t tagOperator = self->_tagOperator;
  char v11 = NSStringFromSelector(sel_tagOperator);
  [v4 encodeInteger:tagOperator forKey:v11];

  BOOL allowsRecentlyDeleted = self->_allowsRecentlyDeleted;
  uint64_t v13 = NSStringFromSelector(sel_allowsRecentlyDeleted);
  [v4 encodeBool:allowsRecentlyDeleted forKey:v13];

  BOOL automaticallyRemoveDeletedTags = self->_automaticallyRemoveDeletedTags;
  uint64_t v15 = NSStringFromSelector(sel_automaticallyRemoveDeletedTags);
  [v4 encodeBool:automaticallyRemoveDeletedTags forKey:v15];

  id v27 = [(NSSet *)self->_includedObjectIDs ic_map:&__block_literal_global_129];
  id v16 = NSStringFromSelector(sel_includedObjectIDURLs);
  [v4 encodeObject:v27 forKey:v16];

  id v17 = [(NSSet *)self->_excludedObjectIDs ic_map:&__block_literal_global_133];
  id v18 = NSStringFromSelector(sel_excludedObjectIDURLs);
  [v4 encodeObject:v17 forKey:v18];

  uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = [(NSArray *)self->_tags ic_map:&__block_literal_global_138];
  uint64_t v21 = [v19 setWithArray:v20];

  uint64_t v22 = NSStringFromSelector(sel_hashtagObjectIDURLs);
  [v4 encodeObject:v21 forKey:v22];

  unresolvedIncludedTagIdentifiers = self->_unresolvedIncludedTagIdentifiers;
  uint64_t v24 = NSStringFromSelector(sel_unresolvedIncludedTagIdentifiers);
  [v4 encodeObject:unresolvedIncludedTagIdentifiers forKey:v24];

  unresolvedExcludedTagIdentifiers = self->_unresolvedExcludedTagIdentifiers;
  uint64_t v26 = NSStringFromSelector(sel_unresolvedExcludedTagIdentifiers);
  [v4 encodeObject:unresolvedExcludedTagIdentifiers forKey:v26];
}

uint64_t __34__ICTagSelection_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 URIRepresentation];
}

uint64_t __34__ICTagSelection_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 URIRepresentation];
}

id __34__ICTagSelection_encodeWithCoder___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 objectID];
  id v3 = [v2 URIRepresentation];

  return v3;
}

- (ICTagSelection)initWithCoder:(id)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICTagSelection *)self initWithManagedObjectContext:0];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    id v8 = [v6 setWithArray:v7];

    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    char v11 = [v9 setWithArray:v10];

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = NSStringFromSelector(sel_accountObjectIDURL);
    uint64_t v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    accountObjectIDURL = v5->_accountObjectIDURL;
    v5->_accountObjectIDURL = (NSURL *)v14;

    id v16 = NSStringFromSelector(sel_mode);
    v5->_unint64_t mode = [v4 decodeIntegerForKey:v16];

    id v17 = NSStringFromSelector(sel_tagOperator);
    v5->_unint64_t tagOperator = [v4 decodeIntegerForKey:v17];

    id v18 = NSStringFromSelector(sel_allowsRecentlyDeleted);
    v5->_BOOL allowsRecentlyDeleted = [v4 decodeBoolForKey:v18];

    uint64_t v19 = NSStringFromSelector(sel_automaticallyRemoveDeletedTags);
    v5->_BOOL automaticallyRemoveDeletedTags = [v4 decodeBoolForKey:v19];

    uint64_t v20 = NSStringFromSelector(sel_includedObjectIDURLs);
    uint64_t v21 = [v4 decodeObjectOfClasses:v8 forKey:v20];
    includedObjectIDURLs = v5->_includedObjectIDURLs;
    v5->_includedObjectIDURLs = (NSSet *)v21;

    v23 = NSStringFromSelector(sel_excludedObjectIDURLs);
    uint64_t v24 = [v4 decodeObjectOfClasses:v8 forKey:v23];
    excludedObjectIDURLs = v5->_excludedObjectIDURLs;
    v5->_excludedObjectIDURLs = (NSSet *)v24;

    uint64_t v26 = NSStringFromSelector(sel_hashtagObjectIDURLs);
    uint64_t v27 = [v4 decodeObjectOfClasses:v8 forKey:v26];
    hashtagObjectIDURLs = v5->_hashtagObjectIDURLs;
    v5->_hashtagObjectIDURLs = (NSSet *)v27;

    uint64_t v29 = NSStringFromSelector(sel_unresolvedIncludedTagIdentifiers);
    uint64_t v30 = [v4 decodeObjectOfClasses:v11 forKey:v29];
    unresolvedIncludedTagIdentifiers = v5->_unresolvedIncludedTagIdentifiers;
    v5->_unresolvedIncludedTagIdentifiers = (NSSet *)v30;

    v32 = NSStringFromSelector(sel_unresolvedExcludedTagIdentifiers);
    uint64_t v33 = [v4 decodeObjectOfClasses:v11 forKey:v32];
    unresolvedExcludedTagIdentifiers = v5->_unresolvedExcludedTagIdentifiers;
    v5->_unresolvedExcludedTagIdentifiers = (NSSet *)v33;
  }
  return v5;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (unint64_t)tagOperator
{
  return self->_tagOperator;
}

- (void)setTagOperator:(unint64_t)a3
{
  self->_unint64_t tagOperator = a3;
}

- (BOOL)allowsRecentlyDeleted
{
  return self->_allowsRecentlyDeleted;
}

- (void)setAllowsRecentlyDeleted:(BOOL)a3
{
  self->_BOOL allowsRecentlyDeleted = a3;
}

- (BOOL)automaticallyRemoveDeletedTags
{
  return self->_automaticallyRemoveDeletedTags;
}

- (void)setAutomaticallyRemoveDeletedTags:(BOOL)a3
{
  self->_BOOL automaticallyRemoveDeletedTags = a3;
}

- (BOOL)hasMultipleTagsSelected
{
  return self->_hasMultipleTagsSelected;
}

- (NSSet)includedObjectIDs
{
  return self->_includedObjectIDs;
}

- (NSSet)excludedObjectIDs
{
  return self->_excludedObjectIDs;
}

- (void)setTags:(id)a3
{
}

- (NSSet)unresolvedIncludedTagIdentifiers
{
  return self->_unresolvedIncludedTagIdentifiers;
}

- (void)setUnresolvedIncludedTagIdentifiers:(id)a3
{
}

- (NSSet)unresolvedExcludedTagIdentifiers
{
  return self->_unresolvedExcludedTagIdentifiers;
}

- (void)setUnresolvedExcludedTagIdentifiers:(id)a3
{
}

- (NSURL)accountObjectIDURL
{
  return self->_accountObjectIDURL;
}

- (void)setAccountObjectIDURL:(id)a3
{
}

- (NSSet)includedObjectIDURLs
{
  return self->_includedObjectIDURLs;
}

- (void)setIncludedObjectIDURLs:(id)a3
{
}

- (NSSet)excludedObjectIDURLs
{
  return self->_excludedObjectIDURLs;
}

- (void)setExcludedObjectIDURLs:(id)a3
{
}

- (NSSet)hashtagObjectIDURLs
{
  return self->_hashtagObjectIDURLs;
}

- (void)setHashtagObjectIDURLs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashtagObjectIDURLs, 0);
  objc_storeStrong((id *)&self->_excludedObjectIDURLs, 0);
  objc_storeStrong((id *)&self->_includedObjectIDURLs, 0);
  objc_storeStrong((id *)&self->_accountObjectIDURL, 0);
  objc_storeStrong((id *)&self->_unresolvedExcludedTagIdentifiers, 0);
  objc_storeStrong((id *)&self->_unresolvedIncludedTagIdentifiers, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_excludedObjectIDs, 0);
  objc_storeStrong((id *)&self->_includedObjectIDs, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

+ (void)tagSelectionWithData:(uint64_t)a1 managedObjectContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Unarchiving tagSelection data failed with error %@", (uint8_t *)&v2, 0xCu);
}

- (void)dataRepresentation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Archiving tagSelection data failed with error %@", (uint8_t *)&v2, 0xCu);
}

@end