@interface CTVoicemailInfoType
+ (id)voicemailInfoTypeForDictionaryRepresentation:(id)a3;
- (BOOL)available;
- (BOOL)isNetworkOriginated;
- (BOOL)isVoiceMailMWI;
- (NSNotification)vmd_notification;
- (NSNumber)count;
- (NSString)url;
- (id)description;
- (void)setAvailable:(BOOL)a3;
- (void)setCount:(id)a3;
- (void)setIsNetworkOriginated:(BOOL)a3;
- (void)setIsVoiceMailMWI:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation CTVoicemailInfoType

- (NSNotification)vmd_notification
{
  v2 = [(CTVoicemailInfoType *)self url];
  v3 = (void *)VMCopyDictionaryForNotificationString();

  v4 = sub_100057160();
  v5 = [v3 objectForKeyedSubscript:v4];

  if (v5) {
    id v6 = [objc_alloc((Class)NSNotification) initWithName:v5 object:0 userInfo:v3];
  }
  else {
    id v6 = 0;
  }

  return (NSNotification *)v6;
}

+ (id)voicemailInfoTypeForDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CTVoicemailInfoType);
  v5 = [v3 objectForKeyedSubscript:kCTIndicatorsVoiceMailAvailable];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[CTVoicemailInfoType setAvailable:](v4, "setAvailable:", [v5 BOOLValue]);
  }
  id v6 = [v3 objectForKeyedSubscript:kCTIndicatorsVoiceMailCount];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CTVoicemailInfoType *)v4 setCount:v6];
  }
  v7 = [v3 objectForKeyedSubscript:kCTIndicatorsVoiceMailIsMWI];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[CTVoicemailInfoType setIsVoiceMailMWI:](v4, "setIsVoiceMailMWI:", [v7 BOOLValue]);
  }
  v8 = [v3 objectForKeyedSubscript:kCTIndicatorsVoiceMailIsNetworkOriginated];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[CTVoicemailInfoType setIsNetworkOriginated:](v4, "setIsNetworkOriginated:", [v8 BOOLValue]);
  }
  v9 = [v3 objectForKeyedSubscript:kCTIndicatorsVoiceMailURL];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CTVoicemailInfoType *)v4 setUrl:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [v9 absoluteString];
      [(CTVoicemailInfoType *)v4 setUrl:v10];
    }
  }

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  v4 = NSStringFromSelector("available");
  v5 = +[NSNumber numberWithBool:[(CTVoicemailInfoType *)self available]];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  id v6 = NSStringFromSelector("count");
  v7 = [(CTVoicemailInfoType *)self count];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@", "];
  v8 = NSStringFromSelector("isNetworkOriginated");
  v9 = +[NSNumber numberWithBool:[(CTVoicemailInfoType *)self isNetworkOriginated]];
  [v3 appendFormat:@"%@=%@", v8, v9];

  [v3 appendFormat:@", "];
  v10 = NSStringFromSelector("isVoiceMailMWI");
  v11 = +[NSNumber numberWithBool:[(CTVoicemailInfoType *)self isVoiceMailMWI]];
  [v3 appendFormat:@"%@=%@", v10, v11];

  [v3 appendFormat:@", "];
  v12 = NSStringFromSelector("url");
  v13 = [(CTVoicemailInfoType *)self url];
  [v3 appendFormat:@"%@=%@", v12, v13];

  [v3 appendFormat:@">"];
  id v14 = [v3 copy];

  return v14;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)available
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (NSNumber)count
{
  return self->_count;
}

- (void)setCount:(id)a3
{
}

- (BOOL)isNetworkOriginated
{
  return self->_isNetworkOriginated;
}

- (void)setIsNetworkOriginated:(BOOL)a3
{
  self->_isNetworkOriginated = a3;
}

- (BOOL)isVoiceMailMWI
{
  return self->_isVoiceMailMWI;
}

- (void)setIsVoiceMailMWI:(BOOL)a3
{
  self->_isVoiceMailMWI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end