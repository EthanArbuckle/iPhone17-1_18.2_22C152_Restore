@interface UIInputContextHistory
- (BOOL)isEqual:(id)a3;
- (NSSet)recipientIdentifiers;
- (NSSet)recipientNames;
- (NSSet)senderIdentifiers;
- (NSString)senderIdentifier;
- (TIInputContextHistory)tiInputContextHistory;
- (UIInputContextHistory)initWithInputContextHistory:(id)a3;
- (UIInputContextHistory)initWithRecipientIdentifiers:(id)a3;
- (UIInputContextHistory)initWithRecipientIdentifiers:(id)a3 senderIdentifier:(id)a4;
- (UIInputContextHistory)initWithRecipientIdentifiers:(id)a3 senderIdentifiers:(id)a4;
- (UIInputContextHistory)initWithThreadID:(unint64_t)a3 participantsIDtoNamesMap:(id)a4 firstPersonIDs:(id)a5 primaryRecipients:(id)a6 secondaryRecipients:(id)a7 infoDict:(id)a8;
- (UIInputContextHistory)initWithThreadIdentifier:(id)a3 participantsIDtoNames:(id)a4 firstPerson:(id)a5 primaryRecipients:(id)a6 secondaryRecipients:(id)a7 info:(id)a8;
- (id)mostRecentTextEntries:(unint64_t)a3;
- (void)addEntry:(id)a3;
- (void)addNewParticipantWithIdentifier:(id)a3 name:(id)a4;
- (void)addTextEntry:(id)a3 timestamp:(id)a4;
- (void)addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5;
- (void)addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5 entryIdentifier:(id)a6;
- (void)updateRecipientNames:(id)a3;
@end

@implementation UIInputContextHistory

- (UIInputContextHistory)initWithRecipientIdentifiers:(id)a3 senderIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIInputContextHistory;
  v8 = [(UIInputContextHistory *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FAE2D0]) initWithRecipientIdentifiers:v6 senderIdentifiers:v7];
    tiInputContextHistory = v8->_tiInputContextHistory;
    v8->_tiInputContextHistory = (TIInputContextHistory *)v9;
  }
  return v8;
}

- (UIInputContextHistory)initWithRecipientIdentifiers:(id)a3
{
  return [(UIInputContextHistory *)self initWithRecipientIdentifiers:a3 senderIdentifier:0];
}

- (UIInputContextHistory)initWithInputContextHistory:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIInputContextHistory;
    id v6 = [(UIInputContextHistory *)&v9 init];
    id v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_tiInputContextHistory, a3);
    }
  }
  else
  {

    id v7 = 0;
  }

  return v7;
}

- (UIInputContextHistory)initWithThreadID:(unint64_t)a3 participantsIDtoNamesMap:(id)a4 firstPersonIDs:(id)a5 primaryRecipients:(id)a6 secondaryRecipients:(id)a7 infoDict:(id)a8
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v54.receiver = self;
  v54.super_class = (Class)UIInputContextHistory;
  v19 = [(UIInputContextHistory *)&v54 init];
  if (v19)
  {
    if ([MEMORY[0x1E4FAE2D0] instancesRespondToSelector:sel_threadIdentifier])
    {
      id v20 = objc_alloc(MEMORY[0x1E4FAE2D0]);
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
      uint64_t v22 = [v20 initWithThreadIdentifier:v21 participantsIDtoNamesMap:v14 firstPersonIDs:v15 primaryRecipients:v16 secondaryRecipients:v17 infoDict:v18];
      tiInputContextHistory = v19->_tiInputContextHistory;
      v19->_tiInputContextHistory = (TIInputContextHistory *)v22;
    }
    else if ([MEMORY[0x1E4FAE2D0] instancesRespondToSelector:sel_firstPersonIdentifiers])
    {
      uint64_t v24 = [objc_alloc(MEMORY[0x1E4FAE2D0]) initWithThreadID:a3 participantsIDtoNamesMap:v14 firstPersonIDs:v15 primaryRecipients:v16 secondaryRecipients:v17];
      v25 = v19->_tiInputContextHistory;
      v19->_tiInputContextHistory = (TIInputContextHistory *)v24;

      [(TIInputContextHistory *)v19->_tiInputContextHistory setInfoDict:v18];
    }
    else
    {
      int v26 = [MEMORY[0x1E4FAE2D0] instancesRespondToSelector:sel_participantsMap];
      id v27 = objc_alloc(MEMORY[0x1E4FAE2D0]);
      if (v26)
      {
        id v48 = v14;
        id v46 = v16;
        id v44 = v17;
        uint64_t v28 = [v27 initWithThreadID:a3 participantsIDtoNamesMap:v14 primaryRecipients:v16 secondaryRecipients:v17];
        v29 = v19->_tiInputContextHistory;
        v45 = v19;
        v19->_tiInputContextHistory = (TIInputContextHistory *)v28;

        id v43 = v18;
        v30 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v18];
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v47 = v15;
        id obj = v15;
        uint64_t v31 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = 0;
          uint64_t v34 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v51 != v34) {
                objc_enumerationMutation(obj);
              }
              uint64_t v36 = *(void *)(*((void *)&v50 + 1) + 8 * i);
              v37 = NSString;
              v38 = [NSNumber numberWithInt:v33 + i];
              v39 = [v37 stringWithFormat:@"firstPerson-%@", v38];

              [v30 setObject:v36 forKeyedSubscript:v39];
            }
            uint64_t v32 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
            uint64_t v33 = (v33 + i);
          }
          while (v32);
        }

        v19 = v45;
        [(TIInputContextHistory *)v45->_tiInputContextHistory setInfoDict:v30];

        id v15 = v47;
        id v14 = v48;
        id v16 = v46;
        id v18 = v43;
        id v17 = v44;
      }
      else
      {
        uint64_t v40 = [v27 initWithRecipientIdentifiers:v16 senderIdentifiers:v15];
        v41 = v19->_tiInputContextHistory;
        v19->_tiInputContextHistory = (TIInputContextHistory *)v40;
      }
    }
  }

  return v19;
}

- (UIInputContextHistory)initWithThreadIdentifier:(id)a3 participantsIDtoNames:(id)a4 firstPerson:(id)a5 primaryRecipients:(id)a6 secondaryRecipients:(id)a7 info:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if ([MEMORY[0x1E4FAE2D0] instancesRespondToSelector:sel_initWithThreadIdentifier_participantsIDtoNamesMap_firstPersonIDs_primaryRecipients_secondaryRecipients_infoDict_])
  {
    v25.receiver = self;
    v25.super_class = (Class)UIInputContextHistory;
    id v20 = [(UIInputContextHistory *)&v25 init];
    if (v20)
    {
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4FAE2D0]) initWithThreadIdentifier:v14 participantsIDtoNamesMap:v15 firstPersonIDs:v16 primaryRecipients:v17 secondaryRecipients:v18 infoDict:v19];
      tiInputContextHistory = v20->_tiInputContextHistory;
      v20->_tiInputContextHistory = (TIInputContextHistory *)v21;
    }
    self = v20;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)addNewParticipantWithIdentifier:(id)a3 name:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4FAE2D0] instancesRespondToSelector:sel_addNewParticipantWithIdentifier_name_])
  {
    id v7 = [(UIInputContextHistory *)self tiInputContextHistory];
    [v7 addNewParticipantWithIdentifier:v8 name:v6];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(UIInputContextHistory *)self tiInputContextHistory];
    id v7 = [v6 recipientIdentifiers];
    id v8 = [v5 tiInputContextHistory];

    objc_super v9 = [v8 recipientIdentifiers];
    char v10 = [v7 isEqualToSet:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSSet)recipientIdentifiers
{
  return (NSSet *)[(TIInputContextHistory *)self->_tiInputContextHistory recipientIdentifiers];
}

- (NSSet)senderIdentifiers
{
  return (NSSet *)[(TIInputContextHistory *)self->_tiInputContextHistory senderIdentifiers];
}

- (NSSet)recipientNames
{
  return (NSSet *)[(TIInputContextHistory *)self->_tiInputContextHistory recipientNames];
}

- (void)addEntry:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(TIInputContextHistory *)self->_tiInputContextHistory addEntry:v4];
  }
}

- (void)addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5 entryIdentifier:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (objc_opt_respondsToSelector()) {
    [(TIInputContextHistory *)self->_tiInputContextHistory addTextEntry:v13 timestamp:v10 senderIdentifier:v11 entryIdentifier:v12];
  }
}

- (void)updateRecipientNames:(id)a3
{
}

- (NSString)senderIdentifier
{
  v2 = [(UIInputContextHistory *)self senderIdentifiers];
  v3 = [v2 anyObject];

  return (NSString *)v3;
}

- (UIInputContextHistory)initWithRecipientIdentifiers:(id)a3 senderIdentifier:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  id v8 = [v6 setWithObject:a4];
  objc_super v9 = [(UIInputContextHistory *)self initWithRecipientIdentifiers:v7 senderIdentifiers:v8];

  return v9;
}

- (void)addTextEntry:(id)a3 timestamp:(id)a4
{
}

- (void)addTextEntry:(id)a3 timestamp:(id)a4 senderIdentifier:(id)a5
{
}

- (id)mostRecentTextEntries:(unint64_t)a3
{
  id v4 = [(UIInputContextHistory *)self tiInputContextHistory];
  id v5 = [v4 mostRecentTextEntries:a3];

  return v5;
}

- (TIInputContextHistory)tiInputContextHistory
{
  return self->_tiInputContextHistory;
}

- (void).cxx_destruct
{
}

@end