@interface SBHCustomIconListLayout
- (BOOL)respondsToSelector:(SEL)a3;
- (SBHCustomIconListLayout)init;
- (SBHCustomIconListLayout)initWithBaseListLayout:(id)a3;
- (SBIconListLayout)baseListLayout;
- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3;
- (unint64_t)numberOfRowsForOrientation:(int64_t)a3;
- (void)removeListLayoutForSelector:(SEL)a3;
- (void)setListLayout:(id)a3 forSelector:(SEL)a4;
@end

@implementation SBHCustomIconListLayout

- (SBHCustomIconListLayout)initWithBaseListLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHCustomIconListLayout;
  v6 = [(SBHCustomIconListLayout *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseListLayout, a3);
  }

  return v7;
}

- (SBHCustomIconListLayout)init
{
  return [(SBHCustomIconListLayout *)self initWithBaseListLayout:0];
}

- (void)setListLayout:(id)a3 forSelector:(SEL)a4
{
  id v9 = a3;
  overriddenSelectors = self->_overriddenSelectors;
  if (!overriddenSelectors)
  {
    v7 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:770 valueOptions:0 capacity:0];
    v8 = self->_overriddenSelectors;
    self->_overriddenSelectors = v7;

    overriddenSelectors = self->_overriddenSelectors;
  }
  [(NSMapTable *)overriddenSelectors setObject:v9 forKey:sel_getName(a4)];
}

- (void)removeListLayoutForSelector:(SEL)a3
{
  overriddenSelectors = self->_overriddenSelectors;
  Name = sel_getName(a3);
  [(NSMapTable *)overriddenSelectors removeObjectForKey:Name];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id v5 = [(NSMapTable *)self->_overriddenSelectors objectForKey:sel_getName(a3)];
  v6 = [(SBHCustomIconListLayout *)self baseListLayout];
  if (v5)
  {
    id v7 = v5;
  }
  else if (objc_opt_respondsToSelector())
  {
    id v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBHCustomIconListLayout;
    id v7 = [(SBHCustomIconListLayout *)&v10 forwardingTargetForSelector:a3];
  }
  id v8 = v7;

  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBHCustomIconListLayout;
  if (-[SBHCustomIconListLayout respondsToSelector:](&v9, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    v6 = [(NSMapTable *)self->_overriddenSelectors objectForKey:sel_getName(a3)];
    if (v6)
    {
      char v5 = objc_opt_respondsToSelector();
    }
    else
    {
      id v7 = [(SBHCustomIconListLayout *)self baseListLayout];
      char v5 = objc_opt_respondsToSelector();
    }
  }
  return v5 & 1;
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  v6 = [(NSMapTable *)self->_overriddenSelectors objectForKey:sel_getName(a2)];
  if (!v6)
  {
    v6 = [(SBHCustomIconListLayout *)self baseListLayout];
  }
  objc_msgSend(v6, a2, a3);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3
{
  v6 = [(NSMapTable *)self->_overriddenSelectors objectForKey:sel_getName(a2)];
  if (!v6)
  {
    v6 = [(SBHCustomIconListLayout *)self baseListLayout];
  }
  id v7 = objc_msgSend(v6, a2, a3);

  return (unint64_t)v7;
}

- (unint64_t)numberOfRowsForOrientation:(int64_t)a3
{
  v6 = [(NSMapTable *)self->_overriddenSelectors objectForKey:sel_getName(a2)];
  if (!v6)
  {
    v6 = [(SBHCustomIconListLayout *)self baseListLayout];
  }
  id v7 = objc_msgSend(v6, a2, a3);

  return (unint64_t)v7;
}

- (SBIconListLayout)baseListLayout
{
  return self->_baseListLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseListLayout, 0);
  objc_storeStrong((id *)&self->_overriddenSelectors, 0);
}

@end