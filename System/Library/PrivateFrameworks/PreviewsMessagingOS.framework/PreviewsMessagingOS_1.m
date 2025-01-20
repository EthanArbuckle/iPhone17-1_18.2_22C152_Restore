__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  long long v3;
  long long v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for AppManagerInterface.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 72);
    if (v4 >= 5) {
      unsigned int v4 = *(_DWORD *)a1 + 5;
    }
    switch(v4)
    {
      case 0u:
        v5 = *(void **)a1;
        goto LABEL_9;
      case 1u:
        swift_bridgeObjectRelease();
        break;
      case 2u:
      case 3u:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v5 = *(void **)(a1 + 64);
        goto LABEL_9;
      case 4u:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v5 = *(void **)(a1 + 32);
LABEL_9:

        break;
      default:
        break;
    }
    unsigned int v6 = *(unsigned __int8 *)(a2 + 72);
    if (v6 >= 5) {
      unsigned int v6 = *(_DWORD *)a2 + 5;
    }
    switch(v6)
    {
      case 0u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
        *(unsigned char *)(a1 + 72) = 0;
        return a1;
      case 1u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
        char v9 = 1;
        goto LABEL_19;
      case 2u:
        long long v10 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 48) = v10;
        *(void *)(a1 + 64) = *(void *)(a2 + 64);
        long long v11 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v11;
        char v9 = 2;
        goto LABEL_19;
      case 3u:
        long long v12 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 48) = v12;
        *(void *)(a1 + 64) = *(void *)(a2 + 64);
        long long v13 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v13;
        char v9 = 3;
        goto LABEL_19;
      case 4u:
        long long v14 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v14;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        char v9 = 4;
LABEL_19:
        *(unsigned char *)(a1 + 72) = v9;
        break;
      default:
        long long v7 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 48) = v7;
        *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
        long long v8 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v8;
        break;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AppManagerInterface.TwoWayMessage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 73)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 72);
  if (v3 >= 6) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AppManagerInterface.TwoWayMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_OWORD *)(result + 57) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 73) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 73) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 72) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25A5E682C(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 72);
  if (result >= 5) {
    return (*(_DWORD *)a1 + 5);
  }
  return result;
}

uint64_t sub_25A5E6848(uint64_t result, unsigned int a2)
{
  if (a2 > 4)
  {
    *(void *)(result + 64) = 0;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 5;
    LOBYTE(a2) = 5;
  }
  *(unsigned char *)(result + 72) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppManagerInterface.TwoWayMessage()
{
  return &type metadata for AppManagerInterface.TwoWayMessage;
}

uint64_t initializeBufferWithCopyOfBuffer for InstallAppRequest(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v4 = v3;
  return a1;
}

void destroy for InstallAppRequest(id *a1)
{
}

uint64_t assignWithCopy for InstallAppRequest(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for InstallAppRequest(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

ValueMetadata *type metadata accessor for InstallAppRequest()
{
  return &type metadata for InstallAppRequest;
}

uint64_t assignWithCopy for UninstallAppsRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for UninstallAppsRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for UninstallAppsRequest(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 9)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UninstallAppsRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UninstallAppsRequest()
{
  return &type metadata for UninstallAppsRequest;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

ValueMetadata *type metadata accessor for CopyURLRequest()
{
  return &type metadata for CopyURLRequest;
}

ValueMetadata *type metadata accessor for CopyURLResponse()
{
  return &type metadata for CopyURLResponse;
}

void _s19PreviewsMessagingOS14CopyURLRequestVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = *(void **)(a1 + 64);
}

void *_s19PreviewsMessagingOS14CopyURLRequestVwcp_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  long long v7 = (void *)a2[8];
  a1[8] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v8 = v7;
  return a1;
}

void *_s19PreviewsMessagingOS14CopyURLRequestVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[8];
  uint64_t v5 = (void *)a1[8];
  a1[8] = v4;
  id v6 = v4;

  return a1;
}

uint64_t _s19PreviewsMessagingOS14CopyURLRequestVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  long long v7 = *(void **)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);

  return a1;
}

uint64_t _s19PreviewsMessagingOS14CopyURLRequestVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25A5E6D60(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GrantExecutePermissionRequest()
{
  return &type metadata for GrantExecutePermissionRequest;
}

void destroy for ResetAppRequest(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for ResetAppRequest(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = (void *)a2[4];
  a1[4] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v5;
  return a1;
}

void *assignWithCopy for ResetAppRequest(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = (void *)a2[4];
  a1[4] = v5;
  id v6 = v5;

  return a1;
}

uint64_t assignWithTake for ResetAppRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

ValueMetadata *type metadata accessor for ResetAppRequest()
{
  return &type metadata for ResetAppRequest;
}

unsigned char *storeEnumTagSinglePayload for ResetAppRequest.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x25A5E7010);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ResetAppRequest.Key()
{
  return &type metadata for ResetAppRequest.Key;
}

ValueMetadata *type metadata accessor for GrantExecutePermissionRequest.Key()
{
  return &type metadata for GrantExecutePermissionRequest.Key;
}

unsigned char *storeEnumTagSinglePayload for CopyURLResponse.Key(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25A5E70F8);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CopyURLResponse.Key()
{
  return &type metadata for CopyURLResponse.Key;
}

unsigned char *_s19PreviewsMessagingOS29GrantExecutePermissionRequestV3KeyOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A5E71FCLL);
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

ValueMetadata *type metadata accessor for CopyURLRequest.Key()
{
  return &type metadata for CopyURLRequest.Key;
}

ValueMetadata *type metadata accessor for UninstallAppsRequest.Key()
{
  return &type metadata for UninstallAppsRequest.Key;
}

ValueMetadata *type metadata accessor for InstallAppRequest.Key()
{
  return &type metadata for InstallAppRequest.Key;
}

unsigned char *storeEnumTagSinglePayload for AppManagerInterface.TwoWayMessage.Discriminant(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x25A5E7324);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppManagerInterface.TwoWayMessage.Discriminant()
{
  return &type metadata for AppManagerInterface.TwoWayMessage.Discriminant;
}

unsigned char *_s19PreviewsMessagingOS20UninstallAppsRequestV3KeyOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A5E7428);
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

ValueMetadata *type metadata accessor for AppManagerInterface.TwoWayMessage.Key()
{
  return &type metadata for AppManagerInterface.TwoWayMessage.Key;
}

unint64_t sub_25A5E7464()
{
  unint64_t result = qword_26A42B570;
  if (!qword_26A42B570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B570);
  }
  return result;
}

unint64_t sub_25A5E74BC()
{
  unint64_t result = qword_26A42B578;
  if (!qword_26A42B578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B578);
  }
  return result;
}

unint64_t sub_25A5E7514()
{
  unint64_t result = qword_26A42B580;
  if (!qword_26A42B580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B580);
  }
  return result;
}

uint64_t sub_25A5E7568()
{
  return sub_25A5E7668(&qword_26A42B588, &qword_26A42B590);
}

unint64_t sub_25A5E7594()
{
  unint64_t result = qword_26A42B598;
  if (!qword_26A42B598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B598);
  }
  return result;
}

unint64_t sub_25A5E75EC()
{
  unint64_t result = qword_26A42B5A0;
  if (!qword_26A42B5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B5A0);
  }
  return result;
}

uint64_t sub_25A5E7640()
{
  return sub_25A5E7668(&qword_26A42B5A8, &qword_26A42B5B0);
}

uint64_t sub_25A5E7668(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_25A5E76BC()
{
  unint64_t result = qword_26A42B5B8;
  if (!qword_26A42B5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B5B8);
  }
  return result;
}

unint64_t sub_25A5E7714()
{
  unint64_t result = qword_26A42B5C0;
  if (!qword_26A42B5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B5C0);
  }
  return result;
}

unint64_t sub_25A5E776C()
{
  unint64_t result = qword_26A42B5C8;
  if (!qword_26A42B5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B5C8);
  }
  return result;
}

unint64_t sub_25A5E77C0()
{
  unint64_t result = qword_26A42B5D0;
  if (!qword_26A42B5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B5D0);
  }
  return result;
}

uint64_t sub_25A5E7814()
{
  return 0x7461506C616E6966;
}

uint64_t sub_25A5E7830()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t sub_25A5E787C()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_25A5E78C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B5D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A5E7960(char a1, char a2)
{
  if (*(void *)&aUuid_3[8 * a1] == *(void *)&aUuid_3[8 * a2]) {
    char v2 = 1;
  }
  else {
    char v2 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_25A5E79C8(char a1, char a2)
{
  if (*(void *)&aImageindimageo_1[8 * a1] == *(void *)&aImageindimageo_1[8 * a2]
    && *(void *)&aSymbollosource_1[8 * a1 + 24] == *(void *)&aSymbollosource_1[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5E7A50(char a1, char a2)
{
  if (qword_25A6316C0[a1] == qword_25A6316C0[a2] && qword_25A631708[a1] == qword_25A631708[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5E7AD8(char a1, char a2)
{
  if (*(void *)&aDiscrimiauditt_1[8 * a1] == *(void *)&aDiscrimiauditt_1[8 * a2]
    && *(void *)&aNant_3[8 * a1] == *(void *)&aNant_3[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5E7B60(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 6580592;
  }
  else {
    uint64_t v3 = 0x6B6F547469647561;
  }
  if (v2) {
    unint64_t v4 = 0xEA00000000006E65;
  }
  else {
    unint64_t v4 = 0xE300000000000000;
  }
  if (a2) {
    uint64_t v5 = 6580592;
  }
  else {
    uint64_t v5 = 0x6B6F547469647561;
  }
  if (a2) {
    unint64_t v6 = 0xE300000000000000;
  }
  else {
    unint64_t v6 = 0xEA00000000006E65;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E7C00(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1835365481;
  }
  else {
    uint64_t v3 = 0x6E6F6974636573;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1835365481;
  }
  else {
    uint64_t v5 = 0x6E6F6974636573;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E7C9C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x656D614E656C6966;
  }
  else {
    uint64_t v3 = 0x614E656C75646F6DLL;
  }
  if (v2) {
    unint64_t v4 = 0xEA0000000000656DLL;
  }
  else {
    unint64_t v4 = 0xE800000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x656D614E656C6966;
  }
  else {
    uint64_t v5 = 0x614E656C75646F6DLL;
  }
  if (a2) {
    unint64_t v6 = 0xE800000000000000;
  }
  else {
    unint64_t v6 = 0xEA0000000000656DLL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E7D44(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x800000025A636090;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x726F77656D617266;
      unint64_t v3 = 0xED0000687461506BLL;
      break;
    case 2:
      unint64_t v5 = 0xD000000000000012;
      unint64_t v6 = "instanceIdentifier";
      goto LABEL_5;
    case 3:
      unint64_t v5 = 0xD000000000000015;
      unint64_t v6 = "initializationPayload";
LABEL_5:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x800000025A636090;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x726F77656D617266;
      unint64_t v7 = 0xED0000687461506BLL;
      break;
    case 2:
      unint64_t v2 = 0xD000000000000012;
      id v8 = "instanceIdentifier";
      goto LABEL_10;
    case 3:
      unint64_t v2 = 0xD000000000000015;
      id v8 = "initializationPayload";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_25A5E7EC8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x4F746E65746E6F63;
  }
  else {
    uint64_t v3 = 0x43746E65746E6F63;
  }
  if (v2) {
    unint64_t v4 = 0xEF79726F67657461;
  }
  else {
    unint64_t v4 = 0xEF65646972726576;
  }
  if (a2) {
    uint64_t v5 = 0x4F746E65746E6F63;
  }
  else {
    uint64_t v5 = 0x43746E65746E6F63;
  }
  if (a2) {
    unint64_t v6 = 0xEF65646972726576;
  }
  else {
    unint64_t v6 = 0xEF79726F67657461;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E7F84(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000012;
  }
  else {
    unint64_t v3 = 0x43746E65746E6F63;
  }
  if (v2) {
    unint64_t v4 = 0xEF79726F67657461;
  }
  else {
    unint64_t v4 = 0x800000025A6359E0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000012;
  }
  else {
    unint64_t v5 = 0x43746E65746E6F63;
  }
  if (a2) {
    unint64_t v6 = 0x800000025A6359E0;
  }
  else {
    unint64_t v6 = 0xEF79726F67657461;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E8038(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0xD000000000000011;
    }
    else {
      unint64_t v3 = 0x73746E6169726176;
    }
    if (v2 == 1) {
      unint64_t v4 = 0x800000025A635FC0;
    }
    else {
      unint64_t v4 = 0xE800000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0xD000000000000011;
      }
      else {
        unint64_t v6 = 0x73746E6169726176;
      }
      if (v5 == 1) {
        unint64_t v7 = 0x800000025A635FC0;
      }
      else {
        unint64_t v7 = 0xE800000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE500000000000000;
    unint64_t v3 = 0x656C746974;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE500000000000000;
  if (v3 != 0x656C746974)
  {
LABEL_21:
    char v8 = sub_25A6233B0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25A5E813C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0xD000000000000019;
    }
    else {
      unint64_t v3 = 0xD000000000000018;
    }
    if (v2 == 1) {
      unint64_t v4 = 0x800000025A635FF0;
    }
    else {
      unint64_t v4 = 0x800000025A636010;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0xD000000000000019;
      }
      else {
        unint64_t v6 = 0xD000000000000018;
      }
      if (v5 == 1) {
        unint64_t v7 = 0x800000025A635FF0;
      }
      else {
        unint64_t v7 = 0x800000025A636010;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v3 = 0x696D697263736964;
    unint64_t v4 = 0xEC000000746E616ELL;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xEC000000746E616ELL;
  if (v3 != 0x696D697263736964)
  {
LABEL_21:
    char v8 = sub_25A6233B0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25A5E8250(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6C655369746C756DLL;
  }
  else {
    uint64_t v3 = 0x6553656C676E6973;
  }
  if (v2) {
    unint64_t v4 = 0xEC0000007463656CLL;
  }
  else {
    unint64_t v4 = 0xEB00000000746365;
  }
  if (a2) {
    uint64_t v5 = 0x6C655369746C756DLL;
  }
  else {
    uint64_t v5 = 0x6553656C676E6973;
  }
  if (a2) {
    unint64_t v6 = 0xEB00000000746365;
  }
  else {
    unint64_t v6 = 0xEC0000007463656CLL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E8304(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x65676E6172;
  }
  else {
    uint64_t v3 = 1953720684;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x65676E6172;
  }
  else {
    uint64_t v5 = 1953720684;
  }
  if (a2) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E839C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x56746C7561666564;
  }
  else {
    uint64_t v3 = 0x656C797473;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xEE00746E61697261;
  }
  if (a2) {
    uint64_t v5 = 0x56746C7561666564;
  }
  else {
    uint64_t v5 = 0x656C797473;
  }
  if (a2) {
    unint64_t v6 = 0xEE00746E61697261;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E8448(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000014;
  unint64_t v3 = 0x800000025A6355A0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000014;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x754E776F646E6977;
      unint64_t v3 = 0xEC0000007265626DLL;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1702521203;
      break;
    case 3:
      unint64_t v5 = 0x636146656C616373;
      unint64_t v3 = 0xEB00000000726F74;
      break;
    case 4:
      break;
    default:
      unint64_t v5 = 0x6B6F547469647561;
      unint64_t v3 = 0xEA00000000006E65;
      break;
  }
  unint64_t v6 = 0x800000025A6355A0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEC0000007265626DLL;
      if (v5 == 0x754E776F646E6977) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      unint64_t v2 = 1702521203;
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xEB00000000726F74;
      if (v5 != 0x636146656C616373) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 4:
LABEL_12:
      if (v5 == v2) {
        goto LABEL_13;
      }
      goto LABEL_16;
    default:
      unint64_t v6 = 0xEA00000000006E65;
      if (v5 != 0x6B6F547469647561) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5E862C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000012;
  }
  else {
    unint64_t v3 = 0x6574756C6F736261;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0x800000025A634E10;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000012;
  }
  else {
    unint64_t v5 = 0x6574756C6F736261;
  }
  if (a2) {
    unint64_t v6 = 0x800000025A634E10;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E86D4(char a1, char a2)
{
  if (*(void *)&aBundle_7[8 * a1] == *(void *)&aBundle_7[8 * a2] && qword_25A631798[a1] == qword_25A631798[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5E875C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x74616964656D6D69;
  }
  else {
    uint64_t v3 = 0x746C7561666564;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xE900000000000065;
  }
  if (a2) {
    uint64_t v5 = 0x74616964656D6D69;
  }
  else {
    uint64_t v5 = 0x746C7561666564;
  }
  if (a2) {
    unint64_t v6 = 0xE900000000000065;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E8804(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000017;
  unint64_t v3 = 0x800000025A634E90;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000017;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEE0068746150656CLL;
      unint64_t v5 = 0x6261747563657865;
      break;
    case 2:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x6E6F697461636F6CLL;
      break;
    case 3:
      unint64_t v3 = 0xEF79676574617274;
      unint64_t v5 = 0x53676E6964616F6CLL;
      break;
    case 4:
      unint64_t v5 = 0x614E656C75646F6DLL;
      unint64_t v3 = 0xEA0000000000656DLL;
      break;
    case 5:
      break;
    case 6:
      unint64_t v3 = 0xEA00000000006465;
      unint64_t v5 = 0x7269757165527369;
      break;
    default:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1752457584;
      break;
  }
  unint64_t v6 = 0x800000025A634E90;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEE0068746150656CLL;
      if (v5 == 0x6261747563657865) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x6E6F697461636F6CLL) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      unint64_t v6 = 0xEF79676574617274;
      if (v5 != 0x53676E6964616F6CLL) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      unint64_t v2 = 0x614E656C75646F6DLL;
      unint64_t v6 = 0xEA0000000000656DLL;
      goto LABEL_18;
    case 5:
LABEL_18:
      if (v5 == v2) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0xEA00000000006465;
      if (v5 != 0x7269757165527369) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1752457584) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5E8A88(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1752457584;
  }
  else {
    uint64_t v3 = 0x696669746E656469;
  }
  if (v2) {
    unint64_t v4 = 0xEA00000000007265;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1752457584;
  }
  else {
    uint64_t v5 = 0x696669746E656469;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xEA00000000007265;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E8B28(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x800000025A635E00;
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
  unint64_t v6 = 0x800000025A635E00;
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
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E8CB0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x73746E6169726176;
  }
  else {
    uint64_t v3 = 0x656C746974;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xE800000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x73746E6169726176;
  }
  else {
    uint64_t v5 = 0x656C746974;
  }
  if (a2) {
    unint64_t v6 = 0xE800000000000000;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E8D50(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x736E6F6974636573;
  }
  else {
    uint64_t v3 = 0x656C746974;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xE800000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x736E6F6974636573;
  }
  else {
    uint64_t v5 = 0x656C746974;
  }
  if (a2) {
    unint64_t v6 = 0xE800000000000000;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E8DF0(char a1, char a2)
{
  if (*(void *)&aIdentifipath_1[8 * a1] == *(void *)&aIdentifipath_1[8 * a2]
    && *(void *)&aSourcefiforrep_1[8 * a1 + 16] == *(void *)&aSourcefiforrep_1[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5E8E78(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x7065526873617263;
  }
  else {
    uint64_t v3 = 0x696D697263736964;
  }
  if (v2) {
    unint64_t v4 = 0xEC000000746E616ELL;
  }
  else {
    unint64_t v4 = 0xEB0000000074726FLL;
  }
  if (a2) {
    uint64_t v5 = 0x7065526873617263;
  }
  else {
    uint64_t v5 = 0x696D697263736964;
  }
  if (a2) {
    unint64_t v6 = 0xEB0000000074726FLL;
  }
  else {
    unint64_t v6 = 0xEC000000746E616ELL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E8F2C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD00000000000001DLL;
  }
  else {
    unint64_t v3 = 0xD000000000000011;
  }
  if (v2) {
    unint64_t v4 = 0x800000025A636120;
  }
  else {
    unint64_t v4 = 0x800000025A636140;
  }
  if (a2) {
    unint64_t v5 = 0xD00000000000001DLL;
  }
  else {
    unint64_t v5 = 0xD000000000000011;
  }
  if (a2) {
    unint64_t v6 = 0x800000025A636140;
  }
  else {
    unint64_t v6 = 0x800000025A636120;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E8FD8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x736544746E656761;
  }
  else {
    uint64_t v3 = 0x656449746E656761;
  }
  if (v2) {
    unint64_t v4 = 0xEF7265696669746ELL;
  }
  else {
    unint64_t v4 = 0xEF726F7470697263;
  }
  if (a2) {
    uint64_t v5 = 0x736544746E656761;
  }
  else {
    uint64_t v5 = 0x656449746E656761;
  }
  if (a2) {
    unint64_t v6 = 0xEF726F7470697263;
  }
  else {
    unint64_t v6 = 0xEF7265696669746ELL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E9094(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x7265696669646F6DLL;
    }
    else {
      unint64_t v3 = 0xD000000000000011;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE900000000000073;
    }
    else {
      unint64_t v4 = 0x800000025A635000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0x7265696669646F6DLL;
      }
      else {
        unint64_t v6 = 0xD000000000000011;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE900000000000073;
      }
      else {
        unint64_t v7 = 0x800000025A635000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v3 = 0x546C6F72746E6F63;
    unint64_t v4 = 0xEB00000000657079;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xEB00000000657079;
  if (v3 != 0x546C6F72746E6F63)
  {
LABEL_21:
    char v8 = sub_25A6233B0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25A5E91BC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x72756769666E6F63;
  }
  else {
    uint64_t v3 = 0x696D697263736964;
  }
  if (v2) {
    unint64_t v4 = 0xEC000000746E616ELL;
  }
  else {
    unint64_t v4 = 0xED00006E6F697461;
  }
  if (a2) {
    uint64_t v5 = 0x72756769666E6F63;
  }
  else {
    uint64_t v5 = 0x696D697263736964;
  }
  if (a2) {
    unint64_t v6 = 0xED00006E6F697461;
  }
  else {
    unint64_t v6 = 0xEC000000746E616ELL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E9274(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x756853776F6C6C61;
  }
  else {
    uint64_t v3 = 0x73706F7473;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xEC000000656C6666;
  }
  if (a2) {
    uint64_t v5 = 0x756853776F6C6C61;
  }
  else {
    uint64_t v5 = 0x73706F7473;
  }
  if (a2) {
    unint64_t v6 = 0xEC000000656C6666;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E931C(char a1, char a2)
{
  if (qword_25A6317F0[a1] == qword_25A6317F0[a2] && qword_25A631808[a1] == qword_25A631808[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5E93A4(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x656C746974;
    }
    else {
      unint64_t v3 = 0xD000000000000019;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE500000000000000;
    }
    else {
      unint64_t v4 = 0x800000025A6350D0;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0x656C746974;
      }
      else {
        unint64_t v6 = 0xD000000000000019;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE500000000000000;
      }
      else {
        unint64_t v7 = 0x800000025A6350D0;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v3 = 0x6C6F626D79536673;
    unint64_t v4 = 0xEC000000656D614ELL;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xEC000000656D614ELL;
  if (v3 != 0x6C6F626D79536673)
  {
LABEL_21:
    char v8 = sub_25A6233B0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25A5E94BC(char a1, char a2)
{
  if (*(void *)&aTitle_5[8 * a1] == *(void *)&aTitle_5[8 * a2]
    && *(void *)&aFirstitemoreit_1[8 * a1 + 16] == *(void *)&aFirstitemoreit_1[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5E9544(char a1, char a2)
{
  if (*(void *)&aTimelinetoggle_1[8 * a1] == *(void *)&aTimelinetoggle_1[8 * a2]
    && *(void *)&aDisabled_3[8 * a1 + 8] == *(void *)&aDisabled_3[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5E95CC(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 1701734764;
  }
  else {
    uint64_t v2 = 1701603686;
  }
  if (a2) {
    uint64_t v3 = 1701734764;
  }
  else {
    uint64_t v3 = 1701603686;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_25A5E963C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0x61507265646E6572;
  }
  else {
    unint64_t v3 = 0xD000000000000010;
  }
  if (v2) {
    unint64_t v4 = 0x800000025A635550;
  }
  else {
    unint64_t v4 = 0xED000064616F6C79;
  }
  if (a2) {
    unint64_t v5 = 0x61507265646E6572;
  }
  else {
    unint64_t v5 = 0xD000000000000010;
  }
  if (a2) {
    unint64_t v6 = 0xED000064616F6C79;
  }
  else {
    unint64_t v6 = 0x800000025A635550;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E96F4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x800000025A635910;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x5379616C70736964;
      unint64_t v3 = 0xEB00000000657A69;
      break;
    case 2:
      unint64_t v5 = 0x5379616C70736964;
      unint64_t v3 = 0xEC000000656C6163;
      break;
    case 3:
      unint64_t v5 = 0xD000000000000011;
      unint64_t v6 = "deviceEnvironment";
      goto LABEL_6;
    case 4:
      unint64_t v5 = 0xD000000000000013;
      unint64_t v6 = "frameBufferMaskPath";
LABEL_6:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x800000025A635910;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x5379616C70736964;
      unint64_t v7 = 0xEB00000000657A69;
      break;
    case 2:
      unint64_t v2 = 0x5379616C70736964;
      unint64_t v7 = 0xEC000000656C6163;
      break;
    case 3:
      unint64_t v2 = 0xD000000000000011;
      char v8 = "deviceEnvironment";
      goto LABEL_12;
    case 4:
      unint64_t v2 = 0xD000000000000013;
      char v8 = "frameBufferMaskPath";
LABEL_12:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_25A5E98B8(char a1, char a2)
{
  if (qword_25A6318A0[a1] == qword_25A6318A0[a2] && qword_25A6318B8[a1] == qword_25A6318B8[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5E9944(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0x736172437478656ELL;
  }
  else {
    unint64_t v3 = 0xD000000000000016;
  }
  if (v2) {
    unint64_t v4 = 0x800000025A635260;
  }
  else {
    unint64_t v4 = 0xEF74726F70655268;
  }
  if (a2) {
    unint64_t v5 = 0x736172437478656ELL;
  }
  else {
    unint64_t v5 = 0xD000000000000016;
  }
  if (a2) {
    unint64_t v6 = 0xEF74726F70655268;
  }
  else {
    unint64_t v6 = 0x800000025A635260;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E99FC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1131045487;
  }
  else {
    uint64_t v3 = 0x64616F4C6C6C61;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1131045487;
  }
  else {
    uint64_t v5 = 0x64616F4C6C6C61;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E9A98(char a1, char a2)
{
  if (*(void *)&aName_6[8 * a1] == *(void *)&aName_6[8 * a2]
    && *(void *)&aMinversisdkver_1[8 * a1 + 16] == *(void *)&aMinversisdkver_1[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5E9B20(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6966657250657261;
  }
  else {
    uint64_t v3 = 0x4449656C646E7562;
  }
  if (v2) {
    unint64_t v4 = 0xE900000000000073;
  }
  else {
    unint64_t v4 = 0xEB00000000736578;
  }
  if (a2) {
    uint64_t v5 = 0x6966657250657261;
  }
  else {
    uint64_t v5 = 0x4449656C646E7562;
  }
  if (a2) {
    unint64_t v6 = 0xEB00000000736578;
  }
  else {
    unint64_t v6 = 0xE900000000000073;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5E9BD0(char a1, char a2)
{
  if (*(void *)&aDiscrimiprovid_1[8 * a1] == *(void *)&aDiscrimiprovid_1[8 * a2]
    && *(void *)&aDiscrimiprovid_1[8 * a1 + 40] == *(void *)&aDiscrimiprovid_1[8 * a2 + 40])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5E9C58(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x7972747369676572;
  }
  else {
    uint64_t v2 = 0x72656469766F7270;
  }
  if (a2) {
    uint64_t v3 = 0x7972747369676572;
  }
  else {
    uint64_t v3 = 0x72656469766F7270;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_25A5E9CFC(char a1, char a2)
{
  if (*(void *)&aApplicatwidget_0[8 * a1] == *(void *)&aApplicatwidget_0[8 * a2]
    && *(void *)&aComplicaion_0[8 * a1 + 8] == *(void *)&aComplicaion_0[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5E9D84(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000016;
  unint64_t v4 = 0x800000025A635F60;
  switch(a1)
  {
    case 1:
      break;
    case 2:
      unint64_t v4 = 0x800000025A635F80;
      unint64_t v3 = 0xD000000000000015;
      break;
    case 3:
      unint64_t v3 = 0xD000000000000017;
      unint64_t v4 = 0x800000025A635FA0;
      break;
    default:
      unint64_t v4 = 0xE200000000000000;
      unint64_t v3 = 25705;
      break;
  }
  unint64_t v5 = 0xD000000000000016;
  unint64_t v6 = 0x800000025A635F60;
  switch(a2)
  {
    case 1:
      goto LABEL_9;
    case 2:
      unint64_t v6 = 0x800000025A635F80;
      unint64_t v5 = 0xD000000000000015;
LABEL_9:
      if (v3 != v5) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0x800000025A635FA0;
      if (v3 == 0xD000000000000017) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
      unint64_t v6 = 0xE200000000000000;
      if (v3 != 25705) {
        goto LABEL_14;
      }
LABEL_12:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5E9F04(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000016;
  unint64_t v3 = 0x800000025A635B10;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000016;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEA00000000007070;
      unint64_t v5 = 0x416C6C6174736E69;
      break;
    case 2:
      unint64_t v3 = 0xED0000737070416CLL;
      unint64_t v5 = 0x6C6174736E696E75;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x4C525579706F63;
      break;
    case 4:
      break;
    case 5:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x7070417465736572;
      break;
    default:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6D726177657270;
      break;
  }
  unint64_t v6 = 0x800000025A635B10;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEA00000000007070;
      if (v5 == 0x416C6C6174736E69) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v6 = 0xED0000737070416CLL;
      if (v5 != 0x6C6174736E696E75) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      unint64_t v2 = 0x4C525579706F63;
      goto LABEL_15;
    case 4:
LABEL_15:
      if (v5 == v2) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x7070417465736572) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x6D726177657270) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5EA128(char a1, char a2)
{
  unint64_t v3 = 0xD00000000000001ALL;
  unint64_t v4 = 0x800000025A6351B0;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0x7250636974617473;
      unint64_t v4 = 0xEE0073746375646FLL;
      break;
    case 2:
      break;
    case 3:
      unint64_t v4 = 0xE700000000000000;
      unint64_t v3 = 0x73657461647075;
      break;
    case 4:
      unint64_t v4 = 0x800000025A6351E0;
      unint64_t v3 = 0xD000000000000011;
      break;
    default:
      unint64_t v4 = 0xE800000000000000;
      unint64_t v3 = 0x73746375646F7270;
      break;
  }
  unint64_t v5 = 0xD00000000000001ALL;
  unint64_t v6 = 0x800000025A6351B0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEE0073746375646FLL;
      if (v3 == 0x7250636974617473) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      unint64_t v5 = 0x73657461647075;
LABEL_12:
      if (v3 == v5) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 4:
      unint64_t v6 = 0x800000025A6351E0;
      if (v3 != 0xD000000000000011) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
      unint64_t v6 = 0xE800000000000000;
      if (v3 != 0x73746375646F7270) {
        goto LABEL_16;
      }
LABEL_13:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5EA314(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000013;
  unint64_t v3 = 0x800000025A635D60;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000013;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v3 = 0xED00007365746174;
      unint64_t v5 = 0x536C6F72746E6F63;
      break;
    case 3:
      unint64_t v3 = 0xEE0064616F6C7961;
      unint64_t v5 = 0x50746E65746E6F63;
      break;
    default:
      unint64_t v3 = 0xEA00000000006570;
      unint64_t v5 = 0x7954656D6F726863;
      break;
  }
  unint64_t v6 = 0x800000025A635D60;
  switch(a2)
  {
    case 1:
      goto LABEL_9;
    case 2:
      unint64_t v6 = 0xED00007365746174;
      unint64_t v2 = 0x536C6F72746E6F63;
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xEE0064616F6C7961;
      if (v5 == 0x50746E65746E6F63) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
      unint64_t v6 = 0xEA00000000006570;
      if (v5 != 0x7954656D6F726863) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5EA4D4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000025A6361A0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x7065526873617263;
      unint64_t v3 = 0xEB0000000074726FLL;
      break;
    case 2:
      unint64_t v3 = 0xE300000000000000;
      unint64_t v5 = 6580592;
      break;
    case 3:
      unint64_t v5 = 0x686542746E656761;
      unint64_t v3 = 0xED0000726F697661;
      break;
    case 4:
      break;
    default:
      unint64_t v5 = 0x696D697263736964;
      unint64_t v3 = 0xEC000000746E616ELL;
      break;
  }
  unint64_t v6 = 0x800000025A6361A0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEB0000000074726FLL;
      if (v5 == 0x7065526873617263) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE300000000000000;
      unint64_t v2 = 6580592;
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xED0000726F697661;
      if (v5 != 0x686542746E656761) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 4:
LABEL_12:
      if (v5 == v2) {
        goto LABEL_13;
      }
      goto LABEL_16;
    default:
      unint64_t v6 = 0xEC000000746E616ELL;
      if (v5 != 0x696D697263736964) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5EA6C4(char a1, char a2)
{
  if (*(void *)&aWillprovcansym_0[8 * a1] == *(void *)&aWillprovcansym_0[8 * a2]
    && *(void *)&aWillprovcansym_0[8 * a1 + 24] == *(void *)&aWillprovcansym_0[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5EA74C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000017;
  }
  else {
    unint64_t v3 = 0x617243746E656761;
  }
  if (v2) {
    unint64_t v4 = 0xEC00000064656873;
  }
  else {
    unint64_t v4 = 0x800000025A636170;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000017;
  }
  else {
    unint64_t v5 = 0x617243746E656761;
  }
  if (a2) {
    unint64_t v6 = 0x800000025A636170;
  }
  else {
    unint64_t v6 = 0xEC00000064656873;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EA7FC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000014;
  }
  else {
    unint64_t v3 = 0x66457265646E6572;
  }
  if (v2) {
    unint64_t v4 = 0xED00007374636566;
  }
  else {
    unint64_t v4 = 0x800000025A6354D0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000014;
  }
  else {
    unint64_t v5 = 0x66457265646E6572;
  }
  if (a2) {
    unint64_t v6 = 0x800000025A6354D0;
  }
  else {
    unint64_t v6 = 0xED00007374636566;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EA8B0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000025A6351E0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEE0073746375646FLL;
      unint64_t v5 = 0x7250636974617473;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x73657461647075;
      break;
    case 3:
      break;
    case 4:
      unint64_t v3 = 0xEC000000656D614ELL;
      unint64_t v5 = 0x72656469766F7270;
      break;
    case 5:
      unint64_t v3 = 0xE200000000000000;
      unint64_t v5 = 25705;
      break;
    case 6:
      unint64_t v3 = 0xED00007374636566;
      unint64_t v5 = 0x66457265646E6572;
      break;
    default:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x73746375646F7270;
      break;
  }
  unint64_t v6 = 0x800000025A6351E0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEE0073746375646FLL;
      if (v5 == 0x7250636974617473) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x73657461647075) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      goto LABEL_18;
    case 4:
      unint64_t v6 = 0xEC000000656D614ELL;
      if (v5 != 0x72656469766F7270) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0xE200000000000000;
      unint64_t v2 = 25705;
LABEL_18:
      if (v5 == v2) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0xED00007374636566;
      if (v5 != 0x66457265646E6572) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x73746375646F7270) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5EAB1C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000013;
  unint64_t v3 = 0x800000025A635D60;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000013;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEB0000000074756FLL;
      unint64_t v5 = 0x79614C656E656373;
      break;
    case 2:
      break;
    case 3:
      unint64_t v3 = 0xED00007365746174;
      unint64_t v5 = 0x536C6F72746E6F63;
      break;
    case 4:
      unint64_t v3 = 0xEE0064616F6C7961;
      unint64_t v5 = 0x50746E65746E6F63;
      break;
    case 5:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x44496E6565726373;
      break;
    default:
      unint64_t v3 = 0xEC00000079746974;
      unint64_t v5 = 0x6E65644974736F68;
      break;
  }
  unint64_t v6 = 0x800000025A635D60;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEB0000000074756FLL;
      if (v5 == 0x79614C656E656373) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      goto LABEL_15;
    case 3:
      unint64_t v6 = 0xED00007365746174;
      if (v5 != 0x536C6F72746E6F63) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      unint64_t v6 = 0xEE0064616F6C7961;
      unint64_t v2 = 0x50746E65746E6F63;
LABEL_15:
      if (v5 == v2) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x44496E6565726373) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
      unint64_t v6 = 0xEC00000079746974;
      if (v5 != 0x6E65644974736F68) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5EAD70(char a1, char a2)
{
  if (*(void *)&aEvent_5[8 * a1] == *(void *)&aEvent_5[8 * a2]
    && *(void *)&aControlistateb_1[8 * a1 + 16] == *(void *)&aControlistateb_1[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5EADF8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x615272656E726F63;
  }
  else {
    uint64_t v3 = 1702521203;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xEC00000073756964;
  }
  if (a2) {
    uint64_t v5 = 0x615272656E726F63;
  }
  else {
    uint64_t v5 = 1702521203;
  }
  if (a2) {
    unint64_t v6 = 0xEC00000073756964;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EAE9C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x64616F6C796170;
  }
  else {
    uint64_t v3 = 0x696D697263736964;
  }
  if (v2) {
    unint64_t v4 = 0xEC000000746E616ELL;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x64616F6C796170;
  }
  else {
    uint64_t v5 = 0x696D697263736964;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xEC000000746E616ELL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EAF48(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x4E737365636F7270;
  }
  else {
    uint64_t v3 = 6580592;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xEB00000000656D61;
  }
  if (a2) {
    uint64_t v5 = 0x4E737365636F7270;
  }
  else {
    uint64_t v5 = 6580592;
  }
  if (a2) {
    unint64_t v6 = 0xEB00000000656D61;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EAFEC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0x6F6C657665447369;
  }
  else {
    unint64_t v3 = 0xD000000000000014;
  }
  if (v2) {
    unint64_t v4 = 0x800000025A635B30;
  }
  else {
    unint64_t v4 = 0xED0000746E656D70;
  }
  if (a2) {
    unint64_t v5 = 0x6F6C657665447369;
  }
  else {
    unint64_t v5 = 0xD000000000000014;
  }
  if (a2) {
    unint64_t v6 = 0xED0000746E656D70;
  }
  else {
    unint64_t v6 = 0x800000025A635B30;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EB0A4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x800000025A635380;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v5 = 0x6874646977;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x746867696568;
      break;
    case 3:
      unint64_t v3 = 0xEB00000000776F52;
      unint64_t v5 = 0x7265507365747962;
      break;
    case 4:
      unint64_t v3 = 0xE900000000000072;
      unint64_t v5 = 0x6564724F65747962;
      break;
    case 5:
      unint64_t v5 = 0x6E4970616D746962;
      unint64_t v3 = 0xEA00000000006F66;
      break;
    case 6:
      break;
    case 7:
      unint64_t v3 = 0xEC0000006C657869;
      unint64_t v5 = 0x5072655073746962;
      break;
    case 8:
      unint64_t v3 = 0xEA00000000006563;
      unint64_t v5 = 0x617053726F6C6F63;
      break;
    default:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1635017060;
      break;
  }
  unint64_t v6 = 0x800000025A635380;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      if (v5 == 0x6874646977) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x746867696568) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 3:
      unint64_t v6 = 0xEB00000000776F52;
      if (v5 != 0x7265507365747962) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 4:
      unint64_t v6 = 0xE900000000000072;
      if (v5 != 0x6564724F65747962) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 5:
      unint64_t v6 = 0xEA00000000006F66;
      if (v5 != 0x6E4970616D746962) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 6:
      goto LABEL_24;
    case 7:
      unint64_t v6 = 0xEC0000006C657869;
      unint64_t v2 = 0x5072655073746962;
LABEL_24:
      if (v5 == v2) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 8:
      unint64_t v6 = 0xEA00000000006563;
      if (v5 != 0x617053726F6C6F63) {
        goto LABEL_28;
      }
      goto LABEL_25;
    default:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1635017060) {
        goto LABEL_28;
      }
LABEL_25:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_28:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5EB388(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 1952671090;
    }
    else {
      unint64_t v3 = 0xD00000000000001ELL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE400000000000000;
    }
    else {
      unint64_t v4 = 0x800000025A6353B0;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 1952671090;
      }
      else {
        unint64_t v6 = 0xD00000000000001ELL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE400000000000000;
      }
      else {
        unint64_t v7 = 0x800000025A6353B0;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    unint64_t v3 = 1752457584;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1752457584)
  {
LABEL_21:
    char v8 = sub_25A6233B0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25A5EB478(char a1, char a2)
{
  if (*(void *)&aPreviewsrunnin_2[8 * a1] == *(void *)&aPreviewsrunnin_2[8 * a2]
    && *(void *)&aPreviewsrunnin_2[8 * a1 + 24] == *(void *)&aPreviewsrunnin_2[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5EB500(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x74756F656D6974;
  }
  else {
    uint64_t v2 = 0x737365636F7270;
  }
  if (a2) {
    uint64_t v3 = 0x74756F656D6974;
  }
  else {
    uint64_t v3 = 0x737365636F7270;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_25A5EB580(char a1, char a2)
{
  if (*(void *)&aContextiscalef_0[8 * a1] == *(void *)&aContextiscalef_0[8 * a2]
    && *(void *)&aD_0[8 * a1] == *(void *)&aD_0[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5EB608(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000025A635CC0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x636146656C616373;
      unint64_t v3 = 0xEB00000000726F74;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v5 = 0x6874646977;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x746867696568;
      break;
    case 4:
      break;
    default:
      unint64_t v5 = 0x4965636166727573;
      unint64_t v3 = 0xE900000000000044;
      break;
  }
  unint64_t v6 = 0x800000025A635CC0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEB00000000726F74;
      if (v5 == 0x636146656C616373) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      unint64_t v2 = 0x6874646977;
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x746867696568) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 4:
LABEL_12:
      if (v5 == v2) {
        goto LABEL_13;
      }
      goto LABEL_16;
    default:
      unint64_t v6 = 0xE900000000000044;
      if (v5 != 0x4965636166727573) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5EB7D8(char a1, char a2)
{
  if (*(void *)&aBundle_8[8 * a1] == *(void *)&aBundle_8[8 * a2]
    && *(void *)&aFunctionfuncti_1[8 * a1 + 24] == *(void *)&aFunctionfuncti_1[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5EB860(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x800000025A635BC0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD00000000000001BLL;
      unint64_t v6 = "incrementalPreviewInstances";
      goto LABEL_11;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x7265646E6572;
      break;
    case 3:
      unint64_t v5 = 0xD000000000000011;
      unint64_t v6 = "incrementalRender";
      goto LABEL_11;
    case 4:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x79616C70736964;
      break;
    case 5:
      unint64_t v5 = 0xD000000000000012;
      unint64_t v6 = "incrementalDisplay";
      goto LABEL_11;
    case 6:
      unint64_t v5 = 0x736F48726579616CLL;
      unint64_t v3 = 0xE900000000000074;
      break;
    case 7:
      unint64_t v5 = 0xD000000000000014;
      unint64_t v6 = "incrementalLayerHost";
      goto LABEL_11;
    case 8:
      unint64_t v6 = "captureIOSurface";
      goto LABEL_11;
    case 9:
      unint64_t v5 = 0xD00000000000001BLL;
      unint64_t v6 = "incrementalCaptureIOSurface";
LABEL_11:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x800000025A635BC0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD00000000000001BLL;
      char v8 = "incrementalPreviewInstances";
      goto LABEL_22;
    case 2:
      unint64_t v7 = 0xE600000000000000;
      unint64_t v2 = 0x7265646E6572;
      break;
    case 3:
      unint64_t v2 = 0xD000000000000011;
      char v8 = "incrementalRender";
      goto LABEL_22;
    case 4:
      unint64_t v7 = 0xE700000000000000;
      unint64_t v2 = 0x79616C70736964;
      break;
    case 5:
      unint64_t v2 = 0xD000000000000012;
      char v8 = "incrementalDisplay";
      goto LABEL_22;
    case 6:
      unint64_t v2 = 0x736F48726579616CLL;
      unint64_t v7 = 0xE900000000000074;
      break;
    case 7:
      unint64_t v2 = 0xD000000000000014;
      char v8 = "incrementalLayerHost";
      goto LABEL_22;
    case 8:
      char v8 = "captureIOSurface";
      goto LABEL_22;
    case 9:
      unint64_t v2 = 0xD00000000000001BLL;
      char v8 = "incrementalCaptureIOSurface";
LABEL_22:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_25A5EBAD4(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0xD000000000000015;
    }
    else {
      unint64_t v3 = 0xD000000000000010;
    }
    if (v2 == 1) {
      unint64_t v4 = 0x800000025A635B80;
    }
    else {
      unint64_t v4 = 0x800000025A635BA0;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0xD000000000000015;
      }
      else {
        unint64_t v6 = 0xD000000000000010;
      }
      if (v5 == 1) {
        unint64_t v7 = 0x800000025A635B80;
      }
      else {
        unint64_t v7 = 0x800000025A635BA0;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v3 = 0x656449746E656761;
    unint64_t v4 = 0xEF7265696669746ELL;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xEF7265696669746ELL;
  if (v3 != 0x656449746E656761)
  {
LABEL_21:
    char v8 = sub_25A6233B0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25A5EBBF8(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x6E6F697461636F6CLL;
  }
  else {
    uint64_t v2 = 0x4449656C62617473;
  }
  if (a2) {
    uint64_t v3 = 0x6E6F697461636F6CLL;
  }
  else {
    uint64_t v3 = 0x4449656C62617473;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_25A5EBC78(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x800000025A635E90;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEF79726F67657461;
      unint64_t v5 = 0x43746E65746E6F63;
      break;
    case 2:
      break;
    case 3:
      unint64_t v5 = 0xD000000000000013;
      unint64_t v3 = 0x800000025A635EB0;
      break;
    case 4:
      unint64_t v3 = 0xEF73746961725464;
      unint64_t v5 = 0x6574736575716572;
      break;
    case 5:
      unint64_t v3 = 0xEE0070756F724777;
      unint64_t v5 = 0x6569766572507369;
      break;
    case 6:
      unint64_t v3 = 0xEB00000000656D61;
      unint64_t v5 = 0x4E79616C70736964;
      break;
    default:
      unint64_t v3 = 0xED00006E69616D6FLL;
      unint64_t v5 = 0x44746E65746E6F63;
      break;
  }
  unint64_t v6 = 0x800000025A635E90;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEF79726F67657461;
      if (v5 == 0x43746E65746E6F63) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      goto LABEL_18;
    case 3:
      unint64_t v6 = 0x800000025A635EB0;
      if (v5 != 0xD000000000000013) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      unint64_t v6 = 0xEF73746961725464;
      if (v5 != 0x6574736575716572) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0xEE0070756F724777;
      unint64_t v2 = 0x6569766572507369;
LABEL_18:
      if (v5 == v2) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0xEB00000000656D61;
      if (v5 != 0x4E79616C70736964) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
      unint64_t v6 = 0xED00006E69616D6FLL;
      if (v5 != 0x44746E65746E6F63) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5EBF2C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000014;
  }
  else {
    unint64_t v3 = 0xD000000000000012;
  }
  if (v2) {
    unint64_t v4 = 0x800000025A635A30;
  }
  else {
    unint64_t v4 = 0x800000025A635A50;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000014;
  }
  else {
    unint64_t v5 = 0xD000000000000012;
  }
  if (a2) {
    unint64_t v6 = 0x800000025A635A50;
  }
  else {
    unint64_t v6 = 0x800000025A635A30;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EBFD8(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000025A635130;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0x6164705574736F68;
    }
    else {
      unint64_t v5 = 0xD000000000000012;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xEE00646565536574;
    }
    else {
      unint64_t v6 = 0x800000025A6360B0;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000011;
  unint64_t v6 = 0x800000025A635130;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0x6164705574736F68;
    }
    else {
      unint64_t v2 = 0xD000000000000012;
    }
    if (v7 == 1) {
      unint64_t v3 = 0xEE00646565536574;
    }
    else {
      unint64_t v3 = 0x800000025A6360B0;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25A5EC0F0(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x646950746E656761;
  }
  else {
    uint64_t v2 = 0x44496D6165727473;
  }
  if (a2) {
    uint64_t v3 = 0x646950746E656761;
  }
  else {
    uint64_t v3 = 0x44496D6165727473;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_25A5EC170(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x800000025A636100;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v5 = 0xD000000000000011;
      unint64_t v6 = "contentIdentifier";
      goto LABEL_6;
    case 3:
      unint64_t v5 = 0x6164705574736F68;
      unint64_t v3 = 0xEE00646565536574;
      break;
    case 4:
      unint64_t v6 = "instanceIdentifier";
LABEL_6:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v5 = 0x696D697263736964;
      unint64_t v3 = 0xEC000000746E616ELL;
      break;
  }
  unint64_t v7 = 0x800000025A636100;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      unint64_t v2 = 0xD000000000000011;
      char v8 = "contentIdentifier";
      goto LABEL_12;
    case 3:
      unint64_t v2 = 0x6164705574736F68;
      unint64_t v7 = 0xEE00646565536574;
      break;
    case 4:
      char v8 = "instanceIdentifier";
LABEL_12:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v2 = 0x696D697263736964;
      unint64_t v7 = 0xEC000000746E616ELL;
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_25A5EC334(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x657461647075;
  }
  else {
    uint64_t v3 = 0x746E656761;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x657461647075;
  }
  else {
    uint64_t v5 = 0x746E656761;
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
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EC3D0(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0xD000000000000010;
    }
    else {
      unint64_t v3 = 0x6150656C646E7562;
    }
    if (v2 == 1) {
      unint64_t v4 = 0x800000025A635500;
    }
    else {
      unint64_t v4 = 0xEA00000000006874;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0xD000000000000010;
      }
      else {
        unint64_t v6 = 0x6150656C646E7562;
      }
      if (v5 == 1) {
        unint64_t v7 = 0x800000025A635500;
      }
      else {
        unint64_t v7 = 0xEA00000000006874;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xEC000000746E616ELL;
    unint64_t v3 = 0x696D697263736964;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xEC000000746E616ELL;
  if (v3 != 0x696D697263736964)
  {
LABEL_21:
    char v8 = sub_25A6233B0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25A5EC4F4(char a1, char a2)
{
  if (*(void *)&aMain_5[8 * a1] == *(void *)&aMain_5[8 * a2] && qword_25A631A38[a1] == qword_25A631A38[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5EC57C(char a1, char a2)
{
  if (*(void *)&aBundleidpath_1[8 * a1] == *(void *)&aBundleidpath_1[8 * a2]
    && *(void *)&aDiscrimi_1[8 * a1 + 8] == *(void *)&aDiscrimi_1[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5EC604(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x42646E4168746170;
  }
  else {
    uint64_t v3 = 0x4449656C646E7562;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xEF4449656C646E75;
  }
  if (a2) {
    uint64_t v5 = 0x42646E4168746170;
  }
  else {
    uint64_t v5 = 0x4449656C646E7562;
  }
  if (a2) {
    unint64_t v6 = 0xEF4449656C646E75;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EC6B4(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0x656C646E7562;
  }
  else {
    unint64_t v3 = 0xD000000000000012;
  }
  if (v2) {
    unint64_t v4 = 0x800000025A6357C0;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    unint64_t v5 = 0x656C646E7562;
  }
  else {
    unint64_t v5 = 0xD000000000000012;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0x800000025A6357C0;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EC75C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x64616F6C796170;
  }
  else {
    uint64_t v3 = 0x546567617373656DLL;
  }
  if (v2) {
    unint64_t v4 = 0xEB00000000657079;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x64616F6C796170;
  }
  else {
    uint64_t v5 = 0x546567617373656DLL;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xEB00000000657079;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EC808(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD00000000000001CLL;
  unint64_t v3 = 0x800000025A636060;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD00000000000001CLL;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEB00000000656D61;
      unint64_t v5 = 0x4E79616C70736964;
      break;
    case 2:
      unint64_t v3 = 0xED00007374636566;
      goto LABEL_6;
    case 3:
      break;
    case 4:
      unint64_t v3 = 0xEC00000074636566;
LABEL_6:
      unint64_t v5 = 0x66457265646E6572;
      break;
    default:
      unint64_t v3 = 0xE200000000000000;
      unint64_t v5 = 25705;
      break;
  }
  unint64_t v6 = 0x800000025A636060;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEB00000000656D61;
      unint64_t v2 = 0x4E79616C70736964;
      break;
    case 2:
      unint64_t v6 = 0xED00007374636566;
      goto LABEL_12;
    case 3:
      break;
    case 4:
      unint64_t v6 = 0xEC00000074636566;
LABEL_12:
      unint64_t v2 = 0x66457265646E6572;
      break;
    default:
      unint64_t v6 = 0xE200000000000000;
      unint64_t v2 = 25705;
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EC9B8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0x66457265646E6572;
  }
  else {
    unint64_t v3 = 0xD000000000000014;
  }
  if (v2) {
    unint64_t v4 = 0x800000025A635480;
  }
  else {
    unint64_t v4 = 0xED00007374636566;
  }
  if (a2) {
    unint64_t v5 = 0x66457265646E6572;
  }
  else {
    unint64_t v5 = 0xD000000000000014;
  }
  if (a2) {
    unint64_t v6 = 0xED00007374636566;
  }
  else {
    unint64_t v6 = 0x800000025A635480;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5ECA70(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6567616B6E696CLL;
  }
  else {
    uint64_t v3 = 1752457584;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6567616B6E696CLL;
  }
  else {
    uint64_t v5 = 1752457584;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5ECB0C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x646E616D6D6F63;
  }
  else {
    uint64_t v3 = 0x696D697263736964;
  }
  if (v2) {
    unint64_t v4 = 0xEC000000746E616ELL;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x646E616D6D6F63;
  }
  else {
    uint64_t v5 = 0x696D697263736964;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xEC000000746E616ELL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5ECBB8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x800000025A635990;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xEE0064616F6C7961;
      unint64_t v5 = 0x506567617373656DLL;
      break;
    case 2:
      unint64_t v3 = 0xE300000000000000;
      unint64_t v5 = 6580592;
      break;
    case 3:
      break;
    case 4:
      unint64_t v5 = 0xD00000000000001BLL;
      unint64_t v3 = 0x800000025A6359B0;
      break;
    case 5:
      unint64_t v3 = 0xEF7265696669746ELL;
      unint64_t v5 = 0x656449656E656373;
      break;
    default:
      unint64_t v3 = 0xEB00000000657079;
      unint64_t v5 = 0x546567617373656DLL;
      break;
  }
  unint64_t v6 = 0x800000025A635990;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEE0064616F6C7961;
      if (v5 == 0x506567617373656DLL) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v6 = 0xE300000000000000;
      if (v5 != 6580592) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      goto LABEL_15;
    case 4:
      unint64_t v2 = 0xD00000000000001BLL;
      unint64_t v6 = 0x800000025A6359B0;
LABEL_15:
      if (v5 == v2) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0xEF7265696669746ELL;
      if (v5 != 0x656449656E656373) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
      unint64_t v6 = 0xEB00000000657079;
      if (v5 != 0x546567617373656DLL) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5ECDEC(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000014;
  unint64_t v3 = 0x800000025A635B30;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000014;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x736544746E656761;
      unint64_t v3 = 0xEF726F7470697263;
      break;
    case 2:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x656D616E656C6966;
      break;
    case 3:
      break;
    default:
      unint64_t v5 = 0x656449746E656761;
      unint64_t v3 = 0xEF7265696669746ELL;
      break;
  }
  unint64_t v6 = 0x800000025A635B30;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x736544746E656761;
      unint64_t v6 = 0xEF726F7470697263;
      goto LABEL_9;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x656D616E656C6966) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 3:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    default:
      unint64_t v6 = 0xEF7265696669746ELL;
      if (v5 != 0x656449746E656761) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5ECFA8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000025A635D90;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v6 = "selectableRegions";
      goto LABEL_4;
    case 2:
      unint64_t v5 = 0xD000000000000014;
      unint64_t v6 = "snapshotCornerRadius";
LABEL_4:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    case 3:
      unint64_t v3 = 0xEB00000000726F74;
      unint64_t v5 = 0x636146656C616373;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x800000025A635D90;
  switch(a2)
  {
    case 1:
      char v8 = "selectableRegions";
      goto LABEL_9;
    case 2:
      unint64_t v2 = 0xD000000000000014;
      char v8 = "snapshotCornerRadius";
LABEL_9:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      goto LABEL_10;
    case 3:
      unint64_t v7 = 0xEB00000000726F74;
      if (v5 == 0x636146656C616373) {
        goto LABEL_13;
      }
      goto LABEL_15;
    default:
LABEL_10:
      if (v5 != v2) {
        goto LABEL_15;
      }
LABEL_13:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_15:
      }
        char v9 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_25A5ED120(uint64_t a1, uint64_t a2)
{
  if (*(void *)&aKind_1[8 * (char)a1] == *(void *)&aKind_1[8 * (char)a2] && a1 << 56 == a2 << 56) {
    char v3 = 1;
  }
  else {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5ED1B0(char a1, char a2)
{
  if (*(void *)&aDevice_2[8 * a1] == *(void *)&aDevice_2[8 * a2] && qword_25A631C18[a1] == qword_25A631C18[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5ED238(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x7461746E6569726FLL;
  }
  else {
    uint64_t v3 = 0x74756F79616CLL;
  }
  if (v2) {
    unint64_t v4 = 0xE600000000000000;
  }
  else {
    unint64_t v4 = 0xEB000000006E6F69;
  }
  if (a2) {
    uint64_t v5 = 0x7461746E6569726FLL;
  }
  else {
    uint64_t v5 = 0x74756F79616CLL;
  }
  if (a2) {
    unint64_t v6 = 0xEB000000006E6F69;
  }
  else {
    unint64_t v6 = 0xE600000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5ED2E0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6E6567416C6C696BLL;
  }
  else {
    uint64_t v3 = 0x636170736B726F77;
  }
  if (v2) {
    unint64_t v4 = 0xEB00000000444965;
  }
  else {
    unint64_t v4 = 0xEA00000000007374;
  }
  if (a2) {
    uint64_t v5 = 0x6E6567416C6C696BLL;
  }
  else {
    uint64_t v5 = 0x636170736B726F77;
  }
  if (a2) {
    unint64_t v6 = 0xEA00000000007374;
  }
  else {
    unint64_t v6 = 0xEB00000000444965;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5ED390(char a1, char a2)
{
  if (*(void *)&aDiscrimiscreen_0[8 * a1] == *(void *)&aDiscrimiscreen_0[8 * a2]
    && *(void *)&aDiscrimiscreen_0[8 * a1 + 24] == *(void *)&aDiscrimiscreen_0[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5ED418(char a1, char a2)
{
  if (*(void *)&aMain_6[8 * a1] == *(void *)&aMain_6[8 * a2] && qword_25A631B20[a1] == qword_25A631B20[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5ED4A0(char a1, char a2)
{
  if (*(void *)&aDiscrimiorient_0[8 * a1] == *(void *)&aDiscrimiorient_0[8 * a2]
    && *(void *)&aNant_4[8 * a1] == *(void *)&aNant_4[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5ED528(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x6D6F74737563;
  }
  else {
    uint64_t v2 = 0x656369766564;
  }
  if (a2) {
    uint64_t v3 = 0x6D6F74737563;
  }
  else {
    uint64_t v3 = 0x656369766564;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_25A5ED5A0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000013;
  }
  else {
    unint64_t v3 = 0x746163696C707061;
  }
  if (v2) {
    unint64_t v4 = 0xEB000000006E6F69;
  }
  else {
    unint64_t v4 = 0x800000025A6358E0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000013;
  }
  else {
    unint64_t v5 = 0x746163696C707061;
  }
  if (a2) {
    unint64_t v6 = 0x800000025A6358E0;
  }
  else {
    unint64_t v6 = 0xEB000000006E6F69;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5ED650(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x61636F4C74736F68;
  }
  else {
    uint64_t v3 = 0x696D697263736964;
  }
  if (v2) {
    unint64_t v4 = 0xEC000000746E616ELL;
  }
  else {
    unint64_t v4 = 0xEC0000006E6F6974;
  }
  if (a2) {
    uint64_t v5 = 0x61636F4C74736F68;
  }
  else {
    uint64_t v5 = 0x696D697263736964;
  }
  if (a2) {
    unint64_t v6 = 0xEC0000006E6F6974;
  }
  else {
    unint64_t v6 = 0xEC000000746E616ELL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5ED704(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x656449656E656373;
  }
  else {
    uint64_t v3 = 0x696D697263736964;
  }
  if (v2) {
    unint64_t v4 = 0xEC000000746E616ELL;
  }
  else {
    unint64_t v4 = 0xEF7265696669746ELL;
  }
  if (a2) {
    uint64_t v5 = 0x656449656E656373;
  }
  else {
    uint64_t v5 = 0x696D697263736964;
  }
  if (a2) {
    unint64_t v6 = 0xEF7265696669746ELL;
  }
  else {
    unint64_t v6 = 0xEC000000746E616ELL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5ED7BC(char a1, char a2)
{
  if (*(void *)&aMainscensimdis_1[8 * a1] == *(void *)&aMainscensimdis_1[8 * a2]
    && *(void *)&aMainscensimdis_1[8 * a1 + 40] == *(void *)&aMainscensimdis_1[8 * a2 + 40])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5ED844(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x646574736F68;
  }
  else {
    uint64_t v2 = 0x636974617473;
  }
  if (a2) {
    uint64_t v3 = 0x646574736F68;
  }
  else {
    uint64_t v3 = 0x636974617473;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_25A5ED8BC(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000013;
  unint64_t v4 = 0x800000025A635400;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0x7972747369676572;
      unint64_t v4 = 0xEC00000065707954;
      break;
    case 2:
      break;
    case 3:
      unint64_t v4 = 0x800000025A635420;
      unint64_t v3 = 0xD000000000000011;
      break;
    default:
      unint64_t v3 = 0x6946656372756F73;
      unint64_t v4 = 0xEE0068746150656CLL;
      break;
  }
  unint64_t v5 = 0xD000000000000013;
  unint64_t v6 = 0x800000025A635400;
  switch(a2)
  {
    case 1:
      unint64_t v5 = 0x7972747369676572;
      unint64_t v6 = 0xEC00000065707954;
      goto LABEL_9;
    case 2:
LABEL_9:
      if (v3 != v5) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0x800000025A635420;
      if (v3 == 0xD000000000000011) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
      unint64_t v6 = 0xEE0068746150656CLL;
      if (v3 != 0x6946656372756F73) {
        goto LABEL_14;
      }
LABEL_12:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25A5EDA7C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6574616C756D6973;
  }
  else {
    uint64_t v3 = 0x746C7561666564;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xE900000000000064;
  }
  if (a2) {
    uint64_t v5 = 0x6574616C756D6973;
  }
  else {
    uint64_t v5 = 0x746C7561666564;
  }
  if (a2) {
    unint64_t v6 = 0xE900000000000064;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25A5EDB24(char a1, char a2)
{
  if (*(void *)&aUnspecifdevice_0[8 * a1] == *(void *)&aUnspecifdevice_0[8 * a2]
    && *(void *)&aRoundedprounde_0[8 * a1 + 16] == *(void *)&aRoundedprounde_0[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25A5EDBAC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x7974627553757063;
  }
  else {
    uint64_t v3 = 0x65707954757063;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xEA00000000006570;
  }
  if (a2) {
    uint64_t v5 = 0x7974627553757063;
  }
  else {
    uint64_t v5 = 0x65707954757063;
  }
  if (a2) {
    unint64_t v6 = 0xEA00000000006570;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t AgentMessageType.incrementalVariant.getter@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  uint64_t v4 = *v2;
  char v5 = 1;
  switch(v4)
  {
    case 1:
    case 3:
    case 5:
    case 7:
    case 9:
      MEMORY[0x270FA5388](result);
      unint64_t result = sub_25A6228F0();
      char v5 = v4;
      break;
    case 2:
      char v5 = 3;
      break;
    case 4:
      char v5 = 5;
      break;
    case 6:
      char v5 = 7;
      break;
    case 8:
      char v5 = 9;
      break;
    default:
      break;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_25A5EDD78()
{
  return 0;
}

uint64_t sub_25A5EDE18()
{
  return sub_25A5EDD78();
}

uint64_t AgentMessageType.isIncremental.getter()
{
  return (*v0 > 8u) | *v0 & 1u;
}

PreviewsMessagingOS::AgentMessageType_optional __swiftcall AgentMessageType.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  unint64_t v3 = sub_25A6232B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 10;
  if (v3 < 0xA) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

unint64_t AgentMessageType.rawValue.getter()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 2:
      unint64_t result = 0x7265646E6572;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x79616C70736964;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0x736F48726579616CLL;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25A5EDFA4(unsigned __int8 *a1, char *a2)
{
  return sub_25A5EB860(*a1, *a2);
}

uint64_t sub_25A5EDFB0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A5EDFF8()
{
  return sub_25A54B828();
}

uint64_t sub_25A5EE000()
{
  return sub_25A6234A0();
}

PreviewsMessagingOS::AgentMessageType_optional sub_25A5EE044(Swift::String *a1)
{
  return AgentMessageType.init(rawValue:)(*a1);
}

unint64_t sub_25A5EE050@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AgentMessageType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25A5EE078(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A6030D0();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A5EE0D4()
{
  return sub_25A622B20();
}

uint64_t LegacyAgentPayload.dynamicProducts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LegacyAgentPayload.staticProducts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LegacyAgentPayload.updates.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LegacyAgentPayload.loggingOutputPath.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LegacyAgentPayload.providerName.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LegacyAgentPayload.previewID.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t LegacyAgentPayload.renderEffects.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LegacyAgentPayload.init(dynamicProducts:staticProducts:updates:loggingOutputPath:providerName:previewID:renderEffects:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, uint64_t a11)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(unsigned char *)(a9 + 64) = a10 & 1;
  *(void *)(a9 + 72) = a11;
  return result;
}

unint64_t sub_25A5EE1F0(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7250636974617473;
      break;
    case 2:
      unint64_t result = 0x73657461647075;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x72656469766F7270;
      break;
    case 5:
      unint64_t result = 25705;
      break;
    case 6:
      unint64_t result = 0x66457265646E6572;
      break;
    default:
      unint64_t result = 0x73746375646F7270;
      break;
  }
  return result;
}

uint64_t sub_25A5EE2F0(unsigned __int8 *a1, char *a2)
{
  return sub_25A5EA8B0(*a1, *a2);
}

uint64_t sub_25A5EE2FC()
{
  return sub_25A61C964();
}

uint64_t sub_25A5EE308()
{
  return sub_25A54AF84();
}

uint64_t sub_25A5EE310()
{
  return sub_25A61C964();
}

uint64_t sub_25A5EE318@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A602BF8();
  *a1 = result;
  return result;
}

unint64_t sub_25A5EE350@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A5EE1F0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A5EE37C()
{
  return sub_25A5EE1F0(*v0);
}

uint64_t LegacyAgentPayload.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A5EE3DC(void *a1)
{
  sub_25A55C73C((uint64_t)a1, (uint64_t)v18, &qword_26A42BB90);
  sub_25A55C73C((uint64_t)(a1 + 1), (uint64_t)v17, &qword_26A42BB98);
  uint64_t v2 = a1[2];
  sub_25A55C73C((uint64_t)(a1 + 3), (uint64_t)v16, &qword_26A429458);
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  sub_25A55C73C((uint64_t)(a1 + 7), (uint64_t)v15, &qword_26A42BBA0);
  v14[15] = 0;
  sub_25A55C73C((uint64_t)v18, (uint64_t)v14, &qword_26A42BB90);
  v13[15] = 1;
  sub_25A55C73C((uint64_t)v17, (uint64_t)v13, &qword_26A42BB98);
  char v12 = 2;
  uint64_t v11 = v2;
  v10[23] = 3;
  sub_25A55C73C((uint64_t)v16, (uint64_t)v10, &qword_26A429458);
  char v9 = 4;
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6[15] = 5;
  sub_25A55C73C((uint64_t)v15, (uint64_t)v6, &qword_26A42BBA0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A429B90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A429B50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A429BA8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42A5A8);
  sub_25A5EEC34();
  sub_25A5EEC88(&qword_26A429B98, &qword_26A429B90, (void (*)(void))sub_25A5732F0);
  sub_25A5EEC88(&qword_26A429B58, &qword_26A429B50, (void (*)(void))sub_25A57263C);
  sub_25A5EEC88(&qword_26A429BB0, &qword_26A429BA8, (void (*)(void))sub_25A5733BC);
  sub_25A5EEC88((unint64_t *)&qword_26A42A5B0, &qword_26A42A5A8, (void (*)(void))sub_25A5AA1CC);
  return sub_25A622A30();
}

uint64_t sub_25A5EE6A8()
{
  return sub_25A5EE3DC(*(void **)(v0 + 16));
}

uint64_t LegacyAgentPayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v21 = &type metadata for LegacyAgentPayload.Key;
  unint64_t v5 = sub_25A5EEC34();
  unint64_t v22 = v5;
  v20[0] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A429B90);
  sub_25A5EEC88(&qword_26A429B98, &qword_26A429B90, (void (*)(void))sub_25A5732F0);
  sub_25A622760();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    uint64_t v7 = v23;
    v21 = &type metadata for LegacyAgentPayload.Key;
    unint64_t v22 = v5;
    v20[0] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A429B50);
    sub_25A5EEC88(&qword_26A429B58, &qword_26A429B50, (void (*)(void))sub_25A57263C);
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    v21 = &type metadata for LegacyAgentPayload.Key;
    unint64_t v22 = v5;
    v20[0] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A429BA8);
    sub_25A5EEC88(&qword_26A429BB0, &qword_26A429BA8, (void (*)(void))sub_25A5733BC);
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    v21 = &type metadata for LegacyAgentPayload.Key;
    unint64_t v22 = v5;
    v20[0] = 3;
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    v21 = &type metadata for LegacyAgentPayload.Key;
    unint64_t v22 = v5;
    v20[0] = 4;
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    v21 = &type metadata for LegacyAgentPayload.Key;
    unint64_t v22 = v5;
    v20[0] = 5;
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    v21 = &type metadata for LegacyAgentPayload.Key;
    unint64_t v22 = v5;
    v20[0] = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42A5A8);
    sub_25A5EEC88((unint64_t *)&qword_26A42A5B0, &qword_26A42A5A8, (void (*)(void))sub_25A5AA1CC);
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    if (v11) {
      uint64_t v9 = v11;
    }
    else {
      uint64_t v9 = MEMORY[0x263F8EE78];
    }
    uint64_t v10 = sub_25A6227C0();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
    *(void *)a2 = v7;
    *(void *)(a2 + 8) = v19;
    *(void *)(a2 + 16) = v18;
    *(void *)(a2 + 24) = v16;
    *(void *)(a2 + 32) = v17;
    *(void *)(a2 + 40) = v14;
    *(void *)(a2 + 48) = v15;
    *(void *)(a2 + 56) = v12;
    *(unsigned char *)(a2 + 64) = v13;
    *(void *)(a2 + 72) = v9;
  }
  return result;
}

unint64_t sub_25A5EEC34()
{
  unint64_t result = qword_26A42B5F0;
  if (!qword_26A42B5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B5F0);
  }
  return result;
}

uint64_t sub_25A5EEC88(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25A5EED00()
{
  return sub_25A622780();
}

uint64_t sub_25A5EED58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return LegacyAgentPayload.init(propertyListValue:)(a1, a2);
}

uint64_t TimelinePayload.timelineData.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_25A59FB7C(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t TimelinePayload.init(timelineData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_25A5EEDB8@<X0>(BOOL *a1@<X8>)
{
  return sub_25A56C88C(a1);
}

uint64_t sub_25A5EEDC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5FD55C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t TimelinePayload.propertyListValue.getter()
{
  return sub_25A6227A0();
}

unint64_t sub_25A5EEE64()
{
  unint64_t result = qword_26A42B5F8;
  if (!qword_26A42B5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B5F8);
  }
  return result;
}

double TimelinePayload.init(propertyListValue:)@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v8 = &type metadata for TimelinePayload.Key;
  unint64_t v9 = sub_25A5EEE64();
  sub_25A622710();
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (!v2)
  {
    double result = *(double *)&v10;
    *a2 = v10;
  }
  return result;
}

uint64_t sub_25A5EEFB8()
{
  return sub_25A6227A0();
}

double sub_25A5EF028@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v8 = &type metadata for TimelinePayload.Key;
  unint64_t v9 = sub_25A5EEE64();
  sub_25A622710();
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (!v2)
  {
    double result = *(double *)&v10;
    *a2 = v10;
  }
  return result;
}

uint64_t GeometryPayload.selectableRegions.getter()
{
  return swift_bridgeObjectRetain();
}

PreviewsMessagingOS::GeometryPayload __swiftcall GeometryPayload.init(selectableRegions:)(PreviewsMessagingOS::GeometryPayload selectableRegions)
{
  v1->selectableRegions._rawValue = selectableRegions.selectableRegions._rawValue;
  return selectableRegions;
}

uint64_t sub_25A5EF138()
{
  return sub_25A6234A0();
}

uint64_t sub_25A5EF190()
{
  return sub_25A622DF0();
}

uint64_t sub_25A5EF1AC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A5EF200@<X0>(BOOL *a1@<X8>)
{
  return sub_25A56C88C(a1);
}

void sub_25A5EF20C(void *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x800000025A635CC0;
}

unint64_t sub_25A5EF22C()
{
  return 0xD000000000000011;
}

uint64_t GeometryPayload.propertyListValue.getter()
{
  return sub_25A6227A0();
}

unint64_t sub_25A5EF2F4()
{
  unint64_t result = qword_26A42B608;
  if (!qword_26A42B608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B608);
  }
  return result;
}

unint64_t sub_25A5EF348()
{
  unint64_t result = qword_26A42B618;
  if (!qword_26A42B618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B618);
  }
  return result;
}

uint64_t GeometryPayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v8 = &type metadata for GeometryPayload.Key;
  unint64_t v9 = sub_25A5EF2F4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B600);
  sub_25A5EEC88(&qword_26A42B610, &qword_26A42B600, (void (*)(void))sub_25A5EF348);
  sub_25A622710();
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (!v2) {
    *a2 = v10;
  }
  return result;
}

uint64_t sub_25A5EF4D4()
{
  return sub_25A6227A0();
}

uint64_t sub_25A5EF580@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v8 = &type metadata for GeometryPayload.Key;
  unint64_t v9 = sub_25A5EF2F4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B600);
  sub_25A5EEC88(&qword_26A42B610, &qword_26A42B600, (void (*)(void))sub_25A5EF348);
  sub_25A622710();
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (!v2) {
    *a2 = v10;
  }
  return result;
}

void SceneLayout.interfaceOrientation.getter(unsigned char *a1@<X8>)
{
  if (v1[16]) {
    *a1 = 0;
  }
  else {
    *a1 = *v1;
  }
}

uint64_t sub_25A5EF6D4(char a1)
{
  if (a1) {
    return 0x6D6F74737563;
  }
  else {
    return 0x656369766564;
  }
}

uint64_t sub_25A5EF6FC(char *a1, char *a2)
{
  return sub_25A5ED528(*a1, *a2);
}

uint64_t sub_25A5EF708()
{
  return sub_25A61952C();
}

uint64_t sub_25A5EF710()
{
  return sub_25A54C834();
}

uint64_t sub_25A5EF718()
{
  return sub_25A61B108();
}

uint64_t sub_25A5EF720@<X0>(char *a1@<X8>)
{
  return sub_25A56B748(a1);
}

uint64_t sub_25A5EF72C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5EF6D4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A5EF758(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A602AB0();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A5EF7B4()
{
  return sub_25A622B20();
}

uint64_t sub_25A5EF81C(char a1)
{
  return *(void *)&aDiscrimiorient_0[8 * a1];
}

uint64_t sub_25A5EF83C(char *a1, char *a2)
{
  return sub_25A5ED4A0(*a1, *a2);
}

uint64_t sub_25A5EF848()
{
  return sub_25A61959C();
}

uint64_t sub_25A5EF850()
{
  return sub_25A54C7E0();
}

uint64_t sub_25A5EF858()
{
  return sub_25A61B174();
}

uint64_t sub_25A5EF860@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A570B50();
  *a1 = result;
  return result;
}

uint64_t sub_25A5EF898@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5EF81C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A5EF8C4()
{
  return sub_25A5EF81C(*v0);
}

uint64_t SceneLayout.propertyListValue.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  char v3 = *((unsigned char *)v0 + 16);
  unint64_t v4 = sub_25A5EF9C4();
  sub_25A5EFA18();
  sub_25A6227A0();
  if (v3)
  {
    uint64_t v9 = v1;
    uint64_t v10 = v2;
    char v11 = 0;
    uint64_t v7 = &type metadata for SceneLayout.Key;
    unint64_t v8 = v4;
    v6[0] = 2;
    type metadata accessor for CGSize(0);
  }
  else
  {
    LOBYTE(v9) = v1;
    uint64_t v7 = &type metadata for SceneLayout.Key;
    unint64_t v8 = v4;
    v6[0] = 1;
    sub_25A5B064C();
  }
  sub_25A622700();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

unint64_t sub_25A5EF9C4()
{
  unint64_t result = qword_26A42B620;
  if (!qword_26A42B620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B620);
  }
  return result;
}

unint64_t sub_25A5EFA18()
{
  unint64_t result = qword_26A42B628;
  if (!qword_26A42B628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B628);
  }
  return result;
}

uint64_t SceneLayout.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v13 = &type metadata for SceneLayout.Key;
  unint64_t v5 = sub_25A5EF9C4();
  unint64_t v14 = v5;
  v12[0] = 0;
  sub_25A5EFA18();
  sub_25A622710();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    char v13 = &type metadata for SceneLayout.Key;
    unint64_t v14 = v5;
    if (v11)
    {
      v12[0] = 2;
      type metadata accessor for CGSize(0);
      sub_25A622710();
      uint64_t v8 = sub_25A6227C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
      long long v9 = v11;
    }
    else
    {
      v12[0] = 1;
      sub_25A5B064C();
      sub_25A622710();
      uint64_t v10 = sub_25A6227C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
      long long v9 = v11;
    }
    *(_OWORD *)a2 = v9;
    *(unsigned char *)(a2 + 16) = v11;
  }
  return result;
}

uint64_t static SceneLayout.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v4 = *(double *)a1;
  double v5 = *(double *)a2;
  if ((*(unsigned char *)(a1 + 16) & 1) == 0)
  {
    if ((*(unsigned char *)(a2 + 16) & 1) == 0) {
      return sub_25A5E8B28(LOBYTE(v4), SLOBYTE(v5));
    }
    return 0;
  }
  if ((*(unsigned char *)(a2 + 16) & 1) == 0) {
    return 0;
  }
  return *(double *)(a1 + 8) == *(double *)(a2 + 8) && v4 == v5;
}

uint64_t sub_25A5EFCA4(uint64_t a1, uint64_t a2)
{
  double v4 = *(double *)a1;
  double v5 = *(double *)a2;
  if ((*(unsigned char *)(a1 + 16) & 1) == 0)
  {
    if ((*(unsigned char *)(a2 + 16) & 1) == 0) {
      return sub_25A5E8B28(LOBYTE(v4), SLOBYTE(v5));
    }
    return 0;
  }
  if ((*(unsigned char *)(a2 + 16) & 1) == 0) {
    return 0;
  }
  return *(double *)(a1 + 8) == *(double *)(a2 + 8) && v4 == v5;
}

uint64_t sub_25A5EFCFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return SceneLayout.init(propertyListValue:)(a1, a2);
}

uint64_t static UInt32.mainScreen.getter()
{
  return 1;
}

uint64_t sub_25A5EFD1C(char a1)
{
  return *(void *)&aMain_6[8 * a1];
}

uint64_t sub_25A5EFD3C(char *a1, char *a2)
{
  return sub_25A5ED418(*a1, *a2);
}

uint64_t sub_25A5EFD48()
{
  return sub_25A619608();
}

uint64_t sub_25A5EFD50()
{
  return sub_25A54C78C();
}

uint64_t sub_25A5EFD58()
{
  return sub_25A61B1DC();
}

uint64_t sub_25A5EFD60@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A5B0564();
  *a1 = result;
  return result;
}

uint64_t sub_25A5EFD98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5EFD1C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A5EFDC4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A602B04();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A5EFE20()
{
  return sub_25A622B20();
}

uint64_t sub_25A5EFE88(char a1)
{
  return *(void *)&aDiscrimiscreen_0[8 * a1];
}

uint64_t sub_25A5EFEA8(char *a1, char *a2)
{
  return sub_25A5ED390(*a1, *a2);
}

uint64_t sub_25A5EFEB4()
{
  return sub_25A619674();
}

uint64_t sub_25A5EFEBC()
{
  return sub_25A54C738();
}

uint64_t sub_25A5EFEC4()
{
  return sub_25A61B244();
}

uint64_t sub_25A5EFECC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A570B50();
  *a1 = result;
  return result;
}

uint64_t sub_25A5EFF04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5EFE88(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A5EFF30()
{
  return sub_25A5EFE88(*v0);
}

uint64_t HostIdentity.propertyListValue.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  int v3 = *((unsigned __int8 *)v0 + 16);
  unint64_t v4 = sub_25A5F007C();
  sub_25A5F00D0();
  uint64_t result = sub_25A6227A0();
  if (v3)
  {
    if (v3 != 1) {
      return result;
    }
    uint64_t v9 = v1;
    uint64_t v10 = v2;
    uint64_t v7 = &type metadata for HostIdentity.Key;
    unint64_t v8 = v4;
    v6[0] = 2;
  }
  else
  {
    LODWORD(v9) = v1;
    BYTE4(v9) = 0;
    uint64_t v7 = &type metadata for HostIdentity.Key;
    unint64_t v8 = v4;
    v6[0] = 1;
  }
  sub_25A622700();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

unsigned char *sub_25A5F0034(unsigned char *result, char *a2)
{
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 24);
  int v5 = *(unsigned __int8 *)(v2 + 32);
  *uint64_t result = 0;
  if (v5)
  {
    if (v5 == 1)
    {
      *a2 = 2;
    }
    else
    {
      if (v3 | v4) {
        char v6 = 3;
      }
      else {
        char v6 = 0;
      }
      *a2 = v6;
    }
  }
  else
  {
    *a2 = 1;
  }
  return result;
}

unint64_t sub_25A5F007C()
{
  unint64_t result = qword_26A42B630;
  if (!qword_26A42B630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B630);
  }
  return result;
}

unint64_t sub_25A5F00D0()
{
  unint64_t result = qword_26A42B638;
  if (!qword_26A42B638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B638);
  }
  return result;
}

uint64_t HostIdentity.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = &type metadata for HostIdentity.Key;
  unint64_t v5 = sub_25A5F007C();
  unint64_t v19 = v5;
  v17[0] = 0;
  sub_25A5F00D0();
  sub_25A622710();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    switch((char)v15)
    {
      case 1:
        uint64_t v18 = &type metadata for HostIdentity.Key;
        unint64_t v19 = v5;
        v17[0] = 1;
        sub_25A622710();
        uint64_t v12 = sub_25A6227C0();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
        uint64_t v10 = 0;
        char v11 = 0;
        uint64_t v9 = v15;
        break;
      case 2:
        uint64_t v18 = &type metadata for HostIdentity.Key;
        unint64_t v19 = v5;
        v17[0] = 2;
        sub_25A622710();
        uint64_t v13 = sub_25A6227C0();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
        uint64_t v9 = v15;
        uint64_t v10 = v16;
        char v11 = 1;
        break;
      case 3:
        uint64_t v14 = sub_25A6227C0();
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
        uint64_t v10 = 0;
        char v11 = 2;
        uint64_t v9 = 1;
        break;
      default:
        uint64_t v8 = sub_25A6227C0();
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
        uint64_t v9 = 0;
        uint64_t v10 = 0;
        char v11 = 2;
        break;
    }
    *(void *)a2 = v9;
    *(void *)(a2 + 8) = v10;
    *(unsigned char *)(a2 + 16) = v11;
  }
  return result;
}

uint64_t sub_25A5F03C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return HostIdentity.init(propertyListValue:)(a1, a2);
}

PreviewsMessagingOS::ChromeType_optional __swiftcall ChromeType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25A6232B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t ChromeType.rawValue.getter()
{
  return *(void *)&aUnspecifdevice_0[8 * *v0];
}

uint64_t sub_25A5F0460(char *a1, char *a2)
{
  return sub_25A5EDB24(*a1, *a2);
}

uint64_t sub_25A5F046C()
{
  return sub_25A6196E0();
}

uint64_t sub_25A5F0474()
{
  return sub_25A54CBF4();
}

uint64_t sub_25A5F047C()
{
  return sub_25A61ACA0();
}

PreviewsMessagingOS::ChromeType_optional sub_25A5F0484(Swift::String *a1)
{
  return ChromeType.init(rawValue:)(*a1);
}

uint64_t sub_25A5F0490@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ChromeType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25A5F04B8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A60306C();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A5F0514()
{
  return sub_25A622B20();
}

uint64_t GridIndex.section.getter()
{
  return *(void *)v0;
}

uint64_t GridIndex.section.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*GridIndex.section.modify())()
{
  return nullsub_1;
}

uint64_t GridIndex.item.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t GridIndex.item.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*GridIndex.item.modify())()
{
  return nullsub_1;
}

PreviewsMessagingOS::GridIndex __swiftcall GridIndex.init(section:item:)(Swift::Int section, Swift::Int item)
{
  Swift::Int *v2 = section;
  v2[1] = item;
  result.item = item;
  result.section = section;
  return result;
}

uint64_t sub_25A5F05E4(char a1)
{
  if (a1) {
    return 1835365481;
  }
  else {
    return 0x6E6F6974636573;
  }
}

uint64_t sub_25A5F0614(char *a1, char *a2)
{
  return sub_25A5E7C00(*a1, *a2);
}

uint64_t sub_25A5F0620()
{
  return sub_25A61974C();
}

uint64_t sub_25A5F0628()
{
  return sub_25A5495C0();
}

uint64_t sub_25A5F0630()
{
  return sub_25A61E858();
}

uint64_t sub_25A5F0638@<X0>(char *a1@<X8>)
{
  return sub_25A56B748(a1);
}

uint64_t sub_25A5F0644@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5F05E4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A5F0670()
{
  return sub_25A5F05E4(*v0);
}

uint64_t GridIndex.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A5F06B8()
{
  return sub_25A622A80();
}

uint64_t sub_25A5F0730()
{
  return sub_25A5F06B8();
}

uint64_t GridIndex.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v12 = &type metadata for GridIndex.Key;
  unint64_t v5 = sub_25A5F088C();
  unint64_t v13 = v5;
  v11[0] = 0;
  sub_25A622710();
  if (v2)
  {
    uint64_t v7 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    uint64_t v6 = v14;
    uint64_t v12 = &type metadata for GridIndex.Key;
    unint64_t v13 = v5;
    v11[0] = 1;
    sub_25A622710();
    uint64_t v8 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    uint64_t v10 = v14;
    *a2 = v6;
    a2[1] = v10;
  }
  return result;
}

unint64_t sub_25A5F088C()
{
  unint64_t result = qword_26A42B640;
  if (!qword_26A42B640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B640);
  }
  return result;
}

BOOL static GridIndex.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t sub_25A5F08F8()
{
  return sub_25A622780();
}

uint64_t sub_25A5F0938@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return GridIndex.init(propertyListValue:)(a1, a2);
}

BOOL sub_25A5F0950(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

void StaticPreviewReply.chromeType.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t StaticPreviewReply.contentPayload.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StaticPreviewReply(0) + 20);
  uint64_t v4 = sub_25A6227C0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for StaticPreviewReply(uint64_t a1)
{
  return sub_25A54FD94(a1, (uint64_t *)&unk_26A42B800);
}

uint64_t StaticPreviewReply.controlDescriptions.getter()
{
  type metadata accessor for StaticPreviewReply(0);

  return swift_bridgeObjectRetain();
}

uint64_t StaticPreviewReply.controlStates.getter()
{
  return sub_25A5F1794((void (*)(void))type metadata accessor for StaticPreviewReply);
}

uint64_t StaticPreviewReply.init(chromeType:controlDescriptions:controlStates:contentPayload:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unsigned char *a5@<X8>)
{
  *a5 = *a1;
  uint64_t v9 = (int *)type metadata accessor for StaticPreviewReply(0);
  *(void *)&a5[v9[6]] = a2;
  *(void *)&a5[v9[7]] = a3;
  uint64_t v10 = &a5[v9[5]];
  uint64_t v11 = sub_25A6227C0();
  uint64_t v12 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32);

  return v12(v10, a4, v11);
}

unint64_t sub_25A5F0AFC(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x536C6F72746E6F63;
      break;
    case 3:
      unint64_t result = 0x50746E65746E6F63;
      break;
    default:
      unint64_t result = 0x7954656D6F726863;
      break;
  }
  return result;
}

uint64_t sub_25A5F0BB0(unsigned __int8 *a1, char *a2)
{
  return sub_25A5EA314(*a1, *a2);
}

uint64_t sub_25A5F0BBC()
{
  return sub_25A6197C8();
}

uint64_t sub_25A5F0BC4()
{
  return sub_25A54AB84();
}

uint64_t sub_25A5F0BCC()
{
  return sub_25A61CD38();
}

uint64_t sub_25A5F0BD4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A5B0564();
  *a1 = result;
  return result;
}

unint64_t sub_25A5F0C0C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A5F0AFC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A5F0C38()
{
  return sub_25A5F0AFC(*v0);
}

uint64_t StaticPreviewReply.propertyListValue.getter()
{
  uint64_t v1 = sub_25A6227C0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unint64_t v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = v0;
  sub_25A622780();
  type metadata accessor for StaticPreviewReply(0);
  sub_25A622730();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_25A5F0D48(unsigned __int8 *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4299B8);
  MEMORY[0x270FA5388](v2 - 8);
  v27 = &v25[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BB88);
  uint64_t v5 = v4 - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v25[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v25[-v9];
  int v26 = *a1;
  uint64_t v11 = (int *)type metadata accessor for StaticPreviewReply(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = *(void *)&a1[v11[6]];
  uint64_t v14 = *(void *)&a1[v11[7]];
  uint64_t v15 = *(int *)(v5 + 56);
  v28 = v10;
  uint64_t v16 = &v10[v15];
  *uint64_t v10 = 3;
  uint64_t v17 = &a1[v12];
  uint64_t v18 = sub_25A6227C0();
  uint64_t v19 = *(void *)(v18 - 8);
  v20 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v19 + 16);
  v20(v16, v17, v18);
  char v35 = 0;
  char v34 = v26;
  char v33 = 1;
  uint64_t v32 = v13;
  char v31 = 2;
  uint64_t v30 = v14;
  v21 = &v8[*(int *)(v5 + 56)];
  *uint64_t v8 = 3;
  v20(v21, v16, v18);
  uint64_t v22 = (uint64_t)v27;
  (*(void (**)(unsigned char *, unsigned __int8 *, uint64_t))(v19 + 32))(v27, v21, v18);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v22, 0, 1, v18);
  char v29 = 3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B658);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A429B68);
  sub_25A5F1350();
  sub_25A5F13A4();
  sub_25A5F13F8();
  sub_25A5F149C();
  uint64_t v23 = sub_25A622A60();
  sub_25A570C60(v22, &qword_26A4299B8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25A570C60((uint64_t)v28, &qword_26A42BB88);
  return v23;
}

uint64_t sub_25A5F1058()
{
  return sub_25A5F0D48(*(unsigned __int8 **)(v0 + 16));
}

uint64_t StaticPreviewReply.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = sub_25A6227C0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = &type metadata for StaticPreviewReply.Key;
  unint64_t v9 = sub_25A5F1350();
  unint64_t v22 = v9;
  v20[0] = 0;
  sub_25A5F13A4();
  sub_25A622760();
  if (v2)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    if (v23 == 5) {
      int v10 = 0;
    }
    else {
      int v10 = v23;
    }
    v21 = &type metadata for StaticPreviewReply.Key;
    unint64_t v22 = v9;
    v20[0] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B658);
    sub_25A5F13F8();
    sub_25A622760();
    int v18 = v10;
    uint64_t v19 = a2;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    uint64_t v12 = MEMORY[0x263F8EE78];
    if (v23) {
      uint64_t v13 = v23;
    }
    else {
      uint64_t v13 = MEMORY[0x263F8EE78];
    }
    v21 = &type metadata for StaticPreviewReply.Key;
    unint64_t v22 = v9;
    v20[0] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A429B68);
    sub_25A5F149C();
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    if (v23) {
      uint64_t v14 = v23;
    }
    else {
      uint64_t v14 = v12;
    }
    v21 = &type metadata for StaticPreviewReply.Key;
    unint64_t v22 = v9;
    v20[0] = 3;
    sub_25A622710();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    uint64_t v15 = v19;
    *uint64_t v19 = v18;
    uint64_t v16 = (int *)type metadata accessor for StaticPreviewReply(0);
    *(void *)&v15[v16[6]] = v13;
    *(void *)&v15[v16[7]] = v14;
    return (*(uint64_t (**)(unsigned char *, char *, uint64_t))(v6 + 32))(&v15[v16[5]], v8, v5);
  }
}

unint64_t sub_25A5F1350()
{
  unint64_t result = qword_26A42B648;
  if (!qword_26A42B648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B648);
  }
  return result;
}

unint64_t sub_25A5F13A4()
{
  unint64_t result = qword_26A42B650;
  if (!qword_26A42B650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B650);
  }
  return result;
}

unint64_t sub_25A5F13F8()
{
  unint64_t result = qword_26A42B660;
  if (!qword_26A42B660)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A42B658);
    sub_25A5F1540(&qword_26A42B668, (void (*)(uint64_t))type metadata accessor for CanvasControlDescription);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B660);
  }
  return result;
}

unint64_t sub_25A5F149C()
{
  unint64_t result = qword_26A429B70;
  if (!qword_26A429B70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A429B68);
    sub_25A5F1540((unint64_t *)&qword_26A429980, (void (*)(uint64_t))type metadata accessor for PlistValueBox);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A429B70);
  }
  return result;
}

uint64_t sub_25A5F1540(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25A5F1588()
{
  uint64_t v1 = sub_25A6227C0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = v0;
  sub_25A622780();
  sub_25A622730();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_25A5F168C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  return StaticPreviewReply.init(propertyListValue:)(a1, a2);
}

uint64_t HostedPreviewReply.hostIdentity.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  char v4 = *(unsigned char *)(v1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  return sub_25A5F16B8(v2, v3, v4);
}

uint64_t sub_25A5F16B8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

__n128 HostedPreviewReply.sceneLayout.getter@<Q0>(__n128 *a1@<X8>)
{
  unsigned __int8 v2 = *(unsigned char *)(v1 + 40);
  __n128 result = *(__n128 *)(v1 + 24);
  *a1 = result;
  a1[1].n128_u8[0] = v2;
  return result;
}

uint64_t HostedPreviewReply.contentPayload.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for HostedPreviewReply(0) + 24);
  uint64_t v4 = sub_25A6227C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for HostedPreviewReply(uint64_t a1)
{
  return sub_25A54FD94(a1, qword_26A42B810);
}

uint64_t HostedPreviewReply.controlDescriptions.getter()
{
  return sub_25A5F1794((void (*)(void))type metadata accessor for HostedPreviewReply);
}

uint64_t sub_25A5F1794(void (*a1)(void))
{
  a1(0);

  return swift_bridgeObjectRetain();
}

uint64_t HostedPreviewReply.controlStates.getter()
{
  type metadata accessor for HostedPreviewReply(0);

  return swift_bridgeObjectRetain();
}

unint64_t HostedPreviewReply.screenID.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  if (*(unsigned char *)(v0 + 16))
  {
    if (v1 != 1 && *(_OWORD *)v0 == 0)
    {
      LOBYTE(v1) = 0;
      uint64_t v2 = 1;
    }
    else
    {
      uint64_t v2 = 0;
      LOBYTE(v1) = 1;
    }
  }
  else
  {
    uint64_t v2 = *(void *)v0;
  }
  return v2 | ((unint64_t)v1 << 32);
}

uint64_t HostedPreviewReply.init(hostIdentity:sceneLayout:controlDescriptions:controlStates:contentPayload:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v10 = *(unsigned char *)(a1 + 16);
  char v11 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a6 = *(_OWORD *)a1;
  *(unsigned char *)(a6 + 16) = v10;
  *(_OWORD *)(a6 + 24) = *(_OWORD *)a2;
  *(unsigned char *)(a6 + 40) = v11;
  uint64_t v12 = (int *)type metadata accessor for HostedPreviewReply(0);
  *(void *)(a6 + v12[7]) = a3;
  *(void *)(a6 + v12[8]) = a4;
  uint64_t v13 = a6 + v12[6];
  uint64_t v14 = sub_25A6227C0();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32);

  return v15(v13, a5, v14);
}

unint64_t sub_25A5F1914(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x79614C656E656373;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x536C6F72746E6F63;
      break;
    case 4:
      unint64_t result = 0x50746E65746E6F63;
      break;
    case 5:
      unint64_t result = 0x44496E6565726373;
      break;
    default:
      unint64_t result = 0x6E65644974736F68;
      break;
  }
  return result;
}

uint64_t sub_25A5F1A0C(unsigned __int8 *a1, char *a2)
{
  return sub_25A5EAB1C(*a1, *a2);
}

uint64_t sub_25A5F1A18()
{
  return sub_25A6198C4();
}

uint64_t sub_25A5F1A20()
{
  return sub_25A54B0B8();
}

uint64_t sub_25A5F1A28()
{
  return sub_25A61C828();
}

uint64_t sub_25A5F1A30@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A602BAC();
  *a1 = result;
  return result;
}

unint64_t sub_25A5F1A60@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A5F1914(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A5F1A8C()
{
  return sub_25A5F1914(*v0);
}

uint64_t HostedPreviewReply.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A5F1AD0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4299B8);
  MEMORY[0x270FA5388](v2 - 8);
  char v35 = &v26[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BB80);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v26[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = &v26[-v8];
  uint64_t v11 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  int v12 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v30 = *(void *)(a1 + 24);
  uint64_t v31 = v10;
  uint64_t v29 = *(void *)(a1 + 32);
  int v28 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v13 = (int *)type metadata accessor for HostedPreviewReply(0);
  uint64_t v14 = v13[6];
  uint64_t v15 = *(void *)(a1 + v13[8]);
  uint64_t v32 = *(void *)(a1 + v13[7]);
  uint64_t v33 = v15;
  uint64_t v16 = &v9[*(int *)(v4 + 48)];
  char v34 = v9;
  *unint64_t v9 = 4;
  uint64_t v17 = a1 + v14;
  uint64_t v18 = sub_25A6227C0();
  uint64_t v19 = *(void *)(v18 - 8);
  v20 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v19 + 16);
  v20(v16, v17, v18);
  if (v12)
  {
    uint64_t v21 = v31;
    if (v12 == 1 || v11 | v31)
    {
      sub_25A5F16B8(v11, v31, v12);
      uint64_t v27 = 0x100000000;
    }
    else
    {
      uint64_t v27 = 1;
    }
  }
  else
  {
    uint64_t v27 = v11;
    uint64_t v21 = v31;
  }
  char v51 = 0;
  uint64_t v48 = v11;
  uint64_t v49 = v21;
  char v50 = v12;
  char v47 = 1;
  uint64_t v44 = v30;
  uint64_t v45 = v29;
  char v46 = v28;
  char v43 = 2;
  uint64_t v42 = v32;
  char v41 = 3;
  uint64_t v40 = v33;
  unint64_t v22 = &v7[*(int *)(v4 + 48)];
  *uint64_t v7 = 4;
  v20(v22, (uint64_t)v16, v18);
  uint64_t v23 = (uint64_t)v35;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v19 + 32))(v35, v22, v18);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v23, 0, 1, v18);
  char v39 = 4;
  char v38 = 5;
  int v36 = v27;
  char v37 = BYTE4(v27);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B658);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A429B68);
  sub_25A5F2384();
  sub_25A5F23D8();
  sub_25A5F242C();
  sub_25A5F13F8();
  sub_25A5F149C();
  uint64_t v24 = sub_25A622A40();
  sub_25A570C60(v23, &qword_26A4299B8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25A603124(v48, v49, v50);
  sub_25A570C60((uint64_t)v34, &qword_26A42BB80);
  return v24;
}

uint64_t sub_25A5F1ECC()
{
  return sub_25A5F1AD0(*(void *)(v0 + 16));
}

uint64_t HostedPreviewReply.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4299B8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A6227C0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v37 = &type metadata for HostedPreviewReply.Key;
  unint64_t v12 = sub_25A5F2384();
  unint64_t v38 = v12;
  v36[0] = 0;
  sub_25A5F23D8();
  sub_25A622710();
  uint64_t v32 = a2;
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    char v37 = &type metadata for HostedPreviewReply.Key;
    unint64_t v38 = v12;
    v36[0] = 5;
    sub_25A622760();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    uint64_t v34 = 0;
    if (BYTE4(v39) == 1)
    {
      int v35 = 2;
      uint64_t v13 = 1;
    }
    else
    {
      int v35 = 0;
      uint64_t v13 = v39;
    }
    uint64_t v33 = v13;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    uint64_t v33 = v39;
    uint64_t v34 = v40;
    int v35 = v41;
  }
  char v37 = &type metadata for HostedPreviewReply.Key;
  unint64_t v38 = v12;
  v36[0] = 1;
  sub_25A5F242C();
  sub_25A622760();
  uint64_t v29 = v11;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  uint64_t v30 = v40;
  uint64_t v31 = v39;
  int v14 = v41;
  char v37 = &type metadata for HostedPreviewReply.Key;
  unint64_t v38 = v12;
  v36[0] = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B658);
  sub_25A5F13F8();
  sub_25A622760();
  int v28 = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  if (v42) {
    uint64_t v15 = v42;
  }
  else {
    uint64_t v15 = MEMORY[0x263F8EE78];
  }
  char v37 = &type metadata for HostedPreviewReply.Key;
  unint64_t v38 = v12;
  v36[0] = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A429B68);
  sub_25A5F149C();
  sub_25A622760();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  if (v42) {
    uint64_t v16 = v42;
  }
  else {
    uint64_t v16 = MEMORY[0x263F8EE78];
  }
  char v37 = &type metadata for HostedPreviewReply.Key;
  unint64_t v38 = v12;
  v36[0] = 4;
  sub_25A622760();
  uint64_t v26 = v16;
  uint64_t v27 = v15;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  int v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  uint64_t v19 = v30;
  uint64_t v18 = v31;
  char v20 = v28;
  uint64_t v21 = v29;
  if (v17 == 1)
  {
    _s19PreviewsMessagingOS24CanvasControlDescriptionV9ModifiersV17propertyListValue0a10FoundationC008PropertyI0Vvg_0();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    sub_25A570C60((uint64_t)v7, &qword_26A4299B8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v21, v7, v8);
  }
  unint64_t v22 = v32;
  uint64_t v23 = v34;
  *uint64_t v32 = v33;
  v22[1] = v23;
  *((unsigned char *)v22 + 16) = v35;
  v22[3] = v18;
  v22[4] = v19;
  *((unsigned char *)v22 + 40) = v20;
  uint64_t v24 = (int *)type metadata accessor for HostedPreviewReply(0);
  *(uint64_t *)((char *)v22 + v24[7]) = v27;
  *(uint64_t *)((char *)v22 + v24[8]) = v26;
  return (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))((char *)v22 + v24[6], v21, v8);
}

unint64_t sub_25A5F2384()
{
  unint64_t result = qword_26A42B670;
  if (!qword_26A42B670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B670);
  }
  return result;
}

unint64_t sub_25A5F23D8()
{
  unint64_t result = qword_26A42B678;
  if (!qword_26A42B678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B678);
  }
  return result;
}

unint64_t sub_25A5F242C()
{
  unint64_t result = qword_26A42B680;
  if (!qword_26A42B680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B680);
  }
  return result;
}

uint64_t sub_25A5F2480(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25A5F2498()
{
  return sub_25A622780();
}

uint64_t sub_25A5F24D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return HostedPreviewReply.init(propertyListValue:)(a1, a2);
}

uint64_t RenderPayload.bitmapDescription.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  int v3 = *(_DWORD *)(v1 + 40);
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = *(void *)(v1 + 72);
  *(void *)a1 = *(void *)v1;
  long long v6 = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 8) = v6;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(_DWORD *)(a1 + 40) = v3;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(v1 + 48);
  *(void *)(a1 + 64) = v4;
  *(void *)(a1 + 72) = v5;
  sub_25A59FB7C(v2, v6);

  return swift_bridgeObjectRetain();
}

uint64_t RenderPayload.selectableRegions.getter()
{
  return swift_bridgeObjectRetain();
}

double RenderPayload.snapshotCornerRadius.getter()
{
  return *(double *)(v0 + 88);
}

double RenderPayload.scaleFactor.getter()
{
  return *(double *)(v0 + 96);
}

uint64_t RenderPayload.init(bitmapDescription:selectableRegions:snapshotCornerRadius:scaleFactor:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v5 = *(void *)(result + 32);
  int v6 = *(_DWORD *)(result + 40);
  uint64_t v7 = *(void *)(result + 64);
  uint64_t v8 = *(void *)(result + 72);
  long long v9 = *(_OWORD *)(result + 16);
  *(_OWORD *)a3 = *(_OWORD *)result;
  *(_OWORD *)(a3 + 16) = v9;
  *(void *)(a3 + 32) = v5;
  *(_DWORD *)(a3 + 40) = v6;
  *(_OWORD *)(a3 + 48) = *(_OWORD *)(result + 48);
  *(void *)(a3 + 64) = v7;
  *(void *)(a3 + 72) = v8;
  *(void *)(a3 + 80) = a2;
  *(double *)(a3 + 88) = a4;
  *(double *)(a3 + 96) = a5;
  return result;
}

unint64_t sub_25A5F25A0(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0x636146656C616373;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25A5F2634(unsigned __int8 *a1, char *a2)
{
  return sub_25A5ECFA8(*a1, *a2);
}

uint64_t sub_25A5F2640()
{
  return sub_25A619A04();
}

uint64_t sub_25A5F2648()
{
  return sub_25A54C4E0();
}

uint64_t sub_25A5F2650()
{
  return sub_25A61B56C();
}

uint64_t sub_25A5F2658@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A5B0564();
  *a1 = result;
  return result;
}

unint64_t sub_25A5F2690@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A5F25A0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A5F26BC()
{
  return sub_25A5F25A0(*v0);
}

uint64_t RenderPayload.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A5F2724()
{
  return sub_25A622A60();
}

uint64_t sub_25A5F2870()
{
  return sub_25A5F2724();
}

uint64_t RenderPayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = &type metadata for RenderPayload.Key;
  unint64_t v5 = sub_25A5F2BBC();
  unint64_t v27 = v5;
  v25[0] = 0;
  sub_25A5F2C10();
  sub_25A622710();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  }
  else
  {
    uint64_t v21 = a2;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    uint64_t v8 = v28;
    uint64_t v7 = v29;
    uint64_t v19 = v31;
    uint64_t v20 = v30;
    uint64_t v18 = v32;
    int v17 = v33;
    uint64_t v15 = v35;
    uint64_t v16 = v34;
    uint64_t v9 = v37;
    uint64_t v14 = v36;
    uint64_t v26 = &type metadata for RenderPayload.Key;
    unint64_t v27 = v5;
    v25[0] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B600);
    sub_25A5EEC88(&qword_26A42B610, &qword_26A42B600, (void (*)(void))sub_25A5EF348);
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    uint64_t v26 = &type metadata for RenderPayload.Key;
    unint64_t v27 = v5;
    v25[0] = 2;
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    double v10 = v22;
    uint64_t v26 = &type metadata for RenderPayload.Key;
    unint64_t v27 = v5;
    v25[0] = 3;
    sub_25A622760();
    if (v23) {
      double v10 = 0.0;
    }
    uint64_t v12 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    double v13 = v22;
    if (v23) {
      double v13 = 3.0;
    }
    *(void *)uint64_t v21 = v8;
    *(void *)(v21 + 8) = v7;
    *(void *)(v21 + 16) = v20;
    *(void *)(v21 + 24) = v19;
    *(void *)(v21 + 32) = v18;
    *(_DWORD *)(v21 + 40) = v17;
    *(void *)(v21 + 48) = v16;
    *(void *)(v21 + 56) = v15;
    *(void *)(v21 + 64) = v14;
    *(void *)(v21 + 72) = v9;
    *(void *)(v21 + 80) = v24;
    *(double *)(v21 + 88) = v10;
    *(double *)(v21 + 96) = v13;
  }
  return result;
}

unint64_t sub_25A5F2BBC()
{
  unint64_t result = qword_26A42B688;
  if (!qword_26A42B688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B688);
  }
  return result;
}

unint64_t sub_25A5F2C10()
{
  unint64_t result = qword_26A42B690;
  if (!qword_26A42B690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B690);
  }
  return result;
}

uint64_t sub_25A5F2C64()
{
  return sub_25A622780();
}

uint64_t sub_25A5F2CC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return RenderPayload.init(propertyListValue:)(a1, a2);
}

uint64_t LayerHostPayload.contextID.getter()
{
  return *(void *)v0;
}

double LayerHostPayload.scaleFactor.getter()
{
  return *(double *)(v0 + 8);
}

double LayerHostPayload.width.getter()
{
  return *(double *)(v0 + 16);
}

double LayerHostPayload.height.getter()
{
  return *(double *)(v0 + 24);
}

uint64_t LayerHostPayload.init(contextID:scaleFactor:width:height:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  *(void *)a2 = result;
  *(double *)(a2 + 8) = a3;
  *(double *)(a2 + 16) = a4;
  *(double *)(a2 + 24) = a5;
  return result;
}

uint64_t sub_25A5F2D0C(char a1)
{
  return *(void *)&aContextiscalef_0[8 * a1];
}

uint64_t sub_25A5F2D2C(char *a1, char *a2)
{
  return sub_25A5EB580(*a1, *a2);
}

uint64_t sub_25A5F2D38()
{
  return sub_25A619AEC();
}

uint64_t sub_25A5F2D40()
{
  return sub_25A54B694();
}

uint64_t sub_25A5F2D48()
{
  return sub_25A61C454();
}

uint64_t sub_25A5F2D50@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A5B0564();
  *a1 = result;
  return result;
}

uint64_t sub_25A5F2D88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5F2D0C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A5F2DB4()
{
  return sub_25A5F2D0C(*v0);
}

uint64_t LayerHostPayload.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A5F2E0C()
{
  return sub_25A622A60();
}

uint64_t sub_25A5F2ED4()
{
  return sub_25A5F2E0C();
}

uint64_t LayerHostPayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v14 = &type metadata for LayerHostPayload.Key;
  unint64_t v5 = sub_25A5F30C8();
  unint64_t v15 = v5;
  v13[0] = 0;
  sub_25A622710();
  if (v2)
  {
    uint64_t v7 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    uint64_t v6 = v16;
    uint64_t v14 = &type metadata for LayerHostPayload.Key;
    unint64_t v15 = v5;
    v13[0] = 1;
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    uint64_t v14 = &type metadata for LayerHostPayload.Key;
    unint64_t v15 = v5;
    v13[0] = 2;
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    uint64_t v14 = &type metadata for LayerHostPayload.Key;
    unint64_t v15 = v5;
    v13[0] = 3;
    sub_25A622710();
    uint64_t v8 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    *a2 = v6;
    a2[1] = v12;
    a2[2] = v11;
    a2[3] = v10;
  }
  return result;
}

unint64_t sub_25A5F30C8()
{
  unint64_t result = qword_26A42B698;
  if (!qword_26A42B698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B698);
  }
  return result;
}

uint64_t sub_25A5F311C()
{
  return sub_25A622780();
}

uint64_t sub_25A5F316C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return LayerHostPayload.init(propertyListValue:)(a1, a2);
}

__n128 PreviewInstancesPayload.init(previewDescription:)@<Q0>(long long *a1@<X0>, uint64_t *a2@<X8>)
{
  long long v15 = a1[1];
  long long v16 = *a1;
  __n128 v13 = (__n128)a1[3];
  long long v14 = a1[2];
  uint64_t v3 = *((void *)a1 + 8);
  char v4 = *((unsigned char *)a1 + 72);
  char v5 = *((unsigned char *)a1 + 73);
  char v6 = *((unsigned char *)a1 + 74);
  char v7 = *((unsigned char *)a1 + 75);
  char v8 = *((unsigned char *)a1 + 76);
  uint64_t v9 = *((void *)a1 + 10);
  uint64_t v10 = *((void *)a1 + 11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B6A0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_25A625820;
  *(_OWORD *)(v11 + 32) = v16;
  *(_OWORD *)(v11 + 48) = v15;
  *(_OWORD *)(v11 + 64) = v14;
  __n128 result = v13;
  *(__n128 *)(v11 + 80) = v13;
  *(void *)(v11 + 96) = v3;
  *(unsigned char *)(v11 + 104) = v4;
  *(unsigned char *)(v11 + 105) = v5;
  *(unsigned char *)(v11 + 106) = v6;
  *(unsigned char *)(v11 + 107) = v7;
  *(unsigned char *)(v11 + 108) = v8;
  *(void *)(v11 + 112) = v9;
  *(void *)(v11 + 120) = v10;
  *a2 = v11;
  return result;
}

uint64_t sub_25A5F3268@<X0>(BOOL *a1@<X8>)
{
  return sub_25A56C88C(a1);
}

uint64_t sub_25A5F3274@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5FD57C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t PreviewInstancesPayload.propertyListValue.getter()
{
  return sub_25A6227A0();
}

unint64_t sub_25A5F334C()
{
  unint64_t result = qword_26A42B6B0;
  if (!qword_26A42B6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B6B0);
  }
  return result;
}

unint64_t sub_25A5F33A0()
{
  unint64_t result = qword_26A42B6C0;
  if (!qword_26A42B6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B6C0);
  }
  return result;
}

uint64_t PreviewInstancesPayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v8 = &type metadata for PreviewInstancesPayload.Key;
  unint64_t v9 = sub_25A5F334C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B6A8);
  sub_25A5EEC88(&qword_26A42B6B8, &qword_26A42B6A8, (void (*)(void))sub_25A5F33A0);
  sub_25A622710();
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (!v2) {
    *a2 = v10;
  }
  return result;
}

uint64_t sub_25A5F352C()
{
  return sub_25A6227A0();
}

uint64_t sub_25A5F35D8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v8 = &type metadata for PreviewInstancesPayload.Key;
  unint64_t v9 = sub_25A5F334C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B6A8);
  sub_25A5EEC88(&qword_26A42B6B8, &qword_26A42B6A8, (void (*)(void))sub_25A5F33A0);
  sub_25A622710();
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (!v2) {
    *a2 = v10;
  }
  return result;
}

__n128 PreviewTraits.layout.getter@<Q0>(__n128 *a1@<X8>)
{
  unsigned __int8 v2 = v1[1].n128_u8[0];
  __n128 result = *v1;
  *a1 = *v1;
  a1[1].n128_u8[0] = v2;
  return result;
}

__n128 PreviewTraits.layout.setter(__n128 *a1)
{
  unsigned __int8 v2 = a1[1].n128_u8[0];
  __n128 result = *a1;
  __n128 *v1 = *a1;
  v1[1].n128_u8[0] = v2;
  return result;
}

uint64_t (*PreviewTraits.layout.modify())()
{
  return nullsub_1;
}

void PreviewTraits.orientation.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 17);
}

unsigned char *PreviewTraits.orientation.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 17) = *result;
  return result;
}

uint64_t (*PreviewTraits.orientation.modify())()
{
  return nullsub_1;
}

void static PreviewTraits.defaultTraits.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
}

__n128 PreviewTraits.init(layout:orientation:)@<Q0>(__n128 *a1@<X0>, unsigned __int8 *a2@<X1>, __n128 *a3@<X8>)
{
  unsigned __int8 v3 = a1[1].n128_u8[0];
  unsigned __int8 v4 = *a2;
  __n128 result = *a1;
  *a3 = *a1;
  a3[1].n128_u8[0] = v3;
  a3[1].n128_u8[1] = v4;
  return result;
}

uint64_t sub_25A5F37BC(char a1)
{
  if (a1) {
    return 0x7461746E6569726FLL;
  }
  else {
    return 0x74756F79616CLL;
  }
}

uint64_t sub_25A5F37F8(char *a1, char *a2)
{
  return sub_25A5ED238(*a1, *a2);
}

uint64_t sub_25A5F3804()
{
  return sub_25A619B58();
}

uint64_t sub_25A5F380C()
{
  return sub_25A54C650();
}

uint64_t sub_25A5F3814()
{
  return sub_25A61B41C();
}

uint64_t sub_25A5F381C@<X0>(char *a1@<X8>)
{
  return sub_25A56B748(a1);
}

uint64_t sub_25A5F3828@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5F37BC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A5F3854()
{
  return sub_25A5F37BC(*v0);
}

uint64_t PreviewTraits.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A5F38AC()
{
  return sub_25A622A80();
}

uint64_t PreviewTraits.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v14 = &type metadata for PreviewTraits.Key;
  unint64_t v5 = sub_25A5F3AAC();
  unint64_t v15 = v5;
  v13[0] = 0;
  sub_25A5F3B00();
  sub_25A622710();
  if (v2)
  {
    uint64_t v9 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    uint64_t v6 = v16;
    uint64_t v7 = v17;
    char v8 = v18;
    long long v14 = &type metadata for PreviewTraits.Key;
    unint64_t v15 = v5;
    v13[0] = 1;
    sub_25A5B064C();
    sub_25A622710();
    uint64_t v10 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v7;
    *(unsigned char *)(a2 + 16) = v8;
    *(unsigned char *)(a2 + 17) = v12;
  }
  return result;
}

unint64_t sub_25A5F3AAC()
{
  unint64_t result = qword_26A42B6C8;
  if (!qword_26A42B6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B6C8);
  }
  return result;
}

unint64_t sub_25A5F3B00()
{
  unint64_t result = qword_26A42B6D0;
  if (!qword_26A42B6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B6D0);
  }
  return result;
}

uint64_t PreviewTraits.hash(into:)()
{
  if (*(unsigned char *)(v0 + 16) == 1)
  {
    sub_25A623460();
  }
  else
  {
    sub_25A623460();
    sub_25A623490();
    sub_25A623490();
  }
  sub_25A622DF0();

  return swift_bridgeObjectRelease();
}

uint64_t static PreviewTraits.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 17);
  double v6 = *(double *)a2;
  double v7 = *(double *)(a2 + 8);
  int v8 = *(unsigned __int8 *)(a2 + 16);
  char v9 = *(unsigned char *)(a2 + 17);
  if (v4 == 1)
  {
    uint64_t v10 = *(void *)&v6 | *(void *)&v7;
    if (*(void *)&v2 | *(void *)&v3)
    {
      if (v8) {
        BOOL v11 = v10 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11) {
        return sub_25A5E8B28(v5, v9);
      }
    }
    else
    {
      if (v8) {
        BOOL v14 = v10 == 0;
      }
      else {
        BOOL v14 = 0;
      }
      if (v14) {
        return sub_25A5E8B28(v5, v9);
      }
    }
  }
  else if ((v8 & 1) == 0 && v2 == v6 && v3 == v7)
  {
    return sub_25A5E8B28(v5, v9);
  }
  return 0;
}

BOOL static PreviewTraits.Layout.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v3 = *(double *)a1;
  double v2 = *(double *)(a1 + 8);
  double v5 = *(double *)a2;
  double v4 = *(double *)(a2 + 8);
  if (*(unsigned char *)(a1 + 16) == 1)
  {
    uint64_t v6 = *(void *)&v5 | *(void *)&v4;
    if (*(void *)&v3 | *(void *)&v2) {
      BOOL v7 = v6 != 0;
    }
    else {
      BOOL v7 = v6 == 0;
    }
    return *(unsigned char *)(a2 + 16) && v7;
  }
  else
  {
    return (*(unsigned char *)(a2 + 16) & 1) == 0 && v3 == v5 && v2 == v4;
  }
}

uint64_t PreviewTraits.hashValue.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  sub_25A623450();
  sub_25A623460();
  if (v1 != 1)
  {
    sub_25A623490();
    sub_25A623490();
  }
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  return sub_25A6234A0();
}

uint64_t sub_25A5F3EC4(char a1)
{
  return *(void *)&aDevice_2[8 * a1];
}

uint64_t sub_25A5F3EE4()
{
  return sub_25A622780();
}

uint64_t sub_25A5F3F34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewTraits.init(propertyListValue:)(a1, a2);
}

uint64_t sub_25A5F3F50()
{
  if (*(unsigned char *)(v0 + 16) == 1)
  {
    sub_25A623460();
  }
  else
  {
    sub_25A623460();
    sub_25A623490();
    sub_25A623490();
  }
  sub_25A622DF0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25A5F4090()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  sub_25A623450();
  sub_25A623460();
  if (v1 != 1)
  {
    sub_25A623490();
    sub_25A623490();
  }
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  return sub_25A6234A0();
}

uint64_t sub_25A5F41DC(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 17);
  double v6 = *(double *)a2;
  double v7 = *(double *)(a2 + 8);
  int v8 = *(unsigned __int8 *)(a2 + 16);
  char v9 = *(unsigned char *)(a2 + 17);
  if (v4 == 1)
  {
    uint64_t v10 = *(void *)&v6 | *(void *)&v7;
    if (*(void *)&v2 | *(void *)&v3)
    {
      if (v8) {
        BOOL v11 = v10 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11) {
        return sub_25A5E8B28(v5, v9);
      }
    }
    else
    {
      if (v8) {
        BOOL v14 = v10 == 0;
      }
      else {
        BOOL v14 = 0;
      }
      if (v14) {
        return sub_25A5E8B28(v5, v9);
      }
    }
  }
  else if ((v8 & 1) == 0 && v2 == v6 && v3 == v7)
  {
    return sub_25A5E8B28(v5, v9);
  }
  return 0;
}

uint64_t sub_25A5F424C(char *a1, char *a2)
{
  return sub_25A5ED1B0(*a1, *a2);
}

uint64_t sub_25A5F4258()
{
  return sub_25A619BE0();
}

uint64_t sub_25A5F4260()
{
  return sub_25A54C5FC();
}

uint64_t sub_25A5F4268()
{
  return sub_25A61B4A0();
}

uint64_t sub_25A5F4270@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A570B50();
  *a1 = result;
  return result;
}

uint64_t sub_25A5F42A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5F3EC4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A5F42D4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A602B58();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A5F4330()
{
  return sub_25A622B20();
}

uint64_t sub_25A5F4398(char a1)
{
  return *(void *)&aKind_1[8 * a1];
}

uint64_t sub_25A5F43B8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25A5ED120(*a1, *a2);
}

uint64_t sub_25A5F43C4()
{
  return sub_25A619C4C();
}

uint64_t sub_25A5F43CC()
{
  return sub_25A54C5A8();
}

uint64_t sub_25A5F43D4()
{
  return sub_25A61B508();
}

uint64_t sub_25A5F43DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A570B50();
  *a1 = result;
  return result;
}

uint64_t sub_25A5F4414@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5F4398(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A5F4440()
{
  return sub_25A5F4398(*v0);
}

uint64_t PreviewTraits.Layout.propertyListValue.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  char v3 = *((unsigned char *)v0 + 16);
  unint64_t v4 = sub_25A5F4BC4();
  sub_25A5F4C18();
  uint64_t result = sub_25A6227A0();
  if ((v3 & 1) == 0)
  {
    unint64_t v8 = v4;
    uint64_t v9 = v1;
    char v10 = 0;
    double v7 = &type metadata for PreviewTraits.Layout.Key;
    v6[0] = 1;
    sub_25A622700();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    unint64_t v8 = v4;
    uint64_t v9 = v2;
    char v10 = 0;
    double v7 = &type metadata for PreviewTraits.Layout.Key;
    v6[0] = 2;
    sub_25A622700();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  return result;
}

uint64_t PreviewTraits.Layout.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = &type metadata for PreviewTraits.Layout.Key;
  unint64_t v5 = sub_25A5F4BC4();
  unint64_t v18 = v5;
  v16[0] = 0;
  sub_25A5F4C18();
  sub_25A622710();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  if ((_BYTE)v15)
  {
    if (v15 != 1)
    {
      uint64_t v17 = &type metadata for PreviewTraits.Layout.Key;
      unint64_t v18 = v5;
      v16[0] = 1;
      sub_25A622710();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
      uint64_t v10 = v15;
      uint64_t v17 = &type metadata for PreviewTraits.Layout.Key;
      unint64_t v18 = v5;
      v16[0] = 2;
      sub_25A622710();
      uint64_t v13 = sub_25A6227C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
      char v12 = 0;
      uint64_t v9 = v14;
      goto LABEL_8;
    }
    uint64_t v8 = sub_25A6227C0();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
    uint64_t v9 = 0;
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v11 = sub_25A6227C0();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
    uint64_t v10 = 0;
    uint64_t v9 = 0;
  }
  char v12 = 1;
LABEL_8:
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v9;
  *(unsigned char *)(a2 + 16) = v12;
  return result;
}

uint64_t PreviewTraits.Layout.hash(into:)()
{
  if (*(unsigned char *)(v0 + 16) == 1) {
    return sub_25A623460();
  }
  sub_25A623460();
  sub_25A623490();
  return sub_25A623490();
}

uint64_t PreviewTraits.Layout.hashValue.getter()
{
  return sub_25A6234A0();
}

uint64_t sub_25A5F485C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewTraits.Layout.init(propertyListValue:)(a1, a2);
}

uint64_t sub_25A5F4874()
{
  return sub_25A6234A0();
}

uint64_t sub_25A5F48CC()
{
  return sub_25A6234A0();
}

BOOL sub_25A5F491C(uint64_t a1, uint64_t a2)
{
  double v3 = *(double *)a1;
  double v2 = *(double *)(a1 + 8);
  double v5 = *(double *)a2;
  double v4 = *(double *)(a2 + 8);
  if (*(unsigned char *)(a1 + 16) == 1)
  {
    uint64_t v6 = *(void *)&v5 | *(void *)&v4;
    if (*(void *)&v3 | *(void *)&v2) {
      BOOL v7 = v6 != 0;
    }
    else {
      BOOL v7 = v6 == 0;
    }
    return *(unsigned char *)(a2 + 16) && v7;
  }
  else
  {
    return (*(unsigned char *)(a2 + 16) & 1) == 0 && v3 == v5 && v2 == v4;
  }
}

PreviewsMessagingOS::PreviewTraits::Orientation_optional __swiftcall PreviewTraits.Orientation.init(rawValue:)(Swift::String rawValue)
{
  double v2 = v1;
  unint64_t v3 = sub_25A6232B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

unint64_t PreviewTraits.Orientation.rawValue.getter()
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

uint64_t sub_25A5F4A84(unsigned __int8 *a1, char *a2)
{
  return sub_25A5E8B28(*a1, *a2);
}

PreviewsMessagingOS::PreviewTraits::Orientation_optional sub_25A5F4A90(Swift::String *a1)
{
  return PreviewTraits.Orientation.init(rawValue:)(*a1);
}

unint64_t sub_25A5F4A9C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PreviewTraits.Orientation.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25A5F4AC4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A602FFC();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A5F4B20()
{
  return sub_25A622B20();
}

uint64_t sub_25A5F4B88()
{
  return sub_25A619CB4();
}

uint64_t sub_25A5F4B90()
{
  return sub_25A54AE34();
}

unsigned char *sub_25A5F4B98(unsigned char *result, char *a2)
{
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 24);
  int v5 = *(unsigned __int8 *)(v2 + 32);
  *unint64_t result = 0;
  char v6 = (v3 | v4) != 0;
  if (v5 != 1) {
    char v6 = 2;
  }
  *a2 = v6;
  return result;
}

unint64_t sub_25A5F4BC4()
{
  unint64_t result = qword_26A42B6D8;
  if (!qword_26A42B6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B6D8);
  }
  return result;
}

unint64_t sub_25A5F4C18()
{
  unint64_t result = qword_26A42B6E0;
  if (!qword_26A42B6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B6E0);
  }
  return result;
}

uint64_t sub_25A5F4C6C()
{
  return sub_25A61B338();
}

uint64_t Explanation.body.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*Explanation.body.modify())()
{
  return nullsub_1;
}

PreviewsMessagingOS::Explanation __swiftcall Explanation.init(body:)(PreviewsMessagingOS::Explanation body)
{
  PreviewsMessagingOS::Explanation *v1 = body;
  return body;
}

uint64_t sub_25A5F4CE0@<X0>(BOOL *a1@<X8>)
{
  return sub_25A56C88C(a1);
}

uint64_t sub_25A5F4CEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5FD54C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t Explanation.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = &type metadata for Explanation.Key;
  unint64_t v10 = sub_25A5F4E18();
  sub_25A622710();
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  if (!v2)
  {
    uint64_t v7 = v12;
    *a2 = v11;
    a2[1] = v7;
  }
  return result;
}

unint64_t sub_25A5F4E18()
{
  unint64_t result = qword_26A42B6E8;
  if (!qword_26A42B6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B6E8);
  }
  return result;
}

uint64_t Explanation.propertyListValue.getter()
{
  return sub_25A6227A0();
}

uint64_t Explanation.description.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static Explanation.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_25A6233B0();
  }
}

uint64_t sub_25A5F4F3C()
{
  return sub_25A6227A0();
}

uint64_t sub_25A5F4FAC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = &type metadata for Explanation.Key;
  unint64_t v10 = sub_25A5F4E18();
  sub_25A622710();
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  if (!v2)
  {
    uint64_t v7 = v12;
    *a2 = v11;
    a2[1] = v7;
  }
  return result;
}

uint64_t static RuntimeLookup.unavailable(explanation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_25A5F50DC(a1, a2, a3);
}

uint64_t type metadata accessor for RuntimeLookup()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t static RuntimeLookup.notLocated(explanation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_25A5F50DC(a1, a2, a3);
}

uint64_t static RuntimeLookup.notSupported(explanation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_25A5F50DC(a1, a2, a3);
}

uint64_t sub_25A5F50DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  type metadata accessor for RuntimeLookup();
  swift_storeEnumTagMultiPayload();

  return swift_bridgeObjectRetain();
}

uint64_t RuntimeLookup.map<A>(_:)@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X2>, void *a3@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (uint64_t *)((char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void *, uint64_t))(v12 + 16))(v11, v13);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
    case 3u:
      uint64_t v15 = v11[1];
      *a3 = *v11;
      a3[1] = v15;
      type metadata accessor for RuntimeLookup();
      return swift_storeEnumTagMultiPayload();
    default:
      (*(void (**)(char *, void *, uint64_t))(v6 + 32))(v9, v11, v5);
      v17(v9);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      if (!v3)
      {
        type metadata accessor for RuntimeLookup();
        return swift_storeEnumTagMultiPayload();
      }
      return result;
  }
}

uint64_t RuntimeLookup.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  uint64_t v8 = *(void *)(a4 + 16);
  v6[8] = v8;
  v6[9] = *(void *)(v8 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = *(void *)(a4 - 8);
  v6[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A5F54CC, 0, 0);
}

uint64_t sub_25A5F54CC()
{
  (*(void (**)(void, void, void))(v0[11] + 16))(v0[12], v0[7], v0[5]);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
    case 3u:
      uint64_t v6 = (uint64_t *)v0[12];
      uint64_t v7 = (void *)v0[2];
      uint64_t v9 = *v6;
      uint64_t v8 = v6[1];
      *uint64_t v7 = v9;
      v7[1] = v8;
      type metadata accessor for RuntimeLookup();
      swift_storeEnumTagMultiPayload();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v10 = (uint64_t (*)(void))v0[1];
      uint64_t result = v10();
      break;
    default:
      uint64_t v1 = (int *)v0[3];
      (*(void (**)(void, void, void))(v0[9] + 32))(v0[10], v0[12], v0[8]);
      uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)v1 + *v1);
      uint64_t v2 = (void *)swift_task_alloc();
      v0[13] = v2;
      void *v2 = v0;
      v2[1] = sub_25A5F56FC;
      uint64_t v3 = v0[10];
      uint64_t v4 = v0[2];
      uint64_t result = v11(v4, v3);
      break;
  }
  return result;
}

uint64_t sub_25A5F56FC()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25A5F58BC;
  }
  else {
    uint64_t v2 = sub_25A5F5810;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A5F5810()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  type metadata accessor for RuntimeLookup();
  swift_storeEnumTagMultiPayload();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25A5F58BC()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t RuntimeLookup.flatMap<A>(_:)@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X2>, void *a3@<X8>)
{
  uint64_t v16 = a1;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t *)((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void *, uint64_t))(v11 + 16))(v10, v12);
  if (swift_getEnumCaseMultiPayload())
  {
    uint64_t v13 = v10[1];
    *a3 = *v10;
    a3[1] = v13;
    type metadata accessor for RuntimeLookup();
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v5 + 32))(v8, v10, v4);
    v16(v8);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

uint64_t RuntimeLookup.flatMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  uint64_t v8 = *(void *)(a4 + 16);
  v6[8] = v8;
  v6[9] = *(void *)(v8 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = *(void *)(a4 - 8);
  v6[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A5F5C48, 0, 0);
}

uint64_t sub_25A5F5C48()
{
  (*(void (**)(void, void, void))(v0[11] + 16))(v0[12], v0[7], v0[5]);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
    case 3u:
      uint64_t v6 = (uint64_t *)v0[12];
      uint64_t v7 = (void *)v0[2];
      uint64_t v9 = *v6;
      uint64_t v8 = v6[1];
      *uint64_t v7 = v9;
      v7[1] = v8;
      type metadata accessor for RuntimeLookup();
      swift_storeEnumTagMultiPayload();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v10 = (uint64_t (*)(void))v0[1];
      uint64_t result = v10();
      break;
    default:
      uint64_t v1 = (int *)v0[3];
      (*(void (**)(void, void, void))(v0[9] + 32))(v0[10], v0[12], v0[8]);
      uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)v1 + *v1);
      uint64_t v2 = (void *)swift_task_alloc();
      v0[13] = v2;
      void *v2 = v0;
      v2[1] = sub_25A5F5E78;
      uint64_t v3 = v0[10];
      uint64_t v4 = v0[2];
      uint64_t result = v11(v4, v3);
      break;
  }
  return result;
}

uint64_t sub_25A5F5E78()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25A603140;
  }
  else {
    uint64_t v2 = sub_25A5F5F8C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A5F5F8C()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t RuntimeLookup.availableValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = (uint64_t *)((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v6 + 16))(v5);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v8 = *v5;
      uint64_t v9 = v5[1];
      type metadata accessor for RuntimeLookup.NoValueError();
      swift_getWitnessTable();
      swift_allocError();
      *uint64_t v10 = 0xD000000000000010;
      uint64_t v11 = "Item unavailable";
      goto LABEL_6;
    case 2u:
      uint64_t v8 = *v5;
      uint64_t v9 = v5[1];
      type metadata accessor for RuntimeLookup.NoValueError();
      swift_getWitnessTable();
      swift_allocError();
      *uint64_t v10 = 0xD000000000000010;
      uint64_t v11 = "Item not located";
      goto LABEL_6;
    case 3u:
      uint64_t v8 = *v5;
      uint64_t v9 = v5[1];
      type metadata accessor for RuntimeLookup.NoValueError();
      swift_getWitnessTable();
      swift_allocError();
      *uint64_t v10 = 0xD000000000000012;
      uint64_t v11 = "Item not supported";
LABEL_6:
      v10[1] = (unint64_t)(v11 - 32) | 0x8000000000000000;
      v10[2] = v8;
      v10[3] = v9;
      uint64_t result = swift_willThrow();
      break;
    default:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)(*(void *)(a1 + 16) - 8) + 32))(a2, v5);
      break;
  }
  return result;
}

uint64_t type metadata accessor for RuntimeLookup.NoValueError()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25A5F629C()
{
  uint64_t v0 = sub_25A585104();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_25A5F62D4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F55A28](a1, WitnessTable);
}

uint64_t sub_25A5F6328(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F55A08](a1, WitnessTable);
}

uint64_t RuntimeLookup.description.getter(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v10 = 0x616C696176616E55;
      unsigned int v11 = 979725410;
      goto LABEL_6;
    case 2u:
      uint64_t v10 = 0x61636F6C20746F4ELL;
      unsigned int v11 = 979658100;
LABEL_6:
      uint64_t v13 = v10;
      unint64_t v14 = v11 | 0xED00002000000000;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 3u:
      uint64_t v13 = 0;
      unint64_t v14 = 0xE000000000000000;
      sub_25A623210();
      swift_bridgeObjectRelease();
      uint64_t v13 = 0x7070757320746F4ELL;
      unint64_t v14 = 0xEF203A646574726FLL;
      swift_bridgeObjectRetain();
LABEL_7:
      sub_25A622E00();
      swift_bridgeObjectRelease_n();
      uint64_t v9 = v13;
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v7, v1);
      uint64_t v13 = 0;
      unint64_t v14 = 0xE000000000000000;
      sub_25A623380();
      uint64_t v9 = v13;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
      break;
  }
  return v9;
}

uint64_t sub_25A5F660C(char a1)
{
  return *(void *)&aLocated_0[8 * a1];
}

uint64_t sub_25A5F6630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D338];

  return MEMORY[0x270F9F940](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_25A5F66A4(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAE8](a1, a2, WitnessTable, v5);
}

uint64_t sub_25A5F6710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAF8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_25A5F6780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAF0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_25A5F67F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A5D65C0();
  *a1 = result;
  return result;
}

uint64_t sub_25A5F6830@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25A5F6C54(a1, (uint64_t (*)(void, void, void))sub_25A5F660C, a2);
}

uint64_t sub_25A5F6848(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, WitnessTable, v5);
}

uint64_t sub_25A5F68BC()
{
  return sub_25A622B20();
}

uint64_t sub_25A5F6938(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v2 + 16))(v4);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  return EnumCaseMultiPayload;
}

uint64_t sub_25A5F6A1C(char a1)
{
  return *(void *)&aDiscrimilocate[8 * a1];
}

uint64_t sub_25A5F6A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D338];

  return MEMORY[0x270F9F940](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_25A5F6AB0(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAE8](a1, a2, WitnessTable, v5);
}

uint64_t sub_25A5F6B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAF8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_25A5F6B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAF0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_25A5F6BFC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A5D65C0();
  *a1 = result;
  return result;
}

uint64_t sub_25A5F6C3C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25A5F6C54(a1, (uint64_t (*)(void, void, void))sub_25A5F6A1C, a2);
}

uint64_t sub_25A5F6C54@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void, void, void)@<X2>, uint64_t *a3@<X8>)
{
  uint64_t result = a2(*v3, *(void *)(a1 + 16), *(void *)(a1 + 24));
  *a3 = result;
  a3[1] = v6;
  return result;
}

uint64_t sub_25A5F6C8C()
{
  return sub_25A5F6A1C(*v0);
}

uint64_t RuntimeLookup<A>.propertyListValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4299B8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v35 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = sub_25A623180();
  uint64_t v33 = *(void *)(v10 - 8);
  uint64_t v34 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v30 = (char *)&v29 - v12;
  uint64_t v32 = *(void *)(v9 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v31 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (uint64_t *)((char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v37 = v9;
  uint64_t v38 = a2;
  uint64_t v39 = v3;
  uint64_t v18 = _s3KeyOMa_2();
  _s12DiscriminantOMa();
  uint64_t WitnessTable = swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v36 = a3;
  sub_25A6227A0();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 16))(v17, v3, a1);
  if (swift_getEnumCaseMultiPayload())
  {
    uint64_t v20 = v17[1];
    uint64_t v43 = *v17;
    uint64_t v21 = v43;
    uint64_t v44 = v20;
    uint64_t v41 = v18;
    uint64_t v42 = WitnessTable;
    LOBYTE(v40[0]) = 2;
    sub_25A5F71E0();
    sub_25A622700();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    v40[0] = 0x616C696176616E75;
    v40[1] = 0xEB00000000656C62;
    v40[2] = v21;
    uint64_t v41 = v20;
    type metadata accessor for RuntimeLookup.NoValueError();
    swift_getWitnessTable();
    uint64_t v22 = (uint64_t)v35;
    sub_25A622980();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_25A6227C0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 0, 1, v23);
    uint64_t v41 = v18;
    uint64_t v42 = WitnessTable;
    LOBYTE(v40[0]) = 3;
    sub_25A622700();
    sub_25A570C60(v22, &qword_26A4299B8);
  }
  else
  {
    uint64_t v24 = v32;
    uint64_t v25 = WitnessTable;
    uint64_t v26 = v31;
    (*(void (**)(char *, uint64_t *, uint64_t))(v32 + 32))(v31, v17, v9);
    unint64_t v27 = v30;
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v30, v26, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v27, 0, 1, v9);
    uint64_t v41 = v18;
    uint64_t v42 = v25;
    LOBYTE(v40[0]) = 1;
    sub_25A622700();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v27, v34);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v9);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
}

uint64_t sub_25A5F7168(unsigned char *a1, unsigned char *a2)
{
  *a1 = 0;
  uint64_t v3 = type metadata accessor for RuntimeLookup();
  uint64_t result = sub_25A5F6938(v3);
  *a2 = result;
  return result;
}

uint64_t _s3KeyOMa_2()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t _s12DiscriminantOMa()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_25A5F71E0()
{
  unint64_t result = qword_26A42B700;
  if (!qword_26A42B700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B700);
  }
  return result;
}

uint64_t RuntimeLookup<A>.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = type metadata accessor for RuntimeLookup();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v38 = v3;
  uint64_t v39 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v37 = (unint64_t *)((char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v41 = (unint64_t *)((char *)&v36 - v8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (unint64_t *)((char *)&v36 - v10);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (unint64_t *)((char *)&v36 - v12);
  uint64_t v14 = _s3KeyOMa_2();
  uint64_t v46 = v14;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v47 = WitnessTable;
  v45[0] = 0;
  _s12DiscriminantOMa();
  swift_getWitnessTable();
  uint64_t v16 = a1;
  uint64_t v17 = v42;
  sub_25A622710();
  if (v17)
  {
    uint64_t v18 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(a1, v18);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  }
  else
  {
    uint64_t v42 = v11;
    uint64_t v19 = v41;
    uint64_t v20 = v16;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
    switch(v48)
    {
      case 1:
        uint64_t v46 = v14;
        uint64_t v47 = WitnessTable;
        v45[0] = 2;
        sub_25A5F71E0();
        sub_25A622760();
        uint64_t v32 = v39;
        uint64_t v31 = v40;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
        if (v44) {
          unint64_t v22 = v43;
        }
        else {
          unint64_t v22 = 0xD000000000000019;
        }
        if (v44) {
          unint64_t v23 = v44;
        }
        else {
          unint64_t v23 = 0x800000025A637DD0;
        }
        uint64_t v24 = sub_25A6227C0();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v16, v24);
        uint64_t v21 = v42;
        *uint64_t v42 = v22;
        v21[1] = v23;
        uint64_t v30 = v38;
        goto LABEL_26;
      case 2:
        uint64_t v21 = v19;
        uint64_t v46 = v14;
        uint64_t v47 = WitnessTable;
        v45[0] = 2;
        sub_25A5F71E0();
        sub_25A622760();
        uint64_t v32 = v39;
        uint64_t v31 = v40;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
        if (v44) {
          unint64_t v25 = v43;
        }
        else {
          unint64_t v25 = 0xD000000000000019;
        }
        if (v44) {
          unint64_t v26 = v44;
        }
        else {
          unint64_t v26 = 0x800000025A637DD0;
        }
        uint64_t v27 = sub_25A6227C0();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8))(v20, v27);
        *uint64_t v19 = v25;
        v19[1] = v26;
        uint64_t v30 = v38;
        goto LABEL_26;
      case 3:
        uint64_t v46 = v14;
        uint64_t v47 = WitnessTable;
        v45[0] = 2;
        sub_25A5F71E0();
        sub_25A622760();
        uint64_t v32 = v39;
        uint64_t v31 = v40;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
        if (v44) {
          unint64_t v33 = v43;
        }
        else {
          unint64_t v33 = 0xD000000000000019;
        }
        if (v44) {
          unint64_t v34 = v44;
        }
        else {
          unint64_t v34 = 0x800000025A637DD0;
        }
        uint64_t v35 = sub_25A6227C0();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(v16, v35);
        uint64_t v21 = v37;
        *uint64_t v37 = v33;
        v21[1] = v34;
        uint64_t v30 = v38;
LABEL_26:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        uint64_t v46 = v14;
        uint64_t v47 = WitnessTable;
        v45[0] = 1;
        uint64_t v21 = v13;
        sub_25A622710();
        uint64_t v29 = sub_25A6227C0();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(v20, v29);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
        uint64_t v30 = v38;
        swift_storeEnumTagMultiPayload();
        uint64_t v32 = v39;
        uint64_t v31 = v40;
        break;
    }
    return (*(uint64_t (**)(uint64_t, unint64_t *, uint64_t))(v32 + 32))(v31, v21, v30);
  }
}

uint64_t sub_25A5F77FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return RuntimeLookup<A>.propertyListValue.getter(a1, *(void *)(a2 - 8), a3);
}

uint64_t sub_25A5F7804@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return RuntimeLookup<A>.init(propertyListValue:)(a1, a2);
}

void PreviewMetadata.contentDomain.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *PreviewMetadata.contentDomain.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*PreviewMetadata.contentDomain.modify())()
{
  return nullsub_1;
}

uint64_t PreviewMetadata.contentCategory.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  *a1 = *(void *)(v1 + 8);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t PreviewMetadata.contentCategory.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v3;
  return result;
}

uint64_t (*PreviewMetadata.contentCategory.modify())()
{
  return nullsub_1;
}

uint64_t PreviewMetadata.supportsOnDevice.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t PreviewMetadata.supportsOnDevice.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

uint64_t (*PreviewMetadata.supportsOnDevice.modify())()
{
  return nullsub_1;
}

uint64_t PreviewMetadata.supportsInteractive.getter()
{
  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t PreviewMetadata.supportsInteractive.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 25) = result;
  return result;
}

uint64_t (*PreviewMetadata.supportsInteractive.modify())()
{
  return nullsub_1;
}

__n128 PreviewMetadata.requestedTraits.getter@<Q0>(__n128 *a1@<X8>)
{
  unsigned __int8 v2 = v1[3].n128_u8[0];
  unsigned __int8 v3 = v1[3].n128_u8[1];
  __n128 result = v1[2];
  *a1 = result;
  a1[1].n128_u8[0] = v2;
  a1[1].n128_u8[1] = v3;
  return result;
}

__n128 PreviewMetadata.requestedTraits.setter(__n128 *a1)
{
  unsigned __int8 v2 = a1[1].n128_u8[0];
  unsigned __int8 v3 = a1[1].n128_u8[1];
  __n128 result = *a1;
  v1[2] = *a1;
  v1[3].n128_u8[0] = v2;
  v1[3].n128_u8[1] = v3;
  return result;
}

uint64_t (*PreviewMetadata.requestedTraits.modify())()
{
  return nullsub_1;
}

uint64_t PreviewMetadata.isPreviewGroup.getter()
{
  return *(unsigned __int8 *)(v0 + 50);
}

uint64_t PreviewMetadata.isPreviewGroup.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 50) = result;
  return result;
}

uint64_t (*PreviewMetadata.isPreviewGroup.modify())()
{
  return nullsub_1;
}

uint64_t PreviewMetadata.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewMetadata.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return result;
}

uint64_t (*PreviewMetadata.displayName.modify())()
{
  return nullsub_1;
}

__n128 PreviewMetadata.init(contentDomain:contentCategory:supportsOnDevice:supportsInteractive:requestedTraits:isPreviewGroup:displayName:)@<Q0>(unsigned __int8 *a1@<X0>, unint64_t *a2@<X1>, unsigned __int8 a3@<W2>, unsigned __int8 a4@<W3>, __n128 *a5@<X4>, unsigned __int8 a6@<W5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>)
{
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  unsigned __int8 v11 = a5[1].n128_u8[0];
  unsigned __int8 v12 = a5[1].n128_u8[1];
  a9->n128_u8[0] = *a1;
  a9->n128_u64[1] = v9;
  a9[1].n128_u64[0] = v10;
  a9[1].n128_u8[8] = a3;
  a9[1].n128_u8[9] = a4;
  __n128 result = *a5;
  a9[2] = *a5;
  a9[3].n128_u8[0] = v11;
  a9[3].n128_u8[1] = v12;
  a9[3].n128_u8[2] = a6;
  a9[3].n128_u64[1] = a7;
  a9[4].n128_u64[0] = a8;
  return result;
}

unint64_t sub_25A5F7A68(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x43746E65746E6F63;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0x6574736575716572;
      break;
    case 5:
      unint64_t result = 0x6569766572507369;
      break;
    case 6:
      unint64_t result = 0x4E79616C70736964;
      break;
    default:
      unint64_t result = 0x44746E65746E6F63;
      break;
  }
  return result;
}

uint64_t sub_25A5F7B8C(unsigned __int8 *a1, char *a2)
{
  return sub_25A5EBC78(*a1, *a2);
}

uint64_t sub_25A5F7B98()
{
  return sub_25A61C054();
}

uint64_t sub_25A5F7BA4()
{
  return sub_25A54BA68();
}

uint64_t sub_25A5F7BAC()
{
  return sub_25A61C054();
}

uint64_t sub_25A5F7BB4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A602BF8();
  *a1 = result;
  return result;
}

unint64_t sub_25A5F7BEC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A5F7A68(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A5F7C18()
{
  return sub_25A5F7A68(*v0);
}

uint64_t PreviewMetadata.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A5F7C78(char *a1)
{
  char v1 = *a1;
  uint64_t v2 = *((void *)a1 + 1);
  uint64_t v3 = *((void *)a1 + 2);
  char v4 = a1[24];
  char v5 = a1[25];
  uint64_t v6 = *((void *)a1 + 4);
  uint64_t v7 = *((void *)a1 + 5);
  __int16 v8 = a1[48];
  char v9 = a1[50];
  __int16 v10 = a1[49];
  sub_25A55C73C((uint64_t)(a1 + 56), (uint64_t)v26, &qword_26A429458);
  char v25 = 0;
  char v24 = v1;
  char v23 = 1;
  uint64_t v21 = v2;
  uint64_t v22 = v3;
  char v20 = 2;
  char v19 = v4;
  char v18 = 3;
  char v17 = v5;
  char v16 = 4;
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  __int16 v15 = v8 | (v10 << 8);
  v12[23] = 5;
  v12[22] = v9;
  v12[21] = 6;
  sub_25A55C73C((uint64_t)v26, (uint64_t)v12, &qword_26A429458);
  sub_25A5F8184();
  sub_25A5C3110();
  sub_25A572594();
  sub_25A5F81D8();
  return sub_25A622A30();
}

uint64_t sub_25A5F7E38()
{
  return sub_25A5F7C78(*(char **)(v0 + 16));
}

uint64_t PreviewMetadata.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v20 = &type metadata for PreviewMetadata.Key;
  unint64_t v5 = sub_25A5F8184();
  unint64_t v21 = v5;
  v19[0] = 0;
  sub_25A5C3110();
  sub_25A622710();
  if (v2)
  {
    uint64_t v7 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    char v6 = v25;
    char v20 = &type metadata for PreviewMetadata.Key;
    unint64_t v21 = v5;
    v19[0] = 1;
    sub_25A572594();
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    char v20 = &type metadata for PreviewMetadata.Key;
    unint64_t v21 = v5;
    v19[0] = 2;
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    int v8 = v24;
    char v20 = &type metadata for PreviewMetadata.Key;
    unint64_t v21 = v5;
    v19[0] = 3;
    sub_25A622710();
    int v22 = v8;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    LOBYTE(v8) = v23;
    char v20 = &type metadata for PreviewMetadata.Key;
    unint64_t v21 = v5;
    v19[0] = 4;
    sub_25A5F81D8();
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    char v20 = &type metadata for PreviewMetadata.Key;
    unint64_t v21 = v5;
    v19[0] = 5;
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    char v20 = &type metadata for PreviewMetadata.Key;
    unint64_t v21 = v5;
    v19[0] = 6;
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    uint64_t v9 = sub_25A6227C0();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
    *(unsigned char *)a2 = v6;
    *(void *)(a2 + 8) = v17;
    *(void *)(a2 + 16) = v18;
    *(unsigned char *)(a2 + 24) = v22;
    *(unsigned char *)(a2 + 25) = v8;
    *(void *)(a2 + 32) = v13;
    *(void *)(a2 + 40) = v14;
    *(unsigned char *)(a2 + 48) = v15;
    *(unsigned char *)(a2 + 49) = v16;
    *(unsigned char *)(a2 + 50) = v11 & 1;
    *(void *)(a2 + 56) = v11;
    *(void *)(a2 + 64) = v12;
  }
  return result;
}

unint64_t sub_25A5F8184()
{
  unint64_t result = qword_26A42B708;
  if (!qword_26A42B708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B708);
  }
  return result;
}

unint64_t sub_25A5F81D8()
{
  unint64_t result = qword_26A42B710;
  if (!qword_26A42B710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B710);
  }
  return result;
}

uint64_t PreviewMetadata.hash(into:)()
{
  int v1 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 64);
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  sub_25A623470();
  sub_25A623470();
  sub_25A623460();
  if (v1 != 1)
  {
    sub_25A623490();
    sub_25A623490();
  }
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  sub_25A623470();
  if (!v2) {
    return sub_25A623470();
  }
  sub_25A623470();
  swift_bridgeObjectRetain();
  sub_25A622DF0();

  return swift_bridgeObjectRelease();
}

uint64_t PreviewMetadata.hashValue.getter()
{
  return sub_25A6234A0();
}

uint64_t sub_25A5F84EC()
{
  return sub_25A622780();
}

uint64_t sub_25A5F8544@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewMetadata.init(propertyListValue:)(a1, a2);
}

uint64_t sub_25A5F855C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A5F85EC()
{
  return sub_25A6234A0();
}

uint64_t PlaygroundMetadata.displayName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PlaygroundMetadata.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PlaygroundMetadata.displayName.modify())()
{
  return nullsub_1;
}

PreviewsMessagingOS::PlaygroundMetadata __swiftcall PlaygroundMetadata.init(displayName:)(PreviewsMessagingOS::PlaygroundMetadata displayName)
{
  PreviewsMessagingOS::PlaygroundMetadata *v1 = displayName;
  return displayName;
}

uint64_t static PlaygroundMetadata.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      BOOL v5 = *a1 == *a2 && v3 == v4;
      if (v5 || (sub_25A6233B0() & 1) != 0) {
        return 1;
      }
    }
  }
  else if (!v4)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_25A5F8770@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25A602C40(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25A5F879C()
{
  return 0;
}

uint64_t sub_25A5F87A8(uint64_t a1)
{
  unint64_t v2 = sub_25A5FD804();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25A5F87E4(uint64_t a1)
{
  unint64_t v2 = sub_25A5FD804();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PlaygroundMetadata.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B718);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  BOOL v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25A5FD804();
  sub_25A6234D0();
  sub_25A623320();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t PlaygroundMetadata.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B728);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25A5FD804();
  sub_25A6234C0();
  if (!v2)
  {
    uint64_t v9 = sub_25A6232E0();
    uint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25A5F8AC8(char a1)
{
  if (a1) {
    return 0x7272457765726874;
  }
  else {
    return 0x6F4E646574697865;
  }
}

uint64_t sub_25A5F8B10@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return PlaygroundMetadata.init(from:)(a1, a2);
}

uint64_t sub_25A5F8B28(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B718);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25A5FD804();
  sub_25A6234D0();
  sub_25A623320();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_25A5F8C60(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      BOOL v5 = *a1 == *a2 && v3 == v4;
      if (v5 || (sub_25A6233B0() & 1) != 0) {
        return 1;
      }
    }
  }
  else if (!v4)
  {
    return 1;
  }
  return 0;
}

BOOL sub_25A5F8CBC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25A5F8CD4()
{
  return sub_25A5F8AC8(*v0);
}

uint64_t sub_25A5F8CDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25A602CF8(a1, a2);
  *a3 = result;
  return result;
}

void sub_25A5F8D04(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25A5F8D10(uint64_t a1)
{
  unint64_t v2 = sub_25A5FD858();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25A5F8D4C(uint64_t a1)
{
  unint64_t v2 = sub_25A5FD858();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25A5F8D88@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_25A5F8DB8(uint64_t a1)
{
  unint64_t v2 = sub_25A5FD900();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25A5F8DF4(uint64_t a1)
{
  unint64_t v2 = sub_25A5FD900();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25A5F8E30()
{
  return sub_25A6234A0();
}

uint64_t sub_25A5F8E74()
{
  return sub_25A623460();
}

uint64_t sub_25A5F8E9C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A5F8EE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25A602E04(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25A5F8F0C(uint64_t a1)
{
  unint64_t v2 = sub_25A5FD8AC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25A5F8F48(uint64_t a1)
{
  unint64_t v2 = sub_25A5FD8AC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PlaygroundEvent.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B730);
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  MEMORY[0x270FA5388](v3);
  BOOL v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B738);
  uint64_t v18 = *(void *)(v6 - 8);
  uint64_t v19 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v17 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B740);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v1[1];
  uint64_t v20 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25A5FD858();
  sub_25A6234D0();
  if (v12)
  {
    char v24 = 1;
    sub_25A5FD8AC();
    sub_25A623310();
    uint64_t v13 = v22;
    sub_25A623330();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v13);
  }
  else
  {
    char v23 = 0;
    sub_25A5FD900();
    char v15 = v17;
    sub_25A623310();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v19);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t PlaygroundEvent.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B760);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  uint64_t v31 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B768);
  uint64_t v34 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B770);
  uint64_t v33 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25A5FD858();
  uint64_t v13 = v35;
  sub_25A6234C0();
  if (v13) {
    goto LABEL_7;
  }
  uint64_t v14 = v34;
  uint64_t v29 = v7;
  uint64_t v35 = a1;
  uint64_t v15 = sub_25A623300();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_25A623250();
    swift_allocError();
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B778);
    *uint64_t v22 = &type metadata for PlaygroundEvent;
    sub_25A6232D0();
    sub_25A623240();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v10);
    a1 = v35;
LABEL_7:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  if (*(unsigned char *)(v15 + 32))
  {
    char v37 = 1;
    sub_25A5FD8AC();
    sub_25A6232C0();
    uint64_t v16 = v30;
    uint64_t v17 = sub_25A6232F0();
    uint64_t v18 = v6;
    uint64_t v19 = v33;
    uint64_t v26 = v25;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v18, v16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v12, v10);
  }
  else
  {
    char v36 = 0;
    sub_25A5FD900();
    sub_25A6232C0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v10);
    uint64_t v17 = 0;
    uint64_t v26 = 0;
  }
  uint64_t v27 = v32;
  *uint64_t v32 = v17;
  v27[1] = v26;
  uint64_t v23 = (uint64_t)v35;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_25A5F9718@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return PlaygroundEvent.init(from:)(a1, a2);
}

uint64_t sub_25A5F9730(void *a1)
{
  return PlaygroundEvent.encode(to:)(a1);
}

uint64_t IOSurfacePayload.surfaceID.getter()
{
  return *v0;
}

double IOSurfacePayload.scaleFactor.getter()
{
  return *(double *)(v0 + 8);
}

double IOSurfacePayload.width.getter()
{
  return *(double *)(v0 + 16);
}

double IOSurfacePayload.height.getter()
{
  return *(double *)(v0 + 24);
}

uint64_t IOSurfacePayload.selectableRegions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t IOSurfacePayload.init(surfaceID:scaleFactor:width:height:selectableRegions:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>)
{
  *(_DWORD *)a3 = result;
  *(double *)(a3 + 8) = a4;
  *(double *)(a3 + 16) = a5;
  *(double *)(a3 + 24) = a6;
  *(void *)(a3 + 32) = a2;
  return result;
}

unint64_t sub_25A5F9784(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x636146656C616373;
      break;
    case 2:
      unint64_t result = 0x6874646977;
      break;
    case 3:
      unint64_t result = 0x746867696568;
      break;
    case 4:
      return result;
    default:
      unint64_t result = 0x4965636166727573;
      break;
  }
  return result;
}

uint64_t sub_25A5F983C(unsigned __int8 *a1, char *a2)
{
  return sub_25A5EB608(*a1, *a2);
}

uint64_t sub_25A5F9848()
{
  return sub_25A619D9C();
}

uint64_t sub_25A5F9850()
{
  return sub_25A54B6E8();
}

uint64_t sub_25A5F9858()
{
  return sub_25A61C358();
}

uint64_t sub_25A5F9860@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A602EBC();
  *a1 = result;
  return result;
}

unint64_t sub_25A5F9890@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A5F9784(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A5F98BC()
{
  return sub_25A5F9784(*v0);
}

uint64_t IOSurfacePayload.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A5F9914()
{
  return sub_25A622A50();
}

uint64_t IOSurfacePayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = &type metadata for IOSurfacePayload.Key;
  unint64_t v5 = sub_25A5FD95C();
  unint64_t v16 = v5;
  v14[0] = 0;
  sub_25A622710();
  if (v2)
  {
    uint64_t v7 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    int v6 = v17;
    uint64_t v15 = &type metadata for IOSurfacePayload.Key;
    unint64_t v16 = v5;
    v14[0] = 1;
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    uint64_t v15 = &type metadata for IOSurfacePayload.Key;
    unint64_t v16 = v5;
    v14[0] = 2;
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    uint64_t v15 = &type metadata for IOSurfacePayload.Key;
    unint64_t v16 = v5;
    v14[0] = 3;
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    uint64_t v15 = &type metadata for IOSurfacePayload.Key;
    unint64_t v16 = v5;
    v14[0] = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42B600);
    sub_25A5EEC88(&qword_26A42B610, &qword_26A42B600, (void (*)(void))sub_25A5EF348);
    sub_25A622710();
    uint64_t v8 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    *(_DWORD *)a2 = v6;
    *(void *)(a2 + 8) = v13;
    *(void *)(a2 + 16) = v12;
    *(void *)(a2 + 24) = v11;
    *(void *)(a2 + 32) = v10;
  }
  return result;
}

uint64_t sub_25A5F9CB4()
{
  return sub_25A622780();
}

uint64_t sub_25A5F9D04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return IOSurfacePayload.init(propertyListValue:)(a1, a2);
}

uint64_t PreviewDescription.index.getter()
{
  return *(void *)v0;
}

uint64_t PreviewDescription.index.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*PreviewDescription.index.modify())()
{
  return nullsub_1;
}

uint64_t PreviewDescription.contentType.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewDescription.contentType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*PreviewDescription.contentType.modify())()
{
  return nullsub_1;
}

uint64_t PreviewDescription.device.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewDescription.device.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*PreviewDescription.device.modify())()
{
  return nullsub_1;
}

uint64_t PreviewDescription.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewDescription.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*PreviewDescription.displayName.modify())()
{
  return nullsub_1;
}

__n128 PreviewDescription.layout.getter@<Q0>(__n128 *a1@<X8>)
{
  unsigned __int8 v2 = *(unsigned char *)(v1 + 72);
  __n128 result = *(__n128 *)(v1 + 56);
  *a1 = result;
  a1[1].n128_u8[0] = v2;
  return result;
}

__n128 PreviewDescription.layout.setter(__n128 *a1)
{
  unsigned __int8 v2 = a1[1].n128_u8[0];
  __n128 result = *a1;
  *(__n128 *)(v1 + 56) = *a1;
  *(unsigned char *)(v1 + 72) = v2;
  return result;
}

uint64_t (*PreviewDescription.layout.modify())()
{
  return nullsub_1;
}

void PreviewDescription.contentDomain.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 73);
}

unsigned char *PreviewDescription.contentDomain.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 73) = *result;
  return result;
}

uint64_t (*PreviewDescription.contentDomain.modify())()
{
  return nullsub_1;
}

uint64_t PreviewDescription.supportsLive.getter()
{
  return *(unsigned __int8 *)(v0 + 74);
}

uint64_t PreviewDescription.supportsLive.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 74) = result;
  return result;
}

uint64_t (*PreviewDescription.supportsLive.modify())()
{
  return nullsub_1;
}

uint64_t PreviewDescription.supportsOnDevice.getter()
{
  return *(unsigned __int8 *)(v0 + 75);
}

uint64_t PreviewDescription.supportsOnDevice.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 75) = result;
  return result;
}

uint64_t (*PreviewDescription.supportsOnDevice.modify())()
{
  return nullsub_1;
}

void PreviewDescription.interfaceOrientation.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 76);
}

unsigned char *PreviewDescription.interfaceOrientation.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 76) = *result;
  return result;
}

uint64_t (*PreviewDescription.interfaceOrientation.modify())()
{
  return nullsub_1;
}

uint64_t PreviewDescription.contentCategory.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 88);
  *a1 = *(void *)(v1 + 80);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t PreviewDescription.contentCategory.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = v2;
  *(void *)(v1 + 88) = v3;
  return result;
}

uint64_t (*PreviewDescription.contentCategory.modify())()
{
  return nullsub_1;
}

__n128 PreviewDescription.init(index:contentType:device:displayName:layout:contentDomain:supportsLive:supportsOnDevice:interfaceOrientation:contentCategory:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, __n128 *a8@<X7>, uint64_t a9@<X8>, char *a10, char a11, char a12, char *a13, uint64_t *a14)
{
  unsigned __int8 v14 = a8[1].n128_u8[0];
  char v15 = *a10;
  char v16 = *a13;
  uint64_t v18 = *a14;
  uint64_t v17 = a14[1];
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  __n128 result = *a8;
  *(__n128 *)(a9 + 56) = *a8;
  *(unsigned char *)(a9 + 72) = v14;
  *(unsigned char *)(a9 + 73) = v15;
  *(unsigned char *)(a9 + 74) = a11;
  *(unsigned char *)(a9 + 75) = a12;
  *(unsigned char *)(a9 + 76) = v16;
  *(void *)(a9 + 80) = v18;
  *(void *)(a9 + 88) = v17;
  return result;
}

uint64_t sub_25A5FA0B0(char a1)
{
  uint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x6E65746E6F63;
      goto LABEL_8;
    case 2:
      uint64_t result = 0x656369766564;
      break;
    case 3:
      uint64_t result = 0x4E79616C70736964;
      break;
    case 4:
      uint64_t result = 0x74756F79616CLL;
      break;
    case 5:
      uint64_t v3 = 0x7865746E6F63;
LABEL_8:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x5474000000000000;
      break;
    case 6:
      uint64_t result = 0x7374726F70707573;
      break;
    case 7:
      return result;
    case 8:
      uint64_t result = 0xD000000000000014;
      break;
    case 9:
      uint64_t result = 0xD000000000000015;
      break;
    default:
      uint64_t result = 0x7865646E69;
      break;
  }
  return result;
}

uint64_t sub_25A5FA1F0(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = sub_25A5FA0B0(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_25A5FA0B0(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25A6233B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25A5FA27C()
{
  char v1 = *v0;
  sub_25A623450();
  sub_25A5FA0B0(v1);
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  return sub_25A6234A0();
}

uint64_t sub_25A5FA2E0()
{
  sub_25A5FA0B0(*v0);
  sub_25A622DF0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25A5FA334()
{
  char v1 = *v0;
  sub_25A623450();
  sub_25A5FA0B0(v1);
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  return sub_25A6234A0();
}

uint64_t sub_25A5FA394@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A602F08();
  *a1 = result;
  return result;
}

uint64_t sub_25A5FA3C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A5FA0B0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A5FA3F0()
{
  return sub_25A5FA0B0(*v0);
}

void sub_25A5FA3F8(void *a1@<X8>)
{
  *a1 = &unk_27083CF78;
}

uint64_t PreviewDescription.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A5FA460(void *a1)
{
  char v1 = a1;
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  sub_25A55C73C((uint64_t)(a1 + 3), (uint64_t)v29, &qword_26A429458);
  sub_25A55C73C((uint64_t)(v1 + 5), (uint64_t)v28, &qword_26A429458);
  uint64_t v5 = v1[7];
  uint64_t v6 = v1[8];
  char v7 = *((unsigned char *)v1 + 72);
  char v8 = *((unsigned char *)v1 + 73);
  char v9 = *((unsigned char *)v1 + 74);
  char v12 = *((unsigned char *)v1 + 75);
  uint64_t v10 = (uint64_t)(v1 + 10);
  LOBYTE(v1) = *((unsigned char *)v1 + 76);
  sub_25A55C73C(v10, (uint64_t)v27, &qword_26A42BB78);
  char v26 = 0;
  uint64_t v24 = v2;
  char v25 = 0;
  char v23 = 1;
  uint64_t v21 = v3;
  uint64_t v22 = v4;
  v20[23] = 2;
  sub_25A55C73C((uint64_t)v29, (uint64_t)v20, &qword_26A429458);
  v19[23] = 3;
  sub_25A55C73C((uint64_t)v28, (uint64_t)v19, &qword_26A429458);
  char v18 = 4;
  uint64_t v14 = v5;
  uint64_t v15 = v6;
  char v16 = v7;
  char v17 = 0;
  v13[31] = 5;
  v13[30] = v8;
  v13[29] = 6;
  v13[28] = v9;
  v13[27] = 7;
  v13[26] = v12;
  v13[25] = 8;
  unsigned char v13[24] = (_BYTE)v1;
  v13[23] = 9;
  sub_25A55C73C((uint64_t)v27, (uint64_t)v13, &qword_26A42BB78);
  sub_25A5FD9B8();
  sub_25A5F3B00();
  sub_25A5C3110();
  sub_25A5B064C();
  sub_25A572594();
  return sub_25A622A10();
}

uint64_t PreviewDescription.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v17 = &type metadata for PreviewDescription.Key;
  unint64_t v5 = sub_25A5FD9B8();
  unint64_t v18 = v5;
  v16[0] = 0;
  sub_25A622710();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    char v17 = &type metadata for PreviewDescription.Key;
    unint64_t v18 = v5;
    v16[0] = 1;
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    char v17 = &type metadata for PreviewDescription.Key;
    unint64_t v18 = v5;
    v16[0] = 2;
    swift_bridgeObjectRetain();
    sub_25A622760();
    uint64_t v19 = v14;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    char v17 = &type metadata for PreviewDescription.Key;
    unint64_t v18 = v5;
    v16[0] = 3;
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    char v17 = &type metadata for PreviewDescription.Key;
    unint64_t v18 = v5;
    v16[0] = 4;
    sub_25A5F3B00();
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    char v17 = &type metadata for PreviewDescription.Key;
    unint64_t v18 = v5;
    v16[0] = 5;
    sub_25A5C3110();
    sub_25A622760();
    uint64_t v8 = v19;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    char v9 = v13;
    if (v13 == 3) {
      char v9 = 0;
    }
    char v12 = v9;
    char v17 = &type metadata for PreviewDescription.Key;
    unint64_t v18 = v5;
    v16[0] = 6;
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    char v17 = &type metadata for PreviewDescription.Key;
    unint64_t v18 = v5;
    v16[0] = 7;
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    char v17 = &type metadata for PreviewDescription.Key;
    unint64_t v18 = v5;
    v16[0] = 8;
    sub_25A5B064C();
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    char v17 = &type metadata for PreviewDescription.Key;
    unint64_t v18 = v5;
    v16[0] = 9;
    sub_25A572594();
    sub_25A622760();
    if (v13 == 4) {
      char v10 = 0;
    }
    else {
      char v10 = v13;
    }
    uint64_t v11 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)a2 = v13;
    *(void *)(a2 + 8) = v13;
    *(void *)(a2 + 16) = v8;
    *(void *)(a2 + 24) = v13;
    *(void *)(a2 + 32) = v14;
    *(void *)(a2 + 40) = v13;
    *(void *)(a2 + 48) = v14;
    *(void *)(a2 + 56) = v13;
    *(void *)(a2 + 64) = v14;
    *(unsigned char *)(a2 + 72) = v15;
    *(unsigned char *)(a2 + 73) = v12;
    *(unsigned char *)(a2 + 74) = (v13 == 2) | v13 & 1;
    *(unsigned char *)(a2 + 75) = (v13 == 2) | v13 & 1;
    *(unsigned char *)(a2 + 76) = v10;
    *(void *)(a2 + 80) = v13;
    *(void *)(a2 + 88) = v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall PreviewDescription.describe(with:)(Swift::OpaquePointer *with)
{
  uint64_t v22 = *(unsigned __int8 **)v1;
  char v36 = *(unsigned __int8 **)(v1 + 8);
  unint64_t v35 = *(void *)(v1 + 16);
  uint64_t v24 = *(unsigned __int8 **)(v1 + 24);
  unint64_t v38 = *(void *)(v1 + 32);
  char v23 = *(unsigned __int8 **)(v1 + 40);
  uint64_t v2 = *(void *)(v1 + 56);
  unint64_t v37 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 64);
  int v4 = *(unsigned __int8 *)(v1 + 72);
  int v5 = *(unsigned __int8 *)(v1 + 74);
  int v6 = *(unsigned __int8 *)(v1 + 75);
  uint64_t v33 = *(unsigned __int8 *)(v1 + 76);
  uint64_t v34 = *(char *)(v1 + 73);
  unint64_t v31 = *(void *)(v1 + 88);
  uint64_t v32 = *(unsigned __int8 **)(v1 + 80);
  uint64_t v39 = (unsigned __int8 *)&unk_27083CF78;
  sub_25A5FC698((uint64_t *)&v39);
  char v7 = v39;
  uint64_t v8 = *((void *)v39 + 2);
  if (v8)
  {
    int v9 = v4;
    uint64_t v10 = 0;
    uint64_t v11 = 0x656369766564;
    uint64_t v12 = 1702195828;
    if (v6) {
      uint64_t v13 = 1702195828;
    }
    else {
      uint64_t v13 = 0x65736C6166;
    }
    uint64_t v30 = (unsigned __int8 *)v13;
    if (v6) {
      unint64_t v14 = 0xE400000000000000;
    }
    else {
      unint64_t v14 = 0xE500000000000000;
    }
    if (!v5) {
      uint64_t v12 = 0x65736C6166;
    }
    uint64_t v28 = (unsigned __int8 *)v12;
    unint64_t v29 = v14;
    if (v5) {
      unint64_t v15 = 0xE400000000000000;
    }
    else {
      unint64_t v15 = 0xE500000000000000;
    }
    unint64_t v27 = v15;
    if (v2 | v3) {
      uint64_t v11 = 0x74616854657A6973;
    }
    unint64_t v16 = 0xEC00000073746946;
    if (!(v2 | v3)) {
      unint64_t v16 = 0xE600000000000000;
    }
    if (!v9) {
      uint64_t v11 = 0x6465786966;
    }
    char v26 = (unsigned __int8 *)v11;
    if (!v9) {
      unint64_t v16 = 0xE500000000000000;
    }
    unint64_t v25 = v16;
    do
    {
      uint64_t v17 = v7[v10++ + 32];
      switch(v17)
      {
        case 1:
          uint64_t v39 = v36;
          unint64_t v40 = v35;
          swift_bridgeObjectRetain();
          break;
        case 2:
          if (!v38) {
            continue;
          }
          uint64_t v39 = v24;
          unint64_t v40 = v38;
          swift_bridgeObjectRetain();
          break;
        case 3:
          if (!v37) {
            continue;
          }
          uint64_t v39 = v23;
          unint64_t v40 = v37;
          swift_bridgeObjectRetain();
          break;
        case 4:
          uint64_t v39 = v26;
          unint64_t v40 = v25;
          break;
        case 5:
          unint64_t v19 = *(void *)&aComplicaion_0[8 * v34 + 8];
          uint64_t v39 = *(unsigned __int8 **)&aApplicatwidget_0[8 * v34];
          unint64_t v40 = v19;
          break;
        case 6:
          uint64_t v39 = v28;
          unint64_t v40 = v27;
          break;
        case 7:
          uint64_t v39 = v30;
          unint64_t v40 = v29;
          break;
        case 8:
          unint64_t v20 = 0xD000000000000012;
          unint64_t v21 = 0x800000025A635E00;
          switch(v33)
          {
            case 1:
              break;
            case 2:
              unint64_t v21 = 0xED00007466654C65;
              goto LABEL_43;
            case 3:
              unint64_t v21 = 0xEE00746867695265;
LABEL_43:
              unint64_t v20 = 0x70616373646E616CLL;
              break;
            default:
              unint64_t v21 = 0xE800000000000000;
              unint64_t v20 = 0x7469617274726F70;
              break;
          }
          uint64_t v39 = (unsigned __int8 *)v20;
          unint64_t v40 = v21;
          sub_25A622ED0();
          goto LABEL_36;
        case 9:
          uint64_t v39 = v32;
          unint64_t v40 = v31;
          sub_25A5FDA0C();
          swift_bridgeObjectRetain();
          break;
        default:
          uint64_t v39 = v22;
          sub_25A5FDA60();
          uint64_t v39 = (unsigned __int8 *)sub_25A6231B0();
          unint64_t v40 = v18;
          break;
      }
      sub_25A622ED0();
LABEL_36:
      swift_bridgeObjectRelease();
    }
    while (v8 != v10);
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  swift_release();
}

uint64_t PreviewContentDomain.rawValue.getter()
{
  return *(void *)&aApplicatwidget_0[8 * *v0];
}

__n128 PreviewDescription.previewTraits.getter@<Q0>(__n128 *a1@<X8>)
{
  unsigned __int8 v2 = *(unsigned char *)(v1 + 72);
  unsigned __int8 v3 = *(unsigned char *)(v1 + 76);
  __n128 result = *(__n128 *)(v1 + 56);
  *a1 = result;
  a1[1].n128_u8[0] = v2;
  a1[1].n128_u8[1] = v3;
  return result;
}

uint64_t PreviewDescription.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  int v5 = *(unsigned __int8 *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 88);
  sub_25A623460();
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  sub_25A623470();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_25A622DF0();
    swift_bridgeObjectRelease();
  }
  sub_25A623470();
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_25A622DF0();
    swift_bridgeObjectRelease();
  }
  sub_25A623460();
  if (!v5)
  {
    sub_25A623490();
    sub_25A623490();
  }
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  sub_25A623470();
  sub_25A623470();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  if (!v3) {
    return sub_25A623470();
  }
  sub_25A623470();
  swift_bridgeObjectRetain();
  sub_25A622DF0();

  return swift_bridgeObjectRelease();
}

uint64_t PreviewDescription.hashValue.getter()
{
  return sub_25A6234A0();
}

uint64_t sub_25A5FB590()
{
  return sub_25A622780();
}

uint64_t sub_25A5FB5E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewDescription.init(propertyListValue:)(a1, a2);
}

uint64_t sub_25A5FB600()
{
  return sub_25A6234A0();
}

uint64_t sub_25A5FB6A4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A5FB748()
{
  uint64_t v1 = *((void *)v0 + 2);
  char v2 = *((unsigned char *)v0 + 72);
  char v3 = *((unsigned char *)v0 + 73);
  char v4 = *((unsigned char *)v0 + 74);
  char v5 = *((unsigned char *)v0 + 75);
  char v6 = *((unsigned char *)v0 + 76);
  long long v10 = *v0;
  uint64_t v11 = v1;
  long long v12 = *(long long *)((char *)v0 + 24);
  long long v13 = *(long long *)((char *)v0 + 40);
  long long v14 = *(long long *)((char *)v0 + 56);
  char v15 = v2;
  char v16 = v3;
  char v17 = v4;
  char v18 = v5;
  char v19 = v6;
  long long v20 = v0[5];
  with._rawValue = (void *)MEMORY[0x263F8EE78];
  PreviewDescription.describe(with:)(&with);
  uint64_t v7 = sub_25A622EB0();
  swift_bridgeObjectRelease();
  return v7;
}

PreviewsMessagingOS::PreviewContentDomain_optional __swiftcall PreviewContentDomain.init(rawValue:)(Swift::String rawValue)
{
  char v2 = v1;
  unint64_t v3 = sub_25A6232B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t sub_25A5FB864(char *a1, char *a2)
{
  return sub_25A5E9CFC(*a1, *a2);
}

uint64_t sub_25A5FB870()
{
  return sub_25A619E9C();
}

uint64_t sub_25A5FB878()
{
  return sub_25A54A858();
}

uint64_t sub_25A5FB880()
{
  return sub_25A61D140();
}

PreviewsMessagingOS::PreviewContentDomain_optional sub_25A5FB888(Swift::String *a1)
{
  return PreviewContentDomain.init(rawValue:)(*a1);
}

uint64_t sub_25A5FB894@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PreviewContentDomain.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25A5FB8BC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A602FA8();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A5FB918()
{
  return sub_25A622B20();
}

unint64_t OneWayMessageKey.getter()
{
  return 0xD000000000000012;
}

void sub_25A5FB99C()
{
  qword_26A42B5E0 = 1701869940;
  *(void *)algn_26A42B5E8 = 0xE400000000000000;
}

uint64_t MessageTypeKey.getter()
{
  if (qword_26A4291E0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26A42B5E0;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t MessageSendingError.lowValueTitle.getter()
{
  sub_25A5FDDA8(v0, (uint64_t)&v5);
  switch(v7[32])
  {
    case 1:
      sub_25A623210();
      swift_bridgeObjectRelease();
      unint64_t v2 = 0xD000000000000018;
      goto LABEL_6;
    case 2:
      sub_25A623210();
      swift_bridgeObjectRelease();
      unint64_t v2 = 0xD00000000000001CLL;
LABEL_6:
      uint64_t v4 = v2;
      sub_25A622E00();
      goto LABEL_7;
    case 3:
      sub_25A623210();
      swift_bridgeObjectRelease();
      uint64_t v4 = 0x1000000000000015;
      sub_25A622E00();
      swift_bridgeObjectRelease();
      sub_25A622E00();
      sub_25A623350();
      sub_25A622E00();
LABEL_7:
      swift_bridgeObjectRelease();
      uint64_t v1 = v4;
      break;
    default:
      sub_25A623210();
      swift_bridgeObjectRelease();
      sub_25A622E00();
      swift_bridgeObjectRelease();
      sub_25A622E00();
      uint64_t v1 = 0x1000000000000021;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
      break;
  }
  return v1;
}

uint64_t MessageSendingError.additionalInfo.getter()
{
  sub_25A5FDDA8(v0, (uint64_t)v5);
  switch(v8)
  {
    case 1:
    case 2:
    case 3:
      swift_bridgeObjectRelease();
      break;
    default:
      swift_bridgeObjectRelease();
      sub_25A56D80C(&v6, v4);
      sub_25A56D80C(&v7, &v2);
      sub_25A623210();
      sub_25A622E00();
      sub_25A623270();
      sub_25A622E00();
      __swift_project_boxed_opaque_existential_1(&v2, v3);
      swift_getDynamicType();
      sub_25A623500();
      sub_25A622E00();
      swift_bridgeObjectRelease();
      sub_25A622E00();
      sub_25A623270();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
      break;
  }
  return 0;
}

uint64_t MessageSendingError.additionalDiagnostics.getter()
{
  return 0;
}

uint64_t MessageSendingError.isPotentialCrash.getter()
{
  sub_25A5FDDA8(v0, (uint64_t)v2);
  if (v5 - 1 >= 2)
  {
    if (v5)
    {
      sub_25A5FDDE0((uint64_t)v2);
    }
    else
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v4);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v3);
    }
    return 0;
  }
  else
  {
    sub_25A5FDDE0((uint64_t)v2);
    return 1;
  }
}

uint64_t sub_25A5FBEA8()
{
  sub_25A5FDDA8(v0, (uint64_t)v2);
  if (v5 - 1 >= 2)
  {
    if (v5)
    {
      sub_25A5FDDE0((uint64_t)v2);
    }
    else
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v4);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v3);
    }
    return 0;
  }
  else
  {
    sub_25A5FDDE0((uint64_t)v2);
    return 1;
  }
}

uint64_t sub_25A5FBF2C(uint64_t a1)
{
  unint64_t v2 = sub_25A602F54();

  return MEMORY[0x270F55A28](a1, v2);
}

uint64_t sub_25A5FBF68(uint64_t a1)
{
  unint64_t v2 = sub_25A602F54();

  return MEMORY[0x270F55A08](a1, v2);
}

uint64_t sub_25A5FBFA4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BB70);
    long long v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    long long v10 = (char *)MEMORY[0x263F8EE78];
  }
  long long v12 = v10 + 32;
  long long v13 = a4 + 32;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25A6232A0();
  __break(1u);
  return result;
}

uint64_t sub_25A5FC0F4(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A429590);
    long long v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    long long v10 = (char *)MEMORY[0x263F8EE78];
  }
  long long v13 = v10 + 32;
  long long v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25A6232A0();
  __break(1u);
  return result;
}

uint64_t sub_25A5FC260(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4295B8);
    long long v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    long long v10 = (char *)MEMORY[0x263F8EE78];
  }
  long long v13 = v10 + 32;
  long long v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25A6232A0();
  __break(1u);
  return result;
}

uint64_t sub_25A5FC3CC(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4295B0);
    long long v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    long long v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  long long v13 = a4 + 32;
  size_t v14 = 48 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25A6232A0();
  __break(1u);
  return result;
}

uint64_t sub_25A5FC548(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A4295A8);
    long long v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    long long v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  long long v13 = a4 + 32;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25A6232A0();
  __break(1u);
  return result;
}

uint64_t sub_25A5FC698(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25A5FD510(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_25A5FC704(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_25A5FC704(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = a1[1];
  uint64_t result = sub_25A623340();
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_152;
    }
    if (v4) {
      return sub_25A5FCE88(0, v4, 1, a1);
    }
    return result;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_160;
  }
  uint64_t v109 = v4 - 2;
  uint64_t v106 = result;
  v104 = a1;
  if (v4 < 2)
  {
    int64_t v9 = (char *)MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    uint64_t v105 = MEMORY[0x263F8EE78];
    if (v4 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_118:
      v96 = v9;
      if (v12 >= 2)
      {
        uint64_t v97 = *v104;
        do
        {
          unint64_t v98 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v97) {
            goto LABEL_159;
          }
          v99 = v96;
          uint64_t v100 = *(void *)&v96[16 * v98 + 32];
          uint64_t v101 = *(void *)&v96[16 * v12 + 24];
          sub_25A5FCF9C((char *)(v97 + v100), (char *)(v97 + *(void *)&v96[16 * v12 + 16]), v97 + v101, __dst);
          if (v2) {
            break;
          }
          if (v101 < v100) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v99 = sub_25A5FD4FC((uint64_t)v99);
          }
          if (v98 >= *((void *)v99 + 2)) {
            goto LABEL_149;
          }
          v102 = &v99[16 * v98 + 32];
          *(void *)v102 = v100;
          *((void *)v102 + 1) = v101;
          unint64_t v103 = *((void *)v99 + 2);
          if (v12 > v103) {
            goto LABEL_150;
          }
          memmove(&v99[16 * v12 + 16], &v99[16 * v12 + 32], 16 * (v103 - v12));
          v96 = v99;
          *((void *)v99 + 2) = v103 - 1;
          unint64_t v12 = v103 - 1;
        }
        while (v103 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v105 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v113 = v1;
  }
  else
  {
    uint64_t v113 = v1;
    uint64_t v7 = v6 >> 1;
    uint64_t v8 = sub_25A622F20();
    *(void *)(v8 + 16) = v7;
    uint64_t v105 = v8;
    __dst = (char *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  int64_t v9 = (char *)MEMORY[0x263F8EE78];
  uint64_t v107 = v4;
  while (1)
  {
    uint64_t v13 = v10++;
    uint64_t v110 = v13;
    if (v10 >= v4) {
      goto LABEL_46;
    }
    char v14 = *(unsigned char *)(v11 + v13);
    uint64_t v15 = sub_25A5FA0B0(*(unsigned char *)(v11 + v10));
    uint64_t v17 = v16;
    if (v15 == sub_25A5FA0B0(v14) && v17 == v18) {
      int v20 = 0;
    }
    else {
      int v20 = sub_25A6233B0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = v13;
    uint64_t v10 = v13 + 2;
    if (v13 + 2 >= v107) {
      goto LABEL_36;
    }
    while (1)
    {
      char v23 = *(unsigned char *)(v11 + v21 + 1);
      uint64_t v24 = sub_25A5FA0B0(*(unsigned char *)(v11 + v21 + 2));
      uint64_t v26 = v25;
      if (v24 == sub_25A5FA0B0(v23) && v26 == v27)
      {
        swift_bridgeObjectRelease_n();
        if (v20)
        {
          uint64_t v10 = v21 + 2;
          uint64_t v4 = v107;
          uint64_t v13 = v110;
          goto LABEL_37;
        }
        goto LABEL_26;
      }
      int v22 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 ^ v22)) {
        break;
      }
LABEL_26:
      if (v109 == ++v21)
      {
        uint64_t v10 = v107;
        goto LABEL_36;
      }
    }
    uint64_t v10 = v21 + 2;
LABEL_36:
    uint64_t v4 = v107;
    uint64_t v13 = v110;
    if (v20)
    {
LABEL_37:
      if (v10 < v13) {
        goto LABEL_153;
      }
      if (v13 < v10)
      {
        uint64_t v29 = v10 - 1;
        uint64_t v30 = v13;
        do
        {
          if (v30 != v29)
          {
            if (!v11) {
              goto LABEL_158;
            }
            char v31 = *(unsigned char *)(v11 + v30);
            *(unsigned char *)(v11 + v30) = *(unsigned char *)(v11 + v29);
            *(unsigned char *)(v11 + v29) = v31;
          }
          BOOL v75 = ++v30 < v29--;
        }
        while (v75);
      }
    }
LABEL_46:
    if (v10 < v4)
    {
      if (__OFSUB__(v10, v13)) {
        goto LABEL_151;
      }
      if (v10 - v13 < v106) {
        break;
      }
    }
LABEL_67:
    if (v10 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v9 = sub_25A5FD2A0(0, *((void *)v9 + 2) + 1, 1, v9);
    }
    unint64_t v44 = *((void *)v9 + 2);
    unint64_t v43 = *((void *)v9 + 3);
    unint64_t v12 = v44 + 1;
    if (v44 >= v43 >> 1) {
      int64_t v9 = sub_25A5FD2A0((char *)(v43 > 1), v44 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v12;
    uint64_t v45 = v9 + 32;
    uint64_t v46 = &v9[16 * v44 + 32];
    *(void *)uint64_t v46 = v13;
    *((void *)v46 + 1) = v10;
    if (v44)
    {
      uint64_t v111 = v10;
      while (1)
      {
        unint64_t v47 = v12 - 1;
        if (v12 >= 4)
        {
          v52 = &v45[16 * v12];
          uint64_t v53 = *((void *)v52 - 8);
          uint64_t v54 = *((void *)v52 - 7);
          BOOL v58 = __OFSUB__(v54, v53);
          uint64_t v55 = v54 - v53;
          if (v58) {
            goto LABEL_135;
          }
          uint64_t v57 = *((void *)v52 - 6);
          uint64_t v56 = *((void *)v52 - 5);
          BOOL v58 = __OFSUB__(v56, v57);
          uint64_t v50 = v56 - v57;
          char v51 = v58;
          if (v58) {
            goto LABEL_136;
          }
          unint64_t v59 = v12 - 2;
          v60 = &v45[16 * v12 - 32];
          uint64_t v62 = *(void *)v60;
          uint64_t v61 = *((void *)v60 + 1);
          BOOL v58 = __OFSUB__(v61, v62);
          uint64_t v63 = v61 - v62;
          if (v58) {
            goto LABEL_138;
          }
          BOOL v58 = __OFADD__(v50, v63);
          uint64_t v64 = v50 + v63;
          if (v58) {
            goto LABEL_141;
          }
          if (v64 >= v55)
          {
            v82 = &v45[16 * v47];
            uint64_t v84 = *(void *)v82;
            uint64_t v83 = *((void *)v82 + 1);
            BOOL v58 = __OFSUB__(v83, v84);
            uint64_t v85 = v83 - v84;
            if (v58) {
              goto LABEL_145;
            }
            BOOL v75 = v50 < v85;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v76 = *((void *)v9 + 4);
            uint64_t v77 = *((void *)v9 + 5);
            BOOL v58 = __OFSUB__(v77, v76);
            uint64_t v69 = v77 - v76;
            char v70 = v58;
            goto LABEL_99;
          }
          uint64_t v49 = *((void *)v9 + 4);
          uint64_t v48 = *((void *)v9 + 5);
          BOOL v58 = __OFSUB__(v48, v49);
          uint64_t v50 = v48 - v49;
          char v51 = v58;
        }
        if (v51) {
          goto LABEL_137;
        }
        unint64_t v59 = v12 - 2;
        v65 = &v45[16 * v12 - 32];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        BOOL v68 = __OFSUB__(v66, v67);
        uint64_t v69 = v66 - v67;
        char v70 = v68;
        if (v68) {
          goto LABEL_140;
        }
        v71 = &v45[16 * v47];
        uint64_t v73 = *(void *)v71;
        uint64_t v72 = *((void *)v71 + 1);
        BOOL v58 = __OFSUB__(v72, v73);
        uint64_t v74 = v72 - v73;
        if (v58) {
          goto LABEL_143;
        }
        if (__OFADD__(v69, v74)) {
          goto LABEL_144;
        }
        if (v69 + v74 >= v50)
        {
          BOOL v75 = v50 < v74;
LABEL_105:
          if (v75) {
            unint64_t v47 = v59;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v70) {
          goto LABEL_139;
        }
        v78 = &v45[16 * v47];
        uint64_t v80 = *(void *)v78;
        uint64_t v79 = *((void *)v78 + 1);
        BOOL v58 = __OFSUB__(v79, v80);
        uint64_t v81 = v79 - v80;
        if (v58) {
          goto LABEL_142;
        }
        if (v81 < v69) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v86 = v47 - 1;
        if (v47 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
          goto LABEL_155;
        }
        uint64_t v87 = v11;
        if (!v11) {
          goto LABEL_157;
        }
        v88 = v9;
        v89 = &v45[16 * v86];
        uint64_t v90 = *(void *)v89;
        unint64_t v91 = v47;
        v92 = &v45[16 * v47];
        uint64_t v93 = *((void *)v92 + 1);
        uint64_t v94 = v87;
        sub_25A5FCF9C((char *)(v87 + *(void *)v89), (char *)(v87 + *(void *)v92), v87 + v93, __dst);
        if (v113) {
          goto LABEL_115;
        }
        if (v93 < v90) {
          goto LABEL_132;
        }
        if (v91 > *((void *)v88 + 2)) {
          goto LABEL_133;
        }
        *(void *)v89 = v90;
        *(void *)&v45[16 * v86 + 8] = v93;
        unint64_t v95 = *((void *)v88 + 2);
        if (v91 >= v95) {
          goto LABEL_134;
        }
        int64_t v9 = v88;
        unint64_t v12 = v95 - 1;
        memmove(v92, v92 + 16, 16 * (v95 - 1 - v91));
        *((void *)v88 + 2) = v95 - 1;
        uint64_t v11 = v94;
        uint64_t v10 = v111;
        if (v95 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v4 = v107;
    if (v10 >= v107)
    {
      uint64_t v2 = v113;
      goto LABEL_118;
    }
  }
  uint64_t v32 = v13 + v106;
  if (__OFADD__(v13, v106)) {
    goto LABEL_154;
  }
  if (v32 >= v4) {
    uint64_t v32 = v4;
  }
  if (v32 >= v13)
  {
    if (v10 != v32)
    {
      uint64_t v33 = (char *)(v11 + v10);
      uint64_t v108 = v32;
      do
      {
        char v34 = *(unsigned char *)(v11 + v10);
        unint64_t v35 = v33;
        while (1)
        {
          char v36 = *(v35 - 1);
          uint64_t v37 = sub_25A5FA0B0(v34);
          uint64_t v39 = v38;
          if (v37 == sub_25A5FA0B0(v36) && v39 == v40) {
            break;
          }
          char v42 = sub_25A6233B0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v42 & 1) == 0) {
            goto LABEL_56;
          }
          if (!v11) {
            goto LABEL_156;
          }
          char v34 = *v35;
          *unint64_t v35 = *(v35 - 1);
          *(v35 - 1) = v34;
          ++v13;
          --v35;
          if (v10 == v13) {
            goto LABEL_56;
          }
        }
        swift_bridgeObjectRelease_n();
LABEL_56:
        ++v10;
        ++v33;
        uint64_t v13 = v110;
      }
      while (v10 != v108);
      uint64_t v10 = v108;
    }
    goto LABEL_67;
  }
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  uint64_t result = sub_25A623280();
  __break(1u);
  return result;
}

uint64_t sub_25A5FCE88(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v17 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = *a4;
    uint64_t v7 = (unsigned char *)(*a4 + a3);
LABEL_6:
    LOBYTE(result) = *(unsigned char *)(v6 + v4);
    uint64_t v8 = v17;
    int64_t v9 = v7;
    while (1)
    {
      char v10 = *(v9 - 1);
      uint64_t v11 = sub_25A5FA0B0(result);
      uint64_t v13 = v12;
      if (v11 == sub_25A5FA0B0(v10) && v13 == v14)
      {
        uint64_t result = swift_bridgeObjectRelease_n();
LABEL_5:
        ++v4;
        ++v7;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_6;
      }
      char v16 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v16 & 1) == 0) {
        goto LABEL_5;
      }
      if (!v6) {
        break;
      }
      uint64_t result = *v9;
      *int64_t v9 = *(v9 - 1);
      *(v9 - 1) = result;
      ++v8;
      --v9;
      if (v4 == v8) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25A5FCF9C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char v36 = __src;
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  size_t v8 = a2 - __src;
  unint64_t v9 = a3 - (void)a2;
  unint64_t v35 = __dst;
  if (a2 - __src >= (uint64_t)(a3 - (void)a2))
  {
    if ((v9 & 0x8000000000000000) != 0) {
      goto LABEL_50;
    }
    if (__dst != a2 || a3 <= (unint64_t)__dst) {
      memmove(__dst, a2, a3 - (void)a2);
    }
    int v20 = &v4[v9];
    uint64_t v33 = __src;
    char v34 = &v4[v9];
    char v36 = v6;
    if (__src >= v6 || (char *)a3 == v6)
    {
LABEL_49:
      sub_25A5FD39C((void **)&v36, (const void **)&v35, &v34);
      return 1;
    }
    uint64_t v21 = (char *)(a3 - 1);
    int v22 = v6;
    uint64_t v32 = v4;
    while (1)
    {
      char v23 = v21 + 1;
      char v24 = *--v22;
      uint64_t v25 = sub_25A5FA0B0(*(v20 - 1));
      uint64_t v27 = v26;
      if (v25 == sub_25A5FA0B0(v24) && v27 == v28) {
        break;
      }
      char v30 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v30 & 1) == 0) {
        goto LABEL_42;
      }
      if (v23 != v6 || v21 >= v6) {
        char *v21 = *v22;
      }
      char v36 = v22;
LABEL_47:
      if (v22 > v33)
      {
        --v21;
        uint64_t v6 = v22;
        if (v20 > v32) {
          continue;
        }
      }
      goto LABEL_49;
    }
    swift_bridgeObjectRelease_n();
LABEL_42:
    char v34 = v20 - 1;
    if (v23 < v20 || v21 >= v20 || v23 != v20) {
      char *v21 = *(v20 - 1);
    }
    int v22 = v6;
    --v20;
    goto LABEL_47;
  }
  if ((v8 & 0x8000000000000000) == 0)
  {
    if (__dst != __src || a2 <= __dst) {
      memmove(__dst, __src, v8);
    }
    char v10 = &v4[v8];
    char v34 = &v4[v8];
    if (v6 != __src && (unint64_t)v6 < a3)
    {
      uint64_t v11 = __src;
      while (1)
      {
        char v12 = *v4;
        uint64_t v13 = sub_25A5FA0B0(*v6);
        uint64_t v15 = v14;
        if (v13 == sub_25A5FA0B0(v12) && v15 == v16) {
          break;
        }
        char v18 = sub_25A6233B0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v18 & 1) == 0) {
          goto LABEL_19;
        }
        char v19 = v6 + 1;
        if (v11 < v6 || v11 >= v19 || v11 != v6) {
          *uint64_t v11 = *v6;
        }
LABEL_22:
        ++v11;
        if (v4 < v10)
        {
          uint64_t v6 = v19;
          if ((unint64_t)v19 < a3) {
            continue;
          }
        }
        char v36 = v11;
        goto LABEL_49;
      }
      swift_bridgeObjectRelease_n();
LABEL_19:
      if (v11 != v4) {
        *uint64_t v11 = *v4;
      }
      unint64_t v35 = ++v4;
      char v19 = v6;
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_50:
  uint64_t result = sub_25A6232A0();
  __break(1u);
  return result;
}

char *sub_25A5FD2A0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BB68);
    char v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_25A5FD39C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  int64_t v4 = *a3 - (void)v3;
  if (v4 < 0)
  {
    uint64_t result = (char *)sub_25A6232A0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    if (result != v3 || result >= &v3[v4])
    {
      return (char *)memmove(result, v3, v4);
    }
  }
  return result;
}

char *sub_25A5FD440(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_25A6232A0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_25A5FD4FC(uint64_t a1)
{
  return sub_25A5FD2A0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25A5FD510(uint64_t a1)
{
  return sub_25A5FBFA4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25A5FD524(uint64_t a1)
{
  return sub_25A5FC0F4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25A5FD538(uint64_t a1)
{
  return sub_25A5FC548(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25A5FD54C()
{
  return 2036625250;
}

uint64_t sub_25A5FD55C()
{
  return 0x656E696C656D6974;
}

uint64_t sub_25A5FD57C()
{
  return 0x7377656976657270;
}

BOOL _s19PreviewsMessagingOS15PreviewMetadataV2eeoiySbAC_ACtFZ_0(char *a1, char *a2)
{
  uint64_t v2 = *((void *)a1 + 1);
  uint64_t v3 = *((void *)a1 + 2);
  int v4 = a1[24];
  int v25 = a1[25];
  *(void *)&long long v22 = *((void *)a1 + 5);
  *((void *)&v22 + 1) = *((void *)a1 + 4);
  unsigned __int8 v20 = a1[49];
  int v18 = a1[50];
  uint64_t v14 = *((void *)a1 + 7);
  uint64_t v15 = *((void *)a1 + 8);
  uint64_t v5 = *((void *)a2 + 1);
  uint64_t v6 = *((void *)a2 + 2);
  int v7 = a2[24];
  int v8 = a2[25];
  *((void *)&v21 + 1) = *((void *)a2 + 4);
  *(void *)&long long v21 = *((void *)a2 + 5);
  int v23 = a2[48];
  int v24 = a1[48];
  char v19 = a2[49];
  int v17 = a2[50];
  uint64_t v13 = *((void *)a2 + 7);
  uint64_t v16 = *((void *)a2 + 8);
  if (*(void *)&aApplicatwidget_0[8 * *a1] == *(void *)&aApplicatwidget_0[8 * *a2]
    && *(void *)&aComplicaion_0[8 * *a1 + 8] == *(void *)&aComplicaion_0[8 * *a2 + 8])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = sub_25A6233B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    BOOL result = 0;
    if ((v9 & 1) == 0) {
      return result;
    }
  }
  if (v2 == v5 && v3 == v6)
  {
    BOOL result = 0;
    if (v4 != v7) {
      return result;
    }
  }
  else
  {
    char v11 = sub_25A6233B0();
    BOOL result = 0;
    if (v11 & 1) == 0 || ((v4 ^ v7)) {
      return result;
    }
  }
  if ((v25 ^ v8)) {
    return result;
  }
  if (v24)
  {
    if (v22 == 0)
    {
      if (!v23 || v21 != 0) {
        return 0;
      }
    }
    else if (!v23 || v21 == 0)
    {
      return 0;
    }
LABEL_23:
    char v12 = sub_25A5E8B28(v20, v19);
    BOOL result = 0;
    if ((v12 & 1) != 0 && ((v18 ^ v17) & 1) == 0)
    {
      if (v15) {
        return v16 && (v14 == v13 && v15 == v16 || (sub_25A6233B0() & 1) != 0);
      }
      return !v16;
    }
    return result;
  }
  if (v23) {
    return 0;
  }
  BOOL result = 0;
  if (*((double *)&v22 + 1) == *((double *)&v21 + 1) && *(double *)&v22 == *(double *)&v21) {
    goto LABEL_23;
  }
  return result;
}

unint64_t sub_25A5FD804()
{
  unint64_t result = qword_26A42B720;
  if (!qword_26A42B720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B720);
  }
  return result;
}

unint64_t sub_25A5FD858()
{
  unint64_t result = qword_26A42B748;
  if (!qword_26A42B748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B748);
  }
  return result;
}

unint64_t sub_25A5FD8AC()
{
  unint64_t result = qword_26A42B750;
  if (!qword_26A42B750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B750);
  }
  return result;
}

unint64_t sub_25A5FD900()
{
  unint64_t result = qword_26A42B758;
  if (!qword_26A42B758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B758);
  }
  return result;
}

uint64_t sub_25A5FD954()
{
  return sub_25A5F9914();
}

unint64_t sub_25A5FD95C()
{
  unint64_t result = qword_26A42B780;
  if (!qword_26A42B780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B780);
  }
  return result;
}

uint64_t sub_25A5FD9B0()
{
  return sub_25A5FA460(*(void **)(v0 + 16));
}

unint64_t sub_25A5FD9B8()
{
  unint64_t result = qword_26A42B788;
  if (!qword_26A42B788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B788);
  }
  return result;
}

unint64_t sub_25A5FDA0C()
{
  unint64_t result = qword_26A42B790;
  if (!qword_26A42B790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B790);
  }
  return result;
}

unint64_t sub_25A5FDA60()
{
  unint64_t result = qword_26A42B798;
  if (!qword_26A42B798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B798);
  }
  return result;
}

BOOL _s19PreviewsMessagingOS18PreviewDescriptionV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  *((void *)&v30 + 1) = *(void *)(a1 + 56);
  *(void *)&long long v30 = *(void *)(a1 + 64);
  int v6 = *(unsigned __int8 *)(a1 + 72);
  int v26 = *(unsigned __int8 *)(a1 + 74);
  int v24 = *(unsigned __int8 *)(a1 + 75);
  unsigned __int8 v22 = *(unsigned char *)(a1 + 76);
  uint64_t v18 = *(void *)(a1 + 80);
  uint64_t v19 = *(void *)(a1 + 88);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  *((void *)&v29 + 1) = *(void *)(a2 + 56);
  uint64_t v28 = *(char *)(a1 + 73);
  *(void *)&long long v29 = *(void *)(a2 + 64);
  int v11 = *(unsigned __int8 *)(a2 + 72);
  uint64_t v27 = *(char *)(a2 + 73);
  int v25 = *(unsigned __int8 *)(a2 + 74);
  int v23 = *(unsigned __int8 *)(a2 + 75);
  char v21 = *(unsigned char *)(a2 + 76);
  uint64_t v17 = *(void *)(a2 + 80);
  uint64_t v20 = *(void *)(a2 + 88);
  if (*(void *)(a1 + 8) == *(void *)(a2 + 8) && *(void *)(a1 + 16) == *(void *)(a2 + 16)
    || (char v12 = sub_25A6233B0(), result = 0, (v12 & 1) != 0))
  {
    if (v3)
    {
      if (!v8) {
        return 0;
      }
      if (v2 != v7 || v3 != v8)
      {
        char v14 = sub_25A6233B0();
        BOOL result = 0;
        if ((v14 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v8)
    {
      return 0;
    }
    if (v5)
    {
      if (!v9) {
        return 0;
      }
      if (v4 != v10 || v5 != v9)
      {
        char v15 = sub_25A6233B0();
        BOOL result = 0;
        if ((v15 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v9)
    {
      return 0;
    }
    if (v6)
    {
      if (v30 == 0)
      {
        if (!v11 || v29 != 0) {
          return 0;
        }
      }
      else if (!v11 || v29 == 0)
      {
        return 0;
      }
    }
    else
    {
      if (v11) {
        return 0;
      }
      BOOL result = 0;
      if (*((double *)&v30 + 1) != *((double *)&v29 + 1) || *(double *)&v30 != *(double *)&v29) {
        return result;
      }
    }
    if (*(void *)&aApplicatwidget_0[8 * v28] == *(void *)&aApplicatwidget_0[8 * v27]
      && *(void *)&aComplicaion_0[8 * v28 + 8] == *(void *)&aComplicaion_0[8 * v27 + 8])
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL result = 0;
      if (v26 != v25) {
        return result;
      }
    }
    else
    {
      char v16 = sub_25A6233B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL result = 0;
      if (v16 & 1) == 0 || ((v26 ^ v25)) {
        return result;
      }
    }
    if ((v24 ^ v23)) {
      return result;
    }
    if (sub_25A5E8B28(v22, v21))
    {
      if (v19) {
        return v20 && (v18 == v17 && v19 == v20 || (sub_25A6233B0() & 1) != 0);
      }
      if (!v20) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_25A5FDDA8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25A5FDDE0(uint64_t a1)
{
  return a1;
}

unint64_t sub_25A5FDE14()
{
  unint64_t result = qword_26A42B7A0;
  if (!qword_26A42B7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B7A0);
  }
  return result;
}

unint64_t sub_25A5FDE6C()
{
  unint64_t result = qword_26A42B7A8;
  if (!qword_26A42B7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B7A8);
  }
  return result;
}

unint64_t sub_25A5FDEC4()
{
  unint64_t result = qword_26A42B7B0;
  if (!qword_26A42B7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B7B0);
  }
  return result;
}

unint64_t sub_25A5FDF1C()
{
  unint64_t result = qword_26A42B7B8;
  if (!qword_26A42B7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B7B8);
  }
  return result;
}

unint64_t sub_25A5FDF74()
{
  unint64_t result = qword_26A42B7C0;
  if (!qword_26A42B7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B7C0);
  }
  return result;
}

unint64_t sub_25A5FDFCC()
{
  unint64_t result = qword_26A42B7C8;
  if (!qword_26A42B7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B7C8);
  }
  return result;
}

unint64_t sub_25A5FE024()
{
  unint64_t result = qword_26A42B7D0;
  if (!qword_26A42B7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B7D0);
  }
  return result;
}

unint64_t sub_25A5FE07C()
{
  unint64_t result = qword_26A42B7D8;
  if (!qword_26A42B7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B7D8);
  }
  return result;
}

unint64_t sub_25A5FE0D4()
{
  unint64_t result = qword_26A42B7E0;
  if (!qword_26A42B7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B7E0);
  }
  return result;
}

unint64_t sub_25A5FE12C()
{
  unint64_t result = qword_26A42B7E8;
  if (!qword_26A42B7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B7E8);
  }
  return result;
}

unint64_t sub_25A5FE184()
{
  unint64_t result = qword_26A42B7F0;
  if (!qword_26A42B7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B7F0);
  }
  return result;
}

unint64_t sub_25A5FE1DC()
{
  unint64_t result = qword_26A42B7F8;
  if (!qword_26A42B7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42B7F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AgentMessageType()
{
  return &type metadata for AgentMessageType;
}

uint64_t destroy for LegacyAgentPayload()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LegacyAgentPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LegacyAgentPayload(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 56) = v4;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for LegacyAgentPayload(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyAgentPayload(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LegacyAgentPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LegacyAgentPayload()
{
  return &type metadata for LegacyAgentPayload;
}

uint64_t *initializeBufferWithCopyOfBuffer for TimelinePayload(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_25A59FB7C(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for TimelinePayload(uint64_t a1)
{
  return sub_25A59C134(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *assignWithCopy for TimelinePayload(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_25A59FB7C(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_25A59C134(v5, v6);
  return a1;
}

uint64_t *assignWithTake for TimelinePayload(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_25A59C134(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimelinePayload(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for TimelinePayload(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)unint64_t result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)unint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimelinePayload()
{
  return &type metadata for TimelinePayload;
}

ValueMetadata *type metadata accessor for GeometryPayload()
{
  return &type metadata for GeometryPayload;
}

ValueMetadata *type metadata accessor for SceneLayout()
{
  return &type metadata for SceneLayout;
}

uint64_t destroy for HostIdentity(uint64_t a1)
{
  return sub_25A5F2480(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s19PreviewsMessagingOS12HostIdentityOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_25A5F16B8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for HostIdentity(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_25A5F16B8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_25A5F2480(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for HostIdentity(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_25A5F2480(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for HostIdentity()
{
  return &type metadata for HostIdentity;
}

ValueMetadata *type metadata accessor for ChromeType()
{
  return &type metadata for ChromeType;
}

ValueMetadata *type metadata accessor for GridIndex()
{
  return &type metadata for GridIndex;
}

uint64_t *initializeBufferWithCopyOfBuffer for StaticPreviewReply(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    char v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_25A6227C0();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)v4 + v11) = *(uint64_t *)((char *)a2 + v11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for StaticPreviewReply(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

unsigned char *initializeWithCopy for StaticPreviewReply(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  char v8 = &a2[v6];
  uint64_t v9 = sub_25A6227C0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *assignWithCopy for StaticPreviewReply(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  char v8 = &a2[v6];
  uint64_t v9 = sub_25A6227C0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

unsigned char *initializeWithTake for StaticPreviewReply(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  char v8 = &a2[v6];
  uint64_t v9 = sub_25A6227C0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  return a1;
}

unsigned char *assignWithTake for StaticPreviewReply(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  char v8 = &a2[v6];
  uint64_t v9 = sub_25A6227C0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StaticPreviewReply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A5FEC88);
}

uint64_t sub_25A5FEC88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A6227C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for StaticPreviewReply(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A5FED60);
}

uint64_t sub_25A5FED60(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25A6227C0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25A5FEE20()
{
  uint64_t result = sub_25A6227C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t initializeBufferWithCopyOfBuffer for HostedPreviewReply(unint64_t a1, uint64_t a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v15 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    uint64_t v8 = *(void *)(a2 + 8);
    char v9 = *(unsigned char *)(a2 + 16);
    sub_25A5F16B8(*(void *)a2, v8, v9);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    *(unsigned char *)(a1 + 16) = v9;
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
    uint64_t v10 = a3[6];
    uint64_t v11 = a1 + v10;
    uint64_t v12 = a2 + v10;
    uint64_t v13 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    uint64_t v14 = a3[8];
    *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
    *(void *)(a1 + v14) = *(void *)(a2 + v14);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for HostedPreviewReply(uint64_t a1, uint64_t a2)
{
  sub_25A5F2480(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HostedPreviewReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  char v8 = *(unsigned char *)(a2 + 16);
  sub_25A5F16B8(*(void *)a2, v7, v8);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v9 = a3[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  uint64_t v13 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HostedPreviewReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  char v8 = *(unsigned char *)(a2 + 16);
  sub_25A5F16B8(*(void *)a2, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  char v11 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v8;
  sub_25A5F2480(v9, v10, v11);
  long long v12 = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v12;
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for HostedPreviewReply(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  return a1;
}

uint64_t assignWithTake for HostedPreviewReply(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v9 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v6;
  sub_25A5F2480(v7, v8, v9);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HostedPreviewReply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A5FF400);
}

uint64_t sub_25A5FF400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A6227C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for HostedPreviewReply(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A5FF4D8);
}

uint64_t sub_25A5FF4D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25A6227C0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25A5FF598()
{
  uint64_t result = sub_25A6227C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for RenderPayload()
{
  return &type metadata for RenderPayload;
}

ValueMetadata *type metadata accessor for LayerHostPayload()
{
  return &type metadata for LayerHostPayload;
}

ValueMetadata *type metadata accessor for PreviewInstancesPayload()
{
  return &type metadata for PreviewInstancesPayload;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewTraits(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PreviewTraits(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for PreviewTraits()
{
  return &type metadata for PreviewTraits;
}

uint64_t getEnumTagSinglePayload for PreviewTraits.Layout(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PreviewTraits.Layout(uint64_t result, int a2, int a3)
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

uint64_t sub_25A5FF774(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25A5FF790(uint64_t result, int a2)
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

ValueMetadata *type metadata accessor for PreviewTraits.Layout()
{
  return &type metadata for PreviewTraits.Layout;
}

ValueMetadata *type metadata accessor for PreviewTraits.Orientation()
{
  return &type metadata for PreviewTraits.Orientation;
}

ValueMetadata *type metadata accessor for Explanation()
{
  return &type metadata for Explanation;
}

uint64_t sub_25A5FF7E4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_25A5FF87C(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 0x10uLL) {
    uint64_t v5 = 16;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *(void *)a2;
    *char v3 = *(void *)a2;
    char v3 = (void *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    unsigned int v9 = a2[v5];
    unsigned int v10 = v9 - 4;
    if (v9 >= 4)
    {
      if (v5 <= 3) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_19;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_19;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_19;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_19:
          int v13 = (v12 | (v10 << (8 * v5))) + 4;
          unsigned int v9 = v12 + 4;
          if (v5 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    switch(v9)
    {
      case 1u:
        uint64_t v14 = *((void *)a2 + 1);
        *char v3 = *(void *)a2;
        v3[1] = v14;
        char v15 = 1;
        goto LABEL_26;
      case 2u:
        uint64_t v16 = *((void *)a2 + 1);
        *char v3 = *(void *)a2;
        v3[1] = v16;
        char v15 = 2;
        goto LABEL_26;
      case 3u:
        uint64_t v17 = *((void *)a2 + 1);
        *char v3 = *(void *)a2;
        v3[1] = v17;
        char v15 = 3;
LABEL_26:
        *((unsigned char *)v3 + v5) = v15;
        swift_bridgeObjectRetain();
        break;
      default:
        (*(void (**)(void *))(v4 + 16))(a1);
        *((unsigned char *)v3 + v5) = 0;
        break;
    }
  }
  return v3;
}

uint64_t sub_25A5FFA44(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 0x10) {
    unint64_t v2 = 16;
  }
  unsigned int v3 = a1[v2];
  unsigned int v4 = v3 - 4;
  if (v3 >= 4)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 4;
        unsigned int v3 = v6 + 4;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  switch(v3)
  {
    case 1u:
    case 2u:
    case 3u:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
      break;
  }
  return result;
}

void *sub_25A5FFB70(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 4;
  if (v5 >= 4)
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
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 4;
        unsigned int v5 = v8 + 4;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  switch(v5)
  {
    case 1u:
      uint64_t v10 = *((void *)a2 + 1);
      *a1 = *(void *)a2;
      a1[1] = v10;
      char v11 = 1;
      goto LABEL_20;
    case 2u:
      uint64_t v12 = *((void *)a2 + 1);
      *a1 = *(void *)a2;
      a1[1] = v12;
      char v11 = 2;
      goto LABEL_20;
    case 3u:
      uint64_t v13 = *((void *)a2 + 1);
      *a1 = *(void *)a2;
      a1[1] = v13;
      char v11 = 3;
LABEL_20:
      *((unsigned char *)a1 + v4) = v11;
      swift_bridgeObjectRetain();
      break;
    default:
      (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
      *((unsigned char *)a1 + v4) = 0;
      break;
  }
  return a1;
}

unsigned __int8 *sub_25A5FFCF8(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 4;
    if (v8 >= 4)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 4;
          unsigned int v8 = v11 + 4;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    switch(v8)
    {
      case 1u:
      case 2u:
      case 3u:
        swift_bridgeObjectRelease();
        break;
      default:
        (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
        break;
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 4;
    if (v13 >= 4)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 4;
          unsigned int v13 = v16 + 4;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    switch(v13)
    {
      case 1u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        char v18 = 1;
        goto LABEL_35;
      case 2u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        char v18 = 2;
        goto LABEL_35;
      case 3u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        char v18 = 3;
LABEL_35:
        a1[v7] = v18;
        swift_bridgeObjectRetain();
        break;
      default:
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
        a1[v7] = 0;
        break;
    }
  }
  return a1;
}

_OWORD *sub_25A5FFFA4(_OWORD *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 4;
  if (v5 >= 4)
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
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 4;
        unsigned int v5 = v8 + 4;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  switch(v5)
  {
    case 1u:
      *a1 = *(_OWORD *)a2;
      char v10 = 1;
      break;
    case 2u:
      *a1 = *(_OWORD *)a2;
      char v10 = 2;
      break;
    case 3u:
      *a1 = *(_OWORD *)a2;
      char v10 = 3;
      break;
    default:
      (*(void (**)(_OWORD *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
      char v10 = 0;
      break;
  }
  *((unsigned char *)a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_25A600128(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 4;
    if (v8 >= 4)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 4;
          unsigned int v8 = v11 + 4;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    switch(v8)
    {
      case 1u:
      case 2u:
      case 3u:
        swift_bridgeObjectRelease();
        break;
      default:
        (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
        break;
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 4;
    if (v13 >= 4)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 4;
          unsigned int v13 = v16 + 4;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    switch(v13)
    {
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v18 = 1;
        break;
      case 2u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v18 = 2;
        break;
      case 3u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v18 = 3;
        break;
      default:
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
        char v18 = 0;
        break;
    }
    a1[v7] = v18;
  }
  return a1;
}

uint64_t sub_25A6003B8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 16;
  if (*(void *)(v3 + 64) > 0x10uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 252) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 4) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
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
  return (v5 | v10) + 253;
}

void sub_25A6004EC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x10) {
    unint64_t v5 = 16;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFD)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 252) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFC)
  {
    unsigned int v8 = a2 - 253;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x25A6006B4);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_25A6006DC(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 16;
  if (*(void *)(v2 + 64) > 0x10uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 4;
  if (v4 >= 4)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 4;
        LODWORD(v4) = v7 + 4;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_25A600794(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    size_t v4 = 16;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 3)
  {
    unsigned int v5 = a2 - 4;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 4;
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
      a1[v4] = 4;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t destroy for PreviewMetadata()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PreviewMetadata(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  uint64_t v4 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewMetadata(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PreviewMetadata(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewMetadata(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewMetadata(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewMetadata()
{
  return &type metadata for PreviewMetadata;
}

ValueMetadata *type metadata accessor for PlaygroundMetadata()
{
  return &type metadata for PlaygroundMetadata;
}

uint64_t getEnumTagSinglePayload for PlaygroundEvent(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PlaygroundEvent(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for PlaygroundEvent()
{
  return &type metadata for PlaygroundEvent;
}

uint64_t destroy for IOSurfacePayload()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IOSurfacePayload(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IOSurfacePayload(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for IOSurfacePayload(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for IOSurfacePayload()
{
  return &type metadata for IOSurfacePayload;
}

uint64_t destroy for PreviewDescription()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PreviewDescription(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_DWORD *)(a1 + 73) = *(_DWORD *)(a2 + 73);
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewDescription(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v4;
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(unsigned char *)(a1 + 75) = *(unsigned char *)(a2 + 75);
  *(unsigned char *)(a1 + 76) = *(unsigned char *)(a2 + 76);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for PreviewDescription(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(unsigned char *)(a1 + 75) = *(unsigned char *)(a2 + 75);
  *(unsigned char *)(a1 + 76) = *(unsigned char *)(a2 + 76);
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewDescription(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewDescription(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewDescription()
{
  return &type metadata for PreviewDescription;
}

ValueMetadata *type metadata accessor for PreviewContentDomain()
{
  return &type metadata for PreviewContentDomain;
}

uint64_t destroy for MessageSendingError(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 80);
  if (v2 >= 4) {
    unsigned int v2 = *(_DWORD *)a1 + 4;
  }
  switch(v2)
  {
    case 1u:
    case 2u:
    case 3u:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(a1 + 16);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1(a1 + 48);
      break;
  }
  return result;
}

uint64_t initializeWithCopy for MessageSendingError(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 80);
  if (v4 >= 4) {
    unsigned int v4 = *(_DWORD *)a2 + 4;
  }
  switch(v4)
  {
    case 1u:
      uint64_t v12 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v12;
      char v10 = 1;
      goto LABEL_8;
    case 2u:
      uint64_t v9 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v9;
      char v10 = 2;
      goto LABEL_8;
    case 3u:
      uint64_t v11 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v11;
      *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
      char v10 = 3;
LABEL_8:
      *(unsigned char *)(a1 + 80) = v10;
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v5 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v5;
      uint64_t v6 = *(void *)(a2 + 40);
      *(void *)(a1 + 40) = v6;
      int v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
      swift_bridgeObjectRetain();
      v7(a1 + 16, a2 + 16, v6);
      uint64_t v8 = *(void *)(a2 + 72);
      *(void *)(a1 + 72) = v8;
      (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 48, a2 + 48);
      *(unsigned char *)(a1 + 80) = 0;
      break;
  }
  return a1;
}

uint64_t assignWithCopy for MessageSendingError(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 80);
    if (v4 >= 4) {
      unsigned int v4 = *(_DWORD *)a1 + 4;
    }
    switch(v4)
    {
      case 1u:
      case 2u:
      case 3u:
        swift_bridgeObjectRelease();
        break;
      default:
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(a1 + 16);
        __swift_destroy_boxed_opaque_existential_1(a1 + 48);
        break;
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 80);
    if (v5 >= 4) {
      unsigned int v5 = *(_DWORD *)a2 + 4;
    }
    switch(v5)
    {
      case 1u:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        char v9 = 1;
        goto LABEL_14;
      case 2u:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        char v9 = 2;
        goto LABEL_14;
      case 3u:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
        char v9 = 3;
LABEL_14:
        *(unsigned char *)(a1 + 80) = v9;
        swift_bridgeObjectRetain();
        break;
      default:
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        uint64_t v6 = *(void *)(a2 + 40);
        *(void *)(a1 + 40) = v6;
        int v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
        swift_bridgeObjectRetain();
        v7(a1 + 16, a2 + 16, v6);
        uint64_t v8 = *(void *)(a2 + 72);
        *(void *)(a1 + 72) = v8;
        (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 48, a2 + 48);
        *(unsigned char *)(a1 + 80) = 0;
        break;
    }
  }
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for MessageSendingError(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 80);
    if (v4 >= 4) {
      unsigned int v4 = *(_DWORD *)a1 + 4;
    }
    switch(v4)
    {
      case 1u:
      case 2u:
      case 3u:
        swift_bridgeObjectRelease();
        break;
      default:
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(a1 + 16);
        __swift_destroy_boxed_opaque_existential_1(a1 + 48);
        break;
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 80);
    if (v5 >= 4) {
      unsigned int v5 = *(_DWORD *)a2 + 4;
    }
    switch(v5)
    {
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v6 = 1;
        break;
      case 2u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v6 = 2;
        break;
      case 3u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
        char v6 = 3;
        break;
      default:
        char v6 = 0;
        long long v7 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 48) = v7;
        *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
        long long v8 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v8;
        break;
    }
    *(unsigned char *)(a1 + 80) = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageSendingError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 >= 4) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MessageSendingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 80) = 0;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_DWORD *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25A6015C4(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 80);
  if (result >= 4) {
    return (*(_DWORD *)a1 + 4);
  }
  return result;
}

uint64_t sub_25A6015E0(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_DWORD *)uint64_t result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessageSendingError()
{
  return &type metadata for MessageSendingError;
}

unsigned char *_s19PreviewsMessagingOS16AgentMessageTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x25A6016E8);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewDescription.Key()
{
  return &type metadata for PreviewDescription.Key;
}

unsigned char *_s19PreviewsMessagingOS10ChromeTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x25A6017ECLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IOSurfacePayload.Key()
{
  return &type metadata for IOSurfacePayload.Key;
}

ValueMetadata *type metadata accessor for PlaygroundEvent.CodingKeys()
{
  return &type metadata for PlaygroundEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for PlaygroundEvent.ExitedNormallyCodingKeys()
{
  return &type metadata for PlaygroundEvent.ExitedNormallyCodingKeys;
}

ValueMetadata *type metadata accessor for PlaygroundEvent.ThrewErrorCodingKeys()
{
  return &type metadata for PlaygroundEvent.ThrewErrorCodingKeys;
}

ValueMetadata *type metadata accessor for PlaygroundMetadata.CodingKeys()
{
  return &type metadata for PlaygroundMetadata.CodingKeys;
}

ValueMetadata *type metadata accessor for PreviewMetadata.Key()
{
  return &type metadata for PreviewMetadata.Key;
}

ValueMetadata *type metadata accessor for Explanation.Key()
{
  return &type metadata for Explanation.Key;
}

ValueMetadata *type metadata accessor for PreviewTraits.Layout.Discriminant()
{
  return &type metadata for PreviewTraits.Layout.Discriminant;
}

ValueMetadata *type metadata accessor for PreviewTraits.Layout.Key()
{
  return &type metadata for PreviewTraits.Layout.Key;
}

ValueMetadata *type metadata accessor for PreviewTraits.Key()
{
  return &type metadata for PreviewTraits.Key;
}

ValueMetadata *type metadata accessor for PreviewInstancesPayload.Key()
{
  return &type metadata for PreviewInstancesPayload.Key;
}

ValueMetadata *type metadata accessor for LayerHostPayload.Key()
{
  return &type metadata for LayerHostPayload.Key;
}

ValueMetadata *type metadata accessor for RenderPayload.Key()
{
  return &type metadata for RenderPayload.Key;
}

unsigned char *storeEnumTagSinglePayload for HostedPreviewReply.Key(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x25A6019C0);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HostedPreviewReply.Key()
{
  return &type metadata for HostedPreviewReply.Key;
}

ValueMetadata *type metadata accessor for StaticPreviewReply.Key()
{
  return &type metadata for StaticPreviewReply.Key;
}

ValueMetadata *type metadata accessor for GridIndex.Key()
{
  return &type metadata for GridIndex.Key;
}

unsigned char *_s19PreviewsMessagingOS13PreviewTraitsV11OrientationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A601AE4);
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

ValueMetadata *type metadata accessor for HostIdentity.Discriminant()
{
  return &type metadata for HostIdentity.Discriminant;
}

ValueMetadata *type metadata accessor for HostIdentity.Key()
{
  return &type metadata for HostIdentity.Key;
}

unsigned char *_s19PreviewsMessagingOS15PlaygroundEventO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A601BF8);
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

ValueMetadata *type metadata accessor for SceneLayout.Discriminant()
{
  return &type metadata for SceneLayout.Discriminant;
}

unsigned char *_s19PreviewsMessagingOS20PreviewContentDomainOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A601CFCLL);
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

ValueMetadata *type metadata accessor for SceneLayout.Key()
{
  return &type metadata for SceneLayout.Key;
}

ValueMetadata *type metadata accessor for GeometryPayload.Key()
{
  return &type metadata for GeometryPayload.Key;
}

unsigned char *_s19PreviewsMessagingOS15PlaygroundEventO20ThrewErrorCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25A601DE0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TimelinePayload.Key()
{
  return &type metadata for TimelinePayload.Key;
}

unsigned char *_s19PreviewsMessagingOS15PreviewMetadataV3KeyOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A601EE4);
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

ValueMetadata *type metadata accessor for LegacyAgentPayload.Key()
{
  return &type metadata for LegacyAgentPayload.Key;
}

unint64_t sub_25A601F20()
{
  unint64_t result = qword_26A42BA20;
  if (!qword_26A42BA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA20);
  }
  return result;
}

unint64_t sub_25A601F78()
{
  unint64_t result = qword_26A42BA28;
  if (!qword_26A42BA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA28);
  }
  return result;
}

unint64_t sub_25A601FD0()
{
  unint64_t result = qword_26A42BA30;
  if (!qword_26A42BA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA30);
  }
  return result;
}

unint64_t sub_25A602028()
{
  unint64_t result = qword_26A42BA38;
  if (!qword_26A42BA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA38);
  }
  return result;
}

unint64_t sub_25A602080()
{
  unint64_t result = qword_26A42BA40;
  if (!qword_26A42BA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA40);
  }
  return result;
}

unint64_t sub_25A6020D8()
{
  unint64_t result = qword_26A42BA48;
  if (!qword_26A42BA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA48);
  }
  return result;
}

unint64_t sub_25A602130()
{
  unint64_t result = qword_26A42BA50;
  if (!qword_26A42BA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA50);
  }
  return result;
}

unint64_t sub_25A602188()
{
  unint64_t result = qword_26A42BA58;
  if (!qword_26A42BA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA58);
  }
  return result;
}

unint64_t sub_25A6021E0()
{
  unint64_t result = qword_26A42BA60;
  if (!qword_26A42BA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA60);
  }
  return result;
}

unint64_t sub_25A602238()
{
  unint64_t result = qword_26A42BA68;
  if (!qword_26A42BA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA68);
  }
  return result;
}

unint64_t sub_25A602290()
{
  unint64_t result = qword_26A42BA70;
  if (!qword_26A42BA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA70);
  }
  return result;
}

unint64_t sub_25A6022E8()
{
  unint64_t result = qword_26A42BA78;
  if (!qword_26A42BA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA78);
  }
  return result;
}

unint64_t sub_25A602340()
{
  unint64_t result = qword_26A42BA80;
  if (!qword_26A42BA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA80);
  }
  return result;
}

unint64_t sub_25A602398()
{
  unint64_t result = qword_26A42BA88;
  if (!qword_26A42BA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA88);
  }
  return result;
}

unint64_t sub_25A6023F0()
{
  unint64_t result = qword_26A42BA90;
  if (!qword_26A42BA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA90);
  }
  return result;
}

unint64_t sub_25A602448()
{
  unint64_t result = qword_26A42BA98;
  if (!qword_26A42BA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BA98);
  }
  return result;
}

unint64_t sub_25A6024A0()
{
  unint64_t result = qword_26A42BAA0;
  if (!qword_26A42BAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BAA0);
  }
  return result;
}

uint64_t sub_25A6024F4()
{
  return swift_getWitnessTable();
}

uint64_t sub_25A602510()
{
  return swift_getWitnessTable();
}

uint64_t sub_25A60252C()
{
  return swift_getWitnessTable();
}

unint64_t sub_25A60254C()
{
  unint64_t result = qword_26A42BAA8;
  if (!qword_26A42BAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BAA8);
  }
  return result;
}

unint64_t sub_25A6025A4()
{
  unint64_t result = qword_26A42BAB0;
  if (!qword_26A42BAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BAB0);
  }
  return result;
}

unint64_t sub_25A6025FC()
{
  unint64_t result = qword_26A42BAB8;
  if (!qword_26A42BAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BAB8);
  }
  return result;
}

unint64_t sub_25A602654()
{
  unint64_t result = qword_26A42BAC0;
  if (!qword_26A42BAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BAC0);
  }
  return result;
}

unint64_t sub_25A6026AC()
{
  unint64_t result = qword_26A42BAC8;
  if (!qword_26A42BAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BAC8);
  }
  return result;
}

unint64_t sub_25A602704()
{
  unint64_t result = qword_26A42BAD0;
  if (!qword_26A42BAD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A42BAD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BAD0);
  }
  return result;
}

unint64_t sub_25A602764()
{
  unint64_t result = qword_26A42BAE0;
  if (!qword_26A42BAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BAE0);
  }
  return result;
}

unint64_t sub_25A6027BC()
{
  unint64_t result = qword_26A42BAE8;
  if (!qword_26A42BAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BAE8);
  }
  return result;
}

unint64_t sub_25A602814()
{
  unint64_t result = qword_26A42BAF0;
  if (!qword_26A42BAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BAF0);
  }
  return result;
}

unint64_t sub_25A60286C()
{
  unint64_t result = qword_26A42BAF8;
  if (!qword_26A42BAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BAF8);
  }
  return result;
}

unint64_t sub_25A6028C4()
{
  unint64_t result = qword_26A42BB00;
  if (!qword_26A42BB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB00);
  }
  return result;
}

unint64_t sub_25A60291C()
{
  unint64_t result = qword_26A42BB08;
  if (!qword_26A42BB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB08);
  }
  return result;
}

unint64_t sub_25A602974()
{
  unint64_t result = qword_26A42BB10;
  if (!qword_26A42BB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB10);
  }
  return result;
}

unint64_t sub_25A6029CC()
{
  unint64_t result = qword_26A42BB18;
  if (!qword_26A42BB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB18);
  }
  return result;
}

unint64_t sub_25A602A24()
{
  unint64_t result = qword_26A42BB20;
  if (!qword_26A42BB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB20);
  }
  return result;
}

uint64_t sub_25A602A78()
{
  return swift_getWitnessTable();
}

uint64_t sub_25A602A94()
{
  return swift_getWitnessTable();
}

unint64_t sub_25A602AB0()
{
  unint64_t result = qword_26A42BB28;
  if (!qword_26A42BB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB28);
  }
  return result;
}

unint64_t sub_25A602B04()
{
  unint64_t result = qword_26A42BB30;
  if (!qword_26A42BB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB30);
  }
  return result;
}

unint64_t sub_25A602B58()
{
  unint64_t result = qword_26A42BB38;
  if (!qword_26A42BB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB38);
  }
  return result;
}

uint64_t sub_25A602BAC()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t sub_25A602BF8()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 7) {
    return 7;
  }
  else {
    return v0;
  }
}

uint64_t sub_25A602C40(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25A6233B0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25A602CD8()
{
  return 0x4E79616C70736964;
}

uint64_t sub_25A602CF8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6F4E646574697865 && a2 == 0xEE00796C6C616D72;
  if (v3 || (sub_25A6233B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7272457765726874 && a2 == 0xEA0000000000726FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25A6233B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25A602E04(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25A6233B0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25A602E9C()
{
  return 0x7470697263736564;
}

uint64_t sub_25A602EBC()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_25A602F08()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA) {
    return 10;
  }
  else {
    return v0;
  }
}

unint64_t sub_25A602F54()
{
  unint64_t result = qword_26A42BB40;
  if (!qword_26A42BB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB40);
  }
  return result;
}

unint64_t sub_25A602FA8()
{
  unint64_t result = qword_26A42BB48;
  if (!qword_26A42BB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB48);
  }
  return result;
}

unint64_t sub_25A602FFC()
{
  unint64_t result = qword_26A42BB50;
  if (!qword_26A42BB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB50);
  }
  return result;
}

uint64_t sub_25A603050()
{
  return sub_25A5F38AC();
}

unint64_t sub_25A60306C()
{
  unint64_t result = qword_26A42BB58;
  if (!qword_26A42BB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB58);
  }
  return result;
}

uint64_t sub_25A6030C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(v2 + 16);
  unint64_t v4 = *(void *)(v2 + 24);
  *a2 = v3;
  a2[1] = v4;
  return sub_25A59FB7C(v3, v4);
}

unint64_t sub_25A6030D0()
{
  unint64_t result = qword_26A42BB60;
  if (!qword_26A42BB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BB60);
  }
  return result;
}

uint64_t sub_25A603124(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_25A5F2480(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_25A603174(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_24;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_24:
    uint64_t v14 = result;
    uint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_25A623450();
    swift_bridgeObjectRetain_n();
    sub_25A622DF0();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_25A6234A0();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    unsigned __int8 v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_25A6233B0() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_25A6233B0() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_39:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    unint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 4;
  if (v3 + 4 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_23;
    }
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_25A603408(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_24;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_24:
    uint64_t v14 = result;
    uint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_25A623450();
    swift_bridgeObjectRetain();
    sub_25A622DF0();
    uint64_t v18 = sub_25A6234A0();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    unsigned __int8 v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_25A6233B0() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_25A6233B0() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_39:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    unint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 4;
  if (v3 + 4 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_23;
    }
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_25A603690(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) == *(void *)(a2 + 16))
  {
    int64_t v4 = 0;
    uint64_t v24 = result;
    uint64_t v25 = result + 56;
    uint64_t v5 = 1 << *(unsigned char *)(result + 32);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(result + 56);
    int64_t v26 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = a2 + 56;
    if (!v7) {
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v28 = (v7 - 1) & v7;
    for (unint64_t i = __clz(__rbit64(v7)) | (v4 << 6); ; unint64_t i = __clz(__rbit64(v11)) + (v4 << 6))
    {
      int v13 = *(unsigned __int8 *)(*(void *)(v3 + 48) + i);
      sub_25A623450();
      if (v13) {
        uint64_t v14 = 1131045487;
      }
      else {
        uint64_t v14 = 0x64616F4C6C6C61;
      }
      sub_25A622DF0();
      swift_bridgeObjectRelease();
      uint64_t v15 = sub_25A6234A0();
      uint64_t v16 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v17 = v15 & ~v16;
      if (((*(void *)(v8 + ((v17 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v17) & 1) == 0) {
        return 0;
      }
      int64_t v27 = v4;
      uint64_t v18 = ~v16;
      if (v13) {
        unint64_t v19 = 0xE400000000000000;
      }
      else {
        unint64_t v19 = 0xE700000000000000;
      }
      while (1)
      {
        uint64_t v20 = *(unsigned char *)(*(void *)(a2 + 48) + v17) ? 1131045487 : 0x64616F4C6C6C61;
        unint64_t v21 = *(unsigned char *)(*(void *)(a2 + 48) + v17) ? 0xE400000000000000 : 0xE700000000000000;
        if (v20 == v14 && v21 == v19) {
          break;
        }
        char v23 = sub_25A6233B0();
        swift_bridgeObjectRelease();
        unint64_t result = swift_bridgeObjectRelease();
        if (v23) {
          goto LABEL_43;
        }
        unint64_t v17 = (v17 + 1) & v18;
        if (((*(void *)(v8 + ((v17 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v17) & 1) == 0) {
          return 0;
        }
      }
      swift_bridgeObjectRelease();
      unint64_t result = swift_bridgeObjectRelease();
LABEL_43:
      uint64_t v3 = v24;
      int64_t v4 = v27;
      unint64_t v7 = v28;
      if (v28) {
        goto LABEL_7;
      }
LABEL_8:
      int64_t v10 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        break;
      }
      if (v10 >= v26) {
        return 1;
      }
      unint64_t v11 = *(void *)(v25 + 8 * v10);
      ++v4;
      if (!v11)
      {
        int64_t v4 = v10 + 1;
        if (v10 + 1 >= v26) {
          return 1;
        }
        unint64_t v11 = *(void *)(v25 + 8 * v4);
        if (!v11)
        {
          int64_t v4 = v10 + 2;
          if (v10 + 2 >= v26) {
            return 1;
          }
          unint64_t v11 = *(void *)(v25 + 8 * v4);
          if (!v11)
          {
            int64_t v12 = v10 + 3;
            if (v12 >= v26) {
              return 1;
            }
            unint64_t v11 = *(void *)(v25 + 8 * v12);
            if (!v11)
            {
              while (1)
              {
                int64_t v4 = v12 + 1;
                if (__OFADD__(v12, 1)) {
                  goto LABEL_48;
                }
                if (v4 >= v26) {
                  return 1;
                }
                unint64_t v11 = *(void *)(v25 + 8 * v4);
                ++v12;
                if (v11) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v4 = v12;
          }
        }
      }
LABEL_21:
      uint64_t v28 = (v11 - 1) & v11;
    }
    __break(1u);
LABEL_48:
    __break(1u);
    return result;
  }
  return 0;
}

uint64_t sub_25A60395C(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v3 + 4;
          if (v3 + 4 >= v30) {
            return 1;
          }
          unint64_t v11 = *(void *)(v29 + 8 * v12);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_25:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    uint64_t v14 = result;
    uint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_25A623450();
    swift_bridgeObjectRetain_n();
    sub_25A622DF0();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_25A6234A0();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    unsigned __int8 v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_25A6233B0() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        int64_t v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_25A6233B0() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    unint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 5;
  if (v3 + 5 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_25;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t PreviewVariantGroup.id.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t PreviewVariantGroup.id.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*PreviewVariantGroup.id.modify())()
{
  return nullsub_1;
}

uint64_t PreviewVariantGroup.associatedGroupIDs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PreviewVariantGroup.associatedGroupIDs.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*PreviewVariantGroup.associatedGroupIDs.modify())()
{
  return nullsub_1;
}

uint64_t PreviewVariantGroup.overridesConfiguration.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  uint64_t v4 = v1[5];
  uint64_t v5 = v1[6];
  uint64_t v6 = v1[7];
  uint64_t v7 = v1[8];
  uint64_t v8 = v1[9];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  return sub_25A603CE4(v2, v3);
}

uint64_t sub_25A603CE4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_25A603D5C();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25A603D5C()
{
  return swift_bridgeObjectRetain();
}

__n128 PreviewVariantGroup.overridesConfiguration.setter(long long *a1)
{
  long long v5 = a1[1];
  long long v6 = *a1;
  __n128 v4 = (__n128)a1[2];
  uint64_t v2 = *((void *)a1 + 6);
  sub_25A603DD4(*(void *)(v1 + 24), *(void *)(v1 + 32));
  *(_OWORD *)(v1 + 24) = v6;
  *(_OWORD *)(v1 + 40) = v5;
  __n128 result = v4;
  *(__n128 *)(v1 + 56) = v4;
  *(void *)(v1 + 72) = v2;
  return result;
}

uint64_t sub_25A603DD4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    sub_25A603E4C();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25A603E4C()
{
  return swift_bridgeObjectRelease();
}

uint64_t (*PreviewVariantGroup.overridesConfiguration.modify())()
{
  return nullsub_1;
}

uint64_t PreviewVariantGroup.variantsConfiguration.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[10];
  uint64_t v3 = v1[11];
  uint64_t v4 = v1[12];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  return sub_25A603E8C(v2, v3);
}

uint64_t sub_25A603E8C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

__n128 PreviewVariantGroup.variantsConfiguration.setter(__n128 *a1)
{
  __n128 v4 = *a1;
  uint64_t v2 = a1[1].n128_i64[0];
  sub_25A603F18(v1[10], v1[11]);
  __n128 result = v4;
  *((__n128 *)v1 + 5) = v4;
  v1[12] = v2;
  return result;
}

uint64_t sub_25A603F18(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*PreviewVariantGroup.variantsConfiguration.modify())()
{
  return nullsub_1;
}

__n128 PreviewVariantGroup.init(id:associatedGroupIDs:overridesConfiguration:variantsConfiguration:)@<Q0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __n128 *a4@<X3>, uint64_t a5@<X8>)
{
  long long v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a5 + 24) = *(_OWORD *)a3;
  uint64_t v6 = a1[1];
  uint64_t v7 = *(void *)(a3 + 48);
  unint64_t v8 = a4[1].n128_u64[0];
  *(void *)a5 = *a1;
  *(void *)(a5 + 8) = v6;
  *(void *)(a5 + 16) = a2;
  *(_OWORD *)(a5 + 40) = v5;
  *(_OWORD *)(a5 + 56) = *(_OWORD *)(a3 + 32);
  *(void *)(a5 + 72) = v7;
  __n128 result = *a4;
  *(__n128 *)(a5 + 80) = *a4;
  *(void *)(a5 + 96) = v8;
  return result;
}

unint64_t sub_25A603FB8(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      unint64_t result = 25705;
      break;
  }
  return result;
}

uint64_t sub_25A60404C(char *a1, char *a2)
{
  return sub_25A5E9D84(*a1, *a2);
}

uint64_t sub_25A604058()
{
  return sub_25A619F08();
}

uint64_t sub_25A604060()
{
  return sub_25A54A8AC();
}

uint64_t sub_25A604068()
{
  return sub_25A61D060();
}

uint64_t sub_25A604070@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A609038();
  *a1 = result;
  return result;
}

unint64_t sub_25A6040A0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A603FB8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A6040CC()
{
  return sub_25A603FB8(*v0);
}

uint64_t PreviewVariantGroup.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A604134(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_bridgeObjectRetain();
  long long v5 = sub_25A559864(v4);
  swift_bridgeObjectRelease();
  sub_25A55C73C((uint64_t)(a1 + 3), (uint64_t)v16, &qword_26A42BD88);
  sub_25A55C73C((uint64_t)(a1 + 10), (uint64_t)v15, &qword_26A42BD90);
  char v14 = 0;
  uint64_t v12 = v3;
  uint64_t v13 = v2;
  char v11 = 3;
  int64_t v10 = v5;
  v9[63] = 1;
  sub_25A55C73C((uint64_t)v16, (uint64_t)v9, &qword_26A42BD88);
  v8[31] = 2;
  sub_25A55C73C((uint64_t)v15, (uint64_t)v8, &qword_26A42BD90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BBB8);
  sub_25A60469C();
  sub_25A6046F0();
  sub_25A6098FC(&qword_26A42BBC0, &qword_26A42BBB8, (void (*)(void))sub_25A6046F0);
  sub_25A60911C();
  sub_25A609170();
  uint64_t v6 = sub_25A622A60();
  swift_bridgeObjectRelease();
  swift_release();
  return v6;
}

uint64_t sub_25A6042F8()
{
  return sub_25A604134(*(uint64_t **)(v0 + 16));
}

uint64_t PreviewVariantGroup.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = &type metadata for PreviewVariantGroup.Key;
  unint64_t v5 = sub_25A60469C();
  unint64_t v27 = v5;
  LOBYTE(v25[0]) = 0;
  sub_25A6046F0();
  sub_25A622710();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    uint64_t v8 = v30;
    uint64_t v7 = v31;
    uint64_t v26 = &type metadata for PreviewVariantGroup.Key;
    unint64_t v27 = v5;
    LOBYTE(v25[0]) = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BBB8);
    sub_25A6098FC(&qword_26A42BBC0, &qword_26A42BBB8, (void (*)(void))sub_25A6046F0);
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    if (v22[0]) {
      uint64_t v10 = v22[0];
    }
    else {
      uint64_t v10 = MEMORY[0x263F8EE78];
    }
    uint64_t v11 = sub_25A609084(v10);
    swift_bridgeObjectRelease();
    BOOL v23 = &type metadata for PreviewVariantGroup.Key;
    unint64_t v24 = v5;
    LOBYTE(v22[0]) = 1;
    sub_25A60911C();
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    uint64_t v12 = v25[0];
    uint64_t v15 = v25[1];
    uint64_t v16 = v25[2];
    uint64_t v17 = v26;
    unint64_t v18 = v27;
    uint64_t v19 = v28;
    uint64_t v32 = v29;
    BOOL v23 = &type metadata for PreviewVariantGroup.Key;
    unint64_t v24 = v5;
    LOBYTE(v22[0]) = 2;
    sub_25A609170();
    sub_25A622760();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    uint64_t v13 = sub_25A6227C0();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
    *(void *)a2 = v8;
    *(void *)(a2 + 8) = v7;
    *(void *)(a2 + 16) = v11;
    *(void *)(a2 + 24) = v12;
    *(void *)(a2 + 32) = v15;
    *(void *)(a2 + 40) = v16;
    *(void *)(a2 + 48) = v17;
    *(void *)(a2 + 56) = v18;
    uint64_t v14 = v32;
    *(void *)(a2 + 64) = v19;
    *(void *)(a2 + 72) = v14;
    *(_OWORD *)(a2 + 80) = v20;
    *(void *)(a2 + 96) = v21;
  }
  return result;
}

unint64_t sub_25A60469C()
{
  unint64_t result = qword_26A42BBA8;
  if (!qword_26A42BBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BBA8);
  }
  return result;
}

unint64_t sub_25A6046F0()
{
  unint64_t result = qword_26A42BBB0;
  if (!qword_26A42BBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BBB0);
  }
  return result;
}

uint64_t sub_25A604748()
{
  return sub_25A622780();
}

uint64_t sub_25A6047A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewVariantGroup.init(propertyListValue:)(a1, a2);
}

uint64_t PreviewVariantGroup.overridesVariants.getter()
{
  if (*(void *)(v0 + 32)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return MEMORY[0x263F8EE78];
  }
}

uint64_t PreviewVariantGroup.gridVariants.getter()
{
  uint64_t result = MEMORY[0x263F8EE78];
  if (*(void *)(v0 + 88))
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    uint64_t v2 = *(void *)(*(void *)(v0 + 96) + 16);
    if (v2)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v3 = 48;
      do
      {
        uint64_t v4 = swift_bridgeObjectRetain();
        sub_25A5550B0(v4);
        v3 += 24;
        --v2;
      }
      while (v2);
      swift_bridgeObjectRelease_n();
      return v5;
    }
  }
  return result;
}

uint64_t PreviewVariantGroup.allVariants.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BBD8);
  MEMORY[0x270FA5388](v1);
  if (*(void *)(v0 + 32)) {
    swift_bridgeObjectRetain();
  }
  uint64_t v2 = PreviewVariantGroup.gridVariants.getter();
  sub_25A5550B0(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BBE0);
  sub_25A6091C4();
  sub_25A55DAA4(&qword_26A42BBF0, &qword_26A42BBE0);
  sub_25A6223A0();
  sub_25A55DAA4(&qword_26A42BBF8, &qword_26A42BBD8);
  return sub_25A622E20();
}

uint64_t PreviewOverridesConfiguration.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewOverridesConfiguration.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PreviewOverridesConfiguration.title.modify())()
{
  return nullsub_1;
}

uint64_t PreviewOverridesConfiguration.selectionBehavior.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  char v4 = *(unsigned char *)(v1 + 40);
  *(void *)a1 = *(void *)(v1 + 16);
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  return sub_25A603D5C();
}

__n128 PreviewOverridesConfiguration.selectionBehavior.setter(__n128 *a1)
{
  __n128 v5 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unsigned __int8 v3 = a1[1].n128_u8[8];
  sub_25A603E4C();
  __n128 result = v5;
  v1[1] = v5;
  v1[2].n128_u64[0] = v2;
  v1[2].n128_u8[8] = v3;
  return result;
}

uint64_t (*PreviewOverridesConfiguration.selectionBehavior.modify())()
{
  return nullsub_1;
}

uint64_t PreviewOverridesConfiguration.variants.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PreviewOverridesConfiguration.variants.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t (*PreviewOverridesConfiguration.variants.modify())()
{
  return nullsub_1;
}

__n128 PreviewOverridesConfiguration.init(title:selectionBehavior:variants:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, __n128 *a3@<X2>, unint64_t a4@<X3>, __n128 *a5@<X8>)
{
  unint64_t v5 = a3[1].n128_u64[0];
  unsigned __int8 v6 = a3[1].n128_u8[8];
  a5->n128_u64[0] = a1;
  a5->n128_u64[1] = a2;
  __n128 result = *a3;
  a5[1] = *a3;
  a5[2].n128_u64[0] = v5;
  a5[2].n128_u8[8] = v6;
  a5[3].n128_u64[0] = a4;
  return result;
}

uint64_t sub_25A604BC4(char a1)
{
  if (!a1) {
    return 0x656C746974;
  }
  if (a1 == 1) {
    return 0xD000000000000011;
  }
  return 0x73746E6169726176;
}

uint64_t sub_25A604C1C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25A5E8038(*a1, *a2);
}

uint64_t sub_25A604C28()
{
  return sub_25A619FEC();
}

uint64_t sub_25A604C30()
{
  return sub_25A549864();
}

uint64_t sub_25A604C38()
{
  return sub_25A61E520();
}

uint64_t sub_25A604C40@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A570B50();
  *a1 = result;
  return result;
}

uint64_t sub_25A604C78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A604BC4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A604CA4()
{
  return sub_25A604BC4(*v0);
}

uint64_t PreviewOverridesConfiguration.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A604D04()
{
  return sub_25A622A70();
}

uint64_t PreviewOverridesConfiguration.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = &type metadata for PreviewOverridesConfiguration.Key;
  unint64_t v5 = sub_25A609220();
  unint64_t v18 = v5;
  v16[0] = 0;
  sub_25A622710();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    uint64_t v8 = v19;
    uint64_t v7 = v20;
    uint64_t v17 = &type metadata for PreviewOverridesConfiguration.Key;
    unint64_t v18 = v5;
    v16[0] = 1;
    sub_25A609274();
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    uint64_t v17 = &type metadata for PreviewOverridesConfiguration.Key;
    unint64_t v18 = v5;
    v16[0] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BBE0);
    sub_25A6098FC(&qword_26A42BC10, &qword_26A42BBE0, (void (*)(void))sub_25A6092C8);
    sub_25A622710();
    uint64_t v10 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    uint64_t v11 = v21;
    *(void *)a2 = v8;
    *(void *)(a2 + 8) = v7;
    *(void *)(a2 + 16) = v12;
    *(void *)(a2 + 24) = v13;
    *(void *)(a2 + 32) = v14;
    *(unsigned char *)(a2 + 40) = v15;
    *(void *)(a2 + 48) = v11;
  }
  return result;
}

uint64_t PreviewOverridesConfiguration.defaultSelection.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (*(unsigned char *)(v0 + 40))
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v4 = v0 + 24;
    uint64_t v2 = *(void *)(v0 + 24);
    uint64_t v3 = *(void *)(v4 + 8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BC20);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25A625820;
    *(void *)(inited + 32) = v2;
    *(void *)(inited + 40) = v3;
    sub_25A603D5C();
    uint64_t v1 = sub_25A60931C(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
  }
  return v1;
}

uint64_t sub_25A60518C()
{
  return sub_25A622780();
}

uint64_t sub_25A6051E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewOverridesConfiguration.init(propertyListValue:)(a1, a2);
}

uint64_t PreviewVariantsConfiguration.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

PreviewsMessagingOS::PreviewVariantsConfiguration __swiftcall PreviewVariantsConfiguration.init(title:variants:)(Swift::String title, Swift::OpaquePointer variants)
{
  object = title._object;
  uint64_t countAndFlagsBits = title._countAndFlagsBits;
  uint64_t v6 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BC28);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25A625820;
  *(void *)(v7 + 32) = 0;
  *(void *)(v7 + 40) = 0;
  *(Swift::OpaquePointer *)(v7 + 48) = variants;
  *uint64_t v6 = countAndFlagsBits;
  v6[1] = (uint64_t)object;
  v6[2] = v7;
  result.sections._rawValue = v9;
  result.title._object = v8;
  result.title._uint64_t countAndFlagsBits = v7;
  return result;
}

PreviewsMessagingOS::PreviewVariantsConfiguration __swiftcall PreviewVariantsConfiguration.init(title:sections:)(Swift::String title, Swift::OpaquePointer sections)
{
  *(Swift::String *)uint64_t v2 = title;
  *(Swift::OpaquePointer *)(v2 + 16) = sections;
  result.title = title;
  result.sections = sections;
  return result;
}

uint64_t sub_25A6052A4(char a1)
{
  if (a1) {
    return 0x736E6F6974636573;
  }
  else {
    return 0x656C746974;
  }
}

uint64_t sub_25A6052D8(char *a1, char *a2)
{
  return sub_25A5E8D50(*a1, *a2);
}

uint64_t sub_25A6052E4()
{
  return sub_25A61A090();
}

uint64_t sub_25A6052EC()
{
  return sub_25A549F14();
}

uint64_t sub_25A6052F4()
{
  return sub_25A61DCBC();
}

uint64_t sub_25A6052FC@<X0>(char *a1@<X8>)
{
  return sub_25A56B748(a1);
}

uint64_t sub_25A605308@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A6052A4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A605334()
{
  return sub_25A6052A4(*v0);
}

uint64_t PreviewVariantsConfiguration.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A605384()
{
  return sub_25A622A80();
}

uint64_t PreviewVariantsConfiguration.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v13 = &type metadata for PreviewVariantsConfiguration.Key;
  unint64_t v5 = sub_25A6094D8();
  unint64_t v14 = v5;
  v12[0] = 0;
  sub_25A622710();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    uint64_t v8 = v15;
    uint64_t v7 = v16;
    uint64_t v13 = &type metadata for PreviewVariantsConfiguration.Key;
    unint64_t v14 = v5;
    v12[0] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BC38);
    sub_25A6098FC(&qword_26A42BC40, &qword_26A42BC38, (void (*)(void))sub_25A60952C);
    sub_25A622710();
    uint64_t v10 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    uint64_t v11 = v17;
    *a2 = v8;
    a2[1] = v7;
    a2[2] = v11;
  }
  return result;
}

uint64_t static PreviewVariantsConfiguration.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_25A6233B0() & 1) == 0) {
    return 0;
  }

  return sub_25A566FCC(v2, v3);
}

uint64_t sub_25A6056AC()
{
  return sub_25A622780();
}

uint64_t sub_25A6056F4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return PreviewVariantsConfiguration.init(propertyListValue:)(a1, a2);
}

uint64_t sub_25A60570C(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_25A6233B0() & 1) == 0) {
    return 0;
  }

  return sub_25A566FCC(v2, v3);
}

uint64_t PreviewVariantsConfiguration.Section.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewVariantsConfiguration.Section.variants.getter()
{
  return swift_bridgeObjectRetain();
}

PreviewsMessagingOS::PreviewVariantsConfiguration::Section __swiftcall PreviewVariantsConfiguration.Section.init(title:variants:)(Swift::String title, Swift::OpaquePointer variants)
{
  *(Swift::String *)uint64_t v2 = title;
  *(Swift::OpaquePointer *)(v2 + 16) = variants;
  result.title.value = title;
  result.variants = variants;
  return result;
}

uint64_t sub_25A6057C4(char a1)
{
  if (a1) {
    return 0x73746E6169726176;
  }
  else {
    return 0x656C746974;
  }
}

uint64_t sub_25A6057F8(char *a1, char *a2)
{
  return sub_25A5E8CB0(*a1, *a2);
}

uint64_t sub_25A605804()
{
  return sub_25A61A110();
}

uint64_t sub_25A60580C()
{
  return sub_25A549EAC();
}

uint64_t sub_25A605814()
{
  return sub_25A61DD38();
}

uint64_t sub_25A60581C@<X0>(char *a1@<X8>)
{
  return sub_25A56B748(a1);
}

uint64_t sub_25A605828@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A6057C4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A605854()
{
  return sub_25A6057C4(*v0);
}

uint64_t PreviewVariantsConfiguration.Section.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A6058A4()
{
  return sub_25A622A80();
}

uint64_t PreviewVariantsConfiguration.Section.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v13 = &type metadata for PreviewVariantsConfiguration.Section.Key;
  unint64_t v5 = sub_25A60958C();
  unint64_t v14 = v5;
  v12[0] = 0;
  sub_25A622760();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    uint64_t v8 = v15;
    uint64_t v7 = v16;
    uint64_t v13 = &type metadata for PreviewVariantsConfiguration.Section.Key;
    unint64_t v14 = v5;
    v12[0] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BBE0);
    sub_25A6098FC(&qword_26A42BC10, &qword_26A42BBE0, (void (*)(void))sub_25A6092C8);
    sub_25A622710();
    uint64_t v10 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    uint64_t v11 = v17;
    *a2 = v8;
    a2[1] = v7;
    a2[2] = v11;
  }
  return result;
}

uint64_t sub_25A605B5C()
{
  return sub_25A622780();
}

uint64_t sub_25A605BA4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return PreviewVariantsConfiguration.Section.init(propertyListValue:)(a1, a2);
}

PreviewsMessagingOS::PreviewOverridesConfiguration::SelectionBehavior::Discriminant_optional __swiftcall PreviewOverridesConfiguration.SelectionBehavior.Discriminant.init(rawValue:)(Swift::String rawValue)
{
  return (PreviewsMessagingOS::PreviewOverridesConfiguration::SelectionBehavior::Discriminant_optional)sub_25A54CE7C(v1);
}

uint64_t PreviewOverridesConfiguration.SelectionBehavior.Discriminant.rawValue.getter()
{
  if (*v0) {
    return 0x6C655369746C756DLL;
  }
  else {
    return 0x6553656C676E6973;
  }
}

uint64_t sub_25A605C18(char a1)
{
  if (!a1) {
    return 0x696D697263736964;
  }
  if (a1 == 1) {
    return 0xD000000000000019;
  }
  return 0xD000000000000018;
}

uint64_t sub_25A605C7C(char *a1, char *a2)
{
  return sub_25A5E8250(*a1, *a2);
}

uint64_t sub_25A605C88()
{
  return sub_25A61A190();
}

uint64_t sub_25A605C90()
{
  return sub_25A549988();
}

uint64_t sub_25A605C98()
{
  return sub_25A61E3E4();
}

PreviewsMessagingOS::PreviewOverridesConfiguration::SelectionBehavior::Discriminant_optional sub_25A605CA0(Swift::String *a1)
{
  return PreviewOverridesConfiguration.SelectionBehavior.Discriminant.init(rawValue:)(*a1);
}

uint64_t sub_25A605CAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PreviewOverridesConfiguration.SelectionBehavior.Discriminant.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25A605CD4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A60B37C();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A605D30()
{
  return sub_25A622B20();
}

uint64_t sub_25A605D98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25A5E813C(*a1, *a2);
}

uint64_t sub_25A605DA4()
{
  return sub_25A61A224();
}

uint64_t sub_25A605DAC()
{
  return sub_25A5498F0();
}

uint64_t sub_25A605DB4()
{
  return sub_25A61E474();
}

uint64_t sub_25A605DBC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A570B50();
  *a1 = result;
  return result;
}

uint64_t sub_25A605DF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A605C18(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A605E20()
{
  return sub_25A605C18(*v0);
}

uint64_t PreviewOverridesConfiguration.SelectionBehavior.propertyListValue.getter(uint64_t a1)
{
  return sub_25A622780();
}

uint64_t sub_25A605ECC()
{
  return sub_25A622A80();
}

uint64_t sub_25A605F54()
{
  return sub_25A622A80();
}

uint64_t PreviewOverridesConfiguration.SelectionBehavior.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Key;
  unint64_t v5 = sub_25A6095F4();
  unint64_t v18 = v5;
  v16[0] = 0;
  sub_25A609648();
  sub_25A622710();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    uint64_t v17 = &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Key;
    unint64_t v18 = v5;
    if (v13)
    {
      v16[0] = 2;
      sub_25A60969C();
      sub_25A622710();
      uint64_t v8 = sub_25A6227C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = v13;
    }
    else
    {
      v16[0] = 1;
      sub_25A6096F0();
      sub_25A622710();
      uint64_t v12 = sub_25A6227C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
      uint64_t v11 = v13;
      uint64_t v9 = v14;
      uint64_t v10 = v15;
    }
    *(void *)a2 = v11;
    *(void *)(a2 + 8) = v9;
    *(void *)(a2 + 16) = v10;
    *(unsigned char *)(a2 + 24) = v13;
  }
  return result;
}

uint64_t static PreviewOverridesConfiguration.MultiSelectConfiguration.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_25A603174(*a1, *a2);
}

uint64_t sub_25A6061D4(uint64_t a1)
{
  return sub_25A622780();
}

uint64_t sub_25A606278@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewOverridesConfiguration.SelectionBehavior.init(propertyListValue:)(a1, a2);
}

void PreviewOverridesConfiguration.SingleSelectConfiguration.style.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *PreviewOverridesConfiguration.SingleSelectConfiguration.style.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*PreviewOverridesConfiguration.SingleSelectConfiguration.style.modify())()
{
  return nullsub_1;
}

uint64_t PreviewOverridesConfiguration.SingleSelectConfiguration.defaultVariant.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  *a1 = *(void *)(v1 + 8);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t PreviewOverridesConfiguration.SingleSelectConfiguration.defaultVariant.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v3;
  return result;
}

uint64_t (*PreviewOverridesConfiguration.SingleSelectConfiguration.defaultVariant.modify())()
{
  return nullsub_1;
}

PreviewsMessagingOS::PreviewOverridesConfiguration::SingleSelectConfiguration __swiftcall PreviewOverridesConfiguration.SingleSelectConfiguration.init(style:defaultVariant:)(PreviewsMessagingOS::PreviewOverridesConfiguration::SingleSelectConfiguration::Style style, PreviewsMessagingOS::PreviewVariant::ID defaultVariant)
{
  uint64_t v3 = *(void *)defaultVariant.rawValue._countAndFlagsBits;
  uint64_t v4 = *(void *)(defaultVariant.rawValue._countAndFlagsBits + 8);
  *(unsigned char *)uint64_t v2 = *(unsigned char *)style;
  *(void *)(v2 + 8) = v3;
  *(void *)(v2 + 16) = v4;
  result.defaultVariant = defaultVariant;
  result.style = style;
  return result;
}

uint64_t sub_25A606340(char a1)
{
  if (a1) {
    return 0x56746C7561666564;
  }
  else {
    return 0x656C797473;
  }
}

uint64_t sub_25A606380(char *a1, char *a2)
{
  return sub_25A5E839C(*a1, *a2);
}

uint64_t sub_25A60638C()
{
  return sub_25A61A2D4();
}

uint64_t sub_25A606394()
{
  return sub_25A549A64();
}

uint64_t sub_25A60639C()
{
  return sub_25A61E2E8();
}

uint64_t sub_25A6063A4@<X0>(char *a1@<X8>)
{
  return sub_25A56B748(a1);
}

uint64_t sub_25A6063B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A606340(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A6063DC()
{
  return sub_25A606340(*v0);
}

uint64_t PreviewOverridesConfiguration.SingleSelectConfiguration.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A60642C()
{
  return sub_25A622A80();
}

uint64_t PreviewOverridesConfiguration.SingleSelectConfiguration.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v13 = &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Key;
  unint64_t v5 = sub_25A609750();
  unint64_t v14 = v5;
  v12[0] = 0;
  sub_25A6097A4();
  sub_25A622710();
  if (v2)
  {
    uint64_t v7 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    char v6 = v15;
    uint64_t v13 = &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Key;
    unint64_t v14 = v5;
    v12[0] = 1;
    sub_25A6097F8();
    sub_25A622710();
    uint64_t v8 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    *(unsigned char *)a2 = v6;
    *(void *)(a2 + 8) = v10;
    *(void *)(a2 + 16) = v11;
  }
  return result;
}

PreviewsMessagingOS::PreviewOverridesConfiguration::SingleSelectConfiguration::Style_optional __swiftcall PreviewOverridesConfiguration.SingleSelectConfiguration.Style.init(rawValue:)(Swift::String rawValue)
{
  return (PreviewsMessagingOS::PreviewOverridesConfiguration::SingleSelectConfiguration::Style_optional)sub_25A54CE7C(v1);
}

uint64_t PreviewOverridesConfiguration.SingleSelectConfiguration.Style.rawValue.getter()
{
  if (*v0) {
    return 0x65676E6172;
  }
  else {
    return 1953720684;
  }
}

uint64_t sub_25A606648(char *a1, char *a2)
{
  return sub_25A5E8304(*a1, *a2);
}

uint64_t sub_25A606654()
{
  return sub_25A61A360();
}

uint64_t sub_25A60665C()
{
  return sub_25A549A04();
}

uint64_t sub_25A606664()
{
  return sub_25A61E370();
}

PreviewsMessagingOS::PreviewOverridesConfiguration::SingleSelectConfiguration::Style_optional sub_25A60666C(Swift::String *a1)
{
  return PreviewOverridesConfiguration.SingleSelectConfiguration.Style.init(rawValue:)(*a1);
}

uint64_t sub_25A606678@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PreviewOverridesConfiguration.SingleSelectConfiguration.Style.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25A6066A0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A60B328();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A6066FC()
{
  return sub_25A622B20();
}

uint64_t sub_25A606768()
{
  return sub_25A622780();
}

uint64_t sub_25A6067B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewOverridesConfiguration.SingleSelectConfiguration.init(propertyListValue:)(a1, a2);
}

uint64_t PreviewOverridesConfiguration.MultiSelectConfiguration.defaultVariants.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PreviewOverridesConfiguration.MultiSelectConfiguration.defaultVariants.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*PreviewOverridesConfiguration.MultiSelectConfiguration.defaultVariants.modify())()
{
  return nullsub_1;
}

uint64_t PreviewOverridesConfiguration.MultiSelectConfiguration.init(defaultVariants:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_25A606830@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25A6232B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25A606884@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A608640();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t PreviewOverridesConfiguration.MultiSelectConfiguration.propertyListValue.getter()
{
  return sub_25A6227A0();
}

uint64_t PreviewOverridesConfiguration.MultiSelectConfiguration.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v8 = &type metadata for PreviewOverridesConfiguration.MultiSelectConfiguration.Key;
  unint64_t v9 = sub_25A60984C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BC90);
  sub_25A6098FC(&qword_26A42BCA0, &qword_26A42BC90, (void (*)(void))sub_25A6097F8);
  sub_25A622710();
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (!v2) {
    *a2 = v10;
  }
  return result;
}

uint64_t sub_25A606ABC()
{
  return sub_25A6227A0();
}

uint64_t sub_25A606B7C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v8 = &type metadata for PreviewOverridesConfiguration.MultiSelectConfiguration.Key;
  unint64_t v9 = sub_25A60984C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BC90);
  sub_25A6098FC(&qword_26A42BCA0, &qword_26A42BC90, (void (*)(void))sub_25A6097F8);
  sub_25A622710();
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (!v2) {
    *a2 = v10;
  }
  return result;
}

uint64_t sub_25A606CC8(uint64_t *a1, uint64_t *a2)
{
  return sub_25A603174(*a1, *a2);
}

uint64_t (*PreviewVariantGroup.ID.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t sub_25A606CF4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A60B2D4();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A606D50()
{
  return sub_25A622B20();
}

uint64_t PreviewVariant.id.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t PreviewVariant.id.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*PreviewVariant.id.modify())()
{
  return nullsub_1;
}

uint64_t PreviewVariant.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewVariant.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*PreviewVariant.displayName.modify())()
{
  return nullsub_1;
}

uint64_t PreviewVariant.renderEffects.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PreviewVariant.renderEffects.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*PreviewVariant.renderEffects.modify())()
{
  return nullsub_1;
}

void PreviewVariant.interfaceOrientationOverride.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 40);
}

unsigned char *PreviewVariant.interfaceOrientationOverride.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 40) = *result;
  return result;
}

uint64_t (*PreviewVariant.interfaceOrientationOverride.modify())()
{
  return nullsub_1;
}

double PreviewVariant.init(id:displayName:renderEffect:interfaceOrientationOverride:)@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, char *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v11 = *a4;
  uint64_t v12 = a4[1];
  char v13 = *a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BCA8);
  uint64_t v14 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v14 + 16) = xmmword_25A625820;
  *(void *)(v14 + 32) = v11;
  *(void *)(v14 + 40) = v12;
  *(void *)a6 = v9;
  *(void *)(a6 + 8) = v10;
  *(void *)(a6 + 16) = a2;
  *(void *)(a6 + 24) = a3;
  *(void *)(a6 + 32) = v14;
  *(unsigned char *)(a6 + 40) = v13;
  return result;
}

void *PreviewVariant.init(id:displayName:renderEffects:interfaceOrientationOverride:)@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6 = result[1];
  char v7 = *a5;
  *(void *)a6 = *result;
  *(void *)(a6 + 8) = v6;
  *(void *)(a6 + 16) = a2;
  *(void *)(a6 + 24) = a3;
  *(void *)(a6 + 32) = a4;
  *(unsigned char *)(a6 + 40) = v7;
  return result;
}

unint64_t sub_25A606FCC(char a1)
{
  unint64_t result = 0xD00000000000001CLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4E79616C70736964;
      break;
    case 2:
    case 4:
      unint64_t result = 0x66457265646E6572;
      break;
    case 3:
      return result;
    default:
      unint64_t result = 25705;
      break;
  }
  return result;
}

uint64_t sub_25A607080(unsigned __int8 *a1, char *a2)
{
  return sub_25A5EC808(*a1, *a2);
}

uint64_t sub_25A60708C()
{
  return sub_25A61A3D8();
}

uint64_t sub_25A607094()
{
  return sub_25A54C0A4();
}

uint64_t sub_25A60709C()
{
  return sub_25A61B91C();
}

uint64_t sub_25A6070A4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A60B234();
  *a1 = result;
  return result;
}

unint64_t sub_25A6070D4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A606FCC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A607100()
{
  return sub_25A606FCC(*v0);
}

uint64_t PreviewVariant.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A607158(uint64_t *a1)
{
  uint64_t v3 = a1[2];
  uint64_t v2 = a1[3];
  uint64_t v4 = a1[4];
  sub_25A55C73C((uint64_t)(a1 + 5), (uint64_t)&v18, &qword_26A42BD70);
  if (*(void *)(v4 + 16)) {
    swift_bridgeObjectRetain();
  }
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  char v17 = 0;
  uint64_t v15 = v5;
  uint64_t v16 = v6;
  char v14 = 1;
  uint64_t v12 = v3;
  uint64_t v13 = v2;
  char v11 = 2;
  uint64_t v10 = v4;
  v9[1] = 3;
  sub_25A55C73C((uint64_t)&v18, (uint64_t)v9, &qword_26A42BD70);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42A5A8);
  sub_25A6098A8();
  sub_25A6097F8();
  sub_25A6098FC((unint64_t *)&qword_26A42A5B0, &qword_26A42A5A8, (void (*)(void))sub_25A5AA1CC);
  sub_25A5B064C();
  sub_25A5AA1CC();
  uint64_t v7 = sub_25A622A50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t PreviewVariant.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = &type metadata for PreviewVariant.Key;
  unint64_t v5 = sub_25A6098A8();
  unint64_t v17 = v5;
  v15[0] = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42A5A8);
  sub_25A6098FC((unint64_t *)&qword_26A42A5B0, &qword_26A42A5A8, (void (*)(void))sub_25A5AA1CC);
  sub_25A622760();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    uint64_t v7 = v13;
    if (!v13)
    {
      uint64_t v16 = &type metadata for PreviewVariant.Key;
      unint64_t v17 = v5;
      v15[0] = 4;
      sub_25A5AA1CC();
      sub_25A622710();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BCA8);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_25A625820;
      *(void *)(v7 + 32) = 0;
      *(void *)(v7 + 40) = v14;
    }
    uint64_t v16 = &type metadata for PreviewVariant.Key;
    unint64_t v17 = v5;
    v15[0] = 0;
    sub_25A6097F8();
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    uint64_t v16 = &type metadata for PreviewVariant.Key;
    unint64_t v17 = v5;
    v15[0] = 1;
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    uint64_t v16 = &type metadata for PreviewVariant.Key;
    unint64_t v17 = v5;
    v15[0] = 3;
    sub_25A5B064C();
    sub_25A622760();
    uint64_t v9 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    char v10 = v18;
    *(void *)a2 = v13;
    *(void *)(a2 + 8) = v14;
    *(void *)(a2 + 16) = v11;
    *(void *)(a2 + 24) = v12;
    *(void *)(a2 + 32) = v7;
    *(unsigned char *)(a2 + 40) = v10;
  }
  return result;
}

uint64_t PreviewVariant.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 32);
  int v2 = *(unsigned __int8 *)(v0 + 40);
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  sub_25A623460();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_25A622DF0();
      swift_bridgeObjectRelease();
      v4 += 16;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  if (v2 == 4) {
    return sub_25A623470();
  }
  sub_25A623470();
  sub_25A622DF0();

  return swift_bridgeObjectRelease();
}

uint64_t PreviewVariant.hashValue.getter()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6078EC()
{
  return sub_25A622780();
}

uint64_t sub_25A60793C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewVariant.init(propertyListValue:)(a1, a2);
}

uint64_t sub_25A607954()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6079BC()
{
  return sub_25A6234A0();
}

uint64_t PreviewVariant.ID.rawValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PreviewVariant.ID.rawValue.modify())()
{
  return nullsub_1;
}

PreviewsMessagingOS::PreviewVariant::ID __swiftcall PreviewVariant.ID.init(stringLiteral:)(PreviewsMessagingOS::PreviewVariant::ID stringLiteral)
{
  PreviewsMessagingOS::PreviewVariant::ID *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t PreviewVariant.ID.description.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25A607AB0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A60B280();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A607B0C()
{
  return sub_25A622B20();
}

uint64_t sub_25A607B74(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25A623450();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_25A6234A0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25A6233B0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      char v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_25A6233B0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25A608024(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25A607D34()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BD80);
  uint64_t v3 = sub_25A6231F0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_25A623450();
      swift_bridgeObjectRetain();
      sub_25A622DF0();
      swift_bridgeObjectRelease();
      uint64_t result = sub_25A6234A0();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25A608024(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_25A607D34();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25A6081D0();
      goto LABEL_22;
    }
    sub_25A608384();
  }
  uint64_t v11 = *v4;
  sub_25A623450();
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  uint64_t result = sub_25A6234A0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_25A6233B0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_25A6233F0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_25A6233B0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_25A6081D0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BD80);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A6231E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25A608384()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BD80);
  uint64_t v3 = sub_25A6231F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_25A623450();
    swift_bridgeObjectRetain_n();
    sub_25A622DF0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25A6234A0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25A608640()
{
  return 0x56746C7561666564;
}

uint64_t _s19PreviewsMessagingOS14PreviewVariantV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  int v9 = *(unsigned __int8 *)(a2 + 40);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)
    || (char v10 = sub_25A6233B0(), result = 0, (v10 & 1) != 0))
  {
    if (v2 == v6 && v4 == v7 || (char v12 = sub_25A6233B0(), result = 0, (v12 & 1) != 0))
    {
      if (sub_25A5674D4(v3, v8))
      {
        if (v5 == 4)
        {
          if (v9 != 4) {
            return 0;
          }
        }
        else if (v9 == 4 || (sub_25A5E8B28(v5, v9) & 1) == 0)
        {
          return 0;
        }
        return 1;
      }
      return 0;
    }
  }
  return result;
}

uint64_t _s19PreviewsMessagingOS29PreviewOverridesConfigurationV012SingleSelectF0V2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  BOOL v6 = *(unsigned char *)a1 == 0;
  if (*(unsigned char *)a1) {
    uint64_t v7 = 0x65676E6172;
  }
  else {
    uint64_t v7 = 1953720684;
  }
  if (v6) {
    unint64_t v8 = 0xE400000000000000;
  }
  else {
    unint64_t v8 = 0xE500000000000000;
  }
  if (*(unsigned char *)a2) {
    uint64_t v9 = 0x65676E6172;
  }
  else {
    uint64_t v9 = 1953720684;
  }
  if (*(unsigned char *)a2) {
    unint64_t v10 = 0xE500000000000000;
  }
  else {
    unint64_t v10 = 0xE400000000000000;
  }
  if (v7 == v9 && v8 == v10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v2 != v4) {
      goto LABEL_24;
    }
  }
  else
  {
    char v12 = sub_25A6233B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v12 & 1) == 0) {
      return result;
    }
    if (v2 != v4) {
      goto LABEL_24;
    }
  }
  if (v3 == v5) {
    return 1;
  }
LABEL_24:

  return sub_25A6233B0();
}

uint64_t _s19PreviewsMessagingOS29PreviewOverridesConfigurationV17SelectionBehaviorO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  if (*(unsigned char *)(a1 + 24))
  {
    if (*(unsigned char *)(a2 + 24))
    {
      sub_25A603D5C();
      sub_25A603D5C();
      sub_25A603D5C();
      sub_25A603D5C();
      char v8 = sub_25A603174(v3, v6);
      sub_25A603E4C();
      sub_25A603E4C();
      sub_25A603E4C();
LABEL_7:
      sub_25A603E4C();
      return v8 & 1;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 1) == 0)
  {
    v13[0] = v3 & 1;
    uint64_t v14 = v2;
    uint64_t v15 = v4;
    v10[0] = v6 & 1;
    uint64_t v11 = v5;
    uint64_t v12 = v7;
    sub_25A603D5C();
    sub_25A603D5C();
    sub_25A603D5C();
    sub_25A603D5C();
    char v8 = _s19PreviewsMessagingOS29PreviewOverridesConfigurationV012SingleSelectF0V2eeoiySbAE_AEtFZ_0((uint64_t)v13, (uint64_t)v10);
    sub_25A603E4C();
    sub_25A603E4C();
    sub_25A603E4C();
    goto LABEL_7;
  }
  sub_25A603D5C();
  sub_25A603D5C();
  sub_25A603E4C();
  sub_25A603E4C();
  char v8 = 0;
  return v8 & 1;
}

uint64_t _s19PreviewsMessagingOS29PreviewOverridesConfigurationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  long long v6 = *(_OWORD *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))
  {
    long long v12 = *(_OWORD *)(a2 + 16);
    long long v13 = *(_OWORD *)(a1 + 16);
    char v10 = sub_25A6233B0();
    long long v6 = v12;
    long long v2 = v13;
    if ((v10 & 1) == 0) {
      return 0;
    }
  }
  long long v17 = v2;
  uint64_t v18 = v3;
  char v19 = v4;
  long long v14 = v6;
  uint64_t v15 = v7;
  char v16 = v8;
  if ((_s19PreviewsMessagingOS29PreviewOverridesConfigurationV17SelectionBehaviorO2eeoiySbAE_AEtFZ_0((uint64_t)&v17, (uint64_t)&v14) & 1) == 0)return 0; {

  }
  return sub_25A566D54(v5, v9);
}

BOOL _s19PreviewsMessagingOS19PreviewVariantGroupV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[4];
  uint64_t v32 = a1[5];
  uint64_t v30 = a1[3];
  uint64_t v31 = a1[6];
  uint64_t v4 = a1[8];
  uint64_t v5 = a1[9];
  uint64_t v23 = a1[10];
  uint64_t v24 = a1[11];
  uint64_t v25 = a1[12];
  uint64_t v7 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  uint64_t v10 = a2[6];
  uint64_t v11 = a2[7];
  uint64_t v26 = a2[8];
  uint64_t v27 = a2[9];
  uint64_t v29 = a1[7];
  uint64_t v21 = a2[10];
  uint64_t v22 = a2[11];
  uint64_t v20 = a2[12];
  if (*a1 == *a2 && a1[1] == a2[1] || (char v12 = sub_25A6233B0(), result = 0, (v12 & 1) != 0))
  {
    if ((sub_25A60395C(v2, v7) & 1) == 0) {
      return 0;
    }
    if (v3)
    {
      v36[0] = v30;
      v36[1] = v3;
      v36[2] = v32;
      v36[3] = v31;
      v36[4] = v29;
      v36[5] = v4;
      v36[6] = v5;
      if (v8)
      {
        v33[0] = v6;
        v33[1] = v8;
        v33[2] = v9;
        v33[3] = v10;
        v33[4] = v11;
        char v34 = v26 & 1;
        uint64_t v35 = v27;
        sub_25A603CE4(v30, v3);
        swift_bridgeObjectRetain();
        sub_25A603D5C();
        swift_bridgeObjectRetain();
        char v28 = _s19PreviewsMessagingOS29PreviewOverridesConfigurationV2eeoiySbAC_ACtFZ_0((uint64_t)v36, (uint64_t)v33);
        swift_bridgeObjectRelease();
        sub_25A603E4C();
        swift_bridgeObjectRelease();
        sub_25A603DD4(v30, v3);
        if ((v28 & 1) == 0) {
          return 0;
        }
LABEL_10:
        if (v24)
        {
          uint64_t v15 = v22;
          uint64_t v14 = v23;
          uint64_t v16 = v21;
          if (v22)
          {
            if (v23 == v21 && v24 == v22 || (sub_25A6233B0() & 1) != 0)
            {
              sub_25A603E8C(v23, v24);
              sub_25A603E8C(v23, v24);
              sub_25A603E8C(v21, v22);
              char v17 = sub_25A566FCC(v25, v20);
              sub_25A603F18(v21, v22);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_25A603F18(v23, v24);
              return (v17 & 1) != 0;
            }
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v18 = v23;
            uint64_t v19 = v24;
LABEL_23:
            sub_25A603F18(v18, v19);
            return 0;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v15 = v22;
          uint64_t v14 = v23;
          uint64_t v16 = v21;
          if (!v22) {
            return 1;
          }
        }
        sub_25A603E8C(v16, v15);
        sub_25A603F18(v14, v24);
        uint64_t v18 = v16;
        uint64_t v19 = v15;
        goto LABEL_23;
      }
      swift_bridgeObjectRetain();
      sub_25A603D5C();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25A603D5C();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_25A603E4C();
      swift_bridgeObjectRelease();
    }
    else if (!v8)
    {
      goto LABEL_10;
    }
    sub_25A603CE4(v6, v8);
    sub_25A603DD4(v30, v3);
    sub_25A603DD4(v6, v8);
    return 0;
  }
  return result;
}

uint64_t _s19PreviewsMessagingOS28PreviewVariantsConfigurationV7SectionV2eeoiySbAE_AEtFZ_0(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  if (v3)
  {
    if (v5)
    {
      BOOL v7 = *a1 == *a2 && v3 == v5;
      if (v7 || (sub_25A6233B0() & 1) != 0) {
        goto LABEL_8;
      }
    }
    return 0;
  }
  if (v5) {
    return 0;
  }
LABEL_8:

  return sub_25A566D54(v4, v6);
}

uint64_t sub_25A609038()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_25A609084(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25A60996C();
  uint64_t result = sub_25A6230F0();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25A607B74(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

unint64_t sub_25A60911C()
{
  unint64_t result = qword_26A42BBC8;
  if (!qword_26A42BBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BBC8);
  }
  return result;
}

unint64_t sub_25A609170()
{
  unint64_t result = qword_26A42BBD0;
  if (!qword_26A42BBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BBD0);
  }
  return result;
}

unint64_t sub_25A6091C4()
{
  unint64_t result = qword_26A42BBE8;
  if (!qword_26A42BBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BBE8);
  }
  return result;
}

uint64_t sub_25A609218()
{
  return sub_25A604D04();
}

unint64_t sub_25A609220()
{
  unint64_t result = qword_26A42BC00;
  if (!qword_26A42BC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC00);
  }
  return result;
}

unint64_t sub_25A609274()
{
  unint64_t result = qword_26A42BC08;
  if (!qword_26A42BC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC08);
  }
  return result;
}

unint64_t sub_25A6092C8()
{
  unint64_t result = qword_26A42BC18;
  if (!qword_26A42BC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC18);
  }
  return result;
}

uint64_t sub_25A60931C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A42BD78);
    uint64_t v3 = sub_25A623200();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_25A623450();
      swift_bridgeObjectRetain_n();
      sub_25A622DF0();
      swift_bridgeObjectRelease();
      uint64_t result = sub_25A6234A0();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_25A6233B0(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_25A6233B0();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_25A6094CC()
{
  return sub_25A605384();
}

unint64_t sub_25A6094D8()
{
  unint64_t result = qword_26A42BC30;
  if (!qword_26A42BC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC30);
  }
  return result;
}

unint64_t sub_25A60952C()
{
  unint64_t result = qword_26A42BC48;
  if (!qword_26A42BC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC48);
  }
  return result;
}

uint64_t sub_25A609580()
{
  return sub_25A6058A4();
}

unint64_t sub_25A60958C()
{
  unint64_t result = qword_26A42BC50;
  if (!qword_26A42BC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC50);
  }
  return result;
}

uint64_t sub_25A6095E0()
{
  return sub_25A605F54();
}

uint64_t sub_25A6095E8()
{
  return sub_25A605ECC();
}

unint64_t sub_25A6095F4()
{
  unint64_t result = qword_26A42BC58;
  if (!qword_26A42BC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC58);
  }
  return result;
}

unint64_t sub_25A609648()
{
  unint64_t result = qword_26A42BC60;
  if (!qword_26A42BC60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC60);
  }
  return result;
}

unint64_t sub_25A60969C()
{
  unint64_t result = qword_26A42BC68;
  if (!qword_26A42BC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC68);
  }
  return result;
}

unint64_t sub_25A6096F0()
{
  unint64_t result = qword_26A42BC70;
  if (!qword_26A42BC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC70);
  }
  return result;
}

uint64_t sub_25A609744()
{
  return sub_25A60642C();
}

unint64_t sub_25A609750()
{
  unint64_t result = qword_26A42BC78;
  if (!qword_26A42BC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC78);
  }
  return result;
}

unint64_t sub_25A6097A4()
{
  unint64_t result = qword_26A42BC80;
  if (!qword_26A42BC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC80);
  }
  return result;
}

unint64_t sub_25A6097F8()
{
  unint64_t result = qword_26A42BC88;
  if (!qword_26A42BC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC88);
  }
  return result;
}

unint64_t sub_25A60984C()
{
  unint64_t result = qword_26A42BC98;
  if (!qword_26A42BC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BC98);
  }
  return result;
}

uint64_t sub_25A6098A0()
{
  return sub_25A607158(*(uint64_t **)(v0 + 16));
}

unint64_t sub_25A6098A8()
{
  unint64_t result = qword_26A42BCB0;
  if (!qword_26A42BCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BCB0);
  }
  return result;
}

uint64_t sub_25A6098FC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25A60996C()
{
  unint64_t result = qword_26A42BCB8;
  if (!qword_26A42BCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BCB8);
  }
  return result;
}

unint64_t sub_25A6099C4()
{
  unint64_t result = qword_26A42BCC0;
  if (!qword_26A42BCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BCC0);
  }
  return result;
}

unint64_t sub_25A609A1C()
{
  unint64_t result = qword_26A42BCC8;
  if (!qword_26A42BCC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BCC8);
  }
  return result;
}

unint64_t sub_25A609A74()
{
  unint64_t result = qword_26A42BCD0;
  if (!qword_26A42BCD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BCD0);
  }
  return result;
}

unint64_t sub_25A609ACC()
{
  unint64_t result = qword_26A42BCD8;
  if (!qword_26A42BCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BCD8);
  }
  return result;
}

unint64_t sub_25A609B24()
{
  unint64_t result = qword_26A42BCE0;
  if (!qword_26A42BCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BCE0);
  }
  return result;
}

unint64_t sub_25A609B7C()
{
  unint64_t result = qword_26A42BCE8;
  if (!qword_26A42BCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BCE8);
  }
  return result;
}

unint64_t sub_25A609BD4()
{
  unint64_t result = qword_26A42BCF0;
  if (!qword_26A42BCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BCF0);
  }
  return result;
}

unint64_t sub_25A609C2C()
{
  unint64_t result = qword_26A42BCF8;
  if (!qword_26A42BCF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BCF8);
  }
  return result;
}

unint64_t sub_25A609C84()
{
  unint64_t result = qword_26A42BD00;
  if (!qword_26A42BD00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD00);
  }
  return result;
}

unint64_t sub_25A609CDC()
{
  unint64_t result = qword_26A42BD08;
  if (!qword_26A42BD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD08);
  }
  return result;
}

uint64_t destroy for PreviewVariantGroup(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 32))
  {
    swift_bridgeObjectRelease();
    sub_25A603E4C();
    swift_bridgeObjectRelease();
  }
  uint64_t result = *(void *)(a1 + 88);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for PreviewVariantGroup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v5)
  {
    long long v11 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v11;
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    uint64_t v10 = *(void *)(a2 + 88);
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    return a1;
  }
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 56);
  char v9 = *(unsigned char *)(a2 + 64);
  swift_bridgeObjectRetain();
  sub_25A603D5C();
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  *(unsigned char *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  uint64_t v10 = *(void *)(a2 + 88);
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewVariantGroup(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a1 + 24);
  uint64_t v5 = (long long *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32))
  {
    if (v6)
    {
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v7 = *(void *)(a2 + 40);
      uint64_t v8 = *(void *)(a2 + 48);
      uint64_t v9 = *(void *)(a2 + 56);
      char v10 = *(unsigned char *)(a2 + 64);
      sub_25A603D5C();
      *(void *)(a1 + 40) = v7;
      *(void *)(a1 + 48) = v8;
      *(void *)(a1 + 56) = v9;
      *(unsigned char *)(a1 + 64) = v10;
      sub_25A603E4C();
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_25A60A0F8(a1 + 24);
      long long v16 = *(_OWORD *)(a2 + 40);
      long long v15 = *(_OWORD *)(a2 + 56);
      long long v17 = *v5;
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(_OWORD *)(a1 + 40) = v16;
      *(_OWORD *)(a1 + 56) = v15;
      *uint64_t v4 = v17;
    }
  }
  else if (v6)
  {
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    uint64_t v11 = *(void *)(a2 + 40);
    uint64_t v12 = *(void *)(a2 + 48);
    uint64_t v13 = *(void *)(a2 + 56);
    char v14 = *(unsigned char *)(a2 + 64);
    swift_bridgeObjectRetain();
    sub_25A603D5C();
    *(void *)(a1 + 40) = v11;
    *(void *)(a1 + 48) = v12;
    *(void *)(a1 + 56) = v13;
    *(unsigned char *)(a1 + 64) = v14;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v18 = *v5;
    long long v19 = *(_OWORD *)(a2 + 40);
    long long v20 = *(_OWORD *)(a2 + 56);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(_OWORD *)(a1 + 40) = v19;
    *(_OWORD *)(a1 + 56) = v20;
    *uint64_t v4 = v18;
  }
  uint64_t v21 = (_OWORD *)(a1 + 80);
  uint64_t v22 = (_OWORD *)(a2 + 80);
  uint64_t v23 = *(void *)(a2 + 88);
  if (*(void *)(a1 + 88))
  {
    if (v23)
    {
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_25A60A128(a1 + 80);
      uint64_t v24 = *(void *)(a2 + 96);
      _OWORD *v21 = *v22;
      *(void *)(a1 + 96) = v24;
    }
  }
  else if (v23)
  {
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v25 = *v22;
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    _OWORD *v21 = v25;
  }
  return a1;
}

uint64_t sub_25A60A0F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_25A60A128(uint64_t a1)
{
  return a1;
}

uint64_t assignWithTake for PreviewVariantGroup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = *(void *)(a2 + 32);
    if (v5)
    {
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = v5;
      swift_bridgeObjectRelease();
      uint64_t v6 = *(void *)(a2 + 56);
      char v7 = *(unsigned char *)(a2 + 64);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      *(void *)(a1 + 56) = v6;
      *(unsigned char *)(a1 + 64) = v7;
      sub_25A603E4C();
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_25A60A0F8(a1 + 24);
  }
  long long v8 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
LABEL_6:
  if (!*(void *)(a1 + 88))
  {
LABEL_10:
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    return a1;
  }
  uint64_t v9 = *(void *)(a2 + 88);
  if (!v9)
  {
    sub_25A60A128(a1 + 80);
    goto LABEL_10;
  }
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewVariantGroup(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewVariantGroup(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewVariantGroup()
{
  return &type metadata for PreviewVariantGroup;
}

uint64_t destroy for PreviewOverridesConfiguration()
{
  swift_bridgeObjectRelease();
  sub_25A603E4C();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PreviewOverridesConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_25A603D5C();
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewOverridesConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  char v7 = *(unsigned char *)(a2 + 40);
  sub_25A603D5C();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v7;
  sub_25A603E4C();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for PreviewOverridesConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  char v6 = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  sub_25A603E4C();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewOverridesConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewOverridesConfiguration(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration()
{
  return &type metadata for PreviewOverridesConfiguration;
}

ValueMetadata *type metadata accessor for PreviewVariantsConfiguration()
{
  return &type metadata for PreviewVariantsConfiguration;
}

ValueMetadata *type metadata accessor for PreviewVariantsConfiguration.Section()
{
  return &type metadata for PreviewVariantsConfiguration.Section;
}

uint64_t destroy for PreviewOverridesConfiguration.SelectionBehavior()
{
  return sub_25A603E4C();
}

uint64_t initializeWithCopy for PreviewOverridesConfiguration.SelectionBehavior(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  char v6 = *((unsigned char *)a2 + 24);
  sub_25A603D5C();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for PreviewOverridesConfiguration.SelectionBehavior(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  char v6 = *((unsigned char *)a2 + 24);
  sub_25A603D5C();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_25A603E4C();
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PreviewOverridesConfiguration.SelectionBehavior(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  sub_25A603E4C();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewOverridesConfiguration.SelectionBehavior(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewOverridesConfiguration.SelectionBehavior(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25A60A7DC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_25A60A7E4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.SelectionBehavior()
{
  return &type metadata for PreviewOverridesConfiguration.SelectionBehavior;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.SelectionBehavior.Discriminant()
{
  return &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Discriminant;
}

uint64_t destroy for PreviewOverridesConfiguration.SingleSelectConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s19PreviewsMessagingOS29PreviewOverridesConfigurationV25SingleSelectConfigurationVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewOverridesConfiguration.SingleSelectConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PreviewOverridesConfiguration.SingleSelectConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s19PreviewsMessagingOS29PreviewOverridesConfigurationV25SingleSelectConfigurationVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25A60A928(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.SingleSelectConfiguration()
{
  return &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.SingleSelectConfiguration.Style()
{
  return &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Style;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.MultiSelectConfiguration()
{
  return &type metadata for PreviewOverridesConfiguration.MultiSelectConfiguration;
}

ValueMetadata *type metadata accessor for PreviewVariantGroup.ID()
{
  return &type metadata for PreviewVariantGroup.ID;
}

uint64_t getEnumTagSinglePayload for PreviewVariant(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewVariant(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewVariant()
{
  return &type metadata for PreviewVariant;
}

ValueMetadata *type metadata accessor for PreviewVariant.ID()
{
  return &type metadata for PreviewVariant.ID;
}

unsigned char *storeEnumTagSinglePayload for PreviewVariant.Key(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x25A60AB28);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewVariant.Key()
{
  return &type metadata for PreviewVariant.Key;
}

unsigned char *storeEnumTagSinglePayload for PreviewOverridesConfiguration.MultiSelectConfiguration.Key(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25A60ABFCLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.MultiSelectConfiguration.Key()
{
  return &type metadata for PreviewOverridesConfiguration.MultiSelectConfiguration.Key;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.SingleSelectConfiguration.Key()
{
  return &type metadata for PreviewOverridesConfiguration.SingleSelectConfiguration.Key;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.SelectionBehavior.Key()
{
  return &type metadata for PreviewOverridesConfiguration.SelectionBehavior.Key;
}

ValueMetadata *type metadata accessor for PreviewVariantsConfiguration.Section.Key()
{
  return &type metadata for PreviewVariantsConfiguration.Section.Key;
}

unsigned char *_s19PreviewsMessagingOS29PreviewOverridesConfigurationV25SingleSelectConfigurationV5StyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A60AD34);
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

ValueMetadata *type metadata accessor for PreviewVariantsConfiguration.Key()
{
  return &type metadata for PreviewVariantsConfiguration.Key;
}

unsigned char *_s19PreviewsMessagingOS29PreviewOverridesConfigurationV17SelectionBehaviorO3KeyOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x25A60AE38);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewOverridesConfiguration.Key()
{
  return &type metadata for PreviewOverridesConfiguration.Key;
}

unsigned char *storeEnumTagSinglePayload for PreviewVariantGroup.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A60AF3CLL);
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

ValueMetadata *type metadata accessor for PreviewVariantGroup.Key()
{
  return &type metadata for PreviewVariantGroup.Key;
}

unint64_t sub_25A60AF78()
{
  unint64_t result = qword_26A42BD10;
  if (!qword_26A42BD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD10);
  }
  return result;
}

unint64_t sub_25A60AFD0()
{
  unint64_t result = qword_26A42BD18;
  if (!qword_26A42BD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD18);
  }
  return result;
}

unint64_t sub_25A60B028()
{
  unint64_t result = qword_26A42BD20;
  if (!qword_26A42BD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD20);
  }
  return result;
}

unint64_t sub_25A60B080()
{
  unint64_t result = qword_26A42BD28;
  if (!qword_26A42BD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD28);
  }
  return result;
}

unint64_t sub_25A60B0D8()
{
  unint64_t result = qword_26A42BD30;
  if (!qword_26A42BD30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD30);
  }
  return result;
}

unint64_t sub_25A60B130()
{
  unint64_t result = qword_26A42BD38;
  if (!qword_26A42BD38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD38);
  }
  return result;
}

unint64_t sub_25A60B188()
{
  unint64_t result = qword_26A42BD40;
  if (!qword_26A42BD40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD40);
  }
  return result;
}

unint64_t sub_25A60B1E0()
{
  unint64_t result = qword_26A42BD48;
  if (!qword_26A42BD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD48);
  }
  return result;
}

uint64_t sub_25A60B234()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

unint64_t sub_25A60B280()
{
  unint64_t result = qword_26A42BD50;
  if (!qword_26A42BD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD50);
  }
  return result;
}

unint64_t sub_25A60B2D4()
{
  unint64_t result = qword_26A42BD58;
  if (!qword_26A42BD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD58);
  }
  return result;
}

unint64_t sub_25A60B328()
{
  unint64_t result = qword_26A42BD60;
  if (!qword_26A42BD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD60);
  }
  return result;
}

unint64_t sub_25A60B37C()
{
  unint64_t result = qword_26A42BD68;
  if (!qword_26A42BD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD68);
  }
  return result;
}

PreviewsMessagingOS::RenderEffect __swiftcall RenderEffect.init(stringLiteral:)(PreviewsMessagingOS::RenderEffect stringLiteral)
{
  PreviewsMessagingOS::RenderEffect *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t RenderEffect.id.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t RenderEffect.id.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*RenderEffect.id.modify())()
{
  return nullsub_1;
}

PreviewsMessagingOS::RenderEffect __swiftcall RenderEffect.init(id:)(PreviewsMessagingOS::RenderEffect id)
{
  uint64_t v2 = *(void *)(id.id.rawValue._countAndFlagsBits + 8);
  void *v1 = *(void *)id.id.rawValue._countAndFlagsBits;
  v1[1] = v2;
  return id;
}

uint64_t sub_25A60B490@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25A6232B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25A60B4E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A60C06C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t RenderEffect.propertyListValue.getter()
{
  return sub_25A6227A0();
}

unint64_t sub_25A60B584()
{
  unint64_t result = qword_26A42BD98;
  if (!qword_26A42BD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BD98);
  }
  return result;
}

unint64_t sub_25A60B5D8()
{
  unint64_t result = qword_26A42BDA0;
  if (!qword_26A42BDA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BDA0);
  }
  return result;
}

uint64_t RenderEffect.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = &type metadata for RenderEffect.Key;
  unint64_t v10 = sub_25A60B584();
  sub_25A60B5D8();
  sub_25A622710();
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  if (!v2)
  {
    uint64_t v7 = v12;
    *a2 = v11;
    a2[1] = v7;
  }
  return result;
}

uint64_t RenderEffect.description.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RenderEffect.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25A622DF0();

  return swift_bridgeObjectRelease();
}

uint64_t static RenderEffect.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_25A6233B0();
  }
}

uint64_t RenderEffect.hashValue.getter()
{
  return sub_25A6234A0();
}

uint64_t sub_25A60B840()
{
  return sub_25A6227A0();
}

uint64_t sub_25A60B8B4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v9 = &type metadata for RenderEffect.Key;
  unint64_t v10 = sub_25A60B584();
  sub_25A60B5D8();
  sub_25A622710();
  uint64_t v5 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  if (!v2)
  {
    uint64_t v7 = v12;
    *a2 = v11;
    a2[1] = v7;
  }
  return result;
}

PreviewsMessagingOS::RenderEffect::ID __swiftcall RenderEffect.ID.init(stringLiteral:)(PreviewsMessagingOS::RenderEffect::ID stringLiteral)
{
  PreviewsMessagingOS::RenderEffect::ID *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t sub_25A60B9BC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A60C078();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A60BA18()
{
  return sub_25A622B20();
}

void static RenderEffect.DynamicTypeSize.xSmall.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000022;
  a1[1] = 0x800000025A637F10;
}

void static RenderEffect.DynamicTypeSize.small.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000021;
  a1[1] = 0x800000025A637F40;
}

void static RenderEffect.DynamicTypeSize.medium.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000022;
  a1[1] = 0x800000025A637F70;
}

void static RenderEffect.DynamicTypeSize.large.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000021;
  a1[1] = 0x800000025A637FA0;
}

void static RenderEffect.DynamicTypeSize.xLarge.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000022;
  a1[1] = 0x800000025A637FD0;
}

void static RenderEffect.DynamicTypeSize.xxLarge.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000023;
  a1[1] = 0x800000025A638000;
}

void static RenderEffect.DynamicTypeSize.xxxLarge.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000024;
  a1[1] = 0x800000025A638030;
}

void static RenderEffect.DynamicTypeSize.accessibility1.getter(void *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x800000025A638060;
}

void static RenderEffect.DynamicTypeSize.accessibility2.getter(void *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x800000025A638090;
}

void static RenderEffect.DynamicTypeSize.accessibility3.getter(void *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x800000025A6380C0;
}

void static RenderEffect.DynamicTypeSize.accessibility4.getter(void *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x800000025A6380F0;
}

void static RenderEffect.DynamicTypeSize.accessibility5.getter(void *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x800000025A638120;
}

void static RenderEffect.ColorScheme.light.getter(void *a1@<X8>)
{
  *a1 = 0xD00000000000001DLL;
  a1[1] = 0x800000025A638150;
}

void static RenderEffect.ColorScheme.dark.getter(void *a1@<X8>)
{
  *a1 = 0xD00000000000001CLL;
  a1[1] = 0x800000025A638170;
}

void static RenderEffect.Orientation.default.getter(void *a1@<X8>)
{
  *a1 = 0xD00000000000001FLL;
  a1[1] = 0x800000025A638190;
}

void static RenderEffect.Orientation.portrait.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000020;
  a1[1] = 0x800000025A6381B0;
}

void static RenderEffect.Orientation.landscapeLeft.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000025;
  a1[1] = 0x800000025A6381E0;
}

void static RenderEffect.Orientation.landscapeRight.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000026;
  a1[1] = 0x800000025A638210;
}

void static RenderEffect.Orientation.portraitUpsideDown.getter(void *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x800000025A638240;
}

unint64_t sub_25A60BCE4()
{
  unint64_t result = qword_26A42BDA8;
  if (!qword_26A42BDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BDA8);
  }
  return result;
}

unint64_t sub_25A60BD3C()
{
  unint64_t result = qword_26A42BDB0;
  if (!qword_26A42BDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BDB0);
  }
  return result;
}

unint64_t sub_25A60BD94()
{
  unint64_t result = qword_26A42BDB8;
  if (!qword_26A42BDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BDB8);
  }
  return result;
}

unint64_t sub_25A60BDEC()
{
  unint64_t result = qword_26A42BDC0;
  if (!qword_26A42BDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BDC0);
  }
  return result;
}

unint64_t sub_25A60BE44()
{
  unint64_t result = qword_26A42BDC8;
  if (!qword_26A42BDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BDC8);
  }
  return result;
}

unint64_t sub_25A60BE9C()
{
  unint64_t result = qword_26A42BDD0;
  if (!qword_26A42BDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BDD0);
  }
  return result;
}

ValueMetadata *type metadata accessor for RenderEffect()
{
  return &type metadata for RenderEffect;
}

ValueMetadata *type metadata accessor for RenderEffect.ID()
{
  return &type metadata for RenderEffect.ID;
}

ValueMetadata *type metadata accessor for RenderEffect.DynamicTypeSize()
{
  return &type metadata for RenderEffect.DynamicTypeSize;
}

ValueMetadata *type metadata accessor for RenderEffect.ColorScheme()
{
  return &type metadata for RenderEffect.ColorScheme;
}

ValueMetadata *type metadata accessor for RenderEffect.Orientation()
{
  return &type metadata for RenderEffect.Orientation;
}

unsigned char *storeEnumTagSinglePayload for RenderEffect.Key(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25A60BFDCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RenderEffect.Key()
{
  return &type metadata for RenderEffect.Key;
}

unint64_t sub_25A60C018()
{
  unint64_t result = qword_26A42BDD8;
  if (!qword_26A42BDD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42BDD8);
  }
  return result;
}

uint64_t sub_25A60C06C()
{
  return 25705;
}

unint64_t sub_25A60C078()
{
  unint64_t result = qword_26A42BDE0;
  if (!qword_26A42BDE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A42BDE0);
  }
  return result;
}

uint64_t sub_25A60C0D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A622FD0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25A622FC0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25A570C60(a1, &qword_26A429820);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25A622F70();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t MessageStream.Responder.reply<A>(payload:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ReplyBox();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v10, v6, a2);
  uint64_t WitnessTable = swift_getWitnessTable();
  TransportReply.send<A>(_:file:line:column:function:)((uint64_t)v10, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsMessaging/Sources/PreviewsMessaging/MessageStream.swift", 123, 2, 138, 32, (uint64_t)"reply(payload:)", 15, 2u, v7, WitnessTable);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t type metadata accessor for ReplyBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t MessageStream.open<A, B>(forSending:receiving:receiver:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = MessageStream.open<A>(forReceiving:receiver:)(a1, a3, a4, a6, a8);

  return MessageStream.open<A>(forSending:)(v10, a5, a7);
}

uint64_t MessageStream.Sender.send(oneWay:)(char *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  type metadata accessor for CompatibilityInterface();
  swift_getWitnessTable();
  uint64_t v4 = type metadata accessor for AsyncMessageStream.Sender();
  return AsyncMessageStream.Sender<>.send(oneWay:)(a1, v4, v3);
}

uint64_t MessageStream.Sender.send<A>(_:expecting:replyHandler:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v27 = a3;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429820);
  MEMORY[0x270FA5388](v13 - 8);
  long long v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v7[3];
  uint64_t v28 = *v7;
  long long v29 = *(_OWORD *)(v7 + 1);
  uint64_t v30 = v16;
  long long v31 = *((_OWORD *)v7 + 2);
  uint64_t v17 = type metadata accessor for ReplyBox();
  uint64_t v19 = *(void *)(a5 + 16);
  uint64_t v18 = *(void *)(a5 + 24);
  type metadata accessor for CompatibilityInterface();
  swift_getWitnessTable();
  uint64_t v20 = type metadata accessor for AsyncMessageStream.Sender();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v22 = AsyncMessageStream.Sender<>.send<A>(message:expecting:)(a1, v17, v20, v17, WitnessTable, v18);
  uint64_t v23 = sub_25A622FD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v15, 1, 1, v23);
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = v19;
  v24[5] = a6;
  v24[6] = v18;
  v24[7] = a7;
  v24[8] = v27;
  v24[9] = a4;
  v24[10] = v22;
  swift_retain();
  sub_25A60C0D8((uint64_t)v15, (uint64_t)&unk_26A42BDF0, (uint64_t)v24);
  return swift_release();
}

uint64_t MessageStream.invalidationHandle.getter()
{
  return swift_retain();
}

uint64_t MessageStream.init(underlying:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_25A6229F0();
  swift_allocObject();
  *a2 = sub_25A6229E0();
  uint64_t v4 = type metadata accessor for MessageStream(0);
  sub_25A60EAE0(a1, (uint64_t)a2 + *(int *)(v4 + 20), type metadata accessor for AsyncMessageStream);
  v7[3] = type metadata accessor for AsyncMessageStream(0);
  v7[4] = sub_25A60E778(&qword_26A4292C0, (void (*)(uint64_t))type metadata accessor for AsyncMessageStream);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  sub_25A60EAE0(a1, (uint64_t)boxed_opaque_existential_1, type metadata accessor for AsyncMessageStream);
  sub_25A60E778(&qword_26A42A7C8, (void (*)(uint64_t))type metadata accessor for MessageStream);
  sub_25A6227E0();
  sub_25A60F1F0(a1, type metadata accessor for AsyncMessageStream);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

uint64_t MessageStream.onInterruption(_:)(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  return sub_25A54F918(a1, a2);
}

uint64_t MessageStream.description.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for MessageStream(0) + 20) + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageStream.replacementAfterInterruption.getter()
{
  return MEMORY[0x270FA2498](sub_25A60C99C, 0, 0);
}

uint64_t sub_25A60C99C()
{
  sub_25A60E7C0();
  swift_allocError();
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t MessageStream.open<A>(forReceiving:receiver:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v26 = a5;
  uint64_t v27 = a2;
  uint64_t v28 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429820);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CompatibilityInterface();
  uint64_t WitnessTable = swift_getWitnessTable();
  type metadata accessor for TransportMessage();
  uint64_t v11 = sub_25A623080();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  long long v15 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v25 - v16;
  type metadata accessor for MessageStream(0);
  AsyncMessageStream.activate<A>(forReceiving:)(v9, v9, WitnessTable);
  uint64_t v18 = sub_25A622FD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  unint64_t v19 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = 0;
  *((void *)v20 + 3) = 0;
  uint64_t v21 = v26;
  *((void *)v20 + 4) = a4;
  *((void *)v20 + 5) = v21;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v20[v19], v15, v11);
  uint64_t v22 = &v20[(v13 + v19 + 7) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v23 = v28;
  *(void *)uint64_t v22 = v27;
  *((void *)v22 + 1) = v23;
  swift_retain();
  sub_25A60C0D8((uint64_t)v8, (uint64_t)&unk_26A42BE10, (uint64_t)v20);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

uint64_t MessageStream.open<A>(forSending:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = type metadata accessor for MessageStream(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429820);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessageStream.Sender();
  sub_25A622BF0();
  uint64_t v13 = sub_25A622FD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  sub_25A60EAE0(v4, (uint64_t)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for MessageStream);
  unint64_t v14 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  sub_25A610584((uint64_t)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14, type metadata accessor for MessageStream);
  return sub_25A622BE0();
}

uint64_t sub_25A60CEEC(uint64_t a1)
{
  *(void *)(v1 + 64) = a1;
  type metadata accessor for MessageStream(0);
  uint64_t v2 = type metadata accessor for CompatibilityInterface();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 72) = v3;
  swift_getWitnessTable();
  *uint64_t v3 = v1;
  v3[1] = sub_25A5507D8;
  return AsyncMessageStream.sender<A>(for:)(v1 + 16, v2, v2);
}

uint64_t sub_25A60CFF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  uint64_t v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  v7[6] = type metadata accessor for TransportReply();
  v7[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A42A890);
  v7[8] = swift_task_alloc();
  v7[9] = *(void *)(a7 - 8);
  v7[10] = swift_task_alloc();
  type metadata accessor for CompatibilityInterface();
  swift_getWitnessTable();
  uint64_t v9 = type metadata accessor for TransportMessage();
  v7[11] = v9;
  v7[12] = *(void *)(v9 - 8);
  v7[13] = swift_task_alloc();
  sub_25A623180();
  v7[14] = swift_task_alloc();
  uint64_t v10 = sub_25A623070();
  v7[15] = v10;
  v7[16] = *(void *)(v10 - 8);
  v7[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A60D244, 0, 0);
}

uint64_t sub_25A60D244()
{
  sub_25A623080();
  sub_25A623040();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  void *v1 = v0;
  v1[1] = sub_25A60D304;
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[15];
  return MEMORY[0x270FA1F68](v2, 0, 0, v3);
}

uint64_t sub_25A60D304()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25A60D400, 0, 0);
}

uint64_t sub_25A60D400()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[12];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[13], v1, v2);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v7 = v0[13];
    uint64_t v9 = v0[9];
    uint64_t v8 = v0[10];
    uint64_t v10 = v0[8];
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v11 = v0[7];
      uint64_t v12 = v0[5];
      uint64_t v13 = (void (*)(uint64_t, uint64_t))v0[3];
      uint64_t v14 = v7 + *(int *)(swift_getTupleTypeMetadata2() + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v8, v7, v12);
      sub_25A610584(v14, v11, (uint64_t (*)(void))type metadata accessor for TransportReply);
      sub_25A60EAE0(v11, v10, (uint64_t (*)(void))type metadata accessor for TransportReply);
      uint64_t v15 = type metadata accessor for MessageStream.Responder(0);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v10, 0, 1, v15);
      v13(v8, v10);
      sub_25A570C60(v10, &qword_26A42A890);
      sub_25A60F1F0(v11, (uint64_t (*)(void))type metadata accessor for TransportReply);
    }
    else
    {
      uint64_t v16 = (void (*)(uint64_t, uint64_t))v0[3];
      (*(void (**)(void, void, void))(v9 + 32))(v0[10], v0[13], v0[5]);
      uint64_t v17 = type metadata accessor for MessageStream.Responder(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v10, 1, 1, v17);
      v16(v8, v10);
      sub_25A570C60(v10, &qword_26A42A890);
    }
    (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[5]);
    uint64_t v18 = (void *)swift_task_alloc();
    v0[18] = v18;
    *uint64_t v18 = v0;
    v18[1] = sub_25A60D304;
    uint64_t v19 = v0[14];
    uint64_t v20 = v0[15];
    return MEMORY[0x270FA1F68](v19, 0, 0, v20);
  }
}

uint64_t sub_25A60D76C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 20) + 8);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t MessageStream.Sender.send(_:replyHandler:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429820);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v4[3];
  uint64_t v19 = *v4;
  long long v20 = *(_OWORD *)(v4 + 1);
  uint64_t v21 = v12;
  long long v22 = *((_OWORD *)v4 + 2);
  uint64_t v13 = *(void *)(a4 + 24);
  type metadata accessor for CompatibilityInterface();
  swift_getWitnessTable();
  uint64_t v14 = type metadata accessor for AsyncMessageStream.Sender();
  uint64_t v15 = AsyncMessageStream.Sender<>.send(message:)(a1, v14, v13);
  uint64_t v16 = sub_25A622FD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v11, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = a2;
  v17[5] = a3;
  v17[6] = v15;
  swift_retain();
  sub_25A60C0D8((uint64_t)v11, (uint64_t)&unk_26A42BE30, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_25A60D938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a4;
  v6[5] = a5;
  uint64_t v8 = (void *)swift_task_alloc();
  v6[6] = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429388);
  *uint64_t v8 = v6;
  v8[1] = sub_25A60DA0C;
  uint64_t v10 = MEMORY[0x263F8EE60] + 8;
  uint64_t v11 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FB8](v6 + 2, a6, v10, v9, v11);
}

uint64_t sub_25A60DA0C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25A60DB08, 0, 0);
}

uint64_t sub_25A60DB08()
{
  uint64_t v1 = *(void **)(v0 + 16);
  unsigned __int8 v2 = *(unsigned char *)(v0 + 24);
  (*(void (**)(void *, void))(v0 + 32))(v1, v2);
  sub_25A5E16FC(v1, v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_25A60DB90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = v19;
  v8[7] = v20;
  v8[4] = a7;
  v8[5] = a8;
  v8[2] = a4;
  v8[3] = a5;
  uint64_t v10 = type metadata accessor for ReplyBox();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A429388);
  uint64_t v12 = MEMORY[0x263F8E4E0];
  uint64_t v13 = sub_25A6234B0();
  v8[8] = v13;
  v8[9] = *(void *)(v13 - 8);
  uint64_t v14 = swift_task_alloc();
  v8[10] = v14;
  uint64_t v15 = sub_25A6234B0();
  v8[11] = v15;
  v8[12] = *(void *)(v15 - 8);
  v8[13] = swift_task_alloc();
  uint64_t v16 = (void *)swift_task_alloc();
  v8[14] = v16;
  *uint64_t v16 = v8;
  v16[1] = sub_25A60DD60;
  return MEMORY[0x270FA1FB8](v14, a6, v10, v11, v12);
}

uint64_t sub_25A60DD60()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25A60DE5C, 0, 0);
}

uint64_t sub_25A60DE5C()
{
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  uint64_t v15 = *(void *)(v0 + 88);
  uint64_t v14 = *(void (**)(uint64_t))(v0 + 16);
  uint64_t v8 = swift_task_alloc();
  long long v13 = *(_OWORD *)(v0 + 48);
  *(void *)uint64_t v8 = v7;
  *(void *)(v8 + 8) = v6;
  *(_OWORD *)(v8 + 16) = v13;
  uint64_t KeyPath = swift_getKeyPath();
  swift_task_dealloc();
  uint64_t v10 = (void *)swift_task_alloc();
  v10[2] = v7;
  v10[3] = v13;
  v10[4] = KeyPath;
  sub_25A58FF1C((void (*)(char *))sub_25A6108B0, v5, v1);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_release();
  v14(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t MessageStream.Sender.send(_:)()
{
  return sub_25A622BD0();
}

uint64_t sub_25A60E088(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v5 = type metadata accessor for MessageStream.Sender();
  swift_retain();
  MessageStream.Sender.send(_:replyHandler:)(a3, (uint64_t)sub_25A610554, a1, v5);

  return swift_release();
}

uint64_t MessageStream.Sender.send<A>(_:expecting:)()
{
  return sub_25A622BD0();
}

uint64_t sub_25A60E1C8(uint64_t *a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *a1;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a4;
  v12[3] = a5;
  v12[4] = a6;
  v12[5] = a1;
  uint64_t v13 = *(void *)(v11 + *MEMORY[0x263F60608]);
  uint64_t v14 = type metadata accessor for MessageStream.Sender();
  swift_retain();
  MessageStream.Sender.send<A>(_:expecting:replyHandler:)(a3, v15, (uint64_t)sub_25A610530, (uint64_t)v12, v14, v13, a6);

  return swift_release();
}

Swift::Void __swiftcall MessageStream.Responder.reply()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429D78);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25A622C10();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A622C20();
  _s19PreviewsMessagingOS24CanvasControlDescriptionV9ModifiersV17propertyListValue0a10FoundationC008PropertyI0Vvg_0();
  type metadata accessor for LazyPropertyList();
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(qword_26A429C58);
  sub_25A622640();
  sub_25A570C60((uint64_t)v2, &qword_26A429D78);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t MessageStream.Responder.reply(error:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429D78);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (uint64_t *)((char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_25A622C10();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A622C20();
  *uint64_t v4 = a1;
  swift_storeEnumTagMultiPayload();
  id v9 = a1;
  __swift_instantiateConcreteTypeFromMangledName(qword_26A429C58);
  sub_25A622640();
  sub_25A570C60((uint64_t)v4, &qword_26A429D78);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t type metadata accessor for CompatibilityInterface()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25A60E61C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_25A60E664(uint64_t a1)
{
  uint64_t v4 = v1[5];
  uint64_t v12 = v1[4];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[8];
  uint64_t v8 = v1[9];
  uint64_t v9 = v1[10];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_25A566D38;
  return sub_25A60DB90(a1, v5, v6, v7, v8, v9, v12, v4);
}

uint64_t type metadata accessor for MessageStream(uint64_t a1)
{
  return sub_25A54FD94(a1, qword_26A42BE40);
}

uint64_t sub_25A60E778(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25A60E7C0()
{
  unint64_t result = qword_26A42BE00;
  if (!qword_26A42BE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A42BE00);
  }
  return result;
}

uint64_t sub_25A60E814()
{
  type metadata accessor for CompatibilityInterface();
  swift_getWitnessTable();
  type metadata accessor for TransportMessage();
  uint64_t v1 = sub_25A623080();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_25A60E940(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = v1[4];
  type metadata accessor for CompatibilityInterface();
  swift_getWitnessTable();
  type metadata accessor for TransportMessage();
  uint64_t v6 = *(void *)(sub_25A623080() - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = (uint64_t)v1 + v7;
  uint64_t v11 = (void *)((char *)v1 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v14;
  *uint64_t v14 = v3;
  v14[1] = sub_25A55F118;
  return sub_25A60CFF4(a1, v8, v9, v10, v12, v13, v5);
}

uint64_t type metadata accessor for MessageStream.Sender()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25A60EAE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A60EB48()
{
  uint64_t v1 = (int *)(type metadata accessor for MessageStream(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  uint64_t v7 = v6 + v1[7];
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v8 = v7 + *(int *)(type metadata accessor for AsyncMessageStream(0) + 24);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429288);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_release();

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_25A60EC70(uint64_t a1)
{
  type metadata accessor for MessageStream(0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25A55F118;
  return sub_25A60CEEC(a1);
}

uint64_t sub_25A60ED5C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25A60EDA4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_25A566D38;
  return sub_25A60D938(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_25A60EE6C(uint64_t a1)
{
  return sub_25A60E088(a1, *(void *)(v1 + 32), *(char **)(v1 + 40));
}

uint64_t sub_25A60EE78(uint64_t *a1)
{
  return sub_25A60E1C8(a1, *(void *)(v1 + 40), *(char **)(v1 + 48), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t MessageStream.Responder.reply(result:)(void *a1, char a2)
{
  return TransportReply.send(result:file:line:column:function:)(a1, a2 & 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsMessaging/Sources/PreviewsMessaging/MessageStream.swift", 123, 2, 142, 32, (uint64_t)"reply(result:)", 14, 2u);
}

uint64_t MessageStream.Responder.reply<A>(result:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v17[1] = a1;
  uint64_t v6 = type metadata accessor for ReplyBox();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A429388);
  uint64_t v7 = sub_25A6234B0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v17 - v9;
  uint64_t v11 = type metadata accessor for TransportReply();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A60EAE0(v3, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for TransportReply);
  v17[4] = a2;
  v17[5] = a3;
  uint64_t v14 = sub_25A6234B0();
  sub_25A58FF1C((void (*)(char *))sub_25A60F1E8, v14, (uint64_t)v10);
  uint64_t WitnessTable = swift_getWitnessTable();
  TransportReply.send<A>(result:file:line:column:function:)((uint64_t)v10, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsMessaging/Sources/PreviewsMessaging/MessageStream.swift", 123, 2, 146, 32, (uint64_t)"reply(result:)", 14, 2u, v6, WitnessTable);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return sub_25A60F1F0((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for TransportReply);
}

uint64_t sub_25A60F110@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, a2);
}

uint64_t sub_25A60F1E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25A60F110(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_25A60F1F0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for MessageStream(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v10 = *(uint64_t *)((char *)a2 + v6);
    uint64_t v9 = *(uint64_t *)((char *)a2 + v6 + 8);
    *uint64_t v7 = v10;
    v7[1] = v9;
    v7[2] = *((void *)v8 + 2);
    uint64_t v11 = type metadata accessor for AsyncMessageStream(0);
    uint64_t v12 = *(int *)(v11 + 24);
    uint64_t v13 = (char *)v7 + v12;
    uint64_t v14 = &v8[v12];
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429288);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    *(void *)((char *)v7 + *(int *)(v11 + 28)) = *(void *)&v8[*(int *)(v11 + 28)];
  }
  swift_retain();
  return v5;
}

uint64_t destroy for MessageStream(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v5 = v4 + *(int *)(type metadata accessor for AsyncMessageStream(0) + 24);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429288);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_release();
}

void *initializeWithCopy for MessageStream(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v8 = *(void *)((char *)a2 + v4);
  uint64_t v7 = *(void *)((char *)a2 + v4 + 8);
  void *v5 = v8;
  v5[1] = v7;
  uint64_t v5[2] = *((void *)v6 + 2);
  uint64_t v9 = type metadata accessor for AsyncMessageStream(0);
  uint64_t v10 = *(int *)(v9 + 24);
  uint64_t v11 = (char *)v5 + v10;
  uint64_t v12 = &v6[v10];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429288);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  *(void *)((char *)v5 + *(int *)(v9 + 28)) = *(void *)&v6[*(int *)(v9 + 28)];
  swift_retain();
  return a1;
}

void *assignWithCopy for MessageStream(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(void *)((char *)a1 + v6) = *(void *)((char *)a2 + v6);
  swift_retain();
  swift_release();
  *((void *)v7 + 1) = *((void *)v8 + 1);
  *((void *)v7 + 2) = *((void *)v8 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = type metadata accessor for AsyncMessageStream(0);
  uint64_t v10 = *(int *)(v9 + 24);
  uint64_t v11 = &v7[v10];
  uint64_t v12 = &v8[v10];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429288);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  *(void *)&v7[*(int *)(v9 + 28)] = *(void *)&v8[*(int *)(v9 + 28)];
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for MessageStream(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  *(void *)uint64_t v5 = *(void *)((char *)a2 + v4);
  *(_OWORD *)(v5 + 8) = *(_OWORD *)((char *)a2 + v4 + 8);
  uint64_t v7 = type metadata accessor for AsyncMessageStream(0);
  uint64_t v8 = *(int *)(v7 + 24);
  uint64_t v9 = &v5[v8];
  uint64_t v10 = &v6[v8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429288);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  *(void *)&v5[*(int *)(v7 + 28)] = *(void *)&v6[*(int *)(v7 + 28)];
  return a1;
}

void *assignWithTake for MessageStream(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(void *)((char *)a1 + v6) = *(void *)((char *)a2 + v6);
  swift_release();
  uint64_t v9 = *((void *)v8 + 2);
  *((void *)v7 + 1) = *((void *)v8 + 1);
  *((void *)v7 + 2) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for AsyncMessageStream(0);
  uint64_t v11 = *(int *)(v10 + 24);
  uint64_t v12 = &v7[v11];
  uint64_t v13 = &v8[v11];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A429288);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  *(void *)&v7[*(int *)(v10 + 28)] = *(void *)&v8[*(int *)(v10 + 28)];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageStream(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A60F7DC);
}

uint64_t sub_25A60F7DC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for AsyncMessageStream(0);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for MessageStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A60F8A0);
}

void *sub_25A60F8A0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for AsyncMessageStream(0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25A60F948()
{
  uint64_t result = type metadata accessor for AsyncMessageStream(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MessageStream.Responder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A60F9F8);
}

uint64_t sub_25A60F9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TransportReply();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MessageStream.Responder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A60FA78);
}

uint64_t sub_25A60FA78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TransportReply();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for MessageStream.Responder(uint64_t a1)
{
  return sub_25A54FD94(a1, qword_26A42BED0);
}

ValueMetadata *type metadata accessor for MessageStream.ThisDoesNotWorkAnyMore()
{
  return &type metadata for MessageStream.ThisDoesNotWorkAnyMore;
}

uint64_t sub_25A60FB18()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25A60FBA8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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

void sub_25A60FD04(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
      JUMPOUT(0x25A60FF1CLL);
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

BOOL sub_25A60FF44()
{
  uint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_25A60FF8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D338];

  return MEMORY[0x270F9F940](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_25A610000(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAE8](a1, a2, WitnessTable, v5);
}

uint64_t sub_25A61006C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAF8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_25A6100DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9DAF0](a1, a2, a3, WitnessTable, v7);
}

BOOL sub_25A61014C@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_25A60FF44();
  *a1 = result;
  return result;
}

uint64_t sub_25A610188@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A610998();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25A6101B4()
{
  return sub_25A6227A0();
}

uint64_t sub_25A610250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  BOOL v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v14 = type metadata accessor for ReplyBox.Key();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25A622710();
  uint64_t v10 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  if (v3) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v7 + 32))(a3, v9, a2);
}

uint64_t sub_25A6103FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_25A610250(a1, *(void *)(a2 + 16), a3);
}

uint64_t type metadata accessor for ReplyBox.Key()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25A610434(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 16))(a2, *(void *)(v2 + 32), v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);

  return v5(a2, 0, 1, v4);
}

uint64_t sub_25A6104F8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_25A610530()
{
  return sub_25A622C00();
}

uint64_t sub_25A610554()
{
  return sub_25A622C00();
}

uint64_t sub_25A610584(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A6105EC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25A6106C8;
  return v6(a1);
}

uint64_t sub_25A6106C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25A6107C0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A6107F8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_25A566D38;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A42BFE0 + dword_26A42BFE0);
  return v6(a1, v4);
}

uint64_t sub_25A6108B0(uint64_t a1)
{
  return MEMORY[0x270FA0310](a1, *(void *)(v1 + 32));
}

unsigned char *sub_25A6108B8(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25A610954);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25A61097C()
{
  return swift_getWitnessTable();
}

uint64_t sub_25A610998()
{
  return 0x64616F6C796170;
}

PreviewsMessagingOS::MessageStreamInstanceIdentifier __swiftcall MessageStreamInstanceIdentifier.init(rawValue:)(PreviewsMessagingOS::MessageStreamInstanceIdentifier rawValue)
{
  PreviewsMessagingOS::MessageStreamInstanceIdentifier *v1 = rawValue;
  return rawValue;
}

uint64_t MessageStreamAgentIdentifier.deviceIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A611CA4(MEMORY[0x263F60460], a1);
}

uint64_t MessageStreamAgentIdentifier.agentPid.getter()
{
  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for MessageStreamAgentIdentifier(0) + 20));
}

uint64_t type metadata accessor for MessageStreamAgentIdentifier(uint64_t a1)
{
  return sub_25A54FD94(a1, (uint64_t *)&unk_26A42C0F0);
}

uint64_t MessageStreamAgentIdentifier.init(deviceIdentifier:agentPid:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  return sub_25A611D64(a1, a2, MEMORY[0x263F60460], type metadata accessor for MessageStreamAgentIdentifier, a3);
}

uint64_t MessageStreamAgentIdentifier.hash(into:)()
{
  return sub_25A623480();
}

BOOL static MessageStreamAgentIdentifier.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_25A612424(a1, a2, MEMORY[0x263F60458], type metadata accessor for MessageStreamAgentIdentifier);
}

uint64_t MessageStreamAgentIdentifier.hashValue.getter()
{
  return sub_25A6234A0();
}

uint64_t sub_25A610B9C(uint64_t a1, uint64_t a2)
{
  return sub_25A6125A0(a1, a2, MEMORY[0x263F60460], &qword_26A42B4E8, MEMORY[0x263F60460]);
}

uint64_t sub_25A610BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A612684(a1, a2, a3, MEMORY[0x263F60460], &qword_26A42B4E8, MEMORY[0x263F60460]);
}

uint64_t sub_25A610C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A612754(a1, a2, a3, MEMORY[0x263F60460], &qword_26A42B4E8, MEMORY[0x263F60460]);
}

BOOL sub_25A610C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25A612858(a1, a2, a3, a4, MEMORY[0x263F60458]);
}

uint64_t MessageStreamRequest.agentSpecification.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A6135B8(v1, a1, type metadata accessor for MessageStreamAgentSpecification);
}

uint64_t type metadata accessor for MessageStreamAgentSpecification(uint64_t a1)
{
  return sub_25A54FD94(a1, (uint64_t *)&unk_26A42C110);
}

uint64_t MessageStreamRequest.streamHandler.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for MessageStreamRequest(0) + 20));
  swift_retain();
  return v1;
}

uint64_t type metadata accessor for MessageStreamRequest(uint64_t a1)
{
  return sub_25A54FD94(a1, (uint64_t *)&unk_26A42C100);
}

uint64_t MessageStreamRequest.init(specification:streamHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_25A613674(a1, a4, type metadata accessor for MessageStreamAgentSpecification);
  uint64_t result = type metadata accessor for MessageStreamRequest(0);
  uint64_t v8 = (void *)(a4 + *(int *)(result + 20));
  *uint64_t v8 = a2;
  v8[1] = a3;
  return result;
}

uint64_t MessageStreamRequest.init(agentClassName:agentIdentifier:initializationPayload:streamHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  *a8 = a1;
  a8[1] = a2;
  a8[2] = 0;
  a8[3] = 0;
  a8[4] = a3;
  a8[5] = a4;
  unsigned int v12 = (char *)a8 + *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  uint64_t v13 = sub_25A6227C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v12, a5, v13);
  uint64_t result = type metadata accessor for MessageStreamRequest(0);
  int v15 = (void *)((char *)a8 + *(int *)(result + 20));
  *int v15 = a6;
  v15[1] = a7;
  return result;
}

uint64_t MessageStreamAgentSpecification.init(mangledClassName:frameworkPath:instanceIdentifier:initializationPayload:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  BOOL v9 = (char *)a8 + *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  uint64_t v10 = sub_25A6227C0();
  int v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);

  return v11(v9, a7, v10);
}

uint64_t MessageStreamAgentSpecification.mangledClassName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageStreamAgentSpecification.frameworkPath.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageStreamAgentSpecification.instanceIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageStreamAgentSpecification.initializationPayload.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  uint64_t v4 = sub_25A6227C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

unint64_t sub_25A610FD8(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x726F77656D617266;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25A611074(unsigned __int8 *a1, char *a2)
{
  return sub_25A5E7D44(*a1, *a2);
}

uint64_t sub_25A611080()
{
  return sub_25A61A4D4();
}

uint64_t sub_25A611088()
{
  return sub_25A549694();
}

uint64_t sub_25A611090()
{
  return sub_25A61E6E8();
}

uint64_t sub_25A611098@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A615B58();
  *a1 = result;
  return result;
}

unint64_t sub_25A6110C8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A610FD8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A6110F4()
{
  return sub_25A610FD8(*v0);
}

uint64_t MessageStreamAgentSpecification.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A611138(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A4299B8);
  MEMORY[0x270FA5388](v2 - 8);
  long long v29 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42C178);
  uint64_t v5 = v4 - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = a1[1];
  uint64_t v10 = a1[2];
  uint64_t v11 = a1[3];
  uint64_t v25 = *a1;
  uint64_t v26 = v10;
  uint64_t v12 = a1[4];
  uint64_t v27 = v9;
  uint64_t v28 = v12;
  uint64_t v13 = a1[5];
  uint64_t v30 = (uint64_t)&v24 - v14;
  uint64_t v31 = v13;
  int v15 = (char *)&v24 + *(int *)(v5 + 56) - v14;
  *((unsigned char *)&v24 - v14) = 3;
  uint64_t v16 = (char *)a1 + *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  uint64_t v17 = sub_25A6227C0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  v19(v15, v16, v17);
  char v41 = 0;
  uint64_t v39 = v25;
  uint64_t v40 = v9;
  char v38 = 1;
  uint64_t v36 = v26;
  uint64_t v37 = v11;
  char v35 = 2;
  uint64_t v33 = v28;
  uint64_t v34 = v31;
  uint64_t v20 = &v8[*(int *)(v5 + 56)];
  *uint64_t v8 = 3;
  v19(v20, v15, v17);
  uint64_t v21 = (uint64_t)v29;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v29, v20, v17);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v21, 0, 1, v17);
  char v32 = 3;
  sub_25A611730();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_25A622A60();
  sub_25A570C60(v21, &qword_26A4299B8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25A570C60(v30, &qword_26A42C178);
  return v22;
}

uint64_t sub_25A61143C()
{
  return sub_25A611138(*(uint64_t **)(v0 + 16));
}

uint64_t MessageStreamAgentSpecification.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v5 = sub_25A6227C0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = &type metadata for MessageStreamAgentSpecification.Key;
  unint64_t v9 = sub_25A611730();
  unint64_t v31 = v9;
  v29[0] = 0;
  sub_25A622710();
  if (v2)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  }
  else
  {
    uint64_t v34 = a2;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    uint64_t v11 = v32;
    uint64_t v10 = v33;
    uint64_t v30 = &type metadata for MessageStreamAgentSpecification.Key;
    unint64_t v31 = v9;
    v29[0] = 1;
    sub_25A622760();
    uint64_t v23 = v11;
    uint64_t v24 = v10;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    uint64_t v13 = v27;
    uint64_t v12 = v28;
    uint64_t v30 = &type metadata for MessageStreamAgentSpecification.Key;
    unint64_t v31 = v9;
    v29[0] = 2;
    sub_25A622760();
    uint64_t v22 = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    uint64_t v20 = v25;
    uint64_t v21 = v26;
    uint64_t v30 = &type metadata for MessageStreamAgentSpecification.Key;
    unint64_t v31 = v9;
    v29[0] = 3;
    sub_25A622710();
    uint64_t v15 = v24;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    uint64_t v16 = v34;
    *(void *)uint64_t v34 = v23;
    *((void *)v16 + 1) = v15;
    uint64_t v17 = v22;
    *((void *)v16 + 2) = v13;
    *((void *)v16 + 3) = v17;
    uint64_t v18 = v21;
    *((void *)v16 + 4) = v20;
    *((void *)v16 + 5) = v18;
    uint64_t v19 = type metadata accessor for MessageStreamAgentSpecification(0);
    return (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))(&v16[*(int *)(v19 + 28)], v8, v5);
  }
}

unint64_t sub_25A611730()
{
  unint64_t result = qword_26A42C070;
  if (!qword_26A42C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C070);
  }
  return result;
}

uint64_t sub_25A611784()
{
  return sub_25A622780();
}

uint64_t sub_25A6117C0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return MessageStreamAgentSpecification.init(propertyListValue:)(a1, a2);
}

uint64_t MessageStreamAgentSpecification.ID.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  if (!v1)
  {
    sub_25A623470();
    if (v2) {
      goto LABEL_3;
    }
    return sub_25A623470();
  }
  sub_25A623470();
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  if (!v2) {
    return sub_25A623470();
  }
LABEL_3:
  sub_25A623470();
  swift_bridgeObjectRetain();
  sub_25A622DF0();

  return swift_bridgeObjectRelease();
}

uint64_t MessageStreamAgentSpecification.ID.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 40);
  sub_25A623450();
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  if (!v1)
  {
    sub_25A623470();
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    sub_25A623470();
    return sub_25A6234A0();
  }
  sub_25A623470();
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  if (!v2) {
    goto LABEL_5;
  }
LABEL_3:
  sub_25A623470();
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  return sub_25A6234A0();
}

uint64_t sub_25A6119E0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 40);
  sub_25A623450();
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  if (!v1)
  {
    sub_25A623470();
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    sub_25A623470();
    return sub_25A6234A0();
  }
  sub_25A623470();
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  if (!v2) {
    goto LABEL_5;
  }
LABEL_3:
  sub_25A623470();
  swift_bridgeObjectRetain();
  sub_25A622DF0();
  swift_bridgeObjectRelease();
  return sub_25A6234A0();
}

uint64_t MessageStreamAgentSpecification.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 40);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_25A611B38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 40);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t MessageStreamInstanceIdentifier.description.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25A611BC8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A615BF0();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A611C24()
{
  return sub_25A622B20();
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.streamID.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A611CA4(MEMORY[0x263F07508], a1);
}

uint64_t sub_25A611CA4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, v2, v4);
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.agentPid.getter()
{
  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for HostAgentSystem.AgentEndpoint.Identity(0) + 20));
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.init(streamID:agentPid:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  return sub_25A611D64(a1, a2, MEMORY[0x263F07508], type metadata accessor for HostAgentSystem.AgentEndpoint.Identity, a3);
}

uint64_t sub_25A611D64@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t (*a3)(void)@<X2>, uint64_t (*a4)(void)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(a5, a1, v9);
  uint64_t result = a4(0);
  *(_DWORD *)(a5 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t sub_25A611DEC(char a1)
{
  if (a1) {
    return 0x646950746E656761;
  }
  else {
    return 0x44496D6165727473;
  }
}

uint64_t sub_25A611E1C(char *a1, char *a2)
{
  return sub_25A5EC0F0(*a1, *a2);
}

uint64_t sub_25A611E28()
{
  return sub_25A61A5C4();
}

uint64_t sub_25A611E30()
{
  return sub_25A54BC5C();
}

uint64_t sub_25A611E38()
{
  return sub_25A61BEAC();
}

uint64_t sub_25A611E40@<X0>(char *a1@<X8>)
{
  return sub_25A56B748(a1);
}

uint64_t sub_25A611E4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A611DEC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A611E78()
{
  return sub_25A611DEC(*v0);
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A611EBC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42A518);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42C170);
  uint64_t v6 = v5 - 8;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v19[-v10];
  uint64_t v12 = &v19[*(int *)(v6 + 56) - v10];
  v19[-v10] = 0;
  uint64_t v13 = sub_25A622310();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v14 + 16);
  v15(v12, a1, v13);
  int v20 = *(_DWORD *)(a1 + *(int *)(type metadata accessor for HostAgentSystem.AgentEndpoint.Identity(0) + 20));
  uint64_t v16 = &v9[*(int *)(v6 + 56)];
  *uint64_t v9 = 0;
  v15(v16, (uint64_t)v12, v13);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v14 + 32))(v4, v16, v13);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v4, 0, 1, v13);
  char v24 = 0;
  char v23 = 1;
  int v21 = v20;
  char v22 = 0;
  sub_25A61344C();
  uint64_t v17 = sub_25A622A80();
  sub_25A570C60((uint64_t)v4, &qword_26A42A518);
  sub_25A570C60((uint64_t)v11, &qword_26A42C170);
  return v17;
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_25A622310();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = &type metadata for HostAgentSystem.AgentEndpoint.Identity.Key;
  unint64_t v9 = sub_25A61344C();
  unint64_t v17 = v9;
  v15[0] = 0;
  sub_25A622710();
  if (v2)
  {
    uint64_t v10 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    uint64_t v16 = &type metadata for HostAgentSystem.AgentEndpoint.Identity.Key;
    unint64_t v17 = v9;
    v15[0] = 1;
    sub_25A622710();
    uint64_t v12 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    int v13 = v14[1];
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
    uint64_t result = type metadata accessor for HostAgentSystem.AgentEndpoint.Identity(0);
    *(_DWORD *)(a2 + *(int *)(result + 20)) = v13;
  }
  return result;
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.hash(into:)()
{
  return sub_25A623480();
}

BOOL static HostAgentSystem.AgentEndpoint.Identity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_25A612424(a1, a2, MEMORY[0x263F074F0], type metadata accessor for HostAgentSystem.AgentEndpoint.Identity);
}

BOOL sub_25A612424(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  if ((a3() & 1) == 0) {
    return 0;
  }
  uint64_t v7 = a4(0);
  return *(_DWORD *)(a1 + *(int *)(v7 + 20)) == *(_DWORD *)(a2 + *(int *)(v7 + 20));
}

uint64_t HostAgentSystem.AgentEndpoint.Identity.hashValue.getter()
{
  return sub_25A6234A0();
}

uint64_t sub_25A612528(char a1)
{
  if (a1) {
    return 0x657461647075;
  }
  else {
    return 0x746E656761;
  }
}

uint64_t sub_25A612558(uint64_t a1, uint64_t a2)
{
  return sub_25A6125A0(a1, a2, MEMORY[0x263F07508], (unint64_t *)&qword_26A42A540, MEMORY[0x263F07508]);
}

uint64_t sub_25A6125A0(uint64_t a1, uint64_t a2, void (*a3)(void), unint64_t *a4, void (*a5)(uint64_t))
{
  return sub_25A6234A0();
}

uint64_t sub_25A61263C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A612684(a1, a2, a3, MEMORY[0x263F07508], (unint64_t *)&qword_26A42A540, MEMORY[0x263F07508]);
}

uint64_t sub_25A612684(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), unint64_t *a5, void (*a6)(uint64_t))
{
  return sub_25A623480();
}

uint64_t sub_25A61270C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A612754(a1, a2, a3, MEMORY[0x263F07508], (unint64_t *)&qword_26A42A540, MEMORY[0x263F07508]);
}

uint64_t sub_25A612754(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), unint64_t *a5, void (*a6)(uint64_t))
{
  return sub_25A6234A0();
}

uint64_t sub_25A6127EC()
{
  return sub_25A622780();
}

uint64_t sub_25A612828@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return HostAgentSystem.AgentEndpoint.Identity.init(propertyListValue:)(a1, a2);
}

BOOL sub_25A612840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25A612858(a1, a2, a3, a4, MEMORY[0x263F074F0]);
}

BOOL sub_25A612858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return (a5() & 1) != 0 && *(_DWORD *)(a1 + *(int *)(a3 + 20)) == *(_DWORD *)(a2 + *(int *)(a3 + 20));
}

uint64_t sub_25A6128B0(char *a1, char *a2)
{
  return sub_25A5EC334(*a1, *a2);
}

uint64_t sub_25A6128BC()
{
  return sub_25A61A63C();
}

uint64_t sub_25A6128C4()
{
  return sub_25A54BDA4();
}

uint64_t sub_25A6128CC()
{
  return sub_25A61BD28();
}

uint64_t sub_25A6128D4@<X0>(char *a1@<X8>)
{
  return sub_25A56B748(a1);
}

uint64_t sub_25A6128E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A612528(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A61290C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A615B04();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A612968()
{
  return sub_25A622B20();
}

unint64_t sub_25A6129D0(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
    case 4:
      return result;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0x6164705574736F68;
      break;
    default:
      unint64_t result = 0x696D697263736964;
      break;
  }
  return result;
}

uint64_t sub_25A612A8C(unsigned __int8 *a1, char *a2)
{
  return sub_25A5EC170(*a1, *a2);
}

uint64_t sub_25A612A98()
{
  return sub_25A61A6B8();
}

uint64_t sub_25A612AA0()
{
  return sub_25A54BCB4();
}

uint64_t sub_25A612AA8()
{
  return sub_25A61BDA0();
}

uint64_t sub_25A612AB0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A615BA4();
  *a1 = result;
  return result;
}

unint64_t sub_25A612AE0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A6129D0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A612B0C()
{
  return sub_25A6129D0(*v0);
}

uint64_t HostAgentSystem.AgentEndpoint.StreamContext.propertyListValue.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42C080);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = type metadata accessor for MessageStreamAgentSpecification(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (uint64_t *)&v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = v0;
  unint64_t v11 = sub_25A613510();
  sub_25A613564();
  sub_25A6227A0();
  sub_25A6135B8(v0, (uint64_t)v10, type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = v10[1];
    uint64_t v13 = v10[2];
    uint64_t v14 = v10[3];
    uint64_t v15 = v10[4];
    uint64_t v22 = *v10;
    uint64_t v23 = v12;
    int v20 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
    unint64_t v21 = v11;
    v19[0] = 2;
    sub_25A57251C();
    sub_25A622700();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    unint64_t v21 = v11;
    uint64_t v22 = v13;
    LOBYTE(v23) = 0;
    int v20 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
    v19[0] = 3;
    sub_25A572474();
    sub_25A622700();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    uint64_t v22 = v14;
    uint64_t v23 = v15;
    int v20 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
    unint64_t v21 = v11;
    v19[0] = 4;
    sub_25A613620();
    sub_25A622700();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25A613674((uint64_t)v10, (uint64_t)v7, type metadata accessor for MessageStreamAgentSpecification);
    sub_25A6135B8((uint64_t)v7, (uint64_t)v3, type metadata accessor for MessageStreamAgentSpecification);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    int v20 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
    unint64_t v21 = v11;
    v19[0] = 1;
    sub_25A6134A0(&qword_26A42C0A0, (void (*)(uint64_t))type metadata accessor for MessageStreamAgentSpecification);
    sub_25A622700();
    sub_25A570C60((uint64_t)v3, &qword_26A42C080);
    sub_25A6153C0((uint64_t)v7, type metadata accessor for MessageStreamAgentSpecification);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
}

uint64_t sub_25A612E70(unsigned char *a1, BOOL *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_25A6135B8(a3, (uint64_t)v8, type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  BOOL v10 = EnumCaseMultiPayload == 1;
  if (EnumCaseMultiPayload == 1) {
    unint64_t v11 = type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext;
  }
  else {
    unint64_t v11 = type metadata accessor for MessageStreamAgentSpecification;
  }
  uint64_t result = sub_25A6153C0((uint64_t)v8, v11);
  *a2 = v10;
  return result;
}

uint64_t HostAgentSystem.AgentEndpoint.StreamContext.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (void *)((char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v6);
  BOOL v10 = (char *)v21 - v9;
  uint64_t v25 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
  unint64_t v11 = sub_25A613510();
  unint64_t v26 = v11;
  v24[0] = 0;
  sub_25A613564();
  sub_25A622710();
  if (v2)
  {
    uint64_t v12 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    uint64_t v25 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
    unint64_t v26 = v11;
    if (v22)
    {
      v24[0] = 2;
      sub_25A57251C();
      sub_25A622710();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      uint64_t v15 = v22;
      uint64_t v14 = v23;
      uint64_t v25 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
      unint64_t v26 = v11;
      v24[0] = 3;
      sub_25A572474();
      sub_25A622710();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      v21[0] = v27;
      uint64_t v25 = &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
      unint64_t v26 = v11;
      v24[0] = 4;
      sub_25A613620();
      sub_25A622710();
      uint64_t v17 = sub_25A6227C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(a1, v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      uint64_t v18 = v21[1];
      uint64_t v19 = v21[2];
      *uint64_t v8 = v15;
      v8[1] = v14;
      v8[2] = v21[0];
      v8[3] = v18;
      v8[4] = v19;
      swift_storeEnumTagMultiPayload();
      uint64_t v20 = (uint64_t)v8;
    }
    else
    {
      v24[0] = 1;
      type metadata accessor for MessageStreamAgentSpecification(0);
      sub_25A6134A0(&qword_26A42C0A0, (void (*)(uint64_t))type metadata accessor for MessageStreamAgentSpecification);
      sub_25A622710();
      uint64_t v16 = sub_25A6227C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
      swift_storeEnumTagMultiPayload();
      uint64_t v20 = (uint64_t)v10;
    }
    return sub_25A613674(v20, a2, type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext);
  }
}

uint64_t sub_25A613308@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return HostAgentSystem.AgentEndpoint.StreamContext.init(propertyListValue:)(a1, a2);
}

uint64_t _s19PreviewsMessagingOS31MessageStreamAgentSpecificationV2IDV2eeoiySbAE_AEtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v9 = a2[4];
  uint64_t v8 = a2[5];
  if (*a1 == *a2 && a1[1] == a2[1] || (char v10 = sub_25A6233B0(), result = 0, (v10 & 1) != 0))
  {
    if (v4)
    {
      if (!v6) {
        return 0;
      }
      if (v2 != v7 || v4 != v6)
      {
        char v12 = sub_25A6233B0();
        uint64_t result = 0;
        if ((v12 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v6)
    {
      return 0;
    }
    if (v5)
    {
      if (v8 && (v3 == v9 && v5 == v8 || (sub_25A6233B0() & 1) != 0)) {
        return 1;
      }
    }
    else if (!v8)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1)
{
  return sub_25A54FD94(a1, (uint64_t *)&unk_26A42C120);
}

uint64_t sub_25A613444()
{
  return sub_25A611EBC(*(void *)(v0 + 16));
}

unint64_t sub_25A61344C()
{
  unint64_t result = qword_26A42C078;
  if (!qword_26A42C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C078);
  }
  return result;
}

uint64_t sub_25A6134A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext(uint64_t a1)
{
  return sub_25A54FD94(a1, (uint64_t *)&unk_26A42C130);
}

uint64_t sub_25A613508(unsigned char *a1, BOOL *a2)
{
  return sub_25A612E70(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_25A613510()
{
  unint64_t result = qword_26A42C088;
  if (!qword_26A42C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C088);
  }
  return result;
}

unint64_t sub_25A613564()
{
  unint64_t result = qword_26A42C090;
  if (!qword_26A42C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C090);
  }
  return result;
}

uint64_t sub_25A6135B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_25A613620()
{
  unint64_t result = qword_26A42C098;
  if (!qword_26A42C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C098);
  }
  return result;
}

uint64_t sub_25A613674(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A6136DC()
{
  return sub_25A6134A0(&qword_26A42C0A8, (void (*)(uint64_t))type metadata accessor for MessageStreamAgentIdentifier);
}

unint64_t sub_25A613728()
{
  unint64_t result = qword_26A42C0B0;
  if (!qword_26A42C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C0B0);
  }
  return result;
}

unint64_t sub_25A613780()
{
  unint64_t result = qword_26A42C0B8;
  if (!qword_26A42C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C0B8);
  }
  return result;
}

unint64_t sub_25A6137D8()
{
  unint64_t result = qword_26A42C0C0;
  if (!qword_26A42C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C0C0);
  }
  return result;
}

uint64_t sub_25A61382C()
{
  return MEMORY[0x263F60440];
}

uint64_t sub_25A613838()
{
  return sub_25A6134A0((unint64_t *)&qword_26A42A540, MEMORY[0x263F07508]);
}

unint64_t sub_25A613884()
{
  unint64_t result = qword_26A42C0C8;
  if (!qword_26A42C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C0C8);
  }
  return result;
}

uint64_t sub_25A6138D8()
{
  return sub_25A6134A0(&qword_26A42C0D0, (void (*)(uint64_t))type metadata accessor for HostAgentSystem.AgentEndpoint.Identity);
}

uint64_t sub_25A613920()
{
  return sub_25A6134A0(&qword_26A42C0D8, (void (*)(uint64_t))type metadata accessor for HostAgentSystem.AgentEndpoint.Identity);
}

uint64_t sub_25A613968()
{
  return sub_25A6134A0(&qword_26A42C0E0, (void (*)(uint64_t))type metadata accessor for HostAgentSystem.AgentEndpoint.Identity);
}

unint64_t sub_25A6139B4()
{
  unint64_t result = qword_26A42C0E8;
  if (!qword_26A42C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C0E8);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for MessageStreamAgentIdentifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_25A614A04(a1, a2, a3, MEMORY[0x263F60460]);
}

uint64_t destroy for MessageStreamAgentIdentifier(uint64_t a1, uint64_t a2)
{
  return sub_25A614AEC(a1, a2, MEMORY[0x263F60460]);
}

uint64_t initializeWithCopy for MessageStreamAgentIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A614B6C(a1, a2, a3, MEMORY[0x263F60460]);
}

uint64_t assignWithCopy for MessageStreamAgentIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A614C04(a1, a2, a3, MEMORY[0x263F60460]);
}

uint64_t initializeWithTake for MessageStreamAgentIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A614C9C(a1, a2, a3, MEMORY[0x263F60460]);
}

uint64_t assignWithTake for MessageStreamAgentIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A614D34(a1, a2, a3, MEMORY[0x263F60460]);
}

uint64_t getEnumTagSinglePayload for MessageStreamAgentIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A613AAC);
}

uint64_t sub_25A613AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm_0(a1, a2, a3, MEMORY[0x263F60460]);
}

uint64_t storeEnumTagSinglePayload for MessageStreamAgentIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A613AD8);
}

uint64_t sub_25A613AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm_0(a1, a2, a3, a4, MEMORY[0x263F60460]);
}

uint64_t sub_25A613AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A614280(a1, a2, a3, MEMORY[0x263F60460]);
}

uint64_t dispatch thunk of MessageStreamAgentProtocol.init(initializationPayload:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of MessageStreamAgentProtocol.handleMessageStream(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of MessageStreamAgentProtocol.handleHotSwap()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t *initializeBufferWithCopyOfBuffer for MessageStreamRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v10 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
    uint64_t v20 = (char *)v4 + v10;
    unint64_t v11 = (char *)a2 + v10;
    uint64_t v12 = sub_25A6227C0();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v20, v11, v12);
    uint64_t v14 = *(int *)(a3 + 20);
    uint64_t v15 = (uint64_t *)((char *)v4 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
  }
  swift_retain();
  return v4;
}

uint64_t destroy for MessageStreamRequest(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  uint64_t v3 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  return swift_release();
}

void *initializeWithCopy for MessageStreamRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_25A6227C0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  swift_retain();
  return a1;
}

void *assignWithCopy for MessageStreamRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A6227C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *initializeWithTake for MessageStreamRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25A6227C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *assignWithTake for MessageStreamRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25A6227C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageStreamRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A6140CC);
}

uint64_t sub_25A6140CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MessageStreamAgentSpecification(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for MessageStreamRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A6141A0);
}

uint64_t sub_25A6141A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for MessageStreamAgentSpecification(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25A61425C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A614280(a1, a2, a3, type metadata accessor for MessageStreamAgentSpecification);
}

uint64_t sub_25A614280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for MessageStreamAgentSpecification(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a2 + v8;
    unint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v11 = sub_25A6227C0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t destroy for MessageStreamAgentSpecification(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_25A6227C0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for MessageStreamAgentSpecification(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = sub_25A6227C0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

void *assignWithCopy for MessageStreamAgentSpecification(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A6227C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for MessageStreamAgentSpecification(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_25A6227C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *assignWithTake for MessageStreamAgentSpecification(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_25A6227C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageStreamAgentSpecification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A61478C);
}

uint64_t sub_25A61478C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_25A6227C0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for MessageStreamAgentSpecification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A614850);
}

uint64_t sub_25A614850(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25A6227C0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25A6148F8()
{
  uint64_t result = sub_25A6227C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageStreamAgentSpecification.ID()
{
  return &type metadata for MessageStreamAgentSpecification.ID;
}

ValueMetadata *type metadata accessor for MessageStreamInstanceIdentifier()
{
  return &type metadata for MessageStreamInstanceIdentifier;
}

ValueMetadata *type metadata accessor for HostAgentSystem()
{
  return &type metadata for HostAgentSystem;
}

ValueMetadata *type metadata accessor for HostAgentSystem.HostEndpoint()
{
  return &type metadata for HostAgentSystem.HostEndpoint;
}

ValueMetadata *type metadata accessor for HostAgentSystem.AgentEndpoint()
{
  return &type metadata for HostAgentSystem.AgentEndpoint;
}

uint64_t *initializeBufferWithCopyOfBuffer for HostAgentSystem.AgentEndpoint.Identity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_25A614A04(a1, a2, a3, MEMORY[0x263F07508]);
}

uint64_t *sub_25A614A04(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t (*a4)(void))
{
  int v6 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    uint64_t v8 = a4(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    *(_DWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2)
{
  return sub_25A614AEC(a1, a2, MEMORY[0x263F07508]);
}

uint64_t sub_25A614AEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = a3(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);

  return v5(a1, v4);
}

uint64_t initializeWithCopy for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A614B6C(a1, a2, a3, MEMORY[0x263F07508]);
}

uint64_t sub_25A614B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A614C04(a1, a2, a3, MEMORY[0x263F07508]);
}

uint64_t sub_25A614C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 24))(a1, a2, v7);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A614C9C(a1, a2, a3, MEMORY[0x263F07508]);
}

uint64_t sub_25A614C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A614D34(a1, a2, a3, MEMORY[0x263F07508]);
}

uint64_t sub_25A614D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(a1, a2, v7);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A614DC8);
}

uint64_t sub_25A614DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm_0(a1, a2, a3, MEMORY[0x263F07508]);
}

uint64_t __swift_get_extra_inhabitant_indexTm_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);

  return v7(a1, a2, v6);
}

uint64_t storeEnumTagSinglePayload for HostAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A614E64);
}

uint64_t sub_25A614E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm_0(a1, a2, a3, a4, MEMORY[0x263F07508]);
}

uint64_t __swift_store_extra_inhabitant_indexTm_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v7 = a5(0);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);

  return v8(a1, a2, a2, v7);
}

uint64_t sub_25A614EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A614280(a1, a2, a3, MEMORY[0x263F07508]);
}

uint64_t initializeBufferWithCopyOfBuffer for HostAgentSystem.AgentEndpoint.StreamContext(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *(void *)a1 = *a2;
    a1 = v8 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    if (EnumCaseMultiPayload == 1)
    {
      *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
      *(void *)(a1 + 32) = a2[4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v9 = a2[3];
      *(void *)(a1 + 16) = a2[2];
      *(void *)(a1 + 24) = v9;
      uint64_t v10 = a2[5];
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = v10;
      uint64_t v11 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
      uint64_t v12 = a1 + v11;
      uint64_t v13 = (uint64_t)a2 + v11;
      uint64_t v14 = sub_25A6227C0();
      uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v15(v12, v13, v14);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for HostAgentSystem.AgentEndpoint.StreamContext(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_bridgeObjectRelease();
  if (EnumCaseMultiPayload == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = a1 + *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
    uint64_t v5 = sub_25A6227C0();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
}

uint64_t initializeWithCopy for HostAgentSystem.AgentEndpoint.StreamContext(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  if (EnumCaseMultiPayload == 1)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v6;
    uint64_t v7 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v7;
    uint64_t v8 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = a2 + v8;
    uint64_t v11 = sub_25A6227C0();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for HostAgentSystem.AgentEndpoint.StreamContext(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_25A6153C0((uint64_t)a1, type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    a1[4] = a2[4];
    if (EnumCaseMultiPayload == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      a1[5] = a2[5];
      uint64_t v5 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
      uint64_t v6 = (char *)a1 + v5;
      uint64_t v7 = (char *)a2 + v5;
      uint64_t v8 = sub_25A6227C0();
      uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v9(v6, v7, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25A6153C0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *initializeWithTake for HostAgentSystem.AgentEndpoint.StreamContext(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    long long v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    a1[2] = a2[2];
    uint64_t v7 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_25A6227C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for HostAgentSystem.AgentEndpoint.StreamContext(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25A6153C0((uint64_t)a1, type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      long long v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      a1[2] = a2[2];
      uint64_t v7 = *(int *)(type metadata accessor for MessageStreamAgentSpecification(0) + 28);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_25A6227C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_25A6155F4()
{
  uint64_t result = type metadata accessor for MessageStreamAgentSpecification(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext.Discriminant()
{
  return &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Discriminant;
}

unsigned char *storeEnumTagSinglePayload for HostAgentSystem.AgentEndpoint.StreamContext.Key(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x25A615764);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HostAgentSystem.AgentEndpoint.StreamContext.Key()
{
  return &type metadata for HostAgentSystem.AgentEndpoint.StreamContext.Key;
}

unsigned char *_s19PreviewsMessagingOS15HostAgentSystemO13AgentEndpointO13StreamContextO12DiscriminantOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A615868);
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

ValueMetadata *type metadata accessor for HostAgentSystem.AgentEndpoint.Identity.Key()
{
  return &type metadata for HostAgentSystem.AgentEndpoint.Identity.Key;
}

unsigned char *storeEnumTagSinglePayload for MessageStreamAgentSpecification.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A61596CLL);
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

ValueMetadata *type metadata accessor for MessageStreamAgentSpecification.Key()
{
  return &type metadata for MessageStreamAgentSpecification.Key;
}

unint64_t sub_25A6159A8()
{
  unint64_t result = qword_26A42C140;
  if (!qword_26A42C140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C140);
  }
  return result;
}

unint64_t sub_25A615A00()
{
  unint64_t result = qword_26A42C148;
  if (!qword_26A42C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C148);
  }
  return result;
}

unint64_t sub_25A615A58()
{
  unint64_t result = qword_26A42C150;
  if (!qword_26A42C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C150);
  }
  return result;
}

unint64_t sub_25A615AB0()
{
  unint64_t result = qword_26A42C158;
  if (!qword_26A42C158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C158);
  }
  return result;
}

unint64_t sub_25A615B04()
{
  unint64_t result = qword_26A42C160;
  if (!qword_26A42C160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C160);
  }
  return result;
}

uint64_t sub_25A615B58()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_25A615BA4()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

unint64_t sub_25A615BF0()
{
  unint64_t result = qword_26A42C168;
  if (!qword_26A42C168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C168);
  }
  return result;
}

uint64_t HostShellSystem.ShellEndpoint.StreamContext.contentIdentifier.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t HostShellSystem.ShellEndpoint.StreamContext.contentIdentifier.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*HostShellSystem.ShellEndpoint.StreamContext.contentIdentifier.modify())()
{
  return nullsub_1;
}

void HostShellSystem.ShellEndpoint.StreamContext.hostUpdateSeed.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

void *HostShellSystem.ShellEndpoint.StreamContext.hostUpdateSeed.setter(void *result)
{
  *(void *)(v1 + 16) = *result;
  return result;
}

uint64_t (*HostShellSystem.ShellEndpoint.StreamContext.hostUpdateSeed.modify())()
{
  return nullsub_1;
}

uint64_t HostShellSystem.ShellEndpoint.StreamContext.instanceIdentifier.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  *a1 = *(void *)(v1 + 24);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t HostShellSystem.ShellEndpoint.StreamContext.instanceIdentifier.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v3;
  return result;
}

uint64_t (*HostShellSystem.ShellEndpoint.StreamContext.instanceIdentifier.modify())()
{
  return nullsub_1;
}

void *HostShellSystem.ShellEndpoint.StreamContext.init(contentIdentifier:hostUpdateSeed:instanceIdentifier:)@<X0>(void *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = result[1];
  uint64_t v5 = *a2;
  uint64_t v6 = *a3;
  uint64_t v7 = a3[1];
  *a4 = *result;
  a4[1] = v4;
  a4[2] = v5;
  a4[3] = v6;
  a4[4] = v7;
  return result;
}

uint64_t sub_25A615D64(char a1)
{
  uint64_t result = 0xD000000000000011;
  if (a1)
  {
    if (a1 == 1) {
      return 0x6164705574736F68;
    }
    else {
      return 0xD000000000000012;
    }
  }
  return result;
}

uint64_t sub_25A615DCC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25A5EBFD8(*a1, *a2);
}

uint64_t sub_25A615DD8()
{
  return sub_25A61A7C8();
}

uint64_t sub_25A615DE0()
{
  return sub_25A54BBC0();
}

uint64_t sub_25A615DE8()
{
  return sub_25A61BF20();
}

uint64_t sub_25A615DF0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A61660C();
  *a1 = result;
  return result;
}

uint64_t sub_25A615E20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A615D64(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A615E4C()
{
  return sub_25A615D64(*v0);
}

uint64_t HostShellSystem.ShellEndpoint.StreamContext.propertyListValue.getter()
{
  return sub_25A622780();
}

uint64_t sub_25A615EA4()
{
  return sub_25A622A70();
}

uint64_t sub_25A615F6C()
{
  return sub_25A615EA4();
}

uint64_t HostShellSystem.ShellEndpoint.StreamContext.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v15 = &type metadata for HostShellSystem.ShellEndpoint.StreamContext.Key;
  unint64_t v5 = sub_25A61615C();
  unint64_t v16 = v5;
  v14[0] = 0;
  sub_25A57251C();
  sub_25A622710();
  if (v2)
  {
    uint64_t v6 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    uint64_t v8 = v17;
    uint64_t v7 = v18;
    uint64_t v15 = &type metadata for HostShellSystem.ShellEndpoint.StreamContext.Key;
    unint64_t v16 = v5;
    v14[0] = 1;
    sub_25A572474();
    sub_25A622710();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    uint64_t v15 = &type metadata for HostShellSystem.ShellEndpoint.StreamContext.Key;
    unint64_t v16 = v5;
    v14[0] = 2;
    sub_25A613620();
    sub_25A622710();
    uint64_t v10 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    *a2 = v8;
    a2[1] = v7;
    a2[2] = v13;
    a2[3] = v11;
    a2[4] = v12;
  }
  return result;
}

unint64_t sub_25A61615C()
{
  unint64_t result = qword_26A42C180;
  if (!qword_26A42C180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C180);
  }
  return result;
}

unint64_t sub_25A6161B4()
{
  unint64_t result = qword_26A42A540;
  if (!qword_26A42A540)
  {
    sub_25A622310();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42A540);
  }
  return result;
}

unint64_t sub_25A616210()
{
  unint64_t result = qword_26A42C188;
  if (!qword_26A42C188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C188);
  }
  return result;
}

uint64_t sub_25A616264()
{
  return sub_25A622780();
}

uint64_t sub_25A6162B4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return HostShellSystem.ShellEndpoint.StreamContext.init(propertyListValue:)(a1, a2);
}

unint64_t sub_25A6162D0()
{
  unint64_t result = qword_26A42C190;
  if (!qword_26A42C190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C190);
  }
  return result;
}

ValueMetadata *type metadata accessor for HostShellSystem()
{
  return &type metadata for HostShellSystem;
}

ValueMetadata *type metadata accessor for HostShellSystem.HostEndpoint()
{
  return &type metadata for HostShellSystem.HostEndpoint;
}

ValueMetadata *type metadata accessor for HostShellSystem.ShellEndpoint()
{
  return &type metadata for HostShellSystem.ShellEndpoint;
}

uint64_t destroy for HostShellSystem.ShellEndpoint.StreamContext()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HostShellSystem.ShellEndpoint.StreamContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HostShellSystem.ShellEndpoint.StreamContext(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HostShellSystem.ShellEndpoint.StreamContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for HostShellSystem.ShellEndpoint.StreamContext()
{
  return &type metadata for HostShellSystem.ShellEndpoint.StreamContext;
}

unsigned char *storeEnumTagSinglePayload for HostShellSystem.ShellEndpoint.StreamContext.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A61657CLL);
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

ValueMetadata *type metadata accessor for HostShellSystem.ShellEndpoint.StreamContext.Key()
{
  return &type metadata for HostShellSystem.ShellEndpoint.StreamContext.Key;
}

unint64_t sub_25A6165B8()
{
  unint64_t result = qword_26A42C198;
  if (!qword_26A42C198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C198);
  }
  return result;
}

uint64_t sub_25A61660C()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t SecurityScopedURLWrapper.init(url:readonly:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  id v6 = objc_allocWithZone(MEMORY[0x263F08B18]);
  uint64_t v7 = (void *)sub_25A622280();
  id v8 = objc_msgSend(v6, sel_initWithURL_readonly_, v7, a2 & 1);

  uint64_t v9 = sub_25A6222B0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  *a3 = v8;
  return result;
}

uint64_t SecurityScopedURLWrapper.init(playgroundsExecutePermissionsForURL:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id v4 = objc_allocWithZone(MEMORY[0x263F08B18]);
  uint64_t v5 = (void *)sub_25A622280();
  id v6 = (void *)sub_25A622DB0();
  id v7 = objc_msgSend(v4, sel_initWithURL_readonly_extensionClass_, v5, 1, v6);

  uint64_t v8 = sub_25A6222B0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
  *a2 = v7;
  return result;
}

uint64_t SecurityScopedURLWrapper.data.getter()
{
  v8[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = *v0;
  v8[0] = 0;
  id v2 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v1, 1, v8);
  id v3 = v8[0];
  if (v2)
  {
    uint64_t v4 = sub_25A6222D0();
  }
  else
  {
    uint64_t v5 = v3;
    id v6 = (void *)sub_25A622240();

    swift_willThrow();
    return 0;
  }
  return v4;
}

uint64_t SecurityScopedURLWrapper.propertyListValue.getter()
{
  return SecurityScopedURLWrapper.data.getter();
}

uint64_t SecurityScopedURLWrapper.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  sub_25A6169D8(0, &qword_26A42C1A0);
  sub_25A6169D8(0, &qword_26A42C1A8);
  uint64_t v7 = sub_25A623150();
  if (v3) {
    return sub_25A59C134(a1, a2);
  }
  uint64_t v9 = v7;
  if (!v7)
  {
    sub_25A616A14();
    swift_allocError();
    *uint64_t v10 = 0;
    v10[1] = 0;
    swift_willThrow();
    return sub_25A59C134(a1, a2);
  }
  uint64_t result = sub_25A59C134(a1, a2);
  *a3 = v9;
  return result;
}

uint64_t sub_25A6169D8(uint64_t a1, unint64_t *a2)
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

unint64_t sub_25A616A14()
{
  unint64_t result = qword_26A42C1B0;
  if (!qword_26A42C1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C1B0);
  }
  return result;
}

unint64_t SecurityScopedURLWrapper.description.getter()
{
  uint64_t v1 = sub_25A6221F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  unint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
  sub_25A623210();
  swift_bridgeObjectRelease();
  unint64_t v8 = 0xD000000000000019;
  unint64_t v9 = 0x800000025A6382C0;
  id v6 = objc_msgSend(v5, sel_description);
  sub_25A622DC0();

  sub_25A6221E0();
  sub_25A622DE0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_25A622E00();
  swift_bridgeObjectRelease();
  sub_25A622E00();
  return v8;
}

void SecurityScopedURLWrapper.url.getter()
{
  id v1 = objc_msgSend(*v0, sel_url);
  sub_25A622290();
}

uint64_t sub_25A616C54()
{
  return MEMORY[0x263F60428];
}

unint64_t sub_25A616C64()
{
  return 0xD00000000000002ELL;
}

uint64_t sub_25A616C80(uint64_t a1)
{
  unint64_t v2 = sub_25A616EF0();

  return MEMORY[0x270F55A28](a1, v2);
}

uint64_t sub_25A616CBC(uint64_t a1)
{
  unint64_t v2 = sub_25A616EF0();

  return MEMORY[0x270F55A08](a1, v2);
}

uint64_t sub_25A616CF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SecurityScopedURLWrapper.data.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25A616D34@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  sub_25A6169D8(0, &qword_26A42C1A0);
  sub_25A6169D8(0, &qword_26A42C1A8);
  uint64_t v6 = sub_25A623150();
  if (v2) {
    return sub_25A59C134(v4, v5);
  }
  uint64_t v8 = v6;
  if (!v6)
  {
    sub_25A616A14();
    swift_allocError();
    *unint64_t v9 = 0;
    v9[1] = 0;
    swift_willThrow();
    return sub_25A59C134(v4, v5);
  }
  uint64_t result = sub_25A59C134(v4, v5);
  *a2 = v8;
  return result;
}

ValueMetadata *type metadata accessor for SecurityScopedURLWrapper()
{
  return &type metadata for SecurityScopedURLWrapper;
}

ValueMetadata *type metadata accessor for SecurityScopedURLWrapper.UnarchiveFailedError()
{
  return &type metadata for SecurityScopedURLWrapper.UnarchiveFailedError;
}

unint64_t sub_25A616E44()
{
  unint64_t result = qword_26A42C1B8;
  if (!qword_26A42C1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C1B8);
  }
  return result;
}

unint64_t sub_25A616E9C()
{
  unint64_t result = qword_26A42C1C0;
  if (!qword_26A42C1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C1C0);
  }
  return result;
}

unint64_t sub_25A616EF0()
{
  unint64_t result = qword_26A42C1C8;
  if (!qword_26A42C1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C1C8);
  }
  return result;
}

uint64_t sub_25A616F44()
{
  return sub_25A6234A0();
}

uint64_t sub_25A616FCC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617038()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6170C0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61712C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6171AC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617218()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617294()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617348()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6173CC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617438()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6174A4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61753C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6175C4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617630()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6176DC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617748()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617858()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6178C4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61795C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6179CC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617A60()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617AF8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617B70()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617BF4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617C60()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617CC0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617D58()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617E54()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617EBC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617F4C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A617FB8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61804C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6180B8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618140()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6181B8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61824C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6182B8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61836C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6183D8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61846C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618574()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618600()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618684()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6186F0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618780()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6187EC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618874()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618904()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61898C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618A8C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618B28()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618BA8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618C14()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618D50()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618DE0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618E7C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618F10()
{
  return sub_25A6234A0();
}

uint64_t sub_25A618F9C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619018()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6190A0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6191C8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619254()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6192E8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61937C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619474()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61952C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61959C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619608()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619674()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6196E0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61974C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6197C8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6198C4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619A04()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619AEC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619B58()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619BE0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619C4C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619CB4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619D9C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619E9C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619F08()
{
  return sub_25A6234A0();
}

uint64_t sub_25A619FEC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A090()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A110()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A190()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A224()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A2D4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A360()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A3D8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A4D4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A5C4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A63C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A6B8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A7C8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A87C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A904()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61A998()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61AA28()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61AB38()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61ABA4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61AC1C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61ACA0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61AD08()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61AD8C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61AE84()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61AEF0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61AF58()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61AFEC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B07C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B108()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B174()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B1DC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B244()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B2AC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B338()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B41C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B4A0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B508()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B56C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B654()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B78C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B814()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B88C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61B91C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61BA14()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61BA9C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61BB1C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61BBA8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61BC10()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61BC78()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61BD28()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61BDA0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61BEAC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61BF20()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61BFD0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C054()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C1C8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C23C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C2F0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C358()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C454()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C4BC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C530()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C598()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C62C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C6BC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C740()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C7C0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C828()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61C964()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61CAA8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61CB38()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61CBC4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61CC2C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61CD38()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61CE30()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61CF3C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D060()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D140()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D1A8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D234()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D29C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D328()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D390()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D420()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D4A8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D510()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D60C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D69C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D700()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D768()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D7D0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D878()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D8E0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D964()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61D9F8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61DAA8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61DB40()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61DBC4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61DC54()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61DCBC()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61DD38()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61DDB4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61DE30()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61DE98()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61DF1C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E06C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E0F0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E1E4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E2E8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E370()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E3E4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E474()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E520()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E5C0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E650()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E6E8()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E7D4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E858()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E8D0()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E94C()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61E9B4()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61EA1C()
{
  return sub_25A6234A0();
}

void static MessageStreamInstanceIdentifier.previewRemoteEvents.getter(void *a1@<X8>)
{
  *a1 = 0xD00000000000001FLL;
  a1[1] = 0x800000025A638310;
}

uint64_t sub_25A61EA98(char *a1, char *a2)
{
  return sub_25A5E8F2C(*a1, *a2);
}

uint64_t sub_25A61EAA4()
{
  return sub_25A61A87C();
}

uint64_t sub_25A61EAAC()
{
  sub_25A622DF0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25A61EB20()
{
  return sub_25A61DB40();
}

uint64_t sub_25A61EB28@<X0>(char *a1@<X8>)
{
  return sub_25A56B748(a1);
}

void sub_25A61EB34(unint64_t *a1@<X8>)
{
  if (*v1) {
    unint64_t v2 = 0xD00000000000001DLL;
  }
  else {
    unint64_t v2 = 0xD000000000000011;
  }
  unint64_t v3 = 0x800000025A636120;
  if (*v1) {
    unint64_t v3 = 0x800000025A636140;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_25A61EB78(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A621FDC();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A61EBD4()
{
  return sub_25A622B20();
}

uint64_t sub_25A61EC3C(char a1)
{
  if (a1) {
    return 0x7065526873617263;
  }
  else {
    return 0x696D697263736964;
  }
}

uint64_t sub_25A61EC84(char *a1, char *a2)
{
  return sub_25A5E8E78(*a1, *a2);
}

uint64_t sub_25A61EC90()
{
  return sub_25A61A904();
}

uint64_t sub_25A61EC98()
{
  return sub_25A549FD0();
}

uint64_t sub_25A61ECA0()
{
  return sub_25A61DBC4();
}

uint64_t sub_25A61ECA8@<X0>(char *a1@<X8>)
{
  return sub_25A56B748(a1);
}

uint64_t sub_25A61ECB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A61EC3C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A61ECE0()
{
  return sub_25A61EC3C(*v0);
}

uint64_t RemoteEventRequestPayload.propertyListValue.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42C1D0);
  MEMORY[0x270FA5388](v1 - 8);
  unint64_t v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_25A622560();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for RemoteEventRequestPayload(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = &v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = v0;
  unint64_t v11 = sub_25A61F0B0();
  sub_25A61F104();
  sub_25A6227A0();
  sub_25A62097C(v0, (uint64_t)v10, type metadata accessor for RemoteEventRequestPayload);
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4);
  if (result != 1)
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v7, v10, v4);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v3, v7, v4);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    unint64_t v16 = &type metadata for RemoteEventRequestPayload.Key;
    unint64_t v17 = v11;
    v15[0] = 1;
    sub_25A61F158();
    sub_25A622700();
    sub_25A61F1B0((uint64_t)v3);
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  return result;
}

uint64_t type metadata accessor for RemoteEventRequestPayload(uint64_t a1)
{
  return sub_25A54FD94(a1, (uint64_t *)&unk_26A42C218);
}

uint64_t sub_25A61EF9C(unsigned char *a1, BOOL *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for RemoteEventRequestPayload(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_25A62097C(a3, (uint64_t)v8, type metadata accessor for RemoteEventRequestPayload);
  uint64_t v9 = sub_25A622560();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9);
  int v11 = result;
  if (result != 1) {
    uint64_t result = sub_25A622170((uint64_t)v8, type metadata accessor for RemoteEventRequestPayload);
  }
  *a2 = v11 != 1;
  return result;
}

uint64_t sub_25A61F0A8(unsigned char *a1, BOOL *a2)
{
  return sub_25A61EF9C(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_25A61F0B0()
{
  unint64_t result = qword_26A42C1D8;
  if (!qword_26A42C1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C1D8);
  }
  return result;
}

unint64_t sub_25A61F104()
{
  unint64_t result = qword_26A42C1E0;
  if (!qword_26A42C1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C1E0);
  }
  return result;
}

unint64_t sub_25A61F158()
{
  unint64_t result = qword_26A42A130;
  if (!qword_26A42A130)
  {
    sub_25A622560();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42A130);
  }
  return result;
}

uint64_t sub_25A61F1B0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42C1D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t RemoteEventRequestPayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for RemoteEventRequestPayload(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t v16 = &type metadata for RemoteEventRequestPayload.Key;
  unint64_t v8 = sub_25A61F0B0();
  unint64_t v17 = v8;
  v15[0] = 0;
  sub_25A61F104();
  sub_25A622710();
  if (v2)
  {
    uint64_t v9 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    if (v18)
    {
      unint64_t v16 = &type metadata for RemoteEventRequestPayload.Key;
      unint64_t v17 = v8;
      v15[0] = 1;
      uint64_t v11 = sub_25A622560();
      sub_25A61F158();
      sub_25A622710();
      uint64_t v12 = sub_25A6227C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 0, 1, v11);
      return sub_25A620A38((uint64_t)v7, a2, type metadata accessor for RemoteEventRequestPayload);
    }
    else
    {
      uint64_t v13 = sub_25A6227C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
      uint64_t v14 = sub_25A622560();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a2, 1, 1, v14);
    }
  }
}

uint64_t sub_25A61F484@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return RemoteEventRequestPayload.init(propertyListValue:)(a1, a2);
}

BOOL static RemoteEventPayload.DiagnosticsBehavior.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t RemoteEventPayload.DiagnosticsBehavior.hash(into:)()
{
  return sub_25A623460();
}

uint64_t RemoteEventPayload.DiagnosticsBehavior.hashValue.getter()
{
  return sub_25A6234A0();
}

uint64_t sub_25A61F51C()
{
  return sub_25A6227A0();
}

uint64_t RemoteEventPayload.DiagnosticsBehavior.propertyListValue.getter()
{
  return sub_25A6227A0();
}

uint64_t sub_25A61F600@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_25A6207BC(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t RemoteEventPayload.DiagnosticsBehavior.init(propertyListValue:)(uint64_t a1)
{
  return sub_25A6207BC(a1);
}

uint64_t sub_25A61F644(char a1)
{
  if (a1) {
    return 0xD000000000000017;
  }
  else {
    return 0x617243746E656761;
  }
}

uint64_t sub_25A61F688(char *a1, char *a2)
{
  return sub_25A5EA74C(*a1, *a2);
}

uint64_t sub_25A61F694()
{
  return sub_25A61A998();
}

uint64_t sub_25A61F69C()
{
  return sub_25A54ADBC();
}

uint64_t sub_25A61F6A4()
{
  return sub_25A61CB38();
}

uint64_t sub_25A61F6AC@<X0>(char *a1@<X8>)
{
  return sub_25A56B748(a1);
}

uint64_t sub_25A61F6B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A61F644(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A61F6E4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A622084();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A61F740()
{
  return sub_25A622B20();
}

unint64_t sub_25A61F7A8(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7065526873617263;
      break;
    case 2:
      unint64_t result = 6580592;
      break;
    case 3:
      unint64_t result = 0x686542746E656761;
      break;
    case 4:
      return result;
    default:
      unint64_t result = 0x696D697263736964;
      break;
  }
  return result;
}

uint64_t sub_25A61F870(unsigned __int8 *a1, char *a2)
{
  return sub_25A5EA4D4(*a1, *a2);
}

uint64_t sub_25A61F87C()
{
  return sub_25A61AA28();
}

uint64_t sub_25A61F884()
{
  return sub_25A54AC6C();
}

uint64_t sub_25A61F88C()
{
  return sub_25A61CC2C();
}

uint64_t sub_25A61F894@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A6220D8();
  *a1 = result;
  return result;
}

unint64_t sub_25A61F8C4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A61F7A8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25A61F8F0()
{
  return sub_25A61F7A8(*v0);
}

uint64_t RemoteEventPayload.propertyListValue.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A42C1D0);
  MEMORY[0x270FA5388](v1 - 8);
  unint64_t v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_25A622560();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for RemoteEventPayload(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v14[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = v0;
  unint64_t v11 = sub_25A6208D4();
  sub_25A620928();
  sub_25A6227A0();
  sub_25A62097C(v0, (uint64_t)v10, type metadata accessor for RemoteEventPayload);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v7, v10, v4);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v3, v7, v4);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    uint64_t v19 = &type metadata for RemoteEventPayload.Key;
    unint64_t v20 = v11;
    v18[0] = 1;
    sub_25A61F158();
    sub_25A622700();
    sub_25A61F1B0((uint64_t)v3);
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    int v12 = v10[4];
    int v16 = *(_DWORD *)v10;
    char v17 = 0;
    uint64_t v19 = &type metadata for RemoteEventPayload.Key;
    unint64_t v20 = v11;
    v18[0] = 2;
    sub_25A622700();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    LOBYTE(v16) = v12;
    uint64_t v19 = &type metadata for RemoteEventPayload.Key;
    unint64_t v20 = v11;
    v18[0] = 3;
    sub_25A6209E4();
    sub_25A622700();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    LOBYTE(v16) = v12 == 0;
    uint64_t v19 = &type metadata for RemoteEventPayload.Key;
    unint64_t v20 = v11;
    v18[0] = 4;
    sub_25A622700();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
}

uint64_t sub_25A61FC2C(unsigned char *a1, BOOL *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for RemoteEventPayload(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_25A62097C(a3, (uint64_t)v8, type metadata accessor for RemoteEventPayload);
  uint64_t result = swift_getEnumCaseMultiPayload();
  int v10 = result;
  if (result == 1) {
    uint64_t result = sub_25A622170((uint64_t)v8, type metadata accessor for RemoteEventPayload);
  }
  *a2 = v10 == 1;
  return result;
}

uint64_t RemoteEventPayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for RemoteEventPayload(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  int v10 = &v18[-v9];
  unint64_t v21 = &type metadata for RemoteEventPayload.Key;
  unint64_t v11 = sub_25A6208D4();
  unint64_t v22 = v11;
  v20[0] = 0;
  sub_25A620928();
  sub_25A622710();
  if (v2)
  {
    uint64_t v12 = sub_25A6227C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    if (v19)
    {
      unint64_t v21 = &type metadata for RemoteEventPayload.Key;
      unint64_t v22 = v11;
      v20[0] = 1;
      sub_25A622560();
      sub_25A61F158();
      sub_25A622710();
      uint64_t v14 = sub_25A6227C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      swift_storeEnumTagMultiPayload();
      uint64_t v15 = (uint64_t)v8;
    }
    else
    {
      unint64_t v21 = &type metadata for RemoteEventPayload.Key;
      unint64_t v22 = v11;
      v20[0] = 3;
      sub_25A6209E4();
      sub_25A622760();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      char v16 = v19;
      if (v19 == 3)
      {
        unint64_t v21 = &type metadata for RemoteEventPayload.Key;
        unint64_t v22 = v11;
        v20[0] = 4;
        sub_25A622710();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
        if ((_BYTE)v19) {
          char v16 = 0;
        }
        else {
          char v16 = 2;
        }
      }
      unint64_t v21 = &type metadata for RemoteEventPayload.Key;
      unint64_t v22 = v11;
      v20[0] = 2;
      sub_25A622710();
      uint64_t v17 = sub_25A6227C0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(a1, v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      *(_DWORD *)int v10 = v19;
      v10[4] = v16;
      swift_storeEnumTagMultiPayload();
      uint64_t v15 = (uint64_t)v10;
    }
    return sub_25A620A38(v15, a2, type metadata accessor for RemoteEventPayload);
  }
}

uint64_t sub_25A620054(char a1)
{
  return *(void *)&aWillprovcansym_1[8 * a1];
}

uint64_t sub_25A620078@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return RemoteEventPayload.init(propertyListValue:)(a1, a2);
}

uint64_t sub_25A620090(char *a1, char *a2)
{
  return sub_25A5EA6C4(*a1, *a2);
}

uint64_t sub_25A62009C()
{
  return sub_25A61AB38();
}

uint64_t sub_25A6200A4()
{
  return sub_25A54AD68();
}

uint64_t sub_25A6200AC()
{
  return sub_25A61CBC4();
}

uint64_t sub_25A6200B4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25A622124();
  *a1 = result;
  return result;
}

uint64_t sub_25A6200E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A620054(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25A620110(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A622030();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_25A62016C()
{
  return sub_25A622B20();
}

uint64_t sub_25A6201D4()
{
  return sub_25A620554();
}

uint64_t sub_25A62020C()
{
  return sub_25A620770();
}

uint64_t sub_25A620240@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25A6232B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25A620294@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25A620368();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_25A6202C0()
{
  unint64_t result = qword_26A42C1E8;
  if (!qword_26A42C1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C1E8);
  }
  return result;
}

unint64_t sub_25A620314()
{
  unint64_t result = qword_26A42C1F0;
  if (!qword_26A42C1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C1F0);
  }
  return result;
}

uint64_t sub_25A620368()
{
  return 0x696D697263736964;
}

uint64_t sub_25A620388()
{
  return sub_25A620554();
}

uint64_t sub_25A62039C()
{
  return sub_25A620554();
}

uint64_t sub_25A6203B4()
{
  return sub_25A620554();
}

uint64_t sub_25A6203C8()
{
  return sub_25A620554();
}

uint64_t sub_25A6203E8()
{
  return sub_25A620554();
}

uint64_t sub_25A620408()
{
  return sub_25A620554();
}

uint64_t sub_25A62042C()
{
  return sub_25A620554();
}

uint64_t sub_25A620448()
{
  return sub_25A620554();
}

uint64_t sub_25A62045C()
{
  return sub_25A620554();
}

uint64_t sub_25A620480()
{
  return sub_25A620554();
}

uint64_t sub_25A6204A4()
{
  return sub_25A620554();
}

uint64_t sub_25A6204C0()
{
  return sub_25A620554();
}

uint64_t sub_25A6204DC()
{
  return sub_25A620554();
}

uint64_t sub_25A6204FC()
{
  return sub_25A620554();
}

uint64_t sub_25A620514()
{
  return sub_25A620554();
}

uint64_t sub_25A620524()
{
  return sub_25A620554();
}

uint64_t sub_25A620548()
{
  return sub_25A620554();
}

uint64_t sub_25A620554()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6205A4()
{
  return sub_25A620770();
}

uint64_t sub_25A6205C0()
{
  return sub_25A620770();
}

uint64_t sub_25A6205D0()
{
  return sub_25A620770();
}

uint64_t sub_25A6205DC()
{
  return sub_25A620770();
}

uint64_t sub_25A6205F0()
{
  return sub_25A620770();
}

uint64_t sub_25A62060C()
{
  return sub_25A620770();
}

uint64_t sub_25A620628()
{
  return sub_25A620770();
}

uint64_t sub_25A620648()
{
  return sub_25A620770();
}

uint64_t sub_25A620668()
{
  return sub_25A620770();
}

uint64_t sub_25A620688()
{
  return sub_25A620770();
}

uint64_t sub_25A6206AC()
{
  return sub_25A620770();
}

uint64_t sub_25A6206D0()
{
  return sub_25A620770();
}

uint64_t sub_25A6206F4()
{
  return sub_25A620770();
}

uint64_t sub_25A620708()
{
  return sub_25A620770();
}

uint64_t sub_25A620720()
{
  return sub_25A620770();
}

uint64_t sub_25A620738()
{
  return sub_25A620770();
}

uint64_t sub_25A62074C()
{
  return sub_25A620770();
}

uint64_t sub_25A620770()
{
  return sub_25A6234A0();
}

uint64_t sub_25A6207BC(uint64_t a1)
{
  v5[3] = &type metadata for RemoteEventPayload.DiagnosticsBehavior.Key;
  v5[4] = sub_25A6202C0();
  sub_25A620314();
  sub_25A622710();
  uint64_t v3 = sub_25A6227C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  if (v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v6;
}

uint64_t type metadata accessor for RemoteEventPayload(uint64_t a1)
{
  return sub_25A54FD94(a1, (uint64_t *)&unk_26A42C228);
}

uint64_t sub_25A6208CC(unsigned char *a1, BOOL *a2)
{
  return sub_25A61FC2C(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_25A6208D4()
{
  unint64_t result = qword_26A42C1F8;
  if (!qword_26A42C1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C1F8);
  }
  return result;
}

unint64_t sub_25A620928()
{
  unint64_t result = qword_26A42C200;
  if (!qword_26A42C200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C200);
  }
  return result;
}

uint64_t sub_25A62097C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_25A6209E4()
{
  unint64_t result = qword_26A42C208;
  if (!qword_26A42C208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C208);
  }
  return result;
}

uint64_t sub_25A620A38(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_25A620AA4()
{
  unint64_t result = qword_26A42C210;
  if (!qword_26A42C210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C210);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RemoteEventRequestPayload(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_25A622560();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for RemoteEventRequestPayload(uint64_t a1)
{
  uint64_t v2 = sub_25A622560();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *initializeWithCopy for RemoteEventRequestPayload(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_25A622560();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithCopy for RemoteEventRequestPayload(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_25A622560();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *initializeWithTake for RemoteEventRequestPayload(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_25A622560();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithTake for RemoteEventRequestPayload(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_25A622560();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteEventRequestPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A621230);
}

uint64_t sub_25A621230(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A622560();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RemoteEventRequestPayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A6212B0);
}

uint64_t sub_25A6212B0(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_25A622560();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_25A621330(uint64_t a1)
{
  uint64_t v2 = sub_25A622560();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 1, v2);
}

uint64_t sub_25A621398(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A622560();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 1, v4);
}

uint64_t sub_25A621408()
{
  uint64_t result = sub_25A622560();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RemoteEventPayload(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25A622560();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t destroy for RemoteEventPayload(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_25A622560();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *initializeWithCopy for RemoteEventPayload(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25A622560();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for RemoteEventPayload(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25A622170((uint64_t)a1, type metadata accessor for RemoteEventPayload);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25A622560();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *initializeWithTake for RemoteEventPayload(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25A622560();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for RemoteEventPayload(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25A622170((uint64_t)a1, type metadata accessor for RemoteEventPayload);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25A622560();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_25A621920()
{
  uint64_t result = sub_25A622560();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteEventPayload.DiagnosticsBehavior()
{
  return &type metadata for RemoteEventPayload.DiagnosticsBehavior;
}

ValueMetadata *type metadata accessor for RemoteEventPayload.Discriminant()
{
  return &type metadata for RemoteEventPayload.Discriminant;
}

unsigned char *storeEnumTagSinglePayload for RemoteEventPayload.Key(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x25A621AA8);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteEventPayload.Key()
{
  return &type metadata for RemoteEventPayload.Key;
}

unsigned char *_s19PreviewsMessagingOS18RemoteEventPayloadO19DiagnosticsBehaviorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A621BACLL);
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

ValueMetadata *type metadata accessor for RemoteEventPayload.DiagnosticsBehavior.Discriminant()
{
  return &type metadata for RemoteEventPayload.DiagnosticsBehavior.Discriminant;
}

unsigned char *storeEnumTagSinglePayload for RemoteEventPayload.DiagnosticsBehavior.Key(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25A621C80);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteEventPayload.DiagnosticsBehavior.Key()
{
  return &type metadata for RemoteEventPayload.DiagnosticsBehavior.Key;
}

ValueMetadata *type metadata accessor for RemoteEventRequestPayload.Discriminant()
{
  return &type metadata for RemoteEventRequestPayload.Discriminant;
}

unsigned char *_s19PreviewsMessagingOS18RemoteEventPayloadO12DiscriminantOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25A621D94);
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

ValueMetadata *type metadata accessor for RemoteEventRequestPayload.Key()
{
  return &type metadata for RemoteEventRequestPayload.Key;
}

unint64_t sub_25A621DD0()
{
  unint64_t result = qword_26A42C238;
  if (!qword_26A42C238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C238);
  }
  return result;
}

unint64_t sub_25A621E28()
{
  unint64_t result = qword_26A42C240;
  if (!qword_26A42C240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C240);
  }
  return result;
}

unint64_t sub_25A621E80()
{
  unint64_t result = qword_26A42C248;
  if (!qword_26A42C248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C248);
  }
  return result;
}

unint64_t sub_25A621ED8()
{
  unint64_t result = qword_26A42C250;
  if (!qword_26A42C250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C250);
  }
  return result;
}

unint64_t sub_25A621F30()
{
  unint64_t result = qword_26A42C258;
  if (!qword_26A42C258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C258);
  }
  return result;
}

unint64_t sub_25A621F88()
{
  unint64_t result = qword_26A42C260;
  if (!qword_26A42C260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C260);
  }
  return result;
}

unint64_t sub_25A621FDC()
{
  unint64_t result = qword_26A42C268;
  if (!qword_26A42C268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C268);
  }
  return result;
}

unint64_t sub_25A622030()
{
  unint64_t result = qword_26A42C270;
  if (!qword_26A42C270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C270);
  }
  return result;
}

unint64_t sub_25A622084()
{
  unint64_t result = qword_26A42C278;
  if (!qword_26A42C278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A42C278);
  }
  return result;
}

uint64_t sub_25A6220D8()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_25A622124()
{
  unint64_t v0 = sub_25A6232B0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_25A622170(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25A6221E0()
{
  return MEMORY[0x270EEE218]();
}

uint64_t sub_25A6221F0()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25A622200()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25A622210()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25A622220()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25A622230()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25A622240()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25A622250()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_25A622260()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25A622270()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_25A622280()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25A622290()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25A6222A0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_25A6222B0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25A6222C0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25A6222D0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25A6222E0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25A6222F0()
{
  return MEMORY[0x270F555E0]();
}

uint64_t sub_25A622300()
{
  return MEMORY[0x270F555E8]();
}

uint64_t sub_25A622310()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25A622320()
{
  return MEMORY[0x270F56D88]();
}

uint64_t sub_25A622330()
{
  return MEMORY[0x270F56D90]();
}

uint64_t sub_25A622340()
{
  return MEMORY[0x270F56D98]();
}

uint64_t sub_25A622350()
{
  return MEMORY[0x270F56DA0]();
}

uint64_t sub_25A622360()
{
  return MEMORY[0x270F56DA8]();
}

uint64_t sub_25A622370()
{
  return MEMORY[0x270F56DB0]();
}

uint64_t sub_25A622380()
{
  return MEMORY[0x270F55618]();
}

uint64_t sub_25A622390()
{
  return MEMORY[0x270F55620]();
}

uint64_t sub_25A6223A0()
{
  return MEMORY[0x270F55628]();
}

uint64_t sub_25A6223B0()
{
  return MEMORY[0x270F55638]();
}

uint64_t sub_25A6223C0()
{
  return MEMORY[0x270F55640]();
}

uint64_t sub_25A6223D0()
{
  return MEMORY[0x270F55648]();
}

uint64_t sub_25A6223E0()
{
  return MEMORY[0x270F55650]();
}

uint64_t sub_25A6223F0()
{
  return MEMORY[0x270F55658]();
}

uint64_t sub_25A622400()
{
  return MEMORY[0x270F55660]();
}

uint64_t sub_25A622410()
{
  return MEMORY[0x270F55668]();
}

uint64_t sub_25A622420()
{
  return MEMORY[0x270F55670]();
}

uint64_t sub_25A622430()
{
  return MEMORY[0x270F55678]();
}

uint64_t sub_25A622440()
{
  return MEMORY[0x270F55680]();
}

uint64_t sub_25A622450()
{
  return MEMORY[0x270F55688]();
}

uint64_t sub_25A622460()
{
  return MEMORY[0x270F55690]();
}

uint64_t sub_25A622470()
{
  return MEMORY[0x270F55698]();
}

uint64_t sub_25A622480()
{
  return MEMORY[0x270F556A0]();
}

uint64_t sub_25A622490()
{
  return MEMORY[0x270F556A8]();
}

uint64_t sub_25A6224A0()
{
  return MEMORY[0x270F556B0]();
}

uint64_t sub_25A6224B0()
{
  return MEMORY[0x270F556B8]();
}

uint64_t sub_25A6224C0()
{
  return MEMORY[0x270F556C0]();
}

uint64_t sub_25A6224D0()
{
  return MEMORY[0x270F556C8]();
}

uint64_t sub_25A6224E0()
{
  return MEMORY[0x270F556D0]();
}

uint64_t sub_25A6224F0()
{
  return MEMORY[0x270F556D8]();
}

uint64_t sub_25A622500()
{
  return MEMORY[0x270F556E0]();
}

uint64_t sub_25A622510()
{
  return MEMORY[0x270F556E8]();
}

uint64_t sub_25A622520()
{
  return MEMORY[0x270F556F0]();
}

uint64_t sub_25A622530()
{
  return MEMORY[0x270F556F8]();
}

uint64_t sub_25A622540()
{
  return MEMORY[0x270F55700]();
}

uint64_t sub_25A622550()
{
  return MEMORY[0x270F55708]();
}

uint64_t sub_25A622560()
{
  return MEMORY[0x270F55710]();
}

uint64_t sub_25A622570()
{
  return MEMORY[0x270F55748]();
}

uint64_t sub_25A622580()
{
  return MEMORY[0x270F55750]();
}

uint64_t sub_25A622590()
{
  return MEMORY[0x270F55758]();
}

uint64_t sub_25A6225A0()
{
  return MEMORY[0x270F55760]();
}

uint64_t sub_25A6225B0()
{
  return MEMORY[0x270F55768]();
}

uint64_t sub_25A6225C0()
{
  return MEMORY[0x270F55770]();
}

uint64_t sub_25A6225D0()
{
  return MEMORY[0x270F55778]();
}

uint64_t sub_25A6225E0()
{
  return MEMORY[0x270F55780]();
}

uint64_t sub_25A6225F0()
{
  return MEMORY[0x270F55788]();
}

uint64_t sub_25A622600()
{
  return MEMORY[0x270F55790]();
}

uint64_t sub_25A622610()
{
  return MEMORY[0x270F55798]();
}

uint64_t sub_25A622630()
{
  return MEMORY[0x270F557A8]();
}

uint64_t sub_25A622640()
{
  return MEMORY[0x270F557B8]();
}

uint64_t sub_25A622650()
{
  return MEMORY[0x270F557C0]();
}

uint64_t sub_25A622660()
{
  return MEMORY[0x270F557C8]();
}

uint64_t sub_25A622670()
{
  return MEMORY[0x270F557D0]();
}

uint64_t sub_25A622680()
{
  return MEMORY[0x270F557D8]();
}

uint64_t sub_25A622690()
{
  return MEMORY[0x270F557E0]();
}

uint64_t sub_25A6226A0()
{
  return MEMORY[0x270F557E8]();
}

uint64_t sub_25A6226B0()
{
  return MEMORY[0x270F557F0]();
}

uint64_t sub_25A6226C0()
{
  return MEMORY[0x270F557F8]();
}

uint64_t sub_25A6226D0()
{
  return MEMORY[0x270F55800]();
}

uint64_t sub_25A6226F0()
{
  return MEMORY[0x270F55818]();
}

uint64_t sub_25A622700()
{
  return MEMORY[0x270F55820]();
}

uint64_t sub_25A622710()
{
  return MEMORY[0x270F55828]();
}

uint64_t sub_25A622720()
{
  return MEMORY[0x270F55830]();
}

uint64_t sub_25A622730()
{
  return MEMORY[0x270F55838]();
}

uint64_t sub_25A622740()
{
  return MEMORY[0x270F55840]();
}

uint64_t sub_25A622750()
{
  return MEMORY[0x270F55848]();
}

uint64_t sub_25A622760()
{
  return MEMORY[0x270F55850]();
}

uint64_t _s19PreviewsMessagingOS24CanvasControlDescriptionV9ModifiersV17propertyListValue0a10FoundationC008PropertyI0Vvg_0()
{
  return MEMORY[0x270F55858]();
}

uint64_t sub_25A622780()
{
  return MEMORY[0x270F55860]();
}

uint64_t sub_25A622790()
{
  return MEMORY[0x270F55868]();
}

uint64_t sub_25A6227A0()
{
  return MEMORY[0x270F55870]();
}

uint64_t sub_25A6227B0()
{
  return MEMORY[0x270F55878]();
}

uint64_t sub_25A6227C0()
{
  return MEMORY[0x270F55880]();
}

uint64_t sub_25A6227D0()
{
  return MEMORY[0x270F558D8]();
}

uint64_t sub_25A6227E0()
{
  return MEMORY[0x270F558E0]();
}

uint64_t sub_25A6227F0()
{
  return MEMORY[0x270F558F0]();
}

uint64_t sub_25A622800()
{
  return MEMORY[0x270F558F8]();
}

uint64_t sub_25A622810()
{
  return MEMORY[0x270F55900]();
}

uint64_t sub_25A622820()
{
  return MEMORY[0x270F55908]();
}

uint64_t sub_25A622830()
{
  return MEMORY[0x270F55910]();
}

uint64_t sub_25A622840()
{
  return MEMORY[0x270F55918]();
}

uint64_t sub_25A622850()
{
  return MEMORY[0x270F55920]();
}

uint64_t sub_25A622860()
{
  return MEMORY[0x270F55930]();
}

uint64_t sub_25A622870()
{
  return MEMORY[0x270F55950]();
}

uint64_t sub_25A622880()
{
  return MEMORY[0x270F55958]();
}

uint64_t sub_25A622890()
{
  return MEMORY[0x270F55960]();
}

uint64_t sub_25A6228A0()
{
  return MEMORY[0x270F55968]();
}

uint64_t sub_25A6228C0()
{
  return MEMORY[0x270F55978]();
}

uint64_t sub_25A6228D0()
{
  return MEMORY[0x270F559C8]();
}

uint64_t sub_25A6228E0()
{
  return MEMORY[0x270F559D0]();
}

uint64_t sub_25A6228F0()
{
  return MEMORY[0x270F559E0]();
}

uint64_t sub_25A622900()
{
  return MEMORY[0x270F559F8]();
}

uint64_t sub_25A622910()
{
  return MEMORY[0x270F55A00]();
}

uint64_t sub_25A622930()
{
  return MEMORY[0x270F55A10]();
}

uint64_t sub_25A622940()
{
  return MEMORY[0x270F55A18]();
}

uint64_t sub_25A622960()
{
  return MEMORY[0x270F55A30]();
}

uint64_t sub_25A622970()
{
  return MEMORY[0x270F55A38]();
}

uint64_t sub_25A622980()
{
  return MEMORY[0x270F55A40]();
}

uint64_t sub_25A622990()
{
  return MEMORY[0x270F55A48]();
}

uint64_t sub_25A6229A0()
{
  return MEMORY[0x270F55A50]();
}

uint64_t sub_25A6229B0()
{
  return MEMORY[0x270F55A58]();
}

uint64_t sub_25A6229C0()
{
  return MEMORY[0x270F55A60]();
}

uint64_t sub_25A6229D0()
{
  return MEMORY[0x270F55A68]();
}

uint64_t sub_25A6229E0()
{
  return MEMORY[0x270F55A98]();
}

uint64_t sub_25A6229F0()
{
  return MEMORY[0x270F55AA0]();
}

uint64_t sub_25A622A00()
{
  return MEMORY[0x270F55AD0]();
}

uint64_t sub_25A622A10()
{
  return MEMORY[0x270F55AD8]();
}

uint64_t sub_25A622A20()
{
  return MEMORY[0x270F55AE0]();
}

uint64_t sub_25A622A30()
{
  return MEMORY[0x270F55AE8]();
}

uint64_t sub_25A622A40()
{
  return MEMORY[0x270F55AF0]();
}

uint64_t sub_25A622A50()
{
  return MEMORY[0x270F55AF8]();
}

uint64_t sub_25A622A60()
{
  return MEMORY[0x270F55B00]();
}

uint64_t sub_25A622A70()
{
  return MEMORY[0x270F55B08]();
}

uint64_t sub_25A622A80()
{
  return MEMORY[0x270F55B10]();
}

uint64_t sub_25A622AA0()
{
  return MEMORY[0x270F55B88]();
}

uint64_t sub_25A622AB0()
{
  return MEMORY[0x270F55B90]();
}

uint64_t sub_25A622AC0()
{
  return MEMORY[0x270F55B98]();
}

uint64_t sub_25A622AE0()
{
  return MEMORY[0x270F55BE0]();
}

uint64_t sub_25A622AF0()
{
  return MEMORY[0x270F55C48]();
}

uint64_t sub_25A622B00()
{
  return MEMORY[0x270F55C50]();
}

uint64_t sub_25A622B20()
{
  return MEMORY[0x270F55C70]();
}

uint64_t sub_25A622B30()
{
  return MEMORY[0x270F55C90]();
}

uint64_t sub_25A622B40()
{
  return MEMORY[0x270F55C98]();
}

uint64_t sub_25A622B50()
{
  return MEMORY[0x270F55CA0]();
}

uint64_t sub_25A622B60()
{
  return MEMORY[0x270F55CB0]();
}

uint64_t sub_25A622B70()
{
  return MEMORY[0x270F55CB8]();
}

uint64_t sub_25A622B80()
{
  return MEMORY[0x270F55CC8]();
}

uint64_t sub_25A622B90()
{
  return MEMORY[0x270F55CD0]();
}

uint64_t sub_25A622BA0()
{
  return MEMORY[0x270F55CD8]();
}

uint64_t sub_25A622BB0()
{
  return MEMORY[0x270F55CF0]();
}

uint64_t sub_25A622BC0()
{
  return MEMORY[0x270F55D20]();
}

uint64_t sub_25A622BD0()
{
  return MEMORY[0x270F55D78]();
}

uint64_t sub_25A622BE0()
{
  return MEMORY[0x270F55DA0]();
}

uint64_t sub_25A622BF0()
{
  return MEMORY[0x270F55DB8]();
}

uint64_t sub_25A622C00()
{
  return MEMORY[0x270F55DD0]();
}

uint64_t sub_25A622C10()
{
  return MEMORY[0x270F55E30]();
}

uint64_t sub_25A622C20()
{
  return MEMORY[0x270F55E38]();
}

uint64_t sub_25A622C30()
{
  return MEMORY[0x270F55E50]();
}

uint64_t sub_25A622C40()
{
  return MEMORY[0x270F55E58]();
}

uint64_t sub_25A622C50()
{
  return MEMORY[0x270F55E60]();
}

uint64_t sub_25A622C60()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25A622C70()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25A622C80()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25A622C90()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25A622CA0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25A622CB0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25A622CC0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25A622CD0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_25A622CE0()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_25A622CF0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25A622D00()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25A622D10()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25A622D20()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25A622D30()
{
  return MEMORY[0x270F9D150]();
}

uint64_t sub_25A622D40()
{
  return MEMORY[0x270F9D1C8]();
}

uint64_t sub_25A622D50()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_25A622D60()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_25A622D70()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_25A622D80()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25A622D90()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25A622DA0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25A622DB0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25A622DC0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25A622DD0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25A622DE0()
{
  return MEMORY[0x270F55E78]();
}

uint64_t sub_25A622DF0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25A622E00()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25A622E10()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25A622E20()
{
  return MEMORY[0x270F9D910]();
}

uint64_t sub_25A622E30()
{
  return MEMORY[0x270F9D988]();
}

uint64_t sub_25A622E40()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_25A622E80()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_25A622E90()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_25A622EA0()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t sub_25A622EB0()
{
  return MEMORY[0x270F55E88]();
}

uint64_t sub_25A622EC0()
{
  return MEMORY[0x270F55E90]();
}

uint64_t sub_25A622ED0()
{
  return MEMORY[0x270F55E98]();
}

uint64_t sub_25A622EE0()
{
  return MEMORY[0x270F55EA0]();
}

uint64_t sub_25A622EF0()
{
  return MEMORY[0x270F55EA8]();
}

uint64_t sub_25A622F00()
{
  return MEMORY[0x270F55EB0]();
}

uint64_t sub_25A622F10()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25A622F20()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25A622F30()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_25A622F40()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_25A622F50()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_25A622F60()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25A622F70()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25A622F80()
{
  return MEMORY[0x270F55EC0]();
}

uint64_t sub_25A622F90()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_25A622FA0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25A622FB0()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_25A622FC0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25A622FD0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25A622FE0()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_25A622FF0()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t sub_25A623000()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t sub_25A623010()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_25A623020()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_25A623030()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_25A623040()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_25A623050()
{
  return MEMORY[0x270F55EC8]();
}

uint64_t sub_25A623070()
{
  return MEMORY[0x270FA1F78]();
}

uint64_t sub_25A623080()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_25A623090()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_25A6230A0()
{
  return MEMORY[0x270F55EF8]();
}

uint64_t sub_25A6230B0()
{
  return MEMORY[0x270F55F08]();
}

uint64_t sub_25A6230E0()
{
  return MEMORY[0x270FA1FC0]();
}

uint64_t sub_25A6230F0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25A623100()
{
  return MEMORY[0x270F55F10]();
}

uint64_t sub_25A623110()
{
  return MEMORY[0x270F55F28]();
}

uint64_t sub_25A623120()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25A623130()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25A623140()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25A623150()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_25A623160()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_25A623170()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25A623180()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25A623190()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25A6231A0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25A6231B0()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_25A6231C0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25A6231D0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25A6231E0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25A6231F0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25A623200()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25A623210()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25A623220()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25A623230()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_25A623240()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25A623250()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25A623260()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25A623270()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25A623280()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25A623290()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25A6232A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25A6232B0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25A6232C0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25A6232D0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25A6232E0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25A6232F0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25A623300()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25A623310()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25A623320()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25A623330()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25A623340()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25A623350()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25A623360()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_25A623370()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_25A623380()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_25A623390()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_25A6233A0()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_25A6233B0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25A6233C0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25A6233F0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25A623400()
{
  return MEMORY[0x270F55F50]();
}

uint64_t sub_25A623410()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25A623420()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25A623430()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25A623440()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25A623450()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25A623460()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25A623470()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25A623480()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_25A623490()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25A6234A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25A6234B0()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_25A6234C0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25A6234D0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25A623500()
{
  return MEMORY[0x270FA0128]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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