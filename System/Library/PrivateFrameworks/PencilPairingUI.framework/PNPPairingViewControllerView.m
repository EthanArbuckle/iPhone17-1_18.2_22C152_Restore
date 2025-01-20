@interface PNPPairingViewControllerView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PNPPairingViewControllerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [(PNPPairingViewControllerView *)self subviews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
        uint64_t v14 = objc_msgSend(v13, "hitTest:withEvent:", v7);
        if (v14)
        {
          v15 = (void *)v14;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

@end