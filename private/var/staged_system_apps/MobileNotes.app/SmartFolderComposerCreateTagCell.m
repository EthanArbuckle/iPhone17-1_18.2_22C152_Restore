@interface SmartFolderComposerCreateTagCell
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC11MobileNotes32SmartFolderComposerCreateTagCell)initWithCoder:(id)a3;
- (_TtC11MobileNotes32SmartFolderComposerCreateTagCell)initWithFrame:(CGRect)a3;
@end

@implementation SmartFolderComposerCreateTagCell

- (_TtC11MobileNotes32SmartFolderComposerCreateTagCell)initWithFrame:(CGRect)a3
{
  return (_TtC11MobileNotes32SmartFolderComposerCreateTagCell *)sub_10035782C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MobileNotes32SmartFolderComposerCreateTagCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes32SmartFolderComposerCreateTagCell *)sub_10035795C(a3);
}

- (void).cxx_destruct
{
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerCreateTagCell_tagDidChange));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerCreateTagCell_tagDidEnter);

  sub_10002E70C(v3);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100357EFC();

  return self & 1;
}

@end