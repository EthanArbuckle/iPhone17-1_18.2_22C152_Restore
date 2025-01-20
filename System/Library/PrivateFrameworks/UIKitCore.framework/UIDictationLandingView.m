@interface UIDictationLandingView
+ (double)diameterForLineHeight:(double)a3;
+ (double)widthForLineHeight:(double)a3;
+ (id)activeInstance;
+ (id)sharedInstance;
+ (int64_t)fallbackPlaceholderLength;
- (BOOL)canStopLanding;
- (BOOL)delegateWasEmpty;
- (BOOL)didSkipLanding;
- (BOOL)hasActivePlaceholder;
- (BOOL)willInsertResult;
- (UIDictationLandingView)initWithFrame:(CGRect)a3;
- (UITextCursorAssertion)hideCursorAssertion;
- (double)fadeOutDuration;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_currentTextInputView;
- (id)_timingFunctionForAnimation;
- (void)_invalidatDisplayLink;
- (void)advanceLanding:(id)a3;
- (void)clearRotation;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)errorShakeDidFinish;
- (void)hideCursor;
- (void)performRemoteSelector:(SEL)a3;
- (void)rotateBy:(double)a3;
- (void)setDidSkipLanding:(BOOL)a3;
- (void)setHideCursorAssertion:(id)a3;
- (void)setWillInsertResult:(BOOL)a3;
- (void)showCursor;
- (void)shrinkWithCompletion:(id)a3;
- (void)startDisplayLinkIfNecessary;
- (void)startLandingIfNecessary;
- (void)stopLanding;
- (void)stopLandingForError;
- (void)updatePosition;
@end

@implementation UIDictationLandingView

+ (double)diameterForLineHeight:(double)a3
{
  return ceil(a3 - a3 * 0.24 - a3 * 0.24);
}

+ (double)widthForLineHeight:(double)a3
{
  objc_msgSend(a1, "diameterForLineHeight:");
  double v6 = v5 * 0.5;
  [a1 diameterForLineHeight:a3];
  return ceil(v6 + v7 + v6);
}

+ (id)sharedInstance
{
  v2 = (void *)gSharedInstance_0;
  if (!gSharedInstance_0)
  {
    v3 = -[UIDictationLandingView initWithFrame:]([UIDictationLandingView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
    v4 = (void *)gSharedInstance_0;
    gSharedInstance_0 = (uint64_t)v3;

    v2 = (void *)gSharedInstance_0;
  }
  return v2;
}

+ (id)activeInstance
{
  return (id)gSharedInstance_0;
}

+ (int64_t)fallbackPlaceholderLength
{
  return [@"          " length];
}

- (UIDictationLandingView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIDictationLandingView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    displayLink = v3->_displayLink;
    v3->_displayLink = 0;

    range = v4->_range;
    v4->_range = 0;

    id placeholder = v4->_placeholder;
    v4->_id placeholder = 0;

    v4->_willInsertResult = 0;
    [(UIView *)v4 setOpaque:0];
    [(UIView *)v4 setUserInteractionEnabled:0];
    v4->_angle = 0.0;
  }
  return v4;
}

- (void)dealloc
{
  [(UIDictationLandingView *)self stopLanding];
  v3.receiver = self;
  v3.super_class = (Class)UIDictationLandingView;
  [(UIView *)&v3 dealloc];
}

- (void)clearRotation
{
  self->_angle = 0.0;
  CGAffineTransformMakeRotation(&v4, 0.0);
  CGAffineTransform v3 = v4;
  [(UIView *)self setTransform:&v3];
}

- (void)rotateBy:(double)a3
{
  double v4 = self->_angle + a3;
  self->_angle = v4;
  CGAffineTransformMakeRotation(&v6, v4 * 0.0174532925);
  CGAffineTransform v5 = v6;
  [(UIView *)self setTransform:&v5];
}

- (void)shrinkWithCompletion:(id)a3
{
  double v4 = (NSOperation *)a3;
  CGAffineTransform v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s dictation landing view is shrinking", "-[UIDictationLandingView shrinkWithCompletion:]");
  +[UIDictationController logDictationString:v5];

  self->_shrinking = 1;
  [(CADisplayLink *)self->_displayLink timestamp];
  self->_shrinkStartTime = v6;
  afterShrinkCompletionInvocation = self->_afterShrinkCompletionInvocation;
  self->_afterShrinkCompletionInvocation = v4;
  v8 = v4;

  objc_super v9 = +[UIDictationLandingViewSettings sharedInstance];
  [v9 fadeOutDuration];
  double v11 = v10;

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__UIDictationLandingView_shrinkWithCompletion___block_invoke;
  v12[3] = &unk_1E52D9F70;
  v12[4] = self;
  +[UIView animateWithDuration:393216 delay:v12 options:0 animations:v11 completion:0.0];
}

uint64_t __47__UIDictationLandingView_shrinkWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)advanceLanding:(id)a3
{
  [(CADisplayLink *)self->_displayLink timestamp];
  double v5 = v4 - self->_startTime;
  double v6 = +[UIDictationLandingViewSettings sharedInstance];
  [v6 circleRPM];
  double v8 = v5 * v7 / 60.0;

  self->_angle = v8 * 360.0;
  if (self->_shrinking)
  {
    objc_super v9 = +[UIDictationLandingViewSettings sharedInstance];
    [v9 shrinkDuration];
    double v11 = v10;

    [(CADisplayLink *)self->_displayLink timestamp];
    double v13 = v12 - self->_shrinkStartTime;
    CGAffineTransformMakeRotation(&t1, self->_angle * 0.0174532925);
    CGAffineTransformMakeScale(&t2, 1.0 - v13 / v11, 1.0 - v13 / v11);
    CGAffineTransformConcat(&v20, &t1, &t2);
    CGAffineTransform v17 = v20;
    [(UIView *)self setTransform:&v17];
    if (v13 > v11)
    {
      self->_shrinking = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__UIDictationLandingView_advanceLanding___block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    CGAffineTransformMakeRotation(&v15, v8 * 360.0 * 0.0174532925);
    CGAffineTransform v14 = v15;
    [(UIView *)self setTransform:&v14];
  }
  [(UIView *)self setNeedsDisplay];
}

void __41__UIDictationLandingView_advanceLanding___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 480) start];
  uint64_t v2 = *(void *)(a1 + 32);
  CGAffineTransform v3 = *(void **)(v2 + 480);
  *(void *)(v2 + 480) = 0;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  double diameter = self->_diameter;
  if (+[UIDictationController viewMode] == 6)
  {
    double v6 = +[UIScreen mainScreen];
  }
  else
  {
    double v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v8 = [v7 containerWindow];
    double v6 = [v8 screen];
  }
  [v6 scale];
  double v10 = v9;
  memset(&transform, 0, sizeof(transform));
  CGAffineTransformMakeScale(&v27, 1.0, -1.0);
  CGAffineTransformTranslate(&transform, &v27, 0.0, -height);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v12 = 0;
  }
  else {
    double v12 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  double v13 = ceil(width * 0.5 * v10) / v10;
  double v14 = diameter * 0.5;
  double v15 = 2.0;
  if (v10 > 1.0) {
    double v15 = 1.5;
  }
  double v16 = v14 - v15;
  if (v16 >= 0.0) {
    double v17 = v16;
  }
  else {
    double v17 = 0.0;
  }
  CGFloat v26 = v13 - diameter * 0.5;
  CGFloat v18 = ceil(height * 0.5 * v10) / v10;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGContextSaveGState(v12);
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, v13, v18, v17, 3.14159265, 0.0, 1);
  CGPathMoveToPoint(Mutable, 0, v13 + v17, v18);
  CGPathAddLineToPoint(Mutable, 0, v14 + v13, v18);
  CGPathAddArc(Mutable, 0, v13, v18, v14, 0.0, 3.14159265, 0);
  CGPathMoveToPoint(Mutable, 0, v26, v18);
  CGPathAddLineToPoint(Mutable, 0, v13 - v17, v18);
  v21 = CGPathCreateMutableCopyByTransformingPath(Mutable, &transform);
  CGContextAddPath(v12, v21);
  CGPathRelease(v21);
  CGPathRelease(Mutable);
  CGContextClip(v12);
  *(_OWORD *)components = xmmword_186B9A1F0;
  long long v34 = unk_186B9A200;
  long long v35 = xmmword_186B9A210;
  long long v36 = unk_186B9A220;
  v22 = CGGradientCreateWithColorComponents(DeviceRGB, components, 0, 2uLL);
  v38.x = v26;
  v38.y = v18;
  v40.x = v14 + v13;
  v40.y = v18;
  CGContextDrawLinearGradient(v12, v22, v38, v40, 0);
  CGGradientRelease(v22);
  CGContextRestoreGState(v12);
  CGContextSaveGState(v12);
  v23 = CGPathCreateMutable();
  CGPathAddArc(v23, 0, v13, v18, v17, 3.14159265, 0.0, 0);
  CGPathMoveToPoint(v23, 0, v13 + v17, v18);
  CGPathAddLineToPoint(v23, 0, v14 + v13, v18);
  CGPathAddArc(v23, 0, v13, v18, v14, 0.0, 3.14159265, 1);
  CGPathMoveToPoint(v23, 0, v26, v18);
  CGPathAddLineToPoint(v23, 0, v13 - v17, v18);
  v24 = CGPathCreateMutableCopyByTransformingPath(v23, &transform);
  CGContextAddPath(v12, v24);
  CGPathRelease(v24);
  CGPathRelease(v23);
  CGContextClip(v12);
  *(_OWORD *)v29 = xmmword_186B9A230;
  long long v30 = unk_186B9A240;
  long long v31 = xmmword_186B9A250;
  long long v32 = unk_186B9A260;
  v25 = CGGradientCreateWithColorComponents(DeviceRGB, v29, 0, 2uLL);
  v39.x = v26;
  v39.y = v18;
  v41.x = v14 + v13;
  v41.y = v18;
  CGContextDrawLinearGradient(v12, v25, v39, v41, 0);
  CGGradientRelease(v25);
  CGContextRestoreGState(v12);
  CGColorSpaceRelease(DeviceRGB);
}

- (id)_currentTextInputView
{
  uint64_t v2 = +[UIKeyboardImpl activeInstance];
  CGAffineTransform v3 = [v2 textInteractionAssistant];
  double v4 = [v3 view];
  double v5 = [v4 textInputView];

  return v5;
}

- (void)updatePosition
{
  CGAffineTransform v3 = +[UIKeyboardImpl sharedInstance];
  id v21 = [v3 delegate];

  double v4 = [v21 _textSelectingContainer];
  if (self->_placeholder && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v4 frameForDictationResultPlaceholder:self->_placeholder];
    CGRect v24 = CGRectIntegral(v23);
    double x = v24.origin.x;
    double y = v24.origin.y;
    double width = v24.size.width;
    double height = v24.size.height;
    +[UIDictationLandingView diameterForLineHeight:v24.size.height];
    self->_double diameter = v9;
    double v10 = [(UIDictationLandingView *)self _currentTextInputView];
    double v11 = [v21 textInputView];
    objc_msgSend(v10, "convertRect:fromView:", v11, x, y, width, height);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    double angle = self->_angle;
    [(UIDictationLandingView *)self clearRotation];
    -[UIView setFrame:](self, "setFrame:", v13, v15, v17, v19);
    [(UIView *)self setNeedsDisplay];
    [(UIDictationLandingView *)self rotateBy:angle];
  }
}

- (BOOL)delegateWasEmpty
{
  return self->_placeholder && !self->_didHaveText;
}

- (void)hideCursor
{
  CGAffineTransform v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s Landing view hideCursor", "-[UIDictationLandingView hideCursor]");
  +[UIDictationController logDictationString:v3];

  double v4 = [(UIDictationLandingView *)self hideCursorAssertion];
  [v4 invalidate];

  [(UIDictationLandingView *)self setHideCursorAssertion:0];
  double v5 = +[UIKeyboardImpl sharedInstance];
  double v6 = [v5 _activeAssertionController];
  double v7 = [v6 nonVisibleAssertionWithReason:@"Dictation Landing View"];
  [(UIDictationLandingView *)self setHideCursorAssertion:v7];

  if (!+[UIKeyboard isRedesignedTextCursorEnabled])
  {
    id v9 = +[UIKeyboardImpl sharedInstance];
    double v8 = [v9 textInteractionAssistant];
    [v8 setSelectionHighlightMode:1];
  }
}

- (void)showCursor
{
  CGAffineTransform v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s Landing view showCursor", "-[UIDictationLandingView showCursor]");
  +[UIDictationController logDictationString:v3];

  if (!+[UIKeyboard isRedesignedTextCursorEnabled])
  {
    double v4 = +[UIKeyboardImpl sharedInstance];
    double v5 = [v4 textInteractionAssistant];
    [v5 setSelectionHighlightMode:1];
  }
  double v6 = [(UIDictationLandingView *)self hideCursorAssertion];
  [v6 invalidate];

  [(UIDictationLandingView *)self setHideCursorAssertion:0];
}

- (void)startDisplayLinkIfNecessary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_displayLink)
  {
    CGAffineTransform v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v4 = [v3 containerWindow];

    double v5 = [MEMORY[0x1E4F39B60] mainDisplay];
    if (v4)
    {
      double v6 = [v4 screen];
      uint64_t v7 = [v6 _userInterfaceIdiom];

      if (v7 == 3)
      {
        id v21 = v4;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        double v8 = [MEMORY[0x1E4F39B60] displays];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v23;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              double v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
              double v14 = [MEMORY[0x1E4F39B60] mainDisplay];

              if (v13 != v14)
              {
                id v15 = v13;

                double v5 = v15;
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v10);
        }

        double v4 = v21;
      }
    }
    double v16 = [MEMORY[0x1E4F39B68] displayLinkWithDisplay:v5 target:self selector:sel_advanceLanding_];
    displayLink = self->_displayLink;
    self->_displayLink = v16;

    [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:60];
    double v18 = self->_displayLink;
    double v19 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v18 addToRunLoop:v19 forMode:*MEMORY[0x1E4F1C4B0]];

    [(CADisplayLink *)self->_displayLink timestamp];
    self->_startTime = v20;
  }
}

- (void)performRemoteSelector:(SEL)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (+[UIKeyboard isKeyboardProcess])
  {
    double v4 = +[UIKeyboardImpl activeInstance];
    double v5 = [v4 inputDelegateManager];
    double v6 = [v5 inputSystemSourceSession];

    if (v6)
    {
      uint64_t v7 = [v6 textOperations];
      [v7 setCustomInfoType:0x1ED14BAA0];
      uint64_t v10 = @"selector";
      double v8 = NSStringFromSelector(a3);
      v11[0] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      [v7 setCustomInfo:v9];

      [v6 flushOperations];
    }
  }
}

- (void)_invalidatDisplayLink
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    double v4 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)startLandingIfNecessary
{
  [(UIDictationLandingView *)self performRemoteSelector:a2];
  CGAffineTransform v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s Trying to start the dictation landing view", "-[UIDictationLandingView startLandingIfNecessary]");
  +[UIDictationController logDictationString:v3];

  double v4 = +[UIKeyboardImpl activeInstance];
  double v5 = [v4 inputDelegate];
  double v6 = [v5 selectedTextRange];
  char v7 = [v6 isEmpty];

  if (v7)
  {
    self->_didSkipLanding = 0;
    displayLink = self->_displayLink;
    id placeholder = self->_placeholder;
    if (displayLink)
    {
      if (placeholder) {
        return;
      }
      goto LABEL_8;
    }
    if (placeholder)
    {
LABEL_8:
      id v23 = [NSString stringWithFormat:@"%s The landing view was in an unexpected state. _displayLink: %@, _placeholder: %@", "-[UIDictationLandingView startLandingIfNecessary]", displayLink, placeholder];
      +[UIDictationController logDictationString:v23];

      return;
    }
    [(UIDictationLandingView *)self startDisplayLinkIfNecessary];
    range = self->_range;
    if (range)
    {
      self->_range = 0;
    }
    uint64_t v12 = +[UIKeyboardImpl activeInstance];
    double v13 = [v12 inputDelegate];

    double v14 = +[UIKeyboardImpl activeInstance];
    id v15 = [v14 inputDelegateManager];
    char v16 = [v15 hasAsyncCapableInputDelegate];

    if ((v16 & 1) == 0)
    {
      double v17 = [v13 _textSelectingContainer];
      [(UIDictationLandingView *)self hideCursor];
      self->_didHaveText = [v13 hasText];
      double v18 = +[UIDictationController activeInstance];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __49__UIDictationLandingView_startLandingIfNecessary__block_invoke;
      v27[3] = &unk_1E52DCB30;
      id v28 = v17;
      v29 = self;
      id v19 = v13;
      id v30 = v19;
      id v20 = v17;
      [v18 performIgnoringDocumentChanges:v27];

      [(UIDictationLandingView *)self updatePosition];
      if (v19 && [(UIDictationLandingView *)self hasActivePlaceholder])
      {
        id v21 = [(UIDictationLandingView *)self _currentTextInputView];
        [v21 addSubview:self];
      }
      [(UIView *)self setAlpha:0.0];
      CGAffineTransformMakeScale(&v26, 0.0, 0.0);
      CGAffineTransform v25 = v26;
      [(UIView *)self setTransform:&v25];
      long long v22 = +[UIDictationLandingViewSettings sharedInstance];
      [v22 fadeInDuration];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __49__UIDictationLandingView_startLandingIfNecessary__block_invoke_2;
      v24[3] = &unk_1E52D9F70;
      v24[4] = self;
      +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, self, v24, &__block_literal_global_336);

      [(UIView *)self setNeedsDisplay];
    }
  }
  else
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s Skipping start the dictation landing view", "-[UIDictationLandingView startLandingIfNecessary]");
    +[UIDictationController logDictationString:v10];

    if (!self->_didSkipLanding)
    {
      self->_didSkipLanding = 1;
      [(UIDictationLandingView *)self hideCursor];
      [(UIDictationLandingView *)self startDisplayLinkIfNecessary];
    }
  }
}

void __49__UIDictationLandingView_startLandingIfNecessary__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [*(id *)(a1 + 32) insertDictationResultPlaceholder];
    uint64_t v3 = *(void *)(a1 + 40);
    double v4 = *(void **)(v3 + 416);
    *(void *)(v3 + 416) = v2;
  }
  else
  {
    [*(id *)(a1 + 48) insertText:@"          "];
    double v5 = [*(id *)(a1 + 32) selectedTextRange];
    uint64_t v10 = [v5 start];

    double v6 = [*(id *)(a1 + 48) positionFromPosition:v10, -objc_msgSend(@"          ", "length") offset];
    uint64_t v7 = [*(id *)(a1 + 48) textRangeFromPosition:v6 toPosition:v10];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(v8 + 408);
    *(void *)(v8 + 408) = v7;

    double v4 = (void *)v10;
  }
}

uint64_t __49__UIDictationLandingView_startLandingIfNecessary__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  CGAffineTransformMakeScale(&v5, 1.0, 1.0);
  uint64_t v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

- (void)stopLanding
{
  [(UIDictationLandingView *)self performRemoteSelector:a2];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s Dictation is removing the landing view", "-[UIDictationLandingView stopLanding]");
  +[UIDictationController logDictationString:v3];

  if (self->_didSkipLanding)
  {
    CGAffineTransform v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s Skipping removing the landing view for modeless", "-[UIDictationLandingView stopLanding]");
    +[UIDictationController logDictationString:v4];

    self->_didSkipLanding = 0;
    [(UIDictationLandingView *)self showCursor];
    [(UIDictationLandingView *)self _invalidatDisplayLink];
  }
  else
  {
    [(UIView *)self removeFromSuperview];
    CGAffineTransform v5 = +[UIDictationController activeInstance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__UIDictationLandingView_stopLanding__block_invoke;
    v6[3] = &unk_1E52D9F70;
    v6[4] = self;
    [v5 performIgnoringDocumentChanges:v6];

    self->_willInsertResult = 0;
    [(UIDictationLandingView *)self showCursor];
    [(UIDictationLandingView *)self _invalidatDisplayLink];
  }
}

void __37__UIDictationLandingView_stopLanding__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 416))
  {
    uint64_t v3 = +[UIKeyboardImpl sharedInstance];
    uint64_t v11 = [v3 delegate];

    CGAffineTransform v4 = [v11 _textSelectingContainer];
    if (objc_opt_respondsToSelector()) {
      [v4 removeDictationResultPlaceholder:*(void *)(*(void *)(a1 + 32) + 416) willInsertResult:*(unsigned __int8 *)(*(void *)(a1 + 32) + 425)];
    }
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(void **)(v5 + 416);
    *(void *)(v5 + 416) = 0;

    uint64_t v7 = v11;
  }
  else
  {
    if (!*(void *)(v2 + 408)) {
      return;
    }
    uint64_t v8 = +[UIKeyboardImpl sharedInstance];
    uint64_t v9 = [v8 inputDelegate];
    [v9 replaceRange:*(void *)(*(void *)(a1 + 32) + 408) withText:&stru_1ED0E84C0];

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v10 + 408);
    *(void *)(v10 + 408) = 0;
  }
}

- (BOOL)hasActivePlaceholder
{
  return self->_placeholder || self->_range != 0;
}

- (BOOL)canStopLanding
{
  uint64_t v3 = [(UIView *)self superview];
  BOOL v4 = v3 || [(UIDictationLandingView *)self hasActivePlaceholder] || self->_didSkipLanding;

  return v4;
}

- (void)errorShakeDidFinish
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__UIDictationLandingView_errorShakeDidFinish__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  uint64_t v3 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v4];
  [(UIDictationLandingView *)self shrinkWithCompletion:v3];
}

uint64_t __45__UIDictationLandingView_errorShakeDidFinish__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[UIDictationController sharedInstance];
  [v2 errorAnimationDidFinish];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 showCursor];
}

- (void)stopLandingForError
{
  [(UIDictationLandingView *)self performRemoteSelector:a2];
  uint64_t v3 = +[UIKeyboardImpl activeInstance];
  BOOL v4 = [v3 textInteractionAssistant];
  char v5 = [v4 isValid];

  if (v5)
  {
    [(UIDictationLandingView *)self startLandingIfNecessary];
    id v37 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.translation.x"];
    [v37 setDuration:0.6];
    double v6 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v7 = [NSNumber numberWithFloat:0.0];
    LODWORD(v8) = 1041865114;
    uint64_t v9 = [NSNumber numberWithFloat:v8];
    LODWORD(v10) = 1047904911;
    uint64_t v11 = [NSNumber numberWithFloat:v10];
    LODWORD(v12) = 1052266988;
    double v13 = [NSNumber numberWithFloat:v12];
    LODWORD(v14) = 1055622431;
    id v15 = [NSNumber numberWithFloat:v14];
    LODWORD(v16) = 1058642330;
    double v17 = [NSNumber numberWithFloat:v16];
    LODWORD(v18) = 1061997773;
    id v19 = [NSNumber numberWithFloat:v18];
    id v20 = objc_msgSend(v6, "arrayWithObjects:", v7, v9, v11, v13, v15, v17, v19, 0);
    [v37 setKeyTimes:v20];

    id v21 = (void *)MEMORY[0x1E4F1C978];
    LODWORD(v22) = -4.0;
    id v23 = [NSNumber numberWithFloat:v22];
    LODWORD(v24) = 4.0;
    CGAffineTransform v25 = [NSNumber numberWithFloat:v24];
    LODWORD(v26) = -4.0;
    uint64_t v27 = [NSNumber numberWithFloat:v26];
    LODWORD(v28) = 4.0;
    v29 = [NSNumber numberWithFloat:v28];
    LODWORD(v30) = -4.0;
    long long v31 = [NSNumber numberWithFloat:v30];
    LODWORD(v32) = 4.0;
    v33 = [NSNumber numberWithFloat:v32];
    long long v34 = [NSNumber numberWithFloat:0.0];
    long long v35 = objc_msgSend(v21, "arrayWithObjects:", v23, v25, v27, v29, v31, v33, v34, 0);
    [v37 setValues:v35];

    long long v36 = [(UIView *)self layer];
    [v36 addAnimation:v37 forKey:@"shake"];

    [(UIDictationLandingView *)self performSelector:sel_errorShakeDidFinish withObject:0 afterDelay:0.9];
  }
  else
  {
    [(UIDictationLandingView *)self errorShakeDidFinish];
  }
}

- (double)fadeOutDuration
{
  uint64_t v2 = +[UIDictationLandingViewSettings sharedInstance];
  [v2 fadeOutDuration];
  double v4 = v3;

  return v4;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return (id)[MEMORY[0x1E4F39B48] animationWithKeyPath:a4];
}

- (id)_timingFunctionForAnimation
{
  return (id)[MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
}

- (BOOL)willInsertResult
{
  return self->_willInsertResult;
}

- (void)setWillInsertResult:(BOOL)a3
{
  self->_willInsertResult = a3;
}

- (BOOL)didSkipLanding
{
  return self->_didSkipLanding;
}

- (void)setDidSkipLanding:(BOOL)a3
{
  self->_didSkipLanding = a3;
}

- (UITextCursorAssertion)hideCursorAssertion
{
  return self->_hideCursorAssertion;
}

- (void)setHideCursorAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideCursorAssertion, 0);
  objc_storeStrong((id *)&self->_afterShrinkCompletionInvocation, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_range, 0);
}

@end