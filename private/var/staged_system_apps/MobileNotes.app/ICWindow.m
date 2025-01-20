@interface ICWindow
- (BOOL)isDebugWindowVisible;
- (_TtC11MobileNotes19ICDebugStatusWindow)debugWindow;
- (id)nextResponder;
- (void)hideDebugStatusWindow:(id)a3;
- (void)setDebugWindow:(id)a3;
- (void)setUpDebugStatusWindow;
- (void)showDebugStatusWindow:(id)a3;
- (void)toggleDebugStatusWindowVisible:(id)a3;
@end

@implementation ICWindow

- (id)nextResponder
{
  v8.receiver = self;
  v8.super_class = (Class)ICWindow;
  v3 = [(ICWindow *)&v8 nextResponder];
  v4 = [(ICWindow *)self viewControllerManager];
  v5 = [v4 keyboardHandler];

  if (v5)
  {
    [v5 setParentResponder:v3];
    id v6 = v5;

    v3 = v6;
  }

  return v3;
}

- (_TtC11MobileNotes19ICDebugStatusWindow)debugWindow
{
  v2 = self;
  v3 = (void *)sub_100218470();

  return (_TtC11MobileNotes19ICDebugStatusWindow *)v3;
}

- (void)setDebugWindow:(id)a3
{
  swift_beginAccess();
  id v5 = a3;
  id v6 = self;
  objc_setAssociatedObject(v6, &unk_10069F760, v5, (void *)1);
  swift_endAccess();
}

- (BOOL)isDebugWindowVisible
{
  v2 = self;
  v3 = [(ICWindow *)v2 debugWindow];

  if (v3) {
  return v3 != 0;
  }
}

- (void)setUpDebugStatusWindow
{
  v2 = self;
  sub_10021861C();
}

- (void)hideDebugStatusWindow:(id)a3
{
  v3 = self;
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    id v5 = self;
  }
  id v6 = [(ICWindow *)v3 debugWindow];
  if (v6)
  {
    v7 = v6;
    [(ICDebugStatusWindow *)v6 setHidden:1];
    [(ICDebugStatusWindow *)v7 setWindowScene:0];
    [(ICWindow *)v3 setDebugWindow:0];

    v3 = (ICWindow *)v7;
  }

  sub_100015BE0((uint64_t)&v8);
}

- (void)showDebugStatusWindow:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_100218970();

  sub_100015BE0((uint64_t)v6);
}

- (void)toggleDebugStatusWindowVisible:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    id v5 = self;
  }
  id v6 = [self standardUserDefaults];
  [v6 set_ICDebugWindowEnabled:[v6 _ICDebugWindowEnabled] ^ 1];

  sub_100015BE0((uint64_t)v7);
}

@end