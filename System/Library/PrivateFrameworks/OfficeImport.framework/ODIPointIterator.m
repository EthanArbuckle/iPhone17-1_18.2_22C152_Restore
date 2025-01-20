@interface ODIPointIterator
+ (BOOL)addPoint:(id)a3 state:(ODIPointIteratorState *)a4;
+ (BOOL)isDoneForState:(ODIPointIteratorState *)a3;
+ (BOOL)isPoint:(id)a3 ofType:(int)a4;
+ (id)pointsForSpecification:(id)a3 startingPoint:(id)a4 isLast:(BOOL)a5;
+ (id)processAttributes:(id)a3 startingPoint:(id)a4 isLast:(BOOL)a5;
+ (void)processChildAxisFromPoint:(id)a3 state:(ODIPointIteratorState *)a4;
+ (void)processFollowingSiblingAxisFromPoint:(id)a3 state:(ODIPointIteratorState *)a4;
@end

@implementation ODIPointIterator

+ (id)pointsForSpecification:(id)a3 startingPoint:(id)a4 isLast:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 attributesList];
  v11 = [v10 objectEnumerator];
  id v12 = 0;
  while (1)
  {

    v10 = [v11 nextObject];
    if (!v10) {
      break;
    }
    v13 = [a1 processAttributes:v10 startingPoint:v9 isLast:v5];
    v14 = v13;
    if (v12) {
      [v12 addObjectsFromArray:v13];
    }
    else {
      id v12 = v13;
    }
  }
  return v12;
}

+ (id)processAttributes:(id)a3 startingPoint:(id)a4 isLast:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x263EFF980] array];
  int v11 = [v8 start];
  if (v11 <= 1) {
    int v12 = 1;
  }
  else {
    int v12 = v11;
  }
  v20[0] = [v8 pointType];
  uint64_t v13 = (v12 - 1);
  v20[1] = [v8 count] + v13;
  int v21 = [v8 step];
  int v22 = 0;
  id v14 = v10;
  id v23 = v14;
  v15 = v14;
  if (v21 >= 1)
  {
    int v16 = [v8 axis];
    switch(v16)
    {
      case 7:
        [a1 processFollowingSiblingAxisFromPoint:v9 state:v20];
        break;
      case 1:
        [a1 processChildAxisFromPoint:v9 state:v20];
        break;
      case 0:
        [a1 processSelfAxisFromPoint:v9 state:v20];
        break;
    }
    if (v13 && [v14 count] > (unint64_t)v13) {
      objc_msgSend(v14, "removeObjectsInRange:", 0, v13);
    }
    if (v5)
    {
      if ([v8 hideLastTransition])
      {
        if ([v14 count])
        {
          v17 = [v14 lastObject];
          int v18 = [v17 type];

          if (v18 == 5 || v18 == 3) {
            [v14 removeLastObject];
          }
        }
      }
    }
    v15 = v23;
  }

  return v14;
}

+ (BOOL)addPoint:(id)a3 state:(ODIPointIteratorState *)a4
{
  id v6 = a3;
  if ([a1 isDoneForState:a4])
  {
    char v7 = 1;
  }
  else if ([a1 isPoint:v6 ofType:a4->var0])
  {
    int var3 = a4->var3;
    if (var3)
    {
      char v7 = 0;
      a4->int var3 = var3 - 1;
    }
    else
    {
      [a4->var4 addObject:v6];
      a4->int var3 = a4->var2 - 1;
      char v7 = [a1 isDoneForState:a4];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isPoint:(id)a3 ofType:(int)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 type];
    switch(a4)
    {
      case 0:
        BOOL v8 = 1;
        break;
      case 1:
        BOOL v9 = v7 == 1;
        goto LABEL_19;
      case 2:
        BOOL v9 = v7 == 2;
        goto LABEL_19;
      case 3:
        BOOL v8 = v7 == 5 || (v7 - 1) < 3;
        break;
      case 4:
        BOOL v9 = (v7 & 0xFFFFFFFB) == 0;
        goto LABEL_19;
      case 5:
        BOOL v9 = v7 == 0;
        goto LABEL_19;
      case 6:
        BOOL v8 = v7 != 0;
        break;
      case 7:
        BOOL v9 = v7 == 3;
        goto LABEL_19;
      case 8:
        BOOL v9 = v7 == 4;
        goto LABEL_19;
      case 9:
        BOOL v9 = v7 == 5;
LABEL_19:
        BOOL v8 = v9;
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)isDoneForState:(ODIPointIteratorState *)a3
{
  return a3->var1 && [a3->var4 count] == a3->var1;
}

+ (void)processChildAxisFromPoint:(id)a3 state:(ODIPointIteratorState *)a4
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v11 children];
    int v7 = [v6 objectEnumerator];

    char v8 = 0;
    BOOL v9 = 0;
    while ((v8 & 1) == 0)
    {
      uint64_t v10 = [v7 nextObject];

      if (!v10)
      {
        BOOL v9 = 0;
        break;
      }
      BOOL v9 = (void *)v10;
      char v8 = [a1 addPoint:v10 state:a4];
    }
  }
}

+ (void)processFollowingSiblingAxisFromPoint:(id)a3 state:(ODIPointIteratorState *)a4
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v7 siblingTransition];
    [a1 addPoint:v6 state:a4];
  }
}

@end