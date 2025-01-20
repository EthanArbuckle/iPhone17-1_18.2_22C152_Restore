@interface _HandlerBox
- (_TtC7MercuryP33_2B1830E49151A2D290BADAC81D16B73411_HandlerBox)init;
- (void)invoke:(BOOL)a3 :(void *)a4;
@end

@implementation _HandlerBox

- (void)invoke:(BOOL)a3 :(void *)a4
{
  BOOL v4 = a3;
  v5 = *(void (**)(BOOL))((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7MercuryP33_2B1830E49151A2D290BADAC81D16B73411_HandlerBox_handler);
  v6 = self;
  swift_retain();
  v5(v4);

  swift_release();
}

- (_TtC7MercuryP33_2B1830E49151A2D290BADAC81D16B73411_HandlerBox)init
{
  result = (_TtC7MercuryP33_2B1830E49151A2D290BADAC81D16B73411_HandlerBox *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end