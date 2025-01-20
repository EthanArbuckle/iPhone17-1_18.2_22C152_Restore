@interface CRLiOSDragAndDropInfo
- (BOOL)canCreateItemsOfClass:(Class)a3;
- (id)createItemsOfClass:(Class)a3 completion:(id)a4;
- (id)description;
- (id)inProcessDraggingSources;
- (id)promisedUTIs;
- (unint64_t)dragOperationMask;
- (unint64_t)numberOfDraggingItems;
@end

@implementation CRLiOSDragAndDropInfo

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(CRLDragAndDropInfo *)self platformDraggingInfo];
  v6 = [(CRLiOSDragAndDropInfo *)self promisedUTIs];
  v7 = +[NSString stringWithFormat:@"%@<%p>: platform dragging info %@ promised UTIs %@", v4, self, v5, v6];

  return v7;
}

- (unint64_t)dragOperationMask
{
  v2 = [(CRLDragAndDropInfo *)self platformDraggingInfo];
  unsigned int v3 = [v2 allowsMoveOperation];

  if (v3) {
    return 3;
  }
  else {
    return 1;
  }
}

- (unint64_t)numberOfDraggingItems
{
  v2 = [(CRLDragAndDropInfo *)self platformDraggingInfo];
  unsigned int v3 = [v2 items];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (id)inProcessDraggingSources
{
  unsigned int v3 = +[NSMutableArray array];
  id v4 = [(CRLDragAndDropInfo *)self platformDraggingInfo];
  v5 = [v4 localDragSession];
  v6 = [v5 localContext];

  if (v6)
  {
    v7 = [(CRLDragAndDropInfo *)self platformDraggingInfo];
    v8 = [v7 localDragSession];
    v9 = [v8 localContext];
    [v3 addObject:v9];
  }

  return v3;
}

- (id)promisedUTIs
{
  unsigned int v3 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(CRLDragAndDropInfo *)self platformDraggingInfo];
  v5 = [v4 items];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) itemProvider];
        v11 = [v10 registeredTypeIdentifiers];
        [v3 addObjectsFromArray:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v3;
}

- (BOOL)canCreateItemsOfClass:(Class)a3
{
  id v4 = [(CRLDragAndDropInfo *)self itemSource];
  LOBYTE(a3) = [v4 canLoadItemsOfClass:a3];

  return (char)a3;
}

- (id)createItemsOfClass:(Class)a3 completion:(id)a4
{
  id v6 = a4;
  if ([(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___NSItemProviderReading])
  {
    id v7 = [(CRLDragAndDropInfo *)self platformDraggingInfo];
    uint64_t v8 = [v7 loadObjectsOfClass:a3 completion:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end