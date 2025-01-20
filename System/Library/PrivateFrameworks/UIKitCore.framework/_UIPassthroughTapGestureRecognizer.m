@interface _UIPassthroughTapGestureRecognizer
- (BOOL)tapWasCommandModified;
- (_UIPassthroughTapGestureRecognizer)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIPassthroughTapGestureRecognizer

- (_UIPassthroughTapGestureRecognizer)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"_UIPassthroughTapGestureRecognizer.m", 19, @"%@ does not support NSCoding", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2, self, @"_UIPassthroughTapGestureRecognizer.m", 24, @"%@ does not support NSCoding", objc_opt_class() object file lineNumber description];
}

- (void)setState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPassthroughTapGestureRecognizer;
  -[UIGestureRecognizer setState:](&v5, sel_setState_);
  if (a3 == 3 && (*(unsigned char *)&self->_flags & 1) != 0) {
    self->_tapWasCommandModified = 1;
  }
}

- (void)reset
{
  *(unsigned char *)&self->_flags &= ~1u;
  self->_tapWasCommandModified = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPassthroughTapGestureRecognizer;
  [(UITapGestureRecognizer *)&v5 touchesBegan:a3 withEvent:a4];
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | (([(UIGestureRecognizer *)self modifierFlags] & 0x100000) != 0);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (([(UIGestureRecognizer *)self modifierFlags] & 0x100000) == 0) {
    *(unsigned char *)&self->_flags &= ~1u;
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIPassthroughTapGestureRecognizer;
  [(UITapGestureRecognizer *)&v8 touchesMoved:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (([(UIGestureRecognizer *)self modifierFlags] & 0x100000) == 0) {
    *(unsigned char *)&self->_flags &= ~1u;
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIPassthroughTapGestureRecognizer;
  [(UITapGestureRecognizer *)&v8 touchesEnded:v7 withEvent:v6];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (([(UIGestureRecognizer *)self modifierFlags] & 0x100000) == 0) {
    *(unsigned char *)&self->_flags &= ~1u;
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIPassthroughTapGestureRecognizer;
  [(UITapGestureRecognizer *)&v8 touchesCancelled:v7 withEvent:v6];
}

- (BOOL)tapWasCommandModified
{
  return self->_tapWasCommandModified;
}

@end