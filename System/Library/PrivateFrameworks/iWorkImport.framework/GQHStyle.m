@interface GQHStyle
+ (void)appendParentClass:(__CFString *)a3 style:(id)a4 classType:(Class)a5 state:(id)a6;
+ (void)createBaseStyleClassString:(id)a3 classString:(__CFString *)a4 classType:(Class)a5 state:(id)a6;
+ (void)createBaseStyleClassesString:(__CFArray *)a3 classString:(__CFString *)a4 classTypes:(__CFArray *)a5 state:(id)a6;
+ (void)setSingleStyleAttribute:(__CFString *)a3 intValue:(int)a4 node:(id)a5;
+ (void)setSingleStyleAttribute:(__CFString *)a3 pxValue:(int)a4 node:(id)a5;
+ (void)setSingleStyleAttribute:(__CFString *)a3 value:(__CFString *)a4 node:(id)a5;
- (BOOL)getAttribute:(__CFString *)a3 intValue:(int *)a4;
- (BOOL)getAttribute:(__CFString *)a3 trblValue:(id *)a4;
- (BOOL)getAttribute:(__CFString *)a3 value:(const __CFString *)a4;
- (GQHStyle)init;
- (__CFString)createNamedStyle:(__CFString *)a3;
- (void)addAttribute:(__CFString *)a3 intValue:(int)a4;
- (void)addAttribute:(__CFString *)a3 ptValue:(int)a4;
- (void)addAttribute:(__CFString *)a3 pxValue:(int)a4;
- (void)addAttribute:(__CFString *)a3 trblValue:(id)a4;
- (void)addAttribute:(__CFString *)a3 value:(__CFString *)a4;
- (void)addClass:(__CFString *)a3;
- (void)dealloc;
- (void)setStyleOnCurrentNode:(id)a3;
- (void)setStyleOnCurrentNode:(id)a3 mappingBaseStyleClass:(id)a4 baseClassType:(Class)a5;
- (void)setStyleOnCurrentNode:(id)a3 mappingBaseStyleClasses:(__CFArray *)a4 baseClassTypes:(__CFArray *)a5;
- (void)setupCssClassAttribute:(id)a3;
@end

@implementation GQHStyle

- (GQHStyle)init
{
  v4.receiver = self;
  v4.super_class = (Class)GQHStyle;
  v2 = [(GQHStyle *)&v4 init];
  if (v2)
  {
    v2->mStyles = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v2->mCssClassAttribute = CFStringCreateMutable(0, 0);
  }
  return v2;
}

- (void)dealloc
{
  CFRelease(self->mStyles);
  CFRelease(self->mCssClassAttribute);
  mCachedCssStyleName = self->mCachedCssStyleName;
  if (mCachedCssStyleName) {
    CFRelease(mCachedCssStyleName);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQHStyle;
  [(GQHStyle *)&v4 dealloc];
}

- (void)addAttribute:(__CFString *)a3 value:(__CFString *)a4
{
}

- (void)addAttribute:(__CFString *)a3 intValue:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  value = objc_alloc_init(GQHIntNumber);
  [(GQHIntNumber *)value setType:0 value:v4];
  CFDictionarySetValue(self->mStyles, a3, value);
}

- (void)addAttribute:(__CFString *)a3 pxValue:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  value = objc_alloc_init(GQHIntNumber);
  [(GQHIntNumber *)value setType:1 value:v4];
  CFDictionarySetValue(self->mStyles, a3, value);
}

- (void)addAttribute:(__CFString *)a3 ptValue:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  value = objc_alloc_init(GQHIntNumber);
  [(GQHIntNumber *)value setType:2 value:v4];
  CFDictionarySetValue(self->mStyles, a3, value);
}

- (void)addAttribute:(__CFString *)a3 trblValue:(id)a4
{
}

- (BOOL)getAttribute:(__CFString *)a3 intValue:(int *)a4
{
  Value = (void *)CFDictionaryGetValue(self->mStyles, a3);
  if (Value)
  {
    v6 = Value;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *a4 = [v6 value];
      LOBYTE(Value) = 1;
    }
    else
    {
      LOBYTE(Value) = 0;
    }
  }
  return (char)Value;
}

- (BOOL)getAttribute:(__CFString *)a3 value:(const __CFString *)a4
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(self->mStyles, a3);
  if (Value)
  {
    CFStringRef v6 = Value;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *a4 = v6;
      LOBYTE(Value) = 1;
    }
    else
    {
      LOBYTE(Value) = 0;
    }
  }
  return (char)Value;
}

- (BOOL)getAttribute:(__CFString *)a3 trblValue:(id *)a4
{
  CFStringRef Value = (void *)CFDictionaryGetValue(self->mStyles, a3);
  if (Value)
  {
    CFStringRef v6 = Value;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *a4 = v6;
      LOBYTE(Value) = 1;
    }
    else
    {
      LOBYTE(Value) = 0;
    }
  }
  return (char)Value;
}

- (__CFString)createNamedStyle:(__CFString *)a3
{
  if (CFDictionaryGetCount(self->mStyles) < 1) {
    return 0;
  }
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(Mutable, 0, @".%@ {\n", a3);
  CFDictionaryApplyFunction(self->mStyles, (CFDictionaryApplierFunction)sub_31618, Mutable);
  CFStringAppend(Mutable, @"} \n\n");
  return Mutable;
}

- (void)setupCssClassAttribute:(id)a3
{
  if (CFDictionaryGetCount(self->mStyles) >= 1)
  {
    CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
    CFDictionaryApplyFunction(self->mStyles, (CFDictionaryApplierFunction)sub_31750, Mutable);
    CFStringRef v6 = (__CFString *)[a3 makeInlineStyle:Mutable];
    if (CFStringGetLength(v6) >= 1)
    {
      mCachedCssStyleName = self->mCachedCssStyleName;
      if (!mCachedCssStyleName || CFStringCompare(v6, mCachedCssStyleName, 0))
      {
        CFStringAppend(self->mCssClassAttribute, v6);
        CFStringAppend(self->mCssClassAttribute, @" ");
        v8 = self->mCachedCssStyleName;
        if (v8) {
          CFRelease(v8);
        }
        self->mCachedCssStyleName = v6;
        CFRetain(v6);
      }
    }
    CFRelease(Mutable);
  }
}

- (void)setStyleOnCurrentNode:(id)a3
{
  -[GQHStyle setupCssClassAttribute:](self, "setupCssClassAttribute:");
  id v5 = [a3 htmlDoc];
  mCssClassAttribute = self->mCssClassAttribute;
  [v5 setAttribute:"class" cfStringValue:mCssClassAttribute];
}

- (void)addClass:(__CFString *)a3
{
  CFStringAppend(self->mCssClassAttribute, a3);
  mCssClassAttribute = self->mCssClassAttribute;
  CFStringAppend(mCssClassAttribute, @" ");
}

+ (void)setSingleStyleAttribute:(__CFString *)a3 value:(__CFString *)a4 node:(id)a5
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  sub_31750((uint64_t)a3, a4, Mutable);
  [a5 setAttribute:"style" cfStringValue:Mutable];
  CFRelease(Mutable);
}

+ (void)setSingleStyleAttribute:(__CFString *)a3 intValue:(int)a4 node:(id)a5
{
  CFStringRef v8 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", a4);
  [a1 setSingleStyleAttribute:a3 value:v8 node:a5];
  CFRelease(v8);
}

+ (void)setSingleStyleAttribute:(__CFString *)a3 pxValue:(int)a4 node:(id)a5
{
  CFStringRef v8 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%dpx", a4);
  [a1 setSingleStyleAttribute:a3 value:v8 node:a5];
  CFRelease(v8);
}

- (void)setStyleOnCurrentNode:(id)a3 mappingBaseStyleClass:(id)a4 baseClassType:(Class)a5
{
  Class v9 = a5;
  values = a4;
  if (a4)
  {
    if (a5)
    {
      CFArrayRef v7 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
      CFArrayRef v8 = CFArrayCreate(kCFAllocatorDefault, (const void **)&v9, 1, &kCFTypeArrayCallBacks);
      -[GQHStyle setStyleOnCurrentNode:mappingBaseStyleClasses:baseClassTypes:](self, "setStyleOnCurrentNode:mappingBaseStyleClasses:baseClassTypes:", a3, v7, v8, v9, values);
      CFRelease(v7);
      CFRelease(v8);
    }
  }
}

+ (void)appendParentClass:(__CFString *)a3 style:(id)a4 classType:(Class)a5 state:(id)a6
{
  id v10 = [a4 parent];
  if (!v10) {
    return;
  }
  id v11 = v10;
  [a1 appendParentClass:a3 style:v10 classType:a5 state:a6];
  id v12 = [a6 className:v11];
  if (v12)
  {
    id v13 = v12;
    CFRetain(v12);
LABEL_4:
    CFMutableStringRef Mutable = *a3;
    if (!*a3)
    {
      CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
      *a3 = Mutable;
    }
    CFStringAppendFormat(Mutable, 0, @"%@ ", v13);
    CFRelease(v13);
    return;
  }
  v17 = objc_alloc_init(GQHStyle);
  [a6 pushImplicitStyle:v11];
  [(objc_class *)a5 mapStyle:v11 style:v17 state:a6];
  [a6 popImplicitStyle];
  id v13 = objc_msgSend(a6, "createStyleName:type:", v11, -[objc_class name](a5, "name"));
  v15 = [(GQHStyle *)v17 createNamedStyle:v13];
  if (v15)
  {
    v16 = v15;
    [a6 addStyle:v15 className:v13 srcStyle:v11];
    CFRelease(v16);

    if (!v13) {
      return;
    }
    goto LABEL_4;
  }
  CFRelease(v13);
}

+ (void)createBaseStyleClassString:(id)a3 classString:(__CFString *)a4 classType:(Class)a5 state:(id)a6
{
  Class v11 = a5;
  values = a3;
  if (a3)
  {
    if (a5)
    {
      CFArrayRef v9 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
      CFArrayRef v10 = CFArrayCreate(0, (const void **)&v11, 1, &kCFTypeArrayCallBacks);
      objc_msgSend(a1, "createBaseStyleClassesString:classString:classTypes:state:", v9, a4, v10, a6, v11, values);
      CFRelease(v9);
      CFRelease(v10);
    }
  }
}

+ (void)createBaseStyleClassesString:(__CFArray *)a3 classString:(__CFString *)a4 classTypes:(__CFArray *)a5 state:(id)a6
{
  int Count = CFArrayGetCount(a3);
  if (Count == CFArrayGetCount(a5) && Count >= 1)
  {
    CFIndex v12 = 0;
    uint64_t v13 = Count;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, v12);
      v15 = CFArrayGetValueAtIndex(a5, v12);
      if (ValueAtIndex)
      {
        if (v15) {
          [a1 appendParentClass:a4 style:ValueAtIndex classType:v15 state:a6];
        }
      }
      ++v12;
    }
    while (v13 != v12);
  }
}

- (void)setStyleOnCurrentNode:(id)a3 mappingBaseStyleClasses:(__CFArray *)a4 baseClassTypes:(__CFArray *)a5
{
  -[GQHStyle setupCssClassAttribute:](self, "setupCssClassAttribute:");
  CFStringRef appendedString = 0;
  +[GQHStyle createBaseStyleClassesString:a4 classString:&appendedString classTypes:a5 state:a3];
  if (appendedString)
  {
    CFStringAppend(self->mCssClassAttribute, appendedString);
    CFStringAppend(self->mCssClassAttribute, @" ");
    CFRelease(appendedString);
  }
  objc_msgSend(objc_msgSend(a3, "htmlDoc"), "setAttribute:cfStringValue:", "class", self->mCssClassAttribute);
}

@end