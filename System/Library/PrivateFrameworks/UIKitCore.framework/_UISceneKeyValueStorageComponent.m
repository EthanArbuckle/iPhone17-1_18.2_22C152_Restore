@interface _UISceneKeyValueStorageComponent
- (_TtC5UIKit32_UISceneKeyValueStorageComponent)init;
- (_TtC5UIKit32_UISceneKeyValueStorageComponent)initWithScene:(id)a3;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
@end

@implementation _UISceneKeyValueStorageComponent

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_185A70A90;
  *(void *)(v7 + 24) = v6;
  v11[4] = sub_185A70B28;
  v11[5] = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_185A6FDC0;
  v11[3] = &block_descriptor_62_0;
  v8 = _Block_copy(v11);
  v9 = self;
  swift_unknownObjectRetain();
  id v10 = a4;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_inspectStorage_, v8);
  _Block_release(v8);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  if (v8) {
    __break(1u);
  }
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_185A70A24;
  *(void *)(v7 + 24) = v6;
  v11[4] = sub_18599B1AC;
  v11[5] = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_185A6FDC0;
  v11[3] = &block_descriptor_46_2;
  v8 = _Block_copy(v11);
  v9 = self;
  swift_unknownObjectRetain();
  id v10 = a4;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_inspectStorage_, v8);
  _Block_release(v8);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  if (v8) {
    __break(1u);
  }
}

- (_TtC5UIKit32_UISceneKeyValueStorageComponent)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit32_UISceneKeyValueStorageComponent____lazy_storage___controller) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit32_UISceneKeyValueStorageComponent____lazy_storage___hostInterface) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit32_UISceneKeyValueStorageComponent____lazy_storage___clientInterface) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UISceneKeyValueStorageComponent();
  return [(_UISceneKeyValueStorageComponent *)&v3 init];
}

- (_TtC5UIKit32_UISceneKeyValueStorageComponent)initWithScene:(id)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit32_UISceneKeyValueStorageComponent____lazy_storage___controller) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit32_UISceneKeyValueStorageComponent____lazy_storage___hostInterface) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC5UIKit32_UISceneKeyValueStorageComponent____lazy_storage___clientInterface) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UISceneKeyValueStorageComponent();
  return [(FBSSceneComponent *)&v5 initWithScene:a3];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end