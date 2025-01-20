@interface TUIMediaBackdropSnapshotRenderer
+ (void)renderWithContent:(id)a3 size:(CGSize)a4 contentScale:(double)a5 completionHandler:(id)a6;
- (TUIMediaBackdropSnapshotRenderer)init;
@end

@implementation TUIMediaBackdropSnapshotRenderer

+ (void)renderWithContent:(id)a3 size:(CGSize)a4 contentScale:(double)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  _s10TemplateUI29MediaBackdropSnapshotRendererC6render7content4size0H5Scale10completionySo15TUIImageContentC_So6CGSizeV12CoreGraphics7CGFloatVySo10CGImageRefaSg_s5Error_pSgtctFZ_0(v12, (uint64_t)sub_1906C4, v11, width, height, a5);

  swift_release();
}

- (TUIMediaBackdropSnapshotRenderer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MediaBackdropSnapshotRenderer();
  return [(TUIMediaBackdropSnapshotRenderer *)&v3 init];
}

@end