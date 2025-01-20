@interface RCSavedRecording
+ (id)fetchLegacyRecordingsForMigrationWithContext:(id)a3;
+ (id)legacyRecordingWithUniqueIDFetchRequest:(id)a3;
+ (void)deleteOrphanedEntityRevisionsWithContext:(id)a3;
- (BOOL)isContentBeingModified;
- (NSString)customLabel;
- (NSString)path;
- (NSURL)url;
- (double)duration;
- (id)URIRepresentation;
- (id)avAsset;
- (int64_t)recordingID;
- (int64_t)revisionID;
- (void)_validatePath;
- (void)awakeFromFetch;
- (void)awakeFromInsert;
- (void)setCustomLabel:(id)a3;
- (void)setDuration:(double)a3;
- (void)setPath:(id)a3;
- (void)setRecordingID:(int64_t)a3;
- (void)setRevisionID:(int64_t)a3;
- (void)willSave;
@end

@implementation RCSavedRecording

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)RCSavedRecording;
  [(RCSavedRecording *)&v4 awakeFromInsert];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [(RCSavedRecording *)self setDate:v3];
}

- (void)awakeFromFetch
{
  v3.receiver = self;
  v3.super_class = (Class)RCSavedRecording;
  [(RCSavedRecording *)&v3 awakeFromFetch];
  [(RCSavedRecording *)self _validatePath];
}

- (void)willSave
{
  v8.receiver = self;
  v8.super_class = (Class)RCSavedRecording;
  [(RCSavedRecording *)&v8 willSave];
  if (([(RCSavedRecording *)self isDeleted] & 1) == 0)
  {
    if (!self->_pathWasInvalid)
    {
      objc_super v4 = [(RCSavedRecording *)self path];

      if (!v4)
      {
        v7 = [MEMORY[0x1E4F28B00] currentHandler];
        [v7 handleFailureInMethod:a2 object:self file:@"RCSavedRecording.m" lineNumber:52 description:@"no path for recording when saving"];
      }
    }
    v5 = [(RCSavedRecording *)self primitiveValueForKey:@"duration"];

    if (!v5)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"RCSavedRecording.m" lineNumber:53 description:@"no duration for recording when saving"];
    }
  }
}

- (BOOL)isContentBeingModified
{
  v2 = [(RCSavedRecording *)self url];
  BOOL v3 = +[RCComposition _isSessionWithModificationAccessActiveForComposedAVURL:v2];

  return v3;
}

- (double)duration
{
  [(RCSavedRecording *)self willAccessValueForKey:@"duration"];
  BOOL v3 = [(RCSavedRecording *)self primitiveValueForKey:@"duration"];
  [v3 doubleValue];
  double Seconds = v4;

  [(RCSavedRecording *)self didAccessValueForKey:@"duration"];
  if (Seconds < 0.0 && ![(RCSavedRecording *)self isContentBeingModified])
  {
    v6 = [(RCSavedRecording *)self avAsset];
    v7 = v6;
    if (v6) {
      [v6 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);

    if (Seconds > 0.0) {
      [(RCSavedRecording *)self setDuration:Seconds];
    }
  }
  double result = 0.0;
  if (Seconds >= 0.0) {
    return Seconds;
  }
  return result;
}

- (void)setDuration:(double)a3
{
  [(RCSavedRecording *)self willChangeValueForKey:@"duration"];
  v5 = [NSNumber numberWithDouble:a3];
  [(RCSavedRecording *)self setPrimitiveValue:v5 forKey:@"duration"];

  avAsset = self->_avAsset;
  self->_avAsset = 0;

  [(RCSavedRecording *)self didChangeValueForKey:@"duration"];
}

- (NSString)customLabel
{
  [(RCSavedRecording *)self willAccessValueForKey:@"customLabel"];
  BOOL v3 = [(RCSavedRecording *)self primitiveValueForKey:@"customLabel"];
  [(RCSavedRecording *)self didAccessValueForKey:@"customLabel"];
  return (NSString *)v3;
}

- (void)setCustomLabel:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  v6 = [v4 whitespaceCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];

  if ([v7 length])
  {
    [(RCSavedRecording *)self willChangeValueForKey:@"customLabel"];
    [(RCSavedRecording *)self setPrimitiveValue:v7 forKey:@"customLabel"];
    [(RCSavedRecording *)self didChangeValueForKey:@"customLabel"];
  }
}

- (int64_t)recordingID
{
  [(RCSavedRecording *)self willAccessValueForKey:@"recordingID"];
  BOOL v3 = [(RCSavedRecording *)self primitiveValueForKey:@"recordingID"];
  int64_t v4 = [v3 longLongValue];

  [(RCSavedRecording *)self didAccessValueForKey:@"recordingID"];
  return v4;
}

- (void)setRecordingID:(int64_t)a3
{
  [(RCSavedRecording *)self willChangeValueForKey:@"recordingID"];
  id v5 = [NSNumber numberWithLongLong:a3];
  [(RCSavedRecording *)self setPrimitiveValue:v5 forKey:@"recordingID"];

  [(RCSavedRecording *)self didChangeValueForKey:@"recordingID"];
}

- (NSString)path
{
  [(RCSavedRecording *)self willAccessValueForKey:@"path"];
  BOOL v3 = [(RCSavedRecording *)self primitiveValueForKey:@"path"];
  [(RCSavedRecording *)self didAccessValueForKey:@"path"];
  return (NSString *)v3;
}

- (void)setPath:(id)a3
{
  id v4 = a3;
  [(RCSavedRecording *)self willChangeValueForKey:@"path"];
  [(RCSavedRecording *)self setPrimitiveValue:v4 forKey:@"path"];

  [(RCSavedRecording *)self _validatePath];
  [(RCSavedRecording *)self didChangeValueForKey:@"path"];
}

- (NSURL)url
{
  BOOL v3 = [(RCSavedRecording *)self path];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CB10];
    id v5 = [(RCSavedRecording *)self path];
    v6 = [v4 fileURLWithPath:v5];
  }
  else
  {
    v6 = 0;
  }
  return (NSURL *)v6;
}

- (id)URIRepresentation
{
  v2 = [(RCSavedRecording *)self objectID];
  BOOL v3 = [v2 URIRepresentation];

  return v3;
}

- (id)avAsset
{
  if (!self->_avAsset)
  {
    BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v4 = [(RCSavedRecording *)self url];
    id v5 = [v4 path];
    int v6 = [v3 fileExistsAtPath:v5];

    if (v6)
    {
      id v7 = (void *)MEMORY[0x1E4F166C8];
      objc_super v8 = [(RCSavedRecording *)self url];
      objc_msgSend(v7, "rc_preciseTimingAssetWithURL:", v8);
      v9 = (AVAsset *)objc_claimAutoreleasedReturnValue();
      avAsset = self->_avAsset;
      self->_avAsset = v9;
    }
  }
  v11 = self->_avAsset;
  return v11;
}

- (void)_validatePath
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 path];
  int v6 = 136315650;
  id v7 = "-[RCSavedRecording _validatePath]";
  __int16 v8 = 2112;
  v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_1C3964000, a3, OS_LOG_TYPE_ERROR, "%s -- WARNING: bogus path (%@) detected for recording %@", (uint8_t *)&v6, 0x20u);
}

+ (void)deleteOrphanedEntityRevisionsWithContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v5 = [MEMORY[0x1E4F1C0A8] entityForName:@"Recording" inManagedObjectContext:v3];
  [v4 setEntity:v5];

  [v4 setPropertiesToFetch:&unk_1F1F0DA68];
  int v6 = [v3 executeFetchRequest:v4 error:0];
  id v7 = [v6 valueForKey:@"recordingID"];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v9 = [MEMORY[0x1E4F1C0A8] entityForName:@"EntityRevision" inManagedObjectContext:v3];
  [v8 setEntity:v9];

  __int16 v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (recording_id IN %@)", v7];
  [v8 setPredicate:v10];

  uint64_t v11 = [v3 executeFetchRequest:v8 error:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [v3 deleteObject:*(void *)(*((void *)&v16 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

+ (id)fetchLegacyRecordingsForMigrationWithContext:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v5 = [MEMORY[0x1E4F1C0A8] entityForName:@"EntityRevision" inManagedObjectContext:v3];
  [v4 setEntity:v5];

  [v4 setPropertiesToFetch:&unk_1F1F0DA80];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"revision_id" ascending:1];
  int v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
  [v4 setSortDescriptors:v6];

  id v7 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v29 = v4;
  id v8 = [v3 executeFetchRequest:v4 error:0];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "revisionID"));
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "recordingID"));
        [v7 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v10);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  long long v17 = [MEMORY[0x1E4F1C0A8] entityForName:@"Recording" inManagedObjectContext:v3];
  [v16 setEntity:v17];

  [v16 setPropertiesToFetch:&unk_1F1F0DA98];
  v30 = v3;
  long long v18 = [v3 executeFetchRequest:v16 error:0];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        v24 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v23, "recordingID"));
        v25 = [v7 objectForKeyedSubscript:v24];
        objc_msgSend(v23, "setRevisionID:", objc_msgSend(v25, "longLongValue"));
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v20);
  }
  v26 = [v18 sortedArrayUsingComparator:&__block_literal_global_4];

  return v26;
}

uint64_t __65__RCSavedRecording_fetchLegacyRecordingsForMigrationWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 revisionID];
  uint64_t v6 = [v4 revisionID];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

+ (id)legacyRecordingWithUniqueIDFetchRequest:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = a3;
  uint64_t v5 = [v3 fetchRequestWithEntityName:@"Recording"];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uniqueID", v4];

  [v5 setPredicate:v6];
  return v5;
}

- (int64_t)revisionID
{
  return self->revisionID;
}

- (void)setRevisionID:(int64_t)a3
{
  self->revisionID = a3;
}

- (void).cxx_destruct
{
}

@end