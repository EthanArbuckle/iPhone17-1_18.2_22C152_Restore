@interface PBSlideBase
+ (BOOL)readColorScheme:(id)a3 colorScheme:(id)a4 colorMap:(id)a5 state:(id)a6;
+ (BOOL)slideFollowsMasterBackground:(id)a3;
+ (id)newOptions:(int64_t)a3 transType:(int)a4;
+ (id)nonPlaceholderDrawablesAmongDrawables:(id)a3;
+ (int)parseTransType:(int)a3 direction:(int64_t)a4;
+ (unint64_t)authorIdForName:(id)a3 state:(id)a4;
+ (unsigned)mapDirection:(id)a3;
+ (void)mapSlideNumberPlaceholder:(id)a3 tgtSlideBase:(id)a4 state:(id)a5;
+ (void)parseSlideShowInfo:(PptSSSlideInfoAtom *)a3 slideBase:(id)a4 state:(id)a5;
+ (void)readComments:(id)a3 slide:(id)a4 state:(id)a5;
+ (void)readDrawingGroup:(id)a3 slide:(id)a4 state:(id)a5;
@end

@implementation PBSlideBase

+ (BOOL)readColorScheme:(id)a3 colorScheme:(id)a4 colorMap:(id)a5 state:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v9 childOfType:2032 instance:1];
  v14 = v13;
  if (v13 {
    && (v15 = (const void *)[v13 eshObject]) != 0
  }
  {
    +[PBColorScheme readFromColorScheme:v16 toColorScheme:v10 colorMap:v11 state:v12];
    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (void)readDrawingGroup:(id)a3 slide:(id)a4 state:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v22 firstChildOfType:1036];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  if ([v11 childCount])
  {
    objc_opt_class();
    id v12 = [v11 childAt:0];
    [v9 setTgtSlide:v8];
    v13 = [v9 officeArtState];
    v14 = +[OABDrawing readDrawablesFromDrawing:v12 state:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[PBHeadersFooters readHeadersFootersFromSlideContainer:v22 toMasterSlide:v8 drawables:v14 state:v9];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 showMasterShapes]) {
        +[PBHeadersFooters readHeadersFootersFromSlideContainer:v22 toSlide:v8 drawables:v14 state:v9];
      }
    }
    [v8 setDrawables:v14];
    v15 = [v9 tgtPresentation];
    [v15 cacheGraphicStylesForSlideBase:v8];

    v16 = +[OABDrawing readBackgroundPropertiesFromDrawing:v12 state:v13];
    if (v16)
    {
      if ([a1 slideFollowsMasterBackground:v22])
      {
        BOOL v17 = objc_alloc_init(OADMasterBackground);
        [v8 setBackground:v17];
      }
      else
      {
        [v8 setBackground:v16];
      }
    }
  }
  v18 = [v22 firstChildOfType:1017];
  v19 = v18;
  if (v18)
  {
    v20 = (const void *)[v18 eshObject];
    if (v20)
    {
      if (v21) {
        [a1 parseSlideShowInfo:v21 slideBase:v8 state:v9];
      }
    }
  }
}

+ (BOOL)slideFollowsMasterBackground:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 eshObject];
  if ((*(unsigned int (**)(uint64_t))(*(void *)v4 + 16))(v4) == 1016
    || (uint64_t v5 = [v3 eshObject], (*(unsigned int (**)(uint64_t))(*(void *)v5 + 16))(v5) == 1008))
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = [v3 eshObject];
    BOOL v8 = (*(unsigned int (**)(uint64_t))(*(void *)v7 + 16))(v7) == 1006;
    TCVerifyInputMeetsCondition(v8);
    id v9 = [v3 firstChildOfType:1007];
    TCVerifyInputMeetsCondition(v9 != 0);
    id v10 = (const void *)[v9 eshObject];
    if (v10) {
    else
    }
      id v11 = 0;
    TCVerifyInputMeetsCondition(v11 != 0);
    BOOL v6 = v11[94] != 0;
  }
  return v6;
}

+ (void)mapSlideNumberPlaceholder:(id)a3 tgtSlideBase:(id)a4 state:(id)a5
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 placeholderWithType:5 placeholderTypeIndex:0 overrideIndex:1];
  if (!v7)
  {
    BOOL v8 = [v9 placeholderWithType:5 placeholderTypeIndex:0 overrideIndex:1];
    if (v8) {
      [v6 addSlideNumberPlaceholder:v8];
    }
  }
}

+ (void)parseSlideShowInfo:(PptSSSlideInfoAtom *)a3 slideBase:(id)a4 state:(id)a5
{
  id v12 = a4;
  uint64_t v7 = objc_alloc_init(PDTransition);
  BOOL v8 = v7;
  int var11 = a3->var11;
  if (var11) {
    uint64_t v10 = var11 != 2;
  }
  else {
    uint64_t v10 = 2;
  }
  [(PDTransition *)v7 setSpeed:v10];
  [(PDTransition *)v8 setIsAdvanceOnClick:(a3->var10 & 0x400) == 0];
  [(PDTransition *)v8 setAdvanceAfterTime:a3->var6];
  -[PDTransition setType:](v8, "setType:", [a1 parseTransType:a3->var9 direction:a3->var8]);
  id v11 = (void *)[a1 newOptions:a3->var8 transType:a3->var9];
  [(PDTransition *)v8 setOptions:v11];
  [v12 setTransition:v8];
  if ((a3->var10 & 4) != 0) {
    [v12 setIsHidden:1];
  }
}

+ (int)parseTransType:(int)a3 direction:(int64_t)a4
{
  int result = 37;
  switch(a3)
  {
    case 0:
      if (a4) {
        int result = 16 * (a4 == 1);
      }
      else {
        int result = 13;
      }
      break;
    case 1:
      return result;
    case 2:
    case 3:
      int result = a3;
      break;
    case 4:
      int result = 7;
      break;
    case 5:
      int result = 13;
      break;
    case 7:
      int result = 35;
      break;
    case 8:
      int result = 38;
      break;
    case 9:
      int result = 43;
      break;
    case 10:
      int result = 52;
      break;
    case 11:
      int result = 53;
      break;
    case 13:
      int result = 42;
      break;
    case 17:
      int result = 12;
      break;
    case 18:
      int result = 32;
      break;
    case 19:
      int result = 47;
      break;
    case 20:
      int result = 36;
      break;
    case 21:
      int result = 5;
      break;
    case 22:
      int result = 26;
      break;
    case 26:
      int result = 48;
      break;
    case 27:
      int result = 4;
      break;
    case 29:
      int result = 20;
      break;
    case 30:
      int result = 9;
      break;
    default:
      int result = 16;
      break;
  }
  return result;
}

+ (id)newOptions:(int64_t)a3 transType:(int)a4
{
  uint64_t v4 = 0;
  unint64_t v5 = a3;
  switch(a4)
  {
    case 2:
      unint64_t v5 = a3 == 0;
      goto LABEL_9;
    case 3:
    case 8:
    case 21:
LABEL_9:
      uint64_t v4 = objc_alloc_init(PDOrientationOptions);
      [(PDOrientationOptions *)v4 setOrientation:v5 != 0];
      return v4;
    case 4:
    case 7:
      id v6 = objc_alloc_init(PDEightDirectionOptions);
      uint64_t v4 = (PDOrientationOptions *)v6;
      if (v5 - 1 > 6) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = dword_238EF0210[v5 - 1];
      }
      goto LABEL_20;
    case 6:
    case 23:
      uint64_t v4 = objc_alloc_init(PDBlackOptions);
      [(PDOrientationOptions *)v4 setIsThroughBlack:a4 == 6];
      return v4;
    case 9:
      id v6 = objc_alloc_init(PDCornerDirectionOptions);
      uint64_t v4 = (PDOrientationOptions *)v6;
      if (v5 - 1 > 6) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = dword_238EF0210[v5 - 1];
      }
      goto LABEL_20;
    case 10:
    case 20:
    case 29:
    case 30:
      id v6 = objc_alloc_init(PDSideDirectionOptions);
      uint64_t v4 = (PDOrientationOptions *)v6;
      if (v5 - 1 > 6) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = dword_238EF0210[v5 - 1];
      }
LABEL_20:
      [(PDEightDirectionOptions *)v6 setDirection:v7];
      break;
    case 11:
      uint64_t v4 = objc_alloc_init(PDInOutDirectionOptions);
      [(PDOrientationOptions *)v4 setInOut:v5 == 0];
      break;
    case 13:
      id v9 = objc_alloc_init(PDSplitDirectionOptions);
      uint64_t v4 = (PDOrientationOptions *)v9;
      if (v5 > 3)
      {
        uint64_t v10 = 0;
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v10 = *((unsigned int *)&xmmword_238EDD7E0 + v5);
        uint64_t v11 = dword_238EF0230[v5];
      }
      [(PDSplitDirectionOptions *)v9 setInOut:v11];
      [(PDOrientationOptions *)v4 setOrientation:v10];
      break;
    case 26:
      uint64_t v4 = objc_alloc_init(PDWheelDirectionOptions);
      [(PDOrientationOptions *)v4 setSpokes:v5];
      break;
    default:
      return v4;
  }
  return v4;
}

+ (unint64_t)authorIdForName:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = [a4 tgtPresentation];
  uint64_t v7 = [v6 commentAuthorCount];
  if (v7)
  {
    unint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [v6 commentAuthorAtIndex:v8];
      uint64_t v10 = [(id)v9 name];

      LOBYTE(v9) = [v10 isEqualToString:v5];
      if (v9) {
        break;
      }
      if (v7 == ++v8) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v8 = -1;
  }

  return v8;
}

+ (void)readComments:(id)a3 slide:(id)a4 state:(id)a5
{
  id v20 = a3;
  id v23 = a4;
  id v22 = a5;
  unint64_t v8 = +[PBProgTag binaryTagDataWithName:L"___PPT10" inProgTagsParent:v20];
  for (unsigned int i = 0; ; unsigned int i = v10 + 1)
  {
    unsigned int v10 = i;
    if (objc_msgSend(v8, "childCount", v20) <= (unint64_t)i) {
      break;
    }
    uint64_t v11 = [v8 childAt:i];
    uint64_t v12 = [v11 eshObject];
    if ((*(unsigned int (**)(uint64_t))(*(void *)v12 + 16))(v12) == 12000)
    {
      id v13 = v11;
      v14 = objc_alloc_init(PDComment);
      v15 = +[PBUtils readStringWithInstance:0 fromContainer:v13];
      if (v15)
      {
        [(PDComment *)v14 setAuthor:v15];
        -[PDComment setAuthorId:](v14, "setAuthorId:", [a1 authorIdForName:v15 state:v22]);
      }
      v16 = +[PBUtils readStringWithInstance:1 fromContainer:v13];
      if (v16) {
        [(PDComment *)v14 setText:v16];
      }
      BOOL v17 = [v13 firstChildOfType:12001];
      uint64_t v18 = [v17 eshObject];

      if (v18)
      {
        unint64_t v5 = v5 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(v18 + 60);
        v19 = NSDateWithCsDateTime(*(void *)(v18 + 52));
        [(PDComment *)v14 setDate:v19];
        -[PDComment setPosition:](v14, "setPosition:", (double)(*(_DWORD *)(v18 + 64) / 8), (double)(*(_DWORD *)(v18 + 68) / 8));
        [(PDComment *)v14 setIndex:(*(_DWORD *)(v18 + 48) - 1)];
      }
      [v23 addComment:v14];
    }
  }
}

+ (id)nonPlaceholderDrawablesAmongDrawables:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v10 = objc_msgSend(v9, "clientData", (void)v13);
        uint64_t v11 = [v10 placeholder];

        if (!v11 || [v11 type] == -1) {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (unsigned)mapDirection:(id)a3
{
  id v3 = a3;
  if ([v3 type])
  {
    if ([v3 hasTransitionOptions])
    {
      uint64_t v4 = [v3 options];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v5 = [v4 spokes];
        if (v5 < 8)
        {
          unint64_t v6 = 0x706050402030001uLL >> (8 * v5);
LABEL_32:

          goto LABEL_33;
        }
LABEL_31:
        LOBYTE(v6) = 0;
        goto LABEL_32;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        LOBYTE(v6) = [v4 isThroughBlack];
        goto LABEL_32;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v7 = [v4 orientation] == 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v8 = [v4 orientation];
            int v9 = [v4 inOut];
            if (v9 == 1) {
              char v10 = 2;
            }
            else {
              char v10 = 3;
            }
            if (v8) {
              LOBYTE(v6) = v10;
            }
            else {
              LOBYTE(v6) = v9 != 1;
            }
            goto LABEL_32;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            unsigned int v11 = [v4 direction];
            if (v11 < 8)
            {
              unint64_t v6 = 0x706050402030001uLL >> (8 * v11);
              goto LABEL_32;
            }
          }
          goto LABEL_31;
        }
        if ([v3 type] == 4) {
          goto LABEL_31;
        }
        BOOL v7 = [v4 inOut] == 0;
      }
      LOBYTE(v6) = v7;
      goto LABEL_32;
    }
    LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = 2;
  }
LABEL_33:

  return v6;
}

@end