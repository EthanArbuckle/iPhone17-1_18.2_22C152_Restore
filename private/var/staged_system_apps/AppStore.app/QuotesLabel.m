@interface QuotesLabel
- (_TtC8AppStoreP33_29EE9522A5DC5D80B942784E0C6042DE11QuotesLabel)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_29EE9522A5DC5D80B942784E0C6042DE11QuotesLabel)initWithFrame:(CGRect)a3;
@end

@implementation QuotesLabel

- (_TtC8AppStoreP33_29EE9522A5DC5D80B942784E0C6042DE11QuotesLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for QuotesLabel();
  return -[QuotesLabel initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8AppStoreP33_29EE9522A5DC5D80B942784E0C6042DE11QuotesLabel)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for QuotesLabel();
  return [(QuotesLabel *)&v5 initWithCoder:a3];
}

@end