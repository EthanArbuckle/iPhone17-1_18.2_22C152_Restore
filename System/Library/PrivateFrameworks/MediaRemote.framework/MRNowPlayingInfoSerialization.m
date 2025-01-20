@interface MRNowPlayingInfoSerialization
@end

@implementation MRNowPlayingInfoSerialization

uint64_t ___MRNowPlayingInfoSerialization_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MRNowPlayingInfoSerialization___serialization;
  _MRNowPlayingInfoSerialization___serialization = v0;

  v2 = (void *)_MRNowPlayingInfoSerialization___serialization;
  v3 = _MRNowPlayingInfoDictionaryKeyToProtobufKeyMapping();
  [v2 setDictionaryKeyToProtobufKeyMapping:v3];

  [(id)_MRNowPlayingInfoSerialization___serialization setProtobufClass:objc_opt_class()];
  [(id)_MRNowPlayingInfoSerialization___serialization setDictionaryValueToProtobufValueTransformer:&__block_literal_global_227];
  v4 = (void *)_MRNowPlayingInfoSerialization___serialization;

  return [v4 setProtobufValueToDictionaryValueTransformer:&__block_literal_global_229];
}

id ___MRNowPlayingInfoSerialization_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"kMRMediaRemoteNowPlayingInfoStartTime"]
    || [v5 isEqualToString:@"kMRMediaRemoteNowPlayingInfoTimestamp"])
  {
    v7 = NSNumber;
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
LABEL_10:
    v11 = (void *)v8;

    id v6 = v11;
    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"kMRMediaRemoteNowPlayingInfoRepeatMode"]
    || [v5 isEqualToString:@"kMRMediaRemoteNowPlayingInfoShuffleMode"])
  {
    unsigned int v9 = [v6 unsignedIntValue];
    if (v9 - 1 >= 3) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v9;
    }
    uint64_t v8 = [NSNumber numberWithInt:v10];
    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

id ___MRNowPlayingInfoSerialization_block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  v7 = NSStringFromSelector(sel_timestamp);
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    unsigned int v9 = (void *)MEMORY[0x1E4F1C9C8];
    [v6 doubleValue];
    uint64_t v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
LABEL_9:
    v17 = (void *)v10;

    id v6 = v17;
    goto LABEL_10;
  }
  v11 = NSStringFromSelector(sel_repeatMode);
  int v12 = [v5 isEqualToString:v11];

  if (v12
    || (NSStringFromSelector(sel_shuffleMode),
        v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v5 isEqualToString:v13],
        v13,
        v14))
  {
    unsigned int v15 = [v6 unsignedIntValue];
    if (v15 - 1 >= 3) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v15;
    }
    uint64_t v10 = [NSNumber numberWithInt:v16];
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

@end