@interface TSWPLongPressGestureRecognizer
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation TSWPLongPressGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPLongPressGestureRecognizer;
  -[TSWPLongPressGestureRecognizer touchesBegan:withEvent:](&v6, sel_touchesBegan_withEvent_, a3);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "allTouches"), "count") >= 2) {
    [(TSWPLongPressGestureRecognizer *)self setState:5];
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPLongPressGestureRecognizer;
  [(TSWPLongPressGestureRecognizer *)&v3 reset];
  [(TSWPLongPressGestureRecognizer *)self delegate];
  [(id)TSUProtocolCast() didReset:self];
}

@end