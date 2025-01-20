uint64_t sub_1980(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (!a2) {
    return 0;
  }
  v2 = a1;
  v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    v3 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3) {
    return 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_19E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_F4D0();
  *a1 = result;
  return result;
}

void *sub_1A08@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1A14()
{
  return swift_allocObject();
}

uint64_t sub_1A24()
{
  type metadata accessor for AppDisambiguationView(0);
  sub_A454();
  ((void (*)(void))__chkstk_darwin)();
  sub_A9B8();
  uint64_t v35 = type metadata accessor for RequestPaymentConfirmationView(0);
  sub_A454();
  ((void (*)(void))__chkstk_darwin)();
  sub_A970();
  uint64_t v4 = type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(0);
  uint64_t v5 = sub_A618(v4);
  __chkstk_darwin(v5);
  sub_A5DC();
  uint64_t v34 = v6;
  uint64_t v7 = type metadata accessor for SendPaymentConfirmationView(0);
  sub_A454();
  __chkstk_darwin(v8);
  sub_A9A0();
  uint64_t v9 = type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(0);
  uint64_t v10 = sub_A618(v9);
  __chkstk_darwin(v10);
  sub_A7EC();
  uint64_t v13 = v12 - v11;
  type metadata accessor for SiriPaymentsSnippetModel(0);
  sub_A454();
  __chkstk_darwin(v14);
  sub_A988();
  sub_23A0();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_32E0();
      sub_23A0();
      sub_142C0();
      sub_22B4(&qword_1C1B0, (void (*)(uint64_t))&type metadata accessor for Context);
      uint64_t v28 = sub_13E80();
      uint64_t v30 = v29;
      v31 = (uint64_t *)(v2 + *(int *)(v7 + 20));
      uint64_t *v31 = swift_getKeyPath();
      sub_31FC(&qword_1C1C8);
      swift_storeEnumTagMultiPayload();
      v32 = (uint64_t *)(v2 + *(int *)(v7 + 24));
      uint64_t *v32 = v28;
      v32[1] = v30;
      sub_3240();
      sub_13E30();
      sub_13E30();
      sub_22B4(&qword_1C1E0, (void (*)(uint64_t))type metadata accessor for SendPaymentConfirmationView);
      uint64_t v20 = sub_14020();
      sub_328C(v2, (void (*)(void))type metadata accessor for SendPaymentConfirmationView);
      v21 = type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel;
      uint64_t v22 = v13;
      goto LABEL_6;
    case 2u:
      uint64_t v23 = v1[2];
      *(_OWORD *)uint64_t v3 = *(_OWORD *)v1;
      *(void *)(v3 + 16) = v23;
      sub_14210();
      sub_22B4(&qword_1C1C0, (void (*)(uint64_t))type metadata accessor for AppDisambiguationView);
      uint64_t v20 = sub_14020();
      v21 = type metadata accessor for AppDisambiguationView;
      uint64_t v22 = v3;
      goto LABEL_6;
    case 3u:
      uint64_t v24 = *v1;
      unint64_t v25 = v1[1];
      uint64_t v26 = v1[4];
      unint64_t v27 = v1[5];
      sub_225C(*v1, v25);
      swift_bridgeObjectRetain();
      sub_225C(v26, v27);
      sub_142C0();
      sub_22B4(&qword_1C1B0, (void (*)(uint64_t))&type metadata accessor for Context);
      swift_bridgeObjectRetain();
      sub_A880();
      v36 = (void *)sub_13E80();
      sub_22FC();
      uint64_t v20 = sub_14020();
      sub_2348(v24, v25);
      swift_bridgeObjectRelease();
      sub_2348(v26, v27);
      swift_bridgeObjectRelease();
      sub_2348(v24, v25);
      swift_bridgeObjectRelease();
      sub_2348(v26, v27);
      swift_bridgeObjectRelease();

      return v20;
    default:
      sub_32E0();
      sub_23A0();
      sub_142C0();
      sub_22B4(&qword_1C1B0, (void (*)(uint64_t))&type metadata accessor for Context);
      uint64_t v15 = sub_13E80();
      uint64_t v17 = v16;
      v18 = (uint64_t *)(v0 + *(int *)(v35 + 20));
      uint64_t *v18 = swift_getKeyPath();
      sub_31FC(&qword_1C1C8);
      swift_storeEnumTagMultiPayload();
      v19 = (uint64_t *)(v0 + *(int *)(v35 + 24));
      uint64_t *v19 = v15;
      v19[1] = v17;
      sub_3240();
      sub_13E30();
      sub_13E30();
      sub_22B4(&qword_1C1D8, (void (*)(uint64_t))type metadata accessor for RequestPaymentConfirmationView);
      uint64_t v20 = sub_14020();
      sub_328C(v0, (void (*)(void))type metadata accessor for RequestPaymentConfirmationView);
      v21 = type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel;
      uint64_t v22 = v34;
LABEL_6:
      sub_328C(v22, (void (*)(void))v21);
      return v20;
  }
}

uint64_t sub_210C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SiriPaymentsUIPlugin()
{
  return self;
}

uint64_t sub_2140()
{
  return sub_22B4(&qword_1C1A8, (void (*)(uint64_t))type metadata accessor for SiriPaymentsSnippetModel);
}

uint64_t sub_2188@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1A14();
  *a1 = result;
  return result;
}

uint64_t sub_21B0()
{
  return sub_1A24();
}

uint64_t type metadata accessor for AppDisambiguationView(uint64_t a1)
{
  return sub_2228(a1, qword_1C3C0);
}

uint64_t type metadata accessor for RequestPaymentConfirmationView(uint64_t a1)
{
  return sub_2228(a1, qword_1C320);
}

uint64_t type metadata accessor for SendPaymentConfirmationView(uint64_t a1)
{
  return sub_2228(a1, (uint64_t *)&unk_1C260);
}

uint64_t sub_2228(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_225C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_22B4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_22FC()
{
  unint64_t result = qword_1C1B8;
  if (!qword_1C1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C1B8);
  }
  return result;
}

uint64_t sub_2348(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A0()
{
  uint64_t v1 = sub_A930();
  v2(v1);
  sub_A454();
  uint64_t v3 = sub_A6CC();
  v4(v3);
  return v0;
}

uint64_t sub_23EC()
{
  return sub_A880();
}

id sub_2490(void *a1, void *a2)
{
  id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithIntent:a1 response:a2];

  return v4;
}

uint64_t sub_24EC()
{
  sub_31FC(&qword_1C490);
  uint64_t v1 = sub_AA34();
  *(_OWORD *)(v1 + 16) = xmmword_148B0;
  sub_31FC(&qword_1C2B8);
  sub_13D90();
  sub_23EC();
  sub_AB0C();
  v32._countAndFlagsBits = sub_A9F4() & 0xFFFF0000FFFFFFFFLL | 0x726500000000;
  v32._object = (void *)0xE600000000000000;
  sub_14310(v32);
  *(void *)(v1 + 32) = v30;
  *(void *)(v1 + 40) = v31;
  uint64_t v2 = (void *)sub_A6A8();
  id v3 = [v2 currencyAmount];

  if (v3)
  {
    sub_13B68();
    uint64_t v5 = v4;

    if (v5)
    {
      swift_bridgeObjectRelease();
      sub_AAB0();
      uint64_t v6 = (void *)sub_A6A8();
      unint64_t v0 = sub_23EC();
      swift_bridgeObjectRelease();

      sub_A6F4();
      sub_A6E0();
      if (v8) {
        uint64_t v1 = (uint64_t)sub_A534(v7);
      }
      sub_A808();
    }
  }
  type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(0);
  sub_31FC(&qword_1C2C0);
  uint64_t v9 = (void *)sub_13DB0();
  id v10 = [v9 paymentRecord];

  if (v10)
  {
    id v11 = [v10 feeAmount];

    if (v11)
    {
      uint64_t v12 = sub_13B68();
      unint64_t v0 = v13;

      sub_1980(v12, v0);
      uint64_t v15 = v14;
      swift_bridgeObjectRelease();
      if (v15)
      {
        swift_bridgeObjectRelease();
        sub_A6A8();
        sub_23EC();
        sub_AB0C();
        sub_A74C();
        sub_A6E0();
        if (v8) {
          uint64_t v1 = (uint64_t)sub_A534(v16);
        }
        sub_A808();
      }
    }
  }
  uint64_t v17 = (void *)sub_A6A8();
  uint64_t v18 = sub_A268(v17);
  sub_1980(v18, v19);
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = swift_bridgeObjectRelease();
  if (v21)
  {
    uint64_t v23 = (void *)sub_A6A8();
    uint64_t v24 = sub_23EC();
    uint64_t v26 = v25;

    sub_A818();
    sub_AAF8();
    if (v8)
    {
      uint64_t v22 = (uint64_t)sub_A534(v27);
      uint64_t v1 = v22;
    }
    *(void *)(v1 + 16) = v23;
    unint64_t v28 = v1 + 16 * v0;
    *(void *)(v28 + 32) = v24;
    *(void *)(v28 + 40) = v26;
  }
  __chkstk_darwin(v22);
  sub_AAD0();
  return sub_14150();
}

uint64_t sub_2774()
{
  uint64_t v0 = sub_AA58();
  uint64_t v1 = type metadata accessor for RequestPaymentConfirmationView(v0);
  uint64_t v2 = sub_A4A8(v1);
  __chkstk_darwin(v2);
  sub_A900();
  sub_23A0();
  sub_A8E8();
  swift_allocObject();
  sub_32E0();
  sub_31FC(&qword_1C468);
  sub_A40C(&qword_1C470, &qword_1C468);
  return sub_14160();
}

uint64_t sub_2894@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v60 = a2;
  uint64_t v49 = sub_14110();
  uint64_t v54 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  v51 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for RequestPaymentConfirmationView(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v50 = sub_31FC(&qword_1C408);
  uint64_t v64 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  char v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_31FC(&qword_1C400);
  uint64_t v53 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  id v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_14180();
  uint64_t v58 = *(void *)(v59 - 8);
  uint64_t v11 = __chkstk_darwin(v59);
  v57 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v62 = (char *)&v43 - v13;
  uint64_t v56 = sub_14250();
  uint64_t v63 = *(void *)(v56 - 8);
  uint64_t v14 = __chkstk_darwin(v56);
  v55 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v61 = (char *)&v43 - v16;
  sub_8F90(0, &qword_1C478);
  sub_31FC(&qword_1C2B8);
  uint64_t v17 = (void *)sub_13D90();
  type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(0);
  sub_31FC(&qword_1C2C0);
  uint64_t v18 = (void *)sub_13DB0();
  sub_2490(v17, v18);
  uint64_t v67 = a1;
  sub_14260();
  v48 = type metadata accessor for RequestPaymentConfirmationView;
  uint64_t v44 = a1;
  sub_23A0();
  uint64_t v19 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v47 = ((v19 + 16) & ~v19) + v6;
  uint64_t v46 = v19 | 7;
  swift_allocObject();
  v45 = type metadata accessor for RequestPaymentConfirmationView;
  sub_32E0();
  uint64_t v66 = a1;
  sub_140C0();
  uint64_t v20 = v54;
  uint64_t v21 = v51;
  uint64_t v22 = v49;
  (*(void (**)(char *, void, uint64_t))(v54 + 104))(v51, enum case for ButtonItemButtonStyle.Role.preferred(_:), v49);
  uint64_t v23 = sub_A40C(&qword_1C410, &qword_1C408);
  uint64_t v24 = v50;
  sub_14030();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v22);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v64 + 8);
  v64 += 8;
  v25(v8, v24);
  uint64_t v71 = v24;
  uint64_t v72 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v26 = v52;
  uint64_t v27 = sub_14020();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v10, v26);
  v73 = &type metadata for AnyView;
  v74 = &protocol witness table for AnyView;
  uint64_t v71 = v27;
  uint64_t v28 = v44;
  sub_23A0();
  swift_allocObject();
  sub_32E0();
  uint64_t v65 = v28;
  sub_140C0();
  uint64_t v29 = sub_14020();
  v25(v8, v24);
  v69 = &type metadata for AnyView;
  v70 = &protocol witness table for AnyView;
  uint64_t v68 = v29;
  uint64_t v30 = v62;
  sub_14170();
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
  Swift::String v32 = v55;
  uint64_t v33 = v56;
  v31(v55, v61, v56);
  uint64_t v34 = v58;
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
  v36 = v57;
  uint64_t v37 = v59;
  v35(v57, v30, v59);
  v38 = v60;
  v31(v60, v32, v33);
  uint64_t v39 = sub_31FC(&qword_1C480);
  v35(&v38[*(int *)(v39 + 48)], v36, v37);
  v40 = *(void (**)(char *, uint64_t))(v34 + 8);
  v40(v62, v37);
  v41 = *(void (**)(char *, uint64_t))(v63 + 8);
  v41(v61, v33);
  v40(v36, v37);
  return ((uint64_t (*)(char *, uint64_t))v41)(v32, v33);
}

uint64_t sub_310C()
{
  return sub_13E90();
}

uint64_t sub_3130(uint64_t a1)
{
  uint64_t v2 = sub_13E10();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_13EA0();
}

uint64_t sub_31FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_3240()
{
  unint64_t result = qword_1C1D0;
  if (!qword_1C1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C1D0);
  }
  return result;
}

uint64_t sub_328C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_A454();
  sub_A6C0();
  v3();
  return a1;
}

uint64_t sub_32E0()
{
  uint64_t v1 = sub_A930();
  v2(v1);
  sub_A454();
  uint64_t v3 = sub_A79C();
  v4(v3);
  return v0;
}

uint64_t initializeBufferWithCopyOfBuffer for BinaryConfirmationSnippetView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for BinaryConfirmationSnippetView(uint64_t *a1)
{
  sub_2348(*a1, a1[1]);
  swift_bridgeObjectRelease();
  sub_2348(a1[4], a1[5]);
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)a1[8];
}

uint64_t *initializeWithCopy for BinaryConfirmationSnippetView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_225C(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[4];
  unint64_t v8 = a2[5];
  swift_bridgeObjectRetain();
  sub_225C(v7, v8);
  a1[4] = v7;
  a1[5] = v8;
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  uint64_t v11 = (void *)a2[8];
  uint64_t v10 = a2[9];
  a1[8] = (uint64_t)v11;
  a1[9] = v10;
  swift_bridgeObjectRetain();
  id v12 = v11;
  return a1;
}

uint64_t *assignWithCopy for BinaryConfirmationSnippetView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_225C(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_2348(v6, v7);
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[4];
  unint64_t v9 = a2[5];
  sub_225C(v8, v9);
  uint64_t v10 = a1[4];
  unint64_t v11 = a1[5];
  a1[4] = v8;
  a1[5] = v9;
  sub_2348(v10, v11);
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v12 = (void *)a1[8];
  uint64_t v13 = (void *)a2[8];
  a1[8] = (uint64_t)v13;
  id v14 = v13;

  a1[9] = a2[9];
  return a1;
}

void *initializeWithTake for BinaryConfirmationSnippetView(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for BinaryConfirmationSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_2348(v4, v5);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_2348(v7, v8);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  unint64_t v9 = *(void **)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);

  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for BinaryConfirmationSnippetView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 80))
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

uint64_t storeEnumTagSinglePayload for BinaryConfirmationSnippetView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BinaryConfirmationSnippetView()
{
  return &type metadata for BinaryConfirmationSnippetView;
}

void sub_3628()
{
}

uint64_t sub_3650(uint64_t a1, uint64_t a2)
{
  return sub_3A88(a1, a2, (uint64_t)&unk_1C1E8, type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel, &qword_1C1F0);
}

void sub_3678()
{
}

uint64_t sub_36A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_3E08(a1, a2, a3, &qword_1C1E8);
}

uint64_t sub_36C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_4094(a1, a2, a3, &qword_1C1E8);
}

uint64_t sub_36F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_4234(a1, a2, a3, &qword_1C1E8);
}

uint64_t sub_3718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_372C);
}

uint64_t sub_372C(uint64_t a1, uint64_t a2, int *a3)
{
  return sub_4474(a1, a2, a3);
}

uint64_t sub_3744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_376C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_3780);
}

void sub_3780(uint64_t a1, uint64_t a2, int a3, int *a4)
{
}

uint64_t sub_3798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

void sub_37C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_37D8()
{
  if (!qword_1C270)
  {
    sub_13E10();
    unint64_t v0 = sub_13E20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1C270);
    }
  }
}

void sub_3830()
{
  if (!qword_1C278)
  {
    sub_3240();
    unint64_t v0 = sub_13E50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1C278);
    }
  }
}

void sub_388C()
{
}

void sub_38B4()
{
  sub_A88C();
  sub_AA84();
  sub_A480();
  if ((*(_DWORD *)(v9 + 80) & 0x20000) != 0)
  {
    *unint64_t v0 = *v1;
    swift_retain();
  }
  else
  {
    uint64_t v10 = v8;
    sub_31FC(v7);
    sub_A454();
    uint64_t v11 = sub_A6CC();
    v12(v11);
    uint64_t v13 = sub_A77C();
    v10(v13);
    sub_A558();
    sub_A454();
    sub_A72C();
    v14();
    sub_A624();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_225C(v3, v4);
    *(void *)(v5 + 64) = v3;
    *(void *)(v5 + 72) = v4;
    uint64_t v15 = *(void **)(v6 + 80);
    sub_AA1C();
    sub_A840();
    sub_31FC(&qword_1C1C8);
    if (sub_A8A4() == 1)
    {
      sub_13E10();
      sub_A454();
      sub_A72C();
      v16();
    }
    else
    {
      *uint64_t v15 = *v2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    sub_A7C0();
    sub_31FC(&qword_1C1F8);
    sub_A454();
    uint64_t v18 = *(void (**)(uint64_t))(v17 + 16);
    uint64_t v19 = sub_A8C0();
    v18(v19);
    uint64_t v20 = sub_A5B0();
    v18(v20);
  }
  sub_A940();
}

uint64_t sub_3A60(uint64_t a1, uint64_t a2)
{
  return sub_3A88(a1, a2, (uint64_t)&qword_1C2B8, type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel, &qword_1C2C0);
}

uint64_t sub_3A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t *a5)
{
  sub_AA84();
  sub_31FC(v9);
  sub_A454();
  sub_A6C0();
  v10();
  uint64_t v11 = sub_A77C();
  uint64_t v12 = a4(v11);
  sub_31FC(a5);
  sub_A454();
  sub_A6C0();
  v13();
  uint64_t v14 = v5 + *(int *)(v12 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2348(*(void *)(v14 + 64), *(void *)(v14 + 72));
  sub_2348(*(void *)(v14 + 80), *(void *)(v14 + 88));
  swift_bridgeObjectRelease();
  sub_31FC(&qword_1C1C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_13E10();
    sub_A454();
    sub_A6C0();
    v15();
  }
  else
  {
    swift_release();
  }

  uint64_t v16 = v5 + v6[7];
  uint64_t v17 = sub_31FC(&qword_1C1F8);
  sub_A454();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  v21(v16, v17);
  uint64_t v19 = v5 + v6[8];

  return ((uint64_t (*)(uint64_t, uint64_t))v21)(v19, v17);
}

void sub_3C50()
{
}

void sub_3C78()
{
  sub_A88C();
  sub_A5F0(v6, v7, v8, v9);
  sub_A454();
  uint64_t v10 = sub_A6CC();
  v11(v10);
  uint64_t v12 = sub_A77C();
  v0(v12);
  sub_A558();
  sub_A454();
  sub_A72C();
  v13();
  sub_A624();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_225C(v2, v3);
  *(void *)(v4 + 64) = v2;
  *(void *)(v4 + 72) = v3;
  uint64_t v14 = *(void **)(v5 + 80);
  sub_AA1C();
  sub_A840();
  sub_31FC(&qword_1C1C8);
  if (sub_A8A4() == 1)
  {
    sub_13E10();
    sub_A454();
    sub_A72C();
    v15();
  }
  else
  {
    *uint64_t v14 = *v1;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  sub_A7C0();
  sub_31FC(&qword_1C1F8);
  sub_A454();
  uint64_t v17 = *(void (**)(uint64_t))(v16 + 16);
  uint64_t v18 = sub_A8C0();
  v17(v18);
  uint64_t v19 = sub_A5B0();
  v17(v19);
  sub_A940();
}

uint64_t sub_3DE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_3E08(a1, a2, a3, &qword_1C2B8);
}

uint64_t sub_3E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_A5F0(a1, a2, a3, a4);
  sub_A454();
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v4, v5);
  uint64_t v9 = sub_A77C();
  ((void (*)(uint64_t))v7)(v9);
  sub_A558();
  sub_A454();
  uint64_t v10 = sub_A8D8();
  v11(v10);
  uint64_t v12 = *(int *)(v7 + 24);
  uint64_t v13 = (void *)(v4 + v12);
  uint64_t v14 = (void *)(v5 + v12);
  *uint64_t v13 = *(void *)(v5 + v12);
  v13[1] = *(void *)(v5 + v12 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13[2] = v14[2];
  v13[3] = v14[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13[4] = v14[4];
  v13[5] = v14[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13[6] = v14[6];
  v13[7] = v14[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = v14[8];
  uint64_t v16 = v14[9];
  sub_AA1C();
  uint64_t v17 = v13[8];
  unint64_t v18 = v13[9];
  v13[8] = v15;
  v13[9] = v16;
  sub_2348(v17, v18);
  uint64_t v19 = v14[10];
  uint64_t v20 = (uint64_t *)v14[11];
  sub_AA1C();
  uint64_t v21 = v13[10];
  unint64_t v22 = v13[11];
  v13[10] = v19;
  v13[11] = v20;
  sub_2348(v21, v22);
  v13[12] = v14[12];
  uint64_t v23 = (uint64_t *)v13[13];
  v13[13] = v14[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v4 != v5)
  {
    uint64_t v24 = *(int *)(v6 + 20);
    uint64_t v23 = (uint64_t *)(v4 + v24);
    uint64_t v25 = (uint64_t *)(v5 + v24);
    uint64_t v20 = &qword_1C1C8;
    sub_9E70(v4 + v24, &qword_1C1C8);
    sub_31FC(&qword_1C1C8);
    if (sub_A8A4() == 1)
    {
      sub_13E10();
      sub_A454();
      sub_A72C();
      v26();
    }
    else
    {
      *uint64_t v23 = *v25;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  sub_A7FC();
  uint64_t v27 = (void *)*v23;
  uint64_t v28 = (void *)*v20;
  *uint64_t v23 = *v20;
  id v29 = v28;

  v23[1] = v20[1];
  sub_A7FC();
  sub_31FC(&qword_1C1F8);
  sub_A454();
  uint64_t v31 = *(void (**)(uint64_t))(v30 + 24);
  uint64_t v32 = sub_A788();
  v31(v32);
  uint64_t v33 = sub_A5B0();
  v31(v33);
  return v4;
}

uint64_t sub_406C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_4094(a1, a2, a3, &qword_1C2B8);
}

uint64_t sub_4094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_A5F0(a1, a2, a3, a4);
  sub_A454();
  uint64_t v9 = sub_A79C();
  v10(v9);
  uint64_t v11 = sub_A77C();
  ((void (*)(uint64_t))v8)(v11);
  sub_A558();
  sub_A454();
  uint64_t v12 = sub_A8D8();
  v13(v12);
  memcpy((void *)(v4 + *(int *)(v8 + 24)), (const void *)(v5 + *(int *)(v8 + 24)), 0x70uLL);
  sub_A7FC();
  uint64_t v14 = sub_31FC(&qword_1C1C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_13E10();
    sub_A454();
    uint64_t v15 = sub_AA08();
    v16(v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, (const void *)v8, *(void *)(*(void *)(v14 - 8) + 64));
  }
  *(_OWORD *)(v4 + *(int *)(v6 + 24)) = *(_OWORD *)(v5 + *(int *)(v6 + 24));
  sub_31FC(&qword_1C1F8);
  sub_A454();
  unint64_t v18 = *(void (**)(uint64_t))(v17 + 32);
  uint64_t v19 = sub_A788();
  v18(v19);
  uint64_t v20 = sub_A5B0();
  v18(v20);
  return v4;
}

uint64_t sub_420C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_4234(a1, a2, a3, &qword_1C2B8);
}

uint64_t sub_4234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_A5F0(a1, a2, a3, a4);
  sub_A454();
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v4, v5);
  uint64_t v9 = sub_A77C();
  ((void (*)(uint64_t))v7)(v9);
  sub_A558();
  sub_A454();
  uint64_t v10 = sub_A8D8();
  v11(v10);
  sub_A7FC();
  uint64_t v12 = *(void *)(v7 + 8);
  *uint64_t v6 = *(void *)v7;
  v6[1] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(v7 + 24);
  v6[2] = *(void *)(v7 + 16);
  v6[3] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v7 + 40);
  v6[4] = *(void *)(v7 + 32);
  v6[5] = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(v7 + 56);
  v6[6] = *(void *)(v7 + 48);
  v6[7] = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = v6[8];
  unint64_t v17 = v6[9];
  *((_OWORD *)v6 + 4) = *(_OWORD *)(v7 + 64);
  sub_2348(v16, v17);
  uint64_t v18 = v6[10];
  unint64_t v19 = v6[11];
  *((_OWORD *)v6 + 5) = *(_OWORD *)(v7 + 80);
  sub_2348(v18, v19);
  uint64_t v20 = *(void *)(v7 + 104);
  v6[12] = *(void *)(v7 + 96);
  v6[13] = v20;
  swift_bridgeObjectRelease();
  if (v4 != v5)
  {
    sub_A7FC();
    sub_9E70((uint64_t)v6, &qword_1C1C8);
    uint64_t v21 = sub_31FC(&qword_1C1C8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_13E10();
      sub_A454();
      uint64_t v22 = sub_AA08();
      v23(v22);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v6, (const void *)v7, *(void *)(*(void *)(v21 - 8) + 64));
    }
  }
  sub_A7FC();
  uint64_t v24 = (void *)*v6;
  *uint64_t v6 = *(void *)v7;

  v6[1] = *(void *)(v7 + 8);
  sub_A7FC();
  sub_31FC(&qword_1C1F8);
  sub_A454();
  uint64_t v26 = *(void (**)(uint64_t))(v25 + 40);
  uint64_t v27 = sub_A788();
  v26(v27);
  uint64_t v28 = sub_A5B0();
  v26(v28);
  return v4;
}

uint64_t sub_4448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_445C);
}

uint64_t sub_445C(uint64_t a1, uint64_t a2, int *a3)
{
  return sub_4474(a1, a2, a3);
}

uint64_t sub_4474(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_A77C();
  v7(v6);
  sub_A480();
  if (*(_DWORD *)(v9 + 84) == a2)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
LABEL_13:
    return sub_3744(v11, a2, v10);
  }
  sub_31FC(&qword_1C200);
  sub_A480();
  if (*(_DWORD *)(v13 + 84) == a2)
  {
    uint64_t v10 = v12;
    uint64_t v14 = a3[5];
LABEL_12:
    uint64_t v11 = a1 + v14;
    goto LABEL_13;
  }
  if (a2 != 2147483646)
  {
    uint64_t v10 = sub_31FC(&qword_1C1F8);
    uint64_t v14 = a3[7];
    goto LABEL_12;
  }
  unint64_t v15 = *(void *)(a1 + a3[6]);
  if (v15 >= 0xFFFFFFFF) {
    LODWORD(v15) = -1;
  }
  int v16 = v15 - 1;
  if (v16 < 0) {
    int v16 = -1;
  }
  return (v16 + 1);
}

uint64_t sub_4564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_4578);
}

void sub_4578(uint64_t a1, uint64_t a2, int a3, int *a4)
{
}

void sub_4590(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_A77C();
  v9(v8);
  sub_A480();
  if (*(_DWORD *)(v11 + 84) == a3)
  {
    uint64_t v12 = v10;
    uint64_t v13 = a1;
  }
  else
  {
    sub_31FC(&qword_1C200);
    sub_A480();
    if (*(_DWORD *)(v15 + 84) == a3)
    {
      uint64_t v12 = v14;
      uint64_t v16 = a4[5];
    }
    else
    {
      if (a3 == 2147483646)
      {
        *(void *)(a1 + a4[6]) = a2;
        return;
      }
      uint64_t v12 = sub_31FC(&qword_1C1F8);
      uint64_t v16 = a4[7];
    }
    uint64_t v13 = a1 + v16;
  }

  sub_3798(v13, a2, a2, v12);
}

void sub_4670(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_4688(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  a4(319);
  if (v4 <= 0x3F)
  {
    sub_37D8();
    if (v5 <= 0x3F)
    {
      sub_3830();
      if (v7 <= 0x3F)
      {
        sub_A738(v6);
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t *sub_4778(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    unint64_t v5 = a1;
    uint64_t v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_14220();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_486C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_14220();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_48EC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_14220();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_4994(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_14220();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_4A48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_14220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_4ACC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_14220();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_4B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_4B7C);
}

uint64_t sub_4B7C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_14220();
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 20);
    return sub_3744(v9, a2, v8);
  }
}

uint64_t sub_4C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_4C18);
}

void *sub_4C18(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_14220();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)sub_3798(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_4C98()
{
  uint64_t result = sub_14220();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_4D30()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_4D58(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  sub_AA84();
  sub_8F90(0, &qword_1C420);
  uint64_t v6 = sub_AB44();
  v4(v6);
  sub_AA4C();
  uint64_t v7 = sub_AB64();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = *(void **)(v3 + *(int *)(a3(0) + 24));
    if (v9)
    {
      id v10 = v9;
      sub_AA90();
    }
    else
    {
      sub_142C0();
      sub_22B4(&qword_1C1B0, (void (*)(uint64_t))&type metadata accessor for Context);
      sub_AA64();
      __break(1u);
    }
  }
}

uint64_t sub_4E64()
{
  uint64_t v0 = sub_AB44();
  v1(v0);
  sub_AA4C();
  sub_8954();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_14010();
  return sub_AB50(v2, v3, v4, v5);
}

void sub_4ED4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  sub_AA84();
  sub_8F90(0, &qword_1C420);
  uint64_t v6 = sub_AB44();
  v4(v6);
  sub_AA4C();
  uint64_t v7 = sub_AB64();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = *(void **)(v3 + *(int *)(a3(0) + 24));
    if (v9)
    {
      id v10 = v9;
      sub_AA90();
    }
    else
    {
      sub_142C0();
      sub_22B4(&qword_1C1B0, (void (*)(uint64_t))&type metadata accessor for Context);
      sub_AA64();
      __break(1u);
    }
  }
}

uint64_t sub_4FE0()
{
  uint64_t v0 = sub_AB44();
  v1(v0);
  sub_AA4C();
  sub_8954();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_14010();
  return sub_AB50(v2, v3, v4, v5);
}

uint64_t sub_5050()
{
  sub_31FC(&qword_1C490);
  uint64_t v1 = sub_AA34();
  *(_OWORD *)(v1 + 16) = xmmword_148B0;
  sub_31FC(&qword_1C1E8);
  sub_13D90();
  sub_23EC();
  sub_AB0C();
  v32._countAndFlagsBits = sub_A9F4() & 0xFFFF0000FFFFFFFFLL | 0x656500000000;
  v32._object = (void *)0xE600000000000000;
  sub_14310(v32);
  *(void *)(v1 + 32) = v30;
  *(void *)(v1 + 40) = v31;
  uint64_t v2 = (void *)sub_A6A8();
  id v3 = [v2 currencyAmount];

  if (v3)
  {
    sub_13B68();
    uint64_t v5 = v4;

    if (v5)
    {
      swift_bridgeObjectRelease();
      sub_AAB0();
      uint64_t v6 = (void *)sub_A6A8();
      unint64_t v0 = sub_23EC();
      swift_bridgeObjectRelease();

      sub_A6F4();
      sub_A6E0();
      if (v8) {
        uint64_t v1 = (uint64_t)sub_A534(v7);
      }
      sub_A808();
    }
  }
  type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(0);
  sub_31FC(&qword_1C1F0);
  uint64_t v9 = (void *)sub_13DB0();
  id v10 = [v9 paymentRecord];

  if (v10)
  {
    id v11 = [v10 feeAmount];

    if (v11)
    {
      uint64_t v12 = sub_13B68();
      unint64_t v0 = v13;

      sub_1980(v12, v0);
      uint64_t v15 = v14;
      swift_bridgeObjectRelease();
      if (v15)
      {
        swift_bridgeObjectRelease();
        sub_A6A8();
        sub_23EC();
        sub_AB0C();
        sub_A74C();
        sub_A6E0();
        if (v8) {
          uint64_t v1 = (uint64_t)sub_A534(v16);
        }
        sub_A808();
      }
    }
  }
  unint64_t v17 = (void *)sub_A6A8();
  uint64_t v18 = sub_A268(v17);
  sub_1980(v18, v19);
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = swift_bridgeObjectRelease();
  if (v21)
  {
    uint64_t v23 = (void *)sub_A6A8();
    uint64_t v24 = sub_23EC();
    uint64_t v26 = v25;

    sub_A818();
    sub_AAF8();
    if (v8)
    {
      uint64_t v22 = (uint64_t)sub_A534(v27);
      uint64_t v1 = v22;
    }
    *(void *)(v1 + 16) = v23;
    unint64_t v28 = v1 + 16 * v0;
    *(void *)(v28 + 32) = v24;
    *(void *)(v28 + 40) = v26;
  }
  __chkstk_darwin(v22);
  sub_AAD0();
  return sub_14150();
}

uint64_t sub_52D8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, SEL *a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X6>, void (*a8)(void)@<X7>, uint64_t *a9@<X8>)
{
  v288 = a8;
  uint64_t v287 = a7;
  v286 = a6;
  v260 = a5;
  v302 = a4;
  uint64_t v283 = a3;
  v295 = a9;
  uint64_t v300 = sub_31FC(&qword_1C498);
  sub_A464();
  uint64_t v269 = v13;
  __chkstk_darwin(v14);
  sub_A5DC();
  sub_A670(v15);
  uint64_t v292 = sub_31FC(&qword_1C4A0);
  sub_A454();
  __chkstk_darwin(v16);
  sub_A494();
  sub_A4C0();
  __chkstk_darwin(v17);
  sub_A664();
  sub_A670(v18);
  uint64_t v19 = sub_31FC(&qword_1C4A8);
  uint64_t v20 = sub_A618(v19);
  __chkstk_darwin(v20);
  sub_A494();
  sub_A4C0();
  __chkstk_darwin(v21);
  sub_A664();
  sub_A670(v22);
  uint64_t v23 = sub_31FC(&qword_1C4B0);
  uint64_t v24 = sub_A618(v23);
  __chkstk_darwin(v24);
  sub_A494();
  sub_A4C0();
  __chkstk_darwin(v25);
  sub_A664();
  sub_A67C(v26);
  uint64_t v270 = sub_140E0();
  sub_A464();
  uint64_t v273 = v27;
  __chkstk_darwin(v28);
  sub_A5DC();
  sub_A670(v29);
  uint64_t v272 = sub_31FC(&qword_1C4B8);
  sub_A454();
  __chkstk_darwin(v30);
  sub_A5DC();
  sub_A670(v31);
  uint64_t v289 = sub_31FC(&qword_1C4C0);
  sub_A454();
  __chkstk_darwin(v32);
  sub_A494();
  sub_A4C0();
  __chkstk_darwin(v33);
  sub_A664();
  uint64_t v35 = sub_A67C(v34);
  uint64_t v298 = a2(v35);
  sub_A454();
  __chkstk_darwin(v36);
  sub_A670((uint64_t)&v254 - v37);
  uint64_t v38 = sub_31FC(&qword_1C4C8);
  uint64_t v39 = sub_A618(v38);
  __chkstk_darwin(v39);
  sub_A494();
  sub_A4C0();
  __chkstk_darwin(v40);
  sub_A664();
  sub_A67C(v41);
  uint64_t v259 = sub_13E10();
  sub_A464();
  uint64_t v258 = v42;
  __chkstk_darwin(v43);
  sub_A494();
  sub_A4C0();
  __chkstk_darwin(v44);
  sub_A664();
  sub_A670(v45);
  uint64_t v46 = sub_31FC(&qword_1C4D0);
  uint64_t v47 = sub_A618(v46);
  __chkstk_darwin(v47);
  sub_A5DC();
  sub_A67C(v48);
  uint64_t v49 = sub_13F20();
  uint64_t v50 = sub_A618(v49);
  __chkstk_darwin(v50);
  sub_A494();
  sub_A4C0();
  __chkstk_darwin(v51);
  sub_A4C0();
  __chkstk_darwin(v52);
  sub_A664();
  sub_A67C(v53);
  uint64_t v265 = sub_14280();
  sub_A464();
  uint64_t v264 = v54;
  __chkstk_darwin(v55);
  sub_A5DC();
  sub_A670(v56);
  uint64_t v284 = sub_31FC(&qword_1C4D8);
  sub_A454();
  __chkstk_darwin(v57);
  sub_A494();
  sub_A4C0();
  __chkstk_darwin(v58);
  sub_A664();
  sub_A670(v59);
  uint64_t v60 = sub_31FC(&qword_1C4E0);
  uint64_t v61 = sub_A618(v60);
  __chkstk_darwin(v61);
  sub_A494();
  sub_A4C0();
  __chkstk_darwin(v62);
  sub_A664();
  sub_A670(v63);
  uint64_t v64 = sub_31FC(&qword_1C4E8);
  uint64_t v65 = sub_A618(v64);
  __chkstk_darwin(v65);
  sub_A494();
  sub_A4C0();
  __chkstk_darwin(v66);
  sub_A664();
  sub_A670(v67);
  uint64_t v68 = sub_31FC(&qword_1C4F0);
  uint64_t v69 = sub_A618(v68);
  __chkstk_darwin(v69);
  sub_A7EC();
  uint64_t v72 = v71 - v70;
  uint64_t v73 = sub_13D60();
  sub_A464();
  uint64_t v75 = v74;
  __chkstk_darwin(v76);
  sub_A7EC();
  v79 = (void *)(v78 - v77);
  uint64_t v80 = sub_13D80();
  uint64_t v81 = sub_A618(v80);
  __chkstk_darwin(v81);
  sub_A988();
  uint64_t v281 = sub_141A0();
  sub_A464();
  uint64_t v83 = v82;
  __chkstk_darwin(v84);
  sub_A9B8();
  uint64_t v278 = sub_31FC(&qword_1C4F8);
  sub_A454();
  __chkstk_darwin(v85);
  sub_A958();
  v282 = (int *)sub_31FC(&qword_1C500);
  sub_A454();
  __chkstk_darwin(v86);
  sub_A494();
  sub_A4C0();
  __chkstk_darwin(v87);
  sub_A4C0();
  __chkstk_darwin(v88);
  sub_A664();
  uint64_t v90 = sub_A67C(v89);
  uint64_t v283 = ((uint64_t (*)(uint64_t))v283)(v90);
  uint64_t v91 = *(int *)(v283 + 24);
  uint64_t v307 = a1;
  v92 = (void *)(a1 + v91);
  uint64_t v93 = *(void *)(a1 + v91 + 96);
  uint64_t v94 = v92[13];
  v276 = v92;
  void *v79 = v93;
  v79[1] = v94;
  (*(void (**)(void *, void, uint64_t))(v75 + 104))(v79, enum case for SashStandard.Title.applicationBundleIdentifier(_:), v73);
  uint64_t v95 = sub_13DA0();
  sub_3798(v72, 1, 1, v95);
  uint64_t v96 = sub_13DC0();
  sub_3798(v277, 1, 1, v96);
  sub_3798(v280, 1, 1, v96);
  v310 = 0;
  long long v309 = 0u;
  long long v308 = 0u;
  swift_bridgeObjectRetain();
  sub_13D70();
  sub_14190();
  uint64_t v97 = sub_13F60();
  char v98 = sub_13F80();
  sub_13F80();
  if (sub_13F80() != v97) {
    char v98 = sub_13F80();
  }
  sub_13DF0();
  sub_A5C8();
  sub_AAE4();
  v99();
  v100 = (unsigned char *)(v9 + *(int *)(v278 + 36));
  unsigned char *v100 = v98;
  sub_A7B0((uint64_t)v100);
  (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v10, v97);
  unsigned __int8 v101 = sub_13F50();
  char v102 = sub_13F80();
  sub_13F80();
  if (sub_13F80() != v101) {
    char v102 = sub_13F80();
  }
  sub_13DF0();
  sub_A5C8();
  uint64_t v103 = v279;
  sub_9F54(v9, v279, &qword_1C4F8);
  v104 = (unsigned char *)(v103 + v282[9]);
  unsigned char *v104 = v102;
  sub_A7B0((uint64_t)v104);
  uint64_t v105 = sub_A880();
  sub_9E70(v105, v106);
  sub_9F04(v103, v304, &qword_1C500);
  v107 = (uint64_t *)sub_31FC(v302);
  v108 = (void *)sub_13D90();
  v109 = (int *)[v108 currencyAmount];

  v302 = v107;
  if (v109)
  {
    sub_13F10();
    object = (void *)0xE000000000000000;
    v317._countAndFlagsBits = 0;
    v317._object = (void *)0xE000000000000000;
    sub_13F00(v317);
    v282 = v109;
    v111._countAndFlagsBits = sub_13B68();
    if (v111._object) {
      object = v111._object;
    }
    else {
      v111._countAndFlagsBits = 0;
    }
    v111._object = object;
    sub_13EF0(v111);
    swift_bridgeObjectRelease();
    sub_A868();
    sub_13F30();
    uint64_t v112 = sub_A57C();
    uint64_t v114 = v113;
    char v116 = v115 & 1;
    uint64_t v281 = sub_31FC(&qword_1C1F8);
    sub_13E40();
    sub_13FC0();
    uint64_t v117 = enum case for Font.Design.rounded(_:);
    uint64_t v118 = sub_13FA0();
    sub_A454();
    uint64_t v120 = v297;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v119 + 104))(v297, v117, v118);
    sub_3798(v120, 0, 1, v118);
    sub_13FD0();
    sub_9E70(v120, &qword_1C4D0);
    sub_A880();
    uint64_t v121 = sub_13FF0();
    uint64_t v123 = v122;
    char v125 = v124;
    uint64_t v127 = v126;
    swift_release();
    sub_9E60(v112, v114, v116);
    swift_bridgeObjectRelease();
    *((void *)&v309 + 1) = &type metadata for Text;
    v310 = &protocol witness table for Text;
    uint64_t v128 = sub_AA34();
    *(void *)&long long v308 = v128;
    *(void *)(v128 + 16) = v121;
    *(void *)(v128 + 24) = v123;
    *(unsigned char *)(v128 + 32) = v125 & 1;
    *(void *)(v128 + 40) = v127;
    sub_13F10();
    v318._countAndFlagsBits = 0;
    v318._object = (void *)0xE000000000000000;
    sub_13F00(v318);
    v129 = (void *)sub_13D90();
    id v130 = [v129 *v260];

    if (v130)
    {
      id v131 = [v130 displayName];

      id v130 = (id)sub_14300();
      v133 = v132;
    }
    else
    {
      v133 = (void *)0xE000000000000000;
    }
    v319._countAndFlagsBits = (uint64_t)v130;
    v319._object = v133;
    sub_13EF0(v319);
    swift_bridgeObjectRelease();
    sub_A868();
    sub_13F30();
    __int16 v255 = 256;
    uint64_t v254 = 0;
    uint64_t v138 = sub_14000();
    uint64_t v140 = v139;
    char v142 = v141 & 1;
    sub_13E40();
    sub_13FC0();
    uint64_t v143 = v297;
    sub_3798(v297, 1, 1, v118);
    sub_13FD0();
    sub_9E70(v143, &qword_1C4D0);
    uint64_t v144 = sub_13FF0();
    uint64_t v146 = v145;
    LODWORD(v297) = v147;
    swift_release();
    sub_9E60(v138, v140, v142);
    swift_bridgeObjectRelease();
    uint64_t v148 = v256;
    sub_9438(v256);
    uint64_t v149 = v258;
    uint64_t v150 = v257;
    uint64_t v151 = v259;
    (*(void (**)(uint64_t, void, uint64_t))(v258 + 104))(v257, enum case for ColorScheme.light(_:), v259);
    char v152 = sub_13E00();
    v153 = *(void (**)(uint64_t, uint64_t))(v149 + 8);
    v153(v150, v151);
    v153(v148, v151);
    if (v152) {
      uint64_t v154 = sub_140A0();
    }
    else {
      uint64_t v154 = sub_140B0();
    }
    uint64_t v315 = v154;
    char v155 = v297 & 1;
    uint64_t v156 = sub_13FE0();
    uint64_t v158 = v157;
    char v160 = v159;
    uint64_t v162 = v161;
    sub_9E60(v144, v146, v155);
    swift_release();
    swift_bridgeObjectRelease();
    v316[0] = &type metadata for Text;
    v316[1] = &protocol witness table for Text;
    uint64_t v163 = sub_AA34();
    uint64_t v315 = v163;
    *(void *)(v163 + 16) = v156;
    *(void *)(v163 + 24) = v158;
    *(unsigned char *)(v163 + 32) = v160 & 1;
    *(void *)(v163 + 40) = v162;
    uint64_t v313 = 0;
    long long v311 = 0u;
    long long v312 = 0u;
    uint64_t v164 = v263;
    sub_14270();
    unsigned __int8 v165 = sub_13F60();
    sub_13F80();
    sub_13F80();
    if (sub_13F80() != v165) {
      sub_13F80();
    }
    sub_13DF0();
    sub_A5C8();
    uint64_t v166 = v262;
    uint64_t v167 = v265;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v264 + 16))(v262, v164, v265);

    uint64_t v137 = v284;
    sub_A918(v166 + *(int *)(v284 + 36));
    v168(v164, v167);
    uint64_t v169 = v261;
    sub_9F04(v166, v261, &qword_1C4D8);
    uint64_t v170 = v169;
    uint64_t v135 = v305;
    sub_9F04(v170, v305, &qword_1C4D8);
    uint64_t v134 = 0;
    uint64_t v136 = v289;
  }
  else
  {
    uint64_t v134 = 1;
    uint64_t v135 = v305;
    uint64_t v136 = v289;
    uint64_t v137 = v284;
  }
  sub_3798(v135, v134, 1, v137);
  uint64_t v171 = sub_31FC(v286);
  v172 = (void *)sub_13DB0();
  id v173 = [v172 paymentRecord];

  if (!v173) {
    goto LABEL_23;
  }
  id v174 = [v173 feeAmount];

  if (!v174) {
    goto LABEL_23;
  }
  uint64_t v175 = sub_13B68();
  unint64_t v177 = v176;

  sub_1980(v175, v177);
  uint64_t v179 = v178;
  swift_bridgeObjectRelease();
  if (v179)
  {
    swift_bridgeObjectRelease();
    uint64_t v180 = v285;
    sub_23A0();
    sub_328C(v180, v288);
  }
  else
  {
LABEL_23:
    uint64_t v181 = v285;
    sub_23A0();
    v182 = (void *)sub_13D90();
    uint64_t v183 = sub_A268(v182);
    unint64_t v185 = v184;
    sub_328C(v181, v288);
    sub_1980(v183, v185);
    uint64_t v187 = v186;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v187)
    {
      uint64_t v202 = 1;
      uint64_t v201 = v306;
      goto LABEL_32;
    }
  }
  sub_140D0();
  unsigned __int8 v188 = sub_13F70();
  char v189 = sub_13F90();
  char v190 = sub_13F80();
  sub_13F80();
  if (sub_13F80() != v188) {
    char v190 = sub_13F80();
  }
  sub_13F80();
  char v191 = sub_13F80();
  uint64_t v298 = v171;
  if (v191 != v189) {
    char v190 = sub_13F80();
  }
  uint64_t v192 = v271;
  uint64_t v193 = v270;
  sub_13DF0();
  sub_A5C8();
  uint64_t v194 = v273;
  uint64_t v195 = v299;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v273 + 16))(v192, v299, v193);
  v196 = (unsigned char *)(v192 + *(int *)(v272 + 36));
  unsigned char *v196 = v190;
  sub_A7B0((uint64_t)v196);
  (*(void (**)(uint64_t, uint64_t))(v194 + 8))(v195, v193);
  LOBYTE(v193) = sub_13F60();
  char v197 = sub_13F80();
  sub_13F80();
  if (sub_13F80() != v193) {
    char v197 = sub_13F80();
  }
  sub_13DF0();
  sub_A5C8();
  uint64_t v198 = v275;
  sub_9F54(v192, v275, &qword_1C4B8);
  v199 = (unsigned char *)(v198 + *(int *)(v136 + 36));
  unsigned char *v199 = v197;
  sub_A7B0((uint64_t)v199);
  sub_9E70(v192, &qword_1C4B8);
  uint64_t v200 = v274;
  sub_9F04(v198, v274, &qword_1C4C0);
  uint64_t v201 = v306;
  sub_9F04(v200, v306, &qword_1C4C0);
  uint64_t v202 = 0;
LABEL_32:
  uint64_t v203 = 1;
  sub_3798(v201, v202, 1, v136);
  v204 = (void *)sub_13DB0();
  id v205 = [v204 paymentRecord];

  if (v205)
  {
    id v206 = [v205 feeAmount];

    if (v206)
    {
      uint64_t v207 = sub_13B68();
      unint64_t v209 = v208;

      uint64_t v210 = sub_1980(v207, v209);
      v212 = v211;
      swift_bridgeObjectRelease();
      if (v212)
      {
        uint64_t v213 = v276[6];
        v214 = (void *)v276[7];
        sub_A9D0();
        sub_A868();
        v320._countAndFlagsBits = v213;
        v320._object = v214;
        sub_13EF0(v320);
        v321._countAndFlagsBits = 8250;
        v321._object = (void *)0xE200000000000000;
        sub_13F00(v321);
        v322._countAndFlagsBits = v210;
        v322._object = v212;
        sub_13EF0(v322);
        swift_bridgeObjectRelease();
        sub_A868();
        sub_13F30();
        uint64_t v215 = sub_A57C();
        uint64_t v299 = v215;
        uint64_t v298 = v216;
        char v218 = v217 & 1;
        sub_14100();
        sub_AB24();
        sub_14090();
        uint64_t KeyPath = swift_getKeyPath();
        *(void *)&long long v308 = v215;
        sub_A4D0(KeyPath, (uint64_t)&v314);
        sub_31FC(&qword_1C520);
        sub_9D4C();
        sub_14070();
        sub_9E60(v299, v215, v218);
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v203 = 0;
      }
      else
      {
        uint64_t v203 = 1;
      }
    }
  }
  uint64_t v220 = 1;
  sub_3798(v303, v203, 1, v300);
  v221 = (void *)sub_13D90();
  uint64_t v222 = sub_A268(v221);
  uint64_t v224 = sub_1980(v222, v223);
  v226 = v225;
  swift_bridgeObjectRelease();
  if (v226)
  {
    uint64_t v227 = v276[4];
    v228 = (void *)v276[5];
    sub_A9D0();
    sub_A868();
    v323._countAndFlagsBits = v227;
    v323._object = v228;
    sub_13EF0(v323);
    v324._countAndFlagsBits = 8250;
    v324._object = (void *)0xE200000000000000;
    sub_13F00(v324);
    v325._countAndFlagsBits = v224;
    v325._object = v226;
    sub_13EF0(v325);
    swift_bridgeObjectRelease();
    sub_A868();
    sub_13F30();
    uint64_t v229 = sub_A57C();
    uint64_t v307 = v229;
    v302 = v230;
    char v232 = v231 & 1;
    sub_14100();
    sub_AB24();
    uint64_t v233 = v316[2];
    sub_14090();
    uint64_t v234 = swift_getKeyPath();
    *(void *)&long long v308 = v229;
    sub_A4D0(v234, (uint64_t)v316);
    sub_31FC(&qword_1C520);
    sub_9D4C();
    uint64_t v235 = v268;
    sub_14070();
    sub_9E60(v307, v229, v232);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    unsigned __int8 v236 = sub_13F60();
    sub_13F80();
    sub_13F80();
    if (sub_13F80() != v236) {
      sub_13F80();
    }
    sub_13DF0();
    sub_A5C8();
    uint64_t v237 = v267;
    sub_AAE4();
    v238();
    uint64_t v239 = v292;
    sub_A918(v237 + *(int *)(v292 + 36));
    v240(v235, v233);
    uint64_t v241 = v266;
    sub_9F04(v237, v266, &qword_1C4A0);
    uint64_t v242 = v293;
    sub_9F04(v241, v293, &qword_1C4A0);
    uint64_t v220 = 0;
  }
  else
  {
    uint64_t v242 = v293;
    uint64_t v239 = v292;
  }
  sub_3798(v242, v220, 1, v239);
  uint64_t v243 = v301;
  sub_9F54(v304, v301, &qword_1C500);
  uint64_t v244 = v290;
  sub_9F54(v305, v290, &qword_1C4E0);
  uint64_t v245 = v291;
  sub_9F54(v306, v291, &qword_1C4C8);
  uint64_t v246 = v303;
  uint64_t v247 = v294;
  sub_9F54(v303, v294, &qword_1C4B0);
  uint64_t v248 = v296;
  sub_9F54(v242, v296, &qword_1C4A8);
  uint64_t v249 = sub_31FC(&qword_1C508);
  v250 = v295;
  v295[3] = v249;
  v250[4] = sub_A40C(&qword_1C510, &qword_1C508);
  v251 = sub_8D00(v250);
  sub_9F54(v243, (uint64_t)v251, &qword_1C500);
  v252 = (int *)sub_31FC(&qword_1C518);
  sub_9F54(v244, (uint64_t)v251 + v252[12], &qword_1C4E0);
  sub_9F54(v245, (uint64_t)v251 + v252[16], &qword_1C4C8);
  sub_9F54(v247, (uint64_t)v251 + v252[20], &qword_1C4B0);
  sub_9F54(v248, (uint64_t)v251 + v252[24], &qword_1C4A8);
  sub_9E70(v242, &qword_1C4A8);
  sub_9E70(v246, &qword_1C4B0);
  sub_9E70(v306, &qword_1C4C8);
  sub_9E70(v305, &qword_1C4E0);
  sub_9E70(v304, &qword_1C500);
  sub_9E70(v248, &qword_1C4A8);
  sub_9E70(v247, &qword_1C4B0);
  sub_9E70(v245, &qword_1C4C8);
  sub_9E70(v244, &qword_1C4E0);
  return sub_9E70(v301, &qword_1C500);
}

uint64_t sub_6CD4()
{
  uint64_t v0 = sub_AA58();
  uint64_t v1 = type metadata accessor for SendPaymentConfirmationView(v0);
  uint64_t v2 = sub_A4A8(v1);
  __chkstk_darwin(v2);
  sub_A900();
  sub_23A0();
  sub_A8E8();
  swift_allocObject();
  sub_32E0();
  sub_31FC(&qword_1C468);
  sub_A40C(&qword_1C470, &qword_1C468);
  return sub_14160();
}

uint64_t sub_6DF4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v49 = sub_14110();
  uint64_t v54 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v51 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for SendPaymentConfirmationView(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v50 = sub_31FC(&qword_1C408);
  uint64_t v64 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  char v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_31FC(&qword_1C400);
  uint64_t v53 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_14180();
  uint64_t v58 = *(void *)(v59 - 8);
  uint64_t v11 = __chkstk_darwin(v59);
  uint64_t v57 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v62 = (char *)&v43 - v13;
  uint64_t v56 = sub_14250();
  uint64_t v63 = *(void *)(v56 - 8);
  uint64_t v14 = __chkstk_darwin(v56);
  uint64_t v55 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v61 = (char *)&v43 - v16;
  sub_8F90(0, &qword_1C478);
  sub_31FC(&qword_1C1E8);
  uint64_t v17 = (void *)sub_13D90();
  type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(0);
  sub_31FC(&qword_1C1F0);
  uint64_t v18 = (void *)sub_13DB0();
  sub_2490(v17, v18);
  uint64_t v67 = a1;
  sub_14260();
  uint64_t v48 = type metadata accessor for SendPaymentConfirmationView;
  uint64_t v44 = a1;
  sub_23A0();
  uint64_t v19 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v47 = ((v19 + 16) & ~v19) + v6;
  uint64_t v46 = v19 | 7;
  swift_allocObject();
  uint64_t v45 = type metadata accessor for SendPaymentConfirmationView;
  sub_32E0();
  uint64_t v66 = a1;
  sub_140C0();
  uint64_t v20 = v54;
  uint64_t v21 = v51;
  uint64_t v22 = v49;
  (*(void (**)(char *, void, uint64_t))(v54 + 104))(v51, enum case for ButtonItemButtonStyle.Role.preferred(_:), v49);
  uint64_t v23 = sub_A40C(&qword_1C410, &qword_1C408);
  uint64_t v24 = v50;
  sub_14030();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v22);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v64 + 8);
  v64 += 8;
  v25(v8, v24);
  uint64_t v71 = v24;
  uint64_t v72 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v26 = v52;
  uint64_t v27 = sub_14020();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v10, v26);
  uint64_t v73 = &type metadata for AnyView;
  uint64_t v74 = &protocol witness table for AnyView;
  uint64_t v71 = v27;
  uint64_t v28 = v44;
  sub_23A0();
  swift_allocObject();
  sub_32E0();
  uint64_t v65 = v28;
  sub_140C0();
  uint64_t v29 = sub_14020();
  v25(v8, v24);
  uint64_t v69 = &type metadata for AnyView;
  uint64_t v70 = &protocol witness table for AnyView;
  uint64_t v68 = v29;
  uint64_t v30 = v62;
  sub_14170();
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
  uint64_t v32 = v55;
  uint64_t v33 = v56;
  v31(v55, v61, v56);
  uint64_t v34 = v58;
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
  uint64_t v36 = v57;
  uint64_t v37 = v59;
  v35(v57, v30, v59);
  uint64_t v38 = v60;
  v31(v60, v32, v33);
  uint64_t v39 = sub_31FC(&qword_1C480);
  v35(&v38[*(int *)(v39 + 48)], v36, v37);
  uint64_t v40 = *(void (**)(char *, uint64_t))(v34 + 8);
  v40(v62, v37);
  uint64_t v41 = *(void (**)(char *, uint64_t))(v63 + 8);
  v41(v61, v33);
  v40(v36, v37);
  return ((uint64_t (*)(char *, uint64_t))v41)(v32, v33);
}

uint64_t sub_766C()
{
  sub_A930();
  uint64_t v2 = sub_14140();
  sub_A464();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_A970();
  v0();
  uint64_t v6 = sub_14240();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
  sub_31FC(&qword_1C488);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_148B0;
  *(void *)(v7 + 32) = v6;
  uint64_t v8 = sub_14230();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_7750()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_776C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_7788()
{
  uint64_t v0 = sub_AA58();
  uint64_t v1 = type metadata accessor for AppDisambiguationView(v0);
  uint64_t v2 = sub_A4A8(v1);
  __chkstk_darwin(v2);
  uint64_t v3 = sub_141F0();
  uint64_t v4 = sub_A618(v3);
  __chkstk_darwin(v4);
  sub_A958();
  swift_bridgeObjectRetain();
  sub_141E0();
  sub_23A0();
  swift_allocObject();
  sub_32E0();
  sub_31FC(&qword_1C428);
  sub_8A3C();
  return sub_141B0();
}

uint64_t sub_791C()
{
  uint64_t v0 = type metadata accessor for AppDisambiguationView(0);
  __chkstk_darwin(v0 - 8);
  swift_getKeyPath();
  sub_23A0();
  swift_allocObject();
  sub_32E0();
  sub_31FC(&qword_1C440);
  sub_31FC(&qword_1C448);
  sub_8C38();
  sub_141D0();
  sub_22B4(&qword_1C438, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
  swift_getOpaqueTypeConformance2();
  return sub_140F0();
}

uint64_t sub_7B20@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for AppDisambiguationView(0);
  uint64_t v23 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v23 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = sub_13DE0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_141D0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = *a1;
  if ((*a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v14 < *(void *)(*(void *)a2 + 16))
  {
    uint64_t v15 = *(void *)a2 + 32 * v14;
    uint64_t v22 = result;
    uint64_t v17 = *(void *)(v15 + 32);
    uint64_t v16 = *(void *)(v15 + 40);
    uint64_t v48 = &type metadata for String;
    uint64_t v49 = &protocol witness table for String;
    uint64_t v46 = v17;
    uint64_t v47 = v16;
    uint64_t v45 = 0;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v42 = 0;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v39 = 0;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v36 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v33 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v27 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v21 = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_13DD0();
    swift_bridgeObjectRelease();
    v24[3] = sub_14120();
    v24[4] = (uint64_t)&protocol witness table for RFImageView;
    sub_8D00(v24);
    sub_14130();
    sub_141C0();
    sub_23A0();
    unint64_t v18 = (v7 + ((*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v19 = swift_allocObject();
    sub_32E0();
    *(void *)(v19 + v18) = v14;
    sub_22B4(&qword_1C438, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
    uint64_t v20 = v22;
    sub_14040();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v20);
  }
  __break(1u);
  return result;
}

uint64_t sub_7EA4(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_142A0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AppDisambiguationView(0);
  sub_14200();
  sub_31FC(&qword_1C460);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_148B0;
  v15[1] = 0x6449707061;
  v15[2] = 0xE500000000000000;
  uint64_t result = sub_14360();
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(*(void *)a1 + 16) > a2)
  {
    uint64_t v10 = *(void *)a1 + 32 * a2;
    uint64_t v12 = *(void *)(v10 + 48);
    uint64_t v11 = *(void *)(v10 + 56);
    *(void *)(inited + 96) = &type metadata for String;
    *(void *)(inited + 72) = v12;
    *(void *)(inited + 80) = v11;
    swift_bridgeObjectRetain();
    uint64_t v13 = (void *)sub_142E0();
    v16._object = (void *)0x8000000000015C50;
    v16._countAndFlagsBits = 0xD000000000000021;
    v14._rawValue = v13;
    sub_14290(v16, v14);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  __break(1u);
  return result;
}

uint64_t sub_806C()
{
  return sub_14080();
}

uint64_t sub_808C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_80A8()
{
  uint64_t v1 = swift_allocObject();
  memcpy((void *)(v1 + 16), v0, 0x50uLL);
  sub_888C((uint64_t *)v0);
  sub_14180();
  sub_22B4(&qword_1C3F8, (void (*)(uint64_t))&type metadata accessor for BinaryButtonView);

  return sub_14160();
}

uint64_t sub_8174()
{
  uint64_t v0 = sub_31FC(&qword_1C400);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_8398();
  uint64_t v4 = sub_88F8(&qword_1C408);
  uint64_t v5 = sub_A40C(&qword_1C410, &qword_1C408);
  uint64_t v11 = v4;
  uint64_t v12 = v5;
  swift_getOpaqueTypeConformance2();
  uint64_t v6 = sub_14020();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v3, v0);
  uint64_t v13 = &type metadata for AnyView;
  Swift::OpaquePointer v14 = &protocol witness table for AnyView;
  uint64_t v11 = v6;
  sub_8398();
  uint64_t v8 = sub_14020();
  v7(v3, v0);
  v10[3] = &type metadata for AnyView;
  v10[4] = &protocol witness table for AnyView;
  v10[0] = v8;
  return sub_14170();
}

void sub_8398()
{
  sub_A88C();
  uint64_t v2 = sub_14110();
  sub_A464();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_A7EC();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_31FC(&qword_1C408);
  sub_A464();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_A9A0();
  uint64_t v13 = swift_allocObject();
  memcpy((void *)(v13 + 16), v0, 0x50uLL);
  sub_888C((uint64_t *)v0);
  sub_140C0();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v8, enum case for ButtonItemButtonStyle.Role.preferred(_:), v2);
  sub_A40C(&qword_1C410, &qword_1C408);
  sub_14030();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v9);
  sub_A940();
}

void sub_855C(uint64_t a1)
{
  sub_8F90(0, &qword_1C420);
  uint64_t v2 = sub_AB64();
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 64);
    if (v3)
    {
      uint64_t v4 = (void *)v2;
      id v5 = v3;
      sub_142B0();
    }
    else
    {
      sub_142C0();
      sub_22B4(&qword_1C1B0, (void (*)(uint64_t))&type metadata accessor for Context);
      sub_13E70();
      __break(1u);
    }
  }
}

uint64_t sub_8660@<X0>(uint64_t a1@<X8>)
{
  sub_8954();
  swift_bridgeObjectRetain();
  uint64_t result = sub_14010();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

void sub_86CC(uint64_t a1)
{
  sub_8F90(0, &qword_1C420);
  uint64_t v2 = sub_AB64();
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 64);
    if (v3)
    {
      char v4 = (void *)v2;
      id v5 = v3;
      sub_142B0();
    }
    else
    {
      sub_142C0();
      sub_22B4(&qword_1C1B0, (void (*)(uint64_t))&type metadata accessor for Context);
      sub_13E70();
      __break(1u);
    }
  }
}

uint64_t sub_87D0@<X0>(uint64_t a1@<X8>)
{
  sub_8954();
  swift_bridgeObjectRetain();
  uint64_t result = sub_14010();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_883C()
{
  memcpy(v2, v0, sizeof(v2));
  return sub_80A8();
}

uint64_t sub_8884()
{
  return sub_8174();
}

uint64_t *sub_888C(uint64_t *a1)
{
  uint64_t v2 = a1[4];
  unint64_t v3 = a1[5];
  char v4 = (void *)a1[8];
  sub_225C(*a1, a1[1]);
  swift_bridgeObjectRetain();
  sub_225C(v2, v3);
  id v5 = v4;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_88F8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_8944()
{
  sub_86CC(v0 + 16);
}

uint64_t sub_894C@<X0>(uint64_t a1@<X8>)
{
  return sub_87D0(a1);
}

unint64_t sub_8954()
{
  unint64_t result = qword_1C418;
  if (!qword_1C418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C418);
  }
  return result;
}

uint64_t sub_89A4()
{
  sub_2348(*(void *)(v0 + 16), *(void *)(v0 + 24));
  swift_bridgeObjectRelease();
  sub_2348(*(void *)(v0 + 48), *(void *)(v0 + 56));
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 96, 7);
}

void sub_89FC()
{
  sub_855C(v0 + 16);
}

uint64_t sub_8A04@<X0>(uint64_t a1@<X8>)
{
  return sub_8660(a1);
}

uint64_t sub_8A10()
{
  return sub_8F08((uint64_t)type metadata accessor for AppDisambiguationView, (uint64_t (*)(uint64_t))sub_791C);
}

unint64_t sub_8A3C()
{
  unint64_t result = qword_1C430;
  if (!qword_1C430)
  {
    sub_88F8(&qword_1C428);
    sub_141D0();
    sub_22B4(&qword_1C438, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C430);
  }
  return result;
}

uint64_t sub_8B14()
{
  type metadata accessor for AppDisambiguationView(0);
  sub_A68C();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 80) | 7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_14220();
  sub_A454();
  sub_A6C0();
  v2();
  uint64_t v3 = sub_A880();

  return _swift_deallocObject(v3, v4, v1);
}

uint64_t sub_8BD8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for AppDisambiguationView(0);
  sub_A738(v5);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_7B20(a1, v7, a2);
}

unint64_t sub_8C38()
{
  unint64_t result = qword_1C450;
  if (!qword_1C450)
  {
    sub_88F8(&qword_1C440);
    sub_8CB4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C450);
  }
  return result;
}

unint64_t sub_8CB4()
{
  unint64_t result = qword_1C458;
  if (!qword_1C458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C458);
  }
  return result;
}

uint64_t *sub_8D00(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_8D64()
{
  type metadata accessor for AppDisambiguationView(0);
  sub_A68C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = ((*(void *)(v4 + 64) + ((v5 + 16) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_14220();
  sub_A454();
  sub_A6C0();
  v8();

  return _swift_deallocObject(v0, v7, v6);
}

uint64_t sub_8E38()
{
  uint64_t v1 = type metadata accessor for AppDisambiguationView(0);
  sub_A4A8(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v7 = *(void *)(v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_7EA4(v0 + v6, v7);
}

uint64_t sub_8EA0()
{
  return sub_9038();
}

uint64_t sub_8EDC()
{
  return sub_8F08((uint64_t)type metadata accessor for RequestPaymentConfirmationView, (uint64_t (*)(uint64_t))sub_2894);
}

uint64_t sub_8F08(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_AA58();
  uint64_t v5 = *(void *)(v4(v3) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a2(v6);
}

uint64_t sub_8F90(uint64_t a1, unint64_t *a2)
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

uint64_t sub_8FCC()
{
  return sub_766C();
}

uint64_t sub_8FFC()
{
  return sub_9038();
}

uint64_t sub_9038()
{
  sub_A88C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = (int *)v7(0);
  uint64_t v9 = *(unsigned __int8 *)(*((void *)v8 - 1) + 80);
  uint64_t v10 = v0 + ((v9 + 16) & ~v9);
  sub_31FC(v6);
  sub_A454();
  sub_A6C0();
  v11();
  uint64_t v12 = v4(0);
  sub_31FC(v2);
  sub_A454();
  sub_A6C0();
  v13();
  uint64_t v14 = v10 + *(int *)(v12 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2348(*(void *)(v14 + 64), *(void *)(v14 + 72));
  sub_2348(*(void *)(v14 + 80), *(void *)(v14 + 88));
  swift_bridgeObjectRelease();
  sub_31FC(&qword_1C1C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_13E10();
    sub_A454();
    sub_A6C0();
    v15();
  }
  else
  {
    swift_release();
  }

  uint64_t v16 = v10 + v8[7];
  uint64_t v17 = sub_31FC(&qword_1C1F8);
  sub_A454();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  v19(v16, v17);
  v19(v10 + v8[8], v17);
  sub_A940();
  return _swift_deallocObject(v20, v21, v22);
}

uint64_t sub_9270()
{
  return sub_9384(type metadata accessor for RequestPaymentConfirmationView, (uint64_t)type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel, (uint64_t)type metadata accessor for RequestPaymentConfirmationView, (uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_4D58);
}

uint64_t sub_92C4()
{
  return sub_4E64();
}

uint64_t sub_92F4()
{
  return sub_9038();
}

uint64_t sub_9330()
{
  return sub_9384(type metadata accessor for RequestPaymentConfirmationView, (uint64_t)type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel, (uint64_t)type metadata accessor for RequestPaymentConfirmationView, (uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_4ED4);
}

uint64_t sub_9384(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t (*a4)(unint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = *(void *)(a1(0) - 8);
  return a4(v4 + ((*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), a2, a3);
}

uint64_t sub_9408()
{
  return sub_4FE0();
}

uint64_t sub_9438@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_13EE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_31FC(&qword_1C1C8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9F54(v2, (uint64_t)v10, &qword_1C1C8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_13E10();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_14330();
    uint64_t v14 = sub_13F40();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_97C8(0x686353726F6C6F43, 0xEB00000000656D65, &v17);
      _os_log_impl(&dword_0, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_13ED0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

char *sub_96C8(char *result, int64_t a2, char a3, char *a4)
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
    sub_31FC(&qword_1C490);
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
  os_log_type_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_97C8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_98C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_9FF4((uint64_t)v12, *a3);
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
      sub_9FF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_9FA4((uint64_t)v12);
  return v7;
}

uint64_t sub_989C()
{
  return sub_13EC0();
}

uint64_t sub_98C8(uint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
          memcpy(__dst, __src, HIBYTE(a6) & 0xF);
          uint64_t result = 0;
          *((unsigned char *)__dst + v11) = 0;
          *a1 = (uint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_9A0C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_143B0();
    if (!v8)
    {
      uint64_t result = sub_143C0();
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

char *sub_9A0C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_9AA4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_9BA8(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_9BA8((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_9AA4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_9B40(v2, 0);
      uint64_t result = (void *)sub_14380();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_14320();
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

void *sub_9B40(uint64_t a1, uint64_t a2)
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
  sub_31FC(&qword_1C550);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_9BA8(char *result, int64_t a2, char a3, char *a4)
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
    sub_31FC(&qword_1C550);
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
  os_log_type_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[v8] <= v12) {
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

uint64_t sub_9C94@<X0>(uint64_t *a1@<X8>)
{
  return sub_52D8(*(void *)(v1 + 16), type metadata accessor for RequestPaymentConfirmationView, (uint64_t)type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel, &qword_1C2B8, (SEL *)&selRef_payer, &qword_1C2C0, (uint64_t)type metadata accessor for RequestPaymentConfirmationView, (void (*)(void))type metadata accessor for RequestPaymentConfirmationView, a1);
}

uint64_t sub_9D1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_13EB0();
  *a1 = result;
  return result;
}

unint64_t sub_9D4C()
{
  unint64_t result = qword_1C528;
  if (!qword_1C528)
  {
    sub_88F8(&qword_1C520);
    sub_9DEC();
    sub_A40C(&qword_1C540, &qword_1C548);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C528);
  }
  return result;
}

unint64_t sub_9DEC()
{
  unint64_t result = qword_1C530;
  if (!qword_1C530)
  {
    sub_88F8(&qword_1C538);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C530);
  }
  return result;
}

uint64_t sub_9E60(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_9E70(uint64_t a1, uint64_t *a2)
{
  sub_31FC(a2);
  sub_A454();
  sub_A6C0();
  v3();
  return a1;
}

uint64_t sub_9EC0()
{
  sub_9E60(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_9F04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_31FC(a3);
  sub_A454();
  uint64_t v4 = sub_A79C();
  v5(v4);
  return a2;
}

uint64_t sub_9F54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_31FC(a3);
  sub_A454();
  uint64_t v4 = sub_A6CC();
  v5(v4);
  return a2;
}

uint64_t sub_9FA4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_9FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_A050()
{
  return sub_9038();
}

uint64_t sub_A08C()
{
  return sub_8F08((uint64_t)type metadata accessor for SendPaymentConfirmationView, (uint64_t (*)(uint64_t))sub_6DF4);
}

uint64_t sub_A0B8()
{
  return sub_766C();
}

uint64_t sub_A0E8()
{
  return sub_9038();
}

uint64_t sub_A124()
{
  return sub_9384(type metadata accessor for SendPaymentConfirmationView, (uint64_t)type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel, (uint64_t)type metadata accessor for SendPaymentConfirmationView, (uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_4D58);
}

uint64_t sub_A178()
{
  return sub_4E64();
}

uint64_t sub_A1A8()
{
  return sub_9038();
}

uint64_t sub_A1E4()
{
  return sub_9384(type metadata accessor for SendPaymentConfirmationView, (uint64_t)type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel, (uint64_t)type metadata accessor for SendPaymentConfirmationView, (uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_4ED4);
}

uint64_t sub_A238()
{
  return sub_4FE0();
}

uint64_t sub_A268(void *a1)
{
  id v2 = [a1 note];

  if (v2)
  {
    sub_14300();
  }
  return sub_A880();
}

uint64_t sub_A2D4@<X0>(uint64_t *a1@<X8>)
{
  return sub_52D8(*(void *)(v1 + 16), type metadata accessor for SendPaymentConfirmationView, (uint64_t)type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel, &qword_1C1E8, (SEL *)&selRef_payee, &qword_1C1F0, (uint64_t)type metadata accessor for SendPaymentConfirmationView, (void (*)(void))type metadata accessor for SendPaymentConfirmationView, a1);
}

uint64_t sub_A358()
{
  return sub_A40C(&qword_1C558, &qword_1C560);
}

uint64_t sub_A394()
{
  return sub_A40C(&qword_1C568, &qword_1C570);
}

uint64_t sub_A3D0()
{
  return sub_A40C(&qword_1C578, &qword_1C580);
}

uint64_t sub_A40C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_88F8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_A4A8(uint64_t a1)
{
  return a1 - 8;
}

void sub_A4C0()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_A4D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v11 - 328) = *(void *)(a2 - 256);
  *(unsigned char *)(v11 - 320) = v6;
  *(void *)(v11 - 312) = v5;
  *(void *)(v11 - 304) = v3;
  *(unsigned char *)(v11 - 296) = v8;
  *(void *)(v11 - 288) = v9;
  *(unsigned char *)(v11 - 280) = v10;
  *(void *)(v11 - 272) = v2;
  *(void *)(v11 - 264) = v4;
  *(void *)(v11 - 256) = a1;
  *(void *)(v11 - 248) = v7;
  return static Font.Weight.regular.getter();
}

char *sub_A534@<X0>(unint64_t a1@<X8>)
{
  return sub_96C8((char *)(a1 > 1), v1, 1, v2);
}

uint64_t sub_A558()
{
  return sub_31FC(v0);
}

uint64_t sub_A57C()
{
  return sub_14000();
}

uint64_t sub_A5B0()
{
  return v0 + *(int *)(v1 + 32);
}

uint64_t sub_A5F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_31FC(a4);
}

uint64_t sub_A618(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_A624()
{
  uint64_t v4 = *(int *)(v2 + 24);
  uint64_t v5 = (void *)(v0 + v4);
  uint64_t v6 = *(void *)(v1 + v4 + 8);
  *uint64_t v5 = *(void *)(v1 + v4);
  v5[1] = v6;
  uint64_t v7 = *(void *)(v1 + v4 + 24);
  v5[2] = *(void *)(v1 + v4 + 16);
  v5[3] = v7;
  uint64_t v8 = *(void *)(v1 + v4 + 40);
  v5[4] = *(void *)(v1 + v4 + 32);
  v5[5] = v8;
  uint64_t v9 = *(void *)(v1 + v4 + 56);
  v5[6] = *(void *)(v1 + v4 + 48);
  v5[7] = v9;
  return swift_bridgeObjectRetain();
}

void sub_A670(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t sub_A67C@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_A6A8()
{
  return sub_13D90();
}

uint64_t sub_A6CC()
{
  return v0;
}

void sub_A6F4()
{
  *(void *)(v2 - 80) = v0;
  *(void *)(v2 - 72) = v1;
  v4._countAndFlagsBits = 0x636E65727275632ELL;
  v4._object = (void *)0xEF746E756F6D4179;
  sub_14310(v4);
}

uint64_t sub_A738(uint64_t a1)
{
  return a1 - 8;
}

void sub_A74C()
{
  *(void *)(v2 - 80) = v0;
  *(void *)(v2 - 72) = v1;
  v4._countAndFlagsBits = 0x756F6D416565662ELL;
  v4._object = (void *)0xEA0000000000746ELL;
  sub_14310(v4);
}

uint64_t sub_A77C()
{
  return 0;
}

uint64_t sub_A788()
{
  return v0;
}

uint64_t sub_A79C()
{
  return v0;
}

void sub_A7B0(uint64_t a1@<X8>)
{
  *(void *)(a1 + 8) = v1;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = 0;
}

uint64_t sub_A7C0()
{
  uint64_t v4 = *(int *)(v2 + 24);
  uint64_t v5 = (void *)(v0 + v4);
  uint64_t v6 = (uint64_t *)(v1 + v4);
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  *uint64_t v5 = v8;
  v5[1] = v7;
  return _objc_retain_x11();
}

void sub_A808()
{
  *(void *)(v1 + 16) = v0;
  uint64_t v5 = v1 + 16 * v4;
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 40) = v3;
}

void sub_A818()
{
  *(void *)(v2 - 80) = v0;
  *(void *)(v2 - 72) = v1;
  v4._countAndFlagsBits = 0x65746F6E2ELL;
  v4._object = (void *)0xE500000000000000;
  sub_14310(v4);
}

uint64_t sub_A840()
{
  v2[10] = v0;
  v2[11] = v1;
  uint64_t v5 = *(void *)(v3 + 104);
  v2[12] = *(void *)(v3 + 96);
  v2[13] = v5;
  return swift_bridgeObjectRetain();
}

void sub_A868()
{
  v1._countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  sub_13F00(v1);
}

uint64_t sub_A880()
{
  return v0;
}

uint64_t sub_A8A4()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_A8C0()
{
  return v0;
}

uint64_t sub_A8D8()
{
  return v0;
}

void sub_A918(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = 0;
}

uint64_t sub_A930()
{
  return 0;
}

uint64_t sub_A9D0()
{
  return sub_13F10();
}

uint64_t sub_A9F4()
{
  *(void *)(v2 - 80) = v0;
  *(void *)(v2 - 72) = v1;
  return 2036428846;
}

uint64_t sub_AA08()
{
  return v0;
}

uint64_t sub_AA1C()
{
  return sub_225C(v0, v1);
}

uint64_t sub_AA34()
{
  return swift_allocObject();
}

uint64_t sub_AA58()
{
  return 0;
}

uint64_t sub_AA64()
{
  return sub_13E70();
}

uint64_t sub_AA90()
{
  return sub_142B0();
}

void sub_AAB0()
{
  *(void *)(v0 - 80) = 0;
  *(void *)(v0 - 72) = 0xE000000000000000;
  _StringGuts.grow(_:)(17);
}

void sub_AB0C()
{
}

uint64_t sub_AB24()
{
  return _FrameLayout.init(width:height:alignment:)(0, 1, 0, 1);
}

uint64_t sub_AB44()
{
  return 0;
}

uint64_t sub_AB50(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)uint64_t v4 = result;
  *(void *)(v4 + 8) = a2;
  *(unsigned char *)(v4 + 16) = a3 & 1;
  *(void *)(v4 + 24) = a4;
  return result;
}

uint64_t sub_AB64()
{
  uint64_t v0 = self;
  Class isa = sub_13D40().super.isa;
  v9[0] = 0;
  id v2 = [v0 propertyListWithData:isa options:0 format:0 error:v9];

  if (!v2)
  {
    id v7 = v9[0];
    sub_13D30();

    swift_willThrow();
    swift_errorRelease();
    return 0;
  }
  id v3 = v9[0];
  sub_14350();
  swift_unknownObjectRelease();
  sub_31FC(&qword_1CA00);
  if (!swift_dynamicCast()) {
    return 0;
  }
  uint64_t v4 = self;
  uint64_t result = (uint64_t)sub_F4D8(v8, v4);
  if (result)
  {
    uint64_t v6 = (void *)result;
    self;
    uint64_t result = swift_dynamicCastObjCClass();
    if (!result)
    {

      return 0;
    }
  }
  return result;
}

uint64_t sub_ACE0(uint64_t a1)
{
  unint64_t v2 = sub_12470();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_AD1C(uint64_t a1)
{
  unint64_t v2 = sub_12470();

  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_AD58()
{
  sub_134FC();
  sub_13994();
  sub_31FC(&qword_1C9E8);
  sub_A464();
  __chkstk_darwin(v1);
  sub_13694();
  sub_12470();
  sub_13674();
  sub_31FC(&qword_1C2B8);
  sub_A40C(&qword_1C9F0, &qword_1C2B8);
  sub_13790();
  if (!v0)
  {
    type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(0);
    sub_13930();
    sub_31FC(&qword_1C2C0);
    sub_A40C(&qword_1C9F8, &qword_1C2C0);
    sub_13790();
    sub_13588();
    sub_13790();
  }
  uint64_t v2 = sub_13A20();
  v3(v2);
  sub_13514();
}

void sub_AEEC()
{
  sub_134FC();
  sub_13B18(v2);
  sub_31FC(&qword_1C2C0);
  sub_A464();
  __chkstk_darwin(v3);
  sub_1352C();
  uint64_t v4 = sub_31FC(&qword_1C2B8);
  sub_A464();
  __chkstk_darwin(v5);
  sub_13638(v6, v16);
  sub_31FC(&qword_1C980);
  sub_A464();
  __chkstk_darwin(v7);
  uint64_t v8 = sub_13894();
  type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(v8);
  sub_A454();
  __chkstk_darwin(v9);
  sub_EE24(v0, v0[3]);
  sub_12470();
  sub_139BC();
  if (v1)
  {
    sub_9FA4((uint64_t)v0);
  }
  else
  {
    sub_138E8();
    sub_A40C(&qword_1C990, &qword_1C2B8);
    sub_137A8();
    uint64_t v10 = sub_13710();
    v11(v10);
    sub_A40C(&qword_1C998, &qword_1C2C0);
    sub_137D8();
    uint64_t v12 = sub_136B8();
    v13(v12);
    sub_123D4();
    sub_13844();
    uint64_t v14 = sub_13614();
    v15(v14);
    sub_13544();
    sub_12420();
    sub_9FA4((uint64_t)v0);
    sub_F8C8(v4, (void (*)(void))type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel);
  }
  sub_13514();
}

uint64_t sub_B1D4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E65746E69 && a2 == 0xE600000000000000;
  if (v2 || (sub_139E8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x65736E6F70736572 && a2 == 0xE800000000000000;
    if (v6 || (sub_139E8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x616D7269666E6F63 && a2 == 0xEC0000006E6F6974)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_139E8();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_B310()
{
  return 3;
}

uint64_t sub_B318(char a1)
{
  if (!a1) {
    return 0x746E65746E69;
  }
  if (a1 == 1) {
    return 0x65736E6F70736572;
  }
  return 0x616D7269666E6F63;
}

void sub_B374()
{
  sub_134FC();
  sub_13994();
  sub_31FC(&qword_1C9C8);
  sub_A464();
  __chkstk_darwin(v1);
  sub_13694();
  sub_12388();
  sub_13674();
  sub_31FC(&qword_1C1E8);
  sub_A40C(&qword_1C9D0, &qword_1C1E8);
  sub_13790();
  if (!v0)
  {
    type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(0);
    sub_13930();
    sub_31FC(&qword_1C1F0);
    sub_A40C(&qword_1C9D8, &qword_1C1F0);
    sub_13790();
    sub_13588();
    sub_13790();
  }
  uint64_t v2 = sub_13A20();
  v3(v2);
  sub_13514();
}

void sub_B508()
{
  sub_134FC();
  sub_13B18(v2);
  sub_31FC(&qword_1C1F0);
  sub_A464();
  __chkstk_darwin(v3);
  sub_1352C();
  uint64_t v4 = sub_31FC(&qword_1C1E8);
  sub_A464();
  __chkstk_darwin(v5);
  sub_13638(v6, v16);
  sub_31FC(&qword_1C958);
  sub_A464();
  __chkstk_darwin(v7);
  uint64_t v8 = sub_13894();
  type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(v8);
  sub_A454();
  __chkstk_darwin(v9);
  sub_EE24(v0, v0[3]);
  sub_12388();
  sub_139BC();
  if (v1)
  {
    sub_9FA4((uint64_t)v0);
  }
  else
  {
    sub_138E8();
    sub_A40C(&qword_1C968, &qword_1C1E8);
    sub_137A8();
    uint64_t v10 = sub_13710();
    v11(v10);
    sub_A40C(&qword_1C970, &qword_1C1F0);
    sub_137D8();
    uint64_t v12 = sub_136B8();
    v13(v12);
    sub_123D4();
    sub_13844();
    uint64_t v14 = sub_13614();
    v15(v14);
    sub_13544();
    sub_12420();
    sub_9FA4((uint64_t)v0);
    sub_F8C8(v4, (void (*)(void))type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel);
  }
  sub_13514();
}

uint64_t sub_B7F0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4C6D7269666E6F63 && a2 == 0xEC0000006C656261;
  if (v2 || (sub_14450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x614C6C65636E6163 && a2 == 0xEB000000006C6562;
    if (v6 || (sub_14450() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6562614C65746F6ELL && a2 == 0xE90000000000006CLL;
      if (v7 || (sub_14450() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6C6562614C656566 && a2 == 0xE800000000000000;
        if (v8 || (sub_14450() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x446D7269666E6F63 && a2 == 0xE900000000000049;
          if (v9 || (sub_14450() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x49446C65636E6163 && a2 == 0xE800000000000000;
            if (v10 || (sub_14450() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0x6449707061 && a2 == 0xE500000000000000)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              char v12 = sub_14450();
              swift_bridgeObjectRelease();
              if (v12) {
                return 6;
              }
              else {
                return 7;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_BAF8()
{
  return 7;
}

uint64_t sub_BB00(char a1)
{
  uint64_t result = 0x4C6D7269666E6F63;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x614C6C65636E6163;
      break;
    case 2:
      uint64_t result = 0x6562614C65746F6ELL;
      break;
    case 3:
      uint64_t result = 0x6C6562614C656566;
      break;
    case 4:
      uint64_t result = 0x446D7269666E6F63;
      break;
    case 5:
      uint64_t result = 0x49446C65636E6163;
      break;
    case 6:
      uint64_t result = 0x6449707061;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_BC00()
{
  sub_31FC(&qword_1CA78);
  sub_A464();
  __chkstk_darwin(v1);
  sub_13694();
  sub_131D0();
  sub_13674();
  sub_14430();
  if (!v0)
  {
    sub_135F0(1);
    sub_135F0(2);
    sub_135F0(3);
    sub_124BC();
    sub_1386C();
    sub_1386C();
    sub_135F0(6);
  }
  sub_1362C();
  return v2();
}

void sub_BD8C()
{
  sub_134FC();
  BOOL v2 = v1;
  uint64_t v4 = v3;
  sub_31FC(&qword_1CA68);
  sub_A464();
  __chkstk_darwin(v5);
  sub_EE24(v2, v2[3]);
  sub_131D0();
  sub_14490();
  if (v0)
  {
    sub_9FA4((uint64_t)v2);
  }
  else
  {
    uint64_t v6 = sub_135D0();
    uint64_t v8 = v7;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_135D0();
    uint64_t v22 = v6;
    uint64_t v10 = v9;
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_135D0();
    LOBYTE(v25) = 3;
    uint64_t v24 = v11;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_135D0();
    uint64_t v23 = v13;
    uint64_t v19 = v12;
    sub_122A4();
    swift_bridgeObjectRetain();
    sub_13B04();
    sub_14400();
    sub_225C(v25, v26);
    sub_13B04();
    sub_14400();
    sub_225C(v25, v26);
    uint64_t v14 = sub_135D0();
    uint64_t v17 = v15;
    uint64_t v18 = v14;
    sub_1362C();
    v16();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_225C(v25, v26);
    sub_225C(v25, v26);
    swift_bridgeObjectRetain();
    sub_2348(v25, v26);
    sub_2348(v25, v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_9FA4((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2348(v25, v26);
    sub_2348(v25, v26);
    swift_bridgeObjectRelease();
    *uint64_t v4 = v22;
    v4[1] = v8;
    v4[2] = v21;
    v4[3] = v10;
    v4[4] = v20;
    v4[5] = v24;
    v4[6] = v19;
    v4[7] = v23;
    v4[8] = v25;
    v4[9] = v26;
    v4[10] = v25;
    v4[11] = v26;
    v4[12] = v18;
    v4[13] = v17;
  }
  sub_13514();
}

BOOL sub_C2E0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_C2F0(uint64_t a1, char a2)
{
}

uint64_t sub_C318(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7263736544707061 && a2 == 0xEE006E6F69747069;
  if (v2 || (sub_14450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74706D6F7270 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_14450();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_C424()
{
  return 2;
}

uint64_t sub_C42C()
{
  return 0;
}

uint64_t sub_C438(char a1)
{
  if (a1) {
    return 0x74706D6F7270;
  }
  else {
    return 0x7263736544707061;
  }
}

void sub_C478()
{
  sub_134FC();
  uint64_t v3 = v2;
  uint64_t v4 = sub_31FC(&qword_1C9B0);
  sub_A464();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_1352C();
  sub_EE24(v3, v3[3]);
  sub_122F0();
  sub_144A0();
  sub_31FC(&qword_1C940);
  sub_12508(&qword_1C9B8, (void (*)(void))sub_12578);
  sub_14440();
  if (!v0) {
    sub_13A04();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  sub_13514();
}

uint64_t sub_C5E8(void *a1)
{
  sub_31FC(&qword_1C930);
  sub_A464();
  __chkstk_darwin(v3);
  sub_1352C();
  uint64_t v4 = a1[3];
  sub_EE24(a1, v4);
  sub_122F0();
  sub_14490();
  if (v1)
  {
    sub_9FA4((uint64_t)a1);
  }
  else
  {
    sub_31FC(&qword_1C940);
    sub_12508(&qword_1C948, (void (*)(void))sub_1233C);
    sub_14400();
    uint64_t v4 = v7;
    swift_bridgeObjectRetain();
    sub_143F0();
    sub_1362C();
    v6();
    swift_bridgeObjectRetain();
    sub_9FA4((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

BOOL sub_C7F8(char a1, char a2)
{
  return a1 == a2;
}

void sub_C808(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t sub_C830(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x427972616D697270 && a2 == 0xEF49446E6F747475;
  if (v2 || (sub_14450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000000015DA0 || (sub_14450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000000015DC0 || (sub_14450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000000015DE0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_14450();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_C9F8()
{
  return 4;
}

unint64_t sub_CA00(char a1)
{
  unint64_t result = 0x427972616D697270;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_CAAC()
{
  sub_13994();
  sub_31FC(&qword_1C9A0);
  sub_A464();
  __chkstk_darwin(v1);
  sub_13694();
  sub_12258();
  sub_13674();
  sub_124BC();
  sub_13790();
  if (!v0)
  {
    sub_13970(1);
    sub_13790();
    sub_13970(3);
  }
  sub_1362C();
  return v2();
}

void sub_CC00()
{
  sub_134FC();
  BOOL v2 = v1;
  uint64_t v4 = v3;
  sub_31FC(&qword_1C918);
  sub_A464();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_A9B8();
  sub_EE24(v2, v2[3]);
  sub_12258();
  sub_14490();
  if (v0)
  {
    sub_9FA4((uint64_t)v2);
  }
  else
  {
    sub_122A4();
    sub_13904();
    sub_14400();
    uint64_t v21 = v4;
    uint64_t v8 = v22;
    LOBYTE(v22) = 1;
    sub_225C(v8, v23);
    uint64_t v19 = sub_13A50();
    uint64_t v10 = v9;
    swift_bridgeObjectRetain();
    sub_13904();
    sub_14400();
    sub_225C(v22, v23);
    uint64_t v11 = sub_13A50();
    uint64_t v13 = v12;
    uint64_t v14 = v6 + 8;
    uint64_t v20 = v11;
    uint64_t v15 = sub_136E4();
    v16(v15);
    uint64_t v17 = sub_13AF0();
    sub_225C(v17, v18);
    swift_bridgeObjectRetain();
    sub_225C(v14, v23);
    swift_bridgeObjectRetain();
    sub_2348(v14, v23);
    swift_bridgeObjectRelease();
    sub_13AD8();
    sub_9FA4((uint64_t)v2);
    sub_13AD8();
    swift_bridgeObjectRelease();
    sub_2348(v14, v23);
    swift_bridgeObjectRelease();
    *uint64_t v21 = v8;
    v21[1] = v22;
    v21[2] = v19;
    v21[3] = v10;
    v21[4] = v14;
    v21[5] = v23;
    v21[6] = v20;
    v21[7] = v13;
  }
  sub_13514();
}

uint64_t sub_CEEC()
{
  return 1;
}

void sub_CEF4()
{
}

uint64_t sub_CF1C()
{
  return 12383;
}

uint64_t sub_CF28(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000001ALL && a2 == 0x8000000000015D20 || (sub_14450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000000015D40 || (sub_14450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000000015D60 || (sub_14450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000000015D80)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_14450();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

Swift::Int sub_D0C4(unsigned __int8 a1)
{
  return sub_14480();
}

unint64_t sub_D10C(char a1)
{
  unint64_t result = 0xD00000000000001ALL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000017;
      break;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_D1A4(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_14450();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

Swift::Int sub_D214()
{
  return sub_14480();
}

void sub_D258()
{
  sub_134FC();
  char v3 = v2;
  sub_31FC(&qword_1C640);
  sub_A464();
  __chkstk_darwin(v4);
  sub_A5DC();
  sub_31FC(&qword_1C648);
  sub_A464();
  __chkstk_darwin(v5);
  sub_13638(v6, v28);
  sub_31FC(&qword_1C650);
  sub_A464();
  __chkstk_darwin(v7);
  sub_138CC(v8, v29);
  type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(0);
  sub_A454();
  __chkstk_darwin(v9);
  sub_138B0(v10, v30);
  sub_31FC(&qword_1C658);
  sub_A464();
  __chkstk_darwin(v11);
  sub_A9B8();
  type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(0);
  sub_A454();
  __chkstk_darwin(v12);
  sub_A9A0();
  type metadata accessor for SiriPaymentsSnippetModel(0);
  sub_A454();
  __chkstk_darwin(v13);
  sub_13948();
  sub_31FC(&qword_1C660);
  sub_A464();
  __chkstk_darwin(v14);
  uint64_t v15 = v3[4];
  sub_EE24(v3, v3[3]);
  sub_F484();
  sub_144A0();
  sub_12420();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v0 = v31;
      sub_F874();
      sub_F704();
      sub_13A90();
      sub_F39C(&qword_1C678, (void (*)(uint64_t))type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel);
      sub_14440();
      sub_A6C0();
      v25();
      uint64_t v17 = type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel;
      goto LABEL_6;
    case 2u:
      sub_F66C();
      sub_14420();
      sub_F828();
      sub_14440();
      sub_A6C0();
      v18();
      sub_13960();
      sub_A6C0();
      v19();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 3u:
      uint64_t v20 = *v1;
      uint64_t v21 = v1[4];
      unint64_t v22 = v1[5];
      unint64_t v32 = v1[1];
      sub_F5D4();
      sub_14420();
      sub_F7DC();
      sub_14440();
      sub_A6C0();
      v23();
      sub_13960();
      sub_A6C0();
      v24();
      sub_2348(v20, v32);
      swift_bridgeObjectRelease();
      sub_2348(v21, v22);
      swift_bridgeObjectRelease();
      break;
    default:
      sub_F874();
      sub_F770();
      sub_13A90();
      sub_F39C(&qword_1C680, (void (*)(uint64_t))type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel);
      sub_14440();
      sub_A6C0();
      v16();
      uint64_t v17 = type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel;
LABEL_6:
      sub_F8C8(v0, (void (*)(void))v17);
      uint64_t v26 = sub_13960();
      v27(v26, v15);
      break;
  }
  sub_13514();
}

void sub_D8A0()
{
  sub_134FC();
  char v3 = v2;
  uint64_t v79 = v4;
  sub_31FC(&qword_1C5C8);
  sub_A464();
  uint64_t v77 = v6;
  uint64_t v78 = v5;
  __chkstk_darwin(v5);
  sub_A5DC();
  uint64_t v76 = v7;
  uint64_t v71 = sub_31FC(&qword_1C5D0);
  sub_A464();
  uint64_t v74 = v8;
  __chkstk_darwin(v9);
  sub_138CC(v10, (uint64_t)v65);
  uint64_t v73 = sub_31FC(&qword_1C5D8);
  sub_A464();
  uint64_t v72 = v11;
  __chkstk_darwin(v12);
  sub_A5DC();
  uint64_t v75 = v13;
  uint64_t v82 = sub_31FC(&qword_1C5E0);
  sub_A464();
  uint64_t v70 = v14;
  __chkstk_darwin(v15);
  sub_138B0(v16, (uint64_t)v65);
  sub_31FC(&qword_1C5E8);
  sub_A464();
  uint64_t v80 = v18;
  uint64_t v81 = v17;
  __chkstk_darwin(v17);
  sub_13948();
  uint64_t v83 = type metadata accessor for SiriPaymentsSnippetModel(0);
  sub_A454();
  uint64_t v20 = __chkstk_darwin(v19);
  unint64_t v22 = (char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v20);
  uint64_t v25 = (char *)&v65 - v24;
  uint64_t v26 = __chkstk_darwin(v23);
  uint64_t v28 = (char *)&v65 - v27;
  uint64_t v29 = __chkstk_darwin(v26);
  uint64_t v31 = (char *)&v65 - v30;
  __chkstk_darwin(v29);
  uint64_t v33 = (char *)&v65 - v32;
  uint64_t v34 = v3[3];
  uint64_t v84 = v3;
  sub_EE24(v3, v34);
  sub_F484();
  sub_14490();
  if (v0) {
    goto LABEL_10;
  }
  uint64_t v67 = v31;
  uint64_t v65 = v25;
  uint64_t v68 = v28;
  uint64_t v66 = v22;
  uint64_t v69 = v33;
  uint64_t v35 = v83;
  uint64_t v36 = v81;
  uint64_t v37 = sub_14410();
  uint64_t v38 = *(void *)(v37 + 16);
  if (!v38
    || (uint64_t v39 = *(unsigned __int8 *)(v37 + 32),
        sub_F558(1, v38, v37, v37 + 32, 0, (2 * v38) | 1),
        uint64_t v41 = v40,
        unint64_t v43 = v42,
        swift_bridgeObjectRelease(),
        v41 != v43 >> 1))
  {
    uint64_t v44 = sub_143A0();
    swift_allocError();
    uint64_t v46 = v45;
    sub_31FC(&qword_1C5F8);
    *uint64_t v46 = v35;
    sub_143E0();
    sub_14390();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v44 - 8) + 104))(v46, enum case for DecodingError.typeMismatch(_:), v44);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v1, v36);
LABEL_10:
    sub_9FA4((uint64_t)v84);
    goto LABEL_11;
  }
  switch(v39)
  {
    case 1:
      LOBYTE(v85) = 1;
      sub_F704();
      sub_13654((uint64_t)&type metadata for SiriPaymentsSnippetModel.SendPaymentConfirmationCodingKeys, (uint64_t)&v85);
      type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(0);
      sub_F39C(&qword_1C628, (void (*)(uint64_t))type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel);
      sub_14400();
      sub_A6C0();
      v49();
      swift_unknownObjectRelease();
      sub_A6C0();
      v50();
      goto LABEL_12;
    case 2:
      LOBYTE(v85) = 2;
      sub_F66C();
      sub_13654((uint64_t)&type metadata for SiriPaymentsSnippetModel.AppDisambiguationCodingKeys, (uint64_t)&v85);
      sub_F6B8();
      sub_14400();
      sub_A6C0();
      v51();
      swift_unknownObjectRelease();
      uint64_t v52 = sub_136F8();
      v53(v52);
      uint64_t v54 = v86;
      uint64_t v55 = v65;
      *uint64_t v65 = v85;
      *((void *)v55 + 2) = v54;
      swift_storeEnumTagMultiPayload();
      goto LABEL_13;
    case 3:
      LOBYTE(v85) = 3;
      sub_F5D4();
      sub_13654((uint64_t)&type metadata for SiriPaymentsSnippetModel.BinaryConfirmationCodingKeys, (uint64_t)&v85);
      sub_F620();
      sub_14400();
      uint64_t v56 = sub_13AB0();
      v57(v56);
      swift_unknownObjectRelease();
      uint64_t v58 = sub_136F8();
      v59(v58);
      uint64_t v60 = v86;
      uint64_t v61 = v87;
      uint64_t v62 = v89;
      uint64_t v63 = v90;
      uint64_t v64 = v66;
      *uint64_t v66 = v85;
      *((void *)v64 + 2) = v60;
      *((void *)v64 + 3) = v61;
      v64[2] = v88;
      *((void *)v64 + 6) = v62;
      *((void *)v64 + 7) = v63;
      swift_storeEnumTagMultiPayload();
      sub_F874();
      goto LABEL_14;
    default:
      LOBYTE(v85) = 0;
      sub_F770();
      sub_13654((uint64_t)&type metadata for SiriPaymentsSnippetModel.RequestPaymentConfirmationCodingKeys, (uint64_t)&v85);
      type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(0);
      sub_F39C(&qword_1C638, (void (*)(uint64_t))type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel);
      sub_14400();
      sub_A6C0();
      v47();
      swift_unknownObjectRelease();
      sub_A6C0();
      v48();
LABEL_12:
      swift_storeEnumTagMultiPayload();
LABEL_13:
      sub_F874();
LABEL_14:
      sub_F874();
      sub_9FA4((uint64_t)v84);
      break;
  }
LABEL_11:
  sub_13514();
}

void sub_E1B0()
{
}

void sub_E1C8()
{
}

uint64_t sub_E1E0()
{
  return sub_B318(*v0);
}

uint64_t sub_E1E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_B1D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_E210@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_B310();
  *a1 = result;
  return result;
}

uint64_t sub_E238(uint64_t a1)
{
  unint64_t v2 = sub_12388();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_E274(uint64_t a1)
{
  unint64_t v2 = sub_12388();

  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_E2B0()
{
}

void sub_E2C8()
{
}

uint64_t sub_E2E0()
{
  return sub_BB00(*v0);
}

uint64_t sub_E2E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_B7F0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_E310@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_BAF8();
  *a1 = result;
  return result;
}

uint64_t sub_E338(uint64_t a1)
{
  unint64_t v2 = sub_131D0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_E374(uint64_t a1)
{
  unint64_t v2 = sub_131D0();

  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_E3B0(void *a1@<X8>)
{
  sub_BD8C();
  if (!v1) {
    memcpy(a1, v3, 0x70uLL);
  }
}

uint64_t sub_E3FC()
{
  return sub_BC00();
}

BOOL sub_E414(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_C2E0(*a1, *a2);
}

Swift::Int sub_E420()
{
  return sub_EBB0(*v0);
}

void sub_E43C(uint64_t a1)
{
  sub_C2F0(a1, *v1);
}

uint64_t sub_E444()
{
  return sub_C438(*v0);
}

uint64_t sub_E44C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_C318(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_E474()
{
  return sub_C42C();
}

uint64_t sub_E494@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_C424();
  *a1 = result;
  return result;
}

uint64_t sub_E4BC(uint64_t a1)
{
  unint64_t v2 = sub_122F0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_E4F8(uint64_t a1)
{
  unint64_t v2 = sub_122F0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_E534@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_C5E8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

void sub_E564()
{
}

BOOL sub_E584(char *a1, char *a2)
{
  return sub_C7F8(*a1, *a2);
}

Swift::Int sub_E590()
{
  return sub_D0C4(*v0);
}

void sub_E5AC(uint64_t a1)
{
  sub_C808(a1, *v1);
}

unint64_t sub_E5B4()
{
  return sub_CA00(*v0);
}

uint64_t sub_E5BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_C830(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_E5E4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_C9F8();
  *a1 = result;
  return result;
}

uint64_t sub_E60C(uint64_t a1)
{
  unint64_t v2 = sub_12258();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_E648(uint64_t a1)
{
  unint64_t v2 = sub_12258();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_E684@<D0>(_OWORD *a1@<X8>)
{
  sub_CC00();
  if (!v1)
  {
    *a1 = v4;
    a1[1] = v5;
    double result = *(double *)&v6;
    a1[2] = v6;
    a1[3] = v7;
  }
  return result;
}

uint64_t sub_E6C8()
{
  return sub_CAAC();
}

Swift::Int sub_E6E4()
{
  return sub_D214();
}

uint64_t sub_E708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_D1A4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_E734()
{
  return sub_C42C();
}

uint64_t sub_E750@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_CEEC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_E77C(uint64_t a1)
{
  unint64_t v2 = sub_F66C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_E7B8(uint64_t a1)
{
  unint64_t v2 = sub_F66C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_E7F4(uint64_t a1)
{
  unint64_t v2 = sub_F5D4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_E830(uint64_t a1)
{
  unint64_t v2 = sub_F5D4();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_E86C()
{
  Swift::UInt v1 = *v0;
  sub_14460();
  sub_14470(v1);
  return sub_14480();
}

unint64_t sub_E8B0()
{
  return sub_D10C(*v0);
}

uint64_t sub_E8B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_CF28(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_E8E0(uint64_t a1)
{
  unint64_t v2 = sub_F484();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_E91C(uint64_t a1)
{
  unint64_t v2 = sub_F484();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_E958(uint64_t a1)
{
  unint64_t v2 = sub_F770();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_E994(uint64_t a1)
{
  unint64_t v2 = sub_F770();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_E9D0()
{
  return sub_14480();
}

uint64_t sub_EA10(uint64_t a1)
{
  unint64_t v2 = sub_F704();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_EA4C(uint64_t a1)
{
  unint64_t v2 = sub_F704();

  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_EA88()
{
  return 0xD000000000000014;
}

uint64_t sub_EAA8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656D614E707061 && a2 == 0xE700000000000000;
  if (v2 || (sub_14450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C646E7542707061 && a2 == 0xEB00000000644965)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_14450();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

Swift::Int sub_EBB0(char a1)
{
  return sub_14480();
}

uint64_t sub_EBF8(char a1)
{
  if (a1) {
    return 0x6C646E7542707061;
  }
  else {
    return 0x656D614E707061;
  }
}

void sub_EC38()
{
}

void sub_EC50()
{
}

uint64_t sub_EC68()
{
  return sub_EBF8(*v0);
}

uint64_t sub_EC70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_EAA8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_EC98(uint64_t a1)
{
  unint64_t v2 = sub_EE68();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_ECD4(uint64_t a1)
{
  unint64_t v2 = sub_EE68();

  return CodingKey.debugDescription.getter(a1, v2);
}

void AppDescription.encode(to:)()
{
  sub_134FC();
  char v3 = v2;
  uint64_t v4 = sub_31FC(&qword_1C588);
  sub_A464();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_1352C();
  sub_EE24(v3, v3[3]);
  sub_EE68();
  sub_144A0();
  sub_13A04();
  if (!v0) {
    sub_13A04();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  sub_13514();
}

void *sub_EE24(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_EE68()
{
  unint64_t result = qword_1C590;
  if (!qword_1C590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C590);
  }
  return result;
}

void AppDescription.init(from:)()
{
  sub_134FC();
  unint64_t v2 = v1;
  sub_31FC(&qword_1C598);
  sub_A464();
  __chkstk_darwin(v3);
  sub_A9A0();
  sub_EE24(v2, v2[3]);
  sub_EE68();
  sub_14490();
  if (v0)
  {
    sub_9FA4((uint64_t)v2);
  }
  else
  {
    sub_143F0();
    swift_bridgeObjectRetain();
    sub_143F0();
    uint64_t v4 = sub_13A38();
    v5(v4);
    swift_bridgeObjectRetain();
    sub_9FA4((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_13514();
}

void sub_F054(void *a1@<X8>)
{
  AppDescription.init(from:)();
  if (!v1)
  {
    *a1 = v3;
    a1[1] = v4;
    a1[2] = v5;
    a1[3] = v6;
  }
}

void sub_F084()
{
}

uint64_t destroy for AppDescription()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AppDescription(void *a1, void *a2)
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

void *assignWithCopy for AppDescription(void *a1, void *a2)
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

__n128 initializeWithTake for AppDescription(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for AppDescription(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for AppDescription(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppDescription(uint64_t result, int a2, int a3)
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

void type metadata accessor for AppDescription()
{
}

unsigned char *initializeBufferWithCopyOfBuffer for AppDescription.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for AppDescription.CodingKeys()
{
  return &type metadata for AppDescription.CodingKeys;
}

unint64_t sub_F2A0()
{
  unint64_t result = qword_1C5A0;
  if (!qword_1C5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C5A0);
  }
  return result;
}

uint64_t sub_F2EC()
{
  return sub_F39C(&qword_1C5A8, (void (*)(uint64_t))type metadata accessor for SiriPaymentsSnippetModel);
}

uint64_t type metadata accessor for SiriPaymentsSnippetModel(uint64_t a1)
{
  return sub_2228(a1, qword_1C868);
}

uint64_t sub_F354()
{
  return sub_F39C(&qword_1C5B0, (void (*)(uint64_t))type metadata accessor for SiriPaymentsSnippetModel);
}

uint64_t sub_F39C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_F3E8()
{
  unint64_t result = qword_1C5B8;
  if (!qword_1C5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C5B8);
  }
  return result;
}

unint64_t sub_F438()
{
  unint64_t result = qword_1C5C0;
  if (!qword_1C5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C5C0);
  }
  return result;
}

unint64_t sub_F484()
{
  unint64_t result = qword_1C5F0;
  if (!qword_1C5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C5F0);
  }
  return result;
}

uint64_t sub_F4D0()
{
  return 0;
}

id sub_F4D8(uint64_t a1, void *a2)
{
  Class isa = sub_142D0().super.isa;
  swift_bridgeObjectRelease();
  id v4 = [a2 aceObjectWithDictionary:isa];

  return v4;
}

uint64_t sub_F558(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_F5D4()
{
  unint64_t result = qword_1C600;
  if (!qword_1C600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C600);
  }
  return result;
}

unint64_t sub_F620()
{
  unint64_t result = qword_1C608;
  if (!qword_1C608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C608);
  }
  return result;
}

unint64_t sub_F66C()
{
  unint64_t result = qword_1C610;
  if (!qword_1C610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C610);
  }
  return result;
}

unint64_t sub_F6B8()
{
  unint64_t result = qword_1C618;
  if (!qword_1C618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C618);
  }
  return result;
}

unint64_t sub_F704()
{
  unint64_t result = qword_1C620;
  if (!qword_1C620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C620);
  }
  return result;
}

uint64_t type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(uint64_t a1)
{
  return sub_2228(a1, (uint64_t *)&unk_1C798);
}

unint64_t sub_F770()
{
  unint64_t result = qword_1C630;
  if (!qword_1C630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C630);
  }
  return result;
}

uint64_t type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(uint64_t a1)
{
  return sub_2228(a1, (uint64_t *)&unk_1C6E0);
}

unint64_t sub_F7DC()
{
  unint64_t result = qword_1C668;
  if (!qword_1C668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C668);
  }
  return result;
}

unint64_t sub_F828()
{
  unint64_t result = qword_1C670;
  if (!qword_1C670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C670);
  }
  return result;
}

uint64_t sub_F874()
{
  uint64_t v2 = sub_13B54();
  v3(v2);
  sub_A454();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_F8C8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_A454();
  sub_A6C0();
  v3();
  return a1;
}

uint64_t *sub_F91C(uint64_t *a1, uint64_t *a2)
{
  return sub_FB88(a1, a2);
}

uint64_t sub_F930(uint64_t a1, uint64_t a2)
{
  return sub_FCC8(a1, a2, &qword_1C2B8, &qword_1C2C0);
}

uint64_t sub_F944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_FDB8(a1, a2, a3, &qword_1C2B8);
}

uint64_t sub_F958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_FEA4(a1, a2, a3, &qword_1C2B8);
}

uint64_t sub_F96C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10024(a1, a2, a3, &qword_1C2B8, &qword_1C2C0);
}

uint64_t sub_F980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100F8(a1, a2, a3, &qword_1C2B8);
}

uint64_t sub_F994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_F9A8);
}

uint64_t sub_F9A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10224(a1, a2, a3, &qword_1C2B8, &qword_1C2C0);
}

uint64_t sub_F9BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_F9D0);
}

void sub_F9D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
}

void sub_F9E4()
{
  sub_FB0C(319, &qword_1C6F0, &qword_1C6F8, (uint64_t)INRequestPaymentIntent_ptr, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for CodableIntent);
  if (v0 <= 0x3F)
  {
    sub_FB0C(319, &qword_1C700, (unint64_t *)&unk_1C708, (uint64_t)INRequestPaymentIntentResponse_ptr, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for CodableIntentResponse);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_FB0C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_8F90(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t *sub_FB74(uint64_t *a1, uint64_t *a2)
{
  return sub_FB88(a1, a2);
}

uint64_t *sub_FB88(uint64_t *a1, uint64_t *a2)
{
  sub_A480();
  int v8 = *(_DWORD *)(v7 + 80);
  if ((v8 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v8 + 16) & ~(unint64_t)v8));
    swift_retain();
  }
  else
  {
    unint64_t v9 = v6;
    uint64_t v10 = v4;
    sub_31FC(v5);
    sub_A454();
    sub_A72C();
    v11();
    uint64_t v12 = *(int *)(v10 + 20);
    uint64_t v13 = (uint64_t)a1 + v12;
    unint64_t v14 = (unint64_t)a2 + v12;
    sub_31FC(v9);
    sub_A454();
    sub_A72C();
    v15();
    uint64_t v16 = *(int *)(v10 + 24);
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (char *)a2 + v16;
    sub_13738();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_225C(v13, v14);
    sub_13A70();
    v17[10] = a2;
    v17[11] = v10;
    uint64_t v19 = *((void *)v18 + 13);
    v17[12] = *((void *)v18 + 12);
    v17[13] = v19;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_FCB4(uint64_t a1, uint64_t a2)
{
  return sub_FCC8(a1, a2, &qword_1C1E8, &qword_1C1F0);
}

uint64_t sub_FCC8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  sub_31FC(a3);
  sub_A454();
  sub_A6C0();
  v7();
  sub_31FC(a4);
  sub_A454();
  sub_A6C0();
  v8();
  uint64_t v9 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2348(*(void *)(v9 + 64), *(void *)(v9 + 72));
  sub_2348(*(void *)(v9 + 80), *(void *)(v9 + 88));

  return swift_bridgeObjectRelease();
}

uint64_t sub_FDA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_FDB8(a1, a2, a3, &qword_1C1E8);
}

uint64_t sub_FDB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_1376C(a1, a2, a3, a4);
  sub_A454();
  sub_A72C();
  v10();
  sub_13808();
  sub_A454();
  sub_A72C();
  v11();
  uint64_t v12 = *(int *)(v6 + 24);
  uint64_t v13 = (void *)(v4 + v12);
  uint64_t v14 = v7 + v12;
  sub_13738();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_225C(v8, v9);
  sub_13A70();
  v13[10] = v5;
  v13[11] = v6;
  uint64_t v15 = *(void *)(v14 + 104);
  v13[12] = *(void *)(v14 + 96);
  v13[13] = v15;
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t sub_FE90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_FEA4(a1, a2, a3, &qword_1C1E8);
}

uint64_t sub_FEA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_1376C(a1, a2, a3, a4);
  sub_A454();
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v4, v6);
  sub_13808();
  sub_A454();
  uint64_t v8 = sub_13920();
  v9(v8);
  uint64_t v10 = *(int *)(v5 + 24);
  uint64_t v11 = (void *)(v4 + v10);
  uint64_t v12 = (void *)(v6 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[2] = v12[2];
  v11[3] = v12[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[4] = v12[4];
  v11[5] = v12[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[6] = v12[6];
  v11[7] = v12[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = v12[8];
  unint64_t v14 = v12[9];
  sub_225C(v13, v14);
  uint64_t v15 = v11[8];
  unint64_t v16 = v11[9];
  v11[8] = v13;
  v11[9] = v14;
  sub_2348(v15, v16);
  uint64_t v17 = v12[10];
  unint64_t v18 = v12[11];
  sub_225C(v17, v18);
  uint64_t v19 = v11[10];
  unint64_t v20 = v11[11];
  v11[10] = v17;
  v11[11] = v18;
  sub_2348(v19, v20);
  v11[12] = v12[12];
  v11[13] = v12[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10024(a1, a2, a3, &qword_1C1E8, &qword_1C1F0);
}

uint64_t sub_10024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  sub_31FC(a4);
  sub_A454();
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(a1, a2);
  sub_31FC(a5);
  sub_A454();
  uint64_t v10 = sub_13920();
  v11(v10);
  memcpy((void *)(a1 + *(int *)(a3 + 24)), (const void *)(a2 + *(int *)(a3 + 24)), 0x70uLL);
  return a1;
}

uint64_t sub_100E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100F8(a1, a2, a3, &qword_1C1E8);
}

uint64_t sub_100F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_1376C(a1, a2, a3, a4);
  sub_A454();
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v4, v6);
  sub_13808();
  sub_A454();
  uint64_t v8 = sub_13920();
  v9(v8);
  uint64_t v10 = *(int *)(v5 + 24);
  uint64_t v11 = (void *)(v4 + v10);
  uint64_t v12 = v6 + v10;
  uint64_t v13 = *(void *)(v6 + v10 + 8);
  *uint64_t v11 = *(void *)(v6 + v10);
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v12 + 24);
  v11[2] = *(void *)(v12 + 16);
  v11[3] = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(v12 + 40);
  v11[4] = *(void *)(v12 + 32);
  v11[5] = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(v12 + 56);
  v11[6] = *(void *)(v12 + 48);
  v11[7] = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = v11[8];
  unint64_t v18 = v11[9];
  *((_OWORD *)v11 + 4) = *(_OWORD *)(v12 + 64);
  sub_2348(v17, v18);
  uint64_t v19 = v11[10];
  unint64_t v20 = v11[11];
  *((_OWORD *)v11 + 5) = *(_OWORD *)(v12 + 80);
  sub_2348(v19, v20);
  uint64_t v21 = *(void *)(v12 + 104);
  v11[12] = *(void *)(v12 + 96);
  v11[13] = v21;
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_101FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10210);
}

uint64_t sub_10210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10224(a1, a2, a3, &qword_1C1E8, &qword_1C1F0);
}

uint64_t sub_10224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  sub_31FC(a4);
  sub_A480();
  if (*(_DWORD *)(v10 + 84) == a2)
  {
    uint64_t v11 = v9;
    uint64_t v12 = a1;
LABEL_5:
    return sub_3744(v12, a2, v11);
  }
  sub_31FC(a5);
  sub_A480();
  if (*(_DWORD *)(v14 + 84) == a2)
  {
    uint64_t v11 = v13;
    uint64_t v12 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v16 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  return (v16 + 1);
}

uint64_t sub_102E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_102FC);
}

void sub_102FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
}

void sub_10310(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  sub_31FC(a5);
  sub_A480();
  if (*(_DWORD *)(v12 + 84) == a3)
  {
    uint64_t v13 = v11;
    uint64_t v14 = a1;
  }
  else
  {
    sub_31FC(a6);
    sub_A480();
    if (*(_DWORD *)(v16 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
      return;
    }
    uint64_t v13 = v15;
    uint64_t v14 = a1 + *(int *)(a4 + 20);
  }

  sub_3798(v14, a2, a2, v13);
}

void sub_103DC()
{
  sub_FB0C(319, &qword_1C7A8, &qword_1C7B0, (uint64_t)INSendPaymentIntent_ptr, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for CodableIntent);
  if (v0 <= 0x3F)
  {
    sub_FB0C(319, &qword_1C7B8, (unint64_t *)&unk_1C7C0, (uint64_t)INSendPaymentIntentResponse_ptr, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for CodableIntentResponse);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_10508()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_10544(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_10584(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 sub_105EC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *sub_10600(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10648(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
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

uint64_t sub_10688(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SiriPaymentsSnippetModel.AppDisambiguationModel()
{
}

uint64_t sub_106D4(uint64_t a1)
{
  sub_2348(*(void *)a1, *(void *)(a1 + 8));
  swift_bridgeObjectRelease();
  sub_2348(*(void *)(a1 + 32), *(void *)(a1 + 40));

  return swift_bridgeObjectRelease();
}

uint64_t *sub_10724(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_225C(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[4];
  unint64_t v8 = a2[5];
  swift_bridgeObjectRetain();
  sub_225C(v7, v8);
  a1[4] = v7;
  a1[5] = v8;
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *sub_10794(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_225C(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_2348(v6, v7);
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[4];
  unint64_t v9 = a2[5];
  sub_225C(v8, v9);
  uint64_t v10 = a1[4];
  unint64_t v11 = a1[5];
  a1[4] = v8;
  a1[5] = v9;
  sub_2348(v10, v11);
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 sub_1083C(uint64_t a1, uint64_t a2)
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

uint64_t *sub_10850(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_2348(v4, v5);
  uint64_t v6 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a1[4];
  unint64_t v8 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_2348(v7, v8);
  uint64_t v9 = *(void *)(a2 + 56);
  a1[6] = *(void *)(a2 + 48);
  a1[7] = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_108BC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
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

uint64_t sub_108FC(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SiriPaymentsSnippetModel.BinaryConfirmationModel()
{
}

ValueMetadata *type metadata accessor for SiriPaymentsSnippetModel.CodingKeys()
{
  return &type metadata for SiriPaymentsSnippetModel.CodingKeys;
}

uint64_t sub_1097C()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationCodingKeys()
{
  return &type metadata for SiriPaymentsSnippetModel.RequestPaymentConfirmationCodingKeys;
}

ValueMetadata *type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationCodingKeys()
{
  return &type metadata for SiriPaymentsSnippetModel.SendPaymentConfirmationCodingKeys;
}

ValueMetadata *type metadata accessor for SiriPaymentsSnippetModel.AppDisambiguationCodingKeys()
{
  return &type metadata for SiriPaymentsSnippetModel.AppDisambiguationCodingKeys;
}

uint64_t _s20SiriPaymentsUIPlugin24SiriPaymentsSnippetModelO36RequestPaymentConfirmationCodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s20SiriPaymentsUIPlugin24SiriPaymentsSnippetModelO36RequestPaymentConfirmationCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10AA0);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriPaymentsSnippetModel.BinaryConfirmationCodingKeys()
{
  return &type metadata for SiriPaymentsSnippetModel.BinaryConfirmationCodingKeys;
}

uint64_t *sub_10AD8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v33 = sub_31FC(&qword_1C1E8);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v33 - 8) + 16))(a1, a2, v33);
        uint64_t v34 = type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(0);
        uint64_t v35 = *(int *)(v34 + 20);
        uint64_t v36 = (char *)a1 + v35;
        uint64_t v37 = (char *)a2 + v35;
        uint64_t v38 = sub_31FC(&qword_1C1F0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
        uint64_t v39 = *(int *)(v34 + 24);
        uint64_t v40 = (uint64_t *)((char *)a1 + v39);
        uint64_t v41 = (uint64_t *)((char *)a2 + v39);
        uint64_t v42 = *(uint64_t *)((char *)a2 + v39 + 8);
        *uint64_t v40 = *(uint64_t *)((char *)a2 + v39);
        v40[1] = v42;
        uint64_t v43 = *(uint64_t *)((char *)a2 + v39 + 16);
        uint64_t v44 = v41[3];
        v40[2] = v43;
        v40[3] = v44;
        uint64_t v45 = v41[5];
        v40[4] = v41[4];
        v40[5] = v45;
        uint64_t v46 = v41[7];
        v40[6] = v41[6];
        v40[7] = v46;
        uint64_t v47 = v41[8];
        unint64_t v48 = v41[9];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_225C(v47, v48);
        v40[8] = v47;
        v40[9] = v48;
        uint64_t v49 = v41[10];
        unint64_t v50 = v41[11];
        sub_225C(v49, v50);
        v40[10] = v49;
        v40[11] = v50;
        uint64_t v51 = v41[13];
        v40[12] = v41[12];
        v40[13] = v51;
        swift_bridgeObjectRetain();
        break;
      case 2u:
        uint64_t v26 = a2[1];
        *a1 = *a2;
        a1[1] = v26;
        a1[2] = a2[2];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 3u:
        uint64_t v27 = *a2;
        unint64_t v28 = a2[1];
        sub_225C(*a2, v28);
        *a1 = v27;
        a1[1] = v28;
        uint64_t v29 = a2[3];
        a1[2] = a2[2];
        a1[3] = v29;
        uint64_t v30 = a2[4];
        unint64_t v31 = a2[5];
        swift_bridgeObjectRetain();
        sub_225C(v30, v31);
        a1[4] = v30;
        a1[5] = v31;
        uint64_t v32 = a2[7];
        a1[6] = a2[6];
        a1[7] = v32;
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v6 = sub_31FC(&qword_1C2B8);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        uint64_t v7 = type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(0);
        uint64_t v8 = *(int *)(v7 + 20);
        uint64_t v9 = (char *)a1 + v8;
        uint64_t v10 = (char *)a2 + v8;
        uint64_t v11 = sub_31FC(&qword_1C2C0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
        uint64_t v12 = *(int *)(v7 + 24);
        uint64_t v13 = (uint64_t *)((char *)a1 + v12);
        uint64_t v14 = (uint64_t *)((char *)a2 + v12);
        uint64_t v15 = *(uint64_t *)((char *)a2 + v12 + 8);
        *uint64_t v13 = *(uint64_t *)((char *)a2 + v12);
        v13[1] = v15;
        uint64_t v16 = *(uint64_t *)((char *)a2 + v12 + 16);
        uint64_t v17 = v14[3];
        v13[2] = v16;
        v13[3] = v17;
        uint64_t v18 = v14[5];
        v13[4] = v14[4];
        v13[5] = v18;
        uint64_t v19 = v14[7];
        v13[6] = v14[6];
        v13[7] = v19;
        uint64_t v20 = v14[8];
        unint64_t v21 = v14[9];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_225C(v20, v21);
        v13[8] = v20;
        v13[9] = v21;
        uint64_t v22 = v14[10];
        unint64_t v23 = v14[11];
        sub_225C(v22, v23);
        v13[10] = v22;
        v13[11] = v23;
        uint64_t v24 = v14[13];
        v13[12] = v14[12];
        v13[13] = v24;
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10E78(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = sub_31FC(&qword_1C2B8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
      uint64_t v4 = type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(0);
      uint64_t v5 = a1 + *(int *)(v4 + 20);
      uint64_t v6 = &qword_1C2C0;
      goto LABEL_4;
    case 1:
      uint64_t v7 = sub_31FC(&qword_1C1E8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
      uint64_t v4 = type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(0);
      uint64_t v5 = a1 + *(int *)(v4 + 20);
      uint64_t v6 = &qword_1C1F0;
LABEL_4:
      uint64_t v8 = sub_31FC(v6);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v5, v8);
      uint64_t v9 = a1 + *(int *)(v4 + 24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2348(*(void *)(v9 + 64), *(void *)(v9 + 72));
      sub_2348(*(void *)(v9 + 80), *(void *)(v9 + 88));
      goto LABEL_7;
    case 2:
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 3:
      sub_2348(*(void *)a1, *(void *)(a1 + 8));
      swift_bridgeObjectRelease();
      sub_2348(*(void *)(a1 + 32), *(void *)(a1 + 40));
LABEL_7:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t *sub_11054(uint64_t *a1, uint64_t *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v30 = sub_31FC(&qword_1C1E8);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v30 - 8) + 16))(a1, a2, v30);
      uint64_t v31 = type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(0);
      uint64_t v32 = *(int *)(v31 + 20);
      uint64_t v33 = (char *)a1 + v32;
      uint64_t v34 = (char *)a2 + v32;
      uint64_t v35 = sub_31FC(&qword_1C1F0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
      uint64_t v36 = *(int *)(v31 + 24);
      uint64_t v37 = (uint64_t *)((char *)a1 + v36);
      uint64_t v38 = (uint64_t *)((char *)a2 + v36);
      uint64_t v39 = *(uint64_t *)((char *)a2 + v36 + 8);
      *uint64_t v37 = *(uint64_t *)((char *)a2 + v36);
      v37[1] = v39;
      uint64_t v40 = *(uint64_t *)((char *)a2 + v36 + 16);
      uint64_t v41 = v38[3];
      v37[2] = v40;
      v37[3] = v41;
      uint64_t v42 = v38[5];
      v37[4] = v38[4];
      v37[5] = v42;
      uint64_t v43 = v38[7];
      v37[6] = v38[6];
      v37[7] = v43;
      uint64_t v44 = v38[8];
      unint64_t v45 = v38[9];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_225C(v44, v45);
      v37[8] = v44;
      v37[9] = v45;
      uint64_t v46 = v38[10];
      unint64_t v47 = v38[11];
      sub_225C(v46, v47);
      v37[10] = v46;
      v37[11] = v47;
      uint64_t v48 = v38[13];
      v37[12] = v38[12];
      v37[13] = v48;
      swift_bridgeObjectRetain();
      break;
    case 2u:
      uint64_t v23 = a2[1];
      *a1 = *a2;
      a1[1] = v23;
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 3u:
      uint64_t v24 = *a2;
      unint64_t v25 = a2[1];
      sub_225C(*a2, v25);
      *a1 = v24;
      a1[1] = v25;
      uint64_t v26 = a2[3];
      a1[2] = a2[2];
      a1[3] = v26;
      uint64_t v27 = a2[4];
      unint64_t v28 = a2[5];
      swift_bridgeObjectRetain();
      sub_225C(v27, v28);
      a1[4] = v27;
      a1[5] = v28;
      uint64_t v29 = a2[7];
      a1[6] = a2[6];
      a1[7] = v29;
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v4 = sub_31FC(&qword_1C2B8);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(0);
      uint64_t v6 = *(int *)(v5 + 20);
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = sub_31FC(&qword_1C2C0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      uint64_t v10 = *(int *)(v5 + 24);
      uint64_t v11 = (uint64_t *)((char *)a1 + v10);
      uint64_t v12 = (uint64_t *)((char *)a2 + v10);
      uint64_t v13 = *(uint64_t *)((char *)a2 + v10 + 8);
      *uint64_t v11 = *(uint64_t *)((char *)a2 + v10);
      v11[1] = v13;
      uint64_t v14 = *(uint64_t *)((char *)a2 + v10 + 16);
      uint64_t v15 = v12[3];
      v11[2] = v14;
      v11[3] = v15;
      uint64_t v16 = v12[5];
      v11[4] = v12[4];
      v11[5] = v16;
      uint64_t v17 = v12[7];
      v11[6] = v12[6];
      v11[7] = v17;
      uint64_t v18 = v12[8];
      unint64_t v19 = v12[9];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_225C(v18, v19);
      v11[8] = v18;
      v11[9] = v19;
      uint64_t v20 = v12[10];
      unint64_t v21 = v12[11];
      sub_225C(v20, v21);
      v11[10] = v20;
      v11[11] = v21;
      uint64_t v22 = v12[13];
      v11[12] = v12[12];
      v11[13] = v22;
      swift_bridgeObjectRetain();
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *sub_113A4(uint64_t *a1, uint64_t *a2)
{
  if (a1 != a2)
  {
    sub_F8C8((uint64_t)a1, (void (*)(void))type metadata accessor for SiriPaymentsSnippetModel);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v17 = sub_31FC(&qword_1C1E8);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
        uint64_t v18 = type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(0);
        uint64_t v19 = *(int *)(v18 + 20);
        uint64_t v20 = (char *)a1 + v19;
        unint64_t v21 = (char *)a2 + v19;
        uint64_t v22 = sub_31FC(&qword_1C1F0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
        uint64_t v23 = *(int *)(v18 + 24);
        uint64_t v24 = (uint64_t *)((char *)a1 + v23);
        unint64_t v25 = (uint64_t *)((char *)a2 + v23);
        *uint64_t v24 = *(uint64_t *)((char *)a2 + v23);
        v24[1] = *(uint64_t *)((char *)a2 + v23 + 8);
        v24[2] = *(uint64_t *)((char *)a2 + v23 + 16);
        v24[3] = *(uint64_t *)((char *)a2 + v23 + 24);
        v24[4] = *(uint64_t *)((char *)a2 + v23 + 32);
        uint64_t v24[5] = *(uint64_t *)((char *)a2 + v23 + 40);
        v24[6] = *(uint64_t *)((char *)a2 + v23 + 48);
        v24[7] = *(uint64_t *)((char *)a2 + v23 + 56);
        uint64_t v26 = *(uint64_t *)((char *)a2 + v23 + 64);
        unint64_t v27 = *(uint64_t *)((char *)a2 + v23 + 72);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_225C(v26, v27);
        v24[8] = v26;
        v24[9] = v27;
        uint64_t v28 = v25[10];
        unint64_t v29 = v25[11];
        sub_225C(v28, v29);
        v24[10] = v28;
        v24[11] = v29;
        v24[12] = v25[12];
        v24[13] = v25[13];
        swift_bridgeObjectRetain();
        break;
      case 2u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 3u:
        uint64_t v30 = *a2;
        unint64_t v31 = a2[1];
        sub_225C(*a2, v31);
        *a1 = v30;
        a1[1] = v31;
        a1[2] = a2[2];
        a1[3] = a2[3];
        uint64_t v32 = a2[4];
        unint64_t v33 = a2[5];
        swift_bridgeObjectRetain();
        sub_225C(v32, v33);
        a1[4] = v32;
        a1[5] = v33;
        a1[6] = a2[6];
        a1[7] = a2[7];
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v4 = sub_31FC(&qword_1C2B8);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        uint64_t v5 = type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(0);
        uint64_t v6 = *(int *)(v5 + 20);
        uint64_t v7 = (char *)a1 + v6;
        uint64_t v8 = (char *)a2 + v6;
        uint64_t v9 = sub_31FC(&qword_1C2C0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
        uint64_t v10 = *(int *)(v5 + 24);
        uint64_t v11 = (uint64_t *)((char *)a1 + v10);
        uint64_t v12 = (uint64_t *)((char *)a2 + v10);
        *uint64_t v11 = *(uint64_t *)((char *)a2 + v10);
        v11[1] = *(uint64_t *)((char *)a2 + v10 + 8);
        v11[2] = *(uint64_t *)((char *)a2 + v10 + 16);
        v11[3] = *(uint64_t *)((char *)a2 + v10 + 24);
        v11[4] = *(uint64_t *)((char *)a2 + v10 + 32);
        v11[5] = *(uint64_t *)((char *)a2 + v10 + 40);
        v11[6] = *(uint64_t *)((char *)a2 + v10 + 48);
        v11[7] = *(uint64_t *)((char *)a2 + v10 + 56);
        uint64_t v13 = *(uint64_t *)((char *)a2 + v10 + 64);
        unint64_t v14 = *(uint64_t *)((char *)a2 + v10 + 72);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_225C(v13, v14);
        v11[8] = v13;
        v11[9] = v14;
        uint64_t v15 = v12[10];
        unint64_t v16 = v12[11];
        sub_225C(v15, v16);
        v11[10] = v15;
        v11[11] = v16;
        v11[12] = v12[12];
        v11[13] = v12[13];
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_11780(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v13 = sub_31FC(&qword_1C1E8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, a2, v13);
    uint64_t v14 = type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(0);
    uint64_t v15 = *(int *)(v14 + 20);
    unint64_t v16 = &a1[v15];
    uint64_t v17 = &a2[v15];
    uint64_t v18 = sub_31FC(&qword_1C1F0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
    memcpy(&a1[*(int *)(v14 + 24)], &a2[*(int *)(v14 + 24)], 0x70uLL);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      return a1;
    }
    uint64_t v7 = sub_31FC(&qword_1C2B8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(0);
    uint64_t v9 = *(int *)(v8 + 20);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = sub_31FC(&qword_1C2C0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
    memcpy(&a1[*(int *)(v8 + 24)], &a2[*(int *)(v8 + 24)], 0x70uLL);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_11970(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_F8C8((uint64_t)a1, (void (*)(void))type metadata accessor for SiriPaymentsSnippetModel);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v13 = sub_31FC(&qword_1C1E8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, a2, v13);
      uint64_t v14 = type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(0);
      uint64_t v15 = *(int *)(v14 + 20);
      unint64_t v16 = &a1[v15];
      uint64_t v17 = &a2[v15];
      uint64_t v18 = sub_31FC(&qword_1C1F0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
      memcpy(&a1[*(int *)(v14 + 24)], &a2[*(int *)(v14 + 24)], 0x70uLL);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        return a1;
      }
      uint64_t v7 = sub_31FC(&qword_1C2B8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(0);
      uint64_t v9 = *(int *)(v8 + 20);
      uint64_t v10 = &a1[v9];
      uint64_t v11 = &a2[v9];
      uint64_t v12 = sub_31FC(&qword_1C2C0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
      memcpy(&a1[*(int *)(v8 + 24)], &a2[*(int *)(v8 + 24)], 0x70uLL);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_11B90()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_11BA0()
{
  uint64_t result = type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

unint64_t sub_11C7C()
{
  unint64_t result = qword_1C8A0;
  if (!qword_1C8A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8A0);
  }
  return result;
}

unint64_t sub_11CCC()
{
  unint64_t result = qword_1C8A8;
  if (!qword_1C8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8A8);
  }
  return result;
}

unint64_t sub_11D1C()
{
  unint64_t result = qword_1C8B0;
  if (!qword_1C8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8B0);
  }
  return result;
}

unint64_t sub_11D6C()
{
  unint64_t result = qword_1C8B8;
  if (!qword_1C8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8B8);
  }
  return result;
}

unint64_t sub_11DBC()
{
  unint64_t result = qword_1C8C0;
  if (!qword_1C8C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8C0);
  }
  return result;
}

uint64_t sub_11E18()
{
  return sub_F39C(&qword_1C628, (void (*)(uint64_t))type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel);
}

uint64_t sub_11E60()
{
  return sub_F39C(&qword_1C678, (void (*)(uint64_t))type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel);
}

uint64_t sub_11EA8()
{
  return sub_F39C(&qword_1C638, (void (*)(uint64_t))type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel);
}

uint64_t sub_11EF0()
{
  return sub_F39C(&qword_1C680, (void (*)(uint64_t))type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel);
}

unint64_t sub_11F3C()
{
  unint64_t result = qword_1C8C8;
  if (!qword_1C8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8C8);
  }
  return result;
}

unint64_t sub_11F8C()
{
  unint64_t result = qword_1C8D0;
  if (!qword_1C8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8D0);
  }
  return result;
}

unint64_t sub_11FDC()
{
  unint64_t result = qword_1C8D8;
  if (!qword_1C8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8D8);
  }
  return result;
}

unint64_t sub_1202C()
{
  unint64_t result = qword_1C8E0;
  if (!qword_1C8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8E0);
  }
  return result;
}

unint64_t sub_1207C()
{
  unint64_t result = qword_1C8E8;
  if (!qword_1C8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8E8);
  }
  return result;
}

unint64_t sub_120CC()
{
  unint64_t result = qword_1C8F0;
  if (!qword_1C8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8F0);
  }
  return result;
}

unint64_t sub_1211C()
{
  unint64_t result = qword_1C8F8;
  if (!qword_1C8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8F8);
  }
  return result;
}

unint64_t sub_1216C()
{
  unint64_t result = qword_1C900;
  if (!qword_1C900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C900);
  }
  return result;
}

unint64_t sub_121BC()
{
  unint64_t result = qword_1C908;
  if (!qword_1C908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C908);
  }
  return result;
}

unint64_t sub_1220C()
{
  unint64_t result = qword_1C910;
  if (!qword_1C910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C910);
  }
  return result;
}

unint64_t sub_12258()
{
  unint64_t result = qword_1C920;
  if (!qword_1C920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C920);
  }
  return result;
}

unint64_t sub_122A4()
{
  unint64_t result = qword_1C928;
  if (!qword_1C928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C928);
  }
  return result;
}

unint64_t sub_122F0()
{
  unint64_t result = qword_1C938;
  if (!qword_1C938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C938);
  }
  return result;
}

unint64_t sub_1233C()
{
  unint64_t result = qword_1C950;
  if (!qword_1C950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C950);
  }
  return result;
}

unint64_t sub_12388()
{
  unint64_t result = qword_1C960;
  if (!qword_1C960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C960);
  }
  return result;
}

unint64_t sub_123D4()
{
  unint64_t result = qword_1C978;
  if (!qword_1C978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C978);
  }
  return result;
}

uint64_t sub_12420()
{
  uint64_t v1 = sub_13B54();
  v2(v1);
  sub_A454();
  sub_A72C();
  v3();
  return v0;
}

unint64_t sub_12470()
{
  unint64_t result = qword_1C988;
  if (!qword_1C988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C988);
  }
  return result;
}

unint64_t sub_124BC()
{
  unint64_t result = qword_1C9A8;
  if (!qword_1C9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C9A8);
  }
  return result;
}

uint64_t sub_12508(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_88F8(&qword_1C940);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_12578()
{
  unint64_t result = qword_1C9C0;
  if (!qword_1C9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C9C0);
  }
  return result;
}

unint64_t sub_125C4()
{
  unint64_t result = qword_1C9E0;
  if (!qword_1C9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C9E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel.CodingKeys()
{
  return &type metadata for SiriPaymentsSnippetModel.RequestPaymentConfirmationModel.CodingKeys;
}

uint64_t _s20SiriPaymentsUIPlugin24SiriPaymentsSnippetModelO31RequestPaymentConfirmationModelV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return sub_13B4C(-1);
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
      return sub_13B4C((*a1 | (v4 << 8)) - 3);
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
      return sub_13B4C((*a1 | (v4 << 8)) - 3);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return sub_13B4C((*a1 | (v4 << 8)) - 3);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return sub_13B4C(v8);
}

unsigned char *_s20SiriPaymentsUIPlugin24SiriPaymentsSnippetModelO31RequestPaymentConfirmationModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)sub_13B44((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)sub_13B2C((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x12768);
      case 4:
        unint64_t result = (unsigned char *)sub_13B34((uint64_t)result, v6);
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
          unint64_t result = sub_13B3C(result, a2 + 2);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriPaymentsSnippetModel.SendPaymentConfirmationModel.CodingKeys()
{
  return &type metadata for SiriPaymentsSnippetModel.SendPaymentConfirmationModel.CodingKeys;
}

uint64_t _s20SiriPaymentsUIPlugin14AppDescriptionV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return sub_13B4C(-1);
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
      return sub_13B4C((*a1 | (v4 << 8)) - 2);
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
      return sub_13B4C((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return sub_13B4C((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return sub_13B4C(v8);
}

unsigned char *_s20SiriPaymentsUIPlugin14AppDescriptionV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)sub_13B44((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)sub_13B2C((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x128E0);
      case 4:
        unint64_t result = (unsigned char *)sub_13B34((uint64_t)result, v6);
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
          unint64_t result = sub_13B3C(result, a2 + 1);
        break;
    }
  }
  return result;
}

uint64_t sub_12908(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_12910(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriPaymentsSnippetModel.AppDisambiguationModel.CodingKeys()
{
  return &type metadata for SiriPaymentsSnippetModel.AppDisambiguationModel.CodingKeys;
}

uint64_t _s20SiriPaymentsUIPlugin24SiriPaymentsSnippetModelO10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return sub_13B4C(-1);
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
      return sub_13B4C((*a1 | (v4 << 8)) - 4);
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
      return sub_13B4C((*a1 | (v4 << 8)) - 4);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return sub_13B4C((*a1 | (v4 << 8)) - 4);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return sub_13B4C(v8);
}

unsigned char *_s20SiriPaymentsUIPlugin24SiriPaymentsSnippetModelO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        unint64_t result = (unsigned char *)sub_13B44((uint64_t)result, v6);
        break;
      case 2:
        unint64_t result = (unsigned char *)sub_13B2C((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x12A6CLL);
      case 4:
        unint64_t result = (unsigned char *)sub_13B34((uint64_t)result, v6);
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
          unint64_t result = sub_13B3C(result, a2 + 3);
        break;
    }
  }
  return result;
}

unsigned char *sub_12A94(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriPaymentsSnippetModel.BinaryConfirmationModel.CodingKeys()
{
  return &type metadata for SiriPaymentsSnippetModel.BinaryConfirmationModel.CodingKeys;
}

uint64_t sub_12AAC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2348(*(void *)(a1 + 64), *(void *)(a1 + 72));
  sub_2348(*(void *)(a1 + 80), *(void *)(a1 + 88));

  return swift_bridgeObjectRelease();
}

void *sub_12B10(void *a1, void *a2)
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
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  uint64_t v8 = a2[8];
  unint64_t v9 = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_225C(v8, v9);
  a1[8] = v8;
  a1[9] = v9;
  uint64_t v10 = a2[10];
  unint64_t v11 = a2[11];
  sub_225C(v10, v11);
  a1[10] = v10;
  a1[11] = v11;
  uint64_t v12 = a2[13];
  a1[12] = a2[12];
  a1[13] = v12;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_12BC0(void *a1, void *a2)
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
  uint64_t v4 = a2[8];
  unint64_t v5 = a2[9];
  sub_225C(v4, v5);
  uint64_t v6 = a1[8];
  unint64_t v7 = a1[9];
  a1[8] = v4;
  a1[9] = v5;
  sub_2348(v6, v7);
  uint64_t v8 = a2[10];
  unint64_t v9 = a2[11];
  sub_225C(v8, v9);
  uint64_t v10 = a1[10];
  unint64_t v11 = a1[11];
  a1[10] = v8;
  a1[11] = v9;
  sub_2348(v10, v11);
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_12CC8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

void *sub_12CD0(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  a1[6] = *(void *)(a2 + 48);
  a1[7] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a1[8];
  unint64_t v9 = a1[9];
  *((_OWORD *)a1 + 4) = *(_OWORD *)(a2 + 64);
  sub_2348(v8, v9);
  uint64_t v10 = a1[10];
  unint64_t v11 = a1[11];
  *((_OWORD *)a1 + 5) = *(_OWORD *)(a2 + 80);
  sub_2348(v10, v11);
  uint64_t v12 = *(void *)(a2 + 104);
  a1[12] = *(void *)(a2 + 96);
  a1[13] = v12;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_12D68(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 112))
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

uint64_t sub_12DA8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SiriPaymentsSnippetModel.PaymentConfirmationModel()
{
}

unint64_t sub_12E14()
{
  unint64_t result = qword_1CA08;
  if (!qword_1CA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA08);
  }
  return result;
}

unint64_t sub_12E64()
{
  unint64_t result = qword_1CA10;
  if (!qword_1CA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA10);
  }
  return result;
}

unint64_t sub_12EB4()
{
  unint64_t result = qword_1CA18;
  if (!qword_1CA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA18);
  }
  return result;
}

unint64_t sub_12F04()
{
  unint64_t result = qword_1CA20;
  if (!qword_1CA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA20);
  }
  return result;
}

unint64_t sub_12F54()
{
  unint64_t result = qword_1CA28;
  if (!qword_1CA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA28);
  }
  return result;
}

unint64_t sub_12FA4()
{
  unint64_t result = qword_1CA30;
  if (!qword_1CA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA30);
  }
  return result;
}

unint64_t sub_12FF4()
{
  unint64_t result = qword_1CA38;
  if (!qword_1CA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA38);
  }
  return result;
}

unint64_t sub_13044()
{
  unint64_t result = qword_1CA40;
  if (!qword_1CA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA40);
  }
  return result;
}

unint64_t sub_13094()
{
  unint64_t result = qword_1CA48;
  if (!qword_1CA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA48);
  }
  return result;
}

unint64_t sub_130E4()
{
  unint64_t result = qword_1CA50;
  if (!qword_1CA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA50);
  }
  return result;
}

unint64_t sub_13134()
{
  unint64_t result = qword_1CA58;
  if (!qword_1CA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA58);
  }
  return result;
}

unint64_t sub_13184()
{
  unint64_t result = qword_1CA60;
  if (!qword_1CA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA60);
  }
  return result;
}

unint64_t sub_131D0()
{
  unint64_t result = qword_1CA70;
  if (!qword_1CA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA70);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SiriPaymentsSnippetModel.PaymentConfirmationModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SiriPaymentsSnippetModel.PaymentConfirmationModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x13370);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriPaymentsSnippetModel.PaymentConfirmationModel.CodingKeys()
{
  return &type metadata for SiriPaymentsSnippetModel.PaymentConfirmationModel.CodingKeys;
}

unint64_t sub_133AC()
{
  unint64_t result = qword_1CA80;
  if (!qword_1CA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA80);
  }
  return result;
}

unint64_t sub_133FC()
{
  unint64_t result = qword_1CA88;
  if (!qword_1CA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA88);
  }
  return result;
}

unint64_t sub_1344C()
{
  unint64_t result = qword_1CA90;
  if (!qword_1CA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1CA90);
  }
  return result;
}

uint64_t sub_134E4()
{
  return v0;
}

__n128 sub_13544()
{
  long long v2 = *(_OWORD *)(v1 - 184);
  long long v3 = *(_OWORD *)(v1 - 168);
  uint64_t v4 = *(void *)(v1 - 152);
  uint64_t v5 = *(void *)(v1 - 144);
  uint64_t v6 = *(void *)(v1 - 104);
  uint64_t v7 = *(void *)(v1 - 96);
  uint64_t v8 = v0 + *(int *)(*(void *)(v1 - 272) + 24);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)(v1 - 200);
  *(_OWORD *)(v8 + 16) = v2;
  *(_OWORD *)(v8 + 32) = v3;
  *(void *)(v8 + 48) = v4;
  *(void *)(v8 + 56) = v5;
  __n128 result = *(__n128 *)(v1 - 136);
  long long v10 = *(_OWORD *)(v1 - 120);
  *(__n128 *)(v8 + 64) = result;
  *(_OWORD *)(v8 + 80) = v10;
  *(void *)(v8 + 96) = v6;
  *(void *)(v8 + 104) = v7;
  return result;
}

unint64_t sub_13588()
{
  uint64_t v4 = v0 + *(int *)(v1 + 24);
  long long v5 = *(_OWORD *)(v4 + 16);
  long long v6 = *(_OWORD *)(v4 + 32);
  uint64_t v7 = *(void *)(v4 + 48);
  uint64_t v8 = *(void *)(v4 + 56);
  uint64_t v9 = *(void *)(v4 + 96);
  uint64_t v10 = *(void *)(v4 + 104);
  *(_OWORD *)(v2 - 192) = *(_OWORD *)v4;
  *(_OWORD *)(v2 - 176) = v5;
  *(_OWORD *)(v2 - 160) = v6;
  *(void *)(v2 - 144) = v7;
  *(void *)(v2 - 136) = v8;
  long long v11 = *(_OWORD *)(v4 + 80);
  *(_OWORD *)(v2 - 128) = *(_OWORD *)(v4 + 64);
  *(_OWORD *)(v2 - 112) = v11;
  *(void *)(v2 - 96) = v9;
  *(void *)(v2 - 88) = v10;
  *(unsigned char *)(v2 - 65) = 2;
  return sub_125C4();
}

uint64_t sub_135D0()
{
  return sub_143F0();
}

uint64_t sub_135F0@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 80) = a1;
  return sub_14430();
}

uint64_t sub_13614()
{
  return v0;
}

void sub_13638(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 224) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_13654(uint64_t a1, uint64_t a2)
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(a1, a2, v2, a1);
}

uint64_t sub_13674()
{
  return sub_144A0();
}

void *sub_13694()
{
  return sub_EE24(v0, v0[3]);
}

uint64_t sub_136B8()
{
  return v0 + *(int *)(*(void *)(v1 - 272) + 20);
}

uint64_t sub_136E4()
{
  return v0;
}

uint64_t sub_136F8()
{
  return v0;
}

uint64_t sub_13710()
{
  uint64_t result = v0;
  *(void *)(v2 - 224) = v1;
  return result;
}

uint64_t sub_13738()
{
  uint64_t v3 = v1[1];
  *uint64_t v0 = *v1;
  v0[1] = v3;
  uint64_t v4 = v1[3];
  v0[2] = v1[2];
  v0[3] = v4;
  uint64_t v5 = v1[5];
  v0[4] = v1[4];
  v0[5] = v5;
  uint64_t v6 = v1[7];
  v0[6] = v1[6];
  v0[7] = v6;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1376C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_31FC(a4);
}

uint64_t sub_13790()
{
  return sub_14440();
}

uint64_t sub_137A8()
{
  return sub_14400();
}

uint64_t sub_137D8()
{
  return sub_14400();
}

uint64_t sub_13808()
{
  return sub_31FC(v0);
}

uint64_t sub_13828()
{
  return v1 + *(int *)(v0 + 20);
}

uint64_t sub_13844()
{
  return sub_14400();
}

uint64_t sub_1386C()
{
  return sub_14440();
}

uint64_t sub_13894()
{
  return 0;
}

void sub_138B0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 256) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_138CC(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_138E8()
{
  *(void *)(v1 - 272) = v0;
  *(unsigned char *)(v1 - 200) = 0;
}

uint64_t sub_13920()
{
  return v0;
}

void sub_13930()
{
  *(unsigned char *)(v0 - 192) = 1;
}

uint64_t sub_13960()
{
  return v0;
}

uint64_t sub_13970@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 80) = a1;
  return sub_14430();
}

uint64_t sub_139A4()
{
  return v0;
}

uint64_t sub_139BC()
{
  return sub_14490();
}

uint64_t sub_139E8()
{
  return sub_14450();
}

uint64_t sub_13A04()
{
  return sub_14430();
}

uint64_t sub_13A20()
{
  return v0;
}

uint64_t sub_13A38()
{
  return v0;
}

uint64_t sub_13A50()
{
  return sub_143F0();
}

uint64_t sub_13A70()
{
  *(void *)(v2 + 64) = v0;
  *(void *)(v2 + 72) = v1;
  uint64_t v5 = *(void *)(v3 + 80);
  unint64_t v6 = *(void *)(v3 + 88);
  return sub_225C(v5, v6);
}

uint64_t sub_13A90()
{
  return sub_14420();
}

uint64_t sub_13AB0()
{
  return v0;
}

uint64_t sub_13AC4()
{
  return v0;
}

uint64_t sub_13AD8()
{
  return sub_2348(v1, v0);
}

uint64_t sub_13AF0()
{
  return v0;
}

void sub_13B18(uint64_t a1@<X8>)
{
  *(void *)(v1 - 264) = a1;
}

uint64_t sub_13B2C@<X0>(uint64_t result@<X0>, __int16 a2@<W8>)
{
  *(_WORD *)(result + 1) = a2;
  return result;
}

uint64_t sub_13B34@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 1) = a2;
  return result;
}

unsigned char *sub_13B3C@<X0>(unsigned char *result@<X0>, char a2@<W8>)
{
  *uint64_t result = a2;
  return result;
}

uint64_t sub_13B44@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  *(unsigned char *)(result + 1) = a2;
  return result;
}

uint64_t sub_13B4C@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t sub_13B54()
{
  return 0;
}

uint64_t sub_13B68()
{
  id v1 = [v0 amount];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_13C68(v0);
  uint64_t v5 = v4;
  if (!v4)
  {

    return 0;
  }
  uint64_t v6 = v3;
  id v7 = [objc_allocWithZone((Class)NSNumberFormatter) init];
  [v7 setNumberStyle:2];
  sub_13CCC(v6, v5, v7);
  id v8 = [v7 stringFromNumber:v2];
  if (!v8)
  {

    return 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = sub_14300();

  return v10;
}

uint64_t sub_13C68(void *a1)
{
  id v1 = [a1 currencyCode];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_14300();

  return v3;
}

void sub_13CCC(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_142F0();
  swift_bridgeObjectRelease();
  [a3 setCurrencyCode:v4];
}

uint64_t sub_13D30()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_13D40()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_13D50()
{
  return SnippetPluginModel.snippetHidden(for:idiom:)();
}

uint64_t sub_13D60()
{
  return type metadata accessor for SashStandard.Title();
}

uint64_t sub_13D70()
{
  return SashStandard.init(title:thumbnail:titleColor:backgroundColor:action:componentName:showOnWatch:)();
}

uint64_t sub_13D80()
{
  return type metadata accessor for SashStandard();
}

uint64_t sub_13D90()
{
  return CodableIntent.wrappedValue.getter();
}

uint64_t sub_13DA0()
{
  return type metadata accessor for VisualProperty();
}

uint64_t sub_13DB0()
{
  return CodableIntentResponse.wrappedValue.getter();
}

uint64_t sub_13DC0()
{
  return type metadata accessor for Color();
}

uint64_t sub_13DD0()
{
  return static RFImage.appIcon(_:)();
}

uint64_t sub_13DE0()
{
  return type metadata accessor for RFImage();
}

uint64_t sub_13DF0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_13E00()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_13E10()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_13E20()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_13E30()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t sub_13E40()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t sub_13E50()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t sub_13E70()
{
  return EnvironmentObject.error()();
}

uint64_t sub_13E80()
{
  return EnvironmentObject.init()();
}

uint64_t sub_13E90()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_13EA0()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_13EB0()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_13EC0()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_13ED0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_13EE0()
{
  return type metadata accessor for EnvironmentValues();
}

void sub_13EF0(Swift::String a1)
{
}

void sub_13F00(Swift::String a1)
{
}

uint64_t sub_13F10()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_13F20()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_13F30()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_13F40()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_13F50()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_13F60()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_13F70()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_13F80()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_13F90()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_13FA0()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_13FC0()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_13FD0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_13FE0()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_13FF0()
{
  return Text.font(_:)();
}

uint64_t sub_14000()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_14010()
{
  return Text.init<A>(_:)();
}

uint64_t sub_14020()
{
  return View.eraseToAnyView()();
}

uint64_t sub_14030()
{
  return View.buttonRole(_:)();
}

uint64_t sub_14040()
{
  return View.componentTapped(isNavigation:perform:)();
}

uint64_t sub_14050()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_14060()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_14070()
{
  return View.fontWeight(_:)();
}

uint64_t sub_14080()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_14090()
{
  return static Color.gray.getter();
}

uint64_t sub_140A0()
{
  return static Color.black.getter();
}

uint64_t sub_140B0()
{
  return static Color.white.getter();
}

uint64_t sub_140C0()
{
  return Button.init(action:label:)();
}

uint64_t sub_140D0()
{
  return Divider.init()();
}

uint64_t sub_140E0()
{
  return type metadata accessor for Divider();
}

uint64_t sub_140F0()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_14100()
{
  return static Alignment.center.getter();
}

uint64_t sub_14110()
{
  return type metadata accessor for ButtonItemButtonStyle.Role();
}

uint64_t sub_14120()
{
  return type metadata accessor for RFImageView();
}

uint64_t sub_14130()
{
  return RFImageView.init(_:)();
}

uint64_t sub_14140()
{
  return type metadata accessor for IntentsUISlot();
}

uint64_t sub_14150()
{
  return IntentsUISlot.init(_:fallback:)();
}

uint64_t sub_14160()
{
  return ComponentStack.init(content:)();
}

uint64_t sub_14170()
{
  return BinaryButtonView.init(primaryButton:secondaryButton:)();
}

uint64_t sub_14180()
{
  return type metadata accessor for BinaryButtonView();
}

uint64_t sub_14190()
{
  return SashStandardView.init(model:)();
}

uint64_t sub_141A0()
{
  return type metadata accessor for SashStandardView();
}

uint64_t sub_141B0()
{
  return DisambiguationView.init(title:content:)();
}

uint64_t sub_141C0()
{
  return SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)();
}

uint64_t sub_141D0()
{
  return type metadata accessor for SimpleItemRichView();
}

uint64_t sub_141E0()
{
  return DisambiguationTitle.init(text1:thumbnail:)();
}

uint64_t sub_141F0()
{
  return type metadata accessor for DisambiguationTitle();
}

uint64_t sub_14200()
{
  return InteractionDelegate.wrappedValue.getter();
}

uint64_t sub_14210()
{
  return InteractionDelegate.init()();
}

uint64_t sub_14220()
{
  return type metadata accessor for InteractionDelegate();
}

uint64_t sub_14230()
{
  return static IntentsUISlotBuilder.buildBlock(_:)();
}

uint64_t sub_14240()
{
  return static IntentsUISlotBuilder.buildExpression(_:)();
}

uint64_t sub_14250()
{
  return type metadata accessor for IntentsUIComponentView();
}

uint64_t sub_14260()
{
  return IntentsUIComponentView.init(_:slots:)();
}

uint64_t sub_14270()
{
  return PrimaryHeaderMarqueeView.init(text1:text2:thumbnail:addTint:)();
}

uint64_t sub_14280()
{
  return type metadata accessor for PrimaryHeaderMarqueeView();
}

BOOL sub_14290(Swift::String directInvocation, Swift::OpaquePointer payload)
{
  return InteractionDelegateWrapper.perform(directInvocation:payload:)(directInvocation, payload);
}

uint64_t sub_142A0()
{
  return type metadata accessor for InteractionDelegateWrapper();
}

uint64_t sub_142B0()
{
  return dispatch thunk of Context.perform(aceCommand:)();
}

uint64_t sub_142C0()
{
  return type metadata accessor for Context();
}

NSDictionary sub_142D0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_142E0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_142F0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_14300()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_14310(Swift::String a1)
{
}

Swift::Int sub_14320()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_14330()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_14340()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_14350()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_14360()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_14380()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_14390()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_143A0()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_143B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_143C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_143E0()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_143F0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_14400()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_14410()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_14420()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_14430()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_14440()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_14450()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_14460()
{
  return Hasher.init(_seed:)();
}

void sub_14470(Swift::UInt a1)
{
}

Swift::Int sub_14480()
{
  return Hasher._finalize()();
}

uint64_t sub_14490()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_144A0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_144D0()
{
  return _typeName(_:qualified:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}