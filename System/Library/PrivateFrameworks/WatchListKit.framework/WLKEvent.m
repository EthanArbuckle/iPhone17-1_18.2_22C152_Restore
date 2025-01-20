@interface WLKEvent
+ (BOOL)supportsSecureCoding;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)dictionary;
- (NSString)canonicalID;
- (NSString)nowPlayingPassThrough;
- (NSString)url;
- (WLKEvent)initWithCoder:(id)a3;
- (WLKEvent)initWithDictionary:(id)a3;
- (unint64_t)contentType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WLKEvent

- (WLKEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WLKEvent;
  v5 = [(WLKEvent *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    v8 = objc_msgSend(v4, "wlk_stringForKey:", @"canonicalId");
    uint64_t v9 = [v8 copy];
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v9;

    v11 = objc_msgSend(v4, "wlk_stringForKey:", @"nowPlayingPassThrough");
    uint64_t v12 = [v11 copy];
    nowPlayingPassThrough = v5->_nowPlayingPassThrough;
    v5->_nowPlayingPassThrough = (NSString *)v12;

    v14 = objc_msgSend(v4, "wlk_stringForKey:", @"url");
    uint64_t v15 = [v14 copy];
    url = v5->_url;
    v5->_url = (NSString *)v15;

    v17 = [v4 objectForKey:@"type"];
    v5->_contentType = +[WLKBasicContentMetadata contentTypeForString:v17];
    v18 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"eventTime");
    v19 = objc_msgSend(v18, "wlk_dictionaryForKey:", @"tuneInTime");
    uint64_t v20 = objc_msgSend(v19, "wlk_dateFromMillisecondsSince1970ForKey:", @"startTime");
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v20;

    uint64_t v22 = objc_msgSend(v19, "wlk_dateFromMillisecondsSince1970ForKey:", @"endTime");
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v22;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLKEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_WLKEventCoderKeyJSONDictionary"];
    self = [(WLKEvent *)self initWithDictionary:v5];

    uint64_t v6 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeObject:self->_dictionary forKey:@"_WLKEventCoderKeyJSONDictionary"];
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)nowPlayingPassThrough
{
  return self->_nowPlayingPassThrough;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_nowPlayingPassThrough, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end