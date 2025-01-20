@interface _UIRemoteView
+ (BOOL)_requiresWindowTouches;
+ (_UIRemoteView)viewWithHostedWindowHostingHandle:(id)a3;
- (Class)_intelligenceBaseClass;
- (_UIHostedWindowHostingHandle)hostedWindowHostingHandle;
- (_UIRemoteView)initWithFrame:(CGRect)a3 pid:(int)a4 contextID:(unsigned int)a5;
- (_UIRemoteViewController)remoteViewController;
- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5;
- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4;
- (void)_intelligenceCollectRemoteContentIn:(CGRect)a3 remoteContextWrapper:(id)a4;
- (void)_setInheritsSecurity:(BOOL)a3;
- (void)applyTransformUndoingRemoteRootLayerTransform:(CGAffineTransform *)a3 frame:(CGRect)a4;
- (void)setHostedWindowHostingHandle:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)tintColorDidChange;
@end

@implementation _UIRemoteView

- (Class)_intelligenceBaseClass
{
  sub_18598EBFC();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = self;
  _UIRemoteView._intelligenceCollectContent(in:collector:)((uint64_t)v9, x, y, width, height);
}

- (void)_intelligenceCollectRemoteContentIn:(CGRect)a3 remoteContextWrapper:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = (_UIRemoteView *)a4;
  v12 = self;
  v10 = [(_UIRemoteView *)v12 remoteViewController];
  if (v10)
  {
    v11 = (_UIRemoteView *)v10;
    -[_UIRemoteViewController _intelligenceCollectRemoteContentInVisibleRect:withRemoteContextWrapper:](v10, sel__intelligenceCollectRemoteContentInVisibleRect_withRemoteContextWrapper_, v9, x, y, width, height);

    id v9 = v12;
    v12 = v11;
  }
}

+ (BOOL)_requiresWindowTouches
{
  return 1;
}

+ (_UIRemoteView)viewWithHostedWindowHostingHandle:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc((Class)a1);
  uint64_t v7 = [v5 pid];
  uint64_t v8 = [v5 contextID];
  uint64_t v9 = objc_msgSend(v6, "initWithFrame:pid:contextID:", v7, v8, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = (void *)v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 424), a3);
    if (v5)
    {
      [v5 rootLayerTransform];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v13 = 0u;
    }
    objc_msgSend(v5, "rootLayerFrame", v13, v14, v15);
    objc_msgSend(v10, "applyTransformUndoingRemoteRootLayerTransform:frame:", &v13);
    [v10 setUserInteractionEnabled:0];
    id v11 = v10;
  }

  return (_UIRemoteView *)v10;
}

- (_UIRemoteView)initWithFrame:(CGRect)a3 pid:(int)a4 contextID:(unsigned int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_UIRemoteView;
  id v5 = -[_UILayerHostView initWithFrame:pid:contextID:](&v9, sel_initWithFrame_pid_contextID_, *(void *)&a4, *(void *)&a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(UIView *)v5 layer];
    [v7 setInheritsTiming:0];
  }
  return v6;
}

- (void)setHostedWindowHostingHandle:(id)a3
{
  id v5 = (_UIHostedWindowHostingHandle *)a3;
  if (self->_hostedWindowHostingHandle != v5)
  {
    objc_storeStrong((id *)&self->_hostedWindowHostingHandle, a3);
    [(_UILayerHostView *)self setPid:[(_UIHostedWindowHostingHandle *)self->_hostedWindowHostingHandle pid] contextID:[(_UIHostedWindowHostingHandle *)self->_hostedWindowHostingHandle contextID]];
    if (v5)
    {
      [(_UIHostedWindowHostingHandle *)v5 rootLayerTransform];
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
      long long v6 = 0u;
    }
    [(_UIHostedWindowHostingHandle *)v5 rootLayerFrame];
    -[_UIRemoteView applyTransformUndoingRemoteRootLayerTransform:frame:](self, "applyTransformUndoingRemoteRootLayerTransform:frame:", &v6);
  }
}

- (void)applyTransformUndoingRemoteRootLayerTransform:(CGAffineTransform *)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(UIView *)self frame];
  double v11 = v10;
  double v13 = v12;
  long long v14 = [(UIView *)self layer];
  long long v15 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v16.c = v15;
  *(_OWORD *)&v16.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformInvert(&v17, &v16);
  [v14 setAffineTransform:&v17];

  -[UIView setBounds:](self, "setBounds:", x, y, width, height);
  [(UIView *)self frame];
  -[UIView setFrame:](self, "setFrame:", v11, v13);
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  if ([(id)objc_opt_class() _requiresWindowTouches])
  {
    id v11 = [(UIView *)self window];
    if (v11 == v10) {
      double v12 = self;
    }
    else {
      double v12 = 0;
    }
    double v13 = v12;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_UIRemoteView;
    -[UIView _hitTest:withEvent:windowServerHitTestWindow:](&v15, sel__hitTest_withEvent_windowServerHitTestWindow_, v9, v10, x, y);
    double v13 = (_UIRemoteView *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)_UIRemoteView;
  [(UIView *)&v4 tintColorDidChange];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  [WeakRetained _updateTintColor];
}

- (void)_setInheritsSecurity:(BOOL)a3
{
  BOOL v3 = a3;
  -[_UILayerHostView setInheritsSecurity:](self, "setInheritsSecurity:");
  if (v3)
  {
    id v5 = [(UIView *)self layer];
    [v5 setSecurityMode:*MEMORY[0x1E4F3A448]];
  }
}

- (_UIHostedWindowHostingHandle)hostedWindowHostingHandle
{
  return self->_hostedWindowHostingHandle;
}

- (_UIRemoteViewController)remoteViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  return (_UIRemoteViewController *)WeakRetained;
}

- (void)setRemoteViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteViewController);
  objc_storeStrong((id *)&self->_hostedWindowHostingHandle, 0);
}

@end