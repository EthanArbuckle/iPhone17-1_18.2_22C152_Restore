@interface THWControlContainerLayout
- (id)additionalLayouts;
- (id)childInfosForLayout;
- (id)wpLayoutParentForLayout:(id)a3;
- (unint64_t)index;
- (unint64_t)tag;
- (void)setIndex:(unint64_t)a3;
- (void)setTag:(unint64_t)a3;
- (void)validate;
@end

@implementation THWControlContainerLayout

- (void)validate
{
  [(THWControlContainerLayout *)self invalidateFrame];
  v3.receiver = self;
  v3.super_class = (Class)THWControlContainerLayout;
  [(THWControlContainerLayout *)&v3 validate];
}

- (unint64_t)tag
{
  id v2 = [(THWControlContainerLayout *)self info];

  return (unint64_t)[v2 tag];
}

- (void)setTag:(unint64_t)a3
{
  id v4 = [(THWControlContainerLayout *)self info];

  [v4 setTag:a3];
}

- (unint64_t)index
{
  id v2 = [(THWControlContainerLayout *)self info];

  return (unint64_t)[v2 index];
}

- (void)setIndex:(unint64_t)a3
{
  id v4 = [(THWControlContainerLayout *)self info];

  [v4 setIndex:a3];
}

- (id)childInfosForLayout
{
  id v3 = [self info].delegate;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 controlContainerChildrenForLayout:self];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = (char *)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = TSUProtocolCast();
          if (v10)
          {
            uint64_t v11 = v10;
            if (!v7) {
              id v7 = +[NSMutableArray array];
            }
            [v7 addObject:v11];
          }
        }
        v6 = (char *)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
      return v7;
    }
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v3 controlContainerChildInfosForLayout:self];
}

- (id)wpLayoutParentForLayout:(id)a3
{
  id v5 = [[self info] delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v5 controlContainer:self wpLayoutParentForLayout:a3];
}

- (id)additionalLayouts
{
  id v3 = [[self info] delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 controlContainerChildrenForLayout:self];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (char *)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v4);
          }
          objc_opt_class();
          uint64_t v10 = TSUDynamicCast();
          if (v10)
          {
            uint64_t v11 = v10;
            if (!v7) {
              id v7 = +[NSMutableArray array];
            }
            [v7 addObject:v11];
          }
        }
        v6 = (char *)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
      return v7;
    }
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v3 controlContainerAdditionalChildLayouts:self];
}

@end