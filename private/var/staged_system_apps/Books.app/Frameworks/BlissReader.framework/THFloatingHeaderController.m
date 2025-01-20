@interface THFloatingHeaderController
- (NSMutableArray)headersData;
- (THFloatingHeaderControllerProtocol)delegate;
- (UITableView)tableView;
- (UIView)headersView;
- (void)dealloc;
- (void)layoutHeaders;
- (void)reloadData;
- (void)setDelegate:(id)a3;
- (void)setHeaderHidden:(BOOL)a3;
- (void)setHeadersData:(id)a3;
- (void)setHeadersView:(id)a3;
- (void)setTableView:(id)a3;
@end

@implementation THFloatingHeaderController

- (void)dealloc
{
  self->_headersData = 0;
  self->_headersView = 0;
  v3.receiver = self;
  v3.super_class = (Class)THFloatingHeaderController;
  [(THFloatingHeaderController *)&v3 dealloc];
}

- (void)reloadData
{
  if ([(THFloatingHeaderController *)self headersData])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    objc_super v3 = [(THFloatingHeaderController *)self headersData];
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v28;
      do
      {
        v7 = 0;
        do
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v7), "valueForKey:", @"layer"), "removeFromSuperlayer");
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v5);
    }
    [(NSMutableArray *)[(THFloatingHeaderController *)self headersData] removeAllObjects];
  }
  else
  {
    [(THFloatingHeaderController *)self setHeadersData:+[NSMutableArray array]];
    id v8 = [(UITableView *)[(THFloatingHeaderController *)self tableView] superview];
    id v9 = [v8 safeAreaLayoutGuide];
    id v10 = objc_alloc((Class)UIView);
    [(UITableView *)[(THFloatingHeaderController *)self tableView] frame];
    [self setHeadersView:[v10 initWithFrame:]];
    [(UIView *)[(THFloatingHeaderController *)self headersView] setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)[(THFloatingHeaderController *)self headersView] setBackgroundColor:+[UIColor clearColor]];
    [(UIView *)[(THFloatingHeaderController *)self headersView] setClipsToBounds:1];
    [(UIView *)[(THFloatingHeaderController *)self headersView] setUserInteractionEnabled:0];
    [v8 addSubview:[self headersView]];
    v35[0] = [(NSLayoutYAxisAnchor *)[(UIView *)[(THFloatingHeaderController *)self headersView] topAnchor] constraintEqualToAnchor:[(UITableView *)[(THFloatingHeaderController *)self tableView] topAnchor]];
    v35[1] = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](-[UIView bottomAnchor](-[THFloatingHeaderController headersView](self, "headersView"), "bottomAnchor"), "constraintEqualToAnchor:", [v8 bottomAnchor]);
    v35[2] = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](-[UIView leadingAnchor](-[THFloatingHeaderController headersView](self, "headersView"), "leadingAnchor"), "constraintEqualToAnchor:", [v9 leadingAnchor]);
    v35[3] = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](-[UIView trailingAnchor](-[THFloatingHeaderController headersView](self, "headersView"), "trailingAnchor"), "constraintEqualToAnchor:", [v9 trailingAnchor]);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:v35 count:4]);
    if ([(UITableView *)[(THFloatingHeaderController *)self tableView] _shouldReverseLayoutDirection])
    {
      long long v11 = *(_OWORD *)&CATransform3DIdentity.m33;
      *(_OWORD *)&v32.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
      *(_OWORD *)&v32.m33 = v11;
      long long v12 = *(_OWORD *)&CATransform3DIdentity.m43;
      *(_OWORD *)&v32.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
      *(_OWORD *)&v32.m43 = v12;
      long long v13 = *(_OWORD *)&CATransform3DIdentity.m13;
      *(_OWORD *)&v32.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
      *(_OWORD *)&v32.m13 = v13;
      long long v14 = *(_OWORD *)&CATransform3DIdentity.m23;
      *(_OWORD *)&v32.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
      *(_OWORD *)&v32.m23 = v14;
      CATransform3DScale(&v33, &v32, -1.0, 1.0, 1.0);
      v15 = [(UIView *)[(THFloatingHeaderController *)self headersView] layer];
      CATransform3D v31 = v33;
      [(CALayer *)v15 setSublayerTransform:&v31];
    }
  }
  v16 = (char *)[(THFloatingHeaderControllerProtocol *)[(THFloatingHeaderController *)self delegate] numberOfFloatingHeaders:self];
  if (v16)
  {
    v17 = v16;
    for (i = 0; i != v17; ++i)
    {
      id v19 = +[NSMutableDictionary dictionary];
      id v20 = [(THFloatingHeaderControllerProtocol *)[(THFloatingHeaderController *)self delegate] layerForFloatingHeaderAtIndex:i forController:self];
      id v21 = [(THFloatingHeaderControllerProtocol *)[(THFloatingHeaderController *)self delegate] rowNumberForFloatingHeaderAtIndex:i forController:self];
      id v22 = [(THFloatingHeaderControllerProtocol *)[(THFloatingHeaderController *)self delegate] numberOfRowsForFloatingHeaderAtIndex:i forController:self];
      [(CALayer *)[(UIView *)[(THFloatingHeaderController *)self headersView] layer] addSublayer:v20];
      [v19 setValue:v20 forKey:@"layer"];
      [(UITableView *)[(THFloatingHeaderController *)self tableView] rowHeight];
      double v24 = v23 * (double)(unint64_t)v21;
      *(float *)&double v24 = v24;
      [v19 setValue:[NSNumber numberWithFloat:v24] forKey:@"miny"];
      [(UITableView *)[(THFloatingHeaderController *)self tableView] rowHeight];
      double v26 = v25 * (double)((unint64_t)v22 + (void)v21 - 1);
      *(float *)&double v26 = v26;
      [v19 setValue:[NSNumber numberWithFloat:v26] forKey:@"maxy"];
      [(NSMutableArray *)[(THFloatingHeaderController *)self headersData] addObject:v19];
    }
  }
  [(THFloatingHeaderController *)self layoutHeaders];
}

- (void)layoutHeaders
{
  [(UITableView *)[(THFloatingHeaderController *)self tableView] contentOffset];
  double v4 = v3;
  [(UITableView *)[(THFloatingHeaderController *)self tableView] contentSize];
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(THFloatingHeaderController *)self headersData];
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(objc_msgSend(v10, "valueForKey:", @"miny"), "floatValue");
        double v12 = v11;
        objc_msgSend(objc_msgSend(v10, "valueForKey:", @"maxy"), "floatValue");
        double v14 = v12 - v4;
        double v15 = v13 - v4;
        if (v12 - v4 > 0.0)
        {
          BOOL v16 = 1;
        }
        else
        {
          double v14 = v15;
          BOOL v16 = v15 <= 0.0;
        }
        if (v16) {
          double v17 = v14;
        }
        else {
          double v17 = 0.0;
        }
        id v18 = [v10 valueForKey:@"layer"];
        [v18 setPosition:0.0 v17];
        [v18 removeAllAnimations];
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  +[CATransaction commit];
}

- (void)setHeaderHidden:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = [(THFloatingHeaderController *)self headersView];

  [(UIView *)v4 setHidden:v3];
}

- (THFloatingHeaderControllerProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THFloatingHeaderControllerProtocol *)a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  self->_tableView = (UITableView *)a3;
}

- (NSMutableArray)headersData
{
  return self->_headersData;
}

- (void)setHeadersData:(id)a3
{
}

- (UIView)headersView
{
  return self->_headersView;
}

- (void)setHeadersView:(id)a3
{
}

@end