@interface SXGradientView
+ (Class)layerClass;
- (SXGradient)gradient;
- (SXGradientView)initWithGradient:(id)a3;
@end

@implementation SXGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SXGradientView)initWithGradient:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SXGradientView;
  v6 = -[SXGradientView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gradient, a3);
    v8 = [(SXGradientView *)v7 layer];
    [v5 startPoint];
    objc_msgSend(v8, "setStartPoint:");
    [v5 endPoint];
    objc_msgSend(v8, "setEndPoint:");
    v9 = [MEMORY[0x263EFF980] array];
    v10 = [(SXGradientView *)v7 gradient];
    v11 = [v10 colors];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __35__SXGradientView_initWithGradient___block_invoke;
    v15[3] = &unk_2646521B8;
    id v16 = v9;
    id v12 = v9;
    [v11 enumerateObjectsUsingBlock:v15];

    [v8 setColors:v12];
    v13 = [v5 locations];
    [v8 setLocations:v13];
  }
  return v7;
}

uint64_t __35__SXGradientView_initWithGradient___block_invoke(uint64_t a1, id a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 CGColor];
  return [v2 addObject:v3];
}

- (SXGradient)gradient
{
  return self->_gradient;
}

- (void).cxx_destruct
{
}

@end