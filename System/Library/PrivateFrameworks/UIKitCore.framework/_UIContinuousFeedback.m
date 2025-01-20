@interface _UIContinuousFeedback
+ (BOOL)supportsSecureCoding;
+ (id)continuousFeedbackForType:(int64_t)a3;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (_UIContinuousFeedback)init;
- (_UIContinuousFeedback)initWithDictionaryRepresentation:(id)a3;
- (double)_effectiveDuration;
- (double)duration;
- (id)_debugDictionary;
- (id)_playableProtocol;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)type;
- (unint64_t)_effectiveEventType;
- (void)_playedAtTime:(double)a3 engine:(id)a4;
- (void)setDuration:(double)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _UIContinuousFeedback

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"continuous";
}

+ (id)continuousFeedbackForType:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setType:a3];
  return v4;
}

- (_UIContinuousFeedback)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIContinuousFeedback;
  result = [(_UIFeedback *)&v3 init];
  result->_duration = INFINITY;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIContinuousFeedback;
  id result = [(_UIFeedback *)&v5 copyWithZone:a3];
  *((void *)result + 17) = self->_type;
  *((void *)result + 16) = *(void *)&self->_duration;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIContinuousFeedback;
  BOOL v5 = [(_UIFeedback *)&v7 isEqual:v4]
    && self->_type == *((void *)v4 + 17)
    && self->_duration == v4[16];

  return v5;
}

- (_UIContinuousFeedback)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIContinuousFeedback;
  BOOL v5 = [(_UIFeedback *)&v11 initWithDictionaryRepresentation:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"feedbackType"];
    v5->_type = (int)[v6 intValue];

    objc_super v7 = [v4 objectForKeyedSubscript:@"duration"];
    [v7 doubleValue];
    v5->_duration = v8;

    v9 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UIContinuousFeedback;
  objc_super v3 = [(_UIFeedback *)&v9 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  v10[0] = @"feedbackType";
  BOOL v5 = [NSNumber numberWithInteger:self->_type];
  v10[1] = @"duration";
  v11[0] = v5;
  v6 = [NSNumber numberWithDouble:self->_duration];
  v11[1] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 addEntriesFromDictionary:v7];

  return v4;
}

- (id)_playableProtocol
{
  return &unk_1ED54E8B0;
}

- (unint64_t)_effectiveEventType
{
  if (self->_type) {
    return 32610;
  }
  else {
    return 0;
  }
}

- (double)_effectiveDuration
{
  return self->_duration;
}

- (void)_playedAtTime:(double)a3 engine:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIContinuousFeedback;
  [(_UIFeedback *)&v9 _playedAtTime:a4 engine:a3];
  if (self->_duration < INFINITY)
  {
    [(_UIFeedback *)self _effectiveDelay];
    double v6 = v5 + self->_duration;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46___UIContinuousFeedback__playedAtTime_engine___block_invoke;
    v8[3] = &unk_1E52D9F70;
    v8[4] = self;
    id v7 = _UIFeedbackPreciseDispatchAfter(0, v8, v6);
  }
}

- (id)_debugDictionary
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"feedbackType";
  int64_t v3 = [(_UIContinuousFeedback *)self type];
  id v4 = @"Unknown";
  if (v3 == 1) {
    id v4 = @"Sine";
  }
  v13[0] = v4;
  v12[1] = @"effectiveEventType";
  double v5 = NSNumber;
  double v6 = v4;
  id v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", -[_UIContinuousFeedback _effectiveEventType](self, "_effectiveEventType"));
  v13[1] = v7;
  v12[2] = @"duration";
  double v8 = NSNumber;
  [(_UIContinuousFeedback *)self duration];
  objc_super v9 = objc_msgSend(v8, "numberWithDouble:");
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end