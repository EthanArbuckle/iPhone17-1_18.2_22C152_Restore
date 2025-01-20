@interface THFlowSectionLayout
- (void)ensurePageLayoutCreated;
- (void)invalidatePosition;
- (void)invalidateSize;
@end

@implementation THFlowSectionLayout

- (void)ensurePageLayoutCreated
{
  if (!objc_msgSend(-[THFlowSectionLayout children](self, "children"), "count"))
  {
    if (!objc_msgSend(objc_msgSend(-[THFlowSectionLayout info](self, "info"), "childInfos"), "count")) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionLayout ensurePageLayoutCreated]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionLayout.mm") lineNumber:30 description:@"section info has no child infos"];
    }
    id v3 = objc_alloc_init((Class)NSMutableArray);
    id v4 = [(THFlowSectionLayout *)self layoutController];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [[self info:0] childInfos];
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v11 = [v4 layoutForInfo:v10 childOfLayout:self];
          if (!v11)
          {
            id v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "layoutClass")), "initWithInfo:", v10);
            if (!v11) {
              continue;
            }
          }
          [v3 addObject:v11];
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    [(THFlowSectionLayout *)self setChildren:v3];

    [(-[THFlowSectionLayout children](self, "children")) makeObjectsPerformSelector:@"updateChildrenFromInfo"];
    [self.children makeObjectsPerformSelector:@selector(validate)];
  }
}

- (void)invalidateSize
{
  v3.receiver = self;
  v3.super_class = (Class)THFlowSectionLayout;
  [(THFlowSectionLayout *)&v3 invalidateSize];
  [self dependentLayouts makeObjectsPerformSelector:@"invalidateSize"];
}

- (void)invalidatePosition
{
  v3.receiver = self;
  v3.super_class = (Class)THFlowSectionLayout;
  [(THFlowSectionLayout *)&v3 invalidatePosition];
  [(-[THSectionLayout dependentLayouts](self, "dependentLayouts")) makeObjectsPerformSelector:@"invalidatePosition"];
}

@end