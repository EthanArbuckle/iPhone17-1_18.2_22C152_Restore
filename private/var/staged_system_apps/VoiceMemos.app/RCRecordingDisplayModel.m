@interface RCRecordingDisplayModel
+ (RCRecordingDisplayModel)recordingDisplayModelWithSavedRecording:(id)a3;
+ (RCRecordingDisplayModel)recordingDisplayModelWithTitle:(id)a3 creationDate:(id)a4 duration:(double)a5 UUID:(id)a6 recentlyDeleted:(BOOL)a7 representsDownloadingFile:(BOOL)a8 isFavorite:(BOOL)a9 isEnhanced:(BOOL)a10 hasTranscription:(BOOL)a11 wasManuallyRenamed:(BOOL)a12;
+ (id)recordingDisplayModelForUUID:(id)a3;
- (BOOL)hasTranscription;
- (BOOL)isEnhanced;
- (BOOL)isFavorite;
- (BOOL)isPlaying;
- (BOOL)recentlyDeleted;
- (BOOL)representsDownloadingFile;
- (BOOL)wasManuallyRenamed;
- (NSDate)creationDate;
- (NSString)UUID;
- (NSString)title;
- (double)duration;
- (id)description;
- (void)setCreationDate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHasTranscription:(BOOL)a3;
- (void)setIsEnhanced:(BOOL)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setRecentlyDeleted:(BOOL)a3;
- (void)setRepresentsDownloadingFile:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUUID:(id)a3;
- (void)setWasManuallyRenamed:(BOOL)a3;
@end

@implementation RCRecordingDisplayModel

+ (id)recordingDisplayModelForUUID:(id)a3
{
  id v3 = a3;
  v4 = +[RCApplicationModel sharedApplicationModel];
  v5 = [v4 recordingWithUniqueID:v3];

  if (v5)
  {
    v6 = +[RCRecordingDisplayModel recordingDisplayModelWithSavedRecording:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

+ (RCRecordingDisplayModel)recordingDisplayModelWithSavedRecording:(id)a3
{
  id v3 = a3;
  v17 = [v3 title];
  v4 = [v3 creationDate];
  [v3 length];
  double v6 = v5;
  v7 = [v3 uuid];
  v8 = [v3 deletionDate];
  id v9 = [v3 audioFutureNeedsDownload];
  id v10 = [v3 favorite];
  unsigned __int8 v11 = [v3 enhanced];
  unsigned __int8 v12 = [v3 transcriptionContentExists];
  unsigned __int8 v13 = [v3 manuallyRenamed];

  BYTE2(v16) = v13;
  BYTE1(v16) = v12;
  LOBYTE(v16) = v11;
  v14 = +[RCRecordingDisplayModel recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:wasManuallyRenamed:](RCRecordingDisplayModel, "recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:wasManuallyRenamed:", v17, v4, v7, v8 != 0, v9, v10, v6, v16);

  return (RCRecordingDisplayModel *)v14;
}

- (BOOL)wasManuallyRenamed
{
  return self->_wasManuallyRenamed;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)representsDownloadingFile
{
  return self->_representsDownloadingFile;
}

- (BOOL)recentlyDeleted
{
  return self->_recentlyDeleted;
}

- (BOOL)hasTranscription
{
  return self->_hasTranscription;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setWasManuallyRenamed:(BOOL)a3
{
  self->_wasManuallyRenamed = a3;
}

- (void)setUUID:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setRepresentsDownloadingFile:(BOOL)a3
{
  self->_representsDownloadingFile = a3;
}

- (void)setRecentlyDeleted:(BOOL)a3
{
  self->_recentlyDeleted = a3;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (void)setIsEnhanced:(BOOL)a3
{
  self->_isEnhanced = a3;
}

- (void)setHasTranscription:(BOOL)a3
{
  self->_hasTranscription = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setCreationDate:(id)a3
{
}

- (id)description
{
  id v3 = [(RCRecordingDisplayModel *)self title];
  v4 = [(RCRecordingDisplayModel *)self UUID];
  double v5 = +[NSString stringWithFormat:@"Title: %@, UUID: %@", v3, v4];

  return v5;
}

+ (RCRecordingDisplayModel)recordingDisplayModelWithTitle:(id)a3 creationDate:(id)a4 duration:(double)a5 UUID:(id)a6 recentlyDeleted:(BOOL)a7 representsDownloadingFile:(BOOL)a8 isFavorite:(BOOL)a9 isEnhanced:(BOOL)a10 hasTranscription:(BOOL)a11 wasManuallyRenamed:(BOOL)a12
{
  BOOL v12 = a9;
  BOOL v13 = a8;
  BOOL v14 = a7;
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  BOOL v21 = v13;
  id v22 = v20;
  if (!v20)
  {
    id v27 = v18;
    BOOL v23 = v21;
    v24 = OSLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_10016DE28(v24);
    }

    BOOL v21 = v23;
    id v18 = v27;
  }
  v25 = objc_opt_new();
  [v25 setTitle:v18];
  [v25 setCreationDate:v19];
  [v25 setDuration:a5];
  [v25 setUUID:v22];
  [v25 setRecentlyDeleted:v14];
  [v25 setIsFavorite:v12];
  [v25 setIsEnhanced:a10];
  [v25 setHasTranscription:a11];
  [v25 setRepresentsDownloadingFile:v21];
  [v25 setWasManuallyRenamed:a12];

  return (RCRecordingDisplayModel *)v25;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (BOOL)isEnhanced
{
  return self->_isEnhanced;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
}

@end