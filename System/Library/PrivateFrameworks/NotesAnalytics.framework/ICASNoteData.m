@interface ICASNoteData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASNoteData)initWithNoteID:(id)a3 noteType:(id)a4 isScrapPaper:(id)a5 isHandwritingAutoRefineEnabled:(id)a6 isAudioTranscriptEnabled:(id)a7 isAudioSummaryEnabled:(id)a8;
- (ICASNoteType)noteType;
- (NSNumber)isAudioSummaryEnabled;
- (NSNumber)isAudioTranscriptEnabled;
- (NSNumber)isHandwritingAutoRefineEnabled;
- (NSNumber)isScrapPaper;
- (NSString)noteID;
- (id)toDict;
@end

@implementation ICASNoteData

- (ICASNoteData)initWithNoteID:(id)a3 noteType:(id)a4 isScrapPaper:(id)a5 isHandwritingAutoRefineEnabled:(id)a6 isAudioTranscriptEnabled:(id)a7 isAudioSummaryEnabled:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ICASNoteData;
  v18 = [(ICASNoteData *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_noteID, a3);
    objc_storeStrong((id *)&v19->_noteType, a4);
    objc_storeStrong((id *)&v19->_isScrapPaper, a5);
    objc_storeStrong((id *)&v19->_isHandwritingAutoRefineEnabled, a6);
    objc_storeStrong((id *)&v19->_isAudioTranscriptEnabled, a7);
    objc_storeStrong((id *)&v19->_isAudioSummaryEnabled, a8);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)@"NoteData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v25[6] = *MEMORY[0x1E4F143B8];
  v24[0] = @"noteID";
  id v23 = [(ICASNoteData *)self noteID];
  if (v23)
  {
    uint64_t v3 = [(ICASNoteData *)self noteID];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v22 = (void *)v3;
  v25[0] = v3;
  v24[1] = @"noteType";
  uint64_t v20 = [(ICASNoteData *)self noteType];
  if (v20)
  {
    uint64_t v4 = [(ICASNoteData *)self noteType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v25[1] = v4;
  v24[2] = @"isScrapPaper";
  v6 = [(ICASNoteData *)self isScrapPaper];
  if (v6)
  {
    uint64_t v7 = [(ICASNoteData *)self isScrapPaper];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v25[2] = v7;
  v24[3] = @"isHandwritingAutoRefineEnabled";
  v9 = [(ICASNoteData *)self isHandwritingAutoRefineEnabled];
  if (v9)
  {
    uint64_t v10 = [(ICASNoteData *)self isHandwritingAutoRefineEnabled];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v25[3] = v10;
  v24[4] = @"isAudioTranscriptEnabled";
  v12 = [(ICASNoteData *)self isAudioTranscriptEnabled];
  if (v12)
  {
    uint64_t v13 = [(ICASNoteData *)self isAudioTranscriptEnabled];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v25[4] = v13;
  v24[5] = @"isAudioSummaryEnabled";
  id v15 = [(ICASNoteData *)self isAudioSummaryEnabled];
  if (v15)
  {
    uint64_t v16 = [(ICASNoteData *)self isAudioSummaryEnabled];
  }
  else
  {
    uint64_t v16 = objc_opt_new();
  }
  id v17 = (void *)v16;
  v25[5] = v16;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:6];

  return v18;
}

- (NSString)noteID
{
  return self->_noteID;
}

- (ICASNoteType)noteType
{
  return self->_noteType;
}

- (NSNumber)isScrapPaper
{
  return self->_isScrapPaper;
}

- (NSNumber)isHandwritingAutoRefineEnabled
{
  return self->_isHandwritingAutoRefineEnabled;
}

- (NSNumber)isAudioTranscriptEnabled
{
  return self->_isAudioTranscriptEnabled;
}

- (NSNumber)isAudioSummaryEnabled
{
  return self->_isAudioSummaryEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isAudioSummaryEnabled, 0);
  objc_storeStrong((id *)&self->_isAudioTranscriptEnabled, 0);
  objc_storeStrong((id *)&self->_isHandwritingAutoRefineEnabled, 0);
  objc_storeStrong((id *)&self->_isScrapPaper, 0);
  objc_storeStrong((id *)&self->_noteType, 0);
  objc_storeStrong((id *)&self->_noteID, 0);
}

@end