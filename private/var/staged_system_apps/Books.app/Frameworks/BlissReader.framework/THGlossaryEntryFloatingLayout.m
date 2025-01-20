@interface THGlossaryEntryFloatingLayout
- (CGRect)boundingBoxForChildren;
- (CGSize)maximumFrameSizeForChild:(id)a3;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)childrenForWrappingDependents;
- (id)computeLayoutGeometry;
- (id)descendentWrappables;
- (id)floatingLayouts;
- (int)wrapContainerMode;
- (void)p_addWrappingRequirementsForLayout:(id)a3 toArray:(id)a4;
- (void)updateChildrenFromInfo;
@end

@implementation THGlossaryEntryFloatingLayout

- (id)floatingLayouts
{
  id v3 = [self info].bodyFloatingInfos;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = [(THGlossaryEntryFloatingLayout *)self layoutController];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = [v5 layoutForInfo:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)];
        if (v10) {
          [v4 addObject:v10];
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v4;
}

- (CGRect)boundingBoxForChildren
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  id v6 = [(THGlossaryEntryFloatingLayout *)self floatingLayouts];
  if ([v6 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v10), "geometry"), "frame");
          v28.origin.CGFloat x = v11;
          v28.origin.CGFloat y = v12;
          v28.size.CGFloat width = v13;
          v28.size.CGFloat height = v14;
          v24.origin.CGFloat x = x;
          v24.origin.CGFloat y = y;
          v24.size.CGFloat width = width;
          v24.size.CGFloat height = height;
          CGRect v25 = CGRectUnion(v24, v28);
          CGFloat x = v25.origin.x;
          CGFloat y = v25.origin.y;
          CGFloat width = v25.size.width;
          CGFloat height = v25.size.height;
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
  }
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  if (CGRectIsNull(v26))
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)p_addWrappingRequirementsForLayout:(id)a3 toArray:(id)a4
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [a3 children];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = TSUProtocolCast();
        if (!v12)
        {
          uint64_t v13 = TSUProtocolCast();
          if (!v13) {
            continue;
          }
          uint64_t v12 = v13;
          [(THGlossaryEntryFloatingLayout *)self p_addWrappingRequirementsForLayout:v11 toArray:a4];
        }
        [a4 addObject:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (id)childrenForWrappingDependents
{
  id v3 = +[NSMutableArray array];
  [(THGlossaryEntryFloatingLayout *)self p_addWrappingRequirementsForLayout:self toArray:v3];
  return v3;
}

- (void)updateChildrenFromInfo
{
  id v3 = [self children].count;
  if (v3 != objc_msgSend(objc_msgSend(-[THGlossaryEntryFloatingLayout info](self, "info"), "childInfos"), "count"))
  {
    id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(objc_msgSend(-[THGlossaryEntryFloatingLayout info](self, "info"), "bodyFloatingInfos"), "count"));
    id v5 = [[self info] bodyFloatingInfos];
    id v6 = [(THGlossaryEntryFloatingLayout *)self layoutController];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v12 = [v6 layoutForInfo:v11 childOfLayout:self];
          if (!v12)
          {
            id v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(v11, "layoutClass")), "initWithInfo:", v11);
            if (!v12) {
              continue;
            }
          }
          [(NSMutableArray *)v4 addObject:v12];
        }
        id v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    [(THGlossaryEntryFloatingLayout *)self setChildren:v4];
    [(THGlossaryEntryFloatingLayout *)self invalidate];
  }
  [self.children makeObjectsPerformSelector:@selector(updateChildrenFromInfo)];
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  return +[NSArray arrayWithObject:self];
}

- (id)computeLayoutGeometry
{
  [(THGlossaryEntryFloatingLayout *)self boundingBoxForChildren];
  double v4 = v3;
  double v6 = v5;
  objc_opt_class();
  [(THGlossaryEntryFloatingLayout *)self parent];
  objc_msgSend(objc_msgSend((id)TSUDynamicCast(), "layoutStyleProvider"), "glossaryEntryLayoutValueForDistance:", 3);
  id v8 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v7, 0.0, v4, v6];

  return v8;
}

- (CGSize)maximumFrameSizeForChild:(id)a3
{
  objc_opt_class();
  [(THGlossaryEntryFloatingLayout *)self parent];
  double v5 = (void *)TSUDynamicCast();
  if (v5)
  {
    [v5 maximumFrameSizeForChild:a3];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)THGlossaryEntryFloatingLayout;
    [(THGlossaryEntryFloatingLayout *)&v8 maximumFrameSizeForChild:a3];
  }
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

- (id)descendentWrappables
{
  return +[TSDLayout descendentWrappablesOfLayout:self];
}

- (int)wrapContainerMode
{
  return 0;
}

@end