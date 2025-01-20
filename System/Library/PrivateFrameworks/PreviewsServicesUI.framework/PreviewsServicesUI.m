void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id UVPreviewsServicesError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = (objc_class *)NSString;
  id v10 = a1;
  v11 = (void *)[[v9 alloc] initWithFormat:v10 arguments:&a9];

  uint64_t v15 = *MEMORY[0x263F08320];
  v16[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"UVErrorDomain" code:-7201 userInfo:v12];

  return v13;
}

uint64_t UVSuppressedPresentationFromCatalystErrorCode()
{
  return -1;
}

uint64_t UVSceneIdentifierToPersistenceIdentifier(void *a1, const char *a2)
{
  return [a1 stringByReplacingOccurrencesOfString:@"UV-InjectedScene" withString:@"UV-Persistence"];
}

uint64_t UVPersistenceIdentifierToSceneIdentifier(void *a1, const char *a2)
{
  return [a1 stringByReplacingOccurrencesOfString:@"UV-Persistence" withString:@"UV-InjectedScene"];
}

id _PreviewSceneSettingValueDescription(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (a1 == 1100102)
  {
    uint64_t v5 = UVPreviewSceneLayoutDescription([v3 integerValue]);
    goto LABEL_5;
  }
  if (a1 == 1100101)
  {
    [v3 CGSizeValue];
    uint64_t v5 = NSStringFromCGSize(v9);
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

__CFString *UVPreviewSceneLayoutDescription(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      v2 = @"custom";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"unknown-%ld", a1);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v2 = @"device";
  }
  return v2;
}

uint64_t sub_239964014(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_239964028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_239964060(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_239964080(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_2399640BC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_239964104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_23996410C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2399641A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 32 > 0x18)
  {
    uint64_t v9 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v12 = *(void *)(v11 + 24);
    *(void *)(v10 + 24) = v12;
    (**(void (***)(unint64_t, unint64_t))(v12 - 8))(v10, v11);
    uint64_t v13 = *(void *)(((v11 + 39) & 0xFFFFFFFFFFFFFFF8) + 24);
    *(void *)(((v10 + 39) & 0xFFFFFFFFFFFFFFF8) + 24) = v13;
    (**(void (***)(void))(v13 - 8))();
  }
  return v4;
}

uint64_t sub_239964340(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  __swift_destroy_boxed_opaque_existential_0(v4);

  return __swift_destroy_boxed_opaque_existential_0((v4 + 39) & 0xFFFFFFFFFFFFFFF8);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_23996440C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)(v8 + 24);
  *(void *)(v7 + 24) = v9;
  (**(void (***)(unint64_t, unint64_t))(v9 - 8))(v7, v8);
  uint64_t v10 = *(void *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 24);
  *(void *)(((v7 + 39) & 0xFFFFFFFFFFFFFFF8) + 24) = v10;
  (**(void (***)(void))(v10 - 8))();
  return a1;
}

uint64_t sub_239964520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  unint64_t v7 = (uint64_t *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (uint64_t *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  __swift_assign_boxed_opaque_existential_0(v7, v8);
  __swift_assign_boxed_opaque_existential_0((uint64_t *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8), (uint64_t *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        unint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t sub_2399647DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  uint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  long long v9 = v8[1];
  *uint64_t v7 = *v8;
  v7[1] = v9;
  uint64_t v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  return a1;
}

uint64_t sub_239964870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  uint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  long long v9 = v8[1];
  *uint64_t v7 = *v8;
  v7[1] = v9;
  uint64_t v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  long long v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  return a1;
}

uint64_t sub_239964914(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 32;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x239964A68);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 24);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_239964A7C(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 32;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_42;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if (v7 < 0x7FFFFFFF)
            {
              v19 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                v19[2] = 0;
                v19[3] = 0;
                void *v19 = a2 ^ 0x80000000;
                v19[1] = 0;
              }
              else
              {
                v19[3] = a2 - 1;
              }
            }
            else
            {
              v18 = *(void (**)(void))(v6 + 56);
              v18();
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((v9 + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) == 0xFFFFFFE0) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((v9 + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) == 0xFFFFFFE0) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((((v9 + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) != 0xFFFFFFE0)
  {
    int v17 = ~v8 + a2;
    bzero(a1, ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 32);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x239964C74);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for InvalidObject()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_239964CB4()
{
  return 0;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_239964E18(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return 0x657263736C6C7566;
  }
  sub_23997FE70();
  type metadata accessor for CGSize(0);
  sub_23997FFA0();
  return 0;
}

uint64_t sub_239964EC0(uint64_t a1, uint64_t a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 16);
  unsigned int v4 = *(unsigned __int8 *)(a2 + 16);
  uint64_t result = v3 & v4;
  if ((v3 & 1) == 0 && (v4 & 1) == 0)
  {
    double v6 = *(double *)(a1 + 8);
    BOOL v7 = *(double *)a1 == *(double *)a2;
    return v6 == *(double *)(a2 + 8) && v7;
  }
  return result;
}

uint64_t sub_239964EF4()
{
  return sub_239964E18(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

void static InjectedScene.Layout.fullscreen.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
}

void static InjectedScene.Layout.fixed(size:)(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(unsigned char *)(a1 + 16) = 0;
}

void static InjectedScene.Layout.flexible(maximumSize:)(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(unsigned char *)(a1 + 16) = 0;
}

uint64_t InjectedScene.Layout.description.getter()
{
  if (*(unsigned char *)(v0 + 16)) {
    return 0x657263736C6C7566;
  }
  sub_23997FE70();
  type metadata accessor for CGSize(0);
  sub_23997FFA0();
  return 0;
}

BOOL static InjectedScene.Layout.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 16) & 1) == 0) {
    return (*(unsigned char *)(a2 + 16) & 1) == 0
  }
        && *(double *)a1 == *(double *)a2
        && *(double *)(a1 + 8) == *(double *)(a2 + 8);
  return (*(unsigned char *)(a2 + 16) & 1) != 0;
}

uint64_t sub_239965008(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a1 + 16);
  uint64_t result = *(unsigned __int8 *)(a2 + 16);
  if ((v3 & 1) == 0)
  {
    if (result)
    {
      return 0;
    }
    else
    {
      double v5 = *(double *)a1;
      BOOL v6 = *(double *)(a1 + 8) == *(double *)(a2 + 8);
      return v5 == *(double *)a2 && v6;
    }
  }
  return result;
}

uint64_t InjectedScene.sceneIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_239965074(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t static InjectedScene.checkout(inRunningTarget:)()
{
  v7[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_23997FE20();
  v7[0] = 0;
  id v2 = objc_msgSend(v0, sel_injectInRunningTarget_error_, v1, v7);

  id v3 = v7[0];
  if (v2)
  {
    swift_allocObject();
    id v4 = v3;
    return sub_2399652A0(v2);
  }
  else
  {
    id v6 = v7[0];
    sub_23997FD00();

    return swift_willThrow();
  }
}

uint64_t static InjectedScene.checkout(in:)(uint64_t a1)
{
  v7[1] = *(id *)MEMORY[0x263EF8340];
  v7[0] = 0;
  id v1 = objc_msgSend(self, sel_injectInProcess_error_, a1, v7);
  id v2 = v7[0];
  if (v1)
  {
    id v3 = v1;
    swift_allocObject();
    id v4 = v2;
    return sub_2399652A0(v3);
  }
  else
  {
    id v6 = v7[0];
    sub_23997FD00();

    return swift_willThrow();
  }
}

uint64_t sub_2399652A0(void *a1)
{
  *(void *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0;
  *(_WORD *)(v1 + 72) = 256;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AE0);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 24) = 0;
  uint64_t v4 = MEMORY[0x263F8EE80];
  *(void *)(v3 + 16) = MEMORY[0x263F8EE80];
  *(void *)(v1 + 80) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AE8);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = v4;
  *(void *)(v1 + 88) = v5;
  uint64_t v6 = swift_allocObject();
  *(_DWORD *)(v6 + 24) = 0;
  *(void *)(v6 + 16) = v4;
  *(void *)(v1 + 96) = v6;
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 24) = 0;
  *(void *)(v7 + 16) = v4;
  *(void *)(v1 + 104) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AF0);
  uint64_t v8 = swift_allocObject();
  *(_DWORD *)(v8 + 24) = 0;
  *(void *)(v8 + 16) = v4;
  *(void *)(v1 + 112) = v8;
  *(void *)(v1 + 32) = a1;
  id v9 = a1;
  id v10 = objc_msgSend(v9, sel_sceneIdentifier);
  uint64_t v11 = sub_23997FE30();
  uint64_t v13 = v12;

  *(void *)(v1 + 16) = v11;
  *(void *)(v1 + 24) = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AF8);
  uint64_t v14 = swift_allocObject();
  *(_DWORD *)(v14 + 40) = 0;
  uint64_t v15 = MEMORY[0x263F8EE78];
  *(void *)(v14 + 16) = 1;
  *(void *)(v14 + 24) = v15;
  *(_DWORD *)(v14 + 32) = 0;
  *(_WORD *)(v14 + 36) = 1;
  *(void *)(v1 + 40) = v14;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B00);
  int v17 = (void *)swift_allocObject();
  v17[4] = 0;
  v17[5] = 0;
  v17[2] = sub_239969E5C;
  v17[3] = v16;
  *(void *)(v1 + 48) = v17;
  v28 = sub_239969E70;
  v29 = v17;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 1107296256;
  v26 = sub_239966148;
  v27 = &block_descriptor_59;
  v18 = _Block_copy(&v24);
  id v19 = v9;
  swift_retain();
  swift_release();
  objc_msgSend(v19, sel_setActionHandler_, v18);
  _Block_release(v18);
  v28 = sub_239969E74;
  v29 = (void *)v1;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 1107296256;
  v26 = sub_239965074;
  v27 = &block_descriptor_62;
  v20 = _Block_copy(&v24);
  swift_retain();
  swift_release();
  objc_msgSend(v19, sel_setInvalidationHandler_, v20);

  _Block_release(v20);
  uint64_t v21 = *(void *)(v1 + 48);
  swift_beginAccess();
  uint64_t v22 = *(void *)(v21 + 32);
  *(void *)(v21 + 32) = sub_239969E78;
  *(void *)(v21 + 40) = v1;
  swift_retain();
  sub_239968FAC(v22);
  return v1;
}

void sub_2399655D4(void *a1)
{
  uint64_t v72 = sub_23997FD60();
  uint64_t v3 = *(void (***)(void, void))(v72 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v72);
  uint64_t v6 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  id v9 = (char *)&v68 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v68 - v10;
  swift_beginAccess();
  uint64_t v12 = *(char **)(v1 + 32);
  if (v12)
  {
    uint64_t v13 = *(void *)(v1 + 40);
    swift_retain();
    if (objc_msgSend(a1, sel_canSendResponse))
    {
      id v14 = a1;
      id v71 = a1;
    }
    else
    {
      id v71 = 0;
    }
    uint64_t v21 = sub_23996AE24();
    uint64_t v23 = v22;
    uint64_t v70 = v13;
    swift_bridgeObjectRetain();
    char v24 = _s18PreviewsServicesUI18ShellToHostMessageO0G4TypeO8rawValueAESgSS_tcfC_0();
    if (v24 == 7)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B20);
      sub_239969EE4(&qword_268A06B28, &qword_268A06B20);
      uint64_t v25 = (void *)swift_allocError();
      uint64_t *v26 = v21;
      v26[1] = v23;
      swift_willThrow();
      uint64_t v30 = v70;
      v31 = v6;
      v32 = (void *)sub_23996B084();
      objc_msgSend(v32, sel_invalidate);

      id v33 = v25;
      sub_23997FD40();
      id v34 = v25;
      id v35 = v25;
      v36 = sub_23997FD50();
      os_log_type_t v37 = sub_23997FEC0();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        v69 = v31;
        v40 = (void *)v39;
        uint64_t v70 = v30;
        *(_DWORD *)v38 = 138543362;
        v68 = v38 + 4;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B10);
        sub_239969EE4(&qword_268A06B18, &qword_268A06B10);
        swift_allocError();
        void *v41 = v25;
        id v42 = v25;
        uint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
        v80[0] = v43;
        sub_23997FF20();
        void *v40 = v43;

        _os_log_impl(&dword_23995F000, v36, v37, "%{public}@", v38, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B08);
        swift_arrayDestroy();
        v44 = v40;
        v31 = v69;
        MEMORY[0x23ECA9A00](v44, -1, -1);
        MEMORY[0x23ECA9A00](v38, -1, -1);
      }
      else
      {
      }
      id v45 = v71;

      ((void (**)(char *, uint64_t))v3)[1](v31, v72);
      if (v45)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B10);
        sub_239969EE4(&qword_268A06B18, &qword_268A06B10);
        v46 = (void *)swift_allocError();
        void *v47 = v25;
        id v48 = v45;
        id v49 = v25;
        id v50 = v46;
        v51 = (void *)sub_23997FCF0();

        id v52 = objc_msgSend(self, sel_responseForError_, v51);
        sub_23996B198((uint64_t)v52);

        sub_239968FAC((uint64_t)v12);
        v53 = v46;
      }
      else
      {
        sub_239968FAC((uint64_t)v12);

        v53 = v25;
      }
    }
    else
    {
      char v27 = v24;
      swift_bridgeObjectRelease();
      v28 = (void *)sub_23996B084();
      unint64_t v29 = sub_23996AF24();
      ShellToHostMessage.init(messageType:fenceHandle:payload:)(v27, v28, v29, (uint64_t)v77);
      sub_23997FD40();
      sub_239969F28((uint64_t)v77, (uint64_t)v79);
      sub_239969FA0((uint64_t)v79, (void (*)(void, void, void, void, void, void))sub_239969F84);
      sub_239969FA0((uint64_t)v79, (void (*)(void, void, void, void, void, void))sub_239969F84);
      uint64_t v54 = (uint64_t)v71;
      id v55 = v71;
      sub_239969FA0((uint64_t)v79, (void (*)(void, void, void, void, void, void))sub_239969F84);
      id v56 = v55;
      v57 = sub_23997FD50();
      os_log_type_t v58 = sub_23997FEB0();
      if (os_log_type_enabled(v57, v58))
      {
        v59 = v9;
        v69 = v12;
        uint64_t v60 = 0x636E797361;
        uint64_t v61 = swift_slowAlloc();
        uint64_t v62 = swift_slowAlloc();
        uint64_t v76 = v62;
        *(_DWORD *)uint64_t v61 = 136446722;
        uint64_t v63 = sub_23997AB98();
        v80[0] = sub_239973FD8(v63, v64, &v76);
        sub_23997FF20();
        swift_bridgeObjectRelease();
        sub_239969FA0((uint64_t)v79, (void (*)(void, void, void, void, void, void))sub_239969EC8);
        *(_WORD *)(v61 + 12) = 2082;
        sub_239969F28((uint64_t)v79, (uint64_t)v80);
        unint64_t v65 = 0xE500000000000000;
        switch(v82)
        {
          case 1:
            v66 = (void *)v80[3];
            goto LABEL_25;
          case 2:
          case 3:
            break;
          case 4:
            unint64_t v65 = 0xE500000000000000;
            break;
          default:
            v66 = v81;
            if (v81)
            {
LABEL_25:
              uint64_t v74 = 0x3C6465636E6566;
              unint64_t v75 = 0xE700000000000000;
              sub_239969FA0((uint64_t)v79, (void (*)(void, void, void, void, void, void))sub_239969F84);
              id v73 = objc_msgSend(v66, sel_fenceName);
              sub_239980020();
              sub_23997FE70();
              swift_bridgeObjectRelease();
              sub_23997FE70();
              sub_239969FA0((uint64_t)v79, (void (*)(void, void, void, void, void, void))sub_239969EC8);
              uint64_t v60 = v74;
              unint64_t v65 = v75;
            }
            else
            {
              sub_239969FA0((uint64_t)v79, (void (*)(void, void, void, void, void, void))sub_239969EC8);
              unint64_t v65 = 0xE500000000000000;
            }
            break;
        }
        uint64_t v74 = sub_239973FD8(v60, v65, &v76);
        sub_23997FF20();
        swift_bridgeObjectRelease();
        sub_239969FA0((uint64_t)v79, (void (*)(void, void, void, void, void, void))sub_239969EC8);
        sub_239969FA0((uint64_t)v79, (void (*)(void, void, void, void, void, void))sub_239969EC8);
        *(_WORD *)(v61 + 22) = 2082;
        uint64_t v54 = (uint64_t)v71;
        if (v71) {
          uint64_t v67 = 0x796C7065722F77;
        }
        else {
          uint64_t v67 = 0x7961772D656E6FLL;
        }
        uint64_t v74 = sub_239973FD8(v67, 0xE700000000000000, &v76);
        sub_23997FF20();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23995F000, v57, v58, "Received %{public}s (%{public}s, %{public}s)", (uint8_t *)v61, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x23ECA9A00](v62, -1, -1);
        MEMORY[0x23ECA9A00](v61, -1, -1);

        ((void (**)(char *, uint64_t))v3)[1](v59, v72);
        uint64_t v12 = v69;
      }
      else
      {
        sub_239969FA0((uint64_t)v79, (void (*)(void, void, void, void, void, void))sub_239969EC8);
        sub_239969FA0((uint64_t)v79, (void (*)(void, void, void, void, void, void))sub_239969EC8);
        sub_239969FA0((uint64_t)v79, (void (*)(void, void, void, void, void, void))sub_239969EC8);

        ((void (**)(char *, uint64_t))v3)[1](v9, v72);
      }
      uint64_t v74 = v54;
      ((void (*)(uint64_t *, uint64_t *))v12)(v77, &v74);
      sub_239968FAC((uint64_t)v12);
      sub_239969EC8(v77[0], v77[1], v77[2], v77[3], v77[4], v78);
    }
  }
  else
  {
    id v71 = v3;
    sub_23997FD40();
    uint64_t v15 = a1;
    uint64_t v16 = sub_23997FD50();
    os_log_type_t v17 = sub_23997FEC0();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      id v19 = (void *)swift_slowAlloc();
      *(_DWORD *)v18 = 138543362;
      v80[0] = v15;
      v20 = v15;
      sub_23997FF20();
      void *v19 = v15;

      _os_log_impl(&dword_23995F000, v16, v17, "Scene messenger has no receiver -- dropping message: %{public}@", v18, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B08);
      swift_arrayDestroy();
      MEMORY[0x23ECA9A00](v19, -1, -1);
      MEMORY[0x23ECA9A00](v18, -1, -1);
      uint64_t v15 = v16;
    }
    else
    {
    }
    (*((void (**)(char *, uint64_t))v71 + 1))(v11, v72);
  }
}

void sub_239966148(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_2399661B0()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 40);
  id v2 = v1 + 4;
  uint64_t v3 = v1 + 10;
  os_unfair_lock_lock(v1 + 10);
  sub_239968A90(v2, v11);
  os_unfair_lock_unlock(v3);
  uint64_t v4 = v11[0];
  if (v11[0])
  {
    uint64_t v5 = *(void *)(v0 + 48);
    swift_beginAccess();
    uint64_t v6 = *(void *)(v5 + 32);
    *(void *)(v5 + 32) = 0;
    *(void *)(v5 + 40) = 0;
    sub_239968FAC(v6);
    uint64_t v7 = *(void *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = v4 + 40;
      do
      {
        id v9 = *(void (**)(uint64_t))(v8 - 8);
        uint64_t v10 = swift_retain();
        v9(v10);
        swift_release();
        v8 += 16;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
}

void sub_239966290(uint64_t a1)
{
  sub_23997FD60();
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)&v70 - v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v70 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v70 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  os_log_type_t v17 = (char *)&v70 - v16;
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void *)(a1 + 8);
  uint64_t v20 = *(void *)(a1 + 16);
  uint64_t v21 = *(void *)(a1 + 24);
  uint64_t v22 = *(void *)(a1 + 32);
  switch(*(unsigned char *)(a1 + 40))
  {
    case 1:
      uint64_t v25 = *(void **)(a1 + 24);
      objc_msgSend(v25, sel_invalidate);
      break;
    case 2:
      uint64_t v70 = v15;
      uint64_t v71 = v14;
      uint64_t v26 = v72;
      MEMORY[0x270FA5388](v14);
      *((_DWORD *)&v70 - 4) = v27;
      uint64_t v29 = (uint64_t)&v28[4];
      uint64_t v30 = v28 + 10;
      int v31 = v27;
      os_unfair_lock_lock(v28 + 10);
      sub_239969EB8(v29);
      os_unfair_lock_unlock(v30);
      sub_23997FD40();
      swift_retain();
      v32 = sub_23997FD50();
      os_log_type_t v33 = sub_23997FEE0();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = swift_slowAlloc();
        int v35 = v31;
        uint64_t v36 = swift_slowAlloc();
        uint64_t v74 = v36;
        *(_DWORD *)uint64_t v34 = 136315394;
        uint64_t v37 = *(void *)(v26 + 16);
        unint64_t v38 = *(void *)(v26 + 24);
        swift_bridgeObjectRetain();
        uint64_t v73 = sub_239973FD8(v37, v38, &v74);
        sub_23997FF20();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v34 + 12) = 1026;
        LODWORD(v73) = v35;
        sub_23997FF20();
        _os_log_impl(&dword_23995F000, v32, v33, "Scene crashed: %s, pid: %{public}d", (uint8_t *)v34, 0x12u);
        swift_arrayDestroy();
        MEMORY[0x23ECA9A00](v36, -1, -1);
        MEMORY[0x23ECA9A00](v34, -1, -1);

        (*(void (**)(char *, uint64_t))(v70 + 8))(v13, v71);
        int v39 = v35;
      }
      else
      {

        swift_release();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v13, v71);
        int v39 = v31;
      }
      sub_23996C628(v39, *(os_unfair_lock_s **)(v26 + 80));
      break;
    case 3:
      uint64_t v40 = *(void *)a1;
      uint64_t v71 = v14;
      uint64_t v41 = v15;
      sub_23997FD40();
      id v42 = sub_23997FD50();
      os_log_type_t v43 = sub_23997FEE0();
      if (os_log_type_enabled(v42, v43))
      {
        v44 = (uint8_t *)swift_slowAlloc();
        uint64_t v45 = swift_slowAlloc();
        uint64_t v74 = v45;
        *(_DWORD *)v44 = 136315138;
        LOBYTE(v73) = v40;
        uint64_t v46 = sub_23997FE50();
        uint64_t v73 = sub_239973FD8(v46, v47, &v74);
        sub_23997FF20();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23995F000, v42, v43, "Scene suppressed presentation: %s", v44, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23ECA9A00](v45, -1, -1);
        MEMORY[0x23ECA9A00](v44, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v41 + 8))(v4, v71);
      sub_23996C7D4(v40, *(os_unfair_lock_s **)(v72 + 112));
      break;
    case 4:
      uint64_t v70 = v15;
      uint64_t v71 = v14;
      if (v20 | v19 | v18 | v21 | v22)
      {
        if (v18 != 1 || v20 | v19 | v21 | v22)
        {
          sub_23997FD40();
          uint64_t v62 = (void *)v72;
          swift_retain();
          uint64_t v63 = sub_23997FD50();
          os_log_type_t v64 = sub_23997FEE0();
          if (os_log_type_enabled(v63, v64))
          {
            unint64_t v65 = (uint8_t *)swift_slowAlloc();
            uint64_t v66 = swift_slowAlloc();
            uint64_t v74 = v66;
            *(_DWORD *)unint64_t v65 = 136315138;
            uint64_t v67 = v62[2];
            unint64_t v68 = v62[3];
            swift_bridgeObjectRetain();
            uint64_t v73 = sub_239973FD8(v67, v68, &v74);
            sub_23997FF20();
            swift_release();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_23995F000, v63, v64, "Scene requested zoom: %s", v65, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x23ECA9A00](v66, -1, -1);
            MEMORY[0x23ECA9A00](v65, -1, -1);
          }
          else
          {

            swift_release();
          }
          (*(void (**)(char *, uint64_t))(v70 + 8))(v7, v71);
          v69 = (os_unfair_lock_s *)v62[13];
        }
        else
        {
          sub_23997FD40();
          id v48 = (void *)v72;
          swift_retain();
          id v49 = sub_23997FD50();
          os_log_type_t v50 = sub_23997FEE0();
          if (os_log_type_enabled(v49, v50))
          {
            v51 = (uint8_t *)swift_slowAlloc();
            uint64_t v52 = swift_slowAlloc();
            uint64_t v74 = v52;
            *(_DWORD *)v51 = 136315138;
            uint64_t v53 = v48[2];
            unint64_t v54 = v48[3];
            swift_bridgeObjectRetain();
            uint64_t v73 = sub_239973FD8(v53, v54, &v74);
            sub_23997FF20();
            swift_release();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_23995F000, v49, v50, "Scene requested key status: %s", v51, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x23ECA9A00](v52, -1, -1);
            MEMORY[0x23ECA9A00](v51, -1, -1);
          }
          else
          {

            swift_release();
          }
          (*(void (**)(char *, uint64_t))(v70 + 8))(v10, v71);
          v69 = (os_unfair_lock_s *)v48[12];
        }
      }
      else
      {
        sub_23997FD40();
        id v55 = (void *)v72;
        swift_retain();
        id v56 = sub_23997FD50();
        os_log_type_t v57 = sub_23997FEE0();
        if (os_log_type_enabled(v56, v57))
        {
          os_log_type_t v58 = (uint8_t *)swift_slowAlloc();
          uint64_t v59 = swift_slowAlloc();
          uint64_t v74 = v59;
          *(_DWORD *)os_log_type_t v58 = 136315138;
          uint64_t v60 = v55[2];
          unint64_t v61 = v55[3];
          swift_bridgeObjectRetain();
          uint64_t v73 = sub_239973FD8(v60, v61, &v74);
          sub_23997FF20();
          swift_release();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23995F000, v56, v57, "Scene stopped: %s", v58, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23ECA9A00](v59, -1, -1);
          MEMORY[0x23ECA9A00](v58, -1, -1);
        }
        else
        {

          swift_release();
        }
        (*(void (**)(char *, uint64_t))(v70 + 8))(v17, v71);
        v69 = (os_unfair_lock_s *)v55[11];
      }
      sub_23996C484(v69);
      break;
    default:
      if (v22)
      {
        uint64_t v23 = *(void *)a1;
        id v24 = (id)v22;
        sub_239967CCC((void *)v21, (void *)v22, 0);
        objc_msgSend(v24, sel_invalidate);
        sub_239969EC8(v23, v19, v20, v21, v22, 0);
      }
      else
      {
        sub_239967CCC(*(void **)(a1 + 24), 0, 0);
      }
      break;
  }
}

uint64_t sub_239966C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v21[1] = *MEMORY[0x263EF8340];
  double v9 = *(double *)a1;
  double v10 = *(double *)(a1 + 8);
  unsigned __int8 v11 = *(unsigned char *)(a1 + 16);
  *(void *)(v5 + 56) = *(void *)a1;
  *(double *)(v5 + 64) = v10;
  *(_WORD *)(v5 + 72) = v11;
  if (v11)
  {
    uint64_t v12 = *(void **)(v5 + 32);
    v21[0] = 0;
    unsigned __int8 v13 = objc_msgSend(v12, sel_setMaximizedWithParent_error_, a2, v21);
    uint64_t v14 = (void *)v21[0];
    if ((v13 & 1) == 0)
    {
LABEL_3:
      id v15 = v14;
      sub_23997FD00();

      return swift_willThrow();
    }
  }
  else
  {
    os_log_type_t v17 = *(void **)(v5 + 32);
    v21[0] = 0;
    unsigned __int8 v18 = objc_msgSend(v17, sel_setMinimizedWithParent_size_maximumSize_error_, a2, v21, v9, v10, v9, v10);
    uint64_t v14 = (void *)v21[0];
    if ((v18 & 1) == 0) {
      goto LABEL_3;
    }
  }
  id v19 = v14;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a4;
  *(void *)(v20 + 24) = a5;
  swift_retain();
  sub_239966DF4(0, 0, 2, a3, (uint64_t)sub_2399694C8, v20);
  return swift_release();
}

void sub_239966D8C(id a1, char a2, void (*a3)(id, uint64_t))
{
  uint64_t v5 = a2 & 1;
  if (a2) {
    id v6 = a1;
  }
  a3(a1, v5);

  sub_239969964(a1, v5);
}

void sub_239966DF4(void *a1, void *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v45 = a5;
  uint64_t v46 = a6;
  uint64_t v43 = a4;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AB8);
  MEMORY[0x270FA5388](v11 - 8);
  v44 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_23997FD60();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50[1] = (uint64_t)a1;
  v51 = a2;
  char v52 = a3;
  sub_23997FD40();
  sub_2399698C4(a1, a2, a3);
  sub_2399698C4(a1, a2, a3);
  sub_2399698C4(a1, a2, a3);
  sub_2399698C4(a1, a2, a3);
  os_log_type_t v17 = sub_23997FD50();
  int v18 = sub_23997FEB0();
  if (!os_log_type_enabled(v17, (os_log_type_t)v18))
  {
    sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
    sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
    sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
    sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    goto LABEL_8;
  }
  int v39 = v18;
  uint64_t v41 = v7;
  uint64_t v42 = v14;
  uint64_t v40 = v13;
  uint64_t v19 = swift_slowAlloc();
  uint64_t v38 = swift_slowAlloc();
  v50[0] = v38;
  *(_DWORD *)uint64_t v19 = 136446466;
  sub_2399698C4(a1, a2, a3);
  uint64_t v20 = sub_23997AD9C();
  unint64_t v22 = v21;
  sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
  uint64_t v48 = sub_239973FD8(v20, v22, v50);
  sub_23997FF20();
  swift_bridgeObjectRelease();
  sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
  sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
  *(_WORD *)(v19 + 12) = 2082;
  if (!a3)
  {
    if (a2)
    {
      uint64_t v48 = 0x3C6465636E6566;
      unint64_t v49 = 0xE700000000000000;
      sub_2399698C4(a1, a2, 0);
      id v47 = objc_msgSend(a2, sel_fenceName);
      sub_239980020();
      sub_23997FE70();
      swift_bridgeObjectRelease();
      sub_23997FE70();
      sub_2399698E0((uint64_t)a1, (uint64_t)a2, 0);
      uint64_t v25 = v48;
      unint64_t v23 = v49;
      uint64_t v24 = v42;
      goto LABEL_7;
    }
    sub_2399698E0((uint64_t)a1, 0, 0);
  }
  unint64_t v23 = 0xE500000000000000;
  uint64_t v24 = v42;
  uint64_t v25 = 0x636E797361;
LABEL_7:
  uint64_t v48 = sub_239973FD8(v25, v23, v50);
  sub_23997FF20();
  swift_bridgeObjectRelease();
  sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
  sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
  _os_log_impl(&dword_23995F000, v17, (os_log_type_t)v39, "Sending %{public}s (%{public}s, w/reply)", (uint8_t *)v19, 0x16u);
  uint64_t v26 = v38;
  swift_arrayDestroy();
  MEMORY[0x23ECA9A00](v26, -1, -1);
  MEMORY[0x23ECA9A00](v19, -1, -1);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v16, v40);
  uint64_t v7 = v41;
LABEL_8:
  uint64_t v28 = v45;
  uint64_t v27 = v46;
  uint64_t v29 = (uint64_t)v44;
  if (!v52)
  {
    uint64_t v32 = 0xD000000000000013;
    int v31 = v51;
    uint64_t v30 = (void *)HostToShellMessage.payload.getter();
    id v34 = v31;
    int v35 = "preferencesResolved";
LABEL_13:
    unint64_t v33 = (unint64_t)(v35 - 32) | 0x8000000000000000;
    goto LABEL_14;
  }
  if (v52 != 1)
  {
    uint64_t v30 = (void *)HostToShellMessage.payload.getter();
    int v31 = 0;
    uint64_t v32 = 0xD000000000000026;
    int v35 = "confirmReadyForDisplayAfterSceneResize";
    goto LABEL_13;
  }
  uint64_t v30 = (void *)HostToShellMessage.payload.getter();
  int v31 = 0;
  uint64_t v32 = 0x6572617764726168;
  unint64_t v33 = 0xED0000746E657645;
LABEL_14:
  sub_2399698FC(v43, v29);
  sub_239968E70();
  swift_retain();
  uint64_t v36 = (void *)sub_23997FEF0();
  id v37 = sub_23996B73C(v32, v33, v30, v31, v29, v36, v28, v27);
  (*(void (**)(void))(v7 + 16))();
}

Swift::Void __swiftcall InjectedScene.ObservationToken.cancel()()
{
  uint64_t v1 = (uint64_t *)&(*v0)[4];
  uint64_t v2 = *v0 + 8;
  os_unfair_lock_lock(v2);
  sub_23997DD54(v1, &v5);
  os_unfair_lock_unlock(v2);
  uint64_t v3 = v5;
  if (v5)
  {
    uint64_t v4 = swift_retain();
    ((void (*)(uint64_t))v3)(v4);
    sub_239968FAC((uint64_t)v3);
    sub_239968FAC((uint64_t)v3);
  }
}

uint64_t InjectedScene.addSceneCrashedObserver(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = *(void *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  uint64_t v9 = sub_239967490((uint64_t)sub_239968DB8, v8, v7);
  uint64_t result = swift_release();
  *a3 = v9;
  return result;
}

uint64_t sub_239967490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_268A069E8 != -1) {
    swift_once();
  }
  uint64_t v4 = (uint64_t *)(qword_268A06FC0 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(qword_268A06FC0 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_268A06FC0 + 24));
  sub_23997DBEC(v4, &v11);
  os_unfair_lock_unlock(v5);
  uint64_t v6 = v11;
  MEMORY[0x270FA5388](v7);
  os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
  sub_239969D4C((uint64_t *)(a3 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 24));
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AC8);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 32) = 0;
  *(void *)(v9 + 16) = sub_239969D9C;
  *(void *)(v9 + 24) = v8;
  swift_retain();
  return v9;
}

uint64_t sub_2399675EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_268A069E8 != -1) {
    swift_once();
  }
  uint64_t v4 = (uint64_t *)(qword_268A06FC0 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(qword_268A06FC0 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_268A06FC0 + 24));
  sub_23997DBEC(v4, &v11);
  os_unfair_lock_unlock(v5);
  uint64_t v6 = v11;
  MEMORY[0x270FA5388](v7);
  os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
  sub_239969C88((uint64_t *)(a3 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 24));
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AC8);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 32) = 0;
  *(void *)(v9 + 16) = sub_239969CD8;
  *(void *)(v9 + 24) = v8;
  swift_retain();
  return v9;
}

uint64_t sub_239967748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_268A069E8 != -1) {
    swift_once();
  }
  uint64_t v4 = (uint64_t *)(qword_268A06FC0 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(qword_268A06FC0 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_268A06FC0 + 24));
  sub_23997DBEC(v4, &v11);
  os_unfair_lock_unlock(v5);
  uint64_t v6 = v11;
  MEMORY[0x270FA5388](v7);
  os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
  sub_239969BEC((uint64_t *)(a3 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 24));
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AC8);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 32) = 0;
  *(void *)(v9 + 16) = sub_239969C3C;
  *(void *)(v9 + 24) = v8;
  swift_retain();
  return v9;
}

uint64_t sub_2399678A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_268A069E8 != -1) {
    swift_once();
  }
  uint64_t v4 = (uint64_t *)(qword_268A06FC0 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(qword_268A06FC0 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_268A06FC0 + 24));
  sub_23997DBEC(v4, &v11);
  os_unfair_lock_unlock(v5);
  uint64_t v6 = v11;
  MEMORY[0x270FA5388](v7);
  os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
  sub_2399699C4((uint64_t *)(a3 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 24));
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AC8);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 32) = 0;
  *(void *)(v9 + 16) = sub_239969A4C;
  *(void *)(v9 + 24) = v8;
  swift_retain();
  return v9;
}

uint64_t InjectedScene.addSceneCrashedObserver(_:)@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(os_unfair_lock_s **)(v3 + 40);
  uint64_t v9 = (uint64_t)&v8[4];
  double v10 = v8 + 10;
  os_unfair_lock_lock(v8 + 10);
  sub_239967AEC(v9, (uint64_t)&v15);
  os_unfair_lock_unlock(v10);
  if ((v16 & 1) == 0) {
    a1(v15);
  }
  uint64_t v11 = *(void *)(v4 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_retain();
  uint64_t v13 = sub_239967490((uint64_t)sub_239968DE0, v12, v11);
  uint64_t result = swift_release();
  *a3 = v13;
  return result;
}

uint64_t sub_239967AEC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 20);
  *(_DWORD *)a2 = *(_DWORD *)(result + 16);
  *(unsigned char *)(a2 + 4) = v2;
  return result;
}

uint64_t InjectedScene.addSceneStoppedObserver(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = *(void *)(v3 + 88);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  uint64_t v9 = sub_2399675EC((uint64_t)sub_239968DB8, v8, v7);
  uint64_t result = swift_release();
  *a3 = v9;
  return result;
}

uint64_t sub_239967B90(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t InjectedScene.addSuppressedFeatureObserver(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_239967748(a1, a2, *(void *)(v3 + 112));
  *a3 = result;
  return result;
}

uint64_t InjectedScene.addZoomRequestObserver(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = *(void *)(v3 + 104);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  swift_retain();
  uint64_t v9 = sub_2399675EC((uint64_t)sub_23996A168, v8, v7);
  uint64_t result = swift_release();
  *a3 = v9;
  return result;
}

Swift::Void __swiftcall InjectedScene.sendHardwareEvent(_:)(UVHardwareEvent a1)
{
  char v2 = a1.super.isa;
  sub_239967CCC(a1.super.isa, 0, 1);
}

void sub_239967CCC(void *a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_23997FD60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38[1] = (uint64_t)a1;
  int v39 = a2;
  unsigned __int8 v40 = a3;
  sub_23997FD40();
  sub_2399698C4(a1, a2, a3);
  sub_2399698C4(a1, a2, a3);
  sub_2399698C4(a1, a2, a3);
  sub_2399698C4(a1, a2, a3);
  uint64_t v12 = sub_23997FD50();
  int v13 = sub_23997FEB0();
  if (os_log_type_enabled(v12, (os_log_type_t)v13))
  {
    int v31 = v13;
    uint64_t v32 = v9;
    uint64_t v33 = v8;
    uint64_t v34 = v4;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v38[0] = v30;
    *(_DWORD *)uint64_t v14 = 136446466;
    sub_2399698C4(a1, a2, a3);
    uint64_t v15 = sub_23997AD9C();
    unint64_t v17 = v16;
    sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
    uint64_t v36 = sub_239973FD8(v15, v17, v38);
    sub_23997FF20();
    swift_bridgeObjectRelease();
    sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
    sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
    *(_WORD *)(v14 + 12) = 2082;
    if (!a3)
    {
      if (a2)
      {
        uint64_t v36 = 0x3C6465636E6566;
        unint64_t v37 = 0xE700000000000000;
        sub_2399698C4(a1, a2, 0);
        id v35 = objc_msgSend(a2, sel_fenceName);
        sub_239980020();
        sub_23997FE70();
        swift_bridgeObjectRelease();
        sub_23997FE70();
        sub_2399698E0((uint64_t)a1, (uint64_t)a2, 0);
        uint64_t v19 = v36;
        unint64_t v18 = v37;
LABEL_10:
        uint64_t v36 = sub_239973FD8(v19, v18, v38);
        sub_23997FF20();
        swift_bridgeObjectRelease();
        sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
        sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
        _os_log_impl(&dword_23995F000, v12, (os_log_type_t)v31, "Sending %{public}s (%{public}s, one-way)", (uint8_t *)v14, 0x16u);
        uint64_t v26 = v30;
        swift_arrayDestroy();
        MEMORY[0x23ECA9A00](v26, -1, -1);
        MEMORY[0x23ECA9A00](v14, -1, -1);

        (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v33);
        uint64_t v4 = v34;
        int v20 = v40;
        if (!v40) {
          goto LABEL_11;
        }
        goto LABEL_5;
      }
      sub_2399698E0((uint64_t)a1, 0, 0);
    }
    unint64_t v18 = 0xE500000000000000;
    uint64_t v19 = 0x636E797361;
    goto LABEL_10;
  }
  sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
  sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
  sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);
  sub_2399698E0((uint64_t)a1, (uint64_t)a2, a3);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  int v20 = v40;
  if (!v40)
  {
LABEL_11:
    uint64_t v23 = 0xD000000000000013;
    unint64_t v22 = v39;
    unint64_t v21 = (void *)HostToShellMessage.payload.getter();
    id v27 = v22;
    uint64_t v25 = "preferencesResolved";
    goto LABEL_12;
  }
LABEL_5:
  if (v20 != 1)
  {
    unint64_t v21 = (void *)HostToShellMessage.payload.getter();
    unint64_t v22 = 0;
    uint64_t v23 = 0xD000000000000026;
    uint64_t v25 = "confirmReadyForDisplayAfterSceneResize";
LABEL_12:
    unint64_t v24 = (unint64_t)(v25 - 32) | 0x8000000000000000;
    goto LABEL_13;
  }
  unint64_t v21 = (void *)HostToShellMessage.payload.getter();
  unint64_t v22 = 0;
  uint64_t v23 = 0x6572617764726168;
  unint64_t v24 = 0xED0000746E657645;
LABEL_13:
  id v28 = objc_allocWithZone((Class)type metadata accessor for UVPreviewSceneAction());
  id v29 = sub_23996A920(v23, v24, v21, v22, 0);
  (*(void (**)(void))(v4 + 16))();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> InjectedScene.checkout()()
{
  uint64_t v2 = v0;
  uint64_t v3 = *(os_unfair_lock_s **)(v0 + 40);
  uint64_t v4 = v3 + 4;
  uint64_t v5 = v3 + 10;
  os_unfair_lock_lock(v3 + 10);
  sub_239968268(v4, &v9);
  if (v1)
  {
    os_unfair_lock_unlock(v5);
    __break(1u);
  }
  else
  {
    os_unfair_lock_unlock(v5);
    if ((v9 & 1) == 0)
    {
      uint64_t v7 = *(void *)(v2 + 16);
      uint64_t v6 = *(void *)(v2 + 24);
      sub_239968E0C();
      swift_allocError();
      *uint64_t v8 = v7;
      v8[1] = v6;
      swift_bridgeObjectRetain();
      swift_willThrow();
    }
  }
}

uint64_t sub_239968268@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_23997FD60();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1[1])
  {
    sub_23997FD40();
    uint64_t v10 = sub_23997FD50();
    os_log_type_t v11 = sub_23997FEC0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_23995F000, v10, v11, "Can't checkout invalidated scene", v12, 2u);
      MEMORY[0x23ECA9A00](v12, -1, -1);
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    char v9 = 0;
    goto LABEL_7;
  }
  if (!__OFADD__(*a1, 1))
  {
    ++*a1;
    char v9 = 1;
LABEL_7:
    *a2 = v9;
    return result;
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall InjectedScene.relinquish()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_23997FD90();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23997FDB0();
  uint64_t v24 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = *(os_unfair_lock_s **)(v0 + 40);
  uint64_t v10 = (uint64_t *)&v9[4];
  os_log_type_t v11 = v9 + 10;
  os_unfair_lock_lock(v9 + 10);
  sub_23996876C(v10, aBlock);
  os_unfair_lock_unlock(v11);
  uint64_t v12 = aBlock[0];
  if (aBlock[0])
  {
    uint64_t v13 = self;
    swift_retain_n();
    if (objc_msgSend(v13, sel_isMainThread))
    {
      objc_msgSend(*(id *)(v1 + 32), sel_invalidate);
    }
    else
    {
      sub_239968E70();
      uint64_t v23 = sub_23997FEF0();
      aBlock[4] = (uint64_t)sub_239968E60;
      aBlock[5] = v1;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_239965074;
      aBlock[3] = (uint64_t)&block_descriptor;
      uint64_t v14 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      sub_23997FDA0();
      aBlock[0] = MEMORY[0x263F8EE78];
      sub_239968EC8();
      uint64_t v22 = v6;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A06A98);
      sub_239969EE4(&qword_268A06AA0, &qword_268A06A98);
      sub_23997FF50();
      uint64_t v15 = (void *)v23;
      MEMORY[0x23ECA90D0](0, v8, v5, v14);
      _Block_release(v14);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v22);
    }
    swift_release_n();
    uint64_t v16 = *(void *)(v1 + 48);
    swift_beginAccess();
    uint64_t v17 = *(void *)(v16 + 32);
    *(void *)(v16 + 32) = 0;
    *(void *)(v16 + 40) = 0;
    sub_239968FAC(v17);
    uint64_t v18 = *(void *)(v12 + 16);
    if (v18)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = v12 + 40;
      do
      {
        int v20 = *(void (**)(uint64_t))(v19 - 8);
        uint64_t v21 = swift_retain();
        v20(v21);
        swift_release();
        v19 += 16;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_23996876C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_23997FD60();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[1];
  if (!v9)
  {
    sub_23997FD40();
    os_log_type_t v11 = sub_23997FD50();
    os_log_type_t v12 = sub_23997FEC0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_23995F000, v11, v12, "Can't relinquish invalidated scene", v13, 2u);
      MEMORY[0x23ECA9A00](v13, -1, -1);
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t v9 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = *a1 - 1;
  if (!__OFSUB__(*a1, 1))
  {
    if (v10 <= 0)
    {
      *a1 = 0;
      a1[1] = 0;
    }
    else
    {
      uint64_t v9 = 0;
      *a1 = v10;
    }
LABEL_9:
    *a2 = v9;
    return result;
  }
  __break(1u);
  return result;
}

void InjectedScene.onInvalidation(_:)(void (*a1)(void))
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 40);
  uint64_t v4 = v3 + 4;
  uint64_t v5 = v3 + 10;
  os_unfair_lock_lock(v3 + 10);
  sub_239968FBC(v4, &v6);
  os_unfair_lock_unlock(v5);
  if ((v6 & 1) == 0) {
    a1();
  }
}

void *sub_239968978@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v5 = (void *)result[1];
  if (v5)
  {
    uint64_t v8 = result;
    uint64_t v9 = *result;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a2;
    *(void *)(v10 + 24) = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v5 = sub_2399697B4(0, v5[2] + 1, 1, v5);
    }
    unint64_t v12 = v5[2];
    unint64_t v11 = v5[3];
    if (v12 >= v11 >> 1) {
      uint64_t v5 = sub_2399697B4((void *)(v11 > 1), v12 + 1, 1, v5);
    }
    v5[2] = v12 + 1;
    uint64_t v13 = &v5[2 * v12];
    v13[4] = sub_239969AD4;
    v13[5] = v10;
    uint64_t result = (void *)swift_bridgeObjectRelease();
    *uint64_t v8 = v9;
    v8[1] = v5;
    char v14 = 1;
  }
  else
  {
    char v14 = 0;
  }
  *a4 = v14;
  return result;
}

void *sub_239968A90@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  if (v2)
  {
    *uint64_t result = 0;
    result[1] = 0;
  }
  *a2 = v2;
  return result;
}

uint64_t sub_239968AA4(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_239968ACC()
{
  return 0xD000000000000026;
}

unint64_t sub_239968B6C()
{
  return sub_239968ACC();
}

uint64_t sub_239968B78()
{
  return -7201;
}

uint64_t sub_239968B80()
{
  return sub_23997ED68();
}

uint64_t sub_239968B88(uint64_t a1)
{
  unint64_t v2 = sub_239969420();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_239968BC4(uint64_t a1)
{
  unint64_t v2 = sub_239969420();

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_239968C00(uint64_t result)
{
  if (*(unsigned char *)(result + 21))
  {
    sub_239969970();
    swift_allocError();
    return swift_willThrow();
  }
  else
  {
    *(unsigned char *)(result + 21) = 1;
  }
  return result;
}

void sub_239968C60(uint64_t a1)
{
  uint64_t v1 = *(os_unfair_lock_s **)(a1 + 40);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 10;
  os_unfair_lock_lock(v1 + 10);
  sub_239968CC4(v2);

  os_unfair_lock_unlock(v3);
}

uint64_t sub_239968CC4(uint64_t result)
{
  *(unsigned char *)(result + 21) = 0;
  return result;
}

BOOL static InjectedScene.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t InjectedScene.deinit()
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t InjectedScene.__deallocating_deinit()
{
  InjectedScene.deinit();

  return MEMORY[0x270FA0228](v0, 120, 7);
}

BOOL sub_239968D6C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_239968D80()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_239968DB8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_239968DE0(unsigned int *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

unint64_t sub_239968E0C()
{
  unint64_t result = qword_268A06A80;
  if (!qword_268A06A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06A80);
  }
  return result;
}

id sub_239968E60()
{
  return objc_msgSend(*(id *)(v0 + 32), sel_invalidate);
}

unint64_t sub_239968E70()
{
  unint64_t result = qword_268A06A88;
  if (!qword_268A06A88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A06A88);
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_239968EC8()
{
  unint64_t result = qword_268A06A90;
  if (!qword_268A06A90)
  {
    sub_23997FD90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06A90);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_239968FAC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void *sub_239968FBC@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  return sub_239968978(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t type metadata accessor for InjectedScene()
{
  return self;
}

uint64_t method lookup function for InjectedScene(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InjectedScene);
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for InjectedScene.Layout.Value(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for InjectedScene.Layout(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for InjectedScene.Layout()
{
  return &type metadata for InjectedScene.Layout;
}

ValueMetadata *type metadata accessor for InjectedScene.ObservationToken()
{
  return &type metadata for InjectedScene.ObservationToken;
}

uint64_t storeEnumTagSinglePayload for InjectedScene.Layout.Value(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 17) = v3;
  return result;
}

uint64_t sub_2399690C4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2399690E4(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 1;
  }
  else
  {
    *(unsigned char *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for InjectedScene.Layout.Value()
{
  return &type metadata for InjectedScene.Layout.Value;
}

uint64_t sub_239969118(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_WORD *)(a1 + 20) = *(_WORD *)(a2 + 20);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InjectedScene.State(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v4 = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 21) = *(unsigned char *)(a2 + 21);
  return a1;
}

__n128 __swift_memcpy22_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(void *)(a1 + 14) = *(void *)(a2 + 14);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for InjectedScene.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(unsigned char *)(a1 + 21) = *(unsigned char *)(a2 + 21);
  return a1;
}

uint64_t getEnumTagSinglePayload for InjectedScene.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 22)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for InjectedScene.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_WORD *)(result + 20) = 0;
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 22) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 22) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InjectedScene.State()
{
  return &type metadata for InjectedScene.State;
}

void *initializeBufferWithCopyOfBuffer for InjectedScene.Invalidated(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for InjectedScene.Invalidated()
{
  return swift_bridgeObjectRelease();
}

void *assignWithTake for InjectedScene.Invalidated(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InjectedScene.Invalidated(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InjectedScene.Invalidated(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InjectedScene.Invalidated()
{
  return &type metadata for InjectedScene.Invalidated;
}

unint64_t sub_2399693F0(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_239969420();
  unint64_t result = sub_239969474();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_239969420()
{
  unint64_t result = qword_268A06AA8;
  if (!qword_268A06AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06AA8);
  }
  return result;
}

unint64_t sub_239969474()
{
  unint64_t result = qword_268A06AB0;
  if (!qword_268A06AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06AB0);
  }
  return result;
}

void sub_2399694C8(void *a1, char a2)
{
  sub_239966D8C(a1, a2 & 1, *(void (**)(id, uint64_t))(v2 + 16));
}

uint64_t sub_2399694D4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  swift_retain();
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *a1;
  *a1 = 0x8000000000000000;
  a7(a6, v13, a2, isUniquelyReferenced_nonNull_native);
  *a1 = v16;
  return swift_bridgeObjectRelease();
}

void sub_239969594(os_unfair_lock_s *a1)
{
  uint64_t v1 = (uint64_t *)&a1[4];
  uint64_t v2 = a1 + 6;
  os_unfair_lock_lock(a1 + 6);
  sub_239969DA4(v1);
  os_unfair_lock_unlock(v2);
}

void sub_2399695EC(os_unfair_lock_s *a1)
{
  uint64_t v1 = (uint64_t *)&a1[4];
  uint64_t v2 = a1 + 6;
  os_unfair_lock_lock(a1 + 6);
  sub_239969CE0(v1);
  os_unfair_lock_unlock(v2);
}

void sub_239969644(os_unfair_lock_s *a1)
{
  uint64_t v1 = (uint64_t *)&a1[4];
  uint64_t v2 = a1 + 6;
  os_unfair_lock_lock(a1 + 6);
  sub_239969C44(v1);
  os_unfair_lock_unlock(v2);
}

void sub_23996969C(os_unfair_lock_s *a1)
{
  uint64_t v1 = (uint64_t *)&a1[4];
  uint64_t v2 = a1 + 6;
  os_unfair_lock_lock(a1 + 6);
  sub_239969A54(v1);
  os_unfair_lock_unlock(v2);
}

unint64_t sub_2399696F4(uint64_t *a1, uint64_t a2, void (*a3)(void), void (*a4)(unint64_t, uint64_t))
{
  unint64_t result = sub_239977FD4(a2);
  if (v8)
  {
    unint64_t v9 = result;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *a1;
    uint64_t v12 = *a1;
    *a1 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      a3();
      uint64_t v11 = v12;
    }
    a4(v9, v11);
    *a1 = v11;
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_2399697B4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AD0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_239969ADC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

id sub_2399698C4(id result, void *a2, char a3)
{
  if (a3)
  {
    if (a3 != 1) {
      return result;
    }
    a2 = result;
  }
  return a2;
}

uint64_t sub_2399698E0(uint64_t result, uint64_t a2, char a3)
{
  if (a3)
  {
    if (a3 != 1) {
      return result;
    }
    a2 = result;
  }
  return MEMORY[0x270F9A758](result, a2);
}

uint64_t sub_2399698FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_239969964(id a1, char a2)
{
  if (a2) {
}
  }

unint64_t sub_239969970()
{
  unint64_t result = qword_268A06AC0;
  if (!qword_268A06AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06AC0);
  }
  return result;
}

uint64_t sub_2399699C4(uint64_t *a1)
{
  return sub_2399694D4(a1, v1[2], v1[3], v1[4], (uint64_t)&unk_26ED1EAA8, (uint64_t)sub_239969A98, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_239978FA4);
}

uint64_t sub_239969A14()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_239969A4C()
{
  sub_23996969C(*(os_unfair_lock_s **)(v0 + 16));
}

unint64_t sub_239969A54(uint64_t *a1)
{
  return sub_2399696F4(a1, *(void *)(v1 + 16), (void (*)(void))sub_239979650, (void (*)(unint64_t, uint64_t))sub_239978AA0);
}

uint64_t sub_239969A98(char *a1)
{
  uint64_t v2 = *(uint64_t (**)(char *))(v1 + 16);
  char v4 = *a1;
  return v2(&v4);
}

uint64_t sub_239969AD4()
{
  return sub_23996CB2C(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_239969ADC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AD8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_239980000();
  __break(1u);
  return result;
}

uint64_t sub_239969BEC(uint64_t *a1)
{
  return sub_2399694D4(a1, v1[2], v1[3], v1[4], (uint64_t)&unk_26ED1EB20, (uint64_t)sub_239969A98, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_239978F98);
}

void sub_239969C3C()
{
  sub_239969644(*(os_unfair_lock_s **)(v0 + 16));
}

unint64_t sub_239969C44(uint64_t *a1)
{
  return sub_2399696F4(a1, *(void *)(v1 + 16), (void (*)(void))sub_2399794B8, (void (*)(unint64_t, uint64_t))sub_239978AA0);
}

uint64_t sub_239969C88(uint64_t *a1)
{
  return sub_2399694D4(a1, v1[2], v1[3], v1[4], (uint64_t)&unk_26ED1EB70, (uint64_t)sub_239969D24, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_239978E14);
}

void sub_239969CD8()
{
  sub_2399695EC(*(os_unfair_lock_s **)(v0 + 16));
}

unint64_t sub_239969CE0(uint64_t *a1)
{
  return sub_2399696F4(a1, *(void *)(v1 + 16), (void (*)(void))sub_2399794AC, (void (*)(unint64_t, uint64_t))sub_239978AA0);
}

uint64_t sub_239969D24()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_239969D4C(uint64_t *a1)
{
  return sub_2399694D4(a1, v1[2], v1[3], v1[4], (uint64_t)&unk_26ED1EBC0, (uint64_t)sub_239969DE8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_239978E08);
}

void sub_239969D9C()
{
  sub_239969594(*(os_unfair_lock_s **)(v0 + 16));
}

unint64_t sub_239969DA4(uint64_t *a1)
{
  return sub_2399696F4(a1, *(void *)(v1 + 16), (void (*)(void))sub_2399794A0, (void (*)(unint64_t, uint64_t))sub_239978AA0);
}

uint64_t sub_239969DE8(int *a1)
{
  uint64_t v2 = *(uint64_t (**)(int *))(v1 + 16);
  int v4 = *a1;
  return v2(&v4);
}

uint64_t sub_239969E24()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_239969E5C(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + 16), sel_sendAction_, a1);
}

void sub_239969E78(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  char v2 = *(unsigned char *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v3;
  uint64_t v5 = v1;
  char v6 = v2;
  sub_239966290((uint64_t)v4);
}

uint64_t sub_239969EB8(uint64_t result)
{
  *(_DWORD *)(result + 16) = *(_DWORD *)(v1 + 16);
  *(unsigned char *)(result + 20) = 0;
  return result;
}

uint64_t sub_239969EC8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    if (a6 != 1) {
      return result;
    }
    a5 = a4;
  }
  return MEMORY[0x270F9A830](result, a2, a3, a4, a5);
}

uint64_t sub_239969EE4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_239969F28(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_239969F84(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    if (a6 != 1) {
      return result;
    }
    a5 = a4;
  }
  return MEMORY[0x270F9A960](result, a2, a3, a4, a5);
}

uint64_t sub_239969FA0(uint64_t a1, void (*a2)(void, void, void, void, void, void))
{
  return a1;
}

ValueMetadata *type metadata accessor for InjectedScene.AlreadyHostedError()
{
  return &type metadata for InjectedScene.AlreadyHostedError;
}

void *_s18PreviewsServicesUI13InjectedSceneC5StateV6StatusOwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InjectedScene.State.Status(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for InjectedScene.State.Status(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_23996A0D8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_23996A0F0(void *result, int a2)
{
  if (a2 < 0)
  {
    *uint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for InjectedScene.State.Status()
{
  return &type metadata for InjectedScene.State.Status;
}

uint64_t sub_23996A170(char a1)
{
  return *(void *)&aMessagetpayloa[8 * a1];
}

uint64_t sub_23996A190(uint64_t a1, char a2)
{
  sub_23996BC88(a1, (uint64_t)&v9);
  uint64_t v4 = MEMORY[0x263F8D310];
  if (swift_dynamicCast()) {
    return *(void *)&v8[0];
  }
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B50);
  *(void *)&long long v9 = v4;
  sub_23996BC88(a1, (uint64_t)v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B58);
  sub_23996BCE4();
  swift_allocError();
  uint64_t v7 = v6;
  *(unsigned char *)uint64_t v6 = a2;
  sub_23996BBE8(&v9, (_OWORD *)(v6 + 8));
  sub_23996BBE8(v8, (_OWORD *)(v7 + 40));
  return swift_willThrow();
}

uint64_t sub_23996A278(uint64_t a1, char a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  sub_23996BC88(a1, (uint64_t)&v14);
  uint64_t v9 = sub_23996BC4C(0, a3);
  if (swift_dynamicCast()) {
    return *(void *)&v13[0];
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a5);
  *(void *)&long long v14 = v9;
  sub_23996BC88(a1, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B58);
  sub_23996BCE4();
  swift_allocError();
  uint64_t v12 = v11;
  *(unsigned char *)uint64_t v11 = a2;
  sub_23996BBE8(&v14, (_OWORD *)(v11 + 8));
  sub_23996BBE8(v13, (_OWORD *)(v12 + 40));
  return swift_willThrow();
}

uint64_t sub_23996A37C(uint64_t a1, char a2)
{
  if (a2)
  {
    if (a2 == 1)
    {
      unint64_t v3 = &qword_268A06B48;
      uint64_t v4 = (__objc2_class **)0x263F60FE0;
      uint64_t v12 = sub_23996BC4C(0, &qword_268A06B48);
      uint64_t v5 = &qword_268A06B68;
      uint64_t v6 = a1;
      char v7 = 1;
    }
    else
    {
      unint64_t v3 = &qword_268A06B38;
      uint64_t v4 = off_264DB4810;
      uint64_t v12 = sub_23996BC4C(0, &qword_268A06B38);
      uint64_t v5 = &qword_268A06B70;
      uint64_t v6 = a1;
      char v7 = 2;
    }
    *(void *)&long long v11 = sub_23996A278(v6, v7, v3, (uint64_t)v4, v5);
  }
  else
  {
    uint64_t v12 = MEMORY[0x263F8D310];
    *(void *)&long long v11 = sub_23996A190(a1, 0);
    *((void *)&v11 + 1) = v8;
  }
  sub_23996BBE8(&v11, v13);
  *(void *)&long long v11 = 0;
  *((void *)&v11 + 1) = 0xE000000000000000;
  sub_23997FFA0();
  uint64_t v9 = v11;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  return v9;
}

BOOL sub_23996A508(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23996A51C()
{
  return sub_239980110();
}

uint64_t sub_23996A564()
{
  return sub_2399800F0();
}

uint64_t sub_23996A590()
{
  return sub_239980110();
}

uint64_t *sub_23996A5D4@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_23996A5EC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_23996A5F8()
{
  return sub_23996A170(*v0);
}

void sub_23996A600(void *a1, void (*a2)(unint64_t, uint64_t))
{
  id v4 = objc_msgSend(a1, sel_error);
  if (!v4)
  {
    id v6 = objc_msgSend(a1, sel_info);
    if (v6)
    {
      char v7 = v6;
      if (objc_msgSend(v6, sel_objectForSetting_, 1))
      {
        sub_23997FF40();
        swift_unknownObjectRelease();
        sub_23996BBE8(&v12, v13);
        uint64_t v8 = (void *)sub_23996A278((uint64_t)v13, 1, &qword_268A06B48, 0x263F60FE0, &qword_268A06B68);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);

        id v9 = objc_msgSend(v8, sel_dictionary);
        unint64_t v10 = sub_23997FE10();

LABEL_10:
        a2(v10, 0);
        swift_bridgeObjectRelease();

        return;
      }
    }
    unint64_t v10 = sub_23996A7E8(MEMORY[0x263F8EE78]);
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  unint64_t v5 = (unint64_t)v4;
  id v11 = v4;
  a2(v5, 1);
}

unint64_t sub_23996A7E8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B78);
  uint64_t v2 = sub_23997FFF0();
  unint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23996BDDC(v6, (uint64_t)&v15, &qword_268A06B80);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_239977F5C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_23996BBE8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_23996A920(uint64_t a1, uint64_t a2, id a3, void *a4, void *a5)
{
  uint64_t v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType();
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C78]), sel_init);
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  swift_bridgeObjectRetain();
  objc_msgSend(v13, sel_setObject_forSetting_, sub_239980060(), 0);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (a3)
  {
    id v14 = objc_allocWithZone(MEMORY[0x263F60FE0]);
    uint64_t v15 = (void *)sub_23997FE00();
    swift_bridgeObjectRelease();
    a3 = objc_msgSend(v14, sel_initWithDictionary_, v15);
  }
  objc_msgSend(v13, sel_setObject_forSetting_, a3, 1);

  objc_msgSend(v13, sel_setObject_forSetting_, a4, 2);
  v19.receiver = v6;
  v19.super_class = ObjectType;
  id v16 = v13;
  id v17 = objc_msgSendSuper2(&v19, sel_initWithInfo_responder_, v16, a5);

  return v17;
}

id sub_23996AAD0(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  v7.receiver = a1;
  v7.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id UVPreviewSceneAction.__allocating_init(info:timeout:forResponseOn:withHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v6 = v5;
  if (a3)
  {
    v13[4] = a3;
    v13[5] = a4;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1107296256;
    _OWORD v13[2] = sub_239966148;
    v13[3] = &block_descriptor_0;
    char v10 = _Block_copy(v13);
    swift_release();
  }
  else
  {
    char v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, a1, a2, v10, a5);

  _Block_release(v10);
  return v11;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void UVPreviewSceneAction.init(info:timeout:forResponseOn:withHandler:)()
{
}

void static UVPreviewSceneAction.new()()
{
}

id UVPreviewSceneAction.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void UVPreviewSceneAction.init()()
{
}

uint64_t sub_23996AE24()
{
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v0, sel_info);
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  if (!objc_msgSend(v3, sel_objectForSetting_, 0))
  {

    LOBYTE(v4) = 1;
LABEL_5:
    sub_23996BE40();
    swift_allocError();
    *uint64_t v5 = (_BYTE)v4;
    swift_willThrow();
    return v2;
  }
  sub_23997FF40();
  swift_unknownObjectRelease();
  sub_23996BBE8(&v7, v8);
  uint64_t v2 = sub_23996A190((uint64_t)v8, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);

  return v2;
}

unint64_t sub_23996AF24()
{
  id v2 = objc_msgSend(v0, sel_info);
  if (!v2)
  {
    sub_23996BE40();
    swift_allocError();
    *uint64_t v5 = 0;
    swift_willThrow();
    return (unint64_t)v0;
  }
  uint64_t v0 = v2;
  if (objc_msgSend(v2, sel_objectForSetting_, 1))
  {
    sub_23997FF40();
    swift_unknownObjectRelease();
    sub_23996BBE8(&v7, v8);
    id v3 = (void *)sub_23996A278((uint64_t)v8, 1, &qword_268A06B48, 0x263F60FE0, &qword_268A06B68);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);

    if (!v1)
    {
      id v4 = objc_msgSend(v3, sel_dictionary);
      uint64_t v0 = (void *)sub_23997FE10();
    }
    return (unint64_t)v0;
  }

  return sub_23996A7E8(MEMORY[0x263F8EE78]);
}

uint64_t sub_23996B084()
{
  id v2 = objc_msgSend(v0, sel_info);
  if (v2)
  {
    id v3 = v2;
    if (objc_msgSend(v2, sel_objectForSetting_, 2))
    {
      sub_23997FF40();
      swift_unknownObjectRelease();
      sub_23996BBE8(&v8, v9);
      uint64_t v4 = sub_23996A278((uint64_t)v9, 2, &qword_268A06B38, (uint64_t)off_264DB4810, &qword_268A06B70);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

      if (v1) {
        return v5;
      }
      else {
        return v4;
      }
    }
    else
    {

      return 0;
    }
  }
  else
  {
    sub_23996BE40();
    swift_allocError();
    *long long v7 = 0;
    return swift_willThrow();
  }
}

id sub_23996B198(uint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = sub_23997FD60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v2, sel_canSendResponse))
  {
    return objc_msgSend(v2, sel_sendResponse_, a1);
  }
  else
  {
    sub_23997FD40();
    id v9 = v2;
    char v10 = sub_23997FD50();
    os_log_type_t v11 = sub_23997FED0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v17 = v4;
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      id v16 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 138543362;
      uint64_t v18 = v9;
      id v13 = v9;
      sub_23997FF20();
      id v14 = v16;
      *id v16 = v9;

      uint64_t v4 = v17;
      _os_log_impl(&dword_23995F000, v10, v11, "Attempt to reply to invalid or one-way scene action: '%{public}@'", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B08);
      swift_arrayDestroy();
      MEMORY[0x23ECA9A00](v14, -1, -1);
      MEMORY[0x23ECA9A00](v12, -1, -1);
    }
    else
    {

      char v10 = v9;
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

Swift::String_optional __swiftcall UVPreviewSceneAction.keyDescription(forSetting:)(Swift::Int forSetting)
{
  if ((unint64_t)forSetting > 2)
  {
    uint64_t v2 = 0;
    id v3 = 0;
  }
  else
  {
    Swift::Int v1 = 8 * forSetting;
    uint64_t v2 = *(void *)&aMessagetpayloa[8 * forSetting];
    id v3 = *(void **)&aFencehanype[v1 + 8];
  }
  result.value._object = v3;
  result.value._countAndFlagsBits = v2;
  return result;
}

uint64_t UVPreviewSceneAction.valueDescription(for:object:ofSetting:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_23996BB0C(a2, a3);
}

BOOL sub_23996B564(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_23996B57C()
{
  if (*v0) {
    return 0xD00000000000003FLL;
  }
  else {
    return 0xD000000000000037;
  }
}

uint64_t sub_23996B5BC()
{
  return sub_23997EE88(*v0);
}

uint64_t sub_23996B5C4(uint64_t a1)
{
  unint64_t v2 = sub_23996C37C();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_23996B600(uint64_t a1)
{
  unint64_t v2 = sub_23996C37C();

  return MEMORY[0x270EF2668](a1, v2);
}

id UVPreviewSceneAction.__allocating_init(info:responder:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithInfo_responder_, a1, a2);

  return v5;
}

void UVPreviewSceneAction.init(info:responder:)()
{
}

id UVPreviewSceneAction.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23996B73C(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  id v42 = a3;
  uint64_t v43 = a4;
  uint64_t v40 = a1;
  uint64_t v41 = a2;
  uint64_t v12 = sub_23997FDE0();
  uint64_t v38 = *(void *)(v12 - 8);
  uint64_t v39 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  unint64_t v37 = (char *)&v36 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AB8);
  MEMORY[0x270FA5388](v17 - 8);
  objc_super v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_23997FD80();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v36 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a7;
  *(void *)(v24 + 24) = a8;
  aBlock[4] = sub_23996BD78;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_239966148;
  aBlock[3] = &block_descriptor_4;
  uint64_t v25 = _Block_copy(aBlock);
  uint64_t v26 = self;
  uint64_t v45 = a8;
  swift_retain();
  id v27 = objc_msgSend(v26, sel_responderWithHandler_, v25);
  _Block_release(v25);
  swift_release();
  id v28 = a6;
  objc_msgSend(v27, sel_setQueue_, a6);
  uint64_t v44 = a5;
  sub_23996BDDC(a5, (uint64_t)v19, &qword_268A06AB8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_23996BD80((uint64_t)v19, &qword_268A06AB8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v23, v19, v20);
    sub_23997FDC0();
    id v29 = v37;
    MEMORY[0x23ECA8FC0](v15, v23);
    uint64_t v30 = v39;
    int v31 = *(void (**)(char *, uint64_t))(v38 + 8);
    v31(v15, v39);
    objc_msgSend(v27, sel_setTimeout_, sub_23997FDD0());
    v31(v29, v30);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  }
  id v32 = objc_allocWithZone((Class)type metadata accessor for UVPreviewSceneAction());
  id v33 = v27;
  id v34 = sub_23996A920(v40, v41, v42, v43, v27);

  swift_release();
  sub_23996BD80(v44, &qword_268A06AB8);
  return v34;
}

uint64_t sub_23996BB0C(uint64_t a1, unint64_t a2)
{
  sub_23996BDDC(a1, (uint64_t)&v5, &qword_268A06B30);
  if (v6)
  {
    sub_23996BBE8(&v5, v7);
    if (a2 > 2) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = sub_23996A37C((uint64_t)v7, a2);
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  }
  else
  {
    sub_23996BD80((uint64_t)&v5, &qword_268A06B30);
    return 0;
  }
  return v3;
}

uint64_t type metadata accessor for UVPreviewSceneAction()
{
  return self;
}

uint64_t method lookup function for UVPreviewSceneAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UVPreviewSceneAction);
}

_OWORD *sub_23996BBE8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_deallocate_boxed_opaque_existential_0(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x23ECA9A00);
  }
  return result;
}

uint64_t sub_23996BC4C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_23996BC88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23996BCE4()
{
  unint64_t result = qword_268A06B60;
  if (!qword_268A06B60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A06B58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06B60);
  }
  return result;
}

uint64_t sub_23996BD40()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23996BD78(void *a1)
{
  sub_23996A600(a1, *(void (**)(unint64_t, uint64_t))(v1 + 16));
}

uint64_t sub_23996BD80(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23996BDDC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_23996BE40()
{
  unint64_t result = qword_268A06B88;
  if (!qword_268A06B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06B88);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UVPreviewSceneAction.MissingData(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for UVPreviewSceneAction.MissingData(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23996BFFCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_23996C024(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23996C02C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UVPreviewSceneAction.MissingData()
{
  return &type metadata for UVPreviewSceneAction.MissingData;
}

uint64_t getEnumTagSinglePayload for UVPreviewSceneAction.Key(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for UVPreviewSceneAction.Key(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23996C1A4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_23996C1CC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UVPreviewSceneAction.Key()
{
  return &type metadata for UVPreviewSceneAction.Key;
}

uint64_t sub_23996C1E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23996C340(a1, a2, a3, (uint64_t (*)(void))sub_23996C210, (uint64_t (*)(void))sub_23996C264);
}

unint64_t sub_23996C210()
{
  unint64_t result = qword_268A06B90;
  if (!qword_268A06B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06B90);
  }
  return result;
}

unint64_t sub_23996C264()
{
  unint64_t result = qword_268A06B98;
  if (!qword_268A06B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06B98);
  }
  return result;
}

unint64_t sub_23996C2BC()
{
  unint64_t result = qword_268A06BA0;
  if (!qword_268A06BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06BA0);
  }
  return result;
}

uint64_t sub_23996C314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23996C340(a1, a2, a3, (uint64_t (*)(void))sub_23996C37C, (uint64_t (*)(void))sub_23996C3D0);
}

uint64_t sub_23996C340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_23996C37C()
{
  unint64_t result = qword_268A06BA8;
  if (!qword_268A06BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06BA8);
  }
  return result;
}

unint64_t sub_23996C3D0()
{
  unint64_t result = qword_268A06BB0;
  if (!qword_268A06BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06BB0);
  }
  return result;
}

unint64_t sub_23996C428()
{
  unint64_t result = qword_268A06BB8;
  if (!qword_268A06BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06BB8);
  }
  return result;
}

void sub_23996C484(os_unfair_lock_s *a1)
{
  uint64_t v1 = a1 + 4;
  int v2 = a1 + 6;
  os_unfair_lock_lock(a1 + 6);
  sub_2399709B0(v1, &v17);
  os_unfair_lock_unlock(v2);
  int64_t v3 = 0;
  uint64_t v4 = v17;
  uint64_t v5 = v17 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v17 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(v17 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return;
    }
    if (v14 >= v9) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v9) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v5 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v9) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v5 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v9) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v5 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    uint64_t v12 = *(void (**)(uint64_t))(*(void *)(v4 + 56) + 16 * v11);
    uint64_t v13 = swift_retain();
    v12(v13);
    swift_release();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v9)
  {
    unint64_t v15 = *(void *)(v5 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v3 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_27;
        }
        if (v3 >= v9) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v5 + 8 * v3);
        ++v16;
        if (v15) {
          goto LABEL_22;
        }
      }
    }
    int64_t v3 = v16;
    goto LABEL_22;
  }
LABEL_23:

  swift_release();
}

void sub_23996C628(int a1, os_unfair_lock_s *a2)
{
  int v18 = a1;
  int v2 = a2 + 4;
  int64_t v3 = a2 + 6;
  os_unfair_lock_lock(a2 + 6);
  sub_2399709B0(v2, &v17);
  os_unfair_lock_unlock(v3);
  int64_t v4 = 0;
  uint64_t v5 = v17;
  uint64_t v6 = v17 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(v17 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(v17 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v4 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return;
    }
    if (v14 >= v10) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v4;
    if (!v15)
    {
      int64_t v4 = v14 + 1;
      if (v14 + 1 >= v10) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v4);
      if (!v15)
      {
        int64_t v4 = v14 + 2;
        if (v14 + 2 >= v10) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v4);
        if (!v15)
        {
          int64_t v4 = v14 + 3;
          if (v14 + 3 >= v10) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v6 + 8 * v4);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v4 << 6);
LABEL_5:
    uint64_t v13 = *(void (**)(int *))(*(void *)(v5 + 56) + 16 * v12);
    swift_retain();
    v13(&v18);
    swift_release();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v10)
  {
    unint64_t v15 = *(void *)(v6 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v4 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_27;
        }
        if (v4 >= v10) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v4);
        ++v16;
        if (v15) {
          goto LABEL_22;
        }
      }
    }
    int64_t v4 = v16;
    goto LABEL_22;
  }
LABEL_23:

  swift_release();
}

void sub_23996C7D4(char a1, os_unfair_lock_s *a2)
{
  char v18 = a1;
  int v2 = a2 + 4;
  int64_t v3 = a2 + 6;
  os_unfair_lock_lock(a2 + 6);
  sub_239970980(v2, &v17);
  os_unfair_lock_unlock(v3);
  int64_t v4 = 0;
  uint64_t v5 = v17;
  uint64_t v6 = v17 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(v17 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(v17 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v4 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return;
    }
    if (v14 >= v10) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v4;
    if (!v15)
    {
      int64_t v4 = v14 + 1;
      if (v14 + 1 >= v10) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v4);
      if (!v15)
      {
        int64_t v4 = v14 + 2;
        if (v14 + 2 >= v10) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v4);
        if (!v15)
        {
          int64_t v4 = v14 + 3;
          if (v14 + 3 >= v10) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v6 + 8 * v4);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v4 << 6);
LABEL_5:
    uint64_t v13 = *(void (**)(char *))(*(void *)(v5 + 56) + 16 * v12);
    swift_retain();
    v13(&v18);
    swift_release();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v10)
  {
    unint64_t v15 = *(void *)(v6 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v4 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_27;
        }
        if (v4 >= v10) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v4);
        ++v16;
        if (v15) {
          goto LABEL_22;
        }
      }
    }
    int64_t v4 = v16;
    goto LABEL_22;
  }
LABEL_23:

  swift_release();
}

void sub_23996C980(char a1, os_unfair_lock_s *a2)
{
  char v18 = a1;
  int v2 = a2 + 4;
  int64_t v3 = a2 + 6;
  os_unfair_lock_lock(a2 + 6);
  sub_2399709B0(v2, &v17);
  os_unfair_lock_unlock(v3);
  int64_t v4 = 0;
  uint64_t v5 = v17;
  uint64_t v6 = v17 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(v17 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(v17 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v4 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return;
    }
    if (v14 >= v10) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v4;
    if (!v15)
    {
      int64_t v4 = v14 + 1;
      if (v14 + 1 >= v10) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v4);
      if (!v15)
      {
        int64_t v4 = v14 + 2;
        if (v14 + 2 >= v10) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v4);
        if (!v15)
        {
          int64_t v4 = v14 + 3;
          if (v14 + 3 >= v10) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v6 + 8 * v4);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v4 << 6);
LABEL_5:
    uint64_t v13 = *(void (**)(char *))(*(void *)(v5 + 56) + 16 * v12);
    swift_retain();
    v13(&v18);
    swift_release();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v10)
  {
    unint64_t v15 = *(void *)(v6 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v4 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_27;
        }
        if (v4 >= v10) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v4);
        ++v16;
        if (v15) {
          goto LABEL_22;
        }
      }
    }
    int64_t v4 = v16;
    goto LABEL_22;
  }
LABEL_23:

  swift_release();
}

uint64_t sub_23996CB2C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23996CB54()
{
  char v1 = *(unsigned char *)(v0 + 16);
  sub_23997FF70();
  sub_23997FE70();
  if ((v1 & 1) == 0)
  {
    sub_23997FE70();
    type metadata accessor for CGSize(0);
    sub_23997FFA0();
  }
  sub_23997FE70();
  swift_bridgeObjectRelease();
  sub_23997FE70();
  return 0;
}

uint64_t sub_23996CC78()
{
  return sub_23997EF68(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_23996CC84(uint64_t a1)
{
  unint64_t v2 = sub_239970700();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_23996CCC0(uint64_t a1)
{
  unint64_t v2 = sub_239970700();

  return MEMORY[0x270EF2668](a1, v2);
}

void sub_23996CCFC(void *a1@<X8>)
{
  *a1 = *v1;
}

Swift::Void __swiftcall SceneHostingViewController.ObservationToken.cancel()()
{
  char v1 = (uint64_t *)&(*v0)[4];
  unint64_t v2 = *v0 + 8;
  os_unfair_lock_lock(v2);
  sub_23997DD54(v1, &v5);
  os_unfair_lock_unlock(v2);
  int64_t v3 = v5;
  if (v5)
  {
    uint64_t v4 = swift_retain();
    ((void (*)(uint64_t))v3)(v4);
    sub_239968FAC((uint64_t)v3);
    sub_239968FAC((uint64_t)v3);
  }
}

uint64_t sub_23996CDB8@<X0>(void *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  int64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_239968DB8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_2399700D8(v4);
}

uint64_t sub_23996CE58(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_23997085C;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *uint64_t v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_2399700D8(v3);
  return sub_239968FAC(v8);
}

uint64_t SceneHostingViewController.deactivatedHandler.getter()
{
  char v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_2399700D8(*v1);
  return v2;
}

uint64_t SceneHostingViewController.deactivatedHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_239968FAC(v6);
}

uint64_t (*SceneHostingViewController.deactivatedHandler.modify())()
{
  return j__swift_endAccess;
}

uint64_t SceneHostingViewController.isUserActivePreview.getter()
{
  char v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview);
  swift_beginAccess();
  return *v1;
}

void SceneHostingViewController.isUserActivePreview.setter(char a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview];
  swift_beginAccess();
  char *v4 = a1;
  if ((a1 & 1) == 0)
  {
    v7.receiver = v1;
    v7.super_class = ObjectType;
    if (objc_msgSendSuper2(&v7, sel_resignFirstResponder))
    {
      uint64_t v5 = *(os_unfair_lock_s **)&v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus];
      swift_retain();
      sub_23996C980(0, v5);
      swift_release();
    }
  }
  if (*v4 == 1)
  {
    id v6 = objc_msgSend(v1, sel_traitCollection);
    objc_msgSend(v6, sel_activeAppearance);
  }
}

Swift::Bool __swiftcall SceneHostingViewController.resignFirstResponder()()
{
  return sub_23996D9D4((SEL *)&selRef_resignFirstResponder, 0);
}

void (*SceneHostingViewController.isUserActivePreview.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[5] = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview;
  v3[6] = ObjectType;
  v3[7] = v5;
  swift_beginAccess();
  return sub_23996D1F4;
}

void sub_23996D1F4(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(unsigned char **)(v3 + 40);
    if (v4[*(void *)(v3 + 56)]) {
      goto LABEL_6;
    }
    uint64_t v5 = *(void *)(v3 + 48);
    *(void *)(v3 + 24) = v4;
    *(void *)(v3 + 32) = v5;
    if (objc_msgSendSuper2((objc_super *)(v3 + 24), sel_resignFirstResponder))
    {
      id v6 = *(os_unfair_lock_s **)(*(void *)(v3 + 40)
                                + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus);
      swift_retain();
      sub_23996C980(0, v6);
      swift_release();
    }
    uint64_t v4 = *(unsigned char **)(v3 + 40);
    if (v4[*(void *)(v3 + 56)] == 1)
    {
LABEL_6:
      id v7 = objc_msgSend(v4, sel_traitCollection);
      objc_msgSend(v7, sel_activeAppearance);
    }
  }

  free((void *)v3);
}

unint64_t sub_23996D2D0()
{
  return 0xD00000000000001CLL;
}

uint64_t SceneHostingViewController.readyForDisplay.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_readyForDisplay);
  swift_beginAccess();
  return *v1;
}

void SceneHostingViewController.layout.getter(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host);
  if (v2)
  {
    long long v3 = *(_OWORD *)(v2 + 56);
    char v4 = *(unsigned char *)(v2 + 72);
    char v5 = *(unsigned char *)(v2 + 73);
  }
  else
  {
    char v4 = 0;
    long long v3 = 0uLL;
    char v5 = 1;
  }
  *(_OWORD *)a1 = v3;
  *(unsigned char *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 17) = v5;
}

uint64_t SceneHostingViewController.sceneSize.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host);
  if (!v1) {
    return 0;
  }
  objc_msgSend(*(id *)(v1 + 32), sel_sceneSize);
  return v2;
}

BOOL SceneHostingViewController.activated.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host) != 0;
}

uint64_t SceneHostingViewController.observeFirstResponderStatus(_:)@<X0>(void (*a1)(id)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  char v4 = v3;
  a1(objc_msgSend(v4, sel_isFirstResponder));
  uint64_t v8 = *(void *)&v4[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  swift_retain();
  swift_retain();
  uint64_t v10 = sub_2399678A4((uint64_t)sub_239970120, v9, v8);
  swift_release();
  uint64_t result = swift_release();
  *a3 = v10;
  return result;
}

Swift::Void __swiftcall SceneHostingViewController.viewDidLoad()()
{
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v4, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(self, sel_systemBackgroundColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall SceneHostingViewController.viewDidLayoutSubviews()()
{
  v12.receiver = v0;
  v12.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v12, sel_viewDidLayoutSubviews);
  if (*(void *)&v0[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host])
  {
    id v1 = *(id *)&v0[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host + 8];
    id v2 = objc_msgSend(v0, sel_view);
    if (v2)
    {
      id v3 = v2;
      objc_msgSend(v2, sel_bounds);
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;

      objc_msgSend(v1, sel_setFrame_, v5, v7, v9, v11);
    }
    else
    {
      __break(1u);
    }
  }
}

Swift::Void __swiftcall SceneHostingViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v5, sel_viewDidAppear_, a1);
  id v3 = &v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview];
  swift_beginAccess();
  if (*v3 == 1)
  {
    id v4 = objc_msgSend(v1, sel_traitCollection);
    objc_msgSend(v4, sel_activeAppearance);
  }
}

uint64_t SceneHostingViewController.canBecomeFirstResponder.getter()
{
  if (!*(void *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host)) {
    return 0;
  }
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview);
  swift_beginAccess();
  return *v1;
}

Swift::Bool __swiftcall SceneHostingViewController.becomeFirstResponder()()
{
  return sub_23996D9D4((SEL *)&selRef_becomeFirstResponder, 1);
}

id sub_23996D9D4(SEL *a1, char a2)
{
  objc_super v5 = v2;
  v9.receiver = v2;
  v9.super_class = (Class)swift_getObjectType();
  id v6 = objc_msgSendSuper2(&v9, *a1);
  if (v6)
  {
    double v7 = *(os_unfair_lock_s **)&v5[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus];
    swift_retain();
    sub_23996C980(a2 & 1, v7);
    swift_release();
  }
  return v6;
}

id sub_23996DA78(void *a1, uint64_t a2, const char **a3, char a4)
{
  v11.receiver = a1;
  v11.super_class = (Class)swift_getObjectType();
  id v6 = *a3;
  double v7 = (char *)v11.receiver;
  id v8 = objc_msgSendSuper2(&v11, v6);
  if (v8)
  {
    objc_super v9 = *(os_unfair_lock_s **)&v7[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus];
    swift_retain();
    sub_23996C980(a4 & 1, v9);

    swift_release();
  }
  else
  {
  }
  return v8;
}

Swift::Void __swiftcall SceneHostingViewController.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  id v2 = &v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview];
  swift_beginAccess();
  if (*v2 == 1)
  {
    id v3 = objc_msgSend(v1, sel_traitCollection);
    objc_msgSend(v3, sel_activeAppearance);
  }
}

id sub_23996DC2C()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_23997FD60();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v27 - v7;
  objc_super v9 = &v0[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview];
  swift_beginAccess();
  if (*v9 == 1)
  {
    sub_23997FD40();
    double v10 = v0;
    objc_super v11 = sub_23997FD50();
    os_log_type_t v12 = sub_23997FEB0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v29 = v2;
      uint64_t v15 = v14;
      uint64_t v32 = v14;
      *(_DWORD *)uint64_t v13 = 136446210;
      id v28 = ObjectType;
      unint64_t v16 = sub_23996D2D0();
      uint64_t v31 = sub_239973FD8(v16, v17, &v32);
      uint64_t ObjectType = v28;
      sub_23997FF20();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23995F000, v11, v12, "%{public}s: honoring key status request from agent; becoming first responder",
        v13,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECA9A00](v15, -1, -1);
      MEMORY[0x23ECA9A00](v13, -1, -1);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v29);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    }
    v30.receiver = v10;
    v30.super_class = ObjectType;
    id result = objc_msgSendSuper2(&v30, sel_becomeFirstResponder);
    if (result)
    {
      uint64_t v26 = *(os_unfair_lock_s **)&v10[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus];
      swift_retain();
      sub_23996C980(1, v26);
      return (id)swift_release();
    }
  }
  else
  {
    sub_23997FD40();
    char v18 = v0;
    objc_super v19 = sub_23997FD50();
    os_log_type_t v20 = sub_23997FEB0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v32 = v22;
      uint64_t v29 = v2;
      *(_DWORD *)uint64_t v21 = 136446210;
      unint64_t v23 = sub_23996D2D0();
      uint64_t v31 = sub_239973FD8(v23, v24, &v32);
      sub_23997FF20();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23995F000, v19, v20, "%{public}s: ignoring key status request from agent (not user active preview)", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23ECA9A00](v22, -1, -1);
      MEMORY[0x23ECA9A00](v21, -1, -1);

      return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v29);
    }
    else
    {

      return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return result;
}

uint64_t SceneHostingViewController.activate(injectedScene:parentScene:layout:timeout:completion:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void, uint64_t), uint64_t a6)
{
  uint64_t v73 = a6;
  uint64_t v71 = a5;
  uint64_t v63 = a2;
  uint64_t v64 = a4;
  uint64_t v66 = a1;
  uint64_t v8 = sub_23997FD60();
  objc_super v9 = *(void (***)(char *, uint64_t))(v8 - 8);
  MEMORY[0x270FA5388](v8);
  objc_super v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)a3;
  uint64_t v13 = *(void *)(a3 + 8);
  uint64_t v14 = *(unsigned __int8 *)(a3 + 16);
  sub_23997FD40();
  uint64_t v15 = v6;
  unint64_t v16 = sub_23997FD50();
  os_log_type_t v17 = sub_23997FEE0();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v68 = v14;
  v69 = v15;
  uint64_t v70 = v12;
  uint64_t v67 = v13;
  if (v18)
  {
    unint64_t v65 = v9;
    uint64_t v72 = v8;
    uint64_t v19 = swift_slowAlloc();
    os_log_type_t v20 = v15;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v74 = v21;
    *(_DWORD *)uint64_t v19 = 136446466;
    unint64_t v22 = sub_23996D2D0();
    uint64_t v78 = sub_239973FD8(v22, v23, &v74);
    sub_23997FF20();

    LOBYTE(v14) = v68;
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    if (v14)
    {
      unint64_t v24 = 0xEA00000000006E65;
      uint64_t v25 = 0x657263736C6C7566;
    }
    else
    {
      uint64_t v78 = 0;
      unint64_t v79 = 0xE000000000000000;
      sub_23997FE70();
      uint64_t v75 = v70;
      uint64_t v76 = v67;
      type metadata accessor for CGSize(0);
      sub_23997FFA0();
      uint64_t v25 = v78;
      unint64_t v24 = v79;
    }
    uint64_t v26 = v65;
    uint64_t v78 = sub_239973FD8(v25, v24, &v74);
    sub_23997FF20();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23995F000, v16, v17, "%{public}s: activating with layout '%{public}s'", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23ECA9A00](v21, -1, -1);
    MEMORY[0x23ECA9A00](v19, -1, -1);

    v26[1](v11, v72);
    uint64_t v15 = v69;
  }
  else
  {

    v9[1](v11, v8);
  }
  uint64_t v27 = &v15[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_readyForDisplay];
  swift_beginAccess();
  char *v27 = 0;
  uint64_t v28 = qword_268A069E8;
  uint64_t v29 = v73;
  swift_retain();
  if (v28 != -1) {
    swift_once();
  }
  objc_super v30 = (uint64_t *)(qword_268A06FC0 + 16);
  uint64_t v31 = (os_unfair_lock_s *)(qword_268A06FC0 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_268A06FC0 + 24));
  sub_23997DBEC(v30, &v75);
  unint64_t v65 = 0;
  os_unfair_lock_unlock(v31);
  uint64_t v72 = v75;
  char v80 = v14;
  uint64_t v32 = (uint64_t *)&v15[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest];
  id v33 = *(void (**)(void *, uint64_t))&v15[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest
                                                   + 32];
  if (v33)
  {
    uint64_t v35 = v32[2];
    uint64_t v34 = v32[3];
    uint64_t v37 = *v32;
    uint64_t v36 = v32[1];
    sub_23997014C();
    uint64_t v38 = (void *)swift_allocError();
    *(void *)uint64_t v39 = v36;
    *(void *)(v39 + 8) = v35;
    *(unsigned char *)(v39 + 16) = v34 & 1;
    swift_retain();
    v33(v38, 1);
    uint64_t v29 = v73;

    sub_2399701A0(v37, v36, v35, v34, (uint64_t)v33);
    uint64_t v40 = v32[4];
  }
  else
  {
    uint64_t v40 = 0;
  }
  uint64_t v41 = *v32;
  uint64_t v42 = v32[1];
  uint64_t v43 = v32[2];
  uint64_t v44 = v32[3];
  uint64_t v45 = v70;
  uint64_t *v32 = v72;
  v32[1] = v45;
  uint64_t v47 = v67;
  uint64_t v46 = v68;
  v32[2] = v67;
  v32[3] = v46;
  v32[4] = (uint64_t)v71;
  v32[5] = v29;
  swift_retain();
  sub_2399701A0(v41, v42, v43, v44, v40);
  uint64_t v48 = v65;
  unint64_t v49 = v69;
  sub_23996E5CC(v66);
  if (v48)
  {
    if (v32[4] && *v32 == v72)
    {
      id v55 = v48;
      v71(v48, 1);
      uint64_t v56 = *v32;
      uint64_t v57 = v32[1];
      uint64_t v58 = v32[2];
      uint64_t v59 = v32[3];
      uint64_t v60 = v32[4];
      *(_OWORD *)uint64_t v32 = 0u;
      *((_OWORD *)v32 + 1) = 0u;
      *((_OWORD *)v32 + 2) = 0u;
      sub_2399701A0(v56, v57, v58, v59, v60);
    }
  }
  else
  {
    uint64_t v50 = v70;
    uint64_t v75 = v70;
    uint64_t v76 = v47;
    char v77 = v46;
    uint64_t v51 = swift_allocObject();
    uint64_t v52 = v72;
    *(void *)(v51 + 16) = v49;
    *(void *)(v51 + 24) = v52;
    *(void *)(v51 + 32) = v50;
    *(void *)(v51 + 40) = v47;
    *(unsigned char *)(v51 + 48) = v80;
    *(_DWORD *)(v51 + 49) = v74;
    *(_DWORD *)(v51 + 52) = *(_DWORD *)((char *)&v74 + 3);
    uint64_t v53 = v73;
    *(void *)(v51 + 56) = v71;
    *(void *)(v51 + 64) = v53;
    unint64_t v54 = v49;
    swift_retain();
    sub_239966C28((uint64_t)&v75, v63, v64, (uint64_t)sub_2399701F0, v51);
    swift_release();
  }
  return swift_release();
}

void sub_23996E5CC(void *a1)
{
  uint64_t v3 = v1;
  v67[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = sub_23997FD60();
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v9 = &v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  if (v10) {
    BOOL v11 = v10 == a1;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11) {
    return;
  }
  uint64_t v65 = v6;
  sub_23996F450();
  uint64_t v12 = (os_unfair_lock_s *)a1[5];
  uint64_t v13 = v12 + 4;
  uint64_t v14 = v12 + 10;
  os_unfair_lock_lock(v12 + 10);
  sub_239968268(v13, (char *)v67);
  if (v2)
  {
LABEL_21:
    os_unfair_lock_unlock(v14);
    __break(1u);
    return;
  }
  os_unfair_lock_unlock(v14);
  if (((uint64_t)v67[0] & 1) == 0)
  {
    uint64_t v48 = a1[2];
    uint64_t v47 = a1[3];
    sub_239968E0C();
    swift_allocError();
    *unint64_t v49 = v48;
    v49[1] = v47;
    swift_bridgeObjectRetain();
    swift_willThrow();
    return;
  }
  os_unfair_lock_lock(v14);
  sub_239968C00((uint64_t)v13);
  os_unfair_lock_unlock(v14);
  uint64_t v64 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AC8);
  uint64_t v15 = swift_allocObject();
  *(_DWORD *)(v15 + 32) = 0;
  *(void *)(v15 + 16) = sub_2399708CC;
  *(void *)(v15 + 24) = a1;
  unint64_t v16 = self;
  uint64_t v17 = a1[4];
  v67[0] = 0;
  swift_retain();
  id v18 = objc_msgSend(v16, sel_createWithInjectedScene_error_, v17, v67);
  id v19 = v67[0];
  if (!v18)
  {
    id v50 = v67[0];
    sub_23997FD00();

    swift_willThrow();
    swift_release();
    return;
  }
  uint64_t v58 = v14;
  id v63 = v18;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v3;
  os_log_t v61 = (os_log_t)a1[12];
  uint64_t v21 = swift_allocObject();
  id v60 = v19;
  uint64_t v22 = v15;
  uint64_t v23 = v21;
  *(void *)(v21 + 16) = sub_23997090C;
  *(void *)(v21 + 24) = v20;
  id v62 = v3;
  swift_retain();
  id v24 = v60;
  uint64_t v25 = sub_2399675EC((uint64_t)sub_239970930, v23, (uint64_t)v61);
  swift_release();
  swift_release();
  uint64_t v26 = *(NSObject **)v9;
  uint64_t v27 = (void *)*((void *)v9 + 1);
  uint64_t v14 = (os_unfair_lock_s *)*((void *)v9 + 2);
  id v60 = (id)*((void *)v9 + 3);
  os_log_t v61 = v26;
  id v28 = v63;
  *(void *)objc_super v9 = a1;
  *((void *)v9 + 1) = v28;
  *((void *)v9 + 2) = v25;
  *((void *)v9 + 3) = v22;
  swift_retain();
  uint64_t v59 = v22;
  swift_retain();
  uint64_t v57 = v25;
  swift_retain();
  id v29 = v28;
  sub_239970800((uint64_t)v61, v27);
  id v30 = v62;
  id v31 = objc_msgSend(v62, sel_view);
  if (!v31)
  {
    __break(1u);
    swift_release();

    goto LABEL_21;
  }
  uint64_t v32 = v31;
  objc_msgSend(v31, sel_addSubview_, v29);

  sub_23997FD40();
  swift_retain_n();
  id v33 = v30;
  uint64_t v34 = sub_23997FD50();
  os_log_type_t v35 = sub_23997FEE0();
  int v36 = v35;
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v37 = swift_slowAlloc();
    id v63 = v33;
    uint64_t v38 = v37;
    id v62 = (id)swift_slowAlloc();
    v67[0] = v62;
    *(_DWORD *)uint64_t v38 = 136446466;
    id v60 = (id)(v38 + 4);
    os_log_t v61 = v34;
    unint64_t v39 = sub_23996D2D0();
    uint64_t v66 = sub_239973FD8(v39, v40, (uint64_t *)v67);
    sub_23997FF20();

    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2082;
    LODWORD(v60) = v36;
    id v41 = v29;
    uint64_t v42 = a1[2];
    unint64_t v43 = a1[3];
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_239973FD8(v42, v43, (uint64_t *)v67);
    sub_23997FF20();
    swift_release_n();
    id v29 = v41;
    swift_bridgeObjectRelease();
    os_log_t v44 = v61;
    _os_log_impl(&dword_23995F000, v61, (os_log_type_t)v60, "%{public}s: hosting scene %{public}s", (uint8_t *)v38, 0x16u);
    id v45 = v62;
    swift_arrayDestroy();
    MEMORY[0x23ECA9A00](v45, -1, -1);
    uint64_t v46 = v38;
    id v33 = v63;
    MEMORY[0x23ECA9A00](v46, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v65 + 8))(v8, v5);
  uint64_t v51 = v58;
  uint64_t v52 = swift_allocObject();
  *(void *)(v52 + 16) = v33;
  *(void *)(v52 + 24) = a1;
  uint64_t v53 = MEMORY[0x270FA5388](v52);
  *(&v57 - 2) = (uint64_t)sub_239970978;
  *(&v57 - 1) = v53;
  swift_retain_n();
  unint64_t v54 = (char *)v33;
  os_unfair_lock_lock(v51);
  sub_239968FBC(v64, (char *)v67);
  os_unfair_lock_unlock(v51);
  if (((uint64_t)v67[0] & 1) == 0) {
    sub_23996F924(v54, (uint64_t)a1);
  }

  swift_release();
  swift_release();
  id v55 = &v54[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview];
  swift_beginAccess();
  if (*v55 == 1)
  {
    id v56 = objc_msgSend(v54, sel_traitCollection);
    objc_msgSend(v56, sel_activeAppearance);
    swift_release();

    swift_release();
  }
  else
  {
    swift_release();

    swift_release();
  }
}

uint64_t sub_23996ECA4(void *a1, int a2, char *a3, void *a4)
{
  LODWORD(v6) = a2;
  uint64_t v8 = sub_23997FD60();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v45 - v13;
  if (v6)
  {
    uint64_t v50 = v9;
    id v26 = a1;
    sub_23997FD40();
    uint64_t v27 = a3;
    sub_2399708C0(a1, 1);
    id v28 = v27;
    sub_2399708C0(a1, 1);
    id v29 = sub_23997FD50();
    os_log_type_t v30 = sub_23997FEE0();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      int v49 = v6;
      uint64_t v6 = v31;
      uint64_t v46 = (void *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      v53[0] = v47;
      *(_DWORD *)uint64_t v6 = 136446466;
      uint64_t v48 = a4;
      unint64_t v32 = sub_23996D2D0();
      uint64_t v54 = sub_239973FD8(v32, v33, v53);
      uint64_t v51 = v8;
      sub_23997FF20();

      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 12) = 2114;
      id v34 = a1;
      uint64_t v35 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v54 = v35;
      sub_23997FF20();
      int v36 = v46;
      void *v46 = v35;
      a4 = v48;
      sub_239969964(a1, 1);
      sub_239969964(a1, 1);
      _os_log_impl(&dword_23995F000, v29, v30, "%{public}s: failed to activate: %{public}@", (uint8_t *)v6, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B08);
      swift_arrayDestroy();
      MEMORY[0x23ECA9A00](v36, -1, -1);
      uint64_t v37 = v47;
      swift_arrayDestroy();
      MEMORY[0x23ECA9A00](v37, -1, -1);
      uint64_t v38 = v6;
      LOBYTE(v6) = v49;
      MEMORY[0x23ECA9A00](v38, -1, -1);

      sub_239969964(a1, 1);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v12, v51);
    }
    else
    {
      sub_239969964(a1, 1);

      sub_239969964(a1, 1);
      sub_239969964(a1, 1);

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v12, v8);
    }
  }
  else
  {
    uint64_t v51 = v8;
    uint64_t v15 = &a3[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_readyForDisplay];
    swift_beginAccess();
    *uint64_t v15 = 1;
    sub_23997FD40();
    unint64_t v16 = a3;
    uint64_t v17 = sub_23997FD50();
    os_log_type_t v18 = sub_23997FEE0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v50 = v9;
      uint64_t v20 = (uint8_t *)v19;
      uint64_t v21 = swift_slowAlloc();
      int v49 = v6;
      uint64_t v6 = v21;
      uint64_t v54 = v21;
      uint64_t v47 = (uint64_t)a3;
      uint64_t v48 = a1;
      *(_DWORD *)uint64_t v20 = 136446210;
      unint64_t v22 = sub_23996D2D0();
      uint64_t v52 = sub_239973FD8(v22, v23, &v54);
      a3 = (char *)v47;
      a1 = v48;
      sub_23997FF20();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23995F000, v17, v18, "%{public}s: ready for display", v20, 0xCu);
      swift_arrayDestroy();
      uint64_t v24 = v6;
      LOBYTE(v6) = v49;
      MEMORY[0x23ECA9A00](v24, -1, -1);
      MEMORY[0x23ECA9A00](v20, -1, -1);

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v14, v51);
    }
    else
    {

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v51);
    }
  }
  unint64_t v39 = (uint64_t *)&a3[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest];
  if (*(void *)&a3[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest + 32])
  {
    if (*v39 == *a4)
    {
      ((void (*)(void *, uint64_t))a4[4])(a1, v6 & 1);
      uint64_t v40 = *v39;
      uint64_t v41 = v39[1];
      uint64_t v42 = v39[2];
      uint64_t v43 = v39[3];
      uint64_t v44 = v39[4];
      *(_OWORD *)unint64_t v39 = 0u;
      *((_OWORD *)v39 + 1) = 0u;
      *((_OWORD *)v39 + 2) = 0u;
      return sub_2399701A0(v40, v41, v42, v43, v44);
    }
  }
  return result;
}

Swift::Void __swiftcall SceneHostingViewController.deactivate()()
{
  uint64_t v1 = sub_23997FD60();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host;
  if (*(void *)&v0[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host])
  {
    sub_23997FD40();
    uint64_t v6 = v0;
    uint64_t v7 = sub_23997FD50();
    os_log_type_t v8 = sub_23997FEE0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v20 = v1;
      uint64_t v10 = (uint8_t *)v9;
      uint64_t v11 = swift_slowAlloc();
      uint64_t v21 = v5;
      uint64_t v12 = v11;
      v23[0] = v11;
      *(_DWORD *)uint64_t v10 = 136446210;
      v19[1] = v10 + 4;
      unint64_t v13 = sub_23996D2D0();
      uint64_t v22 = sub_239973FD8(v13, v14, v23);
      sub_23997FF20();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23995F000, v7, v8, "%{public}s: deactivating (explicit request)", v10, 0xCu);
      swift_arrayDestroy();
      uint64_t v15 = v12;
      uint64_t v5 = v21;
      MEMORY[0x23ECA9A00](v15, -1, -1);
      MEMORY[0x23ECA9A00](v10, -1, -1);

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v20);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    }
    if (*(void *)&v0[v5])
    {
      sub_23996F450();
      unint64_t v16 = &v6[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler];
      swift_beginAccess();
      uint64_t v17 = *(void (**)(uint64_t))v16;
      if (*(void *)v16)
      {
        uint64_t v18 = swift_retain();
        v17(v18);
        sub_239968FAC((uint64_t)v17);
      }
    }
  }
}

uint64_t sub_23996F450()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_23997FD60();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46.receiver = v1;
  v46.super_class = ObjectType;
  if (objc_msgSendSuper2(&v46, sel_resignFirstResponder))
  {
    uint64_t v7 = *(os_unfair_lock_s **)&v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus];
    swift_retain();
    sub_23996C980(0, v7);
    swift_release();
  }
  os_log_type_t v8 = (uint64_t *)&v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  uint64_t v9 = *(void *)&v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  if (v9)
  {
    uint64_t v43 = v4;
    uint64_t v11 = (void *)v8[1];
    uint64_t v10 = v8[2];
    uint64_t v12 = v8[3];
    swift_retain();
    id v42 = v11;
    swift_retain();
    swift_retain();
    sub_23997FD40();
    sub_239970864(v9, v11);
    unint64_t v13 = v1;
    sub_239970864(v9, v11);
    unint64_t v14 = v13;
    uint64_t v15 = sub_23997FD50();
    os_log_type_t v16 = sub_23997FEE0();
    int v41 = v16;
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v40 = v1;
      uint64_t v18 = v17;
      uint64_t v37 = (uint64_t (*)())swift_slowAlloc();
      uint64_t v45 = v37;
      *(_DWORD *)uint64_t v18 = 136446466;
      unint64_t v39 = v11;
      os_log_t v36 = v15;
      unint64_t v19 = sub_23996D2D0();
      uint64_t v44 = sub_239973FD8(v19, v20, (uint64_t *)&v45);
      uint64_t v38 = v3;
      sub_23997FF20();

      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2082;
      uint64_t v21 = *(void *)(v9 + 16);
      unint64_t v22 = *(void *)(v9 + 24);
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_239973FD8(v21, v22, (uint64_t *)&v45);
      sub_23997FF20();
      uint64_t v11 = v39;
      swift_bridgeObjectRelease();
      sub_239970800(v9, v11);
      sub_239970800(v9, v11);
      os_log_t v23 = v36;
      _os_log_impl(&dword_23995F000, v36, (os_log_type_t)v41, "%{public}s: destroying host for scene %{public}s", (uint8_t *)v18, 0x16u);
      uint64_t v24 = v37;
      swift_arrayDestroy();
      MEMORY[0x23ECA9A00](v24, -1, -1);
      uint64_t v25 = v18;
      uint64_t v1 = v40;
      MEMORY[0x23ECA9A00](v25, -1, -1);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v6, v38);
    }
    else
    {

      sub_239970800(v9, v11);
      sub_239970800(v9, v11);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v6, v3);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v12 + 32));
    sub_23997DD54((uint64_t *)(v12 + 16), &v45);
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 32));
    id v26 = v45;
    if (v45)
    {
      uint64_t v27 = swift_retain();
      ((void (*)(uint64_t))v26)(v27);
      sub_239968FAC((uint64_t)v26);
      sub_239968FAC((uint64_t)v26);
    }
    id v28 = v42;
    objc_msgSend(v42, sel_removeFromSuperview);
    objc_msgSend(v28, sel_invalidate);
    objc_msgSend(*(id *)(v9 + 32), sel_setSceneResizeHandler_, 0);
    InjectedScene.relinquish()();
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v10 + 32));
    sub_23997DD54((uint64_t *)(v10 + 16), &v45);
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 32));
    id v29 = v45;
    if (v45)
    {
      uint64_t v30 = swift_retain();
      ((void (*)(uint64_t))v29)(v30);
      sub_239968FAC((uint64_t)v29);
      sub_239968FAC((uint64_t)v29);
    }
    sub_239970800(v9, v11);
    swift_release();
  }
  uint64_t v31 = *v8;
  unint64_t v32 = (void *)v8[1];
  *(_OWORD *)os_log_type_t v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  sub_239970800(v31, v32);
  unint64_t v33 = &v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_readyForDisplay];
  uint64_t result = swift_beginAccess();
  *unint64_t v33 = 0;
  return result;
}

uint64_t sub_23996F924(char *a1, uint64_t a2)
{
  uint64_t v4 = sub_23997FD60();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host;
  uint64_t v10 = *(void *)&a1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  if (v10) {
    BOOL v11 = v10 == a2;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    sub_23997FD40();
    uint64_t v12 = a1;
    unint64_t v13 = sub_23997FD50();
    os_log_type_t v14 = sub_23997FEE0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      v27[0] = v25;
      uint64_t v24 = v15;
      *(_DWORD *)uint64_t v15 = 136446210;
      v23[1] = v15 + 4;
      unint64_t v16 = sub_23996D2D0();
      uint64_t v26 = sub_239973FD8(v16, v17, v27);
      sub_23997FF20();

      swift_bridgeObjectRelease();
      uint64_t v18 = v24;
      _os_log_impl(&dword_23995F000, v13, v14, "%{public}s: deactivating (scene invalidated)", v24, 0xCu);
      uint64_t v19 = v25;
      swift_arrayDestroy();
      MEMORY[0x23ECA9A00](v19, -1, -1);
      MEMORY[0x23ECA9A00](v18, -1, -1);
    }
    else
    {
    }
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    if (*(void *)&a1[v9])
    {
      sub_23996F450();
      unint64_t v20 = &v12[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler];
      uint64_t result = swift_beginAccess();
      uint64_t v21 = *(void (**)(uint64_t))v20;
      if (*(void *)v20)
      {
        uint64_t v22 = swift_retain();
        v21(v22);
        return sub_239968FAC((uint64_t)v21);
      }
    }
  }
  return result;
}

id SceneHostingViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_23997FE20();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id SceneHostingViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v7 = &v3[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler];
  *id v7 = 0;
  v7[1] = 0;
  v3[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview] = 0;
  uint64_t v8 = qword_268A069E8;
  uint64_t v9 = v3;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = (uint64_t *)(qword_268A06FC0 + 16);
  BOOL v11 = (os_unfair_lock_s *)(qword_268A06FC0 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_268A06FC0 + 24));
  sub_23997DBEC(v10, &v21);
  uint64_t v12 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_identifier;
  os_unfair_lock_unlock(v11);
  *(void *)&v9[v12] = v21;
  unint64_t v13 = &v9[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  _OWORD *v13 = 0u;
  v13[1] = 0u;
  os_log_type_t v14 = &v9[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest];
  *os_log_type_t v14 = 0u;
  v14[1] = 0u;
  v14[2] = 0u;
  uint64_t v15 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06C00);
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + 24) = 0;
  *(void *)(v16 + 16) = MEMORY[0x263F8EE80];
  *(void *)&v9[v15] = v16;
  v9[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_readyForDisplay] = 0;

  if (a2)
  {
    unint64_t v17 = (void *)sub_23997FE20();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v17 = 0;
  }
  v20.receiver = v9;
  v20.super_class = ObjectType;
  id v18 = objc_msgSendSuper2(&v20, sel_initWithNibName_bundle_, v17, a3);

  return v18;
}

id SceneHostingViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SceneHostingViewController.init(coder:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler];
  void *v4 = 0;
  v4[1] = 0;
  v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview] = 0;
  uint64_t v5 = qword_268A069E8;
  uint64_t v6 = v1;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (uint64_t *)(qword_268A06FC0 + 16);
  uint64_t v8 = (os_unfair_lock_s *)(qword_268A06FC0 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_268A06FC0 + 24));
  sub_23997DBEC(v7, &v17);
  uint64_t v9 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_identifier;
  os_unfair_lock_unlock(v8);
  *(void *)&v6[v9] = v17;
  uint64_t v10 = &v6[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  *uint64_t v10 = 0u;
  v10[1] = 0u;
  BOOL v11 = &v6[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest];
  _OWORD *v11 = 0u;
  v11[1] = 0u;
  v11[2] = 0u;
  uint64_t v12 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06C00);
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 24) = 0;
  *(void *)(v13 + 16) = MEMORY[0x263F8EE80];
  *(void *)&v6[v12] = v13;
  v6[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_readyForDisplay] = 0;

  v16.receiver = v6;
  v16.super_class = ObjectType;
  id v14 = objc_msgSendSuper2(&v16, sel_initWithCoder_, a1);

  return v14;
}

id SceneHostingViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2399700D8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2399700E8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_239970120(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

unint64_t sub_23997014C()
{
  unint64_t result = qword_268A06BF0;
  if (!qword_268A06BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06BF0);
  }
  return result;
}

uint64_t sub_2399701A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2399701B0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2399701F0(void *a1, char a2)
{
  return sub_23996ECA4(a1, a2 & 1, *(char **)(v2 + 16), (void *)(v2 + 24));
}

uint64_t sub_239970208@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_23997025C(char *a1)
{
}

uint64_t type metadata accessor for SceneHostingViewController()
{
  return self;
}

ValueMetadata *type metadata accessor for SceneHostingViewController.ObservationToken()
{
  return &type metadata for SceneHostingViewController.ObservationToken;
}

uint64_t initializeBufferWithCopyOfBuffer for ShellToHostMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SceneHostingViewController.ActivationRequest()
{
  return swift_release();
}

uint64_t initializeWithCopy for SceneHostingViewController.ActivationRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SceneHostingViewController.ActivationRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  long long v3 = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SceneHostingViewController.ActivationRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneHostingViewController.ActivationRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneHostingViewController.ActivationRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneHostingViewController.ActivationRequest()
{
  return &type metadata for SceneHostingViewController.ActivationRequest;
}

uint64_t destroy for SceneHostingViewController.Host(uint64_t a1)
{
  swift_release();

  swift_release();

  return swift_release();
}

void *initializeWithCopy for SceneHostingViewController.Host(void *a1, void *a2)
{
  long long v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  id v5 = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SceneHostingViewController.Host(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a2[1];
  id v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for SceneHostingViewController.Host(uint64_t a1, _OWORD *a2)
{
  swift_release();
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  swift_release();
  *(_OWORD *)(a1 + 16) = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneHostingViewController.Host(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneHostingViewController.Host(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneHostingViewController.Host()
{
  return &type metadata for SceneHostingViewController.Host;
}

ValueMetadata *type metadata accessor for SceneHostingViewController.ActivationRequest.Superseded()
{
  return &type metadata for SceneHostingViewController.ActivationRequest.Superseded;
}

unint64_t sub_2399706D0(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_239970700();
  unint64_t result = sub_239970754();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_239970700()
{
  unint64_t result = qword_268A06C08;
  if (!qword_268A06C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06C08);
  }
  return result;
}

unint64_t sub_239970754()
{
  unint64_t result = qword_268A06C10;
  if (!qword_268A06C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06C10);
  }
  return result;
}

unint64_t sub_2399707AC()
{
  unint64_t result = qword_268A06C18;
  if (!qword_268A06C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06C18);
  }
  return result;
}

uint64_t sub_239970800(uint64_t result, void *a2)
{
  if (result)
  {
    swift_release();

    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_23997085C()
{
  return sub_239968AA4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_239970864(uint64_t result, void *a2)
{
  if (result)
  {
    swift_retain();
    id v3 = a2;
    swift_retain();
    return swift_retain();
  }
  return result;
}

id sub_2399708C0(id result, char a2)
{
  if (a2) {
    return result;
  }
  return result;
}

void sub_2399708CC()
{
  sub_239968C60(v0);
}

uint64_t sub_2399708D4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_23997090C()
{
  return sub_23996DC2C();
}

uint64_t sub_239970930(uint64_t a1)
{
  return sub_239967B90(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_239970938()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_239970978()
{
  return sub_23996F924(*(char **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_239970980@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2399709B0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_239970980(a1, a2);
}

void *SceneMessenger.__allocating_init(actionSender:)(uint64_t a1, uint64_t a2)
{
  unint64_t result = (void *)swift_allocObject();
  result[4] = 0;
  result[5] = 0;
  result[2] = a1;
  result[3] = a2;
  return result;
}

void SceneMessenger.receiveAction(_:)(NSObject *a1)
{
  uint64_t v117 = *v1;
  uint64_t v3 = v117;
  uint64_t v4 = sub_23997FD60();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v120 = (char *)&v102 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v102 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  v107 = (char *)&v102 - v12;
  uint64_t v13 = *(void *)(v3 + 88);
  uint64_t v105 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  v103 = (char *)&v102 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v106 = (char *)&v102 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v104 = (char *)&v102 - v19;
  MEMORY[0x270FA5388](v18);
  v108 = (char *)&v102 - v20;
  uint64_t v121 = *(void *)(v3 + 104);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v22 = sub_23997FF10();
  os_log_t v109 = *(os_log_t *)(v22 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v102 - v24;
  uint64_t v111 = AssociatedTypeWitness;
  uint64_t v116 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  id v28 = (char *)&v102 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  v110 = (char *)&v102 - v29;
  swift_beginAccess();
  uint64_t v30 = (void (*)(void, void))v1[4];
  if (v30)
  {
    uint64_t v112 = v1[5];
    v113 = v30;
    swift_retain();
    unsigned int v31 = [a1 canSendResponse];
    uint64_t v118 = v4;
    uint64_t v119 = v13;
    uint64_t v114 = v5;
    if (v31)
    {
      unint64_t v32 = a1;
      v115 = a1;
    }
    else
    {
      v115 = 0;
    }
    uint64_t v39 = sub_23996AE24();
    uint64_t v41 = v40;
    v123 = v39;
    uint64_t v124 = v40;
    uint64_t v42 = v111;
    swift_getAssociatedConformanceWitness();
    swift_bridgeObjectRetain();
    sub_23997FEA0();
    uint64_t v43 = v116;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v116 + 48))(v25, 1, v42) == 1)
    {
      ((void (*)(char *, uint64_t))v109[1].isa)(v25, v22);
      uint64_t v44 = v117;
      uint64_t v45 = *(void *)(v117 + 96);
      v123 = *(NSObject **)(v117 + 80);
      uint64_t v124 = v119;
      uint64_t v125 = v45;
      uint64_t v126 = v121;
      type metadata accessor for SceneMessenger.DecodeError();
      swift_getWitnessTable();
      objc_super v46 = (void *)swift_allocError();
      uint64_t *v47 = v39;
      v47[1] = v41;
      swift_willThrow();
      uint64_t v48 = v120;
      int v49 = (void *)sub_23996B084();
      objc_msgSend(v49, sel_invalidate);

      uint64_t v50 = *(void *)(v44 + 80);
      uint64_t v51 = *(void *)(v44 + 96);
      id v52 = v46;
      sub_23997FD40();
      id v53 = v46;
      id v54 = v46;
      id v55 = sub_23997FD50();
      os_log_type_t v56 = sub_23997FEC0();
      if (os_log_type_enabled(v55, v56))
      {
        uint64_t v57 = (uint8_t *)swift_slowAlloc();
        uint64_t v58 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v57 = 138543362;
        v123 = v50;
        uint64_t v124 = v119;
        uint64_t v125 = v51;
        uint64_t v126 = v121;
        type metadata accessor for SceneMessenger.InvalidMessageError();
        swift_getWitnessTable();
        swift_allocError();
        void *v59 = v46;
        id v60 = v46;
        uint64_t v61 = _swift_stdlib_bridgeErrorToNSError();
        v123 = v61;
        uint64_t v48 = v120;
        sub_23997FF20();
        *uint64_t v58 = v61;

        _os_log_impl(&dword_23995F000, v55, v56, "%{public}@", v57, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B08);
        swift_arrayDestroy();
        MEMORY[0x23ECA9A00](v58, -1, -1);
        MEMORY[0x23ECA9A00](v57, -1, -1);
      }
      else
      {
      }
      uint64_t v62 = v118;
      id v63 = v115;

      (*(void (**)(char *, uint64_t))(v114 + 8))(v48, v62);
      if (v63)
      {
        v123 = v50;
        uint64_t v124 = v119;
        uint64_t v125 = v51;
        uint64_t v126 = v121;
        type metadata accessor for SceneMessenger.InvalidMessageError();
        swift_getWitnessTable();
        uint64_t v64 = (void *)swift_allocError();
        *uint64_t v65 = v46;
        uint64_t v66 = v63;
        id v67 = v46;
        id v68 = v64;
        v69 = (void *)sub_23997FCF0();

        id v70 = objc_msgSend(self, sel_responseForError_, v69);
        sub_23996B198((uint64_t)v70);

        sub_239968FAC((uint64_t)v113);
      }
      else
      {
        sub_239968FAC((uint64_t)v113);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v71 = v110;
      (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v110, v25, v42);
      (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v28, v71, v42);
      uint64_t v72 = sub_23996B084();
      unint64_t v73 = sub_23996AF24();
      uint64_t v74 = v108;
      uint64_t v75 = v119;
      (*(void (**)(char *, uint64_t, unint64_t, uint64_t))(v121 + 56))(v28, v72, v73, v119);
      uint64_t v76 = v107;
      sub_23997FD40();
      uint64_t v77 = v105;
      uint64_t v78 = *(void (**)(char *, char *, uint64_t))(v105 + 16);
      unint64_t v79 = v104;
      v78(v104, v74, v75);
      char v80 = v106;
      v78(v106, v74, v75);
      v81 = v115;
      v120 = v115;
      char v82 = sub_23997FD50();
      os_log_type_t v83 = sub_23997FEB0();
      int v84 = v83;
      if (os_log_type_enabled(v82, v83))
      {
        uint64_t v85 = swift_slowAlloc();
        uint64_t v117 = swift_slowAlloc();
        v123 = v117;
        *(_DWORD *)uint64_t v85 = 136446722;
        os_log_t v109 = v82;
        v86 = v103;
        v78(v103, v79, v75);
        v87 = *(void (**)(char *, uint64_t))(v77 + 8);
        LODWORD(v105) = v84;
        v87(v79, v75);
        uint64_t v88 = v121;
        uint64_t v89 = sub_239980020();
        unint64_t v91 = v90;
        v87(v86, v75);
        uint64_t v122 = sub_239973FD8(v89, v91, (uint64_t *)&v123);
        sub_23997FF20();
        swift_bridgeObjectRelease();
        *(_WORD *)(v85 + 12) = 2082;
        uint64_t v92 = v88;
        v93 = v106;
        uint64_t v94 = SceneMessage.timingDescription.getter(v75, v92);
        uint64_t v122 = sub_239973FD8(v94, v95, (uint64_t *)&v123);
        sub_23997FF20();
        swift_bridgeObjectRelease();
        v87(v93, v75);
        *(_WORD *)(v85 + 22) = 2082;
        if (v115) {
          uint64_t v96 = 0x796C7065722F77;
        }
        else {
          uint64_t v96 = 0x7961772D656E6FLL;
        }
        uint64_t v122 = sub_239973FD8(v96, 0xE700000000000000, (uint64_t *)&v123);
        sub_23997FF20();
        v97 = v120;

        swift_bridgeObjectRelease();
        os_log_t v98 = v109;
        _os_log_impl(&dword_23995F000, v109, (os_log_type_t)v105, "Received %{public}s (%{public}s, %{public}s)", (uint8_t *)v85, 0x20u);
        uint64_t v99 = v117;
        swift_arrayDestroy();
        MEMORY[0x23ECA9A00](v99, -1, -1);
        v81 = v115;
        MEMORY[0x23ECA9A00](v85, -1, -1);

        (*(void (**)(char *, uint64_t))(v114 + 8))(v107, v118);
      }
      else
      {
        v87 = *(void (**)(char *, uint64_t))(v77 + 8);
        v87(v79, v75);
        v87(v80, v75);

        v97 = v120;
        (*(void (**)(char *, uint64_t))(v114 + 8))(v76, v118);
      }
      v123 = v81;
      v100 = v108;
      v101 = v113;
      v113(v108, &v123);
      sub_239968FAC((uint64_t)v101);
      v87(v100, v75);
      (*(void (**)(char *, uint64_t))(v116 + 8))(v110, v111);
    }
  }
  else
  {
    sub_23997FD40();
    unint64_t v33 = a1;
    id v34 = sub_23997FD50();
    os_log_type_t v35 = sub_23997FEC0();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v118 = v4;
      os_log_t v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v121 = swift_slowAlloc();
      *(_DWORD *)os_log_t v36 = 138543362;
      v123 = v33;
      uint64_t v37 = v33;
      uint64_t v4 = v118;
      sub_23997FF20();
      uint64_t v38 = v121;
      *(void *)uint64_t v121 = v33;

      _os_log_impl(&dword_23995F000, v34, v35, "Scene messenger has no receiver -- dropping message: %{public}@", v36, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B08);
      swift_arrayDestroy();
      MEMORY[0x23ECA9A00](v38, -1, -1);
      MEMORY[0x23ECA9A00](v36, -1, -1);
    }
    else
    {

      id v34 = v33;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
}

void SceneMessenger.send(message:replyTimeout:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v60 = a3;
  uint64_t v61 = a4;
  uint64_t v58 = a2;
  uint64_t v7 = *v4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06AB8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v59 = &v47[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v7 + 96);
  uint64_t v11 = *(void *)(v7 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v55 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v56 = AssociatedTypeWitness;
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  id v54 = &v47[-v14];
  uint64_t v15 = *(void *)(v11 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = &v47[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = &v47[-v19];
  uint64_t v21 = sub_23997FD60();
  uint64_t v52 = *(void *)(v21 - 8);
  uint64_t v53 = v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = &v47[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23997FD40();
  uint64_t v24 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 16);
  v24(v20, a1, v11);
  uint64_t v57 = a1;
  v24(v18, a1, v11);
  uint64_t v25 = sub_23997FD50();
  os_log_type_t v26 = sub_23997FEB0();
  int v27 = v26;
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    v63[0] = v50;
    *(_DWORD *)uint64_t v28 = 136446466;
    os_log_t v49 = v25;
    int v48 = v27;
    uint64_t v29 = sub_239980020();
    uint64_t v62 = sub_239973FD8(v29, v30, v63);
    uint64_t v51 = v5;
    sub_23997FF20();
    swift_bridgeObjectRelease();
    unsigned int v31 = *(void (**)(unsigned char *, uint64_t))(v15 + 8);
    v31(v20, v11);
    *(_WORD *)(v28 + 12) = 2082;
    uint64_t v32 = SceneMessage.timingDescription.getter(v11, v10);
    uint64_t v62 = sub_239973FD8(v32, v33, v63);
    uint64_t v5 = v51;
    sub_23997FF20();
    swift_bridgeObjectRelease();
    v31(v18, v11);
    os_log_t v34 = v49;
    _os_log_impl(&dword_23995F000, v49, (os_log_type_t)v48, "Sending %{public}s (%{public}s, w/reply)", (uint8_t *)v28, 0x16u);
    uint64_t v35 = v50;
    swift_arrayDestroy();
    MEMORY[0x23ECA9A00](v35, -1, -1);
    MEMORY[0x23ECA9A00](v28, -1, -1);
  }
  else
  {
    os_log_t v36 = *(void (**)(unsigned char *, uint64_t))(v15 + 8);
    v36(v20, v11);
    v36(v18, v11);
  }
  (*(void (**)(unsigned char *, uint64_t))(v52 + 8))(v23, v53);
  uint64_t v37 = v54;
  (*(void (**)(uint64_t, uint64_t))(v10 + 32))(v11, v10);
  uint64_t v38 = v56;
  swift_getAssociatedConformanceWitness();
  sub_23997FE90();
  (*(void (**)(unsigned char *, uint64_t))(v55 + 8))(v37, v38);
  uint64_t v39 = v63[0];
  uint64_t v40 = v63[1];
  uint64_t v41 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 48))(v11, v10);
  uint64_t v42 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 40))(v11, v10);
  uint64_t v43 = v59;
  sub_2399698FC(v58, (uint64_t)v59);
  sub_239968E70();
  uint64_t v44 = v61;
  swift_retain();
  uint64_t v45 = (void *)sub_23997FEF0();
  id v46 = sub_23996B73C(v39, v40, v41, v42, (uint64_t)v43, v45, v60, v44);
  ((void (*)(void))v5[2])();
}

void SceneMessenger.send(message:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 96);
  uint64_t v5 = *(void *)(*(void *)v1 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v48 = AssociatedTypeWitness;
  uint64_t v7 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  id v46 = (char *)&v39 - v8;
  uint64_t v9 = *(void *)(v5 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v39 - v13;
  uint64_t v15 = sub_23997FD60();
  uint64_t v44 = *(void *)(v15 - 8);
  uint64_t v45 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23997FD40();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v18(v14, a1, v5);
  uint64_t v49 = a1;
  v18(v12, a1, v5);
  uint64_t v19 = sub_23997FD50();
  os_log_type_t v20 = sub_23997FEB0();
  int v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v22 = swift_slowAlloc();
    int v41 = v21;
    uint64_t v23 = v22;
    uint64_t v42 = swift_slowAlloc();
    v51[0] = v42;
    *(_DWORD *)uint64_t v23 = 136446466;
    os_log_t v40 = v19;
    uint64_t v24 = sub_239980020();
    uint64_t v50 = sub_239973FD8(v24, v25, v51);
    uint64_t v43 = v2;
    sub_23997FF20();
    swift_bridgeObjectRelease();
    os_log_type_t v26 = *(void (**)(char *, uint64_t))(v9 + 8);
    v26(v14, v5);
    *(_WORD *)(v23 + 12) = 2082;
    uint64_t v27 = SceneMessage.timingDescription.getter(v5, v4);
    uint64_t v50 = sub_239973FD8(v27, v28, v51);
    uint64_t v2 = v43;
    sub_23997FF20();
    swift_bridgeObjectRelease();
    v26(v12, v5);
    uint64_t v19 = v40;
    _os_log_impl(&dword_23995F000, v40, (os_log_type_t)v41, "Sending %{public}s (%{public}s, one-way)", (uint8_t *)v23, 0x16u);
    uint64_t v29 = v42;
    swift_arrayDestroy();
    MEMORY[0x23ECA9A00](v29, -1, -1);
    MEMORY[0x23ECA9A00](v23, -1, -1);
  }
  else
  {
    unint64_t v30 = *(void (**)(char *, uint64_t))(v9 + 8);
    v30(v14, v5);
    v30(v12, v5);
  }

  (*(void (**)(char *, uint64_t))(v44 + 8))(v17, v45);
  unsigned int v31 = v46;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v5, v4);
  uint64_t v32 = v48;
  swift_getAssociatedConformanceWitness();
  sub_23997FE90();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v31, v32);
  uint64_t v33 = v51[0];
  uint64_t v34 = v51[1];
  uint64_t v35 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 48))(v5, v4);
  os_log_t v36 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40))(v5, v4);
  id v37 = objc_allocWithZone((Class)type metadata accessor for UVPreviewSceneAction());
  id v38 = sub_23996A920(v33, v34, v35, v36, 0);
  (*(void (**)(void))(v2 + 16))();
}

uint64_t sub_2399722D0()
{
  return 0;
}

uint64_t SceneMessage.payloadDescription.getter()
{
  return 0;
}

void SceneMessage.timing.getter(uint64_t a1@<X1>, BOOL *a2@<X8>)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(void))(a1 + 40))();

  *a2 = v3 == 0;
}

uint64_t SceneMessage.timingDescription.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(*(uint64_t (**)(void))(a2 + 40))();
  if (!v2) {
    return 0x636E797361;
  }
  uint64_t v3 = v2;
  objc_msgSend(v2, sel_fenceName);
  sub_239980020();
  sub_23997FE70();
  swift_bridgeObjectRelease();
  sub_23997FE70();

  return 0x3C6465636E6566;
}

uint64_t SceneMessage.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v7 = (char *)&v10 - v6;
  (*(void (**)(uint64_t, uint64_t))(a2 + 64))(a1, a2);
  if (v8)
  {
    uint64_t v11 = 40;
    unint64_t v12 = 0xE100000000000000;
    sub_23997FE70();
    sub_23997FE70();
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = 46;
  unint64_t v12 = 0xE100000000000000;
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  swift_getAssociatedConformanceWitness();
  sub_23997FE90();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
  sub_23997FE70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23997FE70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t SceneUpdateTiming.description.getter()
{
  if (*v0) {
    return 0x636E797361;
  }
  else {
    return 0x6465636E6566;
  }
}

uint64_t SceneUpdateTiming.rawValue.getter()
{
  if (*v0) {
    return 0x636E797361;
  }
  else {
    return 0x6465636E6566;
  }
}

uint64_t SceneUpdateTiming.unknownTimingError.getter()
{
  char v1 = *v0;
  sub_2399746B4();
  uint64_t result = swift_allocError();
  *uint64_t v3 = v1;
  return result;
}

unint64_t sub_239972690()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_239972748()
{
  return sub_23997F020();
}

uint64_t sub_239972750(uint64_t a1)
{
  unint64_t v2 = sub_239975FFC();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_23997278C(uint64_t a1)
{
  unint64_t v2 = sub_239975FFC();

  return MEMORY[0x270EF2668](a1, v2);
}

PreviewsServicesUI::SceneUpdateTiming_optional __swiftcall SceneUpdateTiming.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  uint64_t v3 = sub_239980010();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  char *v2 = v5;
  return result;
}

uint64_t sub_23997282C(char *a1, char *a2)
{
  return sub_23997A12C(*a1, *a2);
}

uint64_t sub_239972838()
{
  return sub_23997A1C8();
}

uint64_t sub_239972840()
{
  return sub_23997A7EC();
}

uint64_t sub_239972848()
{
  return sub_23997A850();
}

PreviewsServicesUI::SceneUpdateTiming_optional sub_239972850(Swift::String *a1)
{
  return SceneUpdateTiming.init(rawValue:)(*a1);
}

uint64_t sub_23997285C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SceneUpdateTiming.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t SceneUpdateSeed.rawValue.getter()
{
  return *(void *)v0;
}

PreviewsServicesUI::SceneUpdateSeed __swiftcall SceneUpdateSeed.init(rawValue:)(PreviewsServicesUI::SceneUpdateSeed rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

uint64_t SceneUpdateSeed.description.getter()
{
  return sub_239980020();
}

PreviewsServicesUI::SceneUpdateSeed __swiftcall SceneUpdateSeed.init()()
{
  *uint64_t v0 = ++qword_268A06C20;
  return result;
}

uint64_t sub_2399728F4()
{
  return sub_239980110();
}

uint64_t sub_23997293C()
{
  return sub_2399800F0();
}

uint64_t sub_239972968()
{
  return sub_239980110();
}

void *sub_2399729AC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_2399729BC()
{
  return 0;
}

id static SceneMessage.require(_:for:)(void *a1, uint64_t a2)
{
  if (a1) {
    return a1;
  }
  type metadata accessor for FenceError();
  swift_getWitnessTable();
  swift_allocError();
  uint64_t v5 = v4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(v5, a2, AssociatedTypeWitness);
  swift_storeEnumTagMultiPayload();
  return (id)swift_willThrow();
}

uint64_t static SceneMessage.requireNil(_:for:)(uint64_t result, uint64_t a2)
{
  if (result)
  {
    type metadata accessor for FenceError();
    swift_getWitnessTable();
    swift_allocError();
    uint64_t v4 = v3;
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(v4, a2, AssociatedTypeWitness);
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  return result;
}

uint64_t SceneMessage.unknownMessageError.getter(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, a1);
  type metadata accessor for UnknownMessageError();
  swift_getWitnessTable();
  uint64_t v6 = swift_allocError();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v7, v5, a1);
  return v6;
}

uint64_t sub_239972D64(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v19 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v13, v2, a1);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  if (EnumCaseMultiPayload == 1)
  {
    v16(v8, v13, AssociatedTypeWitness);
    uint64_t v19 = 0;
    unint64_t v20 = 0xE000000000000000;
    sub_23997FF70();
    sub_23997FE70();
    sub_239980120();
    sub_23997FE70();
    swift_bridgeObjectRelease();
    sub_23997FE70();
    sub_239980030();
    sub_23997FE70();
    uint64_t v17 = v19;
    uint64_t v11 = v8;
  }
  else
  {
    v16(v11, v13, AssociatedTypeWitness);
    uint64_t v19 = 0;
    unint64_t v20 = 0xE000000000000000;
    sub_23997FF70();
    sub_23997FE70();
    sub_239980120();
    sub_23997FE70();
    swift_bridgeObjectRelease();
    sub_23997FE70();
    sub_239980030();
    sub_23997FE70();
    uint64_t v17 = v19;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, AssociatedTypeWitness);
  return v17;
}

uint64_t sub_239973074()
{
  swift_getWitnessTable();

  return sub_23997D9D8();
}

uint64_t sub_2399730C8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return sub_23997D9FC(a1, WitnessTable);
}

uint64_t sub_23997311C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270EF2670](a1, WitnessTable);
}

uint64_t sub_239973170(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270EF2668](a1, WitnessTable);
}

uint64_t sub_2399731C4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v1 = *(void *)(a1 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = (char *)v8 - v5;
  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  sub_23997FF70();
  sub_23997FE70();
  sub_239980120();
  sub_23997FE70();
  swift_bridgeObjectRelease();
  sub_23997FE70();
  (*(void (**)(uint64_t, uint64_t))(v1 + 32))(v2, v1);
  sub_239980030();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, AssociatedTypeWitness);
  return v8[0];
}

uint64_t sub_239973348()
{
  swift_getWitnessTable();

  return sub_23997D9D8();
}

uint64_t sub_23997339C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return sub_23997D9FC(a1, WitnessTable);
}

uint64_t sub_2399733F0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270EF2670](a1, WitnessTable);
}

uint64_t sub_239973444(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270EF2668](a1, WitnessTable);
}

Swift::Void __swiftcall SceneMessageResponder.reply(payload:)(Swift::OpaquePointer_optional payload)
{
  if (payload.value._rawValue)
  {
    id v1 = objc_allocWithZone(MEMORY[0x263F29C78]);
    swift_bridgeObjectRetain();
    id v2 = objc_msgSend(v1, sel_init);
    id v3 = objc_allocWithZone(MEMORY[0x263F60FE0]);
    uint64_t v4 = (void *)sub_23997FE00();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v3, sel_initWithDictionary_, v4);

    objc_msgSend(v2, sel_setObject_forSetting_, v5, 1);
    id v6 = objc_msgSend(self, sel_responseWithInfo_, v2);
  }
  else
  {
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29BC0]), sel_init);
  }
  sub_23996B198((uint64_t)v6);
}

void SceneMessageResponder.reply(error:)(void *a1)
{
  id v2 = a1;
  id v3 = (void *)sub_23997FCF0();

  id v4 = objc_msgSend(self, sel_responseForError_, v3);
  sub_23996B198((uint64_t)v4);
}

void SceneMessageResponder.reply(result:)(void *a1, char a2)
{
  if (a2)
  {
    id v3 = a1;
    id v4 = (void *)sub_23997FCF0();
    id v5 = objc_msgSend(self, sel_responseForError_, v4);

    sub_23996B198((uint64_t)v5);
    sub_239969964(a1, 1);
  }
  else
  {
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29BC0]), sel_init);
    sub_23996B198((uint64_t)v6);
  }
}

uint64_t sub_239973758@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  long long v11 = *(_OWORD *)(a3 + a2 - 16);
  long long v12 = *(_OWORD *)(a3 + a2 - 32);
  uint64_t v5 = *a1;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = *(void *)(v5 + 40);
  if (v6)
  {
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = v12;
    *(_OWORD *)(v8 + 32) = v11;
    *(void *)(v8 + 48) = v6;
    *(void *)(v8 + 56) = v7;
    uint64_t v9 = sub_2399761E0;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }
  *a4 = v9;
  a4[1] = (uint64_t (*)())v8;
  return sub_2399700D8(v6);
}

uint64_t sub_239973808(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if (*a1)
  {
    uint64_t v7 = a4 + a3;
    uint64_t v8 = swift_allocObject();
    long long v9 = *(_OWORD *)(v7 - 16);
    *(_OWORD *)(v8 + 16) = *(_OWORD *)(v7 - 32);
    *(_OWORD *)(v8 + 32) = v9;
    *(void *)(v8 + 48) = v5;
    *(void *)(v8 + 56) = v6;
    uint64_t v10 = sub_2399761B8;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v11 = *a2;
  swift_beginAccess();
  uint64_t v12 = *(void *)(v11 + 32);
  *(void *)(v11 + 32) = v10;
  *(void *)(v11 + 40) = v8;
  sub_2399700D8(v5);
  return sub_239968FAC(v12);
}

uint64_t SceneMessenger.messageReceiver.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  sub_2399700D8(v1);
  return v1;
}

uint64_t SceneMessenger.messageReceiver.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 32);
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return sub_239968FAC(v5);
}

uint64_t (*SceneMessenger.messageReceiver.modify())()
{
  return j__swift_endAccess;
}

void *SceneMessenger.init(actionSender:)(uint64_t a1, uint64_t a2)
{
  v2[4] = 0;
  v2[5] = 0;
  v2[2] = a1;
  v2[3] = a2;
  return v2;
}

unint64_t sub_2399739D8()
{
  return sub_239974630();
}

uint64_t sub_2399739E8()
{
  swift_getWitnessTable();

  return sub_23997D9D8();
}

uint64_t sub_239973A3C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return sub_23997D9FC(a1, WitnessTable);
}

uint64_t sub_239973A90(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270EF2670](a1, WitnessTable);
}

uint64_t sub_239973AE4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270EF2668](a1, WitnessTable);
}

unint64_t sub_239973B38()
{
  return 0xD000000000000011;
}

unint64_t sub_239973BC8()
{
  return sub_239973B38();
}

uint64_t sub_239973BDC()
{
  swift_getWitnessTable();

  return sub_23997D9D8();
}

uint64_t sub_239973C30(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return sub_23997D9FC(a1, WitnessTable);
}

uint64_t sub_239973C84(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270EF2670](a1, WitnessTable);
}

uint64_t sub_239973CD8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270EF2668](a1, WitnessTable);
}

uint64_t SceneMessenger.deinit()
{
  swift_release();
  sub_239968FAC(*(void *)(v0 + 32));
  return v0;
}

uint64_t SceneMessenger.__deallocating_deinit()
{
  swift_release();
  sub_239968FAC(*(void *)(v0 + 32));

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_239973D94(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_239973DA4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_239973DE0(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_239973E18(uint64_t (*a1)(void))
{
  return a1();
}

unsigned char **sub_239973E40(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  id v4 = *result;
  unsigned char *v4 = a4;
  *PreviewsServicesUI::SceneUpdateSeed result = v4 + 1;
  return result;
}

void sub_239973E50(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_23997FF20();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_239973F08(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_239973F30(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_239973FD8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_23997FF20();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t type metadata accessor for SceneMessenger.InvalidMessageError()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for SceneMessenger.DecodeError()
{
  return swift_getGenericMetadata();
}

uint64_t sub_239973FD8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2399740AC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23996BC88((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_23996BC88((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2399740AC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_23997FF30();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_239974268(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_23997FF90();
  if (!v8)
  {
    sub_23997FFB0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_239980000();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_239974268(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_239974300(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2399744E0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2399744E0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_239974300(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_239974478(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_23997FF80();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_23997FFB0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_23997FE80();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_239980000();
    __break(1u);
LABEL_14:
    uint64_t result = sub_23997FFB0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_239974478(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06ED0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2399744E0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A06ED0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_239980000();
  __break(1u);
  return result;
}

unint64_t sub_239974630()
{
  return 0xD000000000000011;
}

unint64_t sub_2399746B4()
{
  unint64_t result = qword_268A06C28;
  if (!qword_268A06C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06C28);
  }
  return result;
}

uint64_t type metadata accessor for FenceError()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for UnknownMessageError()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_23997473C()
{
  unint64_t result = qword_268A06C30;
  if (!qword_268A06C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06C30);
  }
  return result;
}

unint64_t sub_239974794()
{
  unint64_t result = qword_268A06C38[0];
  if (!qword_268A06C38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268A06C38);
  }
  return result;
}

uint64_t sub_2399747F0()
{
  return 32;
}

__n128 sub_2399747FC(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t dispatch thunk of SceneMessage.messageType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SceneMessage.fenceHandle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SceneMessage.payload.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of SceneMessage.init(messageType:fenceHandle:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of SceneMessage.payloadDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

ValueMetadata *type metadata accessor for SceneUpdateTiming()
{
  return &type metadata for SceneUpdateTiming;
}

ValueMetadata *type metadata accessor for SceneUpdateSeed()
{
  return &type metadata for SceneUpdateSeed;
}

ValueMetadata *type metadata accessor for SceneMessageResponder()
{
  return &type metadata for SceneMessageResponder;
}

uint64_t sub_2399748BC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SceneMessenger()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for SceneMessenger(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SceneMessenger);
}

uint64_t dispatch thunk of SceneMessenger.__allocating_init(actionSender:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_239974950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_239974958()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2399749E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  long long v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *long long v3 = *a2;
    long long v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_239974AA0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_239974ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_239974B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_239974B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_239974BBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_239974C0C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_239974D68(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x239974F80);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t sub_239974FA8()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_239975044(void *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(_DWORD *)(v5 + 80);
  if (v7 <= 7 && (unint64_t)(v6 + 1) <= 0x18 && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    unsigned int v11 = a2[v6];
    if (v11 >= 2)
    {
      if (v6 <= 3) {
        uint64_t v12 = v6;
      }
      else {
        uint64_t v12 = 4;
      }
      switch(v12)
      {
        case 1:
          int v13 = *a2;
          goto LABEL_18;
        case 2:
          int v13 = *(unsigned __int16 *)a2;
          goto LABEL_18;
        case 3:
          int v13 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_18;
        case 4:
          int v13 = *(_DWORD *)a2;
LABEL_18:
          int v14 = (v13 | ((v11 - 2) << (8 * v6))) + 2;
          unsigned int v15 = v13 + 2;
          if (v6 >= 4) {
            unsigned int v11 = v15;
          }
          else {
            unsigned int v11 = v14;
          }
          break;
        default:
          break;
      }
    }
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    *((unsigned char *)a1 + v6) = v11 == 1;
  }
  else
  {
    uint64_t v10 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (void *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  return a1;
}

uint64_t sub_2399751D0(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);

  return v3(a1, AssociatedTypeWitness);
}

uint64_t sub_23997524C(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  unsigned int v6 = a2[v5];
  unsigned int v7 = v6 - 2;
  if (v6 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a2;
        goto LABEL_10;
      case 2:
        int v9 = *(unsigned __int16 *)a2;
        goto LABEL_10;
      case 3:
        int v9 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_10;
      case 4:
        int v9 = *(_DWORD *)a2;
LABEL_10:
        int v10 = (v9 | (v7 << (8 * v5))) + 2;
        unsigned int v6 = v9 + 2;
        if (v5 < 4) {
          unsigned int v6 = v10;
        }
        break;
      default:
        break;
    }
  }
  BOOL v11 = v6 == 1;
  (*(void (**)(uint64_t, unsigned __int8 *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a1, a2, AssociatedTypeWitness);
  *(unsigned char *)(a1 + v5) = v11;
  return a1;
}

unsigned __int8 *sub_239975390(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 != a2)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v6 = *(void *)(v5 + 64);
    (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
    unsigned int v7 = a2[v6];
    unsigned int v8 = v7 - 2;
    if (v7 >= 2)
    {
      if (v6 <= 3) {
        uint64_t v9 = v6;
      }
      else {
        uint64_t v9 = 4;
      }
      switch(v9)
      {
        case 1:
          int v10 = *a2;
          goto LABEL_11;
        case 2:
          int v10 = *(unsigned __int16 *)a2;
          goto LABEL_11;
        case 3:
          int v10 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_11;
        case 4:
          int v10 = *(_DWORD *)a2;
LABEL_11:
          int v11 = (v10 | (v8 << (8 * v6))) + 2;
          unsigned int v7 = v10 + 2;
          if (v6 < 4) {
            unsigned int v7 = v11;
          }
          break;
        default:
          break;
      }
    }
    BOOL v12 = v7 == 1;
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    a1[v6] = v12;
  }
  return a1;
}

uint64_t sub_239975504(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  unsigned int v6 = a2[v5];
  unsigned int v7 = v6 - 2;
  if (v6 >= 2)
  {
    if (v5 <= 3) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = 4;
    }
    switch(v8)
    {
      case 1:
        int v9 = *a2;
        goto LABEL_10;
      case 2:
        int v9 = *(unsigned __int16 *)a2;
        goto LABEL_10;
      case 3:
        int v9 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_10;
      case 4:
        int v9 = *(_DWORD *)a2;
LABEL_10:
        int v10 = (v9 | (v7 << (8 * v5))) + 2;
        unsigned int v6 = v9 + 2;
        if (v5 < 4) {
          unsigned int v6 = v10;
        }
        break;
      default:
        break;
    }
  }
  BOOL v11 = v6 == 1;
  (*(void (**)(uint64_t, unsigned __int8 *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a1, a2, AssociatedTypeWitness);
  *(unsigned char *)(a1 + v5) = v11;
  return a1;
}

unsigned __int8 *sub_239975648(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 != a2)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v6 = *(void *)(v5 + 64);
    (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
    unsigned int v7 = a2[v6];
    unsigned int v8 = v7 - 2;
    if (v7 >= 2)
    {
      if (v6 <= 3) {
        uint64_t v9 = v6;
      }
      else {
        uint64_t v9 = 4;
      }
      switch(v9)
      {
        case 1:
          int v10 = *a2;
          goto LABEL_11;
        case 2:
          int v10 = *(unsigned __int16 *)a2;
          goto LABEL_11;
        case 3:
          int v10 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_11;
        case 4:
          int v10 = *(_DWORD *)a2;
LABEL_11:
          int v11 = (v10 | (v8 << (8 * v6))) + 2;
          unsigned int v7 = v10 + 2;
          if (v6 < 4) {
            unsigned int v7 = v11;
          }
          break;
        default:
          break;
      }
    }
    BOOL v12 = v7 == 1;
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    a1[v6] = v12;
  }
  return a1;
}

uint64_t sub_2399757BC(unsigned __int16 *a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_20;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_20;
      }
      goto LABEL_12;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_20;
      }
      goto LABEL_12;
    }
    if (v9 < 2)
    {
LABEL_20:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_20;
  }
LABEL_12:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_23997591C(unsigned char *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  size_t v7 = v6 + 1;
  if (a3 < 0xFF)
  {
    int v8 = 0;
  }
  else if (v7 <= 3)
  {
    unsigned int v11 = ((a3 + ~(-1 << (8 * v7)) - 254) >> (8 * v7)) + 1;
    if (HIWORD(v11))
    {
      int v8 = 4;
    }
    else if (v11 >= 0x100)
    {
      int v8 = 2;
    }
    else
    {
      int v8 = v11 > 1;
    }
  }
  else
  {
    int v8 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v9 = a2 - 255;
    if (v7 < 4)
    {
      int v10 = (v9 >> (8 * v7)) + 1;
      if (v6 != -1)
      {
        int v12 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if (v7 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }
        else if (v7 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v6 + 1);
      *(_DWORD *)a1 = v9;
      int v10 = 1;
    }
    switch(v8)
    {
      case 1:
        a1[v7] = v10;
        break;
      case 2:
        *(_WORD *)&a1[v7] = v10;
        break;
      case 3:
LABEL_32:
        __break(1u);
        JUMPOUT(0x239975AF8);
      case 4:
        *(_DWORD *)&a1[v7] = v10;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v8)
    {
      case 1:
        a1[v7] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_21;
      case 2:
        *(_WORD *)&a1[v7] = 0;
        goto LABEL_20;
      case 3:
        goto LABEL_32;
      case 4:
        *(_DWORD *)&a1[v7] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_21;
      default:
LABEL_20:
        if (a2) {
LABEL_21:
        }
          a1[v6] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_239975B20(unsigned __int8 *a1)
{
  uint64_t v2 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  uint64_t result = a1[v2];
  if (result >= 2)
  {
    if (v2 <= 3) {
      uint64_t v4 = v2;
    }
    else {
      uint64_t v4 = 4;
    }
    switch(v4)
    {
      case 1:
        int v5 = *a1;
        goto LABEL_10;
      case 2:
        int v5 = *(unsigned __int16 *)a1;
        goto LABEL_10;
      case 3:
        int v5 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_10;
      case 4:
        int v5 = *(_DWORD *)a1;
LABEL_10:
        unsigned int v6 = (v5 | ((result - 2) << (8 * v2))) + 2;
        unsigned int v7 = v5 + 2;
        if (v2 >= 4) {
          uint64_t result = v7;
        }
        else {
          uint64_t result = v6;
        }
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_239975C00(unsigned char *a1, unsigned int a2)
{
  size_t v4 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

unsigned char *_s18PreviewsServicesUI17SceneUpdateTimingOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x239975DB4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneUpdateTiming.UnknownTimingError()
{
  return &type metadata for SceneUpdateTiming.UnknownTimingError;
}

uint64_t sub_239975DEC()
{
  return 0;
}

uint64_t sub_239975DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

void *sub_239975DFC(void *a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  *a1 = v3;
  return a1;
}

void sub_239975E30(id *a1)
{
}

void **sub_239975E38(void **a1, id *a2)
{
  id v3 = *a2;
  id v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = v3;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **sub_239975E80(void **a1, void **a2)
{
  id v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_239975EB4(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_239975EFC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_239975F38()
{
  return swift_getWitnessTable();
}

uint64_t sub_239975F54(uint64_t a1)
{
  return sub_239976134(a1);
}

uint64_t sub_239975F80()
{
  return swift_getWitnessTable();
}

uint64_t sub_239975F9C(uint64_t a1)
{
  return sub_239976134(a1);
}

unint64_t sub_239975FCC(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_239975FFC();
  unint64_t result = sub_239976050();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_239975FFC()
{
  unint64_t result = qword_268A06EC0;
  if (!qword_268A06EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06EC0);
  }
  return result;
}

unint64_t sub_239976050()
{
  unint64_t result = qword_268A06EC8;
  if (!qword_268A06EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06EC8);
  }
  return result;
}

uint64_t sub_2399760A4()
{
  return swift_getWitnessTable();
}

uint64_t sub_2399760C0(uint64_t a1)
{
  return sub_239976134(a1);
}

uint64_t sub_2399760EC()
{
  return swift_getWitnessTable();
}

uint64_t sub_239976108(uint64_t a1)
{
  return sub_239976134(a1);
}

uint64_t sub_239976134(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_239976180()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2399761B8()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_2399761E0()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t previewImage(category:description:file:line:)()
{
  uint64_t v0 = (void *)sub_23997FD30();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_, v0);

  return MEMORY[0x270F04630](v1);
}

id previewImage(category:description:file:line:)()
{
  uint64_t v0 = (void *)sub_23997FD30();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_, v0);

  return v1;
}

unint64_t PreviewPreferences.InterfaceOrientation.description.getter()
{
  unint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
    case 3:
      unint64_t result = 0x70616373646E616CLL;
      break;
    default:
      unint64_t result = 0x7469617274726F70;
      break;
  }
  return result;
}

unint64_t PreviewPreferences.InterfaceOrientation.rawValue.getter()
{
  unint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
    case 3:
      unint64_t result = 0x70616373646E616CLL;
      break;
    default:
      unint64_t result = 0x7469617274726F70;
      break;
  }
  return result;
}

PreviewsServicesUI::PreviewPreferences::InterfaceOrientation_optional __swiftcall PreviewPreferences.InterfaceOrientation.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_239980010();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t sub_239976450(unsigned __int8 *a1, char *a2)
{
  return sub_239979F04(*a1, *a2);
}

uint64_t sub_23997645C()
{
  return sub_23997A244();
}

uint64_t sub_239976464()
{
  return sub_23997A6B0();
}

uint64_t sub_23997646C()
{
  return sub_23997A944();
}

PreviewsServicesUI::PreviewPreferences::InterfaceOrientation_optional sub_239976474(Swift::String *a1)
{
  return PreviewPreferences.InterfaceOrientation.init(rawValue:)(*a1);
}

unint64_t sub_239976480@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PreviewPreferences.InterfaceOrientation.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t PreviewPreferences.preferredSize.getter()
{
  return *(void *)v0;
}

void PreviewPreferences.preferredOrientation.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 17);
}

PreviewsServicesUI::PreviewPreferences __swiftcall PreviewPreferences.init(preferredSize:preferredOrientation:)(CGSize_optional preferredSize, PreviewsServicesUI::PreviewPreferences::InterfaceOrientation preferredOrientation)
{
  char v5 = *v3;
  *(void *)uint64_t v4 = *(void *)&preferredSize.is_nil;
  *(void *)(v4 + 8) = preferredOrientation;
  *(unsigned char *)(v4 + 16) = v2 & 1;
  *(unsigned char *)(v4 + 17) = v5;
  result.preferredSize.value.height = preferredSize.value.height;
  result.preferredSize.value.width = preferredSize.value.width;
  result.preferredSize.is_nil = preferredSize.is_nil;
  return result;
}

void static PreviewPreferences.default.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
}

uint64_t sub_2399764EC(char a1)
{
  if (a1) {
    return 0xD000000000000014;
  }
  else {
    return 0x6572726566657270;
  }
}

uint64_t sub_239976534(char *a1, char *a2)
{
  return sub_239979E50(*a1, *a2);
}

uint64_t sub_239976540()
{
  return sub_23997A32C();
}

uint64_t sub_239976548()
{
  return sub_23997A634();
}

uint64_t sub_239976550()
{
  return sub_23997AA28();
}

uint64_t sub_239976558@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_239980010();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_2399765B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2399764EC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t PreviewPreferences.dictionaryValue.getter()
{
  unint64_t v1 = 0xD000000000000012;
  uint64_t v2 = *(void *)v0;
  uint64_t v3 = *(void *)(v0 + 8);
  char v4 = *(unsigned char *)(v0 + 16);
  uint64_t v5 = *(unsigned __int8 *)(v0 + 17);
  uint64_t v13 = MEMORY[0x263F8EE80];
  sub_2399768EC(v2, v3, v4, 0);
  uint64_t v12 = MEMORY[0x263F8D310];
  unint64_t v6 = 0x8000000239982DD0;
  switch(v5)
  {
    case 1:
      break;
    case 2:
      unint64_t v6 = 0xED00007466654C65;
      goto LABEL_5;
    case 3:
      unint64_t v6 = 0xEE00746867695265;
LABEL_5:
      unint64_t v1 = 0x70616373646E616CLL;
      break;
    default:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v1 = 0x7469617274726F70;
      break;
  }
  *(void *)&long long v11 = v1;
  *((void *)&v11 + 1) = v6;
  sub_23996BBE8(&v11, v10);
  uint64_t v7 = v13;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_239978C60(v10, 0xD000000000000014, 0x8000000239982F10, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_239976734(uint64_t a1, uint64_t a2, __int16 a3, char a4)
{
  uint64_t v4 = 8 * a4;
  uint64_t v5 = *(void *)&aPreferenseed[v4];
  uint64_t v6 = *(void *)&aCes[v4];
  if ((a3 & 0xFF00) == 0x400)
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  else
  {
    unint64_t v7 = 0xD000000000000012;
    uint64_t v8 = HIBYTE(a3);
    uint64_t v14 = MEMORY[0x263F8EE80];
    sub_2399768EC(a1, a2, a3 & 1, 0);
    *((void *)&v16 + 1) = MEMORY[0x263F8D310];
    unint64_t v9 = 0x8000000239982DD0;
    switch(v8)
    {
      case 1:
        break;
      case 2:
        unint64_t v9 = 0xED00007466654C65;
        goto LABEL_7;
      case 3:
        unint64_t v9 = 0xEE00746867695265;
LABEL_7:
        unint64_t v7 = 0x70616373646E616CLL;
        break;
      default:
        unint64_t v9 = 0xE800000000000000;
        unint64_t v7 = 0x7469617274726F70;
        break;
    }
    *(void *)&long long v15 = v7;
    *((void *)&v15 + 1) = v9;
    sub_23996BBE8(&v15, v13);
    uint64_t v10 = v14;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_239978C60(v13, 0xD000000000000014, 0x8000000239982F10, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    *((void *)&v16 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F08);
    *(void *)&long long v15 = v10;
  }
  return sub_239976D74((uint64_t)&v15, v5, v6);
}

uint64_t sub_2399768EC(uint64_t a1, uint64_t a2, char a3, char a4)
{
  if (a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EF38];
    *((void *)&v15 + 1) = MEMORY[0x263F8EF38];
    *(void *)&long long v14 = a1;
    sub_23996BBE8(&v14, v13);
    uint64_t v7 = MEMORY[0x263F8EE80];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_239978C60(v13, 0x6874646977, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    *((void *)&v15 + 1) = v6;
    *(void *)&long long v14 = a2;
    sub_23996BBE8(&v14, v13);
    char v9 = swift_isUniquelyReferenced_nonNull_native();
    sub_239978C60(v13, 0x746867696568, 0xE600000000000000, v9);
    swift_bridgeObjectRelease();
    *((void *)&v15 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F08);
    *(void *)&long long v14 = v7;
  }
  if (a4) {
    uint64_t v10 = 0xD000000000000014;
  }
  else {
    uint64_t v10 = 0x6572726566657270;
  }
  if (a4) {
    uint64_t v11 = 0x8000000239982F10;
  }
  else {
    uint64_t v11 = 0xED0000657A695364;
  }
  return sub_239976D74((uint64_t)&v14, v10, v11);
}

PreviewsServicesUI::PreviewPreferences __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> PreviewPreferences.init(dictionaryValue:)(Swift::OpaquePointer dictionaryValue)
{
  uint64_t v4 = v1;
  uint64_t v5 = sub_239977498(0, (uint64_t)dictionaryValue._rawValue);
  if (!v2)
  {
    uint64_t v9 = v5;
    if (v5)
    {
      double v10 = sub_23997F7DC(v5);
      uint64_t v12 = v11;
    }
    else
    {
      double v10 = 0.0;
      uint64_t v12 = 0;
    }
    sub_239977C50(1, (uint64_t)dictionaryValue._rawValue, &v16);
    char v13 = v16;
    if (v16 != 4)
    {
      __int16 v6 = swift_bridgeObjectRelease();
      *(double *)uint64_t v4 = v10;
      *(void *)(v4 + 8) = v12;
      *(unsigned char *)(v4 + 16) = v9 == 0;
      *(unsigned char *)(v4 + 17) = v13;
      goto LABEL_9;
    }
    sub_239978DB4();
    swift_allocError();
    uint64_t v15 = v14;
    *(void *)(v14 + 24) = &type metadata for PreviewPreferences.Key;
    *(unsigned char *)uint64_t v14 = 1;
    *(void *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B50);
    *(void *)(v15 + 32) = MEMORY[0x263F8D310];
    *(unsigned char *)(v15 + 96) = 0;
    swift_willThrow();
  }
  __int16 v6 = swift_bridgeObjectRelease();
LABEL_9:
  result.preferredSize.value.height = v8;
  result.preferredSize.value.width = v7;
  *(_WORD *)&result.preferredSize.is_nil = v6;
  return result;
}

uint64_t PreviewPreferences.description.getter()
{
  if ((v0[2] & 1) == 0)
  {
    uint64_t v1 = *v0;
    uint64_t v2 = v0[1];
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A06EE0);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_239981E10;
    uint64_t v4 = MEMORY[0x263F8EF38];
    *(void *)(v3 + 56) = MEMORY[0x263F8EF38];
    unint64_t v5 = sub_2399797FC();
    *(void *)(v3 + 64) = v5;
    *(void *)(v3 + 32) = v1;
    *(void *)(v3 + 96) = v4;
    *(void *)(v3 + 104) = v5;
    *(void *)(v3 + 72) = v2;
    sub_23997FE40();
    sub_23997FE70();
    swift_bridgeObjectRelease();
    sub_23997FE70();
  }
  sub_23997FE70();
  swift_bridgeObjectRelease();
  sub_23997FE70();
  return 91;
}

uint64_t sub_239976D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_23996BBE8((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_239978C60(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_239979C44(a1);
    sub_239977E6C(a2, a3, v9);
    sub_239979C44((uint64_t)v9);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_239976E30@<X0>(char a1@<W0>, uint64_t a2@<X1>, long long *a3@<X8>)
{
  char v4 = a1 & 1;
  if (a1) {
    uint64_t v5 = 0xE900000000000061;
  }
  else {
    uint64_t v5 = 0xE400000000000000;
  }
  if (!*(void *)(a2 + 16)
    || ((a1 & 1) != 0 ? (uint64_t v7 = 0x746144746E657665) : (uint64_t v7 = 1684366707), v8 = sub_239977F5C(v7, v5), (v9 & 1) == 0))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_23996BC88(*(void *)(a2 + 56) + 32 * v8, (uint64_t)&v17);
  swift_bridgeObjectRelease();
  if (!*((void *)&v18 + 1))
  {
LABEL_13:
    uint64_t result = sub_239979C44((uint64_t)&v17);
    long long v12 = xmmword_239981E20;
    goto LABEL_14;
  }
  sub_23996BBE8(&v17, v19);
  sub_23996BC88((uint64_t)v19, (uint64_t)&v17);
  uint64_t v10 = MEMORY[0x263F06F78];
  if (swift_dynamicCast())
  {
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    long long v12 = v16;
LABEL_14:
    *a3 = v12;
    return result;
  }
  sub_239978DB4();
  swift_allocError();
  uint64_t v14 = v13;
  uint64_t v15 = v13 + 64;
  *(void *)(v13 + 24) = &type metadata for HostToShellMessage.Key;
  *(unsigned char *)uint64_t v13 = v4;
  *(void *)(v13 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F28);
  *(void *)(v14 + 32) = v10;
  sub_23996BC88((uint64_t)v19, v15);
  *(unsigned char *)(v14 + 96) = 1;
  swift_willThrow();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
}

uint64_t sub_239976FC8(char a1, uint64_t a2)
{
  char v2 = a1 & 1;
  if (a1) {
    uint64_t v3 = 0xE900000000000061;
  }
  else {
    uint64_t v3 = 0xE400000000000000;
  }
  if (!*(void *)(a2 + 16)
    || ((a1 & 1) != 0 ? (uint64_t v5 = 0x746144746E657665) : (uint64_t v5 = 1684366707), v6 = sub_239977F5C(v5, v3), (v7 & 1) == 0))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_23996BC88(*(void *)(a2 + 56) + 32 * v6, (uint64_t)&v14);
  swift_bridgeObjectRelease();
  if (!*((void *)&v15 + 1))
  {
LABEL_13:
    sub_239979C44((uint64_t)&v14);
    return 0;
  }
  sub_23996BBE8(&v14, v16);
  sub_23996BC88((uint64_t)v16, (uint64_t)&v14);
  uint64_t v8 = MEMORY[0x263F8D6C8];
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return v13;
  }
  else
  {
    sub_239978DB4();
    swift_allocError();
    uint64_t v11 = v10;
    uint64_t v12 = v10 + 64;
    *(void *)(v10 + 24) = &type metadata for HostToShellMessage.Key;
    *(unsigned char *)uint64_t v10 = v2;
    *(void *)(v10 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F00);
    *(void *)(v11 + 32) = v8;
    sub_23996BC88((uint64_t)v16, v12);
    *(unsigned char *)(v11 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
}

uint64_t sub_239977160(char a1, uint64_t a2)
{
  char v2 = a1 & 1;
  if (a1) {
    uint64_t v3 = 0xE600000000000000;
  }
  else {
    uint64_t v3 = 0xE500000000000000;
  }
  if (!*(void *)(a2 + 16)
    || ((a1 & 1) != 0 ? (uint64_t v5 = 0x746867696568) : (uint64_t v5 = 0x6874646977), v6 = sub_239977F5C(v5, v3), (v7 & 1) == 0))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_23996BC88(*(void *)(a2 + 56) + 32 * v6, (uint64_t)&v14);
  swift_bridgeObjectRelease();
  if (!*((void *)&v15 + 1))
  {
LABEL_13:
    sub_239979C44((uint64_t)&v14);
    return 0;
  }
  sub_23996BBE8(&v14, v16);
  sub_23996BC88((uint64_t)v16, (uint64_t)&v14);
  uint64_t v8 = MEMORY[0x263F8EF38];
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return v13;
  }
  else
  {
    sub_239978DB4();
    swift_allocError();
    uint64_t v11 = v10;
    uint64_t v12 = v10 + 64;
    *(void *)(v10 + 24) = &_s3KeyON;
    *(unsigned char *)uint64_t v10 = v2;
    *(void *)(v10 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F30);
    *(void *)(v11 + 32) = v8;
    sub_23996BC88((uint64_t)v16, v12);
    *(unsigned char *)(v11 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
}

uint64_t sub_2399772F4(char a1, uint64_t a2)
{
  char v2 = a1 & 1;
  if (a1) {
    uint64_t v3 = 0x8000000239982F10;
  }
  else {
    uint64_t v3 = 0xED0000657A695364;
  }
  if (!*(void *)(a2 + 16)
    || ((a1 & 1) != 0 ? (uint64_t v5 = 0xD000000000000014) : (uint64_t v5 = 0x6572726566657270),
        unint64_t v6 = sub_239977F5C(v5, v3),
        (v7 & 1) == 0))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_23996BC88(*(void *)(a2 + 56) + 32 * v6, (uint64_t)&v14);
  swift_bridgeObjectRelease();
  if (!*((void *)&v15 + 1))
  {
LABEL_13:
    sub_239979C44((uint64_t)&v14);
    return 0;
  }
  sub_23996BBE8(&v14, v16);
  sub_23996BC88((uint64_t)v16, (uint64_t)&v14);
  uint64_t v8 = MEMORY[0x263F8D310];
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return v13;
  }
  else
  {
    sub_239978DB4();
    swift_allocError();
    uint64_t v11 = v10;
    uint64_t v12 = v10 + 64;
    *(void *)(v10 + 24) = &type metadata for PreviewPreferences.Key;
    *(unsigned char *)uint64_t v10 = v2;
    *(void *)(v10 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B50);
    *(void *)(v11 + 32) = v8;
    sub_23996BC88((uint64_t)v16, v12);
    *(unsigned char *)(v11 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
}

uint64_t sub_239977498(char a1, uint64_t a2)
{
  char v2 = a1 & 1;
  if (a1) {
    uint64_t v3 = 0x8000000239982F10;
  }
  else {
    uint64_t v3 = 0xED0000657A695364;
  }
  if (!*(void *)(a2 + 16)
    || ((a1 & 1) != 0 ? (uint64_t v5 = 0xD000000000000014) : (uint64_t v5 = 0x6572726566657270),
        unint64_t v6 = sub_239977F5C(v5, v3),
        (v7 & 1) == 0))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_23996BC88(*(void *)(a2 + 56) + 32 * v6, (uint64_t)&v13);
  swift_bridgeObjectRelease();
  if (!*((void *)&v14 + 1))
  {
LABEL_13:
    sub_239979C44((uint64_t)&v13);
    return 0;
  }
  sub_23996BBE8(&v13, v15);
  sub_23996BC88((uint64_t)v15, (uint64_t)&v13);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F08);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    return v16;
  }
  else
  {
    sub_239978DB4();
    swift_allocError();
    uint64_t v11 = v10;
    uint64_t v12 = v10 + 64;
    *(void *)(v10 + 24) = &type metadata for PreviewPreferences.Key;
    *(unsigned char *)uint64_t v10 = v2;
    *(void *)(v10 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F10);
    *(void *)(v11 + 32) = v8;
    sub_23996BC88((uint64_t)v15, v12);
    *(unsigned char *)(v11 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  }
}

uint64_t sub_239977640(char a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)
    || (unint64_t v4 = sub_239977F5C(*(void *)&aPreferenseed[8 * a1], *(void *)&aCes[8 * a1]), (v5 & 1) == 0))
  {
    long long v12 = 0u;
    long long v13 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_23996BC88(*(void *)(a2 + 56) + 32 * v4, (uint64_t)&v12);
  swift_bridgeObjectRelease();
  if (!*((void *)&v13 + 1))
  {
LABEL_7:
    sub_239979C44((uint64_t)&v12);
    return 0;
  }
  sub_23996BBE8(&v12, v14);
  sub_23996BC88((uint64_t)v14, (uint64_t)&v12);
  uint64_t v6 = MEMORY[0x263F8D310];
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    return v11;
  }
  else
  {
    sub_239978DB4();
    swift_allocError();
    uint64_t v9 = v8;
    uint64_t v10 = v8 + 64;
    *(void *)(v8 + 24) = &type metadata for ShellToHostMessage.Key;
    *(unsigned char *)uint64_t v8 = a1;
    *(void *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B50);
    *(void *)(v9 + 32) = v6;
    sub_23996BC88((uint64_t)v14, v10);
    *(unsigned char *)(v9 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
}

unint64_t sub_2399777BC(char a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)
    || (unint64_t v4 = sub_239977F5C(*(void *)&aPreferenseed[8 * a1], *(void *)&aCes[8 * a1]), (v5 & 1) == 0))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_23996BC88(*(void *)(a2 + 56) + 32 * v4, (uint64_t)&v13);
  swift_bridgeObjectRelease();
  if (!*((void *)&v14 + 1))
  {
LABEL_7:
    sub_239979C44((uint64_t)&v13);
    uint64_t v7 = 0;
    unsigned __int8 v8 = 1;
    goto LABEL_8;
  }
  sub_23996BBE8(&v13, v15);
  sub_23996BC88((uint64_t)v15, (uint64_t)&v13);
  uint64_t v6 = MEMORY[0x263F8E548];
  if (swift_dynamicCast())
  {
    unsigned __int8 v17 = 0;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    uint64_t v7 = v16;
    unsigned __int8 v8 = v17;
LABEL_8:
    LOBYTE(v15[0]) = v8;
    return v7 | ((unint64_t)v8 << 32);
  }
  sub_239978DB4();
  swift_allocError();
  uint64_t v11 = v10;
  uint64_t v12 = v10 + 64;
  *(void *)(v10 + 24) = &type metadata for ShellToHostMessage.Key;
  *(unsigned char *)uint64_t v10 = a1;
  *(void *)(v10 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F18);
  *(void *)(v11 + 32) = v6;
  sub_23996BC88((uint64_t)v15, v12);
  *(unsigned char *)(v11 + 96) = 1;
  swift_willThrow();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
}

uint64_t sub_23997794C(char a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)
    || (unint64_t v4 = sub_239977F5C(*(void *)&aPreferenseed[8 * a1], *(void *)&aCes[8 * a1]), (v5 & 1) == 0))
  {
    long long v12 = 0u;
    long long v13 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_23996BC88(*(void *)(a2 + 56) + 32 * v4, (uint64_t)&v12);
  swift_bridgeObjectRelease();
  if (!*((void *)&v13 + 1))
  {
LABEL_7:
    sub_239979C44((uint64_t)&v12);
    return 0;
  }
  sub_23996BBE8(&v12, v14);
  sub_23996BC88((uint64_t)v14, (uint64_t)&v12);
  uint64_t v6 = MEMORY[0x263F8D6C8];
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    return v11;
  }
  else
  {
    sub_239978DB4();
    swift_allocError();
    uint64_t v9 = v8;
    uint64_t v10 = v8 + 64;
    *(void *)(v8 + 24) = &type metadata for ShellToHostMessage.Key;
    *(unsigned char *)uint64_t v8 = a1;
    *(void *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F00);
    *(void *)(v9 + 32) = v6;
    sub_23996BC88((uint64_t)v14, v10);
    *(unsigned char *)(v9 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
}

uint64_t sub_239977AD0(char a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)
    || (unint64_t v4 = sub_239977F5C(*(void *)&aPreferenseed[8 * a1], *(void *)&aCes[8 * a1]), (v5 & 1) == 0))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_23996BC88(*(void *)(a2 + 56) + 32 * v4, (uint64_t)&v11);
  swift_bridgeObjectRelease();
  if (!*((void *)&v12 + 1))
  {
LABEL_7:
    sub_239979C44((uint64_t)&v11);
    return 0;
  }
  sub_23996BBE8(&v11, v13);
  sub_23996BC88((uint64_t)v13, (uint64_t)&v11);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F08);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    return v14;
  }
  else
  {
    sub_239978DB4();
    swift_allocError();
    uint64_t v9 = v8;
    uint64_t v10 = v8 + 64;
    *(void *)(v8 + 24) = &type metadata for ShellToHostMessage.Key;
    *(unsigned char *)uint64_t v8 = a1;
    *(void *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F10);
    *(void *)(v9 + 32) = v6;
    sub_23996BC88((uint64_t)v13, v10);
    *(unsigned char *)(v9 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
}

uint64_t sub_239977C50@<X0>(char a1@<W0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  char v5 = a1 & 1;
  uint64_t result = sub_2399772F4(a1 & 1, a2);
  if (!v3)
  {
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = result;
      swift_bridgeObjectRetain();
      v10._countAndFlagsBits = v9;
      v10._object = v8;
      PreviewPreferences.InterfaceOrientation.init(rawValue:)(v10);
      if (v14 == 4)
      {
        sub_239978DB4();
        swift_allocError();
        uint64_t v12 = v11;
        *(void *)(v11 + 24) = &type metadata for PreviewPreferences.Key;
        *(unsigned char *)uint64_t v11 = v5;
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F38);
        *(void *)(v12 + 32) = &type metadata for PreviewPreferences.InterfaceOrientation;
        *(void *)(v12 + 88) = MEMORY[0x263F8D310];
        *(void *)(v12 + 56) = v13;
        *(void *)(v12 + 64) = v9;
        *(void *)(v12 + 72) = v8;
        *(unsigned char *)(v12 + 96) = 2;
        return swift_willThrow();
      }
      else
      {
        uint64_t result = swift_bridgeObjectRelease();
        *a3 = v14;
      }
    }
    else
    {
      *a3 = 4;
    }
  }
  return result;
}

uint64_t sub_239977D60@<X0>(char a1@<W0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_239977640(a1, a2);
  if (!v3)
  {
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = result;
      swift_bridgeObjectRetain();
      v10._countAndFlagsBits = v9;
      v10._object = v8;
      SuppressedPresentation.init(rawValue:)(v10);
      if (v14 == 11)
      {
        sub_239978DB4();
        swift_allocError();
        uint64_t v12 = v11;
        *(void *)(v11 + 24) = &type metadata for ShellToHostMessage.Key;
        *(unsigned char *)uint64_t v11 = a1;
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F20);
        *(void *)(v12 + 32) = &type metadata for SuppressedPresentation;
        *(void *)(v12 + 88) = MEMORY[0x263F8D310];
        *(void *)(v12 + 56) = v13;
        *(void *)(v12 + 64) = v9;
        *(void *)(v12 + 72) = v8;
        *(unsigned char *)(v12 + 96) = 2;
        return swift_willThrow();
      }
      else
      {
        uint64_t result = swift_bridgeObjectRelease();
        *a3 = v14;
      }
    }
    else
    {
      *a3 = 11;
    }
  }
  return result;
}

double sub_239977E6C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_239977F5C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2399792D0();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_23996BBE8((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), v14);
    sub_2399788C8(v8, v11);
    uint64_t *v4 = v11;
    swift_bridgeObjectRelease();
    sub_23996BBE8(v14, a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

unint64_t sub_239977F5C(uint64_t a1, uint64_t a2)
{
  sub_2399800E0();
  sub_23997FE60();
  uint64_t v4 = sub_239980110();

  return sub_239979150(a1, a2, v4);
}

unint64_t sub_239977FD4(uint64_t a1)
{
  sub_2399800E0();
  sub_239980100();
  uint64_t v2 = sub_239980110();

  return sub_239979234(a1, v2);
}

uint64_t sub_239978040(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B78);
  char v35 = a2;
  uint64_t v6 = sub_23997FFE0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    char v9 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v15 << 6);
      }
      else
      {
        if (__OFADD__(v15++, 1)) {
          goto LABEL_39;
        }
        if (v15 >= v12)
        {
LABEL_32:
          swift_release();
          uint64_t v3 = v2;
          if (v35)
          {
            uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
            if (v34 >= 64) {
              bzero((void *)(v5 + 64), ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            }
            else {
              *char v9 = -1 << v34;
            }
            *(void *)(v5 + 16) = 0;
          }
          break;
        }
        unint64_t v21 = v9[v15];
        if (!v21)
        {
          int64_t v22 = v15 + 1;
          if (v15 + 1 >= v12) {
            goto LABEL_32;
          }
          unint64_t v21 = v9[v22];
          if (!v21)
          {
            while (1)
            {
              int64_t v15 = v22 + 1;
              if (__OFADD__(v22, 1)) {
                break;
              }
              if (v15 >= v12) {
                goto LABEL_32;
              }
              unint64_t v21 = v9[v15];
              ++v22;
              if (v21) {
                goto LABEL_19;
              }
            }
LABEL_38:
            __break(1u);
LABEL_39:
            __break(1u);
            return result;
          }
          ++v15;
        }
LABEL_19:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v15 << 6);
      }
      uint64_t v23 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v19);
      uint64_t v25 = *v23;
      uint64_t v24 = v23[1];
      os_log_type_t v26 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v19);
      if (v35)
      {
        sub_23996BBE8(v26, v36);
      }
      else
      {
        sub_23996BC88((uint64_t)v26, (uint64_t)v36);
        swift_bridgeObjectRetain();
      }
      sub_2399800E0();
      sub_23997FE60();
      uint64_t result = sub_239980110();
      uint64_t v27 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v13 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v13 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v13 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      unsigned __int8 v17 = (void *)(*(void *)(v7 + 48) + 16 * v16);
      *unsigned __int8 v17 = v25;
      v17[1] = v24;
      uint64_t result = (uint64_t)sub_23996BBE8(v36, (_OWORD *)(*(void *)(v7 + 56) + 32 * v16));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_239978328(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v31 = a2;
  uint64_t result = sub_23997FFE0();
  uint64_t v8 = result;
  if (*(void *)(v6 + 16))
  {
    int64_t v9 = 0;
    uint64_t v10 = (void *)(v6 + 64);
    uint64_t v11 = 1 << *(unsigned char *)(v6 + 32);
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = v12 & *(void *)(v6 + 64);
    int64_t v14 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v15 = result + 64;
    while (1)
    {
      if (v13)
      {
        unint64_t v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v21 = v20 | (v9 << 6);
      }
      else
      {
        if (__OFADD__(v9++, 1)) {
          goto LABEL_40;
        }
        if (v9 >= v14)
        {
LABEL_31:
          if ((v31 & 1) == 0)
          {
            uint64_t result = swift_release();
            uint64_t v4 = v3;
            goto LABEL_38;
          }
          uint64_t v30 = 1 << *(unsigned char *)(v6 + 32);
          if (v30 >= 64) {
            bzero((void *)(v6 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          }
          else {
            *uint64_t v10 = -1 << v30;
          }
          uint64_t v4 = v3;
          *(void *)(v6 + 16) = 0;
          break;
        }
        unint64_t v23 = v10[v9];
        if (!v23)
        {
          int64_t v24 = v9 + 1;
          if (v9 + 1 >= v14) {
            goto LABEL_31;
          }
          unint64_t v23 = v10[v24];
          if (!v23)
          {
            while (1)
            {
              int64_t v9 = v24 + 1;
              if (__OFADD__(v24, 1)) {
                break;
              }
              if (v9 >= v14) {
                goto LABEL_31;
              }
              unint64_t v23 = v10[v9];
              ++v24;
              if (v23) {
                goto LABEL_20;
              }
            }
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
            return result;
          }
          ++v9;
        }
LABEL_20:
        unint64_t v13 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }
      uint64_t v25 = *(void *)(*(void *)(v6 + 48) + 8 * v21);
      long long v32 = *(_OWORD *)(*(void *)(v6 + 56) + 16 * v21);
      if ((v31 & 1) == 0) {
        swift_retain();
      }
      sub_2399800E0();
      sub_239980100();
      uint64_t result = sub_239980110();
      uint64_t v16 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v15 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v15 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v18 == v27;
          if (v18 == v27) {
            unint64_t v18 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v15 + 8 * v18);
        }
        while (v29 == -1);
        unint64_t v19 = __clz(__rbit64(~v29)) + (v18 << 6);
      }
      *(void *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(void *)(*(void *)(v8 + 48) + 8 * v19) = v25;
      *(_OWORD *)(*(void *)(v8 + 56) + 16 * v19) = v32;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  uint64_t *v4 = v8;
  return result;
}

uint64_t sub_2399785F0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F40);
  uint64_t result = sub_23997FFE0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v29 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v12) {
          goto LABEL_33;
        }
        unint64_t v21 = v29[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v12) {
            goto LABEL_33;
          }
          unint64_t v21 = v29[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v12)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v28 = 1 << *(unsigned char *)(v5 + 32);
              if (v28 >= 64) {
                bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v29 = -1 << v28;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v29[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v12) {
                  goto LABEL_33;
                }
                unint64_t v21 = v29[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
      long long v30 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v19);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      sub_2399800E0();
      sub_239980100();
      uint64_t result = sub_239980110();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v16 == v24;
          if (v16 == v24) {
            unint64_t v16 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        unint64_t v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(void *)(*(void *)(v7 + 48) + 8 * v17) = v27;
      *(_OWORD *)(*(void *)(v7 + 56) + 16 * v17) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_2399788C8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_23997FF60();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2399800E0();
        swift_bridgeObjectRetain();
        sub_23997FE60();
        uint64_t v10 = sub_239980110();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            _OWORD *v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  uint64_t *v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_239978AA4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_23997FF60();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2399800E0();
        sub_239980100();
        uint64_t result = sub_239980110();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          unint64_t v11 = (void *)(v10 + 8 * v3);
          uint64_t v12 = (void *)(v10 + 8 * v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            void *v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *uint64_t v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *unint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_239978C60(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_239977F5C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2399792D0();
      goto LABEL_7;
    }
    sub_239978040(v15, a4 & 1);
    unint64_t v21 = sub_239977F5C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_239980070();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_23996BBE8(a1, v19);
  }
LABEL_13:
  sub_2399790E4(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

unint64_t sub_239978DB4()
{
  unint64_t result = qword_268A06ED8;
  if (!qword_268A06ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06ED8);
  }
  return result;
}

uint64_t sub_239978E08(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_239978E20(a1, a2, a3, a4, &qword_268A06F58);
}

uint64_t sub_239978E14(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_239978E20(a1, a2, a3, a4, &qword_268A06F50);
}

uint64_t sub_239978E20(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_239977FD4(a3);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 < result || (a4 & 1) == 0)
  {
    if (v19 < result || (a4 & 1) != 0)
    {
      sub_239978328(result, a4 & 1, a5);
      uint64_t result = sub_239977FD4(a3);
      if ((v18 & 1) != (v22 & 1))
      {
LABEL_17:
        uint64_t result = sub_239980070();
        __break(1u);
        return result;
      }
      unint64_t v14 = result;
      BOOL v20 = (void *)*v7;
      if (v18) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    uint64_t result = (uint64_t)sub_2399794C4(a5);
  }
  BOOL v20 = (void *)*v7;
  if ((v18 & 1) == 0)
  {
LABEL_13:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    *(void *)(v20[6] + 8 * v14) = a3;
    uint64_t v23 = (void *)(v20[7] + 16 * v14);
    *uint64_t v23 = a1;
    v23[1] = a2;
    uint64_t v24 = v20[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (!v25)
    {
      v20[2] = v26;
      return result;
    }
    goto LABEL_16;
  }
LABEL_8:
  unint64_t v21 = (void *)(v20[7] + 16 * v14);
  *unint64_t v21 = a1;
  v21[1] = a2;

  return swift_release();
}

uint64_t sub_239978F98(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_239978E20(a1, a2, a3, a4, &qword_268A06F48);
}

uint64_t sub_239978FA4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_239977FD4(a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_239979650();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = (void *)(v18[7] + 16 * v12);
      uint64_t result = swift_release();
      void *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(void *)(v18[6] + 8 * v12) = a3;
    unint64_t v21 = (void *)(v18[7] + 16 * v12);
    *unint64_t v21 = a1;
    v21[1] = a2;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_2399785F0(result, a4 & 1);
  uint64_t result = sub_239977FD4(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    char v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_239980070();
  __break(1u);
  return result;
}

_OWORD *sub_2399790E4(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_23996BBE8(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_239979150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_239980050() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_239980050() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_239979234(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void *sub_2399792D0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B78);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23997FFD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_26:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v25 = v1;
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1)) {
      goto LABEL_28;
    }
    if (v9 >= v13)
    {
LABEL_24:
      unint64_t result = (void *)swift_release();
      uint64_t v1 = v25;
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_23996BC88(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_23996BBE8(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2399794A0()
{
  return sub_2399794C4(&qword_268A06F58);
}

void *sub_2399794AC()
{
  return sub_2399794C4(&qword_268A06F50);
}

void *sub_2399794B8()
{
  return sub_2399794C4(&qword_268A06F48);
}

void *sub_2399794C4(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_23997FFD0();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_24:
    unint64_t result = (void *)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  unint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    unint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v10++, 1)) {
      goto LABEL_26;
    }
    if (v10 >= v14) {
      goto LABEL_24;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v10);
    if (!v22) {
      break;
    }
LABEL_23:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void *)(*(void *)(v3 + 48) + 8 * v16);
    uint64_t v19 = 16 * v16;
    long long v20 = *(_OWORD *)(*(void *)(v3 + 56) + v19);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    *(_OWORD *)(*(void *)(v5 + 56) + v19) = v20;
    unint64_t result = (void *)swift_retain();
  }
  int64_t v23 = v10 + 1;
  if (v10 + 1 >= v14) {
    goto LABEL_24;
  }
  unint64_t v22 = *(void *)(v7 + 8 * v23);
  if (v22)
  {
    ++v10;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_24;
    }
    unint64_t v22 = *(void *)(v7 + 8 * v10);
    ++v23;
    if (v22) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_239979650()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F40);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23997FFD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    long long v19 = *(_OWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v18) = v19;
    unint64_t result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_2399797FC()
{
  unint64_t result = qword_268A06EE8;
  if (!qword_268A06EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06EE8);
  }
  return result;
}

unint64_t sub_239979854()
{
  unint64_t result = qword_268A06EF0;
  if (!qword_268A06EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06EF0);
  }
  return result;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewPreferences(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 18)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 17);
  BOOL v4 = v3 >= 4;
  int v5 = v3 - 4;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewPreferences(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 17) = a2 + 3;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewPreferences()
{
  return &type metadata for PreviewPreferences;
}

uint64_t getEnumTagSinglePayload for PreviewPreferences.InterfaceOrientation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PreviewPreferences.InterfaceOrientation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x239979AB0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewPreferences.InterfaceOrientation()
{
  return &type metadata for PreviewPreferences.InterfaceOrientation;
}

unsigned char *storeEnumTagSinglePayload for PreviewPreferences.Key(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x239979BB4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewPreferences.Key()
{
  return &type metadata for PreviewPreferences.Key;
}

unint64_t sub_239979BF0()
{
  unint64_t result = qword_268A06EF8;
  if (!qword_268A06EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06EF8);
  }
  return result;
}

uint64_t sub_239979C44(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_239979CA4(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x746867696568;
  }
  else {
    uint64_t v3 = 0x6874646977;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x746867696568;
  }
  else {
    uint64_t v5 = 0x6874646977;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_239980050();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_239979D40(char a1, char a2)
{
  if (*(void *)&aColorpicfontpi[8 * a1] == *(void *)&aColorpicfontpi[8 * a2]
    && *(void *)&aKer[8 * a1] == *(void *)&aKer[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_239980050();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_239979DC8(char a1, char a2)
{
  if (*(void *)&aPreferenseed_0[8 * a1] == *(void *)&aPreferenseed_0[8 * a2]
    && *(void *)&aCes_0[8 * a1] == *(void *)&aCes_0[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_239980050();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_239979E50(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000014;
  }
  else {
    unint64_t v3 = 0x6572726566657270;
  }
  if (v2) {
    unint64_t v4 = 0xED0000657A695364;
  }
  else {
    unint64_t v4 = 0x8000000239982F10;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000014;
  }
  else {
    unint64_t v5 = 0x6572726566657270;
  }
  if (a2) {
    unint64_t v6 = 0x8000000239982F10;
  }
  else {
    unint64_t v6 = 0xED0000657A695364;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_239980050();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_239979F04(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x8000000239982DD0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v3 = 0xED00007466654C65;
      goto LABEL_5;
    case 3:
      unint64_t v3 = 0xEE00746867695265;
LABEL_5:
      unint64_t v5 = 0x70616373646E616CLL;
      break;
    default:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x7469617274726F70;
      break;
  }
  unint64_t v6 = 0x8000000239982DD0;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      unint64_t v6 = 0xED00007466654C65;
      goto LABEL_10;
    case 3:
      unint64_t v6 = 0xEE00746867695265;
LABEL_10:
      unint64_t v2 = 0x70616373646E616CLL;
      break;
    default:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v2 = 0x7469617274726F70;
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_239980050();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_23997A08C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x746144746E657665;
  }
  else {
    uint64_t v3 = 1684366707;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE900000000000061;
  }
  if (a2) {
    uint64_t v5 = 0x746144746E657665;
  }
  else {
    uint64_t v5 = 1684366707;
  }
  if (a2) {
    unint64_t v6 = 0xE900000000000061;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_239980050();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_23997A12C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x636E797361;
  }
  else {
    uint64_t v3 = 0x6465636E6566;
  }
  if (v2) {
    unint64_t v4 = 0xE600000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x636E797361;
  }
  else {
    uint64_t v5 = 0x6465636E6566;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE600000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_239980050();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_23997A1C8()
{
  return sub_239980110();
}

uint64_t sub_23997A244()
{
  return sub_239980110();
}

uint64_t sub_23997A32C()
{
  return sub_239980110();
}

uint64_t sub_23997A3C0()
{
  return sub_239980110();
}

uint64_t sub_23997A440()
{
  return sub_239980110();
}

uint64_t sub_23997A4AC()
{
  return sub_239980110();
}

uint64_t sub_23997A528()
{
  sub_23997FE60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23997A58C()
{
  sub_23997FE60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23997A5E0()
{
  sub_23997FE60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23997A634()
{
  sub_23997FE60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23997A6B0()
{
  sub_23997FE60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23997A784()
{
  sub_23997FE60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23997A7EC()
{
  sub_23997FE60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23997A850()
{
  return sub_239980110();
}

uint64_t sub_23997A8C8()
{
  return sub_239980110();
}

uint64_t sub_23997A944()
{
  return sub_239980110();
}

uint64_t sub_23997AA28()
{
  return sub_239980110();
}

uint64_t sub_23997AAB8()
{
  return sub_239980110();
}

uint64_t sub_23997AB20()
{
  return sub_239980110();
}

uint64_t sub_23997AB98()
{
  sub_239969F28(v0, (uint64_t)v3);
  ShellToHostMessage.payloadDescription.getter();
  if (v1)
  {
    v4[0] = 40;
    v4[1] = 0xE100000000000000;
    sub_23997FE70();
    sub_23997FE70();
    swift_bridgeObjectRelease();
  }
  sub_239969F28(v0, (uint64_t)v4);
  sub_23997FE70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23997FE70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 46;
}

uint64_t sub_23997AD9C()
{
  HostToShellMessage.payloadDescription.getter();
  if (v0)
  {
    sub_23997FE70();
    sub_23997FE70();
    swift_bridgeObjectRelease();
  }
  sub_23997FE70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23997FE70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 46;
}

uint64_t sub_23997AED0(char a1, char a2)
{
  uint64_t v2 = 8 * a2;
  uint64_t v3 = *(void *)&aPreferenseed_0[v2];
  uint64_t v4 = *(void *)&aCes_0[v2];
  if (a1 == 11)
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  else
  {
    *((void *)&v10 + 1) = MEMORY[0x263F8D310];
    uint64_t v5 = 8 * a1;
    uint64_t v6 = *(void *)&aColorpicfontpi[v5];
    uint64_t v7 = *(void *)&aKer[v5];
    *(void *)&long long v9 = v6;
    *((void *)&v9 + 1) = v7;
  }
  return sub_239976D74((uint64_t)&v9, v3, v4);
}

void sub_23997AF54(unsigned char *a1@<X8>)
{
  *a1 = 0x10200u >> (8 * *(unsigned char *)(v1 + 16));
}

uint64_t HostToShellMessage.messageType.getter()
{
  return 0x10200u >> (8 * *(unsigned char *)(v0 + 16));
}

void *sub_23997AF88()
{
  if (*(unsigned char *)(v0 + 16)) {
    return 0;
  }
  uint64_t v1 = *(void **)(v0 + 8);
  id v2 = v1;
  return v1;
}

void *HostToShellMessage.fenceHandle.getter()
{
  if (*(unsigned char *)(v0 + 16)) {
    return 0;
  }
  uint64_t v1 = *(void **)(v0 + 8);
  id v2 = v1;
  return v1;
}

uint64_t HostToShellMessage.payload.getter()
{
  uint64_t v1 = *(void **)v0;
  if (*(unsigned char *)(v0 + 16))
  {
    if (*(unsigned char *)(v0 + 16) == 1)
    {
      uint64_t v2 = *(void *)(v0 + 8);
      id v3 = objc_msgSend(v1, sel_data);
      uint64_t v4 = sub_23997FD20();
      uint64_t v6 = v5;

      uint64_t v14 = MEMORY[0x263F06F78];
      *(void *)&long long v13 = v4;
      *((void *)&v13 + 1) = v6;
      sub_23996BBE8(&v13, v12);
      uint64_t v7 = MEMORY[0x263F8EE80];
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_239978C60(v12, 0x746144746E657665, 0xE900000000000061, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      sub_2399698E0((uint64_t)v1, v2, 1);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v14 = MEMORY[0x263F8D6C8];
    *(void *)&long long v13 = v1;
    sub_23996BBE8(&v13, v12);
    uint64_t v9 = MEMORY[0x263F8EE80];
    char v10 = swift_isUniquelyReferenced_nonNull_native();
    sub_239978C60(v12, 1684366707, 0xE400000000000000, v10);
    uint64_t v7 = v9;
    swift_bridgeObjectRelease();
  }
  return v7;
}

void sub_23997B150(char *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
}

void HostToShellMessage.init(messageType:fenceHandle:payload:)(char a1@<W0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = a2;
  if (!a1)
  {
    uint64_t v8 = sub_239976FC8(0, a3);
    if (v4)
    {
LABEL_18:
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = v8;
      swift_bridgeObjectRelease();
      char v11 = 0;
LABEL_11:
      *(void *)a4 = v10;
      *(void *)(a4 + 8) = v5;
      *(unsigned char *)(a4 + 16) = v11;
      return;
    }
    sub_239978DB4();
    swift_allocError();
    uint64_t v17 = v16;
    *(void *)(v16 + 24) = &type metadata for HostToShellMessage.Key;
    *(unsigned char *)uint64_t v16 = 0;
    *(void *)(v16 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F00);
    *(void *)(v17 + 32) = MEMORY[0x263F8D6C8];
    *(unsigned char *)(v17 + 96) = 0;
LABEL_17:
    swift_willThrow();
    goto LABEL_18;
  }
  if (a1 != 1)
  {
    if (!a2)
    {
      sub_239976E30(1, a3, &v20);
      if (!v4)
      {
        unint64_t v13 = *((void *)&v20 + 1);
        if (*((void *)&v20 + 1) >> 60 != 15)
        {
          uint64_t v18 = v20;
          swift_bridgeObjectRelease();
          id v19 = objc_allocWithZone((Class)UVHardwareEvent);
          uint64_t v10 = (uint64_t)sub_23997C8EC();
          sub_23997C9AC(v18, v13);
          uint64_t v5 = 0;
          char v11 = 1;
          goto LABEL_11;
        }
        sub_239978DB4();
        swift_allocError();
        uint64_t v15 = v14;
        *(void *)(v14 + 24) = &type metadata for HostToShellMessage.Key;
        *(unsigned char *)uint64_t v14 = 1;
        *(void *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F28);
        *(void *)(v15 + 32) = MEMORY[0x263F06F78];
        *(unsigned char *)(v15 + 96) = 0;
        swift_willThrow();
      }
      swift_bridgeObjectRelease();
      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F60);
    sub_23997CA18(&qword_268A06F68, &qword_268A06F60);
    swift_allocError();
    _WORD *v12 = 258;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  if (!v5)
  {
    uint64_t v10 = 0;
    char v11 = 2;
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F60);
  sub_23997CA18(&qword_268A06F68, &qword_268A06F60);
  swift_allocError();
  *uint64_t v7 = 257;
  swift_willThrow();
LABEL_19:
}

unint64_t HostToShellMessage.payloadDescription.getter()
{
  uint64_t v1 = *(void **)v0;
  if (!*(unsigned char *)(v0 + 16))
  {
    unint64_t v6 = 0;
    sub_23997FE70();
    sub_239980020();
    sub_23997FE70();
    swift_bridgeObjectRelease();
    return v6;
  }
  if (*(unsigned char *)(v0 + 16) == 1)
  {
    uint64_t v2 = *(void *)(v0 + 8);
    id v3 = v1;
    sub_23997FF70();
    swift_bridgeObjectRelease();
    unint64_t v6 = 0xD000000000000010;
    id v4 = objc_msgSend(v3, sel_description);
    sub_23997FE30();

    sub_23997FE70();
    swift_bridgeObjectRelease();
    sub_2399698E0((uint64_t)v1, v2, 1);
    return v6;
  }
  return 0;
}

uint64_t sub_23997B554()
{
  return sub_23997AD9C();
}

void sub_23997B560(char *a1@<X8>)
{
  uint64_t v2 = *v1;
  char v3 = *((unsigned char *)v1 + 40);
  switch(v3)
  {
    case 1:
      *a1 = 1;
      break;
    case 2:
      *a1 = 3;
      break;
    case 3:
      char v3 = 6;
      goto LABEL_5;
    case 4:
      uint64_t v5 = v1[1];
      uint64_t v4 = v1[2];
      uint64_t v6 = v1[3] | v1[4];
      uint64_t v7 = v6 | v2 | v4 | v5;
      if (v6 | v4 | v5) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = v2 == 1;
      }
      if (v8) {
        char v9 = 4;
      }
      else {
        char v9 = 5;
      }
      if (!v7) {
        char v9 = 2;
      }
      *a1 = v9;
      break;
    default:
LABEL_5:
      *a1 = v3;
      break;
  }
}

uint64_t ShellToHostMessage.messageType.getter()
{
  uint64_t v1 = *v0;
  uint64_t result = *((unsigned __int8 *)v0 + 40);
  switch(*((unsigned char *)v0 + 40))
  {
    case 1:
      uint64_t result = 1;
      break;
    case 2:
      uint64_t result = 3;
      break;
    case 3:
      uint64_t result = 6;
      break;
    case 4:
      uint64_t v4 = v0[1];
      uint64_t v3 = v0[2];
      uint64_t v5 = v0[3] | v0[4];
      uint64_t v6 = v5 | v1 | v3 | v4;
      if (v5 | v3 | v4) {
        BOOL v7 = 0;
      }
      else {
        BOOL v7 = v1 == 1;
      }
      if (v7) {
        unsigned int v8 = 4;
      }
      else {
        unsigned int v8 = 5;
      }
      if (v6) {
        uint64_t result = v8;
      }
      else {
        uint64_t result = 2;
      }
      break;
    default:
      return result;
  }
  return result;
}

void *sub_23997B6A0()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = *(void **)(v0 + 32);
  uint64_t result = 0;
  switch(*(unsigned char *)(v0 + 40))
  {
    case 1:
      id v5 = v1;
      uint64_t result = v1;
      break;
    case 2:
    case 3:
      return result;
    case 4:
      uint64_t result = 0;
      break;
    default:
      id v4 = v2;
      uint64_t result = v2;
      break;
  }
  return result;
}

void *ShellToHostMessage.fenceHandle.getter()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = *(void **)(v0 + 32);
  uint64_t result = 0;
  switch(*(unsigned char *)(v0 + 40))
  {
    case 1:
      id v5 = v1;
      uint64_t result = v1;
      break;
    case 2:
    case 3:
      return result;
    case 4:
      uint64_t result = 0;
      break;
    default:
      id v4 = v2;
      uint64_t result = v2;
      break;
  }
  return result;
}

uint64_t ShellToHostMessage.payload.getter()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  switch(*(unsigned char *)(v0 + 40))
  {
    case 1:
      *(void *)&long long v11 = MEMORY[0x263F8EE80];
      sub_239976734(v1, v2, v3 & 0xFF01, 0);
      uint64_t v6 = v11;
      break;
    case 2:
      uint64_t v12 = MEMORY[0x263F8E548];
      LODWORD(v11) = v1;
      sub_23996BBE8(&v11, v10);
      uint64_t v6 = MEMORY[0x263F8EE80];
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_239978C60(v10, 6580592, 0xE300000000000000, isUniquelyReferenced_nonNull_native);
      goto LABEL_5;
    case 3:
      *(void *)&long long v11 = MEMORY[0x263F8EE80];
      sub_23997AED0(v1, 2);
      uint64_t v6 = v11;
      break;
    case 4:
      uint64_t v6 = 0;
      break;
    default:
      uint64_t v9 = MEMORY[0x263F8EE80];
      sub_239976734(v1, v2, v3 & 0xFF01, 0);
      uint64_t v12 = MEMORY[0x263F8D6C8];
      *(void *)&long long v11 = v4;
      sub_23996BBE8(&v11, v10);
      char v5 = swift_isUniquelyReferenced_nonNull_native();
      sub_239978C60(v10, 1684366707, 0xE400000000000000, v5);
      uint64_t v6 = v9;
LABEL_5:
      swift_bridgeObjectRelease();
      break;
  }
  return v6;
}

void sub_23997B960(char *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
}

void ShellToHostMessage.init(messageType:fenceHandle:payload:)(char a1@<W0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = a2;
  switch(a1)
  {
    case 1:
      if (a2)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F70);
        sub_23997CA18(&qword_268A06F78, &qword_268A06F70);
        swift_allocError();
        __int16 v14 = 257;
        goto LABEL_21;
      }
      uint64_t v17 = sub_239977AD0(0, a3);
      if (v4) {
        goto LABEL_43;
      }
      if (!v17) {
        goto LABEL_28;
      }
      PreviewPreferences.init(dictionaryValue:)((Swift::OpaquePointer)v17);
      if (v18) {
        goto LABEL_43;
      }
      if (HIBYTE(v37) << 8 == 1024)
      {
LABEL_28:
        sub_239978DB4();
        swift_allocError();
        uint64_t v20 = v19;
        *(void *)(v19 + 24) = &type metadata for ShellToHostMessage.Key;
        *(unsigned char *)uint64_t v19 = 0;
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F08);
        *(void *)(v20 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F10);
        *(void *)(v20 + 32) = v21;
        goto LABEL_42;
      }
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F70);
      sub_23997CA18(&qword_268A06F78, &qword_268A06F70);
      swift_allocError();
      *uint64_t v34 = 1;
      swift_willThrow();
      return;
    case 2:
      swift_bridgeObjectRelease();
      if (v6)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F70);
        sub_23997CA18(&qword_268A06F78, &qword_268A06F70);
        swift_allocError();
        __int16 v16 = 258;
        goto LABEL_18;
      }
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      long long v24 = 0uLL;
      goto LABEL_35;
    case 3:
      if (a2)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F70);
        sub_23997CA18(&qword_268A06F78, &qword_268A06F70);
        swift_allocError();
        __int16 v14 = 259;
        goto LABEL_21;
      }
      unint64_t v25 = sub_2399777BC(3, a3);
      if (v4) {
        goto LABEL_43;
      }
      unsigned int v26 = v25;
      if ((v25 & 0x100000000) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v22 = 0;
        uint64_t v23 = 0;
        uint64_t v6 = 0;
        long long v24 = v26;
        char v27 = 2;
        goto LABEL_36;
      }
      sub_239978DB4();
      swift_allocError();
      uint64_t v20 = v31;
      *(void *)(v31 + 24) = &type metadata for ShellToHostMessage.Key;
      *(unsigned char *)uint64_t v31 = 3;
      *(void *)(v31 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F18);
      uint64_t v30 = MEMORY[0x263F8E548];
      goto LABEL_41;
    case 4:
      swift_bridgeObjectRelease();
      if (v6)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F70);
        sub_23997CA18(&qword_268A06F78, &qword_268A06F70);
        swift_allocError();
        __int16 v16 = 260;
        goto LABEL_18;
      }
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      long long v24 = xmmword_2399820A0;
      goto LABEL_35;
    case 5:
      swift_bridgeObjectRelease();
      if (v6)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F70);
        sub_23997CA18(&qword_268A06F78, &qword_268A06F70);
        swift_allocError();
        __int16 v16 = 261;
LABEL_18:
        *uint64_t v15 = v16;
        swift_willThrow();

        return;
      }
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      long long v24 = xmmword_239982090;
LABEL_35:
      char v27 = 4;
      goto LABEL_36;
    case 6:
      if (!a2)
      {
        sub_239977D60(2, a3, &v36);
        if (v4)
        {
LABEL_43:
          swift_bridgeObjectRelease();
          return;
        }
        unint64_t v28 = v36;
        if (v36 == 11)
        {
          sub_239978DB4();
          swift_allocError();
          uint64_t v20 = v29;
          *(void *)(v29 + 24) = &type metadata for ShellToHostMessage.Key;
          *(unsigned char *)uint64_t v29 = 2;
          *(void *)(v29 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06B50);
          uint64_t v30 = MEMORY[0x263F8D310];
LABEL_41:
          *(void *)(v20 + 32) = v30;
LABEL_42:
          *(unsigned char *)(v20 + 96) = 0;
          swift_willThrow();
          goto LABEL_43;
        }
        swift_bridgeObjectRelease();
        uint64_t v22 = 0;
        uint64_t v23 = 0;
        uint64_t v6 = 0;
        long long v24 = v28;
        char v27 = 3;
LABEL_36:
        *(_OWORD *)a4 = v24;
        *(void *)(a4 + 16) = v22;
        *(void *)(a4 + 24) = v23;
        *(void *)(a4 + 32) = v6;
        *(unsigned char *)(a4 + 40) = v27;
        return;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F70);
      sub_23997CA18(&qword_268A06F78, &qword_268A06F70);
      swift_allocError();
      __int16 v14 = 262;
LABEL_21:
      __int16 *v13 = v14;
LABEL_22:
      swift_willThrow();
LABEL_23:
      swift_bridgeObjectRelease();

      return;
    default:
      uint64_t v8 = sub_239977AD0(0, a3);
      if (v4) {
        goto LABEL_23;
      }
      if (!v8) {
        goto LABEL_6;
      }
      PreviewPreferences.init(dictionaryValue:)((Swift::OpaquePointer)v8);
      if (v9) {
        goto LABEL_23;
      }
      if ((v37 & 0xFF00) == 0x400)
      {
LABEL_6:
        sub_239978DB4();
        swift_allocError();
        uint64_t v11 = v10;
        *(void *)(v10 + 24) = &type metadata for ShellToHostMessage.Key;
        *(unsigned char *)uint64_t v10 = 0;
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F08);
        *(void *)(v11 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F10);
        *(void *)(v11 + 32) = v12;
      }
      else
      {
        uint64_t v32 = sub_23997794C(1, a3);
        if ((v33 & 1) == 0)
        {
          uint64_t v23 = v32;
          swift_bridgeObjectRelease();
          char v27 = 0;
          uint64_t v22 = v37 & 0xFF01;
          long long v24 = v36;
          goto LABEL_36;
        }
        sub_239978DB4();
        swift_allocError();
        uint64_t v11 = v35;
        *(void *)(v35 + 24) = &type metadata for ShellToHostMessage.Key;
        *(unsigned char *)uint64_t v35 = 1;
        *(void *)(v35 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F00);
        *(void *)(v11 + 32) = MEMORY[0x263F8D6C8];
      }
      *(unsigned char *)(v11 + 96) = 0;
      goto LABEL_22;
  }
}

uint64_t ShellToHostMessage.payloadDescription.getter()
{
  uint64_t result = 0;
  switch(*(unsigned char *)(v0 + 40))
  {
    case 1:
      uint64_t v2 = 0x203A7366657270;
      PreviewPreferences.description.getter();
      goto LABEL_4;
    case 2:
      return result;
    case 3:
      sub_23997FF70();
      sub_23997FE70();
      sub_23997FFA0();
      uint64_t result = 0;
      break;
    case 4:
      uint64_t result = 0;
      break;
    default:
      sub_23997FF70();
      uint64_t v2 = 0;
      sub_23997FE70();
      PreviewPreferences.description.getter();
      sub_23997FE70();
      swift_bridgeObjectRelease();
      sub_23997FE70();
      sub_239980020();
LABEL_4:
      sub_23997FE70();
      swift_bridgeObjectRelease();
      uint64_t result = v2;
      break;
  }
  return result;
}

uint64_t sub_23997C1C4()
{
  sub_239969F28(v0, (uint64_t)&v2);
  return sub_23997AB98();
}

uint64_t HostToShellMessage.MessageType.rawValue.getter(char a1)
{
  uint64_t result = 0xD000000000000013;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD000000000000026;
    }
    else {
      return 0x6572617764726168;
    }
  }
  return result;
}

uint64_t sub_23997C26C(char a1)
{
  if (a1) {
    return 0x746144746E657665;
  }
  else {
    return 1684366707;
  }
}

uint64_t sub_23997C2A0(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  return sub_23997C520(a1, a2, a3, a4, (uint64_t (*)(uint64_t))HostToShellMessage.MessageType.rawValue.getter);
}

uint64_t sub_23997C2B8(uint64_t a1, uint64_t a2)
{
  return sub_23997C5D0(a1, a2, (void (*)(uint64_t))HostToShellMessage.MessageType.rawValue.getter);
}

uint64_t sub_23997C2D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23997C654(a1, a2, a3, (void (*)(void))HostToShellMessage.MessageType.rawValue.getter);
}

uint64_t sub_23997C2E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23997C6C4(a1, a2, a3, (void (*)(uint64_t))HostToShellMessage.MessageType.rawValue.getter);
}

uint64_t sub_23997C300@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s18PreviewsServicesUI18HostToShellMessageO0G4TypeO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_23997C330@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HostToShellMessage.MessageType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23997C35C(char *a1, char *a2)
{
  return sub_23997A08C(*a1, *a2);
}

uint64_t sub_23997C368()
{
  return sub_23997A3C0();
}

uint64_t sub_23997C370()
{
  return sub_23997A784();
}

uint64_t sub_23997C378()
{
  return sub_23997A8C8();
}

uint64_t sub_23997C380@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_239980010();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_23997C3E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23997C26C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t ShellToHostMessage.MessageType.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0x5A74736575716572;
      break;
    case 6:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23997C4E8(char a1)
{
  return *(void *)&aPreferenseed_0[8 * a1];
}

uint64_t sub_23997C508(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  return sub_23997C520(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ShellToHostMessage.MessageType.rawValue.getter);
}

uint64_t sub_23997C520(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = *a2;
  uint64_t v7 = a5(*a1);
  uint64_t v9 = v8;
  if (v7 == a5(v6) && v9 == v10) {
    char v12 = 1;
  }
  else {
    char v12 = sub_239980050();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

uint64_t sub_23997C5B8(uint64_t a1, uint64_t a2)
{
  return sub_23997C5D0(a1, a2, (void (*)(uint64_t))ShellToHostMessage.MessageType.rawValue.getter);
}

uint64_t sub_23997C5D0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = *v3;
  sub_2399800E0();
  a3(v5);
  sub_23997FE60();
  swift_bridgeObjectRelease();
  return sub_239980110();
}

uint64_t sub_23997C63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23997C654(a1, a2, a3, (void (*)(void))ShellToHostMessage.MessageType.rawValue.getter);
}

uint64_t sub_23997C654(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4(*v4);
  sub_23997FE60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23997C6AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23997C6C4(a1, a2, a3, (void (*)(uint64_t))ShellToHostMessage.MessageType.rawValue.getter);
}

uint64_t sub_23997C6C4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v6 = *v4;
  sub_2399800E0();
  a4(v6);
  sub_23997FE60();
  swift_bridgeObjectRelease();
  return sub_239980110();
}

uint64_t sub_23997C72C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s18PreviewsServicesUI18ShellToHostMessageO0G4TypeO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_23997C75C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ShellToHostMessage.MessageType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23997C788(char *a1, char *a2)
{
  return sub_239979DC8(*a1, *a2);
}

uint64_t sub_23997C794()
{
  return sub_23997A440();
}

uint64_t sub_23997C79C()
{
  return sub_23997A5E0();
}

uint64_t sub_23997C7A4()
{
  return sub_23997AAB8();
}

uint64_t sub_23997C7AC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23997C8A0();
  *a1 = result;
  return result;
}

uint64_t sub_23997C7DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23997C4E8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s18PreviewsServicesUI18ShellToHostMessageO0G4TypeO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0 = sub_239980010();
  swift_bridgeObjectRelease();
  if (v0 >= 7) {
    return 7;
  }
  else {
    return v0;
  }
}

uint64_t _s18PreviewsServicesUI18HostToShellMessageO0G4TypeO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0 = sub_239980010();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_23997C8A0()
{
  unint64_t v0 = sub_239980010();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

id sub_23997C8EC()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (void *)sub_23997FD10();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithData_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_23997FD00();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_23997C9AC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_23997C9C0(a1, a2);
  }
  return a1;
}

uint64_t sub_23997C9C0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_23997CA18(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23997CA6C()
{
  unint64_t result = qword_268A06F80;
  if (!qword_268A06F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06F80);
  }
  return result;
}

unint64_t sub_23997CAC0(uint64_t a1)
{
  unint64_t result = sub_23997CAE8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23997CAE8()
{
  unint64_t result = qword_268A06F88;
  if (!qword_268A06F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06F88);
  }
  return result;
}

unint64_t sub_23997CB40()
{
  unint64_t result = qword_268A06F90;
  if (!qword_268A06F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06F90);
  }
  return result;
}

unint64_t sub_23997CB94(uint64_t a1)
{
  unint64_t result = sub_23997CBBC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23997CBBC()
{
  unint64_t result = qword_268A06F98;
  if (!qword_268A06F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06F98);
  }
  return result;
}

unint64_t sub_23997CC14()
{
  unint64_t result = qword_268A06FA0;
  if (!qword_268A06FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06FA0);
  }
  return result;
}

unint64_t sub_23997CC6C()
{
  unint64_t result = qword_268A06FA8;
  if (!qword_268A06FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06FA8);
  }
  return result;
}

void destroy for HostToShellMessage(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 16);
  if (v1 >= 2) {
    unsigned int v1 = *(_DWORD *)a1 + 2;
  }
  if (v1 != 1)
  {
    if (v1) {
      return;
    }
    a1 += 8;
  }
}

uint64_t _s18PreviewsServicesUI18HostToShellMessageOwCP_0(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 16);
  if (v3 >= 2) {
    unsigned int v3 = *(_DWORD *)a2 + 2;
  }
  if (v3 == 1)
  {
    uint64_t v6 = *(void **)a2;
    *(void *)a1 = *(void *)a2;
    *(unsigned char *)(a1 + 16) = 1;
    id v7 = v6;
  }
  else if (v3)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  }
  else
  {
    id v4 = *(void **)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    *(unsigned char *)(a1 + 16) = 0;
    id v5 = v4;
  }
  return a1;
}

uint64_t assignWithCopy for HostToShellMessage(uint64_t a1, long long *a2)
{
  if ((long long *)a1 == a2) {
    return a1;
  }
  unsigned int v4 = *(unsigned __int8 *)(a1 + 16);
  if (v4 >= 2) {
    unsigned int v4 = *(_DWORD *)a1 + 2;
  }
  id v5 = (id *)a1;
  if (v4 == 1) {
    goto LABEL_7;
  }
  if (!v4)
  {
    id v5 = (id *)(a1 + 8);
LABEL_7:
  }
  unsigned int v6 = *((unsigned __int8 *)a2 + 16);
  if (v6 >= 2) {
    unsigned int v6 = *(_DWORD *)a2 + 2;
  }
  if (v6 == 1)
  {
    uint64_t v9 = *(void **)a2;
    *(void *)a1 = *(void *)a2;
    *(unsigned char *)(a1 + 16) = 1;
    id v10 = v9;
  }
  else if (v6)
  {
    long long v11 = *a2;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(_OWORD *)a1 = v11;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    id v7 = (void *)*((void *)a2 + 1);
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = 0;
    id v8 = v7;
  }
  return a1;
}

uint64_t assignWithTake for HostToShellMessage(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 16);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    id v5 = (id *)a1;
    if (v4 != 1)
    {
      if (v4) {
        goto LABEL_8;
      }
      id v5 = (id *)(a1 + 8);
    }

LABEL_8:
    unsigned int v6 = *(unsigned __int8 *)(a2 + 16);
    if (v6 >= 2) {
      unsigned int v6 = *(_DWORD *)a2 + 2;
    }
    if (v6 == 1)
    {
      *(void *)a1 = *(void *)a2;
      char v7 = 1;
    }
    else
    {
      if (!v6)
      {
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(unsigned char *)(a1 + 16) = 0;
        return a1;
      }
      *(_OWORD *)a1 = *(_OWORD *)a2;
      char v7 = *(unsigned char *)(a2 + 16);
    }
    *(unsigned char *)(a1 + 16) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for HostToShellMessage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HostToShellMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_23997CF6C(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 16);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_23997CF88(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for HostToShellMessage()
{
  return &type metadata for HostToShellMessage;
}

void destroy for ShellToHostMessage(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 4) {
    unsigned int v1 = *(_DWORD *)a1 + 4;
  }
  if (v1 == 1)
  {
  }
  else if (!v1)
  {
  }
}

uint64_t initializeWithCopy for ShellToHostMessage(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 4) {
    unsigned int v3 = *(_DWORD *)a2 + 4;
  }
  switch(v3)
  {
    case 0u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
      unsigned int v4 = *(void **)(a2 + 32);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = v4;
      *(unsigned char *)(a1 + 40) = 0;
      id v5 = v4;
      break;
    case 1u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
      char v7 = *(void **)(a2 + 24);
      *(void *)(a1 + 24) = v7;
      *(unsigned char *)(a1 + 40) = 1;
      id v8 = v7;
      break;
    case 2u:
      *(_DWORD *)a1 = *(_DWORD *)a2;
      char v9 = 2;
      goto LABEL_9;
    case 3u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      char v9 = 3;
LABEL_9:
      *(unsigned char *)(a1 + 40) = v9;
      break;
    default:
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
      break;
  }
  return a1;
}

uint64_t assignWithCopy for ShellToHostMessage(uint64_t a1, long long *a2)
{
  if ((long long *)a1 == a2) {
    return a1;
  }
  unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 >= 4) {
    unsigned int v4 = *(_DWORD *)a1 + 4;
  }
  if (v4 == 1)
  {
    id v5 = (id *)(a1 + 24);
    goto LABEL_8;
  }
  if (!v4)
  {
    id v5 = (id *)(a1 + 32);
LABEL_8:
  }
  unsigned int v6 = *((unsigned __int8 *)a2 + 40);
  if (v6 >= 4) {
    unsigned int v6 = *(_DWORD *)a2 + 4;
  }
  switch(v6)
  {
    case 0u:
      long long v7 = *a2;
      *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
      *(_OWORD *)a1 = v7;
      *(void *)(a1 + 24) = *((void *)a2 + 3);
      id v8 = (void *)*((void *)a2 + 4);
      *(void *)(a1 + 32) = v8;
      *(unsigned char *)(a1 + 40) = 0;
      id v9 = v8;
      break;
    case 1u:
      long long v12 = *a2;
      *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
      *(_OWORD *)a1 = v12;
      unint64_t v13 = (void *)*((void *)a2 + 3);
      *(void *)(a1 + 24) = v13;
      *(unsigned char *)(a1 + 40) = 1;
      id v14 = v13;
      break;
    case 2u:
      *(_DWORD *)a1 = *(_DWORD *)a2;
      char v15 = 2;
      goto LABEL_17;
    case 3u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      char v15 = 3;
LABEL_17:
      *(unsigned char *)(a1 + 40) = v15;
      break;
    default:
      long long v10 = *a2;
      long long v11 = a2[1];
      *(_OWORD *)(a1 + 25) = *(long long *)((char *)a2 + 25);
      *(_OWORD *)a1 = v10;
      *(_OWORD *)(a1 + 16) = v11;
      break;
  }
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ShellToHostMessage(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return a1;
  }
  unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 >= 4) {
    unsigned int v4 = *(_DWORD *)a1 + 4;
  }
  if (v4 == 1)
  {
    id v5 = (id *)(a1 + 24);
    goto LABEL_8;
  }
  if (!v4)
  {
    id v5 = (id *)(a1 + 32);
LABEL_8:
  }
  unsigned int v6 = *(unsigned __int8 *)(a2 + 40);
  if (v6 >= 4) {
    unsigned int v6 = *(_DWORD *)a2 + 4;
  }
  switch(v6)
  {
    case 0u:
      long long v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(unsigned char *)(a1 + 40) = 0;
      return a1;
    case 1u:
      long long v9 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v9;
      char v10 = 1;
      goto LABEL_17;
    case 2u:
      *(_DWORD *)a1 = *(_DWORD *)a2;
      char v10 = 2;
      goto LABEL_17;
    case 3u:
      *(unsigned char *)a1 = *(unsigned char *)a2;
      char v10 = 3;
LABEL_17:
      *(unsigned char *)(a1 + 40) = v10;
      break;
    default:
      long long v8 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v8;
      *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
      break;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellToHostMessage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 5) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ShellToHostMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_23997D3D0(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 4) {
    return (*(_DWORD *)a1 + 4);
  }
  return result;
}

uint64_t sub_23997D3EC(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ShellToHostMessage()
{
  return &type metadata for ShellToHostMessage;
}

unsigned char *storeEnumTagSinglePayload for HostToShellMessage.MessageType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23997D4F0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HostToShellMessage.MessageType()
{
  return &type metadata for HostToShellMessage.MessageType;
}

uint64_t getEnumTagSinglePayload for ShellToHostMessage.MessageType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ShellToHostMessage.MessageType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23997D684);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToHostMessage.MessageType()
{
  return &type metadata for ShellToHostMessage.MessageType;
}

unsigned char *storeEnumTagSinglePayload for ShellToHostMessage.Key(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23997D788);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToHostMessage.Key()
{
  return &type metadata for ShellToHostMessage.Key;
}

unsigned char *storeEnumTagSinglePayload for HostToShellMessage.Key(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23997D88CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HostToShellMessage.Key()
{
  return &type metadata for HostToShellMessage.Key;
}

unint64_t sub_23997D8C8()
{
  unint64_t result = qword_268A06FB0;
  if (!qword_268A06FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06FB0);
  }
  return result;
}

unint64_t sub_23997D920()
{
  unint64_t result = qword_268A06FB8;
  if (!qword_268A06FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A06FB8);
  }
  return result;
}

uint64_t sub_23997D97C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

ValueMetadata *type metadata accessor for CancelationToken()
{
  return &type metadata for CancelationToken;
}

uint64_t sub_23997D9A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for ObservationStream()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for Identifier()
{
  return &type metadata for Identifier;
}

uint64_t sub_23997D9D0()
{
  return 0;
}

uint64_t sub_23997D9D8()
{
  return 0x44726F7272455655;
}

uint64_t sub_23997D9FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23997FE30();
  uint64_t v6 = v5;
  uint64_t v7 = sub_239980020();
  uint64_t v22 = MEMORY[0x263F8D310];
  *(void *)&long long v21 = v7;
  *((void *)&v21 + 1) = v8;
  sub_23996BBE8(&v21, v20);
  uint64_t v9 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_239978C60(v20, v4, v6, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  if (v11)
  {
    long long v12 = (void *)v11;
    uint64_t v13 = sub_23997FE30();
    uint64_t v15 = v14;
    swift_getErrorValue();
    uint64_t v22 = v19;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v21);
    (*(void (**)(uint64_t *))(*(void *)(v19 - 8) + 16))(boxed_opaque_existential_0);
    sub_23996BBE8(&v21, v20);
    char v17 = swift_isUniquelyReferenced_nonNull_native();
    sub_239978C60(v20, v13, v15, v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v9;
}

uint64_t sub_23997DB9C()
{
  uint64_t v0 = arc4random_uniform(0x3E8u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A07050);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = v0;
  qword_268A06FC0 = result;
  return result;
}

uint64_t *sub_23997DBEC@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2 = *result + 1;
  *uint64_t result = v2;
  *a2 = v2;
  return result;
}

uint64_t sub_23997DC00()
{
  return sub_239980110();
}

uint64_t sub_23997DC48()
{
  return sub_239980100();
}

uint64_t sub_23997DC74()
{
  return sub_239980110();
}

uint64_t sub_23997DCB8()
{
  return sub_239980020();
}

unint64_t sub_23997DD00()
{
  unint64_t result = qword_268A07048;
  if (!qword_268A07048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A07048);
  }
  return result;
}

uint64_t sub_23997DD54@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v4 = sub_23997FD60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  if (*a1)
  {
    uint64_t v9 = a1[1];
    *a1 = 0;
    a1[1] = 0;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v8;
    *(void *)(result + 24) = v9;
    *a2 = sub_239969AD4;
    a2[1] = (uint64_t (*)())result;
  }
  else
  {
    sub_23997FD40();
    uint64_t v11 = sub_23997FD50();
    uint64_t v12 = sub_23997FED0();
    if (os_log_type_enabled(v11, (os_log_type_t)v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_23995F000, v11, (os_log_type_t)v12, "ObservationStream.Token canceled twice", v13, 2u);
      MEMORY[0x23ECA9A00](v13, -1, -1);
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  unsigned int v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_23997DF48()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void *destroy for CancelationToken.State(void *result)
{
  if (*result >= 0xFFFFFFFFuLL) {
    return (void *)swift_release();
  }
  return result;
}

uint64_t _s18PreviewsServicesUI16CancelationTokenV5StateOwCP_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_retain();
  }
  return a1;
}

unint64_t *assignWithCopy for CancelationToken.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      unint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  unint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for CancelationToken.State(void *a1, uint64_t a2)
{
  if (*a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    swift_release();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CancelationToken.State(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CancelationToken.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_23997E18C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_23997E1A4(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CancelationToken.State()
{
  return &type metadata for CancelationToken.State;
}

PreviewsServicesUI::SuppressedPresentation_optional __swiftcall SuppressedPresentation.init(catalystErrorCode:)(Swift::Int catalystErrorCode)
{
  uint64_t v2 = v1;
  uint64_t v3 = UVSuppressedPresentationFromCatalystErrorCode();
  if ((unint64_t)(v3 + 1) >= 8) {
    char v4 = 10;
  }
  else {
    char v4 = 0x60504030201000AuLL >> (8 * (v3 + 1));
  }
  char *v2 = v4;
  return (PreviewsServicesUI::SuppressedPresentation_optional)v3;
}

PreviewsServicesUI::SuppressedPresentation_optional __swiftcall SuppressedPresentation.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_239980010();
  result.value = swift_bridgeObjectRelease();
  char v5 = 11;
  if (v3 < 0xB) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t SuppressedPresentation.rawValue.getter()
{
  return *(void *)&aColorpicfontpi_0[8 * *v0];
}

uint64_t sub_23997E2A4(char *a1, char *a2)
{
  return sub_239979D40(*a1, *a2);
}

unint64_t sub_23997E2B4()
{
  unint64_t result = qword_268A07058;
  if (!qword_268A07058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A07058);
  }
  return result;
}

uint64_t sub_23997E308()
{
  return sub_239980110();
}

uint64_t sub_23997E350()
{
  return sub_23997A58C();
}

uint64_t sub_23997E358()
{
  return sub_239980110();
}

PreviewsServicesUI::SuppressedPresentation_optional sub_23997E39C(Swift::String *a1)
{
  return SuppressedPresentation.init(rawValue:)(*a1);
}

uint64_t sub_23997E3A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SuppressedPresentation.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SuppressedPresentation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SuppressedPresentation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *uint64_t result = a2 + 10;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23997E52CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SuppressedPresentation()
{
  return &type metadata for SuppressedPresentation;
}

uint64_t sub_23997E564(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_23997E578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t destroy for UnarchiveError(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 96);
  if (v2 >= 3) {
    unsigned int v2 = *(_DWORD *)a1 + 3;
  }
  if (v2 == 2 || v2 == 1)
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    __swift_destroy_boxed_opaque_existential_0(a1 + 32);
    uint64_t v3 = a1 + 64;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    uint64_t v3 = a1 + 32;
  }

  return __swift_destroy_boxed_opaque_existential_0(v3);
}

uint64_t initializeWithCopy for UnarchiveError(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 96);
  if (v4 >= 3) {
    unsigned int v4 = *(_DWORD *)a2 + 3;
  }
  if (v4 == 2)
  {
    uint64_t v9 = *(void *)(a2 + 24);
    *(void *)(a1 + 24) = v9;
    (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1, a2);
    uint64_t v10 = *(void *)(a2 + 56);
    *(void *)(a1 + 56) = v10;
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 32, a2 + 32);
    uint64_t v11 = *(void *)(a2 + 88);
    *(void *)(a1 + 88) = v11;
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 64, a2 + 64);
    char v8 = 2;
  }
  else
  {
    uint64_t v5 = *(void *)(a2 + 24);
    *(void *)(a1 + 24) = v5;
    if (v4 == 1)
    {
      (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
      uint64_t v6 = *(void *)(a2 + 56);
      *(void *)(a1 + 56) = v6;
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 32, a2 + 32);
      uint64_t v7 = *(void *)(a2 + 88);
      *(void *)(a1 + 88) = v7;
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 64, a2 + 64);
      char v8 = 1;
    }
    else
    {
      (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
      uint64_t v12 = *(void *)(a2 + 56);
      *(void *)(a1 + 56) = v12;
      (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 32, a2 + 32);
      char v8 = 0;
    }
  }
  *(unsigned char *)(a1 + 96) = v8;
  return a1;
}

uint64_t assignWithCopy for UnarchiveError(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 96);
    if (v4 >= 3) {
      unsigned int v4 = *(_DWORD *)a1 + 3;
    }
    if (v4 == 2 || v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_0(a1);
      __swift_destroy_boxed_opaque_existential_0(a1 + 32);
      uint64_t v5 = a1 + 64;
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0(a1);
      uint64_t v5 = a1 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0(v5);
    unsigned int v6 = *(unsigned __int8 *)(a2 + 96);
    if (v6 >= 3) {
      unsigned int v6 = *(_DWORD *)a2 + 3;
    }
    if (v6 == 2)
    {
      uint64_t v11 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v11;
      (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1, a2);
      uint64_t v12 = *(void *)(a2 + 56);
      *(void *)(a1 + 56) = v12;
      (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 32, a2 + 32);
      uint64_t v13 = *(void *)(a2 + 88);
      *(void *)(a1 + 88) = v13;
      (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 64, a2 + 64);
      char v10 = 2;
    }
    else
    {
      uint64_t v7 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v7;
      if (v6 == 1)
      {
        (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
        uint64_t v8 = *(void *)(a2 + 56);
        *(void *)(a1 + 56) = v8;
        (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 32, a2 + 32);
        uint64_t v9 = *(void *)(a2 + 88);
        *(void *)(a1 + 88) = v9;
        (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 64, a2 + 64);
        char v10 = 1;
      }
      else
      {
        (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
        uint64_t v14 = *(void *)(a2 + 56);
        *(void *)(a1 + 56) = v14;
        (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 32, a2 + 32);
        char v10 = 0;
      }
    }
    *(unsigned char *)(a1 + 96) = v10;
  }
  return a1;
}

__n128 __swift_memcpy97_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(unsigned char *)(a1 + 96) = *((unsigned char *)a2 + 96);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for UnarchiveError(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 96);
    if (v4 >= 3) {
      unsigned int v4 = *(_DWORD *)a1 + 3;
    }
    if (v4 == 2 || v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_0(a1);
      __swift_destroy_boxed_opaque_existential_0(a1 + 32);
      uint64_t v5 = a1 + 64;
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0(a1);
      uint64_t v5 = a1 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0(v5);
    unsigned int v6 = *(unsigned __int8 *)(a2 + 96);
    if (v6 >= 3) {
      unsigned int v6 = *(_DWORD *)a2 + 3;
    }
    if (v6 == 2 || v6 == 1)
    {
      long long v7 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = v7;
      long long v8 = *(_OWORD *)(a2 + 80);
      *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 80) = v8;
      long long v9 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v9;
    }
    else
    {
      LOBYTE(v6) = 0;
      long long v10 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v10;
      long long v11 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = v11;
    }
    *(unsigned char *)(a1 + 96) = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for UnarchiveError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 97)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 96);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for UnarchiveError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 96) = 0;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 97) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 97) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 96) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_23997ED0C(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 96);
  if (result >= 3) {
    return (*(_DWORD *)a1 + 3);
  }
  return result;
}

uint64_t sub_23997ED28(uint64_t result, unsigned int a2)
{
  if (a2 > 2)
  {
    unsigned int v2 = a2 - 3;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    LOBYTE(a2) = 3;
    *(_DWORD *)uint64_t result = v2;
  }
  *(unsigned char *)(result + 96) = a2;
  return result;
}

ValueMetadata *type metadata accessor for UnarchiveError()
{
  return &type metadata for UnarchiveError;
}

uint64_t sub_23997ED68()
{
  uint64_t v0 = sub_23997FE30();
  uint64_t v2 = v1;
  sub_23997FF70();
  swift_bridgeObjectRelease();
  *(void *)&long long v7 = 0xD000000000000026;
  *((void *)&v7 + 1) = 0x8000000239983080;
  swift_bridgeObjectRetain();
  sub_23997FE70();
  swift_bridgeObjectRelease();
  sub_23997FE70();
  uint64_t v8 = MEMORY[0x263F8D310];
  sub_23996BBE8(&v7, v6);
  uint64_t v3 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_239978C60(v6, v0, v2, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_23997EE88(char a1)
{
  uint64_t v2 = sub_23997FE30();
  uint64_t v4 = v3;
  unint64_t v5 = 0xD000000000000037;
  if (a1) {
    unint64_t v5 = 0xD00000000000003FLL;
  }
  unint64_t v6 = 0x80000002399832C0;
  uint64_t v12 = MEMORY[0x263F8D310];
  if ((a1 & 1) == 0) {
    unint64_t v6 = 0x8000000239983300;
  }
  *(void *)&long long v11 = v5;
  *((void *)&v11 + 1) = v6;
  sub_23996BBE8(&v11, v10);
  uint64_t v7 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_239978C60(v10, v2, v4, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_23997EF68(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  char v16 = a3 & 1;
  uint64_t v3 = sub_23997FE30();
  uint64_t v5 = v4;
  uint64_t v6 = sub_23996CB54();
  uint64_t v13 = MEMORY[0x263F8D310];
  *(void *)&long long v12 = v6;
  *((void *)&v12 + 1) = v7;
  sub_23996BBE8(&v12, v11);
  uint64_t v8 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_239978C60(v11, v3, v5, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_23997F020()
{
  uint64_t v0 = sub_23997FE30();
  uint64_t v2 = v1;
  sub_23997FF70();
  swift_bridgeObjectRelease();
  *(void *)&long long v7 = 0xD00000000000001ELL;
  *((void *)&v7 + 1) = 0x8000000239983570;
  sub_23997FE70();
  swift_bridgeObjectRelease();
  sub_23997FE70();
  uint64_t v8 = MEMORY[0x263F8D310];
  sub_23996BBE8(&v7, v6);
  uint64_t v3 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_239978C60(v6, v0, v2, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_23997F154()
{
  uint64_t v0 = sub_23997FE30();
  uint64_t v2 = v1;
  uint64_t v3 = sub_23997F1FC();
  uint64_t v10 = MEMORY[0x263F8D310];
  *(void *)&long long v9 = v3;
  *((void *)&v9 + 1) = v4;
  sub_23996BBE8(&v9, v8);
  uint64_t v5 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_239978C60(v8, v0, v2, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23997F1FC()
{
  sub_23997F6F4(v0, (uint64_t)v5);
  if (v8)
  {
    sub_23996BBE8(v5, v4);
    sub_23996BBE8(v6, v3);
    sub_23996BBE8(&v7, v2);
    sub_23997FF70();
    sub_23997FE70();
    sub_23997FFA0();
    sub_23997FE70();
    sub_23997FFA0();
    sub_23997FE70();
    sub_23997FFA0();
    sub_23997FE70();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  }
  else
  {
    sub_23996BBE8(v5, v4);
    sub_23996BBE8(v6, v3);
    *(void *)&v2[0] = 0;
    *((void *)&v2[0] + 1) = 0xE000000000000000;
    sub_23997FF70();
    sub_23997FE70();
    sub_23997FFA0();
    sub_23997FE70();
    sub_23997FFA0();
    sub_23997FE70();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return 0;
}

uint64_t sub_23997F56C(char a1)
{
  if (a1) {
    return 0x746867696568;
  }
  else {
    return 0x6874646977;
  }
}

unint64_t sub_23997F5A4(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_23997F5D4();
  unint64_t result = sub_23997F628();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_23997F5D4()
{
  unint64_t result = qword_268A07060;
  if (!qword_268A07060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A07060);
  }
  return result;
}

unint64_t sub_23997F628()
{
  unint64_t result = qword_268A07068;
  if (!qword_268A07068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A07068);
  }
  return result;
}

uint64_t sub_23997F67C(uint64_t a1)
{
  unint64_t v2 = sub_23997F5D4();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_23997F6B8(uint64_t a1)
{
  unint64_t v2 = sub_23997F5D4();

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_23997F6F4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_23997F72C(char *a1, char *a2)
{
  return sub_239979CA4(*a1, *a2);
}

uint64_t sub_23997F738()
{
  return sub_23997A4AC();
}

uint64_t sub_23997F740()
{
  return sub_23997A528();
}

uint64_t sub_23997F748()
{
  return sub_23997AB20();
}

uint64_t sub_23997F750@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_239980010();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_23997F7B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23997F56C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

double sub_23997F7DC(uint64_t a1)
{
  uint64_t v4 = sub_239977160(0, a1);
  if (v1) {
    goto LABEL_8;
  }
  if (v5)
  {
    sub_239978DB4();
    swift_allocError();
    uint64_t v9 = v8;
    *(void *)(v8 + 24) = &_s3KeyON;
    *(unsigned char *)uint64_t v8 = 0;
LABEL_7:
    *(void *)(v9 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268A06F30);
    *(void *)(v9 + 32) = MEMORY[0x263F8EF38];
    *(unsigned char *)(v9 + 96) = 0;
    swift_willThrow();
LABEL_8:
    swift_bridgeObjectRelease();
    return v2;
  }
  double v6 = *(double *)&v4;
  sub_239977160(1, a1);
  if (v7)
  {
    sub_239978DB4();
    swift_allocError();
    uint64_t v9 = v11;
    *(void *)(v11 + 24) = &_s3KeyON;
    *(unsigned char *)uint64_t v11 = 1;
    goto LABEL_7;
  }
  double v2 = v6;
  swift_bridgeObjectRelease();
  return v2;
}

unsigned char *_s3KeyOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23997F9D0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *_s3KeyOMa()
{
  return &_s3KeyON;
}

unint64_t sub_23997FA0C()
{
  unint64_t result = qword_268A07070;
  if (!qword_268A07070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A07070);
  }
  return result;
}

uint64_t sub_23997FCF0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_23997FD00()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_23997FD10()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_23997FD20()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_23997FD30()
{
  return MEMORY[0x270EEB1A8]();
}

uint64_t sub_23997FD40()
{
  return MEMORY[0x270F56E10]();
}

uint64_t sub_23997FD50()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23997FD60()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23997FD80()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_23997FD90()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23997FDA0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23997FDB0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23997FDC0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_23997FDD0()
{
  return MEMORY[0x270FA0AE8]();
}

uint64_t sub_23997FDE0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_23997FDF0()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_23997FE00()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23997FE10()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23997FE20()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23997FE30()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23997FE40()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_23997FE50()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23997FE60()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23997FE70()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23997FE80()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23997FE90()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_23997FEA0()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t sub_23997FEB0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_23997FEC0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23997FED0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23997FEE0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23997FEF0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_23997FF00()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_23997FF10()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23997FF20()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23997FF30()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23997FF40()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23997FF50()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23997FF60()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_23997FF70()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23997FF80()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23997FF90()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23997FFA0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23997FFB0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23997FFC0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23997FFD0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_23997FFE0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_23997FFF0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_239980000()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_239980010()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_239980020()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_239980030()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_239980040()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_239980050()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_239980060()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_239980070()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2399800A0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2399800B0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2399800C0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2399800D0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2399800E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2399800F0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_239980100()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_239980110()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_239980120()
{
  return MEMORY[0x270FA0128]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x270F10838]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t UVLog()
{
  return MEMORY[0x270F56E18]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}