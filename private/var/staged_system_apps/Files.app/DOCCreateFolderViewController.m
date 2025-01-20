@interface DOCCreateFolderViewController
- (_TtC5Files29DOCCreateFolderViewController)initWithCoder:(id)a3;
- (id)initForCreatingFolderInParentItem:(id)a3 suggestedName:(id)a4 transitionProxy:(id)a5;
@end

@implementation DOCCreateFolderViewController

- (id)initForCreatingFolderInParentItem:(id)a3 suggestedName:(id)a4 transitionProxy:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  id v10 = a3;
  swift_unknownObjectRetain();
  return sub_1002EBFC4(v10, v7, v9, (uint64_t)a5);
}

- (_TtC5Files29DOCCreateFolderViewController)initWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files29DOCCreateFolderViewController_parentItem));
  v3 = (char *)self + OBJC_IVAR____TtC5Files29DOCCreateFolderViewController_delegate;

  sub_10003A094((uint64_t)v3);
}

@end