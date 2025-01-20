@interface GQHGraphicStyle
+ (const)name;
+ (int)strokeWidth:(id)a3;
+ (void)mapExternalWrap:(id)a3 style:(id)a4 state:(id)a5;
+ (void)mapFill:(id)a3 style:(id)a4 state:(id)a5;
+ (void)mapStroke:(id)a3 toBorderType:(int)a4 style:(id)a5 state:(id)a6;
+ (void)mapStyle:(id)a3 style:(id)a4 state:(id)a5;
+ (void)mapStyle:(id)a3 style:(id)a4 state:(id)a5 suppressNullFillOverride:(BOOL)a6;
@end

@implementation GQHGraphicStyle

+ (void)mapStyle:(id)a3 style:(id)a4 state:(id)a5
{
}

+ (void)mapStyle:(id)a3 style:(id)a4 state:(id)a5 suppressNullFillOverride:(BOOL)a6
{
  uint64_t v14 = 0;
  if ([a3 overridesObjectProperty:67 value:&v14] && (v14 || !a6)) {
    objc_msgSend(a1, "mapFill:style:state:");
  }
  uint64_t v14 = 0;
  if ([a3 overridesObjectProperty:68 value:&v14]) {
    [a1 mapStroke:v14 toBorderType:0 style:a4 state:a5];
  }
  uint64_t v14 = 0;
  if ([a3 overridesObjectProperty:72 value:&v14]) {
    [a1 mapExternalWrap:v14 style:a4 state:a5];
  }
  float v13 = 1.0;
  if ([a3 overridesFloatProperty:69 value:&v13])
  {
    CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"%.2f", v13);
    [a4 addAttribute:off_9CEE0 value:v11];
    CFRelease(v11);
  }
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___GQHGraphicStyle;
  objc_msgSendSuper2(&v12, "mapStyle:style:state:", a3, a4, a5);
}

+ (void)mapExternalWrap:(id)a3 style:(id)a4 state:(id)a5
{
  if ([a3 inlineWrapEnabled] && objc_msgSend(a5, "allowInlineWrap"))
  {
    unsigned int v8 = [a3 wrapDirection];
    v9 = off_9CE68;
    v10 = &off_9D010;
    if (v8 != 1) {
      v10 = &off_9D050;
    }
    CFStringRef v11 = *v10;
    [a4 addAttribute:v9 value:v11];
  }
}

+ (void)mapFill:(id)a3 style:(id)a4 state:(id)a5
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = a5;
    id v9 = a3;
LABEL_3:
    id v10 = [v8 getColorString:v9];
    [a4 addAttribute:off_9CE08 value:v10];
    [a4 addAttribute:off_9CE10 value:off_9D028];
LABEL_4:
    uint64_t v11 = 1;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_23;
    }
    id v16 = [a3 imageBinary];
    id v17 = [a3 color];
    if (v17)
    {
      id v18 = [a5 getColorString:v17];
      [a4 addAttribute:off_9CE08 value:v18];
    }
    CFURLRef v19 = (const __CFURL *)objc_msgSend(v16, "createAbsoluteUrlForState:", objc_msgSend(a5, "processorState"));
    if (!v19)
    {
      if (v17) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
    CFURLRef v20 = v19;
    CFStringRef v21 = CFURLGetString(v19);
    CFMutableStringRef v22 = sub_425E4(v21);
    CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"url(\"%@\")", v22);
    CFRelease(v22);
    [a4 addAttribute:off_9CE10 value:v23];
    CFRelease(v23);
    [v16 size];
    double v25 = v24;
    double v27 = v26;
    unsigned int v28 = [a3 technique];
    [a4 addAttribute:off_9CE18 value:off_9D030];
    [a4 addAttribute:off_9CF88 value:off_9CFC8];
    if (v28 - 3 < 2 || v28 == 1)
    {
      [a4 addAttribute:off_9CF78 value:@"100%"];
      v29 = off_9CF80;
      id v31 = a4;
      v30 = @"100%";
    }
    else
    {
      if (v28 != 2)
      {
        float v35 = v25;
        unint64_t v36 = llroundf(v35);
        float v37 = v27;
        CFStringRef v38 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%ldpx %ldpx", v36, llroundf(v37));
        [a4 addAttribute:off_9CF78 value:v38];
        [a4 addAttribute:off_9CF80 value:v38];
        CFRelease(v38);
        goto LABEL_30;
      }
      [a4 addAttribute:off_9CE18 value:off_9D048];
      v29 = off_9CF88;
      v30 = @"top left";
      id v31 = a4;
    }
    [v31 addAttribute:v29 value:v30];
LABEL_30:
    CFRelease(v20);
    goto LABEL_4;
  }
  CFArrayRef v12 = (const __CFArray *)[a3 stops];
  unsigned int v13 = [a3 type];
  CFIndex Count = CFArrayGetCount(v12);
  if (v13 == 1 && Count >= 1)
  {
    id v15 = objc_msgSend((id)CFArrayGetValueAtIndex(v12, 0), "color");
  }
  else
  {
    if (v13 || Count < 2) {
      goto LABEL_23;
    }
    float v32 = (float)((float)Count + -1.0) * 0.5;
    signed int v33 = vcvtps_s32_f32(v32);
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v12, (int)vcvtms_s32_f32(v32));
    id v15 = objc_msgSend(objc_msgSend(ValueAtIndex, "color"), "blendedColorWithFraction:ofColor:", objc_msgSend((id)CFArrayGetValueAtIndex(v12, v33), "color"), 0.5);
  }
  id v9 = v15;
  if (v15)
  {
    id v8 = a5;
    goto LABEL_3;
  }
LABEL_23:
  [a4 addAttribute:off_9CE08 value:off_9D080];
  [a4 addAttribute:off_9CE10 value:off_9D028];
  uint64_t v11 = 0;
LABEL_24:
  [a5 setColoredBackground:v11];
}

+ (const)name
{
  return "g";
}

+ (void)mapStroke:(id)a3 toBorderType:(int)a4 style:(id)a5 state:(id)a6
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return;
  }
  id v10 = [a3 pattern];
  Mutable = CFStringCreateMutable(0, 0);
  if (v10 && [v10 type] == 2)
  {
    CFArrayRef v12 = &off_9D028;
LABEL_12:
    CFStringRef v15 = *v12;
    goto LABEL_13;
  }
  uint64_t v13 = +[GQHGraphicStyle strokeWidth:a3];
  CFStringAppend(Mutable, (CFStringRef)objc_msgSend(a6, "getColorString:", objc_msgSend(a3, "color")));
  CFStringAppend(Mutable, @" ");
  CFStringRef v14 = CFStringCreateWithFormat(0, 0, @"%d ", v13);
  CFStringAppend(Mutable, v14);
  CFRelease(v14);
  CFStringRef v15 = off_9CFE8;
  if (v10)
  {
    unsigned int v16 = [v10 type];
    if (!v16)
    {
      CFArrayRef v12 = &off_9CFD8;
      goto LABEL_12;
    }
    if (v16 == 1)
    {
      CFArrayRef v12 = &off_9D060;
      goto LABEL_12;
    }
  }
LABEL_13:
  CFStringAppend(Mutable, v15);
  if (a4 <= 4) {
    [a5 addAttribute:*off_807E0[a4] value:Mutable];
  }
  CFRelease(Mutable);
}

+ (int)strokeWidth:(id)a3
{
  [a3 width];
  int v5 = llroundf(v4);
  if (!v5)
  {
    [a3 width];
    int v5 = v6 > 0.01;
  }
  id v7 = [a3 pattern];
  if ([v7 type] == 2 || v7 == 0) {
    return 0;
  }
  else {
    return v5;
  }
}

@end