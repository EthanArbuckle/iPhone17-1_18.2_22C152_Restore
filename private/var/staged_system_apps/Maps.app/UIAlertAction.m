@interface UIAlertAction
+ (id)_maps_alertActionsForTransitLines:(id)a3 selectionHandlers:(id)a4;
+ (id)_maps_alertActionsForTransitLinesWithNames:(id)a3 artworks:(id)a4 selectionHandlers:(id)a5;
@end

@implementation UIAlertAction

+ (id)_maps_alertActionsForTransitLinesWithNames:(id)a3 artworks:(id)a4 selectionHandlers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  if (v11 == [v9 count] && (id v12 = objc_msgSend(v8, "count"), v12 == objc_msgSend(v10, "count")))
  {
    id v25 = a1;
    v13 = (char *)[v8 count];
    id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v13];
    if (v13)
    {
      for (i = 0; i != v13; ++i)
      {
        v16 = [v8 objectAtIndexedSubscript:i];
        v17 = +[NSNull null];
        if ([v16 isEqual:v17])
        {
          v18 = 0;
        }
        else
        {
          v18 = [v8 objectAtIndexedSubscript:i];
        }

        v19 = [v9 objectAtIndexedSubscript:i];
        v20 = +[NSNull null];
        if ([v19 isEqual:v20])
        {
          v21 = 0;
        }
        else
        {
          v21 = [v9 objectAtIndexedSubscript:i];
        }

        v22 = [[_GEOTransitLineWrapper alloc] initWithName:v18 artwork:v21];
        [v14 addObject:v22];
      }
    }
    v23 = [v25 _maps_alertActionsForTransitLines:v14 selectionHandlers:v10];
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)_maps_alertActionsForTransitLines:(id)a3 selectionHandlers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  if (v7 == [v6 count])
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    id v8 = +[UIScreen mainScreen];
    [v8 scale];
    uint64_t v10 = v9;

    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v5 count]];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1007C1200;
    v24[3] = &unk_1012F8D58;
    uint64_t v27 = v10;
    id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v5 count]];
    id v25 = v12;
    v26 = v28;
    [v5 enumerateObjectsUsingBlock:v24];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1007C1318;
    v18[3] = &unk_1012F8DA0;
    id v13 = v12;
    id v19 = v13;
    v22 = v28;
    uint64_t v23 = v10;
    id v20 = v6;
    id v14 = v11;
    id v21 = v14;
    [v5 enumerateObjectsUsingBlock:v18];
    v15 = v21;
    id v16 = v14;

    _Block_object_dispose(v28, 8);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

@end