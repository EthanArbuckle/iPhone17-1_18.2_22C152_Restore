void SXSetupLogging()
{
  if (SXSetupLogging_onceToken != -1) {
    dispatch_once(&SXSetupLogging_onceToken, &__block_literal_global_38);
  }
}

id SXJSONObjectObjectValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  v3 = a1;
  v4 = [NSString stringWithUTF8String:sel_getName((SEL)a2)];
  v5 = -[SXJSONObject objectForLookupKey:]((id *)&v3->super.isa, v4);
  if (v5)
  {
    id v6 = v5;
    id v7 = v6;
    goto LABEL_18;
  }
  SXJSONObjectRuntimeValue(v3, (NSString *)v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6
    || ([MEMORY[0x263EFF9D0] null],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v6 == v8))
  {
    id v7 = 0;
    goto LABEL_18;
  }
  +[SXJSONObject lock];
  v9 = (objc_class *)objc_opt_class();
  Name = sel_getName((SEL)a2);
  v11 = SXJSONObjectRuntimeGenerateLookupKey(v9, Name);
  v12 = +[SXJSONObject propertyHashTable];
  v13 = (objc_class *)(id)[v12 objectForKey:v11];

  v14 = +[SXJSONObject protocolPropertyDefinitions];
  v15 = [v14 objectForKey:v11];

  +[SXJSONObject unlock];
  if (v15) {
    v13 = (objc_class *)[(id)objc_opt_class() classForProtocolProperty:v4 withValue:v6];
  }
  if (v13 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v13 == (objc_class *)objc_opt_class() || v13 == (objc_class *)objc_opt_class())
    {
      v16 = [(id)objc_opt_class() objectValueClassBlockForPropertyWithName:v4];
      v17 = [(id)objc_opt_class() valueClassBlockForPropertyWithName:v4];
      v18 = [(id)objc_opt_class() purgeClassBlockForPropertyWithName:v4];
      id v7 = (id)[[v13 alloc] initWithValueClassBlock:v17 objectValueClassBlock:v16 purgeBlock:v18 andJSONObject:v6 andVersion:v3->_specificationVersion];
    }
    else
    {
      id v7 = (id)[[v13 alloc] initWithJSONObject:v6 andVersion:v3->_specificationVersion];
      if (!v7) {
        goto LABEL_17;
      }
    }
    [(SXJSONObject *)v3 storeObject:v7 forLookupKey:v4];
  }
  else
  {
    [(SXJSONObject *)v3 storeObject:v6 forLookupKey:v4];
    id v7 = v6;
  }
LABEL_17:

LABEL_18:
  return v7;
}

void sub_222AC82B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SXJSONObjectCustomUnsignedIntegerValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  v3 = a1;
  Name = sel_getName((SEL)a2);
  v5 = objc_opt_class();
  id v6 = [NSString stringWithUTF8String:Name];
  id v7 = [v5 jsonPropertyNameForObjCPropertyName:v6];

  str = 0;
  SXJSONObjectRuntimeCopyCustomGetterName(Name, &str);
  Uid = sel_getUid(str);
  free(str);
  v9 = [(NSDictionary *)v3->_jsonDictionary objectForKey:v7];
  v10 = v9;
  uint64_t v11 = 1;
  unsigned int v16 = 1;
  if (v9)
  {
    unsigned int v16 = 6;
    uint64_t v12 = SXJSONObjectRuntimeConvertValue(v9, (int *)&v16, v3, v7, 0);
    uint64_t v11 = v16;
    v13 = (void *)v12;
  }
  else
  {
    v13 = 0;
  }
  id v14 = objc_msgSend(v3, Uid, v13, v11);

  return v14;
}

void sub_222AC8DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double SXJSONObjectRuntimeCopyCustomGetterName(const char *a1, char **a2)
{
  size_t v4 = strlen(a1);
  v5 = (char *)malloc_type_malloc(v4 + 20, 0x100004077774924uLL);
  *a2 = v5;
  memcpy(v5, a1, v4);
  id v6 = &(*a2)[v4];
  *(_DWORD *)(v6 + 15) = 979726457;
  double result = *(double *)"WithValue:withType:";
  *(_OWORD *)id v6 = *(_OWORD *)"WithValue:withType:";
  (*a2)[v4 + 19] = 0;
  return result;
}

void *SXConvertibleValueJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("_SXConvertibleValue", "{_SXConvertibleValue=dQ}", SXConvertibleValueObjCValue);
}

void *SXComponentContentInsetJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("_SXComponentContentInset", "{_SXComponentContentInset=BBBBB}", SXComponentContentInsetObjCValue);
}

void *CLLocationCoordinate2DJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("CLLocationCoordinate2D", "{CLLocationCoordinate2D=dd}", CLLocationCoordinate2DObjCValue);
}

void *SXDataTablePaddingJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("_SXDataTablePadding", "{?=dddd}", SXDataTablePaddingObjCValue);
}

void *MKCoordinateRegionJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("MKCoordinateRegion", "{?={CLLocationCoordinate2D=dd}{?=dd}}", MKCoordinateRegionObjCValue);
}

void *MKCoordinateSpanJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("MKCoordinateSpan", "{?=dd}", MKCoordinateSpanObjCValue);
}

void *UIEdgeInsetsJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("UIEdgeInsets", "{UIEdgeInsets=dddd}", UIEdgeInsetsFromObjCValue);
}

void *NSRangeJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("_NSRange", "{_NSRange=QQ}", NSRangeFromObjCValue);
}

void *CGPointJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("CGPoint", "{CGPoint=dd}", CGPointFromObjCValue);
}

void *CGSizeJSONObjectInitializer(void)
{
  return SXJSONObjectAddPrimitiveDefinition("CGSize", "{CGSize=dd}", CGSizeFromObjCValue);
}

void sub_222AC97E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *SXJSONObjectAddPrimitiveDefinition(const char *a1, const char *a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  if ((SXJSONObjectPrimitivesIsSupportedPrimitive((uint64_t)a2) & 1) == 0)
  {
    v15 = (void *)MEMORY[0x263EFF940];
    v19 = @"Primitive";
    unsigned int v16 = [NSString stringWithUTF8String:a1];
    v20[0] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v18 = [v15 exceptionWithName:@"PrimitiveNotSupported", @"The primitive given is not supported, please look at the documentation to see what is supported", v17 reason userInfo];

    objc_exception_throw(v18);
  }
  if (dword_26AB6C7DC >= dword_26AB6C7D8)
  {
    if (dword_26AB6C7D8) {
      id v6 = malloc_type_realloc((void *)_primitives, 32 * (dword_26AB6C7DC + 3), 0x90040F3492DD4uLL);
    }
    else {
      id v6 = malloc_type_malloc(0x60uLL, 0x90040F3492DD4uLL);
    }
    _primitives = (uint64_t)v6;
    dword_26AB6C7D8 += 3;
  }
  size_t v7 = strlen(a1);
  id v8 = malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
  memcpy(v8, a1, v7);
  *((unsigned char *)v8 + v7) = 0;
  size_t v9 = strlen(a2);
  v10 = malloc_type_malloc(v9 + 1, 0x100004077774924uLL);
  memcpy(v10, a2, v9);
  *((unsigned char *)v10 + v9) = 0;
  uint64_t v11 = malloc_type_malloc(v9 + 3, 0x100004077774924uLL);
  double result = memcpy(v11, a2, v9);
  strcpy((char *)v11 + v9, "@:");
  int v13 = dword_26AB6C7DC;
  id v14 = (void *)(_primitives + 32 * dword_26AB6C7DC);
  void *v14 = v8;
  v14[1] = v10;
  v14[2] = v11;
  v14[3] = a3;
  dword_26AB6C7DC = v13 + 1;
  return result;
}

void sub_222AC9CD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SXJSONObjectPrimitivesIsSupportedPrimitive(uint64_t result)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = result;
    strcpy(__s, "cislqCISLQfdBb^");
    char v2 = *(unsigned char *)result;
    if (*(unsigned char *)result)
    {
      LODWORD(v3) = 0;
      do
      {
        if (v2 == 40 || v2 == 123 || v2 == 91)
        {
          int v4 = v3 + 1;
          v5 = (unsigned __int8 *)(v1 + 1 + (int)v3);
          do
          {
            int v7 = *v5++;
            int v6 = v7;
            if (!v7) {
              return 0;
            }
            LODWORD(v3) = v4++;
          }
          while (v6 != 61);
          uint64_t v8 = 0;
          uint64_t v9 = v1 + v4;
          int v10 = 1;
          do
          {
            int v11 = *(unsigned __int8 *)(v9 + v8);
            if (v11 == 40 || v11 == 123 || v11 == 91) {
              ++v10;
            }
            if (v11 == 41 || v11 == 125 || v11 == 93) {
              --v10;
            }
            v12[v8++] = v11;
            LODWORD(v3) = v3 + 1;
          }
          while (v10);
          v12[v8 - 1] = 0;
          if ((SXJSONObjectPrimitivesIsSupportedPrimitive(v12) & 1) == 0) {
            return 0;
          }
        }
        else
        {
          double result = (uint64_t)strchr(__s, v2);
          if (!result) {
            return result;
          }
        }
        uint64_t v3 = (int)v3 + 1;
        char v2 = *(unsigned char *)(v1 + v3);
      }
      while (v2);
    }
    return 1;
  }
  return result;
}

void SXJSONObjectRuntimeGenerateAccessorsForClass(objc_class *a1)
{
  v38 = 0;
  uint64_t v2 = SXJSONObjectRuntimeCopyClassAndProtocolProperties(a1, &v38, 0, 1);
  if (v2)
  {
    unint64_t v3 = v2;
    uint64_t v4 = 0;
    unsigned int v5 = 1;
    do
    {
      int v6 = v38[v4];
      int v7 = property_getName(v6);
      Attributes = property_getAttributes(v6);
      outCount[0] = 0;
      uint64_t v9 = property_copyAttributeList(v6, outCount);
      SXJSONObjectRuntimeGenerateAccessorsForClass(a1, v7, v9, outCount[0], Attributes);
      free(v9);
      uint64_t v4 = v5;
      BOOL v10 = v3 > v5++;
    }
    while (v10);
  }
  if (v38)
  {
    free(v38);
    v38 = 0;
  }
  if (a1)
  {
    Superclass = a1;
    do
    {
      if (Superclass == (objc_class *)objc_opt_class()
        || Superclass == (objc_class *)objc_opt_class()
        || Superclass == (objc_class *)objc_opt_class()
        || Superclass == (objc_class *)objc_opt_class())
      {
        break;
      }
      *(void *)outCount = 0;
      cls = Superclass;
      uint64_t v12 = SXJSONObjectRuntimeCopyClassAndProtocolProperties(Superclass, (objc_property ***)outCount, 0, 1);
      if (v12)
      {
        unint64_t v13 = v12;
        uint64_t v14 = 0;
        unsigned int v15 = 1;
        do
        {
          unsigned int v16 = *(objc_property **)(*(void *)outCount + 8 * v14);
          v17 = property_getName(v16);
          id v18 = property_getAttributes(v16);
          v19 = SXJSONObjectRuntimeGenerateLookupKey(a1, v17);
          +[SXJSONObject lock];
          v20 = +[SXJSONObject propertyDefinitions];
          uint64_t v21 = [v20 objectForKey:v19];

          v22 = +[SXJSONObject protocolPropertyDefinitions];
          uint64_t v23 = [v22 objectForKey:v19];

          +[SXJSONObject unlock];
          if (!(v21 | v23))
          {
            v35 = 0;
            name = 0;
            v34 = 0;
            SXJSONObjectDetermineFunctionSpecificationAndCopyClassName(v18, (const char **)&v35, &v34, &name);
            v24 = name;
            Class Class = objc_getClass(name);
            Class v26 = objc_getClass("SXJSONDictionary");
            Class v27 = objc_getClass("SXJSONArray");
            v28 = sel_registerName("initWithJSONObject:andVersion:");
            if (([(objc_class *)Class isSubclassOfClass:v26] & 1) != 0
              || ([(objc_class *)Class isSubclassOfClass:v27] & 1) != 0
              || class_respondsToSelector(Class, v28))
            {
              +[SXJSONObject lock];
              v29 = +[SXJSONObject propertyHashTable];
              [v29 setObject:Class forKey:v19];

              +[SXJSONObject unlock];
            }
            if (Class)
            {
              +[SXJSONObject lock];
              v30 = +[SXJSONObject propertyDefinitions];
              [v30 setObject:Class forKey:v19];

              +[SXJSONObject unlock];
            }
            else if (v24)
            {
              v31 = SXJSONObjectProtocolFromClassName(v24);
              if (v31)
              {
                +[SXJSONObject lock];
                v32 = +[SXJSONObject protocolPropertyDefinitions];
                [v32 setObject:v31 forKey:v19];

                +[SXJSONObject unlock];
              }
            }
            free(v24);
          }

          uint64_t v14 = v15;
          BOOL v10 = v13 > v15++;
        }
        while (v10);
      }
      free(*(void **)outCount);
      Superclass = class_getSuperclass(cls);
    }
    while (Superclass);
  }
}

void sub_222ACA1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SXJSONObjectRuntimeGenerateLookupKey(objc_class *a1, const char *a2)
{
  Name = class_getName(a1);
  size_t v4 = strlen(Name);
  size_t v5 = strlen(a2);
  int v6 = (char *)malloc_type_malloc(v5 + v4 + 2, 0x100004077774924uLL);
  memcpy(v6, Name, v4);
  v6[v4] = 59;
  memcpy(&v6[v4 + 1], a2, v5);
  v6[v5 + 1 + v4] = 0;
  int v7 = [NSString stringWithUTF8String:v6];
  free(v6);
  return v7;
}

uint64_t SXJSONObjectDetermineFunctionSpecificationAndCopyClassName(const char *a1, const char **a2, void (**a3)(void), char **a4)
{
  uint64_t result = SXJSONObjectPrimitivesMatchPrimitiveForEncodingAndRetrieveInformation(a1, 0, a2, a3);
  if ((result & 1) == 0)
  {
    uint64_t result = SXJSONObjectPartialCompare(a1, "Tf");
    uint64_t v9 = (void (*)(void))SXJSONObjectFloatValue;
    if ((result & 1) != 0
      || (uint64_t result = SXJSONObjectPartialCompare(a1, "Td"), v9 = (void (*)(void))SXJSONObjectFloatValue, (result & 1) != 0))
    {
      BOOL v10 = "d@:";
LABEL_5:
      *a3 = v9;
      *a2 = v10;
      return result;
    }
    uint64_t result = SXJSONObjectPartialCompare(a1, "Ti");
    uint64_t v9 = (void (*)(void))SXJSONObjectIntegerValue;
    if ((result & 1) != 0
      || (uint64_t result = SXJSONObjectPartialCompare(a1, "Tl"), v9 = (void (*)(void))SXJSONObjectIntegerValue,
                                                         (result & 1) != 0))
    {
      BOOL v10 = "l@:";
      goto LABEL_5;
    }
    uint64_t result = SXJSONObjectPartialCompare(a1, "Tq");
    uint64_t v9 = (void (*)(void))SXJSONObjectIntegerValue;
    if (result)
    {
      BOOL v10 = "q@:";
      goto LABEL_5;
    }
    uint64_t result = SXJSONObjectPartialCompare(a1, "TI");
    uint64_t v9 = (void (*)(void))SXJSONObjectUnsignedIntegerValue;
    if ((result & 1) != 0
      || (uint64_t result = SXJSONObjectPartialCompare(a1, "TL"),
          uint64_t v9 = (void (*)(void))SXJSONObjectUnsignedIntegerValue,
          (result & 1) != 0))
    {
      BOOL v10 = "L@:";
      goto LABEL_5;
    }
    uint64_t result = SXJSONObjectPartialCompare(a1, "TQ");
    uint64_t v9 = (void (*)(void))SXJSONObjectUnsignedIntegerValue;
    if (result)
    {
      BOOL v10 = "Q@:";
      goto LABEL_5;
    }
    uint64_t result = SXJSONObjectPartialCompare(a1, "Tc");
    uint64_t v9 = (void (*)(void))SXJSONObjectBoolValue;
    if (result)
    {
      BOOL v10 = "c@:";
      goto LABEL_5;
    }
    uint64_t result = SXJSONObjectPartialCompare(a1, "TB");
    uint64_t v9 = (void (*)(void))SXJSONObjectBoolValue;
    if (result)
    {
      BOOL v10 = "B@:";
      goto LABEL_5;
    }
    if (*a1 == 84 && a1[1] == 64)
    {
      size_t v11 = strlen(a1);
      uint64_t v12 = 0;
      do
        int v13 = a1[v12++];
      while (v13 != 44);
      if (v12 == 3 || v11 < v11 - v12 + 5)
      {
        id v17 = [MEMORY[0x263EFF940] exceptionWithName:@"InvalidPropertyDefinition" reason:@"Type 'id' is not supported in SXJSONObject" userInfo:0];
        objc_exception_throw(v17);
      }
      size_t v14 = v12 - 5;
      uint64_t v15 = v12;
      unsigned int v16 = (char *)malloc_type_malloc(v12 - 4, 0x100004077774924uLL);
      uint64_t result = (uint64_t)memcpy(v16, a1 + 3, v14);
      v16[v15 - 5] = 0;
      *a4 = v16;
      BOOL v10 = "@@:";
      uint64_t v9 = (void (*)(void))SXJSONObjectObjectValue;
      goto LABEL_5;
    }
  }
  return result;
}

BOOL SXJSONObjectPartialCompare(const char *a1, const char *a2)
{
  unint64_t v3 = a1;
  size_t v4 = strlen(a1);
  size_t v5 = strlen(a2);
  if (v4 < v5) {
    return 0;
  }
  if (!v5) {
    return 1;
  }
  size_t v7 = v5 - 1;
  do
  {
    int v9 = *(unsigned __int8 *)v3++;
    int v8 = v9;
    int v11 = *(unsigned __int8 *)a2++;
    int v10 = v11;
    BOOL v13 = v7-- != 0;
    BOOL result = v8 == v10;
  }
  while (v8 == v10 && v13);
  return result;
}

uint64_t SXJSONObjectPrimitivesMatchPrimitiveForEncodingAndRetrieveInformation(const char *a1, const char **a2, const char **a3, void (**a4)(void))
{
  if (dword_26AB6C7DC < 1) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  while (1)
  {
    int v10 = SXJSONObjectWrapEncodeIntoPropertyDefinition(*(const char **)(_primitives + v8 + 8));
    int v11 = (char *)v10;
    if (*(unsigned __int8 *)v10 == *(unsigned __int8 *)a1 && !strcmp(v10, a1)) {
      break;
    }
    free(v11);
    ++v9;
    v8 += 32;
    if (v9 >= dword_26AB6C7DC) {
      return 0;
    }
  }
  if (a2) {
    *a2 = *(const char **)(_primitives + v8);
  }
  if (a3) {
    *a3 = *(const char **)(_primitives + v8 + 16);
  }
  if (a4) {
    *a4 = *(void (**)(void))(_primitives + v8 + 24);
  }
  free(v11);
  return 1;
}

unsigned char *SXJSONObjectWrapEncodeIntoPropertyDefinition(const char *a1)
{
  uint64_t v1 = a1;
  size_t v2 = strlen(a1);
  BOOL result = malloc_type_malloc(v2 + 8, 0x100004077774924uLL);
  *BOOL result = 84;
  if (v2)
  {
    size_t v4 = result + 1;
    size_t v5 = v2;
    do
    {
      char v6 = *v1++;
      *v4++ = v6;
      --v5;
    }
    while (v5);
  }
  strcpy(&result[v2 + 1], ",R,D,N");
  return result;
}

char **SXJSONObjectRuntimeGenerateAccessorsForClass(objc_class *a1, const char *a2, objc_property_attribute_t *a3, unsigned int a4, const char *a5)
{
  unint64_t v10 = 0;
  *(_WORD *)uint64_t v9 = 0;
  BOOL result = SXJSONObjectRuntimeGetPropertyInfo((char **)a3, a4, &v10, &v9[1], v9);
  if (v9[1] && (v10 & 1) != 0) {
    return (char **)SXJSONObjectRuntimeAddGetterToClass(a1, a2, a5);
  }
  return result;
}

char **SXJSONObjectRuntimeGetPropertyInfo(char **result, unsigned int a2, unint64_t *a3, BOOL *a4, BOOL *a5)
{
  if (a2)
  {
    uint64_t v5 = a2;
    while (1)
    {
      int v6 = **result;
      if (v6 > 77) {
        break;
      }
      if (v6 != 38)
      {
        if (v6 == 67)
        {
          if (a3)
          {
            uint64_t v7 = 8;
            goto LABEL_22;
          }
          goto LABEL_23;
        }
        if (v6 != 68) {
          goto LABEL_23;
        }
        if (a4) {
          *a4 = 1;
        }
        goto LABEL_14;
      }
      if (a3)
      {
        uint64_t v7 = 2;
        goto LABEL_22;
      }
LABEL_23:
      result += 2;
      if (!--v5) {
        return result;
      }
    }
    if (v6 != 78)
    {
      if (v6 == 82)
      {
        if (a3)
        {
          uint64_t v7 = 1;
          goto LABEL_22;
        }
        goto LABEL_23;
      }
      if (v6 != 86) {
        goto LABEL_23;
      }
    }
    if (a5) {
      *a5 = 0;
    }
LABEL_14:
    if (a3)
    {
      uint64_t v7 = 4;
LABEL_22:
      *a3 |= v7;
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  return result;
}

uint64_t SXJSONObjectRuntimeAddGetterToClass(objc_class *a1, const char *__s, const char *a3)
{
  size_t v6 = strlen(__s);
  uint64_t v7 = malloc_type_malloc(v6 + 20, 0x100004077774924uLL);
  memcpy(v7, __s, v6);
  strcpy((char *)v7 + v6, "WithValue:withType:");
  Uid = sel_getUid((const char *)v7);
  InstanceMethod = class_getInstanceMethod(a1, Uid);
  free(v7);
  if (InstanceMethod)
  {
    SEL v10 = sel_registerName(__s);
    TypeEncoding = (unsigned __int8 *)method_getTypeEncoding(InstanceMethod);
    v30 = 0;
    v31 = 0;
    SXJSONObjectDetermineCustomFunctionSpecification(TypeEncoding, (const char **)&v31, &v30);
    uint64_t v12 = v31;
    if (v31)
    {
      BOOL v13 = v30;
      if (v30)
      {
        size_t v14 = a1;
        uint64_t v15 = v10;
        return class_addMethod(v14, v15, v13, v12);
      }
    }
    Name = class_getName(a1);
    return printf("Error adding method, not found an implementation for property '%s' of class %s\n", __s, Name);
  }
  v30 = 0;
  v31 = 0;
  v29 = 0;
  SXJSONObjectDetermineFunctionSpecificationAndCopyClassName(a3, (const char **)&v31, &v30, &v29);
  unsigned int v16 = v29;
  if (v29)
  {
    id v17 = SXJSONObjectRuntimeGenerateLookupKey(a1, __s);
    Class Class = objc_getClass("SXJSONDictionary");
    Class v19 = objc_getClass("SXJSONArray");
    v20 = sel_registerName("initWithJSONObject:andVersion:");
    Class v21 = objc_getClass(v16);
    if (([(objc_class *)v21 isSubclassOfClass:Class] & 1) != 0
      || ([(objc_class *)v21 isSubclassOfClass:v19] & 1) != 0
      || class_respondsToSelector(v21, v20))
    {
      +[SXJSONObject lock];
      v22 = +[SXJSONObject propertyHashTable];
      [v22 setObject:v21 forKey:v17];
    }
    else
    {
      if (!v21)
      {
        Class v26 = SXJSONObjectProtocolFromClassName(v16);
        if (v26)
        {
          +[SXJSONObject lock];
          Class v27 = +[SXJSONObject protocolPropertyDefinitions];
          [v27 setObject:v26 forKey:v17];

          +[SXJSONObject unlock];
        }

        goto LABEL_11;
      }
      +[SXJSONObject lock];
      v22 = +[SXJSONObject propertyDefinitions];
      [v22 setObject:v21 forKey:v17];
    }

    +[SXJSONObject unlock];
LABEL_11:
    free(v16);
  }
  if (!v30 || !v31)
  {
    id v28 = [MEMORY[0x263EFF940] exceptionWithName:@"InvalidPropertyDefinition" reason:@"Property definition is not supported" userInfo:0];
    objc_exception_throw(v28);
  }
  uint64_t v23 = sel_registerName(__s);
  uint64_t result = class_respondsToSelector(a1, v23);
  if ((result & 1) == 0)
  {
    BOOL v13 = v30;
    uint64_t v12 = v31;
    size_t v14 = a1;
    uint64_t v15 = v23;
    return class_addMethod(v14, v15, v13, v12);
  }
  return result;
}

void sub_222ACAC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SXJSONObjectRuntimeCopyClassAndProtocolProperties(objc_class *Superclass, objc_property ***a2, char a3, int a4)
{
  uint64_t v8 = (NSPointerArray *)[objc_alloc(MEMORY[0x263F08A88]) initWithOptions:258];
  if (Superclass)
  {
    while ([(objc_class *)Superclass isSubclassOfClass:objc_opt_class()])
    {
      unsigned int outCount = 0;
      uint64_t v9 = class_copyPropertyList(Superclass, &outCount);
      SEL v10 = v9;
      if (outCount)
      {
        for (unint64_t i = 0; i < outCount; ++i)
        {
          uint64_t v12 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
          void *v12 = v10[i];
          [(NSPointerArray *)v8 addPointer:v12];
        }
      }
      else if (!v9)
      {
        goto LABEL_9;
      }
      free(v10);
LABEL_9:
      if (!a4) {
        goto LABEL_16;
      }
      unsigned int v22 = 0;
      BOOL v13 = class_copyProtocolList(Superclass, &v22);
      size_t v14 = v13;
      if (v22)
      {
        for (unint64_t j = 0; j < v22; ++j)
        {
          unsigned int v16 = v14[j];
          SXJSONObjectRuntimeCollectPropertiesFromProtocol(v16, v8);
        }
      }
      else if (!v13)
      {
        goto LABEL_16;
      }
      free(v14);
LABEL_16:
      if (a3)
      {
        Superclass = class_getSuperclass(Superclass);
        if (Superclass) {
          continue;
        }
      }
      break;
    }
  }
  uint64_t v17 = [(NSPointerArray *)v8 count];
  uint64_t v18 = v17;
  if (a2)
  {
    *a2 = (objc_property **)malloc_type_malloc(8 * v17, 0x2004093837F09uLL);
    if (v18)
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        v20 = [(NSPointerArray *)v8 pointerAtIndex:k];
        (*a2)[k] = *v20;
        free(v20);
      }
    }
  }

  return v18;
}

void sub_222ACAE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SXJSONObjectRuntimeCollectPropertiesFromProtocol(Protocol *a1, NSPointerArray *a2)
{
  unint64_t v3 = a1;
  size_t v4 = a2;
  unsigned int outCount = 0;
  uint64_t v5 = protocol_copyPropertyList(v3, &outCount);
  size_t v6 = v5;
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      uint64_t v8 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
      *uint64_t v8 = v6[i];
      [(NSPointerArray *)v4 addPointer:v8];
    }
  }
  else if (!v5)
  {
    goto LABEL_7;
  }
  free(v6);
LABEL_7:
  unsigned int v13 = 0;
  uint64_t v9 = protocol_copyProtocolList(v3, &v13);
  SEL v10 = v9;
  if (v13)
  {
    for (unint64_t j = 0; j < v13; ++j)
    {
      uint64_t v12 = v10[j];
      SXJSONObjectRuntimeCollectPropertiesFromProtocol(v12, v4);
    }
    goto LABEL_12;
  }
  if (v9) {
LABEL_12:
  }
    free(v10);
}

void sub_222ACAFE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unsigned __int8 *SXJSONObjectDetermineCustomFunctionSpecification(unsigned __int8 *result, const char **a2, void (**a3)(void))
{
  unsigned int v3 = *result;
  if (v3 > 0x4B)
  {
    size_t v4 = (void (*)(void))SXJSONObjectCustomIntegerValue;
    unsigned int v5 = v3 - 99;
    size_t v6 = "l@:";
    switch(v5)
    {
      case 0u:
        size_t v4 = (void (*)(void))SXJSONObjectCustomBoolValue;
        size_t v6 = "c@:";
        goto LABEL_18;
      case 1u:
      case 3u:
        size_t v4 = (void (*)(void))SXJSONObjectCustomFloatValue;
        size_t v6 = "d@:";
        goto LABEL_18;
      case 2u:
      case 4u:
      case 5u:
      case 7u:
      case 8u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
        return result;
      case 6u:
        size_t v4 = (void (*)(void))SXJSONObjectCustomIntegerValue;
        size_t v6 = "i@:";
        goto LABEL_18;
      case 9u:
        goto LABEL_18;
      case 0xEu:
        size_t v4 = (void (*)(void))SXJSONObjectCustomIntegerValue;
        size_t v6 = "q@:";
        goto LABEL_18;
      default:
        if ("l@:" == 76)
        {
          size_t v6 = "L@:";
        }
        else
        {
          if ("l@:" != 81) {
            return result;
          }
          size_t v6 = "Q@:";
        }
        break;
    }
LABEL_17:
    size_t v4 = (void (*)(void))SXJSONObjectCustomUnsignedIntegerValue;
    goto LABEL_18;
  }
  switch(v3)
  {
    case '@':
      size_t v4 = (void (*)(void))SXJSONObjectCustomObjectValue;
      size_t v6 = "@@:";
      break;
    case 'B':
      size_t v4 = (void (*)(void))SXJSONObjectCustomBoolValue;
      size_t v6 = "B@:";
      break;
    case 'I':
      size_t v6 = "I@:";
      goto LABEL_17;
    default:
      return result;
  }
LABEL_18:
  *a2 = v6;
  *a3 = v4;
  return result;
}

id SXJSONObjectProtocolFromClassName(const char *a1)
{
  uint64_t v1 = [MEMORY[0x263F089D8] stringWithCString:a1 encoding:4];
  objc_msgSend(v1, "substringWithRange:", objc_msgSend(v1, "length") != 0, objc_msgSend(v1, "length") - 2);
  id v2 = objc_claimAutoreleasedReturnValue();
  unsigned int v3 = (const char *)[v2 cStringUsingEncoding:4];

  size_t v4 = objc_getProtocol(v3);

  return v4;
}

void sub_222ACB278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SXDefaultComponentStyleIdentifierForRole(uint64_t a1)
{
  return [NSString stringWithFormat:@"default-%@", a1];
}

uint64_t NSRangeFromObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  id v2 = SXJSONObjectObjCValueFromObject(a1, a2);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v3 = [v2 objectForKeyedSubscript:@"start"];
    uint64_t v4 = [v3 integerValue];

    unsigned int v5 = [v2 objectForKeyedSubscript:@"length"];
    [v5 integerValue];

    if (v4 < 0) {
      uint64_t v4 = -1;
    }
  }
  else
  {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

void sub_222ACF6B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __SXSetupLogging_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANF");
  uint64_t v1 = (void *)SXDefaultLog;
  SXDefaultLog = (uint64_t)v0;

  os_log_t v2 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFAnalytics");
  unsigned int v3 = (void *)SXAnalyticsLog;
  SXAnalyticsLog = (uint64_t)v2;

  os_log_t v4 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFSocialEmbed");
  unsigned int v5 = (void *)SXEmbedLog;
  SXEmbedLog = (uint64_t)v4;

  os_log_t v6 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFInvalidation");
  uint64_t v7 = (void *)SXInvalidationLog;
  SXInvalidationLog = (uint64_t)v6;

  os_log_t v8 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFComponentInsertion");
  uint64_t v9 = (void *)SXInsertionLog;
  SXInsertionLog = (uint64_t)v8;

  os_log_t v10 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFLayout");
  int v11 = (void *)SXLayoutLog;
  SXLayoutLog = (uint64_t)v10;

  os_log_t v12 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFProxy");
  unsigned int v13 = (void *)SXProxyLog;
  SXProxyLog = (uint64_t)v12;

  SXWebContentLog = (uint64_t)os_log_create((const char *)SXLogSubsystemIdentifier, "ANFWebContent");
  return MEMORY[0x270F9A758]();
}

id SXJSONObjectObjCValueFromObject(SXJSONObject *a1, objc_selector *a2)
{
  unsigned int v3 = a1;
  os_log_t v4 = objc_opt_class();
  unsigned int v5 = [NSString stringWithUTF8String:sel_getName((SEL)a2)];
  os_log_t v6 = [v4 jsonPropertyNameForObjCPropertyName:v5];

  uint64_t v7 = [(NSDictionary *)v3->_jsonDictionary objectForKey:v6];

  return v7;
}

void sub_222AD18C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SXJSONObjectRuntimeValue(SXJSONObject *a1, NSString *a2)
{
  unsigned int v3 = a1;
  os_log_t v4 = a2;
  unsigned int v5 = [(id)objc_opt_class() jsonPropertyNameForObjCPropertyName:v4];

  os_log_t v6 = [(NSDictionary *)v3->_jsonDictionary objectForKey:v5];

  return v6;
}

void sub_222AD197C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222AD1ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_222AD1B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222AD62E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_222AD6BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222AD9E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222AE1A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_222AE1E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222AE21D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222AE9EB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_222AEAF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222AEB374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_222AEFB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34,id a35)
{
  objc_destroyWeak(v36);
  objc_destroyWeak(v35);
  objc_destroyWeak(location);
  objc_destroyWeak(a9);
  objc_destroyWeak(&a34);
  objc_destroyWeak(&a35);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_222AF6F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222AF70E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222AF7248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222AF74E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222AF8FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

id SXConditionTypes()
{
  if (SXConditionTypes_onceToken != -1) {
    dispatch_once(&SXConditionTypes_onceToken, &__block_literal_global_9);
  }
  os_log_t v0 = (void *)SXConditionTypes_types;
  return v0;
}

uint64_t __SXConditionTypes_block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", SXConditionMinViewportWidth, SXConditionMaxViewportWidth, SXConditionMinViewportAspectRatio, SXConditionMaxViewportAspectRatio, SXConditionMinContentSizeCategory, SXConditionMaxContentSizeCategory, SXConditionMinColumns, SXConditionMaxColumns, SXConditionPlatform, SXConditionViewLocation, SXConditionMinSpecVersion, SXConditionMaxSpecVersion, SXConditionHorizontalSizeClass, SXConditionVerticalSizeClass, SXConditionSubscriptionStatus, SXConditionOfferUpsellScenario, SXConditionSubscriptionActivationEligibility,
    SXConditionTesting,
    SXConditionPreferredColorScheme,
    SXConditionNewsletterSubscriptionStatus,
    SXConditionConfigurationKey,
    SXConditionApp,
  uint64_t v0 = 0);
  uint64_t v1 = SXConditionTypes_types;
  SXConditionTypes_types = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_222AFB200(_Unwind_Exception *a1)
{
}

void sub_222B03C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222B05584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222B05640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _block_invoke(int a1, int a2, id a3)
{
  return a3;
}

void sub_222B0571C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222B0910C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 88));
  _Unwind_Resume(a1);
}

void sub_222B0B1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222B0B32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double CGSizeAspectFill(double result, double a2, double a3, double a4)
{
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (*MEMORY[0x263F001B0] == result && v4 == a2) {
    return a3;
  }
  if (*MEMORY[0x263F001B0] != a3 || v4 != a4)
  {
    double v7 = a2 / a4;
    if (result / a3 >= v7) {
      double v7 = result / a3;
    }
    return result * v7 / (result * v7 / a3);
  }
  return result;
}

double CalculateMargin(double a1, double a2, double a3)
{
  return a2 / a3 * a1;
}

double CalculateColumnWidth(uint64_t a1, double a2, double a3, double a4)
{
  float v4 = (a2 + a3 * -2.0 - (double)(a1 - 1) * a4) / (double)a1;
  return floorf(v4);
}

double CalculateMinimumColumnWidth(uint64_t a1, double a2, double a3, double a4)
{
  float v4 = (a2 + a3 * -2.0 - (a4 * (double)a1 + -1.0)) / (double)a1;
  return floorf(v4);
}

const char **SXJSONObjectEntryForName(const char *__s2)
{
  if (!__s2) {
    return 0;
  }
  uint64_t v1 = dword_26AB6C7DC;
  if (dword_26AB6C7DC < 1) {
    return 0;
  }
  unsigned int v3 = (const char **)_primitives;
  int v4 = *(unsigned __int8 *)__s2;
  while (*(unsigned __int8 *)*v3 != v4 || strcmp(*v3, __s2))
  {
    v3 += 4;
    if (!--v1) {
      return 0;
    }
  }
  return v3;
}

const char **SXJSONObjectPrimitivesEncodeForName(const char *a1)
{
  uint64_t result = SXJSONObjectEntryForName(a1);
  if (result) {
    return (const char **)result[1];
  }
  return result;
}

double CLLocationCoordinate2DObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  uint64_t v2 = SXJSONObjectObjCValueFromObject(a1, a2);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v3 = [v2 objectForKey:@"latitude"];
    int v4 = [v2 objectForKey:@"longitude"];
    [v3 doubleValue];
    CLLocationDegrees v6 = v5;
    [v4 doubleValue];
    *(void *)&double v8 = *(_OWORD *)&CLLocationCoordinate2DMake(v6, v7);
  }
  else
  {
    *(void *)&double v8 = *(_OWORD *)&CLLocationCoordinate2DMake(0.0, 0.0);
  }

  return v8;
}

void sub_222B25408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SXBundle()
{
  if (SXBundle_onceToken != -1) {
    dispatch_once(&SXBundle_onceToken, &__block_literal_global_32);
  }
  uint64_t v0 = (void *)SXBundle___SXBundle;
  return v0;
}

uint64_t __SXBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = SXBundle___SXBundle;
  SXBundle___SXBundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

double CGPointFromObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  uint64_t v2 = SXJSONObjectObjCValueFromObject(a1, a2);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v3 = [v2 objectForKeyedSubscript:@"x"];
    [v3 floatValue];
    float v5 = v4;
    CLLocationDegrees v6 = [v2 objectForKeyedSubscript:@"y"];
    [v6 floatValue];
    double v7 = v5;
  }
  else
  {
    double v7 = *MEMORY[0x263F00148];
  }

  return v7;
}

void sub_222B2D4EC(_Unwind_Exception *a1)
{
  float v4 = v3;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_222B32230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222B360E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_222B36EE0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_222B37394(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_222B37A10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_222B37C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222B37EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id *SXComponentDependencyCreate(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  return +[SXComponentDependency componentDependencyFromComponentIdentifier:toComponentIdentifier:fromLayoutAttribute:toAttribute:withDescriptor:]((uint64_t)SXComponentDependency, a1, a2, a3, a4, a5);
}

__CFString *NSStringFromDependencyAttribute(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = @"Size";
    if (a1 == 1) {
      uint64_t v2 = @"Position";
    }
    uint64_t v3 = v2;
  }
  else
  {
    uint64_t v3 = @"None";
  }
  return v3;
}

void sub_222B3E614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_222B3E93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222B3EE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222B3F14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double UIEdgeInsetsFromObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  uint64_t v2 = SXJSONObjectObjCValueFromObject(a1, a2);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v3 = [v2 objectForKey:@"top"];
    float v4 = [v2 objectForKey:@"bottom"];
    float v5 = [v2 objectForKey:@"left"];
    CLLocationDegrees v6 = [v2 objectForKey:@"right"];
    [v3 floatValue];
    float v8 = v7;
    [v5 floatValue];
    [v4 floatValue];
    [v6 floatValue];
    double v9 = v8;
  }
  else
  {
    double v9 = *MEMORY[0x263F1D1C0];
  }

  return v9;
}

void sub_222B4B07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222B4DF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

objc_object *SXJSONObjectRuntimeConvertValue(void *a1, int *a2, void *a3, void *a4, objc_class *a5)
{
  v41[3] = *MEMORY[0x263EF8340];
  uint64_t v9 = a1;
  id v10 = a3;
  id v11 = a4;
  if (v9)
  {
    os_log_t v12 = [MEMORY[0x263EFF9D0] null];

    if (v12 != v9)
    {
      unsigned int v13 = (objc_class *)objc_opt_class();
      id v14 = v11;
      v39 = SXJSONObjectRuntimeGenerateLookupKey(v13, (const char *)[v14 UTF8String]);
      +[SXJSONObject lock];
      uint64_t v15 = +[SXJSONObject propertyHashTable];
      id v16 = (id)[v15 objectForKey:v39];

      +[SXJSONObject unlock];
      if (v16) {
        int v17 = 6;
      }
      else {
        int v17 = SXJSONObjectTypeForValue(v9);
      }
      if (a2) {
        *a2 = v17;
      }
      if (v17 != 6)
      {
        uint64_t v18 = v9;
LABEL_28:

        goto LABEL_29;
      }
      if (a5)
      {
LABEL_24:
        if (class_respondsToSelector(a5, sel_initWithValueClassBlock_objectValueClassBlock_purgeBlock_andJSONObject_andVersion_))
        {
          id v28 = [(id)objc_opt_class() objectValueClassBlockForPropertyWithName:v14];
          v29 = [(id)objc_opt_class() valueClassBlockForPropertyWithName:v14];
          v30 = [(id)objc_opt_class() purgeClassBlockForPropertyWithName:v14];
          id v31 = [a5 alloc];
          v32 = [v10 specificationVersion];
          uint64_t v18 = (objc_object *)[v31 initWithValueClassBlock:v29 objectValueClassBlock:v28 purgeBlock:v30 andJSONObject:v9 andVersion:v32];
        }
        else
        {
          if (!class_respondsToSelector(a5, sel_initWithJSONObject_andVersion_))
          {
            v36 = (void *)MEMORY[0x263EFF940];
            v40[0] = @"Parent";
            v40[1] = @"Property";
            v41[0] = v10;
            v41[1] = v14;
            v40[2] = @"Class";
            v41[2] = a5;
            uint64_t v37 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
            id v38 = [v36 exceptionWithName:@"ClassNotSupportedBySXJSONObject" reason:@"The class cannot be initialized because it does not support an initialize function for SXJSONObject" userInfo:v37];

            objc_exception_throw(v38);
          }
          id v33 = [a5 alloc];
          v34 = [v10 specificationVersion];
          uint64_t v18 = (objc_object *)[v33 initWithJSONObject:v9 andVersion:v34];
        }
        goto LABEL_28;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        Class v19 = [(objc_object *)v9 objectForKeyedSubscript:@"type"];
      }
      else
      {
        Class v19 = 0;
      }
      v20 = (objc_class *)objc_opt_class();
      id v21 = v14;
      unsigned int v22 = SXJSONObjectRuntimeGenerateLookupKey(v20, (const char *)[v21 UTF8String]);
      +[SXJSONObject lock];
      uint64_t v23 = +[SXJSONObject propertyHashTable];
      a5 = [v23 objectForKey:v22];

      +[SXJSONObject unlock];
      if (!v19)
      {
LABEL_23:

        goto LABEL_24;
      }
      v24 = [(id)objc_opt_class() objectValueClassBlockForPropertyWithName:v21];
      if (v24)
      {
        v25 = [v10 specificationVersion];
        uint64_t v26 = ((uint64_t (**)(void, objc_object *, objc_class *, void *))v24)[2](v24, v9, a5, v25);
      }
      else
      {
        uint64_t v27 = [(id)objc_opt_class() valueClassBlockForPropertyWithName:v21];
        v25 = (void *)v27;
        if (!v27)
        {
LABEL_22:

          goto LABEL_23;
        }
        uint64_t v26 = (*(uint64_t (**)(uint64_t, void *, objc_class *))(v27 + 16))(v27, v19, a5);
      }
      a5 = (objc_class *)v26;
      goto LABEL_22;
    }
  }
  uint64_t v18 = 0;
  if (a2) {
    *a2 = 1;
  }
LABEL_29:

  return v18;
}

void sub_222B51148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

uint64_t SXJSONObjectTypeForValue(objc_object *a1)
{
  uint64_t v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = 2;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = 3;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v2 = 4;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v2 = 5;
        }
        else
        {
          uint64_t v3 = [MEMORY[0x263EFF9D0] null];
          uint64_t v2 = v3 == v1;
        }
      }
    }
  }

  return v2;
}

void sub_222B512E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SXJSONObjectRuntimeAddSetterToClass(objc_class *a1, const char *a2, const char *a3)
{
  id v3 = [MEMORY[0x263EFF940] exceptionWithName:@"NotImplemented" reason:@"Currently not implemented" userInfo:0];
  objc_exception_throw(v3);
}

void *SXJSONObjectRuntimeCopyPropertyTypeEncoding(const char *a1, char **a2)
{
  id v3 = a1 + 1;
  if (a1[1] == 44)
  {
    size_t v4 = 1;
  }
  else
  {
    size_t v4 = strlen(a1);
    uint64_t v6 = 0;
    if (v4 <= 1) {
      size_t v4 = 1;
    }
    while (v4 - 1 != v6)
    {
      int v7 = a1[v6++ + 2];
      if (v7 == 44)
      {
        size_t v4 = v6 + 1;
        break;
      }
    }
  }
  size_t v8 = v4 - 1;
  uint64_t v9 = (char *)malloc_type_malloc(v4, 0x100004077774924uLL);
  *a2 = v9;
  uint64_t result = memcpy(v9, v3, v8);
  (*a2)[v8] = 0;
  return result;
}

uint64_t SXDefaultTextStyleIdentifierForRole(uint64_t a1)
{
  return [NSString stringWithFormat:@"default-%@", a1];
}

void sub_222B5486C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_222B5B210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SXComponentContentInsetObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  id v3 = SXJSONObjectObjCValueFromObject(a1, a2);
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v3 BOOLValue])
      {

        uint64_t v4 = 1;
        uint64_t v5 = 0x100000000;
        uint64_t v6 = 1;
        unsigned int v7 = 1;
LABEL_15:
        uint64_t v15 = 0x1000000;
        return v5 | v15 | (v4 << 16) | (v6 << 8) | v7;
      }
      goto LABEL_11;
    }
  }
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_11:

    uint64_t v5 = 0;
    uint64_t v4 = 0;
    uint64_t v6 = 0;
    unsigned int v7 = 0;
    goto LABEL_12;
  }
  size_t v8 = [v3 objectForKey:@"left"];
  uint64_t v6 = [v8 BOOLValue];

  uint64_t v9 = [v3 objectForKey:@"top"];
  int v10 = [v9 BOOLValue];

  id v11 = [v3 objectForKey:@"right"];
  int v12 = [v11 BOOLValue];

  unsigned int v13 = [v3 objectForKey:@"bottom"];
  int v14 = [v13 BOOLValue];

  if ((v6 & v10) == 1)
  {
    unsigned int v7 = v12 & v14;

    uint64_t v6 = 1;
    uint64_t v4 = 1;
    if ((v14 & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = v10 & ~v6;

    unsigned int v7 = 0;
    if (!v14)
    {
LABEL_9:
      uint64_t v5 = 0;
      uint64_t v15 = 0;
      if (!v12) {
        return v5 | v15 | (v4 << 16) | (v6 << 8) | v7;
      }
      goto LABEL_15;
    }
  }
  uint64_t v5 = 0x100000000;
  if (v12) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v15 = 0;
  return v5 | v15 | (v4 << 16) | (v6 << 8) | v7;
}

void sub_222B5B874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double SXJSONObjectCustomFloatValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  id v3 = a1;
  Name = sel_getName((SEL)a2);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [NSString stringWithUTF8String:Name];
  unsigned int v7 = [v5 jsonPropertyNameForObjCPropertyName:v6];

  str = 0;
  SXJSONObjectRuntimeCopyCustomGetterName(Name, &str);
  Uid = sel_getUid(str);
  free(str);
  uint64_t v9 = [(NSDictionary *)v3->_jsonDictionary objectForKey:v7];
  int v10 = v9;
  uint64_t v11 = 1;
  unsigned int v16 = 1;
  if (v9)
  {
    unsigned int v16 = 6;
    int v12 = SXJSONObjectRuntimeConvertValue(v9, (int *)&v16, v3, v7, 0);
    uint64_t v11 = v16;
  }
  else
  {
    int v12 = 0;
  }
  objc_msgSend(v3, Uid, v12, v11);
  double v14 = v13;

  return v14;
}

void sub_222B5BC68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SXJSONObjectCustomObjectValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  id v3 = a1;
  Name = sel_getName((SEL)a2);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [NSString stringWithUTF8String:Name];
  unsigned int v7 = [v5 jsonPropertyNameForObjCPropertyName:v6];

  str = 0;
  SXJSONObjectRuntimeCopyCustomGetterName(Name, &str);
  Uid = sel_getUid(str);
  free(str);
  uint64_t v9 = [(NSDictionary *)v3->_jsonDictionary objectForKey:v7];
  int v14 = 6;
  int v10 = SXJSONObjectRuntimeConvertValue(v9, &v14, v3, v7, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v14 = 5;
    uint64_t v11 = v9;
  }
  else
  {
    uint64_t v11 = v10;
  }
  int v12 = objc_msgSend(v3, Uid, v11);

  return v12;
}

void sub_222B5BE10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SXJSONObjectCustomIntegerValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  id v3 = a1;
  Name = sel_getName((SEL)a2);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [NSString stringWithUTF8String:Name];
  unsigned int v7 = [v5 jsonPropertyNameForObjCPropertyName:v6];

  str = 0;
  SXJSONObjectRuntimeCopyCustomGetterName(Name, &str);
  Uid = sel_getUid(str);
  free(str);
  uint64_t v9 = [(NSDictionary *)v3->_jsonDictionary objectForKey:v7];
  int v10 = v9;
  uint64_t v11 = 1;
  unsigned int v15 = 1;
  if (v9)
  {
    unsigned int v15 = 6;
    int v12 = SXJSONObjectRuntimeConvertValue(v9, (int *)&v15, v3, v7, 0);
    uint64_t v11 = v15;
  }
  else
  {
    int v12 = 0;
  }
  id v13 = objc_msgSend(v3, Uid, v12, v11);

  return v13;
}

void sub_222B5BF90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SXJSONObjectCustomBoolValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  id v3 = a1;
  Name = sel_getName((SEL)a2);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [NSString stringWithUTF8String:Name];
  unsigned int v7 = [v5 jsonPropertyNameForObjCPropertyName:v6];

  str = 0;
  SXJSONObjectRuntimeCopyCustomGetterName(Name, &str);
  Uid = sel_getUid(str);
  free(str);
  uint64_t v9 = [(NSDictionary *)v3->_jsonDictionary objectForKey:v7];
  int v10 = v9;
  uint64_t v11 = 1;
  unsigned int v15 = 1;
  if (v9)
  {
    unsigned int v15 = 6;
    int v12 = SXJSONObjectRuntimeConvertValue(v9, (int *)&v15, v3, v7, 0);
    uint64_t v11 = v15;
  }
  else
  {
    int v12 = 0;
  }
  id v13 = objc_msgSend(v3, Uid, v12, v11);

  return v13;
}

void sub_222B5C110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SXSpecVersionCompare(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 componentsSeparatedByString:@"."];
  uint64_t v5 = [v3 componentsSeparatedByString:@"."];
  uint64_t v6 = [v4 count];
  if (v6 | [v5 count])
  {
    unint64_t v7 = 0;
    while (1)
    {
      size_t v8 = @"0";
      if (v7 < [v4 count])
      {
        size_t v8 = [v4 objectAtIndex:v7];
      }
      uint64_t v9 = @"0";
      if (v7 < [v5 count])
      {
        uint64_t v9 = [v5 objectAtIndex:v7];
      }
      uint64_t v10 = [(__CFString *)v8 compare:v9 options:64];

      if (v10) {
        break;
      }
      ++v7;
      unint64_t v11 = [v4 count];
      unint64_t v12 = [v5 count];
      if (v11 <= v12) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v7 >= v13) {
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    uint64_t v10 = 0;
  }

  return v10;
}

void sub_222B649CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_222B64F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222B652EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222B6E678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222B70388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222B70494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222B70510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222B70654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_222B70824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222B70A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_222B70B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222B70C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_222B70D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_222B70EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_222B70F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SXCanvasCreate(void *a1, id *a2, void *a3)
{
}

void SXCanvasCreateWithClass(void *a1, id *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  if (!a2 || !a3) {
    goto LABEL_15;
  }
  id v21 = v9;
  if (a4)
  {
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    a4 = objc_opt_class();
    if (!a5) {
LABEL_7:
    }
      a5 = objc_opt_class();
  }
  if (([a4 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x263F7C7F0] currentHandler];
    unint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void SXCanvasCreateWithClass(__strong id<TSDInteractiveCanvasControllerDelegate>, TSDInteractiveCanvasController *__autoreleasing *, __autoreleasing id<TSDCanvasLayerHosting> *, __unsafe_unretained Class, __unsafe_unretained Class)");
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTangierCanvasUtilities.mm"];
    [v10 handleFailureInFunction:v11 file:v12 lineNumber:42 description:@"bogus ICC class"];
  }
  if (([a5 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    unint64_t v13 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void SXCanvasCreateWithClass(__strong id<TSDInteractiveCanvasControllerDelegate>, TSDInteractiveCanvasController *__autoreleasing *, __autoreleasing id<TSDCanvasLayerHosting> *, __unsafe_unretained Class, __unsafe_unretained Class)");
    uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTangierCanvasUtilities.mm"];
    [v13 handleFailureInFunction:v14 file:v15 lineNumber:43 description:@"bogus CVC class"];
  }
  id v16 = *a2;
  if (!v16)
  {
    id v16 = objc_alloc_init((Class)a4);
    [v16 setDelegate:v21];
    int v17 = [(TSDCanvasEditor *)[SXTextTangierCanvasEditor alloc] initWithInteractiveCanvasController:v16];
    [v16 setCanvasEditor:v17];
  }
  id v18 = objc_alloc_init((Class)a5);
  [v16 setLayerHost:v18];
  [v18 setInteractiveCanvasController:v16];
  id v19 = v16;
  *a2 = v19;
  id v20 = v18;
  *a3 = v20;

  id v9 = v21;
LABEL_15:
}

void sub_222B71CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_222B734F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222B738B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222B75D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a26, 8);
  objc_destroyWeak(v26);
  objc_destroyWeak((id *)(v28 - 120));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_222B76664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double MKCoordinateSpanObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  uint64_t v2 = SXJSONObjectObjCValueFromObject(a1, a2);
  if (v2)
  {
    objc_opt_class();
    double v3 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v2 objectForKey:@"latitudeDelta"];
      uint64_t v5 = [v2 objectForKey:@"longitudeDelta"];
      [v4 doubleValue];
      double v3 = v6;
      [v5 doubleValue];
    }
  }
  else
  {
    double v3 = 0.0;
  }

  return v3;
}

void sub_222B7BD90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double SXJSONObjectFloatValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  double v3 = a1;
  uint64_t v4 = [NSString stringWithUTF8String:sel_getName((SEL)a2)];
  uint64_t v5 = SXJSONObjectRuntimeValue(v3, v4);
  if (!v5
    || ([MEMORY[0x263EFF9D0] null],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    double v8 = 1.79769313e308;
  }
  else
  {
    [v5 doubleValue];
    double v8 = v7;
  }

  return v8;
}

void sub_222B7E164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SXJSONObjectIntegerValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  double v3 = a1;
  uint64_t v4 = [NSString stringWithUTF8String:sel_getName((SEL)a2)];
  uint64_t v5 = SXJSONObjectRuntimeValue(v3, v4);
  if (!v5
    || ([MEMORY[0x263EFF9D0] null],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = [v5 integerValue];
  }

  return v7;
}

void sub_222B7E23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SXJSONObjectUnsignedIntegerValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  double v3 = a1;
  uint64_t v4 = [NSString stringWithUTF8String:sel_getName((SEL)a2)];
  uint64_t v5 = SXJSONObjectRuntimeValue(v3, v4);
  if (!v5
    || ([MEMORY[0x263EFF9D0] null],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    uint64_t v7 = -1;
  }
  else
  {
    uint64_t v7 = [v5 unsignedIntegerValue];
  }

  return v7;
}

void sub_222B7E314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SXJSONObjectBoolValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  double v3 = a1;
  uint64_t v4 = [NSString stringWithUTF8String:sel_getName((SEL)a2)];
  uint64_t v5 = SXJSONObjectRuntimeValue(v3, v4);
  if (!v5
    || ([MEMORY[0x263EFF9D0] null],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v5 BOOLValue];
  }

  return v7;
}

void sub_222B7E3EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222B848B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222B84DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222B864A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_222B92A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t charToInt(int a1)
{
  unsigned int v1 = a1 - 48;
  if ((a1 - 65) >= 6) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = a1 - 55;
  }
  if ((a1 - 97) <= 5) {
    unsigned int v3 = a1 - 87;
  }
  else {
    unsigned int v3 = v2;
  }
  if (v1 <= 9) {
    return v1;
  }
  else {
    return v3;
  }
}

void sub_222B99498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222B997A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222B99A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222B99CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222B99F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222B9BA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_222B9EE7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222B9F038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222B9F9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,void *a21,uint64_t a22,void *a23,uint64_t a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_222BA00B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_222BA04C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_222BA0770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BA097C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BA0D50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BA4020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222BAB8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id *location,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a71);
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x278], 8);
  _Block_object_dispose(&STACK[0x2B8], 8);
  _Unwind_Resume(a1);
}

void sub_222BB02EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Unwind_Resume(a1);
}

void sub_222BB149C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

double CGSizeFromObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  unsigned int v2 = SXJSONObjectObjCValueFromObject(a1, a2);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v3 = [v2 objectForKeyedSubscript:@"width"];
    [v3 floatValue];
    float v5 = v4;
    double v6 = [v2 objectForKeyedSubscript:@"height"];
    [v6 floatValue];
    double v7 = v5;
  }
  else
  {
    double v7 = *MEMORY[0x263F001B0];
  }

  return v7;
}

void sub_222BB4BD0(_Unwind_Exception *a1)
{
  float v4 = v3;

  _Unwind_Resume(a1);
}

double SXConvertibleValueObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  unsigned int v2 = SXJSONObjectObjCValueFromObject(a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lipt", objc_msgSend(v2, "integerValue"));

    unsigned int v2 = (void *)v3;
  }
  id v4 = v2;
  [v4 floatValue];
  id v5 = v4;
  double v6 = v5;
  if (v5
    && ([v5 hasSuffix:@"pt"] & 1) == 0
    && ([v6 hasSuffix:@"vh"] & 1) == 0
    && ([v6 hasSuffix:@"vw"] & 1) == 0
    && ([v6 hasSuffix:@"vmin"] & 1) == 0
    && ([v6 hasSuffix:@"vmax"] & 1) == 0
    && ([v6 hasSuffix:@"gut"] & 1) == 0
    && ([v6 hasSuffix:@"dg"] & 1) == 0
    && ([v6 hasSuffix:@"cw"] & 1) == 0
    && ([v6 hasSuffix:@"dm"] & 1) == 0)
  {
    [v6 hasSuffix:@"pw"];
  }

  return result;
}

void sub_222BB65E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void UIBezierPathSilexPathApplier(void *a1, const CGPathElement *a2)
{
  uint64_t v3 = a1;
  id v11 = v3;
  switch(a2->type)
  {
    case kCGPathElementMoveToPoint:
      objc_msgSend(v3, "moveToPoint:", a2->points->x, a2->points->y);
      uint64_t v3 = v11;
      break;
    case kCGPathElementAddLineToPoint:
      objc_msgSend(v3, "lineToPoint:", a2->points->x, a2->points->y);
      uint64_t v3 = v11;
      break;
    case kCGPathElementAddQuadCurveToPoint:
      id v4 = (double *)malloc_type_calloc(3uLL, 0x10uLL, 0x1000040451B5BE8uLL);
      uint64_t v5 = objc_msgSend(v11, "elementAtIndex:associatedPoints:", objc_msgSend(v11, "elementCount") - 1, v4);
      double v6 = (double *)MEMORY[0x263F00148];
      double v7 = (double *)(MEMORY[0x263F00148] + 8);
      if (!v5)
      {
        double v6 = v4;
        double v7 = v4 + 1;
      }
      if (v5 == 1)
      {
        double v6 = v4;
        double v7 = v4 + 1;
      }
      if (v5 == 2)
      {
        double v6 = v4 + 4;
        double v7 = v4 + 5;
      }
      double v8 = *v6;
      points = a2->points;
      objc_msgSend(v11, "curveToPoint:controlPoint1:controlPoint2:", points[1].x, points[1].y, v8 + (points->x - v8) * 0.666666687, *v7 + (points->y - *v7) * 0.666666687, points[1].x + (points->x - points[1].x) * 0.666666687, points[1].y + (points->y - points[1].y) * 0.666666687);
      uint64_t v3 = v11;
      break;
    case kCGPathElementAddCurveToPoint:
      uint64_t v10 = a2->points;
      objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v10[2].x, v10[2].y, v10->x, v10->y, v10[1].x, v10[1].y);
      uint64_t v3 = v11;
      break;
    case kCGPathElementCloseSubpath:
      [v3 closePath];
      uint64_t v3 = v11;
      break;
    default:
      break;
  }
}

void sub_222BB8B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_222BB8C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BB9A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222BC1134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double MKCoordinateRegionObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  unsigned int v2 = SXJSONObjectObjCValueFromObject(a1, a2);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v3 = [v2 objectForKey:@"center"];
    id v4 = [v2 objectForKey:@"span"];
    uint64_t v5 = [v3 objectForKey:@"latitude"];
    double v6 = [v3 objectForKey:@"longitude"];
    double v7 = [v4 objectForKey:@"latitudeDelta"];
    double v8 = [v4 objectForKey:@"longitudeDelta"];
    [v5 doubleValue];
    CLLocationDegrees v10 = v9;
    [v6 doubleValue];
    *(void *)&double v12 = *(_OWORD *)&CLLocationCoordinate2DMake(v10, v11);
    [v7 doubleValue];
    [v8 doubleValue];
  }
  else
  {
    *(void *)&double v12 = *(_OWORD *)&CLLocationCoordinate2DMake(0.0, 0.0);
  }

  return v12;
}

void sub_222BC32AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BC4394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_222BC5718(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_222BCD2F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BCD3B4(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_222BCD4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BCD5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v12 = v11;

  _Unwind_Resume(a1);
}

void sub_222BCD66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_222BCD90C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BCD9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_222BCDAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BCDC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_222BCDCCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BCDDB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_222BCDE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_222BCDEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_222BCDFAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BCE098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BCE208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_222BCE2D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BCE340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BCE3C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BCE4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BCE678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_222BCF8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a72);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose((const void *)(v72 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_222BCFCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

double SXDataTablePaddingObjCValue(SXJSONObject *a1, objc_selector *a2, ...)
{
  unsigned int v2 = SXJSONObjectObjCValueFromObject(a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 floatValue];
    float v4 = v3;
    [v2 floatValue];
    [v2 floatValue];
    [v2 floatValue];
    double v5 = v4;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v6 = [v2 objectForKey:@"top"];
      [v6 floatValue];
      float v8 = v7;
      double v9 = [v2 objectForKey:@"right"];
      [v9 floatValue];
      CLLocationDegrees v10 = [v2 objectForKey:@"bottom"];
      [v10 floatValue];
      CLLocationDegrees v11 = [v2 objectForKey:@"left"];
      [v11 floatValue];
      double v5 = v8;
    }
    else
    {
      double v5 = 1.79769313e308;
    }
  }

  return v5;
}

void sub_222BD0590(_Unwind_Exception *a1)
{
  double v6 = v5;

  _Unwind_Resume(a1);
}

void sub_222BD0C60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(exception_object);
    uint64_t v16 = &_os_log_internal;
    id v17 = &_os_log_internal;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      id v18 = [NSString alloc];
      v24 = [v15 reason];
      -[SXTextSource initWithString:smartFieldFactory:dataSource:documentLanguageProvider:fontAttributesConstructor:]((void *)[v18 initWithFormat:@"A %@ exception was detected while inserting and removing newlines from string: %@"], &buf, v24);
    }

    uint64_t v19 = [v14 deletedRangeOffsets];
    [v19 removeAllIndexes];

    id v20 = [v14 insertedRangeOffsets];
    [v20 removeAllIndexes];

    id v21 = [v14 rangesExcludedOfParagraphSpacing];
    [v21 removeAllIndexes];

    uint64_t v22 = [v13 copy];
    uint64_t v23 = (void *)v14[2];
    v14[2] = v22;

    objc_end_catch();
    JUMPOUT(0x222BD0C0CLL);
  }
  _Unwind_Resume(exception_object);
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  MEMORY[0x270EDDFC8]((__n128)aspectRatio, *(__n128 *)&aspectRatio.height, (__n128)boundingRect.origin, *(__n128 *)&boundingRect.origin.y, (__n128)boundingRect.size, *(__n128 *)&boundingRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x270EFB908](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB950](retstr, tx, ty, tz);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x270EE52A8](tokenizer, index);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x270EE5D58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x270EE62F0](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF4FF8](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5038](provider, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5048](isrc);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

BOOL CGPathIsRect(CGPathRef path, CGRect *rect)
{
  return MEMORY[0x270EE70E0](path, rect);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

uint64_t CTFontDescriptorGetTextStyleSize()
{
  return MEMORY[0x270EE9BA8]();
}

uint64_t IsWhitespaceCharacter()
{
  return MEMORY[0x270F79768]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MEMORY[0x270EF58C8]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

uint64_t NFInternalBuild()
{
  return MEMORY[0x270F50028]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t TFCallbackScopeAny()
{
  return MEMORY[0x270F7A868]();
}

uint64_t TSDDistance()
{
  return MEMORY[0x270F79770]();
}

uint64_t TSDRectWithSize()
{
  return MEMORY[0x270F79778]();
}

uint64_t TSDSubtractPoints()
{
  return MEMORY[0x270F79780]();
}

uint64_t String()
{
  return MEMORY[0x270F79788]();
}

uint64_t TSUClassAndProtocolCast()
{
  return MEMORY[0x270F79810]();
}

uint64_t TSUDynamicCast()
{
  return MEMORY[0x270F79890]();
}

uint64_t TSUProtocolCast()
{
  return MEMORY[0x270F799A0]();
}

uint64_t TSWPFastCreateFontForStyle()
{
  return MEMORY[0x270F797A0]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  MEMORY[0x270F05ED8](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x270F05F18]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

uint64_t UIAccessibilityLanguageForLanguage()
{
  return MEMORY[0x270F809C8]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x270F05FC0](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F05FC8](category);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t TSWPFontHeightInfoForFont(const __CTFont *a1)
{
  return MEMORY[0x270F797A8](a1);
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x270F9A400](cls, name, imp, types);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x270F9A438](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x270F9A440](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x270F9A490](cls);
}

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return MEMORY[0x270F9A4B8](cls, sel);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x270F9A510](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x270F9A680](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D8](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x270F9AA80](property, outCount);
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x270F9AA90](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x270F9AA98](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x270F9AAB8](proto, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x270F9AAC0](proto, outCount);
}

BOOL protocol_isEqual(Protocol *proto, Protocol *other)
{
  return MEMORY[0x270F9AAD8](proto, other);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x270F9AAE8](str);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x270F9AAF8](str);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6E8](__str, __endptr, *(void *)&__base);
}