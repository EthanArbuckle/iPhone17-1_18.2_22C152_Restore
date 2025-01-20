@interface TranscriptWaitingHostingView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7Journal28TranscriptWaitingHostingView)initWithCoder:(id)a3;
- (_TtC7Journal28TranscriptWaitingHostingView)initWithFrame:(CGRect)a3;
@end

@implementation TranscriptWaitingHostingView

- (_TtC7Journal28TranscriptWaitingHostingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Journal28TranscriptWaitingHostingView_hostingController) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TranscriptWaitingHostingView();
  v7 = -[TranscriptWaitingHostingView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  sub_1001BC674();

  return v7;
}

- (_TtC7Journal28TranscriptWaitingHostingView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Journal28TranscriptWaitingHostingView_hostingController) = 0;
  id v4 = a3;

  result = (_TtC7Journal28TranscriptWaitingHostingView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Journal28TranscriptWaitingHostingView_hostingController);
  if (v5)
  {
    v6 = self;
    id v7 = v5;
    id v8 = [v7 view];
    if (v8)
    {
      v11 = v8;
      [v8 sizeThatFits:width, height];
      double v13 = v12;
      double v15 = v14;

      double v9 = v13;
      double v10 = v15;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)type metadata accessor for TranscriptWaitingHostingView();
    -[TranscriptWaitingHostingView sizeThatFits:](&v16, "sizeThatFits:", width, height);
  }
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Journal28TranscriptWaitingHostingView_hostingController);
  if (v2)
  {
    v3 = self;
    id v4 = [v2 view];
    if (v4)
    {
      id v7 = v4;
      [v4 intrinsicContentSize];
      double v9 = v8;
      double v11 = v10;

      double v5 = v9;
      double v6 = v11;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)type metadata accessor for TranscriptWaitingHostingView();
    [(TranscriptWaitingHostingView *)&v12 intrinsicContentSize];
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal28TranscriptWaitingHostingView_hostingController));
}

@end