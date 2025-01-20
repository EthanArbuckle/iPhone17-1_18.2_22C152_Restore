@interface AmbientListeningUIView
- (CGSize)intrinsicContentSize;
- (_TtC11ShazamKitUI22AmbientListeningUIView)initWithCoder:(id)a3;
- (_TtC11ShazamKitUI22AmbientListeningUIView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AmbientListeningUIView

- (_TtC11ShazamKitUI22AmbientListeningUIView)initWithFrame:(CGRect)a3
{
  return (_TtC11ShazamKitUI22AmbientListeningUIView *)sub_236CE28B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ShazamKitUI22AmbientListeningUIView)initWithCoder:(id)a3
{
  return (_TtC11ShazamKitUI22AmbientListeningUIView *)sub_236CE2F3C(a3);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(AmbientListeningUIView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayer];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayerView], sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(AmbientListeningUIView *)v2 superview];
  if (v3)
  {
    objc_super v4 = v3;
    objc_msgSend(v3, sel_bounds);
    double v6 = v5;
    double v8 = v7;
  }
  else
  {

    double v8 = 0.0;
    double v6 = 0.0;
  }
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLabel);
}

@end