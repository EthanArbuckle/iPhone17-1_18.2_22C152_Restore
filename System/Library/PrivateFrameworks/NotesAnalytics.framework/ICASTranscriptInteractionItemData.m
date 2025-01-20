@interface ICASTranscriptInteractionItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASTranscriptActionType)transcriptActionType;
- (ICASTranscriptInteractionItemData)initWithTranscriptInteractionTarget:(id)a3 transcriptActionType:(id)a4;
- (ICASTranscriptInteractionTarget)transcriptInteractionTarget;
- (id)toDict;
@end

@implementation ICASTranscriptInteractionItemData

- (ICASTranscriptInteractionItemData)initWithTranscriptInteractionTarget:(id)a3 transcriptActionType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASTranscriptInteractionItemData;
  v9 = [(ICASTranscriptInteractionItemData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transcriptInteractionTarget, a3);
    objc_storeStrong((id *)&v10->_transcriptActionType, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"TranscriptInteractionItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"transcriptInteractionTarget";
  v3 = [(ICASTranscriptInteractionItemData *)self transcriptInteractionTarget];
  if (v3)
  {
    uint64_t v4 = [(ICASTranscriptInteractionItemData *)self transcriptInteractionTarget];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"transcriptActionType";
  v12[0] = v4;
  v6 = [(ICASTranscriptInteractionItemData *)self transcriptActionType];
  if (v6)
  {
    uint64_t v7 = [(ICASTranscriptInteractionItemData *)self transcriptActionType];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (ICASTranscriptInteractionTarget)transcriptInteractionTarget
{
  return self->_transcriptInteractionTarget;
}

- (ICASTranscriptActionType)transcriptActionType
{
  return self->_transcriptActionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptActionType, 0);
  objc_storeStrong((id *)&self->_transcriptInteractionTarget, 0);
}

@end