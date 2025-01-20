@interface SUHitTestView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)addHitTestTarget:(id)a3;
- (void)dealloc;
- (void)removeHitTestTarget:(id)a3;
@end

@implementation SUHitTestView

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUHitTestView;
  [(SUHitTestView *)&v3 dealloc];
}

- (void)addHitTestTarget:(id)a3
{
  hitTestTargets = self->_hitTestTargets;
  if (!hitTestTargets)
  {
    hitTestTargets = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_hitTestTargets = hitTestTargets;
  }

  [(NSMutableArray *)hitTestTargets addObject:a3];
}

- (void)removeHitTestTarget:(id)a3
{
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  hitTestTargets = self->_hitTestTargets;
  uint64_t v9 = [(NSMutableArray *)hitTestTargets countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(hitTestTargets);
      }
      v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
      objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
      id result = (id)objc_msgSend(v13, "hitTest:withEvent:", a4);
      if (result) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableArray *)hitTestTargets countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v15.receiver = self;
    v15.super_class = (Class)SUHitTestView;
    return -[SUHitTestView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, a4, x, y);
  }
  return result;
}

@end