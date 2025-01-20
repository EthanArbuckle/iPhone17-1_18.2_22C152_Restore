@interface EllipsisButtonAXAttributesProvider
- (BOOL)axAdjustable;
- (BOOL)axButton;
- (BOOL)axDisabled;
- (BOOL)axHasNonDefaultAttributess;
- (BOOL)axHeading;
- (BOOL)axImage;
- (BOOL)axStaticText;
- (BOOL)axToggle;
- (BOOL)axTouchContainer;
- (BOOL)isAXElement;
- (NSString)axHint;
- (NSString)axIdentifier;
- (NSString)axLabel;
- (NSString)axValue;
- (_TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider)init;
- (void)setAxAdjustable:(BOOL)a3;
- (void)setAxButton:(BOOL)a3;
- (void)setAxDisabled:(BOOL)a3;
- (void)setAxHasNonDefaultAttributess:(BOOL)a3;
- (void)setAxHeading:(BOOL)a3;
- (void)setAxHint:(id)a3;
- (void)setAxIdentifier:(id)a3;
- (void)setAxImage:(BOOL)a3;
- (void)setAxLabel:(id)a3;
- (void)setAxStaticText:(BOOL)a3;
- (void)setAxToggle:(BOOL)a3;
- (void)setAxTouchContainer:(BOOL)a3;
- (void)setAxValue:(id)a3;
- (void)setIsAXElement:(BOOL)a3;
@end

@implementation EllipsisButtonAXAttributesProvider

- (BOOL)axHasNonDefaultAttributess
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axHasNonDefaultAttributess);
}

- (void)setAxHasNonDefaultAttributess:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axHasNonDefaultAttributess) = a3;
}

- (BOOL)axDisabled
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axDisabled);
}

- (void)setAxDisabled:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axDisabled) = a3;
}

- (BOOL)isAXElement
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_isAXElement);
}

- (void)setIsAXElement:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_isAXElement) = a3;
}

- (BOOL)axTouchContainer
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axTouchContainer);
}

- (void)setAxTouchContainer:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axTouchContainer) = a3;
}

- (NSString)axLabel
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axLabel);
}

- (void)setAxLabel:(id)a3
{
}

- (NSString)axValue
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axValue);
}

- (void)setAxValue:(id)a3
{
}

- (NSString)axHint
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axHint);
}

- (void)setAxHint:(id)a3
{
}

- (BOOL)axButton
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axButton);
}

- (void)setAxButton:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axButton) = a3;
}

- (NSString)axIdentifier
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axIdentifier);
}

- (void)setAxIdentifier:(id)a3
{
}

- (BOOL)axImage
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axImage);
}

- (void)setAxImage:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axImage) = a3;
}

- (BOOL)axHeading
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axHeading);
}

- (void)setAxHeading:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axHeading) = a3;
}

- (BOOL)axAdjustable
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axAdjustable);
}

- (void)setAxAdjustable:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axAdjustable) = a3;
}

- (BOOL)axToggle
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axToggle);
}

- (void)setAxToggle:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axToggle) = a3;
}

- (BOOL)axStaticText
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axStaticText);
}

- (void)setAxStaticText:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider_axStaticText) = a3;
}

- (_TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider)init
{
  return (_TtC5BooksP33_634BBAB6B47BDD6BD9B349320160AC7834EllipsisButtonAXAttributesProvider *)sub_100428D10();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end