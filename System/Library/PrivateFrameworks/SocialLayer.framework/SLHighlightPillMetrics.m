@interface SLHighlightPillMetrics
+ (CGSize)chevronSizeWithStyle:(id)a3 variant:(unint64_t)a4;
+ (NSEdgeInsets)pillMarginsWithStyle:(id)a3 variant:(unint64_t)a4 maxWidth:(double)a5;
+ (const)chevronFontDescriptorWithStyle:(id)a3 variant:(unint64_t)a4;
+ (const)truncatedLineFrom:(id)a3 maxWidth:(double)a4;
+ (double)pillHeightWithStyle:(id)a3 variant:(unint64_t)a4 maxWidth:(double)a5;
+ (id)accessibilityLabelFor:(id)a3;
+ (int64_t)maxSendersToDisplayWithStyle:(id)a3 variant:(unint64_t)a4;
- (BOOL)hasValidMetricsForDrawing;
- (BOOL)shouldDisplayPin;
- (BOOL)useDoubleLinedLabel;
- (CGSize)chevronSize;
- (CGSize)pillSize;
- (NSEdgeInsets)labelHorizontalMargins;
- (NSEdgeInsets)margins;
- (NSEdgeInsets)minimumLabelHorizontalMargines;
- (SLHighlightPillMetrics)init;
- (SLHighlightPillMetrics)initWithSlotStyle:(id)a3 tag:(id)a4;
- (SLHighlightPillMetrics)initWithSlotStyle:(id)a3 tag:(id)a4 variant:(unint64_t)a5;
- (const)baseFont;
- (const)chevronFontDescriptor;
- (const)firstLine;
- (const)secondLine;
- (double)avatarContainerWidth;
- (double)avatarDiameter;
- (double)avatarKnockoutWidth;
- (double)overlappedAvatarKnockoutBorderWidth;
- (double)overlappedAvatarVisibleWidth;
- (double)specMaxWidth;
- (int64_t)imageCount;
@end

@implementation SLHighlightPillMetrics

- (SLHighlightPillMetrics)initWithSlotStyle:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[SLHighlightPillMetrics initWithSlotStyle:tag:variant:](self, sel_initWithSlotStyle_tag_variant_, v6, v7, objc_msgSend(v7, sel_variant));

  return v8;
}

- (SLHighlightPillMetrics)initWithSlotStyle:(id)a3 tag:(id)a4 variant:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (SLHighlightPillMetrics *)specialized PillMetrics.init(slotStyle:tag:variant:)(v7, v8, a5);

  return v9;
}

- (SLHighlightPillMetrics)init
{
  result = (SLHighlightPillMetrics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics);

  outlined init with take of SLDHighlightPillMetrics?((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics____lazy_storage___pillMetrics, (uint64_t)v3);
  outlined release of SLDHighlightPillMetrics?(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of SLDHighlightPillMetrics?);
}

- (NSEdgeInsets)margins
{
  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v7);
  outlined release of SLDHighlightPillMetrics((uint64_t)v7);

  double v3 = *(double *)&v7[1];
  double v4 = *(double *)&v7[2];
  double v5 = *(double *)&v7[3];
  double v6 = *(double *)&v7[4];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGSize)pillSize
{
  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v5);
  outlined release of SLDHighlightPillMetrics((uint64_t)v5);

  double v3 = *(double *)&v5[5];
  double v4 = *(double *)&v5[6];
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)hasValidMetricsForDrawing
{
  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v4);
  outlined release of SLDHighlightPillMetrics((uint64_t)v4);

  return v4[0];
}

- (const)firstLine
{
  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v5);
  id v3 = v5[7];
  outlined release of SLDHighlightPillMetrics((uint64_t)v5);

  return (const __CTLine *)v3;
}

- (const)secondLine
{
  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v5);
  id v3 = v5[8];
  outlined release of SLDHighlightPillMetrics((uint64_t)v5);

  return (const __CTLine *)v3;
}

- (double)overlappedAvatarKnockoutBorderWidth
{
  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v4);
  outlined release of SLDHighlightPillMetrics((uint64_t)v4);

  return *(double *)&v4[9];
}

- (NSEdgeInsets)labelHorizontalMargins
{
  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v7);
  outlined release of SLDHighlightPillMetrics((uint64_t)v7);

  double v3 = *(double *)&v7[10];
  double v4 = *(double *)&v7[11];
  double v5 = *(double *)&v7[12];
  double v6 = *(double *)&v7[13];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)specMaxWidth
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  double v5 = *(double (**)(uint64_t, uint64_t))(v4 + 80);
  double v6 = self;
  double v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7;
}

- (NSEdgeInsets)minimumLabelHorizontalMargines
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v18);
  uint64_t v3 = v19;
  uint64_t v4 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  double v5 = *(double (**)(uint64_t, uint64_t))(v4 + 88);
  double v6 = self;
  double v7 = v5(v3, v4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (double)avatarDiameter
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  double v5 = *(double (**)(uint64_t, uint64_t))(v4 + 96);
  double v6 = self;
  double v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7;
}

- (double)avatarContainerWidth
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  double v5 = *(double (**)(uint64_t, uint64_t))(v4 + 112);
  double v6 = self;
  double v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7;
}

- (double)avatarKnockoutWidth
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  double v5 = *(double (**)(uint64_t, uint64_t))(v4 + 120);
  double v6 = self;
  double v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7;
}

- (double)overlappedAvatarVisibleWidth
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  double v5 = *(double (**)(uint64_t, uint64_t))(v4 + 104);
  double v6 = self;
  double v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7;
}

- (BOOL)useDoubleLinedLabel
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  double v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 128);
  double v6 = self;
  char v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7 & 1;
}

- (CGSize)chevronSize
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v12);
  uint64_t v3 = v13;
  uint64_t v4 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  double v5 = *(double (**)(uint64_t, uint64_t))(v4 + 192);
  double v6 = self;
  double v7 = v5(v3, v4);
  double v9 = v8;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)accessibilityLabelFor:(id)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = specialized static PillMetrics.accessibilityLabel(for:)(v3);
  uint64_t v6 = v5;

  if (v6)
  {
    double v7 = (void *)MEMORY[0x19F3906A0](v4, v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

+ (double)pillHeightWithStyle:(id)a3 variant:(unint64_t)a4 maxWidth:(double)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  double v9 = static PillMetrics.pillHeight(style:variant:maxWidth:)(v8, a4, a5);

  return v9;
}

+ (NSEdgeInsets)pillMarginsWithStyle:(id)a3 variant:(unint64_t)a4 maxWidth:(double)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(v8, a4, (uint64_t)v22, a5);
  uint64_t v9 = v23;
  uint64_t v10 = v24;
  __swift_project_boxed_opaque_existential_1(v22, v23);
  double v11 = (*(double (**)(uint64_t, uint64_t))(v10 + 168))(v9, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

+ (int64_t)maxSendersToDisplayWithStyle:(id)a3 variant:(unint64_t)a4
{
  swift_getObjCClassMetadata();
  id v6 = a3;
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(v6, a4, (uint64_t)v15, 100.0);
  uint64_t v7 = v16;
  uint64_t v8 = v17;
  __swift_project_boxed_opaque_existential_1(v15, v16);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 40))(v7, v8);
  uint64_t v10 = v16;
  uint64_t v11 = v17;
  __swift_project_boxed_opaque_existential_1(v15, v16);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 48))(v10, v11);
  if (v12 <= v9) {
    int64_t v13 = v9;
  }
  else {
    int64_t v13 = v12;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);

  return v13;
}

+ (const)chevronFontDescriptorWithStyle:(id)a3 variant:(unint64_t)a4
{
  swift_getObjCClassMetadata();
  id v6 = a3;
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(v6, a4, (uint64_t)v11, 100.0);
  uint64_t v7 = v12;
  uint64_t v8 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  uint64_t v9 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 184))(v7, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);

  return (const __CTFontDescriptor *)v9;
}

+ (CGSize)chevronSizeWithStyle:(id)a3 variant:(unint64_t)a4
{
  swift_getObjCClassMetadata();
  id v6 = a3;
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(v6, a4, (uint64_t)v14, 100.0);
  uint64_t v7 = v15;
  uint64_t v8 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  double v9 = (*(double (**)(uint64_t, uint64_t))(v8 + 192))(v7, v8);
  double v11 = v10;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (const)truncatedLineFrom:(id)a3 maxWidth:(double)a4
{
  CFAttributedStringRef v4 = (const __CFAttributedString *)a3;
  CTLineRef v5 = CTLineCreateWithAttributedString(v4);
  TruncatedLineWithTokenHandler = (void *)CTLineCreateTruncatedLineWithTokenHandler();

  return (const __CTLine *)TruncatedLineWithTokenHandler;
}

- (int64_t)imageCount
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  CTLineRef v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 64);
  id v6 = self;
  int64_t v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7;
}

- (BOOL)shouldDisplayPin
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  CTLineRef v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 72);
  id v6 = self;
  char v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7 & 1;
}

- (const)chevronFontDescriptor
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  CTLineRef v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 184);
  id v6 = self;
  char v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (const __CTFontDescriptor *)v7;
}

- (const)baseFont
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  CTLineRef v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 152);
  id v6 = self;
  char v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (const __CTFont *)v7;
}

@end