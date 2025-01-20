@interface MindfulnessSessionDetailViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC10FitnessApp38MindfulnessSessionDetailViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp38MindfulnessSessionDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC10FitnessApp38MindfulnessSessionDetailViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (void)didTapShareButton;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MindfulnessSessionDetailViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MindfulnessSessionDetailViewController();
  id v4 = v8.receiver;
  [(MindfulnessSessionDetailViewController *)&v8 viewWillAppear:v3];
  id v5 = [v4 navigationController];
  if (v5)
  {
    v6 = v5;
    self;
    v7 = (void *)swift_dynamicCastObjCClass();
    if (!v7) {

    }
    [v7 detachPalette];
  }
  else
  {
    v7 = v4;
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return UITableViewAutomaticDimension;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void)didTapShareButton
{
  v2 = self;
  sub_10039FF3C();
}

- (_TtC10FitnessApp38MindfulnessSessionDetailViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_sharingImage) = 0;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_trainer;
  uint64_t v6 = type metadata accessor for Trainer();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC10FitnessApp38MindfulnessSessionDetailViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp38MindfulnessSessionDetailViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC10FitnessApp38MindfulnessSessionDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp38MindfulnessSessionDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp38MindfulnessSessionDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_mindfulnessSessionViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_mindfulnessSessionFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_sharingImage));
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_trainer, &qword_100950BA8);
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1003A0FD4();

  return v6;
}

@end