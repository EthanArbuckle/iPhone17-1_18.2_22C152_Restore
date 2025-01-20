@interface FMModernPlatterTableView
- (CGSize)contentSize;
- (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView)init;
- (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView)initWithCoder:(id)a3;
- (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)setContentSize:(CGSize)a3;
@end

@implementation FMModernPlatterTableView

- (CGSize)contentSize
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMModernPlatterTableView();
  [(FMModernPlatterTableView *)&v4 contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMModernPlatterTableView();
  id v5 = v6.receiver;
  -[FMModernPlatterTableView setContentSize:](&v6, "setContentSize:", width, height);
  sub_1004F8524();
}

- (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView)init
{
  return (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView *)sub_1004F8624();
}

- (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView_heightConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView_resizeBlockCount) = 0;
  id v4 = a3;

  CGSize result = (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  CGSize result = (_TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_CC23E81230DC16D325E739DF41B02D5424FMModernPlatterTableView_heightConstraint));
}

@end