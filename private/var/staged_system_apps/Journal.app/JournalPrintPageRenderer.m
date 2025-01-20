@interface JournalPrintPageRenderer
- (CGRect)printableRect;
- (_TtC7Journal24JournalPrintPageRenderer)init;
@end

@implementation JournalPrintPageRenderer

- (CGRect)printableRect
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for JournalPrintPageRenderer();
  id v2 = v11.receiver;
  [(JournalPrintPageRenderer *)&v11 printableRect];
  CGRect v13 = CGRectInset(v12, 32.0, 32.0);
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;

  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (_TtC7Journal24JournalPrintPageRenderer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JournalPrintPageRenderer();
  return [(JournalPrintPageRenderer *)&v3 init];
}

@end