ValueMetadata *type metadata accessor for SizePreferenceKey()
{
  return &type metadata for SizePreferenceKey;
}

uint64_t sub_1000ABB28()
{
  return swift_getWitnessTable();
}

unint64_t sub_1000ABC58(unint64_t a1)
{
  unint64_t v2 = 0xD00000000000003ALL;
  if (a1 - 3 < 2) {
    goto LABEL_4;
  }
  if ((_BYTE)a1)
  {
    if (a1 != 17)
    {
      sub_1000E5CC0(22);
      swift_bridgeObjectRelease();
      unint64_t v4 = 0xD00000000000004CLL;
      goto LABEL_6;
    }
LABEL_4:
    unint64_t v4 = 0;
    sub_1000E5CC0(73);
    v5._countAndFlagsBits = 0xD00000000000003ALL;
    v5._object = (void *)0x80000001000EC6C0;
    sub_1000E5A70(v5);
    v6._countAndFlagsBits = 0xD000000000000045;
    v6._object = (void *)0x80000001000EC750;
    sub_1000E5A70(v6);
LABEL_6:
    v7._countAndFlagsBits = sub_1000AC1B4(a1);
    sub_1000E5A70(v7);
    swift_bridgeObjectRelease();
    return v4;
  }
  return v2;
}

uint64_t sub_1000ABD68(char a1)
{
  uint64_t v2 = sub_1000082B4(&qword_10012CDE8);
  __chkstk_darwin(v2 - 8);
  unint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = (id)WLKSystemSettingsDebugOverride();
  if (v5 && (Swift::String v6 = v5, v7 = [v5 BOOLValue], v6, v7))
  {
    sub_1000E3EF0();
    char v8 = 1;
  }
  else
  {
    char v8 = 1;
    switch(a1)
    {
      case 7:
      case 8:
        return sub_10006D6D4();
      case 9:
        if ((sub_10006D6D4() & 1) == 0) {
          goto LABEL_21;
        }
        id v13 = [self sharedPreferences];
        unsigned __int8 v14 = [v13 useCellularDataPlayback];
        goto LABEL_19;
      case 10:
        if (sub_10006D6D4())
        {
          id v13 = [self sharedPreferences];
          unsigned __int8 v14 = [v13 useCellularDataDownload];
LABEL_19:
          char v8 = v14;
        }
        else
        {
LABEL_21:
          char v8 = 0;
        }
        break;
      case 11:
      case 12:
      case 13:
        id v9 = [self defaultStore];
        if (!v9)
        {
          __break(1u);
          JUMPOUT(0x1000AC02CLL);
        }
        v10 = v9;
        sub_1000E5BA0();

        uint64_t v11 = sub_1000E5100();
        char v8 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v4, 1, v11) != 1;
        sub_10006D5E0((uint64_t)v4);
        return v8 & 1;
      case 14:
        char v8 = sub_10006D7D4() ^ 1;
        return v8 & 1;
      case 15:
        return sub_10006D7D4();
      case 16:
        id v13 = [self sharedPreferences];
        unsigned __int8 v14 = [v13 hasAVAdapterEvenBeenConnected];
        goto LABEL_19;
      case 17:
        id v15 = [self sharedPreferences];
        unsigned __int8 v16 = [v15 subtitleDefaultLanguageEnabledDownload];

        char v8 = v16 ^ 1;
        return v8 & 1;
      default:
        return v8 & 1;
    }
  }
  return v8 & 1;
}

uint64_t sub_1000AC074@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  if (sub_1000ABD68(a1))
  {
LABEL_2:
    uint64_t v4 = sub_1000E3910();
    id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
    uint64_t v6 = v4;
    uint64_t v7 = a2;
    uint64_t v8 = 1;
  }
  else
  {
    switch(a1)
    {
      case 3:
      case 14:
      case 15:
      case 17:
        sub_1000E38C0();
        break;
      case 7:
      case 8:
        goto LABEL_7;
      case 9:
      case 10:
        if (sub_10006D6D4()) {
          goto LABEL_2;
        }
LABEL_7:
        sub_1000E38D0();
        break;
      case 11:
      case 12:
      case 13:
        sub_1000E3900();
        break;
      default:
        goto LABEL_2;
    }
    uint64_t v9 = sub_1000E3910();
    id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
    uint64_t v6 = v9;
    uint64_t v7 = a2;
    uint64_t v8 = 0;
  }

  return v5(v7, v8, 1, v6);
}

unint64_t sub_1000AC1B4(unint64_t result)
{
  result = result;
  switch((char)result)
  {
    case 1:
      result = 0xD000000000000013;
      break;
    case 2:
      result = 0xD000000000000013;
      break;
    case 3:
      result = 0xD00000000000001CLL;
      break;
    case 4:
      result = 0xD00000000000001BLL;
      break;
    case 5:
      result = 0xD00000000000001ELL;
      break;
    case 6:
      result = 0xD00000000000001BLL;
      break;
    case 7:
      result = 0xD000000000000010;
      break;
    case 8:
      result = 0xD000000000000018;
      break;
    case 9:
    case 10:
    case 14:
      result = 0xD000000000000017;
      break;
    case 11:
      result = 0x70537374726F7053;
      break;
    case 12:
      result = 0x4879616C50657355;
      break;
    case 13:
      result = 0x69447478654E7055;
      break;
    case 15:
      result = 0xD000000000000018;
      break;
    case 16:
      result = 0xD000000000000020;
      break;
    case 17:
      result = 0xD000000000000021;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1000AC3D8(unint64_t result)
{
  result = result;
  switch((char)result)
  {
    case 1:
      result = 0xD000000000000013;
      break;
    case 2:
      result = 0xD000000000000013;
      break;
    case 3:
      result = 0xD00000000000001CLL;
      break;
    case 4:
      result = 0xD00000000000001BLL;
      break;
    case 5:
      result = 0xD00000000000001ELL;
      break;
    case 6:
      result = 0xD00000000000001BLL;
      break;
    case 7:
      result = 0xD000000000000010;
      break;
    case 8:
      result = 0xD000000000000018;
      break;
    case 9:
    case 10:
    case 14:
      result = 0xD000000000000017;
      break;
    case 11:
      result = 0x70537374726F7053;
      break;
    case 12:
      result = 0x4879616C50657355;
      break;
    case 13:
      result = 0x69447478654E7055;
      break;
    case 15:
      result = 0xD000000000000018;
      break;
    case 16:
      result = 0xD000000000000020;
      break;
    case 17:
      result = 0xD000000000000021;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000AC5FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unint64_t v2 = *a2;
  unint64_t v3 = sub_1000AC1B4(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_1000AC1B4(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1000E5DC0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_1000AC68C()
{
  unint64_t result = qword_10012E918;
  if (!qword_10012E918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012E918);
  }
  return result;
}

Swift::Int sub_1000AC6E0()
{
  unint64_t v1 = *v0;
  sub_1000E5E00();
  sub_1000AC1B4(v1);
  sub_1000E5A50();
  swift_bridgeObjectRelease();
  return sub_1000E5E20();
}

uint64_t sub_1000AC744()
{
  sub_1000AC1B4(*v0);
  sub_1000E5A50();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000AC798()
{
  unint64_t v1 = *v0;
  sub_1000E5E00();
  sub_1000AC1B4(v1);
  sub_1000E5A50();
  swift_bridgeObjectRelease();
  return sub_1000E5E20();
}

uint64_t sub_1000AC7F8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000ACAA8();
  *a1 = result;
  return result;
}

unint64_t sub_1000AC828@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000AC1B4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1000AC858()
{
  unint64_t result = qword_10012E920;
  if (!qword_10012E920)
  {
    sub_100008354(&qword_10012E928);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012E920);
  }
  return result;
}

void sub_1000AC8B4(void *a1@<X8>)
{
  *a1 = &off_100120330;
}

unint64_t sub_1000AC8C4()
{
  return sub_1000AC3D8(*v0);
}

uint64_t sub_1000AC8CC@<X0>(unsigned char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000ACAA8();
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for TVSettingsDestination(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEF) {
    goto LABEL_17;
  }
  if (a2 + 17 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 17) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 17;
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
      return (*a1 | (v4 << 8)) - 17;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 17;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x12;
  int v8 = v6 - 18;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TVSettingsDestination(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 17 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 17) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEE)
  {
    unsigned int v6 = ((a2 - 239) >> 8) + 1;
    *uint64_t result = a2 + 17;
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
        JUMPOUT(0x1000ACA70);
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
          *uint64_t result = a2 + 17;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TVSettingsDestination()
{
  return &type metadata for TVSettingsDestination;
}

uint64_t sub_1000ACAA8()
{
  unint64_t v0 = sub_1000E5DE0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x12) {
    return 18;
  }
  else {
    return v0;
  }
}

uint64_t *sub_1000ACAFC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v9 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_1000082B4(&qword_100129F20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000E41D0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = *(int *)(a3 + 24);
    v12 = (uint64_t *)((char *)a1 + v10);
    id v13 = (uint64_t *)((char *)a2 + v10);
    __dsta = (void *)v13[1];
    v95 = a1;
    void *v12 = *v13;
    v12[1] = __dsta;
    unsigned __int8 v14 = (char *)a1 + v11;
    id v15 = (char *)a2 + v11;
    uint64_t v92 = *(uint64_t *)((char *)a2 + v11 + 8);
    *(void *)unsigned __int8 v14 = *(uint64_t *)((char *)a2 + v11);
    *((void *)v14 + 1) = v92;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v11 + 16);
    uint64_t v17 = *(uint64_t *)((char *)a2 + v11 + 24);
    *((void *)v14 + 2) = v16;
    *((void *)v14 + 3) = v17;
    uint64_t v18 = *((void *)v15 + 5);
    *((void *)v14 + 4) = *((void *)v15 + 4);
    *((void *)v14 + 5) = v18;
    uint64_t v19 = *((void *)v15 + 7);
    *((void *)v14 + 6) = *((void *)v15 + 6);
    *((void *)v14 + 7) = v19;
    uint64_t v20 = *((void *)v15 + 9);
    *((void *)v14 + 8) = *((void *)v15 + 8);
    *((void *)v14 + 9) = v20;
    uint64_t v21 = *((void *)v15 + 11);
    *((void *)v14 + 10) = *((void *)v15 + 10);
    *((void *)v14 + 11) = v21;
    v14[96] = v15[96];
    *((void *)v14 + 13) = *((void *)v15 + 13);
    v14[112] = v15[112];
    uint64_t v22 = *((void *)v15 + 16);
    *((void *)v14 + 15) = *((void *)v15 + 15);
    *((void *)v14 + 16) = v22;
    uint64_t v23 = *((void *)v15 + 18);
    *((void *)v14 + 17) = *((void *)v15 + 17);
    *((void *)v14 + 18) = v23;
    uint64_t v24 = *((void *)v15 + 20);
    *((void *)v14 + 19) = *((void *)v15 + 19);
    *((void *)v14 + 20) = v24;
    uint64_t v25 = *((void *)v15 + 22);
    *((void *)v14 + 21) = *((void *)v15 + 21);
    *((void *)v14 + 22) = v25;
    uint64_t v26 = *((void *)v15 + 24);
    *((void *)v14 + 23) = *((void *)v15 + 23);
    *((void *)v14 + 24) = v26;
    uint64_t v27 = *((void *)v15 + 26);
    *((void *)v14 + 25) = *((void *)v15 + 25);
    *((void *)v14 + 26) = v27;
    v14[216] = v15[216];
    *((void *)v14 + 28) = *((void *)v15 + 28);
    v14[232] = v15[232];
    v96 = (int *)type metadata accessor for SportsWidgetContentViewModel(0);
    uint64_t v28 = v96[6];
    v82 = &v14[v28];
    v29 = &v15[v28];
    type metadata accessor for SportsWidgetClock(0);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v34 = *((void *)v29 + 1);
      *(void *)v82 = *(void *)v29;
      *((void *)v82 + 1) = v34;
      uint64_t v35 = *((void *)v29 + 3);
      *((void *)v82 + 2) = *((void *)v29 + 2);
      *((void *)v82 + 3) = v35;
      uint64_t v36 = *((void *)v29 + 5);
      *((void *)v82 + 4) = *((void *)v29 + 4);
      *((void *)v82 + 5) = v36;
      uint64_t v37 = *((void *)v29 + 7);
      *((void *)v82 + 6) = *((void *)v29 + 6);
      *((void *)v82 + 7) = v37;
      uint64_t v38 = type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v39 = *(int *)(v38 + 32);
      v85 = &v29[v39];
      v87 = &v82[v39];
      uint64_t v40 = sub_1000E3EE0();
      uint64_t v83 = *(void *)(v40 - 8);
      v41 = *(void (**)(char *, char *, uint64_t))(v83 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v41(v87, v85, v40);
      uint64_t v42 = sub_1000082B4(&qword_100129F28);
      v89 = v41;
      v41(&v87[*(int *)(v42 + 36)], &v85[*(int *)(v42 + 36)], v40);
      uint64_t v43 = v38;
      uint64_t v44 = *(int *)(v38 + 36);
      v45 = &v82[v44];
      v46 = &v29[v44];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v83 + 48))(&v29[v44], 1, v40))
      {
        uint64_t v47 = sub_1000082B4(&qword_100129F30);
        memcpy(v45, v46, *(void *)(*(void *)(v47 - 8) + 64));
      }
      else
      {
        v89(v45, v46, v40);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v83 + 56))(v45, 0, 1, v40);
      }
      v82[*(int *)(v43 + 40)] = v29[*(int *)(v43 + 40)];
      v82[*(int *)(v43 + 44)] = v29[*(int *)(v43 + 44)];
      uint64_t v62 = type metadata accessor for SportsWidgetSoccerClockViewModel(0);
      *(void *)&v82[*(int *)(v62 + 20)] = *(void *)&v29[*(int *)(v62 + 20)];
      swift_bridgeObjectRetain();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v31 = *((void *)v29 + 1);
      *(void *)v82 = *(void *)v29;
      *((void *)v82 + 1) = v31;
      uint64_t v32 = *((void *)v29 + 3);
      *((void *)v82 + 2) = *((void *)v29 + 2);
      *((void *)v82 + 3) = v32;
      uint64_t v33 = *((void *)v29 + 5);
      *((void *)v82 + 4) = *((void *)v29 + 4);
      *((void *)v82 + 5) = v33;
      v82[48] = v29[48];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v48 = *((void *)v29 + 1);
      *(void *)v82 = *(void *)v29;
      *((void *)v82 + 1) = v48;
      uint64_t v49 = *((void *)v29 + 3);
      *((void *)v82 + 2) = *((void *)v29 + 2);
      *((void *)v82 + 3) = v49;
      uint64_t v50 = *((void *)v29 + 5);
      *((void *)v82 + 4) = *((void *)v29 + 4);
      *((void *)v82 + 5) = v50;
      uint64_t v51 = *((void *)v29 + 7);
      *((void *)v82 + 6) = *((void *)v29 + 6);
      *((void *)v82 + 7) = v51;
      uint64_t v52 = type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v53 = *(int *)(v52 + 32);
      v86 = &v29[v53];
      v88 = &v82[v53];
      uint64_t v54 = sub_1000E3EE0();
      uint64_t v84 = *(void *)(v54 - 8);
      v55 = *(void (**)(char *, char *, uint64_t))(v84 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v55(v88, v86, v54);
      uint64_t v56 = sub_1000082B4(&qword_100129F28);
      v90 = v55;
      v55(&v88[*(int *)(v56 + 36)], &v86[*(int *)(v56 + 36)], v54);
      uint64_t v57 = v52;
      uint64_t v58 = *(int *)(v52 + 36);
      v59 = &v82[v58];
      v60 = &v29[v58];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v84 + 48))(&v29[v58], 1, v54))
      {
        uint64_t v61 = sub_1000082B4(&qword_100129F30);
        memcpy(v59, v60, *(void *)(*(void *)(v61 - 8) + 64));
      }
      else
      {
        v90(v59, v60, v54);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v84 + 56))(v59, 0, 1, v54);
      }
      v82[*(int *)(v57 + 40)] = v29[*(int *)(v57 + 40)];
      v82[*(int *)(v57 + 44)] = v29[*(int *)(v57 + 44)];
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v63 = v96[7];
    v64 = &v14[v63];
    v65 = &v15[v63];
    uint64_t v66 = *((void *)v65 + 1);
    *(void *)v64 = *(void *)v65;
    *((void *)v64 + 1) = v66;
    uint64_t v91 = *((void *)v65 + 3);
    *((void *)v64 + 2) = *((void *)v65 + 2);
    *((void *)v64 + 3) = v91;
    uint64_t v67 = v96[8];
    v68 = &v14[v67];
    v69 = &v15[v67];
    uint64_t v70 = *((void *)v69 + 1);
    *(void *)v68 = *(void *)v69;
    *((void *)v68 + 1) = v70;
    v68[16] = v69[16];
    *((void *)v68 + 3) = *((void *)v69 + 3);
    v68[32] = v69[32];
    *((void *)v68 + 5) = *((void *)v69 + 5);
    v68[48] = v69[48];
    v14[v96[9]] = v15[v96[9]];
    v14[v96[10]] = v15[v96[10]];
    v14[v96[11]] = v15[v96[11]];
    v14[v96[12]] = v15[v96[12]];
    uint64_t v71 = v96[13];
    __dst = &v14[v71];
    v72 = &v15[v71];
    uint64_t v73 = sub_1000E3E00();
    uint64_t v74 = *(void *)(v73 - 8);
    v75 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v74 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    if (v75(v72, 1, v73))
    {
      uint64_t v76 = sub_1000082B4(&qword_100129F38);
      memcpy(__dst, v72, *(void *)(*(void *)(v76 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v74 + 16))(__dst, v72, v73);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v74 + 56))(__dst, 0, 1, v73);
    }
    uint64_t v9 = v95;
    v14[v96[14]] = v15[v96[14]];
    uint64_t v77 = v96[15];
    v78 = &v14[v77];
    v79 = &v15[v77];
    uint64_t v80 = *((void *)v79 + 1);
    *(void *)v78 = *(void *)v79;
    *((void *)v78 + 1) = v80;
    swift_bridgeObjectRetain();
  }
  return v9;
}

uint64_t sub_1000AD360(uint64_t a1, uint64_t a2)
{
  sub_1000082B4(&qword_100129F20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1000E41D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v6 = type metadata accessor for SportsWidgetContentViewModel(0);
  uint64_t v7 = v5 + *(int *)(v6 + 24);
  type metadata accessor for SportsWidgetClock(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v16 = type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v17 = v7 + *(int *)(v16 + 32);
      uint64_t v18 = sub_1000E3EE0();
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
      v20(v17, v18);
      uint64_t v21 = sub_1000082B4(&qword_100129F28);
      v20(v17 + *(int *)(v21 + 36), v18);
      uint64_t v22 = v7 + *(int *)(v16 + 36);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v22, 1, v18)) {
        v20(v22, v18);
      }
      type metadata accessor for SportsWidgetSoccerClockViewModel(0);
      goto LABEL_13;
    case 1:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_13:
      swift_bridgeObjectRelease();
      break;
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v9 = type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v10 = v7 + *(int *)(v9 + 32);
      uint64_t v11 = sub_1000E3EE0();
      uint64_t v12 = *(void *)(v11 - 8);
      id v13 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      v13(v10, v11);
      uint64_t v14 = sub_1000082B4(&qword_100129F28);
      v13(v10 + *(int *)(v14 + 36), v11);
      uint64_t v15 = v7 + *(int *)(v9 + 36);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v15, 1, v11)) {
        v13(v15, v11);
      }
      break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v23 = v5 + *(int *)(v6 + 52);
  uint64_t v24 = sub_1000E3E00();
  uint64_t v25 = *(void *)(v24 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24)) {
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
  }

  return swift_bridgeObjectRelease();
}

void *sub_1000AD7A4(void *a1, void *a2, uint64_t a3)
{
  sub_1000082B4(&qword_100129F20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1000E41D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  __dsta = (void *)v10[1];
  uint64_t v91 = a1;
  *uint64_t v9 = *v10;
  v9[1] = __dsta;
  uint64_t v11 = (char *)a1 + v8;
  uint64_t v12 = (char *)a2 + v8;
  uint64_t v13 = *((void *)v12 + 1);
  *(void *)uint64_t v11 = *(void *)v12;
  *((void *)v11 + 1) = v13;
  uint64_t v14 = *((void *)v12 + 3);
  *((void *)v11 + 2) = *((void *)v12 + 2);
  *((void *)v11 + 3) = v14;
  uint64_t v15 = *((void *)v12 + 5);
  *((void *)v11 + 4) = *((void *)v12 + 4);
  *((void *)v11 + 5) = v15;
  uint64_t v16 = *((void *)v12 + 7);
  *((void *)v11 + 6) = *((void *)v12 + 6);
  *((void *)v11 + 7) = v16;
  uint64_t v17 = *((void *)v12 + 9);
  *((void *)v11 + 8) = *((void *)v12 + 8);
  *((void *)v11 + 9) = v17;
  uint64_t v18 = *((void *)v12 + 11);
  *((void *)v11 + 10) = *((void *)v12 + 10);
  *((void *)v11 + 11) = v18;
  v11[96] = v12[96];
  *((void *)v11 + 13) = *((void *)v12 + 13);
  v11[112] = v12[112];
  uint64_t v19 = *((void *)v12 + 16);
  *((void *)v11 + 15) = *((void *)v12 + 15);
  *((void *)v11 + 16) = v19;
  uint64_t v20 = *((void *)v12 + 18);
  *((void *)v11 + 17) = *((void *)v12 + 17);
  *((void *)v11 + 18) = v20;
  uint64_t v21 = *((void *)v12 + 20);
  *((void *)v11 + 19) = *((void *)v12 + 19);
  *((void *)v11 + 20) = v21;
  uint64_t v22 = *((void *)v12 + 22);
  *((void *)v11 + 21) = *((void *)v12 + 21);
  *((void *)v11 + 22) = v22;
  uint64_t v23 = *((void *)v12 + 24);
  *((void *)v11 + 23) = *((void *)v12 + 23);
  *((void *)v11 + 24) = v23;
  uint64_t v24 = *((void *)v12 + 26);
  *((void *)v11 + 25) = *((void *)v12 + 25);
  *((void *)v11 + 26) = v24;
  v11[216] = v12[216];
  *((void *)v11 + 28) = *((void *)v12 + 28);
  v11[232] = v12[232];
  uint64_t v92 = (int *)type metadata accessor for SportsWidgetContentViewModel(0);
  uint64_t v25 = v92[6];
  v79 = &v11[v25];
  uint64_t v26 = &v12[v25];
  type metadata accessor for SportsWidgetClock(0);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v31 = *((void *)v26 + 1);
    *(void *)v79 = *(void *)v26;
    *((void *)v79 + 1) = v31;
    uint64_t v32 = *((void *)v26 + 3);
    *((void *)v79 + 2) = *((void *)v26 + 2);
    *((void *)v79 + 3) = v32;
    uint64_t v33 = *((void *)v26 + 5);
    *((void *)v79 + 4) = *((void *)v26 + 4);
    *((void *)v79 + 5) = v33;
    uint64_t v34 = *((void *)v26 + 7);
    *((void *)v79 + 6) = *((void *)v26 + 6);
    *((void *)v79 + 7) = v34;
    uint64_t v35 = type metadata accessor for SportsWidgetGenericClockViewModel(0);
    uint64_t v36 = *(int *)(v35 + 32);
    v82 = &v26[v36];
    uint64_t v84 = &v79[v36];
    uint64_t v37 = sub_1000E3EE0();
    uint64_t v80 = *(void *)(v37 - 8);
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v80 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v38(v84, v82, v37);
    uint64_t v39 = sub_1000082B4(&qword_100129F28);
    v86 = v38;
    v38(&v84[*(int *)(v39 + 36)], &v82[*(int *)(v39 + 36)], v37);
    uint64_t v40 = v35;
    uint64_t v41 = *(int *)(v35 + 36);
    uint64_t v42 = &v79[v41];
    uint64_t v43 = &v26[v41];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v80 + 48))(&v26[v41], 1, v37))
    {
      uint64_t v44 = sub_1000082B4(&qword_100129F30);
      memcpy(v42, v43, *(void *)(*(void *)(v44 - 8) + 64));
    }
    else
    {
      v86(v42, v43, v37);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v80 + 56))(v42, 0, 1, v37);
    }
    v79[*(int *)(v40 + 40)] = v26[*(int *)(v40 + 40)];
    v79[*(int *)(v40 + 44)] = v26[*(int *)(v40 + 44)];
    uint64_t v59 = type metadata accessor for SportsWidgetSoccerClockViewModel(0);
    *(void *)&v79[*(int *)(v59 + 20)] = *(void *)&v26[*(int *)(v59 + 20)];
    swift_bridgeObjectRetain();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v28 = *((void *)v26 + 1);
    *(void *)v79 = *(void *)v26;
    *((void *)v79 + 1) = v28;
    uint64_t v29 = *((void *)v26 + 3);
    *((void *)v79 + 2) = *((void *)v26 + 2);
    *((void *)v79 + 3) = v29;
    uint64_t v30 = *((void *)v26 + 5);
    *((void *)v79 + 4) = *((void *)v26 + 4);
    *((void *)v79 + 5) = v30;
    v79[48] = v26[48];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v45 = *((void *)v26 + 1);
    *(void *)v79 = *(void *)v26;
    *((void *)v79 + 1) = v45;
    uint64_t v46 = *((void *)v26 + 3);
    *((void *)v79 + 2) = *((void *)v26 + 2);
    *((void *)v79 + 3) = v46;
    uint64_t v47 = *((void *)v26 + 5);
    *((void *)v79 + 4) = *((void *)v26 + 4);
    *((void *)v79 + 5) = v47;
    uint64_t v48 = *((void *)v26 + 7);
    *((void *)v79 + 6) = *((void *)v26 + 6);
    *((void *)v79 + 7) = v48;
    uint64_t v49 = type metadata accessor for SportsWidgetGenericClockViewModel(0);
    uint64_t v50 = *(int *)(v49 + 32);
    uint64_t v83 = &v26[v50];
    v85 = &v79[v50];
    uint64_t v51 = sub_1000E3EE0();
    uint64_t v81 = *(void *)(v51 - 8);
    uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v81 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v52(v85, v83, v51);
    uint64_t v53 = sub_1000082B4(&qword_100129F28);
    v87 = v52;
    v52(&v85[*(int *)(v53 + 36)], &v83[*(int *)(v53 + 36)], v51);
    uint64_t v54 = v49;
    uint64_t v55 = *(int *)(v49 + 36);
    uint64_t v56 = &v79[v55];
    uint64_t v57 = &v26[v55];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v81 + 48))(&v26[v55], 1, v51))
    {
      uint64_t v58 = sub_1000082B4(&qword_100129F30);
      memcpy(v56, v57, *(void *)(*(void *)(v58 - 8) + 64));
    }
    else
    {
      v87(v56, v57, v51);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v81 + 56))(v56, 0, 1, v51);
    }
    v79[*(int *)(v54 + 40)] = v26[*(int *)(v54 + 40)];
    v79[*(int *)(v54 + 44)] = v26[*(int *)(v54 + 44)];
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v60 = v92[7];
  uint64_t v61 = &v11[v60];
  uint64_t v62 = &v12[v60];
  uint64_t v63 = *((void *)v62 + 1);
  *(void *)uint64_t v61 = *(void *)v62;
  *((void *)v61 + 1) = v63;
  uint64_t v88 = *((void *)v62 + 3);
  *((void *)v61 + 2) = *((void *)v62 + 2);
  *((void *)v61 + 3) = v88;
  uint64_t v64 = v92[8];
  v65 = &v11[v64];
  uint64_t v66 = &v12[v64];
  uint64_t v67 = *((void *)v66 + 1);
  *(void *)v65 = *(void *)v66;
  *((void *)v65 + 1) = v67;
  v65[16] = v66[16];
  *((void *)v65 + 3) = *((void *)v66 + 3);
  v65[32] = v66[32];
  *((void *)v65 + 5) = *((void *)v66 + 5);
  v65[48] = v66[48];
  v11[v92[9]] = v12[v92[9]];
  v11[v92[10]] = v12[v92[10]];
  v11[v92[11]] = v12[v92[11]];
  v11[v92[12]] = v12[v92[12]];
  uint64_t v68 = v92[13];
  __dst = &v11[v68];
  v69 = &v12[v68];
  uint64_t v70 = sub_1000E3E00();
  uint64_t v71 = *(void *)(v70 - 8);
  v72 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  if (v72(v69, 1, v70))
  {
    uint64_t v73 = sub_1000082B4(&qword_100129F38);
    memcpy(__dst, v69, *(void *)(*(void *)(v73 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))(__dst, v69, v70);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(__dst, 0, 1, v70);
  }
  v11[v92[14]] = v12[v92[14]];
  uint64_t v74 = v92[15];
  v75 = &v11[v74];
  uint64_t v76 = &v12[v74];
  uint64_t v77 = *((void *)v76 + 1);
  *(void *)v75 = *(void *)v76;
  *((void *)v75 + 1) = v77;
  swift_bridgeObjectRetain();
  return v91;
}

void *sub_1000ADFB8(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100042E60((uint64_t)a1);
    sub_1000082B4(&qword_100129F20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1000E41D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_retain();
  swift_release();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)uint64_t v11 = *(void *)((char *)a2 + v10);
  *((void *)v11 + 1) = *(void *)((char *)a2 + v10 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 2) = *((void *)v12 + 2);
  *((void *)v11 + 3) = *((void *)v12 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 4) = *((void *)v12 + 4);
  *((void *)v11 + 5) = *((void *)v12 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 6) = *((void *)v12 + 6);
  *((void *)v11 + 7) = *((void *)v12 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 8) = *((void *)v12 + 8);
  *((void *)v11 + 9) = *((void *)v12 + 9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 10) = *((void *)v12 + 10);
  *((void *)v11 + 11) = *((void *)v12 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[96] = v12[96];
  *((void *)v11 + 13) = *((void *)v12 + 13);
  swift_retain();
  swift_release();
  v11[112] = v12[112];
  *((void *)v11 + 15) = *((void *)v12 + 15);
  *((void *)v11 + 16) = *((void *)v12 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 17) = *((void *)v12 + 17);
  *((void *)v11 + 18) = *((void *)v12 + 18);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 19) = *((void *)v12 + 19);
  *((void *)v11 + 20) = *((void *)v12 + 20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 21) = *((void *)v12 + 21);
  *((void *)v11 + 22) = *((void *)v12 + 22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 23) = *((void *)v12 + 23);
  *((void *)v11 + 24) = *((void *)v12 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v11 + 25) = *((void *)v12 + 25);
  *((void *)v11 + 26) = *((void *)v12 + 26);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[216] = v12[216];
  *((void *)v11 + 28) = *((void *)v12 + 28);
  swift_retain();
  swift_release();
  v11[232] = v12[232];
  uint64_t v13 = type metadata accessor for SportsWidgetContentViewModel(0);
  uint64_t v14 = (int *)v13;
  uint64_t v66 = a1;
  if (a1 != a2)
  {
    uint64_t v15 = *(int *)(v13 + 24);
    uint64_t v16 = &v11[v15];
    uint64_t v17 = &v12[v15];
    sub_1000B0690((uint64_t)&v11[v15], type metadata accessor for SportsWidgetClock);
    type metadata accessor for SportsWidgetClock(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(void *)uint64_t v16 = *(void *)v17;
      *((void *)v16 + 1) = *((void *)v17 + 1);
      *((void *)v16 + 2) = *((void *)v17 + 2);
      *((void *)v16 + 3) = *((void *)v17 + 3);
      *((void *)v16 + 4) = *((void *)v17 + 4);
      *((void *)v16 + 5) = *((void *)v17 + 5);
      *((void *)v16 + 6) = *((void *)v17 + 6);
      *((void *)v16 + 7) = *((void *)v17 + 7);
      uint64_t v19 = type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v20 = *(int *)(v19 + 32);
      uint64_t v21 = &v16[v20];
      uint64_t v56 = (int *)v19;
      uint64_t v58 = &v17[v20];
      uint64_t v22 = sub_1000E3EE0();
      uint64_t v64 = *(void *)(v22 - 8);
      uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v23(v21, v58, v22);
      uint64_t v24 = *(int *)(sub_1000082B4(&qword_100129F28) + 36);
      uint64_t v60 = v23;
      v23(&v21[v24], &v58[v24], v22);
      uint64_t v25 = v56[9];
      __dst = &v16[v25];
      uint64_t v26 = &v17[v25];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(&v17[v25], 1, v22))
      {
        uint64_t v27 = sub_1000082B4(&qword_100129F30);
        memcpy(__dst, v26, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        v60(__dst, v26, v22);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v64 + 56))(__dst, 0, 1, v22);
      }
      v16[v56[10]] = v17[v56[10]];
      v16[v56[11]] = v17[v56[11]];
      uint64_t v36 = type metadata accessor for SportsWidgetSoccerClockViewModel(0);
      *(void *)&v16[*(int *)(v36 + 20)] = *(void *)&v17[*(int *)(v36 + 20)];
      swift_bridgeObjectRetain();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *(void *)uint64_t v16 = *(void *)v17;
      *((void *)v16 + 1) = *((void *)v17 + 1);
      *((void *)v16 + 2) = *((void *)v17 + 2);
      *((void *)v16 + 3) = *((void *)v17 + 3);
      *((void *)v16 + 4) = *((void *)v17 + 4);
      *((void *)v16 + 5) = *((void *)v17 + 5);
      v16[48] = v17[48];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      *(void *)uint64_t v16 = *(void *)v17;
      *((void *)v16 + 1) = *((void *)v17 + 1);
      *((void *)v16 + 2) = *((void *)v17 + 2);
      *((void *)v16 + 3) = *((void *)v17 + 3);
      *((void *)v16 + 4) = *((void *)v17 + 4);
      *((void *)v16 + 5) = *((void *)v17 + 5);
      *((void *)v16 + 6) = *((void *)v17 + 6);
      *((void *)v16 + 7) = *((void *)v17 + 7);
      v65 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v28 = v65[8];
      uint64_t v57 = &v16[v28];
      uint64_t v29 = &v17[v28];
      uint64_t v30 = sub_1000E3EE0();
      __dsta = *(void **)(v30 - 8);
      uint64_t v31 = (void (*)(char *, char *, uint64_t))__dsta[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v31(v57, v29, v30);
      uint64_t v32 = *(int *)(sub_1000082B4(&qword_100129F28) + 36);
      uint64_t v59 = v31;
      v31(&v57[v32], &v29[v32], v30);
      uint64_t v33 = v65[9];
      uint64_t v61 = &v16[v33];
      uint64_t v34 = &v17[v33];
      if (((unsigned int (*)(char *, uint64_t, uint64_t))__dsta[6])(&v17[v33], 1, v30))
      {
        uint64_t v35 = sub_1000082B4(&qword_100129F30);
        memcpy(v61, v34, *(void *)(*(void *)(v35 - 8) + 64));
      }
      else
      {
        v59(v61, v34, v30);
        ((void (*)(char *, void, uint64_t, uint64_t))__dsta[7])(v61, 0, 1, v30);
      }
      v16[v65[10]] = v17[v65[10]];
      v16[v65[11]] = v17[v65[11]];
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v37 = v14[7];
  uint64_t v38 = &v11[v37];
  uint64_t v39 = &v12[v37];
  *(void *)uint64_t v38 = *(void *)&v12[v37];
  *((void *)v38 + 1) = *(void *)&v12[v37 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v38 + 2) = *((void *)v39 + 2);
  *((void *)v38 + 3) = *((void *)v39 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = v14[8];
  uint64_t v41 = &v11[v40];
  uint64_t v42 = &v12[v40];
  *(void *)uint64_t v41 = *(void *)&v12[v40];
  *((void *)v41 + 1) = *(void *)&v12[v40 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v41[16] = v42[16];
  *((void *)v41 + 3) = *((void *)v42 + 3);
  swift_retain();
  swift_release();
  v41[32] = v42[32];
  *((void *)v41 + 5) = *((void *)v42 + 5);
  swift_retain();
  swift_release();
  v41[48] = v42[48];
  v11[v14[9]] = v12[v14[9]];
  v11[v14[10]] = v12[v14[10]];
  v11[v14[11]] = v12[v14[11]];
  v11[v14[12]] = v12[v14[12]];
  uint64_t v43 = v14[13];
  uint64_t v44 = &v11[v43];
  uint64_t v45 = &v12[v43];
  uint64_t v46 = sub_1000E3E00();
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48);
  int v49 = v48(v44, 1, v46);
  int v50 = v48(v45, 1, v46);
  if (!v49)
  {
    if (!v50)
    {
      (*(void (**)(char *, char *, uint64_t))(v47 + 24))(v44, v45, v46);
      goto LABEL_25;
    }
    (*(void (**)(char *, uint64_t))(v47 + 8))(v44, v46);
    goto LABEL_24;
  }
  if (v50)
  {
LABEL_24:
    uint64_t v51 = sub_1000082B4(&qword_100129F38);
    memcpy(v44, v45, *(void *)(*(void *)(v51 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v44, v45, v46);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v44, 0, 1, v46);
LABEL_25:
  v11[v14[14]] = v12[v14[14]];
  uint64_t v52 = v14[15];
  uint64_t v53 = &v11[v52];
  uint64_t v54 = &v12[v52];
  *(void *)uint64_t v53 = *(void *)v54;
  *((void *)v53 + 1) = *((void *)v54 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v66;
}

char *sub_1000AE9CC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000082B4(&qword_100129F20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1000E41D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  long long v11 = *(_OWORD *)&a2[v8 + 80];
  *((_OWORD *)v9 + 4) = *(_OWORD *)&a2[v8 + 64];
  *((_OWORD *)v9 + 5) = v11;
  *((_OWORD *)v9 + 6) = *(_OWORD *)&a2[v8 + 96];
  v9[112] = a2[v8 + 112];
  long long v12 = *(_OWORD *)&a2[v8 + 16];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)&a2[v8];
  *((_OWORD *)v9 + 1) = v12;
  long long v13 = *(_OWORD *)&a2[v8 + 48];
  *((_OWORD *)v9 + 2) = *(_OWORD *)&a2[v8 + 32];
  *((_OWORD *)v9 + 3) = v13;
  *(_OWORD *)(v9 + 168) = *(_OWORD *)&a2[v8 + 168];
  *(_OWORD *)(v9 + 152) = *(_OWORD *)&a2[v8 + 152];
  *(_OWORD *)(v9 + 136) = *(_OWORD *)&a2[v8 + 136];
  *(_OWORD *)(v9 + 120) = *(_OWORD *)&a2[v8 + 120];
  v9[232] = a2[v8 + 232];
  *(_OWORD *)(v9 + 216) = *(_OWORD *)&a2[v8 + 216];
  *(_OWORD *)(v9 + 200) = *(_OWORD *)&a2[v8 + 200];
  *(_OWORD *)(v9 + 184) = *(_OWORD *)&a2[v8 + 184];
  uint64_t v14 = (int *)type metadata accessor for SportsWidgetContentViewModel(0);
  uint64_t v15 = v14[6];
  uint64_t v16 = &v9[v15];
  uint64_t v17 = &v10[v15];
  uint64_t v18 = type metadata accessor for SportsWidgetClock(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v67 = a1;
    long long v32 = *((_OWORD *)v17 + 1);
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    *((_OWORD *)v16 + 1) = v32;
    long long v33 = *((_OWORD *)v17 + 3);
    *((_OWORD *)v16 + 2) = *((_OWORD *)v17 + 2);
    *((_OWORD *)v16 + 3) = v33;
    uint64_t v66 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
    uint64_t v34 = v66[8];
    uint64_t v35 = &v16[v34];
    uint64_t v36 = &v17[v34];
    uint64_t v37 = sub_1000E3EE0();
    uint64_t v64 = *(void *)(v37 - 8);
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v64 + 32);
    v38(v35, v36, v37);
    uint64_t v39 = sub_1000082B4(&qword_100129F28);
    uint64_t v62 = v38;
    v38(&v35[*(int *)(v39 + 36)], &v36[*(int *)(v39 + 36)], v37);
    uint64_t v40 = v66[9];
    uint64_t v41 = &v16[v40];
    uint64_t v42 = &v17[v40];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(&v17[v40], 1, v37))
    {
      uint64_t v43 = sub_1000082B4(&qword_100129F30);
      memcpy(v41, v42, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      v62(v41, v42, v37);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v64 + 56))(v41, 0, 1, v37);
    }
    v16[v66[10]] = v17[v66[10]];
    v16[v66[11]] = v17[v66[11]];
    uint64_t v44 = type metadata accessor for SportsWidgetSoccerClockViewModel(0);
    *(void *)&v16[*(int *)(v44 + 20)] = *(void *)&v17[*(int *)(v44 + 20)];
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
      goto LABEL_16;
    }
    uint64_t v67 = a1;
    long long v20 = *((_OWORD *)v17 + 1);
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    *((_OWORD *)v16 + 1) = v20;
    long long v21 = *((_OWORD *)v17 + 3);
    *((_OWORD *)v16 + 2) = *((_OWORD *)v17 + 2);
    *((_OWORD *)v16 + 3) = v21;
    v65 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
    uint64_t v22 = v65[8];
    uint64_t v23 = &v16[v22];
    uint64_t v24 = &v17[v22];
    uint64_t v25 = sub_1000E3EE0();
    uint64_t v63 = *(void *)(v25 - 8);
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v63 + 32);
    v26(v23, v24, v25);
    uint64_t v27 = sub_1000082B4(&qword_100129F28);
    uint64_t v61 = v26;
    v26(&v23[*(int *)(v27 + 36)], &v24[*(int *)(v27 + 36)], v25);
    uint64_t v28 = v65[9];
    uint64_t v29 = &v16[v28];
    uint64_t v30 = &v17[v28];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v63 + 48))(&v17[v28], 1, v25))
    {
      uint64_t v31 = sub_1000082B4(&qword_100129F30);
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      v61(v29, v30, v25);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v63 + 56))(v29, 0, 1, v25);
    }
    v16[v65[10]] = v17[v65[10]];
    v16[v65[11]] = v17[v65[11]];
  }
  swift_storeEnumTagMultiPayload();
  a1 = v67;
LABEL_16:
  uint64_t v45 = v14[7];
  uint64_t v46 = &v9[v45];
  uint64_t v47 = &v10[v45];
  long long v48 = *((_OWORD *)v47 + 1);
  *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
  *((_OWORD *)v46 + 1) = v48;
  uint64_t v49 = v14[8];
  int v50 = &v9[v49];
  uint64_t v51 = &v10[v49];
  v50[48] = v51[48];
  long long v52 = *((_OWORD *)v51 + 2);
  long long v53 = *(_OWORD *)v51;
  *((_OWORD *)v50 + 1) = *((_OWORD *)v51 + 1);
  *((_OWORD *)v50 + 2) = v52;
  *(_OWORD *)int v50 = v53;
  v9[v14[9]] = v10[v14[9]];
  v9[v14[10]] = v10[v14[10]];
  v9[v14[11]] = v10[v14[11]];
  v9[v14[12]] = v10[v14[12]];
  uint64_t v54 = v14[13];
  uint64_t v55 = &v9[v54];
  uint64_t v56 = &v10[v54];
  uint64_t v57 = sub_1000E3E00();
  uint64_t v58 = *(void *)(v57 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v56, 1, v57))
  {
    uint64_t v59 = sub_1000082B4(&qword_100129F38);
    memcpy(v55, v56, *(void *)(*(void *)(v59 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v55, v56, v57);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v58 + 56))(v55, 0, 1, v57);
  }
  v9[v14[14]] = v10[v14[14]];
  *(_OWORD *)&v9[v14[15]] = *(_OWORD *)&v10[v14[15]];
  return a1;
}

char *sub_1000AEFF4(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100042E60((uint64_t)a1);
    uint64_t v6 = sub_1000082B4(&qword_100129F20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000E41D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)uint64_t v9 = *(void *)v10;
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  uint64_t v11 = *(int *)(a3 + 24);
  long long v12 = &a1[v11];
  long long v13 = &a2[v11];
  uint64_t v14 = *(void *)&a2[v11 + 8];
  *(void *)long long v12 = *(void *)&a2[v11];
  *((void *)v12 + 1) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *((void *)v13 + 3);
  *((void *)v12 + 2) = *((void *)v13 + 2);
  *((void *)v12 + 3) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *((void *)v13 + 5);
  *((void *)v12 + 4) = *((void *)v13 + 4);
  *((void *)v12 + 5) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *((void *)v13 + 7);
  *((void *)v12 + 6) = *((void *)v13 + 6);
  *((void *)v12 + 7) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *((void *)v13 + 9);
  *((void *)v12 + 8) = *((void *)v13 + 8);
  *((void *)v12 + 9) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *((void *)v13 + 11);
  *((void *)v12 + 10) = *((void *)v13 + 10);
  *((void *)v12 + 11) = v19;
  swift_bridgeObjectRelease();
  v12[96] = v13[96];
  *((void *)v12 + 13) = *((void *)v13 + 13);
  swift_release();
  v12[112] = v13[112];
  uint64_t v20 = *((void *)v13 + 16);
  *((void *)v12 + 15) = *((void *)v13 + 15);
  *((void *)v12 + 16) = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = *((void *)v13 + 18);
  *((void *)v12 + 17) = *((void *)v13 + 17);
  *((void *)v12 + 18) = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = *((void *)v13 + 20);
  *((void *)v12 + 19) = *((void *)v13 + 19);
  *((void *)v12 + 20) = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = *((void *)v13 + 22);
  *((void *)v12 + 21) = *((void *)v13 + 21);
  *((void *)v12 + 22) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = *((void *)v13 + 24);
  *((void *)v12 + 23) = *((void *)v13 + 23);
  *((void *)v12 + 24) = v24;
  swift_bridgeObjectRelease();
  uint64_t v25 = *((void *)v13 + 26);
  *((void *)v12 + 25) = *((void *)v13 + 25);
  *((void *)v12 + 26) = v25;
  swift_bridgeObjectRelease();
  v12[216] = v13[216];
  *((void *)v12 + 28) = *((void *)v13 + 28);
  swift_release();
  v12[232] = v13[232];
  uint64_t v26 = type metadata accessor for SportsWidgetContentViewModel(0);
  uint64_t v27 = (int *)v26;
  uint64_t v88 = a1;
  if (a1 != a2)
  {
    uint64_t v28 = *(int *)(v26 + 24);
    uint64_t v29 = &v12[v28];
    uint64_t v30 = &v13[v28];
    sub_1000B0690((uint64_t)&v12[v28], type metadata accessor for SportsWidgetClock);
    uint64_t v31 = type metadata accessor for SportsWidgetClock(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      long long v45 = *((_OWORD *)v30 + 1);
      *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
      *((_OWORD *)v29 + 1) = v45;
      long long v46 = *((_OWORD *)v30 + 3);
      *((_OWORD *)v29 + 2) = *((_OWORD *)v30 + 2);
      *((_OWORD *)v29 + 3) = v46;
      v87 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v47 = v87[8];
      long long v48 = &v29[v47];
      uint64_t v49 = &v30[v47];
      uint64_t v50 = sub_1000E3EE0();
      uint64_t v85 = *(void *)(v50 - 8);
      uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v85 + 32);
      v51(v48, v49, v50);
      uint64_t v52 = sub_1000082B4(&qword_100129F28);
      uint64_t v83 = v51;
      v51(&v48[*(int *)(v52 + 36)], &v49[*(int *)(v52 + 36)], v50);
      uint64_t v53 = v87[9];
      uint64_t v54 = &v29[v53];
      uint64_t v55 = &v30[v53];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v85 + 48))(&v30[v53], 1, v50))
      {
        uint64_t v56 = sub_1000082B4(&qword_100129F30);
        memcpy(v54, v55, *(void *)(*(void *)(v56 - 8) + 64));
      }
      else
      {
        v83(v54, v55, v50);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v85 + 56))(v54, 0, 1, v50);
      }
      v29[v87[10]] = v30[v87[10]];
      v29[v87[11]] = v30[v87[11]];
      uint64_t v57 = type metadata accessor for SportsWidgetSoccerClockViewModel(0);
      *(void *)&v29[*(int *)(v57 + 20)] = *(void *)&v30[*(int *)(v57 + 20)];
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
        goto LABEL_18;
      }
      long long v33 = *((_OWORD *)v30 + 1);
      *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
      *((_OWORD *)v29 + 1) = v33;
      long long v34 = *((_OWORD *)v30 + 3);
      *((_OWORD *)v29 + 2) = *((_OWORD *)v30 + 2);
      *((_OWORD *)v29 + 3) = v34;
      v86 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v35 = v86[8];
      uint64_t v36 = &v29[v35];
      uint64_t v37 = &v30[v35];
      uint64_t v38 = sub_1000E3EE0();
      uint64_t v84 = *(void *)(v38 - 8);
      uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v84 + 32);
      v39(v36, v37, v38);
      uint64_t v40 = sub_1000082B4(&qword_100129F28);
      v82 = v39;
      v39(&v36[*(int *)(v40 + 36)], &v37[*(int *)(v40 + 36)], v38);
      uint64_t v41 = v86[9];
      uint64_t v42 = &v29[v41];
      uint64_t v43 = &v30[v41];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v84 + 48))(&v30[v41], 1, v38))
      {
        uint64_t v44 = sub_1000082B4(&qword_100129F30);
        memcpy(v42, v43, *(void *)(*(void *)(v44 - 8) + 64));
      }
      else
      {
        v82(v42, v43, v38);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v84 + 56))(v42, 0, 1, v38);
      }
      v29[v86[10]] = v30[v86[10]];
      v29[v86[11]] = v30[v86[11]];
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_18:
  uint64_t v58 = v27[7];
  uint64_t v59 = &v12[v58];
  uint64_t v60 = &v13[v58];
  uint64_t v61 = *(void *)&v13[v58 + 8];
  *(void *)uint64_t v59 = *(void *)&v13[v58];
  *((void *)v59 + 1) = v61;
  swift_bridgeObjectRelease();
  uint64_t v62 = *((void *)v60 + 3);
  *((void *)v59 + 2) = *((void *)v60 + 2);
  *((void *)v59 + 3) = v62;
  swift_bridgeObjectRelease();
  uint64_t v63 = v27[8];
  uint64_t v64 = &v12[v63];
  v65 = &v13[v63];
  uint64_t v66 = *(void *)&v13[v63 + 8];
  *(void *)uint64_t v64 = *(void *)&v13[v63];
  *((void *)v64 + 1) = v66;
  swift_bridgeObjectRelease();
  v64[16] = v65[16];
  *((void *)v64 + 3) = *((void *)v65 + 3);
  swift_release();
  v64[32] = v65[32];
  *((void *)v64 + 5) = *((void *)v65 + 5);
  swift_release();
  v64[48] = v65[48];
  v12[v27[9]] = v13[v27[9]];
  v12[v27[10]] = v13[v27[10]];
  v12[v27[11]] = v13[v27[11]];
  v12[v27[12]] = v13[v27[12]];
  uint64_t v67 = v27[13];
  uint64_t v68 = &v12[v67];
  v69 = &v13[v67];
  uint64_t v70 = sub_1000E3E00();
  uint64_t v71 = *(void *)(v70 - 8);
  v72 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48);
  int v73 = v72(v68, 1, v70);
  int v74 = v72(v69, 1, v70);
  if (!v73)
  {
    if (!v74)
    {
      (*(void (**)(char *, char *, uint64_t))(v71 + 40))(v68, v69, v70);
      goto LABEL_24;
    }
    (*(void (**)(char *, uint64_t))(v71 + 8))(v68, v70);
    goto LABEL_23;
  }
  if (v74)
  {
LABEL_23:
    uint64_t v75 = sub_1000082B4(&qword_100129F38);
    memcpy(v68, v69, *(void *)(*(void *)(v75 - 8) + 64));
    goto LABEL_24;
  }
  (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v68, v69, v70);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(v68, 0, 1, v70);
LABEL_24:
  v12[v27[14]] = v13[v27[14]];
  uint64_t v76 = v27[15];
  uint64_t v77 = &v12[v76];
  v78 = &v13[v76];
  uint64_t v80 = *(void *)v78;
  uint64_t v79 = *((void *)v78 + 1);
  *(void *)uint64_t v77 = v80;
  *((void *)v77 + 1) = v79;
  swift_bridgeObjectRelease();
  return v88;
}

uint64_t sub_1000AF7BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000AF7D0);
}

uint64_t sub_1000AF7D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000082B4(&qword_100129F40);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for SportsWidgetContentViewModel(0);
    long long v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_1000AF904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000AF918);
}

uint64_t sub_1000AF918(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000082B4(&qword_100129F40);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for SportsWidgetContentViewModel(0);
    long long v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for SportsWidgetView()
{
  uint64_t result = qword_10012E988;
  if (!qword_10012E988) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000AFA98()
{
  sub_10000C634();
  if (v0 <= 0x3F)
  {
    type metadata accessor for SportsWidgetContentViewModel(319);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_1000AFB68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000AFB84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v81 = a1;
  uint64_t v2 = sub_1000E3FD0();
  uint64_t v79 = *(void *)(v2 - 8);
  uint64_t v80 = v2;
  __chkstk_darwin(v2);
  v78 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000E46F0();
  uint64_t v76 = *(void *)(v4 - 8);
  uint64_t v77 = v4;
  __chkstk_darwin(v4);
  uint64_t v75 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_1000E41D0();
  uint64_t v65 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000082B4(&qword_100129F40);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (uint64_t *)((char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = type metadata accessor for SportsWidgetContentViewModel(0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (int *)type metadata accessor for SportsWidgetContentView();
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_1000082B4(&qword_10012E9C8);
  uint64_t v62 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v18 = (char *)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_1000082B4(&qword_10012E9D0);
  uint64_t v67 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v57 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1000082B4(&qword_10012E9D8);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v69 = v20;
  uint64_t v70 = v21;
  __chkstk_darwin(v20);
  uint64_t v58 = (char *)&v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000082B4(&qword_10012E9E0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v71 = v23;
  uint64_t v72 = v24;
  __chkstk_darwin(v23);
  uint64_t v59 = (char *)&v55 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_1000082B4(&qword_10012E9E8);
  uint64_t v73 = *(void *)(v26 - 8);
  uint64_t v74 = v26;
  __chkstk_darwin(v26);
  uint64_t v60 = (char *)&v55 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_1000082B4(&qword_10012E9F0) - 8;
  __chkstk_darwin(v66);
  uint64_t v63 = (char *)&v55 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = type metadata accessor for SportsWidgetView();
  uint64_t v29 = *(int *)(v56 + 24);
  uint64_t v55 = v1;
  sub_1000B0538(v1 + v29, (uint64_t)v13);
  uint64_t *v10 = swift_getKeyPath();
  sub_1000082B4(&qword_100129F20);
  swift_storeEnumTagMultiPayload();
  uint64_t KeyPath = swift_getKeyPath();
  sub_100014B08((uint64_t)v10, (uint64_t)v16, &qword_100129F40);
  uint64_t v31 = &v16[v14[5]];
  *(void *)uint64_t v31 = KeyPath;
  v31[8] = 0;
  sub_100063F88((uint64_t)&v16[v14[6]]);
  sub_1000B05D4((uint64_t)v13, (uint64_t)&v16[v14[7]]);
  sub_1000C1F94((uint64_t)v7);
  sub_1000E41B0();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v7, v68);
  sub_1000E4F50();
  unint64_t v54 = sub_1000B0638();
  sub_1000E4A10();
  sub_1000B0690((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for SportsWidgetContentView);
  v82 = v14;
  unint64_t v83 = v54;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  long long v33 = v57;
  uint64_t v34 = v61;
  sub_1000E4A70();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v18, v34);
  uint64_t v35 = v75;
  sub_1000E46E0();
  v82 = (int *)v34;
  unint64_t v83 = OpaqueTypeConformance2;
  uint64_t v36 = swift_getOpaqueTypeConformance2();
  uint64_t v37 = v58;
  uint64_t v38 = v64;
  sub_1000E4B60();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v35, v77);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v33, v38);
  v82 = (int *)v38;
  unint64_t v83 = v36;
  uint64_t v39 = swift_getOpaqueTypeConformance2();
  uint64_t v40 = v59;
  uint64_t v41 = (int *)v69;
  sub_1000E4A20();
  (*(void (**)(char *, int *))(v70 + 8))(v37, v41);
  v82 = v41;
  unint64_t v83 = v39;
  swift_getOpaqueTypeConformance2();
  uint64_t v42 = v60;
  uint64_t v43 = v71;
  sub_1000E4A60();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v40, v43);
  uint64_t v44 = swift_getKeyPath();
  long long v46 = v78;
  uint64_t v45 = v79;
  uint64_t v47 = v80;
  (*(void (**)(char *, void, uint64_t))(v79 + 104))(v78, enum case for ColorScheme.dark(_:), v80);
  uint64_t v48 = (uint64_t)v63;
  uint64_t v49 = (uint64_t *)&v63[*(int *)(v66 + 44)];
  uint64_t v50 = sub_1000082B4(&qword_10012D528);
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))((char *)v49 + *(int *)(v50 + 28), v46, v47);
  *uint64_t v49 = v44;
  uint64_t v52 = v73;
  uint64_t v51 = v74;
  (*(void (**)(uint64_t, char *, uint64_t))(v73 + 16))(v48, v42, v74);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v47);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v42, v51);
  return sub_100014B08(v48, v81, &qword_10012E9F0);
}

uint64_t sub_1000B0538(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SportsWidgetContentViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000B05A4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000E44B0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1000B05D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SportsWidgetContentViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000B0638()
{
  unint64_t result = qword_10012E9F8;
  if (!qword_10012E9F8)
  {
    type metadata accessor for SportsWidgetContentView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012E9F8);
  }
  return result;
}

uint64_t sub_1000B0690(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000B06FC()
{
  unint64_t result = qword_10012EA00;
  if (!qword_10012EA00)
  {
    sub_100008354(&qword_10012E9F0);
    sub_100008354(&qword_10012E9E0);
    sub_100008354(&qword_10012E9D8);
    sub_100008354(&qword_10012E9D0);
    sub_100008354(&qword_10012E9C8);
    type metadata accessor for SportsWidgetContentView();
    sub_1000B0638();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_1000B0888();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EA00);
  }
  return result;
}

unint64_t sub_1000B0888()
{
  unint64_t result = qword_10012D520;
  if (!qword_10012D520)
  {
    sub_100008354(&qword_10012D528);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012D520);
  }
  return result;
}

unint64_t sub_1000B08E8()
{
  unint64_t result = qword_10012EA28;
  if (!qword_10012EA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EA28);
  }
  return result;
}

uint64_t sub_1000B093C()
{
  return sub_100014AC4(&qword_10012EA30, &qword_10012EA38);
}

uint64_t sub_1000B0978(char a1)
{
  sub_1000082B4(&qword_10012CD80);
  uint64_t v3 = sub_1000E5A20();
  uint64_t v5 = v4;
  if (qword_100129D20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v6 = off_10012CC58;
  if (*((void *)off_10012CC58 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1000354E4(v3, v5);
    if (v8) {
      char v9 = *(unsigned char *)(v6[7] + v7);
    }
    else {
      char v9 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t result = sub_10006D92C(v9);
  if (!v1)
  {
    sub_1000E5CC0(25);
    v19._object = (void *)0x80000001000EC830;
    v19._countAndFlagsBits = 0xD000000000000017;
    sub_1000E5A70(v19);
    sub_1000E5D50();
    sub_1000C7430(0, (void *)0xE000000000000000);
    swift_bridgeObjectRelease();
    if (qword_100129DE0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1000E5A20();
    uint64_t v13 = v12;
    if (qword_100129DE8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v14 = off_10012DE48;
    if (*((void *)off_10012DE48 + 2))
    {
      swift_bridgeObjectRetain();
      unint64_t v15 = sub_1000354E4(v11, v13);
      if (v16) {
        char v17 = *(unsigned char *)(v14[7] + v15);
      }
      else {
        char v17 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      char v17 = 0;
    }
    swift_endAccess();
    swift_bridgeObjectRelease();
    if (a1) {
      uint64_t v18 = 0x6C61755174736542;
    }
    else {
      uint64_t v18 = 0x6C617551646F6F47;
    }
    sub_1000C7AB4(v17, v18, 0xEB00000000797469);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000B0C68(char a1)
{
  type metadata accessor for TVSettingsPlaybackWifiQualityEntity();
  sub_1000082B4(&qword_10012CD68);
  uint64_t v3 = sub_1000E5A20();
  uint64_t v5 = v4;
  if (qword_100129D20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v6 = off_10012CC58;
  if (*((void *)off_10012CC58 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1000354E4(v3, v5);
    if (v8) {
      char v9 = *(unsigned char *)(v6[7] + v7);
    }
    else {
      char v9 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t result = sub_10006D92C(v9);
  if (!v1)
  {
    sub_1000E5CC0(25);
    v19._object = (void *)0x80000001000EC830;
    v19._countAndFlagsBits = 0xD000000000000017;
    sub_1000E5A70(v19);
    sub_1000E5D50();
    sub_1000C72F4(0, (void *)0xE000000000000000);
    swift_bridgeObjectRelease();
    if (qword_100129DE0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1000E5A20();
    uint64_t v13 = v12;
    if (qword_100129DE8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v14 = off_10012DE48;
    if (*((void *)off_10012DE48 + 2))
    {
      swift_bridgeObjectRetain();
      unint64_t v15 = sub_1000354E4(v11, v13);
      if (v16) {
        char v17 = *(unsigned char *)(v14[7] + v15);
      }
      else {
        char v17 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      char v17 = 0;
    }
    swift_endAccess();
    swift_bridgeObjectRelease();
    if (a1) {
      uint64_t v18 = 0x6C61755174736542;
    }
    else {
      uint64_t v18 = 0x6C617551646F6F47;
    }
    sub_1000C7AB4(v17, v18, 0xEB00000000797469);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000B0F5C(char a1)
{
  sub_1000082B4(&qword_10012CD88);
  uint64_t v3 = sub_1000E5A20();
  uint64_t v5 = v4;
  if (qword_100129D20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v6 = off_10012CC58;
  if (*((void *)off_10012CC58 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1000354E4(v3, v5);
    if (v8) {
      char v9 = *(unsigned char *)(v6[7] + v7);
    }
    else {
      char v9 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t result = sub_10006D92C(v9);
  if (!v1)
  {
    sub_1000E5CC0(25);
    v19._countAndFlagsBits = 0xD000000000000017;
    v19._object = (void *)0x80000001000EC830;
    sub_1000E5A70(v19);
    sub_1000E5D50();
    sub_1000C741C(0, (void *)0xE000000000000000);
    swift_bridgeObjectRelease();
    if (qword_100129DE0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1000E5A20();
    uint64_t v13 = v12;
    if (qword_100129DE8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v14 = off_10012DE48;
    if (*((void *)off_10012DE48 + 2))
    {
      swift_bridgeObjectRetain();
      unint64_t v15 = sub_1000354E4(v11, v13);
      if (v16) {
        char v17 = *(unsigned char *)(v14[7] + v15);
      }
      else {
        char v17 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      char v17 = 0;
    }
    swift_endAccess();
    swift_bridgeObjectRelease();
    if (a1) {
      uint64_t v18 = 0x80000001000E82E0;
    }
    else {
      uint64_t v18 = 0x80000001000E82C0;
    }
    sub_1000C7AB4(v17, 0xD000000000000013, v18);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000B1248(char a1)
{
  type metadata accessor for TVSettingsDownloadWifiQualityEntity();
  sub_1000082B4(&qword_10012CD70);
  uint64_t v3 = sub_1000E5A20();
  uint64_t v5 = v4;
  if (qword_100129D20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v6 = off_10012CC58;
  if (*((void *)off_10012CC58 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1000354E4(v3, v5);
    if (v8) {
      char v9 = *(unsigned char *)(v6[7] + v7);
    }
    else {
      char v9 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t result = sub_10006D92C(v9);
  if (!v1)
  {
    sub_1000E5CC0(25);
    v19._countAndFlagsBits = 0xD000000000000017;
    v19._object = (void *)0x80000001000EC830;
    sub_1000E5A70(v19);
    sub_1000E5D50();
    sub_1000C72C0(0, (void *)0xE000000000000000);
    swift_bridgeObjectRelease();
    if (qword_100129DE0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1000E5A20();
    uint64_t v13 = v12;
    if (qword_100129DE8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v14 = off_10012DE48;
    if (*((void *)off_10012DE48 + 2))
    {
      swift_bridgeObjectRetain();
      unint64_t v15 = sub_1000354E4(v11, v13);
      if (v16) {
        char v17 = *(unsigned char *)(v14[7] + v15);
      }
      else {
        char v17 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      char v17 = 0;
    }
    swift_endAccess();
    swift_bridgeObjectRelease();
    if (a1) {
      uint64_t v18 = 0x80000001000E82E0;
    }
    else {
      uint64_t v18 = 0x80000001000E82C0;
    }
    sub_1000C7AB4(v17, 0xD000000000000013, v18);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000B1538(char a1)
{
  sub_1000082B4(&qword_10012CD78);
  uint64_t v3 = sub_1000E5A20();
  uint64_t v5 = v4;
  if (qword_100129D20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v6 = off_10012CC58;
  if (*((void *)off_10012CC58 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1000354E4(v3, v5);
    if (v8) {
      char v9 = *(unsigned char *)(v6[7] + v7);
    }
    else {
      char v9 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t result = sub_10006D92C(v9);
  if (!v1)
  {
    sub_1000E5CC0(25);
    v19._object = (void *)0x80000001000EC830;
    v19._countAndFlagsBits = 0xD000000000000017;
    sub_1000E5A70(v19);
    sub_1000E5D50();
    sub_1000C7298(0, (void *)0xE000000000000000);
    swift_bridgeObjectRelease();
    if (qword_100129DE0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1000E5A20();
    uint64_t v13 = v12;
    if (qword_100129DE8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v14 = off_10012DE48;
    if (*((void *)off_10012DE48 + 2))
    {
      swift_bridgeObjectRetain();
      unint64_t v15 = sub_1000354E4(v11, v13);
      if (v16) {
        char v17 = *(unsigned char *)(v14[7] + v15);
      }
      else {
        char v17 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      char v17 = 0;
    }
    swift_endAccess();
    swift_bridgeObjectRelease();
    if (a1) {
      uint64_t v18 = 48;
    }
    else {
      uint64_t v18 = 49;
    }
    sub_1000C7AB4(v17, v18, 0xE100000000000000);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000B17FC()
{
  return sub_1000B1B90((uint64_t)&type metadata for TVSettingsPlaybackCellularQualityEntity, &qword_10012CD80, &off_100120020);
}

uint64_t sub_1000B182C()
{
  return sub_1000B18D4((void (*)(void))type metadata accessor for TVSettingsPlaybackWifiQualityEntity, &qword_10012CD68, &off_100120070);
}

uint64_t sub_1000B1868()
{
  return sub_1000B1B90((uint64_t)&type metadata for TVSettingsDownloadCellularQualityEntity, &qword_10012CD88, &off_1001200C0);
}

uint64_t sub_1000B1898()
{
  return sub_1000B18D4((void (*)(void))type metadata accessor for TVSettingsDownloadWifiQualityEntity, &qword_10012CD70, &off_100120110);
}

uint64_t sub_1000B18D4(void (*a1)(void), uint64_t *a2, void *a3)
{
  a1(0);
  sub_1000082B4(a2);
  uint64_t v6 = sub_1000E5A20();
  uint64_t v8 = v7;
  if (qword_100129D20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  char v9 = off_10012CC58;
  if (*((void *)off_10012CC58 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_1000354E4(v6, v8);
    if (v11) {
      char v12 = *(unsigned char *)(v9[7] + v10);
    }
    else {
      char v12 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t result = sub_10006D92C(v12);
  if (!v3)
  {
    if (qword_100129DE0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1000E5A20();
    uint64_t v16 = v15;
    if (qword_100129DE8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    char v17 = off_10012DE48;
    if (*((void *)off_10012DE48 + 2))
    {
      swift_bridgeObjectRetain();
      unint64_t v18 = sub_1000354E4(v14, v16);
      if (v19) {
        char v20 = *(unsigned char *)(v17[7] + v18);
      }
      else {
        char v20 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      char v20 = 0;
    }
    swift_endAccess();
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_1000C8314(v20);
    uint64_t v23 = v22;
    if (v22)
    {
      uint64_t v24 = v21;
      v25._rawValue = a3;
      v27._countAndFlagsBits = v24;
      v27._object = v23;
      Swift::Int v26 = sub_1000E5DA0(v25, v27);
      swift_bridgeObjectRelease();
      if (!v26) {
        return 0;
      }
      if (v26 == 1) {
        return 1;
      }
    }
    sub_1000E3910();
    sub_100018534();
    swift_allocError();
    sub_1000E38F0();
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_1000B1B90(uint64_t a1, uint64_t *a2, void *a3)
{
  sub_1000082B4(a2);
  uint64_t v5 = sub_1000E5A20();
  uint64_t v7 = v6;
  if (qword_100129D20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v8 = off_10012CC58;
  if (*((void *)off_10012CC58 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_1000354E4(v5, v7);
    if (v10) {
      char v11 = *(unsigned char *)(v8[7] + v9);
    }
    else {
      char v11 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t result = sub_10006D92C(v11);
  if (!v3)
  {
    if (qword_100129DE0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1000E5A20();
    uint64_t v15 = v14;
    if (qword_100129DE8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v16 = off_10012DE48;
    if (*((void *)off_10012DE48 + 2))
    {
      swift_bridgeObjectRetain();
      unint64_t v17 = sub_1000354E4(v13, v15);
      if (v18) {
        char v19 = *(unsigned char *)(v16[7] + v17);
      }
      else {
        char v19 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      char v19 = 0;
    }
    swift_endAccess();
    swift_bridgeObjectRelease();
    uint64_t v20 = sub_1000C8314(v19);
    uint64_t v22 = v21;
    if (v21)
    {
      uint64_t v23 = v20;
      v24._rawValue = a3;
      v26._countAndFlagsBits = v23;
      v26._object = v22;
      Swift::Int v25 = sub_1000E5DA0(v24, v26);
      swift_bridgeObjectRelease();
      if (!v25) {
        return 0;
      }
      if (v25 == 1) {
        return 1;
      }
    }
    sub_1000E3910();
    sub_100018534();
    swift_allocError();
    sub_1000E38F0();
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_1000B1E38()
{
  uint64_t v0 = sub_1000082B4(&qword_10012A580);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000E3D90();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E3F10();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000E59F0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000E3DA0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_1000E3C50();
  sub_100008434(v10, qword_100142310);
  sub_100008498(v10, (uint64_t)qword_100142310);
  sub_1000E5990();
  sub_1000E3F00();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000E3DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_1000E3C40();
}

uint64_t sub_1000B2120()
{
  uint64_t v0 = sub_1000E3DA0();
  sub_100008434(v0, qword_100142328);
  sub_100008498(v0, (uint64_t)qword_100142328);
  return sub_1000E3D80();
}

uint64_t sub_1000B2184()
{
  uint64_t v0 = sub_1000082B4(&qword_10012A5F0);
  sub_100008434(v0, qword_100142340);
  uint64_t v1 = sub_100008498(v0, (uint64_t)qword_100142340);
  sub_1000E3AA0();
  uint64_t v2 = sub_1000E3AB0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000B223C()
{
  uint64_t result = swift_getKeyPath();
  qword_100142358 = result;
  return result;
}

uint64_t sub_1000B2264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[15] = a2;
  v3[16] = a3;
  v3[14] = a1;
  return _swift_task_switch(sub_1000B2288, 0, 0);
}

uint64_t sub_1000B2288()
{
  sub_1000E3A40();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 40) = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 32);
  *(void *)(v0 + 136) = v1;
  *(void *)(v0 + 144) = v2;
  *(void *)(v0 + 48) = v1;
  *(void *)(v0 + 56) = v2;
  sub_1000E3A40();
  *(unsigned char *)(v0 + 225) = *(unsigned char *)(v0 + 226);
  if (qword_100129E60 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_100142358;
  *(void *)(v0 + 152) = qword_100142358;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v4;
  uint64_t v5 = sub_100014AC4(&qword_10012EBF0, &qword_10012EBF8);
  *(void *)(v0 + 168) = v5;
  *uint64_t v4 = v0;
  v4[1] = sub_1000B23EC;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 225, v3, &type metadata for VideosPurchaseResolution, v5);
}

uint64_t sub_1000B23EC()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100019FEC;
  }
  else {
    uint64_t v2 = sub_1000B255C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000B255C()
{
  sub_1000E3A40();
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  v0[23] = v2;
  v0[24] = v3;
  v0[8] = v1;
  v0[9] = v2;
  v0[10] = v3;
  uint64_t v4 = qword_100142358;
  v0[25] = qword_100142358;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[26] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1000B2644;
  uint64_t v6 = v0[21];
  return AppEntity._value<A, B>(for:)(v0 + 28, v4, v6);
}

uint64_t sub_1000B2644()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10001A004;
  }
  else {
    uint64_t v2 = sub_1000B27B4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000B27B4()
{
  *(unsigned char *)(v0 + 227) = *(unsigned char *)(v0 + 224);
  sub_1000B4CF0();
  sub_1000E3A10();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000B283C()
{
  if (qword_100129E60 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000B289C()
{
  unint64_t result = qword_10012EA40;
  if (!qword_10012EA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EA40);
  }
  return result;
}

unint64_t sub_1000B28F4()
{
  unint64_t result = qword_10012EA48;
  if (!qword_10012EA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EA48);
  }
  return result;
}

uint64_t sub_1000B2948()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000B297C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000B29CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1000171E8(&qword_100129E50, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100142328, a1);
}

uint64_t sub_1000B2A04@<X0>(uint64_t a1@<X8>)
{
  if (qword_100129E58 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000082B4(&qword_10012A5F0);
  uint64_t v3 = sub_100008498(v2, (uint64_t)qword_100142340);

  return sub_1000185F8(v3, a1);
}

uint64_t sub_1000B2A80(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100015DF8;
  *(_OWORD *)(v4 + 120) = *v1;
  *(void *)(v4 + 112) = a1;
  return _swift_task_switch(sub_1000B2288, 0, 0);
}

uint64_t sub_1000B2B34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000B45D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000B2B5C()
{
  return 0xD000000000000033;
}

unint64_t sub_1000B2B7C()
{
  unint64_t result = qword_10012EA58;
  if (!qword_10012EA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EA58);
  }
  return result;
}

unint64_t sub_1000B2BD4()
{
  unint64_t result = qword_10012EA60;
  if (!qword_10012EA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EA60);
  }
  return result;
}

uint64_t sub_1000B2C28(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000B2C48, 0, 0);
}

uint64_t sub_1000B2C48()
{
  **(unsigned char **)(v0 + 16) = sub_1000B1B90((uint64_t)&type metadata for TVSettingsPurchaseDefinitionEntity, &qword_10012CD78, &off_100120160) & 1;
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000B2CEC(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_1000B2D10, 0, 0);
}

uint64_t sub_1000B2D10()
{
  sub_1000B1538(*(unsigned char *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000B2D8C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000B2DAC, 0, 0);
}

uint64_t sub_1000B2DAC()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  *uint64_t v1 = sub_1000B49C8();
  v1[1] = v2;
  v1[2] = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

unint64_t sub_1000B2E1C()
{
  unint64_t result = qword_10012EA70;
  if (!qword_10012EA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EA70);
  }
  return result;
}

uint64_t sub_1000B2E70(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000B3A3C();
  *uint64_t v4 = v2;
  v4[1] = sub_100016604;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000B2F24()
{
  unint64_t result = qword_10012EA80;
  if (!qword_10012EA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EA80);
  }
  return result;
}

unint64_t sub_1000B2F7C()
{
  unint64_t result = qword_10012EA88;
  if (!qword_10012EA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EA88);
  }
  return result;
}

unint64_t sub_1000B2FD4()
{
  unint64_t result = qword_10012EA90[0];
  if (!qword_10012EA90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10012EA90);
  }
  return result;
}

uint64_t sub_1000B3028(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000B3A3C();
  *unint64_t v5 = v2;
  v5[1] = sub_1000168D4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000B30DC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000B3A3C();
  *uint64_t v4 = v2;
  v4[1] = sub_100018660;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000B3190()
{
  unint64_t result = qword_10012EAA8;
  if (!qword_10012EAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EAA8);
  }
  return result;
}

unint64_t sub_1000B31E8()
{
  unint64_t result = qword_10012EAB0;
  if (!qword_10012EAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EAB0);
  }
  return result;
}

unint64_t sub_1000B3240()
{
  unint64_t result = qword_10012EAB8;
  if (!qword_10012EAB8)
  {
    sub_100008354(qword_10012EAC0);
    sub_1000B31E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EAB8);
  }
  return result;
}

uint64_t sub_1000B32B4(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000B2E1C();
  *unint64_t v5 = v2;
  v5[1] = sub_100018664;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for TVSettingsPurchaseDefinitionEntity.Query()
{
  return &type metadata for TVSettingsPurchaseDefinitionEntity.Query;
}

ValueMetadata *type metadata accessor for TVSettingsPurchaseDefinitionEntity()
{
  return &type metadata for TVSettingsPurchaseDefinitionEntity;
}

ValueMetadata *type metadata accessor for TVSettingsPurchaseDefinitionEntity.UpdateIntent_value()
{
  return &type metadata for TVSettingsPurchaseDefinitionEntity.UpdateIntent_value;
}

uint64_t sub_1000B3398()
{
  return sub_100014AC4(&qword_10012EAD8, &qword_10012EAE0);
}

uint64_t sub_1000B33D8()
{
  sub_1000B37CC();
  uint64_t v2 = sub_1000E3BA0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100017844(v3, v0, v2, v1);
}

uint64_t sub_1000B346C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000171E8(&qword_100129E48, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100142310, a1);
}

uint64_t sub_1000B34A4(uint64_t a1)
{
  unint64_t v2 = sub_1000B2FD4();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_1000B34F0(uint64_t a1)
{
  unint64_t v2 = sub_1000B2BD4();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_1000B353C(uint64_t a1)
{
  unint64_t v2 = sub_1000B35E4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000B358C()
{
  unint64_t result = qword_10012EAE8;
  if (!qword_10012EAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EAE8);
  }
  return result;
}

unint64_t sub_1000B35E4()
{
  unint64_t result = qword_10012EAF8;
  if (!qword_10012EAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EAF8);
  }
  return result;
}

unint64_t sub_1000B363C()
{
  unint64_t result = qword_10012EB00;
  if (!qword_10012EB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EB00);
  }
  return result;
}

unint64_t sub_1000B3694()
{
  unint64_t result = qword_10012EB08;
  if (!qword_10012EB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EB08);
  }
  return result;
}

unint64_t sub_1000B36EC()
{
  unint64_t result = qword_10012EB10;
  if (!qword_10012EB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EB10);
  }
  return result;
}

unint64_t sub_1000B3740(void *a1)
{
  a1[1] = sub_1000B3778();
  a1[2] = sub_1000B37CC();
  unint64_t result = sub_1000B2BD4();
  a1[3] = result;
  return result;
}

unint64_t sub_1000B3778()
{
  unint64_t result = qword_10012EB60;
  if (!qword_10012EB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EB60);
  }
  return result;
}

unint64_t sub_1000B37CC()
{
  unint64_t result = qword_10012EB68;
  if (!qword_10012EB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EB68);
  }
  return result;
}

unint64_t sub_1000B3824()
{
  unint64_t result = qword_10012EB70;
  if (!qword_10012EB70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EB70);
  }
  return result;
}

unint64_t sub_1000B3878(uint64_t a1)
{
  unint64_t result = sub_1000B38A0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000B38A0()
{
  unint64_t result = qword_10012EBA8;
  if (!qword_10012EBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EBA8);
  }
  return result;
}

uint64_t sub_1000B38F4()
{
  return sub_100014AC4(&qword_10012EBB0, &qword_10012EBB8);
}

unint64_t sub_1000B3934()
{
  unint64_t result = qword_10012EBC0;
  if (!qword_10012EBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EBC0);
  }
  return result;
}

unint64_t sub_1000B398C()
{
  unint64_t result = qword_10012EBC8;
  if (!qword_10012EBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EBC8);
  }
  return result;
}

unint64_t sub_1000B39E4()
{
  unint64_t result = qword_10012EBD0;
  if (!qword_10012EBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EBD0);
  }
  return result;
}

unint64_t sub_1000B3A3C()
{
  unint64_t result = qword_10012EBD8;
  if (!qword_10012EBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EBD8);
  }
  return result;
}

uint64_t sub_1000B3A90@<X0>(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v1 = sub_1000E56B0();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_1000082B4(&qword_10012D820);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v36 = v2;
  uint64_t v37 = v3;
  __chkstk_darwin(v2);
  long long v32 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000082B4(&qword_10012D828);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  uint64_t v39 = v6;
  __chkstk_darwin(v5);
  long long v33 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000082B4(&qword_10012D830);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v40 = v8;
  uint64_t v41 = v9;
  __chkstk_darwin(v8);
  uint64_t v34 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000082B4(&qword_10012D838);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v42 = v11;
  uint64_t v43 = v12;
  __chkstk_darwin(v11);
  uint64_t v35 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  strcpy((char *)v45, "com.apple.tv.");
  HIWORD(v45[1]) = -4864;
  uint64_t v50 = (uint64_t)&type metadata for TVSettingsPurchaseDefinitionWidget;
  sub_1000082B4(&qword_10012EC78);
  v52._countAndFlagsBits = sub_1000E5A20();
  sub_1000E5A70(v52);
  swift_bridgeObjectRelease();
  v31[1] = v45[0];
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_1000E56A0();
  sub_1000082B4(&qword_10012CEC8);
  sub_1000B4C9C();
  sub_1000B4DF8();
  sub_1000B2BD4();
  sub_10007A258();
  uint64_t v14 = v32;
  sub_1000E56C0();
  v45[0] = &type metadata for TVSettingsPurchaseDefinitionWidget;
  v45[0] = sub_1000E5A20();
  v45[1] = v15;
  uint64_t v50 = 0x746567646957;
  uint64_t v51 = (void *)0xE600000000000000;
  uint64_t v48 = 0x656C67676F54;
  unint64_t v49 = 0xE600000000000000;
  unint64_t v30 = sub_100014158();
  uint64_t v16 = sub_1000E5C70();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  v45[0] = v16;
  v45[1] = v18;
  uint64_t v19 = sub_100014AC4(&qword_10012D848, &qword_10012D820);
  uint64_t v20 = v33;
  uint64_t v21 = v36;
  sub_1000E4640();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v14, v21);
  uint64_t v50 = qword_10012EA18;
  uint64_t v51 = off_10012EA20;
  v45[0] = v21;
  v45[1] = &type metadata for String;
  uint64_t v46 = v19;
  unint64_t v47 = v30;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v34;
  uint64_t v24 = v38;
  sub_1000E4600();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v20, v24);
  v45[0] = v24;
  v45[1] = &type metadata for String;
  uint64_t v46 = OpaqueTypeConformance2;
  unint64_t v47 = v30;
  uint64_t v25 = swift_getOpaqueTypeConformance2();
  Swift::String v26 = v35;
  uint64_t v27 = v40;
  sub_1000E4650();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v23, v27);
  v45[0] = v27;
  v45[1] = v25;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v42;
  sub_1000E4610();
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v26, v28);
}

uint64_t sub_1000B40B8@<X0>(uint64_t a1@<X8>)
{
  sub_100014158();
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000E4A00();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1000B412C@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1000082B4(&qword_10012D850);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000E3DA0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v38 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v38 - v15;
  char v17 = *a1;
  if (qword_100129E90 != -1) {
    swift_once();
  }
  uint64_t v18 = qword_1001423D0;
  if (*(void *)(qword_1001423D0 + 16))
  {
    uint64_t v41 = v11;
    swift_bridgeObjectRetain();
    unint64_t v19 = sub_1000357B0(v17);
    if (v20)
    {
      unint64_t v21 = v19;
      uint64_t v40 = v7;
      uint64_t v22 = *(void *)(v18 + 56);
      uint64_t v23 = sub_1000E3B50();
      uint64_t v24 = *(void *)(v23 - 8);
      uint64_t v39 = v8;
      uint64_t v25 = v24;
      uint64_t v26 = v22 + *(void *)(v24 + 72) * v21;
      uint64_t v7 = v40;
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v6, v26, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v6, 0, 1, v23);
      uint64_t v8 = v39;
    }
    else
    {
      uint64_t v23 = sub_1000E3B50();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v6, 1, 1, v23);
    }
    swift_bridgeObjectRelease();
    sub_1000E3B50();
    uint64_t v28 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v6, 1, v23) != 1)
    {
      sub_1000E3B10();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v23);
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v16, v14, v7);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v41, v16, v7);
      uint64_t v30 = sub_1000E49F0();
      uint64_t v31 = v34;
      uint64_t v35 = v8;
      uint64_t v33 = v36;
      uint64_t v32 = v37 & 1;
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v16, v7);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v27 = sub_1000E3B50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v6, 1, 1, v27);
  }
  uint64_t result = sub_10008C834((uint64_t)v6);
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
LABEL_11:
  *a2 = v30;
  a2[1] = v31;
  a2[2] = v32;
  a2[3] = v33;
  return result;
}

uint64_t sub_1000B4544()
{
  return sub_1000E5740();
}

uint64_t sub_1000B45D8()
{
  uint64_t v28 = sub_1000E3B90();
  uint64_t v0 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v27 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000082B4(&qword_10012A5C8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v20 - v6;
  uint64_t v8 = sub_1000082B4(&qword_10012A580);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000E3DA0();
  uint64_t v26 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v23 = sub_1000082B4(&qword_10012EC08);
  sub_1000E3D80();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v24 = v12 + 56;
  uint64_t v25 = v13;
  v13(v10, 1, 1, v11);
  uint64_t v14 = sub_1000E3A00();
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v29 = 0;
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v7;
  v15(v7, 1, 1, v14);
  v15(v5, 1, 1, v14);
  unsigned int v22 = enum case for InputConnectionBehavior.default(_:);
  char v17 = *(void (**)(void))(v0 + 104);
  uint64_t v20 = v0 + 104;
  unint64_t v21 = (void (*)(char *, void, uint64_t))v17;
  uint64_t v18 = v27;
  v17(v27);
  sub_1000B2FD4();
  uint64_t v23 = sub_1000E3A70();
  sub_1000082B4(&qword_10012EC10);
  sub_1000E3D80();
  v25(v10, 1, 1, v26);
  LOBYTE(v29) = 2;
  v15(v16, 1, 1, v14);
  v15(v5, 1, 1, v14);
  v21(v18, v22, v28);
  sub_1000B4C9C();
  sub_1000E3A60();
  return v23;
}

uint64_t sub_1000B49C8()
{
  uint64_t v0 = sub_1000E3D90();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000E3F10();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000E59F0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000E3DA0();
  __chkstk_darwin(v6 - 8);
  v9[1] = &type metadata for TVSettingsPurchaseDefinitionEntity;
  sub_1000082B4(&qword_10012CD78);
  uint64_t v7 = sub_1000E5A20();
  sub_1000082B4(&qword_10012EA38);
  sub_1000E5990();
  sub_1000E3F00();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  sub_1000E3DB0();
  sub_100014AC4(&qword_10012EBF0, &qword_10012EBF8);
  sub_1000B4C9C();
  sub_1000E3C80();
  return v7;
}

unint64_t sub_1000B4C9C()
{
  unint64_t result = qword_10012EC00;
  if (!qword_10012EC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EC00);
  }
  return result;
}

unint64_t sub_1000B4CF0()
{
  unint64_t result = qword_10012EC20;
  if (!qword_10012EC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EC20);
  }
  return result;
}

uint64_t sub_1000B4D44@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 16);
  return swift_retain();
}

ValueMetadata *type metadata accessor for TVSettingsPurchaseDefinitionWidget()
{
  return &type metadata for TVSettingsPurchaseDefinitionWidget;
}

uint64_t sub_1000B4D60()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000B4D7C(uint64_t a1)
{
  unint64_t result = sub_1000B4DA4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000B4DA4()
{
  unint64_t result = qword_10012EC70;
  if (!qword_10012EC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EC70);
  }
  return result;
}

unint64_t sub_1000B4DF8()
{
  unint64_t result = qword_10012EC80;
  if (!qword_10012EC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EC80);
  }
  return result;
}

uint64_t sub_1000B4E4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000B4F9C(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    long long v9 = *((_OWORD *)a2 + 3);
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 48) = v9;
    *(void *)(a1 + 64) = a2[8];
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 11);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 13);
    *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 15);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 17);
    uint64_t v10 = a3[7];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    *(void *)(a1 + 152) = a2[19];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1000082B4(&qword_10012D540);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_1000E5640();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = a3[8];
    uint64_t v15 = a1 + v14;
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = *(void *)v16;
    char v18 = *(unsigned char *)(v16 + 8);
    sub_10000954C(*(void *)v16, v18);
    *(void *)uint64_t v15 = v17;
    *(unsigned char *)(v15 + 8) = v18;
    uint64_t v19 = a3[9];
    uint64_t v20 = (void *)(a1 + v19);
    unint64_t v21 = (uint64_t *)((char *)a2 + v19);
    sub_1000082B4(&qword_10012D548);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = sub_1000E55E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
    }
    else
    {
      *uint64_t v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000B51EC(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + a2[7];
  sub_1000082B4(&qword_10012D540);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1000E5640();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  sub_100009A3C(*(void *)(a1 + a2[8]), *(unsigned char *)(a1 + a2[8] + 8));
  uint64_t v6 = a1 + a2[9];
  sub_1000082B4(&qword_10012D548);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1000E55E0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1000B5348(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  uint64_t v8 = a3[7];
  long long v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000082B4(&qword_10012D540);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1000E5640();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *long long v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)v14;
  char v16 = *(unsigned char *)(v14 + 8);
  sub_10000954C(*(void *)v14, v16);
  *(void *)uint64_t v13 = v15;
  *(unsigned char *)(v13 + 8) = v16;
  uint64_t v17 = a3[9];
  char v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  sub_1000082B4(&qword_10012D548);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_1000E55E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  else
  {
    *char v18 = *v19;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_1000B5548(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = a3[7];
    long long v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_1000147B8(a1 + v6, &qword_10012D540);
    sub_1000082B4(&qword_10012D540);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_1000E5640();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *long long v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v10 = a3[8];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = *(void *)v12;
  char v14 = *(unsigned char *)(v12 + 8);
  sub_10000954C(*(void *)v12, v14);
  uint64_t v15 = *(void *)v11;
  char v16 = *(unsigned char *)(v11 + 8);
  *(void *)uint64_t v11 = v13;
  *(unsigned char *)(v11 + 8) = v14;
  sub_100009A3C(v15, v16);
  if (a1 != a2)
  {
    uint64_t v17 = a3[9];
    char v18 = (void *)(a1 + v17);
    uint64_t v19 = (void *)(a2 + v17);
    sub_1000147B8(a1 + v17, &qword_10012D548);
    sub_1000082B4(&qword_10012D548);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = sub_1000E55E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *char v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000B57E8(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  long long v6 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v6;
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  long long v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v7;
  long long v8 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v8;
  long long v9 = *(_OWORD *)(a2 + 32);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v9;
  uint64_t v13 = sub_1000082B4(&qword_10012D540);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_1000E5640();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  uint64_t v15 = a3[8];
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v15;
  uint64_t v18 = a2 + v15;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  uint64_t v19 = (void *)(a1 + v16);
  uint64_t v20 = (const void *)(a2 + v16);
  uint64_t v21 = sub_1000082B4(&qword_10012D548);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = sub_1000E55E0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  return a1;
}

uint64_t sub_1000B59B4(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = a3[7];
    long long v8 = (void *)(a1 + v7);
    long long v9 = (const void *)(a2 + v7);
    sub_1000147B8(a1 + v7, &qword_10012D540);
    uint64_t v10 = sub_1000082B4(&qword_10012D540);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_1000E5640();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v15 = *v14;
  LOBYTE(v14) = *((unsigned char *)v14 + 8);
  uint64_t v16 = *(void *)v13;
  char v17 = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v13 = v15;
  *(unsigned char *)(v13 + 8) = (_BYTE)v14;
  sub_100009A3C(v16, v17);
  if (a1 != a2)
  {
    uint64_t v18 = a3[9];
    uint64_t v19 = (void *)(a1 + v18);
    uint64_t v20 = (const void *)(a2 + v18);
    sub_1000147B8(a1 + v18, &qword_10012D548);
    uint64_t v21 = sub_1000082B4(&qword_10012D548);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = sub_1000E55E0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1000B5C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000B5C1C);
}

uint64_t sub_1000B5C1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1000082B4(&qword_10012EC88);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_1000082B4(&qword_10012EC90);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 36);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_1000B5D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000B5D64);
}

uint64_t sub_1000B5D64(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_1000082B4(&qword_10012EC88);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_1000082B4(&qword_10012EC90);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 36);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for TVWidgetView(uint64_t a1)
{
  return sub_10002B794(a1, (uint64_t *)&unk_10012ECF0);
}

void sub_1000B5EB8()
{
  sub_1000B5FE0(319, &qword_10012ED00, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  if (v0 <= 0x3F)
  {
    sub_1000B5FE0(319, (unint64_t *)&unk_10012ED08, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1000B5FE0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1000E3FF0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1000B6034()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_1000B6050@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_1000B6108(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10012A2B0, &qword_10012A2B8).n128_u64[0];
  return result;
}

double sub_1000B60AC@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_1000B6108(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10012A2C0, &qword_10012A2C8).n128_u64[0];
  return result;
}

__n128 sub_1000B6108@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1000E5B80();
    uint64_t v28 = (void *)sub_1000E4730();
    sub_1000E3F50();

    uint64_t v19 = a17;
  }
  sub_1000E4240();
  sub_100014754(v17, a9, a16);
  uint64_t v29 = (_OWORD *)(a9 + *(int *)(sub_1000082B4(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  _OWORD *v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

double sub_1000B62D8@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_1000B6108(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10012A080, &qword_10012A2A0).n128_u64[0];
  return result;
}

double sub_1000B6334@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_1000B6108(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10012A190, &qword_10012A198).n128_u64[0];
  return result;
}

double sub_1000B6390@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_1000B6108(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10012A2E0, &qword_10012A2E8).n128_u64[0];
  return result;
}

double sub_1000B63EC@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_1000B6108(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10012A310, &qword_10012A318).n128_u64[0];
  return result;
}

double sub_1000B6448@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_1000B6108(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10012B5C8, &qword_10012B5D0).n128_u64[0];
  return result;
}

__n128 sub_1000B64A4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1000E5B80();
    uint64_t v23 = (void *)sub_1000E4730();
    sub_1000E3F50();
  }
  sub_1000E4240();
  sub_1000C3D54(v13, a9, (uint64_t (*)(void))type metadata accessor for TVWidgetMetadataView);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_1000082B4(&qword_10012C210) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

double sub_1000B6670@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_1000B6108(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10012C248, &qword_10012C250).n128_u64[0];
  return result;
}

double sub_1000B66CC@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_1000B6108(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10012D228, &qword_10012D230).n128_u64[0];
  return result;
}

double sub_1000B6728@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_1000B6108(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10012D380, &qword_10012D388).n128_u64[0];
  return result;
}

uint64_t sub_1000B6784@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v18 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1000E5B80();
    long long v27 = (void *)sub_1000E4730();
    sub_1000E3F50();

    uint64_t v18 = a16;
  }
  sub_1000E4240();
  *(void *)a9 = v18;
  *(void *)(a9 + 8) = a17;
  *(_OWORD *)(a9 + 80) = v33;
  *(_OWORD *)(a9 + 96) = v34;
  *(_OWORD *)(a9 + 112) = v35;
  *(_OWORD *)(a9 + 16) = v29;
  *(_OWORD *)(a9 + 32) = v30;
  *(_OWORD *)(a9 + 48) = v31;
  *(_OWORD *)(a9 + 64) = v32;

  return swift_retain();
}

uint64_t sub_1000B6944@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1000E5B80();
    uint64_t v23 = (void *)sub_1000E4730();
    sub_1000E3F50();
  }
  sub_1000E4240();
  long long v24 = *(_OWORD *)(v13 + 80);
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  *(_OWORD *)(a9 + 80) = v24;
  *(unsigned char *)(a9 + 96) = *(unsigned char *)(v13 + 96);
  long long v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  long long v26 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v26;
  *(_OWORD *)(a9 + 104) = v28;
  *(_OWORD *)(a9 + 120) = v29;
  *(_OWORD *)(a9 + 136) = v30;
  *(_OWORD *)(a9 + 200) = v34;
  *(_OWORD *)(a9 + 184) = v33;
  *(_OWORD *)(a9 + 168) = v32;
  *(_OWORD *)(a9 + 152) = v31;

  return sub_1000C4F94(v13);
}

double sub_1000B6B18@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_1000B6108(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_10012F380, &qword_10012F388).n128_u64[0];
  return result;
}

uint64_t sub_1000B6B74@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1000E5B80();
    long long v31 = (void *)sub_1000E4730();
    sub_1000E3F50();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_1000E4240();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_10003A978(a16, v22, v21 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000B6D68@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v14 = v13;
  uint64_t v15 = a9;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1000E5B80();
    long long v24 = (void *)sub_1000E4730();
    sub_1000E3F50();

    uint64_t v15 = a9;
  }
  sub_1000E4240();
  memcpy((void *)v15, v14, 0x131uLL);
  *(_OWORD *)(v15 + 376) = v31;
  *(_OWORD *)(v15 + 392) = v32;
  *(_OWORD *)(v15 + 408) = v33;
  *(_OWORD *)(v15 + 312) = v27;
  *(_OWORD *)(v15 + 328) = v28;
  *(_OWORD *)(v15 + 344) = v29;
  *(_OWORD *)(v15 + 360) = v30;

  return sub_1000C5248((uint64_t)v14);
}

uint64_t sub_1000B6F2C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v14 = v13;
  uint64_t v15 = a9;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1000E5B80();
    long long v24 = (void *)sub_1000E4730();
    sub_1000E3F50();

    uint64_t v15 = a9;
  }
  sub_1000E4240();
  memcpy((void *)v15, v14, 0x131uLL);
  *(_OWORD *)(v15 + 376) = v31;
  *(_OWORD *)(v15 + 392) = v32;
  *(_OWORD *)(v15 + 408) = v33;
  *(_OWORD *)(v15 + 312) = v27;
  *(_OWORD *)(v15 + 328) = v28;
  *(_OWORD *)(v15 + 344) = v29;
  *(_OWORD *)(v15 + 360) = v30;

  return sub_1000C5130((uint64_t)v14);
}

uint64_t sub_1000B70F0@<X0>(char a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  v17[1] = a3;
  uint64_t v7 = type metadata accessor for TVWidgetMetadataView();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000082B4(&qword_10012F360);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000082B4(&qword_10012C218);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    a2(v4);
    sub_100014754((uint64_t)v15, (uint64_t)v12, &qword_10012C218);
    swift_storeEnumTagMultiPayload();
    sub_1000C4FE4();
    sub_1000C29AC(&qword_10012F378, (void (*)(uint64_t))type metadata accessor for TVWidgetMetadataView);
    sub_1000E4690();
    return sub_1000147B8((uint64_t)v15, &qword_10012C218);
  }
  else
  {
    sub_1000C3D54(v4, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for TVWidgetMetadataView);
    sub_1000C3D54((uint64_t)v9, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for TVWidgetMetadataView);
    swift_storeEnumTagMultiPayload();
    sub_1000C4FE4();
    sub_1000C29AC(&qword_10012F378, (void (*)(uint64_t))type metadata accessor for TVWidgetMetadataView);
    sub_1000E4690();
    return sub_1000C2B9C((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for TVWidgetMetadataView);
  }
}

uint64_t sub_1000B7394@<X0>(char a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  v19[1] = a3;
  uint64_t v7 = sub_1000082B4(&qword_10012F098);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000082B4(&qword_10012F0B8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000082B4(&qword_10012F0C0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    a2(v4);
    sub_100014754((uint64_t)v15, (uint64_t)v12, &qword_10012F0C0);
    swift_storeEnumTagMultiPayload();
    sub_10003F560(&qword_10012F0C8, &qword_10012F0C0, &qword_10012F0D0, &qword_10012F098);
    sub_100014AC4(&qword_10012F0D0, &qword_10012F098);
    sub_1000E4690();
    uint64_t v16 = (uint64_t)v15;
    uint64_t v17 = &qword_10012F0C0;
  }
  else
  {
    sub_100014754(v4, (uint64_t)v9, &qword_10012F098);
    sub_100014754((uint64_t)v9, (uint64_t)v12, &qword_10012F098);
    swift_storeEnumTagMultiPayload();
    sub_10003F560(&qword_10012F0C8, &qword_10012F0C0, &qword_10012F0D0, &qword_10012F098);
    sub_100014AC4(&qword_10012F0D0, &qword_10012F098);
    sub_1000E4690();
    uint64_t v16 = (uint64_t)v9;
    uint64_t v17 = &qword_10012F098;
  }
  return sub_1000147B8(v16, v17);
}

uint64_t sub_1000B7638@<X0>(char a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  v19[1] = a3;
  uint64_t v7 = sub_1000082B4(&qword_10012F138);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000082B4(&qword_10012F178);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000082B4(&qword_10012F180);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    a2(v4);
    sub_100014754((uint64_t)v15, (uint64_t)v12, &qword_10012F180);
    swift_storeEnumTagMultiPayload();
    sub_10003F560(&qword_10012F188, &qword_10012F180, &qword_10012F190, &qword_10012F138);
    sub_100014AC4(&qword_10012F190, &qword_10012F138);
    sub_1000E4690();
    uint64_t v16 = (uint64_t)v15;
    uint64_t v17 = &qword_10012F180;
  }
  else
  {
    sub_100014754(v4, (uint64_t)v9, &qword_10012F138);
    sub_100014754((uint64_t)v9, (uint64_t)v12, &qword_10012F138);
    swift_storeEnumTagMultiPayload();
    sub_10003F560(&qword_10012F188, &qword_10012F180, &qword_10012F190, &qword_10012F138);
    sub_100014AC4(&qword_10012F190, &qword_10012F138);
    sub_1000E4690();
    uint64_t v16 = (uint64_t)v9;
    uint64_t v17 = &qword_10012F138;
  }
  return sub_1000147B8(v16, v17);
}

uint64_t sub_1000B78DC@<X0>(char a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  v19[1] = a3;
  uint64_t v7 = sub_1000082B4(&qword_10012F1E0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000082B4(&qword_10012F278);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000082B4(&qword_10012F280);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    a2(v4);
    sub_100014754((uint64_t)v15, (uint64_t)v12, &qword_10012F280);
    swift_storeEnumTagMultiPayload();
    sub_1000C44D4();
    sub_1000C4574();
    sub_1000E4690();
    uint64_t v16 = (uint64_t)v15;
    uint64_t v17 = &qword_10012F280;
  }
  else
  {
    sub_100014754(v4, (uint64_t)v9, &qword_10012F1E0);
    sub_100014754((uint64_t)v9, (uint64_t)v12, &qword_10012F1E0);
    swift_storeEnumTagMultiPayload();
    sub_1000C44D4();
    sub_1000C4574();
    sub_1000E4690();
    uint64_t v16 = (uint64_t)v9;
    uint64_t v17 = &qword_10012F1E0;
  }
  return sub_1000147B8(v16, v17);
}

uint64_t sub_1000B7B04()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for TVWidgetView(0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000E55E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v23 - v10;
  sub_1000C2410(&qword_10012D548, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x80000001000EC950, (uint64_t)&v23 - v10);
  sub_1000E55D0();
  char v12 = sub_1000E55C0();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  v13(v11, v5);
  sub_1000C3D54(v1, (uint64_t)v4, type metadata accessor for TVWidgetView);
  if (v12)
  {
    uint64_t v14 = &v4[*(int *)(v2 + 32)];
    uint64_t v15 = *(void *)v14;
    char v16 = v14[8];
    sub_10000954C(*(void *)v14, v16);
    char v17 = sub_1000C1FD4(v15, v16);
    sub_100009A3C(v15, v16);
    sub_1000C2B9C((uint64_t)v4, type metadata accessor for TVWidgetView);
    if ((v17 & 1) == 0) {
      return sub_1000E5660();
    }
  }
  else
  {
    sub_1000C2B9C((uint64_t)v4, type metadata accessor for TVWidgetView);
  }
  uint64_t v19 = v1 + *(int *)(v2 + 32);
  uint64_t v20 = *(void *)v19;
  char v21 = *(unsigned char *)(v19 + 8);
  sub_10000954C(*(void *)v19, v21);
  char v22 = sub_1000C1FD4(v20, v21);
  sub_100009A3C(v20, v21);
  if (v22) {
    return sub_1000E5650();
  }
  else {
    return sub_1000E5680();
  }
}

uint64_t sub_1000B7DA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v208 = a1;
  uint64_t v177 = type metadata accessor for TVWidgetExtraLarge(0);
  __chkstk_darwin(v177);
  v164 = (char *)&v162 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = sub_1000082B4(&qword_10012ED48);
  uint64_t v166 = *(void *)(v176 - 8);
  uint64_t v3 = __chkstk_darwin(v176);
  v163 = (char *)&v162 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v165 = (char *)&v162 - v5;
  uint64_t v172 = sub_1000082B4(&qword_10012ED50);
  __chkstk_darwin(v172);
  v173 = (char *)&v162 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v204 = sub_1000082B4(&qword_10012ED58);
  __chkstk_darwin(v204);
  v175 = (char *)&v162 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = type metadata accessor for TVWidgetLarge(0);
  __chkstk_darwin(v171);
  v168 = (char *)&v162 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v174 = sub_1000082B4(&qword_10012ED60);
  uint64_t v170 = *(void *)(v174 - 8);
  uint64_t v9 = __chkstk_darwin(v174);
  v167 = (char *)&v162 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v169 = (char *)&v162 - v11;
  v209 = (uint64_t *)type metadata accessor for TVWidgetMedium(0);
  __chkstk_darwin(v209);
  v183 = (char *)&v162 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v199 = sub_1000082B4(&qword_10012ED68);
  uint64_t v185 = *(void *)(v199 - 8);
  uint64_t v13 = __chkstk_darwin(v199);
  v182 = (char *)&v162 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v184 = (char *)&v162 - v15;
  uint64_t v206 = sub_1000082B4(&qword_10012ED70);
  __chkstk_darwin(v206);
  uint64_t v207 = (uint64_t)&v162 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v200 = sub_1000082B4(&qword_10012ED78);
  __chkstk_darwin(v200);
  uint64_t v202 = (uint64_t)&v162 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v196 = sub_1000082B4(&qword_10012ED80);
  __chkstk_darwin(v196);
  uint64_t v197 = (uint64_t)&v162 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v201 = sub_1000082B4(&qword_10012ED88);
  __chkstk_darwin(v201);
  v198 = (char *)&v162 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v205 = sub_1000082B4(&qword_10012ED90);
  __chkstk_darwin(v205);
  v203 = (char *)&v162 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v192 = sub_1000E4720();
  uint64_t v191 = *(void *)(v192 - 8);
  __chkstk_darwin(v192);
  v190 = (char *)&v162 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v194 = type metadata accessor for TVWidgetSmall(0);
  __chkstk_darwin(v194);
  v179 = (char *)&v162 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v188 = sub_1000082B4(&qword_10012ED98);
  uint64_t v181 = *(void *)(v188 - 8);
  uint64_t v23 = __chkstk_darwin(v188);
  v178 = (char *)&v162 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  v180 = (char *)&v162 - v25;
  uint64_t v186 = sub_1000082B4(&qword_10012EDA0);
  __chkstk_darwin(v186);
  v187 = (unint64_t *)((char *)&v162 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = sub_1000E5690();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = __chkstk_darwin(v27);
  long long v31 = (char *)&v162 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  long long v33 = (char *)&v162 - v32;
  uint64_t v195 = sub_1000082B4(&qword_10012EDA8);
  __chkstk_darwin(v195);
  v189 = (char *)&v162 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_1000E5640();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = __chkstk_darwin(v35);
  long long v39 = (char *)&v162 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v37);
  uint64_t v41 = (char *)&v162 - v40;
  type metadata accessor for TVWidgetView(0);
  sub_1000C2410(&qword_10012D540, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v41);
  uint64_t v42 = *(uint64_t (**)(char *, uint64_t))(v36 + 88);
  uint64_t v193 = v35;
  uint64_t v43 = v42(v41, v35);
  uint64_t v44 = v43;
  if (v43 == enum case for WidgetFamily.systemSmall(_:))
  {
    sub_1000B7B04();
    sub_1000E5660();
    char v45 = sub_1000E5670();
    uint64_t v46 = *(void (**)(char *, uint64_t))(v28 + 8);
    v46(v31, v27);
    v46(v33, v27);
    unint64_t v47 = *(void *)v1;
    if (v45)
    {
      int v48 = *(unsigned __int8 *)(v1 + 8);
      if (v48 != 4)
      {
        swift_bridgeObjectRetain();
        uint64_t v49 = (uint64_t)v189;
        goto LABEL_35;
      }
      uint64_t v49 = (uint64_t)v189;
      if (v47)
      {
        if (v47 >> 62)
        {
          swift_bridgeObjectRetain_n();
          uint64_t v72 = sub_1000E5D70();
          swift_bridgeObjectRelease();
          if (v72) {
            goto LABEL_7;
          }
        }
        else
        {
          uint64_t v50 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v50)
          {
LABEL_7:
            LOBYTE(v48) = 4;
LABEL_35:
            uint64_t v73 = v187;
            unint64_t *v187 = v47;
            *((unsigned char *)v73 + 8) = v48;
            v73[2] = 3;
            swift_storeEnumTagMultiPayload();
            sub_1000C2904();
            uint64_t v74 = sub_1000C29AC(&qword_10012EDD0, (void (*)(uint64_t))type metadata accessor for TVWidgetSmall);
            unint64_t v75 = sub_1000C2958();
            *(void *)&long long v214 = v194;
            *((void *)&v214 + 1) = &type metadata for LinearGradient;
            *(void *)&long long v215 = v74;
            *((void *)&v215 + 1) = v75;
            swift_getOpaqueTypeConformance2();
            sub_1000E4690();
LABEL_42:
            sub_100014754(v49, v197, &qword_10012EDA8);
            swift_storeEnumTagMultiPayload();
            sub_1000C280C();
            uint64_t v113 = sub_1000C29AC(&qword_10012EDE0, (void (*)(uint64_t))type metadata accessor for TVWidgetMedium);
            unint64_t v114 = sub_1000C2958();
            *(void *)&long long v214 = v209;
            *((void *)&v214 + 1) = &type metadata for LinearGradient;
            *(void *)&long long v215 = v113;
            *((void *)&v215 + 1) = v114;
            swift_getOpaqueTypeConformance2();
            uint64_t v115 = (uint64_t)v198;
            sub_1000E4690();
            sub_100014754(v115, v202, &qword_10012ED88);
            swift_storeEnumTagMultiPayload();
            sub_1000C2714();
            sub_1000C29F4();
            uint64_t v116 = (uint64_t)v203;
            sub_1000E4690();
            sub_1000147B8(v115, &qword_10012ED88);
            sub_100014754(v116, v207, &qword_10012ED90);
            swift_storeEnumTagMultiPayload();
            sub_1000C2698();
            sub_1000E4690();
            sub_1000147B8(v116, &qword_10012ED90);
            return sub_1000147B8(v49, &qword_10012EDA8);
          }
        }
      }
      LOBYTE(v48) = 0;
      goto LABEL_35;
    }
    uint64_t v56 = v44;
    uint64_t v57 = v193;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 104))(v39, v56, v193);
    unint64_t v58 = sub_1000B9CAC(v47, (uint64_t)v39);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v57);
    int v59 = *(unsigned __int8 *)(v1 + 8);
    if (v59 != 4)
    {
LABEL_41:
      long long v97 = *(_OWORD *)(v1 + 128);
      long long v220 = *(_OWORD *)(v1 + 112);
      long long v221 = v97;
      long long v222 = *(_OWORD *)(v1 + 144);
      long long v98 = *(_OWORD *)(v1 + 64);
      long long v216 = *(_OWORD *)(v1 + 48);
      long long v217 = v98;
      long long v99 = *(_OWORD *)(v1 + 96);
      long long v218 = *(_OWORD *)(v1 + 80);
      long long v219 = v99;
      long long v100 = *(_OWORD *)(v1 + 32);
      long long v214 = *(_OWORD *)(v1 + 16);
      long long v215 = v100;
      uint64_t v101 = (uint64_t)v179;
      sub_1000C2B50((uint64_t)&v214);
      sub_1000B7B04();
      *(void *)uint64_t v101 = v58;
      *(unsigned char *)(v101 + 8) = v59;
      long long v102 = v221;
      *(_OWORD *)(v101 + 112) = v220;
      *(_OWORD *)(v101 + 128) = v102;
      *(_OWORD *)(v101 + 144) = v222;
      long long v103 = v217;
      *(_OWORD *)(v101 + 48) = v216;
      *(_OWORD *)(v101 + 64) = v103;
      long long v104 = v219;
      *(_OWORD *)(v101 + 80) = v218;
      *(_OWORD *)(v101 + 96) = v104;
      long long v105 = v215;
      *(_OWORD *)(v101 + 16) = v214;
      *(_OWORD *)(v101 + 32) = v105;
      v106 = v190;
      uint64_t v107 = sub_1000E4710();
      __chkstk_darwin(v107);
      sub_1000E4F50();
      uint64_t v193 = sub_1000C29AC(&qword_10012EDD0, (void (*)(uint64_t))type metadata accessor for TVWidgetSmall);
      unint64_t v159 = sub_1000C2958();
      v108 = v178;
      uint64_t v109 = v194;
      sub_1000E4B50();
      (*(void (**)(char *, uint64_t))(v191 + 8))(v106, v192);
      sub_1000C2B9C(v101, type metadata accessor for TVWidgetSmall);
      uint64_t v110 = v181;
      v111 = v180;
      uint64_t v112 = v188;
      (*(void (**)(char *, char *, uint64_t))(v181 + 32))(v180, v108, v188);
      (*(void (**)(unint64_t *, char *, uint64_t))(v110 + 16))(v187, v111, v112);
      swift_storeEnumTagMultiPayload();
      sub_1000C2904();
      uint64_t v210 = v109;
      v211 = &type metadata for LinearGradient;
      v212 = (void *)v193;
      unint64_t v213 = v159;
      swift_getOpaqueTypeConformance2();
      uint64_t v49 = (uint64_t)v189;
      sub_1000E4690();
      (*(void (**)(char *, uint64_t))(v110 + 8))(v111, v112);
      goto LABEL_42;
    }
    unint64_t v60 = *(void *)v1;
    if (*(void *)v1)
    {
      if (v60 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v96 = sub_1000E5D70();
        swift_bridgeObjectRelease();
        if (v96) {
          goto LABEL_18;
        }
      }
      else if (*(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_18:
        LOBYTE(v59) = 4;
        goto LABEL_41;
      }
    }
    LOBYTE(v59) = 0;
    goto LABEL_41;
  }
  if (v43 == enum case for WidgetFamily.systemMedium(_:))
  {
    unint64_t v51 = *(void *)v1;
    uint64_t v52 = v193;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 104))(v39, v43, v193);
    unint64_t v53 = sub_1000B9CAC(v51, (uint64_t)v39);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v52);
    int v54 = *(unsigned __int8 *)(v1 + 8);
    if (v54 != 4)
    {
LABEL_38:
      long long v77 = *(_OWORD *)(v1 + 128);
      long long v220 = *(_OWORD *)(v1 + 112);
      long long v221 = v77;
      long long v222 = *(_OWORD *)(v1 + 144);
      long long v78 = *(_OWORD *)(v1 + 64);
      long long v216 = *(_OWORD *)(v1 + 48);
      long long v217 = v78;
      long long v79 = *(_OWORD *)(v1 + 96);
      long long v218 = *(_OWORD *)(v1 + 80);
      long long v219 = v79;
      long long v80 = *(_OWORD *)(v1 + 32);
      long long v214 = *(_OWORD *)(v1 + 16);
      long long v215 = v80;
      uint64_t v81 = (uint64_t)v183;
      sub_1000C2B50((uint64_t)&v214);
      sub_1000B7B04();
      *(void *)uint64_t v81 = v53;
      *(unsigned char *)(v81 + 8) = v54;
      long long v82 = v221;
      *(_OWORD *)(v81 + 112) = v220;
      *(_OWORD *)(v81 + 128) = v82;
      *(_OWORD *)(v81 + 144) = v222;
      long long v83 = v217;
      *(_OWORD *)(v81 + 48) = v216;
      *(_OWORD *)(v81 + 64) = v83;
      long long v84 = v219;
      *(_OWORD *)(v81 + 80) = v218;
      *(_OWORD *)(v81 + 96) = v84;
      long long v85 = v215;
      *(_OWORD *)(v81 + 16) = v214;
      *(_OWORD *)(v81 + 32) = v85;
      v86 = v190;
      uint64_t v87 = sub_1000E4710();
      __chkstk_darwin(v87);
      sub_1000E4F50();
      uint64_t v88 = sub_1000C29AC(&qword_10012EDE0, (void (*)(uint64_t))type metadata accessor for TVWidgetMedium);
      unint64_t v158 = sub_1000C2958();
      v89 = v182;
      v90 = v209;
      sub_1000E4B50();
      (*(void (**)(char *, uint64_t))(v191 + 8))(v86, v192);
      sub_1000C2B9C(v81, type metadata accessor for TVWidgetMedium);
      uint64_t v91 = v185;
      uint64_t v92 = v184;
      uint64_t v93 = v199;
      (*(void (**)(char *, char *, uint64_t))(v185 + 32))(v184, v89, v199);
      (*(void (**)(uint64_t, char *, uint64_t))(v91 + 16))(v197, v92, v93);
      swift_storeEnumTagMultiPayload();
      sub_1000C280C();
      uint64_t v210 = (uint64_t)v90;
      v211 = &type metadata for LinearGradient;
      v212 = (void *)v88;
      unint64_t v213 = v158;
      swift_getOpaqueTypeConformance2();
      uint64_t v94 = (uint64_t)v198;
      sub_1000E4690();
      sub_100014754(v94, v202, &qword_10012ED88);
      swift_storeEnumTagMultiPayload();
      sub_1000C2714();
      sub_1000C29F4();
      uint64_t v95 = (uint64_t)v203;
      sub_1000E4690();
      sub_1000147B8(v94, &qword_10012ED88);
      sub_100014754(v95, v207, &qword_10012ED90);
      swift_storeEnumTagMultiPayload();
      sub_1000C2698();
      sub_1000E4690();
      sub_1000147B8(v95, &qword_10012ED90);
      return (*(uint64_t (**)(char *, uint64_t))(v91 + 8))(v92, v93);
    }
    unint64_t v55 = *(void *)v1;
    if (*(void *)v1)
    {
      if (v55 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v76 = sub_1000E5D70();
        swift_bridgeObjectRelease();
        if (v76) {
          goto LABEL_13;
        }
      }
      else if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_13:
        LOBYTE(v54) = 4;
        goto LABEL_38;
      }
    }
    LOBYTE(v54) = 0;
    goto LABEL_38;
  }
  if (v43 == enum case for WidgetFamily.systemLarge(_:))
  {
    unint64_t v61 = *(void *)v1;
    uint64_t v62 = v193;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 104))(v39, v43, v193);
    unint64_t v63 = sub_1000B9CAC(v61, (uint64_t)v39);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v62);
    int v64 = *(unsigned __int8 *)(v1 + 8);
    if (v64 != 4)
    {
LABEL_45:
      long long v118 = *(_OWORD *)(v1 + 128);
      long long v220 = *(_OWORD *)(v1 + 112);
      long long v221 = v118;
      long long v222 = *(_OWORD *)(v1 + 144);
      long long v119 = *(_OWORD *)(v1 + 64);
      long long v216 = *(_OWORD *)(v1 + 48);
      long long v217 = v119;
      long long v120 = *(_OWORD *)(v1 + 96);
      long long v218 = *(_OWORD *)(v1 + 80);
      long long v219 = v120;
      long long v121 = *(_OWORD *)(v1 + 32);
      long long v214 = *(_OWORD *)(v1 + 16);
      long long v215 = v121;
      uint64_t v122 = v171;
      uint64_t v123 = (uint64_t)v168;
      sub_1000C2B50((uint64_t)&v214);
      sub_1000B7B04();
      *(void *)uint64_t v123 = v63;
      *(unsigned char *)(v123 + 8) = v64;
      long long v124 = v221;
      *(_OWORD *)(v123 + 112) = v220;
      *(_OWORD *)(v123 + 128) = v124;
      *(_OWORD *)(v123 + 144) = v222;
      long long v125 = v217;
      *(_OWORD *)(v123 + 48) = v216;
      *(_OWORD *)(v123 + 64) = v125;
      long long v126 = v219;
      *(_OWORD *)(v123 + 80) = v218;
      *(_OWORD *)(v123 + 96) = v126;
      long long v127 = v215;
      *(_OWORD *)(v123 + 16) = v214;
      *(_OWORD *)(v123 + 32) = v127;
      v128 = v190;
      uint64_t v129 = sub_1000E4710();
      v209 = &v162;
      __chkstk_darwin(v129);
      sub_1000E4F50();
      uint64_t v130 = sub_1000C29AC(&qword_10012EDF0, (void (*)(uint64_t))type metadata accessor for TVWidgetLarge);
      unint64_t v160 = sub_1000C2958();
      v131 = v167;
      sub_1000E4B50();
      (*(void (**)(char *, uint64_t))(v191 + 8))(v128, v192);
      sub_1000C2B9C(v123, type metadata accessor for TVWidgetLarge);
      uint64_t v132 = v170;
      v133 = v169;
      uint64_t v134 = v174;
      (*(void (**)(char *, char *, uint64_t))(v170 + 32))(v169, v131, v174);
      (*(void (**)(char *, char *, uint64_t))(v132 + 16))(v173, v133, v134);
      swift_storeEnumTagMultiPayload();
      uint64_t v210 = v122;
      v211 = &type metadata for LinearGradient;
      v212 = (void *)v130;
      unint64_t v213 = v160;
      swift_getOpaqueTypeConformance2();
      uint64_t v135 = sub_1000C29AC(&qword_10012EDF8, (void (*)(uint64_t))type metadata accessor for TVWidgetExtraLarge);
      uint64_t v210 = v177;
      v211 = &type metadata for LinearGradient;
      v212 = (void *)v135;
      unint64_t v213 = v160;
      swift_getOpaqueTypeConformance2();
      uint64_t v136 = (uint64_t)v175;
      sub_1000E4690();
      sub_100014754(v136, v202, &qword_10012ED58);
      swift_storeEnumTagMultiPayload();
      sub_1000C2714();
      sub_1000C29F4();
      uint64_t v137 = (uint64_t)v203;
      sub_1000E4690();
      sub_1000147B8(v136, &qword_10012ED58);
      sub_100014754(v137, v207, &qword_10012ED90);
      swift_storeEnumTagMultiPayload();
      sub_1000C2698();
      sub_1000E4690();
      sub_1000147B8(v137, &qword_10012ED90);
      return (*(uint64_t (**)(char *, uint64_t))(v132 + 8))(v133, v134);
    }
    unint64_t v65 = *(void *)v1;
    if (*(void *)v1)
    {
      if (v65 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v117 = sub_1000E5D70();
        swift_bridgeObjectRelease();
        if (v117) {
          goto LABEL_24;
        }
      }
      else if (*(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_24:
        LOBYTE(v64) = 4;
        goto LABEL_45;
      }
    }
    LOBYTE(v64) = 0;
    goto LABEL_45;
  }
  if (v43 != enum case for WidgetFamily.systemExtraLarge(_:))
  {
    swift_storeEnumTagMultiPayload();
    sub_1000C2698();
    sub_1000E4690();
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v41, v193);
  }
  unint64_t v66 = *(void *)v1;
  uint64_t v67 = v193;
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 104))(v39, v43, v193);
  unint64_t v68 = sub_1000B9CAC(v66, (uint64_t)v39);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v67);
  int v69 = *(unsigned __int8 *)(v1 + 8);
  if (v69 == 4)
  {
    unint64_t v70 = *(void *)v1;
    if (*(void *)v1)
    {
      if (v70 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v138 = sub_1000E5D70();
        swift_bridgeObjectRelease();
        if (v138) {
          goto LABEL_31;
        }
      }
      else if (*(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_31:
        LOBYTE(v69) = 4;
        goto LABEL_48;
      }
    }
    LOBYTE(v69) = 0;
  }
LABEL_48:
  long long v139 = *(_OWORD *)(v1 + 128);
  long long v220 = *(_OWORD *)(v1 + 112);
  long long v221 = v139;
  long long v222 = *(_OWORD *)(v1 + 144);
  long long v140 = *(_OWORD *)(v1 + 64);
  long long v216 = *(_OWORD *)(v1 + 48);
  long long v217 = v140;
  long long v141 = *(_OWORD *)(v1 + 96);
  long long v218 = *(_OWORD *)(v1 + 80);
  long long v219 = v141;
  long long v142 = *(_OWORD *)(v1 + 32);
  long long v214 = *(_OWORD *)(v1 + 16);
  long long v215 = v142;
  uint64_t v143 = (uint64_t)v164;
  sub_1000C2B50((uint64_t)&v214);
  sub_1000B7B04();
  *(void *)uint64_t v143 = v68;
  *(unsigned char *)(v143 + 8) = v69;
  long long v144 = v221;
  *(_OWORD *)(v143 + 112) = v220;
  *(_OWORD *)(v143 + 128) = v144;
  *(_OWORD *)(v143 + 144) = v222;
  long long v145 = v217;
  *(_OWORD *)(v143 + 48) = v216;
  *(_OWORD *)(v143 + 64) = v145;
  long long v146 = v219;
  *(_OWORD *)(v143 + 80) = v218;
  *(_OWORD *)(v143 + 96) = v146;
  long long v147 = v215;
  *(_OWORD *)(v143 + 16) = v214;
  *(_OWORD *)(v143 + 32) = v147;
  v148 = v190;
  uint64_t v149 = sub_1000E4710();
  __chkstk_darwin(v149);
  sub_1000E4F50();
  v209 = (uint64_t *)sub_1000C29AC(&qword_10012EDF8, (void (*)(uint64_t))type metadata accessor for TVWidgetExtraLarge);
  unint64_t v161 = sub_1000C2958();
  v150 = v163;
  uint64_t v151 = v177;
  sub_1000E4B50();
  (*(void (**)(char *, uint64_t))(v191 + 8))(v148, v192);
  sub_1000C2B9C(v143, type metadata accessor for TVWidgetExtraLarge);
  uint64_t v152 = v166;
  v153 = v165;
  uint64_t v154 = v176;
  (*(void (**)(char *, char *, uint64_t))(v166 + 32))(v165, v150, v176);
  (*(void (**)(char *, char *, uint64_t))(v152 + 16))(v173, v153, v154);
  swift_storeEnumTagMultiPayload();
  uint64_t v155 = sub_1000C29AC(&qword_10012EDF0, (void (*)(uint64_t))type metadata accessor for TVWidgetLarge);
  uint64_t v210 = v171;
  v211 = &type metadata for LinearGradient;
  v212 = (void *)v155;
  unint64_t v213 = v161;
  swift_getOpaqueTypeConformance2();
  uint64_t v210 = v151;
  v211 = &type metadata for LinearGradient;
  v212 = v209;
  unint64_t v213 = v161;
  swift_getOpaqueTypeConformance2();
  uint64_t v156 = (uint64_t)v175;
  sub_1000E4690();
  sub_100014754(v156, v202, &qword_10012ED58);
  swift_storeEnumTagMultiPayload();
  sub_1000C2714();
  sub_1000C29F4();
  uint64_t v157 = (uint64_t)v203;
  sub_1000E4690();
  sub_1000147B8(v156, &qword_10012ED58);
  sub_100014754(v157, v207, &qword_10012ED90);
  swift_storeEnumTagMultiPayload();
  sub_1000C2698();
  sub_1000E4690();
  sub_1000147B8(v157, &qword_10012ED90);
  return (*(uint64_t (**)(char *, uint64_t))(v152 + 8))(v153, v154);
}

unint64_t sub_1000B9CAC(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000E5640();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  long long v83 = (char *)&v68 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v68 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v73 = (char *)&v68 - v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v68 - v16;
  unint64_t v97 = (unint64_t)_swiftEmptyArrayStorage;
  if (a1)
  {
    if (a1 >> 62)
    {
LABEL_61:
      uint64_t v77 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      uint64_t v67 = sub_1000E5D70();
      swift_bridgeObjectRelease();
      BOOL v72 = v67 == 0;
      swift_bridgeObjectRetain();
      uint64_t v79 = sub_1000E5D70();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    uint64_t v77 = a1 & 0xFFFFFFFFFFFFFF8;
    uint64_t v79 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v18 = v79 == 0;
  }
  else
  {
    uint64_t v79 = 0;
    uint64_t v77 = 0;
    BOOL v18 = 1;
  }
  BOOL v72 = v18;
LABEL_6:
  uint64_t v19 = 0;
  unint64_t v76 = a1 + 32;
  unint64_t v78 = a1 & 0xC000000000000001;
  unsigned int v88 = enum case for WidgetFamily.systemMedium(_:);
  uint64_t v20 = (void (**)(char *, void, uint64_t))(v5 + 104);
  unsigned int v86 = enum case for WidgetFamily.systemLarge(_:);
  v90 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  unsigned int v85 = enum case for WidgetFamily.systemExtraLarge(_:);
  int v69 = &v101;
  uint64_t v74 = &v99;
  unsigned int v82 = enum case for WidgetFamily.systemSmall(_:);
  long long v75 = xmmword_1000F6610;
  long long v68 = xmmword_1000F6630;
  long long v70 = xmmword_1000F6620;
  long long v84 = v8;
  uint64_t v8 = (char *)(v5 + 8);
  v89 = v17;
  uint64_t v87 = (char *)(v5 + 8);
  uint64_t v93 = (void (**)(char *, void, uint64_t))(v5 + 104);
  unint64_t v81 = a1;
  long long v80 = v13;
  uint64_t v91 = a2;
  while (1)
  {
    uint64_t v92 = v19;
    if (a1 && v19 < v79)
    {
      if (v78)
      {
        uint64_t v21 = sub_1000E5CF0();
      }
      else
      {
        if ((unint64_t)v19 >= *(void *)(v77 + 16)) {
          goto LABEL_60;
        }
        uint64_t v21 = *(void *)(v76 + 8 * v19);
        swift_retain();
      }
      type metadata accessor for TVWidgetContentRefinedViewModel();
      uint64_t v22 = swift_allocObject();
      *(void *)(v22 + 32) = 0;
      *(void *)(v22 + 40) = 0;
      *(void *)(v22 + 16) = v21;
      *(unsigned char *)(v22 + 24) = 0;
      sub_1000E5AB0();
      if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1000E5AF0();
      }
      sub_1000E5B00();
      sub_1000E5AE0();
    }
    else
    {
      if (v19)
      {
        uint64_t v23 = *v20;
        (*v20)(v17, v88, v4);
        sub_1000C29AC((unint64_t *)&qword_10012AF08, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
        sub_1000E5AA0();
        sub_1000E5AA0();
        uint64_t v24 = v96;
        uint64_t v25 = v95;
        uint64_t v26 = *(void (**)(char *, uint64_t))v8;
        (*(void (**)(char *, uint64_t))v8)(v17, v4);
        if (v24 == v25)
        {
          if (v72)
          {
            uint64_t v17 = v89;
            uint64_t v8 = v87;
            if (qword_100129DD8 != -1) {
              swift_once();
            }
            uint64_t v27 = (void *)qword_100142240;
            uint64_t v100 = qword_100142240;
            type metadata accessor for TVWidgetContentViewModel();
            uint64_t v28 = v69;
            *(_OWORD *)int v69 = 0u;
            *((_OWORD *)v28 + 1) = 0u;
            swift_allocObject();
            id v29 = v27;
            uint64_t v30 = &v100;
          }
          else
          {
            uint64_t v17 = v89;
            uint64_t v8 = v87;
            if (qword_100129DD8 != -1) {
              swift_once();
            }
            uint64_t v38 = qword_100142240;
            long long v96 = v75;
            long long v95 = v68;
            uint64_t v39 = v92;
            uint64_t v94 = v92;
            id v40 = (id)qword_100142240;
            v108._countAndFlagsBits = sub_1000E5DB0();
            sub_1000E5A70(v108);
            swift_bridgeObjectRelease();
            uint64_t v94 = v39;
            v109._countAndFlagsBits = sub_1000E5DB0();
            sub_1000E5A70(v109);
            swift_bridgeObjectRelease();
            uint64_t v102 = v38;
            long long v103 = v96;
            long long v104 = v95;
            type metadata accessor for TVWidgetContentViewModel();
            swift_allocObject();
            uint64_t v30 = &v102;
          }
        }
        else
        {
          uint64_t v71 = v23;
          v23(v17, v86, v4);
          sub_1000E5AA0();
          sub_1000E5AA0();
          uint64_t v35 = v96;
          uint64_t v36 = v95;
          v26(v17, v4);
          uint64_t v37 = v73;
          (*v90)(v73, a2, v4);
          if (v35 == v36)
          {
            v26(v37, v4);
          }
          else
          {
            uint64_t v41 = v93;
            v71(v17, v85, v4);
            sub_1000E5AA0();
            sub_1000E5AA0();
            uint64_t v42 = v96;
            uint64_t v43 = v95;
            v26(v17, v4);
            v26(v37, v4);
            BOOL v65 = v42 == v43;
            uint64_t v20 = v41;
            a2 = v91;
            if (!v65) {
              goto LABEL_38;
            }
          }
          if (qword_100129DD8 != -1) {
            swift_once();
          }
          uint64_t v44 = qword_100142240;
          long long v96 = v75;
          long long v95 = v70;
          uint64_t v45 = v92;
          uint64_t v94 = v92;
          id v46 = (id)qword_100142240;
          v110._countAndFlagsBits = sub_1000E5DB0();
          sub_1000E5A70(v110);
          swift_bridgeObjectRelease();
          uint64_t v94 = v45;
          v111._countAndFlagsBits = sub_1000E5DB0();
          sub_1000E5A70(v111);
          swift_bridgeObjectRelease();
          uint64_t v105 = v44;
          long long v106 = v96;
          long long v107 = v95;
          type metadata accessor for TVWidgetContentViewModel();
          swift_allocObject();
          uint64_t v30 = &v105;
        }
        uint64_t v34 = sub_1000961B4((uint64_t)v30);
        uint64_t v20 = v93;
      }
      else
      {
        if (qword_100129DD8 != -1) {
          swift_once();
        }
        long long v31 = (void *)qword_100142240;
        uint64_t v98 = qword_100142240;
        type metadata accessor for TVWidgetContentViewModel();
        uint64_t v32 = v74;
        *(_OWORD *)uint64_t v74 = 0u;
        *((_OWORD *)v32 + 1) = 0u;
        swift_allocObject();
        id v33 = v31;
        uint64_t v34 = sub_1000961B4((uint64_t)&v98);
      }
      type metadata accessor for TVWidgetContentRefinedViewModel();
      uint64_t v47 = swift_allocObject();
      *(void *)(v47 + 32) = 0;
      *(void *)(v47 + 40) = 0;
      *(void *)(v47 + 16) = v34;
      *(unsigned char *)(v47 + 24) = 1;
      swift_retain_n();
      sub_1000E5AB0();
      if (*(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1000E5AF0();
      }
      sub_1000E5B00();
      sub_1000E5AE0();
      swift_release_n();
      a2 = v91;
    }
LABEL_38:
    int v48 = *v20;
    (*v20)(v17, v82, v4);
    sub_1000C29AC((unint64_t *)&qword_10012AF08, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
    sub_1000E5AA0();
    sub_1000E5AA0();
    uint64_t v49 = v96;
    uint64_t v50 = a2;
    uint64_t v51 = v95;
    uint64_t v52 = *(void (**)(char *, uint64_t))v8;
    (*(void (**)(char *, uint64_t))v8)(v17, v4);
    unint64_t v53 = *v90;
    (*v90)(v13, v50, v4);
    if (v49 == v51 && !v92) {
      break;
    }
    int v54 = v89;
    v48(v89, v88, v4);
    sub_1000E5AA0();
    sub_1000E5AA0();
    uint64_t v55 = v96;
    uint64_t v56 = v95;
    v52(v54, v4);
    v52(v13, v4);
    uint64_t v57 = v84;
    if (v55 == v56)
    {
      unint64_t v58 = v83;
      uint64_t v59 = v91;
      v53(v83, v91, v4);
      if (v92 == 1) {
        goto LABEL_57;
      }
    }
    else
    {
      unint64_t v58 = v83;
      v53(v83, v91, v4);
    }
    unint64_t v60 = v89;
    v48(v89, v86, v4);
    sub_1000E5AA0();
    sub_1000E5AA0();
    uint64_t v61 = v96;
    uint64_t v62 = v95;
    unint64_t v63 = v60;
    uint64_t v8 = v87;
    v52(v63, v4);
    v52(v58, v4);
    if (v61 == v62)
    {
      v53(v57, v91, v4);
      if (v92 == 2) {
        goto LABEL_58;
      }
    }
    else
    {
      v53(v57, v91, v4);
    }
    uint64_t v17 = v89;
    v48(v89, v85, v4);
    sub_1000E5AA0();
    sub_1000E5AA0();
    uint64_t v5 = v96;
    uint64_t v64 = v95;
    v52(v17, v4);
    v52(v57, v4);
    if (v5 == v64) {
      BOOL v65 = (v92 & 0xFFFFFFFFFFFFFFFELL) == 6;
    }
    else {
      BOOL v65 = v92 == 7;
    }
    a1 = v81;
    uint64_t v13 = v80;
    if (v65) {
      return v97;
    }
    uint64_t v19 = v92 + 1;
    a2 = v91;
    uint64_t v20 = v93;
    if (__OFADD__(v92, 1))
    {
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
  }
  v52(v13, v4);
  unint64_t v58 = v83;
  uint64_t v59 = v91;
  v53(v83, v91, v4);
  uint64_t v57 = v84;
LABEL_57:
  v52(v58, v4);
  v53(v57, v59, v4);
LABEL_58:
  v52(v57, v4);
  return v97;
}

uint64_t sub_1000BAAF0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = (char *)a1 + *(int *)(type metadata accessor for TVWidgetView(0) + 32);
  uint64_t v5 = *(void *)v4;
  char v6 = v4[8];
  sub_10000954C(*(void *)v4, v6);
  char v7 = sub_1000C1FD4(v5, v6);
  sub_100009A3C(v5, v6);
  if (v7)
  {
    uint64_t v8 = a1 + 4;
    uint64_t v9 = a1 + 5;
    uint64_t v10 = a1 + 6;
    uint64_t v11 = a1 + 7;
  }
  else
  {
    uint64_t v8 = a1 + 9;
    uint64_t v9 = a1 + 10;
    uint64_t v10 = a1 + 11;
    uint64_t v11 = a1 + 12;
  }
  uint64_t v12 = *v10;
  uint64_t v13 = *v9;
  uint64_t v14 = *v8;
  uint64_t v15 = *v11;
  uint64_t result = swift_bridgeObjectRetain();
  *a2 = result;
  a2[1] = v14;
  a2[2] = v13;
  a2[3] = v12;
  a2[4] = v15;
  return result;
}

uint64_t type metadata accessor for TVWidgetExtraLarge(uint64_t a1)
{
  return sub_10002B794(a1, qword_10012EE60);
}

uint64_t type metadata accessor for TVWidgetLarge(uint64_t a1)
{
  return sub_10002B794(a1, qword_10012EEF8);
}

uint64_t type metadata accessor for TVWidgetMedium(uint64_t a1)
{
  return sub_10002B794(a1, qword_10012EF90);
}

uint64_t type metadata accessor for TVWidgetSmall(uint64_t a1)
{
  return sub_10002B794(a1, qword_10012F028);
}

uint64_t sub_1000BAC4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1000E5640();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000082B4(&qword_10012F078);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v12 = sub_1000E45C0();
  *((void *)v12 + 1) = 0;
  v12[16] = 0;
  uint64_t v13 = sub_1000082B4(&qword_10012F080);
  sub_1000BAE28(a2, a1, &v12[*(int *)(v13 + 44)]);
  uint64_t v14 = *(void *)(a2 + 112);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for WidgetFamily.systemSmall(_:), v6);
  double v15 = sub_1000A3858((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v16 = *(void *)(a2 + 120);
  LOBYTE(a2) = sub_1000E4750();
  sub_100014754((uint64_t)v12, a3, &qword_10012F078);
  uint64_t v17 = a3 + *(int *)(sub_1000082B4(&qword_10012F088) + 36);
  *(unsigned char *)uint64_t v17 = a2;
  *(void *)(v17 + 8) = 0;
  *(void *)(v17 + 16) = v14;
  *(double *)(v17 + 24) = v15;
  *(void *)(v17 + 32) = v16;
  *(unsigned char *)(v17 + 40) = 0;
  return sub_1000147B8((uint64_t)v12, &qword_10012F078);
}

uint64_t sub_1000BAE28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t v6 = sub_1000082B4(&qword_10012F090);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = &v37[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v37[-v10];
  uint64_t v12 = sub_1000082B4(&qword_10012F098);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = &v37[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_1000082B4(&qword_10012F0A0);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  BOOL v18 = &v37[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = &v37[-v20];
  __chkstk_darwin(v19);
  uint64_t v23 = &v37[-v22];
  *(void *)uint64_t v14 = sub_1000E4510();
  *((void *)v14 + 1) = 0;
  v14[16] = 0;
  uint64_t v24 = sub_1000082B4(&qword_10012F0A8);
  sub_1000BB1AC((uint64_t *)a1, (uint64_t)&v14[*(int *)(v24 + 44)]);
  char v25 = *(unsigned char *)(a1 + 8) != 4;
  uint64_t v38 = a2;
  uint64_t v39 = a1;
  sub_1000B7394(v25, (void (*)(uint64_t))sub_1000C3E00, (uint64_t)v21);
  sub_1000147B8((uint64_t)v14, &qword_10012F098);
  sub_100014B08((uint64_t)v21, (uint64_t)v23, &qword_10012F0A0);
  int v26 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v27 = type metadata accessor for TVWidgetNoContentTextView();
  uint64_t v28 = v27;
  uint64_t v29 = 1;
  if (v26 != 4)
  {
    uint64_t v30 = &v11[*(int *)(v27 + 20)];
    uint64_t v31 = enum case for WidgetFamily.systemSmall(_:);
    uint64_t v32 = sub_1000E5640();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 104))(v30, v31, v32);
    sub_1000E5650();
    uint64_t v33 = sub_1000E4C70();
    *uint64_t v11 = v26;
    uint64_t v34 = &v11[*(int *)(v28 + 28)];
    *(void *)uint64_t v34 = v33;
    *((void *)v34 + 1) = 0x3FE999999999999ALL;
    v34[16] = 1;
    uint64_t v29 = 0;
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v11, v29, 1, v28);
  sub_100014754((uint64_t)v23, (uint64_t)v18, &qword_10012F0A0);
  sub_100014754((uint64_t)v11, (uint64_t)v9, &qword_10012F090);
  *a3 = 0;
  uint64_t v35 = sub_1000082B4(&qword_10012F0B0);
  sub_100014754((uint64_t)v18, (uint64_t)&a3[*(int *)(v35 + 48)], &qword_10012F0A0);
  sub_100014754((uint64_t)v9, (uint64_t)&a3[*(int *)(v35 + 64)], &qword_10012F090);
  sub_1000147B8((uint64_t)v11, &qword_10012F090);
  sub_1000147B8((uint64_t)v23, &qword_10012F0A0);
  sub_1000147B8((uint64_t)v9, &qword_10012F090);
  return sub_1000147B8((uint64_t)v18, &qword_10012F0A0);
}

uint64_t sub_1000BB1AC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v63 = sub_1000082B4(&qword_10012F0D8);
  __chkstk_darwin(v63);
  uint64_t v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E4220();
  uint64_t v54 = *(void *)(v6 - 8);
  uint64_t v55 = v6;
  __chkstk_darwin(v6);
  unint64_t v53 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_1000082B4(&qword_10012F0E0);
  __chkstk_darwin(v60);
  uint64_t v52 = (uint64_t)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000082B4(&qword_10012F0E8);
  uint64_t v56 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000E5640();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (int *)type metadata accessor for TVWidgetContentView(0);
  __chkstk_darwin(v16);
  BOOL v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000082B4(&qword_10012F0F0);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v59 = (char *)&v52 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v62 = (uint64_t)&v52 - v22;
  uint64_t v23 = sub_1000082B4(&qword_10012F0F8);
  uint64_t result = __chkstk_darwin(v23);
  uint64_t v26 = *a1;
  _ZF = (*a1 & 0xC000000000000001) == 0;
  uint64_t v64 = v9;
  BOOL v65 = v5;
  uint64_t v61 = result;
  uint64_t v58 = (uint64_t)&v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (_ZF)
  {
    if (!*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    uint64_t v51 = *(void *)(v26 + 32);
    swift_retain();
  }
  else
  {
    uint64_t v51 = sub_1000E5CF0();
  }
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for WidgetFamily.systemSmall(_:), v12);
  uint64_t v28 = *(void *)(v51 + 16);
  swift_retain();
  int v29 = sub_1000E42F0();
  int v30 = sub_1000E42E0();
  uint64_t v57 = a2;
  if (v29)
  {
    if ((v30 & ~v29) == 0) {
      goto LABEL_11;
    }
  }
  else if (!v30)
  {
    int v29 = 0;
    goto LABEL_11;
  }
  v29 |= v30;
LABEL_11:
  uint64_t v31 = sub_1000E4F80();
  *BOOL v18 = 0;
  (*(void (**)(unsigned char *, char *, uint64_t))(v13 + 32))(&v18[v16[5]], v15, v12);
  *(void *)&v18[v16[6]] = v28;
  uint64_t v32 = &v18[v16[7]];
  __asm { FMOV            V1.2D, #16.0 }
  *(_OWORD *)uint64_t v32 = xmmword_1000F7F90;
  *((_OWORD *)v32 + 1) = _Q1;
  v32[32] = 1;
  *((_DWORD *)v32 + 9) = v29;
  *((void *)v32 + 5) = v31;
  *((_OWORD *)v32 + 3) = xmmword_1000F7FA0;
  v32[64] = 0;
  *((void *)v32 + 11) = 0;
  *((void *)v32 + 9) = 0;
  *(_DWORD *)(v32 + 79) = 0;
  if (*(unsigned char *)(v51 + 24))
  {
    uint64_t v37 = v52;
    sub_1000C3D54((uint64_t)v18, v52, type metadata accessor for TVWidgetContentView);
    uint64_t v38 = v60;
    *(void *)(v37 + *(int *)(v60 + 36)) = 0x3FF0000000000000;
    uint64_t v39 = v53;
    sub_1000E4210();
    unint64_t v40 = sub_1000C3E08();
    sub_1000E4BA0();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v39, v55);
    sub_1000147B8(v37, &qword_10012F0E0);
    uint64_t v41 = v56;
    uint64_t v42 = v64;
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v65, v11, v64);
    swift_storeEnumTagMultiPayload();
    uint64_t v66 = v38;
    unint64_t v67 = v40;
    swift_getOpaqueTypeConformance2();
    sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    uint64_t v43 = (uint64_t)v59;
    sub_1000E4690();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v42);
  }
  else
  {
    sub_1000C3D54((uint64_t)v18, (uint64_t)v65, type metadata accessor for TVWidgetContentView);
    swift_storeEnumTagMultiPayload();
    unint64_t v44 = sub_1000C3E08();
    uint64_t v66 = v60;
    unint64_t v67 = v44;
    swift_getOpaqueTypeConformance2();
    sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    uint64_t v43 = (uint64_t)v59;
    sub_1000E4690();
  }
  uint64_t v45 = v62;
  sub_100014B08(v43, v62, &qword_10012F0F0);
  sub_1000C2B9C((uint64_t)v18, type metadata accessor for TVWidgetContentView);
  unint64_t v46 = sub_100095D5C();
  unint64_t v48 = v47;
  swift_release();
  uint64_t v49 = v58;
  sub_100014754(v45, v58, &qword_10012F0F0);
  uint64_t v50 = (unint64_t *)(v49 + *(int *)(v61 + 52));
  *uint64_t v50 = v46;
  v50[1] = v48;
  sub_1000147B8(v45, &qword_10012F0F0);
  return sub_100014B08(v49, v57, &qword_10012F0F8);
}

double sub_1000BB8E0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000E40F0();
  sub_1000E4F50();
  sub_1000E40A0();
  sub_100014754(a1, a2, &qword_10012F098);
  uint64_t v4 = (_OWORD *)(a2 + *(int *)(sub_1000082B4(&qword_10012F0C0) + 36));
  *uint64_t v4 = v6;
  v4[1] = v7;
  double result = *(double *)&v8;
  v4[2] = v8;
  return result;
}

uint64_t sub_1000BB994@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_1000C3D54(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TVWidgetSmall);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_1000C4004((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for TVWidgetSmall);
  *a2 = sub_1000C3DD4;
  a2[1] = (uint64_t (*)(uint64_t))v7;
  return result;
}

uint64_t sub_1000BBAA8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1000E5640();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000082B4(&qword_10012F120);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v12 = sub_1000E45C0();
  *((void *)v12 + 1) = 0;
  v12[16] = 0;
  uint64_t v13 = sub_1000082B4(&qword_10012F128);
  sub_1000BBC84(a2, a1, &v12[*(int *)(v13 + 44)]);
  uint64_t v14 = a2[14];
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for WidgetFamily.systemMedium(_:), v6);
  double v15 = sub_1000A3858((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v16 = a2[15];
  LOBYTE(a2) = sub_1000E4750();
  sub_100014754((uint64_t)v12, a3, &qword_10012F120);
  uint64_t v17 = a3 + *(int *)(sub_1000082B4(&qword_10012F130) + 36);
  *(unsigned char *)uint64_t v17 = (_BYTE)a2;
  *(void *)(v17 + 8) = 0;
  *(void *)(v17 + 16) = v14;
  *(double *)(v17 + 24) = v15;
  *(void *)(v17 + 32) = v16;
  *(unsigned char *)(v17 + 40) = 0;
  return sub_1000147B8((uint64_t)v12, &qword_10012F120);
}

uint64_t sub_1000BBC84@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v38 = a3;
  uint64_t v4 = sub_1000082B4(&qword_10012F090);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v39 = (uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v36 - v7;
  uint64_t v9 = sub_1000082B4(&qword_10012F138);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000082B4(&qword_10012F140);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v37 = (uint64_t)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v36 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v36 - v18;
  uint64_t v20 = a1[16];
  *(void *)uint64_t v11 = sub_1000E4510();
  *((void *)v11 + 1) = v20;
  v11[16] = 0;
  sub_1000082B4(&qword_10012F148);
  uint64_t v42 = *a1;
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_1000082B4(&qword_10012F150);
  sub_1000082B4(&qword_10012F158);
  sub_100014AC4(&qword_10012F160, &qword_10012F150);
  sub_1000C4108();
  sub_1000E4EB0();
  char v21 = *((unsigned char *)a1 + 8) != 4;
  uint64_t v40 = v36;
  uint64_t v41 = a1;
  sub_1000B7638(v21, (void (*)(uint64_t))sub_1000C41E8, (uint64_t)v17);
  sub_1000147B8((uint64_t)v11, &qword_10012F138);
  sub_100014B08((uint64_t)v17, (uint64_t)v19, &qword_10012F140);
  int v22 = *((unsigned __int8 *)a1 + 8);
  uint64_t v23 = type metadata accessor for TVWidgetNoContentTextView();
  uint64_t v24 = v23;
  uint64_t v25 = 1;
  if (v22 != 4)
  {
    uint64_t v26 = &v8[*(int *)(v23 + 20)];
    uint64_t v27 = enum case for WidgetFamily.systemMedium(_:);
    uint64_t v28 = sub_1000E5640();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 104))(v26, v27, v28);
    sub_1000E5650();
    uint64_t v29 = sub_1000E4C70();
    *uint64_t v8 = v22;
    int v30 = &v8[*(int *)(v24 + 28)];
    *(void *)int v30 = v29;
    *((void *)v30 + 1) = 0x3FE999999999999ALL;
    v30[16] = 1;
    uint64_t v25 = 0;
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v8, v25, 1, v24);
  uint64_t v31 = v37;
  sub_100014754((uint64_t)v19, v37, &qword_10012F140);
  uint64_t v32 = v39;
  sub_100014754((uint64_t)v8, v39, &qword_10012F090);
  uint64_t v33 = v38;
  *uint64_t v38 = 0;
  uint64_t v34 = sub_1000082B4(&qword_10012F170);
  sub_100014754(v31, (uint64_t)&v33[*(int *)(v34 + 48)], &qword_10012F140);
  sub_100014754(v32, (uint64_t)&v33[*(int *)(v34 + 64)], &qword_10012F090);
  sub_1000147B8((uint64_t)v8, &qword_10012F090);
  sub_1000147B8((uint64_t)v19, &qword_10012F140);
  sub_1000147B8(v32, &qword_10012F090);
  return sub_1000147B8(v31, &qword_10012F140);
}

unint64_t sub_1000BC0D0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100095D5C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000BC0FC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v2;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000BC140@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v44 = sub_1000082B4(&qword_10012F198);
  __chkstk_darwin(v44);
  uint64_t v46 = (uint64_t)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000E4220();
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  __chkstk_darwin(v4);
  uint64_t v38 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_1000082B4(&qword_10012F1A0);
  uint64_t v42 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v41 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000E5640();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (int *)type metadata accessor for TVWidgetContentView(0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000082B4(&qword_10012F158);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v43 = (uint64_t)&v38 - v18;
  uint64_t v19 = *a1;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for WidgetFamily.systemMedium(_:), v7);
  uint64_t v20 = *(void *)(v19 + 16);
  swift_retain();
  int v21 = sub_1000E42F0();
  int v22 = sub_1000E42E0();
  if (!v21)
  {
    if (!v22)
    {
      int v21 = 0;
      goto LABEL_7;
    }
LABEL_5:
    v21 |= v22;
    goto LABEL_7;
  }
  if ((v22 & ~v21) != 0) {
    goto LABEL_5;
  }
LABEL_7:
  uint64_t v23 = sub_1000E4F80();
  *uint64_t v13 = 0;
  (*(void (**)(unsigned char *, char *, uint64_t))(v8 + 32))(&v13[v11[5]], v10, v7);
  *(void *)&v13[v11[6]] = v20;
  uint64_t v24 = &v13[v11[7]];
  __asm { FMOV            V1.2D, #16.0 }
  *(_OWORD *)uint64_t v24 = xmmword_1000F7F90;
  *((_OWORD *)v24 + 1) = _Q1;
  v24[32] = 0;
  *((_DWORD *)v24 + 9) = v21;
  *((void *)v24 + 5) = v23;
  *((_OWORD *)v24 + 3) = xmmword_1000F7FA0;
  v24[64] = 0;
  *((void *)v24 + 11) = 0;
  *((void *)v24 + 9) = 0;
  *(_DWORD *)(v24 + 79) = 0;
  if (*(unsigned char *)(v19 + 24))
  {
    int v30 = v38;
    sub_1000E4210();
    uint64_t v31 = sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    uint64_t v32 = v41;
    sub_1000E4BA0();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v30, v40);
    uint64_t v33 = v42;
    uint64_t v34 = v45;
    (*(void (**)(uint64_t, char *, uint64_t))(v42 + 16))(v46, v32, v45);
    swift_storeEnumTagMultiPayload();
    unint64_t v48 = v11;
    uint64_t v49 = v31;
    swift_getOpaqueTypeConformance2();
    sub_1000E4690();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v34);
  }
  else
  {
    sub_1000C3D54((uint64_t)v13, v46, type metadata accessor for TVWidgetContentView);
    swift_storeEnumTagMultiPayload();
    uint64_t v35 = sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    unint64_t v48 = v11;
    uint64_t v49 = v35;
    swift_getOpaqueTypeConformance2();
    sub_1000E4690();
  }
  uint64_t v36 = v43;
  sub_100014B08((uint64_t)v17, v43, &qword_10012F158);
  sub_1000C2B9C((uint64_t)v13, type metadata accessor for TVWidgetContentView);
  return sub_100014B08(v36, v47, &qword_10012F158);
}

double sub_1000BC6E8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000E40F0();
  sub_1000E4F50();
  sub_1000E40A0();
  sub_100014754(a1, a2, &qword_10012F138);
  uint64_t v4 = (_OWORD *)(a2 + *(int *)(sub_1000082B4(&qword_10012F180) + 36));
  *uint64_t v4 = v6;
  v4[1] = v7;
  double result = *(double *)&v8;
  v4[2] = v8;
  return result;
}

uint64_t sub_1000BC7AC@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_1000C3D54(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TVWidgetMedium);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_1000C4004((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for TVWidgetMedium);
  *a2 = sub_1000C406C;
  a2[1] = (uint64_t (*)(uint64_t))v7;
  return result;
}

uint64_t sub_1000BC8C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000082B4(&qword_10012F1A8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v35 - v8;
  *a1 = sub_1000E4F30();
  a1[1] = v10;
  *(void *)uint64_t v9 = sub_1000E45C0();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  uint64_t v11 = sub_1000082B4(&qword_10012F1B0);
  sub_1000BCAE4(v2, (uint64_t (*)(uint64_t))&v9[*(int *)(v11 + 44)]);
  unsigned __int8 v12 = sub_1000E4780();
  char v13 = sub_1000E4790();
  sub_1000E4790();
  if (sub_1000E4790() != v12) {
    char v13 = sub_1000E4790();
  }
  sub_1000E3FB0();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  unsigned __int8 v22 = sub_1000E47A0();
  char v23 = sub_1000E4790();
  sub_1000E4790();
  if (sub_1000E4790() != v22) {
    char v23 = sub_1000E4790();
  }
  uint64_t v24 = (uint64_t)a1 + *(int *)(sub_1000082B4(&qword_10012F1B8) + 44);
  sub_1000E3FB0();
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  sub_100014754((uint64_t)v9, (uint64_t)v7, &qword_10012F1A8);
  sub_100014754((uint64_t)v7, v24, &qword_10012F1A8);
  uint64_t v33 = v24 + *(int *)(sub_1000082B4(&qword_10012F1C0) + 48);
  *(unsigned char *)uint64_t v33 = 0;
  *(unsigned char *)(v33 + 8) = v13;
  *(void *)(v33 + 16) = v15;
  *(void *)(v33 + 24) = v17;
  *(void *)(v33 + 32) = v19;
  *(void *)(v33 + 40) = v21;
  *(unsigned char *)(v33 + 48) = 0;
  *(unsigned char *)(v33 + 56) = v23;
  *(void *)(v33 + 64) = v26;
  *(void *)(v33 + 72) = v28;
  *(void *)(v33 + 80) = v30;
  *(void *)(v33 + 88) = v32;
  *(unsigned char *)(v33 + 96) = 0;
  sub_1000147B8((uint64_t)v9, &qword_10012F1A8);
  return sub_1000147B8((uint64_t)v7, &qword_10012F1A8);
}

uint64_t sub_1000BCAE4@<X0>(void *a1@<X0>, uint64_t (*a2)(uint64_t a1)@<X8>)
{
  uint64_t v4 = type metadata accessor for TVWidgetLarge(0);
  uint64_t v134 = *(void *)(v4 - 8);
  __chkstk_darwin(v4 - 8);
  uint64_t v135 = v5;
  uint64_t v136 = (uint64_t)&v115 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = sub_1000082B4(&qword_10012F1C8);
  __chkstk_darwin(v129);
  uint64_t v132 = (uint64_t)&v115 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000E4220();
  uint64_t v118 = *(void *)(v7 - 8);
  uint64_t v119 = v7;
  __chkstk_darwin(v7);
  uint64_t v117 = (char *)&v115 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000082B4(&qword_10012F1D0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v115 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_1000082B4(&qword_10012F1D8);
  uint64_t v116 = *(void *)(v130 - 8);
  __chkstk_darwin(v130);
  char v13 = (char *)&v115 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000E5640();
  uint64_t v140 = *(void *)(v14 - 8);
  uint64_t v15 = __chkstk_darwin(v14);
  v133 = (char *)&v115 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v115 - v17;
  uint64_t v19 = (int *)type metadata accessor for TVWidgetContentView(0);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v115 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1000082B4(&qword_10012F1E0);
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  long long v124 = (char *)&v115 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v128 = (uint64_t)&v115 - v25;
  uint64_t v26 = sub_1000082B4(&qword_10012F1E8);
  __chkstk_darwin(v26 - 8);
  uint64_t v126 = (uint64_t)&v115 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_1000082B4(&qword_10012F1F0);
  uint64_t v29 = __chkstk_darwin(v28);
  uint64_t v30 = __chkstk_darwin(v29);
  uint64_t result = __chkstk_darwin(v30);
  uint64_t v141 = (uint64_t)&v115 - v32;
  v131 = a1;
  uint64_t v33 = *a1;
  _ZF = (*a1 & 0xC000000000000001) == 0;
  uint64_t v139 = v35;
  uint64_t v127 = result;
  uint64_t v125 = v36;
  if (_ZF)
  {
    if (!*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    uint64_t v114 = *(void *)(v33 + 32);
    swift_retain();
  }
  else
  {
    uint64_t v114 = sub_1000E5CF0();
  }
  uint64_t v37 = *(void (**)(void))(v140 + 104);
  unsigned int v121 = enum case for WidgetFamily.systemLarge(_:);
  uint64_t v138 = v14;
  uint64_t v122 = v140 + 104;
  long long v120 = (void (*)(char *, void, uint64_t))v37;
  v37(v18);
  uint64_t v137 = v114;
  uint64_t v38 = *(void *)(v114 + 16);
  swift_retain();
  int v39 = sub_1000E42F0();
  int v40 = sub_1000E42E0();
  uint64_t v123 = a2;
  if (v39)
  {
    if ((v40 & ~v39) == 0) {
      goto LABEL_11;
    }
  }
  else if (!v40)
  {
    int v39 = 0;
    goto LABEL_11;
  }
  v39 |= v40;
LABEL_11:
  uint64_t v41 = sub_1000E4F80();
  *uint64_t v21 = 2;
  (*(void (**)(unsigned char *, char *, uint64_t))(v140 + 32))(&v21[v19[5]], v18, v138);
  *(void *)&v21[v19[6]] = v38;
  uint64_t v42 = &v21[v19[7]];
  __asm { FMOV            V1.2D, #16.0 }
  *(_OWORD *)uint64_t v42 = xmmword_1000F7F90;
  *((_OWORD *)v42 + 1) = _Q1;
  v42[32] = 0;
  *((_DWORD *)v42 + 9) = v39;
  *((void *)v42 + 5) = v41;
  *((_OWORD *)v42 + 3) = xmmword_1000F7FA0;
  v42[64] = 0;
  *((void *)v42 + 9) = 0;
  *((_WORD *)v42 + 40) = 257;
  v42[82] = 0;
  *((void *)v42 + 11) = 0;
  if (*(unsigned char *)(v137 + 24))
  {
    uint64_t v47 = sub_1000E4DD0();
    sub_1000C3D54((uint64_t)v21, (uint64_t)v11, type metadata accessor for TVWidgetContentView);
    unint64_t v48 = (uint64_t *)&v11[*(int *)(v9 + 36)];
    *unint64_t v48 = v47;
    v48[1] = (uint64_t)sub_1000C5328;
    v48[2] = 0;
    uint64_t v49 = v117;
    sub_1000E4210();
    unint64_t v50 = sub_1000C41F0();
    sub_1000E4BA0();
    (*(void (**)(char *, uint64_t))(v118 + 8))(v49, v119);
    sub_1000147B8((uint64_t)v11, &qword_10012F1D0);
    uint64_t v51 = v116;
    uint64_t v52 = v130;
    (*(void (**)(uint64_t, char *, uint64_t))(v116 + 16))(v132, v13, v130);
    swift_storeEnumTagMultiPayload();
    unint64_t v158 = (uint64_t (*)(uint64_t))v9;
    unint64_t v159 = v50;
    swift_getOpaqueTypeConformance2();
    sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    uint64_t v53 = (uint64_t)v124;
    sub_1000E4690();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v13, v52);
  }
  else
  {
    sub_1000C3D54((uint64_t)v21, v132, type metadata accessor for TVWidgetContentView);
    swift_storeEnumTagMultiPayload();
    unint64_t v54 = sub_1000C41F0();
    unint64_t v158 = (uint64_t (*)(uint64_t))v9;
    unint64_t v159 = v54;
    swift_getOpaqueTypeConformance2();
    sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    uint64_t v53 = (uint64_t)v124;
    sub_1000E4690();
  }
  uint64_t v55 = v128;
  sub_100014B08(v53, v128, &qword_10012F1E0);
  sub_1000C2B9C((uint64_t)v21, type metadata accessor for TVWidgetContentView);
  uint64_t v56 = (uint64_t)v131;
  char v57 = __chkstk_darwin(*((unsigned __int8 *)v131 + 8) != 4);
  *(&v115 - 2) = v56;
  uint64_t v58 = v126;
  sub_1000B78DC(v57, (void (*)(uint64_t))sub_1000C42C0, v126);
  sub_1000147B8(v55, &qword_10012F1E0);
  uint64_t v59 = v125;
  sub_100014754(v58, v125, &qword_10012F1E8);
  *(void *)(v59 + *(int *)(v127 + 36)) = 0x3FF0000000000000;
  sub_1000147B8(v58, &qword_10012F1E8);
  sub_100014B08(v59, v141, &qword_10012F1F0);
  uint64_t v60 = v136;
  sub_1000C3D54(v56, v136, type metadata accessor for TVWidgetLarge);
  unint64_t v61 = (*(unsigned __int8 *)(v134 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v134 + 80);
  uint64_t v130 = swift_allocObject();
  sub_1000C4004(v60, v130 + v61, type metadata accessor for TVWidgetLarge);
  LOBYTE(v59) = sub_1000E4760();
  int v62 = sub_1000E4790();
  sub_1000E4790();
  if (sub_1000E4790() != v59) {
    int v62 = sub_1000E4790();
  }
  sub_1000E3FB0();
  uint64_t v135 = v64;
  uint64_t v136 = v63;
  uint64_t v134 = v65;
  uint64_t v128 = v66;
  unsigned __int8 v67 = sub_1000E4780();
  int v68 = sub_1000E4790();
  sub_1000E4790();
  if (sub_1000E4790() != v67) {
    int v68 = sub_1000E4790();
  }
  LODWORD(v127) = v68;
  LODWORD(v129) = v62;
  sub_1000E3FB0();
  uint64_t v125 = v70;
  uint64_t v126 = v69;
  long long v124 = v71;
  uint64_t v119 = v72;
  unsigned __int8 v73 = sub_1000E4770();
  int v74 = sub_1000E4790();
  sub_1000E4790();
  if (sub_1000E4790() != v73) {
    int v74 = sub_1000E4790();
  }
  LODWORD(v118) = v74;
  uint64_t v75 = (uint64_t)v133;
  uint64_t v76 = v138;
  v120(v133, v121, v138);
  sub_1000A3858(v75);
  (*(void (**)(uint64_t, uint64_t))(v140 + 8))(v75, v76);
  sub_1000E3FB0();
  uint64_t v140 = v77;
  uint64_t v138 = v78;
  uint64_t v132 = v80;
  v133 = v79;
  unsigned __int8 v81 = sub_1000E47A0();
  int v82 = sub_1000E4790();
  sub_1000E4790();
  if (sub_1000E4790() != v81) {
    int v82 = sub_1000E4790();
  }
  LODWORD(v117) = v82;
  unsigned __int8 v144 = 0;
  char v143 = 0;
  unsigned __int8 v142 = 0;
  sub_1000E3FB0();
  uint64_t v84 = v83;
  uint64_t v122 = v83;
  uint64_t v86 = v85;
  long long v120 = v87;
  uint64_t v89 = v88;
  unsigned __int8 v90 = v144;
  LODWORD(v131) = v144;
  char v91 = v143;
  unsigned __int8 v92 = v142;
  unsigned int v121 = v142;
  char v145 = 0;
  uint64_t v93 = v139;
  sub_100014754(v141, v139, &qword_10012F1F0);
  char v94 = v145;
  long long v95 = v123;
  sub_100014754(v93, (uint64_t)v123, &qword_10012F1F0);
  long long v96 = (_OWORD *)((char *)v95 + *(int *)(sub_1000082B4(&qword_10012F210) + 48));
  uint64_t v123 = sub_1000C42E0;
  uint64_t v97 = v130;
  *(void *)&long long v146 = sub_1000C42E0;
  *((void *)&v146 + 1) = v130;
  char v98 = v129;
  LOBYTE(v147) = v129;
  *((void *)&v147 + 1) = v136;
  *(void *)&long long v148 = v135;
  uint64_t v99 = v128;
  *((void *)&v148 + 1) = v134;
  *(void *)&long long v149 = v128;
  BYTE8(v149) = v90;
  char v100 = v127;
  LOBYTE(v150) = v127;
  uint64_t v102 = v125;
  uint64_t v101 = v126;
  *((void *)&v150 + 1) = v126;
  *(void *)&long long v151 = v125;
  long long v103 = v124;
  uint64_t v104 = v119;
  *((void *)&v151 + 1) = v124;
  *(void *)&long long v152 = v119;
  BYTE8(v152) = v91;
  char v105 = v91;
  LOBYTE(v93) = v118;
  LOBYTE(v153) = v118;
  *((void *)&v153 + 1) = v140;
  *(void *)&long long v154 = v138;
  *((void *)&v154 + 1) = v133;
  *(void *)&long long v155 = v132;
  BYTE8(v155) = v92;
  char v106 = (char)v117;
  LOBYTE(v156) = (_BYTE)v117;
  *((void *)&v156 + 1) = v84;
  *(void *)&v157[0] = v86;
  long long v107 = (void (*)(void, void, void))v120;
  *((void *)&v157[0] + 1) = v120;
  *(void *)&v157[1] = v89;
  BYTE8(v157[1]) = v94;
  sub_1000C4990((uint64_t)&v146);
  swift_release();
  long long v108 = v157[0];
  v96[10] = v156;
  v96[11] = v108;
  *(_OWORD *)((char *)v96 + 185) = *(_OWORD *)((char *)v157 + 9);
  long long v109 = v153;
  v96[6] = v152;
  v96[7] = v109;
  long long v110 = v155;
  v96[8] = v154;
  v96[9] = v110;
  long long v111 = v149;
  v96[2] = v148;
  v96[3] = v111;
  long long v112 = v151;
  v96[4] = v150;
  v96[5] = v112;
  long long v113 = v147;
  _OWORD *v96 = v146;
  v96[1] = v113;
  sub_1000147B8(v141, &qword_10012F1F0);
  unint64_t v158 = v123;
  unint64_t v159 = v97;
  char v160 = v98;
  uint64_t v161 = v136;
  uint64_t v162 = v135;
  uint64_t v163 = v134;
  uint64_t v164 = v99;
  char v165 = (char)v131;
  char v166 = v100;
  uint64_t v167 = v101;
  uint64_t v168 = v102;
  v169 = v103;
  uint64_t v170 = v104;
  char v171 = v105;
  char v172 = v93;
  uint64_t v173 = v140;
  uint64_t v174 = v138;
  v175 = v133;
  uint64_t v176 = v132;
  char v177 = v121;
  char v178 = v106;
  uint64_t v179 = v122;
  uint64_t v180 = v86;
  uint64_t v181 = v107;
  uint64_t v182 = v89;
  char v183 = v94;
  sub_10005F618((uint64_t)&v158);
  return sub_1000147B8(v139, &qword_10012F1F0);
}

uint64_t sub_1000BD854@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for TVWidgetLarge(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  sub_1000C3D54(a2, (uint64_t)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TVWidgetLarge);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  sub_1000C4004((uint64_t)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9, type metadata accessor for TVWidgetLarge);
  uint64_t v11 = sub_1000E4F50();
  char v13 = v12;
  sub_100014754(a1, a3, &qword_10012F1E0);
  uint64_t result = sub_1000082B4(&qword_10012F280);
  uint64_t v15 = (uint64_t (**)@<X0>(uint64_t *@<X0>, uint64_t (**)@<X0>(uint64_t@<X8>)@<X8>))(a3 + *(int *)(result + 36));
  *uint64_t v15 = sub_1000C466C;
  v15[1] = (uint64_t (*)@<X0>(uint64_t *@<X0>, uint64_t (**)@<X0>(uint64_t@<X8>)@<X8>))v10;
  v15[2] = (uint64_t (*)@<X0>(uint64_t *@<X0>, uint64_t (**)@<X0>(uint64_t@<X8>)@<X8>))v11;
  v15[3] = v13;
  return result;
}

uint64_t sub_1000BD9B0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v6 = type metadata accessor for TVWidgetLarge(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = *a1;
  sub_1000C3D54(a2, (uint64_t)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TVWidgetLarge);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  sub_1000C4004((uint64_t)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10, type metadata accessor for TVWidgetLarge);
  *a3 = sub_1000C4800;
  a3[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v11;
  return swift_retain();
}

uint64_t sub_1000BDAE4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1000082B4(&qword_10012F2A8);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = (char *)v13 - v8;
  if (a1)
  {
    v13[1] = a1;
    sub_1000BDC20(a2, (uint64_t)v13 - v8);
    uint64_t v10 = sub_1000082B4(&qword_10012F2B0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_1000082B4(&qword_10012F2B0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  return sub_100014B08((uint64_t)v9, a3, &qword_10012F2A8);
}

uint64_t sub_1000BDC20@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = (int *)type metadata accessor for TVWidgetNoContentTextView();
  uint64_t result = __chkstk_darwin(v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v8 = *(unsigned __int8 *)(a1 + 8);
  if (v8 == 4)
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = &v7[v4[5]];
    uint64_t v10 = enum case for WidgetFamily.systemLarge(_:);
    uint64_t v11 = sub_1000E5640();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v9, v10, v11);
    uint64_t v12 = a1 + *(int *)(type metadata accessor for TVWidgetLarge(0) + 28);
    uint64_t v13 = &v7[v4[6]];
    uint64_t v14 = sub_1000E5690();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v13, v12, v14);
    uint64_t v15 = sub_1000E4C70();
    *uint64_t v7 = v8;
    uint64_t v16 = &v7[v4[7]];
    *(void *)uint64_t v16 = v15;
    *((void *)v16 + 1) = 0x3FE999999999999ALL;
    v16[16] = 1;
    type metadata accessor for CGRect(0);
    sub_1000E4110();
    CGRectGetWidth(v19[1]);
    sub_1000E4110();
    CGRectGetHeight(v19[0]);
    sub_1000E4F50();
    sub_1000E40A0();
    sub_1000C3D54((uint64_t)v7, a2, (uint64_t (*)(void))type metadata accessor for TVWidgetNoContentTextView);
    uint64_t v17 = (_OWORD *)(a2 + *(int *)(sub_1000082B4(&qword_10012F2B0) + 36));
    long long v18 = v21;
    *uint64_t v17 = v20;
    v17[1] = v18;
    void v17[2] = v22;
    return sub_1000C2B9C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for TVWidgetNoContentTextView);
  }
  return result;
}

uint64_t sub_1000BDE78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1000082B4(&qword_10012F218);
  __chkstk_darwin(v6 - 8);
  int v8 = (double *)((char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_1000E45D0();
  double v10 = *(double *)(a2 + 136) * 0.5;
  *(void *)int v8 = v9;
  v8[1] = v10;
  *((unsigned char *)v8 + 16) = 0;
  uint64_t v11 = sub_1000082B4(&qword_10012F220);
  sub_1000BDF6C((void *)a2, a1, (uint64_t)v8 + *(int *)(v11 + 44));
  sub_100014754((uint64_t)v8, a3, &qword_10012F218);
  *(void *)(a3 + *(int *)(sub_1000082B4(&qword_10012F228) + 36)) = 0;
  return sub_1000147B8((uint64_t)v8, &qword_10012F218);
}

uint64_t sub_1000BDF6C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v5 = sub_1000E4100();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  int v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TVWidgetLarge(0);
  uint64_t v10 = *(void *)(*(void *)(v9 - 8) + 64);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = v12;
  uint64_t v41 = a1;
  unint64_t v13 = *a1;
  unint64_t v14 = v13 >> 62;
  if (!(v13 >> 62))
  {
    uint64_t v15 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v15)
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    swift_bridgeObjectRetain();
    if (v15 >= 3) {
      goto LABEL_4;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000E5D70();
  if (result >= 1)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_1000E5D70();
    swift_bridgeObjectRelease();
    if (v35 >= 3)
    {
LABEL_4:
      uint64_t v39 = v5;
      if ((v13 & 0xC000000000000001) != 0)
      {
        type metadata accessor for TVWidgetContentRefinedViewModel();
        sub_1000E5CE0(1);
        sub_1000E5CE0(2);
      }
      uint64_t v38 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v14)
      {
        swift_bridgeObjectRetain();
        int v8 = (char *)sub_1000E5D80();
        uint64_t v16 = v17;
        a3 = v18;
        unint64_t v14 = v19;
        swift_bridgeObjectRelease_n();
        if ((v14 & 1) == 0)
        {
LABEL_9:
          sub_100017940((uint64_t)v8, v16, a3, v14);
          goto LABEL_15;
        }
      }
      else
      {
        int v8 = (char *)(v13 & 0xFFFFFFFFFFFFFF8);
        uint64_t v16 = (v13 & 0xFFFFFFFFFFFFFF8) + 32;
        a3 = 1;
        unint64_t v14 = 7;
      }
      uint64_t v37 = v16;
      sub_1000E5DD0();
      swift_unknownObjectRetain_n();
      long long v21 = (void *)swift_dynamicCastClass();
      if (!v21)
      {
        swift_unknownObjectRelease();
        long long v21 = _swiftEmptyArrayStorage;
      }
      uint64_t v22 = v21[2];
      swift_release();
      if (!__OFSUB__(v14 >> 1, a3))
      {
        if (v22 == (v14 >> 1) - a3)
        {
          uint64_t v20 = swift_dynamicCastClass();
          if (!v20)
          {
            swift_unknownObjectRelease();
            uint64_t v23 = _swiftEmptyArrayStorage;
            goto LABEL_17;
          }
LABEL_15:
          uint64_t v23 = (void *)v20;
LABEL_17:
          uint64_t v25 = (uint64_t)v41;
          uint64_t v24 = v42;
          swift_unknownObjectRelease();
          uint64_t v26 = sub_1000C30B4((unint64_t)v23);
          swift_release();
          uint64_t v43 = v26;
          swift_getKeyPath();
          sub_1000C3D54(v25, (uint64_t)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TVWidgetLarge);
          uint64_t v27 = v38;
          uint64_t v28 = v24;
          uint64_t v29 = v39;
          (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v38, v28, v39);
          unint64_t v30 = (*(unsigned __int8 *)(v40 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
          unint64_t v31 = (v10 + *(unsigned __int8 *)(v6 + 80) + v30) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
          uint64_t v32 = swift_allocObject();
          sub_1000C4004((uint64_t)v11, v32 + v30, type metadata accessor for TVWidgetLarge);
          (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v32 + v31, v27, v29);
          uint64_t v33 = swift_allocObject();
          *(void *)(v33 + 16) = sub_1000C4324;
          *(void *)(v33 + 24) = v32;
          sub_1000082B4(&qword_10012F230);
          sub_1000082B4(&qword_10012F238);
          sub_100014AC4(&qword_10012F240, &qword_10012F230);
          sub_1000C43B8();
          return sub_1000E4EB0();
        }
        goto LABEL_23;
      }
LABEL_22:
      __break(1u);
LABEL_23:
      swift_unknownObjectRelease();
      uint64_t v16 = v37;
      goto LABEL_9;
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000BE418@<X0>(char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  long long v96 = a1;
  uint64_t v83 = a5;
  uint64_t v92 = sub_1000082B4(&qword_10012F198);
  __chkstk_darwin(v92);
  uint64_t v94 = (uint64_t)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_1000E4220();
  uint64_t v76 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  uint64_t v75 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_1000082B4(&qword_10012F1A0);
  uint64_t v79 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  uint64_t v78 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000E5640();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = (int *)type metadata accessor for TVWidgetContentView(0);
  __chkstk_darwin(v14);
  uint64_t v16 = (uint64_t)&v73 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000082B4(&qword_10012F158);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v89 = (char *)&v73 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  long long v21 = (char *)&v73 - v20;
  uint64_t v90 = sub_1000082B4(&qword_10012F258);
  __chkstk_darwin(v90);
  uint64_t v23 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_1000082B4(&qword_10012F238);
  __chkstk_darwin(v80);
  unsigned __int8 v81 = (char *)&v73 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = v13;
  uint64_t v87 = v11;
  uint64_t v25 = *(void (**)(char *, void, uint64_t))(v11 + 104);
  uint64_t v88 = v10;
  v25(v13, enum case for WidgetFamily.systemLarge(_:), v10);
  uint64_t v95 = a2;
  uint64_t v26 = *(void *)(a2 + 16);
  swift_retain();
  LODWORD(a2) = sub_1000E42F0();
  int v28 = sub_1000E42E0();
  uint64_t v82 = a4;
  char v91 = v21;
  if (!a2)
  {
    if (!v28)
    {
      LODWORD(a2) = 0;
      goto LABEL_7;
    }
LABEL_5:
    LODWORD(a2) = v28 | a2;
    goto LABEL_7;
  }
  if ((v28 & ~a2) != 0) {
    goto LABEL_5;
  }
LABEL_7:
  uint64_t v29 = sub_1000E4F80();
  uint64_t v30 = *a3;
  uint64_t v31 = *a3 >> 62;
  if (v31)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1000E5D70();
    if (result < 1)
    {
      __break(1u);
LABEL_56:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    int64_t v32 = sub_1000E5D70();
    swift_bridgeObjectRelease();
    if (v32 >= 3) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
  int64_t v32 = *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v32)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  swift_bridgeObjectRetain();
  if (v32 < 3)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
LABEL_10:
  uint64_t v97 = v23;
  if ((v30 & 0xC000000000000001) != 0)
  {
    type metadata accessor for TVWidgetContentRefinedViewModel();
    sub_1000E5CE0(1);
    sub_1000E5CE0(2);
  }
  uint64_t v84 = v29;
  uint64_t v85 = v26;
  uint64_t v23 = v96;
  if (v31)
  {
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_1000E5D80();
    uint64_t v33 = v34;
    uint64_t v29 = v35;
    int64_t v32 = v36;
    swift_bridgeObjectRelease_n();
    if ((v32 & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v31 = v30 & 0xFFFFFFFFFFFFFF8;
    uint64_t v33 = (v30 & 0xFFFFFFFFFFFFFF8) + 32;
    uint64_t v29 = 1;
    int64_t v32 = 7;
  }
  uint64_t v74 = v33;
  sub_1000E5DD0();
  swift_unknownObjectRetain_n();
  uint64_t v37 = (void *)swift_dynamicCastClass();
  if (!v37)
  {
    swift_unknownObjectRelease();
    uint64_t v37 = _swiftEmptyArrayStorage;
  }
  uint64_t v38 = v37[2];
  swift_release();
  if (__OFSUB__((unint64_t)v32 >> 1, v29)) {
    goto LABEL_51;
  }
  if (v38 != ((unint64_t)v32 >> 1) - v29) {
    goto LABEL_52;
  }
  if (!swift_dynamicCastClass()) {
    swift_unknownObjectRelease();
  }
  while (1)
  {
    uint64_t v29 = (uint64_t)a3;
    a3 = v23;
    uint64_t v39 = v95;
    swift_unknownObjectRelease();
    swift_release();
    double v40 = 0.0;
    uint64_t v23 = v97;
    if (!a3) {
      double v40 = *(double *)(v29 + 136) * 0.5;
    }
    *(unsigned char *)uint64_t v16 = 1;
    (*(void (**)(uint64_t, char *, uint64_t))(v87 + 32))(v16 + v14[5], v86, v88);
    *(void *)(v16 + v14[6]) = v85;
    uint64_t v41 = v16 + v14[7];
    __asm { FMOV            V1.2D, #16.0 }
    *(_OWORD *)uint64_t v41 = xmmword_1000F7F90;
    *(_OWORD *)(v41 + 16) = _Q1;
    *(unsigned char *)(v41 + 32) = 0;
    *(_DWORD *)(v41 + 36) = a2;
    *(void *)(v41 + 40) = v84;
    *(_OWORD *)(v41 + 48) = xmmword_1000F7FA0;
    *(unsigned char *)(v41 + 64) = a3 == 0;
    *(double *)(v41 + 72) = v40;
    *(_WORD *)(v41 + 80) = 0;
    *(unsigned char *)(v41 + 82) = 0;
    *(void *)(v41 + 88) = 0;
    if (*(unsigned char *)(v39 + 24))
    {
      uint64_t v47 = v75;
      sub_1000E4210();
      uint64_t v48 = sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
      uint64_t v31 = (uint64_t)v78;
      sub_1000E4BA0();
      (*(void (**)(char *, uint64_t))(v76 + 8))(v47, v77);
      uint64_t v49 = a3;
      uint64_t v50 = v29;
      uint64_t v51 = v79;
      uint64_t v52 = v93;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v79 + 16))(v94, v31, v93);
      swift_storeEnumTagMultiPayload();
      *(void *)&long long v98 = v14;
      *((void *)&v98 + 1) = v48;
      swift_getOpaqueTypeConformance2();
      a2 = (uint64_t)v89;
      sub_1000E4690();
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v31, v52);
      uint64_t v29 = v50;
      a3 = v49;
      uint64_t v23 = v97;
    }
    else
    {
      sub_1000C3D54(v16, v94, type metadata accessor for TVWidgetContentView);
      swift_storeEnumTagMultiPayload();
      uint64_t v53 = sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
      *(void *)&long long v98 = v14;
      *((void *)&v98 + 1) = v53;
      swift_getOpaqueTypeConformance2();
      a2 = (uint64_t)v89;
      sub_1000E4690();
    }
    uint64_t v55 = v90;
    uint64_t v54 = (uint64_t)v91;
    sub_100014B08(a2, (uint64_t)v91, &qword_10012F158);
    sub_1000C2B9C(v16, type metadata accessor for TVWidgetContentView);
    uint64_t v56 = *(void *)(v29 + 152);
    sub_100014754(v54, (uint64_t)v23, &qword_10012F158);
    *(void *)&v23[*(int *)(v55 + 36)] = v56;
    swift_retain();
    sub_1000147B8(v54, &qword_10012F158);
    uint64_t v16 = *(void *)v29;
    int64_t v32 = *(void *)v29 >> 62;
    if (v32) {
      break;
    }
    uint64_t v57 = *(void *)((*(void *)v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v57) {
      goto LABEL_50;
    }
    swift_bridgeObjectRetain();
    if (v57 >= 3) {
      goto LABEL_30;
    }
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    swift_unknownObjectRelease();
    uint64_t v33 = v74;
LABEL_15:
    sub_100017940(v31, v33, v29, v32);
  }
LABEL_47:
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000E5D70();
  if (result < 1) {
    goto LABEL_56;
  }
  swift_bridgeObjectRetain();
  uint64_t v72 = sub_1000E5D70();
  swift_bridgeObjectRelease();
  if (v72 < 3) {
    goto LABEL_49;
  }
LABEL_30:
  if ((v16 & 0xC000000000000001) != 0)
  {
    type metadata accessor for TVWidgetContentRefinedViewModel();
    sub_1000E5CE0(1);
    sub_1000E5CE0(2);
  }
  if (!v32)
  {
    uint64_t v58 = v16 & 0xFFFFFFFFFFFFFF8;
    uint64_t v59 = (v16 & 0xFFFFFFFFFFFFFF8) + 32;
    uint64_t v60 = 1;
    unint64_t v61 = 7;
    goto LABEL_36;
  }
  swift_bridgeObjectRetain();
  uint64_t v58 = sub_1000E5D80();
  uint64_t v59 = v62;
  uint64_t v60 = v63;
  unint64_t v61 = v64;
  swift_bridgeObjectRelease_n();
  if ((v61 & 1) == 0)
  {
LABEL_35:
    sub_100017940(v58, v59, v60, v61);
    goto LABEL_42;
  }
LABEL_36:
  sub_1000E5DD0();
  swift_unknownObjectRetain_n();
  uint64_t v65 = (void *)swift_dynamicCastClass();
  if (!v65)
  {
    swift_unknownObjectRelease();
    uint64_t v65 = _swiftEmptyArrayStorage;
  }
  uint64_t v66 = v65[2];
  swift_release();
  if (__OFSUB__(v61 >> 1, v60))
  {
    __break(1u);
    goto LABEL_54;
  }
  if (v66 != (v61 >> 1) - v60)
  {
LABEL_54:
    swift_unknownObjectRelease();
    goto LABEL_35;
  }
  if (!swift_dynamicCastClass()) {
    swift_unknownObjectRelease();
  }
LABEL_42:
  uint64_t v67 = v83;
  uint64_t v68 = (uint64_t)v81;
  swift_unknownObjectRelease();
  swift_release();
  sub_1000E40F0();
  sub_1000E4F50();
  sub_1000E40A0();
  sub_100014754((uint64_t)v23, v68, &qword_10012F258);
  uint64_t v69 = (_OWORD *)(v68 + *(int *)(v80 + 36));
  long long v70 = v99;
  _OWORD *v69 = v98;
  v69[1] = v70;
  v69[2] = v100;
  sub_1000147B8((uint64_t)v23, &qword_10012F258);
  return sub_100014B08(v68, v67, &qword_10012F238);
}

uint64_t sub_1000BEF94@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TVWidgetExtraLarge(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000C3D54(a1, (uint64_t)v7, type metadata accessor for TVWidgetExtraLarge);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  sub_1000C4004((uint64_t)v7, v9 + v8, type metadata accessor for TVWidgetExtraLarge);
  uint64_t v10 = sub_1000E4F50();
  sub_1000B6784(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v40, 0.0, 1, 0.0, 1, v10, v11, (uint64_t)sub_1000C489C, v9);
  swift_release();
  sub_1000C3D54(a1, (uint64_t)v7, type metadata accessor for TVWidgetExtraLarge);
  uint64_t v12 = swift_allocObject();
  sub_1000C4004((uint64_t)v7, v12 + v8, type metadata accessor for TVWidgetExtraLarge);
  uint64_t v13 = sub_1000E4F50();
  sub_1000B6784(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v32, 0.0, 1, 0.0, 1, v13, v14, (uint64_t)sub_1000C4978, v12);
  swift_release();
  v48[4] = v44;
  v48[5] = v45;
  v48[6] = v46;
  v48[7] = v47;
  v48[0] = v40;
  v48[1] = v41;
  v48[2] = v42;
  v48[3] = v43;
  long long v15 = v34;
  v49[2] = v34;
  v49[3] = v35;
  long long v16 = v32;
  v49[0] = v32;
  v49[1] = v33;
  long long v17 = v38;
  v49[6] = v38;
  v49[7] = v39;
  v49[4] = v36;
  v49[5] = v37;
  long long v52 = v42;
  long long v53 = v43;
  long long v50 = v40;
  long long v51 = v41;
  long long v56 = v46;
  long long v57 = v47;
  long long v54 = v44;
  long long v55 = v45;
  long long v18 = v35;
  long long v19 = v36;
  long long v60 = v34;
  long long v61 = v35;
  long long v20 = v33;
  long long v58 = v32;
  long long v59 = v33;
  long long v21 = v39;
  long long v64 = v38;
  long long v65 = v39;
  long long v22 = v37;
  long long v62 = v36;
  long long v63 = v37;
  long long v23 = v43;
  a2[2] = v42;
  a2[3] = v23;
  long long v24 = v51;
  *a2 = v50;
  a2[1] = v24;
  long long v25 = v57;
  a2[6] = v56;
  a2[7] = v25;
  long long v26 = v55;
  a2[4] = v54;
  a2[5] = v26;
  long long v27 = v61;
  a2[10] = v60;
  a2[11] = v27;
  long long v28 = v59;
  a2[8] = v58;
  a2[9] = v28;
  long long v29 = v65;
  a2[14] = v64;
  a2[15] = v29;
  long long v30 = v63;
  a2[12] = v62;
  a2[13] = v30;
  v66[4] = v19;
  v66[5] = v22;
  v66[6] = v17;
  v66[7] = v21;
  v66[0] = v16;
  v66[1] = v20;
  v66[2] = v15;
  v66[3] = v18;
  sub_1000C4990((uint64_t)v48);
  sub_1000C4990((uint64_t)v49);
  sub_10005F618((uint64_t)v66);
  v67[4] = v44;
  v67[5] = v45;
  v67[6] = v46;
  v67[7] = v47;
  v67[0] = v40;
  v67[1] = v41;
  v67[2] = v42;
  v67[3] = v43;
  return sub_10005F618((uint64_t)v67);
}

uint64_t sub_1000BF308@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1[17];
  *(void *)a2 = sub_1000E45C0();
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v5 = sub_1000082B4(&qword_10012F2B8);
  return sub_1000BF368(a1, a2 + *(int *)(v5 + 44));
}

uint64_t sub_1000BF368@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v3 = type metadata accessor for TVWidgetExtraLarge(0);
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v24 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = sub_1000082B4(&qword_10012F2C0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (uint64_t *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_1000082B4(&qword_10012F2C8);
  uint64_t v9 = v8 - 8;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v24 - v13;
  *uint64_t v7 = sub_1000E4F50();
  v7[1] = v15;
  uint64_t v16 = sub_1000082B4(&qword_10012F2D0);
  sub_1000BF664(a1, (uint64_t)v7 + *(int *)(v16 + 44));
  sub_1000E40F0();
  sub_1000E4F50();
  sub_1000E40A0();
  sub_100014754((uint64_t)v7, (uint64_t)v12, &qword_10012F2C0);
  long long v17 = &v12[*(int *)(v9 + 44)];
  long long v18 = v27;
  *(_OWORD *)long long v17 = v26;
  *((_OWORD *)v17 + 1) = v18;
  *((_OWORD *)v17 + 2) = v28;
  sub_1000147B8((uint64_t)v7, &qword_10012F2C0);
  sub_100014B08((uint64_t)v12, (uint64_t)v14, &qword_10012F2C8);
  sub_1000C3D54((uint64_t)a1, (uint64_t)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TVWidgetExtraLarge);
  unint64_t v19 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v20 = swift_allocObject();
  sub_1000C4004((uint64_t)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19, type metadata accessor for TVWidgetExtraLarge);
  sub_100014754((uint64_t)v14, (uint64_t)v12, &qword_10012F2C8);
  uint64_t v21 = v25;
  sub_100014754((uint64_t)v12, v25, &qword_10012F2C8);
  long long v22 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))(v21 + *(int *)(sub_1000082B4(&qword_10012F2D8) + 48));
  *long long v22 = sub_1000C4CB4;
  v22[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v20;
  swift_retain();
  sub_1000147B8((uint64_t)v14, &qword_10012F2C8);
  swift_release();
  return sub_1000147B8((uint64_t)v12, &qword_10012F2C8);
}

uint64_t sub_1000BF664@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000082B4(&qword_10012F090);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v78 - v8;
  uint64_t v91 = sub_1000082B4(&qword_10012F1C8);
  __chkstk_darwin(v91);
  uint64_t v93 = (uint64_t)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000E4220();
  uint64_t v80 = *(void *)(v11 - 8);
  uint64_t v81 = v11;
  __chkstk_darwin(v11);
  uint64_t v79 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_1000082B4(&qword_10012F1D0);
  __chkstk_darwin(v90);
  uint64_t v78 = (uint64_t)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_1000082B4(&qword_10012F1D8);
  uint64_t v83 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v82 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000E5640();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  long long v18 = (char *)&v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v19 = (int *)type metadata accessor for TVWidgetContentView(0);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v78 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_1000082B4(&qword_10012F1E0);
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  uint64_t v94 = (uint64_t)&v78 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v88 = (char *)&v78 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v89 = (uint64_t)&v78 - v28;
  __chkstk_darwin(v27);
  long long v96 = (char *)&v78 - v29;
  long long v30 = *(uint64_t (**)(void))(v16 + 104);
  unsigned int v85 = enum case for WidgetFamily.systemExtraLarge(_:);
  uint64_t v97 = v15;
  uint64_t v86 = v16 + 104;
  uint64_t v84 = (void (*)(unsigned char *, void, uint64_t))v30;
  uint64_t result = v30(v18);
  uint64_t v32 = *a1;
  unint64_t v33 = *a1 & 0xC000000000000001;
  uint64_t v95 = v9;
  long long v98 = a1;
  if (v33)
  {
    uint64_t v77 = sub_1000E5CF0();
  }
  else
  {
    if (!*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_22;
    }
    uint64_t v77 = *(void *)(v32 + 32);
    swift_retain();
  }
  uint64_t v87 = a2;
  uint64_t v34 = *(void *)(v77 + 16);
  swift_retain();
  swift_release();
  int v35 = sub_1000E42F0();
  int v36 = sub_1000E42E0();
  long long v37 = v7;
  if (!v35)
  {
    if (!v36)
    {
      int v35 = 0;
      goto LABEL_11;
    }
LABEL_9:
    v35 |= v36;
    goto LABEL_11;
  }
  if ((v36 & ~v35) != 0) {
    goto LABEL_9;
  }
LABEL_11:
  uint64_t v38 = sub_1000E4F80();
  *uint64_t v21 = 2;
  uint64_t result = (*(uint64_t (**)(unsigned char *, char *, uint64_t))(v16 + 32))(&v21[v19[5]], v18, v97);
  *(void *)&v21[v19[6]] = v34;
  long long v39 = &v21[v19[7]];
  __asm { FMOV            V1.2D, #16.0 }
  *(_OWORD *)long long v39 = xmmword_1000F7F90;
  *((_OWORD *)v39 + 1) = _Q1;
  v39[32] = 0;
  *((_DWORD *)v39 + 9) = v35;
  *((void *)v39 + 5) = v38;
  *((_OWORD *)v39 + 3) = xmmword_1000F7FA0;
  v39[64] = 0;
  *((void *)v39 + 9) = 0;
  *((_WORD *)v39 + 40) = 1;
  v39[82] = 1;
  *((void *)v39 + 11) = 0x4018000000000000;
  if (!v33)
  {
    long long v46 = v95;
    long long v47 = v98;
    if (*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v45 = swift_retain();
      goto LABEL_15;
    }
LABEL_22:
    __break(1u);
    return result;
  }
  uint64_t v45 = sub_1000E5CF0();
  long long v46 = v95;
  long long v47 = v98;
LABEL_15:
  char v48 = *(unsigned char *)(v45 + 24);
  swift_release();
  uint64_t v49 = (uint64_t)v37;
  uint64_t v50 = (uint64_t)v96;
  if (v48)
  {
    uint64_t v51 = sub_1000E4DD0();
    uint64_t v52 = v78;
    sub_1000C3D54((uint64_t)v21, v78, type metadata accessor for TVWidgetContentView);
    uint64_t v53 = v90;
    long long v54 = (uint64_t *)(v52 + *(int *)(v90 + 36));
    *long long v54 = v51;
    v54[1] = (uint64_t)sub_1000BFFF0;
    v54[2] = 0;
    long long v55 = v79;
    sub_1000E4210();
    unint64_t v56 = sub_1000C41F0();
    long long v57 = v82;
    sub_1000E4BA0();
    (*(void (**)(char *, uint64_t))(v80 + 8))(v55, v81);
    sub_1000147B8(v52, &qword_10012F1D0);
    uint64_t v81 = v49;
    uint64_t v58 = v83;
    uint64_t v59 = v92;
    (*(void (**)(uint64_t, char *, uint64_t))(v83 + 16))(v93, v57, v92);
    swift_storeEnumTagMultiPayload();
    uint64_t v99 = v53;
    unint64_t v100 = v56;
    swift_getOpaqueTypeConformance2();
    sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    uint64_t v60 = (uint64_t)v88;
    sub_1000E4690();
    long long v61 = v57;
    uint64_t v50 = (uint64_t)v96;
    uint64_t v62 = v59;
    long long v47 = v98;
    (*(void (**)(char *, uint64_t))(v58 + 8))(v61, v62);
    uint64_t v49 = v81;
  }
  else
  {
    sub_1000C3D54((uint64_t)v21, v93, type metadata accessor for TVWidgetContentView);
    swift_storeEnumTagMultiPayload();
    unint64_t v63 = sub_1000C41F0();
    uint64_t v99 = v90;
    unint64_t v100 = v63;
    swift_getOpaqueTypeConformance2();
    sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    uint64_t v60 = (uint64_t)v88;
    sub_1000E4690();
  }
  uint64_t v64 = v89;
  sub_100014B08(v60, v89, &qword_10012F1E0);
  sub_1000C2B9C((uint64_t)v21, type metadata accessor for TVWidgetContentView);
  sub_100014B08(v64, v50, &qword_10012F1E0);
  int v65 = *((unsigned __int8 *)v47 + 8);
  uint64_t v66 = type metadata accessor for TVWidgetNoContentTextView();
  uint64_t v67 = v66;
  uint64_t v68 = 1;
  if (v65 != 4)
  {
    v84(&v46[*(int *)(v66 + 20)], v85, v97);
    uint64_t v69 = (uint64_t)v47 + *(int *)(type metadata accessor for TVWidgetExtraLarge(0) + 28);
    long long v70 = &v46[*(int *)(v67 + 24)];
    uint64_t v71 = sub_1000E5690();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v71 - 8) + 16))(v70, v69, v71);
    uint64_t v72 = sub_1000E4C70();
    unsigned char *v46 = v65;
    uint64_t v73 = &v46[*(int *)(v67 + 28)];
    *(void *)uint64_t v73 = v72;
    *((void *)v73 + 1) = 0x3FE999999999999ALL;
    v73[16] = 1;
    uint64_t v68 = 0;
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v46, v68, 1, v67);
  uint64_t v74 = v94;
  sub_100014754(v50, v94, &qword_10012F1E0);
  sub_100014754((uint64_t)v46, v49, &qword_10012F090);
  uint64_t v75 = v87;
  sub_100014754(v74, v87, &qword_10012F1E0);
  uint64_t v76 = sub_1000082B4(&qword_10012F2E0);
  sub_100014754(v49, v75 + *(int *)(v76 + 48), &qword_10012F090);
  sub_1000147B8((uint64_t)v46, &qword_10012F090);
  sub_1000147B8(v50, &qword_10012F1E0);
  sub_1000147B8(v49, &qword_10012F090);
  return sub_1000147B8(v74, &qword_10012F1E0);
}

uint64_t sub_1000BFFF0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  return swift_retain();
}

uint64_t sub_1000BFFF8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v5 = sub_1000E4100();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TVWidgetExtraLarge(0);
  uint64_t v10 = *(void *)(*(void *)(v9 - 8) + 64);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = v12;
  long long v41 = a1;
  unint64_t v13 = *a1;
  unint64_t v14 = v13 >> 62;
  if (!(v13 >> 62))
  {
    uint64_t v15 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v15)
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    swift_bridgeObjectRetain();
    if (v15 >= 3) {
      goto LABEL_4;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000E5D70();
  if (result >= 1)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_1000E5D70();
    swift_bridgeObjectRelease();
    if (v35 >= 3)
    {
LABEL_4:
      uint64_t v39 = v5;
      if ((v13 & 0xC000000000000001) != 0)
      {
        type metadata accessor for TVWidgetContentRefinedViewModel();
        sub_1000E5CE0(1);
        sub_1000E5CE0(2);
      }
      uint64_t v38 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v14)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = (char *)sub_1000E5D80();
        uint64_t v16 = v17;
        a3 = v18;
        unint64_t v14 = v19;
        swift_bridgeObjectRelease_n();
        if ((v14 & 1) == 0)
        {
LABEL_9:
          sub_100017940((uint64_t)v8, v16, a3, v14);
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v8 = (char *)(v13 & 0xFFFFFFFFFFFFFF8);
        uint64_t v16 = (v13 & 0xFFFFFFFFFFFFFF8) + 32;
        a3 = 1;
        unint64_t v14 = 7;
      }
      uint64_t v37 = v16;
      sub_1000E5DD0();
      swift_unknownObjectRetain_n();
      uint64_t v21 = (void *)swift_dynamicCastClass();
      if (!v21)
      {
        swift_unknownObjectRelease();
        uint64_t v21 = _swiftEmptyArrayStorage;
      }
      uint64_t v22 = v21[2];
      swift_release();
      if (!__OFSUB__(v14 >> 1, a3))
      {
        if (v22 == (v14 >> 1) - a3)
        {
          uint64_t v20 = swift_dynamicCastClass();
          if (!v20)
          {
            swift_unknownObjectRelease();
            uint64_t v23 = _swiftEmptyArrayStorage;
            goto LABEL_17;
          }
LABEL_15:
          uint64_t v23 = (void *)v20;
LABEL_17:
          uint64_t v25 = (uint64_t)v41;
          uint64_t v24 = v42;
          swift_unknownObjectRelease();
          uint64_t v26 = sub_1000C30B4((unint64_t)v23);
          swift_release();
          uint64_t v43 = v26;
          swift_getKeyPath();
          sub_1000C3D54(v25, (uint64_t)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TVWidgetExtraLarge);
          uint64_t v27 = v38;
          uint64_t v28 = v24;
          uint64_t v29 = v39;
          (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v38, v28, v39);
          unint64_t v30 = (*(unsigned __int8 *)(v40 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
          unint64_t v31 = (v10 + *(unsigned __int8 *)(v6 + 80) + v30) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
          uint64_t v32 = swift_allocObject();
          sub_1000C4004((uint64_t)v11, v32 + v30, type metadata accessor for TVWidgetExtraLarge);
          (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v32 + v31, v27, v29);
          uint64_t v33 = swift_allocObject();
          *(void *)(v33 + 16) = sub_1000C4D60;
          *(void *)(v33 + 24) = v32;
          sub_1000082B4(&qword_10012F230);
          sub_1000082B4(&qword_10012F238);
          sub_100014AC4(&qword_10012F240, &qword_10012F230);
          sub_1000C43B8();
          return sub_1000E4EB0();
        }
        goto LABEL_23;
      }
LABEL_22:
      __break(1u);
LABEL_23:
      swift_unknownObjectRelease();
      uint64_t v16 = v37;
      goto LABEL_9;
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000C04A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v11 = sub_1000082B4(&qword_10012F238);
  __chkstk_darwin(v11 - 8);
  unint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a3;
  unint64_t v15 = (unint64_t)*a3 >> 62;
  if (!v15)
  {
    uint64_t v16 = *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v16) {
      goto LABEL_54;
    }
    swift_bridgeObjectRetain();
    if (v16 >= 3) {
      goto LABEL_4;
    }
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    for (uint64_t i = sub_1000E5D70(); ; uint64_t i = *(void *)(v24 + 16))
    {
      swift_release();
      uint64_t v29 = i - 1;
      if (__OFSUB__(i, 1)) {
        goto LABEL_55;
      }
      if (v29 < 0)
      {
        uint64_t v17 = (unint64_t)v47 >> 63;
        if (!v15)
        {
LABEL_24:
          unint64_t v19 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v19) {
            goto LABEL_57;
          }
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v17 = v29 > v47;
        if (!v15) {
          goto LABEL_24;
        }
      }
      if (v14 < 0) {
        unint64_t v19 = v14;
      }
      else {
        unint64_t v19 = v14 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain_n();
      uint64_t v30 = sub_1000E5D70();
      swift_bridgeObjectRelease();
      if (v30 < 1)
      {
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
        goto LABEL_59;
      }
      swift_bridgeObjectRetain();
      unint64_t v19 = sub_1000E5D70();
      swift_bridgeObjectRelease();
LABEL_32:
      if ((uint64_t)v19 < 3) {
        goto LABEL_58;
      }
      if (v5)
      {
        type metadata accessor for TVWidgetContentRefinedViewModel();
        sub_1000E5CE0(1);
        sub_1000E5CE0(2);
      }
      if (v15)
      {
        swift_bridgeObjectRetain();
        uint64_t v5 = sub_1000E5D80();
        uint64_t v6 = v33;
        uint64_t v31 = v34;
        unint64_t v32 = v35;
        swift_bridgeObjectRelease_n();
        if ((v32 & 1) == 0) {
          goto LABEL_38;
        }
      }
      else
      {
        uint64_t v5 = v14 & 0xFFFFFFFFFFFFFF8;
        uint64_t v6 = (v14 & 0xFFFFFFFFFFFFFF8) + 32;
        uint64_t v31 = 1;
        unint64_t v32 = 7;
      }
      uint64_t v14 = sub_1000E5DD0();
      swift_unknownObjectRetain_n();
      uint64_t v37 = (void *)swift_dynamicCastClass();
      if (!v37)
      {
        swift_unknownObjectRelease();
        uint64_t v37 = _swiftEmptyArrayStorage;
      }
      unint64_t v15 = v37[2];
      swift_release();
      if (__OFSUB__(v32 >> 1, v31))
      {
        __break(1u);
LABEL_64:
        swift_unknownObjectRelease();
LABEL_38:
        sub_100017940(v5, v6, v31, v32);
        goto LABEL_44;
      }
      if (v15 != (v32 >> 1) - v31) {
        goto LABEL_64;
      }
      uint64_t v36 = swift_dynamicCastClass();
      if (!v36)
      {
        swift_unknownObjectRelease();
        unint64_t v19 = (unint64_t)_swiftEmptyArrayStorage;
        goto LABEL_46;
      }
LABEL_44:
      unint64_t v19 = v36;
LABEL_46:
      swift_unknownObjectRelease();
      if ((v19 & 0x8000000000000000) == 0 && (v19 & 0x4000000000000000) == 0)
      {
        uint64_t v38 = *(void *)(v19 + 16);
        goto LABEL_49;
      }
LABEL_59:
      uint64_t v38 = sub_1000E5D70();
LABEL_49:
      swift_release();
      if (!__OFSUB__(v38, 1))
      {
        sub_1000E40F0();
        uint64_t v39 = (uint64_t)v45;
        sub_1000C0E64(a2, v17, (uint64_t)v45);
        return sub_100014B08(v39, a5, &qword_10012F238);
      }
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      swift_unknownObjectRelease();
      a5 = (uint64_t)a3;
      a3 = (uint64_t *)a2;
      a2 = v5;
      uint64_t v18 = v43;
      uint64_t v5 = v44;
LABEL_9:
      sub_100017940(v17, v18, v6, v19);
      uint64_t v24 = (uint64_t)v23;
LABEL_18:
      swift_unknownObjectRelease();
      if (v24 < 0 || (v24 & 0x4000000000000000) != 0) {
        goto LABEL_56;
      }
    }
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000E5D70();
  if (result >= 1)
  {
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_1000E5D70();
    swift_bridgeObjectRelease();
    if (v41 >= 3)
    {
LABEL_4:
      uint64_t v5 = v14 & 0xC000000000000001;
      if ((v14 & 0xC000000000000001) != 0)
      {
        type metadata accessor for TVWidgetContentRefinedViewModel();
        sub_1000E5CE0(1);
        sub_1000E5CE0(2);
      }
      uint64_t v45 = v13;
      uint64_t v46 = a4;
      if (v15)
      {
        swift_bridgeObjectRetain();
        uint64_t v17 = sub_1000E5D80();
        uint64_t v18 = v20;
        uint64_t v6 = v21;
        unint64_t v19 = v22;
        swift_bridgeObjectRelease_n();
        if ((v19 & 1) == 0) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v17 = v14 & 0xFFFFFFFFFFFFFF8;
        uint64_t v18 = (v14 & 0xFFFFFFFFFFFFFF8) + 32;
        uint64_t v6 = 1;
        unint64_t v19 = 7;
      }
      uint64_t v43 = v18;
      unint64_t v44 = v14 & 0xC000000000000001;
      uint64_t v5 = a2;
      a2 = (uint64_t)a3;
      a3 = (uint64_t *)a5;
      sub_1000E5DD0();
      swift_unknownObjectRetain_n();
      uint64_t v25 = (void *)swift_dynamicCastClass();
      if (!v25)
      {
        swift_unknownObjectRelease();
        uint64_t v25 = _swiftEmptyArrayStorage;
      }
      uint64_t v26 = v25[2];
      swift_release();
      if (!__OFSUB__(v19 >> 1, v6))
      {
        if (v26 == (v19 >> 1) - v6)
        {
          uint64_t v27 = swift_dynamicCastClass();
          a5 = (uint64_t)a3;
          if (v27)
          {
            uint64_t v24 = v27;
          }
          else
          {
            swift_unknownObjectRelease();
            uint64_t v24 = (uint64_t)_swiftEmptyArrayStorage;
          }
          a3 = (uint64_t *)a2;
          a2 = v5;
          uint64_t v5 = v44;
          goto LABEL_18;
        }
        goto LABEL_62;
      }
      goto LABEL_61;
    }
    goto LABEL_53;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000C09C4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = *v3;
  unint64_t v5 = (unint64_t)*v3 >> 62;
  if (a3)
  {
    if (v5)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_1000E5D70();
      if (result < 3)
      {
        __break(1u);
        goto LABEL_61;
      }
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_1000E5D70();
      swift_bridgeObjectRelease();
      if (v29 >= 7) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v6 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if ((unint64_t)v6 < 3)
      {
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
      swift_bridgeObjectRetain();
      if (v6 >= 7)
      {
LABEL_5:
        if ((v4 & 0xC000000000000001) != 0)
        {
          type metadata accessor for TVWidgetContentRefinedViewModel();
          sub_1000E5CE0(3);
          sub_1000E5CE0(4);
          sub_1000E5CE0(5);
          sub_1000E5CE0(6);
        }
        if (v5)
        {
          swift_bridgeObjectRetain();
          uint64_t v7 = sub_1000E5D80();
          uint64_t v8 = v12;
          uint64_t v9 = v13;
          unint64_t v10 = v14;
          swift_bridgeObjectRelease_n();
          if ((v10 & 1) == 0)
          {
LABEL_17:
            sub_100017940(v7, v8, v9, v10);
            goto LABEL_23;
          }
        }
        else
        {
          uint64_t v7 = v4 & 0xFFFFFFFFFFFFFF8;
          uint64_t v8 = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
          uint64_t v9 = 3;
          unint64_t v10 = 15;
        }
        sub_1000E5DD0();
        swift_unknownObjectRetain_n();
        uint64_t v16 = (void *)swift_dynamicCastClass();
        if (!v16)
        {
          swift_unknownObjectRelease();
          uint64_t v16 = _swiftEmptyArrayStorage;
        }
        uint64_t v17 = v16[2];
        swift_release();
        if (!__OFSUB__(v10 >> 1, v9))
        {
          if (v17 == (v10 >> 1) - v9)
          {
            uint64_t v15 = swift_dynamicCastClass();
            if (!v15)
            {
              swift_unknownObjectRelease();
              uint64_t v18 = (uint64_t)_swiftEmptyArrayStorage;
              goto LABEL_33;
            }
LABEL_23:
            uint64_t v18 = v15;
LABEL_33:
            swift_unknownObjectRelease();
            if (v18 < 0 || (v18 & 0x4000000000000000) != 0) {
              goto LABEL_54;
            }
            for (uint64_t i = *(void *)(v18 + 16); ; uint64_t i = sub_1000E5D70())
            {
              swift_release();
              if (!__OFSUB__(i, 1)) {
                break;
              }
LABEL_52:
              __break(1u);
LABEL_53:
              __break(1u);
LABEL_54:
              ;
            }
            return sub_1000E40F0();
          }
          goto LABEL_58;
        }
        __break(1u);
LABEL_57:
        __break(1u);
LABEL_58:
        swift_unknownObjectRelease();
        goto LABEL_17;
      }
    }
    __break(1u);
  }
  else if (!v5)
  {
    uint64_t v11 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v11)
    {
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }
    swift_bridgeObjectRetain();
    if (v11 < 3) {
      goto LABEL_49;
    }
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000E5D70();
  if (result >= 1)
  {
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_1000E5D70();
    swift_bridgeObjectRelease();
    if (v30 < 3)
    {
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
LABEL_12:
    if ((v4 & 0xC000000000000001) != 0)
    {
      type metadata accessor for TVWidgetContentRefinedViewModel();
      sub_1000E5CE0(1);
      sub_1000E5CE0(2);
    }
    if (v5)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_1000E5D80();
      uint64_t v8 = v19;
      uint64_t v9 = v20;
      unint64_t v10 = v21;
      swift_bridgeObjectRelease_n();
      if ((v10 & 1) == 0) {
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v7 = v4 & 0xFFFFFFFFFFFFFF8;
      uint64_t v8 = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
      uint64_t v9 = 1;
      unint64_t v10 = 7;
    }
    sub_1000E5DD0();
    swift_unknownObjectRetain_n();
    uint64_t v23 = (void *)swift_dynamicCastClass();
    if (!v23)
    {
      swift_unknownObjectRelease();
      uint64_t v23 = _swiftEmptyArrayStorage;
    }
    uint64_t v24 = v23[2];
    swift_release();
    if (__OFSUB__(v10 >> 1, v9)) {
      goto LABEL_57;
    }
    if (v24 == (v10 >> 1) - v9)
    {
      uint64_t v22 = swift_dynamicCastClass();
      if (!v22)
      {
        swift_unknownObjectRelease();
        uint64_t v25 = (uint64_t)_swiftEmptyArrayStorage;
        goto LABEL_39;
      }
LABEL_31:
      uint64_t v25 = v22;
LABEL_39:
      swift_unknownObjectRelease();
      if (v25 < 0 || (v25 & 0x4000000000000000) != 0) {
        uint64_t v27 = sub_1000E5D70();
      }
      else {
        uint64_t v27 = *(void *)(v25 + 16);
      }
      swift_release();
      if (__OFSUB__(v27, 1)) {
        goto LABEL_53;
      }
      return sub_1000E40F0();
    }
    swift_unknownObjectRelease();
LABEL_25:
    sub_100017940(v7, v8, v9, v10);
    goto LABEL_31;
  }
LABEL_61:
  __break(1u);
  return result;
}

uint64_t sub_1000C0E64@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v58 = a3;
  int v60 = a2;
  uint64_t v55 = sub_1000082B4(&qword_10012F198);
  __chkstk_darwin(v55);
  uint64_t v57 = (uint64_t)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000E4220();
  uint64_t v48 = *(void *)(v5 - 8);
  uint64_t v49 = v5;
  __chkstk_darwin(v5);
  uint64_t v47 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_1000082B4(&qword_10012F1A0);
  uint64_t v51 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v50 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000E5640();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (int *)type metadata accessor for TVWidgetContentView(0);
  __chkstk_darwin(v12);
  unint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000082B4(&qword_10012F158);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v53 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v52 = (uint64_t)&v46 - v18;
  uint64_t v54 = sub_1000082B4(&qword_10012F258);
  __chkstk_darwin(v54);
  uint64_t v20 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for WidgetFamily.systemExtraLarge(_:), v8);
  uint64_t v21 = a1;
  uint64_t v22 = *(void *)(a1 + 16);
  swift_retain();
  int v23 = sub_1000E42F0();
  int v24 = sub_1000E42E0();
  if (!v23)
  {
    if (!v24)
    {
      int v23 = 0;
      goto LABEL_7;
    }
LABEL_5:
    v23 |= v24;
    goto LABEL_7;
  }
  if ((v24 & ~v23) != 0) {
    goto LABEL_5;
  }
LABEL_7:
  uint64_t v25 = sub_1000E4F80();
  double v26 = 0.0;
  if (v60) {
    double v26 = *(double *)(v59 + 136) * 0.5;
  }
  *unint64_t v14 = 1;
  (*(void (**)(unsigned char *, char *, uint64_t))(v9 + 32))(&v14[v12[5]], v11, v8);
  *(void *)&v14[v12[6]] = v22;
  uint64_t v27 = &v14[v12[7]];
  __asm { FMOV            V1.2D, #16.0 }
  *(_OWORD *)uint64_t v27 = xmmword_1000F7F90;
  *((_OWORD *)v27 + 1) = _Q1;
  v27[32] = 0;
  *((_DWORD *)v27 + 9) = v23;
  *((void *)v27 + 5) = v25;
  *((_OWORD *)v27 + 3) = xmmword_1000F7FA0;
  v27[64] = v60 & 1;
  *((double *)v27 + 9) = v26;
  *((_WORD *)v27 + 40) = 0;
  v27[82] = 0;
  *((void *)v27 + 11) = 0;
  if (*(unsigned char *)(v21 + 24))
  {
    uint64_t v33 = v47;
    sub_1000E4210();
    uint64_t v34 = sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    unint64_t v35 = v50;
    sub_1000E4BA0();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v33, v49);
    uint64_t v36 = v51;
    uint64_t v37 = v56;
    (*(void (**)(uint64_t, char *, uint64_t))(v51 + 16))(v57, v35, v56);
    swift_storeEnumTagMultiPayload();
    *(void *)&long long v61 = v12;
    *((void *)&v61 + 1) = v34;
    swift_getOpaqueTypeConformance2();
    uint64_t v38 = (uint64_t)v53;
    sub_1000E4690();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v37);
  }
  else
  {
    sub_1000C3D54((uint64_t)v14, v57, type metadata accessor for TVWidgetContentView);
    swift_storeEnumTagMultiPayload();
    uint64_t v39 = sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    *(void *)&long long v61 = v12;
    *((void *)&v61 + 1) = v39;
    swift_getOpaqueTypeConformance2();
    uint64_t v38 = (uint64_t)v53;
    sub_1000E4690();
  }
  uint64_t v40 = v52;
  sub_100014B08(v38, v52, &qword_10012F158);
  sub_1000C2B9C((uint64_t)v14, type metadata accessor for TVWidgetContentView);
  uint64_t v41 = *(void *)(v59 + 152);
  sub_100014754(v40, (uint64_t)v20, &qword_10012F158);
  *(void *)&v20[*(int *)(v54 + 36)] = v41;
  swift_retain();
  sub_1000147B8(v40, &qword_10012F158);
  sub_1000E4F50();
  sub_1000E40A0();
  uint64_t v42 = v58;
  sub_100014754((uint64_t)v20, v58, &qword_10012F258);
  uint64_t v43 = (_OWORD *)(v42 + *(int *)(sub_1000082B4(&qword_10012F238) + 36));
  long long v44 = v62;
  *uint64_t v43 = v61;
  v43[1] = v44;
  v43[2] = v63;
  return sub_1000147B8((uint64_t)v20, &qword_10012F258);
}

uint64_t sub_1000C154C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_1000E45D0();
  double v9 = *(double *)(a2 + 136) * 0.5;
  *(void *)a4 = v8;
  *(double *)(a4 + 8) = v9;
  *(unsigned char *)(a4 + 16) = 0;
  sub_1000082B4(&qword_10012F220);
  return a3(a2, a1);
}

uint64_t sub_1000C15C0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v5 = sub_1000E4100();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TVWidgetExtraLarge(0);
  uint64_t v10 = *(void *)(*(void *)(v9 - 8) + 64);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = v12;
  uint64_t v41 = a1;
  unint64_t v13 = *a1;
  unint64_t v14 = v13 >> 62;
  if (!(v13 >> 62))
  {
    uint64_t v15 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if ((unint64_t)v15 < 3)
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    swift_bridgeObjectRetain();
    if (v15 >= 7) {
      goto LABEL_4;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000E5D70();
  if (result >= 3)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_1000E5D70();
    swift_bridgeObjectRelease();
    if (v35 >= 7)
    {
LABEL_4:
      uint64_t v39 = v5;
      if ((v13 & 0xC000000000000001) != 0)
      {
        type metadata accessor for TVWidgetContentRefinedViewModel();
        sub_1000E5CE0(3);
        sub_1000E5CE0(4);
        sub_1000E5CE0(5);
        sub_1000E5CE0(6);
      }
      uint64_t v38 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v14)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = (char *)sub_1000E5D80();
        uint64_t v16 = v17;
        a3 = v18;
        unint64_t v14 = v19;
        swift_bridgeObjectRelease_n();
        if ((v14 & 1) == 0)
        {
LABEL_9:
          sub_100017940((uint64_t)v8, v16, a3, v14);
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v8 = (char *)(v13 & 0xFFFFFFFFFFFFFF8);
        uint64_t v16 = (v13 & 0xFFFFFFFFFFFFFF8) + 32;
        a3 = 3;
        unint64_t v14 = 15;
      }
      uint64_t v37 = v16;
      sub_1000E5DD0();
      swift_unknownObjectRetain_n();
      uint64_t v21 = (void *)swift_dynamicCastClass();
      if (!v21)
      {
        swift_unknownObjectRelease();
        uint64_t v21 = _swiftEmptyArrayStorage;
      }
      uint64_t v22 = v21[2];
      swift_release();
      if (!__OFSUB__(v14 >> 1, a3))
      {
        if (v22 == (v14 >> 1) - a3)
        {
          uint64_t v20 = swift_dynamicCastClass();
          if (!v20)
          {
            swift_unknownObjectRelease();
            int v23 = _swiftEmptyArrayStorage;
            goto LABEL_17;
          }
LABEL_15:
          int v23 = (void *)v20;
LABEL_17:
          uint64_t v25 = (uint64_t)v41;
          uint64_t v24 = v42;
          swift_unknownObjectRelease();
          uint64_t v26 = sub_1000C30B4((unint64_t)v23);
          swift_release();
          uint64_t v43 = v26;
          swift_getKeyPath();
          sub_1000C3D54(v25, (uint64_t)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for TVWidgetExtraLarge);
          uint64_t v27 = v38;
          uint64_t v28 = v24;
          uint64_t v29 = v39;
          (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v38, v28, v39);
          unint64_t v30 = (*(unsigned __int8 *)(v40 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
          unint64_t v31 = (v10 + *(unsigned __int8 *)(v6 + 80) + v30) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
          uint64_t v32 = swift_allocObject();
          sub_1000C4004((uint64_t)v11, v32 + v30, type metadata accessor for TVWidgetExtraLarge);
          (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v32 + v31, v27, v29);
          uint64_t v33 = swift_allocObject();
          *(void *)(v33 + 16) = sub_1000C4B6C;
          *(void *)(v33 + 24) = v32;
          sub_1000082B4(&qword_10012F230);
          sub_1000082B4(&qword_10012F238);
          sub_100014AC4(&qword_10012F240, &qword_10012F230);
          sub_1000C43B8();
          return sub_1000E4EB0();
        }
        goto LABEL_23;
      }
LABEL_22:
      __break(1u);
LABEL_23:
      swift_unknownObjectRelease();
      uint64_t v16 = v37;
      goto LABEL_9;
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000C1A90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_1000082B4(&qword_10012F238);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a3;
  unint64_t v14 = (unint64_t)*a3 >> 62;
  if (!v14)
  {
    uint64_t v15 = *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if ((unint64_t)v15 < 3)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    swift_bridgeObjectRetain();
    if (v15 >= 7) {
      goto LABEL_4;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000E5D70();
  if (result < 3)
  {
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v34 = sub_1000E5D70();
  swift_bridgeObjectRelease();
  if (v34 < 7) {
    goto LABEL_25;
  }
LABEL_4:
  if ((v13 & 0xC000000000000001) != 0)
  {
    type metadata accessor for TVWidgetContentRefinedViewModel();
    sub_1000E5CE0(3);
    sub_1000E5CE0(4);
    sub_1000E5CE0(5);
    sub_1000E5CE0(6);
  }
  v35[1] = a3;
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1000E5D80();
    uint64_t v17 = v20;
    uint64_t v18 = v21;
    unint64_t v19 = v22;
    swift_bridgeObjectRelease_n();
    if ((v19 & 1) == 0)
    {
LABEL_9:
      sub_100017940(v16, v17, v18, v19);
      uint64_t v24 = (uint64_t)v23;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v16 = v13 & 0xFFFFFFFFFFFFFF8;
    uint64_t v17 = (v13 & 0xFFFFFFFFFFFFFF8) + 32;
    uint64_t v18 = 3;
    unint64_t v19 = 15;
  }
  v35[0] = v17;
  uint64_t v25 = a1;
  uint64_t v26 = a4;
  uint64_t v27 = a2;
  uint64_t v28 = a5;
  sub_1000E5DD0();
  swift_unknownObjectRetain_n();
  uint64_t v29 = (void *)swift_dynamicCastClass();
  if (!v29)
  {
    swift_unknownObjectRelease();
    uint64_t v29 = _swiftEmptyArrayStorage;
  }
  uint64_t v30 = v29[2];
  swift_release();
  if (__OFSUB__(v19 >> 1, v18))
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v30 != (v19 >> 1) - v18)
  {
LABEL_30:
    swift_unknownObjectRelease();
    a5 = v28;
    a2 = v27;
    a4 = v26;
    a1 = v25;
    uint64_t v17 = v35[0];
    goto LABEL_9;
  }
  uint64_t v31 = swift_dynamicCastClass();
  a5 = v28;
  if (v31)
  {
    uint64_t v24 = v31;
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v24 = (uint64_t)_swiftEmptyArrayStorage;
  }
  a2 = v27;
  a4 = v26;
  a1 = v25;
LABEL_18:
  swift_unknownObjectRelease();
  if (v24 < 0 || (v24 & 0x4000000000000000) != 0) {
    goto LABEL_28;
  }
  for (uint64_t i = *(void *)(v24 + 16); ; uint64_t i = sub_1000E5D70())
  {
    swift_release();
    if (!__OFSUB__(i, 1)) {
      break;
    }
LABEL_27:
    __break(1u);
LABEL_28:
    ;
  }
  sub_1000C09C4(a4, a1, 1);
  sub_1000C0E64(a2, ((i - 1) & ~((i - 1) >> 63)) > a1, (uint64_t)v12);
  return sub_100014B08((uint64_t)v12, a5, &qword_10012F238);
}

void *sub_1000C1DB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v1 + 128);
  uint64_t v5 = sub_1000E4510();
  sub_1000BEF94(v2, v29);
  *(_OWORD *)&__src[199] = v29[12];
  *(_OWORD *)&__src[215] = v29[13];
  *(_OWORD *)&__src[231] = v29[14];
  *(_OWORD *)&__src[247] = v29[15];
  *(_OWORD *)&__src[135] = v29[8];
  *(_OWORD *)&__src[151] = v29[9];
  *(_OWORD *)&__src[167] = v29[10];
  *(_OWORD *)&__src[183] = v29[11];
  *(_OWORD *)&__src[71] = v29[4];
  *(_OWORD *)&__src[87] = v29[5];
  *(_OWORD *)&__src[103] = v29[6];
  *(_OWORD *)&__src[119] = v29[7];
  *(_OWORD *)&__src[7] = v29[0];
  *(_OWORD *)&__src[23] = v29[1];
  *(_OWORD *)&__src[39] = v29[2];
  __src[264] = 0;
  *(_OWORD *)&__src[55] = v29[3];
  char v6 = sub_1000E4750();
  sub_1000E3FB0();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  char v31 = 0;
  char v15 = sub_1000E47A0();
  sub_1000E3FB0();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v24 = sub_1000E4F10();
  uint64_t v26 = v25;
  char v27 = v31;
  char v32 = 0;
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t result = memcpy((void *)(a1 + 17), __src, 0x107uLL);
  *(unsigned char *)(a1 + 280) = v6;
  *(void *)(a1 + 288) = v8;
  *(void *)(a1 + 296) = v10;
  *(void *)(a1 + 304) = v12;
  *(void *)(a1 + 312) = v14;
  *(unsigned char *)(a1 + 320) = v27;
  *(unsigned char *)(a1 + 328) = 0;
  *(unsigned char *)(a1 + 336) = v15;
  *(void *)(a1 + 344) = v17;
  *(void *)(a1 + 352) = v19;
  *(void *)(a1 + 360) = v21;
  *(void *)(a1 + 368) = v23;
  *(unsigned char *)(a1 + 376) = v32;
  *(void *)(a1 + 384) = v24;
  *(void *)(a1 + 392) = v26;
  return result;
}

void *sub_1000C1F40(void *a1, void *(*a2)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v4 = swift_release();
  uint64_t result = a2(&v6, v4);
  *a1 = v6;
  return result;
}

uint64_t sub_1000C1F94@<X0>(uint64_t a1@<X8>)
{
  return sub_1000C2410(&qword_100129F20, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize, 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t sub_1000C1FD4(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1000E44F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_1000E5B80();
  uint64_t v9 = sub_1000E4730();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_1000C2C58(1819242306, 0xE400000000000000, &v12);
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000E44E0();
  swift_getAtKeyPath();
  sub_100009A3C(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v13;
}

uint64_t sub_1000C21AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000E44F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000082B4(&qword_10012B9A0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100014754(v2, (uint64_t)v10, &qword_10012B9A0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_100014B08((uint64_t)v10, a1, &qword_10012C540);
  }
  os_log_type_t v12 = sub_1000E5B80();
  unsigned __int8 v13 = sub_1000E4730();
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = sub_1000C2C58(0xD00000000000001ALL, 0x80000001000EC9A0, &v16);
    _os_log_impl((void *)&_mh_execute_header, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000E44E0();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000C2410@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v22 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_1000E44F0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000082B4(a1);
  __chkstk_darwin();
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100014754(v9, (uint64_t)v16, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(a5, v16, v17);
  }
  else
  {
    os_log_type_t v19 = sub_1000E5B80();
    uint64_t v20 = sub_1000E4730();
    if (os_log_type_enabled(v20, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 136315138;
      *(void *)(v21 + 4) = sub_1000C2C58(a3, v22, &v23);
      _os_log_impl((void *)&_mh_execute_header, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_1000E44E0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

unint64_t sub_1000C2698()
{
  unint64_t result = qword_10012EDB0;
  if (!qword_10012EDB0)
  {
    sub_100008354(&qword_10012ED90);
    sub_1000C2714();
    sub_1000C29F4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EDB0);
  }
  return result;
}

unint64_t sub_1000C2714()
{
  unint64_t result = qword_10012EDB8;
  if (!qword_10012EDB8)
  {
    sub_100008354(&qword_10012ED88);
    sub_1000C280C();
    type metadata accessor for TVWidgetMedium(255);
    sub_1000C29AC(&qword_10012EDE0, (void (*)(uint64_t))type metadata accessor for TVWidgetMedium);
    sub_1000C2958();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EDB8);
  }
  return result;
}

unint64_t sub_1000C280C()
{
  unint64_t result = qword_10012EDC0;
  if (!qword_10012EDC0)
  {
    sub_100008354(&qword_10012EDA8);
    sub_1000C2904();
    type metadata accessor for TVWidgetSmall(255);
    sub_1000C29AC(&qword_10012EDD0, (void (*)(uint64_t))type metadata accessor for TVWidgetSmall);
    sub_1000C2958();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EDC0);
  }
  return result;
}

unint64_t sub_1000C2904()
{
  unint64_t result = qword_10012EDC8;
  if (!qword_10012EDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EDC8);
  }
  return result;
}

unint64_t sub_1000C2958()
{
  unint64_t result = qword_10012EDD8;
  if (!qword_10012EDD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EDD8);
  }
  return result;
}

uint64_t sub_1000C29AC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000C29F4()
{
  unint64_t result = qword_10012EDE8;
  if (!qword_10012EDE8)
  {
    sub_100008354(&qword_10012ED58);
    type metadata accessor for TVWidgetLarge(255);
    sub_1000C29AC(&qword_10012EDF0, (void (*)(uint64_t))type metadata accessor for TVWidgetLarge);
    sub_1000C2958();
    swift_getOpaqueTypeConformance2();
    type metadata accessor for TVWidgetExtraLarge(255);
    sub_1000C29AC(&qword_10012EDF8, (void (*)(uint64_t))type metadata accessor for TVWidgetExtraLarge);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012EDE8);
  }
  return result;
}

uint64_t sub_1000C2B50(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000C2B9C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000C2BFC@<X0>(uint64_t *a1@<X8>)
{
  return sub_1000BAAF0(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_1000C2C18@<X0>(uint64_t a1@<X8>)
{
  return sub_1000C2410(&qword_10012F358, (uint64_t (*)(void))&type metadata accessor for ActivityFamily, 0x7974697669746341, 0xEE00796C696D6146, a1);
}

unint64_t sub_1000C2C58(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_1000C2D2C(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100089028((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100089028((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100088648((uint64_t)v12);
  return v7;
}

unint64_t sub_1000C2D2C(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_1000C2E2C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_1000E5D00();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

char *sub_1000C2E2C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_1000C2EC4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000C2FC8(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000C2FC8((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_1000C2EC4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_1000C2F60(v2, 0);
      unint64_t result = (void *)sub_1000E5CD0();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_1000E5A80();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000C2F60(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_1000082B4(&qword_10012EE00);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1000C2FC8(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000082B4(&qword_10012EE00);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1000C30B4(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_52;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (v2)
  {
    while (1)
    {
      if (v2 < 1)
      {
        __break(1u);
        goto LABEL_59;
      }
      if ((a1 & 0xC000000000000001) == 0) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      unint64_t v6 = _swiftEmptyArrayStorage;
      int64_t v7 = &_swiftEmptyArrayStorage[4];
      while (1)
      {
        uint64_t v8 = sub_1000E5CF0();
        if (!v4)
        {
          unint64_t v9 = v6[3];
          if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_50;
          }
          int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
          if (v10 <= 1) {
            uint64_t v11 = 1;
          }
          else {
            uint64_t v11 = v10;
          }
          sub_1000082B4(&qword_10012F270);
          uint64_t v12 = (void *)swift_allocObject();
          int64_t v13 = j__malloc_size(v12);
          uint64_t v14 = v13 - 32;
          if (v13 < 32) {
            uint64_t v14 = v13 - 17;
          }
          uint64_t v15 = v14 >> 4;
          void v12[2] = v11;
          unint64_t v12[3] = 2 * (v14 >> 4);
          unint64_t v16 = (unint64_t)(v12 + 4);
          uint64_t v17 = v6[3] >> 1;
          if (v6[2])
          {
            if (v12 != v6 || v16 >= (unint64_t)&v6[2 * v17 + 4]) {
              memmove(v12 + 4, v6 + 4, 16 * v17);
            }
            v6[2] = 0;
          }
          int64_t v7 = (void *)(v16 + 16 * v17);
          uint64_t v4 = (v15 & 0x7FFFFFFFFFFFFFFFLL) - v17;
          swift_release();
          unint64_t v6 = v12;
        }
        BOOL v19 = __OFSUB__(v4--, 1);
        if (v19) {
          break;
        }
        *int64_t v7 = v5;
        v7[1] = v8;
        v7 += 2;
        if (v2 == ++v5) {
          goto LABEL_47;
        }
      }
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      swift_bridgeObjectRetain();
      uint64_t result = sub_1000E5D70();
      uint64_t v2 = result;
      if (!result) {
        goto LABEL_53;
      }
    }
    uint64_t v4 = 0;
    uint64_t v20 = 0;
    unint64_t v6 = _swiftEmptyArrayStorage;
    uint64_t v21 = &_swiftEmptyArrayStorage[4];
    do
    {
      uint64_t v22 = *(void *)(a1 + 8 * v20 + 32);
      if (v4)
      {
        swift_retain();
        BOOL v19 = __OFSUB__(v4--, 1);
        if (v19) {
          goto LABEL_49;
        }
      }
      else
      {
        unint64_t v23 = v6[3];
        if ((uint64_t)((v23 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_51;
        }
        int64_t v24 = v23 & 0xFFFFFFFFFFFFFFFELL;
        if (v24 <= 1) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = v24;
        }
        sub_1000082B4(&qword_10012F270);
        uint64_t v26 = (void *)swift_allocObject();
        int64_t v27 = j__malloc_size(v26);
        uint64_t v28 = v27 - 32;
        if (v27 < 32) {
          uint64_t v28 = v27 - 17;
        }
        uint64_t v29 = v28 >> 4;
        v26[2] = v25;
        v26[3] = 2 * (v28 >> 4);
        uint64_t v30 = v26 + 4;
        uint64_t v31 = v6[3] >> 1;
        uint64_t v21 = &v26[2 * v31 + 4];
        uint64_t v32 = (v29 & 0x7FFFFFFFFFFFFFFFLL) - v31;
        if (v6[2])
        {
          if (v26 != v6 || v30 >= &v6[2 * v31 + 4]) {
            memmove(v30, v6 + 4, 16 * v31);
          }
          swift_retain();
          v6[2] = 0;
        }
        else
        {
          swift_retain();
        }
        swift_release();
        unint64_t v6 = v26;
        BOOL v19 = __OFSUB__(v32, 1);
        uint64_t v4 = v32 - 1;
        if (v19) {
          goto LABEL_49;
        }
      }
      *uint64_t v21 = v20;
      v21[1] = v22;
      v21 += 2;
      ++v20;
    }
    while (v2 != v20);
LABEL_47:
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
LABEL_53:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v4 = 0;
    unint64_t v6 = _swiftEmptyArrayStorage;
  }
  unint64_t v34 = v6[3];
  if (v34 < 2) {
    return (uint64_t)v6;
  }
  unint64_t v35 = v34 >> 1;
  BOOL v19 = __OFSUB__(v35, v4);
  uint64_t v36 = v35 - v4;
  if (!v19)
  {
    v6[2] = v36;
    return (uint64_t)v6;
  }
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_1000C33A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C33BC);
}

uint64_t sub_1000C33C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C33D4);
}

uint64_t sub_1000C33DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C33F0);
}

uint64_t sub_1000C33F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C3408);
}

uint64_t sub_1000C340C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C3420);
}

uint64_t sub_1000C3424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C3438);
}

uint64_t sub_1000C343C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    long long v7 = *((_OWORD *)a2 + 3);
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 48) = v7;
    *(void *)(a1 + 64) = a2[8];
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 11);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 13);
    *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 15);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 17);
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    *(void *)(a1 + 152) = a2[19];
    uint64_t v11 = sub_1000E5690();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v12(v9, v10, v11);
  }
  return v5;
}

uint64_t sub_1000C3590(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_1000E5690();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_1000C3620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  uint64_t v9 = sub_1000E5690();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_1000C3728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1000E5690();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_1000C3884(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v4;
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  long long v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  long long v7 = *(_OWORD *)(a2 + 32);
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v7;
  uint64_t v11 = sub_1000E5690();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_1000C3930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_release();
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000E5690();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000C3A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C3A40);
}

uint64_t sub_1000C3A44(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1000E5690();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000C3AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C3B08);
}

void *sub_1000C3B0C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  long long v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1000E5690();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1000C3BB4()
{
  uint64_t result = sub_1000E5690();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_1000C3C68()
{
  unint64_t result = qword_10012F068;
  if (!qword_10012F068)
  {
    sub_100008354(&qword_10012F070);
    sub_1000C2698();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F068);
  }
  return result;
}

uint64_t sub_1000C3CE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000C3D00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000C3D1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000C3D38()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000C3D54(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000C3DBC()
{
  return sub_1000C3EF0(type metadata accessor for TVWidgetSmall);
}

uint64_t sub_1000C3DD4(uint64_t a1)
{
  return sub_1000C48C8(a1, type metadata accessor for TVWidgetSmall, (uint64_t (*)(uint64_t, uint64_t))sub_1000BAC4C);
}

double sub_1000C3E00@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000BB8E0(a1, a2);
}

unint64_t sub_1000C3E08()
{
  unint64_t result = qword_10012F100;
  if (!qword_10012F100)
  {
    sub_100008354(&qword_10012F0E0);
    sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    sub_100014AC4(&qword_10012F110, &qword_10012F118);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F100);
  }
  return result;
}

uint64_t sub_1000C3ED8()
{
  return sub_1000C3EF0(type metadata accessor for TVWidgetMedium);
}

uint64_t sub_1000C3EF0(uint64_t (*a1)(void))
{
  uint64_t v2 = (int *)(a1(0) - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v1 + v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v8 = v7 + v2[9];
  uint64_t v9 = sub_1000E5690();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return _swift_deallocObject(v1, v5, v6);
}

uint64_t sub_1000C4004(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000C406C(uint64_t a1)
{
  return sub_1000C48C8(a1, type metadata accessor for TVWidgetMedium, (uint64_t (*)(uint64_t, uint64_t))sub_1000BBAA8);
}

unint64_t sub_1000C4098@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100095D5C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000C40C4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v2;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRelease();
}

unint64_t sub_1000C4108()
{
  unint64_t result = qword_10012F168;
  if (!qword_10012F168)
  {
    sub_100008354(&qword_10012F158);
    type metadata accessor for TVWidgetContentView(255);
    sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F168);
  }
  return result;
}

double sub_1000C41E8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000BC6E8(a1, a2);
}

unint64_t sub_1000C41F0()
{
  unint64_t result = qword_10012F1F8;
  if (!qword_10012F1F8)
  {
    sub_100008354(&qword_10012F1D0);
    sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    sub_100014AC4(&qword_10012F200, &qword_10012F208);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F1F8);
  }
  return result;
}

uint64_t sub_1000C42C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000BD854(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_1000C42C8()
{
  return sub_1000C3EF0(type metadata accessor for TVWidgetLarge);
}

uint64_t sub_1000C42E0(uint64_t a1)
{
  return sub_1000C48C8(a1, type metadata accessor for TVWidgetLarge, (uint64_t (*)(uint64_t, uint64_t))sub_1000BDE78);
}

uint64_t sub_1000C430C()
{
  return sub_1000C49D4(type metadata accessor for TVWidgetLarge);
}

uint64_t sub_1000C4324(uint64_t a1, uint64_t a2)
{
  return sub_1000C4B98(a1, a2, type metadata accessor for TVWidgetLarge, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))sub_1000BE418);
}

uint64_t sub_1000C4350()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000C4388(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

unint64_t sub_1000C43B8()
{
  unint64_t result = qword_10012F248;
  if (!qword_10012F248)
  {
    sub_100008354(&qword_10012F238);
    sub_1000C4434();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F248);
  }
  return result;
}

unint64_t sub_1000C4434()
{
  unint64_t result = qword_10012F250;
  if (!qword_10012F250)
  {
    sub_100008354(&qword_10012F258);
    sub_1000C4108();
    sub_100014AC4(&qword_10012F260, &qword_10012F268);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F250);
  }
  return result;
}

unint64_t sub_1000C44D4()
{
  unint64_t result = qword_10012F288;
  if (!qword_10012F288)
  {
    sub_100008354(&qword_10012F280);
    sub_1000C4574();
    sub_100014AC4(&qword_10012F298, &qword_10012F2A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F288);
  }
  return result;
}

unint64_t sub_1000C4574()
{
  unint64_t result = qword_10012F290;
  if (!qword_10012F290)
  {
    sub_100008354(&qword_10012F1E0);
    sub_100008354(&qword_10012F1D0);
    sub_1000C41F0();
    swift_getOpaqueTypeConformance2();
    sub_1000C29AC(&qword_10012F108, (void (*)(uint64_t))type metadata accessor for TVWidgetContentView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F290);
  }
  return result;
}

uint64_t sub_1000C4654()
{
  return sub_1000C3EF0(type metadata accessor for TVWidgetLarge);
}

uint64_t sub_1000C466C@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for TVWidgetLarge(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000BD9B0(a1, v6, a2);
}

uint64_t sub_1000C46EC()
{
  uint64_t v1 = (int *)(type metadata accessor for TVWidgetLarge(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[9];
  uint64_t v7 = sub_1000E5690();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_1000C4800@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for TVWidgetLarge(0) - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1000BDAE4(v4, v5, a1);
}

uint64_t sub_1000C4884()
{
  return sub_1000C3EF0(type metadata accessor for TVWidgetExtraLarge);
}

uint64_t sub_1000C489C(uint64_t a1)
{
  return sub_1000C48C8(a1, type metadata accessor for TVWidgetExtraLarge, (uint64_t (*)(uint64_t, uint64_t))sub_1000BF308);
}

uint64_t sub_1000C48C8(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a2(0) - 8);
  uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a1, v6);
}

uint64_t sub_1000C4960()
{
  return sub_1000C3EF0(type metadata accessor for TVWidgetExtraLarge);
}

uint64_t sub_1000C4978@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000C4CCC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1000C15C0, a2);
}

uint64_t sub_1000C4990(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000C49BC()
{
  return sub_1000C49D4(type metadata accessor for TVWidgetExtraLarge);
}

uint64_t sub_1000C49D4(uint64_t (*a1)(void))
{
  uint64_t v2 = (int *)(a1(0) - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = sub_1000E4100();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v12 = v1 + v4 + v2[9];
  uint64_t v13 = sub_1000E5690();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1 + v9, v6);

  return _swift_deallocObject(v1, v10, v11);
}

uint64_t sub_1000C4B6C(uint64_t a1, uint64_t a2)
{
  return sub_1000C4B98(a1, a2, type metadata accessor for TVWidgetExtraLarge, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))sub_1000C1A90);
}

uint64_t sub_1000C4B98(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(uint64_t, uint64_t, unint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(a3(0) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(sub_1000E4100() - 8);
  uint64_t v11 = v4 + ((v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));

  return a4(a1, a2, v4 + v8, v11);
}

uint64_t sub_1000C4C9C()
{
  return sub_1000C3EF0(type metadata accessor for TVWidgetExtraLarge);
}

uint64_t sub_1000C4CB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000C4CCC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1000BFFF8, a2);
}

uint64_t sub_1000C4CCC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(type metadata accessor for TVWidgetExtraLarge(0) - 8);
  return sub_1000C154C(a1, v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a2, a3);
}

uint64_t sub_1000C4D48()
{
  return sub_1000C49D4(type metadata accessor for TVWidgetExtraLarge);
}

uint64_t sub_1000C4D60(uint64_t a1, uint64_t a2)
{
  return sub_1000C4B98(a1, a2, type metadata accessor for TVWidgetExtraLarge, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))sub_1000C04A4);
}

ValueMetadata *type metadata accessor for BoundsPreferenceKey()
{
  return &type metadata for BoundsPreferenceKey;
}

uint64_t sub_1000C4D9C()
{
  return sub_100014AC4(&qword_10012F2E8, &qword_10012F2F0);
}

uint64_t sub_1000C4DD8()
{
  return sub_100014AC4(&qword_10012F2F8, &qword_10012F300);
}

uint64_t sub_1000C4E14()
{
  return sub_100014AC4(&qword_10012F308, &qword_10012F310);
}

unint64_t sub_1000C4E54()
{
  unint64_t result = qword_10012F318;
  if (!qword_10012F318)
  {
    sub_100008354(&qword_10012F320);
    sub_1000C4EF4();
    sub_100014AC4(&qword_10012F348, &qword_10012F350);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F318);
  }
  return result;
}

unint64_t sub_1000C4EF4()
{
  unint64_t result = qword_10012F328;
  if (!qword_10012F328)
  {
    sub_100008354(&qword_10012F330);
    sub_100014AC4(&qword_10012F338, &qword_10012F340);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F328);
  }
  return result;
}

uint64_t sub_1000C4F94(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000C4FE4()
{
  unint64_t result = qword_10012F368;
  if (!qword_10012F368)
  {
    sub_100008354(&qword_10012C218);
    sub_1000C5084();
    sub_100014AC4(&qword_10012A258, &qword_10012A260);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F368);
  }
  return result;
}

unint64_t sub_1000C5084()
{
  unint64_t result = qword_10012F370;
  if (!qword_10012F370)
  {
    sub_100008354(&qword_10012C210);
    sub_1000C29AC(&qword_10012F378, (void (*)(uint64_t))type metadata accessor for TVWidgetMetadataView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F370);
  }
  return result;
}

uint64_t sub_1000C5130(uint64_t a1)
{
  uint64_t v13 = *(void *)(a1 + 216);
  uint64_t v2 = *(void *)(a1 + 224);
  uint64_t v3 = *(void *)(a1 + 232);
  uint64_t v4 = *(void *)(a1 + 240);
  uint64_t v5 = *(void *)(a1 + 248);
  uint64_t v6 = *(void *)(a1 + 256);
  uint64_t v7 = *(void *)(a1 + 264);
  uint64_t v8 = *(void *)(a1 + 272);
  long long v12 = *(_OWORD *)(a1 + 280);
  uint64_t v9 = *(void *)(a1 + 296);
  char v10 = *(unsigned char *)(a1 + 304);
  sub_1000C5214(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(unsigned char *)(a1 + 144));
  sub_10003ABCC(v13, v2, v3, v4, v5, v6, v7, v8, v12, *((uint64_t *)&v12 + 1), v9, v10);
  return a1;
}

uint64_t sub_1000C5214(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned __int8 a14)
{
  if (a14 != 255) {
    return sub_10003AE38(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14 & 1);
  }
  return result;
}

uint64_t sub_1000C5248(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 192);
  uint64_t v14 = *(void *)(a1 + 184);
  uint64_t v3 = *(void *)(a1 + 200);
  uint64_t v4 = *(void *)(a1 + 208);
  uint64_t v5 = *(void *)(a1 + 216);
  uint64_t v6 = *(void *)(a1 + 224);
  uint64_t v7 = *(void *)(a1 + 232);
  uint64_t v8 = *(void *)(a1 + 240);
  long long v12 = *(_OWORD *)(a1 + 264);
  long long v13 = *(_OWORD *)(a1 + 248);
  uint64_t v9 = *(void *)(a1 + 280);
  unsigned __int8 v10 = *(unsigned char *)(a1 + 288);
  sub_10003ABCC(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(unsigned char *)(a1 + 112));
  sub_1000C5214(v14, v2, v3, v4, v5, v6, v7, v8, v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v9, v10);
  return a1;
}

uint64_t sub_1000C533C@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v6 = sub_1000E4270();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000E42C0();
  __chkstk_darwin(v7 - 8);
  sub_1000E42B0();
  sub_1000082B4(&qword_10012F390);
  sub_1000E4290();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000F3BF0;
  sub_1000E4250();
  sub_1000E42A0();
  sub_1000E4260();
  sub_1000E42A0();
  sub_1000E4250();
  sub_1000E42A0();
  sub_1000E4260();
  sub_1000E42A0();
  sub_1000E42D0();
  uint64_t v8 = (int *)type metadata accessor for SportsWidgetPlayByPlayLayout();
  *(void *)(a1 + v8[5]) = 0x4000000000000000;
  *(void *)(a1 + v8[6]) = 0x7FF0000000000000;
  uint64_t v9 = v8[7];
  id v10 = [self labelColor];
  *(void *)(a1 + v9) = sub_1000E4BD0();
  uint64_t v11 = v8[8];
  *(void *)(a1 + v11) = sub_1000E47C0();
  *(double *)(a1 + v8[9]) = a2;
  *(void *)(a1 + v8[10]) = 0x4008000000000000;
  *(void *)(a1 + v8[11]) = 0x3FF8000000000000;
  uint64_t v12 = v8[12];
  sub_1000E4C40();
  uint64_t v13 = sub_1000E4C50();
  uint64_t result = swift_release();
  *(void *)(a1 + v12) = v13;
  *(void *)(a1 + v8[13]) = 0x3FF0000000000000;
  *(double *)(a1 + v8[14]) = a3;
  return result;
}

uint64_t type metadata accessor for SportsWidgetPlayByPlayLayout()
{
  uint64_t result = qword_10012F3F0;
  if (!qword_10012F3F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_1000C5684(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_1000E4320();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)v4 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)v4 + v8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)v4 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v10 = a3[10];
    *(uint64_t *)((char *)v4 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)v4 + v10) = *(uint64_t *)((char *)a2 + v10);
    uint64_t v11 = a3[12];
    *(uint64_t *)((char *)v4 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    *(uint64_t *)((char *)v4 + v11) = *(uint64_t *)((char *)a2 + v11);
    uint64_t v12 = a3[14];
    *(uint64_t *)((char *)v4 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
    *(uint64_t *)((char *)v4 + v12) = *(uint64_t *)((char *)a2 + v12);
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000C57C0(uint64_t a1)
{
  uint64_t v2 = sub_1000E4320();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_1000C584C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000E4320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_1000C593C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000E4320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  return a1;
}

uint64_t sub_1000C5A54(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000E4320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  return a1;
}

uint64_t sub_1000C5B28(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000E4320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_release();
  uint64_t v8 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  swift_release();
  uint64_t v10 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  return a1;
}

uint64_t sub_1000C5C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C5C2C);
}

uint64_t sub_1000C5C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000E4320();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1000C5CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C5D00);
}

uint64_t sub_1000C5D00(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000E4320();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1000C5DBC()
{
  uint64_t result = sub_1000E4320();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_1000C5E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v75 = a4;
  uint64_t v71 = a3;
  uint64_t v6 = sub_1000E5020();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000E5040();
  uint64_t v77 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v76 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000E5010();
  uint64_t v68 = *(void *)(v12 - 8);
  uint64_t v69 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (uint64_t *)((char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v74 = sub_1000E5060();
  uint64_t v72 = *(void *)(v74 - 8);
  uint64_t v15 = __chkstk_darwin(v74);
  uint64_t v17 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  BOOL v19 = (char *)&v62 - v18;
  uint64_t v78 = swift_allocObject();
  uint64_t v70 = a1;
  swift_unknownObjectWeakInit();
  id result = sub_1000054E4();
  if (a2 >= 1)
  {
    id v66 = result;
    uint64_t v67 = v9;
    if (result)
    {
      uint64_t v63 = v10;
      uint64_t v64 = v7;
      uint64_t v65 = v6;
      sub_1000082B4(&qword_10012A900);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_1000F0F50;
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        unint64_t v23 = (void *)Strong;
        uint64_t v80 = (void *)sub_100089108(0, &qword_10012F450);
        unint64_t v81 = sub_1000C6704();
        aBlock[0] = v23;
        sub_100089108(0, (unint64_t *)&qword_10012A908);
        id v24 = v23;
        uint64_t v62 = a2;
        id v25 = v24;
        uint64_t v26 = v19;
        int64_t v27 = (void *)sub_1000E5C10();
        uint64_t v28 = swift_allocObject();
        *(_OWORD *)(v28 + 16) = xmmword_1000EF780;
        sub_1000C676C((uint64_t)aBlock, v28 + 32);
        uint64_t v29 = (void *)sub_1000E5C20();

        BOOL v19 = v26;
        uint64_t v30 = sub_1000E5A10();
        unint64_t v32 = v31;

        sub_100088648((uint64_t)aBlock);
        a2 = v62;
      }
      else
      {
        uint64_t v30 = 0x3E6C6C756E3CLL;
        unint64_t v32 = 0xE600000000000000;
      }
      *(void *)(v21 + 56) = &type metadata for String;
      unint64_t v45 = sub_10001D7B4();
      *(void *)(v21 + 32) = v30;
      *(void *)(v21 + 40) = v32;
      *(void *)(v21 + 96) = &type metadata for Int;
      *(void *)(v21 + 104) = &protocol witness table for Int;
      *(void *)(v21 + 64) = v45;
      *(void *)(v21 + 72) = a2;
      sub_1000E5B90();
      uint64_t v46 = v66;
      sub_1000E3F40();

      swift_bridgeObjectRelease();
      id v47 = v73;
      [v73 addOperation:v70];
      sub_100089108(0, (unint64_t *)&qword_10012C3F0);
      uint64_t v70 = sub_1000E5BD0();
      sub_1000E5050();
      uint64_t v48 = -750;
      if ((unint64_t)a2 <= 0x2EE) {
        uint64_t v48 = 0;
      }
      *uint64_t v14 = v48 + a2;
      uint64_t v50 = v68;
      uint64_t v49 = v69;
      (*(void (**)(void *, void, uint64_t))(v68 + 104))(v14, enum case for DispatchTimeInterval.milliseconds(_:), v69);
      sub_1000E5080();
      (*(void (**)(void *, uint64_t))(v50 + 8))(v14, v49);
      uint64_t v72 = *(void *)(v72 + 8);
      uint64_t v51 = v17;
      uint64_t v52 = v74;
      ((void (*)(char *, uint64_t))v72)(v51, v74);
      uint64_t v53 = (void *)swift_allocObject();
      v53[2] = v78;
      v53[3] = v47;
      uint64_t v54 = v71;
      v53[4] = a2;
      v53[5] = v54;
      v53[6] = v75;
      unint64_t v81 = (unint64_t)sub_1000C6F1C;
      uint64_t v82 = v53;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000864FC;
      uint64_t v80 = &unk_100123E10;
      uint64_t v55 = _Block_copy(aBlock);
      swift_retain();
      id v56 = v47;
      swift_retain();
      swift_release();
      uint64_t v57 = v76;
      sub_1000E5030();
      aBlock[0] = _swiftEmptyArrayStorage;
      sub_10005401C();
      sub_1000082B4(&qword_10012C400);
      sub_100054074();
      uint64_t v58 = v67;
      uint64_t v59 = v65;
      sub_1000E5CA0();
      int v60 = (void *)v70;
      sub_1000E5BC0();
      _Block_release(v55);

      (*(void (**)(char *, uint64_t))(v64 + 8))(v58, v59);
      (*(void (**)(char *, uint64_t))(v77 + 8))(v57, v63);
      ((void (*)(char *, uint64_t))v72)(v19, v52);
      return (id)swift_release();
    }
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }
  if (!result) {
    goto LABEL_16;
  }
  uint64_t v33 = result;
  sub_1000082B4(&qword_10012A900);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_1000F0F50;
  uint64_t v35 = swift_unknownObjectWeakLoadStrong();
  if (v35)
  {
    uint64_t v36 = (void *)v35;
    uint64_t v80 = (void *)sub_100089108(0, &qword_10012F450);
    unint64_t v81 = sub_1000C6704();
    aBlock[0] = v36;
    sub_100089108(0, (unint64_t *)&qword_10012A908);
    id v37 = v36;
    uint64_t v38 = (void *)sub_1000E5C10();
    uint64_t v39 = swift_allocObject();
    *(_OWORD *)(v39 + 16) = xmmword_1000EF780;
    sub_1000C676C((uint64_t)aBlock, v39 + 32);
    uint64_t v40 = a2;
    uint64_t v41 = (void *)sub_1000E5C20();

    uint64_t v42 = sub_1000E5A10();
    unint64_t v44 = v43;

    a2 = v40;
    sub_100088648((uint64_t)aBlock);
  }
  else
  {
    uint64_t v42 = 0x3E6C6C756E3CLL;
    unint64_t v44 = 0xE600000000000000;
  }
  *(void *)(v34 + 56) = &type metadata for String;
  unint64_t v61 = sub_10001D7B4();
  *(void *)(v34 + 32) = v42;
  *(void *)(v34 + 40) = v44;
  *(void *)(v34 + 96) = &type metadata for Int;
  *(void *)(v34 + 104) = &protocol witness table for Int;
  *(void *)(v34 + 64) = v61;
  *(void *)(v34 + 72) = a2;
  sub_1000E5B90();
  sub_1000E3F40();
  swift_release();

  return (id)swift_bridgeObjectRelease();
}

uint64_t sub_1000C66CC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

unint64_t sub_1000C6704()
{
  unint64_t result = qword_10012F458;
  if (!qword_10012F458)
  {
    sub_100089108(255, &qword_10012F450);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F458);
  }
  return result;
}

uint64_t sub_1000C676C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1000C67D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v58 = a5;
  uint64_t v60 = a4;
  uint64_t v57 = a3;
  uint64_t v6 = sub_1000E5020();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000E5040();
  uint64_t v66 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v65 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000E5010();
  uint64_t v59 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (uint64_t *)((char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_1000E5060();
  uint64_t v63 = *(void *)(v15 - 8);
  uint64_t v64 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  unint64_t v61 = (char *)&v50 - v19;
  uint64_t v62 = a1;
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v21 = Strong;
    unsigned int v22 = [Strong isExecuting];

    if (v22)
    {
      id v56 = v9;
      id v55 = sub_1000054E4();
      if (v55)
      {
        uint64_t v53 = v10;
        uint64_t v54 = v7;
        sub_1000082B4(&qword_10012A900);
        uint64_t v23 = swift_allocObject();
        long long v52 = xmmword_1000EF780;
        *(_OWORD *)(v23 + 16) = xmmword_1000EF780;
        swift_beginAccess();
        uint64_t v24 = swift_unknownObjectWeakLoadStrong();
        if (v24)
        {
          id v25 = (void *)v24;
          uint64_t v68 = (void *)sub_100089108(0, &qword_10012F450);
          unint64_t v69 = sub_1000C6704();
          aBlock[0] = v25;
          sub_100089108(0, (unint64_t *)&qword_10012A908);
          id v51 = v25;
          uint64_t v26 = v6;
          int64_t v27 = (void *)sub_1000E5C10();
          uint64_t v28 = swift_allocObject();
          *(_OWORD *)(v28 + 16) = v52;
          sub_1000C676C((uint64_t)aBlock, v28 + 32);
          uint64_t v29 = (void *)sub_1000E5C20();

          uint64_t v6 = v26;
          uint64_t v30 = sub_1000E5A10();
          unint64_t v32 = v31;

          sub_100088648((uint64_t)aBlock);
          id v33 = v51;
        }
        else
        {
          unint64_t v32 = 0xE600000000000000;
          uint64_t v30 = 0x3E6C6C756E3CLL;
        }
        uint64_t v34 = v58;
        uint64_t v35 = v57;
        *(void *)(v23 + 56) = &type metadata for String;
        *(void *)(v23 + 64) = sub_10001D7B4();
        *(void *)(v23 + 32) = v30;
        *(void *)(v23 + 40) = v32;
        sub_1000E5B90();
        uint64_t v36 = v55;
        sub_1000E3F40();

        swift_bridgeObjectRelease();
        swift_beginAccess();
        id v37 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v37)
        {
          uint64_t v38 = v37;
          [v37 cancel];
        }
        sub_100089108(0, (unint64_t *)&qword_10012C3F0);
        uint64_t v58 = sub_1000E5BD0();
        sub_1000E5050();
        uint64_t v39 = 750;
        if (v35 <= 750) {
          uint64_t v39 = 0;
        }
        *uint64_t v14 = v39;
        uint64_t v40 = v59;
        (*(void (**)(uint64_t *, void, uint64_t))(v59 + 104))(v14, enum case for DispatchTimeInterval.milliseconds(_:), v12);
        uint64_t v41 = v61;
        sub_1000E5080();
        (*(void (**)(uint64_t *, uint64_t))(v40 + 8))(v14, v12);
        uint64_t v42 = v64;
        unint64_t v43 = *(void (**)(char *, uint64_t))(v63 + 8);
        v43(v18, v64);
        unint64_t v44 = (void *)swift_allocObject();
        uint64_t v45 = v60;
        v44[2] = v62;
        v44[3] = v45;
        v44[4] = v34;
        unint64_t v69 = (unint64_t)sub_1000C71B4;
        uint64_t v70 = v44;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1000864FC;
        uint64_t v68 = &unk_100123E60;
        uint64_t v46 = _Block_copy(aBlock);
        swift_retain();
        swift_retain();
        swift_release();
        id v47 = v65;
        sub_1000E5030();
        aBlock[0] = _swiftEmptyArrayStorage;
        sub_10005401C();
        sub_1000082B4(&qword_10012C400);
        sub_100054074();
        uint64_t v48 = v56;
        sub_1000E5CA0();
        uint64_t v49 = (void *)v58;
        sub_1000E5BC0();
        _Block_release(v46);

        (*(void (**)(char *, uint64_t))(v54 + 8))(v48, v6);
        (*(void (**)(char *, uint64_t))(v66 + 8))(v47, v53);
        v43(v41, v42);
      }
      else
      {
        __break(1u);
      }
    }
  }
}

uint64_t sub_1000C6ED4()
{
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_1000C6F1C()
{
  sub_1000C67D0(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_1000C6F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000C6F3C()
{
  return swift_release();
}

void sub_1000C6F44(uint64_t a1, void (*a2)(uint64_t))
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = Strong;
    unsigned __int8 v5 = [Strong isFinished];

    if ((v5 & 1) == 0)
    {
      id v6 = sub_1000054E4();
      if (v6)
      {
        uint64_t v7 = v6;
        sub_1000082B4(&qword_10012A900);
        uint64_t v8 = swift_allocObject();
        *(_OWORD *)(v8 + 16) = xmmword_1000EF780;
        swift_beginAccess();
        uint64_t v9 = swift_unknownObjectWeakLoadStrong();
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          v19[3] = sub_100089108(0, &qword_10012F450);
          v19[4] = sub_1000C6704();
          v19[0] = v10;
          sub_100089108(0, (unint64_t *)&qword_10012A908);
          id v11 = v10;
          uint64_t v12 = (void *)sub_1000E5C10();
          uint64_t v13 = swift_allocObject();
          *(_OWORD *)(v13 + 16) = xmmword_1000EF780;
          sub_1000C676C((uint64_t)v19, v13 + 32);
          uint64_t v14 = (void *)sub_1000E5C20();

          uint64_t v15 = sub_1000E5A10();
          unint64_t v17 = v16;

          sub_100088648((uint64_t)v19);
        }
        else
        {
          unint64_t v17 = 0xE600000000000000;
          uint64_t v15 = 0x3E6C6C756E3CLL;
        }
        *(void *)(v8 + 56) = &type metadata for String;
        *(void *)(v8 + 64) = sub_10001D7B4();
        *(void *)(v8 + 32) = v15;
        *(void *)(v8 + 40) = v17;
        sub_1000E5B90();
        sub_1000E3F40();

        uint64_t v18 = swift_bridgeObjectRelease();
        a2(v18);
      }
      else
      {
        __break(1u);
      }
    }
  }
}

uint64_t sub_1000C7174()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_1000C71B4()
{
  sub_1000C6F44(*(void *)(v0 + 16), *(void (**)(uint64_t))(v0 + 24));
}

unint64_t sub_1000C71CC()
{
  unint64_t result = qword_10012F460;
  if (!qword_10012F460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F460);
  }
  return result;
}

uint64_t sub_1000C7220()
{
  return sub_100014AC4(&qword_10012F468, &qword_10012F470);
}

uint64_t sub_1000C725C(uint64_t a1, void *a2)
{
  return sub_1000C7458(a1, a2, (uint64_t)&type metadata for TVSettingsSelectedAudioLanguageEntity, &qword_10012A588);
}

uint64_t sub_1000C7270(uint64_t a1, void *a2)
{
  return sub_1000C7458(a1, a2, (uint64_t)&type metadata for TVSettingsUsePlayHistoryEntity, &qword_10012CD90);
}

uint64_t sub_1000C7284(uint64_t a1, void *a2)
{
  return sub_1000C7458(a1, a2, (uint64_t)&type metadata for TVSettingsShowSportsScoresEntity, &qword_10012B0C0);
}

uint64_t sub_1000C7298(uint64_t a1, void *a2)
{
  return sub_1000C7458(a1, a2, (uint64_t)&type metadata for TVSettingsPurchaseDefinitionEntity, &qword_10012CD78);
}

uint64_t sub_1000C72AC(uint64_t a1, void *a2)
{
  return sub_1000C7458(a1, a2, (uint64_t)&type metadata for TVSettingsDownloadUseCellularEntity, &qword_10012CA90);
}

uint64_t sub_1000C72C0(uint64_t a1, void *a2)
{
  return sub_1000C7314(a1, a2, (void (*)(void))type metadata accessor for TVSettingsDownloadWifiQualityEntity, &qword_10012CD70);
}

uint64_t sub_1000C72E0(uint64_t a1, void *a2)
{
  return sub_1000C7458(a1, a2, (uint64_t)&type metadata for TVSettingsPlaybackUseCellularEntity, &qword_10012A7C8);
}

uint64_t sub_1000C72F4(uint64_t a1, void *a2)
{
  return sub_1000C7314(a1, a2, (void (*)(void))type metadata accessor for TVSettingsPlaybackWifiQualityEntity, &qword_10012CD68);
}

uint64_t sub_1000C7314(uint64_t a1, void *a2, void (*a3)(void), uint64_t *a4)
{
  sub_1000E5CC0(25);
  swift_bridgeObjectRelease();
  a3(0);
  sub_1000082B4(a4);
  v9._countAndFlagsBits = sub_1000E5A20();
  sub_1000E5A70(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 2108704;
  v10._object = (void *)0xE300000000000000;
  sub_1000E5A70(v10);
  v11._countAndFlagsBits = a1;
  v11._object = a2;
  sub_1000E5A70(v11);
  sub_1000E3EF0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C7408(uint64_t a1, void *a2)
{
  return sub_1000C7458(a1, a2, (uint64_t)&type metadata for TVSettingsUseDownloadAVAdapterEntity, &qword_10012B3D0);
}

uint64_t sub_1000C741C(uint64_t a1, void *a2)
{
  return sub_1000C7458(a1, a2, (uint64_t)&type metadata for TVSettingsDownloadCellularQualityEntity, &qword_10012CD88);
}

uint64_t sub_1000C7430(uint64_t a1, void *a2)
{
  return sub_1000C7458(a1, a2, (uint64_t)&type metadata for TVSettingsPlaybackCellularQualityEntity, &qword_10012CD80);
}

uint64_t sub_1000C7444(uint64_t a1, void *a2)
{
  return sub_1000C7458(a1, a2, (uint64_t)&type metadata for TVSettingsDownloadUseDefaultSubtitleLanguagesEntity, &qword_10012BCB8);
}

uint64_t sub_1000C7458(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4)
{
  sub_1000E5CC0(25);
  swift_bridgeObjectRelease();
  sub_1000082B4(a4);
  v8._countAndFlagsBits = sub_1000E5A20();
  sub_1000E5A70(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 2108704;
  v9._object = (void *)0xE300000000000000;
  sub_1000E5A70(v9);
  v10._countAndFlagsBits = a1;
  v10._object = a2;
  sub_1000E5A70(v10);
  sub_1000E3EF0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C7540()
{
  return sub_1000C7988(&qword_10012A588, (void (*)(void))sub_1000167CC);
}

uint64_t sub_1000C7568()
{
  return sub_1000C7988(&qword_10012A7C8, (void (*)(void))sub_10001A810);
}

uint64_t sub_1000C7590()
{
  return sub_1000C7988(&qword_10012B0C0, (void (*)(void))sub_10002EFA4);
}

uint64_t sub_1000C75B8()
{
  return sub_1000C7988(&qword_10012B3D0, (void (*)(void))sub_10003223C);
}

uint64_t sub_1000C75E0()
{
  return sub_1000C7988(&qword_10012BCB8, (void (*)(void))sub_100046D34);
}

uint64_t sub_1000C7608()
{
  return sub_1000C7988(&qword_10012CA90, (void (*)(void))sub_100062670);
}

uint64_t sub_1000C7630()
{
  return sub_1000C7988(&qword_10012CD90, (void (*)(void))sub_10007D214);
}

uint64_t sub_1000C7658()
{
  return sub_1000C7988(&qword_10012CD80, (void (*)(void))sub_10008AA94);
}

uint64_t sub_1000C7680()
{
  sub_1000082B4(&qword_10012CD68);
  uint64_t v0 = sub_1000E5A20();
  uint64_t v2 = v1;
  if (qword_100129D20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = off_10012CC58;
  if (*((void *)off_10012CC58 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v4 = sub_1000354E4(v0, v2);
    if (v5) {
      unint64_t v6 = *(unsigned __int8 *)(v3[7] + v4);
    }
    else {
      unint64_t v6 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v6 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_1000ABC58(v6);
  type metadata accessor for TVSettingsPlaybackWifiQualityEntity();
  sub_1000CBC34(qword_10012D8C0, (void (*)(uint64_t))type metadata accessor for TVSettingsPlaybackWifiQualityEntity);
  return sub_1000E3C30();
}

uint64_t sub_1000C77DC()
{
  return sub_1000C7988(&qword_10012CD88, (void (*)(void))sub_100091A4C);
}

uint64_t sub_1000C7804()
{
  sub_1000082B4(&qword_10012CD70);
  uint64_t v0 = sub_1000E5A20();
  uint64_t v2 = v1;
  if (qword_100129D20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = off_10012CC58;
  if (*((void *)off_10012CC58 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v4 = sub_1000354E4(v0, v2);
    if (v5) {
      unint64_t v6 = *(unsigned __int8 *)(v3[7] + v4);
    }
    else {
      unint64_t v6 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v6 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_1000ABC58(v6);
  type metadata accessor for TVSettingsDownloadWifiQualityEntity();
  sub_1000CBC34(qword_10012E318, (void (*)(uint64_t))type metadata accessor for TVSettingsDownloadWifiQualityEntity);
  return sub_1000E3C30();
}

uint64_t sub_1000C7960()
{
  return sub_1000C7988(&qword_10012CD78, (void (*)(void))sub_1000B2FD4);
}

uint64_t sub_1000C7988(uint64_t *a1, void (*a2)(void))
{
  sub_1000082B4(a1);
  uint64_t v3 = sub_1000E5A20();
  uint64_t v5 = v4;
  if (qword_100129D20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  unint64_t v6 = off_10012CC58;
  if (*((void *)off_10012CC58 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1000354E4(v3, v5);
    if (v8) {
      unint64_t v9 = *(unsigned __int8 *)(v6[7] + v7);
    }
    else {
      unint64_t v9 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v9 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_1000ABC58(v9);
  a2();
  return sub_1000E3C30();
}

void sub_1000C7AB4(char a1, uint64_t a2, uint64_t a3)
{
  if (sub_100094258(a1) == 0x6E776F6E6B6E75 && v7 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_1000E3910();
    sub_1000CBC34((unint64_t *)&qword_10012A5B0, (void (*)(uint64_t))&type metadata accessor for AppIntentError);
    swift_allocError();
    sub_1000E38F0();
    swift_willThrow();
    return;
  }
  char v8 = sub_1000E5DC0();
  swift_bridgeObjectRelease();
  if (v8) {
    goto LABEL_5;
  }
  sub_100094258(a1);
  unint64_t v9 = *(void **)(v3 + 16);
  uint64_t v12 = a2;
  uint64_t v13 = a3;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1000E5DF0();
  NSString v11 = sub_1000E5A00();
  swift_bridgeObjectRelease();
  [v9 setValue:v10 forKey:v11];
  swift_unknownObjectRelease();
}

void sub_1000C7C48(char a1)
{
  if (sub_100094258(a1) == 0x6E776F6E6B6E75 && v3 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_1000E3910();
    sub_1000CBC34((unint64_t *)&qword_10012A5B0, (void (*)(uint64_t))&type metadata accessor for AppIntentError);
    swift_allocError();
    sub_1000E38F0();
    swift_willThrow();
    return;
  }
  char v4 = sub_1000E5DC0();
  swift_bridgeObjectRelease();
  if (v4) {
    goto LABEL_5;
  }
  sub_100094258(a1);
  uint64_t v5 = *(void **)(v1 + 16);
  uint64_t v6 = sub_1000E5DF0();
  NSString v7 = sub_1000E5A00();
  swift_bridgeObjectRelease();
  [v5 setValue:v6 forKey:v7];
  swift_unknownObjectRelease();
}

uint64_t sub_1000C7DCC(char a1)
{
  if (sub_100094258(a1) == 0x6E776F6E6B6E75 && v3 == 0xE700000000000000) {
    goto LABEL_3;
  }
  char v4 = sub_1000E5DC0();
  swift_bridgeObjectRelease();
  if (v4) {
    goto LABEL_5;
  }
  if (a1 == 7)
  {
    unint64_t v6 = 0xD000000000000022;
    NSString v7 = (void *)0x80000001000ECB50;
  }
  else
  {
    unint64_t v6 = sub_100094258(a1);
    NSString v7 = v8;
  }
  unint64_t v9 = *(void **)(v1 + 16);
  NSString v10 = sub_1000E5A00();
  id v11 = [v9 valueForKey:v10];

  if (v11)
  {
    sub_1000E5C80();
    swift_unknownObjectRelease();
    sub_1000CBC7C(&v13, v14);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_1000082B4(&qword_10012D578);
  if (!swift_dynamicCast())
  {
    *(void *)&v14[0] = 0;
    *((void *)&v14[0] + 1) = 0xE000000000000000;
    sub_1000E5CC0(21);
    swift_bridgeObjectRelease();
    *(void *)&v14[0] = 0xD000000000000013;
    *((void *)&v14[0] + 1) = 0x80000001000ECB00;
    v15._countAndFlagsBits = v6;
    v15._object = v7;
    sub_1000E5A70(v15);
    swift_bridgeObjectRelease();
    Swift::String v12 = (Swift::String)v14[0];
    *(void *)&v14[0] = 0;
    *((void *)&v14[0] + 1) = 0xE000000000000000;
    sub_1000E5CC0(42);
    swift_bridgeObjectRelease();
    *(void *)&v14[0] = 0xD000000000000028;
    *((void *)&v14[0] + 1) = 0x80000001000ECB20;
    sub_1000E5A70(v12);
    sub_1000E3EF0();
    swift_bridgeObjectRelease();
LABEL_3:
    swift_bridgeObjectRelease();
LABEL_5:
    sub_1000E3910();
    sub_1000CBC34((unint64_t *)&qword_10012A5B0, (void (*)(uint64_t))&type metadata accessor for AppIntentError);
    swift_allocError();
    sub_1000E38F0();
    return swift_willThrow();
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1000C806C(char a1)
{
  if (sub_100094258(a1) != 0x6E776F6E6B6E75 || v3 != 0xE700000000000000)
  {
    char v4 = sub_1000E5DC0();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_5;
    }
    if (a1 == 7)
    {
      unint64_t v7 = 0xD000000000000022;
      char v8 = (void *)0x80000001000ECB50;
    }
    else
    {
      unint64_t v7 = sub_100094258(a1);
      char v8 = v9;
    }
    NSString v10 = *(void **)(v1 + 16);
    NSString v11 = sub_1000E5A00();
    id v12 = [v10 valueForKey:v11];

    if (v12)
    {
      sub_1000E5C80();
      swift_unknownObjectRelease();
      sub_1000CBC7C(&v14, v15);
    }
    else
    {
      memset(v15, 0, sizeof(v15));
    }
    sub_1000082B4(&qword_10012D578);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      char v5 = v14 & 1;
      return v5 & 1;
    }
    *(void *)&v15[0] = 0;
    *((void *)&v15[0] + 1) = 0xE000000000000000;
    sub_1000E5CC0(21);
    swift_bridgeObjectRelease();
    *(void *)&v15[0] = 0xD000000000000013;
    *((void *)&v15[0] + 1) = 0x80000001000ECB00;
    v16._countAndFlagsBits = v7;
    v16._object = v8;
    sub_1000E5A70(v16);
    swift_bridgeObjectRelease();
    Swift::String v13 = (Swift::String)v15[0];
    *(void *)&v15[0] = 0;
    *((void *)&v15[0] + 1) = 0xE000000000000000;
    sub_1000E5CC0(42);
    swift_bridgeObjectRelease();
    *(void *)&v15[0] = 0xD000000000000028;
    *((void *)&v15[0] + 1) = 0x80000001000ECB20;
    sub_1000E5A70(v13);
    sub_1000E3EF0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_5:
  sub_1000E3910();
  sub_1000CBC34((unint64_t *)&qword_10012A5B0, (void (*)(uint64_t))&type metadata accessor for AppIntentError);
  swift_allocError();
  sub_1000E38F0();
  swift_willThrow();
  return v5 & 1;
}

uint64_t sub_1000C8314(char a1)
{
  if (sub_100094258(a1) == 0x6E776F6E6B6E75 && v3 == 0xE700000000000000) {
    goto LABEL_3;
  }
  char v4 = sub_1000E5DC0();
  swift_bridgeObjectRelease();
  if (v4) {
    goto LABEL_5;
  }
  if (a1 == 7)
  {
    unint64_t v6 = 0xD000000000000022;
    unint64_t v7 = (void *)0x80000001000ECB50;
  }
  else
  {
    unint64_t v6 = sub_100094258(a1);
    unint64_t v7 = v8;
  }
  unint64_t v9 = *(void **)(v1 + 16);
  NSString v10 = sub_1000E5A00();
  id v11 = [v9 valueForKey:v10];

  if (v11)
  {
    sub_1000E5C80();
    swift_unknownObjectRelease();
    sub_1000CBC7C(&v13, v14);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_1000082B4(&qword_10012D578);
  sub_1000082B4(&qword_10012E288);
  if (!swift_dynamicCast())
  {
    *(void *)&v14[0] = 0;
    *((void *)&v14[0] + 1) = 0xE000000000000000;
    sub_1000E5CC0(21);
    swift_bridgeObjectRelease();
    *(void *)&v14[0] = 0xD000000000000013;
    *((void *)&v14[0] + 1) = 0x80000001000ECB00;
    v15._countAndFlagsBits = v6;
    v15._object = v7;
    sub_1000E5A70(v15);
    swift_bridgeObjectRelease();
    Swift::String v12 = (Swift::String)v14[0];
    *(void *)&v14[0] = 0;
    *((void *)&v14[0] + 1) = 0xE000000000000000;
    sub_1000E5CC0(42);
    swift_bridgeObjectRelease();
    *(void *)&v14[0] = 0xD000000000000028;
    *((void *)&v14[0] + 1) = 0x80000001000ECB20;
    sub_1000E5A70(v12);
    sub_1000E3EF0();
    swift_bridgeObjectRelease();
LABEL_3:
    swift_bridgeObjectRelease();
LABEL_5:
    sub_1000E3910();
    sub_1000CBC34((unint64_t *)&qword_10012A5B0, (void (*)(uint64_t))&type metadata accessor for AppIntentError);
    swift_allocError();
    sub_1000E38F0();
    return swift_willThrow();
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1000C85C0(char a1)
{
  if (sub_100094258(a1) == 0x6E776F6E6B6E75 && v3 == 0xE700000000000000) {
    goto LABEL_3;
  }
  char v4 = sub_1000E5DC0();
  swift_bridgeObjectRelease();
  if (v4) {
    goto LABEL_5;
  }
  if (a1 == 7)
  {
    unint64_t v6 = 0xD000000000000022;
    unint64_t v7 = (void *)0x80000001000ECB50;
  }
  else
  {
    unint64_t v6 = sub_100094258(a1);
    unint64_t v7 = v8;
  }
  unint64_t v9 = *(void **)(v1 + 16);
  NSString v10 = sub_1000E5A00();
  id v11 = [v9 valueForKey:v10];

  if (v11)
  {
    sub_1000E5C80();
    swift_unknownObjectRelease();
    sub_1000CBC7C(&v13, v14);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_1000082B4(&qword_10012D578);
  sub_1000082B4(&qword_10012F638);
  if (!swift_dynamicCast())
  {
    *(void *)&v14[0] = 0;
    *((void *)&v14[0] + 1) = 0xE000000000000000;
    sub_1000E5CC0(21);
    swift_bridgeObjectRelease();
    *(void *)&v14[0] = 0xD000000000000013;
    *((void *)&v14[0] + 1) = 0x80000001000ECB00;
    v15._countAndFlagsBits = v6;
    v15._object = v7;
    sub_1000E5A70(v15);
    swift_bridgeObjectRelease();
    Swift::String v12 = (Swift::String)v14[0];
    *(void *)&v14[0] = 0;
    *((void *)&v14[0] + 1) = 0xE000000000000000;
    sub_1000E5CC0(42);
    swift_bridgeObjectRelease();
    *(void *)&v14[0] = 0xD000000000000028;
    *((void *)&v14[0] + 1) = 0x80000001000ECB20;
    sub_1000E5A70(v12);
    sub_1000E3EF0();
    swift_bridgeObjectRelease();
LABEL_3:
    swift_bridgeObjectRelease();
LABEL_5:
    sub_1000E3910();
    sub_1000CBC34((unint64_t *)&qword_10012A5B0, (void (*)(uint64_t))&type metadata accessor for AppIntentError);
    swift_allocError();
    sub_1000E38F0();
    return swift_willThrow();
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1000C886C()
{
  uint64_t v0 = sub_1000082B4(&qword_10012A580);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000E3D90();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  char v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E3F10();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000E59F0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000E3DA0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_1000E3C50();
  sub_100008434(v10, qword_100142360);
  sub_100008498(v10, (uint64_t)qword_100142360);
  sub_1000E5990();
  sub_1000E3F00();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000E3DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_1000E3C40();
}

uint64_t sub_1000C8B54()
{
  uint64_t v0 = sub_1000E3DA0();
  sub_100008434(v0, qword_100142378);
  sub_100008498(v0, (uint64_t)qword_100142378);
  return sub_1000E3D80();
}

uint64_t sub_1000C8BB8()
{
  uint64_t v0 = sub_1000082B4(&qword_10012A5F0);
  sub_100008434(v0, qword_100142390);
  uint64_t v1 = sub_100008498(v0, (uint64_t)qword_100142390);
  sub_1000E3AA0();
  uint64_t v2 = sub_1000E3AB0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_1000C8C70()
{
  uint64_t result = swift_getKeyPath();
  qword_1001423A8 = result;
  return result;
}

uint64_t sub_1000C8C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[15] = a2;
  v3[16] = a3;
  v3[14] = a1;
  return _swift_task_switch(sub_1000C8CBC, 0, 0);
}

uint64_t sub_1000C8CBC()
{
  sub_1000E3A40();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 40) = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 32);
  *(void *)(v0 + 136) = v1;
  *(void *)(v0 + 144) = v2;
  *(void *)(v0 + 48) = v1;
  *(void *)(v0 + 56) = v2;
  sub_1000E3A40();
  *(unsigned char *)(v0 + 225) = *(unsigned char *)(v0 + 226);
  if (qword_100129E80 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1001423A8;
  *(void *)(v0 + 152) = qword_1001423A8;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v4;
  uint64_t v5 = sub_100014AC4(&qword_10012F628, &qword_10012F630);
  *(void *)(v0 + 168) = v5;
  *uint64_t v4 = v0;
  v4[1] = sub_1000C8E20;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 225, v3, &type metadata for UpNextDisplayType, v5);
}

uint64_t sub_1000C8E20()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100019FEC;
  }
  else {
    uint64_t v2 = sub_1000C8F90;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000C8F90()
{
  sub_1000E3A40();
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  v0[23] = v2;
  v0[24] = v3;
  v0[8] = v1;
  v0[9] = v2;
  v0[10] = v3;
  uint64_t v4 = qword_1001423A8;
  v0[25] = qword_1001423A8;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[26] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1000C9078;
  uint64_t v6 = v0[21];
  return AppEntity._value<A, B>(for:)(v0 + 28, v4, v6);
}

uint64_t sub_1000C9078()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_10001A004;
  }
  else {
    uint64_t v2 = sub_1000C91E8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000C91E8()
{
  *(unsigned char *)(v0 + 227) = *(unsigned char *)(v0 + 224);
  sub_100035138();
  sub_1000E3A10();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000C9270()
{
  if (qword_100129E80 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_1000C92D0()
{
  unint64_t result = qword_10012F478;
  if (!qword_10012F478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F478);
  }
  return result;
}

unint64_t sub_1000C9328()
{
  unint64_t result = qword_10012F480;
  if (!qword_10012F480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F480);
  }
  return result;
}

uint64_t sub_1000C937C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000C93B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000C9400@<X0>(uint64_t a1@<X8>)
{
  return sub_1000171E8(&qword_100129E70, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100142378, a1);
}

uint64_t sub_1000C9438@<X0>(uint64_t a1@<X8>)
{
  if (qword_100129E78 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000082B4(&qword_10012A5F0);
  uint64_t v3 = sub_100008498(v2, (uint64_t)qword_100142390);

  return sub_1000185F8(v3, a1);
}

uint64_t sub_1000C94B4(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100015DF8;
  *(_OWORD *)(v4 + 120) = *v1;
  *(void *)(v4 + 112) = a1;
  return _swift_task_switch(sub_1000C8CBC, 0, 0);
}

uint64_t sub_1000C9568@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000CB570();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000C9590()
{
  return 0xD00000000000002ELL;
}

unint64_t sub_1000C95B0()
{
  unint64_t result = qword_10012F490;
  if (!qword_10012F490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F490);
  }
  return result;
}

unint64_t sub_1000C9608()
{
  unint64_t result = qword_10012F498;
  if (!qword_10012F498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F498);
  }
  return result;
}

uint64_t sub_1000C965C(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return _swift_task_switch(sub_1000C967C, 0, 0);
}

uint64_t sub_1000C967C()
{
  *(void *)(v0 + 16) = &type metadata for TVSettingsUpNextDisplayEntity;
  sub_1000082B4(&qword_10012CD98);
  uint64_t v1 = sub_1000E5A20();
  uint64_t v3 = v2;
  if (qword_100129D20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v4 = off_10012CC58;
  if (*((void *)off_10012CC58 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_1000354E4(v1, v3);
    if (v6) {
      char v7 = *(unsigned char *)(v4[7] + v5);
    }
    else {
      char v7 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v7 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_10006D92C(v7);
  if (qword_100129DE0 != -1) {
    swift_once();
  }
  *(void *)(v0 + 16) = &type metadata for TVSettingsUpNextDisplayEntity;
  uint64_t v8 = sub_1000E5A20();
  uint64_t v10 = v9;
  if (qword_100129DE8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v11 = off_10012DE48;
  if (*((void *)off_10012DE48 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_1000354E4(v8, v10);
    if (v13) {
      char v14 = *(unsigned char *)(v11[7] + v12);
    }
    else {
      char v14 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  char v15 = sub_1000C85C0(v14);
  if (v15 == 2) {
    goto LABEL_26;
  }
  if (v15) {
    v16._countAndFlagsBits = 49;
  }
  else {
    v16._countAndFlagsBits = 48;
  }
  v17._rawValue = &off_100120218;
  v16._object = (void *)0xE100000000000000;
  Swift::Int v18 = sub_1000E5DA0(v17, v16);
  swift_bridgeObjectRelease();
  if (!v18)
  {
    char v19 = 0;
    goto LABEL_31;
  }
  if (v18 != 1)
  {
LABEL_26:
    sub_1000E3910();
    sub_1000CBC34((unint64_t *)&qword_10012A5B0, (void (*)(uint64_t))&type metadata accessor for AppIntentError);
    swift_allocError();
    sub_1000E38F0();
    swift_willThrow();
    uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_27;
  }
  char v19 = 1;
LABEL_31:
  **(unsigned char **)(v0 + 40) = v19;
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
LABEL_27:
  return v20();
}

uint64_t sub_1000C99A8(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 41) = *a2;
  return _swift_task_switch(sub_1000C99CC, 0, 0);
}

uint64_t sub_1000C99CC()
{
  *(void *)(v0 + 16) = &type metadata for TVSettingsUpNextDisplayEntity;
  sub_1000082B4(&qword_10012CD98);
  uint64_t v1 = sub_1000E5A20();
  uint64_t v3 = v2;
  if (qword_100129D20 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v4 = off_10012CC58;
  if (*((void *)off_10012CC58 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_1000354E4(v1, v3);
    if (v6) {
      char v7 = *(unsigned char *)(v4[7] + v5);
    }
    else {
      char v7 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v7 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_10006D92C(v7);
  char v8 = *(unsigned char *)(v0 + 41);
  sub_1000E5CC0(33);
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0xE000000000000000;
  v19._object = (void *)0x80000001000ECAC0;
  v19._countAndFlagsBits = 0xD00000000000001FLL;
  sub_1000E5A70(v19);
  *(unsigned char *)(v0 + 40) = v8;
  sub_1000E5D50();
  sub_1000C7458(*(void *)(v0 + 16), *(void **)(v0 + 24), (uint64_t)&type metadata for TVSettingsUpNextDisplayEntity, &qword_10012CD98);
  swift_bridgeObjectRelease();
  if ((v8 & 1) == 0) {
    sub_1000E5DC0();
  }
  swift_bridgeObjectRelease();
  if (qword_100129DE0 != -1) {
    swift_once();
  }
  *(void *)(v0 + 16) = &type metadata for TVSettingsUpNextDisplayEntity;
  uint64_t v9 = sub_1000E5A20();
  uint64_t v11 = v10;
  if (qword_100129DE8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  unint64_t v12 = off_10012DE48;
  if (*((void *)off_10012DE48 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_1000354E4(v9, v11);
    if (v14) {
      char v15 = *(unsigned char *)(v12[7] + v13);
    }
    else {
      char v15 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v15 = 0;
  }
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_1000C7C48(v15);
  Swift::OpaquePointer v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_1000C9D00(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000C9D20, 0, 0);
}

uint64_t sub_1000C9D20()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  *uint64_t v1 = sub_1000CB960();
  v1[1] = v2;
  v1[2] = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

unint64_t sub_1000C9D90()
{
  unint64_t result = qword_10012F4A8;
  if (!qword_10012F4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F4A8);
  }
  return result;
}

uint64_t sub_1000C9DE4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000CA9E8();
  *uint64_t v4 = v2;
  v4[1] = sub_100016604;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000C9E98()
{
  unint64_t result = qword_10012F4B8;
  if (!qword_10012F4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F4B8);
  }
  return result;
}

unint64_t sub_1000C9EF0()
{
  unint64_t result = qword_10012F4C0;
  if (!qword_10012F4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F4C0);
  }
  return result;
}

unint64_t sub_1000C9F48()
{
  unint64_t result = qword_10012F4C8[0];
  if (!qword_10012F4C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10012F4C8);
  }
  return result;
}

uint64_t sub_1000C9F9C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000CA9E8();
  *unint64_t v5 = v2;
  v5[1] = sub_1000168D4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000CA050(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  unint64_t v5 = sub_1000CA9E8();
  *uint64_t v4 = v2;
  v4[1] = sub_100018660;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_1000CA104()
{
  unint64_t result = qword_10012F4E0;
  if (!qword_10012F4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F4E0);
  }
  return result;
}

unint64_t sub_1000CA15C()
{
  unint64_t result = qword_10012F4E8;
  if (!qword_10012F4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F4E8);
  }
  return result;
}

unint64_t sub_1000CA1B4()
{
  unint64_t result = qword_10012F4F0;
  if (!qword_10012F4F0)
  {
    sub_100008354(qword_10012F4F8);
    sub_1000CA15C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F4F0);
  }
  return result;
}

uint64_t sub_1000CA228(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000C9D90();
  *unint64_t v5 = v2;
  v5[1] = sub_100018664;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for TVSettingsUpNextDisplayEntity.Query()
{
  return &type metadata for TVSettingsUpNextDisplayEntity.Query;
}

ValueMetadata *type metadata accessor for TVSettingsUpNextDisplayEntity()
{
  return &type metadata for TVSettingsUpNextDisplayEntity;
}

ValueMetadata *type metadata accessor for TVSettingsUpNextDisplayEntity.UpdateIntent_value()
{
  return &type metadata for TVSettingsUpNextDisplayEntity.UpdateIntent_value;
}

uint64_t sub_1000CA30C()
{
  return sub_100014AC4(&qword_10012F510, &qword_10012F518);
}

uint64_t sub_1000CA348()
{
  return sub_1000C7988(&qword_10012CD98, (void (*)(void))sub_1000C9F48);
}

uint64_t sub_1000CA384()
{
  sub_1000CA778();
  uint64_t v2 = sub_1000E3BA0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100017844(v3, v0, v2, v1);
}

uint64_t sub_1000CA418@<X0>(uint64_t a1@<X8>)
{
  return sub_1000171E8(&qword_100129E68, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100142360, a1);
}

uint64_t sub_1000CA450(uint64_t a1)
{
  unint64_t v2 = sub_1000C9F48();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_1000CA49C(uint64_t a1)
{
  unint64_t v2 = sub_1000C9608();

  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_1000CA4E8(uint64_t a1)
{
  unint64_t v2 = sub_1000CA590();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000CA538()
{
  unint64_t result = qword_10012F520;
  if (!qword_10012F520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F520);
  }
  return result;
}

unint64_t sub_1000CA590()
{
  unint64_t result = qword_10012F530;
  if (!qword_10012F530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F530);
  }
  return result;
}

unint64_t sub_1000CA5E8()
{
  unint64_t result = qword_10012F538;
  if (!qword_10012F538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F538);
  }
  return result;
}

unint64_t sub_1000CA640()
{
  unint64_t result = qword_10012F540;
  if (!qword_10012F540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F540);
  }
  return result;
}

unint64_t sub_1000CA698()
{
  unint64_t result = qword_10012F548;
  if (!qword_10012F548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F548);
  }
  return result;
}

unint64_t sub_1000CA6EC(void *a1)
{
  a1[1] = sub_1000CA724();
  a1[2] = sub_1000CA778();
  unint64_t result = sub_1000C9608();
  a1[3] = result;
  return result;
}

unint64_t sub_1000CA724()
{
  unint64_t result = qword_10012F598;
  if (!qword_10012F598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F598);
  }
  return result;
}

unint64_t sub_1000CA778()
{
  unint64_t result = qword_10012F5A0;
  if (!qword_10012F5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F5A0);
  }
  return result;
}

unint64_t sub_1000CA7D0()
{
  unint64_t result = qword_10012F5A8;
  if (!qword_10012F5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F5A8);
  }
  return result;
}

unint64_t sub_1000CA824(uint64_t a1)
{
  unint64_t result = sub_1000CA84C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000CA84C()
{
  unint64_t result = qword_10012F5E0;
  if (!qword_10012F5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F5E0);
  }
  return result;
}

uint64_t sub_1000CA8A0()
{
  return sub_100014AC4(&qword_10012F5E8, &qword_10012F5F0);
}

unint64_t sub_1000CA8E0()
{
  unint64_t result = qword_10012F5F8;
  if (!qword_10012F5F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F5F8);
  }
  return result;
}

unint64_t sub_1000CA938()
{
  unint64_t result = qword_10012F600;
  if (!qword_10012F600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F600);
  }
  return result;
}

unint64_t sub_1000CA990()
{
  unint64_t result = qword_10012F608;
  if (!qword_10012F608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F608);
  }
  return result;
}

unint64_t sub_1000CA9E8()
{
  unint64_t result = qword_10012F610;
  if (!qword_10012F610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F610);
  }
  return result;
}

uint64_t sub_1000CAA3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v1 = sub_1000E56B0();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_1000082B4(&qword_10012D820);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  uint64_t v36 = v3;
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000082B4(&qword_10012D828);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v37 = v6;
  uint64_t v38 = v7;
  __chkstk_darwin(v6);
  unint64_t v32 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000082B4(&qword_10012D830);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v39 = v9;
  uint64_t v40 = v10;
  __chkstk_darwin(v9);
  id v33 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000082B4(&qword_10012D838);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v41 = v12;
  uint64_t v42 = v13;
  __chkstk_darwin(v12);
  uint64_t v34 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  strcpy((char *)v44, "com.apple.tv.");
  HIWORD(v44[1]) = -4864;
  unint64_t v49 = (unint64_t)&type metadata for TVSettingsUpNextDisplayWidget;
  sub_1000082B4(&qword_10012F6A8);
  v51._countAndFlagsBits = sub_1000E5A20();
  sub_1000E5A70(v51);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_1000E56A0();
  sub_1000082B4(&qword_10012CEC8);
  sub_1000350E0();
  sub_100035438();
  sub_1000C9608();
  sub_10007A258();
  sub_1000E56C0();
  v44[0] = &type metadata for TVSettingsUpNextDisplayWidget;
  v44[0] = sub_1000E5A20();
  v44[1] = v15;
  unint64_t v49 = 0x746567646957;
  unint64_t v50 = 0xE600000000000000;
  uint64_t v47 = 0x656C67676F54;
  unint64_t v48 = 0xE600000000000000;
  unint64_t v30 = sub_100014158();
  uint64_t v16 = sub_1000E5C70();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  v44[0] = v16;
  v44[1] = v18;
  uint64_t v19 = sub_100014AC4(&qword_10012D848, &qword_10012D820);
  uint64_t v20 = v32;
  uint64_t v21 = v35;
  sub_1000E4640();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v5, v21);
  unint64_t v49 = 0xD000000000000024;
  unint64_t v50 = 0x80000001000ECCD0;
  v44[0] = v21;
  v44[1] = &type metadata for String;
  uint64_t v45 = v19;
  unint64_t v46 = v30;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v23 = v33;
  uint64_t v24 = v37;
  sub_1000E4600();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v20, v24);
  v44[0] = v24;
  v44[1] = &type metadata for String;
  uint64_t v45 = OpaqueTypeConformance2;
  unint64_t v46 = v30;
  uint64_t v25 = swift_getOpaqueTypeConformance2();
  uint64_t v26 = v34;
  uint64_t v27 = v39;
  sub_1000E4650();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v23, v27);
  v44[0] = v27;
  v44[1] = v25;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v41;
  sub_1000E4610();
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v26, v28);
}

uint64_t sub_1000CB058@<X0>(uint64_t a1@<X8>)
{
  sub_100014158();
  uint64_t result = sub_1000E4A00();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1000CB0C4@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1000082B4(&qword_10012D850);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000E3DA0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v38 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v38 - v15;
  char v17 = *a1;
  if (qword_100129C78 != -1) {
    swift_once();
  }
  uint64_t v18 = qword_100141E98;
  if (*(void *)(qword_100141E98 + 16))
  {
    uint64_t v41 = v11;
    swift_bridgeObjectRetain();
    unint64_t v19 = sub_10003555C(v17);
    if (v20)
    {
      unint64_t v21 = v19;
      uint64_t v40 = v7;
      uint64_t v22 = *(void *)(v18 + 56);
      uint64_t v23 = sub_1000E3B50();
      uint64_t v24 = *(void *)(v23 - 8);
      uint64_t v39 = v8;
      uint64_t v25 = v24;
      uint64_t v26 = v22 + *(void *)(v24 + 72) * v21;
      uint64_t v7 = v40;
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v6, v26, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v6, 0, 1, v23);
      uint64_t v8 = v39;
    }
    else
    {
      uint64_t v23 = sub_1000E3B50();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v6, 1, 1, v23);
    }
    swift_bridgeObjectRelease();
    sub_1000E3B50();
    uint64_t v28 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v6, 1, v23) != 1)
    {
      sub_1000E3B10();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v23);
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v16, v14, v7);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v41, v16, v7);
      uint64_t v30 = sub_1000E49F0();
      uint64_t v31 = v34;
      uint64_t v35 = v8;
      uint64_t v33 = v36;
      uint64_t v32 = v37 & 1;
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v16, v7);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v27 = sub_1000E3B50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v6, 1, 1, v27);
  }
  uint64_t result = sub_10008C834((uint64_t)v6);
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
LABEL_11:
  *a2 = v30;
  a2[1] = v31;
  a2[2] = v32;
  a2[3] = v33;
  return result;
}

uint64_t sub_1000CB4DC()
{
  return sub_1000E5740();
}

uint64_t sub_1000CB570()
{
  uint64_t v28 = sub_1000E3B90();
  uint64_t v0 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v27 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000082B4(&qword_10012A5C8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v20 - v6;
  uint64_t v8 = sub_1000082B4(&qword_10012A580);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000E3DA0();
  uint64_t v26 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v23 = sub_1000082B4(&qword_10012F640);
  sub_1000E3D80();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v24 = v12 + 56;
  uint64_t v25 = v13;
  v13(v10, 1, 1, v11);
  uint64_t v14 = sub_1000E3A00();
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v29 = 0;
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v7;
  v15(v7, 1, 1, v14);
  v15(v5, 1, 1, v14);
  unsigned int v22 = enum case for InputConnectionBehavior.default(_:);
  char v17 = *(void (**)(void))(v0 + 104);
  uint64_t v20 = v0 + 104;
  unint64_t v21 = (void (*)(char *, void, uint64_t))v17;
  uint64_t v18 = v27;
  v17(v27);
  sub_1000C9F48();
  uint64_t v23 = sub_1000E3A70();
  sub_1000082B4(&qword_10012F648);
  sub_1000E3D80();
  v25(v10, 1, 1, v26);
  LOBYTE(v29) = 2;
  v15(v16, 1, 1, v14);
  v15(v5, 1, 1, v14);
  v21(v18, v22, v28);
  sub_1000350E0();
  sub_1000E3A60();
  return v23;
}

uint64_t sub_1000CB960()
{
  uint64_t v0 = sub_1000E3D90();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000E3F10();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_1000E59F0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1000E3DA0();
  __chkstk_darwin(v6 - 8);
  v9[1] = &type metadata for TVSettingsUpNextDisplayEntity;
  sub_1000082B4(&qword_10012CD98);
  uint64_t v7 = sub_1000E5A20();
  sub_1000082B4(&qword_10012F470);
  sub_1000E5990();
  sub_1000E3F00();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  sub_1000E3DB0();
  sub_100014AC4(&qword_10012F628, &qword_10012F630);
  sub_1000350E0();
  sub_1000E3C80();
  return v7;
}

uint64_t sub_1000CBC34(unint64_t *a1, void (*a2)(uint64_t))
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

_OWORD *sub_1000CBC7C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000CBC8C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 16);
  return swift_retain();
}

ValueMetadata *type metadata accessor for TVSettingsUpNextDisplayWidget()
{
  return &type metadata for TVSettingsUpNextDisplayWidget;
}

uint64_t sub_1000CBCA8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000CBCC4(uint64_t a1)
{
  unint64_t result = sub_1000CBCEC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000CBCEC()
{
  unint64_t result = qword_10012F6A0;
  if (!qword_10012F6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F6A0);
  }
  return result;
}

uint64_t destroy for TVWidgetLockscreen()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s17TVWidgetExtension18TVWidgetLockscreenVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TVWidgetLockscreen(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for TVWidgetLockscreen(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for TVWidgetLockscreen(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 24)) {
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

uint64_t storeEnumTagSinglePayload for TVWidgetLockscreen(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TVWidgetLockscreen()
{
  return &type metadata for TVWidgetLockscreen;
}

uint64_t sub_1000CBEEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000CBF08@<X0>(void *a1@<X0>, unsigned __int8 a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_1000A7B00(a3, (unint64_t)v7);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  unint64_t v14 = v13;
  uint64_t result = swift_bridgeObjectRelease();
  unsigned __int8 v20 = a2;
  if (v12 == v14 >> 1)
  {
    unint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  else
  {
    if ((uint64_t)(v14 >> 1) <= v12)
    {
      __break(1u);
      return result;
    }
    swift_retain();
    unint64_t v16 = sub_100095EB8();
    uint64_t v17 = v18;
    swift_release();
  }
  *(void *)a4 = sub_1000E45C0();
  *(void *)(a4 + 8) = 0;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t v19 = sub_1000082B4(&qword_10012F6B0);
  sub_1000CC044(v20, a3, v8, v10, v12, v14, v16, (unsigned char *)(a4 + *(int *)(v19 + 44)), v17);
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000CC044@<X0>(unsigned __int8 a1@<W1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, unint64_t a6@<X6>, uint64_t a7@<X7>, unsigned char *a8@<X8>, uint64_t a9)
{
  uint64_t v40 = a7;
  uint64_t v41 = a2;
  unint64_t v45 = a6;
  uint64_t v46 = a5;
  uint64_t v42 = a8;
  int v12 = a1;
  uint64_t v13 = type metadata accessor for TVWidgetNoContentTextView();
  __chkstk_darwin(v13);
  uint64_t v15 = (unsigned __int8 *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_1000082B4(&qword_10012F6B8);
  __chkstk_darwin(v43);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_1000082B4(&qword_10012F6C0);
  __chkstk_darwin(v44);
  uint64_t v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1000082B4(&qword_10012F6C8);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v39 - v24;
  if (v12 == 4)
  {
    *(void *)uint64_t v19 = sub_1000E45D0();
    *((void *)v19 + 1) = 0x401C000000000000;
    v19[16] = 0;
    uint64_t v39 = &v19[*(int *)(sub_1000082B4(&qword_10012F6D0) + 44)];
    uint64_t v47 = a3;
    uint64_t v48 = a4;
    uint64_t v49 = v46;
    unint64_t v50 = v45;
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v40;
    *(void *)(v26 + 24) = a9;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    sub_1000082B4(&qword_10012F6D8);
    sub_1000082B4(&qword_10012F6E0);
    sub_100014AC4(&qword_10012F6E8, &qword_10012F6D8);
    sub_100014AC4(&qword_10012F6F0, &qword_10012F6E0);
    sub_1000CCE7C(&qword_10012F6F8, (void (*)(uint64_t))type metadata accessor for TVWidgetContentViewModel);
    sub_1000E4EC0();
    sub_100014754((uint64_t)v19, (uint64_t)v17, &qword_10012F6C0);
    swift_storeEnumTagMultiPayload();
    sub_1000CCE7C(&qword_10012F700, (void (*)(uint64_t))type metadata accessor for TVWidgetNoContentTextView);
    sub_100014AC4(&qword_10012F708, &qword_10012F6C0);
    sub_1000E4690();
    uint64_t result = sub_1000147B8((uint64_t)v19, &qword_10012F6C0);
  }
  else
  {
    uint64_t v28 = &v15[*(int *)(v13 + 20)];
    uint64_t v29 = enum case for WidgetFamily.systemSmall(_:);
    uint64_t v30 = sub_1000E5640();
    (*(void (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 104))(v28, v29, v30);
    sub_1000E5660();
    uint64_t v31 = sub_1000E4C70();
    *uint64_t v15 = a1;
    uint64_t v32 = &v15[*(int *)(v13 + 28)];
    *(void *)uint64_t v32 = v31;
    *((void *)v32 + 1) = 0x3FE999999999999ALL;
    v32[16] = 1;
    sub_1000CCF90((uint64_t)v15, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for TVWidgetNoContentTextView);
    swift_storeEnumTagMultiPayload();
    sub_1000CCE7C(&qword_10012F700, (void (*)(uint64_t))type metadata accessor for TVWidgetNoContentTextView);
    sub_100014AC4(&qword_10012F708, &qword_10012F6C0);
    sub_1000E4690();
    uint64_t result = sub_1000CCFF8((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for TVWidgetNoContentTextView);
  }
  uint64_t v33 = (v45 >> 1) - v46;
  if (__OFSUB__(v45 >> 1, v46))
  {
    __break(1u);
  }
  else
  {
    BOOL v34 = v33 >= v41;
    BOOL v35 = v33 < v41;
    sub_100014754((uint64_t)v25, (uint64_t)v23, &qword_10012F6C8);
    uint64_t v36 = v42;
    *uint64_t v42 = 1;
    uint64_t v37 = sub_1000082B4(&qword_10012F710);
    sub_100014754((uint64_t)v23, (uint64_t)&v36[*(int *)(v37 + 48)], &qword_10012F6C8);
    uint64_t v38 = &v36[*(int *)(v37 + 64)];
    *(void *)uint64_t v38 = 0;
    v38[8] = v35;
    v38[9] = v34;
    sub_1000147B8((uint64_t)v25, &qword_10012F6C8);
    return sub_1000147B8((uint64_t)v23, &qword_10012F6C8);
  }
  return result;
}

uint64_t sub_1000CC5E4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v57 = a4;
  uint64_t v55 = sub_1000E4EA0();
  uint64_t v53 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  long long v52 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_1000082B4(&qword_10012F718);
  uint64_t v7 = __chkstk_darwin(v51);
  uint64_t v56 = (uint64_t)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v48 - v10;
  __chkstk_darwin(v9);
  uint64_t v54 = (uint64_t)&v48 - v12;
  uint64_t v13 = sub_1000E5640();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (int *)type metadata accessor for TVWidgetContentView(0);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v50 = (uint64_t)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v48 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v48 - v23;
  uint64_t v25 = *a1;
  unint64_t v26 = sub_100095EB8();
  if (a3)
  {
    if (v26 == v49 && v27 == a3)
    {
      swift_bridgeObjectRelease();
      double v28 = 0.0;
    }
    else
    {
      char v29 = sub_1000E5DC0();
      swift_bridgeObjectRelease();
      if (v29) {
        double v28 = 0.0;
      }
      else {
        double v28 = 1.0;
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    double v28 = 1.0;
  }
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, enum case for WidgetFamily.systemSmall(_:), v13);
  swift_retain();
  int v30 = sub_1000E42F0();
  int v31 = sub_1000E42E0();
  if (v30)
  {
    if ((v31 & ~v30) == 0) {
      goto LABEL_15;
    }
  }
  else if (!v31)
  {
    int v30 = 0;
    goto LABEL_15;
  }
  v30 |= v31;
LABEL_15:
  uint64_t v32 = sub_1000E4F80();
  *uint64_t v22 = 3;
  (*(void (**)(unsigned char *, char *, uint64_t))(v14 + 32))(&v22[v17[5]], v16, v13);
  *(void *)&v22[v17[6]] = v25;
  uint64_t v33 = &v22[v17[7]];
  __asm { FMOV            V1.2D, #16.0 }
  *(_OWORD *)uint64_t v33 = xmmword_1000F7F90;
  *((_OWORD *)v33 + 1) = _Q1;
  v33[32] = 0;
  *((_DWORD *)v33 + 9) = v30;
  *((void *)v33 + 5) = v32;
  *((_OWORD *)v33 + 3) = xmmword_1000F7FA0;
  v33[64] = 0;
  *((void *)v33 + 11) = 0;
  *((void *)v33 + 9) = 0;
  *(_DWORD *)(v33 + 79) = 0;
  sub_1000CCEC4((uint64_t)v22, (uint64_t)v24);
  uint64_t v39 = v52;
  sub_1000E4E90();
  uint64_t v40 = v53;
  uint64_t v41 = v55;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v11, v39, v55);
  *(double *)&v11[*(int *)(v51 + 36)] = v28;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v39, v41);
  uint64_t v42 = v54;
  sub_1000CCF28((uint64_t)v11, v54);
  uint64_t v43 = v50;
  sub_1000CCF90((uint64_t)v24, v50, type metadata accessor for TVWidgetContentView);
  uint64_t v44 = v56;
  sub_100014754(v42, v56, &qword_10012F718);
  uint64_t v45 = v57;
  sub_1000CCF90(v43, v57, type metadata accessor for TVWidgetContentView);
  uint64_t v46 = sub_1000082B4(&qword_10012F720);
  sub_100014754(v44, v45 + *(int *)(v46 + 48), &qword_10012F718);
  sub_1000147B8(v42, &qword_10012F718);
  sub_1000CCFF8((uint64_t)v24, type metadata accessor for TVWidgetContentView);
  sub_1000147B8(v44, &qword_10012F718);
  return sub_1000CCFF8(v43, type metadata accessor for TVWidgetContentView);
}

uint64_t sub_1000CCAC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000CBF08(*(void **)v1, *(unsigned char *)(v1 + 8), *(void *)(v1 + 16), a1);
}

uint64_t sub_1000CCAD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = type metadata accessor for TVWidgetLockscreenCell();
  uint64_t v4 = *(void *)(v1 + *(int *)(result + 24));
  long long v5 = 0uLL;
  if (*(void *)(v4 + 24) && *(void *)(v4 + 40))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1000E45D0();
    sub_1000CCBC0((uint64_t)&v12);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    long long v5 = v12;
    uint64_t v7 = v13;
    uint64_t v8 = v14;
    long long v9 = v15;
    uint64_t v10 = v16;
    uint64_t v11 = v17;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    long long v9 = 0uLL;
  }
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = v6;
  *(_OWORD *)(a1 + 24) = v5;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(_OWORD *)(a1 + 56) = v9;
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = v11;
  return result;
}

uint64_t sub_1000CCBC0@<X0>(uint64_t a1@<X8>)
{
  sub_100014158();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1000E4A00();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_1000E47C0();
  uint64_t v7 = sub_1000E4970();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  sub_1000141AC(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_1000E4830();
  uint64_t v12 = sub_1000E4920();
  uint64_t v33 = v13;
  uint64_t v34 = v12;
  uint64_t v35 = v14;
  char v32 = v15 & 1;
  sub_1000141AC(v7, v9, v11 & 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_1000E4A00();
  uint64_t v18 = v17;
  LOBYTE(v7) = v19 & 1;
  sub_1000E47C0();
  uint64_t v20 = sub_1000E4970();
  uint64_t v22 = v21;
  char v24 = v23;
  swift_release();
  sub_1000141AC(v16, v18, v7);
  swift_bridgeObjectRelease();
  sub_1000E4C70();
  uint64_t v25 = sub_1000E4940();
  uint64_t v27 = v26;
  LOBYTE(v7) = v28;
  uint64_t v30 = v29;
  swift_release();
  sub_1000141AC(v20, v22, v24 & 1);
  swift_bridgeObjectRelease();
  *(void *)a1 = v34;
  *(void *)(a1 + 8) = v33;
  *(unsigned char *)(a1 + 16) = v32;
  *(void *)(a1 + 24) = v35;
  *(void *)(a1 + 32) = v25;
  *(void *)(a1 + 40) = v27;
  *(unsigned char *)(a1 + 48) = v7 & 1;
  *(void *)(a1 + 56) = v30;
  sub_10003A978(v34, v33, v32);
  swift_bridgeObjectRetain();
  sub_10003A978(v25, v27, v7 & 1);
  swift_bridgeObjectRetain();
  sub_1000141AC(v25, v27, v7 & 1);
  swift_bridgeObjectRelease();
  sub_1000141AC(v34, v33, v32);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000CCE3C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000CCE74@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000CC5E4(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1000CCE7C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000CCEC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TVWidgetContentView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000CCF28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000082B4(&qword_10012F718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000CCF90(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000CCFF8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000CD058()
{
  return sub_100014AC4(&qword_10012F728, &qword_10012F730);
}

void *sub_1000CD094(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    long long v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(_DWORD *)(a1 + 36) = *((_DWORD *)a2 + 9);
    *(void *)(a1 + 40) = a2[5];
    long long v8 = *((_OWORD *)a2 + 3);
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    *(void *)(a1 + 72) = a2[9];
    *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
    *(unsigned char *)(a1 + 81) = *((unsigned char *)a2 + 81);
    *(unsigned char *)(a1 + 82) = *((unsigned char *)a2 + 82);
    *(void *)(a1 + 88) = a2[11];
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    *(_OWORD *)(a1 + 48) = v8;
    uint64_t v12 = sub_1000E5640();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_retain();
    v13(v10, v11, v12);
    *(void *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000CD1E8(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1000E5640();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_release();
}

uint64_t sub_1000CD274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  long long v7 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  *(unsigned char *)(a1 + 82) = *(unsigned char *)(a2 + 82);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)(a1 + 48) = v7;
  uint64_t v11 = sub_1000E5640();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_retain();
  v12(v9, v10, v11);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  return a1;
}

uint64_t sub_1000CD37C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  *(unsigned char *)(a1 + 82) = *(unsigned char *)(a2 + 82);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_1000E5640();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1000CD4A4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  long long v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  long long v8 = a2[1];
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  *a1 = *a2;
  a1[1] = v8;
  uint64_t v12 = sub_1000E5640();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1000CD54C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  *(unsigned char *)(a1 + 82) = *(unsigned char *)(a2 + 82);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v10 = sub_1000E5640();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_1000CD644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000CD658);
}

uint64_t sub_1000CD658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1000E5640();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000CD708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000CD71C);
}

uint64_t sub_1000CD71C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 40) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1000E5640();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for TVWidgetLockscreenCell()
{
  uint64_t result = qword_10012F790;
  if (!qword_10012F790) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000CD810()
{
  uint64_t result = sub_1000E5640();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000CD8B4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000CD8D4()
{
  unint64_t result = qword_10012F7D0;
  if (!qword_10012F7D0)
  {
    sub_100008354(&qword_10012F7D8);
    sub_100014AC4(&qword_10012E628, &qword_10012E618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F7D0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TVWidgetNoContentState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000CDA38);
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

ValueMetadata *type metadata accessor for TVWidgetNoContentState()
{
  return &type metadata for TVWidgetNoContentState;
}

unint64_t sub_1000CDA74()
{
  unint64_t result = qword_10012F7E0;
  if (!qword_10012F7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F7E0);
  }
  return result;
}

uint64_t *sub_1000CDAC8(uint64_t *a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_1000E5640();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[6];
    uint64_t v12 = (char *)v4 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_1000E5690();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    uint64_t v15 = a3[7];
    uint64_t v16 = (char *)v4 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = *((void *)v17 + 1);
    *(void *)uint64_t v16 = *(void *)v17;
    *((void *)v16 + 1) = v18;
    v16[16] = v17[16];
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000CDC08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1000E5640();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_1000E5690();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return swift_release();
}

unsigned char *sub_1000CDCCC(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1000E5640();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = sub_1000E5690();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = v17;
  v15[16] = v16[16];
  swift_retain();
  return a1;
}

unsigned char *sub_1000CDDC0(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1000E5640();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = sub_1000E5690();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *(void *)&a1[v14] = *(void *)v16;
  swift_retain();
  swift_release();
  *((void *)v15 + 1) = *((void *)v16 + 1);
  v15[16] = v16[16];
  return a1;
}

unsigned char *sub_1000CDEC8(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1000E5640();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = sub_1000E5690();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  v15[16] = v16[16];
  return a1;
}

unsigned char *sub_1000CDFB8(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1000E5640();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = sub_1000E5690();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *(void *)&a1[v14] = *(void *)v16;
  swift_release();
  *((void *)v15 + 1) = *((void *)v16 + 1);
  v15[16] = v16[16];
  return a1;
}

uint64_t sub_1000CE0B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000CE0CC);
}

uint64_t sub_1000CE0CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000E5640();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[5];
LABEL_5:
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v11(a1 + v9, a2, v7);
  }
  uint64_t v10 = sub_1000E5690();
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[6];
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + a3[7]);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_1000CE1DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000CE1F0);
}

uint64_t sub_1000CE1F0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_1000E5640();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
  }
  else
  {
    uint64_t result = sub_1000E5690();
    if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
    {
      *(void *)(a1 + a4[7]) = (a2 - 1);
      return result;
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[6];
  }
  unint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);

  return v13(a1 + v11, a2, a2, v9);
}

uint64_t type metadata accessor for TVWidgetNoContentTextView()
{
  uint64_t result = qword_10012F840;
  if (!qword_10012F840) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000CE348()
{
  uint64_t result = sub_1000E5640();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1000E5690();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000CE424()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000CE440@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000CE604();
  uint64_t v4 = sub_1000E49E0();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  uint64_t v9 = (int *)type metadata accessor for TVWidgetNoContentTextView();
  char v24 = *(unsigned char *)(a1 + v9[7] + 16);
  sub_10002CA58(a1 + v9[5], a1 + v9[6]);
  uint64_t v10 = sub_1000E4970();
  uint64_t v12 = v11;
  char v14 = v13;
  swift_release();
  sub_1000141AC(v4, v6, v8);
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_1000E4940();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_1000141AC(v10, v12, v14 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = v15;
  *(void *)(a2 + 24) = v17;
  *(unsigned char *)(a2 + 32) = v21;
  *(void *)(a2 + 40) = v19;
  *(void *)(a2 + 48) = KeyPath;
  *(unsigned char *)(a2 + 56) = v24;
  *(void *)(a2 + 64) = 0;
  *(unsigned char *)(a2 + 72) = 0;
  sub_10003A978(v15, v17, v21);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000141AC(v15, v17, v21);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000CE604()
{
  unint64_t v2 = &type metadata for AvocadoFeature;
  unint64_t v3 = sub_1000885F4();
  sub_1000E3F30();
  sub_100088648((uint64_t)v1);
  return sub_1000E4560();
}

double sub_1000CE724@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000E45C0();
  sub_1000CE440(v2, (uint64_t)&v17);
  long long v4 = v18;
  char v5 = v19;
  sub_1000E4F50();
  sub_1000B6944(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v17, 0.0, 1, 0.0, 1);
  sub_1000141AC(v4, *((uint64_t *)&v4 + 1), v5);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v2 + *(int *)(a1 + 28) + 8);
  uint64_t KeyPath = swift_getKeyPath();
  long long v8 = v28;
  *(_OWORD *)(a2 + 160) = v27;
  *(_OWORD *)(a2 + 176) = v8;
  *(_OWORD *)(a2 + 192) = v29;
  uint64_t v9 = v30;
  long long v10 = v24;
  *(_OWORD *)(a2 + 96) = v23;
  *(_OWORD *)(a2 + 112) = v10;
  long long v11 = v26;
  *(_OWORD *)(a2 + 128) = v25;
  *(_OWORD *)(a2 + 144) = v11;
  long long v12 = v20;
  *(_OWORD *)(a2 + 32) = v19;
  *(_OWORD *)(a2 + 48) = v12;
  long long v13 = v22;
  *(_OWORD *)(a2 + 64) = v21;
  *(_OWORD *)(a2 + 80) = v13;
  double result = *(double *)&v17;
  long long v15 = v18;
  *(_OWORD *)a2 = v17;
  *(_OWORD *)(a2 + 16) = v15;
  *(void *)(a2 + 208) = v9;
  *(void *)(a2 + 216) = KeyPath;
  *(void *)(a2 + 224) = v6;
  return result;
}

unint64_t sub_1000CE8B8()
{
  unint64_t result = qword_10012F880;
  if (!qword_10012F880)
  {
    sub_100008354(&qword_10012F888);
    sub_1000CE958();
    sub_100014AC4(&qword_10012A258, &qword_10012A260);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F880);
  }
  return result;
}

unint64_t sub_1000CE958()
{
  unint64_t result = qword_10012F890;
  if (!qword_10012F890)
  {
    sub_100008354(&qword_10012F898);
    sub_100014AC4(&qword_10012F8A0, &qword_10012F8A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F890);
  }
  return result;
}

uint64_t destroy for SportsWidgetLogoView()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SportsWidgetLogoView(void *a1, void *a2)
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
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SportsWidgetLogoView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
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
  return a1;
}

void *assignWithTake for SportsWidgetLogoView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_release();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SportsWidgetLogoView()
{
  return &type metadata for SportsWidgetLogoView;
}

uint64_t sub_1000CEBDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000CEBF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v76 = a1;
  uint64_t v75 = sub_1000082B4(&qword_10012F8B0);
  uint64_t v2 = __chkstk_darwin(v75);
  uint64_t v67 = (uint64_t)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v61 - v4;
  uint64_t v77 = sub_1000082B4(&qword_10012F8B8);
  __chkstk_darwin(v77);
  char v7 = (uint64_t *)((char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v72 = sub_1000082B4(&qword_10012F8C0);
  __chkstk_darwin(v72);
  uint64_t v73 = (uint64_t)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000082B4(&qword_10012F8C8);
  __chkstk_darwin(v9);
  uint64_t v74 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_1000082B4(&qword_10012C618);
  __chkstk_darwin(v68);
  long long v12 = (uint64_t *)((char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_1000E4320();
  uint64_t v70 = *(void *)(v13 - 8);
  uint64_t v71 = v13;
  __chkstk_darwin(v13);
  unint64_t v69 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000E4CE0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  long long v18 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000082B4(&qword_10012F8D0);
  uint64_t v20 = __chkstk_darwin(v19);
  long long v22 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v20);
  uint64_t v25 = *((void *)v1 + 5);
  uint64_t v78 = v9;
  uint64_t v79 = v7;
  uint64_t v80 = v23;
  if (v25)
  {
    uint64_t v67 = (uint64_t)&v61 - v24;
    swift_bridgeObjectRetain();
    sub_1000E4CD0();
    (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, enum case for Image.ResizingMode.stretch(_:), v15);
    uint64_t v66 = (char *)sub_1000E4D10();
    swift_release();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    long long v86 = *v1;
    uint64_t v26 = *((void *)&v86 + 1);
    uint64_t KeyPath = swift_getKeyPath();
    swift_retain();
    sub_1000E4F50();
    sub_1000E40A0();
    id v65 = v81;
    char v28 = v82;
    uint64_t v29 = v83;
    LODWORD(v64) = v84;
    uint64_t v62 = *((void *)&v85 + 1);
    uint64_t v63 = v85;
    uint64_t v30 = v69;
    sub_1000E4310();
    uint64_t v31 = swift_getKeyPath();
    uint64_t v33 = v70;
    uint64_t v32 = v71;
    (*(void (**)(char *, char *, uint64_t))(v70 + 16))((char *)v12 + *(int *)(v68 + 28), v30, v71);
    uint64_t *v12 = v31;
    sub_100014754((uint64_t)v12, (uint64_t)&v22[*(int *)(v80 + 36)], &qword_10012C618);
    *(void *)long long v22 = v66;
    *((void *)v22 + 1) = KeyPath;
    id v34 = v65;
    *((void *)v22 + 2) = v26;
    *((void *)v22 + 3) = v34;
    v22[32] = v28;
    *((void *)v22 + 5) = v29;
    v22[48] = (char)v64;
    uint64_t v35 = v62;
    *((void *)v22 + 7) = v63;
    *((void *)v22 + 8) = v35;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1000147B8((uint64_t)v12, &qword_10012C618);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v30, v32);
    swift_release();
    swift_release();
    sub_10005F618((uint64_t)&v86);
    uint64_t v36 = &qword_10012F8D0;
    uint64_t v37 = v67;
    sub_100014B08((uint64_t)v22, v67, &qword_10012F8D0);
    sub_100014754(v37, v73, &qword_10012F8D0);
    swift_storeEnumTagMultiPayload();
    sub_1000CF77C(&qword_10012F8E8, &qword_10012F8D0, (void (*)(void))sub_1000CF820);
    sub_1000CF77C(&qword_10012F910, &qword_10012F8B0, (void (*)(void))sub_1000CF93C);
    uint64_t v38 = (uint64_t)v74;
    sub_1000E4690();
    sub_100014754(v38, (uint64_t)v79, &qword_10012F8C8);
    swift_storeEnumTagMultiPayload();
    sub_1000082B4(&qword_10012F8D8);
    sub_1000CF6B8();
    sub_1000CF9B0();
    sub_1000E4690();
    sub_1000147B8(v38, &qword_10012F8C8);
    uint64_t v39 = v37;
    return sub_1000147B8(v39, v36);
  }
  uint64_t v66 = v5;
  if (*((void *)v1 + 7))
  {
    id v40 = objc_allocWithZone((Class)UIImage);
    swift_bridgeObjectRetain();
    NSString v41 = sub_1000E5A00();
    swift_bridgeObjectRelease();
    id v42 = [v40 initWithContentsOfFile:v41];

    if (v42)
    {
      id v65 = v42;
      sub_1000E4CC0();
      (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, enum case for Image.ResizingMode.stretch(_:), v15);
      uint64_t v43 = sub_1000E4D10();
      swift_release();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      sub_1000E4F50();
      sub_1000E40A0();
      uint64_t v64 = v81;
      LODWORD(v63) = v82;
      uint64_t v62 = v83;
      unsigned __int8 v44 = v84;
      long long v45 = v85;
      uint64_t v46 = v69;
      sub_1000E4310();
      uint64_t v47 = swift_getKeyPath();
      uint64_t v48 = v70;
      uint64_t v49 = v71;
      (*(void (**)(char *, char *, uint64_t))(v70 + 16))((char *)v12 + *(int *)(v68 + 28), v46, v71);
      uint64_t *v12 = v47;
      uint64_t v50 = v67;
      sub_100014754((uint64_t)v12, v67 + *(int *)(v75 + 36), &qword_10012C618);
      uint64_t v51 = v64;
      *(void *)uint64_t v50 = v43;
      *(void *)(v50 + 8) = v51;
      *(unsigned char *)(v50 + 16) = v63;
      *(void *)(v50 + 24) = v62;
      *(unsigned char *)(v50 + 32) = v44;
      *(_OWORD *)(v50 + 40) = v45;
      swift_retain();
      sub_1000147B8((uint64_t)v12, &qword_10012C618);
      (*(void (**)(char *, uint64_t))(v48 + 8))(v46, v49);
      swift_release();
      uint64_t v36 = &qword_10012F8B0;
      uint64_t v52 = (uint64_t)v66;
      sub_100014B08(v50, (uint64_t)v66, &qword_10012F8B0);
      sub_100014754(v52, v73, &qword_10012F8B0);
      swift_storeEnumTagMultiPayload();
      sub_1000CF77C(&qword_10012F8E8, &qword_10012F8D0, (void (*)(void))sub_1000CF820);
      sub_1000CF77C(&qword_10012F910, &qword_10012F8B0, (void (*)(void))sub_1000CF93C);
      uint64_t v53 = (uint64_t)v74;
      sub_1000E4690();
      sub_100014754(v53, (uint64_t)v79, &qword_10012F8C8);
      swift_storeEnumTagMultiPayload();
      sub_1000082B4(&qword_10012F8D8);
      sub_1000CF6B8();
      sub_1000CF9B0();
      sub_1000E4690();

      sub_1000147B8(v53, &qword_10012F8C8);
      uint64_t v39 = v52;
      return sub_1000147B8(v39, v36);
    }
  }
  uint64_t v55 = sub_1000E4C30();
  sub_1000E4F50();
  sub_1000E40A0();
  uint64_t v56 = (uint64_t)v81;
  unsigned __int8 v57 = v82;
  uint64_t v58 = v83;
  unsigned __int8 v59 = v84;
  uint64_t v60 = v79;
  uint64_t *v79 = v55;
  *((_WORD *)v60 + 4) = 256;
  v60[2] = v56;
  *((unsigned char *)v60 + 24) = v57;
  v60[4] = v58;
  *((unsigned char *)v60 + 40) = v59;
  *((_OWORD *)v60 + 3) = v85;
  swift_storeEnumTagMultiPayload();
  sub_1000082B4(&qword_10012F8D8);
  sub_1000CF6B8();
  sub_1000CF9B0();
  return sub_1000E4690();
}

unint64_t sub_1000CF6B8()
{
  unint64_t result = qword_10012F8E0;
  if (!qword_10012F8E0)
  {
    sub_100008354(&qword_10012F8C8);
    sub_1000CF77C(&qword_10012F8E8, &qword_10012F8D0, (void (*)(void))sub_1000CF820);
    sub_1000CF77C(&qword_10012F910, &qword_10012F8B0, (void (*)(void))sub_1000CF93C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F8E0);
  }
  return result;
}

uint64_t sub_1000CF77C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100008354(a2);
    a3();
    sub_100014AC4(&qword_10012C7B0, &qword_10012C618);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000CF820()
{
  unint64_t result = qword_10012F8F0;
  if (!qword_10012F8F0)
  {
    sub_100008354(&qword_10012F8F8);
    sub_1000CF89C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F8F0);
  }
  return result;
}

unint64_t sub_1000CF89C()
{
  unint64_t result = qword_10012F900;
  if (!qword_10012F900)
  {
    sub_100008354(&qword_10012F908);
    sub_100014AC4(&qword_10012CF18, &qword_10012CF00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F900);
  }
  return result;
}

unint64_t sub_1000CF93C()
{
  unint64_t result = qword_10012F918;
  if (!qword_10012F918)
  {
    sub_100008354(&qword_10012F920);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F918);
  }
  return result;
}

unint64_t sub_1000CF9B0()
{
  unint64_t result = qword_10012F928;
  if (!qword_10012F928)
  {
    sub_100008354(&qword_10012F8D8);
    sub_100014AC4(&qword_10012F930, &qword_10012F938);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F928);
  }
  return result;
}

uint64_t sub_1000CFA50()
{
  return sub_1000E43E0();
}

uint64_t sub_1000CFA74()
{
  return sub_1000E43E0();
}

uint64_t sub_1000CFA98(uint64_t a1)
{
  uint64_t v2 = sub_1000E4320();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1000E43F0();
}

unint64_t sub_1000CFB70()
{
  unint64_t result = qword_10012F940;
  if (!qword_10012F940)
  {
    sub_100008354(&qword_10012F948);
    sub_1000CF6B8();
    sub_1000CF9B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012F940);
  }
  return result;
}

uint64_t *sub_1000CFBEC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = *(int *)(a3 + 24);
    __dst = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = sub_1000E3EE0();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = sub_1000082B4(&qword_100129F30);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = *(int *)(a3 + 28);
    uint64_t v17 = (char *)v4 + v16;
    long long v18 = (char *)a2 + v16;
    uint64_t v19 = *((void *)v18 + 1);
    *(void *)uint64_t v17 = *(void *)v18;
    *((void *)v17 + 1) = v19;
    v17[16] = v18[16];
    uint64_t v20 = *((void *)v18 + 4);
    *((void *)v17 + 3) = *((void *)v18 + 3);
    *((void *)v17 + 4) = v20;
    uint64_t v21 = *((void *)v18 + 6);
    *((void *)v17 + 5) = *((void *)v18 + 5);
    *((void *)v17 + 6) = v21;
    v17[56] = v18[56];
    *((void *)v17 + 8) = *((void *)v18 + 8);
    v17[72] = v18[72];
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000CFDEC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1000E3EE0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *sub_1000CFEE0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000E3EE0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = sub_1000082B4(&qword_100129F30);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = v17;
  v15[16] = v16[16];
  uint64_t v18 = *((void *)v16 + 4);
  *((void *)v15 + 3) = *((void *)v16 + 3);
  *((void *)v15 + 4) = v18;
  uint64_t v19 = *((void *)v16 + 6);
  *((void *)v15 + 5) = *((void *)v16 + 5);
  *((void *)v15 + 6) = v19;
  v15[56] = v16[56];
  *((void *)v15 + 8) = *((void *)v16 + 8);
  v15[72] = v16[72];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1000D0090(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000E3EE0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_1000082B4(&qword_100129F30);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 28);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  *(void *)((char *)a1 + v15) = *(void *)((char *)a2 + v15);
  swift_retain();
  swift_release();
  *((void *)v16 + 1) = *((void *)v17 + 1);
  v16[16] = v17[16];
  *((void *)v16 + 3) = *((void *)v17 + 3);
  swift_retain();
  swift_release();
  *((void *)v16 + 4) = *((void *)v17 + 4);
  swift_retain();
  swift_release();
  *((void *)v16 + 5) = *((void *)v17 + 5);
  swift_retain();
  swift_release();
  uint64_t v18 = *((void *)v17 + 6);
  v16[56] = v17[56];
  *((void *)v16 + 6) = v18;
  *((void *)v16 + 8) = *((void *)v17 + 8);
  v16[72] = v17[72];
  return a1;
}

_OWORD *sub_1000D02EC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000E3EE0();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_1000082B4(&qword_100129F30);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (_OWORD *)((char *)a1 + v13);
  uint64_t v15 = (_OWORD *)((char *)a2 + v13);
  long long v16 = v15[3];
  _OWORD v14[2] = v15[2];
  v14[3] = v16;
  *(_OWORD *)((char *)v14 + 57) = *(_OWORD *)((char *)v15 + 57);
  long long v17 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v17;
  return a1;
}

void *sub_1000D0434(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_1000E3EE0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = sub_1000082B4(&qword_100129F30);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = *(int *)(a3 + 28);
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *(void *)((char *)a1 + v17) = *(void *)v19;
  swift_release();
  *((void *)v18 + 1) = *((void *)v19 + 1);
  v18[16] = v19[16];
  *((void *)v18 + 3) = *((void *)v19 + 3);
  swift_release();
  *((void *)v18 + 4) = *((void *)v19 + 4);
  swift_release();
  *((void *)v18 + 5) = *((void *)v19 + 5);
  swift_release();
  *((void *)v18 + 6) = *((void *)v19 + 6);
  v18[56] = v19[56];
  *((void *)v18 + 8) = *((void *)v19 + 8);
  v18[72] = v19[72];
  return a1;
}

uint64_t sub_1000D0650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000D0664);
}

uint64_t sub_1000D0664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000082B4(&qword_100129F30);
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

uint64_t sub_1000D072C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000D0740);
}

uint64_t sub_1000D0740(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000082B4(&qword_100129F30);
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

uint64_t type metadata accessor for TVWidgetMetadataView()
{
  uint64_t result = qword_10012F9A8;
  if (!qword_10012F9A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000D0850()
{
  sub_1000D08F0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000D08F0()
{
  if (!qword_10012AB40)
  {
    sub_1000E3EE0();
    unint64_t v0 = sub_1000E5C50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10012AB40);
    }
  }
}

uint64_t sub_1000D0948()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000D0964@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v104 = a2;
  uint64_t v98 = sub_1000082B4(&qword_10012F9F0);
  uint64_t v97 = *(void *)(v98 - 8);
  uint64_t v3 = __chkstk_darwin(v98);
  long long v96 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v95 = (char *)&v82 - v5;
  uint64_t v6 = sub_1000082B4(&qword_10012F9F8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  long long v103 = (uint64_t *)((char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v7);
  uint64_t v102 = (uint64_t)&v82 - v9;
  uint64_t v10 = a1[1];
  if (v10)
  {
    uint64_t v106 = *a1;
    uint64_t v107 = v10;
    sub_100014158();
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1000E4A00();
    uint64_t v13 = v12;
    char v15 = v14 & 1;
    uint64_t v16 = (char *)a1 + *(int *)(type metadata accessor for TVWidgetMetadataView() + 28);
    sub_1000E4840();
    sub_1000E4870();
    uint64_t v17 = sub_1000E4970();
    uint64_t v19 = v18;
    char v105 = a1;
    char v21 = v20;
    swift_release();
    sub_1000141AC(v11, v13, v15);
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_1000E4940();
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26 & 1;
    char v28 = v21 & 1;
    a1 = v105;
    sub_1000141AC(v17, v19, v28);
    swift_bridgeObjectRelease();
    uint64_t v29 = (uint64_t *)*((void *)v16 + 1);
    uint64_t KeyPath = swift_getKeyPath();
    int v99 = v16[16];
    uint64_t v100 = swift_getKeyPath();
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v27 = 0;
    uint64_t v25 = 0;
    uint64_t KeyPath = 0;
    uint64_t v29 = 0;
    uint64_t v100 = 0;
    int v99 = 0;
  }
  uint64_t v30 = a1[3];
  char v105 = v29;
  if (v30)
  {
    uint64_t v90 = v27;
    uint64_t v91 = v25;
    uint64_t v92 = v23;
    uint64_t v93 = v10;
    uint64_t v31 = a1[2];
    uint64_t v32 = type metadata accessor for TVWidgetMetadataView();
    uint64_t v94 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = (double *)((char *)a1 + *(int *)(v32 + 28));
    double v40 = v39[8];
    if (v40 > 0.0)
    {
      sub_1000E4F50();
      uint64_t v94 = 1;
      sub_1000E40A0();
      uint64_t v33 = v115;
      uint64_t v34 = v116;
      uint64_t v35 = v117;
      uint64_t v36 = v118;
      uint64_t v37 = v119;
      uint64_t v38 = v120;
    }
    uint64_t v83 = v33;
    uint64_t v84 = v34;
    uint64_t v85 = v35;
    uint64_t v86 = v36;
    uint64_t v87 = v37;
    uint64_t v88 = v38;
    BOOL v89 = v40 <= 0.0;
    uint64_t v41 = sub_1000D1148(v31, v30);
    uint64_t v43 = v42;
    char v45 = v44 & 1;
    sub_1000E4840();
    sub_1000E4870();
    uint64_t v46 = sub_1000E4970();
    uint64_t v48 = v47;
    char v50 = v49;
    swift_release();
    char v51 = v50 & 1;
    sub_1000141AC(v41, v43, v45);
    swift_bridgeObjectRelease();
    uint64_t v52 = sub_1000E4940();
    uint64_t v54 = v53;
    uint64_t v56 = v55;
    char v58 = v57 & 1;
    sub_1000141AC(v46, v48, v51);
    swift_bridgeObjectRelease();
    uint64_t v59 = *((void *)v39 + 1);
    uint64_t v60 = swift_getKeyPath();
    char v61 = *((unsigned char *)v39 + 16);
    uint64_t v62 = swift_getKeyPath();
    uint64_t v106 = v52;
    uint64_t v107 = v54;
    char v108 = v58;
    uint64_t v109 = v56;
    uint64_t v110 = v60;
    uint64_t v111 = v59;
    char v112 = 0;
    uint64_t v113 = v62;
    char v114 = v61;
    sub_1000082B4(&qword_10012A138);
    sub_1000141CC();
    uint64_t v63 = v95;
    sub_1000E4A50();
    sub_1000141AC(v52, v54, v58);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v64 = v97;
    id v65 = *(void (**)(char *, char *, uint64_t))(v97 + 16);
    uint64_t v66 = v96;
    uint64_t v67 = v98;
    v65(v96, v63, v98);
    uint64_t v68 = (uint64_t)v103;
    uint64_t v69 = v94;
    *long long v103 = 0;
    *(void *)(v68 + 8) = v69;
    uint64_t v70 = v84;
    *(void *)(v68 + 16) = v83;
    *(void *)(v68 + 24) = v70;
    uint64_t v71 = v86;
    *(void *)(v68 + 32) = v85;
    *(void *)(v68 + 40) = v71;
    uint64_t v72 = v88;
    *(void *)(v68 + 48) = v87;
    *(void *)(v68 + 56) = v72;
    *(unsigned char *)(v68 + 64) = v89;
    uint64_t v73 = sub_1000082B4(&qword_10012FA10);
    v65((char *)(v68 + *(int *)(v73 + 48)), v66, v67);
    uint64_t v74 = *(void (**)(char *, uint64_t))(v64 + 8);
    v74(v63, v67);
    v74(v66, v67);
    uint64_t v75 = sub_1000082B4(&qword_10012FA00);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v75 - 8) + 56))(v68, 0, 1, v75);
    uint64_t v76 = v102;
    sub_1000D1774(v68, v102);
    uint64_t v10 = v93;
    uint64_t v23 = v92;
    uint64_t v25 = v91;
    uint64_t v27 = v90;
    uint64_t v29 = v105;
  }
  else
  {
    uint64_t v77 = sub_1000082B4(&qword_10012FA00);
    uint64_t v76 = v102;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v102, 1, 1, v77);
    uint64_t v68 = (uint64_t)v103;
  }
  sub_100014754(v76, v68, &qword_10012F9F8);
  uint64_t v78 = v104;
  *uint64_t v104 = v10;
  v78[1] = v23;
  v78[2] = v27;
  v78[3] = v25;
  v78[4] = KeyPath;
  v78[5] = (uint64_t)v29;
  uint64_t v79 = v100;
  v78[6] = 0;
  v78[7] = v79;
  *((unsigned char *)v78 + 64) = v99;
  uint64_t v80 = sub_1000082B4(&qword_10012FA08);
  sub_100014754(v68, (uint64_t)v78 + *(int *)(v80 + 48), &qword_10012F9F8);
  sub_1000D169C(v10, v23, v27, v25);
  sub_1000147B8(v76, &qword_10012F9F8);
  sub_1000147B8(v68, &qword_10012F9F8);
  return sub_1000D1700(v10, v23, v27, v25);
}

uint64_t sub_1000D1148(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v32 = sub_1000E4980();
  uint64_t v30 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  char v28 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000E49A0();
  uint64_t v29 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E49C0();
  __chkstk_darwin(v6 - 8);
  v27[1] = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000E4550();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_1000082B4(&qword_100129F30);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000E3EE0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)v27 - v17;
  uint64_t v19 = type metadata accessor for TVWidgetMetadataView();
  sub_100014754(v2 + *(int *)(v19 + 24), (uint64_t)v11, &qword_100129F30);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_1000147B8((uint64_t)v11, &qword_100129F30);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
    if (*(unsigned char *)(v2 + *(int *)(v19 + 28) + 56) != 1)
    {
      sub_1000E4540();
      v37._countAndFlagsBits = 0x2073657269707845;
      v37._object = (void *)0xEB00000000206E69;
      sub_1000E4530(v37);
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
      (*(void (**)(char *, void, uint64_t))(v30 + 104))(v28, enum case for Text.DateStyle.UnitsConfiguration.Style.full(_:), v32);
      sub_1000E4990();
      sub_1000E49B0();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v31);
      uint64_t v21 = sub_1000E49D0();
      uint64_t v23 = v22;
      char v25 = v24 & 1;
      sub_1000E4520();
      sub_1000141AC(v21, v23, v25);
      swift_bridgeObjectRelease();
      v38._countAndFlagsBits = 0;
      v38._object = (void *)0xE000000000000000;
      sub_1000E4530(v38);
      sub_1000E4570();
      uint64_t v20 = sub_1000E49E0();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
      return v20;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  }
  uint64_t v35 = v33;
  uint64_t v36 = v34;
  sub_100014158();
  swift_bridgeObjectRetain();
  return sub_1000E4A00();
}

uint64_t sub_1000D1650@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_1000E45D0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = sub_1000082B4(&qword_10012F9E8);
  return sub_1000D0964(v1, (uint64_t *)(a1 + *(int *)(v3 + 44)));
}

uint64_t sub_1000D169C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10003A978(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000D1700(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1000141AC(result, a2, a3 & 1);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000D1774(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000082B4(&qword_10012F9F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000D17DC()
{
  return sub_100014AC4(&qword_10012FA18, &qword_10012FA20);
}

ValueMetadata *type metadata accessor for SportsWidgetSoccerClockViewLayout()
{
  return &type metadata for SportsWidgetSoccerClockViewLayout;
}

uint64_t initializeWithCopy for CompetitorShootoutsViewLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CompetitorShootoutsViewLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

__n128 initializeWithTake for CompetitorShootoutsViewLayout(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for CompetitorShootoutsViewLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompetitorShootoutsViewLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CompetitorShootoutsViewLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CompetitorShootoutsViewLayout()
{
  return &type metadata for CompetitorShootoutsViewLayout;
}

BOOL sub_1000D1AC4()
{
  uint64_t v1 = type metadata accessor for SportsWatchWidgetView();
  uint64_t v2 = __chkstk_darwin(v1);
  long long v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v5 = (void *)(v0 + *(int *)(v2 + 20));
  uint64_t v6 = v5[9];
  unint64_t v7 = v5[11];
  if (v7
    && ((uint64_t v8 = v5[10] & 0xFFFFFFFFFFFFLL, (v7 & 0x2000000000000000) != 0) ? (v9 = HIBYTE(v7) & 0xF) : (v9 = v8), v9))
  {
    sub_1000D9E14(v0, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SportsWatchWidgetView);
  }
  else
  {
    sub_1000D9E14(v0, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SportsWatchWidgetView);
    if (!v6)
    {
      BOOL v15 = 0;
      goto LABEL_16;
    }
  }
  uint64_t v10 = &v4[*(int *)(v1 + 20)];
  uint64_t v11 = *((void *)v10 + 24);
  unint64_t v12 = *((void *)v10 + 26);
  BOOL v15 = v12
     && ((uint64_t v13 = *((void *)v10 + 25) & 0xFFFFFFFFFFFFLL, (v12 & 0x2000000000000000) != 0)
       ? (uint64_t v14 = HIBYTE(v12) & 0xF)
       : (uint64_t v14 = v13),
         v14)
     || v11 != 0;
LABEL_16:
  sub_1000D9E7C((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for SportsWatchWidgetView);
  return v15;
}

uint64_t sub_1000D1C10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v43 = a1;
  uint64_t v42 = sub_1000E3FD0();
  uint64_t v40 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v41 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000082B4(&qword_10012F380);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000082B4(&qword_10012F388);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000082B4(&qword_10012FAB8);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000D1F98(v2);
  uint64_t v14 = sub_1000E4F50();
  sub_1000B6B18(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v9, 0.0, 1, INFINITY, 0, v14, v15);
  sub_1000147B8((uint64_t)v6, &qword_10012F380);
  uint64_t v16 = sub_1000E4F50();
  uint64_t v18 = v17;
  uint64_t v19 = sub_1000E4F50();
  uint64_t v21 = v20;
  sub_1000D2540((uint64_t)&v44);
  uint64_t v22 = v44;
  long long v39 = v45;
  uint64_t v23 = v46;
  uint64_t v24 = v47;
  uint64_t v25 = v48;
  long long v38 = v49;
  uint64_t v26 = v50;
  uint64_t v27 = v51;
  sub_100014754((uint64_t)v9, (uint64_t)v13, &qword_10012F388);
  char v28 = &v13[*(int *)(v11 + 44)];
  *(void *)char v28 = v19;
  *((void *)v28 + 1) = v21;
  *((void *)v28 + 2) = v22;
  *(_OWORD *)(v28 + 24) = v39;
  *((void *)v28 + 5) = v23;
  *((void *)v28 + 6) = v24;
  *((void *)v28 + 7) = v25;
  *((_OWORD *)v28 + 4) = v38;
  *((void *)v28 + 10) = v26;
  *((void *)v28 + 11) = v27;
  *((void *)v28 + 12) = v16;
  *((void *)v28 + 13) = v18;
  sub_1000147B8((uint64_t)v9, &qword_10012F388);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v31 = v40;
  uint64_t v30 = v41;
  uint64_t v32 = v42;
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v41, enum case for ColorScheme.dark(_:), v42);
  uint64_t v33 = sub_1000082B4(&qword_10012FAC0);
  uint64_t v34 = v43;
  uint64_t v35 = (uint64_t *)(v43 + *(int *)(v33 + 36));
  uint64_t v36 = sub_1000082B4(&qword_10012D528);
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))((char *)v35 + *(int *)(v36 + 28), v30, v32);
  *uint64_t v35 = KeyPath;
  sub_100014754((uint64_t)v13, v34, &qword_10012FAB8);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v30, v32);
  return sub_1000147B8((uint64_t)v13, &qword_10012FAB8);
}

uint64_t sub_1000D1F98(uint64_t a1)
{
  uint64_t v2 = sub_1000082B4(&qword_10012FAD0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000082B4(&qword_10012FAD8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000082B4(&qword_10012FAE0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a1 + *(int *)(type metadata accessor for SportsWatchWidgetView() + 20);
  if (*(unsigned char *)(v11 + *(int *)(type metadata accessor for SportsWatchWidgetViewModel(0) + 56)) == 1)
  {
    uint64_t v12 = *(void *)(a1 + 8);
    *(void *)uint64_t v10 = sub_1000E45C0();
    *((void *)v10 + 1) = v12;
    v10[16] = 0;
    uint64_t v13 = sub_1000082B4(&qword_10012FB28);
    sub_1000D34A4(a1, (uint64_t)&v10[*(int *)(v13 + 44)]);
    uint64_t v14 = &qword_10012FAE0;
    sub_100014754((uint64_t)v10, (uint64_t)v7, &qword_10012FAE0);
    swift_storeEnumTagMultiPayload();
    sub_100014AC4(&qword_10012FAE8, &qword_10012FAE0);
    sub_1000D96D8();
    sub_1000E4690();
    uint64_t v15 = (uint64_t)v10;
  }
  else
  {
    sub_1000D2224((uint64_t)v4);
    uint64_t v14 = &qword_10012FAD0;
    sub_100014754((uint64_t)v4, (uint64_t)v7, &qword_10012FAD0);
    swift_storeEnumTagMultiPayload();
    sub_100014AC4(&qword_10012FAE8, &qword_10012FAE0);
    sub_1000D96D8();
    sub_1000E4690();
    uint64_t v15 = (uint64_t)v4;
  }
  return sub_1000147B8(v15, v14);
}

uint64_t sub_1000D2224@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v25 = a1;
  uint64_t v24 = sub_1000E46F0();
  uint64_t v3 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000082B4(&qword_10012FAF8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000082B4(&qword_10012FB80);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000082B4(&qword_10012FAD0);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v16 = *(double *)(v2 + 144);
  *(double *)uint64_t v8 = v16;
  *(_OWORD *)(v8 + 8) = xmmword_1000F8EF0;
  *((double *)v8 + 3) = v16 + 29.0;
  sub_1000D2708(v2, (uint64_t)&v8[*(int *)(v6 + 44)]);
  sub_1000E46D0();
  unint64_t v17 = sub_1000D97B8();
  sub_1000E4B60();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v24);
  sub_1000147B8((uint64_t)v8, &qword_10012FAF8);
  uint64_t v18 = v2 + *(int *)(type metadata accessor for SportsWatchWidgetView() + 20);
  uint64_t v19 = (uint64_t *)(v18 + *(int *)(type metadata accessor for SportsWatchWidgetViewModel(0) + 60));
  unint64_t v20 = v19[1];
  if (v20)
  {
    uint64_t v21 = *v19;
    unint64_t v22 = v20;
  }
  else
  {
    uint64_t v21 = 0;
    unint64_t v22 = 0xE000000000000000;
  }
  uint64_t v28 = v21;
  unint64_t v29 = v22;
  swift_bridgeObjectRetain();
  uint64_t v26 = v6;
  unint64_t v27 = v17;
  swift_getOpaqueTypeConformance2();
  sub_100014158();
  sub_1000E4B30();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return sub_100014B08((uint64_t)v15, v25, &qword_10012FAD0);
}

double sub_1000D2540@<D0>(uint64_t a1@<X8>)
{
  sub_1000082B4(&qword_10012FAC8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1000F0F50;
  type metadata accessor for SportsWatchWidgetView();
  swift_retain();
  *(void *)(v2 + 32) = sub_1000E4ED0();
  *(void *)(v2 + 40) = v3;
  swift_retain();
  *(void *)(v2 + 48) = sub_1000E4ED0();
  *(void *)(v2 + 56) = v4;
  sub_1000E4EE0();
  sub_1000E4FC0();
  sub_1000E4FD0();
  sub_1000E4190();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000F0F50;
  sub_1000E4C20();
  sub_1000E4C50();
  swift_release();
  *(void *)(v5 + 32) = sub_1000E4ED0();
  *(void *)(v5 + 40) = v6;
  sub_1000E4C20();
  sub_1000E4C50();
  swift_release();
  *(void *)(v5 + 48) = sub_1000E4ED0();
  *(void *)(v5 + 56) = v7;
  sub_1000E4EE0();
  sub_1000E4FE0();
  sub_1000E4FF0();
  sub_1000E4190();
  *(void *)a1 = v9;
  *(_OWORD *)(a1 + 8) = v10;
  *(_OWORD *)(a1 + 24) = v11;
  *(void *)(a1 + 40) = v12;
  double result = *(double *)&v13;
  *(_OWORD *)(a1 + 48) = v13;
  *(_OWORD *)(a1 + 64) = v14;
  return result;
}

uint64_t sub_1000D2708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000082B4(&qword_10012FB60);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v41 = &v38[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v8 = &v38[-v7];
  uint64_t v9 = a1 + *(int *)(type metadata accessor for SportsWatchWidgetView() + 20);
  long long v10 = *(_OWORD *)(v9 + 80);
  v47[4] = *(_OWORD *)(v9 + 64);
  v47[5] = v10;
  v47[6] = *(_OWORD *)(v9 + 96);
  char v48 = *(unsigned char *)(v9 + 112);
  long long v11 = *(_OWORD *)(v9 + 48);
  v47[2] = *(_OWORD *)(v9 + 32);
  v47[3] = v11;
  long long v12 = *(_OWORD *)(v9 + 16);
  v47[0] = *(_OWORD *)v9;
  v47[1] = v12;
  uint64_t v42 = *(void *)(a1 + 128);
  uint64_t v40 = *(void *)(a1 + 136);
  sub_1000D5600(a1, (uint64_t)v47, v49);
  *(_OWORD *)((char *)&v51[9] + 7) = v49[9];
  *(_OWORD *)((char *)&v51[10] + 7) = v49[10];
  *(_OWORD *)((char *)&v51[11] + 7) = v50[0];
  v51[12] = *(_OWORD *)((char *)v50 + 9);
  *(_OWORD *)((char *)&v51[5] + 7) = v49[5];
  *(_OWORD *)((char *)&v51[6] + 7) = v49[6];
  *(_OWORD *)((char *)&v51[7] + 7) = v49[7];
  *(_OWORD *)((char *)&v51[8] + 7) = v49[8];
  *(_OWORD *)((char *)&v51[1] + 7) = v49[1];
  *(_OWORD *)((char *)&v51[2] + 7) = v49[2];
  *(_OWORD *)((char *)&v51[3] + 7) = v49[3];
  *(_OWORD *)((char *)&v51[4] + 7) = v49[4];
  char v52 = 0;
  *(_OWORD *)((char *)v51 + 7) = v49[0];
  int v44 = 0;
  uint64_t v43 = v8;
  sub_1000D2C6C(0, (uint64_t)v8);
  long long v13 = *(_OWORD *)(v9 + 200);
  v45[4] = *(_OWORD *)(v9 + 184);
  v45[5] = v13;
  v45[6] = *(_OWORD *)(v9 + 216);
  char v46 = *(unsigned char *)(v9 + 232);
  long long v14 = *(_OWORD *)(v9 + 136);
  v45[0] = *(_OWORD *)(v9 + 120);
  v45[1] = v14;
  long long v15 = *(_OWORD *)(v9 + 168);
  void v45[2] = *(_OWORD *)(v9 + 152);
  v45[3] = v15;
  sub_1000D5600(a1, (uint64_t)v45, v53);
  *(_OWORD *)((char *)&v55[9] + 7) = v53[9];
  *(_OWORD *)((char *)&v55[10] + 7) = v53[10];
  *(_OWORD *)((char *)&v55[11] + 7) = v54[0];
  v55[12] = *(_OWORD *)((char *)v54 + 9);
  *(_OWORD *)((char *)&v55[5] + 7) = v53[5];
  *(_OWORD *)((char *)&v55[6] + 7) = v53[6];
  *(_OWORD *)((char *)&v55[7] + 7) = v53[7];
  *(_OWORD *)((char *)&v55[8] + 7) = v53[8];
  *(_OWORD *)((char *)&v55[1] + 7) = v53[1];
  *(_OWORD *)((char *)&v55[2] + 7) = v53[2];
  *(_OWORD *)((char *)&v55[3] + 7) = v53[3];
  *(_OWORD *)((char *)&v55[4] + 7) = v53[4];
  char v56 = 0;
  *(_OWORD *)((char *)v55 + 7) = v53[0];
  int v39 = 0;
  double v16 = v41;
  sub_100014754((uint64_t)v8, (uint64_t)v41, &qword_10012FB60);
  *(_OWORD *)&v58[145] = v51[9];
  *(_OWORD *)&v58[161] = v51[10];
  *(_OWORD *)&v58[177] = v51[11];
  *(_OWORD *)&v58[193] = v51[12];
  *(_OWORD *)&v58[81] = v51[5];
  *(_OWORD *)&v58[97] = v51[6];
  *(_OWORD *)&v58[113] = v51[7];
  *(_OWORD *)&v58[129] = v51[8];
  *(_OWORD *)&v58[17] = v51[1];
  *(_OWORD *)&v58[33] = v51[2];
  *(_OWORD *)&v58[49] = v51[3];
  uint64_t v17 = v42;
  *(void *)&long long v57 = v42;
  uint64_t v18 = v40;
  *((void *)&v57 + 1) = v40;
  v58[0] = v44;
  *(_OWORD *)&v58[65] = v51[4];
  *(_OWORD *)&v58[1] = v51[0];
  long long v19 = *(_OWORD *)&v58[192];
  *(_OWORD *)(a2 + 192) = *(_OWORD *)&v58[176];
  *(_OWORD *)(a2 + 208) = v19;
  *(unsigned char *)(a2 + 224) = v58[208];
  long long v20 = *(_OWORD *)&v58[128];
  *(_OWORD *)(a2 + 128) = *(_OWORD *)&v58[112];
  *(_OWORD *)(a2 + 144) = v20;
  long long v21 = *(_OWORD *)&v58[160];
  *(_OWORD *)(a2 + 160) = *(_OWORD *)&v58[144];
  *(_OWORD *)(a2 + 176) = v21;
  long long v22 = *(_OWORD *)&v58[64];
  *(_OWORD *)(a2 + 64) = *(_OWORD *)&v58[48];
  *(_OWORD *)(a2 + 80) = v22;
  long long v23 = *(_OWORD *)&v58[96];
  *(_OWORD *)(a2 + 96) = *(_OWORD *)&v58[80];
  *(_OWORD *)(a2 + 112) = v23;
  long long v24 = *(_OWORD *)v58;
  *(_OWORD *)a2 = v57;
  *(_OWORD *)(a2 + 16) = v24;
  long long v25 = *(_OWORD *)&v58[32];
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v58[16];
  *(_OWORD *)(a2 + 48) = v25;
  uint64_t v26 = sub_1000082B4(&qword_10012FB88);
  sub_100014754((uint64_t)v16, a2 + *(int *)(v26 + 48), &qword_10012FB60);
  uint64_t v27 = *(int *)(v26 + 64);
  *(_OWORD *)&v60[145] = v55[9];
  *(_OWORD *)&v60[161] = v55[10];
  *(_OWORD *)&v60[177] = v55[11];
  *(_OWORD *)&v60[193] = v55[12];
  *(_OWORD *)&v60[81] = v55[5];
  *(_OWORD *)&v60[97] = v55[6];
  *(_OWORD *)&v60[113] = v55[7];
  *(_OWORD *)&v60[129] = v55[8];
  *(_OWORD *)&v60[33] = v55[2];
  uint64_t v28 = a2 + v27;
  uint64_t v29 = v17;
  *(void *)&long long v59 = v17;
  *((void *)&v59 + 1) = v18;
  LOBYTE(v17) = v39;
  v60[0] = v39;
  *(_OWORD *)&v60[49] = v55[3];
  *(_OWORD *)&v60[65] = v55[4];
  *(_OWORD *)&v60[17] = v55[1];
  *(_OWORD *)&v60[1] = v55[0];
  long long v30 = *(_OWORD *)&v60[192];
  *(_OWORD *)(v28 + 192) = *(_OWORD *)&v60[176];
  *(_OWORD *)(v28 + 208) = v30;
  *(unsigned char *)(v28 + 224) = v60[208];
  long long v31 = *(_OWORD *)&v60[128];
  *(_OWORD *)(v28 + 128) = *(_OWORD *)&v60[112];
  *(_OWORD *)(v28 + 144) = v31;
  long long v32 = *(_OWORD *)&v60[160];
  *(_OWORD *)(v28 + 160) = *(_OWORD *)&v60[144];
  *(_OWORD *)(v28 + 176) = v32;
  long long v33 = *(_OWORD *)&v60[64];
  *(_OWORD *)(v28 + 64) = *(_OWORD *)&v60[48];
  *(_OWORD *)(v28 + 80) = v33;
  long long v34 = *(_OWORD *)&v60[96];
  *(_OWORD *)(v28 + 96) = *(_OWORD *)&v60[80];
  *(_OWORD *)(v28 + 112) = v34;
  long long v35 = *(_OWORD *)v60;
  *(_OWORD *)uint64_t v28 = v59;
  *(_OWORD *)(v28 + 16) = v35;
  long long v36 = *(_OWORD *)&v60[32];
  *(_OWORD *)(v28 + 32) = *(_OWORD *)&v60[16];
  *(_OWORD *)(v28 + 48) = v36;
  sub_1000D9EDC((uint64_t)&v57, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000C5214, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, int))sub_10003ABCC);
  sub_1000D9EDC((uint64_t)&v59, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000C5214, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, int))sub_10003ABCC);
  sub_1000147B8((uint64_t)v43, &qword_10012FB60);
  long long v72 = v55[9];
  long long v73 = v55[10];
  long long v74 = v55[11];
  long long v75 = v55[12];
  long long v68 = v55[5];
  long long v69 = v55[6];
  long long v70 = v55[7];
  long long v71 = v55[8];
  long long v64 = v55[1];
  long long v65 = v55[2];
  long long v66 = v55[3];
  long long v67 = v55[4];
  v61[0] = v29;
  v61[1] = v18;
  char v62 = v17;
  long long v63 = v55[0];
  sub_1000D9EDC((uint64_t)v61, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000D9AA8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, int))sub_10003AC90);
  sub_1000147B8((uint64_t)v16, &qword_10012FB60);
  long long v87 = v51[9];
  long long v88 = v51[10];
  long long v89 = v51[11];
  long long v90 = v51[12];
  long long v83 = v51[5];
  long long v84 = v51[6];
  long long v85 = v51[7];
  long long v86 = v51[8];
  long long v79 = v51[1];
  long long v80 = v51[2];
  long long v81 = v51[3];
  long long v82 = v51[4];
  v76[0] = v29;
  v76[1] = v18;
  char v77 = v44;
  long long v78 = v51[0];
  return sub_1000D9EDC((uint64_t)v76, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000D9AA8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, int))sub_10003AC90);
}

uint64_t sub_1000D2C6C@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  LODWORD(v57) = a1;
  uint64_t v61 = a2;
  uint64_t v3 = type metadata accessor for SportsWidgetClock(0);
  __chkstk_darwin(v3 - 8);
  uint64_t v58 = (uint64_t)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for SportsWidgetClockView();
  uint64_t v5 = __chkstk_darwin(v60);
  char v56 = (uint64_t *)((char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v5);
  uint64_t v59 = (uint64_t)&v52 - v7;
  uint64_t v8 = sub_1000082B4(&qword_10012FB70);
  __chkstk_darwin(v8);
  long long v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000082B4(&qword_10012A1C0);
  __chkstk_darwin(v11);
  long long v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000082B4(&qword_10012A1C8);
  __chkstk_darwin(v14);
  double v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000082B4(&qword_10012FB60);
  __chkstk_darwin(v17 - 8);
  long long v19 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2 + *(int *)(type metadata accessor for SportsWatchWidgetView() + 20);
  long long v21 = (int *)type metadata accessor for SportsWatchWidgetViewModel(0);
  if (*(unsigned char *)(v20 + v21[13]) == 1)
  {
    sub_1000459B8((uint64_t)v63);
    long long v22 = *(_OWORD *)&v63[16];
    *(_OWORD *)(v13 + 8) = *(_OWORD *)v63;
    *(_OWORD *)(v13 + 24) = v22;
    long long v23 = *(_OWORD *)&v63[48];
    *(_OWORD *)(v13 + 40) = *(_OWORD *)&v63[32];
    uint64_t v24 = *(void *)&v63[64];
    uint64_t v25 = *(void *)&v63[88];
    *long long v13 = 1;
    *(_OWORD *)(v13 + 56) = v23;
    *((void *)v13 + 9) = v24;
    *((_OWORD *)v13 + 5) = *(_OWORD *)&v63[72];
    *((void *)v13 + 12) = v25;
    swift_storeEnumTagMultiPayload();
    sub_1000143B8((uint64_t)v63);
    sub_10001409C();
    sub_1000DAC84(&qword_10012A108, (void (*)(uint64_t))type metadata accessor for SportsWidgetClockView);
    sub_1000E4690();
    sub_100014754((uint64_t)v16, (uint64_t)v10, &qword_10012A1C8);
    swift_storeEnumTagMultiPayload();
    sub_1000082B4(&qword_10012B5A8);
    sub_10001430C();
    sub_100014AC4(&qword_10012B5C0, &qword_10012B5A8);
    sub_1000E4690();
    sub_1000147B8((uint64_t)v16, &qword_10012A1C8);
    sub_100014400((uint64_t)v63);
LABEL_5:
    uint64_t v38 = sub_1000082B4(&qword_10012FB78);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v19, 0, 1, v38);
    return sub_100014B08((uint64_t)v19, v61, &qword_10012FB60);
  }
  uint64_t v54 = v8;
  uint64_t v55 = v14;
  if (*(unsigned char *)(v20 + v21[9]) == 1)
  {
    uint64_t v26 = v20 + v21[6];
    uint64_t v27 = v58;
    sub_1000D9E14(v26, v58, type metadata accessor for SportsWidgetClock);
    char v28 = sub_1000D6174(v57 & 1);
    uint64_t v57 = v29;
    uint64_t v52 = v31;
    uint64_t v53 = v30;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v33 = (uint64_t)v56;
    *char v56 = KeyPath;
    sub_1000082B4(&qword_100129F20);
    swift_storeEnumTagMultiPayload();
    uint64_t v34 = v60;
    sub_1000D9DAC(v27, v33 + *(int *)(v60 + 20), type metadata accessor for SportsWidgetClock);
    uint64_t v35 = v33 + *(int *)(v34 + 24);
    *(unsigned char *)uint64_t v35 = v28;
    uint64_t v36 = v53;
    *(void *)(v35 + 8) = v57;
    *(void *)(v35 + 16) = v36;
    *(void *)(v35 + 24) = v52;
    uint64_t v37 = v59;
    sub_1000D9DAC(v33, v59, (uint64_t (*)(void))type metadata accessor for SportsWidgetClockView);
    sub_1000D9E14(v37, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for SportsWidgetClockView);
    swift_storeEnumTagMultiPayload();
    sub_10001409C();
    sub_1000DAC84(&qword_10012A108, (void (*)(uint64_t))type metadata accessor for SportsWidgetClockView);
    sub_1000E4690();
    sub_100014754((uint64_t)v16, (uint64_t)v10, &qword_10012A1C8);
    swift_storeEnumTagMultiPayload();
    sub_1000082B4(&qword_10012B5A8);
    sub_10001430C();
    sub_100014AC4(&qword_10012B5C0, &qword_10012B5A8);
    sub_1000E4690();
    sub_1000147B8((uint64_t)v16, &qword_10012A1C8);
    sub_1000D9E7C(v37, (uint64_t (*)(void))type metadata accessor for SportsWidgetClockView);
    goto LABEL_5;
  }
  if (*(unsigned char *)(v20 + v21[10]) == 1)
  {
    uint64_t v40 = sub_1000E45C0();
    sub_1000D5200(v2, (uint64_t *)v62);
    *(_OWORD *)&v63[71] = v62[4];
    *(_OWORD *)&v63[55] = v62[3];
    *(_OWORD *)&v63[119] = v62[7];
    *(_OWORD *)&v63[135] = v62[8];
    *(_OWORD *)&v63[151] = v62[9];
    *(_OWORD *)&v63[167] = v62[10];
    *(_OWORD *)&v63[87] = v62[5];
    *(_OWORD *)&v63[103] = v62[6];
    *(_OWORD *)&v63[7] = v62[0];
    *(_OWORD *)&v63[23] = v62[1];
    *(_OWORD *)&v63[39] = v62[2];
    long long v41 = *(_OWORD *)&v63[144];
    *(_OWORD *)(v10 + 145) = *(_OWORD *)&v63[128];
    *(_OWORD *)(v10 + 161) = v41;
    *(_OWORD *)(v10 + 177) = *(_OWORD *)&v63[160];
    long long v42 = *(_OWORD *)&v63[80];
    *(_OWORD *)(v10 + 81) = *(_OWORD *)&v63[64];
    *(_OWORD *)(v10 + 97) = v42;
    long long v43 = *(_OWORD *)&v63[112];
    *(_OWORD *)(v10 + 113) = *(_OWORD *)&v63[96];
    *(_OWORD *)(v10 + 129) = v43;
    long long v44 = *(_OWORD *)&v63[16];
    *(_OWORD *)(v10 + 17) = *(_OWORD *)v63;
    *(_OWORD *)(v10 + 33) = v44;
    long long v45 = *(_OWORD *)&v63[48];
    *(_OWORD *)(v10 + 49) = *(_OWORD *)&v63[32];
    char v64 = 1;
    *(void *)long long v10 = v40;
    *((void *)v10 + 1) = 0;
    v10[16] = 1;
    *((void *)v10 + 24) = *(void *)&v63[175];
    *(_OWORD *)(v10 + 65) = v45;
    swift_storeEnumTagMultiPayload();
    sub_1000082B4(&qword_10012B5A8);
    sub_10001430C();
    sub_100014AC4(&qword_10012B5C0, &qword_10012B5A8);
    uint64_t v46 = v61;
    sub_1000E4690();
    uint64_t v47 = sub_1000082B4(&qword_10012FB78);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v46, 0, 1, v47);
  }
  else
  {
    uint64_t v48 = sub_1000082B4(&qword_10012FB78);
    long long v49 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56);
    uint64_t v50 = v48;
    uint64_t v51 = v61;
    return v49(v51, 1, 1, v50);
  }
}

uint64_t sub_1000D34A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v73 = a2;
  uint64_t v71 = sub_1000E46F0();
  uint64_t v3 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v5 = &v66[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1000082B4(&qword_10012FB30);
  __chkstk_darwin(v6);
  uint64_t v8 = &v66[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v72 = sub_1000082B4(&qword_10012FB38);
  uint64_t v74 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  long long v10 = &v66[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_1000082B4(&qword_10012FB40);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  long long v75 = &v66[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = __chkstk_darwin(v12);
  double v16 = &v66[-v15];
  __chkstk_darwin(v14);
  uint64_t v76 = &v66[-v17];
  uint64_t v18 = *(void *)(a1 + 16);
  *(void *)uint64_t v8 = sub_1000E4510();
  *((void *)v8 + 1) = v18;
  v8[16] = 0;
  sub_1000082B4(&qword_10012FB48);
  sub_1000D3B78(a1);
  sub_1000E46D0();
  uint64_t v19 = sub_100014AC4(&qword_10012FB50, &qword_10012FB30);
  sub_1000E4B60();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v71);
  sub_1000147B8((uint64_t)v8, &qword_10012FB30);
  uint64_t v20 = a1 + *(int *)(type metadata accessor for SportsWatchWidgetView() + 20);
  uint64_t v21 = type metadata accessor for SportsWatchWidgetViewModel(0);
  long long v22 = (uint64_t *)(v20 + *(int *)(v21 + 60));
  unint64_t v23 = v22[1];
  if (v23)
  {
    uint64_t v24 = *v22;
    unint64_t v25 = v23;
  }
  else
  {
    uint64_t v24 = 0;
    unint64_t v25 = 0xE000000000000000;
  }
  *(void *)&long long v80 = v24;
  *((void *)&v80 + 1) = v25;
  swift_bridgeObjectRetain();
  *(void *)&v79[0] = v6;
  *((void *)&v79[0] + 1) = v19;
  swift_getOpaqueTypeConformance2();
  sub_100014158();
  uint64_t v26 = (uint64_t)v16;
  uint64_t v27 = v72;
  sub_1000E4B30();
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v74 + 8))(v10, v27);
  sub_100014B08(v26, (uint64_t)v76, &qword_10012FB40);
  char v28 = (void *)(v20 + *(int *)(v21 + 32));
  uint64_t v29 = v28[1];
  *(void *)&long long v80 = *v28;
  *((void *)&v80 + 1) = v29;
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_1000E4A00();
  uint64_t v32 = v31;
  char v34 = v33 & 1;
  sub_1000B6B74(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v80, 0.0, 1, 0.0, 1, *(void *)(a1 + 64), *(void *)(a1 + 72), v30, v31, v33 & 1, v35);
  sub_1000141AC(v30, v32, v34);
  swift_bridgeObjectRelease();
  long long v109 = v86;
  long long v110 = v87;
  long long v111 = v88;
  long long v105 = v82;
  long long v106 = v83;
  long long v107 = v84;
  long long v108 = v85;
  long long v103 = v80;
  long long v104 = v81;
  uint64_t v36 = *(void *)(a1 + 40);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v37 = *(void *)(a1 + 32);
  uint64_t v38 = swift_getKeyPath();
  uint64_t v39 = *(void *)(a1 + 48);
  uint64_t v40 = swift_getKeyPath();
  swift_retain();
  swift_retain();
  unsigned __int8 v41 = sub_1000E4780();
  char v42 = sub_1000E47A0();
  char v43 = sub_1000E4790();
  sub_1000E4790();
  if (sub_1000E4790() != v41) {
    char v43 = sub_1000E4790();
  }
  sub_1000E4790();
  char v44 = sub_1000E4790();
  uint64_t v71 = v37;
  uint64_t v72 = v36;
  *(void *)&long long v69 = v40;
  *((void *)&v69 + 1) = v39;
  uint64_t v45 = v38;
  if (v44 != v42) {
    char v43 = sub_1000E4790();
  }
  char v77 = 0;
  sub_1000E3FB0();
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  char v54 = v77;
  unsigned __int8 v78 = 0;
  LODWORD(v74) = *(unsigned __int8 *)(a1 + 56);
  uint64_t v68 = swift_getKeyPath();
  unsigned __int8 v55 = v78;
  int v67 = v78;
  char v56 = v75;
  sub_100014754((uint64_t)v76, (uint64_t)v75, &qword_10012FB40);
  uint64_t v57 = (uint64_t)v56;
  uint64_t v58 = v73;
  sub_100014754(v57, v73, &qword_10012FB40);
  uint64_t v59 = (void *)(v58 + *(int *)(sub_1000082B4(&qword_10012FB58) + 48));
  v79[6] = v109;
  v79[7] = v110;
  v79[8] = v111;
  v79[4] = v107;
  v79[5] = v108;
  v79[2] = v105;
  v79[3] = v106;
  v79[0] = v103;
  v79[1] = v104;
  uint64_t v61 = KeyPath;
  uint64_t v60 = v71;
  uint64_t v62 = v72;
  *(void *)&v79[9] = KeyPath;
  *((void *)&v79[9] + 1) = v72;
  *(void *)&v79[10] = v45;
  *((void *)&v79[10] + 1) = v71;
  long long v63 = v69;
  v79[11] = v69;
  LOBYTE(v79[12]) = v54;
  BYTE8(v79[12]) = v43;
  *(void *)&v79[13] = v47;
  *((void *)&v79[13] + 1) = v49;
  *(void *)&v79[14] = v51;
  *((void *)&v79[14] + 1) = v53;
  LOBYTE(v79[15]) = v55;
  uint64_t v64 = v68;
  *((void *)&v79[15] + 1) = v68;
  LOBYTE(v79[16]) = v74;
  memcpy(v59, v79, 0x101uLL);
  sub_1000D989C((uint64_t)v79);
  sub_1000147B8((uint64_t)v76, &qword_10012FB40);
  long long v86 = v109;
  long long v87 = v110;
  long long v88 = v111;
  long long v82 = v105;
  long long v83 = v106;
  long long v84 = v107;
  long long v85 = v108;
  long long v80 = v103;
  long long v81 = v104;
  uint64_t v89 = v61;
  uint64_t v90 = v62;
  uint64_t v91 = v45;
  uint64_t v92 = v60;
  long long v93 = v63;
  char v94 = v54;
  char v95 = v43;
  uint64_t v96 = v47;
  uint64_t v97 = v49;
  uint64_t v98 = v51;
  uint64_t v99 = v53;
  char v100 = v67;
  uint64_t v101 = v64;
  char v102 = v74;
  sub_1000D9934((uint64_t)&v80);
  return sub_1000147B8((uint64_t)v75, &qword_10012FB40);
}

uint64_t sub_1000D3B78(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  uint64_t v3 = v2;
  uint64_t v4 = sub_1000082B4(&qword_10012FB60);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v31 = (uint64_t)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v23 - v7;
  sub_1000E4F50();
  sub_1000E40A0();
  int v27 = v35;
  uint64_t v26 = v36;
  int v25 = v37;
  uint64_t v30 = v38;
  uint64_t v28 = v34;
  uint64_t v29 = v39;
  uint64_t v9 = sub_1000E4510();
  sub_1000D4008(v1, (uint64_t)v54);
  v55[288] = 0;
  memcpy(&v55[7], v54, 0x119uLL);
  uint64_t v50 = v9;
  uint64_t v51 = 0;
  char v52 = 0;
  memcpy(v53, v55, sizeof(v53));
  sub_1000E4F50();
  sub_1000B6D68(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v33, 0.0, 1, 0.0, 1);
  sub_1000D99CC((uint64_t)v54);
  long long v10 = v8;
  uint64_t v24 = v8;
  sub_1000D2C6C(1, (uint64_t)v8);
  uint64_t v11 = sub_1000E4510();
  sub_1000D49C8(v1, (uint64_t)v56);
  v57[288] = 0;
  memcpy(&v57[7], v56, 0x119uLL);
  uint64_t v46 = v11;
  uint64_t v47 = 0;
  char v48 = 0;
  memcpy(v49, v57, sizeof(v49));
  sub_1000E4F50();
  sub_1000B6F2C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v32, 0.0, 1, 0.0, 1);
  sub_1000D9ADC((uint64_t)v56);
  sub_1000E4F50();
  sub_1000E40A0();
  uint64_t v12 = v40;
  LOBYTE(v8) = v41;
  uint64_t v13 = v42;
  char v14 = v43;
  uint64_t v23 = v44;
  uint64_t v15 = v45;
  uint64_t v16 = (uint64_t)v10;
  uint64_t v17 = v31;
  sub_100014754(v16, v31, &qword_10012FB60);
  *(void *)uint64_t v3 = 0;
  *(unsigned char *)(v3 + 8) = 1;
  *(void *)(v3 + 16) = v28;
  *(unsigned char *)(v3 + 24) = v27;
  *(void *)(v3 + 32) = v26;
  *(unsigned char *)(v3 + 40) = v25;
  uint64_t v18 = v29;
  *(void *)(v3 + 48) = v30;
  *(void *)(v3 + 56) = v18;
  memcpy(v58, v33, sizeof(v58));
  memcpy((void *)(v3 + 64), v33, 0x1A8uLL);
  uint64_t v19 = (int *)sub_1000082B4(&qword_10012FB68);
  sub_100014754(v17, v3 + v19[16], &qword_10012FB60);
  uint64_t v20 = (void *)(v3 + v19[20]);
  memcpy(v59, v32, sizeof(v59));
  memcpy(v20, v32, 0x1A8uLL);
  uint64_t v21 = v3 + v19[24];
  *(void *)uint64_t v21 = 0;
  *(unsigned char *)(v21 + 8) = 1;
  *(void *)(v21 + 16) = v12;
  *(unsigned char *)(v21 + 24) = (_BYTE)v8;
  *(void *)(v21 + 32) = v13;
  *(unsigned char *)(v21 + 40) = v14;
  *(void *)(v21 + 48) = v23;
  *(void *)(v21 + 56) = v15;
  sub_1000D9CAC((uint64_t)v58, (void (*)(void, void, void, void, void, void, void, void, void, void, void, char))sub_10003ABCC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, uint64_t, char))sub_1000C5214);
  sub_1000D9BB8((uint64_t)v59, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000C5214, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, int))sub_10003ABCC);
  sub_1000147B8((uint64_t)v24, &qword_10012FB60);
  memcpy(v60, v32, sizeof(v60));
  sub_1000D9BB8((uint64_t)v60, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000D9AA8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, int))sub_10003AC90);
  sub_1000147B8(v17, &qword_10012FB60);
  memcpy(v61, v33, 0x1A8uLL);
  return sub_1000D9CAC((uint64_t)v61, (void (*)(void, void, void, void, void, void, void, void, void, void, void, char))sub_10003AC90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, uint64_t, char))sub_1000D9AA8);
}

uint64_t sub_1000D4008@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000E47F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000082B4(&qword_10012E7E0);
  __chkstk_darwin(v8 - 8);
  long long v10 = (char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v11 = sub_1000D1AC4();
  uint64_t v103 = v5;
  uint64_t v104 = v4;
  if (v11)
  {
    uint64_t v13 = *(void *)(a1 + 160);
    uint64_t v12 = *(void *)(a1 + 168);
    uint64_t v14 = type metadata accessor for SportsWatchWidgetView();
    uint64_t v15 = a1 + *(int *)(v14 + 20);
    uint64_t v16 = *(void *)(v15 + 48);
    uint64_t v17 = *(void *)(v15 + 56);
    uint64_t v18 = *(void *)(v15 + 64);
    uint64_t v19 = *(void *)(v15 + 88);
    *(void *)unsigned __int8 v116 = v13;
    *(void *)&v116[8] = v12;
    *(void *)&v116[16] = v16;
    *(void *)uint64_t v117 = v17;
    *(void *)&v117[8] = v18;
    *(_OWORD *)&v117[16] = *(_OWORD *)(v15 + 72);
    *(void *)&v117[32] = v19;
    *(void *)&v117[40] = 0;
    *(void *)&v117[48] = 0;
    *(void *)&long long v118 = 0;
    BYTE8(v118) = 0;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v14 = type metadata accessor for SportsWatchWidgetView();
    type metadata accessor for SportsWatchWidgetViewModel(0);
    sub_1000D4808((uint64_t)&v121);
    *(_OWORD *)unsigned __int8 v116 = v121;
    *(void *)&v116[16] = v122;
    *(_OWORD *)uint64_t v117 = v123;
    *(void *)&v117[16] = v124;
    *(void *)&v117[24] = v125;
    *(void *)&v117[32] = v126;
    *(void *)&v117[40] = v127;
    *(void *)&v117[48] = v128;
    *(void *)&long long v118 = v129;
    BYTE8(v118) = 1;
  }
  sub_1000082B4(&qword_10012A248);
  sub_100014448();
  sub_10001449C();
  sub_1000E4690();
  long long v20 = v121;
  uint64_t v114 = v123;
  uint64_t v115 = v122;
  uint64_t v112 = v124;
  uint64_t v113 = *((void *)&v123 + 1);
  uint64_t v110 = v126;
  uint64_t v111 = v125;
  uint64_t v108 = v128;
  uint64_t v109 = v127;
  uint64_t v107 = v129;
  int v106 = v130;
  sub_1000E4F50();
  sub_1000E40A0();
  uint64_t v21 = v136;
  LODWORD(v101) = v137;
  uint64_t v100 = v138;
  LODWORD(v99) = v139;
  uint64_t v97 = v141;
  uint64_t v98 = v140;
  type metadata accessor for SportsWatchWidgetView();
  long long v22 = (void *)(a1 + *(int *)(v14 + 20));
  uint64_t v23 = type metadata accessor for SportsWatchWidgetViewModel(0);
  int v24 = *((unsigned __int8 *)v22 + *(int *)(v23 + 44));
  uint64_t v105 = v20;
  if (v24 == 1)
  {
    uint64_t v25 = v23;
    uint64_t v26 = v22[2];
    uint64_t v27 = v22[3];
    uint64_t v28 = (void *)((char *)v22 + *(int *)(v23 + 48));
    uint64_t v29 = v28[1];
    uint64_t v92 = v21;
    uint64_t v96 = v26;
    if (v29 && (*v28 != *v22 || v29 != v22[1])) {
      sub_1000E5DC0();
    }
    uint64_t v42 = sub_1000E4820();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v10, 1, 1, v42);
    sub_1000E4850();
    sub_1000147B8((uint64_t)v10, &qword_10012E7E0);
    sub_1000E47E0();
    sub_1000E4810();
    swift_release();
    (*(void (**)(char *, uint64_t))(v103 + 8))(v7, v104);
    sub_1000E4840();
    uint64_t v43 = sub_1000E4870();
    swift_release();
    id v44 = [self *(SEL *)v20];
    uint64_t v45 = sub_1000E4BD0();
    int v46 = *((unsigned __int8 *)v22 + *(int *)(v25 + 52));
    uint64_t v30 = *((void *)&v20 + 1);
    if (v46 == 1)
    {
      sub_1000459B8((uint64_t)v142);
      *(_OWORD *)&v116[8] = v142[0];
      *(_OWORD *)uint64_t v117 = v142[1];
      *(_OWORD *)&v117[16] = v142[2];
      *(void *)unsigned __int8 v116 = 0;
      *(_OWORD *)&v117[32] = v142[3];
      *(void *)&v117[48] = v143;
      long long v118 = v144;
      uint64_t v119 = v145;
      char v120 = 0;
      sub_10001409C();
      sub_10001453C();
      sub_1000E4690();
      swift_release();
      swift_release();
    }
    else
    {
      *(void *)unsigned __int8 v116 = v96;
      *(void *)&v116[8] = v27;
      *(void *)&v116[16] = v43;
      *(void *)uint64_t v117 = v45;
      *(int64x2_t *)&v117[8] = vdupq_n_s64(1uLL);
      *(_OWORD *)&v117[24] = xmmword_1000EE790;
      *(_OWORD *)&v117[40] = 0u;
      long long v118 = 0u;
      uint64_t v119 = 0;
      char v120 = 1;
      sub_10001409C();
      sub_10001453C();
      swift_bridgeObjectRetain();
      sub_1000E4690();
    }
    uint64_t v32 = *((void *)&v121 + 1);
    uint64_t v31 = v121;
    uint64_t v93 = v123;
    uint64_t v33 = v124;
    uint64_t v103 = *((void *)&v123 + 1);
    uint64_t v104 = v122;
    uint64_t v34 = v125;
    uint64_t v35 = v126;
    uint64_t v36 = v127;
    uint64_t v37 = v128;
    uint64_t v38 = v129;
    uint64_t v39 = v130;
    uint64_t v40 = v131;
    char v41 = v132;
    uint64_t v21 = v92;
  }
  else
  {
    uint64_t v30 = *((void *)&v20 + 1);
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v103 = 0;
    uint64_t v104 = 0;
    uint64_t v93 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    char v41 = -1;
  }
  char v47 = v101;
  uint64_t v48 = v100;
  char v49 = v99;
  uint64_t v51 = v97;
  uint64_t v50 = v98;
  uint64_t v99 = v34;
  uint64_t v100 = v31;
  uint64_t v101 = v32;
  uint64_t v102 = v30;
  *(void *)(a2 + 112) = v21;
  char v135 = v47;
  *(unsigned char *)(a2 + 120) = v47;
  *(void *)(a2 + 128) = v48;
  char v134 = v49;
  *(unsigned char *)(a2 + 136) = v49;
  *(void *)(a2 + 144) = v50;
  *(void *)(a2 + 152) = v51;
  v116[0] = 1;
  char v133 = 1;
  *(unsigned char *)(a2 + 104) = 1;
  *(unsigned char *)(a2 + 280) = 1;
  uint64_t v52 = v105;
  *(void *)a2 = v105;
  *(void *)(a2 + 8) = v30;
  uint64_t v53 = v52;
  uint64_t v54 = v30;
  uint64_t v55 = v115;
  *(void *)(a2 + 16) = v115;
  char v56 = v55;
  uint64_t v115 = v55;
  uint64_t v57 = v114;
  *(void *)(a2 + 24) = v114;
  uint64_t v58 = v57;
  uint64_t v114 = v57;
  uint64_t v59 = v113;
  *(void *)(a2 + 32) = v113;
  uint64_t v60 = v59;
  uint64_t v113 = v59;
  uint64_t v61 = v112;
  *(void *)(a2 + 40) = v112;
  uint64_t v62 = v61;
  uint64_t v112 = v61;
  uint64_t v63 = v111;
  *(void *)(a2 + 48) = v111;
  uint64_t v64 = v63;
  uint64_t v111 = v63;
  uint64_t v66 = v109;
  uint64_t v65 = v110;
  *(void *)(a2 + 56) = v110;
  *(void *)(a2 + 64) = v66;
  uint64_t v109 = v66;
  uint64_t v110 = v65;
  uint64_t v67 = v66;
  uint64_t v68 = v108;
  *(void *)(a2 + 72) = v108;
  uint64_t v69 = v68;
  uint64_t v108 = v68;
  uint64_t v70 = v107;
  *(void *)(a2 + 80) = v107;
  uint64_t v107 = v70;
  int v71 = v106;
  *(unsigned char *)(a2 + 88) = v106;
  *(void *)(a2 + 96) = 0;
  *(void *)(a2 + 160) = v31;
  *(void *)(a2 + 168) = v32;
  uint64_t v72 = v103;
  uint64_t v73 = v93;
  *(void *)(a2 + 176) = v104;
  *(void *)(a2 + 184) = v73;
  *(void *)(a2 + 192) = v72;
  *(void *)(a2 + 200) = v33;
  *(void *)(a2 + 208) = v34;
  *(void *)(a2 + 216) = v35;
  *(void *)(a2 + 224) = v36;
  *(void *)(a2 + 232) = v37;
  *(void *)(a2 + 240) = v38;
  *(void *)(a2 + 248) = v39;
  *(void *)(a2 + 256) = v40;
  *(unsigned char *)(a2 + 264) = v41;
  *(void *)(a2 + 272) = 0;
  int v106 = v71;
  LOBYTE(v121) = v71;
  char v91 = v71;
  uint64_t v74 = v37;
  uint64_t v94 = v37;
  uint64_t v95 = v36;
  uint64_t v75 = v38;
  uint64_t v96 = v38;
  uint64_t v97 = v40;
  uint64_t v98 = v39;
  uint64_t v76 = v40;
  unsigned __int8 v77 = v41;
  uint64_t v78 = v35;
  uint64_t v79 = v36;
  sub_10003ABCC(v53, v54, v56, v58, v60, v62, v64, v65, v67, v69, v70, v91);
  uint64_t v89 = v39;
  uint64_t v90 = v76;
  uint64_t v87 = v74;
  uint64_t v88 = v75;
  uint64_t v86 = v79;
  uint64_t v80 = v100;
  uint64_t v81 = v101;
  uint64_t v82 = v103;
  uint64_t v83 = v104;
  uint64_t v84 = v99;
  sub_1000C5214(v100, v101, v104, v73, v103, v33, v99, v78, v86, v87, v88, v89, v90, v77);
  sub_1000D9AA8(v80, v81, v83, v73, v82, v33, v84, v78, v95, v94, v96, v98, v97, v77);
  return sub_10003AC90(v105, v102, v115, v114, v113, v112, v111, v110, v109, v108, v107, v106);
}

uint64_t sub_1000D4808@<X0>(uint64_t a1@<X8>)
{
  sub_100014158();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1000E4A00();
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  uint64_t v8 = sub_1000E4940();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_1000141AC(v3, v5, v7);
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_1000E4970();
  uint64_t v15 = v14;
  char v17 = v16 & 1;
  sub_1000141AC(v8, v10, v12);
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_1000E4920();
  uint64_t v20 = v19;
  char v22 = v21;
  uint64_t v24 = v23;
  sub_1000141AC(v13, v15, v17);
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)(v1 + 224);
  uint64_t KeyPath = swift_getKeyPath();
  char v27 = *(unsigned char *)(v1 + 232);
  uint64_t v28 = swift_getKeyPath();
  uint64_t v29 = *(void *)(v1 + 240);
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v18;
  *(void *)(a1 + 8) = v20;
  *(unsigned char *)(a1 + 16) = v22 & 1;
  *(void *)(a1 + 24) = v24;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = v25;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v28;
  *(unsigned char *)(a1 + 64) = v27;
  *(void *)(a1 + 72) = result;
  *(void *)(a1 + 80) = v29;
  return result;
}

uint64_t sub_1000D49C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000E47F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000082B4(&qword_10012E7E0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a1 + *(int *)(type metadata accessor for SportsWatchWidgetView() + 20);
  uint64_t v12 = type metadata accessor for SportsWatchWidgetViewModel(0);
  int v13 = *(unsigned __int8 *)(v11 + *(int *)(v12 + 44));
  uint64_t v100 = *(int *)(v12 + 44);
  if (v13 == 1)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)(v11 + 144);
    char v16 = (void *)(v11 + *(int *)(v12 + 48));
    uint64_t v17 = v16[1];
    uint64_t v114 = *(void *)(v11 + 136);
    uint64_t v115 = v15;
    uint64_t v99 = a1;
    if (v17)
    {
      uint64_t v18 = &selRef_labelColor;
      BOOL v19 = *v16 == *(void *)(v11 + 120) && v17 == *(void *)(v11 + 128);
      if (!v19 && (sub_1000E5DC0() & 1) == 0) {
        uint64_t v18 = &selRef_tertiaryLabelColor;
      }
    }
    else
    {
      uint64_t v18 = &selRef_labelColor;
    }
    uint64_t v20 = sub_1000E4820();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v10, 1, 1, v20);
    sub_1000E4850();
    sub_1000147B8((uint64_t)v10, &qword_10012E7E0);
    sub_1000E47E0();
    sub_1000E4810();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_1000E4840();
    uint64_t v21 = sub_1000E4870();
    swift_release();
    id v22 = [self *v18];
    uint64_t v23 = sub_1000E4BD0();
    if (*(unsigned char *)(v11 + *(int *)(v14 + 52)) == 1)
    {
      sub_1000459B8((uint64_t)v136);
      *(_OWORD *)&v116[8] = v136[0];
      *(_OWORD *)uint64_t v117 = v136[1];
      *(_OWORD *)&v117[16] = v136[2];
      *(void *)unsigned __int8 v116 = 0;
      *(_OWORD *)&v117[32] = v136[3];
      *(void *)&v117[48] = v137;
      long long v118 = v138;
      uint64_t v119 = v139;
      char v120 = 0;
      sub_10001409C();
      sub_10001453C();
      sub_1000E4690();
      swift_release();
      swift_release();
    }
    else
    {
      *(void *)unsigned __int8 v116 = v114;
      *(void *)&v116[8] = v115;
      *(void *)&v116[16] = v21;
      *(void *)uint64_t v117 = v23;
      *(int64x2_t *)&v117[8] = vdupq_n_s64(1uLL);
      *(_OWORD *)&v117[24] = xmmword_1000EE790;
      *(_OWORD *)&v117[40] = 0u;
      long long v118 = 0u;
      uint64_t v119 = 0;
      char v120 = 1;
      sub_10001409C();
      sub_10001453C();
      swift_bridgeObjectRetain();
      sub_1000E4690();
    }
    uint64_t v114 = v122;
    uint64_t v115 = *((void *)&v121 + 1);
    uint64_t v112 = *((void *)&v123 + 1);
    uint64_t v113 = v123;
    uint64_t v104 = v125;
    uint64_t v102 = v121;
    uint64_t v103 = v126;
    uint64_t v110 = v127;
    uint64_t v111 = v124;
    uint64_t v108 = v129;
    uint64_t v109 = v128;
    uint64_t v106 = v131;
    uint64_t v107 = v130;
    int v105 = v132;
    a1 = v99;
  }
  else
  {
    uint64_t v102 = 0;
    uint64_t v103 = 0;
    uint64_t v114 = 0;
    uint64_t v115 = 0;
    uint64_t v112 = 0;
    uint64_t v113 = 0;
    uint64_t v110 = 0;
    uint64_t v111 = 0;
    uint64_t v104 = 0;
    uint64_t v108 = 0;
    uint64_t v109 = 0;
    uint64_t v106 = 0;
    uint64_t v107 = 0;
    int v105 = 255;
  }
  sub_1000E4F50();
  sub_1000E40A0();
  uint64_t v24 = v140;
  int v25 = v141;
  uint64_t v26 = v142;
  char v27 = v143;
  uint64_t v28 = v144;
  uint64_t v101 = v145;
  if (sub_1000D1AC4())
  {
    uint64_t v29 = *(void *)(a1 + 160);
    uint64_t v30 = *(void *)(a1 + 168);
    LODWORD(v100) = v25;
    uint64_t v31 = v28;
    uint64_t v32 = *(void *)(v11 + 168);
    uint64_t v33 = *(void *)(v11 + 176);
    uint64_t v34 = *(void *)(v11 + 184);
    uint64_t v35 = *(void *)(v11 + 208);
    *(void *)unsigned __int8 v116 = v29;
    *(void *)&v116[8] = v30;
    *(void *)&v116[16] = v32;
    *(void *)uint64_t v117 = v33;
    *(void *)&v117[8] = v34;
    *(_OWORD *)&v117[16] = *(_OWORD *)(v11 + 192);
    *(void *)&v117[32] = v35;
    *(void *)&v117[40] = 0;
    *(void *)&v117[48] = 0;
    *(void *)&long long v118 = 0;
    BYTE8(v118) = 0;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000082B4(&qword_10012A248);
    sub_100014448();
    sub_10001449C();
    uint64_t v36 = v31;
    char v37 = v27;
    char v38 = v100;
    sub_1000E4690();
    uint64_t v39 = *((void *)&v121 + 1);
    uint64_t v40 = v121;
    uint64_t v41 = v122;
    uint64_t v43 = *((void *)&v123 + 1);
    uint64_t v42 = v123;
    uint64_t v44 = v124;
    uint64_t v46 = v125;
    uint64_t v45 = v126;
    uint64_t v47 = v127;
    uint64_t v48 = v128;
    uint64_t v49 = v129;
    int v50 = v130;
    uint64_t v51 = v101;
  }
  else
  {
    uint64_t v95 = v28;
    char v37 = v27;
    char v38 = v25;
    uint64_t v51 = v101;
    sub_1000D4808((uint64_t)&v121);
    *(_OWORD *)unsigned __int8 v116 = v121;
    *(void *)&v116[16] = v122;
    *(_OWORD *)uint64_t v117 = v123;
    *(void *)&v117[16] = v124;
    *(void *)&v117[24] = v125;
    *(void *)&v117[32] = v126;
    *(void *)&v117[40] = v127;
    *(void *)&v117[48] = v128;
    *(void *)&long long v118 = v129;
    BYTE8(v118) = 1;
    sub_1000082B4(&qword_10012A248);
    sub_100014448();
    sub_10001449C();
    sub_1000E4690();
    uint64_t v39 = *((void *)&v121 + 1);
    uint64_t v40 = v121;
    uint64_t v41 = v122;
    uint64_t v43 = *((void *)&v123 + 1);
    uint64_t v42 = v123;
    uint64_t v44 = v124;
    uint64_t v46 = v125;
    uint64_t v45 = v126;
    uint64_t v47 = v127;
    uint64_t v48 = v128;
    uint64_t v49 = v129;
    int v50 = v130;
    uint64_t v36 = v95;
  }
  uint64_t v99 = v45;
  uint64_t v100 = v43;
  LOBYTE(v121) = 1;
  v116[0] = 1;
  *(unsigned char *)(a2 + 8) = 1;
  *(unsigned char *)(a2 + 136) = 1;
  *(void *)(a2 + 144) = v24;
  char v135 = v38;
  *(unsigned char *)(a2 + 152) = v38;
  *(void *)(a2 + 160) = v26;
  char v134 = v37;
  *(unsigned char *)(a2 + 168) = v37;
  *(void *)(a2 + 176) = v36;
  *(void *)(a2 + 184) = v51;
  *(void *)a2 = 0;
  uint64_t v52 = v102;
  *(void *)(a2 + 16) = v102;
  uint64_t v53 = v52;
  uint64_t v101 = v39;
  uint64_t v102 = v52;
  uint64_t v54 = v115;
  *(void *)(a2 + 24) = v115;
  uint64_t v55 = v54;
  uint64_t v115 = v54;
  uint64_t v56 = v114;
  *(void *)(a2 + 32) = v114;
  uint64_t v57 = v56;
  uint64_t v114 = v56;
  uint64_t v58 = v113;
  *(void *)(a2 + 40) = v113;
  uint64_t v59 = v58;
  uint64_t v113 = v58;
  uint64_t v60 = v112;
  *(void *)(a2 + 48) = v112;
  uint64_t v61 = v60;
  uint64_t v112 = v60;
  uint64_t v62 = v111;
  *(void *)(a2 + 56) = v111;
  uint64_t v63 = v62;
  uint64_t v111 = v62;
  uint64_t v64 = v104;
  *(void *)(a2 + 64) = v104;
  uint64_t v65 = v64;
  uint64_t v104 = v64;
  uint64_t v66 = v103;
  *(void *)(a2 + 72) = v103;
  uint64_t v67 = v66;
  uint64_t v103 = v66;
  uint64_t v68 = v110;
  *(void *)(a2 + 80) = v110;
  uint64_t v69 = v68;
  uint64_t v110 = v68;
  uint64_t v70 = v109;
  *(void *)(a2 + 88) = v109;
  uint64_t v71 = v70;
  uint64_t v109 = v70;
  uint64_t v72 = v108;
  *(void *)(a2 + 96) = v108;
  uint64_t v73 = v72;
  uint64_t v108 = v72;
  uint64_t v74 = v107;
  *(void *)(a2 + 104) = v107;
  uint64_t v75 = v74;
  uint64_t v107 = v74;
  uint64_t v76 = v106;
  *(void *)(a2 + 112) = v106;
  uint64_t v77 = v76;
  uint64_t v106 = v76;
  LOBYTE(v76) = v105;
  *(unsigned char *)(a2 + 120) = v105;
  *(void *)(a2 + 128) = 0;
  *(void *)(a2 + 192) = v40;
  *(void *)(a2 + 200) = v39;
  *(void *)(a2 + 208) = v41;
  *(void *)(a2 + 216) = v42;
  *(void *)(a2 + 224) = v43;
  *(void *)(a2 + 232) = v44;
  *(void *)(a2 + 240) = v46;
  *(void *)(a2 + 248) = v45;
  *(void *)(a2 + 256) = v47;
  *(void *)(a2 + 264) = v48;
  *(void *)(a2 + 272) = v49;
  *(unsigned char *)(a2 + 280) = v50;
  char v133 = v50;
  uint64_t v92 = v75;
  uint64_t v93 = v77;
  uint64_t v91 = v71;
  uint64_t v90 = v69;
  uint64_t v98 = v40;
  int v97 = v50;
  LOBYTE(v77) = v41;
  uint64_t v78 = v42;
  uint64_t v79 = v44;
  uint64_t v96 = v44;
  uint64_t v80 = v46;
  uint64_t v81 = v47;
  uint64_t v82 = v48;
  uint64_t v83 = v49;
  sub_1000C5214(v53, v55, v57, v59, v61, v63, v65, v67, v90, v91, v73, v92, v93, v76);
  uint64_t v84 = v40;
  uint64_t v86 = v100;
  uint64_t v85 = v101;
  uint64_t v87 = v79;
  uint64_t v88 = v99;
  sub_10003ABCC(v84, v101, v77, v78, v100, v87, v80, v99, v81, v82, v83, v50);
  sub_10003AC90(v98, v85, v77, v78, v86, v96, v80, v88, v81, v82, v83, v97);
  return sub_1000D9AA8(v102, v115, v114, v113, v112, v111, v104, v103, v110, v109, v108, v107, v106, v105);
}

uint64_t sub_1000D5200@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = a1 + *(int *)(type metadata accessor for SportsWatchWidgetView() + 20);
  uint64_t v5 = v4 + *(int *)(type metadata accessor for SportsWatchWidgetViewModel(0) + 28);
  if (!*(void *)(v5 + 8))
  {
    uint64_t v54 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    uint64_t v48 = 0;
    uint64_t KeyPath = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    uint64_t v45 = 0;
    if (*(void *)(v5 + 24)) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v42 = 0;
    uint64_t v44 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v33 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v34 = 0;
    goto LABEL_6;
  }
  uint64_t v43 = v5;
  sub_100014158();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1000E4A00();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  uint64_t v11 = sub_1000E4940();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  sub_1000141AC(v6, v8, v10);
  swift_bridgeObjectRelease();
  uint64_t v54 = sub_1000E4970();
  uint64_t v52 = v17;
  uint64_t v53 = v16;
  uint64_t v51 = v18 & 1;
  sub_1000141AC(v11, v13, v15);
  swift_bridgeObjectRelease();
  uint64_t v50 = *(void *)(a1 + 88);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v47 = *(unsigned __int8 *)(a1 + 96);
  uint64_t v48 = swift_getKeyPath();
  uint64_t v46 = *(void *)(a1 + 104);
  uint64_t v45 = swift_getKeyPath();
  if (!*(void *)(v43 + 24)) {
    goto LABEL_5;
  }
LABEL_3:
  sub_100014158();
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_1000E4A00();
  uint64_t v21 = v20;
  char v23 = v22 & 1;
  uint64_t v24 = sub_1000E4940();
  uint64_t v26 = v25;
  char v28 = v27 & 1;
  sub_1000141AC(v19, v21, v23);
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_1000E4970();
  uint64_t v42 = v30;
  uint64_t v44 = v29;
  uint64_t v40 = v31 & 1;
  uint64_t v41 = v32;
  sub_1000141AC(v24, v26, v28);
  swift_bridgeObjectRelease();
  uint64_t v39 = *(void *)(a1 + 88);
  uint64_t v33 = swift_getKeyPath();
  uint64_t v37 = *(unsigned __int8 *)(a1 + 96);
  uint64_t v38 = swift_getKeyPath();
  uint64_t v36 = *(void *)(a1 + 104);
  uint64_t v34 = swift_getKeyPath();
LABEL_6:
  *a2 = v54;
  a2[1] = v53;
  a2[2] = v51;
  a2[3] = v52;
  a2[4] = KeyPath;
  a2[5] = v50;
  a2[6] = 0;
  a2[7] = v48;
  a2[8] = v47;
  a2[9] = v45;
  a2[10] = v46;
  a2[11] = v44;
  a2[12] = v42;
  a2[13] = v40;
  a2[14] = v41;
  a2[15] = v33;
  a2[16] = v39;
  a2[17] = 0;
  a2[18] = v38;
  a2[19] = v37;
  a2[20] = v34;
  a2[21] = v36;
  sub_10003A908(v54, v53, v51, v52);
  sub_10003A908(v44, v42, v40, v41);
  sub_10003A988(v44, v42, v40, v41);
  return sub_10003A988(v54, v53, v51, v52);
}

uint64_t sub_1000D5600@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = sub_1000E47F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000082B4(&qword_10012E7E0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1 + *(int *)(type metadata accessor for SportsWatchWidgetView() + 20);
  uint64_t v14 = type metadata accessor for SportsWatchWidgetViewModel(0);
  uint64_t v15 = *(int *)(v14 + 44);
  int v16 = *(unsigned __int8 *)(v13 + v15);
  uint64_t v90 = a3;
  uint64_t v85 = v15;
  if (v16 != 1)
  {
    uint64_t v99 = 0;
    uint64_t v100 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v97 = 0;
    uint64_t v98 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v95 = 0;
    uint64_t v96 = 0;
    uint64_t v93 = 0;
    uint64_t v94 = 0;
    uint64_t v92 = 0;
    int v27 = 255;
    goto LABEL_16;
  }
  uint64_t v17 = v14;
  uint64_t v18 = *(int *)(v14 + 48);
  uint64_t v89 = v13;
  uint64_t v19 = (void *)(v13 + v18);
  uint64_t v20 = v19[1];
  if (v20)
  {
    uint64_t v21 = &selRef_labelColor;
    BOOL v22 = *v19 == *(void *)a2 && v20 == *(void *)(a2 + 8);
    if (!v22 && (sub_1000E5DC0() & 1) == 0) {
      uint64_t v21 = &selRef_tertiaryLabelColor;
    }
  }
  else
  {
    uint64_t v21 = &selRef_labelColor;
  }
  uint64_t v28 = sub_1000E4820();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v12, 1, 1, v28);
  sub_1000E4850();
  sub_1000147B8((uint64_t)v12, &qword_10012E7E0);
  sub_1000E47E0();
  sub_1000E4810();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1000E4840();
  uint64_t v29 = sub_1000E4870();
  swift_release();
  id v30 = [self *v21];
  uint64_t v31 = sub_1000E4BD0();
  if (*(unsigned char *)(v89 + *(int *)(v17 + 52)) != 1)
  {
    uint64_t v32 = *(void *)(a2 + 24);
    *(void *)uint64_t v101 = *(void *)(a2 + 16);
    *(void *)&v101[8] = v32;
    *(void *)&v101[16] = v29;
    *(void *)uint64_t v102 = v31;
    *(int64x2_t *)&v102[8] = vdupq_n_s64(1uLL);
    *(_OWORD *)&v102[24] = xmmword_1000EE790;
    *(_OWORD *)&v102[40] = 0u;
    long long v103 = 0u;
    uint64_t v104 = 0;
    char v105 = 1;
    sub_10001409C();
    sub_10001453C();
    swift_bridgeObjectRetain();
    sub_1000E4690();
    uint64_t v23 = *((void *)&v106 + 1);
    uint64_t v24 = v108;
    uint64_t v99 = v107;
    uint64_t v100 = v106;
    uint64_t v25 = v110;
    uint64_t v97 = v109;
    uint64_t v98 = *((void *)&v108 + 1);
    uint64_t v26 = v111;
    uint64_t v95 = v113;
    uint64_t v96 = v112;
    uint64_t v93 = v115;
    uint64_t v94 = v114;
    uint64_t v92 = v116;
    int v27 = v117;
LABEL_16:
    int v91 = v27;
    if (!sub_1000D1AC4()) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v33 = *(void *)(a1 + 144);
    uint64_t v34 = *(void *)(a1 + 152);
    uint64_t v35 = *(void *)(a2 + 48);
    uint64_t v36 = *(void *)(a2 + 56);
    uint64_t v37 = *(void *)(a2 + 64);
    uint64_t v38 = *(void *)(a2 + 88);
    *(void *)uint64_t v101 = v33;
    *(void *)&v101[8] = v34;
    *(void *)&v101[16] = v35;
    *(void *)uint64_t v102 = v36;
    *(void *)&v102[8] = v37;
    *(_OWORD *)&v102[16] = *(_OWORD *)(a2 + 72);
    *(void *)&v102[32] = v38;
    *(void *)&v102[40] = 0;
    *(void *)&v102[48] = 0;
    *(void *)&long long v103 = 0;
    BYTE8(v103) = 0;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_18;
  }
  sub_1000459B8((uint64_t)v118);
  *(_OWORD *)&v101[8] = v118[0];
  *(_OWORD *)uint64_t v102 = v118[1];
  *(_OWORD *)&v102[16] = v118[2];
  *(void *)uint64_t v101 = 0;
  *(_OWORD *)&v102[32] = v118[3];
  *(void *)&v102[48] = v119;
  long long v103 = v120;
  uint64_t v104 = v121;
  char v105 = 0;
  sub_10001409C();
  sub_10001453C();
  sub_1000E4690();
  swift_release();
  swift_release();
  uint64_t v23 = *((void *)&v106 + 1);
  uint64_t v24 = v108;
  uint64_t v99 = v107;
  uint64_t v100 = v106;
  uint64_t v25 = v110;
  uint64_t v97 = v109;
  uint64_t v98 = *((void *)&v108 + 1);
  uint64_t v26 = v111;
  uint64_t v95 = v113;
  uint64_t v96 = v112;
  uint64_t v93 = v115;
  uint64_t v94 = v114;
  uint64_t v92 = v116;
  int v91 = v117;
  if (sub_1000D1AC4()) {
    goto LABEL_17;
  }
LABEL_14:
  sub_1000D4808((uint64_t)&v106);
  *(_OWORD *)uint64_t v101 = v106;
  *(void *)&v101[16] = v107;
  *(_OWORD *)uint64_t v102 = v108;
  *(void *)&v102[16] = v109;
  *(void *)&v102[24] = v110;
  *(void *)&v102[32] = v111;
  *(void *)&v102[40] = v112;
  *(void *)&v102[48] = v113;
  *(void *)&long long v103 = v114;
  BYTE8(v103) = 1;
LABEL_18:
  sub_1000082B4(&qword_10012A248);
  sub_100014448();
  sub_10001449C();
  sub_1000E4690();
  long long v39 = v106;
  uint64_t v40 = v107;
  long long v42 = v108;
  uint64_t v41 = v109;
  uint64_t v44 = v110;
  uint64_t v43 = v111;
  uint64_t v45 = v112;
  uint64_t v46 = v113;
  uint64_t v47 = v114;
  uint64_t v79 = v111;
  uint64_t v83 = v110;
  uint64_t v84 = *((void *)&v106 + 1);
  LOBYTE(v106) = v115;
  uint64_t v48 = v100;
  char v49 = v115;
  LODWORD(v85) = v115;
  uint64_t v50 = v90;
  void *v90 = v100;
  v50[1] = v23;
  uint64_t v51 = v48;
  uint64_t v100 = v48;
  uint64_t v88 = v24;
  uint64_t v89 = v23;
  uint64_t v52 = v99;
  _OWORD v50[2] = v99;
  v50[3] = v24;
  uint64_t v53 = v52;
  uint64_t v99 = v52;
  uint64_t v54 = v24;
  uint64_t v55 = v98;
  v50[4] = v98;
  uint64_t v56 = v55;
  uint64_t v98 = v55;
  uint64_t v57 = v97;
  v50[5] = v97;
  v50[6] = v25;
  uint64_t v58 = v57;
  uint64_t v97 = v57;
  uint64_t v59 = v25;
  uint64_t v86 = v26;
  uint64_t v87 = v25;
  uint64_t v60 = v26;
  uint64_t v62 = v95;
  uint64_t v61 = v96;
  v50[7] = v26;
  v50[8] = v61;
  uint64_t v95 = v62;
  uint64_t v96 = v61;
  uint64_t v64 = v93;
  uint64_t v63 = v94;
  v50[9] = v62;
  v50[10] = v63;
  uint64_t v93 = v64;
  uint64_t v94 = v63;
  uint64_t v65 = v92;
  v50[11] = v64;
  v50[12] = v65;
  uint64_t v92 = v65;
  int v66 = v91;
  *((unsigned char *)v50 + 104) = v91;
  int v91 = v66;
  *((_OWORD *)v50 + 7) = v39;
  v50[16] = v40;
  *(_OWORD *)(v50 + 17) = v42;
  v50[19] = v41;
  v50[20] = v44;
  v50[21] = v43;
  v50[22] = v45;
  v50[23] = v46;
  v50[24] = v47;
  *((unsigned char *)v50 + 200) = v49;
  unsigned __int8 v78 = v66;
  uint64_t v77 = v64;
  uint64_t v80 = v39;
  uint64_t v81 = v41;
  char v67 = v40;
  uint64_t v82 = *((void *)&v42 + 1);
  uint64_t v68 = v41;
  uint64_t v69 = v45;
  uint64_t v70 = v46;
  uint64_t v71 = v47;
  sub_1000C5214(v51, v23, v53, v54, v56, v58, v59, v60, v61, v62, v63, v77, v65, v78);
  LOBYTE(v41) = v85;
  uint64_t v72 = v84;
  uint64_t v73 = v68;
  uint64_t v74 = v83;
  uint64_t v75 = v79;
  sub_10003ABCC(v39, v84, v67, v42, *((uint64_t *)&v42 + 1), v73, v83, v79, v69, v70, v71, v85);
  sub_10003AC90(v80, v72, v67, v42, v82, v81, v74, v75, v69, v70, v71, v41);
  return sub_1000D9AA8(v100, v89, v99, v88, v98, v97, v87, v86, v96, v95, v94, v93, v92, v91);
}

uint64_t sub_1000D5D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D3>)
{
  uint64_t v6 = sub_1000E4140();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = &v31[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  uint64_t v12 = &v31[-v11];
  sub_1000E4170();
  sub_1000DAC84(&qword_10012FBD8, (void (*)(uint64_t))&type metadata accessor for LayoutSubviews);
  sub_1000E5B20();
  sub_1000E5B50();
  uint64_t result = sub_1000E5B40();
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  double v16 = 0.0;
  uint64_t v17 = 0;
  double v18 = 0.0;
  uint64_t v19 = 0;
  if (result == 3)
  {
    sub_1000E4180();
    sub_1000E4200();
    char v32 = v20 & 1;
    v31[0] = v21 & 1;
    sub_1000E4120();
    uint64_t v17 = v23;
    if (v22 <= a3) {
      double v16 = v22;
    }
    else {
      double v16 = a3;
    }
    sub_1000E4180();
    sub_1000E4200();
    char v32 = v24 & 1;
    v31[0] = v25 & 1;
    sub_1000E4120();
    uint64_t v19 = v27;
    if (v26 <= a3) {
      double v18 = v26;
    }
    else {
      double v18 = a3;
    }
    sub_1000DACCC(a1);
    uint64_t v14 = v28;
    uint64_t v15 = v29;
    id v30 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
    v30(v10, v6);
    uint64_t result = ((uint64_t (*)(unsigned char *, uint64_t))v30)(v12, v6);
  }
  *(void *)a2 = v14;
  *(void *)(a2 + 8) = v15;
  *(double *)(a2 + 16) = v16;
  *(void *)(a2 + 24) = v17;
  *(double *)(a2 + 32) = v18;
  *(void *)(a2 + 40) = v19;
  return result;
}

double sub_1000D5F84@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  sub_1000D5D1C(a1, (uint64_t)v6, *(double *)(v2 + 24));
  long long v4 = v6[1];
  *a2 = v6[0];
  a2[1] = v4;
  double result = *(double *)&v7;
  a2[2] = v7;
  return result;
}

double sub_1000D5FD4(uint64_t a1, char a2)
{
  int v3 = a2 & 1;
  sub_1000E4170();
  sub_1000DAC84(&qword_10012FBD8, (void (*)(uint64_t))&type metadata accessor for LayoutSubviews);
  sub_1000E5B20();
  sub_1000E5B50();
  uint64_t v4 = sub_1000E5B40();
  double result = 0.0;
  if (v4 == 3 && v3 == 0) {
    return *(double *)&a1;
  }
  return result;
}

uint64_t sub_1000D60AC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1000DA894(a1, a2, a3, a4, *v10, v10[1], v10[2], a9, a10);
}

uint64_t sub_1000D60C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1000D6130(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t (*)(uint64_t))&Layout.explicitAlignment(of:in:proposal:subviews:cache:));
}

uint64_t sub_1000D60F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1000D6130(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t (*)(uint64_t))&Layout.explicitAlignment(of:in:proposal:subviews:cache:));
}

uint64_t sub_1000D6130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

uint64_t sub_1000D6174(int a1)
{
  int v29 = a1;
  uint64_t v1 = sub_1000E47F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v30 = v1;
  uint64_t v31 = v2;
  __chkstk_darwin(v1);
  uint64_t v23 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000082B4(&qword_10012E7E0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000E48B0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v28 = enum case for Font.TextStyle.footnote(_:);
  uint64_t v27 = *(void (**)(char *))(v8 + 104);
  v20[0] = v7;
  v27(v10);
  uint64_t v11 = enum case for Font.Design.rounded(_:);
  unsigned int v25 = enum case for Font.Design.rounded(_:);
  uint64_t v12 = sub_1000E4820();
  uint64_t v13 = *(void *)(v12 - 8);
  char v24 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 104);
  v24(v6, v11, v12);
  double v22 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
  v22(v6, 0, 1, v12);
  sub_1000E4860();
  sub_1000147B8((uint64_t)v6, &qword_10012E7E0);
  uint64_t v14 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20[1] = v8 + 8;
  char v21 = v14;
  v14(v10, v7);
  uint64_t v15 = v23;
  sub_1000E47E0();
  sub_1000E4810();
  swift_release();
  double v16 = *(void (**)(char *, uint64_t))(v31 + 8);
  v31 += 8;
  v16(v15, v30);
  sub_1000E4840();
  uint64_t v26 = sub_1000E4870();
  swift_release();
  id v17 = [self labelColor];
  sub_1000E4BD0();
  uint64_t v18 = v20[0];
  ((void (*)(char *, void, void))v27)(v10, v28, v20[0]);
  v24(v6, v25, v12);
  v22(v6, 0, 1, v12);
  sub_1000E4860();
  sub_1000147B8((uint64_t)v6, &qword_10012E7E0);
  v21(v10, v18);
  sub_1000E47E0();
  sub_1000E4810();
  swift_release();
  v16(v15, v30);
  sub_1000E4840();
  sub_1000E4870();
  swift_release();
  if (v29) {
    return 3;
  }
  else {
    return 2;
  }
}

uint64_t sub_1000D6584@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000E47F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v52 = v2;
  uint64_t v53 = v3;
  __chkstk_darwin(v2);
  uint64_t v51 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000082B4(&qword_10012E7E0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000E48B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v49) = enum case for Font.TextStyle.footnote(_:);
  uint64_t v12 = *(void (**)(void))(v9 + 104);
  uint64_t v45 = v9 + 104;
  uint64_t v48 = (void (*)(char *, void, uint64_t))v12;
  v12(v11);
  uint64_t v13 = enum case for Font.Design.rounded(_:);
  unsigned int v47 = enum case for Font.Design.rounded(_:);
  uint64_t v14 = sub_1000E4820();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 104);
  v46(v7, v13, v14);
  uint64_t v44 = *(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56);
  v44(v7, 0, 1, v14);
  sub_1000E4860();
  sub_1000147B8((uint64_t)v7, &qword_10012E7E0);
  double v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v42[1] = v9 + 8;
  uint64_t v43 = v16;
  v16(v11, v8);
  id v17 = v51;
  sub_1000E47E0();
  sub_1000E4810();
  swift_release();
  v42[0] = *(void *)(v53 + 8);
  v53 += 8;
  ((void (*)(char *, uint64_t))v42[0])(v17, v52);
  sub_1000E4840();
  uint64_t v50 = sub_1000E4870();
  swift_release();
  v48(v11, v49, v8);
  v46(v7, v47, v14);
  v44(v7, 0, 1, v14);
  sub_1000E4860();
  sub_1000147B8((uint64_t)v7, &qword_10012E7E0);
  v43(v11, v8);
  uint64_t v18 = v51;
  sub_1000E47E0();
  sub_1000E4810();
  swift_release();
  ((void (*)(char *, uint64_t))v42[0])(v18, v52);
  sub_1000E4840();
  uint64_t v53 = sub_1000E4870();
  swift_release();
  uint64_t v19 = self;
  id v20 = [v19 labelColor];
  uint64_t v49 = sub_1000E4BD0();
  uint64_t v21 = sub_1000E4F60();
  uint64_t v51 = v22;
  uint64_t v52 = v21;
  id v23 = [v19 labelColor];
  uint64_t v24 = sub_1000E4BD0();
  uint64_t v25 = sub_1000E4F40();
  uint64_t v27 = v26;
  uint64_t v28 = sub_1000E45C0();
  id v29 = [v19 labelColor];
  uint64_t v30 = sub_1000E4BD0();
  id v31 = [v19 labelColor];
  uint64_t v32 = sub_1000E4BD0();
  id v33 = [v19 labelColor];
  uint64_t v34 = sub_1000E4BD0();
  uint64_t v35 = sub_1000E4880();
  uint64_t v36 = sub_1000E4800();
  uint64_t result = sub_1000E4840();
  *(_OWORD *)a1 = xmmword_1000F8F00;
  uint64_t v38 = v50;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = v38;
  uint64_t v39 = v49;
  *(void *)(a1 + 32) = v53;
  *(void *)(a1 + 40) = v39;
  *(void *)(a1 + 48) = 2;
  *(unsigned char *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 57) = *(_DWORD *)v56;
  *(_DWORD *)(a1 + 60) = *(_DWORD *)&v56[3];
  uint64_t v40 = v51;
  *(void *)(a1 + 64) = v52;
  *(void *)(a1 + 72) = v40;
  *(void *)(a1 + 80) = v24;
  *(void *)(a1 + 88) = 2;
  *(unsigned char *)(a1 + 96) = 1;
  LODWORD(v39) = *(_DWORD *)v55;
  *(_DWORD *)(a1 + 100) = *(_DWORD *)&v55[3];
  *(_DWORD *)(a1 + 97) = v39;
  *(void *)(a1 + 104) = 0x3FD3333333333333;
  *(void *)(a1 + 112) = v25;
  *(void *)(a1 + 120) = v27;
  *(void *)(a1 + 128) = v28;
  *(_OWORD *)(a1 + 136) = xmmword_1000F8F10;
  *(void *)(a1 + 152) = v30;
  *(void *)(a1 + 160) = 0x4035000000000000;
  *(void *)(a1 + 168) = v32;
  *(_OWORD *)(a1 + 176) = xmmword_1000F8F20;
  *(void *)(a1 + 192) = v34;
  *(void *)(a1 + 200) = v35;
  *(void *)(a1 + 208) = v36;
  *(void *)(a1 + 216) = v41;
  *(void *)(a1 + 224) = 1;
  *(unsigned char *)(a1 + 232) = 1;
  LODWORD(v39) = *(_DWORD *)v54;
  *(_DWORD *)(a1 + 236) = *(_DWORD *)&v54[3];
  *(_DWORD *)(a1 + 233) = v39;
  *(void *)(a1 + 240) = 0x3FE0000000000000;
  return result;
}

void *sub_1000D6AEC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v32 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v32 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v86 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v86;
    uint64_t v89 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v89;
    *(void *)(a1 + 48) = a2[6];
    *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
    *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
    uint64_t v5 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v5;
    *(unsigned char *)(a1 + 96) = *((unsigned char *)a2 + 96);
    *(void *)(a1 + 104) = a2[13];
    long long v6 = *((_OWORD *)a2 + 8);
    *(_OWORD *)(a1 + 112) = *((_OWORD *)a2 + 7);
    *(_OWORD *)(a1 + 128) = v6;
    uint64_t v7 = a2[19];
    *(void *)(a1 + 144) = a2[18];
    *(void *)(a1 + 152) = v7;
    uint64_t v8 = a2[21];
    *(void *)(a1 + 160) = a2[20];
    *(void *)(a1 + 168) = v8;
    *(_OWORD *)(a1 + 176) = *((_OWORD *)a2 + 11);
    uint64_t v81 = a2[25];
    *(void *)(a1 + 192) = a2[24];
    *(void *)(a1 + 200) = v81;
    *(void *)(a1 + 208) = a2[26];
    *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 27);
    *(unsigned char *)(a1 + 232) = *((unsigned char *)a2 + 232);
    *(void *)(a1 + 240) = a2[30];
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = *(uint64_t *)((char *)a2 + v9 + 8);
    *(void *)uint64_t v10 = *(uint64_t *)((char *)a2 + v9);
    *(void *)(v10 + 8) = v12;
    uint64_t v13 = *(uint64_t *)((char *)a2 + v9 + 24);
    *(void *)(v10 + 16) = *(uint64_t *)((char *)a2 + v9 + 16);
    *(void *)(v10 + 24) = v13;
    uint64_t v14 = *(uint64_t *)((char *)a2 + v9 + 40);
    *(void *)(v10 + 32) = *(uint64_t *)((char *)a2 + v9 + 32);
    *(void *)(v10 + 40) = v14;
    uint64_t v15 = *(uint64_t *)((char *)a2 + v9 + 56);
    *(void *)(v10 + 48) = *(uint64_t *)((char *)a2 + v9 + 48);
    *(void *)(v10 + 56) = v15;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v9 + 72);
    *(void *)(v10 + 64) = *(uint64_t *)((char *)a2 + v9 + 64);
    *(void *)(v10 + 72) = v16;
    uint64_t v17 = *(uint64_t *)((char *)a2 + v9 + 88);
    *(void *)(v10 + 80) = *(uint64_t *)((char *)a2 + v9 + 80);
    *(void *)(v10 + 88) = v17;
    *(unsigned char *)(v10 + 96) = *((unsigned char *)a2 + v9 + 96);
    *(void *)(v10 + 104) = *(uint64_t *)((char *)a2 + v9 + 104);
    *(unsigned char *)(v10 + 112) = *((unsigned char *)a2 + v9 + 112);
    uint64_t v18 = *(uint64_t *)((char *)a2 + v9 + 128);
    *(void *)(v10 + 120) = *(uint64_t *)((char *)a2 + v9 + 120);
    *(void *)(v10 + 128) = v18;
    uint64_t v19 = *(uint64_t *)((char *)a2 + v9 + 144);
    *(void *)(v10 + 136) = *(uint64_t *)((char *)a2 + v9 + 136);
    *(void *)(v10 + 144) = v19;
    uint64_t v20 = *(uint64_t *)((char *)a2 + v9 + 160);
    *(void *)(v10 + 152) = *(uint64_t *)((char *)a2 + v9 + 152);
    *(void *)(v10 + 160) = v20;
    uint64_t v21 = *(uint64_t *)((char *)a2 + v9 + 176);
    *(void *)(v10 + 168) = *(uint64_t *)((char *)a2 + v9 + 168);
    *(void *)(v10 + 176) = v21;
    uint64_t v22 = *(uint64_t *)((char *)a2 + v9 + 192);
    *(void *)(v10 + 184) = *(uint64_t *)((char *)a2 + v9 + 184);
    *(void *)(v10 + 192) = v22;
    uint64_t v23 = *(uint64_t *)((char *)a2 + v9 + 208);
    *(void *)(v10 + 200) = *(uint64_t *)((char *)a2 + v9 + 200);
    *(void *)(v10 + 208) = v23;
    *(unsigned char *)(v10 + 216) = *((unsigned char *)a2 + v9 + 216);
    *(void *)(v10 + 224) = *(uint64_t *)((char *)a2 + v9 + 224);
    *(unsigned char *)(v10 + 232) = *((unsigned char *)a2 + v9 + 232);
    uint64_t v78 = type metadata accessor for SportsWatchWidgetViewModel(0);
    uint64_t v24 = *(int *)(v78 + 24);
    uint64_t v25 = (void *)(v10 + v24);
    uint64_t v26 = (char *)(v11 + v24);
    type metadata accessor for SportsWidgetClock(0);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v33 = *((void *)v26 + 1);
      *uint64_t v25 = *(void *)v26;
      v25[1] = v33;
      uint64_t v34 = *((void *)v26 + 3);
      v25[2] = *((void *)v26 + 2);
      v25[3] = v34;
      uint64_t v35 = *((void *)v26 + 5);
      v25[4] = *((void *)v26 + 4);
      v25[5] = v35;
      uint64_t v36 = *((void *)v26 + 7);
      v25[6] = *((void *)v26 + 6);
      v25[7] = v36;
      uint64_t v87 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v37 = v87[8];
      uint64_t v38 = (char *)v25 + v37;
      uint64_t v79 = &v26[v37];
      uint64_t v39 = sub_1000E3EE0();
      uint64_t v84 = *(void *)(v39 - 8);
      uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v84 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v40(v38, v79, v39);
      uint64_t v41 = sub_1000082B4(&qword_100129F28);
      uint64_t v82 = v40;
      v40(&v38[*(int *)(v41 + 36)], &v79[*(int *)(v41 + 36)], v39);
      uint64_t v42 = v87[9];
      uint64_t v43 = (char *)v25 + v42;
      uint64_t v44 = &v26[v42];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v84 + 48))(&v26[v42], 1, v39))
      {
        uint64_t v45 = sub_1000082B4(&qword_100129F30);
        memcpy(v43, v44, *(void *)(*(void *)(v45 - 8) + 64));
      }
      else
      {
        v82(v43, v44, v39);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v84 + 56))(v43, 0, 1, v39);
      }
      *((unsigned char *)v25 + v87[10]) = v26[v87[10]];
      *((unsigned char *)v25 + v87[11]) = v26[v87[11]];
      uint64_t v59 = type metadata accessor for SportsWidgetSoccerClockViewModel(0);
      *(void *)((char *)v25 + *(int *)(v59 + 20)) = *(void *)&v26[*(int *)(v59 + 20)];
      swift_bridgeObjectRetain();
      id v31 = (int *)v78;
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v28 = *((void *)v26 + 1);
      *uint64_t v25 = *(void *)v26;
      v25[1] = v28;
      uint64_t v29 = *((void *)v26 + 3);
      v25[2] = *((void *)v26 + 2);
      v25[3] = v29;
      uint64_t v30 = *((void *)v26 + 5);
      v25[4] = *((void *)v26 + 4);
      v25[5] = v30;
      *((unsigned char *)v25 + 48) = v26[48];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v31 = (int *)v78;
    }
    else
    {
      uint64_t v46 = *((void *)v26 + 1);
      *uint64_t v25 = *(void *)v26;
      v25[1] = v46;
      uint64_t v47 = *((void *)v26 + 3);
      v25[2] = *((void *)v26 + 2);
      v25[3] = v47;
      uint64_t v48 = *((void *)v26 + 5);
      v25[4] = *((void *)v26 + 4);
      v25[5] = v48;
      uint64_t v49 = *((void *)v26 + 7);
      v25[6] = *((void *)v26 + 6);
      v25[7] = v49;
      uint64_t v88 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v50 = v88[8];
      uint64_t v80 = (char *)v25 + v50;
      uint64_t v51 = &v26[v50];
      uint64_t v52 = sub_1000E3EE0();
      uint64_t v85 = *(void *)(v52 - 8);
      uint64_t v53 = *(void (**)(char *, char *, uint64_t))(v85 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v53(v80, v51, v52);
      uint64_t v54 = sub_1000082B4(&qword_100129F28);
      uint64_t v83 = v53;
      v53(&v80[*(int *)(v54 + 36)], &v51[*(int *)(v54 + 36)], v52);
      uint64_t v55 = v88[9];
      uint64_t v56 = (char *)v25 + v55;
      uint64_t v57 = &v26[v55];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v85 + 48))(&v26[v55], 1, v52))
      {
        uint64_t v58 = sub_1000082B4(&qword_100129F30);
        memcpy(v56, v57, *(void *)(*(void *)(v58 - 8) + 64));
      }
      else
      {
        v83(v56, v57, v52);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v85 + 56))(v56, 0, 1, v52);
      }
      id v31 = (int *)v78;
      *((unsigned char *)v25 + v88[10]) = v26[v88[10]];
      *((unsigned char *)v25 + v88[11]) = v26[v88[11]];
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v60 = v31[7];
    uint64_t v61 = (void *)(v10 + v60);
    uint64_t v62 = (void *)(v11 + v60);
    uint64_t v63 = v62[1];
    *uint64_t v61 = *v62;
    v61[1] = v63;
    uint64_t v64 = v62[3];
    void v61[2] = v62[2];
    v61[3] = v64;
    uint64_t v65 = v31[8];
    uint64_t v66 = v10 + v65;
    uint64_t v67 = v11 + v65;
    uint64_t v68 = *(void *)(v67 + 8);
    *(void *)uint64_t v66 = *(void *)v67;
    *(void *)(v66 + 8) = v68;
    *(unsigned char *)(v66 + 16) = *(unsigned char *)(v67 + 16);
    *(void *)(v66 + 24) = *(void *)(v67 + 24);
    *(unsigned char *)(v66 + 32) = *(unsigned char *)(v67 + 32);
    *(void *)(v66 + 40) = *(void *)(v67 + 40);
    *(unsigned char *)(v66 + 48) = *(unsigned char *)(v67 + 48);
    *(unsigned char *)(v10 + v31[9]) = *(unsigned char *)(v11 + v31[9]);
    *(unsigned char *)(v10 + v31[10]) = *(unsigned char *)(v11 + v31[10]);
    *(unsigned char *)(v10 + v31[11]) = *(unsigned char *)(v11 + v31[11]);
    uint64_t v69 = v31[12];
    uint64_t v70 = (void *)(v10 + v69);
    uint64_t v71 = (void *)(v11 + v69);
    uint64_t v72 = v71[1];
    *uint64_t v70 = *v71;
    v70[1] = v72;
    *(unsigned char *)(v10 + v31[13]) = *(unsigned char *)(v11 + v31[13]);
    *(unsigned char *)(v10 + v31[14]) = *(unsigned char *)(v11 + v31[14]);
    uint64_t v73 = v31[15];
    uint64_t v74 = (void *)(v10 + v73);
    uint64_t v75 = (void *)(v11 + v73);
    uint64_t v76 = v75[1];
    *uint64_t v74 = *v75;
    v74[1] = v76;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v3;
}

uint64_t sub_1000D72E0(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v4 + *(int *)(type metadata accessor for SportsWatchWidgetViewModel(0) + 24);
  type metadata accessor for SportsWidgetClock(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v15 = v5 + *(int *)(v14 + 32);
      uint64_t v16 = sub_1000E3EE0();
      uint64_t v17 = *(void *)(v16 - 8);
      uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
      v18(v15, v16);
      uint64_t v19 = sub_1000082B4(&qword_100129F28);
      v18(v15 + *(int *)(v19 + 36), v16);
      uint64_t v20 = v5 + *(int *)(v14 + 36);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v20, 1, v16)) {
        v18(v20, v16);
      }
      type metadata accessor for SportsWidgetSoccerClockViewModel(0);
      goto LABEL_10;
    case 1:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_10:
      swift_bridgeObjectRelease();
      break;
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v7 = type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v8 = v5 + *(int *)(v7 + 32);
      uint64_t v9 = sub_1000E3EE0();
      uint64_t v10 = *(void *)(v9 - 8);
      uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v11(v8, v9);
      uint64_t v12 = sub_1000082B4(&qword_100129F28);
      v11(v8 + *(int *)(v12 + 36), v9);
      uint64_t v13 = v5 + *(int *)(v7 + 36);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v13, 1, v9)) {
        v11(v13, v9);
      }
      break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000D768C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v87 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v87;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  long long v6 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v6;
  uint64_t v7 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v7;
  uint64_t v8 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v8;
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  uint64_t v80 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v80;
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = *(void *)(a2 + v9 + 8);
  *(void *)uint64_t v10 = *(void *)(a2 + v9);
  *(void *)(v10 + 8) = v12;
  uint64_t v13 = *(void *)(a2 + v9 + 24);
  *(void *)(v10 + 16) = *(void *)(a2 + v9 + 16);
  *(void *)(v10 + 24) = v13;
  uint64_t v14 = *(void *)(a2 + v9 + 40);
  *(void *)(v10 + 32) = *(void *)(a2 + v9 + 32);
  *(void *)(v10 + 40) = v14;
  uint64_t v15 = *(void *)(a2 + v9 + 56);
  *(void *)(v10 + 48) = *(void *)(a2 + v9 + 48);
  *(void *)(v10 + 56) = v15;
  uint64_t v16 = *(void *)(a2 + v9 + 72);
  *(void *)(v10 + 64) = *(void *)(a2 + v9 + 64);
  *(void *)(v10 + 72) = v16;
  uint64_t v17 = *(void *)(a2 + v9 + 88);
  *(void *)(v10 + 80) = *(void *)(a2 + v9 + 80);
  *(void *)(v10 + 88) = v17;
  *(unsigned char *)(v10 + 96) = *(unsigned char *)(a2 + v9 + 96);
  *(void *)(v10 + 104) = *(void *)(a2 + v9 + 104);
  *(unsigned char *)(v10 + 112) = *(unsigned char *)(a2 + v9 + 112);
  uint64_t v18 = *(void *)(a2 + v9 + 128);
  *(void *)(v10 + 120) = *(void *)(a2 + v9 + 120);
  *(void *)(v10 + 128) = v18;
  uint64_t v19 = *(void *)(a2 + v9 + 144);
  *(void *)(v10 + 136) = *(void *)(a2 + v9 + 136);
  *(void *)(v10 + 144) = v19;
  uint64_t v20 = *(void *)(a2 + v9 + 160);
  *(void *)(v10 + 152) = *(void *)(a2 + v9 + 152);
  *(void *)(v10 + 160) = v20;
  uint64_t v21 = *(void *)(a2 + v9 + 176);
  *(void *)(v10 + 168) = *(void *)(a2 + v9 + 168);
  *(void *)(v10 + 176) = v21;
  uint64_t v22 = *(void *)(a2 + v9 + 192);
  *(void *)(v10 + 184) = *(void *)(a2 + v9 + 184);
  *(void *)(v10 + 192) = v22;
  uint64_t v23 = *(void *)(a2 + v9 + 208);
  *(void *)(v10 + 200) = *(void *)(a2 + v9 + 200);
  *(void *)(v10 + 208) = v23;
  *(unsigned char *)(v10 + 216) = *(unsigned char *)(a2 + v9 + 216);
  *(void *)(v10 + 224) = *(void *)(a2 + v9 + 224);
  *(unsigned char *)(v10 + 232) = *(unsigned char *)(a2 + v9 + 232);
  uint64_t v77 = type metadata accessor for SportsWatchWidgetViewModel(0);
  uint64_t v24 = *(int *)(v77 + 24);
  uint64_t v25 = (void *)(v10 + v24);
  uint64_t v26 = (char *)(v11 + v24);
  type metadata accessor for SportsWidgetClock(0);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v32 = *((void *)v26 + 1);
    *uint64_t v25 = *(void *)v26;
    v25[1] = v32;
    uint64_t v33 = *((void *)v26 + 3);
    v25[2] = *((void *)v26 + 2);
    v25[3] = v33;
    uint64_t v34 = *((void *)v26 + 5);
    v25[4] = *((void *)v26 + 4);
    v25[5] = v34;
    uint64_t v35 = *((void *)v26 + 7);
    v25[6] = *((void *)v26 + 6);
    v25[7] = v35;
    uint64_t v85 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
    uint64_t v36 = v85[8];
    uint64_t v37 = (char *)v25 + v36;
    uint64_t v78 = &v26[v36];
    uint64_t v38 = sub_1000E3EE0();
    uint64_t v83 = *(void *)(v38 - 8);
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v83 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v39(v37, v78, v38);
    uint64_t v40 = sub_1000082B4(&qword_100129F28);
    uint64_t v81 = v39;
    v39(&v37[*(int *)(v40 + 36)], &v78[*(int *)(v40 + 36)], v38);
    uint64_t v41 = v85[9];
    uint64_t v42 = (char *)v25 + v41;
    uint64_t v43 = &v26[v41];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v83 + 48))(&v26[v41], 1, v38))
    {
      uint64_t v44 = sub_1000082B4(&qword_100129F30);
      memcpy(v42, v43, *(void *)(*(void *)(v44 - 8) + 64));
    }
    else
    {
      v81(v42, v43, v38);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v83 + 56))(v42, 0, 1, v38);
    }
    *((unsigned char *)v25 + v85[10]) = v26[v85[10]];
    *((unsigned char *)v25 + v85[11]) = v26[v85[11]];
    uint64_t v58 = type metadata accessor for SportsWidgetSoccerClockViewModel(0);
    *(void *)((char *)v25 + *(int *)(v58 + 20)) = *(void *)&v26[*(int *)(v58 + 20)];
    swift_bridgeObjectRetain();
    id v31 = (int *)v77;
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v28 = *((void *)v26 + 1);
    *uint64_t v25 = *(void *)v26;
    v25[1] = v28;
    uint64_t v29 = *((void *)v26 + 3);
    v25[2] = *((void *)v26 + 2);
    v25[3] = v29;
    uint64_t v30 = *((void *)v26 + 5);
    v25[4] = *((void *)v26 + 4);
    v25[5] = v30;
    *((unsigned char *)v25 + 48) = v26[48];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v31 = (int *)v77;
  }
  else
  {
    uint64_t v45 = *((void *)v26 + 1);
    *uint64_t v25 = *(void *)v26;
    v25[1] = v45;
    uint64_t v46 = *((void *)v26 + 3);
    v25[2] = *((void *)v26 + 2);
    v25[3] = v46;
    uint64_t v47 = *((void *)v26 + 5);
    v25[4] = *((void *)v26 + 4);
    v25[5] = v47;
    uint64_t v48 = *((void *)v26 + 7);
    v25[6] = *((void *)v26 + 6);
    v25[7] = v48;
    uint64_t v86 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
    uint64_t v49 = v86[8];
    uint64_t v79 = (char *)v25 + v49;
    uint64_t v50 = &v26[v49];
    uint64_t v51 = sub_1000E3EE0();
    uint64_t v84 = *(void *)(v51 - 8);
    uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v84 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v52(v79, v50, v51);
    uint64_t v53 = sub_1000082B4(&qword_100129F28);
    uint64_t v82 = v52;
    v52(&v79[*(int *)(v53 + 36)], &v50[*(int *)(v53 + 36)], v51);
    uint64_t v54 = v86[9];
    uint64_t v55 = (char *)v25 + v54;
    uint64_t v56 = &v26[v54];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v84 + 48))(&v26[v54], 1, v51))
    {
      uint64_t v57 = sub_1000082B4(&qword_100129F30);
      memcpy(v55, v56, *(void *)(*(void *)(v57 - 8) + 64));
    }
    else
    {
      v82(v55, v56, v51);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v84 + 56))(v55, 0, 1, v51);
    }
    id v31 = (int *)v77;
    *((unsigned char *)v25 + v86[10]) = v26[v86[10]];
    *((unsigned char *)v25 + v86[11]) = v26[v86[11]];
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v59 = v31[7];
  uint64_t v60 = (void *)(v10 + v59);
  uint64_t v61 = (void *)(v11 + v59);
  uint64_t v62 = v61[1];
  void *v60 = *v61;
  v60[1] = v62;
  uint64_t v63 = v61[3];
  v60[2] = v61[2];
  v60[3] = v63;
  uint64_t v64 = v31[8];
  uint64_t v65 = v10 + v64;
  uint64_t v66 = v11 + v64;
  uint64_t v67 = *(void *)(v66 + 8);
  *(void *)uint64_t v65 = *(void *)v66;
  *(void *)(v65 + 8) = v67;
  *(unsigned char *)(v65 + 16) = *(unsigned char *)(v66 + 16);
  *(void *)(v65 + 24) = *(void *)(v66 + 24);
  *(unsigned char *)(v65 + 32) = *(unsigned char *)(v66 + 32);
  *(void *)(v65 + 40) = *(void *)(v66 + 40);
  *(unsigned char *)(v65 + 48) = *(unsigned char *)(v66 + 48);
  *(unsigned char *)(v10 + v31[9]) = *(unsigned char *)(v11 + v31[9]);
  *(unsigned char *)(v10 + v31[10]) = *(unsigned char *)(v11 + v31[10]);
  *(unsigned char *)(v10 + v31[11]) = *(unsigned char *)(v11 + v31[11]);
  uint64_t v68 = v31[12];
  uint64_t v69 = (void *)(v10 + v68);
  uint64_t v70 = (void *)(v11 + v68);
  uint64_t v71 = v70[1];
  void *v69 = *v70;
  v69[1] = v71;
  *(unsigned char *)(v10 + v31[13]) = *(unsigned char *)(v11 + v31[13]);
  *(unsigned char *)(v10 + v31[14]) = *(unsigned char *)(v11 + v31[14]);
  uint64_t v72 = v31[15];
  uint64_t v73 = (void *)(v10 + v72);
  uint64_t v74 = (void *)(v11 + v72);
  uint64_t v75 = v74[1];
  *uint64_t v73 = *v74;
  v73[1] = v75;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000D7E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_retain();
  swift_release();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_retain();
  swift_release();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_retain();
  swift_release();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_retain();
  swift_release();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_retain();
  swift_release();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  *(void *)uint64_t v7 = *(void *)(a2 + v6);
  *(void *)(v7 + 8) = *(void *)(a2 + v6 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  *(void *)(v7 + 24) = *(void *)(v8 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v7 + 32) = *(void *)(v8 + 32);
  *(void *)(v7 + 40) = *(void *)(v8 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v7 + 48) = *(void *)(v8 + 48);
  *(void *)(v7 + 56) = *(void *)(v8 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v7 + 64) = *(void *)(v8 + 64);
  *(void *)(v7 + 72) = *(void *)(v8 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v7 + 80) = *(void *)(v8 + 80);
  *(void *)(v7 + 88) = *(void *)(v8 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v7 + 96) = *(unsigned char *)(v8 + 96);
  *(void *)(v7 + 104) = *(void *)(v8 + 104);
  swift_retain();
  swift_release();
  *(unsigned char *)(v7 + 112) = *(unsigned char *)(v8 + 112);
  *(void *)(v7 + 120) = *(void *)(v8 + 120);
  *(void *)(v7 + 128) = *(void *)(v8 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v7 + 136) = *(void *)(v8 + 136);
  *(void *)(v7 + 144) = *(void *)(v8 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v7 + 152) = *(void *)(v8 + 152);
  *(void *)(v7 + 160) = *(void *)(v8 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v7 + 168) = *(void *)(v8 + 168);
  *(void *)(v7 + 176) = *(void *)(v8 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v7 + 184) = *(void *)(v8 + 184);
  *(void *)(v7 + 192) = *(void *)(v8 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v7 + 200) = *(void *)(v8 + 200);
  *(void *)(v7 + 208) = *(void *)(v8 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v7 + 216) = *(unsigned char *)(v8 + 216);
  *(void *)(v7 + 224) = *(void *)(v8 + 224);
  swift_retain();
  swift_release();
  *(unsigned char *)(v7 + 232) = *(unsigned char *)(v8 + 232);
  uint64_t v9 = type metadata accessor for SportsWatchWidgetViewModel(0);
  uint64_t v10 = (int *)v9;
  if (a1 != a2)
  {
    uint64_t v11 = *(int *)(v9 + 24);
    uint64_t v12 = (void *)(v7 + v11);
    uint64_t v13 = (char *)(v8 + v11);
    sub_1000D9E7C(v7 + v11, type metadata accessor for SportsWidgetClock);
    type metadata accessor for SportsWidgetClock(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      void *v12 = *(void *)v13;
      v12[1] = *((void *)v13 + 1);
      void v12[2] = *((void *)v13 + 2);
      unint64_t v12[3] = *((void *)v13 + 3);
      v12[4] = *((void *)v13 + 4);
      v12[5] = *((void *)v13 + 5);
      v12[6] = *((void *)v13 + 6);
      v12[7] = *((void *)v13 + 7);
      uint64_t v49 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v15 = v49[8];
      uint64_t v16 = (char *)v12 + v15;
      uint64_t v17 = &v13[v15];
      uint64_t v18 = sub_1000E3EE0();
      uint64_t v47 = *(void *)(v18 - 8);
      uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v47 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v51(v16, v17, v18);
      uint64_t v19 = *(int *)(sub_1000082B4(&qword_100129F28) + 36);
      v51(&v16[v19], &v17[v19], v18);
      uint64_t v20 = v49[9];
      __dst = (char *)v12 + v20;
      uint64_t v21 = &v13[v20];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(&v13[v20], 1, v18))
      {
        uint64_t v22 = sub_1000082B4(&qword_100129F30);
        memcpy(__dst, v21, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        v51(__dst, v21, v18);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(__dst, 0, 1, v18);
      }
      *((unsigned char *)v12 + v49[10]) = v13[v49[10]];
      *((unsigned char *)v12 + v49[11]) = v13[v49[11]];
      uint64_t v31 = type metadata accessor for SportsWidgetSoccerClockViewModel(0);
      *(void *)((char *)v12 + *(int *)(v31 + 20)) = *(void *)&v13[*(int *)(v31 + 20)];
      swift_bridgeObjectRetain();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      void *v12 = *(void *)v13;
      v12[1] = *((void *)v13 + 1);
      void v12[2] = *((void *)v13 + 2);
      unint64_t v12[3] = *((void *)v13 + 3);
      v12[4] = *((void *)v13 + 4);
      v12[5] = *((void *)v13 + 5);
      *((unsigned char *)v12 + 48) = v13[48];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      void *v12 = *(void *)v13;
      v12[1] = *((void *)v13 + 1);
      void v12[2] = *((void *)v13 + 2);
      unint64_t v12[3] = *((void *)v13 + 3);
      v12[4] = *((void *)v13 + 4);
      v12[5] = *((void *)v13 + 5);
      v12[6] = *((void *)v13 + 6);
      v12[7] = *((void *)v13 + 7);
      uint64_t v50 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v23 = v50[8];
      uint64_t v24 = (char *)v12 + v23;
      uint64_t v25 = &v13[v23];
      uint64_t v26 = sub_1000E3EE0();
      uint64_t v48 = *(void *)(v26 - 8);
      uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v52(v24, v25, v26);
      uint64_t v27 = *(int *)(sub_1000082B4(&qword_100129F28) + 36);
      v52(&v24[v27], &v25[v27], v26);
      uint64_t v28 = v50[9];
      __dsta = (char *)v12 + v28;
      uint64_t v29 = &v13[v28];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(&v13[v28], 1, v26))
      {
        uint64_t v30 = sub_1000082B4(&qword_100129F30);
        memcpy(__dsta, v29, *(void *)(*(void *)(v30 - 8) + 64));
      }
      else
      {
        v52(__dsta, v29, v26);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(__dsta, 0, 1, v26);
      }
      *((unsigned char *)v12 + v50[10]) = v13[v50[10]];
      *((unsigned char *)v12 + v50[11]) = v13[v50[11]];
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v32 = v10[7];
  uint64_t v33 = (void *)(v7 + v32);
  uint64_t v34 = v8 + v32;
  *uint64_t v33 = *(void *)(v8 + v32);
  v33[1] = *(void *)(v8 + v32 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v33[2] = *(void *)(v34 + 16);
  v33[3] = *(void *)(v34 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = v10[8];
  uint64_t v36 = v7 + v35;
  uint64_t v37 = v8 + v35;
  *(void *)uint64_t v36 = *(void *)(v8 + v35);
  *(void *)(v36 + 8) = *(void *)(v8 + v35 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v36 + 16) = *(unsigned char *)(v37 + 16);
  *(void *)(v36 + 24) = *(void *)(v37 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(v36 + 32) = *(unsigned char *)(v37 + 32);
  *(void *)(v36 + 40) = *(void *)(v37 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(v36 + 48) = *(unsigned char *)(v37 + 48);
  *(unsigned char *)(v7 + v10[9]) = *(unsigned char *)(v8 + v10[9]);
  *(unsigned char *)(v7 + v10[10]) = *(unsigned char *)(v8 + v10[10]);
  *(unsigned char *)(v7 + v10[11]) = *(unsigned char *)(v8 + v10[11]);
  uint64_t v38 = v10[12];
  uint64_t v39 = (void *)(v7 + v38);
  uint64_t v40 = (void *)(v8 + v38);
  *uint64_t v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v7 + v10[13]) = *(unsigned char *)(v8 + v10[13]);
  *(unsigned char *)(v7 + v10[14]) = *(unsigned char *)(v8 + v10[14]);
  uint64_t v41 = v10[15];
  uint64_t v42 = (void *)(v7 + v41);
  uint64_t v43 = (void *)(v8 + v41);
  *uint64_t v42 = *v43;
  v42[1] = v43[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000D8808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v4;
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  long long v5 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v5;
  long long v6 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v6;
  long long v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  long long v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  long long v10 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v10;
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  long long v14 = *(_OWORD *)(a2 + v11 + 80);
  *(_OWORD *)(v12 + 64) = *(_OWORD *)(a2 + v11 + 64);
  *(_OWORD *)(v12 + 80) = v14;
  *(_OWORD *)(v12 + 96) = *(_OWORD *)(a2 + v11 + 96);
  *(unsigned char *)(v12 + 112) = *(unsigned char *)(a2 + v11 + 112);
  long long v15 = *(_OWORD *)(a2 + v11 + 16);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)(a2 + v11);
  *(_OWORD *)(v12 + 16) = v15;
  long long v16 = *(_OWORD *)(a2 + v11 + 48);
  *(_OWORD *)(v12 + 32) = *(_OWORD *)(a2 + v11 + 32);
  *(_OWORD *)(v12 + 48) = v16;
  *(_OWORD *)(v12 + 168) = *(_OWORD *)(a2 + v11 + 168);
  *(_OWORD *)(v12 + 152) = *(_OWORD *)(a2 + v11 + 152);
  *(_OWORD *)(v12 + 136) = *(_OWORD *)(a2 + v11 + 136);
  *(_OWORD *)(v12 + 120) = *(_OWORD *)(a2 + v11 + 120);
  *(unsigned char *)(v12 + 232) = *(unsigned char *)(a2 + v11 + 232);
  *(_OWORD *)(v12 + 216) = *(_OWORD *)(a2 + v11 + 216);
  *(_OWORD *)(v12 + 200) = *(_OWORD *)(a2 + v11 + 200);
  *(_OWORD *)(v12 + 184) = *(_OWORD *)(a2 + v11 + 184);
  uint64_t v17 = (int *)type metadata accessor for SportsWatchWidgetViewModel(0);
  uint64_t v18 = v17[6];
  uint64_t v19 = (_OWORD *)(v12 + v18);
  uint64_t v20 = (char *)(v13 + v18);
  uint64_t v21 = type metadata accessor for SportsWidgetClock(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    long long v34 = *((_OWORD *)v20 + 1);
    *uint64_t v19 = *(_OWORD *)v20;
    v19[1] = v34;
    long long v35 = *((_OWORD *)v20 + 3);
    CGRect v19[2] = *((_OWORD *)v20 + 2);
    v19[3] = v35;
    uint64_t v66 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
    uint64_t v36 = v66[8];
    uint64_t v37 = (char *)v19 + v36;
    uint64_t v58 = (char *)v19 + v36;
    __dstb = &v20[v36];
    uint64_t v38 = sub_1000E3EE0();
    uint64_t v64 = *(void *)(v38 - 8);
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v64 + 32);
    v39(v37, __dstb, v38);
    uint64_t v40 = *(int *)(sub_1000082B4(&qword_100129F28) + 36);
    uint64_t v41 = &v58[v40];
    uint64_t v59 = v39;
    v39(v41, &__dstb[v40], v38);
    uint64_t v42 = v66[9];
    __dsta = (char *)v19 + v42;
    uint64_t v43 = &v20[v42];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(&v20[v42], 1, v38))
    {
      uint64_t v44 = sub_1000082B4(&qword_100129F30);
      memcpy(__dsta, v43, *(void *)(*(void *)(v44 - 8) + 64));
    }
    else
    {
      v59(__dsta, v43, v38);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v64 + 56))(__dsta, 0, 1, v38);
    }
    *((unsigned char *)v19 + v66[10]) = v20[v66[10]];
    *((unsigned char *)v19 + v66[11]) = v20[v66[11]];
    uint64_t v45 = type metadata accessor for SportsWidgetSoccerClockViewModel(0);
    *(void *)((char *)v19 + *(int *)(v45 + 20)) = *(void *)&v20[*(int *)(v45 + 20)];
    goto LABEL_12;
  }
  if (!EnumCaseMultiPayload)
  {
    long long v23 = *((_OWORD *)v20 + 1);
    *uint64_t v19 = *(_OWORD *)v20;
    v19[1] = v23;
    long long v24 = *((_OWORD *)v20 + 3);
    CGRect v19[2] = *((_OWORD *)v20 + 2);
    v19[3] = v24;
    uint64_t v65 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
    uint64_t v25 = v65[8];
    uint64_t v26 = (char *)v19 + v25;
    uint64_t v57 = v19;
    uint64_t v27 = &v20[v25];
    uint64_t v28 = sub_1000E3EE0();
    uint64_t v63 = *(void *)(v28 - 8);
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v63 + 32);
    v29(v26, v27, v28);
    uint64_t v30 = *(int *)(sub_1000082B4(&qword_100129F28) + 36);
    uint64_t v56 = v29;
    v29(&v26[v30], &v27[v30], v28);
    uint64_t v31 = v65[9];
    __dst = (char *)v57 + v31;
    uint64_t v32 = &v20[v31];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v63 + 48))(&v20[v31], 1, v28))
    {
      uint64_t v33 = sub_1000082B4(&qword_100129F30);
      memcpy(__dst, v32, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      v56(__dst, v32, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v63 + 56))(__dst, 0, 1, v28);
    }
    *((unsigned char *)v57 + v65[10]) = v20[v65[10]];
    *((unsigned char *)v57 + v65[11]) = v20[v65[11]];
LABEL_12:
    swift_storeEnumTagMultiPayload();
    goto LABEL_13;
  }
  memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
LABEL_13:
  uint64_t v46 = v17[7];
  uint64_t v47 = (_OWORD *)(v12 + v46);
  uint64_t v48 = (_OWORD *)(v13 + v46);
  long long v49 = v48[1];
  *uint64_t v47 = *v48;
  v47[1] = v49;
  uint64_t v50 = v17[8];
  uint64_t v51 = v12 + v50;
  uint64_t v52 = (long long *)(v13 + v50);
  *(unsigned char *)(v51 + 48) = *((unsigned char *)v52 + 48);
  long long v53 = v52[2];
  long long v54 = *v52;
  *(_OWORD *)(v51 + 16) = v52[1];
  *(_OWORD *)(v51 + 32) = v53;
  *(_OWORD *)uint64_t v51 = v54;
  *(unsigned char *)(v12 + v17[9]) = *(unsigned char *)(v13 + v17[9]);
  *(unsigned char *)(v12 + v17[10]) = *(unsigned char *)(v13 + v17[10]);
  *(unsigned char *)(v12 + v17[11]) = *(unsigned char *)(v13 + v17[11]);
  *(_OWORD *)(v12 + v17[12]) = *(_OWORD *)(v13 + v17[12]);
  *(unsigned char *)(v12 + v17[13]) = *(unsigned char *)(v13 + v17[13]);
  *(unsigned char *)(v12 + v17[14]) = *(unsigned char *)(v13 + v17[14]);
  *(_OWORD *)(v12 + v17[15]) = *(_OWORD *)(v13 + v17[15]);
  return a1;
}

uint64_t sub_1000D8D30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_release();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_release();
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_release();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_release();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_release();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = *(void *)(a2 + v6 + 8);
  *(void *)uint64_t v7 = *(void *)(a2 + v6);
  *(void *)(v7 + 8) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v8 + 24);
  *(void *)(v7 + 16) = *(void *)(v8 + 16);
  *(void *)(v7 + 24) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v8 + 40);
  *(void *)(v7 + 32) = *(void *)(v8 + 32);
  *(void *)(v7 + 40) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v8 + 56);
  *(void *)(v7 + 48) = *(void *)(v8 + 48);
  *(void *)(v7 + 56) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(v8 + 72);
  *(void *)(v7 + 64) = *(void *)(v8 + 64);
  *(void *)(v7 + 72) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v8 + 88);
  *(void *)(v7 + 80) = *(void *)(v8 + 80);
  *(void *)(v7 + 88) = v14;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v7 + 96) = *(unsigned char *)(v8 + 96);
  *(void *)(v7 + 104) = *(void *)(v8 + 104);
  swift_release();
  *(unsigned char *)(v7 + 112) = *(unsigned char *)(v8 + 112);
  uint64_t v15 = *(void *)(v8 + 128);
  *(void *)(v7 + 120) = *(void *)(v8 + 120);
  *(void *)(v7 + 128) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(v8 + 144);
  *(void *)(v7 + 136) = *(void *)(v8 + 136);
  *(void *)(v7 + 144) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v8 + 160);
  *(void *)(v7 + 152) = *(void *)(v8 + 152);
  *(void *)(v7 + 160) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(v8 + 176);
  *(void *)(v7 + 168) = *(void *)(v8 + 168);
  *(void *)(v7 + 176) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(v8 + 192);
  *(void *)(v7 + 184) = *(void *)(v8 + 184);
  *(void *)(v7 + 192) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v8 + 208);
  *(void *)(v7 + 200) = *(void *)(v8 + 200);
  *(void *)(v7 + 208) = v20;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v7 + 216) = *(unsigned char *)(v8 + 216);
  *(void *)(v7 + 224) = *(void *)(v8 + 224);
  swift_release();
  *(unsigned char *)(v7 + 232) = *(unsigned char *)(v8 + 232);
  uint64_t v21 = type metadata accessor for SportsWatchWidgetViewModel(0);
  uint64_t v22 = (int *)v21;
  if (a1 != a2)
  {
    uint64_t v23 = *(int *)(v21 + 24);
    long long v24 = (_OWORD *)(v7 + v23);
    uint64_t v25 = (char *)(v8 + v23);
    sub_1000D9E7C(v7 + v23, type metadata accessor for SportsWidgetClock);
    uint64_t v26 = type metadata accessor for SportsWidgetClock(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      long long v39 = *((_OWORD *)v25 + 1);
      *long long v24 = *(_OWORD *)v25;
      v24[1] = v39;
      long long v40 = *((_OWORD *)v25 + 3);
      v24[2] = *((_OWORD *)v25 + 2);
      v24[3] = v40;
      uint64_t v81 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v41 = v81[8];
      uint64_t v42 = (char *)v24 + v41;
      __dstb = (char *)v24 + v41;
      uint64_t v76 = &v25[v41];
      uint64_t v43 = sub_1000E3EE0();
      uint64_t v79 = *(void *)(v43 - 8);
      uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v79 + 32);
      v44(v42, v76, v43);
      uint64_t v45 = *(int *)(sub_1000082B4(&qword_100129F28) + 36);
      uint64_t v46 = &__dstb[v45];
      __dsta = v44;
      v44(v46, &v76[v45], v43);
      uint64_t v47 = v81[9];
      uint64_t v77 = (char *)v24 + v47;
      uint64_t v48 = &v25[v47];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v79 + 48))(&v25[v47], 1, v43))
      {
        uint64_t v49 = sub_1000082B4(&qword_100129F30);
        memcpy(v77, v48, *(void *)(*(void *)(v49 - 8) + 64));
      }
      else
      {
        __dsta(v77, v48, v43);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v79 + 56))(v77, 0, 1, v43);
      }
      *((unsigned char *)v24 + v81[10]) = v25[v81[10]];
      *((unsigned char *)v24 + v81[11]) = v25[v81[11]];
      uint64_t v50 = type metadata accessor for SportsWidgetSoccerClockViewModel(0);
      *(void *)((char *)v24 + *(int *)(v50 + 20)) = *(void *)&v25[*(int *)(v50 + 20)];
      goto LABEL_13;
    }
    if (!EnumCaseMultiPayload)
    {
      long long v28 = *((_OWORD *)v25 + 1);
      *long long v24 = *(_OWORD *)v25;
      v24[1] = v28;
      long long v29 = *((_OWORD *)v25 + 3);
      v24[2] = *((_OWORD *)v25 + 2);
      v24[3] = v29;
      uint64_t v78 = v25;
      uint64_t v80 = (int *)type metadata accessor for SportsWidgetGenericClockViewModel(0);
      uint64_t v30 = v80[8];
      uint64_t v31 = (char *)v24 + v30;
      uint64_t v32 = &v25[v30];
      uint64_t v33 = sub_1000E3EE0();
      uint64_t v75 = *(void **)(v33 - 8);
      long long v34 = (void (*)(char *, char *, uint64_t))v75[4];
      v34(v31, v32, v33);
      uint64_t v35 = *(int *)(sub_1000082B4(&qword_100129F28) + 36);
      uint64_t v71 = v34;
      v34(&v31[v35], &v32[v35], v33);
      uint64_t v36 = v80[9];
      __dst = (char *)v24 + v36;
      uint64_t v37 = (char *)v78 + v36;
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v75[6])((char *)v78 + v36, 1, v33))
      {
        uint64_t v38 = sub_1000082B4(&qword_100129F30);
        memcpy(__dst, v37, *(void *)(*(void *)(v38 - 8) + 64));
      }
      else
      {
        v71(__dst, v37, v33);
        ((void (*)(char *, void, uint64_t, uint64_t))v75[7])(__dst, 0, 1, v33);
      }
      *((unsigned char *)v24 + v80[10]) = *((unsigned char *)v78 + v80[10]);
      *((unsigned char *)v24 + v80[11]) = *((unsigned char *)v78 + v80[11]);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      goto LABEL_14;
    }
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
LABEL_14:
  uint64_t v51 = v22[7];
  uint64_t v52 = (void *)(v7 + v51);
  uint64_t v53 = v8 + v51;
  uint64_t v54 = *(void *)(v8 + v51 + 8);
  *uint64_t v52 = *(void *)(v8 + v51);
  v52[1] = v54;
  swift_bridgeObjectRelease();
  uint64_t v55 = *(void *)(v53 + 24);
  v52[2] = *(void *)(v53 + 16);
  v52[3] = v55;
  swift_bridgeObjectRelease();
  uint64_t v56 = v22[8];
  uint64_t v57 = v7 + v56;
  uint64_t v58 = v8 + v56;
  uint64_t v59 = *(void *)(v8 + v56 + 8);
  *(void *)uint64_t v57 = *(void *)(v8 + v56);
  *(void *)(v57 + 8) = v59;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v57 + 16) = *(unsigned char *)(v58 + 16);
  *(void *)(v57 + 24) = *(void *)(v58 + 24);
  swift_release();
  *(unsigned char *)(v57 + 32) = *(unsigned char *)(v58 + 32);
  *(void *)(v57 + 40) = *(void *)(v58 + 40);
  swift_release();
  *(unsigned char *)(v57 + 48) = *(unsigned char *)(v58 + 48);
  *(unsigned char *)(v7 + v22[9]) = *(unsigned char *)(v8 + v22[9]);
  *(unsigned char *)(v7 + v22[10]) = *(unsigned char *)(v8 + v22[10]);
  *(unsigned char *)(v7 + v22[11]) = *(unsigned char *)(v8 + v22[11]);
  uint64_t v60 = v22[12];
  uint64_t v61 = (void *)(v7 + v60);
  uint64_t v62 = (uint64_t *)(v8 + v60);
  uint64_t v64 = *v62;
  uint64_t v63 = v62[1];
  *uint64_t v61 = v64;
  v61[1] = v63;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v7 + v22[13]) = *(unsigned char *)(v8 + v22[13]);
  *(unsigned char *)(v7 + v22[14]) = *(unsigned char *)(v8 + v22[14]);
  uint64_t v65 = v22[15];
  uint64_t v66 = (void *)(v7 + v65);
  uint64_t v67 = (uint64_t *)(v8 + v65);
  uint64_t v69 = *v67;
  uint64_t v68 = v67[1];
  *uint64_t v66 = v69;
  v66[1] = v68;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000D9450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000D9464);
}

uint64_t sub_1000D9464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for SportsWatchWidgetViewModel(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000D9514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000D9528);
}

uint64_t sub_1000D9528(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for SportsWatchWidgetViewModel(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for SportsWatchWidgetView()
{
  uint64_t result = qword_10012FA80;
  if (!qword_10012FA80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000D961C()
{
  uint64_t result = type metadata accessor for SportsWatchWidgetViewModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000D96B4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000D96D8()
{
  unint64_t result = qword_10012FAF0;
  if (!qword_10012FAF0)
  {
    sub_100008354(&qword_10012FAD0);
    sub_100008354(&qword_10012FAF8);
    sub_1000D97B8();
    swift_getOpaqueTypeConformance2();
    sub_1000DAC84(&qword_10012A3B8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FAF0);
  }
  return result;
}

unint64_t sub_1000D97B8()
{
  unint64_t result = qword_10012FB00;
  if (!qword_10012FB00)
  {
    sub_100008354(&qword_10012FAF8);
    sub_100014AC4(&qword_10012FB08, &qword_10012FB10);
    sub_100014AC4(&qword_10012FB18, &qword_10012FB20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FB00);
  }
  return result;
}

uint64_t sub_1000D989C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000D9934(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000D99CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v14 = *(void *)(a1 + 160);
  uint64_t v3 = *(void *)(a1 + 176);
  uint64_t v4 = *(void *)(a1 + 184);
  uint64_t v5 = *(void *)(a1 + 192);
  uint64_t v6 = *(void *)(a1 + 200);
  uint64_t v7 = *(void *)(a1 + 208);
  uint64_t v8 = *(void *)(a1 + 216);
  long long v12 = *(_OWORD *)(a1 + 240);
  long long v13 = *(_OWORD *)(a1 + 224);
  uint64_t v9 = *(void *)(a1 + 256);
  unsigned __int8 v10 = *(unsigned char *)(a1 + 264);
  sub_10003AC90(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(unsigned char *)(a1 + 88));
  sub_1000D9AA8(v14, v2, v3, v4, v5, v6, v7, v8, v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v9, v10);
  return a1;
}

uint64_t sub_1000D9AA8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned __int8 a14)
{
  if (a14 != 255) {
    return sub_10001460C(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14 & 1);
  }
  return result;
}

uint64_t sub_1000D9ADC(uint64_t a1)
{
  uint64_t v13 = *(void *)(a1 + 192);
  uint64_t v2 = *(void *)(a1 + 200);
  uint64_t v3 = *(void *)(a1 + 208);
  uint64_t v4 = *(void *)(a1 + 216);
  uint64_t v5 = *(void *)(a1 + 224);
  uint64_t v6 = *(void *)(a1 + 232);
  uint64_t v7 = *(void *)(a1 + 240);
  uint64_t v8 = *(void *)(a1 + 248);
  long long v12 = *(_OWORD *)(a1 + 256);
  uint64_t v9 = *(void *)(a1 + 272);
  char v10 = *(unsigned char *)(a1 + 280);
  sub_1000D9AA8(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(unsigned char *)(a1 + 120));
  sub_10003AC90(v13, v2, v3, v4, v5, v6, v7, v8, v12, *((uint64_t *)&v12 + 1), v9, v10);
  return a1;
}

uint64_t sub_1000D9BB8(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, char), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, int))
{
  uint64_t v17 = *(void *)(a1 + 216);
  uint64_t v4 = *(void *)(a1 + 224);
  uint64_t v5 = *(void *)(a1 + 232);
  uint64_t v6 = *(void *)(a1 + 240);
  uint64_t v7 = *(void *)(a1 + 248);
  uint64_t v8 = *(void *)(a1 + 256);
  uint64_t v9 = *(void *)(a1 + 264);
  uint64_t v10 = *(void *)(a1 + 272);
  long long v16 = *(_OWORD *)(a1 + 280);
  uint64_t v11 = *(void *)(a1 + 296);
  char v12 = *(unsigned char *)(a1 + 304);
  char v15 = *(unsigned char *)(a1 + 144);
  a2(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), v15);
  LOBYTE(v14) = v12;
  a3(v17, v4, v5, v6, v7, v8, v9, v10, v16, *((void *)&v16 + 1), v11, v14);
  return a1;
}

uint64_t sub_1000D9CAC(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, char), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, uint64_t, char))
{
  uint64_t v4 = *(void *)(a1 + 192);
  uint64_t v18 = *(void *)(a1 + 184);
  uint64_t v5 = *(void *)(a1 + 200);
  uint64_t v6 = *(void *)(a1 + 208);
  uint64_t v7 = *(void *)(a1 + 216);
  uint64_t v8 = *(void *)(a1 + 224);
  uint64_t v9 = *(void *)(a1 + 232);
  uint64_t v10 = *(void *)(a1 + 240);
  long long v16 = *(_OWORD *)(a1 + 264);
  long long v17 = *(_OWORD *)(a1 + 248);
  uint64_t v11 = *(void *)(a1 + 280);
  char v12 = *(unsigned char *)(a1 + 288);
  char v14 = *(unsigned char *)(a1 + 112);
  a2(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), v14);
  char v15 = v12;
  a3(v18, v4, v5, v6, v7, v8, v9, v10, v17, *((void *)&v17 + 1), v16, *((void *)&v16 + 1), v11, v15);
  return a1;
}

uint64_t sub_1000D9DAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000D9E14(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000D9E7C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000D9EDC(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, char), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, int))
{
  uint64_t v4 = *(void *)(a1 + 144);
  uint64_t v17 = *(void *)(a1 + 136);
  uint64_t v5 = *(void *)(a1 + 152);
  uint64_t v6 = *(void *)(a1 + 160);
  uint64_t v7 = *(void *)(a1 + 168);
  uint64_t v8 = *(void *)(a1 + 176);
  uint64_t v9 = *(void *)(a1 + 184);
  uint64_t v10 = *(void *)(a1 + 192);
  long long v16 = *(_OWORD *)(a1 + 200);
  uint64_t v11 = *(void *)(a1 + 216);
  char v12 = *(unsigned char *)(a1 + 224);
  char v15 = *(unsigned char *)(a1 + 128);
  a2(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), v15);
  LOBYTE(v14) = v12;
  a3(v17, v4, v5, v6, v7, v8, v9, v10, v16, *((void *)&v16 + 1), v11, v14);
  return a1;
}

ValueMetadata *type metadata accessor for WatchVStack()
{
  return &type metadata for WatchVStack;
}

uint64_t destroy for SportsWatchWidgetViewLayout()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for SportsWatchWidgetViewLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  long long v6 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v6;
  uint64_t v7 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v7;
  uint64_t v8 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v8;
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  uint64_t v9 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v9;
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SportsWatchWidgetViewLayout(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_retain();
  swift_release();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_retain();
  swift_release();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_retain();
  swift_release();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_retain();
  swift_release();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_retain();
  swift_release();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  return a1;
}

__n128 initializeWithTake for SportsWatchWidgetViewLayout(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  long long v8 = a2[8];
  long long v9 = a2[9];
  long long v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  __n128 result = (__n128)a2[12];
  long long v12 = a2[13];
  long long v13 = a2[14];
  *(void *)(a1 + 240) = *((void *)a2 + 30);
  *(_OWORD *)(a1 + 208) = v12;
  *(_OWORD *)(a1 + 224) = v13;
  *(__n128 *)(a1 + 192) = result;
  return result;
}

uint64_t assignWithTake for SportsWatchWidgetViewLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_release();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_release();
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  swift_release();
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  swift_release();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_release();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  return a1;
}

uint64_t getEnumTagSinglePayload for SportsWatchWidgetViewLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 248)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SportsWatchWidgetViewLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
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
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 248) = 1;
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
    *(unsigned char *)(result + 248) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SportsWatchWidgetViewLayout()
{
  return &type metadata for SportsWatchWidgetViewLayout;
}

unint64_t sub_1000DA56C()
{
  unint64_t result = qword_10012FB90;
  if (!qword_10012FB90)
  {
    sub_100008354(&qword_10012FAC0);
    sub_1000DA60C();
    sub_100014AC4((unint64_t *)&qword_10012D520, &qword_10012D528);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FB90);
  }
  return result;
}

unint64_t sub_1000DA60C()
{
  unint64_t result = qword_10012FB98;
  if (!qword_10012FB98)
  {
    sub_100008354(&qword_10012FAB8);
    sub_1000DA6AC();
    sub_100014AC4(&qword_10012FBC0, &qword_10012FBC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FB98);
  }
  return result;
}

unint64_t sub_1000DA6AC()
{
  unint64_t result = qword_10012FBA0;
  if (!qword_10012FBA0)
  {
    sub_100008354(&qword_10012F388);
    sub_1000DA728();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FBA0);
  }
  return result;
}

unint64_t sub_1000DA728()
{
  unint64_t result = qword_10012FBA8;
  if (!qword_10012FBA8)
  {
    sub_100008354(&qword_10012F380);
    sub_1000DA79C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FBA8);
  }
  return result;
}

unint64_t sub_1000DA79C()
{
  unint64_t result = qword_10012FBB0;
  if (!qword_10012FBB0)
  {
    sub_100008354(&qword_10012FBB8);
    sub_100014AC4(&qword_10012FAE8, &qword_10012FAE0);
    sub_1000D96D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FBB0);
  }
  return result;
}

unint64_t sub_1000DA840()
{
  unint64_t result = qword_10012FBD0;
  if (!qword_10012FBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FBD0);
  }
  return result;
}

uint64_t sub_1000DA894(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = sub_1000E4140();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v19);
  long long v24 = (char *)v31 - v23;
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)v31 - v25;
  sub_1000E4170();
  sub_1000DAC84(&qword_10012FBD8, (void (*)(uint64_t))&type metadata accessor for LayoutSubviews);
  sub_1000E5B20();
  sub_1000E5B50();
  uint64_t result = sub_1000E5B40();
  if (result == 3)
  {
    sub_1000E4180();
    v34.origin.x = a1;
    v34.origin.y = a2;
    v34.size.width = a3;
    v34.size.height = a4;
    CGRectGetMinX(v34);
    *(double *)&v31[1] = a6;
    *(double *)&void v31[2] = a5;
    v35.origin.x = a1;
    v35.origin.y = a2;
    v35.size.width = a3;
    v35.size.height = a4;
    CGRectGetMidY(v35);
    *(double *)&v31[3] = a7;
    sub_1000E5000();
    v31[0] = *(void *)(a9 + 16);
    char v33 = 0;
    char v32 = 0;
    sub_1000E4130();
    sub_1000E4180();
    v36.origin.x = a1;
    v36.origin.y = a2;
    v36.size.width = a3;
    v36.size.height = a4;
    CGRectGetMaxX(v36);
    v37.origin.x = a1;
    v37.origin.y = a2;
    v37.size.width = a3;
    v37.size.height = a4;
    CGRectGetMidY(v37);
    sub_1000E5000();
    char v33 = 0;
    char v32 = 0;
    sub_1000E4130();
    sub_1000E4180();
    sub_1000E4200();
    char v33 = v28 & 1;
    char v32 = v29 & 1;
    sub_1000E4120();
    v38.origin.x = a1;
    v38.origin.y = a2;
    v38.size.width = a3;
    v38.size.height = a4;
    CGRectGetWidth(v38);
    v39.origin.x = a1;
    v39.origin.y = a2;
    v39.size.width = a3;
    v39.size.height = a4;
    CGRectGetMidX(v39);
    v40.origin.x = a1;
    v40.origin.y = a2;
    v40.size.width = a3;
    v40.size.height = a4;
    CGRectGetMidY(v40);
    sub_1000E5000();
    char v33 = 0;
    char v32 = 0;
    sub_1000E4130();
    uint64_t v30 = *(void (**)(char *, uint64_t))(v18 + 8);
    v30(v21, v17);
    v30(v24, v17);
    return ((uint64_t (*)(char *, uint64_t))v30)(v26, v17);
  }
  return result;
}

uint64_t sub_1000DAC84(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000DACCC(uint64_t a1)
{
  *(void *)&v26.f64[0] = sub_1000E4140();
  uint64_t v2 = *(void *)(*(void *)&v26.f64[0] - 8);
  __chkstk_darwin(*(void *)&v26.f64[0]);
  long long v4 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E4170();
  sub_1000DAC84(&qword_10012FBD8, (void (*)(uint64_t))&type metadata accessor for LayoutSubviews);
  uint64_t v5 = sub_1000E5B30();
  long long v7 = (float64x2_t *)_swiftEmptyArrayStorage;
  if (v5)
  {
    uint64_t v8 = v5;
    char v29 = (float64x2_t *)_swiftEmptyArrayStorage;
    sub_10006B320(0, v5 & ~(v5 >> 63), 0);
    uint64_t result = sub_1000E5B20();
    if (v8 < 0)
    {
      __break(1u);
      return result;
    }
    v25[1] = a1;
    do
    {
      long long v10 = (void (*)(char *, void))sub_1000E5B70();
      float64_t v11 = v26.f64[0];
      (*(void (**)(char *))(v2 + 16))(v4);
      v10(v28, 0);
      sub_1000E4200();
      v28[0] = v12 & 1;
      char v27 = v13 & 1;
      sub_1000E4120();
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      (*(void (**)(char *, float64_t))(v2 + 8))(v4, COERCE_FLOAT64_T(*(void *)&v11));
      long long v7 = v29;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10006B320(0, *(void *)&v7[1].f64[0] + 1, 1);
        long long v7 = v29;
      }
      unint64_t v19 = *(void *)&v7[1].f64[0];
      unint64_t v18 = *(void *)&v7[1].f64[1];
      if (v19 >= v18 >> 1)
      {
        sub_10006B320((char *)(v18 > 1), v19 + 1, 1);
        long long v7 = v29;
      }
      *(void *)&v7[1].f64[0] = v19 + 1;
      f64 = (void *)v7[v19].f64;
      f64[4] = v15;
      f64[5] = v17;
      sub_1000E5B60();
      --v8;
    }
    while (v8);
  }
  float64_t v21 = v7[1].f64[0];
  if (v21 == 0.0)
  {
    v6.f64[0] = 0.0;
    float64x2_t v26 = v6;
  }
  else
  {
    uint64_t v22 = v7 + 2;
    float64x2_t v23 = 0uLL;
    do
    {
      float64x2_t v24 = *v22++;
      float64x2_t v23 = (float64x2_t)vbslq_s8((int8x16_t)vcgeq_f64(v24, v23), (int8x16_t)v24, (int8x16_t)v23);
      --*(void *)&v21;
    }
    while (v21 != 0.0);
    float64x2_t v26 = v23;
  }
  return swift_bridgeObjectRelease();
}

uint64_t getEnumTagSinglePayload for WatchVStack.CacheData(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WatchVStack.CacheData(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = (a2 - 1);
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

ValueMetadata *type metadata accessor for WatchVStack.CacheData()
{
  return &type metadata for WatchVStack.CacheData;
}

ValueMetadata *type metadata accessor for SportsWidget()
{
  return &type metadata for SportsWidget;
}

uint64_t sub_1000DB018()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000DB034@<X0>(uint64_t a1@<X8>)
{
  uint64_t v96 = a1;
  uint64_t v95 = type metadata accessor for SportsWatchWidgetView();
  __chkstk_darwin(v95);
  uint64_t v2 = (char *)&v82 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000E55B0();
  __chkstk_darwin(v3 - 8);
  uint64_t v90 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SportsWatchWidgetViewModel(0);
  __chkstk_darwin(v5 - 8);
  uint64_t v92 = (uint64_t)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_1000082B4(&qword_10012FE10);
  __chkstk_darwin(v106);
  uint64_t v109 = (uint64_t)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_1000082B4(&qword_10012FE18);
  __chkstk_darwin(v99);
  uint64_t v103 = (uint64_t)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_1000082B4(&qword_10012FE20);
  __chkstk_darwin(v104);
  char v105 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_1000082B4(&qword_100129FF8);
  __chkstk_darwin(v108);
  int v91 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = type metadata accessor for SportsWidgetView();
  __chkstk_darwin(v107);
  uint64_t v93 = (uint64_t *)((char *)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v97 = sub_1000082B4(&qword_10012FE28);
  uint64_t v84 = *(void *)(v97 - 8);
  __chkstk_darwin(v97);
  uint64_t v83 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_1000082B4(&qword_10012FE30);
  uint64_t v86 = *(void *)(v102 - 8);
  uint64_t v13 = __chkstk_darwin(v102);
  uint64_t v82 = (char *)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v85 = (char *)&v82 - v15;
  uint64_t v16 = sub_1000E5290();
  uint64_t v87 = *(void *)(v16 - 8);
  uint64_t v88 = v16;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v89 = (char *)&v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v82 - v19;
  uint64_t v21 = sub_1000E5380();
  __chkstk_darwin(v21 - 8);
  float64x2_t v23 = (char *)&v82 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for SportsWidgetContentViewModel(0);
  uint64_t v25 = __chkstk_darwin(v24 - 8);
  char v27 = (char *)&v82 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v94 = (uint64_t)&v82 - v28;
  uint64_t v29 = sub_1000E5710();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = __chkstk_darwin(v29);
  char v33 = (char *)&v82 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  CGRect v35 = (char *)&v82 - v34;
  sub_1000C2C18((uint64_t)&v82 - v34);
  CGRect v36 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
  uint64_t v98 = v35;
  v36(v33, v35, v29);
  uint64_t v100 = v30;
  uint64_t v101 = v29;
  int v37 = (*(uint64_t (**)(char *, uint64_t))(v30 + 88))(v33, v29);
  if (v37 == enum case for ActivityFamily.small(_:))
  {
    type metadata accessor for SportsWidgetActivityFamilyView();
    sub_1000082B4(&qword_10012FC08);
    sub_1000E5750();
    uint64_t v38 = (uint64_t)v90;
    sub_1000E51C0();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v20, v88);
    sub_1000E5760();
    uint64_t v39 = (uint64_t)v89;
    sub_1000E5750();
    char v40 = sub_1000E5770();
    uint64_t v41 = v92;
    sub_10009F31C(v38, (uint64_t)v23, v39, v40 & 1, v92);
    sub_1000E1C30(v41, (uint64_t)&v2[*(int *)(v95 + 20)], type metadata accessor for SportsWatchWidgetViewModel);
    sub_1000D6584((uint64_t)&v114);
    long long v42 = v127;
    *((_OWORD *)v2 + 12) = v126;
    *((_OWORD *)v2 + 13) = v42;
    *((_OWORD *)v2 + 14) = v128;
    *((void *)v2 + 30) = v129;
    long long v43 = v123;
    *((_OWORD *)v2 + 8) = v122;
    *((_OWORD *)v2 + 9) = v43;
    long long v44 = v125;
    *((_OWORD *)v2 + 10) = v124;
    *((_OWORD *)v2 + 11) = v44;
    long long v45 = v119;
    *((_OWORD *)v2 + 4) = v118;
    *((_OWORD *)v2 + 5) = v45;
    long long v46 = v121;
    *((_OWORD *)v2 + 6) = v120;
    *((_OWORD *)v2 + 7) = v46;
    long long v47 = v115;
    *(_OWORD *)uint64_t v2 = v114;
    *((_OWORD *)v2 + 1) = v47;
    long long v48 = v117;
    *((_OWORD *)v2 + 2) = v116;
    *((_OWORD *)v2 + 3) = v48;
    sub_1000E1C30((uint64_t)v2, v103, (uint64_t (*)(void))type metadata accessor for SportsWatchWidgetView);
    swift_storeEnumTagMultiPayload();
    uint64_t v49 = sub_1000E1A58(&qword_10012FE38, (void (*)(uint64_t))type metadata accessor for SportsWidgetView);
    uint64_t v50 = sub_100014AC4(&qword_10012A018, &qword_100129FF8);
    uint64_t v110 = v107;
    uint64_t v111 = v108;
    uint64_t v112 = v49;
    uint64_t v113 = v50;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v110 = v97;
    uint64_t v111 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    sub_1000E1A58(&qword_10012FE40, (void (*)(uint64_t))type metadata accessor for SportsWatchWidgetView);
    uint64_t v52 = (uint64_t)v105;
    sub_1000E4690();
    sub_100014754(v52, v109, &qword_10012FE20);
    swift_storeEnumTagMultiPayload();
    sub_1000E1AA0();
    sub_1000E4690();
    sub_1000147B8(v52, &qword_10012FE20);
    sub_1000E1CA0((uint64_t)v2, (uint64_t (*)(void))type metadata accessor for SportsWatchWidgetView);
    uint64_t v53 = type metadata accessor for SportsWatchWidgetViewModel;
    uint64_t v54 = v41;
LABEL_8:
    sub_1000E1CA0(v54, v53);
    return (*(uint64_t (**)(char *, uint64_t))(v100 + 8))(v98, v101);
  }
  uint64_t v56 = v107;
  uint64_t v55 = v108;
  uint64_t v57 = v109;
  if (v37 == enum case for ActivityFamily.medium(_:))
  {
    type metadata accessor for SportsWidgetActivityFamilyView();
    sub_1000082B4(&qword_10012FC08);
    sub_1000E5760();
    sub_1000E5750();
    char v58 = sub_1000E5770();
    uint64_t v59 = v94;
    sub_10009E2C0(v23, (uint64_t)v20, v58 & 1, v94);
    sub_1000E1C30(v59, (uint64_t)v27, type metadata accessor for SportsWidgetContentViewModel);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v61 = v93;
    *uint64_t v93 = KeyPath;
    sub_1000082B4(&qword_100129F20);
    swift_storeEnumTagMultiPayload();
    uint64_t v62 = v56;
    uint64_t v63 = (uint64_t *)((char *)v61 + *(int *)(v56 + 20));
    uint64_t v64 = sub_1000E4C20();
    *uint64_t v63 = 0x7FF0000000000000;
    v63[1] = v64;
    sub_1000B05D4((uint64_t)v27, (uint64_t)v61 + *(int *)(v56 + 24));
    if (qword_100129DF0 != -1) {
      swift_once();
    }
    uint64_t v65 = sub_1000E41D0();
    uint64_t v66 = sub_100008498(v65, (uint64_t)qword_100142250);
    uint64_t v67 = (uint64_t)v91;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v65 - 8) + 16))(v91, v66, v65);
    sub_1000E1A58(&qword_10012A050, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
    if (sub_1000E5970())
    {
      uint64_t v68 = v62;
      uint64_t v69 = sub_1000E1A58(&qword_10012FE38, (void (*)(uint64_t))type metadata accessor for SportsWidgetView);
      uint64_t v70 = sub_100014AC4(&qword_10012A018, &qword_100129FF8);
      uint64_t v71 = v83;
      uint64_t v72 = (uint64_t)v93;
      sub_1000E4B00();
      sub_1000147B8(v67, &qword_100129FF8);
      sub_1000E1CA0(v72, (uint64_t (*)(void))type metadata accessor for SportsWidgetView);
      sub_1000E4C20();
      *(void *)&long long v114 = v68;
      *((void *)&v114 + 1) = v55;
      *(void *)&long long v115 = v69;
      *((void *)&v115 + 1) = v70;
      uint64_t v73 = swift_getOpaqueTypeConformance2();
      uint64_t v74 = v82;
      uint64_t v75 = v97;
      sub_1000E4A60();
      swift_release();
      (*(void (**)(char *, uint64_t))(v84 + 8))(v71, v75);
      uint64_t v77 = v85;
      uint64_t v76 = v86;
      uint64_t v78 = v74;
      uint64_t v79 = v102;
      (*(void (**)(char *, char *, uint64_t))(v86 + 32))(v85, v78, v102);
      (*(void (**)(uint64_t, char *, uint64_t))(v76 + 16))(v103, v77, v79);
      swift_storeEnumTagMultiPayload();
      *(void *)&long long v114 = v75;
      *((void *)&v114 + 1) = v73;
      swift_getOpaqueTypeConformance2();
      sub_1000E1A58(&qword_10012FE40, (void (*)(uint64_t))type metadata accessor for SportsWatchWidgetView);
      uint64_t v80 = (uint64_t)v105;
      sub_1000E4690();
      sub_100014754(v80, v57, &qword_10012FE20);
      swift_storeEnumTagMultiPayload();
      sub_1000E1AA0();
      sub_1000E4690();
      sub_1000147B8(v80, &qword_10012FE20);
      (*(void (**)(char *, uint64_t))(v76 + 8))(v77, v79);
      uint64_t v53 = type metadata accessor for SportsWidgetContentViewModel;
      uint64_t v54 = v94;
      goto LABEL_8;
    }
    __break(1u);
  }
  uint64_t result = sub_1000E5D60();
  __break(1u);
  return result;
}

uint64_t sub_1000DBDFC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1000082B4(&qword_10012FC08);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  *a2 = swift_getKeyPath();
  sub_1000082B4(&qword_10012F358);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = type metadata accessor for SportsWidgetActivityFamilyView();
  return (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 32))((char *)a2 + *(int *)(v8 + 20), v7, v4);
}

uint64_t sub_1000DBF24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v3 = sub_1000E5290();
  uint64_t v49 = *(void *)(v3 - 8);
  uint64_t v50 = v3;
  __chkstk_darwin(v3);
  long long v47 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000082B4(&qword_100129F38);
  __chkstk_darwin(v5 - 8);
  long long v48 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000082B4(&qword_10012FC08);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v39 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v38 = (char *)&v38 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v41 = (char *)&v38 - v14;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v38 - v15;
  uint64_t v17 = sub_1000E5700();
  uint64_t v45 = *(void *)(v17 - 8);
  uint64_t v46 = v17;
  __chkstk_darwin(v17);
  long long v44 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v19(v16, a1, v7);
  unint64_t v20 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v43 = swift_allocObject();
  uint64_t v21 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
  uint64_t v22 = v16;
  uint64_t v23 = v7;
  v21(v43 + v20, v22, v7);
  uint64_t v24 = v41;
  v19(v41, a1, v23);
  uint64_t v42 = swift_allocObject();
  v21(v42 + v20, v24, v23);
  uint64_t v25 = v38;
  uint64_t v40 = a1;
  v19(v38, a1, v23);
  uint64_t v41 = (char *)swift_allocObject();
  v21((unint64_t)&v41[v20], v25, v23);
  uint64_t v26 = v39;
  v19(v39, a1, v23);
  uint64_t v27 = swift_allocObject();
  v21(v27 + v20, v26, v23);
  uint64_t v39 = (char *)sub_1000082B4(&qword_10012FC10);
  sub_1000082B4(&qword_10012FC18);
  sub_1000082B4(&qword_10012FC20);
  sub_100014AC4(&qword_10012FC28, &qword_10012FC10);
  uint64_t v28 = type metadata accessor for SportsWidgetDynamicIslandCompactView(255);
  uint64_t v29 = sub_100008354(&qword_100129FF8);
  uint64_t v30 = sub_1000E1A58(&qword_10012FC30, (void (*)(uint64_t))type metadata accessor for SportsWidgetDynamicIslandCompactView);
  uint64_t v31 = sub_100014AC4(&qword_10012A018, &qword_100129FF8);
  uint64_t v52 = v28;
  uint64_t v53 = v29;
  unint64_t v54 = v30;
  uint64_t v55 = v31;
  swift_getOpaqueTypeConformance2();
  uint64_t v32 = sub_100008354(&qword_10012FC38);
  unint64_t v33 = sub_1000E000C();
  uint64_t v52 = v32;
  uint64_t v53 = v29;
  unint64_t v54 = v33;
  uint64_t v55 = v31;
  swift_getOpaqueTypeConformance2();
  uint64_t v34 = v44;
  sub_1000E56E0();
  CGRect v35 = v47;
  sub_1000E5750();
  sub_1000E51D0();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v35, v50);
  uint64_t v36 = (uint64_t)v48;
  sub_1000E3DF0();
  swift_bridgeObjectRelease();
  sub_1000E56F0();
  sub_1000147B8(v36, &qword_100129F38);
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v34, v46);
}

uint64_t sub_1000DC534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v64 = a2;
  uint64_t v65 = sub_1000082B4(&qword_10012FC50);
  uint64_t v63 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v57 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000082B4(&qword_10012FC58);
  uint64_t v61 = *(void *)(v4 - 8);
  uint64_t v62 = v4;
  __chkstk_darwin(v4);
  uint64_t v51 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000082B4(&qword_10012FC60);
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v60 = v6;
  __chkstk_darwin(v6);
  long long v48 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_1000082B4(&qword_10012FC68);
  uint64_t v56 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  long long v47 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000082B4(&qword_10012FC70);
  uint64_t v54 = *(void *)(v9 - 8);
  uint64_t v55 = v9;
  __chkstk_darwin(v9);
  uint64_t v46 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000082B4(&qword_10012FC78);
  uint64_t v52 = *(void *)(v11 - 8);
  uint64_t v53 = v11;
  __chkstk_darwin(v11);
  uint64_t v66 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000E58F0();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_1000082B4(&qword_10012FC80);
  uint64_t v49 = *(void *)(v14 - 8);
  uint64_t v50 = v14;
  __chkstk_darwin(v14);
  uint64_t v43 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E58D0();
  uint64_t v77 = a1;
  uint64_t v44 = sub_1000082B4(&qword_10012FC88);
  uint64_t v16 = sub_100008354(&qword_10012FC90);
  uint64_t v17 = sub_100008354(&qword_100129FF8);
  uint64_t v40 = v17;
  uint64_t v18 = sub_100008354(&qword_10012FC98);
  uint64_t v19 = sub_100014AC4(&qword_10012FCA0, &qword_10012FC98);
  uint64_t v78 = v18;
  uint64_t v79 = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v41 = sub_100014AC4(&qword_10012A018, &qword_100129FF8);
  uint64_t v78 = v16;
  uint64_t v79 = v17;
  unint64_t v80 = OpaqueTypeConformance2;
  uint64_t v81 = v41;
  uint64_t v45 = swift_getOpaqueTypeConformance2();
  sub_1000E5880();
  sub_1000E58E0();
  uint64_t v21 = v42;
  uint64_t v76 = v42;
  sub_1000082B4(&qword_10012FCA8);
  uint64_t v22 = sub_100008354(&qword_10012FCB0);
  uint64_t v23 = sub_100008354(&qword_10012FCB8);
  uint64_t v24 = sub_100014AC4(&qword_10012FCC0, &qword_10012FCB8);
  uint64_t v78 = v23;
  uint64_t v79 = v24;
  uint64_t v25 = swift_getOpaqueTypeConformance2();
  uint64_t v26 = v40;
  uint64_t v27 = v41;
  uint64_t v78 = v22;
  uint64_t v79 = v40;
  unint64_t v80 = v25;
  uint64_t v81 = v41;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v66;
  sub_1000E5880();
  sub_1000E58B0();
  uint64_t v75 = v21;
  sub_1000082B4(&qword_10012FCC8);
  sub_1000E0BF8();
  uint64_t v29 = v46;
  sub_1000E5880();
  sub_1000E58C0();
  uint64_t v74 = v21;
  sub_1000082B4(&qword_10012FCE0);
  uint64_t v30 = sub_100008354(&qword_10012B598);
  unint64_t v31 = sub_1000E0DA4();
  uint64_t v78 = v30;
  uint64_t v79 = v26;
  unint64_t v80 = v31;
  uint64_t v81 = v27;
  swift_getOpaqueTypeConformance2();
  uint64_t v32 = v47;
  sub_1000E5880();
  unint64_t v33 = v43;
  uint64_t v73 = v43;
  sub_1000082B4(&qword_10012FCF8);
  uint64_t v78 = v44;
  uint64_t v79 = v45;
  swift_getOpaqueTypeConformance2();
  uint64_t v34 = v48;
  sub_1000E5890();
  uint64_t v71 = v34;
  uint64_t v72 = v28;
  sub_1000082B4(&qword_10012FD00);
  sub_100014AC4(&qword_10012FD08, &qword_10012FD00);
  CGRect v35 = v51;
  sub_1000E5890();
  uint64_t v69 = v35;
  uint64_t v70 = v29;
  uint64_t v36 = v29;
  sub_1000082B4(&qword_10012FD10);
  sub_100014AC4(&qword_10012FD18, &qword_10012FD10);
  int v37 = v57;
  sub_1000E5890();
  uint64_t v67 = v37;
  uint64_t v68 = v32;
  sub_1000082B4(&qword_10012FC10);
  sub_100014AC4(&qword_10012FC28, &qword_10012FC10);
  sub_1000E5890();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v37, v65);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v35, v62);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v34, v60);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v32, v58);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v36, v55);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v66, v53);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v33, v50);
}

uint64_t sub_1000DCE38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v45 = sub_1000082B4(&qword_100129FF8);
  __chkstk_darwin(v45);
  uint64_t v57 = (char *)&v44 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000E46F0();
  uint64_t v55 = *(void *)(v2 - 8);
  uint64_t v56 = v2;
  __chkstk_darwin(v2);
  uint64_t v54 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_1000082B4(&qword_10012FC98);
  __chkstk_darwin(v51);
  uint64_t v52 = (uint64_t *)((char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_1000082B4(&qword_10012FC90);
  uint64_t v49 = *(void *)(v5 - 8);
  uint64_t v50 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v53 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  long long v48 = (char *)&v44 - v8;
  uint64_t v9 = sub_1000E5380();
  __chkstk_darwin(v9 - 8);
  long long v47 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000E55B0();
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000E5290();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  unint64_t v20 = (char *)&v44 - v19;
  uint64_t v21 = type metadata accessor for SportsWidgetDynamicIslandExpanded(0);
  uint64_t v22 = v21 - 8;
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000082B4(&qword_10012FC08);
  sub_1000E5750();
  sub_1000E51C0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
  uint64_t v25 = (void (*)(char *, void, uint64_t))v47;
  sub_1000E5760();
  sub_1000E5750();
  char v26 = sub_1000E5770();
  uint64_t v27 = (uint64_t)&v24[*(int *)(v22 + 28)];
  uint64_t v28 = v26 & 1;
  uint64_t v29 = (void (*)(void, void, void))v13;
  uint64_t v30 = v50;
  uint64_t v31 = v51;
  uint64_t v32 = (uint64_t)v18;
  uint64_t v33 = v49;
  sub_10009EAA4(v29, v25, v32, v28, v27);
  sub_10001DB48((uint64_t)v24);
  uint64_t v34 = sub_1000E4510();
  uint64_t v35 = (uint64_t)v52;
  *uint64_t v52 = v34;
  *(void *)(v35 + 8) = 0;
  *(unsigned char *)(v35 + 16) = 1;
  uint64_t v36 = sub_1000082B4(&qword_10012FD60);
  sub_100036078((uint64_t)v24, (unsigned long long *)(v35 + *(int *)(v36 + 44)));
  int v37 = v54;
  sub_1000E46D0();
  uint64_t v38 = sub_100014AC4(&qword_10012FCA0, &qword_10012FC98);
  sub_1000E4B60();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v37, v56);
  sub_1000147B8(v35, &qword_10012FC98);
  uint64_t v39 = v48;
  (*(void (**)(void))(v33 + 32))();
  sub_1000E1CA0((uint64_t)v24, type metadata accessor for SportsWidgetDynamicIslandExpanded);
  if (qword_100129DF0 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_1000E41D0();
  uint64_t v41 = sub_100008498(v40, (uint64_t)qword_100142250);
  uint64_t v42 = (uint64_t)v57;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 16))(v57, v41, v40);
  sub_1000E1A58(&qword_10012A050, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_1000E5970();
  if (result)
  {
    uint64_t v58 = v31;
    uint64_t v59 = v38;
    swift_getOpaqueTypeConformance2();
    sub_100014AC4(&qword_10012A018, &qword_100129FF8);
    sub_1000E4B00();
    sub_1000147B8(v42, &qword_100129FF8);
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v39, v30);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000DD494@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v45 = sub_1000082B4(&qword_100129FF8);
  __chkstk_darwin(v45);
  uint64_t v57 = (char *)&v44 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000E46F0();
  uint64_t v55 = *(void *)(v2 - 8);
  uint64_t v56 = v2;
  __chkstk_darwin(v2);
  uint64_t v54 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_1000082B4(&qword_10012FCB8);
  __chkstk_darwin(v51);
  uint64_t v52 = (uint64_t *)((char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_1000082B4(&qword_10012FCB0);
  uint64_t v49 = *(void *)(v5 - 8);
  uint64_t v50 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v53 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  long long v48 = (char *)&v44 - v8;
  uint64_t v9 = sub_1000E5380();
  __chkstk_darwin(v9 - 8);
  long long v47 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000E55B0();
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000E5290();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  unint64_t v20 = (char *)&v44 - v19;
  uint64_t v21 = type metadata accessor for SportsWidgetDynamicIslandExpanded(0);
  uint64_t v22 = v21 - 8;
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000082B4(&qword_10012FC08);
  sub_1000E5750();
  sub_1000E51C0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
  uint64_t v25 = (void (*)(char *, void, uint64_t))v47;
  sub_1000E5760();
  sub_1000E5750();
  char v26 = sub_1000E5770();
  uint64_t v27 = (uint64_t)&v24[*(int *)(v22 + 28)];
  uint64_t v28 = v26 & 1;
  uint64_t v29 = (void (*)(void, void, void))v13;
  uint64_t v30 = v50;
  uint64_t v31 = v51;
  uint64_t v32 = (uint64_t)v18;
  uint64_t v33 = v49;
  sub_10009EAA4(v29, v25, v32, v28, v27);
  sub_10001DB48((uint64_t)v24);
  uint64_t v34 = sub_1000E4510();
  uint64_t v35 = (uint64_t)v52;
  *uint64_t v52 = v34;
  *(void *)(v35 + 8) = 0;
  *(unsigned char *)(v35 + 16) = 1;
  uint64_t v36 = sub_1000082B4(&qword_10012FD58);
  sub_100036784((uint64_t)v24, v35 + *(int *)(v36 + 44));
  int v37 = v54;
  sub_1000E46D0();
  uint64_t v38 = sub_100014AC4(&qword_10012FCC0, &qword_10012FCB8);
  sub_1000E4B60();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v37, v56);
  sub_1000147B8(v35, &qword_10012FCB8);
  uint64_t v39 = v48;
  (*(void (**)(void))(v33 + 32))();
  sub_1000E1CA0((uint64_t)v24, type metadata accessor for SportsWidgetDynamicIslandExpanded);
  if (qword_100129DF0 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_1000E41D0();
  uint64_t v41 = sub_100008498(v40, (uint64_t)qword_100142250);
  uint64_t v42 = (uint64_t)v57;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 16))(v57, v41, v40);
  sub_1000E1A58(&qword_10012A050, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_1000E5970();
  if (result)
  {
    uint64_t v58 = v31;
    uint64_t v59 = v38;
    swift_getOpaqueTypeConformance2();
    sub_100014AC4(&qword_10012A018, &qword_100129FF8);
    sub_1000E4B00();
    sub_1000147B8(v42, &qword_100129FF8);
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v39, v30);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000DDAF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v36 = sub_1000082B4(&qword_100129FF8);
  __chkstk_darwin(v36);
  uint64_t v41 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_1000082B4(&qword_10012A080);
  __chkstk_darwin(v35);
  uint64_t v40 = (uint64_t)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000E55B0();
  __chkstk_darwin(v3 - 8);
  uint64_t v39 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000E5290();
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v33 - v9;
  uint64_t v11 = type metadata accessor for SportsWidgetDynamicIslandExpanded(0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000082B4(&qword_10012FD50);
  uint64_t v42 = *(void *)(v14 - 8);
  uint64_t v43 = v14;
  __chkstk_darwin(v14);
  uint64_t v34 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000E5380();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (void (*)(char *, void, uint64_t))((char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000082B4(&qword_10012FC08);
  sub_1000E5760();
  char v20 = sub_1000E52D0();
  (*(void (**)(void (*)(char *, void, uint64_t), uint64_t))(v17 + 8))(v19, v16);
  if ((v20 & 1) == 0)
  {
    uint64_t v32 = 1;
    uint64_t v29 = v43;
    uint64_t v31 = v44;
    uint64_t v30 = v42;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v31, v32, 1, v29);
  }
  sub_1000E5750();
  uint64_t v21 = (void (*)(void, void, void))v39;
  sub_1000E51C0();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v38);
  sub_1000E5760();
  sub_1000E5750();
  char v22 = sub_1000E5770();
  sub_10009EAA4(v21, v19, (uint64_t)v8, v22 & 1, (uint64_t)&v13[*(int *)(v11 + 20)]);
  sub_10001DB48((uint64_t)v13);
  uint64_t v23 = v40;
  sub_1000374E4(v40);
  sub_1000E1CA0((uint64_t)v13, type metadata accessor for SportsWidgetDynamicIslandExpanded);
  if (qword_100129DF0 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_1000E41D0();
  uint64_t v25 = sub_100008498(v24, (uint64_t)qword_100142250);
  uint64_t v26 = (uint64_t)v41;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v41, v25, v24);
  sub_1000E1A58(&qword_10012A050, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_1000E5970();
  if (result)
  {
    sub_1000E0CF0();
    sub_100014AC4(&qword_10012A018, &qword_100129FF8);
    uint64_t v28 = v34;
    sub_1000E4B00();
    sub_1000147B8(v26, &qword_100129FF8);
    sub_1000147B8(v23, &qword_10012A080);
    uint64_t v30 = v42;
    uint64_t v29 = v43;
    uint64_t v31 = v44;
    (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v44, v28, v43);
    uint64_t v32 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v31, v32, 1, v29);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000DE088@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v28 = sub_1000082B4(&qword_100129FF8);
  __chkstk_darwin(v28);
  uint64_t v32 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1000082B4(&qword_10012B598);
  __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000E5380();
  __chkstk_darwin(v3 - 8);
  uint64_t v30 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000E55B0();
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000E5290();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v27 - v13;
  uint64_t v15 = type metadata accessor for SportsWidgetDynamicIslandExpanded(0);
  uint64_t v16 = v15 - 8;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000082B4(&qword_10012FC08);
  sub_1000E5750();
  sub_1000E51C0();
  uint64_t v19 = v14;
  uint64_t v20 = (uint64_t)v31;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v19, v8);
  uint64_t v21 = (void (*)(char *, void, uint64_t))v30;
  sub_1000E5760();
  sub_1000E5750();
  char v22 = sub_1000E5770();
  sub_10009EAA4((void (*)(void, void, void))v7, v21, (uint64_t)v12, v22 & 1, (uint64_t)&v18[*(int *)(v16 + 28)]);
  sub_10001DB48((uint64_t)v18);
  sub_100036BC4(v20);
  sub_1000E1CA0((uint64_t)v18, type metadata accessor for SportsWidgetDynamicIslandExpanded);
  if (qword_100129DF0 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_1000E41D0();
  uint64_t v24 = sub_100008498(v23, (uint64_t)qword_100142250);
  uint64_t v25 = (uint64_t)v32;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v32, v24, v23);
  sub_1000E1A58(&qword_10012A050, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_1000E5970();
  if (result)
  {
    sub_1000E0DA4();
    sub_100014AC4(&qword_10012A018, &qword_100129FF8);
    sub_1000E4B00();
    sub_1000147B8(v25, &qword_100129FF8);
    return sub_1000147B8(v20, &qword_10012B598);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000DE4DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v64 = a1;
  uint64_t v63 = sub_1000082B4(&qword_100129FF8);
  __chkstk_darwin(v63);
  uint64_t v75 = (char *)&v63 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = type metadata accessor for SportsWidgetDynamicIslandCompactView(0);
  __chkstk_darwin(v74);
  uint64_t v68 = (char *)&v63 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_1000E5250();
  uint64_t v70 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v78 = (uint64_t)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000E51A0();
  __chkstk_darwin(v4 - 8);
  uint64_t v81 = (uint64_t)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000082B4(&qword_10012E5B0);
  __chkstk_darwin(v6 - 8);
  uint64_t v80 = (uint64_t)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_1000E5380();
  uint64_t v8 = *(void *)(v79 - 8);
  uint64_t v9 = __chkstk_darwin(v79);
  uint64_t v71 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v77 = (char *)&v63 - v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v63 - v13;
  uint64_t v15 = sub_1000E55B0();
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000E5290();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v67 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v66 = (uint64_t)&v63 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v63 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v63 - v27;
  uint64_t v29 = type metadata accessor for SportsWidgetDynamicIslandCompactViewModel(0);
  __chkstk_darwin(v29 - 8);
  uint64_t v73 = (uint64_t *)((char *)&v63 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000082B4(&qword_10012FC08);
  sub_1000E5750();
  uint64_t v69 = v17;
  sub_1000E51C0();
  uint64_t v31 = v19 + 8;
  uint64_t v32 = *(uint64_t **)(v19 + 8);
  uint64_t v76 = v31;
  ((void (*)(char *, uint64_t))v32)(v28, v18);
  sub_1000E5760();
  sub_1000E5370();
  uint64_t v34 = (char *)(v8 + 8);
  uint64_t v33 = *(void *)(v8 + 8);
  uint64_t v35 = v14;
  uint64_t v36 = v79;
  ((void (*)(char *, uint64_t))v33)(v35, v79);
  uint64_t v37 = v77;
  sub_1000E5760();
  sub_1000E5300();
  uint64_t v77 = v34;
  uint64_t v65 = (void (*)(char *, uint64_t))v33;
  ((void (*)(char *, uint64_t))v33)(v37, v36);
  sub_1000E5750();
  uint64_t v38 = sub_1000E51B0();
  uint64_t v39 = v18;
  uint64_t v40 = v32;
  ((void (*)(char *, uint64_t))v32)(v26, v18);
  if (*(void *)(v38 + 16))
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v70 + 16))(v78, v38 + ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80)), v72);
    swift_bridgeObjectRelease();
    uint64_t v41 = v66;
    sub_1000E5750();
    uint64_t v72 = sub_1000E51D0();
    uint64_t v70 = v42;
    ((void (*)(uint64_t, uint64_t))v32)(v41, v18);
    sub_1000E50E0();
    uint64_t v43 = v71;
    sub_1000E5760();
    uint64_t v44 = v67;
    sub_1000E5750();
    uint64_t v66 = sub_1000E50D0();
    uint64_t v46 = v45;
    ((void (*)(char *, uint64_t))v40)(v44, v39);
    uint64_t v47 = v79;
    long long v48 = v65;
    v65(v43, v79);
    sub_1000E5760();
    LOBYTE(v44) = sub_1000E5330();
    v48(v43, v47);
    char v49 = sub_1000E5770();
    uint64_t v40 = v73;
    sub_10009FC48((uint64_t)v69, v80, 0, v81, v78, v72, v70, v66, v73, v46, v44 & 1, v49 & 1);
    uint64_t v33 = (uint64_t)v68;
    sub_1000E1C30((uint64_t)v40, (uint64_t)&v68[*(int *)(v74 + 24)], type metadata accessor for SportsWidgetDynamicIslandCompactViewModel);
    *(unsigned char *)uint64_t v33 = 0;
    uint64_t v50 = sub_1000E47D0();
    uint64_t v51 = self;
    [v51 labelColor:v63, v64];
    uint64_t v53 = sub_1000E4BD0();
    id v54 = [v51 labelColor];
    uint64_t v55 = sub_1000E4BD0();
    id v56 = [v51 labelColor];
    uint64_t v57 = sub_1000E4BD0();
    uint64_t v58 = sub_1000E47D0();
    *(void *)(v33 + 8) = 0x401C000000000000;
    *(void *)(v33 + 16) = v50;
    *(void *)(v33 + 24) = v53;
    *(void *)(v33 + 32) = 1;
    *(unsigned char *)(v33 + 40) = 1;
    *(_OWORD *)(v33 + 48) = xmmword_1000EE790;
    *(void *)(v33 + 64) = 0x4036000000000000;
    *(void *)(v33 + 72) = v55;
    *(void *)(v33 + 80) = v57;
    *(void *)(v33 + 88) = v58;
    *(void *)(v33 + 96) = 1;
    *(unsigned char *)(v33 + 104) = 1;
    *(void *)(v33 + 112) = 0x3FE0000000000000;
    if (qword_100129DF0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v59 = sub_1000E41D0();
  uint64_t v60 = sub_100008498(v59, (uint64_t)qword_100142250);
  uint64_t v61 = (uint64_t)v75;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v59 - 8) + 16))(v75, v60, v59);
  sub_1000E1A58(&qword_10012A050, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_1000E5970();
  if (result)
  {
    sub_1000E1A58(&qword_10012FC30, (void (*)(uint64_t))type metadata accessor for SportsWidgetDynamicIslandCompactView);
    sub_100014AC4(&qword_10012A018, &qword_100129FF8);
    sub_1000E4B00();
    sub_1000147B8(v61, &qword_100129FF8);
    sub_1000E1CA0(v33, type metadata accessor for SportsWidgetDynamicIslandCompactView);
    return sub_1000E1CA0((uint64_t)v40, type metadata accessor for SportsWidgetDynamicIslandCompactViewModel);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000DEDF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v65 = a1;
  uint64_t v64 = sub_1000082B4(&qword_100129FF8);
  __chkstk_darwin(v64);
  uint64_t v76 = (char *)&v64 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = type metadata accessor for SportsWidgetDynamicIslandCompactView(0);
  __chkstk_darwin(v75);
  uint64_t v69 = (char *)&v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_1000E5250();
  uint64_t v71 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  uint64_t v79 = (uint64_t)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000E51A0();
  __chkstk_darwin(v4 - 8);
  uint64_t v82 = (uint64_t)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000082B4(&qword_10012E5B0);
  __chkstk_darwin(v6 - 8);
  uint64_t v81 = (uint64_t)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_1000E5380();
  uint64_t v8 = *(void *)(v80 - 8);
  uint64_t v9 = __chkstk_darwin(v80);
  uint64_t v72 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v78 = (char *)&v64 - v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v64 - v13;
  uint64_t v15 = sub_1000E55B0();
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (uint64_t *)sub_1000E5290();
  uint64_t v19 = *(v18 - 1);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v68 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v67 = (uint64_t)&v64 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v64 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v64 - v27;
  uint64_t v29 = type metadata accessor for SportsWidgetDynamicIslandCompactViewModel(0);
  __chkstk_darwin(v29 - 8);
  uint64_t v74 = (uint64_t *)((char *)&v64 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000082B4(&qword_10012FC08);
  sub_1000E5750();
  uint64_t v70 = v17;
  sub_1000E51C0();
  uint64_t v31 = v19 + 8;
  uint64_t v32 = *(void (**)(char *, uint64_t *))(v19 + 8);
  uint64_t v77 = v31;
  v32(v28, v18);
  sub_1000E5760();
  sub_1000E5370();
  uint64_t v34 = (char *)(v8 + 8);
  uint64_t v33 = *(void *)(v8 + 8);
  uint64_t v35 = v14;
  uint64_t v36 = v80;
  ((void (*)(char *, uint64_t))v33)(v35, v80);
  uint64_t v37 = v78;
  sub_1000E5760();
  sub_1000E5310();
  uint64_t v78 = v34;
  uint64_t v66 = (void (*)(char *, uint64_t))v33;
  ((void (*)(char *, uint64_t))v33)(v37, v36);
  sub_1000E5750();
  uint64_t v38 = sub_1000E51B0();
  uint64_t v39 = v18;
  uint64_t v40 = v32;
  v32(v26, v18);
  if (*(void *)(v38 + 16) < 2uLL)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v71 + 16))(v79, v38+ ((*(unsigned __int8 *)(v71 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80))+ *(void *)(v71 + 72), v73);
    swift_bridgeObjectRelease();
    uint64_t v41 = v67;
    sub_1000E5750();
    uint64_t v73 = sub_1000E51D0();
    uint64_t v71 = v42;
    v32((char *)v41, v18);
    sub_1000E50E0();
    uint64_t v43 = v72;
    sub_1000E5760();
    uint64_t v44 = v68;
    sub_1000E5750();
    uint64_t v67 = sub_1000E50D0();
    uint64_t v46 = v45;
    v40(v44, v39);
    uint64_t v47 = v80;
    long long v48 = v66;
    v66(v43, v80);
    sub_1000E5760();
    LOBYTE(v44) = sub_1000E5330();
    v48(v43, v47);
    char v49 = sub_1000E5770();
    unsigned __int8 v63 = v44 & 1;
    uint64_t v18 = v74;
    sub_10009FC48((uint64_t)v70, v81, 1, v82, v79, v73, v71, v67, v74, v46, v63, v49 & 1);
    uint64_t v33 = (uint64_t)v69;
    sub_1000E1C30((uint64_t)v18, (uint64_t)&v69[*(int *)(v75 + 24)], type metadata accessor for SportsWidgetDynamicIslandCompactViewModel);
    *(unsigned char *)uint64_t v33 = 1;
    uint64_t v50 = sub_1000E47D0();
    uint64_t v51 = self;
    id v52 = [v51 labelColor:v64, v65];
    uint64_t v53 = sub_1000E4BD0();
    id v54 = [v51 labelColor];
    uint64_t v55 = sub_1000E4BD0();
    id v56 = [v51 labelColor];
    uint64_t v57 = sub_1000E4BD0();
    uint64_t v58 = sub_1000E47D0();
    *(void *)(v33 + 8) = 0x401C000000000000;
    *(void *)(v33 + 16) = v50;
    *(void *)(v33 + 24) = v53;
    *(void *)(v33 + 32) = 1;
    *(unsigned char *)(v33 + 40) = 1;
    *(_OWORD *)(v33 + 48) = xmmword_1000EE790;
    *(void *)(v33 + 64) = 0x4036000000000000;
    *(void *)(v33 + 72) = v55;
    *(void *)(v33 + 80) = v57;
    *(void *)(v33 + 88) = v58;
    *(void *)(v33 + 96) = 1;
    *(unsigned char *)(v33 + 104) = 1;
    *(void *)(v33 + 112) = 0x3FE0000000000000;
    if (qword_100129DF0 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  uint64_t v59 = sub_1000E41D0();
  uint64_t v60 = sub_100008498(v59, (uint64_t)qword_100142250);
  uint64_t v61 = (uint64_t)v76;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v59 - 8) + 16))(v76, v60, v59);
  sub_1000E1A58(&qword_10012A050, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_1000E5970();
  if (result)
  {
    sub_1000E1A58(&qword_10012FC30, (void (*)(uint64_t))type metadata accessor for SportsWidgetDynamicIslandCompactView);
    sub_100014AC4(&qword_10012A018, &qword_100129FF8);
    sub_1000E4B00();
    sub_1000147B8(v61, &qword_100129FF8);
    sub_1000E1CA0(v33, type metadata accessor for SportsWidgetDynamicIslandCompactView);
    return sub_1000E1CA0((uint64_t)v18, type metadata accessor for SportsWidgetDynamicIslandCompactViewModel);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000DF724()
{
  uint64_t v0 = sub_1000082B4(&qword_100129FF8);
  __chkstk_darwin(v0);
  uint64_t v2 = &v16[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_1000E5290();
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (void (*)(uint64_t, char *, uint64_t))&v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1000E5380();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000082B4(&qword_10012FC08);
  sub_1000E5760();
  sub_1000E5750();
  sub_1000A11A8((uint64_t)v8, v5, (uint64_t)v17);
  memcpy(v25, v17, sizeof(v25));
  uint64_t v9 = self;
  sub_1000E08AC((uint64_t)v17);
  id v10 = [v9 labelColor];
  uint64_t v11 = sub_1000E4BD0();
  sub_1000E4C40();
  uint64_t v12 = sub_1000E4C50();
  swift_release();
  sub_1000E4F50();
  sub_1000E40A0();
  char v24 = v19;
  char v23 = v21;
  *(_OWORD *)uint64_t v16 = xmmword_1000F9230;
  *(void *)&v16[16] = v11;
  *(_OWORD *)&v16[24] = xmmword_1000F9240;
  *(_OWORD *)&v16[40] = xmmword_1000F9250;
  *(void *)&v16[56] = v12;
  *(void *)&v16[64] = 0x3FF0000000000000;
  memcpy(&v16[72], v25, 0x120uLL);
  *(void *)&v16[360] = v18;
  v16[368] = v19;
  *(void *)&v16[376] = v20;
  v16[384] = v21;
  *(_OWORD *)&v16[392] = v22;
  if (qword_100129DF0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1000E41D0();
  uint64_t v14 = sub_100008498(v13, (uint64_t)qword_100142250);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v2, v14, v13);
  sub_1000E1A58(&qword_10012A050, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_1000E5970();
  if (result)
  {
    sub_1000082B4(&qword_10012FC38);
    sub_1000E000C();
    sub_100014AC4(&qword_10012A018, &qword_100129FF8);
    sub_1000E4B00();
    sub_1000E09B4((uint64_t)v17);
    sub_1000147B8((uint64_t)v2, &qword_100129FF8);
    memcpy(v26, v16, sizeof(v26));
    return sub_1000E0ABC((uint64_t)v26);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1000DFAF4()
{
  id v0 = sub_10000557C();
  if (v0)
  {
    sub_1000E5B90();
    sub_1000E3F40();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000DFB6C()
{
  uint64_t v0 = sub_1000082B4(&qword_10012FBE0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000E5290();
  type metadata accessor for SportsWidgetActivityFamilyView();
  sub_1000E1A58(&qword_10012FBE8, (void (*)(uint64_t))&type metadata accessor for SportsActivityAttributes);
  sub_1000E1A58(&qword_10012FBF0, (void (*)(uint64_t))type metadata accessor for SportsWidgetActivityFamilyView);
  sub_1000E57C0();
  sub_1000082B4(&qword_10012FBF8);
  uint64_t v4 = sub_1000E5710();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 72);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1000F0F50;
  unint64_t v9 = v8 + v7;
  id v10 = *(void (**)(unint64_t, void, uint64_t))(v5 + 104);
  v10(v9, enum case for ActivityFamily.small(_:), v4);
  v10(v9 + v6, enum case for ActivityFamily.medium(_:), v4);
  sub_100014AC4(&qword_10012FC00, &qword_10012FBE0);
  sub_1000E4660();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t type metadata accessor for SportsWidgetActivityFamilyView()
{
  uint64_t result = qword_10012FDC8;
  if (!qword_10012FDC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000DFE84()
{
  return sub_1000DFF84((uint64_t (*)(uint64_t))sub_1000DC534);
}

uint64_t sub_1000DFEA0()
{
  return sub_1000DFF84((uint64_t (*)(uint64_t))sub_1000DE4DC);
}

uint64_t sub_1000DFEBC()
{
  return sub_1000DFF84((uint64_t (*)(uint64_t))sub_1000DEDF8);
}

uint64_t sub_1000DFED8()
{
  uint64_t v1 = sub_1000082B4(&qword_10012FC08);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000DFF6C()
{
  return sub_1000DFF84((uint64_t (*)(uint64_t))sub_1000DF724);
}

uint64_t sub_1000DFF84(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(sub_1000082B4(&qword_10012FC08) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

unint64_t sub_1000E000C()
{
  unint64_t result = qword_10012FC40;
  if (!qword_10012FC40)
  {
    sub_100008354(&qword_10012FC38);
    sub_1000E0088();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FC40);
  }
  return result;
}

unint64_t sub_1000E0088()
{
  unint64_t result = qword_10012FC48;
  if (!qword_10012FC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FC48);
  }
  return result;
}

uint64_t sub_1000E00DC(uint64_t a1)
{
  uint64_t v2 = sub_1000E5710();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1000E4490();
}

uint64_t sub_1000E01A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000082B4(&qword_10012FD20);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v19 - v7;
  uint64_t v9 = sub_1000082B4(&qword_10012FD10);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v19 - v13;
  sub_1000082B4(&qword_10012FC50);
  sub_1000E58A0();
  sub_1000082B4(&qword_10012FC68);
  sub_1000E5870();
  sub_100014754((uint64_t)v14, (uint64_t)v12, &qword_10012FD10);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v15(v6, v8, v2);
  sub_100014754((uint64_t)v12, a1, &qword_10012FD10);
  uint64_t v16 = sub_1000082B4(&qword_10012FD28);
  v15((char *)(a1 + *(int *)(v16 + 48)), v6, v2);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v8, v2);
  sub_1000147B8((uint64_t)v14, &qword_10012FD10);
  v17(v6, v2);
  return sub_1000147B8((uint64_t)v12, &qword_10012FD10);
}

uint64_t sub_1000E03D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000082B4(&qword_10012FD30);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v19 - v7;
  uint64_t v9 = sub_1000082B4(&qword_10012FD00);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v19 - v13;
  sub_1000082B4(&qword_10012FC58);
  sub_1000E58A0();
  sub_1000082B4(&qword_10012FC70);
  sub_1000E5870();
  sub_100014754((uint64_t)v14, (uint64_t)v12, &qword_10012FD00);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v15(v6, v8, v2);
  sub_100014754((uint64_t)v12, a1, &qword_10012FD00);
  uint64_t v16 = sub_1000082B4(&qword_10012FD38);
  v15((char *)(a1 + *(int *)(v16 + 48)), v6, v2);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v8, v2);
  sub_1000147B8((uint64_t)v14, &qword_10012FD00);
  v17(v6, v2);
  return sub_1000147B8((uint64_t)v12, &qword_10012FD00);
}

uint64_t sub_1000E05FC@<X0>(char *a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_1000082B4(&qword_10012FD40);
  uint64_t v27 = *(void *)(v1 - 8);
  uint64_t v2 = v27;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v25 - v5;
  uint64_t v7 = sub_1000082B4(&qword_10012FCF8);
  uint64_t v28 = *(void *)(v7 - 8);
  uint64_t v8 = v28;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v25 - v12;
  sub_1000082B4(&qword_10012FC60);
  sub_1000E58A0();
  sub_1000082B4(&qword_10012FC78);
  uint64_t v26 = v6;
  sub_1000E5870();
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v15 = v11;
  v14(v11, v13, v7);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v17 = v29;
  uint64_t v18 = v6;
  uint64_t v19 = v1;
  v16(v29, v18, v1);
  uint64_t v20 = v30;
  v14(v30, v15, v7);
  uint64_t v21 = sub_1000082B4(&qword_10012FD48);
  v16(&v20[*(int *)(v21 + 48)], v17, v19);
  long long v22 = *(void (**)(char *, uint64_t))(v27 + 8);
  v22(v26, v19);
  char v23 = *(void (**)(char *, uint64_t))(v28 + 8);
  v23(v13, v7);
  v22(v17, v19);
  return ((uint64_t (*)(char *, uint64_t))v23)(v15, v7);
}

uint64_t sub_1000E08AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000E09B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000E0ABC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000E0BE0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000DCE38(a1);
}

uint64_t sub_1000E0BE8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000DD494(a1);
}

uint64_t sub_1000E0BF0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000DDAF0(a1);
}

unint64_t sub_1000E0BF8()
{
  unint64_t result = qword_10012FCD0;
  if (!qword_10012FCD0)
  {
    sub_100008354(&qword_10012FCC8);
    sub_100008354(&qword_10012A080);
    sub_100008354(&qword_100129FF8);
    sub_1000E0CF0();
    sub_100014AC4(&qword_10012A018, &qword_100129FF8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FCD0);
  }
  return result;
}

unint64_t sub_1000E0CF0()
{
  unint64_t result = qword_10012FCD8;
  if (!qword_10012FCD8)
  {
    sub_100008354(&qword_10012A080);
    sub_10001409C();
    sub_1000E1A58(&qword_10012A0A0, (void (*)(uint64_t))type metadata accessor for SportsWidgetPlayByPlayView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FCD8);
  }
  return result;
}

uint64_t sub_1000E0D9C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000DE088(a1);
}

unint64_t sub_1000E0DA4()
{
  unint64_t result = qword_10012FCE8;
  if (!qword_10012FCE8)
  {
    sub_100008354(&qword_10012B598);
    sub_1000E0E18();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FCE8);
  }
  return result;
}

unint64_t sub_1000E0E18()
{
  unint64_t result = qword_10012FCF0;
  if (!qword_10012FCF0)
  {
    sub_100008354(&qword_10012B5A0);
    sub_100037C54();
    sub_100014AC4(&qword_10012B5C0, &qword_10012B5A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FCF0);
  }
  return result;
}

uint64_t sub_1000E0EB8()
{
  return sub_1000E5870();
}

uint64_t sub_1000E0EF0@<X0>(char *a1@<X8>)
{
  return sub_1000E05FC(a1);
}

uint64_t sub_1000E0EF8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000E03D0(a1);
}

uint64_t sub_1000E0F00@<X0>(uint64_t a1@<X8>)
{
  return sub_1000E01A4(a1);
}

uint64_t sub_1000E0F08()
{
  return sub_1000E4480();
}

uint64_t *sub_1000E0F30(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_1000082B4(&qword_10012F358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000E5710();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_1000082B4(&qword_10012FC08);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return a1;
}

uint64_t sub_1000E108C(uint64_t a1, uint64_t a2)
{
  sub_1000082B4(&qword_10012F358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1000E5710();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_1000082B4(&qword_10012FC08);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

void *sub_1000E1164(void *a1, void *a2, uint64_t a3)
{
  sub_1000082B4(&qword_10012F358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1000E5710();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000082B4(&qword_10012FC08);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

void *sub_1000E1270(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000147B8((uint64_t)a1, &qword_10012F358);
    sub_1000082B4(&qword_10012F358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1000E5710();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000082B4(&qword_10012FC08);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

char *sub_1000E1394(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000082B4(&qword_10012F358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1000E5710();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_1000082B4(&qword_10012FC08);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

char *sub_1000E14A8(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1000147B8((uint64_t)a1, &qword_10012F358);
    uint64_t v6 = sub_1000082B4(&qword_10012F358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000E5710();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_1000082B4(&qword_10012FC08);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_1000E15D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000E15E8);
}

uint64_t sub_1000E15E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000082B4(&qword_10012FD68);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_1000082B4(&qword_10012FC08);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_1000E16E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000E16FC);
}

uint64_t sub_1000E16FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1000082B4(&qword_10012FD68);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_1000082B4(&qword_10012FC08);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_1000E1808()
{
  sub_1000E18D0();
  if (v0 <= 0x3F)
  {
    sub_1000E1928();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1000E18D0()
{
  if (!qword_10012FDD8)
  {
    sub_1000E5710();
    unint64_t v0 = sub_1000E3FF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10012FDD8);
    }
  }
}

void sub_1000E1928()
{
  if (!qword_10012FDE0)
  {
    sub_1000E5290();
    sub_1000E1A58(&qword_10012FBE8, (void (*)(uint64_t))&type metadata accessor for SportsActivityAttributes);
    unint64_t v0 = sub_1000E5780();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10012FDE0);
    }
  }
}

uint64_t sub_1000E19BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000E1A3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000E1A58(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000E1AA0()
{
  unint64_t result = qword_10012FE48;
  if (!qword_10012FE48)
  {
    sub_100008354(&qword_10012FE20);
    sub_100008354(&qword_10012FE28);
    type metadata accessor for SportsWidgetView();
    sub_100008354(&qword_100129FF8);
    sub_1000E1A58(&qword_10012FE38, (void (*)(uint64_t))type metadata accessor for SportsWidgetView);
    sub_100014AC4(&qword_10012A018, &qword_100129FF8);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_1000E1A58(&qword_10012FE40, (void (*)(uint64_t))type metadata accessor for SportsWatchWidgetView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FE48);
  }
  return result;
}

uint64_t sub_1000E1C30(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000E1CA0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000E1D04()
{
  unint64_t result = qword_10012FE50;
  if (!qword_10012FE50)
  {
    sub_100008354(&qword_10012FE58);
    sub_1000E1AA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FE50);
  }
  return result;
}

ValueMetadata *type metadata accessor for TVWidgetGradientView()
{
  return &type metadata for TVWidgetGradientView;
}

uint64_t sub_1000E1D90()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_1000E1DAC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000E4C50();
  uint64_t v3 = sub_1000E4C50();
  sub_1000082B4(&qword_10012E6A0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000F0F50;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v2;
  *(void *)&long long v6 = v4;
  sub_1000E5AE0();
  sub_1000E4EF0();
  sub_1000E4190();
  double result = *(double *)&v6;
  *(_OWORD *)a1 = v6;
  *(_OWORD *)(a1 + 16) = v7;
  *(void *)(a1 + 32) = v8;
  return result;
}

unsigned char *storeEnumTagSinglePayload for VideosPurchaseResolution(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *double result = a2 + 1;
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
        JUMPOUT(0x1000E1FE0);
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
          *double result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VideosPurchaseResolution()
{
  return &type metadata for VideosPurchaseResolution;
}

uint64_t sub_1000E2018()
{
  uint64_t v0 = sub_1000082B4(&qword_10012A580);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1000E3D90();
  uint64_t v3 = *(void *)(v12[0] - 8);
  __chkstk_darwin(v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000E3F10();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_1000E59F0();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000E3DA0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = sub_1000E3C50();
  sub_100008434(v10, qword_1001423B8);
  sub_100008498(v10, (uint64_t)qword_1001423B8);
  sub_1000E5990();
  sub_1000E3F00();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v12[0]);
  sub_1000E3DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_1000E3C40();
}

unint64_t sub_1000E2300()
{
  uint64_t v0 = sub_1000082B4(&qword_10012B4E8);
  __chkstk_darwin(v0 - 8);
  uint64_t v47 = (char *)v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000082B4(&qword_10012A580);
  __chkstk_darwin(v2 - 8);
  uint64_t v46 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_1000E3D90();
  uint64_t v4 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000E3F10();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1000E59F0();
  __chkstk_darwin(v8 - 8);
  uint64_t v49 = sub_1000E3DA0();
  uint64_t v9 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v44 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000082B4(&qword_10012FEC0);
  uint64_t v11 = (int *)(sub_1000082B4(&qword_10012B510) - 8);
  uint64_t v12 = *(void *)v11;
  uint64_t v42 = *(void *)(*(void *)v11 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = swift_allocObject();
  long long v48 = xmmword_1000F0F50;
  uint64_t v43 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_1000F0F50;
  unint64_t v40 = v14 + v13 + v11[14];
  unint64_t v41 = v14 + v13;
  *(unsigned char *)(v14 + v13) = 0;
  sub_1000E5990();
  sub_1000E3F00();
  uint64_t v15 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  unsigned int v28 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  uint64_t v17 = v45;
  v16(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v45);
  uint64_t v29 = v16;
  uint64_t v30 = v4 + 104;
  v27[1] = 0x80000001000E87D0;
  sub_1000E3DB0();
  sub_1000E5990();
  sub_1000E3F00();
  v16(v6, v15, v17);
  uint64_t v18 = v46;
  sub_1000E3DB0();
  uint64_t v39 = *(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56);
  v39(v18, 0, 1, v49);
  uint64_t v37 = sub_1000E3B00();
  uint64_t v19 = *(void *)(v37 - 8);
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  uint64_t v38 = v19 + 56;
  v36(v47, 1, 1, v37);
  uint64_t v35 = sub_1000082B4(&qword_10012B8E8);
  uint64_t v31 = v9 + 56;
  uint64_t v20 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v32 = *(void *)(v9 + 72);
  uint64_t v33 = v20 | 7;
  uint64_t v34 = ((v20 + 32) & ~v20) + 2 * v32;
  *(_OWORD *)(swift_allocObject() + 16) = v48;
  sub_1000E3D80();
  sub_1000E3D80();
  sub_1000E3B30();
  uint64_t v21 = (unsigned char *)(v41 + v42);
  v42 += v41 + v11[14];
  *uint64_t v21 = 1;
  sub_1000E5990();
  sub_1000E3F00();
  uint64_t v22 = v28;
  uint64_t v23 = v45;
  char v24 = v29;
  v29(v6, v28, v45);
  sub_1000E3DB0();
  sub_1000E5990();
  sub_1000E3F00();
  v24(v6, v22, v23);
  uint64_t v25 = v46;
  sub_1000E3DB0();
  v39(v25, 0, 1, v49);
  v36(v47, 1, 1, v37);
  *(_OWORD *)(swift_allocObject() + 16) = v48;
  sub_1000E3D80();
  sub_1000E3D80();
  sub_1000E3B30();
  unint64_t result = sub_100034A30(v43);
  qword_1001423D0 = result;
  return result;
}

uint64_t sub_1000E2A20(char *a1, char *a2)
{
  return sub_10001C5D4(*a1, *a2);
}

Swift::Int sub_1000E2A2C()
{
  return sub_1000E5E20();
}

uint64_t sub_1000E2A88()
{
  sub_1000E5A50();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000E2AC8()
{
  return sub_1000E5E20();
}

uint64_t sub_1000E2B20@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100120160;
  v8._object = v3;
  Swift::Int v5 = sub_1000E5DA0(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_1000E2B80(uint64_t *a1@<X8>)
{
  uint64_t v2 = 48;
  if (!*v1) {
    uint64_t v2 = 49;
  }
  *a1 = v2;
  a1[1] = 0xE100000000000000;
}

void sub_1000E2B9C(void *a1@<X8>)
{
  *a1 = &off_100120860;
}

uint64_t sub_1000E2BAC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100129E88 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000E3C50();
  uint64_t v3 = sub_100008498(v2, (uint64_t)qword_1001423B8);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000E2C54(uint64_t a1)
{
  unint64_t v2 = sub_1000B4C9C();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_1000E2CA0()
{
  if (qword_100129E90 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000E2CFC(uint64_t a1)
{
  unint64_t v2 = sub_1000E2EA8();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000E2D4C()
{
  unint64_t result = qword_10012FE60;
  if (!qword_10012FE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FE60);
  }
  return result;
}

unint64_t sub_1000E2DA4()
{
  unint64_t result = qword_10012FE68;
  if (!qword_10012FE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FE68);
  }
  return result;
}

unint64_t sub_1000E2DFC()
{
  unint64_t result = qword_10012FE70;
  if (!qword_10012FE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FE70);
  }
  return result;
}

uint64_t sub_1000E2E50()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000E2EA8()
{
  unint64_t result = qword_10012FE78;
  if (!qword_10012FE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FE78);
  }
  return result;
}

unint64_t sub_1000E2F00()
{
  unint64_t result = qword_10012FE80;
  if (!qword_10012FE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FE80);
  }
  return result;
}

unint64_t sub_1000E2F58()
{
  unint64_t result = qword_10012FE88;
  if (!qword_10012FE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FE88);
  }
  return result;
}

unint64_t sub_1000E2FB0()
{
  unint64_t result = qword_10012FE90;
  if (!qword_10012FE90)
  {
    sub_100008354(&qword_10012FE98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FE90);
  }
  return result;
}

unint64_t sub_1000E3010()
{
  unint64_t result = qword_10012FEA0;
  if (!qword_10012FEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FEA0);
  }
  return result;
}

unint64_t sub_1000E3068()
{
  unint64_t result = qword_10012FEA8;
  if (!qword_10012FEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FEA8);
  }
  return result;
}

unint64_t sub_1000E30C0()
{
  unint64_t result = qword_10012FEB0;
  if (!qword_10012FEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FEB0);
  }
  return result;
}

unint64_t sub_1000E3114(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1000B4C9C();
  unint64_t result = sub_1000B4DF8();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1000E3148()
{
  unint64_t result = qword_10012FEB8;
  if (!qword_10012FEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10012FEB8);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

BOOL sub_1000E31C0(int a1, int a2, int a3)
{
  if (qword_100141CF0 == -1)
  {
    BOOL v6 = dword_100141CE0 < a1;
    if (dword_100141CE0 > a1) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_100141CF0, 0, (dispatch_function_t)sub_1000E32B4);
    BOOL v6 = dword_100141CE0 < a1;
    if (dword_100141CE0 > a1) {
      return 1;
    }
  }
  if (v6) {
    return 0;
  }
  if (dword_100141CE4 > a2) {
    return 1;
  }
  return dword_100141CE4 >= a2 && dword_100141CE8 >= a3;
}

uint64_t sub_1000E32B4()
{
  return sub_1000E3460(1);
}

uint64_t sub_1000E32BC(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_100141CF8 == -1)
  {
    if (qword_100141D00) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_100141CF8, 0, (dispatch_function_t)sub_1000E3458);
    if (qword_100141D00) {
      return _availability_version_check();
    }
  }
  if (qword_100141CF0 == -1)
  {
    BOOL v8 = dword_100141CE0 < a2;
    if (dword_100141CE0 > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_100141CF0, 0, (dispatch_function_t)sub_1000E32B4);
    BOOL v8 = dword_100141CE0 < a2;
    if (dword_100141CE0 > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_100141CE4 > a3) {
    return 1;
  }
  return dword_100141CE4 >= a3 && dword_100141CE8 >= a4;
}

uint64_t sub_1000E3458()
{
  return sub_1000E3460(0);
}

uint64_t sub_1000E3460(uint64_t result)
{
  uint64_t v1 = (uint64_t (**)(void))qword_100141D00;
  if (qword_100141D00) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (&__availability_version_check)
    {
      uint64_t v1 = &__availability_version_check;
      qword_100141D00 = (uint64_t)&__availability_version_check;
    }
    if (!v1 || result != 0)
    {
      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        Swift::OpaquePointer v4 = *(unsigned __int8 **)result;
        unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          Swift::Int v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            char v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    unsigned int v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        unint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          unint64_t v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &dword_100141CE0, &dword_100141CE4, &dword_100141CE8);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_1000E3798(void *a1, NSObject *a2)
{
  [a1 contextEnum];
  sub_100007DC0();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "TVUNUpNextWidgetDataSource - Resolved item lacks canonical id. Type:[%ld] %@", v3, 0x16u);
}

void sub_1000E3824(void *a1, NSObject *a2)
{
  [a1 contextEnum];
  sub_100007DC0();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "TVUNUpNextWidgetDataSource - Failed to build a punchoutURL. Type:[%ld] %@", v3, 0x16u);
}

uint64_t sub_1000E38B0()
{
  return static AppIntentError.Unrecoverable.notAllowed.getter();
}

uint64_t sub_1000E38C0()
{
  return static AppIntentError.Unrecoverable.entityNotFound.getter();
}

uint64_t sub_1000E38D0()
{
  return static AppIntentError.Unrecoverable.unsupportedOnDevice.getter();
}

uint64_t sub_1000E38E0()
{
  return static AppIntentError.Unrecoverable.featureCurrentlyRestricted.getter();
}

uint64_t sub_1000E38F0()
{
  return static AppIntentError.Unrecoverable.unknown.getter();
}

uint64_t sub_1000E3900()
{
  return static AppIntentError.UserActionRequired.signin.getter();
}

uint64_t sub_1000E3910()
{
  return type metadata accessor for AppIntentError();
}

uint64_t sub_1000E3920()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_1000E3930()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_1000E3940()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_1000E3990()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_1000E39A0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000E39B0()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_1000E39C0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000E39D0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000E3A00()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000E3A10()
{
  return static IntentResult.result<A>(value:)();
}

uint64_t sub_1000E3A30()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000E3A40()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000E3A50()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_1000E3A60()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_1000E3A70()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000E3A80()
{
  return IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000E3A90()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_1000E3AA0()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_1000E3AB0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_1000E3AF0()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_1000E3B00()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_1000E3B10()
{
  return DisplayRepresentation.title.getter();
}

uint64_t sub_1000E3B20()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_1000E3B30()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:)();
}

uint64_t sub_1000E3B40()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_1000E3B50()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_1000E3B60()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_1000E3B80()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_1000E3B90()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000E3BA0()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_1000E3BE0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_1000E3BF0()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation<A, B>(_:)();
}

void sub_1000E3C00(Swift::String a1)
{
}

uint64_t sub_1000E3C10()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000E3C20()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_1000E3C30()
{
  return _EntityURLRepresentation.init(_:)();
}

uint64_t sub_1000E3C40()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000E3C50()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_1000E3C70()
{
  return _EntityDeferredPropertyValue.init(get:)();
}

uint64_t sub_1000E3C80()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_1000E3C90()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_1000E3CA0()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

Class sub_1000E3CB0()
{
  return URLRequest._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_1000E3CC0()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t sub_1000E3CD0()
{
  return type metadata accessor for URLRequest();
}

uint64_t sub_1000E3CE0()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_1000E3CF0()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_1000E3D00()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_1000E3D10()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_1000E3D20()
{
  return URLComponents.queryItems.getter();
}

uint64_t sub_1000E3D30()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_1000E3D40()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_1000E3D50()
{
  return URLComponents.url.getter();
}

uint64_t sub_1000E3D60()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_1000E3D70()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000E3D80()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_1000E3D90()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_1000E3DA0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000E3DB0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_1000E3DC0()
{
  return URL.absoluteString.getter();
}

uint64_t sub_1000E3DD0()
{
  return URL.lastPathComponent.getter();
}

uint64_t sub_1000E3DE0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E3DF0()
{
  return URL.init(string:)();
}

uint64_t sub_1000E3E00()
{
  return type metadata accessor for URL();
}

NSData sub_1000E3E10()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000E3E20()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E3E30()
{
  return Date.description(with:)();
}

uint64_t sub_1000E3E40()
{
  return Date.description.getter();
}

uint64_t sub_1000E3E50()
{
  return Date.timeIntervalSince(_:)();
}

NSDate sub_1000E3E60()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_1000E3E70()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_1000E3E80()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_1000E3E90()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_1000E3EA0()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_1000E3EB0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E3EC0()
{
  return Date.advanced(by:)();
}

uint64_t sub_1000E3ED0()
{
  return Date.init()();
}

uint64_t sub_1000E3EE0()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000E3EF0()
{
  return NSLog(_:_:)();
}

uint64_t sub_1000E3F00()
{
  return static Locale.current.getter();
}

uint64_t sub_1000E3F10()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000E3F20()
{
  return _CGColorInitTrampoline.init(_colorLiteralRed:green:blue:alpha:)();
}

uint64_t sub_1000E3F30()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_1000E3F40()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_1000E3F50()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_1000E3F60()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_1000E3F70()
{
  return Published.init(initialValue:)();
}

uint64_t sub_1000E3F80()
{
  return type metadata accessor for Published();
}

uint64_t sub_1000E3F90()
{
  return Animatable<>.animatableData.modify();
}

uint64_t sub_1000E3FA0()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t sub_1000E3FB0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1000E3FC0()
{
  return static AlignmentID._combineExplicit(childValue:_:into:)();
}

uint64_t sub_1000E3FD0()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_1000E3FE0()
{
  return static ContentMode.== infix(_:_:)();
}

uint64_t sub_1000E3FF0()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_1000E4000()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_1000E4010()
{
  return TupleWidget.init(_:)();
}

uint64_t sub_1000E4020()
{
  return ScaledMetric.init(wrappedValue:relativeTo:)();
}

uint64_t sub_1000E4030()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t sub_1000E4040()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t sub_1000E4050()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t sub_1000E4060()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_1000E4070()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_1000E4080()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_1000E4090()
{
  return static WidgetBundle.main()();
}

uint64_t sub_1000E40A0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_1000E40B0()
{
  return static AnyTransition.asymmetric(insertion:removal:)();
}

uint64_t sub_1000E40C0()
{
  return static AnyTransition.move(edge:)();
}

uint64_t sub_1000E40D0()
{
  return static AnyTransition.opacity.getter();
}

uint64_t sub_1000E40E0()
{
  return AnyTransition.combined(with:)();
}

uint64_t sub_1000E40F0()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_1000E4100()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t sub_1000E4110()
{
  return GeometryProxy.subscript.getter();
}

uint64_t sub_1000E4120()
{
  return LayoutSubview.sizeThatFits(_:)();
}

uint64_t sub_1000E4130()
{
  return LayoutSubview.place(at:anchor:proposal:)();
}

uint64_t sub_1000E4140()
{
  return type metadata accessor for LayoutSubview();
}

uint64_t sub_1000E4150()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t sub_1000E4160()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t sub_1000E4170()
{
  return type metadata accessor for LayoutSubviews();
}

uint64_t sub_1000E4180()
{
  return LayoutSubviews.subscript.getter();
}

uint64_t sub_1000E4190()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_1000E41A0()
{
  return ViewDimensions.subscript.getter();
}

uint64_t sub_1000E41B0()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t sub_1000E41C0()
{
  return static DynamicTypeSize.< infix(_:_:)();
}

uint64_t sub_1000E41D0()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_1000E41E0()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_1000E41F0()
{
  return type metadata accessor for LegibilityWeight();
}

uint64_t sub_1000E4200()
{
  return static ProposedViewSize.unspecified.getter();
}

uint64_t sub_1000E4210()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t sub_1000E4220()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t sub_1000E4230()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_1000E4240()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_1000E4250()
{
  return static ContentTransition.EffectType.translation(_:)();
}

uint64_t sub_1000E4260()
{
  return static ContentTransition.EffectType.opacity.getter();
}

uint64_t sub_1000E4270()
{
  return type metadata accessor for ContentTransition.EffectType();
}

uint64_t sub_1000E4280()
{
  return static ContentTransition.numericText(countsDown:)();
}

uint64_t sub_1000E4290()
{
  return type metadata accessor for ContentTransition.Effect();
}

uint64_t sub_1000E42A0()
{
  return ContentTransition.Effect.init(_:timeline:appliesOnInsertion:appliesOnRemoval:)();
}

uint64_t sub_1000E42B0()
{
  return static ContentTransition.Method.binary.getter();
}

uint64_t sub_1000E42C0()
{
  return type metadata accessor for ContentTransition.Method();
}

uint64_t sub_1000E42D0()
{
  return ContentTransition.init(method:effects:)();
}

uint64_t sub_1000E42E0()
{
  return static ContentTransition.Options.animatesDifferentContent.getter();
}

uint64_t sub_1000E42F0()
{
  return static ContentTransition.Options.addsDrawingGroup.getter();
}

uint64_t sub_1000E4300()
{
  return static ContentTransition.default.getter();
}

uint64_t sub_1000E4310()
{
  return static ContentTransition.identity.getter();
}

uint64_t sub_1000E4320()
{
  return type metadata accessor for ContentTransition();
}

uint64_t sub_1000E4330()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_1000E4340()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_1000E4350()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_1000E4360()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_1000E4370()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t sub_1000E4380()
{
  return EnvironmentValues.sizeCategory.setter();
}

uint64_t sub_1000E4390()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_1000E43A0()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_1000E43B0()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000E43C0()
{
  return EnvironmentValues.legibilityWeight.getter();
}

uint64_t sub_1000E43D0()
{
  return EnvironmentValues.legibilityWeight.setter();
}

uint64_t sub_1000E43E0()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_1000E43F0()
{
  return EnvironmentValues.contentTransition.setter();
}

uint64_t sub_1000E4400()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_1000E4410()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_1000E4420()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_1000E4430()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000E4440()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_1000E4450()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000E4460()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t sub_1000E4470()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_1000E4480()
{
  return EnvironmentValues.activityFamily.getter();
}

uint64_t sub_1000E4490()
{
  return EnvironmentValues.activityFamily.setter();
}

uint64_t sub_1000E44A0()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_1000E44B0()
{
  return EnvironmentValues.isActivityFullscreen.getter();
}

uint64_t sub_1000E44C0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1000E44D0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000E44E0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1000E44F0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_1000E4500()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_1000E4510()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_1000E4520()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

void sub_1000E4530(Swift::String a1)
{
}

uint64_t sub_1000E4540()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000E4550()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_1000E4560()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1000E4570()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_1000E4580()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_1000E4590()
{
  return static AccessibilityTraits.isImage.getter();
}

uint64_t sub_1000E45A0()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_1000E45B0()
{
  return type metadata accessor for ContentSizeCategory();
}

uint64_t sub_1000E45C0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1000E45D0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1000E45E0()
{
  return HorizontalAlignment.init(_:)();
}

uint64_t sub_1000E45F0()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_1000E4600()
{
  return WidgetConfiguration.description<A>(_:)();
}

uint64_t sub_1000E4610()
{
  return WidgetConfiguration.hiddenControl()();
}

uint64_t sub_1000E4620()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_1000E4630()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_1000E4640()
{
  return WidgetConfiguration.configurationDisplayName<A>(_:)();
}

uint64_t sub_1000E4650()
{
  return WidgetConfiguration.disablesControlStateCaching()();
}

uint64_t sub_1000E4660()
{
  return WidgetConfiguration.supplementalActivityFamilies(_:)();
}

uint64_t sub_1000E4670()
{
  return WidgetConfiguration._containerBackgroundRemovable(_:)();
}

uint64_t sub_1000E4680()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_1000E4690()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000E46A0()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t sub_1000E46B0()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t sub_1000E46C0()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t sub_1000E46D0()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_1000E46E0()
{
  return static AccessibilityChildBehavior.contain.getter();
}

uint64_t sub_1000E46F0()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_1000E4700()
{
  return type metadata accessor for _ContentTransitionModifier();
}

uint64_t sub_1000E4710()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_1000E4720()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_1000E4730()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1000E4740()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_1000E4750()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1000E4760()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_1000E4770()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_1000E4780()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_1000E4790()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_1000E47A0()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_1000E47B0()
{
  return static Font.largeTitle.getter();
}

uint64_t sub_1000E47C0()
{
  return static Font.subheadline.getter();
}

uint64_t sub_1000E47D0()
{
  return static Font.body.getter();
}

uint64_t sub_1000E47E0()
{
  return static Font.Width.condensed.getter();
}

uint64_t sub_1000E47F0()
{
  return type metadata accessor for Font.Width();
}

uint64_t sub_1000E4800()
{
  return static Font.title.getter();
}

uint64_t sub_1000E4810()
{
  return Font.width(_:)();
}

uint64_t sub_1000E4820()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_1000E4830()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_1000E4840()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_1000E4850()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_1000E4860()
{
  return static Font.system(_:design:weight:)();
}

uint64_t sub_1000E4870()
{
  return Font.weight(_:)();
}

uint64_t sub_1000E4880()
{
  return static Font.caption.getter();
}

uint64_t sub_1000E4890()
{
  return static Font.caption2.getter();
}

uint64_t sub_1000E48A0()
{
  return static Font.footnote.getter();
}

uint64_t sub_1000E48B0()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t sub_1000E48C0()
{
  return Font.smallCaps()();
}

uint64_t sub_1000E48D0()
{
  return Link.init(destination:label:)();
}

uint64_t sub_1000E48E0()
{
  return Path.init(roundedRect:cornerRadius:style:)();
}

uint64_t sub_1000E48F0()
{
  return Path.move(to:)();
}

uint64_t sub_1000E4900()
{
  return Path.addLine(to:)();
}

uint64_t sub_1000E4910()
{
  return Path.init()();
}

uint64_t sub_1000E4920()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_1000E4930()
{
  return Text.init(timerInterval:pauseTime:countsDown:showsHours:)();
}

uint64_t sub_1000E4940()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_1000E4950()
{
  return Text.monospacedDigit()();
}

uint64_t sub_1000E4960()
{
  return static Text.+ infix(_:_:)();
}

uint64_t sub_1000E4970()
{
  return Text.font(_:)();
}

uint64_t sub_1000E4980()
{
  return type metadata accessor for Text.DateStyle.UnitsConfiguration.Style();
}

uint64_t sub_1000E4990()
{
  return Text.DateStyle.UnitsConfiguration.init(units:style:)();
}

uint64_t sub_1000E49A0()
{
  return type metadata accessor for Text.DateStyle.UnitsConfiguration();
}

uint64_t sub_1000E49B0()
{
  return static Text.DateStyle.relative(unitConfiguration:)();
}

uint64_t sub_1000E49C0()
{
  return type metadata accessor for Text.DateStyle();
}

uint64_t sub_1000E49D0()
{
  return Text.init(_:style:)();
}

uint64_t sub_1000E49E0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1000E49F0()
{
  return Text.init(_:)();
}

uint64_t sub_1000E4A00()
{
  return Text.init<A>(_:)();
}

uint64_t sub_1000E4A10()
{
  return View.conditionalFrame(width:height:alignment:condition:)();
}

uint64_t sub_1000E4A20()
{
  return View.accessibilityIdentifier(key:location:)();
}

uint64_t sub_1000E4A30()
{
  return View.conditionalDynamicTypeSize(_:condition:)();
}

uint64_t sub_1000E4A40()
{
  return View.conditionalDynamicTypeSize(_:condition:)();
}

uint64_t sub_1000E4A50()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_1000E4A60()
{
  return View.activityBackgroundTint(_:)();
}

uint64_t sub_1000E4A70()
{
  return View.widgetURL(_:)();
}

uint64_t sub_1000E4A80()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000E4A90()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000E4AA0()
{
  return View.background<A>(_:alignment:)();
}

uint64_t sub_1000E4AB0()
{
  return View.unredacted()();
}

uint64_t sub_1000E4AC0()
{
  return View.environment<A>(_:_:)();
}

uint64_t sub_1000E4AD0()
{
  return View.accessibility(removeTraits:)();
}

uint64_t sub_1000E4AE0()
{
  return View.accessibility(label:)();
}

uint64_t sub_1000E4AF0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000E4B00()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t sub_1000E4B10()
{
  return View.foregroundColor(_:)();
}

uint64_t sub_1000E4B20()
{
  return View.monospacedDigit()();
}

uint64_t sub_1000E4B30()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t sub_1000E4B40()
{
  return View.onPreferenceChange<A>(_:perform:)();
}

uint64_t sub_1000E4B50()
{
  return View.containerBackground<A>(for:alignment:content:)();
}

uint64_t sub_1000E4B60()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_1000E4B70()
{
  return View.multilineTextAlignment(_:)();
}

uint64_t sub_1000E4B80()
{
  return View.font(_:)();
}

uint64_t sub_1000E4B90()
{
  return View.padding(_:_:)();
}

uint64_t sub_1000E4BA0()
{
  return View.redacted(reason:)();
}

uint64_t sub_1000E4BB0()
{
  return View.lineLimit(_:reservesSpace:)();
}

uint64_t sub_1000E4BC0()
{
  return View.lineLimit(_:)();
}

uint64_t sub_1000E4BD0()
{
  return Color.init(uiColor:)();
}

uint64_t sub_1000E4BE0()
{
  return Color.description.getter();
}

uint64_t sub_1000E4BF0()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_1000E4C00()
{
  return static Color.red.getter();
}

uint64_t sub_1000E4C10()
{
  return static Color.gray.getter();
}

uint64_t sub_1000E4C20()
{
  return static Color.black.getter();
}

uint64_t sub_1000E4C30()
{
  return static Color.clear.getter();
}

uint64_t sub_1000E4C40()
{
  return static Color.white.getter();
}

uint64_t sub_1000E4C50()
{
  return Color.opacity(_:)();
}

uint64_t sub_1000E4C60()
{
  return static Color.primary.getter();
}

uint64_t sub_1000E4C70()
{
  return static Color.secondary.getter();
}

uint64_t sub_1000E4C80()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_1000E4C90()
{
  return Color.init(_:)();
}

uint64_t sub_1000E4CA0()
{
  return Group<A>.init(content:)();
}

uint64_t sub_1000E4CB0()
{
  return type metadata accessor for Group();
}

uint64_t sub_1000E4CC0()
{
  return Image.init(uiImage:)();
}

uint64_t sub_1000E4CD0()
{
  return Image.init(systemName:)();
}

uint64_t sub_1000E4CE0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_1000E4CF0()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_1000E4D00()
{
  return Image.widgetAccentedRenderingMode(_:)();
}

uint64_t sub_1000E4D10()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_1000E4D20()
{
  return Image.init(_:bundle:)();
}

uint64_t sub_1000E4D30()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t sub_1000E4D60()
{
  return Shape.layoutDirectionBehavior.getter();
}

uint64_t sub_1000E4D80()
{
  return static Shape.role.getter();
}

uint64_t sub_1000E4DA0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_1000E4DB0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_1000E4DC0()
{
  return State.projectedValue.getter();
}

uint64_t sub_1000E4DD0()
{
  return static Anchor.Source<A>.bounds.getter();
}

uint64_t sub_1000E4DE0()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t sub_1000E4DF0()
{
  return type metadata accessor for HStack();
}

uint64_t sub_1000E4E00()
{
  return static Layout._makeLayoutView(root:inputs:body:)();
}

uint64_t sub_1000E4E10()
{
  return Layout.updateCache(_:subviews:)();
}

uint64_t sub_1000E4E20()
{
  return static Layout.layoutProperties.getter();
}

uint64_t sub_1000E4E30()
{
  return Layout.spacing(subviews:cache:)();
}

uint64_t sub_1000E4E40()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t sub_1000E4E50()
{
  return type metadata accessor for VStack();
}

uint64_t sub_1000E4E60()
{
  return ZStack.init(alignment:content:)();
}

uint64_t sub_1000E4E70()
{
  return type metadata accessor for ZStack();
}

uint64_t sub_1000E4E80()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_1000E4E90()
{
  return Divider.init()();
}

uint64_t sub_1000E4EA0()
{
  return type metadata accessor for Divider();
}

uint64_t sub_1000E4EB0()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_1000E4EC0()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_1000E4ED0()
{
  return Gradient.Stop.init(color:location:)();
}

uint64_t sub_1000E4EE0()
{
  return Gradient.init(stops:)();
}

uint64_t sub_1000E4EF0()
{
  return Gradient.init(colors:)();
}

uint64_t sub_1000E4F00()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_1000E4F10()
{
  return static Alignment.topTrailing.getter();
}

uint64_t sub_1000E4F20()
{
  return static Alignment.bottomLeading.getter();
}

uint64_t sub_1000E4F30()
{
  return static Alignment.top.getter();
}

uint64_t sub_1000E4F40()
{
  return static Alignment.bottom.getter();
}

uint64_t sub_1000E4F50()
{
  return static Alignment.center.getter();
}

uint64_t sub_1000E4F60()
{
  return static Alignment.leading.getter();
}

uint64_t sub_1000E4F70()
{
  return static Alignment.trailing.getter();
}

uint64_t sub_1000E4F80()
{
  return static Animation.linear(duration:)();
}

uint64_t sub_1000E4F90()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t sub_1000E4FA0()
{
  return type metadata accessor for TupleView();
}

uint64_t sub_1000E4FB0()
{
  return TupleView.init(_:)();
}

uint64_t sub_1000E4FC0()
{
  return static UnitPoint.topLeading.getter();
}

uint64_t sub_1000E4FD0()
{
  return static UnitPoint.bottomTrailing.getter();
}

uint64_t sub_1000E4FE0()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_1000E4FF0()
{
  return static UnitPoint.bottom.getter();
}

uint64_t sub_1000E5000()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_1000E5010()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_1000E5020()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000E5030()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000E5040()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_1000E5050()
{
  return static DispatchTime.now()();
}

uint64_t sub_1000E5060()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_1000E5070()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_1000E5080()
{
  return + infix(_:_:)();
}

uint64_t sub_1000E5090()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t sub_1000E50A0()
{
  return TVAppFeature.isEnabled.getter();
}

uint64_t sub_1000E50B0()
{
  return SportsDisplayError.title.getter();
}

uint64_t sub_1000E50C0()
{
  return SportsDisplayError.subtitle.getter();
}

uint64_t sub_1000E50D0()
{
  return static SportsVoiceOverUtility.widgetScoreVoiceOverText(state:attributes:)();
}

uint64_t sub_1000E50E0()
{
  return type metadata accessor for SportsVoiceOverUtility();
}

uint64_t sub_1000E50F0()
{
  return SportsRunningClockLocalization.init()();
}

uint64_t sub_1000E5100()
{
  return type metadata accessor for Account();
}

uint64_t sub_1000E5110()
{
  return SportsActivityPlay.isPlay.getter();
}

uint64_t sub_1000E5120()
{
  return SportsActivityPlay.isLeftBarVisible.getter();
}

uint64_t sub_1000E5130()
{
  return SportsActivityPlay.isRightBarVisible.getter();
}

uint64_t sub_1000E5140()
{
  return SportsActivityPlay.text.getter();
}

uint64_t sub_1000E5150()
{
  return type metadata accessor for SportsActivityPlay();
}

uint64_t sub_1000E5160()
{
  return type metadata accessor for SportsActivityClock();
}

uint64_t sub_1000E5170()
{
  return SportsActivityContender.canonicalId.getter();
}

uint64_t sub_1000E5180()
{
  return SportsActivityContender.scoreEntries.getter();
}

uint64_t sub_1000E5190()
{
  return SportsActivityContender.isWinnerIndicatorVisible.getter();
}

uint64_t sub_1000E51A0()
{
  return type metadata accessor for SportsActivityContender();
}

uint64_t sub_1000E51B0()
{
  return SportsActivityAttributes.contenders.getter();
}

uint64_t sub_1000E51C0()
{
  return SportsActivityAttributes.sport.getter();
}

uint64_t sub_1000E51D0()
{
  return SportsActivityAttributes.eventURL.getter();
}

uint64_t sub_1000E51E0()
{
  return SportsActivityAttributes.Contender.abbreviation.getter();
}

uint64_t sub_1000E51F0()
{
  return SportsActivityAttributes.Contender.LogoFilePaths.defaultSize.getter();
}

uint64_t sub_1000E5200()
{
  return SportsActivityAttributes.Contender.LogoFilePaths.smallSize.getter();
}

uint64_t sub_1000E5210()
{
  return type metadata accessor for SportsActivityAttributes.Contender.LogoFilePaths();
}

uint64_t sub_1000E5220()
{
  return SportsActivityAttributes.Contender.logoFilePaths.getter();
}

uint64_t sub_1000E5230()
{
  return SportsActivityAttributes.Contender.isHome.getter();
}

uint64_t sub_1000E5240()
{
  return SportsActivityAttributes.Contender.colorHex.getter();
}

uint64_t sub_1000E5250()
{
  return type metadata accessor for SportsActivityAttributes.Contender();
}

uint64_t sub_1000E5260()
{
  return SportsActivityAttributes.EventInfo.startDate.getter();
}

uint64_t sub_1000E5270()
{
  return type metadata accessor for SportsActivityAttributes.EventInfo();
}

uint64_t sub_1000E5280()
{
  return SportsActivityAttributes.eventInfo.getter();
}

uint64_t sub_1000E5290()
{
  return type metadata accessor for SportsActivityAttributes();
}

uint64_t sub_1000E52A0()
{
  return SportsActivitySoccerClock.runningClockDataSource.getter();
}

uint64_t sub_1000E52B0()
{
  return SportsActivitySoccerClock.penaltyShootoutsViewModel.getter();
}

uint64_t sub_1000E52C0()
{
  return type metadata accessor for SportsActivitySoccerClock();
}

uint64_t sub_1000E52D0()
{
  return SportsActivityContentState.shouldDisplayPlayByPlay.getter();
}

uint64_t sub_1000E52E0()
{
  return type metadata accessor for SportsActivityContentState.EventInfoState();
}

uint64_t sub_1000E52F0()
{
  return SportsActivityContentState.eventInfoState.getter();
}

uint64_t sub_1000E5300()
{
  return SportsActivityContentState.contenderA.getter();
}

uint64_t sub_1000E5310()
{
  return SportsActivityContentState.contenderB.getter();
}

uint64_t sub_1000E5320()
{
  return SportsActivityContentState.isClockVisible.getter();
}

uint64_t sub_1000E5330()
{
  return SportsActivityContentState.isScoreVisible.getter();
}

uint64_t sub_1000E5340()
{
  return SportsActivityContentState.isEventInfoVisible.getter();
}

uint64_t sub_1000E5350()
{
  return SportsActivityContentState.shouldShowWatchAlertUI.getter();
}

uint64_t sub_1000E5360()
{
  return SportsActivityContentState.play.getter();
}

uint64_t sub_1000E5370()
{
  return SportsActivityContentState.clock.getter();
}

uint64_t sub_1000E5380()
{
  return type metadata accessor for SportsActivityContentState();
}

uint64_t sub_1000E5390()
{
  return SportsActivityGenericClock.runningClockDataSource.getter();
}

uint64_t sub_1000E53A0()
{
  return type metadata accessor for SportsActivityGenericClock();
}

uint64_t sub_1000E53B0()
{
  return SportsActivityBaseballClock.runningClockDataSource.getter();
}

uint64_t sub_1000E53C0()
{
  return SportsActivityBaseballClock.ballsAndStrikes.getter();
}

uint64_t sub_1000E53D0()
{
  return SportsActivityBaseballClock.outsActiveStates.getter();
}

uint64_t sub_1000E53E0()
{
  return SportsActivityBaseballClock.basesActiveStates.getter();
}

uint64_t sub_1000E53F0()
{
  return SportsActivityBaseballClock.isActiveBaseVisible.getter();
}

uint64_t sub_1000E5400()
{
  return type metadata accessor for SportsActivityBaseballClock();
}

uint64_t sub_1000E5410()
{
  return PenaltyShootoutsViewModel.competitorShootoutsViewModels.getter();
}

uint64_t sub_1000E5420()
{
  return type metadata accessor for PenaltyShootoutsViewModel();
}

uint64_t sub_1000E5430()
{
  return type metadata accessor for CompetitorShootoutsViewModel.ShootoutState();
}

uint64_t sub_1000E5440()
{
  return CompetitorShootoutsViewModel.shootouts.getter();
}

uint64_t sub_1000E5450()
{
  return type metadata accessor for CompetitorShootoutsViewModel();
}

uint64_t sub_1000E5460()
{
  return type metadata accessor for SportingEventClockPeriodType();
}

uint64_t sub_1000E5470()
{
  return RunningClockComponentsFormatter.LiveClockComponents.dateInterval.getter();
}

uint64_t sub_1000E5480()
{
  return RunningClockComponentsFormatter.LiveClockComponents.pauseAt.getter();
}

uint64_t sub_1000E5490()
{
  return RunningClockComponentsFormatter.LiveClockComponents.countdown.getter();
}

uint64_t sub_1000E54A0()
{
  return type metadata accessor for RunningClockComponentsFormatter.LiveClockComponents();
}

uint64_t sub_1000E54B0()
{
  return RunningClockComponentsFormatter.FormattedComponents.liveClock.getter();
}

uint64_t sub_1000E54C0()
{
  return RunningClockComponentsFormatter.FormattedComponents.headerTitle.getter();
}

uint64_t sub_1000E54D0()
{
  return RunningClockComponentsFormatter.FormattedComponents.clock.getter();
}

uint64_t sub_1000E54E0()
{
  return RunningClockComponentsFormatter.FormattedComponents.prefix.getter();
}

uint64_t sub_1000E54F0()
{
  return RunningClockComponentsFormatter.FormattedComponents.suffix.getter();
}

uint64_t sub_1000E5500()
{
  return type metadata accessor for RunningClockComponentsFormatter.FormattedComponents();
}

uint64_t sub_1000E5510()
{
  return RunningClockComponentsFormatter.formattedComponents(dataSource:)();
}

uint64_t sub_1000E5520()
{
  return RunningClockComponentsFormatter.DataSource.periodType.getter();
}

uint64_t sub_1000E5530()
{
  return type metadata accessor for RunningClockComponentsFormatter.DataSource();
}

uint64_t sub_1000E5540()
{
  return static RunningClockComponentsFormatter.StyleOptions.abbreviatedShootoutStyle.getter();
}

uint64_t sub_1000E5550()
{
  return type metadata accessor for RunningClockComponentsFormatter.StyleOptions();
}

uint64_t sub_1000E5560()
{
  return RunningClockComponentsFormatter.styleOptions.setter();
}

uint64_t sub_1000E5570()
{
  return RunningClockComponentsFormatter.init(localizationProvider:)();
}

uint64_t sub_1000E5580()
{
  return type metadata accessor for RunningClockComponentsFormatter();
}

uint64_t sub_1000E5590()
{
  return type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName();
}

uint64_t sub_1000E55A0()
{
  return Sport.scoreStatisticName.getter();
}

uint64_t sub_1000E55B0()
{
  return type metadata accessor for Sport();
}

uint64_t sub_1000E55C0()
{
  return static WidgetRenderingMode.== infix(_:_:)();
}

uint64_t sub_1000E55D0()
{
  return static WidgetRenderingMode.vibrant.getter();
}

uint64_t sub_1000E55E0()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_1000E55F0()
{
  return static WidgetAccentedRenderingMode.fullColor.getter();
}

uint64_t sub_1000E5600()
{
  return type metadata accessor for WidgetAccentedRenderingMode();
}

uint64_t sub_1000E5610()
{
  return static WidgetCenter.Private_Timeouts.placeholder.getter();
}

uint64_t sub_1000E5620()
{
  return static WidgetCenter.Private_Timeouts.timeline.getter();
}

uint64_t sub_1000E5630()
{
  return WidgetFamily.rawValue.getter();
}

uint64_t sub_1000E5640()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_1000E5650()
{
  return static WidgetLocation.homeScreen.getter();
}

uint64_t sub_1000E5660()
{
  return static WidgetLocation.lockScreen.getter();
}

uint64_t sub_1000E5670()
{
  return static WidgetLocation.== infix(_:_:)();
}

uint64_t sub_1000E5680()
{
  return static WidgetLocation.standBy.getter();
}

uint64_t sub_1000E5690()
{
  return type metadata accessor for WidgetLocation();
}

uint64_t sub_1000E56A0()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_1000E56B0()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_1000E56C0()
{
  return ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)();
}

uint64_t sub_1000E56D0()
{
  return ControlToggle.init<A, B, C, D, E, F>(kind:intentUpdatableProperty:content:value:)();
}

uint64_t sub_1000E56E0()
{
  return DynamicIsland.init<A, B, C, D>(expanded:compactLeading:compactTrailing:minimal:)();
}

uint64_t sub_1000E56F0()
{
  return DynamicIsland.widgetURL(_:)();
}

uint64_t sub_1000E5700()
{
  return type metadata accessor for DynamicIsland();
}

uint64_t sub_1000E5710()
{
  return type metadata accessor for ActivityFamily();
}

uint64_t sub_1000E5740()
{
  return ControlAffordances.init(tint:status:actionHint:)();
}

uint64_t sub_1000E5750()
{
  return ActivityViewContext.attributes.getter();
}

uint64_t sub_1000E5760()
{
  return ActivityViewContext.state.getter();
}

uint64_t sub_1000E5770()
{
  return ActivityViewContext.isStale.getter();
}

uint64_t sub_1000E5780()
{
  return type metadata accessor for ActivityViewContext();
}

uint64_t sub_1000E5790()
{
  return StaticConfiguration.init<A>(kind:provider:content:)();
}

uint64_t sub_1000E57A0()
{
  return static TimelineReloadPolicy.after(_:)();
}

uint64_t sub_1000E57B0()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_1000E57C0()
{
  return ActivityConfiguration.init<A>(for:content:dynamicIsland:)();
}

uint64_t sub_1000E57D0()
{
  return TimelineEntryRelevance.init(score:duration:)();
}

uint64_t sub_1000E57E0()
{
  return TimelineEntryRelevance.score.getter();
}

uint64_t sub_1000E57F0()
{
  return type metadata accessor for TimelineEntryRelevance();
}

uint64_t sub_1000E5800()
{
  return TimelineProviderContext.displaySize.getter();
}

uint64_t sub_1000E5810()
{
  return TimelineProviderContext.EnvironmentVariants.subscript.getter();
}

uint64_t sub_1000E5820()
{
  return type metadata accessor for TimelineProviderContext.EnvironmentVariants();
}

uint64_t sub_1000E5830()
{
  return TimelineProviderContext.environmentVariants.getter();
}

uint64_t sub_1000E5840()
{
  return TimelineProviderContext.family.getter();
}

uint64_t sub_1000E5850()
{
  return TimelineProviderContext.isPreview.getter();
}

uint64_t sub_1000E5860()
{
  return type metadata accessor for TimelineProviderContext();
}

uint64_t sub_1000E5870()
{
  return DynamicIslandExpandedRegion._viewRepresentation.getter();
}

uint64_t sub_1000E5880()
{
  return DynamicIslandExpandedRegion.init(_:priority:content:)();
}

uint64_t sub_1000E5890()
{
  return DynamicIslandExpandedContent.init(content:)();
}

uint64_t sub_1000E58A0()
{
  return DynamicIslandExpandedContent.content.getter();
}

uint64_t sub_1000E58B0()
{
  return static DynamicIslandExpandedRegionPosition.bottom.getter();
}

uint64_t sub_1000E58C0()
{
  return static DynamicIslandExpandedRegionPosition.center.getter();
}

uint64_t sub_1000E58D0()
{
  return static DynamicIslandExpandedRegionPosition.leading.getter();
}

uint64_t sub_1000E58E0()
{
  return static DynamicIslandExpandedRegionPosition.trailing.getter();
}

uint64_t sub_1000E58F0()
{
  return type metadata accessor for DynamicIslandExpandedRegionPosition();
}

uint64_t sub_1000E5900()
{
  return Timeline.init(entries:policy:)();
}

uint64_t sub_1000E5910()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E5920()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1000E5930()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_1000E5940()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t sub_1000E5950()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_1000E5960()
{
  return type metadata accessor for ClosedRange();
}

uint64_t sub_1000E5970()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_1000E5980()
{
  return type metadata accessor for String.IntentInputOptions();
}

uint64_t sub_1000E5990()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

void sub_1000E59A0(Swift::String a1)
{
}

void sub_1000E59B0(Swift::String a1)
{
}

uint64_t sub_1000E59C0()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000E59D0()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_1000E59E0()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t sub_1000E59F0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_1000E5A00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000E5A10()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E5A20()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000E5A30()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_1000E5A40()
{
  return String.init<A>(reflecting:)();
}

uint64_t sub_1000E5A50()
{
  return String.hash(into:)();
}

uint64_t sub_1000E5A60()
{
  return String.count.getter();
}

void sub_1000E5A70(Swift::String a1)
{
}

Swift::Int sub_1000E5A80()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000E5A90()
{
  return String.widthOfString(usingFont:)();
}

uint64_t sub_1000E5AA0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_1000E5AB0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000E5AC0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000E5AD0()
{
  return Array.description.getter();
}

uint64_t sub_1000E5AE0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000E5AF0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000E5B00()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000E5B10()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_1000E5B20()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_1000E5B30()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_1000E5B40()
{
  return dispatch thunk of Collection.distance(from:to:)();
}

uint64_t sub_1000E5B50()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_1000E5B60()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_1000E5B70()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_1000E5B80()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000E5B90()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000E5BA0()
{
  return ACAccountStore.activeAccount.getter();
}

uint64_t sub_1000E5BB0()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t sub_1000E5BC0()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_1000E5BD0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1000E5BE0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_1000E5BF0()
{
  return static UIContentSizeCategory.> infix(_:_:)();
}

UIImage sub_1000E5C00(Swift::String imageLiteralResourceName)
{
  return UIImage.init(imageLiteralResourceName:)(imageLiteralResourceName);
}

uint64_t sub_1000E5C10()
{
  return NSString.init(stringLiteral:)();
}

uint64_t sub_1000E5C20()
{
  return NSString.init(format:_:)();
}

uint64_t sub_1000E5C30()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_1000E5C40()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_1000E5C50()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000E5C60()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_1000E5C70()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_1000E5C80()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000E5CA0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000E5CB0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_1000E5CC0(Swift::Int a1)
{
}

uint64_t sub_1000E5CD0()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_1000E5CE0(Swift::Int a1)
{
}

uint64_t sub_1000E5CF0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000E5D00()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000E5D10()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000E5D20()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000E5D30()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000E5D40()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000E5D50()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_1000E5D60()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000E5D70()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000E5D80()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_1000E5D90()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_1000E5DA0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_1000E5DB0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000E5DC0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000E5DD0()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_1000E5DE0()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_1000E5DF0()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_1000E5E00()
{
  return Hasher.init(_seed:)();
}

void sub_1000E5E10(Swift::UInt a1)
{
}

Swift::Int sub_1000E5E20()
{
  return Hasher._finalize()();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CTFontHasExuberatedLineHeight()
{
  return _CTFontHasExuberatedLineHeight();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

void UIRectFill(CGRect rect)
{
}

uint64_t WLKIsRegulatedSKU()
{
  return _WLKIsRegulatedSKU();
}

uint64_t WLKRestrictionsMaximumEffectiveMovieRanking()
{
  return _WLKRestrictionsMaximumEffectiveMovieRanking();
}

uint64_t WLKRestrictionsMaximumEffectiveTVShowRanking()
{
  return _WLKRestrictionsMaximumEffectiveTVShowRanking();
}

uint64_t WLKSystemSettingsDebugOverride()
{
  return _WLKSystemSettingsDebugOverride();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCreateAndLaunchWithIdentifier()
{
  return __CTServerConnectionCreateAndLaunchWithIdentifier();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return __CTServerConnectionGetCellularDataIsEnabled();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _availability_version_check()
{
  return __availability_version_check();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
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

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return _swift_getTupleTypeMetadata3();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend__contentGroupWithContinuations_widgetSize_expiration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentGroupWithContinuations:widgetSize:expiration:");
}

id objc_msgSend__contentItemWithContinuation_mediaItem_widgetSize_itemPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentItemWithContinuation:mediaItem:widgetSize:itemPosition:");
}

id objc_msgSend__contentItemsWithContinuations_widgetSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentItemsWithContinuations:widgetSize:");
}

id objc_msgSend__processContinuationsDelta_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processContinuationsDelta:withCompletion:");
}

id objc_msgSend__punchoutURLForDirectPlayback_ignoreExtras_(void *a1, const char *a2, ...)
{
  return [a1 _punchoutURLForDirectPlayback:ignoreExtras:];
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return _[a1 adamID];
}

id objc_msgSend_add_toCollection_(void *a1, const char *a2, ...)
{
  return [a1 add:toCollection:];
}

id objc_msgSend_addFilterPredicate_(void *a1, const char *a2, ...)
{
  return [a1 addFilterPredicate:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return [a1 addOperation:];
}

id objc_msgSend_additions(void *a1, const char *a2, ...)
{
  return _[a1 additions];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_artworkSize(void *a1, const char *a2, ...)
{
  return _[a1 artworkSize];
}

id objc_msgSend_artworkURLFromTemplate_forSize_cropCode_format_(void *a1, const char *a2, ...)
{
  return [a1 artworkURLFromTemplate:forSize:cropCode:format:];
}

id objc_msgSend_artworkURLString(void *a1, const char *a2, ...)
{
  return _[a1 artworkURLString];
}

id objc_msgSend_artworkVariantOfType_(void *a1, const char *a2, ...)
{
  return [a1 artworkVariantOfType:];
}

id objc_msgSend_canonicalID(void *a1, const char *a2, ...)
{
  return _[a1 canonicalID];
}

id objc_msgSend_channelDetails(void *a1, const char *a2, ...)
{
  return _[a1 channelDetails];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:toDate:options:];
}

id objc_msgSend_consumePendingInvalidation(void *a1, const char *a2, ...)
{
  return _[a1 consumePendingInvalidation];
}

id objc_msgSend_contentRating(void *a1, const char *a2, ...)
{
  return _[a1 contentRating];
}

id objc_msgSend_contentTVAppDeeplinkURL(void *a1, const char *a2, ...)
{
  return _[a1 contentTVAppDeeplinkURL];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return _[a1 contentType];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextEnum(void *a1, const char *a2, ...)
{
  return _[a1 contextEnum];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cropCodeForContentType_(void *a1, const char *a2, ...)
{
  return [a1 cropCodeForContentType:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _[a1 day];
}

id objc_msgSend_delete_(void *a1, const char *a2, ...)
{
  return [a1 delete:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return [a1 earlierDate:];
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTime];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_episodeNumber(void *a1, const char *a2, ...)
{
  return _[a1 episodeNumber];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_externalID(void *a1, const char *a2, ...)
{
  return _[a1 externalID];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return _[a1 features];
}

id objc_msgSend_fetchConfigurationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchConfigurationWithCompletionHandler:];
}

id objc_msgSend_fetchRentals(void *a1, const char *a2, ...)
{
  return _[a1 fetchRentals];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_genres(void *a1, const char *a2, ...)
{
  return _[a1 genres];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _[a1 hour];
}

id objc_msgSend_images(void *a1, const char *a2, ...)
{
  return _[a1 images];
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithCalendarIdentifier:];
}

id objc_msgSend_initWithQueryParameters_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueryParameters:options:];
}

id objc_msgSend_initWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimeInterval:sinceDate:];
}

id objc_msgSend_isApSubscription(void *a1, const char *a2, ...)
{
  return _[a1 isApSubscription];
}

id objc_msgSend_isAppInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isAppInstalled];
}

id objc_msgSend_isEntitled(void *a1, const char *a2, ...)
{
  return _[a1 isEntitled];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isRental(void *a1, const char *a2, ...)
{
  return _[a1 isRental];
}

id objc_msgSend_isiTunes(void *a1, const char *a2, ...)
{
  return _[a1 isiTunes];
}

id objc_msgSend_itemCollection(void *a1, const char *a2, ...)
{
  return _[a1 itemCollection];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_leagueName(void *a1, const char *a2, ...)
{
  return _[a1 leagueName];
}

id objc_msgSend_leagueShortName(void *a1, const char *a2, ...)
{
  return _[a1 leagueShortName];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedContext(void *a1, const char *a2, ...)
{
  return _[a1 localizedContext];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithFormat:];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _[a1 minute];
}

id objc_msgSend_movieOrShowContent(void *a1, const char *a2, ...)
{
  return _[a1 movieOrShowContent];
}

id objc_msgSend_movieRentalsQuery(void *a1, const char *a2, ...)
{
  return _[a1 movieRentalsQuery];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_originalExpirationDate(void *a1, const char *a2, ...)
{
  return _[a1 originalExpirationDate];
}

id objc_msgSend_playEvent(void *a1, const char *a2, ...)
{
  return _[a1 playEvent];
}

id objc_msgSend_playPunchoutURL(void *a1, const char *a2, ...)
{
  return _[a1 playPunchoutURL];
}

id objc_msgSend_playable(void *a1, const char *a2, ...)
{
  return _[a1 playable];
}

id objc_msgSend_playbackURL(void *a1, const char *a2, ...)
{
  return _[a1 playbackURL];
}

id objc_msgSend_predicateMatchingPredicates_(void *a1, const char *a2, ...)
{
  return [a1 predicateMatchingPredicates:];
}

id objc_msgSend_predicateWithValue_forProperty_comparisonType_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithValue:forProperty:comparisonType:];
}

id objc_msgSend_ratingValue(void *a1, const char *a2, ...)
{
  return _[a1 ratingValue];
}

id objc_msgSend_read_(void *a1, const char *a2, ...)
{
  return [a1 read:];
}

id objc_msgSend_removals(void *a1, const char *a2, ...)
{
  return _[a1 removals];
}

id objc_msgSend_remove_fromCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remove:fromCollection:");
}

id objc_msgSend_resourceFetchType(void *a1, const char *a2, ...)
{
  return _[a1 resourceFetchType];
}

id objc_msgSend_seasonNumber(void *a1, const char *a2, ...)
{
  return _[a1 seasonNumber];
}

id objc_msgSend_setActionURL_(void *a1, const char *a2, ...)
{
  return [a1 setActionURL:];
}

id objc_msgSend_setBadgeRequiresTransparency_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeRequiresTransparency:];
}

id objc_msgSend_setBadgeURLTemplate_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeURLTemplate:];
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionBlock:];
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return [a1 setContext:];
}

id objc_msgSend_setCropCode_(void *a1, const char *a2, ...)
{
  return [a1 setCropCode:];
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return [a1 setExpirationDate:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setImageAspectRatio_(void *a1, const char *a2, ...)
{
  return [a1 setImageAspectRatio:];
}

id objc_msgSend_setImageURLTemplate_(void *a1, const char *a2, ...)
{
  return [a1 setImageURLTemplate:];
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return [a1 setItems:];
}

id objc_msgSend_setLiveEvent_(void *a1, const char *a2, ...)
{
  return [a1 setLiveEvent:];
}

id objc_msgSend_setNewEpisode_(void *a1, const char *a2, ...)
{
  return [a1 setNewEpisode:];
}

id objc_msgSend_setPlaybackPercentage_(void *a1, const char *a2, ...)
{
  return [a1 setPlaybackPercentage:];
}

id objc_msgSend_setRentalExpirationDate_(void *a1, const char *a2, ...)
{
  return [a1 setRentalExpirationDate:];
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitle:];
}

id objc_msgSend_setSubtitleComposed_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitleComposed:];
}

id objc_msgSend_setSubtitleShort_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitleShort];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shortTitle(void *a1, const char *a2, ...)
{
  return _[a1 shortTitle];
}

id objc_msgSend_showTitle(void *a1, const char *a2, ...)
{
  return _[a1 showTitle];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorWithKey:ascending:];
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 sortUsingDescriptors:];
}

id objc_msgSend_systemType(void *a1, const char *a2, ...)
{
  return _[a1 systemType];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_tvAppDeeplinkURL(void *a1, const char *a2, ...)
{
  return _[a1 tvAppDeeplinkURL];
}

id objc_msgSend_tvun_channelImageURLString_(void *a1, const char *a2, ...)
{
  return [a1 tvun_channelImageURLString];
}

id objc_msgSend_tvun_contextString(void *a1, const char *a2, ...)
{
  return [a1 tvun_contextString];
}

id objc_msgSend_tvun_defaultActionURL(void *a1, const char *a2, ...)
{
  return [a1 tvun_defaultActionURL];
}

id objc_msgSend_tvun_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 tvun_expirationDate];
}

id objc_msgSend_tvun_expirationString(void *a1, const char *a2, ...)
{
  return [a1 tvun_expirationString];
}

id objc_msgSend_tvun_isExpired(void *a1, const char *a2, ...)
{
  return [a1 tvun_isExpired];
}

id objc_msgSend_tvun_punchoutURL_(void *a1, const char *a2, ...)
{
  return [a1 tvun_punchoutURL];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_validRentalWithIdentifier_inRentals_(void *a1, const char *a2, ...)
{
  return [a1 validRentalWithIdentifier:inRentals:];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return [a1 valueForProperty:];
}

id objc_msgSend_wlkDefaultQueue(void *a1, const char *a2, ...)
{
  return _[a1 wlkDefaultQueue];
}

id objc_msgSend_wlk_BOOLForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return [a1 wlk_BOOLForKey:defaultValue:];
}