@interface OABDrawing
+ (id)readBackgroundPropertiesFromDrawing:(id)a3 state:(id)a4;
+ (id)readDrawablesFromDrawing:(id)a3 state:(id)a4;
+ (unsigned)addShapeIdForObject:(id)a3;
+ (void)applyRulesFromSolverContainer:(id)a3 state:(id)a4;
@end

@implementation OABDrawing

+ (id)readDrawablesFromDrawing:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 eshObject];
  if ((*(unsigned int (**)(uint64_t))(*(void *)v8 + 16))(v8) == 61442
    && (unint64_t)[v6 childCount] >= 2)
  {
    v10 = [v6 childAt:1];
    uint64_t v11 = [v10 eshObject];
    if ((*(unsigned int (**)(uint64_t))(*(void *)v11 + 16))(v11) == 61443
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = +[OABDrawable readDrawablesFromContainer:v10 state:v7];
      v12 = [v6 firstChildOfType:61445];
      if (v12) {
        [a1 applyRulesFromSolverContainer:v12 state:v7];
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)readBackgroundPropertiesFromDrawing:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 childCount] < 3)
  {
    v9 = 0;
  }
  else
  {
    id v7 = [v5 childAt:2];
    uint64_t v8 = (const void *)[(OABFillPropertiesManager *)v7 eshObject];
    if (v8)
    {

      if (!v9) {
        goto LABEL_8;
      }
      id v7 = [[OABFillPropertiesManager alloc] initWithFill:&v9[12].mEffects shapeType:1 masterShape:0];
      v10 = +[OABFill readFillFromFillPropertiesManager:v7 state:v6];
      v9 = objc_alloc_init(OADBackgroundProperties);
      [(OADBackgroundProperties *)v9 setFill:v10];
    }
    else
    {
      v9 = 0;
    }
  }
LABEL_8:

  return v9;
}

+ (void)applyRulesFromSolverContainer:(id)a3 state:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  if (v14)
  {
    uint64_t v6 = [v14 childCount];
    if (v6)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [v14 childAt:i];
        v9 = (unsigned int *)[v8 eshObject];
        if ((*(unsigned int (**)(unsigned int *))(*(void *)v9 + 16))(v9) == 61458)
        {
          v10 = [v5 drawableForShapeId:v9[10]];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = [v10 connectorProperties];
            v12 = [v11 from];
            [v12 setDrawableId:v9[8]];
            [v12 setLocationIndex:v9[11]];
            v13 = [v11 to];
            [v13 setDrawableId:v9[9]];
            [v13 setLocationIndex:v9[12]];
          }
        }
      }
    }
  }
}

+ (unsigned)addShapeIdForObject:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    do
    {
      uint64_t v6 = [v5 eshObject];
      if ((*(unsigned int (**)(uint64_t))(*(void *)v6 + 16))(v6) == 61442) {
        break;
      }
      uint64_t v7 = [v5 parent];

      id v5 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v8 = [v5 childAt:0];
  v9 = (const void *)[v8 eshObject];
  if (!v9)
  {

    goto LABEL_11;
  }

  if (!v10)
  {
LABEL_11:
    unsigned int v11 = 0;
    goto LABEL_12;
  }
  unsigned int v11 = v10[8] + 1;
  ++v10[7];
  v10[8] = v11;
LABEL_12:

  return v11;
}

@end