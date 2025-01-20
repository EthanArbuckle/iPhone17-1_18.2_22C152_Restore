@interface ICSystemPaperDocumentController
+ (ICSystemPaperDocumentController)sharedInstance;
- (ICSystemPaperDocumentController)init;
- (id)presenterForPaperIdentifier:(id)a3;
- (void)addPresenter:(id)a3;
- (void)removePresenter:(id)a3;
@end

@implementation ICSystemPaperDocumentController

+ (ICSystemPaperDocumentController)sharedInstance
{
  if (qword_26AD810A8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26AD80FA8;

  return (ICSystemPaperDocumentController *)v2;
}

- (ICSystemPaperDocumentController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperDocumentController_presenters) = (Class)MEMORY[0x263F8EE78];
  sub_20C15FB80();
  sub_20C15FB40();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(ICSystemPaperDocumentController *)&v5 init];
}

- (void)addPresenter:(id)a3
{
  v4 = (ICNoteEditorViewController *)a3;
  objc_super v5 = self;
  ICSystemPaperDocumentController.add(_:)(v4);
}

- (void)removePresenter:(id)a3
{
  v4 = (ICNoteEditorViewController *)a3;
  objc_super v5 = self;
  ICSystemPaperDocumentController.remove(_:)(v4);
}

- (id)presenterForPaperIdentifier:(id)a3
{
  uint64_t v4 = sub_20C162AC0();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  ICSystemPaperDocumentController.presenter(for:)(v9, v8);
  v11 = v10;

  swift_bridgeObjectRelease();

  return v11;
}

- (void).cxx_destruct
{
}

@end