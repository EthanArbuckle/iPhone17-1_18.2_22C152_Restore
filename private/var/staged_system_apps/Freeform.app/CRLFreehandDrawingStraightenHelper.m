@interface CRLFreehandDrawingStraightenHelper
- (CRLFreehandDrawingStraightenHelper)initWithInteractiveCanvasController:(id)a3;
- (id)commandForStraighteningShapeItem:(id)a3 toStrokesInUnscaledSpace:(id)a4;
- (id)p_strokesByClippingMaskedStrokes:(id)a3;
@end

@implementation CRLFreehandDrawingStraightenHelper

- (CRLFreehandDrawingStraightenHelper)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingStraightenHelper;
  v5 = [(CRLFreehandDrawingStraightenHelper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_icc, v4);
  }

  return v6;
}

- (id)commandForStraighteningShapeItem:(id)a3 toStrokesInUnscaledSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [[_TtC8Freeform15CRLCommandGroup alloc] initWithCommands:&__NSArray0__struct];
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Straighten" value:0 table:@"UndoStrings"];
  v51 = v8;
  [(CRLCommandGroup *)v8 setActionString:v10];

  v11 = +[NSMutableArray array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v13 = [WeakRetained editingCoordinator];
  v48 = [v13 boardItemFactory];

  v14 = (objc_class *)objc_opt_class();
  v52 = v6;
  v15 = [v6 parentInfo];
  uint64_t v16 = sub_10024715C(v14, v15);

  id v17 = objc_loadWeakRetained((id *)&self->_icc);
  v44 = (void *)v16;
  v18 = [v17 layoutForInfo:v16];

  v19 = [CRLCanvasInfoGeometry alloc];
  v43 = v18;
  v20 = [v18 geometryInRoot];
  v21 = [(CRLCanvasInfoGeometry *)v19 initWithLayoutGeometry:v20];

  v45 = v7;
  [(CRLFreehandDrawingStraightenHelper *)self p_strokesByClippingMaskedStrokes:v7];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v49 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v49)
  {
    uint64_t v47 = *(void *)v58;
    char v22 = 1;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v58 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = v23;
        uint64_t v24 = *(void *)(*((void *)&v57 + 1) + 8 * v23);
        v25 = [v52 stroke];
        [v25 width];
        v26 = [v48 makeShapeItemsForFreehandDrawingWithPKStroke:v24];

        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v27 = v26;
        id v28 = [v27 countByEnumeratingWithState:&v53 objects:v61 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v54;
          char v31 = v22;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v54 != v30) {
                objc_enumerationMutation(v27);
              }
              v33 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              v34 = [v33 geometry];
              v35 = [v34 geometryRelativeToGeometry:v21];
              [v33 setGeometry:v35];

              if (v31)
              {
                v36 = [v52 commandsToUpdateModelToMatch:v33];
                [(CRLCommandGroup *)v51 addCommand:v36];
              }
              else
              {
                [v11 addObject:v33];
              }
              char v31 = 0;
            }
            id v29 = [v27 countByEnumeratingWithState:&v53 objects:v61 count:16];
            char v31 = 0;
            char v22 = 0;
          }
          while (v29);
        }

        uint64_t v23 = v50 + 1;
      }
      while ((id)(v50 + 1) != v49);
      id v49 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v49);
  }
  if ([v11 count])
  {
    v37 = [v44 childInfos];
    v38 = (char *)[v37 indexOfObject:v52];

    if (v38 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v39 = [v44 childInfos];
      id v40 = [v39 count];
    }
    else
    {
      id v40 = v38 + 1;
    }
    v41 = [[_TtC8Freeform26CRLCommandInsertBoardItems alloc] initWithParentContainer:v44 boardItems:v11 index:v40];
    [(CRLCommandGroup *)v51 addCommand:v41];
  }

  return v51;
}

- (id)p_strokesByClippingMaskedStrokes:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v10 _isMaskedStroke])
        {
          id v11 = objc_alloc((Class)PKDrawing);
          id v29 = v10;
          v12 = +[NSArray arrayWithObjects:&v29 count:1];
          id v13 = [v11 initWithStrokes:v12];

          [v13 _clipMaskedStrokes];
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          v14 = [v13 strokes];
          id v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v21;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v21 != v17) {
                  objc_enumerationMutation(v14);
                }
                [v4 addObject:*(void *)(*((void *)&v20 + 1) + 8 * (void)j)];
              }
              id v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v16);
          }
        }
        else
        {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end