@interface TUIScrollAnchor
- (TUILogicalScrollAnchor)anchor;
- (TUIScrollAnchor)initWithAnchor:(id)a3 relativeDistance:(double)a4;
- (double)relativeDistance;
- (id)description;
@end

@implementation TUIScrollAnchor

- (TUIScrollAnchor)initWithAnchor:(id)a3 relativeDistance:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIScrollAnchor;
  v7 = [(TUIScrollAnchor *)&v11 init];
  if (v7)
  {
    v8 = (TUILogicalScrollAnchor *)[v6 copy];
    anchor = v7->_anchor;
    v7->_anchor = v8;

    v7->_relativeDistance = a4;
  }

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ anchor=%@ relativeDistance=%f>", v4, self->_anchor, *(void *)&self->_relativeDistance];

  return v5;
}

- (TUILogicalScrollAnchor)anchor
{
  return self->_anchor;
}

- (double)relativeDistance
{
  return self->_relativeDistance;
}

- (void).cxx_destruct
{
}

@end