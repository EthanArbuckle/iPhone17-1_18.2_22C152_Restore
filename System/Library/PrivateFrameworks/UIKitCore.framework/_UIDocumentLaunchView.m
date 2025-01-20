@interface _UIDocumentLaunchView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _UIDocumentLaunchView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)_UIDocumentLaunchView;
  v8 = -[UIView hitTest:withEvent:](&v15, sel_hitTest_withEvent_);
  uint64_t v9 = -[UIView __viewDelegate]((id *)&self->super.super.super.isa);
  v10 = (void *)v9;
  if (v9 && (*(unsigned char *)(v9 + 1096) & 1) != 0)
  {
    if (v8 && (*(void **)(v9 + 1000) == v8 || *(void **)(v9 + 992) == v8))
    {
      v12 = *(void **)(v9 + 984);
      v13 = [(id)v9 view];
      objc_msgSend(v13, "convertPoint:toView:", v10[123], x, y);
      objc_msgSend(v12, "hitTest:withEvent:", a4);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = v8;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end