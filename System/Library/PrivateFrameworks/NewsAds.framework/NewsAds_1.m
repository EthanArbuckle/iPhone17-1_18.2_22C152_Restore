uint64_t assignWithTake for FeedGroupAdData.Kind(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FeedGroupAdData.Kind(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFC3 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483588);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 59;
  if (v4 >= 0x3D) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for FeedGroupAdData.Kind(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFC4)
  {
    *(void *)result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483588;
    if (a3 >= 0x7FFFFFC4) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFC4) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 59;
    }
  }
  return result;
}

void *sub_1BF9E4548(void *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeedGroupAdData.Kind()
{
  return &type metadata for FeedGroupAdData.Kind;
}

unsigned char *storeEnumTagSinglePayload for FeedGroupAdData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *result = a2 + 6;
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
        JUMPOUT(0x1BF9E4644);
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
          *result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FeedGroupAdData.CodingKeys()
{
  return &type metadata for FeedGroupAdData.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for FeedGroupAdData.Article.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *result = a2 + 4;
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
        JUMPOUT(0x1BF9E4748);
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
          *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FeedGroupAdData.Article.CodingKeys()
{
  return &type metadata for FeedGroupAdData.Article.CodingKeys;
}

unint64_t sub_1BF9E4784()
{
  unint64_t result = qword_1EA179F70;
  if (!qword_1EA179F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA179F70);
  }
  return result;
}

unint64_t sub_1BF9E47DC()
{
  unint64_t result = qword_1EA179F78;
  if (!qword_1EA179F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA179F78);
  }
  return result;
}

unint64_t sub_1BF9E4834()
{
  unint64_t result = qword_1EA179F80;
  if (!qword_1EA179F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA179F80);
  }
  return result;
}

unint64_t sub_1BF9E488C()
{
  unint64_t result = qword_1EA179F88;
  if (!qword_1EA179F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA179F88);
  }
  return result;
}

unint64_t sub_1BF9E48E4()
{
  unint64_t result = qword_1EA179F90;
  if (!qword_1EA179F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA179F90);
  }
  return result;
}

unint64_t sub_1BF9E493C()
{
  unint64_t result = qword_1EA179F98;
  if (!qword_1EA179F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA179F98);
  }
  return result;
}

uint64_t sub_1BF9E4990(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65676175676E616CLL && a2 == 0xE800000000000000 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7364726F7779656BLL && a2 == 0xE800000000000000 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001BFA22BE0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_1BFA18258();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1BF9E4BB0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F67657461436461 && a2 == 0xEC00000073656972 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x726F7779654B6461 && a2 == 0xEA00000000007364 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65676175676E616CLL && a2 == 0xE900000000000073 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BFA23920 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BFA271F0 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001BFA27210)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_1BFA18258();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

unint64_t sub_1BF9E4EA8()
{
  unint64_t result = qword_1EA179FA0;
  if (!qword_1EA179FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA179FA0);
  }
  return result;
}

uint64_t static SponsorshipAdInfo.Fulfilled.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_1BF9E54C0(a1, a2, (void (*)(uint64_t, void *))sub_1BF9E63B0, (void (*)(void *))sub_1BF9E5620) & 1;
}

uint64_t sub_1BF9E4F40(uint64_t a1, uint64_t a2)
{
  return sub_1BF9E54C0(a1, a2, (void (*)(uint64_t, void *))sub_1BF9E63B0, (void (*)(void *))sub_1BF9E5620) & 1;
}

uint64_t SponsorshipAdInfo.Unfilled.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SponsorshipAdInfo.Unfilled.placementIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SponsorshipAdInfo.Unfilled.backingTagIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SponsorshipAdInfo.Unfilled.journal.getter()
{
  return swift_retain();
}

uint64_t static SponsorshipAdInfo.Unfilled.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_1BF9E54C0(a1, a2, (void (*)(uint64_t, void *))sub_1BF9E6378, (void (*)(void *))sub_1BF9E55F0) & 1;
}

uint64_t sub_1BF9E5060(uint64_t a1, uint64_t a2)
{
  return sub_1BF9E54C0(a1, a2, (void (*)(uint64_t, void *))sub_1BF9E6378, (void (*)(void *))sub_1BF9E55F0) & 1;
}

uint64_t SponsorshipAdInfo.identifier.getter()
{
  sub_1BF9E55B8(v0, (uint64_t)v5);
  v3[4] = v5[4];
  v3[5] = v5[5];
  uint64_t v4 = v6;
  v3[0] = v5[0];
  v3[1] = v5[1];
  v3[2] = v5[2];
  v3[3] = v5[3];
  uint64_t v1 = *(void *)&v5[0];
  if (v7)
  {
    swift_bridgeObjectRetain();
    sub_1BF9E55F0((uint64_t)v3);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1BF9E5620((uint64_t)v3);
  }
  return v1;
}

uint64_t SponsorshipAdInfo.placementIdentifier.getter()
{
  sub_1BF9E55B8(v0, (uint64_t)&v5);
  v3[4] = v9;
  v3[5] = v10;
  uint64_t v4 = v11;
  v3[0] = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  uint64_t v1 = v6;
  if (v12)
  {
    swift_bridgeObjectRetain();
    sub_1BF9E55F0((uint64_t)v3);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1BF9E5620((uint64_t)v3);
  }
  return v1;
}

uint64_t SponsorshipAdInfo.backingTagIdentifier.getter()
{
  sub_1BF9E55B8(v0, (uint64_t)v5);
  v3[2] = v6;
  v3[3] = v7;
  v3[4] = v8;
  v3[5] = v9;
  uint64_t v4 = v10;
  v3[0] = v5[0];
  v3[1] = v5[1];
  uint64_t v1 = v6;
  if (v11)
  {
    swift_bridgeObjectRetain();
    sub_1BF9E55F0((uint64_t)v3);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1BF9E5620((uint64_t)v3);
  }
  return v1;
}

uint64_t SponsorshipAdInfo.journal.getter()
{
  sub_1BF9E55B8(v0, (uint64_t)v5);
  v3[4] = v7;
  v3[5] = v8;
  uint64_t v4 = v9;
  v3[0] = v5[0];
  v3[1] = v5[1];
  v3[2] = v5[2];
  v3[3] = v6;
  uint64_t v1 = v6;
  if (v10)
  {
    swift_retain();
    sub_1BF9E55F0((uint64_t)v3);
  }
  else
  {
    swift_retain();
    sub_1BF9E5620((uint64_t)v3);
  }
  return v1;
}

void __swiftcall SponsorshipAdInfo.metricsView()(UIView_optional *__return_ptr retstr)
{
  sub_1BF9E55B8(v1, (uint64_t)v18);
  v16[1] = v18[4];
  v16[2] = v19;
  id v17 = v20;
  v15[0] = v18[0];
  v15[1] = v18[1];
  v15[2] = v18[2];
  v16[0] = v18[3];
  long long v2 = v19;
  if (v21)
  {
    __swift_project_boxed_opaque_existential_1((void *)v16 + 1, v19);
    int v3 = *(void (**)(id, void, void, uint64_t, uint64_t, uint64_t, uint64_t))(*((void *)&v2 + 1) + 16);
    id v4 = v17;
    v3(v4, v2, *((void *)&v2 + 1), v5, v6, v7, v8);

    sub_1BF9E55F0((uint64_t)v15);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1((void *)v16 + 1, v19);
    uint64_t v9 = *(void (**)(id, void, void, uint64_t, uint64_t, uint64_t, uint64_t))(*((void *)&v2 + 1) + 16);
    id v10 = v17;
    v9(v10, v2, *((void *)&v2 + 1), v11, v12, v13, v14);

    sub_1BF9E5620((uint64_t)v15);
  }
}

uint64_t sub_1BF9E54C0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, void *), void (*a4)(void *))
{
  if (*(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24))
  {
    a3(a1, v14);
    a3(a2, v13);
  }
  else
  {
    char v9 = sub_1BFA18258();
    a3(a1, v14);
    a3(a2, v13);
    char v10 = 0;
    if ((v9 & 1) == 0) {
      goto LABEL_14;
    }
  }
  if (v14[0] == v13[0] && v14[1] == v13[1]) {
    char v10 = 1;
  }
  else {
    char v10 = sub_1BFA18258();
  }
LABEL_14:
  a4(v14);
  a4(v13);
  return v10 & 1;
}

uint64_t sub_1BF9E55B8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BF9E55F0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1BF9E5620(uint64_t a1)
{
  return a1;
}

uint64_t _s7NewsAds17SponsorshipAdInfoO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  sub_1BF9E55B8(a1, (uint64_t)v21);
  sub_1BF9E55B8(a2, (uint64_t)&v22);
  if (v21[104])
  {
    sub_1BF9E55B8((uint64_t)v21, (uint64_t)v19);
    if (v29 == 1)
    {
      long long v16 = v26;
      long long v17 = v27;
      uint64_t v18 = v28;
      long long v12 = v22;
      long long v13 = v23;
      long long v14 = v24;
      long long v15 = v25;
      if (v20 == v23)
      {
        sub_1BF9E6378((uint64_t)v19, (uint64_t)&v10);
        sub_1BF9E6378((uint64_t)&v12, (uint64_t)&v8);
        goto LABEL_12;
      }
      char v3 = sub_1BFA18258();
      sub_1BF9E6378((uint64_t)v19, (uint64_t)&v10);
      sub_1BF9E6378((uint64_t)&v12, (uint64_t)&v8);
      if (v3)
      {
LABEL_12:
        if (v10 == v8 && v11 == v9)
        {
          sub_1BF9E55F0((uint64_t)&v10);
          sub_1BF9E55F0((uint64_t)&v8);
          sub_1BF9E55F0((uint64_t)&v12);
          sub_1BF9E55F0((uint64_t)v19);
LABEL_22:
          sub_1BF95C1A0((uint64_t)v21);
          return 1;
        }
        char v5 = sub_1BFA18258();
        sub_1BF9E55F0((uint64_t)&v10);
        sub_1BF9E55F0((uint64_t)&v8);
        sub_1BF9E55F0((uint64_t)&v12);
        sub_1BF9E55F0((uint64_t)v19);
        if (v5) {
          goto LABEL_22;
        }
        goto LABEL_25;
      }
      sub_1BF9E55F0((uint64_t)&v10);
      sub_1BF9E55F0((uint64_t)&v8);
      sub_1BF9E55F0((uint64_t)&v12);
      sub_1BF9E55F0((uint64_t)v19);
LABEL_25:
      sub_1BF95C1A0((uint64_t)v21);
      return 0;
    }
    sub_1BF9E55F0((uint64_t)v19);
  }
  else
  {
    sub_1BF9E55B8((uint64_t)v21, (uint64_t)v19);
    if ((v29 & 1) == 0)
    {
      long long v16 = v26;
      long long v17 = v27;
      uint64_t v18 = v28;
      long long v12 = v22;
      long long v13 = v23;
      long long v14 = v24;
      long long v15 = v25;
      if (v20 == v23)
      {
        sub_1BF9E63B0((uint64_t)v19, (uint64_t)&v10);
        sub_1BF9E63B0((uint64_t)&v12, (uint64_t)&v8);
      }
      else
      {
        char v4 = sub_1BFA18258();
        sub_1BF9E63B0((uint64_t)v19, (uint64_t)&v10);
        sub_1BF9E63B0((uint64_t)&v12, (uint64_t)&v8);
        if ((v4 & 1) == 0)
        {
          sub_1BF9E5620((uint64_t)&v10);
          sub_1BF9E5620((uint64_t)&v8);
          sub_1BF9E5620((uint64_t)&v12);
          sub_1BF9E5620((uint64_t)v19);
          goto LABEL_25;
        }
      }
      if (v10 == v8 && v11 == v9)
      {
        sub_1BF9E5620((uint64_t)&v10);
        sub_1BF9E5620((uint64_t)&v8);
        sub_1BF9E5620((uint64_t)&v12);
        sub_1BF9E5620((uint64_t)v19);
        goto LABEL_22;
      }
      char v6 = sub_1BFA18258();
      sub_1BF9E5620((uint64_t)&v10);
      sub_1BF9E5620((uint64_t)&v8);
      sub_1BF9E5620((uint64_t)&v12);
      sub_1BF9E5620((uint64_t)v19);
      if (v6) {
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    sub_1BF9E5620((uint64_t)v19);
  }
  sub_1BF9E62B8((uint64_t)v21);
  return 0;
}

void destroy for SponsorshipAdInfo(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  long long v2 = *(void **)(a1 + 96);
}

uint64_t initializeWithCopy for SponsorshipAdInfo(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 104);
  if (v4 >= 2) {
    unsigned int v4 = *(_DWORD *)a2 + 2;
  }
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  long long v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v8;
  uint64_t v9 = v8;
  uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  if (v4 == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v10(a1 + 56, a2 + 56, v9);
    uint64_t v11 = *(void **)(a2 + 96);
    *(void *)(a1 + 96) = v11;
    char v12 = 1;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v10(a1 + 56, a2 + 56, v9);
    char v12 = 0;
    uint64_t v11 = *(void **)(a2 + 96);
    *(void *)(a1 + 96) = v11;
  }
  id v13 = v11;
  *(unsigned char *)(a1 + 104) = v12;
  return a1;
}

uint64_t assignWithCopy for SponsorshipAdInfo(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(a1 + 56);

    unsigned int v4 = *(unsigned __int8 *)(a2 + 104);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a2 + 2;
    }
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    uint64_t v5 = *(void *)(a2 + 80);
    *(void *)(a1 + 80) = v5;
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    uint64_t v6 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
    if (v4 == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      v6(a1 + 56, a2 + 56, v5);
      uint64_t v7 = *(void **)(a2 + 96);
      *(void *)(a1 + 96) = v7;
      char v8 = 1;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      v6(a1 + 56, a2 + 56, v5);
      char v8 = 0;
      uint64_t v7 = *(void **)(a2 + 96);
      *(void *)(a1 + 96) = v7;
    }
    *(unsigned char *)(a1 + 104) = v8;
    id v9 = v7;
  }
  return a1;
}

__n128 __swift_memcpy105_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(_OWORD *)(a1 + 89) = *(long long *)((char *)a2 + 89);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for SponsorshipAdInfo(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(a1 + 56);

    unsigned int v4 = *(unsigned __int8 *)(a2 + 104);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a2 + 2;
    }
    long long v5 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v5;
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    long long v7 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v7;
    *(unsigned char *)(a1 + 104) = v4 == 1;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SponsorshipAdInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 105)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 104);
  if (v3 >= 2) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SponsorshipAdInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 89) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 105) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 105) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 104) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF9E5ECC(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 104);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_1BF9E5EE8(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    unsigned int v2 = a2 - 2;
    *(void *)(result + 96) = 0;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    LOBYTE(a2) = 2;
    *(_DWORD *)uint64_t result = v2;
  }
  *(unsigned char *)(result + 104) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SponsorshipAdInfo()
{
  return &type metadata for SponsorshipAdInfo;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

ValueMetadata *type metadata accessor for SponsorshipAdInfo.Fulfilled()
{
  return &type metadata for SponsorshipAdInfo.Fulfilled;
}

void _s7NewsAds17SponsorshipAdInfoO9FulfilledVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  long long v2 = *(void **)(a1 + 96);
}

uint64_t _s7NewsAds17SponsorshipAdInfoO9FulfilledVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = a2 + 56;
  long long v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v8;
  uint64_t v9 = v8;
  uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v10(a1 + 56, v7, v9);
  uint64_t v11 = *(void **)(a2 + 96);
  *(void *)(a1 + 96) = v11;
  id v12 = v11;
  return a1;
}

void *_s7NewsAds17SponsorshipAdInfoO9FulfilledVwca_0(void *a1, void *a2)
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
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  uint64_t v4 = (void *)a2[12];
  uint64_t v5 = (void *)a1[12];
  a1[12] = v4;
  id v6 = v4;

  return a1;
}

uint64_t _s7NewsAds17SponsorshipAdInfoO9FulfilledVwta_0(uint64_t a1, uint64_t a2)
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
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 96);
  long long v8 = *(void **)(a1 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;

  return a1;
}

uint64_t _s7NewsAds17SponsorshipAdInfoO9FulfilledVwet_0(uint64_t a1, int a2)
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

uint64_t sub_1BF9E6250(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for SponsorshipAdInfo.Unfilled()
{
  return &type metadata for SponsorshipAdInfo.Unfilled;
}

uint64_t sub_1BF9E62B8(uint64_t a1)
{
  sub_1BF9E6314();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BF9E6314()
{
  if (!qword_1EA179FA8)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EA179FA8);
    }
  }
}

uint64_t sub_1BF9E6378(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BF9E63B0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BF9E63F8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF95C108(0, (unint64_t *)&qword_1EBA7A298);
  uint64_t result = sub_1BFA16E08();
  if (v6)
  {
    uint64_t v4 = type metadata accessor for AdManager();
    swift_allocObject();
    uint64_t result = (uint64_t)AdManager.init(previewQueue:)((uint64_t)v5);
    a2[3] = v4;
    a2[4] = (uint64_t)&protocol witness table for AdManager;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BF9E64A4(void *a1, void *a2)
{
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v4 = type metadata accessor for ArticleBannerAdProviderFactory();
  uint64_t result = sub_1BFA16DF8();
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v6 = result;
  uint64_t v8 = a1[3];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  uint64_t v69 = v6;
  sub_1BF9C05FC();
  uint64_t inited = swift_initStaticObject();
  uint64_t v10 = *(void (**)(uint64_t *, uint64_t, ValueMetadata *, uint64_t, uint64_t, uint64_t, unint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t))(v7 + 40);
  uint64_t v11 = type metadata accessor for ArticleBannerAdProvider();
  uint64_t v12 = type metadata accessor for ArticleBannerAdPlacement();
  unint64_t v13 = sub_1BF9C069C();
  v10(&v69, inited, &type metadata for ArticleBannerAdContext, v11, v12, v4, v13, &protocol witness table for ArticleBannerAdPlacement, &protocol witness table for ArticleBannerAdProviderFactory, v8, v7);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v14 = type metadata accessor for FeedBannerAdProviderFactory();
  uint64_t result = sub_1BFA16DF8();
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v15 = result;
  uint64_t v17 = a1[3];
  uint64_t v16 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v17);
  uint64_t v69 = v15;
  sub_1BF9C084C();
  uint64_t v18 = swift_initStaticObject();
  long long v19 = *(void (**)(uint64_t *, uint64_t, ValueMetadata *, uint64_t, uint64_t, uint64_t, unint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t))(v16 + 40);
  uint64_t v20 = type metadata accessor for FeedBannerAdProvider();
  uint64_t v21 = type metadata accessor for FeedBannerAdPlacement();
  unint64_t v22 = sub_1BF9C08EC();
  v19(&v69, v18, &type metadata for FeedBannerAdContext, v20, v21, v14, v22, &protocol witness table for FeedBannerAdPlacement, &protocol witness table for FeedBannerAdProviderFactory, v17, v16);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v23 = type metadata accessor for InterstitialAdProviderFactory();
  uint64_t result = sub_1BFA16DF8();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v24 = result;
  uint64_t v25 = a1[3];
  uint64_t v26 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v25);
  uint64_t v69 = v24;
  sub_1BF9C0A9C();
  uint64_t v27 = swift_initStaticObject();
  v64 = *(void (**)(uint64_t *, uint64_t, ValueMetadata *, uint64_t, uint64_t, uint64_t, unint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t))(v26 + 40);
  uint64_t v28 = type metadata accessor for InterstitialAdProvider();
  uint64_t v66 = type metadata accessor for InterstitialAdPlacement();
  unint64_t v29 = sub_1BF9C0B3C();
  v64(&v69, v27, &type metadata for ArticleInterstitialAdContext, v28, v66, v23, v29, &protocol witness table for InterstitialAdPlacement, &protocol witness table for InterstitialAdProviderFactory, v25, v26);
  uint64_t v30 = a1[3];
  uint64_t v31 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v30);
  uint64_t v69 = v24;
  sub_1BF9C0BC4();
  uint64_t v32 = swift_initStaticObject();
  v33 = *(void (**)(uint64_t *, uint64_t, ValueMetadata *, uint64_t, uint64_t, uint64_t, unint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t))(v31 + 40);
  unint64_t v34 = sub_1BF9C0C64();
  v33(&v69, v32, &type metadata for PreviewInterstitialAdContext, v28, v66, v23, v34, &protocol witness table for InterstitialAdPlacement, &protocol witness table for InterstitialAdProviderFactory, v30, v31);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v35 = type metadata accessor for PrerollAdProviderFactory();
  uint64_t result = sub_1BFA16DF8();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v36 = result;
  uint64_t v37 = a1[3];
  uint64_t v38 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v37);
  uint64_t v69 = v36;
  sub_1BF9C0724();
  uint64_t v39 = swift_initStaticObject();
  v65 = *(void (**)(uint64_t *, uint64_t, ValueMetadata *, uint64_t, uint64_t, uint64_t, unint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t))(v38 + 40);
  uint64_t v40 = type metadata accessor for PrerollAdProvider();
  uint64_t v67 = type metadata accessor for PrerollAdPlacement();
  unint64_t v41 = sub_1BF9C07C4();
  v65(&v69, v39, &type metadata for ArticlePrerollAdContext, v40, v67, v35, v41, &protocol witness table for PrerollAdPlacement, &protocol witness table for PrerollAdProviderFactory, v37, v38);
  uint64_t v43 = a1[3];
  uint64_t v42 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v43);
  uint64_t v69 = v36;
  sub_1BF9C0974();
  uint64_t v44 = swift_initStaticObject();
  v45 = *(void (**)(uint64_t *, uint64_t, ValueMetadata *, uint64_t, uint64_t, uint64_t, unint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t))(v42 + 40);
  unint64_t v46 = sub_1BF9C0A14();
  v45(&v69, v44, &type metadata for FeedPrerollAdContext, v40, v67, v35, v46, &protocol witness table for PrerollAdPlacement, &protocol witness table for PrerollAdProviderFactory, v43, v42);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v47 = type metadata accessor for NativeAdProviderFactory();
  uint64_t result = sub_1BFA16DF8();
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v48 = result;
  uint64_t v49 = a1[3];
  uint64_t v50 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v49);
  uint64_t v69 = v48;
  sub_1BF9C0454();
  uint64_t v51 = swift_initStaticObject();
  v68 = *(void (**)(uint64_t *, uint64_t, ValueMetadata *, uint64_t, uint64_t, uint64_t, unint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t))(v50 + 40);
  uint64_t v52 = type metadata accessor for NativeAdProvider();
  uint64_t v53 = type metadata accessor for NativeAdPlacement();
  unint64_t v54 = sub_1BF963E0C();
  v68(&v69, v51, &type metadata for NativeAdContext, v52, v53, v47, v54, &protocol witness table for NativeAdPlacement, &protocol witness table for NativeAdProviderFactory, v49, v50);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v55 = type metadata accessor for SponsorshipAdProviderFactory();
  uint64_t result = sub_1BFA16DF8();
  if (result)
  {
    uint64_t v56 = result;
    uint64_t v57 = a1[3];
    uint64_t v58 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v57);
    uint64_t v69 = v56;
    sub_1BF9C0528();
    uint64_t v59 = swift_initStaticObject();
    v60 = *(void (**)(uint64_t *, uint64_t, ValueMetadata *, uint64_t, uint64_t, uint64_t, unint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t))(v58 + 40);
    uint64_t v61 = type metadata accessor for SponsorshipAdProvider();
    uint64_t v62 = type metadata accessor for SponsorshipAdPlacement();
    unint64_t v63 = sub_1BF95AFA4();
    v60(&v69, v59, &type metadata for SponsorshipAdContext, v61, v62, v55, v63, &protocol witness table for SponsorshipAdPlacement, &protocol witness table for SponsorshipAdProviderFactory, v57, v58);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_1BF9E6B48@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1BFA17E88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1BFA17E68();
  MEMORY[0x1F4188790](v8);
  uint64_t v9 = sub_1BFA179F8();
  MEMORY[0x1F4188790](v9 - 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF95C108(0, &qword_1EBA78AD0);
  uint64_t result = sub_1BFA16E08();
  if (v27)
  {
    sub_1BF95991C(0, (unint64_t *)&qword_1EBA79550);
    sub_1BFA179C8();
    v25[0] = MEMORY[0x1E4FBC860];
    sub_1BF9EAB10((unint64_t *)&unk_1EBA79540, MEMORY[0x1E4FBCC10]);
    sub_1BF9EAC58(0, &qword_1EBA79510, MEMORY[0x1E4FBCC10], MEMORY[0x1E4FBB320]);
    sub_1BF9EAB58();
    sub_1BFA17F78();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCC58], v4);
    uint64_t v11 = (void *)sub_1BFA17EB8();
    uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    MEMORY[0x1F4188790](v12);
    uint64_t v14 = (void *)((char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v15 + 16))(v14);
    uint64_t v16 = *v14;
    uint64_t v17 = type metadata accessor for AdSegmentUpdater();
    v25[3] = v17;
    v25[4] = &off_1F1B1C368;
    v25[0] = v16;
    uint64_t v18 = type metadata accessor for AdSegmentManager();
    uint64_t v19 = swift_allocObject();
    uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v17);
    MEMORY[0x1F4188790](v20);
    unint64_t v22 = (void *)((char *)v25 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v23 + 16))(v22);
    uint64_t v24 = sub_1BF9EA1E4(*v22, v11, v19, 10.0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    a2[3] = v18;
    a2[4] = (uint64_t)&off_1F1B18C88;
    *a2 = v24;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BF9E6FB8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF95C108(0, &qword_1EBA78EC8);
  uint64_t result = sub_1BFA16E08();
  if (v19)
  {
    uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v19);
    MEMORY[0x1F4188790](v4);
    uint64_t v6 = (void *)((char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v7 + 16))(v6);
    uint64_t v8 = *v6;
    uint64_t v9 = type metadata accessor for AdStatusConditionReporter();
    v17[3] = v9;
    v17[4] = &off_1F1B1C088;
    v17[0] = v8;
    uint64_t v10 = type metadata accessor for AdStatusConditionManager();
    uint64_t v11 = (void *)swift_allocObject();
    uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v9);
    MEMORY[0x1F4188790](v12);
    uint64_t v14 = (void *)((char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v15 + 16))(v14);
    uint64_t v16 = *v14;
    v11[5] = v9;
    v11[6] = &off_1F1B1C088;
    v11[2] = v16;
    v11[7] = MEMORY[0x1E4FBC860];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    a2[3] = v10;
    a2[4] = &protocol witness table for AdStatusConditionManager;
    *a2 = v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BF9E71EC(uint64_t a1, void *a2)
{
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v2 = type metadata accessor for AdsModuleStartupTask();
  uint64_t result = sub_1BFA16DF8();
  if (result)
  {
    uint64_t v4 = result;
    _OWORD v5[3] = v2;
    v5[4] = sub_1BF9EAB10((unint64_t *)&unk_1EBA77F00, (void (*)(uint64_t))type metadata accessor for AdsModuleStartupTask);
    v5[0] = v4;
    sub_1BFA16EF8();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BF9E72B4(uint64_t a1, void *a2)
{
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  type metadata accessor for AdContextManager();
  sub_1BF95BBDC(a1, (uint64_t)v5);
  uint64_t v3 = swift_allocObject();
  sub_1BF95BCD0(v5, v3 + 16);
  sub_1BFA16DE8();
  swift_release();
  return swift_release();
}

uint64_t sub_1BF9E737C(void *a1)
{
  return sub_1BFA16D98();
}

uint64_t sub_1BF9E73E4@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BF9E7820((uint64_t (*)(void))type metadata accessor for VideoAdTracker, (uint64_t)&off_1F1B18578, a1);
}

uint64_t sub_1BF9E7404()
{
  uint64_t v13 = sub_1BFA16FF8();
  uint64_t v0 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AdsModuleStartupTask();
  sub_1BFA16F28();
  sub_1BF9EAC58(0, &qword_1EBA77D50, MEMORY[0x1E4FAB158], MEMORY[0x1E4FBBE00]);
  uint64_t v3 = sub_1BFA17118();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 72);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1BFA195C0;
  unint64_t v8 = v7 + v6;
  uint64_t v9 = *(void (**)(unint64_t, void, uint64_t))(v4 + 104);
  v9(v8, *MEMORY[0x1E4FAB140], v3);
  v9(v8 + v5, *MEMORY[0x1E4FAB148], v3);
  sub_1BFA16CF8();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1BF95C108(0, &qword_1EBA78AD0);
  sub_1BFA16F38();
  swift_release();
  sub_1BF95C108(0, &qword_1EBA78EC8);
  sub_1BFA16F38();
  swift_release();
  type metadata accessor for AdContextManager();
  sub_1BFA16F28();
  uint64_t v10 = v13;
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x1E4FAB040], v13);
  sub_1BFA16D18();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v0 + 8))(v2, v10);
}

uint64_t sub_1BF9E7748(uint64_t a1)
{
  sub_1BF95BBDC(a1, (uint64_t)v3);
  type metadata accessor for AdsModuleStartupTask();
  uint64_t v1 = swift_allocObject();
  sub_1BF95BCD0(v3, v1 + 16);
  *(unsigned char *)(v1 + 56) = 0;
  return v1;
}

uint64_t sub_1BF9E77A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1BF95BBDC(a1, (uint64_t)v5);
  type metadata accessor for AdsModuleStartupTask();
  uint64_t v3 = swift_allocObject();
  uint64_t result = sub_1BF95BCD0(v5, v3 + 16);
  *(unsigned char *)(v3 + 56) = 1;
  *a2 = v3;
  return result;
}

uint64_t sub_1BF9E7800@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BF9E7820((uint64_t (*)(void))type metadata accessor for AdSegmentUpdater, (uint64_t)&off_1F1B1C368, a1);
}

uint64_t sub_1BF9E7820@<X0>(uint64_t (*a1)(void)@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v5 = a1(0);
  uint64_t result = swift_allocObject();
  a3[3] = v5;
  a3[4] = a2;
  *a3 = result;
  return result;
}

uint64_t sub_1BF9E7870@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for AdStatusConditionReporter();
  swift_allocObject();
  uint64_t result = sub_1BFA0DD58();
  a1[3] = v2;
  a1[4] = (uint64_t)&off_1F1B1C088;
  *a1 = result;
  return result;
}

uint64_t sub_1BF9E78C8(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF95C108(0, (unint64_t *)&qword_1EBA7A3C8);
  uint64_t result = sub_1BFA16E08();
  if (v6)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1BF95991C(0, &qword_1EBA79558);
    uint64_t result = sub_1BFA16DF8();
    if (result)
    {
      uint64_t v3 = result;
      type metadata accessor for AdContextManager();
      uint64_t v4 = swift_allocObject();
      sub_1BF95BBDC((uint64_t)v5, v4 + 16);
      *(void *)(v4 + 56) = v3;
      sub_1BF9B65F8();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
      return v4;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ManagerAssembly()
{
  return self;
}

uint64_t sub_1BF9E79E8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1BF9EABE0(0, &qword_1EA1797C0, &qword_1EA1797C8, (uint64_t)&type metadata for AdPreviewQueue.AdPreviewWrapper, MEMORY[0x1E4FBBD58]);
  char v36 = a2;
  uint64_t v6 = sub_1BFA18108();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1BFA182F8();
    sub_1BFA17BA8();
    uint64_t result = sub_1BFA18318();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BF9E7D28(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1BF99C2CC(0, &qword_1EA179FB0);
  char v42 = a2;
  uint64_t v6 = sub_1BFA18108();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    int64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1BFA182F8();
    sub_1BFA17BA8();
    uint64_t result = sub_1BFA18318();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    void *v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BF9E805C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1BF99C678();
  char v37 = a2;
  uint64_t v6 = sub_1BFA18108();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    unint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    unint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    unint64_t v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_1BF95BCD0(v25, (uint64_t)v38);
    }
    else
    {
      sub_1BF95BBDC((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_1BFA182F8();
    sub_1BFA17BA8();
    uint64_t result = sub_1BFA18318();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *unint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_1BF95BCD0(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BF9E8380(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1BF99BF28();
  char v6 = a2;
  uint64_t v7 = sub_1BFA18108();
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  uint64_t v32 = v2;
  int64_t v33 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v19 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v33) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v34 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v33) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v34 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v33)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v32;
          if ((v6 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v33) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v34 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_30:
    unint64_t v11 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    char v29 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
    uint64_t v30 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v6 & 1) == 0) {
      swift_retain();
    }
    sub_1BFA182F8();
    sub_1BFA17BA8();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1BFA18318();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v17 == v26;
        if (v17 == v26) {
          unint64_t v17 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(unsigned char *)(*(void *)(v8 + 48) + v18) = v29;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v30;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v3 = v32;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v6 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
  if (v31 >= 64) {
    bzero(v22, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v31;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v8;
  return result;
}

uint64_t sub_1BF9E86A8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1BF99C2CC(0, &qword_1EBA77878);
  char v44 = a2;
  uint64_t v6 = sub_1BFA18108();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v43 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v41 = v2;
  int64_t v42 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v42) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v43 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v42) {
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v43 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v42)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v41;
          if ((v44 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = *(void *)(v43 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v42) {
              goto LABEL_34;
            }
            unint64_t v24 = *(void *)(v43 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_21:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_22:
    unint64_t v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v5 + 56) + 72 * v21;
    if (v44)
    {
      long long v45 = *(_OWORD *)v29;
      long long v30 = *(_OWORD *)(v29 + 16);
      long long v31 = *(_OWORD *)(v29 + 32);
      long long v32 = *(_OWORD *)(v29 + 48);
      uint64_t v49 = *(void *)(v29 + 64);
      long long v47 = v31;
      long long v48 = v32;
      long long v46 = v30;
    }
    else
    {
      sub_1BF9BD0B0(v29, (uint64_t)&v45);
      swift_bridgeObjectRetain();
    }
    sub_1BFA182F8();
    sub_1BFA17BA8();
    uint64_t result = sub_1BFA18318();
    uint64_t v33 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v11 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v34) & ~*(void *)(v11 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v11 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v14 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *uint64_t v15 = v28;
    v15[1] = v27;
    uint64_t v16 = *(void *)(v7 + 56) + 72 * v14;
    *(_OWORD *)uint64_t v16 = v45;
    long long v17 = v46;
    long long v18 = v47;
    long long v19 = v48;
    *(void *)(v16 + 64) = v49;
    *(_OWORD *)(v16 + 32) = v18;
    *(_OWORD *)(v16 + 48) = v19;
    *(_OWORD *)(v16 + 16) = v17;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v41;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v44 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v5 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v40;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BF9E8A0C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1BF99C4E0();
  char v31 = a2;
  uint64_t result = sub_1BFA18108();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    long long v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v29 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v14 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v15 = v14 | (v8 << 6);
      }
      else
      {
        int64_t v16 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v16 >= v29) {
          goto LABEL_35;
        }
        unint64_t v17 = v30[v16];
        ++v8;
        if (!v17)
        {
          int64_t v8 = v16 + 1;
          if (v16 + 1 >= v29) {
            goto LABEL_35;
          }
          unint64_t v17 = v30[v8];
          if (!v17)
          {
            int64_t v18 = v16 + 2;
            if (v18 >= v29)
            {
LABEL_35:
              if ((v31 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_42;
              }
              uint64_t v28 = 1 << *(unsigned char *)(v5 + 32);
              if (v28 >= 64) {
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *long long v30 = -1 << v28;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v17 = v30[v18];
            if (!v17)
            {
              while (1)
              {
                int64_t v8 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_44;
                }
                if (v8 >= v29) {
                  goto LABEL_35;
                }
                unint64_t v17 = v30[v8];
                ++v18;
                if (v17) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v18;
          }
        }
LABEL_21:
        unint64_t v11 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v8 << 6);
      }
      unint64_t v19 = *(unsigned __int8 *)(*(void *)(v5 + 48) + v15);
      uint64_t v20 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
      if ((v31 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_1BFA182F8();
      if (v19 >> 6 <= 1) {
        sub_1BFA18308();
      }
      sub_1BFA18308();
      uint64_t result = sub_1BFA18318();
      uint64_t v21 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v12 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(unsigned char *)(*(void *)(v7 + 48) + v13) = v19;
      *(void *)(*(void *)(v7 + 56) + 8 * v13) = v20;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_42:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1BF9E8D18(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1BF99C2CC(0, &qword_1EBA795C8);
  char v6 = a2;
  uint64_t v7 = sub_1BFA18108();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v35 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v34 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v14 << 6);
      }
      else
      {
        int64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v19 >= v34) {
          goto LABEL_34;
        }
        unint64_t v20 = v35[v19];
        ++v14;
        if (!v20)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v34) {
            goto LABEL_34;
          }
          unint64_t v20 = v35[v14];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v34)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v35 = -1 << v33;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v20 = v35[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v14 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_41;
                }
                if (v14 >= v34) {
                  goto LABEL_34;
                }
                unint64_t v20 = v35[v14];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v14 = v21;
          }
        }
LABEL_21:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }
      unint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v18);
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
      unint64_t v25 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v18);
      if (v6)
      {
        sub_1BF992514(v25, v36);
      }
      else
      {
        sub_1BF9911FC((uint64_t)v25, (uint64_t)v36);
        swift_bridgeObjectRetain();
      }
      sub_1BFA182F8();
      sub_1BFA17BA8();
      uint64_t result = sub_1BFA18318();
      uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v12 + 8 * v28);
        }
        while (v32 == -1);
        unint64_t v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      int64_t v16 = (void *)(*(void *)(v8 + 48) + 16 * v15);
      *int64_t v16 = v24;
      v16[1] = v23;
      uint64_t result = (uint64_t)sub_1BF992514(v36, (_OWORD *)(*(void *)(v8 + 56) + 32 * v15));
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v8;
  return result;
}

uint64_t sub_1BF9E902C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1BF99C1C4();
  char v39 = a2;
  uint64_t v6 = sub_1BFA18108();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  unint64_t v37 = v2;
  uint64_t v38 = v5 + 64;
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
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v11) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v38 + 8 * v23);
    ++v14;
    if (!v25)
    {
      int64_t v14 = v23 + 1;
      if (v23 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v38 + 8 * v14);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v37;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v14 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v38 + 8 * v14);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v14 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    long long v40 = *(_OWORD *)(*(void *)(v5 + 56) + v31);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v35 = (id)v40;
    }
    sub_1BFA182F8();
    sub_1BFA17BA8();
    uint64_t result = sub_1BFA18318();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v17 == v28;
        if (v17 == v28) {
          unint64_t v17 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v12 + 8 * v17);
      }
      while (v30 == -1);
      unint64_t v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 16 * v18;
    unint64_t v20 = (void *)(*(void *)(v7 + 48) + v19);
    void *v20 = v34;
    v20[1] = v33;
    *(_OWORD *)(*(void *)(v7 + 56) + v19) = v40;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v37;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
  if (v36 >= 64) {
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v36;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_1BF9E9344()
{
  uint64_t v1 = v0;
  sub_1BF9EABE0(0, &qword_1EA1797C0, &qword_1EA1797C8, (uint64_t)&type metadata for AdPreviewQueue.AdPreviewWrapper, MEMORY[0x1E4FBBD58]);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BFA180F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v6 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v8 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v9 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v2 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v8 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v12) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v8;
    if (!v22)
    {
      int64_t v8 = v21 + 1;
      if (v21 + 1 >= v12) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v8);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v11 = (v22 - 1) & v22;
    unint64_t v14 = __clz(__rbit64(v22)) + (v8 << 6);
LABEL_9:
    uint64_t v15 = 16 * v14;
    unint64_t v16 = (void *)(*(void *)(v2 + 48) + 16 * v14);
    uint64_t v17 = v16[1];
    uint64_t v18 = 8 * v14;
    uint64_t v19 = *(void *)(*(void *)(v2 + 56) + v18);
    unint64_t v20 = (void *)(*(void *)(v4 + 48) + v15);
    void *v20 = *v16;
    v20[1] = v17;
    *(void *)(*(void *)(v4 + 56) + v18) = v19;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v12) {
    goto LABEL_23;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v8 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v8 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v8 >= v12) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v8);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_1BF9E9528()
{
  uint64_t v1 = v0;
  sub_1BF99C2CC(0, &qword_1EA179FB0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BFA180F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *uint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BF9E96F0()
{
  uint64_t v1 = v0;
  sub_1BF99C678();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BFA180F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 40 * v15;
    sub_1BF95BBDC(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_1BF95BCD0(v26, *(void *)(v4 + 56) + v20);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1BF9E98D8()
{
  uint64_t v1 = v0;
  sub_1BF99BF28();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BFA180F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BF9E9A78()
{
  uint64_t v1 = v0;
  sub_1BF99C2CC(0, &qword_1EBA77878);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BFA180F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v29 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v26 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v6 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 72 * v15;
    sub_1BF9BD0B0(*(void *)(v2 + 56) + 72 * v15, (uint64_t)v30);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    uint64_t v22 = *(void *)(v4 + 56) + v20;
    *(_OWORD *)uint64_t v22 = v30[0];
    long long v23 = v30[1];
    long long v24 = v30[2];
    long long v25 = v30[3];
    *(void *)(v22 + 64) = v31;
    *(_OWORD *)(v22 + 32) = v24;
    *(_OWORD *)(v22 + 48) = v25;
    *(_OWORD *)(v22 + 16) = v23;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v29;
    goto LABEL_28;
  }
  unint64_t v27 = *(void *)(v6 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1BF9E9C8C()
{
  uint64_t v1 = v0;
  sub_1BF99C4E0();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BFA180F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BF9E9E2C()
{
  uint64_t v1 = v0;
  sub_1BF99C2CC(0, &qword_1EBA795C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BFA180F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  long long v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_1BF9911FC(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_1BF992514(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1BF9EA024()
{
  uint64_t v1 = v0;
  sub_1BF99C1C4();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BFA180F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v24 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    uint64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    void *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    id result = (id)v24;
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1BF9EA1E4(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  uint64_t v8 = sub_1BFA16D68();
  MEMORY[0x1F4188790](v8 - 8);
  v42[3] = type metadata accessor for AdSegmentUpdater();
  v42[4] = &off_1F1B1C368;
  v42[0] = a1;
  uint64_t v9 = MEMORY[0x1E4FBC860];
  *(void *)(a3 + 56) = sub_1BF999590(MEMORY[0x1E4FBC860]);
  sub_1BFA16D58();
  sub_1BFA16D88();
  swift_allocObject();
  *(void *)(a3 + 64) = sub_1BFA16D78();
  *(void *)(a3 + 72) = sub_1BF999700(v9);
  *(void *)(a3 + 80) = 0;
  sub_1BF95BBDC((uint64_t)v42, a3 + 16);
  *(double *)(a3 + 88) = a4;
  *(void *)(a3 + 96) = a2;
  id v40 = a2;
  uint64_t v10 = (void *)sub_1BF999700(v9);
  sub_1BF9EABE0(0, &qword_1EBA77E08, (unint64_t *)&qword_1EBA794F0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FAB018]);
  uint64_t v12 = v11;
  char v13 = byte_1F1B14710;
  swift_allocObject();
  unint64_t v14 = sub_1BFA16FB8();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v41 = v10;
  unint64_t v17 = sub_1BF9A7464(v13);
  uint64_t v18 = v10[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19)) {
    goto LABEL_20;
  }
  char v21 = v16;
  if (v10[3] < v20)
  {
    sub_1BF9E8380(v20, isUniquelyReferenced_nonNull_native);
    unint64_t v22 = sub_1BF9A7464(v13);
    if ((v21 & 1) != (v23 & 1)) {
      goto LABEL_26;
    }
    unint64_t v17 = v22;
    if ((v21 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v24 = v10[7];
    swift_release();
    *(void *)(v24 + 8 * v17) = v14;
    goto LABEL_12;
  }
  if (isUniquelyReferenced_nonNull_native)
  {
    if (v16) {
      goto LABEL_8;
    }
  }
  else
  {
    sub_1BF9E98D8();
    if (v21) {
      goto LABEL_8;
    }
  }
LABEL_10:
  v10[(v17 >> 6) + 8] |= 1 << v17;
  *(unsigned char *)(v10[6] + v17) = v13;
  *(void *)(v10[7] + 8 * v17) = v14;
  uint64_t v25 = v10[2];
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (v26)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v10[2] = v27;
LABEL_12:
  swift_bridgeObjectRelease();
  char v13 = byte_1F1B14711;
  swift_allocObject();
  uint64_t v12 = sub_1BFA16FB8();
  char v28 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v41 = v10;
  unint64_t v14 = sub_1BF9A7464(v13);
  uint64_t v30 = v10[2];
  BOOL v31 = (v29 & 1) == 0;
  uint64_t v32 = v30 + v31;
  if (__OFADD__(v30, v31))
  {
LABEL_20:
    __break(1u);
LABEL_21:
    sub_1BF9E98D8();
    id v35 = v41;
    if ((v17 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  LOBYTE(v17) = v29;
  if (v10[3] >= v32)
  {
    if (v28)
    {
      id v35 = v10;
      if ((v29 & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  sub_1BF9E8380(v32, v28);
  unint64_t v33 = sub_1BF9A7464(v13);
  if ((v17 & 1) == (v34 & 1))
  {
    unint64_t v14 = v33;
    id v35 = v10;
    if ((v17 & 1) == 0)
    {
LABEL_22:
      v35[(v14 >> 6) + 8] |= 1 << v14;
      *(unsigned char *)(v35[6] + v14) = v13;
      *(void *)(v35[7] + 8 * v14) = v12;
      uint64_t v37 = v35[2];
      BOOL v26 = __OFADD__(v37, 1);
      uint64_t v38 = v37 + 1;
      if (!v26)
      {
        v35[2] = v38;
        goto LABEL_24;
      }
      goto LABEL_25;
    }
LABEL_19:
    uint64_t v36 = v35[7];
    swift_release();
    *(void *)(v36 + 8 * v14) = v12;
LABEL_24:
    swift_bridgeObjectRelease();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    swift_beginAccess();
    *(void *)(a3 + 72) = v35;
    swift_bridgeObjectRelease();
    return a3;
  }
LABEL_26:
  uint64_t result = sub_1BFA18298();
  __break(1u);
  return result;
}

uint64_t sub_1BF9EA5C4(uint64_t a1)
{
  v16[0] = sub_1BFA16E18();
  uint64_t v17 = *(void *)(v16[0] - 8);
  MEMORY[0x1F4188790](v16[0]);
  uint64_t v3 = (void *)((char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_1BFA16FF8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = a1;
  sub_1BFA16E28();
  sub_1BF95C108(0, qword_1EBA79FA0);
  sub_1BFA16F38();
  swift_release();
  sub_1BFA16D08();
  swift_release();
  uint64_t v8 = *MEMORY[0x1E4FAB040];
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v9(v7, v8, v4);
  sub_1BFA16D18();
  swift_release();
  swift_release();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v5 + 8);
  v10(v7, v4);
  sub_1BFA16E28();
  sub_1BF95C108(0, &qword_1EBA7A3D0);
  sub_1BFA16F38();
  swift_release();
  v9(v7, v8, v4);
  sub_1BFA16D18();
  swift_release();
  swift_release();
  v10(v7, v4);
  sub_1BFA16E28();
  sub_1BF95C108(0, &qword_1EBA7AAE0);
  sub_1BFA16F38();
  swift_release();
  swift_release();
  sub_1BFA16E48();
  __swift_project_boxed_opaque_existential_1(v18, v19);
  sub_1BFA16F08();
  uint64_t v11 = v17;
  uint64_t v12 = *(void (**)(void *, void, uint64_t))(v17 + 104);
  uint64_t v13 = v16[0];
  v12(v3, *MEMORY[0x1E4FAAA00], v16[0]);
  sub_1BFA16F48();
  unint64_t v14 = *(void (**)(void *, uint64_t))(v11 + 8);
  uint64_t v17 = v11 + 8;
  v14(v3, v13);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  sub_1BFA16E48();
  __swift_project_boxed_opaque_existential_1(v18, v19);
  sub_1BF95C108(0, (unint64_t *)&qword_1EBA7A3C8);
  *uint64_t v3 = 7368801;
  v3[1] = 0xE300000000000000;
  v12(v3, *MEMORY[0x1E4FAAA08], v13);
  sub_1BFA16F58();
  v14(v3, v13);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  sub_1BFA16E28();
  sub_1BF95C108(0, &qword_1EBA7B1F0);
  sub_1BFA16F38();
  swift_release();
  swift_release();
  sub_1BFA16E38();
  sub_1BFA16F18();
  return swift_release();
}

uint64_t sub_1BF9EAAD0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1BF9EAB08(void *a1)
{
  return sub_1BF9E737C(a1);
}

uint64_t sub_1BF9EAB10(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1BF9EAB58()
{
  unint64_t result = qword_1EBA79518;
  if (!qword_1EBA79518)
  {
    sub_1BF9EAC58(255, &qword_1EBA79510, MEMORY[0x1E4FBCC10], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA79518);
  }
  return result;
}

void sub_1BF9EABE0(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, void, uint64_t, void))
{
  if (!*a2)
  {
    sub_1BF9E2620(255, a3);
    unint64_t v9 = a5(a1, MEMORY[0x1E4FBB1A0], v8, MEMORY[0x1E4FBB1B0]);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_1BF9EAC58(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t dispatch thunk of PromotedContentContextWrapperType.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PromotedContentContextWrapperType.prewarm<A>(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

double sub_1BF9EACE4(uint64_t a1)
{
  MEMORY[0x1F4188790](a1);
  (*(void (**)(char *))(v2 + 16))((char *)v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BF9EB194();
  if (swift_dynamicCast())
  {
    sub_1BF95BCD0(v9, (uint64_t)v11);
    uint64_t v3 = v12;
    uint64_t v4 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    double v5 = (*(double (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
    sub_1BF9EB1EC((uint64_t)v9);
    id v6 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v6, sel_bounds);
    double v5 = v7;
  }
  return v5;
}

uint64_t sub_1BF9EAE70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1BF9EB288(0, &qword_1EBA795D0, MEMORY[0x1E4F93D90], MEMORY[0x1E4FBBE00]);
  sub_1BFA17278();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1BFA195D0;
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  sub_1BFA17698();
  return swift_bridgeObjectRelease();
}

id sub_1BF9EAF9C()
{
  return *v0;
}

uint64_t sub_1BF9EAFA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BF9EAE70(a1, *v3, a2, a3);
}

uint64_t sub_1BF9EAFB4(void *a1, uint64_t a2)
{
  sub_1BF9EACE4(a2);
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  id v7 = objc_allocWithZone((Class)sub_1BFA17228());
  unint64_t v8 = (void *)sub_1BFA17218();
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10))
  {
    sub_1BFA171F8();
    swift_unknownObjectRelease();
  }
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[5];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v12 + 24))(v11, v12))
  {
    sub_1BFA171F8();
    swift_unknownObjectRelease();
  }
  uint64_t v13 = sub_1BFA17208();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v13;
}

unint64_t sub_1BF9EB194()
{
  unint64_t result = qword_1EBA78C70;
  if (!qword_1EBA78C70)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA78C70);
  }
  return result;
}

uint64_t sub_1BF9EB1EC(uint64_t a1)
{
  sub_1BF9EB288(0, &qword_1EBA78C78, (uint64_t (*)(uint64_t))sub_1BF9EB194, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for PromotedContentContextWrapper()
{
  return &type metadata for PromotedContentContextWrapper;
}

void sub_1BF9EB288(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

id DebugJournalSummaryView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

char *DebugJournalSummaryView.init(frame:)(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifierLabel;
  id v12 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  uint64_t v13 = v4;
  *(void *)&v5[v11] = objc_msgSend(v12, sel_init);
  uint64_t v14 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifier;
  *(void *)&v13[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v15 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifierLabel;
  *(void *)&v13[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v16 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifier;
  *(void *)&v13[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v17 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusLabel;
  *(void *)&v13[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v18 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_status;
  *(void *)&v13[v18] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v19 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusIndicator;
  *(void *)&v13[v19] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v20 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_moreDetailsButton;
  char v21 = self;
  *(void *)&v13[v20] = objc_msgSend(v21, sel_buttonWithType_, 0);
  uint64_t v22 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapMoreDetails;
  sub_1BF9EB73C();
  uint64_t v24 = v23;
  *(void *)&v13[v22] = objc_msgSend(objc_allocWithZone(v23), sel_init);
  uint64_t v25 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_buttonSeparator;
  *(void *)&v13[v25] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v26 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_reportIssueButton;
  *(void *)&v13[v26] = objc_msgSend(v21, sel_buttonWithType_, 0);
  uint64_t v27 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapReportIssue;
  *(void *)&v13[v27] = objc_msgSend(objc_allocWithZone(v24), sel_init);
  uint64_t v28 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_topSeparator;
  *(void *)&v13[v28] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v29 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_bottomSeparator;
  *(void *)&v13[v29] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);

  v41.receiver = v13;
  v41.super_class = ObjectType;
  uint64_t v30 = (char *)objc_msgSendSuper2(&v41, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v31 = *(void *)&v30[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifierLabel];
  uint64_t v32 = v30;
  objc_msgSend(v32, sel_addSubview_, v31);
  objc_msgSend(v32, sel_addSubview_, *(void *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifier]);
  objc_msgSend(v32, sel_addSubview_, *(void *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifierLabel]);
  objc_msgSend(v32, sel_addSubview_, *(void *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifier]);
  objc_msgSend(v32, sel_addSubview_, *(void *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusLabel]);
  objc_msgSend(v32, sel_addSubview_, *(void *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_status]);
  objc_msgSend(v32, sel_addSubview_, *(void *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusIndicator]);
  unint64_t v33 = *(void **)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_moreDetailsButton];
  objc_msgSend(v32, sel_addSubview_, v33);
  objc_msgSend(v32, sel_addSubview_, *(void *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_buttonSeparator]);
  uint64_t v34 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_reportIssueButton;
  objc_msgSend(v32, sel_addSubview_, *(void *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_reportIssueButton]);
  objc_msgSend(v32, sel_addSubview_, *(void *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_topSeparator]);
  objc_msgSend(v32, sel_addSubview_, *(void *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_bottomSeparator]);
  id v35 = *(id *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapMoreDetails];
  id v36 = v33;
  sub_1BFA17908();

  uint64_t v37 = *(void **)&v32[v34];
  id v38 = *(id *)&v32[OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapReportIssue];
  id v39 = v37;
  sub_1BFA17908();

  return v32;
}

void sub_1BF9EB73C()
{
  if (!qword_1EBA77E48)
  {
    unint64_t v0 = sub_1BFA17918();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA77E48);
    }
  }
}

id DebugJournalSummaryView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id DebugJournalSummaryView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void _s7NewsAds23DebugJournalSummaryViewC5coderACSgSo7NSCoderC_tcfc_0()
{
  uint64_t v1 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifierLabel;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifier;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v3 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifierLabel;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v4 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifier;
  *(void *)&v0[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v5 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusLabel;
  *(void *)&v0[v5] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v6 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_status;
  *(void *)&v0[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v7 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusIndicator;
  *(void *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v8 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_moreDetailsButton;
  id v9 = self;
  *(void *)&v0[v8] = objc_msgSend(v9, sel_buttonWithType_, 0);
  uint64_t v10 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapMoreDetails;
  sub_1BF9EB73C();
  id v12 = v11;
  *(void *)&v0[v10] = objc_msgSend(objc_allocWithZone(v11), sel_init);
  uint64_t v13 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_buttonSeparator;
  *(void *)&v0[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v14 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_reportIssueButton;
  *(void *)&v0[v14] = objc_msgSend(v9, sel_buttonWithType_, 0);
  uint64_t v15 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapReportIssue;
  *(void *)&v0[v15] = objc_msgSend(objc_allocWithZone(v12), sel_init);
  uint64_t v16 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_topSeparator;
  *(void *)&v0[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v17 = OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_bottomSeparator;
  *(void *)&v0[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);

  sub_1BFA180C8();
  __break(1u);
}

uint64_t type metadata accessor for DebugJournalSummaryView()
{
  return self;
}

uint64_t ANFComponentAdData.metadata.getter()
{
  return swift_bridgeObjectRetain();
}

NewsAds::ANFComponentAdData __swiftcall ANFComponentAdData.init(metadata:)(NewsAds::ANFComponentAdData metadata)
{
  v1->metadata._rawValue = metadata.metadata._rawValue;
  return metadata;
}

uint64_t sub_1BF9EBBD8@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  return ANFComponentAdData.init(from:)(a1, a2);
}

uint64_t ANFComponentAdData.init(from:)@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  v23[4] = *(id *)MEMORY[0x1E4F143B8];
  sub_1BF9EC444(0, &qword_1EA17A028, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  id v9 = (char *)&v20 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF9EBEB0();
  sub_1BFA18328();
  if (!v2)
  {
    sub_1BF9EBF04();
    sub_1BFA181B8();
    char v21 = a2;
    id v11 = v23[0];
    id v10 = v23[1];
    id v12 = self;
    uint64_t v13 = (void *)sub_1BFA16928();
    v23[0] = 0;
    id v14 = objc_msgSend(v12, sel_JSONObjectWithData_options_error_, v13, 0, v23);

    if (v14)
    {
      id v15 = v23[0];
      sub_1BFA17F58();
      swift_unknownObjectRelease();
      sub_1BF9EC3D8();
      if (swift_dynamicCast()) {
        unint64_t v16 = v22;
      }
      else {
        unint64_t v16 = sub_1BF999800(MEMORY[0x1E4FBC860]);
      }
      sub_1BF977AB0((uint64_t)v11, (unint64_t)v10);
      uint64_t v18 = v21;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      *uint64_t v18 = v16;
    }
    else
    {
      id v17 = v23[0];
      sub_1BFA168A8();

      swift_willThrow();
      sub_1BF977AB0((uint64_t)v11, (unint64_t)v10);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1BF9EBEB0()
{
  unint64_t result = qword_1EA17A030;
  if (!qword_1EA17A030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A030);
  }
  return result;
}

unint64_t sub_1BF9EBF04()
{
  unint64_t result = qword_1EA17A038;
  if (!qword_1EA17A038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A038);
  }
  return result;
}

uint64_t sub_1BF9EBF58(void *a1)
{
  return ANFComponentAdData.encode(to:)(a1);
}

uint64_t ANFComponentAdData.encode(to:)(void *a1)
{
  v17[2] = *(id *)MEMORY[0x1E4F143B8];
  sub_1BF9EC444(0, &qword_1EA17A048, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v17[-1] - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF9EBEB0();
  sub_1BFA18338();
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_1BFA17A78();
  v17[0] = 0;
  id v9 = objc_msgSend(v7, sel_dataWithJSONObject_options_error_, v8, 0, v17);

  id v10 = v17[0];
  if (v9)
  {
    id v11 = (void *)sub_1BFA16938();
    uint64_t v13 = v12;

    v17[0] = v11;
    v17[1] = v13;
    sub_1BF9EC4A8();
    sub_1BFA18228();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return sub_1BF977AB0((uint64_t)v11, (unint64_t)v13);
  }
  else
  {
    id v15 = v10;
    sub_1BFA168A8();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_1BF9EC1C4()
{
  return sub_1BFA18318();
}

uint64_t sub_1BF9EC218()
{
  return sub_1BFA17BA8();
}

uint64_t sub_1BF9EC230()
{
  return sub_1BFA18318();
}

uint64_t sub_1BF9EC280@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1BFA18148();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1BF9EC2D4(void *a1@<X8>)
{
  *a1 = 0x617461646174656DLL;
  a1[1] = 0xE800000000000000;
}

uint64_t sub_1BF9EC2F0()
{
  return 0x617461646174656DLL;
}

uint64_t sub_1BF9EC308@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1BFA18148();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_1BF9EC360(uint64_t a1)
{
  unint64_t v2 = sub_1BF9EBEB0();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BF9EC39C(uint64_t a1)
{
  unint64_t v2 = sub_1BF9EBEB0();
  return MEMORY[0x1F41862B0](a1, v2);
}

void sub_1BF9EC3D8()
{
  if (!qword_1EA17A040)
  {
    unint64_t v0 = sub_1BFA17AA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA17A040);
    }
  }
}

void sub_1BF9EC444(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BF9EBEB0();
    unint64_t v7 = a3(a1, &type metadata for ANFComponentAdData.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_1BF9EC4A8()
{
  unint64_t result = qword_1EA17A050;
  if (!qword_1EA17A050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A050);
  }
  return result;
}

unint64_t sub_1BF9EC4FC(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1BF9C47B8();
  unint64_t result = sub_1BF9C3438();
  *(void *)(a1 + 16) = result;
  return result;
}

ValueMetadata *type metadata accessor for ANFComponentAdData()
{
  return &type metadata for ANFComponentAdData;
}

unsigned char *storeEnumTagSinglePayload for ANFComponentAdData.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BF9EC5D8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ANFComponentAdData.CodingKeys()
{
  return &type metadata for ANFComponentAdData.CodingKeys;
}

unint64_t sub_1BF9EC614()
{
  unint64_t result = qword_1EA17A058;
  if (!qword_1EA17A058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A058);
  }
  return result;
}

unint64_t sub_1BF9EC66C()
{
  unint64_t result = qword_1EA17A060;
  if (!qword_1EA17A060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A060);
  }
  return result;
}

unint64_t sub_1BF9EC6C4()
{
  unint64_t result = qword_1EA17A068;
  if (!qword_1EA17A068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A068);
  }
  return result;
}

void *InterstitialAdViewManager.__allocating_init(adManager:adRequestStore:journal:)(long long *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (void *)swift_allocObject();
  v6[9] = sub_1BFA17A58();
  sub_1BF95BCD0(a1, (uint64_t)(v6 + 2));
  v6[7] = a2;
  v6[8] = a3;
  return v6;
}

void *InterstitialAdViewManager.init(adManager:adRequestStore:journal:)(long long *a1, uint64_t a2, uint64_t a3)
{
  v3[9] = sub_1BFA17A58();
  sub_1BF95BCD0(a1, (uint64_t)(v3 + 2));
  v3[7] = a2;
  v3[8] = a3;
  return v3;
}

uint64_t InterstitialAdViewManager.generateInsertion(for:placementIdentifier:size:contentFetched:)(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *), uint64_t a5, double a6, double a7)
{
  uint64_t v58 = a4;
  uint64_t v59 = a5;
  uint64_t v57 = a2;
  uint64_t v50 = a1;
  uint64_t v11 = *(void *)(*(void *)v7 + 96);
  uint64_t v12 = *(void *)(*(void *)v7 + 104);
  uint64_t v13 = *(void *)(*(void *)v7 + 120);
  uint64_t v60 = *(void *)(*(void *)v7 + 80);
  uint64_t v61 = v11;
  uint64_t v62 = v12;
  uint64_t v63 = v13;
  type metadata accessor for InterstitialViewInsertion();
  uint64_t v14 = sub_1BFA17078();
  uint64_t v53 = *(void *)(v14 - 8);
  uint64_t v54 = v14;
  MEMORY[0x1F4188790](v14);
  unint64_t v16 = (uint64_t *)((char *)&v48 - v15);
  uint64_t v61 = v11;
  uint64_t v62 = v12;
  uint64_t v63 = v13;
  uint64_t v17 = type metadata accessor for AdRequest();
  uint64_t v55 = sub_1BFA17F48();
  uint64_t v52 = *(void *)(v55 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v55);
  uint64_t v51 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  unint64_t v22 = (char *)&v48 - v21;
  uint64_t v56 = v17;
  uint64_t v23 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v25 = (uint64_t *)((char *)&v48 - v24);
  uint64_t v26 = sub_1BFA17A28();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  uint64_t v29 = (uint64_t *)((char *)&v48 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BF973CEC();
  *uint64_t v29 = sub_1BFA17E98();
  (*(void (**)(uint64_t *, void, uint64_t))(v27 + 104))(v29, *MEMORY[0x1E4FBCBF0], v26);
  LOBYTE(v17) = sub_1BFA17A48();
  (*(void (**)(uint64_t *, uint64_t))(v27 + 8))(v29, v26);
  if (v17)
  {
    uint64_t v29 = v25;
    uint64_t v49 = v16;
    if (qword_1EBA79730 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v30 = (void *)qword_1EBA79208;
  sub_1BF95AA88();
  uint64_t v31 = swift_allocObject();
  long long v48 = xmmword_1BFA195D0;
  *(_OWORD *)(v31 + 16) = xmmword_1BFA195D0;
  *(void *)(v31 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v32 = sub_1BF95AB38();
  *(void *)(v31 + 64) = v32;
  uint64_t v33 = v57;
  *(void *)(v31 + 32) = v57;
  *(void *)(v31 + 40) = a3;
  id v34 = v30;
  swift_bridgeObjectRetain();
  sub_1BFA17E48();
  sub_1BFA177B8();

  uint64_t v35 = v33;
  swift_bridgeObjectRelease();
  LOBYTE(v60) = 0;
  AdRequestStore.request(for:behavior:)(v33, a3, (unsigned __int8 *)&v60, v22);
  uint64_t v36 = v56;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v22, 1, v56) == 1)
  {
    uint64_t v52 = *(void *)(v52 + 8);
    ((void (*)(char *, uint64_t))v52)(v22, v55);
    id v37 = (id)qword_1EBA79208;
    sub_1BFA17E38();
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = v48;
    *(void *)(v38 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v38 + 64) = v32;
    *(void *)(v38 + 32) = v35;
    *(void *)(v38 + 40) = a3;
    swift_bridgeObjectRetain();
    sub_1BFA177B8();

    swift_bridgeObjectRelease();
    sub_1BF9ECE70();
    id v39 = (void *)swift_allocError();
    *id v40 = 1;
    uint64_t v41 = (uint64_t)v51;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v51, 1, 1, v36);
    Journal.addFailedEntry(error:request:placementIdentifier:contentIdentifier:)((uint64_t)v39, v41, v35, a3, 0, 0);
    ((void (*)(uint64_t, uint64_t))v52)(v41, v55);

    uint64_t v42 = swift_allocError();
    *uint64_t v43 = 1;
    char v44 = v49;
    *uint64_t v49 = v42;
    uint64_t v45 = v54;
    swift_storeEnumTagMultiPayload();
    v58(v44);
    (*(void (**)(uint64_t *, uint64_t))(v53 + 8))(v44, v45);
    return 0;
  }
  else
  {
    (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 32))(v29, v22, v36);
    uint64_t v46 = InterstitialAdViewManager.generateInsertion(for:request:size:contentFetched:)(v50, v29, (uint64_t)v58, v59, a6, a7);
    (*(void (**)(uint64_t *, uint64_t))(v23 + 8))(v29, v36);
  }
  return v46;
}

unint64_t sub_1BF9ECE70()
{
  unint64_t result = qword_1EA17A070;
  if (!qword_1EA17A070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A070);
  }
  return result;
}

uint64_t InterstitialAdViewManager.generateInsertion(for:request:size:contentFetched:)(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v7 = v6;
  uint64_t v95 = a3;
  uint64_t v96 = a4;
  v92 = a1;
  uint64_t v11 = (void *)*v6;
  v90 = v11;
  uint64_t v12 = v11[12];
  uint64_t v13 = v11[13];
  uint64_t v14 = v11[15];
  uint64_t v104 = v11[10];
  uint64_t v105 = v12;
  uint64_t v106 = v13;
  uint64_t v107 = v14;
  type metadata accessor for InterstitialViewInsertion();
  uint64_t v86 = sub_1BFA17078();
  uint64_t v85 = *(void *)(v86 - 8);
  MEMORY[0x1F4188790](v86);
  v84 = (char *)&v75 - v15;
  uint64_t v91 = v104;
  uint64_t v105 = v12;
  uint64_t v99 = v13;
  uint64_t v106 = v13;
  uint64_t v107 = v14;
  uint64_t v16 = type metadata accessor for AdRequest();
  uint64_t v83 = sub_1BFA17F48();
  uint64_t v82 = *(void *)(v83 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v83);
  v81 = (char *)&v75 - v18;
  uint64_t v93 = *(void *)(v16 - 8);
  uint64_t v77 = *(void *)(v93 + 64);
  MEMORY[0x1F4188790](v17);
  v78 = (char *)&v75 - v19;
  uint64_t v20 = v11[11];
  uint64_t v21 = sub_1BFA17F48();
  uint64_t v22 = MEMORY[0x1F4188790](v21 - 8);
  v76 = (char *)&v75 - v23;
  uint64_t v89 = *(void *)(v20 - 8);
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  v88 = (char *)&v75 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x1F4188790](v24);
  uint64_t v28 = (char *)&v75 - v27;
  MEMORY[0x1F4188790](v26);
  v87 = (char *)&v75 - v29;
  uint64_t v94 = v16;
  uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
  uint64_t v97 = v12;
  uint64_t v98 = v14;
  uint64_t v100 = v30(v12, v14);
  uint64_t v101 = v31;
  if (qword_1EBA79730 != -1) {
    swift_once();
  }
  unint64_t v32 = (void *)qword_1EBA79208;
  sub_1BF95AA88();
  uint64_t v80 = v33;
  uint64_t v34 = swift_allocObject();
  long long v79 = xmmword_1BFA195C0;
  *(_OWORD *)(v34 + 16) = xmmword_1BFA195C0;
  uint64_t v35 = *a2;
  uint64_t v36 = a2[1];
  uint64_t v37 = MEMORY[0x1E4FBB1A0];
  *(void *)(v34 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v38 = sub_1BF95AB38();
  *(void *)(v34 + 32) = v35;
  *(void *)(v34 + 40) = v36;
  *(void *)(v34 + 96) = v37;
  *(void *)(v34 + 104) = v38;
  uint64_t v39 = v100;
  uint64_t v40 = v101;
  *(void *)(v34 + 64) = v38;
  *(void *)(v34 + 72) = v39;
  *(void *)(v34 + 80) = v40;
  id v41 = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BFA17E48();
  sub_1BFA177B8();

  swift_bridgeObjectRelease();
  uint64_t v43 = v7[5];
  uint64_t v42 = v7[6];
  __swift_project_boxed_opaque_existential_1(v7 + 2, v43);
  char v44 = *(void (**)(void *, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 24);
  uint64_t v45 = (void *)v90[14];
  uint64_t v46 = v45[1];
  uint64_t v74 = v42;
  uint64_t v48 = v91;
  long long v47 = v92;
  v92 = a2;
  v44(v47, a2, v91, v20, v97, v99, v46, v98, v43, v74);
  uint64_t v49 = v89;
  uint64_t v50 = v87;
  (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v87, v28, v20);
  uint64_t v51 = v20;
  uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  v90 = v45;
  uint64_t v53 = v76;
  v52(v76, v50, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v53, 0, 1, v20);
  uint64_t v102 = v100;
  uint64_t v103 = v101;
  swift_beginAccess();
  sub_1BFA17AA8();
  swift_bridgeObjectRetain();
  sub_1BFA17AC8();
  swift_endAccess();
  v52(v88, v50, v20);
  uint64_t v54 = swift_allocObject();
  swift_weakInit();
  uint64_t v55 = v93;
  uint64_t v56 = v78;
  uint64_t v57 = v94;
  (*(void (**)(char *, void *, uint64_t))(v93 + 16))(v78, v92, v94);
  uint64_t v58 = v48;
  unint64_t v59 = (*(unsigned __int8 *)(v55 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
  unint64_t v60 = (v77 + v59 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v61 = (char *)swift_allocObject();
  *((void *)v61 + 2) = v58;
  *((void *)v61 + 3) = v51;
  uint64_t v62 = v96;
  uint64_t v63 = v99;
  *((void *)v61 + 4) = v97;
  *((void *)v61 + 5) = v63;
  v64 = v90;
  uint64_t v65 = v98;
  *((void *)v61 + 6) = v90;
  *((void *)v61 + 7) = v65;
  uint64_t v66 = v95;
  *((void *)v61 + 8) = v54;
  *((void *)v61 + 9) = v66;
  uint64_t v67 = v100;
  *((void *)v61 + 10) = v62;
  *((void *)v61 + 11) = v67;
  *((void *)v61 + 12) = v101;
  (*(void (**)(char *, char *, uint64_t))(v55 + 32))(&v61[v59], v56, v57);
  v68 = (double *)&v61[v60];
  double *v68 = a5;
  v68[1] = a6;
  uint64_t v69 = (uint64_t (*)(uint64_t (*)(void *, uint64_t, char), char *, uint64_t, void *, double, double))v64[2];
  swift_retain();
  swift_retain();
  v70 = v88;
  uint64_t v71 = v69(sub_1BF9EDF04, v61, v51, v64, a5, a6);
  swift_release();
  v72 = *(void (**)(char *, uint64_t))(v89 + 8);
  v72(v70, v51);
  v72(v87, v51);
  swift_release();
  return v71;
}

uint64_t sub_1BF9ED86C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BF9ED8A4(void *a1, uint64_t a2, int a3, double a4, double a5, uint64_t a6, void (*a7)(uint64_t *), uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v54 = a10;
  uint64_t v55 = a9;
  LODWORD(v57) = a3;
  uint64_t v56 = a2;
  *(void *)&long long v58 = a12;
  *((void *)&v58 + 1) = a14;
  *(void *)&long long v59 = a15;
  *((void *)&v59 + 1) = a17;
  uint64_t v53 = type metadata accessor for AdRequest();
  uint64_t v51 = *(void *)(v53 - 8);
  MEMORY[0x1F4188790](v53);
  uint64_t v52 = (char *)&v46 - v22;
  uint64_t v23 = sub_1BFA17F48();
  MEMORY[0x1F4188790](v23 - 8);
  uint64_t v25 = (char *)&v46 - v24;
  *(void *)&long long v58 = a12;
  *((void *)&v58 + 1) = a14;
  *(void *)&long long v59 = a15;
  *((void *)&v59 + 1) = a17;
  type metadata accessor for InterstitialViewInsertion();
  uint64_t v26 = sub_1BFA17078();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  uint64_t v29 = (uint64_t *)((char *)&v46 - v28);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v31 = Strong;
    uint64_t v49 = a8;
    uint64_t v50 = a7;
    if (v57)
    {
      *uint64_t v29 = (uint64_t)a1;
      swift_storeEnumTagMultiPayload();
      sub_1BF9EE360(a1);
      id v44 = a1;
    }
    else
    {
      uint64_t v57 = a11;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a13 - 8) + 56))(v25, 1, 1, a13);
      uint64_t v48 = v27;
      uint64_t v32 = v54;
      uint64_t v61 = v55;
      uint64_t v62 = v54;
      swift_beginAccess();
      uint64_t v33 = v56;
      sub_1BF9EE360(a1);
      sub_1BFA17AA8();
      swift_bridgeObjectRetain();
      sub_1BFA17AC8();
      swift_endAccess();
      long long v47 = a1;
      uint64_t ObjectType = swift_getObjectType();
      *(void *)&long long v58 = a1;
      uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8))(ObjectType, v33);
      long long v58 = 0u;
      long long v59 = 0u;
      char v60 = 1;
      uint64_t v36 = v57;
      uint64_t v37 = v26;
      uint64_t v38 = v55;
      Journal.addFulfilledEntry(request:placementIdentifier:contentIdentifier:layout:)(v57, v55, v32, v35, v39, &v58);
      swift_bridgeObjectRelease();
      uint64_t v40 = (uint64_t)v52;
      (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v52, v36, v53);
      uint64_t v41 = v38;
      uint64_t v26 = v37;
      a1 = v47;
      sub_1BF98DA9C(v41, v32, (uint64_t)v47, v33, v40, *(void *)(v31 + 64), (uint64_t)v29, a4, a5);
      swift_storeEnumTagMultiPayload();
      sub_1BF9EE360(a1);
      uint64_t v27 = v48;
      swift_bridgeObjectRetain();
      swift_retain();
    }
    v50(v29);
    swift_release();
    sub_1BF9EE36C(a1);
  }
  else
  {
    sub_1BF9ECE70();
    uint64_t v42 = swift_allocError();
    *uint64_t v43 = 0;
    *uint64_t v29 = v42;
    swift_storeEnumTagMultiPayload();
    a7(v29);
  }
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v27 + 8))(v29, v26);
}

uint64_t sub_1BF9EDD70()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 32);
  int v3 = (int *)(type metadata accessor for AdRequest() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(*(void *)v3 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v3 + 80);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4 + v3[15], v1);
  type metadata accessor for AdContext();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v0 + v4 + v3[16], v2);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BF9EDF04(void *a1, uint64_t a2, char a3)
{
  int v6 = a3 & 1;
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v8 = *(void *)(v3 + 24);
  uint64_t v9 = *(void *)(v3 + 32);
  uint64_t v10 = *(void *)(v3 + 40);
  uint64_t v11 = *(void *)(v3 + 48);
  uint64_t v12 = *(void *)(v3 + 56);
  uint64_t v13 = *(void *)(type metadata accessor for AdRequest() - 8);
  unint64_t v14 = (*(unsigned __int8 *)(v13 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v15 = (*(void *)(v13 + 64) + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1BF9ED8A4(a1, a2, v6, *(double *)(v3 + v15), *(double *)(v3 + v15 + 8), *(void *)(v3 + 64), *(void (**)(uint64_t *))(v3 + 72), *(void *)(v3 + 80), *(void *)(v3 + 88), *(void *)(v3 + 96), v3 + v14, v7, v8, v9, v10, v11, v12);
}

id InterstitialAdViewManager.view(for:)(uint64_t *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1BFA17A28();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (uint64_t *)((char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BF973CEC();
  *uint64_t v7 = sub_1BFA17E98();
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FBCBF0], v4);
  char v8 = sub_1BFA17A48();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (qword_1EBA79730 != -1) {
LABEL_5:
  }
    swift_once();
  uint64_t v9 = (void *)qword_1EBA79208;
  sub_1BF95AA88();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1BFA195C0;
  uint64_t v11 = *(void *)(v3 + 120);
  uint64_t v21 = *(void *)(v3 + 80);
  long long v22 = *(_OWORD *)(v3 + 96);
  uint64_t v23 = v11;
  uint64_t v12 = (uint64_t *)((char *)a1 + *(int *)(type metadata accessor for InterstitialViewInsertion() + 60));
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  uint64_t v15 = MEMORY[0x1E4FBB1A0];
  *(void *)(v10 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v16 = sub_1BF95AB38();
  *(void *)(v10 + 32) = v14;
  *(void *)(v10 + 40) = v13;
  uint64_t v17 = *a1;
  uint64_t v18 = a1[1];
  *(void *)(v10 + 96) = v15;
  *(void *)(v10 + 104) = v16;
  *(void *)(v10 + 64) = v16;
  *(void *)(v10 + 72) = v17;
  *(void *)(v10 + 80) = v18;
  id v19 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BFA17E48();
  sub_1BFA177B8();

  swift_bridgeObjectRelease();
  return (id)a1[2];
}

uint64_t InterstitialAdViewManager.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InterstitialAdViewManager.__deallocating_deinit()
{
  InterstitialAdViewManager.deinit();
  return MEMORY[0x1F4186488](v0, 80, 7);
}

uint64_t sub_1BF9EE2BC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for InterstitialAdViewManager()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for InterstitialAdViewManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for InterstitialAdViewManager);
}

uint64_t dispatch thunk of InterstitialAdViewManager.__allocating_init(adManager:adRequestStore:journal:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

id sub_1BF9EE360(id a1)
{
  return a1;
}

void sub_1BF9EE36C(id a1)
{
}

NewsAds::CampaignAdData __swiftcall CampaignAdData.init(campaignData:)(NewsAds::CampaignAdData campaignData)
{
  *uint64_t v1 = campaignData;
  return campaignData;
}

uint64_t sub_1BF9EE380(uint64_t a1)
{
  unint64_t v2 = sub_1BF9EE544();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BF9EE3BC(uint64_t a1)
{
  unint64_t v2 = sub_1BF9EE544();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t CampaignAdData.encode(to:)(void *a1)
{
  sub_1BF9EE71C(0, &qword_1EA17A078, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF9EE544();
  sub_1BFA18338();
  sub_1BFA181E8();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1BF9EE544()
{
  unint64_t result = qword_1EA17A080;
  if (!qword_1EA17A080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A080);
  }
  return result;
}

uint64_t CampaignAdData.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1BF9EE71C(0, &qword_1EA17A088, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v14 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF9EE544();
  sub_1BFA18328();
  if (!v2)
  {
    uint64_t v10 = sub_1BFA18178();
    uint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v10;
    a2[1] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1BF9EE71C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BF9EE544();
    unint64_t v7 = a3(a1, &type metadata for CampaignAdData.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_1BF9EE780(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1BF9C480C();
  unint64_t result = sub_1BF9C348C();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BF9EE7B0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CampaignAdData.init(from:)(a1, a2);
}

uint64_t sub_1BF9EE7C8(void *a1)
{
  sub_1BF9EE71C(0, &qword_1EA17A078, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  unint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF9EE544();
  sub_1BFA18338();
  sub_1BFA181E8();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

ValueMetadata *type metadata accessor for CampaignAdData()
{
  return &type metadata for CampaignAdData;
}

unsigned char *storeEnumTagSinglePayload for CampaignAdData.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BF9EE9C0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CampaignAdData.CodingKeys()
{
  return &type metadata for CampaignAdData.CodingKeys;
}

unint64_t sub_1BF9EE9FC()
{
  unint64_t result = qword_1EA17A090;
  if (!qword_1EA17A090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A090);
  }
  return result;
}

unint64_t sub_1BF9EEA54()
{
  unint64_t result = qword_1EA17A098;
  if (!qword_1EA17A098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A098);
  }
  return result;
}

unint64_t sub_1BF9EEAAC()
{
  unint64_t result = qword_1EA17A0A0;
  if (!qword_1EA17A0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A0A0);
  }
  return result;
}

char *ArticleBannerAdProvider.adView(for:placementIdentifier:)(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v11 = sub_1BFA169D8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v6[7] + 16) == 1)
  {
    sub_1BFA169C8();
    uint64_t v15 = sub_1BFA169A8();
    uint64_t v17 = v16;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    swift_retain();
    sub_1BFA16B48();
    swift_release();
    float v18 = v31;
    swift_retain();
    sub_1BFA16B48();
    swift_release();
    float v19 = v30;
    swift_retain();
    sub_1BFA16B48();
    swift_release();
    BYTE6(v29) = HIBYTE(v29);
    id v20 = objc_allocWithZone((Class)type metadata accessor for DebugBannerAdView());
    return sub_1BF95D6F0(v15, v17, (char *)&v29 + 6, v18, v19, a5, a6);
  }
  else
  {
    uint64_t v22 = v6[5];
    uint64_t v23 = v6[6];
    __swift_project_boxed_opaque_existential_1(v6 + 2, v22);
    uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8);
    swift_bridgeObjectRetain();
    uint64_t v25 = (void *)v24(v22, v23);
    id v26 = objc_msgSend(v25, sel_promotedContentViewOfType_size_startsCollapsed_, 0, 1, a5, a6);

    id v27 = objc_allocWithZone((Class)type metadata accessor for BannerAdMetricsView());
    uint64_t v21 = sub_1BF9B79B8(a1, a2, v26);
  }
  return v21;
}

uint64_t ArticleBannerAdProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return v0;
}

uint64_t ArticleBannerAdProvider.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return MEMORY[0x1F4186488](v0, 64, 7);
}

char *sub_1BF9EEDBC(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  return ArticleBannerAdProvider.adView(for:placementIdentifier:)(a1, a2, a3, a4, a5, a6);
}

uint64_t type metadata accessor for ArticleBannerAdProvider()
{
  return self;
}

uint64_t method lookup function for ArticleBannerAdProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ArticleBannerAdProvider);
}

uint64_t sub_1BF9EEE1C()
{
  uint64_t v0 = sub_1BFA16848();
  MEMORY[0x1F4188790](v0 - 8);
  sub_1BFA16888();
  swift_allocObject();
  sub_1BFA16878();
  sub_1BFA16838();
  sub_1BFA16858();
  uint64_t v1 = sub_1BFA16868();
  swift_release();
  return v1;
}

uint64_t InterstitialAdMetricsView.contentIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_contentIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id InterstitialAdMetricsView.onLongPress.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onLongPress);
}

id InterstitialAdMetricsView.onCollapse.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void InterstitialAdMetricsView.onCollapse.setter(void *a1)
{
  int v3 = (void **)(v1 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse);
  swift_beginAccess();
  unsigned int v4 = *v3;
  *int v3 = a1;
}

uint64_t (*InterstitialAdMetricsView.onCollapse.modify())()
{
  return j__swift_endAccess;
}

id InterstitialAdMetricsView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void InterstitialAdMetricsView.init(coder:)()
{
  uint64_t v1 = OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onLongPress;
  sub_1BF9EFBC4(0, (unint64_t *)&qword_1EBA77E48, MEMORY[0x1E4FAD760]);
  id v3 = v2;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(v2), sel_init);
  uint64_t v4 = OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse;
  *(void *)&v0[v4] = objc_msgSend(objc_allocWithZone(v3), sel_init);

  sub_1BFA180C8();
  __break(1u);
}

Swift::Void __swiftcall InterstitialAdMetricsView.layoutSubviews()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_metricsView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
}

Swift::Void __swiftcall InterstitialAdMetricsView.missedOpportunity()()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_metricsView), sel_promotedContentInfo);
  if (v1)
  {
    objc_super v2 = v1;
    id v3 = (void *)sub_1BFA171A8();

    objc_msgSend(v3, sel_missedOpportunity);
    swift_unknownObjectRelease();
  }
}

id InterstitialAdMetricsView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void InterstitialAdMetricsView.init(frame:)()
{
}

id InterstitialAdMetricsView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BF9EF540()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_contentIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_1BF9EF580()
{
  return *(id *)(*v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onLongPress);
}

id sub_1BF9EF594()
{
  uint64_t v1 = (void **)(*v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse);
  swift_beginAccess();
  objc_super v2 = *v1;
  return v2;
}

id sub_1BF9EF5F0()
{
  id result = objc_msgSend(*(id *)(*v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_metricsView), sel_promotedContentInfo);
  if (result)
  {
    objc_super v2 = result;
    id v3 = (void *)sub_1BFA171A8();

    objc_msgSend(v3, sel_missedOpportunity);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

id sub_1BF9EF6E0(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_1BF9EFBC4(0, &qword_1EBA77E40, MEMORY[0x1E4FAD758]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  unint64_t v7 = (char *)&v30 - v6;
  uint64_t v8 = OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onLongPress;
  sub_1BF9EFBC4(0, (unint64_t *)&qword_1EBA77E48, MEMORY[0x1E4FAD760]);
  uint64_t v10 = v9;
  id v11 = objc_allocWithZone(v9);
  uint64_t v12 = v1;
  *(void *)&v1[v8] = objc_msgSend(v11, sel_init);
  uint64_t v13 = OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse;
  *(void *)&v12[v13] = objc_msgSend(objc_allocWithZone(v10), sel_init);
  id v14 = objc_msgSend(a1, sel_promotedContentInfo);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = sub_1BFA17178();
    unint64_t v18 = v17;
  }
  else
  {
    uint64_t v16 = 0;
    unint64_t v18 = 0xE000000000000000;
  }
  float v19 = (uint64_t *)&v12[OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_contentIdentifier];
  *float v19 = v16;
  v19[1] = v18;
  *(void *)&v12[OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_metricsView] = a1;
  id v20 = a1;

  objc_msgSend(v20, sel_frame);
  v32.receiver = v12;
  v32.super_class = ObjectType;
  id v21 = objc_msgSendSuper2(&v32, sel_initWithFrame_);
  uint64_t v22 = self;
  id v23 = v21;
  id v24 = objc_msgSend(v22, sel_clearColor);
  objc_msgSend(v23, sel_setBackgroundColor_, v24);

  id v25 = v20;
  id v26 = objc_msgSend(v22, sel_clearColor);
  objc_msgSend(v25, sel_setBackgroundColor_, v26);

  id v27 = v23;
  sub_1BFA17718();
  objc_msgSend(v27, sel_bounds);
  objc_msgSend(v25, sel_setFrame_);
  objc_msgSend(v27, sel_addSubview_, v25);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAD750], v4);
  id v28 = v27;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v28;
}

void _s7NewsAds25InterstitialAdMetricsViewC07metricsF9Collapsedyy17PromotedContentUI0eF0CF_0()
{
  if (qword_1EBA79730 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_1EBA79208;
  sub_1BF95AA88();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BFA195D0;
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_contentIdentifier);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_contentIdentifier + 8);
  *(void *)(v2 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v2 + 64) = sub_1BF95AB38();
  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v3;
  id v5 = v1;
  swift_bridgeObjectRetain();
  sub_1BFA17E48();
  sub_1BFA177B8();

  swift_bridgeObjectRelease();
  uint64_t v6 = (id *)(v0 + OBJC_IVAR____TtC7NewsAds25InterstitialAdMetricsView_onCollapse);
  swift_beginAccess();
  id v7 = *v6;
  MEMORY[0x1C18B78C0]();
}

uint64_t dispatch thunk of InterstitialAdViewType.contentIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of InterstitialAdViewType.onLongPress.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of InterstitialAdViewType.onCollapse.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of InterstitialAdViewType.missedOpportunity()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t type metadata accessor for InterstitialAdMetricsView()
{
  return self;
}

uint64_t method lookup function for InterstitialAdMetricsView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for InterstitialAdMetricsView);
}

void sub_1BF9EFBC4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x1E4FBC848] + 8);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t InterstitialAdPlacement.desiredPlacement.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1BFA17278();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t InterstitialAdPlacement.placementIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InterstitialAdPlacement() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for InterstitialAdPlacement()
{
  uint64_t result = qword_1EBA7A680;
  if (!qword_1EBA7A680) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t InterstitialAdPlacement.insertionType.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for InterstitialAdPlacement();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 24));
  return result;
}

double InterstitialAdPlacement.boundingSize.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for InterstitialAdPlacement() + 28));
}

uint64_t InterstitialAdPlacement.init(placementIdentifier:boundingSize:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v10 = (int *)type metadata accessor for InterstitialAdPlacement();
  *((unsigned char *)a3 + v10[6]) = 0;
  *a3 = 1;
  uint64_t v11 = *MEMORY[0x1E4F93D68];
  uint64_t v12 = sub_1BFA17278();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(a3, v11, v12);
  id v14 = (void *)((char *)a3 + v10[5]);
  *id v14 = a1;
  v14[1] = a2;
  uint64_t v15 = (double *)((char *)a3 + v10[7]);
  *uint64_t v15 = a4;
  v15[1] = a5;
  return result;
}

uint64_t sub_1BF9EFE2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 20));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1BF9EFE64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1BFA17278();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

double sub_1BF9EFECC(uint64_t a1)
{
  return *(double *)(v1 + *(int *)(a1 + 28));
}

void *initializeBufferWithCopyOfBuffer for InterstitialAdPlacement(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1BFA17278();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (void *)((char *)a1 + v8);
    uint64_t v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for InterstitialAdPlacement(uint64_t a1)
{
  uint64_t v2 = sub_1BFA17278();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InterstitialAdPlacement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BFA17278();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InterstitialAdPlacement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BFA17278();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  return a1;
}

uint64_t initializeWithTake for InterstitialAdPlacement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BFA17278();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for InterstitialAdPlacement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1BFA17278();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for InterstitialAdPlacement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BF9F02E4);
}

uint64_t sub_1BF9F02E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1BFA17278();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for InterstitialAdPlacement(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BF9F03BC);
}

uint64_t sub_1BF9F03BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1BFA17278();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1BF9F047C()
{
  uint64_t result = sub_1BFA17278();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1BF9F0524@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int v187 = a2;
  uint64_t v197 = a7;
  uint64_t v185 = *(void *)(a4 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](a1);
  v180 = (char *)&v160 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  v179 = (char *)&v160 - v14;
  *(void *)&long long v231 = v15;
  *((void *)&v231 + 1) = v16;
  *(void *)&long long v232 = v17;
  *((void *)&v232 + 1) = v18;
  uint64_t v200 = type metadata accessor for AdRequest();
  v188 = (long long *)sub_1BFA17F48();
  uint64_t v199 = *((void *)v188 - 1);
  uint64_t v19 = MEMORY[0x1F4188790](v188);
  v184 = (char *)&v160 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  v183 = (char *)&v160 - v22;
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  v182 = (char *)&v160 - v24;
  MEMORY[0x1F4188790](v23);
  v181 = (char *)&v160 - v25;
  uint64_t v26 = sub_1BFA169D8();
  uint64_t v192 = *(void *)(v26 - 8);
  v193 = (char *)v26;
  MEMORY[0x1F4188790](v26);
  id v28 = (char *)&v160 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v194 = a3;
  uint64_t v195 = a5;
  *(void *)&long long v231 = a3;
  *((void *)&v231 + 1) = a4;
  uint64_t v198 = a4;
  *(void *)&long long v232 = a5;
  *((void *)&v232 + 1) = a6;
  uint64_t v196 = a6;
  uint64_t v29 = (int *)type metadata accessor for JournalEntry();
  uint64_t v191 = sub_1BFA17F48();
  uint64_t v30 = *(void *)(v191 - 8);
  uint64_t v31 = MEMORY[0x1F4188790](v191);
  uint64_t v33 = (char *)&v160 - v32;
  uint64_t v34 = *((void *)v29 - 1);
  MEMORY[0x1F4188790](v31);
  uint64_t v36 = (char *)&v160 - v35;
  uint64_t v37 = a1;
  *(void *)&long long v231 = a1;
  sub_1BFA17D68();
  swift_getWitnessTable();
  uint64_t v38 = v29;
  sub_1BFA17AE8();
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v34 + 48))(v33, 1, v29) != 1)
  {
    uint64_t v178 = v37;
    uint64_t v176 = v34;
    (*(void (**)(char *, char *, int *))(v34 + 32))(v36, v33, v29);
    sub_1BFA169C8();
    uint64_t v39 = sub_1BFA169A8();
    uint64_t v174 = v40;
    uint64_t v175 = v39;
    (*(void (**)(char *, char *))(v192 + 8))(v28, v193);
    uint64_t v41 = v29[15];
    uint64_t v42 = &v36[v29[14]];
    *((void *)&v186 + 1) = *((void *)v42 + 1);
    uint64_t v43 = &v36[v29[16]];
    uint64_t v44 = *((void *)v43 + 1);
    uint64_t v45 = (unint64_t *)&v36[v41];
    unint64_t v47 = *v45;
    unint64_t v46 = v45[1];
    unint64_t v49 = v45[2];
    unint64_t v48 = v45[3];
    v165 = v45;
    v193 = v36;
    if (!(v47 >> 62))
    {
      uint64_t v160 = 0x64656C696146;
      unint64_t v161 = 0xE600000000000000;
      goto LABEL_7;
    }
    if (v47 >> 62 == 1)
    {
      uint64_t v160 = 0x6564726163736944;
      unint64_t v161 = 0xE900000000000064;
LABEL_7:
      uint64_t v50 = *((void *)&v186 + 1);
      goto LABEL_30;
    }
    uint64_t v50 = *((void *)&v186 + 1);
    unint64_t v51 = v49 | v46 | v48;
    if (v47 == 0x8000000000000000 && !v51)
    {
      uint64_t v160 = 0x64657461657243;
      unint64_t v161 = 0xE700000000000000;
      goto LABEL_30;
    }
    if (v47 == 0x8000000000000008 && !v51)
    {
      unint64_t v161 = 0xE900000000000064;
      uint64_t v52 = 0x756465686353;
LABEL_14:
      uint64_t v160 = v52 & 0xFFFFFFFFFFFFLL | 0x656C000000000000;
      goto LABEL_30;
    }
    if (v47 != 0x8000000000000010 || v51)
    {
      if (v47 != 0x8000000000000018 || v51)
      {
        if (v47 == 0x8000000000000020 && !v51)
        {
          unint64_t v161 = 0xE900000000000064;
          uint64_t v52 = 0x6C69666C7546;
          goto LABEL_14;
        }
        if (v51) {
          BOOL v53 = 0;
        }
        else {
          BOOL v53 = v47 == 0x8000000000000028;
        }
        uint64_t v54 = 0x657370616C6C6F43;
        if (v53) {
          uint64_t v54 = 0x65746E6573657250;
        }
        uint64_t v160 = v54;
        unint64_t v161 = 0xE900000000000064;
      }
      else
      {
        unint64_t v161 = 0xE900000000000064;
        uint64_t v160 = 0x6574736575716552;
      }
    }
    else
    {
      unint64_t v161 = 0xE900000000000064;
      uint64_t v160 = 0x656D726177657250;
    }
LABEL_30:
    *(void *)&long long v186 = *(void *)v42;
    v164 = v43;
    uint64_t v168 = *(void *)v43;
    uint64_t v172 = v44;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BF96891C(v47);
    unint64_t v55 = v46;
    unint64_t v56 = v48;
    if (qword_1EBA796D8 != -1) {
      swift_once();
    }
    uint64_t v57 = (void *)qword_1EBA780E8;
    uint64_t v58 = (uint64_t)v193;
    v163 = &v193[v38[13]];
    long long v59 = (void *)sub_1BFA16958();
    id v60 = objc_msgSend(v57, sel_stringFromDate_, v59);

    uint64_t v61 = sub_1BFA17B38();
    uint64_t v166 = v62;
    uint64_t v167 = v61;

    long long v202 = xmmword_1BFA20890;
    unint64_t v170 = v49;
    unint64_t v171 = v47;
    *(void *)&long long v231 = v47;
    *((void *)&v231 + 1) = v55;
    unint64_t v173 = v55;
    *(void *)&long long v232 = v49;
    *((void *)&v232 + 1) = v56;
    unint64_t v169 = v56;
    uint64_t v63 = JournalEntryStatus.shortDescription.getter();
    long long v203 = xmmword_1BFA208A0;
    uint64_t v204 = v63;
    uint64_t v205 = v64;
    unint64_t v206 = 0xD000000000000014;
    unint64_t v207 = 0x80000001BFA276F0;
    uint64_t v208 = v186;
    uint64_t v209 = v50;
    v177 = v38;
    uint64_t v65 = v199;
    uint64_t v66 = *(void (**)(char *, uint64_t, long long *))(v199 + 16);
    uint64_t v67 = (uint64_t *)v181;
    uint64_t v191 = v58 + v38[19];
    uint64_t v192 = v199 + 16;
    v68 = v188;
    v190 = v66;
    ((void (*)(char *))v66)(v181);
    uint64_t v69 = v200;
    uint64_t v70 = *(void *)(v200 - 8);
    v189 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v70 + 48);
    if (v189(v67, 1, v200) == 1)
    {
      uint64_t v71 = *(void (**)(uint64_t *, long long *))(v65 + 8);
      swift_bridgeObjectRetain();
      v71(v67, v68);
      unint64_t v72 = 0;
      unint64_t v73 = 0;
      uint64_t v74 = 0;
      uint64_t v75 = 0;
    }
    else
    {
      uint64_t v74 = *v67;
      uint64_t v75 = v67[1];
      v76 = *(void (**)(uint64_t *, uint64_t))(v70 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v76(v67, v200);
      uint64_t v69 = v200;
      unint64_t v73 = 0x80000001BFA27710;
      unint64_t v72 = 0xD000000000000012;
    }
    uint64_t v77 = v182;
    unint64_t v210 = v72;
    unint64_t v211 = v73;
    uint64_t v212 = v74;
    uint64_t v213 = v75;
    uint64_t v78 = *((void *)v164 + 1);
    if (v78)
    {
      uint64_t v79 = *(void *)v164;
      unint64_t v80 = 0x80000001BFA27730;
      unint64_t v81 = 0xD000000000000012;
    }
    else
    {
      unint64_t v81 = 0;
      unint64_t v80 = 0;
      uint64_t v79 = 0;
    }
    unint64_t v214 = v81;
    unint64_t v215 = v80;
    uint64_t v216 = v79;
    uint64_t v217 = v78;
    v190(v182, v191, v68);
    unsigned int v82 = v189((uint64_t *)v77, 1, v69);
    uint64_t v162 = v70;
    if (v82 == 1)
    {
      uint64_t v83 = *(void (**)(char *, long long *))(v199 + 8);
      swift_bridgeObjectRetain();
      v83(v77, v68);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v185 + 16))(v179, &v77[*(int *)(v69 + 56)], v198);
      v84 = *(void (**)(char *, uint64_t))(v70 + 8);
      swift_bridgeObjectRetain();
      v84(v77, v69);
      sub_1BF95C108(0, &qword_1EBA77C68);
      if (swift_dynamicCast())
      {
        uint64_t v85 = *((void *)&v232 + 1);
        if (*((void *)&v232 + 1))
        {
          uint64_t v86 = v233;
          __swift_project_boxed_opaque_existential_1(&v231, *((uint64_t *)&v232 + 1));
          uint64_t v87 = (*(uint64_t (**)(uint64_t, uint64_t))(v86 + 8))(v85, v86);
          uint64_t v89 = v88;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v231);
          *(void *)&long long v218 = 0xD000000000000018;
          *((void *)&v218 + 1) = 0x80000001BFA27750;
          *(void *)&long long v219 = v87;
          *((void *)&v219 + 1) = v89;
          goto LABEL_45;
        }
LABEL_44:
        sub_1BF9F400C((uint64_t)&v231, &qword_1EBA77C70, &qword_1EBA77C68);
        long long v218 = 0u;
        long long v219 = 0u;
LABEL_45:
        uint64_t v90 = v162;
        uint64_t v91 = v183;
        v190(v183, v191, v68);
        if (v189((uint64_t *)v91, 1, v69) == 1)
        {
          (*(void (**)(char *, long long *))(v199 + 8))(v91, v68);
        }
        else
        {
          v92 = &v91[*(int *)(v69 + 60)];
          uint64_t v94 = *(void *)v92;
          uint64_t v93 = *((void *)v92 + 1);
          uint64_t v95 = *(void (**)(char *, uint64_t))(v90 + 8);
          swift_bridgeObjectRetain();
          v95(v91, v69);
          v68 = v188;
          if (v93)
          {
            *(void *)&long long v220 = 0xD000000000000012;
            *((void *)&v220 + 1) = 0x80000001BFA27770;
            *(void *)&long long v221 = v94;
            *((void *)&v221 + 1) = v93;
            goto LABEL_50;
          }
        }
        long long v220 = 0u;
        long long v221 = 0u;
LABEL_50:
        v188 = &v203;
        uint64_t v96 = (void *)qword_1EBA780E8;
        uint64_t v97 = (void *)sub_1BFA16958();
        id v98 = objc_msgSend(v96, sel_stringFromDate_, v97);

        uint64_t v99 = sub_1BFA17B38();
        uint64_t v101 = v100;

        long long v222 = xmmword_1BFA208B0;
        uint64_t v223 = v99;
        uint64_t v224 = v101;
        uint64_t v102 = v184;
        v190(v184, v191, v68);
        uint64_t v103 = v200;
        if (v189((uint64_t *)v102, 1, v200) == 1)
        {
          (*(void (**)(char *, long long *))(v199 + 8))(v102, v68);
          uint64_t v104 = 0;
          unint64_t v105 = 0;
          long long v106 = 0uLL;
          uint64_t v107 = v198;
          uint64_t v108 = v196;
        }
        else
        {
          uint64_t v109 = v185;
          v110 = v180;
          uint64_t v107 = v198;
          (*(void (**)(char *, char *, uint64_t))(v185 + 16))(v180, &v102[*(int *)(v103 + 56)], v198);
          (*(void (**)(char *, uint64_t))(v90 + 8))(v102, v103);
          uint64_t v108 = v196;
          (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v196 + 24))(&v231, v107, v196);
          (*(void (**)(char *, uint64_t))(v109 + 8))(v110, v107);
          unint64_t v105 = 0xE900000000000063;
          uint64_t v104 = 0x6974616D6F747561;
          if ((_BYTE)v231)
          {
            uint64_t v104 = 0x6C61756E616DLL;
            unint64_t v105 = 0xE600000000000000;
          }
          long long v106 = xmmword_1BFA208C0;
        }
        long long v225 = v106;
        uint64_t v226 = v104;
        unint64_t v227 = v105;
        uint64_t v111 = sub_1BF9F2FF4((uint64_t)v193, v194, v107, v195, v108);
        uint64_t v113 = 0;
        int32x2_t v114 = vdup_n_s32(v112 == 0);
        if (v112) {
          uint64_t v115 = v111;
        }
        else {
          uint64_t v115 = 0;
        }
        v116.i64[0] = v114.u32[0];
        v116.i64[1] = v114.u32[1];
        int8x16_t v228 = vandq_s8((int8x16_t)vcgezq_s64(vshlq_n_s64(v116, 0x3FuLL)), (int8x16_t)xmmword_1BFA208D0);
        uint64_t v229 = v115;
        uint64_t v230 = v112;
        v117 = (char *)MEMORY[0x1E4FBC860];
        do
        {
          v119 = &v201[v113];
          uint64_t v120 = *(void *)((char *)&v203 + v113 + 8);
          if (v120)
          {
            uint64_t v121 = v119[4];
            uint64_t v123 = v119[6];
            uint64_t v122 = v119[7];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              v117 = sub_1BF962EC8(0, *((void *)v117 + 2) + 1, 1, v117);
            }
            unint64_t v125 = *((void *)v117 + 2);
            unint64_t v124 = *((void *)v117 + 3);
            if (v125 >= v124 >> 1) {
              v117 = sub_1BF962EC8((char *)(v124 > 1), v125 + 1, 1, v117);
            }
            *((void *)v117 + 2) = v125 + 1;
            v118 = &v117[32 * v125];
            *((void *)v118 + 4) = v121;
            *((void *)v118 + 5) = v120;
            *((void *)v118 + 6) = v123;
            *((void *)v118 + 7) = v122;
          }
          v113 += 32;
        }
        while (v113 != 288);
        sub_1BF9F3E6C(0, qword_1EBA780F0, (uint64_t)&type metadata for DebugJournal.Detail, MEMORY[0x1E4FBB718]);
        swift_arrayDestroy();
        unint64_t v126 = *v165;
        v127 = (unsigned int (*)(uint64_t *, uint64_t, uint64_t))v165[2];
        unint64_t v128 = v165[3];
        unint64_t v129 = *v165 >> 62;
        if (v129 == 1)
        {
          uint64_t v143 = *(void *)(v128 + 16);
          if (!v143)
          {
            v134 = (char *)MEMORY[0x1E4FBC860];
            goto LABEL_86;
          }
          v190 = (void (*)(char *, uint64_t, long long *))v165[1];
          uint64_t v191 = v126;
          v189 = v127;
          sub_1BF96891C(v126);
          swift_bridgeObjectRetain();
          uint64_t v192 = v128;
          unint64_t v144 = v128 + 48;
          v134 = (char *)MEMORY[0x1E4FBC860];
          uint64_t v199 = MEMORY[0x1E4FBC840] + 8;
          do
          {
            uint64_t v146 = *(void *)(v144 - 16);
            uint64_t v145 = *(void *)(v144 - 8);
            *(void *)&long long v231 = 0;
            *((void *)&v231 + 1) = 0xE000000000000000;
            swift_bridgeObjectRetain();
            sub_1BFA180B8();
            long long v147 = v231;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v200 = *((void *)&v147 + 1);
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              v134 = sub_1BF962EC8(0, *((void *)v134 + 2) + 1, 1, v134);
            }
            unint64_t v150 = *((void *)v134 + 2);
            unint64_t v149 = *((void *)v134 + 3);
            if (v150 >= v149 >> 1) {
              v134 = sub_1BF962EC8((char *)(v149 > 1), v150 + 1, 1, v134);
            }
            *((void *)v134 + 2) = *((void *)&v147 + 1) + 1;
            v151 = &v134[32 * *((void *)&v147 + 1)];
            *((void *)v151 + 4) = v146;
            *((void *)v151 + 5) = v145;
            uint64_t v152 = v200;
            *((void *)v151 + 6) = v147;
            *((void *)v151 + 7) = v152;
            v144 += 48;
            --v143;
          }
          while (v143);
        }
        else
        {
          uint64_t v130 = v178;
          uint64_t v131 = v198;
          if (v129 || (uint64_t v132 = *(void *)(v128 + 16)) == 0)
          {
            v134 = (char *)MEMORY[0x1E4FBC860];
LABEL_87:
            swift_bridgeObjectRetain();
            uint64_t v153 = (uint64_t)v193;
            uint64_t v154 = v194;
            uint64_t v156 = v195;
            uint64_t v155 = v196;
            v157 = sub_1BF9F3300((uint64_t)v193, v194, v131, v195, v196);
            v158 = sub_1BF9F36FC(v187 & 1, v130, v154, v131, v156, v155);
            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, int *))(v176 + 8))(v153, v177);
            swift_bridgeObjectRelease();
            *(void *)&long long v231 = v175;
            *((void *)&v231 + 1) = v174;
            long long v232 = v186;
            uint64_t v233 = v168;
            uint64_t v234 = v172;
            unint64_t v235 = v171;
            unint64_t v236 = v173;
            unint64_t v237 = v170;
            unint64_t v238 = v169;
            uint64_t v239 = v160;
            unint64_t v240 = v161;
            uint64_t v241 = v167;
            uint64_t v242 = v166;
            v243 = v117;
            v244 = v134;
            v245 = v158;
            v246 = v157;
            nullsub_1(&v231);
            return sub_1BF971CB8((uint64_t)&v231, v197);
          }
          v190 = (void (*)(char *, uint64_t, long long *))v165[1];
          uint64_t v191 = v126;
          v189 = v127;
          sub_1BF96891C(v126);
          swift_bridgeObjectRetain();
          uint64_t v192 = v128;
          unint64_t v133 = v128 + 48;
          v134 = (char *)MEMORY[0x1E4FBC860];
          uint64_t v199 = MEMORY[0x1E4FBC840] + 8;
          do
          {
            uint64_t v136 = *(void *)(v133 - 16);
            uint64_t v135 = *(void *)(v133 - 8);
            *(void *)&long long v231 = 0;
            *((void *)&v231 + 1) = 0xE000000000000000;
            swift_bridgeObjectRetain();
            sub_1BFA180B8();
            long long v137 = v231;
            char v138 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v200 = *((void *)&v137 + 1);
            if ((v138 & 1) == 0) {
              v134 = sub_1BF962EC8(0, *((void *)v134 + 2) + 1, 1, v134);
            }
            unint64_t v140 = *((void *)v134 + 2);
            unint64_t v139 = *((void *)v134 + 3);
            if (v140 >= v139 >> 1) {
              v134 = sub_1BF962EC8((char *)(v139 > 1), v140 + 1, 1, v134);
            }
            *((void *)v134 + 2) = *((void *)&v137 + 1) + 1;
            v141 = &v134[32 * *((void *)&v137 + 1)];
            *((void *)v141 + 4) = v136;
            *((void *)v141 + 5) = v135;
            uint64_t v142 = v200;
            *((void *)v141 + 6) = v137;
            *((void *)v141 + 7) = v142;
            v133 += 48;
            --v132;
          }
          while (v132);
        }
        sub_1BF972984(v191);
        swift_bridgeObjectRelease();
LABEL_86:
        uint64_t v130 = v178;
        uint64_t v131 = v198;
        goto LABEL_87;
      }
    }
    uint64_t v233 = 0;
    long long v231 = 0u;
    long long v232 = 0u;
    goto LABEL_44;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v191);
  sub_1BF9F3DF8(&v231);
  return sub_1BF971CB8((uint64_t)&v231, v197);
}

void *sub_1BF9F1680()
{
  uint64_t v1 = sub_1BFA177F8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v1);
  uint64_t v50 = (void *)((char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v7 = (void *)((char *)v47 - v6);
  MEMORY[0x1F4188790](v5);
  uint64_t v57 = (void *)((char *)v47 - v8);
  uint64_t v9 = v0[14];
  uint64_t v11 = v0[16];
  uint64_t v10 = v0[17];
  uint64_t v12 = *(void *)(v10 + 16);
  uint64_t v53 = v2;
  if (v12)
  {
    uint64_t v48 = v9;
    uint64_t v49 = v11;
    uint64_t v13 = v10 + 32;
    unsigned int v54 = *MEMORY[0x1E4FAC128];
    uint64_t v55 = v2 + 32;
    unint64_t v56 = (void (**)(void))(v2 + 104);
    v47[1] = v10;
    swift_bridgeObjectRetain();
    uint64_t v14 = (void *)MEMORY[0x1E4FBC860];
    unint64_t v51 = 0x80000001BFA276D0;
    uint64_t v52 = v7;
    do
    {
      sub_1BF9F3B10(v13, (uint64_t)v61);
      if (v62)
      {
        uint64_t v15 = *(void *)&v61[0];
        uint64_t v16 = (void *)swift_allocObject();
        v58[0] = v15;
        uint64_t v17 = sub_1BF990164();
        swift_bridgeObjectRelease();
        sub_1BF9F3E6C(0, &qword_1EA17A0F8, (uint64_t)&type metadata for AdContextBuilderSnapshot.SerializedSnapshotEntry, MEMORY[0x1E4FBB320]);
        v16[5] = v18;
        uint64_t v19 = sub_1BF9F3D18((unint64_t *)&unk_1EA17A410, &qword_1EA17A0F8, (uint64_t)&type metadata for AdContextBuilderSnapshot.SerializedSnapshotEntry, (void (*)(void))sub_1BF9F3B88);
        void v16[2] = v17;
        v16[6] = v19;
        v16[7] = 0xD00000000000001BLL;
        v16[8] = v51;
        *uint64_t v7 = v16;
        ((void (*)(void *, void, uint64_t))*v56)(v7, v54, v1);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v14 = (void *)sub_1BF963664(0, v14[2] + 1, 1, v14);
        }
        unint64_t v21 = v14[2];
        unint64_t v20 = v14[3];
        if (v21 >= v20 >> 1) {
          uint64_t v14 = (void *)sub_1BF963664(v20 > 1, v21 + 1, 1, v14);
        }
        v14[2] = v21 + 1;
        (*(void (**)(unint64_t, void *, uint64_t))(v2 + 32))((unint64_t)v14+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v21, v7, v1);
      }
      else
      {
        sub_1BF95BCD0(v61, (uint64_t)v58);
        uint64_t v22 = (uint64_t *)swift_allocObject();
        uint64_t v23 = v1;
        uint64_t v24 = v59;
        uint64_t v25 = v60;
        uint64_t v26 = __swift_project_boxed_opaque_existential_1(v58, v59);
        v22[5] = v24;
        uint64_t v27 = *(void *)(v25 + 32);
        uint64_t v1 = v23;
        v22[6] = v27;
        boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2(v22 + 2);
        (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(boxed_opaque_existential_2, v26, v24);
        v22[7] = 0x65746E6F632D6461;
        v22[8] = 0xEA00000000007478;
        uint64_t v29 = v56;
        *uint64_t v57 = v22;
        (*v29)();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v14 = (void *)sub_1BF963664(0, v14[2] + 1, 1, v14);
        }
        unint64_t v31 = v14[2];
        unint64_t v30 = v14[3];
        uint64_t v7 = v52;
        uint64_t v2 = v53;
        if (v31 >= v30 >> 1) {
          uint64_t v14 = (void *)sub_1BF963664(v30 > 1, v31 + 1, 1, v14);
        }
        v14[2] = v31 + 1;
        (*(void (**)(unint64_t, void *, uint64_t))(v2 + 32))((unint64_t)v14+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v31, v57, v23);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
      }
      v13 += 48;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    uint64_t v9 = v48;
    uint64_t v11 = v49;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4FBC860];
  }
  sub_1BF9F3BDC(0, &qword_1EA1793E8, MEMORY[0x1E4FBBE00]);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_1BFA195D0;
  *(void *)(v32 + 32) = v9;
  uint64_t v33 = *(void *)(v11 + 16);
  if (v33)
  {
    uint64_t v57 = (void *)v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v34 = 0;
    uint64_t v35 = 144;
    do
    {
      uint64_t v36 = v34 + 1;
      uint64_t v37 = v11;
      uint64_t v38 = *(void *)(v11 + v35);
      unint64_t v39 = *(void *)(v32 + 24);
      swift_bridgeObjectRetain();
      if (v34 + 1 >= v39 >> 1) {
        uint64_t v32 = (uint64_t)sub_1BF963890((void *)(v39 > 1), v34 + 2, 1, (void *)v32);
      }
      *(void *)(v32 + 16) = v34 + 2;
      *(void *)(v32 + 8 * v34 + 40) = v38;
      v35 += 144;
      ++v34;
      uint64_t v11 = v37;
    }
    while (v33 != v36);
    swift_bridgeObjectRelease();
    uint64_t v1 = (uint64_t)v57;
    uint64_t v2 = v53;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v40 = (void *)swift_allocObject();
  sub_1BF9F3BDC(0, &qword_1EA17A108, MEMORY[0x1E4FBB320]);
  v40[5] = v41;
  unint64_t v42 = sub_1BF9F3C60();
  v40[2] = v32;
  v40[6] = v42;
  v40[7] = 0x6E72756F6A2D6461;
  v40[8] = 0xEA00000000006C61;
  uint64_t v43 = v50;
  *uint64_t v50 = v40;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v43, *MEMORY[0x1E4FAC128], v1);
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v14 = (void *)sub_1BF963664(0, v14[2] + 1, 1, v14);
  }
  unint64_t v45 = v14[2];
  unint64_t v44 = v14[3];
  if (v45 >= v44 >> 1) {
    uint64_t v14 = (void *)sub_1BF963664(v44 > 1, v45 + 1, 1, v14);
  }
  v14[2] = v45 + 1;
  (*(void (**)(unint64_t, void *, uint64_t))(v2 + 32))((unint64_t)v14+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v45, v43, v1);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t DebugJournal.Summary.placementIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DebugJournal.Summary.contentIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t DebugJournal.Summary.status.getter@<X0>(unint64_t *a1@<X8>)
{
  unint64_t v2 = v1[4];
  unint64_t v3 = v1[5];
  unint64_t v4 = v1[6];
  unint64_t v5 = v1[7];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_1BF96891C(v2);
}

uint64_t DebugJournal.Detail.label.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DebugJournal.Detail.value.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1BF9F1DFC()
{
  if (*v0) {
    return 0x65756C6176;
  }
  else {
    return 0x6C6562616CLL;
  }
}

uint64_t sub_1BF9F1E28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BF9F3A2C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BF9F1E50(uint64_t a1)
{
  unint64_t v2 = sub_1BF9F2054();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BF9F1E8C(uint64_t a1)
{
  unint64_t v2 = sub_1BF9F2054();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t DebugJournal.Detail.encode(to:)(void *a1)
{
  sub_1BF9F22C0(0, &qword_1EA17A0C8, MEMORY[0x1E4FBBDE0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)v11 - v6;
  uint64_t v8 = *(void *)(v1 + 16);
  v11[1] = *(void *)(v1 + 24);
  v11[2] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF9F2054();
  sub_1BFA18338();
  char v13 = 0;
  uint64_t v9 = v11[3];
  sub_1BFA181E8();
  if (!v9)
  {
    char v12 = 1;
    sub_1BFA181E8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1BF9F2054()
{
  unint64_t result = qword_1EA17A0D0;
  if (!qword_1EA17A0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A0D0);
  }
  return result;
}

uint64_t DebugJournal.Detail.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1BF9F22C0(0, &qword_1EA17A0D8, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v18 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF9F2054();
  sub_1BFA18328();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v21 = 0;
  uint64_t v10 = sub_1BFA18178();
  uint64_t v12 = v11;
  char v20 = 1;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1BFA18178();
  uint64_t v15 = v14;
  uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v19 = v13;
  v16(v9, v6);
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v19;
  a2[3] = v15;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1BF9F22C0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BF9F2054();
    unint64_t v7 = a3(a1, &type metadata for DebugJournal.Detail.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1BF9F2324@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return DebugJournal.Detail.init(from:)(a1, a2);
}

uint64_t sub_1BF9F233C(void *a1)
{
  return DebugJournal.Detail.encode(to:)(a1);
}

uint64_t DebugJournal.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t DebugJournal.summary.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v4 = v1[5];
  unint64_t v6 = v1[6];
  uint64_t v7 = v1[7];
  uint64_t v9 = v1[8];
  uint64_t v8 = v1[9];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v9;
  a1[7] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_1BF96891C(v6);
}

uint64_t DebugJournal.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DebugJournal.subtitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DebugJournal.details.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DebugJournal.additionalDetails.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DebugJournal.historicalJournals.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for DebugJournal(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BF972984(*(void *)(a1 + 48));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for DebugJournal(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  unint64_t v7 = a2[6];
  uint64_t v8 = a2[7];
  uint64_t v9 = a2[8];
  uint64_t v10 = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BF96891C(v7);
  a1[6] = v7;
  a1[7] = v8;
  a1[8] = v9;
  a1[9] = v10;
  uint64_t v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  uint64_t v12 = a2[13];
  a1[12] = a2[12];
  a1[13] = v12;
  uint64_t v13 = a2[15];
  a1[14] = a2[14];
  a1[15] = v13;
  uint64_t v15 = a2[16];
  uint64_t v14 = a2[17];
  a1[16] = v15;
  a1[17] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DebugJournal(void *a1, void *a2)
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
  unint64_t v4 = a2[6];
  uint64_t v5 = a2[7];
  uint64_t v6 = a2[8];
  uint64_t v7 = a2[9];
  sub_1BF96891C(v4);
  unint64_t v8 = a1[6];
  a1[6] = v4;
  a1[7] = v5;
  a1[8] = v6;
  a1[9] = v7;
  sub_1BF972984(v8);
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[15] = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[16] = a2[16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[17] = a2[17];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy144_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for DebugJournal(uint64_t a1, uint64_t a2)
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
  unint64_t v7 = *(void *)(a1 + 48);
  long long v8 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v8;
  sub_1BF972984(v7);
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DebugJournal(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 144)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DebugJournal(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 144) = 1;
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
    *(unsigned char *)(result + 144) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DebugJournal()
{
  return &type metadata for DebugJournal;
}

unint64_t destroy for DebugJournal.Summary(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(a1 + 32);
  return sub_1BF972984(v2);
}

void *initializeWithCopy for DebugJournal.Summary(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  unint64_t v5 = a2[4];
  uint64_t v6 = a2[5];
  uint64_t v7 = a2[6];
  uint64_t v8 = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BF96891C(v5);
  a1[4] = v5;
  a1[5] = v6;
  a1[6] = v7;
  a1[7] = v8;
  return a1;
}

void *assignWithCopy for DebugJournal.Summary(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v4 = a2[4];
  uint64_t v5 = a2[5];
  uint64_t v7 = a2[6];
  uint64_t v6 = a2[7];
  sub_1BF96891C(v4);
  unint64_t v8 = a1[4];
  a1[4] = v4;
  a1[5] = v5;
  a1[6] = v7;
  a1[7] = v6;
  sub_1BF972984(v8);
  return a1;
}

uint64_t assignWithTake for DebugJournal.Summary(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void *)(a1 + 32);
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  sub_1BF972984(v6);
  return a1;
}

ValueMetadata *type metadata accessor for DebugJournal.Summary()
{
  return &type metadata for DebugJournal.Summary;
}

ValueMetadata *type metadata accessor for DebugJournal.Detail()
{
  return &type metadata for DebugJournal.Detail;
}

uint64_t destroy for DebugJournal.Action(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 2) {
    unsigned int v1 = *(_DWORD *)a1 + 2;
  }
  if (v1 == 1) {
    return swift_bridgeObjectRelease();
  }
  else {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
}

uint64_t initializeWithCopy for DebugJournal.Action(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 2) {
    unsigned int v3 = *(_DWORD *)a2 + 2;
  }
  if (v3 == 1)
  {
    *(void *)a1 = *(void *)a2;
    swift_bridgeObjectRetain();
    char v4 = 1;
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t))(v5 - 8))(a1);
    char v4 = 0;
  }
  *(unsigned char *)(a1 + 40) = v4;
  return a1;
}

uint64_t assignWithCopy for DebugJournal.Action(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1) {
      swift_bridgeObjectRelease();
    }
    else {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 40) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      *(unsigned char *)(a1 + 40) = 0;
    }
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

uint64_t assignWithTake for DebugJournal.Action(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1) {
      swift_bridgeObjectRelease();
    }
    else {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      *(void *)a1 = *(void *)a2;
      char v6 = 1;
    }
    else
    {
      char v6 = 0;
      long long v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
    }
    *(unsigned char *)(a1 + 40) = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DebugJournal.Action(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 2) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DebugJournal.Action(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BF9F2D94(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_1BF9F2DB0(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DebugJournal.Action()
{
  return &type metadata for DebugJournal.Action;
}

unsigned char *storeEnumTagSinglePayload for DebugJournal.Detail.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF9F2EB4);
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

ValueMetadata *type metadata accessor for DebugJournal.Detail.CodingKeys()
{
  return &type metadata for DebugJournal.Detail.CodingKeys;
}

unint64_t sub_1BF9F2EF0()
{
  unint64_t result = qword_1EA17A0E0;
  if (!qword_1EA17A0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A0E0);
  }
  return result;
}

unint64_t sub_1BF9F2F48()
{
  unint64_t result = qword_1EA17A0E8;
  if (!qword_1EA17A0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A0E8);
  }
  return result;
}

unint64_t sub_1BF9F2FA0()
{
  unint64_t result = qword_1EA17A0F0;
  if (!qword_1EA17A0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A0F0);
  }
  return result;
}

uint64_t sub_1BF9F2FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v27 = a1;
  *(void *)&long long v32 = a2;
  *((void *)&v32 + 1) = a3;
  *(void *)&long long v33 = a4;
  *((void *)&v33 + 1) = a5;
  uint64_t v9 = type metadata accessor for AdRequest();
  uint64_t v10 = sub_1BFA17F48();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v26 - v13;
  uint64_t v15 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  uint64_t v18 = type metadata accessor for JournalEntry();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v27 + *(int *)(v18 + 76), v10);
  uint64_t v19 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v14, 1, v9) == 1)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
LABEL_6:
    uint64_t v34 = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v17, &v14[*(int *)(v9 + 56)], a3);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v9);
  sub_1BF95C108(0, (unint64_t *)&qword_1EBA78C70);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v20 = *((void *)&v33 + 1);
  if (*((void *)&v33 + 1))
  {
    uint64_t v21 = v34;
    __swift_project_boxed_opaque_existential_1(&v32, *((uint64_t *)&v33 + 1));
    double v22 = (*(double (**)(uint64_t, uint64_t))(v21 + 8))(v20, v21);
    uint64_t v24 = v23;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
    *(double *)&long long v32 = v22;
    *((void *)&v32 + 1) = v24;
    type metadata accessor for CGSize(0);
    return sub_1BFA17B88();
  }
LABEL_7:
  sub_1BF9F400C((uint64_t)&v32, &qword_1EBA78C78, (unint64_t *)&qword_1EBA78C70);
  return 0;
}

char *sub_1BF9F3300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&long long v37 = a2;
  *((void *)&v37 + 1) = a3;
  uint64_t v38 = a4;
  uint64_t v39 = a5;
  uint64_t v10 = type metadata accessor for AdRequest();
  uint64_t v11 = sub_1BFA17F48();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v33 - v13;
  uint64_t v15 = type metadata accessor for AdContext();
  uint64_t v34 = *(void *)(v15 - 8);
  uint64_t v35 = v15;
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  long long v33 = (char *)&v33 - v19;
  *(void *)&long long v37 = a2;
  *((void *)&v37 + 1) = a3;
  uint64_t v38 = a4;
  uint64_t v39 = a5;
  uint64_t v20 = type metadata accessor for JournalEntry();
  uint64_t v21 = *(int *)(v20 + 76);
  uint64_t v36 = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1 + v21, v11);
  uint64_t v22 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v14, 1, v10) == 1)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v23 = (char *)MEMORY[0x1E4FBC860];
  }
  else
  {
    uint64_t v25 = v34;
    uint64_t v24 = v35;
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v18, &v14[*(int *)(v10 + 52)], v35);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v10);
    uint64_t v26 = v33;
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v33, v18, v24);
    uint64_t v39 = a2;
    uint64_t v40 = a4;
    boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v37);
    (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(a2 - 8) + 16))(boxed_opaque_existential_2, v26, a2);
    char v41 = 0;
    uint64_t v23 = sub_1BF962C50(0, 1, 1, MEMORY[0x1E4FBC860]);
    unint64_t v29 = *((void *)v23 + 2);
    unint64_t v28 = *((void *)v23 + 3);
    if (v29 >= v28 >> 1) {
      uint64_t v23 = sub_1BF962C50((char *)(v28 > 1), v29 + 1, 1, v23);
    }
    *((void *)v23 + 2) = v29 + 1;
    sub_1BF9F3FF4(&v37, &v23[48 * v29 + 32]);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v24);
  }
  if (*(void *)(v36 + *(int *)(v20 + 68)))
  {
    *(void *)&long long v37 = *(void *)(v36 + *(int *)(v20 + 68));
    char v41 = 1;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v23 = sub_1BF962C50(0, *((void *)v23 + 2) + 1, 1, v23);
    }
    unint64_t v31 = *((void *)v23 + 2);
    unint64_t v30 = *((void *)v23 + 3);
    if (v31 >= v30 >> 1) {
      uint64_t v23 = sub_1BF962C50((char *)(v30 > 1), v31 + 1, 1, v23);
    }
    *((void *)v23 + 2) = v31 + 1;
    sub_1BF9F3FF4(&v37, &v23[48 * v31 + 32]);
  }
  return v23;
}

char *sub_1BF9F36FC(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = a6;
  *(void *)&long long v37 = a3;
  *((void *)&v37 + 1) = a4;
  uint64_t v32 = a4;
  uint64_t v33 = a5;
  *(void *)&long long v38 = a5;
  *((void *)&v38 + 1) = a6;
  uint64_t v10 = type metadata accessor for JournalEntry();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v30 - v12;
  if ((a1 & 1) == 0) {
    return (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v46 = a2;
  uint64_t v14 = swift_bridgeObjectRetain();
  if (MEMORY[0x1C18B7D10](v14, v10) < 2)
  {
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x1E4FBC860];
  }
  sub_1BFA17D68();
  uint64_t v15 = (void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v16 = (char *)MEMORY[0x1E4FBC860];
  uint64_t v31 = v6;
  do
  {
    swift_getWitnessTable();
    swift_getWitnessTable();
    sub_1BFA17DE8();
    (*v15)(v13, v10);
    uint64_t v26 = swift_bridgeObjectRetain();
    sub_1BF9F0524(v35, v26, 0, a3, v32, v33, v6);
    sub_1BF971CB8((uint64_t)v35, (uint64_t)v36);
    sub_1BF971CB8((uint64_t)v36, (uint64_t)&v37);
    if (sub_1BF971D74((uint64_t)&v37) != 1)
    {
      sub_1BF971CB8((uint64_t)v36, (uint64_t)v34);
      sub_1BF968848((uint64_t)v34);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v16 = sub_1BF962D88(0, *((void *)v16 + 2) + 1, 1, v16);
      }
      unint64_t v28 = *((void *)v16 + 2);
      unint64_t v27 = *((void *)v16 + 3);
      if (v28 >= v27 >> 1) {
        uint64_t v16 = sub_1BF962D88((char *)(v27 > 1), v28 + 1, 1, v16);
      }
      *((void *)v16 + 2) = v28 + 1;
      uint64_t v17 = &v16[144 * v28];
      *((_OWORD *)v17 + 2) = v37;
      long long v18 = v38;
      long long v19 = v39;
      long long v20 = v41;
      *((_OWORD *)v17 + 5) = v40;
      *((_OWORD *)v17 + 6) = v20;
      *((_OWORD *)v17 + 3) = v18;
      *((_OWORD *)v17 + 4) = v19;
      long long v21 = v42;
      long long v22 = v43;
      long long v23 = v45;
      *((_OWORD *)v17 + 9) = v44;
      *((_OWORD *)v17 + 10) = v23;
      *((_OWORD *)v17 + 7) = v21;
      *((_OWORD *)v17 + 8) = v22;
      sub_1BF9F3EB8((uint64_t)v36);
      uint64_t v6 = v31;
    }
    uint64_t v24 = swift_bridgeObjectRetain();
    uint64_t v25 = MEMORY[0x1C18B7D10](v24, v10);
    swift_bridgeObjectRelease();
  }
  while (v25 > 1);
  swift_bridgeObjectRelease();
  return v16;
}

id sub_1BF9F39C8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28C10]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 2);
  id result = objc_msgSend(v0, sel_setTimeStyle_, 2);
  qword_1EBA780E8 = (uint64_t)v0;
  return result;
}

uint64_t sub_1BF9F3A2C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1BFA18258();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1BF9F3B10(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BF9F3B48()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_1BF9F3B88()
{
  unint64_t result = qword_1EA17A100;
  if (!qword_1EA17A100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A100);
  }
  return result;
}

void sub_1BF9F3BDC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_1BF9F3E6C(255, &qword_1EA1793F0, (uint64_t)&type metadata for DebugJournal.Detail, MEMORY[0x1E4FBB320]);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_1BF9F3C60()
{
  unint64_t result = qword_1EA17A110;
  if (!qword_1EA17A110)
  {
    sub_1BF9F3BDC(255, &qword_1EA17A108, MEMORY[0x1E4FBB320]);
    sub_1BF9F3D18(&qword_1EA17A118, &qword_1EA1793F0, (uint64_t)&type metadata for DebugJournal.Detail, (void (*)(void))sub_1BF9F3DA4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A110);
  }
  return result;
}

uint64_t sub_1BF9F3D18(unint64_t *a1, unint64_t *a2, uint64_t a3, void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1BF9F3E6C(255, a2, a3, MEMORY[0x1E4FBB320]);
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BF9F3DA4()
{
  unint64_t result = qword_1EA17A120;
  if (!qword_1EA17A120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A120);
  }
  return result;
}

double sub_1BF9F3DF8(_OWORD *a1)
{
  double result = 0.0;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

void sub_1BF9F3E14(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_1BF95C108(255, a3);
    unint64_t v4 = sub_1BFA17F48();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1BF9F3E6C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1BF9F3EB8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1BF9F3F14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1BF972984(a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

_OWORD *sub_1BF9F3FF4(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(long long *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t sub_1BF9F400C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  sub_1BF9F3E14(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t BannerAdViewManager.__allocating_init(adManager:requestStore:layoutStore:journal:host:)(long long *a1, uint64_t a2, long long *a3, uint64_t a4, long long *a5)
{
  uint64_t v10 = swift_allocObject();
  BannerAdViewManager.init(adManager:requestStore:layoutStore:journal:host:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t BannerAdViewManager.init(adManager:requestStore:layoutStore:journal:host:)(long long *a1, uint64_t a2, long long *a3, uint64_t a4, long long *a5)
{
  long long v13 = *a5;
  uint64_t v10 = *((void *)a5 + 2);
  uint64_t v11 = *((void *)a5 + 3);
  type metadata accessor for DisposableObserver();
  *(void *)(v5 + 144) = sub_1BFA17D08();
  *(void *)(v5 + 152) = sub_1BF999958(MEMORY[0x1E4FBC860]);
  sub_1BF95BCD0(a1, v5 + 16);
  *(void *)(v5 + 56) = a2;
  sub_1BF95BCD0(a3, v5 + 64);
  *(void *)(v5 + 104) = a4;
  *(_OWORD *)(v5 + 112) = v13;
  *(void *)(v5 + 128) = v10;
  *(void *)(v5 + 136) = v11;
  return v5;
}

char *BannerAdViewManager.view(for:model:size:position:)(void *a1, unint64_t a2, double a3, double a4, double a5, double a6)
{
  void (*v43)(double *__return_ptr, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  double v75;
  double v76;
  double v77;
  id v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  char *v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  uint64_t v103;
  double v104;
  uint64_t (*v105)(uint64_t, uint64_t, void *, void, double, double, double, double);
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  uint64_t ObjectType;
  uint64_t (*v115)(void);
  uint64_t v116;
  uint64_t v117;
  void (*v118)(char *, unint64_t, uint64_t);
  char *v119;
  uint64_t v120;
  uint64_t v121;
  void (*v122)(char *, uint64_t *, uint64_t);
  char *v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  double *v128;
  void *v129;
  uint64_t v130;
  double v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  double *v139;
  uint64_t v140;
  void (*v141)(uint64_t, uint64_t);
  double v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  char *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  double v161;
  double v162;
  id v163;
  char *v164;
  id v166;
  void **v167;
  char *v168;
  char isUniquelyReferenced_nonNull_native;
  void v170[2];
  void **v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  char *v180;
  char *v181;
  char *v182;
  double v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  double v189;
  double v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  double v195;
  double v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  double v200;
  uint64_t *v201;
  uint64_t v202;
  unint64_t v203;
  uint64_t v204;
  void *v205;
  uint64_t v206;
  double v207;
  double v208;
  double v209;
  uint64_t v210;
  uint64_t v211;

  unint64_t v7 = v6;
  long long v203 = a2;
  uint64_t v205 = a1;
  double v12 = *v6;
  uint64_t v13 = *(void *)(*(void *)v6 + 104);
  uint64_t v191 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](a1);
  v182 = (char *)v170 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = v15;
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  v181 = (char *)v170 - v17;
  uint64_t v197 = *(void **)(v18 + 88);
  uint64_t v174 = *(v197 - 1);
  MEMORY[0x1F4188790](v16);
  v184 = (char *)v170 - v19;
  double v21 = v20[10];
  double v22 = v20[12];
  uint64_t v23 = *((void *)v20 + 14);
  uint64_t v24 = *((void *)v20 + 16);
  uint64_t v195 = v22;
  uint64_t v196 = v21;
  uint64_t v208 = v21;
  uint64_t v209 = v22;
  v193 = v24;
  uint64_t v194 = v23;
  unint64_t v210 = v23;
  unint64_t v211 = v24;
  uint64_t v25 = type metadata accessor for AdRequest();
  uint64_t v26 = sub_1BFA17F48();
  uint64_t v198 = *(void *)(v26 - 8);
  uint64_t v199 = v26;
  uint64_t v27 = MEMORY[0x1F4188790](v26);
  v177 = (char *)v170 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  *(void *)&uint64_t v200 = (char *)v170 - v30;
  uint64_t v204 = *(void *)(v25 - 8);
  uint64_t v31 = MEMORY[0x1F4188790](v29);
  uint64_t v33 = (char *)v170 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = MEMORY[0x1F4188790](v31);
  v180 = (char *)v170 - v35;
  uint64_t v175 = v36;
  MEMORY[0x1F4188790](v34);
  v201 = (void *)((char *)v170 - v37);
  uint64_t v38 = sub_1BFA17A28();
  uint64_t v39 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  *(void *)&double v41 = (char *)v170 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF973CEC();
  **(void **)&double v41 = sub_1BFA17E98();
  (*(void (**)(double, void, uint64_t))(v39 + 104))(COERCE_DOUBLE(*(void *)&v41), *MEMORY[0x1E4FBCBF0], v38);
  char v42 = sub_1BFA17A48();
  (*(void (**)(double, uint64_t))(v39 + 8))(COERCE_DOUBLE(*(void *)&v41), v38);
  if ((v42 & 1) == 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  v183 = v12;
  long long v43 = *(void (**)(double *__return_ptr, uint64_t))(*(void *)(*(void *)&v12 + 136) + 8);
  uint64_t v178 = *(void *)(*(void *)&v12 + 136);
  v179 = v13;
  v43(&v208, v13);
  long long v44 = *(void *)&v208;
  double v41 = v209;
  swift_bridgeObjectRetain();
  sub_1BF972804((uint64_t)&v208);
  swift_beginAccess();
  long long v45 = *((void *)v7 + 19);
  uint64_t v46 = *(void *)(v45 + 16);
  unint64_t v206 = v44;
  if (!v46)
  {
LABEL_9:
    unint64_t v171 = (void **)(v7 + 19);
    uint64_t v172 = v33;
    long long v202 = v25;
    swift_endAccess();
    if (qword_1EBA79730 == -1)
    {
LABEL_10:
      uint64_t v61 = (void *)qword_1EBA79208;
      sub_1BF99C5F8(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
      uint64_t v185 = v62;
      uint64_t v63 = swift_allocObject();
      *(_OWORD *)(v63 + 16) = xmmword_1BFA19640;
      uint64_t v64 = MEMORY[0x1E4FBB1A0];
      *(void *)(v63 + 56) = MEMORY[0x1E4FBB1A0];
      uint64_t v65 = sub_1BF95AB38();
      uint64_t v66 = v205;
      *(void *)(v63 + 32) = v206;
      *(double *)(v63 + 40) = v41;
      uint64_t v67 = v66[2];
      v68 = v66[3];
      *(void *)(v63 + 96) = v64;
      *(void *)(v63 + 104) = v65;
      uint64_t v69 = v65;
      *(void *)(v63 + 64) = v65;
      *(void *)(v63 + 72) = v67;
      long long v186 = v67;
      int v187 = v68;
      *(void *)(v63 + 80) = v68;
      uint64_t v71 = v7[14];
      uint64_t v70 = v7[15];
      unint64_t v73 = *((void *)v7 + 16);
      unint64_t v72 = *((void *)v7 + 17);
      v189 = v71;
      v190 = v70;
      unint64_t v173 = v73;
      v188 = v72;
      if (v72)
      {
        uint64_t v208 = v71;
        uint64_t v209 = v70;
        swift_bridgeObjectRetain();
        uint64_t v74 = v61;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1BFA17BD8();
        sub_1BFA17BD8();
        sub_1BFA17BD8();
        uint64_t v75 = v208;
        v76 = v209;
      }
      else
      {
        uint64_t v77 = v70;
        swift_bridgeObjectRetain();
        uint64_t v78 = v61;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v75 = v71;
        v76 = v77;
      }
      uint64_t v79 = MEMORY[0x1E4FBB1A0];
      *(void *)(v63 + 136) = MEMORY[0x1E4FBB1A0];
      *(void *)(v63 + 144) = v69;
      unint64_t v80 = (char *)v69;
      *(double *)(v63 + 112) = v75;
      *(double *)(v63 + 120) = v76;
      sub_1BFA17E48();
      sub_1BFA177B8();

      swift_bridgeObjectRelease();
      LOBYTE(v208) = 0;
      unint64_t v81 = *(char **)&v200;
      unsigned int v82 = v206;
      AdRequestStore.request(for:behavior:)(v206, *(uint64_t *)&v41, (unsigned __int8 *)&v208, *(char **)&v200);
      uint64_t v83 = v204;
      v84 = v202;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v204 + 48))(v81, 1, v202) == 1)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v198 + 8))(v81, v199);
        return 0;
      }
      else
      {
        v170[0] = *(void *)(v83 + 32);
        v170[1] = v83 + 32;
        ((void (*)(uint64_t *, char *, uint64_t))v170[0])(v201, v81, v84);
        uint64_t v85 = v82;
        uint64_t v86 = (void *)qword_1EBA79208;
        uint64_t v87 = swift_allocObject();
        *(_OWORD *)(v87 + 16) = xmmword_1BFA1F2F0;
        *(void *)(v87 + 56) = v79;
        *(void *)(v87 + 64) = v80;
        *(void *)(v87 + 32) = v85;
        *(double *)(v87 + 40) = v41;
        *(void *)(v87 + 96) = v79;
        *(void *)(v87 + 104) = v80;
        uint64_t v88 = v187;
        *(void *)(v87 + 72) = v186;
        *(void *)(v87 + 80) = v88;
        uint64_t v208 = a3;
        uint64_t v209 = a4;
        type metadata accessor for CGSize(0);
        uint64_t v192 = *(void *)&v41;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v89 = v86;
        uint64_t v90 = sub_1BFA17B88();
        *(void *)(v87 + 136) = v79;
        *(void *)(v87 + 144) = v80;
        *(void *)(v87 + 112) = v90;
        *(void *)(v87 + 120) = v91;
        uint64_t v208 = a5;
        uint64_t v209 = a6;
        type metadata accessor for CGPoint(0);
        v92 = sub_1BFA17B88();
        *(void *)(v87 + 176) = v79;
        *(void *)(v87 + 184) = v80;
        *(void *)(v87 + 152) = v92;
        *(void *)(v87 + 160) = v93;
        if (v188)
        {
          uint64_t v208 = v189;
          uint64_t v209 = v190;
          swift_bridgeObjectRetain();
          sub_1BFA17BD8();
          sub_1BFA17BD8();
          sub_1BFA17BD8();
          uint64_t v94 = v208;
          uint64_t v95 = v209;
        }
        else
        {
          uint64_t v96 = v190;
          swift_bridgeObjectRetain();
          uint64_t v94 = v189;
          uint64_t v95 = v96;
        }
        uint64_t v97 = v197;
        uint64_t v99 = v183;
        id v98 = v184;
        *(void *)(v87 + 216) = MEMORY[0x1E4FBB1A0];
        *(void *)(v87 + 224) = v80;
        v184 = v80;
        *(double *)(v87 + 192) = v94;
        *(double *)(v87 + 200) = v95;
        sub_1BFA17E48();
        sub_1BFA177B8();

        swift_bridgeObjectRelease();
        uint64_t v100 = *((void *)v7 + 5);
        uint64_t v101 = *((void *)v7 + 6);
        __swift_project_boxed_opaque_existential_1((void *)v7 + 2, v100);
        uint64_t v102 = *(double *)(*(void *)&v99 + 120);
        uint64_t v103 = (uint64_t)v201;
        (*(void (**)(void *, uint64_t *, double, void *, double, uint64_t, void, uint64_t, uint64_t, uint64_t))(v101 + 24))(v205, v201, COERCE_DOUBLE(*(void *)&v196), v97, COERCE_DOUBLE(*(void *)&v195), v194, *(void *)(*(void *)&v102 + 8), v193, v100, v101);
        uint64_t v104 = v102;
        v183 = v102;
        unint64_t v105 = *(uint64_t (**)(uint64_t, uint64_t, void *, void, double, double, double, double))(*(void *)&v102 + 16);
        long long v106 = v206;
        uint64_t v107 = v192;
        *(double *)&uint64_t v108 = COERCE_DOUBLE(v105(v206, v192, v97, *(void *)&v104, a5, a6, a3, a4));
        uint64_t v109 = v97;
        v110 = (char *)v108;
        uint64_t v112 = v111;
        (*(void (**)(char *, void *))(v174 + 8))(v98, v109);
        uint64_t v113 = CACurrentMediaTime();
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v208 = *(double *)&v110;
        uint64_t v200 = *(double *)&v110;
        uint64_t v115 = *(uint64_t (**)(void))(v112 + 8);
        uint64_t v198 = ObjectType;
        uint64_t v199 = v112;
        int64x2_t v116 = v115();
        Journal.addRequestedEntry(request:placementIdentifier:contentIdentifier:)(v103, v106, v107, v116, v117);
        swift_bridgeObjectRelease();
        v177 = (char *)swift_allocObject();
        swift_weakInit();
        uint64_t v174 = swift_allocObject();
        *(void *)(v174 + 24) = v112;
        swift_unknownObjectWeakInit();
        v118 = *(void (**)(char *, unint64_t, uint64_t))(v191 + 16);
        v119 = v181;
        uint64_t v120 = v179;
        v118(v181, v203, v179);
        uint64_t v121 = v202;
        uint64_t v122 = *(void (**)(char *, uint64_t *, uint64_t))(v204 + 16);
        uint64_t v123 = v180;
        v122(v180, v201, v202);
        v118(v182, (unint64_t)v119, v120);
        v122(v172, (uint64_t *)v123, v121);
        unint64_t v124 = v191;
        unint64_t v125 = (*(unsigned __int8 *)(v191 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v191 + 80);
        unint64_t v126 = (v176 + *(unsigned __int8 *)(v204 + 80) + v125) & ~(unint64_t)*(unsigned __int8 *)(v204 + 80);
        uint64_t v176 = (v175 + v126 + 7) & 0xFFFFFFFFFFFFFFF8;
        long long v203 = (v176 + 23) & 0xFFFFFFFFFFFFFFF8;
        v127 = (v203 + 15) & 0xFFFFFFFFFFFFFFF8;
        unint64_t v128 = (double *)swift_allocObject();
        unint64_t v129 = v197;
        v128[2] = v196;
        *((void *)v128 + 3) = v129;
        v128[4] = v195;
        *((void *)v128 + 5) = v120;
        uint64_t v130 = v120;
        uint64_t v131 = v183;
        *((void *)v128 + 6) = v194;
        v128[7] = v131;
        unint64_t v133 = v177;
        uint64_t v132 = v178;
        *((void *)v128 + 8) = v193;
        *((void *)v128 + 9) = v132;
        v134 = v174;
        *((void *)v128 + 10) = v133;
        *((void *)v128 + 11) = v134;
        uint64_t v135 = (char *)v128 + v125;
        uint64_t v136 = v192;
        (*(void (**)(char *, char *, uint64_t))(v124 + 32))(v135, v181, v130);
        ((void (*)(char *, char *, uint64_t))v170[0])((char *)v128 + v126, v180, v202);
        long long v137 = (void *)((char *)v128 + v176);
        char v138 = v206;
        *long long v137 = v206;
        v137[1] = v136;
        *(void *)((char *)v128 + v203) = v205;
        *(double *)((char *)v128 + v127) = v113;
        unint64_t v139 = (double *)((char *)v128 + ((v127 + 15) & 0xFFFFFFFFFFFFFFF8));
        *unint64_t v139 = a5;
        v139[1] = a6;
        unint64_t v140 = v199;
        uint64_t v208 = v200;
        uint64_t v197 = *(void **)(v199 + 24);
        v141 = (void (*)(uint64_t, uint64_t))v197;
        long long v203 = v199 + 24;
        swift_bridgeObjectRetain();
        swift_retain();
        swift_retain();
        swift_retain();
        v141(v198, v140);
        sub_1BFA16E78();
        swift_release();
        uint64_t v142 = v208;
        unint64_t v207 = v208;
        uint64_t v143 = v179;
        unint64_t v144 = (uint64_t)v133;
        uint64_t v145 = (uint64_t)v182;
        uint64_t v146 = v172;
        long long v147 = v138;
        v148 = v192;
        sub_1BF9F5558((void **)&v207, v113, a5, a6, v144, v134, (uint64_t)v182, v172, v147, v192, v205);
        swift_release();
        swift_release();
        sub_1BF95F4C4(*(id *)&v142);
        unint64_t v149 = *(void **)(v204 + 8);
        v204 += 8;
        uint64_t v205 = v149;
        ((void (*)(char *, uint64_t))v149)(v146, v202);
        (*(void (**)(uint64_t, uint64_t))(v191 + 8))(v145, v143);
        unint64_t v150 = v148;
        uint64_t v208 = v200;
        v151 = v184;
        ((void (*)(uint64_t, uint64_t))v197)(v198, v199);
        uint64_t v152 = swift_allocObject();
        *(void *)(v152 + 16) = sub_1BF9F76A4;
        *(void *)(v152 + 24) = v128;
        swift_retain();
        sub_1BFA16E88();
        swift_release();
        swift_release();
        __swift_project_boxed_opaque_existential_1(&v208, v211);
        sub_1BFA16D28();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v208);
        uint64_t v153 = (void *)qword_1EBA79208;
        uint64_t v154 = swift_allocObject();
        *(_OWORD *)(v154 + 16) = xmmword_1BFA1A3B0;
        uint64_t v155 = MEMORY[0x1E4FBB1A0];
        *(void *)(v154 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v154 + 64) = v151;
        *(void *)(v154 + 32) = v206;
        *(void *)(v154 + 40) = v150;
        *(void *)(v154 + 96) = v155;
        *(void *)(v154 + 104) = v151;
        uint64_t v156 = v187;
        *(void *)(v154 + 72) = v186;
        *(void *)(v154 + 80) = v156;
        v157 = *v201;
        v158 = v201[1];
        *(void *)(v154 + 136) = v155;
        *(void *)(v154 + 144) = v151;
        *(void *)(v154 + 112) = v157;
        *(void *)(v154 + 120) = v158;
        v159 = v155;
        if (v188)
        {
          uint64_t v208 = v189;
          uint64_t v209 = v190;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v160 = v153;
          swift_bridgeObjectRetain();
          sub_1BFA17BD8();
          sub_1BFA17BD8();
          sub_1BFA17BD8();
          unint64_t v161 = v208;
          uint64_t v162 = v209;
        }
        else
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v162 = v190;
          swift_bridgeObjectRetain();
          uint64_t v166 = v153;
          swift_bridgeObjectRetain();
          unint64_t v161 = v189;
        }
        *(void *)(v154 + 176) = v159;
        *(void *)(v154 + 184) = v151;
        *(double *)(v154 + 152) = v161;
        *(double *)(v154 + 160) = v162;
        sub_1BFA17E48();
        sub_1BFA177B8();

        swift_bridgeObjectRelease();
        uint64_t v167 = v171;
        swift_beginAccess();
        v164 = *(char **)&v200;
        uint64_t v168 = (char *)*(id *)&v200;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v207 = *(double *)v167;
        *uint64_t v167 = (void *)0x8000000000000000;
        sub_1BF9C8494((uint64_t)v168, v199, v206, v192, isUniquelyReferenced_nonNull_native);
        *(double *)uint64_t v167 = v207;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_release();
        ((void (*)(uint64_t *, uint64_t))v205)(v201, v202);
      }
      return v164;
    }
LABEL_26:
    swift_once();
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  unint64_t v47 = sub_1BF9A7240(v44, *(uint64_t *)&v41);
  if ((v48 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t v49 = *(void *)(v45 + 56) + 16 * v47;
  uint64_t v50 = *(void **)v49;
  uint64_t v199 = *(void *)(v49 + 8);
  swift_endAccess();
  uint64_t v200 = COERCE_DOUBLE(v50);
  swift_bridgeObjectRelease();
  if (qword_1EBA79730 != -1) {
    swift_once();
  }
  unint64_t v51 = (void *)qword_1EBA79208;
  sub_1BF99C5F8(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_1BFA19640;
  uint64_t v53 = MEMORY[0x1E4FBB1A0];
  *(void *)(v52 + 56) = MEMORY[0x1E4FBB1A0];
  unsigned int v54 = sub_1BF95AB38();
  uint64_t v55 = v205;
  *(void *)(v52 + 32) = v206;
  *(double *)(v52 + 40) = v41;
  unint64_t v56 = v55[2];
  uint64_t v57 = v55[3];
  *(void *)(v52 + 96) = v53;
  *(void *)(v52 + 104) = v54;
  *(void *)(v52 + 64) = v54;
  *(void *)(v52 + 72) = v56;
  *(void *)(v52 + 80) = v57;
  uint64_t v59 = v7[14];
  uint64_t v58 = v7[15];
  if (*((void *)v7 + 17))
  {
    uint64_t v208 = v7[14];
    uint64_t v209 = v58;
    uint64_t v60 = v51;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BFA17BD8();
    sub_1BFA17BD8();
    sub_1BFA17BD8();
    uint64_t v59 = v208;
    uint64_t v58 = v209;
  }
  else
  {
    v163 = v51;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v164 = *(char **)&v200;
  *(void *)(v52 + 136) = v53;
  *(void *)(v52 + 144) = v54;
  *(double *)(v52 + 112) = v59;
  *(double *)(v52 + 120) = v58;
  sub_1BFA17E48();
  sub_1BFA177B8();

  swift_bridgeObjectRelease();
  return v164;
}

uint64_t sub_1BF9F5558(void **a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, void *a11)
{
  uint64_t v150 = a10;
  uint64_t v149 = a9;
  uint64_t v19 = *a11;
  uint64_t v20 = *(void *)(*a11 + 128);
  *(void *)&v153[0] = *(void *)(*a11 + 88);
  *(long long *)((char *)v153 + 8) = *(_OWORD *)(v19 + 104);
  *((void *)&v153[1] + 1) = v20;
  uint64_t v21 = type metadata accessor for AdRequest();
  uint64_t v22 = sub_1BFA17F48();
  uint64_t v148 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)&v133 - v23;
  uint64_t v25 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v27 = (void *)result;
    long long v147 = a8;
    swift_beginAccess();
    uint64_t v28 = (void *)MEMORY[0x1C18B8B60](a6 + 16);
    if (!v28) {
      return swift_release();
    }
    uint64_t v29 = v28;
    if (!v25)
    {
      uint64_t v39 = *(void *)(v21 - 8);
      (*(void (**)(char *, void *, uint64_t))(v39 + 16))(v24, v147, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v24, 0, 1, v21);
      *(void *)&v153[0] = 1;
      memset((char *)v153 + 8, 0, 72);
      char v154 = 2;
      sub_1BF9F67F0(a7, v24, (uint64_t)v153);

LABEL_22:
      swift_release();
      sub_1BF9890B8((uint64_t)v153);
      return (*(uint64_t (**)(char *, uint64_t))(v148 + 8))(v24, v22);
    }
    uint64_t v30 = *(void *)(a6 + 24);
    id v146 = v28;
    uint64_t v145 = a7;
    uint64_t v144 = v30;
    if (v25 == (void *)1)
    {
      uint64_t v143 = v24;
      uint64_t v142 = (void (*)(void, void, void))v22;
      if (qword_1EBA79730 != -1) {
        swift_once();
      }
      id v139 = (id)qword_1EBA79208;
      sub_1BF99C5F8(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
      uint64_t v137 = v40;
      uint64_t v41 = swift_allocObject();
      *(_OWORD *)(v41 + 16) = xmmword_1BFA197B0;
      uint64_t v42 = MEMORY[0x1E4FBB1A0];
      *(void *)(v41 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v43 = sub_1BF95AB38();
      uint64_t v44 = v150;
      *(void *)(v41 + 32) = v149;
      *(void *)(v41 + 40) = v44;
      long long v45 = (void (*)(char *, void, uint64_t, uint64_t))a11[2];
      uint64_t v46 = (void (*)(void, void, void))a11[3];
      *(void *)(v41 + 96) = v42;
      *(void *)(v41 + 104) = v43;
      *(void *)(v41 + 64) = v43;
      *(void *)(v41 + 72) = v45;
      uint64_t v135 = v45;
      *(void *)(v41 + 80) = v46;
      uint64_t v47 = *v147;
      uint64_t v48 = v147[1];
      *(void *)(v41 + 136) = v42;
      *(void *)(v41 + 144) = v43;
      *(void *)(v41 + 112) = v47;
      *(void *)(v41 + 120) = v48;
      *(void *)&v153[0] = 0;
      *((void *)&v153[0] + 1) = 0xE000000000000000;
      id v49 = v146;
      id ObjectType = (id)swift_getObjectType();
      id v139 = v139;
      swift_bridgeObjectRetain();
      uint64_t v136 = v46;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      objc_msgSend(v49, sel_frame);
      v152[0] = v50;
      v152[1] = v51;
      type metadata accessor for CGSize(0);
      sub_1BFA180B8();
      long long v52 = v153[0];
      *(void *)(v41 + 176) = v42;
      *(void *)(v41 + 184) = v43;
      *(_OWORD *)(v41 + 152) = v52;
      CFTimeInterval v53 = CACurrentMediaTime();
      uint64_t v54 = MEMORY[0x1E4FBB460];
      *(void *)(v41 + 216) = MEMORY[0x1E4FBB3D0];
      *(void *)(v41 + 224) = v54;
      *(CFTimeInterval *)(v41 + 192) = (v53 - a2) * 1000.0;
      uint64_t v56 = v27[14];
      uint64_t v55 = v27[15];
      uint64_t v57 = v27[17];
      uint64_t v58 = v27;
      uint64_t v140 = v21;
      if (v57)
      {
        *(void *)&v153[0] = v56;
        *((void *)&v153[0] + 1) = v55;
        swift_bridgeObjectRetain();
        sub_1BFA17BD8();
        sub_1BFA17BD8();
        sub_1BFA17BD8();
        uint64_t v59 = *((void *)&v153[0] + 1);
        uint64_t v56 = *(void *)&v153[0];
      }
      else
      {
        uint64_t v59 = swift_bridgeObjectRetain();
      }
      *(void *)(v41 + 256) = v42;
      *(void *)(v41 + 264) = v43;
      v134 = (void *)v43;
      *(void *)(v41 + 232) = v56;
      *(void *)(v41 + 240) = v59;
      sub_1BFA17E48();
      id v82 = v139;
      sub_1BFA177B8();

      swift_bridgeObjectRelease();
      id v83 = v146;
      objc_msgSend(v146, sel_frame);
      uint64_t v85 = v84;
      uint64_t v87 = v86;
      *(void *)&v153[0] = v83;
      uint64_t v88 = v144;
      uint64_t v89 = *(double (**)(id, uint64_t))(v144 + 40);
      id v90 = ObjectType;
      double v91 = v89(ObjectType, v144);
      *(void *)&v153[0] = v83;
      v89(v90, v88);
      uint64_t v93 = v92;
      uint64_t v94 = v58[11];
      uint64_t v95 = v58[12];
      __swift_project_boxed_opaque_existential_1(v58 + 8, v94);
      *(void *)&v153[0] = v85;
      *((void *)&v153[0] + 1) = v87;
      *(double *)&v153[1] = v91;
      *((void *)&v153[1] + 1) = v93;
      uint64_t v96 = v58;
      uint64_t v97 = v149;
      uint64_t v98 = v150;
      (*(void (**)(long long *, uint64_t, uint64_t, uint64_t, uint64_t))(v95 + 16))(v153, v149, v150, v94, v95);
      objc_msgSend(v83, sel_frame);
      uint64_t v100 = v99;
      uint64_t v102 = v101;
      *(void *)&v153[0] = v83;
      uint64_t v103 = *(uint64_t (**)(id, uint64_t))(v88 + 8);
      id v139 = (id)(v88 + 8);
      unint64_t v133 = v103;
      uint64_t v104 = v103(v90, v88);
      *(double *)uint64_t v153 = a3;
      *((double *)v153 + 1) = a4;
      *(void *)&v153[1] = v100;
      *((void *)&v153[1] + 1) = v102;
      LOBYTE(v153[2]) = 0;
      Journal.addFulfilledEntry(request:placementIdentifier:contentIdentifier:layout:)((uint64_t)v147, v97, v98, v104, v105, v153);
      swift_bridgeObjectRelease();
      id v151 = v83;
      (*(void (**)(long long *__return_ptr, id, uint64_t))(v88 + 16))(v153, v90, v88);
      if (*((void *)&v153[1] + 1))
      {
        sub_1BF95BCD0(v153, (uint64_t)v152);
        uint64_t v106 = v140;
        uint64_t v107 = *(void *)(v140 - 8);
        uint64_t v108 = v143;
        (*(void (**)(char *, void *, uint64_t))(v107 + 16))(v143, v147, v140);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v107 + 56))(v108, 0, 1, v106);
        sub_1BF95BBDC((uint64_t)v152, (uint64_t)v153);
        char v154 = 0;
        sub_1BF9F67F0(v145, v108, (uint64_t)v153);

        swift_release();
        sub_1BF9890B8((uint64_t)v153);
        (*(void (**)(char *, void (*)(void, void, void)))(v148 + 8))(v108, v142);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v152);
      }
      else
      {
        sub_1BF95F0E8((uint64_t)v153);
        id v118 = (id)qword_1EBA79208;
        sub_1BFA17E38();
        uint64_t v119 = swift_allocObject();
        *(_OWORD *)(v119 + 16) = xmmword_1BFA195C0;
        uint64_t v120 = MEMORY[0x1E4FBB1A0];
        uint64_t v121 = (uint64_t)v134;
        *(void *)(v119 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v119 + 64) = v121;
        *(void *)(v119 + 32) = v97;
        *(void *)(v119 + 40) = v98;
        *(void *)(v119 + 96) = v120;
        *(void *)(v119 + 104) = v121;
        uint64_t v122 = v136;
        *(void *)(v119 + 72) = v135;
        *(void *)(v119 + 80) = v122;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1BFA177B8();

        swift_bridgeObjectRelease();
        uint64_t v137 = v96[13];
        sub_1BF97D30C();
        v134 = (void *)swift_allocError();
        *(void *)uint64_t v123 = 0;
        *(unsigned char *)(v123 + 8) = 1;
        uint64_t v124 = v140;
        uint64_t v125 = *(void *)(v140 - 8);
        uint64_t v126 = v148;
        uint64_t v136 = *(void (**)(void, void, void))(v125 + 16);
        v127 = v143;
        v136(v143, v147, v140);
        uint64_t v135 = *(void (**)(char *, void, uint64_t, uint64_t))(v125 + 56);
        v135(v127, 0, 1, v124);
        *(void *)&v153[0] = v83;
        uint64_t v128 = v133(ObjectType, v88);
        unint64_t v129 = v134;
        Journal.addFailedEntry(error:request:placementIdentifier:contentIdentifier:)((uint64_t)v134, (uint64_t)v127, v149, v150, v128, v130);
        swift_bridgeObjectRelease();
        uint64_t v131 = *(void (**)(void, void))(v126 + 8);
        uint64_t v132 = v142;
        v131(v127, v142);

        v136(v127, v147, v124);
        v135(v127, 0, 1, v124);
        memset(v153, 0, sizeof(v153));
        char v154 = 1;
        sub_1BF9F67F0(v145, v127, (uint64_t)v153);

        swift_release();
        sub_1BF9890B8((uint64_t)v153);
        return ((uint64_t (*)(char *, void (*)(void, void, void)))v131)(v127, v132);
      }
    }
    else
    {
      if (v25 == (void *)2)
      {
        if (qword_1EBA79730 != -1) {
          swift_once();
        }
        id ObjectType = (id)qword_1EBA79208;
        LODWORD(v139) = sub_1BFA17E38();
        sub_1BF99C5F8(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
        uint64_t v31 = swift_allocObject();
        *(_OWORD *)(v31 + 16) = xmmword_1BFA19640;
        uint64_t v32 = MEMORY[0x1E4FBB1A0];
        *(void *)(v31 + 56) = MEMORY[0x1E4FBB1A0];
        unint64_t v33 = sub_1BF95AB38();
        uint64_t v34 = v150;
        *(void *)(v31 + 32) = v149;
        *(void *)(v31 + 40) = v34;
        uint64_t v35 = a11[2];
        uint64_t v36 = a11[3];
        *(void *)(v31 + 96) = v32;
        *(void *)(v31 + 104) = v33;
        *(void *)(v31 + 64) = v33;
        *(void *)(v31 + 72) = v35;
        *(void *)(v31 + 80) = v36;
        uint64_t v38 = v27[14];
        uint64_t v37 = v27[15];
        if (v27[17])
        {
          uint64_t v143 = v24;
          uint64_t v142 = (void (*)(void, void, void))v22;
          *(void *)&v153[0] = v38;
          *((void *)&v153[0] + 1) = v37;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1BFA17BD8();
          uint64_t v22 = (uint64_t)v142;
          uint64_t v24 = v143;
          sub_1BFA17BD8();
          sub_1BFA17BD8();
          uint64_t v37 = *((void *)&v153[0] + 1);
          uint64_t v38 = *(void *)&v153[0];
        }
        else
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        *(void *)(v31 + 136) = MEMORY[0x1E4FBB1A0];
        *(void *)(v31 + 144) = v33;
        *(void *)(v31 + 112) = v38;
        *(void *)(v31 + 120) = v37;
        uint64_t v71 = ObjectType;
        sub_1BFA177B8();

        swift_bridgeObjectRelease();
        id v72 = v146;
        uint64_t v73 = swift_getObjectType();
        objc_msgSend(v72, sel_frame);
        uint64_t v75 = v74;
        uint64_t v77 = v76;
        *(void *)&v153[0] = v72;
        uint64_t v78 = (*(uint64_t (**)(uint64_t))(v144 + 8))(v73);
        *(double *)uint64_t v153 = a3;
        *((double *)v153 + 1) = a4;
        *(void *)&v153[1] = v75;
        *((void *)&v153[1] + 1) = v77;
        LOBYTE(v153[2]) = 0;
        uint64_t v79 = v147;
        Journal.addCollapsedEntry(request:placementIdentifier:contentIdentifier:layout:)((uint64_t)v147, v149, v150, v78, v80, v153);
        swift_bridgeObjectRelease();
        uint64_t v81 = *(void *)(v21 - 8);
        (*(void (**)(char *, void *, uint64_t))(v81 + 16))(v24, v79, v21);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v81 + 56))(v24, 0, 1, v21);
        memset(v153, 0, sizeof(v153));
        char v154 = 1;
        sub_1BF9F67F0(v145, v24, (uint64_t)v153);

        goto LABEL_22;
      }
      id v60 = v25;
      if (qword_1EBA79730 != -1) {
        swift_once();
      }
      uint64_t v143 = v24;
      id ObjectType = (id)qword_1EBA79208;
      LODWORD(v142) = sub_1BFA17E38();
      sub_1BF99C5F8(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
      uint64_t v61 = swift_allocObject();
      *(_OWORD *)(v61 + 16) = xmmword_1BFA1A3B0;
      uint64_t v62 = MEMORY[0x1E4FBB1A0];
      *(void *)(v61 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v63 = sub_1BF95AB38();
      uint64_t v64 = v150;
      *(void *)(v61 + 32) = v149;
      *(void *)(v61 + 40) = v64;
      uint64_t v65 = a11[2];
      uint64_t v66 = a11[3];
      *(void *)(v61 + 96) = v62;
      *(void *)(v61 + 104) = v63;
      *(void *)(v61 + 64) = v63;
      *(void *)(v61 + 72) = v65;
      *(void *)(v61 + 80) = v66;
      *(void *)&v153[0] = 0;
      *((void *)&v153[0] + 1) = 0xE000000000000000;
      v152[0] = v25;
      sub_1BF95C108(0, (unint64_t *)&qword_1EBA79650);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1BFA180B8();
      long long v67 = v153[0];
      *(void *)(v61 + 136) = v62;
      *(void *)(v61 + 144) = v63;
      *(_OWORD *)(v61 + 112) = v67;
      uint64_t v69 = v27[14];
      uint64_t v68 = v27[15];
      if (v27[17])
      {
        *(void *)&v153[0] = v27[14];
        *((void *)&v153[0] + 1) = v68;
        swift_bridgeObjectRetain();
        sub_1BFA17BD8();
        sub_1BFA17BD8();
        sub_1BFA17BD8();
        uint64_t v70 = *((void *)&v153[0] + 1);
        uint64_t v69 = *(void *)&v153[0];
      }
      else
      {
        uint64_t v70 = swift_bridgeObjectRetain();
      }
      char v138 = v27;
      *(void *)(v61 + 176) = MEMORY[0x1E4FBB1A0];
      *(void *)(v61 + 184) = v63;
      *(void *)(v61 + 152) = v69;
      *(void *)(v61 + 160) = v70;
      uint64_t v109 = ObjectType;
      sub_1BFA177B8();

      swift_bridgeObjectRelease();
      uint64_t v110 = v21;
      uint64_t v111 = *(void *)(v21 - 8);
      uint64_t v142 = *(void (**)(void, void, void))(v111 + 16);
      uint64_t v112 = v143;
      v142(v143, v147, v110);
      id ObjectType = *(id *)(v111 + 56);
      ((void (*)(char *, void, uint64_t, uint64_t))ObjectType)(v112, 0, 1, v110);
      id v113 = v146;
      uint64_t v114 = swift_getObjectType();
      *(void *)&v153[0] = v113;
      uint64_t v115 = (*(uint64_t (**)(uint64_t))(v144 + 8))(v114);
      Journal.addFailedEntry(error:request:placementIdentifier:contentIdentifier:)((uint64_t)v25, (uint64_t)v112, v149, v150, v115, v116);
      swift_bridgeObjectRelease();
      v117 = *(void (**)(char *, uint64_t))(v148 + 8);
      v117(v112, v22);
      v142(v112, v147, v110);
      ((void (*)(char *, void, uint64_t, uint64_t))ObjectType)(v112, 0, 1, v110);
      memset(v153, 0, sizeof(v153));
      char v154 = 1;
      sub_1BF9F67F0(v145, v112, (uint64_t)v153);
      sub_1BF95F4C4(v25);

      swift_release();
      sub_1BF9890B8((uint64_t)v153);
      return ((uint64_t (*)(char *, uint64_t))v117)(v112, v22);
    }
  }
  return result;
}

uint64_t sub_1BF9F67F0(uint64_t a1, char *a2, uint64_t a3)
{
  void (*v21)(uint64_t *__return_ptr, uint64_t, uint64_t);
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t *v53;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t *v61;
  uint64_t v62;
  void *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  long long v90;
  long long v91;
  long long v92;
  long long v93;
  long long v94;
  long long v95;
  long long v96;
  long long v97;
  long long v98;
  _OWORD v99[9];

  uint64_t v4 = v3;
  uint64_t v71 = a1;
  unint64_t v63 = (void *)*v3;
  uint64_t v64 = a2;
  unint64_t v7 = (void *)v63[12];
  uint64_t v8 = (void *)v63[14];
  uint64_t v9 = v63[16];
  uint64_t v84 = v63[10];
  uint64_t v6 = (void *)v84;
  uint64_t v85 = v7;
  uint64_t v86 = v8;
  uint64_t v87 = v9;
  type metadata accessor for AdRequest();
  uint64_t v10 = sub_1BFA17F48();
  uint64_t v58 = *(void *)(v10 - 8);
  uint64_t v59 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v57 = (char *)&v55 - v11;
  uint64_t v13 = v63[17];
  uint64_t v84 = v63[13];
  uint64_t v12 = v84;
  uint64_t v69 = (uint64_t)v7;
  uint64_t v70 = v6;
  uint64_t v85 = v6;
  uint64_t v86 = v7;
  uint64_t v87 = v13;
  long long v67 = v9;
  uint64_t v68 = (uint64_t)v8;
  uint64_t v88 = v8;
  uint64_t v89 = v9;
  uint64_t v14 = type metadata accessor for BannerAdUpdate();
  uint64_t v65 = *(void *)(v14 - 8);
  uint64_t v66 = v14;
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  uint64_t v73 = (uint64_t *)((char *)&v55 - v16);
  id v72 = *(void *)(v12 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v56 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v55 - v19;
  uint64_t v21 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v13 + 8);
  v21(&v78, v12, v13);
  uint64_t v22 = v79;
  uint64_t v55 = v78;
  swift_bridgeObjectRetain();
  sub_1BF972804((uint64_t)&v78);
  uint64_t v62 = a3;
  sub_1BF9888B8(a3, (uint64_t)&v76);
  uint64_t v23 = (void *)v3[13];
  id v60 = v21;
  uint64_t v61 = (uint64_t *)(v13 + 8);
  v21(&v84, v12, v13);
  uint64_t v24 = v84;
  uint64_t v25 = v85;
  swift_bridgeObjectRetain();
  sub_1BF972804((uint64_t)&v84);
  Journal.createDebugJournal(for:)(v24, v25, v99);
  swift_bridgeObjectRelease();
  uint64_t v84 = v55;
  uint64_t v85 = v22;
  sub_1BF98905C((uint64_t)&v76, (uint64_t)&v86);
  uint64_t v95 = v99[5];
  uint64_t v96 = v99[6];
  uint64_t v97 = v99[7];
  uint64_t v98 = v99[8];
  double v91 = v99[1];
  uint64_t v92 = v99[2];
  uint64_t v93 = v99[3];
  uint64_t v94 = v99[4];
  id v90 = v99[0];
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v13 + 16))(&v84, v12, v13);
  uint64_t v26 = (uint64_t)v56;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v56, v20, v12);
  uint64_t v27 = (uint64_t)v57;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v57, v64, v59);
  swift_retain();
  uint64_t v74 = v12;
  BannerAdUpdate.init(model:request:journal:)(v26, v27, v23, v12, v13, v73);
  if (qword_1EBA79730 != -1) {
    swift_once();
  }
  uint64_t v28 = (void *)qword_1EBA79208;
  sub_1BF99C5F8(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1BFA19640;
  uint64_t v30 = v28;
  uint64_t v64 = v20;
  uint64_t v71 = v13;
  v60(&v78, v74, v13);
  uint64_t v32 = v78;
  uint64_t v31 = v79;
  swift_bridgeObjectRetain();
  sub_1BF972804((uint64_t)&v78);
  unint64_t v33 = MEMORY[0x1E4FBB1A0];
  *(void *)(v29 + 56) = MEMORY[0x1E4FBB1A0];
  uint64_t v34 = sub_1BF95AB38();
  *(void *)(v29 + 64) = v34;
  *(void *)(v29 + 32) = v32;
  *(void *)(v29 + 40) = v31;
  uint64_t v35 = BannerAdState.description.getter();
  *(void *)(v29 + 96) = v33;
  *(void *)(v29 + 104) = v34;
  *(void *)(v29 + 72) = v35;
  *(void *)(v29 + 80) = v36;
  uint64_t v38 = v4[14];
  uint64_t v37 = v4[15];
  if (v4[17])
  {
    uint64_t v76 = v4[14];
    uint64_t v77 = v37;
    swift_bridgeObjectRetain();
    sub_1BFA17BD8();
    sub_1BFA17BD8();
    sub_1BFA17BD8();
    uint64_t v38 = v76;
    uint64_t v39 = v77;
  }
  else
  {
    uint64_t v39 = swift_bridgeObjectRetain();
  }
  *(void *)(v29 + 136) = v33;
  *(void *)(v29 + 144) = v34;
  *(void *)(v29 + 112) = v38;
  *(void *)(v29 + 120) = v39;
  sub_1BFA17E48();
  sub_1BFA177B8();

  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v61 = &v55;
  uint64_t v75 = v4[18];
  MEMORY[0x1F4188790](v75);
  uint64_t v40 = v63;
  uint64_t v62 = v63[11];
  uint64_t v41 = v62;
  unint64_t v43 = v69;
  uint64_t v42 = v70;
  *(&v55 - 8) = (uint64_t)v70;
  *(&v55 - 7) = v41;
  uint64_t v44 = v74;
  *(&v55 - 6) = v43;
  *(&v55 - 5) = v44;
  long long v45 = v44;
  uint64_t v46 = (void *)v40[15];
  unint64_t v63 = v46;
  uint64_t v48 = v67;
  uint64_t v47 = v68;
  *(&v55 - 4) = v68;
  *(&v55 - 3) = (uint64_t)v46;
  id v49 = v71;
  *(&v55 - 2) = v48;
  *(&v55 - 1) = v49;
  swift_bridgeObjectRetain();
  uint64_t v78 = v45;
  uint64_t v79 = v42;
  uint64_t v80 = v43;
  uint64_t v81 = v49;
  id v82 = v47;
  id v83 = v48;
  type metadata accessor for DisposableObserver();
  sub_1BFA17D68();
  swift_getWitnessTable();
  v4[18] = sub_1BFA18018();
  swift_bridgeObjectRelease();
  uint64_t v61 = &v55;
  uint64_t v78 = v4[18];
  MEMORY[0x1F4188790](v78);
  uint64_t v50 = v62;
  *(&v55 - 10) = (uint64_t)v42;
  *(&v55 - 9) = v50;
  uint64_t v51 = v74;
  *(&v55 - 8) = v43;
  *(&v55 - 7) = v51;
  long long v52 = v63;
  *(&v55 - 6) = v47;
  *(&v55 - 5) = (uint64_t)v52;
  *(&v55 - 4) = v48;
  *(&v55 - 3) = v49;
  CFTimeInterval v53 = v73;
  *(&v55 - 2) = (uint64_t)v73;
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_1BFA17C08();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v64, v51);
  sub_1BF972804((uint64_t)&v84);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v65 + 8))(v53, v66);
}

uint64_t BannerAdViewManager.onUpdate(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for DisposableObserver();
  uint64_t v8 = sub_1BF9F7870(a1, a2);
  swift_beginAccess();
  sub_1BFA17D68();
  swift_retain();
  swift_retain();
  sub_1BFA17D48();
  swift_endAccess();
  a3[3] = v6;
  uint64_t result = swift_getWitnessTable();
  a3[4] = result;
  *a3 = v8;
  return result;
}

uint64_t BannerAdViewManager.deinit()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = v1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v15 >= v6) {
      goto LABEL_25;
    }
    unint64_t v16 = *(void *)(v2 + 8 * v15);
    ++v8;
    if (!v16)
    {
      int64_t v8 = v15 + 1;
      if (v15 + 1 >= v6) {
        goto LABEL_25;
      }
      unint64_t v16 = *(void *)(v2 + 8 * v8);
      if (!v16)
      {
        int64_t v8 = v15 + 2;
        if (v15 + 2 >= v6) {
          goto LABEL_25;
        }
        unint64_t v16 = *(void *)(v2 + 8 * v8);
        if (!v16)
        {
          int64_t v8 = v15 + 3;
          if (v15 + 3 >= v6) {
            goto LABEL_25;
          }
          unint64_t v16 = *(void *)(v2 + 8 * v8);
          if (!v16)
          {
            int64_t v8 = v15 + 4;
            if (v15 + 4 >= v6) {
              goto LABEL_25;
            }
            unint64_t v16 = *(void *)(v2 + 8 * v8);
            if (!v16) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v16 - 1) & v16;
    unint64_t v10 = __clz(__rbit64(v16)) + (v8 << 6);
LABEL_5:
    uint64_t v11 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = (void *)v11[1];
    swift_bridgeObjectRetain();
    v14._countAndFlagsBits = v13;
    v14._object = v12;
    Journal.removeEntries(for:)(v14);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v17 = v15 + 5;
  if (v17 >= v6)
  {
LABEL_25:
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 64);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v0;
  }
  unint64_t v16 = *(void *)(v2 + 8 * v17);
  if (v16)
  {
    int64_t v8 = v17;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v8 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_25;
    }
    unint64_t v16 = *(void *)(v2 + 8 * v8);
    ++v17;
    if (v16) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t BannerAdViewManager.__deallocating_deinit()
{
  BannerAdViewManager.deinit();
  return MEMORY[0x1F4186488](v0, 160, 7);
}

uint64_t sub_1BF9F734C()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1BF9F7358()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1BF9F7364()
{
  swift_release();
  sub_1BF9F79D4(v0 + 32);
  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t sub_1BF9F73A4()
{
  return sub_1BF9F734C();
}

uint64_t sub_1BF9F73C8()
{
  return sub_1BF9F7358();
}

uint64_t type metadata accessor for DisposableObserver()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1BF9F7404()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BF9F743C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BF9F7474()
{
  uint64_t v1 = *((void *)v0 + 5);
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v8 = *((void *)v0 + 2);
  uint64_t v9 = *((void *)v0 + 4);
  unint64_t v5 = (int *)(type metadata accessor for AdRequest() - 8);
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(*(void *)v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v5 + 80);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(&v0[v3], v1);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(&v0[v6 + v5[15]], v8);
  type metadata accessor for AdContext();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(&v0[v6 + v5[16]], v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BF9F76A4(void **a1)
{
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)(v1[5] - 8) + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1[5] - 8) + 80);
  uint64_t v4 = *(void *)(*(void *)(v1[5] - 8) + 64);
  uint64_t v5 = *(void *)(type metadata accessor for AdRequest() - 8);
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  return sub_1BF9F5558(a1, *(double *)((char *)v1 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8)), *(double *)((char *)v1 + ((((v8 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(double *)((char *)v1 + ((((v8 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8), v1[10], v1[11], (uint64_t)v1 + v3, (void *)((char *)v1 + v6), *(void *)((char *)v1 + v7), *(void *)((char *)v1 + v7 + 8), *(void **)((char *)v1 + v8));
}

uint64_t sub_1BF9F77FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BF9F7834(uint64_t *a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = *a1;
  return v2(&v4);
}

uint64_t sub_1BF9F7870(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return v4;
}

uint64_t sub_1BF9F78D0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for BannerAdViewManager()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for BannerAdViewManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BannerAdViewManager);
}

uint64_t dispatch thunk of BannerAdViewManager.__allocating_init(adManager:requestStore:layoutStore:journal:host:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t sub_1BF9F7984()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BF9F79D4(uint64_t a1)
{
  return a1;
}

BOOL sub_1BF9F79FC(void *a1)
{
  uint64_t v1 = MEMORY[0x1C18B8B60](*a1 + 32);
  if (v1) {
    swift_unknownObjectRelease();
  }
  return v1 != 0;
}

uint64_t sub_1BF9F7A44(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 80);
  unint64_t v3 = *(void (**)(uint64_t))(*(void *)a1 + 16);
  swift_retain();
  v3(v2);
  return swift_release();
}

uint64_t destroy for AdContextError()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s7NewsAds14AdContextErrorOwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AdContextError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AdContextError(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AdContextError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdContextError(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AdContextError()
{
  return &type metadata for AdContextError;
}

NewsAds::AdStatusCondition __swiftcall AdStatusCondition.withState(_:)(NewsAds::AdStatusCondition::State a1)
{
  char v3 = *(unsigned char *)a1;
  uint64_t v4 = v2[1];
  *(void *)uint64_t v1 = *v2;
  *(void *)(v1 + 8) = v4;
  *(unsigned char *)(v1 + 16) = v3;
  uint64_t v5 = swift_bridgeObjectRetain();
  result.identifier._object = v6;
  result.identifier._countAndFlagsBits = v5;
  result.state = v7;
  return result;
}

uint64_t AdStatusCondition.State.hash(into:)()
{
  return sub_1BFA18308();
}

BOOL static AdStatusCondition.State.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AdStatusCondition.State.hashValue.getter()
{
  return sub_1BFA18318();
}

uint64_t AdStatusCondition.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void AdStatusCondition.state.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

NewsAds::AdStatusCondition __swiftcall AdStatusCondition.init(identifier:state:)(Swift::String identifier, NewsAds::AdStatusCondition::State state)
{
  char v3 = *(unsigned char *)state;
  *(Swift::String *)uint64_t v2 = identifier;
  *(unsigned char *)(v2 + 16) = v3;
  result.identifier = identifier;
  result.state = state;
  return result;
}

uint64_t static AdStatusCondition.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return v2 ^ v3 ^ 1u;
  }
  char v5 = sub_1BFA18258();
  uint64_t result = 0;
  if (v5) {
    return v2 ^ v3 ^ 1u;
  }
  return result;
}

unint64_t sub_1BF9F7DB0()
{
  unint64_t result = qword_1EA17A128;
  if (!qword_1EA17A128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A128);
  }
  return result;
}

uint64_t sub_1BF9F7E04(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return v2 ^ v3 ^ 1u;
  }
  char v5 = sub_1BFA18258();
  uint64_t result = 0;
  if (v5) {
    return v2 ^ v3 ^ 1u;
  }
  return result;
}

uint64_t sub_1BF9F7E68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AdStatusCondition(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for AdStatusCondition(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdStatusCondition(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdStatusCondition(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AdStatusCondition()
{
  return &type metadata for AdStatusCondition;
}

unsigned char *storeEnumTagSinglePayload for AdStatusCondition.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF9F809CLL);
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

ValueMetadata *type metadata accessor for AdStatusCondition.State()
{
  return &type metadata for AdStatusCondition.State;
}

uint64_t dispatch thunk of AdPlacementSizeProviding.boundingSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for InterstitialAdViewLayoutAttributes()
{
  return &type metadata for InterstitialAdViewLayoutAttributes;
}

double sub_1BF9F80F8()
{
  return *(double *)v0;
}

uint64_t sub_1BF9F8100()
{
  return sub_1BFA17888();
}

uint64_t sub_1BF9F8120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  sub_1BF977DB8(a1, (uint64_t)v6);
  swift_bridgeObjectRetain();
  uint64_t result = sub_1BF9EAFB4(v6, a2);
  a3[3] = (uint64_t)&type metadata for PromotedContentContextWrapper;
  a3[4] = (uint64_t)&off_1F1B1A620;
  *a3 = result;
  return result;
}

uint64_t type metadata accessor for PromotedContentContextFactory()
{
  return self;
}

void DebugJournalSummaryViewLayoutOptions.init(boundingSize:screenScale:layoutMargins:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  a1[4] = a6;
  a1[5] = a7;
  a1[6] = a8;
}

uint64_t DebugJournalSummaryViewLayoutOptions.Embedded.init(layoutOptions:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1BFA16CA8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
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

uint64_t getEnumTagSinglePayload for DebugJournalSummaryViewLayoutOptions(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DebugJournalSummaryViewLayoutOptions(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
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
  *(unsigned char *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for DebugJournalSummaryViewLayoutOptions()
{
  return &type metadata for DebugJournalSummaryViewLayoutOptions;
}

uint64_t initializeBufferWithCopyOfBuffer for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BFA16CA8();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1)
{
  uint64_t v2 = sub_1BFA16CA8();
  char v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BFA16CA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BFA16CA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BFA16CA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BFA16CA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BF9F8548);
}

uint64_t sub_1BF9F8548(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BFA16CA8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DebugJournalSummaryViewLayoutOptions.Embedded(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BF9F85C8);
}

uint64_t sub_1BF9F85C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1BFA16CA8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for DebugJournalSummaryViewLayoutOptions.Embedded()
{
  uint64_t result = qword_1EA17A130;
  if (!qword_1EA17A130) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BF9F8684()
{
  uint64_t result = sub_1BFA16CA8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t PrerollAdPlacement.placementIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PrerollAdPlacement.desiredPlacement.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PrerollAdPlacement() + 20);
  uint64_t v4 = sub_1BFA17278();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for PrerollAdPlacement()
{
  uint64_t result = qword_1EBA7A2A0;
  if (!qword_1EBA7A2A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

double PrerollAdPlacement.boundingSize.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for PrerollAdPlacement() + 24));
}

uint64_t PrerollAdPlacement.insertionType.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for PrerollAdPlacement();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t PrerollAdPlacement.init(placementIdentifier:boundingSize:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  unint64_t v10 = (int *)type metadata accessor for PrerollAdPlacement();
  uint64_t v11 = (void *)((char *)a3 + v10[5]);
  *uint64_t v11 = 1;
  uint64_t v12 = *MEMORY[0x1E4F93D78];
  uint64_t v13 = sub_1BFA17278();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(v11, v12, v13);
  *((unsigned char *)a3 + v10[7]) = 0;
  *a3 = a1;
  a3[1] = a2;
  int64_t v15 = (double *)((char *)a3 + v10[6]);
  *int64_t v15 = a4;
  v15[1] = a5;
  return result;
}

uint64_t getEnumTagSinglePayload for PrerollAdPlacement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BF9F8938);
}

uint64_t sub_1BF9F8938(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1BFA17278();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PrerollAdPlacement(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BF9F89FC);
}

uint64_t sub_1BF9F89FC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1BFA17278();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1BF9F8AA4()
{
  uint64_t result = sub_1BFA17278();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id PrerollAd.metricsView.getter()
{
  return *v0;
}

uint64_t PrerollAd.contentIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PrerollAd.placement.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PrerollAd() + 24);
  return sub_1BF9B646C(v3, a1);
}

uint64_t type metadata accessor for PrerollAd()
{
  uint64_t result = qword_1EA17A140;
  if (!qword_1EA17A140) {
    return swift_getSingletonMetadata();
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for PrerollAd(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  unint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    unsigned int v6 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = *(uint64_t *)((char *)a2 + v7 + 8);
    *(void *)uint64_t v8 = *(char **)((char *)a2 + v7);
    *((void *)v8 + 1) = v10;
    uint64_t v11 = (int *)type metadata accessor for PrerollAdPlacement();
    uint64_t v12 = v11[5];
    uint64_t v17 = v9 + v12;
    uint64_t v18 = &v8[v12];
    uint64_t v13 = sub_1BFA17278();
    Swift::String v14 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    int64_t v15 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v18, v17, v13);
    *(_OWORD *)&v8[v11[6]] = *(_OWORD *)(v9 + v11[6]);
    v8[v11[7]] = *(unsigned char *)(v9 + v11[7]);
  }
  return v5;
}

uint64_t destroy for PrerollAd(id *a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  unint64_t v4 = (char *)a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v5 = &v4[*(int *)(type metadata accessor for PrerollAdPlacement() + 20)];
  uint64_t v6 = sub_1BFA17278();
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

void *initializeWithCopy for PrerollAd(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = a2 + v6;
  uint64_t v9 = *(void *)(a2 + v6 + 8);
  *uint64_t v7 = *(void *)(a2 + v6);
  v7[1] = v9;
  uint64_t v10 = (int *)type metadata accessor for PrerollAdPlacement();
  uint64_t v11 = v10[5];
  uint64_t v16 = v8 + v11;
  uint64_t v17 = (char *)v7 + v11;
  uint64_t v12 = sub_1BFA17278();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  id v14 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v17, v16, v12);
  *(_OWORD *)((char *)v7 + v10[6]) = *(_OWORD *)(v8 + v10[6]);
  *((unsigned char *)v7 + v10[7]) = *(unsigned char *)(v8 + v10[7]);
  return a1;
}

uint64_t assignWithCopy for PrerollAd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = a2 + v9;
  *uint64_t v10 = *(void *)(a2 + v9);
  v10[1] = *(void *)(a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = (int *)type metadata accessor for PrerollAdPlacement();
  uint64_t v13 = v12[5];
  id v14 = (char *)v10 + v13;
  uint64_t v15 = v11 + v13;
  uint64_t v16 = sub_1BFA17278();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = v12[6];
  uint64_t v18 = (void *)((char *)v10 + v17);
  uint64_t v19 = (void *)(v11 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  *((unsigned char *)v10 + v12[7]) = *(unsigned char *)(v11 + v12[7]);
  return a1;
}

uint64_t initializeWithTake for PrerollAd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  *(_OWORD *)(a1 + v4) = *(_OWORD *)(a2 + v4);
  uint64_t v7 = (int *)type metadata accessor for PrerollAdPlacement();
  uint64_t v8 = v7[5];
  uint64_t v9 = v5 + v8;
  uint64_t v10 = v6 + v8;
  uint64_t v11 = sub_1BFA17278();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  *(_OWORD *)(v5 + v7[6]) = *(_OWORD *)(v6 + v7[6]);
  *(unsigned char *)(v5 + v7[7]) = *(unsigned char *)(v6 + v7[7]);
  return a1;
}

uint64_t assignWithTake for PrerollAd(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = *(void *)((char *)a2 + v8 + 8);
  *uint64_t v9 = *(void *)((char *)a2 + v8);
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = (int *)type metadata accessor for PrerollAdPlacement();
  uint64_t v13 = v12[5];
  id v14 = (char *)v9 + v13;
  uint64_t v15 = &v10[v13];
  uint64_t v16 = sub_1BFA17278();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  *(_OWORD *)((char *)v9 + v12[6]) = *(_OWORD *)&v10[v12[6]];
  *((unsigned char *)v9 + v12[7]) = v10[v12[7]];
  return a1;
}

uint64_t getEnumTagSinglePayload for PrerollAd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BF9F91B8);
}

uint64_t sub_1BF9F91B8(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for PrerollAdPlacement();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PrerollAd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BF9F927C);
}

void *sub_1BF9F927C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for PrerollAdPlacement();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1BF9F9324()
{
  uint64_t result = type metadata accessor for PrerollAdPlacement();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1BF9F93C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_1BF95BCD0((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *int v3 = 0x8000000000000000;
    sub_1BF9C7F10(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *int v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BF9FC298(a1, &qword_1EBA78840, (unint64_t *)&qword_1EBA78838, (uint64_t)&protocol descriptor for AdContextDataType);
    sub_1BF9FB85C(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_1BF9FC298((uint64_t)v9, &qword_1EBA78840, (unint64_t *)&qword_1EBA78838, (uint64_t)&protocol descriptor for AdContextDataType);
  }
}

uint64_t sub_1BF9F94C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    long long v6 = *(_OWORD *)(a1 + 48);
    v11[2] = *(_OWORD *)(a1 + 32);
    void v11[3] = v6;
    uint64_t v12 = *(void *)(a1 + 64);
    long long v7 = *(_OWORD *)(a1 + 16);
    v11[0] = *(_OWORD *)a1;
    v11[1] = v7;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v3;
    *int v3 = 0x8000000000000000;
    sub_1BF9C8068((uint64_t)v11, a2, a3, isUniquelyReferenced_nonNull_native);
    *int v3 = v10;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BF9FD544(a1, (unint64_t *)&unk_1EBA778D0);
    sub_1BF9FB968(a2, a3, (uint64_t)v11);
    swift_bridgeObjectRelease();
    return sub_1BF9FD544((uint64_t)v11, (unint64_t *)&unk_1EBA778D0);
  }
}

uint64_t sub_1BF9F95C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_1BF992514((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *int v3 = 0x8000000000000000;
    sub_1BF9C8340(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *int v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BF9FD544(a1, (unint64_t *)&unk_1EBA79950);
    sub_1BF9FBA88(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_1BF9FD544((uint64_t)v9, (unint64_t *)&unk_1EBA79950);
  }
}

uint64_t AdManager.__allocating_init(previewQueue:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  AdManager.init(previewQueue:)(a1);
  return v2;
}

uint64_t AdRequest.identifier.getter()
{
  uint64_t v0 = sub_1BF9FC134();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1BF9F9724@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X6>, char *a7@<X8>)
{
  uint64_t v11 = *a5;
  uint64_t v12 = a5[1];
  *(void *)a7 = a1;
  *((void *)a7 + 1) = a2;
  uint64_t v13 = (int *)type metadata accessor for AdRequest();
  id v14 = &a7[v13[13]];
  uint64_t v15 = type metadata accessor for AdContext();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14, a3, v15);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(&a7[v13[14]], a4, a6);
  uint64_t v17 = &a7[v13[15]];
  *(void *)uint64_t v17 = v11;
  *((void *)v17 + 1) = v12;
  return result;
}

uint64_t sub_1BF9F9834()
{
  uint64_t v0 = sub_1BF9FC134();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t AdManager.enabled.getter()
{
  swift_retain();
  sub_1BFA16B48();
  swift_release();
  return v1;
}

void *AdManager.init(previewQueue:)(uint64_t a1)
{
  if (qword_1EBA796A0 != -1) {
    swift_once();
  }
  sub_1BF9FC13C();
  swift_allocObject();
  swift_retain();
  v1[2] = sub_1BFA16B68();
  v1[13] = sub_1BF999800(MEMORY[0x1E4FBC860]);
  sub_1BF9FC19C();
  swift_allocObject();
  v1[14] = sub_1BFA16FB8();
  swift_allocObject();
  v1[15] = sub_1BFA16FB8();
  sub_1BF95BBDC(a1, (uint64_t)(v1 + 3));
  uint64_t v5 = type metadata accessor for PromotedContentContextFactory();
  long long v6 = &off_1F1B1B070;
  *(void *)&long long v4 = swift_allocObject();
  __swift_destroy_boxed_opaque_existential_1(a1);
  sub_1BF95BCD0(&v4, (uint64_t)(v1 + 8));
  return v1;
}

uint64_t AdManager.createRequest<A, B, C>(for:context:placement:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  void (*v20)(uint64_t *__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned char *v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void v66[2];
  uint64_t (*v67)(uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  uint64_t v95 = a3;
  uint64_t v8 = (void *)*a1;
  uint64_t v9 = *(void *)(*a1 + 104);
  id v83 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v84 = (char *)v66 - v10;
  uint64_t v12 = *(void *)(v11 + 88);
  uint64_t v13 = *(void *)(v11 + 112);
  uint64_t v14 = type metadata accessor for AdContext();
  uint64_t v80 = *(void *)(v14 - 8);
  uint64_t v81 = v14;
  MEMORY[0x1F4188790](v14);
  id v82 = (char *)v66 - v15;
  uint64_t v16 = sub_1BFA169D8();
  uint64_t v78 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v77 = (char *)v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = v4;
  swift_retain();
  sub_1BFA16B48();
  swift_release();
  if (v91 == 1)
  {
    uint64_t v70 = v16;
    uint64_t v75 = a4;
    uint64_t v18 = v86[6];
    uint64_t v19 = v86[7];
    __swift_project_boxed_opaque_existential_1(v86 + 3, v18);
    uint64_t v20 = *(void (**)(uint64_t *__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 16);
    uint64_t v21 = v8[12];
    uint64_t v22 = v8[15];
    uint64_t v23 = v8[16];
    uint64_t v74 = v12;
    id v72 = v13;
    v20(&v91, a1, a2, v12, v21, v9, v13, v22, v23, v18, v19);
    uint64_t v71 = v91;
    uint64_t v89 = v91;
    id v90 = v92;
    uint64_t v76 = v92;
    uint64_t v73 = a2;
    uint64_t v24 = v95;
    sub_1BF9FA1B0((uint64_t)a1, a2, v95, &v91);
    uint64_t v25 = v9;
    if (qword_1EBA79730 != -1) {
      swift_once();
    }
    uint64_t v26 = (void *)qword_1EBA79208;
    sub_1BF9FC308(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    v66[1] = v27;
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_1BFA195C0;
    uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8);
    uint64_t v30 = v26;
    uint64_t v68 = v23 + 8;
    long long v67 = v29;
    uint64_t v31 = v29(v25, v23);
    uint64_t v32 = v23;
    uint64_t v34 = v33;
    uint64_t v35 = MEMORY[0x1E4FBB1A0];
    *(void *)(v28 + 56) = MEMORY[0x1E4FBB1A0];
    uint64_t v36 = sub_1BF95AB38();
    uint64_t v85 = v25;
    uint64_t v37 = v36;
    *(void *)(v28 + 32) = v31;
    *(void *)(v28 + 40) = v34;
    uint64_t v38 = a1[2];
    uint64_t v39 = a1[3];
    *(void *)(v28 + 96) = v35;
    *(void *)(v28 + 104) = v36;
    uint64_t v40 = v38;
    *(void *)(v28 + 64) = v36;
    *(void *)(v28 + 72) = v38;
    *(void *)(v28 + 80) = v39;
    swift_bridgeObjectRetain();
    sub_1BFA17E48();
    sub_1BFA177B8();

    swift_bridgeObjectRelease();
    uint64_t v41 = v93;
    uint64_t v42 = v94;
    __swift_project_boxed_opaque_existential_1(&v91, v93);
    unint64_t v43 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 16);
    uint64_t v79 = v32;
    v43(v24, v85, v32, v41, v42);
    uint64_t v44 = v77;
    sub_1BFA169C8();
    long long v45 = sub_1BFA169A8();
    uint64_t v47 = v46;
    (*(void (**)(char *, uint64_t))(v78 + 8))(v44, v70);
    sub_1BF95BBDC((uint64_t)&v91, (uint64_t)&v89);
    uint64_t v87 = v45;
    uint64_t v88 = v47;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_1BFA16FE8();
    swift_release();
    uint64_t v48 = v76;
    uint64_t v69 = v45;
    id v49 = (void *)qword_1EBA79208;
    if (v76)
    {
      uint64_t v50 = swift_allocObject();
      *(_OWORD *)(v50 + 16) = xmmword_1BFA1A3B0;
      swift_bridgeObjectRetain();
      uint64_t v51 = v49;
      long long v52 = v67(v85, v79);
      CFTimeInterval v53 = MEMORY[0x1E4FBB1A0];
      *(void *)(v50 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v50 + 64) = v37;
      *(void *)(v50 + 32) = v52;
      *(void *)(v50 + 40) = v54;
      *(void *)(v50 + 96) = v53;
      *(void *)(v50 + 104) = v37;
      *(void *)(v50 + 72) = v40;
      *(void *)(v50 + 80) = v39;
      *(void *)(v50 + 136) = v53;
      *(void *)(v50 + 144) = v37;
      *(void *)(v50 + 112) = v45;
      *(void *)(v50 + 120) = v47;
      *(void *)(v50 + 176) = v53;
      *(void *)(v50 + 184) = v37;
      uint64_t v55 = v71;
      *(void *)(v50 + 152) = v71;
      *(void *)(v50 + 160) = v48;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1BFA17E48();
      sub_1BFA177B8();
      uint64_t v56 = v73;
    }
    else
    {
      uint64_t v59 = swift_allocObject();
      *(_OWORD *)(v59 + 16) = xmmword_1BFA19640;
      uint64_t v51 = v49;
      id v60 = v67(v85, v79);
      uint64_t v61 = MEMORY[0x1E4FBB1A0];
      *(void *)(v59 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v59 + 64) = v37;
      *(void *)(v59 + 32) = v60;
      *(void *)(v59 + 40) = v62;
      *(void *)(v59 + 96) = v61;
      *(void *)(v59 + 104) = v37;
      *(void *)(v59 + 72) = v40;
      *(void *)(v59 + 80) = v39;
      *(void *)(v59 + 136) = v61;
      *(void *)(v59 + 144) = v37;
      *(void *)(v59 + 112) = v45;
      *(void *)(v59 + 120) = v47;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1BFA17E48();
      sub_1BFA177B8();
      uint64_t v56 = v73;
      uint64_t v55 = v71;
    }

    swift_bridgeObjectRelease();
    unint64_t v63 = (uint64_t)v82;
    (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v82, v56, v81);
    uint64_t v64 = (uint64_t)v84;
    uint64_t v65 = v85;
    (*(void (**)(char *, uint64_t, uint64_t))(v83 + 16))(v84, v95, v85);
    uint64_t v89 = v55;
    id v90 = v76;
    sub_1BF9F9724(v69, v47, v63, v64, &v89, v65, v75);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v91);
  }
  else
  {
    sub_1BF9FC214();
    swift_allocError();
    *uint64_t v57 = 2;
    return swift_willThrow();
  }
}

uint64_t sub_1BF9FA1B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = *(void *)(*(void *)a1 + 104);
  MEMORY[0x1F4188790](a1);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v31 - v9, v14, v8);
  sub_1BF9FD69C();
  if (swift_dynamicCast())
  {
    uint64_t v31 = v12;
    uint64_t v32 = v11;
    uint64_t v33 = a2;
    uint64_t v34 = a4;
    sub_1BF9FD7B0(&v37, &v40);
    uint64_t v16 = v41;
    uint64_t v15 = v42;
    __swift_project_boxed_opaque_existential_1(&v40, v41);
    uint64_t v17 = (uint64_t (*)(uint64_t, _UNKNOWN **))v15[1];
    swift_retain();
    uint64_t v35 = v17(v16, v15);
    uint64_t v36 = v18;
    sub_1BFA16FD8();
    swift_bridgeObjectRelease();
    swift_release();
    if (*((void *)&v38 + 1))
    {
      sub_1BF95BCD0(&v37, (uint64_t)v34);
    }
    else
    {
      sub_1BF9FC298((uint64_t)&v37, &qword_1EBA79948, (unint64_t *)&qword_1EBA79158, (uint64_t)&protocol descriptor for PromotedContentContextWrapperType);
      __swift_project_boxed_opaque_existential_1((void *)(v4 + 64), *(void *)(v4 + 88));
      uint64_t v21 = type metadata accessor for AdContext();
      *((void *)&v38 + 1) = v21;
      *(void *)&long long v39 = &protocol witness table for AdContext<A>;
      *((void *)&v39 + 1) = &protocol witness table for AdContext<A>;
      boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v37);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(boxed_opaque_existential_2, v33, v21);
      uint64_t v35 = v31;
      uint64_t v36 = v32;
      uint64_t v23 = v34;
      sub_1BF9F8120((uint64_t)&v37, a3, v34);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v37);
      uint64_t v24 = v41;
      uint64_t v25 = v42;
      __swift_project_boxed_opaque_existential_1(&v40, v41);
      uint64_t v26 = (uint64_t (*)(uint64_t, _UNKNOWN **))v25[1];
      swift_retain();
      uint64_t v27 = v26(v24, v25);
      uint64_t v29 = v28;
      sub_1BF95BBDC((uint64_t)v23, (uint64_t)&v37);
      uint64_t v35 = v27;
      uint64_t v36 = v29;
      sub_1BFA16FE8();
      swift_release();
    }
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    sub_1BF9FD6FC((uint64_t)&v37);
    __swift_project_boxed_opaque_existential_1((void *)(v4 + 64), *(void *)(v4 + 88));
    uint64_t v19 = type metadata accessor for AdContext();
    uint64_t v41 = v19;
    uint64_t v42 = &protocol witness table for AdContext<A>;
    unint64_t v43 = &protocol witness table for AdContext<A>;
    uint64_t v20 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v40);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v20, a2, v19);
    *(void *)&long long v37 = v12;
    *((void *)&v37 + 1) = v11;
    sub_1BF9F8120((uint64_t)&v40, a3, a4);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v40);
}

uint64_t AdManager.adProvider<A, B, C>(for:request:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v5 = *a1;
  swift_retain();
  sub_1BFA16B48();
  swift_release();
  if (v64 != 1)
  {
    sub_1BF9FC214();
    swift_allocError();
    *uint64_t v11 = 2;
    return swift_willThrow();
  }
  uint64_t v7 = a1[2];
  uint64_t v6 = a1[3];
  swift_beginAccess();
  uint64_t v8 = *(void *)(v2 + 104);
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_1BF9A7240(v7, v6);
    if (v10)
    {
      sub_1BF9911FC(*(void *)(v8 + 56) + 32 * v9, (uint64_t)&v61);
    }
    else
    {
      long long v61 = 0u;
      long long v62 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v61 = 0u;
    long long v62 = 0u;
  }
  swift_endAccess();
  if (!*((void *)&v62 + 1))
  {
    sub_1BF9FD544((uint64_t)&v61, (unint64_t *)&unk_1EBA79950);
LABEL_17:
    uint64_t v28 = v7;
    if (qword_1EBA79730 != -1) {
      swift_once();
    }
    id v29 = (id)qword_1EBA79208;
    sub_1BFA17E38();
    sub_1BF9FC308(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_1BFA195C0;
    uint64_t v31 = *(void *)(v5 + 128);
    uint64_t v64 = *(void *)(v5 + 88);
    long long v65 = *(_OWORD *)(v5 + 104);
    uint64_t v59 = v65;
    *(void *)&long long v66 = v31;
    type metadata accessor for AdRequest();
    uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(v59, v31);
    uint64_t v34 = v33;
    uint64_t v35 = MEMORY[0x1E4FBB1A0];
    *(void *)(v30 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v36 = sub_1BF95AB38();
    *(void *)(v30 + 32) = v32;
    *(void *)(v30 + 40) = v34;
    *(void *)(v30 + 96) = v35;
    *(void *)(v30 + 104) = v36;
    *(void *)(v30 + 64) = v36;
    *(void *)(v30 + 72) = v28;
    *(void *)(v30 + 80) = v6;
    swift_bridgeObjectRetain();
    sub_1BFA177B8();

    swift_bridgeObjectRelease();
    sub_1BF9FC214();
    swift_allocError();
    *long long v37 = 0;
    return swift_willThrow();
  }
  uint64_t v12 = *(void *)(v5 + 96);
  uint64_t v13 = *(void *)(v5 + 104);
  uint64_t v14 = *(void *)(v5 + 128);
  uint64_t v56 = *(void *)(v5 + 88);
  uint64_t v58 = v6;
  uint64_t v64 = v56;
  *(void *)&long long v65 = v12;
  uint64_t v15 = v13;
  *((void *)&v65 + 1) = v13;
  long long v55 = *(_OWORD *)(v5 + 112);
  long long v66 = v55;
  uint64_t v68 = v14;
  uint64_t v67 = v14;
  type metadata accessor for Ad();
  type metadata accessor for AnyFactory();
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v6 = v58;
    goto LABEL_17;
  }
  uint64_t v16 = a2[1];
  uint64_t v53 = *a2;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1BFA16FD8();
  swift_bridgeObjectRelease();
  swift_release();
  if (*((void *)&v62 + 1))
  {
    uint64_t v51 = v16;
    uint64_t v52 = v7;
    sub_1BF95BCD0(&v61, (uint64_t)&v64);
    if (qword_1EBA79730 != -1) {
      swift_once();
    }
    uint64_t v50 = (void *)qword_1EBA79208;
    sub_1BF9FC308(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_1BFA19640;
    *(void *)&long long v61 = v56;
    *((void *)&v61 + 1) = v15;
    uint64_t v18 = v15;
    *(void *)&long long v62 = v55;
    uint64_t v19 = v68;
    *((void *)&v62 + 1) = v68;
    type metadata accessor for AdRequest();
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 8);
    id v57 = v50;
    uint64_t v21 = v20(v18, v19);
    uint64_t v23 = v22;
    uint64_t v24 = MEMORY[0x1E4FBB1A0];
    *(void *)(v17 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v25 = sub_1BF95AB38();
    *(void *)(v17 + 32) = v21;
    *(void *)(v17 + 40) = v23;
    *(void *)(v17 + 96) = v24;
    *(void *)(v17 + 104) = v25;
    *(void *)(v17 + 64) = v25;
    *(void *)(v17 + 72) = v52;
    *(void *)(v17 + 80) = v58;
    *(void *)(v17 + 136) = v24;
    *(void *)(v17 + 144) = v25;
    *(void *)(v17 + 112) = v53;
    *(void *)(v17 + 120) = v51;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BFA17E48();
    sub_1BFA177B8();

    swift_bridgeObjectRelease();
    uint64_t v63 = 0;
    long long v61 = 0u;
    long long v62 = 0u;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1BFA16FE8();
    swift_release();
    uint64_t v26 = *(void (**)(long long *, uint64_t *))(v60 + 16);
    *(void *)&long long v61 = a1;
    swift_retain();
    v26(&v61, &v64);
    swift_release();
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
  }
  else
  {
    uint64_t v38 = v7;
    sub_1BF9FC298((uint64_t)&v61, &qword_1EBA79948, (unint64_t *)&qword_1EBA79158, (uint64_t)&protocol descriptor for PromotedContentContextWrapperType);
    if (qword_1EBA79730 != -1) {
      swift_once();
    }
    id v54 = (id)qword_1EBA79208;
    sub_1BFA17E38();
    sub_1BF9FC308(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v39 = swift_allocObject();
    *(_OWORD *)(v39 + 16) = xmmword_1BFA19640;
    uint64_t v40 = MEMORY[0x1E4FBB1A0];
    *(void *)(v39 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v41 = sub_1BF95AB38();
    *(void *)(v39 + 64) = v41;
    *(void *)(v39 + 32) = v38;
    *(void *)(v39 + 40) = v58;
    uint64_t v64 = v56;
    *(void *)&long long v65 = v15;
    uint64_t v42 = v15;
    *((void *)&v65 + 1) = v55;
    uint64_t v43 = v68;
    *(void *)&long long v66 = v68;
    type metadata accessor for AdRequest();
    uint64_t v44 = *(uint64_t (**)(uint64_t, uint64_t))(v43 + 8);
    swift_bridgeObjectRetain();
    uint64_t v45 = v44(v42, v43);
    *(void *)(v39 + 96) = v40;
    *(void *)(v39 + 104) = v41;
    *(void *)(v39 + 72) = v45;
    *(void *)(v39 + 80) = v46;
    uint64_t v48 = *a2;
    uint64_t v47 = a2[1];
    *(void *)(v39 + 136) = v40;
    *(void *)(v39 + 144) = v41;
    *(void *)(v39 + 112) = v48;
    *(void *)(v39 + 120) = v47;
    swift_bridgeObjectRetain();
    sub_1BFA177B8();

    swift_bridgeObjectRelease();
    sub_1BF9FC214();
    swift_allocError();
    *id v49 = 1;
    swift_willThrow();
    return swift_release();
  }
}

uint64_t AdManager.adProvider<A, B, C>(for:context:placement:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (void *)*a1;
  swift_retain();
  sub_1BFA16B48();
  swift_release();
  if (LOBYTE(v59[0]) != 1)
  {
    char v14 = 2;
LABEL_19:
    sub_1BF9FC214();
    swift_allocError();
    *uint64_t v48 = v14;
    return swift_willThrow();
  }
  uint64_t v54 = a2;
  uint64_t v63 = a3;
  uint64_t v10 = a1[2];
  uint64_t v9 = a1[3];
  swift_beginAccess();
  uint64_t v11 = v3[13];
  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_1BF9A7240(v10, v9);
    if (v13)
    {
      sub_1BF9911FC(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v56);
    }
    else
    {
      long long v56 = 0u;
      long long v57 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
  }
  swift_endAccess();
  if (!*((void *)&v57 + 1))
  {
    sub_1BF9FD544((uint64_t)&v56, (unint64_t *)&unk_1EBA79950);
LABEL_16:
    if (qword_1EBA79730 != -1) {
      swift_once();
    }
    id v41 = (id)qword_1EBA79208;
    sub_1BFA17E38();
    sub_1BF9FC308(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_1BFA195C0;
    uint64_t v43 = (*(uint64_t (**)(void))(v8[16] + 8))(v8[13]);
    uint64_t v45 = v44;
    uint64_t v46 = MEMORY[0x1E4FBB1A0];
    *(void *)(v42 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v47 = sub_1BF95AB38();
    *(void *)(v42 + 32) = v43;
    *(void *)(v42 + 40) = v45;
    *(void *)(v42 + 96) = v46;
    *(void *)(v42 + 104) = v47;
    *(void *)(v42 + 64) = v47;
    *(void *)(v42 + 72) = v10;
    *(void *)(v42 + 80) = v9;
    swift_bridgeObjectRetain();
    sub_1BFA177B8();

    swift_bridgeObjectRelease();
    char v14 = 0;
    goto LABEL_19;
  }
  uint64_t v52 = v10;
  uint64_t v53 = v9;
  uint64_t v15 = v8[11];
  uint64_t v16 = v8[12];
  uint64_t v17 = v8[13];
  uint64_t v18 = v8[14];
  uint64_t v20 = (_UNKNOWN **)v8[15];
  uint64_t v19 = (_UNKNOWN **)v8[16];
  v59[0] = v15;
  v59[1] = v16;
  uint64_t v51 = v17;
  v59[2] = v17;
  uint64_t v60 = v18;
  long long v61 = v20;
  long long v62 = v19;
  type metadata accessor for Ad();
  type metadata accessor for AnyFactory();
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v10 = v52;
    uint64_t v9 = v53;
    goto LABEL_16;
  }
  uint64_t v50 = v55;
  __swift_project_boxed_opaque_existential_1(v4 + 8, v4[11]);
  uint64_t v21 = type metadata accessor for AdContext();
  uint64_t v60 = v21;
  long long v61 = &protocol witness table for AdContext<A>;
  long long v62 = &protocol witness table for AdContext<A>;
  boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2(v59);
  id v49 = v20;
  uint64_t v23 = v19;
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(boxed_opaque_existential_2, v54, v21);
  uint64_t v24 = v4 + 3;
  uint64_t v26 = v4[6];
  uint64_t v25 = v4[7];
  __swift_project_boxed_opaque_existential_1(v24, v26);
  (*(void (**)(uint64_t *__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t))(v25 + 16))(&v55, a1, v54, v15, v16, v51, v18, v49, v19, v26, v25);
  uint64_t v27 = v63;
  sub_1BF9F8120((uint64_t)v59, v63, (uint64_t *)&v56);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
  uint64_t v28 = *((void *)&v57 + 1);
  uint64_t v29 = v58;
  __swift_project_boxed_opaque_existential_1(&v56, *((uint64_t *)&v57 + 1));
  (*(void (**)(uint64_t, uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v29 + 16))(v27, v51, v23, v28, v29);
  if (qword_1EBA79730 != -1) {
    swift_once();
  }
  uint64_t v30 = (void *)qword_1EBA79208;
  sub_1BF9FC308(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_1BFA195C0;
  uint64_t v32 = (uint64_t (*)(uint64_t, _UNKNOWN **))v23[1];
  id v33 = v30;
  uint64_t v34 = v32(v51, v23);
  uint64_t v36 = v35;
  uint64_t v37 = MEMORY[0x1E4FBB1A0];
  *(void *)(v31 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v38 = sub_1BF95AB38();
  *(void *)(v31 + 32) = v34;
  *(void *)(v31 + 40) = v36;
  *(void *)(v31 + 96) = v37;
  *(void *)(v31 + 104) = v38;
  *(void *)(v31 + 64) = v38;
  *(void *)(v31 + 72) = v52;
  *(void *)(v31 + 80) = v53;
  swift_bridgeObjectRetain();
  sub_1BFA17E48();
  sub_1BFA177B8();

  swift_bridgeObjectRelease();
  uint64_t v39 = *(void (**)(uint64_t *, long long *))(v50 + 16);
  v59[0] = (uint64_t)a1;
  swift_retain();
  v39(v59, &v56);
  swift_release();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
}

uint64_t AdManager.register<A, B, C, D>(factory:for:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *a2;
  uint64_t v9 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  if (qword_1EBA79730 != -1) {
    swift_once();
  }
  unint64_t v12 = (void *)qword_1EBA79208;
  sub_1BF9FC308(0, (unint64_t *)&qword_1EBA79640, (unint64_t *)&qword_1EBA79658, MEMORY[0x1E4FBC5A0], MEMORY[0x1E4FBBE00]);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1BFA195D0;
  uint64_t v14 = a2[2];
  uint64_t v15 = a2[3];
  *(void *)(v13 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v13 + 64) = sub_1BF95AB38();
  *(void *)(v13 + 32) = v14;
  *(void *)(v13 + 40) = v15;
  id v16 = v12;
  swift_bridgeObjectRetain();
  sub_1BFA17E48();
  sub_1BFA177B8();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, a3);
  uint64_t v17 = *(void *)(v8 + 88);
  uint64_t v18 = *(void *)(v8 + 96);
  uint64_t v19 = *(void *)(v8 + 104);
  uint64_t v20 = *(void *)(v8 + 128);
  swift_bridgeObjectRetain();
  v25[0] = v17;
  v25[1] = v18;
  v25[2] = v19;
  long long v24 = *(_OWORD *)(v8 + 112);
  long long v26 = v24;
  uint64_t v27 = v20;
  uint64_t v21 = type metadata accessor for Ad();
  uint64_t v22 = sub_1BF9FC4A8((uint64_t)v11, v21, v18, v17, v19, a3, v24, v20, a4);
  *(void *)&long long v26 = type metadata accessor for AnyFactory();
  v25[0] = v22;
  swift_beginAccess();
  sub_1BF9F95C0((uint64_t)v25, v14, v15);
  return swift_endAccess();
}

uint64_t AdManager.deinit()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t AdManager.__deallocating_deinit()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186488](v0, 128, 7);
}

uint64_t sub_1BF9FB5F8()
{
  swift_retain();
  sub_1BFA16B48();
  swift_release();
  return v1;
}

uint64_t sub_1BF9FB640@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  return AdManager.createRequest<A, B, C>(for:context:placement:)(a1, a2, a3, a4);
}

uint64_t sub_1BF9FB664(uint64_t *a1, uint64_t *a2)
{
  return AdManager.adProvider<A, B, C>(for:request:)(a1, a2);
}

uint64_t sub_1BF9FB688(void *a1, uint64_t a2, uint64_t a3)
{
  return AdManager.adProvider<A, B, C>(for:context:placement:)(a1, a2, a3);
}

uint64_t sub_1BF9FB6AC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return AdManager.register<A, B, C, D>(factory:for:)(a1, a2, a6, a9);
}

uint64_t sub_1BF9FB6D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  v19[0] = a2;
  v19[1] = a3;
  MEMORY[0x1F4188790](a1);
  (*(void (**)(char *))(v16 + 16))((char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v20 = a6;
  uint64_t v21 = a5;
  uint64_t v22 = a7;
  uint64_t v23 = a9;
  uint64_t v24 = AssociatedConformanceWitness;
  uint64_t v25 = a10;
  type metadata accessor for Ad();
  swift_dynamicCast();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a11 + 24))(v20, v19[0], a6, a7, a9, a10, a8, a11);
  return swift_release();
}

double sub_1BF9FB85C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1BF9A7240(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1BF9E96F0();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1BF95BCD0((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_1BF9FBB8C(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

double sub_1BF9FB968@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1BF9A7240(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v16 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1BF9E9A78();
      uint64_t v11 = v16;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56) + 72 * v8;
    long long v13 = *(_OWORD *)(v12 + 48);
    *(_OWORD *)(a3 + 32) = *(_OWORD *)(v12 + 32);
    *(_OWORD *)(a3 + 48) = v13;
    *(void *)(a3 + 64) = *(void *)(v12 + 64);
    long long v14 = *(_OWORD *)(v12 + 16);
    *(_OWORD *)a3 = *(_OWORD *)v12;
    *(_OWORD *)(a3 + 16) = v14;
    sub_1BF9FBD78(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 64) = 0;
    double result = 0.0;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

double sub_1BF9FBA88@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1BF9A7240(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1BF9E9E2C();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1BF992514((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_1BF9FBF5C(v8, v11);
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

unint64_t sub_1BF9FBB8C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_1BFA17F88();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1BFA182F8();
        swift_bridgeObjectRetain();
        sub_1BFA17BA8();
        uint64_t v11 = sub_1BFA18318();
        double result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          long long v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *long long v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          uint64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1BF9FBD78(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_1BFA17F88();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1BFA182F8();
        swift_bridgeObjectRetain();
        sub_1BFA17BA8();
        uint64_t v9 = sub_1BFA18318();
        double result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *unint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          double result = v14 + 72 * v3;
          uint64_t v15 = (const void *)(v14 + 72 * v6);
          if (v3 != v6 || (int64_t v3 = v6, result >= (unint64_t)v15 + 72))
          {
            double result = (unint64_t)memmove((void *)result, v15, 0x48uLL);
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *uint64_t v16 = v18 & v17;
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

unint64_t sub_1BF9FBF5C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_1BFA17F88();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1BFA182F8();
        swift_bridgeObjectRetain();
        sub_1BFA17BA8();
        uint64_t v10 = sub_1BFA18318();
        double result = swift_bridgeObjectRelease();
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
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          uint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          uint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *uint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
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

uint64_t sub_1BF9FC134()
{
  return *(void *)v0;
}

void sub_1BF9FC13C()
{
  if (!qword_1EBA77DD0)
  {
    unint64_t v0 = sub_1BFA16B58();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA77DD0);
    }
  }
}

void sub_1BF9FC19C()
{
  if (!qword_1EBA77E00)
  {
    sub_1BF95C108(255, (unint64_t *)&qword_1EBA79158);
    unint64_t v0 = sub_1BFA16FC8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA77E00);
    }
  }
}

unint64_t sub_1BF9FC214()
{
  unint64_t result = qword_1EA17A150;
  if (!qword_1EA17A150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A150);
  }
  return result;
}

uint64_t type metadata accessor for AdRequest()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for AnyFactory()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BF9FC298(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  sub_1BF9FC308(0, a2, a3, a4, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

void sub_1BF9FC308(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_1BF95C108(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t *sub_1BF9FC370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = *v7;
  uint64_t v14 = *(void *)(a4 - 8);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = *(void *)(v13 + 80);
  *((void *)v16 + 3) = *(void *)(v13 + 88);
  *((void *)v16 + 4) = a2;
  *((void *)v16 + 5) = a3;
  *((void *)v16 + 6) = a4;
  *((void *)v16 + 7) = a5;
  *((void *)v16 + 8) = a6;
  *((void *)v16 + 9) = a7;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 32))(&v16[v15], a1, a4);
  v7[2] = (uint64_t)sub_1BF9FD628;
  v7[3] = (uint64_t)v16;
  return v7;
}

uint64_t *sub_1BF9FC4A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1BF9FC370(a1, a4, a5, a6, a7, a8, a9);
}

uint64_t dispatch thunk of AdRequestType.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1BF9FC548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 48);
}

uint64_t sub_1BF9FC550()
{
  uint64_t result = type metadata accessor for AdContext();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1BF9FC638(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v4 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v7 & 0xF8 | 7;
  uint64_t v9 = *(void *)(v6 + 64) + 7;
  unint64_t v10 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v11 = *(void *)(v5 - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80);
  uint64_t v13 = v10 + v12;
  uint64_t v14 = *(void *)(v11 + 64) + 7;
  unint64_t v15 = ((v14 + ((v10 + v12 + (((v7 & 0xF8) + 23) & ~v8)) & ~v12)) & 0xFFFFFFFFFFFFFFF8) + 16;
  int v16 = (*(_DWORD *)(v11 + 80) | v7) & 0x100000;
  if ((v12 | v8) != 7 || v16 != 0 || v15 > 0x18)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + (((v12 | v8) + 16) & ~(v12 | v8)));
    swift_retain();
  }
  else
  {
    uint64_t v20 = ~v12;
    uint64_t v31 = v4;
    uint64_t v32 = v5;
    uint64_t v21 = a2[1];
    *a1 = *a2;
    a1[1] = v21;
    uint64_t v22 = ((unint64_t)a1 + v8 + 16) & ~v8;
    uint64_t v23 = ((unint64_t)a2 + v8 + 16) & ~v8;
    uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_bridgeObjectRetain();
    v24(v22, v23, v31);
    *(void *)((v9 + v22) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v9 + v23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v25 = (v22 + v13) & v20;
    uint64_t v26 = (v23 + v13) & v20;
    uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    swift_bridgeObjectRetain();
    v27(v25, v26, v32);
    uint64_t v28 = (void *)((v14 + v25) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v29 = (void *)((v14 + v26) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v28 = *v29;
    v28[1] = v29[1];
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1BF9FC844(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = v4 + 8;
  uint64_t v6 = *(_DWORD *)(v4 + 80) & 0xF8 | 7;
  uint64_t v7 = (a1 + v6 + 16) & ~v6;
  (*(void (**)(uint64_t))(v4 + 8))(v7);
  uint64_t v8 = *(void *)(v5 + 56) + 7;
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 24) - 8) + 8))((v7
                                                                                            + (v8 & 0xFFFFFFFFFFFFFFF8)
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80)
                                                                                            + 8) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80));
  return swift_bridgeObjectRelease();
}

void *sub_1BF9FC944(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  uint64_t v8 = *(void *)(v6 - 8) + 16;
  uint64_t v9 = *(_DWORD *)(*(void *)(v6 - 8) + 80) & 0xF8;
  uint64_t v10 = v9 + 23;
  unint64_t v11 = (unint64_t)a1 + v9 + 23;
  unint64_t v12 = ~v9 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = v11 & v12;
  unint64_t v14 = ((unint64_t)a2 + v10) & v12;
  swift_bridgeObjectRetain();
  v7(v13, v14, v6);
  uint64_t v15 = *(void *)(v8 + 48) + 7;
  *(void *)((v15 + v13) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v15 + v14) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = *(void *)(a3 + 24);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void (**)(unint64_t, unint64_t, uint64_t))(v17 + 16);
  uint64_t v19 = v17 + 16;
  uint64_t v20 = *(unsigned __int8 *)(v17 + 80);
  unint64_t v21 = (v15 & 0xFFFFFFFFFFFFFFF8) + v20 + 8;
  unint64_t v22 = (v21 + v13) & ~v20;
  unint64_t v23 = (v21 + v14) & ~v20;
  swift_bridgeObjectRetain();
  v18(v22, v23, v16);
  uint64_t v24 = *(void *)(v19 + 48) + 7;
  uint64_t v25 = (void *)((v24 + v22) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v26 = (void *)((v24 + v23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1BF9FCA94(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(_DWORD *)(v6 + 80) & 0xF8;
  uint64_t v9 = v8 + 23;
  unint64_t v10 = (unint64_t)a1 + v8 + 23;
  unint64_t v11 = ~v8 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v12 = v10 & v11;
  unint64_t v13 = ((unint64_t)a2 + v9) & v11;
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(v10 & v11, v13);
  uint64_t v14 = *(void *)(v7 + 40) + 7;
  *(void *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v16 = v15 + 24;
  uint64_t v17 = *(unsigned __int8 *)(v15 + 80);
  unint64_t v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + v17 + 8;
  unint64_t v19 = (v18 + v12) & ~v17;
  unint64_t v20 = (v18 + v13) & ~v17;
  (*(void (**)(unint64_t, unint64_t))(v15 + 24))(v19, v20);
  uint64_t v21 = *(void *)(v16 + 40) + 7;
  unint64_t v22 = (void *)((v21 + v19) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v23 = (void *)((v21 + v20) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1BF9FCC04(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = v5 + 32;
  uint64_t v7 = *(_DWORD *)(v5 + 80) & 0xF8;
  uint64_t v8 = v7 + 23;
  unint64_t v9 = (unint64_t)a1 + v7 + 23;
  unint64_t v10 = ~v7 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = v9 & v10;
  unint64_t v12 = ((unint64_t)a2 + v8) & v10;
  (*(void (**)(unint64_t, unint64_t))(v5 + 32))(v9 & v10, v12);
  uint64_t v13 = *(void *)(v6 + 32) + 7;
  *(void *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v15 = v14 + 32;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  unint64_t v17 = (v13 & 0xFFFFFFFFFFFFFFF8) + v16 + 8;
  unint64_t v18 = (v17 + v11) & ~v16;
  unint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(unint64_t, unint64_t))(v14 + 32))(v18, v19);
  *(_OWORD *)((*(void *)(v15 + 32) + 7 + v18) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v15 + 32)
                                                                                       + 7
                                                                                       + v19) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_1BF9FCD30(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(_DWORD *)(v7 + 80) & 0xF8;
  uint64_t v10 = v9 + 23;
  unint64_t v11 = (unint64_t)a1 + v9 + 23;
  unint64_t v12 = ~v9 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = v11 & v12;
  unint64_t v14 = ((unint64_t)a2 + v10) & v12;
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(v11 & v12, v14);
  uint64_t v15 = *(void *)(v8 + 24) + 7;
  *(void *)((v15 + v13) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v15 + v14) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  unint64_t v16 = v15 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v18 = v17 + 40;
  uint64_t v19 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = v16 + v19 + 8;
  uint64_t v21 = (v20 + v13) & ~v19;
  uint64_t v22 = (v20 + v14) & ~v19;
  (*(void (**)(uint64_t, uint64_t))(v17 + 40))(v21, v22);
  uint64_t v23 = *(void *)(v18 + 24) + 7;
  uint64_t v24 = (void *)((v23 + v21) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v25 = (void *)((v23 + v22) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BF9FCE80(int *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(_DWORD *)(v3 + 84) <= 0x7FFFFFFFu) {
    unsigned int v4 = 0x7FFFFFFF;
  }
  else {
    unsigned int v4 = *(_DWORD *)(v3 + 84);
  }
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  if (v7 <= v4) {
    unsigned int v9 = v4;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v6 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v10 = *(_DWORD *)(v3 + 80) & 0xF8;
  uint64_t v11 = v10 | 7;
  unint64_t v12 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + v8 + 8;
  if (v9 < a2)
  {
    unint64_t v13 = ((*(void *)(*(void *)(v5 - 8) + 64) + ((v12 + ((v10 + 23) & ~v11)) & ~v8) + 7) & 0xFFFFFFFFFFFFFFF8)
        + 16;
    if ((v13 & 0xFFFFFFF8) != 0) {
      unsigned int v14 = 2;
    }
    else {
      unsigned int v14 = a2 - v9 + 1;
    }
    if (v14 >= 0x10000) {
      unsigned int v15 = 4;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v14 < 0x100) {
      unsigned int v15 = 1;
    }
    if (v14 >= 2) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    switch(v16)
    {
      case 1:
        int v17 = *((unsigned __int8 *)a1 + v13);
        if (!*((unsigned char *)a1 + v13)) {
          break;
        }
        goto LABEL_25;
      case 2:
        int v17 = *(unsigned __int16 *)((char *)a1 + v13);
        if (*(_WORD *)((char *)a1 + v13)) {
          goto LABEL_25;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1BF9FD090);
      case 4:
        int v17 = *(int *)((char *)a1 + v13);
        if (!v17) {
          break;
        }
LABEL_25:
        int v19 = v17 - 1;
        if ((v13 & 0xFFFFFFF8) != 0)
        {
          int v19 = 0;
          int v20 = *a1;
        }
        else
        {
          int v20 = 0;
        }
        return v9 + (v20 | v19) + 1;
      default:
        break;
    }
  }
  if (v9 == 0x7FFFFFFF)
  {
    unint64_t v21 = *((void *)a1 + 1);
    if (v21 >= 0xFFFFFFFF) {
      LODWORD(v21) = -1;
    }
    return (v21 + 1);
  }
  else
  {
    uint64_t v22 = ((unint64_t)a1 + v11 + 16) & ~v11;
    if (v4 >= v7) {
      return (*(uint64_t (**)(uint64_t))(v3 + 48))(v22);
    }
    else {
      return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))((v12 + v22) & ~v8, v7, v5);
    }
  }
}

void sub_1BF9FD0A4(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(*(void *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v5 + 84);
  }
  uint64_t v7 = *(void *)(a4 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  int v10 = *(_DWORD *)(v5 + 80);
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  if (v9 <= v6) {
    unsigned int v12 = v6;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v13 = v10 & 0xF8 | 7;
  size_t v14 = ((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  size_t v15 = ((*(void *)(*(void *)(v7 - 8) + 64)
        + ((v14 + v11 + (((v10 & 0xF8) + 23) & ~v13)) & ~v11)
        + 7) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v12 >= a3)
  {
    int v18 = 0;
    int v19 = a2 - v12;
    if (a2 <= v12)
    {
LABEL_20:
      switch(v18)
      {
        case 1:
          a1[v15] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_33;
        case 2:
          *(_WORD *)&a1[v15] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_33;
        case 3:
          goto LABEL_52;
        case 4:
          *(_DWORD *)&a1[v15] = 0;
          goto LABEL_32;
        default:
LABEL_32:
          if (a2)
          {
LABEL_33:
            if (v12 == 0x7FFFFFFF)
            {
              if ((a2 & 0x80000000) != 0)
              {
                *(void *)a1 = a2 ^ 0x80000000;
                *((void *)a1 + 1) = 0;
              }
              else
              {
                *((void *)a1 + 1) = a2 - 1;
              }
            }
            else
            {
              uint64_t v22 = (_DWORD *)((unint64_t)&a1[v13 + 16] & ~v13);
              if (v6 >= v9)
              {
                if (v6 >= a2)
                {
                  uint64_t v26 = *(void (**)(_DWORD *))(v5 + 56);
                  v26(v22);
                }
                else if (v14)
                {
                  int v25 = ~v6 + a2;
                  bzero(v22, v14);
                  *uint64_t v22 = v25;
                }
              }
              else
              {
                unint64_t v23 = ((unint64_t)v22 + v14 + v11) & ~v11;
                uint64_t v24 = *(void (**)(unint64_t))(v8 + 56);
                v24(v23);
              }
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    if (((*(_DWORD *)(*(void *)(v7 - 8) + 64)
         + ((v14 + v11 + (((*(_DWORD *)(v5 + 80) & 0xF8) + 23) & ~v13)) & ~v11)
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      unsigned int v16 = a3 - v12 + 1;
    else {
      unsigned int v16 = 2;
    }
    if (v16 >= 0x10000) {
      int v17 = 4;
    }
    else {
      int v17 = 2;
    }
    if (v16 < 0x100) {
      int v17 = 1;
    }
    if (v16 >= 2) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
    int v19 = a2 - v12;
    if (a2 <= v12) {
      goto LABEL_20;
    }
  }
  if (((*(_DWORD *)(*(void *)(v7 - 8) + 64)
       + ((v14 + v11 + (((*(_DWORD *)(v5 + 80) & 0xF8) + 23) & ~v13)) & ~v11)
       + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
    int v20 = v19;
  else {
    int v20 = 1;
  }
  if (((*(_DWORD *)(*(void *)(v7 - 8) + 64)
       + ((v14 + v11 + (((*(_DWORD *)(v5 + 80) & 0xF8) + 23) & ~v13)) & ~v11)
       + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v21 = ~v12 + a2;
    bzero(a1, v15);
    *(_DWORD *)a1 = v21;
  }
  switch(v18)
  {
    case 1:
      a1[v15] = v20;
      break;
    case 2:
      *(_WORD *)&a1[v15] = v20;
      break;
    case 3:
LABEL_52:
      __break(1u);
      JUMPOUT(0x1BF9FD394);
    case 4:
      *(_DWORD *)&a1[v15] = v20;
      break;
    default:
      return;
  }
}

uint64_t dispatch thunk of AdManagerType.enabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AdManagerType.createRequest<A, B, C>(for:context:placement:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a11 + 16))(a1, a2, a3);
}

uint64_t dispatch thunk of AdManagerType.adProvider<A, B, C>(for:request:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 24))(a1, a2);
}

uint64_t dispatch thunk of AdManagerType.adProvider<A, B, C>(for:context:placement:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a11 + 32))(a1, a2, a3);
}

uint64_t dispatch thunk of AdManagerType.register<A, B, C, D>(factory:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (*(uint64_t (**)(void))(a11 + 40))();
}

uint64_t type metadata accessor for AdManager()
{
  return self;
}

uint64_t method lookup function for AdManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AdManager);
}

uint64_t dispatch thunk of AdManager.__allocating_init(previewQueue:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1BF9FD4FC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BF9FD544(uint64_t a1, unint64_t *a2)
{
  sub_1BF973014(0, a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BF9FD5A0()
{
  (*(void (**)(unint64_t))(*(void *)(*(void *)(v0 + 48) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 48) - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 48) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_1BF9FD628(uint64_t a1, uint64_t a2)
{
  return sub_1BF9FB6D8(a1, a2, (uint64_t)v2+ ((*(unsigned __int8 *)(*(void *)(v2[6] - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2[6] - 8) + 80)), v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8], v2[9]);
}

unint64_t sub_1BF9FD69C()
{
  unint64_t result = qword_1EBA77C58;
  if (!qword_1EBA77C58)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA77C58);
  }
  return result;
}

uint64_t sub_1BF9FD6FC(uint64_t a1)
{
  sub_1BF9FD758();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BF9FD758()
{
  if (!qword_1EBA77C60)
  {
    sub_1BF9FD69C();
    unint64_t v0 = sub_1BFA17F48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA77C60);
    }
  }
}

_OWORD *sub_1BF9FD7B0(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t dispatch thunk of AdContextType.init(provider:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t sub_1BF9FD7F0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  sub_1BF9A4418();
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  size_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  int v17 = (char *)&v32 - v16;
  char v18 = *a3;
  if (a2)
  {
    objc_msgSend(a2, sel_time);
    *(void *)a6 = v19;
    *(unsigned char *)(a6 + 8) = 0;
    objc_msgSend(a2, sel_duration);
  }
  else
  {
    *(void *)a6 = 0;
    *(unsigned char *)(a6 + 8) = 1;
    uint64_t v20 = 0;
  }
  *(void *)(a6 + 16) = v20;
  int v21 = (void *)(a1 + *(int *)(type metadata accessor for PrerollAd() + 24));
  uint64_t v22 = v21[1];
  *(void *)(a6 + 24) = *v21;
  *(void *)(a6 + 32) = v22;
  uint64_t v23 = *(void *)(a1 + 16);
  *(void *)(a6 + 40) = *(void *)(a1 + 8);
  *(void *)(a6 + 48) = v23;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v24 = objc_msgSend(a2, sel_videoURL);
    if (v24)
    {
      int v25 = v24;
      sub_1BFA16908();

      swift_unknownObjectRelease();
      sub_1BF9FE9E0(a1);
      uint64_t v26 = sub_1BFA16918();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v15, 0, 1, v26);
    }
    else
    {
      swift_unknownObjectRelease();
      sub_1BF9FE9E0(a1);
      uint64_t v28 = sub_1BFA16918();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v15, 1, 1, v28);
    }
    sub_1BF9FEA3C((uint64_t)v15, (uint64_t)v17);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BF9FE9E0(a1);
    uint64_t v27 = sub_1BFA16918();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v17, 1, 1, v27);
  }
  uint64_t v29 = (int *)type metadata accessor for VideoAdPlaybackState();
  uint64_t result = sub_1BF9FEA3C((uint64_t)v17, a6 + v29[8]);
  uint64_t v31 = a6 + v29[9];
  *(void *)uint64_t v31 = a4;
  *(unsigned char *)(v31 + 8) = a5 & 1;
  *(unsigned char *)(a6 + v29[10]) = v18;
  return result;
}

BOOL static VideoAdPlaybackState.LoadState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t VideoAdPlaybackState.LoadState.hash(into:)()
{
  return sub_1BFA18308();
}

uint64_t VideoAdPlaybackState.LoadState.hashValue.getter()
{
  return sub_1BFA18318();
}

uint64_t VideoAdPlaybackState.position.getter()
{
  return *(void *)v0;
}

double VideoAdPlaybackState.duration.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t VideoAdPlaybackState.placementIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t VideoAdPlaybackState.contentIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t VideoAdPlaybackState.videoURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for VideoAdPlaybackState() + 32);
  return sub_1BF9FDC0C(v3, a1);
}

uint64_t type metadata accessor for VideoAdPlaybackState()
{
  uint64_t result = qword_1EA17A160;
  if (!qword_1EA17A160) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1BF9FDC0C(uint64_t a1, uint64_t a2)
{
  sub_1BF9A4418();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t VideoAdPlaybackState.loadTime.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for VideoAdPlaybackState() + 36));
}

uint64_t VideoAdPlaybackState.loadState.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for VideoAdPlaybackState();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 40));
  return result;
}

unint64_t sub_1BF9FDCD4()
{
  unint64_t result = qword_1EA17A158;
  if (!qword_1EA17A158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A158);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for VideoAdPlaybackState(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    uint64_t v7 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v7;
    uint64_t v8 = a3[8];
    __dst = (void *)(a1 + v8);
    unsigned int v9 = (char *)a2 + v8;
    *(void *)(a1 + 48) = a2[6];
    uint64_t v10 = sub_1BFA16918();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      sub_1BF9A4418();
      memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
    }
    uint64_t v15 = a3[9];
    uint64_t v16 = a3[10];
    int v17 = (char *)v4 + v15;
    uint64_t v18 = (uint64_t)a2 + v15;
    *(void *)int v17 = *(void *)v18;
    v17[8] = *(unsigned char *)(v18 + 8);
    *((unsigned char *)v4 + v16) = *((unsigned char *)a2 + v16);
  }
  return v4;
}

uint64_t destroy for VideoAdPlaybackState(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_1BFA16918();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for VideoAdPlaybackState(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = a3[8];
  __dst = (void *)(a1 + v7);
  uint64_t v8 = (const void *)(a2 + v7);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v9 = sub_1BFA16918();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    sub_1BF9A4418();
    memcpy(__dst, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(__dst, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(__dst, 0, 1, v9);
  }
  uint64_t v13 = a3[9];
  uint64_t v14 = a3[10];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  return a1;
}

uint64_t assignWithCopy for VideoAdPlaybackState(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[8];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1BFA16918();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_1BF9A4418();
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (uint64_t *)((char *)a2 + v16);
  uint64_t v19 = *v18;
  *(unsigned char *)(v17 + 8) = *((unsigned char *)v18 + 8);
  *(void *)uint64_t v17 = v19;
  *(unsigned char *)(a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  return a1;
}

uint64_t initializeWithTake for VideoAdPlaybackState(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = a3[8];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_1BFA16918();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    sub_1BF9A4418();
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[9];
  uint64_t v13 = a3[10];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  return a1;
}

uint64_t assignWithTake for VideoAdPlaybackState(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[8];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_1BFA16918();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    sub_1BF9A4418();
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  *(unsigned char *)(a1 + v18) = *(unsigned char *)(a2 + v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoAdPlaybackState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1BF9FE6B4);
}

uint64_t sub_1BF9FE6B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    sub_1BF9A4418();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for VideoAdPlaybackState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1BF9FE778);
}

uint64_t sub_1BF9FE778(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 32) = (a2 - 1);
  }
  else
  {
    sub_1BF9A4418();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1BF9FE820()
{
  sub_1BF9A4418();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for VideoAdPlaybackState.LoadState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BF9FE9A8);
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

ValueMetadata *type metadata accessor for VideoAdPlaybackState.LoadState()
{
  return &type metadata for VideoAdPlaybackState.LoadState;
}

uint64_t sub_1BF9FE9E0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PrerollAd();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BF9FEA3C(uint64_t a1, uint64_t a2)
{
  sub_1BF9A4418();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1BF9FEAAC(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1BFA176F8();
  return sub_1BF9FEB04;
}

uint64_t (*sub_1BF9FEB10(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1BFA17738();
  return sub_1BF9FEB04;
}

void sub_1BF9FEB68(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t dispatch thunk of MetricsViewType.privacyMarkerView.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of MetricsViewType.readyDelegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of MetricsViewType.readyDelegate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of MetricsViewType.readyDelegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of MetricsViewType.interactionPresentationDelegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of MetricsViewType.interactionPresentationDelegate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of MetricsViewType.interactionPresentationDelegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t sub_1BF9FEC3C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t type metadata accessor for InterstitialAdViewLayoutAttributesFactory()
{
  return self;
}

uint64_t AdPolicyEnvironments.layout.getter@<X0>(void *a1@<X8>)
{
  *a1 = *v1;
  return swift_bridgeObjectRetain();
}

__n128 AdPolicyEnvironments.viewport.getter@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(v1 + 56);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 48) = v3;
  long long v4 = *(_OWORD *)(v1 + 88);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 72);
  *(_OWORD *)(a1 + 80) = v4;
  __n128 result = *(__n128 *)(v1 + 104);
  *(__n128 *)(a1 + 96) = result;
  return result;
}

void __swiftcall AdPolicyEnvironments.init(layout:viewport:)(NewsAds::AdPolicyEnvironments *__return_ptr retstr, NewsAds::AdPolicyLayoutEnvironment layout, NewsAds::AdPolicyViewportEnvironment *viewport)
{
  CGPoint contentOffset = viewport->contentOffset;
  retstr->viewport.viewportSize = viewport->viewportSize;
  retstr->viewport.CGPoint contentOffset = contentOffset;
  CGSize size = viewport->bounds.size;
  retstr->viewport.bounds.origin = viewport->bounds.origin;
  retstr->viewport.bounds.CGSize size = size;
  long long v5 = *(_OWORD *)&viewport->adjustedContentInset.top;
  retstr->viewport.contentSize = viewport->contentSize;
  retstr->layout.content._rawValue = *(void **)layout.content._rawValue;
  *(_OWORD *)&retstr->viewport.adjustedContentInset.top = v5;
  *(_OWORD *)&retstr->viewport.adjustedContentInset.bottom = *(_OWORD *)&viewport->adjustedContentInset.bottom;
}

uint64_t destroy for AdPolicyEnvironments()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AdPolicyEnvironments(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AdPolicyEnvironments(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for AdPolicyEnvironments(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdPolicyEnvironments(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdPolicyEnvironments(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AdPolicyEnvironments()
{
  return &type metadata for AdPolicyEnvironments;
}

uint64_t sub_1BF9FEF8C()
{
  if (*(void *)(v0 + 56))
  {
    uint64_t v1 = *(void *)(v0 + 56);
  }
  else
  {
    sub_1BF95BBDC(v0 + 16, (uint64_t)v3);
    type metadata accessor for DebugNativeAdProvider();
    uint64_t v1 = swift_allocObject();
    if (qword_1EBA79E78 != -1) {
      swift_once();
    }
    sub_1BF9FFD2C(0, (unint64_t *)&qword_1EBA79F38);
    swift_allocObject();
    swift_retain();
    *(void *)(v1 + 16) = sub_1BFA16B68();
    sub_1BF9FFD2C(0, &qword_1EA17A170);
    swift_allocObject();
    swift_retain();
    *(void *)(v1 + 24) = sub_1BFA16B68();
    sub_1BF95BCD0(v3, v1 + 32);
    *(void *)(v0 + 56) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t NativeAdProvider.fetchNativeAdInfo(request:journal:)(uint64_t a1, uint64_t a2)
{
  sub_1BF973B60();
  if (qword_1EBA79E78 != -1) {
    swift_once();
  }
  if (sub_1BFA16AE8())
  {
    sub_1BF9FEF8C();
    uint64_t v4 = sub_1BF9732BC(a1, a2);
  }
  else
  {
    swift_allocObject();
    uint64_t v5 = swift_weakInit();
    MEMORY[0x1F4188790](v5);
    sub_1BFA0014C(0, &qword_1EBA77E20, type metadata accessor for NativeAdInfo, MEMORY[0x1E4FAB088]);
    swift_allocObject();
    uint64_t v4 = sub_1BFA170D8();
  }
  swift_release();
  return v4;
}

uint64_t sub_1BF9FF298()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_1BF9FF2D0(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v44 = a1;
  uint64_t v45 = a6;
  sub_1BF973B60();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = (void *)swift_weakLoadStrong();
  if (Strong)
  {
    id v41 = a3;
    uint64_t v42 = a2;
    uint64_t v43 = a8;
    uint64_t v19 = a4;
    uint64_t v20 = Strong[5];
    uint64_t v21 = Strong[6];
    __swift_project_boxed_opaque_existential_1(Strong + 2, v20);
    uint64_t v22 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v20, v21);
    id v23 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v23, sel_bounds);
    double v25 = v24;
    double v27 = v26;

    uint64_t v28 = swift_allocObject();
    swift_weakInit();
    sub_1BF9FFD78(a9, (uint64_t)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v29 = (*(unsigned __int8 *)(v15 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    uint64_t v30 = (void *)swift_allocObject();
    uint64_t v31 = v41;
    uint64_t v32 = v42;
    v30[2] = v28;
    v30[3] = v31;
    uint64_t v33 = v45;
    _OWORD v30[4] = v19;
    v30[5] = v33;
    uint64_t v34 = v44;
    v30[6] = a7;
    v30[7] = v34;
    uint64_t v35 = (uint64_t)v30 + v29;
    uint64_t v36 = v43;
    v30[8] = v32;
    v30[9] = v36;
    sub_1BFA00068((uint64_t)v17, v35);
    aBlock[4] = sub_1BFA000CC;
    aBlock[5] = v30;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BF97D17C;
    aBlock[3] = &block_descriptor_9;
    uint64_t v37 = _Block_copy(aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v22, sel_nativePromotedContentWithSize_contentFetched_, v37, v25, v27);
    _Block_release(v37);
    swift_release();
  }
  else
  {
    uint64_t v38 = sub_1BFA16DC8();
    sub_1BF95BCE8();
    uint64_t v39 = (void *)swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v38 - 8) + 104))(v40, *MEMORY[0x1E4FAA9A0], v38);
    a3(v39);
  }
}

void sub_1BF9FF60C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  sub_1BF9FF2D0(a1, a2, a3, a4, v4[2], v4[3], v4[4], v4[5], v4[6]);
}

void sub_1BF9FF63C(void *a1, uint64_t a2, void (*a3)(void *), uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void *), uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v94 = a5;
  uint64_t v15 = type metadata accessor for NativeAdInfo(0);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (uint64_t *)((char *)&v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v19 = (void *)Strong;
    uint64_t v90 = a9;
    uint64_t v20 = sub_1BFA17168();
    uint64_t v92 = a8;
    uint64_t v93 = a7;
    uint64_t v91 = v15;
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      uint64_t v89 = a10;
      if (qword_1EBA79730 != -1) {
        swift_once();
      }
      uint64_t v22 = (void *)qword_1EBA79208;
      sub_1BFA0014C(0, (unint64_t *)&qword_1EBA79640, (uint64_t (*)(uint64_t))sub_1BF95AAE0, MEMORY[0x1E4FBBE00]);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_1BFA195C0;
      id v24 = v22;
      uint64_t v25 = sub_1BFA17178();
      uint64_t v27 = v26;
      uint64_t v28 = MEMORY[0x1E4FBB1A0];
      *(void *)(v23 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v29 = sub_1BF95AB38();
      *(void *)(v23 + 32) = v25;
      *(void *)(v23 + 40) = v27;
      *(void *)(v23 + 96) = v28;
      *(void *)(v23 + 104) = v29;
      uint64_t v30 = v94;
      *(void *)(v23 + 64) = v29;
      *(void *)(v23 + 72) = v30;
      *(void *)(v23 + 80) = a6;
      swift_bridgeObjectRetain();
      sub_1BFA17E48();
      sub_1BFA177B8();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_1BFA172B8();
      uint64_t v87 = v32;
      uint64_t v88 = v31;
      uint64_t v33 = sub_1BFA172A8();
      uint64_t v85 = v34;
      uint64_t v86 = v33;
      uint64_t v35 = sub_1BFA17288();
      uint64_t v83 = v36;
      uint64_t v84 = v35;
      uint64_t v82 = sub_1BFA17298();
      uint64_t v81 = v37;
      id v38 = v21;
      uint64_t v39 = sub_1BFA17138();
      uint64_t v41 = v40;

      uint64_t v96 = &type metadata for NativeAdContentInfo;
      uint64_t v97 = &protocol witness table for NativeAdContentInfo;
      uint64_t v42 = (void *)swift_allocObject();
      *(void *)&long long v95 = v42;
      id v43 = a1;
      uint64_t v44 = sub_1BFA17178();
      uint64_t v46 = v45;
      uint64_t v47 = sub_1BFA171A8();
      v42[2] = v44;
      v42[3] = v46;
      v42[4] = v47;
      void v42[5] = v43;
      uint64_t v48 = v19[5];
      uint64_t v49 = v19[6];
      __swift_project_boxed_opaque_existential_1(v19 + 2, v48);
      uint64_t v50 = (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 8))(v48, v49);
      uint64_t v51 = (int *)type metadata accessor for NativeAdInfo.Fulfilled(0);
      sub_1BF9FFD78(v89, (uint64_t)v17 + v51[11]);
      *uint64_t v17 = v94;
      v17[1] = a6;
      uint64_t v52 = v85;
      v17[2] = v86;
      id v17[3] = v52;
      uint64_t v53 = v83;
      v17[6] = v84;
      v17[7] = v53;
      uint64_t v54 = v81;
      v17[8] = v82;
      v17[9] = v54;
      v17[10] = v39;
      v17[11] = v41;
      uint64_t v55 = (uint64_t)v17 + v51[12];
      uint64_t v56 = v87;
      v17[4] = v88;
      void v17[5] = v56;
      sub_1BF95BCD0(&v95, v55);
      *(void *)((char *)v17 + v51[13]) = v50;
      v17[12] = v90;
      swift_storeEnumTagMultiPayload();
      swift_retain();
      v93(v17);
    }
    else
    {
      if (qword_1EBA79730 != -1) {
        swift_once();
      }
      uint64_t v60 = (void *)qword_1EBA79208;
      sub_1BFA0014C(0, (unint64_t *)&qword_1EBA79640, (uint64_t (*)(uint64_t))sub_1BF95AAE0, MEMORY[0x1E4FBBE00]);
      uint64_t v61 = swift_allocObject();
      *(_OWORD *)(v61 + 16) = xmmword_1BFA19640;
      id v62 = v60;
      uint64_t v63 = sub_1BFA17178();
      uint64_t v65 = v64;
      uint64_t v66 = MEMORY[0x1E4FBB1A0];
      *(void *)(v61 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v67 = sub_1BF95AB38();
      *(void *)(v61 + 64) = v67;
      *(void *)(v61 + 32) = v63;
      *(void *)(v61 + 40) = v65;
      objc_msgSend(a1, sel_unfilledReason);
      uint64_t v68 = sub_1BFA17238();
      *(void *)(v61 + 96) = v66;
      *(void *)(v61 + 104) = v67;
      *(void *)(v61 + 72) = v68;
      *(void *)(v61 + 80) = v69;
      *(void *)(v61 + 136) = v66;
      *(void *)(v61 + 144) = v67;
      uint64_t v70 = v94;
      *(void *)(v61 + 112) = v94;
      *(void *)(v61 + 120) = a6;
      swift_bridgeObjectRetain();
      sub_1BFA17E48();
      sub_1BFA177B8();

      swift_bridgeObjectRelease();
      uint64_t v96 = &type metadata for NativeAdContentInfo;
      uint64_t v97 = &protocol witness table for NativeAdContentInfo;
      uint64_t v71 = (void *)swift_allocObject();
      *(void *)&long long v95 = v71;
      swift_bridgeObjectRetain();
      id v72 = a1;
      uint64_t v73 = sub_1BFA17178();
      uint64_t v75 = v74;
      uint64_t v76 = sub_1BFA171A8();
      v71[2] = v73;
      v71[3] = v75;
      v71[4] = v76;
      v71[5] = v72;
      uint64_t v77 = v19[5];
      uint64_t v78 = v19[6];
      __swift_project_boxed_opaque_existential_1(v19 + 2, v77);
      uint64_t v79 = (*(uint64_t (**)(uint64_t, uint64_t))(v78 + 8))(v77, v78);
      *uint64_t v17 = v70;
      v17[1] = a6;
      v17[2] = v73;
      id v17[3] = v75;
      sub_1BF95BBDC((uint64_t)&v95, (uint64_t)(v17 + 5));
      v17[10] = v79;
      v17[4] = v90;
      swift_retain();
      swift_bridgeObjectRetain();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v95);
      swift_storeEnumTagMultiPayload();
      v93(v17);
    }
    swift_release();
    sub_1BF973C88((uint64_t)v17);
  }
  else
  {
    uint64_t v57 = sub_1BFA16DC8();
    sub_1BF95BCE8();
    uint64_t v58 = (void *)swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v57 - 8) + 104))(v59, *MEMORY[0x1E4FAA9A0], v57);
    a3(v58);
  }
}

uint64_t NativeAdProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return v0;
}

uint64_t NativeAdProvider.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t sub_1BF9FFCB8(uint64_t a1, uint64_t a2)
{
  return NativeAdProvider.fetchNativeAdInfo(request:journal:)(a1, a2);
}

uint64_t dispatch thunk of NativeAdProviderType.fetchNativeAdInfo(request:journal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for NativeAdProvider()
{
  return self;
}

uint64_t method lookup function for NativeAdProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for NativeAdProvider);
}

void sub_1BF9FFD2C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1BFA16B58();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_1BF9FFD78(uint64_t a1, uint64_t a2)
{
  sub_1BF973B60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BF9FFDDC()
{
  sub_1BF973B60();
  uint64_t v2 = v1;
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v4 = (void *)(v0 + v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + v3 + 48))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4[26])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (v4[35])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4[49])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (v4[59])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = (char *)v4 + *(int *)(v2 + 56);
  swift_bridgeObjectRelease();
  long long v6 = &v5[*(int *)(type metadata accessor for NativeAdPlacement() + 20)];
  uint64_t v7 = sub_1BFA17278();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BFA00068(uint64_t a1, uint64_t a2)
{
  sub_1BF973B60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BFA000CC(void *a1)
{
  sub_1BF973B60();
  sub_1BF9FF63C(a1, *(void *)(v1 + 16), *(void (**)(void *))(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void (**)(void *))(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), v1+ ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80)));
}

void sub_1BFA0014C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1BFA001B0()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t PreviewInterstitialAdContext.init(provider:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for AppAdData, v5, (uint64_t)&type metadata for AppAdData, v6);
  if (!v2)
  {
    uint64_t v7 = a1[3];
    uint64_t v8 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v7);
    AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for UserAdData, v7, (uint64_t)&type metadata for UserAdData, v8);
    *(unsigned char *)a2 = v11;
    *(void *)(a2 + 8) = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1BFA002D0()
{
  if (*v0) {
    return 0x6174614472657375;
  }
  else {
    return 0x61746144707061;
  }
}

uint64_t sub_1BFA0030C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BFA00D80(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BFA00334(uint64_t a1)
{
  unint64_t v2 = sub_1BFA0055C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFA00370(uint64_t a1)
{
  unint64_t v2 = sub_1BFA0055C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t PreviewInterstitialAdContext.encode(to:)(void *a1)
{
  sub_1BFA00798(0, &qword_1EA17A178, MEMORY[0x1E4FBBDE0]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)v11 - v7;
  char v9 = *v1;
  v11[0] = *((void *)v1 + 1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA0055C();
  sub_1BFA18338();
  char v14 = v9;
  char v13 = 0;
  sub_1BF96022C();
  sub_1BFA18228();
  if (!v2)
  {
    v11[1] = v11[0];
    char v12 = 1;
    sub_1BF960280();
    sub_1BFA18228();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1BFA0055C()
{
  unint64_t result = qword_1EA17A180;
  if (!qword_1EA17A180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A180);
  }
  return result;
}

uint64_t PreviewInterstitialAdContext.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1BFA00798(0, &qword_1EA17A188, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  char v9 = (char *)v13 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA0055C();
  sub_1BFA18328();
  if (!v2)
  {
    char v15 = 0;
    sub_1BF9608C4();
    sub_1BFA181B8();
    char v10 = v16;
    char v14 = 1;
    sub_1BF960918();
    sub_1BFA181B8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v12 = v13[1];
    *(unsigned char *)a2 = v10;
    *(void *)(a2 + 8) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1BFA00798(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BFA0055C();
    unint64_t v7 = a3(a1, &type metadata for PreviewInterstitialAdContext.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1BFA007FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewInterstitialAdContext.init(provider:)(a1, a2);
}

uint64_t sub_1BFA00814@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewInterstitialAdContext.init(from:)(a1, a2);
}

uint64_t sub_1BFA0082C(void *a1)
{
  return PreviewInterstitialAdContext.encode(to:)(a1);
}

id PreviewInterstitialAdContext.newsSupplementalContext.getter()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)sub_1BFA17678()), sel_init);
  sub_1BFA17668();
  sub_1BFA174E8();
  swift_bridgeObjectRetain_n();
  sub_1BFA17578();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PreviewInterstitialAdContext.currentPromotableContentDepiction.getter()
{
  return sub_1BFA00904(0);
}

uint64_t PreviewInterstitialAdContext.nextPromotableContentDepiction.getter()
{
  return sub_1BFA00904(151);
}

uint64_t sub_1BFA00904(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  sub_1BFA17158();
  uint64_t v5 = v3;
  swift_bridgeObjectRetain();
  return sub_1BF9A5908(a1, &v5, 103);
}

unint64_t sub_1BFA00964(uint64_t a1)
{
  *(void *)(a1 + 24) = sub_1BFA00994();
  unint64_t result = sub_1BFA009E8();
  *(void *)(a1 + 32) = result;
  return result;
}

unint64_t sub_1BFA00994()
{
  unint64_t result = qword_1EBA7AB08;
  if (!qword_1EBA7AB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA7AB08);
  }
  return result;
}

unint64_t sub_1BFA009E8()
{
  unint64_t result = qword_1EBA7AB00;
  if (!qword_1EBA7AB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA7AB00);
  }
  return result;
}

uint64_t sub_1BFA00A3C(uint64_t a1, uint64_t a2)
{
  return sub_1BFA00A4C(a1, a2, 0);
}

uint64_t sub_1BFA00A44(uint64_t a1, uint64_t a2)
{
  return sub_1BFA00A4C(a1, a2, 151);
}

uint64_t sub_1BFA00A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(v3 + 8);
  sub_1BFA17158();
  uint64_t v7 = v5;
  swift_bridgeObjectRetain();
  return sub_1BF9A5908(a3, &v7, 103);
}

uint64_t initializeBufferWithCopyOfBuffer for PreviewInterstitialAdContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewInterstitialAdContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PreviewInterstitialAdContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PreviewInterstitialAdContext()
{
  return &type metadata for PreviewInterstitialAdContext;
}

unsigned char *storeEnumTagSinglePayload for PreviewInterstitialAdContext.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BFA00C40);
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

ValueMetadata *type metadata accessor for PreviewInterstitialAdContext.CodingKeys()
{
  return &type metadata for PreviewInterstitialAdContext.CodingKeys;
}

unint64_t sub_1BFA00C7C()
{
  unint64_t result = qword_1EA17A190;
  if (!qword_1EA17A190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A190);
  }
  return result;
}

unint64_t sub_1BFA00CD4()
{
  unint64_t result = qword_1EA17A198;
  if (!qword_1EA17A198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A198);
  }
  return result;
}

unint64_t sub_1BFA00D2C()
{
  unint64_t result = qword_1EA17A1A0;
  if (!qword_1EA17A1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A1A0);
  }
  return result;
}

uint64_t sub_1BFA00D80(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x61746144707061 && a2 == 0xE700000000000000;
  if (v2 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6174614472657375 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1BFA18258();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t type metadata accessor for Localized()
{
  return self;
}

NewsAds::SponsoredBannerAdData __swiftcall SponsoredBannerAdData.init(backingTagIdentifier:adKeywords:)(Swift::String backingTagIdentifier, Swift::OpaquePointer adKeywords)
{
  *(Swift::String *)uint64_t v2 = backingTagIdentifier;
  *(Swift::OpaquePointer *)(v2 + 16) = adKeywords;
  result.backingTagIdentifier = backingTagIdentifier;
  result.adKeywords = adKeywords;
  return result;
}

uint64_t sub_1BFA00EA8()
{
  if (*v0) {
    return 0x726F7779654B6461;
  }
  else {
    return 0xD000000000000014;
  }
}

uint64_t sub_1BFA00EEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BFA01844(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BFA00F14(uint64_t a1)
{
  unint64_t v2 = sub_1BFA0115C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFA00F50(uint64_t a1)
{
  unint64_t v2 = sub_1BFA0115C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SponsoredBannerAdData.encode(to:)(void *a1)
{
  sub_1BFA01408(0, &qword_1EA17A1A8, MEMORY[0x1E4FBBDE0]);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v13 - v6;
  v13[0] = *(void *)(v1 + 16);
  uint64_t v8 = a1[3];
  char v9 = a1;
  uint64_t v11 = v10;
  __swift_project_boxed_opaque_existential_1(v9, v8);
  sub_1BFA0115C();
  sub_1BFA18338();
  char v15 = 0;
  sub_1BFA181E8();
  if (!v2)
  {
    v13[1] = v13[0];
    char v14 = 1;
    sub_1BF964610();
    sub_1BF964C24(&qword_1EA179418);
    sub_1BFA18228();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v11);
}

unint64_t sub_1BFA0115C()
{
  unint64_t result = qword_1EA17A1B0;
  if (!qword_1EA17A1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A1B0);
  }
  return result;
}

uint64_t SponsoredBannerAdData.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1BFA01408(0, &qword_1EA17A1B8, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  char v9 = (char *)v15 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA0115C();
  sub_1BFA18328();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v17 = 0;
  uint64_t v10 = sub_1BFA18178();
  uint64_t v12 = v11;
  sub_1BF964610();
  char v16 = 1;
  sub_1BF964C24(&qword_1EA179428);
  swift_bridgeObjectRetain();
  sub_1BFA181B8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v13 = v15[1];
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v13;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1BFA01408(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BFA0115C();
    unint64_t v7 = a3(a1, &type metadata for SponsoredBannerAdData.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1BFA0146C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return SponsoredBannerAdData.init(from:)(a1, a2);
}

uint64_t sub_1BFA01484(void *a1)
{
  return SponsoredBannerAdData.encode(to:)(a1);
}

void SponsoredBannerAdData.init(tag:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_identifier);
  uint64_t v5 = sub_1BFA17B38();
  uint64_t v7 = v6;

  id v8 = objc_msgSend(a1, sel_iAdKeywords);
  if (v8)
  {
    char v9 = v8;
    uint64_t v10 = sub_1BFA17CC8();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v10 = MEMORY[0x1E4FBC860];
  }
  *a2 = v5;
  a2[1] = v7;
  a2[2] = v10;
}

unint64_t sub_1BFA01550(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1BFA01580();
  unint64_t result = sub_1BFA015D4();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1BFA01580()
{
  unint64_t result = qword_1EBA779C0;
  if (!qword_1EBA779C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA779C0);
  }
  return result;
}

unint64_t sub_1BFA015D4()
{
  unint64_t result = qword_1EBA779B8;
  if (!qword_1EBA779B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA779B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for SponsoredBannerAdData()
{
  return &type metadata for SponsoredBannerAdData;
}

unsigned char *storeEnumTagSinglePayload for SponsoredBannerAdData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BFA01704);
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

ValueMetadata *type metadata accessor for SponsoredBannerAdData.CodingKeys()
{
  return &type metadata for SponsoredBannerAdData.CodingKeys;
}

unint64_t sub_1BFA01740()
{
  unint64_t result = qword_1EA17A1C0;
  if (!qword_1EA17A1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A1C0);
  }
  return result;
}

unint64_t sub_1BFA01798()
{
  unint64_t result = qword_1EA17A1C8;
  if (!qword_1EA17A1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A1C8);
  }
  return result;
}

unint64_t sub_1BFA017F0()
{
  unint64_t result = qword_1EA17A1D0;
  if (!qword_1EA17A1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A1D0);
  }
  return result;
}

uint64_t sub_1BFA01844(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x80000001BFA28160 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F7779654B6461 && a2 == 0xEA00000000007364)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_1BFA18258();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t dispatch thunk of AdPolicyViewportEnvironmentProviderType.viewportEnvironment()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for DebugSponsorshipAdContentInfo()
{
  return &type metadata for DebugSponsorshipAdContentInfo;
}

void __swiftcall AdPolicyFailure.init(placement:failureType:recoverable:description:additionalInfo:)(NewsAds::AdPolicyFailure *__return_ptr retstr, NewsAds::AdPolicyPlacement placement, NewsAds::AdPolicyFailureType failureType, Swift::Bool recoverable, Swift::String description, Swift::OpaquePointer additionalInfo)
{
  unsigned int v6 = *(void **)(placement.placementIdentifier._countAndFlagsBits + 8);
  NewsAds::AdPolicyFailureType v7 = *(unsigned char *)placement.placementIdentifier._object;
  retstr->placement.placementIdentifier._countAndFlagsBits = *(void *)placement.placementIdentifier._countAndFlagsBits;
  retstr->placement.placementIdentifier._object = v6;
  retstr->placement.position = *(CGPoint *)(placement.placementIdentifier._countAndFlagsBits + 16);
  retstr->failureType = v7;
  retstr->recoverable = failureType;
  retstr->description._countAndFlagsBits = recoverable;
  *(Swift::String *)&retstr->description._object = description;
}

uint64_t AdPolicyFailure.placement.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v2;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

void AdPolicyFailure.failureType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

uint64_t AdPolicyFailure.recoverable.getter()
{
  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t AdPolicyFailure.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AdPolicyFailure.additionalInfo.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for AdPolicyFailure()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AdPolicyFailure(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AdPolicyFailure(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AdPolicyFailure(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for AdPolicyFailure()
{
  return &type metadata for AdPolicyFailure;
}

ValueMetadata *type metadata accessor for AdPolicyFailure.Info()
{
  return &type metadata for AdPolicyFailure.Info;
}

uint64_t NativeAdProviderFactory.createAdProvider<A, B>(for:context:)(uint64_t a1, uint64_t a2)
{
  return sub_1BFA01CC8(a2);
}

uint64_t NativeAdProviderFactory.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t NativeAdProviderFactory.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1BFA01C88@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1BFA01CC8(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1BFA01CC8(uint64_t a1)
{
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  type metadata accessor for NativeAdProvider();
  sub_1BF95BBDC(a1, (uint64_t)v6);
  uint64_t v3 = swift_allocObject();
  sub_1BF95BCD0(v6, v3 + 16);
  uint64_t v4 = sub_1BFA16DE8();
  uint64_t result = swift_release();
  if (v4) {
    return v4;
  }
  __break(1u);
  return result;
}

_UNKNOWN **sub_1BFA01D94()
{
  return &protocol witness table for NativeAdProvider;
}

uint64_t type metadata accessor for NativeAdProviderFactory()
{
  return self;
}

uint64_t method lookup function for NativeAdProviderFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for NativeAdProviderFactory);
}

uint64_t sub_1BFA01DDC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1BFA01E14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  return sub_1BFA01E28(a1, a2, a3, a4, a5, a6, 0x8000000000000000, a7);
}

uint64_t sub_1BFA01E1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  return sub_1BFA01E28(a1, a2, a3, a4, a5, a6, 0x8000000000000008, a7);
}

uint64_t sub_1BFA01E28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v16 = type metadata accessor for AdRequest();
  uint64_t v17 = sub_1BFA17F48();
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)v21 - v18;
  long long v24 = a7;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v23 = 0;
  memset(v21, 0, sizeof(v21));
  char v22 = 1;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))((char *)v21 - v18, 1, 1, v16);
  swift_bridgeObjectRetain();
  return sub_1BFA054A8(a1, a2, &v24, 0, 0, &v23, v21, (uint64_t)v19, a8, a3, a4, a5, a6);
}

uint64_t sub_1BFA01F7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v21 = a8;
  uint64_t v22 = a1;
  *(void *)&long long v23 = a4;
  *((void *)&v23 + 1) = a5;
  *(void *)&long long v24 = a6;
  *((void *)&v24 + 1) = a7;
  uint64_t v14 = type metadata accessor for AdRequest();
  uint64_t v15 = sub_1BFA17F48();
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)&v21 - v16;
  long long v27 = 0x8000000000000010;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v18 = a3 + *(int *)(v14 + 52);
  uint64_t v26 = *(void *)(v18 + *(int *)(type metadata accessor for AdContext() + 36));
  long long v23 = 0u;
  long long v24 = 0u;
  char v25 = 1;
  uint64_t v19 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v17, a3, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v17, 0, 1, v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_1BFA054A8(v22, a2, &v27, 0, 0, &v26, &v23, (uint64_t)v17, v21, a4, a5, a6, a7);
}

uint64_t sub_1BFA0212C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10)
{
  uint64_t v23 = a4;
  long long v24 = a9;
  uint64_t v25 = a1;
  uint64_t v26 = a3;
  *(void *)&long long v27 = a6;
  *((void *)&v27 + 1) = a7;
  *(void *)&long long v28 = a8;
  *((void *)&v28 + 1) = a10;
  uint64_t v15 = type metadata accessor for AdRequest();
  uint64_t v16 = sub_1BFA17F48();
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v23 - v17;
  long long v31 = 0x8000000000000018;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v19 = a5 + *(int *)(v15 + 52);
  uint64_t v30 = *(void *)(v19 + *(int *)(type metadata accessor for AdContext() + 36));
  long long v27 = 0u;
  long long v28 = 0u;
  char v29 = 1;
  uint64_t v20 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v18, a5, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v18, 0, 1, v15);
  uint64_t v21 = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_1BFA054A8(v25, a2, &v31, v26, v21, &v30, &v27, (uint64_t)v18, v24, a6, a7, a8, a10);
}

uint64_t sub_1BFA022EC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, long long a10)
{
  uint64_t v55 = a5;
  uint64_t v56 = a6;
  uint64_t v51 = a3;
  uint64_t v52 = a4;
  uint64_t v49 = a9;
  uint64_t v50 = a2;
  uint64_t v44 = type metadata accessor for AdContext();
  uint64_t v43 = *(void *)(v44 - 8);
  MEMORY[0x1F4188790](v44);
  uint64_t v42 = (char *)&v41 - v13;
  uint64_t v53 = a7;
  uint64_t v54 = a8;
  *(void *)&long long v57 = a7;
  *((void *)&v57 + 1) = a8;
  uint64_t v47 = *((void *)&a10 + 1);
  uint64_t v48 = a10;
  long long v58 = a10;
  uint64_t v45 = (void *)type metadata accessor for AdRequest();
  uint64_t v14 = sub_1BFA17F48();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v46 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)&v41 - v19;
  MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v41 - v21;
  id v23 = a1;
  sub_1BF991B64(a1, &v57);
  long long v24 = (void *)v57;
  v61[0] = v57;
  v61[1] = v58;
  id v60 = (id)v57;
  id v25 = (id)v57;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v26 = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v27 = v24;
  sub_1BF987818();
  if (swift_dynamicCast())
  {
    long long v28 = (void *)v58;
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v28 = 0;
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v29 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v29(v22, v56, v14);
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v22, v14);
    uint64_t v30 = v45;
    uint64_t v31 = *(v45 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, void *))(v31 + 48))(v20, 1, v45) == 1)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
      long long v28 = 0;
    }
    else
    {
      uint64_t v32 = &v20[*((int *)v30 + 13)];
      uint64_t v33 = v43;
      uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
      uint64_t v41 = v20;
      uint64_t v35 = v42;
      uint64_t v36 = v44;
      v34(v42, v32, v44);
      (*(void (**)(char *, void *))(v31 + 8))(v41, v45);
      long long v28 = *(void **)&v35[*(int *)(v36 + 36)];
      uint64_t v45 = *(void **)(v33 + 8);
      swift_bridgeObjectRetain();
      ((void (*)(char *, uint64_t))v45)(v35, v36);
    }
  }
  id v60 = v28;
  long long v57 = 0u;
  long long v58 = 0u;
  char v59 = 1;
  uint64_t v37 = (uint64_t)v46;
  v29(v46, v56, v14);
  uint64_t v38 = v55;
  swift_bridgeObjectRetain();
  uint64_t v39 = v51;
  swift_bridgeObjectRetain();
  sub_1BFA054A8(v50, v39, v61, v52, v38, (uint64_t *)&v60, &v57, v37, v49, v53, v54, v48, v47);

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BFA027A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11)
{
  return sub_1BFA02C44(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0x8000000000000020);
}

uint64_t sub_1BFA027D8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, long long a10)
{
  uint64_t v58 = a5;
  uint64_t v59 = a6;
  uint64_t v54 = a3;
  uint64_t v55 = a4;
  uint64_t v52 = a9;
  uint64_t v53 = a2;
  uint64_t v49 = type metadata accessor for AdContext();
  uint64_t v48 = *(void *)(v49 - 8);
  MEMORY[0x1F4188790](v49);
  uint64_t v46 = (char *)&v43 - v13;
  uint64_t v56 = a7;
  uint64_t v57 = a8;
  *(void *)&long long v60 = a7;
  *((void *)&v60 + 1) = a8;
  long long v51 = a10;
  long long v61 = a10;
  uint64_t v14 = type metadata accessor for AdRequest();
  uint64_t v15 = sub_1BFA17F48();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v50 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v43 - v19;
  id v21 = a1;
  sub_1BF991F5C((char *)a1, &v60);
  uint64_t v22 = *((void *)&v61 + 1);
  id v23 = (void *)v60;
  *(void *)&v64[0] = v60 | 0x4000000000000000;
  *((void *)&v64[0] + 1) = *((void *)&v60 + 1);
  v64[1] = v61;
  long long v24 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v24(v20, v59, v15);
  uint64_t v25 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v20, 1, v14) == 1)
  {
    id v26 = v23;
    id v27 = *(void (**)(char *, uint64_t))(v16 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v27(v20, v15);
    uint64_t v28 = 0;
  }
  else
  {
    char v29 = &v20[*(int *)(v14 + 52)];
    uint64_t v47 = v22;
    uint64_t v30 = v48;
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
    uint64_t v44 = v24;
    uint64_t v32 = v46;
    uint64_t v45 = v15;
    uint64_t v33 = v49;
    v31(v46, v29, v49);
    id v34 = v23;
    uint64_t v35 = *(void (**)(char *, uint64_t))(v25 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v35(v20, v14);
    uint64_t v28 = *(void *)&v32[*(int *)(v33 + 36)];
    uint64_t v36 = *(void (**)(char *, uint64_t))(v30 + 8);
    swift_bridgeObjectRetain();
    uint64_t v37 = v32;
    long long v24 = v44;
    uint64_t v38 = v33;
    uint64_t v15 = v45;
    v36(v37, v38);
  }
  uint64_t v63 = v28;
  long long v60 = 0u;
  long long v61 = 0u;
  char v62 = 1;
  uint64_t v39 = (uint64_t)v50;
  v24(v50, v59, v15);
  uint64_t v40 = v58;
  swift_bridgeObjectRetain();
  uint64_t v41 = v54;
  swift_bridgeObjectRetain();
  sub_1BFA054A8(v53, v41, v64, v55, v40, &v63, &v60, v39, v52, v56, v57, v51, *((uint64_t *)&v51 + 1));

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BFA02BDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11)
{
  return sub_1BFA02C44(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0x8000000000000028);
}

uint64_t sub_1BFA02C10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11)
{
  return sub_1BFA02C44(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0x8000000000000030);
}

uint64_t sub_1BFA02C44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, unint64_t a12)
{
  uint64_t v30 = a4;
  uint64_t v31 = a8;
  uint64_t v33 = a1;
  uint64_t v34 = a3;
  uint64_t v32 = a9;
  uint64_t v28 = a2;
  uint64_t v29 = a11;
  *(void *)&long long v35 = a7;
  *((void *)&v35 + 1) = a8;
  uint64_t v36 = a10;
  uint64_t v37 = a11;
  uint64_t v15 = type metadata accessor for AdRequest();
  uint64_t v16 = sub_1BFA17F48();
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)&v27 - v17;
  long long v27 = *(_OWORD *)a6;
  uint64_t v19 = *(void *)(a6 + 16);
  uint64_t v20 = *(void *)(a6 + 24);
  char v21 = *(unsigned char *)(a6 + 32);
  long long v40 = a12;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v22 = a5 + *(int *)(v15 + 52);
  uint64_t v39 = *(void *)(v22 + *(int *)(type metadata accessor for AdContext() + 36));
  long long v35 = v27;
  uint64_t v36 = v19;
  uint64_t v37 = v20;
  char v38 = v21;
  uint64_t v23 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v18, a5, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v18, 0, 1, v15);
  uint64_t v24 = v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v25 = v30;
  swift_bridgeObjectRetain();
  return sub_1BFA054A8(v33, v24, &v40, v34, v25, &v39, &v35, (uint64_t)v18, v32, a7, v31, a10, v29);
}

uint64_t JournalEntry.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JournalEntry.createdDate.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 52);
  uint64_t v5 = sub_1BFA16988();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t JournalEntry.placementIdentifier.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 56));
  swift_bridgeObjectRetain();
  return v2;
}

unint64_t JournalEntry.status.getter@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v3 = (unint64_t *)(v2 + *(int *)(a1 + 60));
  unint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  unint64_t v6 = v3[2];
  unint64_t v7 = v3[3];
  *a2 = *v3;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return sub_1BF96891C(v4);
}

uint64_t JournalEntry.contentIdentifier.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 64));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t JournalEntry.contextBuilderSnapshot.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(v2 + *(int *)(a1 + 68));
  return swift_bridgeObjectRetain();
}

__n128 JournalEntry.layout.getter@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2 + *(int *)(a1 + 72);
  char v4 = *(unsigned char *)(v3 + 32);
  __n128 result = *(__n128 *)v3;
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v3;
  *(_OWORD *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 32) = v4;
  return result;
}

uint64_t sub_1BFA02F74()
{
  uint64_t result = sub_1BFA16988();
  if (v1 <= 0x3F)
  {
    type metadata accessor for AdRequest();
    uint64_t result = sub_1BFA17F48();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *sub_1BFA03088(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1BFA16988();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v11 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(a3 + 24);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = v12;
  int v14 = *(_DWORD *)(v12 + 80);
  uint64_t v15 = v14 & 0xF8;
  uint64_t v16 = v15 | 7;
  uint64_t v18 = *(void *)(v10 - 8);
  unsigned int v19 = *(_DWORD *)(v18 + 84);
  uint64_t v20 = *(_DWORD *)(v18 + 80);
  uint64_t v21 = v20 | v15 | 7;
  if (*(_DWORD *)(v12 + 84) <= 0x7FFFFFFFu) {
    unsigned int v22 = 0x7FFFFFFF;
  }
  else {
    unsigned int v22 = *(_DWORD *)(v12 + 84);
  }
  unsigned int v86 = v22;
  uint64_t v23 = v15 + 23;
  uint64_t v24 = (v15 + 23) & ~v16;
  uint64_t v25 = *(void *)(v12 + 64) + 7;
  unint64_t v26 = (v25 & 0xFFFFFFFFFFFFFFF8) + v20 + 8;
  uint64_t v17 = *(void *)(v10 - 8);
  uint64_t v27 = *(void *)(v17 + 64) + 7;
  uint64_t v28 = v9 + 7;
  if ((v21 | v8) == 7
    && ((v14 | *(_DWORD *)(v7 + 80) | *(_DWORD *)(v18 + 80)) & 0x100000) == 0
    && ((v27 + ((v26 + v24) & ~v20)) & 0xFFFFFFFFFFFFFFF8)
     + 16
     + ((v21
       + ((((((((((v9 + 7 + ((v8 + 16) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 33) & ~v21) <= 0x18)
  {
    unint64_t __n = ((v27 + ((v26 + v24) & ~v20)) & 0xFFFFFFFFFFFFFFF8) + 16;
    unint64_t v78 = (v25 & 0xFFFFFFFFFFFFFFF8) + v20 + 8;
    uint64_t v84 = v23;
    uint64_t v74 = *(void *)(v12 + 64) + 7;
    uint64_t v75 = *(void *)(v17 + 64) + 7;
    uint64_t v79 = v11;
    uint64_t v80 = *(void *)(v10 - 8);
    uint64_t v81 = v10;
    uint64_t v33 = ~v8;
    uint64_t v34 = ~v21;
    uint64_t v83 = ~v16;
    uint64_t v76 = ~v20;
    unsigned int v35 = v22;
    if (v19 > v22) {
      unsigned int v35 = *(_DWORD *)(v18 + 84);
    }
    unsigned int v82 = v35;
    uint64_t v36 = a2[1];
    *a1 = *a2;
    a1[1] = v36;
    uint64_t v85 = a1;
    uint64_t v37 = (char *)a1 + v8;
    char v38 = (char *)a2 + v8;
    uint64_t v39 = (unint64_t)(v37 + 16) & v33;
    uint64_t v40 = (unint64_t)(v38 + 16) & v33;
    uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    swift_bridgeObjectRetain();
    v41(v39, v40, v6);
    uint64_t v42 = (void *)((v28 + v39) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v43 = (void *)((v28 + v40) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v42 = *v43;
    v42[1] = v43[1];
    uint64_t v44 = (void *)(((unint64_t)v42 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v45 = (unint64_t *)(((unint64_t)v43 + 23) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v46 = *v45;
    unint64_t v47 = v45[1];
    unint64_t v48 = v45[2];
    unint64_t v49 = v45[3];
    swift_bridgeObjectRetain();
    sub_1BF96891C(v46);
    *uint64_t v44 = v46;
    v44[1] = v47;
    v44[2] = v48;
    v44[3] = v49;
    uint64_t v50 = (void *)(((unint64_t)v44 + 39) & 0xFFFFFFFFFFFFFFF8);
    long long v51 = (void *)(((unint64_t)v45 + 39) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v50 = *v51;
    v50[1] = v51[1];
    uint64_t v52 = (void *)(((unint64_t)v50 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v53 = (void *)(((unint64_t)v51 + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v52 = *v53;
    unint64_t v54 = ((unint64_t)v52 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v55 = ((unint64_t)v53 + 15) & 0xFFFFFFFFFFFFFFF8;
    long long v56 = *(_OWORD *)v55;
    long long v57 = *(_OWORD *)(v55 + 16);
    *(unsigned char *)(v54 + 32) = *(unsigned char *)(v55 + 32);
    *(_OWORD *)unint64_t v54 = v56;
    *(_OWORD *)(v54 + 16) = v57;
    uint64_t v58 = (void *)((v54 + v21 + 33) & v34);
    uint64_t v59 = (void *)((v55 + v21 + 33) & v34);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v82 == 0x7FFFFFFF)
    {
      unint64_t v60 = v59[1];
      if (v60 >= 0xFFFFFFFF) {
        LODWORD(v60) = -1;
      }
      uint64_t v61 = v84;
      uint64_t v32 = v85;
      uint64_t v62 = v83;
      if (v60 != -1) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v62 = v83;
      uint64_t v61 = v84;
      unint64_t v63 = ((unint64_t)v59 + v84) & v83;
      if (v86 >= v19) {
        int v64 = (*(uint64_t (**)(unint64_t))(v13 + 48))(v63);
      }
      else {
        int v64 = (*(uint64_t (**)(unint64_t))(v80 + 48))((v78 + v63) & v76);
      }
      uint64_t v32 = v85;
      if (v64)
      {
LABEL_19:
        memcpy(v58, v59, __n);
        return v32;
      }
    }
    *uint64_t v58 = *v59;
    v58[1] = v59[1];
    unint64_t v65 = ((unint64_t)v58 + v61) & v62;
    unint64_t v66 = ((unint64_t)v59 + v61) & v62;
    unint64_t v67 = *(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 16);
    swift_bridgeObjectRetain();
    v67(v65, v66, v79);
    *(void *)((v74 + v65) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v74 + v66) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v68 = (v78 + v65) & v76;
    unint64_t v69 = (v78 + v66) & v76;
    uint64_t v70 = *(void (**)(unint64_t, unint64_t, uint64_t))(v80 + 16);
    swift_bridgeObjectRetain();
    v70(v68, v69, v81);
    uint64_t v71 = (void *)((v75 + v68) & 0xFFFFFFFFFFFFFFF8);
    id v72 = (void *)((v75 + v69) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v71 = *v72;
    v71[1] = v72[1];
    swift_bridgeObjectRetain();
    return v32;
  }
  uint64_t v31 = *a2;
  *a1 = *a2;
  uint64_t v32 = (void *)(v31 + (((v21 | v8) + 16) & ~(v21 | v8)));
  swift_retain();
  return v32;
}

uint64_t sub_1BFA0354C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_1BFA16988();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5 + 8;
  unint64_t v7 = (a1 + *(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7, v4);
  unint64_t v8 = (*(void *)(v6 + 56) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  uint64_t v9 = (unint64_t *)((v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  sub_1BF972984(*v9);
  swift_bridgeObjectRelease();
  unint64_t v10 = ((((unint64_t)v9 + 39) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 16);
  uint64_t v11 = *(void *)(a2 + 24);
  uint64_t v13 = *(void *)(v12 - 8);
  unint64_t v14 = (v10 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = v13;
  uint64_t v16 = *(_DWORD *)(v13 + 80) & 0xF8 | 7;
  uint64_t v17 = *(void *)(v11 - 8);
  uint64_t v18 = v17;
  uint64_t v19 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = (v14 + (v19 | v16) + 33) & ~(v19 | v16);
  if (*(_DWORD *)(v13 + 84) <= 0x7FFFFFFFu) {
    unsigned int v21 = 0x7FFFFFFF;
  }
  else {
    unsigned int v21 = *(_DWORD *)(v13 + 84);
  }
  uint64_t v22 = *(unsigned int *)(v17 + 84);
  if (v22 <= v21) {
    unsigned int v23 = v21;
  }
  else {
    unsigned int v23 = *(_DWORD *)(v17 + 84);
  }
  uint64_t v24 = ~v16;
  unint64_t v30 = ((*(void *)(v13 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v23 != 0x7FFFFFFF)
  {
    uint64_t v28 = (v16 + v20 + 16) & v24;
    if (v21 >= v22)
    {
      uint64_t v25 = ~v19;
      uint64_t result = (*(uint64_t (**)(uint64_t))(v13 + 48))(v28);
      if (result) {
        return result;
      }
    }
    else
    {
      uint64_t v25 = ~v19;
      uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v17 + 48))((((*(void *)(v13 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8 + v19 + v28) & ~v19, v22, v11);
      if (result) {
        return result;
      }
    }
    goto LABEL_16;
  }
  uint64_t v25 = ~v19;
  unint64_t v26 = *(void *)(v20 + 8);
  if (v26 >= 0xFFFFFFFF) {
    LODWORD(v26) = -1;
  }
  uint64_t result = (v26 + 1);
  if (v26 == -1)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v29 = (v16 + v20 + 16) & v24;
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v29, v12);
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v18 + 8))((v30 + v19 + v29) & v25, v11);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_1BFA0384C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = sub_1BFA16988();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v10 = v8 + 16;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  unint64_t v66 = a1;
  uint64_t v12 = ((unint64_t)a1 + v11 + 16) & ~v11;
  uint64_t v13 = ((unint64_t)a2 + v11 + 16) & ~v11;
  swift_bridgeObjectRetain();
  v9(v12, v13, v7);
  uint64_t v14 = *(void *)(v10 + 48) + 7;
  uint64_t v15 = (void *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  uint64_t v17 = (void *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v18 = (unint64_t *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v19 = *v18;
  unint64_t v20 = v18[1];
  unint64_t v21 = v18[2];
  unint64_t v22 = v18[3];
  swift_bridgeObjectRetain();
  sub_1BF96891C(v19);
  *uint64_t v17 = v19;
  v17[1] = v20;
  v17[2] = v21;
  id v17[3] = v22;
  unsigned int v23 = (void *)(((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v24 = (void *)(((unint64_t)v18 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unsigned int v23 = *v24;
  v23[1] = v24[1];
  uint64_t v25 = (void *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v26 = (void *)(((unint64_t)v24 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v25 = *v26;
  unint64_t v27 = ((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = ((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  long long v29 = *(_OWORD *)v28;
  long long v30 = *(_OWORD *)(v28 + 16);
  *(unsigned char *)(v27 + 32) = *(unsigned char *)(v28 + 32);
  *(_OWORD *)unint64_t v27 = v29;
  *(_OWORD *)(v27 + 16) = v30;
  uint64_t v61 = *(void *)(a3 + 16);
  uint64_t v31 = *(void *)(v61 - 8);
  uint64_t v32 = *(_DWORD *)(v31 + 80) & 0xF8;
  uint64_t v63 = *(void *)(a3 + 24);
  uint64_t v33 = *(void *)(v63 - 8);
  uint64_t v34 = *(unsigned __int8 *)(v33 + 80);
  uint64_t v35 = (v34 | v32 | 7) + 33;
  __dst = (void *)((v35 + v27) & ~(v34 | v32 | 7));
  uint64_t v36 = (void *)((v35 + v28) & ~(v34 | v32 | 7));
  uint64_t v58 = v31;
  uint64_t v37 = *(unsigned int *)(v31 + 84);
  if (v37 <= 0x7FFFFFFF) {
    unsigned int v38 = 0x7FFFFFFF;
  }
  else {
    unsigned int v38 = *(_DWORD *)(v31 + 84);
  }
  uint64_t v62 = *(void *)(v63 - 8);
  uint64_t v39 = *(unsigned int *)(v33 + 84);
  if (v39 <= v38) {
    unsigned int v40 = v38;
  }
  else {
    unsigned int v40 = *(_DWORD *)(v33 + 84);
  }
  uint64_t v60 = v32 | 7;
  uint64_t v41 = ~(v32 | 7);
  uint64_t v42 = v32 + 23;
  uint64_t v57 = *(void *)(*(void *)(v61 - 8) + 64) + 7;
  uint64_t v59 = ~v34;
  uint64_t v64 = *(void *)(*(void *)(v63 - 8) + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v40 == 0x7FFFFFFF)
  {
    unint64_t v43 = v36[1];
    if (v43 >= 0xFFFFFFFF) {
      LODWORD(v43) = -1;
    }
    int v44 = v43 + 1;
  }
  else
  {
    unint64_t v45 = ((unint64_t)v36 + v42) & v41;
    if (v38 < v39)
    {
      unint64_t v46 = (v57 & 0xFFFFFFFFFFFFFFF8) + v34 + 8;
      int v44 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v62 + 48))((v46 + v45) & v59, v39, v63);
      goto LABEL_15;
    }
    int v44 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v58 + 48))(v45, v37, v61);
  }
  unint64_t v46 = (v57 & 0xFFFFFFFFFFFFFFF8) + v34 + 8;
LABEL_15:
  uint64_t v47 = v64 + 7;
  if (v44)
  {
    memcpy(__dst, v36, ((v47 + ((v46 + (v42 & ~v60)) & ~v34)) & 0xFFFFFFFFFFFFFFF8) + 16);
  }
  else
  {
    void *__dst = *v36;
    __dst[1] = v36[1];
    unint64_t v48 = ((unint64_t)__dst + v42) & v41;
    unint64_t v49 = ((unint64_t)v36 + v42) & v41;
    uint64_t v50 = *(void (**)(unint64_t, unint64_t, uint64_t))(v58 + 16);
    swift_bridgeObjectRetain();
    v50(v48, v49, v61);
    *(void *)((v57 + v48) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v57 + v49) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v51 = (v46 + v48) & v59;
    unint64_t v52 = (v46 + v49) & v59;
    uint64_t v53 = *(void (**)(unint64_t, unint64_t, uint64_t))(v62 + 16);
    swift_bridgeObjectRetain();
    v53(v51, v52, v63);
    unint64_t v54 = (void *)((v47 + v51) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v55 = (void *)((v47 + v52) & 0xFFFFFFFFFFFFFFF8);
    *unint64_t v54 = *v55;
    v54[1] = v55[1];
    swift_bridgeObjectRetain();
  }
  return v66;
}

void *sub_1BFA03C4C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_1BFA16988();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 40) + 7;
  uint64_t v13 = (void *)((v12 + v10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)((v12 + v11) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = (unint64_t *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (unint64_t *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v17 = *v16;
  unint64_t v18 = v16[1];
  unint64_t v19 = v16[2];
  unint64_t v20 = v16[3];
  sub_1BF96891C(*v16);
  unint64_t v21 = *v15;
  *uint64_t v15 = v17;
  v15[1] = v18;
  void v15[2] = v19;
  _OWORD v15[3] = v20;
  sub_1BF972984(v21);
  unint64_t v22 = (void *)(((unint64_t)v15 + 39) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v23 = (void *)(((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = (void *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v25 = (void *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v24 = *v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v26 = ((unint64_t)v24 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = ((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFFFF8;
  long long v28 = *(_OWORD *)v27;
  long long v29 = *(_OWORD *)(v27 + 16);
  *(unsigned char *)(v26 + 32) = *(unsigned char *)(v27 + 32);
  *(_OWORD *)unint64_t v26 = v28;
  *(_OWORD *)(v26 + 16) = v29;
  uint64_t v81 = *(void *)(a3 + 16);
  uint64_t v82 = *(void *)(a3 + 24);
  uint64_t v30 = *(void *)(v81 - 8);
  uint64_t v31 = *(_DWORD *)(v30 + 80) & 0xF8;
  uint64_t v32 = v31 | 7;
  uint64_t v33 = *(void *)(v82 - 8);
  uint64_t v34 = v33;
  uint64_t v35 = *(unsigned __int8 *)(v33 + 80);
  uint64_t v36 = (v35 | v31 | 7) + 33;
  uint64_t v37 = (void *)((v36 + v26) & ~(v35 | v31 | 7));
  unsigned int v38 = (void *)((v36 + v27) & ~(v35 | v31 | 7));
  uint64_t v39 = *(unsigned int *)(v30 + 84);
  if (v39 <= 0x7FFFFFFF) {
    unsigned int v40 = 0x7FFFFFFF;
  }
  else {
    unsigned int v40 = *(_DWORD *)(v30 + 84);
  }
  uint64_t v41 = *(unsigned int *)(v33 + 84);
  if (v41 <= v40) {
    unsigned int v42 = v40;
  }
  else {
    unsigned int v42 = *(_DWORD *)(v33 + 84);
  }
  uint64_t v43 = ~v32;
  uint64_t v44 = v31 + 23;
  uint64_t v79 = *(void *)(*(void *)(v81 - 8) + 64) + 7;
  uint64_t v80 = ~v35;
  unint64_t v45 = (v79 & 0xFFFFFFFFFFFFFFF8) + v35 + 8;
  uint64_t v46 = *(void *)(v33 + 64) + 7;
  size_t v47 = ((v46 + ((v45 + ((v31 + 23) & ~v32)) & ~v35)) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v42 != 0x7FFFFFFF)
  {
    size_t __n = ((v46 + ((v45 + ((v31 + 23) & ~v32)) & ~v35)) & 0xFFFFFFFFFFFFFFF8) + 16;
    uint64_t v76 = ~v32;
    unint64_t v53 = ((unint64_t)v37 + v44) & v43;
    unint64_t v75 = ((unint64_t)v38 + v44) & v43;
    if (v40 >= v41)
    {
      unint64_t v55 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v30 + 48);
      int v74 = v55(v53, v39, v81);
      int v49 = v55(v75, v39, v81);
      uint64_t v43 = v76;
      size_t v47 = __n;
      if (v74) {
        goto LABEL_17;
      }
    }
    else
    {
      unint64_t v54 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v33 + 48);
      int v73 = v54((v45 + v53) & v80, v41, v82);
      int v49 = v54((v45 + v75) & v80, v41, v82);
      uint64_t v43 = v76;
      size_t v47 = __n;
      if (v73) {
        goto LABEL_17;
      }
    }
LABEL_11:
    uint64_t v50 = v43;
    if (!v49)
    {
      *uint64_t v37 = *v38;
      v37[1] = v38[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      unint64_t v65 = ((unint64_t)v37 + v44) & v50;
      unint64_t v66 = (unint64_t)v38 + v44;
      unint64_t v67 = v45;
      unint64_t v68 = v66 & v50;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v30 + 24))(v65, v66 & v50, v81);
      *(void *)((v79 + v65) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v79 + v68) & 0xFFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      unint64_t v69 = (v67 + v68) & v80;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v34 + 24))((v67 + v65) & v80, v69, v82);
      uint64_t v70 = (void *)((v46 + ((v67 + v65) & v80)) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v71 = (void *)((v46 + v69) & 0xFFFFFFFFFFFFFFF8);
      void *v70 = *v71;
      v70[1] = v71[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    size_t __na = v47;
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v30 + 8))(((unint64_t)v37 + v44) & v50, v81);
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v34 + 8))((v45 + (((unint64_t)v37 + v44) & v50)) & v80, v82);
    swift_bridgeObjectRelease();
    unint64_t v51 = v37;
    unint64_t v52 = v38;
    size_t v47 = __na;
    goto LABEL_19;
  }
  unint64_t v48 = *(void *)(((v36 + v27) & ~(v35 | v31 | 7)) + 8);
  if (v48 >= 0xFFFFFFFF) {
    LODWORD(v48) = -1;
  }
  int v49 = v48 + 1;
  if (v37[1] >= 0xFFFFFFFFuLL) {
    goto LABEL_11;
  }
LABEL_17:
  if (!v49)
  {
    *uint64_t v37 = *v38;
    v37[1] = v38[1];
    unint64_t v56 = ((unint64_t)v37 + v44) & v43;
    unint64_t v57 = v45;
    unint64_t v58 = ((unint64_t)v38 + v44) & v43;
    uint64_t v59 = *(void (**)(unint64_t, unint64_t, uint64_t))(v30 + 16);
    swift_bridgeObjectRetain();
    v59(v56, v58, v81);
    *(void *)((v79 + v56) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v79 + v58) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v60 = (v57 + v56) & v80;
    unint64_t v61 = (v57 + v58) & v80;
    uint64_t v62 = *(void (**)(unint64_t, unint64_t, uint64_t))(v34 + 16);
    swift_bridgeObjectRetain();
    v62(v60, v61, v82);
    uint64_t v63 = (void *)((v46 + v60) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v64 = (void *)((v46 + v61) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v63 = *v64;
    v63[1] = v64[1];
    swift_bridgeObjectRetain();
    return a1;
  }
  unint64_t v51 = v37;
  unint64_t v52 = v38;
LABEL_19:
  memcpy(v51, v52, v47);
  return a1;
}

_OWORD *sub_1BFA04258(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = sub_1BFA16988();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  unint64_t v56 = a1;
  uint64_t v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 32) + 7;
  uint64_t v13 = (_OWORD *)((v12 + v10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (_OWORD *)((v12 + v11) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  uint64_t v15 = (_OWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (_OWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  long long v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  unint64_t v18 = (_OWORD *)(((unint64_t)v15 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v19 = (_OWORD *)(((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v18 = *v19;
  unint64_t v20 = (void *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v21 = (void *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v21 = *v20;
  unint64_t v22 = ((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = ((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  long long v24 = *(_OWORD *)v23;
  long long v25 = *(_OWORD *)(v23 + 16);
  *(unsigned char *)(v22 + 32) = *(unsigned char *)(v23 + 32);
  *(_OWORD *)unint64_t v22 = v24;
  *(_OWORD *)(v22 + 16) = v25;
  uint64_t v26 = *(void *)(a3 + 16);
  uint64_t v27 = *(void *)(a3 + 24);
  uint64_t v28 = *(void *)(v26 - 8);
  uint64_t v29 = *(_DWORD *)(v28 + 80) & 0xF8;
  uint64_t v30 = v29 | 7;
  uint64_t v31 = *(void *)(v27 - 8);
  uint64_t v32 = *(unsigned __int8 *)(v31 + 80);
  uint64_t v33 = (v32 | v29 | 7) + 33;
  uint64_t v34 = (_OWORD *)((v33 + v22) & ~(v32 | v29 | 7));
  uint64_t v35 = (void *)((v33 + v23) & ~(v32 | v29 | 7));
  if (*(_DWORD *)(v28 + 84) <= 0x7FFFFFFFu) {
    unsigned int v36 = 0x7FFFFFFF;
  }
  else {
    unsigned int v36 = *(_DWORD *)(v28 + 84);
  }
  uint64_t v37 = *(unsigned int *)(v31 + 84);
  if (v37 <= v36) {
    unsigned int v38 = v36;
  }
  else {
    unsigned int v38 = *(_DWORD *)(v31 + 84);
  }
  uint64_t v39 = ~v30;
  uint64_t v40 = v29 + 23;
  uint64_t v41 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + 7;
  unint64_t v42 = (v41 & 0xFFFFFFFFFFFFFFF8) + v32 + 8;
  uint64_t v43 = *(void *)(*(void *)(v27 - 8) + 64);
  uint64_t v54 = v26;
  uint64_t v55 = v27;
  uint64_t v53 = ~v32;
  if (v38 == 0x7FFFFFFF)
  {
    unint64_t v44 = v35[1];
    if (v44 >= 0xFFFFFFFF) {
      LODWORD(v44) = -1;
    }
    uint64_t v45 = v43 + 7;
    if (v44 != -1) {
      goto LABEL_11;
    }
LABEL_16:
    *uint64_t v34 = *(_OWORD *)v35;
    unint64_t v48 = ((unint64_t)v34 + v40) & v39;
    unint64_t v49 = ((unint64_t)v35 + v40) & v39;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v28 + 32))(v48, v49, v54);
    *(void *)((v41 + v48) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v41 + v49) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v50 = (v42 + v49) & v53;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v31 + 32))((v42 + v48) & v53, v50, v55);
    *(_OWORD *)((v45 + ((v42 + v48) & v53)) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v45 + v50) & 0xFFFFFFFFFFFFFFF8);
    return v56;
  }
  unint64_t v52 = v34;
  unint64_t v46 = ((unint64_t)v35 + v40) & v39;
  if (v36 >= v37) {
    int v47 = (*(uint64_t (**)(unint64_t))(v28 + 48))(v46);
  }
  else {
    int v47 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v31 + 48))((v42 + v46) & ~v32, v37, v27);
  }
  uint64_t v34 = v52;
  uint64_t v39 = ~v30;
  uint64_t v45 = v43 + 7;
  if (!v47) {
    goto LABEL_16;
  }
LABEL_11:
  memcpy(v34, v35, ((v45 + ((v42 + (v40 & ~v30)) & ~v32)) & 0xFFFFFFFFFFFFFFF8) + 16);
  return v56;
}

void *sub_1BFA045B4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_1BFA16988();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = ((unint64_t)a1 + v10 + 16) & ~v10;
  uint64_t v12 = ((unint64_t)a2 + v10 + 16) & ~v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v11, v12, v7);
  uint64_t v13 = *(void *)(v9 + 24) + 7;
  uint64_t v14 = (void *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRelease();
  unint64_t v16 = ((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8;
  long long v17 = (_OWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = *(void *)v16;
  long long v19 = v17[1];
  *(_OWORD *)unint64_t v16 = *v17;
  *(_OWORD *)(v16 + 16) = v19;
  sub_1BF972984(v18);
  unint64_t v20 = (void *)((v16 + 39) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v21 = (void *)(((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8);
  void *v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRelease();
  unint64_t v22 = (void *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v23 = (void *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v22 = *v23;
  swift_bridgeObjectRelease();
  unint64_t v24 = ((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = ((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8;
  long long v26 = *(_OWORD *)v25;
  long long v27 = *(_OWORD *)(v25 + 16);
  *(unsigned char *)(v24 + 32) = *(unsigned char *)(v25 + 32);
  *(_OWORD *)unint64_t v24 = v26;
  *(_OWORD *)(v24 + 16) = v27;
  uint64_t v76 = *(void *)(a3 + 16);
  uint64_t v77 = *(void *)(a3 + 24);
  uint64_t v28 = *(void *)(v76 - 8);
  uint64_t v29 = *(_DWORD *)(v28 + 80) & 0xF8;
  uint64_t v30 = v29 | 7;
  uint64_t v31 = *(void *)(v77 - 8);
  uint64_t v32 = v31;
  uint64_t v33 = *(unsigned __int8 *)(v31 + 80);
  uint64_t v34 = (v33 | v29 | 7) + 33;
  uint64_t v35 = (void *)((v34 + v24) & ~(v33 | v29 | 7));
  unsigned int v36 = (void *)((v34 + v25) & ~(v33 | v29 | 7));
  uint64_t v37 = *(unsigned int *)(v28 + 84);
  if (v37 <= 0x7FFFFFFF) {
    unsigned int v38 = 0x7FFFFFFF;
  }
  else {
    unsigned int v38 = *(_DWORD *)(v28 + 84);
  }
  uint64_t v39 = *(unsigned int *)(v31 + 84);
  if (v39 <= v38) {
    unsigned int v40 = v38;
  }
  else {
    unsigned int v40 = *(_DWORD *)(v31 + 84);
  }
  uint64_t v41 = ~v30;
  uint64_t v42 = v29 + 23;
  uint64_t v74 = *(void *)(*(void *)(v76 - 8) + 64) + 7;
  uint64_t v75 = ~v33;
  unint64_t v43 = (v74 & 0xFFFFFFFFFFFFFFF8) + v33 + 8;
  uint64_t v44 = *(void *)(v31 + 64) + 7;
  size_t v45 = ((v44 + ((v43 + ((v29 + 23) & ~v30)) & ~v33)) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v40 != 0x7FFFFFFF)
  {
    size_t __n = ((v44 + ((v43 + ((v29 + 23) & ~v30)) & ~v33)) & 0xFFFFFFFFFFFFFFF8) + 16;
    __src = (void *)((v34 + v25) & ~(v33 | v29 | 7));
    unint64_t v50 = ((unint64_t)v35 + v42) & v41;
    unint64_t v70 = ((unint64_t)v36 + v42) & v41;
    if (v38 >= v39)
    {
      unint64_t v52 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v28 + 48);
      int v69 = v52(v50, v37, v76);
      int v47 = v52(v70, v37, v76);
      unsigned int v36 = __src;
      size_t v45 = __n;
      if (v69) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v68 = ~v30;
      unint64_t v51 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v31 + 48);
      int v67 = v51((v43 + v50) & v75, v39, v77);
      int v47 = v51((v43 + v70) & v75, v39, v77);
      uint64_t v41 = v68;
      unsigned int v36 = __src;
      size_t v45 = __n;
      if (v67) {
        goto LABEL_17;
      }
    }
LABEL_11:
    if (!v47)
    {
      *uint64_t v35 = *v36;
      v35[1] = v36[1];
      unint64_t v58 = v36;
      swift_bridgeObjectRelease();
      unint64_t v59 = ((unint64_t)v35 + v42) & v41;
      unint64_t v60 = (unint64_t)v58 + v42;
      unint64_t v61 = v43;
      uint64_t v62 = v60 & v41;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v28 + 40))(v59, v60 & v41, v76);
      *(void *)((v74 + v59) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v74 + v62) & 0xFFFFFFFFFFFFFFF8);
      swift_bridgeObjectRelease();
      unint64_t v63 = (v61 + v62) & v75;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v32 + 40))((v61 + v59) & v75, v63, v77);
      uint64_t v64 = (void *)((v44 + ((v61 + v59) & v75)) & 0xFFFFFFFFFFFFFFF8);
      unint64_t v65 = (void *)((v44 + v63) & 0xFFFFFFFFFFFFFFF8);
      void *v64 = *v65;
      v64[1] = v65[1];
      swift_bridgeObjectRelease();
      return a1;
    }
    unint64_t v48 = v36;
    size_t __na = v45;
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v28 + 8))(((unint64_t)v35 + v42) & v41, v76);
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v32 + 8))((v43 + (((unint64_t)v35 + v42) & v41)) & v75, v77);
    swift_bridgeObjectRelease();
    unint64_t v49 = v35;
    unsigned int v36 = v48;
    size_t v45 = __na;
    goto LABEL_19;
  }
  unint64_t v46 = *(void *)(((v34 + v25) & ~(v33 | v29 | 7)) + 8);
  if (v46 >= 0xFFFFFFFF) {
    LODWORD(v46) = -1;
  }
  int v47 = v46 + 1;
  if (v35[1] >= 0xFFFFFFFFuLL) {
    goto LABEL_11;
  }
LABEL_17:
  if (!v47)
  {
    *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
    unint64_t v53 = ((unint64_t)v35 + v42) & v41;
    unint64_t v54 = (unint64_t)v36 + v42;
    unint64_t v55 = v43;
    unint64_t v56 = v54 & v41;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v28 + 32))(v53, v54 & v41, v76);
    *(void *)((v74 + v53) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v74 + v56) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v57 = (v55 + v56) & v75;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v32 + 32))((v55 + v53) & v75, v57, v77);
    *(_OWORD *)((v44 + ((v55 + v53) & v75)) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v44 + v57) & 0xFFFFFFFFFFFFFFF8);
    return a1;
  }
  unint64_t v49 = v35;
LABEL_19:
  memcpy(v49, v36, v45);
  return a1;
}

uint64_t sub_1BFA04B44(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = sub_1BFA16988();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  uint64_t v9 = *(void *)(a3 + 24);
  uint64_t v10 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v11 = v10;
  if (*(_DWORD *)(v10 + 84) <= 0x7FFFFFFFu) {
    unsigned int v12 = 0x7FFFFFFF;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(void *)(v9 - 8);
  uint64_t v14 = *(unsigned int *)(v13 + 84);
  uint64_t v15 = *(unsigned __int8 *)(v7 + 80);
  int v16 = *(_DWORD *)(v10 + 80);
  uint64_t v17 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v18 = *(void *)(v10 + 64);
  if (v14 <= v12) {
    unsigned int v19 = v12;
  }
  else {
    unsigned int v19 = *(_DWORD *)(v13 + 84);
  }
  if (v8 <= v19 - 1) {
    unsigned int v20 = v19 - 1;
  }
  else {
    unsigned int v20 = *(_DWORD *)(v7 + 84);
  }
  if (v20 <= 0x7FFFFFFF) {
    unsigned int v21 = 0x7FFFFFFF;
  }
  else {
    unsigned int v21 = v20;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v22 = v16 & 0xF8;
  uint64_t v23 = v22 | 7;
  uint64_t v24 = v17 | v23;
  uint64_t v25 = v22 + 23;
  unint64_t v26 = ((v18 + 7) & 0xFFFFFFFFFFFFFFF8) + v17 + 8;
  uint64_t v27 = *(void *)(*(void *)(v6 - 8) + 64) + 7;
  uint64_t v28 = (v17 | v23) + 33;
  int v29 = a2 - v21;
  if (a2 <= v21) {
    goto LABEL_34;
  }
  unint64_t v30 = ((*(void *)(*(void *)(v9 - 8) + 64) + ((v26 + (v25 & ~v23)) & ~v17) + 7) & 0xFFFFFFFFFFFFFFF8)
      + ((v28
        + ((((((((((v27 + ((v15 + 16) & ~v15)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v24)
      + 16;
  char v31 = 8 * v30;
  if (v30 <= 3)
  {
    unsigned int v34 = ((v29 + ~(-1 << v31)) >> v31) + 1;
    if (HIWORD(v34))
    {
      int v32 = *(_DWORD *)((char *)a1 + v30);
      if (!v32) {
        goto LABEL_34;
      }
      goto LABEL_24;
    }
    if (v34 > 0xFF)
    {
      int v32 = *(unsigned __int16 *)((char *)a1 + v30);
      if (!*(unsigned __int16 *)((char *)a1 + v30)) {
        goto LABEL_34;
      }
      goto LABEL_24;
    }
    if (v34 < 2)
    {
LABEL_34:
      if ((v20 & 0x80000000) != 0)
      {
        uint64_t v39 = ((unint64_t)a1 + v15 + 16) & ~v15;
        if (v8 == v21)
        {
          unsigned int v40 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
          return v40(v39, v8, v6);
        }
        else
        {
          if (v19 == 0x7FFFFFFF)
          {
            unint64_t v41 = *(void *)(((v28
                              + ((((((((((v27 + v39) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
                                  + 23) & 0xFFFFFFFFFFFFFFF8)
                                + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v24)
                            + 8);
            if (v41 >= 0xFFFFFFFF) {
              LODWORD(v41) = -1;
            }
            unsigned int v42 = v41 + 1;
          }
          else
          {
            unint64_t v43 = (v25
                 + ((v28
                   + ((((((((((v27 + v39) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
                       + 23) & 0xFFFFFFFFFFFFFFF8)
                     + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v24)) & ~v23;
            if (v12 >= v14) {
              unsigned int v42 = (*(uint64_t (**)(unint64_t))(v11 + 48))(v43);
            }
            else {
              unsigned int v42 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v13 + 48))((v26 + v43) & ~v17, v14, v9);
            }
          }
          if (v42 >= 2) {
            return v42 - 1;
          }
          else {
            return 0;
          }
        }
      }
      else
      {
        unint64_t v38 = *((void *)a1 + 1);
        if (v38 >= 0xFFFFFFFF) {
          LODWORD(v38) = -1;
        }
        return (v38 + 1);
      }
    }
  }
  int v32 = *((unsigned __int8 *)a1 + v30);
  if (!*((unsigned char *)a1 + v30)) {
    goto LABEL_34;
  }
LABEL_24:
  int v35 = (v32 - 1) << v31;
  if (v30 > 3) {
    int v35 = 0;
  }
  if (v30)
  {
    if (v30 <= 3) {
      int v36 = v30;
    }
    else {
      int v36 = 4;
    }
    switch(v36)
    {
      case 2:
        int v37 = *a1;
        break;
      case 3:
        int v37 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v37 = *(_DWORD *)a1;
        break;
      default:
        int v37 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v37 = 0;
  }
  return v21 + (v37 | v35) + 1;
}

void sub_1BFA04F40(_WORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = sub_1BFA16988();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  uint64_t v11 = *(void *)(a4 + 24);
  uint64_t v12 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v13 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) <= 0x7FFFFFFFu) {
    unsigned int v14 = 0x7FFFFFFF;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v12 + 84);
  }
  uint64_t v15 = *(void *)(v11 - 8);
  uint64_t v16 = *(unsigned int *)(v13 + 84);
  uint64_t v17 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v18 = *(void *)(*(void *)(v8 - 8) + 64);
  uint64_t v19 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  uint64_t v21 = *(void *)(v13 + 64);
  if (v16 <= v14) {
    unsigned int v22 = v14;
  }
  else {
    unsigned int v22 = *(_DWORD *)(v13 + 84);
  }
  if (v10 <= v22 - 1) {
    unsigned int v23 = v22 - 1;
  }
  else {
    unsigned int v23 = *(_DWORD *)(v9 + 84);
  }
  if (v23 <= 0x7FFFFFFF) {
    unsigned int v24 = 0x7FFFFFFF;
  }
  else {
    unsigned int v24 = v23;
  }
  uint64_t v25 = *(_DWORD *)(v12 + 80) & 0xF8;
  uint64_t v26 = v25 | 7;
  uint64_t v27 = v19 | v25 | 7;
  uint64_t v28 = v25 + 23;
  size_t v29 = ((v20 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  size_t v30 = v29 + v19;
  unint64_t v31 = ((v21 + ((v29 + v19 + ((v25 + 23) & ~(v25 | 7))) & ~v19) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  uint64_t v32 = v18 + 7;
  size_t v34 = ((v27
        + 33
        + ((((((((((v18 + 7 + ((v17 + 16) & ~v17)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v27)
      + v31;
  BOOL v35 = a3 >= v24;
  unsigned int v36 = a3 - v24;
  if (v36 != 0 && v35)
  {
    if (v34 <= 3)
    {
      unsigned int v42 = ((v36 + ~(-1 << (8 * v34))) >> (8 * v34)) + 1;
      if (HIWORD(v42))
      {
        int v37 = 4;
      }
      else if (v42 >= 0x100)
      {
        int v37 = 2;
      }
      else
      {
        int v37 = v42 > 1;
      }
    }
    else
    {
      int v37 = 1;
    }
  }
  else
  {
    int v37 = 0;
  }
  if (v24 < a2)
  {
    unsigned int v38 = ~v24 + a2;
    if (v34 < 4)
    {
      int v39 = (v38 >> (8 * v34)) + 1;
      if (v34)
      {
        int v43 = v38 & ~(-1 << (8 * v34));
        bzero(a1, v34);
        if (v34 == 3)
        {
          *a1 = v43;
          *((unsigned char *)a1 + 2) = BYTE2(v43);
        }
        else if (v34 == 2)
        {
          *a1 = v43;
        }
        else
        {
          *(unsigned char *)a1 = v43;
        }
      }
    }
    else
    {
      bzero(a1, v34);
      *(_DWORD *)a1 = v38;
      int v39 = 1;
    }
    switch(v37)
    {
      case 1:
        *((unsigned char *)a1 + v34) = v39;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v34) = v39;
        return;
      case 3:
        goto LABEL_71;
      case 4:
        *(_DWORD *)((char *)a1 + v34) = v39;
        return;
      default:
        return;
    }
  }
  uint64_t v41 = ~v19;
  switch(v37)
  {
    case 1:
      *((unsigned char *)a1 + v34) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)((char *)a1 + v34) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_71:
      __break(1u);
      JUMPOUT(0x1BFA05468);
    case 4:
      *(_DWORD *)((char *)a1 + v34) = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (!a2) {
        return;
      }
LABEL_33:
      if ((v23 & 0x80000000) == 0)
      {
        if ((a2 & 0x80000000) == 0)
        {
          *((void *)a1 + 1) = (a2 - 1);
          return;
        }
        uint64_t v49 = a2 ^ 0x80000000;
        goto LABEL_44;
      }
      uint64_t v44 = ((unint64_t)a1 + v17 + 16) & ~v17;
      if (v10 == v24)
      {
        size_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
        uint64_t v46 = a2;
        uint64_t v47 = v10;
        uint64_t v48 = v8;
LABEL_42:
        v45(v44, v46, v47, v48);
        return;
      }
      uint64_t v33 = v27 + 33;
      uint64_t v40 = ~v27;
      a1 = (_WORD *)((v27
                    + 33
                    + ((((((((((v32 + v44) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
                        + 23) & 0xFFFFFFFFFFFFFFF8)
                      + 15) & 0xFFFFFFFFFFFFFFF8)) & ~v27);
      unsigned int v50 = a2 + 1;
      if ((int)a2 + 1 > v22)
      {
        if (!v31) {
          return;
        }
        int v51 = a2 - v22;
        unint64_t v52 = (void *)((v33
                      + ((((((((((v32 + v44) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
                          + 23) & 0xFFFFFFFFFFFFFFF8)
                        + 15) & 0xFFFFFFFFFFFFFFF8)) & v40);
        size_t v29 = v31;
        goto LABEL_48;
      }
      if (a2 != -1)
      {
        if (v22 == 0x7FFFFFFF)
        {
          if ((v50 & 0x80000000) != 0)
          {
            uint64_t v49 = (a2 - 0x7FFFFFFF);
LABEL_44:
            *(void *)a1 = v49;
            *((void *)a1 + 1) = 0;
            return;
          }
          *(void *)(((v33
                      + ((((((((((v32 + v44) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
                          + 23) & 0xFFFFFFFFFFFFFFF8)
                        + 15) & 0xFFFFFFFFFFFFFFF8)) & v40)
                    + 8) = a2;
        }
        else
        {
          a1 = (_WORD *)(((unint64_t)a1 + v28) & ~v26);
          if (v14 < v16)
          {
            uint64_t v44 = ((unint64_t)a1 + v30) & v41;
            size_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
            uint64_t v46 = (a2 + 1);
            uint64_t v47 = v16;
            uint64_t v48 = v11;
            goto LABEL_42;
          }
          if (v50 <= v14)
          {
            unint64_t v53 = *(void (**)(_WORD *, void))(v12 + 56);
            v53(a1, (a2 + 1));
          }
          else if (v29)
          {
            int v51 = a2 - v14;
            unint64_t v52 = a1;
LABEL_48:
            bzero(v52, v29);
            *(_DWORD *)a1 = v51;
          }
        }
      }
      return;
  }
}

uint64_t type metadata accessor for JournalEntry()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1BFA054A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, long long *a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v51 = a5;
  uint64_t v52 = a8;
  uint64_t v49 = a2;
  uint64_t v50 = a4;
  uint64_t v48 = a1;
  uint64_t v43 = a13;
  uint64_t v41 = a12;
  uint64_t v17 = sub_1BFA169D8();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v40 = *a3;
  uint64_t v21 = *((void *)a3 + 2);
  uint64_t v22 = *((void *)a3 + 3);
  uint64_t v42 = *a6;
  long long v47 = *a7;
  uint64_t v23 = *((void *)a7 + 2);
  uint64_t v45 = *((void *)a7 + 3);
  uint64_t v46 = v23;
  int v44 = *((unsigned __int8 *)a7 + 32);
  sub_1BFA169C8();
  uint64_t v24 = sub_1BFA169A8();
  uint64_t v26 = v25;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  *a9 = v24;
  a9[1] = v26;
  uint64_t v53 = a10;
  uint64_t v54 = a11;
  uint64_t v27 = v41;
  uint64_t v28 = v43;
  uint64_t v55 = v41;
  uint64_t v56 = v43;
  size_t v29 = (int *)type metadata accessor for JournalEntry();
  sub_1BFA16978();
  size_t v30 = (uint64_t *)((char *)a9 + v29[14]);
  uint64_t v31 = v49;
  *size_t v30 = v48;
  v30[1] = v31;
  uint64_t v32 = (char *)a9 + v29[15];
  *(_OWORD *)uint64_t v32 = v40;
  *((void *)v32 + 2) = v21;
  *((void *)v32 + 3) = v22;
  uint64_t v33 = (uint64_t *)((char *)a9 + v29[16]);
  uint64_t v34 = v51;
  *uint64_t v33 = v50;
  v33[1] = v34;
  *(uint64_t *)((char *)a9 + v29[17]) = v42;
  BOOL v35 = (char *)a9 + v29[18];
  *(_OWORD *)BOOL v35 = v47;
  uint64_t v36 = v45;
  *((void *)v35 + 2) = v46;
  *((void *)v35 + 3) = v36;
  v35[32] = v44;
  int v37 = (char *)a9 + v29[19];
  uint64_t v53 = a10;
  uint64_t v54 = a11;
  uint64_t v55 = v27;
  uint64_t v56 = v28;
  type metadata accessor for AdRequest();
  uint64_t v38 = sub_1BFA17F48();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 32))(v37, v52, v38);
}

void ArticlePrerollAdContext.appData.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ArticlePrerollAdContext.userData.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 8);
  return swift_bridgeObjectRetain();
}

uint64_t ArticlePrerollAdContext.articleData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  char v3 = *(unsigned char *)(v1 + 32);
  char v4 = *(unsigned char *)(v1 + 33);
  uint64_t v5 = *(void *)(v1 + 40);
  uint64_t v6 = *(void *)(v1 + 48);
  uint64_t v7 = *(void *)(v1 + 56);
  uint64_t v8 = *(void *)(v1 + 64);
  uint64_t v10 = *(void *)(v1 + 72);
  uint64_t v9 = *(void *)(v1 + 80);
  uint64_t v11 = *(void *)(v1 + 88);
  *(void *)a1 = *(void *)(v1 + 16);
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 17) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t ArticlePrerollAdContext.channelData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 96);
  uint64_t v2 = *(void *)(v1 + 104);
  char v4 = *(unsigned char *)(v1 + 112);
  uint64_t v5 = *(void *)(v1 + 120);
  uint64_t v6 = *(void *)(v1 + 128);
  uint64_t v7 = *(void *)(v1 + 136);
  uint64_t v8 = *(void *)(v1 + 144);
  uint64_t v9 = *(void *)(v1 + 152);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

double ArticlePrerollAdContext.videoData.getter@<D0>(double *a1@<X8>)
{
  double result = *(double *)(v1 + 160);
  *a1 = result;
  return result;
}

void ArticlePrerollAdContext.placementData.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 168);
}

uint64_t ArticlePrerollAdContext.issueData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 184);
  __int16 v3 = *(_WORD *)(v1 + 192);
  *(void *)a1 = *(void *)(v1 + 176);
  *(void *)(a1 + 8) = v2;
  *(_WORD *)(a1 + 16) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t ArticlePrerollAdContext.sectionData.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 208);
  *a1 = *(void *)(v1 + 200);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t ArticlePrerollAdContext.feedData.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[27];
  uint64_t v3 = v1[28];
  uint64_t v4 = v1[29];
  uint64_t v5 = v1[30];
  uint64_t v6 = v1[31];
  uint64_t v7 = v1[32];
  uint64_t v8 = v1[33];
  uint64_t v9 = v1[34];
  uint64_t v10 = v1[35];
  uint64_t v11 = v1[36];
  uint64_t v12 = v1[37];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  a1[7] = v9;
  a1[8] = v10;
  a1[9] = v11;
  a1[10] = v12;
  return sub_1BF9C12F4(v2, v3);
}

uint64_t ArticlePrerollAdContext.groupData.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[38];
  uint64_t v3 = v1[39];
  uint64_t v4 = v1[40];
  uint64_t v5 = v1[41];
  uint64_t v6 = v1[42];
  uint64_t v7 = v1[43];
  uint64_t v8 = v1[44];
  uint64_t v9 = v1[45];
  uint64_t v10 = v1[46];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  a1[7] = v9;
  a1[8] = v10;
  return sub_1BF9C13C0(v2, v3);
}

void ArticlePrerollAdContext.referralData.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 376);
}

uint64_t ArticlePrerollAdContext.anfDocumentData.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 384);
  return swift_bridgeObjectRetain();
}

uint64_t ArticlePrerollAdContext.anfComponentData.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 392);
  return swift_bridgeObjectRetain();
}

void *ArticlePrerollAdContext.init(provider:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for AppAdData, v5, (uint64_t)&type metadata for AppAdData, v6);
  if (v2) {
    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for UserAdData, v7, (uint64_t)&type metadata for UserAdData, v8);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  swift_bridgeObjectRetain();
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for ArticleAdData, v9, (uint64_t)&type metadata for ArticleAdData, v10);
  uint64_t v73 = v85;
  char v47 = v85;
  __dst = a2;
  uint64_t v46 = v85;
  char v44 = BYTE1(v87);
  char v45 = v87;
  uint64_t v42 = v93;
  uint64_t v43 = v88;
  uint64_t v11 = a1[3];
  uint64_t v82 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  swift_bridgeObjectRetain();
  uint64_t v72 = v86;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for ChannelAdData, v11, (uint64_t)&type metadata for ChannelAdData, v82);
  uint64_t v68 = v90;
  uint64_t v69 = v94;
  uint64_t v70 = v91;
  uint64_t v71 = v89;
  uint64_t v67 = v92;
  uint64_t v40 = v85;
  char v39 = v87;
  uint64_t v38 = v88;
  uint64_t v12 = v91;
  uint64_t v13 = a1[3];
  uint64_t v14 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for VideoAdData, v13, (uint64_t)&type metadata for VideoAdData, v14);
  uint64_t v65 = v86;
  uint64_t v66 = v89;
  uint64_t v37 = v90;
  uint64_t v83 = v92;
  uint64_t v15 = v85;
  uint64_t v16 = a1[3];
  uint64_t v17 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v16);
  AdContextDataProviding.data<A>(for:)((uint64_t)&type metadata for PlacementAdData, v16, (uint64_t)&type metadata for PlacementAdData, v17);
  uint64_t v18 = a1[3];
  uint64_t v19 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v18);
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for IssueAdData, v18, (uint64_t)&type metadata for IssueAdData, v19);
  char v36 = v85;
  uint64_t v35 = v85;
  __int16 v34 = v87;
  uint64_t v20 = a1[3];
  uint64_t v21 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v20);
  swift_bridgeObjectRetain();
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for SectionAdData, v20, (uint64_t)&type metadata for SectionAdData, v21);
  uint64_t v64 = v86;
  uint64_t v22 = a1[3];
  uint64_t v23 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v22);
  swift_bridgeObjectRetain();
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for FeedAdData, v22, (uint64_t)&type metadata for FeedAdData, v23);
  uint64_t v63 = v86;
  uint64_t v33 = v85;
  uint64_t v59 = v85;
  uint64_t v60 = v87;
  uint64_t v56 = v86;
  uint64_t v57 = v88;
  uint64_t v58 = v90;
  uint64_t v61 = v89;
  uint64_t v62 = v91;
  uint64_t v24 = a1[3];
  uint64_t v77 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v24);
  uint64_t v55 = v95;
  uint64_t v80 = v93;
  uint64_t v81 = v94;
  uint64_t v79 = v92;
  sub_1BF9C12F4(v85, v86);
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for FeedGroupAdData, v24, (uint64_t)&type metadata for FeedGroupAdData, v77);
  uint64_t v53 = v86;
  uint64_t v54 = v87;
  uint64_t v78 = v88;
  uint64_t v31 = a1[3];
  uint64_t v48 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v31);
  uint64_t v50 = v93;
  uint64_t v51 = v92;
  uint64_t v52 = v85;
  uint64_t v74 = v89;
  uint64_t v75 = v91;
  uint64_t v76 = v90;
  sub_1BF9C13C0(v85, v86);
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for ReferralAdData, v31, (uint64_t)&type metadata for ReferralAdData, v48);
  char v25 = v85;
  uint64_t v26 = a1[3];
  uint64_t v27 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v26);
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for ANFDocumentAdData, v26, (uint64_t)&type metadata for ANFDocumentAdData, v27);
  uint64_t v28 = a1[3];
  uint64_t v29 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v28);
  uint64_t v49 = v85;
  swift_bridgeObjectRetain();
  AdContextDataProviding.dataIfPresent<A>(for:)((uint64_t)&type metadata for ANFComponentAdData, v28, (uint64_t)&type metadata for ANFComponentAdData, v29);
  uint64_t v32 = v140;
  LOBYTE(__src[0]) = v85;
  __src[1] = v85;
  __src[2] = v85;
  __src[3] = v86;
  LOWORD(__src[4]) = v87;
  __src[5] = v88;
  __src[6] = v89;
  __src[7] = v90;
  __src[8] = v91;
  __src[9] = v92;
  __src[10] = v93;
  __src[11] = v94;
  __src[12] = v85;
  __src[13] = v86;
  LOBYTE(__src[14]) = v87;
  __src[15] = v88;
  __src[16] = v89;
  __src[17] = v90;
  __src[18] = v91;
  __src[19] = v92;
  __src[20] = v85;
  LOBYTE(__src[21]) = v85;
  __src[22] = v85;
  __src[23] = v86;
  LOWORD(__src[24]) = v87;
  __src[25] = v85;
  __src[26] = v86;
  __src[27] = v85;
  __src[28] = v86;
  __src[29] = v87;
  __src[30] = v88;
  __src[31] = v89;
  __src[32] = v90;
  __src[33] = v91;
  __src[34] = v92;
  __src[35] = v93;
  __src[36] = v94;
  __src[37] = v95;
  __src[38] = v85;
  __src[39] = v86;
  __src[40] = v87;
  __src[41] = v88;
  __src[42] = v89;
  __src[43] = v90;
  __src[44] = v91;
  __src[45] = v92;
  __src[46] = v93;
  LOBYTE(__src[47]) = v85;
  __src[48] = v85;
  __src[49] = v140;
  sub_1BFA06934(__src);
  swift_bridgeObjectRelease();
  sub_1BF9C24F4(v52, v53);
  sub_1BF9C2578(v59, v56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(__dst, __src, 0x190uLL);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v85) = v47;
  uint64_t v86 = v73;
  uint64_t v87 = v46;
  uint64_t v88 = v72;
  LOBYTE(v89) = v45;
  BYTE1(v89) = v44;
  uint64_t v90 = v43;
  uint64_t v91 = v71;
  uint64_t v92 = v68;
  uint64_t v93 = v70;
  uint64_t v94 = v67;
  uint64_t v95 = v42;
  uint64_t v96 = v69;
  uint64_t v97 = v40;
  uint64_t v98 = v65;
  char v99 = v39;
  uint64_t v101 = v38;
  uint64_t v102 = v66;
  uint64_t v103 = v37;
  uint64_t v104 = v12;
  uint64_t v105 = v83;
  *(_DWORD *)((char *)&v85 + 1) = v146[0];
  HIDWORD(v85) = *(_DWORD *)((char *)v146 + 3);
  *(_DWORD *)((char *)&v89 + 2) = *(_DWORD *)&v144[7];
  HIWORD(v89) = v145;
  *(_DWORD *)uint64_t v100 = *(_DWORD *)v144;
  *(_DWORD *)&v100[3] = *(_DWORD *)&v144[3];
  uint64_t v106 = v15;
  char v107 = v36;
  *(_DWORD *)uint64_t v108 = *(_DWORD *)v143;
  *(_DWORD *)&v108[3] = *(_DWORD *)&v143[3];
  uint64_t v109 = v35;
  uint64_t v110 = v64;
  __int16 v111 = v34;
  __int16 v113 = v142;
  int v112 = *(_DWORD *)&v141[7];
  uint64_t v114 = v33;
  uint64_t v115 = v63;
  uint64_t v116 = v59;
  uint64_t v117 = v56;
  uint64_t v118 = v60;
  uint64_t v119 = v57;
  uint64_t v120 = v61;
  uint64_t v121 = v58;
  uint64_t v122 = v62;
  uint64_t v123 = v79;
  uint64_t v124 = v80;
  uint64_t v125 = v81;
  uint64_t v126 = v55;
  uint64_t v127 = v52;
  uint64_t v128 = v53;
  uint64_t v129 = v54;
  uint64_t v130 = v78;
  uint64_t v131 = v74;
  uint64_t v132 = v76;
  uint64_t v133 = v75;
  uint64_t v134 = v51;
  uint64_t v135 = v50;
  char v136 = v25;
  *(_DWORD *)uint64_t v137 = *(_DWORD *)v141;
  *(_DWORD *)&v137[3] = *(_DWORD *)&v141[3];
  uint64_t v138 = v49;
  uint64_t v139 = v32;
  return sub_1BFA06AF4(&v85);
}

void *sub_1BFA06934(void *a1)
{
  uint64_t v3 = a1[28];
  uint64_t v4 = a1[27];
  uint64_t v5 = a1[39];
  uint64_t v6 = a1[38];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BF9C12F4(v4, v3);
  sub_1BF9C13C0(v6, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1BFA06AF4(void *a1)
{
  uint64_t v3 = a1[28];
  uint64_t v4 = a1[27];
  uint64_t v5 = a1[39];
  uint64_t v6 = a1[38];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BF9C2578(v4, v3);
  sub_1BF9C24F4(v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BFA06CA0(char a1)
{
  uint64_t result = 0x61746144707061;
  switch(a1)
  {
    case 1:
      unsigned int v3 = 1919251317;
      return v3 | 0x6174614400000000;
    case 2:
      return 0x44656C6369747261;
    case 3:
      return 0x446C656E6E616863;
    case 4:
      uint64_t v4 = 0x446F65646976;
      goto LABEL_13;
    case 5:
      return 0x6E656D6563616C70;
    case 6:
      uint64_t v4 = 0x446575737369;
      goto LABEL_13;
    case 7:
      return 0x446E6F6974636573;
    case 8:
      unsigned int v3 = 1684366694;
      return v3 | 0x6174614400000000;
    case 9:
      uint64_t v4 = 0x4470756F7267;
LABEL_13:
      uint64_t result = v4 & 0xFFFFFFFFFFFFLL | 0x7461000000000000;
      break;
    case 10:
      uint64_t result = 0x6C61727265666572;
      break;
    case 11:
      uint64_t result = 0x6D75636F44666E61;
      break;
    case 12:
      uint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BFA06E40()
{
  return sub_1BFA06CA0(*v0);
}

uint64_t sub_1BFA06E48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BFA0A158(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BFA06E70(uint64_t a1)
{
  unint64_t v2 = sub_1BFA07704();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFA06EAC(uint64_t a1)
{
  unint64_t v2 = sub_1BFA07704();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t ArticlePrerollAdContext.encode(to:)(void *a1)
{
  sub_1BFA08958(0, &qword_1EA17A1D8, MEMORY[0x1E4FBBDE0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v19 - v6;
  char v8 = *v1;
  uint64_t v9 = *((void *)v1 + 1);
  uint64_t v63 = *((void *)v1 + 2);
  uint64_t v64 = v9;
  uint64_t v62 = *((void *)v1 + 3);
  int v61 = v1[32];
  int v58 = v1[33];
  uint64_t v57 = *((void *)v1 + 5);
  long long v10 = *((_OWORD *)v1 + 3);
  long long v59 = *((_OWORD *)v1 + 4);
  long long v60 = v10;
  uint64_t v56 = *((void *)v1 + 10);
  uint64_t v55 = *((void *)v1 + 11);
  uint64_t v48 = *((void *)v1 + 12);
  uint64_t v49 = *((void *)v1 + 13);
  int v50 = v1[112];
  uint64_t v53 = *((void *)v1 + 15);
  uint64_t v52 = *((void *)v1 + 16);
  uint64_t v51 = *((void *)v1 + 17);
  long long v54 = *((_OWORD *)v1 + 9);
  uint64_t v11 = *((void *)v1 + 20);
  int v47 = v1[168];
  uint64_t v44 = *((void *)v1 + 22);
  uint64_t v45 = *((void *)v1 + 23);
  int v46 = *((unsigned __int16 *)v1 + 96);
  uint64_t v42 = *((void *)v1 + 25);
  uint64_t v43 = *((void *)v1 + 26);
  uint64_t v31 = *((void *)v1 + 27);
  uint64_t v41 = *((void *)v1 + 28);
  uint64_t v40 = *((void *)v1 + 29);
  uint64_t v39 = *((void *)v1 + 30);
  uint64_t v38 = *((void *)v1 + 31);
  uint64_t v37 = *((void *)v1 + 32);
  uint64_t v36 = *((void *)v1 + 33);
  uint64_t v35 = *((void *)v1 + 34);
  uint64_t v34 = *((void *)v1 + 35);
  uint64_t v33 = *((void *)v1 + 36);
  uint64_t v32 = *((void *)v1 + 37);
  uint64_t v22 = *((void *)v1 + 38);
  uint64_t v30 = *((void *)v1 + 39);
  uint64_t v29 = *((void *)v1 + 40);
  uint64_t v28 = *((void *)v1 + 41);
  uint64_t v27 = *((void *)v1 + 42);
  uint64_t v26 = *((void *)v1 + 43);
  uint64_t v25 = *((void *)v1 + 44);
  uint64_t v24 = *((void *)v1 + 45);
  uint64_t v23 = *((void *)v1 + 46);
  int v21 = v1[376];
  uint64_t v12 = *((void *)v1 + 49);
  uint64_t v20 = *((void *)v1 + 48);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA07704();
  uint64_t v13 = v4;
  sub_1BFA18338();
  LOBYTE(v66) = v8;
  char v75 = 0;
  sub_1BF96022C();
  uint64_t v14 = v65;
  sub_1BFA18228();
  if (v14) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  char v15 = v61;
  uint64_t v17 = v62;
  uint64_t v16 = v63;
  uint64_t v65 = v12;
  uint64_t v66 = v64;
  char v75 = 1;
  sub_1BF960280();
  sub_1BFA18228();
  uint64_t v66 = v16;
  uint64_t v67 = v17;
  LOBYTE(v68) = v15;
  BYTE1(v68) = v58;
  uint64_t v69 = v57;
  long long v70 = v60;
  long long v71 = v59;
  uint64_t v72 = v56;
  uint64_t v73 = v55;
  char v75 = 2;
  sub_1BF964F50();
  sub_1BFA18228();
  uint64_t v66 = v48;
  uint64_t v67 = v49;
  LOBYTE(v68) = v50;
  uint64_t v69 = v53;
  *(void *)&long long v70 = v52;
  *((void *)&v70 + 1) = v51;
  long long v71 = v54;
  char v75 = 3;
  sub_1BF96D478();
  sub_1BFA18228();
  uint64_t v66 = v11;
  char v75 = 4;
  sub_1BF95A008();
  sub_1BFA18228();
  LOBYTE(v66) = v47;
  char v75 = 5;
  sub_1BF9602D4();
  sub_1BFA18228();
  uint64_t v66 = v44;
  uint64_t v67 = v45;
  LOWORD(v68) = v46;
  char v75 = 6;
  sub_1BF96D520();
  sub_1BFA181D8();
  uint64_t v66 = v42;
  uint64_t v67 = v43;
  char v75 = 7;
  sub_1BF96D574();
  sub_1BFA181D8();
  uint64_t v66 = v31;
  uint64_t v67 = v41;
  uint64_t v68 = v40;
  uint64_t v69 = v39;
  *(void *)&long long v70 = v38;
  *((void *)&v70 + 1) = v37;
  *(void *)&long long v71 = v36;
  *((void *)&v71 + 1) = v35;
  uint64_t v72 = v34;
  uint64_t v73 = v33;
  uint64_t v74 = v32;
  char v75 = 8;
  sub_1BF960328();
  sub_1BFA181D8();
  uint64_t v66 = v22;
  uint64_t v67 = v30;
  uint64_t v68 = v29;
  uint64_t v69 = v28;
  *(void *)&long long v70 = v27;
  *((void *)&v70 + 1) = v26;
  *(void *)&long long v71 = v25;
  *((void *)&v71 + 1) = v24;
  uint64_t v72 = v23;
  char v75 = 9;
  sub_1BF96D4CC();
  sub_1BFA181D8();
  LOBYTE(v66) = v21;
  char v75 = 10;
  sub_1BF96037C();
  sub_1BFA181D8();
  uint64_t v66 = v20;
  char v75 = 11;
  sub_1BF9858E4();
  sub_1BFA181D8();
  uint64_t v66 = v65;
  char v75 = 12;
  sub_1BF9C3438();
  sub_1BFA181D8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v13);
}

unint64_t sub_1BFA07704()
{
  unint64_t result = qword_1EA17A1E0;
  if (!qword_1EA17A1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A1E0);
  }
  return result;
}

void *ArticlePrerollAdContext.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_1BFA08958(0, &qword_1EA17A1E8, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v36 - v8;
  uint64_t v10 = a1[3];
  uint64_t v88 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v10);
  sub_1BFA07704();
  sub_1BFA18328();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
    return (void *)v84;
  }
  else
  {
    uint64_t v53 = a2;
    LOBYTE(v89[0]) = 0;
    sub_1BF9608C4();
    sub_1BFA181B8();
    int v11 = v90;
    LOBYTE(v89[0]) = 1;
    sub_1BF960918();
    sub_1BFA181B8();
    uint64_t v12 = v90;
    LOBYTE(v89[0]) = 2;
    sub_1BF964EFC();
    swift_bridgeObjectRetain();
    sub_1BFA181B8();
    uint64_t v77 = v12;
    uint64_t v52 = v90;
    uint64_t v13 = v91;
    int v50 = v92;
    int v51 = v11;
    int v49 = BYTE1(v92);
    uint64_t v14 = v94;
    uint64_t v75 = v96;
    uint64_t v76 = v95;
    uint64_t v15 = v97;
    uint64_t v47 = v98;
    uint64_t v48 = v93;
    uint64_t v16 = v99;
    LOBYTE(v89[0]) = 3;
    sub_1BF96E74C();
    uint64_t v74 = v13;
    swift_bridgeObjectRetain();
    uint64_t v72 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v73 = v16;
    swift_bridgeObjectRetain();
    sub_1BFA181B8();
    uint64_t v71 = v15;
    uint64_t v46 = v90;
    uint64_t v17 = v91;
    int v45 = v92;
    uint64_t v18 = v94;
    uint64_t v43 = v95;
    uint64_t v44 = v93;
    uint64_t v19 = v96;
    uint64_t v20 = v97;
    LOBYTE(v89[0]) = 4;
    sub_1BF959FB4();
    uint64_t v70 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BFA181B8();
    uint64_t v68 = v20;
    uint64_t v69 = v18;
    uint64_t v67 = v19;
    uint64_t v21 = v90;
    LOBYTE(v89[0]) = 5;
    sub_1BF96096C();
    sub_1BFA181B8();
    int v42 = v90;
    LOBYTE(v89[0]) = 6;
    sub_1BF96E7F4();
    sub_1BFA18168();
    uint64_t v41 = v90;
    uint64_t v22 = v91;
    int v40 = (unsigned __int16)v92;
    LOBYTE(v89[0]) = 7;
    sub_1BF96E848();
    swift_bridgeObjectRetain();
    sub_1BFA18168();
    uint64_t v66 = v22;
    uint64_t v23 = v90;
    uint64_t v24 = v91;
    LOBYTE(v89[0]) = 8;
    sub_1BF9609C0();
    swift_bridgeObjectRetain();
    sub_1BFA18168();
    uint64_t v87 = v24;
    uint64_t v25 = v46;
    LOBYTE(v89[0]) = 9;
    uint64_t v65 = v100;
    uint64_t v64 = v99;
    uint64_t v63 = v98;
    uint64_t v55 = v90;
    uint64_t v56 = v91;
    uint64_t v57 = v92;
    uint64_t v58 = v93;
    uint64_t v59 = v94;
    uint64_t v60 = v95;
    uint64_t v61 = v96;
    uint64_t v62 = v97;
    sub_1BF9C12F4(v90, v91);
    sub_1BF96E7A0();
    sub_1BFA18168();
    LOBYTE(v89[0]) = 10;
    uint64_t v78 = v98;
    uint64_t v84 = v90;
    uint64_t v85 = v94;
    uint64_t v80 = v91;
    uint64_t v81 = v92;
    uint64_t v82 = v93;
    uint64_t v83 = v95;
    uint64_t v86 = v96;
    uint64_t v79 = v97;
    sub_1BF9C13C0(v90, v91);
    sub_1BF960A14();
    sub_1BFA18168();
    int v39 = v90;
    LOBYTE(v89[0]) = 11;
    sub_1BF985890();
    sub_1BFA18168();
    uint64_t v26 = v90;
    char v145 = 12;
    sub_1BF9C47B8();
    uint64_t v54 = v26;
    swift_bridgeObjectRetain();
    sub_1BFA18168();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v38 = v146;
    LOBYTE(v89[0]) = v51;
    v89[1] = v77;
    v89[2] = v52;
    v89[3] = v74;
    LOBYTE(v89[4]) = v50;
    BYTE1(v89[4]) = v49;
    v89[5] = v48;
    v89[6] = v72;
    v89[7] = v76;
    v89[8] = v75;
    v89[9] = v71;
    v89[10] = v47;
    v89[11] = v73;
    v89[12] = v25;
    v89[13] = v70;
    LOBYTE(v89[14]) = v45;
    v89[15] = v44;
    v89[16] = v69;
    v89[17] = v43;
    v89[18] = v67;
    v89[19] = v68;
    v89[20] = v21;
    LOBYTE(v89[21]) = v42;
    v89[22] = v41;
    v89[23] = v66;
    LOWORD(v89[24]) = v40;
    uint64_t v37 = v23;
    v89[25] = v23;
    v89[26] = v87;
    v89[27] = v55;
    v89[28] = v56;
    v89[29] = v57;
    v89[30] = v58;
    v89[31] = v59;
    v89[32] = v60;
    v89[33] = v61;
    v89[34] = v62;
    v89[35] = v63;
    v89[36] = v64;
    v89[37] = v65;
    v89[38] = v84;
    uint64_t v27 = v80;
    v89[39] = v80;
    v89[40] = v81;
    v89[41] = v82;
    v89[42] = v85;
    v89[43] = v83;
    v89[44] = v86;
    v89[45] = v79;
    v89[46] = v78;
    LOBYTE(v89[47]) = v39;
    v89[48] = v54;
    v89[49] = v146;
    sub_1BFA06934(v89);
    swift_bridgeObjectRelease();
    sub_1BF9C24F4(v84, v27);
    sub_1BF9C2578(v55, v56);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v28 = v76;
    swift_bridgeObjectRelease();
    uint64_t v29 = v72;
    swift_bridgeObjectRelease();
    uint64_t v30 = v74;
    swift_bridgeObjectRelease();
    uint64_t v31 = v68;
    swift_bridgeObjectRelease();
    uint64_t v32 = v67;
    swift_bridgeObjectRelease();
    uint64_t v33 = v69;
    swift_bridgeObjectRelease();
    uint64_t v34 = v70;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy(v53, v89, 0x190uLL);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
    LOBYTE(v90) = v51;
    uint64_t v91 = v77;
    uint64_t v92 = v52;
    uint64_t v93 = v30;
    LOBYTE(v94) = v50;
    BYTE1(v94) = v49;
    uint64_t v95 = v48;
    uint64_t v96 = v29;
    uint64_t v97 = v28;
    uint64_t v98 = v75;
    uint64_t v99 = v71;
    uint64_t v100 = v47;
    uint64_t v101 = v73;
    uint64_t v102 = v46;
    uint64_t v103 = v34;
    char v104 = v45;
    uint64_t v106 = v44;
    uint64_t v107 = v33;
    uint64_t v108 = v43;
    uint64_t v109 = v32;
    uint64_t v110 = v31;
    *(_DWORD *)((char *)&v90 + 1) = v152[0];
    HIDWORD(v90) = *(_DWORD *)((char *)v152 + 3);
    *(_DWORD *)((char *)&v94 + 2) = *(_DWORD *)&v150[7];
    HIWORD(v94) = v151;
    *(_DWORD *)uint64_t v105 = *(_DWORD *)v150;
    *(_DWORD *)&v105[3] = *(_DWORD *)&v150[3];
    uint64_t v111 = v21;
    char v112 = v42;
    *(_DWORD *)__int16 v113 = *(_DWORD *)v149;
    *(_DWORD *)&v113[3] = *(_DWORD *)&v149[3];
    uint64_t v114 = v41;
    uint64_t v115 = v66;
    __int16 v116 = v40;
    __int16 v118 = v148;
    int v117 = *(_DWORD *)&v147[7];
    uint64_t v119 = v37;
    uint64_t v120 = v87;
    uint64_t v121 = v55;
    uint64_t v122 = v56;
    uint64_t v123 = v57;
    uint64_t v124 = v58;
    uint64_t v125 = v59;
    uint64_t v126 = v60;
    uint64_t v127 = v61;
    uint64_t v128 = v62;
    uint64_t v129 = v63;
    uint64_t v130 = v64;
    uint64_t v131 = v65;
    uint64_t v132 = v84;
    uint64_t v133 = v80;
    uint64_t v134 = v81;
    uint64_t v135 = v82;
    uint64_t v136 = v85;
    uint64_t v137 = v83;
    uint64_t v138 = v86;
    uint64_t v139 = v79;
    uint64_t v140 = v78;
    char v141 = v39;
    *(_DWORD *)__int16 v142 = *(_DWORD *)v147;
    *(_DWORD *)&v142[3] = *(_DWORD *)&v147[3];
    uint64_t v143 = v54;
    uint64_t v144 = v38;
    return sub_1BFA06AF4(&v90);
  }
}

void sub_1BFA08958(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BFA07704();
    unint64_t v7 = a3(a1, &type metadata for ArticlePrerollAdContext.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void *sub_1BFA089BC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return ArticlePrerollAdContext.init(provider:)(a1, a2);
}

void *sub_1BFA089D4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return ArticlePrerollAdContext.init(from:)(a1, a2);
}

uint64_t sub_1BFA089EC(void *a1)
{
  return ArticlePrerollAdContext.encode(to:)(a1);
}

id ArticlePrerollAdContext.newsSupplementalContext.getter()
{
  uint64_t v24 = *(unsigned __int8 *)(v0 + 32);
  uint64_t v25 = *(void *)(v0 + 16);
  int v16 = *(unsigned __int8 *)(v0 + 33);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v22 = *(void *)(v0 + 40);
  uint64_t v23 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v20 = *(void *)(v0 + 96);
  uint64_t v21 = *(void *)(v0 + 80);
  uint64_t v41 = *(void *)(v0 + 88);
  uint64_t v42 = *(void *)(v0 + 104);
  uint64_t v19 = *(unsigned __int8 *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 144);
  uint64_t v17 = *(void *)(v0 + 136);
  uint64_t v18 = *(void *)(v0 + 120);
  uint64_t v7 = *(void *)(v0 + 152);
  double v8 = *(double *)(v0 + 160);
  uint64_t v29 = *(void *)(v0 + 224);
  uint64_t v30 = *(void *)(v0 + 216);
  uint64_t v28 = *(void *)(v0 + 240);
  uint64_t v26 = *(void *)(v0 + 184);
  uint64_t v27 = *(void *)(v0 + 248);
  uint64_t v44 = *(void *)(v0 + 256);
  uint64_t v45 = *(void *)(v0 + 208);
  uint64_t v43 = *(void *)(v0 + 264);
  uint64_t v40 = *(void *)(v0 + 280);
  uint64_t v38 = *(void *)(v0 + 272);
  uint64_t v39 = *(void *)(v0 + 288);
  uint64_t v31 = *(void *)(v0 + 232);
  uint64_t v32 = *(void *)(v0 + 312);
  uint64_t v15 = *(void *)(v0 + 304);
  uint64_t v14 = *(void *)(v0 + 344);
  uint64_t v36 = *(void *)(v0 + 368);
  uint64_t v37 = *(void *)(v0 + 296);
  uint64_t v33 = *(unsigned __int8 *)(v0 + 376);
  uint64_t v34 = *(void *)(v0 + 384);
  uint64_t v35 = *(void *)(v0 + 392);
  id v9 = objc_msgSend(objc_allocWithZone((Class)sub_1BFA17678()), sel_init);
  sub_1BFA17668();
  sub_1BFA174E8();
  swift_bridgeObjectRetain_n();
  sub_1BFA17578();
  swift_bridgeObjectRelease();
  uint64_t v10 = 256;
  if (!v16) {
    uint64_t v10 = 0;
  }
  uint64_t v46 = v25;
  uint64_t v47 = v23;
  uint64_t v48 = v10 | v24;
  uint64_t v49 = v22;
  uint64_t v50 = v1;
  uint64_t v51 = v2;
  uint64_t v52 = v3;
  uint64_t v53 = v4;
  uint64_t v54 = v21;
  uint64_t v55 = v41;
  v57[0] = v20;
  v57[1] = v42;
  v57[2] = v19;
  v57[3] = v18;
  v57[4] = v5;
  v57[5] = v17;
  v57[6] = v6;
  v57[7] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BF9A870C((uint64_t)&v46, v57);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v26)
  {
    swift_bridgeObjectRetain_n();
    sub_1BFA17488();
    sub_1BFA17518();
    sub_1BFA17558();
    swift_bridgeObjectRelease();
  }
  if (v45 && v29)
  {
    if ((v28 & 1) != 0 || v31 >= 1) {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    sub_1BF9C12F4(v30, v29);
    sub_1BFA17588();
    sub_1BF9C2578(v30, v29);
    swift_bridgeObjectRelease();
  }
  uint64_t v46 = v30;
  uint64_t v47 = v29;
  uint64_t v48 = v31;
  uint64_t v49 = v28;
  uint64_t v50 = v27;
  uint64_t v51 = v44;
  uint64_t v52 = v43;
  uint64_t v53 = v38;
  uint64_t v54 = v40;
  uint64_t v55 = v39;
  uint64_t v56 = v37;
  sub_1BF9C12F4(v30, v29);
  sub_1BF9A859C((uint64_t)&v46);
  uint64_t v13 = v40;
  sub_1BF9C2578(v30, v29);
  if (v32)
  {
    swift_bridgeObjectRetain();
    sub_1BF9C13C0(v15, v32);
    sub_1BFA17408();
    swift_bridgeObjectRetain();
    sub_1BFA17438();
    swift_bridgeObjectRetain();
    sub_1BFA17448();
    swift_bridgeObjectRetain();
    sub_1BFA17378();
    objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v14, v36, v39, v37);
    sub_1BFA17478();
    uint64_t v13 = v36;
    sub_1BF9C24F4(v15, v32);
    id v11 = v9;
    switch(v33)
    {
      case 4:
        break;
      default:
        goto LABEL_14;
    }
  }
  else
  {
    id v11 = v9;
    switch(v33)
    {
      case 4:
        break;
      default:
LABEL_14:
        sub_1BFA174A8();
        sub_1BF960EE4();
        sub_1BFA17F18();
        sub_1BFA175E8();
        break;
    }
  }
  objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v8, v13);
  sub_1BFA174C8();
  if (v34)
  {
    swift_bridgeObjectRetain_n();
    sub_1BFA17628();
    swift_bridgeObjectRelease();
  }
  if (v35)
  {
    swift_bridgeObjectRetain_n();
    sub_1BFA17528();
    swift_bridgeObjectRelease();
  }
  return v11;
}

uint64_t ArticlePrerollAdContext.currentPromotableContentDepiction.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  char v13 = *(unsigned char *)(v0 + 33);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v12 = *(void *)(v0 + 40);
  uint64_t v7 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v9 = *(void *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 80);
  uint64_t v10 = *(void *)(v0 + 88);
  sub_1BFA17158();
  uint64_t v14 = v1;
  v15[0] = v2;
  v15[1] = v3;
  char v16 = v4;
  char v17 = v13;
  uint64_t v18 = v12;
  uint64_t v19 = v5;
  uint64_t v20 = v7;
  uint64_t v21 = v6;
  uint64_t v22 = v9;
  uint64_t v23 = v8;
  uint64_t v24 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_1BF9A548C(0, v15, (uint64_t)&v14, 104);
}

unint64_t sub_1BFA091B8(uint64_t a1)
{
  *(void *)(a1 + 24) = sub_1BFA091E8();
  unint64_t result = sub_1BFA0923C();
  *(void *)(a1 + 32) = result;
  return result;
}

unint64_t sub_1BFA091E8()
{
  unint64_t result = qword_1EBA7B210;
  if (!qword_1EBA7B210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA7B210);
  }
  return result;
}

unint64_t sub_1BFA0923C()
{
  unint64_t result = qword_1EBA7B208;
  if (!qword_1EBA7B208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA7B208);
  }
  return result;
}

uint64_t destroy for ArticlePrerollAdContext(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 224))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(a1 + 312))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ArticlePrerollAdContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v9 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v9;
  uint64_t v10 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v10;
  uint64_t v11 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v11;
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  uint64_t v12 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v12;
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  uint64_t v13 = *(void *)(a2 + 208);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = v13;
  uint64_t v28 = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v28)
  {
    long long v21 = *(_OWORD *)(a2 + 264);
    *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
    *(_OWORD *)(a1 + 264) = v21;
    *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
    *(void *)(a1 + 296) = *(void *)(a2 + 296);
    long long v22 = *(_OWORD *)(a2 + 232);
    *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
    *(_OWORD *)(a1 + 232) = v22;
    uint64_t v17 = *(void *)(a2 + 312);
    if (v17) {
      goto LABEL_3;
    }
LABEL_5:
    long long v23 = *(_OWORD *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
    *(_OWORD *)(a1 + 352) = v23;
    *(void *)(a1 + 368) = *(void *)(a2 + 368);
    long long v24 = *(_OWORD *)(a2 + 320);
    *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 320) = v24;
    goto LABEL_6;
  }
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v28;
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
  uint64_t v14 = *(void *)(a2 + 256);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = v14;
  uint64_t v15 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = v15;
  uint64_t v16 = *(void *)(a2 + 288);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = v16;
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v17 = *(void *)(a2 + 312);
  if (!v17) {
    goto LABEL_5;
  }
LABEL_3:
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = v17;
  uint64_t v18 = *(void *)(a2 + 328);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = v18;
  uint64_t v19 = *(void *)(a2 + 344);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  *(void *)(a1 + 344) = v19;
  uint64_t v20 = *(void *)(a2 + 360);
  *(void *)(a1 + 352) = *(void *)(a2 + 352);
  *(void *)(a1 + 360) = v20;
  *(void *)(a1 + 368) = *(void *)(a2 + 368);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_6:
  *(unsigned char *)(a1 + 376) = *(unsigned char *)(a2 + 376);
  uint64_t v25 = *(void *)(a2 + 384);
  uint64_t v26 = *(void *)(a2 + 392);
  *(void *)(a1 + 384) = v25;
  *(void *)(a1 + 392) = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ArticlePrerollAdContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(unsigned char *)(a1 + 193) = *(unsigned char *)(a2 + 193);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a1 + 216);
  uint64_t v5 = (_OWORD *)(a2 + 216);
  uint64_t v6 = *(void *)(a2 + 224);
  if (*(void *)(a1 + 224))
  {
    if (v6)
    {
      *(void *)(a1 + 216) = *(void *)(a2 + 216);
      *(void *)(a1 + 224) = *(void *)(a2 + 224);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 232) = *(void *)(a2 + 232);
      *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
      *(void *)(a1 + 248) = *(void *)(a2 + 248);
      *(void *)(a1 + 256) = *(void *)(a2 + 256);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 264) = *(void *)(a2 + 264);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 272) = *(void *)(a2 + 272);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 280) = *(void *)(a2 + 280);
      *(void *)(a1 + 288) = *(void *)(a2 + 288);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 296) = *(void *)(a2 + 296);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1BF983A30(a1 + 216);
      long long v7 = *(_OWORD *)(a2 + 232);
      *uint64_t v4 = *v5;
      *(_OWORD *)(a1 + 232) = v7;
      long long v9 = *(_OWORD *)(a2 + 264);
      long long v8 = *(_OWORD *)(a2 + 280);
      long long v10 = *(_OWORD *)(a2 + 248);
      *(void *)(a1 + 296) = *(void *)(a2 + 296);
      *(_OWORD *)(a1 + 264) = v9;
      *(_OWORD *)(a1 + 280) = v8;
      *(_OWORD *)(a1 + 248) = v10;
    }
  }
  else if (v6)
  {
    *(void *)(a1 + 216) = *(void *)(a2 + 216);
    *(void *)(a1 + 224) = *(void *)(a2 + 224);
    *(void *)(a1 + 232) = *(void *)(a2 + 232);
    *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
    *(void *)(a1 + 248) = *(void *)(a2 + 248);
    *(void *)(a1 + 256) = *(void *)(a2 + 256);
    *(void *)(a1 + 264) = *(void *)(a2 + 264);
    *(void *)(a1 + 272) = *(void *)(a2 + 272);
    *(void *)(a1 + 280) = *(void *)(a2 + 280);
    *(void *)(a1 + 288) = *(void *)(a2 + 288);
    *(void *)(a1 + 296) = *(void *)(a2 + 296);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v11 = *(_OWORD *)(a2 + 232);
    *uint64_t v4 = *v5;
    *(_OWORD *)(a1 + 232) = v11;
    long long v12 = *(_OWORD *)(a2 + 248);
    long long v13 = *(_OWORD *)(a2 + 264);
    long long v14 = *(_OWORD *)(a2 + 280);
    *(void *)(a1 + 296) = *(void *)(a2 + 296);
    *(_OWORD *)(a1 + 264) = v13;
    *(_OWORD *)(a1 + 280) = v14;
    *(_OWORD *)(a1 + 248) = v12;
  }
  uint64_t v15 = (_OWORD *)(a1 + 304);
  uint64_t v16 = (_OWORD *)(a2 + 304);
  uint64_t v17 = *(void *)(a2 + 312);
  if (*(void *)(a1 + 312))
  {
    if (v17)
    {
      *(void *)(a1 + 304) = *(void *)(a2 + 304);
      *(void *)(a1 + 312) = *(void *)(a2 + 312);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 320) = *(void *)(a2 + 320);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 328) = *(void *)(a2 + 328);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 336) = *(void *)(a2 + 336);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 344) = *(void *)(a2 + 344);
      *(void *)(a1 + 352) = *(void *)(a2 + 352);
      *(void *)(a1 + 360) = *(void *)(a2 + 360);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 368) = *(void *)(a2 + 368);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1BF983A84(a1 + 304);
      *uint64_t v15 = *v16;
      long long v19 = *(_OWORD *)(a2 + 336);
      long long v18 = *(_OWORD *)(a2 + 352);
      long long v20 = *(_OWORD *)(a2 + 320);
      *(void *)(a1 + 368) = *(void *)(a2 + 368);
      *(_OWORD *)(a1 + 336) = v19;
      *(_OWORD *)(a1 + 352) = v18;
      *(_OWORD *)(a1 + 320) = v20;
    }
  }
  else if (v17)
  {
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    *(void *)(a1 + 312) = *(void *)(a2 + 312);
    *(void *)(a1 + 320) = *(void *)(a2 + 320);
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
    *(void *)(a1 + 336) = *(void *)(a2 + 336);
    *(void *)(a1 + 344) = *(void *)(a2 + 344);
    *(void *)(a1 + 352) = *(void *)(a2 + 352);
    *(void *)(a1 + 360) = *(void *)(a2 + 360);
    *(void *)(a1 + 368) = *(void *)(a2 + 368);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    *uint64_t v15 = *v16;
    long long v21 = *(_OWORD *)(a2 + 320);
    long long v22 = *(_OWORD *)(a2 + 336);
    long long v23 = *(_OWORD *)(a2 + 352);
    *(void *)(a1 + 368) = *(void *)(a2 + 368);
    *(_OWORD *)(a1 + 336) = v22;
    *(_OWORD *)(a1 + 352) = v23;
    *(_OWORD *)(a1 + 320) = v21;
  }
  *(unsigned char *)(a1 + 376) = *(unsigned char *)(a2 + 376);
  *(void *)(a1 + 384) = *(void *)(a2 + 384);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy400_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x190uLL);
}

uint64_t assignWithTake for ArticlePrerollAdContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v8 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v9;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  uint64_t v10 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(unsigned char *)(a1 + 193) = *(unsigned char *)(a2 + 193);
  uint64_t v11 = *(void *)(a2 + 208);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = v11;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 224))
  {
    uint64_t v12 = *(void *)(a2 + 224);
    if (v12)
    {
      *(void *)(a1 + 216) = *(void *)(a2 + 216);
      *(void *)(a1 + 224) = v12;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 232) = *(void *)(a2 + 232);
      *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
      uint64_t v13 = *(void *)(a2 + 256);
      *(void *)(a1 + 248) = *(void *)(a2 + 248);
      *(void *)(a1 + 256) = v13;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 264) = *(void *)(a2 + 264);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 272) = *(void *)(a2 + 272);
      swift_bridgeObjectRelease();
      uint64_t v14 = *(void *)(a2 + 288);
      *(void *)(a1 + 280) = *(void *)(a2 + 280);
      *(void *)(a1 + 288) = v14;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 296) = *(void *)(a2 + 296);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_1BF983A30(a1 + 216);
  }
  long long v15 = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 264) = v15;
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  long long v16 = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = v16;
LABEL_6:
  if (!*(void *)(a1 + 312))
  {
LABEL_10:
    long long v18 = *(_OWORD *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
    *(_OWORD *)(a1 + 352) = v18;
    *(void *)(a1 + 368) = *(void *)(a2 + 368);
    long long v19 = *(_OWORD *)(a2 + 320);
    *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
    *(_OWORD *)(a1 + 320) = v19;
    goto LABEL_11;
  }
  uint64_t v17 = *(void *)(a2 + 312);
  if (!v17)
  {
    sub_1BF983A84(a1 + 304);
    goto LABEL_10;
  }
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = v17;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 368) = *(void *)(a2 + 368);
  swift_bridgeObjectRelease();
LABEL_11:
  *(unsigned char *)(a1 + 376) = *(unsigned char *)(a2 + 376);
  *(void *)(a1 + 384) = *(void *)(a2 + 384);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArticlePrerollAdContext(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 400)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ArticlePrerollAdContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 392) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 400) = 1;
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
    *(unsigned char *)(result + 400) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArticlePrerollAdContext()
{
  return &type metadata for ArticlePrerollAdContext;
}

unsigned char *storeEnumTagSinglePayload for ArticlePrerollAdContext.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x1BFA0A018);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArticlePrerollAdContext.CodingKeys()
{
  return &type metadata for ArticlePrerollAdContext.CodingKeys;
}

unint64_t sub_1BFA0A054()
{
  unint64_t result = qword_1EA17A1F0;
  if (!qword_1EA17A1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A1F0);
  }
  return result;
}

unint64_t sub_1BFA0A0AC()
{
  unint64_t result = qword_1EA17A1F8;
  if (!qword_1EA17A1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A1F8);
  }
  return result;
}

unint64_t sub_1BFA0A104()
{
  unint64_t result = qword_1EA17A200;
  if (!qword_1EA17A200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A200);
  }
  return result;
}

uint64_t sub_1BFA0A158(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x61746144707061 && a2 == 0xE700000000000000;
  if (v2 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6174614472657375 && a2 == 0xE800000000000000 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x44656C6369747261 && a2 == 0xEB00000000617461 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x446C656E6E616863 && a2 == 0xEB00000000617461 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7461446F65646976 && a2 == 0xE900000000000061 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E656D6563616C70 && a2 == 0xED00006174614474 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7461446575737369 && a2 == 0xE900000000000061 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x446E6F6974636573 && a2 == 0xEB00000000617461 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6174614464656566 && a2 == 0xE800000000000000 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x74614470756F7267 && a2 == 0xE900000000000061 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6C61727265666572 && a2 == 0xEC00000061746144 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6D75636F44666E61 && a2 == 0xEF61746144746E65 || (sub_1BFA18258() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000001BFA25F00)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    char v6 = sub_1BFA18258();
    swift_bridgeObjectRelease();
    if (v6) {
      return 12;
    }
    else {
      return 13;
    }
  }
}

uint64_t sub_1BFA0A740(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1BFA0A784(uint64_t *a1, uint64_t a2)
{
  int v3 = v2;
  sub_1BF95AF24();
  uint64_t v7 = (uint64_t *)((char *)a1 + *(int *)(v6 + 56));
  uint64_t v8 = v7[1];
  uint64_t v21 = *v7;
  uint64_t v9 = a1[6];
  uint64_t v22 = a1[5];
  uint64_t v11 = *a1;
  uint64_t v10 = a1[1];
  type metadata accessor for DebugLifecycleMetricsHelper();
  uint64_t v12 = swift_allocObject();
  long long v24 = &type metadata for DebugSponsorshipAdContentInfo;
  uint64_t v25 = &off_1F1B1B840;
  uint64_t v13 = swift_allocObject();
  *(void *)&long long v23 = v13;
  *(void *)(v13 + 16) = v11;
  *(void *)(v13 + 24) = v10;
  *(void *)(v13 + 32) = v12;
  *(_WORD *)(v13 + 40) = 0;
  *(unsigned char *)(v13 + 42) = 0;
  *(_OWORD *)(v13 + 48) = xmmword_1BFA1A990;
  uint64_t v14 = v3[6];
  uint64_t v15 = v3[7];
  __swift_project_boxed_opaque_existential_1(v3 + 3, v14);
  long long v16 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v17 = v16(v14, v15);
  v26[0] = v21;
  v26[1] = v8;
  _OWORD v26[2] = v21;
  v26[3] = v8;
  v26[4] = v22;
  v26[5] = v9;
  v26[6] = a2;
  sub_1BF95BCD0(&v23, (uint64_t)v27);
  v27[5] = v17;
  char v28 = 0;
  swift_retain();
  sub_1BFA16B48();
  uint64_t v18 = swift_release();
  if (*(float *)&v23 <= 0.0)
  {
    sub_1BF9E55B8((uint64_t)v26, (uint64_t)&v23);
    sub_1BF95B9BC();
    swift_allocObject();
    uint64_t v19 = sub_1BFA170C8();
  }
  else
  {
    MEMORY[0x1F4188790](v18);
    sub_1BF95B9BC();
    swift_allocObject();
    uint64_t v19 = sub_1BFA170D8();
  }
  sub_1BF95C1A0((uint64_t)v26);
  return v19;
}

uint64_t sub_1BFA0A9D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v25 = a6;
  uint64_t v26 = a1;
  uint64_t v7 = sub_1BFA179B8();
  uint64_t v30 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_1BFA179F8();
  uint64_t v28 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1BFA17A18();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  long long v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v24 - v17;
  sub_1BF973CEC();
  uint64_t v27 = sub_1BFA17E98();
  sub_1BFA17A08();
  swift_retain();
  sub_1BFA16B48();
  swift_release();
  MEMORY[0x1C18B7A10](v16, v32[0]);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v13 + 8);
  v19(v16, v12);
  sub_1BF9E55B8(v25, (uint64_t)v32);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v26;
  *(void *)(v20 + 24) = a2;
  sub_1BFA0AF44((uint64_t)v32, v20 + 32);
  aBlock[4] = sub_1BFA0AFA0;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BFA0A740;
  aBlock[3] = &block_descriptor_10;
  uint64_t v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_1BFA179D8();
  *(void *)uint64_t v32 = MEMORY[0x1E4FBC860];
  sub_1BF959A18((unint64_t *)&qword_1EBA794C0, MEMORY[0x1E4FBCB00]);
  sub_1BF9599C0();
  sub_1BF959A18((unint64_t *)&qword_1EBA794E8, (void (*)(uint64_t))sub_1BF9599C0);
  sub_1BFA17F78();
  uint64_t v22 = (void *)v27;
  MEMORY[0x1C18B7E50](v18, v11, v9, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v29);
  return ((uint64_t (*)(char *, uint64_t))v19)(v18, v12);
}

uint64_t sub_1BFA0AE0C()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return MEMORY[0x1F4186488](v0, 64, 7);
}

uint64_t type metadata accessor for DebugSponsorshipAdProvider()
{
  return self;
}

uint64_t sub_1BFA0AE70(uint64_t *a1, uint64_t a2)
{
  return sub_1BFA0A784(a1, a2);
}

uint64_t sub_1BFA0AE94()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BFA0AED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BFA0A9D8(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_1BFA0AEDC()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);

  return swift_deallocObject();
}

uint64_t sub_1BFA0AF44(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1BFA0AFA0()
{
  return (*(uint64_t (**)(uint64_t))(v0 + 16))(v0 + 32);
}

uint64_t dispatch thunk of AdProviderFactoryType.createAdProvider<A, B>(for:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 24))();
}

uint64_t DebugAdContentInfo.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DebugAdContentInfo.metricsHelper.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t DebugAdContentInfo.isDownloadable.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t DebugAdContentInfo.isDownloadable.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

uint64_t (*DebugAdContentInfo.isDownloadable.modify())()
{
  return nullsub_1;
}

uint64_t DebugAdContentInfo.isInteractive.getter()
{
  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t DebugAdContentInfo.isInteractive.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 25) = result;
  return result;
}

uint64_t (*DebugAdContentInfo.isInteractive.modify())()
{
  return nullsub_1;
}

uint64_t DebugAdContentInfo.isVideo.getter()
{
  return *(unsigned __int8 *)(v0 + 26);
}

uint64_t DebugAdContentInfo.isVideo.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 26) = result;
  return result;
}

uint64_t (*DebugAdContentInfo.isVideo.modify())()
{
  return nullsub_1;
}

uint64_t DebugAdContentInfo.unfilledReason.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t DebugAdContentInfo.unfilledReason.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*DebugAdContentInfo.unfilledReason.modify())()
{
  return nullsub_1;
}

uint64_t initializeWithCopy for DebugAdContentInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DebugAdContentInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
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

uint64_t assignWithTake for DebugAdContentInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DebugAdContentInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DebugAdContentInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DebugAdContentInfo()
{
  return &type metadata for DebugAdContentInfo;
}

NewsAds::CreativeAdData __swiftcall CreativeAdData.init(creativeType:)(NewsAds::CreativeAdData creativeType)
{
  *uint64_t v1 = *(unsigned char *)creativeType.creativeType;
  return creativeType;
}

uint64_t sub_1BFA0B2E4()
{
  return sub_1BFA18318();
}

uint64_t sub_1BFA0B430()
{
  return sub_1BFA18318();
}

NewsAds::CreativeType_optional __swiftcall CreativeType.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_1BFA18148();
  result.value = swift_bridgeObjectRelease();
  char v5 = 8;
  if (v3 < 8) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

uint64_t CreativeType.rawValue.getter()
{
  uint64_t result = 7958113;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x656E6E6142796E61;
      break;
    case 2:
      uint64_t result = 0x647261646E617473;
      break;
    case 3:
      uint64_t result = 0x656C62756F64;
      break;
    case 4:
      uint64_t result = 0x656772616CLL;
      break;
    case 5:
      uint64_t result = 0x65526D756964656DLL;
      break;
    case 6:
      uint64_t result = 0x65766974616ELL;
      break;
    case 7:
      uint64_t result = 0x65726F736E6F7073;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BFA0B6D0(unsigned __int8 *a1, char *a2)
{
  return sub_1BF9A6748(*a1, *a2);
}

uint64_t sub_1BFA0B6DC()
{
  return sub_1BFA0B2E4();
}

uint64_t sub_1BFA0B6E8()
{
  return sub_1BFA0C3B0();
}

uint64_t sub_1BFA0B6F0()
{
  return sub_1BFA0B2E4();
}

NewsAds::CreativeType_optional sub_1BFA0B6F8(Swift::String *a1)
{
  return CreativeType.init(rawValue:)(*a1);
}

void sub_1BFA0B704(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE300000000000000;
  uint64_t v3 = 7958113;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE900000000000072;
      uint64_t v3 = 0x656E6E6142796E61;
      goto LABEL_3;
    case 2:
      *a1 = 0x647261646E617473;
      a1[1] = 0xE800000000000000;
      break;
    case 3:
      *a1 = 0x656C62756F64;
      a1[1] = 0xE600000000000000;
      break;
    case 4:
      *a1 = 0x656772616CLL;
      a1[1] = 0xE500000000000000;
      break;
    case 5:
      *a1 = 0x65526D756964656DLL;
      a1[1] = 0xEF656C676E617463;
      break;
    case 6:
      *a1 = 0x65766974616ELL;
      a1[1] = 0xE600000000000000;
      break;
    case 7:
      *a1 = 0x65726F736E6F7073;
      a1[1] = 0xE900000000000064;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_1BFA0B824()
{
  return sub_1BFA17C98();
}

uint64_t sub_1BFA0B884()
{
  return sub_1BFA17C58();
}

void CreativeAdData.creativeType.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1BFA0B8E0()
{
  return 0x6576697461657263;
}

uint64_t sub_1BFA0B900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6576697461657263 && a2 == 0xEC00000065707954)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1BFA18258();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1BFA0B9B0(uint64_t a1)
{
  unint64_t v2 = sub_1BFA0BB84();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFA0B9EC(uint64_t a1)
{
  unint64_t v2 = sub_1BFA0BB84();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t CreativeAdData.encode(to:)(void *a1)
{
  sub_1BFA0BDC4(0, &qword_1EA17A208, MEMORY[0x1E4FBBDE0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  char v7 = (char *)&v10 - v6;
  char v8 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA0BB84();
  sub_1BFA18338();
  char v11 = v8;
  sub_1BFA0BBD8();
  sub_1BFA18228();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1BFA0BB84()
{
  unint64_t result = qword_1EA17A210;
  if (!qword_1EA17A210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A210);
  }
  return result;
}

unint64_t sub_1BFA0BBD8()
{
  unint64_t result = qword_1EA17A218;
  if (!qword_1EA17A218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A218);
  }
  return result;
}

uint64_t CreativeAdData.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  sub_1BFA0BDC4(0, &qword_1EA17A220, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v11 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA0BB84();
  sub_1BFA18328();
  if (!v2)
  {
    sub_1BFA0BE28();
    sub_1BFA181B8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1BFA0BDC4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BFA0BB84();
    unint64_t v7 = a3(a1, &type metadata for CreativeAdData.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_1BFA0BE28()
{
  unint64_t result = qword_1EA17A228;
  if (!qword_1EA17A228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A228);
  }
  return result;
}

unint64_t sub_1BFA0BE80()
{
  unint64_t result = qword_1EA17A230;
  if (!qword_1EA17A230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A230);
  }
  return result;
}

unint64_t sub_1BFA0BED4(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1BF996BE4();
  unint64_t result = sub_1BF995F88();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BFA0BF04@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return CreativeAdData.init(from:)(a1, a2);
}

uint64_t sub_1BFA0BF1C(void *a1)
{
  return CreativeAdData.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for CreativeType()
{
  return &type metadata for CreativeType;
}

unsigned char *_s7NewsAds12CreativeTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x1BFA0C018);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CreativeAdData()
{
  return &type metadata for CreativeAdData;
}

unsigned char *storeEnumTagSinglePayload for CreativeAdData.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BFA0C0ECLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CreativeAdData.CodingKeys()
{
  return &type metadata for CreativeAdData.CodingKeys;
}

unint64_t sub_1BFA0C128()
{
  unint64_t result = qword_1EA17A238;
  if (!qword_1EA17A238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A238);
  }
  return result;
}

unint64_t sub_1BFA0C180()
{
  unint64_t result = qword_1EA17A240;
  if (!qword_1EA17A240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A240);
  }
  return result;
}

unint64_t sub_1BFA0C1D8()
{
  unint64_t result = qword_1EA17A248;
  if (!qword_1EA17A248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A248);
  }
  return result;
}

unint64_t sub_1BFA0C22C()
{
  unint64_t result = qword_1EA17A250;
  if (!qword_1EA17A250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A250);
  }
  return result;
}

uint64_t sub_1BFA0C280()
{
  sub_1BFA17BA8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BFA0C3B0()
{
  sub_1BFA17BA8();
  return swift_bridgeObjectRelease();
}

uint64_t AppAdData.ContentEnvironment.rawValue.getter()
{
  uint64_t result = 0x6E776F6E6B6E75;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x69746375646F7270;
      break;
    case 2:
      uint64_t result = 0x676E6967617473;
      break;
    case 3:
      uint64_t result = 24945;
      break;
    case 4:
      uint64_t result = 1953719668;
      break;
    case 5:
      uint64_t result = 0x6C65766564;
      break;
    case 6:
      uint64_t result = 0x786F62646E6173;
      break;
    case 7:
      uint64_t result = 0x316F6D6564;
      break;
    case 8:
      uint64_t result = 0x326F6D6564;
      break;
    default:
      return result;
  }
  return result;
}

NewsAds::AppAdData::ContentEnvironment_optional __swiftcall AppAdData.ContentEnvironment.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BFA18148();
  result.value = swift_bridgeObjectRelease();
  char v5 = 9;
  if (v3 < 9) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_1BFA0C640(unsigned __int8 *a1, char *a2)
{
  return sub_1BF9A5B14(*a1, *a2);
}

uint64_t sub_1BFA0C64C()
{
  return sub_1BFA18318();
}

uint64_t sub_1BFA0C694()
{
  return sub_1BFA0C280();
}

uint64_t sub_1BFA0C69C()
{
  return sub_1BFA18318();
}

NewsAds::AppAdData::ContentEnvironment_optional sub_1BFA0C6E0(Swift::String *a1)
{
  return AppAdData.ContentEnvironment.init(rawValue:)(*a1);
}

uint64_t sub_1BFA0C6EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AppAdData.ContentEnvironment.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BFA0C714()
{
  return sub_1BFA17C98();
}

uint64_t sub_1BFA0C774()
{
  return sub_1BFA17C58();
}

void AppAdData.contentEnvironment.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

NewsAds::AppAdData __swiftcall AppAdData.init(contentEnvironment:)(NewsAds::AppAdData contentEnvironment)
{
  *uint64_t v1 = *(unsigned char *)contentEnvironment.contentEnvironment;
  return contentEnvironment;
}

unint64_t sub_1BFA0C7DC()
{
  return 0xD000000000000012;
}

uint64_t sub_1BFA0C7F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BFA0D130(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1BFA0C824(uint64_t a1)
{
  unint64_t v2 = sub_1BFA0C9F8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFA0C860(uint64_t a1)
{
  unint64_t v2 = sub_1BFA0C9F8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AppAdData.encode(to:)(void *a1)
{
  sub_1BFA0CC38(0, &qword_1EA17A258, MEMORY[0x1E4FBBDE0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  unint64_t v7 = (char *)&v10 - v6;
  char v8 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA0C9F8();
  sub_1BFA18338();
  char v11 = v8;
  sub_1BFA0CA4C();
  sub_1BFA18228();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1BFA0C9F8()
{
  unint64_t result = qword_1EA17A260;
  if (!qword_1EA17A260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A260);
  }
  return result;
}

unint64_t sub_1BFA0CA4C()
{
  unint64_t result = qword_1EA17A268;
  if (!qword_1EA17A268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A268);
  }
  return result;
}

uint64_t AppAdData.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  sub_1BFA0CC38(0, &qword_1EA17A270, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v11 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA0C9F8();
  sub_1BFA18328();
  if (!v2)
  {
    sub_1BFA0CC9C();
    sub_1BFA181B8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1BFA0CC38(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BFA0C9F8();
    unint64_t v7 = a3(a1, &type metadata for AppAdData.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_1BFA0CC9C()
{
  unint64_t result = qword_1EA17A278;
  if (!qword_1EA17A278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A278);
  }
  return result;
}

unint64_t sub_1BFA0CCF4()
{
  unint64_t result = qword_1EA17A280;
  if (!qword_1EA17A280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A280);
  }
  return result;
}

unint64_t sub_1BFA0CD48(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1BF9608C4();
  unint64_t result = sub_1BF96022C();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BFA0CD78@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return AppAdData.init(from:)(a1, a2);
}

uint64_t sub_1BFA0CD90(void *a1)
{
  return AppAdData.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for AppAdData()
{
  return &type metadata for AppAdData;
}

uint64_t _s7NewsAds9AppAdDataV18ContentEnvironmentOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s7NewsAds9AppAdDataV18ContentEnvironmentOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x1BFA0CF1CLL);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppAdData.ContentEnvironment()
{
  return &type metadata for AppAdData.ContentEnvironment;
}

unsigned char *storeEnumTagSinglePayload for AppAdData.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BFA0CFF0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppAdData.CodingKeys()
{
  return &type metadata for AppAdData.CodingKeys;
}

unint64_t sub_1BFA0D02C()
{
  unint64_t result = qword_1EA17A288;
  if (!qword_1EA17A288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A288);
  }
  return result;
}

unint64_t sub_1BFA0D084()
{
  unint64_t result = qword_1EA17A290;
  if (!qword_1EA17A290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A290);
  }
  return result;
}

unint64_t sub_1BFA0D0DC()
{
  unint64_t result = qword_1EA17A298;
  if (!qword_1EA17A298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A298);
  }
  return result;
}

uint64_t sub_1BFA0D130(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x80000001BFA281E0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_1BFA18258();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_1BFA0D1B8()
{
  unint64_t result = qword_1EA17A2A0;
  if (!qword_1EA17A2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A2A0);
  }
  return result;
}

uint64_t sub_1BFA0D20C()
{
  uint64_t v1 = v0;
  *(unsigned char *)(v0 + 16) = 1;
  if (qword_1EBA796B0 != -1) {
    swift_once();
  }
  sub_1BF95BB7C();
  swift_allocObject();
  swift_retain();
  *(void *)(v0 + 24) = sub_1BFA16B68();
  swift_allocObject();
  swift_retain();
  *(void *)(v0 + 32) = sub_1BFA16B68();
  sub_1BF9BF284();
  swift_allocObject();
  swift_retain();
  *(void *)(v0 + 40) = sub_1BFA16B68();
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  char v2 = sub_1BFA16AF8();
  swift_release_n();
  *(unsigned char *)(v1 + 16) = v2 & 1;
  return v1;
}

uint64_t sub_1BFA0D398(char a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    *(unsigned char *)(result + 16) = a1 & 1;
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for DebugBannerAdProvider()
{
  return self;
}

uint64_t sub_1BFA0D414()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BFA0D44C(char a1)
{
  return sub_1BFA0D398(a1);
}

uint64_t sub_1BFA0D454(uint64_t a1)
{
  return sub_1BFA0D510(a1, (uint64_t)&unk_1F1B1C0B0, (uint64_t)sub_1BFA0E03C, (uint64_t)&block_descriptor_11);
}

void sub_1BFA0D47C(uint64_t a1, void *a2)
{
  char v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1BFA0D4E8(uint64_t a1)
{
  return sub_1BFA0D510(a1, (uint64_t)&unk_1F1B1C150, (uint64_t)sub_1BFA0E13C, (uint64_t)&block_descriptor_15);
}

uint64_t sub_1BFA0D510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = a4;
  v20[1] = a2;
  uint64_t v21 = a3;
  uint64_t v6 = sub_1BFA179B8();
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  int v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1BFA179F8();
  uint64_t v9 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1BFA169D8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v12);
  uint64_t v22 = *(void *)(v4 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v12);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v16 + v15, (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  aBlock[4] = v21;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BFA0A740;
  aBlock[3] = v23;
  uint64_t v17 = _Block_copy(aBlock);
  sub_1BFA179D8();
  uint64_t v26 = MEMORY[0x1E4FBC860];
  sub_1BFA0E06C((unint64_t *)&qword_1EBA794C0, MEMORY[0x1E4FBCB00]);
  uint64_t v18 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCB00];
  sub_1BFA0E0D4(0, (unint64_t *)&qword_1EBA794E0, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
  sub_1BFA0DFD4((unint64_t *)&qword_1EBA794E8, (unint64_t *)&qword_1EBA794E0, v18);
  sub_1BFA17F78();
  MEMORY[0x1C18B7E80](0, v11, v8, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v24);
  return swift_release();
}

void sub_1BFA0D8A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v17 = a5;
  uint64_t v8 = sub_1BFA169D8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = self;
  uint64_t v12 = (void *)sub_1BFA169B8();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v13, (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = a3;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BFA0D47C;
  aBlock[3] = a4;
  unint64_t v15 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v11, *v17, v12, v15);
  _Block_release(v15);
}

void sub_1BFA0DA60(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    if (qword_1EBA778A0 != -1) {
      swift_once();
    }
    id v3 = (id)qword_1EBA777C0;
    sub_1BFA17E38();
    sub_1BFA0E0D4(0, (unint64_t *)&qword_1EBA79640, (uint64_t (*)(uint64_t))sub_1BF95AAE0, MEMORY[0x1E4FBBE00]);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1BFA195C0;
    uint64_t v5 = sub_1BFA169A8();
    uint64_t v7 = v6;
    uint64_t v8 = MEMORY[0x1E4FBB1A0];
    *(void *)(v4 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v9 = sub_1BF95AB38();
    *(void *)(v4 + 64) = v9;
    *(void *)(v4 + 32) = v5;
    *(void *)(v4 + 40) = v7;
    swift_getErrorValue();
    uint64_t v10 = sub_1BFA182A8();
    *(void *)(v4 + 96) = v8;
    *(void *)(v4 + 104) = v9;
    *(void *)(v4 + 72) = v10;
    *(void *)(v4 + 80) = v11;
    sub_1BFA177B8();

    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_1EBA778A0 != -1) {
      swift_once();
    }
    uint64_t v12 = (void *)qword_1EBA777C0;
    sub_1BFA0E0D4(0, (unint64_t *)&qword_1EBA79640, (uint64_t (*)(uint64_t))sub_1BF95AAE0, MEMORY[0x1E4FBBE00]);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1BFA195D0;
    id v14 = v12;
    uint64_t v15 = sub_1BFA169A8();
    uint64_t v17 = v16;
    *(void *)(v13 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v13 + 64) = sub_1BF95AB38();
    *(void *)(v13 + 32) = v15;
    *(void *)(v13 + 40) = v17;
    sub_1BFA17E48();
    sub_1BFA177B8();

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1BFA0DCFC()
{
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for AdStatusConditionReporter()
{
  return self;
}

uint64_t sub_1BFA0DD58()
{
  uint64_t v0 = sub_1BFA17E88();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  id v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFA17E68();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = sub_1BFA179F8();
  MEMORY[0x1F4188790](v5 - 8);
  v10[1] = sub_1BF973CEC();
  sub_1BFA179C8();
  uint64_t v12 = MEMORY[0x1E4FBC860];
  sub_1BFA0E06C((unint64_t *)&unk_1EBA79540, MEMORY[0x1E4FBCC10]);
  uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FBCC10];
  sub_1BFA0E0D4(0, &qword_1EBA79510, MEMORY[0x1E4FBCC10], MEMORY[0x1E4FBB320]);
  sub_1BFA0DFD4((unint64_t *)&qword_1EBA79518, &qword_1EBA79510, v6);
  sub_1BFA17F78();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCC58], v0);
  uint64_t v7 = sub_1BFA17EB8();
  uint64_t v8 = v11;
  *(void *)(v11 + 16) = v7;
  return v8;
}

uint64_t sub_1BFA0DFD4(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1BFA0E0D4(255, a2, a3, MEMORY[0x1E4FBB320]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1BFA0E03C()
{
}

uint64_t sub_1BFA0E06C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1BFA0E0B8(void *a1)
{
}

void sub_1BFA0E0D4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_1BFA0E13C()
{
}

void sub_1BFA0E16C(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v9 = *(void *)(sub_1BFA169D8() - 8);
  sub_1BFA0D8A0(v4 + ((*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), a1, a2, a3, a4);
}

void sub_1BFA0E1FC(void *a1)
{
}

void sub_1BFA0E218(void *a1)
{
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.playbackReadyToStart()()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
  if (v1)
  {
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper), sel_mediaLoaded);
    uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata);
    objc_msgSend(v2, sel_naturalSize);
    float v4 = v3;
    objc_msgSend(v2, sel_naturalSize);
    *(float *)&double v5 = v5;
    *(float *)&double v6 = v4;
    objc_msgSend(v1, sel_videoChosenWithVideoWidth_videoHeight_, v6, v5);
  }
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.playbackStarted()()
{
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.playbackPaused()()
{
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.playbackResumed()()
{
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.playbackFinished()()
{
}

void VideoAdProviderMetricsHelper.playbackFailedWithError(_:)(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_diagnosticMetricsHelper);
  if (a1)
  {
    swift_getErrorValue();
    sub_1BFA182A8();
  }
  double v3 = (void *)sub_1BFA17B08();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_mediaPlaybackFailedWithReason_, v3);
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.enteredFullscreen()()
{
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.exitedFullscreen()()
{
}

const char **sub_1BFA0E454(const char **result, char a2)
{
  double v3 = *(void **)(v2 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
  if (v3)
  {
    double v5 = result;
    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata), sel_time);
    double v6 = *v5;
    return (const char **)objc_msgSend(v3, v6, a2 & 1);
  }
  return result;
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.muteStateChanged(_:)(Swift::Bool a1)
{
  if (!a1) {
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata), sel_volume);
  }
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
  if (v2)
  {
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata), sel_time);
    objc_msgSend(v2, sel_mediaVolumeChangedAtPosition_volume_);
  }
}

id VideoAdProviderMetricsHelper.playbackPassed(quartile:)(id result)
{
  if (result == (id)3)
  {
    uint64_t result = *(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
    if (!result) {
      return result;
    }
    uint64_t v2 = 75;
    return objc_msgSend(result, sel_mediaProgress_, v2);
  }
  if (result == (id)2)
  {
    uint64_t result = *(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
    if (!result) {
      return result;
    }
    uint64_t v2 = 50;
    return objc_msgSend(result, sel_mediaProgress_, v2);
  }
  if (result == (id)1)
  {
    uint64_t result = *(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
    if (result)
    {
      uint64_t v2 = 25;
      return objc_msgSend(result, sel_mediaProgress_, v2);
    }
  }
  return result;
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.tapped(toToggleControlVisibility:)(Swift::Bool toToggleControlVisibility)
{
  if (!toToggleControlVisibility)
  {
    uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
    if (v2)
    {
      objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata), sel_time);
      objc_msgSend(v2, sel_mediaShowControlsAtPosition_);
    }
  }
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.skipped()()
{
}

const char **sub_1BFA0E664(const char **result)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
  if (v2)
  {
    double v3 = result;
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata), sel_time);
    float v4 = *v3;
    return (const char **)[v2 v4];
  }
  return result;
}

Swift::Void __swiftcall VideoAdProviderMetricsHelper.willUnload()()
{
}

SEL *sub_1BFA0E6EC(SEL *result)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper)) {
    return (SEL *)[*(id *)(v1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper) *result];
  }
  return result;
}

id VideoAdProviderMetricsHelper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void VideoAdProviderMetricsHelper.init()()
{
}

id VideoAdProviderMetricsHelper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VideoAdProviderMetricsHelper()
{
  return self;
}

uint64_t method lookup function for VideoAdProviderMetricsHelper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for VideoAdProviderMetricsHelper);
}

void sub_1BFA0E9D8(char *a1, uint64_t a2, SEL *a3, char a4)
{
  float v4 = *(void **)&a1[OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper];
  if (v4)
  {
    uint64_t v7 = *(void **)&a1[OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata];
    unint64_t v8 = a1;
    objc_msgSend(v7, sel_time);
    objc_msgSend(v4, *a3, a4 & 1);
  }
}

void sub_1BFA0EBBC(char *a1, uint64_t a2, SEL *a3)
{
  double v3 = *(void **)&a1[OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper];
  if (v3)
  {
    double v5 = *(void **)&a1[OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata];
    double v6 = a1;
    objc_msgSend(v5, sel_time);
    [v3 *a3];
  }
}

id sub_1BFA0EC64(uint64_t a1, uint64_t a2, SEL *a3)
{
  id result = *(id *)(a1 + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
  if (result) {
    return [result *a3];
  }
  return result;
}

uint64_t VideoAdProviderFactory.prerollAdRequester.getter@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, char *))(*(void *)(*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)v1)
                                                                            + 0x58)
                                                                - 8)
                                                    + 16))(a1, &v1[*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)v1) + 0x90)]);
}

id VideoAdProviderFactory.__allocating_init(adManager:adRequestStore:journal:appConfigurationManager:prerollAdRequester:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v6 = v5;
  id v12 = objc_allocWithZone(v6);
  id v13 = sub_1BFA0FB88(a1, a2, a3, a4, a5);
  (*(void (**)(uint64_t))(*(void *)(*((void *)v6 + 11) - 8) + 8))(a5);
  return v13;
}

id VideoAdProviderFactory.init(adManager:adRequestStore:journal:appConfigurationManager:prerollAdRequester:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *MEMORY[0x1E4FBC8C8] & *v5;
  id v8 = sub_1BFA0FB88(a1, a2, a3, a4, a5);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v7 + 88) - 8) + 8))(a5);
  return v8;
}

id sub_1BFA0EE18(unint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  void (*v47)(void *__return_ptr, unint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v48;
  id v49;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  id v77;
  long long v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t (*v86)(void);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  unint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void v98[5];

  double v5 = v4;
  uint64_t v90 = a4;
  uint64_t v85 = a3;
  uint64_t v94 = a1;
  uint64_t v7 = *MEMORY[0x1E4FBC8C8] & *v4;
  uint64_t v8 = type metadata accessor for PrerollAdPlacement();
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v89 = (uint64_t)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v87 = (uint64_t)&v78 - v11;
  uint64_t v86 = (uint64_t (*)(void))type metadata accessor for PrerollAd();
  uint64_t v12 = MEMORY[0x1F4188790](v86);
  uint64_t v88 = (uint64_t)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v92 = (char *)&v78 - v14;
  uint64_t v15 = *(void *)(v7 + 96);
  uint64_t v97 = *(void *)(v7 + 80);
  v98[0] = v97;
  uint64_t v93 = v8;
  v98[1] = v8;
  uint64_t v96 = v15;
  v98[2] = v15;
  v98[3] = &protocol witness table for PrerollAdPlacement;
  uint64_t v16 = type metadata accessor for AdRequest();
  uint64_t v17 = sub_1BFA17F48();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  uint64_t v91 = (uint64_t)&v78 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  uint64_t v23 = (char *)&v78 - v22;
  uint64_t v24 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v26 = (char *)&v78 - v25;
  uint64_t v27 = *a2;
  uint64_t v28 = a2[1];
  LOBYTE(v98[0]) = 0;
  uint64_t v29 = v27;
  uint64_t v95 = (void *)v28;
  AdRequestStore.request(for:behavior:)(v27, v28, (unsigned __int8 *)v98, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v23, 1, v16) == 1)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v23, v17);
    if (qword_1EBA79730 != -1) {
      swift_once();
    }
    id v30 = (id)qword_1EBA79208;
    sub_1BFA17E38();
    sub_1BF95AA88();
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_1BFA195D0;
    uint64_t v33 = *a2;
    uint64_t v32 = a2[1];
    *(void *)(v31 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v31 + 64) = sub_1BF95AB38();
    *(void *)(v31 + 32) = v33;
    *(void *)(v31 + 4sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = v32;
    swift_bridgeObjectRetain();
    sub_1BFA177B8();

    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    uint64_t v82 = v18;
    uint64_t v80 = v17;
    uint64_t v81 = a2;
    uint64_t v83 = v24;
    uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    uint64_t v84 = v16;
    v34(v26, v23, v16);
    uint64_t v35 = (uint64_t *)v26;
    if (qword_1EBA79730 != -1) {
      swift_once();
    }
    id v36 = (id)qword_1EBA79208;
    sub_1BFA17E28();
    sub_1BF95AA88();
    uint64_t v38 = v37;
    uint64_t v39 = swift_allocObject();
    uint64_t v78 = xmmword_1BFA195C0;
    *(_OWORD *)(v39 + 16) = xmmword_1BFA195C0;
    uint64_t v40 = MEMORY[0x1E4FBB1A0];
    *(void *)(v39 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v41 = sub_1BF95AB38();
    uint64_t v79 = v29;
    *(void *)(v39 + 32) = v29;
    *(void *)(v39 + 4sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = v95;
    uint64_t v42 = *v35;
    uint64_t v43 = v35[1];
    *(void *)(v39 + 96) = v40;
    *(void *)(v39 + 104) = v41;
    *(void *)(v39 + 64) = v41;
    *(void *)(v39 + 72) = v42;
    *(void *)(v39 + 8sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = v43;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BFA177B8();

    swift_bridgeObjectRelease();
    uint64_t v44 = (void *)((char *)v5 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v5) + 0x70));
    uint64_t v45 = v44[3];
    uint64_t v46 = v44[4];
    __swift_project_boxed_opaque_existential_1(v44, v45);
    uint64_t v47 = *(void (**)(void *__return_ptr, unint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, _UNKNOWN **, _UNKNOWN **, uint64_t, uint64_t))(v46 + 24);
    uint64_t v48 = type metadata accessor for PrerollAdProvider();
    v47(v98, v94, v35, v97, v48, v93, v96, &protocol witness table for PrerollAdProvider, &protocol witness table for PrerollAdPlacement, v45, v46);
    uint64_t v93 = v38;
    uint64_t v94 = v41;
    uint64_t v51 = (void *)v98[0];
    uint64_t v52 = v87;
    sub_1BFA0FD4C((uint64_t)v81, v87, (uint64_t (*)(void))type metadata accessor for PrerollAdPlacement);
    uint64_t v53 = v51[5];
    uint64_t v54 = v51[6];
    uint64_t v95 = v51;
    __swift_project_boxed_opaque_existential_1(v51 + 2, v53);
    uint64_t v55 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v54 + 8))(v53, v54);
    uint64_t v56 = objc_msgSend(v55, sel_promotedContentVideo);

    uint64_t v57 = v92;
    sub_1BFA0FD4C(v52, (uint64_t)&v92[*((int *)v86 + 6)], (uint64_t (*)(void))type metadata accessor for PrerollAdPlacement);
    *uint64_t v57 = v56;
    uint64_t v58 = v56;
    uint64_t v59 = objc_msgSend(v58, sel_promotedContentInfo);
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = sub_1BFA17178();
      uint64_t v63 = v62;
    }
    else
    {

      uint64_t v61 = 0;
      uint64_t v63 = 0xE000000000000000;
    }
    uint64_t v64 = (void *)MEMORY[0x1E4FBC8C8];
    uint64_t v86 = (uint64_t (*)(void))type metadata accessor for PrerollAdPlacement;
    sub_1BFA0FDB4(v52, (uint64_t (*)(void))type metadata accessor for PrerollAdPlacement);
    uint64_t v65 = (uint64_t)v92;
    *((void *)v92 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = v61;
    *(void *)(v65 + 16) = v63;
    type metadata accessor for VideoAdInteractionPresentationHandler();
    uint64_t v91 = swift_allocObject();
    swift_unknownObjectUnownedInit();
    uint64_t v66 = *(id *)v65;
    swift_retain();
    sub_1BFA17758();

    uint64_t v67 = *(void *)((char *)v5 + *(void *)((*v64 & *v5) + 0x80));
    uint64_t v68 = v81;
    uint64_t v69 = *v81;
    uint64_t v70 = v81[1];
    Journal.addRequestedEntry(request:placementIdentifier:contentIdentifier:)((uint64_t)v35, *v81, v70, 0, 0);
    uint64_t v71 = (id)qword_1EBA79208;
    sub_1BFA17E28();
    uint64_t v72 = swift_allocObject();
    *(_OWORD *)(v72 + 16) = xmmword_1BFA195D0;
    uint64_t v73 = v94;
    *(void *)(v72 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v72 + 64) = v73;
    *(void *)(v72 + 32) = v69;
    *(void *)(v72 + 4sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = v70;
    swift_bridgeObjectRetain();
    sub_1BFA177B8();

    swift_bridgeObjectRelease();
    type metadata accessor for VideoAdProvider();
    uint64_t v74 = v88;
    sub_1BFA0FD4C(v65, v88, (uint64_t (*)(void))type metadata accessor for PrerollAd);
    uint64_t v75 = v89;
    sub_1BFA0FD4C((uint64_t)v68, v89, v86);
    uint64_t v76 = *(void **)((char *)v5 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v5) + 0x88));
    swift_retain();
    uint64_t v77 = objc_msgSend(v76, sel_possiblyUnfetchedAppConfiguration);
    sub_1BF95BBDC(v90, (uint64_t)v98);
    uint64_t v49 = sub_1BF9A3A28(v74, v75, v67, (uint64_t)v35, (uint64_t)v77, v91, (uint64_t)v98);
    swift_release();
    sub_1BFA0FDB4(v65, (uint64_t (*)(void))type metadata accessor for PrerollAd);
    (*(void (**)(uint64_t *, uint64_t))(v83 + 8))(v35, v84);
  }
  return v49;
}

id VideoAdProviderFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void VideoAdProviderFactory.init()()
{
}

void sub_1BFA0F978()
{
}

id VideoAdProviderFactory.__deallocating_deinit()
{
  long long v2 = *(_OWORD *)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x50);
  long long v3 = *(_OWORD *)((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60);
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for VideoAdProviderFactory();
  return objc_msgSendSuper2(&v4, sel_dealloc, v2, v3);
}

uint64_t sub_1BFA0FA5C(void *a1)
{
  long long v2 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v3 = *MEMORY[0x1E4FBC8C8] & *a1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1 + *(void *)(v3 + 0x70));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  objc_super v4 = (char *)a1 + *(void *)((*v2 & *a1) + 0x90);
  double v5 = *(uint64_t (**)(char *))(*(void *)(*(void *)(v3 + 88) - 8) + 8);
  return v5(v4);
}

id sub_1BFA0FB88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v12 = *MEMORY[0x1E4FBC8C8] & *(void *)v5;
  sub_1BF95BBDC(a1, (uint64_t)&v5[*(void *)(v12 + 0x70)]);
  *(void *)&v5[*(void *)((*v11 & *(void *)v5) + 0x78)] = a2;
  *(void *)&v5[*(void *)((*v11 & *(void *)v5) + 0x80)] = a3;
  *(void *)&v5[*(void *)((*v11 & *(void *)v5) + 0x88)] = a4;
  uint64_t v13 = *(void *)(v12 + 88);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(&v5[*(void *)((*v11 & *(void *)v5) + 0x90)], a5, v13);
  uint64_t v16 = *(void *)(v12 + 80);
  long long v17 = *(_OWORD *)(v12 + 96);
  v18.receiver = v5;
  v18.super_class = (Class)type metadata accessor for VideoAdProviderFactory();
  id v14 = objc_msgSendSuper2(&v18, sel_init, v16, v13, v17);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v14;
}

uint64_t sub_1BFA0FD4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BFA0FDB4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1BFA0FE14()
{
}

uint64_t type metadata accessor for VideoAdProviderFactory()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1BFA0FE5C()
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

uint64_t method lookup function for VideoAdProviderFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for VideoAdProviderFactory);
}

uint64_t dispatch thunk of VideoAdProviderFactory.__allocating_init(adManager:adRequestStore:journal:appConfigurationManager:prerollAdRequester:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of VideoAdProviderFactory.createVideoAdProvider(for:placement:videoPlayerViewController:videoAdTracker:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t InterstitialAdData.articlesSeenSinceLastInterstitial.getter()
{
  return *(void *)v0;
}

NewsAds::InterstitialAdData __swiftcall InterstitialAdData.init(articlesSeenSinceLastInterstitial:)(NewsAds::InterstitialAdData articlesSeenSinceLastInterstitial)
{
  v1->articlesSeenSinceLastInterstitial = articlesSeenSinceLastInterstitial.articlesSeenSinceLastInterstitial;
  return articlesSeenSinceLastInterstitial;
}

unint64_t sub_1BFA0FF84()
{
  return 0xD000000000000021;
}

uint64_t sub_1BFA0FFA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1BFA10740(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1BFA0FFCC(uint64_t a1)
{
  unint64_t v2 = sub_1BFA1018C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1BFA10008(uint64_t a1)
{
  unint64_t v2 = sub_1BFA1018C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t InterstitialAdData.encode(to:)(void *a1)
{
  sub_1BFA10360(0, &qword_1EA17A390, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  double v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA1018C();
  sub_1BFA18338();
  sub_1BFA18218();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_1BFA1018C()
{
  unint64_t result = qword_1EA17A398;
  if (!qword_1EA17A398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A398);
  }
  return result;
}

uint64_t InterstitialAdData.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1BFA10360(0, &qword_1EA17A3A0, MEMORY[0x1E4FBBDC0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v12 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA1018C();
  sub_1BFA18328();
  if (!v2)
  {
    uint64_t v10 = sub_1BFA181A8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_1BFA10360(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_1BFA1018C();
    unint64_t v7 = a3(a1, &type metadata for InterstitialAdData.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unint64_t sub_1BFA103C4(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1BF9DEDF4();
  unint64_t result = sub_1BF9DDC48();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1BFA103F4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return InterstitialAdData.init(from:)(a1, a2);
}

uint64_t sub_1BFA1040C(void *a1)
{
  sub_1BFA10360(0, &qword_1EA17A390, MEMORY[0x1E4FBBDE0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  unint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BFA1018C();
  sub_1BFA18338();
  sub_1BFA18218();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

ValueMetadata *type metadata accessor for InterstitialAdData()
{
  return &type metadata for InterstitialAdData;
}

unsigned char *storeEnumTagSinglePayload for InterstitialAdData.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BFA10600);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for InterstitialAdData.CodingKeys()
{
  return &type metadata for InterstitialAdData.CodingKeys;
}

unint64_t sub_1BFA1063C()
{
  unint64_t result = qword_1EA17A3A8;
  if (!qword_1EA17A3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A3A8);
  }
  return result;
}

unint64_t sub_1BFA10694()
{
  unint64_t result = qword_1EA17A3B0;
  if (!qword_1EA17A3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A3B0);
  }
  return result;
}

unint64_t sub_1BFA106EC()
{
  unint64_t result = qword_1EA17A3B8;
  if (!qword_1EA17A3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A3B8);
  }
  return result;
}

uint64_t sub_1BFA10740(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000021 && a2 == 0x80000001BFA28620)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_1BFA18258();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t type metadata accessor for AdSegmentUpdater()
{
  return self;
}

uint64_t sub_1BFA107EC(uint64_t a1, unsigned __int8 *a2)
{
  int v3 = *a2;
  unsigned int v4 = self;
  uint64_t v5 = MEMORY[0x1E4FBB1A0];
  unint64_t v6 = (void *)sub_1BFA17CB8();
  objc_msgSend(v4, sel_addClientToSegments_replaceExisting_privateSegment_, v6, 1, v3 ^ 1u);

  if (qword_1EBA77898 != -1) {
    swift_once();
  }
  unint64_t v7 = (void *)qword_1EBA777B8;
  sub_1BF95AA88();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = (void *)v8;
  *(_OWORD *)(v8 + 16) = xmmword_1BFA195C0;
  BOOL v10 = v3 == 0;
  if (v3) {
    uint64_t v11 = 0x63696C627570;
  }
  else {
    uint64_t v11 = 0x65746176697270;
  }
  if (v10) {
    unint64_t v12 = 0xE700000000000000;
  }
  else {
    unint64_t v12 = 0xE600000000000000;
  }
  *(void *)(v8 + 56) = v5;
  *(void *)(v8 + 64) = sub_1BF95AB38();
  v9[4] = v11;
  v9[5] = v12;
  sub_1BF964610();
  v9[12] = v13;
  v9[13] = sub_1BF9753D4();
  v9[9] = a1;
  id v14 = v7;
  swift_bridgeObjectRetain();
  sub_1BFA17E48();
  sub_1BFA177B8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BFA10970(uint64_t a1)
{
  return sub_1BFA10A8C(a1, (void (*)(void))type metadata accessor for ArticleBannerAdProviderFactory);
}

uint64_t sub_1BFA10988(uint64_t a1)
{
  return sub_1BFA10A8C(a1, (void (*)(void))type metadata accessor for FeedBannerAdProviderFactory);
}

uint64_t sub_1BFA109A0(uint64_t a1)
{
  return sub_1BFA10A8C(a1, (void (*)(void))type metadata accessor for InterstitialAdProviderFactory);
}

uint64_t sub_1BFA109B8(uint64_t a1)
{
  return sub_1BFA10A8C(a1, (void (*)(void))type metadata accessor for PrerollAdProviderFactory);
}

uint64_t sub_1BFA109D0(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF968CB8();
  uint64_t result = sub_1BFA16E08();
  if (v4)
  {
    type metadata accessor for PrerollAdProvider();
    uint64_t v2 = swift_allocObject();
    sub_1BF95BCD0(&v3, v2 + 16);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BFA10A5C(uint64_t a1)
{
  return sub_1BFA10A8C(a1, (void (*)(void))type metadata accessor for NativeAdProviderFactory);
}

uint64_t sub_1BFA10A74(uint64_t a1)
{
  return sub_1BFA10A8C(a1, (void (*)(void))type metadata accessor for SponsorshipAdProviderFactory);
}

uint64_t sub_1BFA10A8C(uint64_t a1, void (*a2)(void))
{
  sub_1BF95BBDC(a1, (uint64_t)v5);
  a2(0);
  uint64_t v3 = swift_allocObject();
  sub_1BF95BCD0(v5, v3 + 16);
  return v3;
}

uint64_t sub_1BFA10AE8()
{
  type metadata accessor for ArticleBannerAdProvider();
  sub_1BFA16F28();
  swift_release();
  type metadata accessor for FeedBannerAdProvider();
  sub_1BFA16F28();
  swift_release();
  type metadata accessor for InterstitialAdProvider();
  sub_1BFA16F28();
  swift_release();
  type metadata accessor for NativeAdProvider();
  sub_1BFA16F28();
  swift_release();
  type metadata accessor for SponsorshipAdProvider();
  sub_1BFA16F28();
  return swift_release();
}

uint64_t sub_1BFA10C18(void *a1)
{
  return sub_1BFA10C48(a1, (void (*)(void))type metadata accessor for ArticleBannerAdProvider);
}

uint64_t sub_1BFA10C30(void *a1)
{
  return sub_1BFA10C48(a1, (void (*)(void))type metadata accessor for FeedBannerAdProvider);
}

uint64_t sub_1BFA10C48(void *a1, void (*a2)(void))
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF968CB8();
  uint64_t result = sub_1BFA16E08();
  if (v6)
  {
    a2(0);
    uint64_t v4 = swift_allocObject();
    type metadata accessor for DebugBannerAdProvider();
    swift_allocObject();
    *(void *)(v4 + 56) = sub_1BFA0D20C();
    sub_1BF95BCD0(&v5, v4 + 16);
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BFA10CFC(void *a1)
{
  return sub_1BFA10D2C(a1, (void (*)(void))type metadata accessor for InterstitialAdProvider);
}

uint64_t sub_1BFA10D14(void *a1)
{
  return sub_1BFA10D2C(a1, (void (*)(void))type metadata accessor for NativeAdProvider);
}

uint64_t sub_1BFA10D2C(void *a1, void (*a2)(void))
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF968CB8();
  uint64_t result = sub_1BFA16E08();
  if (v6)
  {
    a2(0);
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 56) = 0;
    sub_1BF95BCD0(&v5, v4 + 16);
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BFA10DC4(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BF968CB8();
  uint64_t result = sub_1BFA16E08();
  if (v4)
  {
    type metadata accessor for SponsorshipAdProvider();
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(void *)(v2 + 88) = 0;
    sub_1BF95BCD0(&v3, v2 + 16);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for ProviderAssembly()
{
  return self;
}

uint64_t sub_1BFA10E88()
{
  sub_1BFA16E28();
  type metadata accessor for ArticleBannerAdProviderFactory();
  sub_1BFA16F28();
  swift_release();
  swift_release();
  sub_1BFA16E28();
  type metadata accessor for FeedBannerAdProviderFactory();
  sub_1BFA16F28();
  swift_release();
  swift_release();
  sub_1BFA16E28();
  type metadata accessor for InterstitialAdProviderFactory();
  sub_1BFA16F28();
  swift_release();
  swift_release();
  sub_1BFA16E28();
  type metadata accessor for PrerollAdProviderFactory();
  sub_1BFA16F28();
  swift_release();
  swift_release();
  sub_1BFA16E28();
  type metadata accessor for PrerollAdProvider();
  sub_1BFA16F28();
  swift_release();
  swift_release();
  sub_1BFA16E28();
  type metadata accessor for NativeAdProviderFactory();
  sub_1BFA16F28();
  swift_release();
  swift_release();
  sub_1BFA16E28();
  type metadata accessor for SponsorshipAdProviderFactory();
  sub_1BFA16F28();
  swift_release();
  swift_release();
  sub_1BFA16E38();
  sub_1BFA16F18();
  return swift_release();
}

uint64_t AdPlacementPolicyValidator.__allocating_init(layoutEnvironmentProvider:viewportEnvironmentProvider:)(long long *a1, long long *a2)
{
  uint64_t v4 = swift_allocObject();
  AdPlacementPolicyValidator.init(layoutEnvironmentProvider:viewportEnvironmentProvider:)(a1, a2);
  return v4;
}

void *AdPlacementPolicyValidator.init(layoutEnvironmentProvider:viewportEnvironmentProvider:)(long long *a1, long long *a2)
{
  unint64_t v12 = a1;
  uint64_t v13 = a2;
  uint64_t v3 = sub_1BFA17E88();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1BFA17E68();
  MEMORY[0x1F4188790](v7);
  uint64_t v8 = sub_1BFA179F8();
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v9 = MEMORY[0x1E4FBC860];
  v2[12] = MEMORY[0x1E4FBC860];
  uint64_t v14 = v9;
  sub_1BFA11444(0, &qword_1EBA77E18, (uint64_t (*)(uint64_t))sub_1BFA11410, MEMORY[0x1E4FAB060]);
  swift_allocObject();
  v2[13] = sub_1BFA17028();
  sub_1BF973CEC();
  sub_1BFA179E8();
  uint64_t v14 = v9;
  sub_1BFA114DC((unint64_t *)&unk_1EBA79540, 255, MEMORY[0x1E4FBCC10]);
  sub_1BFA114A8(0);
  sub_1BFA114DC((unint64_t *)&qword_1EBA79518, 255, sub_1BFA114A8);
  sub_1BFA17F78();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E4FBCC58], v3);
  v2[14] = sub_1BFA17EB8();
  sub_1BF95BCD0(v12, (uint64_t)(v2 + 2));
  sub_1BF95BCD0(v13, (uint64_t)(v2 + 7));
  return v2;
}

void sub_1BFA11410(uint64_t a1)
{
}

void sub_1BFA11444(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_1BFA114A8(uint64_t a1)
{
}

uint64_t sub_1BFA114DC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t AdPlacementPolicyValidator.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  swift_release();

  return v0;
}

uint64_t AdPlacementPolicyValidator.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186488](v0, 120, 7);
}

uint64_t sub_1BFA115BC(uint64_t *a1)
{
  return AdPlacementPolicyValidator.validatePlacement(_:)(a1);
}

uint64_t AdPlacementPolicyValidator.validatePlacement(_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (qword_1EBA79730 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)qword_1EBA79208;
  sub_1BFA11444(0, (unint64_t *)&qword_1EBA79640, (uint64_t (*)(uint64_t))sub_1BF95AAE0, MEMORY[0x1E4FBBE00]);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BFA195C0;
  uint64_t v5 = MEMORY[0x1E4FBB1A0];
  *(void *)(v4 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v6 = sub_1BF95AB38();
  *(void *)(v4 + 64) = v6;
  *(void *)(v4 + 32) = v2;
  *(void *)(v4 + 4sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = v1;
  type metadata accessor for CGPoint(0);
  id v7 = v3;
  swift_bridgeObjectRetain();
  sub_1BFA180B8();
  *(void *)(v4 + 96) = v5;
  *(void *)(v4 + 104) = v6;
  *(void *)(v4 + 72) = 0;
  *(void *)(v4 + 8sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = 0xE000000000000000;
  sub_1BFA17E48();
  sub_1BFA177B8();

  swift_bridgeObjectRelease();
  if (qword_1EBA796D0 != -1) {
    swift_once();
  }
  sub_1BFA114DC(&qword_1EBA78E58, v8, (void (*)(uint64_t))type metadata accessor for AdPlacementPolicyValidator);
  sub_1BFA16AA8();
  sub_1BFA12CDC(0, (unint64_t *)&qword_1EBA77E38, MEMORY[0x1E4FBC848] + 8, MEMORY[0x1E4FAB088]);
  swift_allocObject();
  return sub_1BFA170C8();
}

uint64_t type metadata accessor for AdPlacementPolicyValidator()
{
  return self;
}

uint64_t sub_1BFA11958(uint64_t a1)
{
  return AdPlacementPolicyValidator.addPolicy(_:)(a1);
}

uint64_t AdPlacementPolicyValidator.addPolicy(_:)(uint64_t a1)
{
  uint64_t v3 = sub_1BFA179B8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  unint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1BFA179F8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  BOOL v10 = (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF95BBDC(a1, (uint64_t)v16);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  sub_1BF95BCD0(v16, v11 + 24);
  aBlock[4] = sub_1BFA129D0;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BFA0A740;
  aBlock[3] = &block_descriptor_12;
  unint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  sub_1BFA179D8();
  uint64_t v14 = MEMORY[0x1E4FBC860];
  sub_1BFA114DC((unint64_t *)&qword_1EBA794C0, 255, MEMORY[0x1E4FBCB00]);
  sub_1BF9599C0();
  sub_1BFA114DC((unint64_t *)&qword_1EBA794E8, 255, (void (*)(uint64_t))sub_1BF9599C0);
  sub_1BFA17F78();
  MEMORY[0x1C18B7E80](0, v10, v6, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

uint64_t sub_1BFA11C64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, double a9, double a10)
{
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  *(void *)(v20 + 24) = a2;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a5;
  *(void *)(v21 + 24) = a6;
  *(void *)(v21 + 32) = a7;
  *(double *)(v21 + 4sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = a9;
  *(double *)(v21 + 48) = a10;
  *(void *)(v21 + 56) = a3;
  *(void *)(v21 + 64) = a4;
  *(void *)(v21 + 72) = sub_1BFA12A30;
  *(void *)(v21 + 8sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = v20;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v22 = (void (*)(void *, void))sub_1BFA17038();
  uint64_t v24 = v23;
  uint64_t v25 = *v23;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v24 = v25;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v25 = sub_1BF963AD0(0, v25[2] + 1, 1, v25);
    *uint64_t v24 = v25;
  }
  unint64_t v28 = v25[2];
  unint64_t v27 = v25[3];
  if (v28 >= v27 >> 1)
  {
    uint64_t v25 = sub_1BF963AD0((void *)(v27 > 1), v28 + 1, 1, v25);
    *uint64_t v24 = v25;
  }
  v25[2] = v28 + 1;
  uint64_t v29 = &v25[2 * v28];
  v29[4] = sub_1BFA12AA8;
  v29[5] = v21;
  v22(v33, 0);
  uint64_t result = swift_release();
  if (a8)
  {
    swift_retain();
    sub_1BFA17048();
    swift_release();
    if (*(void *)(v33[0] + 16))
    {
      uint64_t v31 = *(void (**)(uint64_t))(v33[0] + 32);
      swift_retain();
      uint64_t v32 = swift_bridgeObjectRelease();
      v31(v32);
      return swift_release();
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1BFA11E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BFA11C64(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(unsigned char *)(v4 + 56), *(double *)(v4 + 40), *(double *)(v4 + 48));
}

uint64_t sub_1BFA11E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9)
{
  sub_1BFA12ADC();
  sub_1BFA170F8();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  *(double *)(v17 + 32) = a8;
  *(double *)(v17 + 4sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = a9;
  *(void *)(v17 + 48) = a4;
  *(void *)(v17 + 56) = a5;
  swift_bridgeObjectRetain();
  swift_retain();
  objc_super v18 = (void *)sub_1BFA17018();
  sub_1BFA170A8();
  swift_release();
  swift_release();

  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a1;
  *(void *)(v19 + 24) = a2;
  *(void *)(v19 + 32) = a3;
  *(double *)(v19 + 4sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = a8;
  *(double *)(v19 + 48) = a9;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = sub_1BFA12BD4;
  *(void *)(v20 + 24) = v19;
  sub_1BFA12CDC(0, &qword_1EBA794D8, (uint64_t)&type metadata for AdPolicyFailure, MEMORY[0x1E4FBB320]);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BFA17098();
  swift_release();
  swift_release();
  sub_1BF973CEC();
  uint64_t v21 = (void *)sub_1BFA17E98();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a2;
  *(void *)(v22 + 24) = a3;
  *(double *)(v22 + 32) = a8;
  *(double *)(v22 + 4sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = a9;
  *(void *)(v22 + 48) = a4;
  *(void *)(v22 + 56) = a5;
  *(void *)(v22 + 64) = a6;
  *(void *)(v22 + 72) = a7;
  *(void *)(v22 + 8sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = a1;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1BFA17098();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_1BFA12118(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  uint64_t v4 = a1 + 7;
  uint64_t v6 = a1[10];
  uint64_t v5 = a1[11];
  __swift_project_boxed_opaque_existential_1(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v5);
  uint64_t v7 = (void *)sub_1BFA17018();
  uint64_t v8 = sub_1BFA17008();
  swift_release();
  swift_release();

  return v8;
}

void sub_1BFA121E8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void *))
{
  if (qword_1EBA79730 != -1) {
    swift_once();
  }
  uint64_t v7 = (void *)qword_1EBA79208;
  sub_1BFA11444(0, (unint64_t *)&qword_1EBA79640, (uint64_t (*)(uint64_t))sub_1BF95AAE0, MEMORY[0x1E4FBBE00]);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1BFA195C0;
  uint64_t v9 = MEMORY[0x1E4FBB1A0];
  *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v10 = sub_1BF95AB38();
  *(void *)(v8 + 64) = v10;
  *(void *)(v8 + 32) = a2;
  *(void *)(v8 + 4sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = a3;
  swift_getErrorValue();
  id v11 = v7;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1BFA182A8();
  *(void *)(v8 + 96) = v9;
  *(void *)(v8 + 104) = v10;
  *(void *)(v8 + 72) = v12;
  *(void *)(v8 + 8sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = v13;
  sub_1BFA17E48();
  sub_1BFA177B8();

  swift_bridgeObjectRelease();
  sub_1BFA12D28();
  uint64_t v14 = (void *)swift_allocError();
  *(void *)uint64_t v15 = a1;
  *(void *)(v15 + 8) = 0;
  *(unsigned char *)(v15 + 16) = 0;
  id v16 = a1;
  a4(v14);
}

char *sub_1BFA123A8(uint64_t *a1, long long *a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  long long v11 = a2[1];
  long long v18 = *a2;
  long long v19 = v11;
  long long v12 = a2[3];
  long long v20 = a2[2];
  long long v21 = v12;
  long long v13 = a2[5];
  long long v22 = a2[4];
  long long v23 = v13;
  uint64_t v17 = *a1;
  long long v24 = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = sub_1BF97520C(v14, a6, a7, (uint64_t)&v17, a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1BFA12474(uint64_t *a1, uint64_t a2, unint64_t a3, void (*a4)(void *), uint64_t a5, void (*a6)(uint64_t))
{
  unint64_t v7 = a3;
  uint64_t v8 = a2;
  uint64_t v9 = *a1;
  int64_t v10 = *(void *)(*a1 + 16);
  if (!v10)
  {
    long long v13 = a6;
    if (qword_1EBA79730 != -1) {
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  v36[5] = v6;
  v36[0] = MEMORY[0x1E4FBC860];
  sub_1BF9749F8(0, v10, 0);
  uint64_t v11 = v36[0];
  long long v12 = (void (**)(uint64_t))(v9 + 80);
  do
  {
    uint64_t v8 = (uint64_t)*(v12 - 1);
    long long v13 = *v12;
    v36[0] = v11;
    unint64_t v7 = *(void *)(v11 + 16);
    unint64_t v14 = *(void *)(v11 + 24);
    swift_bridgeObjectRetain();
    if (v7 >= v14 >> 1)
    {
      sub_1BF9749F8((char *)(v14 > 1), v7 + 1, 1);
      uint64_t v11 = v36[0];
    }
    *(void *)(v11 + 16) = v7 + 1;
    uint64_t v15 = v11 + 16 * v7;
    *(void *)(v15 + 32) = v8;
    *(void *)(v15 + 4sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = v13;
    v12 += 8;
    --v10;
  }
  while (v10);
  if (qword_1EBA79730 != -1) {
    swift_once();
  }
  id v16 = (void *)qword_1EBA79208;
  sub_1BFA11444(0, (unint64_t *)&qword_1EBA79640, (uint64_t (*)(uint64_t))sub_1BF95AAE0, MEMORY[0x1E4FBBE00]);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1BFA195C0;
  uint64_t v18 = MEMORY[0x1E4FBB1A0];
  *(void *)(v17 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v17 + 64) = sub_1BF95AB38();
  *(void *)(v17 + 32) = a2;
  *(void *)(v17 + 4sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = a3;
  sub_1BFA12CDC(0, (unint64_t *)&qword_1EBA794F0, v18, MEMORY[0x1E4FBB320]);
  *(void *)(v17 + 96) = v19;
  *(void *)(v17 + 104) = sub_1BF9753D4();
  *(void *)(v17 + 72) = v11;
  id v20 = v16;
  swift_bridgeObjectRetain();
  sub_1BFA17E48();
  sub_1BFA177B8();

  swift_bridgeObjectRelease();
  sub_1BFA12D28();
  long long v21 = (void *)swift_allocError();
  *(void *)uint64_t v22 = v9;
  *(void *)(v22 + 8) = 0;
  *(unsigned char *)(v22 + 16) = 1;
  swift_bridgeObjectRetain();
  a4(v21);

  while (1)
  {
    swift_retain();
    sub_1BFA17048();
    swift_release();
    uint64_t v26 = *(void *)(v36[0] + 16);
    uint64_t result = swift_bridgeObjectRelease();
    if (!v26) {
      break;
    }
    swift_retain();
    uint64_t v28 = sub_1BFA17038();
    if (*(void *)(*(void *)v29 + 16))
    {
      id v30 = (void (*)(void *, void))v28;
      sub_1BFA12D7C(0, 1);
      v30(v36, 0);
      swift_release();
      swift_retain();
      sub_1BFA17048();
      swift_release();
      if (!*(void *)(v36[0] + 16)) {
        return swift_bridgeObjectRelease();
      }
      uint64_t v31 = *(void (**)(uint64_t))(v36[0] + 32);
      swift_retain();
      uint64_t v32 = swift_bridgeObjectRelease();
      v31(v32);
      return swift_release();
    }
    __break(1u);
LABEL_18:
    swift_once();
LABEL_10:
    long long v23 = (void *)qword_1EBA79208;
    sub_1BFA11444(0, (unint64_t *)&qword_1EBA79640, (uint64_t (*)(uint64_t))sub_1BF95AAE0, MEMORY[0x1E4FBBE00]);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1BFA195D0;
    *(void *)(v24 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v24 + 64) = sub_1BF95AB38();
    *(void *)(v24 + 32) = v8;
    *(void *)(v24 + 4sub_1BFA0E454((const char **)&selRef_mediaContractedAtPosition_fullScreen_, 0) = v7;
    swift_bridgeObjectRetain();
    unint64_t v7 = v23;
    sub_1BFA17E48();
    sub_1BFA177B8();

    uint64_t v25 = swift_bridgeObjectRelease();
    v13(v25);
  }
  return result;
}

uint64_t sub_1BFA128CC(uint64_t a1, uint64_t a2)
{
  sub_1BF95BBDC(a2, (uint64_t)v8);
  uint64_t v3 = *(void **)(a1 + 96);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 96) = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v3 = sub_1BF963110(0, v3[2] + 1, 1, v3);
    *(void *)(a1 + 96) = v3;
  }
  unint64_t v6 = v3[2];
  unint64_t v5 = v3[3];
  if (v6 >= v5 >> 1)
  {
    uint64_t v3 = sub_1BF963110((void *)(v5 > 1), v6 + 1, 1, v3);
    *(void *)(a1 + 96) = v3;
  }
  long long v3[2] = v6 + 1;
  return sub_1BF95BCD0(v8, (uint64_t)&v3[5 * v6 + 4]);
}

uint64_t sub_1BFA12990()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocObject();
}

uint64_t sub_1BFA129D0()
{
  return sub_1BFA128CC(*(void *)(v0 + 16), v0 + 24);
}

uint64_t dispatch thunk of AdPlacementPolicyValidatorType.validatePlacement(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of AdPlacementPolicyValidatorType.addPolicy(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t method lookup function for AdPlacementPolicyValidator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AdPlacementPolicyValidator);
}

uint64_t dispatch thunk of AdPlacementPolicyValidator.__allocating_init(layoutEnvironmentProvider:viewportEnvironmentProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1BFA12A30()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1BFA12A58()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BFA12AA8()
{
  return sub_1BFA11E84(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_1BFA12AC0()
{
  return sub_1BFA12118(v0);
}

void sub_1BFA12ADC()
{
  if (!qword_1EBA78D30)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EBA78D30);
    }
  }
}

uint64_t sub_1BFA12B44()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_1BFA12B84(void *a1)
{
  sub_1BFA121E8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void *))(v1 + 48));
}

uint64_t sub_1BFA12B94()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

char *sub_1BFA12BD4(uint64_t *a1, long long *a2)
{
  return sub_1BFA123A8(a1, a2, *(double *)(v2 + 40), *(double *)(v2 + 48), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_1BFA12BE4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BFA12C1C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(a1, a1 + 8);
  *a2 = result;
  return result;
}

uint64_t sub_1BFA12C60()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BFA12CB0(uint64_t *a1)
{
  return sub_1BFA12474(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void *))(v1 + 48), *(void *)(v1 + 56), *(void (**)(uint64_t))(v1 + 64));
}

void sub_1BFA12CDC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_1BFA12D28()
{
  unint64_t result = qword_1EBA782D8;
  if (!qword_1EBA782D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA782D8);
  }
  return result;
}

uint64_t sub_1BFA12D7C(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_1BF963AD0(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  sub_1BF963D48();
  unint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v12 = v4[2];
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_25;
  }
  uint64_t v15 = (char *)&v4[2 * a2 + 4];
  if (v6 != a2 || &v4[2 * v6 + 4] >= (void *)&v15[16 * v14]) {
    unint64_t result = (uint64_t)memmove(&v4[2 * v6 + 4], v15, 16 * v14);
  }
  uint64_t v16 = v4[2];
  BOOL v13 = __OFADD__(v16, v8);
  uint64_t v17 = v16 - v7;
  if (!v13)
  {
    v4[2] = v17;
LABEL_19:
    *(void *)uint64_t v2 = v4;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

id DebugJournalViewController.__allocating_init(commandCenter:journal:presentationOptions:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  id v10 = sub_1BFA15BF8(a1, a2, a3, a4);
  swift_unknownObjectRelease();
  return v10;
}

uint64_t static DebugJournalViewController.PresentationOptions.== infix(_:_:)()
{
  return 1;
}

uint64_t DebugJournalViewController.PresentationOptions.hash(into:)()
{
  return sub_1BFA18308();
}

uint64_t DebugJournalViewController.PresentationOptions.hashValue.getter()
{
  return sub_1BFA18318();
}

unint64_t sub_1BFA12F7C@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1BFA16058(*a1);
  *a2 = result;
  return result;
}

void sub_1BFA12FA8(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_1BFA12FB4(void *a1@<X8>)
{
  *a1 = &unk_1F1B14960;
}

uint64_t DebugJournalViewController.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

id DebugJournalViewController.init(commandCenter:journal:presentationOptions:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  id v4 = sub_1BFA15BF8(a1, a2, a3, a4);
  swift_unknownObjectRelease();
  return v4;
}

Swift::Void __swiftcall DebugJournalViewController.viewDidLoad()()
{
  uint64_t v1 = v0;
  v9.receiver = v0;
  v9.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v9, sel_viewDidLoad);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView];
  objc_msgSend(v2, sel_setDataSource_, v1);
  objc_msgSend(v2, sel_setDelegate_, v1);
  sub_1BF95991C(0, &qword_1EA17A3D0);
  sub_1BFA17E18();
  type metadata accessor for DebugJournalValueTableViewCell();
  sub_1BFA17E18();
  type metadata accessor for DebugJournalSubtitleTableViewCell();
  sub_1BFA17E18();
  id v3 = objc_msgSend(v1, sel_view);
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v3, sel_addSubview_, v2);

    objc_msgSend(v2, sel_reloadData);
    id v5 = objc_msgSend(v1, sel_navigationItem);
    uint64_t v6 = (void *)sub_1BFA17B08();
    objc_msgSend(v5, sel_setTitle_, v6);

    id v7 = objc_msgSend(v1, sel_navigationItem);
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 0, v1, sel_handleDone);
    objc_msgSend(v7, sel_setRightBarButtonItem_, v8);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall DebugJournalViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  uint64_t v2 = v1;
  id ObjectType = (objc_class *)swift_getObjectType();
  sub_1BFA1659C(0, &qword_1EA17A3E0, MEMORY[0x1E4F27DE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8);
  id v7 = (char *)&v20 - v6;
  uint64_t v8 = sub_1BFA16A58();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v20 - v13;
  v20.receiver = v2;
  v20.super_class = ObjectType;
  objc_msgSendSuper2(&v20, sel_viewDidAppear_, a1);
  uint64_t v15 = *(void **)&v2[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView];
  id v16 = objc_msgSend(v15, sel_indexPathForSelectedRow);
  if (v16)
  {
    uint64_t v17 = v16;
    sub_1BFA16A28();

    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v18(v7, v12, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      v18(v14, v7, v8);
      uint64_t v19 = (void *)sub_1BFA16A18();
      objc_msgSend(v15, sel_deselectRowAtIndexPath_animated_, v19, 1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_1BFA1653C((uint64_t)v7, (uint64_t)&qword_1EA17A3E0, MEMORY[0x1E4F27DE8], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1BFA1659C);
}

Swift::Void __swiftcall DebugJournalViewController.viewDidLayoutSubviews()()
{
  v12.receiver = v0;
  v12.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v12, sel_viewDidLayoutSubviews);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView];
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

id DebugJournalViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = v3;
  if (a2)
  {
    double v6 = (void *)sub_1BFA17B08();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void DebugJournalViewController.init(nibName:bundle:)()
{
}

uint64_t sub_1BFA13968()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DebugJournalViewController.tableView(_:didSelectRowAt:)(uint64_t a1)
{
  id v2 = v1;
  id ObjectType = (objc_class *)swift_getObjectType();
  unint64_t v5 = sub_1BFA16A48();
  double v6 = v2;
  uint64_t v7 = sub_1BFA15D80((uint64_t)&unk_1F1B14988, (uint64_t)v6);

  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    JUMPOUT(0x1BFA14010);
  }
  if (v5 >= *(void *)(v7 + 16)) {
    goto LABEL_19;
  }
  uint64_t v8 = *(unsigned __int8 *)(v7 + v5 + 32);
  uint64_t result = swift_bridgeObjectRelease();
  switch(v8)
  {
    case 1:
    case 2:
      return result;
    case 3:
      uint64_t v11 = *(void *)&v6[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 136];
      unint64_t v12 = sub_1BFA16A38();
      if ((v12 & 0x8000000000000000) != 0) {
        goto LABEL_20;
      }
      if (v12 >= *(void *)(v11 + 16)) {
        goto LABEL_21;
      }
      sub_1BF9F3B10(v11 + 48 * v12 + 32, (uint64_t)v67);
      if (v68)
      {
        *(void *)&long long v70 = *(void *)&v67[0];
        uint64_t v13 = sub_1BF990164();
        swift_bridgeObjectRelease();
        sub_1BFA16794(0, &qword_1EA17A0F8, (uint64_t)&type metadata for AdContextBuilderSnapshot.SerializedSnapshotEntry, MEMORY[0x1E4FBB320]);
        *((void *)&v71 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = v14;
        *(void *)&long long v72 = sub_1BFA15FC8(&qword_1EA17A400, (void (*)(void))sub_1BFA15F74);
        *((void *)&v72 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = sub_1BFA15FC8((unint64_t *)&unk_1EA17A410, (void (*)(void))sub_1BF9F3B88);
        *(void *)&long long v70 = v13;
        uint64_t v15 = (objc_class *)type metadata accessor for DebugJournalCodableViewController();
        id v16 = (char *)objc_allocWithZone(v15);
        uint64_t v17 = OBJC_IVAR____TtC7NewsAds33DebugJournalCodableViewController_textView;
        id v18 = objc_allocWithZone(MEMORY[0x1E4FB1DD8]);
        swift_bridgeObjectRetain();
        uint64_t v19 = v16;
        *(void *)&v16[v17] = objc_msgSend(v18, sel_init);
        sub_1BF977DB8((uint64_t)&v70, (uint64_t)&v19[OBJC_IVAR____TtC7NewsAds33DebugJournalCodableViewController_codable]);

        v66.receiver = v19;
        v66.super_class = v15;
        id v20 = objc_msgSendSuper2(&v66, sel_initWithNibName_bundle_, 0, 0);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
        swift_bridgeObjectRelease();
        id v21 = objc_msgSend(v20, sel_navigationItem);
        uint64_t v22 = (void *)sub_1BFA17B08();
        objc_msgSend(v21, sel_setTitle_, v22);

        objc_msgSend(v6, sel_showViewController_sender_, v20, 0);
      }
      else
      {
        sub_1BF95BCD0(v67, (uint64_t)v63);
        uint64_t v61 = (objc_class *)type metadata accessor for DebugJournalCodableViewController();
        uint64_t v46 = v64;
        uint64_t v47 = v65;
        uint64_t v48 = __swift_project_boxed_opaque_existential_1(v63, v64);
        *((void *)&v71 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = v46;
        *(void *)&long long v72 = *(void *)(v47 + 24);
        uint64_t v49 = v72;
        uint64_t v50 = *(void *)(v47 + 32);
        *((void *)&v72 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = v50;
        boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v70);
        *(void *)&long long v62 = a1;
        uint64_t v52 = boxed_opaque_existential_2;
        uint64_t v53 = *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v46 - 8) + 16);
        uint64_t v54 = v53(boxed_opaque_existential_2, v48, v46);
        uint64_t v60 = (uint64_t)&v60;
        MEMORY[0x1F4188790](v54);
        uint64_t v56 = (char *)&v60 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
        v53((uint64_t *)v56, v52, v46);
        id v57 = sub_1BF977CB4((uint64_t)v56, v61, v46, v49, v50);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v70);
        id v58 = objc_msgSend(v57, sel_navigationItem);
        uint64_t v59 = (void *)sub_1BFA17B08();
        objc_msgSend(v58, sel_setTitle_, v59);

        objc_msgSend(v6, sel_showViewController_sender_, v57, 0);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      }
LABEL_16:
      uint64_t result = sub_1BFA17DF8();
      break;
    case 4:
      uint64_t v23 = *(void *)&v6[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 128];
      unint64_t v24 = sub_1BFA16A38();
      if ((v24 & 0x8000000000000000) != 0) {
        goto LABEL_22;
      }
      if (v24 >= *(void *)(v23 + 16)) {
        goto LABEL_23;
      }
      uint64_t v25 = (_OWORD *)(v23 + 144 * v24);
      long long v70 = v25[2];
      long long v26 = v25[3];
      long long v27 = v25[4];
      long long v28 = v25[6];
      long long v73 = v25[5];
      long long v74 = v28;
      long long v71 = v26;
      long long v72 = v27;
      long long v29 = v25[7];
      long long v30 = v25[8];
      long long v31 = v25[10];
      long long v77 = v25[9];
      long long v78 = v31;
      long long v75 = v29;
      long long v76 = v30;
      uint64_t v32 = *((void *)&v70 + 1);
      uint64_t v61 = (objc_class *)v70;
      long long v62 = *(_OWORD *)&v6[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_commandCenter];
      uint64_t v33 = (char *)objc_allocWithZone(ObjectType);
      uint64_t v34 = OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView;
      id v35 = objc_allocWithZone(MEMORY[0x1E4FB1D00]);
      sub_1BF968848((uint64_t)&v70);
      sub_1BF968848((uint64_t)&v70);
      swift_unknownObjectRetain();
      id v36 = v33;
      *(void *)&v33[v34] = objc_msgSend(v35, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);
      uint64_t v37 = &v36[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_identifier];
      *(void *)uint64_t v37 = v61;
      *((void *)v37 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = v32;
      *(_OWORD *)&v36[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_commandCenter] = v62;
      uint64_t v38 = &v36[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal];
      long long v40 = v75;
      long long v39 = v76;
      long long v41 = v78;
      *((_OWORD *)v38 + 7) = v77;
      *((_OWORD *)v38 + 8) = v41;
      *((_OWORD *)v38 + 5) = v40;
      *((_OWORD *)v38 + 6) = v39;
      long long v43 = v71;
      long long v42 = v72;
      long long v44 = v74;
      *((_OWORD *)v38 + 3) = v73;
      *((_OWORD *)v38 + 4) = v44;
      *((_OWORD *)v38 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = v43;
      *((_OWORD *)v38 + 2) = v42;
      *(_OWORD *)uint64_t v38 = v70;
      *(void *)&v36[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_presentationOptions] = MEMORY[0x1E4FBC860];
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();

      v69.receiver = v36;
      v69.super_class = ObjectType;
      id v45 = objc_msgSendSuper2(&v69, sel_initWithNibName_bundle_, 0, 0);
      swift_unknownObjectRelease();
      objc_msgSend(v6, sel_showViewController_sender_, v45, 0);

      uint64_t result = sub_1BF9728B4((uint64_t)&v70);
      break;
    default:
      uint64_t v10 = sub_1BFA16A38();
      if (v10 == 1)
      {
        sub_1BFA145C8();
      }
      else if (!v10)
      {
        sub_1BFA14024();
      }
      goto LABEL_16;
  }
  return result;
}

uint64_t sub_1BFA14024()
{
  uint64_t v1 = v0;
  uint64_t v28 = sub_1BFA17878();
  uint64_t v2 = *(void *)(v28 - 8);
  MEMORY[0x1F4188790](v28);
  long long v27 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1BFA17808();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1BFA1659C(0, (unint64_t *)&unk_1EA17A4F0, MEMORY[0x1E4FABF68], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)v26 - v10;
  unint64_t v12 = (uint64_t (*)(uint64_t))MEMORY[0x1E4FAD738];
  sub_1BFA1659C(0, &qword_1EA179D40, MEMORY[0x1E4FAD738], v8);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)v26 - v14;
  uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_commandCenter);
  _OWORD v26[2] = *(void *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_commandCenter + 8);
  v26[1] = v16;
  v26[0] = swift_getObjectType();
  sub_1BFA1659C(0, &qword_1EA17A500, v12, MEMORY[0x1E4FAD790]);
  sub_1BFA17938();
  if (qword_1EA178E28 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1BFA177D8();
  uint64_t v18 = __swift_project_value_buffer(v17, (uint64_t)qword_1EA1796A0);
  uint64_t v19 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v11, v18, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v11, 0, 1, v17);
  long long v20 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 112);
  long long v35 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 96);
  long long v36 = v20;
  long long v37 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 128);
  long long v21 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 48);
  long long v31 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 32);
  long long v32 = v21;
  long long v22 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 80);
  long long v33 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 64);
  long long v34 = v22;
  long long v23 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  long long v30 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 16);
  long long v29 = v23;
  sub_1BF9F1680();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4FAC200], v4);
  sub_1BFA178A8();
  uint64_t v24 = sub_1BFA178B8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v15, 0, 1, v24);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v27, *MEMORY[0x1E4FACB48], v28);
  *((void *)&v30 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = &_s7NewsAds7TrackerVN_0;
  *(void *)&long long v31 = sub_1BFA164E8();
  long long v38 = 0u;
  long long v39 = 0u;
  char v40 = 1;
  sub_1BFA17868();
  swift_allocObject();
  sub_1BFA17858();
  sub_1BFA17818();
  sub_1BFA1653C((uint64_t)v15, (uint64_t)&qword_1EA179D40, MEMORY[0x1E4FAD738], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1BFA1659C);
  swift_release();
  return swift_release();
}

void sub_1BFA145C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1BFA177F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 112];
  v32[6] = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 96];
  v32[7] = v6;
  v32[8] = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 128];
  long long v7 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 48];
  v32[2] = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 32];
  v32[3] = v7;
  long long v8 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 80];
  v32[4] = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 64];
  v32[5] = v8;
  long long v9 = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 16];
  v32[0] = *(_OWORD *)&v0[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal];
  v32[1] = v9;
  uint64_t v10 = sub_1BF9F1680();
  uint64_t v11 = v10[2];
  if (v11)
  {
    long long v26 = v1;
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    uint64_t v12 = v3 + 16;
    long long v29 = v13;
    uint64_t v14 = (char *)v10 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    uint64_t v15 = (void (**)(char *, uint64_t))(v12 - 8);
    uint64_t v16 = MEMORY[0x1E4FBC840];
    uint64_t v17 = *(void *)(v12 + 56);
    uint64_t v25 = v10;
    swift_bridgeObjectRetain();
    uint64_t v18 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v27 = v16 + 8;
    uint64_t v28 = v12;
    do
    {
      v29(v5, v14, v2);
      sub_1BFA15514((uint64_t)v5, (uint64_t)&v30);
      (*v15)(v5, v2);
      if (v31)
      {
        sub_1BF992514(&v30, v32);
        sub_1BF992514(v32, &v30);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v18 = sub_1BF963C1C(0, *((void *)v18 + 2) + 1, 1, v18);
        }
        unint64_t v20 = *((void *)v18 + 2);
        unint64_t v19 = *((void *)v18 + 3);
        if (v20 >= v19 >> 1) {
          uint64_t v18 = sub_1BF963C1C((char *)(v19 > 1), v20 + 1, 1, v18);
        }
        *((void *)v18 + 2) = v20 + 1;
        sub_1BF992514(&v30, &v18[32 * v20 + 32]);
      }
      else
      {
        sub_1BFA1653C((uint64_t)&v30, (uint64_t)&unk_1EBA79950, v27, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1BFA16794);
      }
      v14 += v17;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease_n();
    uint64_t v1 = v26;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v21 = objc_allocWithZone(MEMORY[0x1E4F42718]);
  long long v22 = (void *)sub_1BFA17CB8();
  swift_bridgeObjectRelease();
  sub_1BF95991C(0, &qword_1EA17A518);
  long long v23 = (void *)sub_1BFA17CB8();
  id v24 = objc_msgSend(v21, sel_initWithActivityItems_applicationActivities_, v22, v23);

  objc_msgSend(v1, sel_presentViewController_animated_completion_, v24, 1, 0);
}

Swift::Int __swiftcall DebugJournalViewController.numberOfSections(in:)(UITableView *in)
{
  id v2 = v1;
  uint64_t v3 = sub_1BFA15D80((uint64_t)&unk_1F1B149B0, (uint64_t)v2);

  Swift::Int v4 = *(void *)(v3 + 16);
  swift_bridgeObjectRelease();
  return v4;
}

Swift::Int __swiftcall DebugJournalViewController.tableView(_:numberOfRowsInSection:)(UITableView *_, Swift::Int numberOfRowsInSection)
{
  return sub_1BFA16068(numberOfRowsInSection);
}

Swift::String_optional __swiftcall DebugJournalViewController.tableView(_:titleForHeaderInSection:)(UITableView *_, Swift::Int titleForHeaderInSection)
{
  unint64_t v2 = sub_1BFA1618C(titleForHeaderInSection);
  result.value._object = v3;
  result.value._countAndFlagsBits = v2;
  return result;
}

id DebugJournalViewController.tableView(_:cellForRowAt:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1BFA179A8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  long long v6 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v4);
  long long v9 = (char *)v46 - v8;
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)v46 - v10;
  unint64_t v12 = sub_1BFA16A48();
  uint64_t v13 = v1;
  uint64_t v14 = sub_1BFA15D80((uint64_t)&unk_1F1B14988, (uint64_t)v13);

  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    JUMPOUT(0x1BFA153ECLL);
  }
  if (v12 >= *(void *)(v14 + 16)) {
    goto LABEL_24;
  }
  uint64_t v15 = *(unsigned __int8 *)(v14 + v12 + 32);
  swift_bridgeObjectRelease();
  switch(v15)
  {
    case 1:
      type metadata accessor for DebugJournalSubtitleTableViewCell();
      unint64_t v20 = (void *)sub_1BFA17E08();
      uint64_t v21 = *(void *)&v13[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 112];
      unint64_t v22 = sub_1BFA16A38();
      if ((v22 & 0x8000000000000000) != 0) {
        goto LABEL_25;
      }
      if (v22 >= *(void *)(v21 + 16)) {
        goto LABEL_26;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1BFA17948();
      swift_bridgeObjectRetain();
      sub_1BFA17998();
      swift_bridgeObjectRetain();
      sub_1BFA17958();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *((void *)&v50 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = v2;
      *(void *)&long long v51 = MEMORY[0x1E4FB0F88];
      boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v49);
      (*(void (**)(uint64_t *, char *, uint64_t))(v3 + 16))(boxed_opaque_existential_2, v9, v2);
      id v16 = v20;
      MEMORY[0x1C18B7E30](&v49);

      objc_msgSend(v16, sel_setAccessoryType_, 0);
      objc_msgSend(v16, sel_setSelectionStyle_, 0);
      goto LABEL_20;
    case 2:
      uint64_t v24 = *(void *)&v13[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 120];
      unint64_t v25 = sub_1BFA16A38();
      if ((v25 & 0x8000000000000000) != 0) {
        goto LABEL_27;
      }
      if (v25 >= *(void *)(v24 + 16)) {
        goto LABEL_28;
      }
      type metadata accessor for DebugJournalSubtitleTableViewCell();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v16 = (id)sub_1BFA17E08();
      objc_msgSend(v16, sel_setSelectionStyle_, 0);
      id v26 = objc_msgSend(v16, sel_textLabel);
      if (v26)
      {
        uint64_t v27 = (void *)sub_1BFA17B08();
        objc_msgSend(v26, sel_setText_, v27);
      }
      id v28 = objc_msgSend(v16, sel_detailTextLabel);
      if (v28)
      {
        long long v29 = v28;
        long long v30 = (void *)sub_1BFA17B08();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        objc_msgSend(v29, sel_setText_, v30);
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      return v16;
    case 3:
      sub_1BF95991C(0, &qword_1EA17A3D0);
      id v16 = (id)sub_1BFA17E08();
      uint64_t v31 = *(void *)&v13[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 136];
      unint64_t v32 = sub_1BFA16A38();
      if ((v32 & 0x8000000000000000) != 0) {
        goto LABEL_29;
      }
      if (v32 >= *(void *)(v31 + 16)) {
        goto LABEL_30;
      }
      sub_1BF9F3B10(v31 + 48 * v32 + 32, (uint64_t)&v49);
      sub_1BFA17988();
      sub_1BF9F3B10((uint64_t)&v49, (uint64_t)v46);
      sub_1BFA16318((uint64_t)v46);
      sub_1BFA17998();
      uint64_t v47 = v2;
      uint64_t v48 = MEMORY[0x1E4FB0F88];
      long long v33 = __swift_allocate_boxed_opaque_existential_2(v46);
      (*(void (**)(uint64_t *, char *, uint64_t))(v3 + 16))(v33, v6, v2);
      MEMORY[0x1C18B7E30](v46);
      objc_msgSend(v16, sel_setAccessoryType_, 1);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      sub_1BFA16318((uint64_t)&v49);
      return v16;
    case 4:
      type metadata accessor for DebugJournalSubtitleTableViewCell();
      long long v34 = (void *)sub_1BFA17E08();
      uint64_t v35 = *(void *)&v13[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 128];
      unint64_t v36 = sub_1BFA16A38();
      if ((v36 & 0x8000000000000000) != 0) {
        goto LABEL_31;
      }
      if (v36 >= *(void *)(v35 + 16)) {
        goto LABEL_32;
      }
      long long v37 = (_OWORD *)(v35 + 144 * v36);
      long long v49 = v37[2];
      long long v38 = v37[3];
      long long v39 = v37[4];
      long long v40 = v37[6];
      long long v52 = v37[5];
      long long v53 = v40;
      long long v50 = v38;
      long long v51 = v39;
      long long v41 = v37[7];
      long long v42 = v37[8];
      long long v43 = v37[10];
      long long v56 = v37[9];
      long long v57 = v43;
      long long v54 = v41;
      long long v55 = v42;
      sub_1BF968848((uint64_t)&v49);
      sub_1BFA17948();
      swift_bridgeObjectRetain();
      sub_1BFA17998();
      swift_bridgeObjectRetain();
      sub_1BFA17958();
      uint64_t v47 = v2;
      uint64_t v48 = MEMORY[0x1E4FB0F88];
      long long v44 = __swift_allocate_boxed_opaque_existential_2(v46);
      (*(void (**)(uint64_t *, char *, uint64_t))(v3 + 16))(v44, v9, v2);
      id v16 = v34;
      MEMORY[0x1C18B7E30](v46);

      objc_msgSend(v16, sel_setAccessoryType_, 1);
      sub_1BF9728B4((uint64_t)&v49);
LABEL_20:
      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
      return v16;
    default:
      sub_1BF95991C(0, &qword_1EA17A3D0);
      id v16 = (id)sub_1BFA17E08();
      sub_1BFA17988();
      sub_1BFA16A38();
      sub_1BFA17998();
      id v17 = objc_msgSend(self, sel_systemBlueColor);
      uint64_t v18 = (void (*)(long long *, void))sub_1BFA17978();
      sub_1BFA17968();
      v18(&v49, 0);
      *((void *)&v50 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = v2;
      *(void *)&long long v51 = MEMORY[0x1E4FB0F88];
      unint64_t v19 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v49);
      (*(void (**)(uint64_t *, char *, uint64_t))(v3 + 16))(v19, v11, v2);
      MEMORY[0x1C18B7E30](&v49);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
      return v16;
  }
}

uint64_t sub_1BFA15514@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1BFA16918();
  uint64_t v42 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  long long v9 = (char *)&v38 - v8;
  sub_1BFA1659C(0, (unint64_t *)&qword_1EA17A520, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v10 - 8);
  unint64_t v12 = (char *)&v38 - v11;
  uint64_t v13 = sub_1BFA177F8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  id v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v16, v13);
  if (v17 == *MEMORY[0x1E4FAC140])
  {
    (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
    *(void *)(a2 + 24) = v4;
    __swift_allocate_boxed_opaque_existential_2((uint64_t *)a2);
    sub_1BFA168D8();
    return swift_release();
  }
  if (v17 == *MEMORY[0x1E4FAC128])
  {
    (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
    uint64_t v19 = *(void *)v16;
    uint64_t v20 = *(void *)v16 + 16;
    uint64_t v21 = *(void *)(*(void *)v16 + 56);
    uint64_t v22 = *(void *)(*(void *)v16 + 64);
    uint64_t v41 = v19;
    sub_1BF95BBDC(v20, (uint64_t)v45);
    __swift_project_boxed_opaque_existential_1(v45, v45[3]);
    uint64_t v23 = sub_1BF9EEE1C();
    if (v24 >> 60 != 15)
    {
      unint64_t v28 = v24;
      uint64_t v43 = v21;
      uint64_t v44 = v22;
      uint64_t v39 = v23;
      swift_bridgeObjectRetain();
      unint64_t v40 = v28;
      sub_1BFA17BD8();
      uint64_t v29 = v44;
      uint64_t v38 = v43;
      long long v30 = NSTemporaryDirectory();
      sub_1BFA17B38();

      sub_1BFA168D8();
      swift_bridgeObjectRelease();
      uint64_t v38 = v29;
      sub_1BFA168F8();
      uint64_t v31 = v42;
      unint64_t v32 = *(void (**)(char *, uint64_t))(v42 + 8);
      v32(v7, v4);
      uint64_t v33 = v39;
      long long v34 = (void *)v45[6];
      sub_1BFA16948();
      if (v34)
      {
        v32(v9, v4);

        uint64_t v35 = 1;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v12, v9, v4);
        uint64_t v35 = 0;
      }
      unint64_t v36 = v40;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56))(v12, v35, 1, v4);
      swift_bridgeObjectRelease();
      sub_1BF977A9C(v33, v36);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v12, 1, v4) != 1)
      {
        *(void *)(a2 + 24) = v4;
        boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)a2);
        (*(void (**)(uint64_t *, char *, uint64_t))(v31 + 32))(boxed_opaque_existential_2, v12, v4);
        goto LABEL_25;
      }
      sub_1BFA1653C((uint64_t)v12, (uint64_t)&qword_1EA17A520, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1BFA1659C);
    }
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
LABEL_25:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
    return swift_release();
  }
  if (v17 == *MEMORY[0x1E4FAC130]
    || v17 == *MEMORY[0x1E4FAC120]
    || v17 == *MEMORY[0x1E4FAC118]
    || v17 == *MEMORY[0x1E4FAC138])
  {
    (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
    uint64_t result = swift_release();
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  return result;
}

id sub_1BFA15B0C(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_1BFA17B38();
    a4 = (void *)sub_1BFA17B08();
    swift_bridgeObjectRelease();
  }
  v11.receiver = a1;
  v11.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v11, sel_initWithStyle_reuseIdentifier_, a5, a4);

  return v9;
}

id sub_1BFA15BF8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  id ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = *a3;
  uint64_t v10 = a3[1];
  uint64_t v12 = OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView;
  id v13 = objc_allocWithZone(MEMORY[0x1E4FB1D00]);
  uint64_t v14 = v5;
  *(void *)&v5[v12] = objc_msgSend(v13, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);
  uint64_t v15 = &v14[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_identifier];
  *(void *)uint64_t v15 = v11;
  *((void *)v15 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = v10;
  id v16 = &v14[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_commandCenter];
  *(void *)id v16 = a1;
  *((void *)v16 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = a2;
  int v17 = &v14[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal];
  *(void *)int v17 = v11;
  *((void *)v17 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = v10;
  long long v18 = *((_OWORD *)a3 + 4);
  *((_OWORD *)v17 + 3) = *((_OWORD *)a3 + 3);
  *((_OWORD *)v17 + 4) = v18;
  long long v19 = *((_OWORD *)a3 + 2);
  *((_OWORD *)v17 + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = *((_OWORD *)a3 + 1);
  *((_OWORD *)v17 + 2) = v19;
  long long v20 = *((_OWORD *)a3 + 8);
  *((_OWORD *)v17 + 7) = *((_OWORD *)a3 + 7);
  *((_OWORD *)v17 + 8) = v20;
  long long v21 = *((_OWORD *)a3 + 6);
  *((_OWORD *)v17 + 5) = *((_OWORD *)a3 + 5);
  *((_OWORD *)v17 + 6) = v21;
  *(void *)&v14[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_presentationOptions] = a4;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();

  v24.receiver = v14;
  v24.super_class = ObjectType;
  return objc_msgSendSuper2(&v24, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for DebugJournalValueTableViewCell()
{
  return self;
}

uint64_t type metadata accessor for DebugJournalSubtitleTableViewCell()
{
  return self;
}

uint64_t sub_1BFA15D80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return MEMORY[0x1E4FBC860];
  }
  unint64_t v6 = 0;
  uint64_t v7 = OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_presentationOptions;
  uint64_t v8 = a1 + 32;
  uint64_t v9 = a2 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 128;
  uint64_t v10 = a2 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 136;
  uint64_t v11 = a2 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 120;
  uint64_t v12 = a2 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 112;
  uint64_t v13 = MEMORY[0x1E4FBC860];
LABEL_3:
  uint64_t v14 = 0;
  if (v6 <= v4) {
    unint64_t v15 = v4;
  }
  else {
    unint64_t v15 = v6;
  }
  unint64_t v16 = v6 - v15;
  unint64_t v17 = v4;
  uint64_t v18 = v8;
  while (2)
  {
    if (!(v16 + v14))
    {
      __break(1u);
      JUMPOUT(0x1BFA15F60);
    }
    char v19 = *(unsigned char *)(v18 + v6);
    uint64_t v20 = v12;
    switch(v19)
    {
      case 1:
        goto LABEL_14;
      case 2:
        uint64_t v20 = v11;
        goto LABEL_14;
      case 3:
        uint64_t v20 = v10;
        goto LABEL_14;
      case 4:
        uint64_t v20 = v9;
LABEL_14:
        if (!*(void *)(*(void *)v20 + 16)) {
          goto LABEL_15;
        }
        goto LABEL_17;
      default:
        if (!*(void *)(*(void *)(a2 + v7) + 16))
        {
LABEL_15:
          ++v14;
          ++v18;
          if (v6 == --v17) {
            return v13;
          }
          continue;
        }
LABEL_17:
        uint64_t v27 = v11;
        uint64_t v28 = v10;
        uint64_t v29 = v9;
        uint64_t v30 = v8;
        uint64_t v31 = v7;
        uint64_t v26 = v3;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_1BF974B08(0, *(void *)(v13 + 16) + 1, 1);
        }
        unint64_t v22 = *(void *)(v13 + 16);
        unint64_t v21 = *(void *)(v13 + 24);
        unint64_t v23 = v22 + 1;
        uint64_t v8 = v30;
        uint64_t v7 = v31;
        uint64_t v10 = v28;
        uint64_t v9 = v29;
        uint64_t v11 = v27;
        if (v22 >= v21 >> 1)
        {
          sub_1BF974B08((char *)(v21 > 1), v22 + 1, 1);
          unint64_t v23 = v22 + 1;
          uint64_t v11 = v27;
          uint64_t v10 = v28;
          uint64_t v9 = v29;
          uint64_t v8 = v30;
          uint64_t v7 = v31;
        }
        unint64_t v24 = v6 + 1;
        v6 += 1 + v14;
        *(void *)(v13 + 16) = v23;
        *(unsigned char *)(v13 + v22 + 32) = v19;
        uint64_t v3 = v26;
        if (v24 != v17) {
          goto LABEL_3;
        }
        return v13;
    }
  }
}

unint64_t sub_1BFA15F74()
{
  unint64_t result = qword_1EA17A408;
  if (!qword_1EA17A408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A408);
  }
  return result;
}

uint64_t sub_1BFA15FC8(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1BFA16794(255, &qword_1EA17A0F8, (uint64_t)&type metadata for AdContextBuilderSnapshot.SerializedSnapshotEntry, MEMORY[0x1E4FBB320]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BFA16058(unint64_t result)
{
  if (result >= 5) {
    return 5;
  }
  return result;
}

uint64_t sub_1BFA16068(unint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = sub_1BFA15D80((uint64_t)&unk_1F1B14988, (uint64_t)v3);

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(void *)(v4 + 16) <= a1)
  {
LABEL_12:
    __break(1u);
    JUMPOUT(0x1BFA16178);
  }
  uint64_t v5 = *(unsigned __int8 *)(v4 + a1 + 32);
  swift_bridgeObjectRelease();
  switch(v5)
  {
    case 1:
      uint64_t v7 = *(void *)&v3[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 112];
      goto LABEL_9;
    case 2:
      uint64_t v7 = *(void *)&v3[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 120];
      goto LABEL_9;
    case 3:
      uint64_t v7 = *(void *)&v3[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 136];
      goto LABEL_9;
    case 4:
      uint64_t v7 = *(void *)&v3[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 128];
LABEL_9:
      uint64_t result = *(void *)(v7 + 16);
      break;
    default:
      uint64_t result = 2
             * (*(void *)(*(void *)&v3[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_presentationOptions]
                          + 16) != 0);
      break;
  }
  return result;
}

unint64_t sub_1BFA1618C(unint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = sub_1BFA15D80((uint64_t)&unk_1F1B14988, (uint64_t)v3);

  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (*(void *)(v4 + 16) <= a1)
  {
LABEL_15:
    __break(1u);
    JUMPOUT(0x1BFA16304);
  }
  uint64_t v5 = *(unsigned __int8 *)(v4 + a1 + 32);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  switch(v5)
  {
    case 1:
      BOOL v7 = *(void *)(*(void *)&v3[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 112] + 16) == 0;
      uint64_t v8 = 0x736C6961746544;
      goto LABEL_10;
    case 2:
      if (*(void *)(*(void *)&v3[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 120] + 16)) {
        return 0xD000000000000012;
      }
      else {
        return 0;
      }
    case 3:
      BOOL v7 = *(void *)(*(void *)&v3[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 136] + 16) == 0;
      uint64_t v8 = 0x736E6F69746341;
      goto LABEL_10;
    case 4:
      BOOL v7 = *(void *)(*(void *)&v3[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal + 128] + 16) == 0;
      uint64_t v8 = 0x79726F74736948;
LABEL_10:
      if (v7) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v8;
      }
      break;
    default:
      return v6;
  }
  return v6;
}

uint64_t sub_1BFA16318(uint64_t a1)
{
  return a1;
}

unint64_t sub_1BFA16370()
{
  unint64_t result = qword_1EA17A420;
  if (!qword_1EA17A420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A420);
  }
  return result;
}

uint64_t type metadata accessor for DebugJournalViewController()
{
  return self;
}

uint64_t method lookup function for DebugJournalViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DebugJournalViewController);
}

uint64_t dispatch thunk of DebugJournalViewController.__allocating_init(commandCenter:journal:presentationOptions:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

unsigned char *storeEnumTagSinglePayload for DebugJournalViewController.PresentationOptions(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BFA164B0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DebugJournalViewController.PresentationOptions()
{
  return &type metadata for DebugJournalViewController.PresentationOptions;
}

unint64_t sub_1BFA164E8()
{
  unint64_t result = qword_1EA17A508;
  if (!qword_1EA17A508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A508);
  }
  return result;
}

uint64_t sub_1BFA1653C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

void sub_1BFA1659C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for DebugJournalViewController.Section(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BFA166CCLL);
      case 4:
        *(_DWORD *)(result + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = v6;
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
        *(_WORD *)(result + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + sub_1BFA0E454((const char **)&selRef_mediaExpandedAtPosition_fullScreen_, 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DebugJournalViewController.Section()
{
  return &type metadata for DebugJournalViewController.Section;
}

ValueMetadata *_s7NewsAds7TrackerVMa_0()
{
  return &_s7NewsAds7TrackerVN_0;
}

unint64_t sub_1BFA16718()
{
  unint64_t result = qword_1EA17A528;
  if (!qword_1EA17A528)
  {
    sub_1BFA16794(255, &qword_1EA17A530, (uint64_t)&type metadata for DebugJournalViewController.Section, MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A528);
  }
  return result;
}

void sub_1BFA16794(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_1BFA167E4()
{
  unint64_t result = qword_1EA17A538;
  if (!qword_1EA17A538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA17A538);
  }
  return result;
}

uint64_t sub_1BFA16838()
{
  return MEMORY[0x1F40E3098]();
}

uint64_t sub_1BFA16848()
{
  return MEMORY[0x1F40E30A8]();
}

uint64_t sub_1BFA16858()
{
  return MEMORY[0x1F40E30C0]();
}

uint64_t sub_1BFA16868()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1BFA16878()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1BFA16888()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1BFA16898()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1BFA168A8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1BFA168B8()
{
  return MEMORY[0x1F40E4758]();
}

uint64_t sub_1BFA168C8()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1BFA168D8()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1BFA168E8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1BFA168F8()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1BFA16908()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1BFA16918()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1BFA16928()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1BFA16938()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1BFA16948()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1BFA16958()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1BFA16968()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1BFA16978()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1BFA16988()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1BFA16998()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1BFA169A8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1BFA169B8()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1BFA169C8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1BFA169D8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1BFA169E8()
{
  return MEMORY[0x1F40E5520]();
}

uint64_t sub_1BFA169F8()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1BFA16A08()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1BFA16A18()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1BFA16A28()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1BFA16A38()
{
  return MEMORY[0x1F4165748]();
}

uint64_t sub_1BFA16A48()
{
  return MEMORY[0x1F4165760]();
}

uint64_t sub_1BFA16A58()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1BFA16A68()
{
  return MEMORY[0x1F415F218]();
}

uint64_t sub_1BFA16A78()
{
  return MEMORY[0x1F415F220]();
}

uint64_t sub_1BFA16AA8()
{
  return MEMORY[0x1F415F248]();
}

uint64_t sub_1BFA16AC8()
{
  return MEMORY[0x1F415F260]();
}

uint64_t sub_1BFA16AD8()
{
  return MEMORY[0x1F415F270]();
}

uint64_t sub_1BFA16AE8()
{
  return MEMORY[0x1F415F278]();
}

uint64_t sub_1BFA16AF8()
{
  return MEMORY[0x1F415F280]();
}

uint64_t sub_1BFA16B08()
{
  return MEMORY[0x1F415F290]();
}

uint64_t sub_1BFA16B18()
{
  return MEMORY[0x1F415F2D0]();
}

uint64_t sub_1BFA16B28()
{
  return MEMORY[0x1F415F308]();
}

uint64_t sub_1BFA16B38()
{
  return MEMORY[0x1F415F310]();
}

uint64_t sub_1BFA16B48()
{
  return MEMORY[0x1F415F320]();
}

uint64_t sub_1BFA16B58()
{
  return MEMORY[0x1F415F340]();
}

uint64_t sub_1BFA16B68()
{
  return MEMORY[0x1F415F348]();
}

uint64_t sub_1BFA16B78()
{
  return MEMORY[0x1F415F380]();
}

uint64_t sub_1BFA16B88()
{
  return MEMORY[0x1F415F390]();
}

uint64_t sub_1BFA16B98()
{
  return MEMORY[0x1F415F398]();
}

uint64_t sub_1BFA16BA8()
{
  return MEMORY[0x1F415F3A8]();
}

uint64_t sub_1BFA16BB8()
{
  return MEMORY[0x1F415F3B0]();
}

uint64_t sub_1BFA16BC8()
{
  return MEMORY[0x1F415F3B8]();
}

uint64_t sub_1BFA16BD8()
{
  return MEMORY[0x1F415F3C0]();
}

uint64_t sub_1BFA16BE8()
{
  return MEMORY[0x1F415F3D0]();
}

uint64_t sub_1BFA16BF8()
{
  return MEMORY[0x1F415F3D8]();
}

uint64_t sub_1BFA16C08()
{
  return MEMORY[0x1F415F3E0]();
}

uint64_t sub_1BFA16C18()
{
  return MEMORY[0x1F415F3E8]();
}

uint64_t sub_1BFA16C28()
{
  return MEMORY[0x1F415F3F0]();
}

uint64_t sub_1BFA16C38()
{
  return MEMORY[0x1F415F3F8]();
}

uint64_t sub_1BFA16C48()
{
  return MEMORY[0x1F415F428]();
}

uint64_t sub_1BFA16C58()
{
  return MEMORY[0x1F415F430]();
}

uint64_t sub_1BFA16C68()
{
  return MEMORY[0x1F415F440]();
}

uint64_t sub_1BFA16C78()
{
  return MEMORY[0x1F415F450]();
}

uint64_t sub_1BFA16C88()
{
  return MEMORY[0x1F415F720]();
}

uint64_t sub_1BFA16C98()
{
  return MEMORY[0x1F415F738]();
}

uint64_t sub_1BFA16CA8()
{
  return MEMORY[0x1F415F780]();
}

uint64_t sub_1BFA16CB8()
{
  return MEMORY[0x1F415F868]();
}

uint64_t sub_1BFA16CC8()
{
  return MEMORY[0x1F415F870]();
}

uint64_t sub_1BFA16CD8()
{
  return MEMORY[0x1F415F878]();
}

uint64_t sub_1BFA16CF8()
{
  return MEMORY[0x1F415D9E0]();
}

uint64_t sub_1BFA16D08()
{
  return MEMORY[0x1F415D9F0]();
}

uint64_t sub_1BFA16D18()
{
  return MEMORY[0x1F415D9F8]();
}

uint64_t sub_1BFA16D28()
{
  return MEMORY[0x1F415DA08]();
}

uint64_t sub_1BFA16D38()
{
  return MEMORY[0x1F415DAC0]();
}

uint64_t sub_1BFA16D48()
{
  return MEMORY[0x1F415DAC8]();
}

uint64_t sub_1BFA16D58()
{
  return MEMORY[0x1F415DAD0]();
}

uint64_t sub_1BFA16D68()
{
  return MEMORY[0x1F415DAD8]();
}

uint64_t sub_1BFA16D78()
{
  return MEMORY[0x1F415DAE0]();
}

uint64_t sub_1BFA16D88()
{
  return MEMORY[0x1F415DAE8]();
}

uint64_t sub_1BFA16D98()
{
  return MEMORY[0x1F415DB80]();
}

uint64_t sub_1BFA16DA8()
{
  return MEMORY[0x1F415DCA0]();
}

uint64_t sub_1BFA16DB8()
{
  return MEMORY[0x1F415DCB8]();
}

uint64_t sub_1BFA16DC8()
{
  return MEMORY[0x1F415DD30]();
}

uint64_t sub_1BFA16DD8()
{
  return MEMORY[0x1F415DD50]();
}

uint64_t sub_1BFA16DE8()
{
  return MEMORY[0x1F415DD58]();
}

uint64_t sub_1BFA16DF8()
{
  return MEMORY[0x1F415DD68]();
}

uint64_t sub_1BFA16E08()
{
  return MEMORY[0x1F415DD70]();
}

uint64_t sub_1BFA16E18()
{
  return MEMORY[0x1F415DE28]();
}

uint64_t sub_1BFA16E28()
{
  return MEMORY[0x1F415DF90]();
}

uint64_t sub_1BFA16E38()
{
  return MEMORY[0x1F415DF98]();
}

uint64_t sub_1BFA16E48()
{
  return MEMORY[0x1F415DFA0]();
}

uint64_t sub_1BFA16E58()
{
  return MEMORY[0x1F415DFD8]();
}

uint64_t sub_1BFA16E68()
{
  return MEMORY[0x1F415DFE8]();
}

uint64_t sub_1BFA16E78()
{
  return MEMORY[0x1F415DFF0]();
}

uint64_t sub_1BFA16E88()
{
  return MEMORY[0x1F415DFF8]();
}

uint64_t sub_1BFA16E98()
{
  return MEMORY[0x1F415E010]();
}

uint64_t sub_1BFA16EA8()
{
  return MEMORY[0x1F415E078]();
}

uint64_t sub_1BFA16EB8()
{
  return MEMORY[0x1F415E088]();
}

uint64_t sub_1BFA16EC8()
{
  return MEMORY[0x1F415E090]();
}

uint64_t sub_1BFA16ED8()
{
  return MEMORY[0x1F415E0F8]();
}

uint64_t sub_1BFA16EE8()
{
  return MEMORY[0x1F415E108]();
}

uint64_t sub_1BFA16EF8()
{
  return MEMORY[0x1F415E538]();
}

uint64_t sub_1BFA16F08()
{
  return MEMORY[0x1F415E550]();
}

uint64_t sub_1BFA16F18()
{
  return MEMORY[0x1F415E6A0]();
}

uint64_t sub_1BFA16F28()
{
  return MEMORY[0x1F415E6A8]();
}

uint64_t sub_1BFA16F38()
{
  return MEMORY[0x1F415E6B0]();
}

uint64_t sub_1BFA16F48()
{
  return MEMORY[0x1F415E840]();
}

uint64_t sub_1BFA16F58()
{
  return MEMORY[0x1F415E848]();
}

uint64_t sub_1BFA16F68()
{
  return MEMORY[0x1F415E8E0]();
}

uint64_t sub_1BFA16F78()
{
  return MEMORY[0x1F415EA00]();
}

uint64_t sub_1BFA16F88()
{
  return MEMORY[0x1F415EA48]();
}

uint64_t sub_1BFA16F98()
{
  return MEMORY[0x1F415EA60]();
}

uint64_t sub_1BFA16FA8()
{
  return MEMORY[0x1F415EA68]();
}

uint64_t sub_1BFA16FB8()
{
  return MEMORY[0x1F415EA70]();
}

uint64_t sub_1BFA16FC8()
{
  return MEMORY[0x1F415EA78]();
}

uint64_t sub_1BFA16FD8()
{
  return MEMORY[0x1F415EA98]();
}

uint64_t sub_1BFA16FE8()
{
  return MEMORY[0x1F415EAA0]();
}

uint64_t sub_1BFA16FF8()
{
  return MEMORY[0x1F415EAA8]();
}

uint64_t sub_1BFA17008()
{
  return MEMORY[0x1F415EB18]();
}

uint64_t sub_1BFA17018()
{
  return MEMORY[0x1F415EB28]();
}

uint64_t sub_1BFA17028()
{
  return MEMORY[0x1F415EB38]();
}

uint64_t sub_1BFA17038()
{
  return MEMORY[0x1F415EB40]();
}

uint64_t sub_1BFA17048()
{
  return MEMORY[0x1F415EB48]();
}

uint64_t sub_1BFA17058()
{
  return MEMORY[0x1F415EB50]();
}

uint64_t sub_1BFA17068()
{
  return MEMORY[0x1F415EB58]();
}

uint64_t sub_1BFA17078()
{
  return MEMORY[0x1F415EBA0]();
}

uint64_t sub_1BFA17088()
{
  return MEMORY[0x1F415EC10]();
}

uint64_t sub_1BFA17098()
{
  return MEMORY[0x1F415EC18]();
}

uint64_t sub_1BFA170A8()
{
  return MEMORY[0x1F415EC48]();
}

uint64_t sub_1BFA170B8()
{
  return MEMORY[0x1F415EC60]();
}

uint64_t sub_1BFA170C8()
{
  return MEMORY[0x1F415EC70]();
}

uint64_t sub_1BFA170D8()
{
  return MEMORY[0x1F415ECC8]();
}

uint64_t sub_1BFA170E8()
{
  return MEMORY[0x1F415ED08]();
}

uint64_t sub_1BFA170F8()
{
  return MEMORY[0x1F415EE18]();
}

uint64_t sub_1BFA17118()
{
  return MEMORY[0x1F415EF20]();
}

uint64_t sub_1BFA17128()
{
  return MEMORY[0x1F415EF88]();
}

uint64_t sub_1BFA17138()
{
  return MEMORY[0x1F41464D0]();
}

uint64_t sub_1BFA17148()
{
  return MEMORY[0x1F41464F8]();
}

uint64_t sub_1BFA17158()
{
  return MEMORY[0x1F4146500]();
}

uint64_t sub_1BFA17168()
{
  return MEMORY[0x1F4146548]();
}

uint64_t sub_1BFA17178()
{
  return MEMORY[0x1F4146558]();
}

uint64_t sub_1BFA17188()
{
  return MEMORY[0x1F4146560]();
}

uint64_t sub_1BFA17198()
{
  return MEMORY[0x1F4146568]();
}

uint64_t sub_1BFA171A8()
{
  return MEMORY[0x1F4146570]();
}

uint64_t sub_1BFA171B8()
{
  return MEMORY[0x1F4146578]();
}

uint64_t sub_1BFA171C8()
{
  return MEMORY[0x1F4146580]();
}

uint64_t sub_1BFA171D8()
{
  return MEMORY[0x1F4146590]();
}

uint64_t sub_1BFA171E8()
{
  return MEMORY[0x1F41465A8]();
}

uint64_t sub_1BFA171F8()
{
  return MEMORY[0x1F4146658]();
}

uint64_t sub_1BFA17208()
{
  return MEMORY[0x1F4146660]();
}

uint64_t sub_1BFA17218()
{
  return MEMORY[0x1F4146668]();
}

uint64_t sub_1BFA17228()
{
  return MEMORY[0x1F4146670]();
}

uint64_t sub_1BFA17238()
{
  return MEMORY[0x1F41466A0]();
}

uint64_t sub_1BFA17248()
{
  return MEMORY[0x1F41466A8]();
}

uint64_t sub_1BFA17258()
{
  return MEMORY[0x1F41466B0]();
}

uint64_t sub_1BFA17268()
{
  return MEMORY[0x1F41466B8]();
}

uint64_t sub_1BFA17278()
{
  return MEMORY[0x1F4146808]();
}

uint64_t sub_1BFA17288()
{
  return MEMORY[0x1F4146828]();
}

uint64_t sub_1BFA17298()
{
  return MEMORY[0x1F4146830]();
}

uint64_t sub_1BFA172A8()
{
  return MEMORY[0x1F4146838]();
}

uint64_t sub_1BFA172B8()
{
  return MEMORY[0x1F4146840]();
}

uint64_t sub_1BFA172C8()
{
  return MEMORY[0x1F4146880]();
}

uint64_t sub_1BFA172D8()
{
  return MEMORY[0x1F4146888]();
}

uint64_t sub_1BFA172E8()
{
  return MEMORY[0x1F4146890]();
}

uint64_t sub_1BFA172F8()
{
  return MEMORY[0x1F4146898]();
}

uint64_t sub_1BFA17308()
{
  return MEMORY[0x1F41468A8]();
}

uint64_t sub_1BFA17318()
{
  return MEMORY[0x1F41468B0]();
}

uint64_t sub_1BFA17328()
{
  return MEMORY[0x1F41468C8]();
}

uint64_t sub_1BFA17338()
{
  return MEMORY[0x1F41468D0]();
}

uint64_t sub_1BFA17348()
{
  return MEMORY[0x1F41468E0]();
}

uint64_t sub_1BFA17358()
{
  return MEMORY[0x1F41468E8]();
}

uint64_t sub_1BFA17368()
{
  return MEMORY[0x1F41468F0]();
}

uint64_t sub_1BFA17378()
{
  return MEMORY[0x1F41468F8]();
}

uint64_t sub_1BFA17388()
{
  return MEMORY[0x1F4146900]();
}

uint64_t sub_1BFA17398()
{
  return MEMORY[0x1F4146908]();
}

uint64_t sub_1BFA173A8()
{
  return MEMORY[0x1F4146910]();
}

uint64_t sub_1BFA173B8()
{
  return MEMORY[0x1F4146918]();
}

uint64_t sub_1BFA173C8()
{
  return MEMORY[0x1F4146920]();
}

uint64_t sub_1BFA173D8()
{
  return MEMORY[0x1F4146928]();
}

uint64_t sub_1BFA173E8()
{
  return MEMORY[0x1F4146930]();
}

uint64_t sub_1BFA173F8()
{
  return MEMORY[0x1F4146938]();
}

uint64_t sub_1BFA17408()
{
  return MEMORY[0x1F4146940]();
}

uint64_t sub_1BFA17418()
{
  return MEMORY[0x1F4146948]();
}

uint64_t sub_1BFA17428()
{
  return MEMORY[0x1F4146950]();
}

uint64_t sub_1BFA17438()
{
  return MEMORY[0x1F4146958]();
}

uint64_t sub_1BFA17448()
{
  return MEMORY[0x1F4146960]();
}

uint64_t sub_1BFA17458()
{
  return MEMORY[0x1F4146968]();
}

uint64_t sub_1BFA17468()
{
  return MEMORY[0x1F4146970]();
}

uint64_t sub_1BFA17478()
{
  return MEMORY[0x1F4146978]();
}

uint64_t sub_1BFA17488()
{
  return MEMORY[0x1F4146980]();
}

uint64_t sub_1BFA17498()
{
  return MEMORY[0x1F4146988]();
}

uint64_t sub_1BFA174A8()
{
  return MEMORY[0x1F4146990]();
}

uint64_t sub_1BFA174C8()
{
  return MEMORY[0x1F41469A0]();
}

uint64_t sub_1BFA174D8()
{
  return MEMORY[0x1F41469A8]();
}

uint64_t sub_1BFA174E8()
{
  return MEMORY[0x1F41469B0]();
}

uint64_t sub_1BFA174F8()
{
  return MEMORY[0x1F41469B8]();
}

uint64_t sub_1BFA17508()
{
  return MEMORY[0x1F41469C0]();
}

uint64_t sub_1BFA17518()
{
  return MEMORY[0x1F41469C8]();
}

uint64_t sub_1BFA17528()
{
  return MEMORY[0x1F41469D0]();
}

uint64_t sub_1BFA17538()
{
  return MEMORY[0x1F41469D8]();
}

uint64_t sub_1BFA17548()
{
  return MEMORY[0x1F41469E0]();
}

uint64_t sub_1BFA17558()
{
  return MEMORY[0x1F41469E8]();
}

uint64_t sub_1BFA17568()
{
  return MEMORY[0x1F41469F0]();
}

uint64_t sub_1BFA17578()
{
  return MEMORY[0x1F4146A00]();
}

uint64_t sub_1BFA17588()
{
  return MEMORY[0x1F4146A08]();
}

uint64_t sub_1BFA17598()
{
  return MEMORY[0x1F4146A10]();
}

uint64_t sub_1BFA175A8()
{
  return MEMORY[0x1F4146A18]();
}

uint64_t sub_1BFA175B8()
{
  return MEMORY[0x1F4146A20]();
}

uint64_t sub_1BFA175C8()
{
  return MEMORY[0x1F4146A28]();
}

uint64_t sub_1BFA175D8()
{
  return MEMORY[0x1F4146A30]();
}

uint64_t sub_1BFA175E8()
{
  return MEMORY[0x1F4146A38]();
}

uint64_t sub_1BFA175F8()
{
  return MEMORY[0x1F4146A40]();
}

uint64_t sub_1BFA17608()
{
  return MEMORY[0x1F4146A48]();
}

uint64_t sub_1BFA17618()
{
  return MEMORY[0x1F4146A50]();
}

uint64_t sub_1BFA17628()
{
  return MEMORY[0x1F4146A58]();
}

uint64_t sub_1BFA17638()
{
  return MEMORY[0x1F4146A60]();
}

uint64_t sub_1BFA17648()
{
  return MEMORY[0x1F4146A68]();
}

uint64_t sub_1BFA17668()
{
  return MEMORY[0x1F4146A78]();
}

uint64_t sub_1BFA17678()
{
  return MEMORY[0x1F4146A80]();
}

uint64_t sub_1BFA17688()
{
  return MEMORY[0x1F4146BE8]();
}

uint64_t sub_1BFA17698()
{
  return MEMORY[0x1F4146C10]();
}

uint64_t sub_1BFA176A8()
{
  return MEMORY[0x1F4146CE8]();
}

uint64_t sub_1BFA176B8()
{
  return MEMORY[0x1F4146CF0]();
}

uint64_t sub_1BFA176C8()
{
  return MEMORY[0x1F4146CF8]();
}

uint64_t sub_1BFA176D8()
{
  return MEMORY[0x1F4146D00]();
}

uint64_t sub_1BFA176E8()
{
  return MEMORY[0x1F4146D08]();
}

uint64_t sub_1BFA176F8()
{
  return MEMORY[0x1F4146D10]();
}

uint64_t sub_1BFA17708()
{
  return MEMORY[0x1F4146D18]();
}

uint64_t sub_1BFA17718()
{
  return MEMORY[0x1F4146D20]();
}

uint64_t sub_1BFA17728()
{
  return MEMORY[0x1F4146D30]();
}

uint64_t sub_1BFA17738()
{
  return MEMORY[0x1F4146D38]();
}

uint64_t sub_1BFA17748()
{
  return MEMORY[0x1F4146D40]();
}

uint64_t sub_1BFA17758()
{
  return MEMORY[0x1F4146D48]();
}

uint64_t sub_1BFA17768()
{
  return MEMORY[0x1F4146D50]();
}

uint64_t sub_1BFA17778()
{
  return MEMORY[0x1F4146D70]();
}

uint64_t sub_1BFA17788()
{
  return MEMORY[0x1F4146D78]();
}

uint64_t sub_1BFA17798()
{
  return MEMORY[0x1F4146D80]();
}

uint64_t sub_1BFA177A8()
{
  return MEMORY[0x1F4146D88]();
}

uint64_t sub_1BFA177B8()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1BFA177C8()
{
  return MEMORY[0x1F4160378]();
}

uint64_t sub_1BFA177D8()
{
  return MEMORY[0x1F4160380]();
}

uint64_t sub_1BFA177E8()
{
  return MEMORY[0x1F4160560]();
}

uint64_t sub_1BFA177F8()
{
  return MEMORY[0x1F4160680]();
}

uint64_t sub_1BFA17808()
{
  return MEMORY[0x1F4160920]();
}

uint64_t sub_1BFA17818()
{
  return MEMORY[0x1F4160B00]();
}

uint64_t sub_1BFA17828()
{
  return MEMORY[0x1F4160B08]();
}

uint64_t sub_1BFA17838()
{
  return MEMORY[0x1F4160D88]();
}

uint64_t sub_1BFA17848()
{
  return MEMORY[0x1F41617B8]();
}

uint64_t sub_1BFA17858()
{
  return MEMORY[0x1F41617D0]();
}

uint64_t sub_1BFA17868()
{
  return MEMORY[0x1F41617E0]();
}

uint64_t sub_1BFA17878()
{
  return MEMORY[0x1F4161CA8]();
}

uint64_t sub_1BFA17888()
{
  return MEMORY[0x1F4162398]();
}

uint64_t sub_1BFA17898()
{
  return MEMORY[0x1F41623A0]();
}

uint64_t sub_1BFA178A8()
{
  return MEMORY[0x1F4162ED8]();
}

uint64_t sub_1BFA178B8()
{
  return MEMORY[0x1F4162EE0]();
}

uint64_t sub_1BFA178C8()
{
  return MEMORY[0x1F4162F30]();
}

uint64_t sub_1BFA178D8()
{
  return MEMORY[0x1F4162F38]();
}

uint64_t sub_1BFA178E8()
{
  return MEMORY[0x1F4162F40]();
}

uint64_t sub_1BFA178F8()
{
  return MEMORY[0x1F4162F50]();
}

uint64_t sub_1BFA17908()
{
  return MEMORY[0x1F4162F58]();
}

uint64_t sub_1BFA17918()
{
  return MEMORY[0x1F4162F60]();
}

uint64_t sub_1BFA17928()
{
  return MEMORY[0x1F4163018]();
}

uint64_t sub_1BFA17938()
{
  return MEMORY[0x1F4163028]();
}

uint64_t sub_1BFA17948()
{
  return MEMORY[0x1F4165D70]();
}

uint64_t sub_1BFA17958()
{
  return MEMORY[0x1F4165D88]();
}

uint64_t sub_1BFA17968()
{
  return MEMORY[0x1F4165DF0]();
}

uint64_t sub_1BFA17978()
{
  return MEMORY[0x1F4165E28]();
}

uint64_t sub_1BFA17988()
{
  return MEMORY[0x1F4165F20]();
}

uint64_t sub_1BFA17998()
{
  return MEMORY[0x1F4165F30]();
}

uint64_t sub_1BFA179A8()
{
  return MEMORY[0x1F4165F68]();
}

uint64_t sub_1BFA179B8()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1BFA179C8()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1BFA179D8()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1BFA179E8()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1BFA179F8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1BFA17A08()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1BFA17A18()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1BFA17A28()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1BFA17A38()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1BFA17A48()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1BFA17A58()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1BFA17A68()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1BFA17A78()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1BFA17A88()
{
  return MEMORY[0x1F4183320]();
}

uint64_t sub_1BFA17A98()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1BFA17AA8()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1BFA17AB8()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1BFA17AC8()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1BFA17AD8()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1BFA17AE8()
{
  return MEMORY[0x1F41836E0]();
}

uint64_t sub_1BFA17AF8()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1BFA17B08()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BFA17B18()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1BFA17B28()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1BFA17B38()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BFA17B48()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1BFA17B58()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1BFA17B68()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1BFA17B78()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1BFA17B88()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1BFA17B98()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1BFA17BA8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BFA17BB8()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1BFA17BC8()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1BFA17BD8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1BFA17BE8()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1BFA17BF8()
{
  return MEMORY[0x1F415F030]();
}

uint64_t sub_1BFA17C08()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1BFA17C48()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1BFA17C58()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1BFA17C98()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1BFA17CA8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1BFA17CB8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1BFA17CC8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1BFA17CD8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1BFA17CE8()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1BFA17CF8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1BFA17D08()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1BFA17D18()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1BFA17D28()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1BFA17D38()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1BFA17D48()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1BFA17D58()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1BFA17D68()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1BFA17D78()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1BFA17D88()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1BFA17D98()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1BFA17DA8()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1BFA17DB8()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1BFA17DC8()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1BFA17DD8()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1BFA17DE8()
{
  return MEMORY[0x1F4184568]();
}

uint64_t sub_1BFA17DF8()
{
  return MEMORY[0x1F41634A8]();
}

uint64_t sub_1BFA17E08()
{
  return MEMORY[0x1F41634C8]();
}

uint64_t sub_1BFA17E18()
{
  return MEMORY[0x1F41634D8]();
}

uint64_t sub_1BFA17E28()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1BFA17E38()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1BFA17E48()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1BFA17E58()
{
  return MEMORY[0x1F41664E8]();
}

uint64_t sub_1BFA17E68()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1BFA17E78()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1BFA17E88()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1BFA17E98()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1BFA17EA8()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1BFA17EB8()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1BFA17EC8()
{
  return MEMORY[0x1F4163628]();
}

uint64_t sub_1BFA17ED8()
{
  return MEMORY[0x1F415FAC8]();
}

uint64_t sub_1BFA17EE8()
{
  return MEMORY[0x1F41636A8]();
}

uint64_t sub_1BFA17EF8()
{
  return MEMORY[0x1F41636F8]();
}

uint64_t sub_1BFA17F08()
{
  return MEMORY[0x1F4163710]();
}

uint64_t sub_1BFA17F18()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1BFA17F28()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1BFA17F38()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1BFA17F48()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1BFA17F58()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1BFA17F68()
{
  return MEMORY[0x1F4184AC8]();
}

uint64_t sub_1BFA17F78()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1BFA17F88()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1BFA17F98()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1BFA17FA8()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1BFA17FB8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1BFA17FC8()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1BFA17FD8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1BFA17FE8()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1BFA17FF8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1BFA18008()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1BFA18018()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1BFA18028()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1BFA18038()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1BFA18048()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1BFA18058()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1BFA18068()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1BFA18078()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1BFA18088()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1BFA18098()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1BFA180A8()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1BFA180B8()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1BFA180C8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1BFA180D8()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1BFA180E8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1BFA180F8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1BFA18108()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1BFA18118()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1BFA18128()
{
  return MEMORY[0x1F4185388]();
}

uint64_t sub_1BFA18148()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1BFA18158()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1BFA18168()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1BFA18178()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1BFA18188()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1BFA18198()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1BFA181A8()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1BFA181B8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1BFA181C8()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1BFA181D8()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1BFA181E8()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1BFA181F8()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1BFA18208()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1BFA18218()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1BFA18228()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1BFA18238()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1BFA18248()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1BFA18258()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BFA18268()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1BFA18288()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1BFA18298()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1BFA182A8()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1BFA182B8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1BFA182C8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1BFA182D8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1BFA182E8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1BFA182F8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BFA18308()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BFA18318()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1BFA18328()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1BFA18338()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1BFA18368()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t sub_1BFA18378()
{
  return MEMORY[0x1F4186318]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1F41866E8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1F4186818]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1F4186820]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1F4186828]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}