@interface SLCollaborationAttributionViewMetricsProvider
- (CGSize)drawingSize;
- (SLCollaborationAttributionViewMetricsProvider)init;
- (SLCollaborationAttributionViewMetricsProvider)initWithSlotStyle:(id)a3 tag:(id)a4;
- (SLCollaborationAttributionViewMetricsProvider)initWithVariant:(int64_t)a3 slotStyle:(id)a4 maxWidth:(double)a5 placeholderGlyphConfig:(id)a6;
- (const)singleLineSubtitleForString:(id)a3;
- (const)singleLineTitleForString:(id)a3;
- (double)avatarDiameter;
- (double)avatarLabelSpace;
- (double)titleSubtitleSpace;
@end

@implementation SLCollaborationAttributionViewMetricsProvider

- (SLCollaborationAttributionViewMetricsProvider)initWithSlotStyle:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v7, sel_variant);
  objc_msgSend(v7, sel_maxWidth);
  double v10 = v9;
  id v11 = objc_msgSend(v7, sel_placeholderGlyphConfiguration);
  v12 = [(SLCollaborationAttributionViewMetricsProvider *)self initWithVariant:v8 slotStyle:v6 maxWidth:v11 placeholderGlyphConfig:v10];

  return v12;
}

- (SLCollaborationAttributionViewMetricsProvider)initWithVariant:(int64_t)a3 slotStyle:(id)a4 maxWidth:(double)a5 placeholderGlyphConfig:(id)a6
{
  return (SLCollaborationAttributionViewMetricsProvider *)CollaborationAttributionViewMetricsProvider.init(variant:slotStyle:maxWidth:placeholderGlyphConfig:)(a3, (uint64_t)a4, (uint64_t)a6, a5);
}

- (SLCollaborationAttributionViewMetricsProvider)init
{
  result = (SLCollaborationAttributionViewMetricsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (CGSize)drawingSize
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(void *)(v5 + 8);
  id v7 = *(double (**)(uint64_t, uint64_t))(v6 + 24);
  id v8 = self;
  double v9 = v7(v4, v6);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)avatarDiameter
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(double (**)(uint64_t, uint64_t))(v5 + 32);
  id v7 = self;
  double v8 = v6(v4, v5);

  return v8;
}

- (double)avatarLabelSpace
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(double (**)(uint64_t, uint64_t))(v5 + 48);
  id v7 = self;
  double v8 = v6(v4, v5);

  return v8;
}

- (double)titleSubtitleSpace
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(double (**)(uint64_t, uint64_t))(v5 + 56);
  id v7 = self;
  double v8 = v6(v4, v5);

  return v8;
}

- (const)singleLineTitleForString:(id)a3
{
  return (const __CTLine *)@objc CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)((char *)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t))static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:));
}

- (const)singleLineSubtitleForString:(id)a3
{
  return (const __CTLine *)@objc CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)((char *)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t))static CollaborationAttributionViewMetricsProvider.singleLineSubtitle<A>(for:metrics:));
}

@end