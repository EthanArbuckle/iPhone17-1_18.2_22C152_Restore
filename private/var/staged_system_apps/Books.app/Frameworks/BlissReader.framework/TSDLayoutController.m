@interface TSDLayoutController
- (BOOL)isCompactHeight;
- (BOOL)isCompactWidth;
- (id)th_traitsCache;
@end

@implementation TSDLayoutController

- (id)th_traitsCache
{
  id v2 = objc_msgSend(objc_msgSend(-[TSDLayoutController canvas](self, "canvas"), "canvasController"), "layerHost");
  uint64_t v3 = TSUCheckedProtocolCast();
  v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      v5 = THLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_2A08AC(v5);
      }
    }
  }
  return [v4 traitsCache];
}

- (BOOL)isCompactWidth
{
  id v2 = [(TSDLayoutController *)self th_traitsCache];

  return [v2 isCompactWidth];
}

- (BOOL)isCompactHeight
{
  id v2 = [(TSDLayoutController *)self th_traitsCache];

  return [v2 isCompactHeight];
}

@end