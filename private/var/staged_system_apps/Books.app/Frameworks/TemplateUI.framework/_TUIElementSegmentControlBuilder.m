@interface _TUIElementSegmentControlBuilder
- (NSString)name;
- (TUIMutableDynamicValue)viewState;
- (UIColor)tintColor;
- (id)finalizeAnimationGroups;
- (id)finalizeSegments;
- (int64_t)selectIndex;
- (void)addAnimationGroup:(id)a3 withName:(id)a4;
- (void)addSegmentWithTitle:(id)a3;
- (void)setName:(id)a3;
- (void)setSelectIndex:(int64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setViewState:(id)a3;
@end

@implementation _TUIElementSegmentControlBuilder

- (void)addAnimationGroup:(id)a3 withName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  animations = self->_animations;
  if (!animations)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_animations;
    self->_animations = v8;

    animations = self->_animations;
  }
  [(NSMutableDictionary *)animations setObject:v10 forKeyedSubscript:v6];
}

- (id)finalizeAnimationGroups
{
  if ([(NSMutableDictionary *)self->_animations count])
  {
    v3 = objc_alloc_init(TUIAnimationGroupCollection);
    [(TUIAnimationGroupCollection *)v3 setGroups:self->_animations];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)addSegmentWithTitle:(id)a3
{
  id v4 = a3;
  segments = self->_segments;
  id v8 = v4;
  if (!segments)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_segments;
    self->_segments = v6;

    segments = self->_segments;
    id v4 = v8;
  }
  [(NSMutableArray *)segments addObject:v4];
}

- (id)finalizeSegments
{
  id v2 = [(NSMutableArray *)self->_segments copy];

  return v2;
}

- (TUIMutableDynamicValue)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)selectIndex
{
  return self->_selectIndex;
}

- (void)setSelectIndex:(int64_t)a3
{
  self->_selectIndex = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_animations, 0);

  objc_storeStrong((id *)&self->_segments, 0);
}

@end