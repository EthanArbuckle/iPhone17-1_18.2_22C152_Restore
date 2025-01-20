@interface SearchField
- (BOOL)isHighlighted;
- (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField)initWithCoder:(id)a3;
- (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField)initWithFrame:(CGRect)a3;
- (id)_placeholderColor;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SearchField

- (BOOL)isHighlighted
{
  return sub_18C688940(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for SearchField);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (id)_placeholderColor
{
  id v2 = objc_msgSend(self, sel_secondaryLabelColor);

  return v2;
}

- (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField *)sub_18C688AAC((char *)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, &OBJC_IVAR____TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField_isHighlightedDidChange, (uint64_t)CGRectMake, (uint64_t (*)(void))type metadata accessor for SearchField);
}

- (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField)initWithCoder:(id)a3
{
  return (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField *)sub_18C688B64((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E111SearchField_isHighlightedDidChange, (uint64_t)CGRectMake, (uint64_t (*)(void))type metadata accessor for SearchField);
}

- (void).cxx_destruct
{
}

@end