@interface PGPlaybackState
+ (id)defaultValueForKey:(id)a3;
+ (id)keysForEqualityOfNumberValues;
- (BOOL)_BOOLForKey:(int64_t)a3;
- (BOOL)cameraHasMicrophone;
- (BOOL)canSwitchCamera;
- (BOOL)disablesLayerCloning;
- (BOOL)hasInvalidTiming;
- (BOOL)isCameraActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToPlaybackState:(id)a3;
- (BOOL)isMicrophoneMuted;
- (BOOL)isMuted;
- (BOOL)isRoutingVideoToHostedWindow;
- (BOOL)requiresLinearPlayback;
- (BOOL)supportsFaceTimeActions;
- (BOOL)supportsMicroPIP;
- (NSMutableDictionary)mutableDictionary;
- (NSString)description;
- (PGPlaybackState)initWithDictionary:(id)a3;
- (PGPlaybackStatePrerollAttributes)prerollAttributes;
- (double)_doubleForKey:(int64_t)a3;
- (double)anchorContentTime;
- (double)anchorWallTime;
- (double)contentDuration;
- (double)elapsedTime;
- (double)normalizedProgress;
- (double)playbackRate;
- (id)_dictionaryForKey:(int64_t)a3;
- (id)_numberForKey:(int64_t)a3;
- (id)_stringForKey:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromPlaybackState:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_integerForKey:(int64_t)a3;
- (int64_t)backgroundAudioPolicy;
- (int64_t)contentType;
- (int64_t)timeControlStatus;
- (void)_ensureMutableDictionary;
- (void)_setBool:(BOOL)a3 forKey:(int64_t)a4;
- (void)_setDictionaryOrNotFound:(id)a3 forKey:(int64_t)a4;
- (void)_setDouble:(double)a3 forKey:(int64_t)a4;
- (void)_setInteger:(int64_t)a3 forKey:(int64_t)a4;
- (void)_setStateValue:(id)a3 forKey:(int64_t)a4;
- (void)appendDescriptionForKey:(int64_t)a3 value:(id)a4 toBuilder:(id)a5;
- (void)setBackgroundAudioPolicy:(int64_t)a3;
- (void)setCameraActive:(BOOL)a3;
- (void)setCameraHasMicrophone:(BOOL)a3;
- (void)setCanSwitchCamera:(BOOL)a3;
- (void)setContentDuration:(double)a3;
- (void)setContentType:(int64_t)a3;
- (void)setDisablesLayerCloning:(BOOL)a3;
- (void)setMicrophoneMuted:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPlaybackRate:(double)a3 elapsedTime:(double)a4 timeControlStatus:(int64_t)a5;
- (void)setPrerollAttributes:(id)a3;
- (void)setRequiresLinearPlayback:(BOOL)a3;
- (void)setRoutingVideoToHostedWindow:(BOOL)a3;
- (void)setSupportsFaceTimeActions:(BOOL)a3;
- (void)updatePlaybackStateWithDiff:(id)a3;
@end

@implementation PGPlaybackState

+ (id)keysForEqualityOfNumberValues
{
  if (keysForEqualityOfNumberValues_onceToken != -1) {
    dispatch_once(&keysForEqualityOfNumberValues_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)keysForEqualityOfNumberValues_keysForEquality;

  return v2;
}

void __48__PGPlaybackState_keysForEqualityOfNumberValues__block_invoke()
{
  v0 = (void *)keysForEqualityOfNumberValues_keysForEquality;
  keysForEqualityOfNumberValues_keysForEquality = (uint64_t)&unk_1F0E5D7F0;
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v5 = [a3 integerValue];
  if (v5 > 1001)
  {
    if ((unint64_t)(v5 - 1003) >= 3)
    {
      if (v5 == 1002 || v5 == 2001)
      {
        return (id)MEMORY[0x1E4F1CC38];
      }
      else
      {
LABEL_10:
        v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2 object:a1 file:@"PGPlaybackState.m" lineNumber:114 description:@"No invalid key."];

        return 0;
      }
    }
    else
    {
      return (id)MEMORY[0x1E4F1CC28];
    }
  }
  else
  {
    uint64_t v6 = v5 - 1;
    id result = 0;
    switch(v6)
    {
      case 0:
      case 1:
      case 3:
      case 5:
        id result = &unk_1F0E5D7D0;
        break;
      case 2:
      case 4:
      case 10:
        id result = &unk_1F0E5D6A8;
        break;
      case 6:
      case 7:
      case 9:
        return (id)MEMORY[0x1E4F1CC28];
      case 8:
        return result;
      default:
        goto LABEL_10;
    }
  }
  return result;
}

- (PGPlaybackState)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGPlaybackState;
  uint64_t v5 = [(PGPlaybackState *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    mutableDictionary = v5->_mutableDictionary;
    v5->_mutableDictionary = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PGPlaybackState alloc];
  uint64_t v5 = [(PGPlaybackState *)self dictionaryRepresentation];
  uint64_t v6 = [(PGPlaybackState *)v4 initWithDictionary:v5];

  return v6;
}

- (void)updatePlaybackStateWithDiff:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(PGPlaybackState *)self _ensureMutableDictionary];
    id v5 = [(PGPlaybackState *)self mutableDictionary];
    [v5 addEntriesFromDictionary:v4];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = [v5 dictionaryRepresentation];

  v7 = [(PGPlaybackState *)self dictionaryRepresentation];
  char v8 = [v6 isEqualToDictionary:v7];

  return v8;
}

- (BOOL)isEquivalentToPlaybackState:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PGPlaybackState *)self elapsedTime];
  double v6 = v5;
  [v4 elapsedTime];
  double v8 = v6 - v7;
  if (v8 >= 0.0) {
    double v9 = v8;
  }
  else {
    double v9 = -v8;
  }
  if (v9 < 0.01)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v10 = +[PGPlaybackState keysForEqualityOfNumberValues];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v16 = objc_msgSend(v4, "_numberForKey:", objc_msgSend(v15, "integerValue"));
          v17 = -[PGPlaybackState _numberForKey:](self, "_numberForKey:", [v15 integerValue]);
          char v18 = [v16 isEqualToNumber:v17];

          if ((v18 & 1) == 0 && v16 != v17)
          {
            LOBYTE(v20) = 0;
            goto LABEL_19;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    v10 = [v4 prerollAttributes];
    uint64_t v19 = [(PGPlaybackState *)self prerollAttributes];
    v16 = (void *)v19;
    if (v10 == (void *)v19)
    {
      int v20 = 1;
      if (!v19)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      int v20 = [v10 isEqual:v19];
      if (!v16) {
        goto LABEL_19;
      }
    }
    if (v20)
    {
      [(PGPlaybackState *)self playbackRate];
      if (v22 == 0.0)
      {
        [(PGPlaybackState *)self elapsedTime];
        double v24 = v23;
        [v16 requiredLinearPlaybackEndTime];
        double v26 = v24 - v25;
        if (v26 < 0.0) {
          double v26 = -v26;
        }
        LOBYTE(v20) = v26 > 0.01 || v9 == 0.0;
      }
      else
      {
        LOBYTE(v20) = 1;
      }
    }
    goto LABEL_19;
  }
  [(PGPlaybackState *)self elapsedTime];
  LOBYTE(v20) = 0;
LABEL_20:

  return v20;
}

- (id)diffFromPlaybackState:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PGPlaybackState *)self isEquivalentToPlaybackState:v4])
  {
    double v5 = 0;
    goto LABEL_30;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v6 = [v4 dictionaryRepresentation];
  double v7 = [v6 allKeys];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v8)
  {
    double v5 = 0;
    goto LABEL_29;
  }
  uint64_t v9 = v8;
  double v5 = 0;
  uint64_t v10 = *(void *)v23;
  v21 = v7;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
      unint64_t v13 = [v12 integerValue];
      unint64_t v14 = v13;
      if (v13 <= 0xB)
      {
        if (((1 << v13) & 0xDFE) != 0) {
          goto LABEL_17;
        }
        if (v13 == 9)
        {
          v15 = [(PGPlaybackState *)self mutableDictionary];
          v16 = [v15 objectForKeyedSubscript:v12];

          v17 = [v4 mutableDictionary];
          char v18 = [v17 objectForKeyedSubscript:v12];

          if (([v16 isEqual:v18] & 1) == 0)
          {
            if (!v5)
            {
              double v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
            }
            [v5 setObject:v18 forKeyedSubscript:v12];
          }
          double v7 = v21;
LABEL_21:

          goto LABEL_22;
        }
      }
      if (v13 - 1001 < 5 || v13 == 2001)
      {
LABEL_17:
        v16 = [(PGPlaybackState *)self _numberForKey:v13];
        char v18 = [v4 _numberForKey:v14];
        if (([v16 isEqualToNumber:v18] & 1) == 0)
        {
          if (!v5)
          {
            double v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
          }
          [v5 setObject:v18 forKeyedSubscript:v12];
        }
        goto LABEL_21;
      }
LABEL_22:
      ++v11;
    }
    while (v9 != v11);
    uint64_t v19 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    uint64_t v9 = v19;
  }
  while (v19);
LABEL_29:

LABEL_30:

  return v5;
}

- (double)normalizedProgress
{
  BOOL v3 = [(PGPlaybackState *)self hasInvalidTiming];
  double v4 = 1.0;
  if (!v3)
  {
    int64_t v5 = [(PGPlaybackState *)self contentType];
    double v4 = 1.0;
    if (v5 != 2)
    {
      [(PGPlaybackState *)self elapsedTime];
      double v7 = v6;
      [(PGPlaybackState *)self contentDuration];
      double v4 = v7 / v8;
    }
  }
  return fmin(fmax(v4, 0.0), 1.0);
}

- (int64_t)contentType
{
  return [(PGPlaybackState *)self _integerForKey:3];
}

- (double)anchorContentTime
{
  [(PGPlaybackState *)self _doubleForKey:1];
  return result;
}

- (double)anchorWallTime
{
  [(PGPlaybackState *)self _doubleForKey:2];
  return result;
}

- (double)elapsedTime
{
  [(PGPlaybackState *)self anchorContentTime];
  double v4 = v3;
  if ([(PGPlaybackState *)self timeControlStatus] == 2)
  {
    [(PGPlaybackState *)self playbackRate];
    if (v5 != 0.0)
    {
      double v6 = v5;
      double Current = CFAbsoluteTimeGetCurrent();
      [(PGPlaybackState *)self anchorWallTime];
      double v4 = v4 + v6 * (Current - v8);
    }
  }
  double v9 = fmax(v4, 0.0);
  [(PGPlaybackState *)self contentDuration];
  if (v9 < result) {
    return v9;
  }
  return result;
}

- (double)contentDuration
{
  [(PGPlaybackState *)self _doubleForKey:4];
  return result;
}

- (int64_t)timeControlStatus
{
  return [(PGPlaybackState *)self _integerForKey:5];
}

- (double)playbackRate
{
  [(PGPlaybackState *)self _doubleForKey:6];
  return result;
}

- (BOOL)isMuted
{
  return [(PGPlaybackState *)self _BOOLForKey:7];
}

- (BOOL)requiresLinearPlayback
{
  return [(PGPlaybackState *)self _BOOLForKey:8];
}

- (BOOL)isRoutingVideoToHostedWindow
{
  return [(PGPlaybackState *)self _BOOLForKey:10];
}

- (int64_t)backgroundAudioPolicy
{
  return [(PGPlaybackState *)self _integerForKey:11];
}

- (BOOL)hasInvalidTiming
{
  unint64_t v3 = [(PGPlaybackState *)self contentType];
  if (v3 > 5) {
    return 0;
  }
  if (((1 << v3) & 0x39) != 0) {
    return 1;
  }
  [(PGPlaybackState *)self contentDuration];
  if (v4 <= 0.0) {
    return 1;
  }
  [(PGPlaybackState *)self contentDuration];
  [(PGPlaybackState *)self elapsedTime];
  return 0;
}

- (void)setContentType:(int64_t)a3
{
}

- (void)setContentDuration:(double)a3
{
}

- (void)setMuted:(BOOL)a3
{
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
}

- (void)setRoutingVideoToHostedWindow:(BOOL)a3
{
}

- (void)setBackgroundAudioPolicy:(int64_t)a3
{
  if (dyld_program_sdk_at_least())
  {
    [(PGPlaybackState *)self _setInteger:a3 forKey:11];
  }
}

- (void)setPlaybackRate:(double)a3 elapsedTime:(double)a4 timeControlStatus:(int64_t)a5
{
  [(PGPlaybackState *)self _setInteger:a5 forKey:5];
  [(PGPlaybackState *)self _setDouble:6 forKey:a3];
  [(PGPlaybackState *)self _setDouble:1 forKey:fmax(a4, 0.0)];
  double Current = CFAbsoluteTimeGetCurrent();

  [(PGPlaybackState *)self _setDouble:2 forKey:Current];
}

- (PGPlaybackStatePrerollAttributes)prerollAttributes
{
  unint64_t v3 = [(PGPlaybackState *)self _dictionaryForKey:9];
  double v4 = [(PGPlaybackStatePrerollAttributes *)self->_prerollAttributes dictionaryRepresentation];
  char v5 = [v3 isEqualToDictionary:v4];

  if ((v5 & 1) == 0)
  {
    if (v3) {
      double v6 = [[PGPlaybackStatePrerollAttributes alloc] initWithDictionary:v3];
    }
    else {
      double v6 = 0;
    }
    prerollAttributes = self->_prerollAttributes;
    self->_prerollAttributes = v6;
  }
  double v8 = self->_prerollAttributes;

  return v8;
}

- (void)setPrerollAttributes:(id)a3
{
  uint64_t v4 = [a3 dictionaryRepresentation];
  char v5 = (void *)v4;
  double v6 = &unk_1F0E5D6C0;
  if (v4) {
    double v6 = (void *)v4;
  }
  id v7 = v6;

  [(PGPlaybackState *)self _setDictionaryOrNotFound:v7 forKey:9];
}

- (BOOL)supportsMicroPIP
{
  if ([(PGPlaybackState *)self contentType] != 4) {
    return 0;
  }

  return _os_feature_enabled_impl();
}

- (id)_numberForKey:(int64_t)a3
{
  uint64_t v4 = [(PGPlaybackState *)self mutableDictionary];
  char v5 = [NSNumber numberWithInteger:a3];
  double v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    double v9 = objc_opt_class();
    uint64_t v10 = [NSNumber numberWithInteger:a3];
    id v8 = [v9 defaultValueForKey:v10];
  }

  return v8;
}

- (int64_t)_integerForKey:(int64_t)a3
{
  unint64_t v3 = [(PGPlaybackState *)self _numberForKey:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (double)_doubleForKey:(int64_t)a3
{
  unint64_t v3 = [(PGPlaybackState *)self _numberForKey:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (BOOL)_BOOLForKey:(int64_t)a3
{
  unint64_t v3 = [(PGPlaybackState *)self _numberForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)_dictionaryForKey:(int64_t)a3
{
  char v4 = [(PGPlaybackState *)self mutableDictionary];
  double v5 = [NSNumber numberWithInteger:a3];
  double v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    double v9 = objc_opt_class();
    uint64_t v10 = [NSNumber numberWithInteger:a3];
    id v8 = [v9 defaultValueForKey:v10];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)_stringForKey:(int64_t)a3
{
  char v4 = [(PGPlaybackState *)self mutableDictionary];
  double v5 = [NSNumber numberWithInteger:a3];
  double v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    double v9 = objc_opt_class();
    uint64_t v10 = [NSNumber numberWithInteger:a3];
    id v8 = [v9 defaultValueForKey:v10];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (void)_setInteger:(int64_t)a3 forKey:(int64_t)a4
{
  id v6 = [NSNumber numberWithInteger:a3];
  [(PGPlaybackState *)self _setStateValue:v6 forKey:a4];
}

- (void)_setDouble:(double)a3 forKey:(int64_t)a4
{
  id v6 = [NSNumber numberWithDouble:a3];
  [(PGPlaybackState *)self _setStateValue:v6 forKey:a4];
}

- (void)_setBool:(BOOL)a3 forKey:(int64_t)a4
{
  id v6 = [NSNumber numberWithBool:a3];
  [(PGPlaybackState *)self _setStateValue:v6 forKey:a4];
}

- (void)_setStateValue:(id)a3 forKey:(int64_t)a4
{
  id v6 = a3;
  [(PGPlaybackState *)self _ensureMutableDictionary];
  id v8 = [(PGPlaybackState *)self mutableDictionary];
  id v7 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (void)_setDictionaryOrNotFound:(id)a3 forKey:(int64_t)a4
{
  id v6 = a3;
  [(PGPlaybackState *)self _ensureMutableDictionary];
  id v8 = [(PGPlaybackState *)self mutableDictionary];
  id v7 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (void)_ensureMutableDictionary
{
  if (!self->_mutableDictionary)
  {
    unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    mutableDictionary = self->_mutableDictionary;
    self->_mutableDictionary = v3;
    MEMORY[0x1F41817F8](v3, mutableDictionary);
  }
}

- (NSString)description
{
  return (NSString *)[(PGPlaybackState *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(PGPlaybackState *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(PGPlaybackState *)self descriptionBuilderWithMultilinePrefix:a3];
  char v4 = [v3 build];

  return v4;
}

- (void)appendDescriptionForKey:(int64_t)a3 value:(id)a4 toBuilder:(id)a5
{
  id v22 = a4;
  id v8 = a5;
  int64_t v9 = a3 - 1;
  uint64_t v10 = @"Muted";
  uint64_t v11 = @"AnchorContentTime";
  id v12 = v22;
  switch(v9)
  {
    case 0:
      goto LABEL_13;
    case 1:
      uint64_t v11 = @"AnchorWallTime";
      goto LABEL_13;
    case 2:
      unint64_t v13 = [v22 integerValue];
      if (v13 >= 6) {
        unint64_t v14 = @"invalid";
      }
      else {
        unint64_t v14 = off_1E610D138[v13];
      }
      v21 = @"ContentType";
      goto LABEL_31;
    case 3:
      uint64_t v11 = @"ContentDuration";
      goto LABEL_13;
    case 4:
      unint64_t v15 = [v22 integerValue];
      if (v15 >= 3) {
        unint64_t v14 = @"invalid";
      }
      else {
        unint64_t v14 = off_1E610D168[v15];
      }
      v21 = @"TimeControlStatus";
      goto LABEL_31;
    case 5:
      uint64_t v11 = @"PlaybackRate";
LABEL_13:
      [v22 doubleValue];
      id v16 = (id)objc_msgSend(v8, "appendDouble:withName:decimalPrecision:", v11, 2);
      goto LABEL_32;
    case 6:
      goto LABEL_23;
    case 7:
      uint64_t v10 = @"RequiresLinearPlayback";
      goto LABEL_23;
    case 8:
      uint64_t v19 = [(PGPlaybackState *)self prerollAttributes];
      int v20 = [v19 description];
      [v8 appendString:v20 withName:@"PrerollAttributes" skipIfEmpty:1];

      goto LABEL_32;
    case 9:
      uint64_t v10 = @"RoutingVideoToHostedWindow";
      goto LABEL_23;
    case 10:
      unint64_t v17 = [v22 integerValue];
      if (v17 >= 4) {
        unint64_t v14 = @"invalid";
      }
      else {
        unint64_t v14 = off_1E610D180[v17];
      }
      v21 = @"BackgroundAudioPolicy";
LABEL_31:
      [v8 appendString:v14 withName:v21];
      goto LABEL_32;
    default:
      switch((unint64_t)@"Muted")
      {
        case 0x3E9uLL:
          uint64_t v10 = @"FaceTime-SupportsActions";
          goto LABEL_22;
        case 0x3EAuLL:
          uint64_t v10 = @"FaceTime-CameraActive";
          goto LABEL_22;
        case 0x3EBuLL:
          uint64_t v10 = @"FaceTime-MicrophoneMuted";
          goto LABEL_22;
        case 0x3ECuLL:
          uint64_t v10 = @"FaceTime-CanSwitchCamera";
          goto LABEL_22;
        case 0x3EDuLL:
          uint64_t v10 = @"FaceTime-DisablesLayerCloning";
          goto LABEL_22;
        default:
          if (@"Muted" != (__CFString *)2001) {
            goto LABEL_32;
          }
          uint64_t v10 = @"SecurityCam-HasMicrophone";
LABEL_22:
          id v12 = v22;
          break;
      }
LABEL_23:
      id v18 = (id)objc_msgSend(v8, "appendBool:withName:", objc_msgSend(v12, "BOOLValue"), v10);
LABEL_32:

      return;
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  double v5 = [(PGPlaybackState *)self succinctDescriptionBuilder];
  v13.receiver = self;
  v13.super_class = (Class)PGPlaybackState;
  id v6 = [(PGPlaybackState *)&v13 description];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PGPlaybackState_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E610C258;
  id v7 = v5;
  id v11 = v7;
  id v12 = self;
  [v7 appendBodySectionWithName:v6 multilinePrefix:v4 block:v10];

  id v8 = v7;
  return v8;
}

void __57__PGPlaybackState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) elapsedTime];
  id v3 = (id)objc_msgSend(v2, "appendDouble:withName:decimalPrecision:", @"Elapsed Time", 2);
  id v4 = [*(id *)(a1 + 40) dictionaryRepresentation];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PGPlaybackState_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v7[3] = &unk_1E610D118;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
}

void __57__PGPlaybackState_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "appendDescriptionForKey:value:toBuilder:", objc_msgSend(a2, "integerValue"), v5, *(void *)(a1 + 40));
}

- (NSMutableDictionary)mutableDictionary
{
  return self->_mutableDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDictionary, 0);

  objc_storeStrong((id *)&self->_prerollAttributes, 0);
}

- (BOOL)supportsFaceTimeActions
{
  return [(PGPlaybackState *)self _BOOLForKey:1001];
}

- (void)setSupportsFaceTimeActions:(BOOL)a3
{
}

- (BOOL)isCameraActive
{
  return [(PGPlaybackState *)self _BOOLForKey:1002];
}

- (void)setCameraActive:(BOOL)a3
{
}

- (BOOL)canSwitchCamera
{
  return [(PGPlaybackState *)self _BOOLForKey:1004];
}

- (void)setCanSwitchCamera:(BOOL)a3
{
}

- (BOOL)isMicrophoneMuted
{
  return [(PGPlaybackState *)self _BOOLForKey:1003];
}

- (void)setMicrophoneMuted:(BOOL)a3
{
}

- (BOOL)disablesLayerCloning
{
  return [(PGPlaybackState *)self _BOOLForKey:1005];
}

- (void)setDisablesLayerCloning:(BOOL)a3
{
}

- (BOOL)cameraHasMicrophone
{
  return [(PGPlaybackState *)self _BOOLForKey:2001];
}

- (void)setCameraHasMicrophone:(BOOL)a3
{
}

@end