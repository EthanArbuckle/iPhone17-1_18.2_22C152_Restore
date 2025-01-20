@interface ArcadeDownloadPackSuggestionsViewController
- (void)didTapDoneButton;
- (void)didTapGetAllButtonWithSender:(id)a3;
@end

@implementation ArcadeDownloadPackSuggestionsViewController

- (void)didTapDoneButton
{
  v2 = self;
  dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.didTapDoneButton()();
  v4[4] = sub_1004498AC;
  v4[5] = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_1000162D4;
  v4[3] = &unk_1008CC298;
  v3 = _Block_copy(v4);
  [(ArcadeDownloadPackSuggestionsViewController *)v2 dismissViewControllerAnimated:1 completion:v3];
  _Block_release(v3);
}

- (void)didTapGetAllButtonWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100449B44(v4);
}

- (void).cxx_destruct
{
  swift_release();

  v3 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC8AppStore43ArcadeDownloadPackSuggestionsViewController_primaryGetAllButton];
}

@end