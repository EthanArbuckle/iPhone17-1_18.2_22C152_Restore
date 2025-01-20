@interface TIInputContextHistory
+ (BOOL)isMail;
+ (BOOL)nameComponentsAreEmpty:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (unint64_t)maxEntryLength;
- (BOOL)allParticipantsKnown;
- (BOOL)hasPendingEntries;
- (BOOL)isEqual:(id)a3;
- (BOOL)mostRecentTextEntryIsByMe;
- (BOOL)validateForSmartReplyGeneration;
- (NSDictionary)infoDict;
- (NSMutableDictionary)participantsIDtoNamesMap;
- (NSSet)firstPersonIdentifiers;
- (NSSet)primaryRecipientIdentifiers;
- (NSSet)recipientIdentifiers;
- (NSSet)recipientNames;
- (NSSet)secondaryRecipientIdentifiers;
- (NSSet)senderIdentifiers;
- (NSString)aggregateText;
- (NSString)focusedEntryIdentifier;
- (NSString)mostRecentNonSenderTextEntry;
- (NSString)mostRecentTextEntryLogString;
- (NSString)senderIdentifier;
- (NSString)threadIdentifier;
- (TIInputContextHistory)initWithCoder:(id)a3;
- (TIInputContextHistory)initWithRecipientIdentifiers:(id)a3;
- (TIInputContextHistory)initWithRecipientIdentifiers:(id)a3 senderIdentifier:(id)a4;
- (TIInputContextHistory)initWithRecipientIdentifiers:(id)a3 senderIdentifiers:(id)a4;
- (TIInputContextHistory)initWithThreadID:(unint64_t)a3 participantsIDtoNamesMap:(id)a4 firstPersonIDs:(id)a5 primaryRecipients:(id)a6 secondaryRecipients:(id)a7;
- (TIInputContextHistory)initWithThreadIdentifier:(id)a3 participantsIDtoNamesMap:(id)a4 firstPersonIDs:(id)a5 primaryRecipients:(id)a6 secondaryRecipients:(id)a7 infoDict:(id)a8;
- (id).cxx_construct;
- (id)_addEntry:(id)a3;
- (id)_addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5 entryIdentifier:(id)a6 primaryRecipientIdentifiers:(id)a7 secondaryRecipientIdentifiers:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)invalidReasonsForSmartReplyGeneration;
- (id)mostRecentTextEntries:(unint64_t)a3;
- (id)mostRecentTextEntry;
- (unint64_t)maxContextLength;
- (unint64_t)threadID;
- (void)_enumerateAllEntriesAsInputContextEntries:(id)a3;
- (void)addEntry:(id)a3;
- (void)addNewParticipantWithIdentifier:(id)a3 name:(id)a4;
- (void)addTextEntry:(id)a3 timestamp:(id)a4;
- (void)addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5;
- (void)addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5 entryIdentifier:(id)a6;
- (void)appendPendingEntriesFromInputContextHistory:(id)a3;
- (void)assertCheckpointForCoding;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAllContextEntries:(id)a3;
- (void)enumerateAllContextEntriesWithEntryId:(id)a3;
- (void)enumerateAllContextEntryObjects:(id)a3;
- (void)enumerateAllEntries:(id)a3;
- (void)enumeratePendingEntries:(id)a3;
- (void)setFocusedEntryIdentifier:(id)a3;
- (void)setInfoDict:(id)a3;
- (void)setMaxContextLength:(unint64_t)a3;
- (void)updateRecipientNames:(id)a3;
@end

@implementation TIInputContextHistory

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 6) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = (char *)self + 40;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoDict, 0);
  objc_storeStrong((id *)&self->_focusedEntryIdentifier, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_participantsIDtoNamesMap, 0);
  objc_storeStrong((id *)&self->_firstPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_secondaryRecipientIdentifiers, 0);
  objc_storeStrong((id *)&self->_primaryRecipientIdentifiers, 0);
  objc_storeStrong((id *)&self->_recipientNames, 0);
  objc_storeStrong((id *)&self->_recipientIdentifiers, 0);
  std::__tree<NSHolder<TIInputContextEntry>>::destroy((void *)self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
  left = self->_entries.__tree_.__pair1_.__value_.__left_;

  std::__tree<NSHolder<TIInputContextEntry>>::destroy(left);
}

- (void)setInfoDict:(id)a3
{
}

- (NSDictionary)infoDict
{
  return self->_infoDict;
}

- (void)setMaxContextLength:(unint64_t)a3
{
  self->_maxContextLength = a3;
}

- (unint64_t)maxContextLength
{
  return self->_maxContextLength;
}

- (void)setFocusedEntryIdentifier:(id)a3
{
}

- (NSString)focusedEntryIdentifier
{
  return self->_focusedEntryIdentifier;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (NSMutableDictionary)participantsIDtoNamesMap
{
  return self->_participantsIDtoNamesMap;
}

- (NSSet)firstPersonIdentifiers
{
  return self->_firstPersonIdentifiers;
}

- (NSSet)secondaryRecipientIdentifiers
{
  return self->_secondaryRecipientIdentifiers;
}

- (NSSet)primaryRecipientIdentifiers
{
  return self->_primaryRecipientIdentifiers;
}

- (NSSet)recipientNames
{
  return self->_recipientNames;
}

- (NSSet)recipientIdentifiers
{
  return self->_recipientIdentifiers;
}

- (void)enumerateAllContextEntriesWithEntryId:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__TIInputContextHistory_enumerateAllContextEntriesWithEntryId___block_invoke;
  v6[3] = &unk_1E5559B40;
  id v7 = v4;
  id v5 = v4;
  [(TIInputContextHistory *)self _enumerateAllEntriesAsInputContextEntries:v6];
}

void __63__TIInputContextHistory_enumerateAllContextEntriesWithEntryId___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v10 = [v5 text];
  v6 = [v5 timestamp];
  id v7 = [v5 senderIdentifier];
  v8 = [v5 senderName];
  v9 = [v5 entryIdentifier];

  (*(void (**)(uint64_t, id, void *, void *, void *, void *, uint64_t))(v4 + 16))(v4, v10, v6, v7, v8, v9, a3);
}

- (void)enumerateAllContextEntries:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__TIInputContextHistory_enumerateAllContextEntries___block_invoke;
  v6[3] = &unk_1E5559B40;
  id v7 = v4;
  id v5 = v4;
  [(TIInputContextHistory *)self _enumerateAllEntriesAsInputContextEntries:v6];
}

void __52__TIInputContextHistory_enumerateAllContextEntries___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v9 = [v5 text];
  v6 = [v5 timestamp];
  id v7 = [v5 senderIdentifier];
  v8 = [v5 senderName];

  (*(void (**)(uint64_t, id, void *, void *, void *, uint64_t))(v4 + 16))(v4, v9, v6, v7, v8, a3);
}

- (void)enumerateAllEntries:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__TIInputContextHistory_enumerateAllEntries___block_invoke;
  v6[3] = &unk_1E5559B40;
  id v7 = v4;
  id v5 = v4;
  [(TIInputContextHistory *)self _enumerateAllEntriesAsInputContextEntries:v6];
}

void __45__TIInputContextHistory_enumerateAllEntries___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v8 = [v5 text];
  v6 = [v5 timestamp];
  id v7 = [v5 senderIdentifier];

  (*(void (**)(uint64_t, id, void *, void *, uint64_t))(v4 + 16))(v4, v8, v6, v7, a3);
}

- (void)addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5 entryIdentifier:(id)a6
{
  id v6 = [(TIInputContextHistory *)self _addTextEntry:a3 timestamp:a4 senderIdentifier:a5 entryIdentifier:a6 primaryRecipientIdentifiers:0 secondaryRecipientIdentifiers:0];
}

- (void)addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5
{
  id v5 = [(TIInputContextHistory *)self _addTextEntry:a3 timestamp:a4 senderIdentifier:a5 entryIdentifier:0 primaryRecipientIdentifiers:0 secondaryRecipientIdentifiers:0];
}

- (void)addTextEntry:(id)a3 timestamp:(id)a4
{
}

- (id)invalidReasonsForSmartReplyGeneration
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(TIInputContextHistory *)self threadIdentifier];
  uint64_t v5 = [v4 length];

  if (!v5) {
    [v3 addObject:@"Invalid thread identifier"];
  }
  id v6 = [(TIInputContextHistory *)self recipientIdentifiers];
  uint64_t v7 = [v6 count];

  if (!v7) {
    [v3 addObject:@"Invalid recipient identifiers"];
  }
  id v8 = [(TIInputContextHistory *)self primaryRecipientIdentifiers];
  uint64_t v9 = [v8 count];

  if (!v9) {
    [v3 addObject:@"Invalid primary recipient identifiers"];
  }
  id v10 = [(TIInputContextHistory *)self firstPersonIdentifiers];
  uint64_t v11 = [v10 count];

  if (!v11) {
    [v3 addObject:@"Invalid first person identifiers"];
  }
  v12 = [(TIInputContextHistory *)self participantsIDtoNamesMap];
  uint64_t v13 = [v12 count];

  if (!v13) {
    [v3 addObject:@"Invalid participants map"];
  }
  if (self->_entries.__tree_.__pair3_.__value_ || self->_pendingEntries.__tree_.__pair3_.__value_)
  {
    v14 = [(TIInputContextHistory *)self mostRecentTextEntry];
    v15 = [v14 text];
    uint64_t v16 = [v15 length];

    if (v16) {
      goto LABEL_17;
    }
    v17 = @"Invalid most recent text entry";
  }
  else
  {
    v17 = @"Invalid entries (no regular or pending)";
  }
  [v3 addObject:v17];
LABEL_17:

  return v3;
}

- (BOOL)validateForSmartReplyGeneration
{
  id v3 = [(TIInputContextHistory *)self threadIdentifier];
  if ([v3 length])
  {
    uint64_t v4 = [(TIInputContextHistory *)self recipientIdentifiers];
    if ([v4 count])
    {
      uint64_t v5 = [(TIInputContextHistory *)self primaryRecipientIdentifiers];
      if ([v5 count])
      {
        id v6 = [(TIInputContextHistory *)self firstPersonIdentifiers];
        if ([v6 count])
        {
          uint64_t v7 = [(TIInputContextHistory *)self participantsIDtoNamesMap];
          if ([v7 count])
          {
            id v8 = [(TIInputContextHistory *)self mostRecentTextEntry];
            uint64_t v9 = [v8 text];
            if ([v9 length])
            {
              if (self->_entries.__tree_.__pair3_.__value_) {
                BOOL v10 = 1;
              }
              else {
                BOOL v10 = self->_pendingEntries.__tree_.__pair3_.__value_ != 0;
              }
            }
            else
            {
              BOOL v10 = 0;
            }
          }
          else
          {
            BOOL v10 = 0;
          }
        }
        else
        {
          BOOL v10 = 0;
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)allParticipantsKnown
{
  v2 = self;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  id v3 = [(TIInputContextHistory *)self primaryRecipientIdentifiers];
  uint64_t v4 = [(TIInputContextHistory *)v2 secondaryRecipientIdentifiers];
  uint64_t v5 = [v3 setByAddingObjectsFromSet:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__TIInputContextHistory_allParticipantsKnown__block_invoke;
  v7[3] = &unk_1E5559B90;
  v7[4] = v2;
  v7[5] = &v8;
  [v5 enumerateObjectsUsingBlock:v7];
  LOBYTE(v2) = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

void __45__TIInputContextHistory_allParticipantsKnown__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 participantsIDtoNamesMap];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if ([(id)objc_opt_class() nameComponentsAreEmpty:v8])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (id)debugDescription
{
  id v3 = [(TIInputContextHistory *)self mostRecentTextEntry];
  uint64_t v4 = [v3 text];
  uint64_t v5 = [v4 length];

  if ([(TIInputContextHistory *)self validateForSmartReplyGeneration])
  {
    v20 = 0;
    v19 = @"Valid";
  }
  else
  {
    v19 = [(TIInputContextHistory *)self invalidReasonsForSmartReplyGeneration];
    v20 = v19;
  }
  v18 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  unint64_t value = self->_entries.__tree_.__pair3_.__value_;
  unint64_t v8 = self->_pendingEntries.__tree_.__pair3_.__value_;
  uint64_t v9 = [(TIInputContextHistory *)self threadIdentifier];
  if (v5) {
    uint64_t v10 = @"Valid";
  }
  else {
    uint64_t v10 = @"Invalid";
  }
  char v11 = [(TIInputContextHistory *)self mostRecentTextEntry];
  v12 = [v11 entryIdentifier];
  if ([(TIInputContextHistory *)self mostRecentTextEntryIsByMe]) {
    uint64_t v13 = @"Y";
  }
  else {
    uint64_t v13 = @"N";
  }
  if ([(TIInputContextHistory *)self allParticipantsKnown]) {
    v14 = @"Y";
  }
  else {
    v14 = @"N";
  }
  v15 = [v18 stringWithFormat:@"<%@ %p (%@) entries: %lu (pending: %lu), threadIdentifier: %@, lastEntry (%@) entryId: %@, byMe: %@, known: %@>", v7, self, v19, value, v8, v9, v10, v12, v13, v14];

  return v15;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p: pendingEntries: %lu, entries: %lu>", v5, self, self->_pendingEntries.__tree_.__pair3_.__value_, self->_entries.__tree_.__pair3_.__value_];

  return v6;
}

- (void)addNewParticipantWithIdentifier:(id)a3 name:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(TIInputContextHistory *)self participantsIDtoNamesMap];
    [v8 setObject:v6 forKeyedSubscript:v7];
  }
}

- (NSSet)senderIdentifiers
{
  return self->_firstPersonIdentifiers;
}

- (NSString)senderIdentifier
{
  return (NSString *)[(NSSet *)self->_firstPersonIdentifiers anyObject];
}

- (id)mostRecentTextEntries:(unint64_t)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  v25[0] = 0;
  v25[1] = 0;
  v24 = v25;
  std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v24, (void **)self->_pendingEntries.__tree_.__begin_node_, &self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
  v27[0] = 0;
  v27[1] = 0;
  v26 = v27;
  std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v26, (void **)self->_entries.__tree_.__begin_node_, &self->_entries.__tree_.__pair1_.__value_.__left_);
  int v5 = 0;
  LOBYTE(self) = 0;
  uint64_t v7 = 1;
  id v8 = &v24;
  while (1)
  {
    char v9 = (char)self;
    uint64_t v10 = v8 + 1;
    if (v8 + 1 != (void *)*v8) {
      break;
    }
LABEL_19:
    id v8 = &v25[3 * v7 - 1];
    LODWORD(self) = 1;
    uint64_t v7 = 2;
    if (v9) {
      goto LABEL_22;
    }
  }
  uint64_t v11 = v5;
  if (a3 <= v5) {
    unint64_t v12 = v5;
  }
  else {
    unint64_t v12 = a3;
  }
  while (v11 != v12)
  {
    uint64_t v13 = *v10;
    v14 = v10;
    if (*v10)
    {
      do
      {
        uint64_t v15 = v13;
        uint64_t v13 = *(void *)(v13 + 8);
      }
      while (v13);
    }
    else
    {
      do
      {
        uint64_t v15 = v14[2];
        BOOL v16 = *(void *)v15 == (void)v14;
        v14 = (void *)v15;
      }
      while (v16);
    }
    v17 = [*(id *)(v15 + 32) text];
    if (v17) {
      [v4 insertObject:v17 atIndex:0];
    }

    v18 = (void *)*v10;
    if (*v10)
    {
      do
      {
        v19 = v18;
        v18 = (void *)v18[1];
      }
      while (v18);
    }
    else
    {
      do
      {
        v19 = (void *)v10[2];
        BOOL v16 = *v19 == (void)v10;
        uint64_t v10 = v19;
      }
      while (v16);
    }
    ++v11;
    uint64_t v10 = v19;
    if (v19 == (void *)*v8)
    {
      int v5 = v11;
      goto LABEL_19;
    }
  }
  id v20 = v4;
  LODWORD(self) = 0;
LABEL_22:
  for (uint64_t i = 4; i != -2; i -= 3)
    std::__tree<NSHolder<TIInputContextEntry>>::destroy((void *)v25[i - 1]);
  if (self) {
    id v22 = v4;
  }

  return v4;
}

- (BOOL)mostRecentTextEntryIsByMe
{
  id v3 = [(TIInputContextHistory *)self mostRecentTextEntry];
  uint64_t v4 = [(TIInputContextHistory *)self firstPersonIdentifiers];
  int v5 = [v3 senderIdentifier];
  if ([v4 containsObject:v5]) {
    char v6 = 1;
  }
  else {
    char v6 = [v3 isFromMe];
  }

  return v6;
}

- (NSString)mostRecentTextEntryLogString
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [(TIInputContextHistory *)self mostRecentTextEntry];
  uint64_t v4 = [(TIInputContextHistory *)self firstPersonIdentifiers];
  int v5 = [v3 senderIdentifier];
  int v22 = [v4 containsObject:v5];

  char v6 = [v3 text];
  uint64_t v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v8 = [v6 componentsSeparatedByCharactersInSet:v7];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  char v9 = v8;
  uint64_t v10 = [(__CFString *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    uint64_t v13 = &stru_1EDBDCE38;
    do
    {
      uint64_t v14 = 0;
      uint64_t v15 = v13;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v16 = *(void **)(*((void *)&v23 + 1) + 8 * v14);
        uint64_t v17 = [v16 length];
        if (v17)
        {
          id v8 = [v16 substringToIndex:1];
          v18 = v8;
        }
        else
        {
          v18 = &stru_1EDBDCE38;
        }
        uint64_t v13 = [(__CFString *)v15 stringByAppendingString:v18];

        if (v17) {
        ++v14;
        }
        uint64_t v15 = v13;
      }
      while (v11 != v14);
      uint64_t v11 = [(__CFString *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v13 = &stru_1EDBDCE38;
  }

  v19 = @"n";
  if (v22) {
    v19 = @"y";
  }
  id v20 = [NSString stringWithFormat:@"%@|%@", v13, v19];

  return (NSString *)v20;
}

- (id)mostRecentTextEntry
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v20[0] = 0;
  v20[1] = 0;
  v19 = v20;
  std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v19, (void **)self->_entries.__tree_.__begin_node_, &self->_entries.__tree_.__pair1_.__value_.__left_);
  v22[0] = 0;
  v22[1] = 0;
  v21 = v22;
  std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v21, (void **)self->_pendingEntries.__tree_.__begin_node_, &self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
  char v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 1;
  char v6 = &v19;
  do
  {
    char v7 = v3;
    if (v6[2])
    {
      if (!v4) {
        goto LABEL_10;
      }
      id v8 = v6 + 1;
      char v9 = (void *)v6[1];
      if (v9)
      {
        do
        {
          uint64_t v10 = v9;
          char v9 = (void *)v9[1];
        }
        while (v9);
      }
      else
      {
        do
        {
          uint64_t v10 = (void *)v8[2];
          BOOL v11 = *v10 == (void)v8;
          id v8 = v10;
        }
        while (v11);
      }
      if (v10[4] && (objc_msgSend(v4, "compare:") & 0x80000000) != 0)
      {
LABEL_10:
        uint64_t v14 = v6[1];
        uint64_t v13 = v6 + 1;
        uint64_t v12 = v14;
        if (v14)
        {
          do
          {
            uint64_t v15 = v12;
            uint64_t v12 = *(void *)(v12 + 8);
          }
          while (v12);
        }
        else
        {
          do
          {
            uint64_t v15 = v13[2];
            BOOL v11 = *(void *)v15 == (void)v13;
            uint64_t v13 = (void *)v15;
          }
          while (v11);
        }
        id v16 = *(id *)(v15 + 32);

        uint64_t v4 = v16;
      }
    }
    char v6 = &v20[3 * v5 - 1];
    char v3 = 1;
    uint64_t v5 = 2;
  }
  while ((v7 & 1) == 0);
  for (uint64_t i = 4; i != -2; i -= 3)
    std::__tree<NSHolder<TIInputContextEntry>>::destroy((void *)v20[i - 1]);

  return v4;
}

- (NSString)mostRecentNonSenderTextEntry
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v28[0] = 0;
  v28[1] = 0;
  v27 = v28;
  std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v27, (void **)self->_entries.__tree_.__begin_node_, &self->_entries.__tree_.__pair1_.__value_.__left_);
  v30[0] = 0;
  v30[1] = 0;
  v29 = v30;
  std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v29, (void **)self->_pendingEntries.__tree_.__begin_node_, &self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
  char v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 1;
  char v6 = &v27;
  do
  {
    char v7 = v3;
    id v8 = v6 + 1;
    if (v6 + 1 != (void *)*v6)
    {
      while (1)
      {
        char v9 = [(TIInputContextHistory *)self firstPersonIdentifiers];
        uint64_t v10 = *v8;
        BOOL v11 = v8;
        if (*v8)
        {
          do
          {
            uint64_t v12 = v10;
            uint64_t v10 = *(void *)(v10 + 8);
          }
          while (v10);
        }
        else
        {
          do
          {
            uint64_t v12 = v11[2];
            BOOL v13 = *(void *)v12 == (void)v11;
            BOOL v11 = (void *)v12;
          }
          while (v13);
        }
        uint64_t v14 = [*(id *)(v12 + 32) senderIdentifier];
        char v15 = [v9 containsObject:v14];

        if ((v15 & 1) == 0) {
          break;
        }
        id v16 = (void *)*v8;
        if (*v8)
        {
          do
          {
            uint64_t v17 = v16;
            id v16 = (void *)v16[1];
          }
          while (v16);
        }
        else
        {
          do
          {
            uint64_t v17 = (void *)v8[2];
            BOOL v13 = *v17 == (void)v8;
            id v8 = v17;
          }
          while (v13);
        }
        id v8 = v17;
        if (v17 == (void *)*v6) {
          goto LABEL_26;
        }
      }
      if (!v4) {
        goto LABEL_21;
      }
      v18 = (void *)*v8;
      v19 = v8;
      if (*v8)
      {
        do
        {
          id v20 = v18;
          v18 = (void *)v18[1];
        }
        while (v18);
      }
      else
      {
        do
        {
          id v20 = (void *)v19[2];
          BOOL v13 = *v20 == (void)v19;
          v19 = v20;
        }
        while (v13);
      }
      if (v20[4] && (objc_msgSend(v4, "compare:") & 0x80000000) != 0)
      {
LABEL_21:
        uint64_t v21 = *v8;
        if (*v8)
        {
          do
          {
            uint64_t v22 = v21;
            uint64_t v21 = *(void *)(v21 + 8);
          }
          while (v21);
        }
        else
        {
          do
          {
            uint64_t v22 = v8[2];
            BOOL v13 = *(void *)v22 == (void)v8;
            id v8 = (void *)v22;
          }
          while (v13);
        }
        id v23 = *(id *)(v22 + 32);

        uint64_t v4 = v23;
      }
    }
LABEL_26:
    char v6 = &v28[3 * v5 - 1];
    char v3 = 1;
    uint64_t v5 = 2;
  }
  while ((v7 & 1) == 0);
  for (uint64_t i = 4; i != -2; i -= 3)
    std::__tree<NSHolder<TIInputContextEntry>>::destroy((void *)v28[i - 1]);
  long long v25 = [v4 text];

  return (NSString *)v25;
}

- (NSString)aggregateText
{
  char v3 = [MEMORY[0x1E4F28E78] string];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__TIInputContextHistory_aggregateText__block_invoke;
  v6[3] = &unk_1E5559B68;
  id v4 = v3;
  id v7 = v4;
  [(TIInputContextHistory *)self enumerateAllEntries:v6];

  return (NSString *)v4;
}

uint64_t __38__TIInputContextHistory_aggregateText__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

- (BOOL)hasPendingEntries
{
  return self->_pendingEntries.__tree_.__pair3_.__value_ != 0;
}

- (void)appendPendingEntriesFromInputContextHistory:(id)a3
{
  uint64_t v12 = a3;
  if (v12)
  {
    id v4 = (void **)v12[4];
    if (v4 != v12 + 5)
    {
      do
      {
        uint64_t v5 = v4 + 4;
        if (!std::__tree<NSHolder<TIInputContextEntry>>::__count_unique<NSHolder<TIInputContextEntry>>((void *)self->_pendingEntries.__tree_.__pair1_.__value_.__left_, v4 + 4)&& !std::__tree<NSHolder<TIInputContextEntry>>::__count_unique<NSHolder<TIInputContextEntry>>((void *)self->_entries.__tree_.__pair1_.__value_.__left_, v4 + 4))
        {
          char v6 = [*v5 text];
          id v7 = [*v5 timestamp];
          id v8 = [*v5 senderIdentifier];
          [(TIInputContextHistory *)self addTextEntry:v6 timestamp:v7 senderIdentifier:v8];
        }
        char v9 = (void **)v4[1];
        if (v9)
        {
          do
          {
            uint64_t v10 = v9;
            char v9 = (void **)*v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            uint64_t v10 = (void **)v4[2];
            BOOL v11 = *v10 == v4;
            id v4 = v10;
          }
          while (!v11);
        }
        id v4 = v10;
      }
      while (v10 != v12 + 5);
    }
  }
}

- (void)enumeratePendingEntries:(id)a3
{
  id v4 = (void (**)(id, void *, void *, void *, NSSet *, unsigned char *))a3;
  if (v4)
  {
    char v12 = 0;
    begin_node = (TIInputContextHistory *)self->_pendingEntries.__tree_.__begin_node_;
    if (begin_node != (TIInputContextHistory *)&self->_pendingEntries.__tree_.__pair1_)
    {
      do
      {
        char v6 = [begin_node->_pendingEntries.__tree_.__begin_node_ text];
        id v7 = [begin_node->_pendingEntries.__tree_.__begin_node_ timestamp];
        id v8 = [begin_node->_pendingEntries.__tree_.__begin_node_ senderIdentifier];
        v4[2](v4, v6, v7, v8, self->_recipientIdentifiers, &v12);

        if (v12) {
          break;
        }
        isa = (TIInputContextHistory *)begin_node->_entries.__tree_.__begin_node_;
        if (isa)
        {
          do
          {
            left = isa;
            isa = (TIInputContextHistory *)isa->super.isa;
          }
          while (isa);
        }
        else
        {
          do
          {
            left = (TIInputContextHistory *)begin_node->_entries.__tree_.__pair1_.__value_.__left_;
            BOOL v11 = left->super.isa == (Class)begin_node;
            begin_node = left;
          }
          while (!v11);
        }
        begin_node = left;
      }
      while (left != (TIInputContextHistory *)&self->_pendingEntries.__tree_.__pair1_);
    }
  }
}

- (void)_enumerateAllEntriesAsInputContextEntries:(id)a3
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  if (v4)
  {
    char v16 = 0;
    v18[0] = 0;
    v18[1] = 0;
    uint64_t v17 = v18;
    std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v17, (void **)self->_entries.__tree_.__begin_node_, &self->_entries.__tree_.__pair1_.__value_.__left_);
    v20[0] = 0;
    v20[1] = 0;
    v19 = v20;
    std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v19, (void **)self->_pendingEntries.__tree_.__begin_node_, &self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
    char v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      char v7 = v5;
      id v8 = &v18[3 * v6 - 1];
      BOOL v11 = (void *)*v8;
      char v9 = v8 + 1;
      uint64_t v10 = v11;
      if (v11 != v9) {
        break;
      }
LABEL_11:
      char v5 = 1;
      uint64_t v6 = 1;
      if (v7) {
        goto LABEL_12;
      }
    }
    while (1)
    {
      v4[2](v4, v10[4], &v16);
      if (v16) {
        break;
      }
      char v12 = (void *)v10[1];
      if (v12)
      {
        do
        {
          BOOL v13 = v12;
          char v12 = (void *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          BOOL v13 = (void *)v10[2];
          BOOL v14 = *v13 == (void)v10;
          uint64_t v10 = v13;
        }
        while (!v14);
      }
      uint64_t v10 = v13;
      if (v13 == v9) {
        goto LABEL_11;
      }
    }
LABEL_12:
    for (uint64_t i = 4; i != -2; i -= 3)
      std::__tree<NSHolder<TIInputContextEntry>>::destroy((void *)v18[i - 1]);
  }
}

- (void)enumerateAllContextEntryObjects:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__TIInputContextHistory_enumerateAllContextEntryObjects___block_invoke;
  v6[3] = &unk_1E5559B40;
  id v7 = v4;
  id v5 = v4;
  [(TIInputContextHistory *)self _enumerateAllEntriesAsInputContextEntries:v6];
}

uint64_t __57__TIInputContextHistory_enumerateAllContextEntryObjects___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_addEntry:(id)a3
{
  id v4 = a3;
  id v5 = [(TIInputContextHistory *)self participantsIDtoNamesMap];
  if ([v5 count])
  {
    uint64_t v6 = [v4 senderIdentifier];

    if (!v6) {
      goto LABEL_5;
    }
    id v7 = [(TIInputContextHistory *)self participantsIDtoNamesMap];
    id v8 = [v4 senderIdentifier];
    id v5 = [v7 objectForKey:v8];

    [v4 setSenderName:v5];
  }

LABEL_5:
  objc_msgSend(v4, "enforceMaxContextLength:", -[TIInputContextHistory maxContextLength](self, "maxContextLength"));
  id v9 = v4;
  v49 = v9;
  std::__tree<NSHolder<TIInputContextEntry>>::__emplace_unique_key_args<NSHolder<TIInputContextEntry>,NSHolder<TIInputContextEntry>>((uint64_t **)&self->_pendingEntries, &v49, (uint64_t *)&v49);

  unint64_t value = self->_entries.__tree_.__pair3_.__value_;
  if (value + self->_pendingEntries.__tree_.__pair3_.__value_ < 0x10) {
    goto LABEL_100;
  }
  do
  {
    begin_node = self->_pendingEntries.__tree_.__begin_node_;
    if (value)
    {
      char v12 = (void *)*((void *)self->_entries.__tree_.__begin_node_ + 4);
      uint64_t v13 = begin_node[4];
      if (v12) {
        BOOL v14 = v13 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
        if (v13) {
          int v15 = -1;
        }
        else {
          int v15 = 0;
        }
        if (v12) {
          int v17 = 1;
        }
        else {
          int v17 = v15;
        }
      }
      else
      {
        int v17 = objc_msgSend(v12, "compare:");
      }
      if (v17 < 0) {
        p_entries = &self->_entries;
      }
      else {
        p_entries = &self->_pendingEntries;
      }
      begin_node = p_entries->__tree_.__begin_node_;
    }
    else
    {
      p_entries = &self->_pendingEntries;
    }
    v18 = (void *)begin_node[1];
    v19 = begin_node;
    if (v18)
    {
      do
      {
        id v20 = v18;
        v18 = (void *)*v18;
      }
      while (v18);
    }
    else
    {
      do
      {
        id v20 = (void *)v19[2];
        BOOL v14 = *v20 == (void)v19;
        v19 = v20;
      }
      while (!v14);
    }
    p_entries->__tree_.__begin_node_ = v20;
    left = p_entries->__tree_.__pair1_.__value_.__left_;
    --p_entries->__tree_.__pair3_.__value_;
    uint64_t v22 = *begin_node;
    id v23 = begin_node;
    if (*begin_node)
    {
      long long v24 = (void *)begin_node[1];
      if (!v24)
      {
        id v23 = begin_node;
LABEL_34:
        int v25 = 0;
        *(void *)(v22 + 16) = v23[2];
        goto LABEL_35;
      }
      do
      {
        id v23 = v24;
        long long v24 = (void *)*v24;
      }
      while (v24);
    }
    uint64_t v22 = v23[1];
    if (v22) {
      goto LABEL_34;
    }
    int v25 = 1;
LABEL_35:
    long long v26 = (void *)v23[2];
    v27 = (void *)*v26;
    if ((void *)*v26 == v23)
    {
      void *v26 = v22;
      if (v23 == left)
      {
        v27 = 0;
        left = (void *)v22;
      }
      else
      {
        v27 = (void *)v26[1];
      }
    }
    else
    {
      v26[1] = v22;
    }
    int v28 = *((unsigned __int8 *)v23 + 24);
    if (v23 != begin_node)
    {
      uint64_t v29 = begin_node[2];
      v23[2] = v29;
      *(void *)(v29 + 8 * (*(void *)begin_node[2] != (void)begin_node)) = v23;
      uint64_t v31 = *begin_node;
      uint64_t v30 = begin_node[1];
      *(void *)(v31 + 16) = v23;
      *id v23 = v31;
      v23[1] = v30;
      if (v30) {
        *(void *)(v30 + 16) = v23;
      }
      *((unsigned char *)v23 + 24) = *((unsigned char *)begin_node + 24);
      if (left == begin_node) {
        left = v23;
      }
    }
    if (!v28 || !left) {
      goto LABEL_99;
    }
    if (!v25)
    {
      *(unsigned char *)(v22 + 24) = 1;
      goto LABEL_99;
    }
    while (1)
    {
      uint64_t v32 = v27[2];
      if (*(void **)v32 != v27) {
        break;
      }
      if (!*((unsigned char *)v27 + 24))
      {
        *((unsigned char *)v27 + 24) = 1;
        *(unsigned char *)(v32 + 24) = 0;
        uint64_t v38 = v27[1];
        *(void *)uint64_t v32 = v38;
        if (v38) {
          *(void *)(v38 + 16) = v32;
        }
        v27[2] = *(void *)(v32 + 16);
        *(void *)(*(void *)(v32 + 16) + 8 * (**(void **)(v32 + 16) != v32)) = v27;
        v27[1] = v32;
        *(void *)(v32 + 16) = v27;
        if (left == (void *)v32) {
          left = v27;
        }
        v27 = *(void **)v32;
      }
      v39 = (unsigned char *)*v27;
      if (*v27 && !v39[24]) {
        goto LABEL_94;
      }
      v40 = (uint64_t *)v27[1];
      if (v40 && !*((unsigned char *)v40 + 24))
      {
        if (v39 && !v39[24])
        {
LABEL_94:
          v40 = v27;
        }
        else
        {
          *((unsigned char *)v40 + 24) = 1;
          *((unsigned char *)v27 + 24) = 0;
          uint64_t v46 = *v40;
          v27[1] = *v40;
          if (v46) {
            *(void *)(v46 + 16) = v27;
          }
          v40[2] = v27[2];
          *(void *)(v27[2] + 8 * (*(void *)v27[2] != (void)v27)) = v40;
          uint64_t *v40 = (uint64_t)v27;
          v27[2] = v40;
          v39 = v27;
        }
        uint64_t v43 = v40[2];
        *((unsigned char *)v40 + 24) = *(unsigned char *)(v43 + 24);
        *(unsigned char *)(v43 + 24) = 1;
        v39[24] = 1;
        v44 = *(uint64_t **)v43;
        uint64_t v47 = *(void *)(*(void *)v43 + 8);
        *(void *)uint64_t v43 = v47;
        if (v47) {
          *(void *)(v47 + 16) = v43;
        }
        v44[2] = *(void *)(v43 + 16);
        *(void *)(*(void *)(v43 + 16) + 8 * (**(void **)(v43 + 16) != v43)) = v44;
        v44[1] = v43;
        goto LABEL_98;
      }
      *((unsigned char *)v27 + 24) = 0;
      v37 = (unsigned char *)v27[2];
      if (v37[24]) {
        BOOL v41 = v37 == (unsigned char *)left;
      }
      else {
        BOOL v41 = 1;
      }
      if (v41) {
        goto LABEL_79;
      }
LABEL_76:
      v27 = *(void **)(*((void *)v37 + 2) + 8 * (**((void **)v37 + 2) == (void)v37));
    }
    if (!*((unsigned char *)v27 + 24))
    {
      *((unsigned char *)v27 + 24) = 1;
      *(unsigned char *)(v32 + 24) = 0;
      v33 = *(uint64_t **)(v32 + 8);
      uint64_t v34 = *v33;
      *(void *)(v32 + 8) = *v33;
      if (v34) {
        *(void *)(v34 + 16) = v32;
      }
      v33[2] = *(void *)(v32 + 16);
      *(void *)(*(void *)(v32 + 16) + 8 * (**(void **)(v32 + 16) != v32)) = v33;
      uint64_t *v33 = v32;
      *(void *)(v32 + 16) = v33;
      if (left == (void *)*v27) {
        left = v27;
      }
      v27 = *(void **)(*v27 + 8);
    }
    v35 = (void *)*v27;
    if (!*v27 || *((unsigned char *)v35 + 24))
    {
      v36 = (void *)v27[1];
      if (v36 && !*((unsigned char *)v36 + 24)) {
        goto LABEL_85;
      }
      *((unsigned char *)v27 + 24) = 0;
      v37 = (unsigned char *)v27[2];
      if (v37 == (unsigned char *)left)
      {
        v37 = left;
LABEL_79:
        v37[24] = 1;
        goto LABEL_99;
      }
      if (!v37[24]) {
        goto LABEL_79;
      }
      goto LABEL_76;
    }
    v36 = (void *)v27[1];
    if (v36 && !*((unsigned char *)v36 + 24))
    {
LABEL_85:
      v35 = v27;
    }
    else
    {
      *((unsigned char *)v35 + 24) = 1;
      *((unsigned char *)v27 + 24) = 0;
      uint64_t v42 = v35[1];
      void *v27 = v42;
      if (v42) {
        *(void *)(v42 + 16) = v27;
      }
      v35[2] = v27[2];
      *(void *)(v27[2] + 8 * (*(void *)v27[2] != (void)v27)) = v35;
      v35[1] = v27;
      v27[2] = v35;
      v36 = v27;
    }
    uint64_t v43 = v35[2];
    *((unsigned char *)v35 + 24) = *(unsigned char *)(v43 + 24);
    *(unsigned char *)(v43 + 24) = 1;
    *((unsigned char *)v36 + 24) = 1;
    v44 = *(uint64_t **)(v43 + 8);
    uint64_t v45 = *v44;
    *(void *)(v43 + 8) = *v44;
    if (v45) {
      *(void *)(v45 + 16) = v43;
    }
    v44[2] = *(void *)(v43 + 16);
    *(void *)(*(void *)(v43 + 16) + 8 * (**(void **)(v43 + 16) != v43)) = v44;
    uint64_t *v44 = v43;
LABEL_98:
    *(void *)(v43 + 16) = v44;
LABEL_99:

    operator delete(begin_node);
    unint64_t value = self->_entries.__tree_.__pair3_.__value_;
  }
  while (value + self->_pendingEntries.__tree_.__pair3_.__value_ > 0xF);
LABEL_100:

  return v9;
}

- (id)_addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5 entryIdentifier:(id)a6 primaryRecipientIdentifiers:(id)a7 secondaryRecipientIdentifiers:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc_init(TIMutableInputContextEntry);
  [(TIInputContextEntry *)v20 setText:v19];

  [(TIInputContextEntry *)v20 setSenderIdentifier:v17];
  [(TIInputContextEntry *)v20 setEntryIdentifier:v16];

  [(TIInputContextEntry *)v20 setTimestamp:v18];
  [(TIInputContextEntry *)v20 setPrimaryRecipientIdentifiers:v15];

  [(TIInputContextEntry *)v20 setSecondaryRecipientIdentifiers:v14];
  id v21 = [(TIInputContextHistory *)self _addEntry:v20];

  return v20;
}

- (void)addEntry:(id)a3
{
  id v3 = [(TIInputContextHistory *)self _addEntry:a3];
}

- (void)updateRecipientNames:(id)a3
{
  self->_recipientNames = (NSSet *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(TIInputContextHistory *)self recipientIdentifiers];
    uint64_t v7 = [v5 recipientIdentifiers];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      id v8 = (void *)v7;
      uint64_t v9 = [v5 recipientIdentifiers];
      if (!v9) {
        goto LABEL_71;
      }
      uint64_t v10 = (void *)v9;
      BOOL v11 = [(TIInputContextHistory *)self recipientIdentifiers];
      char v12 = [v5 recipientIdentifiers];
      int v13 = [v11 isEqualToSet:v12];

      if (!v13) {
        goto LABEL_72;
      }
    }
    if (self->_entries.__tree_.__pair3_.__value_ != v5[3]) {
      goto LABEL_72;
    }
    begin_node = (TIInputContextHistory *)self->_entries.__tree_.__begin_node_;
    if (begin_node != (TIInputContextHistory *)&self->_entries.__tree_.__pair1_)
    {
      id v16 = (void *)v5[1];
      do
      {
        id v17 = begin_node->_pendingEntries.__tree_.__begin_node_;
        uint64_t v18 = v16[4];
        if (v17) {
          BOOL v19 = v18 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          if (v18) {
            int v20 = -1;
          }
          else {
            int v20 = 0;
          }
          if (v17) {
            int v21 = 1;
          }
          else {
            int v21 = v20;
          }
          if (v21) {
            goto LABEL_72;
          }
        }
        else if (objc_msgSend(v17, "compare:"))
        {
          goto LABEL_72;
        }
        isa = (TIInputContextHistory *)begin_node->_entries.__tree_.__begin_node_;
        id v23 = (TIInputContextHistory **)begin_node;
        if (isa)
        {
          do
          {
            begin_node = isa;
            isa = (TIInputContextHistory *)isa->super.isa;
          }
          while (isa);
        }
        else
        {
          do
          {
            begin_node = v23[2];
            BOOL v19 = begin_node->super.isa == (Class)v23;
            id v23 = (TIInputContextHistory **)begin_node;
          }
          while (!v19);
        }
        long long v24 = (void *)v16[1];
        if (v24)
        {
          do
          {
            int v25 = v24;
            long long v24 = (void *)*v24;
          }
          while (v24);
        }
        else
        {
          do
          {
            int v25 = (void *)v16[2];
            BOOL v19 = *v25 == (void)v16;
            id v16 = v25;
          }
          while (!v19);
        }
        id v16 = v25;
      }
      while (begin_node != (TIInputContextHistory *)&self->_entries.__tree_.__pair1_);
    }
    if (self->_pendingEntries.__tree_.__pair3_.__value_ != v5[6]) {
      goto LABEL_72;
    }
    long long v26 = (TIInputContextHistory *)self->_pendingEntries.__tree_.__begin_node_;
    if (v26 != (TIInputContextHistory *)&self->_pendingEntries.__tree_.__pair1_)
    {
      v27 = (void *)v5[4];
      do
      {
        int v28 = v26->_pendingEntries.__tree_.__begin_node_;
        uint64_t v29 = v27[4];
        if (!v28 || v29 == 0)
        {
          int v31 = v29 ? -1 : 0;
          int v32 = v28 ? 1 : v31;
        }
        else
        {
          int v32 = objc_msgSend(v28, "compare:");
        }
        if (v32) {
          goto LABEL_72;
        }
        v33 = (TIInputContextHistory *)v26->_entries.__tree_.__begin_node_;
        uint64_t v34 = (TIInputContextHistory **)v26;
        if (v33)
        {
          do
          {
            long long v26 = v33;
            v33 = (TIInputContextHistory *)v33->super.isa;
          }
          while (v33);
        }
        else
        {
          do
          {
            long long v26 = v34[2];
            BOOL v19 = v26->super.isa == (Class)v34;
            uint64_t v34 = (TIInputContextHistory **)v26;
          }
          while (!v19);
        }
        v35 = (void *)v27[1];
        if (v35)
        {
          do
          {
            v36 = v35;
            v35 = (void *)*v35;
          }
          while (v35);
        }
        else
        {
          do
          {
            v36 = (void *)v27[2];
            BOOL v19 = *v36 == (void)v27;
            v27 = v36;
          }
          while (!v19);
        }
        v27 = v36;
      }
      while (v26 != (TIInputContextHistory *)&self->_pendingEntries.__tree_.__pair1_);
    }
    uint64_t v6 = [(TIInputContextHistory *)self firstPersonIdentifiers];
    uint64_t v37 = [v5 firstPersonIdentifiers];
    if (v6 == (void *)v37)
    {
    }
    else
    {
      id v8 = (void *)v37;
      uint64_t v38 = [v5 firstPersonIdentifiers];
      if (!v38) {
        goto LABEL_71;
      }
      v39 = (void *)v38;
      v40 = [(TIInputContextHistory *)self firstPersonIdentifiers];
      BOOL v41 = [v5 firstPersonIdentifiers];
      int v42 = [v40 isEqualToSet:v41];

      if (!v42) {
        goto LABEL_72;
      }
    }
    uint64_t v6 = [(TIInputContextHistory *)self recipientNames];
    uint64_t v43 = [v5 recipientNames];
    if (v6 == (void *)v43)
    {

LABEL_76:
      primaryRecipientIdentifiers = self->_primaryRecipientIdentifiers;
      if (primaryRecipientIdentifiers == (NSSet *)v5[9]
        || ([v5 primaryRecipientIdentifiers],
            v51 = objc_claimAutoreleasedReturnValue(),
            BOOL v52 = [(NSSet *)primaryRecipientIdentifiers isEqualToSet:v51],
            v51,
            v52))
      {
        infoDict = self->_infoDict;
        if (infoDict == (NSDictionary *)v5[17]
          || -[NSDictionary isEqualToDictionary:](infoDict, "isEqualToDictionary:"))
        {
          secondaryRecipientIdentifiers = self->_secondaryRecipientIdentifiers;
          if (secondaryRecipientIdentifiers == (NSSet *)v5[10]
            || ([v5 secondaryRecipientIdentifiers],
                v55 = objc_claimAutoreleasedReturnValue(),
                BOOL v56 = [(NSSet *)secondaryRecipientIdentifiers isEqualToSet:v55],
                v55,
                v56))
          {
            focusedEntryIdentifier = self->_focusedEntryIdentifier;
            if (focusedEntryIdentifier == (NSString *)v5[15]) {
              char v14 = 1;
            }
            else {
              char v14 = -[NSString isEqualToString:](focusedEntryIdentifier, "isEqualToString:");
            }
            goto LABEL_73;
          }
        }
      }
LABEL_72:
      char v14 = 0;
LABEL_73:

      goto LABEL_74;
    }
    id v8 = (void *)v43;
    uint64_t v44 = [v5 recipientNames];
    if (v44)
    {
      uint64_t v45 = (void *)v44;
      uint64_t v46 = [(TIInputContextHistory *)self recipientNames];
      uint64_t v47 = [v5 recipientNames];
      int v48 = [v46 isEqualToSet:v47];

      if (!v48) {
        goto LABEL_72;
      }
      goto LABEL_76;
    }
LABEL_71:

    goto LABEL_72;
  }
  char v14 = 0;
LABEL_74:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = (void *)[(NSSet *)self->_recipientIdentifiers copy];
  uint64_t v6 = (TIInputContextHistory *)[v4 initWithRecipientIdentifiers:v5 senderIdentifiers:self->_firstPersonIdentifiers];

  if (v6)
  {
    if (v6 != self)
    {
      std::__tree<NSHolder<TIInputContextEntry>>::__assign_multi<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v6->_entries, (void *)self->_entries.__tree_.__begin_node_, &self->_entries.__tree_.__pair1_.__value_.__left_);
      std::__tree<NSHolder<TIInputContextEntry>>::__assign_multi<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>((uint64_t)&v6->_pendingEntries, (void *)self->_pendingEntries.__tree_.__begin_node_, &self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
    }
    uint64_t v7 = [(NSSet *)self->_recipientNames copy];
    recipientNames = v6->_recipientNames;
    v6->_recipientNames = (NSSet *)v7;

    v6->_threadID = self->_threadID;
    objc_storeStrong((id *)&v6->_threadIdentifier, self->_threadIdentifier);
    objc_storeStrong((id *)&v6->_participantsIDtoNamesMap, self->_participantsIDtoNamesMap);
    objc_storeStrong((id *)&v6->_primaryRecipientIdentifiers, self->_primaryRecipientIdentifiers);
    objc_storeStrong((id *)&v6->_secondaryRecipientIdentifiers, self->_secondaryRecipientIdentifiers);
    objc_storeStrong((id *)&v6->_infoDict, self->_infoDict);
    objc_storeStrong((id *)&v6->_firstPersonIdentifiers, self->_firstPersonIdentifiers);
    objc_storeStrong((id *)&v6->_focusedEntryIdentifier, self->_focusedEntryIdentifier);
  }
  return v6;
}

- (TIInputContextHistory)initWithCoder:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)TIInputContextHistory;
  id v5 = [(TIInputContextHistory *)&v54 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    char v14 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    v5->_threadID = [v4 decodeIntegerForKey:@"threadID"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threadIdentifier"];
    threadIdentifier = v5->_threadIdentifier;
    v5->_threadIdentifier = (NSString *)v15;

    uint64_t v17 = [v4 decodeIntegerForKey:@"maxContextLength"];
    v5->_maxContextLength = v17;
    if (!v17) {
      v5->_maxContextLength = +[TIInputContextHistory maxEntryLength];
    }
    uint64_t v18 = [v4 decodeObjectOfClasses:v14 forKey:@"pendingEntries"];
    setFromArray<TIInputContextEntry>((uint64_t)&v51, v18);
    p_pair1 = &v5->_pendingEntries.__tree_.__pair1_;
    std::__tree<NSHolder<TIInputContextEntry>>::destroy((void *)v5->_pendingEntries.__tree_.__pair1_.__value_.__left_);
    int v20 = v52;
    v5->_pendingEntries.__tree_.__begin_node_ = v51;
    v5->_pendingEntries.__tree_.__pair1_.__value_.__left_ = v20;
    unint64_t v21 = v53;
    v5->_pendingEntries.__tree_.__pair3_.__value_ = v53;
    if (v21)
    {
      void v20[2] = p_pair1;
      v51 = &v52;
      BOOL v52 = 0;
      unint64_t v53 = 0;
      int v20 = 0;
    }
    else
    {
      v5->_pendingEntries.__tree_.__begin_node_ = p_pair1;
    }
    std::__tree<NSHolder<TIInputContextEntry>>::destroy(v20);

    uint64_t v22 = [v4 decodeObjectOfClasses:v14 forKey:@"entries"];
    setFromArray<TIInputContextEntry>((uint64_t)&v51, v22);
    id v23 = &v5->_entries.__tree_.__pair1_;
    std::__tree<NSHolder<TIInputContextEntry>>::destroy((void *)v5->_entries.__tree_.__pair1_.__value_.__left_);
    v5->_entries.__tree_.__begin_node_ = v51;
    long long v24 = v52;
    v5->_entries.__tree_.__pair1_.__value_.__left_ = v52;
    unint64_t v25 = v53;
    v5->_entries.__tree_.__pair3_.__value_ = v53;
    if (v25)
    {
      v24[2] = v23;
      v51 = &v52;
      BOOL v52 = 0;
      unint64_t v53 = 0;
      long long v24 = 0;
    }
    else
    {
      v5->_entries.__tree_.__begin_node_ = v23;
    }
    std::__tree<NSHolder<TIInputContextEntry>>::destroy(v24);

    uint64_t v26 = [v4 decodeObjectOfClasses:v8 forKey:@"firstPersonIdentifiers"];
    firstPersonIdentifiers = v5->_firstPersonIdentifiers;
    v5->_firstPersonIdentifiers = (NSSet *)v26;

    uint64_t v28 = [v4 decodeObjectOfClasses:v8 forKey:@"recipientNames"];
    recipientNames = v5->_recipientNames;
    v5->_recipientNames = (NSSet *)v28;

    uint64_t v30 = [v4 decodeObjectOfClasses:v8 forKey:@"primaryRecipientIdentifiers"];
    primaryRecipientIdentifiers = v5->_primaryRecipientIdentifiers;
    v5->_primaryRecipientIdentifiers = (NSSet *)v30;

    uint64_t v32 = [v4 decodeObjectOfClasses:v8 forKey:@"secondaryRecipientIdentifiers"];
    secondaryRecipientIdentifiers = v5->_secondaryRecipientIdentifiers;
    v5->_secondaryRecipientIdentifiers = (NSSet *)v32;

    if ([(NSSet *)v5->_primaryRecipientIdentifiers count]) {
      [(NSSet *)v5->_primaryRecipientIdentifiers setByAddingObjectsFromSet:v5->_secondaryRecipientIdentifiers];
    }
    else {
    uint64_t v34 = [v4 decodeObjectOfClasses:v8 forKey:@"recipientIdentifiers"];
    }
    recipientIdentifiers = v5->_recipientIdentifiers;
    v5->_recipientIdentifiers = (NSSet *)v34;

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v36, "setWithObjects:", v37, v38, objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"participantsIDtoNamesMap"];
    participantsIDtoNamesMap = v5->_participantsIDtoNamesMap;
    v5->_participantsIDtoNamesMap = (NSMutableDictionary *)v40;

    int v42 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    uint64_t v43 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    uint64_t v46 = [v4 decodeDictionaryWithKeysOfClasses:v42 objectsOfClasses:v45 forKey:@"infoDict"];
    infoDict = v5->_infoDict;
    v5->_infoDict = (NSDictionary *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"focusedEntryIdentifier"];
    focusedEntryIdentifier = v5->_focusedEntryIdentifier;
    v5->_focusedEntryIdentifier = (NSString *)v48;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  [v21 encodeInteger:self->_threadID forKey:@"threadID"];
  [v21 encodeObject:self->_threadIdentifier forKey:@"threadIdentifier"];
  [v21 encodeInteger:self->_maxContextLength forKey:@"maxContextLength"];
  if (self->_pendingEntries.__tree_.__pair3_.__value_)
  {
    id v4 = arrayFromSet<TIInputContextEntry>(&self->_pendingEntries.__tree_.__begin_node_);
    [v21 encodeObject:v4 forKey:@"pendingEntries"];
  }
  if (self->_entries.__tree_.__pair3_.__value_)
  {
    id v5 = arrayFromSet<TIInputContextEntry>(&self->_entries.__tree_.__begin_node_);
    [v21 encodeObject:v5 forKey:@"entries"];
  }
  if ([(NSSet *)self->_firstPersonIdentifiers count])
  {
    firstPersonIdentifiers = self->_firstPersonIdentifiers;
    uint64_t v7 = objc_opt_class();
    id v8 = TI_filteredSetWithClass(firstPersonIdentifiers, v7);
    [v21 encodeObject:v8 forKey:@"firstPersonIdentifiers"];
  }
  if ([(NSSet *)self->_primaryRecipientIdentifiers count])
  {
    primaryRecipientIdentifiers = self->_primaryRecipientIdentifiers;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = TI_filteredSetWithClass(primaryRecipientIdentifiers, v10);
    uint64_t v12 = @"primaryRecipientIdentifiers";
  }
  else
  {
    recipientIdentifiers = self->_recipientIdentifiers;
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = TI_filteredSetWithClass(recipientIdentifiers, v14);
    [v21 encodeObject:v15 forKey:@"recipientIdentifiers"];

    if (![(NSSet *)self->_recipientNames count]) {
      goto LABEL_12;
    }
    recipientNames = self->_recipientNames;
    uint64_t v17 = objc_opt_class();
    uint64_t v11 = TI_filteredSetWithClass(recipientNames, v17);
    uint64_t v12 = @"recipientNames";
  }
  [v21 encodeObject:v11 forKey:v12];

LABEL_12:
  if ([(NSSet *)self->_secondaryRecipientIdentifiers count])
  {
    secondaryRecipientIdentifiers = self->_secondaryRecipientIdentifiers;
    uint64_t v19 = objc_opt_class();
    int v20 = TI_filteredSetWithClass(secondaryRecipientIdentifiers, v19);
    [v21 encodeObject:v20 forKey:@"secondaryRecipientIdentifiers"];
  }
  if ([(NSDictionary *)self->_infoDict count]) {
    [v21 encodeObject:self->_infoDict forKey:@"infoDict"];
  }
  if ([(NSMutableDictionary *)self->_participantsIDtoNamesMap count]) {
    [v21 encodeObject:self->_participantsIDtoNamesMap forKey:@"participantsIDtoNamesMap"];
  }
  if ([(NSString *)self->_focusedEntryIdentifier length]) {
    [v21 encodeObject:self->_focusedEntryIdentifier forKey:@"focusedEntryIdentifier"];
  }

  MEMORY[0x1F41817F8]();
}

- (void)assertCheckpointForCoding
{
  begin_node = (TIInputContextHistory *)self->_pendingEntries.__tree_.__begin_node_;
  p_pair1 = &self->_pendingEntries.__tree_.__pair1_;
  if (begin_node != (TIInputContextHistory *)&self->_pendingEntries.__tree_.__pair1_)
  {
    do
    {
      id v5 = (uint64_t **)std::__tree<NSHolder<TIInputContextEntry>>::__find_equal<NSHolder<TIInputContextEntry>>((uint64_t)&self->_entries, &v11, &begin_node->_pendingEntries.__tree_.__begin_node_);
      if (!*v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = (uint64_t *)operator new(0x28uLL);
        v7[4] = (uint64_t)begin_node->_pendingEntries.__tree_.__begin_node_;
        std::__tree<NSHolder<TIInputContextEntry>>::__insert_node_at((uint64_t **)&self->_entries, v11, v6, v7);
      }
      isa = (TIInputContextHistory *)begin_node->_entries.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (TIInputContextHistory *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (TIInputContextHistory *)begin_node->_entries.__tree_.__pair1_.__value_.__left_;
          BOOL v10 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v10);
      }
      begin_node = left;
    }
    while (left != (TIInputContextHistory *)p_pair1);
  }
  std::__tree<NSHolder<TIInputContextEntry>>::destroy((void *)self->_pendingEntries.__tree_.__pair1_.__value_.__left_);
  self->_pendingEntries.__tree_.__pair1_.__value_.__left_ = 0;
  self->_pendingEntries.__tree_.__pair3_.__value_ = 0;
  self->_pendingEntries.__tree_.__begin_node_ = p_pair1;
}

- (TIInputContextHistory)initWithThreadIdentifier:(id)a3 participantsIDtoNamesMap:(id)a4 firstPersonIDs:(id)a5 primaryRecipients:(id)a6 secondaryRecipients:(id)a7 infoDict:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v28 = a5;
  id v27 = a6;
  id v17 = a7;
  id v18 = a8;
  v29.receiver = self;
  v29.super_class = (Class)TIInputContextHistory;
  uint64_t v19 = [(TIInputContextHistory *)&v29 init];
  if (v19)
  {
    v19->_threadID = objc_msgSend(v15, "integerValue", v27, v28);
    objc_storeStrong((id *)&v19->_threadIdentifier, a3);
    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v16];
    participantsIDtoNamesMap = v19->_participantsIDtoNamesMap;
    v19->_participantsIDtoNamesMap = (NSMutableDictionary *)v20;

    objc_storeStrong((id *)&v19->_primaryRecipientIdentifiers, a6);
    objc_storeStrong((id *)&v19->_secondaryRecipientIdentifiers, a7);
    uint64_t v22 = [(TIInputContextHistory *)v19 primaryRecipientIdentifiers];
    id v23 = [(TIInputContextHistory *)v19 secondaryRecipientIdentifiers];
    uint64_t v24 = [v22 setByAddingObjectsFromSet:v23];
    recipientIdentifiers = v19->_recipientIdentifiers;
    v19->_recipientIdentifiers = (NSSet *)v24;

    v19->_maxContextLength = +[TIInputContextHistory maxEntryLength];
    objc_storeStrong((id *)&v19->_firstPersonIdentifiers, a5);
    objc_storeStrong((id *)&v19->_infoDict, a8);
  }

  return v19;
}

- (TIInputContextHistory)initWithThreadID:(unint64_t)a3 participantsIDtoNamesMap:(id)a4 firstPersonIDs:(id)a5 primaryRecipients:(id)a6 secondaryRecipients:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)TIInputContextHistory;
  id v16 = [(TIInputContextHistory *)&v27 init];
  id v17 = v16;
  if (v16)
  {
    v16->_threadID = a3;
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
    threadIdentifier = v17->_threadIdentifier;
    v17->_threadIdentifier = (NSString *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v12];
    participantsIDtoNamesMap = v17->_participantsIDtoNamesMap;
    v17->_participantsIDtoNamesMap = (NSMutableDictionary *)v20;

    objc_storeStrong((id *)&v17->_primaryRecipientIdentifiers, a6);
    objc_storeStrong((id *)&v17->_secondaryRecipientIdentifiers, a7);
    uint64_t v22 = [(TIInputContextHistory *)v17 primaryRecipientIdentifiers];
    id v23 = [(TIInputContextHistory *)v17 secondaryRecipientIdentifiers];
    uint64_t v24 = [v22 setByAddingObjectsFromSet:v23];
    recipientIdentifiers = v17->_recipientIdentifiers;
    v17->_recipientIdentifiers = (NSSet *)v24;

    v17->_maxContextLength = +[TIInputContextHistory maxEntryLength];
    objc_storeStrong((id *)&v17->_firstPersonIdentifiers, a5);
  }

  return v17;
}

- (TIInputContextHistory)initWithRecipientIdentifiers:(id)a3
{
  return [(TIInputContextHistory *)self initWithRecipientIdentifiers:a3 senderIdentifiers:0];
}

- (TIInputContextHistory)initWithRecipientIdentifiers:(id)a3 senderIdentifier:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  id v8 = [v6 setWithObject:a4];
  uint64_t v9 = [(TIInputContextHistory *)self initWithRecipientIdentifiers:v7 senderIdentifiers:v8];

  return v9;
}

- (TIInputContextHistory)initWithRecipientIdentifiers:(id)a3 senderIdentifiers:(id)a4
{
  return [(TIInputContextHistory *)self initWithThreadIdentifier:0 participantsIDtoNamesMap:0 firstPersonIDs:a4 primaryRecipients:a3 secondaryRecipients:0 infoDict:0];
}

+ (BOOL)isMail
{
  if (+[TIInputContextHistory isMail]::onceToken != -1) {
    dispatch_once(&+[TIInputContextHistory isMail]::onceToken, &__block_literal_global_8672);
  }
  return +[TIInputContextHistory isMail]::isMail;
}

void __31__TIInputContextHistory_isMail__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  +[TIInputContextHistory isMail]::isMail = [v0 isEqualToString:@"com.apple.mobilemail"];
}

+ (unint64_t)maxEntryLength
{
  if (+[TIInputContextHistory isMail]) {
    return 0x2000;
  }
  else {
    return 1024;
  }
}

+ (BOOL)nameComponentsAreEmpty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 givenName];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [v4 givenName];
    int v8 = [v7 isEqualToString:&stru_1EDBDCE38];

    if (!v8) {
      goto LABEL_13;
    }
  }
  uint64_t v9 = [v4 middleName];
  if (v9)
  {
    BOOL v10 = (void *)v9;
    uint64_t v11 = [v4 middleName];
    int v12 = [v11 isEqualToString:&stru_1EDBDCE38];

    if (!v12) {
      goto LABEL_13;
    }
  }
  uint64_t v13 = [v4 familyName];
  if (v13)
  {
    id v14 = (void *)v13;
    id v15 = [v4 familyName];
    int v16 = [v15 isEqualToString:&stru_1EDBDCE38];

    if (!v16) {
      goto LABEL_13;
    }
  }
  uint64_t v17 = [v4 nameSuffix];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [v4 nameSuffix];
    int v20 = [v19 isEqualToString:&stru_1EDBDCE38];

    if (!v20) {
      goto LABEL_13;
    }
  }
  uint64_t v21 = [v4 nickname];
  if (!v21) {
    goto LABEL_11;
  }
  uint64_t v22 = (void *)v21;
  id v23 = [v4 nickname];
  int v24 = [v23 isEqualToString:&stru_1EDBDCE38];

  if (!v24)
  {
LABEL_13:
    char v27 = 0;
  }
  else
  {
LABEL_11:
    unint64_t v25 = [v4 phoneticRepresentation];
    if (v25)
    {
      uint64_t v26 = [v4 phoneticRepresentation];
      char v27 = [a1 nameComponentsAreEmpty:v26];
    }
    else
    {
      char v27 = 1;
    }
  }
  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end