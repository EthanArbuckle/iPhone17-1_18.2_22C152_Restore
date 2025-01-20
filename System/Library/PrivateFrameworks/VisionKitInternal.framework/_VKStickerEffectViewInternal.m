@interface _VKStickerEffectViewInternal
+ (double)extraScaleToIncludeStrokeWithEffectType:(int64_t)a3 bounds:(CGRect)a4;
- (BOOL)boundsIncludeStroke;
- (BOOL)isPaused;
- (BOOL)reRenderOnMotion;
- (CGSize)intrinsicContentSize;
- (NSString)description;
- (UIImage)image;
- (VKStickerEffectInternal)_effect;
- (_VKStickerEffectInternal)effect;
- (_VKStickerEffectViewInternal)initWithCoder:(id)a3;
- (_VKStickerEffectViewInternal)initWithDevice:(id)a3;
- (_VKStickerEffectViewInternal)initWithFrame:(CGRect)a3;
- (float)curlPosition;
- (void)_internalUpdateFromDisplayLink:(id)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)playSettlingAnimation;
- (void)scrollViewDidChange:(id)a3;
- (void)scrollViewWillChange:(id)a3;
- (void)setBoundsIncludeStroke:(BOOL)a3;
- (void)setCurlPosition:(float)a3;
- (void)setEffect:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setReRenderOnMotion:(BOOL)a3;
- (void)set_effect:(id)a3;
- (void)snapshotWithCompletionHandler:(id)a3;
@end

@implementation _VKStickerEffectViewInternal

- (BOOL)boundsIncludeStroke
{
  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke;
  swift_beginAccess();
  return *v2;
}

- (void)setBoundsIncludeStroke:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectViewInternal_boundsIncludeStroke;
  swift_beginAccess();
  BOOL *v4 = a3;
}

+ (double)extraScaleToIncludeStrokeWithEffectType:(int64_t)a3 bounds:(CGRect)a4
{
  sub_260D71C88(a3, a4.size.width, a4.size.height);
  return result;
}

- (BOOL)reRenderOnMotion
{
  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion;
  swift_beginAccess();
  return *v2;
}

- (void)setReRenderOnMotion:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____VKStickerEffectViewInternal_reRenderOnMotion;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (float)curlPosition
{
  v2 = (float *)((char *)self + OBJC_IVAR____VKStickerEffectViewInternal_curlPosition);
  swift_beginAccess();
  return *v2;
}

- (void)setCurlPosition:(float)a3
{
  v4 = self;
  sub_260D6BE84(a3);
}

- (_VKStickerEffectInternal)effect
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  return (_VKStickerEffectInternal *)*v2;
}

- (void)setEffect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_260D6C120(v4);
}

- (VKStickerEffectInternal)_effect
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_effect);
  swift_beginAccess();
  return (VKStickerEffectInternal *)*v2;
}

- (void)set_effect:(id)a3
{
  type metadata accessor for StickerEffect();
  uint64_t v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = (void *)v4;
    swift_unknownObjectRetain_n();
    v6 = self;
  }
  else
  {
    uint64_t v7 = qword_26A8E48E8;
    swift_unknownObjectRetain();
    v8 = self;
    if (v7 != -1) {
      swift_once();
    }
    v6 = (_VKStickerEffectViewInternal *)qword_26A8E4B50;
    v5 = (void *)qword_26A8E4B50;
  }
  v9 = v6;
  sub_260D6C120(v5);

  swift_unknownObjectRelease();
}

- (UIImage)image
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  return (UIImage *)*v2;
}

- (void)setImage:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  v6 = *v5;
  void *v5 = a3;
  id v7 = a3;
  v8 = self;
  sub_260D6C918((uint64_t)v6);
}

- (BOOL)isPaused
{
  v2 = (BOOL *)self + OBJC_IVAR____VKStickerEffectViewInternal_isPaused;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPaused:(BOOL)a3
{
  int v3 = a3;
  v5 = (char *)self + OBJC_IVAR____VKStickerEffectViewInternal_isPaused;
  swift_beginAccess();
  int v6 = *v5;
  unsigned char *v5 = v3;
  if (v6 != v3)
  {
    id v7 = self;
    sub_260D6F264();
  }
}

- (NSString)description
{
  v2 = self;
  sub_260D6CE24();

  int v3 = (void *)sub_260D75650();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_VKStickerEffectViewInternal)initWithDevice:(id)a3
{
  return (_VKStickerEffectViewInternal *)StickerEffectView.init(device:)(a3);
}

- (_VKStickerEffectViewInternal)initWithCoder:(id)a3
{
  id v3 = a3;
  _s17VisionKitInternal17StickerEffectViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)scrollViewWillChange:(id)a3
{
}

- (void)scrollViewDidChange:(id)a3
{
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  if ((*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_displayLinkActive) & 1) == 0)
  {
    v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_displayLink);
    id v6 = v5;
    id v7 = a3;
    v10 = self;
    sub_260D6F6FC(v5);
    v9 = v8;

    *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_unitScreenCenter) = v9;
    sub_260D6F264();
  }
}

- (CGSize)intrinsicContentSize
{
  id v3 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_image);
  swift_beginAccess();
  if (*v3)
  {
    objc_msgSend(*v3, sel_size);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)type metadata accessor for StickerEffectView();
    [(_VKStickerEffectViewInternal *)&v6 intrinsicContentSize];
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_260D6E114();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_260D6E3E0();
}

- (void)dealloc
{
  v2 = self;
  StickerEffectView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____VKStickerEffectViewInternal_logger;
  uint64_t v4 = sub_260D755E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____VKStickerEffectViewInternal_metalLayerContainer));
  swift_unknownObjectWeakDestroy();

  swift_release();
  double v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_image);
}

- (void)playSettlingAnimation
{
  v2 = self;
  *(CFTimeInterval *)((char *)&v2->super.super.super.isa + OBJC_IVAR____VKStickerEffectViewInternal_settlingStartTime) = CACurrentMediaTime();
  sub_260D6F264();
}

- (void)_internalUpdateFromDisplayLink:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_260D6F408(v4);
}

- (void)snapshotWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  double v5 = self;
  sub_260D72F9C((char *)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_VKStickerEffectViewInternal)initWithFrame:(CGRect)a3
{
  CGSize result = (_VKStickerEffectViewInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end