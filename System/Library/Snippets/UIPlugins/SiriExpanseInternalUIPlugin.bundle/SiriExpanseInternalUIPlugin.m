void *sub_4EA0()
{
  return &unk_C310;
}

unint64_t sub_4EAC()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_4EC8()
{
  return sub_A870();
}

uint64_t sub_4EF8()
{
  sub_4F2C(&qword_10000);
  sub_A890();
  return v1;
}

uint64_t sub_4F2C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_4F70()
{
  return sub_A8A0();
}

uint64_t (*sub_4FA8(void *a1))()
{
  v2 = malloc(0x28uLL);
  *a1 = v2;
  sub_4F2C(&qword_10000);
  v2[4] = sub_A880();
  return sub_5014;
}

uint64_t sub_5018()
{
  type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  sub_4F2C(&qword_10000);
  sub_A890();
  return v1;
}

uint64_t type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(uint64_t a1)
{
  return sub_7A3C(a1, (uint64_t *)&unk_10970);
}

uint64_t sub_5084()
{
  return sub_A8A0();
}

uint64_t (*sub_50D4(void *a1))()
{
  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  sub_4F2C(&qword_10000);
  v2[4] = sub_A880();
  return sub_5014;
}

uint64_t sub_5150()
{
  if ((sub_A8B0() & 1) == 0) {
    return 0;
  }
  type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);

  return sub_A8B0();
}

uint64_t sub_51D8()
{
  if (*v0) {
    return 0x656D614E707061;
  }
  else {
    return 0x614C6E6F74747562;
  }
}

uint64_t sub_521C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_A3D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_5244()
{
  return 0;
}

void sub_5250(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_525C(uint64_t a1)
{
  unint64_t v2 = sub_54C8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_5298(uint64_t a1)
{
  unint64_t v2 = sub_54C8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_52D4(void *a1)
{
  uint64_t v3 = sub_4F2C(&qword_10008);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_5484(a1, a1[3]);
  sub_54C8();
  sub_A9C0();
  v8[15] = 0;
  sub_4F2C(&qword_10000);
  sub_59AC(&qword_10010);
  sub_A960();
  if (!v1)
  {
    type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    v8[14] = 1;
    sub_A960();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

void *sub_5484(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_54C8()
{
  unint64_t result = qword_10330;
  if (!qword_10330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10330);
  }
  return result;
}

uint64_t sub_551C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5564()
{
  return sub_A870();
}

uint64_t sub_55D4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v30 = sub_4F2C(&qword_10000);
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v28 = (char *)&v21 - v7;
  uint64_t v29 = sub_4F2C(&qword_10018);
  uint64_t v26 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5484(a1, a1[3]);
  sub_54C8();
  sub_A9B0();
  if (v2) {
    return sub_595C(a1);
  }
  uint64_t v22 = v10;
  v23 = v6;
  uint64_t v14 = v26;
  uint64_t v13 = v27;
  v24 = v12;
  char v32 = 0;
  uint64_t v15 = sub_59AC(&qword_10020);
  v16 = v28;
  uint64_t v17 = v29;
  sub_A920();
  uint64_t v21 = v15;
  v28 = *(char **)(v13 + 32);
  ((void (*)(char *, char *, uint64_t))v28)(v24, v16, v30);
  char v31 = 1;
  v18 = v23;
  sub_A920();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v17);
  uint64_t v19 = (uint64_t)v24;
  ((void (*)(char *, char *, uint64_t))v28)(&v24[*(int *)(v22 + 20)], v18, v30);
  sub_5AF0(v19, v25, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
  sub_595C(a1);
  return sub_5B58(v19, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
}

uint64_t sub_595C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_59AC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_551C(&qword_10000);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_5A14()
{
  if ((sub_A8B0() & 1) == 0) {
    return 0;
  }

  return sub_A8B0();
}

uint64_t sub_5A9C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_55D4(a1, a2);
}

uint64_t sub_5AB4(void *a1)
{
  return sub_52D4(a1);
}

uint64_t type metadata accessor for ExpanseUIModel.ButtonModel(uint64_t a1)
{
  return sub_7A3C(a1, qword_10990);
}

uint64_t sub_5AF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_5B58(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_5BB8()
{
  sub_4F2C(&qword_10028);

  return sub_A890();
}

uint64_t sub_5BF8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  __chkstk_darwin(v2 - 8);
  sub_5AF0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ExpanseUIModel.ButtonModel);
  sub_4F2C(&qword_10028);
  sub_A8A0();
  return sub_5B58(a1, type metadata accessor for ExpanseUIModel.ButtonModel);
}

uint64_t (*sub_5CB0(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  sub_4F2C(&qword_10028);
  v2[4] = sub_A880();
  return sub_5014;
}

uint64_t sub_5D1C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  __chkstk_darwin(v2);
  sub_5AF0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ExpanseUIModel.ButtonModel);
  sub_A870();
  return sub_5B58(a1, type metadata accessor for ExpanseUIModel.ButtonModel);
}

uint64_t sub_5DE0()
{
  return sub_A890();
}

uint64_t type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(uint64_t a1)
{
  return sub_7A3C(a1, (uint64_t *)&unk_10980);
}

uint64_t sub_5E44(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  __chkstk_darwin(v2 - 8);
  sub_5AF0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ExpanseUIModel.ButtonModel);
  type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  sub_4F2C(&qword_10028);
  sub_A8A0();
  return sub_5B58(a1, type metadata accessor for ExpanseUIModel.ButtonModel);
}

uint64_t (*sub_5F0C(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  sub_4F2C(&qword_10028);
  v2[4] = sub_A880();
  return sub_5014;
}

uint64_t sub_5F88()
{
  if (*v0) {
    return 0x7261646E6F636573;
  }
  else {
    return 0x427972616D697270;
  }
}

uint64_t sub_5FDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_A4DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_6004(uint64_t a1)
{
  unint64_t v2 = sub_622C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_6040(uint64_t a1)
{
  unint64_t v2 = sub_622C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_607C(void *a1)
{
  uint64_t v3 = sub_4F2C(&qword_10030);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_5484(a1, a1[3]);
  sub_622C();
  sub_A9C0();
  v8[15] = 0;
  sub_4F2C(&qword_10028);
  sub_6650(&qword_10038);
  sub_A960();
  if (!v1)
  {
    type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    v8[14] = 1;
    sub_A960();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_622C()
{
  unint64_t result = qword_10338;
  if (!qword_10338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10338);
  }
  return result;
}

uint64_t sub_6280(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_62C8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v30 = sub_4F2C(&qword_10028);
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v4 = __chkstk_darwin(v30);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v28 = (char *)&v21 - v7;
  uint64_t v29 = sub_4F2C(&qword_10050);
  uint64_t v26 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5484(a1, a1[3]);
  sub_622C();
  sub_A9B0();
  if (v2) {
    return sub_595C(a1);
  }
  uint64_t v22 = v10;
  v23 = v6;
  uint64_t v14 = v26;
  uint64_t v13 = v27;
  v24 = v12;
  char v32 = 0;
  uint64_t v15 = sub_6650(&qword_10058);
  v16 = v28;
  uint64_t v17 = v29;
  sub_A920();
  uint64_t v21 = v15;
  v28 = *(char **)(v13 + 32);
  ((void (*)(char *, char *, uint64_t))v28)(v24, v16, v30);
  char v31 = 1;
  v18 = v23;
  sub_A920();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v17);
  uint64_t v19 = (uint64_t)v24;
  ((void (*)(char *, char *, uint64_t))v28)(&v24[*(int *)(v22 + 20)], v18, v30);
  sub_5AF0(v19, v25, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
  sub_595C(a1);
  return sub_5B58(v19, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
}

uint64_t sub_6650(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_551C(&qword_10028);
    sub_6280(&qword_10040, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.ButtonModel);
    sub_6280(&qword_10048, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.ButtonModel);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_671C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5AF0(a1, (uint64_t)v6, type metadata accessor for ExpanseUIModel.ButtonModel);
  sub_A870();
  sub_5B58(a1, type metadata accessor for ExpanseUIModel.ButtonModel);
  type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  sub_5AF0(a2, (uint64_t)v6, type metadata accessor for ExpanseUIModel.ButtonModel);
  sub_A870();
  return sub_5B58(a2, type metadata accessor for ExpanseUIModel.ButtonModel);
}

uint64_t sub_6820@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_62C8(a1, a2);
}

uint64_t sub_6838(void *a1)
{
  return sub_607C(a1);
}

uint64_t sub_6850()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_6880()
{
  sub_68C8();

  return sub_A830();
}

unint64_t sub_68C8()
{
  unint64_t result = qword_10060;
  if (!qword_10060)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10060);
  }
  return result;
}

uint64_t sub_6908()
{
  return sub_A850();
}

uint64_t sub_6944()
{
  return sub_A860();
}

uint64_t (*sub_698C(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ExpanseUIModel.ButtonModel(0);
  sub_4F2C(&qword_10068);
  v2[4] = sub_A840();
  return sub_5014;
}

void sub_6A08(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_6A54()
{
  if (*v0) {
    return 0xD000000000000010;
  }
  else {
    return 0x6C6562616CLL;
  }
}

uint64_t sub_6A90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_A618(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_6AB8(uint64_t a1)
{
  unint64_t v2 = sub_6CD8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_6AF4(uint64_t a1)
{
  unint64_t v2 = sub_6CD8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_6B30(void *a1)
{
  uint64_t v3 = sub_4F2C(&qword_10070);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_5484(a1, a1[3]);
  sub_6CD8();
  sub_A9C0();
  v8[15] = 0;
  sub_A950();
  if (!v1)
  {
    type metadata accessor for ExpanseUIModel.ButtonModel(0);
    v8[14] = 1;
    sub_4F2C(&qword_10068);
    sub_7058(&qword_10078);
    sub_A960();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_6CD8()
{
  unint64_t result = qword_10340;
  if (!qword_10340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10340);
  }
  return result;
}

uint64_t sub_6D2C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v19 = sub_4F2C(&qword_10068);
  uint64_t v16 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_4F2C(&qword_10080);
  uint64_t v18 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ExpanseUIModel.ButtonModel(0);
  __chkstk_darwin(v8);
  uint64_t v10 = (uint64_t *)((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_5484(a1, a1[3]);
  sub_6CD8();
  sub_A9B0();
  if (v2) {
    return sub_595C(a1);
  }
  uint64_t v15 = v8;
  uint64_t v12 = v18;
  uint64_t v11 = v19;
  char v22 = 0;
  *uint64_t v10 = sub_A910();
  v10[1] = v13;
  char v21 = 1;
  sub_7058(&qword_10088);
  sub_A920();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v20);
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))((char *)v10 + *(int *)(v15 + 20), v5, v11);
  sub_5AF0((uint64_t)v10, v17, type metadata accessor for ExpanseUIModel.ButtonModel);
  sub_595C(a1);
  return sub_5B58((uint64_t)v10, type metadata accessor for ExpanseUIModel.ButtonModel);
}

uint64_t sub_7058(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_551C(&qword_10068);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_70A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  type metadata accessor for ExpanseUIModel.ButtonModel(0);
  sub_68C8();
  return sub_A830();
}

uint64_t sub_70F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_6D2C(a1, a2);
}

uint64_t sub_7108(void *a1)
{
  return sub_6B30(a1);
}

uint64_t sub_7120()
{
  return 1;
}

uint64_t sub_7130()
{
  return 12383;
}

void sub_7140(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_714C(uint64_t a1)
{
  unint64_t v2 = sub_7B84();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_7188(uint64_t a1)
{
  unint64_t v2 = sub_7B84();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_71C4()
{
  return sub_A9A0();
}

void sub_7208()
{
}

Swift::Int sub_7230()
{
  return sub_A9A0();
}

uint64_t sub_7270@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_A970();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_72F0(uint64_t a1)
{
  unint64_t v2 = sub_7AC8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_732C(uint64_t a1)
{
  unint64_t v2 = sub_7AC8();

  return CodingKey.debugDescription.getter(a1, v2);
}

BOOL sub_7368(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_7380()
{
  Swift::UInt v1 = *v0;
  sub_A980();
  sub_A990(v1);
  return sub_A9A0();
}

void sub_73C8()
{
  sub_A990(*v0);
}

Swift::Int sub_73F4()
{
  Swift::UInt v1 = *v0;
  sub_A980();
  sub_A990(v1);
  return sub_A9A0();
}

uint64_t sub_7438()
{
  if (*v0) {
    return 0x75427972616E6962;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_7480@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_A700(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_74A8(uint64_t a1)
{
  unint64_t v2 = sub_7A74();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_74E4(uint64_t a1)
{
  unint64_t v2 = sub_7A74();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_7520(void *a1)
{
  uint64_t v2 = sub_4F2C(&qword_10090);
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  __chkstk_darwin(v2);
  char v31 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  __chkstk_darwin(v29);
  uint64_t v30 = (uint64_t)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_4F2C(&qword_10098);
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v28 = v5;
  __chkstk_darwin(v5);
  char v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  __chkstk_darwin(v26);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ExpanseUIModel(0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_4F2C(&qword_100A0);
  uint64_t v13 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_5484(a1, a1[3]);
  sub_7A74();
  sub_A9C0();
  sub_5AF0(v35, (uint64_t)v12, type metadata accessor for ExpanseUIModel);
  uint64_t v16 = (uint64_t (**)(char *, uint64_t))(v13 + 8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = v30;
    sub_7B1C((uint64_t)v12, v30, type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
    char v37 = 1;
    sub_7AC8();
    uint64_t v18 = v31;
    uint64_t v19 = v34;
    sub_A940();
    sub_6280(&qword_100A8, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
    uint64_t v20 = v33;
    sub_A960();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v18, v20);
    char v21 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel;
    uint64_t v22 = v17;
  }
  else
  {
    sub_7B1C((uint64_t)v12, (uint64_t)v9, type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
    char v36 = 0;
    sub_7B84();
    uint64_t v19 = v34;
    sub_A940();
    sub_6280(&qword_100B0, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
    uint64_t v23 = v28;
    sub_A960();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v23);
    char v21 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel;
    uint64_t v22 = (uint64_t)v9;
  }
  sub_5B58(v22, v21);
  return (*v16)(v15, v19);
}

uint64_t type metadata accessor for ExpanseUIModel(uint64_t a1)
{
  return sub_7A3C(a1, (uint64_t *)&unk_10960);
}

uint64_t sub_7A3C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_7A74()
{
  unint64_t result = qword_10348;
  if (!qword_10348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10348);
  }
  return result;
}

unint64_t sub_7AC8()
{
  unint64_t result = qword_10350;
  if (!qword_10350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10350);
  }
  return result;
}

uint64_t sub_7B1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_7B84()
{
  unint64_t result = qword_10358[0];
  if (!qword_10358[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10358);
  }
  return result;
}

uint64_t sub_7BD8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v38 = sub_4F2C(&qword_100B8);
  uint64_t v41 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  v44 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_4F2C(&qword_100C0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  uint64_t v40 = v5;
  __chkstk_darwin(v4);
  v43 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_4F2C(&qword_100C8);
  uint64_t v42 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ExpanseUIModel(0);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v35 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v35 - v17;
  uint64_t v19 = a1[3];
  v45 = a1;
  sub_5484(a1, v19);
  sub_7A74();
  uint64_t v20 = v46;
  sub_A9B0();
  if (v20) {
    goto LABEL_7;
  }
  uint64_t v35 = v18;
  char v36 = v13;
  char v21 = v16;
  uint64_t v22 = v43;
  uint64_t v23 = v44;
  uint64_t v46 = v10;
  uint64_t v24 = sub_A930();
  uint64_t v25 = v9;
  if (*(void *)(v24 + 16) != 1)
  {
    uint64_t v29 = sub_A8E0();
    swift_allocError();
    char v31 = v30;
    sub_4F2C(&qword_100D0);
    *char v31 = v46;
    sub_A900();
    sub_A8D0();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v29 - 8) + 104))(v31, enum case for DecodingError.typeMismatch(_:), v29);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v9, v7);
LABEL_7:
    uint64_t v27 = v45;
    return sub_595C(v27);
  }
  if (*(unsigned char *)(v24 + 32))
  {
    char v48 = 1;
    sub_7AC8();
    sub_A8F0();
    type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    sub_6280(&qword_100D8, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
    uint64_t v26 = v38;
    sub_A920();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v23, v26);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v9, v7);
    uint64_t v27 = v45;
    uint64_t v28 = (uint64_t)v36;
  }
  else
  {
    char v47 = 0;
    sub_7B84();
    sub_A8F0();
    type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    sub_6280(&qword_100E0, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
    uint64_t v28 = (uint64_t)v21;
    uint64_t v33 = v39;
    sub_A920();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v22, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v25, v7);
    uint64_t v27 = v45;
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v34 = (uint64_t)v35;
  sub_7B1C(v28, (uint64_t)v35, type metadata accessor for ExpanseUIModel);
  sub_7B1C(v34, v37, type metadata accessor for ExpanseUIModel);
  return sub_595C(v27);
}

uint64_t sub_81F4()
{
  return sub_6280(&qword_100E0, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
}

uint64_t sub_823C()
{
  return sub_6280(&qword_100B0, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel);
}

uint64_t sub_8284()
{
  return sub_6280(&qword_100D8, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
}

uint64_t sub_82CC()
{
  return sub_6280(&qword_100A8, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel);
}

uint64_t sub_8314()
{
  return sub_6280(&qword_100E8, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel);
}

uint64_t sub_835C()
{
  return sub_6280(&qword_100F0, (void (*)(uint64_t))type metadata accessor for ExpanseUIModel);
}

uint64_t sub_83A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_7BD8(a1, a2);
}

uint64_t sub_83C0(void *a1)
{
  return sub_7520(a1);
}

uint64_t *sub_83D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_4F2C(&qword_10028);
      uint64_t v7 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16);
      v7(a1, a2, v6);
      uint64_t v8 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    }
    else
    {
      uint64_t v6 = sub_4F2C(&qword_10000);
      uint64_t v7 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16);
      v7(a1, a2, v6);
      uint64_t v8 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    }
    v7((uint64_t *)((char *)a1 + *(int *)(v8 + 20)), (uint64_t *)((char *)a2 + *(int *)(v8 + 20)), v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_8568(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_4F2C(&qword_10028);
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v6)((void *)(v2 - 8), a1, v2);
    uint64_t v3 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  }
  else
  {
    uint64_t v2 = sub_4F2C(&qword_10000);
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v6)((void *)(v2 - 8), a1, v2);
    uint64_t v3 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  }
  uint64_t v4 = a1 + *(int *)(v3 + 20);

  return v6(v4, v2);
}

uint64_t sub_8668(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_4F2C(&qword_10028);
    int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
    v5(a1, a2, v4);
    uint64_t v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  }
  else
  {
    uint64_t v4 = sub_4F2C(&qword_10000);
    int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
    v5(a1, a2, v4);
    uint64_t v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  }
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_87A0(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_5B58(a1, type metadata accessor for ExpanseUIModel);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_4F2C(&qword_10028);
      int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    }
    else
    {
      uint64_t v4 = sub_4F2C(&qword_10000);
      int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    }
    v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_88FC(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_4F2C(&qword_10028);
    int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
    v5(a1, a2, v4);
    uint64_t v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
  }
  else
  {
    uint64_t v4 = sub_4F2C(&qword_10000);
    int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
    v5(a1, a2, v4);
    uint64_t v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
  }
  v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_8A34(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_5B58(a1, type metadata accessor for ExpanseUIModel);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_4F2C(&qword_10028);
      int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(0);
    }
    else
    {
      uint64_t v4 = sub_4F2C(&qword_10000);
      int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(0);
    }
    v5(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_8B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_8BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_8BE8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_8BF8()
{
  uint64_t result = type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_8CBC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_8E34(a1, a2, a3, &qword_10000);
}

uint64_t sub_8CC8(uint64_t a1, uint64_t a2)
{
  return sub_8F28(a1, a2, &qword_10000);
}

uint64_t sub_8CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_8FD4(a1, a2, a3, &qword_10000);
}

uint64_t sub_8CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_9078(a1, a2, a3, &qword_10000);
}

uint64_t sub_8CEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_911C(a1, a2, a3, &qword_10000);
}

uint64_t sub_8CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_91C0(a1, a2, a3, &qword_10000);
}

uint64_t sub_8D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_8D18);
}

uint64_t sub_8D18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_9278(a1, a2, a3, &qword_10000);
}

uint64_t sub_8D24()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_8D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_9304(a1, a2, a3, a4, &qword_10000);
}

void sub_8D44()
{
  sub_8DD0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_8DD0()
{
  if (!qword_101E8)
  {
    unint64_t v0 = sub_A8C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_101E8);
    }
  }
}

uint64_t *sub_8E28(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_8E34(a1, a2, a3, &qword_10028);
}

uint64_t *sub_8E34(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  int v6 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    uint64_t v8 = sub_4F2C(a4);
    uint64_t v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16);
    v9(a1, a2, v8);
    v9((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v8);
  }
  return a1;
}

uint64_t sub_8F1C(uint64_t a1, uint64_t a2)
{
  return sub_8F28(a1, a2, &qword_10028);
}

uint64_t sub_8F28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4F2C(a3);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), a1, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 20);

  return v8(v6, v5);
}

uint64_t sub_8FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_8FD4(a1, a2, a3, &qword_10028);
}

uint64_t sub_8FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = sub_4F2C(a4);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  v8(a1, a2, v7);
  v8(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v7);
  return a1;
}

uint64_t sub_906C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_9078(a1, a2, a3, &qword_10028);
}

uint64_t sub_9078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = sub_4F2C(a4);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 24);
  v8(a1, a2, v7);
  v8(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v7);
  return a1;
}

uint64_t sub_9110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_911C(a1, a2, a3, &qword_10028);
}

uint64_t sub_911C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = sub_4F2C(a4);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32);
  v8(a1, a2, v7);
  v8(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v7);
  return a1;
}

uint64_t sub_91B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_91C0(a1, a2, a3, &qword_10028);
}

uint64_t sub_91C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = sub_4F2C(a4);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40);
  v8(a1, a2, v7);
  v8(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v7);
  return a1;
}

uint64_t sub_9258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_926C);
}

uint64_t sub_926C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_9278(a1, a2, a3, &qword_10028);
}

uint64_t sub_9278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = sub_4F2C(a4);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);

  return v7(a1, a2, v6);
}

uint64_t sub_92E4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_92F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_9304(a1, a2, a3, a4, &qword_10028);
}

uint64_t sub_9304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = sub_4F2C(a5);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);

  return v8(a1, a2, a2, v7);
}

void sub_9374()
{
  sub_9A04(319, (unint64_t *)&unk_10270, type metadata accessor for ExpanseUIModel.ButtonModel, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Loggable);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_9430(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_4F2C(&qword_10068);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  return a1;
}

uint64_t sub_9504(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_4F2C(&qword_10068);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_9580(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_4F2C(&qword_10068);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

void *sub_9604(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_4F2C(&qword_10068);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_96A4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_4F2C(&qword_10068);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_9724(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_4F2C(&qword_10068);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_97B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_97C8);
}

uint64_t sub_97C8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_4F2C(&qword_10068);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_987C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_9890(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_4F2C(&qword_10068);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_993C()
{
  sub_9A04(319, (unint64_t *)&unk_102F8, (uint64_t (*)(uint64_t))sub_68C8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for CodableAceObject);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_9A04(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unsigned char *initializeBufferWithCopyOfBuffer for ExpanseUIModel.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_9A80(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_9A88(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ExpanseUIModel.CodingKeys()
{
  return &type metadata for ExpanseUIModel.CodingKeys;
}

uint64_t sub_9AB0()
{
  return 0;
}

ValueMetadata *type metadata accessor for ExpanseUIModel.AppStorePunchoutCodingKeys()
{
  return &type metadata for ExpanseUIModel.AppStorePunchoutCodingKeys;
}

uint64_t _s27SiriExpanseInternalUIPlugin14ExpanseUIModelO26AppStorePunchoutCodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s27SiriExpanseInternalUIPlugin14ExpanseUIModelO26AppStorePunchoutCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x9BB4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ExpanseUIModel.BinaryButtonCodingKeys()
{
  return &type metadata for ExpanseUIModel.BinaryButtonCodingKeys;
}

ValueMetadata *type metadata accessor for ExpanseUIModel.ButtonModel.CodingKeys()
{
  return &type metadata for ExpanseUIModel.ButtonModel.CodingKeys;
}

ValueMetadata *type metadata accessor for ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys()
{
  return &type metadata for ExpanseUIModel.BinaryButtonSnippetModel.CodingKeys;
}

uint64_t _s27SiriExpanseInternalUIPlugin14ExpanseUIModelO10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s27SiriExpanseInternalUIPlugin14ExpanseUIModelO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x9D68);
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

ValueMetadata *type metadata accessor for ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys()
{
  return &type metadata for ExpanseUIModel.AppStorePunchoutSnippetModel.CodingKeys;
}

unint64_t sub_9DA4()
{
  unint64_t result = qword_10AA0[0];
  if (!qword_10AA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10AA0);
  }
  return result;
}

unint64_t sub_9DFC()
{
  unint64_t result = qword_10CB0[0];
  if (!qword_10CB0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10CB0);
  }
  return result;
}

unint64_t sub_9E54()
{
  unint64_t result = qword_10EC0[0];
  if (!qword_10EC0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10EC0);
  }
  return result;
}

unint64_t sub_9EAC()
{
  unint64_t result = qword_110D0[0];
  if (!qword_110D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_110D0);
  }
  return result;
}

unint64_t sub_9F04()
{
  unint64_t result = qword_112E0[0];
  if (!qword_112E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_112E0);
  }
  return result;
}

unint64_t sub_9F5C()
{
  unint64_t result = qword_114F0;
  if (!qword_114F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_114F0);
  }
  return result;
}

unint64_t sub_9FB4()
{
  unint64_t result = qword_11600;
  if (!qword_11600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_11600);
  }
  return result;
}

unint64_t sub_A00C()
{
  unint64_t result = qword_11608[0];
  if (!qword_11608[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_11608);
  }
  return result;
}

unint64_t sub_A064()
{
  unint64_t result = qword_11690;
  if (!qword_11690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_11690);
  }
  return result;
}

unint64_t sub_A0BC()
{
  unint64_t result = qword_11698[0];
  if (!qword_11698[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_11698);
  }
  return result;
}

unint64_t sub_A114()
{
  unint64_t result = qword_11720;
  if (!qword_11720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_11720);
  }
  return result;
}

unint64_t sub_A16C()
{
  unint64_t result = qword_11728[0];
  if (!qword_11728[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_11728);
  }
  return result;
}

unint64_t sub_A1C4()
{
  unint64_t result = qword_117B0;
  if (!qword_117B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_117B0);
  }
  return result;
}

unint64_t sub_A21C()
{
  unint64_t result = qword_117B8[0];
  if (!qword_117B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_117B8);
  }
  return result;
}

unint64_t sub_A274()
{
  unint64_t result = qword_11840;
  if (!qword_11840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_11840);
  }
  return result;
}

unint64_t sub_A2CC()
{
  unint64_t result = qword_11848[0];
  if (!qword_11848[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_11848);
  }
  return result;
}

unint64_t sub_A324()
{
  unint64_t result = qword_118D0;
  if (!qword_118D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_118D0);
  }
  return result;
}

unint64_t sub_A37C()
{
  unint64_t result = qword_118D8[0];
  if (!qword_118D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_118D8);
  }
  return result;
}

uint64_t sub_A3D0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x614C6E6F74747562 && a2 == 0xEB000000006C6562;
  if (v2 || (sub_A970() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D614E707061 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_A970();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_A4DC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x427972616D697270 && a2 == 0xED00006E6F747475;
  if (v2 || (sub_A970() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7261646E6F636573 && a2 == 0xEF6E6F7474754279)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_A970();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_A618(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_A970() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000000000B660)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_A970();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_A700(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000000000B680 || (sub_A970() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x75427972616E6962 && a2 == 0xEC0000006E6F7474)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_A970();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_A820()
{
  return SnippetPluginModel.snippetHidden(for:idiom:)();
}

uint64_t sub_A830()
{
  return CodableAceObject.init(wrappedValue:)();
}

uint64_t sub_A840()
{
  return CodableAceObject.wrappedValue.modify();
}

uint64_t sub_A850()
{
  return CodableAceObject.wrappedValue.getter();
}

uint64_t sub_A860()
{
  return CodableAceObject.wrappedValue.setter();
}

uint64_t sub_A870()
{
  return Loggable.init(wrappedValue:)();
}

uint64_t sub_A880()
{
  return Loggable.wrappedValue.modify();
}

uint64_t sub_A890()
{
  return Loggable.wrappedValue.getter();
}

uint64_t sub_A8A0()
{
  return Loggable.wrappedValue.setter();
}

uint64_t sub_A8B0()
{
  return static Loggable<A>.== infix(_:_:)();
}

uint64_t sub_A8C0()
{
  return type metadata accessor for Loggable();
}

uint64_t sub_A8D0()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_A8E0()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_A8F0()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_A900()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_A910()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_A920()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_A930()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_A940()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_A950()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_A960()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_A970()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_A980()
{
  return Hasher.init(_seed:)();
}

void sub_A990(Swift::UInt a1)
{
}

Swift::Int sub_A9A0()
{
  return Hasher._finalize()();
}

uint64_t sub_A9B0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_A9C0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return _swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}