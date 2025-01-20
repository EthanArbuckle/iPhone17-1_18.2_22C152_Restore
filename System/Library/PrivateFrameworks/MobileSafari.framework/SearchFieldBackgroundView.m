@interface SearchFieldBackgroundView
- (BOOL)isHighlighted;
- (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E125SearchFieldBackgroundView)initWithCoder:(id)a3;
- (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E125SearchFieldBackgroundView)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SearchFieldBackgroundView

- (BOOL)isHighlighted
{
  return sub_18C688940(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for SearchFieldBackgroundView);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E125SearchFieldBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E125SearchFieldBackgroundView *)sub_18C688AAC((char *)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, &OBJC_IVAR____TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E125SearchFieldBackgroundView_isHighlightedDidChange, (uint64_t)CGRectMake, (uint64_t (*)(void))type metadata accessor for SearchFieldBackgroundView);
}

- (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E125SearchFieldBackgroundView)initWithCoder:(id)a3
{
  return (_TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E125SearchFieldBackgroundView *)sub_18C688B64((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12MobileSafariP33_3B1FB7CA3A8DA4948789A16DDC8A49E125SearchFieldBackgroundView_isHighlightedDidChange, (uint64_t)CGRectMake, (uint64_t (*)(void))type metadata accessor for SearchFieldBackgroundView);
}

- (void).cxx_destruct
{
}

@end