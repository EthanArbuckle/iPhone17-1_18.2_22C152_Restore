__n128 sub_100002978(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  long long v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100002984(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000029A4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_1000029E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v60 = a1;
  uint64_t v61 = sub_1000061EC(&qword_100032990);
  sub_100007DA8();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100007DEC();
  uint64_t v7 = v6 - v5;
  uint64_t v62 = sub_1000061EC(&qword_100032998);
  sub_100007DDC();
  __chkstk_darwin(v8);
  sub_100007DEC();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_1000061EC((uint64_t *)&unk_1000329A0);
  sub_100007DA8();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_100007DEC();
  uint64_t v18 = v17 - v16;
  v19 = *(void **)(v1 + 16);
  id v20 = [v19 allItems];
  sub_1000061EC(&qword_1000332D0);
  unint64_t v21 = sub_100020890();

  if (v21 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_100020AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v23 = swift_bridgeObjectRelease();
  if (v22 < 1)
  {
    v58[1] = v58;
    uint64_t v59 = v3;
    __chkstk_darwin(v23);
    v36 = *(void **)(v1 + 8);
    id v37 = [v36 localizedLabel];
    uint64_t v38 = sub_1000207E0();
    unint64_t v40 = v39;

    swift_bridgeObjectRelease();
    uint64_t v41 = HIBYTE(v40) & 0xF;
    if ((v40 & 0x2000000000000000) == 0) {
      uint64_t v41 = v38 & 0xFFFFFFFFFFFFLL;
    }
    if (v41)
    {
      id v42 = [v36 localizedLabel];
      uint64_t v43 = sub_1000207E0();
      uint64_t v45 = v44;

      *(void *)&long long v67 = v43;
      *((void *)&v67 + 1) = v45;
      sub_100006238();
      uint64_t v46 = sub_100020540();
      uint64_t v41 = v49 & 1;
    }
    else
    {
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
    }
    uint64_t v50 = v61;
    *(void *)&long long v67 = v46;
    *((void *)&v67 + 1) = v47;
    uint64_t v68 = v41;
    uint64_t v69 = v48;
    uint64_t v51 = sub_10000ED24(v36);
    if (v52)
    {
      uint64_t v63 = v51;
      uint64_t v64 = v52;
      sub_100006238();
      uint64_t v53 = sub_100020540();
      uint64_t v56 = v55 & 1;
    }
    else
    {
      uint64_t v53 = 0;
      uint64_t v56 = 0;
      uint64_t v54 = 0;
    }
    uint64_t v63 = v53;
    uint64_t v64 = v52;
    uint64_t v65 = v56;
    uint64_t v66 = v54;
    sub_1000061EC(&qword_100032E70);
    sub_1000061EC(&qword_1000329C0);
    sub_100006284();
    sub_100007D3C((uint64_t)&unk_1000329D0);
    sub_100020720();
    uint64_t v57 = v59;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 16))(v11, v7, v50);
    swift_storeEnumTagMultiPayload();
    sub_1000065E0((uint64_t)&unk_1000329D8);
    sub_1000066F0();
    sub_100020470();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 8))(v7, v50);
  }
  else
  {
    id v24 = [v19 sections];
    sub_1000061EC(&qword_100032A88);
    unint64_t v25 = sub_100020890();

    uint64_t v26 = sub_100006960(v25);
    swift_bridgeObjectRelease();
    uint64_t v63 = v26;
    swift_getKeyPath();
    v27 = *(void **)v1;
    v28 = *(void **)(v1 + 8);
    long long v67 = *(_OWORD *)(v1 + 24);
    uint64_t v29 = swift_allocObject();
    long long v30 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v29 + 16) = *(_OWORD *)v1;
    *(_OWORD *)(v29 + 32) = v30;
    *(void *)(v29 + 48) = *(void *)(v1 + 32);
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = sub_100006B40;
    *(void *)(v31 + 24) = v29;
    id v32 = v27;
    id v33 = v28;
    id v34 = v19;
    sub_100006BB0((uint64_t)&v67);
    sub_1000061EC(&qword_100032A90);
    sub_1000061EC(&qword_1000329E8);
    sub_100007D3C((uint64_t)&unk_100032A98);
    sub_100007D3C((uint64_t)&unk_100032AA0);
    sub_100006338();
    sub_100020710();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v11, v18, v12);
    swift_storeEnumTagMultiPayload();
    sub_1000065E0((uint64_t)&unk_1000329D8);
    sub_1000066F0();
    sub_100020470();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v18, v12);
  }
}

uint64_t sub_100003030@<X0>(uint64_t a1@<X0>, void **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1000061EC(&qword_100032AA8);
  __chkstk_darwin(v6 - 8);
  uint64_t v47 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_1000061EC(&qword_1000329F8);
  __chkstk_darwin(v45);
  uint64_t v46 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000061EC(&qword_100032A08);
  uint64_t v48 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v50 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_100020410();
  uint64_t v11 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [a2[2] sections];
  sub_1000061EC(&qword_100032A88);
  unint64_t v15 = sub_100020890();

  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100020AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v18 = v16 - 1;
  if (__OFSUB__(v16, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v43 = a3;
    uint64_t v49 = v9;
    id v42 = v13;
    if (v18 == a1) {
      uint64_t v19 = sub_100020400();
    }
    else {
      uint64_t v19 = sub_1000203F0();
    }
    __chkstk_darwin(v19);
    sub_100003BB4(a1, (uint64_t)a2, v61);
    sub_100003CAC(v18 == a1, a2, (uint64_t)&v51);
    long long v41 = v51;
    uint64_t v20 = v52;
    uint64_t v21 = v53;
    char v22 = v54;
    char v23 = sub_1000204B0();
    sub_100020240();
    long long v51 = v41;
    uint64_t v52 = v20;
    uint64_t v53 = v21;
    char v54 = v22;
    char v55 = v23;
    uint64_t v56 = v24;
    uint64_t v57 = v25;
    uint64_t v58 = v26;
    uint64_t v59 = v27;
    char v60 = 0;
    sub_1000061EC(&qword_100032E70);
    sub_1000061EC(&qword_100032A18);
    sub_1000061EC(&qword_100032A28);
    sub_100006284();
    sub_100007D3C((uint64_t)&unk_100032A10);
    sub_10000652C();
    v28 = v50;
    sub_100020720();
    uint64_t v29 = (uint64_t)v46;
    uint64_t v30 = (uint64_t)&v46[*(int *)(v45 + 36)];
    uint64_t v31 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 16);
    id v32 = v42;
    uint64_t v33 = v44;
    v31(v30, v42, v44);
    sub_100006BE4(v30, 0, 1, v33);
    uint64_t v34 = v48;
    (*(void (**)(uint64_t, char *, uint64_t))(v48 + 16))(v29, v28, v49);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v36 = (uint64_t)v47;
    v31((uint64_t)v47, v32, v33);
    sub_100006BE4(v36, 0, 1, v33);
    uint64_t v37 = sub_1000061EC(&qword_1000329E8);
    uint64_t v38 = v43;
    unint64_t v39 = (uint64_t *)(v43 + *(int *)(v37 + 36));
    uint64_t v40 = sub_1000061EC(&qword_100032A78);
    sub_100006C0C(v36, (uint64_t)v39 + *(int *)(v40 + 28), &qword_100032AA8);
    *unint64_t v39 = KeyPath;
    sub_100006C0C(v29, v38, &qword_1000329F8);
    sub_100007CAC(v36, &qword_100032AA8);
    sub_100007CAC(v29, &qword_1000329F8);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v50, v49);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v32, v33);
  }
  return result;
}

uint64_t sub_100003578@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_1000061EC(&qword_100032AB0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v59 - v11;
  uint64_t v13 = *(void **)(a1 + 16);
  id v14 = [v13 sections];
  sub_1000061EC(&qword_100032A88);
  unint64_t v15 = sub_100020890();

  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100020AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  uint64_t v69 = v7;
  uint64_t v70 = v6;
  id v67 = v13;
  uint64_t v68 = v10;
  uint64_t v66 = a3;
  if (v16 >= 2)
  {
    uint64_t v64 = a2;
    id v17 = [a2 title];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = sub_1000207E0();
      unint64_t v21 = v20;

      uint64_t v22 = HIBYTE(v21) & 0xF;
      if ((v21 & 0x2000000000000000) == 0) {
        uint64_t v22 = v19 & 0xFFFFFFFFFFFFLL;
      }
      if (v22)
      {
        *(void *)&long long v73 = v19;
        *((void *)&v73 + 1) = v21;
        sub_100006238();
        uint64_t v23 = sub_100020540();
        uint64_t v25 = v24;
        char v27 = v26 & 1;
        sub_1000204D0();
        uint64_t v28 = sub_100020510();
        uint64_t v30 = v29;
        char v32 = v31 & 1;
        sub_100006DC0(v23, v25, v27);
        swift_bridgeObjectRelease();
        sub_100020610();
        uint64_t v33 = sub_100020520();
        uint64_t v62 = v34;
        uint64_t v63 = v33;
        LOBYTE(v25) = v35;
        uint64_t v61 = v36;
        swift_release();
        uint64_t v37 = v25 & 1;
        sub_100006DC0(v28, v30, v32);
        swift_bridgeObjectRelease();
        uint64_t v60 = sub_100020420();
        v71 = sub_100003A8C;
LABEL_12:
        a2 = v64;
        goto LABEL_13;
      }
      swift_bridgeObjectRelease();
    }
    uint64_t v62 = 0;
    uint64_t v63 = 0;
    uint64_t v37 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    v71 = 0;
    goto LABEL_12;
  }
  uint64_t v62 = 0;
  uint64_t v63 = 0;
  uint64_t v37 = 0;
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  v71 = 0;
LABEL_13:
  uint64_t v64 = (void *)v37;
  id v38 = [a2 items];
  sub_1000061EC(&qword_1000332D0);
  uint64_t v39 = sub_100020890();

  uint64_t v72 = v39;
  swift_getKeyPath();
  uint64_t v40 = *(void **)a1;
  long long v41 = *(void **)(a1 + 8);
  long long v73 = *(_OWORD *)(a1 + 24);
  uint64_t v42 = swift_allocObject();
  long long v43 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v42 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v42 + 32) = v43;
  *(void *)(v42 + 48) = *(void *)(a1 + 32);
  id v44 = v40;
  id v45 = v41;
  id v46 = v67;
  sub_100006BB0((uint64_t)&v73);
  sub_1000061EC(&qword_100032AB8);
  sub_100007D3C((uint64_t)&unk_100032AC0);
  sub_100007D3C((uint64_t)&unk_100032AC8);
  sub_100006CC4();
  uint64_t v65 = v12;
  sub_100020710();
  uint64_t v48 = v68;
  uint64_t v47 = v69;
  uint64_t v49 = *(void (**)(char *, char *, uint64_t))(v69 + 16);
  uint64_t v50 = v70;
  v49(v68, v12, v70);
  uint64_t v51 = v62;
  uint64_t v52 = v63;
  uint64_t v53 = v66;
  *uint64_t v66 = v63;
  v53[1] = v51;
  v53[2] = v37;
  uint64_t v55 = v60;
  uint64_t v54 = v61;
  v53[3] = v61;
  v53[4] = v55;
  v53[5] = (uint64_t)v71;
  v53[6] = 0;
  uint64_t v56 = sub_1000061EC(&qword_100032AD8);
  v49((char *)v53 + *(int *)(v56 + 48), v48, v50);
  LOBYTE(v49) = (_BYTE)v64;
  sub_100006D10(v52, v51, (char)v64, v54);
  uint64_t v57 = *(void (**)(char *, uint64_t))(v47 + 8);
  v57(v65, v50);
  v57(v48, v50);
  return sub_100006D70(v52, v51, (char)v49, v54);
}

double sub_100003A8C()
{
  sub_100020440();
  sub_1000202C0();
  return v0 + -20.0;
}

uint64_t sub_100003ABC@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void **)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  long long v14 = *(_OWORD *)(a2 + 24);
  id v7 = v5;
  id v8 = v6;
  id v9 = v4;
  sub_100006BB0((uint64_t)&v14);
  sub_100020670();
  sub_1000200A0();
  sub_1000077F8((uint64_t)&unk_100032AE0);
  uint64_t result = sub_1000202A0();
  *(void *)a3 = v7;
  *(void *)(a3 + 8) = v8;
  *(void *)(a3 + 16) = v9;
  *(void *)(a3 + 24) = result;
  *(void *)(a3 + 32) = v11;
  *(unsigned char *)(a3 + 40) = v12;
  *(void *)(a3 + 48) = v13;
  return result;
}

uint64_t sub_100003BB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (a1)
  {
    uint64_t result = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    id v8 = *(void **)(a2 + 8);
    id v9 = [v8 localizedLabel];
    uint64_t v10 = sub_1000207E0();
    unint64_t v12 = v11;

    swift_bridgeObjectRelease();
    uint64_t v6 = HIBYTE(v12) & 0xF;
    if ((v12 & 0x2000000000000000) == 0) {
      uint64_t v6 = v10 & 0xFFFFFFFFFFFFLL;
    }
    if (v6)
    {
      id v13 = [v8 localizedLabel];
      sub_1000207E0();

      sub_100006238();
      uint64_t result = sub_100020540();
      uint64_t v6 = v14 & 1;
      goto LABEL_8;
    }
    uint64_t result = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = 0;
LABEL_8:
  *a3 = result;
  a3[1] = v5;
  a3[2] = v6;
  a3[3] = v7;
  return result;
}

uint64_t sub_100003CAC@<X0>(uint64_t result@<X0>, void **a2@<X1>, uint64_t a3@<X8>)
{
  if ((result & 1) != 0 && ((uint64_t result = sub_10000DAC4(*a2), v5) || (uint64_t result = sub_10000ED24(a2[1]), v5)))
  {
    uint64_t v11 = result;
    uint64_t v12 = v5;
    sub_100006238();
    sub_100020540();
    uint64_t result = sub_100020470();
    uint64_t v6 = v11;
    uint64_t v7 = v12;
    uint64_t v8 = v13;
    uint64_t v9 = v14;
    char v10 = v15;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    char v10 = -1;
  }
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v7;
  *(void *)(a3 + 16) = v8;
  *(void *)(a3 + 24) = v9;
  *(unsigned char *)(a3 + 32) = v10;
  return result;
}

uint64_t sub_100003DB8()
{
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000061EC(&qword_100032C00);
  sub_100007B8C();
  sub_100020470();
  return v1;
}

uint64_t sub_100003E4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = sub_1000203E0();
  sub_100020800();
  sub_100020800();
  if (qword_100032848 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)static NSBundle._current;
  NSString v3 = sub_1000207D0();
  NSString v4 = sub_1000207D0();
  swift_bridgeObjectRelease();
  NSString v5 = sub_1000207D0();
  swift_bridgeObjectRelease();
  id v6 = [v2 localizedStringForKey:v3 value:v4 table:v5];

  uint64_t v7 = sub_1000207E0();
  LOBYTE(v4) = v8;

  uint64_t v28 = v7;
  char v29 = (char)v4;
  sub_100006238();
  uint64_t v9 = sub_100020540();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_1000204F0();
  uint64_t v14 = sub_100020530();
  uint64_t v16 = v15;
  char v18 = v17;
  swift_release();
  LOBYTE(v2) = v18 & 1;
  sub_100006DC0(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_100020610();
  uint64_t v19 = sub_100020520();
  uint64_t v21 = v20;
  char v23 = v22;
  uint64_t v25 = v24;
  swift_release();
  sub_100006DC0(v14, v16, (char)v2);
  swift_bridgeObjectRelease();
  sub_100020760();
  sub_100020280();
  sub_100006D60(v19, v21, v23 & 1);
  swift_bridgeObjectRetain();
  sub_100006DC0(v19, v21, v23 & 1);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v27;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v19;
  *(void *)(a1 + 32) = v21;
  *(unsigned char *)(a1 + 40) = v23 & 1;
  *(void *)(a1 + 48) = v25;
  *(void *)(a1 + 56) = v28;
  *(unsigned char *)(a1 + 64) = v29;
  *(void *)(a1 + 72) = v30;
  *(unsigned char *)(a1 + 80) = v31;
  *(void *)(a1 + 88) = v32;
  *(void *)(a1 + 96) = v33;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = 1;
  return result;
}

uint64_t sub_100004104()
{
  return sub_1000205A0();
}

uint64_t sub_100004120@<X0>(uint64_t a1@<X8>)
{
  return sub_1000029E4(a1);
}

uint64_t sub_10000415C()
{
  uint64_t v1 = sub_1000203E0();
  sub_100004354(v0, __src);
  v7[168] = 1;
  memcpy(&v7[7], __src, 0xA0uLL);
  sub_100004AF4();
  uint64_t v2 = swift_allocObject();
  long long v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(v0 + 32);
  *(void *)(v2 + 64) = *(void *)(v0 + 48);
  v5[0] = v1;
  v5[1] = 0;
  LOBYTE(v5[2]) = 1;
  memcpy((char *)&v5[2] + 1, v7, 0xA7uLL);
  sub_1000071DC(v0);
  sub_10000731C((uint64_t)__src, (uint64_t)sub_100007238, (void (*)(uint64_t))sub_1000072D8);
  sub_1000061EC(&qword_100032B00);
  sub_100007D3C((uint64_t)&unk_100032B08);
  sub_1000206A0();
  sub_10000731C((uint64_t)__src, (uint64_t)sub_1000073A0, (void (*)(uint64_t))sub_100007454);
  memcpy(__dst, v5, sizeof(__dst));
  return sub_100007498((uint64_t)__dst, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000073A0, (void (*)(uint64_t))sub_100007454);
}

uint64_t sub_100004354@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_10000453C((uint64_t)__src);
  sub_100007AB4((uint64_t)__src, (uint64_t)v25, &qword_100032BC8);
  id v4 = objc_msgSend(*(id *)(a1 + 8), "wf_pickerLocalizedTitleForState:", *(void *)(a1 + 16));
  if (v4)
  {
    uint64_t v5 = sub_1000207E0();
    uint64_t v7 = v6;

    __src[0] = v5;
    __src[1] = v7;
    sub_100006238();
    uint64_t v8 = sub_100020540();
    uint64_t v10 = v9;
    char v12 = v11 & 1;
    sub_100020600();
    id v4 = (id)sub_100020520();
    uint64_t v14 = v13;
    char v16 = v15;
    uint64_t v18 = v17;
    swift_release();
    uint64_t v19 = v16 & 1;
    sub_100006DC0(v8, v10, v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v19 = 0;
    uint64_t v18 = 0;
  }
  sub_100007AB4((uint64_t)v25, (uint64_t)v21, &qword_100032BC8);
  sub_100007AB4((uint64_t)v21, (uint64_t)v22, &qword_100032BC8);
  sub_100007AB4((uint64_t)v22, (uint64_t)__src, &qword_100032BC8);
  __src[16] = v4;
  __src[17] = v14;
  __src[18] = v19;
  __src[19] = v18;
  memcpy(a2, __src, 0xA0uLL);
  sub_100007A2C((uint64_t)v22);
  sub_1000072D8((uint64_t)v4, v14, v19, v18);
  sub_100007454((uint64_t)v4, v14, v19, v18);
  sub_100007AB4((uint64_t)v21, (uint64_t)v24, &qword_100032BC8);
  return sub_100007A2C((uint64_t)v24);
}

uint64_t sub_10000453C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100020630();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v31[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v7 = sub_1000061EC(&qword_100032BD0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (sub_10000567C()
    || (id v10 = objc_msgSend(*(id *)(v1 + 8), "wf_pickerLocalizedImageForState:", *(void *)(v1 + 16))) == 0)
  {
    sub_100007A84((uint64_t)v32);
    uint64_t v25 = v32;
  }
  else
  {
    char v11 = v10;
    if ([v10 representationType] == (id)4)
    {
      id v12 = [v11 tintColor];
      uint64_t v13 = sub_100020990();
      if (v12)
      {
        uint64_t v14 = enum case for Image.TemplateRenderingMode.template(_:);
        uint64_t v15 = sub_100020650();
        (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v9, v14, v15);
        sub_100006BE4((uint64_t)v9, 0, 1, v15);
        sub_100020640();
        swift_release();
        sub_100007CAC((uint64_t)v9, &qword_100032BD0);
        id v16 = v12;
        sub_1000205E0();
        swift_getKeyPath();
        uint64_t v30 = a1;
        swift_retain();
        swift_retain();
        uint64_t v17 = sub_100003DB8();
        uint64_t v19 = v18;
        uint64_t v21 = v20;
        char v23 = v22;
        swift_release();
        a1 = v30;
        swift_release_n();
        swift_release_n();

        char v24 = v23 & 1;
      }
      else
      {
        v32[1] = 0;
        v32[2] = 0;
        v32[0] = v13;
        LOBYTE(v32[3]) = 1;
        sub_1000061EC(&qword_100032C00);
        sub_100007B8C();
        sub_100020470();
        uint64_t v17 = v33;
        uint64_t v19 = v34;
        uint64_t v21 = v35;
        char v24 = v36;
      }
      uint64_t v33 = v17;
      uint64_t v34 = v19;
      uint64_t v35 = v21;
      LOBYTE(v36) = v24;
      sub_100007CA4((uint64_t)&v33);
      sub_100007AB4((uint64_t)&v33, (uint64_t)v32, &qword_100032BD8);
      sub_100007288(v17, v19, v21, v24);
      sub_100007288(v17, v19, v21, v24);
      sub_1000061EC(&qword_100032BE0);
      sub_1000061EC(&qword_100032BE8);
      sub_100007B10();
      sub_100007C2C();
      sub_100020470();

      sub_1000073F0(v17, v19, v21, v24);
      sub_1000073F0(v17, v19, v21, v24);
    }
    else
    {
      sub_100020990();
      (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for Image.ResizingMode.stretch(_:), v3);
      uint64_t v26 = sub_100020660();
      swift_release();
      (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t v27 = sub_100020750();
      sub_100007E1C(0.0, 1, 0.0, 1, 30.0, 0, 0.0, 1, &v33, 0.0, 1, 30.0, 0, v27, v28, v26);
      swift_release();
      sub_100007AA8((uint64_t)&v33);
      sub_100007AB4((uint64_t)&v33, (uint64_t)v32, &qword_100032BD8);
      swift_retain_n();
      sub_1000061EC(&qword_100032BE0);
      sub_1000061EC(&qword_100032BE8);
      sub_100007B10();
      sub_100007C2C();
      sub_100020470();
      swift_release_n();
    }
    memcpy(v32, v31, 0x79uLL);
    memcpy(v31, v32, 0x79uLL);
    nullsub_1(v31);
    uint64_t v25 = v31;
  }
  sub_100007AB4((uint64_t)v25, (uint64_t)&v33, &qword_100032BC8);
  return sub_100007AB4((uint64_t)&v33, a1, &qword_100032BC8);
}

uint64_t sub_100004AF4()
{
  uint64_t v1 = v0;
  long long v13 = *(_OWORD *)(v0 + 24);
  swift_retain();
  uint64_t v2 = (void *)sub_100020070();
  sub_1000078F8((uint64_t)&v13);
  if (!v2) {
    goto LABEL_9;
  }
  if (![*(id *)(v0 + 8) allowsMultipleValues]
    || (self, (uint64_t v3 = swift_dynamicCastObjCClass()) == 0))
  {
    unsigned __int8 v10 = sub_100007980(v2, *(void *)(v0 + 16));
    swift_unknownObjectRelease();
    return v10 & 1;
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(v1 + 16);
  swift_unknownObjectRetain();
  uint64_t v6 = sub_1000068FC(v4);
  if (!v6)
  {
    swift_unknownObjectRelease_n();
    goto LABEL_9;
  }
  unint64_t v7 = v6;
  __chkstk_darwin(v6);
  v12[2] = v5;
  sub_100005D7C((uint64_t (*)(uint64_t *))sub_100007D7C, (uint64_t)v12, v7);
  char v9 = v8;
  swift_unknownObjectRelease_n();
  swift_bridgeObjectRelease();
  if (v9)
  {
LABEL_9:
    unsigned __int8 v10 = 0;
    return v10 & 1;
  }
  unsigned __int8 v10 = 1;
  return v10 & 1;
}

uint64_t sub_100004C3C()
{
  uint64_t v1 = v0;
  unsigned int v2 = [*(id *)(v0 + 8) allowsMultipleValues];
  uint64_t v3 = (long long *)(v0 + 24);
  if (!v2)
  {
    long long v22 = *v3;
    uint64_t v14 = *(void **)(v0 + 16);
    sub_100006BB0((uint64_t)&v22);
    id v15 = v14;
LABEL_12:
    sub_100020080();
    return sub_1000078F8((uint64_t)&v22);
  }
  long long v22 = *v3;
  swift_retain();
  uint64_t v4 = sub_100020070();
  sub_1000078F8((uint64_t)&v22);
  if (!v4)
  {
LABEL_11:
    sub_100007924(0, (unint64_t *)&unk_100032B50);
    sub_1000061EC(&qword_100033710);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_1000225D0;
    uint64_t v18 = *(void **)(v0 + 16);
    *(void *)(v17 + 32) = v18;
    v21[5] = v17;
    sub_1000208B0();
    sub_100006BB0((uint64_t)&v22);
    id v19 = v18;
    sub_100005C4C();
    goto LABEL_12;
  }
  self;
  uint64_t v5 = (void *)swift_dynamicCastObjCClass();
  if (!v5)
  {
    swift_unknownObjectRelease();
    goto LABEL_11;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = sub_1000068FC(v5);
  if (!v8
    || (unint64_t v9 = v8,
        __chkstk_darwin(v8),
        v21[2] = v7,
        uint64_t v10 = sub_100005D7C((uint64_t (*)(uint64_t *))sub_100007960, (uint64_t)v21, v9),
        char v12 = v11,
        swift_bridgeObjectRelease(),
        (v12 & 1) != 0))
  {
    swift_retain();
    id v13 = [v6 stateByAppendingValue:v7];
  }
  else
  {
    swift_retain();
    id v13 = [v6 stateByRemovingValueAtIndex:v10];
  }
  id v16 = v13;
  sub_100020080();
  swift_unknownObjectRelease();
  return sub_1000078F8((uint64_t)&v22);
}

void *sub_100004E64@<X0>(uint64_t a1@<X0>, char a2@<W1>, const void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_1000203E0();
  sub_100004EFC(a1, a2, a3, __src);
  memcpy(&v11[7], __src, 0xF9uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = 0x4028000000000000;
  *(unsigned char *)(a4 + 16) = 0;
  return memcpy((void *)(a4 + 17), v11, 0x100uLL);
}

void *sub_100004EFC@<X0>(uint64_t a1@<X0>, char a2@<W1>, const void *a3@<X2>, void *a4@<X8>)
{
  char v24 = a4;
  uint64_t v7 = sub_1000061EC(&qword_100032B10);
  __chkstk_darwin(v7 - 8);
  unint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([*(id *)(a1 + 8) allowsMultipleValues])
  {
    uint64_t v10 = sub_100020620();
    uint64_t v11 = sub_1000204C0();
    sub_100006BE4((uint64_t)v9, 1, 1, v11);
    char v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int8))sub_1000204E0();
    sub_100007CAC((uint64_t)v9, &qword_100032B10);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v14 = sub_1000055C4();
    uint64_t v15 = swift_getKeyPath();
    memcpy(v29, a3, sizeof(v29));
    uint64_t v16 = sub_100020420();
    memcpy(v25, v29, 0xB8uLL);
    v25[23] = v16;
    v25[24] = sub_100005654;
    v25[25] = 0;
    memcpy(v31, v25, 0xD0uLL);
    memcpy(v26, v25, sizeof(v26));
    memcpy(v30, v25, 0xD0uLL);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1000076B0((uint64_t)v26);
    sub_100007498((uint64_t)v29, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100007238, (void (*)(uint64_t))sub_1000072D8);
    swift_retain();
    swift_retain();
    char v23 = v12;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1000076B0((uint64_t)v25);
    sub_100007750((uint64_t)v31);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v32[0] = v10;
    v32[1] = KeyPath;
    v32[2] = v12;
    v32[3] = v15;
    v32[4] = v14;
    memcpy(&v32[5], v30, 0xD0uLL);
    sub_1000077F0((uint64_t)v32);
    sub_100007AB4((uint64_t)v32, (uint64_t)v33, &qword_100032B18);
    sub_1000061EC(&qword_100032B20);
    sub_1000061EC(&qword_100032B28);
    sub_100007D3C((uint64_t)&unk_100032B30);
    sub_100007D3C((uint64_t)&unk_100032B38);
    sub_100020470();
    sub_100007750((uint64_t)v25);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    memcpy(v26, a3, 0xB8uLL);
    sub_100007498((uint64_t)v26, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100007238, (void (*)(uint64_t))sub_1000072D8);
    if (a2)
    {
      uint64_t v17 = sub_100020620();
      uint64_t v18 = sub_1000205D0();
      uint64_t v19 = swift_getKeyPath();
      uint64_t v20 = 1;
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v17 = 0;
      uint64_t v19 = 0;
      uint64_t v18 = 0;
    }
    memcpy(v27, v26, sizeof(v27));
    memcpy(v29, v26, sizeof(v29));
    memcpy(v30, v26, 0xB8uLL);
    v30[23] = 0;
    v30[24] = v20;
    v30[25] = v17;
    v30[26] = v19;
    v30[27] = v18;
    memcpy(v31, v30, sizeof(v31));
    sub_100007498((uint64_t)v26, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100007238, (void (*)(uint64_t))sub_1000072D8);
    sub_100007498((uint64_t)v29, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100007238, (void (*)(uint64_t))sub_1000072D8);
    sub_100007530(0, v20, v17);
    sub_100007530(0, v20, v17);
    sub_100007580(0, v20, v17);
    memcpy(v25, v27, 0xB8uLL);
    char v23 = sub_1000073A0;
    long long v22 = (void (*)(uint64_t))sub_100007454;
    sub_100007498((uint64_t)v25, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1000073A0, (void (*)(uint64_t))sub_100007454);
    memcpy(v32, v31, 0xE0uLL);
    sub_1000075D0((uint64_t)v32);
    sub_100007AB4((uint64_t)v32, (uint64_t)v33, &qword_100032B18);
    sub_1000075DC(v31, (uint64_t)sub_100007238, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000072D8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100007530);
    sub_1000061EC(&qword_100032B20);
    sub_1000061EC(&qword_100032B28);
    sub_100007D3C((uint64_t)&unk_100032B30);
    sub_100007D3C((uint64_t)&unk_100032B38);
    sub_100020470();
    sub_100007580(0, v20, v17);
    sub_1000075DC(v30, (uint64_t)sub_1000073A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100007454, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100007580);
    sub_100007498((uint64_t)v26, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))v23, v22);
  }
  memcpy(v33, v28, 0xF9uLL);
  return memcpy(v24, v33, 0xF9uLL);
}

uint64_t sub_1000055C4()
{
  if (!sub_10000567C()) {
    return 0;
  }
  id v1 = objc_msgSend(*(id *)(v0 + 8), "wf_pickerLocalizedImageForState:", *(void *)(v0 + 16));
  if (!v1) {
    return 0;
  }
  unsigned int v2 = v1;
  if ([v1 representationType] != (id)4
    || ![v2 tintColor])
  {

    return 0;
  }
  uint64_t v3 = sub_1000205E0();

  return v3;
}

uint64_t sub_100005654()
{
  return sub_1000202C0();
}

BOOL sub_10000567C()
{
  id v1 = *(void **)v0;
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (void *)v2;
  id v4 = v1;
  id v5 = [v3 metadata];
  id v6 = [v5 effectiveBundleIdentifiers];

  LOBYTE(v5) = sub_100005988(v6);
  if ((v5 & 1) == 0
    || (uint64_t v7 = *(void **)(v0 + 8), self, (v8 = swift_dynamicCastObjCClass()) == 0))
  {
    id v10 = v4;
LABEL_12:

    return 0;
  }
  unint64_t v9 = (void *)v8;
  id v10 = v7;
  id v11 = [v9 parameterMetadata];
  id v12 = [v11 valueType];

  id v13 = objc_msgSend(v12, "wf_entityValueType");
  if (!v13)
  {

    goto LABEL_12;
  }
  id v14 = [v13 identifier];
  uint64_t v15 = sub_1000207E0();
  uint64_t v17 = v16;

  if (v15 != 0x7261646E656C6143 || v17 != 0xEE00797469746E45)
  {
    char v19 = sub_100020B30();
    swift_bridgeObjectRelease();

    return (v19 & 1) != 0;
  }
  swift_bridgeObjectRelease();

  return 1;
}

uint64_t sub_1000058A0()
{
  sub_1000207E0();
  uint64_t v0 = sub_100005908();
  uint64_t v2 = v1;
  uint64_t result = swift_bridgeObjectRelease();
  qword_100032838 = v0;
  unk_100032840 = v2;
  return result;
}

uint64_t sub_100005908()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_100020860();
  sub_100020820();
  return v1;
}

uint64_t sub_100005988(void *a1)
{
  uint64_t v2 = sub_100020020();
  uint64_t v19 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = a1;
  sub_100020930();

  unint64_t v6 = sub_1000077F8((uint64_t)&unk_100032B40);
  sub_1000209C0();
  if (v24)
  {
    uint64_t v7 = (unint64_t *)&unk_100032B48;
    uint64_t v8 = LNEffectiveBundleIdentifier_ptr;
    uint64_t v20 = (char *)&type metadata for Any + 8;
    do
    {
      sub_10000783C(&v23, v22);
      sub_10000784C((uint64_t)v22, (uint64_t)v21);
      sub_100007924(0, v7);
      if (swift_dynamicCast())
      {
        unint64_t v9 = v6;
        id v10 = v4;
        uint64_t v11 = v2;
        id v12 = v8;
        id v13 = v7;
        id v14 = v25;
        id v15 = [v25 bundleIdentifier];
        sub_1000207E0();

        if (qword_100032830 != -1) {
          swift_once();
        }
        BOOL v16 = sub_100020850((Swift::String)xmmword_100032838);

        swift_bridgeObjectRelease();
        sub_1000078A8((uint64_t)v22);
        uint64_t v7 = v13;
        uint64_t v8 = v12;
        uint64_t v2 = v11;
        id v4 = v10;
        unint64_t v6 = v9;
        if (v16)
        {
          (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v2);
          return 1;
        }
      }
      else
      {
        sub_1000078A8((uint64_t)v22);
      }
      sub_1000209C0();
    }
    while (v24);
  }
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v2);
  return 0;
}

id sub_100005C4C()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_1000061EC(&qword_100032BC0);
  Class isa = sub_100020880().super.isa;
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithParameterStates:isa];

  return v2;
}

uint64_t sub_100005CC8()
{
  return sub_10000415C();
}

id sub_100005D0C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  self;
  id v4 = (void *)swift_dynamicCastObjCClass();
  if (v4) {
    return [v4 stateIsEquivalent:v3];
  }
  else {
    return [a2 isEqual:v3];
  }
}

uint64_t sub_100005D7C(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100020AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = sub_100020A30();
      }
      else
      {
        uint64_t v8 = *(void *)(a3 + 8 * v7 + 32);
        swift_unknownObjectRetain();
      }
      uint64_t v12 = v8;
      char v9 = a1(&v12);
      swift_unknownObjectRelease();
      if (v3 || (v9 & 1) != 0) {
        break;
      }
      uint64_t v10 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
        goto LABEL_14;
      }
      ++v7;
      if (v10 == v6) {
        return 0;
      }
    }
  }
  return v7;
}

__n128 sub_100005E9C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005EA8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100005EC8(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_100005F18(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for OptionsPickerView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for OptionsPickerView(id *a1)
{
  return swift_release();
}

void *initializeWithCopy for OptionsPickerView(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = v6;
  a1[3] = v5;
  a1[4] = *(void *)(a2 + 32);
  id v7 = v3;
  id v8 = v4;
  id v9 = v6;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for OptionsPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a2 + 16);
  uint64_t v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for OptionsPickerView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for OptionsPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for OptionsPickerView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 40))
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

uint64_t storeEnumTagSinglePayload for OptionsPickerView(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OptionsPickerView()
{
  return &type metadata for OptionsPickerView;
}

uint64_t sub_1000061D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000061EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006230@<X0>(uint64_t a1@<X8>)
{
  return sub_100003E4C(a1);
}

unint64_t sub_100006238()
{
  unint64_t result = qword_1000329B0;
  if (!qword_1000329B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000329B0);
  }
  return result;
}

unint64_t sub_100006284()
{
  unint64_t result = qword_1000329C8;
  if (!qword_1000329C8)
  {
    sub_1000062F0(&qword_100032E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000329C8);
  }
  return result;
}

uint64_t sub_1000062F0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006338()
{
  unint64_t result = qword_1000329E0;
  if (!qword_1000329E0)
  {
    sub_1000062F0(&qword_1000329E8);
    sub_1000063D8();
    sub_100007D3C((uint64_t)&unk_100032A70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000329E0);
  }
  return result;
}

unint64_t sub_1000063D8()
{
  unint64_t result = qword_1000329F0;
  if (!qword_1000329F0)
  {
    sub_1000062F0(&qword_1000329F8);
    sub_100006478();
    sub_100007D3C((uint64_t)&unk_100032A60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000329F0);
  }
  return result;
}

unint64_t sub_100006478()
{
  unint64_t result = qword_100032A00;
  if (!qword_100032A00)
  {
    sub_1000062F0(&qword_100032A08);
    sub_100006284();
    sub_100007D3C((uint64_t)&unk_100032A10);
    sub_10000652C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032A00);
  }
  return result;
}

unint64_t sub_10000652C()
{
  unint64_t result = qword_100032A20;
  if (!qword_100032A20)
  {
    sub_1000062F0(&qword_100032A28);
    sub_1000065E0((uint64_t)&unk_100032A30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032A20);
  }
  return result;
}

unint64_t sub_1000065E0(uint64_t a1)
{
  unint64_t result = sub_100007E10(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    sub_1000062F0(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_100006648()
{
  return sub_1000065E0((uint64_t)&unk_100032A40);
}

unint64_t sub_100006684()
{
  unint64_t result = qword_100032A50;
  if (!qword_100032A50)
  {
    sub_1000062F0(&qword_100032A58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032A50);
  }
  return result;
}

unint64_t sub_1000066F0()
{
  unint64_t result = qword_100032A80;
  if (!qword_100032A80)
  {
    sub_1000062F0(&qword_100032990);
    sub_100006284();
    sub_100007D3C((uint64_t)&unk_1000329D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032A80);
  }
  return result;
}

uint64_t sub_100006794()
{
  return sub_100020340();
}

uint64_t sub_1000067B8(uint64_t a1)
{
  uint64_t v2 = sub_1000061EC(&qword_100032AA8);
  __chkstk_darwin(v2 - 8);
  sub_100006C0C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100032AA8);
  return sub_100020350();
}

uint64_t sub_10000684C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100020320();
  *a1 = result;
  return result;
}

uint64_t sub_100006878()
{
  return sub_100020330();
}

uint64_t sub_1000068A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100020380();
  *a1 = result;
  return result;
}

uint64_t sub_1000068D0()
{
  return sub_100020390();
}

uint64_t sub_1000068FC(void *a1)
{
  id v1 = [a1 parameterStates];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_1000061EC(&qword_100032BC0);
  uint64_t v3 = sub_100020890();

  return v3;
}

uint64_t sub_100006960(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_33;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  for (result = swift_bridgeObjectRetain(); ; uint64_t v2 = result)
  {
    uint64_t v4 = &_swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    if (v2 < 1)
    {
      __break(1u);
      goto LABEL_35;
    }
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    id v7 = (void *)((char *)&_swiftEmptyArrayStorage + 32);
    unint64_t v8 = v1 & 0xC000000000000001;
    unint64_t v25 = v1 & 0xC000000000000001;
    while (1)
    {
      if (v8) {
        id v9 = (id)sub_100020A30();
      }
      else {
        id v9 = *(id *)(v1 + 8 * v6 + 32);
      }
      id v10 = v9;
      if (!v5)
      {
        unint64_t v11 = v4[3];
        if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_32;
        }
        unint64_t v12 = v1;
        int64_t v13 = v11 & 0xFFFFFFFFFFFFFFFELL;
        if (v13 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v13;
        }
        sub_1000061EC(&qword_100032AE8);
        id v15 = (void *)swift_allocObject();
        uint64_t v16 = (uint64_t)(j__malloc_size(v15) - 32) / 16;
        v15[2] = v14;
        v15[3] = 2 * v16;
        unint64_t v17 = (unint64_t)(v15 + 4);
        unint64_t v18 = v4[3];
        unint64_t v19 = v18 >> 1;
        if (v4[2])
        {
          if (v15 != v4 || v17 >= (unint64_t)&v4[2 * v19 + 4]) {
            memmove(v15 + 4, v4 + 4, 16 * v19);
          }
          v4[2] = 0;
        }
        id v7 = (void *)(v17 + 16 * v19);
        uint64_t v5 = (v16 & 0x7FFFFFFFFFFFFFFFLL) - (v18 >> 1);
        swift_release();
        uint64_t v4 = v15;
        unint64_t v1 = v12;
        unint64_t v8 = v25;
      }
      BOOL v21 = __OFSUB__(v5--, 1);
      if (v21) {
        break;
      }
      *id v7 = v6;
      v7[1] = v10;
      v7 += 2;
      if (v2 == ++v6) {
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
    uint64_t result = sub_100020AF0();
  }
  uint64_t v5 = 0;
LABEL_27:
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v22 = v4[3];
  if (v22 < 2) {
    return (uint64_t)v4;
  }
  unint64_t v23 = v22 >> 1;
  BOOL v21 = __OFSUB__(v23, v5);
  unint64_t v24 = v23 - v5;
  if (!v21)
  {
    v4[2] = v24;
    return (uint64_t)v4;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_100006B40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100003030(a1, (void **)(v2 + 16), a2);
}

uint64_t sub_100006B48()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006B80(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_100006BB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100006BDC@<X0>(uint64_t *a1@<X8>)
{
  return sub_100003578(*(void *)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t sub_100006BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100006C0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000061EC(a3);
  sub_100007DDC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_100006C6C()
{
  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100006CBC@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100003ABC(a1, v2 + 16, a2);
}

unint64_t sub_100006CC4()
{
  unint64_t result = qword_100032AD0;
  if (!qword_100032AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AD0);
  }
  return result;
}

uint64_t sub_100006D10(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100006D60(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_100006D60(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100006D70(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100006DC0(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100006DC0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t destroy for ParameterStateView(id *a1)
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ParameterStateView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  id v7 = v3;
  id v8 = v4;
  id v9 = v6;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ParameterStateView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  id v10 = *(void **)(a2 + 16);
  unint64_t v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ParameterStateView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ParameterStateView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ParameterStateView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 56))
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

uint64_t storeEnumTagSinglePayload for ParameterStateView(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ParameterStateView()
{
  return &type metadata for ParameterStateView;
}

unint64_t sub_100007080()
{
  unint64_t result = qword_100032AF0;
  if (!qword_100032AF0)
  {
    sub_1000062F0(&qword_100032AF8);
    sub_1000065E0((uint64_t)&unk_1000329D8);
    sub_1000066F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032AF0);
  }
  return result;
}

uint64_t sub_100007134()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007150()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1000071A8()
{
  return sub_100004C3C();
}

void *sub_1000071CC@<X0>(uint64_t a1@<X8>)
{
  return sub_100004E64(*(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(const void **)(v1 + 32), a1);
}

uint64_t sub_1000071DC(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  long long v3 = *(void **)(a1 + 8);
  long long v4 = *(void **)(a1 + 16);
  swift_retain();
  id v5 = v2;
  id v6 = v3;
  id v7 = v4;
  swift_retain();
  return a1;
}

uint64_t sub_100007238(uint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 a16)
{
  if (a16 != 255) {
    return sub_100007274(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16 & 1);
  }
  return result;
}

uint64_t sub_100007274(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  if (a16) {
    return swift_retain();
  }
  else {
    return sub_100007288(a1, a2, a3, a4 & 1);
  }
}

uint64_t sub_100007288(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0)
  {
    swift_retain();
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_1000072D8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100006D60(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10000731C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  sub_100007DC4();
  v5();
  uint64_t v6 = sub_100007DFC();
  a3(v6);
  return a1;
}

uint64_t sub_1000073A0(uint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 a16)
{
  if (a16 != 255) {
    return sub_1000073DC(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16 & 1);
  }
  return result;
}

uint64_t sub_1000073DC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  if (a16) {
    return swift_release();
  }
  else {
    return sub_1000073F0(a1, a2, a3, a4 & 1);
  }
}

uint64_t sub_1000073F0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result = swift_release();
  if ((a4 & 1) == 0)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100007454(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100006DC0(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100007498(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char), void (*a3)(uint64_t))
{
  char v7 = *(unsigned char *)(a1 + 144);
  a2(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), v7);
  uint64_t v5 = sub_100007DFC();
  a3(v5);
  return a1;
}

uint64_t sub_100007530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_100007580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000075D0(uint64_t result)
{
  *(unsigned char *)(result + 248) = 1;
  return result;
}

void *sub_1000075DC(void *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = a1[19];
  uint64_t v6 = a1[20];
  uint64_t v7 = a1[21];
  uint64_t v8 = a1[22];
  uint64_t v9 = a1[23];
  uint64_t v10 = a1[24];
  uint64_t v12 = a1[25];
  uint64_t v11 = a1[26];
  uint64_t v13 = a1[27];
  sub_100007DC4();
  v14();
  a3(v5, v6, v7, v8);
  a4(v9, v10, v12, v11, v13);
  return a1;
}

uint64_t sub_1000076B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 152);
  uint64_t v3 = *(void *)(a1 + 160);
  uint64_t v4 = *(void *)(a1 + 168);
  uint64_t v5 = *(void *)(a1 + 176);
  sub_100007238(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(unsigned char *)(a1 + 144));
  sub_1000072D8(v2, v3, v4, v5);
  swift_retain();
  return a1;
}

uint64_t sub_100007750(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 152);
  uint64_t v3 = *(void *)(a1 + 160);
  uint64_t v4 = *(void *)(a1 + 168);
  uint64_t v5 = *(void *)(a1 + 176);
  sub_1000073A0(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(unsigned char *)(a1 + 144));
  sub_100007454(v2, v3, v4, v5);
  swift_release();
  return a1;
}

uint64_t sub_1000077F0(uint64_t result)
{
  *(unsigned char *)(result + 248) = 0;
  return result;
}

unint64_t sub_1000077F8(uint64_t a1)
{
  unint64_t result = sub_100007E10(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

_OWORD *sub_10000783C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000784C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000078A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000078F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007924(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100007960(uint64_t *a1)
{
  return (unint64_t)sub_100005D0C(a1, *(void **)(v1 + 16)) & 1;
}

id sub_100007980(void *a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  if (ObjectType != swift_getObjectType()) {
    return 0;
  }
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6 && (uint64_t v7 = (void *)v6, self, (v8 = swift_dynamicCastObjCClass()) != 0)) {
    return [v7 stateIsEquivalent:v8];
  }
  else {
    return [a1 isEqual:a2];
  }
}

uint64_t sub_100007A2C(uint64_t a1)
{
  sub_100007E10(a1);
  sub_100007DC4();
  v2();
  return v1;
}

double sub_100007A84(uint64_t a1)
{
  *(void *)(a1 + 112) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(unsigned char *)(a1 + 120) = -1;
  return result;
}

uint64_t sub_100007AA8(uint64_t result)
{
  *(unsigned char *)(result + 120) = 1;
  return result;
}

uint64_t sub_100007AB4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000061EC(a3);
  sub_100007DDC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

unint64_t sub_100007B10()
{
  unint64_t result = qword_100032BF0;
  if (!qword_100032BF0)
  {
    sub_1000062F0(&qword_100032BE0);
    sub_100007B8C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032BF0);
  }
  return result;
}

unint64_t sub_100007B8C()
{
  unint64_t result = qword_100032BF8;
  if (!qword_100032BF8)
  {
    sub_1000062F0(&qword_100032C00);
    sub_100007D3C((uint64_t)&unk_100032C08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032BF8);
  }
  return result;
}

unint64_t sub_100007C2C()
{
  unint64_t result = qword_100032C18;
  if (!qword_100032C18)
  {
    sub_1000062F0(&qword_100032BE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032C18);
  }
  return result;
}

uint64_t sub_100007CA4(uint64_t result)
{
  *(unsigned char *)(result + 120) = 0;
  return result;
}

uint64_t sub_100007CAC(uint64_t a1, uint64_t *a2)
{
  sub_1000061EC(a2);
  sub_100007DDC();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_100007D00()
{
  return sub_100007D3C((uint64_t)&unk_100032C20);
}

unint64_t sub_100007D3C(uint64_t a1)
{
  unint64_t result = sub_100007E10(a1);
  if (!result)
  {
    sub_1000062F0(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_100007D7C(uint64_t *a1)
{
  return sub_100007960(a1) & 1;
}

uint64_t sub_100007DFC()
{
  return v0;
}

uint64_t sub_100007E10(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_100007E1C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, void *a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16)
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
    sub_100020970();
    unint64_t v25 = (void *)sub_1000204A0();
    sub_100020140();
  }
  sub_1000202E0();
  *a9 = a16;
  memcpy(a9 + 1, __src, 0x70uLL);
  return swift_retain();
}

void *sub_100007FB4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_100020970();
    unint64_t v23 = (void *)sub_1000204A0();
    sub_100020140();
  }
  sub_1000202E0();
  uint64_t v24 = sub_1000061EC(&qword_100033068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = sub_1000061EC(&qword_100033070);
  return memcpy((void *)(a9 + *(int *)(v25 + 36)), __src, 0x70uLL);
}

void sub_100008180(void *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, void *a4@<X8>)
{
  unint64_t v7 = (unint64_t)a2 >> 62;
  if (a3)
  {
    swift_bridgeObjectRetain();
    id v8 = a1;
LABEL_12:
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  if (v7)
  {
    swift_bridgeObjectRetain_n();
    id v16 = a1;
    uint64_t v17 = sub_100020AF0();
    swift_bridgeObjectRelease();
    if (v17 != 1) {
      goto LABEL_12;
    }
    swift_bridgeObjectRetain();
    if (!sub_100020AF0())
    {
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    id v10 = a1;
    if (v9 != 1) {
      goto LABEL_12;
    }
    swift_bridgeObjectRetain();
  }
  sub_100017680(0, (a2 & 0xC000000000000001) == 0, a2);
  if ((a2 & 0xC000000000000001) != 0) {
    sub_100020A30();
  }
  else {
    id v11 = *(id *)(a2 + 32);
  }
  sub_10000EA5C();
  id v12 = [(id)(a2 & 0xC000000000000001) localizedLabel];
  uint64_t v13 = sub_1000207E0();
  uint64_t v15 = v14;

LABEL_13:
  uint64_t v18 = sub_10000DAC4(a1);
  if (!v19)
  {
    if (v7)
    {
      if (a2 < 0) {
        uint64_t v20 = a2;
      }
      else {
        uint64_t v20 = a2 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      sub_100020AF0();
      sub_10000EA5C();
      if (v20)
      {
LABEL_17:
        BOOL v22 = __OFSUB__(v20, 1);
        unint64_t v23 = v20 - 1;
        if (v22)
        {
          __break(1u);
        }
        else
        {
          sub_100017680(v23, (a2 & 0xC000000000000001) == 0, a2);
          if ((a2 & 0xC000000000000001) == 0)
          {
            id v24 = *(id *)(a2 + 8 * v23 + 32);
LABEL_20:
            sub_10000EA5C();
            id v25 = a1;
            id v26 = (id)v23;
            uint64_t v20 = sub_10000ED24(v26);
            uint64_t v21 = v27;

            goto LABEL_26;
          }
        }
        sub_100020A30();
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v20 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v20) {
        goto LABEL_17;
      }
    }

    swift_bridgeObjectRelease();
    uint64_t v21 = 0;
    goto LABEL_26;
  }
  uint64_t v20 = v18;
  uint64_t v21 = v19;
  swift_bridgeObjectRelease();

LABEL_26:
  *a4 = a1;
  a4[1] = a2;
  a4[2] = v13;
  a4[3] = v15;
  a4[4] = v20;
  a4[5] = v21;
}

id sub_1000083B0(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)a1 identifier];
  uint64_t v5 = sub_1000207E0();
  uint64_t v7 = v6;

  id v8 = [*(id *)a2 identifier];
  uint64_t v9 = sub_1000207E0();
  uint64_t v11 = v10;

  if (v5 == v9 && v7 == v11)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v13 = sub_100020B30();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v15 = *(void *)(a1 + 8);
  uint64_t v16 = *(void *)(a2 + 8);
  return sub_10000EE94(v15, v16);
}

uint64_t sub_1000084BC(uint64_t a1)
{
  unint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_100008524(v2);
  swift_bridgeObjectRelease();
  sub_10000E624(a1, (uint64_t)v3);
  return swift_bridgeObjectRelease();
}

char *sub_100008524(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (!v2) {
      return (char *)_swiftEmptyArrayStorage;
    }
    unint64_t result = sub_10001820C(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_100020A30();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = [v5 key];
      uint64_t v8 = sub_1000207E0();
      uint64_t v10 = v9;

      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_10001820C((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v4;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      char v13 = (char *)&_swiftEmptyArrayStorage[2 * v12];
      *((void *)v13 + 4) = v8;
      *((void *)v13 + 5) = v10;
      if (v2 == v4) {
        return (char *)_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100020AF0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

Swift::Int sub_1000086A0()
{
  sub_100020B90();
  unint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_100008524(v0);
  swift_bridgeObjectRelease();
  sub_10000E624((uint64_t)v3, (uint64_t)v1);
  swift_bridgeObjectRelease();
  return sub_100020BB0();
}

Swift::Int sub_100008720()
{
  sub_100020B90();
  unint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_100008524(v0);
  swift_bridgeObjectRelease();
  sub_10000E624((uint64_t)v3, (uint64_t)v1);
  swift_bridgeObjectRelease();
  return sub_100020BB0();
}

uint64_t sub_100008798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  id v5 = *(void **)(a1 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_action);
  uint64_t v6 = *(void *)(a1 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_options);
  swift_bridgeObjectRetain();
  id v7 = v5;
  swift_bridgeObjectRetain();
  sub_1000061EC(&qword_100032DB0);
  sub_100020670();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)a2 = sub_10000CD7C;
  *(void *)(a2 + 8) = result;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = v7;
  *(void *)(a2 + 32) = v6;
  *(void *)(a2 + 40) = v9;
  *(void *)(a2 + 48) = v10;
  *(void *)(a2 + 56) = KeyPath;
  *(unsigned char *)(a2 + 64) = 0;
  return result;
}

void *sub_100008894()
{
  uint64_t v1 = v0;
  sub_1000061EC(&qword_100032E08);
  sub_100020680();
  sub_10000D168(v0);
  uint64_t v2 = sub_100008F00(_swiftEmptyArrayStorage, (uint64_t)_swiftEmptyArrayStorage, v22, v0);
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  if (!((unint64_t)v4 >> 62))
  {
    if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    return v2;
  }
  if (v4 < 0) {
    uint64_t v20 = v4;
  }
  else {
    uint64_t v20 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  sub_100020AF0();
  sub_10000EA5C();
  if (!v20) {
    goto LABEL_25;
  }
LABEL_3:
  id v5 = *(id *)(v1 + 24);
  swift_bridgeObjectRetain();
  id v6 = v5;
  uint64_t v7 = sub_10000DAC4(v6);
  if (!v8)
  {
    if ((unint64_t)v4 >> 62)
    {
      if (v4 < 0) {
        uint64_t v9 = v4;
      }
      else {
        uint64_t v9 = v4 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      sub_100020AF0();
      sub_10000EA5C();
      if (v9)
      {
LABEL_7:
        BOOL v11 = __OFSUB__(v9, 1);
        unint64_t v12 = v9 - 1;
        if (v11)
        {
          __break(1u);
        }
        else
        {
          sub_100017680(v12, (v4 & 0xC000000000000001) == 0, v4);
          if ((v4 & 0xC000000000000001) == 0)
          {
            id v13 = *(id *)(v4 + 8 * v12 + 32);
LABEL_10:
            sub_10000EA5C();
            id v14 = v6;
            id v15 = (id)v12;
            uint64_t v9 = sub_10000ED24(v15);
            uint64_t v10 = v16;

            goto LABEL_16;
          }
        }
        sub_100020A30();
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v9) {
        goto LABEL_7;
      }
    }

    swift_bridgeObjectRelease();
    uint64_t v10 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = v7;
  uint64_t v10 = v8;
  swift_bridgeObjectRelease();

LABEL_16:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000D8CC(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v18 = v2[2];
  unint64_t v17 = v2[3];
  if (v18 >= v17 >> 1) {
    uint64_t v2 = sub_10000D8CC((char *)(v17 > 1), v18 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v18 + 1;
  uint64_t v19 = &v2[6 * v18];
  v19[4] = v6;
  v19[5] = v4;
  v19[6] = 0;
  v19[7] = 0;
  v19[8] = v9;
  v19[9] = v10;
  return v2;
}

char *sub_100008AD8(void *a1, id *a2, uint64_t a3)
{
  id v6 = *a2;
  p_imp = &stru_100030FF0.imp;
  uint64_t v8 = &stru_100030FF0.imp;
  if (![*a2 allowsMultipleValues]
    || ([v6 displaysMultipleValueEditor] & 1) == 0)
  {
    sub_10000ED24(v6);
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    if (!v10)
    {
      uint64_t v11 = *(void *)(a3 + 32);
      id v12 = [v6 key];
      uint64_t v13 = sub_1000207E0();
      uint64_t v15 = v14;

      uint64_t v16 = (void *)sub_10000F26C(v13, v15, v11);
      p_imp = (IMP *)(&stru_100030FF0 + 16);
      uint64_t v8 = (IMP *)(&stru_100030FF0 + 16);
      swift_bridgeObjectRelease();

      if (!v16)
      {
        id v33 = v6;
        sub_100020870();
        sub_10000D8A0(*(void *)((a1[1] & 0xFFFFFFFFFFFFFF8) + 0x10));
        sub_1000208D0();
        return (char *)sub_1000208B0();
      }
    }
  }
  unint64_t v17 = a1[1];
  if (!(v17 >> 62))
  {
    if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_21;
    }
LABEL_7:
    uint64_t v57 = v3;
    unint64_t v18 = a1[1];
    id v19 = *(id *)(a3 + 24);
    swift_bridgeObjectRetain_n();
    id v20 = v19;
    uint64_t v21 = sub_10000DAC4(v20);
    if (v22)
    {
      uint64_t v23 = v21;
      uint64_t v24 = v22;
      swift_bridgeObjectRelease();

LABEL_20:
      sub_10000D814();
      uint64_t v36 = *(char **)(*a1 + 16);
      sub_10000D860(v36);
      uint64_t v37 = *a1;
      *(void *)(v37 + 16) = v36 + 1;
      id v38 = (void *)(v37 + 48 * (void)v36);
      v38[4] = v20;
      v38[5] = v18;
      v38[6] = 0;
      v38[7] = 0;
      v38[8] = v23;
      v38[9] = v24;
      *a1 = v37;
      a1[1] = _swiftEmptyArrayStorage;
      swift_bridgeObjectRelease();
      p_imp = &stru_100030FF0.imp;
      uint64_t v8 = &stru_100030FF0.imp;
      goto LABEL_21;
    }
    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_100020AF0();
      swift_bridgeObjectRelease();
      if (v25)
      {
LABEL_11:
        BOOL v26 = __OFSUB__(v25, 1);
        unint64_t v27 = v25 - 1;
        if (v26)
        {
          __break(1u);
        }
        else
        {
          sub_100017680(v27, (v18 & 0xC000000000000001) == 0, v18);
          uint64_t v55 = a3;
          if ((v18 & 0xC000000000000001) == 0)
          {
            id v28 = *(id *)(v18 + 8 * v27 + 32);
LABEL_14:
            char v29 = v28;
            swift_bridgeObjectRelease();
            id v30 = v20;
            id v31 = v29;
            uint64_t v23 = sub_10000ED24(v31);
            uint64_t v24 = v32;

            a3 = v55;
            goto LABEL_20;
          }
        }
        id v28 = (id)sub_100020A30();
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v25 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v25) {
        goto LABEL_11;
      }
    }

    swift_bridgeObjectRelease();
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_100020AF0();
  swift_bridgeObjectRelease();
  if (v35) {
    goto LABEL_7;
  }
LABEL_21:
  if [v6 allowsMultipleValues] && (objc_msgSend(v6, (SEL)v8[392]))
  {
    char v39 = 0;
  }
  else
  {
    uint64_t v40 = a3;
    uint64_t v41 = *(void *)(a3 + 32);
    id v42 = objc_msgSend(v6, (SEL)p_imp[420]);
    uint64_t v43 = sub_1000207E0();
    uint64_t v45 = v44;

    id v46 = (void *)sub_10000F26C(v43, v45, v41);
    swift_bridgeObjectRelease();
    if (v46)
    {

      char v39 = 0;
    }
    else
    {
      char v39 = 1;
    }
    a3 = v40;
  }
  uint64_t v47 = *(void **)(a3 + 24);
  sub_1000061EC(&qword_100033710);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_1000225D0;
  *(void *)(v48 + 32) = v6;
  *(void *)&v56[0] = v48;
  sub_1000208B0();
  id v49 = v47;
  id v50 = v6;
  sub_100008180(v49, *(uint64_t *)&v56[0], v39, v56);
  sub_10000D814();
  uint64_t v51 = *(char **)(*a1 + 16);
  uint64_t result = sub_10000D860(v51);
  uint64_t v52 = *a1;
  *(void *)(v52 + 16) = v51 + 1;
  uint64_t v53 = (_OWORD *)(v52 + 48 * (void)v51);
  long long v54 = v56[1];
  v53[2] = v56[0];
  v53[3] = v54;
  v53[4] = v56[2];
  *a1 = v52;
  return result;
}

void *sub_100008F00(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1;
  v14[0] = a1;
  v14[1] = a2;
  if (a3 >> 62) {
    goto LABEL_13;
  }
  uint64_t v8 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v8; uint64_t v8 = sub_100020AF0())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v10 = (a3 & 0xC000000000000001) != 0 ? (id)sub_100020A30() : *(id *)(a3 + 8 * i);
      uint64_t v7 = v10;
      uint64_t v11 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v13 = v10;
      sub_100008AD8(v14, &v13, a4);
      if (v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        sub_10000DE14(a4);
        return v7;
      }

      if (v11 == v8)
      {
        swift_bridgeObjectRelease();
        sub_10000DE14(a4);
        return (void *)v14[0];
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  sub_10000DE14(a4);
  return v7;
}

uint64_t sub_10000905C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v32 = sub_1000202D0();
  sub_10000EA24();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_10000EA80();
  uint64_t v6 = sub_1000061EC(&qword_100032DB8);
  sub_10000EA24();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_10000EA98();
  sub_1000061EC(&qword_100032DC0);
  sub_10000EA24();
  __chkstk_darwin(v10);
  sub_100007DEC();
  sub_1000061EC(&qword_100032DC8);
  sub_10000EA24();
  uint64_t v29 = v12;
  uint64_t v30 = v11;
  __chkstk_darwin(v11);
  sub_10000EAB8();
  uint64_t v26 = v13;
  uint64_t v28 = sub_1000061EC(&qword_100032DD0) - 8;
  __chkstk_darwin(v28);
  sub_10000EAB8();
  uint64_t v27 = v14;
  sub_1000061EC(&qword_100032DD8);
  sub_10000E9E0(&qword_100032DE0, &qword_100032DD8);
  sub_100020500();
  sub_100020770();
  sub_10000E9E0(&qword_100032DE8, &qword_100032DB8);
  sub_10000D10C(&qword_100032DF0, (void (*)(uint64_t))&type metadata accessor for GroupedFormStyle);
  sub_1000205C0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v32);
  (*(void (**)(const void *, uint64_t))(v8 + 8))(v1, v6);
  uint64_t v25 = v1;
  type metadata accessor for FocusConfigurationActionViewModel();
  sub_10000D10C((unint64_t *)&qword_100032DF8, (void (*)(uint64_t))type metadata accessor for FocusConfigurationActionViewModel);
  uint64_t v15 = (void *)sub_100020260();
  swift_getKeyPath();
  sub_1000202B0();
  swift_release();

  sub_10000F398(v33, v34, v35);
  swift_release();
  swift_release();
  swift_getOpaqueTypeConformance2();
  sub_100020570();
  swift_release();
  swift_release();
  sub_10000EA74();
  v16();
  unint64_t v17 = (char *)sub_100020250();
  uint64_t v18 = *(void *)&v17[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_onConfigurableParametersChange];
  swift_retain();

  uint64_t v19 = swift_allocObject();
  memcpy((void *)(v19 + 16), v25, 0x41uLL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v27, v26, v30);
  *(void *)(v27 + *(int *)(v28 + 60)) = v18;
  id v20 = (uint64_t (**)())(v27 + *(int *)(v28 + 64));
  *id v20 = sub_10000D160;
  v20[1] = (uint64_t (*)())v19;
  sub_10000D168((uint64_t)v25);
  sub_10000EA74();
  v21();
  uint64_t v22 = swift_allocObject();
  memcpy((void *)(v22 + 16), v25, 0x41uLL);
  sub_10000E770(v27, a1, &qword_100032DD0);
  uint64_t v23 = (void (**)())(a1 + *(int *)(sub_1000061EC(&qword_100032E00) + 36));
  *uint64_t v23 = sub_10000D1F0;
  v23[1] = (void (*)())v22;
  v23[2] = 0;
  v23[3] = 0;
  sub_10000D168((uint64_t)v25);
  return sub_10000E7C0(v27, &qword_100032DD0);
}

uint64_t sub_1000095E0@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v3 = sub_1000061EC(&qword_100032E10);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v43 = (uint64_t)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v36 - v6;
  uint64_t v8 = sub_1000061EC(&qword_100032E18);
  uint64_t v40 = *(void *)(v8 - 8);
  uint64_t v41 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  id v38 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v36 - v11;
  uint64_t v13 = sub_1000061EC(&qword_100032E20);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v44 = (uint64_t)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  unint64_t v17 = (char *)&v36 - v16;
  sub_100009B0C((uint64_t)&v36 - v16);
  uint64_t v45 = sub_100008894();
  swift_getKeyPath();
  uint64_t v18 = swift_allocObject();
  memcpy((void *)(v18 + 16), a1, 0x41uLL);
  sub_10000D168((uint64_t)a1);
  sub_1000061EC(&qword_100032E28);
  sub_1000061EC(&qword_100032E30);
  sub_10000E9E0(&qword_100032E38, &qword_100032E28);
  sub_10000D204();
  sub_10000D250();
  char v39 = v12;
  sub_100020710();
  type metadata accessor for FocusConfigurationActionViewModel();
  sub_10000D10C((unint64_t *)&qword_100032DF8, (void (*)(uint64_t))type metadata accessor for FocusConfigurationActionViewModel);
  uint64_t v19 = (char *)sub_100020250();
  id v20 = *(id *)&v19[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request];

  unint64_t v21 = sub_10000DB28(v20);
  if (!v21) {
    goto LABEL_7;
  }
  if (v21 >> 62)
  {
    uint64_t v22 = sub_100020AF0();
    if (v22) {
      goto LABEL_4;
    }
    goto LABEL_6;
  }
  uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v22)
  {
LABEL_6:
    swift_bridgeObjectRelease();
LABEL_7:
    uint64_t v23 = 1;
    goto LABEL_8;
  }
LABEL_4:
  __chkstk_darwin(v22);
  sub_1000061EC(&qword_100032ED8);
  sub_10000DBA8();
  sub_100020730();
  swift_bridgeObjectRelease();
  uint64_t v23 = 0;
LABEL_8:
  uint64_t v24 = sub_1000061EC(&qword_100032EC8);
  sub_100006BE4((uint64_t)v7, v23, 1, v24);
  uint64_t v37 = v17;
  uint64_t v25 = v44;
  sub_10000E770((uint64_t)v17, v44, &qword_100032E20);
  uint64_t v26 = v39;
  uint64_t v27 = v40;
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  uint64_t v29 = v38;
  uint64_t v30 = v41;
  v28(v38, v39, v41);
  uint64_t v31 = v43;
  sub_10000E770((uint64_t)v7, v43, &qword_100032E10);
  uint64_t v32 = v42;
  sub_10000E770(v25, v42, &qword_100032E20);
  uint64_t v33 = sub_1000061EC(&qword_100032ED0);
  v28((char *)(v32 + *(int *)(v33 + 48)), v29, v30);
  sub_10000E770(v31, v32 + *(int *)(v33 + 64), &qword_100032E10);
  sub_10000E7C0((uint64_t)v7, &qword_100032E10);
  uint64_t v34 = *(void (**)(char *, uint64_t))(v27 + 8);
  v34(v26, v30);
  sub_10000E7C0((uint64_t)v37, &qword_100032E20);
  sub_10000E7C0(v31, &qword_100032E10);
  v34(v29, v30);
  return sub_10000E7C0(v44, &qword_100032E20);
}

uint64_t sub_100009B0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v125 = sub_1000061EC(&qword_100032F70);
  __chkstk_darwin(v125);
  uint64_t v113 = (uint64_t)&v104 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000061EC(&qword_100032F78);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  v111 = (char *)&v104 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v112 = (char *)&v104 - v7;
  uint64_t v8 = sub_1000061EC(&qword_100032F80);
  __chkstk_darwin(v8 - 8);
  v108 = (uint64_t *)((char *)&v104 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v106 = sub_1000061EC(&qword_100032F88);
  __chkstk_darwin(v106);
  uint64_t v107 = (uint64_t)&v104 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_1000061EC(&qword_100032F90);
  uint64_t v11 = __chkstk_darwin(v105);
  uint64_t v109 = (uint64_t)&v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v110 = (uint64_t)&v104 - v13;
  uint64_t v121 = sub_1000061EC(&qword_100032F98);
  __chkstk_darwin(v121);
  uint64_t v123 = (uint64_t)&v104 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_1000061EC(&qword_100032FA0);
  __chkstk_darwin(v122);
  uint64_t v119 = (uint64_t)&v104 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000061EC(&qword_100032E20);
  __chkstk_darwin(v16 - 8);
  v124 = (char *)&v104 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000061EC(&qword_100032FA8);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v117 = (uint64_t)&v104 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v118 = (char *)&v104 - v21;
  uint64_t v22 = sub_1000061EC(&qword_100032FB0);
  __chkstk_darwin(v22 - 8);
  uint64_t v24 = (char *)&v104 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_1000061EC(&qword_100032FB8);
  __chkstk_darwin(v115);
  uint64_t v26 = (char *)&v104 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_1000061EC(&qword_100032FC0);
  uint64_t v27 = __chkstk_darwin(v114);
  uint64_t v126 = (uint64_t)&v104 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v116 = (uint64_t)&v104 - v29;
  uint64_t v30 = *v1;
  uint64_t v31 = (uint64_t)v1[1];
  v120 = v1;
  uint64_t v32 = type metadata accessor for FocusConfigurationActionViewModel();
  sub_10000D10C((unint64_t *)&qword_100032DF8, (void (*)(uint64_t))type metadata accessor for FocusConfigurationActionViewModel);
  uint64_t v33 = (char *)sub_100020250();
  id v34 = *(id *)&v33[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request];

  id v35 = [v34 actionIdentifier];
  uint64_t v127 = a1;
  v128 = v35;
  if (v35)
  {
    uint64_t v36 = (char *)sub_100020250();
    id v37 = *(id *)&v36[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_action];

    self;
    id v38 = (char *)swift_dynamicCastObjCClass();
    if (v38)
    {
      v111 = v38;
      v112 = v30;
      uint64_t v113 = v31;
      uint64_t v39 = sub_100020250();
      id v40 = objc_retain(*(id *)(v39
                              + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request));

      LOBYTE(v39) = [v40 showsEnablementButton];
      id v104 = v37;
      if (v39)
      {
        uint64_t v41 = 0;
      }
      else
      {
        id v69 = objc_msgSend(v111, "metadata", v104);
        id v70 = [v69 descriptionMetadata];

        if (v70)
        {
          id v71 = [v70 descriptionText];

          id v72 = objc_msgSend(v71, "wf_localizedString");
          uint64_t v41 = sub_1000207E0();
        }
        else
        {
          uint64_t v41 = 0;
        }
      }
      *(void *)uint64_t v24 = sub_1000203E0();
      *((void *)v24 + 1) = 0;
      uint64_t v73 = 1;
      v24[16] = 1;
      uint64_t v74 = sub_1000061EC(&qword_100033008);
      sub_10000BAB4(v128, v41, (uint64_t)&v24[*(int *)(v74 + 44)]);
      swift_bridgeObjectRelease();
      uint64_t v129 = sub_1000205F0();
      swift_retain();
      uint64_t v75 = sub_1000206D0();
      sub_10000E770((uint64_t)v24, (uint64_t)v26, &qword_100032FB0);
      swift_release();
      *(void *)&v26[*(int *)(v115 + 36)] = v75;
      sub_10000E7C0((uint64_t)v24, &qword_100032FB0);
      uint64_t v76 = v126;
      sub_10000E770((uint64_t)v26, v126, &qword_100032FB8);
      uint64_t v77 = v76 + *(int *)(v114 + 36);
      *(unsigned char *)(v77 + 32) = 0;
      *(_OWORD *)uint64_t v77 = 0u;
      *(_OWORD *)(v77 + 16) = 0u;
      sub_10000E7C0((uint64_t)v26, &qword_100032FB8);
      uint64_t v78 = v116;
      sub_100007AB4(v76, v116, &qword_100032FC0);
      v79 = (char *)sub_100020250();
      id v80 = *(id *)&v79[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request];

      LODWORD(v79) = [v80 showsEnablementButton];
      uint64_t v82 = (uint64_t)v118;
      if (v79)
      {
        __chkstk_darwin(v81);
        id v83 = v111;
        v84 = v120;
        *(&v104 - 2) = v111;
        *(&v104 - 1) = v84;
        id v85 = [v83 metadata];
        id v86 = [v85 descriptionMetadata];

        if (v86)
        {
          id v87 = [v86 descriptionText];

          id v88 = objc_msgSend(v87, "wf_localizedString");
          uint64_t v89 = sub_1000207E0();
          uint64_t v91 = v90;

          uint64_t v129 = v89;
          uint64_t v130 = v91;
          sub_100006238();
          uint64_t v92 = sub_100020540();
          uint64_t v96 = v95 & 1;
        }
        else
        {
          uint64_t v92 = 0;
          uint64_t v93 = 0;
          uint64_t v96 = 0;
          uint64_t v94 = 0;
        }
        uint64_t v129 = v92;
        uint64_t v130 = v93;
        uint64_t v131 = v96;
        uint64_t v132 = v94;
        sub_1000061EC(&qword_100032FF8);
        sub_1000061EC(&qword_100032E70);
        sub_10000E9E0(&qword_100033000, &qword_100032FF8);
        sub_100006284();
        sub_100020740();
        uint64_t v73 = 0;
      }
      uint64_t v97 = sub_1000061EC(&qword_100033010);
      sub_100006BE4(v82, v73, 1, v97);
      uint64_t v98 = v126;
      sub_10000E770(v78, v126, &qword_100032FC0);
      uint64_t v99 = v117;
      sub_10000E770(v82, v117, &qword_100032FA8);
      uint64_t v100 = v119;
      sub_10000E770(v98, v119, &qword_100032FC0);
      uint64_t v101 = sub_1000061EC((uint64_t *)&unk_100033018);
      sub_10000E770(v99, v100 + *(int *)(v101 + 48), &qword_100032FA8);
      sub_10000E7C0(v99, &qword_100032FA8);
      sub_10000E7C0(v98, &qword_100032FC0);
      sub_10000E770(v100, v123, &qword_100032FA0);
      swift_storeEnumTagMultiPayload();
      sub_10000E9E0(&qword_100032FE8, &qword_100032FA0);
      sub_10000E9E0(&qword_100032FF0, &qword_100032F70);
      uint64_t v102 = (uint64_t)v124;
      sub_100020470();

      sub_10000E7C0(v100, &qword_100032FA0);
      sub_10000E7C0(v82, &qword_100032FA8);
      sub_10000E7C0(v78, &qword_100032FC0);
      uint64_t v103 = sub_1000061EC(&qword_100032FC8);
      sub_100006BE4(v102, 0, 1, v103);
      uint64_t v65 = v102;
      return sub_100007AB4(v65, v127, &qword_100032E20);
    }
  }
  uint64_t v42 = (char *)sub_100020250();
  id v43 = *(id *)&v42[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request];

  id v44 = [v43 contextualAction];
  if (v44)
  {
    uint64_t v126 = v32;
    uint64_t v45 = sub_1000203E0();
    uint64_t v46 = (uint64_t)v108;
    uint64_t *v108 = v45;
    *(void *)(v46 + 8) = 0;
    uint64_t v47 = 1;
    *(unsigned char *)(v46 + 16) = 1;
    uint64_t v48 = sub_1000061EC(&qword_100032FD0);
    sub_10000BFD8(v44, v46 + *(int *)(v48 + 44));
    uint64_t v49 = sub_1000205F0();
    v128 = v44;
    uint64_t v129 = v49;
    swift_retain();
    uint64_t v50 = sub_1000206D0();
    uint64_t v51 = v107;
    sub_10000E770(v46, v107, &qword_100032F80);
    swift_release();
    *(void *)(v51 + *(int *)(v106 + 36)) = v50;
    sub_10000E7C0(v46, &qword_100032F80);
    uint64_t v52 = v109;
    sub_10000E770(v51, v109, &qword_100032F88);
    uint64_t v53 = v52 + *(int *)(v105 + 36);
    *(unsigned char *)(v53 + 32) = 0;
    *(_OWORD *)uint64_t v53 = 0u;
    *(_OWORD *)(v53 + 16) = 0u;
    sub_10000E7C0(v51, &qword_100032F88);
    uint64_t v54 = v110;
    sub_100007AB4(v52, v110, &qword_100032F90);
    uint64_t v55 = (char *)sub_100020250();
    id v56 = *(id *)&v55[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request];

    LODWORD(v55) = [v56 showsEnablementButton];
    uint64_t v58 = (uint64_t)v112;
    if (v55)
    {
      __chkstk_darwin(v57);
      *(&v104 - 2) = v120;
      sub_1000061EC(&qword_100032FF8);
      sub_10000E9E0(&qword_100033000, &qword_100032FF8);
      sub_100020730();
      uint64_t v47 = 0;
    }
    uint64_t v59 = sub_1000061EC(&qword_100032FD8);
    sub_100006BE4(v58, v47, 1, v59);
    sub_10000E770(v54, v52, &qword_100032F90);
    uint64_t v60 = (uint64_t)v111;
    sub_10000E770(v58, (uint64_t)v111, &qword_100032F78);
    uint64_t v61 = v113;
    sub_10000E770(v52, v113, &qword_100032F90);
    uint64_t v62 = sub_1000061EC(&qword_100032FE0);
    sub_10000E770(v60, v61 + *(int *)(v62 + 48), &qword_100032F78);
    sub_10000E7C0(v60, &qword_100032F78);
    sub_10000E7C0(v52, &qword_100032F90);
    sub_10000E770(v61, v123, &qword_100032F70);
    swift_storeEnumTagMultiPayload();
    sub_10000E9E0(&qword_100032FE8, &qword_100032FA0);
    sub_10000E9E0(&qword_100032FF0, &qword_100032F70);
    uint64_t v63 = (uint64_t)v124;
    sub_100020470();

    sub_10000E7C0(v61, &qword_100032F70);
    sub_10000E7C0(v58, &qword_100032F78);
    sub_10000E7C0(v54, &qword_100032F90);
    uint64_t v64 = sub_1000061EC(&qword_100032FC8);
    sub_100006BE4(v63, 0, 1, v64);
    uint64_t v65 = v63;
    return sub_100007AB4(v65, v127, &qword_100032E20);
  }
  uint64_t v66 = sub_1000061EC(&qword_100032FC8);
  uint64_t v67 = v127;
  return sub_100006BE4(v67, 1, 1, v66);
}

void sub_10000AA90(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  long long v2 = a1[1];
  v3[0] = *a1;
  v3[1] = v2;
  v3[2] = a1[2];
  sub_10000AAD0((uint64_t)v3, a2);
}

void sub_10000AAD0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v56 = sub_1000061EC((uint64_t *)&unk_100032E60);
  uint64_t v53 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_1000061EC(&qword_100032F18);
  __chkstk_darwin(v54);
  uint64_t v7 = (uint64_t *)((char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_100020AF0()) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v31 = swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9) {
    goto LABEL_14;
  }
LABEL_3:
  sub_100017680(0, (v8 & 0xC000000000000001) == 0, v8);
  if ((v8 & 0xC000000000000001) != 0) {
    id v10 = (id)sub_100020A30();
  }
  else {
    id v10 = *(id *)(v8 + 32);
  }
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t v76 = &OBJC_PROTOCOL___WFParameterValuePickable;
  uint64_t v12 = swift_dynamicCastObjCProtocolConditional();
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_100020AF0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v14 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v14 == 1)
    {
      uint64_t v15 = *(void *)(v2 + 32);
      id v16 = [v13 key];
      uint64_t v17 = sub_1000207E0();
      uint64_t v19 = v18;

      uint64_t v20 = (void *)sub_10000F26C(v17, v19, v15);
      swift_bridgeObjectRelease();
      if (v20)
      {
        uint64_t v21 = *(void **)(v2 + 24);
        sub_1000200A0();
        uint64_t v22 = *(void **)(v2 + 56);
        char v23 = *(unsigned char *)(v2 + 64);
        id v24 = v21;
        id v25 = v11;
        id v26 = v24;
        id v27 = v25;
        id v28 = v20;
        sub_10000CD94(v22, v23);
        sub_10000D5F4(v22, v23);
        sub_10000CE18(v22, v23);
        sub_100020090();
        sub_10000D10C(&qword_100032AE0, (void (*)(uint64_t))&type metadata accessor for ParameterStateStore);
        uint64_t v29 = sub_1000202A0();
        *uint64_t v7 = v26;
        v7[1] = v13;
        v7[2] = v28;
        v7[3] = v29;
        v7[4] = v30;
        swift_storeEnumTagMultiPayload();
        sub_10000D2CC();
        sub_10000D318();
        swift_retain();
        sub_100020470();
        swift_release();

        return;
      }
    }
  }

LABEL_15:
  __chkstk_darwin(v31);
  sub_100007AB4(a1 + 16, (uint64_t)v78, (uint64_t *)&unk_100032F20);
  sub_100007AB4((uint64_t)v78, (uint64_t)&v79, (uint64_t *)&unk_100032F20);
  uint64_t v32 = v79;
  if (!v80) {
    uint64_t v32 = 0;
  }
  uint64_t v33 = _swiftEmptyArrayStorage;
  if (!v80) {
    uint64_t v33 = 0;
  }
  uint64_t v72 = v32;
  uint64_t v73 = v80;
  uint64_t v74 = 0;
  uint64_t v75 = v33;
  sub_100007AB4(a1 + 32, (uint64_t)v77, (uint64_t *)&unk_100032F20);
  sub_100007AB4((uint64_t)v77, (uint64_t)&v81, (uint64_t *)&unk_100032F20);
  uint64_t v34 = v82;
  uint64_t v52 = (uint64_t)&v52;
  if (v82)
  {
    uint64_t v35 = v81;
    sub_10000DD48((uint64_t)v78);
    uint64_t v36 = sub_100020430();
    swift_bridgeObjectRetain();
    unsigned __int8 v37 = sub_1000204B0();
    sub_100020240();
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    uint64_t v45 = v44;
    sub_100006D60(v35, v34, 0);
    uint64_t v46 = _swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_100006DC0(v35, v34, 0);
    swift_bridgeObjectRelease();
    uint64_t v47 = v37;
    uint64_t v48 = 0x4028000000000000;
    uint64_t v49 = 1;
  }
  else
  {
    sub_10000DD48((uint64_t)v78);
    uint64_t v36 = 0;
    uint64_t v49 = 0;
    uint64_t v35 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v39 = 0;
    uint64_t v41 = 0;
    uint64_t v43 = 0;
    uint64_t v45 = 0;
  }
  uint64_t v57 = v36;
  uint64_t v58 = 0;
  uint64_t v59 = v49;
  uint64_t v60 = v35;
  uint64_t v61 = v34;
  uint64_t v62 = 0;
  uint64_t v63 = v46;
  uint64_t v64 = v47;
  uint64_t v65 = v39;
  uint64_t v66 = v41;
  uint64_t v67 = v43;
  uint64_t v68 = v45;
  uint64_t v69 = 0;
  uint64_t v70 = v48;
  char v71 = 0;
  sub_1000061EC(&qword_100032E70);
  sub_1000061EC(&qword_100032E80);
  sub_1000061EC(&qword_100032EB0);
  sub_100006284();
  sub_10000D3A8();
  sub_10000D55C();
  sub_100020720();
  uint64_t v50 = v53;
  uint64_t v51 = v56;
  (*(void (**)(void *, char *, uint64_t))(v53 + 16))(v7, v5, v56);
  swift_storeEnumTagMultiPayload();
  sub_10000D2CC();
  sub_10000D318();
  sub_100020470();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v5, v51);
}

uint64_t sub_10000B158(uint64_t a1, const void *a2)
{
  swift_getKeyPath();
  uint64_t v3 = swift_allocObject();
  memcpy((void *)(v3 + 16), a2, 0x41uLL);
  swift_bridgeObjectRetain();
  sub_10000D168((uint64_t)a2);
  sub_1000061EC(&qword_100032EF0);
  sub_10000E9E0(&qword_100032EF8, &qword_100032EF0);
  sub_10000DC74(&qword_100032F00, &qword_100032F08);
  sub_10000DC1C();
  return sub_100020710();
}

__n128 sub_10000B284@<Q0>(void **a1@<X0>, const void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = swift_allocObject();
  memcpy((void *)(v6 + 16), a2, 0x41uLL);
  *(void *)(v6 + 88) = v5;
  id v7 = v5;
  sub_10000D168((uint64_t)a2);
  sub_1000061EC(&qword_100032F10);
  sub_100020670();
  __n128 result = v9;
  *(void *)a3 = v7;
  *(void *)(a3 + 8) = sub_10000DD34;
  *(void *)(a3 + 16) = v6;
  *(__n128 *)(a3 + 24) = v9;
  *(_OWORD *)(a3 + 40) = v10;
  *(unsigned char *)(a3 + 56) = v11;
  *(void *)(a3 + 64) = v12;
  return result;
}

uint64_t sub_10000B35C(uint64_t a1, void *a2)
{
  type metadata accessor for FocusConfigurationActionViewModel();
  sub_10000D10C((unint64_t *)&qword_100032DF8, (void (*)(uint64_t))type metadata accessor for FocusConfigurationActionViewModel);
  uint64_t v3 = (void *)sub_100020250();
  swift_retain();

  id v4 = a2;
  sub_100020190();

  return swift_release();
}

uint64_t sub_10000B460()
{
  return sub_100020690();
}

void sub_10000B4B4()
{
  type metadata accessor for FocusConfigurationActionViewModel();
  sub_10000D10C((unint64_t *)&qword_100032DF8, (void (*)(uint64_t))type metadata accessor for FocusConfigurationActionViewModel);
  id v0 = (id)sub_100020250();
  sub_100014724();
}

uint64_t sub_10000B560@<X0>(uint64_t a1@<X8>)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_10000905C(a1);
}

uint64_t sub_10000B5A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v4 = sub_100020030();
  uint64_t v45 = *(void *)(v4 - 8);
  uint64_t v46 = v4;
  __chkstk_darwin(v4);
  uint64_t v44 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_100020060();
  uint64_t v6 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  unint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100020050();
  uint64_t v9 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  char v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000061EC(&qword_100032F58);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v41 = v12;
  uint64_t v42 = v13;
  __chkstk_darwin(v12);
  unsigned __int8 v37 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_1000061EC(&qword_100032E88);
  __chkstk_darwin(v43);
  uint64_t v40 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000200A0();
  id v16 = *(void **)(v2 + 24);
  uint64_t v17 = *(void **)(v2 + 56);
  char v18 = *(unsigned char *)(v2 + 64);
  id v19 = a1;
  id v20 = v16;
  sub_10000CD94(v17, v18);
  sub_10000D5F4(v17, v18);
  sub_10000CE18(v17, v18);
  sub_100020090();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for ParameterLayoutMode.default(_:), v38);
  sub_100020040();
  uint64_t v21 = sub_10000D10C(&qword_100032E98, (void (*)(uint64_t))&type metadata accessor for ParameterRowView);
  uint64_t v22 = v37;
  uint64_t v23 = v39;
  sub_100020550();
  id v24 = v11;
  unint64_t v25 = v23;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v24, v23);
  unint64_t v48 = 0;
  unint64_t v49 = 0xE000000000000000;
  sub_100020A10(21);
  swift_bridgeObjectRelease();
  unint64_t v48 = 0xD000000000000013;
  unint64_t v49 = 0x8000000100028B90;
  id v26 = [v19 key];
  uint64_t v27 = sub_1000207E0();
  uint64_t v29 = v28;

  v50._countAndFlagsBits = v27;
  v50._object = v29;
  sub_100020830(v50);
  swift_bridgeObjectRelease();
  unint64_t v48 = v25;
  unint64_t v49 = v21;
  swift_getOpaqueTypeConformance2();
  uint64_t v31 = (uint64_t)v40;
  uint64_t v30 = v41;
  sub_1000205B0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v22, v30);
  uint64_t v33 = v44;
  uint64_t v32 = v45;
  uint64_t v34 = v46;
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v44, enum case for EditorPresentationEnvironment.focusFilter(_:), v46);
  sub_10000D450();
  sub_100020560();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  return sub_10000E7C0(v31, &qword_100032E88);
}

uint64_t sub_10000BAB4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v21[1] = a2;
  uint64_t v5 = sub_1000200C0();
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000061EC(&qword_100033028);
  uint64_t v9 = v8 - 8;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v21 - v13;
  id v15 = [a1 bundleIdentifier];
  sub_1000207E0();

  sub_1000200B0();
  swift_bridgeObjectRetain();
  sub_100020750();
  sub_100020280();
  sub_10000DEA8((uint64_t)v7, (uint64_t)v12, (void (*)(void))&type metadata accessor for FocusFilterConfigurationMasthead);
  id v16 = &v12[*(int *)(v9 + 44)];
  long long v17 = v23;
  *(_OWORD *)id v16 = v22;
  *((_OWORD *)v16 + 1) = v17;
  *((_OWORD *)v16 + 2) = v24;
  sub_10000DEFC((uint64_t)v7, (void (*)(void))&type metadata accessor for FocusFilterConfigurationMasthead);
  sub_100007AB4((uint64_t)v12, (uint64_t)v14, &qword_100033028);
  sub_10000E770((uint64_t)v14, (uint64_t)v12, &qword_100033028);
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 1;
  uint64_t v18 = sub_1000061EC(&qword_100033030);
  sub_10000E770((uint64_t)v12, a3 + *(int *)(v18 + 48), &qword_100033028);
  uint64_t v19 = a3 + *(int *)(v18 + 64);
  *(void *)uint64_t v19 = 0;
  *(unsigned char *)(v19 + 8) = 1;
  sub_10000E7C0((uint64_t)v14, &qword_100033028);
  return sub_10000E7C0((uint64_t)v12, &qword_100033028);
}

uint64_t sub_10000BCF4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000061EC(&qword_100032FF8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [a1 metadata];
  NSString v9 = [v8 title];

  if (v9)
  {
    id v10 = objc_msgSend(v9, "wf_localizedString");
  }
  else
  {
    uint64_t v20 = a2;
    sub_100020800();
    sub_100020800();
    if (qword_100032848 != -1) {
      swift_once();
    }
    uint64_t v11 = (void *)static NSBundle._current;
    NSString v12 = sub_1000207D0();
    NSString v13 = sub_1000207D0();
    swift_bridgeObjectRelease();
    NSString v9 = sub_1000207D0();
    swift_bridgeObjectRelease();
    id v10 = [v11 localizedStringForKey:v12 value:v13 table:v9];

    a2 = v20;
  }

  uint64_t v14 = sub_1000207E0();
  uint64_t v16 = v15;

  uint64_t v21 = v14;
  uint64_t v22 = v16;
  type metadata accessor for FocusConfigurationActionViewModel();
  sub_10000D10C((unint64_t *)&qword_100032DF8, (void (*)(uint64_t))type metadata accessor for FocusConfigurationActionViewModel);
  long long v17 = (void *)sub_100020250();
  sub_10001206C();

  sub_100006238();
  sub_1000206C0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
}

uint64_t sub_10000BFD8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100020100();
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000061EC(&qword_100033038);
  uint64_t v7 = __chkstk_darwin(v23);
  NSString v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  NSString v12 = (char *)&v22 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v22 - v13;
  id v15 = [a1 title];
  sub_1000207E0();

  id v16 = [a1 icon];
  if (v16) {
    sub_10000DF50(v16);
  }
  sub_10000C274();
  sub_1000200F0();
  sub_100020750();
  sub_100020280();
  sub_10000DEA8((uint64_t)v6, (uint64_t)v12, (void (*)(void))&type metadata accessor for FocusFilterSystemConfigurationMasthead);
  long long v17 = &v12[*(int *)(v23 + 36)];
  long long v18 = v25;
  *(_OWORD *)long long v17 = v24;
  *((_OWORD *)v17 + 1) = v18;
  *((_OWORD *)v17 + 2) = v26;
  sub_10000DEFC((uint64_t)v6, (void (*)(void))&type metadata accessor for FocusFilterSystemConfigurationMasthead);
  sub_100007AB4((uint64_t)v12, (uint64_t)v14, &qword_100033038);
  sub_10000E770((uint64_t)v14, (uint64_t)v9, &qword_100033038);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  uint64_t v19 = sub_1000061EC(&qword_100033040);
  sub_10000E770((uint64_t)v9, a2 + *(int *)(v19 + 48), &qword_100033038);
  uint64_t v20 = a2 + *(int *)(v19 + 64);
  *(void *)uint64_t v20 = 0;
  *(unsigned char *)(v20 + 8) = 1;
  sub_10000E7C0((uint64_t)v14, &qword_100033038);
  return sub_10000E7C0((uint64_t)v9, &qword_100033038);
}

uint64_t sub_10000C274()
{
  type metadata accessor for FocusConfigurationActionViewModel();
  sub_10000D10C((unint64_t *)&qword_100032DF8, (void (*)(uint64_t))type metadata accessor for FocusConfigurationActionViewModel);
  id v0 = (char *)sub_100020250();
  id v1 = *(id *)&v0[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request];

  id v2 = [v1 mastheadTintColor];
  if (v2)
  {
    return sub_1000205E0();
  }
  else
  {
    return sub_1000205D0();
  }
}

uint64_t sub_10000C370()
{
  sub_100020800();
  sub_100020800();
  if (qword_100032848 != -1) {
    swift_once();
  }
  id v0 = (void *)static NSBundle._current;
  NSString v1 = sub_1000207D0();
  NSString v2 = sub_1000207D0();
  swift_bridgeObjectRelease();
  NSString v3 = sub_1000207D0();
  swift_bridgeObjectRelease();
  id v4 = [v0 localizedStringForKey:v1 value:v2 table:v3];

  sub_1000207E0();
  type metadata accessor for FocusConfigurationActionViewModel();
  sub_10000D10C((unint64_t *)&qword_100032DF8, (void (*)(uint64_t))type metadata accessor for FocusConfigurationActionViewModel);
  uint64_t v5 = (void *)sub_100020250();
  sub_10001206C();

  sub_100006238();
  return sub_1000206C0();
}

uint64_t sub_10000C54C(uint64_t a1, const void *a2)
{
  uint64_t v5 = *(void *)(a1 + 8);
  swift_getKeyPath();
  uint64_t v3 = swift_allocObject();
  memcpy((void *)(v3 + 16), a2, 0x41uLL);
  sub_10000DDE8((uint64_t)&v5);
  sub_10000D168((uint64_t)a2);
  sub_1000061EC(&qword_100032DB0);
  sub_1000061EC(&qword_100032F38);
  sub_10000E9E0(&qword_100032F40, &qword_100032DB0);
  sub_10000DC74(&qword_100032F48, &qword_100032F50);
  sub_1000062F0(&qword_100032E88);
  sub_10000D450();
  swift_getOpaqueTypeConformance2();
  return sub_100020710();
}

uint64_t sub_10000C6C0@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000B5A4(*a1, a2);
}

uint64_t sub_10000C6E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t)v1;
  uint64_t v4 = sub_1000061EC(&qword_100033060);
  __chkstk_darwin(v4 - 8);
  sub_100007DEC();
  uint64_t v7 = v6 - v5;
  sub_1000061EC(&qword_100033068);
  sub_10000EA24();
  __chkstk_darwin(v8);
  sub_10000EA98();
  uint64_t v9 = sub_1000061EC(&qword_100033070);
  __chkstk_darwin(v9 - 8);
  sub_10000EA80();
  uint64_t v31 = sub_1000061EC(&qword_100033078);
  sub_100007DDC();
  __chkstk_darwin(v10);
  sub_100007DEC();
  uint64_t v13 = v12 - v11;
  uint64_t v32 = sub_1000061EC(&qword_100033080);
  sub_100007DDC();
  __chkstk_darwin(v14);
  sub_100007DEC();
  uint64_t v17 = v16 - v15;
  id v18 = *v1;
  id v19 = [*v1 localizedTitle];
  sub_1000207E0();

  if ([v18 isDestructive]) {
    sub_100020210();
  }
  else {
    sub_100020220();
  }
  uint64_t v20 = sub_100020230();
  sub_100006BE4(v7, 0, 1, v20);
  uint64_t v21 = swift_allocObject();
  sub_10000EA3C(v21);
  sub_10000E6A8((uint64_t)v1);
  sub_100006238();
  sub_1000206B0();
  sub_100020760();
  sub_100007FB4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v2, 0.0, 1, 0.0, 1);
  sub_10000EA74();
  v22();
  uint64_t v23 = swift_allocObject();
  sub_10000EA3C(v23);
  sub_10000E6A8((uint64_t)v1);
  uint64_t v24 = sub_100020750();
  long long v26 = v25;
  sub_10000E770(v2, v13, &qword_100033070);
  uint64_t v27 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v13 + *(int *)(v31 + 36));
  void *v27 = sub_10000E70C;
  v27[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v18;
  v27[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v24;
  v27[3] = v26;
  sub_10000E7C0(v2, &qword_100033070);
  uint64_t v28 = swift_allocObject();
  sub_10000EA3C(v28);
  sub_10000E770(v13, v17, &qword_100033078);
  uint64_t v29 = (void *)(v17 + *(int *)(v32 + 36));
  *uint64_t v29 = 0;
  v29[1] = 0;
  v29[2] = sub_10000E768;
  v29[3] = v18;
  sub_10000E6A8(v3);
  sub_10000E7C0(v13, &qword_100033078);
  return sub_100007AB4(v17, a1, &qword_100033080);
}

uint64_t sub_10000CA8C(uint64_t result)
{
  NSString v1 = *(void (**)(uint64_t))(result + 8);
  if (v1)
  {
    swift_retain();
    sub_1000061EC(&qword_100033088);
    uint64_t v2 = sub_100020680();
    if ((v3 & 1) == 0) {
      v1(v2);
    }
    return sub_10000E810((uint64_t)v1);
  }
  return result;
}

uint64_t sub_10000CB20@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_100020480();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020490();
  sub_100020290();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  long long v16 = *(_OWORD *)(a1 + 40);
  long long v20 = *(_OWORD *)(a1 + 24);
  long long v21 = v16;
  long long v22 = *(_OWORD *)(a1 + 56);
  v18[1] = v9;
  v18[2] = v11;
  v18[3] = v13;
  v18[4] = v15;
  char v19 = 0;
  sub_1000061EC(&qword_100033088);
  sub_100020690();
  uint64_t result = sub_1000205F0();
  *a2 = result;
  return result;
}

uint64_t sub_10000CC70()
{
  return sub_100020690();
}

uint64_t sub_10000CCD4@<X0>(uint64_t a1@<X8>)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_10000C6E8(a1);
}

uint64_t sub_10000CD18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000202F0();
  *a1 = result;
  return result;
}

uint64_t sub_10000CD44()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10000CD7C()
{
  return *(id *)(v0 + 16);
}

id sub_10000CD84(uint64_t a1, void *a2, char a3)
{
  if (a3) {
    return a2;
  }
  else {
    return (id)swift_retain();
  }
}

id sub_10000CD94(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

void sub_10000CDA0(uint64_t a1)
{
  sub_10000CE08(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 56);
  char v3 = *(unsigned char *)(a1 + 64);
  sub_10000CE18(v2, v3);
}

uint64_t sub_10000CE08(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return _objc_release_x1();
  }
  else {
    return swift_release();
  }
}

void sub_10000CE18(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t sub_10000CE24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void **)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_10000CD84(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = *(void **)(v2 + 24);
  uint64_t v8 = *(void *)(v2 + 32);
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  uint64_t v9 = *(void *)(v2 + 48);
  *(void *)(a1 + 40) = *(void *)(v2 + 40);
  *(void *)(a1 + 48) = v9;
  uint64_t v10 = *(void **)(v2 + 56);
  LOBYTE(v2) = *(unsigned char *)(v2 + 64);
  id v11 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000CD94(v10, v2);
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v2;
  return a1;
}

uint64_t sub_10000CEC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void **)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  sub_10000CD84(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_10000CE08(v7, v8, v9);
  uint64_t v10 = *(void **)(v2 + 24);
  id v11 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v10;
  id v12 = v10;

  *(void *)(a1 + 32) = *(void *)(v2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(v2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(v2 + 48);
  swift_retain();
  swift_release();
  uint64_t v13 = *(void **)(v2 + 56);
  LOBYTE(v2) = *(unsigned char *)(v2 + 64);
  sub_10000CD94(v13, v2);
  uint64_t v14 = *(void **)(a1 + 56);
  char v15 = *(unsigned char *)(a1 + 64);
  *(void *)(a1 + 56) = v13;
  *(unsigned char *)(a1 + 64) = v2;
  sub_10000CE18(v14, v15);
  return a1;
}

void *sub_10000CFAC(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x41uLL);
}

uint64_t sub_10000CFB4(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_10000CE08(v5, v6, v7);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  char v8 = *(unsigned char *)(a2 + 64);
  char v9 = *(void **)(a1 + 56);
  char v10 = *(unsigned char *)(a1 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = v8;
  sub_10000CE18(v9, v10);
  return a1;
}

uint64_t sub_10000D048(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 65))
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

uint64_t sub_10000D088(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for FocusConfigurationUIView()
{
}

uint64_t sub_10000D0E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D104@<X0>(uint64_t a1@<X8>)
{
  return sub_1000095E0(*(const void **)(v1 + 16), a1);
}

uint64_t sub_10000D10C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000D160()
{
  return sub_10000B460();
}

uint64_t sub_10000D168(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 24);
  char v3 = *(void **)(a1 + 56);
  char v4 = *(unsigned char *)(a1 + 64);
  sub_10000CD84(*(void *)a1, *(void **)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_retain();
  id v5 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000CD94(v3, v4);
  return a1;
}

void sub_10000D1F0()
{
}

void sub_10000D1FC(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
}

unint64_t sub_10000D204()
{
  unint64_t result = qword_100032E40;
  if (!qword_100032E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032E40);
  }
  return result;
}

unint64_t sub_10000D250()
{
  unint64_t result = qword_100032E48;
  if (!qword_100032E48)
  {
    sub_1000062F0(&qword_100032E30);
    sub_10000D2CC();
    sub_10000D318();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032E48);
  }
  return result;
}

unint64_t sub_10000D2CC()
{
  unint64_t result = qword_100032E50;
  if (!qword_100032E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032E50);
  }
  return result;
}

unint64_t sub_10000D318()
{
  unint64_t result = qword_100032E58;
  if (!qword_100032E58)
  {
    sub_1000062F0((uint64_t *)&unk_100032E60);
    sub_100006284();
    sub_10000D3A8();
    sub_10000D55C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032E58);
  }
  return result;
}

unint64_t sub_10000D3A8()
{
  unint64_t result = qword_100032E78;
  if (!qword_100032E78)
  {
    sub_1000062F0(&qword_100032E80);
    sub_1000062F0(&qword_100032E88);
    sub_10000D450();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032E78);
  }
  return result;
}

unint64_t sub_10000D450()
{
  unint64_t result = qword_100032E90;
  if (!qword_100032E90)
  {
    sub_1000062F0(&qword_100032E88);
    sub_100020050();
    sub_10000D10C(&qword_100032E98, (void (*)(uint64_t))&type metadata accessor for ParameterRowView);
    swift_getOpaqueTypeConformance2();
    sub_10000D10C(&qword_100032EA0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032E90);
  }
  return result;
}

unint64_t sub_10000D55C()
{
  unint64_t result = qword_100032EA8;
  if (!qword_100032EA8)
  {
    sub_1000062F0(&qword_100032EB0);
    sub_10000E9E0(&qword_100032EB8, &qword_100032EC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032EA8);
  }
  return result;
}

uint64_t sub_10000D5F4(void *a1, char a2)
{
  uint64_t v4 = sub_1000203D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v14 = a1;
  }
  else
  {
    swift_retain();
    os_log_type_t v8 = sub_100020970();
    char v9 = sub_1000204A0();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)id v11 = 136315138;
      v16[1] = v11 + 4;
      sub_1000061EC(&qword_100032F30);
      uint64_t v12 = sub_100020BC0();
      v16[2] = sub_100017A54(v12, v13, &v17);
      sub_1000209D0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_1000203C0();
    swift_getAtKeyPath();
    sub_10000CE18(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v17;
  }
  return (uint64_t)a1;
}

char *sub_10000D814()
{
  uint64_t v1 = *v0;
  unint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!result)
  {
    unint64_t result = sub_10000D8CC(result, *(void *)(v1 + 16) + 1, 1, v1);
    *uint64_t v0 = (uint64_t)result;
  }
  return result;
}

char *sub_10000D860(char *result)
{
  unint64_t v2 = *(void *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    unint64_t result = sub_10000D8CC((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *uint64_t v1 = (uint64_t)result;
  }
  return result;
}

uint64_t sub_10000D8A0(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (result + 1 > (uint64_t)(v2 >> 1)) {
    return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v2 > 1);
  }
  return result;
}

char *sub_10000D8CC(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000061EC((uint64_t *)&unk_100032F60);
    os_log_type_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    os_log_type_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_100017738((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_10000D9C4(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_10000D9C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_100020B20();
  __break(1u);
  return result;
}

uint64_t sub_10000DAC4(void *a1)
{
  id v1 = [a1 localizedFocusFilterDescription];
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = sub_1000207E0();

  return v3;
}

uint64_t sub_10000DB28(void *a1)
{
  id v2 = [a1 footerButtons];

  if (!v2) {
    return 0;
  }
  sub_100007924(0, &qword_100032F08);
  uint64_t v3 = sub_100020890();

  return v3;
}

uint64_t sub_10000DBA0()
{
  return sub_10000B158(*(void *)(v0 + 16), *(const void **)(v0 + 24));
}

unint64_t sub_10000DBA8()
{
  unint64_t result = qword_100032EE0;
  if (!qword_100032EE0)
  {
    sub_1000062F0(&qword_100032ED8);
    sub_10000DC1C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032EE0);
  }
  return result;
}

unint64_t sub_10000DC1C()
{
  unint64_t result = qword_100032EE8;
  if (!qword_100032EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032EE8);
  }
  return result;
}

double sub_10000DC6C@<D0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&double result = sub_10000B284(a1, (const void *)(v2 + 16), a2).n128_u64[0];
  return result;
}

uint64_t sub_10000DC74(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007924(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000DCC4()
{
  sub_10000CE08(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000CE18(*(id *)(v0 + 72), *(unsigned char *)(v0 + 80));

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_10000DD34()
{
  return sub_10000B35C(v0 + 16, *(void **)(v0 + 88));
}

uint64_t sub_10000DD40()
{
  return sub_10000C54C(*(void *)(v0 + 16), *(const void **)(v0 + 24));
}

uint64_t sub_10000DD48(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000DD78()
{
  sub_10000CE08(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000CE18(*(id *)(v0 + 72), *(unsigned char *)(v0 + 80));
  return _swift_deallocObject(v0, 81, 7);
}

uint64_t sub_10000DDE0@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000C6C0(a1, a2);
}

uint64_t sub_10000DDE8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000DE14(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void **)(a1 + 56);
  char v4 = *(unsigned char *)(a1 + 64);
  sub_10000CE08(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  sub_10000CE18(v3, v4);
  return a1;
}

uint64_t sub_10000DE98()
{
  return sub_10000C370();
}

uint64_t sub_10000DEA0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BCF4(*(void **)(v1 + 16), a1);
}

uint64_t sub_10000DEA8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100007DDC();
  uint64_t v4 = sub_10000EACC();
  v5(v4);
  return a2;
}

uint64_t sub_10000DEFC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_100007DDC();
  sub_10000EA74();
  v3();
  return a1;
}

uint64_t sub_10000DF50(void *a1)
{
  id v2 = [a1 systemName];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1000207E0();

  return v3;
}

uint64_t sub_10000DFC0(uint64_t a1)
{
  if (*(void *)(a1 + 8)) {
    swift_release();
  }
  return swift_release();
}

uint64_t sub_10000E00C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  unint64_t v5 = (_OWORD *)(a1 + 8);
  uint64_t v7 = (_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 8);
  id v8 = v4;
  if (v6)
  {
    uint64_t v9 = *(void *)(a2 + 16);
    *(void *)(a1 + 8) = v6;
    *(void *)(a1 + 16) = v9;
    swift_retain();
  }
  else
  {
    *unint64_t v5 = *v7;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  return a1;
}

uint64_t sub_10000E09C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  unint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 8);
  if (!*(void *)(a1 + 8))
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a2 + 16);
      *(void *)(a1 + 8) = v7;
      *(void *)(a1 + 16) = v9;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    goto LABEL_8;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v8 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  swift_retain();
  swift_release();
LABEL_8:
  long long v10 = *(_OWORD *)(a2 + 24);
  long long v11 = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v11;
  *(_OWORD *)(a1 + 24) = v10;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  return a1;
}

void *sub_10000E168(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t sub_10000E170(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 8);
  if (!*(void *)(a1 + 8))
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 16);
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v7;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  swift_release();
LABEL_8:
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  return a1;
}

uint64_t sub_10000E224(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 72))
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

uint64_t sub_10000E264(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ConfigurationFooterButton()
{
}

uint64_t sub_10000E2C0(id *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_10000E30C(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v6;
  id v7 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10000E36C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 sub_10000E408(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_10000E41C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000E47C(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 48))
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

uint64_t sub_10000E4BC(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ConfigurationSection()
{
}

unint64_t sub_10000E518()
{
  unint64_t result = qword_100033048;
  if (!qword_100033048)
  {
    sub_1000062F0(&qword_100032E00);
    sub_10000E9E0(&qword_100033050, &qword_100032DD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033048);
  }
  return result;
}

uint64_t sub_10000E5B8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000E5D8()
{
  unint64_t result = qword_100033058;
  if (!qword_100033058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033058);
  }
  return result;
}

void sub_10000E624(uint64_t a1, uint64_t a2)
{
  Swift::UInt v3 = *(void *)(a2 + 16);
  sub_100020BA0(v3);
  if (v3)
  {
    uint64_t v4 = a2 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_100020810();
      swift_bridgeObjectRelease();
      v4 += 16;
      --v3;
    }
    while (v3);
  }
}

uint64_t sub_10000E6A0()
{
  return sub_10000CA8C(v0 + 16);
}

uint64_t sub_10000E6A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  id v3 = *(id *)a1;
  sub_10000E6F8(v2);
  swift_retain();
  return a1;
}

uint64_t sub_10000E6F8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000E70C@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000CB20(v1 + 16, a1);
}

uint64_t sub_10000E718()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  swift_release();
  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_10000E768()
{
  return sub_10000CC70();
}

uint64_t sub_10000E770(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000061EC(a3);
  sub_100007DDC();
  uint64_t v4 = sub_10000EACC();
  v5(v4);
  return a2;
}

uint64_t sub_10000E7C0(uint64_t a1, uint64_t *a2)
{
  sub_1000061EC(a2);
  sub_100007DDC();
  sub_10000EA74();
  v3();
  return a1;
}

uint64_t sub_10000E810(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_10000E824()
{
  unint64_t result = qword_100033090;
  if (!qword_100033090)
  {
    sub_1000062F0(&qword_100033080);
    sub_10000E8A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033090);
  }
  return result;
}

unint64_t sub_10000E8A0()
{
  unint64_t result = qword_100033098;
  if (!qword_100033098)
  {
    sub_1000062F0(&qword_100033078);
    sub_10000E940();
    sub_10000E9E0(&qword_1000330B0, &qword_1000330B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033098);
  }
  return result;
}

unint64_t sub_10000E940()
{
  unint64_t result = qword_1000330A0;
  if (!qword_1000330A0)
  {
    sub_1000062F0(&qword_100033070);
    sub_10000E9E0(&qword_1000330A8, &qword_100033068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000330A0);
  }
  return result;
}

uint64_t sub_10000E9E0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000062F0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_10000EA3C(uint64_t a1)
{
  id v3 = (void *)(a1 + 16);
  return memcpy(v3, v1, 0x48uLL);
}

uint64_t sub_10000EA5C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000EACC()
{
  return v0;
}

unint64_t StaticString._asString.getter(unint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    if (result) {
      return sub_100020800();
    }
    __break(1u);
  }
  if (HIDWORD(result))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return sub_100020800();
  }
  if (result >> 11 == 27) {
    goto LABEL_14;
  }
  if (WORD1(result) > 0x10u) {
    goto LABEL_11;
  }
  if ((result & 0xFFFFFF80) != 0 || result <= 0xFF) {
    return sub_100020800();
  }
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t *NSBundle._current.unsafeMutableAddressor()
{
  if (qword_100032848 != -1) {
    swift_once();
  }
  return &static NSBundle._current;
}

id sub_10000EC3C()
{
  _s2__CMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  static NSBundle._current = (uint64_t)result;
  return result;
}

id static NSBundle._current.getter()
{
  if (qword_100032848 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static NSBundle._current;
  return v0;
}

uint64_t sub_10000ECF0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t _s2__CMa()
{
  return self;
}

uint64_t sub_10000ED24(void *a1)
{
  uint64_t v2 = v1;
  self;
  sub_100019948();
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (!v4) {
    return sub_100019028(a1, (SEL *)&selRef_localizedDescription);
  }
  uint64_t v5 = (void *)v4;
  id v6 = v2;
  NSString v7 = [a1 key];
  if (!v7)
  {
    sub_1000207E0();
    NSString v7 = sub_1000207D0();
    swift_bridgeObjectRelease();
  }
  id v8 = [v5 parameterMetadataForIdentifier:v7];

  if (!v8)
  {

    return sub_100019028(a1, (SEL *)&selRef_localizedDescription);
  }
  id v9 = [v8 parameterDescription];
  long long v10 = v9;
  if (v9)
  {
    id v11 = objc_msgSend(v9, "wf_localizedString");

    uint64_t v12 = sub_1000207E0();
    unint64_t v14 = v13;

    uint64_t v15 = HIBYTE(v14) & 0xF;
    if ((v14 & 0x2000000000000000) == 0) {
      uint64_t v15 = v12 & 0xFFFFFFFFFFFFLL;
    }
    if (!v15)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {

    return 0;
  }
  return v12;
}

id sub_10000EE94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)((unint64_t)a1 >> 62);
  if ((unint64_t)a1 >> 62)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100020AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100020AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v5 != v6) {
    goto LABEL_25;
  }
  if (!v5) {
    goto LABEL_24;
  }
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
  if (a1 < 0) {
    uint64_t v7 = a1;
  }
  if (!v4) {
    uint64_t v7 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v8 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v9 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v8 = a2;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v9 = v8;
  }
  if (v7 == v9)
  {
LABEL_24:
    char v14 = 1;
    return (id)(v14 & 1);
  }
  if (v5 < 0) {
    goto LABEL_43;
  }
  unint64_t v20 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
LABEL_44:
  }
    id result = (id)sub_100020A30();
  else {
    id result = *(id *)(a1 + 32);
  }
  uint64_t v4 = result;
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v11 = (id)sub_100020A30();
LABEL_22:
    uint64_t v12 = v11;
    sub_100007924(0, &qword_100032F50);
    char v13 = sub_1000209A0();

    if (v13)
    {
      if (v5 != 1)
      {
        uint64_t v15 = 5;
        while (1)
        {
          if (v15 - 4 >= v5)
          {
            __break(1u);
            goto LABEL_40;
          }
          if (v20) {
            id v16 = (id)sub_100020A30();
          }
          else {
            id v16 = *(id *)(a1 + 8 * v15);
          }
          uint64_t v4 = v16;
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v17 = (id)sub_100020A30();
          }
          else
          {
            if ((unint64_t)(v15 - 4) >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_43:
              __break(1u);
              goto LABEL_44;
            }
            id v17 = *(id *)(a2 + 8 * v15);
          }
          id v18 = v17;
          char v14 = sub_1000209A0();

          if (v14)
          {
            uint64_t v19 = 2 - v5 + v15++;
            if (v19 != 5) {
              continue;
            }
          }
          return (id)(v14 & 1);
        }
      }
      goto LABEL_24;
    }
LABEL_25:
    char v14 = 0;
    return (id)(v14 & 1);
  }
  if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v11 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

char *sub_10000F0F0(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (!v2) {
      return (char *)_swiftEmptyArrayStorage;
    }
    id result = sub_10001820C(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_100020A30();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = [v5 identifier];
      uint64_t v8 = sub_1000207E0();
      uint64_t v10 = v9;

      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_10001820C((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v4;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      char v13 = &_swiftEmptyArrayStorage[2 * v12];
      v13[4] = v8;
      v13[5] = v10;
      if (v2 == v4) {
        return (char *)_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100020AF0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_10001841C(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

void *sub_10000F2B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_10001841C(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void **)(*(void *)(a3 + 56) + 8 * v4);
  id v7 = v6;
  return v6;
}

uint64_t sub_10000F2FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_10001841C(a1, a2), (v3 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_10000F340@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100012228();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000F370()
{
  return sub_100011CEC();
}

uint64_t sub_10000F398(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = 0;
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a2;
  *(unsigned char *)(v6 + 48) = a3;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  *(unsigned char *)(v7 + 48) = a3;
  swift_retain_n();
  swift_retain_n();
  sub_100020700();
  return v9;
}

BOOL sub_10000F480(char a1, char a2)
{
  return a1 == a2;
}

void sub_10000F490(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_10000F4B8(unsigned __int8 a1)
{
  return sub_100020BB0();
}

BOOL sub_10000F500(char *a1, char *a2)
{
  return sub_10000F480(*a1, *a2);
}

Swift::Int sub_10000F50C()
{
  return sub_10000F4B8(*v0);
}

void sub_10000F514(uint64_t a1)
{
  sub_10000F490(a1, *v1);
}

Swift::Int sub_10000F51C()
{
  Swift::UInt v1 = *v0;
  sub_100020B90();
  sub_100020BA0(v1);
  return sub_100020BB0();
}

uint64_t sub_10000F570()
{
  sub_100019694();
  v1[7] = v2;
  v1[8] = v0;
  sub_100020900();
  v1[9] = sub_100019910();
  uint64_t v4 = sub_10001996C();
  v1[10] = v4;
  v1[11] = v3;
  return _swift_task_switch(sub_10000F5F4, v4, v3);
}

uint64_t sub_10000F5F4()
{
  sub_1000196A0();
  Swift::UInt v1 = (char *)v0[8];
  uint64_t v2 = OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_onConfigurationStateChange;
  v0[12] = OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_onConfigurationStateChange;
  sub_1000061EC(&qword_100033298);
  swift_allocObject();
  uint64_t v3 = v1;
  *(void *)&v1[v2] = sub_1000201A0();
  uint64_t v4 = OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_onConfigurableParametersChange;
  v0[13] = OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_onConfigurableParametersChange;
  sub_1000061EC(&qword_1000332A0);
  swift_allocObject();
  *(void *)&v3[v4] = sub_1000201A0();
  uint64_t v5 = OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_onConfigurationButtonTapped;
  v0[14] = OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_onConfigurationButtonTapped;
  sub_1000061EC(&qword_1000332A8);
  swift_allocObject();
  *(void *)&v3[v5] = sub_1000201A0();
  v0[15] = type metadata accessor for FocusConfigurationActionViewModel();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[16] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_10000F738;
  return sub_10000FD48();
}

uint64_t sub_10000F738()
{
  sub_1000196A0();
  uint64_t v3 = v2;
  sub_100019600();
  uint64_t v5 = v4;
  sub_100019654();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  sub_100019654();
  *uint64_t v8 = v7;
  v5[17] = v3;
  v5[18] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v9 = v5[10];
    uint64_t v10 = v5[11];
    return _swift_task_switch(sub_10000FC64, v9, v10);
  }
  else
  {
    unint64_t v11 = (void *)swift_task_alloc();
    v5[19] = v11;
    *unint64_t v11 = v7;
    v11[1] = sub_10000F884;
    return sub_100010154();
  }
}

uint64_t sub_10000F884()
{
  sub_100019694();
  uint64_t v1 = *v0;
  sub_100019654();
  *uint64_t v3 = v2;
  uint64_t v4 = *v0;
  sub_100019654();
  *uint64_t v5 = v4;
  *(void *)(v7 + 160) = v6;
  swift_task_dealloc();
  uint64_t v8 = *(void *)(v1 + 88);
  uint64_t v9 = *(void *)(v1 + 80);
  return _swift_task_switch(sub_10000F9A0, v9, v8);
}

void sub_10000F9A0()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void **)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void **)(v0 + 56);
  swift_release();
  *(void *)(v3 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request) = v4;
  *(void *)(v3 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_action) = v2;
  *(void *)(v3 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_options) = v1;
  id v5 = v4;
  id v6 = [v2 visibleParametersWithProcessing:0];
  sub_100007924(0, &qword_100032F50);
  unint64_t v7 = sub_100020890();

  id v8 = v5;
  *(void *)(v3 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_configurableParameter) = sub_10001198C(v7, v8);
  unsigned int v9 = [v8 showsEnablementButton];
  unsigned __int8 v10 = 1;
  if (v9) {
    unsigned __int8 v10 = [*(id *)(v0 + 56) isEnabled];
  }
  uint64_t v11 = *(void **)(v0 + 136);
  uint64_t v12 = *(void *)(v0 + 120);
  uint64_t v13 = *(unsigned char **)(v0 + 64);
  v13[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_isEnabled] = v10;
  swift_beginAccess();
  *(unsigned char *)(v0 + 168) = 1;
  sub_1000201C0();
  swift_endAccess();

  *(void *)(v0 + 40) = v13;
  *(void *)(v0 + 48) = v12;
  id v14 = objc_msgSendSuper2((objc_super *)(v0 + 40), "init");
  [v11 addEventObserver:v14];
  id v15 = [v11 parameters];
  unint64_t v16 = sub_100020890();

  if (v16 >> 62)
  {
    sub_1000198CC();
    uint64_t v17 = sub_100020AF0();
    swift_bridgeObjectRelease();
    if (!v17) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v17) {
      goto LABEL_11;
    }
  }
  if (v17 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v17; ++i)
  {
    if ((v16 & 0xC000000000000001) != 0) {
      id v19 = (id)sub_100020A30();
    }
    else {
      id v19 = *(id *)(v16 + 8 * i + 32);
    }
    unint64_t v20 = v19;
    [v19 addEventObserver:v14];
  }
LABEL_11:
  long long v21 = *(void **)(v0 + 136);

  swift_bridgeObjectRelease();
  uint64_t v22 = sub_100019724();
  v23(v22);
}

uint64_t sub_10000FC64()
{
  uint64_t v1 = *(void **)(v0 + 64);

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  sub_1000198EC();
  swift_deallocPartialClassInstance();
  sub_1000196EC();
  return v2();
}

uint64_t sub_10000FD48()
{
  sub_100019694();
  v1[2] = v2;
  v1[3] = v0;
  sub_100020900();
  v1[4] = sub_100019910();
  uint64_t v4 = sub_10001996C();
  v1[5] = v4;
  v1[6] = v3;
  return _swift_task_switch(sub_10000FDCC, v4, v3);
}

uint64_t sub_10000FDCC()
{
  id v1 = [*(id *)(v0 + 16) mode];
  if (v1 == (id)1)
  {
    unsigned __int8 v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v10;
    *unsigned __int8 v10 = v0;
    v10[1] = sub_10000FFA0;
    uint64_t v11 = *(void *)(v0 + 16);
    return sub_100016C4C(v11);
  }
  else
  {
    if (v1)
    {
      swift_release();
    }
    else
    {
      uint64_t v2 = *(void **)(v0 + 16);
      swift_release();
      id v3 = [v2 actionIdentifier];
      if (v3)
      {
        uint64_t v4 = v3;
        id v5 = [*(id *)(v0 + 16) action];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = sub_1000155B4(v4, v5);

          sub_100019874();
          return v8(v7);
        }
      }
    }
    sub_100018FDC();
    sub_1000197B0();
    *uint64_t v12 = 0;
    swift_willThrow();
    sub_1000196EC();
    return v13();
  }
}

uint64_t sub_10000FFA0()
{
  sub_1000196A0();
  uint64_t v3 = v2;
  sub_100019600();
  id v5 = v4;
  sub_100019654();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  sub_100019654();
  *id v8 = v7;
  v5[8] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v9 = v5[5];
    uint64_t v10 = v5[6];
    uint64_t v11 = sub_1000100F8;
  }
  else
  {
    v5[9] = v3;
    uint64_t v9 = v5[5];
    uint64_t v10 = v5[6];
    uint64_t v11 = sub_100010098;
  }
  return _swift_task_switch(v11, v9, v10);
}

uint64_t sub_100010098()
{
  sub_100019694();
  swift_release();
  sub_100019874();
  return v0();
}

uint64_t sub_1000100F8()
{
  sub_100019694();
  swift_release();
  sub_1000196EC();
  return v0();
}

uint64_t sub_100010154()
{
  sub_100019694();
  v0[17] = v1;
  sub_100020900();
  v0[18] = sub_100019910();
  uint64_t v3 = sub_10001996C();
  v0[19] = v3;
  v0[20] = v2;
  return _swift_task_switch(sub_1000101D8, v3, v2);
}

uint64_t sub_1000101D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_1000196F8();
  sub_100019880();
  id v15 = [*(id *)(v14 + 136) parameters];
  sub_100007924(0, &qword_100032F50);
  unint64_t v16 = sub_100020890();

  uint64_t v81 = _swiftEmptyArrayStorage;
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100020AF0();
    uint64_t v17 = swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v18)
    {
LABEL_3:
      if (v18 < 1)
      {
LABEL_71:
        __break(1u);
        return _swift_continuation_await(v17);
      }
      for (uint64_t i = 0; i != v18; ++i)
      {
        if ((v16 & 0xC000000000000001) != 0) {
          id v20 = (id)sub_100020A30();
        }
        else {
          id v20 = *(id *)(v16 + 8 * i + 32);
        }
        long long v21 = v20;
        self;
        if (swift_dynamicCastObjCClass())
        {
          sub_100020A50();
          sub_100020A70();
          sub_100020A80();
          sub_100020A60();
        }
        else
        {
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  *(void *)(v14 + 168) = _swiftEmptyArrayStorage;
  *(void *)(v14 + 176) = sub_1000061EC(&qword_1000332C8);
  uint64_t v22 = (void *)sub_1000207C0();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0
    || ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0)
  {
LABEL_69:
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_100020AF0();
    swift_release();
  }
  else
  {
    uint64_t v23 = _swiftEmptyArrayStorage[2];
  }
  *(void *)(v14 + 184) = v23;
  if (!v23)
  {
LABEL_58:
    swift_release();
    swift_release();
    sub_100019774();
    sub_100019678();
    return v71(v69, v70, v71, v72, v73, v74, v75, v76, a9, a10, v81, a12, a13, a14);
  }
  uint64_t v24 = 0;
  long long v25 = (void *)(v14 + 80);
  a9 = v14 + 80;
  a10 = (void *)(v14 + 120);
  while (1)
  {
    sub_10001974C();
    if (v27) {
      id v28 = *(id *)(v26 + 8 * v24 + 32);
    }
    else {
      id v28 = (id)sub_100020A30();
    }
    id v29 = v28;
    *(void *)(v14 + 200) = v28;
    *(void *)(v14 + 208) = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    id v30 = [v28 key];
    uint64_t v24 = sub_1000207E0();
    uint64_t v32 = v31;

    *(void *)(v14 + 216) = v24;
    *(void *)(v14 + 224) = v32;
    self;
    uint64_t v33 = sub_100019954();
    uint64_t v34 = *(void **)(v14 + 136);
    if (!v33)
    {
      id v42 = v29;
      id v43 = v34;
      goto LABEL_30;
    }
    uint64_t v35 = (void *)v33;
    *a10 = &OBJC_PROTOCOL___WFDynamicEnumerationDataSource;
    uint64_t v36 = (void *)swift_dynamicCastObjCProtocolConditional();
    id v37 = v29;
    id v38 = v34;
    if (!v36) {
      goto LABEL_30;
    }
    uint64_t v39 = *(void **)(v14 + 136);
    id v40 = v37;
    id v41 = v39;
    if (objc_msgSend(v35, "wf_supportsSearch"))
    {

      long long v25 = (void *)(v14 + 80);
      goto LABEL_30;
    }
    long long v25 = (void *)(v14 + 80);
    if ([v36 respondsToSelector:"loadPossibleStatesForEnumeration:searchTerm:completionHandler:"])break; {

    }
LABEL_30:
    self;
    uint64_t v44 = sub_100019954();
    if (!v44)
    {
      unint64_t v49 = *(void **)(v14 + 136);
LABEL_38:

      swift_bridgeObjectRelease();
      goto LABEL_53;
    }
    uint64_t v45 = (void *)v44;
    id v29 = v29;
    unint64_t v46 = sub_100018F78(v45);
    if (!v46)
    {
      unint64_t v49 = *(void **)(v14 + 136);

      goto LABEL_38;
    }
    if (v46 >> 62) {
      uint64_t v47 = sub_100020AF0();
    }
    else {
      uint64_t v47 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v47 <= 10)
    {
      id v50 = objc_allocWithZone((Class)INObjectCollection);
      sub_1000061EC(&qword_1000332D0);
      Class isa = sub_100020880().super.isa;
      swift_bridgeObjectRelease();
      id v52 = [v50 initWithItems:isa];

      if (v52)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *long long v25 = v22;
        sub_1000197C8();
        sub_100019714();
        if (v56) {
          goto LABEL_68;
        }
        unint64_t v57 = v54;
        char v58 = v55;
        sub_1000061EC(&qword_1000332D8);
        if (sub_100020AA0(isUniquelyReferenced_nonNull_native, (Swift::Int)v22))
        {
          unint64_t v59 = sub_1000197C8();
          if ((v58 & 1) != (v60 & 1))
          {
            sub_100019678();
            return sub_100020B40();
          }
          unint64_t v57 = v59;
        }
        uint64_t v22 = (void *)*v25;
        if (v58)
        {
          uint64_t v61 = v22[7];

          *(void *)(v61 + 8 * v57) = v52;
        }
        else
        {
          sub_100019618();
          if (v56)
          {
            __break(1u);
            goto LABEL_71;
          }
          _OWORD v22[2] = v68;
          swift_bridgeObjectRetain();
        }
        unint64_t v49 = *(void **)(v14 + 136);
        swift_bridgeObjectRelease();
LABEL_52:
        swift_bridgeObjectRelease();

LABEL_53:
        goto LABEL_54;
      }
      swift_bridgeObjectRetain();
      unint64_t v62 = sub_1000197C8();
      char v64 = v63;
      swift_bridgeObjectRelease();
      if ((v64 & 1) == 0)
      {
        unint64_t v49 = *(void **)(v14 + 136);
        goto LABEL_52;
      }
      uint64_t v65 = *(void **)(v14 + 136);
      uint64_t v24 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v81 = v22;
      Swift::Int v66 = v22[3];
      sub_1000061EC(&qword_1000332D8);
      sub_100020AA0(v24, v66);
      swift_bridgeObjectRelease();
      uint64_t v67 = *(void **)(v22[7] + 8 * v62);
      sub_100020AC0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      long long v25 = (void *)(v14 + 80);
    }
    else
    {
      unint64_t v48 = *(void **)(v14 + 136);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
LABEL_54:
    sub_100019804();
    if (v27) {
      goto LABEL_58;
    }
  }
  *(void *)(v14 + 16) = v14;
  *(void *)(v14 + 56) = v14 + 128;
  *(void *)(v14 + 24) = sub_1000108B4;
  uint64_t v78 = sub_1000198F8();
  *(void *)(v14 + 80) = _NSConcreteStackBlock;
  *(void *)(v14 + 88) = 0x40000000;
  *(void *)(v14 + 96) = sub_100013BB8;
  *(void *)(v14 + 104) = &unk_10002D908;
  *(void *)(v14 + 112) = v78;
  [v36 loadPossibleStatesForEnumeration:v35 searchTerm:0 completionHandler:a9];
  sub_100019678();
  return _swift_continuation_await(v17);
}

uint64_t sub_1000108B4()
{
  sub_100019694();
  sub_100019600();
  uint64_t v2 = v1;
  sub_100019654();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v0;
  uint64_t v5 = *(void *)(v4 + 48);
  v2[29] = v5;
  if (v5)
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = v2[19];
    uint64_t v7 = v2[20];
    id v8 = sub_100011150;
  }
  else
  {
    uint64_t v6 = v2[19];
    uint64_t v7 = v2[20];
    id v8 = sub_1000109A0;
  }
  return _swift_task_switch(v8, v6, v7);
}

uint64_t sub_1000109A0()
{
  uint64_t v1 = *(void **)(v0 + 128);
  if (!v1)
  {
    uint64_t v1 = *(void **)(v0 + 200);
    id v19 = *(void **)(v0 + 136);
    swift_bridgeObjectRelease();

LABEL_13:
    uint64_t v1 = *(void **)(v0 + 192);
LABEL_20:
    uint64_t v30 = *(void *)(v0 + 208);
    if (v30 == *(void *)(v0 + 184))
    {
LABEL_22:
      swift_release();
      swift_release();
      sub_100019774();
      sub_1000196AC();
      __asm { BRAA            X2, X16 }
    }
    p_imp = &stru_100030FF0.imp;
    while (1)
    {
      sub_10001974C();
      if (v35) {
        id v36 = *(id *)(v34 + 8 * v30 + 32);
      }
      else {
        id v36 = (id)sub_100020A30();
      }
      id v37 = v36;
      *(void *)(v0 + 200) = v36;
      *(void *)(v0 + 208) = v30 + 1;
      if (__OFADD__(v30, 1))
      {
        __break(1u);
        goto LABEL_66;
      }
      id v38 = objc_msgSend(v36, (SEL)p_imp[420]);
      uint64_t v39 = sub_1000207E0();
      uint64_t v41 = v40;

      *(void *)(v0 + 216) = v39;
      *(void *)(v0 + 224) = v41;
      self;
      uint64_t v42 = swift_dynamicCastObjCClass();
      id v43 = *(void **)(v0 + 136);
      if (v42)
      {
        uint64_t v44 = (void *)v42;
        *(void *)(v0 + 120) = &OBJC_PROTOCOL___WFDynamicEnumerationDataSource;
        uint64_t v45 = (void *)swift_dynamicCastObjCProtocolConditional();
        id v46 = v37;
        id v47 = v43;
        if (v45)
        {
          unint64_t v48 = *(void **)(v0 + 136);
          id v49 = v46;
          id v50 = v48;
          if ((objc_msgSend(v44, "wf_supportsSearch") & 1) == 0
            && ([v45 respondsToSelector:"loadPossibleStatesForEnumeration:searchTerm:completionHandler:"] & 1) != 0)
          {
            *(void *)(v0 + 16) = v0;
            *(void *)(v0 + 56) = v0 + 128;
            *(void *)(v0 + 24) = sub_1000108B4;
            uint64_t v79 = sub_1000198F8();
            *(void *)(v0 + 80) = _NSConcreteStackBlock;
            *(void *)(v0 + 88) = 0x40000000;
            *(void *)(v0 + 96) = sub_100013BB8;
            *(void *)(v0 + 104) = &unk_10002D908;
            *(void *)(v0 + 112) = v79;
            objc_msgSend(v45, "loadPossibleStatesForEnumeration:searchTerm:completionHandler:", v44, 0);
            sub_1000196AC();
            return _swift_continuation_await(v10);
          }

          p_imp = (IMP *)(&stru_100030FF0 + 16);
        }
      }
      else
      {
        id v51 = v37;
        id v52 = v43;
      }
      self;
      uint64_t v53 = swift_dynamicCastObjCClass();
      if (!v53) {
        break;
      }
      unint64_t v54 = (void *)v53;
      id v37 = v37;
      unint64_t v55 = sub_100018F78(v54);
      if (!v55)
      {
        char v58 = *(void **)(v0 + 136);

        goto LABEL_43;
      }
      if (v55 >> 62) {
        uint64_t v56 = sub_100020AF0();
      }
      else {
        uint64_t v56 = *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (v56 <= 10)
      {
        id v59 = objc_allocWithZone((Class)INObjectCollection);
        sub_1000061EC(&qword_1000332D0);
        Class isa = sub_100020880().super.isa;
        swift_bridgeObjectRelease();
        id v61 = [v59 initWithItems:isa];

        if (v61)
        {
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          Swift::Int v66 = (void **)(v0 + 80);
          *(void *)(v0 + 80) = v1;
          sub_10001841C(v39, v41);
          sub_100019714();
          if (v12) {
            goto LABEL_69;
          }
          unint64_t v68 = v10;
          char v69 = v67;
          sub_1000061EC(&qword_1000332D8);
          unint64_t v10 = sub_100020AA0(isUniquelyReferenced_nonNull_native, (Swift::Int)v1);
          if (v10)
          {
            unint64_t v10 = sub_10001841C(v39, v41);
            if ((v69 & 1) != (v70 & 1)) {
              goto LABEL_8;
            }
            unint64_t v68 = v10;
            Swift::Int v66 = (void **)(v0 + 80);
          }
          uint64_t v1 = *v66;
          if (v69)
          {
            uint64_t v71 = v1[7];

            *(void *)(v71 + 8 * v68) = v61;
            p_imp = (IMP *)(&stru_100030FF0 + 16);
          }
          else
          {
            v1[(v68 >> 6) + 8] |= 1 << v68;
            uint64_t v76 = (uint64_t *)(v1[6] + 16 * v68);
            *uint64_t v76 = v39;
            v76[1] = v41;
            *(void *)(v1[7] + 8 * v68) = v61;
            uint64_t v77 = v1[2];
            BOOL v12 = __OFADD__(v77, 1);
            uint64_t v78 = v77 + 1;
            p_imp = (IMP *)(&stru_100030FF0 + 16);
            if (v12) {
              goto LABEL_70;
            }
            v1[2] = v78;
            swift_bridgeObjectRetain();
          }
          char v58 = *(void **)(v0 + 136);
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRetain();
          unint64_t v62 = sub_10001841C(v39, v41);
          char v64 = v63;
          swift_bridgeObjectRelease();
          if (v64)
          {
            uint64_t v72 = *(void **)(v0 + 136);
            char v73 = swift_isUniquelyReferenced_nonNull_native();
            Swift::Int v74 = v1[3];
            sub_1000061EC(&qword_1000332D8);
            sub_100020AA0(v73, v74);
            swift_bridgeObjectRelease();
            uint64_t v75 = *(void **)(v1[7] + 8 * v62);
            sub_1000198EC();
            sub_100020AC0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            p_imp = (IMP *)(&stru_100030FF0 + 16);
            goto LABEL_49;
          }
          char v58 = *(void **)(v0 + 136);
        }
        swift_bridgeObjectRelease();

        goto LABEL_48;
      }
      unint64_t v57 = *(void **)(v0 + 136);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_49:
      uint64_t v30 = *(void *)(v0 + 208);
      if (v30 == *(void *)(v0 + 184)) {
        goto LABEL_22;
      }
    }
    char v58 = *(void **)(v0 + 136);
LABEL_43:

    swift_bridgeObjectRelease();
LABEL_48:

    goto LABEL_49;
  }
  id v2 = [v1 allItems];
  sub_1000061EC(&qword_1000332D0);
  unint64_t v3 = sub_100020890();

  if (v3 >> 62)
  {
LABEL_66:
    sub_1000198AC();
    uint64_t v4 = sub_100020AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v0 + 224);
  if (v4 > 9)
  {
    id v20 = *(void **)(v0 + 200);
    long long v21 = *(void **)(v0 + 136);

    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  uint64_t v6 = *(void *)(v0 + 216);
  Swift::Int v7 = *(void *)(v0 + 192);
  id v8 = v1;
  char v9 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v0 + 128) = v7;
  sub_10001841C(v6, v5);
  sub_100019714();
  if (v12)
  {
    __break(1u);
  }
  else
  {
    unint64_t v13 = v10;
    char v14 = v11;
    sub_1000061EC(&qword_1000332D8);
    id v15 = (void **)(v0 + 128);
    unint64_t v10 = sub_100020AA0(v9, v7);
    if (v10)
    {
      unint64_t v10 = sub_10001841C(*(void *)(v0 + 216), *(void *)(v0 + 224));
      if ((v14 & 1) != (v16 & 1))
      {
LABEL_8:
        sub_1000196AC();
        return sub_100020B40();
      }
      unint64_t v13 = v10;
      id v15 = (void **)(v0 + 128);
    }
    uint64_t v1 = *v15;
    if (v14)
    {
      uint64_t v22 = v1[7];

      *(void *)(v22 + 8 * v13) = v8;
LABEL_19:
      id v28 = *(void **)(v0 + 200);
      id v29 = *(void **)(v0 + 136);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      goto LABEL_20;
    }
    uint64_t v24 = *(void *)(v0 + 216);
    uint64_t v23 = *(void *)(v0 + 224);
    v1[(v13 >> 6) + 8] |= 1 << v13;
    long long v25 = (void *)(v1[6] + 16 * v13);
    *long long v25 = v24;
    v25[1] = v23;
    *(void *)(v1[7] + 8 * v13) = v8;
    uint64_t v26 = v1[2];
    BOOL v12 = __OFADD__(v26, 1);
    uint64_t v27 = v26 + 1;
    if (!v12)
    {
      v1[2] = v27;
      swift_bridgeObjectRetain();
      goto LABEL_19;
    }
  }
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
  return _swift_continuation_await(v10);
}

uint64_t sub_100011150()
{
  uint64_t v1 = *(void **)(v0 + 200);
  id v2 = *(void **)(v0 + 136);
  swift_willThrow();

  swift_errorRelease();
  uint64_t v3 = *(void *)(v0 + 208);
  Swift::Int v4 = *(void *)(v0 + 192);
  if (v3 == *(void *)(v0 + 184))
  {
LABEL_2:
    swift_release();
    swift_release();
    sub_100019774();
    sub_100019794();
    __asm { BRAA            X2, X16 }
  }
  p_imp = &stru_100030FF0.imp;
LABEL_6:
  Swift::Int v60 = v4;
  while (1)
  {
    sub_10001974C();
    if (v9) {
      id v10 = *(id *)(v8 + 8 * v3 + 32);
    }
    else {
      id v10 = (id)sub_100020A30();
    }
    id v11 = v10;
    *(void *)(v0 + 200) = v10;
    *(void *)(v0 + 208) = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
LABEL_51:
      sub_100019794();
      return sub_100020B40();
    }
    id v12 = objc_msgSend(v10, (SEL)p_imp[420]);
    uint64_t v3 = sub_1000207E0();
    uint64_t v14 = v13;

    *(void *)(v0 + 216) = v3;
    *(void *)(v0 + 224) = v14;
    self;
    uint64_t v15 = sub_100019954();
    char v16 = *(void **)(v0 + 136);
    if (v15) {
      break;
    }
    id v25 = v11;
    id v26 = v16;
LABEL_17:
    self;
    uint64_t v27 = sub_100019954();
    if (!v27)
    {
      uint64_t v32 = *(void **)(v0 + 136);
LABEL_25:

      swift_bridgeObjectRelease();
LABEL_29:

      goto LABEL_30;
    }
    id v28 = (void *)v27;
    id v11 = v11;
    unint64_t v29 = sub_100018F78(v28);
    if (!v29)
    {
      uint64_t v32 = *(void **)(v0 + 136);

      goto LABEL_25;
    }
    if (v29 >> 62) {
      uint64_t v30 = sub_100020AF0();
    }
    else {
      uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v30 <= 10)
    {
      id v33 = objc_allocWithZone((Class)INObjectCollection);
      sub_1000061EC(&qword_1000332D0);
      Class isa = sub_100020880().super.isa;
      swift_bridgeObjectRelease();
      id v35 = [v33 initWithItems:isa];

      if (v35)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v40 = (Swift::Int *)(v0 + 80);
        *(void *)(v0 + 80) = v4;
        sub_1000197C8();
        sub_100019714();
        if (v43)
        {
          __break(1u);
LABEL_55:
          __break(1u);
          return _swift_continuation_await(v41);
        }
        unint64_t v44 = v41;
        char v45 = v42;
        sub_1000061EC(&qword_1000332D8);
        if (sub_100020AA0(isUniquelyReferenced_nonNull_native, v4))
        {
          unint64_t v46 = sub_1000197C8();
          if ((v45 & 1) != (v47 & 1)) {
            goto LABEL_51;
          }
          unint64_t v44 = v46;
          uint64_t v40 = (Swift::Int *)(v0 + 80);
        }
        Swift::Int v4 = *v40;
        if (v45)
        {
          uint64_t v48 = *(void *)(v4 + 56);

          *(void *)(v48 + 8 * v44) = v35;
          p_imp = (IMP *)(&stru_100030FF0 + 16);
        }
        else
        {
          sub_100019618();
          p_imp = (IMP *)(&stru_100030FF0 + 16);
          if (v43) {
            goto LABEL_55;
          }
          *(void *)(v4 + 16) = v54;
          swift_bridgeObjectRetain();
        }
        unint64_t v55 = *(void **)(v0 + 136);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
        Swift::Int v4 = v60;
        unint64_t v36 = sub_10001841C(v3, v14);
        char v38 = v37;
        swift_bridgeObjectRelease();
        if ((v38 & 1) == 0)
        {
          uint64_t v32 = *(void **)(v0 + 136);
          swift_bridgeObjectRelease();

          goto LABEL_29;
        }
        id v49 = *(void **)(v0 + 136);
        char v50 = swift_isUniquelyReferenced_nonNull_native();
        Swift::Int v51 = *(void *)(v60 + 24);
        sub_1000061EC(&qword_1000332D8);
        sub_100020AA0(v50, v51);
        uint64_t v3 = v60;
        swift_bridgeObjectRelease();
        id v52 = p_imp;
        uint64_t v53 = *(void **)(*(void *)(v60 + 56) + 8 * v36);
        sub_100020AC0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        p_imp = v52;
        Swift::Int v4 = v60;
      }
      sub_100019804();
      if (v9) {
        goto LABEL_2;
      }
      goto LABEL_6;
    }
    uint64_t v31 = *(void **)(v0 + 136);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_30:
    sub_100019804();
    if (v9) {
      goto LABEL_2;
    }
  }
  uint64_t v17 = (void *)v15;
  *(void *)(v0 + 120) = &OBJC_PROTOCOL___WFDynamicEnumerationDataSource;
  uint64_t v18 = (void *)swift_dynamicCastObjCProtocolConditional();
  id v19 = v11;
  id v20 = v16;
  if (!v18) {
    goto LABEL_17;
  }
  long long v21 = p_imp;
  uint64_t v22 = *(void **)(v0 + 136);
  id v23 = v19;
  id v24 = v22;
  if ((objc_msgSend(v17, "wf_supportsSearch") & 1) != 0
    || ([v18 respondsToSelector:"loadPossibleStatesForEnumeration:searchTerm:completionHandler:"] & 1) == 0)
  {

    p_imp = v21;
    Swift::Int v4 = v60;
    goto LABEL_17;
  }
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 128;
  *(void *)(v0 + 24) = sub_1000108B4;
  uint64_t v56 = sub_1000198F8();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_100013BB8;
  *(void *)(v0 + 104) = &unk_10002D908;
  *(void *)(v0 + 112) = v56;
  objc_msgSend(v18, "loadPossibleStatesForEnumeration:searchTerm:completionHandler:", v17, 0);
  sub_100019794();
  return _swift_continuation_await(v41);
}

uint64_t sub_100011708(void *a1)
{
  id v2 = [a1 mode];
  char v3 = sub_10001735C();
  char v4 = (v2 != (id)1) & v3;
  if (v2 == (id)1 && (v3 & 1) != 0)
  {
    id v5 = [v1 key];
    uint64_t v6 = sub_1000207E0();
    uint64_t v8 = v7;

    if (v6 == 0x6F6974617265706FLL && v8 == 0xE90000000000006ELL)
    {
      swift_bridgeObjectRelease();
      char v4 = 0;
    }
    else
    {
      char v10 = sub_100020B30();
      swift_bridgeObjectRelease();
      char v4 = v10 ^ 1;
    }
  }
  return v4 & 1;
}

void *sub_1000117FC(unint64_t a1, char *a2)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      uint64_t v6 = OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request;
      unint64_t v7 = a1 & 0xC000000000000001;
      while (v7)
      {
        id v8 = (id)sub_100020A30();
LABEL_7:
        char v9 = v8;
        unint64_t v10 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_15;
        }
        if (sub_100011708(*(void **)&a2[v6]))
        {
          sub_100020A50();
          sub_100020A70();
          unint64_t v7 = a1 & 0xC000000000000001;
          sub_100020A80();
          sub_100020A60();
        }
        else
        {
        }
        ++v5;
        if (v10 == v4) {
          goto LABEL_17;
        }
      }
      if (v5 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v4 = sub_100020AF0();
      if (!v4) {
        goto LABEL_17;
      }
    }
    id v8 = *(id *)(a1 + 8 * v5 + 32);
    goto LABEL_7;
  }
LABEL_17:

  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

void *sub_10001198C(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v7 = (id)sub_100020A30();
LABEL_7:
        id v8 = v7;
        unint64_t v9 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_15;
        }
        if (sub_100011708(a2))
        {
          sub_100020A50();
          sub_100020A70();
          uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8;
          sub_100020A80();
          sub_100020A60();
        }
        else
        {
        }
        ++v5;
        if (v9 == v4) {
          goto LABEL_17;
        }
      }
      if (v5 < *(void *)(v6 + 16)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v4 = sub_100020AF0();
      if (!v4) {
        goto LABEL_17;
      }
    }
    id v7 = *(id *)(a1 + 8 * v5 + 32);
    goto LABEL_7;
  }
LABEL_17:

  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

void *sub_100011B10(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v5 = (id)sub_100020A30();
LABEL_7:
        uint64_t v6 = v5;
        unint64_t v7 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_19;
        }
        sub_100019028(v5, (SEL *)&selRef_name);
        if (v8
          && (NSString v9 = sub_1000207D0(),
              swift_bridgeObjectRelease(),
              id v10 = [a2 parameterForKey:v9],
              v9,
              v10))
        {
          if (([v10 isHidden] & 1) != 0
            || (self, !swift_dynamicCastObjCClass()))
          {
          }
          else
          {

            sub_100020A50();
            sub_100020A70();
            sub_100020A80();
            sub_100020A60();
          }
        }
        else
        {
        }
        ++v4;
        if (v7 == v3) {
          goto LABEL_21;
        }
      }
      if (v4 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      uint64_t v3 = sub_100020AF0();
      if (!v3) {
        goto LABEL_21;
      }
    }
    id v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_7;
  }
LABEL_21:

  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100011CEC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000201D0();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  sub_1000201E0();
  uint64_t result = sub_100012228();
  if (v3 != (result & 1)) {
    return sub_100014724();
  }
  return result;
}

void sub_100011DC0()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_action];
  [v1 removeEventObserver:v0];
  id v2 = [v1 parameters];
  sub_100007924(0, &qword_100032F50);
  unint64_t v3 = sub_100020890();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    v8.receiver = v0;
    v8.super_class = (Class)type metadata accessor for FocusConfigurationActionViewModel();
    objc_msgSendSuper2(&v8, "dealloc");
    return;
  }
  sub_1000198CC();
  uint64_t v4 = sub_100020AF0();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_9;
  }
LABEL_3:
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v6 = (id)sub_100020A30();
      }
      else {
        id v6 = *(id *)(v3 + 8 * i + 32);
      }
      unint64_t v7 = v6;
      [v6 removeEventObserver:v0];
    }
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_10001201C()
{
  return type metadata accessor for FocusConfigurationActionViewModel();
}

uint64_t type metadata accessor for FocusConfigurationActionViewModel()
{
  uint64_t result = qword_100033270;
  if (!qword_100033270) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001206C()
{
  sub_100020900();
  id v1 = v0;
  uint64_t v2 = sub_1000208F0();
  unint64_t v3 = (void *)sub_10001982C();
  v3[2] = v2;
  _OWORD v3[3] = &protocol witness table for MainActor;
  v3[4] = v1;
  id v4 = v1;
  uint64_t v5 = sub_1000208F0();
  id v6 = (void *)sub_10001982C();
  v6[2] = v5;
  v6[3] = &protocol witness table for MainActor;
  v6[4] = v4;
  sub_100020700();
  return v8;
}

id sub_100012150@<X0>(uint64_t a1@<X2>, char *a2@<X8>)
{
  id result = [*(id *)(a1 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request) showsEnablementButton];
  if (result) {
    char v5 = *(unsigned char *)(a1 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_isEnabled);
  }
  else {
    char v5 = 1;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_1000121A8(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100012210(*a1 & 1u | (([*(id *)(a4+ OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request) showsEnablementButton] & 1) == 0));
}

uint64_t sub_1000121F0(uint64_t result)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_isEnabled) != (result & 1)) {
    return sub_100014724();
  }
  return result;
}

uint64_t sub_100012210(char a1)
{
  uint64_t v2 = *(unsigned __int8 *)(v1
                          + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_isEnabled);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_isEnabled) = a1;
  return sub_1000121F0(v2);
}

uint64_t sub_100012228()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000201D0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10001229C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100012300(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_configurableParameter) = a1;
  swift_bridgeObjectRelease();
  return sub_10001229C();
}

uint64_t sub_10001233C()
{
  sub_1000196A0();
  v1[38] = v0;
  uint64_t v2 = sub_100020160();
  v1[39] = v2;
  v1[40] = *(void *)(v2 - 8);
  v1[41] = swift_task_alloc();
  sub_100020900();
  v1[42] = sub_100019910();
  uint64_t v3 = sub_10001996C();
  v1[43] = v3;
  v1[44] = v4;
  return _swift_task_switch(sub_100012450, v3, v4);
}

uint64_t sub_100012450()
{
  sub_1000196A0();
  v0[45] = *(void *)(v0[38] + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_action);
  sub_100007924(0, &qword_1000333D8);
  uint64_t v1 = sub_100020980();
  v0[46] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[47] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100012558;
  return WFAction.processParametersWithoutAskingForValues(withInput:workQueue:)(0, v1);
}

uint64_t sub_100012558()
{
  sub_1000196A0();
  uint64_t v3 = v2;
  sub_100019600();
  uint64_t v5 = v4;
  sub_100019654();
  *uint64_t v6 = v5;
  *uint64_t v6 = *v1;
  *(void *)(v5 + 384) = v7;
  *(void *)(v5 + 392) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v8 = *(void *)(v5 + 344);
    uint64_t v9 = *(void *)(v5 + 352);
    id v10 = sub_100013728;
  }
  else
  {

    uint64_t v8 = *(void *)(v5 + 344);
    uint64_t v9 = *(void *)(v5 + 352);
    id v10 = sub_100012684;
  }
  return _swift_task_switch(v10, v8, v9);
}

uint64_t sub_100012684()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 304)
                + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request);
  id v2 = [v1 mode];
  if (v2 == (id)1)
  {
    swift_release();
    id v8 = [v1 contextualAction];
    if (!v8)
    {
      __break(1u);
      return _swift_continuation_await(v8);
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v0 + 384);
    self;
    sub_100019948();
    id v11 = [(id)swift_dynamicCastObjCClassUnconditional() setting];
    uint64_t v12 = sub_10000F2FC(0x656C797473, 0xE500000000000000, v10);
    if (v12)
    {
      *(void *)(v0 + 240) = v12;
      sub_1000061EC((uint64_t *)&unk_100033410);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        if (*(void *)(v0 + 224) != 1802658148 || *(void *)(v0 + 232) != 0xE400000000000000)
        {
          int v14 = sub_100020B30();
          swift_bridgeObjectRelease();
          uint64_t v15 = ~v14 & 1;
LABEL_25:
          uint64_t v20 = *(void *)(v0 + 304);
          id v21 = [objc_allocWithZone((Class)WFToggleSettingContextualAction) initWithSetting:v11 operation:v15];
          [objc_allocWithZone((Class)WFFocusConfigurationUIState) initWithEnabled:*(unsigned __int8 *)(v20+ OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_isEnabled) uiValidity:sub_100012228() & 1 contextualAction:v21];

          goto LABEL_26;
        }
        swift_bridgeObjectRelease();
LABEL_24:
        uint64_t v15 = 0;
        goto LABEL_25;
      }
    }
    uint64_t v17 = sub_10000F2FC(0x65756C61566E4FLL, 0xE700000000000000, *(void *)(v0 + 384));
    if (v17 && (*(void *)(v0 + 296) = v17, sub_1000061EC((uint64_t *)&unk_100033410), (swift_dynamicCast() & 1) != 0))
    {
      char v18 = *(unsigned char *)(v0 + 457);
      swift_bridgeObjectRelease();
      if (v18) {
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v19 = sub_10000F2FC(0x6574617473, 0xE500000000000000, *(void *)(v0 + 384));
      swift_bridgeObjectRelease();
      if (v19)
      {
        *(void *)(v0 + 256) = v19;
        sub_1000061EC((uint64_t *)&unk_100033410);
        if (swift_dynamicCast())
        {
          if (*(unsigned char *)(v0 + 456)) {
            goto LABEL_24;
          }
        }
      }
    }
    uint64_t v15 = 1;
    goto LABEL_25;
  }
  if (!v2)
  {
    uint64_t v3 = *(void **)(v0 + 360);
    self;
    uint64_t v4 = (void *)swift_dynamicCastObjCClassUnconditional();
    *(void *)(v0 + 400) = v4;
    id v5 = v3;
    sub_1000061EC((uint64_t *)&unk_100033410);
    Class isa = sub_1000207A0().super.isa;
    *(void *)(v0 + 408) = isa;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 248;
    *(void *)(v0 + 24) = sub_100012B5C;
    uint64_t v7 = sub_1000198F8();
    *(void *)(v0 + 184) = _NSConcreteStackBlock;
    *(void *)(v0 + 192) = 0x40000000;
    *(void *)(v0 + 200) = sub_100013BB8;
    *(void *)(v0 + 208) = &unk_10002D960;
    *(void *)(v0 + 216) = v7;
    [v4 getLinkActionWithProcessedParameters:isa forFocusConfiguration:1 completionHandler:v0 + 184];
    id v8 = (id)(v0 + 16);
    return _swift_continuation_await(v8);
  }
  swift_bridgeObjectRelease();
  swift_release();
  sub_100007924(0, &qword_100033408);
  char v16 = sub_100012228();
  sub_1000196C8(v16);
LABEL_26:
  swift_task_dealloc();
  sub_100019874();
  uint64_t v22 = sub_100019724();
  return v23(v22);
}

uint64_t sub_100012B5C()
{
  sub_100019694();
  sub_100019600();
  sub_100019654();
  *id v2 = v1;
  *id v2 = *v0;
  uint64_t v4 = v3[6];
  *(void *)(v1 + 416) = v4;
  uint64_t v5 = v3[44];
  uint64_t v6 = v3[43];
  if (v4) {
    uint64_t v7 = sub_1000137C8;
  }
  else {
    uint64_t v7 = sub_100012C8C;
  }
  return _swift_task_switch(v7, v6, v5);
}

uint64_t sub_100012C8C()
{
  id v2 = *(void **)(v0 + 400);
  uint64_t v1 = *(void **)(v0 + 408);
  uint64_t v3 = *(void **)(v0 + 248);
  *(void *)(v0 + 424) = v3;
  id v4 = v3;

  id v5 = [v2 metadata];
  *(void *)(v0 + 280) = 0;
  unsigned int v6 = objc_msgSend(v5, "wf_validateParametersForAction:error:", v4, v0 + 280);

  uint64_t v7 = *(void **)(v0 + 280);
  if (!v6)
  {
    id v21 = v7;

    swift_release();
    uint64_t v22 = sub_100020010();

    uint64_t v9 = (uint8_t *)v22;
LABEL_12:
    swift_willThrow();
    goto LABEL_13;
  }
  id v8 = v7;
  if (sub_1000141A8())
  {
    uint64_t v9 = *(uint8_t **)(v0 + 392);
    uint64_t v10 = *(void **)(v0 + 400);
    id v11 = [v10 metadata];
    id v12 = [v11 parameters];

    sub_100007924(0, &qword_100033378);
    unint64_t v13 = sub_100020890();

    int v14 = sub_100011B10(v13, v10);
    id v15 = [v4 parameters];
    sub_100007924(0, &qword_100033380);
    unint64_t v16 = sub_100020890();

    uint64_t v17 = sub_10000F0F0(v16);
    swift_bridgeObjectRelease();
    id v18 = [v4 parameters];
    unint64_t v19 = sub_100020890();

    uint64_t v20 = sub_100013CE4((uint64_t)v17, v19);
    swift_bridgeObjectRetain();
    sub_100013DEC((unint64_t)v14, (uint64_t)v20);
    if (v9)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_release();
LABEL_13:
      if (WFLogCategoryFocusConfiguration)
      {
        sub_10001985C();
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v32 = sub_100020150();
        os_log_type_t v33 = sub_100020940();
        if (os_log_type_enabled(v32, v33))
        {
          sub_100019844();
          uint64_t v34 = (void *)sub_100019730();
          *(_DWORD *)uint64_t v9 = 138412290;
          swift_errorRetain();
          uint64_t v35 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v0 + 272) = v35;
          sub_1000209D0();
          *uint64_t v34 = v35;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v32, v33, "Focus Filter configuration fails the validation test: %@", v9, 0xCu);
          sub_1000061EC(&qword_100033590);
          swift_arrayDestroy();
          sub_100019660();
          sub_100019660();
        }
        else
        {
          swift_errorRelease();
          swift_errorRelease();
        }
        uint64_t v36 = *(void *)(v0 + 416);
        char v37 = *(void **)(v0 + 360);
        uint64_t v39 = *(void *)(v0 + 320);
        uint64_t v38 = *(void *)(v0 + 328);
        uint64_t v40 = *(void *)(v0 + 312);

        (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
        sub_100007924(0, &qword_100033408);
        char v41 = sub_100012228();
        sub_1000196C8(v41);

        swift_errorRelease();
        if (!v36) {

        }
        swift_task_dealloc();
        sub_100019874();
        sub_100019724();
        sub_1000196AC();
        __asm { BRAA            X2, X16 }
      }
      __break(1u);
      return _swift_continuation_await();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v23 = [*(id *)(v0 + 400) connection];
  *(void *)(v0 + 432) = v23;
  if (!v23)
  {

    swift_release();
    sub_100018FDC();
    uint64_t v30 = sub_1000197B0();
    *uint64_t v31 = 2;
    uint64_t v9 = (uint8_t *)v30;
    goto LABEL_12;
  }
  id v24 = v23;
  sub_1000061EC(&qword_100033710);
  uint64_t v25 = sub_10001982C();
  *(_OWORD *)(v25 + 16) = xmmword_1000225D0;
  *(void *)(v25 + 32) = v4;
  sub_1000208B0();
  sub_100007924(0, &qword_100033420);
  id v26 = v4;
  Class isa = sub_100020880().super.isa;
  *(void *)(v0 + 440) = isa;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 80) = v0;
  *(void *)(v0 + 120) = v0 + 288;
  *(void *)(v0 + 88) = sub_100013270;
  uint64_t v28 = swift_continuation_init();
  *(void *)(v0 + 144) = _NSConcreteStackBlock;
  *(void *)(v0 + 152) = 0x40000000;
  *(void *)(v0 + 160) = sub_1000140C8;
  *(void *)(v0 + 168) = &unk_10002D978;
  *(void *)(v0 + 176) = v28;
  [v24 fetchDisplayRepresentationForActions:isa completionHandler:v0 + 144];
  sub_1000196AC();
  return _swift_continuation_await();
}

uint64_t sub_100013270()
{
  sub_1000196A0();
  sub_100019600();
  uint64_t v2 = v1;
  sub_100019654();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v0;
  uint64_t v5 = *(void *)(v4 + 112);
  *(void *)(v2 + 448) = v5;
  if (v5)
  {

    uint64_t v6 = *(void *)(v2 + 344);
    uint64_t v7 = *(void *)(v2 + 352);
    id v8 = sub_1000139B4;
  }
  else
  {
    uint64_t v6 = *(void *)(v2 + 344);
    uint64_t v7 = *(void *)(v2 + 352);
    id v8 = sub_100013390;
  }
  return _swift_task_switch(v8, v6, v7);
}

uint64_t sub_100013390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_1000196F8();
  sub_100019880();
  swift_release();
  unint64_t v15 = *(void *)(v14 + 288);
  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_100020AF0();
    swift_bridgeObjectRelease();
    if (v26) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v27 = *(void **)(v14 + 424);

    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v15 & 0xC000000000000001) != 0)
  {
    id v16 = (id)sub_100020A30();
  }
  else
  {
    if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      __break(1u);
    }
    id v16 = *(id *)(v15 + 32);
  }
  uint64_t v17 = v16;
  id v18 = *(void **)(v14 + 440);
  swift_bridgeObjectRelease();
  id v19 = [v17 displayRepresentation];

  if (v19)
  {
    uint64_t v20 = *(void **)(v14 + 424);
    id v21 = *(void **)(v14 + 360);
    uint64_t v22 = *(void *)(v14 + 304);

    sub_100007924(0, &qword_100033408);
    char v23 = *(unsigned char *)(v22 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_isEnabled);
    id v24 = v19;
    char v25 = sub_100012228();
    sub_100014134(v23, v25 & 1, v20, v19);

LABEL_16:
    goto LABEL_17;
  }

LABEL_11:
  uint64_t v28 = *(void **)(v14 + 432);
  sub_100018FDC();
  uint64_t v29 = (uint8_t *)sub_1000197B0();
  *uint64_t v30 = 2;
  swift_willThrow();

  uint64_t result = WFLogCategoryFocusConfiguration;
  if (!WFLogCategoryFocusConfiguration)
  {
    __break(1u);
    return result;
  }
  uint64_t v20 = *(void **)(v14 + 424);
  sub_10001985C();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v32 = sub_100020150();
  os_log_type_t v33 = sub_100020940();
  if (os_log_type_enabled(v32, v33))
  {
    a9 = v14 + 272;
    sub_100019844();
    uint64_t v34 = (void *)sub_100019730();
    *(_DWORD *)uint64_t v29 = 138412290;
    swift_errorRetain();
    uint64_t v35 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v14 + 272) = v35;
    sub_1000209D0();
    *uint64_t v34 = v35;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Focus Filter configuration fails the validation test: %@", v29, 0xCu);
    sub_1000061EC(&qword_100033590);
    swift_arrayDestroy();
    sub_100019660();
    sub_100019660();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v36 = *(void *)(v14 + 416);
  char v37 = *(void **)(v14 + 360);
  uint64_t v39 = *(void *)(v14 + 320);
  uint64_t v38 = *(void *)(v14 + 328);
  uint64_t v40 = *(void *)(v14 + 312);

  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
  sub_100007924(0, &qword_100033408);
  char v41 = sub_100012228();
  sub_1000196C8(v41);

  swift_errorRelease();
  if (!v36) {
    goto LABEL_16;
  }
LABEL_17:
  swift_task_dealloc();
  sub_100019784();
  sub_100019724();
  sub_100019678();
  return v44(v42, v43, v44, v45, v46, v47, v48, v49, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_100013728()
{
  sub_1000196A0();
  uint64_t v1 = *(void **)(v0 + 368);
  swift_release();

  swift_task_dealloc();
  sub_1000196EC();
  return v2();
}

uint64_t sub_1000137C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_1000196F8();
  sub_100019880();
  uint64_t v17 = *(void **)(v14 + 408);
  swift_release();
  swift_willThrow();

  if (!WFLogCategoryFocusConfiguration) {
    __break(1u);
  }
  sub_10001985C();
  swift_errorRetain();
  swift_errorRetain();
  id v18 = sub_100020150();
  os_log_type_t v19 = sub_100020940();
  if (os_log_type_enabled(v18, v19))
  {
    sub_100019844();
    unint64_t v15 = (void *)sub_100019730();
    sub_100019928(5.7779e-34);
    uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v14 + 272) = v20;
    sub_1000209D0();
    *unint64_t v15 = v20;
    swift_errorRelease();
    swift_errorRelease();
    sub_10001988C((void *)&_mh_execute_header, v21, v22, "Focus Filter configuration fails the validation test: %@");
    sub_1000061EC(&qword_100033590);
    swift_arrayDestroy();
    sub_100019660();
    sub_100019660();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  sub_100019984();
  uint64_t v23 = sub_100019814();
  v24(v23);
  sub_100007924(0, &qword_100033408);
  char v25 = sub_100012228();
  sub_1000197E0(v25);

  swift_errorRelease();
  if (!v15) {

  }
  swift_task_dealloc();
  sub_100019784();
  sub_100019724();
  sub_100019678();
  return v29(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_1000139B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_1000196F8();
  sub_100019880();
  uint64_t v17 = (void *)v14[55];
  id v18 = (void *)v14[54];
  swift_release();
  swift_willThrow();

  if (!WFLogCategoryFocusConfiguration) {
    __break(1u);
  }
  os_log_type_t v19 = (void *)v14[53];
  sub_10001985C();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v20 = sub_100020150();
  os_log_type_t v21 = sub_100020940();
  if (os_log_type_enabled(v20, v21))
  {
    a9 = v14 + 34;
    sub_100019844();
    unint64_t v15 = (void *)sub_100019730();
    sub_100019928(5.7779e-34);
    uint64_t v22 = v19;
    uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
    v14[34] = v23;
    sub_1000209D0();
    *unint64_t v15 = v23;
    os_log_type_t v19 = v22;
    swift_errorRelease();
    swift_errorRelease();
    sub_10001988C((void *)&_mh_execute_header, v24, v25, "Focus Filter configuration fails the validation test: %@");
    sub_1000061EC(&qword_100033590);
    swift_arrayDestroy();
    sub_100019660();
    sub_100019660();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  sub_100019984();
  uint64_t v26 = sub_100019814();
  v27(v26);
  sub_100007924(0, &qword_100033408);
  char v28 = sub_100012228();
  sub_1000197E0(v28);

  swift_errorRelease();
  if (!v15) {

  }
  swift_task_dealloc();
  sub_100019784();
  sub_100019724();
  sub_100019678();
  return v31(v29, v30, v31, v32, v33, v34, v35, v36, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_100013BBC(uint64_t a1, uint64_t a2)
{
  sub_1000061EC(&qword_100033340);
  uint64_t v4 = sub_1000197B0();
  *uint64_t v5 = a2;
  return _swift_continuation_throwingResumeWithError(a1, v4);
}

uint64_t sub_100013C18(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return _swift_continuation_throwingResume();
}

void *sub_100013C38(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000061EC(&qword_1000333B8);
    uint64_t v1 = (void *)sub_100020B10();
  }
  else
  {
    uint64_t v1 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = v1;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_10001888C(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

void *sub_100013CE4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100020AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v4 >= v3) {
    uint64_t v4 = v3;
  }
  if (v4)
  {
    sub_1000061EC(&qword_100033430);
    uint64_t v5 = (void *)sub_100020B10();
  }
  else
  {
    uint64_t v5 = &_swiftEmptyDictionarySingleton;
  }
  id v8 = v5;
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)swift_bridgeObjectRetain();
  sub_100018B68(v6, a2, 1, &v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_100013DEC(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_25;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_100020AF0())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)sub_100020A30() : *(id *)(a1 + 8 * i);
      uint64_t v7 = v6;
      uint64_t v8 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      uint64_t v9 = sub_100019028(v6, (SEL *)&selRef_name);
      if (!v10) {
        goto LABEL_22;
      }
      if (!*(void *)(a2 + 16) || (unint64_t v11 = sub_10001841C(v9, v10), (v12 & 1) == 0))
      {
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      id v13 = *(id *)(*(void *)(a2 + 56) + 8 * v11);
      swift_bridgeObjectRelease();
      id v14 = [v13 value];
      if (!v14)
      {

LABEL_22:
        sub_100018FDC();
        swift_allocError();
        *os_log_type_t v21 = 1;
        swift_willThrow();
        swift_bridgeObjectRelease();
LABEL_23:

        return swift_bridgeObjectRelease();
      }
      unint64_t v15 = v14;
      id v16 = [v7 valueType];
      self;
      if (swift_dynamicCastObjCClass())
      {

        id v17 = [v15 value];
        sub_1000209F0();
        swift_unknownObjectRelease();
        sub_1000061EC(&qword_100033428);
        if ((swift_dynamicCast() & 1) == 0 || (uint64_t v18 = *(void *)(v22 + 16), swift_bridgeObjectRelease(), !v18))
        {
          sub_100018FDC();
          swift_allocError();
          *uint64_t v20 = 1;
          swift_willThrow();
          swift_bridgeObjectRelease();

          uint64_t v7 = v15;
          goto LABEL_23;
        }
        id v16 = v13;
      }
      else
      {

        uint64_t v7 = v15;
        unint64_t v15 = v13;
      }

      if (v8 == v4)
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000140C8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    return sub_100013BBC(v3, (uint64_t)a3);
  }
  sub_100007924(0, &qword_100033440);
  uint64_t v5 = sub_100020890();
  return sub_100013C18(v3, v5);
}

id sub_100014134(char a1, char a2, void *a3, void *a4)
{
  id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithEnabled:a1 & 1 uiValidity:a2 & 1 action:a3 displayRepresentation:a4];

  return v6;
}

uint64_t sub_1000141A8()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_request);
  if ([v1 mode]) {
    return 0;
  }
  id v3 = [v1 actionIdentifier];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  id v5 = [v3 bundleIdentifier];
  sub_1000207E0();

  v6._countAndFlagsBits = 0x6C7070612E6D6F63;
  v6._object = (void *)0xEA00000000002E65;
  LOBYTE(v5) = sub_100020850(v6);

  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_100014274()
{
  uint64_t v1 = sub_100020160();
  sub_100007DA8();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100007DEC();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_action];
  id v9 = [v8 visibleParametersWithProcessing:0];
  sub_100007924(0, &qword_100032F50);
  sub_100020890();

  uint64_t v10 = v0;
  unint64_t v11 = sub_1000198EC();
  unint64_t v13 = (unint64_t)sub_1000117FC(v11, v12);
  uint64_t v14 = *(void *)&v10[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_configurableParameter];
  swift_bridgeObjectRetain();
  unsigned __int8 v15 = sub_10000EE94(v13, v14);
  swift_bridgeObjectRelease();
  if ((v15 & 1) == 0)
  {
    if (WFLogCategoryFocusConfiguration)
    {
      sub_100020130();
      id v17 = v10;
      swift_bridgeObjectRetain_n();
      uint64_t v18 = v17;
      os_log_type_t v19 = sub_100020150();
      os_log_type_t v20 = sub_100020950();
      if (!os_log_type_enabled(v19, v20))
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
LABEL_21:
        uint64_t v40 = swift_bridgeObjectRetain();
        sub_100012300(v40);
        v46[0] = v13;
        sub_100020190();
        swift_bridgeObjectRelease();
        sub_10001975C();
        return;
      }
      os_log_type_t v42 = v20;
      unint64_t v44 = v18;
      os_log_type_t v21 = (_DWORD *)swift_slowAlloc();
      v46[0] = swift_slowAlloc();
      uint64_t v43 = v21;
      *os_log_type_t v21 = 136315394;
      if (v13 >> 62)
      {
        sub_1000198AC();
        uint64_t v22 = sub_100020AF0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v22 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v45 = v7;
      if (!v22)
      {
LABEL_20:
        uint64_t v33 = sub_1000208A0();
        unint64_t v35 = v34;
        swift_bridgeObjectRelease();
        sub_100017A54(v33, v35, v46);
        sub_1000209D0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *((_WORD *)v43 + 6) = 2080;
        id v36 = [v8 identifier];
        uint64_t v37 = sub_1000207E0();
        unint64_t v39 = v38;

        sub_100017A54(v37, v39, v46);
        sub_1000209D0();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v19, v42, "Visible parameters changed to %s, in action: %s", (uint8_t *)v43, 0x16u);
        swift_arrayDestroy();
        sub_100019660();
        sub_100019660();

        (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v45, v1);
        goto LABEL_21;
      }
      char v41 = v8;
      sub_10001820C(0, v22 & ~(v22 >> 63), 0);
      if ((v22 & 0x8000000000000000) == 0)
      {
        uint64_t v23 = 0;
        do
        {
          if ((v13 & 0xC000000000000001) != 0) {
            id v24 = (id)sub_100020A30();
          }
          else {
            id v24 = *(id *)(v13 + 8 * v23 + 32);
          }
          id v25 = v24;
          id v26 = [v25 key];
          uint64_t v27 = sub_1000207E0();
          uint64_t v29 = v28;

          unint64_t v31 = _swiftEmptyArrayStorage[2];
          unint64_t v30 = _swiftEmptyArrayStorage[3];
          if (v31 >= v30 >> 1) {
            sub_10001820C((char *)(v30 > 1), v31 + 1, 1);
          }
          ++v23;
          _swiftEmptyArrayStorage[2] = v31 + 1;
          uint64_t v32 = &_swiftEmptyArrayStorage[2 * v31];
          v32[4] = v27;
          v32[5] = v29;
        }
        while (v22 != v23);
        uint64_t v8 = v41;
        goto LABEL_20;
      }
      __break(1u);
    }
    __break(1u);
    return;
  }
  sub_10001975C();
  swift_bridgeObjectRelease();
}

uint64_t sub_100014724()
{
  uint64_t v1 = sub_1000061EC((uint64_t *)&unk_1000333E0);
  __chkstk_darwin(v1 - 8);
  sub_100007DEC();
  uint64_t v4 = v3 - v2;
  sub_100014274();
  type metadata accessor for FocusConfigurationActionViewModel();
  sub_100019090();
  sub_100020180();
  sub_1000201B0();
  swift_release();
  uint64_t v5 = sub_100020920();
  sub_100006BE4(v4, 1, 1, v5);
  sub_100020900();
  id v6 = v0;
  uint64_t v7 = sub_1000208F0();
  uint64_t v8 = (void *)sub_10001982C();
  v8[2] = v7;
  v8[3] = &protocol witness table for MainActor;
  v8[4] = v6;
  sub_100014B3C(v4, (uint64_t)&unk_1000333F8, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_10001483C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  sub_100020900();
  v4[4] = sub_1000208F0();
  uint64_t v6 = sub_1000208E0();
  v4[5] = v6;
  v4[6] = v5;
  return _swift_task_switch(sub_1000148D4, v6, v5);
}

uint64_t sub_1000148D4()
{
  sub_100019694();
  v0[7] = *(void *)(v0[3]
                    + OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_onConfigurationStateChange);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100014974;
  return sub_10001233C();
}

uint64_t sub_100014974()
{
  sub_1000196A0();
  uint64_t v3 = v2;
  sub_100019600();
  uint64_t v5 = v4;
  sub_100019654();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  sub_100019654();
  *uint64_t v8 = v7;
  v5[9] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v9 = v5[5];
    uint64_t v10 = v5[6];
    unint64_t v11 = sub_100014AE0;
  }
  else
  {
    v5[10] = v3;
    uint64_t v9 = v5[5];
    uint64_t v10 = v5[6];
    unint64_t v11 = sub_100014A6C;
  }
  return _swift_task_switch(v11, v9, v10);
}

uint64_t sub_100014A6C()
{
  sub_100019694();
  uint64_t v1 = *(void **)(v0 + 80);
  swift_release();
  *(void *)(v0 + 16) = v1;
  sub_100020190();

  sub_1000196EC();
  return v2();
}

uint64_t sub_100014AE0()
{
  sub_100019694();
  swift_release();
  sub_1000196EC();
  return v0();
}

uint64_t sub_100014B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100020920();
  if (sub_100019258(a1, 1, v5) == 1)
  {
    sub_100019280(a1);
  }
  else
  {
    sub_100020910();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000208E0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_100014C7C(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_100020160();
  sub_100007DA8();
  uint64_t v29 = v7;
  __chkstk_darwin(v8);
  sub_100007DEC();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_100020780();
  sub_100007DA8();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_100007DEC();
  uint64_t v18 = (uint64_t *)(v17 - v16);
  sub_100007924(0, &qword_1000333D8);
  *uint64_t v18 = sub_100020980();
  (*(void (**)(uint64_t *, void, uint64_t))(v14 + 104))(v18, enum case for DispatchPredicate.onQueue(_:), v12);
  char v19 = sub_100020790();
  (*(void (**)(uint64_t *, uint64_t))(v14 + 8))(v18, v12);
  if ((v19 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (!WFLogCategoryFocusConfiguration)
  {
LABEL_8:
    __break(1u);
    return;
  }
  sub_100020130();
  swift_bridgeObjectRetain_n();
  id v20 = a1;
  os_log_type_t v21 = sub_100020150();
  os_log_type_t v22 = sub_100020950();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136315394;
    swift_bridgeObjectRetain();
    sub_100017A54(a2, a3, &v30);
    sub_1000209D0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v23 + 12) = 2080;
    id v24 = [v20 identifier];
    uint64_t v25 = sub_1000207E0();
    uint64_t v28 = v6;
    unint64_t v27 = v26;

    sub_100017A54(v25, v27, &v30);
    sub_1000209D0();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Parameter state changed for key: %s, in action: %s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    sub_100019660();
    sub_100019660();

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v11, v28);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v11, v6);
  }
  sub_100014724();
  sub_10001975C();
}

void sub_100015048(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100020160();
  sub_100007DA8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_100007DEC();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_100020780();
  sub_100007DA8();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  sub_100007DEC();
  uint64_t v17 = (uint64_t *)(v16 - v15);
  sub_100007924(0, &qword_1000333D8);
  *uint64_t v17 = sub_100020980();
  (*(void (**)(uint64_t *, void, uint64_t))(v13 + 104))(v17, enum case for DispatchPredicate.onQueue(_:), v11);
  char v18 = sub_100020790();
  (*(void (**)(uint64_t *, uint64_t))(v13 + 8))(v17, v11);
  if ((v18 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (!WFLogCategoryFocusConfiguration)
  {
LABEL_8:
    __break(1u);
    return;
  }
  sub_100020130();
  id v19 = a1;
  id v20 = v2;
  id v21 = v19;
  os_log_type_t v22 = (char *)v20;
  uint64_t v23 = sub_100020150();
  os_log_type_t v24 = sub_100020950();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136315394;
    uint64_t v35 = v6;
    uint64_t v34 = v4;
    id v26 = [v21 key];
    uint64_t v27 = sub_1000207E0();
    unint64_t v29 = v28;

    sub_100017A54(v27, v29, &v36);
    sub_1000209D0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v25 + 12) = 2080;
    id v30 = [*(id *)&v22[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_action] identifier];
    uint64_t v31 = sub_1000207E0();
    unint64_t v33 = v32;

    sub_100017A54(v31, v33, &v36);
    sub_1000209D0();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Parameter attributes changed: %s, in action: %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    sub_100019660();
    sub_100019660();

    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v10, v34);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  }
  sub_100014724();
  sub_10001975C();
}

void sub_100015410()
{
}

void sub_100015450()
{
  sub_10001551C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10001551C()
{
  if (!qword_100033288)
  {
    unint64_t v0 = sub_1000201F0();
    if (!v1) {
      atomic_store(v0, &qword_100033288);
    }
  }
}

void *sub_100015568()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100015574@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for FocusConfigurationActionViewModel();
  uint64_t result = sub_100020180();
  *a1 = result;
  return result;
}

uint64_t sub_1000155B4(void *a1, void *a2)
{
  id v163 = a2;
  uint64_t v166 = sub_100020160();
  uint64_t v157 = *(void *)(v166 - 8);
  uint64_t v3 = __chkstk_darwin(v166);
  uint64_t v5 = (char *)&v143 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  v151 = (char *)&v143 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  v164 = (char *)&v143 - v9;
  __chkstk_darwin(v8);
  v158 = (char *)&v143 - v10;
  id v11 = [objc_allocWithZone((Class)LNMetadataProvider) initWithOptions:2];
  NSString v12 = [a1 bundleIdentifier];
  if (!v12)
  {
    sub_1000207E0();
    NSString v12 = sub_1000207D0();
    swift_bridgeObjectRelease();
  }
  uint64_t v13 = sub_1000207E0();
  uint64_t v15 = v14;
  uint64_t v153 = sub_1000061EC(&qword_100033710);
  uint64_t v16 = swift_allocObject();
  long long v152 = xmmword_1000225D0;
  *(_OWORD *)(v16 + 16) = xmmword_1000225D0;
  *(void *)(v16 + 32) = a1;
  v168[0] = (id)v16;
  sub_1000208B0();
  sub_100007924(0, &qword_100033360);
  id v156 = a1;
  Class isa = sub_100020880().super.isa;
  swift_bridgeObjectRelease();
  v168[0] = 0;
  id v18 = [v11 actionsWithFullyQualifiedIdentifiers:isa error:v168];

  id v19 = v168[0];
  if (!v18)
  {
    id v49 = v168[0];
    swift_bridgeObjectRelease();

    sub_100020010();
    swift_willThrow();
    goto LABEL_28;
  }
  id v155 = v11;
  sub_1000061EC(&qword_100033368);
  uint64_t v20 = sub_1000207B0();
  id v21 = v19;

  uint64_t v22 = sub_10000F270(v13, v15, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v22)
  {
    id v11 = 0;
LABEL_24:

    if (WFLogCategoryFocusConfiguration)
    {
      sub_100020130();
      char v50 = sub_100020150();
      os_log_type_t v51 = sub_100020970();
      id v19 = (id)v51;
      if (os_log_type_enabled(v50, v51))
      {
        id v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, (os_log_type_t)v19, "Attempted to configure an action that is not a FocusConfiguration action, bailing out.", v52, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v157 + 8))(v5, v166);
      sub_100018FDC();
      swift_allocError();
      *uint64_t v53 = 0;
      swift_willThrow();

      goto LABEL_28;
    }
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  id v23 = [v156 actionIdentifier];
  uint64_t v24 = sub_1000207E0();
  uint64_t v26 = v25;

  uint64_t v27 = sub_10000F2B4(v24, v26, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v27)
  {
    id v11 = 0;
    goto LABEL_24;
  }
  id v11 = v27;
  id v28 = [v11 systemProtocols];
  sub_100007924(0, &qword_100033370);
  unint64_t v29 = sub_100020890();

  id v30 = [self focusConfigurationProtocol];
  char v31 = sub_10001673C((uint64_t)v30, v29);
  swift_bridgeObjectRelease();

  if ((v31 & 1) == 0)
  {

    NSString v12 = v11;
    goto LABEL_24;
  }
  id v32 = objc_allocWithZone((Class)WFLinkActionProvider);
  id v143 = [v32 initWithMetadataProvider:v155];
  id v33 = [v143 actionMetadataByUpdatingWithEnumAndEntityMetadata:v11 bundleIdentifier:v12];

  id v144 = v11;
  p_imp = &stru_100030FF0.imp;
  id v145 = v33;
  id v35 = [v145 parameters];
  sub_100007924(0, &qword_100033378);
  unint64_t v36 = sub_100020890();

  if (v36 >> 62) {
    goto LABEL_31;
  }
  uint64_t v37 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v37)
  {
    v168[0] = _swiftEmptyArrayStorage;
    sub_10001822C(0, v37 & ~(v37 >> 63), 0);
    if (v37 < 0) {
      goto LABEL_85;
    }
    p_imp = 0;
    unint64_t v38 = v168[0];
    unint64_t v167 = v36 & 0xC000000000000001;
    unint64_t v39 = v36;
    while ((IMP *)v37 != p_imp)
    {
      if (v167) {
        id v40 = (id)sub_100020A30();
      }
      else {
        id v40 = *(id *)(v36 + 8 * (void)p_imp + 32);
      }
      id v41 = v40;
      uint64_t v42 = sub_100019028(v40, (SEL *)&selRef_name);
      if (!v43) {
        goto LABEL_86;
      }
      uint64_t v44 = v42;
      uint64_t v45 = v43;
      v168[0] = v38;
      unint64_t v47 = v38[2];
      unint64_t v46 = v38[3];
      if (v47 >= v46 >> 1)
      {
        sub_10001822C((char *)(v46 > 1), v47 + 1, 1);
        unint64_t v38 = v168[0];
      }
      p_imp = (IMP *)((char *)p_imp + 1);
      v38[2] = v47 + 1;
      uint64_t v48 = &v38[3 * v47];
      v48[4] = v44;
      v48[5] = v45;
      v48[6] = v41;
      unint64_t v36 = v39;
      if ((IMP *)v37 == p_imp)
      {
        swift_bridgeObjectRelease();
        p_imp = (IMP *)(&stru_100030FF0 + 16);
        goto LABEL_33;
      }
    }
    __break(1u);
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_100020AF0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  unint64_t v38 = _swiftEmptyArrayStorage;
LABEL_33:
  unint64_t v55 = sub_100013C38((uint64_t)v38);
  id v56 = objc_msgSend(v163, (SEL)p_imp[435]);
  sub_100007924(0, &qword_100033380);
  unint64_t v57 = sub_100020890();

  uint64_t v59 = (uint64_t)v164;
  if (v57 >> 62) {
    goto LABEL_83;
  }
  uint64_t v60 = *(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_35:
  id v61 = objc_msgSend_sizeThatFits_;
  unint64_t v62 = &stru_100030FF0.imp;
  if (v60)
  {
    id v163 = (id)(v57 & 0xC000000000000001);
    v159 = (void (**)(char *, uint64_t))(v157 + 8);
    v148 = &_swiftEmptyDictionarySingleton;
    uint64_t v63 = 4;
    uint64_t v160 = WFLogCategoryFocusConfiguration;
    v150 = (char *)&type metadata for Any + 8;
    *(void *)&long long v58 = 136315138;
    long long v154 = v58;
    v165 = v55;
    uint64_t v161 = v60;
    unint64_t v162 = v57;
    while (1)
    {
      if (v163) {
        id v64 = (id)sub_100020A30();
      }
      else {
        id v64 = *(id *)(v57 + 8 * v63);
      }
      uint64_t v65 = v64;
      if (__OFADD__(v63 - 4, 1))
      {
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        swift_bridgeObjectRetain();
        uint64_t v60 = sub_100020AF0();
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
      unint64_t v167 = v63 - 3;
      id v66 = [v64 (SEL)v62[401]];
      uint64_t v67 = sub_1000207E0();
      uint64_t v69 = v68;

      unint64_t v55 = v165;
      if (v165[2] && (unint64_t v70 = sub_10001841C(v67, v69), (v71 & 1) != 0))
      {
        id v72 = *(id *)(v55[7] + 8 * v70);
        swift_bridgeObjectRelease();
        id v73 = [v72 valueType];
        id v74 = objc_msgSend(v73, "wf_parameterDefinitionWithParameterMetadata:", v72);

        if (v74)
        {
          id v75 = v74;
          id v76 = [v65 value];
          id v77 = [v75 parameterStateFromLinkValue:v76];
          id v149 = v75;

          if (v77)
          {
            id v78 = [v77 serializedRepresentation];
            swift_unknownObjectRelease();
            if (v78)
            {
              id v146 = v72;
              id v79 = [v65 identifier];
              uint64_t v59 = sub_1000207E0();
              unint64_t v55 = v80;

              id v81 = v78;
              swift_unknownObjectRetain();
              unint64_t v57 = (unint64_t)v148;
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              v168[0] = (id)v57;
              uint64_t v147 = (uint64_t)v55;
              unint64_t v83 = sub_10001841C(v59, (uint64_t)v55);
              uint64_t v85 = *(void *)(v57 + 16);
              BOOL v86 = (v84 & 1) == 0;
              Swift::Int v87 = v85 + v86;
              if (__OFADD__(v85, v86)) {
                goto LABEL_82;
              }
              unint64_t v88 = v83;
              char v89 = v84;
              sub_1000061EC(&qword_100033398);
              BOOL v90 = sub_100020AA0(isUniquelyReferenced_nonNull_native, v87);
              unint64_t v62 = (IMP *)(&stru_100030FF0 + 16);
              if (v90)
              {
                unint64_t v91 = sub_10001841C(v59, v147);
                if ((v89 & 1) != (v92 & 1)) {
                  goto LABEL_91;
                }
                unint64_t v88 = v91;
              }
              uint64_t v93 = v168[0];
              v148 = v168[0];
              if (v89)
              {
                uint64_t v94 = *((void *)v168[0] + 7);
                swift_unknownObjectRelease();
                *(void *)(v94 + 8 * v88) = v81;
                uint64_t v59 = (uint64_t)v164;
                unint64_t v55 = v165;
                uint64_t v95 = v161;
                unint64_t v57 = v162;
              }
              else
              {
                *((void *)v168[0] + (v88 >> 6) + 8) |= 1 << v88;
                v112 = (uint64_t *)(v93[6] + 16 * v88);
                uint64_t v113 = v147;
                uint64_t *v112 = v59;
                v112[1] = v113;
                *(void *)(v93[7] + 8 * v88) = v81;
                uint64_t v114 = v93[2];
                BOOL v115 = __OFADD__(v114, 1);
                uint64_t v116 = v114 + 1;
                unint64_t v57 = v162;
                if (v115)
                {
                  __break(1u);
LABEL_85:
                  __break(1u);
LABEL_86:
                  __break(1u);
LABEL_87:
                  __break(1u);
                }
                v93[2] = v116;
                swift_bridgeObjectRetain();
                uint64_t v59 = (uint64_t)v164;
                unint64_t v55 = v165;
                uint64_t v95 = v161;
              }

              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              id v61 = objc_msgSend_sizeThatFits_;
              goto LABEL_63;
            }
          }
        }
        if (!v160)
        {
          __break(1u);
          goto LABEL_89;
        }
        sub_100020130();
        id v105 = v72;
        uint64_t v106 = sub_100020150();
        os_log_type_t v107 = sub_100020960();
        if (os_log_type_enabled(v106, v107))
        {
          uint64_t v108 = swift_slowAlloc();
          uint64_t v169 = swift_slowAlloc();
          *(_DWORD *)uint64_t v108 = v154;
          v168[0] = (id)sub_100019028(v105, (SEL *)&selRef_name);
          v168[1] = v109;
          sub_1000061EC((uint64_t *)&unk_100032F20);
          uint64_t v110 = sub_1000207F0();
          *(void *)(v108 + 4) = sub_100017A54(v110, v111, &v169);

          unint64_t v55 = v165;
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v106, v107, "Could not create serializedRepresentation of parameterState for parameter %s", (uint8_t *)v108, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        (*v159)(v158, v166);
        uint64_t v59 = (uint64_t)v164;
        unint64_t v62 = (IMP *)(&stru_100030FF0 + 16);
        id v61 = objc_msgSend_sizeThatFits_;
      }
      else
      {
        swift_bridgeObjectRelease();
        if (!v160) {
          goto LABEL_87;
        }
        sub_100020130();
        id v96 = v65;
        uint64_t v97 = sub_100020150();
        os_log_type_t v98 = sub_100020970();
        if (os_log_type_enabled(v97, v98))
        {
          uint64_t v99 = swift_slowAlloc();
          v168[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v99 = v154;
          id v100 = [v96 (SEL)v62[401]];
          uint64_t v101 = sub_1000207E0();
          unint64_t v103 = v102;

          unint64_t v55 = v165;
          uint64_t v104 = v101;
          id v61 = objc_msgSend_sizeThatFits_;
          *(void *)(v99 + 4) = sub_100017A54(v104, v103, (uint64_t *)v168);

          unint64_t v62 = (IMP *)(&stru_100030FF0 + 16);
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v97, v98, "Programming error: could not find parameter with identifier %s", (uint8_t *)v99, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v59 = (uint64_t)v164;
          swift_slowDealloc();
        }
        else
        {
        }
        (*v159)((char *)v59, v166);
      }
      uint64_t v95 = v161;
      unint64_t v57 = v162;
LABEL_63:
      ++v63;
      if (v167 == v95)
      {
        swift_bridgeObjectRelease();
        uint64_t v117 = v148;
        goto LABEL_69;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v117 = &_swiftEmptyDictionarySingleton;
LABEL_69:
  swift_bridgeObjectRelease();
  if (v117[2])
  {
    id v11 = v145;

LABEL_76:
    id v127 = [v156 compositeIdentifier];
    uint64_t v128 = sub_1000207E0();
    uint64_t v130 = v129;

    uint64_t v131 = sub_100016898((uint64_t)v117);
    swift_bridgeObjectRelease();
    id v132 = objc_allocWithZone((Class)WFActionRequest);
    id v133 = sub_1000175E0(v128, v130, v131);
    uint64_t v134 = swift_allocObject();
    *(_OWORD *)(v134 + 16) = v152;
    *(void *)(v134 + 32) = v133;
    v168[0] = (id)v134;
    sub_1000208B0();
    id v19 = v168[0];
    sub_100007924(0, (unint64_t *)&unk_100033388);
    id v135 = v133;
    Class v136 = sub_100020880().super.isa;
    swift_bridgeObjectRelease();
    id v137 = v143;
    [v143 createActionsForRequests:v136];

    id v138 = [v135 result];
    v139 = v144;
    if (v138)
    {
      v140 = v138;
      self;
      v141 = (void *)swift_dynamicCastObjCClass();
      if (v141)
      {
        id v19 = v141;
        [v141 forceUpdateParameterVisibility];

        return (uint64_t)v19;
      }
    }
    sub_100018FDC();
    swift_allocError();
    unsigned char *v142 = 0;
    swift_willThrow();

LABEL_28:
    return (uint64_t)v19;
  }
  v148 = v117;
  if (WFLogCategoryFocusConfiguration)
  {
    sub_100020130();
    id v118 = v145;
    uint64_t v119 = sub_100020150();
    os_log_type_t v120 = sub_100020960();
    if (os_log_type_enabled(v119, v120))
    {
      uint64_t v121 = (uint8_t *)swift_slowAlloc();
      uint64_t v122 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v121 = *((void *)v61 + 251);
      unint64_t v167 = (unint64_t)(v121 + 4);
      v168[0] = v122;
      id v123 = [v118 (SEL)v62[401]];
      uint64_t v124 = sub_1000207E0();
      unint64_t v126 = v125;

      uint64_t v169 = sub_100017A54(v124, v126, (uint64_t *)v168);
      sub_1000209D0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v119, v120, "No serialized parameters for action %s, it's likely something went wrong.", v121, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v157 + 8))(v151, v166);
    id v11 = v145;
    uint64_t v117 = v148;
    goto LABEL_76;
  }
LABEL_90:
  __break(1u);
LABEL_91:
  uint64_t result = sub_100020B40();
  __break(1u);
  return result;
}

uint64_t sub_10001673C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v3)
  {
    while (1)
    {
      id v4 = (a2 & 0xC000000000000001) != 0 ? (id)sub_100020A30() : *(id *)(a2 + 32);
      uint64_t v5 = v4;
      sub_100007924(0, &qword_100033370);
      char v6 = sub_1000209A0();

      if (v6) {
        break;
      }
      if (v3 != 1)
      {
        uint64_t v9 = 5;
        while (1)
        {
          id v10 = (a2 & 0xC000000000000001) != 0 ? (id)sub_100020A30() : *(id *)(a2 + 8 * v9);
          id v11 = v10;
          uint64_t v12 = v9 - 3;
          if (__OFADD__(v9 - 4, 1)) {
            break;
          }
          char v7 = sub_1000209A0();

          if ((v7 & 1) == 0)
          {
            ++v9;
            if (v12 != v3) {
              continue;
            }
          }
          goto LABEL_9;
        }
        __break(1u);
LABEL_19:
        swift_bridgeObjectRetain();
        uint64_t v3 = sub_100020AF0();
        if (v3) {
          continue;
        }
      }
      goto LABEL_8;
    }
    char v7 = 1;
  }
  else
  {
LABEL_8:
    char v7 = 0;
  }
LABEL_9:
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_100016898(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000061EC(&qword_1000333A8);
    uint64_t v2 = (void *)sub_100020B10();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  char v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v15 = (void *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v16 = v15[1];
    *(void *)&v36[0] = *v15;
    *((void *)&v36[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    sub_1000061EC(&qword_1000333B0);
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_10000783C(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_10000783C(v35, v36);
    sub_10000783C(v36, &v32);
    uint64_t result = sub_100020A00(v2[5]);
    uint64_t v17 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)&v6[8 * (v18 >> 6)]) == 0)
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v17) >> 6;
      while (++v19 != v22 || (v21 & 1) == 0)
      {
        BOOL v23 = v19 == v22;
        if (v19 == v22) {
          unint64_t v19 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)&v6[8 * v19];
        if (v24 != -1)
        {
          unint64_t v20 = __clz(__rbit64(~v24)) + (v19 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)&v6[8 * (v18 >> 6)])) | v18 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v6[(v20 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v20;
    uint64_t v25 = v2[6] + 40 * v20;
    *(_OWORD *)uint64_t v25 = v28;
    *(_OWORD *)(v25 + 16) = v29;
    *(void *)(v25 + 32) = v30;
    uint64_t result = (uint64_t)sub_10000783C(&v32, (_OWORD *)(v2[7] + 32 * v20));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v27 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_36:
    swift_release();
    sub_100019088();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v27 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100016C4C(uint64_t a1)
{
  v1[16] = a1;
  sub_100020900();
  v1[17] = sub_1000208F0();
  uint64_t v3 = sub_1000208E0();
  v1[18] = v3;
  v1[19] = v2;
  return _swift_task_switch(sub_100016CE4, v3, v2);
}

uint64_t sub_100016CE4()
{
  sub_1000196A0();
  id v1 = [*(id *)(v0 + 128) contextualAction];
  *(void *)(v0 + 160) = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_100016E60;
    uint64_t v3 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_100013BB8;
    *(void *)(v0 + 104) = &unk_10002D920;
    *(void *)(v0 + 112) = v3;
    [v2 getActionRepresentationTakingInput:0 context:0 completionHandler:v0 + 80];
    return _swift_continuation_await(v0 + 16);
  }
  else
  {
    swift_release();
    sub_100018FDC();
    sub_1000197B0();
    *uint64_t v4 = 0;
    swift_willThrow();
    sub_1000196EC();
    return v5();
  }
}

uint64_t sub_100016E60()
{
  sub_100019694();
  sub_100019600();
  sub_100019654();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  uint64_t v4 = v3[6];
  *(void *)(v1 + 168) = v4;
  uint64_t v5 = v3[19];
  uint64_t v6 = v3[18];
  if (v4) {
    uint64_t v7 = sub_1000170C8;
  }
  else {
    uint64_t v7 = sub_100016F64;
  }
  return _swift_task_switch(v7, v6, v5);
}

uint64_t sub_100016F64()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 120);
  NSString v2 = sub_1000207D0();
  id v3 = [v1 parameterForKey:v2];

  if (v3)
  {
    NSString v4 = sub_1000207D0();
    id v5 = [v1 createStateForParameter:v3 fromSerializedRepresentation:v4];

    NSString v6 = [v3 key];
    if (!v6)
    {
      sub_1000207E0();
      NSString v6 = sub_1000207D0();
      swift_bridgeObjectRelease();
    }
    [v1 setParameterState:v5 forKey:v6];

    swift_unknownObjectRelease();
  }

  uint64_t v7 = sub_100019724();
  return v8(v7);
}

uint64_t sub_1000170C8()
{
  sub_1000196A0();
  uint64_t v1 = *(void **)(v0 + 160);
  swift_release();
  swift_willThrow();

  sub_1000196EC();
  return v2();
}

void sub_100017138(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = sub_100019948();
    sub_100013BBC(v4, v5);
  }
  else if (a2)
  {
    id v6 = a2;
    uint64_t v7 = sub_100019948();
    sub_100013C18(v7, v8);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100017180(void *a1)
{
  id v2 = [a1 mode];
  if (v2 == (id)1)
  {
    id v3 = [a1 contextualAction];
    if (v3)
    {
      uint64_t v4 = v3;
      NSString v5 = [v3 actionIdentifier];
      if (!v5)
      {
        sub_1000207E0();
        NSString v5 = sub_1000207D0();
        swift_bridgeObjectRelease();
      }
      id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithSystemFilterType:v5];
LABEL_13:

      return (uint64_t)v6;
    }
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (!v2)
  {
    id v7 = [a1 actionIdentifier];
    if (v7)
    {
      uint64_t v4 = v7;
      NSString v8 = [v7 bundleIdentifier];
      if (!v8)
      {
        sub_1000207E0();
        NSString v8 = sub_1000207D0();
        swift_bridgeObjectRelease();
      }
      NSString v5 = [v4 actionIdentifier];
      if (!v5)
      {
        sub_1000207E0();
        NSString v5 = sub_1000207D0();
        swift_bridgeObjectRelease();
      }
      id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithAppBundleIdentifier:v8 intentType:v5];

      goto LABEL_13;
    }
    goto LABEL_15;
  }
LABEL_16:
  uint64_t result = sub_100020AE0();
  __break(1u);
  return result;
}

uint64_t sub_10001735C()
{
  self;
  if (swift_dynamicCastObjCClass()) {
    goto LABEL_18;
  }
  id v1 = [v0 key];
  uint64_t v2 = sub_1000207E0();
  uint64_t v4 = v3;

  if (v2 == sub_1000207E0() && v4 == v5) {
    goto LABEL_17;
  }
  char v7 = sub_100020B30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v8 = 0;
  if (v7) {
    return v8 & 1;
  }
  id v9 = [v0 key];
  uint64_t v10 = sub_1000207E0();
  uint64_t v12 = v11;

  if (v10 == sub_1000207E0() && v12 == v13)
  {
LABEL_17:
    swift_bridgeObjectRelease_n();
LABEL_18:
    char v8 = 0;
    return v8 & 1;
  }
  char v15 = sub_100020B30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v8 = 0;
  if ((v15 & 1) == 0)
  {
    id v16 = [v0 key];
    uint64_t v17 = sub_1000207E0();
    uint64_t v19 = v18;

    if (v17 != sub_1000207E0() || v19 != v20)
    {
      char v22 = sub_100020B30();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v8 = v22 ^ 1;
      return v8 & 1;
    }
    goto LABEL_17;
  }
  return v8 & 1;
}

uint64_t sub_100017530@<X0>(BOOL *a1@<X8>)
{
  sub_1000061EC(&qword_100033458);
  uint64_t result = sub_1000206E0();
  *a1 = (v3 & 1) == 0;
  return result;
}

uint64_t sub_100017588()
{
  return sub_1000206F0();
}

id sub_1000175E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = sub_1000207D0();
  swift_bridgeObjectRelease();
  if (a3)
  {
    v6.super.Class isa = sub_1000207A0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.Class isa = 0;
  }
  id v7 = [v3 initWithActionIdentifier:v5 serializedParameters:v6.super.isa];

  return v7;
}

unint64_t sub_100017680(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

char *sub_1000176A4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_100020B20();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_100017738(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_100020B20();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

char *sub_1000177D4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_100020B20();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

uint64_t sub_100017870(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_100020B20();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_100017950(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (BOOL v3 = a1 + 24 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_100020B20();
    __break(1u);
  }
  else
  {
    sub_1000061EC(&qword_1000333D0);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_100017A54(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100017B28(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000784C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000784C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000078A8((uint64_t)v12);
  return v7;
}

uint64_t sub_100017B28(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100017C80((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1000209E0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100017D58(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_100020A40();
    if (!v8)
    {
      uint64_t result = sub_100020AD0();
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

void *sub_100017C80(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100020B20();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100017D58(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100017DF0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100017FCC(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100017FCC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100017DF0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_100020840();
    if (v2) {
      goto LABEL_6;
    }
    return _swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_100017F64(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100020A20();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_100020B20();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_100020AD0();
  __break(1u);
  return result;
}

void *sub_100017F64(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_1000061EC(&qword_1000333A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100017FCC(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000061EC(&qword_1000333A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10001817C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000180A4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1000180A4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100020B20();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_10001817C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_100020B20();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

char *sub_10001820C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001824C(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_10001822C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100018330(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_10001824C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000061EC(&qword_100033400);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1000176A4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100017870((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_100018330(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1000061EC(&qword_1000333C8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1000177D4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100017950((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

unint64_t sub_10001841C(uint64_t a1, uint64_t a2)
{
  sub_100020B90();
  sub_100020810();
  Swift::Int v4 = sub_100020BB0();
  return sub_100018494(a1, a2, v4);
}

unint64_t sub_100018494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100020B30() & 1) == 0)
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
      while (!v14 && (sub_100020B30() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100018578(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_1000061EC(a3);
  sub_1000198EC();
  char v39 = a2;
  uint64_t v7 = sub_100020B00();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_39;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  unint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  if (!v11) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v15 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v14 << 6))
  {
    char v21 = (uint64_t *)(*(void *)(v6 + 48) + 16 * i);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    uint64_t v24 = *(void **)(*(void *)(v6 + 56) + 8 * i);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v25 = v24;
    }
    sub_100020B90();
    sub_100020810();
    uint64_t result = sub_100020BB0();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) == 0)
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
        uint64_t v33 = *(void *)(v12 + 8 * v28);
        if (v33 != -1)
        {
          unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
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
    unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v12 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    uint64_t v34 = (void *)(*(void *)(v8 + 48) + 16 * v29);
    *uint64_t v34 = v23;
    v34[1] = v22;
    *(void *)(*(void *)(v8 + 56) + 8 * v29) = v24;
    ++*(void *)(v8 + 16);
    if (v11) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v17 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      goto LABEL_41;
    }
    if (v17 >= v37)
    {
      swift_release();
      uint64_t v4 = v36;
      uint64_t v18 = (void *)(v6 + 64);
      goto LABEL_34;
    }
    uint64_t v18 = (void *)(v6 + 64);
    unint64_t v19 = *(void *)(v38 + 8 * v17);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v17 + 1;
      if (v17 + 1 >= v37) {
        goto LABEL_32;
      }
      unint64_t v19 = *(void *)(v38 + 8 * v14);
      if (!v19) {
        break;
      }
    }
LABEL_18:
    unint64_t v11 = (v19 - 1) & v19;
  }
  int64_t v20 = v17 + 2;
  if (v20 < v37)
  {
    unint64_t v19 = *(void *)(v38 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        int64_t v14 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          goto LABEL_42;
        }
        if (v14 >= v37) {
          goto LABEL_32;
        }
        unint64_t v19 = *(void *)(v38 + 8 * v14);
        ++v20;
        if (v19) {
          goto LABEL_18;
        }
      }
    }
    int64_t v14 = v20;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  uint64_t v4 = v36;
LABEL_34:
  if (v39)
  {
    uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
    if (v35 >= 64) {
      sub_100018870(0, (unint64_t)(v35 + 63) >> 6, v18);
    }
    else {
      *uint64_t v18 = -1 << v35;
    }
    *(void *)(v6 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_100018870(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_10001888C(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return swift_bridgeObjectRelease();
  }
  for (unint64_t i = (void **)(swift_bridgeObjectRetain() + 48); ; i += 3)
  {
    uint64_t v7 = (uint64_t)*(i - 2);
    uint64_t v6 = (uint64_t)*(i - 1);
    uint64_t v8 = *i;
    uint64_t v9 = (void *)*a3;
    swift_bridgeObjectRetain();
    id v10 = v8;
    unint64_t v12 = sub_10001841C(v7, v6);
    uint64_t v13 = v9[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_100020B40();
      __break(1u);
      goto LABEL_20;
    }
    char v16 = v11;
    if (v9[3] < v15) {
      break;
    }
    if (a2)
    {
      if (v11) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_1000061EC(&qword_1000333C0);
      sub_100020AB0();
      if (v16) {
        goto LABEL_14;
      }
    }
LABEL_10:
    unint64_t v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    int64_t v20 = (uint64_t *)(v19[6] + 16 * v12);
    *int64_t v20 = v7;
    v20[1] = v6;
    *(void *)(v19[7] + 8 * v12) = v10;
    uint64_t v21 = v19[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_18;
    }
    v19[2] = v23;
    a2 = 1;
    if (!--v3) {
      return swift_bridgeObjectRelease_n();
    }
  }
  sub_100018578(v15, a2 & 1, &qword_1000333B8);
  unint64_t v17 = sub_10001841C(v7, v6);
  if ((v16 & 1) != (v18 & 1)) {
    goto LABEL_19;
  }
  unint64_t v12 = v17;
  if ((v16 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  swift_allocError();
  swift_willThrow();
  swift_errorRetain();
  sub_1000061EC(&qword_100033340);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    return swift_errorRelease();
  }
LABEL_20:
  sub_100020A10(30);
  v26._object = (void *)0x8000000100029150;
  v26._countAndFlagsBits = 0xD00000000000001BLL;
  sub_100020830(v26);
  sub_100020A90();
  v27._countAndFlagsBits = 39;
  v27._object = (void *)0xE100000000000000;
  sub_100020830(v27);
  uint64_t result = sub_100020AE0();
  __break(1u);
  return result;
}

uint64_t sub_100018B68(void *a1, unint64_t a2, char a3, void *a4)
{
  uint64_t v4 = (char *)a2;
  uint64_t v5 = a1;
  uint64_t v6 = (void *)a1[2];
  if (v6)
  {
    uint64_t v10 = a1[4];
    uint64_t v9 = a1[5];
    if (a2 >> 62) {
      goto LABEL_28;
    }
    uint64_t v11 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    while (v11)
    {
      unint64_t v12 = v4;
      uint64_t v4 = 0;
      BOOL v32 = v5;
      unint64_t v33 = (unint64_t)v12 & 0xC000000000000001;
      unint64_t v29 = v12 + 32;
      uint64_t v13 = v11 - 1;
      BOOL v14 = v5 + 7;
      uint64_t v30 = v13;
      unint64_t v31 = (char *)v6 - 1;
      while (1)
      {
        id v15 = v33 ? (id)sub_100020A30() : *(id *)&v29[8 * (void)v4];
        uint64_t v34 = v15;
        uint64_t v6 = (void *)*a4;
        unint64_t v17 = sub_10001841C(v10, v9);
        uint64_t v18 = v6[2];
        BOOL v19 = (v16 & 1) == 0;
        uint64_t v20 = v18 + v19;
        if (__OFADD__(v18, v19)) {
          break;
        }
        uint64_t v5 = v16;
        if (v6[3] >= v20)
        {
          if (a3)
          {
            if (v16) {
              goto LABEL_21;
            }
          }
          else
          {
            sub_1000061EC(&qword_100033438);
            uint64_t v6 = a4;
            sub_100020AB0();
            if (v5)
            {
LABEL_21:
              swift_allocError();
              swift_willThrow();
              swift_errorRetain();
              sub_1000061EC(&qword_100033340);
              if ((swift_dynamicCast() & 1) == 0)
              {
                swift_bridgeObjectRelease();

                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease_n();
                return swift_errorRelease();
              }
              goto LABEL_32;
            }
          }
        }
        else
        {
          sub_100018578(v20, a3 & 1, &qword_100033430);
          uint64_t v6 = (void *)*a4;
          unint64_t v21 = sub_10001841C(v10, v9);
          if ((v5 & 1) != (v22 & 1))
          {
            sub_100020B40();
            __break(1u);
LABEL_32:
            sub_100020A10(30);
            v35._object = (void *)0x8000000100029150;
            v35._countAndFlagsBits = 0xD00000000000001BLL;
            sub_100020830(v35);
            sub_100020A90();
            v36._countAndFlagsBits = 39;
            v36._object = (void *)0xE100000000000000;
            sub_100020830(v36);
            uint64_t result = sub_100020AE0();
            __break(1u);
            return result;
          }
          unint64_t v17 = v21;
          if (v5) {
            goto LABEL_21;
          }
        }
        uint64_t v23 = (void *)*a4;
        *(void *)(*a4 + 8 * (v17 >> 6) + 64) |= 1 << v17;
        uint64_t v24 = (uint64_t *)(v23[6] + 16 * v17);
        *uint64_t v24 = v10;
        v24[1] = v9;
        *(void *)(v23[7] + 8 * v17) = v34;
        uint64_t v25 = v23[2];
        BOOL v26 = __OFADD__(v25, 1);
        uint64_t v27 = v25 + 1;
        if (v26) {
          goto LABEL_26;
        }
        v23[2] = v27;
        if (v31 == v4) {
          goto LABEL_24;
        }
        uint64_t v6 = v32;
        if ((unint64_t)(v4 + 1) >= v32[2]) {
          goto LABEL_27;
        }
        if ((char *)v30 == v4)
        {
LABEL_24:
          swift_bridgeObjectRelease_n();
          return swift_bridgeObjectRelease_n();
        }
        uint64_t v10 = *(v14 - 1);
        uint64_t v9 = *v14;
        swift_bridgeObjectRetain();
        v14 += 2;
        ++v4;
        a3 = 1;
      }
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_100020AF0();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_100018F78(void *a1)
{
  id v1 = [a1 possibleStates];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_1000061EC(&qword_1000332D0);
  uint64_t v3 = sub_100020890();

  return v3;
}

unint64_t sub_100018FDC()
{
  unint64_t result = qword_100033348;
  if (!qword_100033348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100033348);
  }
  return result;
}

uint64_t sub_100019028(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_1000207E0();

  return v4;
}

uint64_t sub_100019088()
{
  return swift_release();
}

unint64_t sub_100019090()
{
  unint64_t result = qword_100032DF8;
  if (!qword_100032DF8)
  {
    type metadata accessor for FocusConfigurationActionViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100032DF8);
  }
  return result;
}

uint64_t sub_1000190E4()
{
  sub_1000196A0();
  uint64_t v3 = v2;
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_100019194;
  return sub_10001483C(v3, v4, v5, v6);
}

uint64_t sub_100019194()
{
  sub_100019694();
  sub_100019600();
  uint64_t v1 = *v0;
  sub_100019654();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_1000196EC();
  return v3();
}

uint64_t sub_100019258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100019280(uint64_t a1)
{
  uint64_t v2 = sub_1000061EC((uint64_t *)&unk_1000333E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000192E0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100012228();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100019310()
{
  return sub_100011CEC();
}

id sub_10001933C@<X0>(char *a1@<X8>)
{
  return sub_100012150(*(void *)(v1 + 32), a1);
}

uint64_t sub_10001934C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001938C(unsigned char *a1)
{
  return sub_1000121A8(a1, v1[2], v1[3], v1[4]);
}

unsigned char *initializeBufferWithCopyOfBuffer for FocusConfigurationError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FocusConfigurationError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FocusConfigurationError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000194F8);
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

uint64_t sub_100019520(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100019528(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FocusConfigurationError()
{
  return &type metadata for FocusConfigurationError;
}

unint64_t sub_100019544()
{
  unint64_t result = qword_100033450;
  if (!qword_100033450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033450);
  }
  return result;
}

uint64_t sub_100019594@<X0>(BOOL *a1@<X8>)
{
  return sub_100017530(a1);
}

uint64_t sub_1000195A8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 49, 7);
}

uint64_t sub_1000195F0()
{
  return sub_100017588();
}

void sub_100019618()
{
  *(void *)(v0 + 8 * (v3 >> 6) + 64) |= 1 << v3;
  uint64_t v5 = (void *)(*(void *)(v0 + 48) + 16 * v3);
  *uint64_t v5 = v1;
  v5[1] = v4;
  *(void *)(*(void *)(v0 + 56) + 8 * v3) = v2;
}

uint64_t sub_100019660()
{
  return swift_slowDealloc();
}

id sub_1000196C8(char a1)
{
  return sub_100014134(v1, a1 & 1, 0, 0);
}

uint64_t sub_1000196EC()
{
  return v0 + 8;
}

uint64_t sub_100019724()
{
  return v0;
}

uint64_t sub_100019730()
{
  return swift_slowAlloc();
}

void sub_10001974C()
{
  *(void *)(v1 + 192) = v0;
}

uint64_t sub_100019774()
{
  return v0;
}

uint64_t sub_1000197B0()
{
  return swift_allocError();
}

unint64_t sub_1000197C8()
{
  return sub_10001841C(v0, v1);
}

id sub_1000197E0(char a1)
{
  return sub_100014134(v1, a1 & 1, 0, 0);
}

uint64_t sub_100019814()
{
  return v0;
}

uint64_t sub_10001982C()
{
  return swift_allocObject();
}

uint64_t sub_100019844()
{
  return swift_slowAlloc();
}

uint64_t sub_10001985C()
{
  return sub_100020130();
}

void sub_10001988C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v6, v5, a4, v4, 0xCu);
}

uint64_t sub_1000198AC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000198CC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000198EC()
{
  return v0;
}

uint64_t sub_1000198F8()
{
  return swift_continuation_init();
}

uint64_t sub_100019910()
{
  return sub_1000208F0();
}

uint64_t sub_100019928(float a1)
{
  *char v1 = a1;
  return swift_errorRetain();
}

uint64_t sub_100019948()
{
  return v0;
}

uint64_t sub_100019954()
{
  return swift_dynamicCastObjCClass();
}

uint64_t sub_10001996C()
{
  return sub_1000208E0();
}

void sub_100019984()
{
}

uint64_t sub_1000199A4(uint64_t a1)
{
  return sub_10001CD24(a1, OBJC_IVAR___WFFocusConfigurationServiceViewController_request);
}

uint64_t sub_1000199B0(uint64_t a1)
{
  return sub_10001CD24(a1, OBJC_IVAR___WFFocusConfigurationServiceViewController_configurationViewModel);
}

uint64_t sub_1000199BC(uint64_t a1)
{
  return sub_10001CD24(a1, OBJC_IVAR___WFFocusConfigurationServiceViewController_hostingViewController);
}

uint64_t sub_1000199C8()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  uint64_t v10 = sub_10001C8F0;
  uint64_t v11 = v1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100019DF4;
  uint64_t v9 = &unk_10002DB88;
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = v0;
  swift_release();
  id v4 = [v3 _remoteViewControllerProxyWithErrorHandler:v2];
  _Block_release(v2);
  if (v4)
  {
    sub_1000209F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_10001C910((uint64_t)v7, (uint64_t)aBlock);
  if (v9)
  {
    sub_1000061EC(&qword_1000336B0);
    if (swift_dynamicCast()) {
      return v6;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_10001C978((uint64_t)aBlock, &qword_100033648);
    return 0;
  }
}

void sub_100019B34(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100020160();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!WFLogCategoryFocusConfiguration) {
    __break(1u);
  }
  sub_100020130();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v8 = sub_100020150();
  os_log_type_t v9 = sub_100020960();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v17 = a2;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    if (a1)
    {
      swift_errorRetain();
      uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v18 = v12;
      sub_1000209D0();
    }
    else
    {
      uint64_t v18 = 0;
      sub_1000209D0();
      uint64_t v12 = 0;
    }
    *uint64_t v11 = v12;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Connection interrupted to focus configuration host process: %@", v10, 0xCu);
    sub_1000061EC(&qword_100033590);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    a2 = v17;
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v13 = [a2 extensionContext];
  if (v13)
  {
    if (a1)
    {
      BOOL v14 = v13;
      id v15 = (void *)sub_100020000();
      [v14 cancelRequestWithError:v15];
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100019DF4(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_100019E60()
{
  uint64_t v0 = (void *)WFFocusConfigurationServiceXPCInterface();
  return v0;
}

id sub_100019EB4()
{
  uint64_t v0 = (void *)WFFocusConfigurationHostXPCInterface();
  return v0;
}

void sub_100019F08()
{
  uint64_t v1 = sub_1000061EC(&qword_1000336F8);
  __chkstk_darwin(v1);
  v61.receiver = v0;
  v61.super_class = (Class)type metadata accessor for FocusConfigurationServiceViewController();
  objc_msgSendSuper2(&v61, "loadView");
  id v2 = sub_10001CD58();
  if (!v2)
  {
    __break(1u);
    goto LABEL_18;
  }
  id v3 = v2;
  id v4 = self;
  id v5 = [v4 systemGroupedBackgroundColor];
  [v3 setBackgroundColor:v5];

  sub_100020270();
  sub_10000E9E0(&qword_100033700, &qword_1000336F8);
  sub_1000206D0();
  id v6 = objc_allocWithZone((Class)sub_1000061EC(&qword_100033708));
  uint64_t v7 = (void *)sub_100020450();
  [v0 addChildViewController:v7];
  id v8 = sub_10001CD40();
  if (!v8)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  os_log_type_t v9 = v8;
  id v10 = sub_10001CD58();
  if (!v10)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v11 = v10;
  [v10 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  objc_msgSend(v9, "setFrame:", v13, v15, v17, v19);
  id v20 = sub_10001CD40();
  if (!v20)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  unint64_t v21 = v20;
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v22 = sub_10001CD40();
  if (!v22)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v23 = v22;
  id v24 = [v4 systemGroupedBackgroundColor];
  [v23 setBackgroundColor:v24];

  id v25 = sub_10001CD58();
  if (!v25)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  BOOL v26 = v25;
  id v27 = sub_10001CD40();
  if (!v27)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v28 = v27;
  [v26 addSubview:v27];

  sub_1000061EC(&qword_100033710);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_100022BD0;
  id v30 = sub_10001CD40();
  if (!v30)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v31 = v30;
  id v32 = [v30 topAnchor];

  id v33 = sub_10001CD58();
  if (!v33)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v34 = v33;
  id v35 = [v33 topAnchor];

  id v36 = sub_10001CDC4();
  *(void *)(v29 + 32) = v36;
  id v37 = sub_10001CD40();
  if (!v37)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v38 = v37;
  id v39 = [v37 bottomAnchor];

  id v40 = sub_10001CD58();
  if (!v40)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v41 = v40;
  id v42 = [v40 bottomAnchor];

  id v43 = sub_10001CDC4();
  *(void *)(v29 + 40) = v43;
  id v44 = sub_10001CD40();
  if (!v44)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v45 = v44;
  id v46 = [v44 leadingAnchor];

  id v47 = sub_10001CD58();
  if (!v47)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v48 = v47;
  id v49 = [v47 leadingAnchor];

  id v50 = sub_10001CDC4();
  *(void *)(v29 + 48) = v50;
  id v51 = sub_10001CD40();
  if (!v51)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  id v52 = v51;
  id v53 = [v51 trailingAnchor];

  id v54 = sub_10001CD58();
  if (v54)
  {
    unint64_t v55 = v54;
    id v56 = self;
    id v57 = [v55 trailingAnchor];

    id v58 = [v53 constraintEqualToAnchor:v57];
    *(void *)(v29 + 56) = v58;
    sub_1000208B0();
    sub_100007924(0, (unint64_t *)&qword_100033718);
    Class isa = sub_100020880().super.isa;
    swift_bridgeObjectRelease();
    [v56 activateConstraints:isa];

    id v60 = v7;
    sub_1000199BC((uint64_t)v7);

    return;
  }
LABEL_31:
  __break(1u);
}

id sub_10001A52C(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for FocusConfigurationServiceViewController();
  objc_msgSendSuper2(&v4, "viewWillDisappear:", a1 & 1);
  return [self invalidateAllConnections];
}

uint64_t sub_10001A5DC()
{
  sub_100019694();
  v1[2] = v2;
  v1[3] = v0;
  sub_1000061EC((uint64_t *)&unk_1000333E0);
  v1[4] = swift_task_alloc();
  v1[5] = sub_100020900();
  v1[6] = sub_1000208F0();
  uint64_t v4 = sub_1000208E0();
  return _swift_task_switch(sub_10001A6A4, v4, v3);
}

uint64_t sub_10001A6A4()
{
  sub_10001CDB8();
  uint64_t v2 = (void *)v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = (void *)v0[2];
  swift_release();
  id v4 = v3;
  sub_1000199A4((uint64_t)v3);
  [v2 loadViewIfNeeded];
  uint64_t v5 = sub_100020920();
  sub_100006BE4(v1, 1, 1, v5);
  id v6 = v4;
  id v7 = v2;
  uint64_t v8 = sub_1000208F0();
  os_log_type_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v6;
  v9[5] = v7;
  sub_10001B448(v1, (uint64_t)&unk_100033520, (uint64_t)v9);
  swift_release();
  swift_task_dealloc();
  id v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_10001A7C4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  v5[56] = a4;
  v5[57] = a5;
  uint64_t v7 = sub_100020160();
  v5[58] = v7;
  v5[59] = *(void *)(v7 - 8);
  v5[60] = swift_task_alloc();
  v5[61] = sub_100020900();
  v5[62] = sub_1000208F0();
  objc_allocWithZone((Class)type metadata accessor for FocusConfigurationActionViewModel());
  id v8 = a4;
  os_log_type_t v9 = (void *)swift_task_alloc();
  v5[63] = v9;
  *os_log_type_t v9 = v5;
  v9[1] = sub_10001A8F4;
  return sub_10000F570();
}

uint64_t sub_10001A8F4()
{
  sub_1000196A0();
  sub_100019600();
  uint64_t v2 = *v1;
  sub_10001CD30();
  *uint64_t v3 = v2;
  *(void *)(v5 + 512) = v4;
  *(void *)(v5 + 520) = v0;
  swift_task_dealloc();
  uint64_t v7 = sub_1000208E0();
  if (v0) {
    id v8 = sub_10001ADE4;
  }
  else {
    id v8 = sub_10001AA28;
  }
  return _swift_task_switch(v8, v7, v6);
}

uint64_t sub_10001AA28()
{
  uint64_t v1 = *(void **)(v0 + 512);
  uint64_t v2 = *(void **)(v0 + 448);
  uint64_t v3 = *(void *)(v0 + 456);
  swift_release();
  sub_100007924(0, &qword_100033598);
  id v4 = v2;
  id v5 = v1;
  uint64_t v6 = (void *)sub_100017180(v4);
  [v6 track];

  uint64_t v7 = *(void **)(v3 + OBJC_IVAR___WFFocusConfigurationServiceViewController_hostingViewController);
  if (v7)
  {
    id v8 = *(id *)(v0 + 512);
    id v9 = v7;
    sub_100008798((uint64_t)v8, v0 + 224);
    uint64_t v10 = *(void *)(v0 + 224);
    uint64_t v11 = *(void *)(v0 + 232);
    char v12 = *(unsigned char *)(v0 + 240);
    uint64_t v13 = *(void *)(v0 + 280);
    char v14 = *(unsigned char *)(v0 + 288);
    long long v22 = *(_OWORD *)(v0 + 248);
    long long v23 = *(_OWORD *)(v0 + 264);
    uint64_t KeyPath = swift_getKeyPath();
    id v16 = (id)WFUserInterfaceFromViewController();
    *(void *)(v0 + 136) = v10;
    *(void *)(v0 + 144) = v11;
    *(unsigned char *)(v0 + 152) = v12;
    *(_OWORD *)(v0 + 160) = v22;
    *(_OWORD *)(v0 + 176) = v23;
    *(void *)(v0 + 192) = v13;
    *(unsigned char *)(v0 + 200) = v14;
    *(void *)(v0 + 208) = KeyPath;
    *(void *)(v0 + 216) = v16;
    sub_1000061EC(&qword_100033600);
    sub_10001C77C();
    *(void *)(v0 + 408) = sub_1000206D0();
    sub_100020460();
  }
  double v17 = *(char **)(v0 + 512);
  *(void *)(v0 + 440) = *(void *)&v17[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_onConfigurationStateChange];
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1000061EC(&qword_100033298);
  sub_10000E9E0((unint64_t *)&unk_100033630, &qword_100033298);
  sub_100020200();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_100020170();
  swift_endAccess();
  swift_release();
  *(void *)(v0 + 432) = *(void *)&v17[OBJC_IVAR____TtC27FocusConfigurationExtension33FocusConfigurationActionViewModel_onConfigurationButtonTapped];
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_10001C8A8;
  *(void *)(v19 + 24) = v18;
  swift_retain();
  sub_1000061EC(&qword_1000332A8);
  sub_10000E9E0(&qword_100033640, &qword_1000332A8);
  sub_100020200();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_100020170();
  swift_endAccess();
  swift_release();
  sub_1000199B0((uint64_t)v17);

  swift_task_dealloc();
  sub_1000196EC();
  return v20();
}

uint64_t sub_10001ADE4()
{
  swift_release();
  uint64_t result = WFLogCategoryFocusConfiguration;
  if (WFLogCategoryFocusConfiguration)
  {
    uint64_t v2 = *(void **)(v0 + 448);
    sub_100020130();
    id v3 = v2;
    id v4 = sub_100020150();
    os_log_type_t v5 = sub_100020960();
    BOOL v6 = os_log_type_enabled(v4, v5);
    uint64_t v7 = *(void **)(v0 + 448);
    if (v6)
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      id v9 = (void *)swift_slowAlloc();
      *(_DWORD *)id v8 = 138412290;
      *(void *)(v0 + 424) = v7;
      id v10 = v7;
      sub_1000209D0();
      *id v9 = v7;

      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Unable to prepare WFAction for focus configuration request %@", v8, 0xCu);
      sub_1000061EC(&qword_100033590);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v11 = *(void *)(v0 + 456);
    (*(void (**)(void, void))(*(void *)(v0 + 472) + 8))(*(void *)(v0 + 480), *(void *)(v0 + 464));
    char v12 = *(void **)(v11 + OBJC_IVAR___WFFocusConfigurationServiceViewController_hostingViewController);
    if (v12)
    {
      id v40 = v12;
      sub_100020800();
      sub_100020800();
      if (qword_100032848 != -1) {
        swift_once();
      }
      uint64_t v13 = (void *)static NSBundle._current;
      NSString v14 = sub_1000207D0();
      NSString v15 = sub_1000207D0();
      swift_bridgeObjectRelease();
      NSString v16 = sub_1000207D0();
      swift_bridgeObjectRelease();
      id v17 = [v13 localizedStringForKey:v14 value:v15 table:v16];

      uint64_t v18 = sub_1000207E0();
      uint64_t v20 = v19;

      *(void *)(v0 + 392) = v18;
      *(void *)(v0 + 400) = v20;
      sub_100006238();
      uint64_t v21 = sub_100020540();
      uint64_t v23 = v22;
      char v25 = v24 & 1;
      sub_100020610();
      uint64_t v26 = sub_100020520();
      uint64_t v28 = v27;
      char v30 = v29;
      uint64_t v32 = v31;
      swift_release();
      sub_100006DC0(v21, v23, v25);
      swift_bridgeObjectRelease();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v34 = swift_getKeyPath();
      sub_100020750();
      sub_100020280();
      uint64_t v35 = *(void *)(v0 + 296);
      char v36 = *(unsigned char *)(v0 + 304);
      uint64_t v37 = *(void *)(v0 + 312);
      char v38 = *(unsigned char *)(v0 + 320);
      *(void *)(v0 + 16) = v26;
      *(void *)(v0 + 24) = v28;
      *(unsigned char *)(v0 + 32) = v30 & 1;
      *(void *)(v0 + 40) = v32;
      *(void *)(v0 + 48) = KeyPath;
      *(void *)(v0 + 56) = 3;
      *(unsigned char *)(v0 + 64) = 0;
      *(void *)(v0 + 72) = v34;
      *(unsigned char *)(v0 + 80) = 1;
      *(void *)(v0 + 88) = v35;
      *(unsigned char *)(v0 + 96) = v36;
      *(void *)(v0 + 104) = v37;
      *(unsigned char *)(v0 + 112) = v38;
      *(_OWORD *)(v0 + 120) = *(_OWORD *)(v0 + 328);
      sub_1000061EC(&qword_100033540);
      sub_10001C590();
      *(void *)(v0 + 416) = sub_1000206D0();
      sub_100020460();
    }
    swift_errorRelease();
    swift_task_dealloc();
    sub_1000196EC();
    return v39();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B23C()
{
  return sub_100020310();
}

void sub_10001B268(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v3 = (void *)Strong;
    sub_10001B2C4(v1);
  }
}

void *sub_10001B2C4(uint64_t a1)
{
  uint64_t result = (void *)sub_1000199C8();
  if (result)
  {
    [result configurationUIStateDidUpdate:a1];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_10001B320(void *a1, double a2, double a3, double a4, double a5)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v11 = (void *)Strong;
    char v12 = (void *)sub_1000199C8();

    if (v12)
    {
      NSString v13 = [a1 identifier];
      if (!v13)
      {
        sub_1000207E0();
        NSString v13 = sub_1000207D0();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v12, "didPressButtonWithIdentifier:cellFrame:", v13, a2, a3, a4, a5);

      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_10001B410(uint64_t a1, uint64_t (*a2)(void, double, double, double, double))
{
  return a2(*(void *)a1, *(double *)(a1 + 8), *(double *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32));
}

uint64_t sub_10001B448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100020920();
  if (sub_100019258(a1, 1, v6) == 1)
  {
    sub_10001C978(a1, (uint64_t *)&unk_1000333E0);
  }
  else
  {
    sub_100020910();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000208E0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10001B640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_100020900();
  v3[5] = sub_1000208F0();
  uint64_t v5 = sub_1000208E0();
  return _swift_task_switch(sub_10001B6DC, v5, v4);
}

uint64_t sub_10001B6DC()
{
  sub_1000196A0();
  uint64_t v1 = (void *)v0[4];
  id v3 = (void *)v0[2];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  id v4 = v3;
  id v5 = v1;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_10001B79C;
  return sub_10001A5DC();
}

uint64_t sub_10001B79C()
{
  sub_10001CDB8();
  uint64_t v2 = v0;
  id v3 = (void *)*v1;
  id v4 = (void *)*v1;
  sub_10001CD30();
  *id v5 = v4;
  uint64_t v6 = (void *)v3[4];
  uint64_t v7 = (void *)v3[2];
  uint64_t v8 = (void *)*v1;
  *id v5 = *v1;
  swift_task_dealloc();

  uint64_t v9 = v3[6];
  if (v2)
  {
    id v10 = (void *)sub_100020000();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
  _Block_release((const void *)v4[6]);
  uint64_t v11 = (uint64_t (*)(void))v8[1];
  return v11();
}

uint64_t sub_10001B92C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000061EC((uint64_t *)&unk_1000333E0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100020920();
  sub_100006BE4((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_1000336D0;
  v9[5] = v8;
  sub_10001C284((uint64_t)v6, (uint64_t)&unk_1000336E0, (uint64_t)v9);
  return swift_release();
}

id sub_10001BA30(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR___WFFocusConfigurationServiceViewController_request] = 0;
  *(void *)&v3[OBJC_IVAR___WFFocusConfigurationServiceViewController_configurationViewModel] = 0;
  *(void *)&v3[OBJC_IVAR___WFFocusConfigurationServiceViewController_observers] = &_swiftEmptySetSingleton;
  *(void *)&v3[OBJC_IVAR___WFFocusConfigurationServiceViewController_hostingViewController] = 0;
  if (a2)
  {
    NSString v5 = sub_1000207D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for FocusConfigurationServiceViewController();
  id v6 = objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v5, a3);

  return v6;
}

id sub_10001BB48(void *a1)
{
  *(void *)&v1[OBJC_IVAR___WFFocusConfigurationServiceViewController_request] = 0;
  *(void *)&v1[OBJC_IVAR___WFFocusConfigurationServiceViewController_configurationViewModel] = 0;
  *(void *)&v1[OBJC_IVAR___WFFocusConfigurationServiceViewController_observers] = &_swiftEmptySetSingleton;
  *(void *)&v1[OBJC_IVAR___WFFocusConfigurationServiceViewController_hostingViewController] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for FocusConfigurationServiceViewController();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_10001BBF8()
{
  return sub_10001BC04((SEL *)&selRef_dealloc);
}

id sub_10001BC04(SEL *a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for FocusConfigurationServiceViewController();
  return objc_msgSendSuper2(&v4, *a1);
}

uint64_t type metadata accessor for FocusConfigurationServiceViewController()
{
  return self;
}

uint64_t sub_10001BCD0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001BD18()
{
  sub_10001CDB8();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10001CD70(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10001BDB8;
  uint64_t v3 = sub_10001CD9C();
  return sub_10001A7C4(v3, v4, v5, v6, v7);
}

uint64_t sub_10001BDB8()
{
  sub_100019694();
  sub_100019600();
  uint64_t v1 = *v0;
  sub_10001CD30();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_1000196EC();
  return v3();
}

uint64_t sub_10001BE78(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001BF54;
  return v6(a1);
}

uint64_t sub_10001BF54()
{
  sub_100019694();
  sub_100019600();
  uint64_t v1 = *v0;
  sub_10001CD30();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_10001C01C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001C054()
{
  sub_1000196A0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10001CD70(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10001BDB8;
  uint64_t v3 = sub_10001CD80();
  return v4(v3);
}

uint64_t sub_10001C0EC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10001CD14;
  return v6();
}

uint64_t sub_10001C1B8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10001CD14;
  return v7();
}

uint64_t sub_10001C284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100020920();
  if (sub_100019258(a1, 1, v6) == 1)
  {
    sub_10001C978(a1, (uint64_t *)&unk_1000333E0);
  }
  else
  {
    sub_100020910();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000208E0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10001C3F4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001CD20;
  return v6(a1);
}

uint64_t sub_10001C4D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1000203A0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10001C508()
{
  return sub_1000203B0();
}

uint64_t sub_10001C53C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100020360();
  *a1 = result;
  return result;
}

uint64_t sub_10001C568()
{
  return sub_100020370();
}

unint64_t sub_10001C590()
{
  unint64_t result = qword_100033548;
  if (!qword_100033548)
  {
    sub_1000062F0(&qword_100033540);
    sub_10001C60C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033548);
  }
  return result;
}

unint64_t sub_10001C60C()
{
  unint64_t result = qword_100033550;
  if (!qword_100033550)
  {
    sub_1000062F0(&qword_100033558);
    sub_10001C6AC();
    sub_10000E9E0(&qword_100033580, &qword_100033588);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033550);
  }
  return result;
}

unint64_t sub_10001C6AC()
{
  unint64_t result = qword_100033560;
  if (!qword_100033560)
  {
    sub_1000062F0(&qword_100033568);
    sub_10000E9E0(&qword_100033570, &qword_100033578);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033560);
  }
  return result;
}

uint64_t sub_10001C74C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100020300();
  *a1 = result;
  return result;
}

unint64_t sub_10001C77C()
{
  unint64_t result = qword_100033608;
  if (!qword_100033608)
  {
    sub_1000062F0(&qword_100033600);
    sub_10001C81C();
    sub_10000E9E0(&qword_100033618, (uint64_t *)&unk_100033620);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033608);
  }
  return result;
}

unint64_t sub_10001C81C()
{
  unint64_t result = qword_100033610;
  if (!qword_100033610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100033610);
  }
  return result;
}

uint64_t sub_10001C868()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001C8A0(uint64_t *a1)
{
}

void sub_10001C8A8(void *a1, double a2, double a3, double a4, double a5)
{
}

uint64_t sub_10001C8B0(uint64_t a1)
{
  return sub_10001B410(a1, *(uint64_t (**)(void, double, double, double, double))(v1 + 16));
}

uint64_t sub_10001C8B8()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001C8F0(uint64_t a1)
{
  sub_100019B34(a1, *(void **)(v1 + 16));
}

uint64_t sub_10001C8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001C908()
{
  return swift_release();
}

uint64_t sub_10001C910(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000061EC(&qword_100033648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001C978(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000061EC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001C9D4()
{
  _Block_release(*(const void **)(v0 + 24));
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001CA1C()
{
  sub_1000196A0();
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10001CD14;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000336B8 + dword_1000336B8);
  return v6(v2, v3, v4);
}

uint64_t sub_10001CAD0()
{
  sub_10001CDB8();
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10001CD14;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000336C8 + dword_1000336C8);
  return v6(v2, v3, v4);
}

uint64_t sub_10001CB90()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001CBD0()
{
  sub_10001CDB8();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10001CD70(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10001CD14;
  uint64_t v3 = sub_10001CD9C();
  return v4(v3);
}

uint64_t sub_10001CC7C()
{
  sub_1000196A0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_10001CD70(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_10001CD14;
  uint64_t v3 = sub_10001CD80();
  return v4(v3);
}

uint64_t sub_10001CD24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return _objc_release_x1();
}

id sub_10001CD40()
{
  uint64_t v3 = *(const char **)(v1 + 592);
  return [v0 v3];
}

id sub_10001CD58()
{
  uint64_t v3 = *(const char **)(v1 + 592);
  return [v0 v3];
}

uint64_t sub_10001CD70(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_10001CD80()
{
  return v0;
}

uint64_t sub_10001CD9C()
{
  return v0;
}

id sub_10001CDC4()
{
  uint64_t v4 = *(const char **)(v2 + 656);
  return objc_msgSend(v0, v4, v1);
}

uint64_t FocusConfigurationMastheadView.iconConfiguration.getter()
{
  uint64_t v0 = sub_10001DB64();
  sub_10001CE28(v0, v1, v2, v3);
  return sub_10001DB64();
}

id sub_10001CE28(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  if (a4)
  {
    swift_bridgeObjectRetain();
    return a3;
  }
  else
  {
    return (id)swift_bridgeObjectRetain();
  }
}

uint64_t FocusConfigurationMastheadView.title.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WFFocusConfigurationMastheadView_title);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FocusConfigurationMastheadView.subtitle.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WFFocusConfigurationMastheadView_subtitle);
  swift_bridgeObjectRetain();
  return v1;
}

id FocusConfigurationMastheadView.__allocating_init(bundleIdentifier:title:subtitle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v13 = objc_allocWithZone(v6);
  return FocusConfigurationMastheadView.init(bundleIdentifier:title:subtitle:)(a1, a2, a3, a4, a5, a6);
}

id FocusConfigurationMastheadView.init(bundleIdentifier:title:subtitle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6 + OBJC_IVAR___WFFocusConfigurationMastheadView_iconConfiguration;
  *(void *)uint64_t v7 = a1;
  *(void *)(v7 + 8) = a2;
  *(void *)(v7 + 16) = 0;
  *(unsigned char *)(v7 + 24) = 0;
  uint64_t v8 = (void *)(v6 + OBJC_IVAR___WFFocusConfigurationMastheadView_title);
  *uint64_t v8 = a3;
  v8[1] = a4;
  uint64_t v9 = (void *)(v6 + OBJC_IVAR___WFFocusConfigurationMastheadView_subtitle);
  *uint64_t v9 = a5;
  v9[1] = a6;
  uint64_t v15 = type metadata accessor for FocusConfigurationMastheadView();
  double v10 = sub_10001DB4C();
  id v13 = objc_msgSendSuper2(v11, v12, v10, v6, v15);
  sub_10001D300();

  return v13;
}

uint64_t type metadata accessor for FocusConfigurationMastheadView()
{
  return self;
}

objc_super *FocusConfigurationMastheadView.__allocating_init(symbolName:color:title:subtitle:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v15 = objc_allocWithZone(v7);
  return FocusConfigurationMastheadView.init(symbolName:color:title:subtitle:)(a1, a2, a3, a4, a5, a6, a7);
}

objc_super *FocusConfigurationMastheadView.init(symbolName:color:title:subtitle:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = v7 + OBJC_IVAR___WFFocusConfigurationMastheadView_iconConfiguration;
  *(void *)uint64_t v9 = a1;
  *(void *)(v9 + 8) = a2;
  *(void *)(v9 + 16) = a3;
  *(unsigned char *)(v9 + 24) = 1;
  double v10 = (void *)(v7 + OBJC_IVAR___WFFocusConfigurationMastheadView_title);
  *double v10 = a4;
  v10[1] = a5;
  uint64_t v11 = (void *)(v7 + OBJC_IVAR___WFFocusConfigurationMastheadView_subtitle);
  *uint64_t v11 = a6;
  v11[1] = a7;
  uint64_t v17 = type metadata accessor for FocusConfigurationMastheadView();
  id v12 = a3;
  double v13 = sub_10001DB4C();
  id v15 = -[objc_super initWithFrame:](v14, "initWithFrame:", v13, v7, v17);
  sub_10001D300();

  return v15;
}

void sub_10001D300()
{
  uint64_t v1 = v0;
  uint64_t v2 = self;
  id v3 = [v2 clearColor];
  [v1 setBackgroundColor:v3];

  if (*((unsigned char *)v1 + OBJC_IVAR___WFFocusConfigurationMastheadView_iconConfiguration + 24))
  {
    id v4 = objc_allocWithZone((Class)sub_100020120());
    uint64_t v5 = sub_10001DB78();
    sub_10001CE28(v5, v6, v7, 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100020110();
  }
  else
  {
    id v9 = objc_allocWithZone((Class)sub_1000200E0());
    uint64_t v10 = sub_10001DB78();
    sub_10001CE28(v10, v11, v12, 0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1000200D0();
  }
  id v13 = objc_msgSend(v2, "clearColor", v8);
  [v29 setBackgroundColor:v13];

  [v1 addSubview:v29];
  NSString v14 = self;
  sub_1000061EC(&qword_100033710);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100022BD0;
  id v16 = [v1 leadingAnchor];
  id v17 = [v29 leadingAnchor];
  id v18 = sub_10001DB30();

  *(void *)(v15 + 32) = v18;
  id v19 = [v1 trailingAnchor];
  id v20 = [v29 trailingAnchor];
  id v21 = sub_10001DB30();

  *(void *)(v15 + 40) = v21;
  id v22 = [v1 topAnchor];
  id v23 = [v29 topAnchor];
  id v24 = sub_10001DB30();

  *(void *)(v15 + 48) = v24;
  id v25 = [v1 bottomAnchor];
  id v26 = [v29 bottomAnchor];
  id v27 = [v25 constraintEqualToAnchor:v26 constant:36.0];

  *(void *)(v15 + 56) = v27;
  sub_1000208B0();
  sub_10001DAF0();
  Class isa = sub_100020880().super.isa;
  swift_bridgeObjectRelease();
  [v14 activateConstraints:isa];
}

id FocusConfigurationMastheadView.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

void FocusConfigurationMastheadView.init(coder:)()
{
}

id FocusConfigurationMastheadView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, "initWithFrame:", a1, a2, a3, a4);
}

void FocusConfigurationMastheadView.init(frame:)()
{
}

id FocusConfigurationMastheadView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FocusConfigurationMastheadView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void destroy for FocusConfigurationMastheadView.IconConfiguration(uint64_t a1)
{
}

void sub_10001D8B4(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  swift_bridgeObjectRelease();
  if (a4)
  {
  }
}

uint64_t initializeWithCopy for FocusConfigurationMastheadView.IconConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_10001CE28(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for FocusConfigurationMastheadView.IconConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_10001CE28(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  id v9 = *(void **)(a1 + 16);
  char v10 = *(unsigned char *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_10001D8B4(v7, v8, v9, v10);
  return a1;
}

__n128 initializeWithTake for FocusConfigurationMastheadView.IconConfiguration(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FocusConfigurationMastheadView.IconConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v6 = *(void **)(a1 + 16);
  char v8 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  sub_10001D8B4(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for FocusConfigurationMastheadView.IconConfiguration(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 25))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
      if (v3 <= 1) {
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

uint64_t storeEnumTagSinglePayload for FocusConfigurationMastheadView.IconConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_10001DACC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_10001DAD4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FocusConfigurationMastheadView.IconConfiguration()
{
  return &type metadata for FocusConfigurationMastheadView.IconConfiguration;
}

unint64_t sub_10001DAF0()
{
  unint64_t result = qword_100033718;
  if (!qword_100033718)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100033718);
  }
  return result;
}

id sub_10001DB30()
{
  char v4 = *(const char **)(v2 + 656);
  return objc_msgSend(v0, v4, v1);
}

double sub_10001DB4C()
{
  return 0.0;
}

uint64_t sub_10001DB64()
{
  return v0;
}

uint64_t sub_10001DB78()
{
  return v0;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_10001E80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

uint64_t sub_10001E848(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 key];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

BOOL sub_10001E890(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 allowsMultipleValues]
    && ([v3 displaysMultipleValueEditor] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else if ([*(id *)(a1 + 32) showsParameterDescription])
  {
    uint64_t v5 = [v3 localizedDescription];
    BOOL v4 = [v5 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void sub_10001E918(uint64_t a1, unint64_t a2)
{
  if (a2 > *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    BOOL v4 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:");
    uint64_t v5 = [*(id *)(a1 + 32) objectsAtIndexes:v4];
    char v6 = [WFDataConfigurationParametersSection alloc];
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v7 = -[WFDataConfigurationParametersSection initWithParameters:sectionIndex:](v6, "initWithParameters:sectionIndex:", v5);
    [*(id *)(a1 + 40) addObject:v7];
  }
  char v8 = [WFDataConfigurationParametersSection alloc];
  id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v12 = v9;
  char v10 = +[NSArray arrayWithObjects:&v12 count:1];
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v11 = -[WFDataConfigurationParametersSection initWithParameters:sectionIndex:](v8, "initWithParameters:sectionIndex:", v10);

  [*(id *)(a1 + 40) addObject:v11];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 + 1;
}

void sub_10001EA8C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v9 = a2;
  id v4 = a2;
  uint64_t v5 = +[NSArray arrayWithObjects:&v9 count:1];
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v5, v9);

  char v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v4 parameters];
  char v8 = [v7 valueForKey:@"key"];
  [v6 appendItemsWithIdentifiers:v8];
}

NSString *__cdecl sub_10001EB68(id a1, WFFocusConfigurationButton *a2, unint64_t a3)
{
  id v3 = [(WFFocusConfigurationButton *)a2 identifier];
  id v4 = [@"_footerButton_" stringByAppendingString:v3];

  return (NSString *)v4;
}

void sub_10001F544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10001F56C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v9 hasPrefix:@"_footerButton_"])
  {
    uint64_t v11 = [v9 substringFromIndex:objc_msgSend(@"_footerButton_", "length")];
    id v12 = [WeakRetained footerButtons];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001F870;
    v27[3] = &unk_10002DE40;
    id v13 = v11;
    id v28 = v13;
    NSString v14 = objc_msgSend(v12, "if_firstObjectPassingTest:", v27);

    uint64_t v15 = [v7 dequeueReusableCellWithIdentifier:@"ButtonCell" forIndexPath:v8];
    id v16 = +[UIListContentConfiguration cellConfiguration];
    id v17 = [v14 localizedTitle];
    [v16 setText:v17];

    if ([v14 isDestructive]) {
      +[UIColor systemRedColor];
    }
    else {
    id v24 = +[UIColor tintColor];
    }
    id v25 = [v16 textProperties];
    [v25 setColor:v24];

    [v15 setContentConfiguration:v16];
  }
  else
  {
    id v18 = v9;
    uint64_t v15 = [v7 dequeueReusableCellWithIdentifier:@"ParameterEditorHostingCell" forIndexPath:v8];
    [v15 setContainingViewController:WeakRetained];
    [v15 setDelegate:WeakRetained];
    id v19 = [WeakRetained action];
    id v13 = [v19 parameterForKey:v18];

    id v20 = [WeakRetained action];
    id v21 = [v20 parameterStateForKey:v18 fallingBackToDefaultValue:1];

    id v22 = objc_msgSend(objc_alloc((Class)WFParameterEditorModel), "initWithParameter:state:widgetFamily:", v13, v21, objc_msgSend(WeakRetained, "widgetFamily"));
    [v15 updateModel:v22];

    [v15 layoutIfNeeded];
    id v23 = [WeakRetained action];
    [WeakRetained configureCell:v15 forAction:v23 parameter:v13];
  }
  return v15;
}

id sub_10001F870(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_10001FA8C(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredContentSize];
  double v3 = v2;
  double v5 = v4;
  char v6 = [*(id *)(a1 + 32) tableView];
  [v6 contentSize];
  double v8 = v7;
  double v10 = v9;

  if (v3 != v8 || v5 != v10)
  {
    id v12 = [*(id *)(a1 + 32) tableView];
    [v12 contentSize];
    objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
  }
}

void sub_10001FC08(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = v6;
  if (v6)
  {
    double v8 = [*(id *)(a1 + 32) action];
    (*(void (**)(uint64_t, void *, id, void))(v7 + 16))(v7, v8, v9, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, void, uint64_t))(v7 + 16))(v7, 0, 0, a4);
  }
}

void sub_10001FE20(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = a2;
  [v6 addEventObserver:v3];
  double v4 = [v6 resourceManager];
  [v4 addTarget:*(void *)(a1 + 32) selector:"reloadActionParameterModels"];

  if (*(void *)(a1 + 40) == 1) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [v6 setEditingContext:v5];
}

BOOL sub_10001FF24(id a1, WFParameter *a2)
{
  double v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([(WFParameter *)v2 key],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqualToString:WFHandleIntentActionShowWhenRunKey],
        v3,
        (v4 & 1) != 0))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v6 = [(WFParameter *)v2 key];
    if ([v6 isEqualToString:WFLinkActionShowWhenRunKey])
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      uint64_t v7 = [(WFParameter *)v2 key];
      unsigned int v5 = [v7 isEqualToString:WFLinkActionOpenWhenRunKey] ^ 1;
    }
  }

  return v5;
}

uint64_t sub_100020000()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100020010()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100020020()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_100020030()
{
  return type metadata accessor for EditorPresentationEnvironment();
}

uint64_t sub_100020040()
{
  return ParameterRowView.init(parameter:stateStore:processing:shouldFocus:layoutMode:isArrayElement:variableProvider:editorOptions:)();
}

uint64_t sub_100020050()
{
  return type metadata accessor for ParameterRowView();
}

uint64_t sub_100020060()
{
  return type metadata accessor for ParameterLayoutMode();
}

uint64_t sub_100020070()
{
  return dispatch thunk of ParameterStateStore.parameterState.getter();
}

uint64_t sub_100020080()
{
  return dispatch thunk of ParameterStateStore.parameterState.setter();
}

uint64_t sub_100020090()
{
  return ParameterStateStore.__allocating_init(action:parameter:undoManager:)();
}

uint64_t sub_1000200A0()
{
  return type metadata accessor for ParameterStateStore();
}

uint64_t sub_1000200B0()
{
  return FocusFilterConfigurationMasthead.init(bundleIdentifier:title:subtitle:)();
}

uint64_t sub_1000200C0()
{
  return type metadata accessor for FocusFilterConfigurationMasthead();
}

uint64_t sub_1000200D0()
{
  return FocusFilterConfigurationMastheadView.init(bundleIdentifier:title:subtitle:)();
}

uint64_t sub_1000200E0()
{
  return type metadata accessor for FocusFilterConfigurationMastheadView();
}

uint64_t sub_1000200F0()
{
  return FocusFilterSystemConfigurationMasthead.init(title:subtitle:symbolName:tintColor:)();
}

uint64_t sub_100020100()
{
  return type metadata accessor for FocusFilterSystemConfigurationMasthead();
}

uint64_t sub_100020110()
{
  return FocusFilterSystemConfigurationMastheadView.init(title:subtitle:symbolName:color:)();
}

uint64_t sub_100020120()
{
  return type metadata accessor for FocusFilterSystemConfigurationMastheadView();
}

uint64_t sub_100020130()
{
  return static WFLog.subscript.getter();
}

uint64_t sub_100020140()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100020150()
{
  return Logger.logObject.getter();
}

uint64_t sub_100020160()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100020170()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_100020180()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_100020190()
{
  return PassthroughSubject.send(_:)();
}

uint64_t sub_1000201A0()
{
  return PassthroughSubject.init()();
}

void sub_1000201B0()
{
}

uint64_t sub_1000201C0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_1000201D0()
{
  return static Published.subscript.getter();
}

uint64_t sub_1000201E0()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000201F0()
{
  return type metadata accessor for Published();
}

uint64_t sub_100020200()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_100020210()
{
  return static ButtonRole.destructive.getter();
}

uint64_t sub_100020220()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_100020230()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_100020240()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100020250()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_100020260()
{
  return StateObject.projectedValue.getter();
}

uint64_t sub_100020270()
{
  return ProgressView<>.init<>()();
}

uint64_t sub_100020280()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100020290()
{
  return GeometryProxy.frame<A>(in:)();
}

uint64_t sub_1000202A0()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_1000202B0()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t sub_1000202C0()
{
  return ViewDimensions.subscript.getter();
}

uint64_t sub_1000202D0()
{
  return type metadata accessor for GroupedFormStyle();
}

uint64_t sub_1000202E0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_1000202F0()
{
  return EnvironmentValues.undoManager.getter();
}

uint64_t sub_100020300()
{
  return EnvironmentValues.userInterface.getter();
}

uint64_t sub_100020310()
{
  return EnvironmentValues.userInterface.setter();
}

uint64_t sub_100020320()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_100020330()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100020340()
{
  return EnvironmentValues.listSectionSpacing.getter();
}

uint64_t sub_100020350()
{
  return EnvironmentValues.listSectionSpacing.setter();
}

uint64_t sub_100020360()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_100020370()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100020380()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_100020390()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000203A0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1000203B0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000203C0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1000203D0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_1000203E0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_1000203F0()
{
  return static ListSectionSpacing.compact.getter();
}

uint64_t sub_100020400()
{
  return static ListSectionSpacing.default.getter();
}

uint64_t sub_100020410()
{
  return type metadata accessor for ListSectionSpacing();
}

uint64_t sub_100020420()
{
  return static HorizontalAlignment.listRowSeparatorLeading.getter();
}

uint64_t sub_100020430()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100020440()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100020450()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_100020460()
{
  return dispatch thunk of UIHostingController.rootView.setter();
}

uint64_t sub_100020470()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100020480()
{
  return type metadata accessor for GlobalCoordinateSpace();
}

uint64_t sub_100020490()
{
  return static CoordinateSpaceProtocol<>.global.getter();
}

uint64_t sub_1000204A0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1000204B0()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_1000204C0()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_1000204D0()
{
  return static Font.Weight.medium.getter();
}

uint64_t sub_1000204E0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_1000204F0()
{
  return static Font.callout.getter();
}

uint64_t sub_100020500()
{
  return Form.init(content:)();
}

uint64_t sub_100020510()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_100020520()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_100020530()
{
  return Text.font(_:)();
}

uint64_t sub_100020540()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100020550()
{
  return View.allowsPickingVariables(_:)();
}

uint64_t sub_100020560()
{
  return View.presentationEnvironment(_:)();
}

uint64_t sub_100020570()
{
  return View.trackModuleSummaryModal(_:)();
}

uint64_t sub_100020580()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100020590()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000205A0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000205B0()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_1000205C0()
{
  return View.formStyle<A>(_:)();
}

uint64_t sub_1000205D0()
{
  return static Color.accentColor.getter();
}

uint64_t sub_1000205E0()
{
  return Color.init(_:)();
}

uint64_t sub_1000205F0()
{
  return static Color.clear.getter();
}

uint64_t sub_100020600()
{
  return static Color.primary.getter();
}

uint64_t sub_100020610()
{
  return static Color.secondary.getter();
}

uint64_t sub_100020620()
{
  return Image.init(systemName:)();
}

uint64_t sub_100020630()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_100020640()
{
  return Image.renderingMode(_:)();
}

uint64_t sub_100020650()
{
  return type metadata accessor for Image.TemplateRenderingMode();
}

uint64_t sub_100020660()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_100020670()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_100020680()
{
  return State.wrappedValue.getter();
}

uint64_t sub_100020690()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000206A0()
{
  return Button.init(action:label:)();
}

uint64_t sub_1000206B0()
{
  return Button<>.init<A>(_:role:action:)();
}

uint64_t sub_1000206C0()
{
  return Toggle<>.init<A>(_:isOn:)();
}

uint64_t sub_1000206D0()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_1000206E0()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_1000206F0()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_100020700()
{
  return Binding.init(get:set:)();
}

uint64_t sub_100020710()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_100020720()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_100020730()
{
  return Section<>.init(content:)();
}

uint64_t sub_100020740()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_100020750()
{
  return static Alignment.center.getter();
}

uint64_t sub_100020760()
{
  return static Alignment.leading.getter();
}

uint64_t sub_100020770()
{
  return static FormStyle<>.grouped.getter();
}

uint64_t sub_100020780()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_100020790()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary sub_1000207A0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000207B0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000207C0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_1000207D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000207E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000207F0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100020800()
{
  return static String._fromUTF8Repairing(_:)();
}

uint64_t sub_100020810()
{
  return String.hash(into:)();
}

uint64_t sub_100020820()
{
  return String.append<A>(contentsOf:)();
}

void sub_100020830(Swift::String a1)
{
}

Swift::Int sub_100020840()
{
  return String.UTF8View._foreignCount()();
}

BOOL sub_100020850(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_100020860()
{
  return String.init<A>(_:)();
}

uint64_t sub_100020870()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100020880()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100020890()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000208A0()
{
  return Array.description.getter();
}

uint64_t sub_1000208B0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000208D0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000208E0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000208F0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100020900()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100020910()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100020920()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100020930()
{
  return NSOrderedSet.makeIterator()();
}

uint64_t sub_100020940()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100020950()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100020960()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100020970()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100020980()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100020990()
{
  return WFImage.image.getter();
}

uint64_t sub_1000209A0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000209C0()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_1000209D0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000209E0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000209F0()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_100020A00(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

void sub_100020A10(Swift::Int a1)
{
}

uint64_t sub_100020A20()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100020A30()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100020A40()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100020A50()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100020A60()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100020A70()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100020A80()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100020A90()
{
  return _print_unlocked<A, B>(_:_:)();
}

BOOL sub_100020AA0(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

void sub_100020AB0()
{
}

uint64_t sub_100020AC0()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_100020AD0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100020AE0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100020AF0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100020B00()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100020B10()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100020B20()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100020B30()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100020B40()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100020B50()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100020B60()
{
  return Error._code.getter();
}

uint64_t sub_100020B70()
{
  return Error._domain.getter();
}

uint64_t sub_100020B80()
{
  return Error._userInfo.getter();
}

uint64_t sub_100020B90()
{
  return Hasher.init(_seed:)();
}

void sub_100020BA0(Swift::UInt a1)
{
}

Swift::Int sub_100020BB0()
{
  return Hasher._finalize()();
}

uint64_t sub_100020BC0()
{
  return _typeName(_:qualified:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t WFFocusConfigurationHostXPCInterface()
{
  return _WFFocusConfigurationHostXPCInterface();
}

uint64_t WFFocusConfigurationServiceXPCInterface()
{
  return _WFFocusConfigurationServiceXPCInterface();
}

uint64_t WFUserInterfaceFromViewController()
{
  return _WFUserInterfaceFromViewController();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_addEventObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEventObserver:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:selector:");
}

id objc_msgSend_allowsMultipleValues(void *a1, const char *a2, ...)
{
  return _[a1 allowsMultipleValues];
}

id objc_msgSend_appendItemsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendItemsWithIdentifiers:");
}

id objc_msgSend_appendSectionsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendSectionsWithIdentifiers:");
}

id objc_msgSend_applyParametersFromAction_animatingDifferences_hiddenParameterKeys_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyParametersFromAction:animatingDifferences:hiddenParameterKeys:completion:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_buttons(void *a1, const char *a2, ...)
{
  return _[a1 buttons];
}

id objc_msgSend_cellConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 cellConfiguration];
}

id objc_msgSend_configurableParameters(void *a1, const char *a2, ...)
{
  return _[a1 configurableParameters];
}

id objc_msgSend_configurationParametersViewControllerDidPressButton_buttonIdentifier_cellFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationParametersViewControllerDidPressButton:buttonIdentifier:cellFrame:");
}

id objc_msgSend_configurationParametersViewControllerDidUpdateAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationParametersViewControllerDidUpdateAction:");
}

id objc_msgSend_configureCell_forAction_parameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCell:forAction:parameter:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
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

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_displaysMultipleValueEditor(void *a1, const char *a2, ...)
{
  return _[a1 displaysMultipleValueEditor];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_enumerateIndexesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateIndexesUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_footerButtons(void *a1, const char *a2, ...)
{
  return _[a1 footerButtons];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hiddenParameterKeys(void *a1, const char *a2, ...)
{
  return _[a1 hiddenParameterKeys];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_if_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "if_firstObjectPassingTest:");
}

id objc_msgSend_if_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "if_map:");
}

id objc_msgSend_if_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "if_objectsPassingTest:");
}

id objc_msgSend_indexPathForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForCell:");
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSetWithIndexesInRange:");
}

id objc_msgSend_indexesOfObjectsWithOptions_passingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsWithOptions:passingTest:");
}

id objc_msgSend_initWithButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithButtons:");
}

id objc_msgSend_initWithParameter_state_widgetFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameter:state:widgetFamily:");
}

id objc_msgSend_initWithParameters_sectionIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameters:sectionIndex:");
}

id objc_msgSend_initWithTableView_cellProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTableView:cellProvider:");
}

id objc_msgSend_isDestructive(void *a1, const char *a2, ...)
{
  return _[a1 isDestructive];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_itemIdentifierForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemIdentifierForIndexPath:");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedLabel(void *a1, const char *a2, ...)
{
  return _[a1 localizedLabel];
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedTitle];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_parameter(void *a1, const char *a2, ...)
{
  return _[a1 parameter];
}

id objc_msgSend_parameterForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterForKey:");
}

id objc_msgSend_parameterStateForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterStateForKey:");
}

id objc_msgSend_parameterStateForKey_fallingBackToDefaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterStateForKey:fallingBackToDefaultValue:");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSize];
}

id objc_msgSend_processParametersWithoutAskingForValuesWithInput_workQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processParametersWithoutAskingForValuesWithInput:workQueue:completionHandler:");
}

id objc_msgSend_rectForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rectForRowAtIndexPath:");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_reloadActionParameterModels(void *a1, const char *a2, ...)
{
  return _[a1 reloadActionParameterModels];
}

id objc_msgSend_resourceManager(void *a1, const char *a2, ...)
{
  return _[a1 resourceManager];
}

id objc_msgSend_sectionFooter(void *a1, const char *a2, ...)
{
  return _[a1 sectionFooter];
}

id objc_msgSend_sectionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sectionIdentifier];
}

id objc_msgSend_sectionIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 sectionIdentifiers];
}

id objc_msgSend_sectionTitle(void *a1, const char *a2, ...)
{
  return _[a1 sectionTitle];
}

id objc_msgSend_setAlwaysBounceHorizontal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceHorizontal:");
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceVertical:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setContainingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainingViewController:");
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentConfiguration:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDefaultRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultRowAnimation:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEditingContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditingContext:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setFooterButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFooterButtons:");
}

id objc_msgSend_setParameterState_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParameterState:forKey:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_showsParameterDescription(void *a1, const char *a2, ...)
{
  return _[a1 showsParameterDescription];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return _[a1 snapshot];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return _[a1 textProperties];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_updateModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateModel:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return _[a1 visibleCells];
}

id objc_msgSend_visibleParametersWithProcessing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleParametersWithProcessing:");
}

id objc_msgSend_widgetFamily(void *a1, const char *a2, ...)
{
  return _[a1 widgetFamily];
}