@interface PFXHtmlStyle
+ (BOOL)isAtCollapseBorder:(id)a3;
+ (BOOL)shouldTextInheritNodeProps:(id)a3;
+ (id)createStylesWithSelector:(id)a3 styleCache:(id)a4 isLeaf:(BOOL)a5;
+ (int)whiteSpacePropertyForCurrentOrientation:(id)a3;
+ (void)insertElementAttributes:(id)a3 intoSelector:(id)a4 identifier:(const char *)a5;
+ (void)loadCssPropertiesForHtmlEntry:(id)a3;
+ (void)setupWhiteSpaceForCurrentOrientation:(id)a3;
@end

@implementation PFXHtmlStyle

+ (void)loadCssPropertiesForHtmlEntry:(id)a3
{
  id v20 = objc_alloc_init((Class)NSAutoreleasePool);
  id v5 = [a3 htmlReaderState];
  id v6 = [a3 xmlElementId];
  if (v6)
  {
    if ([v5 orientationCount])
    {
      uint64_t v7 = 0;
      while (1)
      {
        [v5 switchToOrientation:v7];
        if (objc_msgSend(objc_msgSend(objc_msgSend(v5, "currentHtmlDocMediaState"), "styleCache"), "hasAnyRulesForIdentifier:", v6))break; {
        if (++v7 >= (unint64_t)[v5 orientationCount])
        }
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:
      id v6 = 0;
    }
  }
  v8 = objc_alloc_init(PFSStyleSelector);
  [a1 insertElementAttributes:a3 intoSelector:v8 identifier:v6];
  [(PFSStyleSelector *)v8 freeze];
  [a3 setStyleSelector:v8];
  if ([v5 orientationCount])
  {
    unint64_t v9 = 0;
    do
    {
      [v5 switchToOrientation:v9];
      id v10 = [a3 currentEntryMediaState];
      id v11 = objc_msgSend(a1, "createStylesWithSelector:styleCache:isLeaf:", v8, objc_msgSend(objc_msgSend(v5, "currentHtmlDocMediaState"), "styleCache"), 1);
      [v10 setPropertySet:v11];

      ++v9;
    }
    while (v9 < (unint64_t)[v5 orientationCount]);
  }

  v12 = objc_msgSend(objc_msgSend(a3, "styleAttribute"), "cString");
  if (v12)
  {
    v13 = v12;
    if (*v12)
    {
      id v14 = objc_alloc_init((Class)NSMutableDictionary);
      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      +[PFXStylesheet readStylesheetFromStyleAttributeContents:sourceURL:toDictionary:toFontDictionary:readerState:](PFXStylesheet, "readStylesheetFromStyleAttributeContents:sourceURL:toDictionary:toFontDictionary:readerState:", v13, [v5 entryNSURL], v14, v15, v5);
      +[PFXStylesheet registerFontsFromDictionary:v15 readerState:v5];
      v16 = objc_alloc_init(PFSStyleCache);
      [(PFSStyleCache *)v16 addEntriesFromDictionary:v14];
      id v17 = [a1 createStylesWithSelector:[PFSStyleSelector allElementsSelector] styleCache:v16 isLeaf:1];

      if ([v5 orientationCount])
      {
        unint64_t v18 = 0;
        do
        {
          [v5 switchToOrientation:v18];
          objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "propertySet"), "setPropertiesFromPropertySet:", v17);
          ++v18;
        }
        while (v18 < (unint64_t)[v5 orientationCount]);
      }
    }
  }
  if ([v5 orientationCount])
  {
    unint64_t v19 = 0;
    do
    {
      [v5 switchToOrientation:v19];
      [a1 setupWhiteSpaceForCurrentOrientation:a3];
      ++v19;
    }
    while (v19 < (unint64_t)[v5 orientationCount]);
  }
}

+ (BOOL)shouldTextInheritNodeProps:(id)a3
{
  return !+[PFXUtilities elementIsTableRelated:](PFXUtilities, "elementIsTableRelated:", [a3 xmlElementName]);
}

+ (id)createStylesWithSelector:(id)a3 styleCache:(id)a4 isLeaf:(BOOL)a5
{
  if (a4)
  {
    id v6 = [a4 createPropertySetWithSelector:a3];
    uint64_t v7 = v6;
    if (!a5) {
      [v6 removeUninheritedProperties];
    }
    return v7;
  }
  else
  {
    return objc_alloc_init(PFSPropertySet);
  }
}

+ (BOOL)isAtCollapseBorder:(id)a3
{
  return ![a3 parentEntry]
      || xmlStrEqual((const xmlChar *)"body", (const xmlChar *)[a3 xmlElementName])
      || xmlStrEqual((const xmlChar *)"body", (const xmlChar *)objc_msgSend(objc_msgSend(a3, "parentEntry"), "xmlElementName")) != 0;
}

+ (void)insertElementAttributes:(id)a3 intoSelector:(id)a4 identifier:(const char *)a5
{
  if ((objc_msgSend(a1, "isAtCollapseBorder:") & 1) == 0) {
    objc_msgSend(a1, "insertElementAttributes:intoSelector:identifier:", objc_msgSend(a3, "parentHtmlStackEntry"), a4, a5);
  }
  unint64_t v9 = (PFSStyleSimpleSelector *)[a4 addSimpleSelector];
  PFSStyleSimpleSelector::setElement(v9, (char *)[a3 xmlElementName]);
  id v10 = (char *)objc_msgSend(objc_msgSend(a3, "classAttribute"), "cString");
  if (!v10) {
    goto LABEL_20;
  }
  id v11 = v10;
  LOBYTE(v12) = *v10;
  if (!*v10) {
    goto LABEL_20;
  }
  do
  {
    while (1)
    {
      if ((v12 & 0x80) != 0)
      {
        if (__maskrune((char)v12, 0x4000uLL)) {
          goto LABEL_7;
        }
        break;
      }
      if ((_DefaultRuneLocale.__runetype[(char)v12] & 0x4000) == 0) {
        break;
      }
LABEL_7:
      int v13 = *++v11;
      LOBYTE(v12) = v13;
      if (!v13) {
        goto LABEL_20;
      }
    }
    char v14 = *v11;
    if (!*v11) {
      break;
    }
    id v15 = v11;
    while ((v14 & 0x80) == 0)
    {
      if ((_DefaultRuneLocale.__runetype[v14] & 0x4000) != 0) {
        goto LABEL_18;
      }
LABEL_16:
      int v16 = *++v15;
      char v14 = v16;
      if (!v16)
      {
        int v12 = 0;
        goto LABEL_19;
      }
    }
    if (!__maskrune(v14, 0x4000uLL)) {
      goto LABEL_16;
    }
LABEL_18:
    int v12 = *v15;
LABEL_19:
    *id v15 = 0;
    PFSStyleSimpleSelector::addClass((uint64_t *)v9, v11);
    *id v15 = v12;
    id v11 = v15;
  }
  while (v12);
LABEL_20:
  if (a5) {
    PFSStyleSimpleSelector::addHashIdentifier(v9, (char *)a5);
  }
  id v17 = [a3 xmlAttributes];
  unint64_t v18 = v17 + 1;
  unint64_t v19 = (void *)*v17;
  if ((void *)*v17 != v17 + 1)
  {
    do
    {
      id v20 = (const char *)v19[4];
      v21 = (const char *)[(id)v19[5] cString];
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_5733B0, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_5733B0))
      {
        byte_5733A8 = 1;
        __cxa_guard_release(&qword_5733B0);
      }
      size_t v22 = strlen(v20);
      size_t v23 = strlen(v21);
      if (byte_5733A8) {
        uint64_t v24 = 3;
      }
      else {
        uint64_t v24 = 0;
      }
      v25 = (char *)malloc_type_malloc(v22 + v23 + v24 + 1, 0xD7E799DDuLL);
      sprintf(v25, "%s%s%s", v20, " = ", v21);
      PFSStyleSimpleSelector::addAttrib(v9, v25);
      free(v25);
      v26 = (void *)v19[1];
      if (v26)
      {
        do
        {
          v27 = v26;
          v26 = (void *)*v26;
        }
        while (v26);
      }
      else
      {
        do
        {
          v27 = (void *)v19[2];
          BOOL v28 = *v27 == (void)v19;
          unint64_t v19 = v27;
        }
        while (!v28);
      }
      unint64_t v19 = v27;
    }
    while (v27 != v18);
  }
}

+ (int)whiteSpacePropertyForCurrentOrientation:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = [a3 currentEntryMediaState];
  if ([v5 whitespace] == 5)
  {
    if (xmlStrEqual((const xmlChar *)"table", (const xmlChar *)[a3 xmlElementName])) {
      return 0;
    }
    id v7 = [a3 parentHtmlStackEntry];
    return [a1 whiteSpacePropertyForCurrentOrientation:v7];
  }
  else
  {
    return [v5 whitespace];
  }
}

+ (void)setupWhiteSpaceForCurrentOrientation:(id)a3
{
  id v5 = [a3 currentEntryMediaState];
  id v6 = objc_msgSend(objc_msgSend(v5, "propertySet"), "valueForProperty:", "white-space");
  if (v6)
  {
    id v7 = [v6 lastObject];
    if ([v7 type] == &stru_108
      && (id v8 = [v7 value], (objc_msgSend(@"normal", "isEqualToString:", v8) & 1) == 0))
    {
      if ([@"pre" isEqualToString:v8])
      {
        id v9 = &dword_0 + 1;
      }
      else if ([@"nowrap" isEqualToString:v8])
      {
        id v9 = &dword_0 + 2;
      }
      else if ([@"pre-wrap" isEqualToString:v8])
      {
        id v9 = &dword_0 + 3;
      }
      else if ([@"pre-line" isEqualToString:v8])
      {
        id v9 = &dword_4;
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = [a1 whiteSpacePropertyForCurrentOrientation:a3];
  }

  [v5 setWhitespace:v9];
}

@end