@interface DownloadButton
- (BOOL)accessibilityActivate;
- (_TtC5TeaUI14DownloadButton)init;
- (_TtC5TeaUI14DownloadButton)initWithCoder:(id)a3;
- (_TtC5TeaUI14DownloadButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)startingButtonTappedWithSender:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DownloadButton

- (_TtC5TeaUI14DownloadButton)init
{
  return (_TtC5TeaUI14DownloadButton *)DownloadButton.init()();
}

- (_TtC5TeaUI14DownloadButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI14DownloadButton *)DownloadButton.init(frame:)();
}

- (_TtC5TeaUI14DownloadButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B6109AC4();
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  DownloadButton.accessibilityActivate()();

  return 1;
}

- (void)layoutSubviews
{
  v2 = self;
  DownloadButton.layoutSubviews()();
}

- (void)tintColorDidChange
{
  v2 = self;
  DownloadButton.tintColorDidChange()();
}

- (void)startingButtonTappedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B6109D3C();
}

- (void).cxx_destruct
{
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI14DownloadButton_handler);
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI14DownloadButton_delegate);
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI14DownloadButton_dataProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14DownloadButton_imageTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14DownloadButton_progressTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14DownloadButton_trackTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14DownloadButton_downloadingImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14DownloadButton_notDownloadingImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14DownloadButton_progressBackgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI14DownloadButton_progressLayer));
  sub_1B610AC40((uint64_t)self + OBJC_IVAR____TtC5TeaUI14DownloadButton_downloadProgressDisposable);
  id v3 = (char *)self + OBJC_IVAR____TtC5TeaUI14DownloadButton_downloadStateDisposable;
  sub_1B610AC40((uint64_t)v3);
}

@end