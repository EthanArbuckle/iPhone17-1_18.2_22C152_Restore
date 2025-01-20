@interface PCMediaActivity
+ (id)titleForContentItem:(id)a3;
+ (id)userActivityInfoFor:(id)a3 inContext:(id)a4;
- (BOOL)destinationOriginExists;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (PCMediaActivity)initWithActivity:(id)a3;
- (PCMediaActivity)initWithDisplayContext:(id)a3 response:(id)a4;
- (id)activityString;
- (id)artWork;
- (id)bundleIdentifier;
- (id)description;
- (id)shortDescription;
- (int64_t)behavior;
- (int64_t)direction;
- (int64_t)mediaType;
- (unint64_t)pcactivityType;
- (unsigned)playbackState;
@end

@implementation PCMediaActivity

- (PCMediaActivity)initWithDisplayContext:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PCMediaActivity;
  v8 = [(PCMediaActivity *)&v16 initWithActivityType:@"com.apple.ProximityControl.activity.media"];
  v9 = v8;
  if (v8)
  {
    makeIneligibleForProcessing(v8);
    v10 = [v7 playbackQueue];
    v11 = [v10 contentItemWithOffset:0];
    v12 = +[PCMediaActivity titleForContentItem:v11];
    [(PCMediaActivity *)v9 setTitle:v12];

    v13 = +[PCMediaActivity userActivityInfoFor:v7 inContext:v6];
    v14 = (void *)[v13 copy];
    [(PCMediaActivity *)v9 setUserInfo:v14];
  }
  return v9;
}

+ (id)userActivityInfoFor:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [v5 playbackQueue];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 contentItemWithOffset:0];
    if (v10)
    {
      uint64_t v11 = [v5 playbackState];
      v12 = [NSNumber numberWithUnsignedInt:v11];
      [v7 setObject:v12 forKey:@"playbackState"];

      v13 = [v5 destination];
      v14 = [v13 origin];
      BOOL v15 = v14 != 0;

      objc_super v16 = [NSNumber numberWithBool:v15];
      [v7 setObject:v16 forKey:@"destinationOriginExists"];

      v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "interactionDirection"));
      [v7 setObject:v17 forKey:@"mediaDirection"];

      v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "interactionBehavior"));
      [v7 setObject:v18 forKey:@"mediaBehavior"];

      v19 = [v10 artwork];
      v20 = [v19 imageData];

      if (v20) {
        [v7 setObject:v20 forKey:@"artworkKey"];
      }

      v21 = [v10 metadata];
      v22 = [v21 userInfo];

      if (v22) {
        [v7 setObject:v22 forKey:@"metadataKey"];
      }

      v23 = [v5 playerPath];
      v24 = [v23 client];
      v25 = [v24 bundleIdentifier];

      if (v25) {
        [v7 setObject:v25 forKey:@"bundleIdentifierKey"];
      }

      v26 = [v10 metadata];
      v27 = [v26 title];

      if (v27) {
        [v7 setObject:v27 forKey:@"mediaTitle"];
      }

      v28 = [v10 metadata];
      uint64_t v29 = [v28 mediaType];

      if (v29)
      {
        v30 = [NSNumber numberWithInteger:v29];
        [v7 setObject:v30 forKey:@"mediaType"];
      }
      v31 = (void *)[v7 copy];
    }
    else
    {
      v31 = 0;
    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (id)titleForContentItem:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v10 = +[PCLocalizedString localizedStringForKey:6];
    goto LABEL_13;
  }
  id v5 = [v3 metadata];
  id v6 = [v5 trackArtistName];

  id v7 = [v4 metadata];
  v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 trackArtistName];
  }
  else
  {
    uint64_t v11 = [v7 albumArtistName];

    v12 = [v4 metadata];
    v8 = v12;
    if (v11)
    {
      uint64_t v9 = [v12 albumArtistName];
    }
    else
    {
      v13 = [v12 radioStationName];

      if (!v13)
      {
LABEL_11:
        v14 = [v4 metadata];
        v10 = [v14 localizedTitle];
        goto LABEL_12;
      }
      v8 = [v4 metadata];
      uint64_t v9 = [v8 radioStationName];
    }
  }
  v14 = (void *)v9;

  if (!v14) {
    goto LABEL_11;
  }
  BOOL v15 = +[PCLocalizedString localizedStringForKey:7];
  objc_super v16 = NSString;
  v17 = [v4 metadata];
  v18 = [v17 localizedTitle];
  v10 = [v16 stringWithFormat:@"%@%@%@", v18, v15, v14];

LABEL_12:
LABEL_13:

  return v10;
}

- (PCMediaActivity)initWithActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activityType];
  int v6 = [@"com.apple.ProximityControl.activity.media" isEqualToString:v5];

  if (v6)
  {
    id v7 = [v4 activityType];
    v13.receiver = self;
    v13.super_class = (Class)PCMediaActivity;
    v8 = [(PCMediaActivity *)&v13 initWithActivityType:v7];

    if (v8)
    {
      makeIneligibleForProcessing(v8);
      uint64_t v9 = [v4 userInfo];
      [(PCMediaActivity *)v8 setUserInfo:v9];

      v10 = [v4 title];
      [(PCMediaActivity *)v8 setTitle:v10];
    }
    self = v8;
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)description
{
  id v3 = [(PCMediaActivity *)self title];

  if (v3) {
    [(PCMediaActivity *)self title];
  }
  else {
  id v4 = +[PCLocalizedString localizedStringForKey:6];
  }
  return v4;
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)pcactivityType
{
  return 1;
}

- (id)activityString
{
  if ([(PCMediaActivity *)self playbackState] == 1) {
    uint64_t v2 = 9;
  }
  else {
    uint64_t v2 = 10;
  }
  id v3 = +[PCLocalizedString localizedStringForKey:v2];
  return v3;
}

- (id)bundleIdentifier
{
  uint64_t v2 = [(PCMediaActivity *)self userInfo];
  id v3 = [v2 objectForKey:@"bundleIdentifierKey"];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = @"unknown";
  }

  return v4;
}

- (id)artWork
{
  uint64_t v2 = [(PCMediaActivity *)self userInfo];
  id v3 = [v2 objectForKey:@"artworkKey"];

  if (v3)
  {
    id v4 = [MEMORY[0x263F1C6B0] imageWithData:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (int64_t)direction
{
  uint64_t v2 = [(PCMediaActivity *)self userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"mediaDirection"];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)behavior
{
  uint64_t v2 = [(PCMediaActivity *)self userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"mediaBehavior"];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (unsigned)playbackState
{
  uint64_t v2 = [(PCMediaActivity *)self userInfo];
  id v3 = [v2 objectForKey:@"playbackState"];

  if (v3) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (BOOL)destinationOriginExists
{
  uint64_t v2 = [(PCMediaActivity *)self userInfo];
  id v3 = [v2 objectForKey:@"destinationOriginExists"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (int64_t)mediaType
{
  uint64_t v2 = [(PCMediaActivity *)self userInfo];
  id v3 = [v2 objectForKey:@"mediaType"];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)shortDescription
{
  uint64_t v2 = [(PCMediaActivity *)self userInfo];
  id v3 = [v2 objectForKey:@"mediaTitle"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pcactivityType];
  if (v5 == [(PCMediaActivity *)self pcactivityType])
  {
    id v6 = v4;
    id v7 = [(PCMediaActivity *)self description];
    v8 = [v6 description];
    int v9 = [v7 isEqualToString:v8];

    if (v9
      && (int64_t v10 = -[PCMediaActivity direction](self, "direction"), v10 == [v6 direction])
      && (unsigned int v11 = [(PCMediaActivity *)self playbackState],
          v11 == [v6 playbackState]))
    {
      v12 = [(PCMediaActivity *)self userInfo];
      objc_super v13 = [v12 objectForKey:@"artworkKey"];

      v14 = [v6 userInfo];
      BOOL v15 = [v14 objectForKey:@"artworkKey"];

      id v16 = v13;
      id v17 = v15;
      v18 = v17;
      if (v16 == v17)
      {
        char v19 = 1;
      }
      else if ((v16 == 0) == (v17 != 0))
      {
        char v19 = 0;
      }
      else
      {
        char v19 = [v16 isEqual:v17];
      }
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

@end