@interface FCPuzzleHistoryItem
- (CKRecord)asCKRecord;
- (FCPuzzleHistoryItem)initWithEntryID:(id)a3 puzzleID:(id)a4 puzzleTypeID:(id)a5 progressData:(id)a6 progressLevel:(int64_t)a7 score:(id)a8 rankID:(id)a9 usedReveal:(id)a10 playDuration:(int64_t)a11 lastPlayedDate:(id)a12 completedDate:(id)a13 firstCompletedDate:(id)a14 firstPlayDuration:(id)a15 bestScore:(id)a16 difficulty:(id)a17 publishDate:(id)a18 behaviorFlags:(id)a19;
- (NSData)progressData;
- (NSDate)completedDate;
- (NSDate)firstCompletedDate;
- (NSDate)lastPlayedDate;
- (NSDate)publishDate;
- (NSNumber)behaviorFlags;
- (NSNumber)bestScore;
- (NSNumber)difficulty;
- (NSNumber)firstPlayDuration;
- (NSNumber)score;
- (NSNumber)usedReveal;
- (NSString)identifier;
- (NSString)puzzleID;
- (NSString)puzzleTypeID;
- (NSString)rankID;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initWithEntryID:(void *)a3 dictionaryRepresentation:;
- (int64_t)playDuration;
- (int64_t)progressLevel;
@end

@implementation FCPuzzleHistoryItem

- (FCPuzzleHistoryItem)initWithEntryID:(id)a3 puzzleID:(id)a4 puzzleTypeID:(id)a5 progressData:(id)a6 progressLevel:(int64_t)a7 score:(id)a8 rankID:(id)a9 usedReveal:(id)a10 playDuration:(int64_t)a11 lastPlayedDate:(id)a12 completedDate:(id)a13 firstCompletedDate:(id)a14 firstPlayDuration:(id)a15 bestScore:(id)a16 difficulty:(id)a17 publishDate:(id)a18 behaviorFlags:(id)a19
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v23 = a4;
  id v24 = a5;
  id obj = a6;
  id v57 = a6;
  id v47 = a8;
  id v56 = a8;
  id v25 = a9;
  id v51 = a10;
  id v55 = a12;
  id v54 = a13;
  id v53 = a14;
  id v52 = a15;
  id v26 = a16;
  id v27 = a17;
  id v28 = a18;
  id v50 = a19;
  if (!v48 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"puzzle history item must have an identifier", obj);
    *(_DWORD *)buf = 136315906;
    v60 = "-[FCPuzzleHistoryItem initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal"
          ":playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDa"
          "te:behaviorFlags:]";
    __int16 v61 = 2080;
    v62 = "FCPuzzleHistoryItem.m";
    __int16 v63 = 1024;
    int v64 = 31;
    __int16 v65 = 2114;
    v66 = v41;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v23) {
      goto LABEL_6;
    }
  }
  else if (v23)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v42 = (void *)[[NSString alloc] initWithFormat:@"puzzle history item must have a puzzle ID"];
    *(_DWORD *)buf = 136315906;
    v60 = "-[FCPuzzleHistoryItem initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal"
          ":playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDa"
          "te:behaviorFlags:]";
    __int16 v61 = 2080;
    v62 = "FCPuzzleHistoryItem.m";
    __int16 v63 = 1024;
    int v64 = 32;
    __int16 v65 = 2114;
    v66 = v42;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v29 = v24;
  if (!v24 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v43 = (void *)[[NSString alloc] initWithFormat:@"puzzle history item must have a puzzleType ID"];
    *(_DWORD *)buf = 136315906;
    v60 = "-[FCPuzzleHistoryItem initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal"
          ":playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDa"
          "te:behaviorFlags:]";
    __int16 v61 = 2080;
    v62 = "FCPuzzleHistoryItem.m";
    __int16 v63 = 1024;
    int v64 = 33;
    __int16 v65 = 2114;
    v66 = v43;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v58.receiver = self;
  v58.super_class = (Class)FCPuzzleHistoryItem;
  v30 = [(FCPuzzleHistoryItem *)&v58 init];
  v31 = v30;
  if (v30)
  {
    if (v48 && v23)
    {
      uint64_t v32 = [v48 copy];
      identifier = v31->_identifier;
      v31->_identifier = (NSString *)v32;

      uint64_t v34 = [v23 copy];
      puzzleID = v31->_puzzleID;
      v31->_puzzleID = (NSString *)v34;

      uint64_t v36 = [v29 copy];
      puzzleTypeID = v31->_puzzleTypeID;
      v31->_puzzleTypeID = (NSString *)v36;

      objc_storeStrong((id *)&v31->_progressData, obja);
      v31->_progressLevel = a7;
      objc_storeStrong((id *)&v31->_score, v47);
      uint64_t v38 = [v25 copy];
      rankID = v31->_rankID;
      v31->_rankID = (NSString *)v38;

      objc_storeStrong((id *)&v31->_usedReveal, a10);
      v31->_playDuration = a11;
      objc_storeStrong((id *)&v31->_lastPlayedDate, a12);
      objc_storeStrong((id *)&v31->_completedDate, a13);
      objc_storeStrong((id *)&v31->_firstCompletedDate, a14);
      objc_storeStrong((id *)&v31->_firstPlayDuration, a15);
      objc_storeStrong((id *)&v31->_bestScore, a16);
      objc_storeStrong((id *)&v31->_difficulty, a17);
      objc_storeStrong((id *)&v31->_publishDate, a18);
      objc_storeStrong((id *)&v31->_behaviorFlags, a19);
    }
    else
    {

      v31 = 0;
    }
  }

  return v31;
}

- (CKRecord)asCKRecord
{
  if (qword_1EB5D17D0 != -1) {
    dispatch_once(&qword_1EB5D17D0, &__block_literal_global_111);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v4 = [(FCPuzzleHistoryItem *)self identifier];
  v5 = (void *)[v3 initWithRecordName:v4 zoneID:_MergedGlobals_189];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"PuzzleHistoryItem" recordID:v5];
  v7 = [(FCPuzzleHistoryItem *)self puzzleID];
  [v6 setObject:v7 forKeyedSubscript:@"puzzleID"];

  v8 = [(FCPuzzleHistoryItem *)self puzzleTypeID];
  [v6 setObject:v8 forKeyedSubscript:@"puzzleTypeID"];

  v9 = [(FCPuzzleHistoryItem *)self progressData];
  [v6 setObject:v9 forKeyedSubscript:@"progressData"];

  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[FCPuzzleHistoryItem progressLevel](self, "progressLevel"));
  [v6 setObject:v10 forKeyedSubscript:@"progressLevel"];

  v11 = [(FCPuzzleHistoryItem *)self score];
  [v6 setObject:v11 forKeyedSubscript:@"score"];

  v12 = [(FCPuzzleHistoryItem *)self rankID];
  [v6 setObject:v12 forKeyedSubscript:@"rankID"];

  v13 = [(FCPuzzleHistoryItem *)self usedReveal];
  [v6 setObject:v13 forKeyedSubscript:@"usedReveal"];

  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[FCPuzzleHistoryItem playDuration](self, "playDuration"));
  [v6 setObject:v14 forKeyedSubscript:@"playDuration"];

  v15 = [(FCPuzzleHistoryItem *)self lastPlayedDate];
  [v6 setObject:v15 forKeyedSubscript:@"lastPlayedDate"];

  v16 = [(FCPuzzleHistoryItem *)self completedDate];
  [v6 setObject:v16 forKeyedSubscript:@"completedDate"];

  v17 = [(FCPuzzleHistoryItem *)self firstCompletedDate];
  [v6 setObject:v17 forKeyedSubscript:@"firstCompletedDate"];

  v18 = [(FCPuzzleHistoryItem *)self firstPlayDuration];
  [v6 setObject:v18 forKeyedSubscript:@"firstPlayDuration"];

  v19 = [(FCPuzzleHistoryItem *)self bestScore];
  [v6 setObject:v19 forKeyedSubscript:@"bestScore"];

  v20 = [(FCPuzzleHistoryItem *)self difficulty];
  [v6 setObject:v20 forKeyedSubscript:@"difficulty"];

  v21 = [(FCPuzzleHistoryItem *)self publishDate];
  [v6 setObject:v21 forKeyedSubscript:@"publishDate"];

  v22 = [(FCPuzzleHistoryItem *)self behaviorFlags];
  [v6 setObject:v22 forKeyedSubscript:@"behaviorFlags"];

  return (CKRecord *)v6;
}

uint64_t __33__FCPuzzleHistoryItem_asCKRecord__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v1 = [v0 initWithZoneName:@"PuzzleHistory" ownerName:*MEMORY[0x1E4F19C08]];
  uint64_t v2 = _MergedGlobals_189;
  _MergedGlobals_189 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (id)description
{
  id v3 = [(FCPuzzleHistoryItem *)self progressData];
  v4 = @"(some)";
  if (!v3) {
    v4 = @"(null)";
  }
  v20 = v4;

  v18 = NSString;
  v17 = [(FCPuzzleHistoryItem *)self puzzleID];
  v16 = [(FCPuzzleHistoryItem *)self puzzleTypeID];
  id v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[FCPuzzleHistoryItem progressLevel](self, "progressLevel"));
  v15 = [(FCPuzzleHistoryItem *)self score];
  v22 = [(FCPuzzleHistoryItem *)self rankID];
  v21 = [(FCPuzzleHistoryItem *)self usedReveal];
  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[FCPuzzleHistoryItem playDuration](self, "playDuration"));
  v5 = [(FCPuzzleHistoryItem *)self lastPlayedDate];
  v13 = [(FCPuzzleHistoryItem *)self completedDate];
  v6 = [(FCPuzzleHistoryItem *)self firstCompletedDate];
  v12 = [(FCPuzzleHistoryItem *)self firstPlayDuration];
  v7 = [(FCPuzzleHistoryItem *)self bestScore];
  v8 = [(FCPuzzleHistoryItem *)self difficulty];
  v9 = [(FCPuzzleHistoryItem *)self publishDate];
  v10 = [(FCPuzzleHistoryItem *)self behaviorFlags];
  v19 = [v18 stringWithFormat:@"{puzzleID=%@, puzzleTypeID=%@, progressData=%@, progressLevel=%@, score=%@, rankID=%@, usedReveal=%@, playDuration=%@, lastPlayedDate=%@, completedDate=%@, firstCompletedDate=%@, firstPlayDuration=%@, bestScore=%@, difficulty=%@, publishDate=%@, behaviorFlags=%@}", v17, v16, v20, v23, v15, v22, v21, v14, v5, v13, v6, v12, v7, v8, v9, v10];

  return v19;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)puzzleID
{
  return self->_puzzleID;
}

- (NSString)puzzleTypeID
{
  return self->_puzzleTypeID;
}

- (NSData)progressData
{
  return self->_progressData;
}

- (int64_t)progressLevel
{
  return self->_progressLevel;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSString)rankID
{
  return self->_rankID;
}

- (NSNumber)usedReveal
{
  return self->_usedReveal;
}

- (int64_t)playDuration
{
  return self->_playDuration;
}

- (NSDate)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (NSDate)completedDate
{
  return self->_completedDate;
}

- (NSDate)firstCompletedDate
{
  return self->_firstCompletedDate;
}

- (NSNumber)firstPlayDuration
{
  return self->_firstPlayDuration;
}

- (NSNumber)bestScore
{
  return self->_bestScore;
}

- (NSNumber)difficulty
{
  return self->_difficulty;
}

- (NSDate)publishDate
{
  return self->_publishDate;
}

- (NSNumber)behaviorFlags
{
  return self->_behaviorFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorFlags, 0);
  objc_storeStrong((id *)&self->_publishDate, 0);
  objc_storeStrong((id *)&self->_difficulty, 0);
  objc_storeStrong((id *)&self->_bestScore, 0);
  objc_storeStrong((id *)&self->_firstPlayDuration, 0);
  objc_storeStrong((id *)&self->_firstCompletedDate, 0);
  objc_storeStrong((id *)&self->_completedDate, 0);
  objc_storeStrong((id *)&self->_lastPlayedDate, 0);
  objc_storeStrong((id *)&self->_usedReveal, 0);
  objc_storeStrong((id *)&self->_rankID, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_progressData, 0);
  objc_storeStrong((id *)&self->_puzzleTypeID, 0);
  objc_storeStrong((id *)&self->_puzzleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)dictionaryRepresentation
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 puzzleID];

  if (!v2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v35 = (void *)[[NSString alloc] initWithFormat:@"puzzleHistoryItem must have a puzzleID"];
    int v36 = 136315906;
    v37 = "-[FCPuzzleHistoryItem(PuzzleHistory) dictionaryRepresentation]";
    __int16 v38 = 2080;
    v39 = "FCPuzzleHistory.m";
    __int16 v40 = 1024;
    int v41 = 968;
    __int16 v42 = 2114;
    v43 = v35;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v36, 0x26u);
  }
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "progressLevel"));
  [v3 setObject:v4 forKey:@"progressLevel"];

  v5 = [a1 score];

  if (v5)
  {
    v6 = [a1 score];
    [v3 setObject:v6 forKey:@"score"];
  }
  v7 = [a1 rankID];

  if (v7)
  {
    v8 = [a1 rankID];
    [v3 setObject:v8 forKey:@"rankID"];
  }
  v9 = [a1 usedReveal];

  if (v9)
  {
    v10 = [a1 usedReveal];
    [v3 setObject:v10 forKey:@"usedReveal"];
  }
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "playDuration"));
  [v3 setObject:v11 forKey:@"playDuration"];

  v12 = [a1 puzzleID];

  if (v12)
  {
    v13 = [a1 puzzleID];
    [v3 setObject:v13 forKey:@"puzzleID"];
  }
  v14 = [a1 puzzleTypeID];

  if (v14)
  {
    v15 = [a1 puzzleTypeID];
    [v3 setObject:v15 forKey:@"puzzleTypeID"];
  }
  v16 = [a1 progressData];

  if (v16)
  {
    v17 = [a1 progressData];
    [v3 setObject:v17 forKey:@"progressData"];
  }
  v18 = [a1 lastPlayedDate];

  if (v18)
  {
    v19 = [a1 lastPlayedDate];
    [v3 setObject:v19 forKey:@"lastPlayedDate"];
  }
  v20 = [a1 completedDate];

  if (v20)
  {
    v21 = [a1 completedDate];
    [v3 setObject:v21 forKey:@"completedDate"];
  }
  v22 = [a1 firstCompletedDate];

  if (v22)
  {
    id v23 = [a1 firstCompletedDate];
    [v3 setObject:v23 forKey:@"firstCompletedDate"];
  }
  id v24 = [a1 firstPlayDuration];

  if (v24)
  {
    id v25 = [a1 firstPlayDuration];
    [v3 setObject:v25 forKey:@"firstPlayDuration"];
  }
  id v26 = [a1 bestScore];

  if (v26)
  {
    id v27 = [a1 bestScore];
    [v3 setObject:v27 forKey:@"bestScore"];
  }
  id v28 = [a1 difficulty];

  if (v28)
  {
    v29 = [a1 difficulty];
    [v3 setObject:v29 forKey:@"difficulty"];
  }
  v30 = [a1 publishDate];

  if (v30)
  {
    v31 = [a1 publishDate];
    [v3 setObject:v31 forKey:@"publishDate"];
  }
  uint64_t v32 = [a1 behaviorFlags];

  if (v32)
  {
    v33 = [a1 behaviorFlags];
    [v3 setObject:v33 forKey:@"behaviorFlags"];
  }
  return v3;
}

- (id)initWithEntryID:(void *)a3 dictionaryRepresentation:
{
  if (!a1) {
    return 0;
  }
  id v4 = a3;
  id v24 = a2;
  id v25 = [v4 objectForKeyedSubscript:@"puzzleID"];
  id v23 = [v4 objectForKeyedSubscript:@"puzzleTypeID"];
  v22 = [v4 objectForKeyedSubscript:@"progressData"];
  v5 = [v4 objectForKeyedSubscript:@"progressLevel"];
  uint64_t v21 = (int)[v5 intValue];

  v20 = [v4 objectForKeyedSubscript:@"score"];
  id v27 = [v4 objectForKeyedSubscript:@"rankID"];
  v18 = [v4 objectForKeyedSubscript:@"usedReveal"];
  v6 = [v4 objectForKeyedSubscript:@"playDuration"];
  uint64_t v19 = (int)[v6 intValue];

  v17 = [v4 objectForKeyedSubscript:@"lastPlayedDate"];
  v16 = [v4 objectForKeyedSubscript:@"completedDate"];
  v15 = [v4 objectForKeyedSubscript:@"firstCompletedDate"];
  v14 = [v4 objectForKeyedSubscript:@"firstPlayDuration"];
  v7 = [v4 objectForKeyedSubscript:@"bestScore"];
  v8 = [v4 objectForKeyedSubscript:@"difficulty"];
  v9 = [v4 objectForKeyedSubscript:@"publishDate"];
  v10 = [v4 objectForKeyedSubscript:@"behaviorFlags"];

  v11 = objc_msgSend(a1, "initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:", v24, v25, v23, v22, v21, v20, v27, v18, v19, v17, v16, v15, v14, v7, v8, v9,
                  v10);

  id v12 = v11;
  return v12;
}

@end