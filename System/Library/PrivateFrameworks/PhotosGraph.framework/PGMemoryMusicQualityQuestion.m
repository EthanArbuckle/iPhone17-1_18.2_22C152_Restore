@interface PGMemoryMusicQualityQuestion
- (PGMemoryMusicQualityQuestion)initWithMemory:(id)a3 withSongInfo:(id)a4 localFactoryScore:(double)a5;
- (double)localFactoryScore;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
@end

@implementation PGMemoryMusicQualityQuestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
}

- (unsigned)state
{
  return self->_state;
}

- (double)localFactoryScore
{
  return self->_localFactoryScore;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (unsigned)entityType
{
  return 2;
}

- (unsigned)displayType
{
  return 5;
}

- (unsigned)type
{
  return 15;
}

- (PGMemoryMusicQualityQuestion)initWithMemory:(id)a3 withSongInfo:(id)a4 localFactoryScore:(double)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PGMemoryMusicQualityQuestion;
  v10 = [(PGMemoryMusicQualityQuestion *)&v31 init];
  if (v10)
  {
    uint64_t v11 = [v8 uuid];
    entityIdentifier = v10->_entityIdentifier;
    v10->_entityIdentifier = (NSString *)v11;

    v10->_state = 0;
    v10->_localFactoryScore = a5;
    v13 = PLStoryGetLog();
    v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v9;
        _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_DEBUG, "[MusicQualityQuestion] songInfo: %@", buf, 0xCu);
      }

      v32[0] = *MEMORY[0x1E4F8E9E8];
      v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "category"));
      v33[0] = v14;
      v32[1] = *MEMORY[0x1E4F8E9F0];
      v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "subcategory"));
      v33[1] = v15;
      v32[2] = *MEMORY[0x1E4F8EA08];
      uint64_t v16 = objc_msgSend(v9, "objectForKeyedSubscript:");
      v17 = (void *)v16;
      if (v16) {
        v18 = (__CFString *)v16;
      }
      else {
        v18 = @"Unknown";
      }
      v33[2] = v18;
      v32[3] = *MEMORY[0x1E4F8EA10];
      uint64_t v19 = objc_msgSend(v9, "objectForKeyedSubscript:");
      v20 = (void *)v19;
      if (v19) {
        v21 = (__CFString *)v19;
      }
      else {
        v21 = @"Unknown";
      }
      v33[3] = v21;
      v32[4] = *MEMORY[0x1E4F8E9F8];
      uint64_t v22 = objc_msgSend(v9, "objectForKeyedSubscript:");
      v23 = (void *)v22;
      if (v22) {
        v24 = (__CFString *)v22;
      }
      else {
        v24 = @"Unknown";
      }
      v33[4] = v24;
      v32[5] = *MEMORY[0x1E4F8EA00];
      uint64_t v25 = objc_msgSend(v9, "objectForKeyedSubscript:");
      v26 = (void *)v25;
      if (v25) {
        v27 = (__CFString *)v25;
      }
      else {
        v27 = @"Unknown";
      }
      v33[5] = v27;
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:6];
      additionalInfo = v10->_additionalInfo;
      v10->_additionalInfo = (NSDictionary *)v28;
    }
    else
    {
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        goto LABEL_22;
      }
      v15 = [v8 uuid];
      *(_DWORD *)buf = 138412290;
      id v35 = v15;
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "[MusicQualityQuestion] Unable to extract songInfo for memory %@", buf, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_22:

  return v10;
}

@end