@interface _UIFeedbackParameters
+ (id)parameters;
- (BOOL)_isAudio;
- (BOOL)isEqual:(id)a3;
- (_UIFeedback)feedback;
- (_UIFeedbackParameters)initWithDictionaryRepresentation:(id)a3 feedback:(id)a4;
- (_UIFeedbackParameters)initWithFeedback:(id)a3;
- (_UIFeedbackParameters)parentParameters;
- (float)_effectiveValueForParameterWithKey:(id)a3;
- (float)_effectiveVolume;
- (float)attackTime;
- (float)decayTime;
- (float)rate;
- (float)releaseTime;
- (float)transposition;
- (float)volume;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)_updateParameterWithKey:(id)a3;
- (void)setAttackTime:(float)a3;
- (void)setDecayTime:(float)a3;
- (void)setFeedback:(id)a3;
- (void)setParentParameters:(id)a3;
- (void)setRate:(float)a3;
- (void)setReleaseTime:(float)a3;
- (void)setTransposition:(float)a3;
- (void)setVolume:(float)a3;
@end

@implementation _UIFeedbackParameters

- (float)transposition
{
  return self->_transposition;
}

- (float)releaseTime
{
  return self->_releaseTime;
}

- (float)rate
{
  return self->_rate;
}

- (float)decayTime
{
  return self->_decayTime;
}

- (float)attackTime
{
  return self->_attackTime;
}

- (void)setTransposition:(float)a3
{
  if (self->_transposition != a3)
  {
    self->_transposition = a3;
    [(_UIFeedbackParameters *)self _updateParameterWithKey:@"transposition"];
  }
}

- (void)setReleaseTime:(float)a3
{
  if (self->_releaseTime != a3)
  {
    self->_releaseTime = a3;
    [(_UIFeedbackParameters *)self _updateParameterWithKey:@"releaseTime"];
  }
}

- (void)setRate:(float)a3
{
  if (self->_rate != a3)
  {
    self->_rate = a3;
    [(_UIFeedbackParameters *)self _updateParameterWithKey:@"rate"];
  }
}

- (void)setDecayTime:(float)a3
{
  if (self->_decayTime != a3)
  {
    self->_decayTime = a3;
    [(_UIFeedbackParameters *)self _updateParameterWithKey:@"decayTime"];
  }
}

- (void)setAttackTime:(float)a3
{
  if (self->_attackTime != a3)
  {
    self->_attackTime = a3;
    [(_UIFeedbackParameters *)self _updateParameterWithKey:@"attackTime"];
  }
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    v8 = [(id)objc_opt_class() parameters];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33___UIFeedbackParameters_isEqual___block_invoke;
    v11[3] = &unk_1E52ED288;
    id v9 = v7;
    id v12 = v9;
    v13 = self;
    v14 = &v15;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];

    BOOL v6 = *((unsigned char *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_updateParameterWithKey:(id)a3
{
  p_feedback = &self->_feedback;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_feedback);
  BOOL v6 = [WeakRetained _player];
  [v6 _updateValueForParameters:self withKey:v5];
}

- (void)setVolume:(float)a3
{
  if (self->_volume != a3)
  {
    self->_volume = a3;
    [(_UIFeedbackParameters *)self _updateParameterWithKey:@"volume"];
  }
}

- (_UIFeedbackParameters)initWithDictionaryRepresentation:(id)a3 feedback:(id)a4
{
  id v6 = a3;
  id v7 = [(_UIFeedbackParameters *)self initWithFeedback:a4];
  v8 = [(id)objc_opt_class() parameters];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67___UIFeedbackParameters_initWithDictionaryRepresentation_feedback___block_invoke;
  v14[3] = &unk_1E52ED260;
  id v15 = v6;
  id v9 = v7;
  v16 = v9;
  id v10 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];

  v11 = v16;
  id v12 = v9;

  return v12;
}

- (_UIFeedbackParameters)initWithFeedback:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackParameters;
  id v3 = a3;
  id v4 = [(_UIFeedbackParameters *)&v10 init];
  objc_storeWeak((id *)&v4->_feedback, v3);

  id v5 = [(id)objc_opt_class() parameters];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42___UIFeedbackParameters_initWithFeedback___block_invoke;
  v8[3] = &unk_1E52ED238;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

+ (id)parameters
{
  if (_MergedGlobals_5_7 != -1) {
    dispatch_once(&_MergedGlobals_5_7, &__block_literal_global_193);
  }
  v2 = (void *)qword_1EB25C920;
  return v2;
}

- (void)setFeedback:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(id)objc_opt_class() parameters];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38___UIFeedbackParameters_copyWithZone___block_invoke;
  v9[3] = &unk_1E52ED260;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = v6;
  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentParameters);
  objc_destroyWeak((id *)&self->_feedback);
}

- (BOOL)_isAudio
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedback);
  id v4 = [WeakRetained audioParameters];
  LOBYTE(v2) = v4 == v2;

  return (char)v2;
}

- (float)_effectiveValueForParameterWithKey:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() parameters];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [(_UIFeedbackParameters *)self valueForKey:v4];
  [v7 floatValue];
  float v9 = v8;

  id v10 = [v6 objectForKeyedSubscript:@"additive"];
  int v11 = [v10 BOOLValue];

  p_parentParameters = &self->_parentParameters;
  id WeakRetained = objc_loadWeakRetained((id *)p_parentParameters);

  if (WeakRetained)
  {
    id v14 = objc_loadWeakRetained((id *)p_parentParameters);
    [v14 _effectiveValueForParameterWithKey:v4];
    float v16 = v15;

    if (v11) {
      float v9 = v9 + v16;
    }
    else {
      float v9 = v9 * v16;
    }
  }
  uint64_t v17 = [v6 objectForKeyedSubscript:@"maxValue"];
  [v17 floatValue];
  float v19 = v18;
  v20 = [v6 objectForKeyedSubscript:@"minValue"];
  [v20 floatValue];
  float v22 = v21;

  if (v22 >= v9) {
    float v9 = v22;
  }

  if (v19 <= v9) {
    float v9 = v19;
  }

  return v9;
}

- (float)_effectiveVolume
{
  [(_UIFeedbackParameters *)self _effectiveValueForParameterWithKey:@"volume"];
  return result;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(id)objc_opt_class() parameters];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49___UIFeedbackParameters_dictionaryRepresentation__block_invoke;
  v8[3] = &unk_1E52ED260;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  id v6 = v5;
  return v6;
}

- (_UIFeedback)feedback
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedback);
  return (_UIFeedback *)WeakRetained;
}

- (_UIFeedbackParameters)parentParameters
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentParameters);
  return (_UIFeedbackParameters *)WeakRetained;
}

- (void)setParentParameters:(id)a3
{
}

@end