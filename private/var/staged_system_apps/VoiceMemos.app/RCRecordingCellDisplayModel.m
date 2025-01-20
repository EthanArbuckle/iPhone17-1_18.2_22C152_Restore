@interface RCRecordingCellDisplayModel
+ (id)recordingDisplayModelForUUID:(id)a3;
+ (id)recordingDisplayModelWithSavedRecording:(id)a3;
+ (id)recordingDisplayModelWithTitle:(id)a3 creationDate:(id)a4 duration:(double)a5 UUID:(id)a6 recentlyDeleted:(BOOL)a7 representsDownloadingFile:(BOOL)a8 isFavorite:(BOOL)a9 isEnhanced:(BOOL)a10 hasTranscription:(BOOL)a11 hasMultipleTracks:(BOOL)a12 wasManuallyRenamed:(BOOL)a13;
- (BOOL)hasMultipleTracks;
- (void)setHasMultipleTracks:(BOOL)a3;
@end

@implementation RCRecordingCellDisplayModel

+ (id)recordingDisplayModelWithTitle:(id)a3 creationDate:(id)a4 duration:(double)a5 UUID:(id)a6 recentlyDeleted:(BOOL)a7 representsDownloadingFile:(BOOL)a8 isFavorite:(BOOL)a9 isEnhanced:(BOOL)a10 hasTranscription:(BOOL)a11 hasMultipleTracks:(BOOL)a12 wasManuallyRenamed:(BOOL)a13
{
  BOOL v29 = a9;
  BOOL v13 = a8;
  BOOL v14 = a7;
  id v19 = a3;
  id v20 = a4;
  id v21 = a6;
  BOOL v22 = v29;
  id v23 = v21;
  if (!v21)
  {
    id v28 = v19;
    v24 = OSLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_10016B328(v24);
    }

    BOOL v22 = v29;
    id v19 = v28;
  }
  BYTE2(v27) = a13;
  LOWORD(v27) = __PAIR16__(a11, a10);
  v25 = [a1 recordingDisplayModelWithTitle:v19 creationDate:v20 duration:v23 UUID:v14 recentlyDeleted:v13 representsDownloadingFile:a5 isFavorite:v27 isEnhanced:v22 wasManuallyRenamed:v27];
  [v25 setHasMultipleTracks:a12];

  return v25;
}

+ (id)recordingDisplayModelWithSavedRecording:(id)a3
{
  id v3 = a3;
  v18 = [v3 title];
  v4 = [v3 creationDate];
  [v3 length];
  double v6 = v5;
  v7 = [v3 uuid];
  v8 = [v3 deletionDate];
  id v9 = [v3 audioFutureNeedsDownload];
  id v10 = [v3 favorite];
  unsigned __int8 v11 = [v3 enhanced];
  unsigned __int8 v12 = [v3 transcriptionContentExists];
  unsigned __int8 v13 = [v3 composedAssetHasMultipleTracks];
  unsigned __int8 v14 = [v3 manuallyRenamed];

  BYTE3(v17) = v14;
  BYTE2(v17) = v13;
  BYTE1(v17) = v12;
  LOBYTE(v17) = v11;
  v15 = +[RCRecordingCellDisplayModel recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:hasMultipleTracks:wasManuallyRenamed:](RCRecordingCellDisplayModel, "recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:hasMultipleTracks:wasManuallyRenamed:", v18, v4, v7, v8 != 0, v9, v10, v6, v17);

  return v15;
}

+ (id)recordingDisplayModelForUUID:(id)a3
{
  id v3 = a3;
  v4 = +[RCApplicationModel sharedApplicationModel];
  double v5 = [v4 recordingWithUniqueID:v3];

  if (v5)
  {
    double v6 = +[RCRecordingCellDisplayModel recordingDisplayModelWithSavedRecording:v5];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (BOOL)hasMultipleTracks
{
  return self->_hasMultipleTracks;
}

- (void)setHasMultipleTracks:(BOOL)a3
{
  self->_hasMultipleTracks = a3;
}

@end