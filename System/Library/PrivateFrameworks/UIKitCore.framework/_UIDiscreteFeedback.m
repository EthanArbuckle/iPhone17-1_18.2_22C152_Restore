@interface _UIDiscreteFeedback
+ (BOOL)supportsSecureCoding;
+ (id)discreteFeedbackForType:(int64_t)a3;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighPriority;
- (BOOL)isPlaying;
- (_UIDiscreteFeedback)initWithDictionaryRepresentation:(id)a3;
- (id)_debugDictionary;
- (id)_playableProtocol;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)type;
- (unint64_t)_effectiveEventType;
- (unsigned)_effectiveSystemSoundID;
- (void)setType:(int64_t)a3;
@end

@implementation _UIDiscreteFeedback

- (unint64_t)_effectiveEventType
{
  int64_t type = self->_type;
  switch(type)
  {
    case 1:
      unint64_t result = 14167;
      break;
    case 2:
      unint64_t result = 20311;
      break;
    case 3:
      unint64_t result = 29527;
      break;
    case 4:
      unint64_t result = 11094;
      break;
    case 5:
      unint64_t result = 17238;
      break;
    case 6:
      unint64_t result = 26454;
      break;
    case 7:
      goto LABEL_5;
    case 8:
      unint64_t result = 17237;
      break;
    case 9:
      unint64_t result = 26453;
      break;
    case 10:
      unint64_t result = 8022;
      break;
    case 11:
      unint64_t result = 29525;
      break;
    default:
      if (type == 1000)
      {
        unint64_t result = 8021;
      }
      else if (type == 1002)
      {
LABEL_5:
        unint64_t result = 11093;
      }
      else
      {
        unint64_t result = 0;
      }
      break;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDiscreteFeedback;
  id result = [(_UIFeedback *)&v5 copyWithZone:a3];
  *((void *)result + 17) = self->_type;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIDiscreteFeedback;
  if ([(_UIFeedback *)&v7 isEqual:v4]) {
    BOOL v5 = self->_type == v4[17];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)discreteFeedbackForType:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setType:a3];
  return v4;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (_UIDiscreteFeedback)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDiscreteFeedback;
  BOOL v5 = [(_UIFeedback *)&v9 initWithDictionaryRepresentation:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"feedbackType"];
    v5->_int64_t type = (int)[v6 intValue];

    objc_super v7 = v5;
  }

  return v5;
}

- (unsigned)_effectiveSystemSoundID
{
  int64_t type = self->_type;
  if (type == 1001) {
    return 1519;
  }
  if (type == 1002) {
    return 1520;
  }
  return _UISystemSoundIDNone;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"discrete";
}

- (id)dictionaryRepresentation
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_UIDiscreteFeedback;
  v3 = [(_UIFeedback *)&v8 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  objc_super v9 = @"feedbackType";
  BOOL v5 = [NSNumber numberWithInteger:self->_type];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v4 addEntriesFromDictionary:v6];

  return v4;
}

- (id)_playableProtocol
{
  return &unk_1ED54E6B8;
}

- (BOOL)isPlaying
{
  v2 = [(_UIFeedback *)self _player];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_debugDictionary
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"feedbackType";
  int64_t v3 = [(_UIDiscreteFeedback *)self type];
  if ((unint64_t)(v3 - 1) > 8) {
    id v4 = @"Unknown";
  }
  else {
    id v4 = off_1E52ED3C8[v3 - 1];
  }
  v10[0] = v4;
  v9[1] = @"effectiveEventType";
  BOOL v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_UIDiscreteFeedback _effectiveEventType](self, "_effectiveEventType"));
  v10[1] = v5;
  v9[2] = @"effectiveSystemSoundID";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[_UIDiscreteFeedback _effectiveSystemSoundID](self, "_effectiveSystemSoundID"));
  void v10[2] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (int64_t)type
{
  return self->_type;
}

@end