@interface WLKPlayEvent
- (BOOL)isPlayed;
- (NSDate)occurrenceDate;
- (NSString)bundleID;
- (NSString)channelID;
- (NSString)externalPlayableID;
- (NSString)showID;
- (WLKPlayEvent)init;
- (WLKPlayEvent)initWithDictionary:(id)a3;
- (double)duration;
- (double)elapsedTime;
- (id)description;
@end

@implementation WLKPlayEvent

- (WLKPlayEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v25.receiver = self;
    v25.super_class = (Class)WLKPlayEvent;
    v5 = [(WLKPlayEvent *)&v25 init];
    if (v5)
    {
      v6 = objc_msgSend(v4, "wlk_stringForKey:", @"bundleId");
      uint64_t v7 = [v6 copy];
      bundleID = v5->_bundleID;
      v5->_bundleID = (NSString *)v7;

      v9 = objc_msgSend(v4, "wlk_stringForKey:", @"channelId");
      uint64_t v10 = [v9 copy];
      channelID = v5->_channelID;
      v5->_channelID = (NSString *)v10;

      v12 = objc_msgSend(v4, "wlk_stringForKey:", @"externalPlayableId");
      uint64_t v13 = [v12 copy];
      externalPlayableID = v5->_externalPlayableID;
      v5->_externalPlayableID = (NSString *)v13;

      v15 = objc_msgSend(v4, "wlk_stringForKey:", @"showId");
      uint64_t v16 = [v15 copy];
      showID = v5->_showID;
      v5->_showID = (NSString *)v16;

      v5->_played = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"isDone", 0);
      v18 = objc_msgSend(v4, "wlk_numberForKey:", @"mediaLengthInSeconds");
      v5->_duration = (double)(unint64_t)[v18 unsignedIntegerValue];

      v19 = objc_msgSend(v4, "wlk_numberForKey:", @"playCursorInSeconds");
      v5->_elapsedTime = (double)(unint64_t)[v19 unsignedIntegerValue];

      v20 = objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", @"occurredAt");
      uint64_t v21 = [v20 copy];
      occurrenceDate = v5->_occurrenceDate;
      v5->_occurrenceDate = (NSDate *)v21;
    }
    self = v5;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (WLKPlayEvent)init
{
  return [(WLKPlayEvent *)self initWithDictionary:0];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self->_played) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"<%@: %p playableID:%@ played:%@ elapsed:%lu Date:%@>", v5, self, self->_externalPlayableID, v7, (unint64_t)self->_elapsedTime, self->_occurrenceDate];

  return v8;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)externalPlayableID
{
  return self->_externalPlayableID;
}

- (NSString)showID
{
  return self->_showID;
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)occurrenceDate
{
  return self->_occurrenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceDate, 0);
  objc_storeStrong((id *)&self->_showID, 0);
  objc_storeStrong((id *)&self->_externalPlayableID, 0);
  objc_storeStrong((id *)&self->_channelID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end