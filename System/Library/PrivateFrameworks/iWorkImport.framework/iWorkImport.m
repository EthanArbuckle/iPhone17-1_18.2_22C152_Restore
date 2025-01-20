id sub_27EC(uint64_t a1, void *a2)
{
  GQDAffineGeometry *v4;
  id v5;

  v4 = objc_alloc_init(GQDAffineGeometry);
  v5 = (id)[(GQDAffineGeometry *)v4 readAttributesFromReader:a1];
  if (v5 == 1) {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  }

  return v5;
}

uint64_t sub_2DE8()
{
  v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mNaturalSize");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  sub_384B0(qword_9D7B0, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2, qword_9D7B0, &dword_0);
  v3 = (objc_class *)objc_opt_class();
  v4 = class_getInstanceVariable(v3, "mSize");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  sub_384B0(qword_9D7C0, v5);
  __cxa_atexit((void (*)(void *))j_nullsub_2, qword_9D7C0, &dword_0);
  v6 = (objc_class *)objc_opt_class();
  v7 = class_getInstanceVariable(v6, "mPosition");
  ptrdiff_t v8 = ivar_getOffset(v7);
  objc_opt_class();
  sub_38554(qword_9D7D0, v8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_0, qword_9D7D0, &dword_0);
  sub_3FBB0((uint64_t)&unk_9D7E0, (const xmlChar *)"naturalSize", v9, v10, v11, v12, v13, v14, (uint64_t)qword_9D7B0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9D7E0, &dword_0);
  sub_3FDC0((uint64_t)&unk_9D810, "geometry", (uint64_t)sub_27EC, 0, 0, (uint64_t)&unk_9D7E0);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9D810, &dword_0);
}

uint64_t sub_2FD4(xmlTextReader *a1, void *a2)
{
  v4 = objc_alloc_init(GQDBezierPath);
  v4->mHasVFlip = sub_42C34(a1, qword_A35E8, (xmlChar *)"vflip", &v4->mVFlip);
  v4->mHasHFlip = sub_42C34(a1, qword_A35E8, (xmlChar *)"hflip", &v4->mHFlip);
  if ([(GQDBezierPath *)v4 readAttributesFromReader:a1 processor:a2] == 1) {
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  }
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

id sub_30B8(uint64_t a1, void *a2)
{
  id v4 = objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
  id v5 = [v4 readAttributesFromReader:a1 processor:a2];
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  return v5;
}

uint64_t sub_3120(xmlTextReader *a1, void *a2)
{
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  if (AttributeNs)
  {
    id v4 = AttributeNs;
    id v5 = [a2 documentState];
    id v6 = objc_msgSend(objc_msgSend(v5, "root"), "objectWithXmlUid:", v4);
    if (v6)
    {
      id v7 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v5 popRetainedObject];
        objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v7);
      }
    }
    xmlFree(v4);
  }
  return 1;
}

uint64_t sub_3488(uint64_t result, double **a2)
{
  if (*(unsigned char *)(result + 89)) {
    return result;
  }
  uint64_t v3 = result;
  int v4 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 == 1)
  {
    if (*(_DWORD *)(result + 80) == 4)
    {
LABEL_13:
      *(unsigned char *)(v3 + 89) = 1;
      return result;
    }
    result = sub_5068C(*(double *)result, *(double *)(result + 8), *a2[1], a2[1][1]);
    if ((result & 1) == 0)
    {
      if (*(int *)(v3 + 84) < 2)
      {
        id v8 = a2[1];
        uint64_t v9 = *(int *)(v3 + 80);
        *(_DWORD *)(v3 + 80) = v9 + 1;
        *(_OWORD *)(v3 + 16 * v9 + 16) = *(_OWORD *)v8;
        return result;
      }
      goto LABEL_13;
    }
LABEL_15:
    *(unsigned char *)(v3 + 88) = 1;
    return result;
  }
  if (v4)
  {
    if ((v4 & 0xFFFFFFFE) == 2) {
      goto LABEL_13;
    }
    if (v4 != 4) {
      return result;
    }
    goto LABEL_15;
  }
  int v5 = *(_DWORD *)(result + 84);
  if (!v5)
  {
    *(_OWORD *)result = *(_OWORD *)a2[1];
    id v6 = a2[1];
    uint64_t v7 = *(int *)(result + 80);
    *(_DWORD *)(result + 80) = v7 + 1;
    *(_OWORD *)(result + 16 * v7 + 16) = *(_OWORD *)v6;
    int v5 = *(_DWORD *)(result + 84);
  }
  *(_DWORD *)(result + 84) = v5 + 1;
  return result;
}

void sub_368C(__CFString *theString, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)a2;
  switch(*(_DWORD *)a2)
  {
    case 0:
      int v5 = "M";
      int v6 = 1;
      unsigned int v4 = 1;
      break;
    case 1:
      int v5 = "L";
      goto LABEL_7;
    case 2:
      int v5 = "Q";
      goto LABEL_7;
    case 3:
      int v5 = "C";
LABEL_7:
      int v6 = 1;
      break;
    case 4:
      int v6 = 0;
      unsigned int v4 = 0;
      int v5 = "Z";
      break;
    default:
      int v6 = 0;
      unsigned int v4 = 0;
      int v5 = 0;
      break;
  }
  if (CFStringGetLength(theString) >= 1) {
    CFStringAppend(theString, @" ");
  }
  CFStringAppendCString(theString, v5, 0x600u);
  if (v6)
  {
    uint64_t v7 = 0;
    if (v4 <= 1) {
      unsigned int v8 = 1;
    }
    else {
      unsigned int v8 = v4;
    }
    uint64_t v9 = 16 * v8;
    do
    {
      CFStringAppendFormat(theString, 0, @" %f %f", *(void *)(*(void *)(a2 + 8) + v7), *(void *)(*(void *)(a2 + 8) + v7 + 8));
      v7 += 16;
    }
    while (v9 != v7);
  }
}

uint64_t sub_3880()
{
  sub_3823C(qword_9D850, (uint64_t)sub_30B8, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_9D850, &dword_0);
  sub_3823C(qword_9D868, (uint64_t)sub_3120, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_9D868, &dword_0);
  sub_3FBB0((uint64_t)&unk_9D880, (const xmlChar *)"bezier", v0, v1, v2, v3, v4, v5, (uint64_t)qword_9D850);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9D880, &dword_0);
  sub_3FDC0((uint64_t)&unk_9D8B0, "bezier-path", (uint64_t)sub_2FD4, 0, 0, (uint64_t)&unk_9D880);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9D8B0, &dword_0);
}

id sub_39CC(xmlTextReader *a1, void *a2)
{
  id v3 = [a2 documentState];
  id v4 = [v3 currentDrawablesGenerator];
  if (!v4) {
    return &dword_0 + 1;
  }
  uint64_t v5 = v4;
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  CFArrayRef v7 = (const __CFArray *)objc_msgSend(objc_msgSend(v3, "root"), "objectWithXmlUid:", AttributeNs);
  xmlFree(AttributeNs);
  if (!v7) {
    return &dword_0 + 1;
  }
  CFIndex Count = CFArrayGetCount(v7);
  if (Count < 1) {
    return &dword_0 + 1;
  }
  CFIndex v9 = Count;
  uint64_t v10 = 1;
  do
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v7, v10 - 1);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v5 beginTable:v3];
      [v3 setCurrentTableGenerator:v12];
      [ValueAtIndex walkTableWithGenerator:v12 state:v3];
      id result = &dword_0 + 1;
    }
    else
    {
      id result = [v5 handleDrawable:ValueAtIndex state:v3];
    }
    if (v10 >= v9) {
      break;
    }
    ++v10;
  }
  while (result == 1);
  return result;
}

uint64_t sub_3B1C(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] > a2)
  {
    id v4 = [v3 currentDrawablesGenerator];
    id v5 = [v3 popRetainedObject];
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v6 = [v4 handleDrawable:v5 state:v3];
LABEL_10:
        objc_msgSend(objc_msgSend(v3, "root"), "forgetAboutObject:withXmlUid:", v5, objc_msgSend(v5, "uid"));

        return (uint64_t)v6;
      }
    }
    else if (!*((unsigned char *)[v3 topObjectOfClass:objc_opt_class()] + 72))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        CFArrayAppendValue((CFMutableArrayRef)[v3 peekObject], v5);
      }
    }
    id v6 = &dword_0 + 1;
    goto LABEL_10;
  }
  return 3;
}

uint64_t sub_3C30(void *a1)
{
  *a1 = off_84F98;
  uint64_t v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return nullsub_2(a1);
}

uint64_t sub_3C94(xmlTextReader *a1, void *a2)
{
  if (!*((unsigned char *)objc_msgSend(objc_msgSend(a2, "documentState"), "topObjectOfClass:", objc_opt_class()) + 72))
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addObject:withOwnedXmlUid:", Mutable, xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3D8, *(const xmlChar **)(qword_A35E0 + 16)));
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
    CFRelease(Mutable);
  }
  return 1;
}

uint64_t sub_3D60(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if (*((unsigned char *)[v4 topObjectOfClass:objc_opt_class()] + 72)) {
    return 1;
  }
  if ((int)[v4 objectStackDepth] > a2)
  {
    CFRelease(objc_msgSend(objc_msgSend(a1, "documentState"), "popRetainedObject"));
    return 1;
  }
  return 3;
}

id sub_3DE0(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(objc_msgSend(a2, "documentState"), "topObjectOfClass:", objc_opt_class());
  if (!v3[72]) {
    return &dword_0 + 1;
  }
  id v4 = v3;
  if ([v3 isHidden]) {
    return &dword_0 + 1;
  }
  id v5 = [a2 documentState];
  id v6 = [a2 generator];
  if (!v6) {
    return &dword_0 + 1;
  }
  id v7 = [v6 enterSlideDrawables:v4 state:v5];
  objc_msgSend(objc_msgSend(a2, "documentState"), "setCurrentDrawablesGenerator:", v7);
  return [v7 beginDrawables:v5];
}

uint64_t sub_3EA4(void *a1)
{
  id v2 = [a1 documentState];
  id v3 = [v2 topObjectOfClass:objc_opt_class()];
  if (!v3[72]) {
    return 1;
  }
  if ([v3 isHidden]) {
    return 1;
  }
  if (![a1 generator]) {
    return 1;
  }
  id v4 = [v2 currentDrawablesGenerator];
  if (!v4) {
    return 1;
  }
  id v5 = [v4 endDrawables:v2];
  [v2 setCurrentDrawablesGenerator:0];
  return (uint64_t)v5;
}

uint64_t sub_4050()
{
  sub_3823C(qword_9D8F0, (uint64_t)sub_39CC, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_9D8F0, &dword_0);
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mStylesheet");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9D908, (uint64_t)&unk_A2AE8, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9D908, &dword_0);
  id v3 = (objc_class *)objc_opt_class();
  id v4 = class_getInstanceVariable(v3, "mSlideStyle");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_9D930, v5);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_9D930, &dword_0);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = class_getInstanceVariable(v6, "mTitlePlaceholder");
  ptrdiff_t v8 = ivar_getOffset(v7);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9D948, (uint64_t)&unk_9E220, v8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9D948, &dword_0);
  CFIndex v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = class_getInstanceVariable(v9, "mBodyPlaceholder");
  ptrdiff_t v11 = ivar_getOffset(v10);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9D970, (uint64_t)&unk_9DD58, v11);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9D970, &dword_0);
  id v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = class_getInstanceVariable(v12, "mObjectPlaceholder");
  ptrdiff_t v14 = ivar_getOffset(v13);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9D998, (uint64_t)&unk_9DE78, v14);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9D998, &dword_0);
  v15 = (objc_class *)objc_opt_class();
  v16 = class_getInstanceVariable(v15, "mSlideNumberPlaceholder");
  ptrdiff_t v17 = ivar_getOffset(v16);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9D9C0, (uint64_t)&unk_9E050, v17);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9D9C0, &dword_0);
  sub_3CF28(qword_9D9E8, (uint64_t)sub_3B1C);
  __cxa_atexit((void (*)(void *))j_nullsub_2_4, qword_9D9E8, &dword_0);
  sub_3F8F8(qword_9D9F8, 0, v18, v19, v20, v21, v22, v23, v55);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_9D9F8, &dword_0);
  sub_3FDC0((uint64_t)&unk_9DA18, "drawables", 0, (uint64_t)qword_9D9E8, 0, (uint64_t)qword_9D9F8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9DA18, &dword_0);
  sub_381AC(qword_9DA58, (uint64_t)&unk_9DA18);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9DA58, &dword_0);
  sub_3FBB0((uint64_t)&unk_9DA70, (const xmlChar *)"drawables", v24, v25, v26, v27, v28, v29, (uint64_t)qword_9DA58);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9DA70, &dword_0);
  sub_3FDC0((uint64_t)&unk_9DAA0, "slide-page-layer", (uint64_t)sub_3C94, 0, (uint64_t)sub_3D60, (uint64_t)&unk_9DA70);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9DAA0, &dword_0);
  sub_381AC(qword_9DAE0, (uint64_t)&unk_9DAA0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9DAE0, &dword_0);
  sub_3FBB0((uint64_t)&unk_9DAF8, (const xmlChar *)"layer-ref", v30, v31, v32, v33, v34, v35, (uint64_t)qword_9D8F0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9DAF8, &dword_0);
  sub_3FDC0((uint64_t)&unk_9DB28, "proxy-master-layer", 0, 0, 0, (uint64_t)&unk_9DAF8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9DB28, &dword_0);
  sub_381AC(qword_9DB68, (uint64_t)&unk_9DB28);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9DB68, &dword_0);
  sub_3FBB0((uint64_t)&unk_9DB80, (const xmlChar *)"layer", v36, v37, v38, v39, v40, v41, (uint64_t)qword_9DAE0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9DB80, &dword_0);
  sub_3FDC0((uint64_t)&unk_9DBB0, "slide-page-layers", 0, 0, 0, (uint64_t)&unk_9DB80);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9DBB0, &dword_0);
  sub_381AC(qword_9DBF0, (uint64_t)&unk_9DBB0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9DBF0, &dword_0);
  sub_3FBB0((uint64_t)&unk_9DC08, (const xmlChar *)"geometry", v42, v43, v44, v45, v46, v47, (uint64_t)&qword_A20E8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9DC08, &dword_0);
  sub_3FDC0((uint64_t)&unk_9DC38, "slide-page", (uint64_t)sub_3DE0, 0, (uint64_t)sub_3EA4, (uint64_t)&unk_9DC08);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9DC38, &dword_0);
  sub_381D0(qword_9DC78, (uint64_t)&unk_9DC38, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9DC78, &dword_0);
  sub_3FBB0((uint64_t)&unk_9DC90, (const xmlChar *)"stylesheet", v48, v49, v50, v51, v52, v53, (uint64_t)&unk_9D908);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9DC90, &dword_0);
  sub_3FDC0((uint64_t)&unk_9DCC0, "abstract-slide", 0, 0, 0, (uint64_t)&unk_9DC90);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9DCC0, &dword_0);
}

uint64_t sub_47F4(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDBGBodyPlaceholder);
  char v7 = 1;
  if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "topObjectOfClass:", objc_opt_class()), "slideStyle"), "overridesBoolProperty:value:", 77, &v7))char v5 = v7; {
  else
  }
    char v5 = 1;
  v4->super.mIsVisible = v5;
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_4950()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mFrame");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9DD00, (uint64_t)&unk_A1668, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9DD00, &dword_0);
  sub_3FBB0((uint64_t)&unk_9DD28, (const xmlChar *)"text", v3, v4, v5, v6, v7, v8, (uint64_t)&unk_9DD00);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9DD28, &dword_0);
  sub_3FFC4((uint64_t)&unk_9DD58, "body-placeholder", (uint64_t)&unk_9DF08, (uint64_t)sub_47F4, 0, (uint64_t)&unk_9DD28);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_9DD58, &dword_0);
}

uint64_t sub_4A94(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDBGTemplateSlide);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_4B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9DDA0, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9DDA0, &dword_0);
  sub_3FFC4((uint64_t)&unk_9DDD0, "master-slide", (uint64_t)&unk_9DCC0, (uint64_t)sub_4A94, 0, (uint64_t)&unk_9DDA0);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_9DDD0, &dword_0);
  sub_381D0(qword_9DE18, (uint64_t)&unk_9DDD0, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9DE18, &dword_0);
}

id sub_4BFC(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDBGObjectPlaceholder);
  v4->super.mIsVisible = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "topObjectOfClass:", objc_opt_class()), "slideStyle"), "valueForBoolProperty:", 79);
  id v5 = (id)[(GQDBGObjectPlaceholder *)v4 readAttributesFromReader:a1 processor:a2];
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return v5;
}

uint64_t sub_4CBC(xmlTextReader *a1, void *a2)
{
  id v4 = [a2 documentState];
  uint64_t v5 = *((void *)[v4 peekObject] + 11);
  if (v5)
  {
    [v4 root];
    uint64_t v6 = +[GQDClassNameMap classForName:v5 inRootType:objc_opt_class()];
    if (v6)
    {
      uint64_t v7 = v6;
      [v4 setMustRegisterDrawables:1];
      id v8 = [(objc_class *)v7 stateForReading];
      sub_3AC58(a1, (uint64_t)v8, (uint64_t)&unk_9DE30, a2);
    }
  }
  return sub_3AD64(a1);
}

uint64_t sub_4DA0(void *a1, int a2)
{
  id v3 = [a1 documentState];
  [v3 setMustRegisterDrawables:0];
  if ((int)[v3 objectStackDepth] < a2) {
    return 3;
  }
  if ([v3 objectStackDepth] == a2) {
    return 2;
  }
  id v5 = [v3 popRetainedObject];
  uint64_t v6 = (id *)[v3 peekObject];

  v6[12] = v5;
  return 1;
}

uint64_t sub_4F20()
{
  sub_3823C(qword_9DE30, (uint64_t)sub_4CBC, (uint64_t)sub_4DA0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_9DE30, &dword_0);
  sub_3FBB0((uint64_t)&unk_9DE48, (const xmlChar *)"object", v0, v1, v2, v3, v4, v5, (uint64_t)qword_9DE30);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9DE48, &dword_0);
  sub_3FFC4((uint64_t)&unk_9DE78, "object-placeholder", (uint64_t)&unk_9DF08, (uint64_t)sub_4BFC, 0, (uint64_t)&unk_9DE48);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_9DE78, &dword_0);
}

uint64_t sub_50AC()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mStyle");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_9DEC0, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_9DEC0, &dword_0);
  sub_3FBB0((uint64_t)&unk_9DED8, (const xmlChar *)"placeholder-style-ref", v3, v4, v5, v6, v7, v8, (uint64_t)&unk_9DEC0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9DED8, &dword_0);
  sub_3FFC4((uint64_t)&unk_9DF08, "placeholder", (uint64_t)&unk_9E910, 0, 0, (uint64_t)&unk_9DED8);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_9DF08, &dword_0);
}

id sub_530C(xmlTextReader *a1, void *a2)
{
  uint64_t v4 = (double *)objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
  if (!sub_43488(a1, (void *)v4 + 11)) {
    return &dword_0 + 3;
  }
  objc_msgSend(a2, "setThumbnailSize:", v4[11], v4[12]);
  id v5 = [a2 generator];
  if (!v5) {
    return &dword_0 + 3;
  }
  uint64_t v6 = v5;
  id v7 = [a2 documentState];
  return [v6 handleSlideSize:v4 state:v7];
}

uint64_t sub_5CF0()
{
  sub_3823C(qword_9DF50, (uint64_t)sub_530C, 0);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_9DF50, &dword_0);
}

uint64_t sub_5D5C(uint64_t a1, void *a2)
{
  id v4 = [a2 documentState];
  id v5 = objc_alloc_init(GQDBGSlide);
  [(GQDBGAbstractSlide *)v5 readAttributesForSlide:a1];
  [v4 pushObject:v5];
  if (v5->super.mCallGenerator && ![(GQDBGAbstractSlide *)v5 isHidden])
  {
    id v6 = [a2 generator];
    if (v6) {
      [v6 beginSlide:v5 state:v4];
    }
  }

  return 1;
}

uint64_t sub_5DF8(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = [v4 popRetainedObject];
  id v6 = v5;
  if (v5[72] && ([v5 isHidden] & 1) == 0)
  {
    id v9 = [a1 generator];
    if (v9) {
      id v7 = [v9 endSlide:v6 state:v4];
    }
    else {
      id v7 = &dword_0 + 1;
    }
    if ([v4 isGeneratingThumbnail]) {
      [v4 setThumbnailGenerationDone:1];
    }
  }
  else
  {
    id v7 = &dword_0 + 1;
  }

  return (uint64_t)v7;
}

uint64_t sub_5F8C()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mTemplate");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_9DF68, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_9DF68, &dword_0);
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = class_getInstanceVariable(v3, "mNoteFrame");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9DF80, (uint64_t)&unk_A1668, v5);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9DF80, &dword_0);
  sub_3FBB0((uint64_t)&unk_9DFA8, (const xmlChar *)"master-ref", v6, v7, v8, v9, v10, v11, (uint64_t)&unk_9DF68);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9DFA8, &dword_0);
  sub_3FFC4((uint64_t)&unk_9DFD8, "slide", (uint64_t)&unk_9DCC0, (uint64_t)sub_5D5C, (uint64_t)sub_5DF8, (uint64_t)&unk_9DFA8);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_9DFD8, &dword_0);
}

uint64_t sub_615C(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDBGSlideNumberPlaceholder);
  v4->super.mIsVisible = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "topObjectOfClass:", objc_opt_class()), "slideStyle"), "valueForBoolProperty:", 78);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_6214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9E020, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E020, &dword_0);
  sub_3FFC4((uint64_t)&unk_9E050, "slide-number-placeholder", (uint64_t)&unk_9DF08, (uint64_t)sub_615C, 0, (uint64_t)&unk_9E020);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_9E050, &dword_0);
}

uint64_t sub_62D0(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_alloc_init(GQDBGTheme);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v3);

  return 1;
}

uint64_t sub_6318(uint64_t a1, void *a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return 1;
}

uint64_t sub_63CC()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mStylesheet");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9E098, (uint64_t)&unk_A2AE8, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9E098, &dword_0);
  sub_3FBB0((uint64_t)&unk_9E0C0, (const xmlChar *)"master-slide", v3, v4, v5, v6, v7, v8, (uint64_t)qword_9DE18);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E0C0, &dword_0);
  sub_3FDC0((uint64_t)&unk_9E0F0, "theme-masters", (uint64_t)sub_6318, 0, 0, (uint64_t)&unk_9E0C0);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9E0F0, &dword_0);
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = class_getInstanceVariable(v9, "mTemplateSlides");
  ptrdiff_t v11 = ivar_getOffset(v10);
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9E130, (uint64_t)&unk_9E0F0, v11);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9E130, &dword_0);
  sub_3FBB0((uint64_t)&unk_9E158, (const xmlChar *)"stylesheet", v12, v13, v14, v15, v16, v17, (uint64_t)&unk_9E098);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E158, &dword_0);
  sub_3FDC0((uint64_t)&unk_9E188, "theme", (uint64_t)sub_62D0, 0, 0, (uint64_t)&unk_9E158);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9E188, &dword_0);
}

uint64_t sub_6614(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDBGTitlePlaceholder);
  char v7 = 1;
  if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "topObjectOfClass:", objc_opt_class()), "slideStyle"), "overridesBoolProperty:value:", 76, &v7))char v5 = v7; {
  else
  }
    char v5 = 1;
  v4->super.mIsVisible = v5;
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_676C()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mFrame");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9E1C8, (uint64_t)&unk_A1668, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9E1C8, &dword_0);
  sub_3FBB0((uint64_t)&unk_9E1F0, (const xmlChar *)"text", v3, v4, v5, v6, v7, v8, (uint64_t)&unk_9E1C8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E1F0, &dword_0);
  sub_3FFC4((uint64_t)&unk_9E220, "title-placeholder", (uint64_t)&unk_9DF08, (uint64_t)sub_6614, 0, (uint64_t)&unk_9E1F0);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_9E220, &dword_0);
}

uint64_t sub_68B0(xmlTextReader *a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDChartModel);
  -[GQDChartModel setProcessorBundle:](v4, "setProcessorBundle:", [a2 bundle]);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  int64_t v6 = 0;
  if (sub_42E14(a1, qword_A35E8, (xmlChar *)"chart-direction", &v6)) {
    v4->mDirection = v6;
  }

  return 1;
}

uint64_t sub_6968(void *a1, int a2)
{
  if ((int)objc_msgSend(objc_msgSend(a1, "documentState"), "objectStackDepth") <= a2) {
    return 3;
  }
  id v3 = objc_msgSend(objc_msgSend(a1, "documentState"), "peekObject");
  if (![v3 direction]) {
    [v3 transpose];
  }
  return 1;
}

uint64_t sub_69C8(void *a1, int a2)
{
  if ((int)objc_msgSend(objc_msgSend(a1, "documentState"), "objectStackDepth") <= a2) {
    return 3;
  }
  id v3 = objc_msgSend(objc_msgSend(a1, "documentState"), "peekObject");
  uint64_t result = 1;
  v3[88] = 1;
  return result;
}

uint64_t sub_6A1C(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  uint64_t v5 = [v3 topObjectOfClass:objc_opt_class()];
  int64_t v6 = (const void *)v5[1];
  if (v6) {
    CFRelease(v6);
  }
  v5[1] = v4;
  return 1;
}

uint64_t sub_6A94(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  uint64_t v5 = [v3 topObjectOfClass:objc_opt_class()];
  int64_t v6 = (const void *)v5[2];
  if (v6) {
    CFRelease(v6);
  }
  v5[2] = v4;
  return 1;
}

uint64_t sub_6B0C(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  uint64_t v5 = [v3 topObjectOfClass:objc_opt_class()];
  int64_t v6 = (const void *)v5[3];
  if (v6) {
    CFRelease(v6);
  }
  v5[3] = v4;
  return 1;
}

uint64_t sub_6B84(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  uint64_t v5 = [v3 topObjectOfClass:objc_opt_class()];
  int64_t v6 = (const void *)v5[4];
  if (v6) {
    CFRelease(v6);
  }
  v5[4] = v4;
  return 1;
}

uint64_t sub_6BFC(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  uint64_t v5 = [v3 topObjectOfClass:objc_opt_class()];
  int64_t v6 = (const void *)v5[6];
  if (v6) {
    CFRelease(v6);
  }
  v5[6] = v4;
  return 1;
}

uint64_t sub_6C74(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  uint64_t v5 = [v3 topObjectOfClass:objc_opt_class()];
  int64_t v6 = (const void *)v5[8];
  if (v6) {
    CFRelease(v6);
  }
  v5[8] = v4;
  return 1;
}

uint64_t sub_6CEC(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  uint64_t v5 = [v3 topObjectOfClass:objc_opt_class()];
  int64_t v6 = (const void *)v5[9];
  if (v6) {
    CFRelease(v6);
  }
  v5[9] = v4;
  return 1;
}

uint64_t sub_6D64(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  uint64_t v5 = [v3 topObjectOfClass:objc_opt_class()];
  int64_t v6 = (const void *)v5[7];
  if (v6) {
    CFRelease(v6);
  }
  v5[7] = v4;
  return 1;
}

uint64_t sub_72B4(xmlTextReader *a1, void *a2)
{
  id v4 = objc_alloc_init(GQDChart);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  uint64_t v6 = 1;
  if (sub_42E14(a1, qword_A35E8, (xmlChar *)"chart-type", &v6)) {
    v4->mType = v6;
  }

  return sub_92A4(a1, a2);
}

uint64_t sub_736C(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_38260((uint64_t)&unk_A2888, a1, (uint64_t)a2);
  if (v3 == 1)
  {
    id v4 = [a2 documentState];
    id v5 = [v4 popRetainedObject];
    uint64_t v6 = [v4 peekObject];
    v6[10] = v5;
    *((unsigned char *)v6 + 88) = 1;
  }
  return v3;
}

uint64_t sub_7528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9E268, 0, a3, a4, a5, a6, a7, a8, v41);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E268, &dword_0);
  sub_3FDC0((uint64_t)&unk_9E298, "chart-title", (uint64_t)sub_3CC24, 0, 0, (uint64_t)&unk_9E268);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9E298, &dword_0);
  sub_3FDC0((uint64_t)&unk_9E2D8, "value-title", (uint64_t)sub_3CC24, 0, 0, (uint64_t)&unk_9E268);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9E2D8, &dword_0);
  sub_3FDC0((uint64_t)&unk_9E318, "value-y2-title", (uint64_t)sub_3CC24, 0, 0, (uint64_t)&unk_9E268);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9E318, &dword_0);
  sub_3FDC0((uint64_t)&unk_9E358, "catagory-title", (uint64_t)sub_3CC24, 0, 0, (uint64_t)&unk_9E268);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9E358, &dword_0);
  sub_381D0(qword_9E398, (uint64_t)&unk_A2C28, (uint64_t)sub_6A1C);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9E398, &dword_0);
  sub_381D0(qword_9E3B0, (uint64_t)&unk_A2C28, (uint64_t)sub_6A94);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9E3B0, &dword_0);
  sub_381D0(qword_9E3C8, (uint64_t)&unk_A2C28, (uint64_t)sub_6B0C);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9E3C8, &dword_0);
  sub_381D0(qword_9E3E0, (uint64_t)&unk_A2DC0, (uint64_t)sub_6B84);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9E3E0, &dword_0);
  sub_381D0(qword_9E3F8, (uint64_t)&unk_9E298, (uint64_t)sub_6BFC);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9E3F8, &dword_0);
  sub_381D0(qword_9E410, (uint64_t)&unk_9E2D8, (uint64_t)sub_6C74);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9E410, &dword_0);
  sub_381D0(qword_9E428, (uint64_t)&unk_9E318, (uint64_t)sub_6CEC);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9E428, &dword_0);
  sub_381D0(qword_9E440, (uint64_t)&unk_9E358, (uint64_t)sub_6D64);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9E440, &dword_0);
  sub_3FBB0((uint64_t)&unk_9E458, (const xmlChar *)"chart-data", v8, v9, v10, v11, v12, v13, (uint64_t)qword_9E398);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E458, &dword_0);
  sub_3FDC0((uint64_t)&unk_9E488, "chart-model", (uint64_t)sub_68B0, (uint64_t)&qword_A20E8, (uint64_t)sub_6968, (uint64_t)&unk_9E458);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9E488, &dword_0);
  sub_3FFC4((uint64_t)&unk_9E4C8, "formula-chart-model", (uint64_t)&unk_9E488, (uint64_t)sub_68B0, (uint64_t)sub_69C8, (uint64_t)&unk_9E458);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_9E4C8, &dword_0);
  uint64_t v14 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v14, "mStyle");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_9E510, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_9E510, &dword_0);
  sub_3FBB0((uint64_t)&unk_9E528, 0, v17, v18, v19, v20, v21, v22, v42);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E528, &dword_0);
  sub_3FDC0((uint64_t)&unk_9E558, "chart-style", 0, (uint64_t)&unk_9E510, 0, (uint64_t)&unk_9E528);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9E558, &dword_0);
  sub_3823C(qword_9E598, (uint64_t)sub_736C, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_9E598, &dword_0);
  uint64_t v23 = (objc_class *)objc_opt_class();
  uint64_t v24 = class_getInstanceVariable(v23, "mLegend");
  ptrdiff_t v25 = ivar_getOffset(v24);
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  sub_382BC((uint64_t)&unk_9E5B0, (uint64_t)&unk_9E728, v25, v26, v27, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9E5B0, &dword_0);
  uint64_t v28 = (objc_class *)objc_opt_class();
  uint64_t v29 = class_getInstanceVariable(v28, "mModel");
  ptrdiff_t v30 = ivar_getOffset(v29);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9E5D8, (uint64_t)&unk_9E488, v30);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9E5D8, &dword_0);
  uint64_t v31 = (objc_class *)objc_opt_class();
  uint64_t v32 = class_getInstanceVariable(v31, "mModel");
  ptrdiff_t v33 = ivar_getOffset(v32);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9E600, (uint64_t)&unk_9E4C8, v33);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9E600, &dword_0);
  sub_381D0(qword_9E628, (uint64_t)&unk_9E558, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9E628, &dword_0);
  sub_3FBB0((uint64_t)&unk_9E640, (const xmlChar *)"chart-legendInfo", v34, v35, v36, v37, v38, v39, (uint64_t)&unk_9E5B0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E640, &dword_0);
  sub_3FFC4((uint64_t)&unk_9E670, "chart", (uint64_t)&unk_9E910, (uint64_t)sub_72B4, (uint64_t)sub_ABB0, (uint64_t)&unk_9E640);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_9E670, &dword_0);
}

uint64_t sub_7D18(xmlTextReader *a1, void *a2)
{
  id v4 = objc_alloc_init(GQDChartLegend);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);

  return sub_92A4(a1, a2);
}

uint64_t sub_7D98(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_38260((uint64_t)&unk_A2888, a1, (uint64_t)a2);
  if (v3 == 1)
  {
    id v4 = [a2 documentState];
    id v5 = [v4 popRetainedObject];
    uint64_t v6 = [v4 peekObject];
    v6[10] = v5;
    *((unsigned char *)v6 + 88) = 1;
  }
  return v3;
}

uint64_t sub_7EAC()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mChart");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  sub_382BC((uint64_t)&unk_9E6B8, (uint64_t)&unk_9E670, Offset, v3, v4, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9E6B8, &dword_0);
  sub_3823C(qword_9E6E0, (uint64_t)sub_7D98, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_9E6E0, &dword_0);
  sub_3FBB0((uint64_t)&unk_9E6F8, (const xmlChar *)"legend-chartInfo", v5, v6, v7, v8, v9, v10, (uint64_t)&unk_9E6B8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E6F8, &dword_0);
  sub_3FFC4((uint64_t)&unk_9E728, "chartLegend", (uint64_t)&unk_9E910, (uint64_t)sub_7D18, (uint64_t)sub_ABB0, (uint64_t)&unk_9E6F8);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_9E728, &dword_0);
}

void *sub_8060()
{
  uint64_t v0 = malloc_type_malloc(8uLL, 0x80040B8603338uLL);
  if (v0)
  {
    NSMapTableKeyCallBacks keyCallBacks = off_850B0;
    NSMapTableValueCallBacks v2 = NSNonOwnedPointerMapValueCallBacks;
    void *v0 = NSCreateMapTable(&keyCallBacks, &v2, 0);
  }
  return v0;
}

uint64_t sub_891C(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t sub_91E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9E770, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E770, &dword_0);
  sub_3FDC0((uint64_t)&unk_9E7A0, "color", (uint64_t)sub_891C, (uint64_t)&qword_A20E8, 0, (uint64_t)&unk_9E770);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9E7A0, &dword_0);
}

uint64_t sub_92A4(xmlTextReader *a1, void *a2)
{
  id v3 = [a2 documentState];
  id v4 = [v3 peekObject];
  *((void *)v4 + 3) = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3D8, *(const xmlChar **)(qword_A35E0 + 16));
  if ([v3 mustRegisterDrawables]) {
    objc_msgSend(objc_msgSend(v3, "root"), "addObject:withOwnedXmlUid:", v4, xmlStrdup(*((const xmlChar **)v4 + 3)));
  }
  uint64_t v5 = sub_4340C(a1, qword_A35E8, (xmlChar *)"href");
  if (v5)
  {
    uint64_t v6 = v5;
    *((void *)v4 + 2) = CFURLCreateWithString(0, (CFStringRef)v5, 0);
    CFRelease(v6);
  }
  *((unsigned char *)v4 + 56) = sub_42E14(a1, qword_A3608, (xmlChar *)"order", (void *)v4 + 8);
  return 1;
}

void sub_95C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_9804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_9CF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_9D34(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 0:
      goto LABEL_17;
    case 1:
      if (*(unsigned char *)a1)
      {
        double v4 = *(double *)(a1 + 32);
        uint64_t v5 = *(double **)(a2 + 8);
        double v6 = v5[1];
        if (v4 != v6)
        {
          double v7 = *(double *)(a1 + 24);
          double v8 = *v5;
          uint64_t v9 = objc_alloc_init(GQDBezierLine);
          uint64_t v10 = v9;
          if (v4 >= v6) {
            double v11 = v8;
          }
          else {
            double v11 = v7;
          }
          if (v4 >= v6) {
            double v12 = v6;
          }
          else {
            double v12 = v4;
          }
          if (v4 >= v6) {
            double v13 = v7;
          }
          else {
            double v13 = v8;
          }
          if (v4 >= v6) {
            double v14 = v4;
          }
          else {
            double v14 = v6;
          }
          v9->mUpper.x = v11;
          v9->mUpper.y = v12;
          v9->mLower.x = v13;
          v9->mLower.y = v14;
          CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), v9);
        }
      }
LABEL_17:
      long long v15 = *(_OWORD *)*(void *)(a2 + 8);
      goto LABEL_20;
    case 2:
      long long v15 = *(_OWORD *)(*(void *)(a2 + 8) + 16);
      goto LABEL_20;
    case 3:
      long long v15 = *(_OWORD *)(*(void *)(a2 + 8) + 32);
LABEL_20:
      *(_OWORD *)(a1 + 24) = v15;
      break;
    case 4:
      if (*(unsigned char *)(a1 + 48))
      {
        if (*(unsigned char *)a1)
        {
          double v16 = *(double *)(a1 + 16);
          double v17 = *(double *)(a1 + 32);
          if (v16 != v17)
          {
            double v18 = *(double *)(a1 + 8);
            double v19 = *(double *)(a1 + 24);
            uint64_t v20 = objc_alloc_init(GQDBezierLine);
            uint64_t v21 = v20;
            if (v17 >= v16) {
              double v22 = v18;
            }
            else {
              double v22 = v19;
            }
            if (v17 >= v16) {
              double v23 = v16;
            }
            else {
              double v23 = v17;
            }
            if (v17 >= v16) {
              double v24 = v19;
            }
            else {
              double v24 = v18;
            }
            if (v17 >= v16) {
              double v25 = v17;
            }
            else {
              double v25 = v16;
            }
            v20->mUpper.x = v22;
            v20->mUpper.y = v23;
            v20->mLower.x = v24;
            v20->mLower.y = v25;
            CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), v20);
          }
        }
      }
      break;
    default:
      break;
  }
  if (*(unsigned char *)(a1 + 48) && !*(unsigned char *)a1) {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a1 + 24);
  }
  *(unsigned char *)a1 = 1;
}

void sub_9FBC(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_9FBC(a1, *a2);
    sub_9FBC(a1, a2[1]);

    operator delete(a2);
  }
}

void sub_A024(void *a1)
{
}

uint64_t *sub_A038(uint64_t **a1, id *a2, void **a3)
{
  uint64_t v5 = (uint64_t **)sub_A0B8((uint64_t)a1, &v8, a2);
  uint64_t result = *v5;
  if (!*v5)
  {
    sub_A17C((uint64_t)a1, a3, (uint64_t)&v7);
    sub_A1D4(a1, v8, v5, v7);
    return v7;
  }
  return result;
}

uint64_t *sub_A0B8(uint64_t a1, void *a2, id *a3)
{
  uint64_t v5 = (uint64_t *)(a1 + 8);
  double v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        uint64_t v8 = v4;
        if (((uint64_t (*)(id, void, uint64_t))[*a3 methodForSelector:*(void *)(a1 + 24)])(*a3, *(void *)(a1 + 24), v4[4]) != -1)break; {
        double v4 = (uint64_t *)*v8;
        }
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_9;
        }
      }
      if (((uint64_t (*)(uint64_t, void, id))[(id)v8[4] methodForSelector:*(void *)(a1 + 24)])(v8[4], *(void *)(a1 + 24), *a3) != -1)break; {
      uint64_t v5 = v8 + 1;
      }
      double v4 = (uint64_t *)v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (uint64_t *)(a1 + 8);
  }
LABEL_9:
  *a2 = v8;
  return v5;
}

id sub_A17C@<X0>(uint64_t a1@<X0>, void **a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  double v6 = operator new(0x28uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  double v7 = *a2;
  v6[4] = *a2;
  id result = v7;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

uint64_t *sub_A1D4(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  id result = sub_A260(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void sub_A22C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t *sub_A260(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      NSMapTableValueCallBacks v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      id v3 = (uint64_t *)v2[2];
      double v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              id v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *uint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            id v3 = v9[2];
            NSMapTableValueCallBacks v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *NSMapTableValueCallBacks v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            id v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          id v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        NSMapTableValueCallBacks v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *NSMapTableValueCallBacks v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

id sub_A3F8(uint64_t a1, void **a2)
{
  id v3 = *(void ***)(a1 + 8);
  double v4 = *a2;
  uint64_t *v3 = *a2;
  id result = v4;
  *(void *)(a1 + 8) = v3 + 1;
  return result;
}

uint64_t sub_A434(uint64_t *a1, void **a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 3;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 61) {
    sub_A594();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 2 > v5) {
    unint64_t v5 = v8 >> 2;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v9 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  v16[4] = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_A63C(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (void **)&v10[8 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[8 * v9];
  uint64_t v12 = *a2;
  *uint64_t v11 = *a2;
  id v13 = v12;
  v16[2] = v11 + 1;
  sub_A51C(a1, v16);
  uint64_t v14 = a1[1];
  sub_A824((uint64_t)v16);
  return v14;
}

void sub_A504(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_A824((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_A51C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_A674((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void sub_A594()
{
}

void sub_A5AC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_A608(exception, a1);
}

void sub_A5F4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_A608(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_A63C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_A22C();
  }
  return operator new(8 * a2);
}

uint64_t sub_A674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v17 = a6;
  *((void *)&v17 + 1) = a7;
  long long v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  v14[2] = &v17;
  char v15 = 0;
  if (a3 == a5)
  {
    uint64_t v12 = a6;
  }
  else
  {
    uint64_t v9 = a3;
    do
    {
      uint64_t v10 = *(void **)(v9 - 8);
      v9 -= 8;
      *(void *)(v7 - 8) = v10;
      id v11 = v10;
      uint64_t v7 = *((void *)&v17 + 1) - 8;
      *((void *)&v17 + 1) -= 8;
    }
    while (v9 != a5);
    uint64_t v12 = v17;
  }
  char v15 = 1;
  sub_A71C((uint64_t)v14);
  return v12;
}

uint64_t sub_A71C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_A754((uint64_t *)a1);
  }
  return a1;
}

void sub_A754(uint64_t *a1)
{
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v14 = v3;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v2;
  uint64_t v4 = *a1;
  uint64_t v5 = (uint64_t *)a1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = v6;
  sub_A7CC(v4, (uint64_t)v13, (uint64_t)v8);
}

void sub_A7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (i = *(id **)(a2 + 32); i != *(id **)(a3 + 32); *(void *)(a2 + 32) = i)
  {

    i = (id *)(*(void *)(a2 + 32) + 8);
  }
}

uint64_t sub_A824(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_A85C(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    if (v4 == a2) {
      break;
    }
    uint64_t v5 = *(void **)(v4 - 8);
    *(void *)(a1 + 16) = v4 - 8;
  }
}

void *sub_A8A0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_A22C();
  }
  return operator new(4 * a2);
}

uint64_t sub_A8D8()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mGeometry");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9E7E0, (uint64_t)&unk_9D810, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9E7E0, &dword_0);
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = class_getInstanceVariable(v3, "mWrapPath");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9E808, (uint64_t)&unk_9D8B0, v5);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9E808, &dword_0);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = class_getInstanceVariable(v6, "mWrapGeometry");
  ptrdiff_t v8 = ivar_getOffset(v7);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9E830, (uint64_t)&unk_9D810, v8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9E830, &dword_0);
  sub_3FBB0((uint64_t)&unk_9E858, (const xmlChar *)"path", v9, v10, v11, v12, v13, v14, (uint64_t)&unk_9E808);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E858, &dword_0);
  sub_3FDC0((uint64_t)&unk_9E888, "drawable-wrap", 0, 0, 0, (uint64_t)&unk_9E858);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9E888, &dword_0);
  sub_381AC(qword_9E8C8, (uint64_t)&unk_9E888);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9E8C8, &dword_0);
  sub_3FBB0((uint64_t)&unk_9E8E0, (const xmlChar *)"geometry", v15, v16, v17, v18, v19, v20, (uint64_t)&unk_9E7E0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E8E0, &dword_0);
  sub_3FDC0((uint64_t)&unk_9E910, "drawable", (uint64_t)sub_92A4, 0, 0, (uint64_t)&unk_9E8E0);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9E910, &dword_0);
}

id sub_ABB0(void *a1)
{
  id v2 = [a1 documentState];
  if ([v2 doExternalTextWrap]
    && (uint64_t v3 = objc_msgSend(objc_msgSend(a1, "documentState"), "peekObject"),
        id v4 = [v3 graphicStyle],
        id v6 = 0,
        v3[4])
    && [v4 hasValueForObjectProperty:72 value:&v6]
    && [v6 floatingWrapEnabled])
  {
    return objc_msgSend(v3, "collectWrapPointsForState:graphicStyle:", v2, objc_msgSend(v3, "graphicStyle"));
  }
  else
  {
    return &dword_0 + 1;
  }
}

uint64_t sub_ACB4()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mGraphicStyle");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_9E950, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_9E950, &dword_0);
  sub_3FBB0((uint64_t)&unk_9E968, 0, v3, v4, v5, v6, v7, v8, v16);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E968, &dword_0);
  sub_3FDC0((uint64_t)&unk_9E998, "graphic-style", 0, (uint64_t)&unk_9E950, 0, (uint64_t)&unk_9E968);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9E998, &dword_0);
  sub_381D0(qword_9E9D8, (uint64_t)&unk_9E998, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9E9D8, &dword_0);
  sub_3FBB0((uint64_t)&unk_9E9F0, (const xmlChar *)"style", v9, v10, v11, v12, v13, v14, (uint64_t)qword_9E9D8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9E9F0, &dword_0);
  sub_3FFC4((uint64_t)&unk_9EA20, "drawable-graphic", (uint64_t)&unk_9E910, 0, (uint64_t)sub_ABB0, (uint64_t)&unk_9E9F0);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_9EA20, &dword_0);
}

uint64_t sub_AE98(xmlTextReader *a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDGroup);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  uint64_t v5 = sub_92A4(a1, a2);
  if (v5 == 1)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
    CFRelease(Mutable);
  }
  return v5;
}

uint64_t sub_AF34(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  uint64_t v5 = [v3 peekObject];
  uint64_t v6 = (const void *)v5[9];
  if (v6) {
    CFRelease(v6);
  }
  v5[9] = v4;
  return 1;
}

uint64_t sub_AFB0(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  uint64_t v5 = (id *)[v3 topObjectOfClass:objc_opt_class()];

  v5[1] = v4;
  return 1;
}

uint64_t sub_B03C(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  uint64_t v5 = (id *)[v3 topObjectOfClass:objc_opt_class()];

  v5[10] = v4;
  return 1;
}

uint64_t sub_B0C4(xmlTextReader *a1, void *a2)
{
  id v3 = [a2 documentState];
  id v4 = (id *)[v3 topObjectOfClass:objc_opt_class()];
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 3;
  }
  uint64_t v6 = AttributeNs;
  id v7 = objc_msgSend(objc_msgSend(v3, "root"), "objectWithXmlUid:", AttributeNs);

  v4[10] = v7;
  xmlFree(v6);
  return 1;
}

uint64_t sub_B224()
{
  sub_381D0(qword_9EA68, (uint64_t)&unk_9D810, (uint64_t)sub_AFB0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9EA68, &dword_0);
  sub_381D0(qword_9EA80, (uint64_t)&unk_A1498, (uint64_t)sub_B03C);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9EA80, &dword_0);
  sub_3823C(qword_9EA98, (uint64_t)sub_B0C4, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_9EA98, &dword_0);
  sub_3FBB0((uint64_t)&unk_9EAB0, (const xmlChar *)"geometry", v0, v1, v2, v3, v4, v5, (uint64_t)qword_9EA68);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9EAB0, &dword_0);
  sub_3FDC0((uint64_t)&unk_9EAE0, "drawable-group", (uint64_t)sub_AE98, (uint64_t)&qword_A2878, (uint64_t)sub_AF34, (uint64_t)&unk_9EAB0);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9EAE0, &dword_0);
}

uint64_t sub_B3E8(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDImageBinary);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);

  return 1;
}

id sub_B454(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
  return [v3 readDataAttributesFromReader:a1];
}

uint64_t sub_B61C()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mSize");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  sub_384B0(qword_9EB20, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2, qword_9EB20, &dword_0);
  sub_3F8F8(qword_9EB30, 0, v3, v4, v5, v6, v7, v8, v16);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_9EB30, &dword_0);
  sub_3FDC0((uint64_t)&unk_9EB50, "data", (uint64_t)sub_B454, 0, 0, (uint64_t)qword_9EB30);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9EB50, &dword_0);
  sub_381AC(qword_9EB90, (uint64_t)&unk_9EB50);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9EB90, &dword_0);
  sub_3FBB0((uint64_t)&unk_9EBA8, (const xmlChar *)"size", v9, v10, v11, v12, v13, v14, (uint64_t)qword_9EB20);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9EBA8, &dword_0);
  sub_3FDC0((uint64_t)&unk_9EBD8, "image-binary", (uint64_t)sub_B3E8, 0, 0, (uint64_t)&unk_9EBA8);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9EBD8, &dword_0);
}

uint64_t sub_B7F8(xmlTextReader *a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDLine);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return sub_92A4(a1, a2);
}

uint64_t sub_B86C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9EC18, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9EC18, &dword_0);
  sub_3FFC4((uint64_t)&unk_9EC48, "line", (uint64_t)&unk_9EA20, (uint64_t)sub_B7F8, (uint64_t)sub_ABB0, (uint64_t)&unk_9EC18);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_9EC48, &dword_0);
}

uint64_t sub_BC7C(xmlTextReader *a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDMedia);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return sub_92A4(a1, a2);
}

uint64_t sub_BDE4()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mOriginalImageBinary");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9EC90, (uint64_t)&unk_9EBD8, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9EC90, &dword_0);
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = class_getInstanceVariable(v3, "mFilteredImage");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_38394((uint64_t)&unk_9ECB8, v5, 1);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_9ECB8, &dword_0);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = class_getInstanceVariable(v6, "mFilteredImage");
  ptrdiff_t v8 = ivar_getOffset(v7);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9ECD0, (uint64_t)&unk_A3E90, v8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9ECD0, &dword_0);
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = class_getInstanceVariable(v9, "mCropGeometry");
  ptrdiff_t v11 = ivar_getOffset(v10);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9ECF8, (uint64_t)&unk_9D810, v11);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9ECF8, &dword_0);
  uint64_t v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = class_getInstanceVariable(v12, "mMaskingShapePath");
  ptrdiff_t v14 = ivar_getOffset(v13);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9ED20, (uint64_t)&unk_9D8B0, v14);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9ED20, &dword_0);
  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = class_getInstanceVariable(v15, "mMaskingShapePath");
  ptrdiff_t v17 = ivar_getOffset(v16);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9ED48, (uint64_t)&unk_9F328, v17);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9ED48, &dword_0);
  uint64_t v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = class_getInstanceVariable(v18, "mMaskingShapePath");
  ptrdiff_t v20 = ivar_getOffset(v19);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9ED70, (uint64_t)&unk_A37D0, v20);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9ED70, &dword_0);
  uint64_t v21 = (objc_class *)objc_opt_class();
  double v22 = class_getInstanceVariable(v21, "mMaskingShapePath");
  ptrdiff_t v23 = ivar_getOffset(v22);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9ED98, (uint64_t)&unk_A4038, v23);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9ED98, &dword_0);
  double v24 = (objc_class *)objc_opt_class();
  double v25 = class_getInstanceVariable(v24, "mMaskingShapePath");
  ptrdiff_t v26 = ivar_getOffset(v25);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9EDC0, (uint64_t)&unk_A3C70, v26);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9EDC0, &dword_0);
  uint64_t v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = class_getInstanceVariable(v27, "mMaskingShapePath");
  ptrdiff_t v29 = ivar_getOffset(v28);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9EDE8, (uint64_t)&unk_A3F40, v29);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9EDE8, &dword_0);
  ptrdiff_t v30 = (objc_class *)objc_opt_class();
  uint64_t v31 = class_getInstanceVariable(v30, "mAlphaMaskBezier");
  ptrdiff_t v32 = ivar_getOffset(v31);
  objc_opt_class();
  sub_385F8(qword_9EE10, v32);
  __cxa_atexit((void (*)(void *))j_nullsub_2_6, qword_9EE10, &dword_0);
  sub_3FBB0((uint64_t)&unk_9EE20, (const xmlChar *)"filtered-image-ref", v33, v34, v35, v36, v37, v38, (uint64_t)&unk_9ECB8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9EE20, &dword_0);
  sub_3FFC4((uint64_t)&unk_9EE50, "media", (uint64_t)&unk_9EA20, (uint64_t)sub_BC7C, (uint64_t)sub_ABB0, (uint64_t)&unk_9EE20);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_9EE50, &dword_0);
}

uint64_t sub_C3FC(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDRFrame);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);

  return 1;
}

uint64_t sub_C548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9EE98, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9EE98, &dword_0);
  sub_3FDC0((uint64_t)&unk_9EEC8, "frame", (uint64_t)sub_C3FC, 0, 0, (uint64_t)&unk_9EE98);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9EEC8, &dword_0);
}

id sub_C600(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDRGradient);
  id v5 = (id)[(GQDRGradient *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  }

  return v5;
}

uint64_t sub_C680(uint64_t a1, void *a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return 1;
}

uint64_t sub_C6D4(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  *((void *)[v3 peekObject] + 1) = v4;
  return 1;
}

uint64_t sub_C86C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dword_A4088 = 0;
  qword_A4090 = (uint64_t)"linear";
  dword_A4098 = 1;
  qword_A40A0 = (uint64_t)"radial";
  xmmword_A40A8 = xmmword_9D3E8;
  sub_3FBB0((uint64_t)&unk_9EF08, (const xmlChar *)"gradient-stop", a3, a4, a5, a6, a7, a8, (uint64_t)&unk_9F0F8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9EF08, &dword_0);
  sub_3FDC0((uint64_t)&unk_9EF38, "stops", (uint64_t)sub_C680, 0, (uint64_t)sub_C6D4, (uint64_t)&unk_9EF08);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9EF38, &dword_0);
  sub_381AC(qword_9EF78, (uint64_t)&unk_9EF38);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9EF78, &dword_0);
  ptrdiff_t v8 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v8, "mStart");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  sub_38554(qword_9EF90, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_0, qword_9EF90, &dword_0);
  ptrdiff_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = class_getInstanceVariable(v11, "mEnd");
  ptrdiff_t v13 = ivar_getOffset(v12);
  objc_opt_class();
  sub_38554(qword_9EFA0, v13);
  __cxa_atexit((void (*)(void *))j_nullsub_2_0, qword_9EFA0, &dword_0);
  sub_3FBB0((uint64_t)&unk_9EFB0, (const xmlChar *)"stops", v14, v15, v16, v17, v18, v19, (uint64_t)qword_9EF78);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9EFB0, &dword_0);
  sub_3FDC0((uint64_t)&unk_9EFE0, "gradient", (uint64_t)sub_C600, 0, 0, (uint64_t)&unk_9EFB0);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9EFE0, &dword_0);
}

id sub_CB1C(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDRGradientStop);
  id v5 = (id)[(GQDRGradientStop *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  }

  return v5;
}

uint64_t sub_CB9C(xmlTextReader *a1, void *a2)
{
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 3;
  }
  id v4 = AttributeNs;
  id v5 = objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "objectWithXmlUid:", AttributeNs);
  if (v5)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v5);
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 3;
  }
  xmlFree(v4);
  return v6;
}

uint64_t sub_CCF0()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mColor");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9F020, (uint64_t)&unk_9E7A0, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9F020, &dword_0);
  sub_3FBB0((uint64_t)&unk_9F048, (const xmlChar *)"color", v3, v4, v5, v6, v7, v8, (uint64_t)&unk_9F020);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9F048, &dword_0);
  sub_3FDC0((uint64_t)&unk_9F078, "gradient-stop", (uint64_t)sub_CB1C, 0, 0, (uint64_t)&unk_9F048);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9F078, &dword_0);
  sub_3FDC0((uint64_t)&unk_9F0B8, "gradient-stop-ref", (uint64_t)sub_CB9C, 0, 0, (uint64_t)&unk_9F048);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9F0B8, &dword_0);
  sub_381D0(qword_9F0F8, (uint64_t)&unk_9F078, (uint64_t)sub_3CC80);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F0F8, &dword_0);
  sub_381D0(qword_9F110, (uint64_t)&unk_9F0B8, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F110, &dword_0);
}

id sub_D4F4(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDRStroke);
  id v5 = (id)[(GQDRStroke *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  }

  return v5;
}

uint64_t sub_D780()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mPattern");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9F128, (uint64_t)&unk_9F230, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9F128, &dword_0);
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = class_getInstanceVariable(v3, "mPattern");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_9F150, v5);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_9F150, &dword_0);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = class_getInstanceVariable(v6, "mColor");
  ptrdiff_t v8 = ivar_getOffset(v7);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9F168, (uint64_t)&unk_9E7A0, v8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9F168, &dword_0);
  sub_3FBB0((uint64_t)&unk_9F190, (const xmlChar *)"pattern", v9, v10, v11, v12, v13, v14, (uint64_t)&unk_9F128);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9F190, &dword_0);
  sub_3FDC0((uint64_t)&unk_9F1C0, "stroke", (uint64_t)sub_D4F4, 0, 0, (uint64_t)&unk_9F190);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9F1C0, &dword_0);
}

id sub_D9BC(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDRStrokePattern);
  id v5 = (id)[(GQDRStrokePattern *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    id v6 = [a2 documentState];
    [v6 pushObject:v4];
    objc_msgSend(objc_msgSend(v6, "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  }

  return v5;
}

uint64_t sub_DB14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9F200, (const xmlChar *)"pattern", a3, a4, a5, a6, a7, a8, (uint64_t)&qword_A20E8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9F200, &dword_0);
  sub_3FDC0((uint64_t)&unk_9F230, "stroke-pattern", (uint64_t)sub_D9BC, 0, 0, (uint64_t)&unk_9F200);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9F230, &dword_0);
}

id sub_DBE4(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDScalarPath);
  id v5 = (id)[(GQDScalarPath *)v4 readAttributesFromReader:a1 processor:a2];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  }

  return v5;
}

uint64_t sub_DC68(xmlTextReader *a1, void *a2)
{
  if (sub_43488(a1, objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject") + 4)) {
    return 1;
  }
  else {
    return 3;
  }
}

uint64_t sub_E06C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9F270, 0, a3, a4, a5, a6, a7, a8, v15);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9F270, &dword_0);
  sub_3FDC0((uint64_t)&unk_9F2A0, "size", (uint64_t)sub_DC68, 0, 0, (uint64_t)&unk_9F270);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9F2A0, &dword_0);
  sub_381AC(qword_9F2E0, (uint64_t)&unk_9F2A0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F2E0, &dword_0);
  sub_3FBB0((uint64_t)&unk_9F2F8, (const xmlChar *)"size", v8, v9, v10, v11, v12, v13, (uint64_t)qword_9F2E0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9F2F8, &dword_0);
  sub_3FDC0((uint64_t)&unk_9F328, "scalar-path", (uint64_t)sub_DBE4, 0, 0, (uint64_t)&unk_9F2F8);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9F328, &dword_0);
}

uint64_t sub_E1DC(xmlTextReader *a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDShape);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return sub_92A4(a1, a2);
}

void sub_E4AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(CGPath **)a1;
  uint64_t v4 = *(const CGAffineTransform **)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  switch(*(_DWORD *)a2)
  {
    case 0:
      CGPathMoveToPoint(*(CGMutablePathRef *)a1, v4, *(CGFloat *)v5, *(CGFloat *)(v5 + 8));
      goto LABEL_4;
    case 1:
      CGPathAddLineToPoint(*(CGMutablePathRef *)a1, v4, *(CGFloat *)v5, *(CGFloat *)(v5 + 8));
LABEL_4:
      *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
      break;
    case 3:
      id v6 = (_OWORD *)(a1 + 16);
      float64x2_t v7 = *(float64x2_t *)(a1 + 16);
      uint64_t v8 = (_OWORD *)(v5 + 32);
      float64x2_t v9 = *(float64x2_t *)(v5 + 16);
      float64x2_t v10 = vsubq_f64(*(float64x2_t *)v5, v7);
      float64x2_t v11 = vsubq_f64(v9, *(float64x2_t *)v5);
      float64x2_t x = *(float64x2_t *)(v5 + 32);
      float64x2_t v12 = vsubq_f64(v11, v10);
      float64x2_t v13 = vsubq_f64(vsubq_f64(x, v9), v11);
      float64x2_t v14 = (float64x2_t)vzip2q_s64((int64x2_t)v12, (int64x2_t)v13);
      float64x2_t v15 = (float64x2_t)vzip1q_s64((int64x2_t)v12, (int64x2_t)v13);
      float64x2_t v16 = vmlaq_f64(vmulq_f64(v14, v14), v15, v15);
      if (v16.f64[0] <= v16.f64[1]) {
        v16.f64[0] = v16.f64[1];
      }
      double v17 = v16.f64[0] * 9.0 * 0.0625;
      if (v17 > 0.36)
      {
        float64x2_t v18 = vaddq_f64(v10, v12);
        float64x2_t v19 = vsubq_f64(v13, v12);
        __asm { FMOV            V5.2D, #3.0 }
        float64x2_t v25 = vaddq_f64(v12, v19);
        __asm { FMOV            V6.2D, #6.0 }
        float64x2_t v27 = vmulq_f64(v19, _Q6);
        float64x2_t v28 = vmlaq_f64(v19, _Q5, v18);
        float64x2_t v29 = vmulq_f64(v25, _Q6);
        uint64_t v30 = 1;
        __asm
        {
          FMOV            V3.2D, #0.125
          FMOV            V4.2D, #0.25
          FMOV            V5.2D, #0.5
        }
        do
        {
          uint64_t v34 = v30;
          float64x2_t v27 = vmulq_f64(v27, _Q3);
          float64x2_t v29 = vsubq_f64(vmulq_f64(v29, _Q4), v27);
          float64x2_t v28 = vsubq_f64(vmulq_f64(v28, _Q5), vmulq_f64(v29, _Q5));
          v30 *= 2;
          double v17 = v17 * 0.0625;
        }
        while (v17 > 0.36 && v30 <= 0x10000);
        if (v30 >= 2)
        {
          v15.f64[0] = v29.f64[1];
          double v35 = v27.f64[1];
          unint64_t v36 = (2 * v34) | 1;
          do
          {
            float64x2_t v43 = v27;
            float64x2_t v44 = vaddq_f64(v28, v7);
            v37.f64[1] = v28.f64[1];
            v37.f64[0] = v29.f64[0];
            float64_t v38 = v27.f64[0] + v29.f64[0];
            v28.f64[1] = v15.f64[0];
            v15.f64[0] = v35 + v15.f64[0];
            float64x2_t v41 = v15;
            float64x2_t v42 = vaddq_f64(v37, v28);
            CGPathAddLineToPoint(v3, v4, v44.f64[0], v44.f64[1]);
            float64x2_t v15 = v41;
            float64x2_t v28 = v42;
            float64x2_t v27 = v43;
            float64x2_t v7 = v44;
            --v36;
            v29.f64[0] = v38;
          }
          while (v36 > 2);
        }
      }
      CGPathAddLineToPoint(v3, v4, x.f64[0], x.f64[1]);
      _OWORD *v6 = *v8;
      break;
    case 4:
      uint64_t v39 = *(CGPath **)a1;
      CGPathCloseSubpath(v39);
      break;
    default:
      return;
  }
}

uint64_t sub_E6EC()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mPath");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9F368, (uint64_t)&unk_9D8B0, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9F368, &dword_0);
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = class_getInstanceVariable(v3, "mLayoutFrame");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9F390, (uint64_t)&unk_A1668, v5);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9F390, &dword_0);
  id v6 = (objc_class *)objc_opt_class();
  float64x2_t v7 = class_getInstanceVariable(v6, "mPath");
  ptrdiff_t v8 = ivar_getOffset(v7);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9F3B8, (uint64_t)&unk_9F328, v8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9F3B8, &dword_0);
  float64x2_t v9 = (objc_class *)objc_opt_class();
  float64x2_t v10 = class_getInstanceVariable(v9, "mPath");
  ptrdiff_t v11 = ivar_getOffset(v10);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9F3E0, (uint64_t)&unk_A37D0, v11);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9F3E0, &dword_0);
  float64x2_t v12 = (objc_class *)objc_opt_class();
  float64x2_t v13 = class_getInstanceVariable(v12, "mPath");
  ptrdiff_t v14 = ivar_getOffset(v13);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9F408, (uint64_t)&unk_A4038, v14);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9F408, &dword_0);
  float64x2_t v15 = (objc_class *)objc_opt_class();
  float64x2_t v16 = class_getInstanceVariable(v15, "mPath");
  ptrdiff_t v17 = ivar_getOffset(v16);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9F430, (uint64_t)&unk_A3C70, v17);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9F430, &dword_0);
  float64x2_t v18 = (objc_class *)objc_opt_class();
  float64x2_t v19 = class_getInstanceVariable(v18, "mPath");
  ptrdiff_t v20 = ivar_getOffset(v19);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9F458, (uint64_t)&unk_A3F40, v20);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9F458, &dword_0);
  sub_3FBB0((uint64_t)&unk_9F480, (const xmlChar *)"text", v21, v22, v23, v24, v25, v26, (uint64_t)&unk_9F390);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9F480, &dword_0);
  sub_3FFC4((uint64_t)&unk_9F4B0, "drawable-shape", (uint64_t)&unk_9EA20, (uint64_t)sub_E1DC, (uint64_t)sub_ABB0, (uint64_t)&unk_9F480);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_9F4B0, &dword_0);
}

id sub_EB1C(void *a1)
{
  id v2 = [a1 generator];
  if (!v2) {
    return &dword_0 + 1;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(objc_msgSend(a1, "documentState"), "root");
  id v5 = [a1 documentState];
  return [v3 handlePageSetup:v4 state:v5];
}

uint64_t sub_EB98(xmlTextReader *a1, void *a2)
{
  id v4 = objc_alloc_init(GQDSLPageMargins);
  sub_433CC(a1, qword_A35E8, (xmlChar *)off_9CD60);
  float v6 = v5;
  sub_433CC(a1, qword_A35E8, (xmlChar *)off_9CD68);
  float v8 = v7;
  sub_433CC(a1, qword_A35E8, (xmlChar *)off_9CD70);
  float v10 = v9;
  sub_433CC(a1, qword_A35E8, (xmlChar *)off_9CD78);
  float v12 = v11;
  sub_433CC(a1, qword_A35E8, (xmlChar *)"header");
  float v14 = v13;
  sub_433CC(a1, qword_A35E8, (xmlChar *)"footer");
  float v16 = v15;
  *(float *)&double v15 = v6;
  [(GQDSLPageMargins *)v4 setTop:v15];
  *(float *)&double v17 = v10;
  [(GQDSLPageMargins *)v4 setBottom:v17];
  *(float *)&double v18 = v8;
  [(GQDSLPageMargins *)v4 setLeft:v18];
  *(float *)&double v19 = v12;
  [(GQDSLPageMargins *)v4 setRight:v19];
  *(float *)&double v20 = v14;
  [(GQDSLPageMargins *)v4 setHeader:v20];
  *(float *)&double v21 = v16;
  [(GQDSLPageMargins *)v4 setFooter:v21];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_ED0C(void *a1)
{
  id v1 = [a1 documentState];
  if (v1)
  {
    id v2 = v1;
    id v3 = [v1 popRetainedObject];
    objc_msgSend(objc_msgSend(v2, "root"), "setPageMargins:", v3);
  }
  return 1;
}

id sub_ED54(uint64_t a1, void *a2)
{
  id v4 = (double *)objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
  id v5 = [v4 readAttributesFromReader:a1];
  objc_msgSend(a2, "setThumbnailSize:", v4[10], v4[11]);
  return v5;
}

uint64_t sub_EDB8(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  id v5 = [v3 root];
  v5[112] = [v4 BOOLValue];

  return 1;
}

uint64_t sub_EE28(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  id v5 = [v3 root];
  v5[128] = [v4 BOOLValue];

  return 1;
}

uint64_t sub_EE98(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  id v5 = [v3 root];
  v5[129] = [v4 BOOLValue];

  return 1;
}

uint64_t sub_EF08(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  id v5 = [v3 root];
  v5[130] = [v4 BOOLValue];

  return 1;
}

__CFString *sub_F890(__CFString *a1)
{
  id v1 = a1;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v1 = (__CFString *)[(__CFString *)v1 mutableCopy];
      CFStringNormalize(v1, kCFStringNormalizationFormD);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t sub_FA74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9F4F8, 0, a3, a4, a5, a6, a7, a8, v21);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9F4F8, &dword_0);
  sub_3FDC0((uint64_t)&unk_9F528, "pageMargins", (uint64_t)sub_EB98, 0, (uint64_t)sub_ED0C, (uint64_t)&unk_9F4F8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9F528, &dword_0);
  sub_381AC(qword_9F568, (uint64_t)&unk_9F528);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F568, &dword_0);
  sub_3F8F8(qword_9F580, (uint64_t)"page-margins", v8, v9, v10, v11, v12, v13, (uint64_t)qword_9F568);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_9F580, &dword_0);
  sub_3FDC0((uint64_t)&unk_9F5A0, "slprint-info", (uint64_t)sub_ED54, 0, (uint64_t)sub_EB1C, (uint64_t)qword_9F580);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9F5A0, &dword_0);
  sub_381AC(qword_9F5E0, (uint64_t)&unk_9F5A0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F5E0, &dword_0);
  sub_3CF28(qword_9F5F8, (uint64_t)sub_EDB8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_4, qword_9F5F8, &dword_0);
  sub_381D0(qword_9F608, (uint64_t)&unk_A2CC8, (uint64_t)sub_EDB8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F608, &dword_0);
  sub_381D0(qword_9F620, (uint64_t)&unk_A2CC8, (uint64_t)sub_EE28);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F620, &dword_0);
  sub_381D0(qword_9F638, (uint64_t)&unk_A2CC8, (uint64_t)sub_EE98);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F638, &dword_0);
  sub_381D0(qword_9F650, (uint64_t)&unk_A2CC8, (uint64_t)sub_EF08);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F650, &dword_0);
  sub_3F8F8(qword_9F668, (uint64_t)"kSFWPHasBodyProperty", v14, v15, v16, v17, v18, v19, (uint64_t)qword_9F608);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_9F668, &dword_0);
  sub_3FDC0((uint64_t)&unk_9F688, "publication-info", 0, (uint64_t)&qword_A20E8, 0, (uint64_t)qword_9F668);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9F688, &dword_0);
  sub_381AC(qword_9F6C8, (uint64_t)&unk_9F688);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F6C8, &dword_0);
}

_WORD *sub_FE0C(__int16 a1, int a2)
{
  uint64_t result = malloc_type_calloc(1uLL, 0x10uLL, 0x1082040558D527FuLL);
  if (result)
  {
    result[4] = result[4] & 0x4000 | a1 & 0x3FFF | 0x8000;
    *(_DWORD *)uint64_t result = a2;
  }
  return result;
}

float *sub_FE68(__int16 a1, float a2)
{
  uint64_t result = (float *)malloc_type_calloc(1uLL, 0x10uLL, 0x1082040558D527FuLL);
  if (result)
  {
    *((_WORD *)result + 4) = a1 | 0xC000;
    *uint64_t result = a2;
  }
  return result;
}

_WORD *sub_FEC0(__int16 a1, double a2)
{
  double valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  id v4 = sub_FF1C(a1, v3);
  CFRelease(v3);
  return v4;
}

_WORD *sub_FF1C(__int16 a1, void *a2)
{
  id v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x1082040558D527FuLL);
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = v4[4] & 0xC000 | a1 & 0x3FFF;
    v4[4] = v4[4] & 0xC000 | a1 & 0x3FFF;
    if (a2
      && (objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          unsigned int v6 = (unsigned __int16)v5[4],
          (isKindOfClass & 1) != 0))
    {
      v5[4] = v6 | 0x4000;
      *(void *)id v5 = a2;
    }
    else
    {
      *(void *)id v5 = a2;
      if (!(v6 >> 14)) {
        id v8 = a2;
      }
    }
  }
  return v5;
}

void sub_FFC4(id *a1)
{
  if (((_WORD)a1[1] & 0xC000) == 0) {

  }
  free(a1);
}

void sub_1000C(int a1, id *a2)
{
}

_WORD *sub_10014(const __CFArray *a1)
{
  id v2 = malloc_type_malloc(0x10uLL, 0x1020040FFEA222EuLL);
  if (v2)
  {
    unsigned int Count = CFArrayGetCount(a1);
    v2[4] = Count;
    size_t v4 = Count;
    id v5 = malloc_type_malloc(16 * Count, 0x1082040558D527FuLL);
    *(void *)id v2 = v5;
    if (!v5)
    {
      free(v2);
      return 0;
    }
    if (v4)
    {
      CFIndex v6 = 0;
      uint64_t v7 = 8;
      do
      {
        *(_OWORD *)(*(void *)v2 + v7 - 8) = *(_OWORD *)CFArrayGetValueAtIndex(a1, v6);
        if ((*(_WORD *)(*(void *)v2 + v7) & 0xC000) == 0) {
          id v8 = *(id *)(*(void *)v2 + v7 - 8);
        }
        ++v6;
        v7 += 16;
      }
      while (v4 != v6);
      id v5 = *(void **)v2;
    }
    if (heapsort(v5, v4, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_10128))
    {
      sub_10140((uint64_t)v2);
      return 0;
    }
  }
  return v2;
}

uint64_t sub_10128(uint64_t a1, uint64_t a2)
{
  return (*(_WORD *)(a1 + 8) & 0x3FFF) - (*(_WORD *)(a2 + 8) & 0x3FFFu);
}

void sub_10140(uint64_t a1)
{
  if (*(_WORD *)(a1 + 8))
  {
    uint64_t v2 = 0;
    uint64_t v3 = 16 * *(unsigned __int16 *)(a1 + 8);
    do
    {
      if ((*(_WORD *)(*(void *)a1 + v2 + 8) & 0xC000) == 0) {

      }
      v2 += 16;
    }
    while (v3 != v2);
  }
  free(*(void **)a1);
  free((void *)a1);
}

unsigned __int16 *sub_101BC(uint64_t a1)
{
  uint64_t v2 = (unsigned __int16 *)malloc_type_malloc(0x10uLL, 0x1020040FFEA222EuLL);
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = *(unsigned __int16 *)(a1 + 8);
    v2[4] = v4;
    id v5 = malloc_type_malloc(16 * v4, 0x1082040558D527FuLL);
    *(void *)uint64_t v3 = v5;
    if (v5)
    {
      memcpy(v5, *(const void **)a1, 16 * v3[4]);
      unsigned int v6 = v3[4];
      if (v3[4])
      {
        uint64_t v7 = 0;
        unint64_t v8 = 0;
        do
        {
          if ((*(_WORD *)(*(void *)v3 + v7 + 8) & 0xC000) == 0)
          {
            id v9 = *(id *)(*(void *)v3 + v7);
            unsigned int v6 = v3[4];
          }
          ++v8;
          v7 += 16;
        }
        while (v8 < v6);
      }
    }
    else
    {
      free(v3);
      return 0;
    }
  }
  return v3;
}

BOOL sub_10290(uint64_t a1, unsigned __int16 a2, unsigned __int8 *a3, char *a4)
{
  v12[0] = 0;
  v12[1] = a2;
  unsigned int v6 = (id *)bsearch(v12, *(const void **)a1, *(unsigned __int16 *)(a1 + 8), 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_10128);
  uint64_t v7 = v6;
  char v8 = 0;
  if (a3 && v6)
  {
    if ((__int16)v6[1] < 0)
    {
      if (*((unsigned __int16 *)v6 + 4) < 0xC000u) {
        BOOL v10 = *(_DWORD *)v6 == 0;
      }
      else {
        BOOL v10 = *(float *)v6 == 0.0;
      }
      unsigned __int8 v9 = !v10;
    }
    else
    {
      if (!*v6)
      {
        char v8 = 1;
        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v8 = 0;
        goto LABEL_16;
      }
      unsigned __int8 v9 = [*v7 BOOLValue];
    }
    char v8 = 0;
    *a3 = v9;
  }
LABEL_16:
  if (a4) {
    *a4 = v8;
  }
  return v7 != 0;
}

BOOL sub_10384(uint64_t a1, unsigned __int16 a2, float *a3, char *a4)
{
  v11[0] = 0;
  v11[1] = a2;
  unsigned int v6 = (id *)bsearch(v11, *(const void **)a1, *(unsigned __int16 *)(a1 + 8), 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_10128);
  uint64_t v7 = v6;
  char v8 = 0;
  if (a3 && v6)
  {
    if ((__int16)v6[1] < 0)
    {
      if (*((unsigned __int16 *)v6 + 4) < 0xC000u) {
        float v9 = *(float *)v6;
      }
      else {
        LODWORD(v9) = llroundf(*(float *)v6);
      }
    }
    else
    {
      if (!*v6)
      {
        char v8 = 1;
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v8 = 0;
        goto LABEL_13;
      }
      LODWORD(v9) = [*v7 intValue];
    }
    char v8 = 0;
    *a3 = v9;
  }
LABEL_13:
  if (a4) {
    *a4 = v8;
  }
  return v7 != 0;
}

BOOL sub_10470(uint64_t a1, unsigned __int16 a2, float *a3, char *a4)
{
  v12[0] = 0;
  v12[1] = a2;
  unsigned int v6 = (id *)bsearch(v12, *(const void **)a1, *(unsigned __int16 *)(a1 + 8), 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_10128);
  uint64_t v7 = v6;
  char v8 = 0;
  if (a3 && v6)
  {
    int v9 = *((__int16 *)v6 + 4);
    if (v9 < 0)
    {
      if ((v9 & 0xC000) == 0x8000) {
        float v10 = (float)*(int *)v6;
      }
      else {
        float v10 = *(float *)v6;
      }
    }
    else
    {
      if (!*v6)
      {
        char v8 = 1;
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v8 = 0;
        goto LABEL_13;
      }
      [*v7 floatValue];
    }
    char v8 = 0;
    *a3 = v10;
  }
LABEL_13:
  if (a4) {
    *a4 = v8;
  }
  return v7 != 0;
}

__int16 *sub_10560(uint64_t a1, unsigned __int16 a2, uint64_t a3, unsigned char *a4)
{
  CFNumberRef number = 0;
  uint64_t valuePtr = a3;
  char v7 = 0;
  uint64_t result = sub_105E4(a1, a2, &number, &v7);
  if (!result || v7)
  {
LABEL_5:
    if (!a4) {
      return result;
    }
    goto LABEL_6;
  }
  if (a3)
  {
    uint64_t result = (__int16 *)(CFNumberGetValue(number, kCFNumberDoubleType, &valuePtr) != 0);
    goto LABEL_5;
  }
  uint64_t result = (_WORD *)(&dword_0 + 1);
  char v7 = 1;
  if (!a4) {
    return result;
  }
LABEL_6:
  *a4 = v7;
  return result;
}

__int16 *sub_105E4(uint64_t a1, unsigned __int16 a2, void *a3, char *a4)
{
  v8[0] = 0;
  v8[1] = a2;
  uint64_t result = (__int16 *)bsearch(v8, *(const void **)a1, *(unsigned __int16 *)(a1 + 8), 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_10128);
  if (!result)
  {
LABEL_7:
    char v7 = 0;
    if (!a4) {
      return result;
    }
    goto LABEL_8;
  }
  if (result[4] < 0)
  {
    uint64_t result = 0;
    goto LABEL_7;
  }
  if (a3)
  {
    char v7 = 0;
    *a3 = *(void *)result;
    uint64_t result = (_WORD *)(&dword_0 + 1);
    if (!a4) {
      return result;
    }
  }
  else
  {
    uint64_t result = (_WORD *)(&dword_0 + 1);
    char v7 = 1;
    if (!a4) {
      return result;
    }
  }
LABEL_8:
  *a4 = v7;
  return result;
}

id *sub_10684(uint64_t a1, unsigned __int16 a2)
{
  v8[0] = 0;
  v8[1] = a2;
  uint64_t v2 = bsearch(v8, *(const void **)a1, *(unsigned __int16 *)(a1 + 8), 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_10128);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = (id *)malloc_type_malloc(0x10uLL, 0x1082040558D527FuLL);
  id v5 = v4;
  if (v4)
  {
    *(_OWORD *)uint64_t v4 = *v3;
    if (((_WORD)v4[1] & 0xC000) == 0) {
      id v6 = *v4;
    }
  }
  return v5;
}

void sub_11480(uint64_t a1, uint64_t a2)
{
}

id sub_13110(void *a1, void *a2)
{
  id v4 = [a1 style];
  id v5 = objc_msgSend(a2, "styleWithIdentifier:", objc_msgSend(a1, "parentIdentifier"));
  return [v4 setParent:v5];
}

void sub_13270(int a1, const void *a2, CFMutableArrayRef theArray)
{
}

uint64_t sub_1335C()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mParent");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_9F6E0, Offset);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_9F6E0, &dword_0);
}

uint64_t sub_133FC(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDTBooleanCell);
  -[GQDTBooleanCell setProcessorBundle:](v4, "setProcessorBundle:", [a2 bundle]);
  [(GQDTCell *)v4 readAttributesForBaseCell:a1 processor:a2];
  [(GQDTNumberCell *)v4 readAttributesForNumberCell:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_13480(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDTBooleanCell);
  -[GQDTBooleanCell setProcessorBundle:](v4, "setProcessorBundle:", [a2 bundle]);
  [(GQDTCell *)v4 readAttributesForBaseTabularCell:a1 processor:a2];
  [(GQDTNumberCell *)v4 readAttributesForNCell:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_13594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9F6F8, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9F6F8, &dword_0);
  sub_3FFC4((uint64_t)&unk_9F728, "BOOL-cell", (uint64_t)&unk_9F830, (uint64_t)sub_133FC, (uint64_t)sub_1C310, (uint64_t)&unk_9F6F8);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_9F728, &dword_0);
  sub_381AC(qword_9F770, (uint64_t)&unk_9F728);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F770, &dword_0);
  sub_3FFC4((uint64_t)&unk_9F788, "b-cell", (uint64_t)&unk_9F8B8, (uint64_t)sub_13480, (uint64_t)sub_1C310, (uint64_t)&unk_9F6F8);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_9F788, &dword_0);
  sub_381AC(qword_9F7D0, (uint64_t)&unk_9F788);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F7D0, &dword_0);
}

uint64_t sub_1370C(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDTCell);
  [(GQDTCell *)v4 readAttributesForBaseCell:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_1376C(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDTCell);
  [(GQDTCell *)v4 readAttributesForBaseTabularCell:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_137CC(xmlTextReader *a1, void *a2)
{
  uint64_t v8 = 0;
  int v3 = sub_42F44(a1, qword_A35E8, (xmlChar *)"ct", &v8);
  id v4 = objc_msgSend(objc_msgSend(a2, "documentState"), "tableState");
  id v5 = v4;
  if (v3) {
    BOOL v6 = v8 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    [v4 skipCells:v8 - 1];
  }
  [v5 incrementCellPosition];
  return 1;
}

uint64_t sub_13C40()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mStyle");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_9F7E8, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_9F7E8, &dword_0);
  sub_3FBB0((uint64_t)&unk_9F800, (const xmlChar *)"cell-style-ref", v3, v4, v5, v6, v7, v8, (uint64_t)&unk_9F7E8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9F800, &dword_0);
  sub_3FDC0((uint64_t)&unk_9F830, "generic-cell", (uint64_t)sub_1370C, 0, (uint64_t)sub_1C310, (uint64_t)&unk_9F800);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9F830, &dword_0);
  sub_381AC(qword_9F870, (uint64_t)&unk_9F830);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F870, &dword_0);
  sub_3FBB0((uint64_t)&unk_9F888, 0, v9, v10, v11, v12, v13, v14, v16);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9F888, &dword_0);
  sub_3FDC0((uint64_t)&unk_9F8B8, "g", (uint64_t)sub_1376C, 0, (uint64_t)sub_1C310, (uint64_t)&unk_9F888);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9F8B8, &dword_0);
  sub_381AC(qword_9F8F8, (uint64_t)&unk_9F8B8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F8F8, &dword_0);
  sub_3823C(qword_9F910, (uint64_t)sub_137CC, 0);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_9F910, &dword_0);
}

uint64_t sub_13E98(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDTCheckboxCell);
  [(GQDTCell *)v4 readAttributesForBaseCell:a1 processor:a2];
  [(GQDTNumberCell *)v4 readAttributesForNumberCell:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_13F04(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDTCheckboxCell);
  [(GQDTCell *)v4 readAttributesForBaseTabularCell:a1 processor:a2];
  [(GQDTNumberCell *)v4 readAttributesForNCell:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_13F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9F928, 0, a3, a4, a5, a6, a7, a8, v15);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9F928, &dword_0);
  sub_3FFC4((uint64_t)&unk_9F958, "checkbox-cell", (uint64_t)&unk_9F830, (uint64_t)sub_13E98, (uint64_t)sub_1C310, (uint64_t)&unk_9F928);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_9F958, &dword_0);
  sub_381AC(qword_9F9A0, (uint64_t)&unk_9F958);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9F9A0, &dword_0);
  sub_3FBB0((uint64_t)&unk_9F9B8, 0, v8, v9, v10, v11, v12, v13, v16);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9F9B8, &dword_0);
  sub_3FFC4((uint64_t)&unk_9F9E8, "checkbox-cell", (uint64_t)&unk_9F8B8, (uint64_t)sub_13F04, (uint64_t)sub_1C310, (uint64_t)&unk_9F9B8);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_9F9E8, &dword_0);
  sub_381AC(qword_9FA30, (uint64_t)&unk_9F9E8);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9FA30, &dword_0);
}

uint64_t sub_14134(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDTDateCell);
  [(GQDTCell *)v4 readAttributesForBaseCell:a1 processor:a2];
  [(GQDTDateCell *)v4 readAttributesForDateCell:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_141A4(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDTDCell);
  [(GQDTCell *)v4 readAttributesForBaseTabularCell:a1 processor:a2];
  [(GQDTDateCell *)v4 readAttributesForDateCell:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

CFTimeZoneRef sub_143FC()
{
  CFTimeZoneRef result = (CFTimeZoneRef)qword_A40E0;
  if (!qword_A40E0)
  {
    CFTimeZoneRef result = CFTimeZoneCreateWithTimeIntervalFromGMT(kCFAllocatorDefault, 0.0);
    qword_A40E0 = (uint64_t)result;
  }
  return result;
}

uint64_t sub_145D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9FA48, 0, a3, a4, a5, a6, a7, a8, v21);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9FA48, &dword_0);
  sub_3FFC4((uint64_t)&unk_9FA78, "date-cell", (uint64_t)&unk_9F830, (uint64_t)sub_14134, (uint64_t)sub_1C310, (uint64_t)&unk_9FA48);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_9FA78, &dword_0);
  sub_381AC(qword_9FAC0, (uint64_t)&unk_9FA78);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9FAC0, &dword_0);
  uint64_t v8 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v8, "mComputedFormat");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9FAD8, (uint64_t)&unk_A3DA0, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9FAD8, &dword_0);
  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = class_getInstanceVariable(v11, "mComputedFormat");
  ptrdiff_t v13 = ivar_getOffset(v12);
  objc_opt_class();
  objc_opt_class();
  sub_38394((uint64_t)&unk_9FB00, v13, 1);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_9FB00, &dword_0);
  sub_3FBB0((uint64_t)&unk_9FB18, (const xmlChar *)"cf", v14, v15, v16, v17, v18, v19, (uint64_t)&unk_9FAD8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9FB18, &dword_0);
  sub_3FFC4((uint64_t)&unk_9FB48, "d-cell", (uint64_t)&unk_9F830, (uint64_t)sub_141A4, (uint64_t)sub_1C310, (uint64_t)&unk_9FB18);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_9FB48, &dword_0);
  sub_381AC(qword_9FB90, (uint64_t)&unk_9FB48);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9FB90, &dword_0);
}

id sub_14880(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDTexturedImageFill);
  id v5 = (id)[(GQDTexturedImageFill *)v4 readAttributesFromReader:a1 processor:a2];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  }

  return v5;
}

uint64_t sub_14904(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = [v4 peekObject];
  id v6 = [v5 imageBinary];
  uint64_t v7 = (__CFString *)[v6 relativePath];
  uint64_t result = 1;
  if (v6 && v7)
  {
    unsigned int v9 = [v6 resourceType];
    char v16 = 0;
    if (v9)
    {
      if (v9 != 1) {
        return 1;
      }
      char v16 = 1;
      id v10 = objc_msgSend(objc_msgSend(a1, "documentState"), "createUrlToAppBundleResource:processorBundle:skipCachingPDFAndNoExtentionResources:", v7, objc_msgSend(a1, "bundle"), &v16);
      if (v10) {
        CFRelease(v10);
      }
      int v11 = 0;
    }
    else
    {
      uint64_t v12 = objc_opt_new();
      if (CFStringHasPrefix(v7, @"theme-files/")
        && !objc_msgSend(-[__CFString pathExtension](v7, "pathExtension"), "caseInsensitiveCompare:", @"pdf"))
      {
        id v13 = [(__CFString *)v7 pathComponents];
        int v11 = 1;
        uint64_t v7 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", -[NSArray arrayByAddingObjectsFromArray:](+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", @"Shared"), "arrayByAddingObjectsFromArray:", objc_msgSend(v13, "subarrayWithRange:", 1, (char *)objc_msgSend(v13, "count") - 1)));
        char v16 = 1;
      }
      else
      {
        int v11 = 0;
      }
    }
    if (v16)
    {
      if ([v5 color])
      {
        [v5 invalidateFilteredImage];
        if ((v11 & 1) == 0) {
          return 1;
        }
        goto LABEL_23;
      }
      id v14 = objc_msgSend(objc_msgSend(v4, "root"), "colorForMissingAppBundleResource:processorBundle:", v7, objc_msgSend(a1, "bundle"));
      if (v14)
      {
        id v15 = v14;
        [v5 invalidateFilteredImage];
        [v5 setColor:v15];
        if ((v11 & 1) == 0) {
          return 1;
        }
        goto LABEL_23;
      }
    }
    if (v11) {
LABEL_23:
    }
      CFRelease(v7);
    return 1;
  }
  return result;
}

uint64_t sub_14C2C()
{
  qword_A40F0 = (uint64_t)"natural";
  dword_A40F8 = 1;
  qword_A4100 = (uint64_t)"stretch";
  dword_A4108 = 2;
  dword_A40E8 = 0;
  qword_A4110 = (uint64_t)"tile";
  dword_A4118 = 3;
  qword_A4120 = (uint64_t)"fill";
  dword_A4128 = 4;
  qword_A4130 = (uint64_t)"fit";
  xmmword_A4138 = xmmword_9D3E8;
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mColor");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9FBA8, (uint64_t)&unk_9E7A0, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9FBA8, &dword_0);
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = class_getInstanceVariable(v3, "mFilteredImage");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9FBD0, (uint64_t)&unk_A3E90, v5);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9FBD0, &dword_0);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = class_getInstanceVariable(v6, "mFilteredImage");
  ptrdiff_t v8 = ivar_getOffset(v7);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_9FBF8, v8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_9FBF8, &dword_0);
  sub_3FBB0((uint64_t)&unk_9FC10, (const xmlChar *)"color", v9, v10, v11, v12, v13, v14, (uint64_t)&unk_9FBA8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9FC10, &dword_0);
  sub_3FDC0((uint64_t)&unk_9FC40, "image-fill", (uint64_t)sub_14880, 0, (uint64_t)sub_14904, (uint64_t)&unk_9FC10);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9FC40, &dword_0);
}

void sub_154A4(id a1)
{
  id v1 = objc_opt_new();
  objc_msgSend(v1, "formUnionWithCharacterSet:", +[NSCharacterSet URLHostAllowedCharacterSet](NSCharacterSet, "URLHostAllowedCharacterSet"));
  objc_msgSend(v1, "formUnionWithCharacterSet:", +[NSCharacterSet URLPathAllowedCharacterSet](NSCharacterSet, "URLPathAllowedCharacterSet"));
  objc_msgSend(v1, "formUnionWithCharacterSet:", +[NSCharacterSet URLUserAllowedCharacterSet](NSCharacterSet, "URLUserAllowedCharacterSet"));
  objc_msgSend(v1, "formUnionWithCharacterSet:", +[NSCharacterSet URLPasswordAllowedCharacterSet](NSCharacterSet, "URLPasswordAllowedCharacterSet"));
  objc_msgSend(v1, "formUnionWithCharacterSet:", +[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  objc_msgSend(v1, "formUnionWithCharacterSet:", +[NSCharacterSet URLFragmentAllowedCharacterSet](NSCharacterSet, "URLFragmentAllowedCharacterSet"));
  qword_A4148 = (uint64_t)v1;
}

uint64_t sub_162C4(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDTFormulaCell);
  [(GQDTCell *)v4 readAttributesForBaseCell:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_16324(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDTFormulaCell);
  [(GQDTCell *)v4 readAttributesForBaseTabularCell:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_16384(uint64_t a1, void *a2)
{
  id v3 = [a2 documentState];
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
  [v3 pushObject:Mutable];
  CFRelease(Mutable);
  objc_msgSend(objc_msgSend(v3, "tableState"), "setAlwaysPutReadCellsInArray:", 1);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "tableState"), "setIsCountingCount:", 0);
  return 1;
}

uint64_t sub_16414(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  CFArrayRef v4 = (const __CFArray *)[v3 popRetainedObject];
  if (v4)
  {
    CFArrayRef v5 = v4;
    if (CFArrayGetCount(v4) >= 1)
    {
      id v6 = [v3 peekObject];
      ValueAtIndefloat64x2_t x = (void *)CFArrayGetValueAtIndex(v5, 0);
      [v6 setResultCell:ValueAtIndex];
      objc_msgSend(ValueAtIndex, "setCellStyle:", objc_msgSend(v6, "cellStyle"));
    }
    CFRelease(v5);
  }
  objc_msgSend(objc_msgSend(v3, "tableState"), "setAlwaysPutReadCellsInArray:", 0);
  id v8 = [v3 tableState];
  uint64_t v9 = 1;
  [v8 setIsCountingCount:1];
  return v9;
}

uint64_t sub_16588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9FC80, (const xmlChar *)"result-number-cell", a3, a4, a5, a6, a7, a8, (uint64_t)&unk_9FE70);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9FC80, &dword_0);
  sub_3FDC0((uint64_t)&unk_9FCB0, "result-cell", (uint64_t)sub_16384, (uint64_t)&qword_A20E8, (uint64_t)sub_16414, (uint64_t)&unk_9FC80);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9FCB0, &dword_0);
  sub_381AC(qword_9FCF0, (uint64_t)&unk_9FCB0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9FCF0, &dword_0);
  sub_3FBB0((uint64_t)&unk_9FD08, (const xmlChar *)"result-cell", v8, v9, v10, v11, v12, v13, (uint64_t)qword_9FCF0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9FD08, &dword_0);
  sub_3FFC4((uint64_t)&unk_9FD38, "formula-cell", (uint64_t)&unk_9F830, (uint64_t)sub_162C4, (uint64_t)sub_1C310, (uint64_t)&unk_9FD08);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_9FD38, &dword_0);
  sub_381AC(qword_9FD80, (uint64_t)&unk_9FD38);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9FD80, &dword_0);
  sub_3FFC4((uint64_t)&unk_9FD98, "formula-cell", (uint64_t)&unk_9F8B8, (uint64_t)sub_16324, (uint64_t)sub_1C310, (uint64_t)&unk_9FD08);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_9FD98, &dword_0);
  sub_381AC(qword_9FDE0, (uint64_t)&unk_9FD98);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9FDE0, &dword_0);
}

uint64_t sub_168A8(uint64_t a1, void *a2)
{
  CFArrayRef v4 = objc_alloc_init(GQDTNumberCell);
  [(GQDTCell *)v4 readAttributesForBaseCell:a1 processor:a2];
  [(GQDTNumberCell *)v4 readAttributesForNumberCell:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_16914(uint64_t a1, void *a2)
{
  CFArrayRef v4 = objc_alloc_init(GQDTNumberCell);
  [(GQDTCell *)v4 readAttributesForBaseTabularCell:a1 processor:a2];
  [(GQDTNumberCell *)v4 readAttributesForNCell:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_16B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_9FDF8, 0, a3, a4, a5, a6, a7, a8, v21);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9FDF8, &dword_0);
  sub_3FFC4((uint64_t)&unk_9FE28, "number-cell", (uint64_t)&unk_9F830, (uint64_t)sub_168A8, (uint64_t)sub_1C310, (uint64_t)&unk_9FDF8);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_9FE28, &dword_0);
  sub_381AC(qword_9FE70, (uint64_t)&unk_9FE28);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9FE70, &dword_0);
  uint64_t v8 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v8, "mComputedFormat");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9FE88, (uint64_t)&unk_A3DA0, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9FE88, &dword_0);
  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = class_getInstanceVariable(v11, "mComputedFormat");
  ptrdiff_t v13 = ivar_getOffset(v12);
  objc_opt_class();
  objc_opt_class();
  sub_38394((uint64_t)&unk_9FEB0, v13, 1);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_9FEB0, &dword_0);
  sub_3FBB0((uint64_t)&unk_9FEC8, (const xmlChar *)"cf", v14, v15, v16, v17, v18, v19, (uint64_t)&unk_9FE88);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9FEC8, &dword_0);
  sub_3FFC4((uint64_t)&unk_9FEF8, "n-cell", (uint64_t)&unk_9F830, (uint64_t)sub_16914, (uint64_t)sub_1C310, (uint64_t)&unk_9FEC8);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_9FEF8, &dword_0);
  sub_381AC(qword_9FF40, (uint64_t)&unk_9FEF8);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9FF40, &dword_0);
}

uint64_t sub_16E68(xmlTextReader *a1, void *a2)
{
  CFArrayRef v4 = objc_alloc_init(GQDTNumberFormat);
  uint64_t v5 = [(GQDTNumberFormat *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
    AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3D8, *(const xmlChar **)(qword_A35E0 + 16));
    if (AttributeNs)
    {
      uint64_t v7 = AttributeNs;
      v4->mUid = (char *)xmlStrdup(AttributeNs);
      if (objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addObject:withOwnedXmlUid:", v4, v7))uint64_t v5 = 1; {
      else
      }
        uint64_t v5 = 3;
    }
    else
    {
      uint64_t v5 = 1;
    }
  }

  return v5;
}

uint64_t sub_16F30(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  CFArrayRef v4 = (const __CFArray *)[v3 popRetainedObject];
  id v5 = objc_alloc_init((Class)NSMutableIndexSet);
  CFIndex Count = CFArrayGetCount(v4);
  if (Count >= 1)
  {
    CFIndex v7 = Count;
    for (CFIndex i = 0; i != v7; ++i)
      objc_msgSend(v5, "addIndex:", objc_msgSend((id)CFArrayGetValueAtIndex(v4, i), "unsignedIntValue"));
  }
  *((void *)[v3 peekObject] + 12) = v5;
  CFRelease(v4);
  return 1;
}

uint64_t sub_16FF0(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = (unsigned __int8 *)[v4 popRetainedObject];
  id v6 = [GQDTNumberFormat alloc];
  BYTE6(v12) = v5[85];
  WORD2(v12) = *((_WORD *)v5 + 37);
  WORD1(v12) = *((_WORD *)v5 + 52);
  LOWORD(v12) = *((_WORD *)v5 + 38);
  BYTE5(v11) = v5[72];
  BYTE4(v11) = v5[82];
  WORD1(v11) = *((_WORD *)v5 + 40);
  LOWORD(v11) = v5[78];
  HIDWORD(v10) = *((_DWORD *)v5 + 13);
  LOBYTE(v10) = v5[41];
  CFIndex v7 = -[GQDTNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:](v6, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:suffixString:scaleFactor:base:basePlaces:baseUseMinusSign:isCustom:interstitialStrings:interstitialStringInsertionIndexes:indexFromRightOfLastDigitPlaceholder:minimumIntegerWidth:decimalWidth:numberOfNonSpaceIntegerPlaceholderDigits:numberOfNonSpaceDecimalPlaceholderDigits:isTextFormat:formatName:", *((unsigned int *)v5 + 11), *((void *)v5 + 2), *((unsigned __int16 *)v5 + 16), *((void *)v5 + 3), v5[40], *((unsigned int *)v5 + 12), *((double *)v5 + 8), v10, *((void *)v5 + 14), v11, *((void *)v5 + 11), *((void *)v5 + 12), v12, 0);
  [v4 pushObject:v7];
  if (*((void *)v5 + 1))
  {
    id v8 = objc_msgSend(objc_msgSend(a1, "documentState"), "root");
    [v8 forgetAboutObject:v5 withXmlUid:*((void *)v5 + 1)];
    [v8 addObject:v7 withOwnedXmlUid:xmlStrdup(*((const xmlChar **)v5 + 1))];
  }

  return 1;
}

uint64_t sub_19AAC()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mInterstitialStrings");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_9FF58, (uint64_t)&unk_A2C28, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_9FF58, &dword_0);
  sub_381D0(qword_9FF80, (uint64_t)&unk_A2C28, (uint64_t)sub_16F30);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_9FF80, &dword_0);
  sub_3FBB0((uint64_t)&unk_9FF98, (const xmlChar *)"interstitial-strings", v3, v4, v5, v6, v7, v8, (uint64_t)&unk_9FF58);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_9FF98, &dword_0);
  sub_3FDC0((uint64_t)&unk_9FFC8, "number-format", (uint64_t)sub_16E68, 0, (uint64_t)sub_16FF0, (uint64_t)&unk_9FF98);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_9FFC8, &dword_0);
}

uint64_t sub_19C48(xmlTextReader *a1, void *a2, int a3)
{
  id v6 = objc_msgSend(objc_msgSend(a2, "documentState"), "tableState");
  if (a3) {
    uint64_t v7 = "ho";
  }
  else {
    uint64_t v7 = "horizontal-offset";
  }
  uint64_t v8 = sub_42F04(a1, qword_A35E8, (xmlChar *)v7, 0);
  if (v8 < 1)
  {
    if ((v8 & 0x8000000000000000) == 0) {
      return 1;
    }
    if ([v6 isStreaming])
    {
      ValueAtIndefloat64x2_t x = [v6 lastCellRead];
      if (!ValueAtIndex) {
        return 1;
      }
      goto LABEL_6;
    }
    CFArrayRef v13 = (const __CFArray *)objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
    CFIndex Count = CFArrayGetCount(v13);
    if (Count >= 1)
    {
      ValueAtIndefloat64x2_t x = (id)CFArrayGetValueAtIndex(v13, Count - 1);
      if (ValueAtIndex)
      {
LABEL_6:
        [ValueAtIndex incrementColumnSpan];
        [v6 incrementCellPosition];
      }
    }
  }
  else
  {
    ValueAtIndefloat64x2_t x = [v6 currentOverlapCell];
    if (ValueAtIndex) {
      goto LABEL_6;
    }
    uint64_t v10 = objc_alloc_init(GQDTOverlapCell);
    uint64_t v11 = v10;
    if (a3) {
      [(GQDTCell *)v10 readAttributesForBaseTabularCell:a1 processor:a2];
    }
    else {
      [(GQDTCell *)v10 readAttributesForBaseCell:a1 processor:a2];
    }
    [v6 setCurrentOverlapCell:v11];
  }
  return 1;
}

uint64_t sub_19D6C(xmlTextReader *a1, void *a2)
{
  return 1;
}

uint64_t sub_19D8C(xmlTextReader *a1, void *a2)
{
  return 1;
}

uint64_t sub_19DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A0008, 0, a3, a4, a5, a6, a7, a8, v15);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0008, &dword_0);
  sub_3FDC0((uint64_t)&unk_A0038, "overlap-cell", (uint64_t)sub_19D6C, 0, 0, (uint64_t)&unk_A0008);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0038, &dword_0);
  sub_381AC(qword_A0078, (uint64_t)&unk_A0038);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0078, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0090, 0, v8, v9, v10, v11, v12, v13, v16);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0090, &dword_0);
  sub_3FDC0((uint64_t)&unk_A00C0, "o", (uint64_t)sub_19D8C, 0, 0, (uint64_t)&unk_A0090);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A00C0, &dword_0);
  sub_381AC(qword_A0100, (uint64_t)&unk_A00C0);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0100, &dword_0);
}

uint64_t sub_19F34(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDTPopupCell);
  [(GQDTCell *)v4 readAttributesForBaseCell:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_19F94(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDTPopupCell);
  [(GQDTCell *)v4 readAttributesForBaseTabularCell:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_19FF4(uint64_t a1, void *a2)
{
  id v3 = [a2 documentState];
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  [v3 pushObject:Mutable];
  CFRelease(Mutable);
  objc_msgSend(objc_msgSend(v3, "tableState"), "setAlwaysPutReadCellsInArray:", 1);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "tableState"), "setIsCountingCount:", 0);
  return 1;
}

uint64_t sub_1A084(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  if (v4) {
    CFRelease(v4);
  }
  objc_msgSend(objc_msgSend(v3, "tableState"), "setAlwaysPutReadCellsInArray:", 0);
  id v5 = [v3 tableState];
  uint64_t v6 = 1;
  [v5 setIsCountingCount:1];
  return v6;
}

uint64_t sub_1A15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A0118, (const xmlChar *)"text-cell", a3, a4, a5, a6, a7, a8, (uint64_t)&unk_A0C38);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0118, &dword_0);
  sub_3FDC0((uint64_t)&unk_A0148, "menu-choices", (uint64_t)sub_19FF4, (uint64_t)&qword_A20E8, (uint64_t)sub_1A084, (uint64_t)&unk_A0118);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0148, &dword_0);
  sub_381AC(qword_A0188, (uint64_t)&unk_A0148);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0188, &dword_0);
  uint64_t v8 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v8, "mResultCell");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_A01A0, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A01A0, &dword_0);
  sub_3FBB0((uint64_t)&unk_A01B8, (const xmlChar *)"menu-choices", v11, v12, v13, v14, v15, v16, (uint64_t)qword_A0188);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A01B8, &dword_0);
  sub_3FFC4((uint64_t)&unk_A01E8, "popupmenu-cell", (uint64_t)&unk_9F830, (uint64_t)sub_19F34, (uint64_t)sub_1C310, (uint64_t)&unk_A01B8);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A01E8, &dword_0);
  sub_381AC(qword_A0230, (uint64_t)&unk_A01E8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0230, &dword_0);
  sub_3FFC4((uint64_t)&unk_A0248, "pm-cell", (uint64_t)&unk_9F8B8, (uint64_t)sub_19F94, (uint64_t)sub_1C310, (uint64_t)&unk_A01B8);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A0248, &dword_0);
  sub_381AC(qword_A0290, (uint64_t)&unk_A0248);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0290, &dword_0);
}

uint64_t sub_1A488(xmlTextReader *a1, void *a2, unsigned int a3)
{
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 3;
  }
  uint64_t v6 = AttributeNs;
  uint64_t v7 = (char *)objc_msgSend(objc_msgSend(a2, "documentState"), "tableState");
  [v7 alongValueForVectorUid:v6];
  int v9 = v8;
  xmlFree(v6);
  if (a3 <= 3) {
    *(_DWORD *)&v7[**((int **)&off_80558 + (int)a3)] = v9;
  }
  return 1;
}

uint64_t sub_1A53C(xmlTextReader *a1, void *a2)
{
  return sub_1A488(a1, a2, 0);
}

uint64_t sub_1A544(xmlTextReader *a1, void *a2)
{
  return sub_1A488(a1, a2, 1u);
}

uint64_t sub_1A54C(xmlTextReader *a1, void *a2)
{
  return sub_1A488(a1, a2, 2u);
}

uint64_t sub_1A554(xmlTextReader *a1, void *a2)
{
  return sub_1A488(a1, a2, 3u);
}

uint64_t sub_1A55C(xmlTextReader *a1, void *a2)
{
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 3;
  }
  id v4 = AttributeNs;
  id v5 = [a2 documentState];
  id v6 = [v5 tableState];
  *((void *)v6 + 14) = objc_msgSend(objc_msgSend(v5, "root"), "objectWithXmlUid:", v4);
  id v7 = *((id *)v6 + 14);
  xmlFree(v4);
  return 1;
}

uint64_t sub_1A60C(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  *((void *)[v3 tableState] + 13) = v4;
  return 1;
}

uint64_t sub_1A670(void *a1, float a2)
{
  unint64_t v2 = (uint64_t)(a1[1] - *a1) >> 2;
  if ((int)v2 < 1)
  {
    return 0;
  }
  else
  {
    unsigned __int16 v3 = 0;
    while (1)
    {
      if (v2 <= v3) {
        sub_1A914();
      }
      if (vabds_f32(*(float *)(*a1 + 4 * v3), a2) < 1.0) {
        break;
      }
      if ((int)v2 <= ++v3) {
        return 0;
      }
    }
  }
  return v3;
}

uint64_t sub_1A6D4(void *a1)
{
  id v1 = [a1 documentState];
  id v2 = [v1 tableState];
  uint64_t v3 = sub_1A670(*((void **)v2 + 9), *((float *)v2 + 24));
  unsigned __int16 v4 = sub_1A670(*((void **)v2 + 9), *((float *)v2 + 25)) - v3;
  uint64_t v5 = sub_1A670(*((void **)v2 + 10), *((float *)v2 + 22));
  id v6 = [[GQDTSpiceCell alloc] initWithStyle:*((void *)v2 + 14) rowIndex:v3 columnIndex:v5 rowSpan:v4 columnSpan:(unsigned __int16)(sub_1A670(*((void **)v2 + 10), *((float *)v2 + 23)) - v5) storage:*((void *)v2 + 13)];

  *((void *)v2 + 13) = 0;
  *((void *)v2 + 14) = 0;
  CFArrayAppendValue((CFMutableArrayRef)[v1 peekObject], v6);

  return 1;
}

void sub_1A914()
{
}

void sub_1A92C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1A988(exception, a1);
}

void sub_1A974(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1A988(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_1A9BC()
{
  sub_3823C(qword_A02A8, (uint64_t)sub_1A53C, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A02A8, &dword_0);
  sub_3823C(qword_A02C0, (uint64_t)sub_1A544, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A02C0, &dword_0);
  sub_3823C(qword_A02D8, (uint64_t)sub_1A54C, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A02D8, &dword_0);
  sub_3823C(qword_A02F0, (uint64_t)sub_1A554, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A02F0, &dword_0);
  sub_3823C(qword_A0308, (uint64_t)sub_1A55C, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A0308, &dword_0);
  sub_381D0(qword_A0320, (uint64_t)&unk_A1760, (uint64_t)sub_1A60C);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0320, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0338, (const xmlChar *)"tableCellMinXSide-ref", v0, v1, v2, v3, v4, v5, (uint64_t)qword_A02A8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0338, &dword_0);
  sub_3FDC0((uint64_t)&unk_A0368, "spice-table-cell", 0, 0, (uint64_t)sub_1A6D4, (uint64_t)&unk_A0338);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0368, &dword_0);
  sub_381AC(qword_A03A8, (uint64_t)&unk_A0368);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A03A8, &dword_0);
}

uint64_t sub_1AC70(uint64_t a1, void *a2)
{
  id v3 = [a2 documentState];
  uint64_t v4 = objc_alloc_init(GQDTSpiceTableModel);
  [(GQDTSpiceTableModel *)v4 readAttributesFromReader:a1];
  [v3 pushObject:v4];
  objc_msgSend(objc_msgSend(v3, "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);

  uint64_t v5 = objc_alloc_init(GQSSpiceTable);
  [v3 setTableState:v5];

  return 1;
}

uint64_t sub_1AD04(uint64_t a1, void *a2)
{
  id v2 = [a2 documentState];
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  [v2 pushObject:Mutable];
  CFRelease(Mutable);
  objc_msgSend(objc_msgSend(v2, "tableState"), "aboutToReadCells");
  return 1;
}

uint64_t sub_1AD68(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  objc_msgSend(objc_msgSend(v3, "peekObject"), "setCells:", objc_msgSend(v3, "popRetainedObject"));
  return 1;
}

uint64_t sub_1ADC4(xmlTextReader *a1, void *a2)
{
  id v3 = objc_msgSend(objc_msgSend(a2, "documentState"), "tableState");
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3D8, *(const xmlChar **)(qword_A35E0 + 16));
  int v7 = 0;
  sub_43348(a1, qword_A35E8, (xmlChar *)"tableVectorAlong", (float *)&v7);
  LODWORD(v5) = v7;
  [v3 setAlongValue:AttributeNs forOwnedVectorUid:v5];
  return 1;
}

uint64_t sub_1AE64(uint64_t a1, void *a2)
{
  return 1;
}

id sub_1AE8C(void *a1)
{
  id v1 = [a1 documentState];
  id v2 = [v1 tableState];
  id v3 = [v1 peekObject];
  return [v3 setRowHeightsFromState:v2];
}

uint64_t sub_1AED4(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t sub_1AEFC(xmlTextReader *a1, void *a2)
{
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 3;
  }
  uint64_t v4 = AttributeNs;
  id v5 = [a2 documentState];
  objc_msgSend(objc_msgSend(v5, "topObjectOfClass:", objc_opt_class()), "setTableStyle:", objc_msgSend(objc_msgSend(v5, "root"), "objectWithXmlUid:", v4));
  xmlFree(v4);
  return 1;
}

id sub_1AFA8(void *a1)
{
  id v1 = [a1 documentState];
  id v2 = [v1 tableState];
  id v3 = [v1 peekObject];
  return [v3 setColumnWidthsFromState:v2];
}

uint64_t sub_1B248()
{
  sub_3823C(qword_A03C0, (uint64_t)sub_1AEFC, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A03C0, &dword_0);
  sub_3823C(qword_A03D8, (uint64_t)sub_1ADC4, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A03D8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A03F0, (const xmlChar *)"table-cell", v0, v1, v2, v3, v4, v5, (uint64_t)qword_A03A8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A03F0, &dword_0);
  sub_3FDC0((uint64_t)&unk_A0420, "spice-table-cells", (uint64_t)sub_1AD04, 0, (uint64_t)sub_1AD68, (uint64_t)&unk_A03F0);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0420, &dword_0);
  sub_381AC(qword_A0460, (uint64_t)&unk_A0420);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0460, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0478, (const xmlChar *)"table-vector", v6, v7, v8, v9, v10, v11, (uint64_t)qword_A03D8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0478, &dword_0);
  sub_3FDC0((uint64_t)&unk_A04A8, "spice-table-row-vectors", (uint64_t)sub_1AE64, 0, (uint64_t)sub_1AE8C, (uint64_t)&unk_A0478);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A04A8, &dword_0);
  sub_381AC(qword_A04E8, (uint64_t)&unk_A04A8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A04E8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A0500, "spice-table-column-vectors", (uint64_t)sub_1AED4, 0, (uint64_t)sub_1AFA8, (uint64_t)&unk_A0478);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0500, &dword_0);
  sub_381AC(qword_A0540, (uint64_t)&unk_A0500);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0540, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0558, (const xmlChar *)"tableModelPartitionSouce", v12, v13, v14, v15, v16, v17, (uint64_t)&qword_A20E8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0558, &dword_0);
  sub_3FDC0((uint64_t)&unk_A0588, "spice-table-model", (uint64_t)sub_1AC70, 0, 0, (uint64_t)&unk_A0558);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0588, &dword_0);
  sub_381AC(qword_A05C8, (uint64_t)&unk_A0588);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A05C8, &dword_0);
}

uint64_t sub_1B5F4(xmlTextReader *a1, void *a2)
{
  id v4 = [a2 documentState];
  uint64_t v5 = objc_alloc_init(GQDTTable);
  [v4 pushObject:v5];

  if (([v4 isReadingStorageAttachments] & 1) == 0)
  {
    id v6 = [v4 currentDrawablesGenerator];
    if (v6) {
      objc_msgSend(v4, "setCurrentTableGenerator:", objc_msgSend(v6, "beginTable:", v4));
    }
  }
  return sub_92A4(a1, a2);
}

id sub_1B690(void *a1)
{
  id v2 = [a1 documentState];
  id v3 = [v2 currentTableGenerator];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v2 peekObject];
    if (![v2 shouldStreamTables]
      || ([v5 isStreamed] & 1) == 0)
    {
      [v5 walkTableWithGenerator:v4 state:v2];
    }
  }
  return sub_ABB0(a1);
}

void sub_1B724(xmlTextReader *a1, void *a2)
{
  id v4 = [a2 documentState];
  if ([v4 shouldStreamTables])
  {
    *((unsigned char *)[v4 topObjectOfClass:objc_opt_class()] + 96) = 1;
    sub_3AC58(a1, (uint64_t)&unk_A0A48, (uint64_t)&unk_A05E0, a2);
  }
  sub_381F4((uint64_t)&unk_A05F8, a1, a2);
}

uint64_t sub_1BA78()
{
  sub_3823C(qword_A05E0, (uint64_t)sub_1B724, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A05E0, &dword_0);
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mModel");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A05F8, (uint64_t)&unk_A0A48, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A05F8, &dword_0);
  id v3 = (objc_class *)objc_opt_class();
  id v4 = class_getInstanceVariable(v3, "mStyle");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_A0620, v5);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A0620, &dword_0);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = class_getInstanceVariable(v6, "mModel");
  ptrdiff_t v8 = ivar_getOffset(v7);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_A0638, v8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A0638, &dword_0);
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = class_getInstanceVariable(v9, "mModel");
  ptrdiff_t v11 = ivar_getOffset(v10);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A0650, (uint64_t)&unk_A0588, v11);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A0650, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0678, (const xmlChar *)"tabular-style-ref", v12, v13, v14, v15, v16, v17, (uint64_t)&unk_A0620);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0678, &dword_0);
  sub_3FDC0((uint64_t)&unk_A06A8, "ct", 0, 0, 0, (uint64_t)&unk_A0678);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A06A8, &dword_0);
  sub_381AC(qword_A06E8, (uint64_t)&unk_A06A8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A06E8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0700, (const xmlChar *)"tabular-model", v18, v19, v20, v21, v22, v23, (uint64_t)qword_A05E0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0700, &dword_0);
  sub_3FFC4((uint64_t)&unk_A0730, "tabular-info", (uint64_t)&unk_9EA20, (uint64_t)sub_1B5F4, (uint64_t)sub_1B690, (uint64_t)&unk_A0700);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_A0730, &dword_0);
}

uint64_t sub_1BE38(uint64_t a1, void *a2)
{
  id v3 = [a2 documentState];
  id v4 = objc_alloc_init(GQDTTableModel);
  [(GQDTTableModel *)v4 readAttributesForModel:a1];
  [v3 pushObject:v4];
  objc_msgSend(objc_msgSend(v3, "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);

  id v5 = [v3 topObjectOfClass:objc_opt_class()];
  id v6 = v5;
  if (v5) {
    id v7 = [v5 isStreamed];
  }
  else {
    id v7 = 0;
  }
  ptrdiff_t v8 = [[GQSTable alloc] initWithStreaming:v7 table:v6];
  [v3 setTableState:v8];

  return 1;
}

id sub_1BF0C(void *a1)
{
  id v1 = [a1 documentState];
  id v2 = [v1 tableState];
  if ([v2 isStreaming])
  {
    id v3 = [v1 currentTableGenerator];
    id v4 = [v2 table];
    id v5 = &dword_0 + 1;
    if (v4 && v3)
    {
      id v5 = [v3 endTable:v4 state:v1];
      [v1 setCurrentTableGenerator:0];
    }
  }
  else
  {
    id v5 = &dword_0 + 1;
  }
  [v1 setTableState:0];
  return v5;
}

id sub_1BFAC(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
  return [v3 readAttributesForGrid:a1];
}

id sub_1BFEC(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject"), "addColumnWidthFrom:", a1);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return v3;
}

id sub_1C074(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
  return [v3 addRowHeightFrom:a1];
}

uint64_t sub_1C0B4(void *a1)
{
  id v1 = [a1 documentState];
  CFDictionaryRef v2 = (const __CFDictionary *)[v1 popRetainedObject];
  id v3 = (CFMutableArrayRef *)[v1 peekObject];
  CFIndex Count = CFDictionaryGetCount(v2);
  id v5 = (NSNull *)v2;
  if (!Count) {
    id v5 = +[NSNull null];
  }
  CFArrayAppendValue(v3[10], v5);
  CFRelease(v2);
  return 1;
}

id sub_1C120(uint64_t a1, void *a2)
{
  id v2 = [a2 documentState];
  id v3 = [v2 tableState];
  if (v3 && ([v3 isStreaming] & 1) != 0)
  {
    char v4 = 0;
  }
  else
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    [v2 pushObject:Mutable];
    CFRelease(Mutable);
    char v4 = 1;
  }
  id v6 = [v2 topObjectOfClass:objc_opt_class()];
  id result = &dword_0 + 1;
  if ((v4 & 1) == 0 && v6)
  {
    objc_msgSend(v6, "setModel:", objc_msgSend(v2, "topObjectOfClass:", objc_opt_class()));
    id v8 = [v2 currentTableGenerator];
    if (v8)
    {
      uint64_t v9 = v8;
      id result = [v8 beginTable:v6 state:v2];
      if (result == 1)
      {
        return [v9 beginCells:v6 state:v2];
      }
    }
    else
    {
      return &dword_0 + 1;
    }
  }
  return result;
}

uint64_t sub_1C238(void *a1, int a2)
{
  id v3 = [a1 documentState];
  id v4 = [v3 tableState];
  if (([v4 isStreaming] & 1) == 0 && (int)objc_msgSend(v3, "objectStackDepth") <= a2) {
    return 3;
  }
  if (![v4 isStreaming])
  {
    objc_msgSend(objc_msgSend(v3, "peekObject"), "setCells:", objc_msgSend(v3, "popRetainedObject"));
    return 1;
  }
  id v5 = [v4 table];
  id v6 = [v3 currentTableGenerator];
  uint64_t result = 1;
  if (v5 && v6)
  {
    id v8 = [v4 lastCellRead];
    if (v8) {
      [v6 handleCell:v8 state:v3];
    }
    [v6 endCells:v5 state:v3];
    return 1;
  }
  return result;
}

uint64_t sub_1C310(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = [v4 popRetainedObject];
  id v6 = [v4 tableState];
  if (v6
    && (id v7 = v6, [v6 isStreaming])
    && ([v7 alwaysPutReadCellsInArray] & 1) == 0)
  {
    id v9 = [v7 lastCellRead];
    if (v9)
    {
      id v10 = v9;
      id v11 = [v4 currentTableGenerator];
      if (v11) {
        [v11 handleCell:v10 state:v4];
      }
    }
    [v7 setLastCellRead:v5];
  }
  else
  {
    CFArrayAppendValue((CFMutableArrayRef)objc_msgSend(objc_msgSend(a1, "documentState"), "peekObject"), v5);
  }
  return 1;
}

uint64_t sub_1C3DC(xmlTextReader *a1, void *a2)
{
  id v3 = (__CFDictionary *)objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
  int v4 = sub_43034(a1, qword_A35E8, (xmlChar *)"grouping-display-type", 0);
  int valuePtr = sub_43034(a1, qword_A35E8, (xmlChar *)"grouping-display-level", 0);
  LOBYTE(a1) = sub_42DCC(a1, qword_A35E8, (xmlChar *)"grouping-display-verbose", 1u);
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  id v6 = objc_alloc_init(GQGroupDisplayInfo);
  v6->mDisplayType = v4;
  v6->mIsTypeVisible = (char)a1;
  CFDictionarySetValue(v3, v5, v6);
  CFRelease(v5);

  return 1;
}

id sub_1C4D4(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
  return [v3 addGroupLevelsFrom:a1];
}

uint64_t sub_1CDD4()
{
  sub_3823C(qword_A0778, (uint64_t)sub_1C3DC, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A0778, &dword_0);
  sub_3F8F8(qword_A0790, (uint64_t)"grouping-display", v0, v1, v2, v3, v4, v5, (uint64_t)qword_A0778);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A0790, &dword_0);
  sub_3FDC0((uint64_t)&unk_A07B0, "grid-column", (uint64_t)sub_1BFEC, 0, (uint64_t)sub_1C0B4, (uint64_t)qword_A0790);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A07B0, &dword_0);
  sub_381AC(qword_A07F0, (uint64_t)&unk_A07B0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A07F0, &dword_0);
  sub_3F8F8(qword_A0808, (uint64_t)"grid-column", v6, v7, v8, v9, v10, v11, (uint64_t)qword_A07F0);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A0808, &dword_0);
  sub_3FDC0((uint64_t)&unk_A0828, "columns", 0, 0, 0, (uint64_t)qword_A0808);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0828, &dword_0);
  sub_381AC(qword_A0868, (uint64_t)&unk_A0828);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0868, &dword_0);
  sub_3823C(qword_A0880, (uint64_t)sub_1C074, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A0880, &dword_0);
  sub_3F8F8(qword_A0898, (uint64_t)"grid-row", v12, v13, v14, v15, v16, v17, (uint64_t)qword_A0880);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A0898, &dword_0);
  sub_3FDC0((uint64_t)&unk_A08B8, "rows", 0, 0, 0, (uint64_t)qword_A0898);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A08B8, &dword_0);
  sub_381AC(qword_A08F8, (uint64_t)&unk_A08B8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A08F8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0910, (const xmlChar *)"text-cell", v18, v19, v20, v21, v22, v23, (uint64_t)&unk_A0C38);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0910, &dword_0);
  sub_3FDC0((uint64_t)&unk_A0940, "datasource", (uint64_t)sub_1C120, (uint64_t)&qword_A20E8, (uint64_t)sub_1C238, (uint64_t)&unk_A0910);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0940, &dword_0);
  sub_381AC(qword_A0980, (uint64_t)&unk_A0940);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0980, &dword_0);
  sub_3F8F8(qword_A0998, (uint64_t)"columns", v24, v25, v26, v27, v28, v29, (uint64_t)qword_A0868);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A0998, &dword_0);
  sub_3FDC0((uint64_t)&unk_A09B8, "grid", (uint64_t)sub_1BFAC, 0, 0, (uint64_t)qword_A0998);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A09B8, &dword_0);
  sub_381AC(qword_A09F8, (uint64_t)&unk_A09B8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A09F8, &dword_0);
  sub_3823C(qword_A0A10, (uint64_t)sub_1C4D4, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A0A10, &dword_0);
  sub_3F8F8(qword_A0A28, (uint64_t)"grid", v30, v31, v32, v33, v34, v35, (uint64_t)qword_A09F8);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A0A28, &dword_0);
  sub_3FDC0((uint64_t)&unk_A0A48, "tabular-model", (uint64_t)sub_1BE38, (uint64_t)&qword_A20E8, (uint64_t)sub_1BF0C, (uint64_t)qword_A0A28);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0A48, &dword_0);
}

uint64_t sub_1D470(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDTTextCell);
  [(GQDTCell *)v4 readAttributesForBaseCell:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_1D4D0(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDTTextCell);
  [(GQDTCell *)v4 readAttributesForBaseTabularCell:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_1D530(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t sub_1D568(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t sub_1D5A0(xmlTextReader *a1, void *a2)
{
  id v3 = [a2 documentState];
  uint64_t v4 = (const char *)xmlTextReaderConstValue(a1);
  id v5 = [v3 peekObject];
  CFStringRef v6 = CFStringCreateWithCString(0, v4, 0x8000100u);
  CFStringRef v7 = v6;
  uint64_t v8 = (__CFString *)*((void *)v5 + 3);
  if (!v8) {
    uint64_t v8 = &stru_85630;
  }
  CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"%@%@", v8, v6);
  CFRelease(v7);
  uint64_t v10 = (const void *)*((void *)v5 + 3);
  if (v10) {
    CFRelease(v10);
  }
  *((void *)v5 + 3) = v9;
  return 1;
}

uint64_t sub_1D790()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mLayoutStorage");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A0A88, (uint64_t)&unk_A1760, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A0A88, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0AB0, 0, v3, v4, v5, v6, v7, v8, v34);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0AB0, &dword_0);
  sub_3FE3C((uint64_t)&unk_A0AE0, "cell-text-string", 0, 0, (uint64_t)sub_1D5A0, 0, (uint64_t)&unk_A0AB0);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0AE0, &dword_0);
  sub_381AC(qword_A0B20, (uint64_t)&unk_A0AE0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0B20, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0B38, (const xmlChar *)"cell-storage", v9, v10, v11, v12, v13, v14, (uint64_t)&unk_A0A88);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0B38, &dword_0);
  sub_3FDC0((uint64_t)&unk_A0B68, "cell-text", (uint64_t)sub_1D530, 0, 0, (uint64_t)&unk_A0B38);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0B68, &dword_0);
  sub_381AC(qword_A0BA8, (uint64_t)&unk_A0B68);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0BA8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0BC0, (const xmlChar *)"cell-text", v15, v16, v17, v18, v19, v20, (uint64_t)qword_A0BA8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0BC0, &dword_0);
  sub_3FFC4((uint64_t)&unk_A0BF0, "text-cell", (uint64_t)&unk_9F830, (uint64_t)sub_1D470, (uint64_t)sub_1C310, (uint64_t)&unk_A0BC0);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A0BF0, &dword_0);
  sub_381AC(qword_A0C38, (uint64_t)&unk_A0BF0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0C38, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0C50, (const xmlChar *)"so", v21, v22, v23, v24, v25, v26, (uint64_t)&unk_A0A88);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0C50, &dword_0);
  sub_3FDC0((uint64_t)&unk_A0C80, "ct", (uint64_t)sub_1D568, 0, 0, (uint64_t)&unk_A0C50);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0C80, &dword_0);
  sub_381AC(qword_A0CC0, (uint64_t)&unk_A0C80);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0CC0, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0CD8, (const xmlChar *)"ct", v27, v28, v29, v30, v31, v32, (uint64_t)qword_A0CC0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0CD8, &dword_0);
  sub_3FFC4((uint64_t)&unk_A0D08, "t-cell", (uint64_t)&unk_9F830, (uint64_t)sub_1D4D0, (uint64_t)sub_1C310, (uint64_t)&unk_A0CD8);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A0D08, &dword_0);
  sub_381AC(qword_A0D50, (uint64_t)&unk_A0D08);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0D50, &dword_0);
}

uint64_t sub_1DBB0(xmlTextReader *a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDWebView);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return sub_92A4(a1, a2);
}

uint64_t sub_1DC88()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mImageBinary");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_38394((uint64_t)&unk_A0D68, Offset, 1);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A0D68, &dword_0);
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = class_getInstanceVariable(v3, "mImageBinary");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A0D80, (uint64_t)&unk_9EBD8, v5);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A0D80, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0DA8, (const xmlChar *)"image-ref", v6, v7, v8, v9, v10, v11, (uint64_t)&unk_A0D68);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0DA8, &dword_0);
  sub_3FFC4((uint64_t)&unk_A0DD8, "webview", (uint64_t)&unk_9EA20, (uint64_t)sub_1DBB0, (uint64_t)sub_ABB0, (uint64_t)&unk_A0DA8);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_A0DD8, &dword_0);
}

uint64_t sub_1DE58(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDWPAttachment);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);

  return 1;
}

void sub_1DEC4(xmlTextReader *a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDTTable);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  sub_3AC58(a1, (uint64_t)&unk_A0588, (uint64_t)&unk_A0F68, a2);
}

uint64_t sub_1DF3C(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] < a2) {
    return 3;
  }
  id v5 = [v3 popRetainedObject];
  id v6 = [v3 popRetainedObject];
  [v6 setModel:v5];

  *((void *)[v3 peekObject] + 1) = v6;
  return 1;
}

uint64_t sub_1DFB4(xmlTextReader *a1, void *a2)
{
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 3;
  }
  uint64_t v4 = AttributeNs;
  id v5 = objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "objectWithXmlUid:", AttributeNs);
  if (v5)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v5);
  }
  else
  {
    uint64_t v7 = -[GQDWPAttachmentRef initWithUID:root:]([GQDWPAttachmentRef alloc], "initWithUID:root:", v4, objc_msgSend(objc_msgSend(a2, "documentState"), "root"));
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v7);
  }
  xmlFree(v4);
  return 1;
}

uint64_t sub_1E230()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mDrawable");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A0E20, (uint64_t)&unk_9F4B0, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A0E20, &dword_0);
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = class_getInstanceVariable(v3, "mDrawable");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A0E48, (uint64_t)&unk_9EC48, v5);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A0E48, &dword_0);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = class_getInstanceVariable(v6, "mDrawable");
  ptrdiff_t v8 = ivar_getOffset(v7);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A0E70, (uint64_t)&unk_9EE50, v8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A0E70, &dword_0);
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = class_getInstanceVariable(v9, "mDrawable");
  ptrdiff_t v11 = ivar_getOffset(v10);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A0E98, (uint64_t)&unk_A0730, v11);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A0E98, &dword_0);
  uint64_t v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = class_getInstanceVariable(v12, "mDrawable");
  ptrdiff_t v14 = ivar_getOffset(v13);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A0EC0, (uint64_t)&unk_9EAE0, v14);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A0EC0, &dword_0);
  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = class_getInstanceVariable(v15, "mDrawable");
  ptrdiff_t v17 = ivar_getOffset(v16);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A0EE8, (uint64_t)&unk_9E670, v17);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A0EE8, &dword_0);
  uint64_t v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = class_getInstanceVariable(v18, "mDrawable");
  ptrdiff_t v20 = ivar_getOffset(v19);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_A0F10, v20);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A0F10, &dword_0);
  uint64_t v21 = (objc_class *)objc_opt_class();
  uint64_t v22 = class_getInstanceVariable(v21, "mDrawable");
  ptrdiff_t v23 = ivar_getOffset(v22);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A0F28, (uint64_t)&unk_9E728, v23);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A0F28, &dword_0);
  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = class_getInstanceVariable(v24, "mDrawable");
  ptrdiff_t v26 = ivar_getOffset(v25);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_A0F50, v26);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A0F50, &dword_0);
  sub_3823C(qword_A0F68, (uint64_t)sub_1DEC4, (uint64_t)sub_1DF3C);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A0F68, &dword_0);
  sub_3FBB0((uint64_t)&unk_A0F80, (const xmlChar *)"drawable-shape", v27, v28, v29, v30, v31, v32, (uint64_t)&unk_A0E20);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A0F80, &dword_0);
  sub_3FDC0((uint64_t)&unk_A0FB0, "attachment", (uint64_t)sub_1DE58, 0, 0, (uint64_t)&unk_A0F80);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A0FB0, &dword_0);
  sub_381D0(qword_A0FF0, (uint64_t)&unk_A0FB0, (uint64_t)sub_3CC80);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A0FF0, &dword_0);
  sub_3823C(qword_A1008, (uint64_t)sub_1DFB4, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A1008, &dword_0);
}

uint64_t sub_1E818(xmlTextReader *a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDWPAutoNumber);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  ptrdiff_t v5 = xmlTextReaderConstLocalName(a1);
  CFDictionaryRef v6 = (const __CFDictionary *)qword_A4158;
  if (!qword_A4158)
  {
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_850E0, 0);
    qword_A4158 = (uint64_t)Mutable;
    CFDictionaryAddValue(Mutable, "page-number", (char *)&dword_0 + 1);
    CFDictionaryAddValue(Mutable, "page-count", (char *)&dword_0 + 2);
    CFDictionaryAddValue(Mutable, "section-number", (char *)&dword_0 + 3);
    CFDictionaryAddValue(Mutable, "section-count", &dword_4);
    CFDictionaryAddValue(Mutable, "toc-pagenum", (char *)&dword_0 + 1);
    CFDictionaryRef v6 = (const __CFDictionary *)qword_A4158;
  }
  unsigned int Value = CFDictionaryGetValue(v6, v5);
  v4->mType = Value;
  if (!Value) {
    return 3;
  }
  munsigned int Value = v4->mValue;
  if (mValue) {
    CFRelease(mValue);
  }
  uint64_t v10 = sub_4340C(a1, qword_A35E8, (xmlChar *)"value");
  ptrdiff_t v11 = @"1";
  if (v10) {
    ptrdiff_t v11 = (__CFString *)v10;
  }
  v4->munsigned int Value = v11;
  return 1;
}

uint64_t sub_1E9C0()
{
  sub_3823C(qword_A1020, (uint64_t)sub_1E818, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A1020, &dword_0);
}

uint64_t sub_1EA38(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  ptrdiff_t v5 = [v3 peekObject];
  CFDictionaryRef v6 = (const void *)v5[1];
  if (v6) {
    CFRelease(v6);
  }
  v5[1] = v4;
  return 1;
}

uint64_t sub_1EBC0(uint64_t a1, void *a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return 1;
}

uint64_t sub_1EC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1038, (const xmlChar *)"p", a3, a4, a5, a6, a7, a8, (uint64_t)&unk_A1B98);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1038, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1068, "wp-block-list", 0, 0, 0, (uint64_t)&unk_A1038);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1068, &dword_0);
}

uint64_t sub_1ED28(uint64_t a1, void *a2)
{
  id v3 = objc_alloc_init(GQDWPBodyStorage);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v3);

  return 1;
}

uint64_t sub_1ED70(uint64_t a1, void *a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return 1;
}

uint64_t sub_1EDC4(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  ptrdiff_t v5 = [v3 peekObject];
  CFDictionaryRef v6 = (const void *)v5[2];
  if (v6) {
    CFRelease(v6);
  }
  v5[2] = v4;
  return 1;
}

uint64_t sub_1EEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A10A8, (const xmlChar *)"section", a3, a4, a5, a6, a7, a8, (uint64_t)&unk_A1C20);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A10A8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A10D8, "body-storage-body", (uint64_t)sub_1ED70, 0, (uint64_t)sub_1EDC4, (uint64_t)&unk_A10A8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A10D8, &dword_0);
  sub_381D0(qword_A1118, (uint64_t)&unk_A10D8, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A1118, &dword_0);
  ptrdiff_t v8 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v8, "mFootnotes");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A1130, (uint64_t)&unk_A1760, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A1130, &dword_0);
  sub_3FBB0((uint64_t)&unk_A1158, (const xmlChar *)"text-storage", v11, v12, v13, v14, v15, v16, (uint64_t)&unk_A1130);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1158, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1188, "footnotes", 0, 0, 0, (uint64_t)&unk_A1158);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1188, &dword_0);
  sub_381D0(qword_A11C8, (uint64_t)&unk_A1188, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A11C8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A11E0, (const xmlChar *)"text-body", v17, v18, v19, v20, v21, v22, (uint64_t)qword_A1118);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A11E0, &dword_0);
  sub_3FFC4((uint64_t)&unk_A1210, "body-storage", (uint64_t)&unk_A1D98, (uint64_t)sub_1ED28, 0, (uint64_t)&unk_A11E0);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_A1210, &dword_0);
}

uint64_t sub_1F19C(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPBookmark);
  unsigned int v5 = [(GQDWPBookmark *)v4 readAttributesFromReader:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  if (v5 == 3) {
    return 3;
  }
  return sub_200A8(a1, a2);
}

uint64_t sub_1F358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1258, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1258, &dword_0);
  sub_3FFC4((uint64_t)&unk_A1288, "wp-bookmark", (uint64_t)&unk_A1538, (uint64_t)sub_1F19C, (uint64_t)sub_200AC, (uint64_t)&unk_A1258);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A1288, &dword_0);
  sub_381D0(qword_A12D0, (uint64_t)&unk_A1288, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A12D0, &dword_0);
}

id sub_1F460(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPColumn);
  id v5 = (id)[(GQDWPColumn *)v4 readAttributesFromReader:a1];
  if (v5 == 1) {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  }

  return v5;
}

uint64_t sub_1F588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A12E8, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A12E8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1318, "wp-column", (uint64_t)sub_1F460, 0, 0, (uint64_t)&unk_A12E8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1318, &dword_0);
  sub_381D0(qword_A1358, (uint64_t)&unk_A1318, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A1358, &dword_0);
}

id sub_1F680(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPColumns);
  id v5 = (id)[(GQDWPColumns *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  }

  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return v5;
}

uint64_t sub_1F730(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  id v5 = [v3 peekObject];
  CFDictionaryRef v6 = (const void *)v5[1];
  if (v6) {
    CFRelease(v6);
  }
  v5[1] = v4;
  return 1;
}

uint64_t sub_1F798(void *a1, signed int a2)
{
  id v3 = [a1 documentState];
  signed int v4 = [v3 objectStackDepth];
  if (v4 < a2) {
    return 3;
  }
  if (v4 > a2) {

  }
  return 1;
}

uint64_t sub_1F8A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1370, (const xmlChar *)"column", a3, a4, a5, a6, a7, a8, (uint64_t)qword_A1358);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1370, &dword_0);
  sub_3FDC0((uint64_t)&unk_A13A0, "wp-columns", (uint64_t)sub_1F680, 0, (uint64_t)sub_1F730, (uint64_t)&unk_A1370);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A13A0, &dword_0);
  sub_381D0(qword_A13E0, (uint64_t)&unk_A13A0, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A13E0, &dword_0);
  sub_3FBB0((uint64_t)&unk_A13F8, (const xmlChar *)"columns", v8, v9, v10, v11, v12, v13, (uint64_t)qword_A13E0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A13F8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1428, "columnsWrapper", 0, 0, (uint64_t)sub_1F798, (uint64_t)&unk_A13F8);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1428, &dword_0);
}

id sub_1FA30(uint64_t a1, void *a2)
{
  signed int v4 = objc_alloc_init(GQDWPExternalTextWrap);
  id v5 = (id)[(GQDWPExternalTextWrap *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  }

  return v5;
}

uint64_t sub_1FC68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dword_A4160 = 0;
  qword_A4168 = (uint64_t)"regular";
  dword_A4170 = 1;
  qword_A4178 = (uint64_t)"tight";
  xmmword_A4180 = xmmword_9D3E8;
  dword_A4190 = 0;
  qword_A4198 = (uint64_t)"left";
  dword_A41A0 = 1;
  qword_A41A8 = (uint64_t)"right";
  dword_A41B0 = 2;
  qword_A41B8 = (uint64_t)"both";
  xmmword_A41C0 = xmmword_9D3E8;
  dword_A4200 = 0;
  qword_A4208 = (uint64_t)"directional";
  dword_A4210 = 1;
  qword_A4218 = (uint64_t)"neither";
  dword_A4220 = 2;
  qword_A4228 = (uint64_t)"largest";
  xmmword_A4230 = xmmword_9D3E8;
  dword_A41D0 = 0;
  qword_A41D8 = (uint64_t)"aligned";
  dword_A41E0 = 1;
  qword_A41E8 = (uint64_t)"unaligned";
  xmmword_A41F0 = xmmword_9D3E8;
  sub_3FBB0((uint64_t)&unk_A1468, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1468, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1498, "external-textwrap", (uint64_t)sub_1FA30, 0, 0, (uint64_t)&unk_A1468);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1498, &dword_0);
}

uint64_t sub_1FE08(xmlTextReader *a1, void *a2)
{
  signed int v4 = objc_alloc_init(GQDWPFootnote);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  munsigned int Value = v4->mValue;
  if (mValue) {
    CFRelease(mValue);
  }
  v4->munsigned int Value = (__CFString *)sub_4340C(a1, qword_A35E8, (xmlChar *)"autonumber");

  return 1;
}

uint64_t sub_1FEE0()
{
  sub_3823C(qword_A14D8, (uint64_t)sub_1FE08, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A14D8, &dword_0);
}

uint64_t sub_1FF58(xmlTextReader *a1, void *a2)
{
  signed int v4 = objc_alloc_init(GQDWPFootnoteMark);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  munsigned int Value = v4->mValue;
  if (mValue) {
    CFRelease(mValue);
  }
  v4->munsigned int Value = (__CFString *)sub_4340C(a1, qword_A35E8, (xmlChar *)"mark");

  return 1;
}

uint64_t sub_20030()
{
  sub_3823C(qword_A14F0, (uint64_t)sub_1FF58, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A14F0, &dword_0);
}

uint64_t sub_200B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1508, (const xmlChar *)"span", a3, a4, a5, a6, a7, a8, (uint64_t)&unk_A1CB0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1508, &dword_0);
  sub_3FFC4((uint64_t)&unk_A1538, "wp-inline-list", (uint64_t)&unk_A1EE8, 0, 0, (uint64_t)&unk_A1508);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_A1538, &dword_0);
}

uint64_t sub_201E0(uint64_t a1, void *a2)
{
  signed int v4 = objc_alloc_init(GQDWPLayout);
  unsigned int v5 = [(GQDWPLayout *)v4 readAttributesFromReader:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  if (v5 == 3) {
    return 3;
  }
  return sub_1EBC0(a1, a2);
}

uint64_t sub_203A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1580, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1580, &dword_0);
  sub_3FFC4((uint64_t)&unk_A15B0, "layout", (uint64_t)&unk_A1068, (uint64_t)sub_201E0, (uint64_t)sub_1EA38, (uint64_t)&unk_A1580);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A15B0, &dword_0);
  sub_381D0(qword_A15F8, (uint64_t)&unk_A15B0, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A15F8, &dword_0);
}

id sub_204A8(uint64_t a1, void *a2)
{
  signed int v4 = objc_alloc_init(GQDWPLayoutFrame);
  id v5 = (id)[(GQDWPLayoutFrame *)v4 readAttributesFromReader:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return v5;
}

uint64_t sub_20508(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  objc_msgSend(objc_msgSend(v3, "peekObject"), "resolveStyleRef");
  return 1;
}

uint64_t sub_20798()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mStorage");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A1610, (uint64_t)&unk_A1760, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A1610, &dword_0);
  sub_3FBB0((uint64_t)&unk_A1638, (const xmlChar *)"text-storage", v3, v4, v5, v6, v7, v8, (uint64_t)&unk_A1610);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1638, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1668, "layout-frame", (uint64_t)sub_204A8, 0, (uint64_t)sub_20508, (uint64_t)&unk_A1638);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1668, &dword_0);
}

uint64_t sub_208E4(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_alloc_init(GQDWPLayoutStorage);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v3);

  return 1;
}

uint64_t sub_2092C(uint64_t a1, void *a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return 1;
}

uint64_t sub_20980(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = [v4 popRetainedObject];
  uint64_t v6 = objc_msgSend(objc_msgSend(a1, "documentState"), "peekObject");
  uint64_t v7 = (const void *)v6[2];
  if (v7) {
    CFRelease(v7);
  }
  v6[2] = v5;
  return 1;
}

uint64_t sub_20AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A16A8, (const xmlChar *)"layout", a3, a4, a5, a6, a7, a8, (uint64_t)qword_A15F8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A16A8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A16D8, "layout-storage-body", (uint64_t)sub_2092C, 0, (uint64_t)sub_20980, (uint64_t)&unk_A16A8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A16D8, &dword_0);
  sub_381D0(qword_A1718, (uint64_t)&unk_A16D8, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A1718, &dword_0);
  sub_3FBB0((uint64_t)&unk_A1730, (const xmlChar *)"text-body", v8, v9, v10, v11, v12, v13, (uint64_t)qword_A1718);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1730, &dword_0);
  sub_3FFC4((uint64_t)&unk_A1760, "layout-storage", (uint64_t)&unk_A1D98, (uint64_t)sub_208E4, 0, (uint64_t)&unk_A1730);
  return __cxa_atexit((void (*)(void *))sub_48C0, &unk_A1760, &dword_0);
}

id sub_20C94(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPLineSpacing);
  id v5 = (id)[(GQDWPLineSpacing *)v4 readAttributesFromReader:a1 processor:a2];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  }

  return v5;
}

uint64_t sub_20DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  qword_A4248 = (uint64_t)"relative";
  dword_A4250 = 1;
  qword_A4258 = (uint64_t)"minimum";
  dword_A4260 = 2;
  qword_A4268 = (uint64_t)"absolute";
  dword_A4270 = 3;
  qword_A4278 = (uint64_t)"maximum";
  dword_A4280 = 4;
  dword_A4240 = 0;
  qword_A4288 = (uint64_t)"keynote";
  xmmword_A4290 = xmmword_9D3E8;
  sub_3FBB0((uint64_t)&unk_A17A8, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A17A8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A17D8, "wp-linespacing", (uint64_t)sub_20C94, 0, 0, (uint64_t)&unk_A17A8);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A17D8, &dword_0);
}

void sub_21004(_Unwind_Exception *a1)
{
}

void sub_21024(void *a1)
{
}

void sub_212F0(_Unwind_Exception *a1)
{
}

void sub_21310(void *a1)
{
}

uint64_t sub_217D4(xmlTextReader *a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPLink);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  uint64_t result = [(GQDWPLink *)v4 readStyleFromReader:a1 processor:a2];
  if (result == 1)
  {
    AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)"href", 0);
    if (AttributeNs)
    {
      uint64_t v7 = AttributeNs;
      int v8 = xmlStrlen(AttributeNs);
      if (v8 >= 32000) {
        int v9 = 32000;
      }
      else {
        int v9 = v8;
      }
      v4->mHref = (__CFString *)CFStringCreateWithBytes(0, v7, v9, 0x8000100u, 0);
      xmlFree(v7);
    }
    uint64_t v10 = sub_200A8(a1, a2);
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
    return v10;
  }
  return result;
}

uint64_t sub_218D0(xmlTextReader *a1, void *a2)
{
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 3;
  }
  id v5 = AttributeNs;
  id v6 = objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "objectWithXmlUid:", AttributeNs);
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = objc_alloc_init(GQDWPLink);
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v8);

    [(GQDWPLink *)v8 readStyleFromReader:a1 processor:a2];
    int v9 = (__CFString *)[v7 href];
    if (v9)
    {
      uint64_t v10 = v9;
      CFRetain(v9);
      v8->mHref = v10;
    }
    uint64_t v11 = sub_200A8(a1, a2);
  }
  else
  {
    uint64_t v11 = 3;
  }
  xmlFree(v5);
  return v11;
}

uint64_t sub_21B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1818, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1818, &dword_0);
  sub_3FFC4((uint64_t)&unk_A1848, "wp-link", (uint64_t)&unk_A1538, (uint64_t)sub_217D4, (uint64_t)sub_200AC, (uint64_t)&unk_A1818);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A1848, &dword_0);
  sub_3FFC4((uint64_t)&unk_A1890, "wp-link-ref", (uint64_t)&unk_A1848, (uint64_t)sub_218D0, (uint64_t)sub_200AC, (uint64_t)&unk_A1818);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A1890, &dword_0);
  sub_381D0(qword_A18D8, (uint64_t)&unk_A1848, (uint64_t)sub_3CC80);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A18D8, &dword_0);
  sub_381D0(qword_A18F0, (uint64_t)&unk_A1890, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A18F0, &dword_0);
}

id sub_21CDC(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPListLabelGeometry);
  id v5 = (id)[(GQDWPListLabelGeometry *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  }

  return v5;
}

uint64_t sub_21E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1908, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1908, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1938, "list-label-geometry", (uint64_t)sub_21CDC, 0, 0, (uint64_t)&unk_A1908);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1938, &dword_0);
}

id sub_21F3C(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPListLabelTypeInfo);
  id v5 = (id)[(GQDWPListLabelTypeInfo *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  }

  return v5;
}

uint64_t sub_220C4()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mLabel");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A1978, (uint64_t)&unk_A1E78, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A1978, &dword_0);
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = class_getInstanceVariable(v3, "mLabel");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_A19A0, v5);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A19A0, &dword_0);
  sub_3FBB0((uint64_t)&unk_A19B8, (const xmlChar *)"text-label", v6, v7, v8, v9, v10, v11, (uint64_t)&unk_A1978);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A19B8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A19E8, "list-label-typeinfo", (uint64_t)sub_21F3C, 0, 0, (uint64_t)&unk_A19B8);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A19E8, &dword_0);
}

id sub_22338(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPPadding);
  id v5 = (id)[(GQDWPPadding *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  }

  return v5;
}

uint64_t sub_223E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1A28, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1A28, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1A58, "padding", (uint64_t)sub_22338, 0, 0, (uint64_t)&unk_A1A28);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1A58, &dword_0);
}

id sub_2249C(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPPageStart);
  id v5 = (id)[(GQDWPPageStart *)v4 readAttributesFromReader:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return v5;
}

uint64_t sub_22548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1A98, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1A98, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1AC8, "page-start", (uint64_t)sub_2249C, 0, 0, (uint64_t)&unk_A1A98);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1AC8, &dword_0);
  sub_381D0(qword_A1B08, (uint64_t)&unk_A1AC8, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A1B08, &dword_0);
}

uint64_t sub_22640(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPParagraph);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  uint64_t result = [(GQDWPParagraph *)v4 readAttributesFromReader:a1 processor:a2];
  if (result == 1)
  {
    return sub_1EBC0(a1, a2);
  }
  return result;
}

uint64_t sub_22A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1B20, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1B20, &dword_0);
  sub_3FFC4((uint64_t)&unk_A1B50, "wp-para", (uint64_t)&unk_A1538, (uint64_t)sub_22640, (uint64_t)sub_200AC, (uint64_t)&unk_A1B20);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A1B50, &dword_0);
  sub_381D0(qword_A1B98, (uint64_t)&unk_A1B50, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A1B98, &dword_0);
}

uint64_t sub_22B08(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPSection);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  [(GQDWPSection *)v4 readAttributesFromReader:a1 processor:a2];
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return 1;
}

uint64_t sub_22B9C(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  id v5 = [v3 peekObject];
  uint64_t v6 = (const void *)v5[1];
  if (v6) {
    CFRelease(v6);
  }
  v5[1] = v4;
  return 1;
}

uint64_t sub_22D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1BB0, (const xmlChar *)"layout", a3, a4, a5, a6, a7, a8, (uint64_t)qword_A15F8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1BB0, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1BE0, "section", (uint64_t)sub_22B08, (uint64_t)&qword_A2878, (uint64_t)sub_22B9C, (uint64_t)&unk_A1BB0);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1BE0, &dword_0);
  sub_381D0(qword_A1C20, (uint64_t)&unk_A1BE0, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A1C20, &dword_0);
}

uint64_t sub_22E88(xmlTextReader *a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPSpan);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)"style", *(const xmlChar **)(qword_A35E8 + 16));
  if (AttributeNs)
  {
    uint64_t v6 = AttributeNs;
    id v7 = objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "topObjectOfClass:", objc_opt_class()), "stylesheet");
    if (!v7) {
      id v7 = objc_msgSend(objc_msgSend(a2, "documentState"), "stylesheet");
    }
    uint64_t v8 = (GQDSStyle *)[v7 styleWithIdentifier:v6];
    v4->mCharStyle = v8;
    if (!v8)
    {
      uint64_t v8 = (GQDSStyle *)[v7 styleWithXmlUid:v6];
      v4->mCharStyle = v8;
    }
    uint64_t v9 = v8;
    xmlFree(v6);
  }
  return sub_1EBC0((uint64_t)a1, a2);
}

uint64_t sub_2300C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1C38, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1C38, &dword_0);
  sub_3FFC4((uint64_t)&unk_A1C68, "wp-span", (uint64_t)&unk_A1EE8, (uint64_t)sub_22E88, (uint64_t)sub_23B04, (uint64_t)&unk_A1C38);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A1C68, &dword_0);
  sub_381D0(qword_A1CB0, (uint64_t)&unk_A1C68, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A1CB0, &dword_0);
}

uint64_t sub_23114(uint64_t a1, void *a2)
{
  objc_msgSend(objc_msgSend(a2, "documentState"), "setIsReadingStorageAttachments:", 1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return 1;
}

uint64_t sub_23178(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = [v4 popRetainedObject];
  uint64_t v6 = [v4 peekObject];
  id v7 = (const void *)v6[3];
  if (v7) {
    CFRelease(v7);
  }
  v6[3] = v5;
  objc_msgSend(objc_msgSend(a1, "documentState"), "setIsReadingStorageAttachments:", 0);
  return 1;
}

uint64_t sub_23270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1CC8, (const xmlChar *)"attachment", a3, a4, a5, a6, a7, a8, (uint64_t)qword_A0FF0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1CC8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1CF8, "attachments", (uint64_t)sub_23114, 0, (uint64_t)sub_23178, (uint64_t)&unk_A1CC8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1CF8, &dword_0);
  sub_381D0(qword_A1D38, (uint64_t)&unk_A1CF8, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A1D38, &dword_0);
  uint64_t v8 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v8, "mStylesheet");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_A1D50, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A1D50, &dword_0);
  sub_3FBB0((uint64_t)&unk_A1D68, (const xmlChar *)"stylesheet-ref", v11, v12, v13, v14, v15, v16, (uint64_t)&unk_A1D50);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1D68, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1D98, "storage", 0, 0, 0, (uint64_t)&unk_A1D68);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1D98, &dword_0);
}

id sub_23474(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPTab);
  id v5 = (id)[(GQDWPTab *)v4 readAttributesFromReader:a1];
  if (v5 == 1) {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  }

  return v5;
}

uint64_t sub_23640(void *a1, void *a2)
{
  [a1 position];
  float v4 = v3;
  [a2 position];
  if (v4 < v5) {
    return -1;
  }
  else {
    return v4 > v5;
  }
}

uint64_t sub_23684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1DD8, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1DD8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1E08, "tab", (uint64_t)sub_23474, 0, 0, (uint64_t)&unk_A1DD8);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1E08, &dword_0);
}

id sub_23860(uint64_t a1, void *a2)
{
  float v4 = objc_alloc_init(GQDWPTextLabel);
  id v5 = (id)[(GQDWPTextLabel *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  }

  return v5;
}

uint64_t sub_23A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1E48, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1E48, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1E78, "text-label", (uint64_t)sub_23860, 0, 0, (uint64_t)&unk_A1E48);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1E78, &dword_0);
}

uint64_t sub_23B04(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  id v5 = [v3 peekObject];
  uint64_t v6 = (const void *)v5[1];
  if (v6) {
    CFRelease(v6);
  }
  v5[1] = v4;
  return 1;
}

uint64_t sub_23B6C(xmlTextReader *a1, void *a2)
{
  id v4 = [a2 documentState];
  id v5 = [[GQDWPText alloc] initWithContent:xmlTextReaderConstValue(a1)];
  int v6 = [v4 objectStackDepth];
  [v4 pushObject:v5];

  return sub_3CC80(a2, v6);
}

uint64_t sub_23D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1EB8, (const xmlChar *)"tab", a3, a4, a5, a6, a7, a8, (uint64_t)&unk_A1F28);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1EB8, &dword_0);
  sub_3FE3C((uint64_t)&unk_A1EE8, "wp-text-list", 0, 0, (uint64_t)sub_23B6C, 0, (uint64_t)&unk_A1EB8);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1EE8, &dword_0);
}

uint64_t sub_23F58(xmlTextReader *a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPTextMarker);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  id v5 = xmlTextReaderConstLocalName(a1);
  CFDictionaryRef v6 = (const __CFDictionary *)qword_A42B0;
  if (!qword_A42B0)
  {
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_850E0, 0);
    qword_A42B0 = (uint64_t)Mutable;
    CFDictionaryAddValue(Mutable, "tab", (char *)&dword_0 + 1);
    CFDictionaryAddValue(Mutable, "br", (char *)&dword_0 + 2);
    CFDictionaryAddValue(Mutable, "crbr", (char *)&dword_0 + 3);
    CFDictionaryAddValue(Mutable, "intratopicbr", &dword_4);
    CFDictionaryAddValue(Mutable, "lnbr", (char *)&dword_4 + 1);
    CFDictionaryAddValue(Mutable, "pgbr", (char *)&dword_4 + 2);
    CFDictionaryAddValue(Mutable, "sectbr", (char *)&dword_4 + 3);
    CFDictionaryAddValue(Mutable, "layoutbr", &dword_8);
    CFDictionaryAddValue(Mutable, "contbr", (char *)&dword_8 + 1);
    CFDictionaryAddValue(Mutable, "footnotebr", (char *)&dword_8 + 2);
    CFDictionaryRef v6 = (const __CFDictionary *)qword_A42B0;
  }
  unsigned int Value = CFDictionaryGetValue(v6, v5);
  v4->mType = Value;
  if (Value) {
    return 1;
  }
  else {
    return 3;
  }
}

uint64_t sub_240C4()
{
  sub_3823C(qword_A1F28, (uint64_t)sub_23F58, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A1F28, &dword_0);
}

uint64_t sub_2413C(uint64_t a1, void *a2)
{
  id v3 = objc_alloc_init(GQDWPTocContent);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v3);

  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return 1;
}

uint64_t sub_241B4(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  id v4 = [v3 popRetainedObject];
  id v5 = [v3 peekObject];
  CFDictionaryRef v6 = (const void *)v5[1];
  if (v6) {
    CFRelease(v6);
  }
  v5[1] = v4;
  return 1;
}

uint64_t sub_24274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1F40, (const xmlChar *)"toc-entry", a3, a4, a5, a6, a7, a8, (uint64_t)&unk_A20D0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1F40, &dword_0);
  sub_3FDC0((uint64_t)&unk_A1F70, "wp-toc-content", (uint64_t)sub_2413C, 0, (uint64_t)sub_241B4, (uint64_t)&unk_A1F40);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A1F70, &dword_0);
  sub_381D0(qword_A1FB0, (uint64_t)&unk_A1F70, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A1FB0, &dword_0);
}

uint64_t sub_243A4(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPTocEmpty);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return sub_1EBC0(a1, a2);
}

uint64_t sub_2440C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A1FC8, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A1FC8, &dword_0);
  sub_3FFC4((uint64_t)&unk_A1FF8, "wp-toc-empty", (uint64_t)&unk_A1068, (uint64_t)sub_243A4, (uint64_t)sub_1EA38, (uint64_t)&unk_A1FC8);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A1FF8, &dword_0);
  sub_381D0(qword_A2040, (uint64_t)&unk_A1FF8, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2040, &dword_0);
}

uint64_t sub_24514(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDWPTocEntry);
  unsigned int v5 = [(GQDWPTocEntry *)v4 readAttributesFromReader:a1 processor:a2];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  if (v5 == 3) {
    return 3;
  }
  return sub_1EBC0(a1, a2);
}

uint64_t sub_24668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A2058, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2058, &dword_0);
  sub_3FFC4((uint64_t)&unk_A2088, "wp-toc-entry", (uint64_t)&unk_A1068, (uint64_t)sub_24514, (uint64_t)sub_1EA38, (uint64_t)&unk_A2058);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A2088, &dword_0);
  sub_381D0(qword_A20D0, (uint64_t)&unk_A2088, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A20D0, &dword_0);
}

id sub_28C64(uint64_t a1, void *a2)
{
  [a2 startElement:"link"];
  [a2 setAttribute:"rel" value:"stylesheet"];
  [a2 setAttribute:"type" value:"text/css"];
  [a2 setAttribute:"href" cfStringValue:a1];
  return [a2 endElement];
}

void sub_2D23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2D4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_30FFC(int a1, void *a2)
{
}

BOOL sub_31004(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2
      && *(void *)(a1 + 8) == *(void *)(a2 + 8)
      && *(void *)(a1 + 16) == *(void *)(a2 + 16)
      && *(void *)(a1 + 24) == *(void *)(a2 + 24)
      && *(void *)(a1 + 32) == *(void *)(a2 + 32)
      && *(void *)(a1 + 40) == *(void *)(a2 + 40)
      && *(void *)(a1 + 48) == *(void *)(a2 + 48)
      && *(_DWORD *)(a1 + 56) == *(_DWORD *)(a2 + 56)
      && *(unsigned __int8 *)(a1 + 60) == *(unsigned __int8 *)(a2 + 60);
}

unint64_t sub_310A0(uint64_t a1)
{
  unint64_t v2 = (unint64_t)[*(id *)a1 hash];
  unint64_t v3 = (unint64_t)[*(id *)(a1 + 8) hash] ^ v2;
  unint64_t v4 = (unint64_t)[*(id *)(a1 + 16) hash];
  unint64_t v5 = v3 ^ v4 ^ (unint64_t)[*(id *)(a1 + 24) hash];
  unint64_t v6 = (unint64_t)[*(id *)(a1 + 32) hash];
  unint64_t v7 = v6 ^ (unint64_t)[*(id *)(a1 + 40) hash];
  return v5 ^ v7 ^ (unint64_t)[*(id *)(a1 + 48) hash] ^ *(int *)(a1 + 56) ^ (unint64_t)*(unsigned __int8 *)(a1 + 60);
}

void sub_31134(int a1, void *a2)
{
}

BOOL sub_3113C(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2
      && *(void *)(a1 + 8) == *(void *)(a2 + 8)
      && *(unsigned __int8 *)(a1 + 16) == *(unsigned __int8 *)(a2 + 16)
      && *(_DWORD *)(a1 + 20) == *(_DWORD *)(a2 + 20)
      && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

unint64_t sub_31198(uint64_t a1)
{
  unint64_t v2 = (unint64_t)[*(id *)a1 hash];
  return (unint64_t)[*(id *)(a1 + 8) hash] ^ v2 ^ *(unsigned __int8 *)(a1 + 16) ^ (unint64_t)*(int *)(a1 + 20) ^ *(int *)(a1 + 24);
}

id sub_31578(void *a1)
{
  uint64_t v1 = a1;
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFStringGetTypeID())
  {
    CFRetain(v1);
    return v1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  return [v1 createStringRef];
}

void sub_31618(uint64_t a1, void *a2, __CFString *a3)
{
  id v5 = sub_31578(a2);
  unint64_t v6 = v5;
  if (a1 && v5)
  {
    CFStringAppendFormat(a3, 0, @"%@: %@; \n", a1, v5);
  }
  else if (!v5)
  {
    return;
  }
  CFRelease(v6);
}

void sub_31750(uint64_t a1, void *a2, __CFString *a3)
{
  id v5 = sub_31578(a2);
  unint64_t v6 = v5;
  if (a1 && v5)
  {
    CFStringAppendFormat(a3, 0, @"%@: %@; ", a1, v5);
  }
  else if (!v5)
  {
    return;
  }
  CFRelease(v6);
}

char *sub_34708(char **a1, unint64_t a2, _WORD *a3)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t result = *a1;
  if (a2 <= (uint64_t)(v6 - (void)result) >> 1)
  {
    uint64_t v13 = a1[1];
    unint64_t v14 = (v13 - result) >> 1;
    if (v14 >= a2) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = (v13 - result) >> 1;
    }
    if (v15)
    {
      uint64_t v16 = result;
      do
      {
        *(_WORD *)uint64_t v16 = *a3;
        v16 += 2;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[2 * a2];
    }
    else
    {
      uint64_t v17 = &v13[2 * (a2 - v14)];
      uint64_t v18 = 2 * a2 - 2 * v14;
      do
      {
        *(_WORD *)uint64_t v13 = *a3;
        v13 += 2;
        v18 -= 2;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      unint64_t v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if ((a2 & 0x8000000000000000) != 0) {
      sub_A594();
    }
    if (v6 <= a2) {
      unint64_t v8 = a2;
    }
    else {
      unint64_t v8 = v6;
    }
    if (v6 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t result = sub_34898(a1, v9);
    uint64_t v10 = a1[1];
    uint64_t v11 = &v10[2 * a2];
    uint64_t v12 = 2 * a2;
    do
    {
      *(_WORD *)uint64_t v10 = *a3;
      v10 += 2;
      v12 -= 2;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

char *sub_34898(void *a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_A594();
  }
  uint64_t result = (char *)sub_348D8((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

void *sub_348D8(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_A22C();
  }
  return operator new(2 * a2);
}

void sub_36274(void ***a1)
{
  CFTypeID v2 = (uint64_t *)*a1;
  if (*v2)
  {
    sub_362C8((uint64_t)v2, *v2);
    unint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_362C8(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 8); i != a2; i -= 8)
  {
    id v5 = *(void **)(i - 8);
  }
  *(void *)(a1 + 8) = a2;
}

void *sub_381AC(void *result, uint64_t a2)
{
  *uint64_t result = off_84C20;
  result[1] = a2;
  result[2] = 0;
  return result;
}

void *sub_381D0(void *result, uint64_t a2, uint64_t a3)
{
  *uint64_t result = off_84C20;
  result[1] = a2;
  result[2] = a3;
  return result;
}

void sub_381F4(uint64_t a1, xmlTextReader *a2, void *a3)
{
}

uint64_t sub_3820C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16);
  if (v3) {
    return v3(a2, a3);
  }
  else {
    return 1;
  }
}

uint64_t sub_38228(uint64_t a1, xmlTextReader *a2)
{
  return sub_3AD64(a2);
}

uint64_t sub_38234()
{
  return 1;
}

void *sub_3823C(void *result, uint64_t a2, uint64_t a3)
{
  *uint64_t result = off_84C80;
  result[1] = a2;
  result[2] = a3;
  return result;
}

uint64_t sub_38260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(a2, a3);
}

uint64_t sub_38270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16);
  if (v3) {
    return v3(a2, a3);
  }
  else {
    return 1;
  }
}

uint64_t sub_3828C(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 8) = a2;
  *(void *)(result + 16) = 0;
  *(void *)uint64_t result = off_84CB0;
  *(void *)(result + 24) = a3;
  *(unsigned char *)(result + 32) = 1;
  return result;
}

uint64_t sub_382BC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(void *)(result + 8) = a2;
  *(void *)(result + 16) = 0;
  *(void *)uint64_t result = off_84CB0;
  *(void *)(result + 24) = a3;
  *(unsigned char *)(result + 32) = a6;
  return result;
}

uint64_t sub_382E8(uint64_t a1, void *a2, int a3)
{
  id v5 = [a2 documentState];
  if ((int)[v5 objectStackDepth] <= a3) {
    return 3;
  }
  id v6 = [v5 popRetainedObject];
  unint64_t v7 = (char *)[v5 peekObject];
  if (v7)
  {
    *(void *)&v7[*(void *)(a1 + 24)] = v6;
    if (!*(unsigned char *)(a1 + 32)) {
      goto LABEL_7;
    }
  }
  else if (v6)
  {
LABEL_7:
  }
  return 1;
}

uint64_t sub_3836C(uint64_t result, uint64_t a2)
{
  *(void *)uint64_t result = off_84CE0;
  *(void *)(result + 8) = a2;
  *(_WORD *)(result + 16) = 256;
  return result;
}

uint64_t sub_38394(uint64_t result, uint64_t a2, char a3)
{
  *(void *)uint64_t result = off_84CE0;
  *(void *)(result + 8) = a2;
  *(unsigned char *)(result + 16) = a3;
  *(unsigned char *)(result + 17) = 1;
  return result;
}

uint64_t sub_383C0(uint64_t a1, xmlTextReader *a2, void *a3)
{
  id v6 = objc_msgSend(objc_msgSend(a3, "documentState"), "root");
  AttributeNs = xmlTextReaderGetAttributeNs(a2, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 3;
  }
  unint64_t v8 = AttributeNs;
  id v9 = [v6 objectWithXmlUid:AttributeNs];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (char *)objc_msgSend(objc_msgSend(a3, "documentState"), "peekObject");
    if (v11)
    {
      uint64_t v12 = v11;
      if (*(unsigned char *)(a1 + 17)) {
        id v13 = v10;
      }
      *(void *)&v12[*(void *)(a1 + 8)] = v10;
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 3;
    }
  }
  else if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = 3;
  }
  xmlFree(v8);
  return v14;
}

uint64_t sub_384A8()
{
  return 1;
}

void *sub_384B0(void *result, uint64_t a2)
{
  *uint64_t result = off_84D10;
  result[1] = a2;
  return result;
}

uint64_t sub_384D0(uint64_t a1, xmlTextReader *a2, void *a3)
{
  id v5 = (char *)objc_msgSend(objc_msgSend(a3, "documentState"), "peekObject");
  NSSize v7 = NSZeroSize;
  if (!sub_43488(a2, &v7)) {
    return 3;
  }
  *(NSSize *)&v5[*(void *)(a1 + 8)] = v7;
  return 1;
}

uint64_t sub_3854C()
{
  return 1;
}

void *sub_38554(void *result, uint64_t a2)
{
  *uint64_t result = off_84D40;
  result[1] = a2;
  return result;
}

uint64_t sub_38574(uint64_t a1, xmlTextReader *a2, void *a3)
{
  id v5 = (char *)objc_msgSend(objc_msgSend(a3, "documentState"), "peekObject");
  NSPoint v7 = NSZeroPoint;
  if (!sub_43508(a2, &v7)) {
    return 3;
  }
  *(NSPoint *)&v5[*(void *)(a1 + 8)] = v7;
  return 1;
}

uint64_t sub_385F0()
{
  return 1;
}

void *sub_385F8(void *result, uint64_t a2)
{
  *uint64_t result = off_84D70;
  result[1] = a2;
  return result;
}

uint64_t sub_38618(uint64_t a1, xmlTextReader *a2, void *a3)
{
  id v5 = (char *)objc_msgSend(objc_msgSend(a3, "documentState"), "peekObject");
  uint64_t v6 = *(void *)(a1 + 8);
  NSPoint v7 = *(const void **)&v5[v6];
  if (v7)
  {
    CFRelease(v7);
    *(void *)&v5[v6] = 0;
  }
  AttributeNs = xmlTextReaderGetAttributeNs(a2, (const xmlChar *)"path", *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 3;
  }
  id v9 = AttributeNs;
  *(void *)&v5[v6] = sub_43588((const char *)AttributeNs);
  xmlFree(v9);
  return 1;
}

uint64_t sub_386B8()
{
  return 1;
}

void sub_386C0()
{
}

void sub_386D4()
{
}

void sub_386E8()
{
}

void sub_386FC()
{
}

void sub_38710()
{
}

void sub_38724()
{
}

void sub_38738()
{
}

void sub_3874C()
{
}

uint64_t sub_38760()
{
  qword_A20E8 = (uint64_t)off_84C50;
  return __cxa_atexit((void (*)(void *))nullsub_1, &qword_A20E8, &dword_0);
}

uint64_t sub_387A0(xmlTextReader *a1, void *a2)
{
  id v4 = [a2 documentState];
  if (![v4 isGeneratingThumbnail]
    || ![v4 isThumbnailGenerationDone])
  {
    sub_3AC58(a1, (uint64_t)&unk_9DFD8, (uint64_t)&unk_A20F0, a2);
  }
  return sub_38228((uint64_t)&qword_A20E8, a1);
}

uint64_t sub_38844(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = [v4 popRetainedObject];
  objc_msgSend(objc_msgSend(v4, "peekObject"), "addTheme:", v5);
  id v6 = [a1 generator];
  if (v6) {
    id v7 = objc_msgSend(v6, "handleThemeStylesheet:state:", objc_msgSend(v5, "stylesheet"), objc_msgSend(a1, "documentState"));
  }
  else {
    id v7 = &dword_0 + 1;
  }

  return (uint64_t)v7;
}

uint64_t sub_388F0(xmlTextReader *a1, void *a2)
{
  id v4 = [a2 documentState];
  char v8 = 0;
  if (objc_msgSend(objc_msgSend(v4, "peekObject"), "readDocumentVersion:isTooNew:", a1, &v8))
  {
    id v5 = [a2 generator];
    if (v5)
    {
      id v6 = objc_msgSend(v5, "beginPresentation:state:", objc_msgSend(v4, "root"), v4);
      [v4 setGeneratorBeginWasCalled];
    }
    else
    {
      return 1;
    }
  }
  else
  {
    [a2 setWrongFormat:1];
    return sub_3AD64(a1);
  }
  return (uint64_t)v6;
}

uint64_t sub_389A8(xmlTextReader *a1, void *a2)
{
  return 3;
}

void sub_38C64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_38F1C(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_38D9C(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_38E04(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_58A04(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_38E20(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_38E58(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_38E88(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL sub_38ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void sub_38F1C(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

__n128 sub_38F90(void *a1, __n128 *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 32 * (v4 - v5) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_39020(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  __n128 result = *a2;
  *(__n128 *)(*(void *)(v5 + ((v7 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v7) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  ++a1[5];
  return result;
}

void sub_39020(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x100;
  unint64_t v4 = v2 - 256;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    char v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    id v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)char v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)sub_A63C(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      float64x2_t v37 = &v34[8 * v36];
      float64_t v38 = (uint64_t *)a1[1];
      char v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        char v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        float64x2_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)float64x2_t v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      id v9 = (char *)a1[1];
    }
    char v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      sub_39338(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    sub_39450((uint64_t)a1, &v54);
    float64x2_t v44 = (void *)a1[1];
    char v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    id v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)sub_A63C((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      float64x2_t v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      char v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        char v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        uint64_t v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)uint64_t v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      float64x2_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        char v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  v56 = a1 + 3;
  *(void *)&long long v54 = sub_A63C((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  uint64_t v53 = operator new(0x1000uLL);
  sub_39570(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_39688((uint64_t)&v54, v27);
  }
  uint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_392EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_39338(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    unint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)sub_A63C(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      uint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

void sub_39450(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    unint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_A63C(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_39570(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_A63C(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_39688(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_A63C(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

uint64_t sub_397A4()
{
  sub_3823C(qword_A20F0, (uint64_t)sub_387A0, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A20F0, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2108, (const xmlChar *)"slide", v0, v1, v2, v3, v4, v5, (uint64_t)qword_A20F0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2108, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2138, "slide-list", 0, 0, 0, (uint64_t)&unk_A2108);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2138, &dword_0);
  sub_381D0(qword_A2178, (uint64_t)&unk_A2138, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2178, &dword_0);
  sub_381D0(qword_A2190, (uint64_t)&unk_9E188, (uint64_t)sub_38844);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2190, &dword_0);
  sub_3FBB0((uint64_t)&unk_A21A8, (const xmlChar *)"version-history", v6, v7, v8, v9, v10, v11, (uint64_t)&qword_A20E8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A21A8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A21D8, "preso", (uint64_t)sub_388F0, 0, 0, (uint64_t)&unk_A21A8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A21D8, &dword_0);
  sub_381D0(qword_A2218, (uint64_t)&unk_A21D8, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2218, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2230, "preso", (uint64_t)sub_389A8, 0, 0, (uint64_t)&unk_A21A8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2230, &dword_0);
  sub_381D0(qword_A2270, (uint64_t)&unk_A2230, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2270, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2288, (const xmlChar *)"presentation", v12, v13, v14, v15, v16, v17, (uint64_t)qword_A2218);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2288, &dword_0);
  sub_3FDC0((uint64_t)&unk_A22B8, "initial", 0, 0, 0, (uint64_t)&unk_A2288);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A22B8, &dword_0);
}

id sub_39B08(xmlTextReader *a1, void *a2)
{
  id v4 = [a2 documentState];
  id v5 = [a2 generator];
  if (!v5) {
    return &dword_0 + 1;
  }
  uint64_t v6 = v5;
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  id v8 = objc_msgSend(objc_msgSend(v4, "root"), "objectWithXmlUid:", AttributeNs);
  xmlFree(AttributeNs);
  return [v6 handleWorkspaceStyle:v8 state:v4];
}

uint64_t sub_39BD0(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = [v4 popRetainedObject];
  if ([a1 generator]
    && (id v6 = [v4 currentDrawablesGenerator]) != 0
    && (uint64_t v7 = v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = [v7 handleDrawable:v5 state:v4];
  }
  else
  {
    id v8 = &dword_0 + 1;
  }
  if (objc_msgSend(objc_msgSend(v4, "root"), "objectWithXmlUid:", objc_msgSend(v5, "uid")) == v5) {
    objc_msgSend(objc_msgSend(v4, "root"), "forgetAboutObject:withXmlUid:", v5, objc_msgSend(v5, "uid"));
  }

  return (uint64_t)v8;
}

uint64_t sub_39CCC(xmlTextReader *a1, void *a2)
{
  id v4 = [a2 documentState];
  id v5 = [a2 generator];
  if (v5)
  {
    id v6 = v5;
    AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
    if (AttributeNs)
    {
      id v8 = AttributeNs;
      [v6 handleDrawableZOrder:AttributeNs state:v4];
      xmlFree(v8);
    }
  }
  return 1;
}

uint64_t sub_39D68(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t sub_39DAC(void *a1)
{
  return 1;
}

id sub_39DEC(uint64_t a1, void *a2)
{
  id v3 = [a2 documentState];
  id v4 = [a2 generator];
  if (!v4) {
    return &dword_0 + 1;
  }
  id v5 = objc_msgSend(v4, "beginWorkspacePage:state:", objc_msgSend(v3, "topObjectOfClass:", objc_opt_class()), v3);
  objc_msgSend(objc_msgSend(a2, "documentState"), "setCurrentDrawablesGenerator:", v5);
  return [v5 beginDrawables:v3];
}

uint64_t sub_39E98(void *a1)
{
  id v2 = [a1 documentState];
  if (![a1 generator]) {
    return 1;
  }
  id v3 = [v2 currentDrawablesGenerator];
  if (!v3) {
    return 1;
  }
  id v4 = [v3 endDrawables:v2];
  [v2 setCurrentDrawablesGenerator:0];
  return (uint64_t)v4;
}

uint64_t sub_39EFC(xmlTextReader *a1, void *a2)
{
  id v4 = [a2 generator];
  if (!v4) {
    return 1;
  }
  id v5 = v4;
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)"workspace-name", *(const xmlChar **)(qword_A3600 + 16));
  id v7 = objc_msgSend(v5, "beginWorkspace:state:", AttributeNs, objc_msgSend(a2, "documentState"));
  if (AttributeNs) {
    xmlFree(AttributeNs);
  }
  return (uint64_t)v7;
}

id sub_39F9C(void *a1)
{
  id v2 = [a1 generator];
  if (!v2) {
    return &dword_0 + 1;
  }
  id v3 = v2;
  id v4 = [a1 documentState];
  return [v3 endWorkspace:v4];
}

id sub_39FF8(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return &dword_0 + 3;
  }
  id v5 = [v4 popRetainedObject];
  id v6 = [v4 peekObject];
  [v6 setStylesheet:v5];
  [v4 setStylesheet:v5];

  id v7 = [a1 generator];
  if (!v7) {
    return &dword_0 + 1;
  }
  return [v7 handleStylesheet:v6 state:v4];
}

uint64_t sub_3A0A8(xmlTextReader *a1, void *a2)
{
  id v4 = [a2 documentState];
  char v8 = 0;
  if (objc_msgSend(objc_msgSend(v4, "peekObject"), "readDocumentVersion:isTooNew:", a1, &v8))
  {
    id v5 = [a2 generator];
    if (v5)
    {
      id v6 = objc_msgSend(v5, "beginDocument:state:", objc_msgSend(v4, "root"), v4);
      [v4 setGeneratorBeginWasCalled];
    }
    else
    {
      return 1;
    }
  }
  else
  {
    [a2 setWrongFormat:1];
    return sub_3AD64(a1);
  }
  return (uint64_t)v6;
}

void sub_3A3DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_38F1C(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_3A514()
{
  sub_3823C(qword_A22F8, (uint64_t)sub_39B08, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A22F8, &dword_0);
  sub_3CF28(qword_A2310, (uint64_t)sub_39BD0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_4, qword_A2310, &dword_0);
  sub_3823C(qword_A2320, (uint64_t)sub_39CCC, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A2320, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2338, 0, v0, v1, v2, v3, v4, v5, v49);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2338, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2368, "layer-drawables", (uint64_t)sub_39D68, (uint64_t)qword_A2310, (uint64_t)sub_39DAC, (uint64_t)&unk_A2338);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2368, &dword_0);
  sub_381D0(qword_A23A8, (uint64_t)&unk_A2368, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A23A8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A23C0, (const xmlChar *)"geometry", v6, v7, v8, v9, v10, v11, (uint64_t)&qword_A20E8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A23C0, &dword_0);
  sub_3FDC0((uint64_t)&unk_A23F0, "workspace-page", (uint64_t)sub_39DEC, 0, (uint64_t)sub_39E98, (uint64_t)&unk_A23C0);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A23F0, &dword_0);
  sub_381D0(qword_A2430, (uint64_t)&unk_A23F0, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2430, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2448, 0, v12, v13, v14, v15, v16, v17, v50);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2448, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2478, "workspace-zorder", 0, (uint64_t)qword_A2320, 0, (uint64_t)&unk_A2448);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2478, &dword_0);
  sub_381D0(qword_A24B8, (uint64_t)&unk_A2478, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A24B8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A24D0, (const xmlChar *)"page-info", v18, v19, v20, v21, v22, v23, (uint64_t)qword_A2430);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A24D0, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2500, "workspace", (uint64_t)sub_39EFC, 0, (uint64_t)sub_39F9C, (uint64_t)&unk_A24D0);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2500, &dword_0);
  sub_381D0(qword_A2540, (uint64_t)&unk_A2500, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2540, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2558, (const xmlChar *)"workspace", v24, v25, v26, v27, v28, v29, (uint64_t)qword_A2540);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2558, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2588, "workspaces", 0, 0, 0, (uint64_t)&unk_A2558);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2588, &dword_0);
  sub_381D0(qword_A25C8, (uint64_t)&unk_A2588, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A25C8, &dword_0);
  sub_381D0(qword_A25E0, (uint64_t)&unk_A2AE8, (uint64_t)sub_39FF8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A25E0, &dword_0);
  sub_381AC(qword_A25F8, (uint64_t)&unk_A0A48);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A25F8, &dword_0);
  sub_3F8F8(qword_A2610, (uint64_t)"tracked-formulas", v30, v31, v32, v33, v34, v35, (uint64_t)&qword_A20E8);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A2610, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2630, "calculationEngine", 0, 0, 0, (uint64_t)qword_A2610);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2630, &dword_0);
  sub_381AC(qword_A2670, (uint64_t)&unk_A2630);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2670, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2688, (const xmlChar *)"stylesheet", v36, v37, v38, v39, v40, v41, (uint64_t)qword_A25E0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2688, &dword_0);
  sub_3FDC0((uint64_t)&unk_A26B8, "lasso-doc", (uint64_t)sub_3A0A8, 0, 0, (uint64_t)&unk_A2688);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A26B8, &dword_0);
  sub_381D0(qword_A26F8, (uint64_t)&unk_A26B8, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A26F8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2710, (const xmlChar *)"document", v42, v43, v44, v45, v46, v47, (uint64_t)qword_A26F8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2710, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2740, "lasso-initial", 0, 0, 0, (uint64_t)&unk_A2710);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2740, &dword_0);
}

uint64_t sub_3AC08()
{
  uint64_t result = pthread_mutex_lock(&stru_9D2C8);
  if (!result)
  {
    byte_A2780 = 1;
    return pthread_mutex_unlock(&stru_9D2C8);
  }
  return result;
}

void sub_3AC58(xmlTextReader *a1, uint64_t a2, uint64_t a3, void *a4)
{
  unsigned int v7 = objc_msgSend(objc_msgSend(a4, "documentState"), "objectStackDepth");
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16))(a2);
  *(_DWORD *)(v8 + 16) = xmlTextReaderDepth(a1) + 1;
  *(_DWORD *)(v8 + 20) = v7;
  [a4 stateStack];
  sub_38D9C(&v9, v8);
}

void sub_3AD4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_38F1C(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_3AD64(xmlTextReader *a1)
{
  int v1 = xmlTextReaderNext(a1);
  if (v1 == 1) {
    unsigned int v2 = 2;
  }
  else {
    unsigned int v2 = 3;
  }
  if (v1) {
    return v2;
  }
  else {
    return 4;
  }
}

uint64_t sub_3AD94(xmlTextReader *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  int v10 = xmlTextReaderDepth(a1);
  do
  {
    unint64_t v11 = a3[5] + a3[4] - 1;
    uint64_t v12 = (uint64_t *)(*(void *)(a3[1] + ((v11 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = (std::__shared_weak_count *)v12[1];
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v10 >= *(_DWORD *)(v13 + 16))
    {
      int v18 = 3;
      if (!v14) {
        continue;
      }
LABEL_12:
      sub_38F1C(v14);
      continue;
    }
    uint64_t v15 = *(void (**)(uint64_t, void))(v13 + 48);
    if (v15) {
      v15(a2, *(unsigned int *)(v13 + 20));
    }
    sub_3C464(a3);
    uint64_t v16 = a4[5] - 1;
    uint64_t v17 = (unsigned int *)(*(void *)(a4[1] + (((unint64_t)(v16 + a4[4]) >> 5) & 0x7FFFFFFFFFFFFF8))
                         + 16 * (v16 + *((unsigned char *)a4 + 32)));
    if (*(void *)v17)
    {
      if ((*(unsigned int (**)(void, uint64_t, void))(**(void **)v17 + 24))(*(void *)v17, a2, v17[2]) == 3)
      {
        int v18 = 1;
        if (v14) {
          goto LABEL_12;
        }
        continue;
      }
      uint64_t v16 = a4[5] - 1;
    }
    a4[5] = v16;
    sub_3C4D4(a4, 1);
    int v18 = 0;
    if (v14) {
      goto LABEL_12;
    }
  }
  while (!v18);
  if (v18 != 3) {
    return 3;
  }
  int v19 = xmlTextReaderNodeType(a1);
  if (v19 == 14)
  {
    uint64_t v28 = *(void *)(*(void *)(a3[1] + (((unint64_t)(a3[5] + a3[4] - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                    + 16 * (*((unsigned char *)a3 + 40) + *((unsigned char *)a3 + 32) - 1));
    uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)v28 + 32))(v28);
    if (!v29) {
      return 1;
    }
    uint64_t v37 = (uint64_t (*)(xmlTextReader *, uint64_t))v29;
    uint64_t v30 = (xmlChar *)xmlTextReaderConstValue(a1);
    if (!v30) {
      return 1;
    }
    int v31 = *v30;
    if (v31 == 13 || v31 == 10) && (sub_4285C(v30)) {
      return 1;
    }
    uint64_t v32 = a1;
    uint64_t v33 = a2;
    uint64_t v34 = v37;
  }
  else
  {
    if (v19 != 3)
    {
      if (v19 == 1)
      {
        uint64_t v20 = *(void *)(*(void *)(a3[1] + (((unint64_t)(a3[5] + a3[4] - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                        + 16 * (*((unsigned char *)a3 + 40) + *((unsigned char *)a3 + 32) - 1));
        uint64_t v21 = xmlTextReaderConstLocalName(a1);
        uint64_t v22 = (*(uint64_t (**)(uint64_t, const xmlChar *))(*(void *)v20 + 24))(v20, v21);
        if (v22)
        {
          uint64_t v23 = v22;
          int v24 = *(_DWORD *)(*(void *)(*(void *)(a3[1]
                                                  + (((unint64_t)(a3[5] + a3[4] - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                                      + 16 * (*((unsigned char *)a3 + 40) + *((unsigned char *)a3 + 32) - 1))
                          + 16);
          id v25 = [a5 objectStackDepth];
          uint64_t result = (*(uint64_t (**)(uint64_t, xmlTextReader *, uint64_t))(*(void *)v23 + 16))(v23, a1, a2);
          if (result != 1) {
            return result;
          }
          if (*(_DWORD *)(*(void *)(*(void *)(a3[1]
                                                 + (((unint64_t)(a3[5] + a3[4] - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                                     + 16 * (*((unsigned char *)a3 + 40) + *((unsigned char *)a3 + 32) - 1))
                         + 16) == v24)
          {
            uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t, id))(*(void *)v23 + 24);
            return v27(v23, a2, v25);
          }
        }
      }
      return 1;
    }
    uint64_t v35 = *(void *)(*(void *)(a3[1] + (((unint64_t)(a3[5] + a3[4] - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                    + 16 * (*((unsigned char *)a3 + 40) + *((unsigned char *)a3 + 32) - 1));
    uint64_t v36 = (*(uint64_t (**)(uint64_t))(*(void *)v35 + 32))(v35);
    if (!v36) {
      return 1;
    }
    uint64_t v34 = (uint64_t (*)(xmlTextReader *, uint64_t))v36;
    uint64_t v32 = a1;
    uint64_t v33 = a2;
  }
  return v34(v32, v33);
}

void sub_3B1A4(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_38F1C(v1);
  }
  _Unwind_Resume(exception_object);
}

id sub_3B564(void *a1, uint64_t a2, int a3)
{
  return [a1 readToBuffer:a2 size:a3];
}

uint64_t sub_3B5D8(void *a1)
{
  return 0;
}

ssize_t sub_3BDE4(int a1, void *a2, int a3)
{
  return read(a1, a2, a3);
}

uint64_t sub_3BE04(gzFile_s *a1, void *a2, unsigned int a3)
{
  uint64_t v4 = gzread(a1, a2, a3);
  if ((v4 & 0x80000000) != 0)
  {
    int errnum = 0;
    gzerror(a1, &errnum);
  }
  return v4;
}

uint64_t sub_3BE4C(gzFile_s *a1)
{
  uint64_t result = gzclose(a1);
  if (result)
  {
    int errnum = 0;
    gzerror(a1, &errnum);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_3BE90(void *a1)
{
  unsigned int v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  if (v3 == v2)
  {
    uint64_t v4 = a1 + 5;
    uint64_t v3 = (void **)a1[1];
  }
  else
  {
    uint64_t v4 = a1 + 5;
    unint64_t v5 = a1[4];
    uint64_t v6 = &v2[v5 >> 8];
    uint64_t v7 = (uint64_t)*v6;
    uint64_t v8 = (uint64_t)*v6 + 16 * v5;
    uint64_t v9 = *(uint64_t *)((char *)v2 + (((a1[5] + v5) >> 5) & 0x7FFFFFFFFFFFFF8))
       + 16 * (*((unsigned char *)a1 + 40) + v5);
    if (v8 != v9)
    {
      do
      {
        int v10 = *(std::__shared_weak_count **)(v8 + 8);
        if (v10)
        {
          sub_38F1C(v10);
          uint64_t v7 = (uint64_t)*v6;
        }
        v8 += 16;
        if (v8 - v7 == 4096)
        {
          uint64_t v11 = (uint64_t)v6[1];
          ++v6;
          uint64_t v7 = v11;
          uint64_t v8 = v11;
        }
      }
      while (v8 != v9);
      unsigned int v2 = (void **)a1[1];
      uint64_t v3 = (void **)a1[2];
    }
  }
  void *v4 = 0;
  unint64_t v12 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      unsigned int v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v12 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v13 = v12 >> 3;
  if (v13 == 1)
  {
    uint64_t v14 = 128;
  }
  else
  {
    if (v13 != 2) {
      goto LABEL_18;
    }
    uint64_t v14 = 256;
  }
  a1[4] = v14;
LABEL_18:
  while (v2 != v3)
  {
    uint64_t v15 = *v2++;
    operator delete(v15);
  }
  return sub_3BFC8((uint64_t)a1);
}

uint64_t sub_3BFC8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  uint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_3C018(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 128;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 256;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    uint64_t v7 = *v2++;
    operator delete(v7);
  }
  return sub_3BFC8((uint64_t)a1);
}

__n128 sub_3C0C0(void *a1, __n128 *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 32 * (v4 - v5) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_3C14C(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  __n128 result = *a2;
  *(__n128 *)(*(void *)(v5 + ((v7 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v7) = *a2;
  ++a1[5];
  return result;
}

void sub_3C14C(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x100;
  unint64_t v4 = v2 - 256;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)uint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)sub_A63C(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        uint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        uint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)uint64_t v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    int v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    uint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      sub_39338(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    sub_39450((uint64_t)a1, &v54);
    uint64_t v44 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)sub_A63C((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        uint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        uint64_t v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)uint64_t v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      uint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        uint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  v56 = a1 + 3;
  *(void *)&long long v54 = sub_A63C((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  uint64_t v53 = operator new(0x1000uLL);
  sub_39570(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_39688((uint64_t)&v54, v27);
  }
  uint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_3C418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_3C464(void *a1)
{
  uint64_t v2 = a1[5] - 1;
  BOOL v3 = *(std::__shared_weak_count **)(*(void *)(a1[1] + (((unint64_t)(v2 + a1[4]) >> 5) & 0x7FFFFFFFFFFFFF8))
                                    + 16 * (v2 + *((unsigned char *)a1 + 32))
                                    + 8);
  if (v3)
  {
    sub_38F1C(v3);
    uint64_t v2 = a1[5] - 1;
  }
  a1[5] = v2;
  return sub_3C4D4(a1, 1);
}

uint64_t sub_3C4D4(void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 32 * (v2 - v3) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x100) {
    a2 = 1;
  }
  if (v5 < 0x200) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void sub_3C6D0(id a1)
{
  qword_A4328 = (uint64_t)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"index.key", @"com.apple.iwork.keynote.key-tef", @"index.pages", @"com.apple.iwork.pages.pages-tef", @"index.numbers", @"com.apple.iwork.numbers.numbers-tef", 0);
}

uint64_t sub_3CC24(xmlTextReader *a1, void *a2)
{
  uint64_t v3 = sub_4340C(a1, qword_A35E0, (xmlChar *)"string");
  if (v3)
  {
    uint64_t v4 = v3;
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v3);
    CFRelease(v4);
  }
  return 1;
}

uint64_t sub_3CC80(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = [v4 popRetainedObject];
  CFArrayAppendValue((CFMutableArrayRef)objc_msgSend(objc_msgSend(a1, "documentState"), "peekObject"), v5);

  return 1;
}

uint64_t sub_3CCF0(xmlTextReader *a1, uint64_t a2)
{
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)"class", *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 1;
  }
  id v5 = AttributeNs;
  uint64_t v6 = sub_3FF74((uint64_t)&unk_A2CC8);
  if (v6) {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, xmlTextReader *, uint64_t))(*(void *)v6 + 16))(v6, a1, a2);
  }
  else {
    uint64_t v7 = 1;
  }
  xmlFree(v5);
  return v7;
}

uint64_t sub_3CDAC(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t sub_3CDF0(xmlTextReader *a1, void *a2)
{
  switch(sub_42A00(a1))
  {
    case 'c':
      id v4 = (xmlChar *)[objc_alloc((Class)NSNumber) initWithBool:sub_42A58(a1)];
      break;
    case 'd':
      id v4 = sub_42BA4(a1);
      break;
    case 'f':
      float v6 = sub_42B1C(a1);
      id v7 = objc_alloc((Class)NSNumber);
      *(float *)&double v8 = v6;
      id v4 = (xmlChar *)[v7 initWithFloat:v8];
      break;
    case 'i':
      id v4 = (xmlChar *)[objc_alloc((Class)NSNumber) initWithInt:sub_42AC0(a1)];
      break;
    default:
      sub_42B38(a1);
      id v4 = (xmlChar *)[objc_alloc((Class)NSNumber) initWithDouble:v5];
      break;
  }
  uint64_t v9 = v4;
  if (!v4) {
    return 3;
  }
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

void *sub_3CF28(void *result, uint64_t a2)
{
  *__n128 result = off_84F08;
  result[1] = a2;
  return result;
}

uint64_t sub_3CF48(xmlTextReader *a1, void *a2)
{
  id v4 = objc_msgSend(objc_msgSend(a2, "documentState"), "root");
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 3;
  }
  float v6 = AttributeNs;
  id v7 = [v4 objectWithXmlUid:AttributeNs];
  if (v7)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v7);
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 3;
  }
  xmlFree(v6);
  return v8;
}

uint64_t sub_3D000(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }

  return 1;
}

uint64_t sub_3D04C(uint64_t a1, void *a2)
{
  id v4 = objc_msgSend(objc_msgSend(a2, "documentState"), "root");
  double v5 = [[GQDSStylesheet alloc] initWithRoot:v4];
  [v4 addIdentifiedObject:v5 fromCurrentNode:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v5);

  return 1;
}

uint64_t sub_3D0C8(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  objc_msgSend(objc_msgSend(v3, "peekObject"), "resolveStyleParents");
  return 1;
}

uint64_t sub_3D114(uint64_t a1, void *a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", Mutable, a1);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return 1;
}

uint64_t sub_3D18C(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  CFArrayRef v4 = (const __CFArray *)[v3 peekObject];
  v6.length = CFArrayGetCount(v4);
  v6.location = 0;
  CFArraySortValues(v4, v6, (CFComparatorFunction)sub_23640, 0);
  return 1;
}

uint64_t sub_3D200(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  int v4 = [v3 objectStackDepth] - a2;
  if (v4 == 2)
  {
    id v5 = [v3 popRetainedObject];
    id v6 = [v3 popRetainedObject];
    CFDictionaryAddValue((CFMutableDictionaryRef)[v3 peekObject], v6, v5);
  }
  else
  {
    uint64_t v8 = v4;
    if (v4 >= 1)
    {
      do
      {

        --v8;
      }
      while (v8);
    }
  }
  return 1;
}

uint64_t sub_3D2B4(uint64_t a1, void *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", Mutable, a1);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return 1;
}

uint64_t sub_3D334(uint64_t a1, xmlTextReaderPtr reader, void *a3)
{
  id v6 = (xmlChar *)xmlTextReaderConstLocalName(reader);
  if (sub_42760(v6))
  {
    id v7 = sub_427B8(v6);
    id v8 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "documentState"), "root"), "classForName:", v7);
    if (v8)
    {
      uint64_t v9 = v8;
      AttributeNs = xmlTextReaderGetAttributeNs(reader, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
      if (AttributeNs
        && (id v11 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "documentState"), "root"), "objectWithXmlUid:", AttributeNs)) != 0|| objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___GQDNameMappableWithDefault)&& (id v11 = objc_msgSend(v9, "createReplacementForMissingObject:processor:", reader, a3)) != 0)
      {
        objc_msgSend(objc_msgSend(a3, "documentState"), "pushObject:", v11);

        uint64_t v12 = 1;
        if (!AttributeNs) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      uint64_t v12 = 3;
      if (AttributeNs) {
LABEL_18:
      }
        xmlFree(AttributeNs);
    }
    else
    {
      uint64_t v12 = sub_3AD64(reader);
    }
LABEL_19:
    xmlFree(v7);
    return v12;
  }
  id v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "documentState"), "root"), "classForName:", v6);
  if (v13)
  {
    id v14 = [v13 stateForReading];
    sub_3AC58(reader, (uint64_t)v14, a1, a3);
  }
  return sub_3AD64(reader);
}

uint64_t sub_3D50C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8);
  if (v3) {
    return v3(a2, a3);
  }
  else {
    return 1;
  }
}

void sub_3D528(uint64_t a1, xmlTextReaderPtr reader, void *a3)
{
  id v6 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "documentState"), "root"), "classForName:", xmlTextReaderConstLocalName(reader));
  if (v6 != (id)objc_opt_class())
  {
    sub_381F4((uint64_t)&unk_A2A18, reader, a3);
  }
  id v7 = [v6 stateForReading];
  sub_3AC58(reader, (uint64_t)v7, a1, a3);
}

uint64_t sub_3D5E8(uint64_t a1, void *a2, int a3)
{
  id v4 = [a2 documentState];
  if ((int)[v4 objectStackDepth] < a3) {
    return 3;
  }
  if ([v4 objectStackDepth] == a3) {
    return 2;
  }

  return 1;
}

void sub_3D650(uint64_t a1)
{
  nullsub_2(a1);
  operator delete();
}

void sub_3D688(uint64_t a1)
{
  nullsub_2(a1);
  operator delete();
}

uint64_t sub_3D6C0()
{
  qword_A2788 = (uint64_t)&off_84F38;
  __cxa_atexit((void (*)(void *))j_nullsub_2_7, &qword_A2788, &dword_0);
  sub_3823C(qword_A2790, (uint64_t)sub_3CC24, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A2790, &dword_0);
  sub_3823C(qword_A27A8, (uint64_t)sub_3CC24, (uint64_t)sub_3CC80);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A27A8, &dword_0);
  sub_3823C(qword_A27C0, (uint64_t)sub_3CCF0, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A27C0, &dword_0);
  sub_381D0(qword_A27D8, (uint64_t)&unk_A1E08, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A27D8, &dword_0);
  sub_381D0(qword_A27F0, (uint64_t)&unk_A1E08, (uint64_t)sub_3CC80);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A27F0, &dword_0);
  sub_3823C(qword_A2808, (uint64_t)sub_3CDAC, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A2808, &dword_0);
  sub_3823C(qword_A2820, (uint64_t)sub_3CDAC, (uint64_t)sub_3CC80);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A2820, &dword_0);
  sub_3823C(qword_A2838, (uint64_t)sub_3CDF0, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A2838, &dword_0);
  sub_3823C(qword_A2850, (uint64_t)sub_3CDF0, (uint64_t)sub_3CC80);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A2850, &dword_0);
  qword_A2868 = (uint64_t)off_84F08;
  unk_A2870 = 0;
  __cxa_atexit((void (*)(void *))j_nullsub_2_4, &qword_A2868, &dword_0);
  qword_A2878 = (uint64_t)off_84F08;
  unk_A2880 = sub_3CC80;
  __cxa_atexit((void (*)(void *))j_nullsub_2_4, &qword_A2878, &dword_0);
  sub_3823C(qword_A2888, (uint64_t)sub_3CF48, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A2888, &dword_0);
  sub_3823C(qword_A28A0, (uint64_t)sub_3CF48, (uint64_t)sub_3CC80);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A28A0, &dword_0);
  sub_381D0(qword_A28B8, (uint64_t)&unk_9EBD8, (uint64_t)sub_3D000);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A28B8, &dword_0);
  sub_381D0(qword_A28D0, (uint64_t)&unk_A3E90, (uint64_t)sub_3D000);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A28D0, &dword_0);
  sub_381D0(qword_A28E8, (uint64_t)&unk_A17D8, (uint64_t)sub_3D000);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A28E8, &dword_0);
  sub_381D0(qword_A2900, (uint64_t)&unk_A1498, (uint64_t)sub_3D000);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2900, &dword_0);
  sub_381D0(qword_A2918, (uint64_t)&unk_A38E8, (uint64_t)sub_3D000);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2918, &dword_0);
  sub_381D0(qword_A2930, (uint64_t)&unk_A3A28, (uint64_t)sub_3D000);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2930, &dword_0);
  sub_381D0(qword_A2948, (uint64_t)&unk_9FFC8, (uint64_t)sub_3D000);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2948, &dword_0);
  sub_381D0(qword_A2960, (uint64_t)&unk_A1A58, (uint64_t)sub_3D000);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2960, &dword_0);
  sub_381D0(qword_A2978, (uint64_t)&unk_A1428, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2978, &dword_0);
  sub_381D0(qword_A2990, (uint64_t)&unk_A3DA0, (uint64_t)sub_3D000);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2990, &dword_0);
  sub_3FBB0((uint64_t)&unk_A29A8, (const xmlChar *)"filtered-image", v0, v1, v2, v3, v4, v5, (uint64_t)qword_A28D0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A29A8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A29D8, "look-for-sharable-objects", 0, 0, 0, (uint64_t)&unk_A29A8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A29D8, &dword_0);
  sub_381D0(qword_A2A18, (uint64_t)&unk_A29D8, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2A18, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2A30, 0, v6, v7, v8, v9, v10, v11, v49);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2A30, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2A60, "style-list", 0, (uint64_t)&qword_A2788, 0, (uint64_t)&unk_A2A30);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2A60, &dword_0);
  sub_381AC(qword_A2AA0, (uint64_t)&unk_A2A60);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2AA0, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2AB8, (const xmlChar *)"styles", v12, v13, v14, v15, v16, v17, (uint64_t)qword_A2AA0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2AB8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2AE8, "stylesheet", (uint64_t)sub_3D04C, 0, (uint64_t)sub_3D0C8, (uint64_t)&unk_A2AB8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2AE8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2B28, (const xmlChar *)"tabstop", v18, v19, v20, v21, v22, v23, (uint64_t)qword_A27F0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2B28, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2B58, "wp-tabs", (uint64_t)sub_3D114, 0, (uint64_t)sub_3D18C, (uint64_t)&unk_A2B28);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2B58, &dword_0);
  sub_381D0(qword_A2B98, (uint64_t)&unk_A2B58, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2B98, &dword_0);
  sub_381D0(qword_A2BB0, (uint64_t)&unk_A2B58, (uint64_t)sub_3CC80);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2BB0, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2BC8, (const xmlChar *)"string", v24, v25, v26, v27, v28, v29, (uint64_t)qword_A27A8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2BC8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2C28, "array", (uint64_t)sub_3D114, (uint64_t)&qword_A2878, 0, (uint64_t)&unk_A2BC8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2C28, &dword_0);
  sub_381AC(qword_A2C68, (uint64_t)&unk_A2C28);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2C68, &dword_0);
  sub_381D0(qword_A2BF8, (uint64_t)&unk_A2C28, (uint64_t)sub_3CC80);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2BF8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2C80, (const xmlChar *)"string", v30, v31, v32, v33, v34, v35, (uint64_t)qword_A2790);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2C80, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2CC8, "name-mapped-object", 0, (uint64_t)&qword_A2868, 0, (uint64_t)&unk_A2C80);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2CC8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2D08, (const xmlChar *)"key", v36, v37, v38, v39, v40, v41, (uint64_t)qword_A27C0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2D08, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2D38, "dictionary-pair", 0, 0, (uint64_t)sub_3D200, (uint64_t)&unk_A2D08);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2D38, &dword_0);
  sub_381D0(qword_A2D78, (uint64_t)&unk_A2D38, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2D78, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2D90, (const xmlChar *)"pair", v42, v43, v44, v45, v46, v47, (uint64_t)qword_A2D78);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2D90, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2DC0, "dictionary-object", (uint64_t)sub_3D2B4, 0, 0, (uint64_t)&unk_A2D90);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2DC0, &dword_0);
  sub_381D0(qword_A2CB0, (uint64_t)&unk_A2DC0, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2CB0, &dword_0);
  sub_381D0(qword_A2C10, (uint64_t)&unk_A2DC0, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2C10, &dword_0);
}

uint64_t sub_3E360(xmlTextReader *a1, void *a2)
{
  uint64_t v3 = sub_4340C(a1, qword_A35E8, (xmlChar *)"name");
  uint64_t v4 = [[GQDWPHeaderFooterStorage alloc] initWithName:v3];
  if (v3) {
    CFRelease(v3);
  }
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_3E3E0(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = objc_msgSend(objc_msgSend(a1, "documentState"), "popRetainedObject");
  uint64_t v6 = (__CFArray *)[v4 peekObject];
  if (v5)
  {
    if (v6) {
      CFArrayAppendValue(v6, v5);
    }
  }

  return 1;
}

uint64_t sub_3E458(uint64_t a1, void *a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", Mutable);
  CFRelease(Mutable);
  return 1;
}

uint64_t sub_3E4AC(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = [v4 popRetainedObject];
  objc_msgSend(objc_msgSend(a1, "generator"), "handleHeaders:state:", v5, v4);
  CFRelease(v5);
  return 1;
}

uint64_t sub_3E520(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = [v4 popRetainedObject];
  objc_msgSend(objc_msgSend(a1, "generator"), "handleFooters:state:", v5, v4);
  CFRelease(v5);
  return 1;
}

uint64_t sub_3E594(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = [v4 popRetainedObject];
  id v6 = [a1 generator];
  if (v6) {
    id v7 = objc_msgSend(objc_msgSend(v6, "enterBodyStorage:", v4), "handleBodyStorage:state:", v5, v4);
  }
  else {
    id v7 = &dword_0 + 1;
  }

  return (uint64_t)v7;
}

uint64_t sub_3E61C(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return 3;
  }
  id v5 = [v4 popRetainedObject];
  if ([a1 generator]
    && (id v6 = [v4 currentDrawablesGenerator]) != 0
    && (id v7 = v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = [v7 handleDrawable:v5 state:v4];
  }
  else
  {
    id v8 = &dword_0 + 1;
  }

  return (uint64_t)v8;
}

id sub_3E6CC(xmlTextReader *a1, void *a2)
{
  uint64_t v7 = 0;
  if (!sub_42E14(a1, qword_A3608, (xmlChar *)"page", &v7)) {
    return &dword_0 + 3;
  }
  id v3 = [a2 documentState];
  id v4 = [a2 generator];
  id result = [v4 setCurrentPageIndex:(v7 - 1) state:v3];
  if (v4)
  {
    id v6 = [v4 enterMainDrawablesForPage:v7 state:v3];
    objc_msgSend(objc_msgSend(a2, "documentState"), "setCurrentDrawablesGenerator:", v6);
    return [v6 beginDrawables:v3];
  }
  return result;
}

id sub_3E784(void *a1)
{
  id v2 = [a1 documentState];
  if ([a1 generator] && (id v3 = objc_msgSend(v2, "currentDrawablesGenerator")) != 0)
  {
    id v4 = [v3 endDrawables:v2];
    [v2 setCurrentDrawablesGenerator:0];
  }
  else
  {
    id v4 = &dword_0 + 1;
  }
  objc_msgSend(objc_msgSend(v2, "currentWrapPointGenerator"), "clearWrapPoints");
  return v4;
}

uint64_t sub_3E7F4(xmlTextReader *a1, void *a2)
{
  uint64_t v7 = -1;
  uint64_t v8 = -1;
  sub_42E14(a1, qword_A3608, (xmlChar *)"page-start", &v8);
  sub_42E14(a1, qword_A3608, (xmlChar *)"page-count", &v7);
  id v4 = objc_alloc_init(GQPSectionDrawable);
  int64_t v5 = v7;
  v4->mPageRange.location = v8;
  v4->mPageRange.length = v5;
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_3E894(void *a1, int a2)
{
  if ((int)objc_msgSend(objc_msgSend(a1, "documentState"), "objectStackDepth") <= a2) {
    return 3;
  }
  id v3 = [a1 generator];
  id v4 = objc_msgSend(objc_msgSend(a1, "documentState"), "popRetainedObject");
  int64_t v5 = v4;
  id v6 = &dword_0 + 1;
  if (v3 && v4 && v4[1] != -1 && v4[2] != -1 && v4[3]) {
    id v6 = objc_msgSend(v3, "handleSectionStyle:pageIndex:numPages:state:");
  }

  return (uint64_t)v6;
}

id sub_3E93C(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] <= a2) {
    return &dword_0 + 3;
  }
  id v5 = [v4 popRetainedObject];
  id v6 = [v4 peekObject];
  [v6 setStylesheet:v5];
  [v4 setStylesheet:v5];

  id v7 = [a1 generator];
  if (!v7) {
    return &dword_0 + 1;
  }
  return [v7 handleStylesheet:v6 state:v4];
}

uint64_t sub_3E9EC(xmlTextReader *a1, void *a2)
{
  id v4 = [a2 documentState];
  char v8 = 0;
  if (objc_msgSend(objc_msgSend(v4, "peekObject"), "readDocumentVersion:isTooNew:", a1, &v8))
  {
    id v5 = [a2 generator];
    if (v5)
    {
      id v6 = objc_msgSend(v5, "beginPublication:state:", objc_msgSend(v4, "root"), v4);
      [v4 setGeneratorBeginWasCalled];
    }
    else
    {
      return 1;
    }
  }
  else
  {
    [a2 setWrongFormat:1];
    return sub_3AD64(a1);
  }
  return (uint64_t)v6;
}

void sub_3ED38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_38F1C(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_3EE70()
{
  sub_3FFC4((uint64_t)&unk_A2E00, "text-storage", (uint64_t)&unk_A1D98, (uint64_t)sub_3E360, (uint64_t)sub_3E3E0, (uint64_t)&unk_A1730);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A2E00, &dword_0);
  sub_381D0(qword_A2E48, (uint64_t)&unk_A2E00, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2E48, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2E60, (const xmlChar *)"header", v0, v1, v2, v3, v4, v5, (uint64_t)qword_A2E48);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2E60, &dword_0);
  sub_3FBB0((uint64_t)&unk_A2E90, (const xmlChar *)"footer", v6, v7, v8, v9, v10, v11, (uint64_t)qword_A2E48);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A2E90, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2EC0, "headers", (uint64_t)sub_3E458, 0, (uint64_t)sub_3E4AC, (uint64_t)&unk_A2E60);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2EC0, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2F00, "footers", (uint64_t)sub_3E458, 0, (uint64_t)sub_3E520, (uint64_t)&unk_A2E90);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2F00, &dword_0);
  sub_381AC(qword_A2F40, (uint64_t)&unk_A2EC0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2F40, &dword_0);
  sub_381AC(qword_A2F58, (uint64_t)&unk_A2F00);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2F58, &dword_0);
  sub_381D0(qword_A2F70, (uint64_t)&unk_A1210, (uint64_t)sub_3E594);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2F70, &dword_0);
  sub_3CF28(qword_A2F88, (uint64_t)sub_3E61C);
  __cxa_atexit((void (*)(void *))j_nullsub_2_4, qword_A2F88, &dword_0);
  sub_3F8F8(qword_A2F98, 0, v12, v13, v14, v15, v16, v17, v70);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A2F98, &dword_0);
  sub_3FDC0((uint64_t)&unk_A2FB8, "drawables-group", (uint64_t)sub_3E6CC, (uint64_t)qword_A2F88, (uint64_t)sub_3E784, (uint64_t)qword_A2F98);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A2FB8, &dword_0);
  sub_381AC(qword_A2FF8, (uint64_t)&unk_A2FB8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A2FF8, &dword_0);
  uint64_t v18 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v18, "mStyle");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3836C((uint64_t)&unk_A3010, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A3010, &dword_0);
  sub_3FBB0((uint64_t)&unk_A3028, 0, v21, v22, v23, v24, v25, v26, v71);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A3028, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3058, "section style", 0, (uint64_t)&unk_A3010, 0, (uint64_t)&unk_A3028);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3058, &dword_0);
  sub_381D0(qword_A3098, (uint64_t)&unk_A3058, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3098, &dword_0);
  sub_3F8F8(qword_A30B0, (uint64_t)"style", v27, v28, v29, v30, v31, v32, (uint64_t)qword_A3098);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A30B0, &dword_0);
  sub_3FDC0((uint64_t)&unk_A30D0, "section drawables", (uint64_t)sub_3E7F4, 0, (uint64_t)sub_3E894, (uint64_t)qword_A30B0);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A30D0, &dword_0);
  sub_381AC(qword_A3110, (uint64_t)&unk_A30D0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3110, &dword_0);
  sub_3F8F8(qword_A3128, (uint64_t)"section-drawables", v33, v34, v35, v36, v37, v38, (uint64_t)qword_A3110);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A3128, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3148, "masters-group", 0, 0, 0, (uint64_t)qword_A3128);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3148, &dword_0);
  sub_381AC(qword_A3188, (uint64_t)&unk_A3148);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3188, &dword_0);
  sub_3F8F8(qword_A31A0, (uint64_t)"masters-group", v39, v40, v41, v42, v43, v44, (uint64_t)qword_A3188);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A31A0, &dword_0);
  sub_3FDC0((uint64_t)&unk_A31C0, "drawables", 0, 0, 0, (uint64_t)qword_A31A0);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A31C0, &dword_0);
  sub_381AC(qword_A3200, (uint64_t)&unk_A31C0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3200, &dword_0);
  sub_381AC(qword_A3218, (uint64_t)&unk_A0A48);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3218, &dword_0);
  sub_3F8F8(qword_A3230, (uint64_t)"tracked-formulas", v45, v46, v47, v48, v49, v50, (uint64_t)&qword_A20E8);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A3230, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3250, "calculationEngine", 0, 0, 0, (uint64_t)qword_A3230);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3250, &dword_0);
  sub_381AC(qword_A3290, (uint64_t)&unk_A3250);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3290, &dword_0);
  sub_381D0(qword_A32A8, (uint64_t)&unk_A2AE8, (uint64_t)sub_3E93C);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A32A8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A32C0, (const xmlChar *)"stylesheet", v51, v52, v53, v54, v55, v56, (uint64_t)qword_A32A8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A32C0, &dword_0);
  sub_3FDC0((uint64_t)&unk_A32F0, "section-proto", 0, 0, 0, (uint64_t)&unk_A32C0);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A32F0, &dword_0);
  sub_381D0(qword_A3330, (uint64_t)&unk_A32F0, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3330, &dword_0);
  sub_3FBB0((uint64_t)&unk_A3348, (const xmlChar *)"version-history", v57, v58, v59, v60, v61, v62, (uint64_t)&qword_A20E8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A3348, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3378, "publication", (uint64_t)sub_3E9EC, 0, 0, (uint64_t)&unk_A3348);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3378, &dword_0);
  sub_381D0(qword_A33B8, (uint64_t)&unk_A3378, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A33B8, &dword_0);
  sub_3FBB0((uint64_t)&unk_A33D0, (const xmlChar *)"document", v63, v64, v65, v66, v67, v68, (uint64_t)qword_A33B8);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A33D0, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3400, "initial", 0, 0, 0, (uint64_t)&unk_A33D0);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3400, &dword_0);
}

void sub_3F844(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      sub_A594();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)sub_40258(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    uint64_t v9 = &v6[16 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void *sub_3F8F8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *a1 = off_84F98;
  a1[1] = 0;
  uint64_t v11 = (char **)(a1 + 1);
  a1[2] = 0;
  a1[3] = 0;
  uint64_t v27 = &a9;
  sub_3F844((void **)a1 + 1, 3uLL);
  if (a2)
  {
    uint64_t v12 = a1 + 3;
    uint64_t v13 = (char *)a1[2];
    do
    {
      uint64_t v14 = v27;
      uint64_t v28 = v27 + 1;
      uint64_t v15 = *v14;
      if ((unint64_t)v13 >= *v12)
      {
        uint64_t v16 = (v13 - *v11) >> 4;
        if ((unint64_t)(v16 + 1) >> 60) {
          sub_A594();
        }
        uint64_t v17 = *v12 - (void)*v11;
        uint64_t v18 = v17 >> 3;
        if (v17 >> 3 <= (unint64_t)(v16 + 1)) {
          uint64_t v18 = v16 + 1;
        }
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v19 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v18;
        }
        if (v19) {
          uint64_t v20 = (char *)sub_40258((uint64_t)(a1 + 3), v19);
        }
        else {
          uint64_t v20 = 0;
        }
        uint64_t v21 = &v20[16 * v16];
        *(void *)uint64_t v21 = a2;
        *((void *)v21 + 1) = v15;
        uint64_t v23 = (char *)a1[1];
        uint64_t v22 = (char *)a1[2];
        uint64_t v24 = v21;
        if (v22 != v23)
        {
          do
          {
            *((_OWORD *)v24 - 1) = *((_OWORD *)v22 - 1);
            v24 -= 16;
            v22 -= 16;
          }
          while (v22 != v23);
          uint64_t v22 = *v11;
        }
        uint64_t v13 = v21 + 16;
        a1[1] = v24;
        a1[2] = v21 + 16;
        a1[3] = &v20[16 * v19];
        if (v22) {
          operator delete(v22);
        }
      }
      else
      {
        *(void *)uint64_t v13 = a2;
        *((void *)v13 + 1) = v15;
        v13 += 16;
      }
      a1[2] = v13;
      uint64_t v25 = v28;
      uint64_t v27 = v28 + 1;
      a2 = *v25;
    }
    while (*v25);
  }
  return a1;
}

void sub_3FA70(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 16) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *sub_3FA94(uint64_t a1, xmlChar *str2)
{
  uint64_t v2 = *(const xmlChar ***)(a1 + 8);
  uint64_t v3 = *(unsigned __int8 ***)(a1 + 16);
  if (v2 == (const xmlChar **)v3) {
    return 0;
  }
  while (**v2 != *str2 || !xmlStrEqual(*v2, str2))
  {
    v2 += 2;
    if (v2 == (const xmlChar **)v3) {
      return 0;
    }
  }
  if (v2 == (const xmlChar **)v3) {
    return 0;
  }
  else {
    return (unsigned __int8 *)v2[1];
  }
}

void *sub_3FB08(void *a1)
{
  *a1 = off_84FC0;
  sub_40290((uint64_t)(a1 + 1));
  return a1;
}

void sub_3FB4C(void *a1)
{
  *a1 = off_84FC0;
  sub_40290((uint64_t)(a1 + 1));
  operator delete();
}

uint64_t sub_3FBB0(uint64_t a1, const xmlChar *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v10 = a1 + 8;
  *(void *)a1 = off_84FC0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 1065353216;
  uint64_t v16 = (const xmlChar **)&a9;
  if (a2)
  {
    do
    {
      uint64_t v11 = v16++;
      uint64_t v12 = *v11;
      uint64_t v15 = a2;
      uint64_t v17 = &v15;
      *((void *)sub_402DC(v10, &v15, (uint64_t)&unk_5F2A0, &v17) + 3) = v12;
      uint64_t v13 = v16++;
      a2 = *v13;
    }
    while (*v13);
  }
  return a1;
}

void sub_3FC80(_Unwind_Exception *a1)
{
  sub_40290(v1);
  _Unwind_Resume(a1);
}

uint64_t **sub_3FC94(uint64_t a1, const xmlChar *a2)
{
  uint64_t v3 = a2;
  id result = sub_4076C((void *)(a1 + 8), &v3);
  if (result) {
    return (uint64_t **)result[3];
  }
  return result;
}

uint64_t sub_3FCC8(uint64_t a1)
{
  *(void *)a1 = off_84FE8;
  free(*(void **)(a1 + 8));
  return a1;
}

uint64_t sub_3FD10(uint64_t a1)
{
  *(void *)a1 = off_84FE8;
  free(*(void **)(a1 + 8));
  return a1;
}

void sub_3FD58(uint64_t a1)
{
  *(void *)a1 = off_84FE8;
  free(*(void **)(a1 + 8));
  operator delete();
}

uint64_t sub_3FDC0(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)a1 = off_84FE8;
  *(void *)(a1 + 8) = strdup(__s1);
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = a4;
  *(void *)(a1 + 32) = a3;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = a5;
  *(void *)(a1 + 56) = a6;
  return a1;
}

uint64_t sub_3FE3C(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)a1 = off_84FE8;
  *(void *)(a1 + 8) = strdup(__s1);
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = a4;
  *(void *)(a1 + 32) = a3;
  *(void *)(a1 + 40) = a5;
  *(void *)(a1 + 48) = a6;
  *(void *)(a1 + 56) = a7;
  return a1;
}

uint64_t sub_3FEBC(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_84FE8;
  *(void *)(a1 + 8) = strdup(*(const char **)(a2 + 8));
  *(_DWORD *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

void sub_3FF28()
{
}

uint64_t sub_3FF74(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 56) + 16))(*(void *)(a1 + 56));
  if (!result) {
    return *(void *)(a1 + 24);
  }
  return result;
}

uint64_t sub_3FFC4(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)a1 = off_84FE8;
  uint64_t v11 = strdup(__s1);
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = a4;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = a5;
  *(void *)(a1 + 56) = a6;
  *(void *)(a1 + 64) = a3;
  *(void *)a1 = off_85020;
  *(void *)(a1 + 8) = v11;
  return a1;
}

void sub_40058()
{
}

uint64_t sub_400BC(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 56) + 16))(*(void *)(a1 + 56));
  if (!result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(**(void **)(a1 + 64) + 24);
    return v3();
  }
  return result;
}

void sub_40150(void *a1)
{
  *a1 = off_84F98;
  uint64_t v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  operator delete();
}

uint64_t sub_401C0(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

void sub_401C8(uint64_t a1)
{
  *(void *)a1 = off_84FE8;
  free(*(void **)(a1 + 8));
  operator delete();
}

uint64_t sub_40230(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 64) + 32))();
}

void *sub_40258(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_A22C();
  }
  return operator new(16 * a2);
}

uint64_t sub_40290(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_402DC(uint64_t a1, const xmlChar **a2, uint64_t a3, void **a4)
{
  unsigned int v8 = sub_4289C(*a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = v8;
      if (v10 <= v8) {
        unint64_t v4 = v8 % v10;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v8;
    }
    uint64_t v13 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(void **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (xmlStrEqual(*((const xmlChar **)i + 2), *a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x20uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v9;
  *((void *)i + 2) = **a4;
  *((void *)i + 3) = 0;
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_40520(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v10 <= v9) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }
  uint64_t v22 = *(void *)a1;
  uint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)uint64_t i = *v23;
LABEL_38:
    *uint64_t v23 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v22 + 8 * v4) = a1 + 16;
  if (*(void *)i)
  {
    unint64_t v24 = *(void *)(*(void *)i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v24 >= v10) {
        v24 %= v10;
      }
    }
    else
    {
      v24 &= v10 - 1;
    }
    uint64_t v23 = (void *)(*(void *)a1 + 8 * v24);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_4050C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_40520(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_40610(a1, prime);
    }
  }
}

void sub_40610(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_A22C();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint8x8_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            *uint8x8_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint8x8_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint8x8_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t **sub_4076C(void *a1, const xmlChar **a2)
{
  unsigned int v4 = sub_4289C(*a2);
  unint64_t v5 = a1[1];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v5 <= v4) {
      unint64_t v9 = v4 % v5;
    }
  }
  else
  {
    unint64_t v9 = (v5 - 1) & v4;
  }
  unint64_t v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  for (uint64_t i = *v10; i; uint64_t i = (uint64_t **)*i)
  {
    unint64_t v12 = (unint64_t)i[1];
    if (v12 == v6)
    {
      if (xmlStrEqual((const xmlChar *)i[2], *a2)) {
        return i;
      }
    }
    else
    {
      if (v8 > 1)
      {
        if (v12 >= v5) {
          v12 %= v5;
        }
      }
      else
      {
        v12 &= v5 - 1;
      }
      if (v12 != v9) {
        return 0;
      }
    }
  }
  return i;
}

uint64_t sub_40868(xmlTextReader *a1, void *a2)
{
  if (objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject"), "beginProperty:", xmlTextReaderConstLocalName(a1)))
  {
    sub_3AC58(a1, (uint64_t)&unk_A34A0, 0, a2);
  }
  return sub_3AD64(a1);
}

uint64_t sub_40900(xmlTextReader *a1, void *a2)
{
  id v3 = objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
  switch(sub_42A00(a1))
  {
    case 'c':
      [v3 handleBoolValue:sub_42A58(a1)];
      break;
    case 'd':
      unsigned int v4 = sub_42BA4(a1);
      if (v4)
      {
        unint64_t v5 = v4;
        [(xmlChar *)v4 doubleValue];
        double v7 = v6;
      }
      else
      {
        double v7 = 0.0;
      }
      unint64_t v9 = v3;
      double v8 = v7;
      goto LABEL_10;
    case 'f':
      *(float *)&double v10 = sub_42B1C(a1);
      [v3 handleFloatValue:v10];
      break;
    case 'i':
      [v3 handleIntValue:sub_42AC0(a1)];
      break;
    default:
      sub_42B38(a1);
      unint64_t v9 = v3;
LABEL_10:
      [v9 handleDoubleValue:v8];
      break;
  }
  return 1;
}

uint64_t sub_40A10(void *a1)
{
  id v2 = objc_msgSend(objc_msgSend(a1, "documentState"), "peekObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = objc_msgSend(objc_msgSend(a1, "documentState"), "popRetainedObject");
    id v2 = objc_msgSend(objc_msgSend(a1, "documentState"), "peekObject");
    [v2 handleObject:v3];
    id v4 = v3;
  }
  [v2 doneProperty];
  return 1;
}

id sub_40A9C(xmlTextReader *a1, uint64_t a2)
{
  id v4 = [[GQPStyleReader alloc] initWithStyleType:+[GQDSStyle styleTypeForNodeName:xmlTextReaderConstLocalName(a1)]];
  id v5 = (id)[(GQPStyleReader *)v4 beginReadingFromReader:a1 processor:a2];

  return v5;
}

id sub_40B10(void *a1, int a2)
{
  id v4 = [a1 documentState];
  if ((int)[v4 objectStackDepth] < a2) {
    return &dword_0 + 3;
  }
  if ([v4 objectStackDepth] == a2) {
    return &dword_0 + 2;
  }
  id v6 = [v4 peekObject];
  return [v6 doneReading:a1];
}

uint64_t sub_4110C()
{
  sub_3823C(qword_A3440, (uint64_t)sub_40868, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A3440, &dword_0);
  sub_3823C(qword_A3458, (uint64_t)sub_40900, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A3458, &dword_0);
  sub_3FBB0((uint64_t)&unk_A3470, (const xmlChar *)"number", v0, v1, v2, v3, v4, v5, (uint64_t)qword_A3458);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A3470, &dword_0);
  sub_3FFC4((uint64_t)&unk_A34A0, "style-property", (uint64_t)&unk_A2CC8, 0, (uint64_t)sub_40A10, (uint64_t)&unk_A3470);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A34A0, &dword_0);
  sub_3FBB0((uint64_t)&unk_A34E8, 0, v6, v7, v8, v9, v10, v11, v19);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A34E8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3518, "style-property-map", 0, (uint64_t)qword_A3440, 0, (uint64_t)&unk_A34E8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3518, &dword_0);
  sub_381AC(qword_A3558, (uint64_t)&unk_A3518);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3558, &dword_0);
  sub_3FBB0((uint64_t)&unk_A3570, (const xmlChar *)"property-map", v12, v13, v14, v15, v16, v17, (uint64_t)qword_A3558);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A3570, &dword_0);
  sub_3FDC0((uint64_t)&unk_A35A0, "style", (uint64_t)sub_40A9C, 0, (uint64_t)sub_40B10, (uint64_t)&unk_A3570);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A35A0, &dword_0);
}

void sub_41974(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x4195CLL);
  }
  _Unwind_Resume(a1);
}

void sub_41C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_41DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

CFMutableStringRef sub_425E4(CFStringRef theString)
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  for (uint64_t i = 0; i != 4; ++i)
  {
    CFStringRef v3 = off_80900[i];
    CFStringRef v4 = off_80920[i];
    v6.length = CFStringGetLength(MutableCopy);
    v6.location = 0;
    CFStringFindAndReplace(MutableCopy, v3, v4, v6, 0);
  }
  return MutableCopy;
}

void sub_42674()
{
  if ((byte_A4338 & 1) == 0)
  {
    byte_A4338 = 1;
    xmlInitParser();
    qword_A35E0 = (uint64_t)xmlNewNs(0, (const xmlChar *)"http://developer.apple.com/namespaces/sfa", (const xmlChar *)"sfa");
    qword_A35E8 = (uint64_t)xmlNewNs(0, (const xmlChar *)"http://developer.apple.com/namespaces/sf", (const xmlChar *)"sf");
    qword_A35F0 = (uint64_t)xmlNewNs(0, (const xmlChar *)"http://www.w3.org/2001/XMLSchema-instance", (const xmlChar *)"xsi");
    qword_A35F8 = (uint64_t)xmlNewNs(0, (const xmlChar *)"http://developer.apple.com/namespaces/keynote2", (const xmlChar *)"key");
    qword_A3600 = (uint64_t)xmlNewNs(0, (const xmlChar *)"http://developer.apple.com/namespaces/ls", (const xmlChar *)"ls");
    qword_A3608 = (uint64_t)xmlNewNs(0, (const xmlChar *)"http://developer.apple.com/namespaces/sl", (const xmlChar *)"sl");
  }
}

const xmlChar *sub_42760(const xmlChar *result)
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = xmlStrlen(result);
    if (v2 < 5) {
      return 0;
    }
    else {
      return (const xmlChar *)(xmlStrcmp(&v1[v2 - 4], (const xmlChar *)"-ref") == 0);
    }
  }
  return result;
}

char *sub_427B8(xmlChar *str)
{
  if (str && (v2 = xmlStrlen(str), v2 >= 5) && (int v3 = v2, !xmlStrcmp(&str[v2 - 4], (const xmlChar *)"-ref")))
  {
    uint64_t v5 = (char *)xmlMalloc((v3 - 3));
    uint64_t result = strncpy(v5, (const char *)str, (v3 - 4));
    result[v3 - 4] = 0;
  }
  else
  {
    return (char *)xmlStrdup(str);
  }
  return result;
}

uint64_t sub_4285C(unsigned char *a1)
{
  int v1 = *a1;
  if (!*a1) {
    return 1;
  }
  int v2 = a1 + 1;
  do
  {
    BOOL v4 = v1 == 13 || (v1 - 9) < 2;
    uint64_t result = v1 == 32 || v4;
    if (!result) {
      break;
    }
    int v6 = *v2++;
    int v1 = v6;
  }
  while (v6);
  return result;
}

uint64_t sub_4289C(const xmlChar *a1)
{
  int v1 = a1;
  unsigned int v2 = xmlStrlen(a1);
  if (v2 >= 0x11)
  {
    uint64_t v6 = 0;
    int v4 = v2;
    do
      int v4 = 257 * v4 + v1[v6++];
    while (v6 != 8);
    uint64_t v7 = -8;
    do
      int v4 = 257 * v4 + v1[v2 + v7++];
    while (v7);
  }
  else if (v2)
  {
    unsigned int v3 = v2;
    int v4 = v2;
    do
    {
      int v5 = *v1++;
      int v4 = 257 * v4 + v5;
      --v3;
    }
    while (v3);
  }
  else
  {
    int v4 = 0;
  }
  return ((v4 << v2) + v4);
}

uint64_t sub_42938(uint64_t a1, const xmlChar *a2)
{
  return sub_4289C(a2);
}

BOOL sub_42958(int a1, xmlChar *str1, xmlChar *str2)
{
  return xmlStrEqual(str1, str2) != 0;
}

NSString *sub_42980(uint64_t a1, uint64_t a2)
{
  return +[NSString stringWithFormat:@"(xmlChar*)%s", a2];
}

uint64_t sub_429B4(const xmlChar *a1, const xmlChar *a2)
{
  return xmlStrEqual(a1, a2);
}

uint64_t sub_429D0(const xmlChar *a1)
{
  return sub_4289C(a1);
}

void sub_429EC(uint64_t a1, void *a2)
{
}

uint64_t sub_42A00(xmlTextReader *a1)
{
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)"type", *(const xmlChar **)(qword_A35E0 + 16));
  if (AttributeNs)
  {
    signed __int8 v2 = *AttributeNs;
    xmlFree(AttributeNs);
  }
  else
  {
    return 0;
  }
  return v2;
}

BOOL sub_42A58(xmlTextReader *a1)
{
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)"number", *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 0;
  }
  signed __int8 v2 = AttributeNs;
  BOOL v3 = atoi((const char *)AttributeNs) != 0;
  xmlFree(v2);
  return v3;
}

xmlChar *sub_42AC0(xmlTextReader *a1)
{
  uint64_t result = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)"number", *(const xmlChar **)(qword_A35E0 + 16));
  if (result)
  {
    signed __int8 v2 = result;
    uint64_t v3 = atoi((const char *)result);
    xmlFree(v2);
    return (xmlChar *)v3;
  }
  return result;
}

float sub_42B1C(xmlTextReader *a1)
{
  sub_42B38(a1);
  return v1;
}

void sub_42B38(xmlTextReader *a1)
{
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)"number", *(const xmlChar **)(qword_A35E0 + 16));
  if (AttributeNs)
  {
    signed __int8 v2 = AttributeNs;
    atof((const char *)AttributeNs);
    xmlFree(v2);
  }
}

xmlChar *sub_42BA4(xmlTextReader *a1)
{
  uint64_t result = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)"number", *(const xmlChar **)(qword_A35E0 + 16));
  if (result)
  {
    signed __int8 v2 = result;
    id v3 = [objc_alloc((Class)NSString) initWithUTF8String:result];
    id v4 = [objc_alloc((Class)NSDecimalNumber) initWithString:v3];

    xmlFree(v2);
    return (xmlChar *)v4;
  }
  return result;
}

uint64_t sub_42C34(xmlTextReader *a1, uint64_t a2, xmlChar *localName, unsigned char *a4)
{
  if (a2) {
    uint64_t v6 = *(const xmlChar **)(a2 + 16);
  }
  else {
    uint64_t v6 = 0;
  }
  AttributeNs = xmlTextReaderGetAttributeNs(a1, localName, v6);
  if (!AttributeNs) {
    return 0;
  }
  uint64_t v8 = AttributeNs;
  char v11 = 0;
  uint64_t v9 = sub_42CC4(AttributeNs, &v11);
  xmlFree(v8);
  if (v9) {
    *a4 = v11;
  }
  return v9;
}

uint64_t sub_42CC4(const xmlChar *a1, unsigned char *a2)
{
  if (!xmlStrcasecmp(a1, (const xmlChar *)"TRUE")) {
    goto LABEL_4;
  }
  if (!xmlStrcasecmp(a1, (const xmlChar *)"FALSE")) {
    goto LABEL_6;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"1"))
  {
LABEL_4:
    LOBYTE(v4) = 1;
LABEL_7:
    *a2 = v4;
    return 1;
  }
  if (xmlStrEqual(a1, (const xmlChar *)"0")) {
    goto LABEL_6;
  }
  if (!xmlStrcasecmp(a1, (const xmlChar *)"y")) {
    goto LABEL_4;
  }
  if (!xmlStrcasecmp(a1, (const xmlChar *)"n")) {
    goto LABEL_6;
  }
  if (!xmlStrcasecmp(a1, (const xmlChar *)"t")) {
    goto LABEL_4;
  }
  if (!xmlStrcasecmp(a1, (const xmlChar *)"f"))
  {
LABEL_6:
    LOBYTE(v4) = 0;
    goto LABEL_7;
  }
  if (!xmlStrcasecmp(a1, (const xmlChar *)"yes")) {
    goto LABEL_4;
  }
  int v4 = xmlStrcasecmp(a1, (const xmlChar *)"no");
  uint64_t result = 0;
  if (!v4) {
    goto LABEL_7;
  }
  return result;
}

uint64_t sub_42DCC(xmlTextReader *a1, uint64_t a2, xmlChar *a3, unsigned int a4)
{
  char v6 = 0;
  if (sub_42C34(a1, a2, a3, &v6)) {
    return v6 != 0;
  }
  else {
    return a4;
  }
}

uint64_t sub_42E14(xmlTextReader *a1, uint64_t a2, xmlChar *localName, void *a4)
{
  if (a2) {
    char v6 = *(const xmlChar **)(a2 + 16);
  }
  else {
    char v6 = 0;
  }
  AttributeNs = xmlTextReaderGetAttributeNs(a1, localName, v6);
  if (!AttributeNs) {
    return 0;
  }
  uint64_t v8 = AttributeNs;
  uint64_t v11 = 0;
  uint64_t v9 = sub_42EA4((const char *)AttributeNs, &v11);
  xmlFree(v8);
  if (v9) {
    *a4 = v11;
  }
  return v9;
}

uint64_t sub_42EA4(const char *a1, uint64_t *a2)
{
  __endptr = 0;
  uint64_t v4 = strtol(a1, &__endptr, 10);
  if (*__endptr || !*a1) {
    return 0;
  }
  *a2 = v4;
  return 1;
}

uint64_t sub_42F04(xmlTextReader *a1, uint64_t a2, xmlChar *a3, uint64_t a4)
{
  uint64_t v6 = 0;
  if (sub_42E14(a1, a2, a3, &v6)) {
    return v6;
  }
  else {
    return a4;
  }
}

uint64_t sub_42F44(xmlTextReader *a1, uint64_t a2, xmlChar *localName, void *a4)
{
  if (a2) {
    uint64_t v6 = *(const xmlChar **)(a2 + 16);
  }
  else {
    uint64_t v6 = 0;
  }
  AttributeNs = xmlTextReaderGetAttributeNs(a1, localName, v6);
  if (!AttributeNs) {
    return 0;
  }
  uint64_t v8 = AttributeNs;
  unint64_t v11 = 0;
  uint64_t v9 = sub_42FD4((const char *)AttributeNs, &v11);
  xmlFree(v8);
  if (v9) {
    *a4 = v11;
  }
  return v9;
}

uint64_t sub_42FD4(const char *a1, unint64_t *a2)
{
  __endptr = 0;
  unint64_t v4 = strtoul(a1, &__endptr, 10);
  if (*__endptr || !*a1) {
    return 0;
  }
  *a2 = v4;
  return 1;
}

uint64_t sub_43034(xmlTextReader *a1, uint64_t a2, xmlChar *a3, uint64_t a4)
{
  uint64_t v6 = 0;
  if (sub_42F44(a1, a2, a3, &v6)) {
    return v6;
  }
  else {
    return a4;
  }
}

uint64_t sub_43074(xmlTextReader *a1, uint64_t a2, xmlChar *localName, void *a4)
{
  if (a2) {
    uint64_t v6 = *(const xmlChar **)(a2 + 16);
  }
  else {
    uint64_t v6 = 0;
  }
  AttributeNs = xmlTextReaderGetAttributeNs(a1, localName, v6);
  if (!AttributeNs) {
    return 0;
  }
  uint64_t v8 = AttributeNs;
  unint64_t v11 = 0;
  uint64_t v9 = sub_43104((const char *)AttributeNs, &v11);
  xmlFree(v8);
  if (v9) {
    *a4 = v11;
  }
  return v9;
}

uint64_t sub_43104(const char *a1, unint64_t *a2)
{
  __endptr = 0;
  unint64_t v4 = strtoull(a1, &__endptr, 10);
  if (*__endptr || !*a1) {
    return 0;
  }
  *a2 = v4;
  return 1;
}

BOOL sub_43164(xmlTextReader *a1, uint64_t a2, xmlChar *localName, void *a4)
{
  if (a2) {
    uint64_t v6 = *(const xmlChar **)(a2 + 16);
  }
  else {
    uint64_t v6 = 0;
  }
  AttributeNs = xmlTextReaderGetAttributeNs(a1, localName, v6);
  if (!AttributeNs) {
    return 0;
  }
  uint64_t v8 = AttributeNs;
  uint64_t v11 = 0;
  BOOL v9 = sub_431F4((uint64_t)AttributeNs, (double *)&v11);
  xmlFree(v8);
  if (v9) {
    *a4 = v11;
  }
  return v9;
}

BOOL sub_431F4(uint64_t a1, double *a2)
{
  id v3 = (const xmlChar *)(a1 - 1);
  do
  {
    uint64_t v4 = v3[1];
    if ((char)v3[1] < 0) {
      __uint32_t v5 = __maskrune(v4, 0x4000uLL);
    }
    else {
      __uint32_t v5 = _DefaultRuneLocale.__runetype[v4] & 0x4000;
    }
    ++v3;
  }
  while (v5);
  int v6 = *v3;
  BOOL v7 = v6 == 43;
  if (v6 == 43) {
    uint64_t v8 = v3 + 1;
  }
  else {
    uint64_t v8 = v3;
  }
  int v9 = xmlStrlen(v8);
  if (v9 >= 3)
  {
    unsigned int v10 = v9;
    if (xmlStrncasecmp(v8, (const xmlChar *)"NAN", 3))
    {
      if (xmlStrncasecmp(v8, (const xmlChar *)"INF", 3))
      {
        if (v10 < 4 || xmlStrncasecmp(v8, (const xmlChar *)"-INF", 4)) {
          goto LABEL_14;
        }
        BOOL result = 1;
        unint64_t v13 = 0xFFF0000000000000;
      }
      else
      {
        BOOL result = 1;
        unint64_t v13 = 0x7FF0000000000000;
      }
    }
    else
    {
      BOOL result = 1;
      unint64_t v13 = 0x7FF8000000000000;
    }
    double v11 = *(double *)&v13;
    if (!a2) {
      return result;
    }
    goto LABEL_23;
  }
LABEL_14:
  uint64_t v14 = 0;
  double v11 = strtod((const char *)v8, &v14);
  if (*v14)
  {
    BOOL result = 0;
    if (!a2) {
      return result;
    }
  }
  else
  {
    BOOL result = v3[v7] != 0;
    if (!a2) {
      return result;
    }
  }
LABEL_23:
  if (result) {
    *a2 = v11;
  }
  return result;
}

float sub_43348(xmlTextReader *a1, uint64_t a2, xmlChar *a3, float *a4)
{
  double v6 = 0.0;
  if (sub_43164(a1, a2, a3, &v6))
  {
    float result = v6;
    *a4 = result;
  }
  return result;
}

double sub_4338C(xmlTextReader *a1, uint64_t a2, xmlChar *a3, double *a4)
{
  double v6 = 0.0;
  if (sub_43164(a1, a2, a3, &v6))
  {
    double result = v6;
    *a4 = v6;
  }
  return result;
}

BOOL sub_433CC(xmlTextReader *a1, uint64_t a2, xmlChar *a3)
{
  uint64_t v4 = 0;
  return sub_43164(a1, a2, a3, &v4);
}

xmlChar *sub_4340C(xmlTextReader *a1, uint64_t a2, xmlChar *localName)
{
  if (a2) {
    uint64_t v4 = *(const xmlChar **)(a2 + 16);
  }
  else {
    uint64_t v4 = 0;
  }
  double result = xmlTextReaderGetAttributeNs(a1, localName, v4);
  if (result)
  {
    double v6 = result;
    int v7 = xmlStrlen(result);
    CFStringRef v8 = CFStringCreateWithBytes(0, v6, v7, 0x8000100u, 0);
    xmlFree(v6);
    return (xmlChar *)v8;
  }
  return result;
}

BOOL sub_43488(xmlTextReader *a1, void *a2)
{
  uint64_t v7 = 0;
  BOOL result = sub_43164(a1, qword_A35E0, (xmlChar *)"w", &v7);
  if (result)
  {
    uint64_t v6 = 0;
    BOOL result = sub_43164(a1, qword_A35E0, (xmlChar *)"h", &v6);
    if (result)
    {
      uint64_t v5 = v6;
      *a2 = v7;
      a2[1] = v5;
      return 1;
    }
  }
  return result;
}

BOOL sub_43508(xmlTextReader *a1, void *a2)
{
  uint64_t v7 = 0;
  BOOL result = sub_43164(a1, qword_A35E0, (xmlChar *)"x", &v7);
  if (result)
  {
    uint64_t v6 = 0;
    BOOL result = sub_43164(a1, qword_A35E0, (xmlChar *)"y", &v6);
    if (result)
    {
      uint64_t v5 = v6;
      *a2 = v7;
      a2[1] = v5;
      return 1;
    }
  }
  return result;
}

CGPath *sub_43588(const char *a1)
{
  CFMutableArrayRef Mutable = CGPathCreateMutable();
  int v9 = 0;
  if (a1)
  {
    if (*a1)
    {
      char v8 = 0;
      if (sscanf(a1, " %c%n", &v8, &v9) >= 1)
      {
        do
        {
          id v3 = &a1[v9];
          int v9 = 0;
          if (v8 > 98)
          {
            if (v8 > 108)
            {
              if (v8 == 122) {
                goto LABEL_23;
              }
              if (v8 == 109)
              {
LABEL_19:
                uint64_t v7 = 0;
                if (sscanf(v3, " %g %g%n", (char *)&v7 + 4, &v7, &v9) == 2) {
                  CGPathMoveToPoint(Mutable, 0, *((float *)&v7 + 1), *(float *)&v7);
                }
              }
            }
            else
            {
              if (v8 == 99)
              {
LABEL_21:
                uint64_t v5 = 0;
                uint64_t v6 = 0;
                uint64_t v7 = 0;
                if (sscanf(v3, " %g %g %g %g %g %g%n", (char *)&v7 + 4, &v7, (char *)&v6 + 4, &v6, (char *)&v5 + 4, &v5, &v9) == 6)CGPathAddCurveToPoint(Mutable, 0, *((float *)&v7 + 1), *(float *)&v7, *((float *)&v6 + 1), *(float *)&v6, *((float *)&v5 + 1), *(float *)&v5); {
                goto LABEL_24;
                }
              }
              if (v8 == 108)
              {
LABEL_12:
                uint64_t v7 = 0;
                if (sscanf(v3, " %g %g%n", (char *)&v7 + 4, &v7, &v9) == 2) {
                  CGPathAddLineToPoint(Mutable, 0, *((float *)&v7 + 1), *(float *)&v7);
                }
              }
            }
          }
          else if (v8 > 76)
          {
            if (v8 == 77) {
              goto LABEL_19;
            }
            if (v8 == 90) {
LABEL_23:
            }
              CGPathCloseSubpath(Mutable);
          }
          else
          {
            if (v8 == 67) {
              goto LABEL_21;
            }
            if (v8 == 76) {
              goto LABEL_12;
            }
          }
LABEL_24:
          a1 = &v3[v9];
        }
        while (sscanf(a1, " %c%n", &v8, &v9) > 0);
      }
    }
  }
  return Mutable;
}

char *sub_437B4(const CGPath *a1)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CGPathApply(a1, Mutable, (CGPathApplierFunction)sub_43864);
  CFIndex Length = CFStringGetLength(Mutable);
  CFIndex v4 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  uint64_t v5 = (char *)xmlMalloc(v4);
  CFStringGetCString(Mutable, v5, v4, 0x8000100u);
  CFRelease(Mutable);
  return v5;
}

void sub_43864(__CFString *a1, uint64_t a2)
{
  if (a1)
  {
    if (CFStringGetLength(a1) >= 1) {
      CFStringAppend(a1, @" ");
    }
    CFIndex v4 = *(void **)(a2 + 8);
    switch(*(_DWORD *)a2)
    {
      case 0:
        CFStringAppendFormat(a1, 0, @"M %.*g %.*g", 17, *v4, 17, v4[1]);
        break;
      case 1:
        CFStringAppendFormat(a1, 0, @"L %.*g %.*g", 17, *v4, 17, v4[1]);
        break;
      case 3:
        CFStringAppendFormat(a1, 0, @"C %.*g %.*g %.*g %.*g %.*g %.*g", 17, *v4, 17, v4[1], 17, v4[2], 17, v4[3], 17, v4[4], 17, v4[5]);
        break;
      case 4:
        CFStringAppend(a1, @"Z");
        break;
      default:
        return;
    }
  }
}

int *sub_439BC(char *a1, size_t __n, float a3)
{
  if (fabsf(a3) != INFINITY) {
    return (int *)snprintf(a1, __n, "%.*g", 8, a3);
  }
  if (a3 >= 0.0)
  {
    strncpy(a1, "INF", __n);
    return &dword_0 + 3;
  }
  else
  {
    strncpy(a1, "-INF", __n);
    return &dword_4;
  }
}

uint64_t sub_43A60(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, "%ld", a1);
}

uint64_t sub_43A9C(xmlTextReader *a1, uint64_t a2, xmlChar *localName, uint64_t a4, _DWORD *a5)
{
  if (a2) {
    char v8 = *(const xmlChar **)(a2 + 16);
  }
  else {
    char v8 = 0;
  }
  AttributeNs = xmlTextReaderGetAttributeNs(a1, localName, v8);
  if (!AttributeNs) {
    return 0;
  }
  unsigned int v10 = AttributeNs;
  double v11 = *(const xmlChar **)(a4 + 8);
  if (v11)
  {
    while (!xmlStrEqual(v11, v10))
    {
      double v11 = *(const xmlChar **)(a4 + 24);
      a4 += 16;
      if (!v11) {
        goto LABEL_8;
      }
    }
    *a5 = *(_DWORD *)a4;
    uint64_t v12 = 1;
  }
  else
  {
LABEL_8:
    uint64_t v12 = 0;
  }
  xmlFree(v10);
  return v12;
}

unint64_t sub_43B40(unint64_t a1)
{
  if (a1 >= 0xDF8475800) {
    unint64_t v1 = a1;
  }
  else {
    unint64_t v1 = a1 + 60000000000;
  }
  if (a1 + 50000000000 >= 0xC1BAF9FD5) {
    return v1;
  }
  else {
    return a1 + 50000000000;
  }
}

void sub_43EF8(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_44D90(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_45140()
{
}

void sub_451B8()
{
}

id sub_45220(void *a1, uint64_t a2, int a3)
{
  return [a1 readToBuffer:a2 size:a3];
}

uint64_t sub_45294(void *a1)
{
  return 0;
}

void sub_45638(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

FILE *sub_45A08(uint64_t a1, const char *a2)
{
  id v3 = fopen([+[NSFileManager defaultManager] fileSystemRepresentationWithPath:a1], a2);
  if (!v3)
  {
    CFIndex v4 = __error();
    +[GQZException raise:@"GQZOpenError", @"Could not open %@: %s", a1, strerror(*v4) format];
  }
  return v3;
}

__CFDictionary *CopyHTMLForIWorkFileAtURL(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_45ACC(0, a1, a2, a3, 0, 0);
}

__CFDictionary *CopyHTMLForIWorkFileAtURLWithPassword(void *a1, uint64_t a2, uint64_t a3, __CFString *a4, CFErrorRef *a5)
{
  return sub_45ACC(0, a1, a2, a3, a4, a5);
}

__CFDictionary *sub_45ACC(void *a1, void *a2, uint64_t a3, uint64_t a4, __CFString *a5, CFErrorRef *a6)
{
  objc_sync_enter(@"iWorkQuickLookSyncObject");
  if (!a2)
  {
    if (!a1)
    {
      id v22 = 0;
      id v23 = 0;
      goto LABEL_76;
    }
    id v10 = [objc_alloc((Class)SFUZipArchive) initWithData:a1 collapseCommonRootDirectory:1 ignoreCase:1];
    CFStringRef PathComponent = 0;
    id v22 = 0;
    id v23 = 0;
    if (!v10) {
      goto LABEL_76;
    }
LABEL_20:
    id v24 = [v10 entryWithName:@"QuickLook/Preview.pdf"];
    if (v24)
    {
      BOOL v18 = sub_464E8((const __CFData *)[v24 data], a3, (uint64_t)PathComponent);
      if (v18)
      {
LABEL_70:
        id v23 = 0;
        goto LABEL_71;
      }
    }
    if ([v10 isEncrypted]) {
      goto LABEL_29;
    }
    uint64_t v25 = (__CFString *)kSFAPassphraseVerifierFilename;
    if (![v10 entryWithName:kSFAPassphraseVerifierFilename])
    {
      uint64_t v25 = off_9D2C0;
      if (![v10 entryWithName:off_9D2C0])
      {
        id v28 = 0;
        goto LABEL_31;
      }
    }
    if (!v25) {
LABEL_29:
    }
      id v26 = [v10 passphraseVerifier];
    else {
      id v26 = objc_msgSend(objc_alloc((Class)NSData), "initWithData:", objc_msgSend(objc_msgSend(v10, "entryWithName:", v25), "data"));
    }
    uint64_t v27 = v26;
    char v48 = 0;
    id v28 = sub_56B90(a5, 0, (uint64_t)v26, &v48);

    if (!v48)
    {
      if (a6) {
        *a6 = CFErrorCreate(0, @"com.apple.iWork.iWorkImportErrorDomain", 1, 0);
      }
      values = 0;
      values = sub_55EC4(a4, 1);
      BOOL v18 = CFDictionaryCreate(0, (const void **)&off_9CBA8, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      goto LABEL_37;
    }
LABEL_31:
    if (sub_55E54(v10))
    {
      id v29 = [objc_alloc((Class)TSUTemporaryDirectory) initWithError:0];
      if (PathComponent) {
        uint64_t v30 = +[NSString stringWithFormat:@"%@", PathComponent];
      }
      else {
        uint64_t v30 = (NSString *)[@"file" stringByAppendingPathExtension:sub_55E7C(a4)];
      }
      id v39 = objc_msgSend(objc_msgSend(v29, "path"), "stringByAppendingPathComponent:", v30);
      values = 0;
      [a1 writeToFile:v39 options:1 error:&values];
      BOOL v18 = sub_46780((uint64_t)v39, (uint64_t)PathComponent, a3, a5);
    }
    else
    {
      if (!sub_55D10(v10))
      {
        unsigned int v36 = [v10 isEncrypted];
        if (v28) {
          unsigned int v37 = v36;
        }
        else {
          unsigned int v37 = 0;
        }
        if (v37 == 1)
        {
          [v10 setCryptoKey:v28];
          id v38 = +[GQPProcessorFactory retainedProcessorForDocument:a2 zipArchive:v10 uti:a4 outputType:3 outputPath:0 previewRequest:0 progressiveHelper:0];
        }
        else
        {
          id v38 = +[GQPProcessorFactory retainedProcessorForDocument:a2 zipArchive:v10 uti:a4 outputType:3 outputPath:0 previewRequest:0 progressiveHelper:0 cryptoKey:v28];
        }
        id v23 = v38;
        id v40 = objc_msgSend(objc_msgSend(v38, "documentState"), "outputBundle");
        [v40 setUriPrefix:a3];
        [v23 go];
        if ([v23 isWrongFormat])
        {
          if (a6) {
            *a6 = CFErrorCreate(0, @"com.apple.iWork.iWorkImportErrorDomain", 2, 0);
          }
          values = 0;
          values = sub_55EC4(a4, 2);
          CFDictionaryRef v41 = CFDictionaryCreate(0, (const void **)&off_9CBA8, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        }
        else
        {
          CFDictionaryRef v41 = (CFDictionaryRef)[v40 createOutputDictionary];
        }
        BOOL v18 = v41;
        goto LABEL_71;
      }
      id v32 = [objc_alloc((Class)TSUTemporaryDirectory) initWithError:0];
      if (PathComponent) {
        uint64_t v33 = +[NSString stringWithFormat:@"%@", PathComponent];
      }
      else {
        uint64_t v33 = (NSString *)[@"file" stringByAppendingPathExtension:sub_55E7C(a4)];
      }
      id v42 = objc_msgSend(objc_msgSend(v32, "path"), "stringByAppendingPathComponent:", v33);
      if (objc_msgSend(objc_msgSend(objc_msgSend(v42, "pathExtension"), "lowercaseString"), "isEqualToString:", @"zip"))id v42 = objc_msgSend(v42, "stringByDeletingPathExtension"); {
      [v10 decompressAtPath:v42];
      }
      BOOL v18 = sub_46780((uint64_t)v42, (uint64_t)PathComponent, a3, a5);
    }
    goto LABEL_70;
  }
  id v10 = [a2 path];
  CFStringRef PathComponent = CFURLCopyLastPathComponent((CFURLRef)a2);
  LOBYTE(values) = 0;
  unsigned __int8 v12 = [+[NSFileManager defaultManager] fileExistsAtPath:v10 isDirectory:&values];
  if ((_BYTE)values) {
    unsigned __int8 v13 = v12;
  }
  else {
    unsigned __int8 v13 = 0;
  }
  if ((v13 & 1) == 0)
  {
    id v10 = objc_msgSend(objc_alloc((Class)SFUZipArchive), "initWithPath:collapseCommonRootDirectory:ignoreCase:", objc_msgSend(a2, "path"), 1, 1);
    if (!v10) {
      goto LABEL_27;
    }
    goto LABEL_20;
  }
  if (v10)
  {
    uint64_t v14 = +[NSFileManager defaultManager];
    id v15 = objc_msgSend(objc_msgSend(v10, "stringByAppendingPathComponent:", @"QuickLook"), "stringByAppendingPathComponent:", @"Preview.pdf");
    if (![(NSFileManager *)v14 fileExistsAtPath:v15]
      || (CFDataRef v16 = (const __CFData *)[objc_alloc((Class)NSData) initWithContentsOfFile:v15],
          (CFDataRef v17 = v16) == 0)
      || (BOOL v18 = sub_464E8(v16, a3, (uint64_t)PathComponent), v17, !v18))
    {
      id v19 = [v10 stringByAppendingPathComponent:kSFAPassphraseVerifierFilename];
      if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v19)|| (id v19 = [v10 stringByAppendingPathComponent:off_9D2C0], -[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v19)))
      {
        id v20 = [objc_alloc((Class)NSData) initWithContentsOfFile:v19];
        char v48 = 0;
        id v21 = sub_56B90(a5, 0, (uint64_t)v20, &v48);

        if (!v48)
        {
          if (a6) {
            *a6 = CFErrorCreate(0, @"com.apple.iWork.iWorkImportErrorDomain", 1, 0);
          }
          values = 0;
          values = sub_55EC4(a4, 1);
          BOOL v18 = CFDictionaryCreate(0, (const void **)&off_9CBA8, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          id v10 = 0;
LABEL_37:
          id v23 = 0;
          int v31 = 1;
          goto LABEL_72;
        }
      }
      else
      {
        id v21 = 0;
      }
      if (!sub_55CB4(v10))
      {
        id v23 = +[GQPProcessorFactory retainedProcessorForDocument:a2 zipArchive:0 uti:a4 outputType:3 outputPath:0 previewRequest:0 progressiveHelper:0 cryptoKey:v21];
        id v34 = objc_msgSend(objc_msgSend(v23, "documentState"), "outputBundle");
        [v34 setUriPrefix:a3];
        [v23 go];
        if ([v23 isWrongFormat])
        {
          if (a6) {
            *a6 = CFErrorCreate(0, @"com.apple.iWork.iWorkImportErrorDomain", 2, 0);
          }
          values = 0;
          values = sub_55EC4(a4, 2);
          CFDictionaryRef v35 = CFDictionaryCreate(0, (const void **)&off_9CBA8, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        }
        else
        {
          CFDictionaryRef v35 = (CFDictionaryRef)[v34 createOutputDictionary];
        }
        BOOL v18 = v35;
        id v10 = 0;
        goto LABEL_71;
      }
      BOOL v18 = sub_46780((uint64_t)v10, (uint64_t)PathComponent, a3, a5);
    }
    id v10 = 0;
    goto LABEL_70;
  }
LABEL_27:
  id v23 = 0;
  BOOL v18 = 0;
LABEL_71:
  int v31 = 0;
LABEL_72:
  if (PathComponent) {
    CFRelease(PathComponent);
  }
  if ((v31 | 2) == 2)
  {
    id v22 = v10;
    if (v18)
    {
LABEL_77:

      goto LABEL_78;
    }
LABEL_76:
    values = sub_55EC4(a4, 0);
    BOOL v18 = CFDictionaryCreate(0, (const void **)&off_9CBA8, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v10 = v22;
    goto LABEL_77;
  }
LABEL_78:
  objc_sync_exit(@"iWorkQuickLookSyncObject");
  return v18;
}

void sub_46344(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, CFErrorRef *a12)
{
  if (a2 == 2)
  {
    objc_begin_catch(exc_buf);
    if (a12)
    {
      if (!*a12) {
        *a12 = CFErrorCreate(0, @"com.apple.iWork.iWorkImportErrorDomain", 0, 0);
      }
    }
    objc_end_catch();
  }
  else
  {
    objc_begin_catch(exc_buf);
  }
  JUMPOUT(0x4629CLL);
}

__CFDictionary *CopyHTMLForIWorkDataWithUTI(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_45ACC(a1, 0, a2, a3, 0, 0);
}

__CFDictionary *CopyHTMLForIWorkDataWithUTIAndPassword(void *a1, uint64_t a2, uint64_t a3, __CFString *a4, CFErrorRef *a5)
{
  return sub_45ACC(a1, 0, a2, a3, a4, a5);
}

__CFDictionary *sub_464E8(const __CFData *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = CGDataProviderCreateWithCFData(a1);
  uint64_t v7 = CGPDFDocumentCreateWithProvider(v6);
  CFRelease(v6);
  size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(v7);
  if (!NumberOfPages)
  {
    uint64_t v25 = 0;
    if (!v7) {
      return v25;
    }
    goto LABEL_11;
  }
  size_t v9 = NumberOfPages;
  uint64_t v10 = 0;
  float v11 = 0.0;
  double v12 = 0.0;
  double v13 = 8.0;
  do
  {
    Page = CGPDFDocumentGetPage(v7, ++v10);
    CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    if (v12 < BoxRect.size.width + 15.0) {
      double v12 = BoxRect.size.width + 15.0;
    }
    float v15 = BoxRect.size.height + 8.0;
    double v13 = v13 + v15;
    if (v11 < v15) {
      float v11 = BoxRect.size.height + 8.0;
    }
  }
  while (v9 != v10);
  CFDataRef v16 = objc_alloc_init(GQUIglooOutputBundle);
  [(GQUIglooOutputBundle *)v16 setUriPrefix:a2];
  id v17 = [[GQHXML alloc] initEmptyWithFilename:@"index.html" useExternalCss:1];
  [v17 startElement:"head"];
  LODWORD(v18) = 10.0;
  objc_msgSend(v17, "addViewportMetaTagForDocumentSize:maximumScale:", v12, v11, v18);
  if (a3)
  {
    [v17 startElement:"title"];
    [v17 addContent:a3];
    [v17 endElement];
  }
  [v17 endElement];
  [v17 startElement:"body"];
  [v17 setAttribute:"style" value:"margin: 0px; padding: 0px;"];
  [v17 startElement:"iframe"];
  float v19 = v12;
  LODWORD(v20) = vcvtps_s32_f32(v19);
  float v21 = v13;
  LODWORD(v22) = vcvtps_s32_f32(v21);
  CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"border: 0px solid black; width: %dpx; height: %dpx;", v20, v22);
  [v17 setAttribute:"style" cfStringValue:v23];
  CFRelease(v23);
  [(GQUIglooOutputBundle *)v16 setData:a1 mimeType:@"application/pdf" forNamedResource:@"preview.pdf"];
  id v24 = [(GQUIglooOutputBundle *)v16 createUriForResource:@"preview.pdf"];
  [v17 setAttribute:"src" cfStringValue:v24];
  CFRelease(v24);
  [v17 endElement];
  [v17 endElement];
  [v17 writeToOutputBundle:v16 isThumbnail:0];

  uint64_t v25 = [(GQUIglooOutputBundle *)v16 createOutputDictionary];
  if (v7) {
LABEL_11:
  }
    CGPDFDocumentRelease(v7);
  return v25;
}

__CFDictionary *sub_46780(uint64_t a1, uint64_t a2, uint64_t a3, __CFString *a4)
{
  if (a4) {
    uint64_t v6 = a4;
  }
  else {
    uint64_t v6 = &stru_85630;
  }
  id v7 = [objc_alloc((Class)TQQuicklook) initWithPath:a1 passphrase:v6];
  if ([v7 load])
  {
    CFDataRef v8 = (const __CFData *)[v7 newPDFPreviewAndClose];
    CFDataRef v9 = v8;
    if (v8) {
      uint64_t v10 = sub_464E8(v8, a3, a2);
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v7 close];

  return v10;
}

void sub_468C4(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

id sub_46E3C(void *a1)
{
  return sub_46E44(a1, 0);
}

id sub_46E44(void *a1, int a2)
{
  id v4 = [a1 model];
  id v5 = [a1 legend];
  id v6 = [a1 style];
  if (v4)
  {
    id v7 = v6;
    if (a2) {
      CFDataRef v8 = v5;
    }
    else {
      CFDataRef v8 = a1;
    }
    objc_msgSend(objc_msgSend(v8, "geometry"), "size");
    double v10 = v9;
    double v12 = v11;
    unsigned int v13 = [a1 type];
    if (v13 <= 0x18uLL)
    {
      int v14 = v13;
      float v15 = v12;
      uint64_t v16 = llroundf(v15);
      float v17 = v10;
      uint64_t v18 = llroundf(v17);
      CFStringRef v19 = (const __CFString *)qword_A3610[v13];
      char v25 = 0;
      if ([v7 hasValueForBoolProperty:187 value:&v25] && v25) {
        CFStringRef v19 = sub_470DC(v19);
      }
      double v20 = (double)v16;
      CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      sub_471C8(Mutable);
      sub_4728C(Mutable, v7, a2);
      if ((a2 & 1) == 0 && [v4 title])
      {
        id v22 = [v4 title];
        sub_473BC(Mutable, v22, kOIChartTitleKey, v7, 148, 149);
      }
      sub_47480(Mutable, v7, a2, (double)v18, v20);
      if (v14 == 14) {
        int v14 = 13;
      }
      float v23 = (v20 + (double)v18) / 6.0;
      sub_475D8(Mutable, v19, v4, v14, v7, a2, v23);
      if ((a2 & 1) == 0) {
        sub_47E00(Mutable, v14, v7, v4);
      }
      sub_48410(Mutable, v14);
      id v4 = (id)sub_4849C();
      CFRelease(Mutable);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

id sub_47040(void *a1)
{
  return sub_46E44(a1, 1);
}

id sub_47048(uint64_t a1, void *a2, uint64_t a3)
{
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"%s.%@", a3, @"pdf");
  unsigned int v6 = [a2 setData:a1 mimeType:@"application/pdf" forNamedResource:v5];
  id v7 = 0;
  if (v6) {
    id v7 = [a2 createUriForResource:v5];
  }
  CFRelease(v5);
  return v7;
}

CFStringRef sub_470DC(const __CFString *a1)
{
  if (CFStringCompare(a1, kOIChartStackedColumnType, 1uLL) == kCFCompareEqualTo)
  {
    id v3 = &kOIChartPercentStackedColumnType;
    return *(const __CFString **)v3;
  }
  if (CFStringCompare(a1, kOIChartStackedBarType, 1uLL) == kCFCompareEqualTo)
  {
    id v3 = &kOIChartPercentStackedBarType;
    return *(const __CFString **)v3;
  }
  if (CFStringCompare(a1, kOIChartStackedLineType, 1uLL) == kCFCompareEqualTo)
  {
    id v3 = &kOIChartPercentStackedLineType;
    return *(const __CFString **)v3;
  }
  if (CFStringCompare(a1, kOIChart3DStackedColumnType, 1uLL) == kCFCompareEqualTo)
  {
    id v3 = &kOIChart3DPercentStackedColumnType;
    return *(const __CFString **)v3;
  }
  if (CFStringCompare(a1, kOIChart3DStackedBarType, 1uLL)) {
    return a1;
  }
  else {
    return (const __CFString *)kOIChart3DPercentStackedBarType;
  }
}

void sub_471C8(__CFDictionary *a1)
{
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CGColorRef v3 = sub_48514(1.0, 1.0, 1.0, 0.0);
  CFDictionarySetValue(Mutable, kOIChartFillColorKey, v3);
  CFDictionarySetValue(Mutable, kOIChartStrokeColorKey, v3);
  CGColorRelease(v3);
  CFDictionarySetValue(a1, kOIChartCanvasKey, Mutable);
  CFRelease(Mutable);
}

void sub_4728C(__CFDictionary *a1, void *a2, int a3)
{
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v7 = Mutable;
  if (a3)
  {
    sub_487B4(Mutable, kOIChartHidePlotAreaKey, 1);
  }
  else
  {
    unsigned int v10 = 151;
    CGColorRef v8 = sub_48514(1.0, 1.0, 1.0, 0.0);
    CFDictionarySetValue(v7, kOIChartFillColorKey, v8);
    CFDictionarySetValue(v7, kOIChartStrokeColorKey, v8);
    CGColorRelease(v8);
    sub_4858C(v7, a2, 150, &v10);
    char v9 = 0;
    [a2 hasValueForBoolProperty:152 value:&v9];
    if (v9) {
      sub_486FC(v7, a2, 156);
    }
  }
  CFDictionarySetValue(a1, kOIChartPlotKey, v7);
  CFRelease(v7);
}

void sub_473BC(__CFDictionary *a1, const void *a2, const void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  char v13 = 0;
  [a4 hasValueForBoolProperty:a5 value:&v13];
  if (v13)
  {
    CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      double v12 = Mutable;
      CFDictionarySetValue(Mutable, kOIChartLabelKey, a2);
      sub_4881C(v12, a4, a6);
      CFDictionarySetValue(a1, a3, v12);
      CFRelease(v12);
    }
  }
}

void sub_47480(__CFDictionary *a1, void *a2, int a3, double a4, double a5)
{
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  double v11 = Mutable;
  if (a3)
  {
    CGColorRef v12 = sub_48514(1.0, 1.0, 1.0, 0.0);
    CFDictionarySetValue(v11, kOIChartFillColorKey, v12);
    CFDictionarySetValue(v11, kOIChartStrokeColorKey, v12);
    CGColorRelease(v12);
    if (a4 >= a5 + a5) {
      int v13 = 2;
    }
    else {
      int v13 = 3;
    }
    sub_487B4(v11, kOIChartLegendPlacementKey, v13);
    sub_4858C(v11, a2, 144, 0);
    sub_486FC(v11, a2, 145);
    sub_4881C(v11, a2, 147);
  }
  else
  {
    sub_487B4(Mutable, kOIChartHideLegendKey, 1);
  }
  CFDictionarySetValue(a1, kOIChartLegendKey, v11);
  CFRelease(v11);
}

void sub_475D8(__CFDictionary *a1, const void *a2, void *a3, unsigned int a4, void *a5, char a6, float a7)
{
  unsigned int v12 = [a3 direction];
  CFArrayRef v13 = (const __CFArray *)[a3 chartData];
  CFArrayRef v14 = (const __CFArray *)[a3 rowNames];
  v82 = a3;
  CFArrayRef v15 = (const __CFArray *)[a3 columnNames];
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFDictionarySetValue(a1, kOIChartSeriesKey, Mutable);
  unsigned int v16 = a4 - 23;
  if (v12 == 1) {
    CFArrayRef v17 = v15;
  }
  else {
    CFArrayRef v17 = v14;
  }
  CFArrayRef v67 = v17;
  int Count = CFArrayGetCount(v17);
  CFArrayRef v18 = v13;
  int v19 = CFArrayGetCount(v13);
  int v20 = v19;
  CFArrayRef v21 = 0;
  unsigned int v22 = a4 == 21;
  if (a4 == 21) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 1;
  }
  if (a4 != 21 && (a6 & 1) == 0)
  {
    if (a4 <= 0xF && ((1 << a4) & 0xE800) != 0)
    {
      unsigned int v22 = v19 - 1;
      if (v19 >= 1)
      {
        CFArrayRef v21 = 0;
        int v76 = 0;
        int v20 = -1;
        uint64_t v23 = -1;
LABEL_44:
        uint64_t v35 = 0;
        CFArrayRef theArraya = v21;
        BOOL v37 = v16 < 2 && v21 != 0;
        BOOL v75 = v37;
        v74 = (const void *)kOIChartSeriesValuesKey;
        uint64_t v66 = (const void *)kOIChartSeriesBaseValuesKey;
        key = (void *)kOIChartLabelKey;
        v77 = (void *)kOIChartSeriesTypeKey;
        uint64_t v61 = (const void *)kOIChartStrokeWidthKey;
        uint64_t v70 = (void *)kOIChartStrokeColorKey;
        uint64_t v73 = v22;
        uint64_t v63 = (void *)kOIChartFillColorKey;
        uint64_t v71 = v23 + v22;
        uint64_t v72 = v20;
        uint64_t v64 = (const void *)kOIChartSeriesOffsetKey;
        uint64_t v62 = (const void *)kOIChartSeriesOnSecondaryAxisKey;
        uint64_t v38 = v23;
        while (1)
        {
          if (v75) {
            int v39 = objc_msgSend((id)CFArrayGetValueAtIndex(theArraya, v73 + v35), "intValue");
          }
          else {
            int v39 = v73 + v35;
          }
          CFMutableDictionaryRef v40 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFArrayAppendValue(Mutable, v40);
          sub_489CC(v40, v74, v18, v39);
          int v41 = v39;
          if (a4 == 21)
          {
            sub_489CC(v40, v66, v18, v39 - 1);
            if ((int)v35 >= 0) {
              int v42 = v35;
            }
            else {
              int v42 = v35 + 1;
            }
            int v41 = v42 >> 1;
          }
          if (v41 < Count)
          {
            ValueAtIndefloat64x2_t x = CFArrayGetValueAtIndex(v67, v41);
            CFDictionarySetValue(v40, key, ValueAtIndex);
          }
          v87[0] = 0;
          unsigned int v44 = objc_msgSend(a5, "hasValueForObjectProperty:value:", (v39 + 0x10000), v87, v61);
          if (v16 <= 1) {
            break;
          }
          CFDictionarySetValue(v40, v77, a2);
          int v86 = 0;
          if (a4 != 21 || [v87[0] hasValueForIntProperty:232 value:&v86] && v86 >= 1)
          {
            uint64_t v50 = 0;
            if (v44)
            {
LABEL_79:
              uint64_t v52 = (char *)&unk_9D5F0 + 4 * v50;
              if (v16 >= 2) {
                uint64_t v52 = (char *)&unk_9D58C + 4 * a4;
              }
              if (sub_486FC(v40, v87[0], *(unsigned int *)v52))
              {
                if (a4 == 13 || v50 == 1) {
                  goto LABEL_93;
                }
                goto LABEL_89;
              }
            }
LABEL_85:
            CGColorRef v53 = sub_48AC8(v39);
            CFDictionarySetValue(v40, v70, v53);
            CGColorRelease(v53);
            goto LABEL_86;
          }
          sub_487B4(v40, v61, 0);
          uint64_t v50 = 0;
LABEL_86:
          if (a4 == 13 || v50 == 1) {
            goto LABEL_93;
          }
          if (!v44) {
            goto LABEL_92;
          }
LABEL_89:
          uint64_t v54 = (char *)&unk_9D57C + 4 * v50;
          if (v16 >= 2) {
            uint64_t v54 = (char *)&unk_9D518 + 4 * a4;
          }
          if ((sub_4858C(v40, v87[0], *(unsigned int *)v54, 0) & 1) == 0)
          {
LABEL_92:
            CGColorRef v55 = sub_48AC8(v39);
            CFDictionarySetValue(v40, v63, v55);
            CGColorRelease(v55);
          }
LABEL_93:
          if (v16 > 1)
          {
            if (a4 - 11 < 2)
            {
              uint64_t v56 = 230;
              goto LABEL_105;
            }
            if (a4 == 13)
            {
              uint64_t v56 = 229;
              goto LABEL_105;
            }
            if (a4 == 21)
            {
              uint64_t v56 = 231;
              goto LABEL_105;
            }
            int v85 = 0;
          }
          else
          {
            if (v50 == 3)
            {
              uint64_t v56 = 296;
LABEL_105:
              int v85 = 0;
              goto LABEL_106;
            }
            int v85 = 0;
            if (v50 == 1)
            {
              uint64_t v56 = 295;
LABEL_106:
              if ([v87[0] hasValueForIntProperty:v56 value:&v85] && v85)
              {
                uint64_t v57 = (char *)&unk_9D664 + 4 * v50;
                if (v16 >= 2) {
                  uint64_t v57 = (char *)&unk_9D600 + 4 * a4;
                }
                if (v16 > 1)
                {
                  if (a4 - 11 < 2)
                  {
                    uint64_t v59 = 250;
                  }
                  else if (a4 == 13)
                  {
                    uint64_t v59 = 251;
                  }
                  else if (a4 == 21)
                  {
                    uint64_t v59 = 252;
                  }
                  else
                  {
                    uint64_t v59 = 0;
                  }
                }
                else
                {
                  if (v50 == 1) {
                    unsigned int v58 = 297;
                  }
                  else {
                    unsigned int v58 = 0;
                  }
                  if (v50 == 3) {
                    uint64_t v59 = 298;
                  }
                  else {
                    uint64_t v59 = v58;
                  }
                }
                sub_48B10(v40, v87[0], *(unsigned int *)v57, v59);
              }
            }
          }
          float v84 = 0.0;
          if ([v87[0] hasValueForFloatProperty:316 value:&v84]) {
            sub_48964(v40, v64, v84 * a7);
          }
          if (a4 == 24)
          {
            int v83 = 0;
            if ([v82 hasIntValueForProperty:@"SFC2DPlotSeriesOnYAxisProperty" forSeriesAtIndex:v39 value:&v83])
            {
              if (v83 == 2) {
                sub_487B4(v40, v62, 1);
              }
            }
          }
          CFRelease(v40);
          BOOL v60 = v71 + v35 < v72;
          if (!v76) {
            BOOL v60 = v71 + v35 > v72;
          }
          v35 += v38;
          if (!v60)
          {
            CFArrayRef v21 = theArraya;
            goto LABEL_136;
          }
        }
        int v86 = 0;
        unsigned int v45 = [v82 hasIntValueForProperty:@"SFC2DMixedChartSeriesTypeProperty" forSeriesAtIndex:v39 value:&v86];
        int v46 = v86;
        if (!v45) {
          int v46 = 2 * (v39 != 0);
        }
        uint64_t v47 = 1;
        if (v46 == 2) {
          uint64_t v47 = 2;
        }
        uint64_t v48 = 13;
        if (v46 == 2) {
          uint64_t v48 = 2;
        }
        BOOL v49 = v46 == 1;
        if (v46 == 1) {
          uint64_t v50 = 3;
        }
        else {
          uint64_t v50 = v47;
        }
        uint64_t v51 = 11;
        if (!v49) {
          uint64_t v51 = v48;
        }
        a2 = (const void *)qword_A3610[v51];
        CFDictionarySetValue(v40, v77, a2);
        int v86 = 0;
        if (v44) {
          goto LABEL_79;
        }
        goto LABEL_85;
      }
      goto LABEL_138;
    }
    if (v16 > 1)
    {
      CFArrayRef v21 = 0;
    }
    else
    {
      theArray = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      memset(v87, 0, sizeof(v87));
      if (v20 >= 1)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          int v86 = 0;
          unsigned int v25 = [v82 hasIntValueForProperty:@"SFC2DMixedChartSeriesTypeProperty" forSeriesAtIndex:i value:&v86];
          int v26 = 2 * (i != 0);
          if (v25) {
            int v26 = v86;
          }
          if (v26 == 1) {
            uint64_t v27 = 0;
          }
          else {
            uint64_t v27 = 2;
          }
          BOOL v28 = v26 == 1;
          if (v26 == 2)
          {
            uint64_t v27 = 1;
            BOOL v28 = 0;
          }
          if (v26) {
            uint64_t v29 = v27;
          }
          else {
            uint64_t v29 = 2;
          }
          if (v26) {
            int v30 = v28;
          }
          else {
            int v30 = 1;
          }
          CFMutableArrayRef v31 = (CFMutableArrayRef)v87[v29];
          if (!v31)
          {
            CFMutableArrayRef v31 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
            v87[v29] = v31;
          }
          id v32 = [objc_alloc((Class)NSNumber) initWithInt:i];
          if (v30) {
            CFArrayInsertValueAtIndex(v31, 0, v32);
          }
          else {
            CFArrayAppendValue(v31, v32);
          }
        }
      }
      uint64_t v33 = 0;
      CFArrayRef v21 = theArray;
      do
      {
        CFArrayRef v34 = (const __CFArray *)v87[v33];
        if (v34)
        {
          v88.length = CFArrayGetCount((CFArrayRef)v87[v33]);
          v88.location = 0;
          CFArrayAppendArray(theArray, v34, v88);
          CFRelease(v34);
        }
        ++v33;
      }
      while (v33 != 3);
    }
    unsigned int v22 = 0;
    uint64_t v23 = 1;
  }
  if ((int)v22 < v20)
  {
    int v76 = 1;
    goto LABEL_44;
  }
LABEL_136:
  if (v21) {
    CFRelease(v21);
  }
LABEL_138:
  CFRelease(Mutable);
}

void sub_47E00(__CFDictionary *a1, unsigned int a2, void *a3, void *a4)
{
  if ([a4 direction] == (char *)&dword_0 + 1) {
    id v8 = [a4 rowNames];
  }
  else {
    id v8 = [a4 columnNames];
  }
  char v9 = v8;
  id v10 = [a4 valueTitle];
  id v11 = [a4 catagoryTitle];
  int v12 = dword_9D674[a2];
  if (v12)
  {
    CFArrayRef v13 = v11;
    unsigned int v36 = v10;
    CFMutableDictionaryRef v39 = a1;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableDictionaryRef v14 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFArrayRef v15 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    unsigned int v16 = 0;
    if (a2 == 24)
    {
      unsigned int v16 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      sub_487B4(v16, kOIChartStrokeWidthKey, 0);
    }
    if (v12 == 1) {
      CFArrayRef v17 = v14;
    }
    else {
      CFArrayRef v17 = v15;
    }
    CFMutableDictionaryRef v40 = v17;
    CFMutableDictionaryRef v37 = v14;
    if (v12 == 1) {
      CFArrayRef v18 = v15;
    }
    else {
      CFArrayRef v18 = v14;
    }
    int v19 = (const void *)kOIChartAxisTitleKey;
    sub_473BC(v18, v13, kOIChartAxisTitleKey, a3, 170, 173);
    if (v12 == 3)
    {
      sub_4889C(v18, 263, a3);
      char v47 = 0;
    }
    else
    {
      char v47 = 0;
      if ([a3 hasValueForBoolProperty:180 value:&v47] && v47 && v9)
      {
        int v20 = sub_488F4((const __CFArray *)[a4 chartData]);
        if (v20 < 1 || (CFIndex v21 = v20, CFArrayGetCount((CFArrayRef)v9) <= v20))
        {
          CFDictionarySetValue(v18, kOIChartAxisLabelsKey, v9);
        }
        else
        {
          v35[1] = v35;
          off_84B60();
          uint64_t v23 = (const void **)((char *)v35 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
          if (v22 >= 0x200) {
            size_t v24 = 512;
          }
          else {
            size_t v24 = v22;
          }
          bzero((char *)v35 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v24);
          v48.location = 0;
          v48.length = v21;
          CFArrayGetValues((CFArrayRef)v9, v48, v23);
          CFArrayRef v25 = CFArrayCreate(0, v23, v21, &kCFTypeArrayCallBacks);
          CFDictionarySetValue(v18, kOIChartAxisLabelsKey, v25);
          CFRelease(v25);
        }
        sub_487B4(v18, kOIChartAxisCenterLabelsKey, 1);
      }
    }
    char v46 = 0;
    if ([a3 hasValueForBoolProperty:175 value:&v46] && v46) {
      sub_486FC(v18, a3, 176);
    }
    sub_4881C(v18, a3, 167);
    int v26 = v40;
    sub_473BC(v40, v36, v19, a3, 168, 171);
    char v45 = 0;
    if ([a3 hasValueForBoolProperty:187 value:&v45] && v45)
    {
      LODWORD(v27) = 3.0;
      CFDictionarySetValue(v26, kOIChartAxisValueTypeKey, +[NSNumber numberWithFloat:v27]);
    }
    else
    {
      sub_4889C(v26, 255, a3);
    }
    char v44 = 0;
    if ([a3 hasValueForBoolProperty:185 value:&v44] && v44) {
      sub_487B4(v26, kOIChartAxisHasLogarithmicScaleKey, 1);
    }
    if ([a3 hasValueForBoolProperty:186 value:&v44] && v44) {
      sub_487B4(v18, kOIChartAxisHasLogarithmicScaleKey, 1);
    }
    sub_4881C(v15, a3, 311);
    if (a2 == 24)
    {
      sub_473BC(v16, [a4 value2Title], v19, a3, 169, 172);
      sub_4889C(v16, 259, a3);
      if ([a3 hasValueForBoolProperty:211 value:&v44] && v44) {
        sub_487B4(v16, kOIChartAxisHasLogarithmicScaleKey, 1);
      }
      sub_4881C(v16, a3, 307);
    }
    __int16 v43 = 0;
    unsigned int v28 = [a3 hasValueForBoolProperty:182 value:(char *)&v43 + 1];
    CFMutableDictionaryRef v29 = v37;
    if (v28)
    {
      if (HIBYTE(v43))
      {
        float v42 = 0.0;
        if ([a3 hasValueForFloatProperty:183 value:&v42 wasOverriddenWithNull:&v43])
        {
          if (!(_BYTE)v43) {
            sub_48964(v40, kOIChartAxisMinKey, v42);
          }
        }
      }
    }
    int v30 = (const void *)kOIChartAxisXKey;
    CFMutableArrayRef v31 = (const void *)kOIChartAxisYKey;
    float v42 = 0.0;
    unsigned int v32 = [a3 hasValueForFloatProperty:184 value:&v42 wasOverriddenWithNull:&v43];
    uint64_t v33 = v40;
    if (v32 && !(_BYTE)v43) {
      sub_48964(v40, kOIChartAxisMaxKey, v42);
    }
    char v41 = 0;
    if ([a3 hasValueForBoolProperty:174 value:&v41] && v41) {
      sub_486FC(v33, a3, 177);
    }
    CFArrayRef v34 = Mutable;
    CFDictionarySetValue(Mutable, v30, v29);
    CFDictionarySetValue(v34, v31, v15);
    if (a2 == 24)
    {
      if (v16)
      {
        CFDictionarySetValue(v34, kOIChartAxisSecondaryYKey, v16);
        CFRelease(v16);
      }
    }
    CFDictionarySetValue(v39, kOIChartAxisKey, v34);
    CFRelease(v29);
    CFRelease(v15);
    CFRelease(v34);
  }
}

void sub_48410(__CFDictionary *a1, int a2)
{
  if (a2 == 6)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    sub_487B4(Mutable, kOIChart3DElevationKey, 70);
    CFDictionarySetValue(a1, kOIChart3DSettingsKey, Mutable);
    CFRelease(Mutable);
  }
}

uint64_t sub_4849C()
{
  return OIChartingCreatePDFDataWithFormatterCallback();
}

CGColorRef sub_48514(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGColorRef v5 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);
  return v5;
}

id sub_4858C(__CFDictionary *a1, void *a2, uint64_t a3, unsigned int *a4)
{
  int v16 = 1065353216;
  if (a4 && (uint64_t v8 = *a4, v8)) {
    unsigned int v9 = [a2 hasValueForFloatProperty:v8 value:&v16];
  }
  else {
    unsigned int v9 = 0;
  }
  id v15 = 0;
  if (!a3) {
    return 0;
  }
  id result = [a2 hasValueForObjectProperty:a3 value:&v15];
  if (!result) {
    return result;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  ValueAtIndefloat64x2_t x = v15;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        ValueAtIndefloat64x2_t x = [v15 color];
        if (ValueAtIndex) {
          goto LABEL_9;
        }
        [v15 imageBinary];
      }
      return 0;
    }
    ValueAtIndefloat64x2_t x = (id)CFArrayGetValueAtIndex((CFArrayRef)[v15 stops], 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  if (!ValueAtIndex) {
    return 0;
  }
LABEL_9:
  CFArrayRef v13 = &v16;
  if (!v9) {
    CFArrayRef v13 = 0;
  }
  if (a4) {
    CFMutableDictionaryRef v14 = (float *)v13;
  }
  else {
    CFMutableDictionaryRef v14 = 0;
  }
  sub_48C00(a1, kOIChartFillColorKey, ValueAtIndex, v14);
  return &dword_0 + 1;
}

id sub_486FC(__CFDictionary *a1, void *a2, uint64_t a3)
{
  id v9 = 0;
  if (!a3) {
    return 0;
  }
  id result = [a2 hasValueForObjectProperty:a3 value:&v9];
  if (result)
  {
    id v5 = [v9 pattern];
    if (!v5 || [v5 type] != 2)
    {
      [v9 width];
      float v7 = v6;
      id v8 = [v9 color];
      sub_487B4(a1, kOIChartStrokeWidthKey, llroundf(v7));
      sub_48C00(a1, kOIChartStrokeColorKey, v8, 0);
    }
    return &dword_0 + 1;
  }
  return result;
}

void sub_487B4(__CFDictionary *a1, const void *a2, int a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberNSIntegerType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

id sub_4881C(__CFDictionary *a1, void *a2, uint64_t a3)
{
  id v6 = 0;
  if (!a3) {
    return 0;
  }
  id result = [a2 hasValueForObjectProperty:a3 value:&v6];
  if (result)
  {
    CFNumberRef v5 = 0;
    if ([v6 hasValueForObjectProperty:3 value:&v5]) {
      sub_48C00(a1, kOIChartTextColorKey, v5, 0);
    }
    return &dword_0 + 1;
  }
  return result;
}

void sub_4889C(__CFDictionary *a1, uint64_t a2, void *a3)
{
  value = 0;
  if ([a3 hasValueForObjectProperty:a2 value:&value]) {
    CFDictionarySetValue(a1, kOIChartAxisCustomFormatterKey, value);
  }
}

uint64_t sub_488F4(const __CFArray *a1)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0;
  }
  CFIndex v3 = Count;
  LODWORD(v4) = 0;
  for (CFIndex i = 0; i != v3; ++i)
  {
    ValueAtIndefloat64x2_t x = (const __CFArray *)CFArrayGetValueAtIndex(a1, i);
    CFIndex v7 = CFArrayGetCount(ValueAtIndex);
    if (v7 <= (int)v4) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = v7;
    }
  }
  return v4;
}

void sub_48964(__CFDictionary *a1, const void *a2, float a3)
{
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void sub_489CC(__CFDictionary *a1, const void *a2, const __CFArray *a3, int a4)
{
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  ValueAtIndefloat64x2_t x = (const __CFArray *)CFArrayGetValueAtIndex(a3, a4);
  int Count = CFArrayGetCount(ValueAtIndex);
  if (Count >= 1)
  {
    CFIndex v11 = 0;
    uint64_t v12 = Count;
    do
    {
      CFArrayRef v13 = (const __CFArray *)CFArrayGetValueAtIndex(a3, a4);
      CFMutableDictionaryRef v14 = CFArrayGetValueAtIndex(v13, v11);
      if (v14)
      {
        id v15 = v14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          CFArrayAppendValue(Mutable, v15);
        }
      }
      ++v11;
    }
    while (v12 != v11);
  }
  CFDictionarySetValue(a1, a2, Mutable);
  CFRelease(Mutable);
}

CGColorRef sub_48AC8(int a1)
{
  return sub_48514(flt_9D4B8[4 * (a1 % 6)], flt_9D4B8[4 * (a1 % 6) + 1], flt_9D4B8[4 * (a1 % 6) + 2], flt_9D4B8[4 * (a1 % 6) + 3]);
}

uint64_t sub_48B10(__CFDictionary *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v13 = 0;
  if (!a3 || ![a2 hasValueForObjectProperty:a3 value:&v13]) {
    return 0;
  }
  id v7 = [v13 color];
  int v8 = 14;
  if (a4)
  {
    int v12 = 0;
    unsigned __int8 v9 = [a2 hasValueForIntProperty:a4 value:&v12];
    if ((v9 & (v12 > 0)) != 0) {
      int v8 = v12;
    }
    else {
      int v8 = 14;
    }
  }
  uint64_t v10 = 1;
  sub_487B4(a1, kOIChartSeriesMarkerTypeKey, 1);
  sub_487B4(a1, kOIChartSeriesMarkerWidthKey, v8);
  sub_48C00(a1, kOIChartSeriesMarkerColorKey, v7, 0);
  return v10;
}

void sub_48C00(__CFDictionary *a1, const void *a2, void *a3, float *a4)
{
  [a3 alphaComponent];
  float v9 = v8;
  if (a4) {
    float v9 = *a4 * v9;
  }
  [a3 redComponent];
  CGFloat v11 = v10;
  [a3 greenComponent];
  CGFloat v13 = v12;
  [a3 blueComponent];
  CGColorRef v15 = sub_48514(v11, v13, v14, v9);
  CFDictionarySetValue(a1, a2, v15);
  CGColorRelease(v15);
}

void sub_48CB8()
{
  qword_A3610 = (uint64_t)&stru_85630;
  *(void *)algn_A3618 = kOIChartPieType;
  qword_A3620 = kOIChartColumnType;
  unk_A3628 = kOIChartStackedColumnType;
  qword_A3630 = kOIChartBarType;
  unk_A3638 = kOIChartStackedBarType;
  qword_A3640 = kOIChart3DPieType;
  unk_A3648 = kOIChart3DColumnType;
  qword_A3650 = kOIChart3DStackedColumnType;
  unk_A3658 = kOIChart3DBarType;
  qword_A3660 = kOIChart3DStackedBarType;
  unk_A3668 = kOIChartLineType;
  qword_A3670 = kOIChartStackedLineType;
  unk_A3678 = kOIChartLineType;
  qword_A3680 = kOIChartLineType;
  unk_A3688 = kOIChartLineType;
  qword_A3690 = kOIChartStackedLineType;
  unk_A3698 = kOIChart3DBarType;
  qword_A36A0 = kOIChart3DStackedBarType;
  unk_A36A8 = kOIChart3DBarType;
  qword_A36B0 = kOIChart3DStackedBarType;
  unk_A36B8 = kOIChartXYType;
  qword_A36C0 = kOIChartStockType;
  unk_A36C8 = kOIChartLineType;
  qword_A36D0 = kOIChartLineType;
}

uint64_t sub_48E14(xmlTextReader *a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDWPSectionTemplatePage);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  mHeaderIdentifier = v4->mHeaderIdentifier;
  if (mHeaderIdentifier) {
    CFRelease(mHeaderIdentifier);
  }
  v4->mHeaderIdentifier = 0;
  mFooterIdentifier = v4->mFooterIdentifier;
  if (mFooterIdentifier) {
    CFRelease(mFooterIdentifier);
  }
  v4->mFooterIdentifier = 0;
  v4->mHeaderIdentifier = (__CFString *)sub_4340C(a1, qword_A3608, (xmlChar *)"header");
  v4->mFooterIdentifier = (__CFString *)sub_4340C(a1, qword_A3608, (xmlChar *)"footer");

  return 1;
}

uint64_t sub_48ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A36D8, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A36D8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3708, "pageMaster", (uint64_t)sub_48E14, 0, 0, (uint64_t)&unk_A36D8);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3708, &dword_0);
}

id sub_48F84(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDWPContainerHint);
  id v5 = (id)[(GQDWPContainerHint *)v4 readAttributesFromReader:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return v5;
}

uint64_t sub_4923C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A3748, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A3748, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3778, "container hint", (uint64_t)sub_48F84, 0, 0, (uint64_t)&unk_A3748);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3778, &dword_0);
  sub_381D0(qword_A37B8, (uint64_t)&unk_A3778, (uint64_t)sub_3CC80);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A37B8, &dword_0);
}

uint64_t sub_4983C(xmlTextReader *a1, void *a2)
{
  if (sub_43508(a1, objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject") + 3)) {
    return 1;
  }
  else {
    return 3;
  }
}

uint64_t sub_49888(xmlTextReader *a1, void *a2)
{
  if (sub_43488(a1, objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject") + 5)) {
    return 1;
  }
  else {
    return 3;
  }
}

id sub_498D4(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDPointPath);
  id v5 = (id)[(GQDPointPath *)v4 readAttributesFromReader:a1 processor:a2];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  }

  return v5;
}

uint64_t sub_49E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A4340, 0, a3, a4, a5, a6, a7, a8, v15);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A4340, &dword_0);
  sub_3FDC0((uint64_t)&unk_A4370, "point", (uint64_t)sub_4983C, 0, 0, (uint64_t)&unk_A4340);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A4370, &dword_0);
  sub_381AC(qword_A43B0, (uint64_t)&unk_A4370);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A43B0, &dword_0);
  sub_3FDC0((uint64_t)&unk_A43C8, "size", (uint64_t)sub_49888, 0, 0, (uint64_t)&unk_A4340);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A43C8, &dword_0);
  sub_381AC(qword_A4408, (uint64_t)&unk_A43C8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A4408, &dword_0);
  sub_3FBB0((uint64_t)&unk_A4420, (const xmlChar *)"size", v8, v9, v10, v11, v12, v13, (uint64_t)qword_A4408);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A4420, &dword_0);
  sub_3FDC0((uint64_t)&unk_A37D0, "point-path", (uint64_t)sub_498D4, 0, 0, (uint64_t)&unk_A4420);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A37D0, &dword_0);
}

uint64_t sub_4BBA0(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (*(unsigned char *)result)
    {
      uint64_t v2 = *(_OWORD **)(a2 + 8);
      switch(*(_DWORD *)a2)
      {
        case 0:
          if (*(_DWORD *)(result + 72)) {
            goto LABEL_5;
          }
          *(_OWORD *)(result + 8) = *v2;
          *(_OWORD *)(result + 56) = *v2;
          break;
        case 1:
          if (*(_DWORD *)(result + 72) == 1) {
            *(_OWORD *)(result + 24) = *v2;
          }
          else {
            *(_OWORD *)(result + 56) = *(_OWORD *)(result + 40);
          }
          long long v3 = *v2;
          goto LABEL_16;
        case 2:
          if (*(_DWORD *)(result + 72) == 1) {
            *(_OWORD *)(result + 24) = *v2;
          }
          *(_OWORD *)(result + 56) = *v2;
          long long v3 = v2[1];
          goto LABEL_16;
        case 3:
          if (*(_DWORD *)(result + 72) == 1) {
            *(_OWORD *)(result + 24) = *v2;
          }
          *(_OWORD *)(result + 56) = v2[1];
          long long v3 = v2[2];
LABEL_16:
          *(_OWORD *)(result + 40) = v3;
          break;
        case 4:
LABEL_5:
          *(unsigned char *)id result = 0;
          break;
        default:
          break;
      }
    }
    ++*(_DWORD *)(result + 72);
  }
  return result;
}

double sub_4C0B8(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  float v7 = a3;
  float v8 = a7;
  BOOL v9 = v8 == 0.0;
  float v10 = v8 / v7;
  if (v9) {
    float v11 = 1.0;
  }
  else {
    float v11 = v10;
  }
  if (v7 == 0.0) {
    return v11;
  }
  else {
    return v10;
  }
}

void sub_4C100(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  id v18 = objc_alloc_init((Class)NSAffineTransform);
  id v19 = objc_alloc_init((Class)NSAffineTransform);
  id v28 = objc_alloc_init((Class)NSAffineTransform);
  double v20 = a6;
  double v21 = a9;
  double v22 = sub_4C0B8(a2, a3, a4, a5, v20, a7, a8);
  double v24 = v23;
  [v18 translateXBy:-(a2 + a4 * 0.5) yBy:-(a3 + a5 * 0.5)];
  [v19 scaleXBy:v22 yBy:v24];
  [v28 translateXBy:a6 + a8 * 0.5 yBy:a7 + v21 * 0.5];
  [a1 appendTransform:v18];
  [a1 appendTransform:v19];
  [a1 appendTransform:v28];
}

double sub_4C24C@<D0>(_OWORD *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>)
{
  id v18 = objc_alloc_init((Class)NSAffineTransform);
  sub_4C100(v18, a2, a3, a4, a5, a6, a7, a8, a9);
  if (v18) {
    [v18 transformStruct];
  }

  *a1 = 0u;
  a1[1] = 0u;
  double result = 0.0;
  a1[2] = 0u;
  return result;
}

void sub_4C37C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_4C650(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_4C668(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDRLineEnd);
  id v5 = (id)[(GQDRLineEnd *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  }

  return v5;
}

uint64_t sub_4C7D8()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mPath");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A3810, (uint64_t)&unk_9D8B0, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A3810, &dword_0);
  long long v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = class_getInstanceVariable(v3, "mEndPoint");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  sub_38554(qword_A3838, v5);
  __cxa_atexit((void (*)(void *))j_nullsub_2_0, qword_A3838, &dword_0);
  sub_3FBB0((uint64_t)&unk_A3848, (const xmlChar *)"path", v6, v7, v8, v9, v10, v11, (uint64_t)&unk_A3810);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A3848, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3878, "stroke", (uint64_t)sub_4C668, 0, 0, (uint64_t)&unk_A3848);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3878, &dword_0);
}

uint64_t sub_4CF98(__CFData *a1, const UInt8 *a2, uint64_t a3)
{
  return a3;
}

double sub_4D9B8(double a1, double a2, double a3)
{
  return a1 + a3;
}

double sub_4D9C4(double *a1, float a2, float a3)
{
  __float2 v5 = __sincosf_stret(a3);
  double result = (float)(v5.__sinval * a2);
  *a1 = (float)(v5.__cosval * a2);
  a1[1] = result;
  return result;
}

CGMutablePathRef sub_4DA0C(const CGPath *a1, long long *a2)
{
  CGMutablePathRef info = CGPathCreateMutable();
  long long v4 = a2[1];
  long long v7 = *a2;
  long long v8 = v4;
  long long v9 = a2[2];
  CGPathApply(a1, &info, (CGPathApplierFunction)sub_4DA70);
  return info;
}

void sub_4DA70(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(double **)(a2 + 8);
  double v3 = v2[1];
  double v4 = *(double *)(a1 + 8);
  double v5 = *(double *)(a1 + 16);
  double v6 = *(double *)(a1 + 24);
  double v7 = *(double *)(a1 + 32);
  double v8 = *(double *)(a1 + 40);
  double v9 = *(double *)(a1 + 48);
  double v10 = v8 + v3 * v6 + v4 * *v2;
  double v11 = v9 + v3 * v7 + v5 * *v2;
  double v12 = v2[2];
  double v13 = v2[3];
  double v14 = v8 + v6 * v13 + v4 * v12;
  double v15 = v9 + v7 * v13 + v5 * v12;
  switch(*(_DWORD *)a2)
  {
    case 0:
      CGPathMoveToPoint(*(CGMutablePathRef *)a1, 0, v10, v11);
      break;
    case 1:
      CGPathAddLineToPoint(*(CGMutablePathRef *)a1, 0, v10, v11);
      break;
    case 2:
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)a1, 0, v10, v11, v14, v15);
      break;
    case 3:
      CGPathAddCurveToPoint(*(CGMutablePathRef *)a1, 0, v10, v11, v14, v15, v8 + v6 * v2[5] + v4 * v2[4], v9 + v7 * v2[5] + v5 * v2[4]);
      break;
    case 4:
      CGPathCloseSubpath(*(CGMutablePathRef *)a1);
      break;
    default:
      return;
  }
}

uint64_t sub_4DC04(uint64_t a1, void *a2)
{
  double v4 = objc_alloc_init(GQDTDateFormat);
  [(GQDTDateFormat *)v4 readAttributesFromReader:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);

  return 1;
}

uint64_t sub_4DD84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A38B8, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A38B8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A38E8, "date-format", (uint64_t)sub_4DC04, 0, 0, (uint64_t)&unk_A38B8);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A38E8, &dword_0);
}

uint64_t sub_4DE3C(uint64_t a1, void *a2)
{
  double v4 = objc_alloc_init(GQDTDurationCell);
  -[GQDTDurationCell setProcessorBundle:](v4, "setProcessorBundle:", [a2 bundle]);
  [(GQDTCell *)v4 readAttributesForBaseTabularCell:a1 processor:a2];
  [(GQDTDurationCell *)v4 readAttributesForDurationCell:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_4E018()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mComputedFormat");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A3928, (uint64_t)&unk_A3DA0, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A3928, &dword_0);
  double v3 = (objc_class *)objc_opt_class();
  double v4 = class_getInstanceVariable(v3, "mComputedFormat");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_38394((uint64_t)&unk_A3950, v5, 1);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A3950, &dword_0);
  sub_3FBB0((uint64_t)&unk_A3968, (const xmlChar *)"cf", v6, v7, v8, v9, v10, v11, (uint64_t)&unk_A3928);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A3968, &dword_0);
  sub_3FFC4((uint64_t)&unk_A3998, "duration-cell", (uint64_t)&unk_9F830, (uint64_t)sub_4DE3C, (uint64_t)sub_1C310, (uint64_t)&unk_A3968);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A3998, &dword_0);
  sub_381AC(qword_A39E0, (uint64_t)&unk_A3998);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A39E0, &dword_0);
}

__CFString *sub_4E218(int a1, int a2, CFBundleRef bundle, double a4)
{
  if ((byte_A44E8 & 1) == 0)
  {
    qword_A4460 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"week", @"week", 0);
    qword_A4468 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"weeks", @"weeks", 0);
    qword_A44F0 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"wk", @"wk", 0);
    qword_A44F8 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"wks", @"wks", 0);
    qword_A4458 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"w", @"w", 0);
    qword_A4478 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"day", @"day", 0);
    qword_A4480 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"days", @"days", 0);
    qword_A4500 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"day", @"day", 0);
    qword_A4508 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"days", @"days", 0);
    qword_A4470 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"d", @"d", 0);
    qword_A4490 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"hour", @"hour", 0);
    qword_A4498 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"hours", @"hours", 0);
    qword_A4510 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"hr", @"hr", 0);
    qword_A4518 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"hrs", @"hrs", 0);
    qword_A4488 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"h", @"h", 0);
    qword_A44A8 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"minute", @"minute", 0);
    qword_A44B0 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"minutes", @"minutes", 0);
    qword_A4520 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"min", @"min", 0);
    qword_A4528 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"mins", @"mins", 0);
    qword_A44A0 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"m", @"m", 0);
    qword_A44C0 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"second", @"second", 0);
    qword_A44C8 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"seconds", @"seconds", 0);
    qword_A4530 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"sec", @"sec", 0);
    qword_A4538 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"secs", @"secs", 0);
    qword_A44B8 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"s", @"s", 0);
    qword_A44D8 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"millisecond", @"millisecond", 0);
    qword_A44E0 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"milliseconds", @"milliseconds", 0);
    qword_A44D0 = (uint64_t)CFBundleCopyLocalizedString(bundle, @"ms", @"ms", 0);
    byte_A44E8 = 1;
  }
  double result = &stru_85630;
  if (a2)
  {
    switch(a1)
    {
      case 1:
        if (a2 == 2)
        {
          uint64_t v9 = &qword_A4460;
          uint64_t v10 = &qword_A4468;
          goto LABEL_31;
        }
        if (a2 == 1) {
          return (__CFString *)qword_A4458;
        }
        return result;
      case 2:
        if (a2 == 2)
        {
          uint64_t v9 = &qword_A4478;
          uint64_t v10 = &qword_A4480;
          goto LABEL_31;
        }
        if (a2 == 1) {
          return (__CFString *)qword_A4470;
        }
        return result;
      case 3:
      case 5:
      case 6:
      case 7:
        return result;
      case 4:
        if (a2 == 2)
        {
          uint64_t v9 = &qword_A4490;
          uint64_t v10 = &qword_A4498;
          goto LABEL_31;
        }
        if (a2 == 1) {
          return (__CFString *)qword_A4488;
        }
        return result;
      case 8:
        if (a2 == 2)
        {
          uint64_t v9 = &qword_A44A8;
          uint64_t v10 = &qword_A44B0;
          goto LABEL_31;
        }
        if (a2 == 1) {
          return (__CFString *)qword_A44A0;
        }
        return result;
      default:
        if (a1 != 16)
        {
          if (a1 != 32) {
            return result;
          }
          if (a2 != 2)
          {
            if (a2 == 1) {
              return (__CFString *)qword_A44D0;
            }
            return result;
          }
          uint64_t v9 = &qword_A44D8;
          uint64_t v10 = &qword_A44E0;
LABEL_31:
          if (a4 != 1.0) {
            uint64_t v9 = v10;
          }
          return (__CFString *)*v9;
        }
        if (a2 == 2)
        {
          uint64_t v9 = &qword_A44C0;
          uint64_t v10 = &qword_A44C8;
          goto LABEL_31;
        }
        if (a2 == 1) {
          double result = (__CFString *)qword_A44B8;
        }
        break;
    }
  }
  return result;
}

__CFString *sub_4E784(void *a1, __CFBundle *a2, double a3)
{
  BOOL v49 = objc_opt_new();
  ptrdiff_t v5 = +[NSCharacterSet characterSetWithCharactersInString:@"wdhmsf"];
  unsigned int v6 = [a1 length];
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(0, v6);
  uint64_t v8 = Mutable;
  if (a3 < 0.0)
  {
    CFStringAppend(Mutable, @"-");
    a3 = fabs(a3);
  }
  if (!v6)
  {
    LODWORD(v11) = 0;
    LOBYTE(v9) = 0;
    double v27 = 2.22507386e-308;
    double v25 = 2.22507386e-308;
    double v26 = 2.22507386e-308;
    double v28 = 2.22507386e-308;
    goto LABEL_56;
  }
  int v9 = 0;
  unsigned int v10 = 0;
  LODWORD(v11) = 0;
  uint64_t v50 = v5;
  do
  {
    id v12 = [a1 characterAtIndex:v10];
    id v13 = v12;
    uint64_t v14 = v10 + 1;
    if (v14 >= v6)
    {
      if (v12 == 39) {
        goto LABEL_45;
      }
    }
    else
    {
      unsigned int v15 = [a1 characterAtIndex:v10 + 1];
      if (v13 == 39)
      {
        if (v15 == 39)
        {
          CFStringAppend(v8, @"'");
          LODWORD(v14) = v10 + 2;
          goto LABEL_45;
        }
        while (1)
        {
          unsigned int v16 = [a1 characterAtIndex:v14];
          unsigned int v17 = v16;
          if ((int)v14 + 1 >= v6) {
            break;
          }
          unsigned int v18 = [a1 characterAtIndex:(v14 + 1)];
          if (v17 != 39) {
            goto LABEL_14;
          }
          if (v18 != 39) {
            goto LABEL_39;
          }
          CFStringAppend(v8, @"'");
          LODWORD(v14) = v14 + 2;
LABEL_15:
          if (v14 >= v6) {
            goto LABEL_45;
          }
        }
        if (v16 == 39)
        {
LABEL_39:
          LODWORD(v14) = v14 + 1;
          goto LABEL_45;
        }
LABEL_14:
        CFStringAppendFormat(v8, 0, @"%C", v17);
        LODWORD(v14) = v14 + 1;
        goto LABEL_15;
      }
    }
    if (![(NSCharacterSet *)v5 characterIsMember:v13])
    {
      CFStringAppendFormat(v8, 0, @"%C", v13);
      goto LABEL_45;
    }
    int Length = CFStringGetLength(v8);
    if (v14 >= v6)
    {
      int v22 = 0;
    }
    else
    {
      int v51 = v9;
      uint64_t v20 = 0;
      unsigned int v21 = v6 - v10;
      while ([a1 characterAtIndex:v14 + v20] == v13)
      {
        ++v20;
        if (!(v14 - (unint64_t)v6 + v20))
        {
          LODWORD(v14) = v6;
          goto LABEL_27;
        }
      }
      LODWORD(v14) = v14 + v20;
      unsigned int v21 = v20 + 1;
LABEL_27:
      if (v21 == 2) {
        int v22 = 1;
      }
      else {
        int v22 = 3;
      }
      if (v21 == 3) {
        int v22 = 2;
      }
      if (v21 == 1) {
        int v22 = 0;
      }
      int v9 = v51;
      ptrdiff_t v5 = v50;
    }
    int v23 = 0;
    switch((int)v13)
    {
      case 'd':
        int v23 = 2;
        break;
      case 'e':
      case 'g':
      case 'i':
      case 'j':
      case 'k':
      case 'l':
        break;
      case 'f':
        int v23 = 32;
        break;
      case 'h':
        int v23 = 4;
        break;
      case 'm':
        int v23 = 8;
        break;
      default:
        if (v13 == 115) {
          int v23 = 16;
        }
        else {
          int v23 = v13 == 119;
        }
        break;
    }
    double v24 = &v53[3 * v11];
    LODWORD(v11) = v11 + 1;
    v9 |= v23;
    *double v24 = Length;
    v24[1] = v23;
    v24[2] = v22;
LABEL_45:
    unsigned int v10 = v14;
  }
  while (v14 < v6);
  if (v9)
  {
    double v25 = floor(a3 / 604800.0);
    a3 = a3 + v25 * -604800.0;
    if ((v9 & 2) == 0) {
      goto LABEL_53;
    }
LABEL_48:
    double v26 = floor(a3 / 86400.0);
    a3 = a3 + v26 * -86400.0;
    if ((v9 & 4) != 0) {
      goto LABEL_49;
    }
LABEL_54:
    double v27 = 2.22507386e-308;
    if ((v9 & 8) == 0) {
      goto LABEL_55;
    }
LABEL_50:
    double v28 = floor(a3 / 60.0);
    a3 = a3 + v28 * -60.0;
  }
  else
  {
    double v25 = 2.22507386e-308;
    if ((v9 & 2) != 0) {
      goto LABEL_48;
    }
LABEL_53:
    double v26 = 2.22507386e-308;
    if ((v9 & 4) == 0) {
      goto LABEL_54;
    }
LABEL_49:
    double v27 = floor(a3 / 3600.0);
    a3 = a3 + v27 * -3600.0;
    if ((v9 & 8) != 0) {
      goto LABEL_50;
    }
LABEL_55:
    double v28 = 2.22507386e-308;
  }
LABEL_56:
  double v29 = trunc(a3);
  double v30 = 0.0;
  if ((v9 & 0x10) != 0) {
    double v30 = v29;
  }
  double v31 = a3 - v30;
  if ((v9 & 0x10) != 0) {
    double v32 = v29;
  }
  else {
    double v32 = 2.22507386e-308;
  }
  if ((v9 & 0x20) != 0) {
    double v33 = v31 * 1000.0;
  }
  else {
    double v33 = 2.22507386e-308;
  }
  if (v11)
  {
    int v34 = 0;
    uint64_t v11 = v11;
    uint64_t v35 = &v54;
    do
    {
      int v37 = *((_DWORD *)v35 - 2);
      int v36 = *((_DWORD *)v35 - 1);
      double v38 = 0.0;
      BOOL v39 = 0;
      switch(v36)
      {
        case 1:
          BOOL v39 = 0;
          double v38 = v25;
          break;
        case 2:
          BOOL v39 = 0;
          double v38 = v26;
          break;
        case 3:
        case 5:
        case 6:
        case 7:
          break;
        case 4:
          BOOL v39 = 0;
          double v38 = v27;
          break;
        case 8:
          BOOL v39 = 0;
          double v38 = v28;
          break;
        default:
          if (v36 == 32) {
            double v40 = v33;
          }
          else {
            double v40 = 0.0;
          }
          BOOL v39 = v36 == 32;
          if (v36 == 16) {
            double v38 = v32;
          }
          else {
            double v38 = v40;
          }
          if (v36 == 16) {
            BOOL v39 = 0;
          }
          break;
      }
      switch(*(_DWORD *)v35)
      {
        case 0:
          if (v39) {
            CFStringRef v41 = @"000";
          }
          else {
            CFStringRef v41 = @"0";
          }
          goto LABEL_87;
        case 1:
          if (v39) {
            CFStringRef v41 = @"000";
          }
          else {
            CFStringRef v41 = @"00";
          }
LABEL_87:
          CFStringRef v42 = sub_52F40(0, v41, 1, 0, 0, 0, 0, v38, 0);
          CFRetain(v42);
          if (!v42) {
            break;
          }
          goto LABEL_92;
        case 2:
          CFStringRef v43 = sub_52F40(0, @"0", 1, 0, 0, 0, 0, v38, 0);
          double v44 = v38;
          int v45 = v36;
          int v46 = 1;
          goto LABEL_91;
        case 3:
          CFStringRef v43 = sub_52F40(0, @"0", 1, 0, 0, 0, 0, v38, 0);
          double v44 = v38;
          int v45 = v36;
          int v46 = 2;
LABEL_91:
          char v47 = sub_4E218(v45, v46, a2, v44);
          CFStringRef v42 = CFStringCreateWithFormat(0, 0, @"%@%@", v43, v47);
          if (v42)
          {
LABEL_92:
            CFStringInsert(v8, (v37 + v34), v42);
            v34 += CFStringGetLength(v42);
            CFRelease(v42);
          }
          break;
        default:
          break;
      }
      uint64_t v35 = (uint64_t *)((char *)v35 + 12);
      --v11;
    }
    while (v11);
  }

  return v8;
}

id sub_4EE38(uint64_t a1, void *a2)
{
  double v4 = objc_alloc_init(GQDTDurationFormat);
  id v5 = (id)[(GQDTDurationFormat *)v4 readAttributesFromReader:a1];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  }

  return v5;
}

uint64_t sub_4EFC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A39F8, 0, a3, a4, a5, a6, a7, a8, v9);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A39F8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3A28, "duration-format", (uint64_t)sub_4EE38, 0, 0, (uint64_t)&unk_A39F8);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3A28, &dword_0);
}

id sub_4F07C(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
  return [v3 readValue:a1];
}

id sub_4F0BC(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
  return [v3 readElement:a1];
}

uint64_t sub_4F0FC(uint64_t a1, void *a2)
{
  double v4 = objc_alloc_init(GQDTGroupingCell);
  -[GQDTGroupingCell setProcessorBundle:](v4, "setProcessorBundle:", [a2 bundle]);
  [(GQDTGroupingCell *)v4 readAttributes:a1];
  [(GQDTCell *)v4 readAttributesForBaseTabularCell:a1 processor:a2];
  [(GQDTGroupingCell *)v4 readRootFormat:a1];
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_4F91C()
{
  sub_3823C(qword_A3A68, (uint64_t)sub_4F07C, 0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_1, qword_A3A68, &dword_0);
  sub_3F8F8(qword_A3A80, (uint64_t)"group-value", v0, v1, v2, v3, v4, v5, (uint64_t)qword_A3A68);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A3A80, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3AA0, "groupings-element", (uint64_t)sub_4F0BC, 0, 0, (uint64_t)qword_A3A80);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3AA0, &dword_0);
  sub_381AC(qword_A3AE0, (uint64_t)&unk_A3AA0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3AE0, &dword_0);
  unsigned int v6 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v6, "mFormat");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A3AF8, (uint64_t)&unk_9FFC8, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A3AF8, &dword_0);
  uint64_t v9 = (objc_class *)objc_opt_class();
  unsigned int v10 = class_getInstanceVariable(v9, "mFormat");
  ptrdiff_t v11 = ivar_getOffset(v10);
  objc_opt_class();
  objc_opt_class();
  sub_38394((uint64_t)&unk_A3B20, v11, 1);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A3B20, &dword_0);
  sub_3F8F8(qword_A3B38, (uint64_t)"groupings-element", v12, v13, v14, v15, v16, v17, (uint64_t)qword_A3AE0);
  __cxa_atexit((void (*)(void *))sub_3C30, qword_A3B38, &dword_0);
  sub_3FFC4((uint64_t)&unk_A3B58, "grouping-cell", (uint64_t)&unk_9F830, (uint64_t)sub_4F0FC, (uint64_t)sub_1C310, (uint64_t)qword_A3B38);
  __cxa_atexit((void (*)(void *))sub_48C0, &unk_A3B58, &dword_0);
  sub_381AC(qword_A3BA0, (uint64_t)&unk_A3B58);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3BA0, &dword_0);
}

id sub_4FC20(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDCallout2Path);
  id v5 = (id)[(GQDCallout2Path *)v4 readAttributesFromReader:a1 processor:a2];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  }

  return v5;
}

uint64_t sub_4FCA4(xmlTextReader *a1, void *a2)
{
  uint64_t v3 = (CGSize *)objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject");
  BOOL v4 = sub_43488(a1, v7);
  id v5 = &CGSizeZero;
  if (v4) {
    id v5 = (const CGSize *)v7;
  }
  v3[1] = *v5;
  if (v4) {
    return 1;
  }
  else {
    return 3;
  }
}

uint64_t sub_50390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A3BB8, 0, a3, a4, a5, a6, a7, a8, v15);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A3BB8, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3BE8, "size", (uint64_t)sub_4FCA4, 0, 0, (uint64_t)&unk_A3BB8);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3BE8, &dword_0);
  sub_381AC(qword_A3C28, (uint64_t)&unk_A3BE8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3C28, &dword_0);
  sub_3FBB0((uint64_t)&unk_A3C40, (const xmlChar *)"size", v8, v9, v10, v11, v12, v13, (uint64_t)qword_A3C28);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A3C40, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3C70, "callout2-path", (uint64_t)sub_4FC20, 0, 0, (uint64_t)&unk_A3C40);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3C70, &dword_0);
}

float sub_50500(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double sub_5051C(double a1, double a2, double a3)
{
  return a1 - a3;
}

double sub_50528(double a1, double a2, float a3)
{
  return a1 * a3;
}

double sub_50538(int a1, double a2, double a3)
{
  double result = -a3;
  if (!a1) {
    return a3;
  }
  return result;
}

double sub_50558(double a1, double a2)
{
  float v2 = a2 * a2 + a1 * a1;
  return a1 * (float)(1.0 / sqrtf(v2));
}

double sub_50580(double a1, double a2, double a3, double a4)
{
  return a2 * a4 + a1 * a3;
}

double sub_5058C(double a1, double a2, double a3, double a4)
{
  return a2 * a3 - a1 * a4;
}

double sub_50598(float64x2_t *a1, float a2)
{
  double v2 = (float)(1.0 - a2);
  __asm { FMOV            V5.2D, #3.0 }
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_f64(a1[1], _Q5), a2), v2), v2), vmulq_n_f64(vmulq_n_f64(*a1, v2), v2), v2), vmulq_n_f64(vmulq_n_f64(vmulq_f64(a1[2], _Q5), a2), a2), v2), vmulq_n_f64(vmulq_n_f64(a1[3], a2), a2), a2);
  return result;
}

double sub_505F4(double a1, double a2, double a3)
{
  if (a1 >= a3) {
    return (float)a3;
  }
  else {
    return (float)a1;
  }
}

double sub_50638(double a1, double a2, double a3, double a4, double a5)
{
  if (a1 >= a5) {
    return (float)a5;
  }
  else {
    return (float)a1;
  }
}

BOOL sub_5068C(double a1, double a2, double a3, double a4)
{
  return vabdd_f64(a1, a3) < 0.01 && vabdd_f64(a2, a4) < 0.01;
}

float sub_506BC(float a1, float a2, float a3)
{
  if (a1 <= a3) {
    a3 = a1;
  }
  if (a1 >= a2) {
    return a3;
  }
  else {
    return a2;
  }
}

void sub_506D0(__CFArray *a1, float a2)
{
  float valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &valuePtr);
  CFArrayAppendValue(a1, v3);
  CFRelease(v3);
}

double sub_5072C(const __CFArray *a1, CFIndex a2, double *a3)
{
  uint64_t valuePtr = 0;
  ValueAtIndefloat64x2_t x = (const __CFNumber *)CFArrayGetValueAtIndex(a1, a2);
  CFNumberGetValue(ValueAtIndex, kCFNumberFloatType, (char *)&valuePtr + 4);
  CFNumberRef v7 = (const __CFNumber *)CFArrayGetValueAtIndex(a1, a2 + 1);
  CFNumberGetValue(v7, kCFNumberFloatType, &valuePtr);
  double result = *((float *)&valuePtr + 1);
  double v9 = *(float *)&valuePtr;
  *a3 = *((float *)&valuePtr + 1);
  a3[1] = v9;
  return result;
}

void sub_507A0(__CFArray *a1, uint64_t a2)
{
  if (a1)
  {
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    id v5 = *(double **)(a2 + 8);
    unsigned int valuePtr = *(_DWORD *)a2;
    CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    CFArrayAppendValue(Mutable, v6);
    CFRelease(v6);
    if (valuePtr < 2)
    {
      uint64_t v13 = v5 + 1;
    }
    else
    {
      if (valuePtr != 2 && valuePtr != 3) {
        goto LABEL_8;
      }
      double v7 = v5[1];
      float v8 = *v5;
      sub_506D0(Mutable, v8);
      float v9 = v7;
      sub_506D0(Mutable, v9);
      double v10 = v5[3];
      float v11 = v5[2];
      sub_506D0(Mutable, v11);
      float v12 = v10;
      sub_506D0(Mutable, v12);
      uint64_t v13 = v5 + 5;
      v5 += 4;
    }
    double v14 = *v13;
    float v15 = *v5;
    sub_506D0(Mutable, v15);
    float v16 = v14;
    sub_506D0(Mutable, v16);
LABEL_8:
    CFArrayAppendValue(a1, Mutable);
    CFRelease(Mutable);
  }
}

float sub_508CC(float64x2_t *a1, double *a2, uint64_t a3)
{
  double v6 = sub_5051C(a2[2], a2[3], *a2);
  double v8 = sub_50558(v6, v7);
  double v10 = v9;
  double v11 = sub_5051C(a1->f64[0], a1->f64[1], *a2);
  double v13 = sub_50558(v11, v12);
  v46.f64[0] = 0.0;
  v46.f64[1] = sub_50580(v8, v10, v13, v14);
  double v15 = sub_5051C(a1[1].f64[0], a1[1].f64[1], *a2);
  double v17 = sub_50558(v15, v16);
  uint64_t v47 = 0x3FD5555560000000;
  double v48 = sub_50580(v8, v10, v17, v18);
  double v19 = sub_5051C(a1[2].f64[0], a1[2].f64[1], *a2);
  double v21 = sub_50558(v19, v20);
  uint64_t v49 = 0x3FE5555560000000;
  double v50 = sub_50580(v8, v10, v21, v22);
  double v23 = sub_5051C(a1[3].f64[0], a1[3].f64[1], *a2);
  double v25 = sub_50558(v23, v24);
  uint64_t v51 = 0x3FF0000000000000;
  double v52 = sub_50580(v8, v10, v25, v26);
  float v27 = v48 * 9.0 + v46.f64[1] * -3.0 + v50 * -9.0 + v52 * 3.0;
  float v28 = v48 * -12.0 + v46.f64[1] * 6.0 + v50 * 6.0;
  float v29 = v48 * 3.0 + v46.f64[1] * -3.0;
  float v30 = sqrtf((float)((float)(v27 * -4.0) * v29) + (float)(v28 * v28));
  float v31 = (float)((float)-v28 - v30) / (float)(v27 + v27);
  double v32 = sub_50598(&v46, (float)(v30 - v28) / (float)(v27 + v27));
  double v34 = v33;
  double v35 = sub_50598(&v46, v31);
  BOOL v38 = v35 <= 1.0 && v35 >= 0.0 && v34 <= v36;
  if (!v38 && (v32 >= 0.0 ? (BOOL v39 = v32 > 1.0) : (BOOL v39 = 1), !v39)
    || ((v40 = -2.0, v35 >= 0.0) ? (v41 = v35 > 1.0) : (v41 = 1), double v32 = v35, v34 = v36, !v41))
  {
    float v42 = v32;
    *(double *)a3 = sub_50598(a1, v42);
    *(void *)(a3 + 8) = v43;
    float v44 = v34;
    return fabsf(v44);
  }
  return v40;
}

double sub_50B20(const CGPath *a1, double *a2)
{
  unsigned int valuePtr = 0;
  double x = CGPointZero.x;
  double v5 = sub_5051C(a2[2], a2[3], *a2);
  double v7 = sub_50558(v5, v6);
  double v9 = v8;
  CGPoint v28 = CGPointZero;
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CGPathApply(a1, Mutable, (CGPathApplierFunction)sub_507A0);
  int Count = CFArrayGetCount(Mutable);
  if (Count >= 1)
  {
    CFIndex v12 = 0;
    uint64_t v13 = Count;
    float v14 = -2.0;
    while (1)
    {
      ValueAtIndedouble x = (const __CFArray *)CFArrayGetValueAtIndex(Mutable, v12);
      CFNumberRef v16 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
      CFNumberGetValue(v16, kCFNumberIntType, &valuePtr);
      unsigned int v17 = valuePtr;
      if (valuePtr < 2) {
        break;
      }
      if (valuePtr == 3)
      {
        double v18 = (double *)v31;
        for (CFIndex i = 1; i != 7; i += 2)
        {
          sub_5072C(ValueAtIndex, i, v18);
          v18 += 2;
        }
        goto LABEL_8;
      }
LABEL_9:
      if (v17 == 3)
      {
        float v20 = sub_508CC(&v30, a2, (uint64_t)&v27);
        if (v20 > v14)
        {
          float v14 = v20;
          double x = v27;
        }
        v31[0] = v31[2];
      }
      else if (v17 == 4)
      {
        v31[0] = v28;
        unsigned int valuePtr = 1;
      }
      double v21 = sub_5051C(*(double *)v31, *((double *)v31 + 1), *a2);
      double v23 = sub_50558(v21, v22);
      float v25 = sub_50580(v7, v9, v23, v24);
      if (v14 < v25)
      {
        float v14 = v25;
        double x = *(double *)v31;
      }
      float64x2_t v30 = (float64x2_t)v31[0];
      if (!valuePtr) {
        CGPoint v28 = (CGPoint)v31[0];
      }
      if (++v12 == v13) {
        goto LABEL_20;
      }
    }
    sub_5072C(ValueAtIndex, 1, (double *)v31);
LABEL_8:
    unsigned int v17 = valuePtr;
    goto LABEL_9;
  }
LABEL_20:
  if (Mutable) {
    CFRelease(Mutable);
  }
  return x;
}

float64x2_t sub_50D78(float64x2_t *a1, float64x2_t *a2, int a3, int a4, double *a5, double *a6, float64x2_t *a7, double a8, double a9, double a10)
{
  double v19 = a2->f64[0] - a1->f64[0];
  double v20 = a2->f64[1] - a1->f64[1];
  __double2 v21 = __sincos_stret(a10);
  double v22 = sub_50580(v19, v20, v21.__cosval, v21.__sinval);
  double v23 = sub_5058C(v19, v20, v21.__cosval, v21.__sinval);
  double v46 = a9;
  double v24 = v22 / a8;
  double v25 = v23 / a9;
  double v26 = sub_50580(v22 / a8, v25, v22 / a8, v25);
  double v27 = 0.0;
  if (v26 < 4.0)
  {
    float v28 = sqrt(1.0 / v26 + -0.25);
    double v27 = v28;
  }
  double v29 = v25 * v27;
  double v30 = -(v24 * v27);
  double v31 = -(v25 * v27 - v24 * -0.5);
  if (v31 <= -1.0)
  {
    double v32 = 3.14159265;
  }
  else
  {
    double v32 = 0.0;
    if (v31 < 1.0)
    {
      double v33 = acos(v31);
      *a5 = v33;
      if (-(v30 - v25 * -0.5) >= 0.0) {
        goto LABEL_9;
      }
      double v32 = 6.28318531 - v33;
    }
  }
  *a5 = v32;
LABEL_9:
  double v34 = v24 * 0.5 - v25 * v27;
  if (v34 <= -1.0)
  {
    double v35 = 3.14159265;
  }
  else
  {
    double v35 = 0.0;
    if (v34 < 1.0)
    {
      double v36 = acos(v34);
      *a6 = v36;
      if (v25 * 0.5 - v27 * -v24 >= 0.0) {
        goto LABEL_15;
      }
      double v35 = 6.28318531 - v36;
    }
  }
  *a6 = v35;
LABEL_15:
  a7->f64[0] = sub_50580(v29 * a8, v30 * v46, v21.__cosval, -v21.__sinval);
  double v37 = sub_5058C(v29 * a8, v30 * v46, v21.__cosval, -v21.__sinval);
  a7->f64[1] = v37;
  if (a4)
  {
    if (!a3) {
      goto LABEL_23;
    }
  }
  else if (a3)
  {
    goto LABEL_23;
  }
  a7->f64[0] = -a7->f64[0];
  a7->f64[1] = -v37;
  double v38 = *a6;
  *a6 = *a5;
  *a5 = v38;
  *a6 = *a6 + 3.14159265;
  double v39 = *a5 + 3.14159265;
  *a5 = v39;
  if (*a6 >= 6.28318531)
  {
    *a6 = *a6 + -6.28318531;
    double v39 = *a5;
  }
  if (v39 >= 6.28318531) {
    *a5 = v39 + -6.28318531;
  }
LABEL_23:
  float64x2_t result = vaddq_f64(*a1, *a2);
  __asm { FMOV            V2.2D, #0.5 }
  *a7 = vmlaq_f64(*a7, _Q2, result);
  return result;
}

void sub_5103C()
{
}

void sub_51290()
{
}

CGPath *sub_512D0(uint64_t a1)
{
  CFMutableArrayRef Mutable = CGPathCreateMutable();
  float64x2_t v20 = (float64x2_t)CGPointZero;
  float64x2_t v21 = v20;
  int v3 = *(_DWORD *)(a1 + 8);
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 44 * v3;
    do
    {
      uint64_t v6 = *(void *)(a1 + 16);
      switch(*(_DWORD *)(v6 + v4))
      {
        case 0:
          uint64_t v7 = v6 + v4;
          CGFloat v8 = *(float *)(v7 + 16);
          CGFloat v9 = *(float *)(v7 + 20);
          v21.f64[0] = v8;
          v21.f64[1] = v9;
          CGPathMoveToPoint(Mutable, 0, v8, v9);
          break;
        case 1:
          uint64_t v10 = v6 + v4;
          CGFloat v11 = *(float *)(v10 + 16);
          CGFloat v12 = *(float *)(v10 + 20);
          v21.f64[0] = v11;
          v21.f64[1] = v12;
          CGPathAddLineToPoint(Mutable, 0, v11, v12);
          break;
        case 2:
          uint64_t v13 = (float *)(v6 + v4);
          CGFloat v14 = v13[5];
          v20.f64[0] = v13[4];
          v20.f64[1] = v14;
          CGPathAddCurveToPoint(Mutable, 0, v21.f64[0] + v13[6] * 0.333333333, v21.f64[1] + v13[7] * 0.333333333, v20.f64[0] - v13[8] * 0.333333333, v14 - v13[9] * 0.333333333, v20.f64[0], v14);
          goto LABEL_8;
        case 4:
          double v15 = (float32x2_t *)(v6 + v4);
          float64x2_t v20 = vcvtq_f64_f32(v15[2]);
          double v18 = 0.0;
          double v19 = 0.0;
          sub_50D78(&v21, &v20, v15[4].u8[4], v15[4].u8[5], &v19, &v18, &v17, v15[3].f32[0], v15[3].f32[1], v15[4].f32[0]);
          CGPathAddArc(Mutable, 0, v17.f64[0], v17.f64[1], *(float *)(*(void *)(a1 + 16) + v4 + 24), v19 * 180.0 / 3.14159265, v18 * 180.0 / 3.14159265, *(unsigned char *)(*(void *)(a1 + 16) + v4 + 37));
LABEL_8:
          float64x2_t v21 = v20;
          break;
        case 5:
          CGPathCloseSubpath(Mutable);
          break;
        default:
          break;
      }
      v4 += 44;
    }
    while (v5 != v4);
  }
  return Mutable;
}

CGMutablePathRef sub_514DC(const __CFArray *a1)
{
  int Count = CFArrayGetCount(a1);
  if (Count == 1)
  {
    ValueAtIndedouble x = (const CGPath *)CFArrayGetValueAtIndex(a1, 0);
    return CGPathCreateCopy(ValueAtIndex);
  }
  else
  {
    if (Count) {
      operator new[]();
    }
    return CGPathCreateMutable();
  }
}

void sub_51838()
{
}

CGMutablePathRef sub_51888(const __CFArray *a1)
{
  return sub_514DC(a1);
}

CGMutablePathRef sub_51890(const __CFArray *a1)
{
  return sub_514DC(a1);
}

uint64_t sub_51898(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDTComputedFormatSpec);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);

  return 1;
}

uint64_t sub_51A0C()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mFormat");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A3CB0, (uint64_t)&unk_9FFC8, Offset);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A3CB0, &dword_0);
  int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = class_getInstanceVariable(v3, "mFormat");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_38394((uint64_t)&unk_A3CD8, v5, 1);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A3CD8, &dword_0);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = class_getInstanceVariable(v6, "mFormat");
  ptrdiff_t v8 = ivar_getOffset(v7);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A3CF0, (uint64_t)&unk_A38E8, v8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A3CF0, &dword_0);
  CGFloat v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = class_getInstanceVariable(v9, "mFormat");
  ptrdiff_t v11 = ivar_getOffset(v10);
  objc_opt_class();
  objc_opt_class();
  sub_38394((uint64_t)&unk_A3D18, v11, 1);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A3D18, &dword_0);
  CGFloat v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = class_getInstanceVariable(v12, "mFormat");
  ptrdiff_t v14 = ivar_getOffset(v13);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A3D30, (uint64_t)&unk_A3A28, v14);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A3D30, &dword_0);
  double v15 = (objc_class *)objc_opt_class();
  CFNumberRef v16 = class_getInstanceVariable(v15, "mFormat");
  ptrdiff_t v17 = ivar_getOffset(v16);
  objc_opt_class();
  objc_opt_class();
  sub_38394((uint64_t)&unk_A3D58, v17, 1);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A3D58, &dword_0);
  sub_3FBB0((uint64_t)&unk_A3D70, (const xmlChar *)"number-format", v18, v19, v20, v21, v22, v23, (uint64_t)&unk_A3CB0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A3D70, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3DA0, "computed-format-spec", (uint64_t)sub_51898, 0, 0, (uint64_t)&unk_A3D70);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3DA0, &dword_0);
}

uint64_t sub_51DAC(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_alloc_init(GQDFilteredImage);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_51E18(void *a1, int a2)
{
  id v3 = [a1 documentState];
  if ((int)[v3 objectStackDepth] <= a2) {
    return 3;
  }
  [v3 peekObject];
  return 1;
}

uint64_t sub_51E60(xmlTextReader *a1, void *a2)
{
  AttributeNs = xmlTextReaderGetAttributeNs(a1, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
  if (!AttributeNs) {
    return 3;
  }
  uint64_t v4 = AttributeNs;
  id v5 = objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "objectWithXmlUid:", AttributeNs);
  if (v5)
  {
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v5);
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 3;
  }
  xmlFree(v4);
  return v6;
}

uint64_t sub_51F80()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v0, "mOriginalImageBinary");
  ptrdiff_t Offset = ivar_getOffset(InstanceVariable);
  objc_opt_class();
  objc_opt_class();
  sub_38394((uint64_t)&unk_A3DE0, Offset, 1);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A3DE0, &dword_0);
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = class_getInstanceVariable(v3, "mFilteredImageBinary");
  ptrdiff_t v5 = ivar_getOffset(v4);
  objc_opt_class();
  objc_opt_class();
  sub_38394((uint64_t)&unk_A3DF8, v5, 1);
  __cxa_atexit((void (*)(void *))j_nullsub_2_3, &unk_A3DF8, &dword_0);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = class_getInstanceVariable(v6, "mOriginalImageBinary");
  ptrdiff_t v8 = ivar_getOffset(v7);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A3E10, (uint64_t)&unk_9EBD8, v8);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A3E10, &dword_0);
  CGFloat v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = class_getInstanceVariable(v9, "mFilteredImageBinary");
  ptrdiff_t v11 = ivar_getOffset(v10);
  objc_opt_class();
  objc_opt_class();
  sub_3828C((uint64_t)&unk_A3E38, (uint64_t)&unk_9EBD8, v11);
  __cxa_atexit((void (*)(void *))j_nullsub_2_2, &unk_A3E38, &dword_0);
  sub_3FBB0((uint64_t)&unk_A3E60, (const xmlChar *)"unfiltered-ref", v12, v13, v14, v15, v16, v17, (uint64_t)&unk_A3DE0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A3E60, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3E90, "filteredimage", (uint64_t)sub_51DAC, 0, (uint64_t)sub_51E18, (uint64_t)&unk_A3E60);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3E90, &dword_0);
  sub_381AC(qword_A3ED0, (uint64_t)&unk_A3E90);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3ED0, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3EE8, "filteredimage-ref", (uint64_t)sub_51E60, 0, 0, (uint64_t)&unk_A3E60);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3EE8, &dword_0);
  sub_381AC(qword_A3F28, (uint64_t)&unk_A3EE8);
  return __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3F28, &dword_0);
}

BOOL sub_5290C(unsigned int a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t v4 = [a2 count];
  if (!v4) {
    return 0;
  }
  unint64_t v5 = a1;
  id v6 = objc_msgSend(objc_msgSend(a2, "objectAtIndex:", 0), "rangeValue");
  if (a1 >= (unint64_t)v6 && a1 - (unint64_t)v6 < v7) {
    return 1;
  }
  uint64_t v9 = 1;
  do
  {
    unint64_t v10 = v9;
    if (v4 == v9) {
      break;
    }
    id v11 = objc_msgSend(objc_msgSend(a2, "objectAtIndex:", v9), "rangeValue");
    uint64_t v9 = v10 + 1;
  }
  while (v5 < (unint64_t)v11 || v5 - (unint64_t)v11 >= v12);
  return v10 < v4;
}

uint64_t sub_52CA4(double a1)
{
  double valuePtr = a1;
  if (floor(a1) == a1) {
    return 0;
  }
  double v2 = (__CFNumberFormatter *)qword_A4588;
  if (!qword_A4588)
  {
    CFStringRef CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString(kCFAllocatorDefault, @"en_US");
    CFLocaleRef v4 = CFLocaleCreate(kCFAllocatorDefault, CanonicalLocaleIdentifierFromString);
    CFRelease(CanonicalLocaleIdentifierFromString);
    qword_A4588 = (uint64_t)CFNumberFormatterCreate(kCFAllocatorDefault, v4, kCFNumberFormatterNoStyle);
    CFRelease(v4);
    CFNumberFormatterSetFormat((CFNumberFormatterRef)qword_A4588, @"0");
    CFNumberFormatterSetProperty((CFNumberFormatterRef)qword_A4588, kCFNumberFormatterMinFractionDigits, +[NSNumber numberWithInt:0]);
    CFNumberFormatterSetProperty((CFNumberFormatterRef)qword_A4588, kCFNumberFormatterMaxFractionDigits, +[NSNumber numberWithInt:0x7FFFFFFFLL]);
    double v2 = (__CFNumberFormatter *)qword_A4588;
  }
  unint64_t v5 = (__CFString *)CFNumberFormatterCreateStringWithValue(kCFAllocatorDefault, v2, kCFNumberDoubleType, &valuePtr);
  id v6 = [(__CFString *)v5 rangeOfString:@"."];
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL && v7 == 1) {
    uint64_t v1 = [(__CFString *)v5 length] + ~v6;
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

uint64_t sub_52E14(CFLocaleRef locale)
{
  if (locale)
  {
    uint64_t v1 = CFNumberFormatterCreate(0, locale, kCFNumberFormatterDecimalStyle);
    CFNumberRef v2 = (const __CFNumber *)CFNumberFormatterCopyProperty(v1, kCFNumberFormatterGroupingSize);
    CFRelease(v1);
    unsigned int valuePtr = 0;
    CFNumberGetValue(v2, kCFNumberIntType, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    CFLocaleRef v4 = (const __CFLocale *)qword_A4590;
    if (!qword_A4590)
    {
      CFLocaleRef v4 = CFLocaleCopyCurrent();
      qword_A4590 = (uint64_t)v4;
    }
    uint64_t result = dword_9D7A8;
    if (dword_9D7A8 == -1)
    {
      unint64_t v5 = CFNumberFormatterCreate(0, v4, kCFNumberFormatterDecimalStyle);
      CFNumberRef v6 = (const __CFNumber *)CFNumberFormatterCopyProperty(v5, kCFNumberFormatterGroupingSize);
      CFRelease(v5);
      unsigned int valuePtr = 0;
      CFNumberGetValue(v6, kCFNumberIntType, &valuePtr);
      CFRelease(v6);
      uint64_t result = valuePtr;
      dword_9D7A8 = valuePtr;
    }
  }
  return result;
}

CFLocaleRef sub_52F10()
{
  CFLocaleRef result = (CFLocaleRef)qword_A4590;
  if (!qword_A4590)
  {
    CFLocaleRef result = CFLocaleCopyCurrent();
    qword_A4590 = (uint64_t)result;
  }
  return result;
}

CFStringRef sub_52F40(int a1, const __CFString *a2, int a3, unsigned int a4, unsigned int a5, int a6, const __CFString *value, double a8, int a9)
{
  double valuePtr = a8;
  CFLocaleRef v14 = (const __CFLocale *)qword_A4590;
  if (!qword_A4590)
  {
    CFLocaleRef v14 = CFLocaleCopyCurrent();
    qword_A4590 = (uint64_t)v14;
  }
  uint64_t v15 = qword_A4598;
  if (!qword_A4598)
  {
    qword_A4598 = (uint64_t)CFNumberFormatterCreate(kCFAllocatorDefault, v14, kCFNumberFormatterNoStyle);
    qword_A45A0 = (uint64_t)CFNumberFormatterCreate(kCFAllocatorDefault, v14, kCFNumberFormatterNoStyle);
    CFNumberFormatterSetProperty((CFNumberFormatterRef)qword_A4598, kCFNumberFormatterRoundingMode, +[NSNumber numberWithInt:6]);
    CFNumberFormatterSetProperty((CFNumberFormatterRef)qword_A45A0, kCFNumberFormatterRoundingMode, +[NSNumber numberWithInt:6]);
    uint64_t v15 = qword_A4598;
  }
  uint64_t v16 = (__CFNumberFormatter *)qword_A45A0;
  if (a9) {
    uint64_t v17 = (__CFNumberFormatter *)qword_A45A0;
  }
  else {
    uint64_t v17 = (__CFNumberFormatter *)v15;
  }
  if (value)
  {
    CFNumberFormatterSetProperty(v17, kCFNumberFormatterCurrencyCode, value);
    if (CFEqual(value, @"CHF"))
    {
      id v18 = [objc_alloc((Class)NSNumber) initWithInt:0];
      CFNumberFormatterSetProperty(v17, kCFNumberFormatterRoundingIncrement, v18);
    }
  }
  CFStringRef Format = CFNumberFormatterGetFormat(v17);
  if (CFStringCompare(a2, Format, 0)) {
    CFNumberFormatterSetFormat(v17, a2);
  }
  if (a3)
  {
    int v20 = a6;
    if ((unsigned __int16)word_9D798 == a5)
    {
      id v21 = [objc_alloc((Class)NSNumber) initWithInt:0];
      id v22 = [objc_alloc((Class)NSNumber) initWithInt:0x7FFFFFFFLL];
      CFNumberFormatterSetProperty(v17, kCFNumberFormatterMinFractionDigits, v21);
      CFNumberFormatterSetProperty(v17, kCFNumberFormatterMaxFractionDigits, v22);
    }
    else
    {
      id v23 = [objc_alloc((Class)NSNumber) initWithInt:a4];
      CFNumberFormatterSetProperty(v17, kCFNumberFormatterMinFractionDigits, v23);

      id v22 = [objc_alloc((Class)NSNumber) initWithInt:a5];
      CFNumberFormatterSetProperty(v17, kCFNumberFormatterMaxFractionDigits, v22);
    }

    a6 = v20;
  }
  if (a9) {
    CFNumberFormatterSetProperty(v16, kCFNumberFormatterMinusSign, &stru_85630);
  }
  double v24 = (CFTypeRef *)&kCFBooleanFalse;
  if (a6) {
    double v24 = (CFTypeRef *)&kCFBooleanTrue;
  }
  CFNumberFormatterSetProperty(v17, kCFNumberFormatterUseGroupingSeparator, *v24);
  if (a3)
  {
    id v25 = [objc_alloc((Class)NSNumber) initWithInt:1];
    CFNumberFormatterSetProperty(v17, kCFNumberFormatterMinIntegerDigits, v25);
  }
  return (id)CFNumberFormatterCreateStringWithValue(kCFAllocatorDefault, v17, kCFNumberDoubleType, &valuePtr);
}

__CFArray *sub_53290(const __CFLocale *a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  id v3 = CFNumberFormatterCreate(kCFAllocatorDefault, a1, kCFNumberFormatterDecimalStyle);
  CFNumberFormatterSetProperty(v3, kCFNumberFormatterExponentSymbol, @"xyzzyqghbv&q");
  CFArrayAppendValue(Mutable, v3);
  CFRelease(v3);
  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"#,##0;- #,##0",
         @"#,##0;(#,##0)",
         @"#,##0;( #,##0)",
         0);
  int v5 = [v4 count];
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5;
    do
    {
      ptrdiff_t v8 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterNoStyle);
      CFNumberFormatterSetFormat(v8, (CFStringRef)[v4 objectAtIndex:v6]);
      CFNumberFormatterSetProperty(v8, kCFNumberFormatterExponentSymbol, @"xyzzyqghbv&q");
      CFArrayAppendValue(Mutable, v8);
      CFRelease(v8);
      ++v6;
    }
    while (v7 != v6);
  }

  return Mutable;
}

__CFArray *sub_533E8(const __CFLocale *a1, const __CFArray *a2, const void *a3)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFIndex Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    CFIndex v8 = Count;
    for (CFIndex i = 0; i != v8; ++i)
    {
      unint64_t v10 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterNoStyle);
      ValueAtIndedouble x = (const __CFString *)CFArrayGetValueAtIndex(a2, i);
      CFNumberFormatterSetFormat(v10, ValueAtIndex);
      CFNumberFormatterSetProperty(v10, kCFNumberFormatterCurrencyCode, a3);
      CFNumberFormatterSetProperty(v10, kCFNumberFormatterExponentSymbol, @"xyzzyqghbv&q");
      CFArrayAppendValue(Mutable, v10);
      CFRelease(v10);
    }
  }
  return Mutable;
}

__CFArray *sub_534F0(const __CFLocale *a1, const __CFArray *a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v6 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterCurrencyStyle);
  CFNumberFormatterSetProperty(v6, kCFNumberFormatterExponentSymbol, @"xyzzyqghbv&q");
  id v7 = objc_msgSend(-[__CFString sfu_positiveSubpatternOfNumberFormatPattern]((id)CFNumberFormatterGetFormat(v6), "sfu_positiveSubpatternOfNumberFormatPattern"), "sfu_numberPortionOfNumberFormatSubpattern");
  CFArrayAppendValue(Mutable, v6);
  CFRelease(v6);
  [v5 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@", 164, v7)];
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;- %C%@",
      164,
      v7,
      164,
      v7));
  [v5 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C", v7, 164)];
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;- %@%C",
      v7,
      164,
      v7,
      164));
  [v5 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C %@", 164, v7)];
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C %@;- %C %@",
      164,
      v7,
      164,
      v7));
  [v5 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ %C", v7, 164)];
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ %C;- %@ %C",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C-%@",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C -%@",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C- %@",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C - %@",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;(%C%@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;( %C%@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;(%C%@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;(%C %@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;( %C %@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;(%C %@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;( %C%@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;( %C %@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C(%@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C( %@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C(%@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C (%@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C(%@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C (%@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C( %@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C(%@)",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;(%@%C)",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;( %@%C)",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;(%@%C)",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;(%@ %C)",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;( %@ %C)",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;(%@ %C)",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;( %@%C)",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;( %@ %C)",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;(%@)%C",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;( %@)%C",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;(%@)%C",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;(%@) %C",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;( %@) %C",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;(%@) %C",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;( %@)%C",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;( %@) %C",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C%@-",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C%@ -",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C %@-",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%C%@;%C %@ -",
      164,
      v7,
      164,
      v7));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;%@%C-",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;%@%C -",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;%@ %C-",
      v7,
      164,
      v7,
      164));
  objc_msgSend(v5, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%C;%@ %C -",
      v7,
      164,
      v7,
      164));
  CFIndex Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    CFIndex v9 = Count;
    for (CFIndex i = 0; i != v9; ++i)
    {
      ValueAtIndedouble x = CFArrayGetValueAtIndex(a2, i);
      unint64_t v12 = sub_533E8(a1, (const __CFArray *)v5, ValueAtIndex);
      v14.length = CFArrayGetCount(v12);
      v14.location = 0;
      CFArrayAppendArray(Mutable, v12, v14);
      CFRelease(v12);
    }
  }

  return Mutable;
}

__CFArray *sub_53D64(const __CFLocale *a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  id v3 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterPercentStyle);
  CFNumberFormatterSetProperty(v3, kCFNumberFormatterExponentSymbol, @"xyzzyqghbv&q");
  CFArrayAppendValue(Mutable, v3);
  CFRelease(v3);
  id v4 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterNoStyle);
  CFNumberFormatterSetFormat(v4, @"#,##0 %");
  CFNumberFormatterSetProperty(v4, kCFNumberFormatterExponentSymbol, @"xyzzyqghbv&q");
  CFArrayAppendValue(Mutable, v4);
  CFRelease(v4);
  return Mutable;
}

CFArrayRef sub_53E3C(CFLocaleRef locale)
{
  values = CFNumberFormatterCreate(kCFAllocatorDefault, locale, kCFNumberFormatterScientificStyle);
  CFArrayRef v1 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  CFRelease(values);
  return v1;
}

uint64_t sub_53EA4(__CFNumberFormatter *a1, CFStringRef theString, double *a3)
{
  v10.location = 0;
  v10.CFIndex length = CFStringGetLength(theString);
  uint64_t result = CFNumberFormatterGetValueFromString(a1, theString, &v10, kCFNumberDoubleType, a3);
  if (!result)
  {
    uint64_t v9 = 0;
    if (!a3) {
      return result;
    }
    goto LABEL_10;
  }
  if (v10.location || (CFIndex length = v10.length, length != CFStringGetLength(theString)))
  {
    uint64_t v9 = 0;
    uint64_t result = 0;
    if (!a3) {
      return result;
    }
    goto LABEL_10;
  }
  if (!a3) {
    return 1;
  }
  int v8 = __fpclassifyd(*a3);
  uint64_t v9 = 1;
  uint64_t result = 1;
  if (v8 == 3)
  {
LABEL_10:
    *a3 = 0.0;
    return v9;
  }
  return result;
}

NSMutableString *sub_53F6C(void *a1)
{
  int v2 = [a1 length];
  id v3 = +[NSMutableString stringWithCapacity:v2];
  if (v2 >= 1)
  {
    int v4 = 0;
    while (1)
    {
      unsigned int v5 = [a1 characterAtIndex:v4];
      unsigned int v6 = v5;
      int v7 = v4 + 1;
      if (v4 + 1 >= v2)
      {
        if (v5 != 39) {
LABEL_16:
        }
          [(NSMutableString *)v3 appendFormat:@"%C", v6];
        ++v4;
        goto LABEL_18;
      }
      unsigned int v8 = [a1 characterAtIndex:v7];
      if (v6 != 39) {
        goto LABEL_16;
      }
      if (v8 != 39) {
        break;
      }
      [(NSMutableString *)v3 appendString:@"'"];
      v4 += 2;
LABEL_18:
      if (v4 >= v2) {
        return v3;
      }
    }
    while (1)
    {
      unsigned int v9 = [a1 characterAtIndex:v7];
      unsigned int v10 = v9;
      int v4 = v7 + 1;
      if (v7 + 1 >= v2)
      {
        if (v9 == 39) {
          goto LABEL_18;
        }
      }
      else
      {
        unsigned int v11 = [a1 characterAtIndex:v4];
        if (v10 == 39)
        {
          if (v11 != 39) {
            goto LABEL_18;
          }
          [(NSMutableString *)v3 appendString:@"'"];
          int v4 = v7 + 2;
          goto LABEL_13;
        }
      }
      [(NSMutableString *)v3 appendFormat:@"%C", v10];
LABEL_13:
      int v7 = v4;
      if (v4 >= v2) {
        goto LABEL_18;
      }
    }
  }
  return v3;
}

uint64_t sub_557DC(xmlTextReader *a1, void *a2)
{
  if (sub_43508(a1, objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject") + 2)) {
    return 1;
  }
  else {
    return 3;
  }
}

uint64_t sub_55828(xmlTextReader *a1, void *a2)
{
  if (sub_43488(a1, objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject") + 4)) {
    return 1;
  }
  else {
    return 3;
  }
}

uint64_t sub_55874(uint64_t a1, void *a2)
{
  int v4 = objc_alloc_init(GQDConnectionPath);
  objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
  objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);

  return 1;
}

uint64_t sub_55AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A45B0, 0, a3, a4, a5, a6, a7, a8, v15);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A45B0, &dword_0);
  sub_3FDC0((uint64_t)&unk_A45E0, "point", (uint64_t)sub_557DC, 0, 0, (uint64_t)&unk_A45B0);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A45E0, &dword_0);
  sub_381AC(qword_A4620, (uint64_t)&unk_A45E0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A4620, &dword_0);
  sub_3FDC0((uint64_t)&unk_A4638, "size", (uint64_t)sub_55828, 0, 0, (uint64_t)&unk_A45B0);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A4638, &dword_0);
  sub_381AC(qword_A4678, (uint64_t)&unk_A4638);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A4678, &dword_0);
  sub_3FBB0((uint64_t)&unk_A4690, (const xmlChar *)"size", v8, v9, v10, v11, v12, v13, (uint64_t)qword_A4678);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A4690, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3F40, "connection-path", (uint64_t)sub_55874, 0, 0, (uint64_t)&unk_A4690);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3F40, &dword_0);
}

BOOL sub_55CB4(void *a1)
{
  int v2 = +[NSFileManager defaultManager];
  id v3 = [a1 stringByAppendingPathComponent:@"Metadata"];
  return [(NSFileManager *)v2 fileExistsAtPath:v3 isDirectory:0];
}

id sub_55D10(void *a1)
{
  if ([a1 entryWithName:@"Index/Metadata.iwa"]) {
    return 0;
  }
  id v3 = [@"Metadata" length];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = objc_msgSend(a1, "allEntryNames", 0);
  id result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      for (CFIndex i = 0; i != v5; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "compare:options:range:", @"Metadata", 2, 0, v3))return &dword_0 + 1; {
      }
        }
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      id result = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return result;
}

BOOL sub_55E54(void *a1)
{
  return [a1 entryWithName:@"Index/Metadata.iwa"] != 0;
}

__CFString *sub_55E7C(uint64_t a1)
{
  unsigned int v1 = +[GQPProcessorFactory applicationForDocumentUti:a1]- 1;
  if (v1 > 2) {
    return &stru_85630;
  }
  else {
    return off_80940[v1];
  }
}

NSData *sub_55EC4(uint64_t a1, uint64_t a2)
{
  id v3 = -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"IMPORT_FAILURE_MESSAGE_FORMAT", @"<html><body style=\"font-family:Helvetica; font-size:14pt;\"><br/><br/><div align=\"center\"><b>%@</b></div><br><div align=\"center\">%@</div></body></html>",
         0);
  id v4 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"IMPORT_FAILURE_MESSAGE_TITLE" value:@"Sorry, this document can't be viewed." table:0];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  if (a2 == 1)
  {
    uint64_t v6 = @"PASSWORD_PROTECTED_MESSAGE_TEXT";
    int v7 = @"The document is password-protected.";
  }
  else
  {
    uint64_t v6 = @"IMPORT_FAILURE_MESSAGE_TEXT";
    int v7 = @"The document version may be unsupported or an error occurred while reading it.";
  }
  long long v8 = [+[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v4, [(NSBundle *)v5 localizedStringForKey:v6 value:v7 table:0]) dataUsingEncoding:4];
  CFRetain(v8);
  return v8;
}

uint64_t IWorkPreviewProcessWithURLAndOptions(const __CFURL *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_sync_enter(@"iWorkQuickLookSyncObject");
  CFStringRef PathComponent = CFURLCopyLastPathComponent(a1);
  CFArrayRef v67 = [[GQUProgressiveHelper alloc] initWithClient:a5 andCallbacks:a6];
  id v12 = [(__CFURL *)a1 path];
  uint64_t v62 = a6;
  uint64_t v63 = a5;
  id v13 = [a3 objectForKey:kQLPreviewOptionPasswordKey];
  context = v10;
  char v71 = 0;
  unsigned int v14 = [+[NSFileManager defaultManager] fileExistsAtPath:v12 isDirectory:&v71];
  if (v71) {
    unsigned int v15 = v14;
  }
  else {
    unsigned int v15 = 0;
  }
  if (v15 != 1)
  {
    id v22 = [objc_alloc((Class)SFUZipArchive) initWithPath:v12 collapseCommonRootDirectory:1];
    if ([v22 isEncrypted])
    {

      id v22 = objc_msgSend(objc_alloc((Class)SFUZipArchive), "initWithPath:collapseCommonRootDirectory:", -[__CFURL path](a1, "path"), 1);
      char v69 = 0;
      id v23 = sub_56B90(v13, 0, (uint64_t)[v22 passphraseVerifier], &v69);
      if (v69)
      {
        [v22 setCryptoKey:v23];
        unsigned int v20 = 0;
        id v21 = +[GQPProcessorFactory retainedProcessorForDocument:a1 zipArchive:v22 uti:a2 outputType:4 outputPath:0 previewRequest:0 progressiveHelper:v67];
        goto LABEL_47;
      }
      goto LABEL_32;
    }
    id v24 = [v22 entryWithName:@"QuickLook/Preview.pdf"];
    if (v24)
    {
      if (PathComponent) {
        CFRelease(PathComponent);
      }
      CFStringRef v25 = CFURLCopyLastPathComponent(a1);
      id v26 = [v24 data];
      CFStringRef PathComponent = v25;
      if (!v26) {
        goto LABEL_43;
      }
      goto LABEL_17;
    }
    float v40 = (__CFString *)kSFAPassphraseVerifierFilename;
    if ([v22 entryWithName:kSFAPassphraseVerifierFilename]
      || (float v40 = off_9D2C0, [v22 entryWithName:off_9D2C0]))
    {
      id v41 = objc_msgSend(objc_alloc((Class)NSData), "initWithData:", objc_msgSend(objc_msgSend(v22, "entryWithName:", v40), "data"));
      char v68 = 0;
      id v42 = sub_56B90(v13, 0, (uint64_t)v41, &v68);

      if (!v68)
      {
LABEL_32:
        unsigned int v20 = 0;
        id v21 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      id v42 = 0;
    }
    if (sub_55E54(v22))
    {
      unsigned int v20 = sub_56C44((uint64_t)v12, (uint64_t)PathComponent, v67, a2, (uint64_t)v13);
      id v21 = 0;
      goto LABEL_52;
    }
    id v59 = [objc_alloc((Class)TSUTemporaryDirectory) initWithError:0];
    id v60 = [objc_alloc((Class)NSString) initWithFormat:@"%@", PathComponent];
    id v61 = objc_msgSend(objc_msgSend(v59, "path"), "stringByAppendingPathComponent:", v60);
    if (objc_msgSend(objc_msgSend(objc_msgSend(v61, "pathExtension"), "lowercaseString"), "isEqualToString:", @"zip"))id v61 = objc_msgSend(v61, "stringByDeletingPathExtension"); {
    [v22 decompressAtPath:v61];
    }
    if (sub_55CB4(v61))
    {
      id v21 = 0;
      unsigned int v20 = sub_56C44((uint64_t)v61, (uint64_t)PathComponent, v67, a2, (uint64_t)v13);
    }
    else
    {
      if (v42)
      {

        id v22 = objc_msgSend(objc_alloc((Class)SFUZipArchive), "initWithPath:collapseCommonRootDirectory:", -[__CFURL path](a1, "path"), 1);
      }
      unsigned int v20 = 0;
      id v21 = +[GQPProcessorFactory retainedProcessorForDocument:a1 zipArchive:v22 uti:a2 outputType:4 outputPath:0 previewRequest:a4 progressiveHelper:v67 cryptoKey:v42];
    }
    [+[NSFileManager defaultManager] removeItemAtPath:v61 error:0];

    goto LABEL_47;
  }
  BOOL v16 = sub_55CB4(v12);
  id v17 = [v12 stringByAppendingPathComponent:kSFAPassphraseVerifierFilename];
  if (![+[NSFileManager defaultManager] fileExistsAtPath:v17])
  {
    id v17 = [v12 stringByAppendingPathComponent:off_9D2C0];
    if (![+[NSFileManager defaultManager] fileExistsAtPath:v17])
    {
      if (v16)
      {
        unsigned int v20 = sub_56C44((uint64_t)v12, (uint64_t)PathComponent, v67, a2, 0);
        id v21 = 0;
        id v22 = 0;
        goto LABEL_52;
      }
      id v44 = objc_msgSend(objc_msgSend(v12, "stringByAppendingPathComponent:", @"QuickLook"), "stringByAppendingPathComponent:", @"Preview.pdf");
      if (![+[NSFileManager defaultManager] fileExistsAtPath:v44])
      {
        id v39 = +[GQPProcessorFactory retainedProcessorForDocument:a1 zipArchive:0 uti:a2 outputType:4 outputPath:0 previewRequest:a4 progressiveHelper:v67 cryptoKey:0];
        goto LABEL_45;
      }
      if (PathComponent) {
        CFRelease(PathComponent);
      }
      CFStringRef v45 = CFURLCopyLastPathComponent(a1);
      id v26 = [objc_alloc((Class)NSData) initWithContentsOfFile:v44];
      id v46 = v26;
      id v22 = 0;
      CFStringRef PathComponent = v45;
      if (!v26)
      {
LABEL_43:
        id v21 = 0;
        int v43 = 0;
        unsigned int v20 = 1;
        goto LABEL_53;
      }
LABEL_17:
      double v27 = [[GQUProgressiveOutputBundle alloc] initWithHandler:v67];
      float v28 = CGDataProviderCreateWithCFData((CFDataRef)v26);
      double v29 = CGPDFDocumentCreateWithProvider(v28);
      CFRelease(v28);
      size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(v29);
      if (NumberOfPages)
      {
        uint64_t v31 = 0;
        float v32 = 0.0;
        double v33 = 0.0;
        double v34 = 8.0;
        do
        {
          Page = CGPDFDocumentGetPage(v29, ++v31);
          CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
          if (v33 < BoxRect.size.width + 15.0) {
            double v33 = BoxRect.size.width + 15.0;
          }
          float v36 = BoxRect.size.height + 8.0;
          double v34 = v34 + v36;
          if (v32 < v36) {
            float v32 = BoxRect.size.height + 8.0;
          }
        }
        while (NumberOfPages != v31);
        double v37 = v32;
        float v38 = v34;
      }
      else
      {
        float v38 = 8.0;
        double v37 = 0.0;
        double v33 = 0.0;
      }
      CFRelease(v29);
      id v47 = [[GQHXML alloc] initEmptyWithFilename:@"index.html" useExternalCss:1];
      [v47 startElement:"head"];
      LODWORD(v48) = 10.0;
      objc_msgSend(v47, "addViewportMetaTagForDocumentSize:maximumScale:", v33, v37, v48);
      if (PathComponent)
      {
        [v47 startElement:"title"];
        [v47 addContent:PathComponent];
        [v47 endElement];
      }
      [v47 endElement];
      [v47 startElement:"body"];
      [v47 setAttribute:"style" value:"margin: 0px; padding: 0px;"];
      [v47 startElement:"iframe"];
      float v49 = v33;
      LODWORD(v50) = vcvtps_s32_f32(v49);
      LODWORD(v51) = vcvtps_s32_f32(v38);
      CFStringRef v52 = CFStringCreateWithFormat(0, 0, @"border: 0px solid black; width: %dpx; height: %dpx;", v50, v51);
      [v47 setAttribute:"style" cfStringValue:v52];
      CFRelease(v52);
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(Mutable, kQLPreviewPropertyMIMETypeKey, @"application/pdf");
      CFDictionarySetValue(Mutable, kQLPreviewPropertyTextEncodingNameKey, @"UTF-8");
      CFURLRef v54 = [(GQUProgressiveHelper *)v67 createAttachment:@"preview.pdf" options:Mutable];
      CFRelease(Mutable);
      [(GQUProgressiveHelper *)v67 appendDataToAttachment:v54 chunk:v26];
      [(GQUProgressiveHelper *)v67 closeAttachment:v54];
      [v47 setAttribute:"src" cfStringValue:CFURLGetString(v54)];
      CFRelease(v54);
      [v47 endElement];
      [v47 endElement];
      id v55 = [v47 createProgressiveHtml];

      [(GQUProgressiveOutputBundle *)v27 setDataForMainHtmlResource:v55];
      CFRelease(v55);
      [(GQUProgressiveHelper *)v67 closeAttachment:0];
      goto LABEL_43;
    }
  }
  id v18 = [objc_alloc((Class)NSData) initWithContentsOfFile:v17];
  char v70 = 0;
  id v19 = sub_56B90(v13, 0, (uint64_t)v18, &v70);

  if (!v70)
  {
    unsigned int v20 = 0;
    id v21 = 0;
    id v22 = 0;
LABEL_33:
    int v43 = 1;
    goto LABEL_53;
  }
  if (!v16)
  {
    id v39 = +[GQPProcessorFactory retainedProcessorForDocument:a1 zipArchive:0 uti:a2 outputType:4 outputPath:0 previewRequest:0 progressiveHelper:v67 cryptoKey:v19];
LABEL_45:
    id v21 = v39;
    unsigned int v20 = 0;
    goto LABEL_46;
  }
  unsigned int v20 = sub_56C44((uint64_t)v12, (uint64_t)PathComponent, v67, a2, (uint64_t)v13);
  id v21 = 0;
LABEL_46:
  id v22 = 0;
LABEL_47:
  if (v21)
  {
    [v21 setProgressiveMode:1];
    unsigned int v20 = [v21 go];
    int v43 = 0;
    goto LABEL_53;
  }
LABEL_52:
  int v43 = 0;
LABEL_53:
  if (PathComponent) {
    CFRelease(PathComponent);
  }
  if ((v43 | 2) == 2)
  {
    if (!v20)
    {
      if (a4) {
        sub_57A84((NSString *)+[GQPProcessorFactory applicationForDocumentUti:a2], v67);
      }
      CFErrorRef v56 = CFErrorCreate(0, @"QuickLookErrorDomain", -1, 0);
      (*(void (**)(uint64_t, CFErrorRef))(v62 + 32))(v63, v56);
      CFRelease(v56);
    }

    int v43 = 0;
  }
  if (v43) {
    uint64_t v57 = 4;
  }
  else {
    uint64_t v57 = (v20 != 0) - 1;
  }
  objc_sync_exit(@"iWorkQuickLookSyncObject");
  return v57;
}

void sub_56A8C(void *a1, int a2)
{
  if (a2 == 2) {
    objc_end_catch();
  }
  JUMPOUT(0x56804);
}

id sub_56B90(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 0;
  id v7 = [a1 UTF8String];
  id v8 = 0;
  if (a1)
  {
    if (v7)
    {
      id v8 = objc_msgSend(objc_alloc((Class)SFUCryptoKey), "initAes128KeyFromPassphrase:iterationCount:saltData:", a1, +[SFUCryptoUtils iterationCountFromPassphraseVerifier:](SFUCryptoUtils, "iterationCountFromPassphraseVerifier:", a3), +[SFUCryptoUtils saltFromVerifier:saltLength:](SFUCryptoUtils, "saltFromVerifier:saltLength:", a3, 16));
      if (v8) {
        *a4 = +[SFUCryptoUtils checkKey:v8 againstPassphraseVerifier:a3];
      }
    }
  }
  return v8;
}

BOOL sub_56C44(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8 = [objc_alloc((Class)TQQuicklook) initWithPath:a1 passphrase:a5];
  uint64_t v9 = +[GQPProcessorFactory applicationForDocumentUti:a4];
  if ([v8 load])
  {
    uint64_t v75 = a2;
    v80 = a3;
    BOOL v74 = v9 == 2;
    if (v9 == 2) {
      id v77 = 0;
    }
    else {
      id v77 = [v8 pageCount];
    }
    long long v11 = 0;
    id v12 = 0;
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    uint64_t v15 = v9;
    unsigned int v78 = v9;
    id v76 = v8;
    while (1)
    {
      CFDataRef v16 = (const __CFData *)[v8 newPDFForPageNumber:v14 + 1];
      if (!v16) {
        break;
      }
      CFDataRef v17 = v16;
      CFDataRef v84 = v16;
      if (!v14)
      {
        double v85 = 0.0;
        double v86 = 8.0;
        sub_57E34(v16, &v85);
        id v18 = [[GQUProgressiveOutputBundle alloc] initWithHandler:v80];
        id v12 = v18;
        if (v15 == 3)
        {
          -[GQUProgressiveOutputBundle setDocumentSize:](v18, "setDocumentSize:", (double)(int)(v85 + 32.0), v86 + 32.0 + 32.0 + 1.0);
          [(GQUProgressiveOutputBundle *)v12 startProgressiveData];
          long long v11 = [[GQHXML alloc] initWithFilename:@"index.html" documentSize:&v85 outputBundle:v12 useExternalCss:1];
          [(GQHXML *)v11 startElement:"head"];
          if (v75)
          {
            [(GQHXML *)v11 startElement:"title"];
            [(GQHXML *)v11 addContent:v75];
            [(GQHXML *)v11 endElement];
          }
          sub_57EC8(v11);
          [(GQHXML *)v11 startElement:"style"];
          id v19 = (NSString *)qword_A46E8;
          if (!qword_A46E8)
          {
            id v19 = [+[UIFont systemFontOfSize:17.0] familyName];
            qword_A46E8 = (uint64_t)v19;
          }
          CFStringRef v20 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"body {margin: 0;}\n .navpane-sheet {font-size:%f; font-family: -apple-system, \"%@\"; color: %@;\n",
                  0x4031000000000000,
                  v19,
                  qword_A46C0);
          [(GQHXML *)v11 addContent:v20];
          CFRelease(v20);
          CFStringRef v21 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"border-style: solid; border-width: %f; border-color: %@;",
                  0x3FF0000000000000,
                  qword_A46E0);
          [(GQHXML *)v11 addContent:v21];
          CFRelease(v21);
          CFStringRef v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"text-decoration:none; white-space: nowrap; overflow:hidden; text-overflow:ellipsis; background-color: %@;}\n",
                  qword_A46D0);
          [(GQHXML *)v11 addContent:v22];
          CFRelease(v22);
          CFStringRef v23 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @".navpane-sheet.selected {color: %@; background-color: %@;}\n",
                  qword_A46C8,
                  qword_A46D8);
          [(GQHXML *)v11 addContent:v23];
          CFRelease(v23);
          CFStringRef v24 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @".navbar {position: absolute; max-height: %dpx; max-width: %dpx; overflow-x:scroll;}\n",
                  64,
                  771);
          [(GQHXML *)v11 addContent:v24];
          CFRelease(v24);
          CFStringRef v25 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"div {padding-top: %dpx; text-align: center; vertical-align: middle; white-space: nowrap; display: inline-block}\n",
                  5);
          [(GQHXML *)v11 addContent:v25];
          CFRelease(v25);
          [(GQHXML *)v11 endElement];
          [(GQHXML *)v11 startElement:"body"];
          [(GQHXML *)v11 setAttribute:"bgcolor" value:"white"];
          [(GQHXML *)v11 startElement:"div"];
          [(GQHXML *)v11 setAttribute:"id" cfStringValue:@"wrapper"];
          CFStringRef v26 = CFStringCreateWithFormat(0, 0, @"position:absolute; top:%d; left:0; right:0;", 32);
          [(GQHXML *)v11 setAttribute:"style" cfStringValue:v26];
          CFRelease(v26);
          [(GQHXML *)v11 endElement];
          CFDataRef v17 = v84;
          uint64_t v15 = v78;
        }
        else
        {
          -[GQUProgressiveOutputBundle setDocumentSize:](v18, "setDocumentSize:", v85, v86);
          [(GQUProgressiveOutputBundle *)v12 startProgressiveData];
          long long v11 = [[GQHXML alloc] initWithFilename:@"index.html" documentSize:&v85 outputBundle:v12 useExternalCss:1];
          double v87 = 0.0;
          double v88 = 8.0;
          sub_57E34(v17, &v87);
          LODWORD(v27) = 10.0;
          -[GQHXML addViewportMetaTagForDocumentSize:maximumScale:](v11, "addViewportMetaTagForDocumentSize:maximumScale:", v87, v88, v27);
          if (v75)
          {
            [(GQHXML *)v11 startElement:"title"];
            [(GQHXML *)v11 addContent:v75];
            [(GQHXML *)v11 endElement];
          }
          uint64_t v28 = v15;
          [(GQHXML *)v11 endElement];
          [(GQHXML *)v11 startElement:"body"];
          [(GQHXML *)v11 setAttribute:"style" value:"margin: 0px; padding: 0px;"];
          [(GQHXML *)v11 setAttribute:"bgcolor" cfStringValue:@"white"];
          if ([(GQHXML *)v11 isProgressive])
          {
            double v29 = [(GQHXML *)v11 createProgressiveeCSSwithStyleTags:0];
            [(GQUProgressiveOutputBundle *)v12 setData:v29 mimeType:@"text/css" forNamedResource:[(GQHXML *)v11 cssFilename]];
            CFRelease(v29);
          }
          double v30 = [(GQHXML *)v11 createProgressiveHtml];
          [(GQUProgressiveOutputBundle *)v12 setDataForMainHtmlResource:v30];
          CFRelease(v30);
          uint64_t v15 = v28;
        }
      }
      unint64_t v81 = v14 + 1;
      if (v15 == 3)
      {
        int v83 = v11;
        LOBYTE(v85) = 1;
        do
        {
          uint64_t v31 = v13++;
          id v32 = [v8 sheetNameForPageNumber:v31 isForm:&v85];
        }
        while (LOBYTE(v85));
        id v33 = v32;
        CFStringRef v34 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"sheet_%d.html", v14);
        v79 = [(GQUProgressiveOutputBundle *)v12 createUriForResource:v34];
        id v35 = [[GQHXML alloc] initEmptyWithFilename:v34 useExternalCss:1];
        [v35 addMetaTagWithTextFormat:@"UTF-8"];
        double v87 = 0.0;
        double v88 = 8.0;
        sub_57E34(v84, &v87);
        double v37 = v87;
        double v36 = v88;
        LODWORD(v38) = 10.0;
        objc_msgSend(v35, "addViewportMetaTagForDocumentSize:maximumScale:", v87, v88, v38);
        [v35 endElement];
        [v35 startElement:"script"];
        [v35 setAttribute:"type" value:"text/javascript"];
        [v35 addContent:@"function adjust_iframe_dimensions(){\n    var actual_height = document.body.scrollHeight;\n    var actual_width = document.body.scrollWidth;\n    var dim = {height:actual_height, width: actual_width};\n    parent.postMessage(dim,\"*\");\n}\n"];
        CFRelease(@"function adjust_iframe_dimensions(){\n    var actual_height = document.body.scrollHeight;\n    var actual_width = document.body.scrollWidth;\n    var dim = {height:actual_height, width: actual_width};\n    parent.postMessage(dim,\"*\");\n}\n");
        [v35 endElement];
        [v35 startElement:"body"];
        [v35 setAttribute:"bgcolor" value:"white"];
        [v35 setAttribute:"onload" value:"adjust_iframe_dimensions()"];
        [v35 startElement:"div"];
        [v35 startElement:"img"];
        unint64_t v39 = v14;
        CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFDictionarySetValue(Mutable, kQLPreviewPropertyMIMETypeKey, @"application/pdf");
        CFDictionarySetValue(Mutable, kQLPreviewPropertyTextEncodingNameKey, @"UTF-8");
        CFStringRef v41 = CFStringCreateWithFormat(0, 0, @"preview%d.pdf", v39);
        id v42 = v12;
        CFURLRef v43 = (const __CFURL *)[v80 createAttachment:v41 options:Mutable];
        CFRelease(Mutable);
        [v80 appendDataToAttachment:v43 chunk:v84];
        uint64_t v44 = v39;
        [v80 closeAttachment:v43];
        [v35 setAttribute:"src" cfStringValue:CFURLGetString(v43)];
        float v45 = v37;
        LODWORD(v46) = vcvtps_s32_f32(v45);
        [v35 setAttribute:"width" intValue:v46];
        float v47 = v36;
        LODWORD(v48) = vcvtps_s32_f32(v47);
        [v35 setAttribute:"height" intValue:v48];
        CFRelease(v41);
        CFURLRef v49 = v43;
        id v12 = v42;
        CFRelease(v49);
        [v35 endElementWithExpectedName:"img"];
        [v35 endElementWithExpectedName:"div"];
        [v35 writeToOutputBundle:v42 isThumbnail:0];

        uint64_t v50 = "navpane-sheet";
        long long v11 = v83;
        if (!v44)
        {
          [(GQHXML *)v83 startElement:"iframe"];
          [(GQHXML *)v83 setAttribute:"id" cfStringValue:@"SheetFrame"];
          [(GQHXML *)v83 setAttribute:"src" cfStringValue:v79];
          CFStringRef v51 = CFStringCreateWithFormat(0, 0, @"position:absolute; top:%d; left:0; right:0;", 32);
          CFStringRef v52 = CFStringCreateWithFormat(0, 0, @"border:0; %@", v51);
          [(GQHXML *)v83 setAttribute:"style" cfStringValue:v52];
          [(GQHXML *)v83 setAttribute:"name" value:"sheetPane"];
          CFRelease(v52);
          CFRelease(v51);
          [(GQHXML *)v83 endElement];
          [(GQHXML *)v83 endElement];
          [(GQHXML *)v83 startElement:"div"];
          [(GQHXML *)v83 setAttribute:"id" cfStringValue:@"navmask"];
          long long v11 = v83;
          CFStringRef v53 = CFStringCreateWithFormat(0, 0, @"position:absolute; top:0; left:0; right:0; bottom:%dpx; height:%dpx; overflow: hidden",
                  32,
                  32);
          [(GQHXML *)v83 setAttribute:"style" cfStringValue:v53];
          CFRelease(v53);
          [(GQHXML *)v83 startElement:"div"];
          [(GQHXML *)v83 setAttribute:"id" cfStringValue:@"navbar"];
          CFStringRef v54 = CFStringCreateWithFormat(0, 0, @"position:absolute; top:0; left:0; right:0; bottom:%dpx; height:%dpx;",
                  64,
                  64);
          [(GQHXML *)v83 setAttribute:"style" cfStringValue:v54];
          CFRelease(v54);
          [(GQHXML *)v83 setAttribute:"class" cfStringValue:@"navbar"];
          uint64_t v50 = "navpane-sheet selected";
        }
        [(GQHXML *)v11 startElement:"div"];
        CFStringRef v55 = CFStringCreateWithFormat(0, 0, @"javascript:SelectSheet(%d, '%@');", v44, v79);
        [(GQHXML *)v11 setAttribute:"onclick" cfStringValue:v55];
        CFRelease(v55);
        CFStringRef v56 = CFStringCreateWithFormat(0, 0, @"Tab%d", v44);
        [(GQHXML *)v11 setAttribute:"id" cfStringValue:v56];
        CFRelease(v56);
        [(GQHXML *)v11 setAttribute:"href" value:"#"];
        [(GQHXML *)v11 setAttribute:"title" cfStringValue:v33];
        [(GQHXML *)v11 setAttribute:"class" value:v50];
        CFStringRef v57 = CFStringCreateWithFormat(0, 0, @"position:absolute; overflow:hidden;  top:%d; left:%d; width:%d; height:%d;",
                0,
                (147 * v44),
                147,
                30);
        [(GQHXML *)v11 setAttribute:"style" cfStringValue:v57];
        CFRelease(v57);
        CFStringRef v58 = CFStringCreateWithFormat(0, 0, @" %@", v33);
        [(GQHXML *)v11 addContent:v33];
        CFRelease(v58);
        [(GQHXML *)v11 endElement];
        CFRelease(v34);
        CFRelease(v79);
        uint64_t v59 = v78;
        id v8 = v76;
        unint64_t v61 = v81;
        id v60 = v82;
        CFDataRef v62 = v84;
      }
      else
      {
        double v87 = 0.0;
        double v88 = 8.0;
        sub_57E34(v17, &v87);
        [(GQHXML *)v11 startElement:"div"];
        [(GQHXML *)v11 setAttribute:"class" cfStringValue:&stru_85630];
        [(GQHXML *)v11 startElement:"img"];
        uint64_t v59 = v15;
        uint64_t v63 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFDictionarySetValue(v63, kQLPreviewPropertyMIMETypeKey, @"application/pdf");
        CFDictionarySetValue(v63, kQLPreviewPropertyTextEncodingNameKey, @"UTF-8");
        CFStringRef v64 = CFStringCreateWithFormat(0, 0, @"preview%d.pdf", v14);
        uint64_t v65 = v12;
        CFURLRef v66 = (const __CFURL *)[v80 createAttachment:v64 options:v63];
        CFStringRef v67 = v64;
        CFDataRef v62 = v84;
        CFRelease(v67);
        CFRelease(v63);
        [v80 appendDataToAttachment:v66 chunk:v84];
        [v80 closeAttachment:v66];
        [(GQHXML *)v11 setAttribute:"src" cfStringValue:CFURLGetString(v66)];
        [(GQHXML *)v11 setAttribute:"width" cfStringValue:@"100%"];
        CFURLRef v68 = v66;
        id v12 = v65;
        CFRelease(v68);
        [(GQHXML *)v11 endElementWithExpectedName:"img"];
        unint64_t v61 = v81;
        [(GQHXML *)v11 endElementWithExpectedName:"div"];
        char v69 = [(GQHXML *)v11 createProgressiveHtml];
        [(GQUProgressiveOutputBundle *)v65 setDataForMainHtmlResource:v69];
        CFRelease(v69);
        id v60 = v82;
      }

      unint64_t v14 = v61;
      uint64_t v15 = v59;
      if (v59 != 2)
      {
        unint64_t v14 = v61;
        if (v61 >= (unint64_t)v77)
        {
          int v70 = 1;
          goto LABEL_31;
        }
      }
    }
    int v70 = v74;
LABEL_31:
    [(GQHXML *)v11 endElement];
    [(GQHXML *)v11 endElement];
    if (v15 == 3)
    {
      [(GQHXML *)v11 endElement];
      [(GQHXML *)v11 endElement];
      [(GQHXML *)v11 writeToOutputBundle:v12 isThumbnail:0];
    }
    else
    {
      char v71 = [(GQHXML *)v11 createProgressiveHtml];
      if (v71)
      {
        uint64_t v72 = v71;
        [(GQUProgressiveOutputBundle *)v12 setDataForMainHtmlResource:v71];
        CFRelease(v72);
      }
    }
    [v80 closeAttachment:0];

    BOOL v10 = v70 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  [v8 close];

  return v10;
}

NSString *sub_57A84(NSString *result, void *a2)
{
  if (result)
  {
    int v3 = (int)result;
    id result = (NSString *)[a2 progressiveStreamStarted];
    if (result)
    {
      id result = (NSString *)[a2 previewHasStreamedMainHTML];
      if (result)
      {
        id v4 = 0;
      }
      else
      {
        id result = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"IWORK_READ_ERROR_MESSAGE" value:@"This document can not be previewed." table:0];
        id v4 = result;
      }
      switch(v3)
      {
        case 1:
          if (!v4) {
            id v4 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"IWORK_KEY_PROG_ERROR_MESSAGE" value:@"This presentation is only partially previewed." table:0];
          }
          uint64_t v6 = -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"IWORK_KEY_PROG_ERROR_HTML", @"<div id=\"slideId_Error\" class = \"slideStyle\" style=\"width:%f; height:%f\"><div align=\"center\" style=\" margin-left:auto; margin-right:auto; margin-top:-170px; top:50%%; position:relative; width:400px; height:340px\"><img align=\"center\" src=\"%@\" width=\"240\" height=\"240\"/><div style=\" width:400px; height:48px;\"><div style = \"position:relative;align:center;font-family:'Helvetica';font-size:14pt;font-style:bold;color:rgb(180, 180, 180);\"><br>%@</div ></div></div></div></body></html>",
                 0);
          CFURLRef v5 = 0;
          id v7 = @"partial-preview-keynote";
          break;
        case 2:
          if (!v4) {
            id v4 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"IWORK_PAGES_PROG_ERROR_MESSAGE" value:@"This document is only partially previewed." table:0];
          }
          uint64_t v6 = -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"IWORK_PAGES_PROG_ERROR_HTML", @"<div class=\"i2\" style=\"width:%f; height:%f\" > <div style=\"padding-top:0;left:50%%; margin-left:-200px; margin-top:-170px; top:50%%; position:absolute; width:400px; height:340px\"><img style=\"align:center; margin-left:80px; \" src=%@ width=\"240\" height=\"240\"/><div style=\" width:400px; height:48px;\"><div style=\"position:relative; text-align:center; font-family:'Helvetica Neue'; font-size:14pt;    font-style:bold; color:rgb(180, 180, 180);\"><br>%@</div ></div></div></div></body></html>",
                 0);
          CFURLRef v5 = 0;
          id v7 = @"partial-preview-pages";
          break;
        case 3:
          CFURLRef v5 = CFURLCreateWithString(0, (CFStringRef)[a2 getNumbersSheetUri], 0);
          if (!v4) {
            id v4 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"IWORK_NUM_PROG_ERROR_MESSAGE" value:@"This spreadsheet is only partially previewed." table:0];
          }
          uint64_t v6 = -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"IWORK_NUM_PROG_ERROR_HTML", @"<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><body><div style=\"width:%fpx; height:%fpx;\"><div align=\"center\" style=\"margin-left:auto; margin-right:auto; margin-top:-180px; top:50%%; position:relative; width:400px; height:340px\"><img align=\"center\" src=\"%@\" width=\"240\" height=\"240\"/><div style=\" width:400px; height:48px;\">    <div style = \"position:relative; align:center; font-family:'Helvetica'; font-size:14pt;font-style:bold;color:rgb(180, 180, 180);\"><br>%@</div ></div></div></div></body></html>",
                 0);
          id v7 = @"partial-preview-numbers";
          break;
        default:
          return result;
      }
      id v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:", -[NSBundle pathForResource:ofType:](+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", @"com.apple.iwork.iWorkQuickLookGenerator"), "pathForResource:ofType:", v7, @"png"));
      if (v8)
      {
        CFURLRef v9 = (const __CFURL *)[a2 createAttachment:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.png", v7), +[NSDictionary dictionary](NSDictionary, "dictionary") options];
        [a2 appendDataToAttachment:v9 chunk:v8];
        [a2 closeAttachment:v9];
      }
      else
      {
        CFURLRef v9 = 0;
      }
      [a2 getPreviewWidth];
      double v11 = v10;
      [a2 getPreviewHeight];
      [a2 appendDataToAttachment:v5, -[NSString dataUsingEncoding:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, *(void *)&v11, v12, CFURLGetString(v9), v4), "dataUsingEncoding:", 4) chunk];
      if (v5)
      {
        [a2 closeAttachment:v9];
        CFRelease(v5);
      }
      if (v8) {

      }
      if (v9) {
        CFRelease(v9);
      }
      return (NSString *)sub_3AC08();
    }
  }
  return result;
}

void sub_57E34(const __CFData *a1, double *a2)
{
  int v3 = CGDataProviderCreateWithCFData(a1);
  id v4 = CGPDFDocumentCreateWithProvider(v3);
  CFRelease(v3);
  Page = CGPDFDocumentGetPage(v4, 1uLL);
  CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
  double v6 = BoxRect.size.width + 15.0;
  double v7 = a2[1];
  if (*a2 >= v6) {
    double v6 = *a2;
  }
  float v8 = BoxRect.size.height + 8.0;
  *a2 = v6;
  a2[1] = v7 + v8;
  CFRelease(v4);
}

uint64_t sub_57EC8(void *a1)
{
  [a1 startElement:"script"];
  [a1 setAttribute:"type" value:"text/javascript"];
  [a1 addContent:@"\n// Create IE + others compatible event handler\nvar eventMethod = window.addEventListener ? \"addEventListener\" : \"attachEvent\";\nvar eventer = window[eventMethod];\nvar messageEvent = eventMethod == \"attachEvent\" ? \"onmessage\" : \"message\";\n\n// Listen to message from child window\neventer(messageEvent,function(e) {\n    document.getElementById('SheetFrame').height = e.data.height + 'px';\n    document.getElementById('SheetFrame').width = e.data.width + 'px';\n},false);\n\n"];
  CFRelease(@"\n// Create IE + others compatible event handler\nvar eventMethod = window.addEventListener ? \"addEventListener\" : \"attachEvent\";\nvar eventer = window[eventMethod];\nvar messageEvent = eventMethod == \"attachEvent\" ? \"onmessage\" : \"message\";\n\n// Listen to message from child window\neventer(messageEvent,function(e) {\n    document.getElementById('SheetFrame').height = e.data.height + 'px';\n    document.getElementById('SheetFrame').width = e.data.width + 'px';\n},false);\n\n");
  [a1 addContent:@"Element.prototype.addClassName = function addClassName(className){\n    if (!this.hasClassName(className))\n        this.className += ' ' + className;\n};\n\n"];
  CFRelease(@"Element.prototype.addClassName = function addClassName(className){\n    if (!this.hasClassName(className))\n        this.className += ' ' + className;\n};\n\n");
  [a1 addContent:@"Element.prototype.removeClassName = function removeClassName(className){\n    // Test for the simple case before using a RegExp.\n    if (this.className === className)\n        this.className = \"\";\n    else\n        this.removeMatchingClassNames(className.escapeForRegExp());\n};\n\n"];
  CFRelease(@"Element.prototype.removeClassName = function removeClassName(className){\n    // Test for the simple case before using a RegExp.\n    if (this.className === className)\n        this.className = \"\";\n    else\n        this.removeMatchingClassNames(className.escapeForRegExp());\n};\n\n");
  objc_msgSend(a1, "addContent:", @"Element.prototype.removeMatchingClassNames = function removeMatchingClassNames(classNameRegex){\n    var regedouble x = new RegExp(\"(^|\\\\s+)\" + classNameRegex + \"($|\\\\s+)\");\n    if (regex.test(this.className))\n        this.className = this.className.replace(regex, \" \");\n};\n\n");
  CFRelease(@"Element.prototype.removeMatchingClassNames = function removeMatchingClassNames(classNameRegex){\n    var regedouble x = new RegExp(\"(^|\\\\s+)\" + classNameRegex + \"($|\\\\s+)\");\n    if (regex.test(this.className))\n        this.className = this.className.replace(regex, \" \");\n};\n\n");
  [a1 addContent:@"Element.prototype.hasClassName = function hasClassName(className){\n    if (!className)\n        return false;\n    if (this.className === className)\n        return true;\n    var regedouble x = new RegExp(\"(^|\\\\s)\" + className.escapeForRegExp() + \"($|\\\\s)\""];
  CFRelease(@"Element.prototype.hasClassName = function hasClassName(className){\n    if (!className)\n        return false;\n    if (this.className === className)\n        return true;\n    var regedouble x = new RegExp(\"(^|\\\\s)\" + className.escapeForRegExp() + \"($|\\\\s)\");\n    return regex.test(this.className);\n};\n\n");
  [a1 addContent:@"String.prototype.escapeForRegExp = function escapeForRegExp(){\n    return this.escapeCharacters(\"^[]{}()\\.$*+?|\""];
  CFRelease(@"String.prototype.escapeForRegExp = function escapeForRegExp(){\n    return this.escapeCharacters(\"^[]{}()\\.$*+?|\");\n};\n\n");
  [a1 addContent:@"String.prototype.escapeCharacters = function escapeCharacters(chars){\n    var foundChar = false;\n    for (var i = 0; i < chars.length; ++i) {\n        if (this.indexOf(chars.charAt(i)) !== -1) {\n            foundChar = true;\n            break;\n        }\n    }\n\n    if (!foundChar)\n        return this;\n\n    var id result = \"\";\n    for (var j = 0; j < this.length; ++j) {\n        if (chars.indexOf(this.charAt(j)) !== -1)\n            result += \"\\\\\";\n        result += this.charAt(j);\n    }\n\n    return result;\n};\n\n"];
  CFRelease(@"String.prototype.escapeCharacters = function escapeCharacters(chars){\n    var foundChar = false;\n    for (var i = 0; i < chars.length; ++i) {\n        if (this.indexOf(chars.charAt(i)) !== -1) {\n            foundChar = true;\n            break;\n        }\n    }\n\n    if (!foundChar)\n        return this;\n\n    var id result = \"\";\n    for (var j = 0; j < this.length; ++j) {\n        if (chars.indexOf(this.charAt(j)) !== -1)\n            result += \"\\\\\";\n        result += this.charAt(j);\n    }\n\n    return result;\n};\n\n");
  CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"var borderColor = \"%@\";\nvar backgroundColor = \"%@\";\n",
         qword_A46E0,
         qword_A46D0);
  [a1 addContent:v2];
  CFRelease(v2);
  [a1 addContent:@"var _tabChanged = false;\nfunction SelectSheet(sheetNumber, sheetURL){\n    _tabChanged = true;\n    var navbar = document.getElementById('navbar');\n    var navChildren = navbar.children;\n    for (var j=0; j < navChildren.length; j++) {\n        var navChild = navChildren[j];\n        var navElementName = navChild.id;\n        if (navElementName == (\"Tab\"+sheetNumber)) {\n            navChild.addClassName(\"selected\");\n            document.getElementById('SheetFrame').src = sheetURL;\n        }\n        else {\n            if (navChild.classList.contains(\"selected\")) {\n                navChild.removeClassName(\"selected\");\n            }\n            if (navElementName == (\"Tab\"+(sheetNumber - 1))) {\n                navChild.style.borderRightColor = backgroundColor;\n            }\n            else {\n                navChild.style.borderRightColor = borderColor;\n            }\n        }\n    }\n}\n\n"];
  CFRelease(@"var _tabChanged = false;\nfunction SelectSheet(sheetNumber, sheetURL){\n    _tabChanged = true;\n    var navbar = document.getElementById('navbar');\n    var navChildren = navbar.children;\n    for (var j=0; j < navChildren.length; j++) {\n        var navChild = navChildren[j];\n        var navElementName = navChild.id;\n        if (navElementName == (\"Tab\"+sheetNumber)) {\n            navChild.addClassName(\"selected\");\n            document.getElementById('SheetFrame').src = sheetURL;\n        }\n        else {\n            if (navChild.classList.contains(\"selected\")) {\n                navChild.removeClassName(\"selected\");\n            }\n            if (navElementName == (\"Tab\"+(sheetNumber - 1))) {\n                navChild.style.borderRightColor = backgroundColor;\n            }\n            else {\n                navChild.style.borderRightColor = borderColor;\n            }\n        }\n    }\n}\n\n");
  [a1 addContent:@"function ScrollNavBar(scrollX) {\n    var navBar = document.getElementById('navbar');\n    navBar.scrollLeft += scrollX;\n}\n\n"];
  CFRelease(@"function ScrollNavBar(scrollX) {\n    var navBar = document.getElementById('navbar');\n    navBar.scrollLeft += scrollX;\n}\n\n");
  [a1 addContent:@"function ReloadFirstSheetIfNeeded(sheetURL)\n{\n    if (_tabChanged == false) {\n        SelectSheet(0, sheetURL);\n    }\n}\n\n"];
  CFRelease(@"function ReloadFirstSheetIfNeeded(sheetURL)\n{\n    if (_tabChanged == false) {\n        SelectSheet(0, sheetURL);\n    }\n}\n\n");
  [a1 endElement];
  return 0;
}

CFStringRef sub_58080()
{
  qword_A46C0 = (uint64_t)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"rgba(%d,%d,%d,%f)", 100, 100, 100, 0x3FF0000000000000);
  qword_A46C8 = (uint64_t)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"rgba(%d,%d,%d,%f)", 255, 255, 255, 0x3FF0000000000000);
  qword_A46D0 = (uint64_t)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"rgba(%d,%d,%d,%f)", 239, 239, 244, 0x3FF0000000000000);
  qword_A46D8 = (uint64_t)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"rgba(%d,%d,%d,%f)", 0, 166, 80, 0x3FF0000000000000);
  CFStringRef result = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"rgba(%d,%d,%d,%f)", 191, 191, 191, 0x3FF0000000000000);
  qword_A46E0 = (uint64_t)result;
  return result;
}

id sub_583D0(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(GQDArcPath);
  id v5 = (id)[(GQDArcPath *)v4 readAttributesFromReader:a1 processor:a2];
  if (v5 == 1)
  {
    objc_msgSend(objc_msgSend(objc_msgSend(a2, "documentState"), "root"), "addIdentifiedObject:fromCurrentNode:", v4, a1);
    objc_msgSend(objc_msgSend(a2, "documentState"), "pushObject:", v4);
  }

  return v5;
}

uint64_t sub_58454(xmlTextReader *a1, void *a2)
{
  if (sub_43488(a1, objc_msgSend(objc_msgSend(a2, "documentState"), "peekObject") + 2)) {
    return 1;
  }
  else {
    return 3;
  }
}

uint64_t sub_58894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3FBB0((uint64_t)&unk_A3F80, 0, a3, a4, a5, a6, a7, a8, v15);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A3F80, &dword_0);
  sub_3FDC0((uint64_t)&unk_A3FB0, "size", (uint64_t)sub_58454, 0, 0, (uint64_t)&unk_A3F80);
  __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A3FB0, &dword_0);
  sub_381AC(qword_A3FF0, (uint64_t)&unk_A3FB0);
  __cxa_atexit((void (*)(void *))j_nullsub_2_5, qword_A3FF0, &dword_0);
  sub_3FBB0((uint64_t)&unk_A4008, (const xmlChar *)"size", v8, v9, v10, v11, v12, v13, (uint64_t)qword_A3FF0);
  __cxa_atexit((void (*)(void *))sub_3FB08, &unk_A4008, &dword_0);
  sub_3FDC0((uint64_t)&unk_A4038, "SFDArcPathSource", (uint64_t)sub_583D0, 0, 0, (uint64_t)&unk_A4008);
  return __cxa_atexit((void (*)(void *))sub_3FD10, &unk_A4038, &dword_0);
}

uint64_t sub_58A04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return _CFBundleCopyLocalizedString(bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return _CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return _CFBundleGetBundleWithIdentifier(bundleID);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return _CFBundleGetMainBundle();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return _CFDateFormatterCreate(allocator, locale, dateStyle, timeStyle);
}

CFDateRef CFDateFormatterCreateDateFromString(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep)
{
  return _CFDateFormatterCreateDateFromString(allocator, formatter, string, rangep);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return _CFDateFormatterCreateStringWithDate(allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFArrayRef CFLocaleCopyCommonISOCurrencyCodes(void)
{
  return _CFLocaleCopyCommonISOCurrencyCodes();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return _CFLocaleCopyCurrent();
}

CFStringRef CFLocaleCopyDisplayNameForPropertyValue(CFLocaleRef displayLocale, CFLocaleKey key, CFStringRef value)
{
  return _CFLocaleCopyDisplayNameForPropertyValue(displayLocale, key, value);
}

CFArrayRef CFLocaleCopyISOCurrencyCodes(void)
{
  return _CFLocaleCopyISOCurrencyCodes();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return _CFLocaleCreate(allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return _CFLocaleCreateCanonicalLocaleIdentifierFromString(allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return _CFLocaleCreateComponentsFromLocaleIdentifier(allocator, localeID);
}

CFLocaleIdentifier CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary)
{
  return _CFLocaleCreateLocaleIdentifierFromComponents(allocator, dictionary);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return _CFLocaleGetIdentifier(locale);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return _CFLocaleGetSystem();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return _CFLocaleGetValue(locale, key);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeRef CFNumberFormatterCopyProperty(CFNumberFormatterRef formatter, CFNumberFormatterKey key)
{
  return _CFNumberFormatterCopyProperty(formatter, key);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return _CFNumberFormatterCreate(allocator, locale, style);
}

CFStringRef CFNumberFormatterCreateStringWithValue(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberType numberType, const void *valuePtr)
{
  return _CFNumberFormatterCreateStringWithValue(allocator, formatter, numberType, valuePtr);
}

Boolean CFNumberFormatterGetDecimalInfoForCurrencyCode(CFStringRef currencyCode, int32_t *defaultFractionDigits, double *roundingIncrement)
{
  return _CFNumberFormatterGetDecimalInfoForCurrencyCode(currencyCode, defaultFractionDigits, roundingIncrement);
}

CFStringRef CFNumberFormatterGetFormat(CFNumberFormatterRef formatter)
{
  return _CFNumberFormatterGetFormat(formatter);
}

Boolean CFNumberFormatterGetValueFromString(CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFNumberType numberType, void *valuePtr)
{
  return _CFNumberFormatterGetValueFromString(formatter, string, rangep, numberType, valuePtr);
}

void CFNumberFormatterSetFormat(CFNumberFormatterRef formatter, CFStringRef formatString)
{
}

void CFNumberFormatterSetProperty(CFNumberFormatterRef formatter, CFNumberFormatterKey key, CFTypeRef value)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return _CFSetContainsValue(theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return _CFSetCreate(allocator, values, numValues, callBacks);
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return _CFStringConvertEncodingToNSStringEncoding(encoding);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return _CFStringCreateByCombiningStrings(alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFRange v5 = _CFStringFind(theString, stringToFind, compareOptions);
  CFIndex length = v5.length;
  CFIndex location = v5.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return _CFStringFindAndReplace(theString, stringToFind, replacementString, rangeToSearch, compareOptions);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return _CFStringFindWithOptions(theString, stringToFind, rangeToSearch, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return _CFStringGetCharacterAtIndex(theString, idx);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  return _CFStringGetDoubleValue(str);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return _CFStringGetMaximumSizeOfFileSystemRepresentation(string);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return _CFStringGetSystemEncoding();
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return _CFStringHasSuffix(theString, suffix);
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return _CFStringTransform(string, range, transform, reverse);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return _CFTimeZoneCreateWithTimeIntervalFromGMT(allocator, ti);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return _CFURLCopyAbsoluteURL(relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return _CFURLCopyFileSystemPath(anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return _CFURLCopyLastPathComponent(url);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return _CFURLCopyPathExtension(url);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return _CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return _CFURLCreateWithString(allocator, URLString, baseURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return _CFURLGetString(anURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return _CGColorCreate(space, components);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return _CGColorGetComponents(color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return _CGColorGetNumberOfComponents(color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return _CGColorSpaceCreateDeviceCMYK();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

uint64_t CGColorTransformConvertColor()
{
  return _CGColorTransformConvertColor();
}

uint64_t CGColorTransformCreate()
{
  return _CGColorTransformCreate();
}

uint64_t CGColorTransformRelease()
{
  return _CGColorTransformRelease();
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return _CGDataProviderCreateWithCFData(data);
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return _CGPDFDocumentCreateWithProvider(provider);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return _CGPDFDocumentGetNumberOfPages(document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return _CGPDFDocumentGetPage(document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  return _CGPDFPageGetBoxRect(page, box);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddLines(CGMutablePathRef path, const CGAffineTransform *m, const CGPoint *points, size_t count)
{
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return _CGPathContainsPoint(path, m, point, eoFill);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return _CGPathCreateCopy(path);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return _CGPathCreateCopyByTransformingPath(path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithRect(rect, transform);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  return _CGPathGetBoundingBox(path);
}

CGPoint CGPathGetCurrentPoint(CGPathRef path)
{
  CGPoint CurrentPoint = _CGPathGetCurrentPoint(path);
  double y = CurrentPoint.y;
  double x = CurrentPoint.x;
  result.double y = y;
  result.double x = x;
  return result;
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  return _CGPathGetPathBoundingBox(path);
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return _CGPathIsEmpty(path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

CFStringRef CTFontCopyFamilyName(CTFontRef font)
{
  return _CTFontCopyFamilyName(font);
}

CFStringRef CTFontCopyFullName(CTFontRef font)
{
  return _CTFontCopyFullName(font);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return _CTFontCreateWithName(name, size, matrix);
}

CTFontSymbolicTraits CTFontGetSymbolicTraits(CTFontRef font)
{
  return _CTFontGetSymbolicTraits(font);
}

NSMapTable *__cdecl NSCreateMapTable(NSMapTableKeyCallBacks *keyCallBacks, NSMapTableValueCallBacks *valueCallBacks, NSUInteger capacity)
{
  return _NSCreateMapTable(keyCallBacks, valueCallBacks, capacity);
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return _NSMapGet(table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

NSRect NSUnionRect(NSRect aRect, NSRect bRect)
{
  return _NSUnionRect(aRect, bRect);
}

uint64_t OIChartingCreatePDFDataWithFormatterCallback()
{
  return _OIChartingCreatePDFDataWithFormatterCallback();
}

uint64_t TSWPDefaultLineHeightForFont()
{
  return _TSWPDefaultLineHeightForFont();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t Path::ConvertWithBackData(Path *this, float a2)
{
  return Path::ConvertWithBackData(this, a2);
}

uint64_t Path::Fill(Path *a1, Shape *a2, int a3, BOOL a4, BOOL a5, BOOL a6)
{
  return Path::Fill(a1, a2, a3, a4, a5, a6);
}

uint64_t Path::Close(Path *this)
{
  return Path::Close(this);
}

uint64_t Path::LineTo(Path *this, float a2, float a3)
{
  return Path::LineTo(this, a2, a3);
}

uint64_t Path::MoveTo(Path *this, float a2, float a3)
{
  return Path::MoveTo(this, a2, a3);
}

uint64_t Path::CubicTo(Path *this, float a2, float a3, float a4, float a5, float a6, float a7)
{
  return Path::CubicTo(this, a2, a3, a4, a5, a6, a7);
}

void Path::Path(Path *this)
{
}

void Path::~Path(Path *this)
{
}

uint64_t Shape::ConvertToForme(Shape *this, Path *a2, int a3, Path **a4)
{
  return Shape::ConvertToForme(this, a2, a3, a4);
}

uint64_t Shape::ConvertToShape()
{
  return Shape::ConvertToShape();
}

uint64_t Shape::Booleen()
{
  return Shape::Booleen();
}

void Shape::Shape(Shape *this)
{
}

void Shape::~Shape(Shape *this)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return std::__sort<std::__less<float,float> &,float *>();
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_call_unexpected(void *a1)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

int __fpclassifyd(double a1)
{
  return ___fpclassifyd(a1);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

long double acos(long double __x)
{
  return _acos(__x);
}

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

double atof(const char *a1)
{
  return _atof(a1);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return _bsearch(__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return _class_getInstanceVariable(cls, name);
}

int close(int a1)
{
  return _close(a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return _crc32(crc, buf, len);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double exp2(long double __x)
{
  return _exp2(__x);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return _fseeko(__stream, a2, __whence);
}

int fsync(int a1)
{
  return _fsync(a1);
}

off_t ftello(FILE *__stream)
{
  return _ftello(__stream);
}

int gzclose(gzFile file)
{
  return _gzclose(file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return _gzdopen(fd, mode);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return _gzerror(file, errnum);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return _gzread(file, buf, len);
}

int heapsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return _heapsort(__base, __nel, __width, __compar);
}

void htmlDocDumpMemory(xmlDocPtr cur, xmlChar **mem, int *size)
{
}

htmlDocPtr htmlNewDoc(const xmlChar *URI, const xmlChar *ExternalID)
{
  return _htmlNewDoc(URI, ExternalID);
}

const htmlElemDesc *__cdecl htmlTagLookup(const xmlChar *tag)
{
  return _htmlTagLookup(tag);
}

float hypotf(float a1, float a2)
{
  return _hypotf(a1, a2);
}

int inflate(z_streamp strm, int flush)
{
  return _inflate(strm, flush);
}

int inflateEnd(z_streamp strm)
{
  return _inflateEnd(strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return _inflateInit2_(strm, windowBits, version, stream_size);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return _ivar_getOffset(v);
}

long double log10(long double __x)
{
  return _log10(__x);
}

long double log2(long double __x)
{
  return _log2(__x);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

double strtod(const char *a1, char **a2)
{
  return _strtod(a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

long double tan(long double __x)
{
  return _tan(__x);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xmlNodePtr xmlAddChild(xmlNodePtr parent, xmlNodePtr cur)
{
  return _xmlAddChild(parent, cur);
}

xmlParserInputBufferPtr xmlAllocParserInputBuffer(xmlCharEncoding enc)
{
  return _xmlAllocParserInputBuffer(enc);
}

void xmlBufferWriteQuotedString(xmlBufferPtr buf, const xmlChar *string)
{
}

xmlParserCtxtPtr xmlCreatePushParserCtxt(xmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename)
{
  return _xmlCreatePushParserCtxt(sax, user_data, chunk, size, filename);
}

xmlNodePtr xmlDocSetRootElement(xmlDocPtr doc, xmlNodePtr root)
{
  return _xmlDocSetRootElement(doc, root);
}

xmlChar *__cdecl xmlEncodeEntitiesReentrant(xmlDocPtr doc, const xmlChar *input)
{
  return _xmlEncodeEntitiesReentrant(doc, input);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeNode(xmlNodePtr cur)
{
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
}

void xmlFreeParserInputBuffer(xmlParserInputBufferPtr in)
{
}

void xmlFreeTextReader(xmlTextReaderPtr reader)
{
}

xmlErrorPtr xmlGetLastError(void)
{
  return _xmlGetLastError();
}

void xmlInitParser(void)
{
}

xmlNodePtr xmlNewCharRef(xmlDocPtr doc, const xmlChar *name)
{
  return _xmlNewCharRef(doc, name);
}

xmlDtdPtr xmlNewDtd(xmlDocPtr doc, const xmlChar *name, const xmlChar *ExternalID, const xmlChar *SystemID)
{
  return _xmlNewDtd(doc, name, ExternalID, SystemID);
}

xmlNodePtr xmlNewNode(xmlNsPtr ns, const xmlChar *name)
{
  return _xmlNewNode(ns, name);
}

xmlNsPtr xmlNewNs(xmlNodePtr node, const xmlChar *href, const xmlChar *prefix)
{
  return _xmlNewNs(node, href, prefix);
}

xmlNodePtr xmlNewText(const xmlChar *content)
{
  return _xmlNewText(content);
}

void xmlNodeAddContent(xmlNodePtr cur, const xmlChar *content)
{
}

int xmlOutputBufferClose(xmlOutputBufferPtr out)
{
  return _xmlOutputBufferClose(out);
}

xmlOutputBufferPtr xmlOutputBufferCreateIO(xmlOutputWriteCallback iowrite, xmlOutputCloseCallback ioclose, void *ioctx, xmlCharEncodingHandlerPtr encoder)
{
  return _xmlOutputBufferCreateIO(iowrite, ioclose, ioctx, encoder);
}

int xmlOutputBufferWriteString(xmlOutputBufferPtr out, const char *str)
{
  return _xmlOutputBufferWriteString(out, str);
}

int xmlParseChunk(xmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return _xmlParseChunk(ctxt, chunk, size, terminate);
}

xmlDocPtr xmlReadIO(xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void *ioctx, const char *URL, const char *encoding, int options)
{
  return _xmlReadIO(ioread, ioclose, ioctx, URL, encoding, options);
}

xmlTextReaderPtr xmlReaderForIO(xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void *ioctx, const char *URL, const char *encoding, int options)
{
  return _xmlReaderForIO(ioread, ioclose, ioctx, URL, encoding, options);
}

void xmlSetGenericErrorFunc(void *ctx, xmlGenericErrorFunc handler)
{
}

xmlAttrPtr xmlSetProp(xmlNodePtr node, const xmlChar *name, const xmlChar *value)
{
  return _xmlSetProp(node, name, value);
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return _xmlStrEqual(str1, str2);
}

int xmlStrPrintf(xmlChar *buf, int len, const char *msg, ...)
{
  return _xmlStrPrintf(buf, len, msg);
}

int xmlStrcasecmp(const xmlChar *str1, const xmlChar *str2)
{
  return _xmlStrcasecmp(str1, str2);
}

int xmlStrcmp(const xmlChar *str1, const xmlChar *str2)
{
  return _xmlStrcmp(str1, str2);
}

xmlChar *__cdecl xmlStrdup(const xmlChar *cur)
{
  return _xmlStrdup(cur);
}

int xmlStrlen(const xmlChar *str)
{
  return _xmlStrlen(str);
}

int xmlStrncasecmp(const xmlChar *str1, const xmlChar *str2, int len)
{
  return _xmlStrncasecmp(str1, str2, len);
}

const xmlChar *__cdecl xmlStrstr(const xmlChar *str, const xmlChar *val)
{
  return _xmlStrstr(str, val);
}

const xmlChar *__cdecl xmlTextReaderConstLocalName(xmlTextReaderPtr reader)
{
  return _xmlTextReaderConstLocalName(reader);
}

const xmlChar *__cdecl xmlTextReaderConstValue(xmlTextReaderPtr reader)
{
  return _xmlTextReaderConstValue(reader);
}

int xmlTextReaderDepth(xmlTextReaderPtr reader)
{
  return _xmlTextReaderDepth(reader);
}

xmlChar *__cdecl xmlTextReaderGetAttributeNs(xmlTextReaderPtr reader, const xmlChar *localName, const xmlChar *namespaceURI)
{
  return _xmlTextReaderGetAttributeNs(reader, localName, namespaceURI);
}

int xmlTextReaderNext(xmlTextReaderPtr reader)
{
  return _xmlTextReaderNext(reader);
}

int xmlTextReaderNodeType(xmlTextReaderPtr reader)
{
  return _xmlTextReaderNodeType(reader);
}

int xmlTextReaderRead(xmlTextReaderPtr reader)
{
  return _xmlTextReaderRead(reader);
}

xmlChar *__cdecl xmlURIEscapeStr(const xmlChar *str, const xmlChar *list)
{
  return _xmlURIEscapeStr(str, list);
}

void xmlUnlinkNode(xmlNodePtr cur)
{
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return [a1 ID];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLFragmentAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLFragmentAllowedCharacterSet];
}

id objc_msgSend_URLHostAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLHostAllowedCharacterSet];
}

id objc_msgSend_URLPasswordAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLPasswordAllowedCharacterSet];
}

id objc_msgSend_URLPathAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLPathAllowedCharacterSet];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_URLUserAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLUserAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__createWebPreferencesForRendering(void *a1, const char *a2, ...)
{
  return [a1 _createWebPreferencesForRendering];
}

id objc_msgSend_aboutToReadCells(void *a1, const char *a2, ...)
{
  return [a1 aboutToReadCells];
}

id objc_msgSend_aboutToReadColumnVectors(void *a1, const char *a2, ...)
{
  return [a1 aboutToReadColumnVectors];
}

id objc_msgSend_aboutToReadRowVectors(void *a1, const char *a2, ...)
{
  return [a1 aboutToReadRowVectors];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_actionStack(void *a1, const char *a2, ...)
{
  return [a1 actionStack];
}

id objc_msgSend_allEntryNames(void *a1, const char *a2, ...)
{
  return [a1 allEntryNames];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowInlineWrap(void *a1, const char *a2, ...)
{
  return [a1 allowInlineWrap];
}

id objc_msgSend_alphaComponent(void *a1, const char *a2, ...)
{
  return [a1 alphaComponent];
}

id objc_msgSend_alphaMaskBezier(void *a1, const char *a2, ...)
{
  return [a1 alphaMaskBezier];
}

id objc_msgSend_alwaysPutReadCellsInArray(void *a1, const char *a2, ...)
{
  return [a1 alwaysPutReadCellsInArray];
}

id objc_msgSend_amount(void *a1, const char *a2, ...)
{
  return [a1 amount];
}

id objc_msgSend_anchorLocation(void *a1, const char *a2, ...)
{
  return [a1 anchorLocation];
}

id objc_msgSend_angle(void *a1, const char *a2, ...)
{
  return [a1 angle];
}

id objc_msgSend_appBundleCanProcessCurrentDocVersion(void *a1, const char *a2, ...)
{
  return [a1 appBundleCanProcessCurrentDocVersion];
}

id objc_msgSend_appNamespace(void *a1, const char *a2, ...)
{
  return [a1 appNamespace];
}

id objc_msgSend_arcWidth(void *a1, const char *a2, ...)
{
  return [a1 arcWidth];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_arrowLength(void *a1, const char *a2, ...)
{
  return [a1 arrowLength];
}

id objc_msgSend_arrowWidth(void *a1, const char *a2, ...)
{
  return [a1 arrowWidth];
}

id objc_msgSend_attachmentPosition(void *a1, const char *a2, ...)
{
  return [a1 attachmentPosition];
}

id objc_msgSend_attachmentWrapType(void *a1, const char *a2, ...)
{
  return [a1 attachmentWrapType];
}

id objc_msgSend_beginWrapPointSet(void *a1, const char *a2, ...)
{
  return [a1 beginWrapPointSet];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blueComponent(void *a1, const char *a2, ...)
{
  return [a1 blueComponent];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_bookmark(void *a1, const char *a2, ...)
{
  return [a1 bookmark];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottom(void *a1, const char *a2, ...)
{
  return [a1 bottom];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cIndex(void *a1, const char *a2, ...)
{
  return [a1 cIndex];
}

id objc_msgSend_catagoryTitle(void *a1, const char *a2, ...)
{
  return [a1 catagoryTitle];
}

id objc_msgSend_cellCountInColumns(void *a1, const char *a2, ...)
{
  return [a1 cellCountInColumns];
}

id objc_msgSend_cellStyle(void *a1, const char *a2, ...)
{
  return [a1 cellStyle];
}

id objc_msgSend_cells(void *a1, const char *a2, ...)
{
  return [a1 cells];
}

id objc_msgSend_characterStyle(void *a1, const char *a2, ...)
{
  return [a1 characterStyle];
}

id objc_msgSend_chart(void *a1, const char *a2, ...)
{
  return [a1 chart];
}

id objc_msgSend_chartData(void *a1, const char *a2, ...)
{
  return [a1 chartData];
}

id objc_msgSend_childFrames(void *a1, const char *a2, ...)
{
  return [a1 childFrames];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return [a1 children];
}

id objc_msgSend_clearWrapPoints(void *a1, const char *a2, ...)
{
  return [a1 clearWrapPoints];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeLocalStream(void *a1, const char *a2, ...)
{
  return [a1 closeLocalStream];
}

id objc_msgSend_closeStateLayoutElementsAndStyles(void *a1, const char *a2, ...)
{
  return [a1 closeStateLayoutElementsAndStyles];
}

id objc_msgSend_collapseCommonRootDirectory(void *a1, const char *a2, ...)
{
  return [a1 collapseCommonRootDirectory];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_coloredBackground(void *a1, const char *a2, ...)
{
  return [a1 coloredBackground];
}

id objc_msgSend_column(void *a1, const char *a2, ...)
{
  return [a1 column];
}

id objc_msgSend_columnCount(void *a1, const char *a2, ...)
{
  return [a1 columnCount];
}

id objc_msgSend_columnIndex(void *a1, const char *a2, ...)
{
  return [a1 columnIndex];
}

id objc_msgSend_columnNames(void *a1, const char *a2, ...)
{
  return [a1 columnNames];
}

id objc_msgSend_columnSpan(void *a1, const char *a2, ...)
{
  return [a1 columnSpan];
}

id objc_msgSend_columns(void *a1, const char *a2, ...)
{
  return [a1 columns];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createBezierPath(void *a1, const char *a2, ...)
{
  return [a1 createBezierPath];
}

id objc_msgSend_createFormattedValue(void *a1, const char *a2, ...)
{
  return [a1 createFormattedValue];
}

id objc_msgSend_createHtml(void *a1, const char *a2, ...)
{
  return [a1 createHtml];
}

id objc_msgSend_createOutputDictionary(void *a1, const char *a2, ...)
{
  return [a1 createOutputDictionary];
}

id objc_msgSend_createProgressiveHtml(void *a1, const char *a2, ...)
{
  return [a1 createProgressiveHtml];
}

id objc_msgSend_createStringValue(void *a1, const char *a2, ...)
{
  return [a1 createStringValue];
}

id objc_msgSend_createStyle(void *a1, const char *a2, ...)
{
  return [a1 createStyle];
}

id objc_msgSend_createTierStringNumber(void *a1, const char *a2, ...)
{
  return [a1 createTierStringNumber];
}

id objc_msgSend_cropGeometry(void *a1, const char *a2, ...)
{
  return [a1 cropGeometry];
}

id objc_msgSend_cryptoKey(void *a1, const char *a2, ...)
{
  return [a1 cryptoKey];
}

id objc_msgSend_cssFilename(void *a1, const char *a2, ...)
{
  return [a1 cssFilename];
}

id objc_msgSend_currencyCode(void *a1, const char *a2, ...)
{
  return [a1 currencyCode];
}

id objc_msgSend_currentAttachmentId(void *a1, const char *a2, ...)
{
  return [a1 currentAttachmentId];
}

id objc_msgSend_currentAttachmentPosition(void *a1, const char *a2, ...)
{
  return [a1 currentAttachmentPosition];
}

id objc_msgSend_currentDrawableZOrder(void *a1, const char *a2, ...)
{
  return [a1 currentDrawableZOrder];
}

id objc_msgSend_currentDrawablesGenerator(void *a1, const char *a2, ...)
{
  return [a1 currentDrawablesGenerator];
}

id objc_msgSend_currentLevel(void *a1, const char *a2, ...)
{
  return [a1 currentLevel];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentLocaleCurrencyCode(void *a1, const char *a2, ...)
{
  return [a1 currentLocaleCurrencyCode];
}

id objc_msgSend_currentOverlapCell(void *a1, const char *a2, ...)
{
  return [a1 currentOverlapCell];
}

id objc_msgSend_currentSlide(void *a1, const char *a2, ...)
{
  return [a1 currentSlide];
}

id objc_msgSend_currentTableGenerator(void *a1, const char *a2, ...)
{
  return [a1 currentTableGenerator];
}

id objc_msgSend_currentTablePosition(void *a1, const char *a2, ...)
{
  return [a1 currentTablePosition];
}

id objc_msgSend_currentWrapPointGenerator(void *a1, const char *a2, ...)
{
  return [a1 currentWrapPointGenerator];
}

id objc_msgSend_customNumberFormatTokens(void *a1, const char *a2, ...)
{
  return [a1 customNumberFormatTokens];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataLength(void *a1, const char *a2, ...)
{
  return [a1 dataLength];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return [a1 direction];
}

id objc_msgSend_doCalculateThumbnailSize(void *a1, const char *a2, ...)
{
  return [a1 doCalculateThumbnailSize];
}

id objc_msgSend_doExternalTextWrap(void *a1, const char *a2, ...)
{
  return [a1 doExternalTextWrap];
}

id objc_msgSend_documentReleaseVersion(void *a1, const char *a2, ...)
{
  return [a1 documentReleaseVersion];
}

id objc_msgSend_documentState(void *a1, const char *a2, ...)
{
  return [a1 documentState];
}

id objc_msgSend_doneProperty(void *a1, const char *a2, ...)
{
  return [a1 doneProperty];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return [a1 drain];
}

id objc_msgSend_drawable(void *a1, const char *a2, ...)
{
  return [a1 drawable];
}

id objc_msgSend_drawables(void *a1, const char *a2, ...)
{
  return [a1 drawables];
}

id objc_msgSend_drawablesNeedCssZOrdering(void *a1, const char *a2, ...)
{
  return [a1 drawablesNeedCssZOrdering];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endElement(void *a1, const char *a2, ...)
{
  return [a1 endElement];
}

id objc_msgSend_endPoint(void *a1, const char *a2, ...)
{
  return [a1 endPoint];
}

id objc_msgSend_endSection(void *a1, const char *a2, ...)
{
  return [a1 endSection];
}

id objc_msgSend_endSheet(void *a1, const char *a2, ...)
{
  return [a1 endSheet];
}

id objc_msgSend_endWrapPointSet(void *a1, const char *a2, ...)
{
  return [a1 endWrapPointSet];
}

id objc_msgSend_enterGraphicObject(void *a1, const char *a2, ...)
{
  return [a1 enterGraphicObject];
}

id objc_msgSend_entryNames(void *a1, const char *a2, ...)
{
  return [a1 entryNames];
}

id objc_msgSend_equalColumns(void *a1, const char *a2, ...)
{
  return [a1 equalColumns];
}

id objc_msgSend_externalTextWrap(void *a1, const char *a2, ...)
{
  return [a1 externalTextWrap];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return [a1 filename];
}

id objc_msgSend_finishMainHtml(void *a1, const char *a2, ...)
{
  return [a1 finishMainHtml];
}

id objc_msgSend_finishedWithSplitAttachment(void *a1, const char *a2, ...)
{
  return [a1 finishedWithSplitAttachment];
}

id objc_msgSend_firstAttachmentId(void *a1, const char *a2, ...)
{
  return [a1 firstAttachmentId];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return [a1 firstIndex];
}

id objc_msgSend_firstVisibleColumn(void *a1, const char *a2, ...)
{
  return [a1 firstVisibleColumn];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_floatingDrawablesCount(void *a1, const char *a2, ...)
{
  return [a1 floatingDrawablesCount];
}

id objc_msgSend_floatingWrapEnabled(void *a1, const char *a2, ...)
{
  return [a1 floatingWrapEnabled];
}

id objc_msgSend_floatingWrapType(void *a1, const char *a2, ...)
{
  return [a1 floatingWrapType];
}

id objc_msgSend_footer(void *a1, const char *a2, ...)
{
  return [a1 footer];
}

id objc_msgSend_footerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 footerIdentifier];
}

id objc_msgSend_footerRowCount(void *a1, const char *a2, ...)
{
  return [a1 footerRowCount];
}

id objc_msgSend_footnotes(void *a1, const char *a2, ...)
{
  return [a1 footnotes];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_formatString(void *a1, const char *a2, ...)
{
  return [a1 formatString];
}

id objc_msgSend_fraction(void *a1, const char *a2, ...)
{
  return [a1 fraction];
}

id objc_msgSend_fractionAccuracy(void *a1, const char *a2, ...)
{
  return [a1 fractionAccuracy];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frameView(void *a1, const char *a2, ...)
{
  return [a1 frameView];
}

id objc_msgSend_generator(void *a1, const char *a2, ...)
{
  return [a1 generator];
}

id objc_msgSend_generatorBeginWasCalled(void *a1, const char *a2, ...)
{
  return [a1 generatorBeginWasCalled];
}

id objc_msgSend_generatorState(void *a1, const char *a2, ...)
{
  return [a1 generatorState];
}

id objc_msgSend_geometry(void *a1, const char *a2, ...)
{
  return [a1 geometry];
}

id objc_msgSend_getDateFormat(void *a1, const char *a2, ...)
{
  return [a1 getDateFormat];
}

id objc_msgSend_getNumbersSheetUri(void *a1, const char *a2, ...)
{
  return [a1 getNumbersSheetUri];
}

id objc_msgSend_getPreviewHeight(void *a1, const char *a2, ...)
{
  return [a1 getPreviewHeight];
}

id objc_msgSend_getPreviewWidth(void *a1, const char *a2, ...)
{
  return [a1 getPreviewWidth];
}

id objc_msgSend_go(void *a1, const char *a2, ...)
{
  return [a1 go];
}

id objc_msgSend_graphicStyle(void *a1, const char *a2, ...)
{
  return [a1 graphicStyle];
}

id objc_msgSend_greenComponent(void *a1, const char *a2, ...)
{
  return [a1 greenComponent];
}

id objc_msgSend_groupLevel(void *a1, const char *a2, ...)
{
  return [a1 groupLevel];
}

id objc_msgSend_hasBody(void *a1, const char *a2, ...)
{
  return [a1 hasBody];
}

id objc_msgSend_hasFooters(void *a1, const char *a2, ...)
{
  return [a1 hasFooters];
}

id objc_msgSend_hasFormulaValue(void *a1, const char *a2, ...)
{
  return [a1 hasFormulaValue];
}

id objc_msgSend_hasHeaders(void *a1, const char *a2, ...)
{
  return [a1 hasHeaders];
}

id objc_msgSend_hasHorizontalFlip(void *a1, const char *a2, ...)
{
  return [a1 hasHorizontalFlip];
}

id objc_msgSend_hasPagesOrder(void *a1, const char *a2, ...)
{
  return [a1 hasPagesOrder];
}

id objc_msgSend_hasSpacing(void *a1, const char *a2, ...)
{
  return [a1 hasSpacing];
}

id objc_msgSend_hasValidDecimalPlaces(void *a1, const char *a2, ...)
{
  return [a1 hasValidDecimalPlaces];
}

id objc_msgSend_hasVerticalFlip(void *a1, const char *a2, ...)
{
  return [a1 hasVerticalFlip];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_headAngle(void *a1, const char *a2, ...)
{
  return [a1 headAngle];
}

id objc_msgSend_header(void *a1, const char *a2, ...)
{
  return [a1 header];
}

id objc_msgSend_headerColumnCount(void *a1, const char *a2, ...)
{
  return [a1 headerColumnCount];
}

id objc_msgSend_headerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 headerIdentifier];
}

id objc_msgSend_headerRowCount(void *a1, const char *a2, ...)
{
  return [a1 headerRowCount];
}

id objc_msgSend_horizontalFlip(void *a1, const char *a2, ...)
{
  return [a1 horizontalFlip];
}

id objc_msgSend_href(void *a1, const char *a2, ...)
{
  return [a1 href];
}

id objc_msgSend_htmlBlue(void *a1, const char *a2, ...)
{
  return [a1 htmlBlue];
}

id objc_msgSend_htmlDoc(void *a1, const char *a2, ...)
{
  return [a1 htmlDoc];
}

id objc_msgSend_htmlGreen(void *a1, const char *a2, ...)
{
  return [a1 htmlGreen];
}

id objc_msgSend_htmlRed(void *a1, const char *a2, ...)
{
  return [a1 htmlRed];
}

id objc_msgSend_imageBinary(void *a1, const char *a2, ...)
{
  return [a1 imageBinary];
}

id objc_msgSend_implicitStyle(void *a1, const char *a2, ...)
{
  return [a1 implicitStyle];
}

id objc_msgSend_inContent(void *a1, const char *a2, ...)
{
  return [a1 inContent];
}

id objc_msgSend_inProgressiveMode(void *a1, const char *a2, ...)
{
  return [a1 inProgressiveMode];
}

id objc_msgSend_incrementCellPosition(void *a1, const char *a2, ...)
{
  return [a1 incrementCellPosition];
}

id objc_msgSend_incrementColumnSpan(void *a1, const char *a2, ...)
{
  return [a1 incrementColumnSpan];
}

id objc_msgSend_incrementCurrentSlide(void *a1, const char *a2, ...)
{
  return [a1 incrementCurrentSlide];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initEmpty(void *a1, const char *a2, ...)
{
  return [a1 initEmpty];
}

id objc_msgSend_initWithHead(void *a1, const char *a2, ...)
{
  return [a1 initWithHead];
}

id objc_msgSend_inlineWrapEnabled(void *a1, const char *a2, ...)
{
  return [a1 inlineWrapEnabled];
}

id objc_msgSend_inputStream(void *a1, const char *a2, ...)
{
  return [a1 inputStream];
}

id objc_msgSend_insertAttachmentPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 insertAttachmentPlaceholder];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidateFilteredImage(void *a1, const char *a2, ...)
{
  return [a1 invalidateFilteredImage];
}

id objc_msgSend_invalidateTextScale(void *a1, const char *a2, ...)
{
  return [a1 invalidateTextScale];
}

id objc_msgSend_isBlank(void *a1, const char *a2, ...)
{
  return [a1 isBlank];
}

id objc_msgSend_isCounting(void *a1, const char *a2, ...)
{
  return [a1 isCounting];
}

id objc_msgSend_isCustom(void *a1, const char *a2, ...)
{
  return [a1 isCustom];
}

id objc_msgSend_isDateFormat(void *a1, const char *a2, ...)
{
  return [a1 isDateFormat];
}

id objc_msgSend_isDurationFormat(void *a1, const char *a2, ...)
{
  return [a1 isDurationFormat];
}

id objc_msgSend_isEncrypted(void *a1, const char *a2, ...)
{
  return [a1 isEncrypted];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isFilled(void *a1, const char *a2, ...)
{
  return [a1 isFilled];
}

id objc_msgSend_isGeneratingThumbnail(void *a1, const char *a2, ...)
{
  return [a1 isGeneratingThumbnail];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isLoading(void *a1, const char *a2, ...)
{
  return [a1 isLoading];
}

id objc_msgSend_isMappingHeadersFooters(void *a1, const char *a2, ...)
{
  return [a1 isMappingHeadersFooters];
}

id objc_msgSend_isNameVisible(void *a1, const char *a2, ...)
{
  return [a1 isNameVisible];
}

id objc_msgSend_isNumberFormat(void *a1, const char *a2, ...)
{
  return [a1 isNumberFormat];
}

id objc_msgSend_isProgressive(void *a1, const char *a2, ...)
{
  return [a1 isProgressive];
}

id objc_msgSend_isReadingStorageAttachments(void *a1, const char *a2, ...)
{
  return [a1 isReadingStorageAttachments];
}

id objc_msgSend_isSpecialCustomNumberFormatToken(void *a1, const char *a2, ...)
{
  return [a1 isSpecialCustomNumberFormatToken];
}

id objc_msgSend_isStreamed(void *a1, const char *a2, ...)
{
  return [a1 isStreamed];
}

id objc_msgSend_isStreaming(void *a1, const char *a2, ...)
{
  return [a1 isStreaming];
}

id objc_msgSend_isTextFormat(void *a1, const char *a2, ...)
{
  return [a1 isTextFormat];
}

id objc_msgSend_isThumbnailGenerationDone(void *a1, const char *a2, ...)
{
  return [a1 isThumbnailGenerationDone];
}

id objc_msgSend_isVisible(void *a1, const char *a2, ...)
{
  return [a1 isVisible];
}

id objc_msgSend_isWrongFormat(void *a1, const char *a2, ...)
{
  return [a1 isWrongFormat];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_labelType(void *a1, const char *a2, ...)
{
  return [a1 labelType];
}

id objc_msgSend_lastAttachmentPosition(void *a1, const char *a2, ...)
{
  return [a1 lastAttachmentPosition];
}

id objc_msgSend_lastCellRead(void *a1, const char *a2, ...)
{
  return [a1 lastCellRead];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return [a1 layoutFrame];
}

id objc_msgSend_layoutStorage(void *a1, const char *a2, ...)
{
  return [a1 layoutStorage];
}

id objc_msgSend_layoutStyle(void *a1, const char *a2, ...)
{
  return [a1 layoutStyle];
}

id objc_msgSend_leaveGraphicObject(void *a1, const char *a2, ...)
{
  return [a1 leaveGraphicObject];
}

id objc_msgSend_left(void *a1, const char *a2, ...)
{
  return [a1 left];
}

id objc_msgSend_legend(void *a1, const char *a2, ...)
{
  return [a1 legend];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_listLevel(void *a1, const char *a2, ...)
{
  return [a1 listLevel];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_loadAppBundleResourceToColorMap(void *a1, const char *a2, ...)
{
  return [a1 loadAppBundleResourceToColorMap];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainFrame(void *a1, const char *a2, ...)
{
  return [a1 mainFrame];
}

id objc_msgSend_maskingShapePath(void *a1, const char *a2, ...)
{
  return [a1 maskingShapePath];
}

id objc_msgSend_maxCanvasPoint(void *a1, const char *a2, ...)
{
  return [a1 maxCanvasPoint];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_moveToNextAttachmentPosition(void *a1, const char *a2, ...)
{
  return [a1 moveToNextAttachmentPosition];
}

id objc_msgSend_multiColumned(void *a1, const char *a2, ...)
{
  return [a1 multiColumned];
}

id objc_msgSend_mustRegisterDrawables(void *a1, const char *a2, ...)
{
  return [a1 mustRegisterDrawables];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_naturalBounds(void *a1, const char *a2, ...)
{
  return [a1 naturalBounds];
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return [a1 naturalSize];
}

id objc_msgSend_needAbsolutelyPositionedTables(void *a1, const char *a2, ...)
{
  return [a1 needAbsolutelyPositionedTables];
}

id objc_msgSend_newPDFPreviewAndClose(void *a1, const char *a2, ...)
{
  return [a1 newPDFPreviewAndClose];
}

id objc_msgSend_nextAttachmentId(void *a1, const char *a2, ...)
{
  return [a1 nextAttachmentId];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nextSplitTableIndex(void *a1, const char *a2, ...)
{
  return [a1 nextSplitTableIndex];
}

id objc_msgSend_nonrotatedPosition(void *a1, const char *a2, ...)
{
  return [a1 nonrotatedPosition];
}

id objc_msgSend_noteFrame(void *a1, const char *a2, ...)
{
  return [a1 noteFrame];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objectStackDepth(void *a1, const char *a2, ...)
{
  return [a1 objectStackDepth];
}

id objc_msgSend_originalTableHeight(void *a1, const char *a2, ...)
{
  return [a1 originalTableHeight];
}

id objc_msgSend_outlineLevel(void *a1, const char *a2, ...)
{
  return [a1 outlineLevel];
}

id objc_msgSend_outlineStyleType(void *a1, const char *a2, ...)
{
  return [a1 outlineStyleType];
}

id objc_msgSend_outputBundle(void *a1, const char *a2, ...)
{
  return [a1 outputBundle];
}

id objc_msgSend_pageCount(void *a1, const char *a2, ...)
{
  return [a1 pageCount];
}

id objc_msgSend_pageIndex(void *a1, const char *a2, ...)
{
  return [a1 pageIndex];
}

id objc_msgSend_pageMargins(void *a1, const char *a2, ...)
{
  return [a1 pageMargins];
}

id objc_msgSend_pageNumberForHeaderOrFooter(void *a1, const char *a2, ...)
{
  return [a1 pageNumberForHeaderOrFooter];
}

id objc_msgSend_pageSize(void *a1, const char *a2, ...)
{
  return [a1 pageSize];
}

id objc_msgSend_pagesOrder(void *a1, const char *a2, ...)
{
  return [a1 pagesOrder];
}

id objc_msgSend_pagesOrderToCssZOrderClassMapDictionary(void *a1, const char *a2, ...)
{
  return [a1 pagesOrderToCssZOrderClassMapDictionary];
}

id objc_msgSend_paragraphCount(void *a1, const char *a2, ...)
{
  return [a1 paragraphCount];
}

id objc_msgSend_paragraphIndex(void *a1, const char *a2, ...)
{
  return [a1 paragraphIndex];
}

id objc_msgSend_paragraphStyle(void *a1, const char *a2, ...)
{
  return [a1 paragraphStyle];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return [a1 parent];
}

id objc_msgSend_parentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 parentIdentifier];
}

id objc_msgSend_passphraseVerifier(void *a1, const char *a2, ...)
{
  return [a1 passphraseVerifier];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pathStr(void *a1, const char *a2, ...)
{
  return [a1 pathStr];
}

id objc_msgSend_pattern(void *a1, const char *a2, ...)
{
  return [a1 pattern];
}

id objc_msgSend_peekElementName(void *a1, const char *a2, ...)
{
  return [a1 peekElementName];
}

id objc_msgSend_peekObject(void *a1, const char *a2, ...)
{
  return [a1 peekObject];
}

id objc_msgSend_placeholderStyle(void *a1, const char *a2, ...)
{
  return [a1 placeholderStyle];
}

id objc_msgSend_point(void *a1, const char *a2, ...)
{
  return [a1 point];
}

id objc_msgSend_popElementName(void *a1, const char *a2, ...)
{
  return [a1 popElementName];
}

id objc_msgSend_popImplicitStyle(void *a1, const char *a2, ...)
{
  return [a1 popImplicitStyle];
}

id objc_msgSend_popRetainedObject(void *a1, const char *a2, ...)
{
  return [a1 popRetainedObject];
}

id objc_msgSend_popTocHref(void *a1, const char *a2, ...)
{
  return [a1 popTocHref];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
}

id objc_msgSend_prevColumnIndex(void *a1, const char *a2, ...)
{
  return [a1 prevColumnIndex];
}

id objc_msgSend_prevRowIndex(void *a1, const char *a2, ...)
{
  return [a1 prevRowIndex];
}

id objc_msgSend_previewHasStreamedMainHTML(void *a1, const char *a2, ...)
{
  return [a1 previewHasStreamedMainHTML];
}

id objc_msgSend_processor(void *a1, const char *a2, ...)
{
  return [a1 processor];
}

id objc_msgSend_processorState(void *a1, const char *a2, ...)
{
  return [a1 processorState];
}

id objc_msgSend_progressiveStreamStarted(void *a1, const char *a2, ...)
{
  return [a1 progressiveStreamStarted];
}

id objc_msgSend_pushInitialState(void *a1, const char *a2, ...)
{
  return [a1 pushInitialState];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return [a1 rangeValue];
}

id objc_msgSend_readEndOfCentralDirectory(void *a1, const char *a2, ...)
{
  return [a1 readEndOfCentralDirectory];
}

id objc_msgSend_readEntries(void *a1, const char *a2, ...)
{
  return [a1 readEntries];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_redComponent(void *a1, const char *a2, ...)
{
  return [a1 redComponent];
}

id objc_msgSend_registerDefaults(void *a1, const char *a2, ...)
{
  return [a1 registerDefaults];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return [a1 relativePath];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resolveStyleParents(void *a1, const char *a2, ...)
{
  return [a1 resolveStyleParents];
}

id objc_msgSend_resolveStyleRef(void *a1, const char *a2, ...)
{
  return [a1 resolveStyleRef];
}

id objc_msgSend_resourceSpecifier(void *a1, const char *a2, ...)
{
  return [a1 resourceSpecifier];
}

id objc_msgSend_resourceType(void *a1, const char *a2, ...)
{
  return [a1 resourceType];
}

id objc_msgSend_restartList(void *a1, const char *a2, ...)
{
  return [a1 restartList];
}

id objc_msgSend_resultCell(void *a1, const char *a2, ...)
{
  return [a1 resultCell];
}

id objc_msgSend_right(void *a1, const char *a2, ...)
{
  return [a1 right];
}

id objc_msgSend_root(void *a1, const char *a2, ...)
{
  return [a1 root];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_rowCount(void *a1, const char *a2, ...)
{
  return [a1 rowCount];
}

id objc_msgSend_rowIndex(void *a1, const char *a2, ...)
{
  return [a1 rowIndex];
}

id objc_msgSend_rowNames(void *a1, const char *a2, ...)
{
  return [a1 rowNames];
}

id objc_msgSend_rowSpan(void *a1, const char *a2, ...)
{
  return [a1 rowSpan];
}

id objc_msgSend_scalar(void *a1, const char *a2, ...)
{
  return [a1 scalar];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scaleWithText(void *a1, const char *a2, ...)
{
  return [a1 scaleWithText];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_seriesArray(void *a1, const char *a2, ...)
{
  return [a1 seriesArray];
}

id objc_msgSend_setGeneratorBeginWasCalled(void *a1, const char *a2, ...)
{
  return [a1 setGeneratorBeginWasCalled];
}

id objc_msgSend_shapeContext(void *a1, const char *a2, ...)
{
  return [a1 shapeContext];
}

id objc_msgSend_shearXAngle(void *a1, const char *a2, ...)
{
  return [a1 shearXAngle];
}

id objc_msgSend_shearYAngle(void *a1, const char *a2, ...)
{
  return [a1 shearYAngle];
}

id objc_msgSend_shouldStreamContent(void *a1, const char *a2, ...)
{
  return [a1 shouldStreamContent];
}

id objc_msgSend_shouldStreamTables(void *a1, const char *a2, ...)
{
  return [a1 shouldStreamTables];
}

id objc_msgSend_showOutliner(void *a1, const char *a2, ...)
{
  return [a1 showOutliner];
}

id objc_msgSend_showThousandsSeparator(void *a1, const char *a2, ...)
{
  return [a1 showThousandsSeparator];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeOfBoundingBox(void *a1, const char *a2, ...)
{
  return [a1 sizeOfBoundingBox];
}

id objc_msgSend_slideSize(void *a1, const char *a2, ...)
{
  return [a1 slideSize];
}

id objc_msgSend_slideStyle(void *a1, const char *a2, ...)
{
  return [a1 slideStyle];
}

id objc_msgSend_solidPattern(void *a1, const char *a2, ...)
{
  return [a1 solidPattern];
}

id objc_msgSend_spacing(void *a1, const char *a2, ...)
{
  return [a1 spacing];
}

id objc_msgSend_splitNextAttachment(void *a1, const char *a2, ...)
{
  return [a1 splitNextAttachment];
}

id objc_msgSend_splitTable(void *a1, const char *a2, ...)
{
  return [a1 splitTable];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startLayout(void *a1, const char *a2, ...)
{
  return [a1 startLayout];
}

id objc_msgSend_startProgressiveData(void *a1, const char *a2, ...)
{
  return [a1 startProgressiveData];
}

id objc_msgSend_startSection(void *a1, const char *a2, ...)
{
  return [a1 startSection];
}

id objc_msgSend_stateForReading(void *a1, const char *a2, ...)
{
  return [a1 stateForReading];
}

id objc_msgSend_stateStack(void *a1, const char *a2, ...)
{
  return [a1 stateStack];
}

id objc_msgSend_stops(void *a1, const char *a2, ...)
{
  return [a1 stops];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return [a1 storage];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_stylesheet(void *a1, const char *a2, ...)
{
  return [a1 stylesheet];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tableState(void *a1, const char *a2, ...)
{
  return [a1 tableState];
}

id objc_msgSend_tableStyle(void *a1, const char *a2, ...)
{
  return [a1 tableStyle];
}

id objc_msgSend_tailCenter(void *a1, const char *a2, ...)
{
  return [a1 tailCenter];
}

id objc_msgSend_technique(void *a1, const char *a2, ...)
{
  return [a1 technique];
}

id objc_msgSend_textScale(void *a1, const char *a2, ...)
{
  return [a1 textScale];
}

id objc_msgSend_thumbnailSize(void *a1, const char *a2, ...)
{
  return [a1 thumbnailSize];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_tocDepth(void *a1, const char *a2, ...)
{
  return [a1 tocDepth];
}

id objc_msgSend_top(void *a1, const char *a2, ...)
{
  return [a1 top];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_transformStruct(void *a1, const char *a2, ...)
{
  return [a1 transformStruct];
}

id objc_msgSend_transpose(void *a1, const char *a2, ...)
{
  return [a1 transpose];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_urlString(void *a1, const char *a2, ...)
{
  return [a1 urlString];
}

id objc_msgSend_useOutline(void *a1, const char *a2, ...)
{
  return [a1 useOutline];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_value2Title(void *a1, const char *a2, ...)
{
  return [a1 value2Title];
}

id objc_msgSend_valueTitle(void *a1, const char *a2, ...)
{
  return [a1 valueTitle];
}

id objc_msgSend_valueType(void *a1, const char *a2, ...)
{
  return [a1 valueType];
}

id objc_msgSend_verticalFlip(void *a1, const char *a2, ...)
{
  return [a1 verticalFlip];
}

id objc_msgSend_waiter(void *a1, const char *a2, ...)
{
  return [a1 waiter];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_wrapDirection(void *a1, const char *a2, ...)
{
  return [a1 wrapDirection];
}

id objc_msgSend_wrapPoints(void *a1, const char *a2, ...)
{
  return [a1 wrapPoints];
}

id objc_msgSend_writeTabsJS(void *a1, const char *a2, ...)
{
  return [a1 writeTabsJS];
}

id objc_msgSend_xmlReader(void *a1, const char *a2, ...)
{
  return [a1 xmlReader];
}

id objc_msgSend_xmlReaderForGzippedData(void *a1, const char *a2, ...)
{
  return [a1 xmlReaderForGzippedData];
}

id objc_msgSend_zIndex(void *a1, const char *a2, ...)
{
  return [a1 zIndex];
}