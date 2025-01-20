@interface _UIStickerUsageEvent
+ (BOOL)isPreferredRepresentationAnimated:(id)a3;
+ (int64_t)effectTypeForSticker:(id)a3;
+ (int64_t)effectTypeFromVKCStickerEffectType:(unint64_t)a3;
- (_UIStickerUsageEvent)initWithSuggestedSticker:(id)a3;
- (id)initForEmojiKeyboardUsage;
- (int64_t)effectType;
- (int64_t)sourceType;
- (int64_t)stickerType;
- (int64_t)usageType;
- (void)send;
- (void)setEffectType:(int64_t)a3;
- (void)setSourceType:(int64_t)a3;
- (void)setStickerType:(int64_t)a3;
- (void)setUsageType:(int64_t)a3;
@end

@implementation _UIStickerUsageEvent

+ (int64_t)effectTypeFromVKCStickerEffectType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return qword_186B9D6E0[a3 - 1];
  }
}

+ (BOOL)isPreferredRepresentationAnimated:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [v3 firstObject];
    v5 = [v4 role];
    char v6 = [v5 isEqualToString:@"com.apple.stickers.role.animated"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (int64_t)effectTypeForSticker:(id)a3
{
  id v3 = a3;
  v4 = [v3 representations];
  BOOL v5 = +[_UIStickerUsageEvent isPreferredRepresentationAnimated:v4];

  if (v5) {
    int64_t v6 = 5;
  }
  else {
    int64_t v6 = +[_UIStickerUsageEvent effectTypeFromVKCStickerEffectType:](_UIStickerUsageEvent, "effectTypeFromVKCStickerEffectType:", [v3 effectType]);
  }

  return v6;
}

- (_UIStickerUsageEvent)initWithSuggestedSticker:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIStickerUsageEvent;
  BOOL v5 = [(_UIStickerUsageEvent *)&v8 init];
  int64_t v6 = v5;
  if (v5)
  {
    [(_UIStickerUsageEvent *)v5 setStickerType:0];
    [(_UIStickerUsageEvent *)v6 setSourceType:2];
    [(_UIStickerUsageEvent *)v6 setEffectType:+[_UIStickerUsageEvent effectTypeForSticker:v4]];
  }

  return v6;
}

- (id)initForEmojiKeyboardUsage
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStickerUsageEvent;
  v2 = [(_UIStickerUsageEvent *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    [(_UIStickerUsageEvent *)v2 setEffectType:0];
    [(_UIStickerUsageEvent *)v3 setStickerType:2];
    if (_UIApplicationIsFirstPartyStickers()) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = 3;
    }
    [(_UIStickerUsageEvent *)v3 setSourceType:v4];
  }
  return v3;
}

- (void)send
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"usageSource";
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UIStickerUsageEvent sourceType](self, "sourceType"));
  v9[0] = v3;
  v8[1] = @"stickerType";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UIStickerUsageEvent stickerType](self, "stickerType"));
  v9[1] = v4;
  v8[2] = @"usageType";
  BOOL v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UIStickerUsageEvent usageType](self, "usageType"));
  v9[2] = v5;
  v8[3] = @"effectType";
  objc_super v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UIStickerUsageEvent effectType](self, "effectType"));
  v9[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  AnalyticsSendEvent();
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (int64_t)usageType
{
  return self->_usageType;
}

- (void)setUsageType:(int64_t)a3
{
  self->_usageType = a3;
}

- (int64_t)stickerType
{
  return self->_stickerType;
}

- (void)setStickerType:(int64_t)a3
{
  self->_stickerType = a3;
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(int64_t)a3
{
  self->_effectType = a3;
}

@end