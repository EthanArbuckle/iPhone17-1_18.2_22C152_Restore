@interface SBSwitcherResizeGrabberLayoutAttributes
+ (id)attributesWithLeafAppLayout:(id)a3 edge:(unint64_t)a4;
- (SBAppLayout)leafAppLayout;
- (id)_copy;
- (unint64_t)edge;
- (void)setEdge:(unint64_t)a3;
- (void)setLeafAppLayout:(id)a3;
@end

@implementation SBSwitcherResizeGrabberLayoutAttributes

+ (id)attributesWithLeafAppLayout:(id)a3 edge:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(SBSwitcherResizeGrabberLayoutAttributes);
  [(SBSwitcherResizeGrabberLayoutAttributes *)v6 setLeafAppLayout:v5];

  [(SBSwitcherResizeGrabberLayoutAttributes *)v6 setEdge:a4];
  return v6;
}

- (void)setLeafAppLayout:(id)a3
{
}

- (void)setEdge:(unint64_t)a3
{
  self->_edge = a3;
}

- (void).cxx_destruct
{
}

- (SBAppLayout)leafAppLayout
{
  return self->_leafAppLayout;
}

- (unint64_t)edge
{
  return self->_edge;
}

- (id)_copy
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  v4 = (void *)[(SBAppLayout *)self->_leafAppLayout copy];
  [v3 setLeafAppLayout:v4];

  [v3 setEdge:self->_edge];
  return v3;
}

@end