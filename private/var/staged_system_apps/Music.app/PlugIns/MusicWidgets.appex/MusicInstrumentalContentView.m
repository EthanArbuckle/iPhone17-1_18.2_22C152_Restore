@interface MusicInstrumentalContentView
- (MusicInstrumentalContentView)initWithCoder:(id)a3;
- (MusicInstrumentalContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MusicInstrumentalContentView

- (MusicInstrumentalContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003FCE0C();
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)_s23InstrumentalContentViewCMa();
  v2 = (char *)v16.receiver;
  [(MusicInstrumentalContentView *)&v16 layoutSubviews];
  id v3 = &v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds];
  CGFloat v4 = *(double *)&v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds];
  CGFloat v5 = *(double *)&v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds + 8];
  CGFloat v6 = *(double *)&v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds + 16];
  CGFloat v7 = *(double *)&v2[OBJC_IVAR___MusicInstrumentalContentView_lastSeenBounds + 24];
  [v2 bounds];
  v18.origin.x = v8;
  v18.origin.y = v9;
  v18.size.width = v10;
  v18.size.height = v11;
  v17.origin.x = v4;
  v17.origin.y = v5;
  v17.size.width = v6;
  v17.size.height = v7;
  if (!CGRectEqualToRect(v17, v18))
  {
    [v2 bounds];
    *(void *)id v3 = v12;
    *((void *)v3 + 1) = v13;
    *((void *)v3 + 2) = v14;
    *((void *)v3 + 3) = v15;
    sub_1003FC850();
  }
}

- (MusicInstrumentalContentView)initWithFrame:(CGRect)a3
{
  result = (MusicInstrumentalContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(v2, (char *)self + OBJC_IVAR___MusicInstrumentalContentView_specs, 0x219uLL);
  sub_1003F0898((uint64_t)v2);
  swift_bridgeObjectRelease();
}

@end