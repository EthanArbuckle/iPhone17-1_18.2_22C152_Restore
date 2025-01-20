@interface ICRadioGetTracksResponse
- (ICRadioGetTracksResponse)initWithResponseDictionary:(id)a3 expirationDate:(id)a4;
- (ICRadioStationMetadata)stationMetadata;
- (NSArray)tracks;
- (NSDate)assetExpirationDate;
- (int64_t)tracklistActionType;
@end

@implementation ICRadioGetTracksResponse

- (void).cxx_destruct
{
}

- (NSDate)assetExpirationDate
{
  return self->_assetExpirationDate;
}

- (NSArray)tracks
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(ICRadioResponse *)self contentDictionary];
  v4 = [v3 objectForKey:@"station-track-dict"];

  if (!_NSIsNSDictionary()) {
    goto LABEL_19;
  }
  v5 = [v4 allValues];
  v6 = [v5 firstObject];

  if (!_NSIsNSArray() || ![v6 count])
  {

LABEL_19:
    id v10 = 0;
    goto LABEL_20;
  }
  v16 = v4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          v14 = [[ICRadioStationTrack alloc] initWithResponseDictionary:v13 responseVersion:[(ICRadioResponse *)self version] expirationDate:self->_assetExpirationDate];
          if (v14)
          {
            if (!v10) {
              id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v10 addObject:v14];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  v4 = v16;
LABEL_20:

  return (NSArray *)v10;
}

- (int64_t)tracklistActionType
{
  v2 = [(ICRadioResponse *)self contentDictionary];
  v3 = [v2 objectForKey:@"tracklist-action-type"];

  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (ICRadioStationMetadata)stationMetadata
{
  v2 = [(ICRadioResponse *)self contentDictionary];
  v3 = [v2 objectForKey:@"station-dict"];

  if (_NSIsNSDictionary()) {
    int64_t v4 = [[ICRadioStationMetadata alloc] initWithResponseDictionary:v3];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (ICRadioGetTracksResponse)initWithResponseDictionary:(id)a3 expirationDate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICRadioGetTracksResponse;
  id v7 = [(ICRadioResponse *)&v10 initWithResponseDictionary:a3 expirationDate:v6];
  if (v7)
  {
    uint64_t v8 = v6;
    if (!v6)
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:10800.0];
    }
    objc_storeStrong((id *)&v7->_assetExpirationDate, v8);
    if (!v6) {
  }
    }
  return v7;
}

@end