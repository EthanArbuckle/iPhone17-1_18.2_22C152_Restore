@interface BKDimmedCoverDownloadProgressView
- (BKDimmedCoverDownloadProgressView)initWithCoder:(id)a3;
- (BKDimmedCoverDownloadProgressView)initWithFrame:(CGRect)a3;
- (BKDimmedCoverDownloadProgressViewDelegate)delegate;
- (BKLibraryAsset)asset;
- (void)setAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopDownloadButtonPressed;
@end

@implementation BKDimmedCoverDownloadProgressView

- (BKDimmedCoverDownloadProgressViewDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BKDimmedCoverDownloadProgressViewDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (BKLibraryAsset)asset
{
  return (BKLibraryAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                   + OBJC_IVAR___BKDimmedCoverDownloadProgressView_asset));
}

- (void)setAsset:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1002EBCC0(a3);
}

- (void)stopDownloadButtonPressed
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKDimmedCoverDownloadProgressView_asset);
  if (v2)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      v5 = (void *)Strong;
      id v6 = self;
      id v7 = v2;
      [v5 didTapStopDownloadButtonWithAsset:v7];

      swift_unknownObjectRelease();
    }
  }
}

- (BKDimmedCoverDownloadProgressView)initWithFrame:(CGRect)a3
{
  return (BKDimmedCoverDownloadProgressView *)sub_1002EB8FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BKDimmedCoverDownloadProgressView)initWithCoder:(id)a3
{
  return (BKDimmedCoverDownloadProgressView *)sub_1002EB9F8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKDimmedCoverDownloadProgressView_downloadProgressButton));

  swift_bridgeObjectRelease();
  sub_10023E454((uint64_t)self + OBJC_IVAR___BKDimmedCoverDownloadProgressView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKDimmedCoverDownloadProgressView_downloadProgressStatus));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKDimmedCoverDownloadProgressView_asset);
}

@end