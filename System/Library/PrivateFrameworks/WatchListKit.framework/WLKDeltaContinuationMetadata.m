@interface WLKDeltaContinuationMetadata
+ (int64_t)_deltaTypeForString:(id)a3;
- (NSString)adamID;
- (NSURL)playbackURL;
- (WLKDeltaContinuationMetadata)initWithDictionary:(id)a3 context:(id)a4;
- (int64_t)deltaType;
@end

@implementation WLKDeltaContinuationMetadata

- (WLKDeltaContinuationMetadata)initWithDictionary:(id)a3 context:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WLKDeltaContinuationMetadata;
  v7 = [(WLKContinuationMetadataBase *)&v15 initWithDictionary:v6 context:a4];
  if (v7)
  {
    v8 = objc_msgSend(v6, "wlk_stringForKey:", @"changeType");
    v7->_deltaType = [(id)objc_opt_class() _deltaTypeForString:v8];
    v9 = objc_msgSend(v6, "wlk_stringForKey:", @"playableUrl");
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
      playbackURL = v7->_playbackURL;
      v7->_playbackURL = (NSURL *)v10;
    }
    uint64_t v12 = objc_msgSend(v6, "wlk_stringForKey:", @"adamId");
    adamID = v7->_adamID;
    v7->_adamID = (NSString *)v12;
  }
  return v7;
}

+ (int64_t)_deltaTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Add"]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = [v3 isEqualToString:@"Remove"];
  }

  return v4;
}

- (int64_t)deltaType
{
  return self->_deltaType;
}

- (NSURL)playbackURL
{
  return self->_playbackURL;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamID, 0);

  objc_storeStrong((id *)&self->_playbackURL, 0);
}

@end