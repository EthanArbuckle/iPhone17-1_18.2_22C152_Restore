@interface QSSMutableKeywordFinderRequest
- (BOOL)enable_sanitization;
- (NSArray)keywords;
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (QSSMutableKeywordFinderRequest)init;
- (QSSRecognitionResult)recognition_result;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEnable_sanitization:(BOOL)a3;
- (void)setKeywords:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setRecognition_result:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
@end

@implementation QSSMutableKeywordFinderRequest

- (void)setEnable_sanitization:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)enable_sanitization
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"enable_sanitization"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setRecognition_result:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSRecognitionResult)recognition_result
{
  return (QSSRecognitionResult *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"recognition_result"];
}

- (void)setKeywords:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)keywords
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"keywords"];
}

- (void)setLanguage:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"language"];
}

- (void)setSession_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_id"];
}

- (void)setSpeech_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)speech_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_id"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableKeywordFinderRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableKeywordFinderRequest;
  v2 = [(QSSMutableKeywordFinderRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end