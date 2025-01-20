@interface ICTTTextEditGrouper
- (BOOL)includesCheckmarkEdits;
- (BOOL)includesTableEdits;
- (BOOL)joinsTextGaps;
- (BOOL)joinsWhitespaceAndNewlineGaps;
- (BOOL)trustsTimestampsFromReplicaID:(id)a3;
- (ICNote)note;
- (ICTTTextEditFilter)filter;
- (ICTTTextEditGrouper)initWithNote:(id)a3;
- (NSMutableDictionary)checkmarkReplicaIDForUserID;
- (NSMutableDictionary)trustsTimestampsFromReplicaID;
- (NSMutableDictionary)userIDForReplicaID;
- (_NSRange)rangeForEdits:(id)a3;
- (id)editGroupForEdits:(id)a3 userID:(id)a4 inAttributedString:(id)a5;
- (id)editsByAddingAllowedAttachmentEditsToEdit:(id)a3 inAttributedString:(id)a4;
- (id)editsByAddingCheckmarkEditsToEdit:(id)a3 inAttributedString:(id)a4;
- (id)editsByAddingTableEditsToEdit:(id)a3 inAttributedString:(id)a4;
- (id)filteredEditForEdit:(id)a3 inAttributedString:(id)a4;
- (id)groupedEdits;
- (id)groupedEditsForEdits:(id)a3 inAttributedString:(id)a4;
- (id)latestTimestampForEdits:(id)a3;
- (id)userIDForReplicaID:(id)a3;
- (void)setFilter:(id)a3;
- (void)setIncludesCheckmarkEdits:(BOOL)a3;
- (void)setIncludesTableEdits:(BOOL)a3;
- (void)setJoinsTextGaps:(BOOL)a3;
- (void)setJoinsWhitespaceAndNewlineGaps:(BOOL)a3;
@end

@implementation ICTTTextEditGrouper

- (id)groupedEditsForEdits:(id)a3 inAttributedString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v46 = [MEMORY[0x1E4F1CA48] array];
  if ([(ICTTTextEditGrouper *)self includesTableEdits])
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __63__ICTTTextEditGrouper_groupedEditsForEdits_inAttributedString___block_invoke;
    v54[3] = &unk_1E64A7A78;
    v54[4] = self;
    id v55 = v7;
    uint64_t v8 = objc_msgSend(v6, "ic_flatMap:", v54);

    id v6 = (id)v8;
  }
  v49 = v7;
  if ([(ICTTTextEditGrouper *)self includesCheckmarkEdits])
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __63__ICTTTextEditGrouper_groupedEditsForEdits_inAttributedString___block_invoke_2;
    v52[3] = &unk_1E64A7A78;
    v52[4] = self;
    id v53 = v7;
    uint64_t v9 = objc_msgSend(v6, "ic_flatMap:", v52);

    id v6 = (id)v9;
  }
  v10 = [(ICTTTextEditGrouper *)self filter];
  v11 = [v10 allowedAttachmentIDs];

  if (v11)
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __63__ICTTTextEditGrouper_groupedEditsForEdits_inAttributedString___block_invoke_3;
    v50[3] = &unk_1E64A7A78;
    v50[4] = self;
    v12 = v49;
    id v51 = v49;
    uint64_t v13 = objc_msgSend(v6, "ic_flatMap:", v50);

    id v6 = (id)v13;
  }
  else
  {
    v12 = v49;
  }
  v47 = [MEMORY[0x1E4F1CA48] array];
  v14 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unknown");
  v48 = [v14 UUIDString];

  if ([v6 count])
  {
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    do
    {
      v17 = [v6 objectAtIndexedSubscript:v16];
      if (++v16 >= [v6 count])
      {
        v18 = 0;
      }
      else
      {
        v18 = [v6 objectAtIndexedSubscript:v16];
      }
      v19 = [v12 string];
      uint64_t v20 = [v17 range];
      uint64_t v22 = v21;
      v23 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      int v24 = objc_msgSend(v19, "ic_range:onlyContainsCharacterSet:", v20, v22, v23);

      if ([(ICTTTextEditGrouper *)self joinsWhitespaceAndNewlineGaps] && v24)
      {
        uint64_t v25 = [v17 range];
        unint64_t v15 = v25 + v26;
        v12 = v49;
      }
      else
      {
        v27 = [v17 replicaID];
        v28 = [(ICTTTextEditGrouper *)self userIDForReplicaID:v27];

        int v29 = [v28 isEqual:v48];
        BOOL v30 = !-[ICTTTextEditGrouper joinsTextGaps](self, "joinsTextGaps") && v15 < [v17 range];
        uint64_t v31 = [v17 range];
        uint64_t v33 = v32;
        BOOL v36 = v31 == [v18 range] && v33 == v34;
        if (!v29 || v30 || v36)
        {
          v37 = v47;
          v12 = v49;
          if ([v47 count])
          {
            v38 = [(ICTTTextEditGrouper *)self editGroupForEdits:v47 userID:v48 inAttributedString:v49];
            [v46 addObject:v38];
          }
          [v47 removeAllObjects];
          id v39 = v28;

          v48 = v39;
        }
        else
        {
          v12 = v49;
          v37 = v47;
        }
        v40 = [(ICTTTextEditGrouper *)self filteredEditForEdit:v17 inAttributedString:v12];
        objc_msgSend(v37, "ic_addNonNilObject:", v40);
        uint64_t v41 = [v40 range];
        unint64_t v15 = v41 + v42;
      }
    }
    while (v16 < [v6 count]);
  }
  if ([v47 count])
  {
    v43 = [(ICTTTextEditGrouper *)self editGroupForEdits:v47 userID:v48 inAttributedString:v12];
    [v46 addObject:v43];
  }
  v44 = (void *)[v46 copy];

  return v44;
}

- (BOOL)joinsWhitespaceAndNewlineGaps
{
  return self->_joinsWhitespaceAndNewlineGaps;
}

- (BOOL)joinsTextGaps
{
  return self->_joinsTextGaps;
}

- (id)filteredEditForEdit:(id)a3 inAttributedString:(id)a4
{
  id v5 = a3;
  id v6 = [v5 replicaID];
  id v7 = [(ICTTTextEditGrouper *)self userIDForReplicaID:v6];

  uint64_t v8 = [(ICTTTextEditGrouper *)self filter];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    v10 = [(ICTTTextEditGrouper *)self filter];
    if ([v10 allowsMissingUsers])
    {
    }
    else
    {
      v11 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unknown");
      v12 = [v11 UUIDString];
      char v13 = [v7 isEqual:v12];

      if (v13)
      {
LABEL_7:
        uint64_t v20 = 0;
        goto LABEL_25;
      }
    }
  }
  v14 = [(ICTTTextEditGrouper *)self filter];
  uint64_t v15 = [v14 allowedUserIDs];
  if (v15)
  {
    unint64_t v16 = (void *)v15;
    v17 = [(ICTTTextEditGrouper *)self filter];
    v18 = [v17 allowedUserIDs];
    int v19 = [v18 containsObject:v7];

    if (!v19) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  uint64_t v21 = [v5 replicaID];
  if (![(ICTTTextEditGrouper *)self trustsTimestampsFromReplicaID:v21])
  {

    goto LABEL_15;
  }
  uint64_t v22 = [v5 timestamp];

  if (!v22)
  {
LABEL_15:
    uint64_t v22 = [(ICTTTextEditGrouper *)self filter];
    if (v22)
    {
      int v29 = [(ICTTTextEditGrouper *)self filter];
      int v30 = [v29 allowsMissingTimestamps];

      uint64_t v22 = 0;
      uint64_t v20 = 0;
      if (!v30) {
        goto LABEL_24;
      }
    }
    goto LABEL_23;
  }
  v23 = [(ICTTTextEditGrouper *)self filter];
  uint64_t v24 = [v23 fromDate];
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    uint64_t v26 = [(ICTTTextEditGrouper *)self filter];
    v27 = [v26 fromDate];
    char v28 = objc_msgSend(v22, "ic_isEarlierThanDate:", v27);

    if (v28) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v31 = [(ICTTTextEditGrouper *)self filter];
  uint64_t v32 = [v31 toDate];
  if (!v32)
  {

    goto LABEL_23;
  }
  uint64_t v33 = (void *)v32;
  uint64_t v34 = [(ICTTTextEditGrouper *)self filter];
  v35 = [v34 toDate];
  char v36 = objc_msgSend(v22, "ic_isLaterThanDate:", v35);

  if ((v36 & 1) == 0)
  {
LABEL_23:
    v37 = [ICTTTextEdit alloc];
    v38 = [v5 replicaID];
    uint64_t v39 = [v5 range];
    uint64_t v20 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v37, "initWithTimestamp:replicaID:range:", v22, v38, v39, v40);

    goto LABEL_24;
  }
LABEL_21:
  uint64_t v20 = 0;
LABEL_24:

LABEL_25:
  return v20;
}

- (ICTTTextEditFilter)filter
{
  return self->_filter;
}

- (id)userIDForReplicaID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTTTextEditGrouper *)self userIDForReplicaID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v7 = [(ICTTTextEditGrouper *)self note];
    id v6 = [v7 userIDForReplicaID:v4];

    uint64_t v8 = [(ICTTTextEditGrouper *)self userIDForReplicaID];
    [v8 setObject:v6 forKeyedSubscript:v4];
  }
  return v6;
}

- (NSMutableDictionary)userIDForReplicaID
{
  return self->_userIDForReplicaID;
}

- (BOOL)trustsTimestampsFromReplicaID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTTTextEditGrouper *)self trustsTimestampsFromReplicaID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v7 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v8 = [(ICTTTextEditGrouper *)self note];
    id v6 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "trustsTimestampsFromReplicaID:", v4));

    uint64_t v9 = [(ICTTTextEditGrouper *)self trustsTimestampsFromReplicaID];
    [v9 setObject:v6 forKeyedSubscript:v4];
  }
  char v10 = [v6 BOOLValue];

  return v10;
}

- (NSMutableDictionary)trustsTimestampsFromReplicaID
{
  return self->_trustsTimestampsFromReplicaID;
}

- (ICNote)note
{
  return self->_note;
}

- (BOOL)includesTableEdits
{
  return self->_includesTableEdits;
}

- (BOOL)includesCheckmarkEdits
{
  return self->_includesCheckmarkEdits;
}

- (void)setJoinsWhitespaceAndNewlineGaps:(BOOL)a3
{
  self->_joinsWhitespaceAndNewlineGaps = a3;
}

- (void)setFilter:(id)a3
{
}

- (id)editGroupForEdits:(id)a3 userID:(id)a4 inAttributedString:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(ICTTTextEditGrouper *)self latestTimestampForEdits:v8];
  uint64_t v10 = [(ICTTTextEditGrouper *)self rangeForEdits:v8];
  uint64_t v12 = v11;
  char v13 = [ICTTTextEditGroup alloc];
  v14 = (void *)[v8 copy];

  uint64_t v15 = -[ICTTTextEditGroup initWithEdits:latestTimestamp:userID:range:](v13, "initWithEdits:latestTimestamp:userID:range:", v14, v9, v7, v10, v12);
  return v15;
}

- (_NSRange)rangeForEdits:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    NSUInteger v6 = 0;
    uint64_t v7 = *(void *)v17;
    NSUInteger v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t location = [*(id *)(*((void *)&v16 + 1) + 8 * i) range];
        v12.uint64_t location = location;
        v12.NSUInteger length = length;
        if (v6)
        {
          v22.uint64_t location = v8;
          v22.NSUInteger length = v6;
          NSRange v13 = NSUnionRange(v22, v12);
          NSUInteger length = v13.length;
          uint64_t location = v13.location;
        }
        NSUInteger v8 = location;
        NSUInteger v6 = length;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    NSUInteger v6 = 0;
    NSUInteger v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v14 = v8;
  NSUInteger v15 = v6;
  result.NSUInteger length = v15;
  result.uint64_t location = v14;
  return result;
}

- (id)latestTimestampForEdits:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v4)
  {
    NSUInteger v6 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = v4;
  NSUInteger v6 = 0;
  uint64_t v7 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      uint64_t v10 = [v9 timestamp];
      if (v10)
      {
        uint64_t v11 = v10;
        if (!v6)
        {

LABEL_11:
          uint64_t v15 = [v9 timestamp];

          NSUInteger v6 = (void *)v15;
          continue;
        }
        NSRange v12 = [v9 timestamp];
        [v12 timeIntervalSinceDate:v6];
        double v14 = v13;

        if (v14 > 0.0) {
          goto LABEL_11;
        }
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v5);
LABEL_16:

  return v6;
}

- (ICTTTextEditGrouper)initWithNote:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICTTTextEditGrouper;
  NSUInteger v6 = [(ICTTTextEditGrouper *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_note, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    userIDForReplicaID = v7->_userIDForReplicaID;
    v7->_userIDForReplicaID = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    trustsTimestampsFromReplicaID = v7->_trustsTimestampsFromReplicaID;
    v7->_trustsTimestampsFromReplicaID = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    checkmarkReplicaIDForUserID = v7->_checkmarkReplicaIDForUserID;
    v7->_checkmarkReplicaIDForUserID = (NSMutableDictionary *)v12;
  }
  return v7;
}

uint64_t __63__ICTTTextEditGrouper_groupedEditsForEdits_inAttributedString___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) editsByAddingTableEditsToEdit:a2 inAttributedString:*(void *)(a1 + 40)];
}

uint64_t __63__ICTTTextEditGrouper_groupedEditsForEdits_inAttributedString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) editsByAddingCheckmarkEditsToEdit:a2 inAttributedString:*(void *)(a1 + 40)];
}

uint64_t __63__ICTTTextEditGrouper_groupedEditsForEdits_inAttributedString___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) editsByAddingAllowedAttachmentEditsToEdit:a2 inAttributedString:*(void *)(a1 + 40)];
}

- (id)groupedEdits
{
  id v3 = [(ICTTTextEditGrouper *)self note];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_5;
  }
  uint64_t v4 = [(ICTTTextEditGrouper *)self note];
  id v5 = [v4 uiAttributedString];

  if (v5)
  {
    id v3 = [(ICTTTextEditGrouper *)self note];
    NSUInteger v6 = [v3 uiAttributedString];
    uint64_t v7 = [v6 edits];
    uint64_t v8 = [(ICTTTextEditGrouper *)self note];
    uint64_t v9 = [v8 uiAttributedString];
    uint64_t v10 = [(ICTTTextEditGrouper *)self groupedEditsForEdits:v7 inAttributedString:v9];

LABEL_5:
    goto LABEL_7;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:
  return v10;
}

- (id)editsByAddingCheckmarkEditsToEdit:(id)a3 inAttributedString:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a4;
  uint64_t v9 = [v7 array];
  uint64_t v10 = ICTTAttributeNameParagraphStyle;
  uint64_t v11 = [v6 range];
  uint64_t v13 = v12;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__ICTTTextEditGrouper_editsByAddingCheckmarkEditsToEdit_inAttributedString___block_invoke;
  v18[3] = &unk_1E64A7AA0;
  id v19 = v6;
  id v20 = v9;
  uint64_t v21 = self;
  id v14 = v9;
  id v15 = v6;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v10, v11, v13, 0, v18);

  long long v16 = (void *)[v14 copy];
  return v16;
}

void __76__ICTTTextEditGrouper_editsByAddingCheckmarkEditsToEdit_inAttributedString___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v32 = a2;
  uint64_t v7 = [ICTTTextEdit alloc];
  id v8 = [a1[4] timestamp];
  uint64_t v9 = [a1[4] replicaID];
  uint64_t v10 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v7, "initWithTimestamp:replicaID:range:", v8, v9, a3, a4);

  [a1[5] addObject:v10];
  uint64_t v11 = [v32 todo];

  if (v11)
  {
    uint64_t v12 = [a1[6] note];
    uint64_t v13 = [v32 todo];
    id v14 = [v13 uuid];
    id v15 = [v14 UUIDString];
    long long v16 = [v12 userIDForChecklistItemWithIdentifier:v15];

    if (v16)
    {
      long long v17 = [a1[6] checkmarkReplicaIDForUserID];
      long long v18 = [v17 objectForKeyedSubscript:v16];
      id v19 = v18;
      uint64_t v31 = a4;
      if (v18)
      {
        id v20 = v18;
      }
      else
      {
        id v20 = [MEMORY[0x1E4F29128] UUID];
      }
      uint64_t v21 = v20;

      uint64_t v22 = [a1[6] userIDForReplicaID];
      [v22 setObject:v16 forKeyedSubscript:v21];

      v23 = [a1[6] trustsTimestampsFromReplicaID];
      [v23 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v21];

      uint64_t v24 = [a1[6] checkmarkReplicaIDForUserID];
      [v24 setObject:v21 forKeyedSubscript:v16];

      uint64_t v25 = [a1[6] note];
      uint64_t v26 = [v32 todo];
      v27 = [v26 uuid];
      char v28 = [v27 UUIDString];
      int v29 = [v25 timestampForChecklistItemWithIdentifier:v28];

      int v30 = -[ICTTTextEdit initWithTimestamp:replicaID:range:]([ICTTTextEdit alloc], "initWithTimestamp:replicaID:range:", v29, v21, a3, v31);
      [a1[5] addObject:v30];
    }
  }
}

- (id)editsByAddingTableEditsToEdit:(id)a3 inAttributedString:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a4;
  uint64_t v9 = [v7 array];
  uint64_t v10 = [v6 range];
  uint64_t v12 = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke;
  v17[3] = &unk_1E64A7B80;
  id v18 = v6;
  id v19 = self;
  id v20 = v9;
  id v13 = v9;
  id v14 = v6;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", v10, v12, 0, v17);

  id v15 = (void *)[v13 copy];
  return v15;
}

void __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__39;
  uint64_t v41 = __Block_byref_object_dispose__39;
  id v8 = [ICTTTextEdit alloc];
  uint64_t v9 = [a1[4] timestamp];
  uint64_t v10 = [a1[4] replicaID];
  uint64_t v42 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v8, "initWithTimestamp:replicaID:range:", v9, v10, a3, a4);

  id v11 = a1[5];
  uint64_t v12 = [(id)v38[5] replicaID];
  id v13 = [v11 userIDForReplicaID:v12];

  if (objc_opt_respondsToSelector())
  {
    id v14 = [a1[5] note];
    id v15 = [v14 managedObjectContext];
    long long v16 = [v7 attachmentInContext:v15];
  }
  else
  {
    long long v16 = 0;
  }
  objc_opt_class();
  long long v17 = [v16 attachmentModel];
  id v18 = ICDynamicCast();
  id v19 = [v18 table];

  id v20 = [MEMORY[0x1E4F1CA60] dictionary];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_23;
  v29[3] = &unk_1E64A7B18;
  id v21 = v19;
  id v22 = a1[5];
  id v30 = v21;
  id v31 = v22;
  id v23 = v13;
  id v32 = v23;
  uint64_t v34 = &v37;
  uint64_t v35 = a3;
  uint64_t v36 = a4;
  id v24 = v20;
  id v33 = v24;
  [v21 enumerateColumnsWithBlock:v29];
  uint64_t v25 = [v24 allValues];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_4;
  v28[3] = &__block_descriptor_48_e36___ICTTTextEdit_16__0__ICTTTextEdit_8l;
  v28[4] = a3;
  v28[5] = a4;
  uint64_t v26 = objc_msgSend(v25, "ic_map:", v28);

  v27 = [v26 sortedArrayUsingComparator:&__block_literal_global_50];

  [a1[6] addObject:v38[5]];
  [a1[6] addObjectsFromArray:v27];

  _Block_object_dispose(&v37, 8);
}

void __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_2;
  v9[3] = &unk_1E64A7AF0;
  id v10 = v4;
  id v11 = v3;
  id v5 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = v5;
  long long v15 = *(_OWORD *)(a1 + 72);
  long long v8 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v8;
  long long v14 = v8;
  id v7 = v3;
  [v10 enumerateRowsWithBlock:v9];
}

void __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) mergeableStringForColumnID:*(void *)(a1 + 40) rowID:a2];
  uint64_t v4 = [v3 attributedString];
  uint64_t v5 = objc_msgSend(v4, "ic_range");
  uint64_t v7 = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_3;
  v12[3] = &unk_1E64A7AC8;
  long long v8 = *(void **)(a1 + 56);
  v12[4] = *(void *)(a1 + 48);
  id v13 = v3;
  id v14 = v8;
  long long v11 = *(_OWORD *)(a1 + 64);
  long long v16 = *(_OWORD *)(a1 + 80);
  id v9 = (id)v11;
  long long v15 = v11;
  id v10 = v3;
  objc_msgSend(v10, "enumerateEditsInRange:usingBlock:", v5, v7, v12);
}

void __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_3(uint64_t a1, void *a2)
{
  id v27 = a2;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) attributedString];
  uint64_t v5 = [v3 filteredEditForEdit:v27 inAttributedString:v4];

  if (v5)
  {
    if ([*(id *)(a1 + 32) joinsWhitespaceAndNewlineGaps]) {
      goto LABEL_4;
    }
    uint64_t v6 = [*(id *)(a1 + 40) attributedString];
    uint64_t v7 = [v6 string];
    uint64_t v8 = [v5 range];
    id v10 = objc_msgSend(v7, "substringWithRange:", v8, v9);
    long long v11 = objc_msgSend(v10, "ic_trimmedString");
    uint64_t v12 = [v11 length];

    if (v12)
    {
LABEL_4:
      id v13 = *(void **)(a1 + 32);
      id v14 = [v5 replicaID];
      long long v15 = [v13 userIDForReplicaID:v14];

      if ([v15 isEqual:*(void *)(a1 + 48)])
      {
        long long v16 = [ICTTTextEdit alloc];
        long long v17 = [v27 timestamp];
        id v18 = [v27 replicaID];
        uint64_t v19 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v16, "initWithTimestamp:replicaID:range:", v17, v18, *(void *)(a1 + 72), *(void *)(a1 + 80));
        uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
        id v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;
      }
      else
      {
        long long v17 = [*(id *)(a1 + 56) objectForKeyedSubscript:v15];
        uint64_t v22 = [v17 timestamp];
        if (!v22) {
          goto LABEL_8;
        }
        id v23 = (void *)v22;
        id v24 = [v5 timestamp];
        uint64_t v25 = [v17 timestamp];
        int v26 = objc_msgSend(v24, "ic_isLaterThanDate:", v25);

        if (v26) {
LABEL_8:
        }
          [*(id *)(a1 + 56) setObject:v5 forKeyedSubscript:v15];
      }
    }
  }
}

ICTTTextEdit *__72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [ICTTTextEdit alloc];
  uint64_t v5 = [v3 timestamp];
  uint64_t v6 = [v3 replicaID];

  uint64_t v7 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v4, "initWithTimestamp:replicaID:range:", v5, v6, *(void *)(a1 + 32), *(void *)(a1 + 40));
  return v7;
}

uint64_t __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 timestamp];
  if (v6
    && (uint64_t v7 = (void *)v6,
        [v5 timestamp],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    uint64_t v9 = [v4 timestamp];
    id v10 = [v5 timestamp];
    uint64_t v11 = [v9 compare:v10];
  }
  else
  {
    uint64_t v12 = [v4 timestamp];

    if (v12)
    {
      uint64_t v11 = 1;
    }
    else
    {
      id v13 = [v5 timestamp];

      if (v13) {
        uint64_t v11 = -1;
      }
      else {
        uint64_t v11 = 0;
      }
    }
  }

  return v11;
}

- (id)editsByAddingAllowedAttachmentEditsToEdit:(id)a3 inAttributedString:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a4;
  uint64_t v9 = [v7 array];
  uint64_t v10 = *MEMORY[0x1E4FB06B8];
  uint64_t v11 = [v6 range];
  uint64_t v13 = v12;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__ICTTTextEditGrouper_editsByAddingAllowedAttachmentEditsToEdit_inAttributedString___block_invoke;
  v18[3] = &unk_1E64A7BA8;
  void v18[4] = self;
  id v19 = v6;
  id v20 = v9;
  id v14 = v9;
  id v15 = v6;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v10, v11, v13, 0, v18);

  long long v16 = (void *)[v14 copy];
  return v16;
}

void __84__ICTTTextEditGrouper_editsByAddingAllowedAttachmentEditsToEdit_inAttributedString___block_invoke(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  ICProtocolCast();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v17 attachmentIdentifier];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [a1[4] filter];
    uint64_t v10 = [v9 allowedAttachmentIDs];
    uint64_t v11 = [v17 attachmentIdentifier];
    int v12 = [v10 containsObject:v11];

    if (v12)
    {
      uint64_t v13 = [ICTTTextEdit alloc];
      id v14 = [a1[5] timestamp];
      id v15 = [a1[5] replicaID];
      long long v16 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v13, "initWithTimestamp:replicaID:range:", v14, v15, a3, a4);

      [a1[6] addObject:v16];
    }
  }
}

- (void)setIncludesTableEdits:(BOOL)a3
{
  self->_includesTableEdits = a3;
}

- (void)setIncludesCheckmarkEdits:(BOOL)a3
{
  self->_includesCheckmarkEdits = a3;
}

- (void)setJoinsTextGaps:(BOOL)a3
{
  self->_joinsTextGaps = a3;
}

- (NSMutableDictionary)checkmarkReplicaIDForUserID
{
  return self->_checkmarkReplicaIDForUserID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkReplicaIDForUserID, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_trustsTimestampsFromReplicaID, 0);
  objc_storeStrong((id *)&self->_userIDForReplicaID, 0);
}

@end