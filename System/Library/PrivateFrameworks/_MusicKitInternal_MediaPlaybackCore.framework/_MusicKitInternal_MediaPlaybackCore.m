uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
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

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void sub_23D4B80FC(uint64_t a1@<X8>)
{
  sub_23D4B8130();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_23D4B8138@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

void type metadata accessor for MPCPlaybackIntentRepeatMode(uint64_t a1)
{
}

void type metadata accessor for MPCPlaybackIntentShuffleMode(uint64_t a1)
{
}

void sub_23D4B8190(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t MPCPlaybackEngine.state<A>(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D4CED00();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  sub_23D4CEA40();
  memset(v8, 0, sizeof(v8));
  uint64_t v9 = 0;
  sub_23D4CEA30();
  return sub_23D4CED10();
}

uint64_t MusicPlayerPath.init(_:)@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF501F0);
  MEMORY[0x270FA5388]();
  char v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D4CE8D0();
  uint64_t v4 = sub_23D4CE8E0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4))
  {
    sub_23D4B83D4((uint64_t)v3);
    uint64_t v5 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, v3, v4);
    uint64_t v5 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a1, v5, 1, v4);
}

uint64_t sub_23D4B83D4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF501F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t MusicRoute.init(_:)@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B028);
  MEMORY[0x270FA5388]();
  char v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D4CE9F0();
  uint64_t v4 = sub_23D4CEA00();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4))
  {
    sub_23D4B8530((uint64_t)v3);
    uint64_t v5 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, v3, v4);
    uint64_t v5 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a1, v5, 1, v4);
}

uint64_t sub_23D4B8530(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B028);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void destroy for MusicPlaybackIntentDonationDescriptor(uint64_t a1)
{
  uint64_t v1 = a1;
  switch(*(unsigned char *)(a1 + 80))
  {
    case 0:
      uint64_t v2 = *(void **)a1;

      break;
    case 1:
      swift_bridgeObjectRelease();
      if (*(void *)(v1 + 32))
      {
        a1 = v1 + 8;
        goto LABEL_10;
      }
      break;
    case 2:
      __swift_destroy_boxed_opaque_existential_1(a1);
      if (*(void *)(v1 + 64))
      {
        a1 = v1 + 40;
        goto LABEL_10;
      }
      break;
    case 3:
LABEL_10:
      __swift_destroy_boxed_opaque_existential_1(a1);
      break;
    default:
      return;
  }
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

uint64_t initializeWithCopy for MusicPlaybackIntentDonationDescriptor(uint64_t a1, uint64_t a2)
{
  switch(*(unsigned char *)(a2 + 80))
  {
    case 1:
      *(void *)a1 = *(void *)a2;
      v6 = (_OWORD *)(a2 + 8);
      uint64_t v7 = *(void *)(a2 + 32);
      swift_bridgeObjectRetain();
      if (v7)
      {
        uint64_t v8 = *(void *)(a2 + 40);
        *(void *)(a1 + 32) = v7;
        *(void *)(a1 + 40) = v8;
        (**(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8))(a1 + 8, a2 + 8, v7);
      }
      else
      {
        long long v16 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 8) = *v6;
        *(_OWORD *)(a1 + 24) = v16;
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
      }
      char v15 = 1;
      goto LABEL_12;
    case 2:
      long long v9 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v9;
      (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1, a2);
      v10 = (_OWORD *)(a1 + 40);
      v11 = (_OWORD *)(a2 + 40);
      uint64_t v12 = *(void *)(a2 + 64);
      if (v12)
      {
        uint64_t v13 = *(void *)(a2 + 72);
        *(void *)(a1 + 64) = v12;
        *(void *)(a1 + 72) = v13;
        (**(void (***)(_OWORD *, _OWORD *))(v12 - 8))(v10, v11);
      }
      else
      {
        long long v17 = *(_OWORD *)(a2 + 56);
        _OWORD *v10 = *v11;
        *(_OWORD *)(a1 + 56) = v17;
        *(void *)(a1 + 72) = *(void *)(a2 + 72);
      }
      char v15 = 2;
      goto LABEL_12;
    case 3:
      long long v14 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v14;
      (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1, a2);
      char v15 = 3;
LABEL_12:
      *(unsigned char *)(a1 + 80) = v15;
      break;
    default:
      uint64_t v4 = *(void **)a2;
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 80) = 0;
      id v5 = v4;
      break;
  }
  return a1;
}

uint64_t assignWithCopy for MusicPlaybackIntentDonationDescriptor(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_23D4B8A6C(a1);
    switch(*(unsigned char *)(a2 + 80))
    {
      case 1:
        *(void *)a1 = *(void *)a2;
        uint64_t v6 = *(void *)(a2 + 32);
        swift_bridgeObjectRetain();
        if (v6)
        {
          *(void *)(a1 + 32) = v6;
          *(void *)(a1 + 40) = *(void *)(a2 + 40);
          (**(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8))(a1 + 8, a2 + 8, v6);
        }
        else
        {
          long long v15 = *(_OWORD *)(a2 + 8);
          long long v16 = *(_OWORD *)(a2 + 24);
          *(void *)(a1 + 40) = *(void *)(a2 + 40);
          *(_OWORD *)(a1 + 8) = v15;
          *(_OWORD *)(a1 + 24) = v16;
        }
        char v12 = 1;
        goto LABEL_13;
      case 2:
        uint64_t v7 = *(void *)(a2 + 24);
        *(void *)(a1 + 24) = v7;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
        uint64_t v8 = (_OWORD *)(a1 + 40);
        long long v9 = (long long *)(a2 + 40);
        uint64_t v10 = *(void *)(a2 + 64);
        if (v10)
        {
          *(void *)(a1 + 64) = v10;
          *(void *)(a1 + 72) = *(void *)(a2 + 72);
          (**(void (***)(_OWORD *, long long *))(v10 - 8))(v8, v9);
        }
        else
        {
          long long v13 = *v9;
          long long v14 = *(_OWORD *)(a2 + 56);
          *(void *)(a1 + 72) = *(void *)(a2 + 72);
          *uint64_t v8 = v13;
          *(_OWORD *)(a1 + 56) = v14;
        }
        char v12 = 2;
        goto LABEL_13;
      case 3:
        uint64_t v11 = *(void *)(a2 + 24);
        *(void *)(a1 + 24) = v11;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1, a2);
        char v12 = 3;
LABEL_13:
        *(unsigned char *)(a1 + 80) = v12;
        break;
      default:
        uint64_t v4 = *(void **)a2;
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 80) = 0;
        id v5 = v4;
        break;
    }
  }
  return a1;
}

uint64_t sub_23D4B8A6C(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy81_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x51uLL);
}

void *assignWithTake for MusicPlaybackIntentDonationDescriptor(void *a1, const void *a2)
{
  if (a1 != a2)
  {
    sub_23D4B8A6C((uint64_t)a1);
    memcpy(a1, a2, 0x51uLL);
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicPlaybackIntentDonationDescriptor(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 81))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
      if (v3 <= 3) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicPlaybackIntentDonationDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)uint64_t result = a2 - 253;
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

ValueMetadata *type metadata accessor for MusicPlaybackIntentDonationDescriptor()
{
  return &type metadata for MusicPlaybackIntentDonationDescriptor;
}

uint64_t initializeBufferWithCopyOfBuffer for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t a1)
{
  uint64_t v1 = a1;
  unsigned int v2 = *(unsigned __int8 *)(a1 + 80);
  if (v2 >= 4) {
    unsigned int v2 = *(_DWORD *)a1 + 4;
  }
  switch(v2)
  {
    case 1u:
      swift_bridgeObjectRelease();
      if (*(void *)(v1 + 32))
      {
        a1 = v1 + 8;
        goto LABEL_11;
      }
      break;
    case 2u:
      __swift_destroy_boxed_opaque_existential_1(a1);
      if (*(void *)(v1 + 64))
      {
        a1 = v1 + 40;
        goto LABEL_11;
      }
      break;
    case 3u:
LABEL_11:
      __swift_destroy_boxed_opaque_existential_1(a1);
      break;
    default:
      uint64_t v3 = *(void **)a1;

      break;
  }
}

uint64_t initializeWithCopy for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 80);
  if (v4 >= 4) {
    unsigned int v4 = *(_DWORD *)a2 + 4;
  }
  switch(v4)
  {
    case 1u:
      *(void *)a1 = *(void *)a2;
      uint64_t v7 = (_OWORD *)(a1 + 8);
      uint64_t v8 = (_OWORD *)(a2 + 8);
      uint64_t v9 = *(void *)(a2 + 32);
      swift_bridgeObjectRetain();
      if (v9)
      {
        uint64_t v10 = *(void *)(a2 + 40);
        *(void *)(a1 + 32) = v9;
        *(void *)(a1 + 40) = v10;
        (**(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8))(a1 + 8, a2 + 8, v9);
      }
      else
      {
        long long v18 = *(_OWORD *)(a2 + 24);
        *uint64_t v7 = *v8;
        *(_OWORD *)(a1 + 24) = v18;
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
      }
      char v17 = 1;
      goto LABEL_14;
    case 2u:
      long long v11 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v11;
      (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1, a2);
      char v12 = (_OWORD *)(a1 + 40);
      long long v13 = (_OWORD *)(a2 + 40);
      uint64_t v14 = *(void *)(a2 + 64);
      if (v14)
      {
        uint64_t v15 = *(void *)(a2 + 72);
        *(void *)(a1 + 64) = v14;
        *(void *)(a1 + 72) = v15;
        (**(void (***)(_OWORD *, _OWORD *))(v14 - 8))(v12, v13);
      }
      else
      {
        long long v19 = *(_OWORD *)(a2 + 56);
        *char v12 = *v13;
        *(_OWORD *)(a1 + 56) = v19;
        *(void *)(a1 + 72) = *(void *)(a2 + 72);
      }
      char v17 = 2;
      goto LABEL_14;
    case 3u:
      long long v16 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v16;
      (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1, a2);
      char v17 = 3;
LABEL_14:
      *(unsigned char *)(a1 + 80) = v17;
      break;
    default:
      id v5 = *(void **)a2;
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 80) = 0;
      id v6 = v5;
      break;
  }
  return a1;
}

uint64_t assignWithCopy for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 80);
    if (v4 >= 4) {
      unsigned int v4 = *(_DWORD *)a1 + 4;
    }
    switch(v4)
    {
      case 1u:
        swift_bridgeObjectRelease();
        if (*(void *)(v2 + 32))
        {
          a1 = v2 + 8;
          goto LABEL_10;
        }
        break;
      case 2u:
        __swift_destroy_boxed_opaque_existential_1(a1);
        if (*(void *)(v2 + 64))
        {
          a1 = v2 + 40;
          goto LABEL_10;
        }
        break;
      case 3u:
LABEL_10:
        __swift_destroy_boxed_opaque_existential_1(a1);
        break;
      default:

        break;
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 80);
    if (v5 >= 4) {
      unsigned int v5 = *(_DWORD *)a2 + 4;
    }
    switch(v5)
    {
      case 1u:
        *(void *)uint64_t v2 = *(void *)a2;
        uint64_t v8 = *(void *)(a2 + 32);
        swift_bridgeObjectRetain();
        if (v8)
        {
          *(void *)(v2 + 32) = v8;
          *(void *)(v2 + 40) = *(void *)(a2 + 40);
          (**(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8))(v2 + 8, a2 + 8, v8);
        }
        else
        {
          long long v17 = *(_OWORD *)(a2 + 8);
          long long v18 = *(_OWORD *)(a2 + 24);
          *(void *)(v2 + 40) = *(void *)(a2 + 40);
          *(_OWORD *)(v2 + 8) = v17;
          *(_OWORD *)(v2 + 24) = v18;
        }
        char v14 = 1;
        goto LABEL_24;
      case 2u:
        uint64_t v9 = *(void *)(a2 + 24);
        *(void *)(v2 + 24) = v9;
        *(void *)(v2 + 32) = *(void *)(a2 + 32);
        (**(void (***)(uint64_t, uint64_t))(v9 - 8))(v2, a2);
        uint64_t v10 = (_OWORD *)(v2 + 40);
        long long v11 = (long long *)(a2 + 40);
        uint64_t v12 = *(void *)(a2 + 64);
        if (v12)
        {
          *(void *)(v2 + 64) = v12;
          *(void *)(v2 + 72) = *(void *)(a2 + 72);
          (**(void (***)(_OWORD *, long long *))(v12 - 8))(v10, v11);
        }
        else
        {
          long long v15 = *v11;
          long long v16 = *(_OWORD *)(a2 + 56);
          *(void *)(v2 + 72) = *(void *)(a2 + 72);
          _OWORD *v10 = v15;
          *(_OWORD *)(v2 + 56) = v16;
        }
        char v14 = 2;
        goto LABEL_24;
      case 3u:
        uint64_t v13 = *(void *)(a2 + 24);
        *(void *)(v2 + 24) = v13;
        *(void *)(v2 + 32) = *(void *)(a2 + 32);
        (**(void (***)(uint64_t, uint64_t))(v13 - 8))(v2, a2);
        char v14 = 3;
LABEL_24:
        *(unsigned char *)(v2 + 80) = v14;
        break;
      default:
        id v6 = *(void **)a2;
        *(void *)uint64_t v2 = *(void *)a2;
        *(unsigned char *)(v2 + 80) = 0;
        id v7 = v6;
        break;
    }
  }
  return v2;
}

uint64_t assignWithTake for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 80);
    if (v4 >= 4) {
      unsigned int v4 = *(_DWORD *)a1 + 4;
    }
    switch(v4)
    {
      case 1u:
        swift_bridgeObjectRelease();
        if (*(void *)(v2 + 32))
        {
          a1 = v2 + 8;
          goto LABEL_10;
        }
        break;
      case 2u:
        __swift_destroy_boxed_opaque_existential_1(a1);
        if (*(void *)(v2 + 64))
        {
          a1 = v2 + 40;
          goto LABEL_10;
        }
        break;
      case 3u:
LABEL_10:
        __swift_destroy_boxed_opaque_existential_1(a1);
        break;
      default:

        break;
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 80);
    if (v5 >= 4) {
      unsigned int v5 = *(_DWORD *)a2 + 4;
    }
    switch(v5)
    {
      case 1u:
        long long v7 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)uint64_t v2 = *(_OWORD *)a2;
        *(_OWORD *)(v2 + 16) = v7;
        *(_OWORD *)(v2 + 32) = *(_OWORD *)(a2 + 32);
        char v6 = 1;
        break;
      case 2u:
        memcpy((void *)v2, (const void *)a2, 0x50uLL);
        char v6 = 2;
        break;
      case 3u:
        long long v8 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)uint64_t v2 = *(_OWORD *)a2;
        *(_OWORD *)(v2 + 16) = v8;
        *(void *)(v2 + 32) = *(void *)(a2 + 32);
        char v6 = 3;
        break;
      default:
        char v6 = 0;
        *(void *)uint64_t v2 = *(void *)a2;
        break;
    }
    *(unsigned char *)(v2 + 80) = v6;
  }
  return v2;
}

uint64_t getEnumTagSinglePayload for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 80) = 0;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_DWORD *)uint64_t result = a2 - 253;
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

uint64_t sub_23D4B92FC(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 80);
  if (result >= 4) {
    return (*(_DWORD *)a1 + 4);
  }
  return result;
}

uint64_t sub_23D4B9318(uint64_t result, unsigned int a2)
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

ValueMetadata *type metadata accessor for MusicPlaybackIntentDonationDescriptor.Kind()
{
  return &type metadata for MusicPlaybackIntentDonationDescriptor.Kind;
}

uint64_t sub_23D4B9354()
{
  OUTLINED_FUNCTION_2();
  v1[14] = v2;
  v1[15] = v0;
  v1[13] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50218);
  OUTLINED_FUNCTION_0(v4);
  v1[16] = v5;
  v1[17] = *(void *)(v6 + 64);
  v1[18] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50210);
  OUTLINED_FUNCTION_0(v7);
  v1[19] = v8;
  v1[20] = *(void *)(v9 + 64);
  v1[21] = swift_task_alloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_23D4B9434()
{
  if (qword_26AF502B0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[14];
  uint64_t v7 = v0[13];
  sub_23D4BA13C(v0[15], (uint64_t)(v0 + 2));
  sub_23D4BADAC(v7, v1, &qword_26AF50210);
  sub_23D4BADAC(v6, v3, &qword_26AF50218);
  unint64_t v8 = (*(unsigned __int8 *)(v4 + 80) + 97) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v9 = (v2 + *(unsigned __int8 *)(v5 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  memcpy((void *)(v10 + 16), v0 + 2, 0x51uLL);
  sub_23D4BAE90(v1, v10 + v8, &qword_26AF50210);
  sub_23D4BAE90(v3, v10 + v9, &qword_26AF50218);
  sub_23D4CE9D0();
  sub_23D4CE8F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_5();
  return v11();
}

uint64_t sub_23D4B95D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[52] = a1;
  v4[53] = a2;
  uint64_t v7 = sub_23D4CEAC0();
  v4[54] = v7;
  v4[55] = *(void *)(v7 - 8);
  v4[56] = swift_task_alloc();
  uint64_t v8 = sub_23D4CE9D0();
  v4[57] = v8;
  v4[58] = *(void *)(v8 - 8);
  v4[59] = swift_task_alloc();
  v4[60] = swift_task_alloc();
  v4[61] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50208);
  v4[62] = swift_task_alloc();
  uint64_t v9 = swift_task_alloc();
  v4[63] = v9;
  v4[64] = swift_task_alloc();
  uint64_t v10 = (void *)swift_task_alloc();
  v4[65] = v10;
  void *v10 = v4;
  v10[1] = sub_23D4B97BC;
  return sub_23D4BA524(v9, a3, a4);
}

uint64_t sub_23D4B97BC()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v5 = v4;
  *(void *)(v6 + 528) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_23D4B9898()
{
  v44 = v0;
  uint64_t v1 = v0[64];
  uint64_t v2 = v0[62];
  sub_23D4BAE90(v0[63], v1, &qword_26AF50208);
  sub_23D4BADAC(v1, v2, &qword_26AF50208);
  if (OUTLINED_FUNCTION_10() == 1)
  {
    sub_23D4BAEEC(v0[62], &qword_26AF50208);
    if (qword_26AF501E0 != -1) {
      swift_once();
    }
    uint64_t v3 = v0[53];
    __swift_project_value_buffer(v0[54], (uint64_t)qword_26AF50450);
    sub_23D4BA13C(v3, (uint64_t)(v0 + 35));
    uint64_t v4 = sub_23D4CEAA0();
    os_log_type_t v5 = sub_23D4CF020();
    BOOL v6 = os_log_type_enabled(v4, v5);
    uint64_t v7 = v0[64];
    if (v6)
    {
      uint64_t v41 = v0[64];
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136446210;
      sub_23D4BAD74((uint64_t)(v0 + 35), (uint64_t)(v0 + 24));
      uint64_t v9 = sub_23D4CEEB0();
      v0[49] = sub_23D4C2BF8(v9, v10, &v43);
      sub_23D4CF080();
      swift_bridgeObjectRelease();
      sub_23D4BAD44((uint64_t)(v0 + 35));
      _os_log_impl(&dword_23D4B6000, v4, v5, "Unable to create MusicPlaybackIntentDonation from %{public}s).", v8, 0xCu);
      uint64_t v11 = 1;
      swift_arrayDestroy();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_6();

      sub_23D4BAEEC(v41, &qword_26AF50208);
    }
    else
    {

      sub_23D4BAD44((uint64_t)(v0 + 35));
      sub_23D4BAEEC(v7, &qword_26AF50208);
      uint64_t v11 = 1;
    }
  }
  else
  {
    v42 = (void (**)(void, void, void))(v0[58] + 32);
    v40 = *v42;
    (*v42)(v0[61], v0[62], v0[57]);
    if (qword_26AF501E0 != -1) {
      swift_once();
    }
    uint64_t v12 = v0[58];
    uint64_t v13 = v0[56];
    uint64_t v14 = v0[54];
    uint64_t v15 = v0[55];
    uint64_t v16 = __swift_project_value_buffer(v14, (uint64_t)qword_26AF50450);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, v16, v14);
    long long v17 = *(void (**)(void))(v12 + 16);
    OUTLINED_FUNCTION_11();
    v17();
    OUTLINED_FUNCTION_11();
    v17();
    long long v18 = sub_23D4CEAA0();
    os_log_type_t v19 = sub_23D4CF030();
    BOOL v20 = os_log_type_enabled(v18, v19);
    uint64_t v21 = v0[64];
    uint64_t v22 = v0[58];
    uint64_t v23 = v0[55];
    uint64_t v24 = v0[56];
    uint64_t v39 = v0[54];
    if (v20)
    {
      uint64_t v38 = v0[56];
      uint64_t v25 = swift_slowAlloc();
      v36 = (void *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136446466;
      v26 = (void *)sub_23D4CE990();
      uint64_t v27 = sub_23D4BAE08(v26);
      if (!v28) {
        uint64_t v27 = 0x746E656469206F6ELL;
      }
      uint64_t v37 = v21;
      if (v28) {
        unint64_t v29 = v28;
      }
      else {
        unint64_t v29 = 0xED00007265696669;
      }
      v0[50] = sub_23D4C2BF8(v27, v29, &v43);
      sub_23D4CF080();
      swift_bridgeObjectRelease();
      v30 = *(void (**)(void))(v22 + 8);
      OUTLINED_FUNCTION_7();
      v30();
      *(_WORD *)(v25 + 12) = 2114;
      uint64_t v31 = sub_23D4CE990();
      v0[51] = v31;
      sub_23D4CF080();
      void *v36 = v31;
      OUTLINED_FUNCTION_7();
      v30();
      _os_log_impl(&dword_23D4B6000, v18, v19, "Created MusicPlaybackIntentDonation<%{public}s)>: %{public}@).", (uint8_t *)v25, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50230);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_6();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_6();

      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v38, v39);
      uint64_t v32 = v37;
    }
    else
    {

      v33 = *(void (**)(void))(v22 + 8);
      OUTLINED_FUNCTION_7();
      v33();
      OUTLINED_FUNCTION_7();
      v33();
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v39);
      uint64_t v32 = v21;
    }
    sub_23D4BAEEC(v32, &qword_26AF50208);
    v40(v0[52], v0[61], v0[57]);
    uint64_t v11 = 0;
  }
  __swift_storeEnumTagSinglePayload(v0[52], v11, 1, v0[57]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return v34();
}

uint64_t sub_23D4B9E58()
{
  long long v18 = v0;
  if (qword_26AF501E0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[66];
  uint64_t v2 = v0[53];
  __swift_project_value_buffer(v0[54], (uint64_t)qword_26AF50450);
  sub_23D4BA13C(v2, (uint64_t)(v0 + 2));
  id v3 = v1;
  id v4 = v1;
  os_log_type_t v5 = sub_23D4CEAA0();
  os_log_type_t v6 = sub_23D4CF020();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[66];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446466;
    sub_23D4BAD74((uint64_t)(v0 + 2), (uint64_t)(v0 + 13));
    uint64_t v10 = sub_23D4CEEB0();
    v0[48] = sub_23D4C2BF8(v10, v11, &v17);
    sub_23D4CF080();
    swift_bridgeObjectRelease();
    sub_23D4BAD44((uint64_t)(v0 + 2));
    *(_WORD *)(v9 + 12) = 2082;
    v0[47] = v8;
    id v12 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B050);
    uint64_t v13 = sub_23D4CEEB0();
    v0[46] = sub_23D4C2BF8(v13, v14, &v17);
    sub_23D4CF080();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23D4B6000, v5, v6, "Unable to create MusicPlaybackIntentDonation from %{public}s) due to error: %{public}s).", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_6();
  }
  else
  {

    sub_23D4BAD44((uint64_t)(v0 + 2));
  }
  __swift_storeEnumTagSinglePayload(v0[52], 1, 1, v0[57]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return v15();
}

uint64_t sub_23D4BA13C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_23D4BA174()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50210);
  OUTLINED_FUNCTION_0(v1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 97) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50218);
  OUTLINED_FUNCTION_0(v7);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = v4 + v6 + v9;
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = (id *)(v0 + 16);
  switch(*(unsigned char *)(v0 + 96))
  {
    case 0:

      break;
    case 1:
      swift_bridgeObjectRelease();
      if (*(void *)(v0 + 48))
      {
        uint64_t v13 = (id *)(v0 + 24);
        goto LABEL_7;
      }
      break;
    case 2:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
      if (*(void *)(v0 + 80))
      {
        uint64_t v13 = (id *)(v0 + 56);
        goto LABEL_7;
      }
      break;
    case 3:
LABEL_7:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
      break;
    default:
      break;
  }
  uint64_t v14 = v10 & ~v9;
  uint64_t v15 = v0 + v4;
  uint64_t v16 = sub_23D4CEA10();
  if (!OUTLINED_FUNCTION_10()) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  }
  uint64_t v17 = sub_23D4CEA20();
  if (!OUTLINED_FUNCTION_10()) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v0 + v14, v17);
  }
  return MEMORY[0x270FA0238](v0, v14 + v12, v3 | v9 | 7);
}

uint64_t sub_23D4BA33C(uint64_t a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50210);
  OUTLINED_FUNCTION_0(v4);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 97) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AF50218) - 8) + 80);
  unint64_t v10 = v6 + v8 + v9;
  uint64_t v11 = v1 + 16;
  uint64_t v12 = v1 + v6;
  uint64_t v13 = v1 + (v10 & ~v9);
  swift_task_alloc();
  OUTLINED_FUNCTION_12();
  *(void *)(v2 + 16) = v14;
  *uint64_t v14 = v15;
  v14[1] = sub_23D4BA464;
  return sub_23D4B95D8(a1, v11, v12, v13);
}

uint64_t sub_23D4BA464()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_3();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return v3();
}

uint64_t sub_23D4BA524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[35] = a3;
  v4[36] = v3;
  v4[33] = a1;
  v4[34] = a2;
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_23D4BA54C()
{
  sub_23D4BAD74(*(void *)(v0 + 288), v0 + 16);
  switch(*(unsigned char *)(v0 + 96))
  {
    case 1:
      uint64_t v13 = *(void *)(v0 + 16);
      *(void *)(v0 + 296) = v13;
      sub_23D4BAE90(v0 + 24, v0 + 224, &qword_26AF50248);
      swift_task_alloc();
      OUTLINED_FUNCTION_12();
      *(void *)(v0 + 304) = v14;
      *uint64_t v14 = v15;
      v14[1] = sub_23D4BA808;
      uint64_t v16 = *(void *)(v0 + 272);
      uint64_t v17 = *(void *)(v0 + 280);
      uint64_t v18 = *(void *)(v0 + 264);
      uint64_t result = MEMORY[0x270F4CBB0](v18, v13, v0 + 224, v16, v17);
      break;
    case 2:
      sub_23D4BAE78((long long *)(v0 + 16), v0 + 144);
      sub_23D4BAE90(v0 + 56, v0 + 184, &qword_26AF50248);
      swift_task_alloc();
      OUTLINED_FUNCTION_12();
      *(void *)(v0 + 320) = v5;
      *uint64_t v5 = v6;
      v5[1] = sub_23D4BA960;
      uint64_t v7 = *(void *)(v0 + 272);
      uint64_t v8 = *(void *)(v0 + 280);
      uint64_t v9 = *(void *)(v0 + 264);
      uint64_t result = MEMORY[0x270F4CBA8](v9, v0 + 144, v0 + 184, v7, v8);
      break;
    case 3:
      sub_23D4BAE78((long long *)(v0 + 16), v0 + 104);
      swift_task_alloc();
      OUTLINED_FUNCTION_12();
      *(void *)(v0 + 336) = v10;
      void *v10 = v11;
      v10[1] = sub_23D4BAAA8;
      uint64_t v12 = *(void *)(v0 + 264);
      uint64_t result = MEMORY[0x270F4CBA0](v12, v0 + 104);
      break;
    default:
      uint64_t v1 = *(void *)(v0 + 264);
      sub_23D4BAF40();
      sub_23D4CE980();
      uint64_t v2 = sub_23D4CE9D0();
      __swift_storeEnumTagSinglePayload(v1, 0, 1, v2);
      OUTLINED_FUNCTION_5();
      uint64_t result = v3();
      break;
  }
  return result;
}

uint64_t sub_23D4BA808()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v5 = v4;
  *(void *)(v6 + 312) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_23D4BA900()
{
  OUTLINED_FUNCTION_2();
  sub_23D4BAEEC(v0 + 224, &qword_26AF50248);
  OUTLINED_FUNCTION_5();
  return v1();
}

uint64_t sub_23D4BA960()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v5 = v4;
  *(void *)(v6 + 328) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_23D4BAA3C()
{
  OUTLINED_FUNCTION_2();
  sub_23D4BAEEC(v0 + 184, &qword_26AF50248);
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  OUTLINED_FUNCTION_5();
  return v1();
}

uint64_t sub_23D4BAAA8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_3();
  *uint64_t v5 = v4;
  *(void *)(v6 + 344) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return MEMORY[0x270FA2498]();
}

uint64_t sub_23D4BAB84()
{
  OUTLINED_FUNCTION_2();
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  OUTLINED_FUNCTION_5();
  return v1();
}

uint64_t sub_23D4BABDC()
{
  OUTLINED_FUNCTION_2();
  sub_23D4BAEEC(v0 + 224, &qword_26AF50248);
  OUTLINED_FUNCTION_8();
  return v1();
}

uint64_t sub_23D4BAC40()
{
  OUTLINED_FUNCTION_2();
  sub_23D4BAEEC(v0 + 184, &qword_26AF50248);
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  OUTLINED_FUNCTION_8();
  return v1();
}

uint64_t sub_23D4BACB0()
{
  OUTLINED_FUNCTION_2();
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  OUTLINED_FUNCTION_8();
  return v1();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_23D4BAD44(uint64_t a1)
{
  return a1;
}

uint64_t sub_23D4BAD74(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_23D4BADAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_23D4BAE08(void *a1)
{
  id v2 = objc_msgSend(a1, sel_identifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_23D4CEE70();

  return v3;
}

uint64_t sub_23D4BAE78(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_23D4BAE90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_23D4BAEEC(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_9();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_23D4BAF40()
{
  unint64_t result = qword_268C0B058;
  if (!qword_268C0B058)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C0B058);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0 + 8;
}

void OUTLINED_FUNCTION_6()
{
  JUMPOUT(0x23ED022D0);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

void MPCPlaybackIntent.init<A>(_:)()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v51 = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50240);
  uint64_t v8 = OUTLINED_FUNCTION_12_0(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_27(v9);
  *(void *)&long long v47 = sub_23D4CE930();
  OUTLINED_FUNCTION_0_0();
  uint64_t v46 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_24(v12);
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_79();
  uint64_t v18 = sub_23D4CE950();
  OUTLINED_FUNCTION_0_0();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_46();
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v44 - v23;
  sub_23D4CEAE0();
  int v25 = (*(uint64_t (**)(char *, uint64_t))(v20 + 88))(v24, v18);
  if (v25 == *MEMORY[0x263F568A0])
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF502C0);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_23D4CF940;
    *(void *)(v26 + 56) = v4;
    *(void *)(v26 + 64) = v2;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v26 + 32));
    OUTLINED_FUNCTION_26();
    v27();
    uint64_t v57 = 0;
    long long v56 = 0u;
    OUTLINED_FUNCTION_42((__n128)0);
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    sub_23D4C59A0((uint64_t)&v55, &qword_26AF50248);
    goto LABEL_10;
  }
  uint64_t v49 = v4;
  uint64_t v50 = v14;
  if (v25 != *MEMORY[0x263F568A8])
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v44, v6, v49);
    *(void *)&long long v55 = 0;
    *((void *)&v55 + 1) = 0xE000000000000000;
    sub_23D4CF0D0();
    OUTLINED_FUNCTION_54();
    sub_23D4CEAE0();
    sub_23D4CF150();
    OUTLINED_FUNCTION_34();
    v43();
    OUTLINED_FUNCTION_73();
    sub_23D4CEED0();
    sub_23D4CF220();
    sub_23D4CEED0();
    OUTLINED_FUNCTION_25();
    uint64_t v44 = 40;
    goto LABEL_13;
  }
  v30 = *(void (**)(void))(v50 + 16);
  uint64_t v31 = v49;
  OUTLINED_FUNCTION_35();
  v30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50238);
  if (swift_dynamicCast())
  {
    sub_23D4BAE78(&v52, (uint64_t)&v55);
    uint64_t v54 = 0;
    long long v52 = 0u;
    long long v53 = 0u;
    __swift_project_boxed_opaque_existential_1(&v55, *((uint64_t *)&v56 + 1));
    uint64_t v32 = v45;
    __swift_storeEnumTagSinglePayload(v45, 1, 1, v18);
    sub_23D4CE8C0();
    sub_23D4C59A0(v32, &qword_26AF50240);
    sub_23D4CE910();
    self;
    uint64_t v33 = swift_dynamicCastObjCClass();
    if (v33)
    {
      unint64_t v29 = (void *)v33;
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_7_0();
      v34();
      sub_23D4C59A0((uint64_t)&v52, &qword_26AF50248);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v55);
      goto LABEL_10;
    }
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_43();
LABEL_13:
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_32();
  }
  uint64_t v54 = 0;
  long long v52 = 0u;
  long long v53 = 0u;
  sub_23D4C59A0((uint64_t)&v52, &qword_26AF502B8);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF502C0);
  uint64_t inited = swift_initStackObject();
  long long v47 = xmmword_23D4CF940;
  *(_OWORD *)(inited + 16) = xmmword_23D4CF940;
  *(void *)(inited + 56) = v31;
  *(void *)(inited + 64) = v2;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  OUTLINED_FUNCTION_35();
  v30();
  uint64_t v57 = 0;
  long long v56 = 0u;
  long long v55 = 0u;
  sub_23D4BB728();
  unint64_t v29 = v36;
  swift_bridgeObjectRelease();
  sub_23D4C59A0((uint64_t)&v55, &qword_26AF50248);
  uint64_t v37 = v48;
  OUTLINED_FUNCTION_35();
  v30();
  if (v29)
  {
    OUTLINED_FUNCTION_22();
    v38();
  }
  else
  {
    uint64_t v39 = swift_allocObject();
    *(_OWORD *)(v39 + 16) = v47;
    *(void *)(v39 + 56) = v31;
    *(void *)(v39 + 64) = v2;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v39 + 32));
    OUTLINED_FUNCTION_35();
    v30();
    uint64_t v57 = 0;
    long long v56 = 0u;
    OUTLINED_FUNCTION_42((__n128)0);
    unint64_t v29 = v40;
    swift_bridgeObjectRelease();
    sub_23D4C59A0((uint64_t)&v55, &qword_26AF50248);
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v37, v31);
  }
LABEL_10:
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v29);

  uint64_t v41 = OUTLINED_FUNCTION_61();
  v42(v41);
  OUTLINED_FUNCTION_10_0();
}

void sub_23D4BB728()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50278);
  OUTLINED_FUNCTION_0_0();
  uint64_t v58 = v4;
  uint64_t v59 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_24(v5);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50270);
  OUTLINED_FUNCTION_0_0();
  uint64_t v55 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_24(v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50280);
  OUTLINED_FUNCTION_0_0();
  uint64_t v61 = v10;
  uint64_t v62 = v9;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_0();
  uint64_t v60 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50268);
  OUTLINED_FUNCTION_0_0();
  uint64_t v64 = v13;
  uint64_t v65 = v12;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1_0();
  uint64_t v63 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50290);
  OUTLINED_FUNCTION_0_0();
  uint64_t v67 = v16;
  uint64_t v68 = v15;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1_0();
  uint64_t v66 = v17;
  uint64_t v18 = sub_23D4CEC00();
  OUTLINED_FUNCTION_0_0();
  uint64_t v20 = v19;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_63();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50260);
  uint64_t v26 = OUTLINED_FUNCTION_12_0(v25);
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_29();
  sub_23D4CECB0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v69 = v27;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_62();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_44();
  sub_23D4C1E3C(v2, (uint64_t)v70);
  if (!v71)
  {
    sub_23D4C59A0((uint64_t)v70, &qword_26AF50248);
    OUTLINED_FUNCTION_48(v0, 1);
    goto LABEL_20;
  }
  __swift_project_boxed_opaque_existential_1(v70, v71);
  sub_23D4CECF0();
  sub_23D4CEBF0();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v24, v18);
  OUTLINED_FUNCTION_48(v0, 0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v70);
  OUTLINED_FUNCTION_40(v0);
  if (v31)
  {
LABEL_20:
    sub_23D4C59A0(v0, &qword_26AF50260);
    OUTLINED_FUNCTION_25();
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_21();
  v32();
  sub_23D4C1EAC(v2);
  OUTLINED_FUNCTION_26();
  v33();
  sub_23D4CEC90();
  sub_23D4C3394(&qword_26AF50258, MEMORY[0x263F13708]);
  char v34 = OUTLINED_FUNCTION_3_0();
  v35 = *(void (**)(void))(v69 + 8);
  OUTLINED_FUNCTION_2_0();
  v35();
  if ((v34 & 1) == 0)
  {
    sub_23D4CECA0();
    char v36 = OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_2_0();
    v35();
    if ((v36 & 1) == 0)
    {
      sub_23D4CEC70();
      char v37 = OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_2_0();
      v35();
      if ((v37 & 1) == 0)
      {
        sub_23D4CEC30();
        char v43 = OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_2_0();
        v35();
        if (v43)
        {
          OUTLINED_FUNCTION_2_0();
          v35();
          sub_23D4CE9E0();
          sub_23D4C3394(&qword_268C0B160, MEMORY[0x263F56B10]);
          uint64_t v38 = v63;
          OUTLINED_FUNCTION_75();
          swift_getKeyPath();
          OUTLINED_FUNCTION_71();
          uint64_t v39 = v65;
          sub_23D4CECD0();
          swift_release();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_56();
          uint64_t v71 = v65;
          uint64_t v44 = sub_23D4C58F0(&qword_268C0B170, &qword_26AF50268);
          uint64_t v41 = OUTLINED_FUNCTION_55(v44);
          uint64_t v42 = v64;
          goto LABEL_7;
        }
        sub_23D4CEC80();
        char v45 = OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_2_0();
        v35();
        if ((v45 & 1) == 0)
        {
          sub_23D4CEC10();
          char v46 = OUTLINED_FUNCTION_3_0();
          OUTLINED_FUNCTION_2_0();
          v35();
          if ((v46 & 1) == 0)
          {
            sub_23D4CEC20();
            char v47 = OUTLINED_FUNCTION_3_0();
            OUTLINED_FUNCTION_2_0();
            v35();
            if ((v47 & 1) == 0)
            {
              sub_23D4CEC60();
              char v48 = OUTLINED_FUNCTION_3_0();
              OUTLINED_FUNCTION_2_0();
              v35();
              if (v48)
              {
                OUTLINED_FUNCTION_2_0();
                v35();
                sub_23D4CEA70();
                sub_23D4C3394(&qword_268C0B148, MEMORY[0x263F56DC8]);
                uint64_t v38 = v60;
                OUTLINED_FUNCTION_75();
                swift_getKeyPath();
                OUTLINED_FUNCTION_71();
                uint64_t v39 = v62;
                sub_23D4CECD0();
                swift_release();
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_56();
                uint64_t v71 = v62;
                uint64_t v49 = sub_23D4C58F0(&qword_268C0B158, &qword_26AF50280);
                uint64_t v41 = OUTLINED_FUNCTION_55(v49);
                uint64_t v42 = v61;
                goto LABEL_7;
              }
              sub_23D4CEC40();
              char v50 = OUTLINED_FUNCTION_3_0();
              OUTLINED_FUNCTION_2_0();
              v35();
              if (v50)
              {
                OUTLINED_FUNCTION_2_0();
                v35();
                sub_23D4CEA50();
                sub_23D4C3394(&qword_268C0B130, MEMORY[0x263F56CB8]);
                uint64_t v38 = v54;
                OUTLINED_FUNCTION_75();
                swift_getKeyPath();
                OUTLINED_FUNCTION_71();
                uint64_t v39 = v56;
                sub_23D4CECD0();
                swift_release();
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_56();
                uint64_t v71 = v56;
                uint64_t v51 = sub_23D4C58F0(&qword_268C0B140, &qword_26AF50270);
                uint64_t v41 = OUTLINED_FUNCTION_55(v51);
                uint64_t v42 = v55;
                goto LABEL_7;
              }
              sub_23D4CEC50();
              char v52 = OUTLINED_FUNCTION_3_0();
              OUTLINED_FUNCTION_2_0();
              v35();
              if (v52)
              {
                OUTLINED_FUNCTION_2_0();
                v35();
                sub_23D4CEA60();
                sub_23D4C3394(&qword_268C0B118, MEMORY[0x263F56CE8]);
                uint64_t v38 = v57;
                OUTLINED_FUNCTION_75();
                swift_getKeyPath();
                OUTLINED_FUNCTION_71();
                uint64_t v39 = v59;
                sub_23D4CECD0();
                swift_release();
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_56();
                uint64_t v71 = v59;
                uint64_t v53 = sub_23D4C58F0(&qword_268C0B128, &qword_26AF50278);
                uint64_t v41 = OUTLINED_FUNCTION_55(v53);
                uint64_t v42 = v58;
                goto LABEL_7;
              }
              OUTLINED_FUNCTION_58();
              sub_23D4CF0D0();
              OUTLINED_FUNCTION_73();
              sub_23D4CEED0();
              sub_23D4C3394(&qword_268C0B110, MEMORY[0x263F13708]);
              sub_23D4CF200();
              sub_23D4CEED0();
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_25();
LABEL_22:
              OUTLINED_FUNCTION_16();
              OUTLINED_FUNCTION_32();
            }
          }
        }
        OUTLINED_FUNCTION_2_0();
        v35();
        OUTLINED_FUNCTION_25();
LABEL_21:
        OUTLINED_FUNCTION_43();
        goto LABEL_22;
      }
    }
  }
  OUTLINED_FUNCTION_2_0();
  v35();
  sub_23D4CEDD0();
  uint64_t v38 = v66;
  sub_23D4CECE0();
  swift_getKeyPath();
  uint64_t v39 = v68;
  sub_23D4CECD0();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_56();
  uint64_t v71 = v68;
  uint64_t v40 = sub_23D4C58F0(&qword_26AF50288, &qword_26AF50290);
  uint64_t v41 = OUTLINED_FUNCTION_55(v40);
  uint64_t v42 = v67;
LABEL_7:
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v42 + 32))(v41, v38, v39);
  __swift_project_boxed_opaque_existential_1(v70, v71);
  _s16MusicKitInternal0A15PlayableRequestP01_abC18_MediaPlaybackCoreE14playbackIntent16withStartingItemSo011MPCPlaybackJ0CSg0aB00daM0_pSg_tF_0();
  OUTLINED_FUNCTION_2_0();
  v35();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v70);
  OUTLINED_FUNCTION_10_0();
}

void sub_23D4BC174()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v53 = v2;
  uint64_t v4 = v3;
  uint64_t v51 = sub_23D4CED80();
  OUTLINED_FUNCTION_0_0();
  uint64_t v50 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_27(v7);
  sub_23D4CEC00();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_30();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50228);
  uint64_t v10 = OUTLINED_FUNCTION_12_0(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_14();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B080);
  uint64_t v12 = OUTLINED_FUNCTION_12_0(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_79();
  sub_23D4CEDF0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v15);
  v57[0] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B178);
  sub_23D4C58F0(&qword_268C0B180, &qword_268C0B178);
  if ((sub_23D4CEF70() & 1) == 0)
  {
LABEL_7:
    v57[0] = v4;
    if ((sub_23D4CEF70() & 1) == 0) {
      goto LABEL_16;
    }
    sub_23D4C1E3C(v4, (uint64_t)v54);
    if (v54[3])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B190);
      if (swift_dynamicCast())
      {
        if (v56)
        {
          OUTLINED_FUNCTION_81();
          __swift_project_boxed_opaque_existential_1(v57, v58);
          sub_23D4CEAD0();
          __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
          if (swift_dynamicCast())
          {
            OUTLINED_FUNCTION_48(v48, 0);
            OUTLINED_FUNCTION_72();
            OUTLINED_FUNCTION_21();
            v20();
            static MPCPlaybackIntent.radioPlaybackIntent(for:)();
            OUTLINED_FUNCTION_2_0();
            v21();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
            goto LABEL_36;
          }
          OUTLINED_FUNCTION_48(v48, 1);
          sub_23D4C59A0(v48, &qword_268C0B080);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
LABEL_16:
          uint64_t v22 = &off_264EA1000;
          id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F547F8]), sel_init);
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)(v4 + 16);
          if (v25)
          {
            uint64_t v26 = v4 + 32;
            id v52 = v23;
            swift_bridgeObjectRetain();
            uint64_t v27 = (char *)MEMORY[0x263F8EE78];
            do
            {
              sub_23D4C5420(v26, (uint64_t)v57);
              __swift_project_boxed_opaque_existential_1(v57, v58);
              sub_23D4CECF0();
              sub_23D4CEBC0();
              OUTLINED_FUNCTION_23();
              v28();
              uint64_t v29 = sub_23D4CED50();
              if (__swift_getEnumTagSinglePayload(v1, 1, v29) == 1)
              {
                sub_23D4C59A0(v1, &qword_26AF50228);
                __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
              }
              else
              {
                uint64_t v30 = sub_23D4CED40();
                uint64_t v32 = v31;
                OUTLINED_FUNCTION_8_0();
                OUTLINED_FUNCTION_7_0();
                v33();
                __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  char v37 = (char *)OUTLINED_FUNCTION_53();
                  uint64_t v27 = sub_23D4CDBD8(v37, v38, v39, v40);
                }
                unint64_t v35 = *((void *)v27 + 2);
                unint64_t v34 = *((void *)v27 + 3);
                if (v35 >= v34 >> 1) {
                  uint64_t v27 = sub_23D4CDBD8((char *)(v34 > 1), v35 + 1, 1, (uint64_t)v27);
                }
                *((void *)v27 + 2) = v35 + 1;
                char v36 = &v27[16 * v35];
                *((void *)v36 + 4) = v30;
                *((void *)v36 + 5) = v32;
              }
              v26 += 40;
              --v25;
            }
            while (v25);
            swift_bridgeObjectRelease();
            uint64_t v24 = v52;
            uint64_t v22 = &off_264EA1000;
          }
          else
          {
            uint64_t v27 = (char *)MEMORY[0x263F8EE78];
          }
          sub_23D4C5934((uint64_t)v27, v24);
          id v41 = [objc_allocWithZone(MEMORY[0x263F547F0]) (SEL)v22[82]];
          objc_msgSend(v41, sel_setRequest_, v24);
          sub_23D4C53C0(v53, (uint64_t)v57, &qword_26AF50248);
          if (v58)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
            __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B0A0);
            OUTLINED_FUNCTION_68();
            if (swift_dynamicCast())
            {
              if (v56)
              {
                OUTLINED_FUNCTION_81();
                uint64_t v42 = v58;
                __swift_project_boxed_opaque_existential_1(v57, v58);
                (*(void (**)(uint64_t, void, uint64_t))(v50 + 104))(v49, *MEMORY[0x263F13AA8], v51);
                id v43 = sub_23D4C95AC(v49, v42);
                OUTLINED_FUNCTION_57();
                OUTLINED_FUNCTION_50();
                v44();
                id v45 = objc_msgSend(v43, sel__underlyingModelObject);
                id v46 = objc_msgSend(v45, sel_identifiers);
                objc_msgSend(v41, sel_setStartItemIdentifiers_, v46);

                __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
LABEL_35:
                id v47 = [objc_allocWithZone(MEMORY[0x263F54800]) (SEL)v22[82]];
                objc_msgSend(v47, sel_setTracklistToken_, v41);
                objc_msgSend(v47, sel_setTracklistSource_, 3);

                goto LABEL_36;
              }
            }
            else
            {
              OUTLINED_FUNCTION_13_0();
            }
          }
          else
          {
            sub_23D4C59A0((uint64_t)v57, &qword_26AF50248);
            OUTLINED_FUNCTION_19();
          }
          sub_23D4C59A0((uint64_t)v55, &qword_268C0B0A8);
          goto LABEL_35;
        }
      }
      else
      {
        OUTLINED_FUNCTION_13_0();
      }
    }
    else
    {
      sub_23D4C59A0((uint64_t)v54, &qword_26AF50248);
      OUTLINED_FUNCTION_19();
    }
    sub_23D4C59A0((uint64_t)v55, &qword_268C0B188);
    goto LABEL_16;
  }
  sub_23D4C1E3C(v4, (uint64_t)v57);
  if (!v58)
  {
    sub_23D4C59A0((uint64_t)v57, &qword_26AF50248);
    OUTLINED_FUNCTION_48(v0, 1);
    goto LABEL_6;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
  OUTLINED_FUNCTION_64();
  int v16 = swift_dynamicCast();
  OUTLINED_FUNCTION_48(v0, v16 ^ 1u);
  OUTLINED_FUNCTION_40(v0);
  if (v17)
  {
LABEL_6:
    sub_23D4C59A0(v0, &qword_268C0B080);
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_21();
  v18();
  static MPCPlaybackIntent.radioPlaybackIntent(for:)();
  OUTLINED_FUNCTION_2_0();
  v19();
LABEL_36:
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_10_0();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void MPCPlaybackIntent.init<A, B>(for:startingAt:)()
{
  OUTLINED_FUNCTION_67();
  uint64_t v39 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  sub_23D4CF060();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v37 - v13;
  uint64_t v42 = v9;
  uint64_t v43 = v7;
  uint64_t v44 = v5;
  uint64_t v45 = v3;
  uint64_t v38 = v3;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
  uint64_t v40 = v9;
  uint64_t v16 = v9;
  uint64_t v17 = v11;
  uint64_t v19 = sub_23D4BCC90((void (*)(char *, char *))sub_23D4BCC6C, (uint64_t)v41, v16, v15, MEMORY[0x263F8E628], v5, MEMORY[0x263F8E658], v18);
  OUTLINED_FUNCTION_26();
  v20();
  OUTLINED_FUNCTION_20((uint64_t)v14, 1, v7);
  uint64_t v47 = v17;
  if (v21)
  {
    OUTLINED_FUNCTION_22();
    v22();
    OUTLINED_FUNCTION_31();
  }
  else
  {
    v46[3] = v7;
    v46[4] = v38;
    __swift_allocate_boxed_opaque_existential_1(v46);
    OUTLINED_FUNCTION_8_0();
    (*(void (**)(void))(v23 + 32))();
  }
  uint64_t v30 = v40;
  sub_23D4BD368(v19, (uint64_t)v46, v24, v25, v26, v27, v28, v29, v37, v38, v39, v40, v41[0], v41[1], v42, v43, v44, v45, v46[0],
    v46[1]);
  if (v1)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6_0();
    v32();
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_7_0();
    v33();
    sub_23D4C59A0((uint64_t)v46, &qword_26AF50248);
  }
  else
  {
    unint64_t v34 = v31;
    swift_bridgeObjectRelease();
    sub_23D4C59A0((uint64_t)v46, &qword_26AF50248);
    objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v34);

    OUTLINED_FUNCTION_6_0();
    v35();
    OUTLINED_FUNCTION_8_0();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v47, v30);
  }
  OUTLINED_FUNCTION_59();
}

uint64_t sub_23D4BCC6C@<X0>(uint64_t *a1@<X8>)
{
  return sub_23D4BDCF8(*(void *)(v1 + 24), *(void *)(v1 + 40), a1);
}

uint64_t sub_23D4BCC90(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a8;
  uint64_t v44 = a5;
  uint64_t v9 = v8;
  uint64_t v56 = a4;
  uint64_t v57 = a1;
  uint64_t v58 = a2;
  uint64_t v42 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v55 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v53 = (char *)v40 - v13;
  uint64_t v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  id v41 = (char *)v40 - v17;
  uint64_t v18 = sub_23D4CF060();
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v51 = (char *)v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)v40 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  v40[1] = (char *)v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v50 = (char *)v40 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a6;
  uint64_t v52 = v15;
  uint64_t v59 = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v30 = (char *)v40 - v29;
  uint64_t v31 = sub_23D4CEF90();
  uint64_t v60 = sub_23D4CF120();
  uint64_t v56 = sub_23D4CF130();
  sub_23D4CF100();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v50, v48, v52);
  uint64_t result = sub_23D4CEF60();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    uint64_t v33 = (uint64_t (**)(char *, uint64_t))(v54 + 8);
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_23D4CF070();
      uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, AssociatedTypeWitness);
      if (result == 1) {
        goto LABEL_18;
      }
      v57(v23, v55);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v59);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v55, v44);
        return (*v33)(v23, AssociatedTypeWitness);
      }
      uint64_t v9 = 0;
      (*v33)(v23, AssociatedTypeWitness);
      sub_23D4CF110();
      if (!--v31)
      {
        uint64_t v34 = v54;
        uint64_t v35 = (uint64_t)v51;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v34 = v54;
  uint64_t v35 = (uint64_t)v51;
LABEL_9:
  sub_23D4CF070();
  if (__swift_getEnumTagSinglePayload(v35, 1, AssociatedTypeWitness) == 1)
  {
    uint64_t v36 = (uint64_t)v51;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v59);
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v36, v46);
    return v60;
  }
  else
  {
    uint64_t v37 = *(char **)(v34 + 32);
    uint64_t v54 = v34 + 32;
    uint64_t v55 = v37;
    uint64_t v38 = (void (**)(char *, uint64_t))(v34 + 8);
    uint64_t v39 = v41;
    uint64_t v36 = (uint64_t)v51;
    while (1)
    {
      ((void (*)(char *, uint64_t, uint64_t))v55)(v39, v36, AssociatedTypeWitness);
      v57(v39, v53);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      (*v38)(v39, AssociatedTypeWitness);
      sub_23D4CF110();
      sub_23D4CF070();
      if (__swift_getEnumTagSinglePayload(v36, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_14;
      }
    }
    (*v38)(v39, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v59);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v53, v44);
  }
}

void sub_23D4BD368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_67();
  a19 = v23;
  a20 = v24;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50228);
  uint64_t v30 = OUTLINED_FUNCTION_12_0(v29);
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_27(v31);
  uint64_t v83 = sub_23D4CEC00();
  OUTLINED_FUNCTION_0_0();
  v87 = v32;
  MEMORY[0x270FA5388](v33);
  OUTLINED_FUNCTION_24((uint64_t)v76 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50240);
  uint64_t v36 = OUTLINED_FUNCTION_12_0(v35);
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_27((uint64_t)v76 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v38 = sub_23D4CE950();
  OUTLINED_FUNCTION_0_0();
  uint64_t v40 = v39;
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_45();
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_24(v43);
  uint64_t v44 = sub_23D4CE940();
  uint64_t v45 = sub_23D4C1A68(v44);
  uint64_t v95 = v45;
  uint64_t v46 = *(void *)(v28 + 16);
  uint64_t v78 = v21;
  uint64_t v77 = v20;
  v76[2] = v26;
  if (v46)
  {
    uint64_t v47 = v28 + 32;
    unsigned int v85 = *MEMORY[0x263F568A8];
    uint64_t v48 = (char **)(v40 + 104);
    v76[0] = v40;
    uint64_t v49 = (void (**)(void))(v40 + 8);
    v80 = v87 + 8;
    unsigned int v79 = *MEMORY[0x263F568A0];
    v76[1] = v28;
    uint64_t v50 = v48;
    swift_bridgeObjectRetain();
    v81 = v50;
    uint64_t v51 = v86;
    v89 = v49;
    uint64_t v88 = v22;
    while (1)
    {
      sub_23D4C5420(v47, (uint64_t)v93);
      __swift_project_boxed_opaque_existential_1(v93, v94);
      sub_23D4CEAE0();
      uint64_t v52 = v85;
      v87 = *v50;
      ((void (*)(uint64_t, void, uint64_t))v87)(v22, v85, v38);
      sub_23D4C3394(&qword_26AF50200, MEMORY[0x263F568B0]);
      char v53 = sub_23D4CEE50();
      uint64_t v54 = *v49;
      OUTLINED_FUNCTION_22();
      v54();
      sub_23D4C5420((uint64_t)v93, (uint64_t)v92);
      uint64_t v55 = v92;
      if (v53)
      {
        sub_23D4BAE78(v92, (uint64_t)&v91);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50238);
        if (!swift_dynamicCast())
        {
          OUTLINED_FUNCTION_86();
          goto LABEL_8;
        }
        uint64_t v55 = (long long *)&v90;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
      OUTLINED_FUNCTION_86();
      uint64_t v56 = OUTLINED_FUNCTION_69((uint64_t)&a18);
      v51(v56, v52, v38);
      OUTLINED_FUNCTION_66();
      OUTLINED_FUNCTION_22();
      v54();
      sub_23D4C59A0(v52, &qword_26AF50240);
LABEL_8:
      __swift_project_boxed_opaque_existential_1(v93, v94);
      uint64_t v57 = v82;
      sub_23D4CECF0();
      uint64_t v58 = v84;
      sub_23D4CEBC0();
      OUTLINED_FUNCTION_7_0();
      v59();
      uint64_t v60 = sub_23D4CED50();
      int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v58, 1, v60);
      sub_23D4C59A0(v58, &qword_26AF50228);
      uint64_t v50 = v81;
      if (EnumTagSinglePayload == 1)
      {
        uint64_t v62 = OUTLINED_FUNCTION_69((uint64_t)&a18);
        v51(v62, v79, v38);
        OUTLINED_FUNCTION_66();
        OUTLINED_FUNCTION_22();
        v54();
        sub_23D4C59A0(v57, &qword_26AF50240);
      }
      uint64_t v51 = v86;
      uint64_t v63 = v89;
      OUTLINED_FUNCTION_39();
      v54();
      uint64_t v49 = v63;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
      v47 += 40;
      --v46;
      uint64_t v22 = v88;
      if (!v46)
      {
        swift_bridgeObjectRelease();
        uint64_t v64 = v95;
        uint64_t v65 = v76[0];
        OUTLINED_FUNCTION_86();
        goto LABEL_13;
      }
    }
  }
  uint64_t v64 = v45;
  uint64_t v66 = *MEMORY[0x263F568A8];
  uint64_t v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 104);
  uint64_t v65 = v40;
LABEL_13:
  v51(v22, v66, v38);
  swift_bridgeObjectRetain();
  char v67 = sub_23D4C1C28(v22, v64);
  swift_bridgeObjectRelease();
  uint64_t v68 = *(void (**)(uint64_t))(v65 + 8);
  uint64_t v69 = OUTLINED_FUNCTION_74();
  v68(v69);
  if (v67)
  {
    swift_bridgeObjectRelease();
    sub_23D4BB728();
    if (v70)
    {
      uint64_t v71 = v70;
LABEL_19:
      objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v71);

      goto LABEL_20;
    }
LABEL_18:
    sub_23D4BC174();
    uint64_t v71 = v75;
    goto LABEL_19;
  }
  v51(v22, *MEMORY[0x263F568A0], v38);
  char v72 = sub_23D4C1C28(v22, v95);
  swift_bridgeObjectRelease();
  uint64_t v73 = OUTLINED_FUNCTION_74();
  v68(v73);
  if (v72) {
    goto LABEL_18;
  }
  sub_23D4C3348();
  OUTLINED_FUNCTION_80();
  unsigned char *v74 = 0;
  swift_willThrow();
LABEL_20:
  OUTLINED_FUNCTION_59();
}

void MPCPlaybackIntent.init<A, B>(_:startingAt:)()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  v22[5] = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = sub_23D4CF060();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_4_0();
  v22[2] = v13;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v22 - v15;
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_63();
  uint64_t v24 = v18;
  v22[6] = v8;
  OUTLINED_FUNCTION_26();
  v19();
  uint64_t v25 = v11;
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v23 = v6;
  v20(v16, v6, v9);
  v22[3] = v1;
  v22[4] = v3;
  MPCPlaybackIntent.init<A, B>(for:startingAt:)();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v9);
  OUTLINED_FUNCTION_7_0();
  v21();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_23D4BDCF8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X4>, uint64_t *a3@<X8>)
{
  a3[3] = a1;
  a3[4] = a2;
  __swift_allocate_boxed_opaque_existential_1(a3);
  OUTLINED_FUNCTION_8_0();
  return (*(uint64_t (**)(void))(v3 + 16))();
}

void MPCPlaybackIntent.init<A>(container:startingAt:playbackSource:)()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_23D4CE930();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_29();
  sub_23D4CE8C0();
  sub_23D4CE910();
  self;
  uint64_t v5 = OUTLINED_FUNCTION_84();
  if (!v5)
  {
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_43();
    sub_23D4CF1B0();
    OUTLINED_FUNCTION_32();
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v5);
  swift_unknownObjectRelease();
  sub_23D4C59A0(v1, &qword_26AF50240);
  sub_23D4C59A0(v3, &qword_26AF50248);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0();
  v6();
  OUTLINED_FUNCTION_23();
  v7();
  OUTLINED_FUNCTION_10_0();
}

void MPCPlaybackIntent.init(_:)()
{
  OUTLINED_FUNCTION_11_0();
  sub_23D4CE8B0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = v0;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_46();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v8 - v4;
  uint64_t v6 = *(void (**)(void))(v1 + 16);
  OUTLINED_FUNCTION_70();
  v6();
  MPCPlaybackIntent.init(for:)(v5);
  OUTLINED_FUNCTION_39();
  v7();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_10_0();
}

#error "23D4BE364: call analysis failed (funcsize=78)"

void sub_23D4BE3A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_67();
  a19 = v23;
  a20 = v24;
  uint64_t v154 = v21;
  uint64_t v155 = v20;
  uint64_t v156 = v25;
  uint64_t v27 = v26;
  uint64_t v28 = sub_23D4CE8B0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v157 = v29;
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_24(v32);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50240);
  uint64_t v34 = OUTLINED_FUNCTION_12_0(v33);
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_1_0();
  uint64_t v144 = v35;
  uint64_t v147 = sub_23D4CE930();
  OUTLINED_FUNCTION_0_0();
  uint64_t v146 = v36;
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_24(v38);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B078);
  uint64_t v40 = OUTLINED_FUNCTION_12_0(v39);
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_27((uint64_t)&v141 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v160 = sub_23D4CEDE0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v148 = v42;
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_24(v45);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B068);
  uint64_t v47 = OUTLINED_FUNCTION_12_0(v46);
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v48);
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_5_0();
  uint64_t v51 = MEMORY[0x270FA5388](v50);
  char v53 = (char *)&v141 - v52;
  MEMORY[0x270FA5388](v51);
  uint64_t v55 = (char *)&v141 - v54;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B080);
  uint64_t v57 = OUTLINED_FUNCTION_12_0(v56);
  MEMORY[0x270FA5388](v57);
  OUTLINED_FUNCTION_14();
  uint64_t v58 = sub_23D4CEDF0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v149 = v59;
  MEMORY[0x270FA5388](v60);
  OUTLINED_FUNCTION_1_0();
  a10 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B0F0);
  sub_23D4C58F0(&qword_268C0B0F8, &qword_268C0B0F0);
  if (OUTLINED_FUNCTION_65())
  {
    sub_23D4CEF80();
    OUTLINED_FUNCTION_20((uint64_t)v55, 1, v28);
    if (v63)
    {
      sub_23D4C59A0((uint64_t)v55, &qword_268C0B068);
      __swift_storeEnumTagSinglePayload(v22, 1, 1, v58);
    }
    else
    {
      sub_23D4CE8A0();
      OUTLINED_FUNCTION_22();
      v61();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
      OUTLINED_FUNCTION_64();
      int v62 = swift_dynamicCast();
      __swift_storeEnumTagSinglePayload(v22, v62 ^ 1u, 1, v58);
      OUTLINED_FUNCTION_20(v22, 1, v58);
      if (!v63)
      {
        OUTLINED_FUNCTION_72();
        OUTLINED_FUNCTION_61();
        OUTLINED_FUNCTION_21();
        v74();
        id v75 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
        id v76 = static MPCPlaybackIntent.radioPlaybackIntent(for:)();
        objc_msgSend(v75, sel_initWithPlaybackIntent_, v76);

        sub_23D4C59A0(v156, &qword_268C0B068);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_60();
        OUTLINED_FUNCTION_6_0();
        v77();
        goto LABEL_56;
      }
    }
    sub_23D4C59A0(v22, &qword_268C0B080);
  }
  if (OUTLINED_FUNCTION_65())
  {
    sub_23D4CEF80();
    OUTLINED_FUNCTION_20((uint64_t)v53, 1, v28);
    if (v63)
    {
      sub_23D4C59A0((uint64_t)v53, &qword_268C0B068);
      uint64_t v65 = v158;
      __swift_storeEnumTagSinglePayload(v158, 1, 1, v160);
    }
    else
    {
      sub_23D4CE8A0();
      OUTLINED_FUNCTION_22();
      v64();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
      OUTLINED_FUNCTION_64();
      uint64_t v65 = v158;
      uint64_t v66 = v160;
      int v67 = swift_dynamicCast();
      __swift_storeEnumTagSinglePayload(v65, v67 ^ 1u, 1, v66);
      OUTLINED_FUNCTION_20(v65, 1, v66);
      if (!v68)
      {
        uint64_t v78 = v148;
        OUTLINED_FUNCTION_76();
        uint64_t v79 = v150;
        OUTLINED_FUNCTION_21();
        v80();
        id v81 = sub_23D4C06C8(v79);
        if (v81)
        {
          uint64_t v82 = v81;
          objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v81);

          sub_23D4C59A0(v156, &qword_268C0B068);
          swift_bridgeObjectRelease();
          uint64_t v83 = OUTLINED_FUNCTION_60();
          v84(v83);
        }
        else
        {
          uint64_t v122 = v156;
          if (qword_268C0B010 != -1) {
            swift_once();
          }
          uint64_t v123 = sub_23D4CEAC0();
          __swift_project_value_buffer(v123, (uint64_t)qword_268C0B350);
          uint64_t v124 = v142;
          OUTLINED_FUNCTION_26();
          v125();
          v126 = sub_23D4CEAA0();
          os_log_type_t v127 = sub_23D4CF020();
          if (os_log_type_enabled(v126, v127))
          {
            v128 = (uint8_t *)swift_slowAlloc();
            uint64_t v159 = swift_slowAlloc();
            v166[0] = v159;
            *(_DWORD *)v128 = 136446210;
            sub_23D4C3394(&qword_268C0B098, MEMORY[0x263F13C80]);
            uint64_t v129 = sub_23D4CF200();
            uint64_t v131 = sub_23D4C2BF8(v129, v130, v166);
            OUTLINED_FUNCTION_37(v131);
            sub_23D4CF080();
            swift_bridgeObjectRelease();
            v132 = *(void (**)(uint64_t))(v78 + 8);
            uint64_t v133 = OUTLINED_FUNCTION_60();
            v132(v133);
            _os_log_impl(&dword_23D4B6000, v126, v127, "Unable to create artist station playback intent from artist: %{public}s.", v128, 0xCu);
            OUTLINED_FUNCTION_86();
            swift_arrayDestroy();
            OUTLINED_FUNCTION_6();
            uint64_t v122 = v156;
            OUTLINED_FUNCTION_6();
          }
          else
          {
            v132 = *(void (**)(uint64_t))(v78 + 8);
            ((void (*)(uint64_t, uint64_t))v132)(v124, v66);
          }

          sub_23D4C3348();
          OUTLINED_FUNCTION_80();
          unsigned char *v139 = 2;
          swift_willThrow();
          sub_23D4C59A0(v122, &qword_268C0B068);
          swift_bridgeObjectRelease();
          uint64_t v140 = OUTLINED_FUNCTION_60();
          v132(v140);
        }
        goto LABEL_56;
      }
    }
    sub_23D4C59A0(v65, &qword_268C0B078);
  }
  if (OUTLINED_FUNCTION_65())
  {
    uint64_t v69 = v152;
    sub_23D4CEF80();
    OUTLINED_FUNCTION_20(v69, 1, v28);
    if (v63)
    {
      sub_23D4C59A0(v69, &qword_268C0B068);
      OUTLINED_FUNCTION_19();
    }
    else
    {
      sub_23D4CE8A0();
      v70 = *(void (**)(void))(v157 + 8);
      OUTLINED_FUNCTION_34();
      v70();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50238);
      char v71 = OUTLINED_FUNCTION_15();
      if (v71)
      {
        if (v165)
        {
          sub_23D4BAE78(&v164, (uint64_t)v166);
          uint64_t v72 = v156;
          uint64_t v73 = v143;
          sub_23D4C53C0(v156, v143, &qword_268C0B068);
          OUTLINED_FUNCTION_20(v73, 1, v28);
          if (v63)
          {
            sub_23D4C59A0(v73, &qword_268C0B068);
            OUTLINED_FUNCTION_19();
            OUTLINED_FUNCTION_87();
          }
          else
          {
            sub_23D4CE8A0();
            OUTLINED_FUNCTION_34();
            v70();
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
            OUTLINED_FUNCTION_15();
            OUTLINED_FUNCTION_87();
            if ((v134 & 1) == 0) {
              OUTLINED_FUNCTION_13_0();
            }
          }
          uint64_t v135 = OUTLINED_FUNCTION_77();
          uint64_t v136 = v144;
          __swift_storeEnumTagSinglePayload(v144, 1, 1, v135);
          sub_23D4CE8C0();
          sub_23D4C59A0(v136, &qword_26AF50240);
          sub_23D4CE910();
          self;
          uint64_t v137 = swift_dynamicCastObjCClass();
          if (!v137)
          {
            swift_unknownObjectRelease();
            OUTLINED_FUNCTION_18();
            OUTLINED_FUNCTION_43();
            OUTLINED_FUNCTION_41();
            OUTLINED_FUNCTION_32();
          }
          objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v137);
          swift_unknownObjectRelease();
          sub_23D4C59A0(v72, &qword_268C0B068);
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_82();
          OUTLINED_FUNCTION_7_0();
          v138();
          sub_23D4C59A0((uint64_t)&v164, &qword_26AF50248);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v166);
          goto LABEL_56;
        }
      }
      else
      {
        OUTLINED_FUNCTION_13_0();
      }
    }
    sub_23D4C59A0((uint64_t)&v164, &qword_26AF502B8);
  }
  uint64_t v85 = *(void *)(a10 + 16);
  if (v85)
  {
    uint64_t v160 = *(void *)(v157 + 16);
    unint64_t v86 = a10 + ((*(unsigned __int8 *)(v157 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v157 + 80));
    v87 = (void (**)(void))(v157 + 8);
    uint64_t v88 = *(void *)(v157 + 72);
    uint64_t v152 = a10;
    swift_bridgeObjectRetain();
    v89 = (char *)MEMORY[0x263F8EE78];
    uint64_t v158 = v28;
    while (1)
    {
      OUTLINED_FUNCTION_51();
      v90();
      sub_23D4CE8A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
      if (!swift_dynamicCast()) {
        break;
      }
      sub_23D4BAE78(v161, (uint64_t)&v164);
      OUTLINED_FUNCTION_34();
      v91();
      if (v165)
      {
        sub_23D4BAE78(&v164, (uint64_t)v166);
        v92 = (long long *)OUTLINED_FUNCTION_83();
        sub_23D4BAE78(v92, v93);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v96 = (char *)OUTLINED_FUNCTION_53();
          v89 = sub_23D4CDCC8(v96, v97, v98, v99);
        }
        unint64_t v95 = *((void *)v89 + 2);
        unint64_t v94 = *((void *)v89 + 3);
        if (v95 >= v94 >> 1) {
          v89 = sub_23D4CDCC8((char *)(v94 > 1), v95 + 1, 1, (uint64_t)v89);
        }
        *((void *)v89 + 2) = v95 + 1;
        sub_23D4BAE78(&v164, (uint64_t)&v89[40 * v95 + 32]);
        uint64_t v28 = v158;
      }
      else
      {
        sub_23D4C59A0((uint64_t)&v164, &qword_26AF50248);
      }
      v86 += v88;
      if (!--v85)
      {
        swift_bridgeObjectRelease();
        goto LABEL_45;
      }
    }
    uint64_t v162 = 0;
    memset(v161, 0, sizeof(v161));
    sub_23D4C59A0((uint64_t)v161, &qword_26AF50248);
    if (qword_268C0B010 != -1) {
      swift_once();
    }
    uint64_t v100 = sub_23D4CEAC0();
    __swift_project_value_buffer(v100, (uint64_t)qword_268C0B350);
    OUTLINED_FUNCTION_69((uint64_t)&a9);
    OUTLINED_FUNCTION_51();
    v101();
    v102 = sub_23D4CEAA0();
    os_log_type_t v103 = sub_23D4CF020();
    if (os_log_type_enabled(v102, v103))
    {
      v104 = (uint8_t *)swift_slowAlloc();
      uint64_t v160 = swift_slowAlloc();
      uint64_t v163 = v160;
      *(_DWORD *)v104 = 136446210;
      sub_23D4C3394((unint64_t *)&qword_268C0B060, MEMORY[0x263F56838]);
      uint64_t v105 = sub_23D4CF200();
      *(void *)&v161[0] = sub_23D4C2BF8(v105, v106, &v163);
      sub_23D4CF080();
      swift_bridgeObjectRelease();
      v107 = *v87;
      OUTLINED_FUNCTION_34();
      v107();
      _os_log_impl(&dword_23D4B6000, v102, v103, "Non playable item %{public}s passed to create a playback intent.", v104, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_6();
    }
    else
    {
      v107 = *v87;
      ((void (*)(uint64_t, uint64_t))*v87)(v85, v28);
    }

    sub_23D4C3348();
    OUTLINED_FUNCTION_80();
    unsigned char *v121 = 3;
    swift_willThrow();
    ((void (*)(uint64_t, uint64_t))v107)(v159, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23D4C59A0(v156, &qword_268C0B068);
    swift_bridgeObjectRelease();
  }
  else
  {
    v89 = (char *)MEMORY[0x263F8EE78];
LABEL_45:
    uint64_t v108 = v156;
    uint64_t v109 = v153;
    sub_23D4C53C0(v156, v153, &qword_268C0B068);
    OUTLINED_FUNCTION_20(v109, 1, v28);
    uint64_t v110 = v154;
    if (v63)
    {
      sub_23D4C59A0(v109, &qword_268C0B068);
      OUTLINED_FUNCTION_52();
    }
    else
    {
      sub_23D4CE8A0();
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_7_0();
      v111();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
      OUTLINED_FUNCTION_83();
      char v112 = swift_dynamicCast();
      if ((v112 & 1) == 0) {
        OUTLINED_FUNCTION_31();
      }
    }
    sub_23D4BD368((uint64_t)v89, (uint64_t)v166, v113, v114, v115, v116, v117, v118, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151,
      v152);
    if (v110)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v120 = v119;
      swift_bridgeObjectRelease();
      objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v120);
    }
    sub_23D4C59A0(v108, &qword_268C0B068);
    swift_bridgeObjectRelease();
    sub_23D4C59A0((uint64_t)v166, &qword_26AF50248);
  }
LABEL_56:
  OUTLINED_FUNCTION_59();
}

void MPCPlaybackIntent.init<A>(for:startingAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_67();
  a19 = v24;
  a20 = v25;
  uint64_t v148 = v20;
  uint64_t v149 = v21;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  a10 = v30;
  uint64_t v32 = v31;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50240);
  uint64_t v34 = OUTLINED_FUNCTION_12_0(v33);
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_1_0();
  uint64_t v136 = v35;
  uint64_t v139 = sub_23D4CE930();
  OUTLINED_FUNCTION_0_0();
  uint64_t v138 = v36;
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_24((uint64_t)&v133 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B078);
  uint64_t v40 = OUTLINED_FUNCTION_12_0(v39);
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_1_0();
  uint64_t v146 = v41;
  uint64_t v147 = sub_23D4CEDE0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v142 = v42;
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_24(v45);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B068);
  uint64_t v47 = OUTLINED_FUNCTION_12_0(v46);
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_4_0();
  uint64_t v145 = v48;
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_5_0();
  uint64_t v51 = MEMORY[0x270FA5388](v50);
  char v53 = (char *)&v133 - v52;
  uint64_t v54 = MEMORY[0x270FA5388](v51);
  uint64_t v56 = (char *)&v133 - v55;
  MEMORY[0x270FA5388](v54);
  uint64_t v58 = (char *)&v133 - v57;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B080);
  uint64_t v60 = OUTLINED_FUNCTION_12_0(v59);
  MEMORY[0x270FA5388](v60);
  OUTLINED_FUNCTION_47();
  uint64_t v61 = sub_23D4CEDF0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v143 = v62;
  MEMORY[0x270FA5388](v63);
  OUTLINED_FUNCTION_28();
  if (sub_23D4CEF70())
  {
    uint64_t v134 = v29;
    OUTLINED_FUNCTION_61();
    uint64_t v141 = v32;
    sub_23D4CEF80();
    uint64_t v64 = sub_23D4CE8B0();
    OUTLINED_FUNCTION_20((uint64_t)v58, 1, v64);
    if (v67)
    {
      sub_23D4C59A0((uint64_t)v58, &qword_268C0B068);
      __swift_storeEnumTagSinglePayload(v23, 1, 1, v61);
    }
    else
    {
      sub_23D4CE8A0();
      OUTLINED_FUNCTION_8_0();
      OUTLINED_FUNCTION_7_0();
      v65();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
      OUTLINED_FUNCTION_64();
      int v66 = swift_dynamicCast();
      __swift_storeEnumTagSinglePayload(v23, v66 ^ 1u, 1, v61);
      OUTLINED_FUNCTION_20(v23, 1, v61);
      if (!v67)
      {
        uint64_t v80 = v143;
        OUTLINED_FUNCTION_21();
        v81();
        id v82 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
        id v83 = static MPCPlaybackIntent.radioPlaybackIntent(for:)();
        objc_msgSend(v82, sel_initWithPlaybackIntent_, v83);

        sub_23D4C59A0(a10, &qword_268C0B068);
        OUTLINED_FUNCTION_8_0();
        OUTLINED_FUNCTION_7_0();
        v84();
        (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v22, v61);
        goto LABEL_44;
      }
    }
    sub_23D4C59A0(v23, &qword_268C0B080);
    uint64_t v29 = v134;
    uint64_t v32 = v141;
  }
  if (sub_23D4CEF70())
  {
    sub_23D4CEF80();
    uint64_t v68 = sub_23D4CE8B0();
    OUTLINED_FUNCTION_20((uint64_t)v56, 1, v68);
    if (v67)
    {
      sub_23D4C59A0((uint64_t)v56, &qword_268C0B068);
      uint64_t v70 = v146;
      __swift_storeEnumTagSinglePayload(v146, 1, 1, v147);
    }
    else
    {
      sub_23D4CE8A0();
      OUTLINED_FUNCTION_8_0();
      OUTLINED_FUNCTION_7_0();
      v69();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
      OUTLINED_FUNCTION_64();
      uint64_t v70 = v146;
      uint64_t v71 = v147;
      int v72 = swift_dynamicCast();
      __swift_storeEnumTagSinglePayload(v70, v72 ^ 1u, 1, v71);
      OUTLINED_FUNCTION_20(v70, 1, v71);
      if (!v73)
      {
        uint64_t v85 = v142;
        uint64_t v86 = v144;
        OUTLINED_FUNCTION_21();
        v87();
        id v88 = sub_23D4C06C8(v86);
        if (v88)
        {
          v89 = v88;
          objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v88);

          sub_23D4C59A0(a10, &qword_268C0B068);
          OUTLINED_FUNCTION_8_0();
          OUTLINED_FUNCTION_7_0();
          v90();
          OUTLINED_FUNCTION_23();
          v91();
        }
        else
        {
          uint64_t v141 = v32;
          uint64_t v110 = a10;
          if (qword_268C0B010 != -1) {
            swift_once();
          }
          uint64_t v111 = sub_23D4CEAC0();
          __swift_project_value_buffer(v111, (uint64_t)qword_268C0B350);
          OUTLINED_FUNCTION_78();
          OUTLINED_FUNCTION_26();
          v112();
          uint64_t v113 = sub_23D4CEAA0();
          os_log_type_t v114 = sub_23D4CF020();
          if (os_log_type_enabled(v113, v114))
          {
            uint64_t v115 = (uint8_t *)swift_slowAlloc();
            uint64_t v116 = swift_slowAlloc();
            uint64_t v117 = v71;
            uint64_t v134 = v29;
            v152[0] = v116;
            *(_DWORD *)uint64_t v115 = 136446210;
            sub_23D4C3394(&qword_268C0B098, MEMORY[0x263F13C80]);
            uint64_t v118 = sub_23D4CF200();
            uint64_t v120 = sub_23D4C2BF8(v118, v119, v152);
            OUTLINED_FUNCTION_37(v120);
            uint64_t v121 = a10;
            sub_23D4CF080();
            swift_bridgeObjectRelease();
            uint64_t v122 = *(void (**)(void))(v85 + 8);
            OUTLINED_FUNCTION_23();
            v122();
            os_log_type_t v123 = v114;
            uint64_t v124 = v121;
            _os_log_impl(&dword_23D4B6000, v113, v123, "Unable to create artist station playback intent from artist: %{public}s.", v115, 0xCu);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_6();
            OUTLINED_FUNCTION_6();
          }
          else
          {
            uint64_t v122 = *(void (**)(void))(v85 + 8);
            uint64_t v124 = v110;
            OUTLINED_FUNCTION_23();
            v122();

            uint64_t v117 = v71;
          }
          sub_23D4C3348();
          OUTLINED_FUNCTION_80();
          *uint64_t v131 = 2;
          swift_willThrow();
          sub_23D4C59A0(v124, &qword_268C0B068);
          OUTLINED_FUNCTION_8_0();
          OUTLINED_FUNCTION_7_0();
          v132();
          ((void (*)(uint64_t, uint64_t))v122)(v144, v117);
        }
        goto LABEL_44;
      }
    }
    sub_23D4C59A0(v70, &qword_268C0B078);
  }
  if (sub_23D4CEF70())
  {
    OUTLINED_FUNCTION_61();
    sub_23D4CEF80();
    uint64_t v74 = sub_23D4CE8B0();
    OUTLINED_FUNCTION_20((uint64_t)v53, 1, v74);
    if (v67)
    {
      sub_23D4C59A0((uint64_t)v53, &qword_268C0B068);
      OUTLINED_FUNCTION_19();
    }
    else
    {
      sub_23D4CE8A0();
      OUTLINED_FUNCTION_8_0();
      id v76 = *(void (**)(void))(v75 + 8);
      OUTLINED_FUNCTION_50();
      v76();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50238);
      char v77 = OUTLINED_FUNCTION_15();
      if (v77)
      {
        if (v151)
        {
          sub_23D4BAE78(&v150, (uint64_t)v152);
          uint64_t v78 = a10;
          uint64_t v79 = v135;
          sub_23D4C53C0(a10, v135, &qword_268C0B068);
          OUTLINED_FUNCTION_20(v79, 1, v74);
          if (v67)
          {
            sub_23D4C59A0(v79, &qword_268C0B068);
            OUTLINED_FUNCTION_19();
          }
          else
          {
            sub_23D4CE8A0();
            OUTLINED_FUNCTION_50();
            v76();
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
            char v125 = OUTLINED_FUNCTION_15();
            if ((v125 & 1) == 0) {
              OUTLINED_FUNCTION_13_0();
            }
          }
          OUTLINED_FUNCTION_77();
          uint64_t v126 = OUTLINED_FUNCTION_69((uint64_t)&a10);
          __swift_storeEnumTagSinglePayload(v126, 1, 1, v127);
          sub_23D4CE8C0();
          sub_23D4C59A0(v27, &qword_26AF50240);
          sub_23D4CE910();
          self;
          uint64_t v128 = swift_dynamicCastObjCClass();
          if (!v128)
          {
            swift_unknownObjectRelease();
            OUTLINED_FUNCTION_18();
            OUTLINED_FUNCTION_43();
            OUTLINED_FUNCTION_41();
            OUTLINED_FUNCTION_32();
          }
          objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v128);
          swift_unknownObjectRelease();
          sub_23D4C59A0(v78, &qword_268C0B068);
          OUTLINED_FUNCTION_8_0();
          OUTLINED_FUNCTION_7_0();
          v129();
          OUTLINED_FUNCTION_82();
          OUTLINED_FUNCTION_7_0();
          v130();
          sub_23D4C59A0((uint64_t)&v150, &qword_26AF50248);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v152);
          goto LABEL_44;
        }
      }
      else
      {
        OUTLINED_FUNCTION_13_0();
      }
    }
    sub_23D4C59A0((uint64_t)&v150, &qword_26AF502B8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
  uint64_t v92 = v149;
  uint64_t v93 = sub_23D4CEFA0();
  if (v92)
  {
    sub_23D4C59A0(a10, &qword_268C0B068);
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_7_0();
    v94();
  }
  else
  {
    uint64_t v95 = v93;
    uint64_t v96 = a10;
    uint64_t v97 = v145;
    sub_23D4C53C0(a10, v145, &qword_268C0B068);
    uint64_t v98 = sub_23D4CE8B0();
    OUTLINED_FUNCTION_20(v97, 1, v98);
    if (v67)
    {
      sub_23D4C59A0(v97, &qword_268C0B068);
      OUTLINED_FUNCTION_52();
    }
    else
    {
      sub_23D4CE8A0();
      OUTLINED_FUNCTION_8_0();
      OUTLINED_FUNCTION_7_0();
      v99();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
      OUTLINED_FUNCTION_83();
      char v100 = swift_dynamicCast();
      if ((v100 & 1) == 0) {
        OUTLINED_FUNCTION_31();
      }
    }
    sub_23D4BD368(v95, (uint64_t)v152, v101, v102, v103, v104, v105, v106, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143,
      v144);
    uint64_t v108 = v107;
    swift_bridgeObjectRelease();
    objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v108);

    sub_23D4C59A0(v96, &qword_268C0B068);
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_7_0();
    v109();
    sub_23D4C59A0((uint64_t)v152, &qword_26AF50248);
  }
LABEL_44:
  OUTLINED_FUNCTION_59();
}

#error "23D4C02B0: call analysis failed (funcsize=256)"

id static MPCPlaybackIntent.radioPlaybackIntent(for:)()
{
  uint64_t v1 = sub_23D4CED80();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_28();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v0, *MEMORY[0x263F13AA8], v1);
  sub_23D4CEDF0();
  uint64_t v5 = (void *)sub_23D4CEA80();
  OUTLINED_FUNCTION_6_0();
  v6();
  id v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_radioPlaybackIntentWithStation_, v5);

  return v7;
}

id sub_23D4C06C8(uint64_t a1)
{
  uint64_t v2 = sub_23D4CED80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23D4CEDE0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F13AA8], v2);
  uint64_t v10 = (void *)sub_23D4CEA80();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v11 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_radioPlaybackIntentFromArtist_, v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

void static MPCPlaybackIntent.radioPlaybackIntent<A>(from:)()
{
  OUTLINED_FUNCTION_11_0();
  sub_23D4CEDB0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_44();
  uint64_t v34 = v2;
  sub_23D4CEDE0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x270FA5388](v4);
  sub_23D4CED80();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_30();
  sub_23D4CEDC0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_62();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_26();
  v10(v9);
  OUTLINED_FUNCTION_78();
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_76();
    OUTLINED_FUNCTION_21();
    v12(v11);
    uint64_t v13 = OUTLINED_FUNCTION_17();
    v14(v13);
    OUTLINED_FUNCTION_57();
    uint64_t v15 = (void *)sub_23D4CEA80();
    OUTLINED_FUNCTION_23();
    v17(v16);
    objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_radioPlaybackIntentFromAlbum_, v15, v34);
  }
  else
  {
    OUTLINED_FUNCTION_78();
    if (swift_dynamicCast())
    {
      OUTLINED_FUNCTION_76();
      OUTLINED_FUNCTION_21();
      v19(v18);
      uint64_t v20 = OUTLINED_FUNCTION_17();
      v21(v20);
      OUTLINED_FUNCTION_57();
      uint64_t v22 = (void *)sub_23D4CEA80();
      OUTLINED_FUNCTION_23();
      v24(v23);
      objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_radioPlaybackIntentFromArtist_, v22, v34);
    }
    else
    {
      OUTLINED_FUNCTION_78();
      if (!swift_dynamicCast())
      {
        sub_23D4CF0D0();
        swift_bridgeObjectRelease();
        sub_23D4CF2C0();
        sub_23D4CEED0();
        swift_bridgeObjectRelease();
        sub_23D4CEED0();
        OUTLINED_FUNCTION_25();
        OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_32();
      }
      OUTLINED_FUNCTION_76();
      OUTLINED_FUNCTION_21();
      v26(v25);
      uint64_t v27 = OUTLINED_FUNCTION_17();
      v28(v27);
      OUTLINED_FUNCTION_57();
      uint64_t v29 = (void *)sub_23D4CEA80();
      OUTLINED_FUNCTION_23();
      v31(v30);
      objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_radioPlaybackIntentFromSong_, v29, v34);
    }
  }
  OUTLINED_FUNCTION_39();
  v32();
  OUTLINED_FUNCTION_7_0();
  v33();
  OUTLINED_FUNCTION_10_0();
}

uint64_t sub_23D4C0DAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_23D4CE8B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D4CE8A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
  if (swift_dynamicCast()) {
    return sub_23D4BAE78(v17, a2);
  }
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  sub_23D4C59A0((uint64_t)v17, &qword_26AF50248);
  if (qword_268C0B010 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_23D4CEAC0();
  __swift_project_value_buffer(v9, (uint64_t)qword_268C0B350);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v10 = sub_23D4CEAA0();
  os_log_type_t v11 = sub_23D4CF020();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v19[0] = v13;
    *(_DWORD *)uint64_t v12 = 136446210;
    v19[6] = (uint64_t)(v12 + 4);
    sub_23D4C3394((unint64_t *)&qword_268C0B060, MEMORY[0x263F56838]);
    uint64_t v14 = sub_23D4CF200();
    *(void *)&v17[0] = sub_23D4C2BF8(v14, v15, v19);
    sub_23D4CF080();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_23D4B6000, v10, v11, "Non playable item %{public}s passed to create a playback intent.", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ED022D0](v13, -1, -1);
    MEMORY[0x23ED022D0](v12, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  sub_23D4C3348();
  swift_allocError();
  *uint64_t v16 = 3;
  return swift_willThrow();
}

void MPCPlaybackIntent.init(container:startingAt:playbackSource:)()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v19 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_23D4CE8B0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_47();
  sub_23D4CE930();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_14();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B068);
  uint64_t v12 = OUTLINED_FUNCTION_12_0(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_63();
  uint64_t v15 = v14 - v13;
  sub_23D4CE8A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50238);
  if (!swift_dynamicCast())
  {
    uint64_t v21 = 0;
    memset(v20, 0, sizeof(v20));
    sub_23D4C59A0((uint64_t)v20, &qword_26AF502B8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v0, v5, v6);
    OUTLINED_FUNCTION_58();
    sub_23D4CF0D0();
    OUTLINED_FUNCTION_54();
    sub_23D4C3394((unint64_t *)&qword_268C0B060, MEMORY[0x263F56838]);
    sub_23D4CF200();
    sub_23D4CEED0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_73();
    sub_23D4CEED0();
    OUTLINED_FUNCTION_25();
    goto LABEL_10;
  }
  sub_23D4BAE78(v20, (uint64_t)v23);
  sub_23D4C53C0(v3, v15, &qword_268C0B068);
  if (__swift_getEnumTagSinglePayload(v15, 1, v6) == 1)
  {
    sub_23D4C59A0(v15, &qword_268C0B068);
    OUTLINED_FUNCTION_19();
  }
  else
  {
    sub_23D4CE8A0();
    OUTLINED_FUNCTION_22();
    v16();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
    OUTLINED_FUNCTION_68();
    if ((swift_dynamicCast() & 1) == 0) {
      OUTLINED_FUNCTION_13_0();
    }
  }
  __swift_project_boxed_opaque_existential_1(v23, v23[3]);
  sub_23D4CE8C0();
  sub_23D4CE910();
  self;
  uint64_t v17 = OUTLINED_FUNCTION_84();
  if (!v17)
  {
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_43();
LABEL_10:
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_32();
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v17);
  swift_unknownObjectRelease();
  sub_23D4C59A0(v19, &qword_26AF50240);
  sub_23D4C59A0(v3, &qword_268C0B068);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v6);
  OUTLINED_FUNCTION_34();
  v18();
  sub_23D4C59A0((uint64_t)&v22, &qword_26AF50248);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  OUTLINED_FUNCTION_10_0();
}

uint64_t MPCPlaybackIntent.applyStartTime<A>(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23D4C1500(a1, a2, a3, (SEL *)&selRef_startTimeModifications, (SEL *)&selRef_setStartTimeModifications_);
}

uint64_t MPCPlaybackIntent.applyEndTime<A>(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23D4C1500(a1, a2, a3, (SEL *)&selRef_endTimeModifications, (SEL *)&selRef_setEndTimeModifications_);
}

uint64_t sub_23D4C1500(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4, SEL *a5)
{
  uint64_t v10 = v5;
  uint64_t v13 = sub_23D4CED80();
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v7, a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B0A0);
  OUTLINED_FUNCTION_68();
  if (swift_dynamicCast())
  {
    sub_23D4BAE78(v32, (uint64_t)v33);
    uint64_t v19 = v34;
    __swift_project_boxed_opaque_existential_1(v33, v34);
    uint64_t v20 = OUTLINED_FUNCTION_17();
    v21(v20);
    id v22 = sub_23D4C95AC(v6, v19);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v6, v13);
    id v23 = objc_msgSend(v22, sel__underlyingModelObject);
    id v24 = objc_msgSend(v23, sel_identifiers);

    id v25 = [v10 *a4];
    sub_23D4C33DC(0, &qword_26AF502A0);
    sub_23D4C33DC(0, &qword_268C0B0B0);
    sub_23D4C3418();
    uint64_t v26 = sub_23D4CEE30();

    id v27 = v24;
    uint64_t v28 = sub_23D4CF000();
    if ((v26 & 0xC000000000000001) == 0)
    {
LABEL_8:
      swift_isUniquelyReferenced_nonNull_native();
      *(void *)&v32[0] = v26;
      sub_23D4C4FC0(v28, v27);

      swift_bridgeObjectRelease();
      uint64_t v31 = (void *)sub_23D4CEE20();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, *a5, v31);

      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
    }
    if (v26 < 0) {
      uint64_t v29 = v26;
    }
    else {
      uint64_t v29 = v26 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_23D4CF180();
    if (!__OFADD__(result, 1))
    {
      uint64_t v26 = sub_23D4C4A78(v29, result + 1);
      goto LABEL_8;
    }
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_13_0();
    return sub_23D4C59A0((uint64_t)v32, &qword_268C0B0A8);
  }
  return result;
}

id MPCPlaybackIntent.isInGroupSession.getter()
{
  if (!objc_msgSend(v0, sel_tracklistToken)) {
    return 0;
  }
  self;
  uint64_t v1 = (void *)swift_dynamicCastObjCClass();
  if (!v1)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  id v2 = objc_msgSend(v1, sel_request);
  if (v2)
  {
    self;
    uint64_t v3 = OUTLINED_FUNCTION_84();
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      id v5 = v2;
      id v2 = objc_msgSend(v4, sel_isInGroupSession);

      goto LABEL_6;
    }
    swift_unknownObjectRelease();

    return 0;
  }
LABEL_6:
  swift_unknownObjectRelease();
  return v2;
}

void MPCPlaybackIntent.isInGroupSession.setter(char a1)
{
  id v2 = v1;
  if (!objc_msgSend(v2, sel_tracklistToken)) {
    return;
  }
  self;
  uint64_t v4 = (void *)swift_dynamicCastObjCClass();
  if (v4)
  {
    id v6 = objc_msgSend(v4, sel_request);
    if (v6)
    {
      self;
      id v5 = (void *)swift_dynamicCastObjCClass();
      if (v5)
      {
        objc_msgSend(v5, sel_setInGroupSession_, a1 & 1);
        swift_unknownObjectRelease();

        return;
      }
    }
  }
  swift_unknownObjectRelease();
}

void (*MPCPlaybackIntent.isInGroupSession.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = MPCPlaybackIntent.isInGroupSession.getter() & 1;
  return sub_23D4C1A40;
}

void sub_23D4C1A40(uint64_t a1)
{
}

uint64_t sub_23D4C1A68(uint64_t a1)
{
  uint64_t v2 = sub_23D4CE950();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v19 - v7;
  sub_23D4C3394(&qword_26AF501F8, MEMORY[0x263F568B0]);
  uint64_t v9 = sub_23D4CF010();
  uint64_t v20 = v9;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v12 = v13;
    unint64_t v14 = (*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64);
    uint64_t v19 = a1;
    uint64_t v15 = a1 + v14;
    uint64_t v16 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v15, v2);
      sub_23D4C3478((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v15 += v16;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
    return v20;
  }
  else
  {
    uint64_t v17 = v9;
    swift_bridgeObjectRelease();
  }
  return v17;
}

uint64_t sub_23D4C1C28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_23D4CE950();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_23D4C3394(&qword_26AF501F8, MEMORY[0x263F568B0]),
        uint64_t v7 = sub_23D4CEE40(),
        uint64_t v8 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v9 = v7 & ~v8,
        uint64_t v10 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    unint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      sub_23D4C3394(&qword_26AF50200, MEMORY[0x263F568B0]);
      char v15 = sub_23D4CEE50();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

double sub_23D4C1E3C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    sub_23D4C5420(a1 + 32, a2);
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_23D4C1E60(void *a1)
{
  return sub_23D4CECF0();
}

uint64_t sub_23D4C1EAC(uint64_t a1)
{
  uint64_t v3 = sub_23D4CEC00();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  id v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (v7)
  {
    v13[1] = v1;
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_23D4CAA6C(0, v7, 0);
    uint64_t v9 = a1 + 32;
    do
    {
      swift_getKeyPath();
      swift_getAtKeyPath();
      swift_release();
      uint64_t v8 = v14;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23D4CAA6C(0, *(void *)(v8 + 16) + 1, 1);
        uint64_t v8 = v14;
      }
      unint64_t v11 = *(void *)(v8 + 16);
      unint64_t v10 = *(void *)(v8 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_23D4CAA6C(v10 > 1, v11 + 1, 1);
        uint64_t v8 = v14;
      }
      *(void *)(v8 + 16) = v11 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v11, v6, v3);
      uint64_t v14 = v8;
      v9 += 40;
      --v7;
    }
    while (v7);
  }
  return v8;
}

uint64_t sub_23D4C207C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), unint64_t *a5, void (*a6)(uint64_t))
{
  return sub_23D4CECF0();
}

uint64_t sub_23D4C20F0()
{
  return sub_23D4CECF0();
}

uint64_t MusicPlayableRequest.playbackIntent()()
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  _s16MusicKitInternal0A15PlayableRequestP01_abC18_MediaPlaybackCoreE14playbackIntent16withStartingItemSo011MPCPlaybackJ0CSg0aB00daM0_pSg_tF_0();
  uint64_t v1 = v0;
  sub_23D4C59A0((uint64_t)v3, &qword_26AF50248);
  return v1;
}

void _s16MusicKitInternal0A15PlayableRequestP01_abC18_MediaPlaybackCoreE14playbackIntent16withStartingItemSo011MPCPlaybackJ0CSg0aB00daM0_pSg_tF_0()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_5_0();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_23D4CED80();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D4C53C0(v1, (uint64_t)&v30, &qword_26AF50248);
  if (v32)
  {
    OUTLINED_FUNCTION_81();
    sub_23D4C5420((uint64_t)v33, (uint64_t)&v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B0A0);
    if (!swift_dynamicCast())
    {
      uint64_t v28 = 0;
      memset(v27, 0, sizeof(v27));
      sub_23D4C59A0((uint64_t)v27, &qword_268C0B0A8);
      uint64_t v30 = 0;
      unint64_t v31 = 0xE000000000000000;
      sub_23D4CF0D0();
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_83();
      sub_23D4CF150();
      sub_23D4CEED0();
      OUTLINED_FUNCTION_25();
      uint64_t v25 = 343;
LABEL_22:
      uint64_t v26 = v25;
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_32();
    }
    sub_23D4BAE78(v27, (uint64_t)&v30);
    uint64_t v13 = v32;
    __swift_project_boxed_opaque_existential_1(&v30, v32);
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, *MEMORY[0x263F13AB0], v7);
    id v14 = sub_23D4C95AC((uint64_t)v12, v13);
    OUTLINED_FUNCTION_6_0();
    v15();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
  }
  else
  {
    sub_23D4C59A0((uint64_t)&v30, &qword_26AF50248);
    id v14 = 0;
  }
  uint64_t v16 = *(void (**)(void))(v3 + 16);
  OUTLINED_FUNCTION_36();
  v16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50298);
  OUTLINED_FUNCTION_68();
  if (!swift_dynamicCast())
  {
LABEL_19:
    OUTLINED_FUNCTION_13_0();
    sub_23D4C59A0((uint64_t)&v30, &qword_268C0B0D8);
    OUTLINED_FUNCTION_36();
    v16();
    OUTLINED_FUNCTION_58();
    sub_23D4CF0D0();
    sub_23D4CF220();
    OUTLINED_FUNCTION_54();
    OUTLINED_FUNCTION_25();
    uint64_t v25 = 349;
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_81();
  __swift_project_boxed_opaque_existential_1(v33, v33[3]);
  sub_23D4CED60();
  self;
  uint64_t v17 = (void *)OUTLINED_FUNCTION_84();
  if (!v17)
  {
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_36();
    v16();
    uint64_t v30 = 0;
    unint64_t v31 = 0xE000000000000000;
    sub_23D4CF0D0();
    OUTLINED_FUNCTION_73();
    sub_23D4CEED0();
    sub_23D4CF220();
    OUTLINED_FUNCTION_54();
    OUTLINED_FUNCTION_25();
    uint64_t v25 = 353;
    goto LABEL_22;
  }
  uint64_t v18 = v17;
  id v19 = objc_msgSend(v17, sel_allowedItemIdentifiers);
  if (v19)
  {
    uint64_t v20 = v19;
    sub_23D4C33DC(0, &qword_26AF502A0);
    unint64_t v21 = sub_23D4CEFC0();

    if (v21 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_23D4CF1C0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v22 >= 2)
    {
      objc_msgSend(v18, sel_setItemSortDescriptors_, 0);
      objc_msgSend(v18, sel_setSortUsingAllowedItemIdentifiers_, 1);
    }
  }
  if (!v14)
  {
    id v24 = 0;
    goto LABEL_16;
  }
  if ((objc_msgSend(v14, sel_respondsToSelector_, sel__underlyingModelObject) & 1) == 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  id v23 = objc_msgSend(v14, sel__underlyingModelObject);
  id v24 = objc_msgSend(v23, sel_identifiers);

LABEL_16:
  objc_msgSend(v18, sel_playbackIntentWithStartItemIdentifiers_, v24);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_10_0();
}

void MusicPlayableRequest.playbackIntent(withStartingItem:)()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v2 = v1;
  uint64_t v3 = sub_23D4CE8B0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_62();
  uint64_t v9 = v7 - v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v33 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B068);
  uint64_t v14 = OUTLINED_FUNCTION_12_0(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_45();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v33 - v16;
  sub_23D4C53C0(v2, (uint64_t)v33 - v16, &qword_268C0B068);
  OUTLINED_FUNCTION_40((uint64_t)v17);
  if (v18)
  {
    sub_23D4C59A0((uint64_t)v17, &qword_268C0B068);
    OUTLINED_FUNCTION_52();
  }
  else
  {
    sub_23D4CE8A0();
    OUTLINED_FUNCTION_22();
    v19();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
    char v20 = swift_dynamicCast();
    if ((v20 & 1) == 0) {
      OUTLINED_FUNCTION_31();
    }
  }
  sub_23D4C53C0(v2, v0, &qword_268C0B068);
  OUTLINED_FUNCTION_40(v0);
  if (v18)
  {
    sub_23D4C59A0(v0, &qword_268C0B068);
  }
  else
  {
    OUTLINED_FUNCTION_21();
    v21();
    if (v37[3])
    {
      OUTLINED_FUNCTION_23();
      v22();
    }
    else
    {
      if (qword_268C0B010 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_23D4CEAC0();
      __swift_project_value_buffer(v23, (uint64_t)qword_268C0B350);
      OUTLINED_FUNCTION_26();
      v24();
      uint64_t v25 = sub_23D4CEAA0();
      os_log_type_t v26 = sub_23D4CF030();
      if (os_log_type_enabled(v25, v26))
      {
        id v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        uint64_t v36 = v35;
        uint64_t v34 = v27;
        *(_DWORD *)id v27 = 136446210;
        v33[1] = v27 + 4;
        sub_23D4C3394((unint64_t *)&qword_268C0B060, MEMORY[0x263F56838]);
        uint64_t v28 = sub_23D4CF200();
        uint64_t v30 = sub_23D4C2BF8(v28, v29, &v36);
        OUTLINED_FUNCTION_37(v30);
        sub_23D4CF080();
        swift_bridgeObjectRelease();
        unint64_t v31 = *(void (**)(void))(v5 + 8);
        OUTLINED_FUNCTION_23();
        v31();
        _os_log_impl(&dword_23D4B6000, v25, v26, "Ignoring start item for non-playable item %{public}s for new playback intent.", v34, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_6();
        OUTLINED_FUNCTION_6();

        ((void (*)(char *, uint64_t))v31)(v12, v3);
      }
      else
      {

        uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
        v32(v9, v3);
        v32((uint64_t)v12, v3);
      }
    }
  }
  _s16MusicKitInternal0A15PlayableRequestP01_abC18_MediaPlaybackCoreE14playbackIntent16withStartingItemSo011MPCPlaybackJ0CSg0aB00daM0_pSg_tF_0();
  sub_23D4C59A0((uint64_t)v37, &qword_26AF50248);
  OUTLINED_FUNCTION_10_0();
}

BOOL static MusicPlaybackError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MusicPlaybackError.hash(into:)()
{
  return sub_23D4CF2A0();
}

void *static MusicPlaybackError.allCases.getter()
{
  return &unk_26F1393E8;
}

uint64_t MusicPlaybackError.hashValue.getter()
{
  return sub_23D4CF2B0();
}

void sub_23D4C2B98(void *a1@<X8>)
{
  *a1 = &unk_26F1393E8;
}

uint64_t sub_23D4C2BB4()
{
  return sub_23D4CF2B0();
}

uint64_t sub_23D4C2BF8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23D4C2CCC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23D4C55E4((uint64_t)v12, *a3);
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
      sub_23D4C55E4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23D4C2CCC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_23D4C2E24((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_23D4CF090();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_23D4C2EFC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_23D4CF0F0();
    if (!v8)
    {
      uint64_t result = sub_23D4CF1A0();
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

void *sub_23D4C2E24(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_23D4CF1F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_23D4C2EFC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23D4C2F94(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_23D4C3108(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_23D4C3108((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23D4C2F94(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_23D4CEEE0();
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
  unint64_t v3 = sub_23D4CB270(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_23D4CF0E0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_23D4CF1F0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_23D4CF1A0();
  __break(1u);
  return result;
}

char *sub_23D4C3108(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B100);
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
    sub_23D4C32B8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_23D4C31E0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_23D4C31E0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_23D4CF1F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_23D4C32B8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_23D4CF1F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_23D4C3348()
{
  unint64_t result = qword_268C0B090;
  if (!qword_268C0B090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C0B090);
  }
  return result;
}

uint64_t sub_23D4C3394(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23D4C33DC(uint64_t a1, unint64_t *a2)
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

unint64_t sub_23D4C3418()
{
  unint64_t result = qword_268C0B0B8;
  if (!qword_268C0B0B8)
  {
    sub_23D4C33DC(255, &qword_26AF502A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C0B0B8);
  }
  return result;
}

uint64_t sub_23D4C3478(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_23D4CE950();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_23D4C3394(&qword_26AF501F8, MEMORY[0x263F568B0]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_23D4CEE40();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      char v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_23D4C3394(&qword_26AF50200, MEMORY[0x263F568B0]);
      char v21 = sub_23D4CEE50();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    id v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_23D4C47D8((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_23D4C379C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_23D4CE950();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_23D4C3394(&qword_26AF501F8, MEMORY[0x263F568B0]);
  swift_bridgeObjectRetain();
  uint64_t v30 = a1;
  uint64_t v10 = sub_23D4CEE40();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  uint64_t v29 = v9 + 56;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    os_log_type_t v26 = v2;
    uint64_t v27 = a2;
    uint64_t v28 = ~v11;
    uint64_t v25 = v6;
    uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v14 = v6 + 16;
    unint64_t v13 = v15;
    uint64_t v16 = *(void *)(v14 + 56);
    while (1)
    {
      v13(v8, *(void *)(v9 + 48) + v16 * v12, v5);
      sub_23D4C3394(&qword_26AF50200, MEMORY[0x263F568B0]);
      char v17 = sub_23D4CEE50();
      (*(void (**)(char *, uint64_t))(v14 - 8))(v8, v5);
      if (v17) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v28;
      if (((*(void *)(v29 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v18 = 1;
        a2 = v27;
        return __swift_storeEnumTagSinglePayload(a2, v18, 1, v5);
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v19 = v26;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v19;
    uint64_t v31 = *v19;
    *unint64_t v19 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_23D4C3A78();
      uint64_t v21 = v31;
    }
    unint64_t v22 = *(void *)(v21 + 48) + v16 * v12;
    a2 = v27;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v25 + 32))(v27, v22, v5);
    sub_23D4C44CC(v12);
    *unint64_t v19 = v31;
    swift_bridgeObjectRelease();
    uint64_t v18 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v18 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v18, 1, v5);
}

void *sub_23D4C3A78()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_23D4CE950();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B108);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_23D4CF0B0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_30:
    uint64_t *v1 = v8;
    return result;
  }
  unint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  uint64_t v24 = v1;
  uint64_t v25 = (const void *)(v6 + 56);
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    unint64_t result = memmove(result, v25, 8 * v10);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = *(void *)(v6 + 56);
  uint64_t v15 = -1;
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  unint64_t v16 = v15 & v14;
  int64_t v26 = (unint64_t)(v13 + 63) >> 6;
  if ((v15 & v14) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v17 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (unint64_t i = v17 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v12 << 6))
  {
    unint64_t v22 = *(void *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v22, v2);
    unint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v22, v5, v2);
    if (v16) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v19 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v25 + v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v26) {
        goto LABEL_28;
      }
      unint64_t v20 = *((void *)v25 + v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v26) {
          goto LABEL_28;
        }
        unint64_t v20 = *((void *)v25 + v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v16 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v26)
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_30;
  }
  unint64_t v20 = *((void *)v25 + v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v25 + v12);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_23D4C3D28()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_23D4CE950();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B108);
  uint64_t v7 = sub_23D4CF0C0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  uint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  if (!v12) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v17 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    uint64_t v22 = v6;
    uint64_t v23 = *(void *)(v6 + 48);
    uint64_t v24 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v23 + v24 * i, v2);
    sub_23D4C3394(&qword_26AF501F8, MEMORY[0x263F568B0]);
    uint64_t result = sub_23D4CEE40();
    uint64_t v25 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6))) == 0)
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        BOOL v31 = v27 == v30;
        if (v27 == v30) {
          unint64_t v27 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v27);
        if (v32 != -1)
        {
          unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v13 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v28 * v24, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v22;
    if (v12) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v19 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      goto LABEL_36;
    }
    if (v19 >= v36) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v19);
    ++v16;
    if (!v20)
    {
      int64_t v16 = v19 + 1;
      if (v19 + 1 >= v36) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v35 + 8 * v16);
      if (!v20)
      {
        int64_t v16 = v19 + 2;
        if (v19 + 2 >= v36) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v35 + 8 * v16);
        if (!v20) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v12 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v36)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v35 + 8 * v21);
  if (v20)
  {
    int64_t v16 = v21;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v16 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v16);
    ++v21;
    if (v20) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23D4C40D4()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_23D4CE950();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B108);
  uint64_t v5 = sub_23D4CF0C0();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v16 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    int64_t v40 = v13;
    for (unint64_t i = v16 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v20 << 6))
    {
      uint64_t v22 = v4;
      uint64_t v23 = *(void *)(v4 + 48);
      uint64_t v24 = *(void *)(v39 + 72);
      uint64_t v25 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v25(v14, v23 + v24 * i, v15);
      uint64_t v6 = v38;
      sub_23D4C3394(&qword_26AF501F8, MEMORY[0x263F568B0]);
      uint64_t result = sub_23D4CEE40();
      uint64_t v26 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) == 0)
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v26) >> 6;
        while (++v28 != v31 || (v30 & 1) == 0)
        {
          BOOL v32 = v28 == v31;
          if (v28 == v31) {
            unint64_t v28 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v28);
          if (v33 != -1)
          {
            unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(void *)(v6 + 48) + v29 * v24, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v22;
      int64_t v13 = v40;
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v18 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_38;
      }
      if (v18 >= v36) {
        goto LABEL_32;
      }
      unint64_t v19 = v37[v18];
      int64_t v20 = v13 + 1;
      if (!v19)
      {
        int64_t v20 = v13 + 2;
        if (v13 + 2 >= v36) {
          goto LABEL_32;
        }
        unint64_t v19 = v37[v20];
        if (!v19)
        {
          int64_t v20 = v13 + 3;
          if (v13 + 3 >= v36) {
            goto LABEL_32;
          }
          unint64_t v19 = v37[v20];
          if (!v19)
          {
            uint64_t v21 = v13 + 4;
            if (v13 + 4 >= v36)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v35;
              uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
              if (v34 > 63) {
                sub_23D4C47BC(0, (unint64_t)(v34 + 63) >> 6, v37);
              }
              else {
                *uint64_t v37 = -1 << v34;
              }
              *(void *)(v4 + 16) = 0;
              break;
            }
            unint64_t v19 = v37[v21];
            if (!v19)
            {
              while (1)
              {
                int64_t v20 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_39;
                }
                if (v20 >= v36) {
                  goto LABEL_32;
                }
                unint64_t v19 = v37[v20];
                ++v21;
                if (v19) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v20 = v13 + 4;
          }
        }
      }
LABEL_20:
      unint64_t v10 = (v19 - 1) & v19;
      int64_t v40 = v20;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_23D4C44CC(int64_t a1)
{
  uint64_t v3 = sub_23D4CE950();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v9 = *v1 + 56;
  uint64_t v10 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(v9 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v34 = v1;
    uint64_t v12 = ~v10;
    swift_retain();
    uint64_t v13 = sub_23D4CF0A0();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v36 = (v13 + 1) & v12;
      uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
      uint64_t v14 = v4 + 16;
      uint64_t v35 = v15;
      uint64_t v16 = *(void *)(v14 + 56);
      uint64_t v37 = v14;
      uint64_t v38 = v16;
      unint64_t v17 = (void (**)(char *, uint64_t))(v14 - 8);
      do
      {
        uint64_t v18 = v9;
        int64_t v19 = v38 * v11;
        v35(v7, *(void *)(v8 + 48) + v38 * v11, v3);
        sub_23D4C3394(&qword_26AF501F8, MEMORY[0x263F568B0]);
        uint64_t v20 = sub_23D4CEE40();
        (*v17)(v7, v3);
        unint64_t v21 = v20 & v12;
        if (a1 >= (uint64_t)v36)
        {
          if (v21 < v36 || a1 < (uint64_t)v21)
          {
LABEL_20:
            uint64_t v9 = v18;
            goto LABEL_24;
          }
        }
        else if (v21 < v36 && a1 < (uint64_t)v21)
        {
          goto LABEL_20;
        }
        uint64_t v23 = *(void *)(v8 + 48);
        int64_t v24 = v38 * a1;
        unint64_t v25 = v23 + v38 * a1;
        unint64_t v26 = v23 + v19 + v38;
        BOOL v27 = v38 * a1 < v19 || v25 >= v26;
        uint64_t v9 = v18;
        if (v27)
        {
          swift_arrayInitWithTakeFrontToBack();
LABEL_23:
          a1 = v11;
          goto LABEL_24;
        }
        a1 = v11;
        if (v24 != v19)
        {
          swift_arrayInitWithTakeBackToFront();
          goto LABEL_23;
        }
LABEL_24:
        unint64_t v11 = (v11 + 1) & v12;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    *(void *)(v9 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v34;
  }
  else
  {
    *(void *)(v9 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v29 = *v1;
  uint64_t v30 = *(void *)(*v1 + 16);
  BOOL v31 = __OFSUB__(v30, 1);
  uint64_t v32 = v30 - 1;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v29 + 16) = v32;
    ++*(_DWORD *)(v29 + 36);
  }
  return result;
}

uint64_t sub_23D4C47BC(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_23D4C47D8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_23D4CE950();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_23D4C40D4();
  }
  else
  {
    if (v11 > v10)
    {
      sub_23D4C3A78();
      goto LABEL_12;
    }
    sub_23D4C3D28();
  }
  uint64_t v12 = *v3;
  sub_23D4C3394(&qword_26AF501F8, MEMORY[0x263F568B0]);
  uint64_t v13 = sub_23D4CEE40();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_23D4C3394(&qword_26AF50200, MEMORY[0x263F568B0]);
      char v21 = sub_23D4CEE50();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_23D4CF230();
  __break(1u);
  return result;
}

uint64_t sub_23D4C4A78(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B0E8);
  uint64_t v2 = sub_23D4CF1E0();
  uint64_t v17 = v2;
  sub_23D4CF170();
  uint64_t v3 = sub_23D4CF190();
  if (!v3)
  {
LABEL_16:
    swift_release();
    return v2;
  }
  uint64_t v4 = v3;
  sub_23D4C33DC(0, &qword_26AF502A0);
  while (1)
  {
    swift_dynamicCast();
    sub_23D4C33DC(0, &qword_268C0B0B0);
    swift_dynamicCast();
    uint64_t v2 = v17;
    unint64_t v5 = *(void *)(v17 + 16);
    if (*(void *)(v17 + 24) <= v5)
    {
      sub_23D4C4CFC(v5 + 1, 1);
      uint64_t v2 = v17;
    }
    uint64_t result = sub_23D4CF040();
    uint64_t v7 = v2 + 64;
    uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v9 = result & ~v8;
    unint64_t v10 = v9 >> 6;
    if (((-1 << v9) & ~*(void *)(v2 + 64 + 8 * (v9 >> 6))) == 0) {
      break;
    }
    unint64_t v11 = __clz(__rbit64((-1 << v9) & ~*(void *)(v2 + 64 + 8 * (v9 >> 6)))) | v9 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(void *)(v7 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v2 + 48) + 8 * v11) = v16;
    *(void *)(*(void *)(v2 + 56) + 8 * v11) = v4;
    ++*(void *)(v2 + 16);
    uint64_t v4 = sub_23D4CF190();
    if (!v4) {
      goto LABEL_16;
    }
  }
  char v12 = 0;
  unint64_t v13 = (unint64_t)(63 - v8) >> 6;
  while (++v10 != v13 || (v12 & 1) == 0)
  {
    BOOL v14 = v10 == v13;
    if (v10 == v13) {
      unint64_t v10 = 0;
    }
    v12 |= v14;
    uint64_t v15 = *(void *)(v7 + 8 * v10);
    if (v15 != -1)
    {
      unint64_t v11 = __clz(__rbit64(~v15)) + (v10 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_23D4C4CB8(uint64_t a1)
{
  uint64_t v2 = sub_23D4CF040();
  return sub_23D4C54C8(a1, v2);
}

uint64_t sub_23D4C4CFC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B0E8);
  uint64_t v6 = sub_23D4CF1D0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = v2;
    uint64_t v35 = v5 + 64;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v11 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v15 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v14 << 6))
    {
      char v21 = *(void **)(*(void *)(v5 + 48) + 8 * i);
      uint64_t v22 = *(void **)(*(void *)(v5 + 56) + 8 * i);
      if ((a2 & 1) == 0)
      {
        id v23 = v21;
        id v24 = v22;
      }
      uint64_t result = sub_23D4CF040();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v12 + 8 * (v26 >> 6))) == 0)
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v25) >> 6;
        while (++v27 != v30 || (v29 & 1) == 0)
        {
          BOOL v31 = v27 == v30;
          if (v27 == v30) {
            unint64_t v27 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v12 + 8 * v27);
          if (v32 != -1)
          {
            unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v12 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
      *(void *)(*(void *)(v7 + 48) + 8 * v28) = v21;
      *(void *)(*(void *)(v7 + 56) + 8 * v28) = v22;
      ++*(void *)(v7 + 16);
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v17 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_41;
      }
      if (v17 >= v11) {
        break;
      }
      uint64_t v18 = (void *)(v5 + 64);
      unint64_t v19 = *(void *)(v35 + 8 * v17);
      ++v14;
      if (!v19)
      {
        int64_t v14 = v17 + 1;
        if (v17 + 1 >= v11) {
          goto LABEL_32;
        }
        unint64_t v19 = *(void *)(v35 + 8 * v14);
        if (!v19)
        {
          int64_t v20 = v17 + 2;
          if (v20 >= v11)
          {
LABEL_32:
            swift_release();
            uint64_t v3 = v34;
            if ((a2 & 1) == 0) {
              goto LABEL_39;
            }
            goto LABEL_35;
          }
          unint64_t v19 = *(void *)(v35 + 8 * v20);
          if (!v19)
          {
            while (1)
            {
              int64_t v14 = v20 + 1;
              if (__OFADD__(v20, 1)) {
                goto LABEL_42;
              }
              if (v14 >= v11) {
                goto LABEL_32;
              }
              unint64_t v19 = *(void *)(v35 + 8 * v14);
              ++v20;
              if (v19) {
                goto LABEL_18;
              }
            }
          }
          int64_t v14 = v20;
        }
      }
LABEL_18:
      unint64_t v10 = (v19 - 1) & v19;
    }
    swift_release();
    uint64_t v3 = v34;
    uint64_t v18 = (void *)(v5 + 64);
    if ((a2 & 1) == 0) {
      goto LABEL_39;
    }
LABEL_35:
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    if (v33 >= 64) {
      sub_23D4C47BC(0, (unint64_t)(v33 + 63) >> 6, v18);
    }
    else {
      *uint64_t v18 = -1 << v33;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_23D4C4FC0(uint64_t a1, void *a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v5 = (void *)*v2;
  unint64_t v6 = sub_23D4C4CB8((uint64_t)a2);
  if (__OFADD__(v5[2], (v7 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v8 = v6;
  char v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B0E0);
  if ((sub_23D4CF160() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v10 = sub_23D4C4CB8((uint64_t)a2);
  if ((v9 & 1) != (v11 & 1))
  {
LABEL_11:
    sub_23D4C33DC(0, &qword_26AF502A0);
    sub_23D4CF240();
    __break(1u);
    return;
  }
  unint64_t v8 = v10;
LABEL_5:
  uint64_t v12 = *v3;
  if (v9)
  {
    uint64_t v13 = v12[7];

    *(void *)(v13 + 8 * v8) = a1;
  }
  else
  {
    sub_23D4C5484(v8, (uint64_t)a2, a1, v12);
    id v14 = a2;
  }
}

uint64_t sub_23D4C50E8()
{
  return sub_23D4C58F0(&qword_268C0B0C0, &qword_268C0B0C8);
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

unint64_t sub_23D4C5170()
{
  unint64_t result = qword_268C0B0D0;
  if (!qword_268C0B0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C0B0D0);
  }
  return result;
}

id sub_23D4C51BC@<X0>(unsigned char *a1@<X8>)
{
  id result = MPCPlaybackIntent.isInGroupSession.getter();
  *a1 = result & 1;
  return result;
}

void sub_23D4C51EC(char *a1)
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *id result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MusicPlaybackError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MusicPlaybackError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 3;
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
        JUMPOUT(0x23D4C5378);
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
          *id result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_23D4C53A0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23D4C53A8(unsigned char *result, char a2)
{
  *id result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MusicPlaybackError()
{
  return &type metadata for MusicPlaybackError;
}

uint64_t sub_23D4C53C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_23D4C5420(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23D4C5484(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
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

unint64_t sub_23D4C54C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_23D4C33DC(0, &qword_26AF502A0);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_23D4CF050();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_23D4CF050();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_23D4C55E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23D4C5644()
{
  return sub_23D4C3394(&qword_268C0B120, MEMORY[0x263F56CE8]);
}

uint64_t sub_23D4C568C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23D4C207C(a1, a2, a3, MEMORY[0x263F56CE8], &qword_268C0B120, MEMORY[0x263F56CE8]);
}

uint64_t sub_23D4C56E8()
{
  return sub_23D4C3394(&qword_268C0B138, MEMORY[0x263F56CB8]);
}

uint64_t sub_23D4C5730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23D4C207C(a1, a2, a3, MEMORY[0x263F56CB8], &qword_268C0B138, MEMORY[0x263F56CB8]);
}

uint64_t sub_23D4C578C()
{
  return sub_23D4C3394(&qword_268C0B150, MEMORY[0x263F56DC8]);
}

uint64_t sub_23D4C57D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23D4C207C(a1, a2, a3, MEMORY[0x263F56DC8], &qword_268C0B150, MEMORY[0x263F56DC8]);
}

uint64_t sub_23D4C5830()
{
  return sub_23D4C3394(&qword_268C0B168, MEMORY[0x263F56B10]);
}

uint64_t sub_23D4C5878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23D4C207C(a1, a2, a3, MEMORY[0x263F56B10], &qword_268C0B168, MEMORY[0x263F56B10]);
}

uint64_t sub_23D4C58D4()
{
  return MEMORY[0x263F13C28];
}

uint64_t sub_23D4C58E4(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_23D4C58F0(unint64_t *a1, uint64_t *a2)
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

void sub_23D4C5934(uint64_t a1, void *a2)
{
  id v3 = (id)sub_23D4CEFB0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setStoreIDs_, v3);
}

uint64_t sub_23D4C59A0(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0();
  v3();
  return a1;
}

uint64_t sub_23D4C59F4@<X0>(uint64_t *a1@<X8>)
{
  return sub_23D4BCC6C(a1);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_23D4CEE50();
}

void OUTLINED_FUNCTION_5_0()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t a1)
{
  return a1 - 8;
}

double OUTLINED_FUNCTION_13_0()
{
  *(void *)(v0 - 144) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 - 176) = 0u;
  *(_OWORD *)(v0 - 160) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_23D4CF1B0();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

double OUTLINED_FUNCTION_19()
{
  double result = 0.0;
  *(_OWORD *)(v0 - 176) = 0u;
  *(_OWORD *)(v0 - 160) = 0u;
  *(void *)(v0 - 144) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

void OUTLINED_FUNCTION_24(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_27@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

double OUTLINED_FUNCTION_31()
{
  *(void *)(v0 - 96) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  return result;
}

void OUTLINED_FUNCTION_32()
{
}

uint64_t OUTLINED_FUNCTION_37(uint64_t a1)
{
  *(void *)(v1 - 176) = a1;
  return v1 - 176;
}

uint64_t OUTLINED_FUNCTION_40(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_23D4CF1B0();
}

void OUTLINED_FUNCTION_42(__n128 a1)
{
  *(__n128 *)(v1 - 144) = a1;
  sub_23D4BC174();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_48(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

double OUTLINED_FUNCTION_52()
{
  double result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  *(void *)(v0 - 96) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_53()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_23D4CEED0();
}

uint64_t *OUTLINED_FUNCTION_55(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v1 - 128));
}

uint64_t OUTLINED_FUNCTION_56()
{
  return MEMORY[0x270F4D420](1, v0);
}

uint64_t OUTLINED_FUNCTION_57()
{
  return v0;
}

void OUTLINED_FUNCTION_58()
{
  *(void *)(v0 - 128) = 0;
  *(void *)(v0 - 120) = 0xE000000000000000;
}

uint64_t OUTLINED_FUNCTION_60()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_61()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_65()
{
  return sub_23D4CEF70();
}

uint64_t OUTLINED_FUNCTION_66()
{
  uint64_t v3 = *(void *)(v1 - 280);
  return sub_23D4C379C(v0, v3);
}

uint64_t OUTLINED_FUNCTION_68()
{
  return v0 - 176;
}

uint64_t OUTLINED_FUNCTION_69@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_74()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_75()
{
  return sub_23D4CECE0();
}

uint64_t OUTLINED_FUNCTION_77()
{
  __swift_project_boxed_opaque_existential_1((void *)(v0 - 128), *(void *)(v0 - 104));
  return sub_23D4CE950();
}

uint64_t OUTLINED_FUNCTION_79()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_80()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_81()
{
  return sub_23D4BAE78((long long *)(v0 - 176), v0 - 128);
}

uint64_t OUTLINED_FUNCTION_83()
{
  return v0 - 128;
}

uint64_t OUTLINED_FUNCTION_84()
{
  return swift_dynamicCastObjCClass();
}

uint64_t OUTLINED_FUNCTION_85()
{
  return v0;
}

uint64_t sub_23D4C6098(uint64_t a1)
{
  return sub_23D4C6148(a1, qword_26AF50450);
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

uint64_t sub_23D4C6128(uint64_t a1)
{
  return sub_23D4C6148(a1, qword_268C0B350);
}

uint64_t sub_23D4C6148(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_23D4CEAC0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_23D4CEAB0();
}

id MusicPlaybackIntentDescriptor.playbackIntent.getter()
{
  return *v0;
}

uint64_t MusicPlaybackIntentDescriptor.playbackMetrics.getter()
{
  OUTLINED_FUNCTION_17_0();
  uint64_t v2 = type metadata accessor for MusicPlaybackIntentDescriptor();
  return sub_23D4C53C0(v1 + *(int *)(v2 + 20), v0, &qword_268C0B198);
}

uint64_t type metadata accessor for MusicPlaybackIntentDescriptor()
{
  uint64_t result = qword_268C0B1B8;
  if (!qword_268C0B1B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23D4C624C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for MusicPlaybackIntentDescriptor();
  return sub_23D4C53C0(a1 + *(int *)(v4 + 20), a2, &qword_268C0B198);
}

uint64_t sub_23D4C6290(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B198);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D4C53C0(a1, (uint64_t)v4, &qword_268C0B198);
  return MusicPlaybackIntentDescriptor.playbackMetrics.setter((uint64_t)v4);
}

uint64_t MusicPlaybackIntentDescriptor.playbackMetrics.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for MusicPlaybackIntentDescriptor();
  sub_23D4C6370(a1, v1 + *(int *)(v3 + 20));
  sub_23D4C63D8();
  return sub_23D4C8140(a1, &qword_268C0B198);
}

uint64_t sub_23D4C6370(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B198);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_23D4C63D8()
{
  uint64_t v1 = sub_23D4CEEA0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23D4CE970();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = *v0;
  uint64_t v10 = (uint64_t)v0 + *(int *)(type metadata accessor for MusicPlaybackIntentDescriptor() + 20);
  if (__swift_getEnumTagSinglePayload(v10, 1, v5))
  {
    id v11 = v9;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v10, v5);
    id v13 = v9;
    sub_23D4CE960();
    uint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if (v15)
    {
      sub_23D4CEE90();
      uint64_t v16 = sub_23D4CEE80();
      unint64_t v18 = v17;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      if (v18 >> 60 != 15)
      {
        uint64_t v12 = (void *)sub_23D4CE860();
        sub_23D4C9108(v16, v18);
        goto LABEL_4;
      }
    }
  }
  uint64_t v12 = 0;
LABEL_4:
  objc_msgSend(v9, sel_setPlayActivityRecommendationData_, v12);
}

void (*MusicPlaybackIntentDescriptor.playbackMetrics.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  type metadata accessor for MusicPlaybackIntentDescriptor();
  return sub_23D4C6660;
}

void sub_23D4C6660(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_23D4C63D8();
  }
}

uint64_t MusicPlaybackIntentDescriptor.donate()()
{
  OUTLINED_FUNCTION_2();
  v1[4] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50218);
  OUTLINED_FUNCTION_12_0(v2);
  v1[5] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50210);
  OUTLINED_FUNCTION_12_0(v3);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23D4C6744, 0, 0);
}

uint64_t sub_23D4C6744()
{
  uint64_t v1 = **(void ***)(v0 + 32);
  sub_23D4C6BF0((uint64_t)objc_msgSend(v1, sel_repeatMode), 0);
  sub_23D4C6E1C((uint64_t)objc_msgSend(v1, sel_shuffleMode), 0);
  type metadata accessor for MusicPlaybackIntentDescriptor();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_23D4C6834;
  return sub_23D4B9354();
}

uint64_t sub_23D4C6834()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  *(void *)(v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_23D4C69AC;
  }
  else {
    uint64_t v2 = sub_23D4C6920;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23D4C6920()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = v0[6];
  sub_23D4C8140(v0[5], &qword_26AF50218);
  sub_23D4C8140(v1, &qword_26AF50210);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_23D4C69AC()
{
  unint64_t v18 = v0;
  if (qword_26AF501E0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[8];
  uint64_t v2 = sub_23D4CEAC0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26AF50450);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_23D4CEAA0();
  os_log_type_t v6 = sub_23D4CF020();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[8];
  if (v7)
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)id v9 = 136446210;
    v0[2] = v8;
    id v10 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B050);
    uint64_t v11 = sub_23D4CEEB0();
    v0[3] = sub_23D4C2BF8(v11, v12, &v17);
    sub_23D4CF080();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23D4B6000, v5, v6, "Unable to donate playback event due to %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_6();
  }
  else
  {
  }
  uint64_t v13 = v0[5];
  uint64_t v14 = v0[6];
  swift_willThrow();
  sub_23D4C8140(v13, &qword_26AF50218);
  sub_23D4C8140(v14, &qword_26AF50210);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_23D4C6BF0(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_17_0();
  uint64_t v5 = sub_23D4CEA10();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_1();
  if (a2)
  {
LABEL_9:
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v7 = a1 + 1;
    uint64_t v8 = 1;
    switch(v7)
    {
      case 0:
        return __swift_storeEnumTagSinglePayload(v2, v8, 1, v5);
      case 1:
      case 2:
      case 3:
        uint64_t v17 = OUTLINED_FUNCTION_3_1();
        v18(v17);
        uint64_t v19 = OUTLINED_FUNCTION_5_1();
        v20(v19);
        uint64_t v8 = 0;
        break;
      default:
        if (qword_26AF501E0 != -1) {
          swift_once();
        }
        uint64_t v9 = sub_23D4CEAC0();
        __swift_project_value_buffer(v9, (uint64_t)qword_26AF50450);
        id v10 = sub_23D4CEAA0();
        os_log_type_t v11 = sub_23D4CF020();
        if (!os_log_type_enabled(v10, v11))
        {

          goto LABEL_9;
        }
        swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        OUTLINED_FUNCTION_11_1(4.8751e-34);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B1E0);
        uint64_t v12 = sub_23D4CEEB0();
        uint64_t v8 = v13;
        uint64_t v14 = sub_23D4C2BF8(v12, v13, &v22);
        OUTLINED_FUNCTION_10_1(v14);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_16_0(&dword_23D4B6000, v15, v16, "Unhandled value of MPCPlaybackIntentRepeatMode: %{public}s.");
        OUTLINED_FUNCTION_15_0();
        OUTLINED_FUNCTION_6();
        OUTLINED_FUNCTION_6();

        break;
    }
  }
  return __swift_storeEnumTagSinglePayload(v2, v8, 1, v5);
}

uint64_t sub_23D4C6E1C(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_17_0();
  uint64_t v5 = sub_23D4CEA20();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_1();
  if (a2)
  {
LABEL_9:
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v7 = a1 + 1;
    uint64_t v8 = 1;
    switch(v7)
    {
      case 0:
        return __swift_storeEnumTagSinglePayload(v2, v8, 1, v5);
      case 1:
      case 2:
      case 3:
        uint64_t v17 = OUTLINED_FUNCTION_3_1();
        v18(v17);
        uint64_t v19 = OUTLINED_FUNCTION_5_1();
        v20(v19);
        uint64_t v8 = 0;
        break;
      default:
        if (qword_26AF501E0 != -1) {
          swift_once();
        }
        uint64_t v9 = sub_23D4CEAC0();
        __swift_project_value_buffer(v9, (uint64_t)qword_26AF50450);
        id v10 = sub_23D4CEAA0();
        os_log_type_t v11 = sub_23D4CF020();
        if (!os_log_type_enabled(v10, v11))
        {

          goto LABEL_9;
        }
        swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        OUTLINED_FUNCTION_11_1(4.8751e-34);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B1D8);
        uint64_t v12 = sub_23D4CEEB0();
        uint64_t v8 = v13;
        uint64_t v14 = sub_23D4C2BF8(v12, v13, &v22);
        OUTLINED_FUNCTION_10_1(v14);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_16_0(&dword_23D4B6000, v15, v16, "Unhandled value of MPCPlaybackIntentShuffleMode: %{public}s.");
        OUTLINED_FUNCTION_15_0();
        OUTLINED_FUNCTION_6();
        OUTLINED_FUNCTION_6();

        break;
    }
  }
  return __swift_storeEnumTagSinglePayload(v2, v8, 1, v5);
}

uint64_t static MusicPlaybackIntentDescriptor.deleteIntentDonations()()
{
  return MEMORY[0x270FA2498](sub_23D4C7064, 0, 0);
}

uint64_t sub_23D4C7064()
{
  OUTLINED_FUNCTION_2();
  if (qword_26AF502B0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_23D4CE9D0();
  void *v1 = v0;
  v1[1] = sub_23D4C7134;
  uint64_t v3 = MEMORY[0x263F56A38];
  return MEMORY[0x270F4C960](v2, v3);
}

uint64_t sub_23D4C7134()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t MusicPlaybackIntentDescriptor.init<A>(item:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = sub_23D4CF060();
  uint64_t v9 = OUTLINED_FUNCTION_12_0(v8);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v11 = (char *)&v18 - v10;
  sub_23D4C7FD8(a2, a2);
  uint64_t v12 = *(void *)(a2 - 8);
  swift_allocObject();
  uint64_t v13 = sub_23D4CEFD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v14, a1, a2);
  uint64_t v15 = sub_23D4CEFE0();
  uint64_t v19 = v13;
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, a2);
  uint64_t WitnessTable = swift_getWitnessTable();
  MusicPlaybackIntentDescriptor.init<A, B>(items:startingAt:)((uint64_t)&v19, (uint64_t)v11, v15, a2, WitnessTable, a3, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(a1, a2);
}

void *MusicPlaybackIntentDescriptor.init<A, B>(items:startingAt:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v59 = a6;
  uint64_t v57 = a5;
  uint64_t v60 = a2;
  uint64_t v65 = a1;
  uint64_t v52 = a7;
  uint64_t v9 = sub_23D4CF060();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_4_0();
  uint64_t v53 = v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v48 - v15;
  OUTLINED_FUNCTION_0_0();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_4_0();
  uint64_t v50 = v20;
  MEMORY[0x270FA5388](v21);
  id v23 = (char *)&v48 - v22;
  sub_23D4C803C();
  uint64_t v54 = v18;
  id v24 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v24(v23, v65, a3);
  uint64_t v55 = v11;
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  uint64_t v56 = v9;
  uint64_t v51 = v25;
  v25((uint64_t)v16, v60, v9);
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  unint64_t v28 = v58;
  MPCPlaybackIntent.init<A, B>(for:startingAt:)();
  if (v28)
  {
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v60, v56);
    return (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v54 + 8))(v65, v26);
  }
  else
  {
    uint64_t v49 = v29;
    uint64_t v58 = v62;
    v24(v50, v65, v26);
    sub_23D4CEFF0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
    uint64_t v31 = sub_23D4CF140();
    swift_bridgeObjectRelease();
    uint64_t v61 = v31;
    uint64_t v32 = v53;
    v51(v53, v60, v56);
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v32, 1, v27);
    uint64_t v34 = v52;
    if (EnumTagSinglePayload == 1)
    {
      uint64_t v35 = *(void (**)(void))(v55 + 8);
      OUTLINED_FUNCTION_7_1();
      v35();
      uint64_t v36 = OUTLINED_FUNCTION_14_0();
      v37(v36);
      OUTLINED_FUNCTION_7_1();
      v35();
      uint64_t v38 = v58;
      v58[4] = 0;
      *(_OWORD *)uint64_t v38 = 0u;
      *((_OWORD *)v38 + 1) = 0u;
    }
    else
    {
      v62[3] = v27;
      v62[4] = v59;
      __swift_allocate_boxed_opaque_existential_1(v58);
      OUTLINED_FUNCTION_8_0();
      (*(void (**)(void))(v39 + 32))();
      OUTLINED_FUNCTION_7_1();
      v40();
      uint64_t v41 = OUTLINED_FUNCTION_14_0();
      v42(v41);
    }
    char v63 = 1;
    sub_23D4C807C((uint64_t)&v61, (uint64_t)__src);
    uint64_t v43 = type metadata accessor for MusicPlaybackIntentDescriptor();
    uint64_t v44 = (uint64_t)v34 + *(int *)(v43 + 20);
    uint64_t v45 = sub_23D4CE970();
    OUTLINED_FUNCTION_13_1(v44, v46, v47, v45);
    *uint64_t v34 = v49;
    return memcpy((char *)v34 + *(int *)(v43 + 24), __src, 0x51uLL);
  }
}

uint64_t MusicPlaybackIntentDescriptor.init(container:startingAt:playbackSource:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50240);
  uint64_t v11 = OUTLINED_FUNCTION_12_0(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_2_1();
  uint64_t v12 = a1[3];
  uint64_t v13 = __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_23D4C803C();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_29();
  (*(void (**)(uint64_t, void *, uint64_t))(v15 + 16))(v5, v13, v12);
  sub_23D4C53C0(a2, (uint64_t)&v26, &qword_26AF50248);
  sub_23D4C53C0(a3, v4, &qword_26AF50240);
  MPCPlaybackIntent.init<A>(container:startingAt:playbackSource:)();
  uint64_t v25 = v16;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF502C0);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_23D4CF940;
  uint64_t v19 = a1[3];
  uint64_t v18 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v19);
  *(void *)(v17 + 56) = v19;
  *(void *)(v17 + 64) = *(void *)(v18 + 8);
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v17 + 32));
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(void))(v20 + 16))();
  sub_23D4C8140(a3, &qword_26AF50240);
  uint64_t v26 = v17;
  sub_23D4C80D8(a2, (uint64_t)v27);
  v27[72] = 1;
  uint64_t v21 = type metadata accessor for MusicPlaybackIntentDescriptor();
  sub_23D4C807C((uint64_t)&v26, (uint64_t)a4 + *(int *)(v21 + 24));
  uint64_t v22 = (uint64_t)a4 + *(int *)(v21 + 20);
  uint64_t v23 = sub_23D4CE970();
  __swift_storeEnumTagSinglePayload(v22, 1, 1, v23);
  *a4 = v25;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t MusicPlaybackIntentDescriptor.init(station:)()
{
  OUTLINED_FUNCTION_17_0();
  sub_23D4C803C();
  id v1 = static MPCPlaybackIntent.radioPlaybackIntent(for:)();
  uint64_t v2 = type metadata accessor for MusicPlaybackIntentDescriptor();
  uint64_t v3 = (char *)v0 + *(int *)(v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF502C0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23D4CF940;
  uint64_t v5 = sub_23D4CEDF0();
  uint64_t v6 = MEMORY[0x263F13D08];
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 64) = v6;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v4 + 32));
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(void))(v7 + 32))();
  *(void *)uint64_t v3 = v4;
  *(_OWORD *)(v3 + 8) = 0u;
  *(_OWORD *)(v3 + 24) = 0u;
  *((void *)v3 + 5) = 0;
  v3[80] = 1;
  uint64_t v8 = (uint64_t)v0 + *(int *)(v2 + 20);
  uint64_t v9 = sub_23D4CE970();
  uint64_t result = __swift_storeEnumTagSinglePayload(v8, 1, 1, v9);
  *uint64_t v0 = v1;
  return result;
}

uint64_t MusicPlaybackIntentDescriptor.init(stationSeed:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23D4C803C();
  static MPCPlaybackIntent.radioPlaybackIntent<A>(from:)();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = type metadata accessor for MusicPlaybackIntentDescriptor();
    uint64_t v7 = (uint64_t)a2 + *(int *)(v6 + 24);
    sub_23D4C8198((uint64_t)a1, v7);
    *(unsigned char *)(v7 + 80) = 3;
    uint64_t v8 = (uint64_t)a2 + *(int *)(v6 + 20);
    uint64_t v9 = sub_23D4CE970();
    OUTLINED_FUNCTION_13_1(v8, v10, v11, v9);
    *a2 = v5;
  }
  else
  {
    sub_23D4C3348();
    swift_allocError();
    *uint64_t v13 = 2;
    swift_willThrow();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void MusicPlaybackIntentDescriptor.init(from:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B1B0);
  uint64_t v6 = OUTLINED_FUNCTION_12_0(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &__src[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v9 = sub_23D4CE930();
  OUTLINED_FUNCTION_0_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_29();
  sub_23D4CE920();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_23D4C8140((uint64_t)v8, &qword_268C0B1B0);
    sub_23D4C3348();
    swift_allocError();
    *uint64_t v13 = 1;
    swift_willThrow();
  }
  else
  {
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(v2, v8, v9);
    id v14 = a1;
    sub_23D4CE910();
    self;
    uint64_t v15 = swift_dynamicCastObjCClass();
    if (v15)
    {
      uint64_t v16 = v15;

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v9);
      uint64_t v17 = type metadata accessor for MusicPlaybackIntentDescriptor();
      uint64_t v18 = (uint64_t)a2 + *(int *)(v17 + 20);
      uint64_t v19 = sub_23D4CE970();
      OUTLINED_FUNCTION_13_1(v18, v20, v21, v19);
      *a2 = v16;
      uint64_t v22 = (char *)a2 + *(int *)(v17 + 24);
      *(void *)uint64_t v22 = v14;
      memcpy(v22 + 8, __src, 0x48uLL);
      v22[80] = 0;
    }
    else
    {
      swift_unknownObjectRelease();
      sub_23D4CF1B0();
      __break(1u);
    }
  }
}

uint64_t MusicPlaybackIntentDescriptor.init(request:startingAt:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  _s16MusicKitInternal0A15PlayableRequestP01_abC18_MediaPlaybackCoreE14playbackIntent16withStartingItemSo011MPCPlaybackJ0CSg0aB00daM0_pSg_tF_0();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = type metadata accessor for MusicPlaybackIntentDescriptor();
    uint64_t v9 = (uint64_t)a3 + *(int *)(v8 + 24);
    sub_23D4C8198((uint64_t)a1, v9);
    sub_23D4C80D8(a2, v9 + 40);
    *(unsigned char *)(v9 + 80) = 2;
    uint64_t v10 = (uint64_t)a3 + *(int *)(v8 + 20);
    uint64_t v11 = sub_23D4CE970();
    OUTLINED_FUNCTION_13_1(v10, v12, v13, v11);
    *a3 = v7;
  }
  else
  {
    sub_23D4C3348();
    swift_allocError();
    *uint64_t v15 = 1;
    swift_willThrow();
    sub_23D4C8140(a2, &qword_26AF50248);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23D4C7FD8(uint64_t a1, uint64_t a2)
{
  if (dynamic_cast_existential_0_class_conditional(a2))
  {
    return __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B1D0);
  }
  else
  {
    return MEMORY[0x270F9F4F8]();
  }
}

unint64_t sub_23D4C803C()
{
  unint64_t result = qword_26AF501E8;
  if (!qword_26AF501E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AF501E8);
  }
  return result;
}

uint64_t sub_23D4C807C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_23D4C80D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23D4C8140(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_23D4C8198(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_8_0();
  (*v3)(a2);
  return a2;
}

void **initializeBufferWithCopyOfBuffer for MusicPlaybackIntentDescriptor(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_23D4CE970();
    uint64_t v12 = v4;
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B198);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = (char *)v7 + v14;
    uint64_t v16 = (char *)a2 + v14;
    switch(v16[80])
    {
      case 1:
        *(void *)uint64_t v15 = *(void *)v16;
        uint64_t v19 = *((void *)v16 + 4);
        swift_bridgeObjectRetain();
        if (v19)
        {
          uint64_t v20 = *((void *)v16 + 5);
          *((void *)v15 + 4) = v19;
          *((void *)v15 + 5) = v20;
          (**(void (***)(uint64_t, uint64_t, uint64_t))(v19 - 8))((uint64_t)(v15 + 8), (uint64_t)(v16 + 8), v19);
        }
        else
        {
          long long v28 = *(_OWORD *)(v16 + 24);
          *(_OWORD *)(v15 + 8) = *(_OWORD *)(v16 + 8);
          *(_OWORD *)(v15 + 24) = v28;
          *((void *)v15 + 5) = *((void *)v16 + 5);
        }
        char v27 = 1;
        goto LABEL_17;
      case 2:
        long long v21 = *(_OWORD *)(v16 + 24);
        *(_OWORD *)(v15 + 24) = v21;
        (**(void (***)(char *, char *))(v21 - 8))(v15, v16);
        uint64_t v22 = v15 + 40;
        uint64_t v23 = v16 + 40;
        uint64_t v24 = *((void *)v16 + 8);
        if (v24)
        {
          uint64_t v25 = *((void *)v16 + 9);
          *((void *)v15 + 8) = v24;
          *((void *)v15 + 9) = v25;
          (**(void (***)(_OWORD *, _OWORD *))(v24 - 8))(v22, v23);
        }
        else
        {
          long long v29 = *(_OWORD *)(v16 + 56);
          *uint64_t v22 = *v23;
          *(_OWORD *)(v15 + 56) = v29;
          *((void *)v15 + 9) = *((void *)v16 + 9);
        }
        char v27 = 2;
        goto LABEL_17;
      case 3:
        long long v26 = *(_OWORD *)(v16 + 24);
        *(_OWORD *)(v15 + 24) = v26;
        (**(void (***)(char *, char *))(v26 - 8))(v15, v16);
        char v27 = 3;
LABEL_17:
        v15[80] = v27;
        break;
      default:
        uint64_t v17 = *(void **)v16;
        *(void *)uint64_t v15 = *(void *)v16;
        v15[80] = 0;
        id v18 = v17;
        break;
    }
  }
  return v7;
}

void destroy for MusicPlaybackIntentDescriptor(id *a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_23D4CE970();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  uint64_t v6 = (uint64_t)a1 + *(int *)(a2 + 24);
  switch(*(unsigned char *)(v6 + 80))
  {
    case 0:
      uint64_t v7 = *(void **)v6;

      break;
    case 1:
      swift_bridgeObjectRelease();
      if (*(void *)(v6 + 32))
      {
        uint64_t v8 = v6 + 8;
        goto LABEL_13;
      }
      break;
    case 2:
      __swift_destroy_boxed_opaque_existential_1(v6);
      if (*(void *)(v6 + 64))
      {
        uint64_t v8 = v6 + 40;
        goto LABEL_13;
      }
      break;
    case 3:
      uint64_t v8 = v6;
LABEL_13:
      __swift_destroy_boxed_opaque_existential_1(v8);
      break;
    default:
      return;
  }
}

void **initializeWithCopy for MusicPlaybackIntentDescriptor(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_23D4CE970();
  id v11 = v6;
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B198);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  switch(v15[80])
  {
    case 1:
      *(void *)uint64_t v14 = *(void *)v15;
      uint64_t v18 = *((void *)v15 + 4);
      swift_bridgeObjectRetain();
      if (v18)
      {
        uint64_t v19 = *((void *)v15 + 5);
        *((void *)v14 + 4) = v18;
        *((void *)v14 + 5) = v19;
        (**(void (***)(uint64_t, uint64_t, uint64_t))(v18 - 8))((uint64_t)(v14 + 8), (uint64_t)(v15 + 8), v18);
      }
      else
      {
        long long v27 = *(_OWORD *)(v15 + 24);
        *(_OWORD *)(v14 + 8) = *(_OWORD *)(v15 + 8);
        *(_OWORD *)(v14 + 24) = v27;
        *((void *)v14 + 5) = *((void *)v15 + 5);
      }
      char v26 = 1;
      goto LABEL_15;
    case 2:
      long long v20 = *(_OWORD *)(v15 + 24);
      *(_OWORD *)(v14 + 24) = v20;
      (**(void (***)(char *, char *))(v20 - 8))(v14, v15);
      long long v21 = v14 + 40;
      uint64_t v22 = v15 + 40;
      uint64_t v23 = *((void *)v15 + 8);
      if (v23)
      {
        uint64_t v24 = *((void *)v15 + 9);
        *((void *)v14 + 8) = v23;
        *((void *)v14 + 9) = v24;
        (**(void (***)(_OWORD *, _OWORD *))(v23 - 8))(v21, v22);
      }
      else
      {
        long long v28 = *(_OWORD *)(v15 + 56);
        *long long v21 = *v22;
        *(_OWORD *)(v14 + 56) = v28;
        *((void *)v14 + 9) = *((void *)v15 + 9);
      }
      char v26 = 2;
      goto LABEL_15;
    case 3:
      long long v25 = *(_OWORD *)(v15 + 24);
      *(_OWORD *)(v14 + 24) = v25;
      (**(void (***)(char *, char *))(v25 - 8))(v14, v15);
      char v26 = 3;
LABEL_15:
      v14[80] = v26;
      break;
    default:
      uint64_t v16 = *(void **)v15;
      *(void *)uint64_t v14 = *(void *)v15;
      v14[80] = 0;
      id v17 = v16;
      break;
  }
  return a1;
}

void **assignWithCopy for MusicPlaybackIntentDescriptor(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  id v11 = (char *)a2 + v9;
  uint64_t v12 = sub_23D4CE970();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v15 = *(void *)(v12 - 8);
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B198);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 24))(v10, v11, v12);
LABEL_7:
  if (a1 != a2)
  {
    uint64_t v17 = *(int *)(a3 + 24);
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    sub_23D4B8A6C((uint64_t)a1 + v17);
    switch(v19[80])
    {
      case 1:
        *(void *)uint64_t v18 = *(void *)v19;
        uint64_t v22 = *((void *)v19 + 4);
        swift_bridgeObjectRetain();
        if (v22)
        {
          *((void *)v18 + 4) = v22;
          *((void *)v18 + 5) = *((void *)v19 + 5);
          (**(void (***)(uint64_t, uint64_t, uint64_t))(v22 - 8))((uint64_t)(v18 + 8), (uint64_t)(v19 + 8), v22);
        }
        else
        {
          long long v31 = *(_OWORD *)(v19 + 8);
          long long v32 = *(_OWORD *)(v19 + 24);
          *((void *)v18 + 5) = *((void *)v19 + 5);
          *(_OWORD *)(v18 + 8) = v31;
          *(_OWORD *)(v18 + 24) = v32;
        }
        char v28 = 1;
        goto LABEL_20;
      case 2:
        uint64_t v23 = *((void *)v19 + 3);
        *((void *)v18 + 3) = v23;
        *((void *)v18 + 4) = *((void *)v19 + 4);
        (**(void (***)(char *, char *))(v23 - 8))(v18, v19);
        uint64_t v24 = v18 + 40;
        long long v25 = (long long *)(v19 + 40);
        uint64_t v26 = *((void *)v19 + 8);
        if (v26)
        {
          *((void *)v18 + 8) = v26;
          *((void *)v18 + 9) = *((void *)v19 + 9);
          (**(void (***)(_OWORD *, long long *))(v26 - 8))(v24, v25);
        }
        else
        {
          long long v29 = *v25;
          long long v30 = *(_OWORD *)(v19 + 56);
          *((void *)v18 + 9) = *((void *)v19 + 9);
          *uint64_t v24 = v29;
          *(_OWORD *)(v18 + 56) = v30;
        }
        char v28 = 2;
        goto LABEL_20;
      case 3:
        uint64_t v27 = *((void *)v19 + 3);
        *((void *)v18 + 3) = v27;
        *((void *)v18 + 4) = *((void *)v19 + 4);
        (**(void (***)(char *, char *))(v27 - 8))(v18, v19);
        char v28 = 3;
LABEL_20:
        v18[80] = v28;
        break;
      default:
        long long v20 = *(void **)v19;
        *(void *)uint64_t v18 = *(void *)v19;
        v18[80] = 0;
        id v21 = v20;
        break;
    }
  }
  return a1;
}

void *initializeWithTake for MusicPlaybackIntentDescriptor(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_23D4CE970();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B198);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  memcpy((char *)a1 + *(int *)(a3 + 24), (char *)a2 + *(int *)(a3 + 24), 0x51uLL);
  return a1;
}

void **assignWithTake for MusicPlaybackIntentDescriptor(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_23D4CE970();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B198);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  if (a1 != a2)
  {
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (char *)a2 + v15;
    uint64_t v17 = (char *)a1 + v15;
    sub_23D4B8A6C((uint64_t)a1 + v15);
    memcpy(v17, v16, 0x51uLL);
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicPlaybackIntentDescriptor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23D4C8EB8);
}

uint64_t sub_23D4C8EB8(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B198);
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MusicPlaybackIntentDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23D4C8F58);
}

void *sub_23D4C8F58(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B198);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_23D4C8FDC()
{
  sub_23D4C9080();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_23D4C9080()
{
  if (!qword_268C0B1C8)
  {
    sub_23D4CE970();
    unint64_t v0 = sub_23D4CF060();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C0B1C8);
    }
  }
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

uint64_t sub_23D4C9108(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_23D4C911C(a1, a2);
  }
  return a1;
}

uint64_t sub_23D4C911C(uint64_t a1, unint64_t a2)
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

uint64_t OUTLINED_FUNCTION_3_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return sub_23D4CF080();
}

void OUTLINED_FUNCTION_11_1(float a1)
{
  *uint64_t v2 = a1;
  *(void *)(v3 - 104) = v1;
  *(unsigned char *)(v3 - 96) = 0;
}

uint64_t OUTLINED_FUNCTION_13_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return *(void *)(v0 - 72);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_16_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return 0;
}

id sub_23D4C928C()
{
  uint64_t v0 = sub_23D4CED20();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D4CED30();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  uint64_t v5 = 0;
  if (v4 == *MEMORY[0x263F138F8]) {
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x263F13908])
  {
    uint64_t v5 = 1;
LABEL_16:
    sub_23D4C94F0();
    uint64_t v6 = sub_23D4CED40();
    return sub_23D4C9530(v6, v7, v5);
  }
  if (v4 == *MEMORY[0x263F138D8])
  {
    uint64_t v5 = 2;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x263F138F0])
  {
    uint64_t v5 = 3;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x263F138E0])
  {
    uint64_t v5 = 4;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x263F138D0])
  {
    uint64_t v5 = 5;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x263F138E8])
  {
    uint64_t v5 = 6;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x263F138C8])
  {
    uint64_t v5 = 7;
    goto LABEL_16;
  }
  id result = (id)sub_23D4CF1B0();
  __break(1u);
  return result;
}

unint64_t sub_23D4C94F0()
{
  unint64_t result = qword_268C0B1E8;
  if (!qword_268C0B1E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C0B1E8);
  }
  return result;
}

id sub_23D4C9530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_23D4CEE60();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithValue_kind_, v5, a3);

  return v6;
}

id sub_23D4C95AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_63();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_23D4CED80();
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_63();
  uint64_t v18 = v17 - v16;
  unint64_t v19 = sub_23D4C96E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v18, a1, v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v11, v3, a2);
  return sub_23D4C9EFC(v11, v18, v19, a2);
}

unint64_t sub_23D4C96E4()
{
  unint64_t result = qword_268C0B1F0;
  if (!qword_268C0B1F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C0B1F0);
  }
  return result;
}

uint64_t sub_23D4C9724()
{
  uint64_t v1 = sub_23D4CED70();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_63();
  uint64_t v6 = v5 - v4;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v5 - v4, v0, v1);
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v6, v1);
  uint64_t v8 = 0;
  if (v7 == *MEMORY[0x263F13A18]) {
    return v8;
  }
  if (v7 == *MEMORY[0x263F13998]) {
    return 1;
  }
  if (v7 == *MEMORY[0x263F13A30]) {
    return 2;
  }
  if (v7 == *MEMORY[0x263F13A58]) {
    return 3;
  }
  if (v7 == *MEMORY[0x263F139A0]) {
    return 4;
  }
  if (v7 == *MEMORY[0x263F13A48]) {
    return 5;
  }
  if (v7 == *MEMORY[0x263F139A8]) {
    return 6;
  }
  if (v7 == *MEMORY[0x263F139B0]) {
    return 7;
  }
  if (v7 == *MEMORY[0x263F13A20]) {
    return 9;
  }
  if (v7 == *MEMORY[0x263F13A08]) {
    return 11;
  }
  if (v7 == *MEMORY[0x263F13A38]) {
    return 12;
  }
  if (v7 == *MEMORY[0x263F13980]) {
    return 13;
  }
  if (v7 == *MEMORY[0x263F13988]) {
    return 14;
  }
  if (v7 == *MEMORY[0x263F13A60]) {
    return 15;
  }
  if (v7 == *MEMORY[0x263F139E8]) {
    return 16;
  }
  if (v7 == *MEMORY[0x263F139B8]) {
    return 17;
  }
  if (v7 == *MEMORY[0x263F13A00]) {
    return 18;
  }
  if (v7 == *MEMORY[0x263F139F0]) {
    return 19;
  }
  if (v7 == *MEMORY[0x263F139F8]) {
    return 20;
  }
  if (v7 == *MEMORY[0x263F13A70]) {
    return 22;
  }
  if (v7 == *MEMORY[0x263F139C0]) {
    return 23;
  }
  if (v7 == *MEMORY[0x263F13990]) {
    return 24;
  }
  if (v7 == *MEMORY[0x263F139C8]) {
    return 25;
  }
  if (v7 == *MEMORY[0x263F13A10]) {
    return 26;
  }
  if (v7 == *MEMORY[0x263F13A50]) {
    return 27;
  }
  if (v7 == *MEMORY[0x263F139D0]) {
    return 29;
  }
  if (v7 == *MEMORY[0x263F13A28]) {
    return 30;
  }
  if (v7 == *MEMORY[0x263F13A78]) {
    return 31;
  }
  if (v7 == *MEMORY[0x263F13A68]) {
    return 32;
  }
  if (v7 == *MEMORY[0x263F13A40]) {
    return 33;
  }
  if (v7 == *MEMORY[0x263F139D8]) {
    return 34;
  }
  if (v7 == *MEMORY[0x263F139E0]) {
    return 35;
  }
  uint64_t result = sub_23D4CF1B0();
  __break(1u);
  return result;
}

uint64_t sub_23D4C9BA0()
{
  uint64_t v0 = sub_23D4CED80();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v10 - v4;
  uint64_t v6 = *(void (**)(void))(v2 + 16);
  OUTLINED_FUNCTION_2_2();
  v6();
  int v7 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v5, v0);
  uint64_t v8 = 0;
  if (v7 == *MEMORY[0x263F13AF8]) {
    return v8;
  }
  if (v7 == *MEMORY[0x263F13AA8]) {
    return 1;
  }
  if (v7 == *MEMORY[0x263F13A88]) {
    return 2;
  }
  if (v7 == *MEMORY[0x263F13AC0]) {
    return 3;
  }
  if (v7 == *MEMORY[0x263F13AB0]) {
    return 4;
  }
  if (v7 == *MEMORY[0x263F13A98]) {
    return 5;
  }
  if (v7 == *MEMORY[0x263F13AB8]) {
    return 6;
  }
  if (v7 == *MEMORY[0x263F13A90]) {
    return 7;
  }
  if (v7 == *MEMORY[0x263F13AA0]) {
    return 8;
  }
  if (v7 == *MEMORY[0x263F13AE8]) {
    return 9;
  }
  if (v7 == *MEMORY[0x263F13AE0]) {
    return 10;
  }
  if (v7 == *MEMORY[0x263F13AD8]) {
    return 11;
  }
  if (v7 == *MEMORY[0x263F13A80]) {
    return 12;
  }
  if (v7 == *MEMORY[0x263F13AC8]) {
    return 13;
  }
  if (v7 == *MEMORY[0x263F13AF0]) {
    return 14;
  }
  if (v7 == *MEMORY[0x263F13AD0]) {
    return 15;
  }
  OUTLINED_FUNCTION_2_2();
  v6();
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_23D4CF0D0();
  sub_23D4CEED0();
  sub_23D4CF150();
  sub_23D4CEED0();
  uint64_t result = sub_23D4CF1B0();
  __break(1u);
  return result;
}

id sub_23D4C9EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = a3;
  uint64_t v7 = sub_23D4CEC00();
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_23D4CED70();
  uint64_t v10 = *(void *)(v25 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v25);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(v15, a1, a4);
  sub_23D4CEDA0();
  sub_23D4CED90();
  uint64_t v17 = (void *)sub_23D4C9724();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v25);
  sub_23D4CECF0();
  id v18 = sub_23D4CA3AC(v17);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v27);
  id v19 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  long long v20 = (void *)sub_23D4CEE20();
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(v19, sel_initWithIdentifierSet_modelObjectType_storageDictionary_, v18, v17, v20);
  swift_unknownObjectRelease();

  uint64_t v22 = sub_23D4CED80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(a2, v22);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v15, a4);
  return v21;
}

uint64_t sub_23D4CA234(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v19 = MEMORY[0x263F8EE78];
  sub_23D4CAA4C(0, v1, 0);
  uint64_t v2 = v19;
  uint64_t result = sub_23D4CAECC(a1);
  int64_t v5 = result;
  int v7 = v6;
  char v9 = v8 & 1;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(unsigned char *)(a1 + 32))
  {
    if (((*(void *)(a1 + 56 + (((unint64_t)v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
      goto LABEL_13;
    }
    if (*(_DWORD *)(a1 + 36) != v7) {
      goto LABEL_14;
    }
    char v18 = v9;
    uint64_t v10 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v5);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    unint64_t v14 = *(void *)(v19 + 16);
    unint64_t v13 = *(void *)(v19 + 24);
    swift_bridgeObjectRetain();
    if (v14 >= v13 >> 1) {
      sub_23D4CAA4C((char *)(v13 > 1), v14 + 1, 1);
    }
    *(void *)(v19 + 16) = v14 + 1;
    uint64_t v15 = v19 + 16 * v14;
    *(void *)(v15 + 32) = v11;
    *(void *)(v15 + 40) = v12;
    uint64_t result = sub_23D4CADE8(v5, v7, v18 & 1, a1);
    int64_t v5 = result;
    int v7 = v16;
    char v9 = v17 & 1;
    if (!--v1)
    {
      sub_23D4CAF4C(result, v16, v9);
      return v2;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

id sub_23D4CA3AC(id a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50250);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  int64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  int v7 = (char *)&v51 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50228);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D4CEBC0();
  uint64_t v11 = sub_23D4CED50();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
  {
    sub_23D4C8140((uint64_t)v10, &qword_26AF50228);
    id v57 = 0;
  }
  else
  {
    id v57 = sub_23D4C928C();
    OUTLINED_FUNCTION_8_0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  sub_23D4CEBE0();
  if (v13)
  {
    id v58 = (id)sub_23D4CEE60();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v58 = 0;
  }
  sub_23D4CEB80();
  if (v14)
  {
    uint64_t v55 = (void *)sub_23D4CEE60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v55 = 0;
  }
  sub_23D4CEBB0();
  if (v15)
  {
    uint64_t v54 = (void *)sub_23D4CEE60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v54 = 0;
  }
  sub_23D4CEB70();
  if (v16)
  {
    uint64_t v53 = (void *)sub_23D4CEE60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v53 = 0;
  }
  sub_23D4CEB60();
  if (v17)
  {
    uint64_t v18 = sub_23D4CEE60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v18 = 0;
  }
  sub_23D4CEB30();
  if (v19)
  {
    uint64_t v52 = (void *)sub_23D4CEE60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v52 = 0;
  }
  sub_23D4CEB50();
  uint64_t v20 = sub_23D4CEB10();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v20);
  id v56 = a1;
  if (EnumTagSinglePayload == 1)
  {
    sub_23D4C8140((uint64_t)v7, &qword_26AF50250);
    uint64_t v51 = 0;
  }
  else
  {
    uint64_t v51 = (void *)sub_23D4CAF6C();
    OUTLINED_FUNCTION_8_0();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v20);
  }
  sub_23D4CEB40();
  if (v23)
  {
    uint64_t v24 = sub_23D4CEE60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = 0;
  }
  sub_23D4CEB90();
  uint64_t v25 = (void *)v18;
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v20) == 1)
  {
    sub_23D4C8140((uint64_t)v5, &qword_26AF50250);
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = sub_23D4CAF6C();
    OUTLINED_FUNCTION_8_0();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v20);
  }
  sub_23D4CEBA0();
  if (v28)
  {
    uint64_t v29 = sub_23D4CEE60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v29 = 0;
  }
  sub_23D4CEB20();
  if (v30)
  {
    uint64_t v31 = sub_23D4CEE60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v31 = 0;
  }
  uint64_t v32 = self;
  uint64_t v33 = sub_23D4CEBD0();
  uint64_t v34 = sub_23D4CA234(v33);
  swift_bridgeObjectRelease();
  uint64_t v35 = sub_23D4C9BA0();
  uint64_t v50 = (void *)v32;
  uint64_t v49 = v34;
  uint64_t v47 = v29;
  uint64_t v48 = v31;
  *(void *)&long long v46 = v24;
  *((void *)&v46 + 1) = v26;
  uint64_t v36 = v55;
  uint64_t v37 = (void *)v24;
  uint64_t v38 = v54;
  uint64_t v39 = (void *)v26;
  int64_t v40 = v53;
  uint64_t v41 = (void *)v29;
  uint64_t v42 = v52;
  uint64_t v43 = (void *)v31;
  uint64_t v44 = v51;
  id v56 = sub_23D4CAD0C((uint64_t)v57, (uint64_t)v58, (uint64_t)v55, (uint64_t)v54, (uint64_t)v53, (uint64_t)v25, (uint64_t)v52, (uint64_t)v51, v46, v47, v48, v49, (uint64_t)v56, v35, v50);

  return v56;
}

uint64_t sub_23D4CA86C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    OUTLINED_FUNCTION_1_1();
    uint64_t result = sub_23D4CF1F0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_23D4CA934(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v5 = *(void *)(*(void *)(sub_23D4CEC00() - 8) + 72) * a2, v6 = a3 + v5, v7 = a1 + v5, v6 > a1)
      ? (BOOL v8 = v7 > a3)
      : (BOOL v8 = 0),
        v8))
  {
    uint64_t result = sub_23D4CF1F0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

char *sub_23D4CAA4C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_23D4CAA8C(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

size_t sub_23D4CAA6C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_23D4CAB70(a1, a2, a3, *v3);
  *BOOL v3 = result;
  return result;
}

char *sub_23D4CAA8C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B1F8);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_23D4CDFD8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_23D4CA86C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_23D4CAB70(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF502A8);
  uint64_t v10 = *(void *)(sub_23D4CEC00() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_23D4CEC00() - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_23D4CE048(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_23D4CA934(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

id sub_23D4CAD0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  unint64_t v18 = (void *)sub_23D4CEFB0();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(a15, sel_identifierSetWithCatalogID_libraryID_cloudAlbumLibraryID_cloudID_reportingAdamID_purchasedAdamID_assetAdamID_deviceLocalID_occurrenceID_containedDeviceLocalID_syncID_playbackID_formerIDs_modelObjectType_source_, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, v18, a13, a14);

  return v19;
}

int64_t sub_23D4CADE8(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (size_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    unint64_t v10 = *(void *)(v6 + 8 * v9);
    if (v10) {
      return __clz(__rbit64(v10)) + (v9 << 6);
    }
    unint64_t v11 = (unint64_t)(result + 63) >> 6;
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      unint64_t v10 = *(void *)(v6 + 8 * v9);
      if (v10) {
        return __clz(__rbit64(v10)) + (v9 << 6);
      }
      while (v5 + 3 < v11)
      {
        unint64_t v10 = *(void *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_23D4CAECC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_23D4CAF4C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23D4CAF6C()
{
  uint64_t result = sub_23D4CEB00();
  uint64_t v3 = v2;
  uint64_t v4 = HIBYTE(v2) & 0xF;
  uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
    swift_bridgeObjectRelease();
    uint64_t v25 = 0;
LABEL_49:
    sub_23D4CB41C();
    sub_23D4CEAF0();
    return (uint64_t)sub_23D4CB1F4(v25);
  }
  if ((v3 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (uint64_t)sub_23D4CB334(result, v3, 10);
    char v0 = v28;
LABEL_46:
    swift_bridgeObjectRelease();
    if (v0) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = v8;
    }
    goto LABEL_49;
  }
  if ((v3 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      unint64_t v7 = (unsigned __int8 *)((v3 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      unint64_t v7 = (unsigned __int8 *)sub_23D4CF0F0();
    }
    uint64_t v8 = (uint64_t)sub_23D4CB45C(v7, v5, 10);
    char v0 = v9 & 1;
    goto LABEL_46;
  }
  if (result == 43)
  {
    if (!v4) {
      goto LABEL_61;
    }
    if (v4 == 1) {
      goto LABEL_32;
    }
    OUTLINED_FUNCTION_1_2();
    if (!v14 & v13) {
      goto LABEL_32;
    }
    uint64_t v8 = v16;
    if (v15 != 2)
    {
      OUTLINED_FUNCTION_1_2();
      if (!v14 & v13) {
        goto LABEL_32;
      }
      uint64_t v8 = 10 * v8 + v18;
      if (v17 != 3)
      {
        while (1)
        {
          OUTLINED_FUNCTION_3_2();
          if (!v14 & v13) {
            goto LABEL_32;
          }
          OUTLINED_FUNCTION_0_1();
          if (!v14) {
            goto LABEL_32;
          }
          uint64_t v8 = v20 + v19;
          if (__OFADD__(v20, v19)) {
            goto LABEL_32;
          }
          OUTLINED_FUNCTION_2_3();
          if (v14) {
            goto LABEL_46;
          }
        }
      }
    }
LABEL_45:
    char v0 = 0;
    goto LABEL_46;
  }
  if (result != 45)
  {
    if (!v4 || (result - 48) > 9u) {
      goto LABEL_32;
    }
    uint64_t v8 = (result - 48);
    if (v4 != 1)
    {
      OUTLINED_FUNCTION_1_2();
      if (!v14 & v13) {
        goto LABEL_32;
      }
      uint64_t v8 = 10 * v8 + v22;
      if (v21 != 2)
      {
        while (1)
        {
          OUTLINED_FUNCTION_3_2();
          if (!v14 & v13) {
            goto LABEL_32;
          }
          OUTLINED_FUNCTION_0_1();
          if (!v14) {
            goto LABEL_32;
          }
          uint64_t v8 = v24 + v23;
          if (__OFADD__(v24, v23)) {
            goto LABEL_32;
          }
          OUTLINED_FUNCTION_2_3();
          if (v14) {
            goto LABEL_46;
          }
        }
      }
    }
    goto LABEL_45;
  }
  if (v4)
  {
    if (v4 != 1)
    {
      OUTLINED_FUNCTION_1_2();
      if (!(!v14 & v13))
      {
        if (v11 == 2)
        {
          char v0 = 0;
          uint64_t v8 = -(uint64_t)v12;
          goto LABEL_46;
        }
        if ((v10 - 48) <= 9u)
        {
          uint64_t v8 = -10 * v12 - (v10 - 48);
          if (v11 == 3) {
            goto LABEL_45;
          }
          while (1)
          {
            OUTLINED_FUNCTION_3_2();
            if (!v14 & v13) {
              break;
            }
            OUTLINED_FUNCTION_0_1();
            if (!v14) {
              break;
            }
            uint64_t v8 = v27 - v26;
            if (__OFSUB__(v27, v26)) {
              break;
            }
            OUTLINED_FUNCTION_2_3();
            if (v14) {
              goto LABEL_46;
            }
          }
        }
      }
    }
LABEL_32:
    uint64_t v8 = 0;
    char v0 = 1;
    goto LABEL_46;
  }
  __break(1u);
LABEL_61:
  __break(1u);
  return result;
}

id sub_23D4CB1F4(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v3 = (void *)sub_23D4CEE60();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithValue_databaseID_, a1, v3);

  return v4;
}

void *sub_23D4CB270(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B100);
  id v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23D4CB2D8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v6 = sub_23D4CEF30();
    OUTLINED_FUNCTION_4_1(v6);
    return v7 | 4;
  }
  else
  {
    uint64_t v3 = MEMORY[0x23ED01AB0](15, a1 >> 16);
    OUTLINED_FUNCTION_4_1(v3);
    return v4 | 8;
  }
}

unsigned __int8 *sub_23D4CB334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_23D4CEF40();
  uint64_t v6 = v4;
  unint64_t v7 = v5;
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v9 = HIBYTE(v7) & 0xF;
    uint64_t v14 = v6;
    uint64_t v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }
  uint64_t v6 = sub_23D4CB6D8(v4, v5);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  unint64_t v7 = v11;
  if ((v11 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = (unsigned __int8 *)sub_23D4CF0F0();
  }
LABEL_7:
  unsigned __int8 v12 = sub_23D4CB45C(v8, v9, a3);
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_23D4CB41C()
{
  unint64_t result = qword_268C0B200;
  if (!qword_268C0B200)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C0B200);
  }
  return result;
}

unsigned __int8 *sub_23D4CB45C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v15 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v16 = a3 + 48;
        unsigned __int8 v17 = a3 + 55;
        unsigned __int8 v18 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = 58;
        }
        else
        {
          unsigned __int8 v18 = 97;
          unsigned __int8 v17 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          unsigned __int8 v19 = result + 1;
          do
          {
            unsigned int v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                uint64_t v13 = 0;
                if (v20 < 0x61 || v20 >= v18) {
                  return (unsigned __int8 *)v13;
                }
                char v21 = -87;
              }
              else
              {
                char v21 = -55;
              }
            }
            else
            {
              char v21 = -48;
            }
            uint64_t v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21))) {
              return 0;
            }
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        unsigned __int8 v23 = a3 + 48;
        unsigned __int8 v24 = a3 + 55;
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v23 = 58;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v24 = 65;
        }
        if (result)
        {
          uint64_t v26 = 0;
          do
          {
            unsigned int v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                uint64_t v13 = 0;
                if (v27 < 0x61 || v27 >= v25) {
                  return (unsigned __int8 *)v13;
                }
                char v28 = -87;
              }
              else
              {
                char v28 = -55;
              }
            }
            else
            {
              char v28 = -48;
            }
            uint64_t v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
              return 0;
            }
            uint64_t v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28))) {
              return 0;
            }
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      uint64_t v5 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v6 = a3 + 48;
        unsigned __int8 v7 = a3 + 55;
        unsigned __int8 v8 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = 58;
        }
        else
        {
          unsigned __int8 v8 = 97;
          unsigned __int8 v7 = 65;
        }
        if (result)
        {
          uint64_t v9 = 0;
          for (uint64_t i = result + 1; ; ++i)
          {
            unsigned int v11 = *i;
            if (v11 < 0x30 || v11 >= v6)
            {
              if (v11 < 0x41 || v11 >= v7)
              {
                uint64_t v13 = 0;
                if (v11 < 0x61 || v11 >= v8) {
                  return (unsigned __int8 *)v13;
                }
                char v12 = -87;
              }
              else
              {
                char v12 = -55;
              }
            }
            else
            {
              char v12 = -48;
            }
            uint64_t v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
              return 0;
            }
            uint64_t v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12))) {
              return 0;
            }
            if (!--v5) {
              return (unsigned __int8 *)v9;
            }
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23D4CB6D8(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_23D4CB744((uint64_t)sub_23D4CB740, 0, a1, a2);
  uint64_t v6 = sub_23D4CB778(v2, v3, v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_23D4CB744(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3;
  }
  uint64_t v5 = 7;
  if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0) {
    uint64_t v5 = 11;
  }
  return MEMORY[0x270F9D8F0](15, v5 | (v4 << 16));
}

uint64_t sub_23D4CB778(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_23D4CB8D0(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_23D4CB270(v9, 0);
      unint64_t v12 = sub_23D4CB9D0((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_23D4CF0F0();
LABEL_4:
        JUMPOUT(0x23ED01A70);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x23ED01A70](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x23ED01A70]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_23D4CB8D0(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_23D4CB2D8(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_23D4CB2D8(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_23D4CB9D0(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0) {
    goto LABEL_38;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_35:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t result = v12;
    if ((v12 & 0xC) == v15) {
      unint64_t result = sub_23D4CB2D8(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_23D4CEF20();
      char v19 = result;
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
      }
      else
      {
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_23D4CF0F0();
        }
        char v19 = *(unsigned char *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      unint64_t result = sub_23D4CB2D8(v12, a6, a7);
      unint64_t v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16) {
      goto LABEL_37;
    }
    unint64_t v12 = sub_23D4CEEF0();
LABEL_31:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

unint64_t OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

id MPCPlayerResponse.playState(for:)(uint64_t a1)
{
  return sub_23D4CC0FC(a1, MEMORY[0x263F13B48], MEMORY[0x263F13C08]);
}

{
  return sub_23D4CC0FC(a1, MEMORY[0x263F13880], MEMORY[0x263F13C00]);
}

id MPCPlayerResponse.playState(for:)()
{
  unint64_t v2 = v0;
  uint64_t v3 = sub_23D4CED80();
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_29();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B208);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_62();
  uint64_t v10 = v8 - v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v34 - v12;
  id v14 = objc_msgSend(v2, sel_tracklist);
  id v15 = objc_msgSend(v14, sel_playingItem);

  if (!v15) {
    return 0;
  }
  id v16 = objc_msgSend(v15, sel_metadataObject);

  if (!v16) {
    return 0;
  }
  id v17 = objc_msgSend(v2, sel_tracklist);
  id v18 = objc_msgSend(v17, sel_playingItemIndexPath);

  if (v18)
  {
    sub_23D4CE870();

    uint64_t v19 = sub_23D4CE890();
    uint64_t v20 = v10;
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v19 = sub_23D4CE890();
    uint64_t v20 = v10;
    uint64_t v21 = 1;
  }
  __swift_storeEnumTagSinglePayload(v20, v21, 1, v19);
  sub_23D4CC014(v10, (uint64_t)v13);
  sub_23D4CE890();
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v19) == 1)
  {

    sub_23D4CC07C((uint64_t)v13);
    return 0;
  }
  sub_23D4CE880();
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v19);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v1, *MEMORY[0x263F13AD0], v3);
  sub_23D4CEDD0();
  unint64_t v23 = (void *)sub_23D4CEA80();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  id v24 = objc_msgSend(v16, sel_identifiers);
  id v25 = objc_msgSend(v23, sel_identifiers);
  unsigned int v26 = objc_msgSend(v24, sel_intersectsSet_, v25);

  if (!v26)
  {
    id v28 = objc_msgSend(v16, sel_flattenedGenericObject);
    if (v28)
    {
      uint64_t v29 = v28;
      id v30 = objc_msgSend(v28, sel_identifiers);
      id v31 = objc_msgSend(v23, sel_identifiers);
      unsigned __int8 v32 = objc_msgSend(v30, sel_intersectsSet_, v31);

      if (v32)
      {
        id v27 = objc_msgSend(v2, sel_state);

        return v27;
      }
    }
    return 0;
  }
  id v27 = objc_msgSend(v2, sel_state);

  return v27;
}

uint64_t sub_23D4CC014(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B208);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23D4CC07C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B208);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_23D4CC0FC(uint64_t a1, void (*a2)(void), unsigned int *a3)
{
  uint64_t v7 = sub_23D4CEDD0();
  OUTLINED_FUNCTION_0_2();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_29();
  a2(0);
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v3, a1);
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v3, *a3, v7);
  id v12 = MPCPlayerResponse.playState(for:)();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v3, v7);
  return v12;
}

id MPCPlayerResponse.playState(for:in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = a1;
  sub_23D4CED80();
  OUTLINED_FUNCTION_0_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_29();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B208);
  MEMORY[0x270FA5388](v8 - 8);
  OUTLINED_FUNCTION_62();
  uint64_t v11 = v9 - v10;
  MEMORY[0x270FA5388](v12);
  id v14 = (char *)&v46 - v13;
  id v15 = objc_msgSend(v3, sel_tracklist);
  id v16 = objc_msgSend(v15, sel_playingItem);

  if (!v16) {
    return 0;
  }
  id v17 = objc_msgSend(v16, sel_metadataObject);

  if (!v17) {
    return 0;
  }
  uint64_t v48 = a2;
  id v18 = objc_msgSend(v3, sel_tracklist);
  id v19 = objc_msgSend(v18, sel_playingItemIndexPath);

  if (v19)
  {
    sub_23D4CE870();

    uint64_t v20 = sub_23D4CE890();
    uint64_t v21 = v11;
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v20 = sub_23D4CE890();
    uint64_t v21 = v11;
    uint64_t v22 = 1;
  }
  __swift_storeEnumTagSinglePayload(v21, v22, 1, v20);
  sub_23D4CC014(v11, (uint64_t)v14);
  sub_23D4CE890();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v20) == 1)
  {

    sub_23D4CC07C((uint64_t)v14);
    return 0;
  }
  uint64_t v23 = sub_23D4CE880();
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v20);
  id v25 = objc_msgSend(v3, sel_tracklist);
  id v26 = objc_msgSend(v25, sel_items);

  id v27 = objc_msgSend(v26, sel_sectionAtIndex_, v23);
  id v47 = objc_msgSend(v27, sel_metadataObject);

  id v28 = *(void (**)(void))(v6 + 104);
  OUTLINED_FUNCTION_1_3();
  v28();
  sub_23D4CEDD0();
  uint64_t v29 = sub_23D4CEA80();
  id v30 = *(void (**)(uint64_t))(v6 + 8);
  uint64_t v31 = OUTLINED_FUNCTION_4_2();
  v30(v31);
  OUTLINED_FUNCTION_1_3();
  v28();
  unsigned __int8 v32 = (void *)v29;
  sub_23D4CEDC0();
  uint64_t v33 = (void *)sub_23D4CEA80();
  uint64_t v34 = OUTLINED_FUNCTION_4_2();
  v30(v34);
  id v35 = objc_msgSend(v17, sel_identifiers);
  id v36 = objc_msgSend(v32, sel_identifiers);
  unsigned int v37 = objc_msgSend(v35, sel_intersectsSet_, v36);

  if (!v37)
  {

LABEL_19:
    return 0;
  }
  id v38 = v47;
  if (!v47)
  {

    goto LABEL_19;
  }
  if (objc_msgSend(v47, sel_type) != (id)2)
  {
LABEL_18:

    goto LABEL_19;
  }
  id v39 = objc_msgSend(v38, sel_album);
  if (!v39)
  {

    return 0;
  }
  int64_t v40 = v39;
  id v41 = objc_msgSend(v39, sel_identifiers);
  id v42 = objc_msgSend(v33, sel_identifiers);
  unsigned __int8 v43 = objc_msgSend(v41, sel_intersectsSet_, v42);

  if ((v43 & 1) == 0)
  {

    goto LABEL_18;
  }
  id v44 = objc_msgSend(v3, sel_state);

  return v44;
}

id MPCPlayerResponse.playState(for:in:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B208);
  MEMORY[0x270FA5388](v0 - 8);
  OUTLINED_FUNCTION_62();
  uint64_t v43 = v1 - v2;
  MEMORY[0x270FA5388](v3);
  uint64_t v44 = (uint64_t)&v42 - v4;
  sub_23D4CED80();
  OUTLINED_FUNCTION_0_2();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = *(void (**)(void))(v6 + 104);
  OUTLINED_FUNCTION_1_3();
  v8();
  sub_23D4CEE00();
  uint64_t v9 = (void *)sub_23D4CEA80();
  uint64_t v10 = *(void (**)(uint64_t))(v6 + 8);
  uint64_t v11 = OUTLINED_FUNCTION_5_2();
  v10(v11);
  OUTLINED_FUNCTION_1_3();
  v8();
  sub_23D4CEE10();
  uint64_t v12 = (void *)sub_23D4CEA80();
  uint64_t v13 = OUTLINED_FUNCTION_5_2();
  v10(v13);
  id v14 = v45;
  id v15 = objc_msgSend(v45, sel_tracklist);
  id v16 = objc_msgSend(v15, sel_playingItem);

  if (!v16
    || (id v17 = objc_msgSend(v16, sel_metadataObject), v16, !v17))
  {

    return 0;
  }
  id v18 = objc_msgSend(v17, sel_identifiers);
  id v19 = v9;
  id v20 = objc_msgSend(v9, sel_identifiers);
  unsigned __int8 v21 = objc_msgSend(v18, sel_intersectsSet_, v20);

  if ((v21 & 1) == 0) {
    goto LABEL_15;
  }
  id v22 = objc_msgSend(v14, sel_tracklist);
  id v23 = objc_msgSend(v22, sel_playingItemIndexPath);

  if (v23)
  {
    uint64_t v24 = v43;
    sub_23D4CE870();

    uint64_t v25 = sub_23D4CE890();
    uint64_t v26 = v24;
    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v25 = sub_23D4CE890();
    uint64_t v24 = v43;
    uint64_t v26 = v43;
    uint64_t v27 = 1;
  }
  __swift_storeEnumTagSinglePayload(v26, v27, 1, v25);
  uint64_t v28 = v44;
  sub_23D4CC014(v24, v44);
  sub_23D4CE890();
  if (__swift_getEnumTagSinglePayload(v28, 1, v25) == 1)
  {

    sub_23D4CC07C(v28);
    return 0;
  }
  uint64_t v29 = sub_23D4CE880();
  OUTLINED_FUNCTION_8_0();
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v25);
  id v31 = objc_msgSend(v14, sel_tracklist);
  id v32 = objc_msgSend(v31, sel_items);

  id v33 = objc_msgSend(v32, sel_sectionAtIndex_, v29);
  id v34 = objc_msgSend(v33, sel_metadataObject);

  if (!v34)
  {
LABEL_15:

LABEL_16:
    return 0;
  }
  if (objc_msgSend(v34, sel_type) != (id)4
    || (id v35 = objc_msgSend(v34, sel_playlist)) == 0)
  {

    goto LABEL_16;
  }
  id v36 = v35;
  id v37 = [v35 (SEL)0x264EA1C18];
  id v38 = [v12 (SEL)0x264EA1C18];
  unsigned __int8 v39 = objc_msgSend(v37, sel_intersectsSet_, v38);

  if ((v39 & 1) == 0)
  {

    goto LABEL_16;
  }
  id v40 = objc_msgSend(v14, sel_state);

  return v40;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return v0;
}

uint64_t MusicPlaybackIntentDescriptor.init(item:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B068);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_63();
  uint64_t v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B070);
  uint64_t v8 = sub_23D4CE8B0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_23D4CF940;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v10 + 16))(v12 + v11, a1, v8);
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  sub_23D4CCD4C(v12, v7, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(a1, v8);
}

uint64_t sub_23D4CCD4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v45 = (void *)a3;
  uint64_t v6 = sub_23D4CE8B0();
  uint64_t v44 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B068);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v14 = (char *)&v39 - v13;
  sub_23D4C803C();
  sub_23D4BADAC(a2, (uint64_t)v14, &qword_268C0B068);
  uint64_t v15 = swift_bridgeObjectRetain();
  sub_23D4BE3A8(v15, (uint64_t)v14, v16, v17, v18, v19, v20, v21, v39, (uint64_t)v40, v41, v42, v43, v44, (uint64_t)v45, v46, v47, *((uint64_t *)&v47 + 1), v48,
    *((uint64_t *)&v48 + 1));
  if (v3)
  {
    sub_23D4BAEEC(a2, &qword_268C0B068);
    return swift_bridgeObjectRelease();
  }
  else
  {
    id v40 = v12;
    uint64_t v41 = a2;
    uint64_t v42 = v22;
    uint64_t v43 = 0;
    uint64_t v24 = a1;
    uint64_t v25 = *(void *)(a1 + 16);
    if (v25)
    {
      uint64_t v53 = *(void (**)(char *, unint64_t, uint64_t))(v44 + 16);
      unint64_t v26 = v24 + ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80));
      uint64_t v46 = *(void *)(v44 + 72);
      uint64_t v27 = (void (**)(char *, uint64_t))(v44 + 8);
      uint64_t v39 = v24;
      swift_bridgeObjectRetain();
      uint64_t v28 = (char *)MEMORY[0x263F8EE78];
      do
      {
        v53(v8, v26, v6);
        sub_23D4CE8A0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
        if ((swift_dynamicCast() & 1) == 0)
        {
          uint64_t v49 = 0;
          long long v47 = 0u;
          long long v48 = 0u;
        }
        (*v27)(v8, v6);
        if (*((void *)&v48 + 1))
        {
          sub_23D4BAE78(&v47, (uint64_t)&v50);
          sub_23D4BAE78(&v50, (uint64_t)&v47);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v28 = sub_23D4CDCC8(0, *((void *)v28 + 2) + 1, 1, (uint64_t)v28);
          }
          unint64_t v30 = *((void *)v28 + 2);
          unint64_t v29 = *((void *)v28 + 3);
          if (v30 >= v29 >> 1) {
            uint64_t v28 = sub_23D4CDCC8((char *)(v29 > 1), v30 + 1, 1, (uint64_t)v28);
          }
          *((void *)v28 + 2) = v30 + 1;
          sub_23D4BAE78(&v47, (uint64_t)&v28[40 * v30 + 32]);
        }
        else
        {
          sub_23D4BAEEC((uint64_t)&v47, &qword_26AF50248);
        }
        v26 += v46;
        --v25;
      }
      while (v25);
      swift_bridgeObjectRelease();
      uint64_t v31 = v44;
      id v32 = v45;
    }
    else
    {
      uint64_t v28 = (char *)MEMORY[0x263F8EE78];
      uint64_t v31 = v44;
      id v32 = v45;
    }
    uint64_t v33 = (uint64_t)v40;
    uint64_t v34 = v41;
    sub_23D4BADAC(v41, (uint64_t)v40, &qword_268C0B068);
    if (__swift_getEnumTagSinglePayload(v33, 1, v6) == 1)
    {
      sub_23D4BAEEC(v34, &qword_268C0B068);
      swift_bridgeObjectRelease();
      sub_23D4BAEEC(v33, &qword_268C0B068);
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v52 = 0;
    }
    else
    {
      sub_23D4CE8A0();
      sub_23D4BAEEC(v34, &qword_268C0B068);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v33, v6);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v52 = 0;
        long long v50 = 0u;
        long long v51 = 0u;
      }
    }
    uint64_t v35 = type metadata accessor for MusicPlaybackIntentDescriptor();
    id v36 = (char *)v32 + *(int *)(v35 + 24);
    *(void *)id v36 = v28;
    sub_23D4BADAC((uint64_t)&v50, (uint64_t)(v36 + 8), &qword_26AF50248);
    v36[80] = 1;
    uint64_t v37 = (uint64_t)v32 + *(int *)(v35 + 20);
    uint64_t v38 = sub_23D4CE970();
    __swift_storeEnumTagSinglePayload(v37, 1, 1, v38);
    *id v32 = v42;
    return sub_23D4BAEEC((uint64_t)&v50, &qword_26AF50248);
  }
}

uint64_t MusicPlaybackIntentDescriptor.init<A>(items:startingAt:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v46 = (void *)a5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B068);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_62();
  uint64_t v47 = v11 - v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v45 - v14;
  OUTLINED_FUNCTION_0_0();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_63();
  uint64_t v21 = v20 - v19;
  sub_23D4C803C();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  uint64_t v56 = a1;
  v22(v21, a1, a3);
  sub_23D4BADAC(a2, (uint64_t)v15, &qword_268C0B068);
  MPCPlaybackIntent.init<A>(for:startingAt:)(v21, (uint64_t)v15, a3, a4, v23, v24, v25, v26, v45, (uint64_t)v46, v47, v48, v49, v50, v51, v52, v53, *((uint64_t *)&v53 + 1), v54,
    *((uint64_t *)&v54 + 1));
  if (v5)
  {
    sub_23D4BAEEC(a2, &qword_268C0B068);
    uint64_t v28 = OUTLINED_FUNCTION_1_4();
    return v29(v28);
  }
  else
  {
    uint64_t v31 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
    uint64_t v32 = sub_23D4CEFA0();
    uint64_t v33 = v47;
    sub_23D4BADAC(a2, v47, &qword_268C0B068);
    uint64_t v34 = sub_23D4CE8B0();
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v33, 1, v34);
    uint64_t v45 = v31;
    if (EnumTagSinglePayload == 1)
    {
      sub_23D4BAEEC(a2, &qword_268C0B068);
      uint64_t v36 = OUTLINED_FUNCTION_1_4();
      v37(v36);
      sub_23D4BAEEC(v33, &qword_268C0B068);
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v55 = 0;
    }
    else
    {
      sub_23D4CE8A0();
      sub_23D4BAEEC(a2, &qword_268C0B068);
      uint64_t v38 = OUTLINED_FUNCTION_1_4();
      v39(v38);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 8))(v33, v34);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v55 = 0;
        long long v53 = 0u;
        long long v54 = 0u;
      }
    }
    id v40 = v46;
    uint64_t v41 = type metadata accessor for MusicPlaybackIntentDescriptor();
    uint64_t v42 = (char *)v40 + *(int *)(v41 + 24);
    *(void *)uint64_t v42 = v32;
    sub_23D4BADAC((uint64_t)&v53, (uint64_t)(v42 + 8), &qword_26AF50248);
    v42[80] = 1;
    uint64_t v43 = (uint64_t)v40 + *(int *)(v41 + 20);
    uint64_t v44 = sub_23D4CE970();
    __swift_storeEnumTagSinglePayload(v43, 1, 1, v44);
    void *v40 = v45;
    return sub_23D4BAEEC((uint64_t)&v53, &qword_26AF50248);
  }
}

double sub_23D4CD530@<D0>(uint64_t a1@<X8>)
{
  sub_23D4CE8A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
  if ((swift_dynamicCast() & 1) == 0)
  {
    *(void *)(a1 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t MusicPlaybackIntentDescriptor.init(request:startingAt:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v52 = a3;
  uint64_t v58 = a1;
  uint64_t v51 = type metadata accessor for MusicPlaybackIntentDescriptor();
  OUTLINED_FUNCTION_9();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_63();
  uint64_t v7 = (void *)(v6 - v5);
  uint64_t v8 = sub_23D4CE8B0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_62();
  uint64_t v14 = v12 - v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v47 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B068);
  MEMORY[0x270FA5388](v18 - 8);
  OUTLINED_FUNCTION_62();
  uint64_t v21 = v19 - v20;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)v47 - v23;
  sub_23D4BADAC(a2, (uint64_t)v47 - v23, &qword_268C0B068);
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v8) == 1)
  {
    sub_23D4BAEEC((uint64_t)v24, &qword_268C0B068);
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v57 = 0;
  }
  else
  {
    sub_23D4CE8A0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v24, v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B088);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
    if ((swift_dynamicCast() & 1) == 0)
    {
      uint64_t v57 = 0;
      long long v55 = 0u;
      long long v56 = 0u;
    }
  }
  sub_23D4BADAC(a2, v21, &qword_268C0B068);
  if (__swift_getEnumTagSinglePayload(v21, 1, v8) == 1)
  {
    sub_23D4BAEEC(v21, &qword_268C0B068);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v17, v21, v8);
    if (*((void *)&v56 + 1))
    {
      OUTLINED_FUNCTION_3_3();
      v25();
    }
    else
    {
      if (qword_268C0B010 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_23D4CEAC0();
      __swift_project_value_buffer(v26, (uint64_t)qword_268C0B350);
      (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v14, v17, v8);
      uint64_t v27 = sub_23D4CEAA0();
      os_log_type_t v28 = sub_23D4CF030();
      if (os_log_type_enabled(v27, v28))
      {
        os_log_t v50 = v27;
        unint64_t v29 = (uint8_t *)swift_slowAlloc();
        uint64_t v49 = swift_slowAlloc();
        v54[0] = v49;
        uint64_t v48 = v29;
        *(_DWORD *)unint64_t v29 = 136446210;
        v47[1] = v29 + 4;
        sub_23D4CE1D0();
        uint64_t v30 = sub_23D4CF200();
        v53[0] = sub_23D4C2BF8(v30, v31, v54);
        sub_23D4CF080();
        swift_bridgeObjectRelease();
        uint64_t v32 = *(void (**)(void))(v10 + 8);
        OUTLINED_FUNCTION_3_3();
        v32();
        os_log_t v33 = v50;
        os_log_type_t v34 = v28;
        uint64_t v35 = v48;
        _os_log_impl(&dword_23D4B6000, v50, v34, "Ignoring start item for non-playable item %{public}s for new playback intent.", v48, 0xCu);
        uint64_t v36 = v49;
        swift_arrayDestroy();
        MEMORY[0x23ED022D0](v36, -1, -1);
        MEMORY[0x23ED022D0](v35, -1, -1);

        OUTLINED_FUNCTION_3_3();
        v32();
      }
      else
      {

        uint64_t v37 = *(void (**)(void))(v10 + 8);
        OUTLINED_FUNCTION_3_3();
        v37();
        ((void (*)(char *, uint64_t))v37)(v17, v8);
      }
    }
  }
  uint64_t v38 = v58;
  sub_23D4C5420(v58, (uint64_t)v54);
  sub_23D4BADAC((uint64_t)&v55, (uint64_t)v53, &qword_26AF50248);
  __swift_project_boxed_opaque_existential_1(v54, v54[3]);
  _s16MusicKitInternal0A15PlayableRequestP01_abC18_MediaPlaybackCoreE14playbackIntent16withStartingItemSo011MPCPlaybackJ0CSg0aB00daM0_pSg_tF_0();
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = v51;
    uint64_t v42 = (uint64_t)v7 + *(int *)(v51 + 24);
    sub_23D4C5420((uint64_t)v54, v42);
    sub_23D4C80D8((uint64_t)v53, v42 + 40);
    *(unsigned char *)(v42 + 80) = 2;
    uint64_t v43 = (uint64_t)v7 + *(int *)(v41 + 20);
    uint64_t v44 = sub_23D4CE970();
    __swift_storeEnumTagSinglePayload(v43, 1, 1, v44);
    *uint64_t v7 = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
    sub_23D4BAEEC(a2, &qword_268C0B068);
    __swift_destroy_boxed_opaque_existential_1(v38);
    sub_23D4CDB74((uint64_t)v7, v52);
  }
  else
  {
    sub_23D4C3348();
    swift_allocError();
    *uint64_t v46 = 1;
    swift_willThrow();
    sub_23D4BAEEC((uint64_t)v53, &qword_26AF50248);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
    sub_23D4BAEEC(a2, &qword_268C0B068);
    __swift_destroy_boxed_opaque_existential_1(v38);
  }
  return sub_23D4BAEEC((uint64_t)&v55, &qword_26AF50248);
}

uint64_t sub_23D4CDB74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MusicPlaybackIntentDescriptor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *sub_23D4CDBD8(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C0B1F8);
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
  if (v5)
  {
    sub_23D4CDFD8((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23D4CDDC0(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_23D4CDCC8(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF502C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_23D4CE134((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23D4CDEB8(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_23D4CDDC0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_23D4CF1F0();
  __break(1u);
  return result;
}

uint64_t sub_23D4CDEB8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF50220);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_23D4CF1F0();
  __break(1u);
  return result;
}

char *sub_23D4CDFD8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_3();
    __src = (char *)OUTLINED_FUNCTION_4_3();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

void sub_23D4CE048(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_4_3();
    __break(1u);
  }
  else if (a3 < a1 || (sub_23D4CEC00(), OUTLINED_FUNCTION_9(), a1 + *(void *)(v6 + 72) * a2 <= a3))
  {
    sub_23D4CEC00();
    OUTLINED_FUNCTION_8_1();
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_8_1();
    swift_arrayInitWithTakeBackToFront();
  }
}

char *sub_23D4CE134(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_23D4CF1F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

unint64_t sub_23D4CE1D0()
{
  unint64_t result = qword_268C0B060;
  if (!qword_268C0B060)
  {
    sub_23D4CE8B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C0B060);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return *(void *)(v0 - 72);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return sub_23D4CF1F0();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return v0;
}

id sub_23D4CE298()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_23D4CE2F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MusicKitInternal_MediaPlaybackCore_FinalClass()
{
  return self;
}

uint64_t MPCReportingLyricsViewEvent.song.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_modelSong);
  uint64_t v4 = sub_23D4CEDB0();
  if (v3) {
    return sub_23D4CEA90();
  }
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v4);
}

uint64_t sub_23D4CE3F4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C0B210);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D4CE674(a1, (uint64_t)v4);
  return MPCReportingLyricsViewEvent.song.setter((uint64_t)v4);
}

uint64_t MPCReportingLyricsViewEvent.song.setter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_23D4CED80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C0B210);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23D4CE674(a1, (uint64_t)v10);
  uint64_t v11 = sub_23D4CEDB0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
  {
    sub_23D4CE6DC((uint64_t)v10);
    uint64_t v12 = 0;
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F13AB8], v4);
    uint64_t v12 = (void *)sub_23D4CEA80();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  objc_msgSend(v2, sel_setModelSong_, v12);

  return sub_23D4CE6DC(a1);
}

uint64_t sub_23D4CE674(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C0B210);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23D4CE6DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C0B210);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*MPCReportingLyricsViewEvent.song.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t v3 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C0B210) - 8) + 64);
  a1[1] = malloc(v3);
  uint64_t v4 = malloc(v3);
  a1[2] = v4;
  MPCReportingLyricsViewEvent.song.getter((uint64_t)v4);
  return sub_23D4CE7C8;
}

void sub_23D4CE7C8(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  size_t v3 = *(void **)(a1 + 16);
  if (a2)
  {
    sub_23D4CE674((uint64_t)v3, (uint64_t)v2);
    MPCReportingLyricsViewEvent.song.setter((uint64_t)v2);
    sub_23D4CE6DC((uint64_t)v3);
  }
  else
  {
    MPCReportingLyricsViewEvent.song.setter((uint64_t)v3);
  }
  free(v3);
  free(v2);
}

uint64_t sub_23D4CE838@<X0>(uint64_t a1@<X8>)
{
  return MPCReportingLyricsViewEvent.song.getter(a1);
}

uint64_t sub_23D4CE860()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_23D4CE870()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_23D4CE880()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_23D4CE890()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_23D4CE8A0()
{
  return MEMORY[0x270F4C898]();
}

uint64_t sub_23D4CE8B0()
{
  return MEMORY[0x270F4C8B8]();
}

uint64_t sub_23D4CE8C0()
{
  return MEMORY[0x270F4C8F0]();
}

uint64_t sub_23D4CE8D0()
{
  return MEMORY[0x270F4C8F8]();
}

uint64_t sub_23D4CE8E0()
{
  return MEMORY[0x270F4C900]();
}

uint64_t sub_23D4CE8F0()
{
  return MEMORY[0x270F4C958]();
}

uint64_t sub_23D4CE910()
{
  return MEMORY[0x270F4C968]();
}

uint64_t sub_23D4CE920()
{
  return MEMORY[0x270F4C970]();
}

uint64_t sub_23D4CE930()
{
  return MEMORY[0x270F4C978]();
}

uint64_t sub_23D4CE940()
{
  return MEMORY[0x270F4C980]();
}

uint64_t sub_23D4CE950()
{
  return MEMORY[0x270F4C988]();
}

uint64_t sub_23D4CE960()
{
  return MEMORY[0x270F4C990]();
}

uint64_t sub_23D4CE970()
{
  return MEMORY[0x270F4C998]();
}

uint64_t sub_23D4CE980()
{
  return MEMORY[0x270F4CB90]();
}

uint64_t sub_23D4CE990()
{
  return MEMORY[0x270F4CB98]();
}

uint64_t sub_23D4CE9D0()
{
  return MEMORY[0x270F4CBB8]();
}

uint64_t sub_23D4CE9E0()
{
  return MEMORY[0x270F4CDE0]();
}

uint64_t sub_23D4CE9F0()
{
  return MEMORY[0x270F4CDE8]();
}

uint64_t sub_23D4CEA00()
{
  return MEMORY[0x270F4CDF0]();
}

uint64_t sub_23D4CEA10()
{
  return MEMORY[0x270F4CED0]();
}

uint64_t sub_23D4CEA20()
{
  return MEMORY[0x270F4CED8]();
}

uint64_t sub_23D4CEA30()
{
  return MEMORY[0x270F4CEE0]();
}

uint64_t sub_23D4CEA40()
{
  return MEMORY[0x270F4D030]();
}

uint64_t sub_23D4CEA50()
{
  return MEMORY[0x270F4D140]();
}

uint64_t sub_23D4CEA60()
{
  return MEMORY[0x270F4D188]();
}

uint64_t sub_23D4CEA70()
{
  return MEMORY[0x270F4D378]();
}

uint64_t sub_23D4CEA80()
{
  return MEMORY[0x270F877B0]();
}

uint64_t sub_23D4CEA90()
{
  return MEMORY[0x270F877B8]();
}

uint64_t sub_23D4CEAA0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23D4CEAB0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23D4CEAC0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23D4CEAD0()
{
  return MEMORY[0x270EF6450]();
}

uint64_t sub_23D4CEAE0()
{
  return MEMORY[0x270F4D3A8]();
}

uint64_t sub_23D4CEAF0()
{
  return MEMORY[0x270EF6538]();
}

uint64_t sub_23D4CEB00()
{
  return MEMORY[0x270EF6550]();
}

uint64_t sub_23D4CEB10()
{
  return MEMORY[0x270EF6558]();
}

uint64_t sub_23D4CEB20()
{
  return MEMORY[0x270EF6580]();
}

uint64_t sub_23D4CEB30()
{
  return MEMORY[0x270EF6590]();
}

uint64_t sub_23D4CEB40()
{
  return MEMORY[0x270EF65A8]();
}

uint64_t sub_23D4CEB50()
{
  return MEMORY[0x270EF65B8]();
}

uint64_t sub_23D4CEB60()
{
  return MEMORY[0x270EF65D0]();
}

uint64_t sub_23D4CEB70()
{
  return MEMORY[0x270EF65E0]();
}

uint64_t sub_23D4CEB80()
{
  return MEMORY[0x270EF65F8]();
}

uint64_t sub_23D4CEB90()
{
  return MEMORY[0x270EF6610]();
}

uint64_t sub_23D4CEBA0()
{
  return MEMORY[0x270EF6628]();
}

uint64_t sub_23D4CEBB0()
{
  return MEMORY[0x270EF6638]();
}

uint64_t sub_23D4CEBC0()
{
  return MEMORY[0x270EF6650]();
}

uint64_t sub_23D4CEBD0()
{
  return MEMORY[0x270EF6660]();
}

uint64_t sub_23D4CEBE0()
{
  return MEMORY[0x270EF6678]();
}

uint64_t sub_23D4CEBF0()
{
  return MEMORY[0x270EF6688]();
}

uint64_t sub_23D4CEC00()
{
  return MEMORY[0x270EF6690]();
}

uint64_t sub_23D4CEC10()
{
  return MEMORY[0x270EF6698]();
}

uint64_t sub_23D4CEC20()
{
  return MEMORY[0x270F4D3D8]();
}

uint64_t sub_23D4CEC30()
{
  return MEMORY[0x270F4D3E0]();
}

uint64_t sub_23D4CEC40()
{
  return MEMORY[0x270F4D3E8]();
}

uint64_t sub_23D4CEC50()
{
  return MEMORY[0x270F4D3F0]();
}

uint64_t sub_23D4CEC60()
{
  return MEMORY[0x270F4D3F8]();
}

uint64_t sub_23D4CEC70()
{
  return MEMORY[0x270EF66A8]();
}

uint64_t sub_23D4CEC80()
{
  return MEMORY[0x270EF66B0]();
}

uint64_t sub_23D4CEC90()
{
  return MEMORY[0x270EF66C8]();
}

uint64_t sub_23D4CECA0()
{
  return MEMORY[0x270EF66E0]();
}

uint64_t sub_23D4CECB0()
{
  return MEMORY[0x270EF66F0]();
}

uint64_t sub_23D4CECD0()
{
  return MEMORY[0x270EF6778]();
}

uint64_t sub_23D4CECE0()
{
  return MEMORY[0x270EF6788]();
}

uint64_t sub_23D4CECF0()
{
  return MEMORY[0x270EF68C0]();
}

uint64_t sub_23D4CED00()
{
  return MEMORY[0x270F4D4B0]();
}

uint64_t sub_23D4CED10()
{
  return MEMORY[0x270F4D4B8]();
}

uint64_t sub_23D4CED20()
{
  return MEMORY[0x270EF6980]();
}

uint64_t sub_23D4CED30()
{
  return MEMORY[0x270EF6988]();
}

uint64_t sub_23D4CED40()
{
  return MEMORY[0x270EF6998]();
}

uint64_t sub_23D4CED50()
{
  return MEMORY[0x270EF69A0]();
}

uint64_t sub_23D4CED60()
{
  return MEMORY[0x270EF6B78]();
}

uint64_t sub_23D4CED70()
{
  return MEMORY[0x270EF6B80]();
}

uint64_t sub_23D4CED80()
{
  return MEMORY[0x270EF6B88]();
}

uint64_t sub_23D4CED90()
{
  return MEMORY[0x270EF6B90]();
}

uint64_t sub_23D4CEDA0()
{
  return MEMORY[0x270EF6BA0]();
}

uint64_t sub_23D4CEDB0()
{
  return MEMORY[0x270EF6C58]();
}

uint64_t sub_23D4CEDC0()
{
  return MEMORY[0x270EF6CF8]();
}

uint64_t sub_23D4CEDD0()
{
  return MEMORY[0x270EF6D78]();
}

uint64_t sub_23D4CEDE0()
{
  return MEMORY[0x270EF6DF8]();
}

uint64_t sub_23D4CEDF0()
{
  return MEMORY[0x270EF6F18]();
}

uint64_t sub_23D4CEE00()
{
  return MEMORY[0x270EF6FD0]();
}

uint64_t sub_23D4CEE10()
{
  return MEMORY[0x270EF6FF8]();
}

uint64_t sub_23D4CEE20()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23D4CEE30()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23D4CEE40()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_23D4CEE50()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23D4CEE60()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23D4CEE70()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23D4CEE80()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_23D4CEE90()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_23D4CEEA0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_23D4CEEB0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23D4CEEC0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_23D4CEED0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23D4CEEE0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23D4CEEF0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_23D4CEF00()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_23D4CEF20()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_23D4CEF30()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_23D4CEF40()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_23D4CEF60()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_23D4CEF70()
{
  return MEMORY[0x270F4D7F0]();
}

uint64_t sub_23D4CEF80()
{
  return MEMORY[0x270F4D7F8]();
}

uint64_t sub_23D4CEF90()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_23D4CEFA0()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_23D4CEFB0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23D4CEFC0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23D4CEFD0()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_23D4CEFE0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_23D4CEFF0()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_23D4CF000()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_23D4CF010()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_23D4CF020()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23D4CF030()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23D4CF040()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_23D4CF050()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23D4CF060()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23D4CF070()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_23D4CF080()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23D4CF090()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23D4CF0A0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_23D4CF0B0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_23D4CF0C0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_23D4CF0D0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23D4CF0E0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23D4CF0F0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23D4CF100()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_23D4CF110()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_23D4CF120()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_23D4CF130()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_23D4CF140()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_23D4CF150()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23D4CF160()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_23D4CF170()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_23D4CF180()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_23D4CF190()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_23D4CF1A0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23D4CF1B0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23D4CF1C0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23D4CF1D0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_23D4CF1E0()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_23D4CF1F0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23D4CF200()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23D4CF220()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_23D4CF230()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_23D4CF240()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_23D4CF250()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23D4CF260()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23D4CF270()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23D4CF280()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23D4CF290()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23D4CF2A0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23D4CF2B0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23D4CF2C0()
{
  return MEMORY[0x270FA0128]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}