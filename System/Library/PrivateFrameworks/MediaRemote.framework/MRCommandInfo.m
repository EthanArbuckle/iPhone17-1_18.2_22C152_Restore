@interface MRCommandInfo
+ (BOOL)isCommandActuallySupportedEvenWhenDisabled:(unsigned int)a3;
+ (id)commandInfosFromData:(id)a3;
+ (id)dataFromCommandInfos:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (MRCommandInfo)initWithData:(id)a3;
- (MRCommandInfo)initWithPropertyListData:(id)a3;
- (MRCommandInfo)initWithProtobuf:(id)a3;
- (NSData)data;
- (NSData)propertyListData;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)options;
- (_MRCommandInfoProtobuf)protobuf;
- (id)description;
- (unint64_t)hash;
- (unsigned)command;
- (void)setCommand:(unsigned int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOptions:(id)a3;
@end

@implementation MRCommandInfo

- (void)setCommand:(unsigned int)a3
{
  self->_command = a3;
}

- (MRCommandInfo)initWithPropertyListData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)MRCommandInfo;
    v5 = [(MRCommandInfo *)&v15 init];
    if (v5)
    {
      v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
      v7 = [v6 objectForKeyedSubscript:@"kCommandInfoCommandKey"];
      v5->_command = [v7 integerValue];
      v8 = [v6 objectForKeyedSubscript:@"kCommandInfoEnabledKey"];
      v5->_enabled = [v8 BOOLValue];
      v9 = [v6 objectForKeyedSubscript:@"kCommandInfoOptionsKey"];
      v10 = v9;
      if (v9)
      {
        uint64_t v11 = [v9 copy];
        options = v5->_options;
        v5->_options = (NSDictionary *)v11;
      }
    }
    self = v5;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)commandInfosFromData:(id)a3
{
  if (a3)
  {
    id v4 = MRCreateArrayFromData(a3, &__block_literal_global_68);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setOptions:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRCommandInfo *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unsigned int v6 = [(MRCommandInfo *)v5 command];
      if (v6 == [(MRCommandInfo *)self command]
        && (BOOL v7 = [(MRCommandInfo *)v5 isEnabled], v7 == [(MRCommandInfo *)self isEnabled]))
      {
        v9 = [(MRCommandInfo *)v5 options];
        uint64_t v10 = [(MRCommandInfo *)self options];
        if (v9 == (void *)v10)
        {
          char v8 = 1;
          uint64_t v11 = v9;
        }
        else
        {
          uint64_t v11 = (void *)v10;
          v12 = [(MRCommandInfo *)v5 options];
          v13 = [(MRCommandInfo *)self options];
          char v8 = [v12 isEqualToDictionary:v13];
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = MRMediaRemoteCopyCommandDescription([(MRCommandInfo *)self command]);
  id v4 = [NSString alloc];
  uint64_t v5 = objc_opt_class();
  BOOL v6 = [(MRCommandInfo *)self isEnabled];
  BOOL v7 = [(MRCommandInfo *)self options];
  char v8 = (void *)[v4 initWithFormat:@"<%@: %p, %@, enabled = %d, options = %@>", v5, self, v3, v6, v7];

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = MRMediaRemoteCopyCommandDescription([(MRCommandInfo *)self command]);
  [v3 setObject:v4 forKeyedSubscript:@"command"];

  if ([(MRCommandInfo *)self isEnabled]) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  [v3 setObject:v5 forKeyedSubscript:@"enabled"];
  BOOL v6 = [(MRCommandInfo *)self options];
  [v3 setObject:v6 forKeyedSubscript:@"options"];

  return (NSDictionary *)v3;
}

- (NSData)propertyListData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MRCommandInfo command](self, "command"));
  [v3 setObject:v4 forKeyedSubscript:@"kCommandInfoCommandKey"];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[MRCommandInfo isEnabled](self, "isEnabled"));
  [v3 setObject:v5 forKeyedSubscript:@"kCommandInfoEnabledKey"];

  BOOL v6 = [(MRCommandInfo *)self options];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    char v8 = [(MRCommandInfo *)self options];
    [v3 setObject:v8 forKeyedSubscript:@"kCommandInfoOptionsKey"];
  }
  v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:0];

  return (NSData *)v9;
}

- (unsigned)command
{
  return self->_command;
}

- (NSDictionary)options
{
  return self->_options;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

+ (id)dataFromCommandInfos:(id)a3
{
  if (a3)
  {
    id v4 = MRCreateDataFromArray(a3, &__block_literal_global_15_0);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

MRCommandInfo *__38__MRCommandInfo_commandInfosFromData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[MRCommandInfo alloc] initWithPropertyListData:v2];

  return v3;
}

uint64_t __38__MRCommandInfo_dataFromCommandInfos___block_invoke(uint64_t a1, void *a2)
{
  return [a2 propertyListData];
}

- (MRCommandInfo)initWithProtobuf:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v85.receiver = self;
    v85.super_class = (Class)MRCommandInfo;
    uint64_t v5 = [(MRCommandInfo *)&v85 init];

    if (v5)
    {
      v5->_command = MRMediaRemoteCommandFromProtobuf([v4 command]);
      v5->_enabled = [v4 enabled];
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ([v4 preferredIntervalsCount])
      {
        uint64_t v7 = PBRepeatedDoubleNSArray();
        [v6 setObject:v7 forKeyedSubscript:@"kMRMediaRemoteCommandInfoPreferredIntervalsKey"];
      }
      if ([v4 hasActive])
      {
        char v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "active"));
        [v6 setObject:v8 forKeyedSubscript:@"kMRMediaRemoteCommandInfoIsActiveKey"];
      }
      if ([v4 hasLocalizedTitle])
      {
        v9 = [v4 localizedTitle];
        [v6 setObject:v9 forKeyedSubscript:@"kMRMediaRemoteCommandInfoLocalizedTitleKey"];
      }
      if ([v4 hasLocalizedShortTitle])
      {
        uint64_t v10 = [v4 localizedShortTitle];
        [v6 setObject:v10 forKeyedSubscript:@"kMRMediaRemoteCommandInfoLocalizedShortTitleKey"];
      }
      if ([v4 hasMinimumRating])
      {
        uint64_t v11 = NSNumber;
        [v4 minimumRating];
        v12 = objc_msgSend(v11, "numberWithFloat:");
        [v6 setObject:v12 forKeyedSubscript:@"kMRMediaRemoteCommandInfoMinimumRatingKey"];
      }
      if ([v4 hasMaximumRating])
      {
        v13 = NSNumber;
        [v4 maximumRating];
        v14 = objc_msgSend(v13, "numberWithFloat:");
        [v6 setObject:v14 forKeyedSubscript:@"kMRMediaRemoteCommandInfoMaximumRatingKey"];
      }
      if ([v4 supportedRatesCount])
      {
        objc_super v15 = PBRepeatedFloatNSArray();
        [v6 setObject:v15 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedPlaybackRates"];
      }
      if ([v4 hasRepeatMode])
      {
        v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "repeatMode"));
        [v6 setObject:v16 forKeyedSubscript:@"kMRMediaRemoteCommandInfoRepeatMode"];
      }
      if ([v4 hasShuffleMode])
      {
        v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "shuffleMode"));
        [v6 setObject:v17 forKeyedSubscript:@"kMRMediaRemoteCommandInfoShuffleMode"];
      }
      if ([v4 hasPresentationStyle])
      {
        v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "presentationStyle"));
        [v6 setObject:v18 forKeyedSubscript:@"kMRMediaRemoteCommandInfoPresentationStyleKey"];
      }
      if ([v4 hasSkipInterval])
      {
        v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "skipInterval"));
        [v6 setObject:v19 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSkipInterval"];
      }
      if ([v4 hasNumAvailableSkips])
      {
        v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "numAvailableSkips"));
        [v6 setObject:v20 forKeyedSubscript:@"kMRMediaRemoteCommandInfoNumberOfAvailableSkips"];
      }
      if ([v4 hasSkipFrequency])
      {
        v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "skipFrequency"));
        [v6 setObject:v21 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSkipFrequency"];
      }
      if ([v4 hasCanScrub])
      {
        v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "canScrub"));
        [v6 setObject:v22 forKeyedSubscript:@"kMRMediaRemoteCommandInfoCanBeControlledByScrubbingKey"];
      }
      if ([v4 supportedPlaybackQueueTypes])
      {
        v23 = PBRepeatedInt32NSArray();
        [v6 setObject:v23 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedPlaybackQueueTypes"];
      }
      v24 = [v4 supportedCustomQueueIdentifiers];

      if (v24)
      {
        v25 = [v4 supportedCustomQueueIdentifiers];
        [v6 setObject:v25 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedCustomPlaybackQueueIdentifiers"];
      }
      if ([v4 supportedInsertionPositions])
      {
        v26 = PBRepeatedInt32NSArray();
        [v6 setObject:v26 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedInsertionPositions"];
      }
      if ([v4 hasUpNextItemCount])
      {
        v27 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "upNextItemCount"));
        [v6 setObject:v27 forKeyedSubscript:@"kMRMediaRemoteCommandInfoUpNextItemCount"];
      }
      if ([v4 hasPreferredPlaybackRate])
      {
        v28 = NSNumber;
        [v4 preferredPlaybackRate];
        v29 = objc_msgSend(v28, "numberWithFloat:");
        [v6 setObject:v29 forKeyedSubscript:@"kMRMediaRemoteCommandInfoPreferredPlaybackRate"];
      }
      v30 = [v4 supportedPlaybackSessionTypes];

      if (v30)
      {
        v31 = [v4 supportedPlaybackSessionTypes];
        [v6 setObject:v31 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedPlaybackSessionTypes"];
      }
      v32 = [v4 currentPlaybackSessionTypes];

      if (v32)
      {
        v33 = [v4 currentPlaybackSessionTypes];
        [v6 setObject:v33 forKeyedSubscript:@"kMRMediaRemoteCommandInfoCurrentPlaybackSessionTypes"];
      }
      v34 = [v4 playbackSessionIdentifier];

      if (v34)
      {
        v35 = [v4 playbackSessionIdentifier];
        [v6 setObject:v35 forKeyedSubscript:@"kMRMediaRemoteCommandInfoPlaybackSessionIdentifier"];
      }
      if ([v4 currentQueueEndAction])
      {
        v36 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "currentQueueEndAction"));
        [v6 setObject:v36 forKeyedSubscript:@"kMRMediaRemoteCommandInfoCurrentQueueEndAction"];
      }
      if ([v4 supportedQueueEndActions])
      {
        v37 = PBRepeatedInt32NSArray();
        [v6 setObject:v37 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedQueueEndActions"];
      }
      v38 = [v4 proactiveCommandOptions];

      if (v38)
      {
        v39 = [v4 proactiveCommandOptions];
        v40 = MRMediaRemoteCommandOptionsFromProtobuf(v39);
        [v6 setObject:v40 forKeyedSubscript:@"kMRMediaRemoteCommandInfoProactiveCommandOptions"];
      }
      if ([v4 hasDisabledReason])
      {
        v41 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "disabledReason"));
        [v6 setObject:v41 forKeyedSubscript:@"kMRMediaRemoteCommandInfoDisabledReason"];
      }
      if ([v4 hasVocalsControlActive])
      {
        v42 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "vocalsControlActive"));
        [v6 setObject:v42 forKeyedSubscript:@"kMRMediaRemoteCommandInfoVocalsControlActive"];
      }
      if ([v4 hasVocalsControlLevel])
      {
        v43 = NSNumber;
        [v4 vocalsControlLevel];
        v44 = objc_msgSend(v43, "numberWithFloat:");
        [v6 setObject:v44 forKeyedSubscript:@"kMRMediaRemoteCommandInfoVocalsControlLevel"];
      }
      if ([v4 hasVocalsControlContinuous])
      {
        v45 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "vocalsControlContinuous"));
        [v6 setObject:v45 forKeyedSubscript:@"kMRMediaRemoteCommandInfoVocalsControlContinuous"];
      }
      if ([v4 hasVocalsControlMaxLevel])
      {
        v46 = NSNumber;
        [v4 vocalsControlMaxLevel];
        v47 = objc_msgSend(v46, "numberWithFloat:");
        [v6 setObject:v47 forKeyedSubscript:@"kMRMediaRemoteCommandInfoVocalsControlMaxLevel"];
      }
      if ([v4 hasVocalsControlMinLevel])
      {
        v48 = NSNumber;
        [v4 vocalsControlMinLevel];
        v49 = objc_msgSend(v48, "numberWithFloat:");
        [v6 setObject:v49 forKeyedSubscript:@"kMRMediaRemoteCommandInfoVocalsControlMinLevel"];
      }
      if ([v4 hasSleepTimerTime])
      {
        v50 = NSNumber;
        [v4 sleepTimerTime];
        v51 = objc_msgSend(v50, "numberWithDouble:");
        [v6 setObject:v51 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSleepTimerTime"];
      }
      if ([v4 hasSleepTimerStopMode])
      {
        v52 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "sleepTimerStopMode"));
        [v6 setObject:v52 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSleepTimerStopMode"];
      }
      if ([v4 hasSleepTimerFireDate])
      {
        v53 = NSNumber;
        [v4 sleepTimerFireDate];
        v54 = objc_msgSend(v53, "numberWithDouble:");
        [v6 setObject:v54 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSleepTimerFireDate"];
      }
      if ([v4 hasLastSectionContentItemID])
      {
        v55 = [v4 lastSectionContentItemID];
        [v6 setObject:v55 forKeyedSubscript:@"kMRMediaRemoteCommandInfoLastSectionContentItemID"];
      }
      if ([v4 hasDialogOptions])
      {
        v56 = [v4 dialogOptions];
        v57 = _MRProtoUtilsNSDictionaryFromProtoDictionary(v56);
        [v6 setObject:v57 forKeyedSubscript:@"kMRMediaRemoteCommandInfoDialogOptions"];
      }
      if ([v4 hasSupportsReferencePosition])
      {
        v58 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "supportsReferencePosition"));
        [v6 setObject:v58 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportsReferencePosition"];
      }
      v59 = [v4 supportedPlaybackSessionIdentifiers];

      if (v59)
      {
        v78 = v6;
        v79 = v5;
        v60 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v80 = v4;
        v61 = [v4 supportedPlaybackSessionIdentifiers];
        uint64_t v62 = [v61 countByEnumeratingWithState:&v81 objects:v86 count:16];
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v63; ++i)
            {
              if (*(void *)v82 != v64) {
                objc_enumerationMutation(v61);
              }
              v66 = *(void **)(*((void *)&v81 + 1) + 8 * i);
              v67 = [v66 playbackSessionIdentifier];

              if (v67)
              {
                v68 = [MEMORY[0x1E4F1CA60] dictionary];
                v69 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v66, "playbackSessionPriority"));
                [v68 setObject:v69 forKeyedSubscript:@"kMRMediaRemoteCommandInfoPlaybackSessionPriority"];

                v70 = [v66 playbackSessionRevision];
                [v68 setObject:v70 forKeyedSubscript:@"kMRMediaRemoteCommandInfoPlaybackSessionRevision"];

                v71 = (void *)[v68 copy];
                v72 = [v66 playbackSessionIdentifier];
                [v60 setObject:v71 forKeyedSubscript:v72];
              }
            }
            uint64_t v63 = [v61 countByEnumeratingWithState:&v81 objects:v86 count:16];
          }
          while (v63);
        }

        v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v60];
        id v6 = v78;
        [v78 setObject:v73 forKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedPlaybackSessionIdentifiers"];

        uint64_t v5 = v79;
        id v4 = v80;
      }
      if ([v6 count])
      {
        uint64_t v74 = [v6 copy];
        options = v5->_options;
        v5->_options = (NSDictionary *)v74;
      }
    }
    self = v5;
    v76 = self;
  }
  else
  {
    v76 = 0;
  }

  return v76;
}

- (_MRCommandInfoProtobuf)protobuf
{
  uint64_t v206 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(_MRCommandInfoProtobuf);
  uint64_t v4 = MRMediaRemoteCommandToProtobuf([(MRCommandInfo *)self command]);
  if ((int)v4 >= 1) {
    [(_MRCommandInfoProtobuf *)v3 setCommand:v4];
  }
  if ([(MRCommandInfo *)self isEnabled]) {
    [(_MRCommandInfoProtobuf *)v3 setEnabled:1];
  }
  uint64_t v5 = [(MRCommandInfo *)self options];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(MRCommandInfo *)self options];
    char v8 = [v7 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoPreferredIntervalsKey"];

    long long v198 = 0u;
    long long v199 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v196 objects:v205 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v197;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v197 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v196 + 1) + 8 * i) doubleValue];
          -[_MRCommandInfoProtobuf addPreferredInterval:](v3, "addPreferredInterval:");
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v196 objects:v205 count:16];
      }
      while (v11);
    }

    v14 = [(MRCommandInfo *)self options];
    objc_super v15 = [v14 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoIsActiveKey"];

    if (v15) {
      -[_MRCommandInfoProtobuf setActive:](v3, "setActive:", [v15 BOOLValue]);
    }
    v16 = [(MRCommandInfo *)self options];
    v17 = [v16 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoLocalizedShortTitleKey"];

    v174 = v17;
    if ([v17 length])
    {
      [(_MRCommandInfoProtobuf *)v3 setLocalizedShortTitle:v17];
    }
    else
    {
      v18 = [(MRCommandInfo *)self options];
      v19 = [v18 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoLocalizedTitleKey"];

      if ([v19 length]) {
        [(_MRCommandInfoProtobuf *)v3 setLocalizedTitle:v19];
      }
    }
    v20 = [(MRCommandInfo *)self options];
    v21 = [v20 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoMinimumRatingKey"];

    if (v21)
    {
      [v21 floatValue];
      -[_MRCommandInfoProtobuf setMinimumRating:](v3, "setMinimumRating:");
    }
    v22 = [(MRCommandInfo *)self options];
    v23 = [v22 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoMaximumRatingKey"];

    if (v23)
    {
      [v23 floatValue];
      -[_MRCommandInfoProtobuf setMaximumRating:](v3, "setMaximumRating:");
    }
    v24 = [(MRCommandInfo *)self options];
    v25 = [v24 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedPlaybackRates"];

    long long v194 = 0u;
    long long v195 = 0u;
    long long v192 = 0u;
    long long v193 = 0u;
    id v26 = v25;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v192 objects:v204 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v193;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v193 != v29) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v192 + 1) + 8 * j) floatValue];
          -[_MRCommandInfoProtobuf addSupportedRate:](v3, "addSupportedRate:");
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v192 objects:v204 count:16];
      }
      while (v28);
    }

    v31 = [(MRCommandInfo *)self options];
    v32 = [v31 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoShuffleMode"];

    if (v32) {
      -[_MRCommandInfoProtobuf setShuffleMode:](v3, "setShuffleMode:", [v32 unsignedIntegerValue]);
    }
    v166 = v32;
    v33 = [(MRCommandInfo *)self options];
    v34 = [v33 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoRepeatMode"];

    if (v34) {
      -[_MRCommandInfoProtobuf setRepeatMode:](v3, "setRepeatMode:", [v34 unsignedIntegerValue]);
    }
    v165 = v34;
    v35 = [(MRCommandInfo *)self options];
    v36 = [v35 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoPresentationStyleKey"];

    if (v36) {
      -[_MRCommandInfoProtobuf setPresentationStyle:](v3, "setPresentationStyle:", [v36 intValue]);
    }
    v164 = v36;
    v37 = [(MRCommandInfo *)self options];
    v38 = [v37 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSkipInterval"];

    if (v38) {
      -[_MRCommandInfoProtobuf setSkipInterval:](v3, "setSkipInterval:", [v38 intValue]);
    }
    v163 = v38;
    v39 = [(MRCommandInfo *)self options];
    v40 = [v39 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoNumberOfAvailableSkips"];

    if (v40) {
      -[_MRCommandInfoProtobuf setNumAvailableSkips:](v3, "setNumAvailableSkips:", [v40 intValue]);
    }
    v162 = v40;
    v41 = [(MRCommandInfo *)self options];
    v42 = [v41 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSkipFrequency"];

    if (v42) {
      -[_MRCommandInfoProtobuf setSkipFrequency:](v3, "setSkipFrequency:", [v42 intValue]);
    }
    v161 = v42;
    v43 = [(MRCommandInfo *)self options];
    v44 = [v43 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoCanBeControlledByScrubbingKey"];

    if (v44) {
      -[_MRCommandInfoProtobuf setCanScrub:](v3, "setCanScrub:", [v44 intValue]);
    }
    v160 = v44;
    v45 = [(MRCommandInfo *)self options];
    v46 = [v45 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedPlaybackQueueTypes"];

    id v175 = v26;
    v171 = v46;
    if (v46)
    {
      long long v190 = 0u;
      long long v191 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      id v47 = v46;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v188 objects:v203 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v189;
        do
        {
          for (uint64_t k = 0; k != v49; ++k)
          {
            if (*(void *)v189 != v50) {
              objc_enumerationMutation(v47);
            }
            -[_MRCommandInfoProtobuf addSupportedPlaybackQueueTypes:](v3, "addSupportedPlaybackQueueTypes:", [*(id *)(*((void *)&v188 + 1) + 8 * k) intValue]);
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v188 objects:v203 count:16];
        }
        while (v49);
      }

      id v26 = v175;
    }
    v52 = [(MRCommandInfo *)self options];
    v53 = [v52 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedCustomPlaybackQueueIdentifiers"];

    if (v53)
    {
      v54 = (void *)[v53 mutableCopy];
      [(_MRCommandInfoProtobuf *)v3 setSupportedCustomQueueIdentifiers:v54];
    }
    v55 = [(MRCommandInfo *)self options];
    v56 = [v55 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedInsertionPositions"];

    v159 = v53;
    v170 = v56;
    if (v56)
    {
      long long v186 = 0u;
      long long v187 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      id v57 = v56;
      uint64_t v58 = [v57 countByEnumeratingWithState:&v184 objects:v202 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v185;
        do
        {
          for (uint64_t m = 0; m != v59; ++m)
          {
            if (*(void *)v185 != v60) {
              objc_enumerationMutation(v57);
            }
            -[_MRCommandInfoProtobuf addSupportedInsertionPositions:](v3, "addSupportedInsertionPositions:", [*(id *)(*((void *)&v184 + 1) + 8 * m) intValue]);
          }
          uint64_t v59 = [v57 countByEnumeratingWithState:&v184 objects:v202 count:16];
        }
        while (v59);
      }

      id v26 = v175;
    }
    v172 = v23;
    uint64_t v62 = v21;
    uint64_t v63 = v15;
    uint64_t v64 = [(MRCommandInfo *)self options];
    v65 = [v64 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoUpNextItemCount"];

    if (v65) {
      -[_MRCommandInfoProtobuf setUpNextItemCount:](v3, "setUpNextItemCount:", [v65 intValue]);
    }
    v66 = [(MRCommandInfo *)self options];
    v67 = [v66 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoPreferredPlaybackRate"];

    if (v67)
    {
      [v67 floatValue];
      -[_MRCommandInfoProtobuf setPreferredPlaybackRate:](v3, "setPreferredPlaybackRate:");
    }
    v157 = v67;
    v68 = [(MRCommandInfo *)self options];
    v69 = [v68 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedPlaybackSessionTypes"];

    v70 = v63;
    if (v69)
    {
      v71 = (void *)[v69 mutableCopy];
      [(_MRCommandInfoProtobuf *)v3 setSupportedPlaybackSessionTypes:v71];
    }
    v156 = v69;
    v72 = [(MRCommandInfo *)self options];
    v73 = [v72 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoCurrentPlaybackSessionTypes"];

    uint64_t v74 = v62;
    if (v73)
    {
      v75 = (void *)[v73 mutableCopy];
      [(_MRCommandInfoProtobuf *)v3 setCurrentPlaybackSessionTypes:v75];
    }
    v169 = v73;
    v76 = v70;
    v77 = [(MRCommandInfo *)self options];
    uint64_t v78 = [v77 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoPlaybackSessionIdentifier"];

    if (v78) {
      [(_MRCommandInfoProtobuf *)v3 setPlaybackSessionIdentifier:v78];
    }
    v155 = (void *)v78;
    v79 = [(MRCommandInfo *)self options];
    id v80 = [v79 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoProactiveCommandOptions"];

    if (v80)
    {
      long long v81 = MRMediaRemoteCommandOptionsToProtobuf(v80);
      [(_MRCommandInfoProtobuf *)v3 setProactiveCommandOptions:v81];
    }
    v154 = v80;
    v158 = v65;
    v167 = v76;
    if ([(MRCommandInfo *)self command] == 135)
    {
      long long v82 = v74;
      long long v83 = [(MRCommandInfo *)self options];
      long long v84 = [v83 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoCurrentQueueEndAction"];

      -[_MRCommandInfoProtobuf setCurrentQueueEndAction:](v3, "setCurrentQueueEndAction:", [v84 intValue]);
      objc_super v85 = [(MRCommandInfo *)self options];
      v86 = [v85 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedQueueEndActions"];

      long long v182 = 0u;
      long long v183 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      id v87 = v86;
      uint64_t v88 = [v87 countByEnumeratingWithState:&v180 objects:v201 count:16];
      if (v88)
      {
        uint64_t v89 = v88;
        uint64_t v90 = *(void *)v181;
        do
        {
          for (uint64_t n = 0; n != v89; ++n)
          {
            if (*(void *)v181 != v90) {
              objc_enumerationMutation(v87);
            }
            -[_MRCommandInfoProtobuf addSupportedQueueEndActions:](v3, "addSupportedQueueEndActions:", [*(id *)(*((void *)&v180 + 1) + 8 * n) intValue]);
          }
          uint64_t v89 = [v87 countByEnumeratingWithState:&v180 objects:v201 count:16];
        }
        while (v89);
      }

      uint64_t v74 = v82;
      v76 = v167;
      id v26 = v175;
    }
    v173 = v74;
    v92 = [(MRCommandInfo *)self options];
    v93 = [v92 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoDisabledReason"];

    if (v93) {
      -[_MRCommandInfoProtobuf setDisabledReason:](v3, "setDisabledReason:", [v93 intValue]);
    }
    v94 = [(MRCommandInfo *)self options];
    v95 = [v94 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoVocalsControlActive"];

    if (v95) {
      -[_MRCommandInfoProtobuf setVocalsControlActive:](v3, "setVocalsControlActive:", [v95 BOOLValue]);
    }
    v96 = [(MRCommandInfo *)self options];
    v97 = [v96 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoVocalsControlLevel"];

    if (v97)
    {
      [v97 floatValue];
      -[_MRCommandInfoProtobuf setVocalsControlLevel:](v3, "setVocalsControlLevel:");
    }
    v152 = v97;
    v98 = [(MRCommandInfo *)self options];
    v99 = [v98 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoVocalsControlMaxLevel"];

    if (v95)
    {
      [v99 floatValue];
      -[_MRCommandInfoProtobuf setVocalsControlMaxLevel:](v3, "setVocalsControlMaxLevel:");
    }
    v151 = v99;
    v100 = [(MRCommandInfo *)self options];
    v101 = [v100 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoVocalsControlMinLevel"];

    if (v101)
    {
      [v101 floatValue];
      -[_MRCommandInfoProtobuf setVocalsControlMinLevel:](v3, "setVocalsControlMinLevel:");
    }
    v168 = v93;
    v150 = v101;
    v102 = [(MRCommandInfo *)self options];
    uint64_t v103 = [v102 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoVocalsControlContinuous"];

    v104 = (void *)v103;
    v105 = v76;
    if (v104) {
      -[_MRCommandInfoProtobuf setVocalsControlContinuous:](v3, "setVocalsControlContinuous:", [v104 BOOLValue]);
    }
    v149 = v104;
    v106 = [(MRCommandInfo *)self options];
    v107 = [v106 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSleepTimerTime"];

    if (v107)
    {
      [v107 doubleValue];
      -[_MRCommandInfoProtobuf setSleepTimerTime:](v3, "setSleepTimerTime:");
    }
    v153 = v95;
    v148 = v107;
    v108 = [(MRCommandInfo *)self options];
    v109 = [v108 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSleepTimerStopMode"];

    if (v109) {
      -[_MRCommandInfoProtobuf setSleepTimerStopMode:](v3, "setSleepTimerStopMode:", [v109 unsignedIntegerValue]);
    }
    v110 = v105;
    v147 = v109;
    v111 = [(MRCommandInfo *)self options];
    v112 = [v111 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSleepTimerFireDate"];

    if (v112)
    {
      [v112 doubleValue];
      -[_MRCommandInfoProtobuf setSleepTimerFireDate:](v3, "setSleepTimerFireDate:");
    }
    v113 = [(MRCommandInfo *)self options];
    uint64_t v114 = [v113 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoLastSectionContentItemID"];

    if (v114) {
      [(_MRCommandInfoProtobuf *)v3 setLastSectionContentItemID:v114];
    }
    v146 = (void *)v114;
    v115 = [(MRCommandInfo *)self options];
    v116 = [v115 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoDialogOptions"];

    v117 = v110;
    if (v116)
    {
      v118 = _MRProtoUtilsProtoDictionaryFromNSDictionary(v116);
      [(_MRCommandInfoProtobuf *)v3 setDialogOptions:v118];
    }
    v145 = v116;
    v119 = [(MRCommandInfo *)self options];
    v120 = [v119 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportsReferencePosition"];

    v121 = v173;
    if (v120) {
      -[_MRCommandInfoProtobuf setSupportsReferencePosition:](v3, "setSupportsReferencePosition:", [v120 BOOLValue]);
    }
    v144 = v120;
    v122 = [(MRCommandInfo *)self options];
    uint64_t v123 = [v122 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoSupportedPlaybackSessionIdentifiers"];

    v124 = (void *)v123;
    v125 = v174;
    v126 = v169;
    v127 = v172;
    if (v124)
    {
      id v143 = v9;
      v128 = v124;
      v129 = objc_opt_new();
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      long long v179 = 0u;
      v142 = v128;
      id v130 = v128;
      uint64_t v131 = [v130 countByEnumeratingWithState:&v176 objects:v200 count:16];
      if (v131)
      {
        uint64_t v132 = v131;
        uint64_t v133 = *(void *)v177;
        do
        {
          for (iuint64_t i = 0; ii != v132; ++ii)
          {
            if (*(void *)v177 != v133) {
              objc_enumerationMutation(v130);
            }
            uint64_t v135 = *(void *)(*((void *)&v176 + 1) + 8 * ii);
            v136 = objc_msgSend(v130, "objectForKeyedSubscript:", v135, v142);
            v137 = objc_alloc_init(_MRPreloadedPlaybackSessionInfo);
            [(_MRPreloadedPlaybackSessionInfo *)v137 setPlaybackSessionIdentifier:v135];
            v138 = [v136 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoPlaybackSessionPriority"];
            -[_MRPreloadedPlaybackSessionInfo setPlaybackSessionPriority:](v137, "setPlaybackSessionPriority:", [v138 intValue]);

            v139 = [v136 objectForKeyedSubscript:@"kMRMediaRemoteCommandInfoPlaybackSessionRevision"];
            [(_MRPreloadedPlaybackSessionInfo *)v137 setPlaybackSessionRevision:v139];

            [v129 addObject:v137];
          }
          uint64_t v132 = [v130 countByEnumeratingWithState:&v176 objects:v200 count:16];
        }
        while (v132);
      }

      [(_MRCommandInfoProtobuf *)v3 setSupportedPlaybackSessionIdentifiers:v129];
      id v9 = v143;
      v117 = v167;
      v93 = v168;
      v121 = v173;
      v125 = v174;
      v127 = v172;
      id v26 = v175;
      v126 = v169;
      v124 = v142;
    }
  }
  v140 = v3;

  return v140;
}

- (MRCommandInfo)initWithData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [[_MRCommandInfoProtobuf alloc] initWithData:v4];
    uint64_t v6 = [(MRCommandInfo *)self initWithProtobuf:v5];
  }
  else
  {
    uint64_t v6 = [(MRCommandInfo *)self initWithProtobuf:0];
  }

  return v6;
}

- (NSData)data
{
  id v2 = [(MRCommandInfo *)self protobuf];
  uint64_t v3 = [v2 data];

  return (NSData *)v3;
}

- (unint64_t)hash
{
  unsigned int v3 = [(MRCommandInfo *)self command];
  if ([(MRCommandInfo *)self isEnabled]) {
    int v4 = 0x1000000;
  }
  else {
    int v4 = 0;
  }
  return v4 | v3;
}

+ (BOOL)isCommandActuallySupportedEvenWhenDisabled:(unsigned int)a3
{
  return a3 - 17 < 2;
}

@end