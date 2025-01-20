@interface CRLLockedDrawableEditor
- (CRLBoardItemEditor)auxiliaryDrawableEditor;
- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)p_unlock:(id)a3;
- (void)setAuxiliaryDrawableEditor:(id)a3;
@end

@implementation CRLLockedDrawableEditor

- (void)p_unlock:(id)a3
{
  id v4 = a3;
  v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 canvasEditor];

  [v6 unlock:v4];
}

- (CRLBoardItemEditor)auxiliaryDrawableEditor
{
  return self->_auxiliaryDrawableEditor;
}

- (void)setAuxiliaryDrawableEditor:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8 = +[NSMutableArray array];
  -[CRLLockedDrawableEditor addContextualMenuElementsToArray:atPoint:](self, "addContextualMenuElementsToArray:atPoint:", v8, x, y);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v15 = [v14 title:v17];
        if ([v15 length])
        {
          id v16 = [v14 state];

          if (v16 != (id)1) {
            continue;
          }
          v15 = [v14 title];
          [v7 addObject:v15];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CRLLockedDrawableEditor;
  -[CRLBoardItemEditor addContextualMenuElementsToArray:atPoint:](&v30, "addContextualMenuElementsToArray:atPoint:", v7, x, y);
  v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"Unlock" value:0 table:0];
  id v10 = +[UIImage systemImageNamed:@"lock.open"];
  id v11 = +[UICommand commandWithTitle:v9 image:v10 action:"unlock:" propertyList:0];

  if ([v7 count])
  {
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = objc_opt_class();
      v14 = [v7 objectAtIndexedSubscript:v12];
      v15 = sub_1002469D0(v13, v14);

      id v16 = [v15 identifier];

      if (v16 == @"CRLCutCopyPasteMenuIdentifier") {
        break;
      }

      if (++v12 >= (unint64_t)[v7 count]) {
        goto LABEL_5;
      }
    }
    if (v15)
    {
      long long v17 = [v15 children];
      id v18 = [v17 count];

      if (v18)
      {
        unint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = objc_opt_class();
          v21 = [v15 children];
          v22 = [v21 objectAtIndexedSubscript:v19];
          v23 = sub_1002469D0(v20, v22);

          if ([v23 action] == "lock:" && objc_msgSend(v23, "attributes") != (id)4) {
            break;
          }

          ++v19;
          v24 = [v15 children];
          id v25 = [v24 count];

          if (v19 >= (unint64_t)v25) {
            goto LABEL_6;
          }
        }

        if (v12 != 0x7FFFFFFFFFFFFFFFLL && v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v26 = objc_opt_new();
          v27 = [v15 children];
          [v26 addObjectsFromArray:v27];

          [v26 insertObject:v11 atIndex:v19 + 1];
          id v28 = [v26 copy];
          v29 = [v15 menuByReplacingChildren:v28];

          [v7 replaceObjectAtIndex:v12 withObject:v29];
          goto LABEL_7;
        }
      }
    }
  }
  else
  {
LABEL_5:
    v15 = 0;
  }
LABEL_6:
  [v7 addObject:v11];
LABEL_7:
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CRLLockedDrawableEditor;
  -[CRLBoardItemEditor addMiniFormatterElementsToArray:atPoint:](&v24, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);
  v8 = +[CRLImage crl_quickInspectorImageNamed:@"eye"];
  id v9 = [(CRLBoardItemEditor *)self boardItems];
  unsigned int v10 = +[CRLURLEditor canOpenItemURLFor:v9];

  if (v10)
  {
    id v11 = +[NSBundle mainBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"Open Link" value:0 table:0];
    uint64_t v13 = +[CRLQuickInspectorElement elementWithName:v12 image:v8 type:2 action:"openItemURL:"];

    [v13 setTag:19];
    v14 = +[NSBundle mainBundle];
    v15 = v14;
    CFStringRef v16 = @"Open this link";
    goto LABEL_9;
  }
  if ([(CRLBoardItemEditor *)self canShowPreview])
  {
    long long v17 = +[NSBundle mainBundle];
    id v18 = [v17 localizedStringForKey:@"Preview" value:0 table:0];
    unint64_t v19 = +[CRLImage crl_quickInspectorImageNamed:@"eye"];
    uint64_t v13 = +[CRLQuickInspectorElement elementWithName:v18 image:v19 type:2 action:"showPreview:"];

    [v13 setTag:19];
    uint64_t v20 = [(CRLBoardItemEditor *)self boardItems];
    if ([v20 count] == (id)1)
    {
      v21 = [(CRLBoardItemEditor *)self boardItems];
      v22 = [v21 anyObject];
      v15 = [v22 previewTooltip];

      if (v15)
      {
        [v13 setToolTip:v15];
LABEL_10:

        [v7 addObject:v13];
        goto LABEL_11;
      }
    }
    else
    {
    }
    v14 = +[NSBundle mainBundle];
    v15 = v14;
    CFStringRef v16 = @"Preview";
LABEL_9:
    v23 = [v14 localizedStringForKey:v16 value:0 table:0];
    [v13 setToolTip:v23];

    goto LABEL_10;
  }
LABEL_11:
}

@end