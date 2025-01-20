@interface GQHParagraphStyle
+ (const)name;
+ (void)mapStyle:(id)a3 style:(id)a4 state:(id)a5;
@end

@implementation GQHParagraphStyle

+ (void)mapStyle:(id)a3 style:(id)a4 state:(id)a5
{
  uint64_t v36 = 0;
  float v35 = 0.0;
  unsigned __int8 v9 = [a3 overridesFloatProperty:23 value:&v36];
  unsigned int v10 = [a3 overridesFloatProperty:24 value:&v35];
  if ((v9 & 1) != 0 || v10) {
    [a4 addAttribute:off_9CF38 pxValue:llroundf(*(float *)&v36 - v35)];
  }
  id v34 = 0;
  unsigned int v33 = 0;
  if ([a3 overridesIntProperty:29 value:&v33])
  {
    if (v33 > 4) {
      v11 = &off_9CFC8;
    }
    else {
      v11 = off_80810[v33];
    }
    [a4 addAttribute:off_9CF30 value:*v11];
  }
  v12 = objc_alloc_init(GQHTrbl);
  unsigned int v13 = [a3 overridesFloatProperty:24 value:(char *)&v36 + 4];
  if (v13) {
    [(GQHTrbl *)v12 setLeft:llroundf(*((float *)&v36 + 1))];
  }
  if (([a3 overridesFloatProperty:25 value:(char *)&v36 + 4] & 1) == 0)
  {
    if (([a5 useOutline] & 1) == 0)
    {
      if (!v13) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  [(GQHTrbl *)v12 setRight:llroundf(*((float *)&v36 + 1))];
  if ([a5 useOutline])
  {
LABEL_15:
    unsigned int v14 = [a5 outlineLevel];
    if ([a5 outlineStyleType] == 1) {
      ++v14;
    }
    unsigned int v15 = [(GQHTrbl *)v12 left];
    [(GQHTrbl *)v12 setLeft:v15 + v14 * dword_9D2A8];
  }
LABEL_18:
  [a4 addAttribute:off_9CEF0 trblValue:v12];
LABEL_19:

  uint64_t v32 = 0;
  if ([a3 overridesObjectProperty:36 value:&v32])
  {
    if (v32)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [a5 setColoredBackground:1];
        id v16 = [a5 getColorString:v32];
        [a4 addAttribute:off_9CE08 value:v16];
      }
    }
  }
  if ([a3 overridesFloatProperty:30 value:(char *)&v36 + 4])
  {
    unint64_t v17 = llroundf(*((float *)&v36 + 1));
    v18 = &off_9CED0;
    if (v32 && *((float *)&v36 + 1) > 0.0)
    {
      [a4 addAttribute:off_9CF10 intValue:v17];
      unint64_t v17 = 0;
      v18 = &off_9CEB0;
    }
    [a4 addAttribute:*v18 intValue:v17];
  }
  if ([a3 overridesFloatProperty:31 value:(char *)&v36 + 4])
  {
    unint64_t v19 = llroundf(*((float *)&v36 + 1));
    if (v32 && *((float *)&v36 + 1) > 0.0)
    {
      [a4 addAttribute:off_9CEF8 intValue:v19];
      unint64_t v19 = 0;
    }
    [a4 addAttribute:off_9CEB8 intValue:v19];
  }
  v31.receiver = a1;
  v31.super_class = (Class)&OBJC_METACLASS___GQHParagraphStyle;
  objc_msgSendSuper2(&v31, "mapStyle:style:state:", a3, a4, a5);
  if ([a3 overridesObjectProperty:28 value:&v34])
  {
    int v30 = 0;
    if ([a4 getAttribute:off_9CEA8 intValue:&v30])
    {
      int v20 = v30;
    }
    else
    {
      uint64_t v29 = 0;
      if (([a3 hasValueForObjectProperty:1 value:&v29] & 1) == 0) {
        objc_msgSend(objc_msgSend(a5, "implicitStyle"), "hasValueForObjectProperty:value:", 1, &v29);
      }
      float v28 = -1.0;
      if (([a3 hasValueForFloatProperty:2 value:&v28] & 1) == 0) {
        objc_msgSend(objc_msgSend(a5, "implicitStyle"), "hasValueForFloatProperty:value:", 2, &v28);
      }
      int v20 = -1;
      if (v29)
      {
        *(float *)&double v21 = v28;
        if (v28 > -1.0)
        {
          if (objc_msgSend(a1, "getDefaultLineHeight:fontSize:defLineHeight:", v21)) {
            int v20 = 0;
          }
          else {
            int v20 = -1;
          }
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v22 = [v34 mode];
      [v34 amount];
      if (v22 == 4)
      {
        if (v20 < 0)
        {
          v27 = @"1";
          goto LABEL_57;
        }
        CFAllocatorRef v24 = kCFAllocatorDefault;
        float v25 = v23 + (float)v20;
      }
      else
      {
        CFAllocatorRef v24 = kCFAllocatorDefault;
        if (v22)
        {
LABEL_55:
          CFStringRef v26 = CFStringCreateWithFormat(v24, 0, @"%ldpx", llroundf(v23));
LABEL_56:
          v27 = (__CFString *)v26;
LABEL_57:
          [a4 addAttribute:off_9CEA8 value:v27];
          CFRelease(v27);
          return;
        }
        if (v20 < 0)
        {
          CFStringRef v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%.2f", v23);
          goto LABEL_56;
        }
        float v25 = v23 * (float)v20;
      }
      float v23 = ceilf(v25);
      goto LABEL_55;
    }
  }
}

+ (const)name
{
  return "p";
}

@end