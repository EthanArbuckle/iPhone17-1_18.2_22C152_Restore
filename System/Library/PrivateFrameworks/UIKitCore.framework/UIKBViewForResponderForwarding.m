@interface UIKBViewForResponderForwarding
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIView)responderForForwarding;
- (void)setResponderForForwarding:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIKBViewForResponderForwarding

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [(UIView *)self subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
        if (objc_msgSend(v13, "pointInside:withEvent:", v7))
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UIKBViewForResponderForwarding *)self responderForForwarding];

  if (v8)
  {
    uint64_t v9 = [(UIKBViewForResponderForwarding *)self responderForForwarding];
    [v9 touchesBegan:v6 withEvent:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKBViewForResponderForwarding;
    [(UIResponder *)&v10 touchesBegan:v6 withEvent:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UIKBViewForResponderForwarding *)self responderForForwarding];

  if (v8)
  {
    uint64_t v9 = [(UIKBViewForResponderForwarding *)self responderForForwarding];
    [v9 touchesEnded:v6 withEvent:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKBViewForResponderForwarding;
    [(UIResponder *)&v10 touchesEnded:v6 withEvent:v7];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UIKBViewForResponderForwarding *)self responderForForwarding];

  if (v8)
  {
    uint64_t v9 = [(UIKBViewForResponderForwarding *)self responderForForwarding];
    [v9 touchesCancelled:v6 withEvent:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKBViewForResponderForwarding;
    [(UIResponder *)&v10 touchesCancelled:v6 withEvent:v7];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UIKBViewForResponderForwarding *)self responderForForwarding];

  if (v8)
  {
    uint64_t v9 = [(UIKBViewForResponderForwarding *)self responderForForwarding];
    [v9 touchesMoved:v6 withEvent:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKBViewForResponderForwarding;
    [(UIResponder *)&v10 touchesMoved:v6 withEvent:v7];
  }
}

- (UIView)responderForForwarding
{
  return self->_responderForForwarding;
}

- (void)setResponderForForwarding:(id)a3
{
}

- (void).cxx_destruct
{
}

@end