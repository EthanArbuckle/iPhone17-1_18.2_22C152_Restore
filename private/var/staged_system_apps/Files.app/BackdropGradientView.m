@interface BackdropGradientView
- (_TtC5FilesP33_927EDC10B2E512953ACC1C78BA98F69520BackdropGradientView)initWithCoder:(id)a3;
- (_TtC5FilesP33_927EDC10B2E512953ACC1C78BA98F69520BackdropGradientView)initWithFrame:(CGRect)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)layoutSubviews;
@end

@implementation BackdropGradientView

- (_TtC5FilesP33_927EDC10B2E512953ACC1C78BA98F69520BackdropGradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002DED54();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002DDDA4();
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BackdropGradientView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(BackdropGradientView *)&v6 effectiveAppearanceDidChange:v4];
  sub_1002DDEFC(v4);
}

- (_TtC5FilesP33_927EDC10B2E512953ACC1C78BA98F69520BackdropGradientView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end