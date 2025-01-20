@interface CRLImagePlaygroundViewControllerDelegate
- (_TtC8FreeformP33_A57276A3C6F5E8852856D4D908CBDB8040CRLImagePlaygroundViewControllerDelegate)init;
- (void)imagePlaygroundViewController:(id)a3 didCreateImageAt:(id)a4;
- (void)imagePlaygroundViewControllerDidCancel:(id)a3;
@end

@implementation CRLImagePlaygroundViewControllerDelegate

- (void)imagePlaygroundViewController:(id)a3 didCreateImageAt:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  sub_100FB8558();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)imagePlaygroundViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100FB8794();
}

- (_TtC8FreeformP33_A57276A3C6F5E8852856D4D908CBDB8040CRLImagePlaygroundViewControllerDelegate)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CRLImagePlaygroundViewControllerDelegate();
  return [(CRLImagePlaygroundViewControllerDelegate *)&v4 init];
}

- (void).cxx_destruct
{
}

@end