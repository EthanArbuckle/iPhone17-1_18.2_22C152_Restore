@interface SLHighlightDisambiguationPillMetrics
+ (id)accessibilityLabelFor:(id)a3;
+ (id)firstLineStringFor:(id)a3;
+ (id)secondLineStringFor:(id)a3;
- (BOOL)useChevron;
- (BOOL)useSingleLineLayout;
- (CGColor)firstLineColor;
- (CGColor)secondLineColor;
- (CGImage)chevronImage;
- (CGSize)chevronSize;
- (CGSize)firstLineSize;
- (CGSize)pillSize;
- (CGSize)secondLineSize;
- (NSEdgeInsets)labelHorizontalMargins;
- (NSEdgeInsets)margins;
- (NSMutableAttributedString)firstLineAttributedString;
- (NSMutableAttributedString)secondLineAttributedString;
- (SLHighlightDisambiguationPillMetrics)init;
- (SLHighlightDisambiguationPillMetrics)initWithSlotStyle:(id)a3 tag:(id)a4;
- (SLHighlightDisambiguationPillMetrics)initWithSlotStyle:(id)a3 tag:(id)a4 variant:(unint64_t)a5;
- (const)firstLineFont;
- (const)lineFrom:(id)a3 maxWidth:(double)a4;
- (const)secondLineFont;
- (double)avatarDiameter;
- (double)chevronLeadingMargin;
- (double)pillHeight;
@end

@implementation SLHighlightDisambiguationPillMetrics

- (SLHighlightDisambiguationPillMetrics)initWithSlotStyle:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[SLHighlightDisambiguationPillMetrics initWithSlotStyle:tag:variant:](self, sel_initWithSlotStyle_tag_variant_, v6, v7, objc_msgSend(v7, sel_variant));

  return v8;
}

- (SLHighlightDisambiguationPillMetrics)initWithSlotStyle:(id)a3 tag:(id)a4 variant:(unint64_t)a5
{
  return (SLHighlightDisambiguationPillMetrics *)DisambiguationPillMetrics.init(slotStyle:tag:variant:)((uint64_t)a3, (uint64_t)a4, a5);
}

+ (id)accessibilityLabelFor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = specialized static DisambiguationPillMetrics.firstLineString(for:)(v3);
  uint64_t v6 = v5;
  id v7 = specialized static DisambiguationPillMetrics.secondLineString(for:)(v3);
  v9 = v8;
  swift_bridgeObjectRetain();
  v10._countAndFlagsBits = (uint64_t)v7;
  v10._object = v9;
  String.append(_:)(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (void *)MEMORY[0x19F3906A0](v4, v6);
  swift_bridgeObjectRelease();
  return v11;
}

- (SLHighlightDisambiguationPillMetrics)init
{
  result = (SLHighlightDisambiguationPillMetrics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (NSEdgeInsets)margins
{
  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(&v7);

  double v4 = *((double *)&v7 + 1);
  double v3 = *(double *)&v7;
  double v5 = v8;
  double v6 = v9;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)pillHeight
{
  v2 = self;
  double v3 = DisambiguationPillMetrics.pillHeight.getter();

  return v3;
}

- (CGSize)pillSize
{
  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(&v5);

  double v3 = v6;
  double v4 = v7;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)avatarDiameter
{
  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(v4);

  return v5;
}

- (BOOL)useSingleLineLayout
{
  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(v4);

  return v5;
}

- (BOOL)useChevron
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  BOOL v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 32);
  double v6 = self;
  char v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7 & 1;
}

- (CGImage)chevronImage
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  BOOL v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 152);
  double v6 = self;
  char v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (CGImage *)v7;
}

- (CGSize)chevronSize
{
  v2 = self;
  double v3 = DisambiguationPillMetrics.chevronSize.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)chevronLeadingMargin
{
  v2 = self;
  double v3 = DisambiguationPillMetrics.chevronLeadingMargin.getter();

  return v3;
}

- (NSEdgeInsets)labelHorizontalMargins
{
  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(v7);

  double v3 = v8;
  double v4 = v9;
  double v5 = v10;
  double v6 = v11;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (const)lineFrom:(id)a3 maxWidth:(double)a4
{
  CFAttributedStringRef v5 = (const __CFAttributedString *)a3;
  double v6 = self;
  CTLineRef v7 = CTLineCreateWithAttributedString(v5);
  uint64_t TruncatedLineWithTokenHandler = CTLineCreateTruncatedLineWithTokenHandler();
  if (TruncatedLineWithTokenHandler)
  {
    double v9 = (void *)TruncatedLineWithTokenHandler;

    return (const __CTLine *)v9;
  }
  else
  {
    NSEdgeInsets result = (const __CTLine *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

- (CGSize)firstLineSize
{
  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(v5);

  double v3 = v6;
  double v4 = v7;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGColor)firstLineColor
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  CFAttributedStringRef v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 64);
  double v6 = self;
  double v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (CGColor *)v7;
}

- (const)firstLineFont
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  CFAttributedStringRef v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 72);
  double v6 = self;
  double v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (const __CTFont *)v7;
}

- (NSMutableAttributedString)firstLineAttributedString
{
  uint64_t v3 = (char *)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v15);
  uint64_t v4 = v15[4];
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)v3, (uint64_t)v12);
  uint64_t v5 = v13;
  uint64_t v6 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  double v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 80);
  double v8 = self;
  uint64_t v9 = v7(v5, v6);
  uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t))(v4 + 192))(v9);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);

  return (NSMutableAttributedString *)v10;
}

- (CGColor)secondLineColor
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 88);
  uint64_t v6 = self;
  double v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (CGColor *)v7;
}

- (const)secondLineFont
{
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 96);
  uint64_t v6 = self;
  double v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (const __CTFont *)v7;
}

- (CGSize)secondLineSize
{
  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(v5);

  double v3 = v6;
  double v4 = v7;
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSMutableAttributedString)secondLineAttributedString
{
  double v3 = (char *)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v15);
  uint64_t v4 = v15[4];
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)v3, (uint64_t)v12);
  uint64_t v5 = v13;
  uint64_t v6 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  double v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 104);
  double v8 = self;
  uint64_t v9 = v7(v5, v6);
  uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t))(v4 + 200))(v9);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);

  return (NSMutableAttributedString *)v10;
}

+ (id)firstLineStringFor:(id)a3
{
  return @objc static DisambiguationPillMetrics.firstLineString(for:)((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void))specialized static DisambiguationPillMetrics.firstLineString(for:));
}

+ (id)secondLineStringFor:(id)a3
{
  return @objc static DisambiguationPillMetrics.firstLineString(for:)((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void))specialized static DisambiguationPillMetrics.secondLineString(for:));
}

@end