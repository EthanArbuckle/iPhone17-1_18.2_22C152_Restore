@interface _UICustomDiscreteFeedback
+ (id)customDiscreteFeedbackWithEventType:(unint64_t)a3 systemSoundID:(unsigned int)a4;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (_UICustomDiscreteFeedback)initWithDictionaryRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)_effectiveEventType;
- (unint64_t)eventType;
- (unsigned)_effectiveSystemSoundID;
- (unsigned)systemSoundID;
@end

@implementation _UICustomDiscreteFeedback

- (unint64_t)_effectiveEventType
{
  unint64_t result = self->_eventType;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UICustomDiscreteFeedback;
    return [(_UIDiscreteFeedback *)&v4 _effectiveEventType];
  }
  return result;
}

- (unsigned)_effectiveSystemSoundID
{
  unsigned int result = self->_systemSoundID;
  if (result == _UISystemSoundIDNone)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UICustomDiscreteFeedback;
    return [(_UIDiscreteFeedback *)&v4 _effectiveSystemSoundID];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UICustomDiscreteFeedback;
  BOOL v5 = [(_UIDiscreteFeedback *)&v7 isEqual:v4]
    && self->_eventType == v4[19]
    && self->_systemSoundID == *((_DWORD *)v4 + 36);

  return v5;
}

+ (id)customDiscreteFeedbackWithEventType:(unint64_t)a3 systemSoundID:(unsigned int)a4
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____UICustomDiscreteFeedback;
  uint64_t v6 = objc_msgSendSuper2(&v8, sel_discreteFeedbackForType_, 0);
  *(void *)(v6 + 152) = a3;
  *(_DWORD *)(v6 + 144) = a4;
  return (id)v6;
}

- (_UICustomDiscreteFeedback)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UICustomDiscreteFeedback;
  BOOL v5 = [(_UIDiscreteFeedback *)&v10 initWithDictionaryRepresentation:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventType"];
    v5->_eventType = (int)[v6 intValue];

    objc_super v7 = [v4 objectForKeyedSubscript:@"systemSoundID"];
    v5->_systemSoundID = [v7 intValue];

    objc_super v8 = v5;
  }

  return v5;
}

+ (id)type
{
  return @"custom";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UICustomDiscreteFeedback;
  id result = [(_UIDiscreteFeedback *)&v5 copyWithZone:a3];
  *((void *)result + 19) = self->_eventType;
  *((_DWORD *)result + 36) = self->_systemSoundID;
  return result;
}

- (id)dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UICustomDiscreteFeedback;
  v3 = [(_UIDiscreteFeedback *)&v9 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  v10[0] = @"eventType";
  objc_super v5 = [NSNumber numberWithUnsignedInteger:self->_eventType];
  v10[1] = @"systemSoundID";
  v11[0] = v5;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:self->_systemSoundID];
  v11[1] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 addEntriesFromDictionary:v7];

  return v4;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unsigned)systemSoundID
{
  return self->_systemSoundID;
}

@end