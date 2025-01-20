@interface GQHTextBox
+ (BOOL)outputWrapSandbagsForFrame:(CGRect)a3 columnCount:(int)a4 drawable:(id)a5 state:(id)a6 isPageFrame:(BOOL)a7;
+ (BOOL)styleNeedsImageFillMapping:(id)a3;
+ (const)name;
+ (int)handleLayoutStorage:(id)a3 state:(id)a4;
+ (int)handleShapeText:(id)a3 boundsRect:(CGRect)a4 floating:(BOOL)a5 state:(id)a6;
+ (int)outputInnerSandbagsForFrame:(CGRect)a3 drawable:(id)a4 state:(id)a5;
+ (int)outputInnerSandbagsForShape:(id)a3 layoutStyle:(id)a4 state:(id)a5;
+ (int)outputWrapSandbagsForFrame:(CGRect)a3 columnCount:(int)a4 drawable:(id)a5 state:(id)a6;
+ (int)outputWrapSandbagsForShape:(id)a3 layoutStyle:(id)a4 state:(id)a5;
+ (void)createExternalWrapSandbagStyles:(id)a3;
+ (void)mapLayout:(id)a3 style:(id)a4 state:(id)a5;
+ (void)mapScaledImageFill:(id)a3 style:(id)a4 size:(CGSize)a5;
+ (void)mapStyle:(id)a3 style:(id)a4 state:(id)a5;
+ (void)outputSandbag:(id)a3 state:(id)a4;
@end

@implementation GQHTextBox

+ (void)mapStyle:(id)a3 style:(id)a4 state:(id)a5
{
  unsigned int v7 = 0;
  if ([a3 overridesIntProperty:50 value:&v7]
    && ([a5 multiColumned] & 1) == 0)
  {
    [a4 addAttribute:off_9CE60 value:@"table-cell"];
    if (v7 <= 3) {
      [a4 addAttribute:off_9CF58 value:*off_80838[v7]];
    }
  }
}

+ (int)handleShapeText:(id)a3 boundsRect:(CGRect)a4 floating:(BOOL)a5 state:(id)a6
{
  BOOL v7 = a5;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = objc_msgSend(a6, "htmlDoc", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  id v13 = [a3 geometry];
  id v14 = [a3 layoutFrame];
  id v15 = [v14 layoutStyle];
  if (!v15)
  {
    CFArrayRef v16 = (const __CFArray *)objc_msgSend(objc_msgSend(v14, "storage"), "body");
    if (v16 && (CFArrayRef v17 = v16, CFArrayGetCount(v16) == 1))
    {
      ValueAtIndedouble x = (void *)CFArrayGetValueAtIndex(v17, 0);
      objc_opt_class();
      id v15 = 0;
      if (objc_opt_isKindOfClass()) {
        id v15 = [ValueAtIndex layoutStyle];
      }
    }
    else
    {
      id v15 = 0;
    }
  }
  v51 = v12;
  objc_msgSend(v12, "startElement:", "div", v14);
  v19 = objc_alloc_init(GQHStyle);
  [(GQHStyle *)v19 addAttribute:off_9CF18 value:off_9CFA0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(GQHStyle *)v19 addAttribute:off_9CEE8 value:off_9CFE8];
    [(GQHStyle *)v19 addAttribute:off_9CF70 value:off_9CFB8];
  }
  if (v7)
  {
    [v13 position];
    double v21 = x + v20;
    [v13 position];
    +[GQHBounds mapPosition:srcGraphicStyle:style:state:](GQHBounds, "mapPosition:srcGraphicStyle:style:state:", [a3 graphicStyle], v19, a6, v21, y + v22);
    [v13 size];
    double v24 = v23;
    double v26 = v25;
    [v13 angle];
    LODWORD(v28) = v27;
    +[GQHBounds mapSize:angle:srcGraphicStyle:style:state:](GQHBounds, "mapSize:angle:srcGraphicStyle:style:state:", 0, v19, a6, v24, v26, v28);
    +[GQHBounds setTransformOriginToZeroInStyle:v19];
  }
  else
  {
    [v13 size];
    double v30 = v29;
    double v32 = v31;
    [v13 angle];
    LODWORD(v34) = v33;
    +[GQHBounds mapSize:angle:srcGraphicStyle:style:state:](GQHBounds, "mapSize:angle:srcGraphicStyle:style:state:", 0, v19, a6, v30, v32, v34);
  }
  [a1 mapStyle:v15 style:v19 state:a6];
  [a1 mapLayout:v15 style:v19 state:a6];
  if (v7)
  {
    if (([a3 hasPagesOrder] & 1) != 0
      || [a6 drawablesNeedCssZOrdering])
    {
      -[GQHStyle addClass:](v19, "addClass:", [a6 cssZOrderClassForDrawable:a3]);
    }
    [(GQHStyle *)v19 setStyleOnCurrentNode:a6 mappingBaseStyleClass:v15 baseClassType:objc_opt_class()];

    unsigned int v53 = 0;
    int v35 = 0;
    v36 = v51;
    if ([v15 hasValueForIntProperty:50 value:&v53])
    {
      v37 = objc_alloc_init(GQHStyle);
      [v51 startElement:"div"];
      [v13 size];
      float v39 = v38;
      [v13 size];
      float v41 = v40;
      id v52 = 0;
      if ([v15 hasValueForObjectProperty:47 value:&v52])
      {
        [v52 left];
        float v43 = v42;
        [v52 right];
        float v41 = v41 - fminf(v43 + v44, 4.0);
        [v52 top];
        float v46 = v45;
        [v52 bottom];
        float v39 = v39 - fminf(v46 + v47, 4.0);
      }
      [(GQHStyle *)v37 addAttribute:off_9CE98 pxValue:llroundf(v39)];
      [(GQHStyle *)v37 addAttribute:off_9CF68 pxValue:llroundf(v41)];
      [(GQHStyle *)v37 addAttribute:off_9CE60 value:@"table-cell"];
      if (v53 <= 3) {
        [(GQHStyle *)v37 addAttribute:off_9CF58 value:*off_80838[v53]];
      }
      [(GQHStyle *)v37 setStyleOnCurrentNode:a6];

      int v35 = 1;
    }
  }
  else
  {
    [(GQHStyle *)v19 setStyleOnCurrentNode:a6 mappingBaseStyleClass:v15 baseClassType:objc_opt_class()];

    int v35 = 0;
    unsigned int v53 = 0;
    v36 = v51;
  }
  [a1 outputInnerSandbagsForShape:a3 layoutStyle:v15 state:a6];
  int v48 = [a1 outputWrapSandbagsForShape:a3 layoutStyle:v15 state:a6];
  if (v48 == 1) {
    int v48 = objc_msgSend(a1, "handleLayoutStorage:state:", objc_msgSend(v50, "storage"), a6);
  }
  if (v35) {
    [v36 endElementWithExpectedName:"div"];
  }
  [v36 endElementWithExpectedName:"div"];
  return v48;
}

+ (int)handleLayoutStorage:(id)a3 state:(id)a4
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFArrayRef v7 = (const __CFArray *)[a3 body];
  if (!v7
    || (CFArrayRef v8 = v7, CFArrayGetCount(v7) == 1)
    && (ValueAtIndedouble x = (void *)CFArrayGetValueAtIndex(v8, 0), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (CFArrayRef v8 = (const __CFArray *)[ValueAtIndex children]) == 0)
  {
    [a4 setParagraphCount:0];
    goto LABEL_16;
  }
  CFIndex Count = CFArrayGetCount(v8);
  [a4 setParagraphCount:Count];
  if (!Count)
  {
LABEL_16:
    int v14 = 1;
    goto LABEL_18;
  }
  CFIndex v11 = 0;
  unint64_t v12 = Count;
  while (1)
  {
    [a4 setParagraphIndex:v11];
    id v13 = (void *)CFArrayGetValueAtIndex(v8, v11);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    if [a4 useOutline] && (objc_msgSend(v13, "isHidden")) {
      int v14 = 1;
    }
    else {
      int v14 = +[GQHParagraph handleParagraph:state:bulletStates:isMultiColumn:](GQHParagraph, "handleParagraph:state:bulletStates:isMultiColumn:", v13, a4, Mutable, [a4 multiColumned]);
    }
    if (++v11 >= v12 || v14 != 1) {
      goto LABEL_18;
    }
  }
  int v14 = 3;
LABEL_18:
  [a4 setParagraphCount:0];
  [a4 setParagraphIndex:0];
  CFRelease(Mutable);
  return v14;
}

+ (const)name
{
  return "l";
}

+ (void)mapLayout:(id)a3 style:(id)a4 state:(id)a5
{
  uint64_t v43 = 0;
  id v44 = 0;
  if ([a4 getAttribute:off_9CF68 intValue:(char *)&v43 + 4]
    && [a4 getAttribute:off_9CE98 intValue:&v43])
  {
    if ([a3 hasValueForObjectProperty:49 value:&v44])
    {
      CFArrayRef v8 = (const __CFArray *)[v44 columns];
      unsigned __int8 v9 = [v44 equalColumns];
      CFIndex Count = CFArrayGetCount(v8);
      CFIndex v11 = Count;
      if ((int)Count >= 2)
      {
        if (v9)
        {
          ValueAtIndedouble x = (void *)CFArrayGetValueAtIndex(v8, 0);
          float v13 = 1.0;
          if ([ValueAtIndex hasSpacing])
          {
            [ValueAtIndex spacing];
            float v13 = v14;
          }
        }
        else
        {
          CFIndex v15 = 0;
          int v16 = 0;
          int v17 = 0;
          CFIndex v39 = Count;
          uint64_t v18 = Count;
          do
          {
            v19 = (void *)CFArrayGetValueAtIndex(v8, v15);
            if ([v19 hasSpacing])
            {
              ++v16;
              [v19 spacing];
              int v17 = (int)(float)(v20 + (float)v17);
            }
            ++v15;
          }
          while (v18 != v15);
          if (v16) {
            float v13 = (float)(v17 / v16);
          }
          else {
            float v13 = 1.0;
          }
          CFIndex v11 = v39;
        }
        objc_msgSend(a5, "setMultiColumned:", 1, v39);
        [a4 addAttribute:@"-webkit-column-count" intValue:v11];
        [a4 addAttribute:@"-webkit-column-gap" pxValue:llroundf(v13 * (float)SHIDWORD(v43))];
        [a4 addAttribute:off_9CEE8 value:off_9CFE8];
      }
    }
    id v42 = 0;
    if ([a3 hasValueForObjectProperty:47 value:&v42])
    {
      [v42 top];
      double v22 = v21;
      [a5 scale];
      float v24 = v23 * v22;
      [v42 bottom];
      double v26 = v25;
      [a5 scale];
      float v28 = v27 * v26;
      [v42 left];
      double v30 = v29;
      [a5 scale];
      float v32 = v31 * v30;
      [v42 right];
      double v34 = v33;
      [a5 scale];
      float v36 = v35 * v34;
      if (v32 > 2.0) {
        float v32 = 2.0;
      }
      if (v36 <= 2.0) {
        float v37 = v36;
      }
      else {
        float v37 = 2.0;
      }
      if (v24 > 2.0) {
        float v24 = 2.0;
      }
      if (v28 > 2.0) {
        float v28 = 2.0;
      }
      double v38 = objc_alloc_init(GQHTrbl);
      [(GQHTrbl *)v38 setTop:(int)v24 right:(int)v37 bottom:(int)v28 left:(int)v32];
      [a4 addAttribute:off_9CEF0 trblValue:v38];

      [a4 addAttribute:off_9CF68 pxValue:(int)(float)((float)((float)SHIDWORD(v43) - v32) - v37)];
      CFStringRef theString1 = 0;
      int v40 = 0;
      if (![a3 hasValueForIntProperty:50 value:&v40]
        || ([a5 multiColumned] & 1) != 0
        || [a4 getAttribute:off_9CF18 value:&theString1]
        && CFStringCompare(theString1, off_9CFA0, 1uLL) == kCFCompareEqualTo)
      {
        [a4 addAttribute:off_9CE98 pxValue:(int)(float)((float)((float)(int)v43 - v24) - v28)];
      }
    }
  }
}

+ (BOOL)styleNeedsImageFillMapping:(id)a3
{
  uint64_t v5 = 0;
  unsigned int v3 = [a3 hasValueForObjectProperty:67 value:&v5];
  if (v3)
  {
    objc_opt_class();
    LOBYTE(v3) = objc_opt_isKindOfClass();
  }
  return v3 & 1;
}

+ (void)mapScaledImageFill:(id)a3 style:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v22 = 0;
  if ([a3 hasValueForObjectProperty:67 value:&v22])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v8 = [v22 technique];
      id v9 = [v22 imageBinary];
      if (v9)
      {
        [v9 size];
        if (v8 == 3)
        {
          float v15 = width / v10;
          float v16 = height / v11;
          float v14 = fmaxf(v15, v16);
        }
        else
        {
          if (v8 != 4) {
            return;
          }
          float v12 = width / v10;
          float v13 = height / v11;
          float v14 = fminf(v12, v13);
        }
        if (v14 != 0.0)
        {
          double v17 = v14;
          float v18 = v10 * v17;
          unint64_t v19 = llroundf(v18);
          float v20 = v11 * v17;
          CFStringRef v21 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%ldpx %ldpx", v19, llroundf(v20));
          [a4 addAttribute:off_9CF78 value:v21];
          [a4 addAttribute:off_9CF80 value:v21];
          CFRelease(v21);
        }
      }
    }
  }
}

+ (void)createExternalWrapSandbagStyles:(id)a3
{
  CFStringRef v4 = CFStringCreateWithFormat(0, 0, @".%@ {float: %s; clear: %s; padding: 0; width: 0px; height: 10px;}\n\n",
         off_9D2B0[0],
         "left",
         "left");
  [a3 addStyleClass:v4];
  CFRelease(v4);
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, @".%@ {float: %s; clear: %s; padding: 0; width: 0px; height: 10px;}\n\n",
         off_9D2B8[0],
         "right",
         "right");
  [a3 addStyleClass:v5];
  CFRelease(v5);
}

+ (int)outputWrapSandbagsForFrame:(CGRect)a3 columnCount:(int)a4 drawable:(id)a5 state:(id)a6
{
  return 1;
}

+ (BOOL)outputWrapSandbagsForFrame:(CGRect)a3 columnCount:(int)a4 drawable:(id)a5 state:(id)a6 isPageFrame:(BOOL)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  id v13 = [a6 processorState];
  if ([a5 hasPagesOrder]) {
    id v14 = [a5 pagesOrder];
  }
  else {
    id v14 = 0;
  }
  if (a4 >= 1)
  {
    float v15 = width / (float)a4;
    float v16 = (float)(10 * ((int)(y + 9.0) / 10)) + 10.0;
    int v17 = 1;
    do
    {
      int v58 = v17;
      if (v15 >= 0.1 && v16 <= (float)(10 * ((int)(y + height) / 10)))
      {
        float v18 = x + (float)(v15 * (float)(v17 - 1));
        float v19 = x + (float)(v15 * (float)v17);
        id v20 = objc_msgSend(v13, "currentWrapPointGenerator", a1);
        *(float *)&double v21 = v16;
        *(float *)&double v22 = v18;
        *(float *)&double v23 = v19;
        float v24 = (void **)[v20 createListOfWrapPointsAlongY:v14 minX:v21 maxX:v22 zIndex:v23];
        float v25 = (char *)*v24;
        double v26 = (char *)v24[1];
        if (*v24 == v26)
        {
          float v37 = v16 - y;
          float v32 = v37;
          float v33 = 0.0;
          float v38 = 0.0;
          goto LABEL_40;
        }
        uint64_t v27 = 0;
        uint64_t v28 = 0;
        while (1)
        {
          uint64_t v29 = *(void *)v25;
          if (*(id *)(*(void *)v25 + 32) != a5)
          {
            int v30 = *(_DWORD *)(v29 + 40);
            if (v30)
            {
              if (v30 != 2)
              {
                float v46 = v16 - y;
                float v32 = v46;
                goto LABEL_42;
              }
              if (!v28 || *(double *)(v29 + 8) > *(double *)(v28 + 8)) {
                uint64_t v28 = *(void *)v25;
              }
            }
            else if (!v27 || *(double *)(v29 + 8) < *(double *)(v27 + 8))
            {
              uint64_t v27 = *(void *)v25;
            }
          }
          v25 += 8;
          if (v25 == v26)
          {
            float v31 = v16 - y;
            float v32 = v31;
            float v33 = 0.0;
            if (v28)
            {
              double v34 = *(double *)(v28 + 8);
              if (*(float *)(v28 + 24) == 0.0 || ((float v35 = v34, v35 > v18) ? (v36 = v35 < v19) : (v36 = 0), v36))
              {
                LOBYTE(v28) = 0;
                float v39 = v34 - v18;
                float v33 = (float)(uint64_t)llroundf(v39);
              }
              else
              {
                LOBYTE(v28) = 1;
              }
            }
            if (v27)
            {
              double v40 = *(double *)(v27 + 8);
              if (*(float *)(v27 + 24) == 0.0 || ((float v41 = v40, v41 > v18) ? (v42 = v41 < v19) : (v42 = 0), v42))
              {
                if ((v28 & 1) == 0)
                {
                  float v43 = v19 - v40;
                  float v38 = (float)(uint64_t)llroundf(v43);
                  goto LABEL_40;
                }
              }
LABEL_42:
              float v44 = v15;
              float v45 = v15;
            }
            else
            {
              float v38 = 0.0;
              float v44 = v15;
              float v45 = v15;
              if ((v28 & 1) == 0)
              {
LABEL_40:
                float v44 = v33;
                float v45 = v38;
              }
            }
            float v47 = v44 + v45;
            if (v44 <= v45) {
              float v48 = v44;
            }
            else {
              float v48 = 0.0;
            }
            if (v47 >= v15) {
              float v49 = v48;
            }
            else {
              float v49 = v44;
            }
            if (v47 >= v15 && v44 <= v45) {
              float v51 = 0.0;
            }
            else {
              float v51 = v45;
            }
            double v52 = v32;
            unsigned int v53 = -[GQHWrapSandbag initWithSize:floatsLeft:]([GQHWrapSandbag alloc], "initWithSize:floatsLeft:", 1, v49, v52);
            CFArrayAppendValue(Mutable, v53);

            v54 = -[GQHWrapSandbag initWithSize:floatsLeft:]([GQHWrapSandbag alloc], "initWithSize:floatsLeft:", 0, v51, v52);
            CFArrayAppendValue(Mutable, v54);

            v60 = v24;
            sub_36274(&v60);
            operator delete();
          }
        }
      }
      ++v17;
      float v16 = (float)(10 * ((int)(y + 9.0) / 10)) + 10.0;
    }
    while (v58 != a4);
  }
  CFRelease(Mutable);
  return 0;
}

+ (int)outputInnerSandbagsForFrame:(CGRect)a3 drawable:(id)a4 state:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  float v13 = (float)(10 * ((int)(y + 9.0) / 10));
  double v37 = y;
  float v14 = (float)(10 * ((int)(y + height) / 10));
  if ([a4 hasPagesOrder]) {
    uint64_t v16 = [a4 pagesOrder] - 1;
  }
  else {
    uint64_t v16 = 0xFFFFFFFFLL;
  }
  float v17 = v13 + 10.0;
  if ((float)(v13 + 10.0) <= v14)
  {
    float v18 = x;
    float v19 = x + width;
    float v35 = v19;
    float v36 = v18;
    double v20 = v18;
    double v21 = v19;
    *(float *)&double v21 = v13 + 10.0;
    *(float *)&double v15 = v35;
    *(float *)&double v20 = v36;
    double v22 = (void **)objc_msgSend(a4, "createListOfWrapPointsAlongY:minX:maxX:zIndex:", v16, v21, v20, v15, a1, a5);
    double v23 = (char *)*v22;
    float v24 = (char *)v22[1];
    if (*v22 != v24)
    {
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      while (1)
      {
        uint64_t v27 = *(void *)v23;
        if (*(id *)(*(void *)v23 + 32) == a4)
        {
          int v28 = *(_DWORD *)(v27 + 40);
          if (v28)
          {
            if (v28 != 2)
            {
              float v32 = v17 - v37;
              float v30 = v32;
LABEL_20:
              float v33 = -[GQHWrapSandbag initWithSize:floatsLeft:]([GQHWrapSandbag alloc], "initWithSize:floatsLeft:", 1, width, v30);
              CFArrayAppendValue(Mutable, v33);

              float v38 = v22;
              sub_36274(&v38);
              operator delete();
            }
            if (!v25 || *(double *)(v27 + 8) < *(double *)(v25 + 8)) {
              uint64_t v25 = *(void *)v23;
            }
          }
          else if (!v26 || *(double *)(v27 + 8) > *(double *)(v26 + 8))
          {
            uint64_t v26 = *(void *)v23;
          }
        }
        v23 += 8;
        if (v23 == v24)
        {
          float v29 = v17 - v37;
          float v30 = v29;
          goto LABEL_20;
        }
      }
    }
    float v31 = v17 - v37;
    float v30 = v31;
    goto LABEL_20;
  }
  CFRelease(Mutable);
  return 1;
}

+ (void)outputSandbag:(id)a3 state:(id)a4
{
  float v6 = *((double *)a3 + 1);
  unint64_t v7 = llroundf(v6);
  float v8 = *((double *)a3 + 2);
  unint64_t v9 = llroundf(v8);
  id v10 = [a4 htmlDoc];
  [v10 startElement:"div"];
  double v11 = objc_alloc_init(GQHStyle);
  float v12 = v11;
  float v13 = off_9D2B0;
  if (!*((unsigned char *)a3 + 24)) {
    float v13 = off_9D2B8;
  }
  [(GQHStyle *)v11 addClass:*v13];
  if (v7) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = v9 == 10;
  }
  if (!v14)
  {
    if (v9 != 10) {
      [(GQHStyle *)v12 addAttribute:off_9CE98 pxValue:v9];
    }
    if (v7) {
      [(GQHStyle *)v12 addAttribute:off_9CF68 pxValue:v7];
    }
  }
  [(GQHStyle *)v12 setStyleOnCurrentNode:a4];

  [v10 endElement];
}

+ (int)outputInnerSandbagsForShape:(id)a3 layoutStyle:(id)a4 state:(id)a5
{
  if (objc_msgSend(objc_msgSend(a3, "layoutFrame"), "isBlank")) {
    return 1;
  }
  id v9 = [a3 geometry];
  [v9 position];
  double v11 = v10;
  double v13 = v12;
  [v9 size];
  return objc_msgSend(a1, "outputInnerSandbagsForFrame:drawable:state:", a3, a5, v11, v13, v14, v15);
}

+ (int)outputWrapSandbagsForShape:(id)a3 layoutStyle:(id)a4 state:(id)a5
{
  id v9 = [a3 layoutFrame];
  double v10 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "processorState"), "currentWrapPointGenerator"), "wrapPoints");
  if (!v10 || !v10[2] || ([v9 isBlank] & 1) != 0) {
    return 1;
  }
  id v12 = [a3 geometry];
  [v12 position];
  double v14 = v13;
  double v16 = v15;
  [v12 size];
  double v18 = v17;
  double v20 = v19;
  id v23 = 0;
  unsigned int v21 = [a4 hasValueForObjectProperty:49 value:&v23];
  CFIndex Count = 1;
  if (v21)
  {
    if (v23) {
      CFIndex Count = CFArrayGetCount((CFArrayRef)objc_msgSend(v23, "columns", 1));
    }
  }
  return objc_msgSend(a1, "outputWrapSandbagsForFrame:columnCount:drawable:state:", Count, a3, a5, v14, v16, v18, v20);
}

@end