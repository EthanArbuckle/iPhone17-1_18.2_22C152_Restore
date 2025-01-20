@interface TSDCanvasAnimation
- (BOOL)repeatAutoreverses;
- (BOOL)useRepFiltering;
- (CAMediaTimingFunction)timingFunction;
- (NSDate)startDate;
- (NSString)animationID;
- (NSString)beginTimeMode;
- (SEL)didStopSelector;
- (SEL)willStartSelector;
- (TSDCanvasAnimation)initWithAnimationID:(id)a3 interactiveCanvasController:(id)a4 context:(void *)a5;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (double)beginTime;
- (double)delay;
- (double)duration;
- (float)repeatCount;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)completionBlock;
- (id)delegate;
- (id)filterBlock;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)context;
- (void)dealloc;
- (void)setAnimation:(id)a3 forLayer:(id)a4 forKey:(id)a5;
- (void)setCompletionBlock:(id)a3;
- (void)setDelay:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDidStopSelector:(SEL)a3;
- (void)setDuration:(double)a3;
- (void)setFilterBlock:(id)a3;
- (void)setRepeatAutoreverses:(BOOL)a3;
- (void)setRepeatCount:(float)a3;
- (void)setStartDate:(id)a3;
- (void)setTimingFunction:(id)a3;
- (void)setUseRepFiltering:(BOOL)a3;
- (void)setWillStartSelector:(SEL)a3;
@end

@implementation TSDCanvasAnimation

- (TSDCanvasAnimation)initWithAnimationID:(id)a3 interactiveCanvasController:(id)a4 context:(void *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TSDCanvasAnimation;
  v8 = [(TSDCanvasAnimation *)&v10 init];
  if (v8)
  {
    v8->_animationID = (NSString *)a3;
    v8->_context = a5;
    v8->_duration = 0.2;
    v8->_timingFunction = (CAMediaTimingFunction *)(id)[MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    v8->_allAnimationsFinishedBeforeStopping = 1;
    v8->_interactiveCanvasController = (TSDInteractiveCanvasController *)a4;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasAnimation;
  [(TSDCanvasAnimation *)&v3 dealloc];
}

- (double)beginTime
{
  startDate = self->_startDate;
  if (startDate) {
    [(NSDate *)startDate timeIntervalSinceReferenceDate];
  }
  else {
    double v4 = 0.0;
  }
  return v4 + self->_delay;
}

- (NSString)beginTimeMode
{
  if (self->_startDate) {
    v2 = (NSString **)MEMORY[0x263F15950];
  }
  else {
    v2 = (NSString **)MEMORY[0x263F15980];
  }
  return *v2;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  if (self->_firstAnimationDidStart)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDCanvasAnimation actionForLayer:forKey:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasAnimation.m"), 116, @"shouldn't be adding animations after we've started showing them");
  }
  v9 = objc_msgSend((id)-[TSUNoCopyDictionary objectForKeyedSubscript:](self->_animationDictionariesForLayers, "objectForKeyedSubscript:", a3), "objectForKeyedSubscript:", a4);
  filterBlock = (uint64_t (**)(id, TSDCanvasAnimation *, id, id))self->_filterBlock;
  if (filterBlock) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11) {
    v9 = (void *)filterBlock[2](filterBlock, self, a3, a4);
  }
  if (v9) {
    goto LABEL_35;
  }
  if (self->_useRepFiltering && a3)
  {
    id v12 = a3;
    while (1)
    {
      id v13 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController repForLayer:v12];
      if (v13) {
        break;
      }
      id v13 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController repForContainerLayer:v12];
      if (v13) {
        break;
      }
      id v12 = (id)[v12 superlayer];
      if (!v12) {
        goto LABEL_34;
      }
    }
    id v14 = v13;
    id v15 = v13;
    while (1)
    {
      v16 = (void *)TSUProtocolCast();
      v17 = v16;
      if (v16) {
        BOOL v18 = v15 == v14;
      }
      else {
        BOOL v18 = 0;
      }
      if (v18) {
        v9 = (void *)[v16 animationForRepLayer:a3 withEvent:a4];
      }
      else {
        v9 = 0;
      }
      if (v17) {
        BOOL v19 = v9 == 0;
      }
      else {
        BOOL v19 = 0;
      }
      if (!v19) {
        goto LABEL_32;
      }
      if (v15 != v14 && (objc_opt_respondsToSelector() & 1) != 0) {
        break;
      }
LABEL_33:
      id v15 = (id)[v15 parentRep];
      if (!v15) {
        goto LABEL_34;
      }
    }
    v9 = (void *)[v17 animationForChildRep:v14 layer:a3 withEvent:a4];
LABEL_32:
    if (v9) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
LABEL_34:
  v9 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:a4];
  [v9 setDuration:self->_duration];
  [(TSDCanvasAnimation *)self beginTime];
  objc_msgSend(v9, "setBeginTime:");
  objc_msgSend(v9, "setBeginTimeMode:", -[TSDCanvasAnimation beginTimeMode](self, "beginTimeMode"));
  [v9 setTimingFunction:self->_timingFunction];
  *(float *)&double v20 = self->_repeatCount;
  [v9 setRepeatCount:v20];
  [v9 setAutoreverses:self->_repeatAutoreverses];
  [v9 setFillMode:*MEMORY[0x263F15AA8]];
  if (v9)
  {
LABEL_35:
    objc_opt_class();
    if (TSUDynamicCast())
    {
      [v9 setDelegate:self];
      ++self->_outstandingAnimationCount;
    }
  }
  return v9;
}

- (void)setAnimation:(id)a3 forLayer:(id)a4 forKey:(id)a5
{
  animationDictionariesForLayers = self->_animationDictionariesForLayers;
  if (!animationDictionariesForLayers)
  {
    animationDictionariesForLayers = (TSUNoCopyDictionary *)objc_alloc_init(MEMORY[0x263F7C880]);
    self->_animationDictionariesForLayers = animationDictionariesForLayers;
  }
  objc_super v10 = (void *)[(TSUNoCopyDictionary *)animationDictionariesForLayers objectForKeyedSubscript:a4];
  if (!v10)
  {
    objc_super v10 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    [(TSUNoCopyDictionary *)self->_animationDictionariesForLayers setObject:v10 forUncopiedKey:a4];
  }

  [v10 setObject:a3 forKeyedSubscript:a5];
}

- (void)animationDidStart:(id)a3
{
  if (!self->_outstandingAnimationCount)
  {
    double v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDCanvasAnimation animationDidStart:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasAnimation.m"), 219, @"unexpected animation started");
  }
  if (!self->_firstAnimationDidStart)
  {
    willStartSelector = self->_willStartSelector;
    self->_firstAnimationDidStart = 1;
    if (willStartSelector)
    {
      context = self->_context;
      id delegate = self->_delegate;
      animationID = self->_animationID;
      objc_msgSend(delegate, willStartSelector, animationID, context);
    }
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (!self->_outstandingAnimationCount)
  {
    v6 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDCanvasAnimation animationDidStop:finished:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasAnimation.m"), 234, @"unexpected animation stopped");
  }
  if (!self->_firstAnimationDidStart)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDCanvasAnimation animationDidStop:finished:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasAnimation.m"), 235, @"animation stopped before starting");
  }
  unsigned int outstandingAnimationCount = self->_outstandingAnimationCount;
  BOOL v11 = self->_allAnimationsFinishedBeforeStopping || a4;
  self->_allAnimationsFinishedBeforeStopping = v11;
  unsigned int v12 = outstandingAnimationCount - 1;
  self->_unsigned int outstandingAnimationCount = v12;
  if (!v12)
  {
    didStopSelector = self->_didStopSelector;
    if (didStopSelector) {
      objc_msgSend(self->_delegate, didStopSelector, self->_animationID, objc_msgSend(NSNumber, "numberWithBool:"), self->_context);
    }
    id completionBlock = self->_completionBlock;
    if (completionBlock)
    {
      id v15 = (void (*)(void))*((void *)completionBlock + 2);
      v15();
    }
  }
}

- (NSString)animationID
{
  return self->_animationID;
}

- (void)context
{
  return self->_context;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_id delegate = a3;
}

- (SEL)willStartSelector
{
  if (self->_willStartSelector) {
    return self->_willStartSelector;
  }
  else {
    return 0;
  }
}

- (void)setWillStartSelector:(SEL)a3
{
  if (a3) {
    objc_super v3 = a3;
  }
  else {
    objc_super v3 = 0;
  }
  self->_willStartSelector = v3;
}

- (SEL)didStopSelector
{
  if (self->_didStopSelector) {
    return self->_didStopSelector;
  }
  else {
    return 0;
  }
}

- (void)setDidStopSelector:(SEL)a3
{
  if (a3) {
    objc_super v3 = a3;
  }
  else {
    objc_super v3 = 0;
  }
  self->_didStopSelector = v3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (float)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(float)a3
{
  self->_repeatCount = a3;
}

- (BOOL)repeatAutoreverses
{
  return self->_repeatAutoreverses;
}

- (void)setRepeatAutoreverses:(BOOL)a3
{
  self->_repeatAutoreverses = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (void)setFilterBlock:(id)a3
{
}

- (BOOL)useRepFiltering
{
  return self->_useRepFiltering;
}

- (void)setUseRepFiltering:(BOOL)a3
{
  self->_useRepFiltering = a3;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

@end