@interface SpeechTranslationApertureElementViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)preventsInteractiveDismissal;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)associatedScenePersistenceIdentifier;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (_TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setAssociatedScenePersistenceIdentifier:(id)a3;
- (void)setContentRole:(int64_t)a3;
- (void)setMaximumLayoutMode:(int64_t)a3;
- (void)setPreferredLayoutMode:(int64_t)a3;
- (void)setPresentationBehaviors:(unint64_t)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation SpeechTranslationApertureElementViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  v4 = self;
  sub_1001C2B04(a3);
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_preferredLayoutMode) = (Class)a3;
}

- (unint64_t)presentationBehaviors
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_presentationBehaviors);
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_presentationBehaviors) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_maximumLayoutMode) = (Class)a3;
}

- (NSString)associatedScenePersistenceIdentifier
{
  if (*(void *)&self->currentActivity[OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_associatedScenePersistenceIdentifier])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setAssociatedScenePersistenceIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_associatedScenePersistenceIdentifier);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (BOOL)preventsInteractiveDismissal
{
  return 0;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_minimalView));
}

- (_TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController *)sub_1001C2D98(v5, v7, a4);
}

- (_TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001C3D5C();
}

- (void)viewDidLoad
{
  NSString v2 = self;
  sub_1001C3118();
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1001C3FA8();
  swift_unknownObjectRelease();
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SpeechTranslationApertureElementViewController();
  swift_unknownObjectRetain();
  id v4 = v8.receiver;
  [(SpeechTranslationApertureElementViewController *)&v8 preferredContentSizeDidChangeForChildContentContainer:a3];
  id v5 = [v4 systemApertureElementContext];
  v7[4] = nullsub_1;
  v7[5] = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10008BA1C;
  v7[3] = &unk_1002D2458;
  uint64_t v6 = _Block_copy(v7);
  [v5 setElementNeedsUpdateWithCoordinatedAnimations:v6];
  _Block_release(v6);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSSet)backgroundActivitiesToSuppress
{
  sub_100007620((uint64_t *)&unk_1002FAC80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1002488D0;
  id v3 = (void *)STBackgroundActivityIdentifierRecording;
  *(void *)(inited + 32) = STBackgroundActivityIdentifierRecording;
  id v4 = v3;
  sub_100112688(inited);
  swift_setDeallocating();
  type metadata accessor for STBackgroundActivityIdentifier(0);
  swift_arrayDestroy();
  sub_1001C40EC(&qword_1002EEB30, type metadata accessor for STBackgroundActivityIdentifier);
  v5.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v5.super.isa;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_minimalView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator46SpeechTranslationApertureElementViewController_hostingController);
}

@end