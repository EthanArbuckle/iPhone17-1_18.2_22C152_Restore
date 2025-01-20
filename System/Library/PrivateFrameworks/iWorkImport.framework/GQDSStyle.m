@interface GQDSStyle
+ (GQDSMap)defaultMapForStyleType:(int)a3;
+ (const)stateForReading;
+ (id)createReplacementForMissingObject:(_xmlTextReader *)a3 processor:(id)a4;
+ (id)createReplacementForMissingStyleOfType:(int)a3;
+ (int)styleTypeForNodeName:(const char *)a3;
- (BOOL)hasValueForBoolProperty:(int)a3 value:(BOOL *)a4;
- (BOOL)hasValueForBoolProperty:(int)a3 value:(BOOL *)a4 wasOverriddenWithNull:(BOOL *)a5;
- (BOOL)hasValueForDoubleProperty:(int)a3 value:(double *)a4;
- (BOOL)hasValueForDoubleProperty:(int)a3 value:(double *)a4 wasOverriddenWithNull:(BOOL *)a5;
- (BOOL)hasValueForFloatProperty:(int)a3 value:(float *)a4;
- (BOOL)hasValueForFloatProperty:(int)a3 value:(float *)a4 wasOverriddenWithNull:(BOOL *)a5;
- (BOOL)hasValueForIntProperty:(int)a3 value:(int *)a4;
- (BOOL)hasValueForIntProperty:(int)a3 value:(int *)a4 wasOverriddenWithNull:(BOOL *)a5;
- (BOOL)hasValueForObjectProperty:(int)a3 value:(id *)a4;
- (BOOL)hasValueForObjectProperty:(int)a3 value:(id *)a4 wasOverriddenWithNull:(BOOL *)a5;
- (BOOL)overridesBoolProperty:(int)a3 value:(BOOL *)a4;
- (BOOL)overridesDoubleProperty:(int)a3 value:(double *)a4;
- (BOOL)overridesFloatProperty:(int)a3 value:(float *)a4;
- (BOOL)overridesIntProperty:(int)a3 value:(int *)a4;
- (BOOL)overridesObjectProperty:(int)a3 value:(id *)a4;
- (BOOL)valueForBoolProperty:(int)a3;
- (double)valueForDoubleProperty:(int)a3;
- (float)valueForFloatProperty:(int)a3;
- (id)parent;
- (id)valueForObjectProperty:(int)a3;
- (int)valueForIntProperty:(int)a3;
- (void)dealloc;
- (void)setParent:(id)a3;
- (void)setPropertyMap:(GQDSMap *)a3;
@end

@implementation GQDSStyle

+ (id)createReplacementForMissingStyleOfType:(int)a3
{
  id v3 = [a1 defaultMapForStyleType:*(void *)&a3];
  if (!v3) {
    return 0;
  }
  v4 = sub_101BC((uint64_t)v3);
  v5 = objc_alloc_init(GQDSStyle);
  [(GQDSStyle *)v5 setPropertyMap:v4];
  return v5;
}

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A35A0;
}

+ (GQDSMap)defaultMapForStyleType:(int)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)qword_A40C8;
  if (!qword_A40C8)
  {
    Mutable = CFDictionaryCreateMutable(0, 17, 0, (const CFDictionaryValueCallBacks *)&unk_9B750);
    qword_A40C8 = (uint64_t)Mutable;
    v6 = CFArrayCreateMutable(0, 0, (const CFArrayCallBacks *)&unk_84B68);
    v7 = sub_FF1C(1, @"Helvetica");
    CFArrayAppendValue(v6, v7);
    v8 = sub_FE68(2, 12.0);
    CFArrayAppendValue(v6, v8);
    v9 = sub_FF1C(3, +[GQDColor blackColor]);
    CFArrayAppendValue(v6, v9);
    v10 = sub_FE0C(4, 0);
    CFArrayAppendValue(v6, v10);
    v11 = sub_FE0C(5, 0);
    CFArrayAppendValue(v6, v11);
    v12 = sub_FE0C(6, 0);
    CFArrayAppendValue(v6, v12);
    v13 = sub_FE0C(7, 0);
    CFArrayAppendValue(v6, v13);
    v14 = sub_FE68(8, 1.0);
    CFArrayAppendValue(v6, v14);
    v15 = sub_FF1C(9, 0);
    CFArrayAppendValue(v6, v15);
    v16 = sub_FE0C(11, 0);
    CFArrayAppendValue(v6, v16);
    v17 = sub_FE68(12, 1.0);
    CFArrayAppendValue(v6, v17);
    v18 = sub_FF1C(13, 0);
    CFArrayAppendValue(v6, v18);
    v19 = sub_FE0C(15, 0);
    CFArrayAppendValue(v6, v19);
    v20 = sub_FE68(16, 0.0);
    CFArrayAppendValue(v6, v20);
    v21 = sub_FF1C(19, 0);
    CFArrayAppendValue(v6, v21);
    v22 = sub_FE68(20, 0.0);
    CFArrayAppendValue(v6, v22);
    v23 = sub_FE0C(21, 0);
    CFArrayAppendValue(v6, v23);
    v24 = sub_FF1C(22, 0);
    CFArrayAppendValue(v6, v24);
    v25 = sub_FE0C(14, 0);
    CFArrayAppendValue(v6, v25);
    v26 = sub_FE0C(10, 0);
    CFArrayAppendValue(v6, v26);
    v27 = sub_10014(v6);
    CFDictionarySetValue(Mutable, 0, v27);
    v28 = sub_FE68(23, 0.0);
    CFArrayAppendValue(v6, v28);
    v29 = sub_FE68(24, 0.0);
    CFArrayAppendValue(v6, v29);
    v30 = sub_FE68(25, 0.0);
    CFArrayAppendValue(v6, v30);
    v31 = sub_FE68(26, 36.0);
    CFArrayAppendValue(v6, v31);
    CFMutableArrayRef v32 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v33 = sub_FF1C(27, v32);
    CFArrayAppendValue(v6, v33);
    CFRelease(v32);
    v34 = objc_alloc_init(GQDWPLineSpacing);
    v35 = sub_FF1C(28, v34);
    CFArrayAppendValue(v6, v35);

    v36 = sub_FE0C(29, 0);
    CFArrayAppendValue(v6, v36);
    v37 = sub_FE68(30, 0.0);
    CFArrayAppendValue(v6, v37);
    v38 = sub_FE68(31, 0.0);
    CFArrayAppendValue(v6, v38);
    v39 = sub_FE0C(32, 0);
    CFArrayAppendValue(v6, v39);
    v40 = sub_FE0C(33, 0);
    CFArrayAppendValue(v6, v40);
    v41 = sub_FE0C(34, 0);
    CFArrayAppendValue(v6, v41);
    v42 = sub_FE0C(35, 1);
    CFArrayAppendValue(v6, v42);
    v43 = sub_FF1C(36, 0);
    CFArrayAppendValue(v6, v43);
    v44 = sub_FF1C(37, 0);
    CFArrayAppendValue(v6, v44);
    v45 = sub_FF1C(38, 0);
    CFArrayAppendValue(v6, v45);
    v46 = sub_FE0C(39, 1);
    CFArrayAppendValue(v6, v46);
    v47 = sub_FF1C(40, @".");
    CFArrayAppendValue(v6, v47);
    v48 = sub_FE0C(42, 0);
    CFArrayAppendValue(v6, v48);
    v49 = sub_10014(v6);
    CFDictionarySetValue(Mutable, (char *)&dword_0 + 1, v49);
    CFArrayRemoveAllValues(v6);
    v50 = sub_FF1C(45, 0);
    CFArrayAppendValue(v6, v50);
    v51 = objc_alloc_init(GQDWPPadding);
    v52 = sub_FF1C(46, v51);
    CFArrayAppendValue(v6, v52);

    v53 = objc_alloc_init(GQDWPPadding);
    v54 = sub_FF1C(47, v53);
    CFArrayAppendValue(v6, v54);

    v55 = sub_FE68(48, 0.0);
    CFArrayAppendValue(v6, v55);
    v56 = sub_FE0C(50, 0);
    CFArrayAppendValue(v6, v56);
    v57 = sub_FF1C(51, 0);
    CFArrayAppendValue(v6, v57);
    v58 = sub_FE0C(52, 1);
    CFArrayAppendValue(v6, v58);
    v59 = sub_FE0C(53, 0);
    CFArrayAppendValue(v6, v59);
    v60 = sub_10014(v6);
    CFDictionarySetValue(Mutable, (char *)&dword_0 + 2, v60);
    CFRelease(v6);
    CFDictionaryRef v4 = (const __CFDictionary *)qword_A40C8;
  }
  return (GQDSMap *)CFDictionaryGetValue(v4, (const void *)a3);
}

+ (id)createReplacementForMissingObject:(_xmlTextReader *)a3 processor:(id)a4
{
  v7 = (xmlChar *)xmlTextReaderConstLocalName(a3);
  v8 = sub_427B8(v7);
  if (!v8) {
    return 0;
  }
  v9 = v8;
  id v10 = objc_msgSend(a1, "createReplacementForMissingStyleOfType:", objc_msgSend(a1, "styleTypeForNodeName:", v8));
  xmlFree(v9);
  if (v10)
  {
    AttributeNs = xmlTextReaderGetAttributeNs(a3, (const xmlChar *)off_9D3E0, *(const xmlChar **)(qword_A35E0 + 16));
    objc_msgSend(objc_msgSend(objc_msgSend(a4, "documentState"), "topObjectOfClass:", objc_opt_class()), "addStyle:withOwnedXmlUid:", v10, AttributeNs);
  }
  return v10;
}

+ (int)styleTypeForNodeName:(const char *)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)qword_A40D0;
  if (!qword_A40D0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_850E0, 0);
    qword_A40D0 = (uint64_t)Mutable;
    CFDictionarySetValue(Mutable, off_9CAB0, 0);
    CFDictionarySetValue(Mutable, off_9CAB8, (char *)&dword_0 + 1);
    CFDictionarySetValue(Mutable, off_9CAC0, (char *)&dword_0 + 1);
    CFDictionarySetValue(Mutable, off_9CAC8, (char *)&dword_0 + 2);
    CFDictionarySetValue(Mutable, off_9CAD0, (char *)&dword_0 + 3);
    CFDictionarySetValue(Mutable, off_9CAD8, &dword_4);
    CFDictionarySetValue(Mutable, off_9CAE0, (char *)&dword_4 + 1);
    CFDictionarySetValue(Mutable, off_9CAE8, (char *)&dword_4 + 2);
    CFDictionarySetValue(Mutable, off_9CAF0, (char *)&dword_4 + 3);
    CFDictionarySetValue(Mutable, off_9CAF8, &dword_8);
    CFDictionarySetValue(Mutable, off_9CB00, (char *)&dword_8 + 1);
    CFDictionarySetValue(Mutable, off_9CB08, (char *)&dword_8 + 2);
    CFDictionarySetValue(Mutable, off_9CB10, (char *)&dword_8 + 3);
    CFDictionarySetValue(Mutable, off_9CB18, &dword_C);
    CFDictionarySetValue(Mutable, off_9CB20, (char *)&dword_C + 1);
    CFDictionarySetValue(Mutable, off_9CB28, (char *)&dword_C + 2);
    CFDictionarySetValue(Mutable, off_9CB30, (char *)&dword_C + 3);
    CFDictionarySetValue(Mutable, off_9CB38, &dword_10);
    CFDictionaryRef v4 = (const __CFDictionary *)qword_A40D0;
  }
  return CFDictionaryGetValue(v4, a3);
}

- (void)dealloc
{
  mPropertyMap = self->mPropertyMap;
  if (mPropertyMap) {
    sub_10140((uint64_t)mPropertyMap);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDSStyle;
  [(GQDSStyle *)&v4 dealloc];
}

- (void)setPropertyMap:(GQDSMap *)a3
{
  self->mPropertyMap = a3;
}

- (id)parent
{
  return self->mParent;
}

- (void)setParent:(id)a3
{
  id v5 = a3;

  self->mParent = (GQDSStyle *)a3;
}

- (BOOL)valueForBoolProperty:(int)a3
{
  BOOL v4 = 0;
  [(GQDSStyle *)self hasValueForBoolProperty:*(void *)&a3 value:&v4];
  return v4;
}

- (BOOL)hasValueForBoolProperty:(int)a3 value:(BOOL *)a4
{
  return [(GQDSStyle *)self hasValueForBoolProperty:*(void *)&a3 value:a4 wasOverriddenWithNull:0];
}

- (BOOL)hasValueForBoolProperty:(int)a3 value:(BOOL *)a4 wasOverriddenWithNull:(BOOL *)a5
{
  uint64_t v7 = *(void *)&a3;
  if (sub_10290((uint64_t)self->mPropertyMap, a3, (unsigned __int8 *)a4, (char *)a5))
  {
    LOBYTE(mParent) = 1;
  }
  else
  {
    mParent = self->mParent;
    if (mParent)
    {
      LOBYTE(mParent) = [(GQDSStyle *)mParent hasValueForBoolProperty:v7 value:a4 wasOverriddenWithNull:a5];
    }
  }
  return (char)mParent;
}

- (BOOL)overridesBoolProperty:(int)a3 value:(BOOL *)a4
{
  return sub_10290((uint64_t)self->mPropertyMap, a3, (unsigned __int8 *)a4, 0);
}

- (int)valueForIntProperty:(int)a3
{
  int v4 = 0;
  [(GQDSStyle *)self hasValueForIntProperty:*(void *)&a3 value:&v4];
  return v4;
}

- (BOOL)hasValueForIntProperty:(int)a3 value:(int *)a4
{
  return [(GQDSStyle *)self hasValueForIntProperty:*(void *)&a3 value:a4 wasOverriddenWithNull:0];
}

- (BOOL)hasValueForIntProperty:(int)a3 value:(int *)a4 wasOverriddenWithNull:(BOOL *)a5
{
  uint64_t v7 = *(void *)&a3;
  if (sub_10384((uint64_t)self->mPropertyMap, a3, (float *)a4, (char *)a5))
  {
    LOBYTE(mParent) = 1;
  }
  else
  {
    mParent = self->mParent;
    if (mParent)
    {
      LOBYTE(mParent) = [(GQDSStyle *)mParent hasValueForIntProperty:v7 value:a4 wasOverriddenWithNull:a5];
    }
  }
  return (char)mParent;
}

- (BOOL)overridesIntProperty:(int)a3 value:(int *)a4
{
  return sub_10384((uint64_t)self->mPropertyMap, a3, (float *)a4, 0);
}

- (float)valueForFloatProperty:(int)a3
{
  float v4 = 0.0;
  [(GQDSStyle *)self hasValueForFloatProperty:*(void *)&a3 value:&v4];
  return v4;
}

- (BOOL)hasValueForFloatProperty:(int)a3 value:(float *)a4
{
  return [(GQDSStyle *)self hasValueForFloatProperty:*(void *)&a3 value:a4 wasOverriddenWithNull:0];
}

- (BOOL)hasValueForFloatProperty:(int)a3 value:(float *)a4 wasOverriddenWithNull:(BOOL *)a5
{
  uint64_t v7 = *(void *)&a3;
  if (sub_10470((uint64_t)self->mPropertyMap, a3, a4, (char *)a5))
  {
    LOBYTE(mParent) = 1;
  }
  else
  {
    mParent = self->mParent;
    if (mParent)
    {
      LOBYTE(mParent) = [(GQDSStyle *)mParent hasValueForFloatProperty:v7 value:a4 wasOverriddenWithNull:a5];
    }
  }
  return (char)mParent;
}

- (BOOL)overridesFloatProperty:(int)a3 value:(float *)a4
{
  return sub_10470((uint64_t)self->mPropertyMap, a3, a4, 0);
}

- (double)valueForDoubleProperty:(int)a3
{
  double v4 = 0.0;
  [(GQDSStyle *)self hasValueForDoubleProperty:*(void *)&a3 value:&v4];
  return v4;
}

- (BOOL)hasValueForDoubleProperty:(int)a3 value:(double *)a4
{
  return [(GQDSStyle *)self hasValueForDoubleProperty:*(void *)&a3 value:a4 wasOverriddenWithNull:0];
}

- (BOOL)hasValueForDoubleProperty:(int)a3 value:(double *)a4 wasOverriddenWithNull:(BOOL *)a5
{
  uint64_t v7 = *(void *)&a3;
  if (sub_10560((uint64_t)self->mPropertyMap, a3, (uint64_t)a4, a5))
  {
    LOBYTE(mParent) = 1;
  }
  else
  {
    mParent = self->mParent;
    if (mParent)
    {
      LOBYTE(mParent) = [(GQDSStyle *)mParent hasValueForDoubleProperty:v7 value:a4 wasOverriddenWithNull:a5];
    }
  }
  return (char)mParent;
}

- (BOOL)overridesDoubleProperty:(int)a3 value:(double *)a4
{
  return sub_10560((uint64_t)self->mPropertyMap, a3, (uint64_t)a4, 0);
}

- (id)valueForObjectProperty:(int)a3
{
  double v4 = 0;
  [(GQDSStyle *)self hasValueForObjectProperty:*(void *)&a3 value:&v4];
  return v4;
}

- (BOOL)hasValueForObjectProperty:(int)a3 value:(id *)a4
{
  return [(GQDSStyle *)self hasValueForObjectProperty:*(void *)&a3 value:a4 wasOverriddenWithNull:0];
}

- (BOOL)hasValueForObjectProperty:(int)a3 value:(id *)a4 wasOverriddenWithNull:(BOOL *)a5
{
  uint64_t v7 = *(void *)&a3;
  if (sub_105E4((uint64_t)self->mPropertyMap, a3, a4, (char *)a5))
  {
    LOBYTE(mParent) = 1;
  }
  else
  {
    mParent = self->mParent;
    if (mParent)
    {
      LOBYTE(mParent) = [(GQDSStyle *)mParent hasValueForObjectProperty:v7 value:a4 wasOverriddenWithNull:a5];
    }
  }
  return (char)mParent;
}

- (BOOL)overridesObjectProperty:(int)a3 value:(id *)a4
{
  return sub_105E4((uint64_t)self->mPropertyMap, a3, a4, 0);
}

@end