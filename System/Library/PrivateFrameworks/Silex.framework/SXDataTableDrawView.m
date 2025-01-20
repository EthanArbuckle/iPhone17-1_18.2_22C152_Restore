@interface SXDataTableDrawView
- (SXDataTableDrawView)initWithFrame:(CGRect)a3;
- (uint64_t)drawBlocks;
- (void)drawRect:(CGRect)a3;
@end

@implementation SXDataTableDrawView

- (SXDataTableDrawView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SXDataTableDrawView;
  v3 = -[SXDataTableDrawView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    drawBlocks = v3->_drawBlocks;
    v3->_drawBlocks = (NSMutableArray *)v4;

    v6 = [MEMORY[0x263F1C550] clearColor];
    [(SXDataTableDrawView *)v3 setBackgroundColor:v6];
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)SXDataTableDrawView;
  -[SXDataTableDrawView drawRect:](&v22, sel_drawRect_);
  CurrentContext = UIGraphicsGetCurrentContext();
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGContextClearRect(CurrentContext, v25);
  if (self)
  {
    v9 = self->_drawBlocks;
    if (v9)
    {
      v10 = v9;
      uint64_t v11 = [(NSMutableArray *)self->_drawBlocks count];

      if (v11)
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        v12 = self->_drawBlocks;
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v19;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v19 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * v16);
              [(SXDataTableDrawView *)self frame];
              (*(void (**)(uint64_t, CGContext *))(v17 + 16))(v17, CurrentContext);
              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
          }
          while (v14);
        }
      }
    }
  }
}

- (uint64_t)drawBlocks
{
  if (result) {
    return *(void *)(result + 408);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end