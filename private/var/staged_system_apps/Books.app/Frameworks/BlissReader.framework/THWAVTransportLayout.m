@interface THWAVTransportLayout
- (Class)repClassOverride;
- (THWAVTransportController)transportController;
- (id)computeLayoutGeometry;
- (void)dealloc;
- (void)layoutTransportUI;
- (void)parentDidChange;
- (void)setTransportController:(id)a3;
- (void)validate;
@end

@implementation THWAVTransportLayout

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)THWAVTransportLayout;
  [(THWAVTransportLayout *)&v2 dealloc];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)computeLayoutGeometry
{
  id v3 = objc_alloc((Class)TSDLayoutGeometry);
  [self parent].frame;
  double v5 = v4;
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v9[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v9[1] = v6;
  v9[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return [v3 initWithSize:v9 transform:v7];
}

- (void)parentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportLayout;
  [(THWAVTransportLayout *)&v3 parentDidChange];
  if ([(THWAVTransportLayout *)self parent]) {
    [(THWAVTransportController *)[(THWAVTransportLayout *)self transportController] wasAddedToCanvas];
  }
}

- (void)validate
{
  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportLayout;
  [(THWAVTransportLayout *)&v3 validate];
  [(THWAVTransportLayout *)self layoutTransportUI];
}

- (void)layoutTransportUI
{
  if ([(THWAVTransportController *)[(THWAVTransportLayout *)self transportController] transportUI])
  {
    id v3 = [[self layoutController] canvas];
    [(THWAVTransportLayout *)self frameInRoot];
    [v3 convertUnscaledToBoundsRect:];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(THWAVTransportUI *)[(THWAVTransportController *)[(THWAVTransportLayout *)self transportController] transportUI] layoutRect];
    v19.origin.x = v12;
    v19.origin.y = v13;
    v19.size.width = v14;
    v19.size.height = v15;
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    if (!CGRectEqualToRect(v18, v19))
    {
      -[THWAVTransportUI setLayoutRect:]([(THWAVTransportController *)[(THWAVTransportLayout *)self transportController] transportUI], "setLayoutRect:", v5, v7, v9, v11);
      [(THWAVTransportUI *)[(THWAVTransportController *)[(THWAVTransportLayout *)self transportController] transportUI] willLayout];
      [(THWAVTransportUI *)[(THWAVTransportController *)[(THWAVTransportLayout *)self transportController] transportUI] layout];
      v16 = [(THWAVTransportController *)[(THWAVTransportLayout *)self transportController] transportUI];
      [(THWAVTransportUI *)v16 didLayout];
    }
  }
}

- (THWAVTransportController)transportController
{
  return self->_transportController;
}

- (void)setTransportController:(id)a3
{
  self->_transportController = (THWAVTransportController *)a3;
}

@end