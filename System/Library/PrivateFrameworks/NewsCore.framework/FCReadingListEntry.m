@interface FCReadingListEntry
- (id)asCKRecord;
- (id)initWithEntryID:(void *)a3 articleID:(void *)a4 dateAdded:(void *)a5 origin:;
- (id)initWithEntryID:(void *)a3 dictionaryRepresentation:;
@end

@implementation FCReadingListEntry

- (id)initWithEntryID:(void *)a3 dictionaryRepresentation:
{
  v3 = a1;
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    v7 = [v5 objectForKeyedSubscript:@"articleID"];
    v8 = [v5 objectForKeyedSubscript:@"dateAdded"];
    v9 = [v5 objectForKeyedSubscript:@"origin"];

    uint64_t v10 = [v9 unsignedIntegerValue];
    if ((unint64_t)(v10 - 1) >= 3) {
      v11 = 0;
    }
    else {
      v11 = (void *)v10;
    }

    v12 = -[FCReadingListEntry initWithEntryID:articleID:dateAdded:origin:](v3, v6, v7, v8, v11);
    v3 = v12;
  }
  return v3;
}

- (id)initWithEntryID:(void *)a3 articleID:(void *)a4 dateAdded:(void *)a5 origin:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (!a1) {
    goto LABEL_12;
  }
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)[[NSString alloc] initWithFormat:@"reading list entry must have an identifier"];
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCReadingListEntry initWithEntryID:articleID:dateAdded:origin:]";
    __int16 v23 = 2080;
    v24 = "FCReadingListEntry.m";
    __int16 v25 = 1024;
    int v26 = 18;
    __int16 v27 = 2114;
    v28 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v10)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)[[NSString alloc] initWithFormat:@"reading list entry must have an article ID"];
        *(_DWORD *)buf = 136315906;
        v22 = "-[FCReadingListEntry initWithEntryID:articleID:dateAdded:origin:]";
        __int16 v23 = 2080;
        v24 = "FCReadingListEntry.m";
        __int16 v25 = 1024;
        int v26 = 19;
        __int16 v27 = 2114;
        v28 = v19;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v10)
  {
    goto LABEL_5;
  }
  v20.receiver = a1;
  v20.super_class = (Class)FCReadingListEntry;
  v12 = (id *)objc_msgSendSuper2(&v20, sel_init);
  a1 = v12;
  if (v12)
  {
    if (v9 && v10)
    {
      uint64_t v13 = [v9 copy];
      id v14 = a1[1];
      a1[1] = (id)v13;

      uint64_t v15 = [v10 copy];
      id v16 = a1[2];
      a1[2] = (id)v15;

      objc_storeStrong(a1 + 3, a4);
      a1[4] = a5;
    }
    else
    {

      a1 = 0;
    }
  }
LABEL_12:

  return a1;
}

- (id)asCKRecord
{
  if (a1)
  {
    if (qword_1EB5D19E0 != -1) {
      dispatch_once(&qword_1EB5D19E0, &__block_literal_global_149);
    }
    id v2 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    v3 = (void *)[v2 initWithRecordName:a1[1] zoneID:_MergedGlobals_204];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"ReadingListEntry" recordID:v3];
    [v4 setObject:a1[2] forKeyedSubscript:@"articleID"];
    [v4 setObject:a1[3] forKeyedSubscript:@"dateAdded"];
    if ((unint64_t)(a1[4] - 1) >= 3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = a1[4];
    }
    id v6 = [NSNumber numberWithUnsignedInteger:v5];
    [v4 setObject:v6 forKeyedSubscript:@"origin"];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t __32__FCReadingListEntry_asCKRecord__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v1 = [v0 initWithZoneName:@"ReadingList" ownerName:*MEMORY[0x1E4F19C08]];
  uint64_t v2 = _MergedGlobals_204;
  _MergedGlobals_204 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end