@interface OABDrawingGroup
+ (void)readBlipsFromDrawingGroup:(id)a3 toDocument:(id)a4 state:(id)a5;
+ (void)readGraphicalDefaultsFromDrawingGroup:(id)a3 toTheme:(id)a4 state:(id)a5;
@end

@implementation OABDrawingGroup

+ (void)readBlipsFromDrawingGroup:(id)a3 toDocument:(id)a4 state:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  v8 = [a3 firstChildOfType:61441];
  [v7 setBstoreContainerHolder:v8];
  uint64_t v9 = [v8 childCount];
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      v11 = [v8 childAt:i];
      v12 = [v14 blips];
      v13 = +[OABBlip readBlipFromBse:v11];
      [v12 addBlip:v13];
    }
  }
}

+ (void)readGraphicalDefaultsFromDrawingGroup:(id)a3 toTheme:(id)a4 state:(id)a5
{
  id v41 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v41 firstChildOfType:4];
  v10 = v9;
  if (v9)
  {
    v11 = (const void *)[v9 eshObject];
    if (v11) {
    else
    }
      v12 = 0;
    v13 = [v7 drawableDefaults];
    id v14 = [v13 lineDefaults];
    v15 = [v14 shapeProperties];
    +[OABShape readGraphicDefaults:v10 to:v15 state:v8];

    v16 = +[OADNullFill nullFill];
    v17 = [v7 drawableDefaults];
    v18 = [v17 lineDefaults];
    v19 = [v18 shapeProperties];
    [v19 setFill:v16];

    v20 = [v7 drawableDefaults];
    v21 = [v20 shapeDefaults];
    v22 = [v21 shapeProperties];
    +[OABShape readGraphicDefaults:v10 to:v22 state:v8];

    v23 = [v7 drawableDefaults];
    v24 = [v23 shapeDefaults];
    v25 = [v24 textBodyProperties];
    v26 = v12 + 272;
    +[OABTextBodyProperties readTextBodyProperties:v25 textBox:v26 useDefaults:1 state:v8];

    v27 = [v7 drawableDefaults];
    v28 = [v27 textDefaults];
    v29 = [v28 shapeProperties];
    +[OABShape readGraphicDefaults:v10 to:v29 state:v8];

    v30 = +[OADNullFill nullFill];
    v31 = [v7 drawableDefaults];
    v32 = [v31 textDefaults];
    v33 = [v32 shapeProperties];
    [v33 setFill:v30];

    v34 = +[OADStroke nullStroke];
    v35 = [v7 drawableDefaults];
    v36 = [v35 textDefaults];
    v37 = [v36 shapeProperties];
    [v37 setStroke:v34];

    v38 = [v7 drawableDefaults];
    v39 = [v38 textDefaults];
    v40 = [v39 textBodyProperties];
    +[OABTextBodyProperties readTextBodyProperties:v40 textBox:v26 useDefaults:1 state:v8];
  }
}

@end