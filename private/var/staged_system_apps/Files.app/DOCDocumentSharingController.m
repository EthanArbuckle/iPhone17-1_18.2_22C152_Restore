@interface DOCDocumentSharingController
- (_TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController)initWithCoder:(id)a3;
- (_TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController)initWithFileURL:(id)a3;
- (_TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController)initWithFileURL:(id)a3 error:(id *)a4;
- (_TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)presentationControllerWillDismiss:(id)a3;
@end

@implementation DOCDocumentSharingController

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001623F0(v4);
}

- (_TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController)initWithFileURL:(id)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  URL._bridgeToObjectiveC()(v8);
  v10 = v9;
  v11 = (objc_class *)type metadata accessor for DOCDocumentSharingController();
  v14.receiver = self;
  v14.super_class = v11;
  v12 = [(DOCDocumentSharingController *)&v14 initWithFileURL:v10];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v12;
}

- (_TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController)initWithFileURL:(id)a3 error:(id *)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  URL._bridgeToObjectiveC()(v10);
  v12 = v11;
  v13 = (objc_class *)type metadata accessor for DOCDocumentSharingController();
  v16.receiver = self;
  v16.super_class = v13;
  objc_super v14 = [(DOCDocumentSharingController *)&v16 initWithFileURL:v12 error:a4];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v14;
}

- (_TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DOCDocumentSharingController();
  v9 = [(DOCDocumentSharingController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCDocumentSharingController();
  return [(DOCDocumentSharingController *)&v5 initWithCoder:a3];
}

@end