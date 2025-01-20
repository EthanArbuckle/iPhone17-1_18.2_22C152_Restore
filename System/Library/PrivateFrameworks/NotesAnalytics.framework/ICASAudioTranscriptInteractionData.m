@interface ICASAudioTranscriptInteractionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAudioTranscriptInteractionData)initWithWasTranscriptViewed:(id)a3 wasSummaryViewed:(id)a4 transcriptInteractionSummaryArray:(id)a5;
- (NSArray)transcriptInteractionSummaryArray;
- (NSNumber)wasSummaryViewed;
- (NSNumber)wasTranscriptViewed;
- (id)toDict;
@end

@implementation ICASAudioTranscriptInteractionData

- (ICASAudioTranscriptInteractionData)initWithWasTranscriptViewed:(id)a3 wasSummaryViewed:(id)a4 transcriptInteractionSummaryArray:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASAudioTranscriptInteractionData;
  v12 = [(ICASAudioTranscriptInteractionData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_wasTranscriptViewed, a3);
    objc_storeStrong((id *)&v13->_wasSummaryViewed, a4);
    objc_storeStrong((id *)&v13->_transcriptInteractionSummaryArray, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"AudioTranscriptInteractionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"wasTranscriptViewed";
  v3 = [(ICASAudioTranscriptInteractionData *)self wasTranscriptViewed];
  if (v3)
  {
    uint64_t v4 = [(ICASAudioTranscriptInteractionData *)self wasTranscriptViewed];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"wasSummaryViewed";
  v6 = [(ICASAudioTranscriptInteractionData *)self wasSummaryViewed];
  if (v6)
  {
    uint64_t v7 = [(ICASAudioTranscriptInteractionData *)self wasSummaryViewed];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"transcriptInteractionSummaryArray";
  id v9 = [(ICASAudioTranscriptInteractionData *)self transcriptInteractionSummaryArray];
  if (v9)
  {
    uint64_t v10 = [(ICASAudioTranscriptInteractionData *)self transcriptInteractionSummaryArray];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v15[2] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (NSNumber)wasTranscriptViewed
{
  return self->_wasTranscriptViewed;
}

- (NSNumber)wasSummaryViewed
{
  return self->_wasSummaryViewed;
}

- (NSArray)transcriptInteractionSummaryArray
{
  return self->_transcriptInteractionSummaryArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptInteractionSummaryArray, 0);
  objc_storeStrong((id *)&self->_wasSummaryViewed, 0);
  objc_storeStrong((id *)&self->_wasTranscriptViewed, 0);
}

@end