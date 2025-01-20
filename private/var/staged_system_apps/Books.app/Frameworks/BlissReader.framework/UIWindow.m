@interface UIWindow
+ (void)moveViewToEffectsWindowAboveStatusBar:(id)a3 zPosition:(double)a4 hostView:(id)a5;
- (BOOL)hasRaisedViews;
- (double)statusBarMinDimension;
- (id)rootView;
- (void)moveViewAboveStatusBar:(id)a3 zPosition:(double)a4 hostView:(id)a5;
- (void)moveViewBackBelowStatusBar:(id)a3 preserveCurrentFrame:(BOOL)a4;
@end

@implementation UIWindow

- (double)statusBarMinDimension
{
  [(UIStatusBarManager *)[(UIWindowScene *)[(UIWindow *)self windowScene] statusBarManager] statusBarFrame];
  if (v2 >= v3) {
    return v3;
  }
  else {
    return v2;
  }
}

- (void)moveViewAboveStatusBar:(id)a3 zPosition:(double)a4 hostView:(id)a5
{
  if (!a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:@"-[UIWindow(THAdditions) moveViewAboveStatusBar:zPosition:hostView:]"] file:[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m"] lineNumber:61 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"view"];
  }
  id v9 = [a3 superview];
  if (v9 == -[UIWindow rootView](self, "rootView") || [a3 stateRestoreBlock]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIWindow(THAdditions) moveViewAboveStatusBar:zPosition:hostView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m") lineNumber:62 description:@"view has already been moved above status bar"];
  }
  objc_msgSend(objc_msgSend(a3, "layer"), "zPosition");
  uint64_t v11 = v10;
  [a3 center];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_113730;
  v19[3] = &unk_4599D8;
  v19[6] = v12;
  v19[7] = v13;
  v19[4] = a3;
  v19[5] = [a3 superview];
  v19[8] = v11;
  [a3 setStateRestoreBlock:v19];
  id v14 = [(UIWindow *)self rootView];
  [a3 center];
  double v16 = v15;
  double v18 = v17;
  if ([a3 superview]) {
    a5 = [a3 superview];
  }
  [v14 convertPoint:a5 fromView:v16];
  [a3 setCenter:];
  [self rootView].addSubview(a3);
  objc_msgSend(objc_msgSend(a3, "layer"), "setZPosition:", a4);
}

- (void)moveViewBackBelowStatusBar:(id)a3 preserveCurrentFrame:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:](TSWPEffectsWindow, "sharedEffectsWindowAboveStatusBarForView:");
  if (!a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[UIWindow(THAdditions) moveViewBackBelowStatusBar:preserveCurrentFrame:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m"] lineNumber:84 description:[NSString stringWithUTF8String:"invalid nil value for '%s'", "view"];
  }
  if ([a3 superview] != v7
    && (id v8 = [a3 superview], v8 != -[UIWindow rootView](self, "rootView"))
    || ![a3 stateRestoreBlock])
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIWindow(THAdditions) moveViewBackBelowStatusBar:preserveCurrentFrame:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m") lineNumber:85 description:@"view is not above status bar"];
  }
  id v9 = [a3 superview];
  [a3 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  id v18 = [a3 superview];
  [a3 th_restoreState];
  if (v4)
  {
    objc_msgSend(objc_msgSend(a3, "superview"), "convertRect:fromView:", v18, v11, v13, v15, v17);
    [a3 setFrame:];
  }
  if (v9 != v7 && ![(UIWindow *)self hasRaisedViews])
  {
    [(UIWindow *)self th_restoreState];
  }
}

+ (void)moveViewToEffectsWindowAboveStatusBar:(id)a3 zPosition:(double)a4 hostView:(id)a5
{
  id v8 = +[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:a5];
  if (!a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m") lineNumber:110 description:@"invalid nil value for '%s'", "view"];
  }
  if ([a3 superview] == v8 || objc_msgSend(a3, "stateRestoreBlock")) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m") lineNumber:111 description:@"view has already been moved above status bar"];
  }
  objc_msgSend(objc_msgSend(a3, "layer"), "zPosition");
  uint64_t v10 = v9;
  [a3 center];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_113C34;
  v31[3] = &unk_4599D8;
  v31[6] = v11;
  v31[7] = v12;
  v31[4] = a3;
  v31[5] = [a3 superview];
  v31[8] = v10;
  [a3 setStateRestoreBlock:v31];
  id v13 = a5;
  if ([a3 superview]) {
    id v13 = [a3 superview];
  }
  if ([a3 window]) {
    id v14 = a3;
  }
  else {
    id v14 = a5;
  }
  id v15 = [v14 window];
  [a3 center];
  double v18 = v17;
  if (v13)
  {
    [v13 convertPoint:0 toView:];
    double v18 = v19;
  }
  if (v15)
  {
    [v8 convertPoint:v15 fromWindow:];
    double v22 = v21;
  }
  else
  {
    float v23 = v16;
    int64_t v24 = llroundf(v23);
    [v8 bounds];
    float v26 = v25;
    double v22 = (double)(v24 % (uint64_t)llroundf(v26));
    float v27 = v18;
    int64_t v28 = llroundf(v27);
    [v8 bounds];
    float v30 = v29;
    double v20 = (double)(v28 % (uint64_t)llroundf(v30));
  }
  [a3 setCenter:v22, v20];
  [v8 addSubview:a3];
  objc_msgSend(objc_msgSend(a3, "layer"), "setZPosition:", a4);
}

- (id)rootView
{
  if (![(UIWindow *)self stateRestoreBlock])
  {
    if (objc_msgSend(-[UIWindow subviews](self, "subviews"), "count") != (char *)&dword_0 + 1) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UIWindow(THAdditions) rootView]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/UIWindow_THAdditions.m") lineNumber:158 description:@"can't pick a root view if there's more than one subview"];
    }
    id v3 = [[self subviews] lastObject];
    [(UIWindow *)self windowLevel];
    uint64_t v5 = v4;
    id v6 = [(UIWindow *)self backgroundColor];
    [v3 center];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    if (v3) {
      [v3 transform];
    }
    id v11 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v11 setBackgroundColor:[UIColor clearColor]];
    [v3 bounds];
    [v11 setBounds:];
    [v3 center];
    [v11 setCenter:];
    if (v3)
    {
      [v3 transform];
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
    }
    v31[0] = v32;
    v31[1] = v33;
    v31[2] = v34;
    [v11 setTransform:v31];
    [(UIWindow *)self addSubview:v11];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(UIWindow *)self statusBarMinDimension];
    id v21 = [objc_alloc((Class)UIView) initWithFrame:v13, v20 + v15, v17, v19 - v20];
    [v21 setBackgroundColor:[UIColor clearColor]];
    [v21 setClipsToBounds:1];
    [v11 addSubview:v21];
    [v3 center];
    objc_msgSend(v21, "convertPoint:fromView:", objc_msgSend(v3, "superview"), v22, v23);
    [v3 setCenter:];
    long long v24 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v30[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v30[1] = v24;
    v30[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v3 setTransform:v30];
    [v21 addSubview:v3];
    [(UIWindow *)self setBackgroundColor:+[UIColor clearColor]];
    [(UIWindow *)self setWindowLevel:UIWindowLevelStatusBar + 1.0];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_113FF8;
    v26[3] = &unk_459A00;
    v26[4] = self;
    v26[5] = v6;
    v26[9] = v5;
    v26[10] = v8;
    v26[11] = v10;
    long long v27 = v35;
    long long v28 = v36;
    long long v29 = v37;
    v26[6] = v3;
    v26[7] = v21;
    v26[8] = v11;
    [(UIWindow *)self setStateRestoreBlock:v26];
  }
  return [-[UIWindow subviews](self, "subviews") lastObject];
}

- (BOOL)hasRaisedViews
{
  return (unint64_t)[-[UIWindow rootView](self, "rootView") subviews].count > 1;
}

@end