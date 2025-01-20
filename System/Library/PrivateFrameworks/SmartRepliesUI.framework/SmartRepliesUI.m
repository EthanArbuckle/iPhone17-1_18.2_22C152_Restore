uint64_t variable initialization expression of SRSmartRepliesActionCardView._colorScheme@<X0>(uint64_t *a1@<X8>)
{
  uint64_t vars8;

  *a1 = swift_getKeyPath();
  sub_25E00AD6C(&qword_26A6D3568);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25E00AC80()
{
  return sub_25E00EB60();
}

uint64_t sub_25E00ACA4(uint64_t a1)
{
  sub_25E00EB20();
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25E00EB70();
}

uint64_t sub_25E00AD6C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void SRSmartRepliesActionCardView.init(metadata:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  sub_25E00AD6C(&qword_26A6D3568);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = type metadata accessor for SRSmartRepliesActionCardView(0);
  *(uint64_t *)((char *)a2 + *(int *)(v4 + 20)) = (uint64_t)a1;
  id v5 = a1;
  sub_25E00EA70();
  uint64_t v7 = v6;
  sub_25E00EA80();
  uint64_t v9 = v8;

  v10 = (uint64_t *)((char *)a2 + *(int *)(v4 + 24));
  void *v10 = v7;
  v10[1] = v9;
}

uint64_t type metadata accessor for SRSmartRepliesActionCardView(uint64_t a1)
{
  return sub_25E00D530(a1, (uint64_t *)&unk_26A6D35D0);
}

double SRSmartRepliesActionCardView.body.getter@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for SRSmartRepliesActionCardView(0);
  if (sub_25E00EA60())
  {
    sub_25E00EAA0();
    uint64_t v2 = sub_25E00EA50();
    if (v2 != sub_25E00EA50())
    {
      sub_25E00EAA0();
      uint64_t v7 = sub_25E00EA50();
      if (v7 != sub_25E00EA50())
      {
        sub_25E00EAA0();
        uint64_t v27 = sub_25E00EA50();
        if (v27 == sub_25E00EA50())
        {
          uint64_t v28 = sub_25E00EA90();
          if (v29) {
            uint64_t v30 = v28;
          }
          else {
            uint64_t v30 = 0;
          }
          unint64_t v31 = 0xE000000000000000;
          if (v29) {
            unint64_t v31 = v29;
          }
          *(void *)&long long v98 = v30;
          *((void *)&v98 + 1) = v31;
          sub_25E00B3C0();
          uint64_t v32 = sub_25E00EC10();
          uint64_t v34 = v32;
          uint64_t v35 = v33;
          char v92 = v32;
          char v37 = v36 & 1;
        }
        else
        {
          sub_25E00EAA0();
          uint64_t v38 = sub_25E00EA50();
          uint64_t v39 = sub_25E00EA50();
          uint64_t v40 = sub_25E00EA90();
          if (v41) {
            uint64_t v42 = v40;
          }
          else {
            uint64_t v42 = 0;
          }
          unint64_t v43 = 0xE000000000000000;
          if (v41) {
            unint64_t v43 = v41;
          }
          if (v38 != v39)
          {
            *(void *)&long long v98 = v42;
            *((void *)&v98 + 1) = v43;
            sub_25E00B3C0();
            sub_25E00EC10();
            sub_25E00E928();
            goto LABEL_13;
          }
          *(void *)&long long v98 = v42;
          *((void *)&v98 + 1) = v43;
          sub_25E00B3C0();
          uint64_t v32 = sub_25E00EC10();
          uint64_t v34 = v32;
          uint64_t v35 = v33;
          char v37 = v44 & 1;
          char v92 = v32;
        }
        sub_25E00B6CC(v32, v33, v37);
        uint64_t v45 = swift_bridgeObjectRetain();
        sub_25E00E94C(v45, v46, v47, MEMORY[0x263F1A820], v48, v49, v50, v51, v67, v70, v73, v76, v79, *((uint64_t *)&v79 + 1), v83, v85, v87, v89, v92);
        sub_25E00EBD0();
        long long v100 = v100;
        long long v101 = 0uLL;
        __int16 v102 = 256;
        sub_25E00AD6C(&qword_26A6D35A0);
        sub_25E00AD6C(&qword_26A6D35C0);
        sub_25E00B508();
        sub_25E00B660();
        uint64_t v52 = sub_25E00EBD0();
        sub_25E00E908(v52, v53, v54, v55, v56, v57, v58, v59, v68, v71, v74, v77, v80);
        sub_25E00AD6C(&qword_26A6D3590);
        unint64_t v60 = sub_25E00B544((uint64_t)&unk_26A6D3588);
        sub_25E00E94C(v60, v61, v62, v60, v63, v64, v65, v66, v69, v72, v75, v78, v81, v82, v84, v86, v88, v90, v93);
        sub_25E00EBD0();
        sub_25E00B6DC(v34, v35, v37);
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      sub_25E00EAB0();
      sub_25E00EAC0();
    }
    sub_25E00B5C8();
    sub_25E00B614();
    sub_25E00EBD0();
    long long v98 = v91;
    long long v99 = v94;
    long long v100 = v95;
    long long v101 = v96;
    __int16 v102 = v97;
    sub_25E00AD6C(&qword_26A6D35A0);
    sub_25E00AD6C(&qword_26A6D35C0);
    sub_25E00B508();
    sub_25E00B660();
    uint64_t v8 = sub_25E00EBD0();
    sub_25E00E908(v8, v9, v10, v11, v12, v13, v14, v15, v67, v70, v73, v76, v79);
LABEL_13:
    sub_25E00AD6C(&qword_26A6D3590);
    unint64_t v16 = sub_25E00B544((uint64_t)&unk_26A6D3588);
    sub_25E00E94C(v16, v17, MEMORY[0x263F1A830], v16, MEMORY[0x263F1A820], v18, v19, v20, v67, v70, v73, v76, v79, *((uint64_t *)&v79 + 1), v83, v85, v87, v89, v91);
    sub_25E00EBD0();
LABEL_14:
    LOBYTE(v91) = v98;
    goto LABEL_15;
  }
  uint64_t v3 = sub_25E00EA90();
  if (v4) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = 0xE000000000000000;
  if (v4) {
    unint64_t v6 = v4;
  }
  *(void *)&long long v98 = v5;
  *((void *)&v98 + 1) = v6;
  sub_25E00B3C0();
  sub_25E00EC10();
  sub_25E00E928();
LABEL_15:
  sub_25E00AD6C(&qword_26A6D3578);
  unint64_t v21 = sub_25E00B40C();
  sub_25E00E94C(v21, v22, MEMORY[0x263F1A830], v21, MEMORY[0x263F1A820], v23, v24, v25, v67, v70, v73, v76, v79, *((uint64_t *)&v79 + 1), v83, v85, v87, v89, v91);
  sub_25E00EBD0();
  double result = *(double *)&v98;
  *(_OWORD *)a1 = v98;
  *(_OWORD *)(a1 + 16) = v99;
  *(_OWORD *)(a1 + 32) = v100;
  *(_OWORD *)(a1 + 48) = v101;
  *(_WORD *)(a1 + 64) = v102;
  *(unsigned char *)(a1 + 66) = v103;
  *(unsigned char *)(a1 + 67) = v104;
  return result;
}

unint64_t sub_25E00B3C0()
{
  unint64_t result = qword_26A6D3570;
  if (!qword_26A6D3570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D3570);
  }
  return result;
}

unint64_t sub_25E00B40C()
{
  unint64_t result = qword_26A6D3580;
  if (!qword_26A6D3580)
  {
    sub_25E00B4C0(&qword_26A6D3578);
    sub_25E00B544((uint64_t)&unk_26A6D3588);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D3580);
  }
  return result;
}

uint64_t sub_25E00B4C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_25E00B508()
{
  return sub_25E00B544((uint64_t)&unk_26A6D3598);
}

unint64_t sub_25E00B544(uint64_t a1)
{
  unint64_t result = sub_25E00E940(a1);
  if (!result)
  {
    unint64_t v6 = v5;
    uint64_t v7 = v4;
    sub_25E00B4C0(v3);
    v7();
    v6();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25E00B5C8()
{
  unint64_t result = qword_26A6D35A8;
  if (!qword_26A6D35A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D35A8);
  }
  return result;
}

unint64_t sub_25E00B614()
{
  unint64_t result = qword_26A6D35B0;
  if (!qword_26A6D35B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D35B0);
  }
  return result;
}

unint64_t sub_25E00B660()
{
  unint64_t result = qword_26A6D35B8;
  if (!qword_26A6D35B8)
  {
    sub_25E00B4C0(&qword_26A6D35C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D35B8);
  }
  return result;
}

uint64_t sub_25E00B6CC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_25E00B6DC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25E00B6EC(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of SRSmartRepliesActionCardView.body>>, 1);
}

uint64_t sub_25E00B708@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25E00EA40();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_25E00B770(double a1, double a2)
{
  sub_25E00AD6C(&qword_26A6D3600);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E00EB00();
  MEMORY[0x270FA5388]();
  *(double *)&long long v22 = a1;
  *((double *)&v22 + 1) = a2;
  int64x2_t v23 = vdupq_n_s64(0x3FA999999999999AuLL);
  type metadata accessor for MKCoordinateRegion(0);
  sub_25E00ECB0();
  long long v22 = v19;
  int64x2_t v23 = v20;
  long long v24 = v21;
  v18[0] = MEMORY[0x263F8EE78];
  sub_25E00D648((uint64_t)&unk_26A6D3608);
  sub_25E00AD6C(&qword_26A6D3610);
  sub_25E00E7F4((uint64_t)&unk_26A6D3618);
  sub_25E00ED20();
  uint64_t v6 = sub_25E00AD6C(&qword_26A6D3620);
  sub_25E00D04C((uint64_t)v5, 1, 1, v6);
  sub_25E00AD6C(&qword_26A6D3628);
  uint64_t v7 = (int *)type metadata accessor for SRSmartRepliesActionCardView.MapLocation(0);
  unint64_t v8 = (*(unsigned __int8 *)(*((void *)v7 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v7 - 1) + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_25E00EF20;
  if (qword_26A6D3560 != -1) {
    swift_once();
  }
  unint64_t v10 = v9 + v8;
  v18[0] = sub_25E00EA20();
  v18[1] = v11;
  sub_25E00B3C0();
  uint64_t v12 = sub_25E00ED10();
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  sub_25E00EA30();
  uint64_t v15 = (uint64_t *)(v10 + v7[5]);
  *uint64_t v15 = v12;
  v15[1] = v14;
  *(_OWORD *)(v10 + v7[6]) = xmmword_25E00EF30;
  unint64_t v16 = (double *)(v10 + v7[7]);
  *unint64_t v16 = a1;
  v16[1] = a2;
  v18[0] = v9;
  sub_25E00AD6C(&qword_26A6D3630);
  sub_25E00AD6C(&qword_26A6D3638);
  sub_25E00E7F4((uint64_t)&unk_26A6D3640);
  sub_25E00E7F4((uint64_t)&unk_26A6D3648);
  sub_25E00D648((uint64_t)&unk_26A6D3650);
  return sub_25E00EAD0();
}

uint64_t sub_25E00BBB8()
{
  return sub_25E00BF44();
}

uint64_t sub_25E00BBD8()
{
  return sub_25E00B770(*v0, v0[1]);
}

uint64_t sub_25E00BBE0()
{
  uint64_t v1 = v0;
  sub_25E00EB00();
  MEMORY[0x270FA5388]();
  sub_25E00AD6C(&qword_26A6D3600);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *((void *)v0 + 5);
  *(void *)&long long v22 = *((void *)v0 + 4);
  uint64_t v4 = v22;
  *((void *)&v22 + 1) = v5;
  int64x2_t v23 = vdupq_n_s64(0x3FA999999999999AuLL);
  type metadata accessor for MKCoordinateRegion(0);
  sub_25E00ECB0();
  long long v22 = v18;
  int64x2_t v23 = v19;
  long long v24 = v20;
  uint64_t v6 = sub_25E00AD6C(&qword_26A6D3620);
  sub_25E00D04C((uint64_t)v3, 1, 1, v6);
  sub_25E00AD6C(&qword_26A6D3628);
  uint64_t v7 = (int *)(type metadata accessor for SRSmartRepliesActionCardView.MapLocation(0) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(*(void *)v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v7 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_25E00EF20;
  unint64_t v10 = v9 + v8;
  long long v21 = *v0;
  sub_25E00B3C0();
  uint64_t v11 = sub_25E00ED10();
  uint64_t v13 = v12;
  sub_25E00E45C((uint64_t)(v1 + 1), (uint64_t)&v21, &qword_26A6D3668);
  sub_25E00D6A8((uint64_t)&v21);
  sub_25E00EA30();
  uint64_t v14 = (uint64_t *)(v10 + v7[7]);
  *uint64_t v14 = v11;
  v14[1] = v13;
  sub_25E00E45C((uint64_t)&v21, v10 + v7[8], &qword_26A6D3668);
  uint64_t v15 = (void *)(v10 + v7[9]);
  *uint64_t v15 = v4;
  v15[1] = v5;
  v17[1] = v9;
  sub_25E00EAF0();
  sub_25E00AD6C(&qword_26A6D3630);
  sub_25E00AD6C(&qword_26A6D3638);
  sub_25E00E7F4((uint64_t)&unk_26A6D3640);
  sub_25E00E7F4((uint64_t)&unk_26A6D3648);
  sub_25E00D648((uint64_t)&unk_26A6D3650);
  return sub_25E00EAD0();
}

uint64_t sub_25E00BF2C()
{
  return sub_25E00BF44();
}

uint64_t sub_25E00BF44()
{
  return sub_25E00EAE0();
}

uint64_t sub_25E00BFFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25E00EBC0();
  uint64_t v5 = type metadata accessor for SRSmartRepliesActionCardView.MapLocation(0);
  uint64_t v6 = *(int *)(v5 + 24);
  uint64_t v7 = (uint64_t *)(a1 + *(int *)(v5 + 20));
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  uint64_t v11 = *(void *)(a1 + v6);
  uint64_t v10 = *(void *)(a1 + v6 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = v9;
  *(void *)(a2 + 48) = v8;
  *(void *)(a2 + 56) = v11;
  *(void *)(a2 + 64) = v10;
  return result;
}

uint64_t sub_25E00C084()
{
  return sub_25E00BBE0();
}

void *sub_25E00C0C0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  if (!a2) {
    goto LABEL_5;
  }
  uint64_t v4 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4)
  {
    sub_25E00E4C0((uint64_t)v10);
  }
  else
  {
LABEL_5:
    uint64_t v5 = sub_25E00ECE0();
    uint64_t v7 = v6;
    sub_25E00C1B8((uint64_t)&v11);
    v10[0] = v5;
    v10[1] = v7;
    sub_25E00E450((uint64_t)v10);
  }
  sub_25E00E45C((uint64_t)v10, (uint64_t)v9, &qword_26A6D36B0);
  sub_25E00AD6C(&qword_26A6D36B8);
  sub_25E00E7F4((uint64_t)&unk_26A6D36C0);
  sub_25E00EBD0();
  return memcpy(a3, __src, 0xF1uLL);
}

double sub_25E00C1B8@<D0>(uint64_t a1@<X8>)
{
  sub_25E00AD6C(&qword_26A6D36C8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25E00EF40;
  *(void *)(v2 + 32) = sub_25E00EC70();
  *(void *)(v2 + 40) = sub_25E00EC60();
  uint64_t v43 = v2;
  sub_25E00ED00();
  sub_25E00ECF0();
  double v4 = v3;
  double v6 = v5;
  MEMORY[0x2611CBE60](v2);
  MEMORY[0x2611CBCE0](v31, v4, v6, 1.0, 70.0);
  uint64_t v30 = v31[0];
  uint64_t v7 = v31[1];
  uint64_t v8 = v31[2];
  uint64_t v9 = v31[3];
  uint64_t v10 = v31[4];
  sub_25E00ECE0();
  sub_25E00EB40();
  uint64_t v11 = v31[5];
  char v12 = v32;
  uint64_t v24 = v33;
  char v13 = v34;
  uint64_t v27 = v36;
  uint64_t v28 = v35;
  uint64_t v29 = sub_25E00EC80();
  sub_25E00ECE0();
  sub_25E00EB40();
  uint64_t v14 = v37;
  char v15 = v38;
  uint64_t v16 = v39;
  char v17 = v40;
  uint64_t v25 = v42;
  uint64_t v26 = v41;
  if (qword_26A6D3550 != -1) {
    swift_once();
  }
  uint64_t v18 = qword_26A6D3558;
  swift_retain();
  sub_25E00ECE0();
  sub_25E00EB40();
  uint64_t v19 = v43;
  char v20 = v44;
  uint64_t v21 = v45;
  char v22 = v46;
  *(void *)a1 = v30;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v11;
  *(unsigned char *)(a1 + 48) = v12;
  *(_DWORD *)(a1 + 49) = v57[0];
  *(_DWORD *)(a1 + 52) = *(_DWORD *)((char *)v57 + 3);
  *(void *)(a1 + 56) = v24;
  *(unsigned char *)(a1 + 64) = v13;
  *(_DWORD *)(a1 + 65) = *(_DWORD *)v56;
  *(_DWORD *)(a1 + 68) = *(_DWORD *)&v56[3];
  *(void *)(a1 + 72) = v28;
  *(void *)(a1 + 80) = v27;
  *(_WORD *)(a1 + 88) = 256;
  *(_WORD *)(a1 + 94) = v55;
  *(_DWORD *)(a1 + 90) = v54;
  *(void *)(a1 + 96) = v29;
  *(_WORD *)(a1 + 104) = 256;
  *(_WORD *)(a1 + 110) = v53;
  *(_DWORD *)(a1 + 106) = *(_DWORD *)&v52[7];
  *(void *)(a1 + 112) = v14;
  *(unsigned char *)(a1 + 120) = v15;
  *(_DWORD *)(a1 + 124) = *(_DWORD *)&v52[3];
  *(_DWORD *)(a1 + 121) = *(_DWORD *)v52;
  *(void *)(a1 + 128) = v16;
  *(unsigned char *)(a1 + 136) = v17;
  *(_DWORD *)(a1 + 140) = *(_DWORD *)&v51[3];
  *(_DWORD *)(a1 + 137) = *(_DWORD *)v51;
  *(void *)(a1 + 144) = v26;
  *(void *)(a1 + 152) = v25;
  *(void *)(a1 + 160) = v18;
  *(_WORD *)(a1 + 168) = 256;
  *(_WORD *)(a1 + 174) = v50;
  *(_DWORD *)(a1 + 170) = *(_DWORD *)&v49[7];
  *(void *)(a1 + 176) = v19;
  *(unsigned char *)(a1 + 184) = v20;
  *(_DWORD *)(a1 + 185) = *(_DWORD *)v49;
  *(_DWORD *)(a1 + 188) = *(_DWORD *)&v49[3];
  *(void *)(a1 + 192) = v21;
  *(unsigned char *)(a1 + 200) = v22;
  *(_DWORD *)(a1 + 201) = *(_DWORD *)v48;
  *(_DWORD *)(a1 + 204) = *(_DWORD *)&v48[3];
  double result = *(double *)&v47;
  *(_OWORD *)(a1 + 208) = v47;
  return result;
}

uint64_t sub_25E00C4CC()
{
  return sub_25E00EC40();
}

void *sub_25E00C4E8@<X0>(void *a1@<X8>)
{
  return sub_25E00C0C0(*(void *)v1, *(void *)(v1 + 8), a1);
}

uint64_t sub_25E00C4F0@<X0>(void *a1@<X8>)
{
  char v34 = a1;
  uint64_t v33 = sub_25E00AD6C(&qword_26A6D36A0);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E00ECC0();
  MEMORY[0x270FA5388]();
  double v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_25E00EBA0();
  sub_25E00C87C((uint64_t)__src);
  uint64_t v31 = __src[0];
  uint64_t v30 = __src[1];
  uint64_t v29 = __src[2];
  char v5 = __src[3];
  uint64_t v28 = __src[4];
  uint64_t v6 = sub_25E00EC80();
  uint64_t KeyPath = swift_getKeyPath();
  char v8 = sub_25E00EBE0();
  char v37 = 1;
  char v36 = v5;
  char v35 = 1;
  char v9 = sub_25E00EC00();
  sub_25E00EB10();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  char v18 = v37;
  char v19 = v36;
  char v20 = v35;
  char v38 = 0;
  if (qword_26A6D3550 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_26A6D3558;
  swift_retain();
  char v22 = sub_25E00EBF0();
  __src[0] = v32;
  __src[1] = 0;
  LOBYTE(__src[2]) = v18;
  __src[3] = v31;
  __src[4] = v30;
  __src[5] = v29;
  LOBYTE(__src[6]) = v19;
  __src[7] = v28;
  __src[8] = KeyPath;
  __src[9] = v6;
  LOBYTE(__src[10]) = v8;
  memset(&__src[11], 0, 32);
  LOBYTE(__src[15]) = v20;
  LOBYTE(__src[16]) = v9;
  __src[17] = v11;
  __src[18] = v13;
  __src[19] = v15;
  __src[20] = v17;
  LOBYTE(__src[21]) = v38;
  __src[22] = v21;
  LOBYTE(__src[23]) = v22;
  uint64_t v23 = *MEMORY[0x263F19860];
  uint64_t v24 = sub_25E00EBB0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 104))(v4, v23, v24);
  sub_25E00E1BC((uint64_t)v4, (uint64_t)v2);
  *(_WORD *)&v2[*(int *)(v33 + 36)] = 256;
  uint64_t v25 = sub_25E00AD6C(&qword_26A6D36A8);
  uint64_t v26 = v34;
  sub_25E00E220((uint64_t)v2, (uint64_t)v34 + *(int *)(v25 + 36));
  memcpy(v26, __src, 0xB9uLL);
  sub_25E00E288((uint64_t)__src);
  sub_25E00E310((uint64_t)v2, &qword_26A6D36A0);
  sub_25E00E36C((uint64_t)v4);
  return sub_25E00E3C8((uint64_t)__src);
}

uint64_t sub_25E00C87C@<X0>(uint64_t a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25E00ECA0();
  sub_25E00B3C0();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_25E00EC10();
  uint64_t v5 = v4;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  char v7 = v6 & 1;
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v6 & 1;
  *(void *)(a1 + 32) = v8;
  swift_retain();
  sub_25E00B6CC(v3, v5, v7);
  swift_bridgeObjectRetain();
  sub_25E00B6DC(v3, v5, v7);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E00C96C@<X0>(void *a1@<X8>)
{
  return sub_25E00C4F0(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for SRSmartRepliesActionCardView(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_25E00AD6C(&qword_26A6D3568);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25E00EB20();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v11;
    *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
    id v12 = v11;
  }
  return a1;
}

void destroy for SRSmartRepliesActionCardView(uint64_t a1, uint64_t a2)
{
  sub_25E00AD6C(&qword_26A6D3568);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_25E00EB20();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

void *initializeWithCopy for SRSmartRepliesActionCardView(void *a1, void *a2, uint64_t a3)
{
  sub_25E00AD6C(&qword_26A6D3568);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25E00EB20();
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
  uint64_t v9 = *(void **)((char *)a2 + v7);
  *(void *)((char *)a1 + v7) = v9;
  *(_OWORD *)((char *)a1 + v8) = *(_OWORD *)((char *)a2 + v8);
  id v10 = v9;
  return a1;
}

void *assignWithCopy for SRSmartRepliesActionCardView(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25E00E310((uint64_t)a1, &qword_26A6D3568);
    sub_25E00AD6C(&qword_26A6D3568);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25E00EB20();
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
  uint64_t v8 = *(void **)((char *)a2 + v7);
  uint64_t v9 = *(void **)((char *)a1 + v7);
  *(void *)((char *)a1 + v7) = v8;
  id v10 = v8;

  uint64_t v11 = *(int *)(a3 + 24);
  id v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *id v12 = *v13;
  v12[1] = v13[1];
  return a1;
}

char *initializeWithTake for SRSmartRepliesActionCardView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_25E00AD6C(&qword_26A6D3568);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25E00EB20();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  return a1;
}

char *assignWithTake for SRSmartRepliesActionCardView(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25E00E310((uint64_t)a1, &qword_26A6D3568);
    uint64_t v6 = sub_25E00AD6C(&qword_26A6D3568);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25E00EB20();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = *(void **)&a1[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];

  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t getEnumTagSinglePayload for SRSmartRepliesActionCardView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E00CF18);
}

uint64_t sub_25E00CF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25E00AD6C(&qword_26A6D35C8);
  sub_25E00E8F0();
  if (*(_DWORD *)(v7 + 84) != a2) {
    return sub_25E00E980(*(void *)(a1 + *(int *)(a3 + 20)));
  }

  return sub_25E00CF9C(a1, a2, v6);
}

uint64_t sub_25E00CF9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SRSmartRepliesActionCardView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E00CFD8);
}

void sub_25E00CFD8()
{
  sub_25E00E96C();
  sub_25E00AD6C(&qword_26A6D35C8);
  sub_25E00E8F0();
  if (*(_DWORD *)(v4 + 84) == v3)
  {
    uint64_t v5 = sub_25E00E958();
    sub_25E00D04C(v5, v6, v7, v8);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 20)) = (v0 - 1);
  }
}

uint64_t sub_25E00D04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

void sub_25E00D074()
{
  sub_25E00D118();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25E00D118()
{
  if (!qword_26A6D35E0)
  {
    sub_25E00EB20();
    unint64_t v0 = sub_25E00EB30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A6D35E0);
    }
  }
}

unint64_t sub_25E00D174()
{
  unint64_t result = qword_26A6D35E8;
  if (!qword_26A6D35E8)
  {
    sub_25E00B4C0(&qword_26A6D35F0);
    sub_25E00B40C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D35E8);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for SRSmartRepliesActionCardView.LocationView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
}

uint64_t destroy for SRSmartRepliesActionCardView.ETAView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SRSmartRepliesActionCardView.ETAView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SRSmartRepliesActionCardView.ETAView(void *a1, void *a2)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for SRSmartRepliesActionCardView.ETAView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SRSmartRepliesActionCardView.ETAView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SRSmartRepliesActionCardView.ETAView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for SRSmartRepliesActionCardView.ETAView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SRSmartRepliesActionCardView.ETAView()
{
  return &type metadata for SRSmartRepliesActionCardView.ETAView;
}

uint64_t getEnumTagSinglePayload for SRSmartRepliesActionCardView.LocationView(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SRSmartRepliesActionCardView.LocationView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SRSmartRepliesActionCardView.LocationView()
{
  return &type metadata for SRSmartRepliesActionCardView.LocationView;
}

uint64_t sub_25E00D4C4(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_25E00FAC4, 1);
}

uint64_t sub_25E00D4E0(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_25E00FA9C, 1);
}

void type metadata accessor for MKCoordinateRegion(uint64_t a1)
{
}

uint64_t type metadata accessor for SRSmartRepliesActionCardView.MapLocation(uint64_t a1)
{
  return sub_25E00D530(a1, (uint64_t *)&unk_26A6D3678);
}

uint64_t sub_25E00D530(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25E00D564()
{
  sub_25E00EC50();
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v2 + 104))(v1, *MEMORY[0x263F1B388]);
  uint64_t result = MEMORY[0x2611CBE20](v1, 0.278431373, 0.57254902, 242.0, 1.0);
  qword_26A6D3558 = result;
  return result;
}

unint64_t sub_25E00D648(uint64_t a1)
{
  unint64_t result = sub_25E00E940(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_25E00D68C@<X0>(uint64_t a1@<X8>)
{
  return sub_25E00BFFC(*(void *)(v1 + 16), a1);
}

uint64_t sub_25E00D6A8(uint64_t a1)
{
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for SRSmartRepliesActionCardView.PillView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SRSmartRepliesActionCardView.PillView()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SRSmartRepliesActionCardView.PillView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SRSmartRepliesActionCardView.PillView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for SRSmartRepliesActionCardView.PillView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for SRSmartRepliesActionCardView.PillView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SRSmartRepliesActionCardView.PillView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for SRSmartRepliesActionCardView.PillView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SRSmartRepliesActionCardView.PillView()
{
  return &type metadata for SRSmartRepliesActionCardView.PillView;
}

void *initializeBufferWithCopyOfBuffer for SRSmartRepliesActionCardView.LocationDotView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SRSmartRepliesActionCardView.LocationDotView()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for SRSmartRepliesActionCardView.LocationDotView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for SRSmartRepliesActionCardView.LocationDotView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SRSmartRepliesActionCardView.LocationDotView(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for SRSmartRepliesActionCardView.LocationDotView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
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
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SRSmartRepliesActionCardView.LocationDotView()
{
  return &type metadata for SRSmartRepliesActionCardView.LocationDotView;
}

uint64_t sub_25E00DA3C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25E00DA5C(uint64_t result, int a2, int a3)
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

uint64_t *sub_25E00DA88(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25E00EA40();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    id v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_25E00DB84(uint64_t a1)
{
  uint64_t v2 = sub_25E00EA40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25E00DC0C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E00EA40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  id v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25E00DCB8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E00EA40();
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
  return a1;
}

uint64_t sub_25E00DD9C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E00EA40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_25E00DE2C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25E00EA40();
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
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_25E00DEE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25E00DEF4);
}

uint64_t sub_25E00DEF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25E00EA40();
  sub_25E00E8F0();
  if (*(_DWORD *)(v7 + 84) != a2) {
    return sub_25E00E980(*(void *)(a1 + *(int *)(a3 + 20) + 8));
  }

  return sub_25E00CF9C(a1, a2, v6);
}

uint64_t sub_25E00DF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25E00DF8C);
}

void sub_25E00DF8C()
{
  sub_25E00E96C();
  sub_25E00EA40();
  sub_25E00E8F0();
  if (*(_DWORD *)(v4 + 84) == v3)
  {
    uint64_t v5 = sub_25E00E958();
    sub_25E00D04C(v5, v6, v7, v8);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 20) + 8) = (v0 - 1);
  }
}

uint64_t sub_25E00E000()
{
  uint64_t result = sub_25E00EA40();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_25E00E0A8()
{
  return sub_25E00E7F4((uint64_t)&unk_26A6D3688);
}

uint64_t sub_25E00E0E4(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_25E00FB34, 1);
}

uint64_t sub_25E00E100(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_25E00FB0C, 1);
}

unint64_t sub_25E00E11C()
{
  return sub_25E00D648((uint64_t)&unk_26A6D3698);
}

uint64_t sub_25E00E164@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E00EB80();
  *a1 = result;
  return result;
}

uint64_t sub_25E00E190()
{
  return sub_25E00EB90();
}

uint64_t sub_25E00E1BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25E00ECC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E00E220(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25E00AD6C(&qword_26A6D36A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E00E288(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 48);
  swift_retain();
  sub_25E00B6CC(v2, v3, v4);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_25E00E310(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25E00AD6C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25E00E36C(uint64_t a1)
{
  uint64_t v2 = sub_25E00ECC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25E00E3C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 48);
  swift_release();
  sub_25E00B6DC(v2, v3, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_25E00E450(uint64_t result)
{
  *(unsigned char *)(result + 240) = 1;
  return result;
}

uint64_t sub_25E00E45C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_25E00AD6C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25E00E4C0(uint64_t result)
{
  *(unsigned char *)(result + 240) = 0;
  return result;
}

void type metadata accessor for MKCoordinateSpan(uint64_t a1)
{
}

void sub_25E00E4DC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_25E00E528()
{
  unint64_t result = qword_26A6D36D8;
  if (!qword_26A6D36D8)
  {
    sub_25E00B4C0(&qword_26A6D36A8);
    sub_25E00E5C8();
    sub_25E00E7F4((uint64_t)&unk_26A6D3750);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D36D8);
  }
  return result;
}

unint64_t sub_25E00E5C8()
{
  unint64_t result = qword_26A6D36E0;
  if (!qword_26A6D36E0)
  {
    sub_25E00B4C0(&qword_26A6D36E8);
    sub_25E00E68C((uint64_t)&unk_26A6D36F0);
    sub_25E00E7F4((uint64_t)&unk_26A6D3740);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D36E0);
  }
  return result;
}

unint64_t sub_25E00E68C(uint64_t a1)
{
  unint64_t result = sub_25E00E940(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    sub_25E00B4C0(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25E00E708()
{
  return sub_25E00E68C((uint64_t)&unk_26A6D3700);
}

unint64_t sub_25E00E730()
{
  unint64_t result = qword_26A6D3710;
  if (!qword_26A6D3710)
  {
    sub_25E00B4C0(&qword_26A6D3718);
    sub_25E00E7F4((uint64_t)&unk_26A6D3720);
    sub_25E00E7F4((uint64_t)&unk_26A6D3730);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D3710);
  }
  return result;
}

unint64_t sub_25E00E7F4(uint64_t a1)
{
  unint64_t result = sub_25E00E940(a1);
  if (!result)
  {
    sub_25E00B4C0(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_25E00E838()
{
  unint64_t result = qword_26A6D3758;
  if (!qword_26A6D3758)
  {
    sub_25E00B4C0((uint64_t *)&unk_26A6D3760);
    sub_25E00E7F4((uint64_t)&unk_26A6D36C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6D3758);
  }
  return result;
}

__n128 sub_25E00E908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long a13)
{
  return (__n128)a13;
}

double sub_25E00E928()
{
  return 0.0;
}

uint64_t sub_25E00E940(uint64_t a1)
{
  return *(void *)a1;
}

char *sub_25E00E94C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  return &a19;
}

uint64_t sub_25E00E958()
{
  return v0;
}

uint64_t sub_25E00E980@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t sub_25E00E994()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t _s8SentinelCMa()
{
  return self;
}

id sub_25E00E9C8()
{
  _s8SentinelCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26A6D3A88 = (uint64_t)result;
  return result;
}

uint64_t sub_25E00EA20()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_25E00EA30()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25E00EA40()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25E00EA50()
{
  return MEMORY[0x270F73920]();
}

uint64_t sub_25E00EA60()
{
  return MEMORY[0x270F73928]();
}

uint64_t sub_25E00EA70()
{
  return MEMORY[0x270F73930]();
}

uint64_t sub_25E00EA80()
{
  return MEMORY[0x270F73938]();
}

uint64_t sub_25E00EA90()
{
  return MEMORY[0x270F73940]();
}

uint64_t sub_25E00EAA0()
{
  return MEMORY[0x270F73948]();
}

uint64_t sub_25E00EAB0()
{
  return MEMORY[0x270F73950]();
}

uint64_t sub_25E00EAC0()
{
  return MEMORY[0x270F73958]();
}

uint64_t sub_25E00EAD0()
{
  return MEMORY[0x270F07F28]();
}

uint64_t sub_25E00EAE0()
{
  return MEMORY[0x270F07F50]();
}

uint64_t sub_25E00EAF0()
{
  return MEMORY[0x270F07FD0]();
}

uint64_t sub_25E00EB00()
{
  return MEMORY[0x270F07FE8]();
}

uint64_t sub_25E00EB10()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_25E00EB20()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_25E00EB30()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_25E00EB40()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_25E00EB50()
{
  return MEMORY[0x270EFFBF8]();
}

uint64_t sub_25E00EB60()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_25E00EB70()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_25E00EB80()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_25E00EB90()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_25E00EBA0()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_25E00EBB0()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_25E00EBC0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25E00EBD0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_25E00EBE0()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_25E00EBF0()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25E00EC00()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_25E00EC10()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25E00EC20()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25E00EC30()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25E00EC40()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25E00EC50()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_25E00EC60()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_25E00EC70()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_25E00EC80()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_25E00EC90()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_25E00ECA0()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_25E00ECB0()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_25E00ECC0()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_25E00ECD0()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_25E00ECE0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25E00ECF0()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_25E00ED00()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25E00ED10()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_25E00ED20()
{
  return MEMORY[0x270F9E7E8]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}