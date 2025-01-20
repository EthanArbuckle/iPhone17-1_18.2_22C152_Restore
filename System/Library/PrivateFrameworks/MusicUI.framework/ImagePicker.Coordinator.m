@interface ImagePicker.Coordinator
- (_TtCV7MusicUI11ImagePicker11Coordinator)init;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation ImagePicker.Coordinator

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_2297D1F94(&qword_26831BE10, type metadata accessor for InfoKey);
  sub_22A170640();
  id v6 = a3;
  v7 = self;
  sub_2297CEBE4(v6);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2297CF278();
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  sub_22A168EB0();
  sub_22A170AB0();
  id v6 = a3;
  v7 = self;
  sub_2297CFF70();

  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2297D0488(v4);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2297D05BC();
}

- (_TtCV7MusicUI11ImagePicker11Coordinator)init
{
}

- (void).cxx_destruct
{
  sub_2297D1F38((uint64_t)self + OBJC_IVAR____TtCV7MusicUI11ImagePicker11Coordinator_imagePicker);
  sub_22948636C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV7MusicUI11ImagePicker11Coordinator_pickHandler));

  swift_bridgeObjectRelease();
}

@end