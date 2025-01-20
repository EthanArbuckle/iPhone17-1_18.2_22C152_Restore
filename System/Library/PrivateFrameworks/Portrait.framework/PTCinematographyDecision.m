@interface PTCinematographyDecision
+ (PTCinematographyTransition)defaultTransition;
+ (id)_decisionsWithCinematographyDictionaries:(id)a3;
+ (id)_mutableDecisionsWithCinematographyDictionaries:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)hasMaximumDuration;
- (BOOL)hasMinimumDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupDecision;
- (BOOL)isStrongDecision;
- (BOOL)isUserDecision;
- (PTCinematographyDecision)initWithTime:(id *)a3 groupIdentifier:(int64_t)a4 options:(unint64_t)a5;
- (PTCinematographyDecision)initWithTime:(id *)a3 trackIdentifier:(int64_t)a4;
- (PTCinematographyDecision)initWithTime:(id *)a3 trackIdentifier:(int64_t)a4 options:(unint64_t)a5;
- (PTCinematographyTransition)transition;
- (id)_asCinematographyDictionary;
- (id)_decisionByChangingTime:(id *)a3;
- (id)_decisionByRemovingOptions:(unint64_t)a3;
- (id)_initWithCinematographyDictionary:(id)a3;
- (id)_initWithTime:(id *)a3 trackIdentifier:(int64_t)a4 groupIdentifier:(int64_t)a5 transition:(id)a6 options:(unint64_t)a7;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)groupIdentifier;
- (int64_t)trackIdentifier;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)options;
- (void)setGroupIdentifier:(int64_t)a3;
- (void)setMaximumDuration:(id *)a3;
- (void)setMinimumDuration:(id *)a3;
- (void)setTrackIdentifier:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PTCinematographyDecision

+ (PTCinematographyTransition)defaultTransition
{
  if (defaultTransition_onceToken != -1) {
    dispatch_once(&defaultTransition_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)defaultTransition_sDefaultTransition;

  return (PTCinematographyTransition *)v2;
}

uint64_t __45__PTCinematographyDecision_defaultTransition__block_invoke()
{
  defaultTransition_sDefaultTransition = [[PTCinematographyTransition alloc] initWithKind:1];

  return MEMORY[0x1F41817F8]();
}

- (PTCinematographyDecision)initWithTime:(id *)a3 trackIdentifier:(int64_t)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  return [(PTCinematographyDecision *)self initWithTime:&v5 trackIdentifier:a4 options:0];
}

- (PTCinematographyDecision)initWithTime:(id *)a3 trackIdentifier:(int64_t)a4 options:(unint64_t)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  return (PTCinematographyDecision *)[(PTCinematographyDecision *)self _initWithTime:&v6 trackIdentifier:a4 groupIdentifier:-1 transition:0 options:a5];
}

- (PTCinematographyDecision)initWithTime:(id *)a3 groupIdentifier:(int64_t)a4 options:(unint64_t)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  return (PTCinematographyDecision *)[(PTCinematographyDecision *)self _initWithTime:&v6 trackIdentifier:-1 groupIdentifier:a4 transition:0 options:a5];
}

- (id)_initWithTime:(id *)a3 trackIdentifier:(int64_t)a4 groupIdentifier:(int64_t)a5 transition:(id)a6 options:(unint64_t)a7
{
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PTCinematographyDecision;
  v13 = [(PTCinematographyDecision *)&v19 init];
  v14 = v13;
  if (v13)
  {
    long long v15 = *(_OWORD *)&a3->var0;
    v13->_time.epoch = a3->var3;
    *(_OWORD *)&v13->_time.value = v15;
    v13->_trackIdentifier = a4;
    v13->_groupIdentifier = a5;
    if (v12)
    {
      v16 = (PTCinematographyTransition *)v12;
    }
    else
    {
      v16 = [(id)objc_opt_class() defaultTransition];
    }
    transition = v14->_transition;
    v14->_transition = v16;

    v14->_options = a7;
    v14->_type = 1;
  }

  return v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [PTCinematographyDecision alloc];
  int64_t trackIdentifier = self->_trackIdentifier;
  int64_t groupIdentifier = self->_groupIdentifier;
  transition = self->_transition;
  unint64_t options = self->_options;
  $95D729B680665BEAEFA1D6FCA8238556 time = self->_time;
  id result = [(PTCinematographyDecision *)v4 _initWithTime:&time trackIdentifier:trackIdentifier groupIdentifier:groupIdentifier transition:transition options:options];
  *((void *)result + 4) = self->_type;
  return result;
}

- (BOOL)hasMinimumDuration
{
  [(PTCinematographyDecision *)self minimumDuration];
  return v3 & 1;
}

- (BOOL)hasMaximumDuration
{
  [(PTCinematographyDecision *)self maximumDuration];
  return v3 & 1;
}

- (id)_decisionByChangingTime:(id *)a3
{
  uint64_t v4 = [(PTCinematographyDecision *)self mutableCopy];
  int64_t var3 = a3->var3;
  *(_OWORD *)(v4 + 48) = *(_OWORD *)&a3->var0;
  *(void *)(v4 + 64) = var3;

  return (id)v4;
}

- (id)_decisionByRemovingOptions:(unint64_t)a3
{
  uint64_t v4 = (void *)[(PTCinematographyDecision *)self mutableCopy];
  v4[3] &= ~a3;

  return v4;
}

- (BOOL)isUserDecision
{
  return [(PTCinematographyDecision *)self type] == 1;
}

- (BOOL)isStrongDecision
{
  return [(PTCinematographyDecision *)self options] & 1;
}

- (BOOL)isGroupDecision
{
  return ([(PTCinematographyDecision *)self options] >> 1) & 1;
}

- (id)description
{
  int64_t v3 = [(PTCinematographyDecision *)self type];
  uint64_t v4 = @"Unknown";
  if (v3 == 1) {
    uint64_t v4 = @"User";
  }
  if (v3) {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = v4;
  }
  else {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = @"Base";
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = NSString;
  [(PTCinematographyDecision *)self time];
  v7 = NSStringFromCMTime(&v17);
  int64_t v8 = [(PTCinematographyDecision *)self trackIdentifier];
  if (v8 == -1)
  {
    v9 = @"?";
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithInteger:", -[PTCinematographyDecision trackIdentifier](self, "trackIdentifier"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  int64_t v10 = [(PTCinematographyDecision *)self groupIdentifier];
  if (v10 == -1)
  {
    v11 = @"?";
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithInteger:", -[PTCinematographyDecision groupIdentifier](self, "groupIdentifier"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ([(PTCinematographyDecision *)self isGroupDecision]) {
    id v12 = @"g";
  }
  else {
    id v12 = &stru_1F269F3B0;
  }
  BOOL v13 = [(PTCinematographyDecision *)self isStrongDecision];
  v14 = @"+";
  if (!v13) {
    v14 = &stru_1F269F3B0;
  }
  long long v15 = [v6 stringWithFormat:@"%@: [%@] T%@ G%@ %@%@", v7, v5, v9, v11, v12, v14];
  if (v10 != -1) {

  }
  if (v8 != -1) {

  }
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PTCinematographyDecision *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = v4;
      int64_t v6 = [(PTCinematographyDecision *)self trackIdentifier];
      if (v6 == [(PTCinematographyDecision *)v5 trackIdentifier]
        && (int64_t v7 = [(PTCinematographyDecision *)self groupIdentifier],
            v7 == [(PTCinematographyDecision *)v5 groupIdentifier])
        && (unint64_t v8 = [(PTCinematographyDecision *)self options],
            v8 == [(PTCinematographyDecision *)v5 options])
        && (int64_t v9 = [(PTCinematographyDecision *)self type], v9 == [(PTCinematographyDecision *)v5 type]))
      {
        [(PTCinematographyDecision *)self time];
        if (v5) {
          [(PTCinematographyDecision *)v5 time];
        }
        else {
          memset(&v12, 0, sizeof(v12));
        }
        BOOL v10 = CMTimeCompare(&time1, &v12) == 0;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3 = [(PTCinematographyDecision *)self trackIdentifier];
  int64_t v4 = [(PTCinematographyDecision *)self groupIdentifier] + v3;
  unint64_t v5 = [(PTCinematographyDecision *)self options];
  double v6 = (double)(v4 + v5 + [(PTCinematographyDecision *)self type]);
  [(PTCinematographyDecision *)self time];
  return (unint64_t)(v6 + CMTimeGetSeconds(&time) * 600.0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (int64_t)trackIdentifier
{
  return self->_trackIdentifier;
}

- (void)setTrackIdentifier:(int64_t)a3
{
  self->_int64_t trackIdentifier = a3;
}

- (int64_t)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(int64_t)a3
{
  self->_int64_t groupIdentifier = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setMinimumDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_minimumDuration.epoch = a3->var3;
  *(_OWORD *)&self->_minimumDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setMaximumDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_maximumDuration.epoch = a3->var3;
  *(_OWORD *)&self->_maximumDuration.value = v3;
}

- (PTCinematographyTransition)transition
{
  return self->_transition;
}

- (void).cxx_destruct
{
}

+ (id)_decisionsWithCinematographyDictionaries:(id)a3
{
  long long v3 = [a1 _mutableDecisionsWithCinematographyDictionaries:a3];
  int64_t v4 = (void *)[v3 copy];

  return v4;
}

+ (id)_mutableDecisionsWithCinematographyDictionaries:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int64_t v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [PTCinematographyDecision alloc];
        id v12 = -[PTCinematographyDecision _initWithCinematographyDictionary:](v11, "_initWithCinematographyDictionary:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PTCinematographyDecision;
  id v5 = [(PTCinematographyDecision *)&v20 init];
  if (v5)
  {
    CFDictionaryRef v6 = [v4 objectForKeyedSubscript:@"ptime"];
    CMTimeFromPTCinematographyDictionary(&v19, v6);
    v5->_CMTime time = ($95D729B680665BEAEFA1D6FCA8238556)v19;

    uint64_t v7 = [v4 objectForKeyedSubscript:@"track_id"];
    v5->_int64_t trackIdentifier = [v7 integerValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"group_id"];
    v5->_int64_t groupIdentifier = [v8 integerValue];

    uint64_t v9 = [(id)objc_opt_class() defaultTransition];
    transition = v5->_transition;
    v5->_transition = (PTCinematographyTransition *)v9;

    v11 = [v4 objectForKeyedSubscript:@"options"];
    v5->_unint64_t options = [v11 unsignedIntegerValue];

    id v12 = [v4 objectForKeyedSubscript:@"is_user"];
    unsigned int v13 = [v12 BOOLValue];

    v5->_type = v13;
    CFDictionaryRef v14 = [v4 objectForKeyedSubscript:@"min_duration"];
    CFDictionaryRef v15 = v14;
    if (v14)
    {
      CMTimeFromPTCinematographyDictionary(&v19, v14);
      v5->_minimumDuration = ($95D729B680665BEAEFA1D6FCA8238556)v19;
    }
    CFDictionaryRef v16 = [v4 objectForKeyedSubscript:@"max_duration"];
    CFDictionaryRef v17 = v16;
    if (v16)
    {
      CMTimeFromPTCinematographyDictionary(&v19, v16);
      v5->_maximumDuration = ($95D729B680665BEAEFA1D6FCA8238556)v19;
    }
  }
  return v5;
}

- (id)_asCinematographyDictionary
{
  id v3 = objc_opt_new();
  [(PTCinematographyDecision *)self time];
  id v4 = PTCinematographyDictionaryFromCMTime((uint64_t)v15);
  [v3 setObject:v4 forKeyedSubscript:@"ptime"];

  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[PTCinematographyDecision trackIdentifier](self, "trackIdentifier"));
  [v3 setObject:v5 forKeyedSubscript:@"track_id"];

  CFDictionaryRef v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[PTCinematographyDecision groupIdentifier](self, "groupIdentifier"));
  [v3 setObject:v6 forKeyedSubscript:@"group_id"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PTCinematographyDecision options](self, "options"));
  [v3 setObject:v7 forKeyedSubscript:@"options"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PTCinematographyDecision isUserDecision](self, "isUserDecision"));
  [v3 setObject:v8 forKeyedSubscript:@"is_user"];

  if ([(PTCinematographyDecision *)self hasMinimumDuration])
  {
    [(PTCinematographyDecision *)self minimumDuration];
    uint64_t v9 = PTCinematographyDictionaryFromCMTime((uint64_t)v14);
    [v3 setObject:v9 forKeyedSubscript:@"min_duration"];
  }
  if ([(PTCinematographyDecision *)self hasMaximumDuration])
  {
    [(PTCinematographyDecision *)self maximumDuration];
    uint64_t v10 = PTCinematographyDictionaryFromCMTime((uint64_t)v13);
    [v3 setObject:v10 forKeyedSubscript:@"max_duration"];
  }
  v11 = (void *)[v3 copy];

  return v11;
}

@end