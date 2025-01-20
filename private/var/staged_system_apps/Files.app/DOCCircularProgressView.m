@interface DOCCircularProgressView
- (_TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView)initWithCoder:(id)a3;
- (_TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView)initWithFrame:(CGRect)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DOCCircularProgressView

- (_TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10031A4BC();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCCircularProgressView();
  id v2 = v3.receiver;
  [(DOCCircularProgressView *)&v3 tintColorDidChange];
  sub_100318784();
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003188C4(v4);
}

- (_TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_borderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_progressLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_indeterminateLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_preferredIconColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_progressBorderColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_progressFillColor));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5FilesP33_6C1A47974E8480CF19F978326BC049AE23DOCCircularProgressView_progressBackgroundColor);
}

@end