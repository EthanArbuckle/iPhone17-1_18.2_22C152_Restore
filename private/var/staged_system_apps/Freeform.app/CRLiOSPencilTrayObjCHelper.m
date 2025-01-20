@interface CRLiOSPencilTrayObjCHelper
+ (id)p_customToolInToolPicker:(id)a3 withId:(id)a4;
+ (id)p_eraserToolInToolPicker:(id)a3;
+ (id)p_lassoToolInToolPicker:(id)a3;
+ (void)insertCustomizedLassoToolWithToolIdentifier:(id)a3 withToolConfiguration:(id)a4 inToolPicker:(id)a5 forcingIndexZero:(BOOL)a6;
+ (void)resetTools:(id)a3 forSelectedTool:(id)a4 inToolPicker:(id)a5;
@end

@implementation CRLiOSPencilTrayObjCHelper

+ (id)p_eraserToolInToolPicker:(id)a3
{
  [a3 _tools];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = sub_1002469D0(v9, v8);
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (id)p_lassoToolInToolPicker:(id)a3
{
  [a3 _tools];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = sub_1002469D0(v9, v8);
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (void)resetTools:(id)a3 forSelectedTool:(id)a4 inToolPicker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    long long v13 = 0;
    uint64_t v14 = *(void *)v24;
    uint64_t v15 = PKInkIdentifierEraser;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v17 isEqual:v15]) {
          [a1 p_eraserToolInToolPicker:v10];
        }
        else {
        v18 = [a1 p_customToolInToolPicker:v10 withId:v17];
        }
        if (v18) {
          [v22 addObject:v18];
        }
        if ([v17 isEqual:v9])
        {
          id v19 = v18;

          long long v13 = v19;
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }
  else
  {
    long long v13 = 0;
  }

  if ([v22 count]) {
    BOOL v20 = v13 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (!v20) {
    [v10 _resetTools:v22 selectedTool:v13];
  }
}

+ (id)p_customToolInToolPicker:(id)a3 withId:(id)a4
{
  id v5 = a4;
  [a3 _tools];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v19;
LABEL_3:
    id v11 = 0;
    id v12 = v9;
    while (1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
      uint64_t v14 = objc_opt_class();
      id v9 = sub_1002469D0(v14, v13);

      if (v9)
      {
        uint64_t v15 = [v9 customIdentifier:(void)v18];
        unsigned __int8 v16 = [v5 isEqual:v15];

        if (v16) {
          break;
        }
      }
      id v11 = (char *)v11 + 1;
      id v12 = v9;
      if (v8 == v11)
      {
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (void)insertCustomizedLassoToolWithToolIdentifier:(id)a3 withToolConfiguration:(id)a4 inToolPicker:(id)a5 forcingIndexZero:(BOOL)a6
{
  BOOL v6 = a6;
  id v28 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[CRLFreehandDrawingCustomizedLassoTool alloc] initWithCustomIdentifier:v28 configuration:v9 color:0 weight:0.0];
  id v12 = [v10 _tools];
  if ([v12 count])
  {
    BOOL v27 = v6;
    id v13 = 0;
    unint64_t v14 = 0;
    id v15 = 0;
    unint64_t v16 = 0;
    do
    {
      v17 = [v12 objectAtIndexedSubscript:v16];
      uint64_t v18 = objc_opt_class();
      long long v19 = sub_1002469D0(v18, v17);
      long long v20 = v19;
      if (v19)
      {
        id v21 = v19;
        v22 = v13;
        unint64_t v14 = v16;
        id v13 = v21;
      }
      else
      {
        id v23 = v17;
        v22 = v15;
        id v15 = v23;
      }

      if (v13) {
        BOOL v24 = v15 == 0;
      }
      else {
        BOOL v24 = 1;
      }
      if (!v24) {
        break;
      }
      ++v16;
    }
    while (v16 < (unint64_t)[v12 count]);
    if (v13) {
      BOOL v25 = v15 == 0;
    }
    else {
      BOOL v25 = 1;
    }
    if (!v25)
    {
      [v10 setSelectedTool:v15];
      [v10 _removeTool:v13];
    }
    BOOL v6 = v27;
  }
  else
  {
    id v13 = 0;
    unint64_t v14 = 0;
    id v15 = 0;
  }
  if (v6) {
    unint64_t v26 = 0;
  }
  else {
    unint64_t v26 = v14;
  }
  [v10 _insertTool:v11 atIndex:v26];
}

@end