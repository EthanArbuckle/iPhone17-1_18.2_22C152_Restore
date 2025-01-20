@interface ICASAudioRecordingData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAudioRecordingData)initWithTotalRecordingTime:(id)a3 recordingActionType:(id)a4 didAppBackgroundOccur:(id)a5 didNoteMultitaskingOccur:(id)a6;
- (ICASRecordingActionType)recordingActionType;
- (NSNumber)didAppBackgroundOccur;
- (NSNumber)didNoteMultitaskingOccur;
- (NSNumber)totalRecordingTime;
- (id)toDict;
@end

@implementation ICASAudioRecordingData

- (ICASAudioRecordingData)initWithTotalRecordingTime:(id)a3 recordingActionType:(id)a4 didAppBackgroundOccur:(id)a5 didNoteMultitaskingOccur:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASAudioRecordingData;
  v15 = [(ICASAudioRecordingData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_totalRecordingTime, a3);
    objc_storeStrong((id *)&v16->_recordingActionType, a4);
    objc_storeStrong((id *)&v16->_didAppBackgroundOccur, a5);
    objc_storeStrong((id *)&v16->_didNoteMultitaskingOccur, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)@"AudioRecordingData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"totalRecordingTime";
  v3 = [(ICASAudioRecordingData *)self totalRecordingTime];
  if (v3)
  {
    uint64_t v4 = [(ICASAudioRecordingData *)self totalRecordingTime];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"recordingActionType";
  v6 = [(ICASAudioRecordingData *)self recordingActionType];
  if (v6)
  {
    uint64_t v7 = [(ICASAudioRecordingData *)self recordingActionType];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = @"didAppBackgroundOccur";
  v9 = [(ICASAudioRecordingData *)self didAppBackgroundOccur];
  if (v9)
  {
    uint64_t v10 = [(ICASAudioRecordingData *)self didAppBackgroundOccur];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = @"didNoteMultitaskingOccur";
  id v12 = [(ICASAudioRecordingData *)self didNoteMultitaskingOccur];
  if (v12)
  {
    uint64_t v13 = [(ICASAudioRecordingData *)self didNoteMultitaskingOccur];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  v18[3] = v13;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (NSNumber)totalRecordingTime
{
  return self->_totalRecordingTime;
}

- (ICASRecordingActionType)recordingActionType
{
  return self->_recordingActionType;
}

- (NSNumber)didAppBackgroundOccur
{
  return self->_didAppBackgroundOccur;
}

- (NSNumber)didNoteMultitaskingOccur
{
  return self->_didNoteMultitaskingOccur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didNoteMultitaskingOccur, 0);
  objc_storeStrong((id *)&self->_didAppBackgroundOccur, 0);
  objc_storeStrong((id *)&self->_recordingActionType, 0);
  objc_storeStrong((id *)&self->_totalRecordingTime, 0);
}

@end