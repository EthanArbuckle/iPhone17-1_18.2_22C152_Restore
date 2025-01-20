@interface SignpostStreamEvent
+ (id)serializationTypeNumber;
- (BOOL)_hasTotalSkyLightCompositeCount;
- (OS_dispatch_source)timeoutSource;
- (SignpostStreamEvent)initWithDictionary:(id)a3;
- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4;
- (unint64_t)_totalFrameCount;
- (unint64_t)serialNumber;
- (void)setSerialNumber:(unint64_t)a3;
- (void)setTimeoutSource:(id)a3;
- (void)set_totalFrameCount:(unint64_t)a3;
@end

@implementation SignpostStreamEvent

+ (id)serializationTypeNumber
{
  if (serializationTypeNumber_onceToken_402 != -1) {
    dispatch_once(&serializationTypeNumber_onceToken_402, &__block_literal_global_405);
  }
  v2 = (void *)serializationTypeNumber_serializationTypeNumber_403;

  return v2;
}

void __61__SignpostStreamEvent_Serialization__serializationTypeNumber__block_invoke()
{
  v0 = (void *)serializationTypeNumber_serializationTypeNumber_403;
  serializationTypeNumber_serializationTypeNumber_403 = (uint64_t)&unk_1EF81E7C0;
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SignpostStreamEvent;
  v5 = [(SignpostEvent *)&v8 _dictionaryRepresentationWithIsHumanReadable:a3 shouldRedact:a4];
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostStreamEvent _totalFrameCount](self, "_totalFrameCount"));
  [v5 setObject:v6 forKeyedSubscript:@"FrameCount"];

  return v5;
}

- (SignpostStreamEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)SignpostStreamEvent;
  self = [(SignpostEvent *)&v8 initWithDictionary:v4];
  if (!self) {
    goto LABEL_5;
  }
  v5 = [v4 objectForKeyedSubscript:@"FrameCount"];
  v6 = v5;
  if (v5)
  {
    [(SignpostStreamEvent *)self set_totalFrameCount:[(SignpostStreamEvent *)v5 unsignedLongLongValue]];

LABEL_5:
    self = self;
    v6 = self;
  }
LABEL_7:

  return v6;
}

- (BOOL)_hasTotalSkyLightCompositeCount
{
  return 1;
}

- (unint64_t)_totalFrameCount
{
  return self->_totalFrameCount;
}

- (void)set_totalFrameCount:(unint64_t)a3
{
  self->_totalFrameCount = a3;
}

- (OS_dispatch_source)timeoutSource
{
  return self->_timeoutSource;
}

- (void)setTimeoutSource:(id)a3
{
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(unint64_t)a3
{
  self->_serialNumber = a3;
}

- (void).cxx_destruct
{
}

@end