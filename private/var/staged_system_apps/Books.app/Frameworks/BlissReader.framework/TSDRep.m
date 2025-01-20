@interface TSDRep
- (BOOL)allowsAction:(int)a3;
- (BOOL)canExpand;
- (BOOL)widgetInteractionAllowAutoplayForCompact;
- (BOOL)widgetInteractionAllowOnPageForCompact;
- (id)popUpInfo;
- (int)performanceMode;
- (int)pressableAction;
- (unint64_t)widgetInteractionMode;
@end

@implementation TSDRep

- (int)performanceMode
{
  id v2 = [[self interactiveCanvasController] ancestorRepOfRep:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THPerformanceCoordinator];

  return [v2 performanceMode];
}

- (BOOL)canExpand
{
  return TSUProtocolCast() == 0;
}

- (unint64_t)widgetInteractionMode
{
  unint64_t result = [[self interactiveCanvasController] ancestorRepOfRep:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWInteractionModeHosting];
  if (result)
  {
    return (unint64_t)[(id)result widgetInteractionModeForRep:self];
  }
  return result;
}

- (BOOL)widgetInteractionAllowOnPageForCompact
{
  return 0;
}

- (BOOL)widgetInteractionAllowAutoplayForCompact
{
  return 0;
}

- (id)popUpInfo
{
  [(TSDRep *)self infoForPressable];
  id v2 = (void *)TSUProtocolCast();
  if (v2)
  {
    [v2 popUpInfo];
    TSUProtocolCast();
  }

  return (id)TSUProtocolCast();
}

- (int)pressableAction
{
  id v3 = [self infoForPressable].repClass;
  if ([(TSDRep *)self popUpInfo])
  {
    objc_opt_class();
    [(TSDRep *)self interactiveCanvasController];
    v4 = (void *)TSUDynamicCast();
    if ((([v4 isCompactWidth] & 1) != 0
       || [v4 isCompactHeight])
      && ([v3 conformsToProtocol:&OBJC_PROTOCOL___THWExpandableRep] & 1) != 0)
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else if ([v3 conformsToProtocol:&OBJC_PROTOCOL___THWExpandableRep])
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

- (BOOL)allowsAction:(int)a3
{
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  objc_opt_class();
  uint64_t v6 = TSUDynamicCast();
  objc_opt_class();
  uint64_t v7 = TSUDynamicCast();
  objc_opt_class();
  uint64_t v8 = TSUDynamicCast();
  [(TSDRep *)self infoForPressable];
  v9 = (void *)TSUProtocolCast();
  v10 = v9;
  if (a3 == 2)
  {
    BOOL v12 = (TSUPhoneUI() & 1) != 0 || [v10 popUpInfo] == 0;
    return !(v8 | v5 | v6) && v12;
  }
  else
  {
    return a3 != 1 || !v7 && [v9 popUpInfo] != 0;
  }
}

@end