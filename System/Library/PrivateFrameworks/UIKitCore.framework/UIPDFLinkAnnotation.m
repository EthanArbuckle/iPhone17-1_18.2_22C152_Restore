@interface UIPDFLinkAnnotation
- (BOOL)quadPoints:(CGPDFArray *)a3 within:(CGRect)a4;
- (BOOL)recognizeGestures;
- (BOOL)shouldRecognizeTapOrPress:(CGPoint)a3;
- (CGRect)linkRectangle;
- (id)newBaseURL;
- (id)url;
- (unint64_t)getDestination:(CGPDFDictionary *)a3;
- (unint64_t)getNamedDestination:(CGPDFDictionary *)a3;
- (unint64_t)pageNumber;
@end

@implementation UIPDFLinkAnnotation

- (id)newBaseURL
{
  id result = [(UIPDFDocument *)[[(UIPDFPageView *)[(UIPDFAnnotationController *)self->super.super._annotationController pageView] page] document] CGDocument];
  if (result)
  {
    id result = CGPDFDocumentGetCatalog((CGPDFDocumentRef)result);
    if (result)
    {
      CGPDFDictionaryRef value = 0;
      BOOL Dictionary = CGPDFDictionaryGetDictionary((CGPDFDictionaryRef)result, "URI", &value);
      id result = 0;
      if (Dictionary)
      {
        CGPDFStringRef string = 0;
        BOOL v4 = CGPDFDictionaryGetString(value, "Base", &string);
        id result = 0;
        if (v4)
        {
          id result = (id)CGPDFStringGetBytePtr(string);
          if (result)
          {
            id v5 = result;
            id result = (id)CGPDFStringGetLength(string);
            if (result) {
              return (id)[[NSString alloc] initWithCString:v5 encoding:30];
            }
          }
        }
      }
    }
  }
  return result;
}

- (unint64_t)getDestination:(CGPDFDictionary *)a3
{
  CGPDFObjectRef value = 0;
  if (!CGPDFDictionaryGetObject(a3, "D", &value) && !CGPDFDictionaryGetObject(a3, "Dest", &value)) {
    return 0;
  }
  CGPDFObjectType Type = CGPDFObjectGetType(value);
  CGPDFArrayRef array = 0;
  if (Type == kCGPDFObjectTypeArray)
  {
    BOOL v6 = CGPDFObjectGetValue(value, kCGPDFObjectTypeArray, &array);
    unint64_t result = 0;
    if (!v6 || !array) {
      return result;
    }
    goto LABEL_17;
  }
  if ((Type - 5) > 1) {
    return 0;
  }
  CGPDFDictionaryRef v22 = 0;
  [(UIPDFDocument *)[[(UIPDFPageView *)[(UIPDFAnnotationController *)self->super.super._annotationController pageView] page] document] CGDocument];
  Destination = (CGPDFObject *)CGPDFDocumentGetDestination();
  CGPDFObjectRef object = Destination;
  if (Destination)
  {
    v9 = Destination;
    CGPDFObjectType v10 = CGPDFObjectGetType(Destination);
    if (v10 == kCGPDFObjectTypeDictionary)
    {
      if (!CGPDFObjectGetValue(v9, kCGPDFObjectTypeDictionary, &v22)
        || CGPDFDictionaryGetObject(v22, "D", &object) && !CGPDFObjectGetValue(object, kCGPDFObjectTypeArray, &array))
      {
        return 0;
      }
    }
    else if (v10 == kCGPDFObjectTypeArray && !CGPDFObjectGetValue(v9, kCGPDFObjectTypeArray, &array))
    {
      return 0;
    }
  }
  if (!array) {
    return 0;
  }
LABEL_17:
  v11 = [(UIPDFAnnotationController *)self->super.super._annotationController pageView];
  unint64_t v12 = [(UIPDFDocument *)[[(UIPDFPageView *)v11 page] document] numberOfPages];
  unint64_t result = CGPDFArrayGetCount(array);
  if (!result) {
    return result;
  }
  CGPDFDictionaryRef v18 = 0;
  if (CGPDFArrayGetDictionary(array, 0, &v18))
  {
    v13 = [(UIPDFDocument *)[[(UIPDFPageView *)v11 page] document] CGDocument];
    v14 = v18;
    CGPDFDictionaryRef v22 = 0;
    Catalog = CGPDFDocumentGetCatalog(v13);
    CGPDFDictionaryGetDictionary(Catalog, "Pages", &v22);
    CGPDFObjectRef object = 0;
    unint64_t result = indexOfDictionary(v22, &object, v14);
  }
  else
  {
    CGPDFDictionaryRef v22 = 0;
    BOOL Integer = CGPDFArrayGetInteger(array, 0, (CGPDFInteger *)&v22);
    unint64_t result = 0;
    if (!Integer) {
      return result;
    }
    unint64_t result = (unint64_t)v22;
  }
  if (result > v12 || (uint64_t)result < 1) {
    return 0;
  }
  return result;
}

- (unint64_t)getNamedDestination:(CGPDFDictionary *)a3
{
  CGPDFObjectRef value = 0;
  BOOL Name = CGPDFDictionaryGetName(a3, "N", (const char **)&value);
  unint64_t result = 0;
  if (Name)
  {
    BOOL v6 = [(UIPDFAnnotationController *)self->super.super._annotationController pageView];
    unint64_t v7 = [(UIPDFDocument *)[(UIPDFPageView *)v6 document] numberOfPages];
    uint64_t v8 = [[(UIPDFPageView *)v6 page] pageNumber];
    v9 = value;
    if (!strcmp(value, "NextPage"))
    {
      if (!strcmp(v9, "PrevPage"))
      {
        if (!strcmp(v9, "FirstPage"))
        {
          if (!strcmp(v9, "LastPage")) {
            int64_t v10 = 0;
          }
          else {
            int64_t v10 = v7;
          }
        }
        else
        {
          int64_t v10 = 1;
        }
      }
      else
      {
        int64_t v10 = v8 - 1;
      }
    }
    else
    {
      int64_t v10 = v8 + 1;
    }
    if (v10 > v7 || v10 < 0) {
      return 0;
    }
    else {
      return v10;
    }
  }
  return result;
}

- (id)url
{
  CGPDFDictionaryRef value = 0;
  BOOL Dictionary = CGPDFDictionaryGetDictionary(self->super.super._dictionary, "A", &value);
  id result = 0;
  if (Dictionary)
  {
    __s1 = 0;
    BOOL Name = CGPDFDictionaryGetName(value, "S", (const char **)&__s1);
    id result = 0;
    if (Name)
    {
      id v6 = [(UIPDFLinkAnnotation *)self newBaseURL];
      unint64_t v7 = v6;
      if (v6 && [v6 length]) {
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v7 encodingInvalidCharacters:0];
      }
      else {
        uint64_t v8 = 0;
      }

      if (!strcmp(__s1, "URI"))
      {
        CGPDFStringRef string = 0;
        if (!CGPDFDictionaryGetString(value, "URI", &string))
        {

          return 0;
        }
        int64_t v10 = (void *)[[NSString alloc] initWithUTF8String:CGPDFStringGetBytePtr(string)];
        v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v10 encodingInvalidCharacters:0];
        if (![v9 baseURL] && v8)
        {

          v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v10 relativeToURL:v8];
        }
        if (![v9 scheme])
        {
          if ([v10 hasPrefix:@"www."])
          {

            id v11 = objc_alloc(MEMORY[0x1E4F1CB10]);
            v9 = (void *)[v11 initWithString:objc_msgSend(NSString, "stringWithFormat:", @"http://%@", v10)];
          }
        }
      }
      else
      {
        v9 = 0;
      }

      return v9;
    }
  }
  return result;
}

- (unint64_t)pageNumber
{
  CGPDFDictionaryRef value = 0;
  if (!CGPDFDictionaryGetDictionary(self->super.super._dictionary, "A", &value))
  {
    dictionary = self->super.super._dictionary;
    return [(UIPDFLinkAnnotation *)self getDestination:dictionary];
  }
  __s1 = 0;
  if (!CGPDFDictionaryGetName(value, "S", (const char **)&__s1)) {
    return 0;
  }
  v3 = __s1;
  if (!strcmp(__s1, "GoTo"))
  {
    dictionary = value;
    return [(UIPDFLinkAnnotation *)self getDestination:dictionary];
  }
  if (strcmp(v3, "Named")) {
    return 0;
  }
  return [(UIPDFLinkAnnotation *)self getNamedDestination:value];
}

- (CGRect)linkRectangle
{
  [(UIPDFAnnotation *)self Rect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(UIPDFAnnotationController *)self->super.super._annotationController pageView];
  -[UIPDFPageView convertRectFromPDFPageSpace:](v11, "convertRectFromPDFPageSpace:", v4, v6, v8, v10);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)quadPoints:(CGPDFArray *)a3 within:(CGRect)a4
{
  return 1;
}

- (BOOL)shouldRecognizeTapOrPress:(CGPoint)a3
{
  v54[1] = *(CGPDFReal *)MEMORY[0x1E4F143B8];
  dictionardouble y = self->super.super._dictionary;
  if (dictionary)
  {
    double y = a3.y;
    double x = a3.x;
    CGPDFArrayRef value = 0;
    if (!CGPDFDictionaryGetArray(dictionary, "QuadPoints", &value)
      || (CGPDFArrayRef v7 = value,
          [(UIPDFAnnotation *)self Rect],
          !-[UIPDFLinkAnnotation quadPoints:within:](self, "quadPoints:within:", v7))
      || (-[UIView convertPoint:fromView:](-[UIPDFAnnotationController pageView](self->super.super._annotationController, "pageView"), "convertPoint:fromView:", -[UIPDFAnnotation annotationView](self, "annotationView"), x, y), -[UIPDFPageView convertPointToPDFPageSpace:]([(UIPDFAnnotationController *)self->super.super._annotationController pageView], "convertPointToPDFPageSpace:", v8, v9), double v11 = v10, v13 = v12, Count = CGPDFArrayGetCount(value), (Count & 7) != 0))
    {
LABEL_5:
      LOBYTE(dictionary) = 1;
      return (char)dictionary;
    }
    int64_t v15 = Count;
    if (Count >= 1)
    {
      int64_t v16 = 0;
      while (1)
      {
        CGPDFArrayGetNumber(value, v16, &v49);
        CGPDFArrayGetNumber(value, v16 | 1, (CGPDFReal *)&v50);
        CGPDFArrayGetNumber(value, v16 | 2, (CGPDFReal *)&v50 + 1);
        CGPDFArrayGetNumber(value, v16 | 3, (CGPDFReal *)&v51);
        CGPDFArrayGetNumber(value, v16 | 4, (CGPDFReal *)&v51 + 1);
        CGPDFArrayGetNumber(value, v16 | 5, (CGPDFReal *)&v52);
        CGPDFArrayGetNumber(value, v16 | 6, &v53);
        CGPDFArrayGetNumber(value, v16 | 7, v54);
        uint64_t v17 = 0;
        double v18 = v49;
        CGPDFReal v43 = v49;
        double v19 = *(double *)&v50;
        long long v44 = v50;
        long long v45 = v51;
        double v20 = v53;
        double v21 = v54[0];
        uint64_t v46 = v52;
        double v47 = v53;
        double v22 = *(double *)&v50;
        double v23 = v49;
        CGPDFReal v48 = v54[0];
        do
        {
          double v25 = *(double *)((char *)&v44 + v17 + 8);
          double v24 = *(double *)((char *)&v45 + v17);
          if (v25 > v18) {
            double v26 = *(double *)((char *)&v44 + v17 + 8);
          }
          else {
            double v26 = v18;
          }
          if (v25 >= v23) {
            double v18 = v26;
          }
          else {
            double v23 = *(double *)((char *)&v44 + v17 + 8);
          }
          if (v24 >= v22)
          {
            if (v24 > v19) {
              double v19 = *(double *)((char *)&v45 + v17);
            }
          }
          else
          {
            double v22 = *(double *)((char *)&v45 + v17);
          }
          v17 += 16;
        }
        while (v17 != 48);
        double v27 = v19 - v22;
        double v28 = v18 - v23;
        v56.origin.double x = v23;
        v56.origin.double y = v22;
        v56.size.width = v28;
        v56.size.height = v27;
        if (!CGRectIsNull(v56))
        {
          v57.origin.double x = v23;
          v57.origin.double y = v22;
          v57.size.width = v28;
          v57.size.height = v27;
          CGRect v58 = CGRectInset(v57, -0.00000011920929, -0.00000011920929);
          v55.double x = v11;
          v55.double y = v13;
          if (CGRectContainsPoint(v58, v55)) {
            break;
          }
        }
LABEL_40:
        LOBYTE(dictionary) = 0;
        v16 += 8;
        if (v16 >= v15) {
          return (char)dictionary;
        }
      }
      uint64_t v29 = 0;
      double v30 = v20 - v11;
      double v31 = v21 - v13;
      double v32 = 0.0;
      while (1)
      {
        double v33 = v30;
        double v34 = v31;
        double v30 = *(CGPDFReal *)((char *)&v43 + v29) - v11;
        double v31 = *(CGPDFReal *)((char *)&v43 + v29 + 8) - v13;
        double v35 = sqrt(v34 * v34 + v33 * v33);
        double v36 = sqrt(v30 * v30 + v31 * v31);
        if (v35 < 0.00000011920929 || v36 < 0.00000011920929) {
          goto LABEL_5;
        }
        double v38 = (v33 * v31 - v34 * v30) / v35 / v36;
        double v39 = 1.57079633;
        if (v38 < 1.0)
        {
          if (v38 <= -1.0) {
            double v39 = -1.57079633;
          }
          else {
            double v39 = asin(v38);
          }
        }
        if (v33 * v30 + v34 * v31 < 0.0)
        {
          if (fabs(v39) < 0.00000011920929) {
            goto LABEL_5;
          }
          if (v39 <= 0.0) {
            double v40 = -3.14159265;
          }
          else {
            double v40 = 3.14159265;
          }
          double v39 = v40 - v39;
        }
        double v32 = v32 + v39;
        v29 += 16;
        if (v29 == 64)
        {
          if (fabs(v32) >= 3.14159265) {
            goto LABEL_5;
          }
          goto LABEL_40;
        }
      }
    }
    LOBYTE(dictionary) = 0;
  }
  return (char)dictionary;
}

- (BOOL)recognizeGestures
{
  return 1;
}

@end