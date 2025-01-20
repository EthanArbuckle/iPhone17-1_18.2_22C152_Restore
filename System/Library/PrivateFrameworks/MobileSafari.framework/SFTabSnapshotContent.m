@interface SFTabSnapshotContent
- (BOOL)isValid;
- (SFTabSnapshotContent)init;
- (SFTabSnapshotContent)initWithImage:(id)a3 bannerHeight:(double)a4 topBackdropHeight:(double)a5 isValid:(BOOL)a6;
- (UIImage)image;
- (double)bannerHeight;
- (double)topBackdropHeight;
- (void)setBannerHeight:(double)a3;
- (void)setImage:(id)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setTopBackdropHeight:(double)a3;
@end

@implementation SFTabSnapshotContent

- (SFTabSnapshotContent)initWithImage:(id)a3 bannerHeight:(double)a4 topBackdropHeight:(double)a5 isValid:(BOOL)a6
{
  v6 = (char *)self + OBJC_IVAR___SFTabSnapshotContent_wrapped;
  *(double *)v6 = a4;
  *((void *)v6 + 1) = a3;
  v6[16] = a6;
  *((double *)v6 + 3) = a5;
  v9.receiver = self;
  v9.super_class = (Class)SFTabSnapshotContent;
  id v7 = a3;
  return [(SFTabSnapshotContent *)&v9 init];
}

- (double)bannerHeight
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotContent_wrapped);
}

- (void)setBannerHeight:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotContent_wrapped) = a3;
}

- (UIImage)image
{
  return (UIImage *)*(id *)&self->wrapped[OBJC_IVAR___SFTabSnapshotContent_wrapped];
}

- (void)setImage:(id)a3
{
  id v4 = *(id *)&self->wrapped[OBJC_IVAR___SFTabSnapshotContent_wrapped];
  *(void *)&self->wrapped[OBJC_IVAR___SFTabSnapshotContent_wrapped] = a3;
  id v3 = a3;
}

- (BOOL)isValid
{
  return self->wrapped[OBJC_IVAR___SFTabSnapshotContent_wrapped + 8];
}

- (void)setIsValid:(BOOL)a3
{
  self->wrapped[OBJC_IVAR___SFTabSnapshotContent_wrapped + 8] = a3;
}

- (double)topBackdropHeight
{
  return *(double *)&self->wrapped[OBJC_IVAR___SFTabSnapshotContent_wrapped + 16];
}

- (void)setTopBackdropHeight:(double)a3
{
  *(double *)&self->wrapped[OBJC_IVAR___SFTabSnapshotContent_wrapped + 16] = a3;
}

- (SFTabSnapshotContent)init
{
  result = (SFTabSnapshotContent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end