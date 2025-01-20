@interface TSWTableView
- (BOOL)ignoresEventsOutsideCells;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setIgnoresEventsOutsideCells:(BOOL)a3;
@end

@implementation TSWTableView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)TSWTableView;
  v5 = -[TSWTableView hitTest:withEvent:](&v17, "hitTest:withEvent:", a4, a3.x, a3.y);
  if (!objc_msgSend(-[TSWTableView subviews](self, "subviews"), "firstObject")) {
    goto LABEL_4;
  }
  objc_msgSend(objc_msgSend(-[TSWTableView subviews](self, "subviews"), "firstObject"), "bounds");
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(TSWTableView *)self bounds];
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  if (CGRectEqualToRect(v18, v19)) {
    v14 = [-[TSWTableView subviews](self, "subviews") firstObject];
  }
  else {
LABEL_4:
  }
    v14 = 0;
  if ([(TSWTableView *)self ignoresEventsOutsideCells])
  {
    if (v5 == self || v5 == v14) {
      return 0;
    }
  }
  return v5;
}

- (BOOL)ignoresEventsOutsideCells
{
  return self->mIgnoresEventsOutsideCells;
}

- (void)setIgnoresEventsOutsideCells:(BOOL)a3
{
  self->mIgnoresEventsOutsideCells = a3;
}

@end