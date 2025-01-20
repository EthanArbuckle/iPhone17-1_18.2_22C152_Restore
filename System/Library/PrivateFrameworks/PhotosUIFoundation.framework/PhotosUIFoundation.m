uint64_t sub_259CDD178(unsigned __int8 *a1, void *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  int v10;

  v2 = *(void *)(a2[2] - 8);
  v3 = *(void *)(v2 + 64);
  v4 = *(void *)(a2[3] - 8);
  if (*(void *)(v4 + 64) > v3) {
    v3 = *(void *)(v4 + 64);
  }
  v5 = *(void *)(*(void *)(a2[4] - 8) + 64);
  if (v5 <= v3) {
    v5 = v3;
  }
  v6 = a1[v5];
  v7 = v6 - 3;
  if (v6 >= 3)
  {
    if (v5 <= 3) {
      v8 = v5;
    }
    else {
      v8 = 4;
    }
    switch(v8)
    {
      case 1:
        v9 = *a1;
        goto LABEL_14;
      case 2:
        v9 = *(unsigned __int16 *)a1;
        goto LABEL_14;
      case 3:
        v9 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_14;
      case 4:
        v9 = *(_DWORD *)a1;
LABEL_14:
        v10 = (v9 | (v7 << (8 * v5))) + 3;
        v6 = v9 + 3;
        if (v5 < 4) {
          v6 = v10;
        }
        break;
      default:
        break;
    }
  }
  if (v6)
  {
    if (v6 == 2) {
      v2 = *(void *)(a2[4] - 8);
    }
    else {
      v2 = *(void *)(a2[3] - 8);
    }
  }
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t getEnumTagSinglePayload for PhotosVerticalTextSpecs(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PhotosVerticalTextSpecs(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)result = (a2 - 1);
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

void *sub_259CDD354(void *a1, unsigned __int8 *a2, void *a3)
{
  char v3 = a1;
  uint64_t v4 = *(void *)(a3[2] - 8);
  uint64_t v5 = a3[4];
  uint64_t v6 = *(void *)(a3[3] - 8);
  if (*(void *)(v6 + 64) <= *(void *)(v4 + 64)) {
    unint64_t v7 = *(void *)(*(void *)(a3[2] - 8) + 64);
  }
  else {
    unint64_t v7 = *(void *)(v6 + 64);
  }
  uint64_t v8 = *(void *)(v5 - 8);
  if (*(void *)(v8 + 64) <= v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = *(void *)(*(void *)(v5 - 8) + 64);
  }
  uint64_t v10 = (*(unsigned char *)(v6 + 80) | *(unsigned char *)(v4 + 80) | *(unsigned char *)(v8 + 80));
  if (v10 <= 7
    && v9 + 1 <= 0x18
    && ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v4 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) == 0)
  {
    unsigned int v14 = a2[v9];
    unsigned int v15 = v14 - 3;
    if (v14 >= 3)
    {
      if (v9 <= 3) {
        uint64_t v16 = v9;
      }
      else {
        uint64_t v16 = 4;
      }
      switch(v16)
      {
        case 1:
          int v17 = *a2;
          goto LABEL_24;
        case 2:
          int v17 = *(unsigned __int16 *)a2;
          goto LABEL_24;
        case 3:
          int v17 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_24;
        case 4:
          int v17 = *(_DWORD *)a2;
LABEL_24:
          int v18 = (v17 | (v15 << (8 * v9))) + 3;
          unsigned int v14 = v17 + 3;
          if (v9 < 4) {
            unsigned int v14 = v18;
          }
          break;
        default:
          break;
      }
    }
    if (v14 == 2)
    {
      (*(void (**)(void *))(v8 + 16))(a1);
      char v19 = 2;
    }
    else
    {
      if (v14 != 1)
      {
        (*(void (**)(void *))(v4 + 16))(a1);
        *((unsigned char *)v3 + v9) = 0;
        return v3;
      }
      (*(void (**)(void *))(v6 + 16))(a1);
      char v19 = 1;
    }
    *((unsigned char *)v3 + v9) = v19;
  }
  else
  {
    uint64_t v13 = *(void *)a2;
    *char v3 = *(void *)a2;
    char v3 = (void *)(v13 + ((v10 + 16) & ~v10));
    swift_retain();
  }
  return v3;
}

double PXSizeAdd(double a1, double a2, double a3)
{
  return a1 + a3;
}

ValueMetadata *type metadata accessor for PhotosEnvironmentValues()
{
  return &type metadata for PhotosEnvironmentValues;
}

ValueMetadata *type metadata accessor for PhotosItemListLoadingStatus()
{
  return &type metadata for PhotosItemListLoadingStatus;
}

ValueMetadata *type metadata accessor for PhotosItemListChangeDetails()
{
  return &type metadata for PhotosItemListChangeDetails;
}

uint64_t sub_259CDD5D8(unsigned __int8 *a1, void *a2)
{
  unint64_t v2 = *(void *)(*(void *)(a2[2] - 8) + 64);
  uint64_t v3 = *(void *)(a2[3] - 8);
  if (*(void *)(v3 + 64) > v2) {
    unint64_t v2 = *(void *)(v3 + 64);
  }
  unint64_t v4 = *(void *)(*(void *)(a2[4] - 8) + 64);
  if (v4 <= v2) {
    unint64_t v4 = v2;
  }
  uint64_t v5 = a1[v4];
  int v6 = v5 - 3;
  if (v5 >= 3)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a1;
        goto LABEL_14;
      case 2:
        int v8 = *(unsigned __int16 *)a1;
        goto LABEL_14;
      case 3:
        int v8 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_14;
      case 4:
        int v8 = *(_DWORD *)a1;
LABEL_14:
        unsigned int v9 = (v8 | (v6 << (8 * v4))) + 3;
        LODWORD(v5) = v8 + 3;
        if (v4 >= 4) {
          uint64_t v5 = v5;
        }
        else {
          uint64_t v5 = v9;
        }
        break;
      default:
        return v5;
    }
  }
  return v5;
}

void destroy for PhotosItemListChangeDetails(uint64_t a1)
{
}

uint64_t dispatch thunk of PhotosItemListManager.itemList.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

void sub_259CDD6D8(unsigned char *a1, unsigned int a2, void *a3)
{
  if (a2 > 2)
  {
    size_t v5 = *(void *)(*(void *)(a3[2] - 8) + 64);
    uint64_t v6 = *(void *)(a3[3] - 8);
    if (*(void *)(v6 + 64) > v5) {
      size_t v5 = *(void *)(v6 + 64);
    }
    uint64_t v7 = *(void *)(a3[4] - 8);
    if (*(void *)(v7 + 64) <= v5) {
      size_t v8 = v5;
    }
    else {
      size_t v8 = *(void *)(v7 + 64);
    }
    unsigned int v9 = a2 - 3;
    if (v8 < 4)
    {
      unsigned int v10 = v9 >> (8 * v8);
      int v11 = v9 & ~(-1 << (8 * v8));
      a1[v8] = v10 + 3;
      bzero(a1, v8);
      if (v8 == 3)
      {
        *(_WORD *)a1 = v11;
        a1[2] = BYTE2(v11);
      }
      else if (v8 == 2)
      {
        *(_WORD *)a1 = v11;
      }
      else
      {
        *a1 = v11;
      }
    }
    else
    {
      a1[v8] = 3;
      bzero(a1, v8);
      *(_DWORD *)a1 = v9;
    }
  }
  else
  {
    unint64_t v4 = *(void *)(*(void *)(a3[2] - 8) + 64);
    if (*(void *)(*(void *)(a3[3] - 8) + 64) > v4) {
      unint64_t v4 = *(void *)(*(void *)(a3[3] - 8) + 64);
    }
    if (*(void *)(*(void *)(a3[4] - 8) + 64) > v4) {
      unint64_t v4 = *(void *)(*(void *)(a3[4] - 8) + 64);
    }
    a1[v4] = a2;
  }
}

uint64_t sub_259CDD85C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosItemListLoadingStatus.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t PhotosItemListLoadingStatus.rawValue.getter()
{
  return *v0;
}

BOOL PXFloatApproximatelyEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 0.00000999999975;
}

unsigned char *sub_259CDD8A4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

uint64_t dispatch thunk of PhotosItem.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

double PXSizeScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

uint64_t dispatch thunk of PhotosItem.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

unsigned __int8 *sub_259CDD8E0(unsigned __int8 *a1, unsigned __int8 *a2, void *a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a3[2];
    uint64_t v6 = a3[3];
    uint64_t v7 = *(void *)(v5 - 8);
    unint64_t v8 = *(void *)(v7 + 64);
    uint64_t v9 = *(void *)(v6 - 8);
    if (*(void *)(v9 + 64) > v8) {
      unint64_t v8 = *(void *)(*(void *)(v6 - 8) + 64);
    }
    uint64_t v10 = a3[4];
    uint64_t v11 = *(void *)(v10 - 8);
    if (*(void *)(v11 + 64) <= v8) {
      unint64_t v12 = v8;
    }
    else {
      unint64_t v12 = *(void *)(v11 + 64);
    }
    unsigned int v13 = a1[v12];
    unsigned int v14 = v13 - 3;
    if (v13 >= 3)
    {
      if (v12 <= 3) {
        uint64_t v15 = v12;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a1;
          goto LABEL_16;
        case 2:
          int v16 = *(unsigned __int16 *)a1;
          goto LABEL_16;
        case 3:
          int v16 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_16;
        case 4:
          int v16 = *(_DWORD *)a1;
LABEL_16:
          int v17 = (v16 | (v14 << (8 * v12))) + 3;
          unsigned int v13 = v16 + 3;
          if (v12 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13)
    {
      if (v13 == 2)
      {
        uint64_t v18 = *(void *)(a3[4] - 8);
        uint64_t v19 = a3[4];
      }
      else
      {
        uint64_t v18 = *(void *)(v6 - 8);
        uint64_t v19 = a3[3];
      }
    }
    else
    {
      uint64_t v18 = *(void *)(a3[2] - 8);
      uint64_t v19 = a3[2];
    }
    (*(void (**)(unsigned __int8 *, uint64_t))(v18 + 8))(a1, v19);
    unsigned int v20 = a2[v12];
    unsigned int v21 = v20 - 3;
    if (v20 >= 3)
    {
      if (v12 <= 3) {
        uint64_t v22 = v12;
      }
      else {
        uint64_t v22 = 4;
      }
      switch(v22)
      {
        case 1:
          int v23 = *a2;
          goto LABEL_32;
        case 2:
          int v23 = *(unsigned __int16 *)a2;
          goto LABEL_32;
        case 3:
          int v23 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_32;
        case 4:
          int v23 = *(_DWORD *)a2;
LABEL_32:
          int v24 = (v23 | (v21 << (8 * v12))) + 3;
          unsigned int v20 = v23 + 3;
          if (v12 < 4) {
            unsigned int v20 = v24;
          }
          break;
        default:
          break;
      }
    }
    if (v20)
    {
      if (v20 == 2)
      {
        char v25 = 2;
        uint64_t v7 = v11;
        uint64_t v5 = v10;
      }
      else
      {
        char v25 = 1;
        uint64_t v7 = v9;
        uint64_t v5 = v6;
      }
    }
    else
    {
      char v25 = 0;
    }
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 16))(a1, a2, v5);
    a1[v12] = v25;
  }
  return a1;
}

uint64_t PXSizeLargerThanSize()
{
  return MEMORY[0x270F536A0]();
}

ValueMetadata *type metadata accessor for PhotosItemListManagerChangeDescriptor()
{
  return &type metadata for PhotosItemListManagerChangeDescriptor;
}

void sub_259CDDBB4(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t dispatch thunk of PhotosItemList.itemIdentifiers.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t PXFloatCompare(double a1, double a2)
{
  if (a1 < a2) {
    return -1;
  }
  else {
    return a1 > a2;
  }
}

void static PhotosItemListManagerChangeDescriptor.itemList.getter(void *a1@<X8>)
{
  *a1 = 1;
}

BOOL PXAssetBadgeInfoIsNull(uint64_t a1)
{
  BOOL result = 0;
  if (!*(void *)a1 && *(double *)(a1 + 8) == 0.0 && *(void *)(a1 + 16) == 0) {
    return *(void *)(a1 + 24) == 0;
  }
  return result;
}

unsigned __int8 *sub_259CDDCE4(unsigned __int8 *a1, unsigned __int8 *a2, void *a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a3[2];
    uint64_t v6 = a3[3];
    uint64_t v7 = *(void *)(v5 - 8);
    unint64_t v8 = *(void *)(v7 + 64);
    uint64_t v9 = *(void *)(v6 - 8);
    if (*(void *)(v9 + 64) > v8) {
      unint64_t v8 = *(void *)(*(void *)(v6 - 8) + 64);
    }
    uint64_t v10 = a3[4];
    uint64_t v11 = *(void *)(v10 - 8);
    if (*(void *)(v11 + 64) <= v8) {
      unint64_t v12 = v8;
    }
    else {
      unint64_t v12 = *(void *)(v11 + 64);
    }
    unsigned int v13 = a1[v12];
    unsigned int v14 = v13 - 3;
    if (v13 >= 3)
    {
      if (v12 <= 3) {
        uint64_t v15 = v12;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a1;
          goto LABEL_16;
        case 2:
          int v16 = *(unsigned __int16 *)a1;
          goto LABEL_16;
        case 3:
          int v16 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_16;
        case 4:
          int v16 = *(_DWORD *)a1;
LABEL_16:
          int v17 = (v16 | (v14 << (8 * v12))) + 3;
          unsigned int v13 = v16 + 3;
          if (v12 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13)
    {
      if (v13 == 2)
      {
        uint64_t v18 = *(void *)(a3[4] - 8);
        uint64_t v19 = a3[4];
      }
      else
      {
        uint64_t v18 = *(void *)(v6 - 8);
        uint64_t v19 = a3[3];
      }
    }
    else
    {
      uint64_t v18 = *(void *)(a3[2] - 8);
      uint64_t v19 = a3[2];
    }
    (*(void (**)(unsigned __int8 *, uint64_t))(v18 + 8))(a1, v19);
    unsigned int v20 = a2[v12];
    unsigned int v21 = v20 - 3;
    if (v20 >= 3)
    {
      if (v12 <= 3) {
        uint64_t v22 = v12;
      }
      else {
        uint64_t v22 = 4;
      }
      switch(v22)
      {
        case 1:
          int v23 = *a2;
          goto LABEL_32;
        case 2:
          int v23 = *(unsigned __int16 *)a2;
          goto LABEL_32;
        case 3:
          int v23 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_32;
        case 4:
          int v23 = *(_DWORD *)a2;
LABEL_32:
          int v24 = (v23 | (v21 << (8 * v12))) + 3;
          unsigned int v20 = v23 + 3;
          if (v12 < 4) {
            unsigned int v20 = v24;
          }
          break;
        default:
          break;
      }
    }
    if (v20)
    {
      if (v20 == 2)
      {
        char v25 = 2;
        uint64_t v7 = v11;
        uint64_t v5 = v10;
      }
      else
      {
        char v25 = 1;
        uint64_t v7 = v9;
        uint64_t v5 = v6;
      }
    }
    else
    {
      char v25 = 0;
    }
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 32))(a1, a2, v5);
    a1[v12] = v25;
  }
  return a1;
}

uint64_t type metadata accessor for AnyPhotosObservableHosted()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for PhotosConcatenatedItemListManager()
{
  return swift_getGenericMetadata();
}

BOOL CGSize.isEmpty.getter(double a1, double a2)
{
  return a2 == 0.0 || a1 == 0.0;
}

uint64_t dispatch thunk of PhotosItemList.loadingStatus.getter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_5_10(a1, a2, a2);
}

uint64_t dispatch thunk of PhotosObservable.observeChanges(using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t AnyPhotosObservableHosted.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t dispatch thunk of PhotosVersionable.version.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PhotosItemList.isEmpty.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

double PXPointAdd(double a1, double a2, double a3)
{
  return a1 + a3;
}

BOOL sub_259CDE0F8(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_259CDE104(uint64_t *a1)
{
  return sub_259CDE0F8(*a1, *v1);
}

uint64_t sub_259CDE124@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>, long long a5@<Q0>)
{
  long long v6 = a5;
  return AnyPhotosObservableProperty.init(wrappedValue:_:changeDetectionType:)(a1, a2, &v6, a3, a4);
}

uint64_t AnyPhotosObservableProperty.init(wrappedValue:_:changeDetectionType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  long long v6 = *a3;
  return AnyPhotosObservableProperty.init(wrappedValue:changeDescriptor:changeDetectionType:)(a1, a2, (uint64_t *)&v6, a4, a5);
}

uint64_t AnyPhotosObservableProperty.init(wrappedValue:changeDescriptor:changeDetectionType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v7 = *a3;
  uint64_t v8 = a3[1];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a5, a1, a4);
  uint64_t v9 = type metadata accessor for AnyPhotosObservableProperty();
  uint64_t v10 = a5 + *(int *)(v9 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(v10, a2, AssociatedTypeWitness);
  unsigned int v13 = (void *)(a5 + *(int *)(v9 + 44));
  *unsigned int v13 = v7;
  v13[1] = v8;
  return result;
}

uint64_t type metadata accessor for AnyPhotosObservableProperty()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_259CDE29C(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

id static PhotosItemListChangeDetails.+ infix(_:_:)@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a2[1];
  if (a1[1] == *a2) {
    id v6 = objc_msgSend((id)a1[2], sel_changeDetailsByAddingChangeDetails_, a2[2]);
  }
  else {
    id v6 = objc_msgSend(self, sel_changeDetailsWithNoIncrementalChanges);
  }
  id result = v6;
  *a3 = v4;
  a3[1] = v5;
  a3[2] = result;
  return result;
}

uint64_t sub_259CDE374()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_259CDE414()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_259CDE4A8(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_259CDE4E4(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_259CE2DD4(a1, a2, a3);
  *uint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_259CDE574()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_259CDE608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_259CEA2CC((_OWORD *)a1, v6);
    sub_259CDE4E4(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_259D08F20(a1);
    sub_259D1BCEC(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_259D08F20((uint64_t)v6);
  }
}

uint64_t _s18PhotosUIFoundation0A7NSCacheCyq_Sgxcig_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v7 = *((void *)*v4 + 10);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v12 = *(void *)(v11 + 88);
  type metadata accessor for PhotosNSCache.WrappedKey();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  id v13 = sub_259CDF8AC((uint64_t)v10);
  unsigned int v14 = (char *)objc_msgSend(v4[2], sel_objectForKey_, v13);

  if (v14)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v12 - 8) + 16))(a3, &v14[*(void *)(*(void *)v14 + 104)], v12);
    swift_release();
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a3, v15, 1, v12);
}

uint64_t PhotosMutableEnvironment.adoptEnvironmentValues(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8))(&v9, ObjectType, a2);
  uint64_t v8 = v9;
  OUTLINED_FUNCTION_2_5();
  uint64_t v5 = (uint64_t (*)(uint64_t *, void))v4();
  PhotosEnvironmentValues.takeValues(from:)((PhotosUIFoundation::PhotosEnvironmentValues)&v8);
  swift_bridgeObjectRelease();
  return v5(&v7, 0);
}

id sub_259CDE90C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return objc_msgSend(v0, sel_init);
}

uint64_t sub_259CDE944(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_259CDE980()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_259CDEA10()
{
  return PhotosBasicItemListManager.itemList.getter();
}

uint64_t sub_259CDEA34()
{
  return sub_259CDEA50(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_259CDEA50(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 56) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_259CDEA8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v18 = a2;
  uint64_t v19 = a1;
  uint64_t v4 = *v2;
  uint64_t v5 = sub_259D62B68();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v5, v7);
  uint64_t v10 = (char *)&v18 - v9;
  uint64_t v11 = *(void *)(v4 + 80);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v8, v13);
  uint64_t v15 = (char *)&v18 - v14;
  type metadata accessor for PhotosNSCache.WrappedKey();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v18, v11);
  id v16 = sub_259CDF8AC((uint64_t)v15);
  type metadata accessor for PhotosNSCache.WrappedValue();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v10, v19, v5);
  uint64_t v17 = sub_259D014B8(v10);
  if (v17)
  {
    objc_msgSend((id)v3[2], sel_setObject_forKey_, v17, v16);
    swift_release();
  }
  else
  {
    objc_msgSend((id)v3[2], sel_removeObjectForKey_, v16);
  }
}

Swift::Bool __swiftcall PhotosConcatenatedItemListManager.waitForItemList(timeout:)(Swift::Double timeout)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  uint64_t v5 = mach_absolute_time();
  char v6 = (*(uint64_t (**)(void, double))(*(void *)(v3 + 104) + 56))(*(void *)(v3 + 80), timeout);
  if (!v1[4]) {
    goto LABEL_11;
  }
  if ((v6 & 1) == 0)
  {
    char v6 = 0;
LABEL_11:
    LOBYTE(v7) = v6 & 1;
    return v7;
  }
  if (*((unsigned char *)v1 + 48) != 1)
  {
    char v6 = 1;
    goto LABEL_11;
  }
  swift_unknownObjectRetain();
  uint64_t v7 = mach_absolute_time();
  uint64_t v8 = v7 - v5;
  if (v7 < v5)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v8 < 0)
  {
LABEL_13:
    __break(1u);
    return v7;
  }
  v9.n128_f64[0] = timeout - PXTimebaseConversionFactor() * (double)v8;
  if (timeout == INFINITY) {
    v9.n128_f64[0] = INFINITY;
  }
  char v10 = (*(uint64_t (**)(void, __n128))(*(void *)(v4 + 112) + 56))(*(void *)(v4 + 88), v9);
  swift_unknownObjectRelease();
  LOBYTE(v7) = v10 & 1;
  return v7;
}

uint64_t sub_259CDEE08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v36 = a4;
  uint64_t v40 = a2;
  uint64_t v6 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1, a2);
  v35 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259D62B68();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v37 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](TupleTypeMetadata2, v10);
  uint64_t v13 = (char *)&v34 - v12;
  uint64_t v14 = *(void *)(v8 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v11, v15);
  v41 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16, v18);
  unsigned int v21 = (char *)&v34 - v20;
  MEMORY[0x270FA5388](v19, v22);
  int v24 = (char *)&v34 - v23;
  sub_259CEA270(a1, (uint64_t)v42);
  int v25 = swift_dynamicCast();
  __swift_storeEnumTagSinglePayload((uint64_t)v24, v25 ^ 1u, 1, a3);
  uint64_t v38 = v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v21, v40, a3);
  __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, a3);
  uint64_t v39 = TupleTypeMetadata2;
  uint64_t v40 = v14;
  uint64_t v26 = (uint64_t)&v13[*(int *)(TupleTypeMetadata2 + 48)];
  v27 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v27(v13, v24, v8);
  v27((char *)v26, v21, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, a3) != 1)
  {
    v27(v41, v13, v8);
    if (__swift_getEnumTagSinglePayload(v26, 1, a3) != 1)
    {
      uint64_t v30 = v38;
      v31 = v35;
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v35, v26, a3);
      char v29 = sub_259D62628();
      v32 = *(void (**)(char *, uint64_t))(v30 + 8);
      v32(v31, a3);
      v28 = *(void (**)(char *, uint64_t))(v14 + 8);
      v28(v21, v8);
      v32(v41, a3);
      v28(v13, v8);
      goto LABEL_8;
    }
    v28 = *(void (**)(char *, uint64_t))(v14 + 8);
    v28(v21, v8);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v41, a3);
    goto LABEL_6;
  }
  v28 = *(void (**)(char *, uint64_t))(v14 + 8);
  v28(v21, v8);
  if (__swift_getEnumTagSinglePayload(v26, 1, a3) != 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v39);
    char v29 = 0;
    goto LABEL_8;
  }
  v28(v13, v8);
  char v29 = 1;
LABEL_8:
  v28(v24, v8);
  return v29 & 1;
}

uint64_t sub_259CDF270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void **)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  __n128 v9 = *v8;
  *uint64_t v7 = *v8;
  uint64_t v10 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v11 = (void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v10 = *v11;
  v10[1] = v11[1];
  id v12 = v9;
  swift_bridgeObjectRetain();
  return a1;
}

id sub_259CDF310()
{
  return OUTLINED_FUNCTION_2_22();
}

uint64_t sub_259CDF360()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_259CDF408()
{
  uint64_t result = sub_259D62408();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_259CDF4E4(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_259CDF544(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_259CDF578();

  return v2;
}

uint64_t sub_259CDF578()
{
  return sub_259D625A8();
}

uint64_t sub_259CDF5F0()
{
  uint64_t v0 = sub_259D62B08();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_259D62AE8();
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v7 = sub_259D62478();
  MEMORY[0x270FA5388](v7 - 8, v8);
  sub_259CE18D4();
  sub_259D62468();
  v10[1] = MEMORY[0x263F8EE78];
  sub_259CEE3DC(&qword_26A3ECEE8, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECEC8);
  sub_259CEE38C(&qword_26A3ECED0, &qword_26A3ECEC8);
  sub_259D62BD8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F8F130], v0);
  uint64_t result = sub_259D62B38();
  qword_26A3ECC60 = result;
  return result;
}

uint64_t sub_259CDF830(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();

  return swift_bridgeObjectRelease();
}

id sub_259CDF8AC(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_259CDF8E0(a1);
}

id sub_259CDF8E0(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = *(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x50);
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(&v1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x68)], a1, v4);
  v8.receiver = v1;
  v8.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v6;
}

uint64_t PhotosConcatenatedItemList.__deallocating_deinit()
{
  PhotosConcatenatedItemList.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t PhotosConcatenatedItemList.deinit()
{
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(void))(v1 + 8))();
  sub_259D62B68();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15();
  v2();
  sub_259D62B68();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15();
  v3();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_259CDFB88()
{
  return swift_initClassMetadata2();
}

uint64_t UserDefault.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v7 = a1 - 8;
  uint64_t v8 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v7 + 24);
  uint64_t v12 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v32 = v13;
  MEMORY[0x270FA5388](v14, v15);
  uint64_t v17 = (char *)&v31 - v16;
  uint64_t v18 = *(void **)(v4 + *(int *)(v7 + 36));
  uint64_t v19 = (void *)sub_259D62638();
  id v20 = objc_msgSend(v18, sel_objectForKey_, v19);

  if (v20)
  {
    sub_259D62BA8();
    swift_unknownObjectRelease();
    sub_259CEA2CC(v33, v34);
    sub_259CEA2CC(v34, v33);
    int v21 = swift_dynamicCast();
    __swift_storeEnumTagSinglePayload((uint64_t)v17, v21 ^ 1u, 1, v11);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v4, a1);
    if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v11) == 1)
    {
      OUTLINED_FUNCTION_1_14();
      (*(void (**)(uint64_t, char *, uint64_t))(v22 + 16))(a3, v10, v11);
      uint64_t v23 = OUTLINED_FUNCTION_2_11();
      v24(v23);
      return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v17, v12);
    }
    else
    {
      uint64_t v28 = OUTLINED_FUNCTION_2_11();
      v29(v28);
      OUTLINED_FUNCTION_1_14();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 32))(a3, v17, v11);
    }
  }
  else
  {
    OUTLINED_FUNCTION_1_14();
    v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
    return v27(a3, v4, v11);
  }
}

uint64_t sub_259CDFE98()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t static AnyPhotosObservableProperty.subscript.getter@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (uint64_t (*)(uint64_t *, void))swift_readAtKeyPath();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*MEMORY[0x263F8E100] + v3 + 8) - 8) + 16))(a2);
  return v4(&v6, 0);
}

uint64_t sub_259CE004C()
{
  return sub_259CE0074();
}

uint64_t sub_259CE0074()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_259CFBF84();
    return swift_release();
  }
  return result;
}

double static CGRect.unit.getter()
{
  if (qword_26A3EC200 != -1) {
    swift_once();
  }
  return *(double *)&qword_26A3EC020;
}

uint64_t PhotosItemList.firstItem.getter()
{
  OUTLINED_FUNCTION_7_7();
  if (v0() >= 1)
  {
    OUTLINED_FUNCTION_2_19();
    v1();
  }
  OUTLINED_FUNCTION_1_21();
  uint64_t v2 = OUTLINED_FUNCTION_3_15();

  return __swift_storeEnumTagSinglePayload(v2, v3, v4, v5);
}

uint64_t sub_259CE01A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MEMORY[0x25A2EAC90]();
  *a1 = result;
  return result;
}

void sub_259CE01D4()
{
}

uint64_t sub_259CE01EC(char a1)
{
  return a1 & 1;
}

void PhotosBasicItemList.isEmpty.getter()
{
}

BOOL sub_259CE020C(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_259CE021C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_259D62B68();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_259D62B68();
      if (v3 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t sub_259CE0348()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_259CE0454()
{
  return swift_initClassMetadata2();
}

uint64_t sub_259CE04B4()
{
  uint64_t v1 = sub_259D624A8();
  OUTLINED_FUNCTION_0_5();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (void *)((char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void **)(v0 + 16);
  *uint64_t v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v7, *MEMORY[0x263F8F0E0], v1);
  id v9 = v8;
  LOBYTE(v8) = sub_259D624C8();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v7, v1);
  if (v8)
  {
    v12[1] = *(void *)(v0 + 24);
    type metadata accessor for PhotosBasicItemListManager();
    swift_retain();
    swift_getWitnessTable();
    id v11 = PhotosComposedObservable<>.observeChanges(using:)();
    swift_release();
    return (uint64_t)v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_259CE0640()
{
}

void PhotosConcatenatedItemList.loadingStatus.getter()
{
  OUTLINED_FUNCTION_5_2();
  v46 = v1;
  OUTLINED_FUNCTION_7_0();
  uint64_t v42 = v2;
  uint64_t v3 = v0[12];
  sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v43 = v5;
  uint64_t v44 = v4;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v6, v7);
  id v9 = (char *)&v40 - v8;
  uint64_t v45 = v3;
  uint64_t v41 = *(void *)(v3 - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v10, v11);
  OUTLINED_FUNCTION_10_0();
  uint64_t v40 = v12;
  uint64_t v13 = v0[11];
  uint64_t v14 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v16 = v15;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v17, v18);
  id v20 = (char *)&v40 - v19;
  OUTLINED_FUNCTION_0_0();
  uint64_t v22 = v21;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v23, v24);
  uint64_t v26 = (char *)&v40 - v25;
  (*(void (**)(unsigned __int8 *__return_ptr, void))(v0[13] + 112))(&v49, v0[10]);
  OUTLINED_FUNCTION_6_1();
  v27();
  OUTLINED_FUNCTION_13((uint64_t)v20, 1, v13);
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v14);
    uint64_t v29 = v42;
  }
  else
  {
    OUTLINED_FUNCTION_3_3();
    v30();
    unsigned int v31 = v49;
    uint64_t v32 = v42;
    (*(void (**)(unsigned __int8 *__return_ptr, uint64_t))(*(void *)(v42 + 112) + 112))(&v47, v13);
    if (v47 < v31) {
      LOBYTE(v31) = v47;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v26, v13);
    unsigned __int8 v49 = v31;
    uint64_t v29 = v32;
  }
  uint64_t v34 = v43;
  uint64_t v33 = v44;
  OUTLINED_FUNCTION_6_1();
  v35();
  uint64_t v36 = v45;
  OUTLINED_FUNCTION_13((uint64_t)v9, 1, v45);
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v33);
    LOBYTE(v33) = v49;
  }
  else
  {
    uint64_t v38 = v40;
    uint64_t v37 = v41;
    OUTLINED_FUNCTION_3_3();
    v39();
    LODWORD(v33) = v49;
    (*(void (**)(unsigned __int8 *__return_ptr, uint64_t))(*(void *)(v29 + 120) + 112))(&v48, v36);
    if (v48 < v33) {
      LOBYTE(v33) = v48;
    }
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v36);
  }
  unsigned char *v46 = v33;
  OUTLINED_FUNCTION_4_2();
}

void sub_259CE0A20(unsigned char *a1@<X8>)
{
}

void PhotosBasicItemList.loadingStatus.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 40);
}

uint64_t sub_259CE0A50(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_259CE0A8C()
{
  uint64_t result = sub_259D62408();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_259CE0B44()
{
  return PhotosConcatenatedItemList.itemIdentifiers.getter();
}

uint64_t PhotosConcatenatedItemList.itemIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_259CE0B84(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_259CE0BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];

  return MEMORY[0x270F9E078](a1, a2, a3, WitnessTable, v7);
}

double PXDisplayAsset.pixelSize.getter()
{
  id v1 = objc_msgSend(v0, sel_pixelWidth);
  objc_msgSend(v0, sel_pixelHeight);
  return (double)(uint64_t)v1;
}

uint64_t sub_259CE0C8C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  if (v7 <= v10) {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  else {
    unsigned int v11 = v7;
  }
  if (v11 <= 0x7FFFFFFB) {
    unsigned int v12 = 2147483643;
  }
  else {
    unsigned int v12 = v11;
  }
  uint64_t v13 = *(void *)(v6 + 64);
  uint64_t v14 = *(unsigned __int8 *)(v9 + 80);
  if (!a2) {
    return 0;
  }
  uint64_t v15 = AssociatedTypeWitness;
  if (a2 <= v12) {
    goto LABEL_26;
  }
  unint64_t v16 = ((v14 + ((v13 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v14)
      + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  char v17 = 8 * v16;
  if (v16 > 3) {
    goto LABEL_10;
  }
  unsigned int v20 = ((a2 - v12 + ~(-1 << v17)) >> v17) + 1;
  if (HIWORD(v20))
  {
    int v18 = *(_DWORD *)((char *)a1 + v16);
    if (v18) {
      goto LABEL_18;
    }
  }
  else
  {
    if (v20 <= 0xFF)
    {
      if (v20 < 2) {
        goto LABEL_26;
      }
LABEL_10:
      int v18 = *((unsigned __int8 *)a1 + v16);
      if (!*((unsigned char *)a1 + v16)) {
        goto LABEL_26;
      }
LABEL_18:
      int v21 = (v18 - 1) << v17;
      if (v16 > 3) {
        int v21 = 0;
      }
      if (v16)
      {
        if (v16 > 3) {
          LODWORD(v16) = 4;
        }
        switch((int)v16)
        {
          case 2:
            LODWORD(v16) = *a1;
            break;
          case 3:
            LODWORD(v16) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
            break;
          case 4:
            LODWORD(v16) = *(_DWORD *)a1;
            break;
          default:
            LODWORD(v16) = *(unsigned __int8 *)a1;
            break;
        }
      }
      return v12 + (v16 | v21) + 1;
    }
    int v18 = *(unsigned __int16 *)((char *)a1 + v16);
    if (*(unsigned __int16 *)((char *)a1 + v16)) {
      goto LABEL_18;
    }
  }
LABEL_26:
  if (v7 == v12)
  {
    uint64_t v22 = (uint64_t)a1;
    uint64_t v10 = v7;
    uint64_t v15 = v5;
LABEL_35:
    return __swift_getEnumTagSinglePayload(v22, v10, v15);
  }
  uint64_t v23 = (unint64_t *)(((unint64_t)a1 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v11 > 0x7FFFFFFB)
  {
    uint64_t v22 = ((unint64_t)v23 + v14 + 16) & ~v14;
    goto LABEL_35;
  }
  unint64_t v24 = *v23;
  if (v24 >= 0xFFFFFFFF) {
    LODWORD(v24) = -1;
  }
  unsigned int v25 = v24 + 1;
  unsigned int v26 = v24 - 3;
  if (v25 >= 5) {
    return v26;
  }
  else {
    return 0;
  }
}

uint64_t static Logger.photosUI(category:)()
{
  sub_259D62698();
  swift_bridgeObjectRetain();

  return sub_259D62428();
}

void sub_259CE0F94(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  if (v9 <= v12) {
    unsigned int v13 = *(_DWORD *)(v11 + 84);
  }
  else {
    unsigned int v13 = v9;
  }
  if (v13 <= 0x7FFFFFFB) {
    unsigned int v14 = 2147483643;
  }
  else {
    unsigned int v14 = v13;
  }
  uint64_t v15 = *(void *)(v8 + 64);
  uint64_t v16 = *(unsigned __int8 *)(v11 + 80);
  size_t v17 = ((v16 + ((v15 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v16)
      + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  char v18 = 8 * v17;
  if (a3 <= v14)
  {
    int v19 = 0;
  }
  else if (v17 <= 3)
  {
    unsigned int v22 = ((a3 - v14 + ~(-1 << v18)) >> v18) + 1;
    if (HIWORD(v22))
    {
      int v19 = 4;
    }
    else if (v22 >= 0x100)
    {
      int v19 = 2;
    }
    else
    {
      int v19 = v22 > 1;
    }
  }
  else
  {
    int v19 = 1;
  }
  if (v14 >= a2)
  {
    switch(v19)
    {
      case 1:
        a1[v17] = 0;
        if (a2) {
          goto LABEL_27;
        }
        return;
      case 2:
        *(_WORD *)&a1[v17] = 0;
        if (a2) {
          goto LABEL_27;
        }
        return;
      case 3:
LABEL_47:
        __break(1u);
        return;
      case 4:
        *(_DWORD *)&a1[v17] = 0;
        goto LABEL_26;
      default:
LABEL_26:
        if (!a2) {
          return;
        }
LABEL_27:
        if (v9 == v14)
        {
          uint64_t v24 = (uint64_t)a1;
          uint64_t v25 = a2;
          uint64_t v12 = v9;
          uint64_t AssociatedTypeWitness = v7;
        }
        else
        {
          unsigned int v26 = (void *)((unint64_t)&a1[v15 + 7] & 0xFFFFFFFFFFFFFFF8);
          if (v13 <= 0x7FFFFFFB)
          {
            if (a2 > 0x7FFFFFFB)
            {
              *unsigned int v26 = 0;
              v26[1] = 0;
              *(_DWORD *)unsigned int v26 = a2 - 2147483644;
            }
            else
            {
              *unsigned int v26 = (a2 + 3);
            }
            return;
          }
          uint64_t v24 = ((unint64_t)v26 + v16 + 16) & ~v16;
          uint64_t v25 = a2;
        }
        __swift_storeEnumTagSinglePayload(v24, v25, v12, AssociatedTypeWitness);
        break;
    }
  }
  else
  {
    unsigned int v20 = ~v14 + a2;
    if (v17 < 4)
    {
      int v21 = (v20 >> v18) + 1;
      if (v17)
      {
        int v23 = v20 & ~(-1 << v18);
        bzero(a1, v17);
        if (v17 == 3)
        {
          *(_WORD *)a1 = v23;
          a1[2] = BYTE2(v23);
        }
        else if (v17 == 2)
        {
          *(_WORD *)a1 = v23;
        }
        else
        {
          *a1 = v23;
        }
      }
    }
    else
    {
      bzero(a1, v17);
      *(_DWORD *)a1 = v20;
      int v21 = 1;
    }
    switch(v19)
    {
      case 1:
        a1[v17] = v21;
        break;
      case 2:
        *(_WORD *)&a1[v17] = v21;
        break;
      case 3:
        goto LABEL_47;
      case 4:
        *(_DWORD *)&a1[v17] = v21;
        break;
      default:
        return;
    }
  }
}

BOOL OptionSet<>.hasAnyValue(_:)()
{
  return (sub_259D62BB8() & 1) == 0;
}

uint64_t PhotosBasicItemListManager.Mutator.__deallocating_deinit()
{
  PhotosBasicItemListManager.Mutator.deinit();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t PhotosBasicItemListManager.Mutator.deinit()
{
  swift_release();
  return v0;
}

uint64_t static AnyPhotosObservableHosted.subscript.setter(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = a1;
  uint64_t v4 = *(void *)(*a3 + *MEMORY[0x263F8E100] + 8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v7 = (char *)&v23 - v6;
  uint64_t v10 = *(void *)(*(void *)(v8 + v9) + 32);
  uint64_t v13 = *(void *)(v11 + v12);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16, v17);
  int v19 = (char *)&v23 - v18;
  (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v13, v10);
  uint64_t v27 = a2;
  swift_unknownObjectRetain();
  swift_retain();
  unsigned int v20 = (void (*)(unsigned char *, void))swift_readAtKeyPath();
  swift_retain();
  v20(v26, 0);
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v21 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v25, v4);
  swift_setAtReferenceWritableKeyPath();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v21, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v19, AssociatedTypeWitness);
}

BOOL PhotosItemList.isEmpty.getter()
{
  OUTLINED_FUNCTION_7_7();
  return v0() == 0;
}

void sub_259CE15EC()
{
}

void PhotosConcatenatedItemList.numberOfItems.getter()
{
  OUTLINED_FUNCTION_19();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();

  JUMPOUT(0x25A2E8F60);
}

uint64_t sub_259CE16F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)v8 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  }
  else
  {
    uint64_t v9 = *(void *)(v8 + 8);
    *(void *)unint64_t v7 = *(void *)v8;
    *(void *)(v7 + 8) = v9;
    swift_retain();
  }
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))((v7 + *(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (v8 + *(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t PhotosItemListManager.groupBy<A>(options:groupProvider:)()
{
  return PhotosGroupingItemListManager.__allocating_init(inputItemListManager:options:groupProvider:)();
}

uint64_t type metadata accessor for PhotosGroupingItemListManager()
{
  return swift_getGenericMetadata();
}

uint64_t sub_259CE18A8()
{
  return sub_259D62B18();
}

unint64_t sub_259CE18D4()
{
  unint64_t result = qword_26A3ECEF0;
  if (!qword_26A3ECEF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3ECEF0);
  }
  return result;
}

uint64_t PhotosGroupingItemListManager.__allocating_init(inputItemListManager:options:groupProvider:)()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = OUTLINED_FUNCTION_6_9();
  PhotosGroupingItemListManager.init(inputItemListManager:options:groupProvider:)(v1, v2, v3, v4);
  return v0;
}

uint64_t PhotosGroupingItemListManager.init(inputItemListManager:options:groupProvider:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = *(void **)v5;
  uint64_t v10 = *a2;
  *(void *)(v5 + 40) = 0;
  *(void *)(v5 + 48) = 0;
  uint64_t v11 = v9;
  if (qword_26A3ECC68 != -1) {
    swift_once();
  }
  uint64_t v12 = (void *)qword_26A3ECC60;
  *(void *)(v5 + 72) = qword_26A3ECC60;
  *(unsigned char *)(v5 + 80) = 0;
  *(void *)(v5 + 88) = 0;
  uint64_t v13 = v11[10];
  uint64_t v14 = v11[11];
  uint64_t v16 = v11[12];
  uint64_t v15 = v11[13];
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  id v17 = v12;
  uint64_t State = type metadata accessor for PhotosGroupingItemListManager.FetchState();
  *(void *)(v5 + 96) = sub_259CE1B98((uint64_t)v27, State);
  *(void *)(v5 + 16) = v10;
  *(void *)(v5 + 32) = a1;
  *(void *)(v5 + 56) = a3;
  *(void *)(v5 + 64) = a4;
  type metadata accessor for PhotosBasicItemListManager();
  type metadata accessor for PhotosBasicItemList();
  LOBYTE(v27[0]) = 0;
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t v19 = sub_259CE7450();
  uint64_t v20 = PhotosBasicItemList.__allocating_init(items:loadingStatus:)(v19, (char *)v27);
  *(void *)(v5 + 24) = PhotosBasicItemListManager.__allocating_init(itemList:)(v20);
  *(void *)&v27[0] = a1;
  uint64_t v21 = swift_allocObject();
  swift_weakInit();
  unsigned int v22 = (void *)swift_allocObject();
  v22[2] = v13;
  v22[3] = v14;
  v22[4] = v16;
  v22[5] = v15;
  v22[6] = v21;
  uint64_t v23 = (*(uint64_t (**)(uint64_t (*)(uint64_t *), void *, uint64_t))(*(void *)(v16 + 16) + 24))(sub_259CE7494, v22, v13);
  uint64_t v25 = v24;
  swift_release();
  *(void *)(v5 + 40) = v23;
  *(void *)(v5 + 48) = v25;
  swift_unknownObjectRelease();
  sub_259CEDDF0();
  swift_unknownObjectRelease();
  swift_release();
  return v5;
}

uint64_t sub_259CE1B98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  uint64_t v7 = sub_259CE1C80((uint64_t)v6, a2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
  return v7;
}

uint64_t sub_259CE1C80(uint64_t a1, uint64_t a2)
{
  type metadata accessor for os_unfair_lock_s(255);
  sub_259D62CB8();
  uint64_t v4 = sub_259D62CA8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

void sub_259CE1D30(void *a1)
{
  if (*a1)
  {
    swift_release();
    uint64_t v2 = (void *)a1[3];
  }
}

void sub_259CE1D7C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t PhotosBasicItemListManager.__allocating_init(itemList:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  PhotosBasicItemListManager.init(itemList:)(a1);
  return v2;
}

uint64_t PhotosBasicItemList.__deallocating_deinit()
{
  PhotosBasicItemList.deinit();

  return MEMORY[0x270FA0228](v0, 41, 7);
}

uint64_t PhotosBasicItemList.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Comparable.clamped(to:)()
{
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v0, v1);
  OUTLINED_FUNCTION_1_5();
  sub_259D62F38();
  sub_259D62608();
  sub_259D62F48();
  OUTLINED_FUNCTION_23_0();
  return v2();
}

uint64_t PhotosWeakList.init()@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PhotosWeakObjectReference();
  uint64_t result = sub_259D627D8();
  *a1 = result;
  return result;
}

uint64_t PhotosWeakList.objects.getter()
{
  type metadata accessor for PhotosWeakObjectReference();
  sub_259D62878();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t v0 = sub_259D626E8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PhotosWeakSet.init()@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PhotosWeakObjectReference();
  swift_getWitnessTable();
  uint64_t result = sub_259D624F8();
  *a1 = result;
  return result;
}

uint64_t PhotosWeakSet.objects.getter()
{
  type metadata accessor for PhotosWeakObjectReference();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_259D62968();
  swift_getWitnessTable();
  uint64_t v0 = sub_259D626E8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t type metadata accessor for PhotosWeakObjectReference()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for PhotosItemListChangeDetails(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v3;
  id v4 = v3;
  return a1;
}

uint64_t sub_259CE21D8()
{
  return sub_259CE21F4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_259CE21F4(uint64_t a1, uint64_t a2)
{
  return sub_259CE2230(a2);
}

uint64_t sub_259CE2230(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v1 + 16) = a1;
  swift_retain();
  sub_259CE2288(v2);
  swift_release();

  return swift_release();
}

id sub_259CE2288(uint64_t a1)
{
  uint64_t v3 = PhotosBasicItemListManager.itemList.getter();
  id result = (id)swift_release();
  if (v3 != a1)
  {
    uint64_t v5 = *(void **)(v1 + 48);
    return objc_msgSend(v5, sel_signalChange_, 1);
  }
  return result;
}

uint64_t PhotosBasicItemListManager.itemList.getter()
{
  return swift_retain();
}

uint64_t sub_259CE234C()
{
  return sub_259D623E8();
}

uint64_t PhotosWeakList.append(_:)()
{
  swift_unknownObjectRetain();
  PhotosWeakObjectReference.init(_:)((uint64_t)&v3);
  uint64_t v1 = type metadata accessor for PhotosWeakObjectReference();
  sub_259D62878();
  sub_259D62818();
  uint64_t result = MEMORY[0x25A2E8F60](*v0, v1);
  if (!(result % 100)) {
    return sub_259D07CE8();
  }
  return result;
}

uint64_t sub_259CE2450(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakTakeInit();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t PhotosWeakObjectReference.init(_:)@<X0>(uint64_t a1@<X8>)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  uint64_t v2 = sub_259D62618();
  uint64_t result = swift_unknownObjectRelease();
  *(void *)(a1 + 8) = v2;
  return result;
}

id __PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = _PXFontWithTextStyleSymbolicTraits(*(void *)(a1 + 32), *(unsigned int *)(a1 + 56), *(void *)(a1 + 40));
  uint64_t v3 = NSNumber;
  [v2 _scaledValueForValue:*(double *)(a1 + 48)];
  id v4 = objc_msgSend(v3, "numberWithDouble:");

  return v4;
}

double PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits(uint64_t a1, unint64_t a2, uint64_t a3, double a4)
{
  if (PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_onceToken != -1) {
    dispatch_once(&PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_onceToken, &__block_literal_global_5202);
  }
  unint64_t v8 = UserPreferredContentSizeCategory();
  uint64_t v9 = UIContentSizeCategoryFromPXPreferredContentSizeCategory(a2);
  if (v9 != (void *)*MEMORY[0x263F83490]
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, (UIContentSizeCategory)v9) == NSOrderedDescending)
  {
    id v10 = v9;

    unint64_t v8 = v10;
  }
  uint64_t v11 = [NSString stringWithFormat:@"PXFontScaledValue-%@-%.3f-%ld-%d", v8, *(void *)&a4, a1, a3];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_block_invoke_2;
  v16[3] = &__block_descriptor_60_e15___NSNumber_8__0l;
  int v17 = a3;
  v16[4] = a1;
  v16[5] = a2;
  *(double *)&v16[6] = a4;
  uint64_t v12 = objc_msgSend((id)PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_cache, "px_objectForKey:usingPromise:", v11, v16);
  [v12 doubleValue];
  double v14 = v13;

  return v14;
}

id _PXFontWithTextStyleSymbolicTraits(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = UIFontTextStyleFromPXFontTextStyle(a1);
  UIContentSizeCategoryFromPXPreferredContentSizeCategory(a3);
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  UserPreferredContentSizeCategory();
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = v7;
  if (v6 == (NSString *)*MEMORY[0x263F83490] || UIContentSizeCategoryCompareToCategory(v7, v6) != NSOrderedDescending)
  {
    uint64_t v11 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v5 addingSymbolicTraits:a2 options:0];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263F81720];
    id v10 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:v6];
    uint64_t v11 = [v9 preferredFontDescriptorWithTextStyle:v5 compatibleWithTraitCollection:v10];

    if (a2)
    {
      uint64_t v12 = objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v11, "symbolicTraits") | a2);

      uint64_t v11 = (void *)v12;
    }
  }
  double v13 = [MEMORY[0x263F81708] fontWithDescriptor:v11 size:0.0];

  return v13;
}

id UserPreferredContentSizeCategory()
{
  if (*MEMORY[0x263F83300])
  {
    uint64_t v0 = [(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
  }
  else
  {
    uint64_t v1 = [MEMORY[0x263F82B60] mainScreen];
    uint64_t v2 = [v1 traitCollection];
    uint64_t v0 = [v2 preferredContentSizeCategory];
  }

  return v0;
}

id UIContentSizeCategoryFromPXPreferredContentSizeCategory(unint64_t a1)
{
  if (a1 > 0xC)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = **((id **)&unk_26545AE58 + a1);
  }
  return v2;
}

__CFString *_PXFontTextStyleString(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t v1 = @"Undefined";
      break;
    case 1:
      id v2 = (id *)MEMORY[0x263F835E0];
      goto LABEL_16;
    case 2:
      id v2 = (id *)MEMORY[0x263F83610];
      goto LABEL_16;
    case 3:
      id v2 = (id *)MEMORY[0x263F83618];
      goto LABEL_16;
    case 4:
      id v2 = (id *)MEMORY[0x263F83628];
      goto LABEL_16;
    case 5:
      id v2 = (id *)MEMORY[0x263F835D0];
      goto LABEL_16;
    case 6:
      id v2 = (id *)MEMORY[0x263F835E8];
      goto LABEL_16;
    case 7:
      id v2 = (id *)MEMORY[0x263F835F0];
      goto LABEL_16;
    case 8:
      id v2 = (id *)MEMORY[0x263F83570];
      goto LABEL_16;
    case 9:
      id v2 = (id *)MEMORY[0x263F83580];
      goto LABEL_16;
    case 10:
      id v2 = (id *)MEMORY[0x263F835B8];
      goto LABEL_16;
    case 11:
      id v2 = (id *)MEMORY[0x263F83588];
      goto LABEL_16;
    case 12:
      id v2 = (id *)MEMORY[0x263F83590];
LABEL_16:
      uint64_t v1 = (__CFString *)*v2;
      break;
    default:
      uint64_t v1 = 0;
      break;
  }

  return v1;
}

__CFString *UIFontTextStyleFromPXFontTextStyle(uint64_t a1)
{
  if (a1)
  {
    return _PXFontTextStyleString(a1);
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F08690] currentHandler];
    id v4 = [NSString stringWithUTF8String:"UIFontTextStyle  _Nonnull UIFontTextStyleFromPXFontTextStyle(PXFontTextStyle)"];
    [v3 handleFailureInFunction:v4 file:@"PXFont.m" lineNumber:163 description:@"Invalid text style"];

    uint64_t v5 = @"Undefined";
    return @"Undefined";
  }
}

uint64_t sub_259CE2B20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return static PhotosObjectReference.== infix(_:_:)(a1, a2, a3, WitnessTable) & 1;
}

uint64_t static PhotosObjectReference.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9, v12);
  double v14 = (char *)&v29 - v13;
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 48);
  uint64_t v30 = v16(v17, v15);
  uint64_t v18 = a2;
  uint64_t v19 = v16(a3, a4);
  uint64_t v29 = v8;
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v20(v14, a1, a3);
  v20(v11, v18, a3);
  if (v30 != v19)
  {
LABEL_7:
    uint64_t v26 = 0;
    goto LABEL_8;
  }
  uint64_t v21 = *(uint64_t (**)(uint64_t))(a4 + 40);
  uint64_t v22 = OUTLINED_FUNCTION_1_3();
  uint64_t v23 = v21(v22);
  uint64_t v24 = OUTLINED_FUNCTION_1_3();
  uint64_t v25 = v21(v24);
  uint64_t v26 = v25;
  if (!v23)
  {
    if (!v25)
    {
      swift_unknownObjectRelease();
      uint64_t v26 = 1;
      goto LABEL_8;
    }
    swift_unknownObjectRelease();
    goto LABEL_7;
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v26) {
    uint64_t v26 = v23 == v26;
  }
LABEL_8:
  uint64_t v27 = *(void (**)(char *, uint64_t))(v29 + 8);
  v27(v11, a3);
  v27(v14, a3);
  return v26;
}

uint64_t sub_259CE2D8C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakCopyInit();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t PhotosWeakObjectReference.objectIdentifierHash.getter()
{
  return *(void *)(v0 + 8);
}

void PhotosWeakObjectReference.objectIfExists.getter()
{
}

_OWORD *sub_259CE2DD4(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  id v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_259CE3470(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECF20);
  if ((sub_259D62DA8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_259CE3470(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = (_OWORD *)sub_259D62F58();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = (_OWORD *)(v15[7] + 32 * v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    return sub_259CEA2CC(a1, v16);
  }
  else
  {
    sub_259D00FF4(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

Swift::Void __swiftcall PhotosEnvironmentValues.takeValues(from:)(PhotosUIFoundation::PhotosEnvironmentValues from)
{
  id v2 = v1;
  uint64_t v3 = *(void *)from.values._rawValue;
  uint64_t v30 = v3 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(v3 + 64);
  int64_t v31 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v32 = v3;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  if (!v6) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v9 = v8 | (v7 << 6);
LABEL_5:
  uint64_t v10 = *(void *)(v32 + 56);
  unint64_t v11 = (void *)(*(void *)(v32 + 48) + 16 * v9);
  uint64_t v12 = v11[1];
  *(void *)&long long v34 = *v11;
  *((void *)&v34 + 1) = v12;
  sub_259CEA270(v10 + 32 * v9, (uint64_t)v35);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_259CE35FC((uint64_t)&v34, (uint64_t)&v36);
    uint64_t v16 = v37;
    if (!v37)
    {
      swift_release();
      return;
    }
    uint64_t v17 = v36;
    sub_259CEA2CC(&v38, &v34);
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = (void *)*v2;
    uint64_t v33 = (void *)*v2;
    *id v2 = 0x8000000000000000;
    unint64_t v19 = sub_259CE3470(v17, v16);
    if (__OFADD__(v18[2], (v20 & 1) == 0)) {
      break;
    }
    unint64_t v21 = v19;
    char v22 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECF20);
    if (sub_259D62DA8())
    {
      unint64_t v23 = sub_259CE3470(v17, v16);
      if ((v22 & 1) != (v24 & 1)) {
        goto LABEL_40;
      }
      unint64_t v21 = v23;
    }
    if (v22)
    {
      uint64_t v25 = (_OWORD *)(v33[7] + 32 * v21);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      sub_259CEA2CC(&v34, v25);
    }
    else
    {
      v33[(v21 >> 6) + 8] |= 1 << v21;
      uint64_t v26 = (uint64_t *)(v33[6] + 16 * v21);
      *uint64_t v26 = v17;
      v26[1] = v16;
      sub_259CEA2CC(&v34, (_OWORD *)(v33[7] + 32 * v21));
      uint64_t v27 = v33[2];
      BOOL v28 = __OFADD__(v27, 1);
      uint64_t v29 = v27 + 1;
      if (v28) {
        goto LABEL_37;
      }
      _OWORD v33[2] = v29;
      swift_bridgeObjectRetain();
    }
    *id v2 = v33;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_4;
    }
LABEL_6:
    int64_t v13 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_38;
    }
    if (v13 < v31)
    {
      unint64_t v14 = *(void *)(v30 + 8 * v13);
      if (v14) {
        goto LABEL_9;
      }
      int64_t v15 = v7 + 2;
      ++v7;
      if (v13 + 1 < v31)
      {
        unint64_t v14 = *(void *)(v30 + 8 * v15);
        if (v14) {
          goto LABEL_12;
        }
        int64_t v7 = v13 + 1;
        if (v13 + 2 < v31)
        {
          unint64_t v14 = *(void *)(v30 + 8 * (v13 + 2));
          if (v14)
          {
            v13 += 2;
            goto LABEL_9;
          }
          int64_t v15 = v13 + 3;
          int64_t v7 = v13 + 2;
          if (v13 + 3 < v31)
          {
            unint64_t v14 = *(void *)(v30 + 8 * v15);
            if (!v14)
            {
              while (1)
              {
                int64_t v13 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_39;
                }
                if (v13 >= v31)
                {
                  int64_t v7 = v31 - 1;
                  goto LABEL_23;
                }
                unint64_t v14 = *(void *)(v30 + 8 * v13);
                ++v15;
                if (v14) {
                  goto LABEL_9;
                }
              }
            }
LABEL_12:
            int64_t v13 = v15;
LABEL_9:
            unint64_t v6 = (v14 - 1) & v14;
            unint64_t v9 = __clz(__rbit64(v14)) + (v13 << 6);
            int64_t v7 = v13;
            goto LABEL_5;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = 0;
    memset(v35, 0, sizeof(v35));
    long long v34 = 0u;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  sub_259D62F58();
  __break(1u);
}

uint64_t PhotosEnvironmentValues.subscript.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11, v12);
  unint64_t v14 = (char *)v19 - v13;
  uint64_t v15 = *v3;
  OUTLINED_FUNCTION_2_5();
  uint64_t v16 = sub_259CE35C8();
  sub_259CE340C(v16, v17, v15, v19);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(qword_26A3EC4B0);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a3, v14, AssociatedTypeWitness);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, AssociatedTypeWitness);
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v14, v8);
  }
}

double sub_259CE340C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_259CE3470(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_259CEA270(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

unint64_t sub_259CE3470(uint64_t a1, uint64_t a2)
{
  sub_259D62FC8();
  OUTLINED_FUNCTION_2_5();
  sub_259D62678();
  uint64_t v4 = sub_259D62FE8();

  return sub_259CE34E4(a1, a2, v4);
}

unint64_t sub_259CE34E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_259D62EE8() & 1) == 0)
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
      while (!v14 && (sub_259D62EE8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_259CE35C8()
{
  return sub_259D62668();
}

uint64_t sub_259CE35FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3EC4A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id PXMap(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = a2;
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (uint64_t v5 = [v3 performSelector:sel_count]) != 0)
    {
      uint64_t v6 = [MEMORY[0x263EFF980] arrayWithCapacity:v5];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263EFF980] array];
    }
    char v7 = (void *)v6;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * i));
          if (v13) {
            objc_msgSend(v7, "addObject:", v13, (void)v15);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

void px_perform_on_main_runloop(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void px_perform_on_main_runloop(PXRunloopOrder, __strong dispatch_block_t _Nonnull)");
    [v10 handleFailureInFunction:v11, @"NSRunLoop+PhotosUIFoundation.m", 33, @"Invalid parameter not satisfying: %@", @"block != nil" file lineNumber description];
  }
  if (a1 == 1) {
    uint64_t v4 = 1999999;
  }
  else {
    uint64_t v4 = 0;
  }
  if (a1 == 2) {
    uint64_t v5 = 2000001;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = [MEMORY[0x263EFF9F0] mainRunLoop];
  uint64_t v7 = objc_opt_class();
  id v8 = _Block_copy(v3);
  v12[0] = *MEMORY[0x263EFF588];
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [v6 performSelector:sel_perform_ target:v7 argument:v8 order:v5 modes:v9];
}

void sub_259CE6004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_259CE61C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_259CE64AC(uint64_t result, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t, uint64_t))(v2
                                               + OBJC_IVAR____TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation_changeHandler);
  if (v3)
  {
    uint64_t v5 = result;
    swift_retain();
    v3(v5, a2);
    return sub_259CE6788((uint64_t)v3);
  }
  return result;
}

id PhotosComposedObservable<>.observeChanges(using:)()
{
  OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_7_8();
  v4();
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v1;
  v5[3] = v0;
  v5[4] = v3;
  v5[5] = v2;
  id v6 = objc_allocWithZone((Class)type metadata accessor for PXObservableObservation());
  swift_retain();
  id v7 = v10;
  swift_retain();
  id v8 = sub_259CE667C(v7, (uint64_t)sub_259CE6798, (uint64_t)v5);

  swift_release();
  return v8;
}

id PXObservable.observeChanges(using:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for PXObservableObservation());
  id v6 = v2;
  swift_retain();
  return sub_259CE667C(v6, a1, a2);
}

id sub_259CE667C(void *a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectWeakInit();
  id v7 = (uint64_t *)&v3[OBJC_IVAR____TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation_changeHandler];
  *id v7 = 0;
  v7[1] = 0;
  swift_unknownObjectWeakAssign();
  uint64_t v8 = *v7;
  *id v7 = a2;
  v7[1] = a3;
  swift_retain();
  sub_259CE6788(v8);
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for PXObservableObservation();
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  objc_msgSend(a1, sel_registerChangeObserver_context_, v9, 0);

  swift_release();
  return v9;
}

uint64_t type metadata accessor for PXObservableObservation()
{
  return self;
}

uint64_t sub_259CE6788(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_259CE6798(uint64_t a1, uint64_t a2)
{
  return sub_259CE67A4(a1, a2, *(void (**)(char *))(v2 + 32));
}

uint64_t sub_259CE67A4(uint64_t a1, uint64_t a2, void (*a3)(char *))
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness, v7);
  id v9 = (char *)v11 - v8;
  v11[1] = a2;
  swift_getAssociatedConformanceWitness();
  sub_259D63068();
  a3(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, AssociatedTypeWitness);
}

uint64_t PhotosItemListManagerChangeDescriptor.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_259CE6964@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return PhotosItemListManagerChangeDescriptor.init(rawValue:)(*a1, a2);
}

void *PhotosBasicItemListManager.init(itemList:)(uint64_t a1)
{
  OUTLINED_FUNCTION_1_8();
  uint64_t v4 = v3;
  type metadata accessor for PhotosBasicItemList();
  uint64_t v5 = sub_259CE7450();
  char v10 = 2;
  v1[2] = PhotosBasicItemList.__allocating_init(items:loadingStatus:)(v5, &v10);
  type metadata accessor for PhotosItemListChangeDetailsRepository();
  swift_allocObject();
  uint64_t v6 = PhotosItemListChangeDetailsRepository.init(countLimit:)(100);
  v1[4] = 0;
  v1[5] = 0;
  v1[3] = v6;
  v1[6] = objc_msgSend(objc_allocWithZone((Class)PXObservable), sel_init);
  sub_259D623F8();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v1;
  *(void *)(v7 + 24) = a1;
  swift_retain();
  swift_retain();
  uint64_t WitnessTable = swift_getWitnessTable();
  PhotosMutableComposedObservable<>.performChanges(using:)((uint64_t)sub_259CEAAA0, v7, v4, WitnessTable);
  swift_release();
  swift_release();
  return v1;
}

uint64_t type metadata accessor for PhotosBasicItemList()
{
  return __swift_instantiateGenericMetadata();
}

void PhotosMutableComposedObservable<>.performChanges(using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v12, v13);
  OUTLINED_FUNCTION_7_8();
  v14();
  long long v15 = (void *)aBlock[6];
  OUTLINED_FUNCTION_4_12();
  v16();
  unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  long long v18 = (char *)swift_allocObject();
  *((void *)v18 + 2) = a3;
  *((void *)v18 + 3) = a4;
  *((void *)v18 + 4) = a1;
  *((void *)v18 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v18[v17], (char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
  aBlock[4] = sub_259CEA3BC;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_259CEA34C;
  aBlock[3] = &block_descriptor_7;
  unint64_t v19 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v15, sel_performChanges_, v19);
  _Block_release(v19);
}

id sub_259CE6E24@<X0>(void *a1@<X8>)
{
  id result = PhotosBasicItemListManager.observable.getter();
  *a1 = result;
  return result;
}

id PhotosBasicItemListManager.observable.getter()
{
  return *(id *)(v0 + 48);
}

uint64_t type metadata accessor for PhotosItemListChangeDetailsRepository()
{
  return self;
}

uint64_t PhotosItemListChangeDetailsRepository.init(countLimit:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECF18);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 24) = 0;
  *(void *)(v3 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v1 + 16) = a1;
  *(void *)(v1 + 24) = v3;
  return v1;
}

uint64_t PhotosBasicItemList.__allocating_init(items:loadingStatus:)(uint64_t a1, char *a2)
{
  uint64_t v4 = swift_allocObject();
  PhotosBasicItemList.init(items:loadingStatus:)(a1, a2);
  return v4;
}

void *PhotosBasicItemList.init(items:loadingStatus:)(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  char v6 = *a2;
  uint64_t Unique = PXDataSourceIdentifierMakeUnique();
  v3[2] = a1;
  v3[3] = Unique;
  *((unsigned char *)v3 + 40) = v6;
  v14[5] = a1;
  v14[2] = *(void *)(v5 + 80);
  v14[3] = *(void *)(v5 + 88);
  uint64_t v8 = sub_259D62878();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_bridgeObjectRetain();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v12 = sub_259CE704C((void (*)(char *, uint64_t))sub_259CE740C, (uint64_t)v14, v8, AssociatedTypeWitness, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v11);
  swift_bridgeObjectRelease();
  v3[4] = v12;
  return v3;
}

uint64_t sub_259CE704C(void (*a1)(char *, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v49 = a5;
  uint64_t v50 = a8;
  v56 = a1;
  uint64_t v57 = a2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v48 = v9;
  MEMORY[0x270FA5388](v10, v11);
  OUTLINED_FUNCTION_2_0();
  uint64_t v58 = v12;
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v59 = v13;
  uint64_t v16 = MEMORY[0x270FA5388](v14, v15);
  v52 = (char *)&v44 - v17;
  MEMORY[0x270FA5388](v16, v18);
  OUTLINED_FUNCTION_2_0();
  uint64_t v53 = v19;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v51 = v21;
  uint64_t v24 = MEMORY[0x270FA5388](v22, v23);
  unsigned __int8 v47 = (char *)&v44 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24, v26);
  BOOL v28 = (char *)&v44 - v27;
  uint64_t v29 = sub_259D629F8();
  if (!v29) {
    return sub_259D627D8();
  }
  uint64_t v30 = v29;
  uint64_t v45 = AssociatedTypeWitness;
  uint64_t v62 = sub_259D624E8();
  uint64_t v54 = sub_259D62D68();
  sub_259D62D08();
  v46 = v28;
  uint64_t result = sub_259D629E8();
  if (v30 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v32 = (void (**)(char *))(v59 + 16);
    uint64_t v55 = v59 + 8;
    uint64_t v59 = a6;
    uint64_t v33 = v52;
    long long v34 = v46;
    while (1)
    {
      v35 = (void (*)(char *, void))sub_259D62AA8();
      (*v32)(v33);
      v35(v61, 0);
      uint64_t v36 = v60;
      v56(v33, v58);
      if (v36) {
        break;
      }
      uint64_t v60 = 0;
      uint64_t v37 = OUTLINED_FUNCTION_1_1();
      v38(v37);
      sub_259D62D48();
      sub_259D62A18();
      if (!--v30)
      {
        uint64_t v39 = v51;
        uint64_t v40 = v47;
        uint64_t v41 = v45;
        (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v47, v34, v45);
        sub_259D62BE8();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v41);
        return v62;
      }
    }
    uint64_t v42 = OUTLINED_FUNCTION_1_1();
    v43(v42);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v34, v45);
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 32))(v50, v58, v49);
  }
  return result;
}

uint64_t sub_259CE740C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 64))(*(void *)(v0 + 16));
}

uint64_t sub_259CE7450()
{
  return sub_259D627D8();
}

uint64_t sub_259CE7494(uint64_t *a1)
{
  return sub_259CE74A4(a1);
}

uint64_t sub_259CE74A4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (v1) {
      sub_259CEDDF0();
    }
    return swift_release();
  }
  return result;
}

id sub_259CE751C@<X0>(void *a1@<X8>)
{
  id result = PhotosConcatenatedItemListManager.observable.getter();
  *a1 = result;
  return result;
}

id PhotosConcatenatedItemListManager.observable.getter()
{
  return *(id *)(v0 + 72);
}

id PFAssetsDataSourceCountsGetLog()
{
  if (PFAssetsDataSourceCountsGetLog_predicate != -1) {
    dispatch_once(&PFAssetsDataSourceCountsGetLog_predicate, &__block_literal_global_632);
  }
  uint64_t v0 = (void *)PFAssetsDataSourceCountsGetLog_log;

  return v0;
}

uint64_t sub_259CE7EEC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_259CE7F08(a1, a2);
}

uint64_t sub_259CE7F08@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(v2 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v2 + *MEMORY[0x263F8DD00]) - 8) + 16))(a2);
}

uint64_t sub_259CE7F9C(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    *(void *)a1 = *(void *)a2;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    uint64_t v4 = *(void **)(a2 + 24);
    uint64_t v3 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = v3;
    swift_retain();
    id v5 = v4;
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  return a1;
}

double PXPointSubtract(double a1, double a2, double a3)
{
  return a1 - a3;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_259CE809C(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t dispatch thunk of PhotosItemList.numberOfItems.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t PhotosItemListChangeDetails.init(from:to:itemChangeDetails:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

double CGSize.scaled(by:)(double a1, double a2)
{
  return a1 * a2;
}

double CGSize.roundedToPixel(screenScale:)(double a1, double a2, double a3)
{
  return PXSizeRoundToPixel(a2, a3, a1);
}

uint64_t dispatch thunk of PhotosItemListChangeDetailsRepository.append(changeDetails:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

BOOL PXEdgeInsetsEqualToEdgeInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a2 == a6 && a1 == a5 && a4 == a8 && a3 == a7;
}

double PXEdgeInsetsInsetSize(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 - (a4 + a6);
}

uint64_t UserDefault.init(key:defaultValue:userDefaults:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = type metadata accessor for UserDefault();
  uint64_t v13 = (void *)(a6 + *(int *)(v12 + 32));
  *uint64_t v13 = a1;
  v13[1] = a2;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(a6, a3, a5);
  *(void *)(a6 + *(int *)(v12 + 28)) = a4;
  return result;
}

uint64_t type metadata accessor for UserDefault()
{
  return __swift_instantiateGenericMetadata();
}

double PXRectWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 + a3 * -0.5;
}

uint64_t sub_259CE82E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t PhotosItemListChangeDetails.fromItemListVersion.getter()
{
  return *(void *)v0;
}

uint64_t sub_259CE82F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t PhotosItemList.item(for:)()
{
  OUTLINED_FUNCTION_8_5();
  v0();
  if ((v1 & 1) == 0)
  {
    OUTLINED_FUNCTION_2_19();
    v2();
  }
  OUTLINED_FUNCTION_1_21();
  uint64_t v3 = OUTLINED_FUNCTION_3_15();

  return __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
}

void PhotosConcatenatedItem.id.getter()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v1 = *(void *)(v0 + 24);
  OUTLINED_FUNCTION_0_0();
  uint64_t v27 = v2;
  uint64_t v5 = *(void *)(MEMORY[0x270FA5388](v3, v4) + 32);
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = *(void *)(MEMORY[0x270FA5388](v6, v7) + 16);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v9, v10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v11, v12);
  uint64_t v14 = OUTLINED_FUNCTION_2_4(v13, v27);
  v15(v14);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      OUTLINED_FUNCTION_3_3();
      v17();
      OUTLINED_FUNCTION_24();
      v18(v1);
      uint64_t v19 = OUTLINED_FUNCTION_31();
    }
    else
    {
      OUTLINED_FUNCTION_3_3();
      v25();
      OUTLINED_FUNCTION_24();
      v26(v5);
      uint64_t v19 = OUTLINED_FUNCTION_20();
    }
    v20(v19);
  }
  else
  {
    OUTLINED_FUNCTION_3_3();
    v21();
    OUTLINED_FUNCTION_24();
    v22(v8);
    uint64_t v23 = OUTLINED_FUNCTION_9_0();
    v24(v23);
  }
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_259CE8654(uint64_t a1, unsigned __int8 *a2, void *a3)
{
  uint64_t v4 = *(void *)(a3[2] - 8);
  unint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(void *)(a3[3] - 8);
  if (*(void *)(v6 + 64) > v5) {
    unint64_t v5 = *(void *)(v6 + 64);
  }
  uint64_t v7 = *(void *)(a3[4] - 8);
  if (*(void *)(v7 + 64) <= v5) {
    unint64_t v8 = v5;
  }
  else {
    unint64_t v8 = *(void *)(v7 + 64);
  }
  unsigned int v9 = a2[v8];
  unsigned int v10 = v9 - 3;
  if (v9 >= 3)
  {
    if (v8 <= 3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *a2;
        goto LABEL_15;
      case 2:
        int v12 = *(unsigned __int16 *)a2;
        goto LABEL_15;
      case 3:
        int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_15;
      case 4:
        int v12 = *(_DWORD *)a2;
LABEL_15:
        int v13 = (v12 | (v10 << (8 * v8))) + 3;
        unsigned int v9 = v12 + 3;
        if (v8 < 4) {
          unsigned int v9 = v13;
        }
        break;
      default:
        break;
    }
  }
  if (v9)
  {
    if (v9 == 2)
    {
      char v14 = 2;
      uint64_t v4 = *(void *)(a3[4] - 8);
    }
    else
    {
      char v14 = 1;
      uint64_t v4 = *(void *)(a3[3] - 8);
    }
  }
  else
  {
    char v14 = 0;
  }
  (*(void (**)(uint64_t))(v4 + 16))(a1);
  *(unsigned char *)(a1 + v8) = v14;
  return a1;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return type metadata accessor for PhotosConcatenatedItem();
}

uint64_t OUTLINED_FUNCTION_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_unknownObjectRetain();
}

void *OUTLINED_FUNCTION_0_4(void *a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  return sub_259CFAF68(a1, a2, 1, v7, a5, a6, a7);
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return PhotosItemListManager.forceMetadata(for:)(v0, v1);
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  return 0;
}

void *OUTLINED_FUNCTION_0_12@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

double OUTLINED_FUNCTION_0_13(double *a1, double a2, double a3)
{
  double result = *a1 - a2;
  double v4 = a1[1] - a3;
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_15(double a1, double a2)
{
  return MEMORY[0x270F9FFE8](a1 * a2);
}

void OUTLINED_FUNCTION_1(void *a1@<X8>)
{
  *a1 = v1;
}

char *OUTLINED_FUNCTION_1_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return v0;
}

__n128 OUTLINED_FUNCTION_1_6(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return swift_getAssociatedTypeWitness();
}

__n128 OUTLINED_FUNCTION_1_10(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_12@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(v3 - 112) = result;
  *(void *)(v3 - 96) = a2;
  *(void *)(v3 - 88) = a3;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_13()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t OUTLINED_FUNCTION_1_15()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t OUTLINED_FUNCTION_1_17()
{
  return sub_259D62E48();
}

double OUTLINED_FUNCTION_1_18(double *a1, double a2, double a3)
{
  double result = *a1 + a2;
  double v4 = a1[1] + a3;
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_19()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_21()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_1_24(uint64_t a1)
{
  return MEMORY[0x270F9F308](a1, v1);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return sub_259D62DD8();
}

BOOL OUTLINED_FUNCTION_2_1@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

void OUTLINED_FUNCTION_2_2()
{
  JUMPOUT(0x25A2EABA0);
}

void *OUTLINED_FUNCTION_2_3@<X0>(unint64_t a1@<X8>)
{
  return sub_259CFB06C((void *)(a1 > 1), v2, 1, v1);
}

char *OUTLINED_FUNCTION_2_4@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return 16;
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return v1 + v0;
}

uint64_t OUTLINED_FUNCTION_2_10(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  return v0;
}

__n128 OUTLINED_FUNCTION_2_12(__n128 *a1)
{
  __n128 result = v1[1];
  a1[1] = result;
  a1[2].n128_u64[0] = v1[2].n128_u64[0];
  return result;
}

uint64_t OUTLINED_FUNCTION_2_16(int a1)
{
  if (a1) {
    return 0;
  }
  else {
    return v1;
  }
}

void OUTLINED_FUNCTION_2_17()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_2_20()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_21()
{
  return 0;
}

id OUTLINED_FUNCTION_2_22()
{
  return PhotosComposedObservable<>.observeChanges(using:)();
}

uint64_t OUTLINED_FUNCTION_2_23()
{
  return 0x6E6F6974636573;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0 - 120;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return 48;
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  return v0;
}

__n128 *OUTLINED_FUNCTION_3_12(__n128 *result, __n128 a2)
{
  *__n128 result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_13()
{
  return v0;
}

void OUTLINED_FUNCTION_3_14()
{
  sub_259CEE754(v0, v1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_3_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_18(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9F448](a1, a2, v2);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = v2;
}

void OUTLINED_FUNCTION_4_1()
{
  *(void *)(v0 + 16) = v2;
  uint64_t v5 = v0 + 16 * v4;
  *(void *)(v5 + 32) = v1;
  *(void *)(v5 + 40) = v3;
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return v0;
}

double OUTLINED_FUNCTION_4_9(double a1, double a2, double a3)
{
  return a1 * a3;
}

id OUTLINED_FUNCTION_4_10()
{
  return sub_259CEE7AC(v0, v1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_4_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t OUTLINED_FUNCTION_4_13()
{
  return 1835365481;
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  void *v1 = a1;
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t result)
{
  *v1 &= result;
  return result;
}

void *OUTLINED_FUNCTION_5_1()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_259CFB06C(0, v2, 1, v0);
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return v0;
}

double OUTLINED_FUNCTION_5_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_5_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t OUTLINED_FUNCTION_5_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return sub_259D21414();
}

double OUTLINED_FUNCTION_8_4()
{
  return v0;
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

uint64_t OUTLINED_FUNCTION_7_1()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_4(uint64_t result)
{
  *(void *)(result + 16) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return sub_259D62E18();
}

void OUTLINED_FUNCTION_6_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

void OUTLINED_FUNCTION_6_4(uint64_t a1@<X8>)
{
  *(void *)(v2 - 104) = a1 - (v1 & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return swift_bridgeObjectRetain();
}

double OUTLINED_FUNCTION_6_7(double a1, double a2, double a3)
{
  return a1 - a3;
}

uint64_t OUTLINED_FUNCTION_6_8()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_10()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_6_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return v0;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void OUTLINED_FUNCTION_10()
{
  *(void *)(v1 + 16) = v0;
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return v0;
}

double OUTLINED_FUNCTION_10_3(double a1)
{
  return round(a1);
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return v0;
}

double OUTLINED_FUNCTION_12_1(double a1, double a2, double a3)
{
  return a1 / a3;
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return v0;
}

double OUTLINED_FUNCTION_9_2()
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  return CGRectGetMidY(*(CGRect *)&v5);
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return v0;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return v0;
}

uint64_t PXDataSourceIdentifierMakeUnique()
{
  return (int)atomic_fetch_add(uniqueDataSourceIdentifier, 1u);
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

void OUTLINED_FUNCTION_26(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 240) = (char *)&a2 - a1;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_259CE9E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PhotosItemList.index(for:)(a1, a2, a3);
}

uint64_t PhotosItemList.index(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v40 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9, v10);
  int v12 = (char *)&v39 - v11;
  uint64_t v43 = a3;
  uint64_t v42 = a2;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v41 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v44 = v15;
  uint64_t v18 = MEMORY[0x270FA5388](v16, v17);
  uint64_t v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18, v21);
  uint64_t v23 = (char *)&v39 - v22;
  OUTLINED_FUNCTION_0_0();
  uint64_t v45 = v24;
  MEMORY[0x270FA5388](v25, v26);
  BOOL v28 = (char *)&v39 - v27;
  sub_259CEA270(a1, (uint64_t)v47);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, AssociatedTypeWitness);
    (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 64))(AssociatedTypeWitness, AssociatedConformanceWitness);
    (*(void (**)(char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v12, AssociatedTypeWitness);
    uint64_t v29 = (uint64_t)v20;
    uint64_t v30 = 0;
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v40);
    uint64_t v29 = (uint64_t)v20;
    uint64_t v30 = 1;
  }
  __swift_storeEnumTagSinglePayload(v29, v30, 1, v14);
  uint64_t v32 = v44;
  uint64_t v31 = v45;
  sub_259CEA270(a1, (uint64_t)v47);
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v14) != 1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
    v37(v23, v20, v14);
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v14);
LABEL_9:
    v37(v28, v23, v14);
    uint64_t v36 = (*(uint64_t (**)(char *, uint64_t))(v43 + 72))(v28, v42);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v28, v14);
    return v36;
  }
  sub_259CEA2CC(v47, &v46);
  int v33 = swift_dynamicCast();
  __swift_storeEnumTagSinglePayload((uint64_t)v23, v33 ^ 1u, 1, v14);
  long long v34 = *(void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v35 = v41;
  v34(v20, v41);
  if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, v14) != 1)
  {
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
    goto LABEL_9;
  }
  v34(v23, v35);
  return 0;
}

{
  uint64_t v4;

  (*(void (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  sub_259D62878();
  swift_getWitnessTable();
  swift_getAssociatedConformanceWitness();
  sub_259D62A98();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_259CEA270(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_259CEA2CC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t type metadata accessor for PhotosConcatenatedItem()
{
  return swift_getGenericMetadata();
}

void sub_259CEA300()
{
}

void sub_259CEA328()
{
}

uint64_t sub_259CEA34C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  v5[3] = swift_getObjectType();
  v5[0] = a2;
  swift_retain();
  swift_unknownObjectRetain();
  v3(v5);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t sub_259CEA3BC()
{
  OUTLINED_FUNCTION_3_17();
  return sub_259CEA3E8(v2, *(void (**)(char *))(v0 + 32), *(void *)(v0 + 40), v0 + ((*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)), v3, v4);
}

uint64_t sub_259CEA3E8(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness, v11);
  int v13 = (char *)&v15 - v12;
  (*(void (**)(uint64_t, uint64_t))(a6 + 24))(a5, a6);
  a2(v13);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, AssociatedTypeWitness);
}

uint64_t sub_259CEA508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PhotosItemList.index(for:)(a1, a2, a3);
}

uint64_t sub_259CEA670()
{
  return PhotosBasicItemList.itemIdentifiers.getter();
}

uint64_t PhotosBasicItemList.itemIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_259CEA69C()
{
  return PhotosBasicItemList.item(at:)();
}

uint64_t PhotosBasicItemList.item(at:)()
{
  return sub_259D628A8();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_259D62878();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return v0;
}

uint64_t sub_259CEA720@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosBasicItemListManager.createMutator()();
  *a1 = result;
  return result;
}

uint64_t PhotosBasicItemListManager.createMutator()()
{
  OUTLINED_FUNCTION_1_8();
  type metadata accessor for PhotosBasicItemListManager.Mutator();
  uint64_t v1 = sub_259CEA7D8(v0);
  swift_retain();
  return v1;
}

uint64_t type metadata accessor for PhotosBasicItemListManager.Mutator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_259CEA7D8(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t sub_259CEAAA0()
{
  return sub_259CEFE40();
}

uint64_t sub_259CEAC64(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v5 = *(void *)(v1 + 48);
  long long v6 = *(_OWORD *)(v1 + 56);
  uint64_t v7 = v2;
  uint64_t v8 = v3;
  return sub_259CEF184(a1, &v5);
}

uint64_t sub_259CEACA8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_259CEACD0()
{
}

void sub_259CEACE4()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v1 = *(id *)(Strong + 72);
    swift_release();
    objc_msgSend(v1, sel_signalChange_, 1);
  }
}

double PXTimebaseConversionFactor()
{
  if (PXTimebaseConversionFactor_onceToken != -1) {
    dispatch_once(&PXTimebaseConversionFactor_onceToken, &__block_literal_global_4962);
  }
  return *(double *)&PXTimebaseConversionFactor_timebaseConversion;
}

uint64_t dispatch thunk of PhotosGroupingItemListManager.itemList.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t sub_259CEADD8()
{
  return PhotosConcatenatedItemList.version.getter();
}

uint64_t PhotosConcatenatedItemList.version.getter()
{
  return *(void *)(v0 + *(void *)(*(void *)v0 + 152));
}

uint64_t sub_259CEAE18(uint64_t a1)
{
  return sub_259CE0B84(a1);
}

uint64_t dispatch thunk of PhotosBasicItemListManager.Mutator.itemList.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

double PXEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

BOOL PXPointIsNull(double a1, double a2)
{
  return a2 == INFINITY && a1 == INFINITY;
}

double CGRect.roundedToPixel(screenScale:)(double a1, double a2, double a3, double a4, double a5)
{
  return PXRectRoundToPixel(a2, a3, a4, a5, a1);
}

uint64_t UniqueAddress.wrappedValue.getter()
{
  return v0;
}

uint64_t type metadata accessor for PhotosWeakList()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t dispatch thunk of PhotosItemListChangeDetailsRepository.changeDetails(from:to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

id PhotosItemListChangeDetails.itemChangeDetails.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t dispatch thunk of PhotosItemListManager.changeDetailsRepository.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

double PXRectGetCenter(double a1, double a2, double a3)
{
  return a1 + a3 * 0.5;
}

double PXCGImageGetSizeWithOrientation(CGImage *a1, int a2)
{
  size_t Width = CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(a1);
  if ((a2 - 5) >= 4) {
    return (double)Width;
  }
  else {
    return (double)Height;
  }
}

double PXRectWithAspectRatioFillingRect(double a1, double a2, double a3, double a4)
{
  double v4 = a2 + a4 * 0.5;
  PFSizeWithAspectRatioFillingSize();
  return v4 + v5 * -0.5;
}

double CGSize.px_area.getter(double a1, double a2)
{
  return a1 * a2;
}

Swift::Bool __swiftcall areEqual(_:_:)(Swift::OpaquePointer a1, Swift::OpaquePointer a2)
{
  uint64_t v2 = *((void *)a1._rawValue + 2);
  if (v2 == *((void *)a2._rawValue + 2))
  {
    if (v2)
    {
      uint64_t v3 = (char *)a1._rawValue + 32;
      double v4 = (char *)a2._rawValue + 32;
      uint64_t v5 = v2 - 1;
      do
      {
        sub_259D04550((uint64_t)v3, (uint64_t)v11);
        sub_259D04550((uint64_t)v4, (uint64_t)v10);
        char v6 = areEqual(_:_:)((uint64_t)v11, (uint64_t)v10);
        sub_259D0A2F8((uint64_t)v10);
        sub_259D0A2F8((uint64_t)v11);
        BOOL v8 = v5-- != 0;
        if ((v6 & 1) == 0) {
          break;
        }
        v3 += 40;
        v4 += 40;
      }
      while (v8);
    }
    else
    {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

ValueMetadata *type metadata accessor for UniqueAddress()
{
  return &type metadata for UniqueAddress;
}

uint64_t sub_259CEB124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t dispatch thunk of PhotosItemList.loadingStatus(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t type metadata accessor for PhotosWeakSet()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_259CEB158()
{
  unint64_t result = qword_26A3ECC58;
  if (!qword_26A3ECC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ECC58);
  }
  return result;
}

uint64_t sub_259CEB1A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

BOOL static PhotosItemListLoadingStatus.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

uint64_t sub_259CEB1C4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_259CEB1F4()
{
  return swift_getAssociatedConformanceWitness();
}

BOOL PXRectApproximatelyEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a1, a5) <= 0.00000999999975
      && vabdd_f64(a2, a6) <= 0.00000999999975
      && vabdd_f64(a3, a7) <= 0.00000999999975
      && vabdd_f64(a4, a8) <= 0.00000999999975;
}

double PXSizeCeilingToPixel(double a1, double a2, double a3)
{
  return ceil(a1 * a3) / a3;
}

double PXFloatRoundToPixel(double a1, double a2)
{
  return round(a1 * a2) / a2;
}

double PXEdgeInsetsInvert(double a1)
{
  return -a1;
}

double PXFloatByLinearlyInterpolatingFloats(double a1, double a2, double a3)
{
  return a1 + a3 * (a2 - a1);
}

uint64_t PXCATransactionShouldLoadContentImmediately()
{
  uint64_t v0 = [MEMORY[0x263F158F8] valueForKey:@"com.apple.PhotosUIFoundation.loadContentEagerly"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v1 = [v0 BOOLValue];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

double PXClamp(double result, double a2, double a3)
{
  if (a2 >= a3) {
    a2 = a3;
  }
  if (a2 > result) {
    return a2;
  }
  return result;
}

double PXFloatSaturate(double a1)
{
  return fmax(fmin(a1, 1.0), 0.0);
}

double PXEdgeInsetsMax(double result, double a2, double a3, double a4, double a5)
{
  if (result < a5) {
    return a5;
  }
  return result;
}

double PXFloatSign(double a1)
{
  BOOL v1 = a1 < 0.0;
  BOOL v2 = a1 <= 0.0;
  double result = 0.0;
  if (v1) {
    double result = -1.0;
  }
  if (!v2) {
    return 1.0;
  }
  return result;
}

double PXEdgeInsetsAdd(char a1, double a2, double a3, double a4, double a5, double a6)
{
  double result = a2 + a6;
  if ((a1 & 1) == 0) {
    return 0.0;
  }
  return result;
}

BOOL sub_259CEB9BC(char a1, char a2)
{
  return a1 == a2;
}

double sub_259CEB9CC(uint64_t a1, void (*a2)(double))
{
  OUTLINED_FUNCTION_7_5();
  double v4 = v3();
  double v5 = OUTLINED_FUNCTION_8_4();
  a2(v5);
  return v4;
}

double CGRect.center.getter()
{
  return sub_259CEB9CC(MEMORY[0x263F00168], MEMORY[0x263F00170]);
}

BOOL sub_259CEBA54(char *a1, char *a2)
{
  return sub_259CEB9BC(*a1, *a2);
}

uint64_t type metadata accessor for PhotosBasicItem()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t PhotosItemList.loadingStatus(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_5_10(a3, a4, a4);
}

uint64_t sub_259CEBA88()
{
  return swift_getWitnessTable();
}

uint64_t sub_259CEBAA4()
{
  return swift_getWitnessTable();
}

uint64_t PhotosGroupingItemListManager.Options.init(queue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

unsigned char *storeEnumTagSinglePayload for PhotosItemListLoadingStatus(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *double result = a2 + 2;
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
        break;
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
          *double result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PhotosItemListLoadingStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t PhotosConcatenatedItemList.mainItemList.getter()
{
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8_0();
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_259CEBC80(uint64_t a1)
{
  return sub_259CE0B84(a1);
}

uint64_t dispatch thunk of PhotosBasicItemListManager.Mutator.itemList.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of PhotosBasicItemListManager.Mutator.setItemList(_:changeDetails:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t sub_259CEBCF4()
{
  return swift_getWitnessTable();
}

PhotosUIFoundation::PhotosEnvironmentValues __swiftcall PhotosEnvironmentValues.init()()
{
  void *v0 = MEMORY[0x263F8EE80];
  return result;
}

uint64_t sub_259CEBD20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t PhotosSendableTransfer.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t PhotosSendableTransfer.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t sub_259CEBDDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 56);
}

uint64_t dispatch thunk of PhotosItemListManager.waitForItemList(timeout:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_259CEBDF8()
{
  return swift_getWitnessTable();
}

uint64_t sub_259CEBE14()
{
  return MEMORY[0x263F8D6E0];
}

uint64_t sub_259CEBE20()
{
  return swift_getWitnessTable();
}

uint64_t sub_259CEBE3C()
{
  return swift_getWitnessTable();
}

uint64_t sub_259CEBE58(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t AnyPhotosObservableProperty<>.init(wrappedValue:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return sub_259CDE124(a1, a2, a3, a4, xmmword_259D732B0);
}

{
  return sub_259CDE124(a1, a2, a3, a4, xmmword_259D732A0);
}

void _PXRunLoopObserverTrampoline(__CFRunLoopObserver *a1, int a2, void *aBlock)
{
  unsigned int v6 = (void (**)(void))_Block_copy(aBlock);
  v6[2]();
  CFRelease(aBlock);
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveObserver(Current, a1, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
}

void sub_259CEC668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

float PXFrameRateRangeTypeGetCAFrameRateRange(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      int v2 = 1111490560;
      goto LABEL_5;
    case 2:
      int v2 = 1114636288;
LABEL_5:
      float v3 = *(float *)&v2;
      float v4 = 0.0;
      goto LABEL_7;
    case 3:
      float v3 = 80.0;
      float v4 = 120.0;
LABEL_7:
      LODWORD(result) = CAFrameRateRangeMake(v3, 120.0, v4);
      break;
    default:
      float result = *MEMORY[0x263F15738];
      break;
  }
  return result;
}

uint64_t PXDisplayLinkDefaultPreferredFramesPerSecond()
{
  uint64_t v0 = [MEMORY[0x263F82B60] mainScreen];
  uint64_t v1 = [v0 maximumFramesPerSecond];

  return v1;
}

double PXSizeRoundToPixel(double a1, double a2, double a3)
{
  return round(a1 * a3) / a3;
}

uint64_t sub_259CED700(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_259CED744()
{
  return sub_259CED754();
}

uint64_t sub_259CED754()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_259CEE424();
    return swift_release();
  }
  return result;
}

uint64_t sub_259CED7AC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[4];
  uint64_t v3 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v0[6];
  BOOL v8 = *(uint64_t (**)(uint64_t))((char *)v0 + v5);
  uint64_t v9 = *(void *)((char *)v0 + v5 + 8);
  uint64_t v10 = *(void **)((char *)v0 + v6);
  uint64_t v11 = *(void *)((char *)v0 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_259CED890(v7, (uint64_t)v0 + v4, v8, v9, v10, v11, v1, v2);
}

uint64_t sub_259CED890(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t a1))
{
  uint64_t v55 = a4;
  uint64_t v14 = *a5;
  uint64_t v15 = sub_259D62458();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15, v17);
  uint64_t v58 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_259D62478();
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59, v19);
  v56 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v51 = result;
    swift_getAssociatedTypeWitness();
    uint64_t v53 = v15;
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v54 = v16;
    uint64_t v23 = *(void *)(AssociatedConformanceWitness + 8);
    uint64_t v52 = a6;
    uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8);
    uint64_t v25 = swift_checkMetadataState();
    uint64_t v50 = v24(v25, v23);
    uint64_t v26 = a3(a2);
    uint64_t v27 = *(void *)(v14 + 80);
    BOOL v28 = *(void **)(v14 + 88);
    uint64_t v29 = type metadata accessor for PhotosBasicItemList();
    sub_259CEFFA8(&aBlock);
    uint64_t v66 = PhotosBasicItemList.__allocating_init(items:loadingStatus:)(v26, (char *)&aBlock);
    v67 = a5;
    uint64_t v48 = a8;
    uint64_t v30 = v66;
    uint64_t v55 = v66;
    uint64_t WitnessTable = swift_getWitnessTable();
    static PhotosItemListChangeDetails.calculateChangeDetails<A, B, C>(from:to:allItemsChanged:)((uint64_t)&v67, (uint64_t)&v66, 1, v27, v29, v29, WitnessTable, WitnessTable, &aBlock);
    uint64_t v33 = aBlock;
    uint64_t v32 = v61;
    uint64_t v34 = a7;
    uint64_t v35 = v62;
    uint64_t v36 = sub_259CEE900();
    uint64_t v49 = &v47;
    MEMORY[0x270FA5388](v36, v37);
    long long v38 = v48;
    *(&v47 - 8) = v34;
    *(&v47 - 7) = (uint64_t)v38;
    *(&v47 - 6) = v30;
    *(&v47 - 5) = v33;
    *(&v47 - 4) = v32;
    *(&v47 - 3) = (uint64_t)v35;
    *(&v47 - 2) = v50;
    uint64_t aBlock = v34;
    uint64_t v61 = v27;
    uint64_t v62 = v38;
    v63 = v28;
    uint64_t v39 = v38;
    uint64_t State = type metadata accessor for PhotosGroupingItemListManager.FetchState();
    sub_259CEE7EC((void (*)(uint64_t))sub_259CEE96C, (uint64_t)(&v47 - 10), v36, State, MEMORY[0x263F8EE60] + 8);
    swift_release();
    uint64_t v41 = swift_allocObject();
    swift_weakInit();
    uint64_t v42 = (void *)swift_allocObject();
    v42[2] = v34;
    v42[3] = v27;
    v42[4] = v39;
    v42[5] = v28;
    v42[6] = v41;
    v64 = sub_259CED744;
    v65 = v42;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v61 = 1107296256;
    uint64_t v62 = sub_259CED700;
    v63 = &block_descriptor_20;
    uint64_t v43 = _Block_copy(&aBlock);
    swift_retain();
    uint64_t v44 = v56;
    sub_259D62468();
    v67 = (void *)MEMORY[0x263F8EE78];
    sub_259CEE3DC((unint64_t *)&qword_26A3ECE98, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECEB8);
    sub_259CEE38C((unint64_t *)&qword_26A3ECEC0, &qword_26A3ECEB8);
    uint64_t v45 = v58;
    uint64_t v46 = v53;
    sub_259D62BD8();
    MEMORY[0x25A2E9280](0, v44, v45, v43);

    swift_release();
    _Block_release(v43);
    swift_release();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v45, v46);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v44, v59);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_259CEDDF0()
{
  uint64_t v2 = v0;
  uint64_t v58 = (void *)*v0;
  sub_259D62458();
  OUTLINED_FUNCTION_0_5();
  uint64_t v65 = v4;
  uint64_t v66 = v3;
  MEMORY[0x270FA5388](v3, v5);
  OUTLINED_FUNCTION_2_0();
  uint64_t v63 = v6;
  uint64_t v64 = sub_259D62478();
  OUTLINED_FUNCTION_0_5();
  uint64_t v62 = v7;
  MEMORY[0x270FA5388](v8, v9);
  OUTLINED_FUNCTION_2_0();
  uint64_t v61 = v10;
  uint64_t v11 = v58[12];
  uint64_t v12 = v58[10];
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_5();
  uint64_t v59 = v14;
  uint64_t v60 = v13;
  uint64_t v16 = *(void *)(v15 + 64);
  uint64_t v18 = MEMORY[0x270FA5388](v13, v17);
  uint64_t v19 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18, v20);
  uint64_t v22 = (char *)&v51 - v21;
  uint64_t v23 = sub_259D624A8();
  OUTLINED_FUNCTION_0_5();
  uint64_t v25 = v24;
  MEMORY[0x270FA5388](v26, v27);
  OUTLINED_FUNCTION_1_20();
  BOOL v28 = (void *)v2[2];
  void *v1 = v28;
  (*(void (**)(void *, void, uint64_t))(v25 + 104))(v1, *MEMORY[0x263F8F0E0], v23);
  id v57 = v28;
  LOBYTE(v28) = sub_259D624C8();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v25 + 8))(v1, v23);
  if (v28)
  {
    if ((v2[10] & 1) == 0)
    {
      *((unsigned char *)v2 + 80) = 1;
      uint64_t v54 = sub_259CEE368();
      uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v11 + 40);
      uint64_t v31 = v22;
      v56 = v22;
      v30(v12, v11);
      uint64_t v53 = v2[7];
      uint64_t v52 = v2[8];
      uint64_t v55 = v2[9];
      uint64_t v51 = swift_allocObject();
      swift_weakInit();
      uint64_t v32 = v59;
      uint64_t v33 = v12;
      uint64_t v34 = v60;
      (*(void (**)(char *, char *))(v59 + 16))(v19, v31);
      unint64_t v35 = (*(unsigned __int8 *)(v32 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
      unint64_t v36 = (v16 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v37 = (v36 + 23) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v38 = (v37 + 15) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v39 = (char *)swift_allocObject();
      *((void *)v39 + 2) = v33;
      uint64_t v40 = v58;
      *((void *)v39 + 3) = v58[11];
      *((void *)v39 + 4) = v11;
      uint64_t v41 = v51;
      *((void *)v39 + 5) = v40[13];
      *((void *)v39 + 6) = v41;
      (*(void (**)(char *, char *, uint64_t))(v32 + 32))(&v39[v35], v19, v34);
      uint64_t v42 = &v39[v36];
      uint64_t v43 = v54;
      uint64_t v44 = v52;
      *(void *)uint64_t v42 = v53;
      *((void *)v42 + 1) = v44;
      *(void *)&v39[v37] = v43;
      uint64_t v45 = v57;
      *(void *)&v39[v38] = v57;
      aBlock[4] = sub_259CED7AC;
      aBlock[5] = v39;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_259CED700;
      aBlock[3] = &block_descriptor_5;
      uint64_t v46 = _Block_copy(aBlock);
      id v47 = v45;
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v48 = v61;
      sub_259D62468();
      uint64_t v67 = MEMORY[0x263F8EE78];
      sub_259CEE3DC((unint64_t *)&qword_26A3ECE98, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECEB8);
      sub_259CEE38C((unint64_t *)&qword_26A3ECEC0, &qword_26A3ECEB8);
      uint64_t v49 = v63;
      uint64_t v50 = v66;
      sub_259D62BD8();
      MEMORY[0x25A2E9280](0, v48, v49, v46);
      _Block_release(v46);
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v49, v50);
      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v48, v64);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v56, v34);
      swift_release();
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_259CEE340@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_259CEE368();
  *a1 = result;
  return result;
}

uint64_t sub_259CEE368()
{
  return PhotosBasicItemListManager.itemList.getter();
}

uint64_t sub_259CEE38C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_259CEE3DC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_259CEE424()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 96);
  uint64_t v4 = *(void *)(*v0 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_5();
  uint64_t v33 = v6;
  MEMORY[0x270FA5388](v7, v8);
  uint64_t v32 = (char *)&v30 - v9;
  uint64_t v10 = sub_259CEE900();
  uint64_t v37 = v4;
  uint64_t v11 = *(void *)(v2 + 88);
  uint64_t v38 = v11;
  uint64_t v39 = v3;
  uint64_t v12 = *(void *)(v2 + 104);
  uint64_t v40 = v12;
  uint64_t v34 = v4;
  uint64_t v35 = v3;
  uint64_t v41 = v4;
  uint64_t v42 = v11;
  uint64_t v43 = v3;
  uint64_t v44 = v12;
  uint64_t State = type metadata accessor for PhotosGroupingItemListManager.FetchState();
  type metadata accessor for PhotosBasicItemList();
  swift_getTupleTypeMetadata3();
  uint64_t v14 = sub_259D62B68();
  sub_259CEE7EC((void (*)(uint64_t))sub_259CEEA30, (uint64_t)v36, v10, State, v14);
  swift_release();
  uint64_t v15 = v41;
  uint64_t v16 = v42;
  uint64_t v17 = v43;
  uint64_t v18 = v44;
  uint64_t v19 = v45;
  if (v41)
  {
    v1[11] = v45;
    uint64_t v41 = v1[3];
    uint64_t v20 = (void *)swift_allocObject();
    uint64_t v31 = AssociatedTypeWitness;
    uint64_t v21 = (uint64_t)v20;
    v20[2] = v34;
    v20[3] = v11;
    v20[4] = v35;
    v20[5] = v12;
    v20[6] = v15;
    v20[7] = v16;
    v20[8] = v17;
    v20[9] = v18;
    v20[10] = v19;
    OUTLINED_FUNCTION_4_10();
    OUTLINED_FUNCTION_4_10();
    uint64_t v22 = type metadata accessor for PhotosBasicItemListManager();
    swift_retain();
    uint64_t WitnessTable = swift_getWitnessTable();
    PhotosMutableComposedObservable<>.performChanges(using:)((uint64_t)sub_259CEAC64, v21, v22, WitnessTable);
    uint64_t AssociatedTypeWitness = v31;
    swift_release();
    OUTLINED_FUNCTION_3_14();
    swift_release();
    *((unsigned char *)v1 + 80) = 0;
  }
  uint64_t v24 = v1[11];
  uint64_t v25 = v32;
  sub_259CEE908();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)(AssociatedConformanceWitness + 8) + 8))(AssociatedTypeWitness);
  uint64_t v28 = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v25, AssociatedTypeWitness);
  if (v24 != v27) {
    sub_259CEDDF0(v28);
  }
  OUTLINED_FUNCTION_3_14();
  return v15 != 0;
}

uint64_t type metadata accessor for PhotosBasicItemListManager()
{
  return __swift_instantiateGenericMetadata();
}

void sub_259CEE754(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    swift_release();
  }
}

uint64_t type metadata accessor for PhotosGroupingItemListManager.FetchState()
{
  return swift_getGenericMetadata();
}

id sub_259CEE7AC(id result, uint64_t a2, uint64_t a3, void *a4)
{
  if (result)
  {
    swift_retain();
    return a4;
  }
  return result;
}

void sub_259CEE7EC(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_259CEE878(a3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a3 + 16), (os_unfair_lock_t)(a3 + ((*(unsigned int *)(*(void *)a3 + 48) + 3) & 0x1FFFFFFFCLL)), a1, a2, a4, a5, &v5);
}

void sub_259CEE878(uint64_t a1, os_unfair_lock_t lock, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  os_unfair_lock_lock(lock);
  a3(a1);
  os_unfair_lock_unlock(lock);
  if (v7) {
    *a7 = v7;
  }
}

uint64_t sub_259CEE900()
{
  return swift_retain();
}

uint64_t sub_259CEE908()
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)v0 + 96) + 40))(*(void *)(*(void *)v0 + 80));
}

void sub_259CEE96C(uint64_t *a1)
{
  sub_259CEE994(a1, *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void **)(v1 + 56), *(void *)(v1 + 64));
}

void sub_259CEE994(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  uint64_t v12 = a1[2];
  uint64_t v13 = (void *)a1[3];
  swift_retain();
  id v14 = a5;
  sub_259CEE754(v10, v11, v12, v13);
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = (uint64_t)a5;
  a1[4] = a6;
}

__n128 sub_259CEEA30@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 32);
  __n128 result = *(__n128 *)a1;
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 32) = 0;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v4;
  *(void *)(a2 + 32) = v2;
  return result;
}

uint64_t static PhotosItemListChangeDetails.calculateChangeDetails<A, B, C>(from:to:allItemsChanged:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  id v14 = sub_259CEEB20(a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)(a7 + 8) + 8))(a5);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)(a8 + 8) + 8))(a6);
  *a9 = v15;
  a9[1] = result;
  a9[2] = (uint64_t)v14;
  return result;
}

uint64_t sub_259CEEAF4()
{
  return PhotosBasicItemList.version.getter();
}

uint64_t PhotosBasicItemList.version.getter()
{
  return *(void *)(v0 + 24);
}

id sub_259CEEB20(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  if (AssociatedTypeWitness == swift_getAssociatedTypeWitness())
  {
    uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a7 + 48))(a5, a7);
    (*(void (**)(uint64_t, uint64_t))(a8 + 48))(a6, a8);
    uint64_t v16 = sub_259D62D88();
    swift_bridgeObjectRelease();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    id v18 = sub_259CEED30(v15, v16, a3 & 1, AssociatedTypeWitness, AssociatedConformanceWitness);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v18;
  }
  else
  {
    id v13 = objc_msgSend(self, sel_changeDetailsWithNoIncrementalChanges);
    return v13;
  }
}

id sub_259CEED30(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (a3) {
    swift_bridgeObjectRetain();
  }
  else {
    sub_259D627D8();
  }
  uint64_t v7 = sub_259D62D88();
  swift_bridgeObjectRelease();
  sub_259CEF6C0();
  uint64_t v8 = sub_259D62D88();
  uint64_t v9 = sub_259D62D88();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a4;
  *(void *)(v10 + 24) = a5;
  return sub_259CEEE38(v8, v9, v7, (uint64_t)sub_259D1347C, v10);
}

id sub_259CEEE38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (void *)sub_259D62778();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_259D62778();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_259D62778();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v13[4] = a4;
    v13[5] = a5;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1107296256;
    v13[2] = sub_259D132F8;
    v13[3] = &block_descriptor_1;
    uint64_t v10 = _Block_copy(v13);
    swift_release();
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_changeDetailsFromArray_toArray_changedObjects_objectComparator_, v7, v8, v9, v10);
  _Block_release(v10);

  return v11;
}

uint64_t sub_259CEF184(uint64_t a1, void *a2)
{
  uint64_t v2 = a2[1];
  uint64_t v3 = a2[2];
  long long v4 = (void *)a2[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECF30);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259D73B00;
  *(void *)(inited + 32) = v2;
  *(void *)(inited + 40) = v3;
  *(void *)(inited + 48) = v4;
  id v6 = v4;
  sub_259CEF210();
  swift_setDeallocating();
  return sub_259CEFD80();
}

uint64_t sub_259CEF210()
{
  return sub_259CEFE6C();
}

void sub_259CEF26C(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (a1 == a2)
  {
    id v6 = objc_msgSend(self, sel_changeDetailsWithNoChanges);
    uint64_t v7 = a1;
  }
  else
  {
    uint64_t v7 = a2;
    uint64_t v8 = *(void *)(v3 + 24);
    MEMORY[0x270FA5388](a1, a2);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
    sub_259CEF700((uint64_t *)(v8 + 16), &v18);
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 24));
    uint64_t v9 = v18;
    swift_release();
    uint64_t v10 = *((void *)v9 + 2);
    if (v10 && (id v11 = v9 + 32, *((void *)v9 + 4) == a1) && *(void *)&v11[24 * v10 - 16] == v7)
    {
      uint64_t v12 = (void *)*((void *)v9 + 6);
      id v13 = *(void **)&v11[24 * v10 - 8];
      id v18 = (char *)MEMORY[0x263F8EE78];
      id v17 = v12;
      id v14 = v13;
      sub_259D62D18();
      uint64_t v15 = 48;
      do
      {
        id v16 = *(id *)&v9[v15];
        sub_259D62CE8();
        sub_259D62D28();
        sub_259D62D38();
        sub_259D62CF8();
        v15 += 24;
        --v10;
      }
      while (v10);
      swift_bridgeObjectRelease();
      sub_259CEF6C0();
      id v6 = sub_259CEF474();
    }
    else
    {
      swift_bridgeObjectRelease();
      id v6 = objc_msgSend(self, sel_changeDetailsWithNoIncrementalChanges);
    }
  }
  *a3 = a1;
  a3[1] = v7;
  a3[2] = v6;
}

id sub_259CEF474()
{
  sub_259CEF6C0();
  uint64_t v0 = (void *)sub_259D62778();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_changeDetailsByMergingChangeDetails_, v0);

  return v1;
}

unint64_t sub_259CEF6C0()
{
  unint64_t result = qword_26A3ECEF8;
  if (!qword_26A3ECEF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3ECEF8);
  }
  return result;
}

uint64_t sub_259CEF700@<X0>(uint64_t *a1@<X0>, char **a2@<X8>)
{
  return sub_259CEF71C(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_259CEF71C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  uint64_t result = *a1;
  uint64_t v5 = *(void *)(result + 16);
  if (v5)
  {
    id v16 = a4;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v7 = (id *)(result + 24 * v5 + 24);
    uint64_t v8 = (char *)MEMORY[0x263F8EE78];
    uint64_t v17 = a2;
    uint64_t v18 = result;
    while (1)
    {
      a4 = *(char ***)(result + 16);
      if (v5 > (uint64_t)a4) {
        break;
      }
      unint64_t v9 = *((void *)v8 + 2);
      uint64_t v10 = a2;
      if (v9) {
        uint64_t v10 = *((void *)v8 + 4);
      }
      uint64_t v11 = (uint64_t)*(v7 - 1);
      if (v11 != v10) {
        goto LABEL_18;
      }
      uint64_t v12 = (uint64_t)*(v7 - 2);
      id v13 = *v7;
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v9 >= *((void *)v8 + 3) >> 1) {
        uint64_t v8 = sub_259CEFAC8(isUniquelyReferenced_nonNull_native, v9 + 1, 1, (uint64_t)v8);
      }
      swift_arrayDestroy();
      uint64_t v15 = *((void *)v8 + 2);
      memmove(v8 + 56, v8 + 32, 24 * v15);
      *((void *)v8 + 2) = v15 + 1;
      *((void *)v8 + 4) = v12;
      *((void *)v8 + 5) = v11;
      *((void *)v8 + 6) = v13;
      a2 = v17;
      uint64_t result = v18;
      if (v12 != a3)
      {
LABEL_18:
        v7 -= 3;
        if (--v5) {
          continue;
        }
      }
      uint64_t result = swift_bridgeObjectRelease();
      a4 = v16;
      goto LABEL_13;
    }
    __break(1u);
  }
  uint64_t v8 = (char *)MEMORY[0x263F8EE78];
LABEL_13:
  *a4 = v8;
  return result;
}

uint64_t sub_259CEF870(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v3 = (void *)a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECF30);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259D73B00;
  *(void *)(inited + 32) = v1;
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 48) = v3;
  id v5 = v3;
  sub_259CEF8F4();
  swift_setDeallocating();
  return sub_259CEFD80();
}

uint64_t sub_259CEF8F4()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 24);
  swift_retain();
  os_unfair_lock_lock(v1 + 6);
  sub_259CEF960((uint64_t)&v1[4]);
  os_unfair_lock_unlock(v1 + 6);
  return swift_release();
}

uint64_t sub_259CEF960(uint64_t a1)
{
  return sub_259CEF97C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_259CEF97C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  sub_259CEF9E8(a2);
  uint64_t v6 = *(void *)(*(void *)a1 + 16);
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t result = v6 - v7;
  if (__OFSUB__(v6, v7))
  {
    __break(1u);
  }
  else if (result >= 1)
  {
    return sub_259D2369C(result);
  }
  return result;
}

uint64_t sub_259CEF9E8(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > *(void *)(v3 + 24) >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    uint64_t result = (uint64_t)sub_259CEFAC8((char *)result, v7, 1, v3);
    uint64_t v3 = result;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = sub_259CEFCC4(v6 + 32, v2, v3 + 24 * v8 + 32);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v9 = *(void *)(v3 + 16);
  BOOL v10 = __OFADD__(v9, v2);
  uint64_t v11 = v9 + v2;
  if (!v10)
  {
    *(void *)(v3 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_259CEFAC8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECF30);
    BOOL v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    BOOL v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_259CEFDBC((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_259CEFBC4(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_259CEFBC4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_259D62E48();
  __break(1u);
  return result;
}

uint64_t sub_259CEFCC4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_7();
LABEL_11:
    uint64_t result = sub_259D62E48();
    __break(1u);
    return result;
  }
  if (a3 + 24 * a2 > a1 && a1 + 24 * a2 > a3)
  {
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_6();
    goto LABEL_11;
  }

  return swift_arrayInitWithCopy();
}

uint64_t sub_259CEFD80()
{
  swift_arrayDestroy();
  uint64_t v0 = OUTLINED_FUNCTION_3_11();

  return MEMORY[0x270FA0228](v0, v1, v2);
}

char *sub_259CEFDBC(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_15();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_17();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_12(a3, result);
  }
  return result;
}

uint64_t sub_259CEFE1C()
{
  return sub_259CEFE6C();
}

uint64_t sub_259CEFE40()
{
  return sub_259CEFE6C();
}

uint64_t sub_259CEFE6C()
{
  return swift_release();
}

uint64_t sub_259CEFEFC()
{
  return sub_259D623D8();
}

void sub_259CEFFA8(unsigned char *a1@<X8>)
{
  *a1 = 2;
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

uint64_t PXUserInterfaceStyleFromUITraitCollection(void *a1)
{
  uint64_t result = [a1 userInterfaceStyle];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

uint64_t PXAxisTransposed(uint64_t a1)
{
  if (a1 == 2) {
    return 1;
  }
  else {
    return 2 * (a1 == 1);
  }
}

double PXMatrixMakeTranslation()
{
  return *(double *)&_PromotedConst;
}

double PXSizeByLinearlyInterpolatingSize(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a5 * (a3 - a1);
}

BOOL PXSizeApproximatelyEqualToSize(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) <= 0.00000999999975;
  return vabdd_f64(a2, a4) <= 0.00000999999975 && v4;
}

double PXPointValueForAxis(uint64_t a1, double a2, double a3)
{
  if (a1 != 1)
  {
    if (a1 == 2)
    {
      return a2;
    }
    else if (!a1)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v4, v3, v5, v6);
      uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat PXPointValueForAxis(CGPoint, PXAxis)");
      [v7 handleFailureInFunction:v8 file:@"PXAxis.m" lineNumber:16 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  return a3;
}

double PXRectWithSize()
{
  return 0.0;
}

CGColorSpaceRef PXGetColorSpace(uint64_t a1)
{
  CGColorSpaceRef result = (CGColorSpaceRef)colorspaces[a1];
  if (!result)
  {
    CGColorSpaceRef result = 0;
    uint64_t v3 = (CFStringRef *)MEMORY[0x263F002E8];
    switch(a1)
    {
      case 0:
        goto LABEL_17;
      case 1:
        goto LABEL_16;
      case 2:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F002F0];
        goto LABEL_16;
      case 3:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F00250];
        goto LABEL_16;
      case 4:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F00240];
        goto LABEL_16;
      case 5:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F001E8];
        goto LABEL_16;
      case 6:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F001E0];
        goto LABEL_16;
      case 7:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F00298];
        goto LABEL_16;
      case 8:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F00278];
        goto LABEL_16;
      case 9:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F00218];
        goto LABEL_16;
      case 10:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F00230];
        goto LABEL_16;
      case 11:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F00238];
        goto LABEL_16;
      case 12:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F002D8];
        goto LABEL_16;
      case 13:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F00288];
        goto LABEL_16;
      case 14:
        uint64_t v3 = (CFStringRef *)MEMORY[0x263F00290];
LABEL_16:
        CGColorSpaceRef result = CGColorSpaceCreateWithName(*v3);
LABEL_17:
        colorspaces[a1] = (uint64_t)result;
        break;
      default:
        __assert_rtn("PXGetColorSpace", "PXColorSpaceNameAdditions.m", 68, "NO");
    }
  }
  return result;
}

double PXSizeValueForAxis(uint64_t a1, double a2, double a3)
{
  if (a1 != 1)
  {
    if (a1 == 2)
    {
      return a2;
    }
    else if (!a1)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v4, v3, v5, v6);
      uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat PXSizeValueForAxis(CGSize, PXAxis)");
      [v7 handleFailureInFunction:v8 file:@"PXAxis.m" lineNumber:40 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  return a3;
}

BOOL PXPointApproximatelyEqualToPoint(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) <= 0.00000999999975;
  return vabdd_f64(a2, a4) <= 0.00000999999975 && v4;
}

BOOL PXSizeIsNull(double a1, double a2)
{
  return a2 == INFINITY && a1 == INFINITY;
}

double PXRectScale(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

uint64_t CGImagePropertyOrientationFromPXImageOrientation(unint64_t a1)
{
  if (a1 >= 8)
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"CGImagePropertyOrientation CGImagePropertyOrientationFromPXImageOrientation(PXImageOrientation)"];
    [v2 handleFailureInFunction:v3 file:@"PXMediaProvider.m" lineNumber:39 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return dword_259D74AB8[a1];
}

uint64_t PXSizeIsEmpty(double a1, double a2)
{
  BOOL v2 = a1 == INFINITY;
  if (a2 != INFINITY) {
    BOOL v2 = 0;
  }
  if (a2 == 0.0) {
    BOOL v2 = 1;
  }
  return a1 == 0.0 || v2;
}

double PXRectDenormalize(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a5 + a1 * a7;
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 48) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v9);
}

void __PXIsPhotoPicker_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v1 = [(id)v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"PhotoPicker"];
  if ((v0 & 1) != 0
    || ([MEMORY[0x263F08AB0] processInfo],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [(id)v2 processName],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        (id)v2,
        LOBYTE(v2) = [v3 isEqualToString:@"PhotosPicker"],
        v3,
        (v2 & 1) != 0))
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v6 = [v5 processName];

    char v4 = [v6 isEqualToString:@"PhotosMessagesApp"];
  }
  PXIsPhotoPicker_isPhotoPicker = v4;
}

void px_dispatch_on_main_queue(void *a1)
{
  uint64_t v1 = a1;
  if (v1)
  {
    block = v1;
    if ([MEMORY[0x263F08B88] isMainThread]) {
      block[2]();
    }
    else {
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    uint64_t v1 = block;
  }
}

double PXEdgeInsetsForEdges(char a1)
{
  if ((a1 & 1) == 0) {
    return 0.0;
  }
  return result;
}

BOOL PXEdgeInsetsApproximatelyEqualToEdgeInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a2, a6) <= 0.00000999999975
      && vabdd_f64(a1, a5) <= 0.00000999999975
      && vabdd_f64(a4, a8) <= 0.00000999999975
      && vabdd_f64(a3, a7) <= 0.00000999999975;
}

float PXMatrixMakeOrthoProjection(float a1, float a2)
{
  return (float)(1.0 / (float)(a2 - a1)) + (float)(1.0 / (float)(a2 - a1));
}

uint64_t PXRectEdgeAxis(int a1)
{
  if (((a1 - 1) & 0xFFFFFFFD) != 0) {
    return 2;
  }
  else {
    return 1;
  }
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

double PXSizeRound(double a1)
{
  return round(a1);
}

double PXPointDenormalize(double a1, double a2, double a3, double a4, double a5)
{
  return a3 + a1 * a5;
}

BOOL PXPixelSizeAreaIsZero(double a1, double a2)
{
  return 1.0 - a1 > 0.00000011920929 || 1.0 - a2 > 0.00000011920929;
}

double *PXSizeSetValueForAxis(double *result, uint64_t a2, double a3)
{
  switch(a2)
  {
    case 1:
      ++result;
      goto LABEL_6;
    case 2:
LABEL_6:
      *__n128 result = a3;
      return result;
    case 0:
      uint64_t v3 = [MEMORY[0x263F08690] currentHandler];
      char v4 = objc_msgSend(NSString, "stringWithUTF8String:", "void PXSizeSetValueForAxis(CGSize * _Nonnull, CGFloat, PXAxis)");
      [v3 handleFailureInFunction:v4 file:@"PXAxis.m" lineNumber:51 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  return result;
}

double PXRectRoundToPixel(double a1, double a2, double a3, double a4, double a5)
{
  return round(a1 * a5) / a5;
}

double PXScaledValueForTextStyleWithSymbolicTraits(uint64_t a1, uint64_t a2, double a3)
{
  return PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits(a1, 0, a2, a3);
}

double PXFloatProgressBetween(double a1, double a2, double a3)
{
  BOOL v3 = a3 <= a1;
  double v4 = 1.0 - (a2 - a3) / (a1 - a3);
  double result = (a2 - a1) / (a3 - a1);
  if (v3) {
    return v4;
  }
  return result;
}

double PXFloatFloorToPixel(double a1, double a2)
{
  return floor(a1 * a2) / a2;
}

uint64_t __PXCreateContextWithAutomaticFormat_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(a1 + 32)) {
    BOOL v4 = (a3 & 0x10000000000) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return 1;
  }
  unsigned int v5 = *(_DWORD *)(a4 + 44) - 2;
  if (v5 > 2) {
    return 1;
  }
  uint64_t result = 0;
  *(_DWORD *)(a4 + 44) = dword_259D74840[v5];
  *(unsigned char *)(a4 + 64) = 0;
  return result;
}

double *PXPointSetValueForAxis(double *result, uint64_t a2, double a3)
{
  switch(a2)
  {
    case 1:
      ++result;
      goto LABEL_6;
    case 2:
LABEL_6:
      *uint64_t result = a3;
      return result;
    case 0:
      BOOL v3 = [MEMORY[0x263F08690] currentHandler];
      BOOL v4 = objc_msgSend(NSString, "stringWithUTF8String:", "void PXPointSetValueForAxis(CGPoint * _Nonnull, CGFloat, PXAxis)");
      [v3 handleFailureInFunction:v4 file:@"PXAxis.m" lineNumber:27 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

void sub_259CF533C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259CF58CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_259CF5F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_259CF7264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259CF7638(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_259CF7D00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_259CF7F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259CF8114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259CF8430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PXEdgeInsetsEqualToEdgeInsetsForEdges(char a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if ((a1 & 1) == 0)
  {
    a2 = 0.0;
    a6 = 0.0;
  }
  if ((a1 & 2) == 0)
  {
    a3 = 0.0;
    a7 = 0.0;
  }
  if ((a1 & 8) == 0)
  {
    a5 = 0.0;
    a9 = 0.0;
  }
  if (a3 != a7 || a2 != a6 || a5 != a9) {
    return 0;
  }
  if ((a1 & 4) != 0) {
    double v12 = a8;
  }
  else {
    double v12 = 0.0;
  }
  if ((a1 & 4) != 0) {
    double v13 = a4;
  }
  else {
    double v13 = 0.0;
  }
  return v13 == v12;
}

uint64_t CGRect.isValid.getter()
{
  return PXRectIsValid();
}

uint64_t PXRectIsValid()
{
  if (!CGFloatIsValid() || !CGFloatIsValid() || !CGFloatIsValid()) {
    return 0;
  }

  return CGFloatIsValid();
}

double PXEdgeInsetsRoundToPixel(double a1, double a2, double a3, double a4, double a5)
{
  return round(a1 * a5) / a5;
}

uint64_t PXEdgesForAxis(uint64_t a1)
{
  uint64_t v1 = 10;
  if (a1 != 2) {
    uint64_t v1 = 0;
  }
  if (a1 == 1) {
    return 5;
  }
  else {
    return v1;
  }
}

id PXLocalizedVideoDuration(void *a1, double a2)
{
  id v3 = a1;
  if (!v3) {
    id v3 = objc_alloc_init(MEMORY[0x263F08780]);
  }
  double v4 = round(a2);
  if (v4 >= 0.0) {
    double v5 = v4;
  }
  else {
    double v5 = -v4;
  }
  uint64_t v6 = [v3 allowedUnits];
  uint64_t v7 = [v3 zeroFormattingBehavior];
  uint64_t v8 = [v3 unitsStyle];
  if (v5 > -3600.0 && v5 < 3600.0) {
    uint64_t v10 = 192;
  }
  else {
    uint64_t v10 = 224;
  }
  [v3 setAllowedUnits:v10];
  [v3 setZeroFormattingBehavior:0];
  [v3 setUnitsStyle:0];
  size_t v11 = [v3 stringFromTimeInterval:v5];
  if (v4 < 0.0)
  {
    uint64_t v12 = [@"-" stringByAppendingString:v11];

    size_t v11 = (void *)v12;
  }
  [v3 setAllowedUnits:v6];
  [v3 setZeroFormattingBehavior:v7];
  [v3 setUnitsStyle:v8];

  return v11;
}

BOOL PXRectIdenticalToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a1 == a5 && a2 == a6 && a3 == a7 && a4 == a8;
}

double PXRectNormalize(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double result = a1 - a5;
  if (a7 != 0.0) {
    return result / a7;
  }
  return result;
}

uint64_t PXEdgesFlippedVertically(uint64_t a1)
{
  uint64_t v1 = a1 ^ 5;
  if ((a1 & 1) == 0) {
    uint64_t v1 = a1;
  }
  if ((a1 & 4) != 0) {
    return v1 ^ 5;
  }
  else {
    return v1;
  }
}

uint64_t PXGPixelFormatNameToMetalFormat(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return qword_259D74B10[a1 - 1];
  }
}

void PXSoftClamp(double a1, double a2, double a3, double a4)
{
  if (a2 >= a1)
  {
    if (a2 > a3) {
      log((a2 - a3) / a4 + 1.0);
    }
  }
  else
  {
    log((a1 - a2) / a4 + 1.0);
  }
}

double PXRectShiftedInsideConstrainingRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v7 = a5 + a7;
  if (a1 + a3 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = a1 + a3;
  }
  if (a5 >= v8) {
    double v8 = a5;
  }
  double result = a1 + v8 - (a1 + a3);
  if (result >= v7) {
    double result = v7;
  }
  if (a5 >= result) {
    return a5;
  }
  return result;
}

void sub_259CF91DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __px_dispatch_on_main_queue_when_idle_after_delay_block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  id v3 = *(void **)(a1 + 32);
  double v4 = MEMORY[0x263EF83A0];

  dispatch_after(v2, v4, v3);
}

void PhotosConcatenatedItemList.item(at:)()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v90 = v1;
  dispatch_time_t v2 = (void *)*v0;
  v91 = v2;
  uint64_t v92 = v3;
  uint64_t v4 = v2[12];
  uint64_t v88 = v2[15];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v85 = v5;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v6, v7);
  v84 = (char *)&v78 - v8;
  sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v81 = v10;
  uint64_t v82 = v9;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v11, v12);
  OUTLINED_FUNCTION_26(v13, v78);
  uint64_t v86 = v4;
  uint64_t v83 = *(void *)(v4 - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v14, v15);
  OUTLINED_FUNCTION_10_0();
  uint64_t v79 = v16;
  uint64_t v17 = v2[14];
  uint64_t v18 = v2[11];
  uint64_t v87 = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v78 = v19;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v20, v21);
  uint64_t v23 = (char *)&v78 - v22;
  sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v24, v25);
  uint64_t v27 = (char *)&v78 - v26;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v28, v29);
  OUTLINED_FUNCTION_6_1();
  v30();
  OUTLINED_FUNCTION_13((uint64_t)v27, 1, v18);
  if (v31)
  {
    OUTLINED_FUNCTION_11();
    v32();
    uint64_t v33 = v17;
    uint64_t v34 = v92;
  }
  else
  {
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_3_3();
    v35();
    unint64_t v36 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 32);
    uint64_t v33 = v17;
    uint64_t v37 = v36(v18, v17);
    if (v37 > v92)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 56))(v92, v18, v17);
      uint64_t v38 = OUTLINED_FUNCTION_22();
      v39(v38);
      uint64_t v40 = v87;
      (*(void (**)(uint64_t, char *, uint64_t))(v78 + 32))(v90, v23, v87);
      uint64_t v41 = swift_getAssociatedTypeWitness();
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      uint64_t v43 = swift_getAssociatedConformanceWitness();
      uint64_t v44 = AssociatedTypeWitness;
      uint64_t v45 = swift_getAssociatedConformanceWitness();
      uint64_t v93 = v41;
      uint64_t v94 = v40;
      uint64_t v95 = v44;
      uint64_t v96 = AssociatedConformanceWitness;
      uint64_t v97 = v43;
      uint64_t v98 = v45;
      OUTLINED_FUNCTION_28();
LABEL_12:
      swift_storeEnumTagMultiPayload();
      OUTLINED_FUNCTION_4_2();
      return;
    }
    uint64_t v46 = v36(v18, v17);
    uint64_t v47 = OUTLINED_FUNCTION_22();
    v48(v47);
    uint64_t v34 = v92 - v46;
    if (__OFSUB__(v92, v46)) {
      goto LABEL_14;
    }
  }
  OUTLINED_FUNCTION_12();
  uint64_t v49 = v91[13];
  uint64_t v50 = *(uint64_t (**)(uint64_t))(v49 + 32);
  uint64_t v51 = v91[10];
  uint64_t v52 = OUTLINED_FUNCTION_32();
  if (v34 < v50(v52))
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 56))(v34, v51, v49);
    uint64_t v53 = OUTLINED_FUNCTION_27();
    uint64_t v54 = OUTLINED_FUNCTION_16_0();
    uint64_t v55 = v87;
    uint64_t v56 = OUTLINED_FUNCTION_16_0();
    uint64_t v57 = AssociatedTypeWitness;
    uint64_t v58 = OUTLINED_FUNCTION_16_0();
    uint64_t v93 = v53;
    uint64_t v94 = v55;
    uint64_t v95 = v57;
    uint64_t v96 = v54;
    uint64_t v97 = v56;
    uint64_t v98 = v58;
    OUTLINED_FUNCTION_28();
    goto LABEL_12;
  }
  uint64_t v59 = OUTLINED_FUNCTION_32();
  uint64_t v60 = v50(v59);
  uint64_t v61 = v34 - v60;
  if (__OFSUB__(v34, v60))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v92 = v33;
  OUTLINED_FUNCTION_12();
  uint64_t v62 = v80;
  OUTLINED_FUNCTION_6_1();
  v63();
  uint64_t v64 = v86;
  OUTLINED_FUNCTION_13(v62, 1, v86);
  if (!v31)
  {
    uint64_t v65 = v83;
    uint64_t v66 = v79;
    OUTLINED_FUNCTION_3_3();
    v67();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 56))(v61, v64, v88);
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v66, v64);
    uint64_t v68 = AssociatedTypeWitness;
    uint64_t v69 = OUTLINED_FUNCTION_23();
    v70(v69);
    uint64_t v71 = OUTLINED_FUNCTION_27();
    uint64_t v72 = OUTLINED_FUNCTION_16_0();
    uint64_t v73 = v87;
    uint64_t v74 = OUTLINED_FUNCTION_16_0();
    uint64_t v75 = OUTLINED_FUNCTION_16_0();
    uint64_t v93 = v71;
    uint64_t v94 = v73;
    uint64_t v95 = v68;
    uint64_t v96 = v72;
    uint64_t v97 = v74;
    uint64_t v98 = v75;
    OUTLINED_FUNCTION_28();
    goto LABEL_12;
  }
LABEL_15:
  uint64_t v76 = OUTLINED_FUNCTION_23();
  v77(v76);
  sub_259D62DD8();
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_getAssociatedConformanceWitness();
}

void sub_259CF99B8()
{
}

void sub_259CF99DC()
{
}

uint64_t sub_259CF99F8(uint64_t result)
{
  void *v1 = result;
  return result;
}

void PhotosBasicItemList.numberOfItems.getter()
{
}

double PXRectGetMaxForAxis(uint64_t a1, double result, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 1:
      return CGRectGetMaxY(*(CGRect *)&result);
    case 2:
      return CGRectGetMaxX(*(CGRect *)&result);
    case 0:
      uint64_t v9 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v6, v5, v7, v8);
      uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat PXRectGetMaxForAxis(CGRect, PXAxis)");
      [v9 handleFailureInFunction:v10 file:@"PXAxis.m" lineNumber:119 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  return result;
}

double PXSizeGetArea(double a1, double a2)
{
  return a1 * a2;
}

void __PXAttributedStringForBadgeText_block_invoke()
{
  v18[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F81658] defaultParagraphStyle];
  uint64_t v1 = [v0 mutableCopy];
  dispatch_time_t v2 = (void *)PXAttributedStringForBadgeText_paragraphStyle;
  PXAttributedStringForBadgeText_paragraphStyle = v1;

  uint64_t v3 = [MEMORY[0x263F81708] boldSystemFontOfSize:12.0];
  uint64_t v4 = (void *)PXAttributedStringForBadgeText_fontAttributeName;
  PXAttributedStringForBadgeText_fontAttributeName = v3;

  objc_storeStrong((id *)&PXAttributedStringForBadgeText_miniFontAttributeName, (id)PXAttributedStringForBadgeText_fontAttributeName);
  uint64_t v5 = *MEMORY[0x263F814F0];
  v18[0] = PXAttributedStringForBadgeText_fontAttributeName;
  uint64_t v6 = *MEMORY[0x263F81500];
  v16[0] = v5;
  v16[1] = v6;
  uint64_t v7 = [MEMORY[0x263F825C8] whiteColor];
  uint64_t v17 = *MEMORY[0x263F81540];
  uint64_t v8 = v17;
  v18[1] = v7;
  v18[2] = PXAttributedStringForBadgeText_paragraphStyle;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:v16 count:3];
  uint64_t v10 = (void *)PXAttributedStringForBadgeText_defaultAttributes;
  PXAttributedStringForBadgeText_defaultAttributes = v9;

  v15[0] = PXAttributedStringForBadgeText_miniFontAttributeName;
  v14[0] = v5;
  v14[1] = v6;
  uint64_t v11 = [MEMORY[0x263F825C8] whiteColor];
  v14[2] = v8;
  v15[1] = v11;
  v15[2] = PXAttributedStringForBadgeText_paragraphStyle;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v13 = (void *)PXAttributedStringForBadgeText_miniAttributes;
  PXAttributedStringForBadgeText_miniAttributes = v12;
}

CGImageRef PXCreateCGImageWithDrawBlock(char a1, uint64_t a2, void *a3, double a4, double a5)
{
  uint64_t v9 = a3;
  uint64_t v10 = PXCreateContextWithAutomaticFormat(a1, a2, a4, a5);
  v9[2](v9, v10, 0.0, 0.0, a4, a5);

  CGImageRef Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  return Image;
}

CGContext *PXCreateContextWithAutomaticFormat(char a1, uint64_t a2, double a3, double a4)
{
  v21[1] = *MEMORY[0x263EF8340];
  double v6 = round(a3);
  double v7 = round(a4);
  double v8 = 1.0 - v6;
  if (1.0 - v7 > 0.00000011920929 || v8 > 0.00000011920929)
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v8);
    uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", "CGContextRef  _Nonnull PXCreateContextWithAutomaticFormat(CGSize, BOOL, PXGColorFormatRange)");
    [v16 handleFailureInFunction:v17, @"CGImage+PhotosUIFoundation.m", 83, @"Invalid parameter not satisfying: %@", @"!PXPixelSizeAreaIsZero(roundedSize)" file lineNumber description];
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __PXCreateContextWithAutomaticFormat_block_invoke;
  aBlock[3] = &__block_descriptor_33_e91_B32__0_CGBitmapContextContentInfo_IiIBB_8__CGBitmapContextInfo_IQQQQiII__CGColorSpace_BI_24l;
  char v19 = a1;
  uint64_t v10 = _Block_copy(aBlock);
  if (a2 == 1) {
    uint64_t v11 = 5;
  }
  else {
    uint64_t v11 = 1;
  }
  uint64_t v20 = *MEMORY[0x263F001B8];
  uint64_t v12 = [NSNumber numberWithInt:v11];
  v21[0] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

  uint64_t v14 = (CGContext *)CGBitmapContextCreateWithCallbacks();
  v22.size.width = (double)(unint64_t)v6;
  v22.size.height = (double)(unint64_t)v7;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  CGContextClearRect(v14, v22);

  return v14;
}

double px_dispatch_queue_wait(void *a1, double a2)
{
  double v2 = 0.0;
  if (a2 > 0.0)
  {
    uint64_t v4 = a1;
    uint64_t v5 = mach_absolute_time();
    dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_8462);
    dispatch_async(v4, v6);

    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    dispatch_block_wait(v6, v7);
    double v8 = (double)(uint64_t)(mach_absolute_time() - v5);
    if (PXTimebaseConversionFactor_onceToken != -1) {
      dispatch_once(&PXTimebaseConversionFactor_onceToken, &__block_literal_global_4962);
    }
    double v2 = *(double *)&PXTimebaseConversionFactor_timebaseConversion * v8;
  }
  return v2;
}

uint64_t sub_259CFA614()
{
  return sub_259CFA630(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_259CFA630(uint64_t a1, uint64_t a2)
{
  return sub_259CFA66C(a2);
}

uint64_t sub_259CFA66C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v1 + 16) = a1;
  swift_retain();
  sub_259CFD7F0(v2);
  swift_release();

  return swift_release();
}

void *PhotosConcatenatedItemListManager.init(mainItemListManager:prependItemListManager:appendItemListManager:waitForPrependItemListManagerList:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5 = v4;
  LODWORD(v88) = a4;
  uint64_t v92 = a3;
  double v8 = (void *)*v4;
  uint64_t v9 = v8[12];
  uint64_t v94 = v8[15];
  uint64_t v95 = v9;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_259D62B68();
  MEMORY[0x270FA5388](v10 - 8, v11);
  OUTLINED_FUNCTION_6_0((uint64_t)v82 - v12);
  uint64_t v14 = *(void *)(v13 + 112);
  uint64_t v93 = v8[11];
  uint64_t v87 = swift_getAssociatedTypeWitness();
  uint64_t v15 = sub_259D62B68();
  MEMORY[0x270FA5388](v15 - 8, v16);
  OUTLINED_FUNCTION_6_0((uint64_t)v82 - v17);
  uint64_t v19 = *(void *)(v18 + 104);
  uint64_t v20 = v8[10];
  v82[0] = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v82[0], v21);
  uint64_t v23 = (char *)v82 - v22;
  v5[7] = MEMORY[0x263F8EE78];
  type metadata accessor for PhotosItemListChangeDetailsRepository();
  swift_allocObject();
  v5[8] = PhotosItemListChangeDetailsRepository.init(countLimit:)(100);
  v5[9] = objc_msgSend(objc_allocWithZone((Class)PXObservable), sel_init);
  sub_259D623F8();
  v5[3] = a1;
  void v5[4] = a2;
  v5[5] = v92;
  *((unsigned char *)v5 + 48) = v88;
  uint64_t v24 = *(void (**)(uint64_t))(v19 + 40);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v82[1] = v23;
  uint64_t v25 = a1;
  uint64_t v26 = v93;
  uint64_t v27 = v19;
  uint64_t v28 = v20;
  uint64_t v85 = v27;
  v24(v20);
  uint64_t v86 = v14;
  uint64_t v89 = a2;
  if (a2)
  {
    uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v14 + 40);
    swift_unknownObjectRetain();
    uint64_t v30 = v90;
    v29(v26, v14);
    swift_unknownObjectRelease();
    uint64_t v31 = 0;
    uint64_t v32 = v30;
  }
  else
  {
    uint64_t v31 = 1;
    uint64_t v32 = v90;
  }
  uint64_t v33 = 1;
  __swift_storeEnumTagSinglePayload(v32, v31, 1, v87);
  uint64_t v88 = v25;
  uint64_t v34 = v94;
  v91 = v5;
  if (v92)
  {
    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v94 + 40);
    swift_unknownObjectRetain();
    uint64_t v36 = v84;
    v35(v95, v34);
    swift_unknownObjectRelease();
    uint64_t v33 = 0;
  }
  else
  {
    uint64_t v36 = v84;
  }
  uint64_t v37 = AssociatedTypeWitness;
  __swift_storeEnumTagSinglePayload(v36, v33, 1, AssociatedTypeWitness);
  uint64_t v38 = v85;
  uint64_t v39 = v82[0];
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v41 = v86;
  uint64_t v84 = v28;
  uint64_t v42 = v93;
  uint64_t v43 = v87;
  uint64_t v44 = swift_getAssociatedConformanceWitness();
  uint64_t v45 = swift_getAssociatedConformanceWitness();
  uint64_t v96 = v39;
  uint64_t v97 = v43;
  uint64_t v98 = v37;
  uint64_t v99 = AssociatedConformanceWitness;
  uint64_t v46 = v38;
  uint64_t v100 = v44;
  uint64_t v101 = v45;
  type metadata accessor for PhotosConcatenatedItemList();
  v91[2] = PhotosConcatenatedItemList.__allocating_init(mainItemList:prependItemList:appendItemList:)();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3ECF40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_259D717F0;
  uint64_t v96 = v88;
  uint64_t v48 = swift_allocObject();
  swift_weakInit();
  uint64_t v49 = (void *)swift_allocObject();
  uint64_t v50 = v84;
  v49[2] = v84;
  v49[3] = v42;
  uint64_t v51 = v94;
  v49[4] = v95;
  v49[5] = v46;
  v49[6] = v41;
  v49[7] = v51;
  v49[8] = v48;
  uint64_t v52 = v50;
  uint64_t v53 = (*(uint64_t (**)(uint64_t (*)(), void *))(*(void *)(v46 + 16) + 24))(sub_259CEBAC0, v49);
  uint64_t v55 = v54;
  swift_release();
  *(void *)(inited + 32) = v53;
  *(void *)(inited + 40) = v55;
  if (v89)
  {
    uint64_t v56 = v51;
    uint64_t v96 = v89;
    uint64_t v57 = swift_allocObject();
    swift_weakInit();
    uint64_t v58 = (void *)swift_allocObject();
    uint64_t v59 = v93;
    v58[2] = v52;
    v58[3] = v59;
    uint64_t v60 = v95;
    v58[4] = v95;
    v58[5] = v46;
    v58[6] = v41;
    v58[7] = v56;
    v58[8] = v57;
    uint64_t v61 = *(void *)(v41 + 16);
    uint64_t v62 = *(uint64_t (**)(uint64_t (*)(), void *, uint64_t, uint64_t))(v61 + 24);
    swift_unknownObjectRetain();
    uint64_t v63 = v62(sub_259CEBAC0, v58, v59, v61);
    uint64_t v65 = v64;
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v63 = 0;
    uint64_t v65 = 0;
    uint64_t v60 = v95;
  }
  *(void *)(inited + 48) = v63;
  *(void *)(inited + 56) = v65;
  if (v92)
  {
    uint64_t v96 = v92;
    uint64_t v66 = swift_allocObject();
    uint64_t v67 = v91;
    swift_weakInit();
    uint64_t v68 = (void *)swift_allocObject();
    uint64_t v69 = v93;
    v68[2] = v84;
    v68[3] = v69;
    uint64_t v70 = v85;
    v68[4] = v60;
    v68[5] = v70;
    uint64_t v71 = v94;
    v68[6] = v86;
    v68[7] = v71;
    v68[8] = v66;
    uint64_t v72 = *(void *)(v71 + 16);
    uint64_t v73 = *(uint64_t (**)(uint64_t (*)(), void *, uint64_t, uint64_t))(v72 + 24);
    swift_unknownObjectRetain();
    uint64_t v74 = v73(sub_259CEBAC0, v68, v60, v72);
    uint64_t v76 = v75;
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v74 = 0;
    uint64_t v76 = 0;
    uint64_t v67 = v91;
  }
  *(void *)(inited + 64) = v74;
  *(void *)(inited + 72) = v76;
  if (*(void *)(inited + 32))
  {
    swift_unknownObjectRetain();
    v77 = sub_259CFB06C(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v78 = v77[3];
    if (v77[2] >= v78 >> 1) {
      v77 = OUTLINED_FUNCTION_2_3(v78);
    }
    OUTLINED_FUNCTION_4_1();
  }
  else
  {
    v77 = (void *)MEMORY[0x263F8EE78];
  }
  if (*(void *)(inited + 48))
  {
    swift_unknownObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v77 = OUTLINED_FUNCTION_5_1();
    }
    unint64_t v79 = v77[3];
    if (v77[2] >= v79 >> 1) {
      v77 = OUTLINED_FUNCTION_2_3(v79);
    }
    OUTLINED_FUNCTION_4_1();
  }
  if (*(void *)(inited + 64))
  {
    swift_unknownObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v77 = OUTLINED_FUNCTION_5_1();
    }
    unint64_t v80 = v77[3];
    if (v77[2] >= v80 >> 1) {
      v77 = OUTLINED_FUNCTION_2_3(v80);
    }
    OUTLINED_FUNCTION_4_1();
  }
  swift_bridgeObjectRelease();
  sub_259CFD6A8((uint64_t)v77, (uint64_t)&unk_259D72230, (uint64_t)sub_259CDEA34, MEMORY[0x263F8EEA0]);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v67;
}

uint64_t type metadata accessor for PhotosConcatenatedItemList()
{
  return swift_getGenericMetadata();
}

void *sub_259CFAF68(void *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  char v10 = (char)result;
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    int64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v12 = a2;
      }
    }
  }
  else
  {
    int64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v15 = (void *)swift_allocObject();
    size_t v16 = _swift_stdlib_malloc_size(v15);
    v15[2] = v13;
    void v15[3] = 2 * ((uint64_t)(v16 - 32) / 16);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v17 = v15 + 4;
  if (v10)
  {
    a7(a4 + 32, v13, v17);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    a6(0, v13, v17, a4);
  }
  return v15;
}

void *sub_259CFB06C(void *a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_259CFAF68(a1, a2, a3, a4, &qword_26A3ECF38, (void (*)(void, uint64_t, void *, uint64_t))sub_259CFBE14, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
}

uint64_t PhotosConcatenatedItemList.__allocating_init(mainItemList:prependItemList:appendItemList:)()
{
  uint64_t v0 = swift_allocObject();
  OUTLINED_FUNCTION_31();
  PhotosConcatenatedItemList.init(mainItemList:prependItemList:appendItemList:)();
  return v0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return v0;
}

void PhotosConcatenatedItemList.init(mainItemList:prependItemList:appendItemList:)()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v37 = v1;
  uint64_t v3 = v2;
  uint64_t v4 = *(void **)v0;
  uint64_t v35 = *(void **)v0;
  uint64_t v33 = *(void *)(*(void *)v0 + 96);
  uint64_t v5 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v36 = v6;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v7, v8);
  OUTLINED_FUNCTION_10_0();
  uint64_t v32 = v9;
  OUTLINED_FUNCTION_14();
  uint64_t v11 = *(void *)(v10 + 88);
  uint64_t v12 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v15, v16);
  OUTLINED_FUNCTION_17();
  uint64_t v17 = v4[19];
  *(void *)(v0 + v17) = PXDataSourceIdentifierMakeUnique();
  OUTLINED_FUNCTION_12();
  uint64_t v18 = v4[10];
  OUTLINED_FUNCTION_6_1();
  v19();
  uint64_t v20 = *(void (**)(void))(v14 + 16);
  OUTLINED_FUNCTION_29();
  v20();
  OUTLINED_FUNCTION_6_1();
  v21();
  uint64_t v34 = v3;
  OUTLINED_FUNCTION_29();
  v20();
  uint64_t v22 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_13(v22, v23, v11);
  if (v24)
  {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v0, v12);
    uint64_t v26 = v35[13];
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    sub_259D627D8();
  }
  else
  {
    (*(void (**)(uint64_t))(v35[14] + 48))(v11);
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_15();
    v25();
    uint64_t v26 = v35[13];
  }
  (*(void (**)(uint64_t, uint64_t))(v26 + 48))(v18, v26);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  sub_259D627C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_1();
  v27();
  OUTLINED_FUNCTION_13(v32, 1, v33);
  if (v24)
  {
    uint64_t v29 = v36;
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v32, v5);
    sub_259D627D8();
  }
  else
  {
    (*(void (**)(uint64_t))(v35[15] + 48))(v33);
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_15();
    v28();
    uint64_t v29 = v36;
  }
  uint64_t v30 = sub_259D627C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v37, v5);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v34, v12);
  OUTLINED_FUNCTION_15();
  v31();
  *(void *)(v0 + *(void *)(*(void *)v0 + 160)) = v30;
  OUTLINED_FUNCTION_4_2();
}

void PhotosConcatenatedItemList.index(for:)()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_7_0();
  uint64_t v60 = v2;
  uint64_t v61 = v1;
  uint64_t v58 = v0[12];
  sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v55 = v4;
  uint64_t v56 = v3;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v5, v6);
  OUTLINED_FUNCTION_10_0();
  uint64_t v57 = v7;
  uint64_t v8 = v0[13];
  uint64_t v9 = v0[10];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  uint64_t v14 = MEMORY[0x270FA5388](v12, v13);
  uint64_t v59 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14, v16);
  uint64_t v18 = (char *)&v55 - v17;
  uint64_t v19 = v0[11];
  uint64_t v20 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v22 = v21;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v23, v24);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_6_1();
  v25();
  uint64_t v26 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_13(v26, v27, v19);
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v22 + 8))(&protocol requirements base descriptor for PhotosItemList, v20);
    uint64_t v29 = 0;
    char v31 = 1;
  }
  else
  {
    uint64_t v29 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v60 + 112) + 72))(v61, v19);
    char v31 = v30 & 1;
    OUTLINED_FUNCTION_8_0();
    (*(void (**)(void *, uint64_t))(v32 + 8))(&protocol requirements base descriptor for PhotosItemList, v19);
  }
  sub_259CFBAC4(v29, v31, 0);
  char v34 = v33;
  uint64_t v35 = *(void (**)(uint64_t))(v11 + 16);
  uint64_t v36 = OUTLINED_FUNCTION_23();
  uint64_t v37 = AssociatedTypeWitness;
  v35(v36);
  if (v34)
  {
    OUTLINED_FUNCTION_12();
    uint64_t v39 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 72))(v18, v9, v8);
    sub_259CFBAC4(v39, v40 & 1, 1);
    char v42 = v41;
    uint64_t v43 = v59;
    ((void (*)(char *, char *, uint64_t))v35)(v59, v18, v37);
    if (v42)
    {
      OUTLINED_FUNCTION_12();
      uint64_t v45 = v55;
      uint64_t v44 = v56;
      uint64_t v46 = v57;
      OUTLINED_FUNCTION_6_1();
      v47();
      uint64_t v48 = v58;
      OUTLINED_FUNCTION_13(v46, 1, v58);
      if (v28)
      {
        (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v44);
        uint64_t v49 = 0;
        char v51 = 1;
      }
      else
      {
        uint64_t v49 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v60 + 120) + 72))(v43, v48);
        char v51 = v50 & 1;
        OUTLINED_FUNCTION_8_0();
        (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v46, v48);
      }
      sub_259CFBAC4(v49, v51, 2);
    }
    uint64_t v53 = *(void (**)(void))(v11 + 8);
    uint64_t v54 = AssociatedTypeWitness;
    OUTLINED_FUNCTION_11();
    v53();
    ((void (*)(char *, uint64_t))v53)(v18, v54);
  }
  else
  {
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_11();
    v38();
  }
  OUTLINED_FUNCTION_4_2();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return v0;
}

uint64_t sub_259CFBAC4(uint64_t a1, char a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(void **)v3;
  uint64_t v9 = *(void *)(*(void *)v3 + 88);
  uint64_t v10 = sub_259D62B68();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v10, v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13, v16);
  uint64_t v18 = (char *)&v24 - v17;
  if ((a2 & 1) != 0 || !a3) {
    return a1;
  }
  if (a3 == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v24 - v17, v4 + v8[17], v10);
    if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v9) == 1)
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v18, v10);
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v19 = (*(uint64_t (**)(uint64_t))(v8[14] + 32))(v9);
      (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v18, v9);
    }
    BOOL v22 = __OFADD__(a1, v19);
    a1 += v19;
    if (!v22) {
      return a1;
    }
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v15, v4 + v8[17], v10);
    if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v9) == 1)
    {
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v15, v10);
      uint64_t v21 = 0;
      goto LABEL_13;
    }
  }
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(v8[14] + 32))(v9);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v15, v9);
LABEL_13:
  BOOL v22 = __OFADD__(a1, v21);
  uint64_t v23 = a1 + v21;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(void))(v8[13] + 32))(v8[10]);
    BOOL v22 = __OFADD__(v23, result);
    a1 = v23 + result;
    if (!v22) {
      return a1;
    }
  }
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  *(void *)(v1 - 160) = v0;
  *(unsigned char *)(v1 - 152) = 0;
  return 0;
}

uint64_t sub_259CFBE14(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECD78);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_259D62E48();
  __break(1u);
  return result;
}

char *sub_259CFBF2C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_15();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_17();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_12(a3, result);
  }
  return result;
}

void sub_259CFBF84()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)*v0;
  v147 = v2;
  uint64_t v3 = v2[13];
  uint64_t v165 = v2[10];
  uint64_t v166 = v3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v146 = sub_259D62B68();
  uint64_t v145 = *(void *)(v146 - 8);
  MEMORY[0x270FA5388](v146, v5);
  v144 = (char *)&v132 - v6;
  uint64_t v7 = v2[12];
  uint64_t v160 = v2[15];
  uint64_t v159 = v7;
  uint64_t v164 = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_259D62B68();
  uint64_t v153 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8, v9);
  v148 = (char *)&v132 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10, v12);
  v135 = (char *)&v132 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13, v15);
  v134 = (char *)&v132 - v17;
  MEMORY[0x270FA5388](v16, v18);
  v149 = (char *)&v132 - v19;
  uint64_t v20 = v2[14];
  uint64_t v162 = v2[11];
  uint64_t v163 = v20;
  uint64_t v21 = swift_getAssociatedTypeWitness();
  uint64_t v157 = sub_259D62B68();
  uint64_t v158 = *(void *)(v157 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v157, v22);
  v143 = (char *)&v132 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23, v25);
  char v28 = (char *)&v132 - v27;
  uint64_t v30 = MEMORY[0x270FA5388](v26, v29);
  uint64_t v32 = (char *)&v132 - v31;
  uint64_t v34 = MEMORY[0x270FA5388](v30, v33);
  uint64_t v36 = (char *)&v132 - v35;
  uint64_t v150 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v38 = MEMORY[0x270FA5388](v34, v37);
  v161 = (uint64_t (**)(uint64_t))((char *)&v132 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v41 = MEMORY[0x270FA5388](v38, v40);
  uint64_t v43 = (char *)&v132 - v42;
  uint64_t v167 = v21;
  uint64_t v155 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v41, v44);
  uint64_t v46 = (char *)&v132 - v45;
  uint64_t v47 = v1[4];
  uint64_t v151 = AssociatedTypeWitness;
  uint64_t v156 = v8;
  uint64_t v154 = v47;
  v138 = v28;
  v152 = v36;
  if (!v47 || *((unsigned char *)v1 + 48) != 1) {
    goto LABEL_5;
  }
  uint64_t v48 = v163;
  uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v163 + 40);
  swift_unknownObjectRetain();
  v49(v162, v48);
  uint64_t v50 = v167;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(id **__return_ptr, uint64_t, uint64_t))(AssociatedConformanceWitness + 112))(&v168, v50, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v155 + 8))(v46, v50);
  if (!(_BYTE)v168)
  {
    swift_unknownObjectRelease();
    return;
  }
  (*(void (**)(uint64_t, uint64_t))(v166 + 40))(v165, v166);
  uint64_t AssociatedTypeWitness = v151;
  uint64_t v52 = swift_getAssociatedConformanceWitness();
  (*(void (**)(id **__return_ptr, uint64_t, uint64_t))(v52 + 112))(&v168, AssociatedTypeWitness, v52);
  uint64_t v47 = v154;
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v150 + 8))(v43, AssociatedTypeWitness);
  uint64_t v36 = v152;
  if ((_BYTE)v168)
  {
LABEL_5:
    uint64_t v53 = PhotosConcatenatedItemListManager.itemList.getter();
    uint64_t v54 = v1[3];
    (*(void (**)(uint64_t))(v166 + 40))(v165);
    if (v47)
    {
      (*(void (**)(uint64_t))(v163 + 40))(v162);
      uint64_t v55 = 0;
    }
    else
    {
      uint64_t v55 = 1;
    }
    uint64_t v56 = v160;
    uint64_t v57 = (uint64_t)v36;
    uint64_t v58 = 1;
    __swift_storeEnumTagSinglePayload(v57, v55, 1, v167);
    v139 = v1;
    uint64_t v59 = v1[5];
    uint64_t v141 = v54;
    uint64_t v140 = v59;
    v136 = v32;
    uint64_t v142 = v53;
    uint64_t v60 = (uint64_t)v149;
    if (v59)
    {
      (*(void (**)(uint64_t, uint64_t))(v56 + 40))(v159, v56);
      uint64_t v58 = 0;
    }
    uint64_t v61 = v164;
    __swift_storeEnumTagSinglePayload(v60, v58, 1, v164);
    uint64_t v62 = swift_getAssociatedConformanceWitness();
    uint64_t v63 = v167;
    uint64_t v64 = swift_getAssociatedConformanceWitness();
    uint64_t v65 = swift_getAssociatedConformanceWitness();
    v168 = (id *)AssociatedTypeWitness;
    uint64_t v169 = v63;
    uint64_t v170 = v61;
    uint64_t v171 = v62;
    v149 = (char *)v64;
    uint64_t v172 = v64;
    uint64_t v173 = v65;
    uint64_t v137 = v65;
    type metadata accessor for PhotosConcatenatedItemList();
    uint64_t v66 = PhotosConcatenatedItemList.__allocating_init(mainItemList:prependItemList:appendItemList:)();
    uint64_t v67 = v142;
    uint64_t v68 = (char *)(v142 + *(void *)(*(void *)v142 + 128));
    v161 = (uint64_t (**)(uint64_t))v62;
    uint64_t v69 = *(void *)(v62 + 8);
    uint64_t v70 = *(uint64_t (**)(uint64_t, uint64_t))(v69 + 8);
    uint64_t v71 = v70(AssociatedTypeWitness, v69);
    uint64_t v72 = v70(AssociatedTypeWitness, v69);
    uint64_t v73 = v156;
    if (v71 == v72)
    {
      v152 = v68;
      uint64_t v74 = v158;
      uint64_t v75 = *(void (**)(char *, uint64_t, uint64_t))(v158 + 16);
      uint64_t v76 = (uint64_t)v136;
      uint64_t v77 = v157;
      v75(v136, v67 + *(void *)(*(void *)v67 + 136), v157);
      int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v76, 1, v167);
      if (EnumTagSinglePayload == 1)
      {
        uint64_t v133 = 0;
        uint64_t v81 = v74;
        uint64_t v82 = v77;
      }
      else
      {
        uint64_t v79 = v167;
        uint64_t v80 = (*(uint64_t (**)(uint64_t))(*((void *)v149 + 1) + 8))(v167);
        uint64_t v77 = v157;
        uint64_t v133 = v80;
        uint64_t v81 = v155;
        uint64_t v82 = v79;
      }
      uint64_t v83 = (uint64_t)v138;
      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v76, v82);
      v75((char *)v83, v66 + *(void *)(*(void *)v66 + 136), v77);
      if (__swift_getEnumTagSinglePayload(v83, 1, v167) == 1)
      {
        (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v83, v77);
        BOOL v84 = EnumTagSinglePayload == 1;
      }
      else
      {
        uint64_t v85 = v167;
        uint64_t v86 = (*(uint64_t (**)(uint64_t))(*((void *)v149 + 1) + 8))(v167);
        (*(void (**)(uint64_t, uint64_t))(v155 + 8))(v83, v85);
        BOOL v84 = EnumTagSinglePayload != 1 && v133 == v86;
      }
      uint64_t v73 = v156;
      uint64_t v68 = v152;
      if (v84)
      {
        uint64_t v87 = v153;
        uint64_t v88 = *(void (**)(char *, uint64_t, uint64_t))(v153 + 16);
        uint64_t v89 = (uint64_t)v134;
        v88(v134, v67 + *(void *)(*(void *)v67 + 144), v156);
        int v90 = __swift_getEnumTagSinglePayload(v89, 1, v164);
        if (v90 == 1)
        {
          (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v89, v73);
          v138 = 0;
        }
        else
        {
          uint64_t v91 = v89;
          uint64_t v92 = v164;
          uint64_t v93 = (*(uint64_t (**)(uint64_t))(*(void *)(v137 + 8) + 8))(v164);
          uint64_t v87 = v153;
          v138 = (char *)v93;
          uint64_t v94 = v91;
          uint64_t v68 = v152;
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v92 - 8) + 8))(v94, v92);
        }
        uint64_t v95 = (uint64_t)v135;
        v88(v135, v66 + *(void *)(*(void *)v66 + 144), v73);
        if (__swift_getEnumTagSinglePayload(v95, 1, v164) == 1)
        {
          (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v95, v73);
          if (v90 == 1)
          {
LABEL_50:
            swift_release();
            swift_release();
            return;
          }
        }
        else
        {
          uint64_t v96 = v95;
          uint64_t v97 = v164;
          uint64_t v98 = (*(uint64_t (**)(uint64_t))(*(void *)(v137 + 8) + 8))(v164);
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v97 - 8) + 8))(v96, v97);
          if (v90 != 1 && v138 == (char *)v98) {
            goto LABEL_50;
          }
        }
      }
    }
    __swift_instantiateConcreteTypeFromMangledName(qword_26A3EC208);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_259D720A0;
    *(void *)(inited + 32) = sub_259CFD09C(v67 + *(void *)(*(void *)v67 + 136), v154, v162, v163);
    uint64_t v101 = (uint64_t)v144;
    uint64_t v102 = v151;
    (*(void (**)(char *, char *, uint64_t))(v150 + 16))(v144, v68, v151);
    __swift_storeEnumTagSinglePayload(v101, 0, 1, v102);
    id v103 = sub_259CFD09C(v101, v141, v165, v166);
    (*(void (**)(uint64_t, uint64_t))(v145 + 8))(v101, v146);
    *(void *)(inited + 40) = v103;
    *(void *)(inited + 48) = sub_259CFD09C(v67 + *(void *)(*(void *)v67 + 144), v140, v159, v160);
    v168 = (id *)inited;
    sub_259D62798();
    unint64_t v104 = (unint64_t)v168;
    uint64_t v105 = (uint64_t)v143;
    uint64_t v106 = v157;
    (*(void (**)(char *, uint64_t, uint64_t))(v158 + 16))(v143, v66 + *(void *)(*(void *)v66 + 136), v157);
    if (__swift_getEnumTagSinglePayload(v105, 1, v167) == 1)
    {
      uint64_t v107 = v105;
      uint64_t v108 = 0;
      uint64_t v109 = (uint64_t)v148;
      uint64_t v110 = v158;
    }
    else
    {
      uint64_t v111 = v167;
      uint64_t v112 = (*((uint64_t (**)(uint64_t))v149 + 4))(v167);
      uint64_t v107 = v105;
      uint64_t v108 = v112;
      uint64_t v110 = v155;
      uint64_t v106 = v111;
      uint64_t v109 = (uint64_t)v148;
    }
    (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v107, v106);
    uint64_t v113 = v161[4](v102);
    uint64_t v114 = v153;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v153 + 16))(v109, v66 + *(void *)(*(void *)v66 + 144), v73);
    if (__swift_getEnumTagSinglePayload(v109, 1, v164) == 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v109, v73);
    }
    else
    {
      uint64_t v115 = v164;
      (*(void (**)(uint64_t))(v137 + 32))(v164);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v115 - 8) + 8))(v109, v115);
    }
    sub_259CFD594(0, &qword_26A3EC1F8);
    id v116 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_changeDetailsWithNoChanges);
    unint64_t v117 = v104 & 0xC000000000000001;
    if ((v104 & 0xC000000000000001) == 0)
    {
      unint64_t v118 = *(void *)((v104 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v118)
      {
        if (v118 > 2)
        {
          id v119 = *(id *)(v104 + 32);
          goto LABEL_42;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_55;
    }
    id v119 = (id)MEMORY[0x25A2E93F0](0, v104);
LABEL_42:
    v120 = v119;
    id v121 = objc_msgSend(v119, sel_changeDetailsShiftedBy_, 0);
    objc_msgSend(v116, sel_addChangeDetails_, v121);

    if (v117) {
      id v122 = (id)MEMORY[0x25A2E93F0](1, v104);
    }
    else {
      id v122 = *(id *)(v104 + 40);
    }
    v123 = v122;
    id v124 = objc_msgSend(v122, sel_changeDetailsShiftedBy_, v108);
    objc_msgSend(v116, sel_addChangeDetails_, v124);

    BOOL v125 = __OFADD__(v108, v113);
    uint64_t v126 = v108 + v113;
    if (!v125)
    {
      if (v117) {
        id v127 = (id)MEMORY[0x25A2E93F0](2, v104);
      }
      else {
        id v127 = *(id *)(v104 + 48);
      }
      v128 = v127;
      id v129 = objc_msgSend(v127, sel_changeDetailsShiftedBy_, v126);
      objc_msgSend(v116, sel_addChangeDetails_, v129);
      swift_bridgeObjectRelease();

      uint64_t v130 = *(void *)(v66 + *(void *)(*(void *)v66 + 152));
      v168 = *(id **)(v67 + *(void *)(*(void *)v67 + 152));
      uint64_t v169 = v130;
      uint64_t v170 = (uint64_t)v116;
      id v131 = v116;
      sub_259CFD5D0(v66, (uint64_t *)&v168);

      goto LABEL_50;
    }
LABEL_55:
    __break(1u);
  }
}

id sub_259CFD09C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_259D62B68();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v13 = (char *)&v28[-1] - v12;
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v11, v15);
  uint64_t v18 = (char *)&v28[-1] - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16, v19);
  uint64_t v21 = (char *)&v28[-1] - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, a1, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v21, v13, AssociatedTypeWitness);
    if (v27)
    {
      uint64_t v22 = *(void (**)(uint64_t, uint64_t))(a4 + 40);
      swift_unknownObjectRetain();
      v22(a3, a4);
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      PhotosItemListManager.changeDetails<A, B>(from:to:)((uint64_t)v21, (uint64_t)v18, a3, AssociatedTypeWitness, AssociatedTypeWitness, a4, AssociatedConformanceWitness, AssociatedConformanceWitness, v28);
      swift_unknownObjectRelease();
      uint64_t v24 = *(void (**)(char *, uint64_t))(v14 + 8);
      v24(v18, AssociatedTypeWitness);
      v24(v21, AssociatedTypeWitness);
      return (id)v28[2];
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v21, AssociatedTypeWitness);
  }
  id v26 = objc_msgSend(self, sel_changeDetailsWithNoChanges);

  return v26;
}

uint64_t PhotosItemListManager.changeDetails<A, B>(from:to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(a6 + 48))(a3, a6);
  sub_259CFD440(a1, a2, a4, a5, a7, a8, a9);

  return swift_release();
}

void sub_259CFD440(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)(a5 + 8) + 8))(a3);
  uint64_t v21 = a6;
  uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)(a6 + 8) + 8))(a4);
  sub_259CEF26C(v14, v15, &v22);
  uint64_t v16 = v22;
  uint64_t v17 = v23;
  id v18 = v24;
  if ((objc_msgSend(v24, sel_hasIncrementalChanges) & 1) == 0)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    static PhotosItemListChangeDetails.calculateChangeDetails<A, B, C>(from:to:allItemsChanged:)(a1, a2, 1, AssociatedTypeWitness, a3, a4, a5, v21, &v22);
    uint64_t v16 = v22;
    uint64_t v17 = v23;
    id v20 = v24;
    sub_259CEF870(&v22);

    id v18 = v20;
  }
  *a7 = v16;
  a7[1] = v17;
  a7[2] = (uint64_t)v18;
}

uint64_t sub_259CFD594(uint64_t a1, unint64_t *a2)
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

uint64_t sub_259CFD5D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = PhotosConcatenatedItemListManager.itemList.getter();
  uint64_t v7 = *(void *)(v6 + *(void *)(*(void *)v6 + 152));
  uint64_t result = swift_release();
  if (v7 != *(void *)(a1 + *(void *)(*(void *)a1 + 152)))
  {
    v10[0] = v3;
    v10[1] = v4;
    void v10[2] = v5;
    sub_259CEF870(v10);
    uint64_t v9 = swift_retain();
    return sub_259CFD6A8(v9, (uint64_t)&unk_259D720B0, (uint64_t)sub_259CFA614, MEMORY[0x263F8EED8]);
  }
  return result;
}

uint64_t sub_259CFD6A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  return a4(a1);
}

uint64_t sub_259CFD744()
{
  return sub_259D623D8();
}

uint64_t sub_259CFD7F0(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(a1 + *(void *)(*(void *)a1 + 152));
  uint64_t v4 = PhotosConcatenatedItemListManager.itemList.getter();
  uint64_t v5 = *(void *)(v4 + *(void *)(*(void *)v4 + 152));
  uint64_t result = swift_release();
  if (v3 != v5)
  {
    uint64_t v7 = swift_allocObject();
    swift_weakInit();
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = *(_OWORD *)(v2 + 80);
    *(void *)(v8 + 32) = *(void *)(v2 + 96);
    *(_OWORD *)(v8 + 40) = *(_OWORD *)(v2 + 104);
    *(void *)(v8 + 56) = *(void *)(v2 + 120);
    *(void *)(v8 + 64) = v7;
    swift_retain();
    PXObservable.performChanges(_:)((uint64_t)sub_259CEACD0, v8);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_259CFD93C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosConcatenatedItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

uint64_t PhotosConcatenatedItemListManager.itemList.getter()
{
  return swift_retain();
}

uint64_t sub_259CFD9C4()
{
  return sub_259D623E8();
}

void PXObservable.performChanges(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v7[4] = sub_259CEACA8;
  v7[5] = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_259CEA34C;
  v7[3] = &block_descriptor_3;
  uint64_t v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_performChanges_, v6);
  _Block_release(v6);
}

uint64_t sub_259CFDB18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosBasicItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

id sub_259CFDB40()
{
  return OUTLINED_FUNCTION_2_22();
}

void __px_dispatch_on_main_queue_when_idle_after_delay_block_invoke_2(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 3221225472;
  v1[2] = __px_dispatch_on_main_queue_when_idle_after_delay_block_invoke_3;
  v1[3] = &unk_26545BC28;
  uint64_t v3 = *(void *)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v1);
}

id PXFilter(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = a2;
  if (v3)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (v4[2](v4, v11)) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id PXAttributedStringForBadgeText(void *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  if (PXAttributedStringForBadgeText_onceToken == -1)
  {
    if (!a3)
    {
LABEL_6:
      [(id)PXAttributedStringForBadgeText_paragraphStyle setAlignment:a2];
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&PXAttributedStringForBadgeText_onceToken, &__block_literal_global_4578);
    if (!a3) {
      goto LABEL_6;
    }
  }
  if (a3 == 1 && a2 <= 4)
  {
    a2 = qword_259D74930[a2];
    goto LABEL_6;
  }
LABEL_7:
  if (a4 == 1)
  {
    uint64_t v8 = &PXAttributedStringForBadgeText_miniAttributes;
    goto LABEL_11;
  }
  if (!a4)
  {
    uint64_t v8 = &PXAttributedStringForBadgeText_defaultAttributes;
LABEL_11:
    id v9 = (id)*v8;
    goto LABEL_13;
  }
  id v9 = 0;
LABEL_13:
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v9];

  return v10;
}

void __px_dispatch_on_main_queue_when_idle_after_delay_block_invoke(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(-32768, 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __px_dispatch_on_main_queue_when_idle_after_delay_block_invoke_2;
  v3[3] = &unk_26545BC28;
  uint64_t v5 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);
}

BOOL sub_259CFE020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1, a1);
  id v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v11 = *(void (**)(char *))(v6 + 16);
  v11((char *)v26 - v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECEA8);
  swift_dynamicCast();
  uint64_t v13 = v32;
  uint64_t v14 = v33;
  long long v15 = __swift_project_boxed_opaque_existential_1(v31, v32);
  MEMORY[0x270FA5388](v15, v15);
  uint64_t v17 = (char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v18 + 16))(v17);
  PhotosAnyEquatable.init<A>(_:)((uint64_t)v17, v13, v14, v30);
  ((void (*)(char *, uint64_t, uint64_t))v11)(v9, a2, a4);
  swift_dynamicCast();
  uint64_t v19 = v28;
  uint64_t v20 = v29;
  uint64_t v21 = __swift_project_boxed_opaque_existential_1(v27, v28);
  MEMORY[0x270FA5388](v21, v21);
  uint64_t v23 = (char *)v26 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v24 + 16))(v23);
  PhotosAnyEquatable.init<A>(_:)((uint64_t)v23, v19, v20, v26);
  LOBYTE(v19) = ((uint64_t (*)(uint64_t *))v30[4])(v26);
  sub_259CFF00C((uint64_t)v26);
  sub_259CFF00C((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  return (v19 & 1) == 0;
}

uint64_t static AnyPhotosObservableProperty.subscript.setter(uint64_t a1, char *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v93 = a1;
  uint64_t v7 = *a3;
  uint64_t v85 = a3;
  uint64_t v8 = v7;
  uint64_t v9 = *MEMORY[0x263F8E100];
  uint64_t v10 = *MEMORY[0x263F8E100] + 8;
  uint64_t v11 = *(void *)(*a4 + v10);
  uint64_t v79 = *(void *)(v11 + 32);
  uint64_t v12 = *(void *)(v79 + 8);
  uint64_t v13 = *(void *)(v11 + 16);
  uint64_t v87 = v11;
  uint64_t v88 = v13;
  uint64_t v73 = v12;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v76 = v14;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v15, v16);
  uint64_t v74 = (char *)&v71 - v17;
  OUTLINED_FUNCTION_0_0();
  uint64_t v92 = v18;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v19, v20);
  unint64_t v78 = (char *)&v71 - v21;
  uint64_t v22 = *(void *)(v8 + v9);
  OUTLINED_FUNCTION_0_0();
  uint64_t v24 = v23;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v25, v26);
  uint64_t v28 = (char *)&v71 - v27;
  uint64_t v29 = *(void *)(v8 + v10);
  OUTLINED_FUNCTION_0_0();
  uint64_t v31 = v30;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v32, v33);
  uint64_t v35 = (char *)&v71 - v34;
  uint64_t v91 = (char *)&v71 - v34;
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v81 = v37;
  uint64_t v82 = v36;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v38, v39);
  uint64_t v40 = *(void (**)(uint64_t, uint64_t))(a5 + 32);
  uint64_t v80 = (char *)&v71 - v41;
  uint64_t v75 = a5;
  v40(v22, a5);
  swift_retain();
  uint64_t v42 = a2;
  uint64_t v43 = (void (*)(void *, void))swift_readAtKeyPath();
  (*(void (**)(char *))(v31 + 16))(v35);
  v43(v94, 0);
  swift_release();
  uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
  v44(v28, (uint64_t)v42, v22);
  uint64_t v45 = (void (*)(void *, void))swift_modifyAtReferenceWritableKeyPath();
  uint64_t v83 = v31;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 24))(v46, v93, v29);
  v45(v94, 0);
  uint64_t v47 = *(void (**)(char *, uint64_t))(v24 + 8);
  v47(v28, v22);
  int v90 = v42;
  uint64_t v72 = v44;
  v44(v28, (uint64_t)v42, v22);
  swift_retain();
  uint64_t v48 = v78;
  swift_getAtKeyPath();
  swift_release();
  uint64_t v89 = v24 + 8;
  uint64_t v86 = v47;
  v47(v28, v22);
  uint64_t v49 = v87;
  uint64_t v50 = (unint64_t *)&v48[*(int *)(v87 + 44)];
  char v51 = v48;
  unint64_t v52 = *v50;
  unint64_t v53 = v50[1];
  sub_259CFEAD8(*v50);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v92 + 8);
  v92 += 8;
  v54(v51, v49);
  v94[0] = v52;
  v94[1] = v53;
  uint64_t v84 = v29;
  type metadata accessor for AnyPhotosObservableProperty.ChangeDetectionType();
  uint64_t v55 = (uint64_t (*)(char *, uint64_t))AnyPhotosObservableProperty.ChangeDetectionType.detector.getter();
  sub_259CFEB28(v52);
  LOBYTE(v52) = v55(v91, v93);
  swift_release();
  if (v52)
  {
    uint64_t v56 = v90;
    (*(void (**)(uint64_t, uint64_t))(v75 + 40))(v22, v75);
    v72(v28, (uint64_t)v56, v22);
    swift_retain();
    uint64_t v57 = v51;
    swift_getAtKeyPath();
    swift_release();
    v86(v28, v22);
    uint64_t v58 = v87;
    uint64_t v59 = &v51[*(int *)(v87 + 48)];
    uint64_t v60 = v76;
    uint64_t v61 = v74;
    uint64_t v62 = v54;
    uint64_t v63 = AssociatedTypeWitness;
    (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v74, v59, AssociatedTypeWitness);
    v62(v57, v58);
    swift_getAssociatedConformanceWitness();
    sub_259D62768();
    uint64_t v64 = v94[0];
    uint64_t v65 = v82;
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v67 = v80;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 40))(v64, v65, AssociatedConformanceWitness);
    swift_release();
    swift_release();
    v86(v90, v22);
    uint64_t v68 = *(void (**)(void))(v83 + 8);
    OUTLINED_FUNCTION_3_8();
    v68();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v63);
    OUTLINED_FUNCTION_3_8();
    v68();
    return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v67, v65);
  }
  else
  {
    swift_release();
    swift_release();
    v86(v90, v22);
    uint64_t v70 = *(void (**)(void))(v83 + 8);
    OUTLINED_FUNCTION_3_8();
    v70();
    OUTLINED_FUNCTION_3_8();
    v70();
    return (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v80, v82);
  }
}

uint64_t sub_259CFE9B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 24) - 8) + 8;
  (*(void (**)(void))v3)();
  id v4 = (void *)((a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8);
  if (*v4 >= 0xFFFFFFFFuLL) {
    swift_release();
  }
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))(v6 + 8);
  uint64_t v8 = AssociatedTypeWitness;
  unint64_t v9 = ((unint64_t)v4 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);

  return v7(v9, v8);
}

uint64_t sub_259CFEAA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosItemListManagerChangeDescriptor.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t PhotosItemListManagerChangeDescriptor.rawValue.getter()
{
  return *(void *)v0;
}

unint64_t sub_259CFEAD8(unint64_t result)
{
  if (result >= 4) {
    return swift_retain();
  }
  return result;
}

id sub_259CFEAEC(uint64_t a1)
{
  return sub_259CFEB10(a1);
}

id sub_259CFEB10(uint64_t a1)
{
  return objc_msgSend(v1, sel_signalChange_, a1);
}

unint64_t sub_259CFEB28(unint64_t result)
{
  if (result >= 4) {
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for AnyPhotosObservableProperty.ChangeDetectionType()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_259CFEB54(uint64_t a1, uint64_t a2)
{
  return sub_259CFEB60(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

BOOL sub_259CFEB60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1, a1);
  unint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v11 = *(void (**)(char *))(v6 + 16);
  v11((char *)v20 - v12);
  __swift_instantiateConcreteTypeFromMangledName(qword_26A3EC8C0);
  swift_dynamicCast();
  uint64_t v13 = v24;
  uint64_t v14 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
  ((void (*)(char *, uint64_t, uint64_t))v11)(v9, a2, a4);
  swift_dynamicCast();
  uint64_t v16 = v21;
  uint64_t v17 = v22;
  __swift_project_boxed_opaque_existential_1(v20, v21);
  BOOL v18 = v15 != (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v16, v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return v18;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t AnyPhotosObservableProperty.ChangeDetectionType.detector.getter()
{
  unint64_t v1 = *v0;
  switch(*v0)
  {
    case 0uLL:
      uint64_t v2 = (__n128 *)OUTLINED_FUNCTION_5_6();
      OUTLINED_FUNCTION_2_12(v2);
      uint64_t v3 = sub_259D1DE04;
      goto LABEL_7;
    case 1uLL:
      uint64_t v5 = (__n128 *)OUTLINED_FUNCTION_5_6();
      OUTLINED_FUNCTION_2_12(v5);
      uint64_t v3 = sub_259D01C74;
      goto LABEL_7;
    case 2uLL:
      uint64_t v6 = (__n128 *)OUTLINED_FUNCTION_5_6();
      OUTLINED_FUNCTION_2_12(v6);
      uint64_t v3 = sub_259CFEB54;
      goto LABEL_7;
    case 3uLL:
      uint64_t v7 = (__n128 *)OUTLINED_FUNCTION_5_6();
      OUTLINED_FUNCTION_2_12(v7);
      uint64_t v3 = sub_259D1C644;
LABEL_7:
      unint64_t v4 = (unint64_t)v3;
      break;
    default:
      unint64_t v4 = *v0;
      break;
  }
  sub_259CFEAD8(v1);
  return v4;
}

uint64_t PhotosAnyEquatable.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v12, v13);
  a4[3] = v14;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a4);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 16))(boxed_opaque_existential_1, a1, a2);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 32);
  v16((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a2;
  *(void *)(v18 + 24) = a3;
  uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v16)(v18 + v17, (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  a4[4] = (uint64_t)sub_259D01C28;
  a4[5] = v18;
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_259CFF00C(uint64_t a1)
{
  return a1;
}

uint64_t destroy for PhotosAnyEquatable(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);

  return swift_release();
}

double PXRectShortestDistanceToPoint(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a1 + a3;
  if (a5 < v6) {
    double v6 = a5;
  }
  if (a1 < v6) {
    a1 = v6;
  }
  double v7 = a2 + a4;
  if (a6 < a2 + a4) {
    double v7 = a6;
  }
  if (a2 < v7) {
    a2 = v7;
  }
  return hypot(a1 - a5, a2 - a6);
}

id PXUIApplicationGetFirstKeyWindow(void *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [a1 connectedScenes];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v23;
    id v17 = v1;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v23 != v4) {
        objc_enumerationMutation(v1);
      }
      id v6 = *(id *)(*((void *)&v22 + 1) + 8 * v5);
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      {
        id v7 = v6;

        if (!v7 || [v7 activationState] == -1) {
          goto LABEL_21;
        }
        uint64_t v8 = [v7 windows];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v6 = v8;
        uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
LABEL_12:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v6);
            }
            uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
            if ([v13 isKeyWindow]) {
              break;
            }
            if (v10 == ++v12)
            {
              uint64_t v10 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v10) {
                goto LABEL_12;
              }
              goto LABEL_18;
            }
          }
          id v14 = v13;

          if (!v14)
          {
            id v1 = v17;
            goto LABEL_21;
          }

          id v1 = v17;
          goto LABEL_28;
        }
LABEL_18:

        id v1 = v17;
      }
      else
      {
        id v7 = 0;
      }

LABEL_21:
      if (++v5 == v3)
      {
        uint64_t v15 = [v1 countByEnumeratingWithState:&v22 objects:v27 count:16];
        uint64_t v3 = v15;
        if (v15) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  id v14 = 0;
LABEL_28:

  return v14;
}

_PXWrappingDisplayAssetFetchResult *PXDisplayAssetFetchResultSubfetchResultWithRange(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = [v5 count];
  if (a2 || v6 != a3) {
    id v7 = -[_PXWrappingDisplayAssetFetchResult initWithFetchResult:range:]([_PXWrappingDisplayAssetFetchResult alloc], "initWithFetchResult:range:", v5, a2, a3);
  }
  else {
    id v7 = (_PXWrappingDisplayAssetFetchResult *)v5;
  }
  uint64_t v8 = v7;

  return v8;
}

double PXRectGetMinForAxis(uint64_t a1, double result, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 1:
      return CGRectGetMinY(*(CGRect *)&result);
    case 2:
      return CGRectGetMinX(*(CGRect *)&result);
    case 0:
      uint64_t v9 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v6, v5, v7, v8);
      uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat PXRectGetMinForAxis(CGRect, PXAxis)");
      [v9 handleFailureInFunction:v10 file:@"PXAxis.m" lineNumber:97 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  return result;
}

uint64_t PXColorSpaceSupportsExtendedRange(unint64_t a1)
{
  return (a1 > 0xF) | (0x6F60u >> a1) & 1;
}

void PXSizeGetAspectRatio(double a1, double a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1 == 0.0
    || a2 == 0.0
    || (a1 == *MEMORY[0x263F5D550] ? (BOOL v4 = a2 == *(double *)(MEMORY[0x263F5D550] + 8)) : (BOOL v4 = 0), v4))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      int v5 = 134218496;
      double v6 = a1;
      __int16 v7 = 2048;
      double v8 = a2;
      __int16 v9 = 2048;
      uint64_t v10 = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_259CDA000, &_os_log_internal, OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", (uint8_t *)&v5, 0x20u);
    }
  }
}

void sub_259CFF970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void px_dispatch_on_main_queue_when_idle_after_delay(void *a1, double a2)
{
  id v3 = a1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __px_dispatch_on_main_queue_when_idle_after_delay_block_invoke;
  v5[3] = &unk_26545BC28;
  double v7 = a2;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void PhotosConcatenatedItem<>.value.getter()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v1 = *(void *)(v0 + 24);
  OUTLINED_FUNCTION_0_0();
  uint64_t v27 = v2;
  uint64_t v5 = *(void *)(MEMORY[0x270FA5388](v3, v4) + 32);
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = *(void *)(MEMORY[0x270FA5388](v6, v7) + 16);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v9, v10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v11, v12);
  id v14 = OUTLINED_FUNCTION_2_4(v13, v27);
  v15(v14);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      OUTLINED_FUNCTION_3_3();
      v17();
      OUTLINED_FUNCTION_25();
      v18(v1);
      uint64_t v19 = OUTLINED_FUNCTION_31();
    }
    else
    {
      OUTLINED_FUNCTION_3_3();
      v25();
      OUTLINED_FUNCTION_25();
      v26(v5);
      uint64_t v19 = OUTLINED_FUNCTION_20();
    }
    v20(v19);
  }
  else
  {
    OUTLINED_FUNCTION_3_3();
    v21();
    OUTLINED_FUNCTION_25();
    v22(v8);
    uint64_t v23 = OUTLINED_FUNCTION_9_0();
    v24(v23);
  }
  OUTLINED_FUNCTION_4_2();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return *(void *)(v0 - 152);
}

double PXEdgeInsetsBetweenRects(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRectGetMinX(*(CGRect *)&a1);
  v20.origin.x = a5;
  v20.origin.y = a6;
  v20.size.width = a7;
  v20.size.height = a8;
  CGRectGetMinX(v20);
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectGetMaxX(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  CGRectGetMaxX(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  double MinY = CGRectGetMinY(v23);
  v24.origin.x = a5;
  v24.origin.y = a6;
  v24.size.width = a7;
  v24.size.height = a8;
  double v16 = MinY - CGRectGetMinY(v24);
  v25.origin.x = a5;
  v25.origin.y = a6;
  v25.size.width = a7;
  v25.size.height = a8;
  CGRectGetMaxY(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetMaxY(v26);
  return v16;
}

double PXRectWithSizeAlignedToRectEdgesWithPadding(char a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8)
{
  if ((~a1 & 0xA) != 0)
  {
    if ((a1 & 2) != 0)
    {
      v24.origin.x = a4;
      v24.origin.y = a5;
      v24.size.width = a6;
      v24.size.height = a7;
      double v13 = a8 + CGRectGetMinX(v24);
    }
    else
    {
      CGFloat v15 = a4;
      if ((a1 & 8) != 0) {
        double v13 = CGRectGetMaxX(*(CGRect *)&v15) - a2 - a8;
      }
      else {
        double v13 = CGRectGetMidX(*(CGRect *)&v15) + a2 * -0.5;
      }
    }
  }
  else
  {
    double v13 = a4 + a8;
  }
  if ((~a1 & 5) != 0)
  {
    CGFloat v19 = a4;
    CGFloat v20 = a5;
    CGFloat v21 = a6;
    CGFloat v22 = a7;
    if (a1)
    {
      CGRectGetMinY(*(CGRect *)&v19);
    }
    else if ((a1 & 4) != 0)
    {
      CGRectGetMaxY(*(CGRect *)&v19);
    }
    else
    {
      CGRectGetMidY(*(CGRect *)&v19);
    }
  }
  return v13;
}

uint64_t __PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  uint64_t v1 = PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_cache;
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_cache = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t PXIsPhotoPicker()
{
  if (PXIsPhotoPicker_onceToken != -1) {
    dispatch_once(&PXIsPhotoPicker_onceToken, &__block_literal_global_3);
  }
  return PXIsPhotoPicker_isPhotoPicker;
}

uint64_t __PFAssetsDataSourceCountsGetLog_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F5D540], "AssetsDataSourceCounts");
  uint64_t v1 = PFAssetsDataSourceCountsGetLog_log;
  PFAssetsDataSourceCountsGetLog_log = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

double __PXTimebaseConversionFactor_block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  double result = (float)((float)((float)info.numer * 0.000000001) / (float)info.denom);
  *(double *)&PXTimebaseConversionFactor_timebaseConversion = result;
  return result;
}

id px_dispatch_queue_create_serial(const char *a1, dispatch_qos_class_t a2)
{
  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v5 = px_dispatch_queue_create_with_priority(a1, v4, a2, 0);

  return v5;
}

dispatch_queue_t px_dispatch_queue_create_with_priority(const char *a1, dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  uint64_t v5 = dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
  dispatch_queue_t v6 = dispatch_queue_create(a1, v5);

  return v6;
}

void PXDisplayAssetDetailedCountsSubtract(unint64_t *a1@<X0>, unint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unint64_t v6 = *a1;
  BOOL v8 = *a1 == 0x7FFFFFFFFFFFFFFFLL || a1[1] == 0x7FFFFFFFFFFFFFFFLL || a1[2] == 0x7FFFFFFFFFFFFFFFLL;
  if (v8
    || ((unint64_t v9 = *a2, *a2 != 0x7FFFFFFFFFFFFFFFLL) ? (v10 = a2[1] == 0x7FFFFFFFFFFFFFFFLL) : (v10 = 1),
        !v10 ? (BOOL v11 = a2[2] == 0x7FFFFFFFFFFFFFFFLL) : (BOOL v11 = 1),
        v11))
  {
    uint64_t v12 = PXAssertGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_OWORD *)CGFloat v22 = *(_OWORD *)a1;
      *(void *)&v22[16] = a1[2];
      CGFloat v20 = PXDisplayAssetDetailedCountsDescription(v22);
      *(_OWORD *)CGFloat v22 = *(_OWORD *)a2;
      *(void *)&v22[16] = a2[2];
      CGFloat v21 = PXDisplayAssetDetailedCountsDescription(v22);
      *(_DWORD *)CGFloat v22 = 138412546;
      *(void *)&v22[4] = v20;
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v21;
      _os_log_fault_impl(&dword_259CDA000, v12, OS_LOG_TYPE_FAULT, "Subtracting with invalid counts (%@ - %@)", v22, 0x16u);
    }
    unint64_t v6 = *a1;
    unint64_t v9 = *a2;
  }
  if (v6 < v9 || (unint64_t v13 = a1[1], v14 = a2[1], v13 < v14) || (v15 = a1[2], v16 = a2[2], v15 < v16))
  {
    id v17 = PXAssertGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_OWORD *)CGFloat v22 = *(_OWORD *)a1;
      *(void *)&v22[16] = a1[2];
      long long v18 = PXDisplayAssetDetailedCountsDescription(v22);
      *(_OWORD *)CGFloat v22 = *(_OWORD *)a2;
      *(void *)&v22[16] = a2[2];
      CGFloat v19 = PXDisplayAssetDetailedCountsDescription(v22);
      *(_DWORD *)CGFloat v22 = 138412546;
      *(void *)&v22[4] = v18;
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v19;
      _os_log_fault_impl(&dword_259CDA000, v17, OS_LOG_TYPE_FAULT, "Subtracting a larger count from a smaller count (%@ - %@), which will underflow.", v22, 0x16u);
    }
    unint64_t v6 = *a1;
    unint64_t v13 = a1[1];
    unint64_t v9 = *a2;
    unint64_t v14 = a2[1];
    unint64_t v15 = a1[2];
    unint64_t v16 = a2[2];
  }
  *a3 = v6 - v9;
  a3[1] = v13 - v14;
  a3[2] = v15 - v16;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

id PXFontWithTextStyleSymbolicTraits(uint64_t a1, uint64_t a2)
{
  return _PXFontWithTextStyleSymbolicTraits(a1, a2, 9uLL);
}

_OWORD *sub_259D00FF4(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  __n128 result = sub_259CEA2CC(a4, (_OWORD *)(a5[7] + 32 * a1));
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

__n128 sub_259D01060()
{
  qword_26A3EC020 = 0;
  *(void *)algn_26A3EC028 = 0;
  __asm { FMOV            V0.2D, #1.0 }
  xmmword_26A3EC030 = (__int128)result;
  return result;
}

void UniqueAddress.init()(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_259D01080(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_259D010BC()
{
  return MEMORY[0x263F8D320];
}

void PhotosItemList.loadingStatus.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t PhotosNSCache.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_259CDEA8C(a1, a2);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v5 + 80) - 8) + 8))(a2);
  uint64_t v6 = sub_259D62B68();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(a1, v6);
}

uint64_t sub_259D011A4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PhotosNSCache()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t PhotosNSCache.init()()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26A3ED7D8);
  OUTLINED_FUNCTION_0_9();
  type metadata accessor for PhotosNSCache.WrappedKey();
  OUTLINED_FUNCTION_0_9();
  type metadata accessor for PhotosNSCache.WrappedValue();
  *(void *)(v0 + 16) = sub_259CDE90C();
  return v0;
}

uint64_t PhotosNSCache.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  PhotosNSCache.init()();
  return v0;
}

uint64_t type metadata accessor for PhotosNSCache.WrappedValue()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_259D01300(char *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)v2 + 88);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v8 = (char *)&v12 - v7;
  if (__swift_getEnumTagSinglePayload(v6, 1, v4) == 1)
  {
    uint64_t v9 = sub_259D62B68();
    (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v10(v8, a1, v4);
    v10((char *)(v2 + *(void *)(*(void *)v2 + 104)), v8, v4);
  }
  return v2;
}

uint64_t sub_259D014B8(char *a1)
{
  swift_allocObject();
  return sub_259D01300(a1, v2);
}

uint64_t sub_259D014F4(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x68)]);
}

uint64_t type metadata accessor for PhotosNSCache.WrappedKey()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_259D01584()
{
  unint64_t result = qword_26A3ECC50;
  if (!qword_26A3ECC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ECC50);
  }
  return result;
}

unint64_t sub_259D015D0()
{
  unint64_t result = qword_26A3ECC48;
  if (!qword_26A3ECC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ECC48);
  }
  return result;
}

unint64_t sub_259D0161C()
{
  unint64_t result = qword_26A3ECC40;
  if (!qword_26A3ECC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ECC40);
  }
  return result;
}

unint64_t sub_259D01668()
{
  unint64_t result = qword_26A3ECC38;
  if (!qword_26A3ECC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ECC38);
  }
  return result;
}

unint64_t sub_259D016B4()
{
  unint64_t result = qword_26A3ECC30;
  if (!qword_26A3ECC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ECC30);
  }
  return result;
}

unint64_t sub_259D01700(uint64_t a1)
{
  unint64_t result = sub_259D01584();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t PhotosConcatenatedItemListManager.changeDetailsRepository.getter()
{
  return swift_retain();
}

uint64_t PhotosConcatenatedItemListManager.__allocating_init(mainItemListManager:prependItemListManager:appendItemListManager:waitForPrependItemListManagerList:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8 = swift_allocObject();
  PhotosConcatenatedItemListManager.init(mainItemListManager:prependItemListManager:appendItemListManager:waitForPrependItemListManagerList:)(a1, a2, a3, a4);
  return v8;
}

uint64_t sub_259D017A0()
{
  return sub_259CE04B4();
}

uint64_t sub_259D017C4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PhotosGroupingItemListManager.Options()
{
  return swift_getGenericMetadata();
}

uint64_t dispatch thunk of PhotosGroupingItemListManager.observeChanges(using:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t assignWithTake for PhotosItemListChangeDetails(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v3 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t sub_259D018D8()
{
  return swift_getWitnessTable();
}

uint64_t sub_259D018F4(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_259D01930(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakCopyAssign();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t PhotosMutableEnvironment.setValue<A>(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v6, v7);
  (*(void (**)(unsigned char *))(v9 + 16))(&v12[-v8]);
  uint64_t v10 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(a4 + 24))(v12, a3, a4);
  swift_setAtWritableKeyPath();
  return v10(v12, 0);
}

uint64_t PhotosEnvironmentValues.subscript.setter(uint64_t a1)
{
  uint64_t v2 = sub_259CE35C8();
  uint64_t v4 = v3;
  uint64_t v5 = OUTLINED_FUNCTION_1_9();
  v9[3] = v5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v9);
  uint64_t v7 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v7 + 16))(boxed_opaque_existential_1, a1, v5);
  sub_259CDE608((uint64_t)v9, v2, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v5);
}

uint64_t type metadata accessor for PhotosSendableTransfer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_259D01B88(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for PhotosWeakDictionary()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t PhotosWeakDictionary.init()@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PhotosWeakObjectReference();
  uint64_t result = sub_259D624D8();
  *a1 = result;
  return result;
}

uint64_t sub_259D01C28(uint64_t a1)
{
  return sub_259CDEE08(a1, v1+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80)), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

BOOL sub_259D01C74(uint64_t a1, uint64_t a2)
{
  return sub_259CFE020(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t static AnyPhotosObservableHosted.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *a2;
  uint64_t v7 = (void *)MEMORY[0x263F8E100];
  uint64_t v8 = *(void *)(*(void *)(*MEMORY[0x263F8E100] + *a3 + 8) + 32);
  uint64_t v9 = *(void *)(*a2 + *MEMORY[0x263F8E100]);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13, v14);
  unint64_t v16 = (char *)v22 - v15;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v9, v8);
  v22[5] = a1;
  swift_unknownObjectRetain();
  id v17 = (void (*)(uint64_t))swift_readAtKeyPath();
  swift_retain();
  uint64_t v18 = OUTLINED_FUNCTION_3_0();
  v17(v18);
  swift_unknownObjectRelease();
  swift_retain();
  CGFloat v19 = (void (*)(uint64_t))swift_readAtKeyPath();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*v7 + v6 + 8) - 8) + 16))(a4);
  uint64_t v20 = OUTLINED_FUNCTION_3_0();
  v19(v20);
  swift_release_n();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v16, AssociatedTypeWitness);
}

void (*static AnyPhotosObservableHosted.subscript.modify(void *a1, uint64_t a2, uint64_t *a3, void *a4))(uint64_t **a1, char a2)
{
  uint64_t v8 = malloc(0x38uLL);
  *a1 = v8;
  v8[1] = a3;
  v8[2] = a4;
  *uint64_t v8 = a2;
  v8[3] = *(void *)(*MEMORY[0x263F8E100] + *a3 + 8);
  OUTLINED_FUNCTION_0_0();
  *(void *)(v9 + 32) = v10;
  size_t v12 = *(void *)(v11 + 64);
  v8[5] = malloc(v12);
  uint64_t v13 = malloc(v12);
  v8[6] = v13;
  static AnyPhotosObservableHosted.subscript.getter(a2, a3, a4, (uint64_t)v13);
  return sub_259D02654;
}

void sub_259D02654(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[5];
  uint64_t v4 = (void *)(*a1)[6];
  if (a2)
  {
    uint64_t v5 = v2[3];
    uint64_t v6 = v2[4];
    uint64_t v7 = (void *)v2[1];
    uint64_t v8 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[5], v4, v5);
    swift_retain();
    swift_retain();
    swift_unknownObjectRetain();
    static AnyPhotosObservableHosted.subscript.setter((uint64_t)v3, v8, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    uint64_t v9 = (void *)v2[1];
    uint64_t v10 = *v2;
    swift_retain();
    swift_retain();
    swift_unknownObjectRetain();
    static AnyPhotosObservableHosted.subscript.setter((uint64_t)v4, v10, v9);
  }
  free(v4);
  free(v3);

  free(v2);
}

void AnyPhotosObservableHosted.wrappedValue.getter()
{
}

void sub_259D02794()
{
}

void sub_259D027A4(uint64_t a1)
{
  MEMORY[0x270FA5388](a1, a1);
  (*(void (**)(void))(v1 + 16))();
  AnyPhotosObservableHosted.wrappedValue.setter();
}

void AnyPhotosObservableHosted.wrappedValue.setter()
{
}

void AnyPhotosObservableHosted.wrappedValue.modify()
{
}

uint64_t AnyPhotosObservableHosted.observableKeyPath.getter()
{
  return swift_retain();
}

uint64_t AnyPhotosObservableHosted.observableKeyPath.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  void *v1 = a1;
  return result;
}

uint64_t (*AnyPhotosObservableHosted.observableKeyPath.modify())()
{
  return nullsub_1;
}

uint64_t sub_259D028D0()
{
  return 24;
}

__n128 sub_259D028DC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

void type metadata accessor for PXMenuActionState(uint64_t a1)
{
}

void type metadata accessor for PXMenuActionRole(uint64_t a1)
{
}

void type metadata accessor for PXImageContentMode(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for PXImageDynamicRange(uint64_t a1)
{
}

void type metadata accessor for PXDisplayAssetMediaSubtype(uint64_t a1)
{
}

void type metadata accessor for PXDisplayAssetMediaType(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for PhotosAnyIdentifiable(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_259D029C8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_259D029E8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for PXAssetBadgeInfo(uint64_t a1)
{
}

void type metadata accessor for PXSimpleIndexPath(uint64_t a1)
{
}

void type metadata accessor for CGRectEdge(uint64_t a1)
{
}

void type metadata accessor for CGRect(uint64_t a1)
{
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

uint64_t getEnumTagSinglePayload for PhotosDisplayRect(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PhotosDisplayRect(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
}

uint64_t sub_259D02AE8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_259D02B40(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if ((v5 & ~v2) == 0) {
        uint64_t v4 = 0;
      }
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

void sub_259D02B94(void *a1@<X8>)
{
}

uint64_t sub_259D02B9C(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

void sub_259D02BA4(void *a1@<X8>)
{
}

uint64_t sub_259D02BAC(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_259D02BB4(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

void sub_259D02BE4(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  if ((*v2 & a2) != 0) {
    *v2 &= ~a2;
  }
  OUTLINED_FUNCTION_4(a1);
}

uint64_t sub_259D02C04(uint64_t a1)
{
  uint64_t result = *v1 & a1;
  if (result) {
    *v1 &= ~a1;
  }
  return result;
}

void sub_259D02C2C(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  *v2 |= a2;
  OUTLINED_FUNCTION_4(a1);
}

uint64_t sub_259D02C44(uint64_t a1)
{
  uint64_t v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

void sub_259D02C5C(uint64_t a1)
{
  OUTLINED_FUNCTION_5(*v1 | a1);
}

uint64_t sub_259D02C68(uint64_t result)
{
  *v1 |= result;
  return result;
}

void sub_259D02C78(uint64_t a1)
{
  OUTLINED_FUNCTION_5(*v1 ^ a1);
}

uint64_t sub_259D02C84(uint64_t result)
{
  *v1 ^= result;
  return result;
}

void sub_259D02C94(void *a1@<X8>)
{
}

uint64_t sub_259D02C9C(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_259D02CA4(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_259D02CB0(uint64_t a1)
{
  return a1 == 0;
}

void sub_259D02CBC(uint64_t a1)
{
  OUTLINED_FUNCTION_5(*v1 & ~a1);
}

uint64_t sub_259D02CC8(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

void *sub_259D02CD8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_259D02CE8(void *a1@<X8>)
{
}

void sub_259D02CF0(void *a1@<X8>)
{
}

void sub_259D02CF8(uint64_t a1@<X8>)
{
  sub_259D02D2C();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_259D02D34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_259D02D60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = OUTLINED_FUNCTION_0();
  *a1 = result;
  return result;
}

uint64_t sub_259D02D88@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_259D02B9C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_259D02DB8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_259D07A0C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_259D02DE8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_259D02BAC(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_259D02E18(void *a1, uint64_t *a2)
{
  return sub_259D02BB4(a1, *a2);
}

uint64_t sub_259D02E20@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_259D02C04(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_259D02E54@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_259D02C44(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_259D02E88(uint64_t *a1)
{
  return sub_259D02C68(*a1);
}

uint64_t sub_259D02E90(uint64_t *a1)
{
  return j__OUTLINED_FUNCTION_5_0(*a1);
}

uint64_t sub_259D02E98(uint64_t *a1)
{
  return sub_259D02C84(*a1);
}

uint64_t sub_259D02EA0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_259D02C9C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_259D02ED0(void *a1)
{
  return sub_259D07CE0(*a1, *v1);
}

BOOL sub_259D02EDC(uint64_t *a1)
{
  return sub_259D02CA4(*a1, *v1);
}

BOOL sub_259D02EE8(uint64_t *a1)
{
  return sub_259D030AC(*a1, *v1);
}

BOOL sub_259D02EF4()
{
  return sub_259D02CB0(*v0);
}

uint64_t sub_259D02EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_259D02F14(uint64_t *a1)
{
  return sub_259D02CC8(*a1);
}

BOOL sub_259D02F1C(uint64_t *a1, uint64_t *a2)
{
  return sub_259D06EC0(*a1, *a2);
}

uint64_t sub_259D02F28@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_259D02B40(a1);
  *a2 = result;
  return result;
}

uint64_t sub_259D02F50()
{
  return sub_259D02FB8(&qword_26A3ED0B0);
}

uint64_t sub_259D02F84()
{
  return sub_259D02FB8(&qword_26A3ED0B8);
}

uint64_t sub_259D02FB8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PXDisplayAssetMediaSubtype(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_259D02FFC()
{
  return sub_259D02FB8(&qword_26A3ED0C0);
}

uint64_t sub_259D03030()
{
  return sub_259D02FB8(&qword_26A3ED0C8);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for PXAssetBadges(uint64_t a1)
{
}

uint64_t PhotosBasicItem.__allocating_init(id:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  PhotosBasicItem.init(id:value:)(a1, a2, a3);
  return v6;
}

char *PhotosBasicItem.init(id:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)v3;
  *((void *)v3 + 2) = a1;
  *((void *)v3 + 3) = a2;
  (*(void (**)(char *, uint64_t))(*(void *)(*(void *)(v4 + 80) - 8) + 32))(&v3[*(void *)(v4 + 96)], a3);
  return v3;
}

uint64_t PhotosBasicItem.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PhotosBasicItem.value.getter@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 80) - 8) + 16))(a1, v1 + *(void *)(*(void *)v1 + 96));
}

uint64_t PhotosBasicItem.diagnosticDescription.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)v2 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v6 = (char *)&v8 - v5;
  uint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
  sub_259D62C48();
  swift_bridgeObjectRelease();
  uint64_t v8 = 1029990779;
  unint64_t v9 = 0xE400000000000000;
  swift_bridgeObjectRetain();
  sub_259D62688();
  swift_bridgeObjectRelease();
  sub_259D62688();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2 + *(void *)(*(void *)v2 + 96), v3);
  sub_259D62668();
  sub_259D62688();
  swift_bridgeObjectRelease();
  sub_259D62688();
  return v8;
}

uint64_t PhotosBasicItem.debugDescription.getter()
{
  OUTLINED_FUNCTION_0_1();
  swift_getMetatypeMetadata();
  uint64_t v1 = sub_259D62668();
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED200);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_259D717F0;
  uint64_t v5 = MEMORY[0x263F8D310];
  *(void *)(v4 + 56) = MEMORY[0x263F8D310];
  unint64_t v6 = sub_259D0348C();
  *(void *)(v4 + 32) = v1;
  *(void *)(v4 + 40) = v3;
  uint64_t v7 = MEMORY[0x263F8D750];
  *(void *)(v4 + 96) = MEMORY[0x263F8D6C8];
  *(void *)(v4 + 104) = v7;
  *(void *)(v4 + 64) = v6;
  *(void *)(v4 + 72) = v0;
  uint64_t v9 = *(void *)(v0 + 16);
  uint64_t v8 = *(void *)(v0 + 24);
  *(void *)(v4 + 136) = v5;
  *(void *)(v4 + 144) = v6;
  *(void *)(v4 + 112) = v9;
  *(void *)(v4 + 120) = v8;
  swift_bridgeObjectRetain();
  return sub_259D62658();
}

unint64_t sub_259D0348C()
{
  unint64_t result = qword_26A3ED208;
  if (!qword_26A3ED208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED208);
  }
  return result;
}

uint64_t *PhotosBasicItem.deinit()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 96));
  return v0;
}

uint64_t PhotosBasicItem.__deallocating_deinit()
{
  PhotosBasicItem.deinit();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_259D03590()
{
  return MEMORY[0x263F8D330];
}

uint64_t sub_259D0359C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosBasicItem.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_259D035C8@<X0>(uint64_t a1@<X8>)
{
  return PhotosBasicItem.value.getter(a1);
}

uint64_t sub_259D035EC()
{
  return PhotosBasicItem.debugDescription.getter();
}

uint64_t sub_259D03610(uint64_t a1, uint64_t a2)
{
  return PhotosBasicItem.diagnosticDescription.getter(a1, a2);
}

uint64_t method lookup function for PhotosBasicItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosBasicItem);
}

uint64_t dispatch thunk of PhotosBasicItem.__allocating_init(id:value:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t PhotosAnyIdentifiable.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v12, v13);
  a4[3] = v14;
  a4[4] = v15;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a4);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 16))(boxed_opaque_existential_1, a1, a2);
  id v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 32);
  v17((char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  unint64_t v18 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  *(void *)(v19 + 24) = a3;
  uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v17)(v19 + v18, (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  a4[5] = (uint64_t)sub_259D03DF4;
  a4[6] = v19;
  return result;
}

uint64_t sub_259D03794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  uint64_t v46 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v42 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness, v6);
  uint64_t v40 = (char *)&v39 - v7;
  uint64_t v8 = sub_259D62B68();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v41 = *(void *)(TupleTypeMetadata2 - 8);
  MEMORY[0x270FA5388](TupleTypeMetadata2, v9);
  uint64_t v11 = (char *)&v39 - v10;
  uint64_t v12 = sub_259D62B68();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v12, v14);
  id v17 = (char *)&v39 - v16;
  uint64_t v18 = *(void *)(v8 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v15, v19);
  uint64_t v45 = (char *)&v39 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v20, v22);
  CGRect v25 = (char *)&v39 - v24;
  MEMORY[0x270FA5388](v23, v26);
  uint64_t v28 = (char *)&v39 - v27;
  sub_259D04550(v43, (uint64_t)v48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED218);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, a3);
    sub_259D62C78();
    (*(void (**)(char *, uint64_t))(*(void *)(a3 - 8) + 8))(v17, a3);
    __swift_storeEnumTagSinglePayload((uint64_t)v28, 0, 1, AssociatedTypeWitness);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, a3);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v28, 1, 1, AssociatedTypeWitness);
  }
  sub_259D62C78();
  __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, AssociatedTypeWitness);
  uint64_t v29 = (uint64_t)&v11[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  v30(v11, v28, v8);
  v30((char *)v29, v25, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, AssociatedTypeWitness) != 1)
  {
    v30(v45, v11, v8);
    if (__swift_getEnumTagSinglePayload(v29, 1, AssociatedTypeWitness) != 1)
    {
      uint64_t v34 = v42;
      uint64_t v35 = v40;
      (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(v40, v29, AssociatedTypeWitness);
      swift_getAssociatedConformanceWitness();
      char v32 = sub_259D62628();
      uint64_t v36 = *(void (**)(char *, uint64_t))(v34 + 8);
      v36(v35, AssociatedTypeWitness);
      uint64_t v37 = *(void (**)(char *, uint64_t))(v18 + 8);
      v37(v25, v8);
      v37(v28, v8);
      v36(v45, AssociatedTypeWitness);
      v37(v11, v8);
      return v32 & 1;
    }
    uint64_t v33 = *(void (**)(char *, uint64_t))(v18 + 8);
    v33(v25, v8);
    v33(v28, v8);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v45, AssociatedTypeWitness);
    goto LABEL_9;
  }
  uint64_t v31 = *(void (**)(char *, uint64_t))(v18 + 8);
  v31(v25, v8);
  v31(v28, v8);
  if (__swift_getEnumTagSinglePayload(v29, 1, AssociatedTypeWitness) != 1)
  {
LABEL_9:
    (*(void (**)(char *, uint64_t))(v41 + 8))(v11, TupleTypeMetadata2);
    char v32 = 0;
    return v32 & 1;
  }
  v31(v11, v8);
  char v32 = 1;
  return v32 & 1;
}

uint64_t sub_259D03D6C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_259D03DF4(uint64_t a1)
{
  return sub_259D03794(a1, v1+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80)), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t PhotosAnyIdentifiable.isMatching(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 40))() & 1;
}

uint64_t areMatching(_:_:)(uint64_t a1, uint64_t a2)
{
  sub_259D04028(a1, (uint64_t)&v23);
  if (!v24)
  {
    sub_259D04090((uint64_t)&v23);
LABEL_6:
    uint64_t v20 = *(void *)(a1 + 24);
    sub_259D04028(a2, (uint64_t)&v23);
    char v19 = (v20 | v24) == 0;
    sub_259D04090((uint64_t)&v23);
    return v19 & 1;
  }
  sub_259D040F0(&v23, (uint64_t)v29);
  sub_259D04028(a2, (uint64_t)&v23);
  if (!v24)
  {
    sub_259D04090((uint64_t)&v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    goto LABEL_6;
  }
  sub_259D040F0(&v23, (uint64_t)v26);
  uint64_t v5 = v30;
  uint64_t v6 = v31;
  __swift_project_boxed_opaque_existential_1(v29, v30);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v7, v8);
  uint64_t v10 = OUTLINED_FUNCTION_1_0(v9, v22[0]);
  v11(v10);
  PhotosAnyIdentifiable.init<A>(_:)(v2, v5, v6, (uint64_t *)&v23);
  uint64_t v12 = v27;
  uint64_t v13 = v28;
  __swift_project_boxed_opaque_existential_1(v26, v27);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v14, v15);
  id v17 = OUTLINED_FUNCTION_1_0(v16, v22[0]);
  v18(v17);
  PhotosAnyIdentifiable.init<A>(_:)(v2, v12, v13, v22);
  char v19 = v25(v22);
  sub_259D04108((uint64_t)v22);
  sub_259D04108((uint64_t)&v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  return v19 & 1;
}

uint64_t sub_259D04028(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED210);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_259D04090(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED210);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_259D040F0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_259D04108(uint64_t a1)
{
  return a1;
}

uint64_t destroy for PhotosAnyIdentifiable(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);

  return swift_release();
}

uint64_t initializeWithCopy for PhotosAnyIdentifiable(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for PhotosAnyIdentifiable(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  uint64_t v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
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
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
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
          *long long v3 = *a2;
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

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PhotosAnyIdentifiable(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosAnyIdentifiable(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosAnyIdentifiable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotosAnyIdentifiable()
{
  return &type metadata for PhotosAnyIdentifiable;
}

uint64_t sub_259D04550(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL static PXAssetBadgeInfo.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  BOOL v9 = a1 == a4 && a2 == a5;
  if (a7 != a8) {
    BOOL v9 = 0;
  }
  return a3 == a6 && v9;
}

BOOL sub_259D045D4(uint64_t a1, uint64_t a2)
{
  return static PXAssetBadgeInfo.== infix(_:_:)(*(void *)a1, *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)a2, *(void *)(a2 + 16), *(void *)(a2 + 24), *(double *)(a1 + 8), *(double *)(a2 + 8));
}

uint64_t sub_259D045F8()
{
  return PhotosBasicItemList.subscript.getter();
}

uint64_t PhotosBasicItemList.subscript.getter()
{
  swift_retain();
  swift_getWitnessTable();
  sub_259D62FA8();
  return v1;
}

uint64_t PhotosBasicItemList.startIndex.getter()
{
  return 0;
}

Swift::Int __swiftcall PhotosBasicItemList.index(after:)(Swift::Int after)
{
  BOOL v1 = __OFADD__(after, 1);
  Swift::Int result = after + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

uint64_t sub_259D046D0()
{
  return sub_259D04A84(&qword_26A3ED220);
}

unint64_t sub_259D04704()
{
  unint64_t result = qword_26A3ED230;
  if (!qword_26A3ED230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED230);
  }
  return result;
}

uint64_t sub_259D04750()
{
  return swift_getWitnessTable();
}

uint64_t sub_259D047B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9E068](a1, a2, a3, a4, MEMORY[0x263F8D708]);
}

uint64_t sub_259D047C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9E078](a1, a2, a3, a4, MEMORY[0x263F8D708]);
}

uint64_t sub_259D047D0()
{
  return sub_259D04A84(&qword_26A3ED238);
}

uint64_t sub_259D04804()
{
  return swift_getWitnessTable();
}

uint64_t sub_259D04868()
{
  swift_getWitnessTable();

  return sub_259D629A8();
}

uint64_t sub_259D048D8(void *a1)
{
  swift_getWitnessTable();
  uint64_t result = sub_259D629A8();
  *a1 = v3;
  return result;
}

uint64_t sub_259D04948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];

  return MEMORY[0x270F9E068](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_259D049CC()
{
  swift_getWitnessTable();

  return sub_259D62998();
}

uint64_t sub_259D04A50()
{
  return sub_259D04A84(&qword_26A3ED240);
}

uint64_t sub_259D04A84(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3ED228);
    sub_259D04704();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_259D04AF4()
{
  return swift_getWitnessTable();
}

void (*sub_259D04B10(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_259D04BBC(v2);
  return sub_259D04B74;
}

void sub_259D04B74(void *a1)
{
  BOOL v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_259D04BBC(void *a1))(void *a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 80);
  *a1 = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  a1[1] = v3;
  a1[2] = malloc(*(void *)(v3 + 64));
  PhotosBasicItemList.item(at:)();
  return sub_259D04C74;
}

void sub_259D04C74(void *a1)
{
  uint64_t v1 = (void *)a1[2];
  (*(void (**)(void *, void))(a1[1] + 8))(v1, *a1);

  free(v1);
}

uint64_t sub_259D04CC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosBasicItemList.subscript.getter();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_259D04CF8()
{
  swift_getWitnessTable();

  return sub_259D629C8();
}

void sub_259D04D64(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

Swift::Int sub_259D04D7C@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::Int result = PhotosBasicItemList.index(after:)(*a1);
  *a2 = result;
  return result;
}

Swift::Int sub_259D04DA8(Swift::Int *a1)
{
  Swift::Int result = PhotosBasicItemList.index(after:)(*a1);
  *a1 = result;
  return result;
}

uint64_t sub_259D04DD4()
{
  return swift_getWitnessTable();
}

void sub_259D04DF0(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_259D04DFC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_259D04E50()
{
  return 2;
}

uint64_t sub_259D04E58(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F9E128](a1, WitnessTable);
}

uint64_t sub_259D04EB0()
{
  return sub_259D62718();
}

uint64_t method lookup function for PhotosBasicItemList(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosBasicItemList);
}

uint64_t dispatch thunk of PhotosBasicItemList.__allocating_init(items:loadingStatus:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t PhotosDispatchAfter.__allocating_init(timeInterval:queue:fire:)(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8 = swift_allocObject();
  PhotosDispatchAfter.init(timeInterval:queue:fire:)(a1, a2, a3, a4);
  return v8;
}

uint64_t PhotosDispatchAfter.init(timeInterval:queue:fire:)(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v39 = a1;
  uint64_t v7 = sub_259D62458();
  OUTLINED_FUNCTION_0_0();
  uint64_t v40 = v8;
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_259D62478();
  OUTLINED_FUNCTION_0_0();
  uint64_t v37 = v14;
  uint64_t v38 = v13;
  MEMORY[0x270FA5388](v13, v15);
  id v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_259D62498();
  uint64_t v36 = v18;
  OUTLINED_FUNCTION_0_0();
  uint64_t v20 = v19;
  uint64_t v23 = MEMORY[0x270FA5388](v21, v22);
  CGRect v25 = (char *)&v34 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23, v26);
  uint64_t v28 = (char *)&v34 - v27;
  sub_259D62488();
  MEMORY[0x25A2E8C10](v25, a4);
  uint64_t v35 = *(void (**)(char *, uint64_t))(v20 + 8);
  v35(v25, v18);
  uint64_t v29 = swift_allocObject();
  swift_weakInit();
  uint64_t v30 = (void *)swift_allocObject();
  v30[2] = v29;
  v30[3] = a2;
  v30[4] = a3;
  void aBlock[4] = sub_259D053A4;
  aBlock[5] = v30;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_259CED700;
  aBlock[3] = &block_descriptor;
  uint64_t v31 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_259D62468();
  uint64_t v41 = MEMORY[0x263F8EE78];
  sub_259D053B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECEB8);
  sub_259D05400();
  sub_259D62BD8();
  char v32 = v39;
  MEMORY[0x25A2E9250](v28, v17, v12, v31);
  _Block_release(v31);

  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v7);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v38);
  v35(v28, v36);
  swift_release();
  swift_release();
  return v34;
}

uint64_t sub_259D052C0()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_259D052F8(uint64_t a1, void (*a2)(void))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    a2();
    return swift_release();
  }
  return result;
}

uint64_t sub_259D05364()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_259D053A4()
{
  return sub_259D052F8(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24));
}

unint64_t sub_259D053B0()
{
  unint64_t result = qword_26A3ECE98;
  if (!qword_26A3ECE98)
  {
    sub_259D62458();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ECE98);
  }
  return result;
}

unint64_t sub_259D05400()
{
  unint64_t result = qword_26A3ECEC0;
  if (!qword_26A3ECEC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3ECEB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ECEC0);
  }
  return result;
}

BOOL static PhotosDispatchAfter.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t PhotosDispatchAfter.deinit()
{
  return v0;
}

uint64_t PhotosDispatchAfter.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

BOOL sub_259D05478(uint64_t *a1, uint64_t *a2)
{
  return static PhotosDispatchAfter.== infix(_:_:)(*a1, *a2);
}

uint64_t type metadata accessor for PhotosDispatchAfter()
{
  return self;
}

uint64_t method lookup function for PhotosDispatchAfter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosDispatchAfter);
}

uint64_t dispatch thunk of PhotosDispatchAfter.__allocating_init(timeInterval:queue:fire:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t RangeReplaceableCollection.px_popFirst()@<X0>(uint64_t a1@<X8>)
{
  if (sub_259D62A08())
  {
    uint64_t v2 = 1;
  }
  else
  {
    sub_259D62AB8();
    uint64_t v2 = 0;
  }
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();

  return __swift_storeEnumTagSinglePayload(a1, v2, 1, AssociatedTypeWitness);
}

uint64_t PhotosMappingItemListManager.__allocating_init<A>(itemListManager:itemProvider:)()
{
  uint64_t v0 = swift_allocObject();
  OUTLINED_FUNCTION_0_2();
  PhotosMappingItemListManager.init<A>(itemListManager:itemProvider:)(v1, v2, v3, v4, v5);
  return v0;
}

void *PhotosMappingItemListManager.init<A>(itemListManager:itemProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  type metadata accessor for PhotosItemListChangeDetailsRepository();
  swift_allocObject();
  uint64_t v13 = PhotosItemListChangeDetailsRepository.init(countLimit:)(100);
  v5[11] = 0;
  v5[3] = 0;
  void v5[4] = 0;
  v5[2] = v13;
  sub_259D623F8();
  uint64_t v14 = (void *)swift_allocObject();
  uint64_t v15 = *(void *)(v12 + 80);
  v14[2] = v15;
  void v14[3] = a4;
  uint64_t v16 = *(void *)(v12 + 88);
  v14[4] = v16;
  v14[5] = a5;
  void v14[6] = a1;
  v6[5] = sub_259D05EA0;
  v6[6] = v14;
  id v17 = (void *)swift_allocObject();
  v17[2] = v15;
  v17[3] = a4;
  v17[4] = v16;
  v17[5] = a5;
  v17[6] = a1;
  v6[7] = sub_259D05EDC;
  v6[8] = v17;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v15;
  v18[3] = a4;
  void v18[4] = v16;
  v18[5] = a5;
  v18[6] = a1;
  v18[7] = a2;
  v18[8] = a3;
  v6[9] = sub_259D05F68;
  v6[10] = v18;
  swift_unknownObjectRetain_n();
  return v6;
}

uint64_t sub_259D05758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = a5;
  uint64_t v35 = a3;
  uint64_t v36 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v16 = MEMORY[0x270FA5388](AssociatedTypeWitness, v15);
  uint64_t v33 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16, v17);
  uint64_t v19 = (char *)&v31 - v18;
  (*(void (**)(uint64_t, uint64_t))(a8 + 40))(a6, a8);
  uint64_t v37 = a7;
  if (!a1) {
    goto LABEL_4;
  }
  uint64_t v32 = *(void *)(a1 + 32);
  uint64_t v31 = a6;
  uint64_t v20 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 8);
  swift_retain();
  uint64_t v22 = v21(AssociatedTypeWitness, v20);
  if (v32 != v22)
  {
    swift_release();
    a6 = v31;
LABEL_4:
    uint64_t v23 = v34;
    uint64_t v32 = type metadata accessor for PhotosMappingItemList();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(AssociatedTypeWitness, AssociatedConformanceWitness);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(AssociatedConformanceWitness + 112))(&v38, AssociatedTypeWitness, AssociatedConformanceWitness);
    CGRect v25 = v33;
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v33, v19, AssociatedTypeWitness);
    unint64_t v26 = (*(unsigned __int8 *)(v13 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v27 = (char *)swift_allocObject();
    *((void *)v27 + 2) = v23;
    *((void *)v27 + 3) = a6;
    *((void *)v27 + 4) = v37;
    *((void *)v27 + 5) = a8;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v27[v26], v25, AssociatedTypeWitness);
    uint64_t v28 = &v27[(v14 + v26 + 7) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v29 = v36;
    *(void *)uint64_t v28 = v35;
    *((void *)v28 + 1) = v29;
    swift_retain();
    a1 = PhotosMappingItemList.__allocating_init(itemIdentifiers:loadingStatus:itemProvider:)(v31, (char *)&v38, (uint64_t)sub_259D06220, (uint64_t)v27);
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v19, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_259D05A5C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *), uint64_t a5)
{
  uint64_t v15 = a5;
  uint64_t v16 = a4;
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness, v9);
  uint64_t v11 = (char *)&v15 - v10;
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 56);
  uint64_t v13 = swift_checkMetadataState();
  v12(a1, v13, AssociatedConformanceWitness);
  v16(v11);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, AssociatedTypeWitness);
}

uint64_t PhotosMappingItemListManager.changeDetailsRepository.getter()
{
  return swift_retain();
}

uint64_t sub_259D05BF0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 72);
  sub_259D05CAC();
  uint64_t v2 = v1();
  swift_release();
  uint64_t v3 = swift_retain();
  sub_259D05CB4(v3);
  return v2;
}

uint64_t sub_259D05C58()
{
  return (*(uint64_t (**)(void))(v0 + 40))() & 1;
}

uint64_t sub_259D05C84()
{
  return (*(uint64_t (**)(void))(v0 + 56))();
}

uint64_t sub_259D05CAC()
{
  return swift_retain();
}

uint64_t sub_259D05CB4(uint64_t a1)
{
  *(void *)(v1 + 88) = a1;
  return swift_release();
}

uint64_t PhotosMappingItemListManager.deinit()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = v0 + qword_26A3ED248;
  sub_259D62408();
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t PhotosMappingItemListManager.__deallocating_deinit()
{
  PhotosMappingItemListManager.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_259D05DA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_259D05BF0();
  *a1 = result;
  return result;
}

uint64_t sub_259D05DD4()
{
  return sub_259D05C84();
}

uint64_t PhotosItemListManager.map<A>(itemProvider:)()
{
  return PhotosMappingItemListManager.__allocating_init<A>(itemListManager:itemProvider:)();
}

uint64_t sub_259D05E68()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_259D05EA0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 40) + 56))(*(void *)(v0 + 24)) & 1;
}

uint64_t sub_259D05EDC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(*(void *)(v2 + 40) + 16) + 24))(a1, a2, *(void *)(v2 + 24));
}

uint64_t sub_259D05F28()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_259D05F68(uint64_t a1)
{
  return sub_259D05758(a1, v1[6], v1[7], v1[8], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t type metadata accessor for PhotosMappingItemListManager()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_259D05F94()
{
  return swift_getWitnessTable();
}

uint64_t sub_259D05FB0(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_259D06010()
{
  uint64_t result = sub_259D62408();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for PhotosMappingItemListManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosMappingItemListManager);
}

uint64_t dispatch thunk of PhotosMappingItemListManager.__allocating_init<A>(itemListManager:itemProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of PhotosMappingItemListManager.itemList.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of PhotosMappingItemListManager.waitForItemList(timeout:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of PhotosMappingItemListManager.observeChanges(using:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t sub_259D0616C()
{
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_1_2();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_release();

  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t sub_259D06220(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_259D05A5C(a1, a2, v2 + v6, *(void (**)(char *))(v2 + v7), *(void *)(v2 + v7 + 8));
}

uint64_t Int.times(_:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3 >= 1)
  {
    uint64_t v5 = (uint64_t (*)(void))result;
    uint64_t v6 = 1;
    while (1)
    {
      uint64_t result = v5();
      if (v3 || a3 == v6) {
        break;
      }
      if (__OFADD__(v6++, 1))
      {
        __break(1u);
        return result;
      }
    }
  }
  return result;
}

uint64_t Int.px_nilIfNotFound.getter(uint64_t a1)
{
  if (sub_259D622A8() == a1) {
    return 0;
  }
  else {
    return a1;
  }
}

uint64_t PhotosStrongObjectReference.init(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_259D62618();
  *a2 = a1;
  a2[1] = result;
  return result;
}

uint64_t PhotosStrongObjectReference.objectIdentifierHash.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t PhotosStrongObjectReference.hashValue.getter(uint64_t a1)
{
  uint64_t v3 = v1[1];
  uint64_t v7 = *v1;
  uint64_t v8 = v3;
  sub_259D62FC8();
  uint64_t WitnessTable = swift_getWitnessTable();
  PhotosObjectReference.hash(into:)((uint64_t)v6, a1, WitnessTable);
  return sub_259D62FE8();
}

uint64_t PhotosObjectReference.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  if (a1)
  {
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(a3 + 24))(a4, a1, a2);
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 1;
  }

  return __swift_storeEnumTagSinglePayload((uint64_t)a4, v6, 1, a2);
}

uint64_t sub_259D064E0(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return PhotosObjectReference.hash(into:)(a1, a2, WitnessTable);
}

uint64_t PhotosObjectReference.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_259D62FD8();
}

uint64_t sub_259D06584(uint64_t a1, uint64_t a2)
{
  sub_259D62FC8();
  uint64_t WitnessTable = swift_getWitnessTable();
  PhotosObjectReference.hash(into:)((uint64_t)v5, a2, WitnessTable);
  return sub_259D62FE8();
}

uint64_t sub_259D065E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return static PhotosObjectReference.== infix(_:_:)(a1, a2, a3, WitnessTable) & 1;
}

uint64_t sub_259D0664C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PhotosWeakObjectReference();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
  uint64_t v6 = MEMORY[0x25A2EAC90](v8);
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  *a2 = v6;
  return result;
}

uint64_t PhotosWeakObjectReference.object.setter()
{
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

uint64_t (*PhotosWeakObjectReference.object.modify(void *a1))()
{
  a1[1] = v1;
  *a1 = MEMORY[0x25A2EAC90](v1);
  return sub_259D06794;
}

uint64_t sub_259D06794()
{
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

uint64_t PhotosWeakObjectReference.hashValue.getter(uint64_t a1)
{
  sub_259D62FC8();
  uint64_t WitnessTable = swift_getWitnessTable();
  PhotosObjectReference.hash(into:)((uint64_t)v4, a1, WitnessTable);
  return sub_259D62FE8();
}

uint64_t sub_259D06844(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return PhotosObjectReference.hash(into:)(a1, a2, WitnessTable);
}

uint64_t sub_259D068A4(uint64_t a1, uint64_t a2)
{
  sub_259D62FC8();
  uint64_t WitnessTable = swift_getWitnessTable();
  PhotosObjectReference.hash(into:)((uint64_t)v5, a2, WitnessTable);
  return sub_259D62FE8();
}

uint64_t sub_259D06908(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_259D06944()
{
  return swift_getWitnessTable();
}

uint64_t sub_259D06964()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_259D06974()
{
  return 8;
}

void *sub_259D06980(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void *sub_259D0698C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_259D069BC()
{
  return swift_unknownObjectRelease();
}

void *sub_259D069C4(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  return a1;
}

void *sub_259D06A14(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t sub_259D06A54(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_259D06A94(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for PhotosStrongObjectReference()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_259D06AE8(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakTakeAssign();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t dispatch thunk of PhotosObjectReference.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of PhotosObjectReference.objectIfExists.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PhotosObjectReference.objectIdentifierHash.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PhotosItemCounts.numberOfItemCollections.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PhotosItemCounts.numberOfCollectionLists.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

id PhotosDebugColorOverlayView.__allocating_init(tintColor:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return PhotosDebugColorOverlayView.init(tintColor:)(a1);
}

id PhotosDebugColorOverlayView.init(tintColor:)(void *a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for PhotosDebugColorOverlayView();
  id v3 = objc_msgSendSuper2(&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v4 = objc_msgSend(a1, sel_colorWithAlphaComponent_, 0.2);
  objc_msgSend(v3, sel_setBackgroundColor_, v4);

  id v5 = objc_msgSend(v3, sel_layer);
  id v6 = objc_msgSend(a1, sel_colorWithAlphaComponent_, 0.8);
  id v7 = objc_msgSend(v6, sel_CGColor);

  objc_msgSend(v5, sel_setBorderColor_, v7);
  id v8 = objc_msgSend(v3, sel_layer);

  objc_msgSend(v8, sel_setBorderWidth_, 5.0);
  return v3;
}

uint64_t type metadata accessor for PhotosDebugColorOverlayView()
{
  return self;
}

void sub_259D06D48()
{
}

id PhotosDebugColorOverlayView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void PhotosDebugColorOverlayView.init(frame:)()
{
}

id PhotosDebugColorOverlayView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosDebugColorOverlayView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for PhotosDebugColorOverlayView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosDebugColorOverlayView);
}

uint64_t dispatch thunk of PhotosDebugColorOverlayView.__allocating_init(tintColor:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

BOOL sub_259D06EC0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_259D06ECC(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000014;
  unint64_t v3 = 0x8000000259D6AD90;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000014;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6E6F6974636573;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1835365481;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6D657469627573;
      break;
    default:
      break;
  }
  unint64_t v6 = 0x8000000259D6AD90;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      unint64_t v2 = 0x6E6F6974636573;
      break;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      unint64_t v2 = 1835365481;
      break;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      unint64_t v2 = 0x6D657469627573;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_259D62EE8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t PXDisplayAssetMediaType.description.getter()
{
  return 0x726F727265;
}

uint64_t sub_259D070D0()
{
  return PXDisplayAssetMediaType.description.getter();
}

uint64_t PXDisplayAssetMediaSubtype.description.getter(int a1)
{
  if (a1)
  {
    uint64_t v4 = sub_259CFAF68(0, 1, 1, MEMORY[0x263F8EE78], &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
    unint64_t v6 = v4[2];
    unint64_t v5 = v4[3];
    int64_t v1 = v6 + 1;
    if (v6 >= v5 >> 1)
    {
      BOOL v39 = OUTLINED_FUNCTION_2_1(v5);
      uint64_t v4 = OUTLINED_FUNCTION_0_4((void *)v39, v6 + 1, v40, v41, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
    }
    v4[2] = v1;
    OUTLINED_FUNCTION_9();
    *(void *)(v8 + 32) = v7 | 0x6E61506F00000000;
    *(void *)(v8 + 40) = 0xED0000616D61726FLL;
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  }
  if ((a1 & 2) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_3_1();
      uint64_t v4 = OUTLINED_FUNCTION_0_4(0, v42, v43, v44, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
    }
    OUTLINED_FUNCTION_8();
    if (v10)
    {
      BOOL v45 = OUTLINED_FUNCTION_2_1(v9);
      uint64_t v4 = OUTLINED_FUNCTION_0_4((void *)v45, v1, v46, v47, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
    }
    v4[2] = v1;
    uint64_t v11 = &v4[2 * v2];
    v11[4] = 0x5244486F746F6870;
    v11[5] = 0xE800000000000000;
    if ((a1 & 4) == 0)
    {
LABEL_8:
      if ((a1 & 8) == 0) {
        goto LABEL_25;
      }
      goto LABEL_20;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_8;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_1();
    uint64_t v4 = OUTLINED_FUNCTION_0_4(0, v48, v49, v50, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
  }
  OUTLINED_FUNCTION_8();
  if (v10)
  {
    BOOL v51 = OUTLINED_FUNCTION_2_1(v12);
    uint64_t v4 = OUTLINED_FUNCTION_0_4((void *)v51, v1, v52, v53, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
  }
  v4[2] = v1;
  OUTLINED_FUNCTION_9();
  *(void *)(v14 + 32) = v13 | 0x7263536F00000000;
  *(void *)(v14 + 40) = 0xEF746F68736E6565;
  if ((a1 & 8) != 0)
  {
LABEL_20:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_3_1();
      uint64_t v4 = OUTLINED_FUNCTION_0_4(0, v54, v55, v56, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
    }
    OUTLINED_FUNCTION_8();
    if (v10)
    {
      BOOL v57 = OUTLINED_FUNCTION_2_1(v15);
      uint64_t v4 = OUTLINED_FUNCTION_0_4((void *)v57, v1, v58, v59, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
    }
    v4[2] = v1;
    OUTLINED_FUNCTION_9();
    *(void *)(v17 + 32) = v16 | 0x76694C6F00000000;
    *(void *)(v17 + 40) = 0xE900000000000065;
  }
LABEL_25:
  if ((a1 & 0x10) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_3_1();
      uint64_t v4 = OUTLINED_FUNCTION_0_4(0, v60, v61, v62, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
    }
    unint64_t v19 = v4[2];
    unint64_t v18 = v4[3];
    int64_t v1 = v19 + 1;
    if (v19 >= v18 >> 1)
    {
      BOOL v63 = OUTLINED_FUNCTION_2_1(v18);
      uint64_t v4 = OUTLINED_FUNCTION_0_4((void *)v63, v19 + 1, v64, v65, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
    }
    v4[2] = v1;
    uint64_t v20 = &v4[2 * v19];
    v20[4] = 0xD000000000000010;
    v20[5] = 0x8000000259D6B0A0;
    if ((a1 & 0x200) == 0)
    {
LABEL_27:
      if ((a1 & 0x800000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_43;
    }
  }
  else if ((a1 & 0x200) == 0)
  {
    goto LABEL_27;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_1();
    uint64_t v4 = OUTLINED_FUNCTION_0_4(0, v66, v67, v68, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
  }
  unint64_t v22 = v4[2];
  unint64_t v21 = v4[3];
  int64_t v1 = v22 + 1;
  if (v22 >= v21 >> 1)
  {
    BOOL v69 = OUTLINED_FUNCTION_2_1(v21);
    uint64_t v4 = OUTLINED_FUNCTION_0_4((void *)v69, v22 + 1, v70, v71, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
  }
  v4[2] = v1;
  uint64_t v23 = &v4[2 * v22];
  v23[4] = 0x5244486F746F6870;
  v23[5] = 0xEF70614D6E696147;
  if ((a1 & 0x800000) == 0)
  {
LABEL_28:
    if ((a1 & 0x10000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_48;
  }
LABEL_43:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_1();
    uint64_t v4 = OUTLINED_FUNCTION_0_4(0, v72, v73, v74, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
  }
  OUTLINED_FUNCTION_4_0();
  if (v10)
  {
    BOOL v75 = OUTLINED_FUNCTION_2_1(v24);
    uint64_t v4 = OUTLINED_FUNCTION_0_4((void *)v75, v1, v76, v77, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
  }
  v4[2] = v1;
  OUTLINED_FUNCTION_9();
  *(void *)(v26 + 32) = v25 | 0x5244586F00000000;
  *(void *)(v26 + 40) = 0xE800000000000000;
  if ((a1 & 0x10000) == 0)
  {
LABEL_29:
    if ((a1 & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_53;
  }
LABEL_48:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_1();
    uint64_t v4 = OUTLINED_FUNCTION_0_4(0, v78, v79, v80, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
  }
  OUTLINED_FUNCTION_4_0();
  if (v10)
  {
    BOOL v81 = OUTLINED_FUNCTION_2_1(v27);
    uint64_t v4 = OUTLINED_FUNCTION_0_4((void *)v81, v1, v82, v83, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
  }
  OUTLINED_FUNCTION_10();
  *(void *)(v29 + 32) = v28 | 0x7274536F00000000;
  *(void *)(v29 + 40) = 0xED000064656D6165;
  if ((a1 & 0x20000) == 0)
  {
LABEL_30:
    if ((a1 & 0x40000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_58;
  }
LABEL_53:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_1();
    uint64_t v4 = OUTLINED_FUNCTION_0_4(0, v84, v85, v86, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
  }
  OUTLINED_FUNCTION_4_0();
  if (v10)
  {
    BOOL v87 = OUTLINED_FUNCTION_2_1(v30);
    uint64_t v4 = OUTLINED_FUNCTION_0_4((void *)v87, v1, v88, v89, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
  }
  v4[2] = v1;
  v4[0x48890DEE8DED0E4] = 0xD000000000000012;
  v4[0x48890DEE8DED0E5] = 0x8000000259D6B080;
  if ((a1 & 0x40000) == 0)
  {
LABEL_31:
    if ((a1 & 0x100000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_63;
  }
LABEL_58:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_1();
    uint64_t v4 = OUTLINED_FUNCTION_0_4(0, v90, v91, v92, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
  }
  OUTLINED_FUNCTION_4_0();
  if (v10)
  {
    BOOL v93 = OUTLINED_FUNCTION_2_1(v31);
    uint64_t v4 = OUTLINED_FUNCTION_0_4((void *)v93, v1, v94, v95, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
  }
  OUTLINED_FUNCTION_10();
  *(void *)(v33 + 32) = v32 | 0x6D69546F00000000;
  *(void *)(v33 + 40) = 0xEE00657370616C65;
  if ((a1 & 0x100000) != 0)
  {
LABEL_63:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_3_1();
      uint64_t v4 = OUTLINED_FUNCTION_0_4(0, v96, v97, v98, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
    }
    unint64_t v35 = v4[2];
    unint64_t v34 = v4[3];
    if (v35 >= v34 >> 1)
    {
      BOOL v99 = OUTLINED_FUNCTION_2_1(v34);
      uint64_t v4 = OUTLINED_FUNCTION_0_4((void *)v99, v35 + 1, v100, v101, &qword_26A3ED2E0, (void (*)(void, uint64_t, void *, uint64_t))sub_259D07A78, (void (*)(uint64_t, uint64_t, void *))sub_259CFBF2C);
    }
    v4[2] = v35 + 1;
    uint64_t v36 = &v4[2 * v35];
    v36[4] = 0x5244486F65646976;
    v36[5] = 0xE800000000000000;
  }
LABEL_68:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED2D0);
  sub_259D07A24();
  uint64_t v37 = sub_259D625B8();
  swift_bridgeObjectRelease();
  return v37;
}

uint64_t sub_259D079F8()
{
  return PXDisplayAssetMediaSubtype.description.getter(*v0);
}

uint64_t sub_259D07A00@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_259D07A0C(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

BOOL sub_259D07A18(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

unint64_t sub_259D07A24()
{
  unint64_t result = qword_26A3ED2D8;
  if (!qword_26A3ED2D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3ED2D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED2D8);
  }
  return result;
}

uint64_t sub_259D07A78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_259D62E48();
  __break(1u);
  return result;
}

uint64_t sub_259D07B70(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_7();
LABEL_11:
    uint64_t result = sub_259D62E48();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_6();
    goto LABEL_11;
  }

  return swift_arrayInitWithCopy();
}

void *sub_259D07C28(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_7();
LABEL_11:
    uint64_t result = (void *)sub_259D62E48();
    __break(1u);
    return result;
  }
  if (&__dst[8 * a2] > __src && &__src[8 * a2] > __dst)
  {
    OUTLINED_FUNCTION_1_4();
    OUTLINED_FUNCTION_6();
    goto LABEL_11;
  }

  return memcpy(__dst, __src, 8 * a2);
}

uint64_t sub_259D07CE8()
{
  return sub_259D62AC8();
}

uint64_t PhotosWeakList.remove(_:)()
{
  return sub_259D62AC8();
}

BOOL sub_259D07E50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x25A2EAC90]();
  swift_unknownObjectRelease();
  uint64_t v5 = type metadata accessor for PhotosWeakObjectReference();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v11, a1, v5);
  if (v4)
  {
    uint64_t v7 = MEMORY[0x25A2EAC90](v11);
    if (v7)
    {
      uint64_t v8 = v7;
      swift_unknownObjectRelease();
      BOOL v9 = v8 == a2;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
  return v9;
}

BOOL sub_259D07F4C()
{
  uint64_t v0 = MEMORY[0x25A2EAC90]();
  if (v0) {
    swift_unknownObjectRelease();
  }
  return v0 == 0;
}

BOOL sub_259D07F8C(uint64_t a1)
{
  return sub_259D07E50(a1, *(void *)(v1 + 24));
}

BOOL sub_259D07FAC()
{
  return sub_259D07F4C();
}

uint64_t photosAssertionFailure(log:_:file:line:)(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_259D62438();
  OUTLINED_FUNCTION_0_5();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9, v10);
  OUTLINED_FUNCTION_1_5();
  uint64_t v13 = v12 - v11;
  id v14 = a1;
  sub_259D62448();
  photosAssertionFailure(logger:_:file:line:)(v13, a2, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v13, v6);
}

void photosAssertionFailure(logger:_:file:line:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  swift_bridgeObjectRetain_n();
  oslog = sub_259D62418();
  os_log_type_t v5 = sub_259D62AD8();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_bridgeObjectRetain();
    sub_259D085D0(a2, a3, &v8);
    sub_259D62B88();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259CDA000, oslog, v5, "%s", v6, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

void photosAssert(_:logger:_:file:line:)(char a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a1 & 1) == 0) {
    photosAssertionFailure(logger:_:file:line:)(a2, a3, a4);
  }
}

uint64_t photosUnwrapOrError<A>(_:_:_:logger:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v41 = a5;
  unint64_t v42 = a4;
  uint64_t v40 = a3;
  uint64_t v43 = a2;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED2E8);
  MEMORY[0x270FA5388](v10 - 8, v11);
  OUTLINED_FUNCTION_1_5();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_259D62438();
  OUTLINED_FUNCTION_0_5();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18, v19);
  OUTLINED_FUNCTION_1_5();
  uint64_t v22 = v21 - v20;
  uint64_t v23 = sub_259D62B68();
  OUTLINED_FUNCTION_0_5();
  uint64_t v25 = v24;
  MEMORY[0x270FA5388](v26, v27);
  uint64_t v29 = (char *)&v38 - v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))((char *)&v38 - v28, a1, v23);
  if (__swift_getEnumTagSinglePayload((uint64_t)v29, 1, a6) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(a6 - 8) + 32))(a7, v29, a6);
  }
  uint64_t v39 = a7;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v29, v23);
  sub_259D08D88(v41, v14);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v14, 1, v15);
  uint64_t v31 = v15;
  uint64_t v32 = v22;
  unint64_t v33 = v42;
  if (EnumTagSinglePayload == 1)
  {
    sub_259D62698();
    sub_259D62428();
    sub_259D08DF0(v14);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v22, v14, v31);
  }
  swift_bridgeObjectRetain_n();
  unint64_t v35 = sub_259D62418();
  os_log_type_t v36 = sub_259D62AD8();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v41 = v31;
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    *(_DWORD *)uint64_t v37 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_259D085D0(v40, v33, &v45);
    sub_259D62B88();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_259CDA000, v35, v36, "%s", v37, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v32, v41);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v22, v31);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 16))(v39, v43, a6);
}

uint64_t sub_259D085D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_259D086A4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_259CEA270((uint64_t)v12, *a3);
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
      sub_259CEA270((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_259D086A4(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_259D087FC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_259D62B98();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_259D088D4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_259D62CC8();
    if (!v8)
    {
      uint64_t result = sub_259D62DC8();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_259D087FC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_259D62E48();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_259D088D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_259D0896C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_259D08B48(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_259D08B48((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_259D0896C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_259D626A8();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_259D08AE0(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_259D62C58();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_259D62E48();
  __break(1u);
LABEL_14:
  uint64_t result = sub_259D62DC8();
  __break(1u);
  return result;
}

void *sub_259D08AE0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3ED2F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_259D08B48(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3ED2F0);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_259D08CF8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_259D08C20(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_259D08C20(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_259D62E48();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_259D08CF8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_259D62E48();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_259D08D88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED2E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_259D08DF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED2E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Int __swiftcall NSUserDefaults.integer(forKey:defaultValue:)(Swift::String forKey, Swift::Int defaultValue)
{
  uint64_t v4 = (void *)sub_259D62638();
  id v5 = objc_msgSend(v2, sel_objectForKey_, v4);

  if (v5)
  {
    sub_259D62BA8();
    swift_unknownObjectRelease();
    sub_259D08F20((uint64_t)v8);
    unint64_t v6 = (void *)sub_259D62638();
    defaultValue = (Swift::Int)objc_msgSend(v2, sel_integerForKey_, v6);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    sub_259D08F20((uint64_t)v8);
  }
  return defaultValue;
}

uint64_t sub_259D08F20(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26A3EC4B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id PhotosScreenEdgeDismissalSlideTransition.__allocating_init(foregroundViewLateralInset:)(double a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  *(double *)&v3[OBJC_IVAR____TtC18PhotosUIFoundation40PhotosScreenEdgeDismissalSlideTransition_foregroundViewLateralInset] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id PhotosScreenEdgeDismissalSlideTransition.init(foregroundViewLateralInset:)(double a1)
{
  *(double *)&v1[OBJC_IVAR____TtC18PhotosUIFoundation40PhotosScreenEdgeDismissalSlideTransition_foregroundViewLateralInset] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for PhotosScreenEdgeDismissalSlideTransition();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for PhotosScreenEdgeDismissalSlideTransition()
{
  return self;
}

double sub_259D09034()
{
  return 0.4;
}

uint64_t sub_259D0904C(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(a1, sel_containerView);
  type metadata accessor for PhotosSlideTransition();
  sub_259D1F500(a1, &v50);
  long long v5 = v50;
  CGFloat v6 = v51;
  CGFloat v7 = v52;
  CGFloat v8 = v53;
  CGFloat v9 = v54;
  id v10 = objc_msgSend(a1, sel_viewForKey_, *MEMORY[0x263F83C08]);
  id v11 = objc_msgSend(a1, sel_viewForKey_, *MEMORY[0x263F83C18]);
  id v12 = objc_msgSend(a1, sel_viewControllerForKey_, *MEMORY[0x263F83C10]);
  if (v10)
  {
    uint64_t v13 = v12;
    double v14 = *(double *)(v2
                    + OBJC_IVAR____TtC18PhotosUIFoundation40PhotosScreenEdgeDismissalSlideTransition_foregroundViewLateralInset)
        + *(double *)(v2
                    + OBJC_IVAR____TtC18PhotosUIFoundation40PhotosScreenEdgeDismissalSlideTransition_foregroundViewLateralInset);
    id v15 = v10;
    objc_msgSend(v4, sel_bounds);
    CGFloat v16 = 1.0 - v14 / CGRectGetWidth(v55);
    objc_msgSend(v4, sel_bounds);
    CGFloat v17 = (1.0 - v16) * CGRectGetHeight(v56) * 0.5;
    uint64_t v18 = 0;
    CGAffineTransformMakeTranslation(&v49, 0.0, v17);
    CGAffineTransformScale(&v48, &v49, v16, v16);
    CGFloat a = v48.a;
    CGFloat d = v48.d;
    CGFloat b = v48.b;
    CGFloat tx = v48.tx;
    CGFloat ty = v48.ty;
    CGFloat c = v48.c;
    uint64_t v47 = v13;
    if (v11)
    {
      if (v13)
      {
        id v20 = v11;
        id v21 = v13;
        objc_msgSend(a1, sel_finalFrameForViewController_, v21);
        objc_msgSend(v20, sel_setFrame_);
        *(_OWORD *)&v49.CGFloat a = v5;
        v49.CGFloat c = v6;
        v49.CGFloat d = v7;
        v49.CGFloat tx = v8;
        v49.CGFloat ty = v9;
        objc_msgSend(v20, sel_setTransform_, &v49);
        objc_msgSend(v4, sel_insertSubview_belowSubview_, v20, v15);
      }
      CGFloat v22 = a;
      id v23 = v11;
      objc_msgSend(v23, sel__continuousCornerRadius);
      uint64_t v18 = v24;
      unsigned __int8 v25 = objc_msgSend(v23, sel_clipsToBounds);

      id v26 = v23;
      objc_msgSend(v26, sel__setContinuousCornerRadius_, 10.0);
      objc_msgSend(v26, sel_setClipsToBounds_, 1);
    }
    else
    {
      CGFloat v22 = v48.a;
      unsigned __int8 v25 = 2;
    }
    objc_msgSend(v15, sel__continuousCornerRadius);
    uint64_t v28 = v27;
    unsigned __int8 v29 = objc_msgSend(v15, sel_clipsToBounds);
    objc_msgSend(v15, sel__setContinuousCornerRadius_, 10.0);
    objc_msgSend(v15, sel_setClipsToBounds_, 1);
    id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
    id v31 = objc_msgSend(self, sel_blackColor);
    objc_msgSend(v30, sel_setBackgroundColor_, v31);

    objc_msgSend(v4, sel_bounds);
    objc_msgSend(v30, sel_setFrame_);
    objc_msgSend(v4, sel_insertSubview_belowSubview_, v30, v15);
    objc_msgSend(v30, sel_setAlpha_, 0.5);
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = v30;
    *(void *)(v32 + 24) = 0;
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = v30;
    id v34 = v30;
    sub_259D097E0((uint64_t)v34, 0, sub_259D09A48, v32, sub_259D09A94, v33);
    swift_release();
    swift_release();
    unint64_t v35 = (CGFloat *)swift_allocObject();
    *((void *)v35 + 2) = v11;
    v35[3] = 1.0;
    v35[4] = 0.0;
    v35[5] = 0.0;
    v35[6] = 1.0;
    v35[7] = 0.0;
    v35[8] = 0.0;
    *((void *)v35 + 9) = v15;
    v35[10] = v22;
    v35[11] = b;
    v35[12] = c;
    v35[13] = d;
    v35[14] = tx;
    v35[15] = ty;
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v18;
    *(unsigned char *)(v36 + 24) = v25;
    *(void *)(v36 + 32) = v11;
    *(void *)(v36 + 40) = v15;
    *(void *)(v36 + 48) = v28;
    *(unsigned char *)(v36 + 56) = v29;
    *(void *)(v36 + 64) = a1;
    sub_259D09B5C();
    id v37 = v15;
    id v38 = v11;
    id v39 = v37;
    id v40 = v38;
    swift_unknownObjectRetain();
    OUTLINED_FUNCTION_0_6();
    sub_259D62B48();

    swift_release();
    return swift_release();
  }
  else
  {
    uint64_t result = sub_259D62DD8();
    __break(1u);
  }
  return result;
}

id sub_259D095F0(void *a1, long long *a2, void *a3, long long *a4)
{
  long long v9 = a4[1];
  long long v10 = *a4;
  uint64_t v5 = *((void *)a4 + 4);
  uint64_t v6 = *((void *)a4 + 5);
  long long v7 = a2[1];
  long long v11 = *a2;
  long long v12 = v7;
  long long v13 = a2[2];
  objc_msgSend(a1, sel_setTransform_, &v11);
  long long v11 = v10;
  long long v12 = v9;
  *(void *)&long long v13 = v5;
  *((void *)&v13 + 1) = v6;
  return objc_msgSend(a3, sel_setTransform_, &v11);
}

id sub_259D09674(int a1, uint64_t a2, char a3, id a4, id a5, double a6, char a7, void *a8)
{
  if (a3 == 2)
  {
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a4)
  {
    uint64_t v13 = a3 & 1;
    objc_msgSend(a4, sel__setContinuousCornerRadius_, *(double *)&a2);
    objc_msgSend(a4, sel_setClipsToBounds_, v13);
LABEL_6:
    v15[0] = 0x3FF0000000000000;
    v15[1] = 0;
    v15[2] = 0;
    void v15[3] = 0x3FF0000000000000;
    v15[4] = 0;
    v15[5] = 0;
    objc_msgSend(a4, sel_setTransform_, v15);
  }
LABEL_7:
  objc_msgSend(a5, sel__setContinuousCornerRadius_, a6);
  objc_msgSend(a5, sel_setClipsToBounds_, a7 & 1);
  return objc_msgSend(a8, sel_completeTransition_, objc_msgSend(a8, sel_transitionWasCancelled) ^ 1);
}

void sub_259D097E0(uint64_t a1, char a2, void *a3, uint64_t a4, void *a5, uint64_t a6)
{
  if (a2)
  {
    sub_259D09B5C();
    OUTLINED_FUNCTION_0_6();
    sub_259D62B48();
  }
  else
  {
    uint64_t v13 = a3;
    uint64_t v14 = a4;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 1107296256;
    long long v11 = sub_259CED700;
    long long v12 = &block_descriptor_0;
    CGFloat v8 = _Block_copy(&v9);
    swift_retain();
    swift_release();
    if (a5)
    {
      uint64_t v13 = a5;
      uint64_t v14 = a6;
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 1107296256;
      long long v11 = sub_259D1F080;
      long long v12 = &block_descriptor_15;
      a5 = _Block_copy(&v9);
      swift_retain();
      swift_release();
    }
    objc_msgSend(self, sel_animateWithDuration_animations_completion_, v8, a5, 0.4);
    _Block_release(a5);
    _Block_release(v8);
  }
}

id PhotosScreenEdgeDismissalSlideTransition.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void PhotosScreenEdgeDismissalSlideTransition.init()()
{
}

id PhotosScreenEdgeDismissalSlideTransition.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosScreenEdgeDismissalSlideTransition();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_259D09A10()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_259D09A48()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, *(double *)(v0 + 24));
}

uint64_t sub_259D09A5C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_259D09A94()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_removeFromSuperview);
}

uint64_t sub_259D09AA4()
{
  return MEMORY[0x270FA0238](v0, 128, 7);
}

id sub_259D09AE4()
{
  return sub_259D095F0(*(void **)(v0 + 16), (long long *)(v0 + 24), *(void **)(v0 + 72), (long long *)(v0 + 80));
}

uint64_t sub_259D09AF8()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

id sub_259D09B40(int a1)
{
  return sub_259D09674(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(id *)(v1 + 32), *(id *)(v1 + 40), *(double *)(v1 + 48), *(unsigned char *)(v1 + 56), *(void **)(v1 + 64));
}

unint64_t sub_259D09B5C()
{
  unint64_t result = qword_26A3ECF08;
  if (!qword_26A3ECF08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3ECF08);
  }
  return result;
}

uint64_t method lookup function for PhotosScreenEdgeDismissalSlideTransition(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosScreenEdgeDismissalSlideTransition);
}

uint64_t dispatch thunk of PhotosScreenEdgeDismissalSlideTransition.__allocating_init(foregroundViewLateralInset:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of PhotosScreenEdgeDismissalSlideTransition.transitionDuration(using:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PhotosScreenEdgeDismissalSlideTransition.animateTransition(using:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t sub_259D09C38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosConcatenatedItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

uint64_t sub_259D09C64()
{
  uint64_t v0 = swift_retain();
  return sub_259CFD6A8(v0, (uint64_t)&unk_259D720B0, (uint64_t)sub_259CFA614, MEMORY[0x263F8EED8]);
}

uint64_t PhotosConcatenatedItemListManager.mainItemListManager.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t PhotosConcatenatedItemListManager.prependItemListManager.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t PhotosConcatenatedItemListManager.appendItemListManager.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_259D09CD8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_259D09D58()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_259CFD6A8(v0, (uint64_t)&unk_259D72230, (uint64_t)sub_259CDEA34, MEMORY[0x263F8EEA0]);
}

uint64_t PhotosConcatenatedItemListManager.deinit()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  uint64_t v1 = v0 + qword_26A3ECBF8;
  uint64_t v2 = sub_259D62408();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t PhotosConcatenatedItemListManager.__deallocating_deinit()
{
  PhotosConcatenatedItemListManager.deinit();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_259D09E88()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_259D09EC0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_259D09EF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosConcatenatedItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

unint64_t sub_259D09F34()
{
  unint64_t result = qword_26A3ED308;
  if (!qword_26A3ED308)
  {
    sub_259CFD594(255, (unint64_t *)&unk_26A3ED310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED308);
  }
  return result;
}

uint64_t method lookup function for PhotosConcatenatedItemListManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosConcatenatedItemListManager);
}

uint64_t dispatch thunk of PhotosConcatenatedItemListManager.__allocating_init(mainItemListManager:prependItemListManager:appendItemListManager:waitForPrependItemListManagerList:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t sub_259D09FC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_259D09CD8();
  *a1 = result;
  return result;
}

uint64_t sub_259D0A00C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t static PhotosAnyEquatable.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 32))(a2) & 1;
}

uint64_t areEqual(_:_:)(uint64_t a1, uint64_t a2)
{
  sub_259D0A290(a1, (uint64_t)&v23);
  if (!v24)
  {
    sub_259D0A2F8((uint64_t)&v23);
LABEL_6:
    uint64_t v20 = *(void *)(a1 + 24);
    sub_259D0A290(a2, (uint64_t)&v23);
    char v19 = (v20 | v24) == 0;
    sub_259D0A2F8((uint64_t)&v23);
    return v19 & 1;
  }
  sub_259D040F0(&v23, (uint64_t)v29);
  sub_259D0A290(a2, (uint64_t)&v23);
  if (!v24)
  {
    sub_259D0A2F8((uint64_t)&v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    goto LABEL_6;
  }
  sub_259D040F0(&v23, (uint64_t)v26);
  uint64_t v5 = v30;
  uint64_t v6 = v31;
  __swift_project_boxed_opaque_existential_1(v29, v30);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v7, v8);
  uint64_t v10 = OUTLINED_FUNCTION_1_0(v9, v22[0]);
  v11(v10);
  PhotosAnyEquatable.init<A>(_:)(v2, v5, v6, (uint64_t *)&v23);
  uint64_t v12 = v27;
  uint64_t v13 = v28;
  __swift_project_boxed_opaque_existential_1(v26, v27);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v14, v15);
  CGFloat v17 = OUTLINED_FUNCTION_1_0(v16, v22[0]);
  v18(v17);
  PhotosAnyEquatable.init<A>(_:)(v2, v12, v13, v22);
  char v19 = v25(v22);
  sub_259CFF00C((uint64_t)v22);
  sub_259CFF00C((uint64_t)&v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  return v19 & 1;
}

uint64_t sub_259D0A290(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECEB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_259D0A2F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECEB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithCopy for PhotosAnyEquatable(void *a1, void *a2)
{
  uint64_t v4 = a2[3];
  a1[3] = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for PhotosAnyEquatable(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_0(a1, a2);
  uint64_t v4 = a2[5];
  a1[4] = a2[4];
  a1[5] = v4;
  swift_retain();
  swift_release();
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
        long long v11 = *(uint64_t (**)(void))(v10 + 24);
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

_OWORD *assignWithTake for PhotosAnyEquatable(_OWORD *a1, _OWORD *a2)
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosAnyEquatable(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosAnyEquatable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotosAnyEquatable()
{
  return &type metadata for PhotosAnyEquatable;
}

uint64_t PhotosConcatenatedItemList.prependItemList.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_19();
  uint64_t v4 = v1 + *(void *)(v3 + 136);
  sub_259D62B68();
  OUTLINED_FUNCTION_8_0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);

  return v7(a1, v4, v5);
}

uint64_t PhotosConcatenatedItemList.appendItemList.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_19();
  uint64_t v4 = v1 + *(void *)(v3 + 144);
  sub_259D62B68();
  OUTLINED_FUNCTION_8_0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);

  return v7(a1, v4, v5);
}

void PhotosConcatenatedItemList.placeholderObject.getter()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v13 = v1;
  unint64_t v2 = *(void **)v0;
  uint64_t v3 = *(void *)(*(void *)v0 + 104);
  uint64_t v4 = *(void *)(*(void *)v0 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v5, v6);
  OUTLINED_FUNCTION_26(v7, v11);
  (*(void (**)(uint64_t, uint64_t))(v3 + 104))(v4, v3);
  v14[2] = v4;
  void v14[3] = v2[11];
  v14[4] = v2[12];
  v14[5] = v3;
  void v14[6] = v2[14];
  v14[7] = v2[15];
  v14[8] = AssociatedTypeWitness;
  v14[9] = swift_getAssociatedTypeWitness();
  v14[10] = swift_getAssociatedTypeWitness();
  v14[11] = swift_getAssociatedConformanceWitness();
  v14[12] = swift_getAssociatedConformanceWitness();
  v14[13] = swift_getAssociatedConformanceWitness();
  uint64_t v8 = type metadata accessor for PhotosConcatenatedItem();
  sub_259D0AC4C((void (*)(char *, char *))sub_259D0B90C, (uint64_t)v14, MEMORY[0x263F8E628], v8, v9, v13);
  OUTLINED_FUNCTION_15();
  v10();
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_259D0AAA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a2, a1, AssociatedTypeWitness);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v5 = type metadata accessor for PhotosConcatenatedItem();
  swift_storeEnumTagMultiPayload();
  return __swift_storeEnumTagSinglePayload(a2, 0, 1, v5);
}

uint64_t sub_259D0AC4C@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v27 = a5;
  uint64_t v28 = a4;
  uint64_t v29 = a2;
  uint64_t v30 = a1;
  uint64_t v9 = *(void *)(a3 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v10, v16);
  char v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17, v20);
  CGFloat v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v23 + 16))(v22, v24);
  if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v14) == 1) {
    return __swift_storeEnumTagSinglePayload(a6, 1, 1, v28);
  }
  uint64_t v28 = v9;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v22, v14);
  v30(v19, v12);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v19, v14);
  if (v6) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v28 + 32))(v27, v12, a3);
  }
  return result;
}

void PhotosConcatenatedItemList.index(nearest:)()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v99 = v1;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 96);
  sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v94 = v5;
  uint64_t v95 = v4;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v6, v7);
  OUTLINED_FUNCTION_10_0();
  uint64_t v96 = v8;
  OUTLINED_FUNCTION_14();
  uint64_t v100 = *(void *)(v9 + 120);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v93 = v11;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v12, v13);
  uint64_t v92 = (char *)&v80 - v14;
  OUTLINED_FUNCTION_14();
  uint64_t v16 = *(void *)(v15 + 104);
  uint64_t v17 = *(void *)(v2 + 80);
  uint64_t v18 = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v88 = v19;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v20, v21);
  OUTLINED_FUNCTION_10_0();
  uint64_t v84 = v22;
  OUTLINED_FUNCTION_14();
  uint64_t v24 = *(void *)(v23 + 88);
  uint64_t v86 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v85 = v25;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v26, v27);
  OUTLINED_FUNCTION_10_0();
  uint64_t v90 = v28;
  uint64_t v98 = v0;
  uint64_t v29 = *(void *)(v2 + 112);
  uint64_t v30 = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v83 = v31;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v32, v33);
  OUTLINED_FUNCTION_10_0();
  uint64_t v82 = v34;
  uint64_t v89 = v16;
  uint64_t v87 = v17;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v81 = v29;
  uint64_t v91 = v24;
  uint64_t v36 = swift_getAssociatedConformanceWitness();
  uint64_t v97 = v3;
  uint64_t v37 = swift_getAssociatedConformanceWitness();
  uint64_t v101 = v18;
  uint64_t v102 = v30;
  uint64_t v103 = AssociatedTypeWitness;
  uint64_t v104 = AssociatedConformanceWitness;
  uint64_t v38 = v99;
  uint64_t v105 = v36;
  uint64_t v106 = v37;
  uint64_t v39 = type metadata accessor for PhotosConcatenatedItem();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v40, v41);
  OUTLINED_FUNCTION_17();
  (*(void (**)(void *, uint64_t, uint64_t))(v42 + 16))(&protocol requirements base descriptor for PhotosItemList, v38, v39);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    uint64_t v56 = v88;
    uint64_t v57 = v84;
    OUTLINED_FUNCTION_3_3();
    v58();
    OUTLINED_FUNCTION_12();
    uint64_t v70 = (*(uint64_t (**)(uint64_t, uint64_t))(v89 + 96))(v57, v87);
    char v72 = v59 & 1;
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v57, v18);
    goto LABEL_11;
  }
  if (EnumCaseMultiPayload != 1)
  {
    int64_t v60 = v92;
    OUTLINED_FUNCTION_3_3();
    v61();
    OUTLINED_FUNCTION_12();
    uint64_t v63 = v94;
    uint64_t v62 = v95;
    uint64_t v64 = v96;
    OUTLINED_FUNCTION_6_1();
    v65();
    uint64_t v66 = OUTLINED_FUNCTION_33();
    uint64_t v67 = v97;
    OUTLINED_FUNCTION_13(v66, v68, v97);
    if (!v53)
    {
      uint64_t v70 = (*(uint64_t (**)(char *, uint64_t))(v100 + 96))(v60, v67);
      char v72 = v76 & 1;
      OUTLINED_FUNCTION_11();
      v77();
      OUTLINED_FUNCTION_8_0();
      (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v64, v67);
      goto LABEL_11;
    }
    OUTLINED_FUNCTION_11();
    v69();
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v64, v62);
LABEL_10:
    uint64_t v70 = 0;
    char v72 = 1;
    goto LABEL_11;
  }
  uint64_t v44 = v82;
  OUTLINED_FUNCTION_3_3();
  v45();
  OUTLINED_FUNCTION_12();
  uint64_t v46 = v85;
  uint64_t v47 = v90;
  uint64_t v48 = v86;
  OUTLINED_FUNCTION_6_1();
  v49();
  uint64_t v50 = OUTLINED_FUNCTION_33();
  uint64_t v51 = v91;
  OUTLINED_FUNCTION_13(v50, v52, v91);
  if (v53)
  {
    uint64_t v54 = OUTLINED_FUNCTION_18();
    v55(v54);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v47, v48);
    goto LABEL_10;
  }
  uint64_t v70 = (*(uint64_t (**)(uint64_t, uint64_t))(v81 + 96))(v44, v51);
  char v72 = v71 & 1;
  uint64_t v73 = OUTLINED_FUNCTION_18();
  v74(v73);
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v47, v51);
LABEL_11:
  char v79 = sub_259D0B4F4(v39);
  sub_259CFBAC4(v70, v72, v79);
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_259D0B4F4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1, v1);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v3 + 16))(v5);
  uint64_t v6 = 0x20001u >> (8 * swift_getEnumCaseMultiPayload());
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a1);
  return v6;
}

void sub_259D0B5E4()
{
}

void sub_259D0B60C()
{
}

void PhotosConcatenatedItem.value.getter()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v1 = v0;
  uint64_t v2 = v0[3];
  OUTLINED_FUNCTION_0_0();
  uint64_t v33 = v3;
  uint64_t v6 = *(void *)(MEMORY[0x270FA5388](v4, v5) + 32);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v7, v8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v9, v10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v11, v12);
  uint64_t v14 = OUTLINED_FUNCTION_2_4(v13, v33);
  v15(v14);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      OUTLINED_FUNCTION_30();
      OUTLINED_FUNCTION_3_3();
      v17();
      uint64_t v18 = v1[6];
      uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v18 + 72);
      uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      OUTLINED_FUNCTION_21(AssociatedTypeWitness);
      v19(v2, v18);
      uint64_t v21 = OUTLINED_FUNCTION_31();
    }
    else
    {
      OUTLINED_FUNCTION_3_3();
      v29();
      uint64_t v30 = v1[7];
      uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v30 + 72);
      uint64_t v32 = swift_getAssociatedTypeWitness();
      OUTLINED_FUNCTION_21(v32);
      v31(v6, v30);
      uint64_t v21 = OUTLINED_FUNCTION_20();
    }
    v22(v21);
  }
  else
  {
    OUTLINED_FUNCTION_3_3();
    v23();
    uint64_t v24 = *(void (**)(uint64_t))(v1[5] + 72);
    uint64_t v25 = swift_getAssociatedTypeWitness();
    OUTLINED_FUNCTION_21(v25);
    uint64_t v26 = OUTLINED_FUNCTION_23();
    v24(v26);
    uint64_t v27 = OUTLINED_FUNCTION_9_0();
    v28(v27);
  }
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_259D0B90C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_259D0AAA4(a1, a2);
}

uint64_t sub_259D0B934()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t method lookup function for PhotosConcatenatedItemList(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosConcatenatedItemList);
}

uint64_t dispatch thunk of PhotosConcatenatedItemList.__allocating_init(mainItemList:prependItemList:appendItemList:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_259D0B9E4(uint64_t a1, unsigned __int8 *a2, void *a3)
{
  uint64_t v4 = *(void *)(a3[2] - 8);
  unint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(void *)(a3[3] - 8);
  if (*(void *)(v6 + 64) > v5) {
    unint64_t v5 = *(void *)(v6 + 64);
  }
  uint64_t v7 = *(void *)(a3[4] - 8);
  if (*(void *)(v7 + 64) <= v5) {
    unint64_t v8 = v5;
  }
  else {
    unint64_t v8 = *(void *)(v7 + 64);
  }
  unsigned int v9 = a2[v8];
  unsigned int v10 = v9 - 3;
  if (v9 >= 3)
  {
    if (v8 <= 3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *a2;
        goto LABEL_15;
      case 2:
        int v12 = *(unsigned __int16 *)a2;
        goto LABEL_15;
      case 3:
        int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_15;
      case 4:
        int v12 = *(_DWORD *)a2;
LABEL_15:
        int v13 = (v12 | (v10 << (8 * v8))) + 3;
        unsigned int v9 = v12 + 3;
        if (v8 < 4) {
          unsigned int v9 = v13;
        }
        break;
      default:
        break;
    }
  }
  if (v9)
  {
    if (v9 == 2)
    {
      char v14 = 2;
      uint64_t v4 = *(void *)(a3[4] - 8);
    }
    else
    {
      char v14 = 1;
      uint64_t v4 = *(void *)(a3[3] - 8);
    }
  }
  else
  {
    char v14 = 0;
  }
  (*(void (**)(uint64_t))(v4 + 32))(a1);
  *(unsigned char *)(a1 + v8) = v14;
  return a1;
}

uint64_t sub_259D0BBF4(unsigned __int16 *a1, unsigned int a2, void *a3)
{
  unint64_t v3 = *(void *)(*(void *)(a3[2] - 8) + 64);
  uint64_t v4 = *(void *)(a3[3] - 8);
  if (*(void *)(v4 + 64) > v3) {
    unint64_t v3 = *(void *)(v4 + 64);
  }
  unint64_t v5 = *(void *)(*(void *)(a3[4] - 8) + 64);
  if (v5 <= v3) {
    unint64_t v5 = v3;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_24;
  }
  unint64_t v6 = v5 + 1;
  char v7 = 8 * (v5 + 1);
  if ((v5 + 1) <= 3)
  {
    unsigned int v10 = ((a2 + ~(-1 << v7) - 253) >> v7) + 1;
    if (HIWORD(v10))
    {
      int v8 = *(_DWORD *)((char *)a1 + v6);
      if (!v8) {
        goto LABEL_24;
      }
      goto LABEL_16;
    }
    if (v10 > 0xFF)
    {
      int v8 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_24;
      }
      goto LABEL_16;
    }
    if (v10 < 2)
    {
LABEL_24:
      unsigned int v12 = *((unsigned __int8 *)a1 + v5);
      if (v12 >= 3) {
        return (v12 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v8 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_24;
  }
LABEL_16:
  int v11 = (v8 - 1) << v7;
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
  return (v6 | v11) + 254;
}

void sub_259D0BD58(char *a1, unsigned int a2, unsigned int a3, void *a4)
{
  unint64_t v5 = *(void *)(*(void *)(a4[2] - 8) + 64);
  if (*(void *)(*(void *)(a4[3] - 8) + 64) > v5) {
    unint64_t v5 = *(void *)(*(void *)(a4[3] - 8) + 64);
  }
  uint64_t v6 = *(void *)(a4[4] - 8);
  if (*(void *)(v6 + 64) > v5) {
    unint64_t v5 = *(void *)(v6 + 64);
  }
  size_t v7 = v5 + 1;
  char v8 = 8 * (v5 + 1);
  if (a3 < 0xFE)
  {
    int v9 = 0;
  }
  else if (v7 <= 3)
  {
    unsigned int v12 = ((a3 + ~(-1 << v8) - 253) >> v8) + 1;
    if (HIWORD(v12))
    {
      int v9 = 4;
    }
    else if (v12 >= 0x100)
    {
      int v9 = 2;
    }
    else
    {
      int v9 = v12 > 1;
    }
  }
  else
  {
    int v9 = 1;
  }
  if (a2 > 0xFD)
  {
    unsigned int v10 = a2 - 254;
    if (v7 < 4)
    {
      int v11 = (v10 >> v8) + 1;
      if (v5 != -1)
      {
        int v13 = v10 & ~(-1 << v8);
        bzero(a1, v7);
        if (v7 == 3)
        {
          *(_WORD *)a1 = v13;
          a1[2] = BYTE2(v13);
        }
        else if (v7 == 2)
        {
          *(_WORD *)a1 = v13;
        }
        else
        {
          *a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v10;
      int v11 = 1;
    }
    switch(v9)
    {
      case 1:
        a1[v7] = v11;
        break;
      case 2:
        *(_WORD *)&a1[v7] = v11;
        break;
      case 3:
LABEL_36:
        __break(1u);
        JUMPOUT(0x259D0BF4CLL);
      case 4:
        *(_DWORD *)&a1[v7] = v11;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v9)
    {
      case 1:
        a1[v7] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_25;
      case 2:
        *(_WORD *)&a1[v7] = 0;
        goto LABEL_24;
      case 3:
        goto LABEL_36;
      case 4:
        *(_DWORD *)&a1[v7] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_25;
      default:
LABEL_24:
        if (a2) {
LABEL_25:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return v0;
}

uint64_t *OUTLINED_FUNCTION_21(uint64_t a1)
{
  unint64_t v3 = *(uint64_t **)(v1 - 88);
  v3[3] = a1;
  return __swift_allocate_boxed_opaque_existential_1(v3);
}

ValueMetadata *type metadata accessor for PhotosUniqueVersion()
{
  return &type metadata for PhotosUniqueVersion;
}

uint64_t PhotosChildProvidingItemListManager.Options.init(excludeEmptyItems:)@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t PhotosChildProvidingItemListManager.__allocating_init(parentItemListManager:options:childProvider:childUpdater:)()
{
  uint64_t v0 = swift_allocObject();
  OUTLINED_FUNCTION_4_3();
  PhotosChildProvidingItemListManager.init(parentItemListManager:options:childProvider:childUpdater:)(v1, v2, v3, v4, v5, v6);
  return v0;
}

void *PhotosChildProvidingItemListManager.init(parentItemListManager:options:childProvider:childUpdater:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  size_t v7 = v6;
  char v8 = (void *)*v6;
  char v25 = *a2;
  v7[9] = 0;
  v7[10] = 0;
  uint64_t v31 = v8[12];
  uint64_t v9 = v8[10];
  OUTLINED_FUNCTION_7_1();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  uint64_t v12 = v8[11];
  swift_getTupleTypeMetadata2();
  sub_259D627D8();
  swift_getAssociatedConformanceWitness();
  v7[11] = sub_259D62548();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3ECD78);
  swift_getTupleTypeMetadata2();
  sub_259D627D8();
  v7[12] = sub_259D62548();
  *((unsigned char *)v7 + 104) = 0;
  *((unsigned char *)v7 + 16) = v25;
  uint64_t v13 = v8[13];
  v32[0] = v9;
  v32[1] = v12;
  v32[2] = AssociatedTypeWitness;
  v32[3] = v12;
  v32[4] = v31;
  v32[5] = v13;
  v32[6] = AssociatedConformanceWitness;
  v32[7] = v13;
  type metadata accessor for PhotosChildProvidingItemListManager.ChildItem();
  swift_getWitnessTable();
  type metadata accessor for PhotosBasicItemListManager();
  type metadata accessor for PhotosBasicItemList();
  LOBYTE(v32[0]) = 0;
  uint64_t v14 = sub_259D627D8();
  uint64_t v15 = PhotosBasicItemList.__allocating_init(items:loadingStatus:)(v14, (char *)v32);
  v7[3] = PhotosBasicItemListManager.__allocating_init(itemList:)(v15);
  v7[4] = a1;
  v7[5] = a3;
  void v7[6] = a4;
  v7[7] = a5;
  v7[8] = a6;
  v32[0] = a1;
  uint64_t v16 = swift_allocObject();
  swift_weakInit();
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = v9;
  v17[2] = v9;
  v17[3] = v12;
  v17[4] = v31;
  v17[5] = v13;
  v17[6] = v16;
  uint64_t v19 = *(void *)(v31 + 16);
  uint64_t v20 = *(uint64_t (**)(uint64_t (*)(uint64_t *), void *, uint64_t, uint64_t))(v19 + 24);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v21 = v20(sub_259D0E654, v17, v18, v19);
  uint64_t v23 = v22;
  swift_release();
  v7[9] = v21;
  v7[10] = v23;
  swift_unknownObjectRelease();
  sub_259D0C4A0();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return v7;
}

uint64_t sub_259D0C410()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_259D0C448(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 88) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_259D0C490()
{
  return *(unsigned __int8 *)(v0 + 104);
}

uint64_t sub_259D0C498(uint64_t result)
{
  *(unsigned char *)(v1 + 104) = result;
  return result;
}

uint64_t sub_259D0C4A0()
{
  uint64_t v1 = v0;
  uint64_t v78 = (void *)*v0;
  uint64_t v65 = v78[12];
  uint64_t v2 = v78[10];
  OUTLINED_FUNCTION_7_1();
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  uint64_t v4 = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v69 = v6;
  uint64_t v9 = MEMORY[0x270FA5388](v7, v8);
  uint64_t v67 = &v54[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v56 = &v54[-v12];
  uint64_t v13 = swift_checkMetadataState();
  OUTLINED_FUNCTION_0_0();
  uint64_t v68 = v14;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v15, v16);
  uint64_t v18 = &v54[-v17];
  uint64_t v19 = swift_checkMetadataState();
  uint64_t v79 = v19;
  OUTLINED_FUNCTION_0_0();
  uint64_t v57 = v20;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v21, v22);
  uint64_t v24 = &v54[-v23];
  sub_259CEE908();
  uint64_t v96 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(v19, AssociatedConformanceWitness);
  OUTLINED_FUNCTION_8_1();
  sub_259D62878();
  uint64_t v75 = v4;
  uint64_t v81 = v13;
  uint64_t v25 = AssociatedConformanceWitness;
  uint64_t v26 = swift_getAssociatedConformanceWitness();
  swift_getWitnessTable();
  uint64_t v27 = sub_259D62978();
  sub_259D0C410();
  uint64_t v89 = v2;
  uint64_t v90 = v78[11];
  uint64_t v91 = v65;
  uint64_t v92 = v78[13];
  uint64_t v93 = v27;
  uint64_t v64 = v2;
  uint64_t v82 = v2;
  uint64_t v83 = v90;
  uint64_t v84 = v65;
  uint64_t v85 = v92;
  uint64_t v63 = v92;
  uint64_t v86 = sub_259D0F210;
  uint64_t v87 = &v88;
  uint64_t v66 = (void (*)(void, void, void))AssociatedTypeWitness;
  uint64_t v76 = v90;
  uint64_t v80 = v26;
  uint64_t v28 = sub_259D62558();
  swift_bridgeObjectRelease();
  sub_259D0C448(v28);
  int v29 = *((unsigned __int8 *)v1 + 104);
  *((unsigned char *)v1 + 104) = 1;
  uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t))(v25 + 32);
  uint64_t v77 = v24;
  uint64_t v31 = v25;
  uint64_t result = v30(v79, v25);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    int v55 = v29;
    uint64_t v78 = v1;
    uint64_t v33 = v80;
    uint64_t v34 = v66;
    unint64_t v35 = v56;
    uint64_t v36 = v76;
    if (result)
    {
      uint64_t v37 = 0;
      char v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 56);
      uint64_t v73 = v31 + 56;
      uint64_t v70 = *(void (**)(uint64_t, uint64_t))(v75 + 64);
      uint64_t v71 = v75 + 64;
      uint64_t v61 = v78 + 11;
      int64_t v60 = v78 + 12;
      char v59 = (void (**)(void, void, void))(v69 + 16);
      v69 += 8;
      v68 += 8;
      uint64_t v62 = v31;
      uint64_t v74 = result;
      uint64_t v58 = v18;
      do
      {
        v72(v37, v79, v31);
        v70(v81, v75);
        uint64_t v38 = v18;
        uint64_t v39 = v78;
        uint64_t v40 = sub_259D0C410();
        MEMORY[0x25A2E8CD0](&v96, v35, v40, v34, v36, v33);
        swift_bridgeObjectRelease();
        if (v96)
        {
          ((void (*)(unsigned char *, uint64_t))v39[7])(v38, v96);
          swift_unknownObjectRelease();
          uint64_t v18 = v38;
        }
        else
        {
          uint64_t v41 = ((uint64_t (*)(unsigned char *))v39[5])(v38);
          uint64_t v66 = *v59;
          v66(v67, v35, v34);
          uint64_t v94 = v41;
          OUTLINED_FUNCTION_5_3();
          OUTLINED_FUNCTION_8_1();
          sub_259D62568();
          swift_unknownObjectRetain();
          uint64_t v42 = v67;
          sub_259D62588();
          swift_endAccess();
          v66(v42, v35, v34);
          uint64_t v43 = v41;
          uint64_t v96 = v41;
          uint64_t v44 = swift_allocObject();
          swift_weakInit();
          uint64_t v45 = (void *)swift_allocObject();
          v45[2] = v64;
          v45[3] = v36;
          uint64_t v46 = v63;
          v45[4] = v65;
          v45[5] = v46;
          v45[6] = v44;
          uint64_t v47 = (*(uint64_t (**)(uint64_t (*)(uint64_t *), void *, uint64_t))(*(void *)(v46 + 16)
                                                                                                + 24))(sub_259D0F290, v45, v36);
          uint64_t v49 = v48;
          uint64_t v31 = v62;
          swift_release();
          uint64_t v94 = v47;
          uint64_t v95 = v49;
          OUTLINED_FUNCTION_5_3();
          __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A3ECD78);
          OUTLINED_FUNCTION_8_1();
          sub_259D62568();
          sub_259D62588();
          swift_endAccess();
          uint64_t v50 = (void (*)(unsigned char *, uint64_t))v39[7];
          uint64_t v18 = v58;
          v50(v58, v43);
          swift_unknownObjectRelease();
        }
        ++v37;
        OUTLINED_FUNCTION_15();
        v51();
        OUTLINED_FUNCTION_15();
        v52();
        uint64_t v33 = v80;
        uint64_t v36 = v76;
      }
      while (v74 != v37);
    }
    *((unsigned char *)v78 + 104) = v55;
    sub_259D0CE88();
    OUTLINED_FUNCTION_15();
    return v53();
  }
  return result;
}

uint64_t sub_259D0CCE8()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();

  return sub_259D62948();
}

uint64_t sub_259D0CE18(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void))
{
  uint64_t v8 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (v8) {
      a7();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_259D0CE88()
{
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_1_8();
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 96);
  uint64_t v6 = *(void *)(v4 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_1_7();
  uint64_t result = MEMORY[0x270FA5388](v10, v11);
  uint64_t v14 = (char *)v37 - v13;
  if ((*(unsigned char *)(v0 + 104) & 1) == 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 40))(v6, v5);
    uint64_t v38 = v6;
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(AssociatedTypeWitness, AssociatedConformanceWitness);
    uint64_t v17 = (*(void *(**)(uint64_t *__return_ptr, uint64_t, uint64_t))(AssociatedConformanceWitness + 112))(&v44, AssociatedTypeWitness, AssociatedConformanceWitness);
    int v19 = *(unsigned __int8 *)(v0 + 16);
    uint64_t v40 = v14;
    uint64_t v41 = v9;
    uint64_t v39 = v3;
    if (v19 == 1)
    {
      v43[0] = v16;
      MEMORY[0x270FA5388](v17, v18);
      v37[-2] = v0;
      v37[-1] = &v44;
      swift_getAssociatedTypeWitness();
      swift_getAssociatedConformanceWitness();
      swift_getAssociatedTypeWitness();
      sub_259D62878();
      swift_getWitnessTable();
      uint64_t v16 = sub_259D62CD8();
    }
    uint64_t v42 = *(void *)(v0 + 24);
    PhotosBasicItemListManager.itemList.getter();
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v20 = swift_getAssociatedTypeWitness();
    uint64_t v21 = swift_getAssociatedConformanceWitness();
    OUTLINED_FUNCTION_8_1();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    char v22 = sub_259D62888();
    uint64_t v23 = swift_bridgeObjectRelease();
    if ((v22 & 1) != 0
      && (int v25 = *(unsigned __int8 *)(PhotosBasicItemListManager.itemList.getter() + 40),
          uint64_t v23 = swift_release(),
          v25 == v44))
    {
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v40, AssociatedTypeWitness);
    }
    else
    {
      v37[1] = v37;
      v43[9] = v16;
      MEMORY[0x270FA5388](v23, v24);
      v37[-4] = v1;
      uint64_t v26 = v40;
      v37[-3] = v40;
      v37[-2] = &v44;
      uint64_t v27 = sub_259D62878();
      uint64_t v28 = *(void *)(v39 + 88);
      uint64_t v29 = *(void *)(v39 + 104);
      v43[0] = v38;
      v43[1] = v28;
      v43[2] = v20;
      v43[3] = v28;
      v43[4] = v5;
      v43[5] = v29;
      v43[6] = v21;
      v43[7] = v29;
      uint64_t v30 = type metadata accessor for PhotosChildProvidingItemListManager.ChildItem();
      uint64_t WitnessTable = swift_getWitnessTable();
      uint64_t v33 = sub_259CE704C((void (*)(char *, uint64_t))sub_259D0F1C4, (uint64_t)&v37[-6], v27, v30, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v32);
      swift_bridgeObjectRelease();
      swift_getWitnessTable();
      type metadata accessor for PhotosBasicItemList();
      LOBYTE(v43[0]) = v44;
      uint64_t v34 = PhotosBasicItemList.__allocating_init(items:loadingStatus:)(v33, (char *)v43);
      v43[0] = v42;
      uint64_t v35 = type metadata accessor for PhotosBasicItemListManager();
      swift_retain();
      swift_retain();
      uint64_t v36 = swift_getWitnessTable();
      PhotosMutableComposedObservable<>.performChanges(using:)((uint64_t)sub_259D0F1E8, v34, v35, v36);
      swift_release_n();
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v26, AssociatedTypeWitness);
    }
  }
  return result;
}

uint64_t sub_259D0D3E0(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v26 = a3;
  uint64_t v4 = *(void *)(*(void *)a2 + 88);
  uint64_t v23 = *(void *)(*(void *)a2 + 104);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v27 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = MEMORY[0x270FA5388](AssociatedTypeWitness, v5);
  int v25 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_259D0C410();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x25A2E8CD0](&v29, a1, v11, v12, v4, AssociatedConformanceWitness);
  uint64_t result = swift_bridgeObjectRelease();
  if (v29)
  {
    uint64_t v15 = v23;
    char v22 = *(void (**)(uint64_t, uint64_t))(v23 + 40);
    v22(v4, v23);
    uint64_t v16 = AssociatedTypeWitness;
    uint64_t v17 = swift_getAssociatedConformanceWitness();
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v17 + 112))(&v28, v16, v17);
    unsigned __int8 v18 = v28;
    int v19 = v25;
    if (*v26 < v28) {
      unsigned __int8 v18 = *v26;
    }
    *uint64_t v26 = v18;
    v22(v4, v15);
    char v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 40))(v16, v17);
    swift_unknownObjectRelease();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v27 + 8);
    v21(v19, v16);
    v21(v10, v16);
    return (v20 & 1) == 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_259D0D764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v45 = a3;
  uint64_t v42 = a4;
  uint64_t v43 = a5;
  uint64_t v48 = a1;
  uint64_t v5 = *(void **)a2;
  uint64_t v6 = *(void *)(*(void *)a2 + 104);
  uint64_t v46 = v5[11];
  uint64_t v44 = v6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v39 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v40 = AssociatedTypeWitness;
  MEMORY[0x270FA5388](AssociatedTypeWitness, v8);
  uint64_t v37 = (char *)v35 - v9;
  uint64_t v10 = v5[12];
  uint64_t v11 = v5[10];
  swift_getAssociatedTypeWitness();
  uint64_t v41 = v10;
  uint64_t v38 = v11;
  swift_getAssociatedConformanceWitness();
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t v13 = sub_259D62B68();
  uint64_t v15 = MEMORY[0x270FA5388](v13 - 8, v14);
  uint64_t v17 = (char *)v35 - v16;
  uint64_t v18 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v15, v19);
  uint64_t v36 = (char *)v35 - v20;
  uint64_t v21 = sub_259D0C410();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v23 = swift_getAssociatedTypeWitness();
  v35[1] = AssociatedConformanceWitness;
  uint64_t v24 = v46;
  uint64_t v25 = v48;
  uint64_t v26 = swift_getAssociatedConformanceWitness();
  MEMORY[0x25A2E8CD0](v47, v25, v21, v23, v24, v26);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v28 = v47[0];
  if (!v47[0])
  {
    __break(1u);
    goto LABEL_7;
  }
  v47[3] = v23;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v47);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(boxed_opaque_existential_1, v25, v23);
  swift_checkMetadataState();
  PhotosItemList.item(for:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v12);
  if (result == 1)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v30 = (uint64_t)v36;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v36, v17, v12);
  uint64_t v31 = v37;
  (*(void (**)(uint64_t, uint64_t))(v44 + 40))(v24, v44);
  uint64_t v32 = v40;
  uint64_t v33 = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v33 + 112))(v47, v32, v33);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v31, v32);
  unsigned __int8 v34 = v47[0];
  if (*v42 < LOBYTE(v47[0])) {
    unsigned __int8 v34 = *v42;
  }
  *uint64_t v42 = v34;
  return PhotosChildProvidingItemListManager.ChildItem.init(parentItem:child:)(v30, v28, v12, v43);
}

uint64_t PhotosChildProvidingItemListManager.ChildItem.init(parentItem:child:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1, a3);
  uint64_t result = type metadata accessor for PhotosChildProvidingItemListManager.ChildItem();
  *(void *)(a4 + *(int *)(result + 84)) = a2;
  return result;
}

uint64_t sub_259D0DCB0()
{
  return sub_259CEFE1C();
}

uint64_t sub_259D0DCE4()
{
  return swift_retain();
}

id sub_259D0DCF0()
{
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_7_1();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_6_2();
  swift_getAssociatedConformanceWitness();
  swift_retain();
  type metadata accessor for PhotosChildProvidingItemListManager.ChildItem();
  swift_getWitnessTable();
  type metadata accessor for PhotosBasicItemListManager();
  swift_getWitnessTable();
  id v0 = PhotosComposedObservable<>.observeChanges(using:)();
  swift_release();
  return v0;
}

uint64_t sub_259D0DEB0(double a1)
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_1_8();
  uint64_t v5 = v4;
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_7_1();
  swift_getAssociatedTypeWitness();
  uint64_t v70 = AssociatedConformanceWitness;
  uint64_t v67 = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v10, v11);
  uint64_t v13 = (char *)&v57 - v12;
  uint64_t v14 = swift_checkMetadataState();
  OUTLINED_FUNCTION_0_0();
  uint64_t v59 = v15;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v16, v17);
  uint64_t v19 = (char *)&v57 - v18;
  uint64_t v68 = swift_checkMetadataState();
  OUTLINED_FUNCTION_0_0();
  uint64_t v21 = v20;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v22, v23);
  uint64_t v25 = (char *)&v57 - v24;
  uint64_t v26 = mach_absolute_time();
  uint64_t v69 = v2;
  sub_259D0E3CC(v2, v74);
  uint64_t result = mach_absolute_time();
  uint64_t v28 = result - v26;
  if (result < v26) {
    goto LABEL_20;
  }
  if (v28 < 0)
  {
LABEL_21:
    __break(1u);
  }
  else
  {
    double v29 = PXTimebaseConversionFactor();
    if (v74[0] != 1)
    {
      int v71 = 0;
      return v71 & 1;
    }
    double v30 = v29;
    uint64_t v58 = v9;
    sub_259D0C4A0();
    sub_259CEE908();
    uint64_t v31 = v68;
    uint64_t v32 = (*(uint64_t (**)(uint64_t))(v70 + 32))(v68);
    uint64_t v65 = *(uint64_t (**)(char *, uint64_t))(v21 + 8);
    uint64_t v66 = v21 + 8;
    uint64_t result = v65(v25, v31);
    if ((v32 & 0x8000000000000000) == 0)
    {
      int v71 = 1;
      if (v32)
      {
        uint64_t v64 = v5;
        double v33 = a1 - v30 * (double)v28;
        if (v33 > 0.0)
        {
          uint64_t v34 = 0;
          uint64_t v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 56);
          uint64_t v63 = v70 + 56;
          int64_t v60 = *(void (**)(uint64_t, uint64_t))(v67 + 64);
          uint64_t v61 = v67 + 64;
          uint64_t v57 = v59 + 8;
          v58 += 8;
          uint64_t v59 = v32 - 1;
          int v71 = 1;
          uint64_t v35 = v64;
          while (1)
          {
            sub_259CEE908();
            uint64_t v36 = v68;
            v62(v34, v68, v70);
            v65(v25, v36);
            v60(v14, v67);
            uint64_t v37 = sub_259D0C410();
            uint64_t v38 = v19;
            uint64_t v39 = *(void *)(v35 + 88);
            uint64_t v40 = swift_getAssociatedConformanceWitness();
            MEMORY[0x25A2E8CD0](&v73, v13, v37, AssociatedTypeWitness, v39, v40);
            swift_bridgeObjectRelease();
            if (v73)
            {
              uint64_t v41 = v38;
              uint64_t v42 = mach_absolute_time();
              char v72 = (*(uint64_t (**)(uint64_t, double))(*(void *)(v35 + 104) + 56))(v39, v33) & 1;
              uint64_t result = mach_absolute_time();
              uint64_t v43 = result - v42;
              if (result < v42)
              {
                __break(1u);
LABEL_19:
                __break(1u);
LABEL_20:
                __break(1u);
                goto LABEL_21;
              }
              if (v43 < 0) {
                goto LABEL_19;
              }
              double v44 = PXTimebaseConversionFactor() * (double)v43;
              OUTLINED_FUNCTION_15();
              v47(v45, v46);
              uint64_t v19 = v41;
              OUTLINED_FUNCTION_15();
              v50(v48, v49);
              swift_unknownObjectRelease();
              double v33 = v33 - v44;
              int v71 = (v71 & v72);
            }
            else
            {
              OUTLINED_FUNCTION_15();
              v53(v51, v52);
              OUTLINED_FUNCTION_15();
              v56(v54, v55);
              uint64_t v19 = v38;
            }
            if (v59 != v34)
            {
              ++v34;
              if (v33 > 0.0) {
                continue;
              }
            }
            return v71 & 1;
          }
        }
      }
      return v71 & 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_259D0E3CC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(*(void *)a1 + 96) + 56))(*(void *)(*(void *)a1 + 80));
  *a2 = result & 1;
  return result;
}

uint64_t PhotosChildProvidingItemListManager.ChildItem.parentItem.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 32) - 8) + 16))(a2, v2);
}

uint64_t PhotosChildProvidingItemListManager.ChildItem.child.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t PhotosChildProvidingItemListManager.ChildItem.id.getter(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 64))(*(void *)(a1 + 32));
}

uint64_t PhotosChildProvidingItemListManager.ChildItem.value.getter(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 72))(*(void *)(a1 + 32));
}

uint64_t PhotosChildProvidingItemListManager.deinit()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PhotosChildProvidingItemListManager.__deallocating_deinit()
{
  PhotosChildProvidingItemListManager.deinit();

  return MEMORY[0x270FA0228](v0, 105, 7);
}

id sub_259D0E544()
{
  return sub_259D0DCF0();
}

uint64_t PhotosItemListManager.provideChildItemListManagers<A>(options:childProvider:childUpdater:)()
{
  return PhotosChildProvidingItemListManager.__allocating_init(parentItemListManager:options:childProvider:childUpdater:)();
}

uint64_t type metadata accessor for PhotosChildProvidingItemListManager.ChildItem()
{
  return swift_getGenericMetadata();
}

uint64_t sub_259D0E61C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_259D0E654(uint64_t *a1)
{
  return sub_259D0F2A8(a1, (void (*)(void))sub_259D0C4A0);
}

uint64_t type metadata accessor for PhotosChildProvidingItemListManager()
{
  return swift_getGenericMetadata();
}

uint64_t sub_259D0E684()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_259D0E6A4()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_259D0E6C4(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_259D0E700(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_259D0E760()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for PhotosChildProvidingItemListManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosChildProvidingItemListManager);
}

uint64_t dispatch thunk of PhotosChildProvidingItemListManager.__allocating_init(parentItemListManager:options:childProvider:childUpdater:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of PhotosChildProvidingItemListManager.itemList.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of PhotosChildProvidingItemListManager.changeDetailsRepository.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of PhotosChildProvidingItemListManager.observeChanges(using:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of PhotosChildProvidingItemListManager.waitForItemList(timeout:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t sub_259D0E8C4(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_259D0E95C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x259D0EA28);
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

uint64_t type metadata accessor for PhotosChildProvidingItemListManager.Options()
{
  return swift_getGenericMetadata();
}

uint64_t sub_259D0EA68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 72);
}

uint64_t sub_259D0EA70()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_259D0EB08(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 32) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    swift_unknownObjectRetain();
  }
  return v4;
}

uint64_t sub_259D0EC04(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 32) - 8) + 8))();

  return swift_unknownObjectRelease();
}

uint64_t sub_259D0EC74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 32) - 8) + 16;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 48) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 48) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_259D0ECF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 32) - 8) + 24;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 40) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 40) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_259D0ED80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 32) - 8) + 32;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_259D0EDFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 32) - 8) + 40;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_259D0EE80(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 32);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
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
        JUMPOUT(0x259D0EFBCLL);
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
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_259D0EFD0(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 32);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x259D0F19CLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          unint64_t v17 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0) {
            uint64_t v18 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v18 = (a2 - 1);
          }
          *unint64_t v17 = v18;
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t sub_259D0F1C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_259D0D764(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(unsigned __int8 **)(v2 + 32), a2);
}

uint64_t sub_259D0F1E8()
{
  return sub_259D0DCB0();
}

uint64_t sub_259D0F1F0(uint64_t a1)
{
  return sub_259D0D3E0(a1, *(void *)(v1 + 16), *(unsigned __int8 **)(v1 + 24)) & 1;
}

uint64_t sub_259D0F210()
{
  return sub_259D0CCE8();
}

uint64_t sub_259D0F220(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(uint64_t, void))(v2 + 48))(a1, *a2) & 1;
}

uint64_t sub_259D0F258()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_259D0F290(uint64_t *a1)
{
  return sub_259D0F2A8(a1, (void (*)(void))sub_259D0CE88);
}

uint64_t sub_259D0F2A8(uint64_t *a1, void (*a2)(void))
{
  return sub_259D0CE18(a1, v2[6], v2[2], v2[3], v2[4], v2[5], a2);
}

Swift::UInt64 __swiftcall PhotosSeededRandomNumberGenerator.next()()
{
  void *v0 = 41 * *v0 + 43501;
  return MEMORY[0x270F9FD30]();
}

uint64_t PhotosSeededRandomNumberGenerator.init(seed:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

ValueMetadata *type metadata accessor for PhotosSeededRandomNumberGenerator()
{
  return &type metadata for PhotosSeededRandomNumberGenerator;
}

BOOL sub_259D0F30C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a2 + 8);
  sub_259D0F4EC(a1, (uint64_t)v11);
  sub_259D0F4EC(a2, (uint64_t)v10);
  if (v3 != v4) {
    goto LABEL_7;
  }
  uint64_t v5 = MEMORY[0x25A2EAC90](v11);
  uint64_t v6 = MEMORY[0x25A2EAC90](v10);
  uint64_t v7 = v6;
  if (!v5)
  {
    if (!v6)
    {
      BOOL v8 = 1;
      goto LABEL_8;
    }
    swift_unknownObjectRelease();
    goto LABEL_7;
  }
  swift_unknownObjectRelease();
  if (!v7)
  {
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  swift_unknownObjectRelease();
  BOOL v8 = v5 == v7;
LABEL_8:
  sub_259D0F554((uint64_t)v10);
  sub_259D0F554((uint64_t)v11);
  return v8;
}

uint64_t PhotosDisplayRect.init(rect:in:)@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *(double *)(a1 + 16) = a2;
  *(double *)(a1 + 24) = a3;
  *(double *)(a1 + 32) = a4;
  *(double *)(a1 + 40) = a5;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  uint64_t v6 = sub_259D62618();
  uint64_t result = swift_unknownObjectRelease();
  *(void *)(a1 + 8) = v6;
  return result;
}

double PhotosDisplayRect.rect(in:)(uint64_t a1)
{
  uint64_t v2 = (double *)v1;
  sub_259D0F4EC(v1, (uint64_t)v8);
  uint64_t v4 = (void *)MEMORY[0x25A2EAC90](v8);
  sub_259D0F554((uint64_t)v8);
  if (!v4) {
    return *MEMORY[0x263F001A0];
  }
  objc_msgSend(v4, sel_convertRect_toCoordinateSpace_, a1, v2[2], v2[3], v2[4], v2[5]);
  double v6 = v5;
  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_259D0F4EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3EC9D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_259D0F554(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3EC9D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL static PhotosDisplayRect.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_259D0F30C(a1, a2) && CGRectEqualToRect(*(CGRect *)(a1 + 16), *(CGRect *)(a2 + 16));
}

__n128 initializeWithCopy for PhotosDisplayRect(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_unknownObjectWeakCopyInit();
  *(void *)(v3 + 8) = *(void *)(a2 + 8);
  __n128 result = *(__n128 *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(__n128 *)(v3 + 16) = result;
  *(_OWORD *)(v3 + 32) = v5;
  return result;
}

double assignWithCopy for PhotosDisplayRect(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_unknownObjectWeakCopyAssign();
  *(void *)(v3 + 8) = *(void *)(a2 + 8);
  *(void *)(v3 + 16) = *(void *)(a2 + 16);
  *(void *)(v3 + 24) = *(void *)(a2 + 24);
  *(void *)(v3 + 32) = *(void *)(a2 + 32);
  double result = *(double *)(a2 + 40);
  *(double *)(v3 + 40) = result;
  return result;
}

__n128 initializeWithTake for PhotosDisplayRect(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_unknownObjectWeakTakeInit();
  *(void *)(v3 + 8) = *(void *)(a2 + 8);
  __n128 result = *(__n128 *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(__n128 *)(v3 + 16) = result;
  *(_OWORD *)(v3 + 32) = v5;
  return result;
}

__n128 assignWithTake for PhotosDisplayRect(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_unknownObjectWeakTakeAssign();
  *(void *)(v3 + 8) = *(void *)(a2 + 8);
  __n128 result = *(__n128 *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(__n128 *)(v3 + 16) = result;
  *(_OWORD *)(v3 + 32) = v5;
  return result;
}

ValueMetadata *type metadata accessor for PhotosDisplayRect()
{
  return &type metadata for PhotosDisplayRect;
}

uint64_t sub_259D0F6F8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_259D0FA7C(a1), (v2 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

double sub_259D0F73C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_259D0FAC0(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_259CEA270(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t PhotosEnvironment.value<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 8))(&v4, a2, a3);
  swift_getAtKeyPath();
  return swift_bridgeObjectRelease();
}

uint64_t PhotosMutableEnvironment.setValues(_:)(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(a4 + 24))(v8, a3, a4);
  a1(v6);
  return v5(v8, 0);
}

void (*PhotosEnvironmentValues.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, char a2)
{
  uint64_t v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  v9[3] = v4;
  *uint64_t v9 = a2;
  v9[1] = a3;
  uint64_t v10 = OUTLINED_FUNCTION_1_9();
  uint64_t v9[4] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v9[5] = v11;
  size_t v12 = *(void *)(v11 + 64);
  v9[6] = malloc(v12);
  v9[7] = malloc(v12);
  OUTLINED_FUNCTION_2_5();
  PhotosEnvironmentValues.subscript.getter(v13, v14, v15);
  return sub_259D0F9A4;
}

void sub_259D0F9A4(uint64_t a1, char a2)
{
  char v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 48);
  uint64_t v4 = *(void **)(*(void *)a1 + 56);
  if (a2)
  {
    uint64_t v5 = v2[4];
    uint64_t v6 = v2[5];
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 48), v4, v5);
    PhotosEnvironmentValues.subscript.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    PhotosEnvironmentValues.subscript.setter(*(void *)(*(void *)a1 + 56));
  }
  free(v4);
  free(v3);

  free(v2);
}

unint64_t sub_259D0FA7C(uint64_t a1)
{
  uint64_t v2 = sub_259D62FB8();

  return sub_259D0FB04(a1, v2);
}

unint64_t sub_259D0FAC0(uint64_t a1)
{
  uint64_t v2 = sub_259D62BF8();

  return sub_259D0FBA0(a1, v2);
}

unint64_t sub_259D0FB04(uint64_t a1, uint64_t a2)
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

unint64_t sub_259D0FBA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_259D0FE48(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x25A2E9360](v9, a1);
      sub_259D0FEA4((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_259D0FC68(uint64_t a1, uint64_t a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_259D0FCE8(a1, a2);
  *uint64_t v2 = v6;

  return swift_bridgeObjectRelease();
}

unint64_t sub_259D0FCE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v6 = (void *)*v2;
  unint64_t v7 = sub_259D0FA7C(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v9 = v7;
  char v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECF28);
  if ((sub_259D62DA8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v11 = sub_259D0FA7C(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_11:
    unint64_t result = sub_259D62F58();
    __break(1u);
    return result;
  }
  unint64_t v9 = v11;
LABEL_5:
  uint64_t v13 = *v3;
  if (v10)
  {
    uint64_t v14 = v13[7];
    unint64_t result = swift_release();
    *(void *)(v14 + 8 * v9) = a1;
  }
  else
  {
    return sub_259D0FEF8(v9, a2, a1, v13);
  }
  return result;
}

uint64_t dispatch thunk of PhotosEnvironment.environmentValues.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PhotosMutableEnvironment.environmentValues.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of PhotosMutableEnvironment.environmentValues.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of static PhotosEnvironmentKey.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_259D0FE48(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_259D0FEA4(uint64_t a1)
{
  return a1;
}

unint64_t sub_259D0FEF8(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

uint64_t dispatch thunk of PhotosModel.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t static BasicBuilder.buildBlock()()
{
  return sub_259D627D8();
}

uint64_t static BasicBuilder.buildBlock(_:)()
{
  return sub_259D62738();
}

uint64_t static BasicBuilder.buildExpression(_:)(uint64_t a1, uint64_t a2)
{
  sub_259D10244(a2, a2);
  uint64_t v4 = *(void *)(a2 - 8);
  swift_allocObject();
  uint64_t v5 = sub_259D627A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  sub_259D62878();
  return v5;
}

uint64_t static BasicBuilder.buildArray(_:)()
{
  return sub_259D62898();
}

uint64_t static BasicBuilder.buildOptional(_:)(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = sub_259D627D8();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_259D10224@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_259D10244(uint64_t a1, uint64_t a2)
{
  if (dynamic_cast_existential_0_class_conditional(a2))
  {
    return __swift_instantiateConcreteTypeFromMangledName(qword_26A3EC208);
  }
  else
  {
    return MEMORY[0x270F9F4F8]();
  }
}

uint64_t sub_259D102A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

uint64_t type metadata accessor for BasicBuilder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t dynamic_cast_existential_0_class_conditional(uint64_t a1)
{
  if (swift_isClassType()) {
    return a1;
  }
  else {
    return 0;
  }
}

uint64_t PhotosWeakDictionary.subscript.getter(uint64_t a1, uint64_t a2)
{
  return sub_259D10504(a1, a2);
}

uint64_t sub_259D10330@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PhotosWeakDictionary();
  uint64_t result = PhotosWeakDictionary.subscript.getter(a1, v4);
  *a2 = result;
  return result;
}

uint64_t sub_259D10394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + a3 - 24);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v6 = (char *)&v12 - v5;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - v5, v8, v4);
  uint64_t v9 = type metadata accessor for PhotosWeakDictionary();
  uint64_t v10 = swift_unknownObjectRetain();
  return PhotosWeakDictionary.subscript.setter(v10, (uint64_t)v6, v9);
}

uint64_t PhotosWeakDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_259D105D0(a1, a2, a3);
  swift_unknownObjectRelease();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 8);

  return v5(a2);
}

uint64_t sub_259D10504(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = type metadata accessor for PhotosWeakObjectReference();
  MEMORY[0x25A2E8CD0](v10, a1, v5, v6, v7, *(void *)(a2 + 32));
  if (v11)
  {
    uint64_t v7 = sub_259D62B68();
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = MEMORY[0x25A2EAC90](v10);
  }
  (*(void (**)(void *, uint64_t))(*(void *)(v7 - 8) + 8))(v10, v7);
  return v8;
}

uint64_t sub_259D105D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    swift_unknownObjectRetain();
    sub_259D113A8(a3, v4);
    swift_unknownObjectRetain();
    PhotosWeakObjectReference.init(_:)((uint64_t)v9);
    type metadata accessor for PhotosWeakObjectReference();
    sub_259D62568();
    sub_259D62538();
    swift_unknownObjectRelease();
    uint64_t v5 = sub_259D62B68();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(*(void *)(v5 - 8) + 8))(v10, v5);
  }
  else
  {
    type metadata accessor for PhotosWeakObjectReference();
    sub_259D62568();
    sub_259D62528();
    uint64_t v7 = sub_259D62B68();
    (*(void (**)(unsigned char *, uint64_t))(*(void *)(v7 - 8) + 8))(v10, v7);
    return sub_259D113A8(a3, v8);
  }
}

void (*PhotosWeakDictionary.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  v7[3] = *(void *)(a3 + 16);
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  *(void *)(v10 + 32) = v8;
  size_t v12 = *(void *)(v11 + 64);
  v7[5] = malloc(v12);
  void v7[6] = malloc(v12);
  (*(void (**)(void))(v9 + 16))();
  *uint64_t v7 = PhotosWeakDictionary.subscript.getter(a2, a3);
  return sub_259D10824;
}

void sub_259D10824(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[5];
  uint64_t v4 = (void *)(*a1)[6];
  if (a2)
  {
    uint64_t v5 = v2[1];
    (*(void (**)(uint64_t, void *, uint64_t))(v2[4] + 32))((*a1)[5], v4, v2[3]);
    uint64_t v6 = swift_unknownObjectRetain();
    PhotosWeakDictionary.subscript.setter(v6, (uint64_t)v3, v5);
    swift_unknownObjectRelease();
  }
  else
  {
    PhotosWeakDictionary.subscript.setter(**a1, (uint64_t)v4, v2[1]);
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t PhotosWeakDictionary.objects(for:)()
{
  return sub_259D626E8();
}

uint64_t sub_259D10980@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PhotosWeakDictionary();
  uint64_t result = sub_259D10504(a1, v4);
  *a2 = result;
  return result;
}

uint64_t sub_259D109E8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_259D10980(a1, a2);
}

uint64_t PhotosWeakDictionary.singleObject.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = type metadata accessor for PhotosWeakObjectReference();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v39 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = MEMORY[0x270FA5388](v5, v6);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v13 = (char *)&v34 - v12;
  uint64_t v14 = *v1;
  uint64_t v15 = *(void *)(*v1 + 64);
  uint64_t v35 = *v1 + 64;
  uint64_t v16 = 1 << *(unsigned char *)(v14 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & v15;
  uint64_t v40 = v3 - 8;
  uint64_t v41 = v2 - 8;
  uint64_t v37 = v14;
  uint64_t v38 = (void (**)(char *, char *, uint64_t))(v11 + 32);
  int64_t v36 = (unint64_t)(v16 + 63) >> 6;
  int64_t v34 = v36 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v20 = 0;
  int64_t v21 = 0;
  if (!v18) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v22 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  int64_t v23 = v21;
  unint64_t v24 = v22 | (v21 << 6);
LABEL_5:
  uint64_t v25 = v37;
  (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(v9, *(void *)(v37 + 48) + *(void *)(*(void *)(v2 - 8) + 72) * v24, v2);
  (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(&v9[*(int *)(TupleTypeMetadata2 + 48)], *(void *)(v25 + 56) + 16 * v24, v3);
  for (uint64_t i = 0; ; uint64_t i = 1)
  {
    while (1)
    {
LABEL_12:
      __swift_storeEnumTagSinglePayload((uint64_t)v9, i, 1, TupleTypeMetadata2);
      (*v38)(v13, v9, v39);
      if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, TupleTypeMetadata2) == 1)
      {
        swift_release();
        return v20;
      }
      uint64_t v29 = *(void *)(v3 - 8);
      (*(void (**)(unsigned char *, char *, uint64_t))(v29 + 32))(v42, &v13[*(int *)(TupleTypeMetadata2 + 48)], v3);
      uint64_t v30 = MEMORY[0x25A2EAC90](v42);
      (*(void (**)(unsigned char *, uint64_t))(v29 + 8))(v42, v3);
      if (v30)
      {
        swift_unknownObjectRelease();
        if (v20)
        {
          swift_unknownObjectRelease();
          swift_release();
          OUTLINED_FUNCTION_15();
          v33();
          return 0;
        }
      }
      else
      {
        uint64_t v30 = v20;
      }
      OUTLINED_FUNCTION_15();
      uint64_t result = v31();
      uint64_t v20 = v30;
      int64_t v21 = v23;
      if (v18) {
        goto LABEL_4;
      }
LABEL_6:
      int64_t v27 = v21 + 1;
      if (__OFADD__(v21, 1))
      {
        __break(1u);
        goto LABEL_34;
      }
      if (v27 >= v36)
      {
        int64_t v23 = v21;
        goto LABEL_11;
      }
      unint64_t v28 = *(void *)(v35 + 8 * v27);
      if (v28) {
        goto LABEL_9;
      }
      int64_t v23 = v21 + 2;
      if (v21 + 2 < v36) {
        break;
      }
      unint64_t v18 = 0;
      uint64_t i = 1;
      int64_t v23 = v21 + 1;
    }
    unint64_t v28 = *(void *)(v35 + 8 * v23);
    if (v28)
    {
      int64_t v27 = v21 + 2;
LABEL_9:
      unint64_t v18 = (v28 - 1) & v28;
      unint64_t v24 = __clz(__rbit64(v28)) + (v27 << 6);
      int64_t v23 = v27;
      goto LABEL_5;
    }
    int64_t v32 = v21 + 3;
    if (v32 < v36) {
      break;
    }
LABEL_11:
    unint64_t v18 = 0;
  }
  unint64_t v28 = *(void *)(v35 + 8 * v32);
  if (v28)
  {
    int64_t v27 = v32;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v27 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v27 >= v36)
    {
      unint64_t v18 = 0;
      uint64_t i = 1;
      int64_t v23 = v34;
      goto LABEL_12;
    }
    unint64_t v28 = *(void *)(v35 + 8 * v27);
    ++v32;
    if (v28) {
      goto LABEL_9;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t PhotosWeakDictionary.removeObject(identicalTo:)(uint64_t a1, void *a2)
{
  uint64_t v37 = a1;
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  type metadata accessor for PhotosWeakObjectReference();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v33 = v8;
  uint64_t v34 = v7;
  MEMORY[0x270FA5388](v7, v9);
  uint64_t v11 = (char *)&v30 - v10;
  uint64_t v36 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14, v15);
  uint64_t v17 = (char *)&v30 - v16;
  OUTLINED_FUNCTION_0_0();
  uint64_t v35 = v18;
  MEMORY[0x270FA5388](v19, v20);
  uint64_t v31 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v32 = v2;
  uint64_t v22 = *v2;
  uint64_t v38 = v4;
  uint64_t v39 = v5;
  uint64_t v40 = a2[4];
  uint64_t v41 = v37;
  uint64_t v42 = v22;
  sub_259D62568();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_259D62728();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, TupleTypeMetadata2) == 1)
  {
    OUTLINED_FUNCTION_15();
    v23();
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v17, v36);
  }
  uint64_t v24 = v35;
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
  v25(v17, v11, v4);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v4);
  OUTLINED_FUNCTION_15();
  v26();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v4) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v17, v36);
  }
  unint64_t v28 = v31;
  v25(v31, v17, v4);
  sub_259D62528();
  sub_259D62B68();
  OUTLINED_FUNCTION_15();
  v29();
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v28, v4);
}

BOOL sub_259D111A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = a2;
  uint64_t v5 = type metadata accessor for PhotosWeakObjectReference();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v8 = MEMORY[0x270FA5388](TupleTypeMetadata2 - 8, v7);
  uint64_t v10 = (char *)&v18 - v9;
  uint64_t v11 = *(int *)(v8 + 56);
  uint64_t v12 = &v10[v11];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = *(void *)(a3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v10, a1, a3);
  uint64_t v15 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v12, v13, v5);
  uint64_t v16 = MEMORY[0x25A2EAC90](v12);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v5);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v10, a3);
  if (!v16) {
    return 0;
  }
  swift_unknownObjectRelease();
  return v16 == v19;
}

BOOL sub_259D1135C(uint64_t a1)
{
  return sub_259D111A4(a1, *(void *)(v1 + 40), *(void *)(v1 + 16));
}

uint64_t sub_259D11388()
{
  return 24;
}

__n128 sub_259D11394(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_259D113A8(uint64_t a1, uint64_t a2)
{
  uint64_t v48 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(v48 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = v4;
  uint64_t v7 = type metadata accessor for PhotosWeakObjectReference();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v47 = sub_259D62B68();
  uint64_t v10 = MEMORY[0x270FA5388](v47, v9);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v13);
  uint64_t v16 = (char *)&v37 - v15;
  uint64_t v17 = *v2;
  uint64_t v18 = *(void *)(*v2 + 64);
  uint64_t v38 = *v2 + 64;
  uint64_t v19 = 1 << *(unsigned char *)(v17 + 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & v18;
  uint64_t v41 = v3 + 16;
  uint64_t v42 = v3;
  uint64_t v49 = v7 - 8;
  uint64_t v45 = (void (**)(char *, char *, uint64_t))(v3 + 32);
  uint64_t v46 = (void (**)(char *, char *, uint64_t))(v14 + 32);
  uint64_t v43 = v17;
  double v44 = (uint64_t (**)(char *, uint64_t))(v3 + 8);
  int64_t v40 = (unint64_t)(v19 + 63) >> 6;
  int64_t v37 = v40 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v23 = 0;
  uint64_t v24 = v48;
  if (!v21) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v25 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  int64_t v50 = v23;
  unint64_t v26 = v25 | (v23 << 6);
LABEL_5:
  uint64_t v27 = v43;
  (*(void (**)(char *, unint64_t, uint64_t))(v42 + 16))(v12, *(void *)(v43 + 48) + *(void *)(v42 + 72) * v26, v48);
  (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(&v12[*(int *)(TupleTypeMetadata2 + 48)], *(void *)(v27 + 56) + 16 * v26, v7);
  for (uint64_t i = 0; ; uint64_t i = 1)
  {
    while (1)
    {
      __swift_storeEnumTagSinglePayload((uint64_t)v12, i, 1, TupleTypeMetadata2);
      (*v46)(v16, v12, v47);
      if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, TupleTypeMetadata2) == 1) {
        return swift_release();
      }
      uint64_t v31 = &v16[*(int *)(TupleTypeMetadata2 + 48)];
      (*v45)(v6, v16, v24);
      uint64_t v32 = *(void *)(v7 - 8);
      (*(void (**)(unsigned char *, char *, uint64_t))(v32 + 32))(v52, v31, v7);
      uint64_t v33 = MEMORY[0x25A2EAC90](v52);
      swift_unknownObjectRelease();
      if (!v33)
      {
        sub_259D62568();
        sub_259D62528();
        uint64_t v34 = sub_259D62B68();
        (*(void (**)(char *, uint64_t))(*(void *)(v34 - 8) + 8))(v51, v34);
      }
      (*(void (**)(unsigned char *, uint64_t))(v32 + 8))(v52, v7);
      uint64_t result = (*v44)(v6, v24);
      int64_t v23 = v50;
      if (v21) {
        goto LABEL_4;
      }
LABEL_6:
      int64_t v29 = v23 + 1;
      if (__OFADD__(v23, 1))
      {
        __break(1u);
        goto LABEL_33;
      }
      if (v29 >= v40)
      {
        int64_t v50 = v23;
        goto LABEL_11;
      }
      unint64_t v30 = *(void *)(v38 + 8 * v29);
      if (v30) {
        goto LABEL_9;
      }
      int64_t v35 = v23 + 2;
      if (v23 + 2 < v40) {
        break;
      }
      unint64_t v21 = 0;
      uint64_t i = 1;
LABEL_21:
      int64_t v50 = v29;
    }
    unint64_t v30 = *(void *)(v38 + 8 * v35);
    if (v30)
    {
      int64_t v29 = v23 + 2;
LABEL_9:
      unint64_t v21 = (v30 - 1) & v30;
      unint64_t v26 = __clz(__rbit64(v30)) + (v29 << 6);
      int64_t v50 = v29;
      goto LABEL_5;
    }
    int64_t v36 = v23 + 3;
    if (v36 < v40) {
      break;
    }
    int64_t v50 = v35;
LABEL_11:
    unint64_t v21 = 0;
  }
  unint64_t v30 = *(void *)(v38 + 8 * v36);
  if (v30)
  {
    int64_t v29 = v36;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v29 = v36 + 1;
    if (__OFADD__(v36, 1)) {
      break;
    }
    if (v29 >= v40)
    {
      unint64_t v21 = 0;
      uint64_t i = 1;
      int64_t v29 = v37;
      goto LABEL_21;
    }
    unint64_t v30 = *(void *)(v38 + 8 * v29);
    ++v36;
    if (v30) {
      goto LABEL_9;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t UIAction.init(menuAction:)(void *a1)
{
  if (!objc_msgSend(a1, sel_image))
  {
    id v2 = objc_msgSend(a1, sel_systemImageName);
    if (v2)
    {
      sub_259D62648();

      sub_259D11B6C();
      sub_259D119F8();
    }
  }
  id v3 = objc_msgSend(a1, sel_title);
  sub_259D62648();

  objc_msgSend(a1, sel_role);
  sub_259D11A5C((unint64_t)objc_msgSend(a1, sel_state));
  *(void *)(swift_allocObject() + 16) = a1;
  return sub_259D62B58();
}

id sub_259D119F8()
{
  uint64_t v0 = (void *)sub_259D62638();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_systemImageNamed_, v0);

  return v1;
}

unint64_t sub_259D11A5C(unint64_t result)
{
  if (result >= 3)
  {
    uint64_t v6 = v2;
    uint64_t v7 = v1;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    sub_259D62C48();
    swift_bridgeObjectRelease();
    strcpy(v5, "unknown state ");
    v5[15] = -18;
    type metadata accessor for PXMenuActionState(0);
    sub_259D62668();
    sub_259D62688();
    swift_bridgeObjectRelease();
    uint64_t result = sub_259D62DD8();
    __break(1u);
  }
  return result;
}

uint64_t sub_259D11B24()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_259D11B5C()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_performAction);
}

unint64_t sub_259D11B6C()
{
  unint64_t result = qword_26A3ED460;
  if (!qword_26A3ED460)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3ED460);
  }
  return result;
}

uint64_t sub_259D11BB0()
{
  uint64_t v0 = swift_unknownObjectRetain();
  return sub_259D11BDC(v0);
}

uint64_t sub_259D11BDC(uint64_t a1)
{
  uint64_t v3 = _s18PhotosUIFoundation0A22GenericItemListManagerC04itemE0xvg_0();
  swift_unknownObjectRelease();
  if (v3 != a1)
  {
    swift_unknownObjectRetain();
    sub_259D11CC4();
    objc_msgSend(*(id *)(v1 + 48), sel_signalChange_, 1);
  }

  return swift_unknownObjectRelease();
}

uint64_t _s18PhotosUIFoundation0A22GenericItemListManagerC04itemE0xvg_0()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_259D11CC4()
{
  return swift_unknownObjectRelease();
}

uint64_t PhotosGenericItemListManager.changeDetailsRepository.getter()
{
  return swift_retain();
}

uint64_t PhotosGenericItemListManager.__allocating_init(itemList:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  PhotosGenericItemListManager.init(itemList:)(a1);
  return v2;
}

void *PhotosGenericItemListManager.init(itemList:)(uint64_t a1)
{
  type metadata accessor for PhotosItemListChangeDetailsRepository();
  swift_allocObject();
  uint64_t v3 = PhotosItemListChangeDetailsRepository.init(countLimit:)(100);
  v1[3] = 0;
  void v1[4] = 0;
  v1[2] = v3;
  v1[6] = objc_msgSend(objc_allocWithZone((Class)PXObservable), sel_init);
  sub_259D623F8();
  v1[5] = a1;
  return v1;
}

uint64_t sub_259D11E44@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v5 = *(void *)(v3 + 32);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_259D129D8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_259D12654(v4);
}

uint64_t sub_259D11ED8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_259D129D0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *a2;
  swift_beginAccess();
  uint64_t v8 = *(void *)(v7 + 24);
  *(void *)(v7 + 24) = v6;
  *(void *)(v7 + 32) = v5;
  sub_259D12654(v3);
  return sub_259CE6788(v8);
}

uint64_t PhotosGenericItemListManager.waitForItemListHandler.getter()
{
  OUTLINED_FUNCTION_3_4();
  uint64_t v1 = *(void *)(v0 + 24);
  sub_259D12654(v1);
  return v1;
}

uint64_t PhotosGenericItemListManager.waitForItemListHandler.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 24);
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return sub_259CE6788(v5);
}

uint64_t (*PhotosGenericItemListManager.waitForItemListHandler.modify())()
{
  return j__swift_endAccess;
}

Swift::Bool __swiftcall PhotosGenericItemListManager.waitForItemList(timeout:)(Swift::Double timeout)
{
  OUTLINED_FUNCTION_3_4();
  uint64_t v3 = *(uint64_t (**)(uint64_t, double))(v1 + 24);
  if (v3)
  {
    uint64_t v4 = swift_retain();
    char v5 = v3(v4, timeout);
    sub_259CE6788((uint64_t)v3);
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_259D120FC()
{
  return sub_259D11CC4();
}

uint64_t sub_259D12128()
{
  return sub_259D623E8();
}

uint64_t sub_259D1219C(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = a2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_259D121D8()
{
  return sub_259D623D8();
}

uint64_t PhotosGenericItemListManager.createMutator()()
{
  type metadata accessor for PhotosGenericItemListManager.Mutator();
  uint64_t v1 = sub_259CEA7D8(v0);
  swift_retain();
  return v1;
}

uint64_t sub_259D1231C()
{
  uint64_t v0 = swift_unknownObjectRetain();
  return sub_259D1236C(v0);
}

uint64_t sub_259D12348()
{
  return _s18PhotosUIFoundation0A22GenericItemListManagerC04itemE0xvg_0();
}

uint64_t sub_259D1236C(uint64_t a1)
{
  return sub_259D11BDC(a1);
}

uint64_t (*sub_259D12390(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = sub_259D12348();
  return sub_259D123D8;
}

uint64_t sub_259D123D8(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return sub_259D1236C(*a1);
  }
  uint64_t v2 = swift_unknownObjectRetain();
  sub_259D1236C(v2);

  return swift_unknownObjectRelease();
}

uint64_t sub_259D12430()
{
  swift_retain();
  sub_259CEF8F4();
  swift_release();
  uint64_t v0 = swift_unknownObjectRetain();
  return sub_259D11BDC(v0);
}

uint64_t PhotosGenericItemListManager.Mutator.deinit()
{
  swift_release();
  return v0;
}

uint64_t PhotosGenericItemListManager.Mutator.__deallocating_deinit()
{
  PhotosGenericItemListManager.Mutator.deinit();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_259D124E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosGenericItemListManager.changeDetailsRepository.getter();
  *a1 = result;
  return result;
}

id PhotosGenericItemListManager.observable.getter()
{
  return *(id *)(v0 + 48);
}

uint64_t PhotosGenericItemListManager.deinit()
{
  swift_release();
  sub_259CE6788(*(void *)(v0 + 24));
  swift_unknownObjectRelease();

  uint64_t v1 = v0 + qword_26A3EC290;
  uint64_t v2 = sub_259D62408();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t PhotosGenericItemListManager.__deallocating_deinit()
{
  PhotosGenericItemListManager.deinit();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_259D125CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosGenericItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

uint64_t sub_259D125FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosGenericItemListManager.createMutator()();
  *a1 = result;
  return result;
}

id sub_259D12628@<X0>(void *a1@<X8>)
{
  id result = PhotosGenericItemListManager.observable.getter();
  *a1 = result;
  return result;
}

uint64_t sub_259D12654(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t type metadata accessor for PhotosGenericItemListManager.Mutator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_259D1267C(uint64_t a1)
{
  return sub_259CE0B84(a1);
}

uint64_t sub_259D126A8(uint64_t a1)
{
  return sub_259CE0B84(a1);
}

uint64_t sub_259D126D4(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_259D12710@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosGenericItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

uint64_t sub_259D12758@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_259D12348();
  *a1 = result;
  return result;
}

uint64_t sub_259D12788()
{
  return 24;
}

__n128 sub_259D12794(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_259D127A8()
{
  uint64_t result = sub_259D62408();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for PhotosGenericItemListManager()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for PhotosGenericItemListManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosGenericItemListManager);
}

uint64_t dispatch thunk of PhotosGenericItemListManager.__allocating_init(itemList:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_259D128AC()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for PhotosGenericItemListManager.Mutator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosGenericItemListManager.Mutator);
}

uint64_t dispatch thunk of PhotosGenericItemListManager.Mutator.itemList.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of PhotosGenericItemListManager.Mutator.itemList.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of PhotosGenericItemListManager.Mutator.itemList.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of PhotosGenericItemListManager.Mutator.setItemList(_:changeDetails:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t sub_259D12998()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_259D129D0(double a1)
{
  return sub_259D17A3C(*(void (**)(unsigned __int8 *__return_ptr, double *))(v1 + 16), a1);
}

uint64_t sub_259D129D8@<X0>(double *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_259D17A04(a1, *(uint64_t (**)(double))(v2 + 16), a2);
}

uint64_t sub_259D129E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s18PhotosUIFoundation0A22GenericItemListManagerC04itemE0xvg_0();
  *a1 = result;
  return result;
}

uint64_t sub_259D12A18()
{
  return sub_259D1219C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

double static UIEdgeInsets.+ infix(_:_:)(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a5;
}

double static UIEdgeInsets.- infix(_:_:)(double a1, double a2, double a3, double a4, double a5)
{
  return PXEdgeInsetsInvert(a5) + a1;
}

uint64_t PhotosItemListChangeDetails.toItemListVersion.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t PhotosItemListChangeDetails.description.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_259D62C48();
  sub_259D62688();
  sub_259D62E98();
  sub_259D62688();
  swift_bridgeObjectRelease();
  sub_259D62688();
  sub_259D62E98();
  sub_259D62688();
  swift_bridgeObjectRelease();
  sub_259D62688();
  id v2 = v1;
  id v3 = objc_msgSend(v2, sel_description);
  sub_259D62648();

  sub_259D62688();
  swift_bridgeObjectRelease();
  sub_259D62688();
  return 0;
}

uint64_t PhotosItemListChangeDetails.assertValidIncrementalChanges<A>(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(a4 + 48);
  v9(a3, a4);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  uint64_t v6 = sub_259D62878();
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x25A2E8E50](&v11, v6, WitnessTable);
  swift_bridgeObjectRelease();
  void v10[2] = v11;
  sub_259D62E38();
  swift_getWitnessTable();
  sub_259D62748();
  swift_bridgeObjectRelease();
  v9(a3, a4);
  MEMORY[0x25A2E8E50](v10, v6, WitnessTable);
  swift_bridgeObjectRelease();
  sub_259D62748();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259D12EBC(uint64_t a1, uint64_t a2)
{
  return sub_259D130B4(a1, a2, (SEL *)&selRef_indexAfterApplyingChangesToIndex_);
}

uint64_t sub_259D12EC8(char *a1, uint64_t (*a2)(uint64_t, char *))
{
  uint64_t v4 = *(void *)a1;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(v4, &a1[*(int *)(TupleTypeMetadata2 + 48)]);
}

uint64_t sub_259D12FC0(char *a1)
{
  return sub_259D12EC8(a1, *(uint64_t (**)(uint64_t, char *))(v1 + 32));
}

uint64_t sub_259D12FE0(uint64_t a1, uint64_t a2, int a3, int a4, id a5, int a6, uint64_t a7, uint64_t a8, SEL *a9)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    if (((unint64_t)objc_msgSend(a5, *a9, a1) & 0x8000000000000000) == 0)
    {
      sub_259D622A8();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a8 + 72))(a2, a7, a8);
    }
    __break(1u);
  }
  uint64_t result = sub_259D62DC8();
  __break(1u);
  return result;
}

uint64_t sub_259D130A8(uint64_t a1, uint64_t a2)
{
  return sub_259D130B4(a1, a2, (SEL *)&selRef_indexAfterRevertingChangesFromIndex_);
}

uint64_t sub_259D130B4(uint64_t a1, uint64_t a2, SEL *a3)
{
  return sub_259D12FE0(a1, a2, *(void *)(v3 + 32), *(void *)(v3 + 40), *(id *)(v3 + 48), *(void *)(v3 + 56), *(void *)(v3 + 16), *(void *)(v3 + 24), a3);
}

uint64_t static PhotosItemListChangeDetails.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 != *a2 || a1[1] != a2[1]) {
    return 0;
  }
  uint64_t v4 = (void *)a2[2];
  char v5 = (void *)a1[2];
  id v6 = v5;
  id v7 = v4;
  if (v5 == v4) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v6 isEqual:v7];
  }

  return v3;
}

uint64_t sub_259D1316C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = MEMORY[0x270FA5388](v6, v9);
  uint64_t v12 = &v16[-v11];
  sub_259CEA270(v10, (uint64_t)v16);
  swift_dynamicCast();
  sub_259CEA270(a2, (uint64_t)v16);
  swift_dynamicCast();
  if (sub_259D625D8()) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = sub_259D625C8() & 1;
  }
  uint64_t v14 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v14(v8, a3);
  v14(v12, a3);
  return v13;
}

uint64_t sub_259D132F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(void *, void *))(a1 + 32);
  v9[3] = swift_getObjectType();
  v9[0] = a2;
  v8[3] = swift_getObjectType();
  v8[0] = a3;
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v6 = v5(v9, v8);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

void *assignWithCopy for PhotosItemListChangeDetails(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v3 = (void *)a2[2];
  uint64_t v4 = (void *)a1[2];
  a1[2] = v3;
  id v5 = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosItemListChangeDetails(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosItemListChangeDetails(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_259D1346C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_259D1347C(uint64_t a1, uint64_t a2)
{
  return sub_259D1316C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_259D13484(char *a1)
{
  return sub_259D12FC0(a1);
}

void lerp<A>(_:_:mix:)()
{
  OUTLINED_FUNCTION_5_2();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v0, v1);
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4, v5);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x270FA5388](v6, v7);
  OUTLINED_FUNCTION_18_0();
  MEMORY[0x270FA5388](v8, v9);
  OUTLINED_FUNCTION_17_0();
  swift_getAssociatedConformanceWitness();
  sub_259D62F18();
  OUTLINED_FUNCTION_19_0();
  sub_259D62EC8();
  sub_259D62DF8();
  uint64_t v10 = *(void (**)(void))(v3 + 8);
  OUTLINED_FUNCTION_6_3();
  v10();
  sub_259D62988();
  OUTLINED_FUNCTION_6_3();
  v10();
  sub_259D62988();
  sub_259D62DE8();
  OUTLINED_FUNCTION_6_3();
  v10();
  OUTLINED_FUNCTION_6_3();
  v10();
  OUTLINED_FUNCTION_4_2();
}

uint64_t FloatingPoint.isEqual(to:tolerance:)()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = v0;
  uint64_t v4 = MEMORY[0x270FA5388](v2, v3);
  MEMORY[0x270FA5388](v4, v5);
  sub_259D62DF8();
  sub_259D62F28();
  uint64_t v6 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_23_0();
  v6();
  char v7 = sub_259D625F8();
  OUTLINED_FUNCTION_23_0();
  v6();
  return v7 & 1;
}

uint64_t BinaryFloatingPoint.px_easeIn.getter(uint64_t a1)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5, v6);
  OUTLINED_FUNCTION_1_5();
  uint64_t v9 = v8 - v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v8 - v7, v1, a1);
  sub_259D62988();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v9, a1);
}

void BinaryFloatingPoint.px_easeOut.getter()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v2 = v1;
  v16[1] = v3;
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v4, v5);
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8, v9);
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_18_0();
  uint64_t v12 = MEMORY[0x270FA5388](v10, v11);
  MEMORY[0x270FA5388](v12, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v16 - v14, v0, v2);
  swift_getAssociatedConformanceWitness();
  sub_259D62F18();
  OUTLINED_FUNCTION_22_0();
  sub_259D62EC8();
  sub_259D62DF8();
  uint64_t v15 = *(void (**)(void))(v7 + 8);
  OUTLINED_FUNCTION_16();
  v15();
  sub_259D62988();
  OUTLINED_FUNCTION_16();
  v15();
  OUTLINED_FUNCTION_16();
  v15();
  OUTLINED_FUNCTION_4_2();
}

void BinaryFloatingPoint.px_easeInEaseOut.getter()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v3 = v2;
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v4, v5);
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v6, v7);
  OUTLINED_FUNCTION_14_0();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v8, v9);
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12, v13);
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v14, v15);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v16, v17);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v18, v19);
  OUTLINED_FUNCTION_15_0();
  uint64_t v27 = v20;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v21, v22);
  OUTLINED_FUNCTION_18_0();
  MEMORY[0x270FA5388](v23, v24);
  OUTLINED_FUNCTION_17_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v1, v0, v3);
  swift_getAssociatedConformanceWitness();
  sub_259D62F08();
  OUTLINED_FUNCTION_22_0();
  sub_259D62EB8();
  char v25 = sub_259D625D8();
  unint64_t v26 = *(void (**)(void))(v11 + 8);
  OUTLINED_FUNCTION_4_4();
  v26();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_21_0();
  sub_259D62F18();
  OUTLINED_FUNCTION_19_0();
  sub_259D62EC8();
  if (v25)
  {
    sub_259D62988();
    OUTLINED_FUNCTION_4_4();
    v26();
    sub_259D62988();
  }
  else
  {
    OUTLINED_FUNCTION_21_0();
    sub_259D62F18();
    OUTLINED_FUNCTION_20_0();
    sub_259D62EC8();
    sub_259D62988();
    OUTLINED_FUNCTION_4_4();
    v26();
    sub_259D62DF8();
    OUTLINED_FUNCTION_4_4();
    v26();
    OUTLINED_FUNCTION_4_4();
    v26();
    sub_259D62988();
    OUTLINED_FUNCTION_4_4();
    v26();
    OUTLINED_FUNCTION_21_0();
    sub_259D62F18();
    OUTLINED_FUNCTION_20_0();
    sub_259D62EC8();
    sub_259D62DF8();
    ((void (*)(uint64_t, uint64_t))v26)(v27, v3);
  }
  OUTLINED_FUNCTION_4_4();
  v26();
  OUTLINED_FUNCTION_4_4();
  v26();
  OUTLINED_FUNCTION_4_2();
}

void BinaryFloatingPoint.px_saturate.getter()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v1 = v0;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v2, v3);
  OUTLINED_FUNCTION_1_11();
  uint64_t v35 = v4;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v5, v6);
  OUTLINED_FUNCTION_14_0();
  uint64_t v33 = v7;
  OUTLINED_FUNCTION_0_0();
  unint64_t v30 = v8;
  MEMORY[0x270FA5388](v9, v10);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x270FA5388](v11, v12);
  OUTLINED_FUNCTION_17_0();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v13, v14);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x270FA5388](v15, v16);
  uint64_t v34 = sub_259D62608();
  OUTLINED_FUNCTION_0_0();
  uint64_t v32 = v17;
  MEMORY[0x270FA5388](v18, v19);
  OUTLINED_FUNCTION_1_11();
  uint64_t v29 = v20;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v21, v22);
  OUTLINED_FUNCTION_14_0();
  uint64_t v31 = v23;
  swift_getAssociatedConformanceWitness();
  sub_259D62F18();
  sub_259D62EC8();
  sub_259D62F18();
  sub_259D62EC8();
  if (sub_259D625F8())
  {
    uint64_t v24 = v33 + *(int *)(TupleTypeMetadata2 + 48);
    char v25 = (void (*)(void))v30[4];
    OUTLINED_FUNCTION_2_7();
    v25();
    OUTLINED_FUNCTION_2_7();
    v25();
    uint64_t v26 = v35 + *(int *)(TupleTypeMetadata2 + 48);
    uint64_t v27 = (void (*)(uint64_t, uint64_t, uint64_t))v30[2];
    v27(v35, v33, v1);
    v27(v26, v24, v1);
    OUTLINED_FUNCTION_2_7();
    v25();
    unint64_t v28 = (void (*)(uint64_t, uint64_t))v30[1];
    v28(v26, v1);
    OUTLINED_FUNCTION_2_7();
    v25();
    OUTLINED_FUNCTION_2_7();
    v25();
    OUTLINED_FUNCTION_2_7();
    v25();
    v28(v35, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v31, v29, v34);
    Comparable.clamped(to:)();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v34);
    OUTLINED_FUNCTION_4_2();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_259D1430C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_259D622F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_259D14D00();
  char v11 = sub_259D625E8();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  if (v11) {
    uint64_t v13 = a1;
  }
  else {
    uint64_t v13 = v3;
  }
  v12(v10, v13, v6);
  uint64_t v14 = (char *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED558) + 36));
  if (sub_259D625D8())
  {
    uint64_t v15 = a2;
    uint64_t v16 = v14;
  }
  else
  {
    uint64_t v15 = a2;
    uint64_t v16 = v10;
  }
  v12(v15, (uint64_t)v16, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

void Date.limitedToMinMax()()
{
  OUTLINED_FUNCTION_5_2();
  uint64_t v100 = v1;
  uint64_t v101 = v0;
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED550);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v2, v3);
  OUTLINED_FUNCTION_1_11();
  uint64_t v99 = v4;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v5, v6);
  OUTLINED_FUNCTION_14_0();
  uint64_t v95 = v7;
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED558);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v8, v9);
  OUTLINED_FUNCTION_1_11();
  uint64_t v97 = v10;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v11, v12);
  OUTLINED_FUNCTION_14_0();
  uint64_t v98 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED560);
  MEMORY[0x270FA5388](v14 - 8, v15);
  OUTLINED_FUNCTION_2_0();
  uint64_t v106 = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED568);
  MEMORY[0x270FA5388](v17 - 8, v18);
  OUTLINED_FUNCTION_2_0();
  uint64_t v105 = v19;
  uint64_t v94 = sub_259D622D8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v93 = v20;
  MEMORY[0x270FA5388](v21, v22);
  OUTLINED_FUNCTION_2_0();
  uint64_t v112 = v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED570);
  MEMORY[0x270FA5388](v24 - 8, v25);
  OUTLINED_FUNCTION_1_11();
  uint64_t v107 = v26;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v27, v28);
  OUTLINED_FUNCTION_14_0();
  uint64_t v103 = v29;
  uint64_t v30 = sub_259D62358();
  OUTLINED_FUNCTION_0_0();
  uint64_t v32 = v31;
  MEMORY[0x270FA5388](v33, v34);
  OUTLINED_FUNCTION_1_5();
  uint64_t v37 = v36 - v35;
  uint64_t v117 = sub_259D62378();
  OUTLINED_FUNCTION_0_0();
  uint64_t v39 = v38;
  MEMORY[0x270FA5388](v40, v41);
  OUTLINED_FUNCTION_1_5();
  uint64_t v44 = v43 - v42;
  uint64_t v118 = sub_259D622F8();
  OUTLINED_FUNCTION_0_0();
  uint64_t v115 = v45;
  MEMORY[0x270FA5388](v46, v47);
  OUTLINED_FUNCTION_1_11();
  uint64_t v104 = v48;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v49, v50);
  OUTLINED_FUNCTION_15_0();
  uint64_t v110 = v51;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v52, v53);
  OUTLINED_FUNCTION_15_0();
  uint64_t v102 = v54;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v55, v56);
  OUTLINED_FUNCTION_15_0();
  uint64_t v111 = v57;
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x270FA5388](v58, v59);
  uint64_t v61 = (char *)&v92 - v60;
  sub_259D622E8();
  sub_259D62348();
  uint64_t v62 = *MEMORY[0x263F078A0];
  uint64_t v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 104);
  v63(v37, v62, v30);
  id v116 = v61;
  uint64_t v64 = sub_259D62368();
  uint64_t v65 = *(void (**)(void))(v32 + 8);
  uint64_t v108 = (void (*)(void))(v32 + 8);
  OUTLINED_FUNCTION_23_0();
  v65();
  uint64_t v113 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
  uint64_t v114 = v39 + 8;
  v113(v44, v117);
  sub_259D62348();
  v63(v37, v62, v30);
  if (__OFSUB__(0, v64))
  {
    __break(1u);
    goto LABEL_12;
  }
  if (__OFADD__(-v64, 1))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v66 = v103;
  sub_259D62338();
  OUTLINED_FUNCTION_24_0();
  v65();
  OUTLINED_FUNCTION_24_0();
  v67();
  uint64_t v68 = *(void (**)(void))(v115 + 16);
  uint64_t v69 = v102;
  uint64_t v70 = v118;
  OUTLINED_FUNCTION_11_0();
  v68();
  if (__swift_getEnumTagSinglePayload(v66, 1, v70) == 1)
  {
    uint64_t v71 = OUTLINED_FUNCTION_25_0();
    uint64_t v108 = v72;
    ((void (*)(uint64_t, uint64_t, uint64_t))v72)(v71, v69, v118);
    sub_259D14DB8(v66, &qword_26A3ED570);
  }
  else
  {
    uint64_t v73 = v118;
    OUTLINED_FUNCTION_24_0();
    v74();
    uint64_t v75 = OUTLINED_FUNCTION_25_0();
    uint64_t v108 = v76;
    ((void (*)(uint64_t, uint64_t, uint64_t))v76)(v75, v66, v73);
  }
  uint64_t v77 = v107;
  __swift_storeEnumTagSinglePayload(v105, 1, 1, v117);
  uint64_t v78 = sub_259D623B8();
  __swift_storeEnumTagSinglePayload(v106, 1, 1, v78);
  sub_259D622C8();
  sub_259D622B8();
  sub_259D62348();
  sub_259D62328();
  OUTLINED_FUNCTION_24_0();
  v79();
  uint64_t v80 = v104;
  uint64_t v81 = v118;
  ((void (*)(uint64_t, char *, uint64_t))v68)(v104, v116, v118);
  if (__swift_getEnumTagSinglePayload(v77, 1, v81) == 1)
  {
    uint64_t v82 = v115;
    ((void (*)(uint64_t, uint64_t, uint64_t))v108)(v110, v80, v118);
    sub_259D14DB8(v77, &qword_26A3ED570);
  }
  else
  {
    uint64_t v82 = v115;
    uint64_t v83 = v80;
    uint64_t v84 = v118;
    (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v83, v118);
    ((void (*)(uint64_t, uint64_t, uint64_t))v108)(v110, v77, v84);
  }
  sub_259D14D00();
  if (sub_259D625F8())
  {
    uint64_t v85 = v95 + *(int *)(v109 + 48);
    uint64_t v86 = v118;
    OUTLINED_FUNCTION_11_0();
    v68();
    uint64_t v87 = v85;
    uint64_t v117 = v85;
    char v88 = v108;
    ((void (*)(uint64_t, uint64_t, uint64_t))v108)(v87, v110, v86);
    OUTLINED_FUNCTION_11_0();
    v68();
    OUTLINED_FUNCTION_11_0();
    v68();
    uint64_t v89 = v97;
    OUTLINED_FUNCTION_2_7();
    v88();
    uint64_t v90 = *(void (**)(void))(v82 + 8);
    OUTLINED_FUNCTION_7_2();
    v90();
    OUTLINED_FUNCTION_2_7();
    v88();
    OUTLINED_FUNCTION_2_7();
    v88();
    OUTLINED_FUNCTION_2_7();
    v88();
    OUTLINED_FUNCTION_7_2();
    v90();
    uint64_t v91 = v98;
    sub_259D14D50(v89, v98);
    sub_259D1430C(v91, v100);
    sub_259D14DB8(v91, &qword_26A3ED558);
    (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v112, v94);
    OUTLINED_FUNCTION_7_2();
    v90();
    OUTLINED_FUNCTION_7_2();
    v90();
    OUTLINED_FUNCTION_4_2();
    return;
  }
LABEL_13:
  __break(1u);
}

unint64_t sub_259D14D00()
{
  unint64_t result = qword_26A3ED578;
  if (!qword_26A3ED578)
  {
    sub_259D622F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED578);
  }
  return result;
}

uint64_t sub_259D14D50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_259D14DB8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return v0;
}

uint64_t dispatch thunk of PhotosCollectionAssetCountModel.assetCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t Array<A>.duplicatedElements.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v10, v11);
  uint64_t v41 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12, v13);
  uint64_t v16 = (char *)&v34 - v15;
  uint64_t v18 = MEMORY[0x270FA5388](v14, v17);
  uint64_t v20 = (char *)&v34 - v19;
  MEMORY[0x270FA5388](v18, v21);
  uint64_t v23 = (char *)&v34 - v22;
  uint64_t v45 = sub_259D624F8();
  uint64_t v39 = a3;
  uint64_t v24 = sub_259D624F8();
  uint64_t v44 = v24;
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_259D62788();
  uint64_t v43 = v25;
  if (v25 != MEMORY[0x25A2E8FA0](a1, a2))
  {
    uint64_t v34 = v9;
    uint64_t v35 = a1;
    uint64_t v36 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    uint64_t v37 = v7;
    uint64_t v26 = (void (**)(void))(v7 + 8);
    uint64_t v38 = (void (**)(char *, uint64_t *, uint64_t))(v7 + 16);
    unint64_t v40 = (v7 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      char v27 = sub_259D627F8();
      sub_259D627B8();
      if (v27)
      {
        unint64_t v28 = a1
            + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))
            + *(void *)(v7 + 72) * v25;
        uint64_t v29 = *(void (**)(char *, uint64_t *, uint64_t))(v7 + 16);
        v29(v23, (uint64_t *)v28, a2);
      }
      else
      {
        uint64_t result = sub_259D62C88();
        if (v34 != 8)
        {
          __break(1u);
          return result;
        }
        uint64_t v42 = result;
        uint64_t v29 = *v38;
        (*v38)(v23, &v42, a2);
        swift_unknownObjectRelease();
      }
      swift_bridgeObjectRetain();
      MEMORY[0x25A2E8FC0](&v43, a1, a2);
      swift_bridgeObjectRelease();
      (*v36)(v20, v23, a2);
      v29(v41, (uint64_t *)v20, a2);
      sub_259D62968();
      char v30 = sub_259D62918();
      uint64_t v31 = *v26;
      OUTLINED_FUNCTION_16();
      v31();
      if ((v30 & 1) == 0)
      {
        v29(v41, (uint64_t *)v20, a2);
        a1 = v35;
        sub_259D62918();
        ((void (*)(char *, uint64_t))v31)(v16, a2);
      }
      OUTLINED_FUNCTION_16();
      v31();
      uint64_t v25 = v43;
      uint64_t v32 = MEMORY[0x25A2E8FA0](a1, a2);
      uint64_t v7 = v37;
      if (v25 == v32)
      {
        swift_bridgeObjectRelease();
        uint64_t v24 = v44;
        goto LABEL_12;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_12:
  swift_bridgeObjectRelease();
  uint64_t v43 = v24;
  sub_259D62968();
  swift_getWitnessTable();
  return sub_259D62898();
}

uint64_t Array.randomized()(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  uint64_t v8 = MEMORY[0x270FA5388](v6, v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v8, v11);
  uint64_t v14 = (char *)v19 - v13;
  uint64_t v24 = v12;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_259D624E8();
  sub_259D62878();
  uint64_t v15 = MEMORY[0x263F8D708];
  while (1)
  {
    *(void *)&long long v20 = a1;
    swift_getWitnessTable();
    sub_259D629C8();
    long long v20 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED228);
    unint64_t v16 = sub_259D04704();
    v19[0] = v15;
    v19[1] = v16;
    swift_getWitnessTable();
    sub_259D62A28();
    if (v22) {
      break;
    }
    sub_259D628A8();
    sub_259D62838();
    uint64_t v17 = *(void (**)(void))(v5 + 8);
    OUTLINED_FUNCTION_16();
    v17();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v10, v14, a2);
    sub_259D62818();
    OUTLINED_FUNCTION_16();
    v17();
    a1 = v24;
  }
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t Array.remove(at:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a2 + 16);
  MEMORY[0x270FA5388](a1, a2);
  OUTLINED_FUNCTION_2_8();
  uint64_t v6 = sub_259D624E8();
  uint64_t v12 = v6;
  uint64_t v7 = sub_259D15524(a1);
  uint64_t v8 = *((void *)v7 + 2);
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v10 = *(void *)&v7[8 * i + 32];
      if ((v10 & 0x8000000000000000) == 0 && v10 < MEMORY[0x25A2E8F60](*v3, v5))
      {
        sub_259D62838();
        sub_259D62828();
      }
    }
    swift_bridgeObjectRelease();
    return v12;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return v6;
}

char *sub_259D15524(uint64_t a1)
{
  uint64_t v3 = sub_259D623A8();
  MEMORY[0x270FA5388](v3, v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  sub_259D16354();
  uint64_t v10 = (char *)sub_259D626D8();
  sub_259D15A34(&v10);
  uint64_t v7 = v10;
  if (v1) {
    swift_release();
  }
  return v7;
}

uint64_t Array.indexes(where:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v30 = v9;
  MEMORY[0x270FA5388](v10, v11);
  OUTLINED_FUNCTION_2_8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v37 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  uint64_t v17 = MEMORY[0x270FA5388](v15, v16);
  uint64_t v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17, v20);
  char v22 = (char *)&v29 - v21;
  uint64_t v31 = a5;
  sub_259D62398();
  v39[1] = a3;
  uint64_t v23 = sub_259D62878();
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x25A2E8E50](v39, v23, WitnessTable);
  uint64_t v38 = v39[0];
  sub_259D62E38();
  sub_259D62E08();
  uint64_t v33 = sub_259D62E28();
  sub_259D62E18();
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  uint64_t v34 = v14 + 32;
  uint64_t v32 = v25;
  v25(v22, v19, v37);
  if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, TupleTypeMetadata2) != 1)
  {
    uint64_t v26 = *(void (**)(uint64_t, char *, uint64_t))(v30 + 32);
    char v27 = (void (**)(uint64_t, uint64_t))(v30 + 8);
    do
    {
      v26(v5, &v22[*(int *)(TupleTypeMetadata2 + 48)], a4);
      if (v35(v5)) {
        sub_259D62388();
      }
      (*v27)(v5, a4);
      sub_259D62E18();
      v32(v22, v19, v37);
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, TupleTypeMetadata2) != 1);
  }
  return swift_bridgeObjectRelease();
}

uint64_t Array.pseudoRandomElement(seedUUID:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (MEMORY[0x25A2E8F60](a1, a2) < 1)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v5 = sub_259D626B8();
    if (v5 < 0)
    {
      BOOL v6 = __OFSUB__(0, v5);
      uint64_t result = -v5;
      if (v6)
      {
        __break(1u);
        return result;
      }
    }
    sub_259D628A8();
    uint64_t v8 = 0;
  }

  return __swift_storeEnumTagSinglePayload(a3, v8, 1, a2);
}

uint64_t sub_259D15998(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_259D62DC8();
    __break(1u);
  }
  else if (a1)
  {
    uint64_t result = sub_259D627E8();
    *(void *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_259D15A34(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_259D163A4((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_259D15AA0(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_259D15AA0(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_259D62E88();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_259D16074(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_124;
  }
  uint64_t v5 = result;
  uint64_t result = sub_259D15998(v3 / 2);
  uint64_t v83 = a1;
  uint64_t v84 = result;
  char v88 = v6;
  uint64_t v86 = v3;
  if (v3 <= 0)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    unint64_t v26 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_90:
    if (v26 < 2)
    {
LABEL_101:
      uint64_t result = swift_bridgeObjectRelease();
      if (v86 >= -1)
      {
        *(void *)(v84 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_129;
    }
    uint64_t v76 = *v83;
    while (1)
    {
      unint64_t v77 = v26 - 2;
      if (v26 < 2) {
        break;
      }
      if (!v76) {
        goto LABEL_133;
      }
      uint64_t v78 = *(void *)(v9 + 32 + 16 * v77);
      uint64_t v79 = *(void *)(v9 + 32 + 16 * (v26 - 1) + 8);
      uint64_t result = sub_259D160CC((char *)(v76 + 8 * v78), (char *)(v76 + 8 * *(void *)(v9 + 32 + 16 * (v26 - 1))), v76 + 8 * v79, v88);
      if (v1) {
        goto LABEL_86;
      }
      if (v79 < v78) {
        goto LABEL_119;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_259D16340(v9);
        uint64_t v9 = result;
      }
      if (v77 >= *(void *)(v9 + 16)) {
        goto LABEL_120;
      }
      uint64_t v80 = (void *)(v9 + 32 + 16 * v77);
      *uint64_t v80 = v78;
      v80[1] = v79;
      unint64_t v81 = *(void *)(v9 + 16);
      if (v26 > v81) {
        goto LABEL_121;
      }
      uint64_t result = (uint64_t)memmove((void *)(v9 + 32 + 16 * (v26 - 1)), (const void *)(v9 + 32 + 16 * v26), 16 * (v81 - v26));
      *(void *)(v9 + 16) = v81 - 1;
      unint64_t v26 = v81 - 1;
      if (v81 <= 2) {
        goto LABEL_101;
      }
    }
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    __break(1u);
LABEL_127:
    __break(1u);
LABEL_128:
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
    return result;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v82 = *a1 - 8;
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v85 = v5;
  uint64_t v87 = *a1;
  while (1)
  {
    uint64_t v10 = v7++;
    if (v7 < v3)
    {
      uint64_t v11 = *(void *)(v8 + 8 * v7);
      uint64_t v12 = *(void *)(v8 + 8 * v10);
      uint64_t v7 = v10 + 2;
      if (v10 + 2 < v3)
      {
        uint64_t v13 = v11;
        while (1)
        {
          uint64_t v14 = *(void *)(v8 + 8 * v7);
          if (v12 < v11 == v13 >= v14) {
            break;
          }
          ++v7;
          uint64_t v13 = v14;
          if (v7 >= v3)
          {
            uint64_t v7 = v3;
            break;
          }
        }
      }
      if (v12 < v11)
      {
        if (v7 < v10) {
          goto LABEL_126;
        }
        if (v10 < v7)
        {
          uint64_t v15 = v7 - 1;
          uint64_t v16 = v10;
          do
          {
            if (v16 != v15)
            {
              if (!v8) {
                goto LABEL_132;
              }
              uint64_t v17 = *(void *)(v8 + 8 * v16);
              *(void *)(v8 + 8 * v16) = *(void *)(v8 + 8 * v15);
              *(void *)(v8 + 8 * v15) = v17;
            }
            BOOL v57 = ++v16 < v15--;
          }
          while (v57);
        }
      }
    }
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v10)) {
        goto LABEL_123;
      }
      if (v7 - v10 < v5)
      {
        uint64_t v18 = v10 + v5;
        if (__OFADD__(v10, v5)) {
          goto LABEL_127;
        }
        if (v18 >= v3) {
          uint64_t v18 = v3;
        }
        if (v18 < v10) {
          goto LABEL_128;
        }
        if (v7 != v18)
        {
          uint64_t v19 = (uint64_t *)(v82 + 8 * v7);
          do
          {
            uint64_t v20 = *(void *)(v8 + 8 * v7);
            uint64_t v21 = v10;
            char v22 = v19;
            do
            {
              uint64_t v23 = *v22;
              if (*v22 >= v20) {
                break;
              }
              if (!v8) {
                goto LABEL_130;
              }
              *char v22 = v20;
              v22[1] = v23;
              --v22;
              ++v21;
            }
            while (v7 != v21);
            ++v7;
            ++v19;
          }
          while (v7 != v18);
          uint64_t v7 = v18;
        }
      }
    }
    if (v7 < v10) {
      goto LABEL_122;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_259D16248(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
      uint64_t v9 = result;
    }
    unint64_t v25 = *(void *)(v9 + 16);
    unint64_t v24 = *(void *)(v9 + 24);
    unint64_t v26 = v25 + 1;
    uint64_t v8 = v87;
    if (v25 >= v24 >> 1)
    {
      uint64_t result = (uint64_t)sub_259D16248((char *)(v24 > 1), v25 + 1, 1, (char *)v9);
      uint64_t v8 = v87;
      uint64_t v9 = result;
    }
    *(void *)(v9 + 16) = v26;
    uint64_t v27 = v9 + 32;
    unint64_t v28 = (uint64_t *)(v9 + 32 + 16 * v25);
    *unint64_t v28 = v10;
    v28[1] = v7;
    if (v25) {
      break;
    }
    unint64_t v26 = 1;
LABEL_81:
    uint64_t v5 = v85;
    uint64_t v3 = v86;
    if (v7 >= v86) {
      goto LABEL_90;
    }
  }
  while (1)
  {
    unint64_t v29 = v26 - 1;
    if (v26 >= 4)
    {
      unint64_t v34 = v27 + 16 * v26;
      uint64_t v35 = *(void *)(v34 - 64);
      uint64_t v36 = *(void *)(v34 - 56);
      BOOL v40 = __OFSUB__(v36, v35);
      uint64_t v37 = v36 - v35;
      if (v40) {
        goto LABEL_107;
      }
      uint64_t v39 = *(void *)(v34 - 48);
      uint64_t v38 = *(void *)(v34 - 40);
      BOOL v40 = __OFSUB__(v38, v39);
      uint64_t v32 = v38 - v39;
      char v33 = v40;
      if (v40) {
        goto LABEL_108;
      }
      unint64_t v41 = v26 - 2;
      uint64_t v42 = (uint64_t *)(v27 + 16 * (v26 - 2));
      uint64_t v44 = *v42;
      uint64_t v43 = v42[1];
      BOOL v40 = __OFSUB__(v43, v44);
      uint64_t v45 = v43 - v44;
      if (v40) {
        goto LABEL_109;
      }
      BOOL v40 = __OFADD__(v32, v45);
      uint64_t v46 = v32 + v45;
      if (v40) {
        goto LABEL_111;
      }
      if (v46 >= v37)
      {
        uint64_t v64 = (uint64_t *)(v27 + 16 * v29);
        uint64_t v66 = *v64;
        uint64_t v65 = v64[1];
        BOOL v40 = __OFSUB__(v65, v66);
        uint64_t v67 = v65 - v66;
        if (v40) {
          goto LABEL_117;
        }
        BOOL v57 = v32 < v67;
        goto LABEL_70;
      }
    }
    else
    {
      if (v26 != 3)
      {
        uint64_t v58 = *(void *)(v9 + 32);
        uint64_t v59 = *(void *)(v9 + 40);
        BOOL v40 = __OFSUB__(v59, v58);
        uint64_t v51 = v59 - v58;
        char v52 = v40;
        goto LABEL_64;
      }
      uint64_t v31 = *(void *)(v9 + 32);
      uint64_t v30 = *(void *)(v9 + 40);
      BOOL v40 = __OFSUB__(v30, v31);
      uint64_t v32 = v30 - v31;
      char v33 = v40;
    }
    if (v33) {
      goto LABEL_110;
    }
    unint64_t v41 = v26 - 2;
    uint64_t v47 = (uint64_t *)(v27 + 16 * (v26 - 2));
    uint64_t v49 = *v47;
    uint64_t v48 = v47[1];
    BOOL v50 = __OFSUB__(v48, v49);
    uint64_t v51 = v48 - v49;
    char v52 = v50;
    if (v50) {
      goto LABEL_112;
    }
    uint64_t v53 = (uint64_t *)(v27 + 16 * v29);
    uint64_t v55 = *v53;
    uint64_t v54 = v53[1];
    BOOL v40 = __OFSUB__(v54, v55);
    uint64_t v56 = v54 - v55;
    if (v40) {
      goto LABEL_114;
    }
    if (__OFADD__(v51, v56)) {
      goto LABEL_116;
    }
    if (v51 + v56 >= v32)
    {
      BOOL v57 = v32 < v56;
LABEL_70:
      if (v57) {
        unint64_t v29 = v41;
      }
      goto LABEL_72;
    }
LABEL_64:
    if (v52) {
      goto LABEL_113;
    }
    uint64_t v60 = (uint64_t *)(v27 + 16 * v29);
    uint64_t v62 = *v60;
    uint64_t v61 = v60[1];
    BOOL v40 = __OFSUB__(v61, v62);
    uint64_t v63 = v61 - v62;
    if (v40) {
      goto LABEL_115;
    }
    if (v63 < v51) {
      goto LABEL_81;
    }
LABEL_72:
    uint64_t v68 = v9;
    unint64_t v69 = v29 - 1;
    if (v29 - 1 >= v26)
    {
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
      goto LABEL_118;
    }
    if (!v8) {
      goto LABEL_131;
    }
    uint64_t v70 = (uint64_t *)(v27 + 16 * v69);
    uint64_t v71 = *v70;
    uint64_t v72 = v27;
    uint64_t v73 = (void *)(v27 + 16 * v29);
    uint64_t v74 = v73[1];
    uint64_t result = sub_259D160CC((char *)(v8 + 8 * *v70), (char *)(v8 + 8 * *v73), v8 + 8 * v74, v88);
    if (v1) {
      break;
    }
    if (v74 < v71) {
      goto LABEL_104;
    }
    if (v29 > *(void *)(v68 + 16)) {
      goto LABEL_105;
    }
    *uint64_t v70 = v71;
    *(void *)(v72 + 16 * v69 + 8) = v74;
    unint64_t v75 = *(void *)(v68 + 16);
    if (v29 >= v75) {
      goto LABEL_106;
    }
    uint64_t v9 = v68;
    unint64_t v26 = v75 - 1;
    uint64_t result = (uint64_t)memmove(v73, v73 + 2, 16 * (v75 - 1 - v29));
    uint64_t v27 = v72;
    *(void *)(v68 + 16) = v75 - 1;
    uint64_t v8 = v87;
    if (v75 <= 2) {
      goto LABEL_81;
    }
  }
LABEL_86:
  uint64_t result = swift_bridgeObjectRelease();
  if (v86 < -1) {
    goto LABEL_125;
  }
  *(void *)(v84 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_259D16074(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 8 * a3 - 8;
    while (2)
    {
      uint64_t v6 = *(void *)(v4 + 8 * a3);
      uint64_t v7 = result;
      uint64_t v8 = (uint64_t *)v5;
      do
      {
        uint64_t v9 = *v8;
        if (*v8 >= v6) {
          break;
        }
        if (!v4)
        {
          __break(1u);
          return result;
        }
        *uint64_t v8 = v6;
        v8[1] = v9;
        --v8;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 8;
      if (a3 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_259D160CC(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 8;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 8;
  if (v9 >= v11)
  {
    sub_259D239C0(a2, (uint64_t)(a3 - (void)a2) / 8, a4);
    uint64_t v12 = &v4[8 * v11];
    if (v7 >= v6 || v10 < 8) {
      goto LABEL_39;
    }
    uint64_t v18 = (char *)(a3 - 8);
    while (1)
    {
      uint64_t v19 = v18 + 8;
      uint64_t v20 = *((void *)v6 - 1);
      if (v20 >= *((void *)v12 - 1))
      {
        BOOL v22 = v19 != v12 || v18 >= v12;
        uint64_t v20 = *((void *)v12 - 1);
        v12 -= 8;
        if (!v22) {
          goto LABEL_35;
        }
      }
      else
      {
        BOOL v21 = v19 != v6 || v18 >= v6;
        v6 -= 8;
        if (!v21) {
          goto LABEL_35;
        }
      }
      *(void *)uint64_t v18 = v20;
LABEL_35:
      v18 -= 8;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_39;
      }
    }
  }
  sub_259D239C0(a1, (a2 - a1) / 8, a4);
  uint64_t v12 = &v4[8 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      uint64_t v14 = *(void *)v6;
      if (*(void *)v4 < *(void *)v6) {
        break;
      }
      uint64_t v14 = *(void *)v4;
      BOOL v15 = v7 == v4;
      v4 += 8;
      if (!v15) {
        goto LABEL_11;
      }
LABEL_12:
      v7 += 8;
      if (v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_17;
      }
    }
    BOOL v15 = v7 == v6;
    v6 += 8;
    if (v15) {
      goto LABEL_12;
    }
LABEL_11:
    *(void *)uint64_t v7 = v14;
    goto LABEL_12;
  }
LABEL_17:
  uint64_t v6 = v7;
LABEL_39:
  sub_259D239C0(v4, (v12 - v4) / 8, v6);
  return 1;
}

char *sub_259D16248(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3ED588);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_259D16340(uint64_t a1)
{
  return sub_259D16248(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_259D16354()
{
  unint64_t result = qword_26A3ED580;
  if (!qword_26A3ED580)
  {
    sub_259D623A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED580);
  }
  return result;
}

char *sub_259D163A4(uint64_t a1)
{
  return sub_259D23BB4(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t PXAssetsDataSourceManagerCountModel.__allocating_init(_:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  PXAssetsDataSourceManagerCountModel.init(_:)(a1);
  return v2;
}

uint64_t PXAssetsDataSourceManagerCountModel.init(_:)(void *a1)
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_1();
  *(void *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 24) = 1;
  *(void *)(v1 + 40) = 0;
  *(void *)(v1 + 48) = 0;
  sub_259D623F8();
  *(void *)(v1 + 16) = sub_259D1650C(a1);
  *(unsigned char *)(v1 + 24) = v4 & 1;
  *(void *)(v1 + 32) = a1;
  if (a1)
  {
    uint64_t v5 = swift_allocObject();
    swift_weakInit();
    id v6 = objc_allocWithZone((Class)type metadata accessor for PXObservableObservation());
    id v7 = a1;
    swift_retain_n();
    id v8 = sub_259CE667C(v7, (uint64_t)sub_259D1668C, v5);

    swift_release_n();
    uint64_t v9 = &off_270797A80;
  }
  else
  {
    id v8 = 0;
    uint64_t v9 = 0;
  }
  *(void *)(v2 + 40) = v8;
  *(void *)(v2 + 48) = v9;
  swift_unknownObjectRelease();
  return v2;
}

id sub_259D1650C(id a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = objc_msgSend(a1, sel_dataSource);
  id v2 = objc_msgSend(v1, sel_totalNumberOfItems);

  return v2;
}

uint64_t sub_259D1657C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_259D165B4()
{
  return swift_release();
}

uint64_t sub_259D1662C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_259D16770(a2);
    return swift_release();
  }
  return result;
}

uint64_t sub_259D1668C(uint64_t a1, uint64_t a2)
{
  return sub_259D1662C(a1, a2);
}

uint64_t sub_259D16694@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_259D166FC();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_259D166C8()
{
  return sub_259D165B4();
}

uint64_t sub_259D166FC()
{
  swift_getKeyPath();
  sub_259D1694C();
  sub_259D623E8();
  swift_release();
  return *(void *)(v0 + 16);
}

uint64_t sub_259D16770(uint64_t result)
{
  if (result)
  {
    sub_259D1650C(*(id *)(v1 + 32));
    return sub_259D165B4();
  }
  return result;
}

uint64_t sub_259D167E4()
{
  return sub_259D623D8();
}

uint64_t PXAssetsDataSourceManagerCountModel.deinit()
{
  swift_unknownObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC18PhotosUIFoundation35PXAssetsDataSourceManagerCountModel___observationRegistrar;
  uint64_t v2 = sub_259D62408();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t PXAssetsDataSourceManagerCountModel.__deallocating_deinit()
{
  PXAssetsDataSourceManagerCountModel.deinit();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_259D1691C()
{
  return sub_259D166FC();
}

unint64_t sub_259D1694C()
{
  unint64_t result = qword_26A3EC1E0;
  if (!qword_26A3EC1E0)
  {
    type metadata accessor for PXAssetsDataSourceManagerCountModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3EC1E0);
  }
  return result;
}

uint64_t type metadata accessor for PXAssetsDataSourceManagerCountModel()
{
  uint64_t result = qword_26A3EC1E8;
  if (!qword_26A3EC1E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_259D169E4()
{
  return type metadata accessor for PXAssetsDataSourceManagerCountModel();
}

uint64_t sub_259D169EC()
{
  uint64_t result = sub_259D62408();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for PXAssetsDataSourceManagerCountModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PXAssetsDataSourceManagerCountModel);
}

uint64_t dispatch thunk of PXAssetsDataSourceManagerCountModel.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PXAssetsDataSourceManagerCountModel.assetCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

void sub_259D16B0C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 32);
  *(void *)(v1 + 16) = *(void *)(v0 + 24);
  *(unsigned char *)(v1 + 24) = v2;
}

id PXAssetsDataSource.lastAssetReference.getter()
{
  objc_msgSend(v0, sel_lastItemIndexPath);
  if ((void)v2) {
    return objc_msgSend(v0, sel_assetReferenceAtItemIndexPath_, &v2);
  }
  else {
    return 0;
  }
}

uint64_t Forwarded.wrappedValue.getter()
{
  return (*v0)();
}

uint64_t sub_259D16BBC()
{
  return Forwarded.wrappedValue.getter();
}

uint64_t sub_259D16BF0(uint64_t a1)
{
  MEMORY[0x270FA5388](a1, a1);
  long long v2 = (char *)&v5 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - v1);
  type metadata accessor for Forwarded();
  return Forwarded.wrappedValue.setter((uint64_t)v2);
}

uint64_t Forwarded.wrappedValue.setter(uint64_t a1)
{
  (*(void (**)(void))(v1 + 16))();
  OUTLINED_FUNCTION_4_5();
  char v4 = *(uint64_t (**)(uint64_t))(v3 + 8);

  return v4(a1);
}

void (*Forwarded.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  *uint64_t v5 = a2;
  v5[1] = v2;
  uint64_t v5[2] = *(void *)(a2 + 16);
  OUTLINED_FUNCTION_0_0();
  *(void *)(v6 + 24) = v7;
  size_t v9 = *(void *)(v8 + 64);
  void v5[4] = malloc(v9);
  v5[5] = malloc(v9);
  (*v2)();
  return sub_259D16DD8;
}

void sub_259D16DD8(uint64_t a1, char a2)
{
  long long v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 32);
  char v4 = *(void **)(*(void *)a1 + 40);
  if (a2)
  {
    uint64_t v5 = v2[2];
    uint64_t v6 = v2[3];
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 32), v4, v5);
    Forwarded.wrappedValue.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    Forwarded.wrappedValue.setter(*(void *)(*(void *)a1 + 40));
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t Forwarded.init<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  OUTLINED_FUNCTION_1_12(a1, a2, a3);
  uint64_t v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x263F8E100];
  uint64_t v6 = *(void *)(v3 + *MEMORY[0x263F8E100]);
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v11, v12);
  OUTLINED_FUNCTION_6_4((uint64_t)v26);
  MEMORY[0x270FA5388](v13, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v26 - v15, v16, v6);
  uint64_t v17 = *(unsigned __int8 *)(v8 + 80);
  v26[1] = v17 | 7;
  unint64_t v18 = (v10 + ((v17 + 32) & ~v17) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = *(void *)(*v5 + v4 + 8);
  *(void *)(v19 + 16) = v20;
  *(void *)(v19 + 24) = v6;
  BOOL v21 = *(void (**)(void))(v8 + 32);
  OUTLINED_FUNCTION_2_7();
  v21();
  uint64_t v22 = v27;
  *(void *)(v19 + v18) = v27;
  OUTLINED_FUNCTION_2_7();
  v21();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v20;
  *(void *)(v23 + 24) = v6;
  OUTLINED_FUNCTION_2_7();
  v21();
  *(void *)(v23 + v18) = v22;
  unint64_t v24 = v28;
  *unint64_t v28 = sub_259D17114;
  v24[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v19;
  v24[2] = (uint64_t (*)@<X0>(uint64_t@<X8>))sub_259D172F0;
  v24[3] = (uint64_t (*)@<X0>(uint64_t@<X8>))v23;
  return swift_retain();
}

uint64_t sub_259D1704C@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (uint64_t (*)(uint64_t *, void))swift_readAtKeyPath();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*MEMORY[0x263F8E100] + v3 + 8) - 8) + 16))(a2);
  return v4(&v6, 0);
}

uint64_t sub_259D17114@<X0>(uint64_t a1@<X8>)
{
  return sub_259D1704C(*(uint64_t **)(v1+ ((*(void *)(*(void *)(*(void *)(v1 + 24) - 8) + 64)+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80))+ 7) & 0xFFFFFFFFFFFFFFF8)), a1);
}

uint64_t sub_259D1717C(uint64_t a1)
{
  MEMORY[0x270FA5388](a1, a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - v1);
  return swift_setAtReferenceWritableKeyPath();
}

uint64_t objectdestroyTm()
{
  OUTLINED_FUNCTION_4_5();
  uint64_t v3 = OUTLINED_FUNCTION_2_9();
  v4(v3);
  swift_release();

  return MEMORY[0x270FA0238](v1, v2, v0);
}

uint64_t sub_259D172F0(uint64_t a1)
{
  return sub_259D1717C(a1);
}

uint64_t Forwarded<A>.init<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v27[0] = a3;
  OUTLINED_FUNCTION_1_12(a1, a2, a4);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 + *MEMORY[0x263F8E100]);
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v12, v13);
  OUTLINED_FUNCTION_6_4((uint64_t)v27);
  MEMORY[0x270FA5388](v14, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v27 - v16, v17, v7);
  uint64_t v18 = *(unsigned __int8 *)(v9 + 80);
  v27[1] = v18 | 7;
  unint64_t v19 = (v11 + ((v18 + 40) & ~v18) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = (uint64_t (*)@<X0>(uint64_t@<X8>))swift_allocObject();
  uint64_t v21 = *(void *)(*MEMORY[0x263F8E100] + v6 + 8);
  *((void *)v20 + 2) = v21;
  *((void *)v20 + 3) = v7;
  *((void *)v20 + 4) = a3;
  uint64_t v22 = *(void (**)(void))(v9 + 32);
  OUTLINED_FUNCTION_3_5();
  v22();
  uint64_t v23 = v28;
  *(void *)((char *)v20 + v19) = v28;
  OUTLINED_FUNCTION_3_5();
  v22();
  unint64_t v24 = (uint64_t (*)@<X0>(uint64_t@<X8>))swift_allocObject();
  *((void *)v24 + 2) = v21;
  *((void *)v24 + 3) = v7;
  *((void *)v24 + 4) = v27[0];
  OUTLINED_FUNCTION_3_5();
  v22();
  *(void *)((char *)v24 + v19) = v23;
  unint64_t v25 = v29;
  *unint64_t v29 = sub_259D1752C;
  v25[1] = v20;
  v25[2] = (uint64_t (*)@<X0>(uint64_t@<X8>))sub_259D17768;
  v25[3] = v24;
  return swift_retain();
}

uint64_t sub_259D1752C@<X0>(uint64_t a1@<X8>)
{
  return sub_259D1704C(*(uint64_t **)(v1+ ((*(void *)(*(void *)(*(void *)(v1 + 24) - 8) + 64)+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80))+ 7) & 0xFFFFFFFFFFFFFFF8)), a1);
}

uint64_t sub_259D17590(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*MEMORY[0x263F8E100] + *a3 + 8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v7 = (char *)&v10 - v6;
  swift_getAtKeyPath();
  char v8 = sub_259D62628();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    return swift_setAtReferenceWritableKeyPath();
  }
  return result;
}

uint64_t objectdestroy_5Tm()
{
  OUTLINED_FUNCTION_4_5();
  uint64_t v3 = OUTLINED_FUNCTION_2_9();
  v4(v3);
  swift_release();

  return MEMORY[0x270FA0238](v1, v2, v0);
}

uint64_t sub_259D17768()
{
  OUTLINED_FUNCTION_0_0();
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_259D17590(v4, v0 + v2, *(void **)(v0 + ((*(void *)(v3 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_259D177B8()
{
  return 8;
}

void *sub_259D177C4(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_259D177D0()
{
  swift_release();

  return swift_release();
}

uint64_t sub_259D1780C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_259D17858(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_259D178B8(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t sub_259D17900(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_259D17940(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for Forwarded()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t UIInterfaceOrientation.rotationRadians.getter(unint64_t result)
{
  if (result >= 5)
  {
    uint64_t result = sub_259D62DD8();
    __break(1u);
  }
  return result;
}

uint64_t sub_259D17A04@<X0>(double *a1@<X0>, uint64_t (*a2)(double)@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(*a1);
  *a3 = result & 1;
  return result;
}

uint64_t sub_259D17A3C(void (*a1)(unsigned __int8 *__return_ptr, double *), double a2)
{
  double v4 = a2;
  a1(&v3, &v4);
  return v3;
}

uint64_t sub_259D17A80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosBasicItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

uint64_t sub_259D17AAC()
{
  return sub_259CEFE6C();
}

uint64_t PhotosBasicItemListManager.changeDetailsRepository.getter()
{
  return swift_retain();
}

uint64_t sub_259D17AE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosBasicItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

uint64_t sub_259D17B18@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 32);
  uint64_t v5 = *(void *)(v3 + 40);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_259D18114;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_259D12654(v4);
}

uint64_t sub_259D17BAC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_259D180D4;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *a2;
  swift_beginAccess();
  uint64_t v8 = *(void *)(v7 + 32);
  *(void *)(v7 + 32) = v6;
  *(void *)(v7 + 40) = v5;
  sub_259D12654(v3);
  return sub_259CE6788(v8);
}

uint64_t PhotosBasicItemListManager.waitForItemListHandler.getter()
{
  OUTLINED_FUNCTION_4_6();
  uint64_t v1 = *(void *)(v0 + 32);
  sub_259D12654(v1);
  return v1;
}

uint64_t PhotosBasicItemListManager.waitForItemListHandler.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 32);
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return sub_259CE6788(v5);
}

uint64_t (*PhotosBasicItemListManager.waitForItemListHandler.modify())()
{
  return j__swift_endAccess;
}

Swift::Bool __swiftcall PhotosBasicItemListManager.waitForItemList(timeout:)(Swift::Double timeout)
{
  OUTLINED_FUNCTION_4_6();
  uint64_t v3 = *(uint64_t (**)(uint64_t, double))(v1 + 32);
  if (v3)
  {
    uint64_t v4 = swift_retain();
    char v5 = v3(v4, timeout);
    sub_259CE6788((uint64_t)v3);
  }
  else
  {
    char v5 = 1;
  }
  return v5 & 1;
}

uint64_t PhotosBasicItemListManager.Mutator.observable.getter()
{
  return swift_retain();
}

uint64_t sub_259D17DD4()
{
  return sub_259CEFE1C();
}

uint64_t (*sub_259D17E00(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  *a1 = sub_259CDEA10();
  return sub_259D17E48;
}

uint64_t sub_259D17E48(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return sub_259CEFE1C();
  }
  swift_retain();
  sub_259CEFE1C();

  return swift_release();
}

uint64_t sub_259D17EA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PhotosBasicItemListManager.Mutator.observable.getter();
  *a1 = result;
  return result;
}

uint64_t PhotosBasicItemListManager.deinit()
{
  swift_release();
  swift_release();
  sub_259CE6788(*(void *)(v0 + 32));

  uint64_t v1 = v0 + qword_26A3EC9E0;
  uint64_t v2 = sub_259D62408();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t PhotosBasicItemListManager.__deallocating_deinit()
{
  PhotosBasicItemListManager.deinit();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_259D17F8C()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_259D17FE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_259CDEA10();
  *a1 = result;
  return result;
}

uint64_t sub_259D18014()
{
  return 24;
}

__n128 sub_259D18020(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t method lookup function for PhotosBasicItemListManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosBasicItemListManager);
}

uint64_t dispatch thunk of PhotosBasicItemListManager.__allocating_init(itemList:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t method lookup function for PhotosBasicItemListManager.Mutator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosBasicItemListManager.Mutator);
}

uint64_t dispatch thunk of PhotosBasicItemListManager.Mutator.itemList.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t sub_259D1809C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_259D180D4(double a1)
{
  void (*v2)(unsigned __int8 *__return_ptr, double *);
  unsigned __int8 v4;
  double v5;

  uint64_t v2 = *(void (**)(unsigned __int8 *__return_ptr, double *))(v1 + 16);
  char v5 = a1;
  v2(&v4, &v5);
  return v4;
}

uint64_t sub_259D18114@<X0>(double *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(double))(v2 + 16))(*a1);
  *a2 = result & 1;
  return result;
}

id FilteredImageProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id FilteredImageProvider.init()()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for FilteredImageProvider());
  id v1 = FilteredImageProvider.init(unfilteredImageProvider:filterPromise:)(0, (uint64_t)&unk_26A3ED5B0, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v1;
}

uint64_t sub_259D181F4()
{
  return sub_259D1C2B8(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 0);
}

id FilteredImageProvider.__allocating_init(unfilteredImageProvider:filterPromise:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return FilteredImageProvider.init(unfilteredImageProvider:filterPromise:)(a1, a2, a3);
}

uint64_t type metadata accessor for FilteredImageProvider()
{
  return self;
}

id FilteredImageProvider.init(unfilteredImageProvider:filterPromise:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_lockedState;
  type metadata accessor for FilteredImageProvider.State();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8EE80];
  *(void *)(v8 + 16) = 1100;
  *(void *)(v8 + 24) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECF10);
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 24) = 0;
  *(void *)&v3[v7] = v10;
  *(void *)&v3[OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_unfilteredImageProvider] = a1;
  *(void *)(v10 + 16) = v8;
  uint64_t v11 = &v3[OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_filterPromise];
  *(void *)uint64_t v11 = a2;
  *((void *)v11 + 1) = a3;
  v13.receiver = v3;
  v13.super_class = (Class)type metadata accessor for FilteredImageProvider();
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t type metadata accessor for FilteredImageProvider.State()
{
  return self;
}

uint64_t sub_259D183B0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_259D183E8()
{
  id v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_lockedState);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_259D18450(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t sub_259D18450@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)result + 16);
  *(void *)(*(void *)result + 16) = v2 + 1;
  *a2 = v2;
  return result;
}

void sub_259D18468()
{
  id v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_lockedState);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_259D1BCD0(v2);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_259D184CC(void *a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t *)(*a1 + 24);
  swift_beginAccess();
  sub_259D0FA7C(a2);
  if (v4)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v6 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECF28);
    sub_259D62DA8();
    type metadata accessor for ImageRequest();
    sub_259D62DB8();
    *uint64_t v3 = v6;
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_endAccess();
}

uint64_t sub_259D185D0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  uint64_t v9 = v7;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECED8);
  MEMORY[0x270FA5388](v15 - 8, v16);
  OUTLINED_FUNCTION_12_0();
  uint64_t v17 = sub_259D183E8();
  uint64_t v18 = *(void *)(v7 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_unfilteredImageProvider);
  uint64_t v19 = *(void *)(v9 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_filterPromise + 8);
  uint64_t v30 = *(void *)(v9 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_filterPromise);
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v20;
  *(void *)(v21 + 24) = v17;
  type metadata accessor for ImageRequest();
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  id v22 = a3;
  swift_retain();
  uint64_t v23 = sub_259D19168(a1, a2, (uint64_t)a3, a4, a5, v18, v30, v19, a6, a7, (uint64_t)sub_259D188A8, v21);
  unint64_t v24 = *(os_unfair_lock_s **)(v9 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_lockedState);
  uint64_t v25 = (uint64_t)&v24[4];
  unint64_t v26 = v24 + 6;
  os_unfair_lock_lock(v24 + 6);
  sub_259D19228(v25);
  os_unfair_lock_unlock(v26);
  uint64_t v27 = sub_259D628F8();
  OUTLINED_FUNCTION_13_0(v27);
  uint64_t v28 = (void *)swift_allocObject();
  v28[2] = 0;
  uint64_t v28[3] = 0;
  v28[4] = v23;
  sub_259D189C0(v8, (uint64_t)&unk_26A3ED5E8, (uint64_t)v28);
  swift_release();
  return v17;
}

uint64_t sub_259D187E4()
{
  swift_unknownObjectWeakDestroy();
  uint64_t v0 = OUTLINED_FUNCTION_11_1();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

void sub_259D18814(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25A2EAC90](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    sub_259D18468();
  }
}

uint64_t sub_259D18870()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_259D188A8()
{
  sub_259D18814(*(void *)(v0 + 16));
}

uint64_t type metadata accessor for ImageRequest()
{
  return self;
}

uint64_t sub_259D188D4(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v3 = swift_retain();
  sub_259D0FC68(v3, a2);
  return swift_endAccess();
}

uint64_t sub_259D18948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_259D18968, a4, 0);
}

uint64_t sub_259D18968()
{
  OUTLINED_FUNCTION_3_6();
  sub_259D1946C();
  OUTLINED_FUNCTION_5_5();
  return v0();
}

uint64_t sub_259D189C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_259D628F8();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_259D1BF30(a1, &qword_26A3ECED8);
  }
  else
  {
    sub_259D628E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_259D628B8();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_259D18B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_259D628F8();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_259D1BF30(a1, &qword_26A3ECED8);
  }
  else
  {
    sub_259D628E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_259D628B8();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(qword_26A3ECF50);
  return swift_task_create();
}

void sub_259D18D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_259D62508();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_259D18E18()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECED8);
  MEMORY[0x270FA5388](v2 - 8, v3);
  OUTLINED_FUNCTION_12_0();
  uint64_t v4 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_lockedState);
  uint64_t v5 = (uint64_t *)&v4[4];
  id v6 = v4 + 6;
  os_unfair_lock_lock(v4 + 6);
  sub_259D192E0(v5, &v11);
  os_unfair_lock_unlock(v6);
  uint64_t v7 = v11;
  uint64_t v8 = sub_259D628F8();
  OUTLINED_FUNCTION_13_0(v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  void v9[4] = v7;
  sub_259D18B30(v1, (uint64_t)&unk_26A3ED5F8, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_259D18F14@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_beginAccess();
  uint64_t v6 = sub_259D0F6F8(a2, *(void *)(v5 + 24));
  swift_beginAccess();
  sub_259D1BE24(a2);
  swift_endAccess();
  uint64_t result = swift_release();
  *a3 = v6;
  return result;
}

uint64_t sub_259D18FBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_259D18FDC, 0, 0);
}

uint64_t sub_259D18FDC()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1) {
    return MEMORY[0x270FA2498](sub_259D1900C, v1, 0);
  }
  **(unsigned char **)(v0 + 16) = 1;
  return OUTLINED_FUNCTION_1_13();
}

uint64_t sub_259D1900C()
{
  OUTLINED_FUNCTION_3_6();
  sub_259D1A024();
  OUTLINED_FUNCTION_15_1();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_259D1906C()
{
  **(unsigned char **)(v0 + 16) = *(void *)(v0 + 24) == 0;
  return OUTLINED_FUNCTION_1_13();
}

id FilteredImageProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FilteredImageProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_259D19168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, uint64_t a11, uint64_t a12)
{
  swift_defaultActor_initialize();
  *(unsigned char *)(v12 + 184) = 0;
  *(_WORD *)(v12 + 208) = 0;
  *(unsigned char *)(v12 + 232) = 1;
  *(int64x2_t *)(v12 + 240) = vdupq_n_s64(1uLL);
  *(void *)(v12 + 256) = 0;
  *(void *)(v12 + 112) = a1;
  *(double *)(v12 + 120) = a9;
  *(double *)(v12 + 128) = a10;
  *(void *)(v12 + 136) = a2;
  *(void *)(v12 + 144) = a3;
  *(void *)(v12 + 152) = a4;
  *(void *)(v12 + 160) = a5;
  *(void *)(v12 + 216) = a6;
  *(void *)(v12 + 224) = 0;
  *(void *)(v12 + 168) = a7;
  *(void *)(v12 + 176) = a8;
  *(void *)(v12 + 192) = a11;
  *(void *)(v12 + 200) = a12;
  return v12;
}

uint64_t sub_259D19228(uint64_t a1)
{
  return sub_259D188D4(a1, *(void *)(v1 + 16));
}

uint64_t sub_259D19248()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_10(v0);
  void *v1 = v2;
  v1[1] = sub_259D1C4A8;
  uint64_t v3 = OUTLINED_FUNCTION_10_2();
  return sub_259D18948(v3, v4, v5, v6);
}

uint64_t sub_259D192E0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_259D18F14(a1, *(void *)(v2 + 16), a2);
}

uint64_t objectdestroy_5Tm_0()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_259D19340()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_10(v0);
  void *v1 = v2;
  v1[1] = sub_259D1C4A8;
  uint64_t v3 = OUTLINED_FUNCTION_10_2();
  return sub_259D18FBC(v3, v4, v5, v6);
}

uint64_t method lookup function for FilteredImageProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FilteredImageProvider);
}

uint64_t dispatch thunk of FilteredImageProvider.__allocating_init(unfilteredImageProvider:filterPromise:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of FilteredImageProvider.requestImage(for:targetSize:contentMode:options:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of FilteredImageProvider.cancelImageRequest(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

void sub_259D1946C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECED8);
  MEMORY[0x270FA5388](v1 - 8, v2);
  uint64_t v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(v0 + 209) & 1) == 0 && (*(unsigned char *)(v0 + 208) & 1) == 0)
  {
    *(unsigned char *)(v0 + 208) = 1;
    uint64_t v6 = *(void *)(v0 + 168);
    uint64_t v5 = *(void *)(v0 + 176);
    uint64_t v7 = sub_259D628F8();
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v7);
    uint64_t v8 = swift_allocObject();
    swift_weakInit();
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    void v9[4] = v6;
    v9[5] = v5;
    v9[6] = v8;
    swift_retain();
    sub_259D189C0((uint64_t)v4, (uint64_t)&unk_26A3ED6C0, (uint64_t)v9);
    swift_release();
    if (*(void *)(v0 + 216))
    {
      id v10 = *(id *)(v0 + 216);
    }
    else
    {
      id v11 = objc_msgSend(self, sel_defaultManager);
      id v10 = objc_msgSend(v11, sel_imageProviderForAsset_, *(void *)(v0 + 112));

      *(void *)(v0 + 216) = v10;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
    }
    uint64_t v12 = *(void *)(v0 + 112);
    double v13 = *(double *)(v0 + 120);
    double v14 = *(double *)(v0 + 128);
    uint64_t v15 = *(void *)(v0 + 136);
    uint64_t v16 = *(void *)(v0 + 144);
    uint64_t v17 = swift_allocObject();
    swift_weakInit();
    void aBlock[4] = sub_259D1BBDC;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_259D19F78;
    aBlock[3] = &block_descriptor_2;
    uint64_t v18 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_release();
    id v19 = objc_msgSend(v10, sel_requestImageForAsset_targetSize_contentMode_options_resultHandler_, v12, v15, v16, v18, v13, v14);
    swift_unknownObjectRelease();
    _Block_release(v18);
    *(void *)(v0 + 224) = v19;
    *(unsigned char *)(v0 + 232) = 0;
  }
}

uint64_t sub_259D19700(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 56) = a6;
  uint64_t v9 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v6 + 64) = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_259D197D0;
  return v9();
}

uint64_t sub_259D197D0()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_7();
  uint64_t v5 = v4;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_4_7();
  *uint64_t v7 = v6;
  *(void *)(v5 + 72) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 80) = v3;
  }
  OUTLINED_FUNCTION_15_1();
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_259D198C4()
{
  OUTLINED_FUNCTION_3_6();
  *(void *)(v0 + 88) = *(void *)(v0 + 80);
  OUTLINED_FUNCTION_14_1();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 96) = Strong;
  if (Strong)
  {
    return MEMORY[0x270FA2498](sub_259D19978, Strong, 0);
  }
  else
  {

    OUTLINED_FUNCTION_5_5();
    return v2();
  }
}

uint64_t sub_259D19978()
{
  OUTLINED_FUNCTION_3_6();
  sub_259D1A0F0(*(void **)(v0 + 88));
  swift_release();
  OUTLINED_FUNCTION_15_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_259D199E0()
{
  OUTLINED_FUNCTION_3_6();

  OUTLINED_FUNCTION_5_5();
  return v1();
}

uint64_t sub_259D19A38()
{
  uint64_t v17 = v0;
  if (qword_26A3ECFD8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 72);
  uint64_t v2 = sub_259D62438();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A3ED598);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_259D62418();
  os_log_type_t v6 = sub_259D62AD8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 72);
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    *(void *)(v0 + 40) = v8;
    id v10 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED680);
    uint64_t v11 = sub_259D62668();
    *(void *)(v0 + 48) = sub_259D085D0(v11, v12, &v16);
    sub_259D62B88();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_259CDA000, v5, v6, "Filter promised failed: %s", v9, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();
  }
  else
  {
  }
  *(void *)(v0 + 88) = 0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 96) = Strong;
  if (Strong)
  {
    return MEMORY[0x270FA2498](sub_259D19978, Strong, 0);
  }
  else
  {

    OUTLINED_FUNCTION_5_5();
    return v14();
  }
}

uint64_t sub_259D19CD8(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECED8);
  MEMORY[0x270FA5388](v4 - 8, v5);
  BOOL v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259D628F8();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_bridgeObjectRetain();
  id v10 = a1;
  swift_release();
  uint64_t v11 = (void *)swift_allocObject();
  void v11[2] = 0;
  v11[3] = 0;
  v11[4] = v9;
  v11[5] = a1;
  v11[6] = a2;
  sub_259D18B30((uint64_t)v7, (uint64_t)&unk_26A3ED6D0, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_259D19E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[7] = a5;
  v6[8] = a6;
  v6[5] = a1;
  v6[6] = a4;
  return MEMORY[0x270FA2498](sub_259D19E44, 0, 0);
}

uint64_t sub_259D19E44()
{
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_14_1();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 72) = Strong;
  if (Strong)
  {
    return MEMORY[0x270FA2498](sub_259D19EF4, Strong, 0);
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    OUTLINED_FUNCTION_5_5();
    return v2();
  }
}

uint64_t sub_259D19EF4()
{
  OUTLINED_FUNCTION_3_6();
  sub_259D1A190(*(void **)(v0 + 56), *(void *)(v0 + 64));
  swift_release();
  OUTLINED_FUNCTION_15_1();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_259D19F60()
{
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 72) == 0;
  return OUTLINED_FUNCTION_1_13();
}

uint64_t sub_259D19F78(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(void *, uint64_t))(a1 + 32);
  if (a3) {
    uint64_t v5 = sub_259D62518();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a2;
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_259D1A024()
{
  *(unsigned char *)(v0 + 209) = 1;
  if ((*(unsigned char *)(v0 + 232) & 1) == 0)
  {
    uint64_t v1 = *(void **)(v0 + 216);
    if (v1) {
      objc_msgSend(v1, sel_cancelImageRequest_, *(void *)(v0 + 224));
    }
  }
}

uint64_t sub_259D1A050(uint64_t result)
{
  if (*(unsigned char *)(v1 + 184) != (result & 1))
  {
    if (*(unsigned char *)(v1 + 184))
    {
      return (*(uint64_t (**)(void))(v1 + 192))();
    }
    else
    {
      uint64_t result = sub_259D62DD8();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_259D1A0E0(char a1)
{
  uint64_t v2 = *(unsigned __int8 *)(v1 + 184);
  *(unsigned char *)(v1 + 184) = a1;
  return sub_259D1A050(v2);
}

void sub_259D1A0F0(void *a1)
{
  if ((*(unsigned char *)(v1 + 209) & 1) == 0)
  {
    id v3 = a1;
    sub_259D1A13C(a1);
  }
}

void sub_259D1A13C(void *a1)
{
  id v3 = *(void **)(v1 + 240);
  *(void *)(v1 + 240) = a1;
  sub_259D1B908(a1);
  sub_259D1BAB8(v3);
  sub_259D1A260();

  sub_259D1BAB8(a1);
}

void *sub_259D1A190(void *result, uint64_t a2)
{
  if ((*(unsigned char *)(v2 + 209) & 1) == 0)
  {
    uint64_t v4 = result;
    swift_bridgeObjectRetain();
    id v5 = v4;
    return sub_259D1A1F8(v4, a2);
  }
  return result;
}

void *sub_259D1A1F8(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(v2 + 248);
  *(void *)(v2 + 248) = a1;
  *(void *)(v2 + 256) = a2;
  sub_259D1B918(a1);
  sub_259D1BA74(v4);
  sub_259D1A260();

  return sub_259D1BA74(a1);
}

uint64_t sub_259D1A260()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECED8);
  uint64_t result = MEMORY[0x270FA5388](v1 - 8, v2);
  id v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (void *)v0[30];
  if (v6 != (void *)1)
  {
    BOOL v7 = (void *)v0[31];
    if (v7 != (void *)1)
    {
      uint64_t v8 = v0[32];
      uint64_t v9 = sub_259D628F8();
      __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v9);
      unint64_t v10 = sub_259D1B6EC();
      uint64_t v11 = (void *)swift_allocObject();
      void v11[2] = v0;
      v11[3] = v10;
      v11[4] = v7;
      v11[5] = v8;
      v11[6] = v6;
      v11[7] = v0;
      swift_retain_n();
      sub_259D1B908(v6);
      sub_259D1B918(v7);
      sub_259D189C0((uint64_t)v5, (uint64_t)&unk_26A3ED698, (uint64_t)v11);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_259D1A388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[15] = a6;
  v7[16] = a7;
  v7[13] = a4;
  v7[14] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECED8);
  v7[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_259D1A424, a7, 0);
}

uint64_t sub_259D1A424()
{
  OUTLINED_FUNCTION_3_6();
  uint64_t v1 = qword_26A3ECD90;
  id v2 = *(id *)(v0 + 104);
  if (v1 != -1) {
    swift_once();
  }
  id v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v3;
  *id v3 = v0;
  v3[1] = sub_259D1A4F8;
  uint64_t v4 = *(void *)(v0 + 120);
  id v5 = *(void **)(v0 + 104);
  return sub_259D1AA00(v4, v5);
}

uint64_t sub_259D1A4F8()
{
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_7();
  uint64_t v2 = *(void *)(v1 + 128);
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_4_7();
  *uint64_t v4 = v3;
  *(void *)(v6 + 152) = v5;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_259D1A5E0, v2, 0);
}

uint64_t sub_259D1A5E0()
{
  uint64_t v1 = *(void **)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v5 = *(void **)(v0 + 104);
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v7 = *(void *)(v2 + 152);
  uint64_t v6 = *(void *)(v2 + 160);
  uint64_t v8 = sub_259D628F8();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v8);
  sub_259D628D8();
  swift_bridgeObjectRetain();
  id v9 = v5;
  swift_retain();
  id v10 = v1;
  uint64_t v11 = sub_259D628C8();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  void v12[2] = v11;
  void v12[3] = v13;
  v12[4] = v7;
  v12[5] = v6;
  v12[6] = v1;
  v12[7] = v5;
  v12[8] = v4;
  sub_259D189C0(v3, (uint64_t)&unk_26A3ED6A8, (uint64_t)v12);
  swift_release();
  if (!v4)
  {
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    goto LABEL_7;
  }
  *(void *)(v0 + 88) = sub_259D62648();
  *(void *)(v0 + 96) = v14;
  sub_259D62C18();
  sub_259D0F73C(v0 + 16, v4, (_OWORD *)(v0 + 56));
  sub_259D0FEA4(v0 + 16);
  if (!*(void *)(v0 + 80))
  {
LABEL_7:
    sub_259D1BF30(v0 + 56, qword_26A3EC4B0);
LABEL_8:
    sub_259D1A0E0(1);
    goto LABEL_9;
  }
  if (!swift_dynamicCast() || (*(unsigned char *)(v0 + 160) & 1) == 0) {
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v15 = *(void **)(v0 + 104);

  swift_task_dealloc();
  OUTLINED_FUNCTION_5_5();
  return v16();
}

uint64_t sub_259D1A7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void v8[4] = a6;
  v8[5] = a8;
  _OWORD v8[2] = a4;
  v8[3] = a5;
  sub_259D628D8();
  v8[6] = sub_259D628C8();
  uint64_t v10 = sub_259D628B8();
  return MEMORY[0x270FA2498](sub_259D1A874, v10, v9);
}

uint64_t sub_259D1A874()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[4];
  uint64_t v3 = (void (*)(uint64_t, uint64_t))v0[2];
  swift_release();
  v3(v2, v1);
  OUTLINED_FUNCTION_5_5();
  return v4();
}

id *sub_259D1A8EC()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  sub_259D1BAB8(v0[30]);
  sub_259D1BA74(v0[31]);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_259D1A94C()
{
  uint64_t v0 = sub_259D1A8EC();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_259D1A974()
{
  return v0;
}

uint64_t sub_259D1A984()
{
  type metadata accessor for PXImageFilterer();
  swift_allocObject();
  uint64_t result = sub_259D1A9C4();
  qword_26A3ECD80 = result;
  return result;
}

uint64_t sub_259D1A9C4()
{
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00628]), sel_init);
  return v0;
}

uint64_t sub_259D1AA00(uint64_t a1, void *a2)
{
  void v3[4] = a2;
  v3[5] = v2;
  id v6 = a2;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[6] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_259D1AAB0;
  return sub_259D1AE60(a1, (uint64_t)a2);
}

uint64_t sub_259D1AAB0(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  OUTLINED_FUNCTION_4_7();
  *id v6 = v5;
  *id v6 = *v2;
  *(void *)(v5 + 56) = v1;
  swift_task_dealloc();
  uint64_t v7 = *(void *)(v4 + 40);
  if (v1)
  {
    uint64_t v8 = sub_259D1AC44;
  }
  else
  {
    *(void *)(v5 + 64) = a1;
    uint64_t v8 = sub_259D1ABE4;
  }
  return MEMORY[0x270FA2498](v8, v7, 0);
}

uint64_t sub_259D1ABE4()
{
  OUTLINED_FUNCTION_3_6();

  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_259D1AC44()
{
  uint64_t v17 = v0;
  if (qword_26A3ECFD8 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[7];
  uint64_t v2 = sub_259D62438();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A3ED598);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_259D62418();
  os_log_type_t v6 = sub_259D62AD8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[7];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    v0[2] = v8;
    id v10 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED680);
    uint64_t v11 = sub_259D62668();
    v0[3] = sub_259D085D0(v11, v12, &v16);
    sub_259D62B88();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_259CDA000, v5, v6, "Failed to apply filter to image: %s", v9, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();
  }
  else
  {
  }
  uint64_t v13 = v0[4];
  uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
  return v14(v13);
}

uint64_t sub_259D1AE60(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  void v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_259D1AE84, v2, 0);
}

uint64_t sub_259D1AE84()
{
  uint64_t v1 = (void *)v0[2];
  id v2 = (id)v0[3];
  if (!v1 || !v2)
  {
    id v14 = v2;
    goto LABEL_8;
  }
  id v3 = objc_allocWithZone(MEMORY[0x263F00650]);
  id v4 = v1;
  id v5 = v2;
  id v6 = objc_msgSend(v3, sel_initWithImage_, v5);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (void *)sub_259D62638();
    objc_msgSend(v4, sel_setValue_forKey_, v7, v8);

    id v9 = objc_msgSend(v4, sel_outputImage);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void **)(v0[4] + 112);
      objc_msgSend(v9, sel_extent);
      id v12 = objc_msgSend(v11, sel_createCGImage_fromRect_, v10);
      if (v12)
      {
        uint64_t v13 = v12;
        id v2 = PXImageFromCGImage((uint64_t)v12);

LABEL_8:
        uint64_t v15 = (uint64_t (*)(id))v0[1];
        return v15(v2);
      }
      sub_259D1B384();
      swift_allocError();
      *id v19 = 3;
      swift_willThrow();

      id v4 = v7;
    }
    else
    {
      sub_259D1B384();
      swift_allocError();
      *uint64_t v18 = 2;
      swift_willThrow();

      id v4 = v5;
      id v10 = v7;
    }
  }
  else
  {
    sub_259D1B384();
    swift_allocError();
    *uint64_t v17 = 0;
    swift_willThrow();
    id v10 = v5;
  }

  OUTLINED_FUNCTION_5_5();
  return v20();
}

uint64_t sub_259D1B0F4()
{
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for PXImageFilterer()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for ImageRequest.ImageResult(void *a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ImageRequest.ImageResult(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for ImageRequest.ImageResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *assignWithTake for ImageRequest.ImageResult(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ImageRequest.ImageResult(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ImageRequest.ImageResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
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

ValueMetadata *type metadata accessor for ImageRequest.ImageResult()
{
  return &type metadata for ImageRequest.ImageResult;
}

uint64_t sub_259D1B314()
{
  return sub_259D62FD8();
}

uint64_t sub_259D1B33C()
{
  return sub_259D62FE8();
}

unint64_t sub_259D1B384()
{
  unint64_t result = qword_26A3ED678;
  if (!qword_26A3ED678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED678);
  }
  return result;
}

uint64_t sub_259D1B3D0()
{
  return sub_259D1B33C();
}

uint64_t sub_259D1B3D8()
{
  return sub_259D1B314();
}

uint64_t sub_259D1B3E0()
{
  return sub_259D62FE8();
}

uint64_t sub_259D1B434()
{
  uint64_t v0 = sub_259D62438();
  __swift_allocate_value_buffer(v0, qword_26A3ED598);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A3ED598);
  sub_259D62698();
  return sub_259D62428();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_259D1B4E4(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_259D1B5C0;
  return v6(a1);
}

uint64_t sub_259D1B5C0()
{
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_7();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_4_7();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_259D1B6EC()
{
  unint64_t result = qword_26A3ECD70;
  if (!qword_26A3ECD70)
  {
    type metadata accessor for ImageRequest();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ECD70);
  }
  return result;
}

uint64_t sub_259D1B73C()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_259D1B794()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_10(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_259D1B848;
  uint64_t v5 = OUTLINED_FUNCTION_6_5();
  return sub_259D1A388(v5, v6, v7, v8, v9, v10, v1);
}

uint64_t sub_259D1B848()
{
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_7();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_4_7();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_5_5();
  return v3();
}

id sub_259D1B908(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

id sub_259D1B918(id result)
{
  if (result != (id)1)
  {
    id v2 = result;
    swift_bridgeObjectRetain();
    return v2;
  }
  return result;
}

uint64_t sub_259D1B960()
{
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_259D1B9B8()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_2_10(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_259D1C4A8;
  uint64_t v6 = OUTLINED_FUNCTION_6_5();
  return sub_259D1A7D8(v6, v7, v8, v9, v10, v11, v1, v2);
}

void *sub_259D1BA74(void *result)
{
  if (result != (void *)1)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

void sub_259D1BAB8(id a1)
{
  if (a1 != (id)1) {
}
  }

uint64_t sub_259D1BAC8()
{
  swift_weakDestroy();
  uint64_t v0 = OUTLINED_FUNCTION_11_1();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

uint64_t sub_259D1BAF8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_259D1BB40()
{
  OUTLINED_FUNCTION_17_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_10(v0);
  void *v1 = v2;
  v1[1] = sub_259D1C4A8;
  uint64_t v3 = OUTLINED_FUNCTION_7_3();
  return sub_259D19700(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_259D1BBDC(void *a1, uint64_t a2)
{
  return sub_259D19CD8(a1, a2);
}

uint64_t sub_259D1BBE4()
{
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_259D1BC34()
{
  OUTLINED_FUNCTION_17_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_10(v0);
  void *v1 = v2;
  v1[1] = sub_259D1C4A8;
  uint64_t v3 = OUTLINED_FUNCTION_7_3();
  return sub_259D19E20(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_259D1BCD0(void *a1)
{
  return sub_259D184CC(a1, *(void *)(v1 + 16));
}

double sub_259D1BCEC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_259CE3470(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECF20);
    sub_259D62DA8();
    swift_bridgeObjectRelease();
    sub_259CEA2CC((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_259D62DB8();
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_259D1BE24(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_259D0FA7C(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  unint64_t v5 = v3;
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v1;
  void *v1 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ECF28);
  sub_259D62DA8();
  uint64_t v6 = *(void *)(*(void *)(v8 + 56) + 8 * v5);
  type metadata accessor for ImageRequest();
  sub_259D62DB8();
  *uint64_t v2 = v8;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_259D1BEF8()
{
  _Block_release(*(const void **)(v0 + 16));
  uint64_t v1 = OUTLINED_FUNCTION_11_1();

  return MEMORY[0x270FA0238](v1, v2, v3);
}

void sub_259D1BF28(uint64_t a1, uint64_t a2)
{
  sub_259D18D88(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_259D1BF30(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_259D1BF8C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  unint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_259D1C06C;
  return v5(v2 + 32);
}

uint64_t sub_259D1C06C()
{
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_7();
  uint64_t v2 = v1;
  char v4 = *(unsigned char **)(v3 + 16);
  uint64_t v5 = *v0;
  OUTLINED_FUNCTION_4_7();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  *char v4 = *(unsigned char *)(v2 + 32);
  uint64_t v7 = *(uint64_t (**)(void))(v5 + 8);
  return v7();
}

uint64_t sub_259D1C150()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_259D1C188()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_10(v0);
  void *v1 = v2;
  v1[1] = sub_259D1B848;
  uint64_t v3 = OUTLINED_FUNCTION_8_2();
  return v4(v3);
}

uint64_t sub_259D1C220()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_2_10(v0);
  void *v1 = v2;
  v1[1] = sub_259D1C4A8;
  uint64_t v3 = OUTLINED_FUNCTION_8_2();
  return v4(v3);
}

uint64_t sub_259D1C2B8(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t getEnumTagSinglePayload for Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *double result = a2 + 3;
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
        JUMPOUT(0x259D1C420);
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
          *double result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Error()
{
  return &type metadata for Error;
}

unint64_t sub_259D1C45C()
{
  unint64_t result = qword_26A3ED710;
  if (!qword_26A3ED710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED710);
  }
  return result;
}

uint64_t sub_259D1C4B4()
{
  return OUTLINED_FUNCTION_0_8();
}

uint64_t PhotosItemListManager.forceMetadata(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a2, a1, AssociatedTypeWitness);

  return __swift_storeEnumTagSinglePayload(a2, 0, 1, AssociatedTypeWitness);
}

uint64_t sub_259D1C5EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_259D1C740(a1, a2, a3, (void (*)(void, _OWORD *))type metadata accessor for PhotosChildProvidingItemListManager);
}

uint64_t sub_259D1C604@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PhotosItemListManager.forceMetadata(for:)(a1, a2);
}

uint64_t sub_259D1C644()
{
  return 1;
}

Swift::Bool __swiftcall PhotosItemListManager.waitForItemList(timeout:)(Swift::Double timeout)
{
  return 1;
}

uint64_t sub_259D1C654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PhotosItemListManager.forceMetadata(for:)(a1, a2);
}

void sub_259D1C66C(void *a1@<X8>)
{
}

uint64_t sub_259D1C678@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_259D07A00(*a1, *v2, a2);
}

void sub_259D1C684(void *a1@<X8>)
{
}

uint64_t sub_259D1C690(void *a1)
{
  return sub_259D02BE0(*a1);
}

uint64_t sub_259D1C698(void *a1)
{
  return sub_259D02C28(*a1);
}

void sub_259D1C6A0(uint64_t *a1)
{
}

void sub_259D1C6A8(uint64_t *a1)
{
}

void sub_259D1C6B0(void *a1@<X8>)
{
}

BOOL sub_259D1C6BC(uint64_t *a1)
{
  return sub_259D07A18(*a1, *v1);
}

void sub_259D1C6C8(uint64_t *a1)
{
}

uint64_t sub_259D1C6D0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = PhotosItemListManagerChangeDescriptor.init(rawValue:)(*a1, (void *)a2);
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t dispatch thunk of PhotosItemListManager.forceMetadata(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of PhotosItemListManager.refreshContents()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_259D1C728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_259D1C740(a1, a2, a3, (void (*)(void, _OWORD *))type metadata accessor for PhotosGroupingItemListManager);
}

uint64_t sub_259D1C740(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void, _OWORD *))
{
  long long v4 = *(_OWORD *)(a2 + 96);
  v6[0] = *(_OWORD *)(a2 + 80);
  v6[1] = v4;
  a4(0, v6);
  return OUTLINED_FUNCTION_0_8();
}

uint64_t sub_259D1C798@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for UserDefault();
  return UserDefault.wrappedValue.getter(v2, v3, a1);
}

uint64_t sub_259D1C7D4(uint64_t a1)
{
  MEMORY[0x270FA5388](a1, a1);
  uint64_t v2 = (char *)&v6 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v6 - v1);
  uint64_t v4 = type metadata accessor for UserDefault();
  return UserDefault.wrappedValue.setter((uint64_t)v2, v4);
}

uint64_t UserDefault.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 16);
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3EC1D0);
  if (swift_dynamicCast())
  {
    sub_259D040F0(v23, (uint64_t)v25);
    uint64_t v11 = v26;
    uint64_t v12 = v27;
    __swift_project_boxed_opaque_existential_1(v25, v26);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12))
    {
      uint64_t v13 = *(void **)(v2 + *(int *)(a2 + 28));
      id v14 = (void *)sub_259D62638();
      objc_msgSend(v13, sel_removeObjectForKey_, v14);

      uint64_t v15 = OUTLINED_FUNCTION_3_7();
      v16(v15);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  }
  else
  {
    uint64_t v24 = 0;
    memset(v23, 0, sizeof(v23));
    sub_259D1CA84((uint64_t)v23);
  }
  uint64_t v18 = *(void **)(v2 + *(int *)(a2 + 28));
  uint64_t v19 = sub_259D62ED8();
  uint64_t v20 = (void *)sub_259D62638();
  objc_msgSend(v18, sel_setObject_forKey_, v19, v20);
  swift_unknownObjectRelease();

  uint64_t v21 = OUTLINED_FUNCTION_3_7();
  return v22(v21);
}

uint64_t sub_259D1CA84(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED720);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*UserDefault.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  *uint64_t v5 = a2;
  v5[1] = v2;
  uint64_t v5[2] = *(void *)(a2 + 16);
  OUTLINED_FUNCTION_0_0();
  *(void *)(v6 + 24) = v7;
  size_t v9 = *(void *)(v8 + 64);
  void v5[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v5[5] = v10;
  UserDefault.wrappedValue.getter(a2, v11, (uint64_t)v10);
  return sub_259D1CB94;
}

void sub_259D1CB94(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[4];
  uint64_t v4 = (void *)(*a1)[5];
  if (a2)
  {
    uint64_t v5 = v2[2];
    uint64_t v6 = v2[3];
    uint64_t v7 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[4], v4, v5);
    UserDefault.wrappedValue.setter((uint64_t)v3, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    UserDefault.wrappedValue.setter((*a1)[5], *v2);
  }
  free(v4);
  free(v3);

  free(v2);
}

BOOL sub_259D1CC54(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, *(void *)(a1 + 16)) == 1;
}

uint64_t sub_259D1CC8C()
{
  return 8;
}

void *sub_259D1CC98(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t *sub_259D1CCA4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = (void **)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v12 = *v11;
    *uint64_t v10 = *v11;
    uint64_t v13 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
    id v14 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v13 = *v14;
    v13[1] = v14[1];
    id v15 = v12;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_259D1CDC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void **)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void **)v8;
  v8 += 15;
  uint64_t v10 = *v7;
  *int v7 = v9;
  id v11 = v9;

  uint64_t v12 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v12 = *(void *)(v8 & 0xFFFFFFFFFFFFFFF8);
  v12[1] = *(void *)((v8 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_259D1CE78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(_OWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_259D1CF04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void **)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void **)v8;
  v8 += 15;
  uint64_t v10 = *v7;
  *int v7 = v9;

  id v11 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  *id v11 = *(void *)(v8 & 0xFFFFFFFFFFFFFFF8);
  v11[1] = *(void *)((v8 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_259D1CFA8(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16;
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
        JUMPOUT(0x259D1D0ECLL);
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
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_259D1D100(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  unint64_t v10 = ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v8 >= a3)
  {
    int v14 = 0;
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF0) {
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
  }
  if (a2 > v8)
  {
    if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x259D1D2DCLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if (v7 < 0x7FFFFFFF)
        {
          unint64_t v17 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0) {
            uint64_t v18 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v18 = (a2 - 1);
          }
          *unint64_t v17 = v18;
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t NullPhotosObservable.observeChanges(using:)()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for NullObservation()
{
  return self;
}

uint64_t sub_259D1D358()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t dispatch thunk of PhotosAnalyticsProvider.analyticsDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t static Task<>.sleep(seconds:)(double a1)
{
  *(double *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_259D1D3A0, 0, 0);
}

uint64_t sub_259D1D3A0(unint64_t a1)
{
  double v2 = *(double *)(v1 + 16) * 1000000000.0;
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v2 <= -1.0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v2 >= 1.84467441e19)
  {
LABEL_9:
    __break(1u);
    return MEMORY[0x270FA1FF0](a1);
  }
  unint64_t v3 = (unint64_t)v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_259D1D480;
  a1 = v3;
  return MEMORY[0x270FA1FF0](a1);
}

uint64_t sub_259D1D480()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_259D1D574()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

id PXObservable.addObserver(using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  id v6 = objc_allocWithZone((Class)type metadata accessor for PXObservableObservation());
  swift_retain();
  id v7 = v2;
  swift_retain();
  id v8 = sub_259CE667C(v7, (uint64_t)sub_259D1D7F0, v5);
  swift_release();
  return v8;
}

uint64_t PXObservable.GenericChange.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t PXObservable.GenericChange.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t sub_259D1D668@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return PXObservable.GenericChange.init(rawValue:)(*a1, a2);
}

uint64_t sub_259D1D674(void *a1)
{
  return sub_259D030B4(*a1, *v1);
}

uint64_t sub_259D1D680@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_259D07CE4(*a1, *v2, a2);
}

uint64_t sub_259D1D68C(void *a1)
{
  return sub_259D030B8(*a1, *v1);
}

BOOL sub_259D1D698(void *a1, uint64_t *a2)
{
  return sub_259D0308C(a1, *a2);
}

uint64_t sub_259D1D6A0(void *a1)
{
  return sub_259D030BC(*a1);
}

uint64_t sub_259D1D6A8(void *a1)
{
  return j_j__OUTLINED_FUNCTION_5_0(*a1);
}

uint64_t sub_259D1D6B0(void *a1)
{
  return sub_259D030A8(*a1);
}

uint64_t sub_259D1D6B8(void *a1)
{
  return sub_259D030C0(*a1, *v1);
}

BOOL sub_259D1D6C4(uint64_t *a1)
{
  return sub_259D030B0(*a1, *v1);
}

uint64_t sub_259D1D6D0(void *a1)
{
  return sub_259D03090(*a1);
}

uint64_t sub_259D1D6D8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = PXObservable.GenericChange.init(rawValue:)(*a1, (void *)a2);
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_259D1D704@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PXObservable.GenericChange.rawValue.getter();
  *a1 = result;
  return result;
}

id sub_259D1D72C(uint64_t a1, uint64_t a2)
{
  return PXObservable.addObserver(using:)(a1, a2);
}

void sub_259D1D758(uint64_t a1, uint64_t a2)
{
}

void sub_259D1D77C()
{
  sub_259D1D828(0, 0);
  uint64_t v1 = (void *)MEMORY[0x25A2EAC90](v0+ OBJC_IVAR____TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation_observable);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v1, sel_unregisterChangeObserver_context_, v0, 0);
  }
}

uint64_t sub_259D1D7F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v5 = a2;
  return v3(&v5);
}

uint64_t sub_259D1D828(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2
                + OBJC_IVAR____TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation_changeHandler);
  uint64_t v4 = *(void *)(v2
                 + OBJC_IVAR____TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation_changeHandler);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return sub_259CE6788(v4);
}

void sub_259D1D848()
{
}

id sub_259D1D89C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PXObservableObservation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void (*static AnyPhotosObservableProperty.subscript.modify(void *a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5))(uint64_t a1, char a2)
{
  uint64_t v9 = malloc(0x58uLL);
  *a1 = v9;
  v9[1] = a4;
  v9[2] = a5;
  *uint64_t v9 = a3;
  unint64_t v10 = (void *)(*a3 + *MEMORY[0x263F8E100]);
  v9[3] = v10[1];
  OUTLINED_FUNCTION_0_0();
  *(void *)(v11 + 32) = v12;
  size_t v14 = *(void *)(v13 + 64);
  v9[5] = malloc(v14);
  int v15 = malloc(v14);
  v9[6] = v15;
  v9[7] = *v10;
  OUTLINED_FUNCTION_0_0();
  uint64_t v17 = v16;
  v9[8] = v16;
  size_t v19 = *(void *)(v18 + 64);
  v9[9] = malloc(v19);
  v9[10] = malloc(v19);
  (*(void (**)(void))(v17 + 16))();
  static AnyPhotosObservableProperty.subscript.getter(a3, (uint64_t)v15);
  return sub_259D1DAA0;
}

void sub_259D1DAA0(uint64_t a1, char a2)
{
  objc_super v2 = *(void **)a1;
  uint64_t v3 = *(char **)(*(void *)a1 + 72);
  uint64_t v4 = *(char **)(*(void *)a1 + 80);
  if (a2)
  {
    uint64_t v5 = v2[8];
    id v7 = (void *)v2[5];
    id v6 = (void *)v2[6];
    uint64_t v9 = v2[3];
    uint64_t v8 = v2[4];
    unint64_t v10 = (void *)v2[1];
    uint64_t v15 = v2[7];
    uint64_t v16 = v2[2];
    uint64_t v11 = (void *)*v2;
    (*(void (**)(void *, void *, uint64_t))(v8 + 16))(v7, v6, v9);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v3, v4, v15);
    swift_retain();
    swift_retain();
    static AnyPhotosObservableProperty.subscript.setter((uint64_t)v7, v3, v11, v10, v16);
    (*(void (**)(void *, uint64_t))(v8 + 8))(v6, v9);
  }
  else
  {
    id v7 = (void *)v2[5];
    id v6 = (void *)v2[6];
    uint64_t v13 = (void *)v2[1];
    uint64_t v12 = v2[2];
    size_t v14 = (void *)*v2;
    swift_retain();
    swift_retain();
    static AnyPhotosObservableProperty.subscript.setter((uint64_t)v6, v4, v14, v13, v12);
  }
  free(v4);
  free(v3);
  free(v6);
  free(v7);

  free(v2);
}

uint64_t AnyPhotosObservableProperty.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8) + 16))(a2, v2);
}

uint64_t AnyPhotosObservableProperty.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 24) - 8) + 40))(v2, a1);
}

uint64_t (*AnyPhotosObservableProperty.wrappedValue.modify())(void)
{
  return nullsub_1;
}

unint64_t AnyPhotosObservableProperty.changeDetectionType.getter@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v3 = (unint64_t *)(v2 + *(int *)(a1 + 44));
  unint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  *a2 = *v3;
  a2[1] = v5;
  return sub_259CFEAD8(v4);
}

void AnyPhotosObservableProperty.init(_:changeDetectionType:)()
{
}

uint64_t AnyPhotosObservableProperty.ChangeDetectionType.description.getter()
{
  switch(*v0)
  {
    case 0:
      uint64_t result = 0x49207463656A624FLL;
      break;
    case 1:
      uint64_t result = 0x7974696C61757145;
      break;
    case 2:
      uint64_t result = 0x6E6F6973726556;
      break;
    case 3:
      uint64_t result = 0x737961776C41;
      break;
    default:
      uint64_t result = 0x6C61756E614DLL;
      break;
  }
  return result;
}

BOOL sub_259D1DD94()
{
  uint64_t v0 = sub_259D62ED8();
  uint64_t v1 = sub_259D62ED8();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0 != v1;
}

BOOL sub_259D1DE04()
{
  return sub_259D1DD94();
}

unint64_t sub_259D1DE14(uint64_t a1)
{
  unint64_t result = sub_259D1DE3C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_259D1DE3C()
{
  unint64_t result = qword_26A3ED730;
  if (!qword_26A3ED730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED730);
  }
  return result;
}

unint64_t sub_259D1DE8C()
{
  unint64_t result = qword_26A3ED738;
  if (!qword_26A3ED738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED738);
  }
  return result;
}

unint64_t sub_259D1DEDC()
{
  unint64_t result = qword_26A3ED740;
  if (!qword_26A3ED740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED740);
  }
  return result;
}

unint64_t sub_259D1DF2C()
{
  unint64_t result = qword_26A3ED748;
  if (!qword_26A3ED748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED748);
  }
  return result;
}

unint64_t sub_259D1DF7C()
{
  unint64_t result = qword_26A3ED750;
  if (!qword_26A3ED750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED750);
  }
  return result;
}

unint64_t sub_259D1DFCC()
{
  unint64_t result = qword_26A3ED758;
  if (!qword_26A3ED758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED758);
  }
  return result;
}

ValueMetadata *type metadata accessor for PXObservable.GenericChange()
{
  return &type metadata for PXObservable.GenericChange;
}

uint64_t dispatch thunk of PXObservation.invalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t *sub_259D1E03C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v10;
  unsigned int v12 = v10 | *(_DWORD *)(v6 + 80) & 0xF8;
  if (((*(_DWORD *)(v6 + 80) | v10) & 0x100000) != 0
    || (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + v10 + 16) & ~(unint64_t)v10)
      + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) <= 0x18
      ? (BOOL v13 = v12 > 7)
      : (BOOL v13 = 1),
        v13))
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + (((v12 | 7) + 16) & ~(unint64_t)(v12 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v14 = AssociatedTypeWitness;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    unint64_t v15 = ((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v16 = ((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)v16 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
    }
    else
    {
      uint64_t v17 = *(void *)(v16 + 8);
      *(void *)unint64_t v15 = *(void *)v16;
      *(void *)(v15 + 8) = v17;
      swift_retain();
    }
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))((v15 + v11 + 16) & ~v11, (v16 + v11 + 16) & ~v11, v14);
  }
  return a1;
}

uint64_t sub_259D1E224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (unint64_t *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v9 = *v8;
  if (*v7 < 0xFFFFFFFFuLL)
  {
    if (v9 >= 0xFFFFFFFF)
    {
      unint64_t v11 = v8[1];
      *uint64_t v7 = v9;
      v7[1] = v11;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v8;
    goto LABEL_8;
  }
  if (v9 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  unint64_t v10 = v8[1];
  *uint64_t v7 = v9;
  v7[1] = v10;
  swift_retain();
  swift_release();
LABEL_8:
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 24))(((unint64_t)v7 + *(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_259D1E378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  unint64_t v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)v8 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
  }
  else
  {
    uint64_t v9 = *(void *)(v8 + 8);
    *(void *)unint64_t v7 = *(void *)v8;
    *(void *)(v7 + 8) = v9;
  }
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 32))((v7 + *(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (v8 + *(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_259D1E480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  unint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (unint64_t *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v9 = *v8;
  if (*v7 < 0xFFFFFFFFuLL)
  {
    if (v9 >= 0xFFFFFFFF)
    {
      unint64_t v11 = v8[1];
      *unint64_t v7 = v9;
      v7[1] = v11;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)unint64_t v7 = *(_OWORD *)v8;
    goto LABEL_8;
  }
  if (v9 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  unint64_t v10 = v8[1];
  *unint64_t v7 = v9;
  v7[1] = v10;
  swift_release();
LABEL_8:
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 40))(((unint64_t)v7 + *(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), AssociatedTypeWitness);
  return a1;
}

void *sub_259D1E5FC(void *result)
{
  if (*result >= 0xFFFFFFFFuLL) {
    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_259D1E618(uint64_t a1, uint64_t a2)
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

unint64_t *sub_259D1E664(unint64_t *a1, unint64_t *a2)
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

unint64_t *sub_259D1E6F4(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      unint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
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
  swift_release();
  return a1;
}

uint64_t sub_259D1E778(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 3;
  if (v4 >= 5) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_259D1E7CC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_259D1E828(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_259D1E840(void *result, int a2)
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
  *unint64_t result = v2;
  return result;
}

uint64_t sub_259D1E864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + a3 - 24);
  uint64_t v7 = sub_259D62B68();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  unsigned int v12 = (char *)&v18 - v11;
  MEMORY[0x270FA5388](v10, v13);
  unint64_t v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a3, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v12, a1, v7);
  return PhotosNSCache.subscript.setter((uint64_t)v12, (uint64_t)v15);
}

void (*PhotosNSCache.subscript.modify(void *a1, uint64_t a2))(uint64_t a1, char a2)
{
  unsigned int v5 = malloc(0x48uLL);
  *a1 = v5;
  *unsigned int v5 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_259D62B68();
  v5[1] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v5[2] = v8;
  size_t v9 = *(void *)(v8 + 64);
  v5[3] = malloc(v9);
  uint64_t v10 = malloc(v9);
  void v5[4] = v10;
  uint64_t v11 = *(void *)(v6 + 80);
  v5[5] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = v12;
  v5[6] = v12;
  size_t v14 = *(void *)(v12 + 64);
  v5[7] = malloc(v14);
  v5[8] = malloc(v14);
  (*(void (**)(void))(v13 + 16))();
  _s18PhotosUIFoundation0A7NSCacheCyq_Sgxcig_0(a2, v15, (uint64_t)v10);
  return sub_259D1EB5C;
}

void sub_259D1EB5C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 56);
  unsigned int v4 = *(void **)(*(void *)a1 + 64);
  if (a2)
  {
    uint64_t v5 = v2[5];
    uint64_t v6 = v2[6];
    uint64_t v8 = (void *)v2[3];
    uint64_t v7 = (void *)v2[4];
    uint64_t v9 = v2[1];
    uint64_t v10 = v2[2];
    (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v8, v7, v9);
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v3, v4, v5);
    PhotosNSCache.subscript.setter((uint64_t)v8, (uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
  }
  else
  {
    uint64_t v8 = (void *)v2[3];
    uint64_t v7 = (void *)v2[4];
    PhotosNSCache.subscript.setter((uint64_t)v7, (uint64_t)v4);
  }
  free(v4);
  free(v3);
  free(v7);
  free(v8);

  free(v2);
}

uint64_t sub_259D1EC60(uint64_t a1)
{
  swift_getObjectType();
  sub_259D1F018(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_259D08F20((uint64_t)v5);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v2 = 0;
    return v2 & 1;
  }
  char v2 = sub_259D62628();

  return v2 & 1;
}

uint64_t sub_259D1ED84(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = a1;
    swift_unknownObjectRetain();
    sub_259D62BA8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = a1;
  }
  char v6 = sub_259D1EC60((uint64_t)v8);

  sub_259D08F20((uint64_t)v8);
  return v6 & 1;
}

void sub_259D1EDFC()
{
}

void sub_259D1EE2C()
{
}

id sub_259D1EE50()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_259D1EE88()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 88) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 104));
  return v0;
}

uint64_t sub_259D1EEF8()
{
  uint64_t v0 = sub_259D1EE88();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t PhotosNSCache.deinit()
{
  return v0;
}

uint64_t PhotosNSCache.__deallocating_deinit()
{
  PhotosNSCache.deinit();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_259D1EFA0(uint64_t a1, uint64_t a2)
{
  return PhotosNSCache.subscript.getter(a2);
}

uint64_t sub_259D1EFCC()
{
  return 24;
}

__n128 sub_259D1EFD8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t method lookup function for PhotosNSCache(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosNSCache);
}

uint64_t dispatch thunk of PhotosNSCache.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_259D1F018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26A3EC4B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_259D1F080(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

Swift::Void __swiftcall UIViewController.configurePhotosSlideTransition()()
{
  uint64_t v1 = v0;
  id v2 = sub_259D1F150();
  id v3 = sub_259D1F26C();

  objc_msgSend(v1, sel_setTransitioningDelegate_, v3);
  uint64_t v4 = sub_259D1F150();
  v4[OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData_isConfigured] = 1;
}

id sub_259D1F150()
{
  if (objc_getAssociatedObject(v0, &unk_26A3ED960))
  {
    sub_259D62BA8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_259D207BC((uint64_t)v4, (uint64_t)v5);
  if (!v6)
  {
    sub_259D08F20((uint64_t)v5);
    goto LABEL_8;
  }
  _s14AssociatedDataCMa();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    id v1 = objc_msgSend(objc_allocWithZone((Class)_s14AssociatedDataCMa()), sel_init);
    objc_setAssociatedObject(v0, &unk_26A3ED960, v1, (void *)1);
    return v1;
  }
  return (id)v3;
}

uint64_t UIViewController.isConfiguredForPhotosSlideTransition.getter()
{
  uint64_t v0 = (unsigned __int8 *)sub_259D1F150();
  uint64_t v1 = v0[OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData_isConfigured];

  return v1;
}

id sub_259D1F26C()
{
  uint64_t v1 = OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData____lazy_storage___transitioningDelegate;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData____lazy_storage___transitioningDelegate);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData____lazy_storage___transitioningDelegate);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PhotosSlideTransitionTransitioningDelegate()), sel_init);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_259D1F2E0()
{
  v0[OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData_isConfigured] = 0;
  *(void *)&v0[OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData____lazy_storage___transitioningDelegate] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)_s14AssociatedDataCMa();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_259D1F354()
{
  return sub_259D20760(0, _s14AssociatedDataCMa);
}

id PhotosSlideTransition.__allocating_init(_:useLinearAnimation:animateBackground:roundDetailsViewCorners:)(unsigned char *a1, char a2, char a3, char a4)
{
  id v9 = objc_allocWithZone(v4);
  return PhotosSlideTransition.init(_:useLinearAnimation:animateBackground:roundDetailsViewCorners:)(a1, a2, a3, a4);
}

id PhotosSlideTransition.init(_:useLinearAnimation:animateBackground:roundDetailsViewCorners:)(unsigned char *a1, char a2, char a3, char a4)
{
  v4[OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_direction] = *a1;
  v4[OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_useLinearAnimation] = a2;
  v4[OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground] = a3;
  v4[OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_roundDetailsViewCorners] = a4;
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PhotosSlideTransition();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for PhotosSlideTransition()
{
  return self;
}

BOOL static PhotosSlideTransition.Direction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PhotosSlideTransition.Direction.hash(into:)()
{
  return sub_259D62FD8();
}

uint64_t PhotosSlideTransition.Direction.hashValue.getter()
{
  return sub_259D62FE8();
}

void sub_259D1F500(void *a1@<X0>, long long *a2@<X8>)
{
  id v3 = objc_msgSend(a1, sel_containerView);
  id v4 = objc_msgSend(v3, sel_traitCollection);
  if (objc_msgSend(v4, sel_verticalSizeClass) == (id)1
    || objc_msgSend(v4, sel_userInterfaceIdiom) == (id)1
    || ((objc_msgSend(v3, sel_frame), double Width = CGRectGetWidth(v26), Width <= 393.0)
      ? (double v6 = 16.0, v7 = 24.0)
      : (double v6 = 20.0, v7 = 30.0),
        Width <= v7))
  {

    long long v15 = xmmword_259D73670;
    long long v17 = xmmword_259D73680;
    long long v16 = 0uLL;
  }
  else
  {
    CGFloat v8 = (Width - v6) / Width;
    CGAffineTransformMakeScale(&t1, v8, v8);
    long long v19 = *(_OWORD *)&t1.c;
    long long v21 = *(_OWORD *)&t1.a;
    CGFloat tx = t1.tx;
    CGFloat ty = t1.ty;
    objc_msgSend(v3, sel_safeAreaInsets);
    double v12 = v11;
    objc_msgSend(v3, sel_frame);
    double v13 = v12 + (1.0 - v8) * CGRectGetHeight(v27) * -0.5;
    double v14 = 0.0;
    if (v13 > 0.0) {
      double v14 = v13;
    }
    CGAffineTransformMakeTranslation(&t1, 0.0, v14);
    *(_OWORD *)&t2.CGFloat a = v21;
    *(_OWORD *)&t2.CGFloat c = v19;
    t2.CGFloat tx = tx;
    t2.CGFloat ty = ty;
    CGAffineTransformConcat(&v23, &t1, &t2);
    long long v20 = *(_OWORD *)&v23.c;
    long long v22 = *(_OWORD *)&v23.a;
    long long v18 = *(_OWORD *)&v23.tx;

    long long v16 = v18;
    long long v15 = v20;
    long long v17 = v22;
  }
  *a2 = v17;
  a2[1] = v15;
  a2[2] = v16;
}

void sub_259D1F6E8(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  id v4 = objc_msgSend(a1, sel_containerView);
  objc_msgSend(v4, sel_bounds);
  CGFloat Height = CGRectGetHeight(v70);
  sub_259D1F500(a1, &v65);
  int v53 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground);
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground)) {
    double v6 = *(double *)&v65;
  }
  else {
    double v6 = 1.0;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground)) {
    double v7 = *((double *)&v65 + 1);
  }
  else {
    double v7 = 0.0;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground)) {
    double v8 = v66;
  }
  else {
    double v8 = 0.0;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground)) {
    double v9 = v67;
  }
  else {
    double v9 = 1.0;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground)) {
    double v10 = v68;
  }
  else {
    double v10 = 0.0;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground)) {
    double v11 = v69;
  }
  else {
    double v11 = 0.0;
  }
  id v12 = objc_msgSend(a1, sel_viewForKey_, *MEMORY[0x263F83C08]);
  id v13 = objc_msgSend(a1, sel_viewControllerForKey_, *MEMORY[0x263F83C00]);
  id v14 = objc_msgSend(a1, sel_viewForKey_, *MEMORY[0x263F83C18]);
  id v15 = objc_msgSend(a1, sel_viewControllerForKey_, *MEMORY[0x263F83C10]);
  long long v16 = v15;
  if (v12) {
    BOOL v17 = v13 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  char v18 = v17;
  uint64_t v62 = v13;
  uint64_t v63 = v12;
  uint64_t v60 = v15;
  int v58 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_direction);
  if (v58)
  {
    if ((v18 & 1) == 0)
    {
      id v19 = v12;
      id v20 = v13;
      objc_msgSend(a1, sel_initialFrameForViewController_, v20);
      objc_msgSend(v19, sel_setFrame_);
      objc_msgSend(v19, sel_frame);
      CGRect v72 = CGRectOffset(v71, 0.0, Height);
      CGFloat y = v72.origin.y;
      CGFloat x = v72.origin.x;
      CGFloat v54 = v72.size.height;
      CGFloat width = v72.size.width;
      if (v14 && v16)
      {
        id v21 = v14;
        id v22 = v16;
        objc_msgSend(a1, sel_finalFrameForViewController_, v22);
        objc_msgSend(v21, sel_setFrame_);
        *(double *)uint64_t v64 = v6;
        *(double *)&v64[1] = v7;
        *(double *)&v64[2] = v8;
        *(double *)&v64[3] = v9;
        *(double *)&v64[4] = v10;
        *(double *)&v64[5] = v11;
        objc_msgSend(v21, sel_setTransform_, v64);
        objc_msgSend(v4, sel_insertSubview_belowSubview_, v21, v19);
      }
      id v23 = v14;
      double v9 = 1.0;
      double v11 = 0.0;
      double v10 = 0.0;
      double v8 = 0.0;
      double v7 = 0.0;
      double v59 = 1.0;
      goto LABEL_36;
    }
LABEL_49:
    sub_259D62DD8();
    __break(1u);
    return;
  }
  if ((v18 & 1) == 0)
  {
    id v24 = v12;
    id v25 = v13;
    objc_msgSend(a1, sel_initialFrameForViewController_, v25);
    objc_msgSend(v24, sel_setFrame_);
  }
  if (!v14 || !v16) {
    goto LABEL_49;
  }
  double v59 = v6;
  CGRect v26 = v16;
  id v23 = v12;
  id v19 = v14;
  id v27 = v26;
  objc_msgSend(a1, sel_finalFrameForViewController_, v27);
  CGFloat y = v73.origin.y;
  CGFloat x = v73.origin.x;
  CGFloat v54 = v73.size.height;
  CGFloat width = v73.size.width;
  CGRect v74 = CGRectOffset(v73, 0.0, Height);
  objc_msgSend(v19, sel_setFrame_, v74.origin.x, v74.origin.y, v74.size.width, v74.size.height);
  objc_msgSend(v4, sel_addSubview_, v19);

LABEL_36:
  double v28 = v7;
  uint64_t v61 = v14;
  double v29 = v8;
  if (v23)
  {
    id v30 = v23;
    objc_msgSend(v30, sel__continuousCornerRadius);
    uint64_t v32 = v31;
    unsigned __int8 v33 = objc_msgSend(v30, sel_clipsToBounds);

    double v34 = v10;
    if (v53)
    {
      id v35 = v30;
      objc_msgSend(v35, sel__setContinuousCornerRadius_, 10.0);
      objc_msgSend(v35, sel_setClipsToBounds_, 1);
    }
  }
  else
  {
    double v34 = v10;
    uint64_t v32 = 0;
    unsigned __int8 v33 = 2;
  }
  double v36 = v9;
  objc_msgSend(v19, sel__continuousCornerRadius);
  uint64_t v38 = v37;
  unsigned __int8 v39 = objc_msgSend(v19, sel_clipsToBounds);
  if (*(unsigned char *)(v2 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_roundDetailsViewCorners) == 1)
  {
    objc_msgSend(v19, sel__setContinuousCornerRadius_, 10.0);
    objc_msgSend(v19, sel_setClipsToBounds_, 1);
  }
  id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  id v41 = objc_msgSend(self, sel_blackColor);
  objc_msgSend(v40, sel_setBackgroundColor_, v41);

  objc_msgSend(v4, sel_bounds);
  objc_msgSend(v40, sel_setFrame_);
  objc_msgSend(v4, sel_insertSubview_belowSubview_, v40, v19);
  if (v58) {
    double v42 = 0.5;
  }
  else {
    double v42 = 0.0;
  }
  if (v58) {
    double v43 = 0.0;
  }
  else {
    double v43 = 0.5;
  }
  objc_msgSend(v40, sel_setAlpha_, v42);
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = v23;
  *(double *)(v44 + 24) = v59;
  *(double *)(v44 + 32) = v28;
  *(double *)(v44 + 40) = v29;
  *(double *)(v44 + 48) = v36;
  *(double *)(v44 + 56) = v34;
  *(double *)(v44 + 64) = v11;
  *(void *)(v44 + 72) = v40;
  *(double *)(v44 + 80) = v43;
  *(void *)(v44 + 88) = v19;
  *(CGFloat *)(v44 + 96) = x;
  *(CGFloat *)(v44 + 104) = y;
  *(CGFloat *)(v44 + 112) = width;
  *(CGFloat *)(v44 + 120) = v54;
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = v40;
  *(void *)(v45 + 24) = v32;
  *(unsigned char *)(v45 + 32) = v33;
  *(void *)(v45 + 40) = v23;
  *(void *)(v45 + 48) = v19;
  *(void *)(v45 + 56) = v38;
  *(unsigned char *)(v45 + 64) = v39;
  *(void *)(v45 + 72) = a1;
  id v46 = v23;
  id v47 = v40;
  id v48 = v19;
  id v49 = v46;
  id v50 = v47;
  id v51 = v48;
  uint64_t v52 = swift_unknownObjectRetain();
  sub_259D20090(v52, sub_259D1FE84, v44, sub_259D2000C, v45);

  swift_release();
  swift_release();
}

id sub_259D1FD8C(void *a1, _OWORD *a2, void *a3, void *a4, double a5, double a6, double a7, double a8, double a9)
{
  long long v16 = a2[1];
  v18[0] = *a2;
  v18[1] = v16;
  v18[2] = a2[2];
  objc_msgSend(a1, sel_setTransform_, v18);
  objc_msgSend(a3, sel_setAlpha_, a5);
  return objc_msgSend(a4, sel_setFrame_, a6, a7, a8, a9);
}

uint64_t sub_259D1FE3C()
{
  return MEMORY[0x270FA0238](v0, 128, 7);
}

id sub_259D1FE84()
{
  return sub_259D1FD8C(*(void **)(v0 + 16), (_OWORD *)(v0 + 24), *(void **)(v0 + 72), *(void **)(v0 + 88), *(double *)(v0 + 80), *(double *)(v0 + 96), *(double *)(v0 + 104), *(double *)(v0 + 112), *(double *)(v0 + 120));
}

id sub_259D1FEA4(int a1, id a2, double a3, uint64_t a4, unsigned __int8 a5, void *a6, void *a7, char a8, void *a9)
{
  int v15 = a5;
  objc_msgSend(a2, sel_removeFromSuperview);
  if (v15 == 2)
  {
    if (!a6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a6)
  {
    objc_msgSend(a6, sel__setContinuousCornerRadius_, *(double *)&a4);
    objc_msgSend(a6, sel_setClipsToBounds_, v15 & 1);
LABEL_6:
    v17[0] = 0x3FF0000000000000;
    v17[1] = 0;
    v17[2] = 0;
    v17[3] = 0x3FF0000000000000;
    v17[4] = 0;
    v17[5] = 0;
    objc_msgSend(a6, sel_setTransform_, v17);
  }
LABEL_7:
  objc_msgSend(a7, sel__setContinuousCornerRadius_, a3);
  objc_msgSend(a7, sel_setClipsToBounds_, a8 & 1);
  return objc_msgSend(a9, sel_completeTransition_, objc_msgSend(a9, sel_transitionWasCancelled) ^ 1);
}

uint64_t sub_259D1FFBC()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

id sub_259D2000C(int a1)
{
  return sub_259D1FEA4(a1, *(id *)(v1 + 16), *(double *)(v1 + 56), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), *(void **)(v1 + 40), *(void **)(v1 + 48), *(unsigned char *)(v1 + 64), *(void **)(v1 + 72));
}

void sub_259D20090(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (*(unsigned char *)(v5 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_useLinearAnimation) == 1)
  {
    id v13 = a2;
    uint64_t v14 = a3;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 1107296256;
    double v11 = sub_259CED700;
    id v12 = &block_descriptor_4;
    double v8 = _Block_copy(&v9);
    swift_retain();
    swift_release();
    if (a4)
    {
      id v13 = a4;
      uint64_t v14 = a5;
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 1107296256;
      double v11 = sub_259D1F080;
      id v12 = &block_descriptor_26;
      a4 = _Block_copy(&v9);
      swift_retain();
      swift_release();
    }
    objc_msgSend(self, sel_animateWithDuration_delay_options_animations_completion_, 196608, v8, a4, 0.4, 0.0);
    _Block_release(a4);
    _Block_release(v8);
  }
  else
  {
    sub_259D09B5C();
    sub_259D62B48();
  }
}

id PhotosSlideTransition.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void PhotosSlideTransition.init()()
{
}

id PhotosSlideTransition.__deallocating_deinit(uint64_t a1)
{
  return sub_259D20760(a1, type metadata accessor for PhotosSlideTransition);
}

unint64_t sub_259D202C8()
{
  unint64_t result = qword_26A3ED9F0;
  if (!qword_26A3ED9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ED9F0);
  }
  return result;
}

uint64_t _s14AssociatedDataCMa()
{
  return self;
}

uint64_t method lookup function for PhotosSlideTransition(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosSlideTransition);
}

uint64_t dispatch thunk of PhotosSlideTransition.__allocating_init(_:useLinearAnimation:animateBackground:roundDetailsViewCorners:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PhotosSlideTransition.transitionDuration(using:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of PhotosSlideTransition.animateTransition(using:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t getEnumTagSinglePayload for PhotosSlideTransition.Direction(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PhotosSlideTransition.Direction(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x259D20520);
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

unsigned char *sub_259D20548(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PhotosSlideTransition.Direction()
{
  return &type metadata for PhotosSlideTransition.Direction;
}

id sub_259D20564()
{
  char v2 = 0;
  id v0 = objc_allocWithZone((Class)type metadata accessor for PhotosSlideTransition());
  return PhotosSlideTransition.init(_:useLinearAnimation:animateBackground:roundDetailsViewCorners:)(&v2, 0, 1, 0);
}

id sub_259D2063C()
{
  char v2 = 1;
  id v0 = objc_allocWithZone((Class)type metadata accessor for PhotosSlideTransition());
  return PhotosSlideTransition.init(_:useLinearAnimation:animateBackground:roundDetailsViewCorners:)(&v2, 0, 1, 0);
}

id sub_259D206E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosSlideTransitionTransitioningDelegate();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_259D20744()
{
  return sub_259D20760(0, type metadata accessor for PhotosSlideTransitionTransitioningDelegate);
}

id sub_259D20760(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for PhotosSlideTransitionTransitioningDelegate()
{
  return self;
}

uint64_t sub_259D207BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26A3EC4B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t PhotosWeakSet.insert(_:)()
{
  sub_259D208FC();
  swift_unknownObjectRetain();
  PhotosWeakObjectReference.init(_:)((uint64_t)&v2);
  uint64_t v0 = type metadata accessor for PhotosWeakObjectReference();
  swift_getWitnessTable();
  sub_259D62968();
  sub_259D62918();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(*(void *)(v0 - 8) + 8))(v3, v0);
}

uint64_t sub_259D208FC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0 + 56;
  uint64_t v3 = 1 << *(unsigned char *)(*v0 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(*v0 + 56);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (unint64_t i = v9 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v8 << 6))
  {
    uint64_t v14 = *(void *)(v1 + 48) + 16 * i;
    uint64_t v15 = type metadata accessor for PhotosWeakObjectReference();
    uint64_t v16 = *(void *)(v15 - 8);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v16 + 16))(v21, v14, v15);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v16 + 32))(v20, v21, v15);
    uint64_t v17 = MEMORY[0x25A2EAC90](v20);
    swift_unknownObjectRelease();
    if (!v17)
    {
      swift_getWitnessTable();
      sub_259D62968();
      sub_259D62928();
      uint64_t v18 = sub_259D62B68();
      (*(void (**)(unsigned char *, uint64_t))(*(void *)(v18 - 8) + 8))(v19, v18);
    }
    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v16 + 8))(v20, v15);
    if (v5) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v11 >= v6) {
      return swift_release();
    }
    unint64_t v12 = *(void *)(v2 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v6) {
        return swift_release();
      }
      unint64_t v12 = *(void *)(v2 + 8 * v8);
      if (!v12) {
        break;
      }
    }
LABEL_16:
    unint64_t v5 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 2;
  if (v13 >= v6) {
    return swift_release();
  }
  unint64_t v12 = *(void *)(v2 + 8 * v13);
  if (v12)
  {
    int64_t v8 = v13;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v8 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v8 >= v6) {
      return swift_release();
    }
    unint64_t v12 = *(void *)(v2 + 8 * v8);
    ++v13;
    if (v12) {
      goto LABEL_16;
    }
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t PhotosWeakSet.remove(_:)()
{
  swift_unknownObjectRetain();
  PhotosWeakObjectReference.init(_:)((uint64_t)v3);
  uint64_t v0 = type metadata accessor for PhotosWeakObjectReference();
  swift_getWitnessTable();
  sub_259D62968();
  sub_259D62928();
  (*(void (**)(unsigned char *, uint64_t))(*(void *)(v0 - 8) + 8))(v3, v0);
  uint64_t v1 = sub_259D62B68();
  (*(void (**)(unsigned char *, uint64_t))(*(void *)(v1 - 8) + 8))(v4, v1);
  return sub_259D208FC();
}

uint64_t static PhotosCollectionTitleDisplayIntent.== infix(_:_:)()
{
  return 1;
}

uint64_t PhotosCollectionTitleDisplayIntent.hash(into:)()
{
  return sub_259D62FD8();
}

uint64_t PhotosCollectionTitleDisplayIntent.hashValue.getter()
{
  return sub_259D62FE8();
}

uint64_t sub_259D20CD4()
{
  return PhotosCollectionTitleDisplayIntent.hashValue.getter();
}

uint64_t sub_259D20CEC()
{
  return PhotosCollectionTitleDisplayIntent.hash(into:)();
}

uint64_t sub_259D20D04()
{
  return sub_259D62FE8();
}

uint64_t transform(title:subtitle:displayIntent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = objc_msgSend(self, sel_defaultHelper);
  if (!a2)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:

    return a2;
  }
  BOOL v7 = (void *)sub_259D62638();
  id v8 = objc_msgSend(v6, sel_displayableTextForTitle_intent_, v7, 1);

  a2 = sub_259D62648();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v9 = (void *)sub_259D62638();
  id v10 = objc_msgSend(v6, sel_displayableTextForTitle_intent_, v9, 1);

  sub_259D62648();
  return a2;
}

unint64_t sub_259D20E70()
{
  unint64_t result = qword_26A3EDAC8[0];
  if (!qword_26A3EDAC8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A3EDAC8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PhotosCollectionTitleDisplayIntent(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for PhotosCollectionTitleDisplayIntent(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x259D20FACLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_259D20FD4()
{
  return 0;
}

ValueMetadata *type metadata accessor for PhotosCollectionTitleDisplayIntent()
{
  return &type metadata for PhotosCollectionTitleDisplayIntent;
}

int *PhotosStaticCollectionTitleModel.init(title:subtitle:symbolName:assetCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  OUTLINED_FUNCTION_3_9();
  uint64_t v17 = v16;
  sub_259D62308();
  unint64_t result = (int *)type metadata accessor for PhotosStaticCollectionTitleModel(0);
  id v19 = (void *)(v17 + result[5]);
  *id v19 = v13;
  v19[1] = v12;
  id v20 = (void *)(v17 + result[6]);
  *id v20 = v11;
  v20[1] = v10;
  id v21 = (void *)(v17 + result[7]);
  *id v21 = v9;
  v21[1] = v8;
  uint64_t v22 = v17 + result[8];
  *(void *)uint64_t v22 = a7;
  *(unsigned char *)(v22 + 8) = a8 & 1;
  return result;
}

uint64_t type metadata accessor for PhotosStaticCollectionTitleModel(uint64_t a1)
{
  return sub_259D2274C(a1, (uint64_t *)&unk_26A3ECBE8);
}

double static PhotosStaticCollectionTitleModel.empty.getter@<D0>(uint64_t a1@<X8>)
{
  sub_259D62308();
  int v2 = (int *)type metadata accessor for PhotosStaticCollectionTitleModel(0);
  *(void *)&double result = 32;
  *(_OWORD *)(a1 + v2[5]) = xmmword_259D73890;
  unsigned int v4 = (void *)(a1 + v2[6]);
  *unsigned int v4 = 0;
  v4[1] = 0;
  uint64_t v5 = (void *)(a1 + v2[7]);
  *uint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v6 = a1 + v2[8];
  *(void *)uint64_t v6 = 0;
  *(unsigned char *)(v6 + 8) = 1;
  return result;
}

uint64_t PhotosStaticCollectionTitleModel.id.getter()
{
  sub_259D62318();
  OUTLINED_FUNCTION_3();
  uint64_t v0 = OUTLINED_FUNCTION_4_8();

  return v1(v0);
}

uint64_t PhotosStaticCollectionTitleModel.title.getter()
{
  return OUTLINED_FUNCTION_4_8();
}

uint64_t PhotosStaticCollectionTitleModel.subtitle.getter()
{
  return OUTLINED_FUNCTION_4_8();
}

uint64_t PhotosStaticCollectionTitleModel.symbolName.getter()
{
  return OUTLINED_FUNCTION_4_8();
}

uint64_t PhotosStaticCollectionTitleModel.assetCount.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for PhotosStaticCollectionTitleModel(0) + 32));
}

uint64_t sub_259D21228()
{
  return PhotosStaticCollectionTitleModel.assetCount.getter();
}

uint64_t PhotosObservableCollectionTitleModel.__allocating_init(title:subtitle:symbolName:assetCount:)()
{
  OUTLINED_FUNCTION_3_9();
  uint64_t v0 = swift_allocObject();
  PhotosObservableCollectionTitleModel.init(title:subtitle:symbolName:assetCount:)();
  return v0;
}

uint64_t PhotosObservableCollectionTitleModel.init(title:subtitle:symbolName:assetCount:)()
{
  sub_259D62308();
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___title[0]);
  void *v1 = 0;
  v1[1] = 0;
  int v2 = (void *)(v0 + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___subtitle);
  *int v2 = 0;
  v2[1] = 0;
  int v3 = (void *)(v0 + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___symbolName);
  *int v3 = 0;
  v3[1] = 0;
  uint64_t v4 = v0 + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___assetCount;
  *(void *)uint64_t v4 = 0;
  *(unsigned char *)(v4 + 8) = 1;
  sub_259D623F8();
  sub_259D21414();
  sub_259D21414();
  sub_259D21414();
  sub_259D21488();
  return v0;
}

uint64_t sub_259D21414()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_259D21488()
{
  return swift_release();
}

uint64_t PhotosObservableCollectionTitleModel.id.getter()
{
  sub_259D62318();
  OUTLINED_FUNCTION_3();
  uint64_t v0 = OUTLINED_FUNCTION_4_8();

  return v1(v0);
}

uint64_t PhotosObservableCollectionTitleModel.title.setter(uint64_t a1, uint64_t a2)
{
  return sub_259D217A0(a1, a2, _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC5titleSSSgvg_0);
}

uint64_t _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC5titleSSSgvg_0()
{
  return sub_259D2188C();
}

uint64_t (*PhotosObservableCollectionTitleModel.title.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_7_4(a1);
  uint64_t *v1 = _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC5titleSSSgvg_0();
  v1[1] = v2;
  return sub_259D215F8;
}

uint64_t sub_259D215F8(uint64_t a1, char a2)
{
  return sub_259D216F8(a1, a2, (void (*)(uint64_t))PhotosObservableCollectionTitleModel.title.setter);
}

uint64_t sub_259D21614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  swift_bridgeObjectRetain();
  uint64_t v6 = OUTLINED_FUNCTION_5_7();
  return a5(v6);
}

uint64_t PhotosObservableCollectionTitleModel.subtitle.setter(uint64_t a1, uint64_t a2)
{
  return sub_259D217A0(a1, a2, _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC8subtitleSSSgvg_0);
}

uint64_t _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC8subtitleSSSgvg_0()
{
  return sub_259D2188C();
}

uint64_t (*PhotosObservableCollectionTitleModel.subtitle.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_7_4(a1);
  uint64_t *v1 = _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC8subtitleSSSgvg_0();
  v1[1] = v2;
  return sub_259D216E0;
}

uint64_t sub_259D216E0(uint64_t a1, char a2)
{
  return sub_259D216F8(a1, a2, (void (*)(uint64_t))PhotosObservableCollectionTitleModel.subtitle.setter);
}

uint64_t sub_259D216F8(uint64_t a1, char a2, void (*a3)(uint64_t))
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = OUTLINED_FUNCTION_5_7();
    a3(v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = OUTLINED_FUNCTION_5_7();
    return ((uint64_t (*)(uint64_t))a3)(v6);
  }
}

uint64_t PhotosObservableCollectionTitleModel.symbolName.setter(uint64_t a1, uint64_t a2)
{
  return sub_259D217A0(a1, a2, _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC10symbolNameSSSgvg_0);
}

uint64_t sub_259D217A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (!a2)
  {
    if (!v6) {
      return result;
    }
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_8_3();
  }
  if (!v6) {
    return OUTLINED_FUNCTION_8_3();
  }
  if (result != a1 || v6 != a2)
  {
    char v8 = sub_259D62EE8();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_14;
    }
    return OUTLINED_FUNCTION_8_3();
  }
  swift_bridgeObjectRelease();
LABEL_14:

  return swift_bridgeObjectRelease();
}

uint64_t _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC10symbolNameSSSgvg_0()
{
  return sub_259D2188C();
}

uint64_t sub_259D2188C()
{
  return OUTLINED_FUNCTION_4_8();
}

uint64_t (*PhotosObservableCollectionTitleModel.symbolName.modify(uint64_t a1))(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_7_4(a1);
  uint64_t *v1 = _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC10symbolNameSSSgvg_0();
  v1[1] = v2;
  return sub_259D21950;
}

uint64_t sub_259D21950(uint64_t a1, char a2)
{
  return sub_259D216F8(a1, a2, (void (*)(uint64_t))PhotosObservableCollectionTitleModel.symbolName.setter);
}

uint64_t PhotosObservableCollectionTitleModel.assetCount.getter()
{
  return sub_259D21A58();
}

uint64_t sub_259D21984@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = PhotosObservableCollectionTitleModel.assetCount.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_259D219B8(uint64_t a1)
{
  return PhotosObservableCollectionTitleModel.assetCount.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t PhotosObservableCollectionTitleModel.assetCount.setter(uint64_t a1, char a2)
{
  uint64_t result = sub_259D21A58();
  if (a2)
  {
    if (v5) {
      return result;
    }
  }
  else if ((v5 & 1) == 0 && result == a1)
  {
    return result;
  }

  return sub_259D21488();
}

uint64_t sub_259D21A58()
{
  swift_getKeyPath();
  sub_259D2289C();
  sub_259D623E8();
  swift_release();
  return *(void *)(v0 + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___assetCount);
}

uint64_t (*PhotosObservableCollectionTitleModel.assetCount.modify(uint64_t a1))(uint64_t a1)
{
  OUTLINED_FUNCTION_7_4(a1);
  *(void *)uint64_t v1 = sub_259D21A58();
  *(unsigned char *)(v1 + 8) = v2 & 1;
  return sub_259D21B24;
}

uint64_t sub_259D21B24(uint64_t a1)
{
  return PhotosObservableCollectionTitleModel.assetCount.setter(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_259D21B54()
{
  return sub_259D623D8();
}

uint64_t sub_259D21BE0()
{
  return OUTLINED_FUNCTION_8_3();
}

uint64_t sub_259D21C28(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = (void *)(a1 + *a4);
  *uint64_t v4 = a2;
  v4[1] = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_259D21C6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_259D21A58();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_259D21CA0()
{
  return sub_259D21488();
}

uint64_t PhotosObservableCollectionTitleModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel_id;
  sub_259D62318();
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___observationRegistrar;
  sub_259D62408();
  OUTLINED_FUNCTION_3();
  (*(void (**)(uint64_t))(v4 + 8))(v3);
  return v0;
}

uint64_t PhotosObservableCollectionTitleModel.__deallocating_deinit()
{
  PhotosObservableCollectionTitleModel.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_259D21E00()
{
  return PhotosObservableCollectionTitleModel.title.getter();
}

uint64_t sub_259D21E24()
{
  return PhotosObservableCollectionTitleModel.subtitle.getter();
}

uint64_t sub_259D21E48()
{
  return PhotosObservableCollectionTitleModel.symbolName.getter();
}

uint64_t sub_259D21E6C()
{
  return PhotosObservableCollectionTitleModel.assetCount.getter();
}

uint64_t sub_259D21E94()
{
  OUTLINED_FUNCTION_2_13();
  uint64_t result = PhotosObservableCollectionTitleModel.title.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_259D21EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_259D21614(a1, a2, a3, a4, (uint64_t (*)(uint64_t))PhotosObservableCollectionTitleModel.title.setter);
}

uint64_t sub_259D21EE8()
{
  OUTLINED_FUNCTION_2_13();
  uint64_t result = PhotosObservableCollectionTitleModel.subtitle.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_259D21F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_259D21614(a1, a2, a3, a4, (uint64_t (*)(uint64_t))PhotosObservableCollectionTitleModel.subtitle.setter);
}

uint64_t sub_259D21F3C()
{
  OUTLINED_FUNCTION_2_13();
  uint64_t result = PhotosObservableCollectionTitleModel.symbolName.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_259D21F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_259D21614(a1, a2, a3, a4, (uint64_t (*)(uint64_t))PhotosObservableCollectionTitleModel.symbolName.setter);
}

uint64_t dispatch thunk of PhotosCollectionTitleModel.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PhotosCollectionTitleModel.subtitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PhotosCollectionTitleModel.symbolName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PhotosCollectionTitleModel.assetCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t *initializeBufferWithCopyOfBuffer for PhotosStaticCollectionTitleModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_259D62318();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    uint64_t v18 = (uint64_t *)((char *)a1 + v16);
    id v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    id v21 = (char *)a1 + v17;
    uint64_t v22 = (char *)a2 + v17;
    *(void *)id v21 = *(void *)v22;
    v21[8] = v22[8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for PhotosStaticCollectionTitleModel(uint64_t a1)
{
  uint64_t v2 = sub_259D62318();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PhotosStaticCollectionTitleModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_259D62318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v15);
  uint64_t v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a1 + v16;
  uint64_t v21 = a2 + v16;
  *(void *)uint64_t v20 = *(void *)v21;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PhotosStaticCollectionTitleModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_259D62318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v19 = *v18;
  *(unsigned char *)(v17 + 8) = *((unsigned char *)v18 + 8);
  *(void *)uint64_t v17 = v19;
  return a1;
}

uint64_t initializeWithTake for PhotosStaticCollectionTitleModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_259D62318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  return a1;
}

uint64_t assignWithTake for PhotosStaticCollectionTitleModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_259D62318();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[8];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  *(void *)uint64_t v23 = *(void *)v24;
  *(unsigned char *)(v23 + 8) = *(unsigned char *)(v24 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosStaticCollectionTitleModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_259D22544);
}

uint64_t sub_259D22544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_259D62318();
  OUTLINED_FUNCTION_0_10();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for PhotosStaticCollectionTitleModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_259D225F4);
}

void sub_259D225F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_259D62318();
  OUTLINED_FUNCTION_0_10();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
}

uint64_t sub_259D22680()
{
  uint64_t result = sub_259D62318();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_259D22724()
{
  return type metadata accessor for PhotosObservableCollectionTitleModel(0);
}

uint64_t type metadata accessor for PhotosObservableCollectionTitleModel(uint64_t a1)
{
  return sub_259D2274C(a1, (uint64_t *)&unk_26A3ECC20);
}

uint64_t sub_259D2274C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_259D22780()
{
  uint64_t result = sub_259D62318();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_259D62408();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for PhotosObservableCollectionTitleModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosObservableCollectionTitleModel);
}

uint64_t dispatch thunk of PhotosObservableCollectionTitleModel.__allocating_init(title:subtitle:symbolName:assetCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v8 + 128))(a1, a2, a3, a4, a5, a6, a7, a8 & 1);
}

unint64_t sub_259D2289C()
{
  unint64_t result = qword_26A3ECC18;
  if (!qword_26A3ECC18)
  {
    type metadata accessor for PhotosObservableCollectionTitleModel(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3ECC18);
  }
  return result;
}

uint64_t sub_259D228EC()
{
  OUTLINED_FUNCTION_2_13();
  uint64_t result = _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC10symbolNameSSSgvg_0();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_259D22914()
{
  return sub_259D21BE0();
}

uint64_t sub_259D22948()
{
  OUTLINED_FUNCTION_2_13();
  uint64_t result = _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC8subtitleSSSgvg_0();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_259D22970()
{
  return sub_259D21BE0();
}

uint64_t sub_259D229A4()
{
  OUTLINED_FUNCTION_2_13();
  uint64_t result = _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC5titleSSSgvg_0();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_259D229CC()
{
  return sub_259D21BE0();
}

void sub_259D22A00()
{
  char v1 = *(unsigned char *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 16) + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___assetCount;
  *(void *)uint64_t v2 = *(void *)(v0 + 24);
  *(unsigned char *)(v2 + 8) = v1;
}

uint64_t sub_259D22A20()
{
  return sub_259D21C28(v0[2], v0[3], v0[4], &OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___symbolName);
}

uint64_t sub_259D22A48()
{
  return sub_259D21C28(v0[2], v0[3], v0[4], &OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___subtitle);
}

uint64_t sub_259D22A70()
{
  return sub_259D21C28(v0[2], v0[3], v0[4], OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___title);
}

id MenuGroupAction.__allocating_init(group:title:systemImageName:role:state:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11)
{
  uint64_t v17 = a7 & 1;
  id v18 = objc_allocWithZone(v11);
  LOBYTE(v20) = a9 & 1;
  return MenuGroupAction.init(group:title:systemImageName:role:state:handler:)(a1, a2, a3, a4, a5, a6, v17, a8, v20, a10, a11);
}

id MenuGroupAction.init(group:title:systemImageName:role:state:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v15 = (char *)v11 + *(void *)((*MEMORY[0x263F8EED0] & *v11) + 0x60);
  uint64_t v16 = sub_259D62B68();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, a1, v16);
  OUTLINED_FUNCTION_0_11();
  uint64_t v19 = (void *)((char *)v11 + *(void *)(v18 + 104));
  *uint64_t v19 = a2;
  v19[1] = a3;
  OUTLINED_FUNCTION_0_11();
  uint64_t v21 = (void *)((char *)v11 + *(void *)(v20 + 112));
  *uint64_t v21 = a4;
  v21[1] = a5;
  OUTLINED_FUNCTION_2_14();
  *(void *)((char *)v11 + *(void *)(v22 + 120)) = v23;
  OUTLINED_FUNCTION_2_14();
  *(void *)((char *)v11 + *(void *)(v24 + 128)) = v25;
  OUTLINED_FUNCTION_0_11();
  id v27 = (void *)((char *)v11 + *(void *)(v26 + 136));
  *id v27 = a10;
  v27[1] = a11;
  v32.receiver = v11;
  v32.super_class = (Class)type metadata accessor for MenuGroupAction();
  id v28 = objc_msgSendSuper2(&v32, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a1, v16);
  return v28;
}

uint64_t type metadata accessor for MenuGroupAction()
{
  return __swift_instantiateGenericMetadata();
}

id MenuGroupAction.__allocating_init<A>(group:menuAction:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = a3;
  uint64_t v6 = *(void *)(v3 + 80);
  uint64_t v7 = sub_259D62B68();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  uint64_t v11 = (char *)&v27 - v10;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v30 = a1;
  v12((char *)&v27 - v10, a1, v7);
  id v13 = objc_msgSend(a2, sel_title);
  uint64_t v14 = sub_259D62648();
  uint64_t v27 = v15;
  uint64_t v28 = v14;

  id v16 = objc_msgSend(a2, sel_systemImageName);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = sub_259D62648();
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v20 = 0;
  }
  id v21 = objc_msgSend(a2, sel_role);
  id v22 = objc_msgSend(a2, sel_state);
  uint64_t v23 = (void *)swift_allocObject();
  uint64_t v24 = v29;
  long long v23[2] = v6;
  void v23[3] = v24;
  v23[4] = *(void *)(v3 + 88);
  v23[5] = a2;
  id v25 = MenuGroupAction.__allocating_init(group:title:systemImageName:role:state:handler:)((uint64_t)v11, v28, v27, v18, v20, (uint64_t)v21, 0, (uint64_t)v22, 0, (uint64_t)sub_259D22F8C, (uint64_t)v23);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v30, v7);
  return v25;
}

uint64_t sub_259D22F54()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

id sub_259D22F8C()
{
  return objc_msgSend(*(id *)(v0 + 40), sel_performAction);
}

uint64_t MenuGroupAction.group.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_3_10();
  uint64_t v4 = v1 + *(void *)(v3 + 96);
  OUTLINED_FUNCTION_3_10();
  uint64_t v5 = sub_259D62B68();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a1, v4, v5);
}

id sub_259D23044()
{
  MenuGroupAction.title.getter();
  uint64_t v0 = (void *)sub_259D62638();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t MenuGroupAction.title.getter()
{
  uint64_t v1 = *(void *)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x68));
  swift_bridgeObjectRetain();
  return v1;
}

id sub_259D230E8()
{
  return 0;
}

id sub_259D230F0()
{
  MenuGroupAction.systemImageName.getter();
  if (v0)
  {
    uint64_t v1 = (void *)sub_259D62638();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

uint64_t MenuGroupAction.systemImageName.getter()
{
  uint64_t v1 = *(void *)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x70));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_259D231A0()
{
  return MenuGroupAction.role.getter();
}

uint64_t MenuGroupAction.role.getter()
{
  return *(void *)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x78));
}

uint64_t sub_259D231F0()
{
  return MenuGroupAction.state.getter();
}

uint64_t MenuGroupAction.state.getter()
{
  return *(void *)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x80));
}

id sub_259D23240()
{
  return 0;
}

uint64_t sub_259D23248()
{
  return (*(uint64_t (**)(void))((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x88)))();
}

void sub_259D23298(void *a1)
{
  id v1 = a1;
  sub_259D23248();
}

id MenuGroupAction.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void MenuGroupAction.init()()
{
}

void sub_259D23344()
{
}

id MenuGroupAction.__deallocating_deinit()
{
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_3_10();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MenuGroupAction();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_259D233C0()
{
  uint64_t result = sub_259D62B68();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_259D23484(void *a1)
{
  unint64_t v1 = (char *)a1 + *(void *)((*MEMORY[0x263F8EED0] & *a1) + 0x60);
  uint64_t v2 = sub_259D62B68();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  OUTLINED_FUNCTION_1_16();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_16();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_16();

  return swift_release();
}

uint64_t method lookup function for MenuGroupAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MenuGroupAction);
}

uint64_t dispatch thunk of MenuGroupAction.__allocating_init(group:title:systemImageName:role:state:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v7 + 144))(a1, a2, a3, a4, a5, a6, a7 & 1);
}

uint64_t dispatch thunk of MenuGroupAction.image.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of MenuGroupAction.alternate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of MenuGroupAction.perform()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t PhotosItemListChangeDetailsRepository.__allocating_init(countLimit:)(uint64_t a1)
{
  OUTLINED_FUNCTION_3_11();
  uint64_t v2 = swift_allocObject();
  PhotosItemListChangeDetailsRepository.init(countLimit:)(a1);
  return v2;
}

uint64_t sub_259D2369C(uint64_t result)
{
  if (!result) {
    return result;
  }
  if (result < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t result = sub_259D23DA0(0, result, *(void *)(*(void *)v1 + 16));
  if (v2)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  if (result < 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  return sub_259D23C98(0, result);
}

uint64_t PhotosItemListChangeDetailsRepository.countLimit.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_259D2370C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_259D10224((void *)(v1 + 16), &v14);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  uint64_t v2 = v14;
  swift_release();
  int64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_259D23A18(0, v3, 0);
    uint64_t v4 = v16;
    uint64_t v5 = (void *)(v2 + 48);
    do
    {
      uint64_t v6 = *v5;
      long long v14 = *((_OWORD *)v5 - 1);
      uint64_t v15 = v6;
      uint64_t v7 = PhotosItemListChangeDetails.description.getter();
      uint64_t v9 = v8;
      uint64_t v16 = v4;
      unint64_t v11 = *(void *)(v4 + 16);
      unint64_t v10 = *(void *)(v4 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_259D23A18((char *)(v10 > 1), v11 + 1, 1);
        uint64_t v4 = v16;
      }
      *(void *)(v4 + 16) = v11 + 1;
      uint64_t v12 = v4 + 16 * v11;
      *(void *)(v12 + 32) = v7;
      *(void *)(v12 + 40) = v9;
      v5 += 3;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x263F8EE78];
  }
  *(void *)&long long v14 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED2D0);
  sub_259D07A24();
  sub_259D625B8();
  swift_bridgeObjectRelease();
  *(void *)&long long v14 = 0;
  *((void *)&v14 + 1) = 0xE000000000000000;
  sub_259D62C48();
  sub_259D62688();
  uint64_t v16 = v0;
  sub_259D62D98();
  sub_259D62688();
  sub_259D62688();
  swift_bridgeObjectRelease();
  sub_259D62688();
  return v14;
}

uint64_t PhotosItemListChangeDetailsRepository.deinit()
{
  swift_release();
  return v0;
}

uint64_t PhotosItemListChangeDetailsRepository.__deallocating_deinit()
{
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_3_11();

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_259D2399C()
{
  return sub_259D2370C();
}

char *sub_259D239C0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_15();
    uint64_t result = (char *)OUTLINED_FUNCTION_1_17();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_12(a3, result);
  }
  return result;
}

char *sub_259D23A18(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_259D23AD0(a1, a2, a3, *v3);
  *int64_t v3 = (uint64_t)result;
  return result;
}

uint64_t method lookup function for PhotosItemListChangeDetailsRepository(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosItemListChangeDetailsRepository);
}

uint64_t dispatch thunk of PhotosItemListChangeDetailsRepository.__allocating_init(countLimit:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of PhotosItemListChangeDetailsRepository.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of PhotosItemListChangeDetailsRepository.changeDetails<A, B>(from:to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

char *sub_259D23AD0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A3ED2E0);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_259CFBF2C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_259D07B70((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_259D23BB4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A3EDB50);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_259D239C0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_259D07C28(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_259D23C98(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *((void *)v4 + 3) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_259CEFAC8(isUniquelyReferenced_nonNull_native, v11, 1, (uint64_t)v4);
  }
  uint64_t v12 = &v4[24 * v6 + 32];
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v13 = *((void *)v4 + 2);
  if (__OFSUB__(v13, a2)) {
    goto LABEL_22;
  }
  uint64_t result = (uint64_t)sub_259CEFDBC(&v4[24 * a2 + 32], v13 - a2, v12);
  uint64_t v14 = *((void *)v4 + 2);
  BOOL v15 = __OFADD__(v14, v8);
  uint64_t v16 = v14 - v7;
  if (!v15)
  {
    *((void *)v4 + 2) = v16;
LABEL_16:
    *uint64_t v2 = v4;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_259D23DA0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2) {
      return 0;
    }
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  BOOL v5 = __OFADD__(result, a2);
  result += a2;
  if (v5) {
    goto LABEL_14;
  }
  return result;
}

unint64_t PXImageDynamicRange.description.getter(uint64_t a1)
{
  uint64_t v1 = a1 + 1;
  unint64_t result = 0x6669636570736E55;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0x647261646E617453;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 1751607624;
      break;
    default:
      unint64_t result = 16191;
      break;
  }
  return result;
}

unint64_t sub_259D23E94()
{
  return PXImageDynamicRange.description.getter(*v0);
}

uint64_t UniqueAddress._placeholder.getter()
{
  return *v0;
}

uint64_t UniqueAddress._placeholder.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*UniqueAddress._placeholder.modify())(void)
{
  return nullsub_1;
}

CGFloat CGAffineTransform.uniformlyScaled(by:)@<D0>(_OWORD *a1@<X8>, CGFloat a2@<D0>)
{
  long long v4 = v2[1];
  *(_OWORD *)&v9.CGFloat a = *v2;
  *(_OWORD *)&v9.CGFloat c = v4;
  *(_OWORD *)&v9.CGFloat tx = v2[2];
  CGAffineTransformScale(&v8, &v9, a2, a2);
  CGFloat result = v8.a;
  long long v6 = *(_OWORD *)&v8.c;
  long long v7 = *(_OWORD *)&v8.tx;
  *a1 = *(_OWORD *)&v8.a;
  a1[1] = v6;
  a1[2] = v7;
  return result;
}

__C::CGRect __swiftcall CGRect.offsetBy(_:)(CGPoint a1)
{
  double v5 = a1.x + v1;
  double v6 = a1.y + v2;
  double v7 = v3;
  double v8 = v4;
  result.size.height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

__C::CGRect __swiftcall CGRect.insetBy(_:)(CGSize a1)
{
  double v5 = PXEdgeInsetsInsetRect(v1, v2, v3, v4, a1.height, a1.width);
  result.size.height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

__C::CGRect __swiftcall CGRect.insetBy(_:)(UIEdgeInsets a1)
{
  double v5 = PXEdgeInsetsInsetRect(v1, v2, v3, v4, a1.top, a1.left);
  result.size.height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

void CGRect.rounded(accuracy:)(double a1, double a2, double a3, double a4, double a5)
{
  if (a1 <= 0.0)
  {
    sub_259D62DD8();
    __break(1u);
  }
  else
  {
    PXRectRoundToPixel(a2, a3, a4, a5, 1.0 / a1);
  }
}

double CGRect.scaledFromCenter(by:)()
{
  OUTLINED_FUNCTION_11_2();
  double v2 = v1;
  v9.origin.CGFloat x = v3;
  v9.origin.CGFloat y = v4;
  v9.size.CGFloat width = v5;
  v9.size.height = v6;
  double MidX = CGRectGetMidX(v9);
  OUTLINED_FUNCTION_9_2();
  return MidX - v2 * v0 * 0.5;
}

__C::CGRect __swiftcall CGRect.init(center:size:)(CGPoint center, CGSize size)
{
  double v2 = center.x - size.width * 0.5;
  double v3 = center.y - size.height * 0.5;
  result.size.height = size.height;
  result.size.CGFloat width = size.width;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

double CGRect.topLeft.getter()
{
  return sub_259CEB9CC(MEMORY[0x263F00178], MEMORY[0x263F00180]);
}

double CGRect.topRight.getter()
{
  return sub_259CEB9CC(MEMORY[0x263F00158], MEMORY[0x263F00180]);
}

double CGRect.bottomLeft.getter()
{
  return sub_259CEB9CC(MEMORY[0x263F00178], MEMORY[0x263F00160]);
}

double CGRect.bottomRight.getter()
{
  return sub_259CEB9CC(MEMORY[0x263F00158], MEMORY[0x263F00160]);
}

void CGRect.aspectRatio.getter(double a1, double a2, double a3, double a4)
{
}

void CGRect.divided(atDistance:from:spacing:)(CGRectEdge edge@<W0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, CGFloat a7@<D4>, CGFloat a8@<D5>)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v21.origin.CGFloat x = a5;
  v21.origin.CGFloat y = a6;
  v21.size.CGFloat width = a7;
  v21.size.CGFloat height = a8;
  CGRectDivide(v21, &slice, &remainder, a3, edge);
  CGPoint origin = slice.origin;
  CGFloat width = slice.size.width;
  CGFloat height = slice.size.height;
  CGRect v22 = remainder;
  memset(&slice, 0, sizeof(slice));
  CGPoint v17 = origin;
  memset(&remainder, 0, sizeof(remainder));
  CGRectDivide(v22, &slice, &remainder, a4, edge);
  CGPoint v15 = remainder.origin;
  CGSize size = remainder.size;
  *(CGPoint *)a2 = v17;
  *(CGFloat *)(a2 + 16) = width;
  *(CGFloat *)(a2 + 24) = height;
  *(CGPoint *)(a2 + 32) = v15;
  *(CGSize *)(a2 + 48) = size;
}

CGFloat CGRect.slice(length:from:)(int a1, double a2, CGFloat a3)
{
  switch(a1)
  {
    case 0:
    case 1:
      return a3;
    case 2:
      v6.origin.CGFloat x = OUTLINED_FUNCTION_5_8();
      a3 = CGRectGetMaxX(v6) - a2;
      break;
    case 3:
      v7.origin.CGFloat x = OUTLINED_FUNCTION_5_8();
      CGRectGetMaxY(v7);
      break;
    default:
      type metadata accessor for CGRectEdge(0);
      sub_259D62EF8();
      __break(1u);
      JUMPOUT(0x259D24330);
  }
  return a3;
}

BOOL CGRect.nilIfNull.getter()
{
  OUTLINED_FUNCTION_7_5();
  uint64_t v5 = v4;
  BOOL result = CGRectIsNull(v11);
  double v7 = 0.0;
  if (result) {
    double v8 = 0.0;
  }
  else {
    double v8 = v3;
  }
  if (result) {
    double v9 = 0.0;
  }
  else {
    double v9 = v2;
  }
  if (result) {
    double v10 = 0.0;
  }
  else {
    double v10 = v1;
  }
  *(double *)uint64_t v5 = v8;
  *(double *)(v5 + 8) = v9;
  if (!result) {
    double v7 = v0;
  }
  *(double *)(v5 + 16) = v10;
  *(double *)(v5 + 24) = v7;
  *(unsigned char *)(v5 + 32) = result;
  return result;
}

double static CGRect.withAspectRatio(_:fitting:)()
{
  return sub_259D24418();
}

double static CGSize.withAspectRatio(_:fitting:)(double a1, double a2, double a3)
{
  double result = 0.0;
  if (a2 != 0.0 && a3 != 0.0)
  {
    if (a2 / a3 <= a1) {
      return a2;
    }
    else {
      return a1 * a3;
    }
  }
  return result;
}

double static CGRect.withAspectRatio(_:filling:)()
{
  return sub_259D24418();
}

double sub_259D24418()
{
  OUTLINED_FUNCTION_11_2();
  double v1 = v0();
  v4.origin.CGFloat x = OUTLINED_FUNCTION_8_4();
  double MidX = CGRectGetMidX(v4);
  OUTLINED_FUNCTION_9_2();
  return MidX - v1 * 0.5;
}

double static CGSize.withAspectRatio(_:filling:)(double a1, double a2, double a3)
{
  double result = 0.0;
  if (a2 != 0.0 && a3 != 0.0)
  {
    if (a2 / a3 >= a1) {
      return a2;
    }
    else {
      return a1 * a3;
    }
  }
  return result;
}

BOOL CGPoint.isNull.getter(double a1, double a2)
{
  return PXPointIsNull(a1, a2);
}

uint64_t CGPoint.nilIfNull.getter(double a1, double a2)
{
  BOOL IsNull = PXPointIsNull(a1, a2);
  return OUTLINED_FUNCTION_2_16(IsNull);
}

double CGSize.aspectRatio.getter(double a1, double a2)
{
  return a1 / a2;
}

Swift::Bool __swiftcall CGSize.hasDimensionLargerThan(_:)(CGSize a1)
{
  return a1.height < v2 || a1.width < v1;
}

CGSize __swiftcall CGSize.roundedToEven()()
{
  double v1 = round(v0 * 0.5);
  double v2 = OUTLINED_FUNCTION_10_3(v1 + v1);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

double CGSize.init(from:)(float32x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vcvtq_f64_f32(a1);
  return result;
}

double static CGSize.+ infix(_:_:)(double a1, double a2, double a3)
{
  return a1 + a3;
}

double CGSize.interpolated(towards:amount:)(double a1, double a2, double a3, double a4)
{
  return (a1 - a4) * a3 + a4;
}

CGSize __swiftcall CGSize.insetBy(_:)(UIEdgeInsets a1)
{
  double v3 = v1 - a1.left - a1.right;
  double v4 = v2 - a1.top - a1.bottom;
  double v5 = v3;
  result.CGFloat height = v4;
  result.CGFloat width = v5;
  return result;
}

uint64_t CGSize.nilIfNull.getter(double a1, double a2)
{
  BOOL IsNull = PXSizeIsNull(a1, a2);
  return OUTLINED_FUNCTION_2_16(IsNull);
}

uint64_t CGSize.isValid.getter()
{
  return PXSizeIsValid();
}

double * infix(_:_:)(double a1, double a2, double a3)
{
  return a1 * a3;
}

__n128 **= infix(_:_:)(__n128 *a1, float64x2_t a2, float64_t a3)
{
  a2.f64[1] = a3;
  return OUTLINED_FUNCTION_3_12(a1, (__n128)vmulq_f64(*(float64x2_t *)a1, a2));
}

__n128 **= infix(_:_:)(__n128 *a1, double a2)
{
  return OUTLINED_FUNCTION_3_12(a1, (__n128)vmulq_n_f64(*(float64x2_t *)a1, a2));
}

double / infix(_:_:)(double a1, double a2, double a3)
{
  return a1 / a3;
}

__n128 */= infix(_:_:)(__n128 *a1, float64x2_t a2, float64_t a3)
{
  a2.f64[1] = a3;
  return OUTLINED_FUNCTION_3_12(a1, (__n128)vdivq_f64(*(float64x2_t *)a1, a2));
}

__n128 */= infix(_:_:)(__n128 *a1, double a2)
{
  return OUTLINED_FUNCTION_3_12(a1, (__n128)vdivq_f64(*(float64x2_t *)a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0)));
}

BOOL CGFloat.isEqual(to:tolerance:)(double a1, double a2, double a3)
{
  return vabdd_f64(a3, a1) <= a2;
}

BOOL CGFloat.isEqual(toAngleInDegrees:tolerance:)(double a1, double a2, double a3)
{
  double v3 = vabdd_f64(a3, a1);
  if (360.0 - v3 < v3) {
    double v3 = 360.0 - v3;
  }
  return fabs(fmod(v3, 360.0)) <= a2;
}

BOOL CGFloat.isEqual(to:modulo:tolerance:)(double a1, long double a2, double a3, double a4)
{
  double v4 = vabdd_f64(a4, a1);
  if (360.0 - v4 < v4) {
    double v4 = 360.0 - v4;
  }
  return fabs(fmod(v4, a2)) <= a3;
}

BOOL CGFloat.isApproximatelyEqual(to:)(double a1, double a2)
{
  return vabdd_f64(a2, a1) <= 0.00001;
}

int64x2_t static PhotosVerticalTextSpecs.default.getter@<Q0>(int64x2_t *a1@<X8>)
{
  int64x2_t result = vdupq_n_s64(1uLL);
  *a1 = result;
  return result;
}

uint64_t PhotosVerticalTextSpecs.maximumNumberOfLinesForTitle.getter()
{
  return *(void *)v0;
}

uint64_t PhotosVerticalTextSpecs.maximumNumberOfLinesForSubtitle.getter()
{
  return *(void *)(v0 + 8);
}

ValueMetadata *type metadata accessor for PhotosVerticalTextSpecs()
{
  return &type metadata for PhotosVerticalTextSpecs;
}

id PXDisplayRect.init(rect:in:)()
{
  OUTLINED_FUNCTION_0_14();
  id v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRect_inCoordinateSpace_, v0, v4, v3, v2, v1);
  swift_unknownObjectRelease();
  return v5;
}

{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v10[8];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  objc_super v17;

  OUTLINED_FUNCTION_0_14();
  id v5 = &v0[OBJC_IVAR___PXDisplayRect_implementation];
  *(_OWORD *)id v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  v5[48] = 1;
  v17.receiver = v0;
  v17.super_class = (Class)PXDisplayRect;
  CGRect v6 = objc_msgSendSuper2(&v17, sel_init);
  uint64_t v12 = v4;
  uint64_t v13 = v3;
  uint64_t v14 = v2;
  CGPoint v15 = v1;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  double v7 = sub_259D62618();
  swift_unknownObjectRelease();
  CGRect v11 = v7;
  uint64_t v16 = 0;
  double v8 = (uint64_t)v6 + OBJC_IVAR___PXDisplayRect_implementation;
  swift_beginAccess();
  sub_259D24904((uint64_t)v10, v8);
  swift_endAccess();
  return v6;
}

uint64_t sub_259D24904(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3EC8B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_259D24A14()
{
  uint64_t v1 = v0 + OBJC_IVAR___PXDisplayRect_implementation;
  OUTLINED_FUNCTION_1_19();
  uint64_t result = sub_259D250DC(v1, (uint64_t)v5, &qword_26A3EC8B8);
  if (v5[48])
  {
    __break(1u);
  }
  else
  {
    sub_259D250DC((uint64_t)v5, (uint64_t)v4, (uint64_t *)&unk_26A3EC9D0);
    uint64_t v3 = MEMORY[0x25A2EAC90](v4);
    sub_259D1BF30((uint64_t)v4, (uint64_t *)&unk_26A3EC9D0);
    sub_259D24CE0((uint64_t)v5);
    return v3;
  }
  return result;
}

uint64_t PXDisplayRect.isEqual(_:)(uint64_t a1)
{
  sub_259D250DC(a1, (uint64_t)v12, qword_26A3EC4B0);
  if (!v13)
  {
    sub_259D1BF30((uint64_t)v12, qword_26A3EC4B0);
    goto LABEL_8;
  }
  type metadata accessor for PXDisplayRect();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    LOBYTE(v5) = 0;
    return v5 & 1;
  }
  double v2 = (void *)v17[0];
  uint64_t v3 = v17[0] + OBJC_IVAR___PXDisplayRect_implementation;
  OUTLINED_FUNCTION_1_19();
  sub_259D250DC(v3, (uint64_t)v17, &qword_26A3EC8B8);
  uint64_t v4 = v1 + OBJC_IVAR___PXDisplayRect_implementation;
  OUTLINED_FUNCTION_1_19();
  sub_259D250DC((uint64_t)v17, (uint64_t)v12, &qword_26A3EC8B8);
  sub_259D250DC(v4, (uint64_t)v15, &qword_26A3EC8B8);
  if (v14)
  {

    sub_259D1BF30((uint64_t)v17, &qword_26A3EC8B8);
    int v5 = v16 << 31 >> 31;
    if (v16) {
      CGRect v6 = &qword_26A3EC8B8;
    }
    else {
      CGRect v6 = (uint64_t *)&unk_26A3EDB68;
    }
  }
  else
  {
    sub_259D250DC((uint64_t)v12, (uint64_t)v10, &qword_26A3EC8B8);
    if (v16)
    {

      sub_259D1BF30((uint64_t)v17, &qword_26A3EC8B8);
      sub_259D24CE0((uint64_t)v10);
      LOBYTE(v5) = 0;
      CGRect v6 = (uint64_t *)&unk_26A3EDB68;
    }
    else
    {
      sub_259D24D34((uint64_t)v15, (uint64_t)v8);
      LOBYTE(v5) = sub_259D0F30C((uint64_t)v10, (uint64_t)v8) && CGRectEqualToRect(v11, v9);

      sub_259D24CE0((uint64_t)v8);
      CGRect v6 = &qword_26A3EC8B8;
      sub_259D1BF30((uint64_t)v17, &qword_26A3EC8B8);
      sub_259D24CE0((uint64_t)v10);
    }
  }
  sub_259D1BF30((uint64_t)v12, v6);
  return v5 & 1;
}

unint64_t type metadata accessor for PXDisplayRect()
{
  unint64_t result = qword_26A3EC018;
  if (!qword_26A3EC018)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A3EC018);
  }
  return result;
}

uint64_t sub_259D24CE0(uint64_t a1)
{
  return a1;
}

uint64_t sub_259D24D34(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_259D24E10(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___PXDisplayRect_implementation;
  OUTLINED_FUNCTION_1_19();
  uint64_t result = sub_259D250DC(v3, (uint64_t)v7, &qword_26A3EC8B8);
  if (v12)
  {
    __break(1u);
  }
  else
  {
    sub_259D250DC((uint64_t)v7, (uint64_t)v6, (uint64_t *)&unk_26A3EC9D0);
    int v5 = (void *)MEMORY[0x25A2EAC90](v6);
    sub_259D1BF30((uint64_t)v6, (uint64_t *)&unk_26A3EC9D0);
    if (v5)
    {
      objc_msgSend(v5, sel_convertRect_toCoordinateSpace_, a1, v8, v9, v10, v11);
      swift_unknownObjectRelease();
    }
    return sub_259D24CE0((uint64_t)v7);
  }
  return result;
}

id sub_259D24F94@<X0>(void *a1@<X8>)
{
  a1[3] = type metadata accessor for PXDisplayRect();
  *a1 = v3;

  return v3;
}

void __swiftcall PXDisplayRect.init()(PXDisplayRect *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v1, sel_init);
}

void PXDisplayRect.init()()
{
}

uint64_t sub_259D250DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t PhotosFilteredItemList.__allocating_init(originalItemList:removedId:insertedItem:allowedIds:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  PhotosFilteredItemList.init(originalItemList:removedId:insertedItem:allowedIds:)(a1, a2, a3, a4);
  return v8;
}

char *PhotosFilteredItemList.init(originalItemList:removedId:insertedItem:allowedIds:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v144 = a4;
  uint64_t v151 = a3;
  uint64_t v152 = a2;
  uint64_t v153 = a1;
  uint64_t v5 = *v4;
  uint64_t v6 = *(void *)(*v4 + 88);
  double v7 = *(char **)(*v4 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v155 = v6;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v9 = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v140 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v138 = v10;
  MEMORY[0x270FA5388](v11, v12);
  OUTLINED_FUNCTION_1_11();
  uint64_t v158 = v13;
  MEMORY[0x270FA5388](v14, v15);
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x270FA5388](v16, v17);
  uint64_t v157 = (char *)&v122 - v18;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_26A3EDB70);
  uint64_t v19 = swift_getTupleTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v124 = v20;
  MEMORY[0x270FA5388](v21, v22);
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x270FA5388](v23, v24);
  v134 = (char *)&v122 - v25;
  uint64_t v26 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v28 = v27;
  uint64_t v31 = MEMORY[0x270FA5388](v29, v30);
  uint64_t v130 = (char *)&v122 - v32;
  uint64_t v141 = v9;
  uint64_t v147 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v31, v33);
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x270FA5388](v34, v35);
  id v122 = (char *)&v122 - v36;
  uint64_t v37 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v150 = v38;
  MEMORY[0x270FA5388](v39, v40);
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x270FA5388](v41, v42);
  uint64_t v44 = (char *)&v122 - v43;
  uint64_t v133 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v132 = v45;
  MEMORY[0x270FA5388](v46, v47);
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x270FA5388](v48, v49);
  id v51 = (char *)&v122 - v50;
  uint64_t v52 = *(void *)(v5 + 152);
  *(uint64_t *)((char *)v4 + v52) = PXDataSourceIdentifierMakeUnique();
  OUTLINED_FUNCTION_16_1();
  uint64_t v136 = *((void *)v7 - 1);
  v149 = v7;
  OUTLINED_FUNCTION_6_1();
  v53();
  uint64_t v54 = *(void *)(*v4 + 112);
  uint64_t v154 = (char *)v4;
  uint64_t v55 = (uint64_t)v4 + v54;
  uint64_t v142 = v28;
  uint64_t v56 = v150;
  BOOL v57 = *(void (**)(void, void, void))(v28 + 16);
  uint64_t v148 = v26;
  uint64_t v126 = v28 + 16;
  BOOL v125 = v57;
  v57(v55, v152, v26);
  uint64_t v58 = *(void *)(v56 + 16);
  uint64_t v129 = v56 + 16;
  uint64_t v128 = v58;
  OUTLINED_FUNCTION_6_1();
  v59();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v44, 1, v19);
  uint64_t v146 = v37;
  uint64_t v135 = v19;
  if (EnumTagSinglePayload == 1)
  {
    (*(void (**)(char *, uint64_t))(v56 + 8))(v44, v37);
    uint64_t v61 = 1;
  }
  else
  {
    OUTLINED_FUNCTION_1_14();
    (*(void (**)(char *))(v62 + 32))(v51);
    uint64_t v61 = 0;
  }
  uint64_t v156 = AssociatedTypeWitness;
  __swift_storeEnumTagSinglePayload((uint64_t)v51, v61, 1, AssociatedTypeWitness);
  uint64_t v63 = v154;
  uint64_t v64 = (void (*)(char *, char *, uint64_t))*((void *)v132 + 4);
  uint64_t v65 = v133;
  v64(&v63[*(void *)(*(void *)v63 + 120)], v51, v133);
  *(void *)&v63[*(void *)(*(void *)v63 + 104)] = v144;
  uint64_t v66 = v155;
  double v67 = *(void (**)(char *, uint64_t))(v155 + 104);
  swift_bridgeObjectRetain();
  double v68 = v127;
  double v69 = v149;
  v67(v149, v66);
  v64(&v63[*(void *)(*(void *)v63 + 144)], v68, v65);
  CGRect v70 = *(uint64_t (**)(char *, char *))(v66 + 48);
  uint64_t v133 = v66 + 48;
  uint64_t v132 = v70;
  uint64_t v71 = v70(v69, (char *)v66);
  uint64_t v164 = v71;
  uint64_t v72 = (uint64_t)v130;
  OUTLINED_FUNCTION_6_1();
  v73();
  uint64_t v74 = v141;
  if (__swift_getEnumTagSinglePayload(v72, 1, v141) == 1)
  {
    uint64_t v75 = OUTLINED_FUNCTION_12_2();
    v76(v75);
    unint64_t v77 = v134;
  }
  else
  {
    uint64_t v78 = v147;
    uint64_t v79 = v122;
    (*(void (**)(char *, uint64_t, uint64_t))(v147 + 32))(v122, v72, v74);
    v159[0] = v71;
    OUTLINED_FUNCTION_15_2();
    swift_getWitnessTable();
    swift_getAssociatedConformanceWitness();
    sub_259D62A98();
    unint64_t v77 = v134;
    if (v162 == 1)
    {
      (*(void (**)(char *, uint64_t))(v78 + 8))(v79, v74);
    }
    else
    {
      uint64_t v80 = v143;
      sub_259D62838();
      unint64_t v81 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
      v81(v80, v74);
      v81((uint64_t)v79, v74);
    }
  }
  uint64_t v82 = v131;
  OUTLINED_FUNCTION_6_1();
  v83();
  uint64_t v84 = v135;
  if (__swift_getEnumTagSinglePayload(v82, 1, v135) == 1)
  {
    uint64_t v85 = OUTLINED_FUNCTION_12_2();
    uint64_t v87 = v86(v85);
  }
  else
  {
    uint64_t v89 = &v77[*(int *)(v84 + 48)];
    uint64_t v90 = *(void *)v82;
    int v91 = *(unsigned __int8 *)(v82 + 8);
    *(void *)unint64_t v77 = *(void *)v82;
    v77[8] = v91;
    uint64_t v92 = v156;
    OUTLINED_FUNCTION_0_0();
    uint64_t v94 = v93;
    (*(void (**)(char *))(v95 + 32))(v89);
    uint64_t v96 = v123;
    uint64_t v97 = (char *)v123 + *(int *)(v84 + 48);
    void *v123 = v90;
    *((unsigned char *)v96 + 8) = v91;
    OUTLINED_FUNCTION_6_1();
    v98();
    (*(void (**)(char *, uint64_t))(v94 + 8))(v97, v92);
    uint64_t v74 = v141;
    (*(void (**)(uint64_t))(AssociatedConformanceWitness + 64))(v92);
    OUTLINED_FUNCTION_15_2();
    uint64_t v99 = (uint64_t (**)(char *, uint64_t))(v124 + 8);
    if (v91 == 1) {
      sub_259D62818();
    }
    else {
      sub_259D62828();
    }
    uint64_t v87 = (*v99)(v77, v84);
  }
  uint64_t v100 = v138;
  uint64_t v101 = v139;
  uint64_t v102 = v164;
  uint64_t v103 = (char *)v155;
  uint64_t v104 = (char *)v144;
  if (v144)
  {
    uint64_t v161 = v164;
    MEMORY[0x270FA5388](v87, v88);
    *(&v122 - 4) = v69;
    *(&v122 - 3) = v103;
    *(&v122 - 2) = v104;
    OUTLINED_FUNCTION_15_2();
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    uint64_t v102 = sub_259D62CD8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v164 = v102;
  }
  *(void *)&v154[*(void *)(*(void *)v154 + 160)] = v102;
  uint64_t v144 = v102;
  swift_bridgeObjectRetain();
  uint64_t v141 = swift_getTupleTypeMetadata2();
  sub_259D627D8();
  uint64_t v156 = swift_getAssociatedConformanceWitness();
  uint64_t v163 = sub_259D62548();
  uint64_t v161 = v132(v69, v103);
  uint64_t v105 = OUTLINED_FUNCTION_15_2();
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x25A2E8E50](v159, v105, WitnessTable);
  swift_bridgeObjectRelease();
  uint64_t v160 = v159[0];
  uint64_t v138 = sub_259D62E38();
  sub_259D62E08();
  uint64_t AssociatedConformanceWitness = v105;
  uint64_t v139 = WitnessTable;
  uint64_t v155 = sub_259D62E28();
  sub_259D62E18();
  uint64_t v107 = *(void (**)(char *, uint64_t, uint64_t))(v100 + 32);
  uint64_t v108 = (uint64_t)v157;
  v107(v157, v101, v140);
  uint64_t v109 = TupleTypeMetadata2;
  int v110 = __swift_getEnumTagSinglePayload(v108, 1, TupleTypeMetadata2);
  uint64_t v111 = v143;
  if (v110 != 1)
  {
    uint64_t v112 = *(void (**)(uint64_t, char *, uint64_t))(v147 + 32);
    do
    {
      v112(v111, &v157[*(int *)(v109 + 48)], v74);
      OUTLINED_FUNCTION_14_2();
      sub_259D62568();
      sub_259D62588();
      OUTLINED_FUNCTION_7_6();
      uint64_t v113 = OUTLINED_FUNCTION_3_13();
      ((void (*)(uint64_t))v107)(v113);
      OUTLINED_FUNCTION_5_9();
    }
    while (!v114);
  }
  swift_bridgeObjectRelease();
  *(void *)&v154[*(void *)(*(void *)v154 + 128)] = v163;
  sub_259D627D8();
  uint64_t v160 = sub_259D62548();
  uint64_t v161 = v144;
  MEMORY[0x25A2E8E50](v159, AssociatedConformanceWitness, v139);
  swift_bridgeObjectRelease();
  v159[2] = v159[0];
  sub_259D62E08();
  OUTLINED_FUNCTION_7_6();
  uint64_t v115 = OUTLINED_FUNCTION_3_13();
  ((void (*)(uint64_t))v107)(v115);
  OUTLINED_FUNCTION_5_9();
  if (!v114)
  {
    id v116 = *(void (**)(uint64_t, uint64_t, uint64_t))(v147 + 32);
    do
    {
      v116(v111, v158 + *(int *)(v109 + 48), v74);
      OUTLINED_FUNCTION_14_2();
      sub_259D62568();
      sub_259D62588();
      OUTLINED_FUNCTION_7_6();
      uint64_t v117 = OUTLINED_FUNCTION_3_13();
      ((void (*)(uint64_t))v107)(v117);
      OUTLINED_FUNCTION_5_9();
    }
    while (!v114);
  }
  OUTLINED_FUNCTION_15();
  v118();
  OUTLINED_FUNCTION_15();
  v119();
  OUTLINED_FUNCTION_15();
  v120();
  swift_bridgeObjectRelease();
  uint64_t result = (uint64_t *)v154;
  *(void *)&v154[*(void *)(*(void *)v154 + 136)] = v160;
  return (char *)result;
}

uint64_t sub_259D26008()
{
  return sub_259D62948() & 1;
}

uint64_t PhotosFilteredItemList.originalItemList.getter()
{
  OUTLINED_FUNCTION_19();
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(v0 + 80) - 8) + 16))();
}

uint64_t PhotosFilteredItemList.allowedIds.getter()
{
  return OUTLINED_FUNCTION_6_8();
}

uint64_t PhotosFilteredItemList.placeholderObject.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_19();
  uint64_t v4 = v1 + *(void *)(v3 + 144);
  swift_getAssociatedTypeWitness();
  sub_259D62B68();
  OUTLINED_FUNCTION_3();
  double v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);

  return v7(a1, v4, v5);
}

uint64_t PhotosFilteredItemList.version.getter()
{
  OUTLINED_FUNCTION_16_1();
  return *(void *)(v0 + *(void *)(v1 + 152));
}

uint64_t PhotosFilteredItemList.itemIdentifiers.getter()
{
  return OUTLINED_FUNCTION_6_8();
}

void PhotosFilteredItemList.numberOfItems.getter()
{
  OUTLINED_FUNCTION_19();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();

  JUMPOUT(0x25A2E8F60);
}

uint64_t PhotosFilteredItemList.item(at:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  uint64_t v3 = *(void *)(*(void *)v2 + 88);
  uint64_t v4 = *(void *)(*(void *)v2 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v27 = v7;
  uint64_t v28 = v6;
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v27 - v9;
  swift_getAssociatedConformanceWitness();
  uint64_t v11 = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v12, v13);
  uint64_t v15 = (char *)&v27 - v14;
  sub_259D628A8();
  OUTLINED_FUNCTION_16_1();
  uint64_t v17 = *(void *)(v2 + *(void *)(v16 + 128));
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x25A2E8CD0](&v31, v15, v17, v11, MEMORY[0x263F8D6C8], AssociatedConformanceWitness);
  if (v32)
  {
    uint64_t v19 = v30;
    OUTLINED_FUNCTION_16_1();
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v10, v2 + *(void *)(v20 + 120), v28);
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, AssociatedTypeWitness);
    if (result == 1)
    {
      __break(1u);
    }
    else
    {
      uint64_t v22 = OUTLINED_FUNCTION_13_1();
      v23(v22);
      OUTLINED_FUNCTION_1_14();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v19, v10, AssociatedTypeWitness);
    }
  }
  else
  {
    OUTLINED_FUNCTION_16_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 56))(v31, v4, v3);
    uint64_t v25 = OUTLINED_FUNCTION_13_1();
    return v26(v25);
  }
  return result;
}

uint64_t PhotosFilteredItemList.deinit()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_15();
  v1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_1();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  sub_259D62B68();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_15();
  v2();
  uint64_t v3 = v0 + *(void *)(*(void *)v0 + 120);
  uint64_t v4 = sub_259D62B68();
  OUTLINED_FUNCTION_3();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(v3, v4);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_1();
  v6(v0 + *(void *)(v7 + 144), v4);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PhotosFilteredItemList.__deallocating_deinit()
{
  PhotosFilteredItemList.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

void sub_259D26880()
{
}

uint64_t sub_259D268A4()
{
  return PhotosFilteredItemList.itemIdentifiers.getter();
}

uint64_t sub_259D268C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PhotosFilteredItemList.item(at:)(a1, a2);
}

uint64_t sub_259D268EC@<X0>(uint64_t a1@<X8>)
{
  return PhotosFilteredItemList.placeholderObject.getter(a1);
}

uint64_t sub_259D26910()
{
  return PhotosFilteredItemList.version.getter();
}

uint64_t PhotosFilteredItemList<>.numberOfItemCollections.getter()
{
  OUTLINED_FUNCTION_19();
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v1 + 80));
}

uint64_t PhotosFilteredItemList<>.numberOfCollectionLists.getter()
{
  OUTLINED_FUNCTION_19();
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v1 + 80));
}

uint64_t sub_259D269F4()
{
  return PhotosFilteredItemList<>.numberOfItemCollections.getter();
}

uint64_t sub_259D26A1C()
{
  return PhotosFilteredItemList<>.numberOfCollectionLists.getter();
}

uint64_t sub_259D26A44()
{
  return sub_259D26008() & 1;
}

uint64_t sub_259D26A68()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_259D26A84()
{
  uint64_t v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    uint64_t v0 = sub_259D62B68();
    if (v2 <= 0x3F)
    {
      uint64_t v0 = sub_259D62B68();
      if (v3 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }
  return v0;
}

uint64_t type metadata accessor for PhotosFilteredItemList()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for PhotosFilteredItemList(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosFilteredItemList);
}

uint64_t dispatch thunk of PhotosFilteredItemList.__allocating_init(originalItemList:removedId:insertedItem:allowedIds:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_259D26C90()
{
  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t sub_259D26C98(uint64_t result)
{
  *(unsigned char *)(v1 + 80) = result;
  return result;
}

uint64_t sub_259D26CA0()
{
  return *(void *)(v0 + 88);
}

uint64_t sub_259D26CA8(uint64_t result)
{
  *(void *)(v1 + 88) = result;
  return result;
}

uint64_t sub_259D26CB0(double a1)
{
  uint64_t v2 = v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_5();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7, v8);
  uint64_t v10 = (char *)&v22 - v9;
  double v23 = a1;
  uint64_t v11 = mach_absolute_time();
  sub_259D26ED4(v2, &v23, (unsigned char *)&v22 + 7);
  uint64_t result = mach_absolute_time();
  uint64_t v13 = result - v11;
  if (result < v11)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((v13 & 0x8000000000000000) == 0)
  {
    double v14 = a1 - PXTimebaseConversionFactor() * (double)v13;
    double v23 = v14;
    if (HIBYTE(v22) != 1) {
      return 0;
    }
    uint64_t v15 = (void (**)(char *, uint64_t))(v6 + 8);
    while (1)
    {
      if ((*(unsigned char *)(v2 + 80) & 1) == 0)
      {
        uint64_t v16 = *(void *)(v2 + 88);
        sub_259CEE908();
        uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
        uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)(AssociatedConformanceWitness + 8) + 8))(AssociatedTypeWitness);
        (*v15)(v10, AssociatedTypeWitness);
        if (v16 == v18) {
          return 1;
        }
        double v14 = v23;
      }
      sub_259CEDDF0();
      px_dispatch_queue_wait(*(void **)(v2 + 72), v14);
      uint64_t v19 = mach_absolute_time();
      BOOL v20 = sub_259CEE424();
      uint64_t result = mach_absolute_time();
      uint64_t v21 = result - v19;
      if (result < v19) {
        break;
      }
      if (v21 < 0) {
        goto LABEL_14;
      }
      double v14 = v14 - PXTimebaseConversionFactor() * (double)v21;
      double v23 = v14;
      if (!v20) {
        return 0;
      }
    }
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_259D26ED4@<X0>(uint64_t a1@<X0>, double *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, double))(*(void *)(*(void *)a1 + 96) + 56))(*(void *)(*(void *)a1 + 80), *a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_259D26F44()
{
  uint64_t v2 = sub_259D624A8();
  OUTLINED_FUNCTION_0_5();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5, v6);
  OUTLINED_FUNCTION_1_20();
  uint64_t v7 = *(void **)(v0 + 16);
  void *v1 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v1, *MEMORY[0x263F8F0E0], v2);
  id v8 = v7;
  LOBYTE(v7) = sub_259D624C8();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v4 + 8))(v1, v2);
  if (v7) {
    return swift_retain();
  }
  __break(1u);
  return result;
}

uint64_t PhotosGroupingItemListManager.GroupItem.id.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 32) - 8) + 16))(a2, v2);
}

uint64_t PhotosGroupingItemListManager.GroupItem.id.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 32) - 8) + 40))(v2, a1);
}

uint64_t (*PhotosGroupingItemListManager.GroupItem.id.modify())(void)
{
  return nullsub_1;
}

uint64_t PhotosGroupingItemListManager.GroupItem.contents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PhotosGroupingItemListManager.GroupItem.contents.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(a2 + 76);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + v4) = a1;
  return result;
}

uint64_t (*PhotosGroupingItemListManager.GroupItem.contents.modify())(void)
{
  return nullsub_1;
}

uint64_t PhotosGroupingItemListManager.GroupItem.value.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(v2 + *(int *)(a1 + 76));
  return swift_bridgeObjectRetain();
}

uint64_t PhotosGroupingItemListManager.GroupItem.init(id:contents:)()
{
  OUTLINED_FUNCTION_2_18();
  uint64_t v2 = v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(v1, v4, v3);
  uint64_t result = type metadata accessor for PhotosGroupingItemListManager.GroupItem();
  *(void *)(v2 + *(int *)(result + 76)) = v0;
  return result;
}

uint64_t static PhotosGroupingItemListManager.GroupItem.== infix(_:_:)()
{
  if (sub_259D62628())
  {
    type metadata accessor for PhotosGroupingItemListManager.GroupItem();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    char v0 = sub_259D62888();
  }
  else
  {
    char v0 = 0;
  }
  return v0 & 1;
}

uint64_t sub_259D27368()
{
  return static PhotosGroupingItemListManager.GroupItem.== infix(_:_:)() & 1;
}

uint64_t PhotosGroupingItemListManager.deinit()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  return v0;
}

uint64_t PhotosGroupingItemListManager.__deallocating_deinit()
{
  PhotosGroupingItemListManager.deinit();

  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t sub_259D27430()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t type metadata accessor for PhotosGroupingItemListManager.GroupItem()
{
  return swift_getGenericMetadata();
}

uint64_t sub_259D27480(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 56);
}

uint64_t sub_259D27488(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 64);
}

uint64_t sub_259D27490(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t method lookup function for PhotosGroupingItemListManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosGroupingItemListManager);
}

uint64_t dispatch thunk of PhotosGroupingItemListManager.__allocating_init(inputItemListManager:options:groupProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of PhotosGroupingItemListManager.waitForItemList(timeout:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of PhotosGroupingItemListManager.changeDetailsRepository.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t sub_259D27550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 64);
}

uint64_t sub_259D27558()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_259D275F4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 32) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_259D276F0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 32) - 8) + 8))();

  return swift_bridgeObjectRelease();
}

uint64_t sub_259D27760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 32) - 8) + 16;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 48) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 48) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_259D277E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 32) - 8) + 24;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 40) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 40) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_259D2786C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 32) - 8) + 40;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_259D278F0(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 32);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(*(void *)(v4 - 8) + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
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
        JUMPOUT(0x259D27A2CLL);
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
    return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_259D27A40(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 32);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(*(void *)(v6 - 8) + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x259D27C0CLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          unint64_t v17 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0) {
            uint64_t v18 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v18 = (a2 - 1);
          }
          *unint64_t v17 = v18;
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for PhotosGroupingItemListManagerSharedState()
{
  return self;
}

void *sub_259D27C58(void *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  if (!v4)
  {
    if (v5)
    {
      *a1 = v5;
      a1[1] = a2[1];
      a1[2] = a2[2];
      uint64_t v9 = (void *)a2[3];
      a1[3] = v9;
      a1[4] = a2[4];
      swift_retain();
      id v10 = v9;
      return a1;
    }
LABEL_7:
    long long v12 = *(_OWORD *)a2;
    long long v13 = *((_OWORD *)a2 + 1);
    a1[4] = a2[4];
    *(_OWORD *)a1 = v12;
    *((_OWORD *)a1 + 1) = v13;
    return a1;
  }
  if (!v5)
  {
    type metadata accessor for PhotosBasicItemList();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    (*(void (**)(void *, uint64_t))(*(void *)(TupleTypeMetadata3 - 8) + 8))(a1, TupleTypeMetadata3);
    goto LABEL_7;
  }
  *a1 = v5;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  uint64_t v6 = (void *)a2[3];
  uint64_t v7 = (void *)a1[3];
  a1[3] = v6;
  id v8 = v6;

  a1[4] = a2[4];
  return a1;
}

uint64_t sub_259D27D84(uint64_t a1, uint64_t a2)
{
  if (!*(void *)a1) {
    goto LABEL_5;
  }
  if (!*(void *)a2)
  {
    type metadata accessor for PhotosBasicItemList();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata3 - 8) + 8))(a1, TupleTypeMetadata3);
LABEL_5:
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    goto LABEL_6;
  }
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

LABEL_6:
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t sub_259D27E58(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 40))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_259D27EAC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_259D27F08()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_259D27F48()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_5();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 56) & ~v6;
  uint64_t v8 = v6 | 7;
  unint64_t v9 = (((((*(void *)(v5 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, AssociatedTypeWitness);
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v9 + 8, v8);
}

uint64_t sub_259D2804C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t PhotosMappingItemList.__allocating_init(itemIdentifiers:loadingStatus:itemProvider:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  PhotosMappingItemList.init(itemIdentifiers:loadingStatus:itemProvider:)(a1, a2, a3, a4);
  return v8;
}

uint64_t PhotosMappingItemList.__allocating_init()()
{
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v1 = *(void *)(v0 + 88);
  swift_getAssociatedTypeWitness();
  uint64_t v3 = sub_259D627D8();
  char v6 = 0;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  return PhotosMappingItemList.__allocating_init(itemIdentifiers:loadingStatus:itemProvider:)(v3, &v6, (uint64_t)sub_259D28520, v4);
}

void sub_259D28194()
{
}

uint64_t PhotosMappingItemList.init(itemIdentifiers:loadingStatus:itemProvider:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  char v8 = *a2;
  *(void *)(v4 + 32) = PXDataSourceIdentifierMakeUnique();
  *(void *)(v4 + 40) = a1;
  *(unsigned char *)(v4 + 48) = v8;
  *(void *)(v4 + 16) = a3;
  *(void *)(v4 + 24) = a4;
  return v4;
}

uint64_t PhotosMappingItemList.version.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t PhotosMappingItemList.itemIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

void PhotosMappingItemList.loadingStatus.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 48);
}

void PhotosMappingItemList.numberOfItems.getter()
{
  swift_getAssociatedTypeWitness();

  JUMPOUT(0x25A2E8F60);
}

uint64_t PhotosMappingItemList.item(at:)(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness, v5);
  uint64_t v7 = (char *)&v10 - v6;
  char v8 = *(void (**)(uint64_t, char *))(v1 + 16);
  sub_259D628A8();
  v8(a1, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, AssociatedTypeWitness);
}

uint64_t PhotosMappingItemList.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PhotosMappingItemList.__deallocating_deinit()
{
  PhotosMappingItemList.deinit();

  return MEMORY[0x270FA0228](v0, 49, 7);
}

void sub_259D2845C()
{
}

uint64_t sub_259D28480()
{
  return PhotosMappingItemList.itemIdentifiers.getter();
}

uint64_t sub_259D284A4(uint64_t a1)
{
  return PhotosMappingItemList.item(at:)(a1);
}

void sub_259D284C8(unsigned char *a1@<X8>)
{
}

uint64_t sub_259D284EC()
{
  return PhotosMappingItemList.version.getter();
}

uint64_t sub_259D28510()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_259D28520()
{
}

uint64_t sub_259D28528()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PhotosMappingItemList()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for PhotosMappingItemList(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosMappingItemList);
}

uint64_t dispatch thunk of PhotosMappingItemList.__allocating_init(itemIdentifiers:loadingStatus:itemProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

BOOL PhotosItemList.contains(_:)()
{
  OUTLINED_FUNCTION_13_2();
  v0();
  return (v1 & 1) == 0;
}

{
  void (*v0)(void);
  char v1;

  OUTLINED_FUNCTION_8_5();
  v0();
  return (v1 & 1) == 0;
}

uint64_t sub_259D28608@<X0>(uint64_t a1@<X8>)
{
  return PhotosItemList.placeholderObject.getter(a1);
}

uint64_t PhotosItemList.placeholderObject.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, AssociatedTypeWitness);
}

void sub_259D28680(unsigned char *a1@<X8>)
{
}

uint64_t PhotosItemListLoadingStatus.description.getter()
{
  uint64_t v1 = 0x6465646172676564;
  if (*v0 != 1) {
    uint64_t v1 = 0x6574656C706D6F63;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6C6F686563616C70;
  }
}

PhotosUIFoundation::PhotosItemListLoadingStatus_optional __swiftcall PhotosItemListLoadingStatus.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (PhotosUIFoundation::PhotosItemListLoadingStatus_optional)rawValue;
}

uint64_t sub_259D28710()
{
  return sub_259D2BE60();
}

PhotosUIFoundation::PhotosItemListLoadingStatus_optional sub_259D28718(Swift::Int *a1)
{
  return PhotosItemListLoadingStatus.init(rawValue:)(*a1);
}

BOOL sub_259D28728(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_259D28734(*a1, *a2);
}

BOOL sub_259D28734(unsigned __int8 a1, unsigned __int8 a2)
{
  return a2 >= a1;
}

BOOL sub_259D28744(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_259D28750(*a1, *a2);
}

BOOL sub_259D28750(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 >= a2;
}

BOOL sub_259D28760(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_259D2876C(*a1, *a2);
}

BOOL sub_259D2876C(unsigned __int8 a1, unsigned __int8 a2)
{
  return a2 < a1;
}

BOOL PhotosItemList.isContentUnavailable.getter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7, v8);
  OUTLINED_FUNCTION_1_5();
  uint64_t v11 = v10 - v9;
  char v13 = (*(uint64_t (**)(void))(v12 + 40))();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v11, v2, a1);
  if (v13)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 112))(&v20, a1, a2);
    BOOL v14 = v20 == 2;
    uint64_t v15 = OUTLINED_FUNCTION_10_4();
    v16(v15);
  }
  else
  {
    uint64_t v17 = OUTLINED_FUNCTION_10_4();
    v18(v17);
    return 0;
  }
  return v14;
}

uint64_t PhotosItemList.item<A>(nearest:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v41 = a4;
  uint64_t v42 = a5;
  uint64_t v40 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11, v12);
  BOOL v14 = (char *)&v40 - v13;
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v15, v16);
  OUTLINED_FUNCTION_1_5();
  uint64_t v19 = v18 - v17;
  OUTLINED_FUNCTION_0_0();
  uint64_t v21 = v20;
  uint64_t v24 = MEMORY[0x270FA5388](v22, v23);
  MEMORY[0x270FA5388](v24, v25);
  uint64_t v27 = (char *)&v40 - v26;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v19, a1, a3);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v27, v14, AssociatedTypeWitness);
    uint64_t v29 = v41;
    uint64_t v30 = v40;
    uint64_t v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 96))(v27, v40, v41);
    uint64_t v32 = v42;
    if (v33)
    {
      uint64_t v37 = OUTLINED_FUNCTION_9_3();
      v38(v37);
      uint64_t v36 = 1;
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 56))(v31, v30, v29);
      uint64_t v34 = OUTLINED_FUNCTION_9_3();
      v35(v34);
      uint64_t v36 = swift_dynamicCast() ^ 1;
    }
  }
  else
  {
    uint64_t v36 = 1;
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v8);
    uint64_t v32 = v42;
  }
  return __swift_storeEnumTagSinglePayload(v32, v36, 1, a3);
}

Swift::Int_optional __swiftcall PhotosItemList.indexClosest(to:)(Swift::Int to)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = *(uint64_t (**)())(v2 + 32);
  uint64_t v7 = v6();
  if (v7 < 1)
  {
    Swift::Int v8 = 0;
  }
  else
  {
    Swift::Int v8 = ((uint64_t (*)(uint64_t, uint64_t))v6)(v4, v3);
    Swift::Int v10 = v8 - 1;
    if (__OFSUB__(v8, 1))
    {
      __break(1u);
      goto LABEL_9;
    }
    if (v10 >= to) {
      Swift::Int v10 = to;
    }
    Swift::Int v8 = v10 & ~(v10 >> 63);
  }
  Swift::Bool v9 = v7 < 1;
LABEL_9:
  result.value = v8;
  result.is_nil = v9;
  return result;
}

void PhotosItemList.item(for:offset:)(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9, v10);
  OUTLINED_FUNCTION_1_5();
  uint64_t v15 = v13 + v14;
  if (!__OFADD__(v13, v14))
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v12 - v11, v3, a1);
    if (v15 < 0)
    {
      uint64_t v22 = OUTLINED_FUNCTION_12_3();
      v23(v22);
    }
    else
    {
      uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
      uint64_t v17 = OUTLINED_FUNCTION_12_3();
      v18(v17);
      if (v15 < v16)
      {
        OUTLINED_FUNCTION_2_19();
        v19();
        uint64_t v20 = OUTLINED_FUNCTION_1_21();
        uint64_t v21 = 0;
LABEL_7:
        __swift_storeEnumTagSinglePayload(a3, v21, 1, v20);
        return;
      }
    }
    uint64_t v20 = OUTLINED_FUNCTION_1_21();
    uint64_t v21 = 1;
    goto LABEL_7;
  }
  __break(1u);
}

uint64_t PhotosItemList.lastItem.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(uint64_t (**)(void))(a2 + 32);
  if (v4() >= 1)
  {
    uint64_t v5 = ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
    BOOL v6 = __OFSUB__(v5, 1);
    uint64_t result = v5 - 1;
    if (v6)
    {
      __break(1u);
      return result;
    }
    OUTLINED_FUNCTION_2_19();
    v8();
  }
  OUTLINED_FUNCTION_1_21();
  uint64_t v9 = OUTLINED_FUNCTION_3_15();

  return __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
}

uint64_t PhotosItemList.singleItem.getter()
{
  OUTLINED_FUNCTION_7_7();
  if (v0() == 1)
  {
    OUTLINED_FUNCTION_2_19();
    v1();
  }
  OUTLINED_FUNCTION_1_21();
  uint64_t v2 = OUTLINED_FUNCTION_3_15();

  return __swift_storeEnumTagSinglePayload(v2, v3, v4, v5);
}

unint64_t sub_259D28E84()
{
  unint64_t result = qword_26A3EDC78;
  if (!qword_26A3EDC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3EDC78);
  }
  return result;
}

uint64_t dispatch thunk of PhotosItemList.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of PhotosItemList.index(for:)()
{
  OUTLINED_FUNCTION_13_2();
  return v0();
}

{
  uint64_t (*v0)(void);

  OUTLINED_FUNCTION_8_5();
  return v0();
}

uint64_t dispatch thunk of PhotosItemList.contains(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of PhotosItemList.index(nearest:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of PhotosItemList.placeholderObject.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

double Duration.timeInterval.getter()
{
  uint64_t v0 = sub_259D63028();
  return (double)v1 / 1.0e18 + (double)v0;
}

uint64_t static Duration.minutes(_:)(double a1)
{
  return OUTLINED_FUNCTION_0_15(a1, 60.0);
}

uint64_t static Duration.hours(_:)(double a1)
{
  return OUTLINED_FUNCTION_0_15(a1 * 60.0, 60.0);
}

uint64_t PhotosItem.matches(itemReference:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_259CEA270(a1, (uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3EC498);
  if (swift_dynamicCast())
  {
    sub_259D040F0(v10, (uint64_t)v13);
    uint64_t v5 = v14;
    uint64_t v6 = v15;
    uint64_t v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
    char v8 = PhotosItem.matchesID<A>(of:)((uint64_t)v7, a2, v5, a3, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    uint64_t v11 = 0;
    memset(v10, 0, sizeof(v10));
    sub_259D290E0((uint64_t)v10);
    char v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_259D290E0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3EDC80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_259D29140()
{
  swift_getWitnessTable();
  uint64_t v0 = OUTLINED_FUNCTION_2_20();

  return PhotosItem.analyticsDescription.getter(v0, v1);
}

uint64_t PhotosItem.analyticsDescription.getter(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_1_22();
  MEMORY[0x270FA5388](v4, v5);
  (*(void (**)(uint64_t, uint64_t))(a2 + 64))(a1, a2);
  return sub_259D62668();
}

uint64_t sub_259D29240()
{
  swift_getWitnessTable();

  return PhotosItem.diagnosticDescription.getter();
}

uint64_t PhotosItem.diagnosticDescription.getter()
{
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v0, v1);
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_259D62668();
}

uint64_t sub_259D29324()
{
  swift_getWitnessTable();
  uint64_t v0 = OUTLINED_FUNCTION_2_20();

  return PhotosItem.analyticsDescription.getter(v0, v1);
}

uint64_t sub_259D29374()
{
  swift_getWitnessTable();

  return PhotosItem.diagnosticDescription.getter();
}

uint64_t sub_259D293C4()
{
  swift_getWitnessTable();
  uint64_t v0 = OUTLINED_FUNCTION_2_20();

  return PhotosItem.analyticsDescription.getter(v0, v1);
}

uint64_t sub_259D29414()
{
  swift_getWitnessTable();

  return PhotosItem.diagnosticDescription.getter();
}

uint64_t sub_259D29464()
{
  swift_getWitnessTable();
  uint64_t v0 = OUTLINED_FUNCTION_2_20();

  return PhotosItem.analyticsDescription.getter(v0, v1);
}

uint64_t PhotosItem.matchesID<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v31 = a2;
  uint64_t v32 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_259D62B68();
  OUTLINED_FUNCTION_0_0();
  uint64_t v29 = v9;
  uint64_t v30 = v8;
  MEMORY[0x270FA5388](v8, v10);
  uint64_t v12 = (char *)&v28 - v11;
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_1_22();
  MEMORY[0x270FA5388](v13, v14);
  OUTLINED_FUNCTION_0_0();
  uint64_t v16 = v15;
  uint64_t v19 = MEMORY[0x270FA5388](v17, v18);
  uint64_t v21 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19, v22);
  uint64_t v24 = (char *)&v28 - v23;
  (*(void (**)(uint64_t, uint64_t))(a5 + 64))(a3, a5);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v24, v12, AssociatedTypeWitness);
    (*(void (**)(uint64_t, uint64_t))(v32 + 64))(v31, v32);
    swift_getAssociatedConformanceWitness();
    char v25 = sub_259D62628();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v16 + 8);
    v26(v21, AssociatedTypeWitness);
    v26(v24, AssociatedTypeWitness);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v30);
    char v25 = 0;
  }
  return v25 & 1;
}

uint64_t dispatch thunk of PhotosItem.matches(itemReference:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t PhotosSendableTransfer.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 40))(v2, a1);
}

uint64_t (*PhotosSendableTransfer.wrappedValue.modify())(void)
{
  return nullsub_1;
}

uint64_t PhotosSendableTransfer.unwrapped<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1, v2);
  uint64_t v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *))(v5 + 16))(v7);
  uint64_t v12 = *(void *)(v4 + 16);
  uint64_t v8 = type metadata accessor for PhotosSendableTransfer();
  sub_259D29A0C((void (*)(char *, char *))sub_259D299EC, (uint64_t)v11, MEMORY[0x263F8E628], v8, v9, a2);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_259D29904@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1, a1);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, a2);
}

uint64_t sub_259D299EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_259D29904(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_259D29A0C@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v27 = a5;
  uint64_t v28 = a1;
  uint64_t v29 = a4;
  uint64_t v25 = *(void *)(a3 - 8);
  uint64_t v26 = a3;
  uint64_t v8 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(v11 + 16);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v8, v14);
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15, v18);
  uint64_t v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v22);
  uint64_t v23 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v12) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v20, v12);
    v28(v17, v10);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
    if (v6) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v25 + 32))(v27, v10, v26);
    }
    uint64_t v23 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a6, v23, 1, v29);
}

uint64_t *sub_259D29C80(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
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
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_259D29D38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_259D29D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_259D29DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_259D29E28(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (!a2) {
    return 0;
  }
  int v7 = a2 - v5;
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
        return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
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

void sub_259D29F74(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  size_t v8 = *(void *)(*(void *)(v6 - 8) + 64);
  char v9 = 8 * v8;
  BOOL v10 = a3 >= v7;
  int v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      unsigned int v15 = ((v11 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v15))
      {
        int v12 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v12 = 2;
      }
      else
      {
        int v12 = v15 > 1;
      }
    }
    else
    {
      int v12 = 1;
    }
  }
  else
  {
    int v12 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v13 = ~v7 + a2;
    if (v8 < 4)
    {
      int v14 = (v13 >> v9) + 1;
      if (v8)
      {
        int v16 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
      int v14 = 1;
    }
    switch(v12)
    {
      case 1:
        a1[v8] = v14;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v14;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v14;
        return;
      default:
        return;
    }
  }
  switch(v12)
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
      JUMPOUT(0x259D2A178);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
      }
      return;
  }
}

uint64_t ObservingUpdater.__allocating_init(target:updatePolicy:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = swift_allocObject();
  ObservingUpdater.init(target:updatePolicy:)(a1, a2);
  return v4;
}

void *ObservingUpdater.init(target:updatePolicy:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v36 = a2;
  uint64_t v39 = a1;
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(v4 + 88);
  OUTLINED_FUNCTION_0_0();
  uint64_t v38 = v6;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v7, v8);
  BOOL v10 = (char *)&v33 - v9;
  sub_259D62B68();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v11, v12);
  int v14 = (char *)&v33 - v13;
  uint64_t v33 = *(void *)(v4 + 96);
  unsigned int v15 = *(char **)(v33 + 8);
  OUTLINED_FUNCTION_2_21();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v16, v17);
  uint64_t v35 = (char *)&v33 - v18;
  uint64_t v40 = v15;
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_2_21();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v37 = v20;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v21, v22);
  uint64_t v24 = (char *)&v33 - v23;
  uint64_t v25 = (uint64_t *)v36[1];
  uint64_t v34 = *v36;
  uint64_t v36 = v25;
  swift_unknownObjectWeakInit();
  uint64_t v26 = sub_259D627D8();
  if (MEMORY[0x25A2E8FB0](v26, v5))
  {
    uint64_t v27 = sub_259D2AF7C(v26, v5, *(void *)(v33 + 16));
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v27 = MEMORY[0x263F8EE88];
  }
  v3[3] = v34;
  void v3[4] = v36;
  v3[5] = v27;
  swift_unknownObjectWeakAssign();
  sub_259D62C68();
  sub_259D626C8();
  swift_getAssociatedConformanceWitness();
  uint64_t v40 = v24;
  sub_259D62B78();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v5);
  uint64_t v29 = v3;
  uint64_t v30 = v38;
  if (EnumTagSinglePayload != 1)
  {
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
    do
    {
      v31(v10, v14, v5);
      sub_259D2ABD4((uint64_t)v10);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v5);
      sub_259D62B78();
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v5) != 1);
  }
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v40, AssociatedTypeWitness);
  return v29;
}

uint64_t ObservingUpdater.__allocating_init(target:needsUpdateHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = a2;
  v4[1] = a3;
  return ObservingUpdater.__allocating_init(target:updatePolicy:)(a1, v4);
}

uint64_t sub_259D2A598()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 88);
  OUTLINED_FUNCTION_0_0();
  v26[0] = v3;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)v26 - v6;
  OUTLINED_FUNCTION_2_21();
  sub_259D62B68();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v11 = (char *)v26 - v10;
  v26[1] = *(void *)(*(void *)(v1 + 96) + 8);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3_16();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v12, v13);
  void v26[2] = (char *)v26 - v14;
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v27 = v16;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x270FA5388](v17, v18);
  uint64_t v20 = (char *)v26 - v19;
  uint64_t v28 = v0;
  uint64_t v30 = sub_259D2AEE0();
  swift_beginAccess();
  OUTLINED_FUNCTION_2_21();
  uint64_t v29 = v21;
  sub_259D62968();
  sub_259D62958();
  swift_endAccess();
  sub_259D62C68();
  sub_259D626C8();
  swift_getAssociatedConformanceWitness();
  uint64_t v22 = AssociatedTypeWitness;
  sub_259D62B78();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v2) != 1)
  {
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v26[0] + 32);
    uint64_t v24 = (void (**)(char *, uint64_t))(v26[0] + 8);
    do
    {
      v23(v7, v11, v2);
      if (sub_259D62948()) {
        sub_259D2ABD4((uint64_t)v7);
      }
      (*v24)(v7, v2);
      sub_259D62B78();
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v2) != 1);
  }
  (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v22);
  return swift_bridgeObjectRelease();
}

uint64_t sub_259D2A8E0(uint64_t a1)
{
  uint64_t v18 = *v1;
  uint64_t v19 = a1;
  uint64_t v2 = *(void *)(v18 + 88);
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  uint64_t v7 = MEMORY[0x270FA5388](v5, v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)&v17 - v11;
  sub_259D2AEE0();
  char v13 = sub_259D62938();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v19, v2);
  swift_beginAccess();
  OUTLINED_FUNCTION_2_21();
  sub_259D62968();
  sub_259D62918();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v2);
  uint64_t result = swift_endAccess();
  if (v13)
  {
    uint64_t v15 = v1[3];
    uint64_t v16 = v1[4];
    uint64_t v20 = v15;
    uint64_t v21 = v16;
    sub_259D12654(v15);
    type metadata accessor for ObservingUpdater.UpdatePolicy();
    sub_259D2AACC((uint64_t)v1);
    return sub_259CE6788(v15);
  }
  return result;
}

void sub_259D2AACC(uint64_t a1)
{
  uint64_t v3 = *v1;
  if (*v1)
  {
    swift_retain();
    v3(a1);
    sub_259CE6788((uint64_t)v3);
  }
  else
  {
    void v5[4] = sub_259D2B55C;
    v5[5] = a1;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 1107296256;
    uint64_t v5[2] = sub_259CED700;
    v5[3] = &block_descriptor_6;
    uint64_t v4 = _Block_copy(v5);
    swift_retain();
    swift_release();
    px_perform_on_main_runloop(1, v4);
    _Block_release(v4);
  }
}

uint64_t sub_259D2ABD4(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = MEMORY[0x25A2EAC90](v1 + 2);
  if (result)
  {
    uint64_t v6 = MEMORY[0x270FA5388](result, v5);
    v7[1] = *(_OWORD *)(v3 + 80);
    uint64_t v8 = *(void *)(v3 + 96);
    uint64_t v9 = a1;
    uint64_t v10 = v6;
    MEMORY[0x270FA5388](v6, v7);
    sub_259D623C8();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t (*sub_259D2ACE0(uint64_t *a1, uint64_t a2))()
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*a1 + 88);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v7 = (char *)&v12 - v6;
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = (char *)swift_allocObject();
  *((void *)v10 + 2) = *(void *)(v3 + 80);
  *((void *)v10 + 3) = v4;
  *((void *)v10 + 4) = *(void *)(v3 + 96);
  *((void *)v10 + 5) = v8;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v10[v9], v7, v4);
  return sub_259D2B68C;
}

uint64_t sub_259D2AE78(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_259D2A8E0(a2);
    return swift_release();
  }
  return result;
}

void sub_259D2AED8()
{
}

uint64_t sub_259D2AEE0()
{
  return swift_bridgeObjectRetain();
}

uint64_t ObservingUpdater.deinit()
{
  swift_unknownObjectWeakDestroy();
  sub_259CE6788(*(void *)(v0 + 24));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ObservingUpdater.__deallocating_deinit()
{
  ObservingUpdater.deinit();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_259D2AF7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](a1, a2);
  unint64_t v9 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v52 = (char *)&v40 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11, v13);
  uint64_t v16 = (char *)&v40 - v15;
  if (MEMORY[0x25A2E8F60](v14))
  {
    sub_259D62C38();
    uint64_t v17 = sub_259D62C28();
  }
  else
  {
    uint64_t v17 = MEMORY[0x263F8EE88];
  }
  uint64_t v45 = MEMORY[0x25A2E8FB0](v5, a2);
  if (v45)
  {
    uint64_t v41 = v7;
    uint64_t v42 = v6;
    uint64_t v18 = 0;
    uint64_t v50 = (uint64_t (**)(char *, uint64_t *, uint64_t))(v6 + 16);
    uint64_t v51 = v17 + 56;
    uint64_t v47 = v6 + 32;
    uint64_t v49 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v43 = v5;
    uint64_t v44 = v16;
    while (1)
    {
      char v19 = sub_259D627F8();
      sub_259D627B8();
      if (v19)
      {
        uint64_t v20 = *(uint64_t (**)(char *, uint64_t *, uint64_t))(v6 + 16);
        uint64_t result = v20(v16, (uint64_t *)(v5+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v18), a2);
      }
      else
      {
        uint64_t result = sub_259D62C88();
        if (v41 != 8) {
          goto LABEL_24;
        }
        uint64_t v53 = result;
        uint64_t v20 = *v50;
        (*v50)(v16, &v53, a2);
        uint64_t result = swift_unknownObjectRelease();
      }
      BOOL v22 = __OFADD__(v18, 1);
      uint64_t v23 = v18 + 1;
      if (v22) {
        break;
      }
      uint64_t v48 = v23;
      uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v46(v52, v16, a2);
      uint64_t v24 = sub_259D62598();
      uint64_t v25 = v17;
      uint64_t v26 = -1 << *(unsigned char *)(v17 + 32);
      unint64_t v27 = v24 & ~v26;
      unint64_t v28 = v27 >> 6;
      uint64_t v29 = *(void *)(v51 + 8 * (v27 >> 6));
      uint64_t v30 = 1 << v27;
      uint64_t v31 = *(void *)(v6 + 72);
      if (((1 << v27) & v29) != 0)
      {
        uint64_t v32 = ~v26;
        while (1)
        {
          v20(v9, (uint64_t *)(*(void *)(v25 + 48) + v31 * v27), a2);
          uint64_t v33 = a3;
          char v34 = sub_259D62628();
          uint64_t v35 = *v49;
          (*v49)(v9, a2);
          if (v34) {
            break;
          }
          unint64_t v27 = (v27 + 1) & v32;
          unint64_t v28 = v27 >> 6;
          uint64_t v29 = *(void *)(v51 + 8 * (v27 >> 6));
          uint64_t v30 = 1 << v27;
          a3 = v33;
          if ((v29 & (1 << v27)) == 0)
          {
            uint64_t v6 = v42;
            uint64_t v5 = v43;
            goto LABEL_14;
          }
        }
        v35(v52, a2);
        a3 = v33;
        uint64_t v6 = v42;
        uint64_t v5 = v43;
        uint64_t v17 = v25;
      }
      else
      {
LABEL_14:
        uint64_t v36 = v52;
        *(void *)(v51 + 8 * v28) = v30 | v29;
        unint64_t v37 = *(void *)(v25 + 48) + v31 * v27;
        uint64_t v17 = v25;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v46)(v37, v36, a2);
        uint64_t v38 = *(void *)(v25 + 16);
        BOOL v22 = __OFADD__(v38, 1);
        uint64_t v39 = v38 + 1;
        if (v22) {
          goto LABEL_23;
        }
        *(void *)(v25 + 16) = v39;
      }
      uint64_t v16 = v44;
      uint64_t v18 = v48;
      if (v48 == v45) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  else
  {
LABEL_21:
    swift_bridgeObjectRelease();
    return v17;
  }
  return result;
}

uint64_t type metadata accessor for ObservingUpdater.UpdatePolicy()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_259D2B350()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ObservingUpdater()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for ObservingUpdater(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ObservingUpdater);
}

uint64_t dispatch thunk of ObservingUpdater.__allocating_init(target:updatePolicy:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ObservingUpdater.updateIfNeeded()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of ObservingUpdater.invalidate(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

void *sub_259D2B438(void *a1, uint64_t a2)
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

uint64_t sub_259D2B4A4(uint64_t *a1, unsigned int a2)
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

uint64_t sub_259D2B4F4(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t dispatch thunk of ObservingUpdaterEntity.update(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_259D2B560()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v4 = v0[6];
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v2 + 32))(&v4, v1);
}

uint64_t (*sub_259D2B5AC())()
{
  return sub_259D2ACE0(*(uint64_t **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_259D2B5B4()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_259D2B5EC()
{
  uint64_t v1 = *(void *)(v0 + 24);
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 48) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_259D2B68C()
{
  return sub_259D2AE78(*(void *)(v0 + 40), v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 24) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 24) - 8) + 80)));
}

uint64_t dispatch thunk of PhotosDiagnosticsProvider.diagnosticDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

id sub_259D2B6E4()
{
  return OUTLINED_FUNCTION_2_22();
}

void sub_259D2B734()
{
  OUTLINED_FUNCTION_1_23();
  swift_getWitnessTable();
  uint64_t v0 = OUTLINED_FUNCTION_6_11();

  PhotosMutableComposedObservable<>.performChanges(using:)(v0, v1, v2, v3);
}

void sub_259D2B78C()
{
  OUTLINED_FUNCTION_1_23();
  swift_getWitnessTable();
  uint64_t v0 = OUTLINED_FUNCTION_6_11();

  PhotosMutableComposedObservable<>.performChanges(using:)(v0, v1, v2, v3);
}

uint64_t sub_259D2B7E4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t PhotosComposedObservable<>.observeChanges(using:)()
{
  OUTLINED_FUNCTION_5_11();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v8 = (char *)&v13 - v7;
  OUTLINED_FUNCTION_7_8();
  v9();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(v1, v0, AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v8, AssociatedTypeWitness);
  return v11;
}

uint64_t PhotosMutableComposedObservable.performChanges(using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a1;
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v11, v12);
  uint64_t v13 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0_0();
  uint64_t v28 = v15;
  MEMORY[0x270FA5388](v16, v17);
  char v19 = (char *)&v27 - v18;
  OUTLINED_FUNCTION_7_8();
  v20();
  OUTLINED_FUNCTION_4_12();
  v21();
  unint64_t v22 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v23 = (char *)swift_allocObject();
  *((void *)v23 + 2) = a3;
  *((void *)v23 + 3) = a4;
  *((void *)v23 + 4) = v27;
  *((void *)v23 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v23[v22], v13, a3);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v25 = *(void (**)(uint64_t (*)(), char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 32);
  swift_retain();
  v25(sub_259D2BC70, v23, AssociatedTypeWitness, AssociatedConformanceWitness);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v19, AssociatedTypeWitness);
}

uint64_t sub_259D2BB4C(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness, v10);
  uint64_t v12 = (char *)&v14 - v11;
  (*(void (**)(uint64_t, uint64_t))(a5 + 24))(a4, a5);
  a1(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, AssociatedTypeWitness);
}

uint64_t sub_259D2BC70()
{
  OUTLINED_FUNCTION_3_17();
  return sub_259D2BB4C(*(void (**)(char *))(v0 + 32), *(void *)(v0 + 40), v0 + ((*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)), v2, v3);
}

uint64_t dispatch thunk of PhotosMutableObservable.performChanges(using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of PhotosObservableMutating.observable.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PhotosComposedObservable.observable.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PhotosComposedObservable.signalWillChange()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PhotosObservableImplementation.addObserver(using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of PhotosObservableImplementation.performChanges(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of PhotosObservableImplementation.signalChange(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of PhotosMutableComposedObservable.createMutator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

BOOL PXSimpleIndexPath.isNull.getter(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_259D2BD54()
{
  return sub_259D62FE8();
}

uint64_t sub_259D2BD9C()
{
  sub_259D62678();

  return swift_bridgeObjectRelease();
}

uint64_t sub_259D2BE60()
{
  return sub_259D62FE8();
}

uint64_t sub_259D2BEA4()
{
  return sub_259D62FE8();
}

BOOL static PXSimpleIndexPath.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return a1 == a5 && a2 == a6 && a3 == a7 && a4 == a8;
}

double sub_259D2BF00()
{
  double result = *(double *)&PXSimpleIndexPathNull;
  xmmword_26A3EDC88 = PXSimpleIndexPathNull;
  *(_OWORD *)&qword_26A3EDC98 = unk_259D74C40;
  return result;
}

uint64_t static PXSimpleIndexPath.null.getter()
{
  if (qword_26A3ECFE0 != -1) {
    swift_once();
  }
  return xmmword_26A3EDC88;
}

uint64_t sub_259D2BF70()
{
  unint64_t v0 = sub_259D62E58();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_259D2BFC0(char a1)
{
  uint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_2_23();
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_4_13();
      break;
    case 3:
      uint64_t result = 0x6D657469627573;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_259D2C030(char a1)
{
  uint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_2_23();
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_4_13();
      break;
    case 3:
      uint64_t result = 0x6D657469627573;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_259D2C0A0(uint64_t *a1, uint64_t *a2)
{
  return static PXSimpleIndexPath.== infix(_:_:)(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_259D2C0BC(unsigned __int8 *a1, char *a2)
{
  return sub_259D06ECC(*a1, *a2);
}

uint64_t sub_259D2C0C8()
{
  return sub_259D2BD54();
}

uint64_t sub_259D2C0D0()
{
  return sub_259D2BD9C();
}

uint64_t sub_259D2C0D8()
{
  return sub_259D2BEA4();
}

uint64_t sub_259D2C0E0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_259D2BF70();
  *a1 = result;
  return result;
}

uint64_t sub_259D2C110@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_259D2BFC0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_259D2C13C()
{
  return sub_259D2C030(*v0);
}

uint64_t sub_259D2C144@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_259D2BFBC();
  *a1 = result;
  return result;
}

void sub_259D2C16C(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_259D2C178(uint64_t a1)
{
  unint64_t v2 = sub_259D2C35C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_259D2C1B4(uint64_t a1)
{
  unint64_t v2 = sub_259D2C35C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PXSimpleIndexPath.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = a5;
  uint64_t v20 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A3EDCA8);
  OUTLINED_FUNCTION_0_5();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12, v13);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_259D2C35C();
  sub_259D63018();
  char v24 = 0;
  OUTLINED_FUNCTION_3_18(a2, (uint64_t)&v24);
  if (!v5)
  {
    uint64_t v16 = a4;
    uint64_t v17 = v19;
    char v23 = 1;
    OUTLINED_FUNCTION_3_18(v20, (uint64_t)&v23);
    char v22 = 2;
    OUTLINED_FUNCTION_3_18(v16, (uint64_t)&v22);
    char v21 = 3;
    OUTLINED_FUNCTION_3_18(v17, (uint64_t)&v21);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v15, v9);
}

unint64_t sub_259D2C35C()
{
  unint64_t result = qword_26A3EDCB0;
  if (!qword_26A3EDCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3EDCB0);
  }
  return result;
}

uint64_t PXSimpleIndexPath.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A3EDCB8);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x270FA5388](v3, v4);
  uint64_t v5 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  sub_259D2C35C();
  sub_259D63008();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v12 = 0;
    uint64_t v5 = OUTLINED_FUNCTION_1_24((uint64_t)&v12);
    char v11 = 1;
    OUTLINED_FUNCTION_1_24((uint64_t)&v11);
    char v10 = 2;
    OUTLINED_FUNCTION_1_24((uint64_t)&v10);
    char v9 = 3;
    OUTLINED_FUNCTION_1_24((uint64_t)&v9);
    uint64_t v7 = OUTLINED_FUNCTION_5_12();
    v8(v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v5;
}

uint64_t sub_259D2C534@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = PXSimpleIndexPath.init(from:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_259D2C564(void *a1)
{
  return PXSimpleIndexPath.encode(to:)(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t PXSimpleIndexPath.hash(into:)()
{
  return sub_259D62FD8();
}

uint64_t PXSimpleIndexPath.hashValue.getter()
{
  return sub_259D62FE8();
}

uint64_t sub_259D2C660()
{
  return PXSimpleIndexPath.hashValue.getter();
}

uint64_t sub_259D2C66C()
{
  return PXSimpleIndexPath.hash(into:)();
}

uint64_t sub_259D2C678()
{
  return sub_259D62FE8();
}

unint64_t sub_259D2C6F8()
{
  unint64_t result = qword_26A3EDCC0;
  if (!qword_26A3EDCC0)
  {
    type metadata accessor for PXSimpleIndexPath(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3EDCC0);
  }
  return result;
}

unsigned char *_s10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x259D2C814);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *_s10CodingKeysOMa()
{
  return &_s10CodingKeysON;
}

unint64_t sub_259D2C850()
{
  unint64_t result = qword_26A3EDCC8;
  if (!qword_26A3EDCC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3EDCC8);
  }
  return result;
}

unint64_t sub_259D2C8A0()
{
  unint64_t result = qword_26A3EDCD0;
  if (!qword_26A3EDCD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3EDCD0);
  }
  return result;
}

unint64_t sub_259D2C8F0()
{
  unint64_t result = qword_26A3EDCD8;
  if (!qword_26A3EDCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A3EDCD8);
  }
  return result;
}

CGImageRef PXCreateCGImageFromImageSourceWithMaxPixelSize(CGImageSource *a1)
{
  v9[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F0F5A8];
  v8[0] = *MEMORY[0x263F0F600];
  v8[1] = v2;
  v9[0] = MEMORY[0x263EFFA80];
  v9[1] = MEMORY[0x263EFFA88];
  uint64_t v3 = *MEMORY[0x263F0F5B8];
  _OWORD v8[2] = *MEMORY[0x263F0F608];
  v8[3] = v3;
  v9[2] = MEMORY[0x263EFFA88];
  v9[3] = MEMORY[0x263EFFA88];
  void v8[4] = *MEMORY[0x263F0F638];
  unsigned int v4 = objc_msgSend(NSNumber, "numberWithDouble:");
  void v9[4] = v4;
  CFDictionaryRef v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];

  ThumbnailAtIndeCGFloat x = CGImageSourceCreateThumbnailAtIndex(a1, 0, v5);
  return ThumbnailAtIndex;
}

void __PXCreateContextWithAutomaticFormat_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = PFUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_259CDA000, v3, OS_LOG_TYPE_ERROR, "PXCreateContextWithAutomaticFormat failed with error:%@", (uint8_t *)&v4, 0xCu);
  }
}

CGContext *PXCreateContext(int a1, unint64_t a2, int a3, double a4, double a5)
{
  double v8 = round(a4);
  double v9 = round(a5);
  double v10 = 1.0 - v8;
  if (1.0 - v9 <= 0.00000011920929 && v10 <= 0.00000011920929)
  {
    if (!a2)
    {
LABEL_20:
      uint64_t v20 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v10);
      char v21 = objc_msgSend(NSString, "stringWithUTF8String:", "CGContextRef  _Nonnull PXCreateContext(CGSize, BOOL, PXGColorSpaceName, BOOL)");
      [v20 handleFailureInFunction:v21, @"CGImage+PhotosUIFoundation.m", 140, @"Invalid parameter not satisfying: %@", @"colorSpaceName != PXGColorSpaceUndefined" file lineNumber description];

      char v12 = (CGColorSpace *)colorspaces[0];
      if (!colorspaces[0]) {
        colorspaces[0] = 0;
      }
      if (a1) {
        uint32_t v13 = 5;
      }
      else {
        uint32_t v13 = 1;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v10);
    uint64_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", "CGContextRef  _Nonnull PXCreateContext(CGSize, BOOL, PXGColorSpaceName, BOOL)");
    [v18 handleFailureInFunction:v19, @"CGImage+PhotosUIFoundation.m", 139, @"Invalid parameter not satisfying: %@", @"!PXPixelSizeAreaIsZero(roundedSize)" file lineNumber description];

    if (!a2) {
      goto LABEL_20;
    }
  }
  char v12 = PXGetColorSpace(a2);
  if (a1) {
    uint32_t v13 = 5;
  }
  else {
    uint32_t v13 = 1;
  }
  if (a3 && (a2 > 0xF) | (0x6F60u >> a2) & 1)
  {
    v13 |= 0x1100u;
    size_t v14 = 16;
  }
  else
  {
    if (a2 <= 0xF && ((0xAu >> a2) & 1) == 0)
    {
LABEL_15:
      v13 |= 0x4000u;
      size_t v14 = 8;
      goto LABEL_18;
    }
    size_t v14 = 8;
  }
LABEL_18:
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  uint64_t v16 = CGBitmapContextCreate(0, (unint64_t)v8, (unint64_t)v9, v14, AlignedBytesPerRow, v12, v13);
  v22.size.CGFloat width = (double)(unint64_t)v8;
  v22.size.CGFloat height = (double)(unint64_t)v9;
  v22.origin.CGFloat x = 0.0;
  v22.origin.CGFloat y = 0.0;
  CGContextClearRect(v16, v22);
  return v16;
}

__CFString *PXScrollViewSpeedometerRegimeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4) {
    return @"???";
  }
  else {
    return off_26545A0E0[a1 + 1];
  }
}

void PXDeferredDealloc(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (PXDeferredDealloc_onceToken != -1) {
      dispatch_once(&PXDeferredDealloc_onceToken, &__block_literal_global_687);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __PXDeferredDealloc_block_invoke_2;
    block[3] = &unk_26545BC00;
    id v3 = v1;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __PXDeferredDealloc_block_invoke_2(uint64_t a1)
{
  id v1 = PXDeferredDealloc_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __PXDeferredDealloc_block_invoke_3;
  block[3] = &unk_26545BC00;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(v1, block);
}

uint64_t __PXDeferredDealloc_block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) hash];
}

uint64_t __PXDeferredDealloc_block_invoke()
{
  uint64_t v0 = px_dispatch_queue_create_serial("com.apple.PXDeferredDealloc", QOS_CLASS_UTILITY);
  uint64_t v1 = PXDeferredDealloc_queue;
  PXDeferredDealloc_queue = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_259D2F770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CFMutableArrayRef PXCreateMutableIntegerArrayRef(CFIndex capacity)
{
  CFArrayCallBacks v2 = *(CFArrayCallBacks *)byte_270798918;
  return CFArrayCreateMutable(0, capacity, &v2);
}

CFStringRef _indexArrayCopyDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"%lu", a1);
}

uint64_t PXFirstIndexInSortedRangePassingTest(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (unsigned int (**)(void, void))v5;
  if (!a2) {
    goto LABEL_11;
  }
  if ((*((uint64_t (**)(id, uint64_t))v5 + 2))(v5, a1))
  {
    uint64_t v7 = a1;
    goto LABEL_12;
  }
  uint64_t v7 = a2 + a1 - 1;
  if (!v6[2](v6, v7))
  {
LABEL_11:
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  while (a1 < v7 - 1)
  {
    uint64_t v8 = v7 - a1;
    if (v7 < a1) {
      ++v8;
    }
    uint64_t v9 = a1 + (v8 >> 1);
    if (v6[2](v6, v9)) {
      uint64_t v7 = v9;
    }
    else {
      a1 = v9;
    }
  }
LABEL_12:

  return v7;
}

uint64_t PXLastIndexInSortedRangePassingTest(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (unsigned int (**)(void, void))v5;
  if (a2 && (*((unsigned int (**)(id, uint64_t))v5 + 2))(v5, a1))
  {
    uint64_t v7 = a2 + a1 - 1;
    if (((uint64_t (*)(void, uint64_t))v6[2])(v6, v7))
    {
      a1 = v7;
    }
    else
    {
      while (a1 < v7 - 1)
      {
        uint64_t v8 = v7 - a1;
        if (v7 < a1) {
          ++v8;
        }
        uint64_t v9 = a1 + (v8 >> 1);
        if (v6[2](v6, v9)) {
          a1 = v9;
        }
        else {
          uint64_t v7 = v9;
        }
      }
    }
  }
  else
  {
    a1 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return a1;
}

id PXFilterArrayForObjectsOfClass(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  CFArrayCallBacks v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v8, (void)v10);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id PXArrayByMovingObjectFromIndexToIndex(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)[a1 mutableCopy];
  uint64_t v6 = [v5 objectAtIndex:a2];
  [v5 removeObjectAtIndex:a2];
  [v5 insertObject:v6 atIndex:a3];

  return v5;
}

id PXArrayFromFrequencySortAndDeduplicationOfNSStringSet(void *a1)
{
  id v1 = a1;
  CFArrayCallBacks v2 = [v1 allObjects];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _OWORD v6[2] = __PXArrayFromFrequencySortAndDeduplicationOfNSStringSet_block_invoke;
  v6[3] = &unk_26545A1A8;
  id v7 = v1;
  id v3 = v1;
  uint64_t v4 = [v2 sortedArrayUsingComparator:v6];

  return v4;
}

uint64_t __PXArrayFromFrequencySortAndDeduplicationOfNSStringSet_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) countForObject:v5];
  uint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];
  if (v7 == v8)
  {
    uint64_t v9 = [v5 localizedCompare:v6];
  }
  else if (v7 > v8)
  {
    uint64_t v9 = -1;
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

id PXArrayRotate(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 count];
  if (a2 < 0)
  {
    long long v11 = [MEMORY[0x263F08690] currentHandler];
    long long v12 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray * _Nonnull PXArrayRotate(NSArray *__strong _Nonnull, NSInteger)");
    [v11 handleFailureInFunction:v12, @"NSArray+PhotosUIFoundation.m", 170, @"Invalid parameter not satisfying: %@", @"rotationLength >= 0" file lineNumber description];
  }
  uint64_t v5 = (uint64_t)fmod((double)a2, (double)v4);
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4];
    uint64_t v8 = objc_msgSend(v3, "subarrayWithRange:", v5, v4 - v5);
    [v7 addObjectsFromArray:v8];

    uint64_t v9 = objc_msgSend(v3, "subarrayWithRange:", 0, v5);
    [v7 addObjectsFromArray:v9];
  }

  return v7;
}

__CFString *PXUserInterfaceLayoutDirectionDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"??";
  }
  else {
    return off_26545A1C8[a1];
  }
}

uint64_t PXFlipLayoutDirection(uint64_t a1)
{
  if (a1 == 1) {
    return 2;
  }
  if (a1 != 2)
  {
    if (!a1)
    {
      CFArrayCallBacks v2 = [MEMORY[0x263F08690] currentHandler];
      id v3 = [NSString stringWithUTF8String:"PXUserInterfaceLayoutDirection PXFlipLayoutDirection(PXUserInterfaceLayoutDirection)"];
      [v2 handleFailureInFunction:v3 file:@"PXUserInterfaceLayoutDirection.m" lineNumber:28 description:@"Unable to flip unspecified layout direction"];

      abort();
    }
    uint64_t v5 = [MEMORY[0x263F08690] currentHandler];
    BOOL v6 = [NSString stringWithUTF8String:"PXUserInterfaceLayoutDirection PXFlipLayoutDirection(PXUserInterfaceLayoutDirection)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXUserInterfaceLayoutDirection.m", 34, @"Unknown layout direction %ti", a1);

    abort();
  }
  return 1;
}

uint64_t PXLeadingRectEdge(uint64_t result)
{
  if (result == 1) {
    return 0;
  }
  if (result != 2)
  {
    if (!result)
    {
      id v1 = [MEMORY[0x263F08690] currentHandler];
      CFArrayCallBacks v2 = [NSString stringWithUTF8String:"CGRectEdge PXLeadingRectEdge(PXUserInterfaceLayoutDirection)"];
      [v1 handleFailureInFunction:v2 file:@"PXUserInterfaceLayoutDirection.m" lineNumber:40 description:@"Unspecified layout direction"];

      abort();
    }
    uint64_t v3 = result;
    uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"CGRectEdge PXLeadingRectEdge(PXUserInterfaceLayoutDirection)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXUserInterfaceLayoutDirection.m", 46, @"Unknown layout direction %ti", v3);

    abort();
  }
  return result;
}

uint64_t PXTrailingRectEdge(uint64_t a1)
{
  uint64_t v1 = PXFlipLayoutDirection(a1);

  return PXLeadingRectEdge(v1);
}

uint64_t PXUserInterfaceLayoutDirectionFromUIUserInterfaceLayoutDirection(uint64_t a1)
{
  if (a1) {
    return 2 * (a1 == 1);
  }
  else {
    return 1;
  }
}

uint64_t CGSizeHash(double a1, double a2)
{
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v4 = [v3 hash];

  uint64_t v5 = [NSNumber numberWithDouble:a2];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4 + 961;

  return v6;
}

void sub_259D36E3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_259D37040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D3723C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D37434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D37C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D37D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D37DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D37ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D38004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D38280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NSIndexPathsFromPXIndexPathSet(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263EFF980];
  id v2 = a1;
  uint64_t v3 = objc_msgSend(v1, "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _OWORD v6[2] = __NSIndexPathsFromPXIndexPathSet_block_invoke;
  v6[3] = &unk_26545A950;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateItemIndexPathsUsingBlock:v6];

  return v4;
}

void __NSIndexPathsFromPXIndexPathSet_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x263F088C8], "px_indexPathForItem:inSection:", *(void *)(a2 + 16), *(void *)(a2 + 8));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

id PXIndexPathSetFromIndexPaths(void *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = +[PXIndexPathSet indexPathSet];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "px_section");
        uint64_t v12 = objc_msgSend(v10, "px_item");
        v14[0] = a2;
        v14[1] = v11;
        v14[2] = v12;
        void v14[3] = 0x7FFFFFFFFFFFFFFFLL;
        [v4 addIndexPath:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t PXDisplayAssetCollectionSharingShouldStartWithAllAssetsSelected(void *a1)
{
  id v1 = a1;
  if ((objc_msgSend(v1, "px_isMediaTypeSmartAlbum") & 1) != 0
    || (objc_msgSend(v1, "px_isHiddenSmartAlbum") & 1) != 0
    || (objc_msgSend(v1, "px_isRecentlyDeletedSmartAlbum") & 1) != 0
    || (objc_msgSend(v1, "px_isUtilityCollection") & 1) != 0
    || (objc_msgSend(v1, "px_isRecentsCollection") & 1) != 0
    || (objc_msgSend(v1, "px_isAllLibraryDuplicatesSmartAlbum") & 1) != 0
    || (objc_msgSend(v1, "px_isRecentlySavedCollection") & 1) != 0
    || (objc_msgSend(v1, "px_isRecentlyEditedSmartAlbum") & 1) != 0)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = objc_msgSend(v1, "px_isImportHistoryCollection") ^ 1;
  }

  return v2;
}

void sub_259D39D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
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

uint64_t __Block_byref_object_copy__2796(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2797(uint64_t a1)
{
}

double PXEdgeInsetsMakeWithValueForEdges(char a1, double a2)
{
  if (a1) {
    return a2;
  }
  else {
    return 0.0;
  }
}

double PXEdgeInsetsAbsoluteValue(double a1)
{
  return fabs(a1);
}

double PXEdgeInsetsInsetRectEdges(char a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  if ((a1 & 2) == 0) {
    a7 = 0.0;
  }
  return a2 + a7;
}

void sub_259D3BBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_259D3C0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_PXDisplayAssetIndexSubfetchResult *PXDisplayAssetFetchResultSubfetchResultWithIndexSet(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 count])
  {
    unint64_t v5 = [v4 lastIndex];
    if (v5 >= [v3 count])
    {
      long long v10 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id<PXDisplayAssetFetchResult>  _Nonnull PXDisplayAssetFetchResultSubfetchResultWithIndexSet(__strong id<PXDisplayAssetFetchResult> _Nonnull, NSIndexSet *__strong _Nonnull)");
      [v10 handleFailureInFunction:v11, @"PXDisplayAssetFetchResult.m", 430, @"indexSet %@ out of bounds 0 ..< %li", v4, objc_msgSend(v3, "count") file lineNumber description];
    }
    uint64_t v6 = [[_PXDisplayAssetIndexSubfetchResult alloc] initWithFetchResult:v3 indexSet:v4];
  }
  else
  {
    uint64_t v7 = [_PXArrayDisplayAssetFetchResult alloc];
    uint64_t v6 = [(_PXArrayDisplayAssetFetchResult *)v7 initWithAssets:MEMORY[0x263EFFA68]];
  }
  uint64_t v8 = v6;

  return v8;
}

_PXArrayDisplayAssetFetchResult *PXDisplayAssetFetchResultEmpty()
{
  uint64_t v0 = [_PXArrayDisplayAssetFetchResult alloc];
  id v1 = [(_PXArrayDisplayAssetFetchResult *)v0 initWithAssets:MEMORY[0x263EFFA68]];

  return v1;
}

_PXConcatenatingDisplayAssetFetchResult *PXDisplayAssetFetchResultFromFetchResults(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [[_PXConcatenatingDisplayAssetFetchResult alloc] initWithFetchResults:v1];

  return v2;
}

_PXDisplayAssetScaledFetchResult *PXDisplayAssetFetchResultScaledWithMultiplier(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = [[_PXDisplayAssetScaledFetchResult alloc] initWithFetchResult:v3 multiplier:a2];

  return v4;
}

_PXArrayDisplayAssetFetchResult *PXDisplayAssetFetchResultFromArray(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [[_PXArrayDisplayAssetFetchResult alloc] initWithAssets:v1];

  return v2;
}

_PXArrayDisplayAssetFetchResult *PXDisplayAssetFetchResultFromAsset(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [_PXArrayDisplayAssetFetchResult alloc];
  v6[0] = v1;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  id v4 = [(_PXArrayDisplayAssetFetchResult *)v2 initWithAssets:v3];

  return v4;
}

PXDisplayAssetFetchResultEnumerator *PXDisplayAssetFetchResultFastEnumeration(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    if ([v1 conformsToProtocol:&unk_2707BF378]) {
      id v3 = v2;
    }
    else {
      id v3 = [[PXDisplayAssetFetchResultEnumerator alloc] initWithDisplayAssetFetchResult:v2];
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t PXDisplayAssetFetchResultEqualToDisplayAssetFetchResult(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 == v4)
  {

    goto LABEL_9;
  }
  char v5 = [v3 isEqual:v4];

  if (v5) {
    goto LABEL_9;
  }
  uint64_t v6 = 0;
  if (!v3 || !v4) {
    goto LABEL_10;
  }
  uint64_t v7 = [v3 count];
  if (v7 != [v4 count])
  {
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = v3;
    id v9 = v4;
LABEL_14:
    uint64_t v6 = [v8 hasIdentifiersEqualTo:v9];
    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = v4;
    id v9 = v3;
    goto LABEL_14;
  }
  uint64_t v11 = [v3 count];
  if (v11 != [v4 count])
  {
    long long v17 = [MEMORY[0x263F08690] currentHandler];
    long long v18 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL PXDisplayAssetFetchResultEqualToDisplayAssetFetchResult(__strong id<PXDisplayAssetFetchResult> _Nullable, __strong id<PXDisplayAssetFetchResult> _Nullable)");
    [v17 handleFailureInFunction:v18, @"PXDisplayAssetFetchResult.m", 476, @"Invalid parameter not satisfying: %@", @"fetchResult1.count == fetchResult2.count" file lineNumber description];
  }
  uint64_t v12 = [v3 count];
  if (v12 < 1)
  {
LABEL_9:
    uint64_t v6 = 1;
    goto LABEL_10;
  }
  uint64_t v13 = v12;
  uint64_t v14 = 1;
  do
  {
    long long v15 = [v3 objectAtIndex:v14 - 1];
    long long v16 = [v4 objectAtIndex:v14 - 1];
    uint64_t v6 = [v15 isEqual:v16];

    if (v14 >= v13) {
      break;
    }
    ++v14;
  }
  while ((v6 & 1) != 0);
LABEL_10:

  return v6;
}

uint64_t __Block_byref_object_copy__3113(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3114(uint64_t a1)
{
}

void sub_259D3C988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_259D3DD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D3E294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PXCATransactionSetShouldLoadContentImmediately(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x263F158F8];
  id v2 = [NSNumber numberWithBool:a1];
  [v1 setValue:v2 forKey:@"com.apple.PhotosUIFoundation.loadContentEagerly"];
}

id PXDiffArrays(void *a1, void *a2, void *a3, id *a4, id *a5, id *a6, CFTypeRef *a7, id *a8)
{
  return PXDiffArraysWithObjectComparator(a1, a2, a3, 0, a4, a5, a6, a7, a8);
}

id PXDiffArraysWithObjectComparator(void *a1, void *a2, void *a3, uint64_t a4, id *a5, id *a6, id *a7, CFTypeRef *a8, id *a9)
{
  id v89 = a3;
  uint64_t v105 = *MEMORY[0x263EF8340];
  uint64_t v93 = a5;
  *a5 = 0;
  uint64_t v96 = a6;
  *a6 = 0;
  uint64_t v94 = a7;
  *a7 = 0;
  uint64_t v95 = a8;
  *a8 = 0;
  int v91 = a9;
  *a9 = 0;
  uint64_t v90 = (void *)MEMORY[0x25A2EA3A0]();
  size_t v12 = [a2 count];
  size_t v13 = [a1 count];
  uint64_t v14 = (char *)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", 8 * (v13 + v12)), "mutableBytes");
  long long v15 = &v14[8 * v13];
  id v97 = a1;
  objc_msgSend(a1, "getObjects:range:", v14, 0, v13);
  id v92 = a2;
  objc_msgSend(a2, "getObjects:range:", v15, 0, v12);
  uint64_t v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", 8 * (v13 + v12)), "mutableBytes");
  uint64_t v100 = (void *)(v16 + 8 * v13);
  if (a4)
  {
    long long v17 = __compar;
    __compar[0] = MEMORY[0x263EF8330];
    __compar[1] = 3221225472;
    __compar[2] = __PXDiffArraysWithObjectComparator_block_invoke;
    __compar[3] = &unk_26545AA40;
    __compar[4] = a4;
  }
  else
  {
    long long v17 = &__block_literal_global_3869;
  }
  uint64_t v98 = (char *)v16;
  qsort_b(v14, v13, 8uLL, v17);
  uint64_t v101 = &v14[8 * v13];
  qsort_b(v15, v12, 8uLL, v17);
  size_t v18 = 0;
  size_t v99 = v12;
  size_t v19 = 0;
  size_t v20 = 0;
  size_t v21 = 0;
  if (v13 && v12)
  {
    size_t v21 = 0;
    size_t v20 = 0;
    size_t v19 = 0;
    size_t v18 = 0;
    do
    {
      int v22 = ((uint64_t (*)(void *, char *, char *))v17[2])(v17, &v14[8 * v19], &v101[8 * v18]);
      if (v22 < 0)
      {
        *(void *)&v98[8 * v21++] = *(void *)&v14[8 * v19++];
      }
      else
      {
        if (v22) {
          v100[v20++] = *(void *)&v101[8 * v18];
        }
        else {
          ++v19;
        }
        ++v18;
      }
      size_t v12 = v99;
    }
    while (v19 < v13 && v18 < v99);
  }
  size_t v23 = v13 - v19;
  if (v13 <= v19)
  {
    char v24 = v98;
  }
  else
  {
    char v24 = v98;
    uint64_t v25 = &v98[8 * v21];
    uint64_t v26 = &v14[8 * v19];
    do
    {
      uint64_t v27 = *(void *)v26;
      v26 += 8;
      *(void *)uint64_t v25 = v27;
      v25 += 8;
      --v23;
    }
    while (v23);
    size_t v21 = v13 + v21 - v19;
  }
  size_t v28 = v12 - v18;
  if (v12 > v18)
  {
    uint64_t v29 = &v24[8 * v13 + 8 * v20];
    uint64_t v30 = &v14[8 * v13 + 8 * v18];
    do
    {
      uint64_t v31 = *(void *)v30;
      v30 += 8;
      *(void *)uint64_t v29 = v31;
      v29 += 8;
      --v28;
    }
    while (v28);
    size_t v20 = v12 + v20 - v18;
  }
  if (v21)
  {
    objc_msgSend(v97, "getObjects:range:", v14, 0, v13);
    uint64_t v32 = (void *)[MEMORY[0x263F089C8] indexSet];
    if (v13)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (bsearch_b(v14, v24, v21, 8uLL, v17)) {
          [v32 addIndex:i];
        }
        v14 += 8;
      }
    }
    char v34 = v93;
    *uint64_t v93 = v32;
    id v35 = v32;
    id v36 = v97;
    id v37 = (id)[v97 mutableCopy];
    [v37 removeObjectsAtIndexes:*v34];
    size_t v12 = v99;
  }
  else
  {
    id v37 = 0;
    id v36 = v97;
  }
  uint64_t v38 = objc_msgSend(v92, "getObjects:range:", v101, 0, v12);
  if (v20)
  {
    uint64_t v98 = (char *)&v88;
    MEMORY[0x270FA5388](v38, v39);
    uint64_t v41 = (char *)&v88 - v40;
    if (v20 > 0x200) {
      uint64_t v41 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v88 - v40, 8 * v20);
    }
    uint64_t v42 = (void *)[MEMORY[0x263F089C8] indexSet];
    if (v12)
    {
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v46 = v101;
      do
      {
        if (bsearch_b(&v46[v43], v100, v20, 8uLL, v17))
        {
          [v42 addIndex:v44];
          *(void *)&v41[8 * v45++] = *(void *)&v46[8 * v44];
        }
        ++v44;
        v43 += 8;
      }
      while (v12 != v44);
    }
    else
    {
      uint64_t v45 = 0;
    }
    uint64_t v47 = v96;
    *uint64_t v96 = v42;
    id v48 = v42;
    id v36 = v97;
    if (!v37) {
      id v37 = (id)[v97 mutableCopy];
    }
    objc_msgSend(v37, "insertObjects:atIndexes:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v41, v45), *v47);
    if (v20 >= 0x201) {
      NSZoneFree(0, v41);
    }
  }
  uint64_t v49 = v101;
  if (v37)
  {
    uint64_t v50 = [v37 count];
    if (v50 != [v92 count])
    {
      uint64_t v86 = (void *)[MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v86, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void PXDiffArraysWithObjectComparator(NSArray * _Nonnull, NSArray * _Nonnull, NSArray * _Nonnull, NSComparator _Nullable, NSIndexSet * _Nonnull * _Nullable, NSIndexSet * _Nonnull * _Nullable, NSIndexSet * _Nonnull * _Nullable, CFArrayRef  _Nonnull * _Nullable, NSIndexSet * _Nonnull * _Nullable)"), @"NSArrayAdditions.m", 204, @"Mismatched value counts after additions and subtractions.");
    }
    id v36 = v37;
  }
  unint64_t v51 = [v36 count];
  unint64_t v53 = MEMORY[0x270FA5388](v51, v52);
  uint64_t v56 = (char *)&v88 - v55;
  if (v53 > 0x200) {
    uint64_t v56 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v88 - v55, 8 * v54);
  }
  objc_msgSend(v36, "getObjects:range:", v56, 0, v51);
  BOOL v57 = (void *)[MEMORY[0x263F089C8] indexSet];
  if (v51)
  {
    uint64_t v58 = 0;
    double v59 = v56;
    uint64_t v60 = v49;
    do
    {
      if (((unsigned int (*)(void *, char *, char *))v17[2])(v17, v59, v60)) {
        [v57 addIndex:v58];
      }
      ++v58;
      v60 += 8;
      v59 += 8;
    }
    while (v51 != v58);
  }
  if ([v57 count])
  {
    uint64_t v61 = [v57 copy];
    uint64_t v62 = v94;
    *uint64_t v94 = (id)v61;
    CFIndex v63 = [v57 count];
    CFArrayCallBacks callBacks = *(CFArrayCallBacks *)byte_270798918;
    CFMutableArrayRef v64 = CFArrayCreateMutable(0, v63, &callBacks);
    uint64_t v65 = (CFArrayRef *)v95;
    *uint64_t v95 = v64;
    id v66 = *v62;
    v102[0] = MEMORY[0x263EF8330];
    v102[1] = 3221225472;
    v102[2] = __PXDiffArraysWithObjectComparator_block_invoke_3;
    v102[3] = &unk_26545AAB0;
    v102[4] = v57;
    v102[5] = v17;
    v102[6] = v49;
    v102[7] = v56;
    v102[8] = v64;
    [v66 enumerateIndexesUsingBlock:v102];
    CFIndex Count = CFArrayGetCount(*v65);
    if (Count != [*v62 count])
    {
      uint64_t v87 = (void *)[MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v87, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void PXDiffArraysWithObjectComparator(NSArray * _Nonnull, NSArray * _Nonnull, NSArray * _Nonnull, NSComparator _Nullable, NSIndexSet * _Nonnull * _Nullable, NSIndexSet * _Nonnull * _Nullable, NSIndexSet * _Nonnull * _Nullable, CFArrayRef  _Nonnull * _Nullable, NSIndexSet * _Nonnull * _Nullable)"), @"NSArrayAdditions.m", 252, @"Mismatched move counts.");
    }
  }
  size_t v68 = v99;
  if (v51 >= 0x201) {
    NSZoneFree(0, v56);
  }
  id v69 = v89;
  if ([v89 count])
  {
    size_t v70 = [v69 count];
    unint64_t v72 = MEMORY[0x270FA5388](v70, v71);
    uint64_t v75 = (char *)&v88 - v74;
    if (v72 > 0x200) {
      uint64_t v75 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v88 - v74, 8 * v73);
    }
    objc_msgSend(v69, "getObjects:range:", v75, 0, v70);
    qsort_b(v75, v70, 8uLL, v17);
    uint64_t v76 = [MEMORY[0x263F089C8] indexSet];
    if (v68)
    {
      unint64_t v77 = (void *)v76;
      uint64_t v78 = 0;
      uint64_t v79 = 0;
      while (1)
      {
        if (bsearch_b(v49, v75, v70, 8uLL, v17))
        {
          [v77 addIndex:v78];
          if (++v79 == v70) {
            break;
          }
        }
        ++v78;
        v49 += 8;
        if (v68 == v78)
        {
          if (!v79) {
            goto LABEL_79;
          }
          goto LABEL_76;
        }
      }
      if (!v70) {
        goto LABEL_79;
      }
LABEL_76:
      uint64_t v80 = v96;
      if ([*v96 count]) {
        [v77 removeIndexes:*v80];
      }
      id v81 = v77;
      id *v91 = v81;
    }
LABEL_79:
    if (v70 >= 0x201) {
      NSZoneFree(0, v75);
    }
  }
  id v82 = *v93;
  id v83 = *v96;
  id v84 = *v94;
  if (*v95) {
    CFAutorelease(*v95);
  }
  return *v91;
}

uint64_t __PXDiffArraysWithObjectComparator_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __PXDiffArraysWithObjectComparator_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8 * a2);
  char v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _OWORD v8[2] = __PXDiffArraysWithObjectComparator_block_invoke_4;
  v8[3] = &unk_26545AA88;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  void v8[4] = v4;
  void v8[5] = v6;
  v8[6] = &v9;
  v8[7] = v7;
  [v5 enumerateIndexesUsingBlock:v8];
  if (v10[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    uint64_t v3 = v10[3];
  }
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 64), (const void *)v3);
  _Block_object_dispose(&v9, 8);
}

void sub_259D41538(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __PXDiffArraysWithObjectComparator_block_invoke_4(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!result)
  {
    *a3 = 1;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }
  return result;
}

uint64_t __PXDiffArraysWithObjectComparator_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (*a2 > *a3) {
    return 1;
  }
  else {
    return ((uint64_t)(*a2 - *a3) >> 63);
  }
}

id PXFlatMap(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = a2;
  if (v3)
  {
    char v5 = [MEMORY[0x263EFF980] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
          if (v11) {
            objc_msgSend(v5, "addObjectsFromArray:", v11, (void)v13);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

id PXFind(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t PXExists(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

id PXReduce(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = a3;
  id v8 = v6;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  long long v10 = v8;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v17;
    long long v10 = v8;
    do
    {
      uint64_t v13 = 0;
      long long v14 = v10;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v5);
        }
        long long v10 = v7[2](v7, *(void *)(*((void *)&v16 + 1) + 8 * v13), v14);

        ++v13;
        long long v14 = v10;
      }
      while (v11 != v13);
      uint64_t v11 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v10;
}

double PXReduceF(void *a1, void *a2, double a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        a3 = v6[2](v6, *(void *)(*((void *)&v12 + 1) + 8 * v10++), a3);
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return a3;
}

void sub_259D4461C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __PXSelectionCoordinatorGetLog_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F5D540], "PXSelectionCoordinator");
  uint64_t v1 = PXSelectionCoordinatorGetLog_log;
  PXSelectionCoordinatorGetLog_log = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t PXPointConvertFromCoordinateSpaceToCoordinateSpace(void *a1, const char *a2)
{
  return objc_msgSend(a1, "convertPoint:toCoordinateSpace:", a2);
}

uint64_t PXRectConvertFromCoordinateSpaceToCoordinateSpace(void *a1, const char *a2)
{
  return objc_msgSend(a1, "convertRect:toCoordinateSpace:", a2);
}

double PXRadiansToDegrees(double a1)
{
  return a1 * 180.0 / 3.14159265;
}

double PXDegreesToRadians(double a1)
{
  return a1 * 3.14159265 / 180.0;
}

double PXFloatSqrt(double a1)
{
  return sqrt(a1);
}

double PXFloatByParabolicallyInterpolatingFloats(double a1, double a2, double a3, double a4)
{
  return a1 + a4 * (a2 - a1 - (a3 - a3 * a4));
}

double PXFloatCeilingToPixel(double a1, double a2)
{
  return ceil(a1 * a2) / a2;
}

BOOL PXFloatEqualToFloatWithTolerance(double a1, double a2, double a3)
{
  return vabdd_f64(a1, a2) <= a3;
}

BOOL PXFloatGreaterThanFloat(double a1, double a2)
{
  return a1 - a2 > 0.00000011920929;
}

BOOL PXFloatGreaterThanOrApproximatelyEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 0.00000999999975 || a1 - a2 > 0.00000011920929;
}

double PXFloatRandomValueBetween(double a1, double a2)
{
  return (a2 - a1) * (double)arc4random() / 4294967300.0 + a1;
}

uint64_t PXFloatNan()
{
  return MEMORY[0x270F53670]();
}

double PXFloatRoundInDirection(double a1, double a2)
{
  if (a2 > 0.0) {
    return ceil(a1);
  }
  if (a2 < 0.0) {
    return floor(a1);
  }
  return round(a1);
}

unint64_t PXSectionedFetchResultIndexOfObject(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (objc_opt_respondsToSelector()) {
    unint64_t ResultIndexOfObjectInRange = [v3 indexOfObject:v4];
  }
  else {
    unint64_t ResultIndexOfObjectInRange = PXSectionedFetchResultIndexOfObjectInRange(v3, v4, 0, [v3 count]);
  }
  unint64_t v6 = ResultIndexOfObjectInRange;

  return v6;
}

unint64_t PXSectionedFetchResultIndexOfObjectInRange(void *a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if (objc_opt_respondsToSelector())
  {
    a3 = objc_msgSend(v7, "indexOfObject:inRange:", v8, a3, a4);
  }
  else if (a3 >= a3 + a4)
  {
LABEL_7:
    a3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    while (1)
    {
      id v9 = [v7 objectAtIndex:a3];
      if (v9 == v8) {
        break;
      }
      uint64_t v10 = v9;
      char v11 = [v8 isEqual:v9];

      if (v11) {
        goto LABEL_9;
      }
      ++a3;
      if (!--a4) {
        goto LABEL_7;
      }
    }
  }
LABEL_9:

  return a3;
}

uint64_t PXMinRectEdgeForAxis(uint64_t a1)
{
  if (a1 == 2) {
    return 0;
  }
  if (!a1)
  {
    unint64_t v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v2, v1, v3, v4);
    id v7 = [NSString stringWithUTF8String:"CGRectEdge PXMinRectEdgeForAxis(PXAxis)"];
    [v6 handleFailureInFunction:v7 file:@"PXAxis.m" lineNumber:75 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 1;
}

uint64_t PXMaxRectEdgeForAxis(uint64_t result)
{
  if (result != 2)
  {
    if (!result)
    {
      id v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v2, v1, v3, v4);
      unint64_t v6 = [NSString stringWithUTF8String:"CGRectEdge PXMaxRectEdgeForAxis(PXAxis)"];
      [v5 handleFailureInFunction:v6 file:@"PXAxis.m" lineNumber:86 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    return 3;
  }
  return result;
}

double PXRectGetMidForAxis(uint64_t a1, double result, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 1:
      return CGRectGetMidY(*(CGRect *)&result);
    case 2:
      return CGRectGetMidX(*(CGRect *)&result);
    case 0:
      id v9 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v6, v5, v7, v8);
      uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat PXRectGetMidForAxis(CGRect, PXAxis)");
      [v9 handleFailureInFunction:v10 file:@"PXAxis.m" lineNumber:108 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  return result;
}

double PXRectGetLengthForAxis(uint64_t a1, double result, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 1:
      return CGRectGetHeight(*(CGRect *)&result);
    case 2:
      return CGRectGetWidth(*(CGRect *)&result);
    case 0:
      id v9 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v6, v5, v7, v8);
      uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat PXRectGetLengthForAxis(CGRect, PXAxis)");
      [v9 handleFailureInFunction:v10 file:@"PXAxis.m" lineNumber:130 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  return result;
}

__CFString *PXAxisDescription(uint64_t a1)
{
  uint64_t v1 = @"Vertical";
  if (a1 == 2) {
    uint64_t v1 = @"Horizontal";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Undefined";
  }
}

BOOL PXAssetBadgeInfoIsActionableDisabled(void *a1)
{
  return (*a1 & 0x80000004000) != 0;
}

BOOL PXAssetBadgeInfoIsActionable(void *a1)
{
  return (*a1 & 0x4C000002000) != 0;
}

BOOL PXAssetBadgeInfoIsToggleable(uint64_t a1)
{
  return (*(unsigned char *)(a1 + 2) & 0x60) != 0;
}

uint64_t PXAssetBadgeInfoIsLivePhotoToggleable(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 2) >> 5) & 1;
}

BOOL PXAssetBadgeInfoIsToggledOn(uint64_t a1)
{
  return (*(_WORD *)(a1 + 2) & 0x280) != 0;
}

BOOL PXAssetBadgeInfoEqualToBadgeInfo(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2
      && *(double *)(a1 + 8) == *(double *)(a2 + 8)
      && *(void *)(a1 + 16) == *(void *)(a2 + 16)
      && *(void *)(a1 + 24) == *(void *)(a2 + 24);
}

uint64_t PXAssetBadgeInfoRequiresCountForBadges(unint64_t a1)
{
  return (a1 >> 3) & 1;
}

uint64_t PXAssetBadgeInfoCreateWithBadges@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  a2[2] = 0;
  a2[3] = 0;
  *a2 = result;
  a2[1] = 0;
  return result;
}

void PXAssetBadgeInfoCreateWithDuration(uint64_t a1@<X8>, double a2@<D0>)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(double *)(a1 + 8) = a2;
}

void sub_259D46FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PXImageDynamicRangeIsGreaterThanStandard(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *PXDisplayAssetCollectionCurationLengthDescription(unint64_t a1)
{
  if (a1 > 5) {
    return @"?";
  }
  else {
    return off_26545AC60[a1];
  }
}

id PXAssertGetLog()
{
  if (PXAssertGetLog_predicate != -1) {
    dispatch_once(&PXAssertGetLog_predicate, &__block_literal_global_4959);
  }
  os_log_t v0 = (void *)PXAssertGetLog_log;

  return v0;
}

uint64_t __PXAssertGetLog_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F5D540], "PXAssert");
  uint64_t v1 = PXAssertGetLog_log;
  PXAssertGetLog_log = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

BOOL PXScrollViewIsScrollableAlongAxis(void *a1, uint64_t a2)
{
  id v3 = a1;
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat rect = v10;
  [v3 contentSize];
  double v25 = v11;
  double v13 = v12;
  [v3 adjustedContentInset];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  if (a2 == 1)
  {
    v28.origin.CGFloat x = v5;
    v28.origin.CGFloat y = v7;
    v28.size.CGFloat width = v9;
    v28.size.CGFloat height = rect;
    double Height = CGRectGetHeight(v28);
    double v23 = v19 + v13 + v15;
    return Height < v23;
  }
  if (a2 == 2)
  {
    v27.origin.CGFloat x = v5;
    v27.origin.CGFloat y = v7;
    v27.size.CGFloat width = v9;
    v27.size.CGFloat height = rect;
    double Height = CGRectGetWidth(v27);
    double v23 = v21 + v25 + v17;
    return Height < v23;
  }
  return 0;
}

double PXStoryRectOuterBounds(_OWORD *a1)
{
  long long v1 = a1[1];
  *(_OWORD *)&v6.CGFloat a = *a1;
  *(_OWORD *)&v6.CGFloat c = v1;
  *(_OWORD *)&v6.CGFloat tx = a1[2];
  uint64_t v2 = 0;
  *(void *)&long long v1 = 0;
  double v3 = 1.0;
  double v4 = 1.0;
  *(void *)&double result = (unint64_t)CGRectApplyAffineTransform(*(CGRect *)((char *)&v1 - 8), &v6);
  return result;
}

void PXStoryRectDecompose(_OWORD *a1, double *a2, double *a3)
{
  long long v6 = a1[1];
  *(_OWORD *)&v19.CGFloat a = *a1;
  *(_OWORD *)&v19.CGFloat c = v6;
  *(_OWORD *)&v19.CGFloat tx = a1[2];
  uint64_t v7 = 0;
  *(void *)&long long v6 = 0;
  double v8 = 1.0;
  double v9 = 1.0;
  CGRect v20 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v6 - 8), &v19);
  double x = v20.origin.x;
  double y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  double v17 = 0.0;
  double v18 = 0.0;
  *(_OWORD *)&v20.origin.double y = a1[1];
  *(_OWORD *)&v19.CGFloat a = *a1;
  *(_OWORD *)&v19.CGFloat c = *(_OWORD *)&v20.origin.y;
  *(_OWORD *)&v19.CGFloat tx = a1[2];
  PXAffineTransformDecomposeTranslationScaleRotation((uint64_t)&v19, 0, &v17, &v18, a3);
  if (a2)
  {
    double v14 = v17;
    double v15 = v18;
    double v16 = y + height * 0.5 + v18 * -0.5;
    *a2 = x + width * 0.5 + v17 * -0.5;
    a2[1] = v16;
    a2[2] = v14;
    a2[3] = v15;
  }
}

void PXStoryRectLinearlyInterpolatingRects(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>, double a4@<D0>)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v13 = 0.0;
  double v14 = 0.0;
  long long v7 = a1[1];
  *(_OWORD *)&v19.CGFloat a = *a1;
  *(_OWORD *)&v19.CGFloat c = v7;
  *(_OWORD *)&v19.CGFloat tx = a1[2];
  PXStoryRectDecompose(&v19, (double *)&v17, &v14);
  long long v8 = a2[1];
  *(_OWORD *)&v19.CGFloat a = *a2;
  *(_OWORD *)&v19.CGFloat c = v8;
  *(_OWORD *)&v19.CGFloat tx = a2[2];
  PXStoryRectDecompose(&v19, (double *)&v15, &v13);
  CGFloat v9 = *(double *)&v17 + a4 * (*(double *)&v15 - *(double *)&v17);
  CGFloat v10 = *((double *)&v17 + 1) + a4 * (*((double *)&v15 + 1) - *((double *)&v17 + 1));
  CGFloat v11 = *(double *)&v18 + a4 * (*(double *)&v16 - *(double *)&v18);
  CGFloat v12 = *((double *)&v18 + 1) + a4 * (*((double *)&v16 + 1) - *((double *)&v18 + 1));
  CGAffineTransformMakeRotation(&v19, v14 + a4 * (v13 - v14));
  PXStoryRectFromCGRectApplyingTransformWithAnchorPoint(&v19, a3, v9, v10, v11, v12, 0.5, 0.5);
}

CGFloat PXStoryRectFromCGRectApplyingTransformWithAnchorPoint@<D0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, double a7@<D4>, double a8@<D5>)
{
  *(_OWORD *)&a2->CGFloat c = 0u;
  *(_OWORD *)&a2->CGFloat tx = 0u;
  *(_OWORD *)&a2->CGFloat a = 0u;
  PXStoryRectFromCGRect(a2, a3, a4, a5, a6);
  memset(&v25, 0, sizeof(v25));
  CGAffineTransformMakeTranslation(&v25, -(a3 + a7 * a5), -(a4 + a8 * a6));
  long long v16 = *(_OWORD *)&a2->c;
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&a2->a;
  *(_OWORD *)&t1.CGFloat c = v16;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)&a2->tx;
  CGAffineTransform t2 = v25;
  CGAffineTransformConcat(a2, &t1, &t2);
  long long v17 = *(_OWORD *)&a2->c;
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&a2->a;
  *(_OWORD *)&t1.CGFloat c = v17;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)&a2->tx;
  long long v18 = a1[1];
  *(_OWORD *)&t2.CGFloat a = *a1;
  *(_OWORD *)&t2.CGFloat c = v18;
  *(_OWORD *)&t2.CGFloat tx = a1[2];
  CGAffineTransformConcat(&v24, &t1, &t2);
  long long v19 = *(_OWORD *)&v24.c;
  *(_OWORD *)&a2->CGFloat a = *(_OWORD *)&v24.a;
  *(_OWORD *)&a2->CGFloat c = v19;
  *(_OWORD *)&a2->CGFloat tx = *(_OWORD *)&v24.tx;
  CGAffineTransform t1 = v25;
  CGAffineTransformInvert(&v23, &t1);
  long long v20 = *(_OWORD *)&a2->c;
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&a2->a;
  *(_OWORD *)&t1.CGFloat c = v20;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)&a2->tx;
  CGAffineTransform t2 = v23;
  CGAffineTransformConcat(&v24, &t1, &t2);
  long long v21 = *(_OWORD *)&v24.c;
  *(_OWORD *)&a2->CGFloat a = *(_OWORD *)&v24.a;
  *(_OWORD *)&a2->CGFloat c = v21;
  CGFloat result = v24.tx;
  *(_OWORD *)&a2->CGFloat tx = *(_OWORD *)&v24.tx;
  return result;
}

void PXStoryRectFromCGRect(_OWORD *a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  if (CGRectIsNull(*(CGRect *)&a2))
  {
    *a1 = PXStoryRectNull;
    a1[1] = unk_259D74998;
    long long v10 = xmmword_259D749A8;
  }
  else
  {
    PXAffineTransformMakeFromRects((uint64_t)v12, 0.0, 0.0, 1.0, 1.0, a2, a3, a4, a5);
    long long v11 = v12[1];
    *a1 = v12[0];
    a1[1] = v11;
    long long v10 = v12[2];
  }
  a1[2] = v10;
}

void PXStoryRectFromCGRectCenterRotation(CGAffineTransform *a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>, CGFloat a6@<D4>)
{
  CGAffineTransformMakeRotation(&v11, a6);
  PXStoryRectFromCGRectApplyingTransformWithAnchorPoint(&v11, a1, a2, a3, a4, a5, 0.5, 0.5);
}

id PXStoryRectDescription(_OWORD *a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  double v6 = 0.0;
  long long v1 = a1[1];
  v5[0] = *a1;
  v5[1] = v1;
  uint64_t v5[2] = a1[2];
  PXStoryRectDecompose(v5, (double *)&v7, &v6);
  id v2 = [NSString alloc];
  double v3 = (void *)[v2 initWithFormat:@"{ x=%0.4f, y=%0.4f, w=%0.4f, h=%0.4f, r=%0.2f° }", v7, v8, v6 * 180.0 / 3.14159265];

  return v3;
}

CGPath *PXStoryRectPath(const CGAffineTransform *a1)
{
  Mutable = CGPathCreateMutable();
  v4.origin.double x = 0.0;
  v4.origin.double y = 0.0;
  v4.size.double width = 1.0;
  v4.size.double height = 1.0;
  CGPathAddRect(Mutable, a1, v4);
  return Mutable;
}

BOOL PXStoryRectEqualToRect(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v2;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  long long v3 = a2[1];
  *(_OWORD *)&v5.CGFloat a = *a2;
  *(_OWORD *)&v5.CGFloat c = v3;
  *(_OWORD *)&v5.CGFloat tx = a2[2];
  return CGAffineTransformEqualToTransform(&t1, &v5);
}

BOOL PXStoryRectIsNull(_OWORD *a1)
{
  long long v1 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v1;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  CGAffineTransform v3 = *(CGAffineTransform *)PXStoryRectNull;
  return CGAffineTransformEqualToTransform(&t1, &v3);
}

BOOL PXStoryRectIsEmpty(_OWORD *a1)
{
  long long v2 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v2;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  CGAffineTransform v8 = *(CGAffineTransform *)PXStoryRectNull;
  if (CGAffineTransformEqualToTransform(&t1, &v8)) {
    return 1;
  }
  long long v4 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v4;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  uint64_t v5 = 0;
  *(void *)&long long v4 = 0;
  double v6 = 1.0;
  double v7 = 1.0;
  CGRect v10 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v4 - 8), &t1);
  return CGRectIsEmpty(v10);
}

CGAffineTransform *PXStoryRectApplyAffineTransform@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  long long v3 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v3;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  long long v4 = a2[1];
  *(_OWORD *)&v6.CGFloat a = *a2;
  *(_OWORD *)&v6.CGFloat c = v4;
  *(_OWORD *)&v6.CGFloat tx = a2[2];
  return CGAffineTransformConcat(a3, &t1, &v6);
}

CGFloat PXStoryRectFromStoryRectApplyingTransformWithAnchorPoint@<D0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  long long v26 = 0u;
  long long v27 = 0u;
  CGFloat angle = 0.0;
  long long v9 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v9;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  PXStoryRectDecompose(&t1, (double *)&v26, &angle);
  long long v10 = v26;
  long long v11 = v27;
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeTranslation(&v24, -(*(double *)&v26 + a4 * *(double *)&v27), -(*((double *)&v26 + 1) + a5 * *((double *)&v27 + 1)));
  *(_OWORD *)&a3->CGFloat c = 0u;
  *(_OWORD *)&a3->CGFloat tx = 0u;
  *(_OWORD *)&a3->CGFloat a = 0u;
  PXStoryRectFromCGRect(a3, *(CGFloat *)&v10, *((CGFloat *)&v10 + 1), *(CGFloat *)&v11, *((CGFloat *)&v11 + 1));
  long long v12 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.CGFloat c = v12;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)&a3->tx;
  CGAffineTransform t2 = v24;
  CGAffineTransformConcat(a3, &t1, &t2);
  CGAffineTransformMakeRotation(&v22, angle);
  long long v13 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.CGFloat c = v13;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)&a3->tx;
  CGAffineTransform t2 = v22;
  CGAffineTransformConcat(&v23, &t1, &t2);
  long long v14 = *(_OWORD *)&v23.c;
  *(_OWORD *)&a3->CGFloat a = *(_OWORD *)&v23.a;
  *(_OWORD *)&a3->CGFloat c = v14;
  *(_OWORD *)&a3->CGFloat tx = *(_OWORD *)&v23.tx;
  long long v15 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.CGFloat c = v15;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)&a3->tx;
  long long v16 = a2[1];
  *(_OWORD *)&t2.CGFloat a = *a2;
  *(_OWORD *)&t2.CGFloat c = v16;
  *(_OWORD *)&t2.CGFloat tx = a2[2];
  CGAffineTransformConcat(&v23, &t1, &t2);
  long long v17 = *(_OWORD *)&v23.c;
  *(_OWORD *)&a3->CGFloat a = *(_OWORD *)&v23.a;
  *(_OWORD *)&a3->CGFloat c = v17;
  *(_OWORD *)&a3->CGFloat tx = *(_OWORD *)&v23.tx;
  CGAffineTransform t1 = v24;
  CGAffineTransformInvert(&v21, &t1);
  long long v18 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.CGFloat c = v18;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)&a3->tx;
  CGAffineTransform t2 = v21;
  CGAffineTransformConcat(&v23, &t1, &t2);
  long long v19 = *(_OWORD *)&v23.c;
  *(_OWORD *)&a3->CGFloat a = *(_OWORD *)&v23.a;
  *(_OWORD *)&a3->CGFloat c = v19;
  CGFloat result = v23.tx;
  *(_OWORD *)&a3->CGFloat tx = *(_OWORD *)&v23.tx;
  return result;
}

CGAffineTransform *PXStoryRectNormalize@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  long long v5 = a2[1];
  *(_OWORD *)&v8.CGFloat a = *a2;
  *(_OWORD *)&v8.CGFloat c = v5;
  *(_OWORD *)&v8.CGFloat tx = a2[2];
  CGAffineTransformInvert(&t2, &v8);
  long long v6 = a1[1];
  *(_OWORD *)&v8.CGFloat a = *a1;
  *(_OWORD *)&v8.CGFloat c = v6;
  *(_OWORD *)&v8.CGFloat tx = a1[2];
  return CGAffineTransformConcat(a3, &v8, &t2);
}

CGAffineTransform *PXStoryRectDenormalize@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  long long v3 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v3;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  long long v4 = a2[1];
  *(_OWORD *)&v6.CGFloat a = *a2;
  *(_OWORD *)&v6.CGFloat c = v4;
  *(_OWORD *)&v6.CGFloat tx = a2[2];
  return CGAffineTransformConcat(a3, &t1, &v6);
}

CGAffineTransform *PXStoryAffineTransformBetweenRects@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  long long v5 = a1[1];
  *(_OWORD *)&v8.CGFloat a = *a1;
  *(_OWORD *)&v8.CGFloat c = v5;
  *(_OWORD *)&v8.CGFloat tx = a1[2];
  CGAffineTransformInvert(&t1, &v8);
  long long v6 = a2[1];
  *(_OWORD *)&v8.CGFloat a = *a2;
  *(_OWORD *)&v8.CGFloat c = v6;
  *(_OWORD *)&v8.CGFloat tx = a2[2];
  return CGAffineTransformConcat(a3, &t1, &v8);
}

CGAffineTransform *PXStoryRectFitIntoUnitRect@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>)
{
  long long v2 = a1[1];
  v4[0] = *a1;
  v4[1] = v2;
  uint64_t v4[2] = a1[2];
  return PXStoryRectFitIntoRect(v4, a2, 0.0, 0.0, 1.0, 1.0);
}

CGAffineTransform *PXStoryRectFitIntoRect@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  memset(&v18, 0, sizeof(v18));
  long long v12 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v12;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  uint64_t v13 = 0;
  *(void *)&long long v12 = 0;
  double v14 = 1.0;
  double v15 = 1.0;
  CGRect v21 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v12 - 8), &t1);
  _PXStoryAffineTransformFittingRectIntoRect((uint64_t)&v18, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, a3, a4, a5, a6);
  long long v16 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v16;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  CGAffineTransform t2 = v18;
  return CGAffineTransformConcat(a2, &t1, &t2);
}

uint64_t _PXStoryAffineTransformFittingRectIntoRect(uint64_t result, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v9 = a2 + a4;
  double v10 = a3 + a5;
  double v11 = a8 / (v9 - a2);
  if (v11 >= a9 / (v10 - a3)) {
    double v11 = a9 / (v10 - a3);
  }
  if (v11 > 1.0) {
    double v11 = 1.0;
  }
  double v12 = (a2 + v9) * 0.5;
  double v13 = (a3 + v10) * 0.5;
  double v14 = a6 - a2 * v11;
  double v15 = 1.0 - v11;
  double v16 = v12 * (1.0 - v11);
  double v17 = a6 + a8 - v9 * v11;
  if (v16 < v17) {
    double v17 = v16;
  }
  if (v17 > v14) {
    double v14 = v17;
  }
  double v18 = a7 - a3 * v11;
  double v19 = v13 * v15;
  double v20 = a7 + a9 - v10 * v11;
  if (v13 * v15 >= v20) {
    double v19 = v20;
  }
  *(double *)CGFloat result = v11;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  if (v19 > v18) {
    double v18 = v19;
  }
  *(double *)(result + 24) = v11;
  *(double *)(result + 32) = v14;
  *(double *)(result + 40) = v18;
  return result;
}

CGFloat PXStoryRectsFitIntoUnitRect(_OWORD *a1, _OWORD *a2)
{
  return PXStoryRectsFitIntoRect(a1, a2, 0.0, 0.0, 1.0, 1.0);
}

CGFloat PXStoryRectsFitIntoRect(_OWORD *a1, _OWORD *a2, double a3, double a4, double a5, double a6)
{
  memset(&v26, 0, sizeof(v26));
  long long v12 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v12;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  uint64_t v13 = 0;
  *(void *)&long long v12 = 0;
  double v14 = 1.0;
  double v15 = 1.0;
  CGRect v29 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v12 - 8), &t1);
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  *(_OWORD *)&v29.origin.CGFloat y = a2[1];
  *(_OWORD *)&t1.CGFloat a = *a2;
  *(_OWORD *)&t1.CGFloat c = *(_OWORD *)&v29.origin.y;
  *(_OWORD *)&t1.CGFloat tx = a2[2];
  v29.origin.CGFloat x = 0.0;
  v29.origin.CGFloat y = 0.0;
  v29.size.CGFloat width = 1.0;
  v29.size.CGFloat height = 1.0;
  CGRect v32 = CGRectApplyAffineTransform(v29, &t1);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGRect v31 = CGRectUnion(v30, v32);
  _PXStoryAffineTransformFittingRectIntoRect((uint64_t)&v26, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height, a3, a4, a5, a6);
  long long v20 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v20;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  CGAffineTransform t2 = v26;
  CGAffineTransformConcat(&v25, &t1, &t2);
  long long v21 = *(_OWORD *)&v25.c;
  *a1 = *(_OWORD *)&v25.a;
  a1[1] = v21;
  a1[2] = *(_OWORD *)&v25.tx;
  long long v22 = a2[1];
  *(_OWORD *)&t1.CGFloat a = *a2;
  *(_OWORD *)&t1.CGFloat c = v22;
  *(_OWORD *)&t1.CGFloat tx = a2[2];
  CGAffineTransform t2 = v26;
  CGAffineTransformConcat(&v25, &t1, &t2);
  long long v23 = *(_OWORD *)&v25.c;
  *a2 = *(_OWORD *)&v25.a;
  a2[1] = v23;
  CGFloat result = v25.tx;
  a2[2] = *(_OWORD *)&v25.tx;
  return result;
}

uint64_t PXStoryAffineTransformFittingRectsIntoRect@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D4>, double a4, double a5, double a6, double a7)
{
  CGRect v16 = CGRectUnion(*(CGRect *)&a2, *(CGRect *)&a3);

  return _PXStoryAffineTransformFittingRectIntoRect(a1, v16.origin.x, v16.origin.y, v16.size.width, v16.size.height, a4, a5, a6, a7);
}

uint64_t PXSystemFontOfSizeAndWeight()
{
  return objc_msgSend(MEMORY[0x263F81708], "systemFontOfSize:weight:");
}

id PXFontCreate(void *a1, CGFloat a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  if ([v3 isEqualToString:PXSanFranciscoProCompressedBold])
  {
    uint64_t v11 = *MEMORY[0x263F03AE8];
    v12[0] = PXSanFranciscoProCompressedBold;
    long long v4 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    long long v5 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithAttributesAndOptions();

    long long v6 = CTFontCreateWithFontDescriptor(v5, a2, 0);
    CFRelease(v5);
  }
  else if ([v3 isEqualToString:PXSanFranciscoSystemSerifBoldFontName])
  {
    double v7 = [MEMORY[0x263F81708] systemFontOfSize:a2 weight:*MEMORY[0x263F81840]];
    CGAffineTransform v8 = [v7 fontDescriptor];
    double v9 = [v8 fontDescriptorWithDesign:*MEMORY[0x263F81790]];

    long long v6 = [MEMORY[0x263F81708] fontWithDescriptor:v9 size:a2];
  }
  else
  {
    long long v6 = [MEMORY[0x263F81708] fontWithName:v3 size:a2];
  }

  return v6;
}

uint64_t PXFontCreateWithDescriptorAndSize(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x263F81708], "fontWithDescriptor:size:", a1);
}

id PXCappedFontWithTextStyle(uint64_t a1, unint64_t a2)
{
  return _PXFontWithTextStyleSymbolicTraits(a1, 0, a2);
}

id PXCappedFontWithTextStyleAndWeight(uint64_t a1, unint64_t a2, double a3)
{
  return _PXFontWithTextStyleSymbolicTraitsAndWeight(a1, 0, a2, a3);
}

id _PXFontWithTextStyleSymbolicTraitsAndWeight(uint64_t a1, uint64_t a2, unint64_t a3, double a4)
{
  double v7 = UIFontTextStyleFromPXFontTextStyle(a1);
  UIContentSizeCategoryFromPXPreferredContentSizeCategory(a3);
  CGAffineTransform v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  UserPreferredContentSizeCategory();
  double v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  double v10 = v9;
  if (v8 == (NSString *)*MEMORY[0x263F83490] || UIContentSizeCategoryCompareToCategory(v9, v8) != NSOrderedDescending)
  {
    double v14 = [MEMORY[0x263F81720] _preferredFontDescriptorWithTextStyle:v7 addingSymbolicTraits:a2 design:*MEMORY[0x263F81778] weight:0 compatibleWithTraitCollection:a4];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263F81720];
    uint64_t v12 = *MEMORY[0x263F81778];
    uint64_t v13 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:v8];
    double v14 = [v11 _preferredFontDescriptorWithTextStyle:v7 addingSymbolicTraits:a2 design:v12 weight:v13 compatibleWithTraitCollection:a4];
  }
  double v15 = [MEMORY[0x263F81708] fontWithDescriptor:v14 size:0.0];

  return v15;
}

id PXFontWithTextStyle(uint64_t a1)
{
  return _PXFontWithTextStyleSymbolicTraits(a1, 0, 9uLL);
}

id PXFontWithTextStyleAndWeight(uint64_t a1, double a2)
{
  return _PXFontWithTextStyleSymbolicTraitsAndWeight(a1, 0, 9uLL, a2);
}

id PXFontWithTextStyleSymbolicTraitsAndWeight(uint64_t a1, uint64_t a2, double a3)
{
  return _PXFontWithTextStyleSymbolicTraitsAndWeight(a1, a2, 9uLL, a3);
}

id PXMonospacedNumberFontWithSize(double a1)
{
  return PXMonospacedNumberFontWithSizeAndWeight(a1, *MEMORY[0x263F81838]);
}

id PXMonospacedNumberFontWithSizeAndWeight(double a1, double a2)
{
  void v29[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F817B0];
  v27[0] = *MEMORY[0x263F817B8];
  uint64_t v4 = v27[0];
  v27[1] = v5;
  v28[0] = &unk_2707AEDE0;
  v28[1] = &unk_2707AEDF8;
  long long v6 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  v29[0] = v6;
  v25[0] = v4;
  v25[1] = v5;
  v26[0] = &unk_2707AEE10;
  v26[1] = &unk_2707AEE28;
  double v7 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  v29[1] = v7;
  v23[0] = v4;
  v23[1] = v5;
  v24[0] = &unk_2707AEE10;
  v24[1] = &unk_2707AEE40;
  CGAffineTransform v8 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v29[2] = v8;
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];

  double v10 = [MEMORY[0x263F81708] systemFontOfSize:a1];
  uint64_t v11 = [v10 fontDescriptor];

  uint64_t v21 = *MEMORY[0x263F81850];
  uint64_t v12 = [NSNumber numberWithDouble:a2];
  long long v22 = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  double v14 = [v11 fontDescriptorByAddingAttributes:v13];

  uint64_t v19 = *MEMORY[0x263F81748];
  long long v20 = v9;
  double v15 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  CGRect v16 = [v14 fontDescriptorByAddingAttributes:v15];

  double v17 = [MEMORY[0x263F81708] fontWithDescriptor:v16 size:a1];

  return v17;
}

double PXFontScaleForTextStyle(uint64_t a1)
{
  long long v2 = UIFontTextStyleFromPXFontTextStyle(a1);
  id v3 = _PXFontWithTextStyleSymbolicTraits(a1, 0, 9uLL);
  [v3 lineHeight];
  double v5 = v4;
  long long v6 = [MEMORY[0x263F81708] defaultFontForTextStyle:v2];
  [v6 lineHeight];
  double v8 = v5 / v7;

  return v8;
}

uint64_t PXIsSanFranciscoFontName(void *a1, const char *a2)
{
  return [a1 hasPrefix:@".SF"];
}

BOOL PXFontCanEncodeString(void *a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v4 length];
  BOOL GlyphsForCharacters = 1;
  if (v3)
  {
    CFIndex v8 = v5;
    if (v5)
    {
      uint64_t v9 = 2 * v5;
      MEMORY[0x270FA5388](v5, v6);
      unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v11 = objc_msgSend(v4, "getCharacters:range:", (char *)v14 - v10, 0, v8);
      MEMORY[0x270FA5388](v11, v12);
      BOOL GlyphsForCharacters = CTFontGetGlyphsForCharacters(v3, (const UniChar *)((char *)v14 - v10), (CGGlyph *)((char *)v14 - v10), v8);
    }
  }

  return GlyphsForCharacters;
}

void sub_259D4BFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_259D4C50C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_259D4C6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5347(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5348(uint64_t a1)
{
}

void sub_259D4CA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D4D040(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_259D4D404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

id PXImageFromCGImage(uint64_t a1)
{
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:a1];

  return v1;
}

void PXTileGeometryApplyAffineTransform(_OWORD *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  long long v5 = a1[9];
  *(_OWORD *)(a3 + 128) = a1[8];
  *(_OWORD *)(a3 + 144) = v5;
  long long v6 = a1[11];
  *(_OWORD *)(a3 + 160) = a1[10];
  *(_OWORD *)(a3 + 176) = v6;
  long long v7 = a1[5];
  *(_OWORD *)(a3 + 64) = a1[4];
  *(_OWORD *)(a3 + 80) = v7;
  long long v8 = a1[7];
  *(_OWORD *)(a3 + 96) = a1[6];
  *(_OWORD *)(a3 + 112) = v8;
  long long v9 = a1[1];
  *(_OWORD *)a3 = *a1;
  *(_OWORD *)(a3 + 16) = v9;
  long long v10 = a1[3];
  *(_OWORD *)(a3 + 32) = a1[2];
  *(_OWORD *)(a3 + 48) = v10;
  long long v11 = a2[1];
  *(_OWORD *)&t1.CGFloat a = *a2;
  *(_OWORD *)&t1.CGFloat c = v11;
  *(_OWORD *)&t1.CGFloat tx = a2[2];
  long long v12 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)&v14.CGFloat a = *(_OWORD *)(a3 + 64);
  *(_OWORD *)&v14.CGFloat c = v12;
  *(_OWORD *)&v14.CGFloat tx = *(_OWORD *)(a3 + 96);
  CGAffineTransformConcat((CGAffineTransform *)(a3 + 64), &t1, &v14);
  CGRect v16 = *(CGRect *)a3;
  long long v13 = a2[1];
  *(_OWORD *)&t1.CGFloat a = *a2;
  *(_OWORD *)&t1.CGFloat c = v13;
  *(_OWORD *)&t1.CGFloat tx = a2[2];
  *(CGRect *)a3 = CGRectApplyAffineTransform(v16, &t1);
}

id PXTileGeometryDescription(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x263F089D8];
  id v3 = NSStringFromCGRect(*(CGRect *)a1);
  id v4 = [v2 stringWithFormat:@"{frame:%@", v3];

  double v5 = *(double *)(a1 + 16);
  double v6 = *(double *)(a1 + 24);
  double v7 = *(double *)(a1 + 32);
  double v8 = *(double *)(a1 + 40);
  if (v7 != *(double *)a1 + v5 * 0.5 || v8 != *(double *)(a1 + 8) + v6 * 0.5)
  {
    long long v10 = NSStringFromCGPoint(*(CGPoint *)&v7);
    [v4 appendFormat:@" center:%@", v10];

    double v5 = *(double *)(a1 + 16);
    double v6 = *(double *)(a1 + 24);
  }
  double v11 = *(double *)(a1 + 48);
  double v12 = *(double *)(a1 + 56);
  if (v11 != v5 || v12 != v6)
  {
    CGAffineTransform v14 = NSStringFromCGSize(*(CGSize *)&v11);
    [v4 appendFormat:@" size:%@", v14];
  }
  long long v15 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&t1.CGFloat c = v15;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(a1 + 96);
  long long v16 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&t2.CGFloat a = *MEMORY[0x263F000D0];
  *(_OWORD *)&t2.CGFloat c = v16;
  *(_OWORD *)&t2.CGFloat tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    long long v17 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&t1.CGFloat a = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&t1.CGFloat c = v17;
    *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(a1 + 96);
    double v18 = NSStringFromCGAffineTransform(&t1);
    [v4 appendFormat:@" transform:%@", v18];
  }
  if (*(double *)(a1 + 112) != 1.0) {
    objc_msgSend(v4, "appendFormat:", @" alpha:%f", *(void *)(a1 + 112));
  }
  if (*(unsigned char *)(a1 + 128)) {
    [v4 appendFormat:@" hidden:%@", @"YES"];
  }
  double v19 = *(double *)(a1 + 136);
  double v20 = *(double *)(a1 + 144);
  if (v19 != *(double *)(a1 + 48) || v20 != *(double *)(a1 + 56))
  {
    uint64_t v21 = NSStringFromCGSize(*(CGSize *)&v19);
    [v4 appendFormat:@" contentSize:%@", v21];
  }
  [v4 appendString:@"}"];

  return v4;
}

uint64_t PXUpdateFlagsReset(uint64_t result)
{
  *(void *)CGFloat result = 0;
  *(void *)(result + 8) = 0;
  *(_WORD *)(result + 16) = 0;
  return result;
}

id getPFCropUtilitiesCoreClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getPFCropUtilitiesCoreClass_softClass;
  uint64_t v7 = getPFCropUtilitiesCoreClass_softClass;
  if (!getPFCropUtilitiesCoreClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getPFCropUtilitiesCoreClass_block_invoke;
    v3[3] = &unk_26545B158;
    void v3[4] = &v4;
    __getPFCropUtilitiesCoreClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_259D4EDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPFCropUtilitiesCoreClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!PhotosFormatsLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    void v6[2] = (void *)3221225472;
    v6[3] = __PhotosFormatsLibraryCore_block_invoke;
    void v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_26545B178;
    uint64_t v8 = 0;
    PhotosFormatsLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!PhotosFormatsLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *PhotosFormatsLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PXSyntheticAsset.m", 26, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("PFCropUtilitiesCore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    double v5 = [NSString stringWithUTF8String:"Class getPFCropUtilitiesCoreClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXSyntheticAsset.m", 27, @"Unable to find class %s", "PFCropUtilitiesCore");

LABEL_10:
    __break(1u);
  }
  getPFCropUtilitiesCoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PhotosFormatsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosFormatsLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

id PXChangeDetailsCoalescerGetLog()
{
  if (PXChangeDetailsCoalescerGetLog_predicate != -1) {
    dispatch_once(&PXChangeDetailsCoalescerGetLog_predicate, &__block_literal_global_6026);
  }
  os_log_t v0 = (void *)PXChangeDetailsCoalescerGetLog_log;

  return v0;
}

_PXChangeDetailsEntry *_PXChangeDetailsEntryForSection(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 itemChangesInSection:a1];
  double v5 = [[_PXChangeDetailsEntry alloc] initWithIndex:a1 changeDetails:v4];
  uint64_t v6 = [v3 itemsWithSubitemChangesInSection:a1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = ___PXChangeDetailsEntryForSection_block_invoke;
  _OWORD v12[3] = &unk_26545B1B8;
  id v13 = v3;
  uint64_t v15 = a1;
  long long v7 = v5;
  CGAffineTransform v14 = v7;
  id v8 = v3;
  [v6 enumerateIndexesUsingBlock:v12];
  uint64_t v9 = v14;
  long long v10 = v7;

  return v10;
}

uint64_t __PXChangeDetailsCoalescerGetLog_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F5D540], "PXSectionedChangeDetailsCoalescer");
  uint64_t v1 = PXChangeDetailsCoalescerGetLog_log;
  PXChangeDetailsCoalescerGetLog_log = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t PXMediaTypeForAssets(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v12;
    char v6 = 1;
LABEL_3:
    uint64_t v7 = 0;
    uint64_t v8 = v4;
    while (1)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v1);
      }
      uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "mediaType", (void)v11);
      uint64_t v4 = v9;
      if ((v6 & 1) == 0)
      {
        uint64_t v4 = v8;
        if (v8 != v9) {
          break;
        }
      }
      char v6 = 0;
      ++v7;
      uint64_t v8 = v4;
      if (v3 == v7)
      {
        uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
        char v6 = 0;
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  uint64_t v4 = 0;
LABEL_12:

  return v4;
}

id PXDisplayAssetColorNormalizationData(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [v1 fetchColorNormalizationData];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *PXDisplayAssetPlaybackStyleDescription(unint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1 < 6) {
    return off_26545B258[a1];
  }
  uint64_t v3 = PXAssertGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 134217984;
    unint64_t v5 = a1;
    _os_log_error_impl(&dword_259CDA000, v3, OS_LOG_TYPE_ERROR, "invalid playbackStyle %li", (uint8_t *)&v4, 0xCu);
  }

  return @"<invalid>";
}

__CFString *PXDisplayAssetDetailedCountsDescription(void *a1)
{
  uint64_t v1 = a1[1];
  uint64_t v2 = a1[2];
  if (*a1 == 0x7FFFFFFFFFFFFFFFLL || v1 == 0x7FFFFFFFFFFFFFFFLL || v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = @"<detailed counts: invalid>";
  }
  else
  {
    unint64_t v5 = [NSString stringWithFormat:@"<detailed counts: photos:%tu, videos:%tu, others:%tu>", *a1, v1, v2];
  }

  return v5;
}

void sub_259D52C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PXSimpleIndexPathDescription(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F089D8] stringWithFormat:@"{"];
  uint64_t v3 = v2;
  if (!*a1)
  {
    [v2 appendString:@"Null"];
    goto LABEL_14;
  }
  [v2 appendFormat:@"%lu, ", *a1];
  if (!*a1) {
    goto LABEL_14;
  }
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v3, "appendFormat:", @"%lu", a1[1], v8, v9);
      goto LABEL_14;
    }
    uint64_t v6 = a1[3];
LABEL_11:
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v3 appendFormat:@"%lu, %lu", a1[1], v5, v9];
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v6 = a1[3];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_11;
  }
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
LABEL_13:
  }
    [v3 appendFormat:@"%lu, %lu, %lu", v4, a1[2], v6];
LABEL_14:
  [v3 appendFormat:@"}"];

  return v3;
}

id PXIndexPathFromSimpleIndexPath(void *a1)
{
  if (*a1) {
    BOOL v1 = a1[2] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1 && a1[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F088C8], "px_indexPathForItem:inSection:");
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void PXSimpleIndexPathFromIndexPath(uint64_t a1@<X0>, void *a2@<X1>, int64x2_t *a3@<X8>)
{
  id v11 = a2;
  if ([v11 length] == 3)
  {
    uint64_t v5 = [v11 indexAtPosition:0];
    uint64_t v6 = [v11 indexAtPosition:1];
    uint64_t v7 = [v11 indexAtPosition:2];
    a3->i64[0] = a1;
    a3->i64[1] = v5;
    a3[1].i64[0] = v6;
    a3[1].i64[1] = v7;
  }
  else if ([v11 length] == 2)
  {
    uint64_t v8 = [v11 indexAtPosition:0];
    uint64_t v9 = [v11 indexAtPosition:1];
    a3->i64[0] = a1;
    a3->i64[1] = v8;
    a3[1].i64[0] = v9;
    a3[1].i64[1] = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if ([v11 length] == 1)
  {
    uint64_t v10 = [v11 indexAtPosition:0];
    a3->i64[0] = a1;
    a3->i64[1] = v10;
    a3[1] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  else
  {
    *a3 = *(int64x2_t *)PXSimpleIndexPathNull;
    a3[1] = *(int64x2_t *)&PXSimpleIndexPathNull[16];
  }
}

uint64_t PXSimpleIndexPathCompare(void *a1, void *a2)
{
  BOOL v3 = __OFSUB__(*a1, *a2);
  BOOL v2 = (uint64_t)(*a1 - *a2) < 0;
  if (*a1 != *a2) {
    goto LABEL_9;
  }
  uint64_t v4 = a1[1];
  uint64_t v5 = a2[1];
  BOOL v3 = __OFSUB__(v4, v5);
  BOOL v2 = v4 - v5 < 0;
  if (v4 != v5) {
    goto LABEL_9;
  }
  uint64_t v6 = a1[2];
  uint64_t v7 = a2[2];
  BOOL v3 = __OFSUB__(v6, v7);
  BOOL v2 = v6 - v7 < 0;
  if (v6 == v7)
  {
    uint64_t v8 = a1[3];
    uint64_t v9 = a2[3];
    BOOL v3 = __OFSUB__(v8, v9);
    BOOL v10 = v8 == v9;
    BOOL v2 = v8 - v9 < 0;
    uint64_t v11 = -1;
    if (v2 == v3) {
      uint64_t v11 = 1;
    }
    if (v10) {
      return 0;
    }
    else {
      return v11;
    }
  }
  else
  {
LABEL_9:
    if (v2 != v3) {
      return -1;
    }
    else {
      return 1;
    }
  }
}

void sub_259D539E0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_259D546E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6875(uint64_t a1)
{
}

void sub_259D549CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PXColorSpaceIsGrayscale(unint64_t a1)
{
  return (a1 > 0xF) | (0xAu >> a1) & 1;
}

uint64_t PXGetColorSpaceName(uint64_t a1)
{
  uint64_t result = 0;
  while (colorspaces[result] != a1)
  {
    if (++result == 15) {
      return 0;
    }
  }
  return result;
}

uint64_t PXIsOCMockAllowed()
{
  os_log_t v0 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v1 = [v0 environment];
  BOOL v2 = [v1 objectForKeyedSubscript:@"PHOTOS_OCMOCK_ALLOWED"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

id PXCanonicalErrorForError(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    BOOL v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"NSError * _Nonnull PXCanonicalErrorForError(NSError *__strong _Nonnull)"];
    [v10 handleFailureInFunction:v11, @"PXError.m", 73, @"Invalid parameter not satisfying: %@", @"error" file lineNumber description];
  }
  id v2 = v1;
  uint64_t v3 = [v2 userInfo];
  uint64_t v4 = *MEMORY[0x263F08608];
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  id v6 = v2;
  if (v5)
  {
    uint64_t v7 = v2;
    do
    {
      id v6 = v5;

      uint64_t v8 = [v6 userInfo];
      uint64_t v5 = [v8 objectForKeyedSubscript:v4];

      uint64_t v7 = v6;
    }
    while (v5);
  }

  return v6;
}

id PXDebugDescriptionForError(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"NSString * _Nonnull PXDebugDescriptionForError(NSError *__strong _Nonnull)"];
    [v8 handleFailureInFunction:v9, @"PXError.m", 84, @"Invalid parameter not satisfying: %@", @"error" file lineNumber description];
  }
  id v2 = [v1 userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F07F80]];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v1 localizedDescription];
  }
  id v6 = v5;

  return v6;
}

void sub_259D568FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D56C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PXIndexSetIsEquivalentToIndexSet(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 == v4)
  {
    uint64_t v6 = 1;
  }
  else if (v3 && (id v4 = v3, v5))
  {
    uint64_t v6 = [v3 isEqualToIndexSet:v5];
  }
  else
  {
    uint64_t v6 = [v4 count] == 0;
  }

  return v6;
}

void PXDynamicHitTestInsetsViewUpdateHitTestInsetsWithDefaultOutsets(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  char v10 = [v9 extendedHitTestInsetsEdges];
  id v21 = v9;
  if (v21)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "void PXDynamicHitTestInsetsViewUpdateHitTestInsetsWithDefaultOutsets(__strong id<PXDynamicHitTestInsetsView> _Nonnull, PXEdgeInsets)");
    double v19 = (objc_class *)objc_opt_class();
    double v18 = NSStringFromClass(v19);
    double v20 = objc_msgSend(v21, "px_descriptionForAssertionMessage");
    [v15 handleFailureInFunction:v16, @"PXDynamicHitTestInsetsView.m", 24, @"%@ should be an instance inheriting from %@, but it is %@", @"view", v18, v20 file lineNumber description];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "void PXDynamicHitTestInsetsViewUpdateHitTestInsetsWithDefaultOutsets(__strong id<PXDynamicHitTestInsetsView> _Nonnull, PXEdgeInsets)");
    long long v17 = (objc_class *)objc_opt_class();
    double v18 = NSStringFromClass(v17);
    [v15 handleFailureInFunction:v16, @"PXDynamicHitTestInsetsView.m", 24, @"%@ should be an instance inheriting from %@, but it is nil", @"view", v18 file lineNumber description];
  }

LABEL_3:
  if (v10) {
    double v11 = 30.0;
  }
  else {
    double v11 = a2;
  }
  if ((v10 & 2) != 0) {
    double v12 = 30.0;
  }
  else {
    double v12 = a3;
  }
  if ((v10 & 4) != 0) {
    double v13 = 30.0;
  }
  else {
    double v13 = a4;
  }
  if ((v10 & 8) != 0) {
    double v14 = 30.0;
  }
  else {
    double v14 = a5;
  }
  objc_msgSend(v21, "setHitTestInsets:", -v11, -v12, -v13, -v14);
}

double PXDynamicHitTestOutsetsWithDefaultOutsetsAndExtendedEdges(char a1)
{
  if (a1) {
    return 30.0;
  }
  return result;
}

uint64_t PXImageOrientationFromCGImagePropertyOrientation(int a1)
{
  if ((a1 - 2) > 6) {
    return 0;
  }
  else {
    return qword_259D74AD8[a1 - 2];
  }
}

__CFString *PXGColorSpaceNameDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xE) {
    return @"Undefined";
  }
  else {
    return off_26545B550[a1 - 1];
  }
}

__CFString *PXGPixelFormatNameDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Undefined";
  }
  else {
    return off_26545B5C8[a1 - 1];
  }
}

void sub_259D59CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t PXUpdateFlagsInvalidate(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *((unsigned __int8 *)a1 + 16);
  if (!a2 || v2)
  {
    if (!*((unsigned char *)a1 + 16)) {
      goto LABEL_8;
    }
  }
  else if (!*((unsigned char *)a1 + 16))
  {
    uint64_t v3 = *((unsigned char *)a1 + 17) == 0;
    goto LABEL_8;
  }
  if ((a1[1] & a2) != 0)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL PXUpdateFlagsInvalidate(PXUpdateFlags * _Nonnull, NSUInteger)");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXUpdateSwiftOverlay.m", 13, @"invalidating %lu after it already has been updated", a2);

    abort();
  }
  uint64_t v3 = 0;
LABEL_8:
  *a1 = v2 | a2;
  return v3;
}

void PXUpdateFlagsWillUpdate(uint64_t a1)
{
  *(unsigned char *)(a1 + 17) = 1;
  if (*(unsigned char *)(a1 + 16))
  {
    id v2 = [MEMORY[0x263F08690] currentHandler];
    id v1 = [NSString stringWithUTF8String:"void PXUpdateFlagsWillUpdate(PXUpdateFlags * _Nonnull)"];
    [v2 handleFailureInFunction:v1, @"PXUpdateSwiftOverlay.m", 17, @"Invalid parameter not satisfying: %@", @"!(*updateFlags).isPerformingUpdate" file lineNumber description];
  }
}

void PXUpdateFlagsDidUpdate(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 17))
  {
    id v2 = [MEMORY[0x263F08690] currentHandler];
    id v1 = [NSString stringWithUTF8String:"void PXUpdateFlagsDidUpdate(PXUpdateFlags * _Nonnull)"];
    [v2 handleFailureInFunction:v1, @"PXUpdateSwiftOverlay.m", 21, @"Invalid parameter not satisfying: %@", @"!(*updateFlags).willPerformUpdate" file lineNumber description];
  }
}

BOOL PXUpdateShouldBeginUpdates(uint64_t *a1)
{
  *((unsigned char *)a1 + 17) = 0;
  uint64_t v1 = *a1;
  if (*a1)
  {
    if (*((unsigned char *)a1 + 16))
    {
      id v4 = [MEMORY[0x263F08690] currentHandler];
      id v5 = [NSString stringWithUTF8String:"BOOL PXUpdateShouldBeginUpdates(PXUpdateFlags * _Nonnull)"];
      [v4 handleFailureInFunction:v5, @"PXUpdateSwiftOverlay.m", 25, @"Invalid parameter not satisfying: %@", @"!(*updateFlags).isPerformingUpdate" file lineNumber description];
    }
    *((unsigned char *)a1 + 16) = 1;
    a1[1] = 0;
  }
  return v1 != 0;
}

void PXUpdateEndUpdates(uint64_t a1)
{
  *(unsigned char *)(a1 + 16) = 0;
  if (*(void *)a1)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    id v2 = [NSString stringWithUTF8String:"void PXUpdateEndUpdates(PXUpdateFlags * _Nonnull)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v2, @"PXUpdateSwiftOverlay.m", 29, @"still needing to update %lu after update pass", *(void *)a1);
  }
}

BOOL PXUpdateIsUpdateNeeded(uint64_t *a1, uint64_t a2)
{
  if (!*((unsigned char *)a1 + 16))
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL PXUpdateIsUpdateNeeded(PXUpdateFlags * _Nonnull, NSUInteger)");
    [v6 handleFailureInFunction:v7, @"PXUpdateSwiftOverlay.m", 33, @"Invalid parameter not satisfying: %@", @"(*updateFlags).isPerformingUpdate" file lineNumber description];
  }
  uint64_t v4 = *a1;
  a1[1] |= a2;
  if ((v4 & a2) != 0) {
    *a1 = v4 & ~a2;
  }
  return (v4 & a2) != 0;
}

double PXClampGreatherThanOrEqualToZero(double result)
{
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

double PXClampLessThanOrEqualToZero(double result)
{
  if (result > 0.0) {
    return 0.0;
  }
  return result;
}

double PXFloatNormalize(double a1, double a2, double a3)
{
  return (a2 - a1) / (a3 - a1);
}

double PXFloatDenormalize(double a1, double a2, double a3)
{
  return a1 + a2 * (a3 - a1);
}

double PXMapValueFromRangeToNewRange(double a1, double a2, double a3, double a4, double a5)
{
  return a4 + (a5 - a4) * ((a1 - a2) / (a3 - a2));
}

double PXProjectValueWithDecelerationRate(double a1, double a2, double a3)
{
  return a2 / 1000.0 * a3 / (1.0 - a3) + a1;
}

double PXPointMultiplyWithFloat(double a1, double a2, double a3)
{
  return a1 * a3;
}

double PXPointByLinearlyInterpolatingPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a5 * (a3 - a1);
}

double PXDistanceBetweenPoints(double a1, double a2, double a3, double a4)
{
  return hypot(a3 - a1, a4 - a2);
}

double PXPointDistanceFromOrigin(double a1, double a2)
{
  return fabs(hypot(a1 - *MEMORY[0x263F00148], a2 - *(double *)(MEMORY[0x263F00148] + 8)));
}

uint64_t PXPointIsValid()
{
  uint64_t result = CGFloatIsValid();
  if (result)
  {
    return CGFloatIsValid();
  }
  return result;
}

BOOL PXPointEqualToPointWithTolerence(double a1, double a2, double a3, double a4, double a5)
{
  BOOL v5 = vabdd_f64(a1, a3) <= a5;
  return vabdd_f64(a2, a4) <= a5 && v5;
}

double PXPointRoundToPixel(double a1, double a2, double a3)
{
  return round(a1 * a3) / a3;
}

double PXPointFloorToPixel(double a1, double a2, double a3)
{
  return floor(a1 * a3) / a3;
}

double PXPointCeilingToPixel(double a1, double a2, double a3)
{
  return ceil(a1 * a3) / a3;
}

double PXPointNormalize(double a1, double a2, double a3, double a4, double a5)
{
  return (a1 - a3) / a5;
}

double PXContentOffsetFlippedHorizontally(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7)
{
  v15.origin.CGFloat x = a3;
  v15.origin.CGFloat y = a4;
  v15.size.CGFloat width = a5;
  v15.size.CGFloat height = a6;
  double MaxX = CGRectGetMaxX(v15);
  v16.origin.CGFloat x = a3;
  v16.origin.CGFloat y = a4;
  v16.size.CGFloat width = a5;
  v16.size.CGFloat height = a6;
  return MaxX - (a7 + a1 - CGRectGetMinX(v16));
}

double PXVelocityFlippedHorizontally(double a1)
{
  return -a1;
}

double PXPointTransposed(double a1, double a2)
{
  return a2;
}

id PXPointDescription(double a1, double a2)
{
  id v2 = (void *)[[NSString alloc] initWithFormat:@"{%.2f, %.2f}", *(void *)&a1, *(void *)&a2];

  return v2;
}

uint64_t PXSizeIsValid()
{
  uint64_t result = CGFloatIsValid();
  if (result)
  {
    return CGFloatIsValid();
  }
  return result;
}

double PXSizeTranspose(double a1, double a2)
{
  return a2;
}

double PXSizeMin(double result, double a2, double a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

double PXSizeMax(double result, double a2, double a3)
{
  if (result < a3) {
    return a3;
  }
  return result;
}

double PXSizeSubtract(double a1, double a2, double a3)
{
  return a1 - a3;
}

BOOL PXAspectRatioIsPortrait(double a1)
{
  return a1 < 1.0;
}

double PXSizeGetAspectRatioWithDefault(double a1, double a2, double a3)
{
  if (a1 == 0.0 || a2 == 0.0) {
    return a3;
  }
  if (a1 == *MEMORY[0x263F5D550] && a2 == *(double *)(MEMORY[0x263F5D550] + 8)) {
    return a3;
  }
  else {
    return fabs(a1 / a2);
  }
}

uint64_t PXSizeApproximatelyEqualOrBiggerThanSizeWithTolerance(double a1, double a2, double a3, double a4, double a5)
{
  double v5 = vabdd_f64(a1, a3);
  if (a1 <= a3)
  {
    BOOL v7 = v5 == a5;
    BOOL v6 = v5 >= a5;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = 0;
  }
  if (!v7 && v6) {
    return 0;
  }
  BOOL v8 = vabdd_f64(a2, a4) <= a5;
  return a2 > a4 || v8;
}

uint64_t PXSizeApproximatelyEqualOrBiggerThanSize(double a1, double a2, double a3, double a4)
{
  if (a1 <= a3 && vabdd_f64(a1, a3) > 0.00000999999975) {
    return 0;
  }
  BOOL v5 = vabdd_f64(a2, a4) <= 0.00000999999975;
  return a2 > a4 || v5;
}

double PXSizeRoundToEven(double a1)
{
  double v1 = round(a1 * 0.5);
  return round(v1 + v1);
}

double PXSizeClampToSize(double a1, double a2, double a3)
{
  return fmin(a1, a3);
}

double PXSizeSafeInset(double a1, double a2, double a3)
{
  if (a1 >= a2) {
    double v3 = a2;
  }
  else {
    double v3 = a1;
  }
  double v4 = v3 * 0.5;
  if (v4 <= a3) {
    a3 = v4;
  }
  return a1 - a3 * 2.0;
}

id PXSizeDescription(double a1, double a2)
{
  id v2 = (void *)[[NSString alloc] initWithFormat:@"{%.2f, %.2f}", *(void *)&a1, *(void *)&a2];

  return v2;
}

uint64_t PXRectByFlippingHorizontallyInRect()
{
  return MEMORY[0x270F53698]();
}

void PXRectDiff(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  id v17 = a1;
  v40.origin.CGFloat x = a2;
  v40.origin.CGFloat y = a3;
  v40.size.CGFloat width = a4;
  v40.size.CGFloat height = a5;
  v49.origin.CGFloat x = a6;
  v49.origin.CGFloat y = a7;
  v49.size.CGFloat width = a8;
  v49.size.CGFloat height = a9;
  if (CGRectIntersectsRect(v40, v49))
  {
    if (a2 == a6 && a4 == a8)
    {
      v45.origin.CGFloat x = a2;
      v45.origin.CGFloat y = a3;
      v45.size.CGFloat width = a4;
      v45.size.CGFloat height = a5;
      double MinY = CGRectGetMinY(v45);
      v46.origin.CGFloat x = a2;
      v46.origin.CGFloat y = a3;
      v46.size.CGFloat width = a4;
      v46.size.CGFloat height = a5;
      double MaxY = CGRectGetMaxY(v46);
      v47.origin.CGFloat x = a6;
      v47.origin.CGFloat y = a7;
      v47.size.CGFloat width = a8;
      v47.size.CGFloat height = a9;
      double v23 = CGRectGetMinY(v47);
      v48.origin.CGFloat x = a6;
      v48.origin.CGFloat y = a7;
      v48.size.CGFloat width = a8;
      v48.size.CGFloat height = a9;
      double v21 = CGRectGetMaxY(v48);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      _OWORD v34[2] = __PXRectDiff_block_invoke;
      v34[3] = &unk_26545B840;
      CGFloat v36 = a2;
      CGFloat v37 = a3;
      CGFloat v38 = a4;
      CGFloat v39 = a5;
      id v35 = v17;
      _PXDiffRanges(v34, MinY, MaxY, v23, v21);
      double v20 = v35;
      goto LABEL_11;
    }
    if (a3 == a7 && a5 == a9)
    {
      v41.origin.CGFloat x = a2;
      v41.origin.CGFloat y = a3;
      v41.size.CGFloat width = a4;
      v41.size.CGFloat height = a5;
      double MinX = CGRectGetMinX(v41);
      v42.origin.CGFloat x = a2;
      v42.origin.CGFloat y = a3;
      v42.size.CGFloat width = a4;
      v42.size.CGFloat height = a5;
      double MaxX = CGRectGetMaxX(v42);
      v43.origin.CGFloat x = a6;
      v43.origin.CGFloat y = a7;
      v43.size.CGFloat width = a8;
      v43.size.CGFloat height = a9;
      double v22 = CGRectGetMinX(v43);
      v44.origin.CGFloat x = a6;
      v44.origin.CGFloat y = a7;
      v44.size.CGFloat width = a8;
      v44.size.CGFloat height = a9;
      double v19 = CGRectGetMaxX(v44);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      void v28[2] = __PXRectDiff_block_invoke_2;
      uint64_t v28[3] = &unk_26545B840;
      CGFloat v30 = a2;
      CGFloat v31 = a3;
      CGFloat v32 = a4;
      CGFloat v33 = a5;
      id v29 = v17;
      _PXDiffRanges(v28, MinX, MaxX, v22, v19);
      double v20 = v29;
LABEL_11:

      goto LABEL_12;
    }
  }
  (*((void (**)(id, uint64_t, CGFloat, CGFloat, CGFloat, CGFloat))v17 + 2))(v17, 1, a2, a3, a4, a5);
  (*((void (**)(id, uint64_t, CGFloat, CGFloat, CGFloat, CGFloat))v17 + 2))(v17, -1, a6, a7, a8, a9);
LABEL_12:
}

uint64_t __PXRectDiff_block_invoke(uint64_t a1, double a2, double a3)
{
  return (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 40), a2, *(double *)(a1 + 56), a3 - a2);
}

void _PXDiffRanges(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  BOOL v10 = a4 < a3 && a5 > a2;
  double v12 = v9;
  if (!v10)
  {
    double v11 = (void (**)(id, uint64_t, double, double))(v9 + 16);
    (*((void (**)(char *, uint64_t, double, double))v9 + 2))(v9, 1, a2, a3);
    (*v11)(v12, -1, a4, a5);
LABEL_14:
    id v9 = v12;
    goto LABEL_15;
  }
  if (a5 > a3)
  {
    (*((void (**)(char *, uint64_t, double, double))v9 + 2))(v9, -1, a3, a5);
    id v9 = v12;
  }
  if (a4 < a2)
  {
    (*((void (**)(char *, uint64_t, double, double))v9 + 2))(v12, -1, a4, a2);
    id v9 = v12;
  }
  if (a5 < a3)
  {
    (*((void (**)(char *, uint64_t, double, double))v9 + 2))(v12, 1, a5, a3);
    id v9 = v12;
  }
  if (a4 > a2)
  {
    (*((void (**)(char *, uint64_t, double, double))v9 + 2))(v12, 1, a2, a4);
    goto LABEL_14;
  }
LABEL_15:
}

uint64_t __PXRectDiff_block_invoke_2(uint64_t a1, __n128 a2, double a3)
{
  return (*(uint64_t (**)(__n128, double, double, double))(*(void *)(a1 + 32) + 16))(a2, *(double *)(a1 + 48), a3 - a2.n128_f64[0], *(double *)(a1 + 64));
}

uint64_t PXRectIntersectWithBasicRemainders(CGFloat *a1, _OWORD *a2, _OWORD *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11)
{
  CGRect v65 = CGRectIntersection(*(CGRect *)&a4, *(CGRect *)&a8);
  CGFloat y = v65.origin.y;
  CGFloat x = v65.origin.x;
  CGFloat height = v65.size.height;
  CGFloat width = v65.size.width;
  uint64_t v59 = 0;
  uint64_t v60 = (CGSize *)&v59;
  uint64_t v61 = 0x4010000000;
  uint64_t v62 = &unk_259D809E3;
  double v22 = (double *)MEMORY[0x263F001A0];
  v65.CGSize size = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  CGSize v63 = (CGSize)*MEMORY[0x263F001A0];
  CGSize size = v65.size;
  uint64_t v53 = 0;
  uint64_t v54 = (CGSize *)&v53;
  uint64_t v55 = 0x4010000000;
  uint64_t v56 = &unk_259D809E3;
  CGSize v42 = v65.size;
  CGSize v43 = v63;
  CGSize v57 = v63;
  CGSize v58 = v65.size;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  BOOL v23 = a6 == a10 && a4 == a8;
  BOOL v24 = a7 == a11 && a5 == a9;
  v66.origin.CGFloat x = a4;
  v66.origin.CGFloat y = a5;
  v66.size.CGFloat width = a6;
  v66.size.CGFloat height = a7;
  if (CGRectIsEmpty(v66)
    || (v67.origin.x = a8, v67.origin.y = a9, v67.size.CGFloat width = a10, v67.size.height = a11, CGRectIsEmpty(v67)))
  {
    *((unsigned char *)v50 + 24) = 0;
  }
  else
  {
    v68.origin.CGFloat x = a4;
    v68.origin.CGFloat y = a5;
    v68.size.CGFloat width = a6;
    v68.size.CGFloat height = a7;
    v78.origin.CGFloat x = a8;
    v78.origin.CGFloat y = a9;
    v78.size.CGFloat width = a10;
    v78.size.CGFloat height = a11;
    if (CGRectEqualToRect(v68, v78))
    {
      *((unsigned char *)v50 + 24) = 1;
      CGFloat v36 = v60;
      v60[2] = v43;
      v36[3] = v42;
      CGFloat v37 = v54;
      v54[2] = v43;
      v37[3] = v42;
    }
    else
    {
      if (v23 || v24)
      {
        v69.origin.CGFloat x = a4;
        v69.origin.CGFloat y = a5;
        v69.size.CGFloat width = a6;
        v69.size.CGFloat height = a7;
        v79.origin.CGFloat x = a8;
        v79.origin.CGFloat y = a9;
        v79.size.CGFloat width = a10;
        v79.size.CGFloat height = a11;
        if (CGRectIntersectsRect(v69, v79)) {
          goto LABEL_30;
        }
      }
      if (v23)
      {
        v70.origin.CGFloat x = a4;
        v70.origin.CGFloat y = a5;
        v70.size.CGFloat width = a6;
        v70.size.CGFloat height = a7;
        double MaxY = CGRectGetMaxY(v70);
        v71.origin.CGFloat x = a8;
        v71.origin.CGFloat y = a9;
        v71.size.CGFloat width = a10;
        v71.size.CGFloat height = a11;
        if (MaxY == CGRectGetMinY(v71)) {
          goto LABEL_30;
        }
        v72.origin.CGFloat x = a4;
        v72.origin.CGFloat y = a5;
        v72.size.CGFloat width = a6;
        v72.size.CGFloat height = a7;
        double MinY = CGRectGetMinY(v72);
        v73.origin.CGFloat x = a8;
        v73.origin.CGFloat y = a9;
        v73.size.CGFloat width = a10;
        v73.size.CGFloat height = a11;
        if (MinY == CGRectGetMaxY(v73)) {
          goto LABEL_30;
        }
      }
      if (v24)
      {
        v74.origin.CGFloat x = a4;
        v74.origin.CGFloat y = a5;
        v74.size.CGFloat width = a6;
        v74.size.CGFloat height = a7;
        double MaxX = CGRectGetMaxX(v74);
        v75.origin.CGFloat x = a8;
        v75.origin.CGFloat y = a9;
        v75.size.CGFloat width = a10;
        v75.size.CGFloat height = a11;
        if (MaxX == CGRectGetMinX(v75)) {
          goto LABEL_30;
        }
        v76.origin.CGFloat x = a4;
        v76.origin.CGFloat y = a5;
        v76.size.CGFloat width = a6;
        v76.size.CGFloat height = a7;
        double MinX = CGRectGetMinX(v76);
        v77.origin.CGFloat x = a8;
        v77.origin.CGFloat y = a9;
        v77.size.CGFloat width = a10;
        v77.size.CGFloat height = a11;
        if (MinX == CGRectGetMaxX(v77))
        {
LABEL_30:
          *((unsigned char *)v50 + 24) = 1;
          v48[0] = MEMORY[0x263EF8330];
          v48[1] = 3221225472;
          v48[2] = __PXRectIntersectWithBasicRemainders_block_invoke;
          v48[3] = &unk_26545B868;
          v48[4] = &v49;
          v48[5] = &v53;
          v48[6] = &v59;
          PXRectDiff(v48, a4, a5, a6, a7, a8, a9, a10, a11);
        }
      }
    }
  }
  CGAffineTransform v25 = v50;
  if (*((unsigned char *)v50 + 24))
  {
    CGFloat v27 = y;
    CGFloat v26 = x;
    CGFloat v29 = height;
    CGFloat v28 = width;
    if (!a1) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  CGFloat v26 = *v22;
  CGFloat v27 = v22[1];
  CGFloat v28 = v22[2];
  CGFloat v29 = v22[3];
  char v34 = v60;
  v60[2] = v43;
  v34[3] = v42;
  id v35 = v54;
  v54[2] = v43;
  v35[3] = v42;
  if (a1)
  {
LABEL_12:
    *a1 = v26;
    a1[1] = v27;
    a1[2] = v28;
    a1[3] = v29;
  }
LABEL_13:
  if (a2)
  {
    CGSize v30 = v60[3];
    *a2 = v60[2];
    a2[1] = v30;
  }
  if (a3)
  {
    CGSize v31 = v54[3];
    *a3 = v54[2];
    a3[1] = v31;
  }
  uint64_t v32 = *((unsigned __int8 *)v25 + 24);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
  return v32;
}

void sub_259D5B618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Unwind_Resume(a1);
}

BOOL __PXRectIntersectWithBasicRemainders_block_invoke(BOOL result, uint64_t a2, double a3, double a4, double a5, double a6)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    BOOL v10 = (void *)result;
    if (a2 == 1)
    {
      uint64_t result = CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(result + 48) + 8) + 32));
      if (result)
      {
        uint64_t v11 = v10[6];
        goto LABEL_8;
      }
    }
    else
    {
      if (a2 != -1) {
        return result;
      }
      uint64_t result = CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(result + 40) + 8) + 32));
      if (result)
      {
        uint64_t v11 = v10[5];
LABEL_8:
        double v12 = *(double **)(v11 + 8);
        void v12[4] = a3;
        v12[5] = a4;
        v12[6] = a5;
        v12[7] = a6;
        return result;
      }
    }
    *(unsigned char *)(*(void *)(v10[4] + 8) + 24) = 0;
  }
  return result;
}

uint64_t PXLargestSalientAspectFilledCropRect()
{
  return MEMORY[0x270F53678]();
}

uint64_t PXRectCompareForHorizontalMovementInVerticalLayout(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinY = CGRectGetMinY(*(CGRect *)&a1);
  v21.origin.CGFloat x = a5;
  v21.origin.CGFloat y = a6;
  v21.size.CGFloat width = a7;
  v21.size.CGFloat height = a8;
  if (MinY < CGRectGetMinY(v21))
  {
    v22.origin.CGFloat x = a1;
    v22.origin.CGFloat y = a2;
    v22.size.CGFloat width = a3;
    v22.size.CGFloat height = a4;
    double MaxY = CGRectGetMaxY(v22);
    v23.origin.CGFloat x = a5;
    v23.origin.CGFloat y = a6;
    v23.size.CGFloat width = a7;
    v23.size.CGFloat height = a8;
    if (MaxY < CGRectGetMaxY(v23)) {
      return -1;
    }
  }
  v24.origin.CGFloat x = a1;
  v24.origin.CGFloat y = a2;
  v24.size.CGFloat width = a3;
  v24.size.CGFloat height = a4;
  double v18 = CGRectGetMinY(v24);
  v25.origin.CGFloat x = a5;
  v25.origin.CGFloat y = a6;
  v25.size.CGFloat width = a7;
  v25.size.CGFloat height = a8;
  if (v18 > CGRectGetMinY(v25))
  {
    v26.origin.CGFloat x = a1;
    v26.origin.CGFloat y = a2;
    v26.size.CGFloat width = a3;
    v26.size.CGFloat height = a4;
    double v19 = CGRectGetMaxY(v26);
    v27.origin.CGFloat x = a5;
    v27.origin.CGFloat y = a6;
    v27.size.CGFloat width = a7;
    v27.size.CGFloat height = a8;
    if (v19 > CGRectGetMaxY(v27)) {
      return 1;
    }
  }
  if (a1 >= a5) {
    return a1 > a5;
  }
  return -1;
}

uint64_t PXRectCompareForVerticalMovementInVerticalLayoutWithSourceRect(CGRect r2, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat r2a, CGFloat r2_8, CGFloat r2_16, CGFloat r2_24)
{
  CGFloat height = r2.size.height;
  CGFloat y = r2.origin.y;
  CGFloat x = r2.origin.x;
  CGFloat width = r2.size.width;
  CGFloat v21 = r2.origin.y;
  v60.size.CGFloat height = r2_24;
  v60.origin.CGFloat y = r2_8;
  v60.origin.CGFloat x = r2a;
  v46.origin.CGFloat x = a2;
  v46.origin.CGFloat y = a3;
  CGFloat v42 = a3;
  v46.size.CGFloat width = a4;
  v46.size.CGFloat height = a5;
  v60.size.CGFloat width = r2_16;
  CGRect v47 = CGRectUnion(v46, v60);
  CGFloat v22 = v47.origin.x;
  CGFloat v23 = v47.size.width;
  v47.origin.CGFloat y = v21;
  v47.size.CGFloat height = height;
  v61.origin.CGFloat x = a2;
  v61.origin.CGFloat y = a3;
  v61.size.CGFloat width = a4;
  v61.size.CGFloat height = a5;
  BOOL v24 = CGRectIntersectsRect(v47, v61);
  v48.origin.CGFloat x = v22;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = v23;
  v48.size.CGFloat height = height;
  v62.origin.CGFloat x = r2a;
  v62.origin.CGFloat y = r2_8;
  v62.size.CGFloat width = r2_16;
  v62.size.CGFloat height = r2_24;
  BOOL v25 = CGRectIntersectsRect(v48, v62);
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v49);
  v50.origin.CGFloat x = a2;
  v50.origin.CGFloat y = a3;
  v50.size.CGFloat width = a4;
  v50.size.CGFloat height = a5;
  double v38 = CGRectGetMinX(v50) - MinX;
  v51.origin.CGFloat x = r2a;
  v51.origin.CGFloat y = r2_8;
  v51.size.CGFloat width = r2_16;
  v51.size.CGFloat height = r2_24;
  double v37 = CGRectGetMinX(v51);
  v52.origin.CGFloat x = x;
  v52.size.CGFloat height = height;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  double MinY = CGRectGetMinY(v52);
  v53.origin.CGFloat x = a2;
  v53.origin.CGFloat y = a3;
  v53.size.CGFloat width = a4;
  v53.size.CGFloat height = a5;
  double v27 = CGRectGetMinY(v53);
  v54.origin.CGFloat x = r2a;
  v54.origin.CGFloat y = r2_8;
  v54.size.CGFloat width = r2_16;
  v54.size.CGFloat height = r2_24;
  double v28 = CGRectGetMinY(v54);
  if (v24 && !v25)
  {
    if (v38 > 0.0) {
      return 1;
    }
    else {
      return -1;
    }
  }
  double v30 = v37 - MinX;
  if (v24 || !v25)
  {
    if (!v24 || !v25)
    {
      v55.origin.CGFloat x = v22;
      v55.size.CGFloat width = v23;
      v55.origin.CGFloat y = v42;
      v55.size.CGFloat height = a5;
      v63.origin.CGFloat x = r2a;
      v63.origin.CGFloat y = r2_8;
      v63.size.CGFloat width = r2_16;
      v63.size.CGFloat height = r2_24;
      if (CGRectIntersectsRect(v55, v63))
      {
        double v31 = -v38;
        if (v38 >= 0.0) {
          double v31 = v38;
        }
        double v32 = -v30;
        if (v30 >= 0.0) {
          double v32 = v37 - MinX;
        }
        if (v31 >= v32) {
          return v31 > v32;
        }
      }
      else
      {
        v56.origin.CGFloat x = a2;
        v56.origin.CGFloat y = v42;
        v56.size.CGFloat width = a4;
        v56.size.CGFloat height = a5;
        double MidY = CGRectGetMidY(v56);
        v57.origin.CGFloat x = r2a;
        v57.origin.CGFloat y = r2_8;
        v57.size.CGFloat width = r2_16;
        v57.size.CGFloat height = r2_24;
        if (MidY >= CGRectGetMidY(v57))
        {
          v58.origin.CGFloat x = a2;
          v58.origin.CGFloat y = v42;
          v58.size.CGFloat width = a4;
          v58.size.CGFloat height = a5;
          double v36 = CGRectGetMidY(v58);
          v59.origin.CGFloat x = r2a;
          v59.origin.CGFloat y = r2_8;
          v59.size.CGFloat width = r2_16;
          v59.size.CGFloat height = r2_24;
          return v36 > CGRectGetMidY(v59);
        }
      }
      return -1;
    }
    if (v38 > 0.0 && v30 <= 0.0) {
      return 1;
    }
    if (v38 <= 0.0 && v30 > 0.0) {
      return -1;
    }
    double v33 = v27 - MinY;
    double v34 = v28 - MinY;
    if (v38 > 0.0 && v30 > 0.0)
    {
      if (v38 <= v30)
      {
        if (v38 < v30) {
          return 1;
        }
        if (v33 <= v34) {
          return v33 < v34;
        }
      }
      return -1;
    }
    uint64_t result = 0;
    if (v38 <= 0.0 && v30 <= 0.0)
    {
      if (v38 < v30) {
        return -1;
      }
      uint64_t result = 1;
      if (v38 <= v30 && v33 <= v34)
      {
        if (v33 >= v34) {
          return 0;
        }
        return -1;
      }
    }
  }
  else if (v30 <= 0.0)
  {
    return 1;
  }
  else
  {
    return -1;
  }
  return result;
}

double PXRectWithAspectRatioFittingRect(double a1, double a2, double a3, double a4)
{
  double v4 = a2 + a4 * 0.5;
  PFSizeWithAspectRatioFittingSize();
  return v4 + v5 * -0.5;
}

CGFloat PXRectWithAspectRatioInsideRectContainingAsMuchAsPossibleOfRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  rect.origin.CGFloat x = a2;
  CGFloat v20 = a2 + a4 * 0.5;
  CGFloat v21 = a3 + a5 * 0.5;
  PFSizeWithAspectRatioFittingSize();
  double v23 = v22;
  double v25 = v24;
  double v26 = v20 + v22 * -0.5;
  double v27 = v21 + v24 * -0.5;
  rect.origin.CGFloat y = v26;
  rect.size.CGFloat width = v27;
  rect.size.CGFloat height = v22;
  double v40 = v24;
  v41.origin.CGFloat x = v26;
  v41.origin.CGFloat y = v27;
  v41.size.CGFloat width = v23;
  v41.size.CGFloat height = v25;
  double Width = CGRectGetWidth(v41);
  v42.origin.CGFloat x = rect.origin.x;
  v42.origin.CGFloat y = a3;
  v42.size.CGFloat width = a4;
  v42.size.CGFloat height = a5;
  if (Width == CGRectGetWidth(v42)) {
    uint64_t v29 = 1;
  }
  else {
    uint64_t v29 = 2;
  }
  double LengthForAxis = PXRectGetLengthForAxis(v29, v26, v27, v23, v25);
  double v38 = PXPointValueForAxis(v29, v26, v27);
  double MinForAxis = PXRectGetMinForAxis(v29, rect.origin.x, a3, a4, a5);
  double MaxForAxis = PXRectGetMaxForAxis(v29, rect.origin.x, a3, a4, a5);
  double v33 = PXRectGetMinForAxis(v29, a9, a10, a11, a12);
  double v34 = PXRectGetMaxForAxis(v29, a9, a10, a11, a12);
  if (v34 >= MinForAxis)
  {
    if (v33 > MaxForAxis)
    {
      double MinForAxis = MaxForAxis - LengthForAxis;
    }
    else
    {
      if (v33 >= MaxForAxis) {
        double v35 = MaxForAxis;
      }
      else {
        double v35 = v33;
      }
      if (v35 <= MinForAxis) {
        double v35 = MinForAxis;
      }
      if (v34 >= MaxForAxis) {
        double v34 = MaxForAxis;
      }
      if (v34 <= MinForAxis) {
        double v34 = MinForAxis;
      }
      if (v34 - v35 <= LengthForAxis)
      {
        if (v38 < v35) {
          double v35 = v38;
        }
        if (v35 <= MinForAxis) {
          double v35 = MinForAxis;
        }
        double v36 = v34 - LengthForAxis;
        if (v35 >= MaxForAxis - LengthForAxis) {
          double v35 = MaxForAxis - LengthForAxis;
        }
        if (v35 <= v36) {
          double MinForAxis = v36;
        }
        else {
          double MinForAxis = v35;
        }
      }
      else
      {
        double MinForAxis = (v35 + v34 - LengthForAxis) * 0.5;
      }
    }
  }
  PXPointSetValueForAxis(&rect.origin.y, v29, MinForAxis);
  return rect.origin.y;
}

double PXRectFlippedHorizontally(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v15.origin.CGFloat x = a5;
  v15.origin.CGFloat y = a6;
  v15.size.CGFloat width = a7;
  v15.size.CGFloat height = a8;
  double MaxX = CGRectGetMaxX(v15);
  v16.origin.CGFloat x = a1;
  v16.origin.CGFloat y = a2;
  v16.size.CGFloat width = a3;
  v16.size.CGFloat height = a4;
  double v13 = MaxX - CGRectGetMaxX(v16);
  v17.origin.CGFloat x = a1;
  v17.origin.CGFloat y = a2;
  v17.size.CGFloat width = a3;
  v17.size.CGFloat height = a4;
  CGRectGetMinY(v17);
  v18.origin.CGFloat x = a1;
  v18.origin.CGFloat y = a2;
  v18.size.CGFloat width = a3;
  v18.size.CGFloat height = a4;
  CGRectGetWidth(v18);
  v19.origin.CGFloat x = a1;
  v19.origin.CGFloat y = a2;
  v19.size.CGFloat width = a3;
  v19.size.CGFloat height = a4;
  CGRectGetHeight(v19);
  return v13;
}

double PXRectSafeInset(double a1, double a2, double a3, double a4, CGFloat a5)
{
  if (a3 >= a4) {
    double v5 = a4;
  }
  else {
    double v5 = a3;
  }
  double v6 = v5 * 0.5;
  if (v6 <= a5) {
    a5 = v6;
  }
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, a5, a5);
  return result;
}

double PXRectShrinkToPixel(double a1, double a2, double a3, double a4, double a5)
{
  return ceil(a1 * a5) / a5;
}

double PXRectClampPoint(double result, double a2, double a3, double a4, double a5)
{
  double v5 = result + a3;
  if (a5 < v5) {
    double v5 = a5;
  }
  if (result < v5) {
    return v5;
  }
  return result;
}

double PXRectEdgeValue(int a1, double result, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      double result = a3;
      break;
    case 2:
      double result = result + a4;
      break;
    case 3:
      double result = a3 + a5;
      break;
    default:
      double result = NAN;
      break;
  }
  return result;
}

uint64_t PXRectEdgeOpposite(unsigned int a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return dword_259D74810[a1];
  }
}

uint64_t PXRectEdgeFlippedHorizontally(int a1)
{
  if ((a1 - 1) > 2) {
    return 2;
  }
  else {
    return dword_259D74BD0[a1 - 1];
  }
}

double PXRectArea(double a1, double a2, double a3, double a4)
{
  if (a3 == 0.0 || a4 == 0.0) {
    return 0.0;
  }
  if (a4 == *(double *)(MEMORY[0x263F5D550] + 8) && a3 == *MEMORY[0x263F5D550]) {
    return 0.0;
  }
  else {
    return a3 * a4;
  }
}

double PXRectWithMinimumSize(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = (a3 - a5) * 0.5;
  if (v6 > 0.0) {
    double v6 = 0.0;
  }
  double v7 = (a4 - a6) * 0.5;
  if (v7 > 0.0) {
    double v7 = 0.0;
  }
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, v6, v7);
  return result;
}

double PXRectByLinearlyInterpolatingRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + a9 * (a5 - a1);
}

double PXRectScaleFromCenter(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a3 * 0.5 + a3 * a5 * -0.5;
}

double PXRectTransposed(double a1, double a2)
{
  return a2;
}

void PXRectRotated(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, float a5)
{
  float MidX = CGRectGetMidX(*(CGRect *)&a1);
  v16.origin.CGFloat x = a1;
  v16.origin.CGFloat y = a2;
  v16.size.CGFloat width = a3;
  v16.size.CGFloat height = a4;
  float MidY = CGRectGetMidY(v16);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v13, MidX, MidY);
  CGAffineTransformRotate(&v14, &v13, a5);
  CGAffineTransformTranslate(&v15, &v14, (float)-MidX, (float)-MidY);
  CGAffineTransform v12 = v15;
  v17.origin.CGFloat x = a1;
  v17.origin.CGFloat y = a2;
  v17.size.CGFloat width = a3;
  v17.size.CGFloat height = a4;
  CGRectApplyAffineTransform(v17, &v12);
}

id PXRectDescription(double a1, double a2, double a3, double a4)
{
  double v4 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&a1, *(void *)&a2, *(void *)&a3, *(void *)&a4];

  return v4;
}

BOOL PXRectContainsRectWithTolerance(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  CGRect v27 = CGRectInset(*(CGRect *)&a1, -a9, -a9);
  double v21 = a5;
  double v22 = a6;
  double v23 = a7;
  double v24 = a8;

  return CGRectContainsRect(v27, *(CGRect *)&v21);
}

BOOL PXRectStrictlyContainsPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  if (CGRectGetMinX(*(CGRect *)&a1) >= a5) {
    return 0;
  }
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  if (CGRectGetMaxX(v13) <= a5) {
    return 0;
  }
  v14.origin.CGFloat x = a1;
  v14.origin.CGFloat y = a2;
  v14.size.CGFloat width = a3;
  v14.size.CGFloat height = a4;
  if (CGRectGetMinY(v14) >= a6) {
    return 0;
  }
  v15.origin.CGFloat x = a1;
  v15.origin.CGFloat y = a2;
  v15.size.CGFloat width = a3;
  v15.size.CGFloat height = a4;
  return CGRectGetMaxY(v15) > a6;
}

BOOL PXRectStrictlyContainsAnyVertexOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v27.origin.CGFloat x = a5;
  v27.origin.CGFloat y = a6;
  v27.size.CGFloat width = a7;
  v27.size.CGFloat height = a8;
  CGFloat MinX = CGRectGetMinX(v27);
  CGFloat v24 = a5;
  v28.origin.CGFloat x = a5;
  v28.origin.CGFloat y = a6;
  v28.size.CGFloat width = a7;
  v28.size.CGFloat height = a8;
  CGFloat MinY = CGRectGetMinY(v28);
  if (PXRectStrictlyContainsPoint(a1, a2, a3, a4, MinX, MinY)) {
    return 1;
  }
  v29.origin.CGFloat x = a5;
  v29.origin.CGFloat y = a6;
  v29.size.CGFloat width = a7;
  v29.size.CGFloat height = a8;
  CGFloat v17 = CGRectGetMinX(v29);
  v30.origin.CGFloat x = v24;
  v30.origin.CGFloat y = a6;
  v30.size.CGFloat width = a7;
  v30.size.CGFloat height = a8;
  CGFloat MaxY = CGRectGetMaxY(v30);
  if (PXRectStrictlyContainsPoint(a1, a2, a3, a4, v17, MaxY)) {
    return 1;
  }
  v31.origin.CGFloat x = v24;
  v31.origin.CGFloat y = a6;
  v31.size.CGFloat width = a7;
  v31.size.CGFloat height = a8;
  CGFloat MaxX = CGRectGetMaxX(v31);
  v32.origin.CGFloat x = v24;
  v32.origin.CGFloat y = a6;
  v32.size.CGFloat width = a7;
  v32.size.CGFloat height = a8;
  CGFloat v20 = CGRectGetMinY(v32);
  if (PXRectStrictlyContainsPoint(a1, a2, a3, a4, MaxX, v20)) {
    return 1;
  }
  v33.origin.CGFloat x = v24;
  v33.origin.CGFloat y = a6;
  v33.size.CGFloat width = a7;
  v33.size.CGFloat height = a8;
  CGFloat v22 = CGRectGetMaxX(v33);
  v34.origin.CGFloat x = v24;
  v34.origin.CGFloat y = a6;
  v34.size.CGFloat width = a7;
  v34.size.CGFloat height = a8;
  CGFloat v23 = CGRectGetMaxY(v34);

  return PXRectStrictlyContainsPoint(a1, a2, a3, a4, v22, v23);
}

double PXEdgeInsetsWithValueForEdges(char a1, double a2)
{
  if (a1) {
    return a2;
  }
  else {
    return 0.0;
  }
}

double PXInsetRectWithValueForEdges(char a1, double a2, double a3, double a4, double a5, double a6)
{
  if ((a1 & 2) != 0) {
    double v6 = a6;
  }
  else {
    double v6 = 0.0;
  }
  return a2 + v6;
}

void PXEdgeInsetsForRectsFromEdgeInsetsForRect(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  if (a3 >= 1)
  {
    uint64_t v11 = a3;
    double v30 = a8 + a5;
    double v28 = a10 - (a5 + a7);
    double v29 = a9 + a4;
    double v27 = a11 - (a4 + a6);
    CGAffineTransform v12 = (CGFloat *)(a2 + 16);
    CGRect v13 = (double *)(a1 + 16);
    do
    {
      CGFloat v14 = *(v12 - 2);
      CGFloat v15 = *(v12 - 1);
      CGFloat v16 = *v12;
      CGFloat v17 = v12[1];
      v31.origin.CGFloat x = v14;
      v31.origin.CGFloat y = v15;
      v31.size.CGFloat width = *v12;
      v31.size.CGFloat height = v17;
      v33.origin.CGFloat y = v29;
      v33.origin.CGFloat x = v30;
      v33.size.CGFloat height = v27;
      v33.size.CGFloat width = v28;
      CGRect v32 = CGRectIntersection(v31, v33);
      CGFloat x = v32.origin.x;
      CGFloat y = v32.origin.y;
      CGFloat width = v32.size.width;
      CGFloat height = v32.size.height;
      IsEmpCGFloat ty = CGRectIsEmpty(v32);
      double v23 = 0.0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      if (!IsEmpty) {
        double v23 = PXEdgeInsetsBetweenRects(x, y, width, height, v14, v15, v16, v17);
      }
      *(v13 - 2) = v23;
      *((void *)v13 - 1) = v24;
      v12 += 4;
      *(void *)CGRect v13 = v25;
      *((void *)v13 + 1) = v26;
      v13 += 4;
      --v11;
    }
    while (v11);
  }
}

double PXEdgeInsetsByFlippingVertically(double a1, double a2, double a3)
{
  return a3;
}

BOOL PXEdgeInsetsIsZero(double a1, double a2, double a3, double a4)
{
  BOOL v4 = a3 == 0.0;
  if (a4 != 0.0) {
    BOOL v4 = 0;
  }
  if (a1 != 0.0) {
    BOOL v4 = 0;
  }
  return a2 == 0.0 && v4;
}

BOOL PXEdgeInsetsIsNull(double a1, double a2, double a3, double a4)
{
  return a2 == INFINITY && a1 == INFINITY && a4 == INFINITY && a3 == INFINITY;
}

double PXEdgeInsetsMaxEachEdge(double result, double a2, double a3, double a4, double a5)
{
  if (result < a5) {
    return a5;
  }
  return result;
}

double PXEdgeInsetsAddValueForEdges(double *a1, char a2, double result)
{
  if (a2)
  {
    *a1 = *a1 + result;
    if ((a2 & 2) == 0)
    {
LABEL_3:
      if ((a2 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((a2 & 2) == 0)
  {
    goto LABEL_3;
  }
  a1[1] = a1[1] + result;
  if ((a2 & 4) == 0)
  {
LABEL_4:
    if ((a2 & 8) == 0) {
      return result;
    }
LABEL_9:
    double result = a1[3] + result;
    a1[3] = result;
    return result;
  }
LABEL_8:
  a1[2] = a1[2] + result;
  if ((a2 & 8) != 0) {
    goto LABEL_9;
  }
  return result;
}

double PXEdgeInsetsScale(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

double PXEdgeInsetsByLinearlyInterpolatingInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + a9 * (a5 - a1);
}

uint64_t PXEdgesGetCGRectEdge(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = a1 - 1;
  if ((unint64_t)(a1 - 1) > 7 || ((0x8Bu >> v2) & 1) == 0) {
    return 0;
  }
  *a2 = dword_259D74BDC[v2];
  return 1;
}

CGFloat PXAffineTransformMakeFromRects@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>, CGFloat a6@<D4>, CGFloat a7@<D5>, CGFloat a8@<D6>, CGFloat a9@<D7>)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  CGFloat v17 = -CGRectGetMidX(*(CGRect *)&a2);
  v40.origin.CGFloat x = a2;
  v40.origin.CGFloat y = a3;
  v40.size.CGFloat width = a4;
  v40.size.CGFloat height = a5;
  CGFloat MidY = CGRectGetMidY(v40);
  CGAffineTransformMakeTranslation((CGAffineTransform *)a1, v17, -MidY);
  CGFloat v34 = a6;
  v41.origin.CGFloat x = a6;
  v41.origin.CGFloat y = a7;
  v41.size.CGFloat width = a8;
  v41.size.CGFloat height = a9;
  sCGFloat x = CGRectGetWidth(v41);
  v42.origin.CGFloat x = a2;
  v42.origin.CGFloat y = a3;
  v42.size.CGFloat width = a4;
  v42.size.CGFloat height = a5;
  sxCGFloat a = sx / CGRectGetWidth(v42);
  v43.origin.CGFloat x = a6;
  v43.origin.CGFloat y = a7;
  v43.size.CGFloat width = a8;
  v43.size.CGFloat height = a9;
  double Height = CGRectGetHeight(v43);
  v44.origin.CGFloat x = a2;
  v44.origin.CGFloat y = a3;
  v44.size.CGFloat width = a4;
  v44.size.CGFloat height = a5;
  CGFloat v20 = CGRectGetHeight(v44);
  CGAffineTransformMakeScale(&t2, sxa, Height / v20);
  long long v21 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)a1;
  *(_OWORD *)&t1.CGFloat c = v21;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v39, &t1, &t2);
  long long v22 = *(_OWORD *)&v39.c;
  *(_OWORD *)a1 = *(_OWORD *)&v39.a;
  *(_OWORD *)(a1 + 16) = v22;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v39.tx;
  CGFloat v23 = v34;
  *(CGFloat *)&long long v22 = a7;
  CGFloat v24 = a8;
  CGFloat v25 = a9;
  CGFloat MidX = CGRectGetMidX(*(CGRect *)((char *)&v22 - 8));
  v45.origin.CGFloat x = v34;
  v45.origin.CGFloat y = a7;
  v45.size.CGFloat width = a8;
  v45.size.CGFloat height = a9;
  CGFloat v27 = CGRectGetMidY(v45);
  CGAffineTransformMakeTranslation(&v36, MidX, v27);
  long long v28 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)a1;
  *(_OWORD *)&t1.CGFloat c = v28;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v39, &t1, &v36);
  long long v29 = *(_OWORD *)&v39.c;
  *(_OWORD *)a1 = *(_OWORD *)&v39.a;
  *(_OWORD *)(a1 + 16) = v29;
  CGFloat result = v39.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v39.tx;
  return result;
}

CGFloat PXAffineTransformMakeScaleFromPoint@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>)
{
  return PXAffineTransformMakeScaleAndRotationAroundPoint(a1, a2, 0.0, a3, a4);
}

CGFloat PXAffineTransformMakeScaleAndRotationAroundPoint@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  CGAffineTransformMakeTranslation((CGAffineTransform *)a1, -a4, -a5);
  CGAffineTransformMakeScale(&t2, a2, a2);
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)a1;
  *(_OWORD *)&t1.CGFloat c = v10;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v21, &t1, &t2);
  long long v11 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v11;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  CGAffineTransformMakeRotation(&v18, a3);
  long long v12 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)a1;
  *(_OWORD *)&t1.CGFloat c = v12;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v21, &t1, &v18);
  long long v13 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v13;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  CGAffineTransformMakeTranslation(&v17, a4, a5);
  long long v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)a1;
  *(_OWORD *)&t1.CGFloat c = v14;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v21, &t1, &v17);
  long long v15 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v15;
  CGFloat result = v21.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  return result;
}

CGFloat PXAffineTransformMakeRotationAroundPoint@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>)
{
  return PXAffineTransformMakeScaleAndRotationAroundPoint(a1, 1.0, a2, a3, a4);
}

CGFloat PXAffineTransformMakeHorizontalFlip@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  CGAffineTransformMakeTranslation((CGAffineTransform *)a1, -a2, 0.0);
  CGAffineTransformMakeScale(&t2, -1.0, 1.0);
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)a1;
  *(_OWORD *)&t1.CGFloat c = v4;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v12, &t1, &t2);
  long long v5 = *(_OWORD *)&v12.c;
  *(_OWORD *)a1 = *(_OWORD *)&v12.a;
  *(_OWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v12.tx;
  CGAffineTransformMakeTranslation(&v9, a2, 0.0);
  long long v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)a1;
  *(_OWORD *)&t1.CGFloat c = v6;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v12, &t1, &v9);
  long long v7 = *(_OWORD *)&v12.c;
  *(_OWORD *)a1 = *(_OWORD *)&v12.a;
  *(_OWORD *)(a1 + 16) = v7;
  CGFloat result = v12.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v12.tx;
  return result;
}

CGFloat PXAffineTransformOffsetFixpoint@<D0>(_OWORD *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
{
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  CGAffineTransformMakeTranslation((CGAffineTransform *)a2, a3, a4);
  long long v8 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v8;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t2.CGFloat a = *(_OWORD *)a2;
  *(_OWORD *)&t2.CGFloat c = v9;
  *(_OWORD *)&t2.CGFloat tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformConcat(&v17, &t1, &t2);
  long long v10 = *(_OWORD *)&v17.c;
  *(_OWORD *)a2 = *(_OWORD *)&v17.a;
  *(_OWORD *)(a2 + 16) = v10;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v17.tx;
  CGAffineTransformMakeTranslation(&v14, -a3, -a4);
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)a2;
  *(_OWORD *)&t1.CGFloat c = v11;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformConcat(&v17, &v14, &t1);
  long long v12 = *(_OWORD *)&v17.c;
  *(_OWORD *)a2 = *(_OWORD *)&v17.a;
  *(_OWORD *)(a2 + 16) = v12;
  CGFloat result = v17.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v17.tx;
  return result;
}

CGFloat PXAffineTransformMakeWithTranslationScaleRotation@<D0>(_OWORD *a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>, CGFloat a6@<D4>)
{
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return PXAffineTransformMakeWithTranslationScaleRotationTransform(MEMORY[0x263F000D0], (uint64_t)a1, a2, a3, a4, a5, a6);
}

CGFloat PXAffineTransformMakeWithTranslationScaleRotationTransform@<D0>(_OWORD *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, CGFloat a7@<D4>)
{
  uint64_t v12 = MEMORY[0x263F000D0];
  long long v13 = *MEMORY[0x263F000D0];
  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a2 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a2 + 16) = v14;
  long long v15 = *(_OWORD *)(v12 + 32);
  *(_OWORD *)(a2 + 32) = v15;
  *(_OWORD *)&v26.CGFloat a = v13;
  *(_OWORD *)&v26.CGFloat c = v14;
  *(_OWORD *)&v26.CGFloat tx = v15;
  CGAffineTransformTranslate((CGAffineTransform *)a2, &v26, a3, a4);
  long long v16 = a1[1];
  *(_OWORD *)&t1.CGFloat a = *a1;
  *(_OWORD *)&t1.CGFloat c = v16;
  *(_OWORD *)&t1.CGFloat tx = a1[2];
  long long v17 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v24.CGFloat a = *(_OWORD *)a2;
  *(_OWORD *)&v24.CGFloat c = v17;
  *(_OWORD *)&v24.CGFloat tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformConcat(&v26, &t1, &v24);
  long long v18 = *(_OWORD *)&v26.c;
  *(_OWORD *)a2 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a2 + 16) = v18;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v26.tx;
  long long v19 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)a2;
  *(_OWORD *)&t1.CGFloat c = v19;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformRotate(&v26, &t1, a7);
  long long v20 = *(_OWORD *)&v26.c;
  *(_OWORD *)a2 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a2 + 16) = v20;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v26.tx;
  long long v21 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t1.CGFloat a = *(_OWORD *)a2;
  *(_OWORD *)&t1.CGFloat c = v21;
  *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformScale(&v26, &t1, a5, a6);
  long long v22 = *(_OWORD *)&v26.c;
  *(_OWORD *)a2 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a2 + 16) = v22;
  CGFloat result = v26.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v26.tx;
  return result;
}

void PXAffineTransformDecomposeTranslationScaleRotation(uint64_t a1, void *a2, double *a3, double *a4, double *a5)
{
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  double v13 = *(double *)a1;
  long double v12 = *(double *)(a1 + 8);
  double v14 = atan2(v12, *(long double *)a1);
  __double2 v15 = __sincos_stret(v14);
  if (fabs(v15.__cosval) <= fabs(v15.__sinval))
  {
    double v16 = v12 / v15.__sinval;
    double v17 = -*(double *)(a1 + 16) / v15.__sinval;
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  double v16 = v13 / v15.__cosval;
  double v17 = *(double *)(a1 + 24) / v15.__cosval;
  if (a2)
  {
LABEL_5:
    *a2 = v10;
    a2[1] = v11;
  }
LABEL_6:
  if (a3) {
    *a3 = v16;
  }
  if (a4) {
    *a4 = v17;
  }
  if (a5) {
    *a5 = v14;
  }
}

double PXAffineTransformGetMaxScale(_OWORD *a1)
{
  long long v1 = a1[1];
  *(_OWORD *)&v3.CGFloat a = *a1;
  *(_OWORD *)&v3.CGFloat c = v1;
  *(_OWORD *)&v3.CGFloat tx = a1[2];
  memset(&v4, 0, sizeof(v4));
  CGAffineTransformDecompose(&v4, &v3);
  double result = v4.scale.width;
  if (v4.scale.width < v4.scale.height) {
    return v4.scale.height;
  }
  return result;
}

double PXAffineTransformGetMinScale(_OWORD *a1)
{
  long long v1 = a1[1];
  *(_OWORD *)&v3.CGFloat a = *a1;
  *(_OWORD *)&v3.CGFloat c = v1;
  *(_OWORD *)&v3.CGFloat tx = a1[2];
  memset(&v4, 0, sizeof(v4));
  CGAffineTransformDecompose(&v4, &v3);
  double result = v4.scale.width;
  if (v4.scale.width < v4.scale.height) {
    return v4.scale.height;
  }
  return result;
}

double PXAffineTransformGetUniformScale(_OWORD *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(&v7, 0, sizeof(v7));
  long long v2 = a1[1];
  *(_OWORD *)&transform.CGFloat a = *a1;
  *(_OWORD *)&transform.CGFloat c = v2;
  *(_OWORD *)&transform.CGFloat tx = a1[2];
  CGAffineTransformDecompose(&v7, &transform);
  double result = v7.scale.width;
  if (vabdd_f64(v7.scale.height, v7.scale.width) > 0.00000999999975)
  {
    CGAffineTransformComponents v4 = PXAssertGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      long long v5 = a1[1];
      *(_OWORD *)&transform.CGFloat a = *a1;
      *(_OWORD *)&transform.CGFloat c = v5;
      *(_OWORD *)&transform.CGFloat tx = a1[2];
      long long v6 = NSStringFromCGAffineTransform(&transform);
      LODWORD(transform.a) = 138412290;
      *(void *)((char *)&transform.a + 4) = v6;
      _os_log_fault_impl(&dword_259CDA000, v4, OS_LOG_TYPE_FAULT, "Expected uniform scaling in transform, but found %@", (uint8_t *)&transform, 0xCu);
    }
    return v7.scale.width;
  }
  return result;
}

BOOL PXAffineTransformIsApproximatelyEqualToTransform(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) <= 0.00000999999975
      && vabdd_f64(a1[1], a2[1]) <= 0.00000999999975
      && vabdd_f64(a1[2], a2[2]) <= 0.00000999999975
      && vabdd_f64(a1[3], a2[3]) <= 0.00000999999975
      && vabdd_f64(a1[4], a2[4]) <= 0.00000999999975
      && vabdd_f64(a1[5], a2[5]) <= 0.00000999999975;
}

unint64_t PXPageKeyForPage(uint64_t a1, unsigned __int16 a2)
{
  return ~(a2 | (unint64_t)(a1 << 16));
}

unint64_t PXPageKeyForCGPoint(double a1, double a2)
{
  return ~((unsigned __int16)(uint64_t)(a2 * 0.0009765625) | (unint64_t)((uint64_t)(a1 * 0.0009765625) << 16));
}

double PXPageAlignedRectForCGPoint(double a1)
{
  return floor(a1 * 0.0009765625) * 1024.0;
}

void PXEnumeratePageKeysForRect(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v9 = a1;
  v19.origin.CGFloat x = a2;
  v19.origin.CGFloat y = a3;
  v19.size.CGFloat width = a4;
  v19.size.CGFloat height = a5;
  if (!CGRectIsEmpty(v19))
  {
    unsigned __int8 v18 = 0;
    v20.origin.CGFloat x = a2;
    v20.origin.CGFloat y = a3;
    v20.size.CGFloat width = a4;
    v20.size.CGFloat height = a5;
    int64_t v10 = vcvtmd_s64_f64(CGRectGetMinX(v20) * 0.0009765625);
    v21.origin.CGFloat x = a2;
    v21.origin.CGFloat y = a3;
    v21.size.CGFloat width = a4;
    v21.size.CGFloat height = a5;
    int64_t v11 = vcvtmd_s64_f64(CGRectGetMaxX(v21) * 0.0009765625);
    v22.origin.CGFloat x = a2;
    v22.origin.CGFloat y = a3;
    v22.size.CGFloat width = a4;
    v22.size.CGFloat height = a5;
    double MinY = CGRectGetMinY(v22);
    v23.origin.CGFloat x = a2;
    v23.origin.CGFloat y = a3;
    v23.size.CGFloat width = a4;
    v23.size.CGFloat height = a5;
    double MaxY = CGRectGetMaxY(v23);
    if (v10 <= v11)
    {
      int64_t v14 = vcvtmd_s64_f64(MinY * 0.0009765625);
      int64_t v15 = vcvtmd_s64_f64(MaxY * 0.0009765625);
      do
      {
        if (v14 <= v15)
        {
          int64_t v17 = v14;
          do
          {
            v9[2](v9, ~((unsigned __int16)v17 | (unint64_t)(v10 << 16)), &v18);
            int v16 = v18;
            if (v17 >= v15) {
              break;
            }
            ++v17;
          }
          while (!v18);
        }
        else
        {
          int v16 = 0;
        }
        if (v10 >= v11) {
          break;
        }
        ++v10;
      }
      while (!v16);
    }
  }
}

float PXMatrixMakePerspectiveProjection(float a1, float a2)
{
  return (float)(1.0 / tanf(a2 * 0.5)) / a1;
}

double PXDerivative(double (**a1)(id, double), double a2)
{
  double v3 = a2 + 0.03125;
  CGAffineTransformComponents v4 = a1 + 2;
  long long v5 = (double (*)(double))a1[2];
  long long v6 = a1;
  double v7 = v5(v3);
  double v8 = (*v4)(v6, a2 + -0.03125);

  return (v7 - v8) * 16.0;
}

double PXRectFunctionDerivative(double (**a1)(id, double), double a2)
{
  double v3 = a2 + 0.03125;
  CGAffineTransformComponents v4 = a1 + 2;
  long long v5 = (double (*)(double))a1[2];
  long long v6 = a1;
  double v7 = v5(v3);
  double v8 = (*v4)(v6, a2 + -0.03125);

  return (v7 - v8) * 16.0;
}

double PXRectDerivativeIntegrate(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + a5 * a9;
}

uint64_t PXAxisFromUICollectionViewScrollDirection(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  if (a1 != 1)
  {
    long long v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v2, v1, v3, v4);
    double v7 = [NSString stringWithUTF8String:"PXAxis PXAxisFromUICollectionViewScrollDirection(UICollectionViewScrollDirection)"];
    [v6 handleFailureInFunction:v7 file:@"PXGeometry.m" lineNumber:1083 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 2;
}

uint64_t PXEdgesFlippedHorizontally(uint64_t a1)
{
  uint64_t v1 = a1 ^ 0xA;
  if ((a1 & 8) == 0) {
    uint64_t v1 = a1;
  }
  if ((a1 & 2) != 0) {
    return v1 ^ 0xA;
  }
  else {
    return v1;
  }
}

double PXRectWithSizeAlignedToRectEdges(char a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  return PXRectWithSizeAlignedToRectEdgesWithPadding(a1, a2, a3, a4, a5, a6, a7, *MEMORY[0x263F001B0]);
}

uint64_t PXEdgesFromCGRectEdge(unsigned int a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return qword_259D74C10[a1];
  }
}

uint64_t PXIsPhotosMessagesApp()
{
  if (PXIsPhotosMessagesApp_onceToken != -1) {
    dispatch_once(&PXIsPhotosMessagesApp_onceToken, &__block_literal_global_7943);
  }
  return PXIsPhotosMessagesApp_isPhotosMessagesApp;
}

void __PXIsPhotosMessagesApp_block_invoke()
{
  os_log_t v0 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"PhotosMessagesApp"];
  PXIsPhotosMessagesApp_isPhotosMessagesApp = (char)v0;
}

void PXEnumerateSubrangesMatchingTestUsingBlock(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  double v7 = a3;
  double v8 = a4;
  if (a2)
  {
    unint64_t v9 = a1 + a2;
    if (!__CFADD__(a1, a2))
    {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        char v13 = 0;
        if (a1 >= v9) {
          goto LABEL_10;
        }
        int v11 = v7[2](v7, a1, &v13);
        if (v13) {
          break;
        }
        if (v11)
        {
          if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v12 = a1;
          }
          else {
            uint64_t v12 = v10;
          }
        }
        else
        {
LABEL_10:
          uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v8[2](v8, v10, a1 - v10, &v13);
            if (v13) {
              break;
            }
            uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        ++a1;
        uint64_t v10 = v12;
      }
      while (a1 <= v9);
    }
  }
}

void sub_259D5DB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D5E660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D5FA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8196(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8197(uint64_t a1)
{
}

void sub_259D5FC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v15 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  uint64_t v19 = va_arg(va2, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void sub_259D5FFB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_259D60590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

void sub_259D60B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 80), 8);
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void PXIterateAsynchronously(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v15 = 0;
  int v16 = (id *)&v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__8350;
  uint64_t v19 = __Block_byref_object_dispose__8351;
  id v20 = 0;
  double v7 = [[_PXAsyncIterator alloc] initWithCount:a1 handler:v5];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __PXIterateAsynchronously_block_invoke;
  uint64_t v12 = &unk_26545BBB0;
  uint64_t v14 = &v15;
  id v8 = v6;
  id v13 = v8;
  [(_PXAsyncIterator *)v7 setCompletion:&v9];
  objc_storeStrong(v16 + 5, v7);
  [(_PXAsyncIterator *)v7 _executeNextRun];

  _Block_object_dispose(&v15, 8);
}

void sub_259D61428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8350(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8351(uint64_t a1)
{
}

uint64_t __PXIterateAsynchronously_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void px_dispatch_on_main_queue_sync(void *a1)
{
  uint64_t v1 = a1;
  if (v1)
  {
    block = v1;
    if ([MEMORY[0x263F08B88] isMainThread]) {
      block[2]();
    }
    else {
      dispatch_sync(MEMORY[0x263EF83A0], block);
    }
    uint64_t v1 = block;
  }
}

dispatch_queue_t px_dispatch_queue_create(const char *a1, NSObject *a2, dispatch_qos_class_t a3)
{
  return px_dispatch_queue_create_with_priority(a1, a2, a3, 0);
}

id px_dispatch_queue_create_serial_with_priority(const char *a1, dispatch_qos_class_t a2, int a3)
{
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  double v7 = px_dispatch_queue_create_with_priority(a1, v6, a2, a3);

  return v7;
}

uint64_t px_dispatch_qos_from_nsqualityofservice(uint64_t a1)
{
  if (a1 == 25) {
    int v1 = 25;
  }
  else {
    int v1 = 33;
  }
  if (a1 == 17) {
    unsigned int v2 = 17;
  }
  else {
    unsigned int v2 = v1;
  }
  if (a1 == 9) {
    unsigned int v3 = 9;
  }
  else {
    unsigned int v3 = 33;
  }
  if (a1 == -1) {
    unsigned int v3 = 21;
  }
  if (a1 <= 16) {
    return v3;
  }
  else {
    return v2;
  }
}

char *PXSyncCallbackBegin(void *a1)
{
  int v1 = a1;
  dispatch_assert_queue_V2(v1);
  unsigned int v2 = (const void *)PXSyncCallbackKey;
  unsigned int v3 = (char *)dispatch_queue_get_specific(v1, (const void *)PXSyncCallbackKey) + 1;
  dispatch_queue_set_specific(v1, v2, v3, 0);

  return v3;
}

void PXSyncCallbackEnd(void *a1)
{
  queue = a1;
  dispatch_assert_queue_V2(queue);
  int v1 = (const void *)PXSyncCallbackKey;
  specifiCGFloat c = (char *)dispatch_queue_get_specific(queue, (const void *)PXSyncCallbackKey);
  dispatch_queue_set_specific(queue, v1, specific - 1, 0);
}

BOOL PXIsSyncCallback(void *a1)
{
  return dispatch_get_specific((const void *)PXSyncCallbackKey) == a1;
}

void PXPerformWithSyncTokenOnQueue(void *a1, NSObject *a2, void *a3)
{
  if (dispatch_get_specific((const void *)PXSyncCallbackKey) == a1)
  {
    id v5 = (void (*)(void *))a3[2];
    v5(a3);
  }
  else
  {
    dispatch_async(a2, a3);
  }
}

uint64_t sub_259D622A8()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_259D622B8()
{
  return MEMORY[0x270EEE7F0]();
}

uint64_t sub_259D622C8()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_259D622D8()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_259D622E8()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_259D622F8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_259D62308()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_259D62318()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_259D62328()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_259D62338()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_259D62348()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_259D62358()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_259D62368()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_259D62378()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_259D62388()
{
  return MEMORY[0x270EF14D8]();
}

uint64_t sub_259D62398()
{
  return MEMORY[0x270EF1538]();
}

uint64_t sub_259D623A8()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_259D623B8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_259D623C8()
{
  return MEMORY[0x270FA11C0]();
}

uint64_t sub_259D623D8()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_259D623E8()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_259D623F8()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_259D62408()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_259D62418()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_259D62428()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_259D62438()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_259D62448()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_259D62458()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_259D62468()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_259D62478()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_259D62488()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_259D62498()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_259D624A8()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_259D624B8()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_259D624C8()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_259D624D8()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_259D624E8()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_259D624F8()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_259D62508()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_259D62518()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_259D62528()
{
  return MEMORY[0x270F9D068]();
}

uint64_t sub_259D62538()
{
  return MEMORY[0x270F9D070]();
}

uint64_t sub_259D62548()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_259D62558()
{
  return MEMORY[0x270F9D150]();
}

uint64_t sub_259D62568()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_259D62578()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_259D62588()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_259D62598()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_259D625A8()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_259D625B8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_259D625C8()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_259D625D8()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_259D625E8()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_259D625F8()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_259D62608()
{
  return MEMORY[0x270F9D550]();
}

uint64_t sub_259D62618()
{
  return MEMORY[0x270F9D578]();
}

uint64_t sub_259D62628()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_259D62638()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_259D62648()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_259D62658()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_259D62668()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_259D62678()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_259D62688()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_259D62698()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_259D626A8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_259D626B8()
{
  return MEMORY[0x270F9D888]();
}

uint64_t sub_259D626C8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_259D626D8()
{
  return MEMORY[0x270F9D910]();
}

uint64_t sub_259D626E8()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_259D626F8()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_259D62708()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_259D62718()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_259D62728()
{
  return MEMORY[0x270F9D988]();
}

uint64_t sub_259D62738()
{
  return MEMORY[0x270F9D9C0]();
}

uint64_t sub_259D62748()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_259D62758()
{
  return MEMORY[0x270F9DA20]();
}

uint64_t sub_259D62768()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_259D62778()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_259D62788()
{
  return MEMORY[0x270F9DBA8]();
}

uint64_t sub_259D62798()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_259D627A8()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_259D627B8()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_259D627C8()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t sub_259D627D8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_259D627E8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_259D627F8()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_259D62808()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_259D62818()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_259D62828()
{
  return MEMORY[0x270F9DC90]();
}

uint64_t sub_259D62838()
{
  return MEMORY[0x270F9DC98]();
}

uint64_t sub_259D62848()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_259D62858()
{
  return MEMORY[0x270F9DCB0]();
}

uint64_t sub_259D62868()
{
  return MEMORY[0x270F9DCB8]();
}

uint64_t sub_259D62878()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_259D62888()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_259D62898()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_259D628A8()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_259D628B8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_259D628C8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_259D628D8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_259D628E8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_259D628F8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_259D62918()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_259D62928()
{
  return MEMORY[0x270F9DF60]();
}

uint64_t sub_259D62938()
{
  return MEMORY[0x270F9DF70]();
}

uint64_t sub_259D62948()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_259D62958()
{
  return MEMORY[0x270F9DFC8]();
}

uint64_t sub_259D62968()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_259D62978()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_259D62988()
{
  return MEMORY[0x270F9E018]();
}

uint64_t sub_259D62998()
{
  return MEMORY[0x270F9E050]();
}

uint64_t sub_259D629A8()
{
  return MEMORY[0x270F9E060]();
}

uint64_t sub_259D629C8()
{
  return MEMORY[0x270F9E070]();
}

uint64_t sub_259D629E8()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_259D629F8()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_259D62A08()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t sub_259D62A18()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_259D62A28()
{
  return MEMORY[0x270F9E0F8]();
}

uint64_t sub_259D62A48()
{
  return MEMORY[0x270F9E110]();
}

uint64_t sub_259D62A58()
{
  return MEMORY[0x270F9E118]();
}

uint64_t sub_259D62A68()
{
  return MEMORY[0x270F9E120]();
}

uint64_t sub_259D62A88()
{
  return MEMORY[0x270F9E138]();
}

uint64_t sub_259D62A98()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_259D62AA8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_259D62AB8()
{
  return MEMORY[0x270F9E1E8]();
}

uint64_t sub_259D62AC8()
{
  return MEMORY[0x270F9E2F0]();
}

uint64_t sub_259D62AD8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_259D62AE8()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_259D62AF8()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_259D62B08()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_259D62B18()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_259D62B28()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_259D62B38()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_259D62B48()
{
  return MEMORY[0x270F82900]();
}

uint64_t sub_259D62B58()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_259D62B68()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_259D62B78()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_259D62B88()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_259D62B98()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_259D62BA8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_259D62BB8()
{
  return MEMORY[0x270F9E728]();
}

uint64_t sub_259D62BD8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_259D62BE8()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_259D62BF8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_259D62C08()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_259D62C18()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_259D62C28()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_259D62C38()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_259D62C48()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_259D62C58()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_259D62C68()
{
  return MEMORY[0x270F9E9C8]();
}

uint64_t sub_259D62C78()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_259D62C88()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_259D62C98()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_259D62CA8()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_259D62CB8()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_259D62CC8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_259D62CD8()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_259D62CE8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_259D62CF8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_259D62D08()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_259D62D18()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_259D62D28()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_259D62D38()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_259D62D48()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_259D62D58()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_259D62D68()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_259D62D78()
{
  return MEMORY[0x270F9ECD0]();
}

uint64_t sub_259D62D88()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_259D62D98()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_259D62DA8()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_259D62DB8()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_259D62DC8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_259D62DD8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_259D62DE8()
{
  return MEMORY[0x270F9F010]();
}

uint64_t sub_259D62DF8()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_259D62E08()
{
  return MEMORY[0x270F9F038]();
}

uint64_t sub_259D62E18()
{
  return MEMORY[0x270F9F040]();
}

uint64_t sub_259D62E28()
{
  return MEMORY[0x270F9F048]();
}

uint64_t sub_259D62E38()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_259D62E48()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_259D62E58()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_259D62E88()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_259D62E98()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_259D62EB8()
{
  return MEMORY[0x270F9F740]();
}

uint64_t sub_259D62EC8()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_259D62ED8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_259D62EE8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_259D62EF8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_259D62F08()
{
  return MEMORY[0x270F9FA70]();
}

uint64_t sub_259D62F18()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_259D62F28()
{
  return MEMORY[0x270F9FA90]();
}

uint64_t sub_259D62F38()
{
  return MEMORY[0x270F9FA98]();
}

uint64_t sub_259D62F48()
{
  return MEMORY[0x270F9FAA8]();
}

uint64_t sub_259D62F58()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_259D62F68()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_259D62F78()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_259D62F88()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_259D62F98()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_259D62FA8()
{
  return MEMORY[0x270F9FBA8]();
}

uint64_t sub_259D62FB8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_259D62FC8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_259D62FD8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_259D62FE8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_259D63008()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_259D63018()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_259D63028()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_259D63068()
{
  return MEMORY[0x270FA00C0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x270EFB7B0](minimum, maximum, preferred);
  result.preferreCGFloat d = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x270EE4E88](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x270EE5968](retstr, transform);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x270EE5970](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
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

uint64_t CGBitmapContextCreateWithCallbacks()
{
  return MEMORY[0x270EE5A08]();
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
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

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokeRectWithWidth(CGContextRef c, CGRect rect, CGFloat width)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x270EE63E8]();
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
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

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5028](isrc, index, options);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x270EE6A80](consumer, mediaBox, auxiliaryInfo);
}

CGContextRef CGPDFContextCreateWithURL(CFURLRef url, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x270EE6A88](url, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
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
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
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

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x270EE9A80]();
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AE0](descriptor, matrix, size);
}

uint64_t CTFontDescriptorCreateWithAttributesAndOptions()
{
  return MEMORY[0x270EE9B68]();
}

CGRect CTFontGetBoundingBox(CTFontRef font)
{
  MEMORY[0x270EE9BF0](font);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x270EE9C28](font, characters, glyphs, count);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t NSAllocateScannedUncollectable()
{
  return MEMORY[0x270EF2A38]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x270F82BB8](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F82BC0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x270F82BD8](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

uint64_t PFProcessIsLaunchedToExecuteTests()
{
  return MEMORY[0x270F53690]();
}

uint64_t PFSizeWithAspectRatioFillingSize()
{
  return MEMORY[0x270F536A8]();
}

uint64_t PFSizeWithAspectRatioFittingSize()
{
  return MEMORY[0x270F536B0]();
}

uint64_t PFStringWithValidatedFormat()
{
  return MEMORY[0x270F536C0]();
}

uint64_t PFUIGetLog()
{
  return MEMORY[0x270F536D0]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F82C48]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x270F82CC8](lhs, rhs);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F82DD0](image, compressionQuality);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIContentSizeCategoryCompareToContentSizeCategory()
{
  return MEMORY[0x270F82F78]();
}

uint64_t _UIMediaTimeForMachTime()
{
  return MEMORY[0x270F82FC8]();
}

uint64_t _UIUpdateCurrentTiming()
{
  return MEMORY[0x270F83010]();
}

uint64_t _UIUpdateCycleEnabled()
{
  return MEMORY[0x270F83018]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x270ED87A0](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x270ED92B0](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
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

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x270ED9480](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x270ED9F48]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_modifyAtReferenceWritableKeyPath()
{
  return MEMORY[0x270FA04E0]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x270FA0500]();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x270FA0540]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}

long double tanh(long double __x)
{
  MEMORY[0x270EDB820](__x);
  return result;
}