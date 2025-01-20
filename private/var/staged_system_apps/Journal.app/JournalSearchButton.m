@interface JournalSearchButton
- (_TtC7Journal19JournalSearchButton)initWithCoder:(id)a3;
- (_TtC7Journal19JournalSearchButton)initWithFrame:(CGRect)a3;
- (void)tapped;
@end

@implementation JournalSearchButton

- (_TtC7Journal19JournalSearchButton)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC7Journal19JournalSearchButton_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC7Journal19JournalSearchButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)tapped
{
  v3 = (char *)self + OBJC_IVAR____TtC7Journal19JournalSearchButton_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

- (_TtC7Journal19JournalSearchButton)initWithFrame:(CGRect)a3
{
  result = (_TtC7Journal19JournalSearchButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end