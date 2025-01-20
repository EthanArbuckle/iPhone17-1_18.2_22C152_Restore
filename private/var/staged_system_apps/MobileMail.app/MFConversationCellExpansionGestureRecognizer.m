@interface MFConversationCellExpansionGestureRecognizer
- (MFConversationCellExpansionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)cancel;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation MFConversationCellExpansionGestureRecognizer

- (MFConversationCellExpansionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFConversationCellExpansionGestureRecognizer;
  v7 = [(MFConversationCellExpansionGestureRecognizer *)&v10 initWithTarget:v6 action:a4];
  v8 = v7;
  if (v7) {
    [(MFConversationCellExpansionGestureRecognizer *)v7 setCancelsTouchesInView:0];
  }

  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)cancel
{
  [(MFConversationCellExpansionGestureRecognizer *)self setEnabled:0];

  [(MFConversationCellExpansionGestureRecognizer *)self setEnabled:1];
}

@end