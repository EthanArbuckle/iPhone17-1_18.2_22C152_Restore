@interface GQHBodyStorage
+ (int)handleBodyStorage:(id)a3 state:(id)a4;
+ (int)handleContainerHint:(id)a3 state:(id)a4;
+ (int)handleFootnotes:(id)a3 state:(id)a4;
+ (int)handleLayout:(id)a3 state:(id)a4;
+ (int)handlePageStart:(id)a3 state:(id)a4;
+ (int)handleSection:(id)a3 state:(id)a4;
+ (int)handleTocContent:(id)a3 state:(id)a4;
+ (int)handleTocEntry:(id)a3 state:(id)a4;
@end

@implementation GQHBodyStorage

+ (int)handleBodyStorage:(id)a3 state:(id)a4
{
  id v6 = [a4 generatorState];
  CFArrayRef v7 = (const __CFArray *)[a3 body];
  unint64_t Count = CFArrayGetCount(v7);
  if (Count)
  {
    CFIndex v9 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v7, v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v11 = [a1 handleSection:ValueAtIndex state:v6];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v11 = [a1 handlePageStart:ValueAtIndex state:v6];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            int v12 = 3;
            goto LABEL_14;
          }
          unsigned int v11 = [a1 handleContainerHint:ValueAtIndex state:v6];
        }
      }
      int v12 = v11;
      if (++v9 >= Count || v11 != 1) {
        goto LABEL_14;
      }
    }
  }
  int v12 = 1;
LABEL_14:
  if (![a3 footnotes] || (objc_msgSend(v6, "useOutline") & 1) != 0) {
    return v12;
  }
  id v14 = [a3 footnotes];
  return [a1 handleFootnotes:v14 state:v6];
}

+ (int)handleTocContent:(id)a3 state:(id)a4
{
  CFArrayRef v6 = (const __CFArray *)[a3 children];
  int Count = CFArrayGetCount(v6);
  if (Count < 1) {
    return 1;
  }
  CFIndex v8 = 0;
  CFIndex v9 = Count;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v6, v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int result = [a1 handleTocEntry:ValueAtIndex state:a4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int result = 1;
      }
      else {
        int result = 3;
      }
    }
    ++v8;
  }
  while (v8 < v9 && result == 1);
  return result;
}

+ (int)handleTocEntry:(id)a3 state:(id)a4
{
  id v7 = [a3 bookmark];
  id v8 = [a4 htmlDoc];
  [v8 startElement:"a"];
  CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"#%@", v7);
  v10 = +[GQHUtils createHtmlHrefForLinkUri:v9 state:a4];
  CFRelease(v9);
  [v8 setAttribute:"href" cfStringValue:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a4 pushTocHref:v10];
  }
  CFRelease(v10);
  [v8 setAttribute:"title" cfStringValue:v7];
  CFArrayRef v11 = (const __CFArray *)[a3 children];
  int Count = CFArrayGetCount(v11);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Count < 1)
  {
    int v17 = 1;
    goto LABEL_26;
  }
  CFIndex v14 = 0;
  CFIndex v15 = Count;
  while (1)
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v11, v14);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [a4 inContent];
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    if [a4 useOutline] && (objc_msgSend(ValueAtIndex, "isHidden"))
    {
      int v17 = 1;
      goto LABEL_22;
    }
    unsigned int v18 = +[GQHParagraph handleParagraph:ValueAtIndex state:a4 bulletStates:Mutable isMultiColumn:0];
LABEL_21:
    int v17 = v18;
LABEL_22:
    if (++v14 >= v15 || v17 != 1) {
      goto LABEL_26;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v18 = [a1 handleTocContent:ValueAtIndex state:a4];
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v18 = [a1 handleTocEntry:ValueAtIndex state:a4];
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v18 = [a1 handlePageStart:ValueAtIndex state:a4];
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v18 = [a1 handleContainerHint:ValueAtIndex state:a4];
    goto LABEL_21;
  }
  int v17 = 3;
LABEL_26:
  [v8 endElement];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a4 popTocHref];
  }
  CFRelease(Mutable);
  return v17;
}

+ (int)handleSection:(id)a3 state:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a4 setDidInsertPageHeader:0];
    if ([a3 style]) {
      objc_msgSend(a4, "overrideSectionStyle:", objc_msgSend(a3, "style"));
    }
  }
  CFArrayRef v7 = (const __CFArray *)[a3 children];
  unint64_t Count = CFArrayGetCount(v7);
  if (!Count) {
    return 1;
  }
  CFIndex v9 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v7, v9);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [a4 inContent];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int result = [a1 handleLayout:ValueAtIndex state:a4];
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int result = [a1 handlePageStart:ValueAtIndex state:a4];
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 3;
    }
    int result = [a1 handleContainerHint:ValueAtIndex state:a4];
LABEL_15:
    if (++v9 >= Count || result != 1) {
      return result;
    }
  }
}

+ (int)handlePageStart:(id)a3 state:(id)a4
{
  return 1;
}

+ (int)handleLayout:(id)a3 state:(id)a4
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v8 = [a4 htmlDoc];
  [v8 startElement:"div"];
  CFIndex v9 = objc_alloc_init(GQHStyle);
  [(GQHStyle *)v9 addAttribute:off_9CE00 value:@"#FFFFFF"];
  [(GQHStyle *)v9 addAttribute:off_9CE60 value:off_9CFF8];
  [(GQHStyle *)v9 setStyleOnCurrentNode:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a4 setCurrentLayoutStyle:v9];
  }

  CFArrayRef v10 = (const __CFArray *)[a3 children];
  CFIndex Count = CFArrayGetCount(v10);
  [a4 setParagraphCount:Count];
  if (!Count)
  {
    int v15 = 1;
    goto LABEL_25;
  }
  CFIndex v12 = 0;
  unint64_t v13 = Count;
  while (1)
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v10, v12);
    [a4 setParagraphIndex:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [a4 inContent];
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    if [a4 useOutline] && (objc_msgSend(ValueAtIndex, "isHidden"))
    {
      int v15 = 1;
      goto LABEL_21;
    }
    unsigned int v16 = +[GQHParagraph handleParagraph:ValueAtIndex state:a4 bulletStates:Mutable isMultiColumn:0];
LABEL_20:
    int v15 = v16;
LABEL_21:
    if (++v12 >= v13 || v15 != 1) {
      goto LABEL_25;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v16 = [a1 handlePageStart:ValueAtIndex state:a4];
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    unsigned int v16 = [a1 handleTocContent:ValueAtIndex state:a4];
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v16 = [a1 handleContainerHint:ValueAtIndex state:a4];
    goto LABEL_20;
  }
  int v15 = 3;
LABEL_25:
  [a4 setParagraphCount:0];
  [a4 setParagraphIndex:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a4 setCurrentLayoutStyle:0];
  }
  [v8 endElement];
  CFRelease(Mutable);
  return v15;
}

+ (int)handleFootnotes:(id)a3 state:(id)a4
{
  id v6 = [a4 htmlDoc];
  [v6 startElement:"div"];
  CFArrayRef v7 = objc_alloc_init(GQHStyle);
  [(GQHStyle *)v7 addAttribute:off_9CE00 value:@"#FFFFFF"];
  [(GQHStyle *)v7 addAttribute:off_9CE60 value:off_9CFF8];
  [(GQHStyle *)v7 setStyleOnCurrentNode:a4];

  [v6 startElement:"hr"];
  [v6 endElement];
  +[GQHTextBox handleLayoutStorage:a3 state:a4];
  [v6 endElement];
  return 1;
}

+ (int)handleContainerHint:(id)a3 state:(id)a4
{
  if (objc_opt_isKindOfClass())
  {
    [a4 setDidFindContainerHint:1];
    [a4 handleContainerHint:a3];
  }
  return 1;
}

@end