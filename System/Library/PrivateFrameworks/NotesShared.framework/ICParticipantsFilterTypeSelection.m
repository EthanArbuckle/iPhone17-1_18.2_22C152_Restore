@interface ICParticipantsFilterTypeSelection
+ (id)keyPathsForValuesAffectingIsEmpty;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToICParticipantsFilterTypeSelection:(id)a3;
- (BOOL)isValid;
- (ICParticipantsFilterTypeSelection)initWithManagedObjectContext:(id)a3 accountObjectID:(id)a4;
- (ICParticipantsFilterTypeSelection)initWithManagedObjectContext:(id)a3 accountObjectID:(id)a4 selectionType:(unint64_t)a5;
- (ICParticipantsFilterTypeSelection)initWithManagedObjectContext:(id)a3 accountObjectID:(id)a4 selectionType:(unint64_t)a5 joinOperator:(unint64_t)a6;
- (NSArray)participants;
- (NSArray)unresolvedParticipants;
- (NSManagedObjectContext)managedObjectContext;
- (NSSet)participantUserIDs;
- (NSString)summary;
- (NSString)summaryWithJoinOperatorMenu;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)rawFilterValue;
- (unint64_t)hash;
- (unint64_t)joinOperator;
- (unint64_t)selectionType;
- (void)addParticipantUserID:(id)a3;
- (void)removeParticipantUserID:(id)a3;
- (void)setJoinOperator:(unint64_t)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setParticipantUserIDs:(id)a3;
- (void)setSelectionType:(unint64_t)a3;
@end

@implementation ICParticipantsFilterTypeSelection

- (ICParticipantsFilterTypeSelection)initWithManagedObjectContext:(id)a3 accountObjectID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICParticipantsFilterTypeSelection;
  v9 = [(ICParticipantsFilterTypeSelection *)&v14 init];
  v10 = v9;
  if (v9)
  {
    [(ICFilterTypeSelection *)v9 setAccountObjectID:v8];
    objc_storeStrong((id *)&v10->_managedObjectContext, a3);
    v10->_selectionType = 0;
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
    participantUserIDs = v10->_participantUserIDs;
    v10->_participantUserIDs = (NSSet *)v11;
  }
  return v10;
}

- (ICParticipantsFilterTypeSelection)initWithManagedObjectContext:(id)a3 accountObjectID:(id)a4 selectionType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICParticipantsFilterTypeSelection;
  uint64_t v11 = [(ICParticipantsFilterTypeSelection *)&v16 init];
  v12 = v11;
  if (v11)
  {
    [(ICFilterTypeSelection *)v11 setAccountObjectID:v10];
    objc_storeStrong((id *)&v12->_managedObjectContext, a3);
    v12->_selectionType = a5;
    if (a5 == 2) {
      v12->_joinOperator = 1;
    }
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] set];
    participantUserIDs = v12->_participantUserIDs;
    v12->_participantUserIDs = (NSSet *)v13;
  }
  return v12;
}

- (ICParticipantsFilterTypeSelection)initWithManagedObjectContext:(id)a3 accountObjectID:(id)a4 selectionType:(unint64_t)a5 joinOperator:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICParticipantsFilterTypeSelection;
  uint64_t v13 = [(ICParticipantsFilterTypeSelection *)&v18 init];
  objc_super v14 = v13;
  if (v13)
  {
    [(ICFilterTypeSelection *)v13 setAccountObjectID:v12];
    objc_storeStrong((id *)&v14->_managedObjectContext, a3);
    v14->_selectionType = a5;
    v14->_joinOperator = a6;
    uint64_t v15 = [MEMORY[0x1E4F1CAD0] set];
    participantUserIDs = v14->_participantUserIDs;
    v14->_participantUserIDs = (NSSet *)v15;
  }
  return v14;
}

- (id)debugDescription
{
  v3 = NSString;
  unint64_t v4 = [(ICParticipantsFilterTypeSelection *)self selectionType] - 1;
  if (v4 > 2) {
    v5 = @"me";
  }
  else {
    v5 = off_1E64A8E98[v4];
  }
  unint64_t v6 = [(ICParticipantsFilterTypeSelection *)self joinOperator];
  id v7 = @"unknown";
  if (v6 == 1) {
    id v7 = @"all";
  }
  if (v6 == 2) {
    id v7 = @"any";
  }
  id v8 = v7;
  id v9 = [(ICParticipantsFilterTypeSelection *)self participants];
  id v10 = [v9 componentsJoinedByString:@", "];
  id v11 = [v3 stringWithFormat:@"selectionType: %@\noperator: %@\nparticipants: %@", v5, v8, v10];

  return v11;
}

- (void)setSelectionType:(unint64_t)a3
{
  self->_selectionType = a3;
  if (a3 == 2 && ![(ICParticipantsFilterTypeSelection *)self joinOperator])
  {
    [(ICParticipantsFilterTypeSelection *)self setJoinOperator:1];
  }
}

- (NSString)summary
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(ICParticipantsFilterTypeSelection *)self selectionType];
  if (v4 < 2 || v4 == 3)
  {
    v2 = ICLocalizedStringFromICParticipantsFilterSelectionType((void *)[(ICParticipantsFilterTypeSelection *)self selectionType]);
    goto LABEL_29;
  }
  if (v4 != 2) {
    goto LABEL_29;
  }
  v5 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = [(ICParticipantsFilterTypeSelection *)self participants];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "ic_participantName");
        objc_msgSend(v5, "ic_addNonNilObject:", v13);

        objc_super v14 = objc_msgSend(v12, "ic_shortParticipantName");
        objc_msgSend(v6, "ic_addNonNilObject:", v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v9);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v15 = [(ICParticipantsFilterTypeSelection *)self unresolvedParticipants];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        v21 = [v20 displayName];
        objc_msgSend(v5, "ic_addNonNilObject:", v21);

        v22 = [v20 displayName];
        objc_msgSend(v6, "ic_addNonNilObject:", v22);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v17);
  }

  v23 = [(ICParticipantsFilterTypeSelection *)self participants];
  uint64_t v24 = [v23 count];
  v25 = [(ICParticipantsFilterTypeSelection *)self unresolvedParticipants];
  uint64_t v26 = [v25 count] + v24;

  if (v26 == 2)
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F28DF8]);
    v2 = [v29 stringFromItems:v6];
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v27 = v26 - 1;
  if (v26 == 1)
  {
    uint64_t v28 = [v5 firstObject];
    goto LABEL_25;
  }
  if (v26)
  {
    id v29 = [v6 firstObject];
    v30 = NSString;
    v31 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"PARTICIPANTS_%@_AND_%lu_OTHERS" value:@"PARTICIPANTS_%@_AND_%lu_OTHERS" table:0 allowSiri:1];
    v2 = objc_msgSend(v30, "localizedStringWithFormat:", v31, v29, v27);

    goto LABEL_27;
  }
  uint64_t v28 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"0 selected" value:@"0 selected" table:0 allowSiri:1];
LABEL_25:
  v2 = (void *)v28;
LABEL_28:

LABEL_29:
  return (NSString *)v2;
}

- (NSString)summaryWithJoinOperatorMenu
{
  return (NSString *)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Show notes shared with INLINE_MENU_PLEASE_READ_COMMENTS selected people." value:@"Show notes shared with INLINE_MENU_PLEASE_READ_COMMENTS selected people." table:0 allowSiri:1];
}

- (void)addParticipantUserID:(id)a3
{
  id v4 = a3;
  id v6 = [(ICParticipantsFilterTypeSelection *)self participantUserIDs];
  v5 = [v6 setByAddingObject:v4];

  [(ICParticipantsFilterTypeSelection *)self setParticipantUserIDs:v5];
}

- (void)removeParticipantUserID:(id)a3
{
  id v4 = a3;
  v5 = [(ICParticipantsFilterTypeSelection *)self participantUserIDs];
  id v7 = (id)[v5 mutableCopy];

  [v7 removeObject:v4];
  id v6 = (void *)[v7 copy];
  [(ICParticipantsFilterTypeSelection *)self setParticipantUserIDs:v6];
}

- (NSArray)unresolvedParticipants
{
  v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(ICParticipantsFilterTypeSelection *)self participantUserIDs];
  v5 = [v3 setWithSet:v4];

  id v6 = [(ICParticipantsFilterTypeSelection *)self participants];
  id v7 = objc_msgSend(v6, "ic_map:", &__block_literal_global_60);

  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  [v5 minusSet:v8];

  uint64_t v9 = objc_msgSend(v5, "ic_map:", &__block_literal_global_51_1);
  uint64_t v10 = [v9 allObjects];

  return (NSArray *)v10;
}

id __59__ICParticipantsFilterTypeSelection_unresolvedParticipants__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 userIdentity];
  v3 = [v2 userRecordID];
  id v4 = [v3 recordName];

  return v4;
}

ICCKShareUnknownParticipant *__59__ICParticipantsFilterTypeSelection_unresolvedParticipants__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[ICCKShareUnknownParticipant alloc] initWithParticipantUserID:v2];

  return v3;
}

- (NSArray)participants
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__49;
  id v11 = __Block_byref_object_dispose__49;
  id v12 = 0;
  v3 = [(ICParticipantsFilterTypeSelection *)self managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__ICParticipantsFilterTypeSelection_participants__block_invoke;
  v6[3] = &unk_1E64A44A8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performBlockAndWait:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __49__ICParticipantsFilterTypeSelection_participants__block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  v3 = [*(id *)(a1 + 32) accountObjectID];
  id v4 = objc_msgSend(v2, "ic_existingObjectWithID:", v3);
  v5 = ICDynamicCast();

  id v6 = [v5 uniqueUserParticipants];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__ICParticipantsFilterTypeSelection_participants__block_invoke_2;
  v10[3] = &unk_1E64A7728;
  v10[4] = *(void *)(a1 + 32);
  uint64_t v7 = objc_msgSend(v6, "ic_objectsPassingTest:", v10);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

uint64_t __49__ICParticipantsFilterTypeSelection_participants__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 participantUserIDs];
  v5 = [v3 userIdentity];

  id v6 = [v5 userRecordID];
  uint64_t v7 = [v6 recordName];
  uint64_t v8 = [v4 containsObject:v7];

  return v8;
}

- (BOOL)isValid
{
  return ![(ICParticipantsFilterTypeSelection *)self isEmpty];
}

- (BOOL)isEmpty
{
  if ([(ICParticipantsFilterTypeSelection *)self selectionType] != 2) {
    return 0;
  }
  id v3 = [(ICParticipantsFilterTypeSelection *)self participantUserIDs];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

+ (id)keyPathsForValuesAffectingIsEmpty
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ICParticipantsFilterTypeSelection;
  id v2 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingIsValid);
  id v3 = (void *)[v2 mutableCopy];

  [v3 addObjectsFromArray:&unk_1F1F62D48];
  BOOL v4 = (void *)[v3 copy];

  return v4;
}

- (id)rawFilterValue
{
  unint64_t v2 = [(ICParticipantsFilterTypeSelection *)self selectionType];
  if (v2 - 1 > 2) {
    return @"me";
  }
  else {
    return off_1E64A8E98[v2 - 1];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[ICParticipantsFilterTypeSelection allocWithZone:](ICParticipantsFilterTypeSelection, "allocWithZone:");
  objc_super v6 = [(ICParticipantsFilterTypeSelection *)self managedObjectContext];
  uint64_t v7 = [(ICFilterTypeSelection *)self accountObjectID];
  uint64_t v8 = [(ICParticipantsFilterTypeSelection *)v5 initWithManagedObjectContext:v6 accountObjectID:v7];

  [(ICParticipantsFilterTypeSelection *)v8 setSelectionType:[(ICParticipantsFilterTypeSelection *)self selectionType]];
  [(ICParticipantsFilterTypeSelection *)v8 setJoinOperator:[(ICParticipantsFilterTypeSelection *)self joinOperator]];
  uint64_t v9 = [(ICParticipantsFilterTypeSelection *)self participantUserIDs];
  uint64_t v10 = (void *)[v9 copyWithZone:a3];
  [(ICParticipantsFilterTypeSelection *)v8 setParticipantUserIDs:v10];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (ICParticipantsFilterTypeSelection *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ICParticipantsFilterTypeSelection *)self isEqualToICParticipantsFilterTypeSelection:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICParticipantsFilterTypeSelection selectionType](self, "selectionType"));
  uint64_t v4 = [v3 hash];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICParticipantsFilterTypeSelection joinOperator](self, "joinOperator"));
  char v6 = [v5 hash];
  uint64_t v7 = [(ICParticipantsFilterTypeSelection *)self managedObjectContext];
  [v7 hash];
  unint64_t v15 = ICHashWithHashKeys(v4, v8, v9, v10, v11, v12, v13, v14, v6);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v16 = [(ICParticipantsFilterTypeSelection *)self participantUserIDs];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [*(id *)(*((void *)&v30 + 1) + 8 * i) hash];
        v15 += ICHashWithHashKeys(v21, v22, v23, v24, v25, v26, v27, v28, 0);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v18);
  }

  return v15;
}

- (BOOL)isEqualToICParticipantsFilterTypeSelection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICParticipantsFilterTypeSelection *)self selectionType];
  if (v5 == [v4 selectionType]
    && (unint64_t v6 = [(ICParticipantsFilterTypeSelection *)self joinOperator],
        v6 == [v4 joinOperator]))
  {
    uint64_t v7 = [(ICParticipantsFilterTypeSelection *)self managedObjectContext];
    uint64_t v8 = [v4 managedObjectContext];
    if ([v7 isEqual:v8])
    {
      uint64_t v9 = [(ICParticipantsFilterTypeSelection *)self participantUserIDs];
      uint64_t v10 = [v4 participantUserIDs];
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

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (unint64_t)joinOperator
{
  return self->_joinOperator;
}

- (void)setJoinOperator:(unint64_t)a3
{
  self->_joinOperator = a3;
}

- (NSSet)participantUserIDs
{
  return self->_participantUserIDs;
}

- (void)setParticipantUserIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantUserIDs, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end