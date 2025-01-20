@interface DOCGoToTextField
- (NSArray)keyCommands;
- (UIResponder)nextResponder;
- (_TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField)initWithFrame:(CGRect)a3;
@end

@implementation DOCGoToTextField

- (_TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField_customPlaceholderColor) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField_customBlendMode;
  *(_DWORD *)v7 = 0;
  v7[4] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField_coresponder) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCGoToTextField();
  return -[DOCTokenTextField initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (NSArray)keyCommands
{
  v2 = self;
  uint64_t v3 = sub_1002B0C48();

  if (v3)
  {
    sub_10009E6C4(0, &qword_100708860);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (UIResponder)nextResponder
{
  uint64_t v3 = *(UIResponder **)((char *)&self->super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField_coresponder);
  if (v3)
  {
    NSArray v4 = self;
    v5 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for DOCGoToTextField();
    v6 = self;
    v5 = [(DOCGoToTextField *)&v9 nextResponder];
  }
  v7 = v3;

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField_customPlaceholderColor));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField_coresponder);
}

@end