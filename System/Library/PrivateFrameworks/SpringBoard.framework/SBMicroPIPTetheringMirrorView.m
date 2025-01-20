@interface SBMicroPIPTetheringMirrorView
- (SBMicroPIPTetheringMirrorView)initWithFrame:(CGRect)a3;
- (UIView)contentPlaceholderView;
@end

@implementation SBMicroPIPTetheringMirrorView

- (SBMicroPIPTetheringMirrorView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SBMicroPIPTetheringMirrorView;
  v3 = -[SBMicroPIPTetheringMirrorView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SBMicroPIPTetheringMirrorContentPlaceholderView alloc];
    [(SBMicroPIPTetheringMirrorView *)v3 bounds];
    uint64_t v5 = -[SBMicroPIPTetheringMirrorContentPlaceholderView initWithFrame:](v4, "initWithFrame:");
    contentPlaceholderView = v3->_contentPlaceholderView;
    v3->_contentPlaceholderView = (SBMicroPIPTetheringMirrorContentPlaceholderView *)v5;

    v7 = [(SBMicroPIPTetheringMirrorContentPlaceholderView *)v3->_contentPlaceholderView layer];
    objc_msgSend(v7, "setAnchorPoint:", 1.0, 1.0);

    -[SBMicroPIPTetheringMirrorContentPlaceholderView setCenter:](v3->_contentPlaceholderView, "setCenter:", 4.0, 4.0);
    [(SBMicroPIPTetheringMirrorContentPlaceholderView *)v3->_contentPlaceholderView setAutoresizingMask:36];
    v8 = v3->_contentPlaceholderView;
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v16.a = *MEMORY[0x1E4F1DAB8];
    long long v13 = *(_OWORD *)&v16.a;
    *(_OWORD *)&v16.c = v14;
    *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v12 = *(_OWORD *)&v16.tx;
    CGAffineTransformScale(&v17, &v16, -1.0, -1.0);
    [(SBMicroPIPTetheringMirrorContentPlaceholderView *)v8 setTransform:&v17];
    v9 = [SBMicroPIPTetheringMirrorContentPlaceholderContainerView alloc];
    [(SBMicroPIPTetheringMirrorView *)v3 bounds];
    v10 = -[SBMicroPIPTetheringMirrorContentPlaceholderContainerView initWithFrame:](v9, "initWithFrame:");
    *(_OWORD *)&v16.a = v13;
    *(_OWORD *)&v16.c = v14;
    *(_OWORD *)&v16.tx = v12;
    CGAffineTransformScale(&v15, &v16, -1.0, -1.0);
    [(SBMicroPIPTetheringMirrorContentPlaceholderContainerView *)v10 setTransform:&v15];
    [(SBMicroPIPTetheringMirrorContentPlaceholderContainerView *)v10 setAutoresizingMask:18];
    [(SBMicroPIPTetheringMirrorContentPlaceholderContainerView *)v10 addSubview:v3->_contentPlaceholderView];
    [(SBMicroPIPTetheringMirrorView *)v3 addSubview:v10];
  }
  return v3;
}

- (UIView)contentPlaceholderView
{
  return (UIView *)self->_contentPlaceholderView;
}

- (void).cxx_destruct
{
}

@end