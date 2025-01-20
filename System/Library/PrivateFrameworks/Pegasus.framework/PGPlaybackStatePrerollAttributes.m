@interface PGPlaybackStatePrerollAttributes
+ (id)prerollAttributesForAdContentWithRequiredLinearPlaybackEndTime:(double)a3 preferredTintColor:(id)a4;
+ (id)prerollAttributesForSponsoredContentWithRequiredLinearPlaybackEndTime:(double)a3 preferredTintColor:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (PGPlaybackStatePrerollAttributes)initWithDictionary:(id)a3;
- (PGPlaybackStatePrerollAttributes)initWithRequiredLinearPlaybackEndTime:(double)a3 preferredTintColor:(id)a4 contentType:(int64_t)a5;
- (UIColor)preferredTintColor;
- (double)requiredLinearPlaybackEndTime;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)preferredTintColorDescription;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)contentType;
@end

@implementation PGPlaybackStatePrerollAttributes

+ (id)prerollAttributesForAdContentWithRequiredLinearPlaybackEndTime:(double)a3 preferredTintColor:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithRequiredLinearPlaybackEndTime:v6 preferredTintColor:1 contentType:a3];

  return v7;
}

+ (id)prerollAttributesForSponsoredContentWithRequiredLinearPlaybackEndTime:(double)a3 preferredTintColor:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithRequiredLinearPlaybackEndTime:v6 preferredTintColor:2 contentType:a3];

  return v7;
}

- (PGPlaybackStatePrerollAttributes)initWithRequiredLinearPlaybackEndTime:(double)a3 preferredTintColor:(id)a4 contentType:(int64_t)a5
{
  BOOL v8 = (*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  if (a3 >= 0.0) {
    BOOL v8 = 0;
  }
  int v9 = (*(void *)&a3 & 0x7FFFFFFFFFFFFFFFLL) == 0 || v8;
  BOOL v10 = a3 < 0.0 && ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  id v11 = a4;
  BOOL v12 = v11 != 0;
  if (a3 <= 0.0) {
    uint64_t v13 = v12 + 1;
  }
  else {
    uint64_t v13 = v12 | 2;
  }
  v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v13];
  v15 = [NSNumber numberWithInteger:a5];
  [v14 setObject:v15 forKeyedSubscript:&unk_1F0E5D6D8];

  if (((v9 | v10) & 1) == 0)
  {
    v16 = [NSNumber numberWithDouble:a3];
    [v14 setObject:v16 forKey:&unk_1F0E5D6F0];
  }
  if (v11)
  {
    double v25 = 0.0;
    double v26 = 0.0;
    double v23 = 0.0;
    double v24 = 0.0;
    [v11 getRed:&v26 green:&v25 blue:&v24 alpha:&v23];
    v17 = [NSNumber numberWithDouble:v26];
    [v14 setObject:v17 forKey:&unk_1F0E5D708];

    v18 = [NSNumber numberWithDouble:v25];
    [v14 setObject:v18 forKey:&unk_1F0E5D720];

    v19 = [NSNumber numberWithDouble:v24];
    [v14 setObject:v19 forKey:&unk_1F0E5D738];

    v20 = [NSNumber numberWithDouble:v23];
    [v14 setObject:v20 forKey:&unk_1F0E5D750];
  }
  v21 = [(PGPlaybackStatePrerollAttributes *)self initWithDictionary:v14];

  return v21;
}

- (PGPlaybackStatePrerollAttributes)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGPlaybackStatePrerollAttributes;
  v5 = [(PGPlaybackStatePrerollAttributes *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;
  }
  return v5;
}

- (UIColor)preferredTintColor
{
  v3 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
  id v4 = [v3 objectForKey:&unk_1F0E5D708];

  if (v4)
  {
    v5 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
    uint64_t v6 = [v5 objectForKey:&unk_1F0E5D708];
    [v6 doubleValue];
    double v8 = v7;

    objc_super v9 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
    BOOL v10 = [v9 objectForKey:&unk_1F0E5D720];
    [v10 doubleValue];
    double v12 = v11;

    uint64_t v13 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
    v14 = [v13 objectForKey:&unk_1F0E5D738];
    [v14 doubleValue];
    double v16 = v15;

    v17 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
    v18 = [v17 objectForKey:&unk_1F0E5D750];
    [v18 doubleValue];
    double v20 = v19;

    v21 = [MEMORY[0x1E4F428B8] colorWithRed:v8 green:v12 blue:v16 alpha:v20];
  }
  else
  {
    v21 = 0;
  }

  return (UIColor *)v21;
}

- (int64_t)contentType
{
  v2 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
  v3 = [v2 objectForKey:&unk_1F0E5D6D8];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (double)requiredLinearPlaybackEndTime
{
  v2 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
  v3 = [v2 objectForKey:&unk_1F0E5D6F0];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  uint64_t v6 = [v5 dictionaryRepresentation];
  double v7 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
  char v8 = [v6 isEqualToDictionary:v7];

  return v8;
}

- (id)description
{
  return [(PGPlaybackStatePrerollAttributes *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(PGPlaybackStatePrerollAttributes *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(PGPlaybackStatePrerollAttributes *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(PGPlaybackStatePrerollAttributes *)self succinctDescriptionBuilder];
  [(PGPlaybackStatePrerollAttributes *)self requiredLinearPlaybackEndTime];
  id v5 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", @"requiredLinearPlaybackEndTime", 3);
  int64_t v6 = [(PGPlaybackStatePrerollAttributes *)self contentType];
  double v7 = @"unknown";
  if (v6 == 1) {
    double v7 = @"Advertisement";
  }
  if (v6 == 2) {
    char v8 = @"Sponsored";
  }
  else {
    char v8 = v7;
  }
  [v4 appendString:v8 withName:@"Content Type"];
  objc_super v9 = [(PGPlaybackStatePrerollAttributes *)self preferredTintColorDescription];
  [v4 appendString:v9 withName:@"preferredTintColor" skipIfEmpty:1];

  return v4;
}

- (id)preferredTintColorDescription
{
  v3 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
  id v4 = [v3 objectForKey:&unk_1F0E5D708];

  if (v4)
  {
    id v5 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
    int64_t v6 = [v5 objectForKey:&unk_1F0E5D708];

    double v7 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
    char v8 = [v7 objectForKey:&unk_1F0E5D720];

    objc_super v9 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
    BOOL v10 = [v9 objectForKey:&unk_1F0E5D738];

    double v11 = [(PGPlaybackStatePrerollAttributes *)self dictionaryRepresentation];
    double v12 = [v11 objectForKey:&unk_1F0E5D750];

    uint64_t v13 = [NSString stringWithFormat:@"r: %@ g: %@ b: %@ a: %@", v6, v8, v10, v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
}

@end