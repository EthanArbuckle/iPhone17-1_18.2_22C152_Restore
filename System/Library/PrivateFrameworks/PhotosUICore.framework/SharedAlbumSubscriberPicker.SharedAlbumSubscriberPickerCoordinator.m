@interface SharedAlbumSubscriberPicker.SharedAlbumSubscriberPickerCoordinator
- (_TtCV12PhotosUICore27SharedAlbumSubscriberPicker38SharedAlbumSubscriberPickerCoordinator)init;
- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4;
- (void)photoRecipientViewControllerDidCancel:(id)a3;
@end

@implementation SharedAlbumSubscriberPicker.SharedAlbumSubscriberPickerCoordinator

- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4
{
  sub_1A9B21070(0, &qword_1E98221A0);
  unint64_t v6 = sub_1AB23AADC();
  id v7 = a3;
  v8 = self;
  sub_1A9D87F08((uint64_t)v7, v6);
}

- (void)photoRecipientViewControllerDidCancel:(id)a3
{
}

- (_TtCV12PhotosUICore27SharedAlbumSubscriberPicker38SharedAlbumSubscriberPickerCoordinator)init
{
  result = (_TtCV12PhotosUICore27SharedAlbumSubscriberPicker38SharedAlbumSubscriberPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end