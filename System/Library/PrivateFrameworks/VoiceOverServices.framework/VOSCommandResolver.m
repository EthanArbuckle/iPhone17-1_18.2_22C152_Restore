@interface VOSCommandResolver
+ (id)resolverForCurrentHost;
+ (unint64_t)currentHost;
- (BOOL)isAppleTV;
- (BOOL)isBSIScreenreaderMode;
- (BOOL)isDefaultKeyboardMode;
- (BOOL)isDefaultScreenreaderMode;
- (BOOL)isHandwritingScreenreaderMode;
- (BOOL)isHomePod;
- (BOOL)isIPad;
- (BOOL)isIPhone;
- (BOOL)isQuickNavKeyboardMode;
- (BOOL)isWatch;
- (BOOL)shouldApplyRTL;
- (VOSCommandResolver)resolverWithScreenreaderModeVariant:(id)a3;
- (VOSScreenreaderMode)screenreaderMode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fetchContextBlock;
- (id)fetchPressCountBlock;
- (id)resolvingEventOccurredBlock;
- (int64_t)pressCount;
- (unint64_t)bsiTypingMode;
- (unint64_t)context;
- (unint64_t)host;
- (unint64_t)keyboardMode;
- (void)setBsiTypingMode:(unint64_t)a3;
- (void)setFetchContextBlock:(id)a3;
- (void)setFetchPressCountBlock:(id)a3;
- (void)setHost:(unint64_t)a3;
- (void)setKeyboardMode:(unint64_t)a3;
- (void)setResolvingEventOccurredBlock:(id)a3;
- (void)setScreenreaderMode:(id)a3;
- (void)setShouldApplyRTL:(BOOL)a3;
@end

@implementation VOSCommandResolver

+ (unint64_t)currentHost
{
  if (currentHost_onceToken != -1) {
    dispatch_once(&currentHost_onceToken, &__block_literal_global_5);
  }
  return currentHost__Host;
}

uint64_t __33__VOSCommandResolver_currentHost__block_invoke()
{
  uint64_t result = AXDeviceIsPad();
  if (result)
  {
    uint64_t v1 = 1;
  }
  else
  {
    uint64_t result = AXDeviceIsAudioAccessory();
    uint64_t v1 = 4;
    if (!result) {
      uint64_t v1 = 0;
    }
  }
  currentHost__Host = v1;
  return result;
}

+ (id)resolverForCurrentHost
{
  v2 = objc_alloc_init(VOSCommandResolver);
  [(VOSCommandResolver *)v2 setHost:+[VOSCommandResolver currentHost]];

  return v2;
}

- (VOSCommandResolver)resolverWithScreenreaderModeVariant:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(VOSCommandResolver *)self copy];
  [v5 setScreenreaderMode:v4];

  return (VOSCommandResolver *)v5;
}

- (BOOL)isDefaultScreenreaderMode
{
  v2 = [(VOSCommandResolver *)self screenreaderMode];
  v3 = +[VOSScreenreaderMode Default];
  BOOL v4 = v2 == v3;

  return v4;
}

- (BOOL)isBSIScreenreaderMode
{
  v2 = [(VOSCommandResolver *)self screenreaderMode];
  v3 = +[VOSScreenreaderMode BrailleScreenInput];
  BOOL v4 = v2 == v3;

  return v4;
}

- (BOOL)isHandwritingScreenreaderMode
{
  v2 = [(VOSCommandResolver *)self screenreaderMode];
  v3 = +[VOSScreenreaderMode Handwriting];
  BOOL v4 = v2 == v3;

  return v4;
}

- (BOOL)isIPad
{
  return [(VOSCommandResolver *)self host] == 1;
}

- (BOOL)isIPhone
{
  return [(VOSCommandResolver *)self host] == 0;
}

- (BOOL)isWatch
{
  return [(VOSCommandResolver *)self host] == 2;
}

- (BOOL)isAppleTV
{
  return [(VOSCommandResolver *)self host] == 3;
}

- (BOOL)isHomePod
{
  return [(VOSCommandResolver *)self host] == 4;
}

- (VOSScreenreaderMode)screenreaderMode
{
  screenreaderMode = self->_screenreaderMode;
  if (screenreaderMode)
  {
    v3 = screenreaderMode;
  }
  else
  {
    v3 = +[VOSScreenreaderMode Default];
  }

  return v3;
}

- (BOOL)isDefaultKeyboardMode
{
  return [(VOSCommandResolver *)self keyboardMode] == 0;
}

- (BOOL)isQuickNavKeyboardMode
{
  return [(VOSCommandResolver *)self keyboardMode] == 1;
}

- (int64_t)pressCount
{
  cachedPressCount = self->_cachedPressCount;
  if (!cachedPressCount)
  {
    BOOL v4 = [(VOSCommandResolver *)self fetchPressCountBlock];

    if (v4)
    {
      v5 = [(VOSCommandResolver *)self fetchPressCountBlock];
      unint64_t v6 = ((uint64_t (**)(void, VOSCommandResolver *))v5)[2](v5, self);

      if (v6 <= 1) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = v6;
      }
    }
    else
    {
      uint64_t v7 = 1;
    }
    v8 = [NSNumber numberWithInteger:v7];
    v9 = self->_cachedPressCount;
    self->_cachedPressCount = v8;

    cachedPressCount = self->_cachedPressCount;
  }

  return [(NSNumber *)cachedPressCount integerValue];
}

- (unint64_t)context
{
  cachedContext = self->_cachedContext;
  if (!cachedContext)
  {
    BOOL v4 = [(VOSCommandResolver *)self fetchContextBlock];

    if (v4)
    {
      v5 = [(VOSCommandResolver *)self fetchContextBlock];
      BOOL v4 = (void *)((uint64_t (**)(void, VOSCommandResolver *))v5)[2](v5, self);
    }
    unint64_t v6 = [NSNumber numberWithUnsignedInteger:v4];
    uint64_t v7 = self->_cachedContext;
    self->_cachedContext = v6;

    cachedContext = self->_cachedContext;
  }

  return [(NSNumber *)cachedContext unsignedIntegerValue];
}

- (void)setFetchContextBlock:(id)a3
{
  if (self->_fetchContextBlock != a3)
  {
    BOOL v4 = _Block_copy(a3);
    id fetchContextBlock = self->_fetchContextBlock;
    self->_id fetchContextBlock = v4;

    cachedContext = self->_cachedContext;
    self->_cachedContext = 0;
  }
}

- (void)setFetchPressCountBlock:(id)a3
{
  if (self->_fetchPressCountBlock != a3)
  {
    BOOL v4 = _Block_copy(a3);
    id fetchPressCountBlock = self->_fetchPressCountBlock;
    self->_id fetchPressCountBlock = v4;

    cachedPressCount = self->_cachedPressCount;
    self->_cachedPressCount = 0;
  }
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(VOSCommandResolver *)self host];
  uint64_t v7 = [(VOSCommandResolver *)self screenreaderMode];
  v8 = [v3 stringWithFormat:@"%@<%p> Host:%d SCRMode:%@ ApplyRTL:%d BSI:%d pressCount:%d", v5, self, v6, v7, -[VOSCommandResolver shouldApplyRTL](self, "shouldApplyRTL"), -[VOSCommandResolver bsiTypingMode](self, "bsiTypingMode"), -[VOSCommandResolver pressCount](self, "pressCount")];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_alloc_init(VOSCommandResolver);
  v5 = [(VOSCommandResolver *)self screenreaderMode];
  [(VOSCommandResolver *)v4 setScreenreaderMode:v5];

  [(VOSCommandResolver *)v4 setShouldApplyRTL:[(VOSCommandResolver *)self shouldApplyRTL]];
  [(VOSCommandResolver *)v4 setKeyboardMode:[(VOSCommandResolver *)self keyboardMode]];
  [(VOSCommandResolver *)v4 setHost:[(VOSCommandResolver *)self host]];
  [(VOSCommandResolver *)v4 setBsiTypingMode:[(VOSCommandResolver *)self bsiTypingMode]];
  unint64_t v6 = [(VOSCommandResolver *)self fetchPressCountBlock];
  [(VOSCommandResolver *)v4 setFetchPressCountBlock:v6];

  uint64_t v7 = [(VOSCommandResolver *)self fetchContextBlock];
  [(VOSCommandResolver *)v4 setFetchContextBlock:v7];

  v8 = [(VOSCommandResolver *)self resolvingEventOccurredBlock];
  [(VOSCommandResolver *)v4 setResolvingEventOccurredBlock:v8];

  return v4;
}

- (void)setScreenreaderMode:(id)a3
{
}

- (BOOL)shouldApplyRTL
{
  return self->_shouldApplyRTL;
}

- (void)setShouldApplyRTL:(BOOL)a3
{
  self->_shouldApplyRTL = a3;
}

- (unint64_t)keyboardMode
{
  return self->_keyboardMode;
}

- (void)setKeyboardMode:(unint64_t)a3
{
  self->_keyboardMode = a3;
}

- (unint64_t)host
{
  return self->_host;
}

- (void)setHost:(unint64_t)a3
{
  self->_host = a3;
}

- (unint64_t)bsiTypingMode
{
  return self->_bsiTypingMode;
}

- (void)setBsiTypingMode:(unint64_t)a3
{
  self->_bsiTypingMode = a3;
}

- (id)fetchPressCountBlock
{
  return self->_fetchPressCountBlock;
}

- (id)fetchContextBlock
{
  return self->_fetchContextBlock;
}

- (id)resolvingEventOccurredBlock
{
  return self->_resolvingEventOccurredBlock;
}

- (void)setResolvingEventOccurredBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resolvingEventOccurredBlock, 0);
  objc_storeStrong(&self->_fetchContextBlock, 0);
  objc_storeStrong(&self->_fetchPressCountBlock, 0);
  objc_storeStrong((id *)&self->_screenreaderMode, 0);
  objc_storeStrong((id *)&self->_cachedContext, 0);

  objc_storeStrong((id *)&self->_cachedPressCount, 0);
}

@end