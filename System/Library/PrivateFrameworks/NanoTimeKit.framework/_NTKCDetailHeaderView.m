@interface _NTKCDetailHeaderView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSArray)interactableSubviews;
- (void)setInteractableSubviews:(id)a3;
@end

@implementation _NTKCDetailHeaderView

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
  v8 = self->_interactableSubviews;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        -[_NTKCDetailHeaderView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y, (void)v16);
        if (objc_msgSend(v13, "pointInside:withEvent:", v7))
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
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

- (NSArray)interactableSubviews
{
  return self->_interactableSubviews;
}

- (void)setInteractableSubviews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end