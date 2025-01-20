@interface CAKPFPlayerControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (CAKPFPlayerControllerAccessibilityDelegate)thaxAccessibilityDelegate;
- (id)thaxDescriptionForTouchAtLocation:(CGPoint)a3;
- (void)_thaxDidRenderNewEvent;
- (void)gotoPreviousEvent;
- (void)gotoPreviousSlide;
- (void)p_gotoEventIndex:(unint64_t)a3 skipBreadCrumb:(BOOL)a4 shouldAutoPlay:(BOOL)a5;
- (void)p_triggerNextEvent;
- (void)prepareWithEndShowHandler:(id)a3;
- (void)thaxSetAccessibilityDelegate:(id)a3;
@end

@implementation CAKPFPlayerControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"CAKPFPlayerController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (CAKPFPlayerControllerAccessibilityDelegate)thaxAccessibilityDelegate
{
  return (CAKPFPlayerControllerAccessibilityDelegate *)__TSAccessibilityGetAssociatedObject(self, &unk_573A72);
}

- (void)thaxSetAccessibilityDelegate:(id)a3
{
}

- (void)_thaxDidRenderNewEvent
{
  v3 = [(CAKPFPlayerControllerAccessibility *)self thaxAccessibilityDelegate];
  if (objc_opt_respondsToSelector())
  {
    [(CAKPFPlayerControllerAccessibilityDelegate *)v3 thaxPlayerControllerDidRenderNewEvent:self];
  }
}

- (void)prepareWithEndShowHandler:(id)a3
{
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    id v14 = [&stru_46C818 copy];
    v5 = objc_opt_class();
    int v11 = __TSAccessibilityValidateBlockSignature((uint64_t)a3, (uint64_t)v14, v5, v6, v7, v8, v9, v10, v12, (uint64_t)v13.receiver);

    if (v11) {
      abort();
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CAKPFPlayerControllerAccessibility;
  [(CAKPFPlayerControllerAccessibility *)&v13 prepareWithEndShowHandler:a3];
  [(CAKPFPlayerControllerAccessibility *)self _thaxDidRenderNewEvent];
}

- (void)gotoPreviousEvent
{
  v3.receiver = self;
  v3.super_class = (Class)CAKPFPlayerControllerAccessibility;
  [(CAKPFPlayerControllerAccessibility *)&v3 gotoPreviousEvent];
  [(CAKPFPlayerControllerAccessibility *)self _thaxDidRenderNewEvent];
}

- (void)gotoPreviousSlide
{
  v3.receiver = self;
  v3.super_class = (Class)CAKPFPlayerControllerAccessibility;
  [(CAKPFPlayerControllerAccessibility *)&v3 gotoPreviousSlide];
  [(CAKPFPlayerControllerAccessibility *)self _thaxDidRenderNewEvent];
}

- (void)p_gotoEventIndex:(unint64_t)a3 skipBreadCrumb:(BOOL)a4 shouldAutoPlay:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CAKPFPlayerControllerAccessibility;
  [(CAKPFPlayerControllerAccessibility *)&v6 p_gotoEventIndex:a3 skipBreadCrumb:a4 shouldAutoPlay:a5];
  [(CAKPFPlayerControllerAccessibility *)self _thaxDidRenderNewEvent];
}

- (void)p_triggerNextEvent
{
  v3.receiver = self;
  v3.super_class = (Class)CAKPFPlayerControllerAccessibility;
  [(CAKPFPlayerControllerAccessibility *)&v3 p_triggerNextEvent];
  [(CAKPFPlayerControllerAccessibility *)self _thaxDidRenderNewEvent];
}

- (id)thaxDescriptionForTouchAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v6 = [(CAKPFPlayerControllerAccessibility *)self tsaxValueForKey:@"mSession"];
  id v7 = [v6 tsaxValueForKey:@"currentEvent"];
  uint64_t v8 = [(int *)[v6 tsaxValueForKey:@"playbackStatus"] unsignedIntegerValue];
  if (v8 == &dword_4
    || ((uint64_t v9 = v8,
         unsigned int v10 = [v7 tsaxBoolValueForKey:@"isAutomatic"],
         v9 != (int *)((char *)&dword_0 + 3))
      ? (BOOL v11 = v10 == 0)
      : (BOOL v11 = 1),
        !v11))
  {
    id v7 = [v6 tsaxValueForKey:@"nextEvent"];
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3052000000;
  v25 = sub_297A70;
  v26 = sub_297A80;
  uint64_t v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_297A8C;
  v21[3] = &unk_46B940;
  v21[4] = v7;
  v21[5] = &v22;
  *(CGFloat *)&v21[6] = x;
  *(CGFloat *)&v21[7] = y;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v21)) {
    abort();
  }
  uint64_t v12 = (void *)v23[5];
  _Block_object_dispose(&v22, 8);
  if (v12)
  {
    if ([v12 hasPrefix:@"?slide="])
    {
      uint64_t v13 = (int)([v12 substringFromIndex:[@"?slide=" length]]- 1);
      id v14 = [v6 tsaxValueForKey:@"KPFDocument"];
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2020000000;
      v25 = 0;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_297AC4;
      v20[3] = &unk_458E98;
      v20[4] = v14;
      v20[5] = &v22;
      v20[6] = v13;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v20)) {
        abort();
      }
      uint64_t v15 = v23[3];
      _Block_object_dispose(&v22, 8);
      if (v15)
      {
        v16 = THAccessibilityLocalizedString(@"widgets.keynote.gotostep %@");
        id result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, TSAccessibilityLocalizedNumber((uint64_t)+[NSNumber numberWithUnsignedInteger:v15]));
        if (result) {
          return result;
        }
        goto LABEL_18;
      }
      CFStringRef v18 = @"widgets.keynote.gotofirststep";
LABEL_17:
      id result = THAccessibilityLocalizedString((uint64_t)v18);
      if (result) {
        return result;
      }
      goto LABEL_18;
    }
    if ([v12 isEqualToString:@"?action=retreat"])
    {
      CFStringRef v18 = @"widgets.keynote.gotopreviousstep";
      goto LABEL_17;
    }
  }
LABEL_18:
  if ([(CAKPFPlayerControllerAccessibility *)self tsaxBoolValueForKey:@"transportControlCloneCanGotoNext"])CFStringRef v19 = @"widgets.keynote.gotonextstep"; {
  else
  }
    CFStringRef v19 = @"widgets.keynote.gotofirststep";
  return THAccessibilityLocalizedString((uint64_t)v19);
}

@end