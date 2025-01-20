@interface VCUIBadgedTextSegmentModel
- (BOOL)isWhiteSpace;
- (NSAttributedString)displayedText;
- (NSAttributedString)label;
- (NSAttributedString)representedText;
- (NSAttributedString)text;
- (_NSRange)nsRange;
- (void)setIsWhiteSpace:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setText:(id)a3;
@end

@implementation VCUIBadgedTextSegmentModel

- (NSAttributedString)text
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VCUIBadgedTextSegmentModel_text);
  swift_beginAccess();
  return (NSAttributedString *)*v2;
}

- (void)setText:(id)a3
{
}

- (NSAttributedString)label
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VCUIBadgedTextSegmentModel_label);
  swift_beginAccess();
  return (NSAttributedString *)*v2;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)isWhiteSpace
{
  v2 = (BOOL *)self + OBJC_IVAR___VCUIBadgedTextSegmentModel_isWhiteSpace;
  swift_beginAccess();
  return *v2;
}

- (void)setIsWhiteSpace:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___VCUIBadgedTextSegmentModel_isWhiteSpace;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_NSRange)nsRange
{
  swift_beginAccess();
  v3 = self;
  v4 = [(VCUIBadgedTextSegmentModel *)v3 text];
  v5 = [(NSAttributedString *)v4 string];

  sub_261529320();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920A38);
  sub_261523458();
  sub_261520390();
  uint64_t v6 = sub_2615293E0();
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (NSAttributedString)representedText
{
  v2 = self;
  v3 = [(VCUIBadgedTextSegmentModel *)v2 text];
  id v4 = [(VCUIBadgedTextSegmentModel *)v2 nsRange];
  uint64_t v6 = -[NSAttributedString attributedSubstringFromRange:](v3, sel_attributedSubstringFromRange_, v4, v5);

  return v6;
}

- (NSAttributedString)displayedText
{
  v2 = self;
  id v3 = VCUIBadgedTextSegmentModel.displayedText.getter();

  return (NSAttributedString *)v3;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VCUIBadgedTextSegmentModel_label);
}

@end