@interface _UITransientHapticFeedback
+ (BOOL)supportsSecureCoding;
+ (id)transientHapticFeedbackWithIntensity:(float)a3 sharpness:(float)a4;
+ (id)type;
- (BOOL)canReuseCoreHapticsPlayer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighPriority;
- (_UITransientHapticFeedback)initWithDictionaryRepresentation:(id)a3;
- (float)intensity;
- (float)sharpness;
- (id)_playableProtocol;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)_effectivePlayableFeedbackTypes;
@end

@implementation _UITransientHapticFeedback

+ (id)transientHapticFeedbackWithIntensity:(float)a3 sharpness:(float)a4
{
  v6 = objc_alloc_init(_UITransientHapticFeedback);
  v6->_intensity = a3;
  v6->_sharpness = a4;
  return v6;
}

+ (id)type
{
  return @"transientHaptic";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UITransientHapticFeedback)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UITransientHapticFeedback;
  v5 = [(_UIFeedback *)&v12 initWithDictionaryRepresentation:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"intensity"];
    [v6 floatValue];
    v5->_intensity = v7;

    v8 = [v4 objectForKeyedSubscript:@"sharpness"];
    [v8 floatValue];
    v5->_sharpness = v9;

    v10 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)_UITransientHapticFeedback;
  v3 = [(_UIFeedback *)&v11 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  v12[0] = @"intensity";
  *(float *)&double v5 = self->_intensity;
  v6 = [NSNumber numberWithFloat:v5];
  v12[1] = @"sharpness";
  v13[0] = v6;
  *(float *)&double v7 = self->_sharpness;
  v8 = [NSNumber numberWithFloat:v7];
  v13[1] = v8;
  float v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v4 addEntriesFromDictionary:v9];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UITransientHapticFeedback;
  id v4 = [(_UIFeedback *)&v8 copyWithZone:a3];
  [(_UITransientHapticFeedback *)self intensity];
  v4[33] = v5;
  [(_UITransientHapticFeedback *)self sharpness];
  v4[34] = v6;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UITransientHapticFeedback;
  if ([(_UIFeedback *)&v13 isEqual:v4]
    && ([v4 intensity], float v6 = v5, -[_UITransientHapticFeedback intensity](self, "intensity"), v6 == v7))
  {
    [v4 sharpness];
    float v9 = v8;
    [(_UITransientHapticFeedback *)self sharpness];
    BOOL v11 = v9 == v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)_playableProtocol
{
  return &unk_1ED54E6B8;
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  return 2;
}

- (BOOL)canReuseCoreHapticsPlayer
{
  return 1;
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (float)intensity
{
  return self->_intensity;
}

- (float)sharpness
{
  return self->_sharpness;
}

@end