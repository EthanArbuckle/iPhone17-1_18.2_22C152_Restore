@interface _UIFeedback
+ (BOOL)supportsSecureCoding;
+ (Class)_parametersClass;
+ (Class)classForType:(id)a3;
+ (_UIFeedback)feedbackWithDictionaryRepresentation:(id)a3;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaying;
- (CGPoint)_location;
- (NSArray)_effectiveFeedbackData;
- (NSArray)_individualFeedbacks;
- (NSDictionary)_debugDictionary;
- (NSDictionary)dictionaryRepresentation;
- (NSIndexSet)_allEventTypes;
- (NSIndexSet)_allSystemSoundIDs;
- (NSMutableArray)systemSoundSources;
- (NSMutableArray)visualizerSources;
- (NSString)_category;
- (NSString)_name;
- (Protocol)_playableProtocol;
- (UIView)_view;
- (_UIFeedback)init;
- (_UIFeedback)initWithCoder:(id)a3;
- (_UIFeedback)initWithDictionaryRepresentation:(id)a3;
- (_UIFeedbackParameters)audioParameters;
- (_UIFeedbackParameters)hapticParameters;
- (_UIFeedbackPattern)_parentPattern;
- (_UIFeedbackPlayer)_player;
- (double)_delay;
- (double)_effectiveDelay;
- (double)_effectiveDuration;
- (float)position;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)audioOutputMode;
- (int64_t)hapticOutputMode;
- (int64_t)peripheralOutputMode;
- (unint64_t)_effectiveEnabledFeedbackTypes;
- (unint64_t)_effectiveEventType;
- (unint64_t)_effectiveFeedbackTypes;
- (unint64_t)_effectivePlayableFeedbackTypes;
- (unsigned)_effectiveSystemSoundID;
- (void)_playedAtTime:(double)a3 engine:(id)a4;
- (void)_setCategory:(id)a3;
- (void)_setDelay:(double)a3;
- (void)_setLocation:(CGPoint)a3;
- (void)_setName:(id)a3;
- (void)_setParentPattern:(id)a3;
- (void)_setPlayer:(id)a3;
- (void)_setView:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)play;
- (void)setAudioOutputMode:(int64_t)a3;
- (void)setHapticOutputMode:(int64_t)a3;
- (void)setPeripheralOutputMode:(int64_t)a3;
- (void)setPosition:(float)a3;
- (void)stop;
@end

@implementation _UIFeedback

- (NSIndexSet)_allSystemSoundIDs
{
  unsigned int v2 = [(_UIFeedback *)self _effectiveSystemSoundID];
  if (v2 == _UISystemSoundIDNone) {
    [MEMORY[0x1E4F28D60] indexSet];
  }
  else {
  v3 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v2];
  }
  return (NSIndexSet *)v3;
}

- (NSArray)_individualFeedbacks
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  unsigned int v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 _feedbackSupportLevel];

  unint64_t v5 = [(_UIFeedback *)self _effectiveEventType];
  if (v4 < 2 || v5 == 0)
  {
    unsigned int v7 = [(_UIFeedback *)self _effectiveSystemSoundID];
    unint64_t v8 = 3;
    if (v4 < 1) {
      unint64_t v8 = 1;
    }
    if (v7 == _UISystemSoundIDNone) {
      return 0;
    }
    else {
      return v8;
    }
  }
  else
  {
    uint64_t v10 = 2;
    if (v5 < 0x55uLL) {
      uint64_t v10 = 3;
    }
    if (v5 < 0x2DuLL) {
      unint64_t v11 = 1;
    }
    else {
      unint64_t v11 = v10;
    }
    if (v5 == 32556) {
      return 3;
    }
    else {
      return v11;
    }
  }
}

- (unint64_t)_effectiveFeedbackTypes
{
  unint64_t v3 = [(_UIFeedback *)self _effectiveEnabledFeedbackTypes];
  return [(_UIFeedback *)self _effectivePlayableFeedbackTypes] & v3;
}

- (unint64_t)_effectiveEnabledFeedbackTypes
{
  unint64_t v3 = +[_UIFeedbackPreferences sharedPreferences];
  uint64_t v4 = [v3 enabledFeedbackTypesForCategory:self->_category];

  int64_t v5 = [(_UIFeedback *)self audioOutputMode] & 1;
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFDLL | (2 * ([(_UIFeedback *)self hapticOutputMode] & 1));
  if ([(_UIFeedback *)self peripheralOutputMode]) {
    v6 |= 0xCuLL;
  }
  if ((~[(_UIFeedback *)self audioOutputMode] & 3) != 0) {
    uint64_t v7 = v4 | 0xE;
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v6 & v7;
  if ((~[(_UIFeedback *)self hapticOutputMode] & 3) != 0) {
    unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFDLL | v4 & 2u & v6;
  }
  else {
    unint64_t v9 = v8;
  }
  if ((~[(_UIFeedback *)self peripheralOutputMode] & 3) != 0) {
    unint64_t v10 = v4 | 0xFFFFFFFFFFFFFFF3;
  }
  else {
    unint64_t v10 = -1;
  }
  unint64_t v11 = v9 & v10;
  p_parentPattern = &self->_parentPattern;
  id WeakRetained = objc_loadWeakRetained((id *)p_parentPattern);

  if (WeakRetained)
  {
    id v14 = objc_loadWeakRetained((id *)p_parentPattern);
    v11 |= [v14 _effectiveEnabledFeedbackTypes];
  }
  return v11;
}

- (int64_t)hapticOutputMode
{
  return self->_hapticOutputMode;
}

- (int64_t)peripheralOutputMode
{
  return self->_peripheralOutputMode;
}

- (int64_t)audioOutputMode
{
  return self->_audioOutputMode;
}

- (void)_setCategory:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    uint64_t v7 = (float *)v4;
    BOOL v6 = [(_UIFeedbackParameters *)self->_audioParameters isEqual:*((void *)v7 + 2)]
      && [(_UIFeedbackParameters *)self->_hapticParameters isEqual:*((void *)v7 + 3)]
      && self->_position == v7[3]
      && self->_delay == *((double *)v7 + 12);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (_UIFeedbackPlayer)_player
{
  return self->_player;
}

- (_UIFeedbackParameters)hapticParameters
{
  return self->_hapticParameters;
}

- (_UIFeedback)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIFeedback *)self init];
  if (v5)
  {
    BOOL v6 = [v4 objectForKeyedSubscript:@"audioParameters"];
    if (v6)
    {
      uint64_t v7 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_parametersClass")), "initWithDictionaryRepresentation:feedback:", v6, v5);
      audioParameters = v5->_audioParameters;
      v5->_audioParameters = (_UIFeedbackParameters *)v7;
    }
    unint64_t v9 = [v4 objectForKeyedSubscript:@"hapticParameters"];
    if (v9)
    {
      uint64_t v10 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_parametersClass")), "initWithDictionaryRepresentation:feedback:", v9, v5);
      hapticParameters = v5->_hapticParameters;
      v5->_hapticParameters = (_UIFeedbackParameters *)v10;
    }
    v12 = [v4 objectForKeyedSubscript:@"delay"];
    [v12 doubleValue];
    v5->_delay = v13;

    id v14 = [v4 objectForKeyedSubscript:@"name"];
    uint64_t v15 = [v14 copy];
    name = v5->_name;
    v5->_name = (NSString *)v15;

    v17 = v5;
  }

  return v5;
}

- (_UIFeedback)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIFeedback;
  unsigned int v2 = [(_UIFeedback *)&v8 init];
  uint64_t v3 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_parametersClass")), "initWithFeedback:", v2);
  audioParameters = v2->_audioParameters;
  v2->_audioParameters = (_UIFeedbackParameters *)v3;

  uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_parametersClass")), "initWithFeedback:", v2);
  hapticParameters = v2->_hapticParameters;
  v2->_hapticParameters = (_UIFeedbackParameters *)v5;

  *(int64x2_t *)&v2->_audioOutputMode = vdupq_n_s64(1uLL);
  v2->_peripheralOutputMode = 1;
  v2->_position = 0.0;
  v2->_location = (CGPoint)_UICGPointNull_0;
  return v2;
}

+ (Class)_parametersClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(_UIFeedbackParameters *)self->_audioParameters copy];
  BOOL v6 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v5;

  [*((id *)v4 + 2) setFeedback:v4];
  uint64_t v7 = [(_UIFeedbackParameters *)self->_hapticParameters copy];
  objc_super v8 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v7;

  [*((id *)v4 + 3) setFeedback:v4];
  *((_DWORD *)v4 + 3) = LODWORD(self->_position);
  *((void *)v4 + 12) = *(void *)&self->_delay;
  uint64_t v9 = [(NSString *)self->_name copy];
  uint64_t v10 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v9;

  *((void *)v4 + 4) = self->_audioOutputMode;
  *((void *)v4 + 5) = self->_hapticOutputMode;
  *((void *)v4 + 6) = self->_peripheralOutputMode;
  uint64_t v11 = [(NSString *)self->_category copy];
  v12 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v11;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_storeWeak((id *)v4 + 11, WeakRetained);

  *((_OWORD *)v4 + 7) = self->_location;
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_UIFeedback;
  [(_UIFeedback *)&v2 dealloc];
}

+ (_UIFeedback)feedbackWithDictionaryRepresentation:(id)a3
{
  id v5 = a3;
  BOOL v6 = [v5 objectForKeyedSubscript:@"type"];
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"_UIFeedback.m", 461, @"No type found in %@", v5 object file lineNumber description];
  }
  uint64_t v7 = (objc_class *)[(id)objc_opt_class() classForType:v6];
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"_UIFeedback.m", 463, @"No class found for type %@", v6 object file lineNumber description];
  }
  objc_super v8 = (void *)[[v7 alloc] initWithDictionaryRepresentation:v5];

  return (_UIFeedback *)v8;
}

+ (Class)classForType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"discrete"] & 1) != 0
    || ([v3 isEqualToString:@"continuous"] & 1) != 0
    || ([v3 isEqualToString:@"pattern"] & 1) != 0
    || [v3 isEqualToString:@"custom"])
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }

  return (Class)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_debugDictionary, 0);
  objc_destroyWeak((id *)&self->_parentPattern);
  objc_storeStrong((id *)&self->_hapticParameters, 0);
  objc_storeStrong((id *)&self->_audioParameters, 0);
}

- (void)play
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = +[_UIFeedbackEngine engineForFeedback:self];
  id v4 = v3;
  if (v3)
  {
    [v3 currentTime];
    double v6 = v5;
    [(_UIFeedback *)self _effectiveDelay];
    v13[1] = 3221225472;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[2] = __19___UIFeedback_play__block_invoke;
    v13[3] = &unk_1E52ED2B0;
    v13[4] = self;
    double v15 = v6 + v7;
    id v14 = v4;
    [v14 _playFeedback:self atTime:v13 withCompletionBlock:v15];
  }
  else if (!_UIFeedbackLoggingDisabled)
  {
    objc_super v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &play___s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = NSString;
      uint64_t v10 = self;
      uint64_t v11 = v8;
      v12 = objc_msgSend(v9, "stringWithFormat:", @"<%s: %p>", object_getClassName(v10), v10);

      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "no engine for feedback %@, dropping it", buf, 0xCu);
    }
  }
}

- (void)_setView:(id)a3
{
}

- (void)_setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (NSArray)_effectiveFeedbackData
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v16 = [(_UIFeedback *)self _individualFeedbacks];
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(_UIFeedback *)self _individualFeedbacks];
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        double v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v7 = objc_opt_new();
        objc_msgSend(v7, "_setEffectiveEventType:", objc_msgSend(v6, "_effectiveEventType"));
        [v6 _effectiveDuration];
        objc_msgSend(v7, "_setEffectiveDuration:");
        [v6 _effectiveDelay];
        objc_msgSend(v7, "_setEffectiveDelay:");
        objc_super v8 = [v6 hapticParameters];
        [v7 _setHapticParameters:v8];

        uint64_t v9 = [v6 audioParameters];
        [v7 _setAudioParameters:v9];

        objc_msgSend(v7, "_setEffectiveEnabledFeedbackTypes:", objc_msgSend(v6, "_effectiveEnabledFeedbackTypes"));
        objc_msgSend(v7, "_setEffectiveSystemSoundID:", objc_msgSend(v6, "_effectiveSystemSoundID"));
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = [v6 pattern];
          [v7 _setPattern:v10];
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v6 hidRequest];
          [v7 _setHIDRequest:v11];
        }
        if (objc_opt_respondsToSelector())
        {
          v12 = [v6 fileURL];
          [v7 _setFileURL:v12];

          objc_msgSend(v7, "_setFileFeedbackType:", objc_msgSend(v6, "_effectivePlayableFeedbackTypes"));
        }
        if (objc_opt_respondsToSelector())
        {
          [v7 _setIsTransientHaptic:1];
          [v6 intensity];
          objc_msgSend(v7, "_setIntensity:");
          [v6 sharpness];
          objc_msgSend(v7, "_setSharpness:");
        }
        if (objc_opt_respondsToSelector()) {
          uint64_t v13 = [v6 canReuseCoreHapticsPlayer];
        }
        else {
          uint64_t v13 = 0;
        }
        [v7 _setCanReuseCoreHapticsPlayer:v13];
        if (objc_opt_respondsToSelector()) {
          uint64_t v14 = [v6 disableEventUseVolumeEnvelope];
        }
        else {
          uint64_t v14 = 0;
        }
        [v7 _setDisableEventUseVolumeEnvelope:v14];
        [v19 addObject:v7];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }

  return (NSArray *)v19;
}

- (double)_effectiveDelay
{
  double delay = self->_delay;
  p_parentPattern = &self->_parentPattern;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentPattern);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_parentPattern);
    [v5 _effectiveDelay];
    double delay = delay + v6;
  }
  return delay;
}

- (_UIFeedbackParameters)audioParameters
{
  return self->_audioParameters;
}

- (double)_effectiveDuration
{
  return 0.0;
}

- (void)_setPlayer:(id)a3
{
}

- (void)_playedAtTime:(double)a3 engine:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!_UIFeedbackLoggingDisabled)
  {
    double v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_playedAtTime_engine____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = NSString;
      uint64_t v9 = self;
      uint64_t v10 = v7;
      uint64_t v11 = objc_msgSend(v8, "stringWithFormat:", @"<%s: %p>", object_getClassName(v9), v9);

      v12 = NSString;
      id v13 = v6;
      id v14 = v11;
      double v15 = objc_msgSend(v12, "stringWithFormat:", @"<%s: %p>", object_getClassName(v13), v13);

      *(_DWORD *)buf = 138412802;
      v17 = v11;
      __int16 v18 = 2112;
      id v19 = v15;
      __int16 v20 = 2048;
      double v21 = a3;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "played feedback %@ with engine %@ at time %f", buf, 0x20u);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return 0;
}

- (_UIFeedback)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  double v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  objc_super v8 = [v5 decodeObjectOfClasses:v7 forKey:@"dictionaryRepresentation"];

  uint64_t v9 = +[_UIFeedback feedbackWithDictionaryRepresentation:v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIFeedback *)self dictionaryRepresentation];
  [v4 encodeObject:v5 forKey:@"dictionaryRepresentation"];
}

- (NSDictionary)dictionaryRepresentation
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"type";
  uint64_t v3 = [(id)objc_opt_class() type];
  v12[0] = v3;
  v11[1] = @"audioParameters";
  id v4 = [(_UIFeedbackParameters *)self->_audioParameters dictionaryRepresentation];
  v12[1] = v4;
  v11[2] = @"hapticParameters";
  id v5 = [(_UIFeedbackParameters *)self->_hapticParameters dictionaryRepresentation];
  v12[2] = v5;
  v11[3] = @"delay";
  uint64_t v6 = [NSNumber numberWithDouble:self->_delay];
  v12[3] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  objc_super v8 = (void *)[v7 mutableCopy];

  name = self->_name;
  if (name) {
    [v8 setObject:name forKeyedSubscript:@"name"];
  }
  return (NSDictionary *)v8;
}

- (Protocol)_playableProtocol
{
  return 0;
}

- (unint64_t)_effectiveEventType
{
  return 0;
}

- (unsigned)_effectiveSystemSoundID
{
  return _UISystemSoundIDNone;
}

- (NSIndexSet)_allEventTypes
{
  if ([(_UIFeedback *)self _effectiveEventType]) {
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:");
  }
  else {
  objc_super v2 = [MEMORY[0x1E4F28D60] indexSet];
  }
  return (NSIndexSet *)v2;
}

- (void)_setDelay:(double)a3
{
  self->_double delay = a3;
}

- (void)stop
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!_UIFeedbackLoggingDisabled)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("FeedbackDebug", &stop___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v6 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v9 = self;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "stop feedback %@", buf, 0xCu);
      }
    }
  }
  id v4 = [(_UIFeedback *)self _player];

  if (v4)
  {
    id v5 = [(_UIFeedback *)self _player];
    [v5 _stopFeedback:self];
  }
  else
  {
    id v5 = +[_UIFeedbackEngine engineForFeedback:self];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __19___UIFeedback_stop__block_invoke;
    v7[3] = &unk_1E52ED2D8;
    v7[4] = self;
    [v5 _dequeueReusableFeedbackPlayerWithCompletionBlock:v7];
  }
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(_UIFeedback *)self _player];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; player: %p; delay: %.3f",
    v5,
    self,
    v6,
  double v7 = *(void *)&self->_delay);

  if (self->_name) {
    [v7 appendFormat:@"; name: %@", self->_name];
  }
  objc_super v8 = [(_UIFeedback *)self _debugDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __26___UIFeedback_description__block_invoke;
  v11[3] = &unk_1E52DD258;
  id v9 = v7;
  id v12 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];

  [v9 appendString:@">"];
  return v9;
}

- (void)setAudioOutputMode:(int64_t)a3
{
  self->_audioOutputMode = a3;
}

- (void)setHapticOutputMode:(int64_t)a3
{
  self->_hapticOutputMode = a3;
}

- (void)setPeripheralOutputMode:(int64_t)a3
{
  self->_peripheralOutputMode = a3;
}

- (float)position
{
  return self->_position;
}

- (void)setPosition:(float)a3
{
  self->_position = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (_UIFeedbackPattern)_parentPattern
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentPattern);
  return (_UIFeedbackPattern *)WeakRetained;
}

- (void)_setParentPattern:(id)a3
{
}

- (NSDictionary)_debugDictionary
{
  return self->_debugDictionary;
}

- (NSString)_name
{
  return self->_name;
}

- (void)_setName:(id)a3
{
}

- (NSString)_category
{
  return self->_category;
}

- (UIView)_view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (CGPoint)_location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)_delay
{
  return self->_delay;
}

- (NSMutableArray)systemSoundSources
{
  uint64_t v3 = objc_getAssociatedObject(self, &_UIFeedbackSystemSoundEngineSourcesKey);
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    objc_setAssociatedObject(self, &_UIFeedbackSystemSoundEngineSourcesKey, v3, (void *)1);
  }
  return (NSMutableArray *)v3;
}

- (NSMutableArray)visualizerSources
{
  uint64_t v3 = objc_getAssociatedObject(self, &_UIFeedbackVisualizerSourcesKey);
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    objc_setAssociatedObject(self, &_UIFeedbackVisualizerSourcesKey, v3, (void *)1);
  }
  return (NSMutableArray *)v3;
}

@end