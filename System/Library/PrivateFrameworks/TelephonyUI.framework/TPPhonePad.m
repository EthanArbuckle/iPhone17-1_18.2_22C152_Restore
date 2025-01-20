@interface TPPhonePad
+ (BOOL)launchFieldTestIfNeeded:(id)a3;
+ (BOOL)shouldStringAutoDial:(id)a3 givenLastChar:(char)a4;
+ (void)_delayedDeactivate;
- (BOOL)cancelTouchTracking;
- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4;
- (CGPoint)_keypadOrigin;
- (CGRect)_rectForKey:(unint64_t)a3;
- (CGRect)_updateRect:(CGRect)result withScale:(double)a4;
- (TPPhonePad)initWithFrame:(CGRect)a3;
- (double)_yFudge;
- (id)_buttonForKeyAtIndex:(unint64_t)a3;
- (id)_highlightedImage;
- (id)_imageByCroppingImage:(id)a3 toRect:(CGRect)a4;
- (id)_keypadImage;
- (id)_pressedImage;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int)_keyForPoint:(CGPoint)a3;
- (int64_t)indexForHighlightedKey;
- (void)_activateSounds:(BOOL)a3;
- (void)_appResumed;
- (void)_appSuspended;
- (void)_handleKey:(id)a3 forUIEvent:(id)a4;
- (void)_handleKeyPressAndHoldForDownKey:(id)a3;
- (void)_handleKeyPressAndHoldForHighlightedKey:(id)a3;
- (void)_handleKeyPressAndHoldForKey:(int64_t)a3;
- (void)_notifySoundCompletionIfNecessary:(unsigned int)a3;
- (void)_playSoundForKey:(unint64_t)a3;
- (void)_stopAllSoundsForcingCallbacks:(BOOL)a3;
- (void)_stopSoundForKey:(unint64_t)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)highlightKeyAtIndex:(int64_t)a3;
- (void)movedFromWindow:(id)a3;
- (void)movedToWindow:(id)a3;
- (void)performTapActionCancelForHighlightedKey;
- (void)performTapActionDownForHighlightedKey;
- (void)performTapActionEndForHighlightedKey;
- (void)removeFromSuperview;
- (void)setButton:(id)a3 forKeyAtIndex:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setNeedsDisplayForKey:(int)a3;
- (void)setPlaysSounds:(BOOL)a3;
@end

@implementation TPPhonePad

- (void)performTapActionDownForHighlightedKey
{
  if ((self->_highlightKey & 0x8000000000000000) == 0)
  {
    if (self->_playsSounds) {
      -[TPPhonePad _playSoundForKey:](self, "_playSoundForKey:");
    }
    if (self->_delegate)
    {
      if (objc_opt_respondsToSelector()) {
        [(TPDialerKeypadDelegate *)self->_delegate phonePad:self appendString:kKeyStrs[self->_highlightKey]];
      }
      if (self->_delegate)
      {
        if ((unint64_t)(self->_highlightKey - 9) > 2
          || ([(TPPhonePad *)self performSelector:sel__handleKeyPressAndHoldForHighlightedKey_ withObject:0 afterDelay:1.0], self->_delegate))
        {
          if (objc_opt_respondsToSelector())
          {
            delegate = self->_delegate;
            uint64_t v4 = kKeyValues[self->_downKey];
            [(TPDialerKeypadDelegate *)delegate phonePad:self keyDown:v4];
          }
        }
      }
    }
  }
}

- (void)performTapActionEndForHighlightedKey
{
  int64_t highlightKey = self->_highlightKey;
  if ((highlightKey & 0x8000000000000000) == 0)
  {
    if (self->_delegate)
    {
      char v4 = objc_opt_respondsToSelector();
      int64_t highlightKey = self->_highlightKey;
      if (v4)
      {
        [(TPDialerKeypadDelegate *)self->_delegate phonePad:self keyUp:kKeyValues[highlightKey]];
        int64_t highlightKey = self->_highlightKey;
      }
    }
    if (self->_playsSounds)
    {
      [(TPPhonePad *)self _stopSoundForKey:highlightKey];
      int64_t highlightKey = self->_highlightKey;
    }
    if ((unint64_t)(highlightKey - 9) <= 2)
    {
      v5 = (void *)MEMORY[0x1E4FBA8A8];
      [v5 cancelPreviousPerformRequestsWithTarget:self selector:sel__handleKeyPressAndHoldForHighlightedKey_ object:0];
    }
  }
}

- (void)performTapActionCancelForHighlightedKey
{
  if ((self->_highlightKey & 0x8000000000000000) == 0)
  {
    if (self->_playsSounds) {
      -[TPPhonePad _stopSoundForKey:](self, "_stopSoundForKey:");
    }
    v3 = (void *)MEMORY[0x1E4FBA8A8];
    [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__handleKeyPressAndHoldForHighlightedKey_ object:0];
  }
}

- (void)highlightKeyAtIndex:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = TPDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_impl(&dword_1C2F24000, v5, OS_LOG_TYPE_DEFAULT, "highlightKeyAtIndex: %ld", (uint8_t *)&v6, 0xCu);
  }

  self->_int64_t highlightKey = a3;
  [(TPPhonePad *)self setNeedsDisplayForKey:a3];
}

- (int64_t)indexForHighlightedKey
{
  return self->_highlightKey;
}

+ (BOOL)shouldStringAutoDial:(id)a3 givenLastChar:(char)a4
{
  int v4 = a4;
  id v5 = a3;
  int v6 = v5;
  if (v4 != 35) {
    goto LABEL_21;
  }
  uint64_t v7 = [v5 rangeOfString:@"**0" options:8];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v6 isEqualToString:@"*#06#"])
    {
      BOOL v9 = 1;
      goto LABEL_22;
    }
LABEL_21:
    BOOL v9 = 0;
    goto LABEL_22;
  }
  uint64_t v10 = v7 + v8;
  uint64_t v11 = [v6 length];
  uint64_t v12 = v10 + 1;
  if (v11 <= v10 + 1) {
    goto LABEL_21;
  }
  uint64_t v13 = v11;
  if (([v6 characterAtIndex:v10] & 0xFFFE) != 0x34) {
    goto LABEL_21;
  }
  int v14 = [v6 characterAtIndex:v10 + 1];
  if (v14 == 50)
  {
    uint64_t v12 = v10 + 2;
    if (v13 <= v10 + 2) {
      goto LABEL_21;
    }
    int v14 = [v6 characterAtIndex:v10 + 2];
  }
  if (v14 != 42) {
    goto LABEL_21;
  }
  uint64_t v15 = v13 - 2;
  if (v12 >= v13 - 2) {
    goto LABEL_21;
  }
  do
  {
    int v16 = [v6 characterAtIndex:v12];
    BOOL v9 = v16 == 42 || (v16 - 48) < 0xA;
    if (v15 == v12) {
      break;
    }
    ++v12;
  }
  while (v9);
LABEL_22:

  return v9;
}

+ (BOOL)launchFieldTestIfNeeded:(id)a3
{
  int v3 = [a3 isEqualToString:@"*3001#12345#*"];
  if (v3) {
    [(id)*MEMORY[0x1E4FB2608] launchApplicationWithIdentifier:@"com.apple.fieldtest" suspended:0];
  }
  return v3;
}

- (TPPhonePad)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPPhonePad;
  int v3 = -[TPPhonePad initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int v4 = v3;
  if (v3)
  {
    [(TPPhonePad *)v3 setOpaque:0];
    [(TPPhonePad *)v4 addTarget:v4 action:sel__handleKey_forUIEvent_ forEvents:193];
    v4->_downKey = -1;
    v4->_int64_t highlightKey = -1;
    v4->_topHeight = 58.0;
    v4->_midHeight = 56.0;
    v4->_bottomHeight = 68.0;
    v4->_leftWidth = 96.0;
    v4->_midWidth = 91.0;
    v4->_rightWidth = 96.0;
    [(TPPhonePad *)v4 setPlaysSounds:1];
  }
  return v4;
}

- (void)dealloc
{
  [(TPPhonePad *)self _activateSounds:0];
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  keyToButtonMap = self->_keyToButtonMap;
  if (keyToButtonMap) {
    CFRelease(keyToButtonMap);
  }
  if (self->_inflightSounds)
  {
    [(TPPhonePad *)self _stopAllSoundsForcingCallbacks:1];
    CFRelease(self->_inflightSounds);
  }
  v5.receiver = self;
  v5.super_class = (Class)TPPhonePad;
  [(TPPhonePad *)&v5 dealloc];
}

+ (void)_delayedDeactivate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!__SystemSoundActivationCount)
  {
    int inPropertyData = 0;
    AudioServicesSetProperty(0x61637421u, 4u, &kSoundIDs, 4u, &inPropertyData);
    v2 = TPDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v5 = inPropertyData;
      _os_log_impl(&dword_1C2F24000, v2, OS_LOG_TYPE_DEFAULT, "Called AudioServicesSetProperty() with kAudioServicesPropertyActivate and active=%d", buf, 8u);
    }

    __PendingDeactivate = 0;
  }
}

- (void)_activateSounds:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = (*((unsigned __int8 *)self + 556) >> 1) & 1;
  if (a3
    && [(TPPhonePad *)self _isInAWindow]
    && (uint64_t v6 = (id *)MEMORY[0x1E4FB2608], ([(id)*MEMORY[0x1E4FB2608] isSuspended] & 1) == 0))
  {
    int v7 = [*v6 isSuspendedEventsOnly] ^ 1;
  }
  else
  {
    int v7 = 0;
  }
  if (v7 != v5)
  {
    if (v3) {
      int v8 = __SystemSoundActivationCount + 1;
    }
    else {
      int v8 = __SystemSoundActivationCount - 1;
    }
    __SystemSoundActivationCount = v8;
    if (v3 && v8 == 1)
    {
      if ((__PendingDeactivate & 1) == 0)
      {
        int inPropertyData = 1;
        AudioServicesSetProperty(0x61637421u, 4u, &kSoundIDs, 4u, &inPropertyData);
        BOOL v9 = TPDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v13 = inPropertyData;
          _os_log_impl(&dword_1C2F24000, v9, OS_LOG_TYPE_DEFAULT, "Called AudioServicesSetProperty() with kAudioServicesPropertyActivate and active=%d", buf, 8u);
        }
      }
    }
    else if (!v3 && !v8)
    {
      [(id)objc_opt_class() performSelector:sel__delayedDeactivate withObject:0 afterDelay:0.0];
      __PendingDeactivate = 1;
    }
    if (v3) {
      char v10 = 2;
    }
    else {
      char v10 = 0;
    }
    *((unsigned char *)self + 556) = *((unsigned char *)self + 556) & 0xFD | v10;
  }
}

- (void)removeFromSuperview
{
  [(TPPhonePad *)self _activateSounds:0];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)TPPhonePad;
  [(TPPhonePad *)&v3 removeFromSuperview];
}

- (void)_appSuspended
{
}

- (void)_appResumed
{
  if (self->_playsSounds) {
    [(TPPhonePad *)self _activateSounds:1];
  }
}

- (void)movedFromWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPPhonePad;
  [(TPPhonePad *)&v4 movedFromWindow:a3];
  [(TPPhonePad *)self _activateSounds:0];
}

- (void)movedToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPPhonePad;
  [(TPPhonePad *)&v4 movedToWindow:a3];
  if (self->_playsSounds) {
    [(TPPhonePad *)self _activateSounds:1];
  }
}

- (void)setDelegate:(id)a3
{
  int v5 = (TPDialerKeypadDelegate *)a3;
  if (self->_delegate != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)&self->_delegate, a3);
    if (objc_opt_respondsToSelector()) {
      char v6 = objc_opt_respondsToSelector();
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 556) = *((unsigned char *)self + 556) & 0xFE | v6 & 1;
    self->_incompleteSounds = 0;
    int v5 = v7;
  }
}

- (void)setPlaysSounds:(BOOL)a3
{
  if (self->_playsSounds != a3)
  {
    BOOL v3 = a3;
    self->_playsSounds = a3;
    if (a3)
    {
      self->_inflightSounds = CFSetCreateMutable(0, 12, 0);
      int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 addObserver:self selector:sel__appSuspended name:*MEMORY[0x1E4FB2718] object:0];
      [v5 addObserver:self selector:sel__appSuspended name:*MEMORY[0x1E4FB2710] object:0];
      [v5 addObserver:self selector:sel__appResumed name:*MEMORY[0x1E4FB2700] object:0];
      [v5 addObserver:self selector:sel__appResumed name:*MEMORY[0x1E4FB26F8] object:0];
    }
    else
    {
      if (self->_inflightSounds)
      {
        [(TPPhonePad *)self _stopAllSoundsForcingCallbacks:1];
        CFRelease(self->_inflightSounds);
        self->_inflightSounds = 0;
      }
      int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 removeObserver:self name:*MEMORY[0x1E4FB2718] object:0];
      [v5 removeObserver:self name:*MEMORY[0x1E4FB2710] object:0];
      [v5 removeObserver:self name:*MEMORY[0x1E4FB2700] object:0];
      [v5 removeObserver:self name:*MEMORY[0x1E4FB26F8] object:0];
    }

    [(TPPhonePad *)self _activateSounds:v3];
  }
}

- (void)setButton:(id)a3 forKeyAtIndex:(unint64_t)a4
{
  id v6 = a3;
  keyToButtonMap = self->_keyToButtonMap;
  value = v6;
  if (keyToButtonMap
    || (keyToButtonMap = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]),
        id v6 = value,
        (self->_keyToButtonMap = keyToButtonMap) != 0))
  {
    if (v6)
    {
      [(TPPhonePad *)self _rectForKey:a4];
      objc_msgSend(value, "setFrame:");
      [(TPPhonePad *)self addSubview:value];
      CFDictionarySetValue(self->_keyToButtonMap, (const void *)a4, value);
    }
    else
    {
      CFDictionaryRemoveValue(keyToButtonMap, (const void *)a4);
    }
  }
  MEMORY[0x1F4181820]();
}

- (id)_buttonForKeyAtIndex:(unint64_t)a3
{
  CFDictionaryRef keyToButtonMap = self->_keyToButtonMap;
  if (keyToButtonMap)
  {
    CFDictionaryGetValue(keyToButtonMap, (const void *)a3);
    CFDictionaryRef keyToButtonMap = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return keyToButtonMap;
}

- (void)setNeedsDisplayForKey:(int)a3
{
  [(TPPhonePad *)self bounds];
  -[TPPhonePad setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
}

- (CGPoint)_keypadOrigin
{
  BOOL v3 = [(TPPhonePad *)self _keypadImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  [(TPPhonePad *)self bounds];
  float v9 = (v8 - v5) * 0.5;
  double v10 = roundf(v9);
  float v12 = (v11 - v7) * 0.5;
  double v13 = roundf(v12);
  [(TPPhonePad *)self _yFudge];
  double v15 = v14 + v13;
  double v16 = v10;
  result.y = v15;
  result.x = v16;
  return result;
}

- (id)_pressedImage
{
  return 0;
}

- (id)_keypadImage
{
  return 0;
}

- (id)_highlightedImage
{
  return 0;
}

- (double)_yFudge
{
  return 4.0;
}

- (CGRect)_updateRect:(CGRect)result withScale:(double)a4
{
  if (a4 != 1.0 && a4 != 0.0)
  {
    result.origin.x = result.origin.x * a4;
    result.origin.y = result.origin.y * a4;
    if (result.size.width <= 1.0) {
      double v4 = 1.0;
    }
    else {
      double v4 = a4;
    }
    result.size.width = result.size.width * v4;
    if (result.size.height > 1.0) {
      result.size.height = result.size.height * a4;
    }
  }
  return result;
}

- (id)_imageByCroppingImage:(id)a3 toRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  [v9 scale];
  -[TPPhonePad _updateRect:withScale:](self, "_updateRect:withScale:", x, y, width, height, v10);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  id v19 = v9;
  v20 = (CGImage *)[v19 CGImage];

  v25.origin.double x = v12;
  v25.origin.double y = v14;
  v25.size.double width = v16;
  v25.size.double height = v18;
  v21 = CGImageCreateWithImageInRect(v20, v25);
  v22 = [MEMORY[0x1E4FB1818] imageWithCGImage:v21];
  CGImageRelease(v21);
  return v22;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TPPhonePad *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  id v41 = [(TPPhonePad *)self _keypadImage];
  [v41 size];
  [(TPPhonePad *)self _keypadOrigin];
  double v42 = v17;
  double v43 = v16;
  v45.origin.double x = x;
  v45.origin.double y = y;
  v45.size.double width = width;
  v45.size.double height = height;
  v47.origin.double x = v9;
  v47.origin.double y = v11;
  v47.size.double width = v13;
  v47.size.double height = v15;
  BOOL v18 = CGRectEqualToRect(v45, v47);
  BOOL v19 = v18;
  if (v18) {
    objc_msgSend(v41, "drawAtPoint:blendMode:alpha:", 17, v43, v42, 1.0);
  }
  if (self->_downKey < 0)
  {
    double v21 = *MEMORY[0x1E4F1DB28];
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    if (v19) {
      goto LABEL_10;
    }
  }
  else
  {
    -[TPPhonePad _rectForKey:](self, "_rectForKey:");
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    if (v19) {
      goto LABEL_10;
    }
  }
  if (self->_downKey < 0) {
    goto LABEL_9;
  }
  v46.origin.double x = v21;
  v46.origin.double y = v23;
  v46.size.double width = v25;
  v46.size.double height = v27;
  v48.origin.double x = x;
  v48.origin.double y = y;
  v48.size.double width = width;
  v48.size.double height = height;
  if (!CGRectEqualToRect(v46, v48))
  {
LABEL_9:
    v28 = -[TPPhonePad _imageByCroppingImage:toRect:](self, "_imageByCroppingImage:toRect:", v41, x - v43, y - v42, width, height);
    objc_msgSend(v28, "drawInRect:blendMode:alpha:", 17, x, y, width, height, 1.0);
  }
LABEL_10:
  if ((self->_downKey & 0x8000000000000000) == 0)
  {
    v29 = [(TPPhonePad *)self _pressedImage];
    v30 = -[TPPhonePad _imageByCroppingImage:toRect:](self, "_imageByCroppingImage:toRect:", v29, v21 - v43, v23 - v42, v25, v27);
    objc_msgSend(v30, "drawInRect:blendMode:alpha:", 17, v21, v23, v25, v27, 1.0);
  }
  if ((self->_highlightKey & 0x8000000000000000) == 0)
  {
    -[TPPhonePad _rectForKey:](self, "_rectForKey:");
    if ((self->_highlightKey & 0x8000000000000000) == 0)
    {
      double v35 = v31;
      double v36 = v32;
      double v37 = v33;
      double v38 = v34;
      v39 = [(TPPhonePad *)self _highlightedImage];
      v40 = -[TPPhonePad _imageByCroppingImage:toRect:](self, "_imageByCroppingImage:toRect:", v39, v35 - v43, v36 - v42, v37, v38);
      objc_msgSend(v40, "drawInRect:blendMode:alpha:", 17, v35, v36, v37, v38, 1.0);
    }
  }
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TPPhonePad;
  double v5 = -[TPPhonePad hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v6 = self;

      double v5 = v6;
    }
  }
  return v5;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (((self->_downKey & 0x8000000000000000) == 0 || (self->_highlightKey & 0x8000000000000000) == 0 || !a3)
    && [(TPPhonePad *)self isHighlighted] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)TPPhonePad;
    [(TPPhonePad *)&v7 setHighlighted:v3];
    if ((self->_downKey & 0x8000000000000000) == 0) {
      -[TPPhonePad setNeedsDisplayForKey:](self, "setNeedsDisplayForKey:");
    }
    if ((self->_highlightKey & 0x8000000000000000) == 0) {
      -[TPPhonePad setNeedsDisplayForKey:](self, "setNeedsDisplayForKey:");
    }
    CFDictionaryRef keyToButtonMap = self->_keyToButtonMap;
    if (keyToButtonMap)
    {
      double v6 = CFDictionaryGetValue(keyToButtonMap, (const void *)self->_downKey);
      [v6 setSelected:v3];
    }
    if (!v3)
    {
      self->_downKedouble y = -1;
      [(TPPhonePad *)self _stopAllSoundsForcingCallbacks:0];
    }
  }
}

- (BOOL)cancelTouchTracking
{
  downKedouble y = self->_downKey;
  if ((downKey & 0x8000000000000000) == 0)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__handleKeyPressAndHoldForDownKey_ object:self];
    [(TPPhonePad *)self setHighlighted:self->_highlightKey >= 0];
    self->_downKedouble y = -1;
    if (self->_delegate)
    {
      if (objc_opt_respondsToSelector()) {
        [(TPDialerKeypadDelegate *)self->_delegate phonePad:self keyUp:kKeyValues[downKey]];
      }
    }
  }
  [(TPPhonePad *)self _stopAllSoundsForcingCallbacks:1];
  v5.receiver = self;
  v5.super_class = (Class)TPPhonePad;
  return [(TPPhonePad *)&v5 cancelTouchTracking];
}

- (void)_handleKey:(id)a3 forUIEvent:(id)a4
{
  id v12 = a3;
  double v6 = [a4 touchesForView:self];
  objc_super v7 = [v6 anyObject];

  uint64_t v8 = [v7 phase];
  if (v8 == 3)
  {
    downKedouble y = self->_downKey;
    if ((downKey & 0x8000000000000000) == 0)
    {
      if (self->_delegate)
      {
        char v11 = objc_opt_respondsToSelector();
        downKedouble y = self->_downKey;
        if (v11)
        {
          [(TPDialerKeypadDelegate *)self->_delegate phonePad:self keyUp:kKeyValues[downKey]];
          downKedouble y = self->_downKey;
        }
      }
      if (self->_playsSounds)
      {
        [(TPPhonePad *)self _stopSoundForKey:downKey];
        downKedouble y = self->_downKey;
      }
      if ((unint64_t)(downKey - 9) <= 2) {
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__handleKeyPressAndHoldForDownKey_ object:v12];
      }
    }
  }
  else if (!v8)
  {
    if ((self->_downKey & 0x8000000000000000) == 0) {
      [(TPPhonePad *)self setHighlighted:self->_highlightKey >= 0];
    }
    [v7 locationInView:self];
    int v9 = -[TPPhonePad _keyForPoint:](self, "_keyForPoint:");
    self->_downKedouble y = v9;
    if ((v9 & 0x80000000) == 0)
    {
      if (self->_playsSounds) {
        -[TPPhonePad _playSoundForKey:](self, "_playSoundForKey:");
      }
      if (self->_delegate)
      {
        if (objc_opt_respondsToSelector()) {
          [(TPDialerKeypadDelegate *)self->_delegate phonePad:self appendString:kKeyStrs[self->_downKey]];
        }
        if (self->_delegate)
        {
          if ((unint64_t)(self->_downKey - 9) > 2
            || ([(TPPhonePad *)self performSelector:sel__handleKeyPressAndHoldForDownKey_ withObject:v12 afterDelay:1.0], self->_delegate))
          {
            if (objc_opt_respondsToSelector()) {
              [(TPDialerKeypadDelegate *)self->_delegate phonePad:self keyDown:kKeyValues[self->_downKey]];
            }
          }
        }
      }
      [(TPPhonePad *)self setHighlighted:1];
    }
  }
}

- (void)_handleKeyPressAndHoldForHighlightedKey:(id)a3
{
}

- (void)_handleKeyPressAndHoldForDownKey:(id)a3
{
}

- (void)_handleKeyPressAndHoldForKey:(int64_t)a3
{
  if ((unint64_t)(a3 - 9) <= 2 && self->_delegate)
  {
    double v4 = off_1E647C3C8[a3 - 9];
    char v5 = objc_opt_respondsToSelector();
    delegate = self->_delegate;
    if (v5)
    {
      [(TPDialerKeypadDelegate *)delegate phonePad:self replaceLastDigitWithString:v4];
    }
    else if (delegate)
    {
      if (objc_opt_respondsToSelector()) {
        [(TPDialerKeypadDelegate *)self->_delegate phonePadDeleteLastDigit:self];
      }
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_super v7 = self->_delegate;
        [(TPDialerKeypadDelegate *)v7 phonePad:self appendString:v4];
      }
    }
  }
}

- (int)_keyForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(TPPhonePad *)self _keypadImage];
  [v6 size];
  double v8 = v7;

  [(TPPhonePad *)self _keypadOrigin];
  double v10 = x - v9;
  double v12 = y - v11;
  double leftWidth = self->_leftWidth;
  if (v10 >= leftWidth)
  {
    if (v10 >= leftWidth + self->_midWidth) {
      int v14 = 2;
    }
    else {
      int v14 = 1;
    }
  }
  else
  {
    int v14 = 0;
  }
  if (v12 < 0.0 || v12 > v8) {
    return -1;
  }
  double topHeight = self->_topHeight;
  if (v12 < topHeight)
  {
    int v18 = 0;
    return v18 + v14;
  }
  if (v12 >= v8 - self->_bottomHeight)
  {
    int v18 = 9;
    return v18 + v14;
  }
  float v19 = (v12 - topHeight) / self->_midHeight;
  uint64_t v20 = (uint64_t)(float)(floorf(v19) + 1.0);
  if (v20 >= 4) {
    return -1;
  }
  return 3 * v20 + v14;
}

- (CGRect)_rectForKey:(unint64_t)a3
{
  [(TPPhonePad *)self _keypadOrigin];
  unint64_t v7 = a3 / 3;
  int v8 = a3 % 3;
  p_double leftWidth = &self->_leftWidth;
  double leftWidth = self->_leftWidth;
  if (v8 < 2)
  {
    p_double topHeight = &self->_topHeight;
    double topHeight = self->_topHeight;
    p_double midHeight = &self->_midHeight;
    double midHeight = self->_midHeight;
    double v11 = 0.0;
    if (!v8) {
      goto LABEL_6;
    }
    double v16 = &OBJC_IVAR___TPPhonePad__midWidth;
  }
  else
  {
    double v11 = self->_midWidth - leftWidth;
    p_double topHeight = &self->_topHeight;
    double topHeight = self->_topHeight;
    p_double midHeight = &self->_midHeight;
    double midHeight = self->_midHeight;
    double v16 = &OBJC_IVAR___TPPhonePad__rightWidth;
  }
  p_double leftWidth = (double *)((char *)self + *v16);
LABEL_6:
  double v17 = *p_leftWidth;
  if (v7)
  {
    if (v7 == 3) {
      p_double topHeight = &self->_bottomHeight;
    }
    else {
      p_double topHeight = p_midHeight;
    }
  }
  double v18 = *p_topHeight;
  double v19 = topHeight - midHeight;
  int v20 = v7 - 1;
  if ((int)v7 <= 0) {
    int v20 = 0;
  }
  double v21 = v6 + topHeight * (double)(int)v7 - v19 * (double)v20;
  double v22 = v5 + leftWidth * (double)v8 + v11;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v21;
  result.origin.double x = v22;
  return result;
}

- (void)_notifySoundCompletionIfNecessary:(unsigned int)a3
{
  unsigned int incompleteSounds = self->_incompleteSounds;
  if (incompleteSounds)
  {
    unsigned int v5 = incompleteSounds - 1;
    self->_unsigned int incompleteSounds = v5;
    if (!v5)
    {
      AudioServicesRemoveSystemSoundCompletion(a3);
      if (*((unsigned char *)self + 556))
      {
        delegate = self->_delegate;
        [(TPDialerKeypadDelegate *)delegate phonePadDidEndSounds:self];
      }
    }
  }
}

- (void)_playSoundForKey:(unint64_t)a3
{
  if (a3 <= 0xB)
  {
    SystemSoundID v4 = kSoundIDs[a3];
    if (v4)
    {
      if (*((unsigned char *)self + 556))
      {
        if (!self->_incompleteSounds) {
          [(TPDialerKeypadDelegate *)self->_delegate phonePadWillBeginSounds:self];
        }
        Current = CFRunLoopGetCurrent();
        AudioServicesAddSystemSoundCompletion(v4, Current, (CFStringRef)*MEMORY[0x1E4F1D410], (AudioServicesSystemSoundCompletionProc)_SoundCompletedPlaying, self);
        ++self->_incompleteSounds;
      }
      AudioServicesStartSystemSound();
      inflightSounds = self->_inflightSounds;
      CFSetAddValue(inflightSounds, (const void *)a3);
    }
  }
}

- (void)_stopSoundForKey:(unint64_t)a3
{
  if (a3 <= 0xB && kSoundIDs[a3])
  {
    AudioServicesStopSystemSound();
    inflightSounds = self->_inflightSounds;
    CFSetRemoveValue(inflightSounds, (const void *)a3);
  }
}

- (void)_stopAllSoundsForcingCallbacks:(BOOL)a3
{
  inflightSounds = self->_inflightSounds;
  if (inflightSounds)
  {
    BOOL v5 = a3;
    CFSetApplyFunction(inflightSounds, (CFSetApplierFunction)__TPStopSoundForKeyCallback, self);
    CFSetRemoveAllValues(self->_inflightSounds);
    if (v5)
    {
      for (uint64_t i = 0; i != 12; ++i)
        AudioServicesRemoveSystemSoundCompletion(kSoundIDs[i]);
      if (*((unsigned char *)self + 556))
      {
        if (self->_incompleteSounds) {
          [(TPDialerKeypadDelegate *)self->_delegate phonePadDidEndSounds:self];
        }
      }
      self->_unsigned int incompleteSounds = 0;
    }
  }
}

- (void).cxx_destruct
{
}

@end