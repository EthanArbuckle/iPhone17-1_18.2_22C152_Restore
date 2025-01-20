@interface ProfilePictureButton
- (_TtC8ShelfKit20ProfilePictureButton)initWithCoder:(id)a3;
- (_TtC8ShelfKit20ProfilePictureButton)initWithFrame:(CGRect)a3;
- (void)updateAccount;
@end

@implementation ProfilePictureButton

- (_TtC8ShelfKit20ProfilePictureButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_12C1DC();
}

- (void)updateAccount
{
  v2 = self;
  sub_12BE0C();
}

- (_TtC8ShelfKit20ProfilePictureButton)initWithFrame:(CGRect)a3
{
  result = (_TtC8ShelfKit20ProfilePictureButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8ShelfKit20ProfilePictureButton_image));
}

@end