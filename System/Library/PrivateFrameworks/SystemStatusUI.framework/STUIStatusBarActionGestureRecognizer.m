@interface STUIStatusBarActionGestureRecognizer
- (BOOL)highlighted;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation STUIStatusBarActionGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[STUIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 1, a4);
  [(STUIStatusBarActionGestureRecognizer *)self setState:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ((unint64_t)[v10 count] < 2)
  {
    v7 = [v10 anyObject];
    v8 = [(STUIStatusBarActionGestureRecognizer *)self view];
    v9 = [(STUIStatusBarActionGestureRecognizer *)self view];
    [v7 locationInView:v9];
    -[STUIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", objc_msgSend(v8, "pointInside:withEvent:", v6));
  }
  else
  {
    [(STUIStatusBarActionGestureRecognizer *)self setHighlighted:0];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(STUIStatusBarActionGestureRecognizer *)self highlighted]) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 5;
  }
  [(STUIStatusBarActionGestureRecognizer *)self setState:v5];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[STUIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 0, a4);
  [(STUIStatusBarActionGestureRecognizer *)self setState:4];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "type", (void)v10) == 4)
        {
          [(STUIStatusBarActionGestureRecognizer *)self setHighlighted:1];
          [(STUIStatusBarActionGestureRecognizer *)self setState:1];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "type", (void)v11) == 4)
        {
          if ([(STUIStatusBarActionGestureRecognizer *)self highlighted]) {
            uint64_t v10 = 3;
          }
          else {
            uint64_t v10 = 5;
          }
          [(STUIStatusBarActionGestureRecognizer *)self setState:v10];
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  -[STUIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 0, a4);
  [(STUIStatusBarActionGestureRecognizer *)self setState:4];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if ([(STUIStatusBarActionGestureRecognizer *)self state] >= 1)
    {
      [(STUIStatusBarActionGestureRecognizer *)self setState:2];
    }
  }
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

@end