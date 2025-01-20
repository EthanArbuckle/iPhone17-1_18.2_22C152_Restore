@interface WFiTunesMediaTrackObject
+ (id)JSONKeyPathsByPropertyKey;
+ (id)durationJSONTransformer;
+ (id)explicitJSONTransformer;
+ (id)priceJSONTransformer;
- (BOOL)explicit;
- (BOOL)streamable;
- (NSString)genre;
- (NSURL)previewURL;
- (WFTimeInterval)duration;
@end

@implementation WFiTunesMediaTrackObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
}

- (BOOL)explicit
{
  return self->_explicit;
}

- (BOOL)streamable
{
  return self->_streamable;
}

- (WFTimeInterval)duration
{
  return self->_duration;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

+ (id)priceJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_574];
}

id __48__WFiTunesMediaTrackObject_priceJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKey:@"trackPrice"];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 objectForKey:@"price"];
  }
  v6 = v5;

  return v6;
}

+ (id)explicitJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x1E4F29248], "mtl_valueMappingTransformerWithDictionary:defaultValue:reverseDefaultValue:", &unk_1F2317F08, MEMORY[0x1E4F1CC28], MEMORY[0x1E4F1CC38]);
}

+ (id)durationJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_561 reverseBlock:&__block_literal_global_567];
}

uint64_t __51__WFiTunesMediaTrackObject_durationJSONTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  [a2 timeInterval];
  double v4 = v3 * 1000.0;
  return [v2 numberWithDouble:v4];
}

id __51__WFiTunesMediaTrackObject_durationJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  double v3 = v2 / 1000.0;
  double v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v4 dateByAddingTimeInterval:v3];
  uint64_t v7 = 224;
  v8 = [v5 components:224 fromDate:v4 toDate:v6 options:0];

  if ([v8 hour])
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v10 = [v8 minute];
    if (v10) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 0x10000;
    }
    if (v10) {
      uint64_t v7 = 224;
    }
    else {
      uint64_t v7 = 192;
    }
  }
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F5AA30]) initWithTimeInterval:v7 allowedUnits:0 unitsStyle:v9 zeroFormattingBehavior:v3];

  return v11;
}

+ (id)JSONKeyPathsByPropertyKey
{
  v8[11] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesMediaTrackObject;
  double v2 = objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  double v3 = (void *)[v2 mutableCopy];

  v7[0] = @"identifier";
  v7[1] = @"name";
  v8[0] = @"trackId";
  v8[1] = @"trackName";
  v7[2] = @"censoredName";
  v7[3] = @"kind";
  v8[2] = @"trackCensoredName";
  v8[3] = @"kind";
  v7[4] = @"price";
  v7[5] = @"viewURL";
  v8[4] = &unk_1F2317A48;
  v8[5] = @"trackViewUrl";
  v7[6] = @"duration";
  v7[7] = @"genre";
  v8[6] = @"trackTimeMillis";
  v8[7] = @"primaryGenreName";
  v7[8] = @"previewURL";
  v7[9] = @"explicit";
  v8[8] = @"previewUrl";
  v8[9] = @"trackExplicitness";
  v7[10] = @"streamable";
  v8[10] = @"isStreamable";
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:11];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

@end