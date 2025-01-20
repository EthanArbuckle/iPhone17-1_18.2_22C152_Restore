@interface ICTagCell
+ (UIFont)font;
+ (double)textLabelHorizontalPadding;
+ (void)newTagImage;
- (BOOL)hasGroupInset;
- (BOOL)includeSymbolPrefix;
- (BOOL)isExcluded;
- (BOOL)isNewTagCell;
- (BOOL)isPreviewing;
- (ICItemIdentifier)identifier;
- (ICTagCell)initWithCoder:(id)a3;
- (ICTagCell)initWithFrame:(CGRect)a3;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (NSString)displayText;
- (UICellConfigurationState)_bridgedConfigurationState;
- (UIImage)displayImage;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)layoutSubviews;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setDisplayImage:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setDisplayText:(id)a3 includeSymbolPrefix:(BOOL)a4 hasGroupInset:(BOOL)a5;
- (void)setHasGroupInset:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIncludeSymbolPrefix:(BOOL)a3;
- (void)setIsExcluded:(BOOL)a3;
- (void)setIsPreviewing:(BOOL)a3;
- (void)updateColors;
- (void)updateWidthConstraints;
@end

@implementation ICTagCell

- (NSString)displayText
{
  if (*(void *)&self->displayText[OBJC_IVAR___ICTagCell_displayText])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setDisplayText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICTagCell_displayText);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (BOOL)includeSymbolPrefix
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_includeSymbolPrefix);
}

- (void)setIncludeSymbolPrefix:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_includeSymbolPrefix) = a3;
}

- (UIImage)displayImage
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR___ICTagCell_displayImage));
}

- (void)setDisplayImage:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_100477998(a3);
}

- (BOOL)hasGroupInset
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_hasGroupInset);
}

- (void)setHasGroupInset:(BOOL)a3
{
}

+ (UIFont)font
{
  result = [self ic_preferredFontForStyle:UIFontTextStyleSubheadline symbolicTraits:2];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  v3 = result;
  id v4 = [(UIFont *)result ic_fontWithSingleLineA];

  if (!v4)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  return (UIFont *)v4;
}

- (BOOL)isPreviewing
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_isPreviewing);
}

- (void)setIsPreviewing:(BOOL)a3
{
}

+ (double)textLabelHorizontalPadding
{
  return 12.0;
}

- (ICItemIdentifier)identifier
{
  NSString v2 = (void *)swift_unknownObjectRetain();

  return (ICItemIdentifier *)v2;
}

- (void)setIdentifier:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_identifier) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (BOOL)isNewTagCell
{
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_identifier))
  {
    self;
    NSString v2 = (void *)swift_dynamicCastObjCClass();
    if (v2) {
      swift_unknownObjectRetain();
    }
  }
  else
  {
    NSString v2 = 0;
  }

  return v2 != 0;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_100475AD4(self, (uint64_t)a2, (void (*)(void))TagCell.accessibilityLabel.getter);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_100475AD4(self, (uint64_t)a2, (void (*)(void))TagCell.accessibilityValue.getter);
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v2 = v8.receiver;
  unint64_t v3 = [(ICTagCell *)&v8 accessibilityTraits];
  UIAccessibilityTraits v4 = UIAccessibilityTraitButton;
  if ((UIAccessibilityTraitButton & ~v3) == 0) {
    UIAccessibilityTraits v4 = 0;
  }
  unint64_t v5 = v4 | v3;
  if (*((unsigned char *)v2 + OBJC_IVAR___ICTagCell_isExcluded) == 1)
  {
    UIAccessibilityTraits v6 = UIAccessibilityTraitSelected;

    v5 &= ~v6;
  }
  else
  {
  }
  return v5;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(ICTagCell *)&v4 setAccessibilityTraits:a3];
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_100475AD4(self, (uint64_t)a2, (void (*)(void))TagCell.accessibilityHint.getter);
}

- (BOOL)isExcluded
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_isExcluded);
}

- (void)setIsExcluded:(BOOL)a3
{
}

- (ICTagCell)initWithFrame:(CGRect)a3
{
  return (ICTagCell *)TagCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ICTagCell)initWithCoder:(id)a3
{
  return (ICTagCell *)TagCell.init(coder:)(a3);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ICTagCell *)&v3 layoutSubviews];
  sub_100474B60();
}

- (void)setDisplayText:(id)a3 includeSymbolPrefix:(BOOL)a4 hasGroupInset:(BOOL)a5
{
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  v11 = self;
  sub_1004748FC(v8, v10, a4, a5);

  swift_bridgeObjectRelease();
}

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3 = type metadata accessor for UICellConfigurationState();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  UIAccessibilityTraits v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  TagCell.configurationState.getter();

  v8.super.super.isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (UICellConfigurationState *)v8.super.super.isa;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  UICellConfigurationState v8 = self;
  TagCell.updateConfiguration(using:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = a3;
  v7 = self;
  sub_100474B60();
  v10.receiver = v7;
  v10.super_class = ObjectType;
  id v8 = [(ICTagCell *)&v10 preferredLayoutAttributesFittingAttributes:v6];

  return v8;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_100476AE8();

  sub_10002B754((uint64_t)v6, &qword_10069B4D0);
}

- (void)updateColors
{
  id v2 = self;
  sub_100474ED8();
}

- (void)updateWidthConstraints
{
  id v2 = self;
  sub_100474B60();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagCell_unemphasizedBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagCell_excludedBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagCell____lazy_storage___imageViewBackgroundColor));

  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_minWidthConstraint);
}

+ (void)newTagImage
{
  id v0 = [self ic_preferredFontForStyle:UIFontTextStyleSubheadline symbolicTraits:2];
  if (v0)
  {
    v1 = v0;
    id v2 = [v0 ic_fontWithSingleLineA];

    if (v2)
    {
      id v3 = [self configurationWithFont:v2 scale:2];

      id v4 = v3;
      NSString v5 = String._bridgeToObjectiveC()();
      [self systemImageNamed:v5 withConfiguration:v4];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

@end