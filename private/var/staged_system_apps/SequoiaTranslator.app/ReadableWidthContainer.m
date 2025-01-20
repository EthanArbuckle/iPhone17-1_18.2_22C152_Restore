@interface ReadableWidthContainer
- (_TtC17SequoiaTranslator22ReadableWidthContainer)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator22ReadableWidthContainer)initWithFrame:(CGRect)a3;
@end

@implementation ReadableWidthContainer

- (_TtC17SequoiaTranslator22ReadableWidthContainer)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_wrappedView) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_readableWidthEnabled) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_sizingConstraints) = (Class)_swiftEmptyArrayStorage;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ReadableWidthContainer();
  return -[ReadableWidthContainer initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC17SequoiaTranslator22ReadableWidthContainer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_wrappedView) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_readableWidthEnabled) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_sizingConstraints) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtC17SequoiaTranslator22ReadableWidthContainer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22ReadableWidthContainer_wrappedView));

  swift_bridgeObjectRelease();
}

@end