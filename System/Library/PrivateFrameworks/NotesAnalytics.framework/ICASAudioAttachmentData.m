@interface ICASAudioAttachmentData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAudioAttachmentData)initWithAudioAttachmentID:(id)a3 transcriptCharacterCount:(id)a4 summaryCharacterCount:(id)a5;
- (NSNumber)summaryCharacterCount;
- (NSNumber)transcriptCharacterCount;
- (NSString)audioAttachmentID;
- (id)toDict;
@end

@implementation ICASAudioAttachmentData

- (ICASAudioAttachmentData)initWithAudioAttachmentID:(id)a3 transcriptCharacterCount:(id)a4 summaryCharacterCount:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASAudioAttachmentData;
  v12 = [(ICASAudioAttachmentData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_audioAttachmentID, a3);
    objc_storeStrong((id *)&v13->_transcriptCharacterCount, a4);
    objc_storeStrong((id *)&v13->_summaryCharacterCount, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"AudioAttachmentData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"audioAttachmentID";
  v3 = [(ICASAudioAttachmentData *)self audioAttachmentID];
  if (v3)
  {
    uint64_t v4 = [(ICASAudioAttachmentData *)self audioAttachmentID];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"transcriptCharacterCount";
  v6 = [(ICASAudioAttachmentData *)self transcriptCharacterCount];
  if (v6)
  {
    uint64_t v7 = [(ICASAudioAttachmentData *)self transcriptCharacterCount];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"summaryCharacterCount";
  id v9 = [(ICASAudioAttachmentData *)self summaryCharacterCount];
  if (v9)
  {
    uint64_t v10 = [(ICASAudioAttachmentData *)self summaryCharacterCount];
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

- (NSString)audioAttachmentID
{
  return self->_audioAttachmentID;
}

- (NSNumber)transcriptCharacterCount
{
  return self->_transcriptCharacterCount;
}

- (NSNumber)summaryCharacterCount
{
  return self->_summaryCharacterCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryCharacterCount, 0);
  objc_storeStrong((id *)&self->_transcriptCharacterCount, 0);
  objc_storeStrong((id *)&self->_audioAttachmentID, 0);
}

@end